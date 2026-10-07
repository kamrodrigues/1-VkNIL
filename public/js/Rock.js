const rockNacionalId = 2;
const rockInternacionalId = 1;

const containerNacional = document.getElementById("rock-nacional");
const containerInternacional = document.getElementById("rock-internacional");

let vinis = [];

async function carregarRock() {

    try {

        const [resNacional, resInternacional] = await Promise.all([
            fetch(`${window.API_BASE_URL}/vinis?genero=${rockNacionalId}`),
            fetch(`${window.API_BASE_URL}/vinis?genero=${rockInternacionalId}`)
        ]);

        const rockNacional = await resNacional.json();
        const rockInternacional = await resInternacional.json();

        vinis = [...rockNacional, ...rockInternacional];

        containerNacional.innerHTML = "";
        containerInternacional.innerHTML = "";

        rockNacional.forEach(vinil => {

            const card = document.createElement("div");
            card.classList.add("card-vinil");

            card.innerHTML = `
                <img src="${vinil.imagem}">
                <h3>${vinil.nome}</h3>
                <p>${vinil.artista}</p>
                <p>R$ ${vinil.preco}</p>
                <button class="btn-carrinho" onclick="adicionarCarrinho(${vinil.id})">Adicionar ao carrinho</button>
            `;

            containerNacional.appendChild(card);
        });

        rockInternacional.forEach(vinil => {

            const card = document.createElement("div");
            card.classList.add("card-vinil");

            card.innerHTML = `
                <img src="${vinil.imagem}">
                <h3>${vinil.nome}</h3>
                <p>${vinil.artista}</p>
                <p>R$ ${vinil.preco}</p>
                <button class="btn-carrinho" onclick="adicionarCarrinho(${vinil.id})">Adicionar ao carrinho</button>
            `;

            containerInternacional.appendChild(card);
        });

    } catch (erro) {
        console.log("ERRO:", erro);
    }
}

carregarRock();

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