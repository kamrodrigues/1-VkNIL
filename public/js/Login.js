function EntrarMenu() {
    let usuario = document.getElementById("inputUser").value.trim();
    let senha = document.getElementById("inputSenha").value.trim();

    let usuarioSalvo = localStorage.getItem("user");
    let senhaSalva = localStorage.getItem("senha");

    if (usuario === "" || senha === "") {
        alert("Usuário e senha precisam estar preenchidos!");
        return;
    }

    if (!usuarioSalvo || !senhaSalva) {
        alert("Usuário não encontrado, cadastre-se!");
        return;
    }

    if (usuario === usuarioSalvo && senha === senhaSalva) {
        alert("Login realizado com sucesso!");
        window.location.href = "pages/menu.html";
    } else {
        alert("Usuário ou senha incorretos!");
    }
}

function Cadastro() {
    window.location.href = "pages/cadastro.html";
}