const wrapper = document.querySelector(".wrapper");
const loginLink = document.querySelector(".login-link");
const registerLink = document.querySelector(".register-link");
registerLink?.addEventListener("click", (e) => {
    e.preventDefault();
    if (wrapper)
        wrapper.classList.add("active");
    console.log("Passage au formulaire d'inscription");
});
loginLink?.addEventListener("click", (e) => {
    e.preventDefault();
    if (wrapper)
        wrapper.classList.remove("active");
    console.log("Retour au formulaire de connexion");
});
export {};