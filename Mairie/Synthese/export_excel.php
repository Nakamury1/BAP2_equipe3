<?php
require '../../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// Configuration de la connexion à la base de données
$host = 'localhost';
$dbname = 'beta';
$username = 'root';
$password = '';

try {
    // Établir la connexion PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Requête pour récupérer les données de synthèse
    $query = "
    SELECT 
        u.identifiant,
        m.date_menu,
        m.valeur_element,
        p.nb_repasprevus,
        p.nb_repasconsommes,
        p.nb_repasconsommesadultes,
        p.pesee_restes,
        v.grande_faim,
        v.petite_faim,
        v.aime,
        v.aime_moyen,
        v.aime_pas
    FROM 
        menu m
    LEFT JOIN 
        pesee p ON m.date_menu = p.date_menu
    LEFT JOIN 
        vote v ON m.date_menu = v.date_menu
    LEFT JOIN 
        users u ON v.identifiant = u.identifiant
    ORDER BY 
        u.identifiant ASC,
        m.date_menu DESC
    ";

    $stmt = $pdo->prepare($query);
    $stmt->execute();

    // Récupérer les résultats
    $resultats = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Créer un nouveau tableur
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();

    // En-têtes
    $headers = [
        'A' => 'Identifiant',
        'B' => 'Date Menu',
        'C' => 'Élément voté',
        'D' => 'Repas Prévus',
        'E' => 'Repas Consommés',
        'F' => 'Repas Consommés Adultes',
        'G' => 'Restes (kg)',
        'H' => 'Grande Faim',
        'I' => 'Petite Faim',
        'J' => 'Aime',
        'K' => 'Aime Moyen',
        'L' => 'N\'Aime Pas'
    ];

    // Ajouter les en-têtes
    foreach ($headers as $col => $header) {
        $sheet->setCellValue($col . '1', $header);
    }

    // Ajouter les données
    $rowIndex = 2;
    foreach ($resultats as $ligne) {
        $sheet->setCellValue('A' . $rowIndex, $ligne['identifiant'] ?? 'N/A');
        $sheet->setCellValue('B' . $rowIndex, $ligne['date_menu'] ?? 'N/A');
        $sheet->setCellValue('C' . $rowIndex, $ligne['valeur_element'] ?? 'N/A');
        $sheet->setCellValue('D' . $rowIndex, $ligne['nb_repasprevus'] ?? 'N/A');
        $sheet->setCellValue('E' . $rowIndex, $ligne['nb_repasconsommes'] ?? 'N/A');
        $sheet->setCellValue('F' . $rowIndex, $ligne['nb_repasconsommesadultes'] ?? 'N/A');
        $sheet->setCellValue('G' . $rowIndex, $ligne['pesee_restes'] ?? 'N/A');
        $sheet->setCellValue('H' . $rowIndex, $ligne['grande_faim'] ?? 'N/A');
        $sheet->setCellValue('I' . $rowIndex, $ligne['petite_faim'] ?? 'N/A');
        $sheet->setCellValue('J' . $rowIndex, $ligne['aime'] ?? 'N/A');
        $sheet->setCellValue('K' . $rowIndex, $ligne['aime_moyen'] ?? 'N/A');
        $sheet->setCellValue('L' . $rowIndex, $ligne['aime_pas'] ?? 'N/A');
        
        $rowIndex++;
    }

    // Définir les en-têtes pour le téléchargement
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="synthese_donnees.xlsx"');
    header('Cache-Control: max-age=0');

    // Créer le fichier Excel
    $writer = new Xlsx($spreadsheet);
    $writer->save('php://output');
    exit;

} catch(PDOException $e) {
    // Gestion des erreurs
    die("Erreur : " . $e->getMessage());
}
?>