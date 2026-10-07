const genero = 7;

console.log("URL:", window.location.href);
console.log("Genero:", genero);

const container = document.getElementById("container-vinis");

let vinis = [];

async function carregarVinis() {

    try {

        const resposta = await fetch(`${window.API_BASE_URL}/vinis?genero=${genero}`);
        console.log("STATUS:", resposta.status);

        vinis = await resposta.json();

        container.innerHTML = "";

        vinis.forEach(vinil => {

            const card = document.createElement("div");
            card.classList.add("card-vinil");

            card.innerHTML = `
                <img src="${vinil.imagem}">
                <h3>${vinil.nome}</h3>
                <p>${vinil.artista}</p>
                <p>R$ ${vinil.preco}</p>

                <button class="btn-carrinho" onclick="adicionarCarrinho(${vinil.id})">Adicionar ao carrinho</button>
            `;

            container.appendChild(card);
        });

    } catch (erro) {
        console.log("ERRO:", erro);
    }
}

carregarVinis();

function adicionarCarrinho(id) {

    const vinil = vinis.find(v => v.id == id);

    let carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];

    carrinho.push(vinil);

    localStorage.setItem("carrinho", JSON.stringify(carrinho));

    mostrarToast(`${vinil.nome} foi adicionado ao carrinho!`);
}

function mostrarToast(mensagem){

    const toast = document.getElementById("toast");

    toast.textContent = mensagem;

    toast.classList.add("mostrar");

    setTimeout(() => {
        toast.classList.remove("mostrar");
    }, 2000);

}