const jazzNacionalId = 4;
const jazzInternacionalId = 3;

const containerNacional = document.getElementById("jazz-nacional");
const containerInternacional = document.getElementById("jazz-internacional");

let vinis = [];

async function carregarJazz() {

    try {

        const [resNacional, resInternacional] = await Promise.all([
            fetch(`${window.API_BASE_URL}/vinis?genero=${jazzNacionalId}`),
            fetch(`${window.API_BASE_URL}/vinis?genero=${jazzInternacionalId}`)
        ]);

        const jazzNacional = await resNacional.json();
        const jazzInternacional = await resInternacional.json();

        vinis = [...jazzNacional, ...jazzInternacional];

        containerNacional.innerHTML = "";
        containerInternacional.innerHTML = "";

        jazzNacional.forEach(vinil => {

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

        jazzInternacional.forEach(vinil => {

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

carregarJazz();

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