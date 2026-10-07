function CadastroFeito() {
    let email = document.getElementById("inputEmail").value.trim();
    let user = document.getElementById("inputNovoUser").value.trim();
    let senha = document.getElementById("inputNovaSenha").value.trim();

    if (!email || !user || !senha) {
        alert("Todos os campos devem estar preenchidos!!");
        return;
    }

    let emailRegex = /^[a-zA-Z0-9._%+-]+@(gmail|hotmail|yahoo|outlook)\.com$/;
    if (!emailRegex.test(email)) {
        alert("O email deve ser preenchido corretamente");
        return;
    }

    if (user.length > 10) {
        alert("O usuário deve ter no máximo 10 caracteres!");
        return;
    }

    let senhaRegex = /^[0-9]{6}$/;
    if (!senhaRegex.test(senha)) {
        alert("A senha deve ter até 6 dígitos numéricos!");
        return;
    }

    localStorage.setItem("email", email);
    localStorage.setItem("user", user);
    localStorage.setItem("senha", senha);

    alert("Cadastro realizado com sucesso!");
    window.location.href = "../index.html";
}