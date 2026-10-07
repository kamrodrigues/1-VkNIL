function navegarPara(destino) {
    window.location.href = destino;
}

function VaiproMenu() {
    navegarPara("menu.html");
}

function irParaGenero() {
    const select = document.getElementById("Genero");
    if (select && select.value !== "") {
        navegarPara(select.value);
    }
}

function Vitrolas() {
    navegarPara("Vitrolas.html");
}

function VerVinis() {
    navegarPara("verVinis.html");
}

function VerVitrolas() {
    navegarPara("Vitrolas.html");
}

function finalizarcompra() {
    navegarPara("FinalizarCompra.html");
}

function abrirCarrinho() {
    const carrinho = document.getElementById("carrinho");
    if (!carrinho) return;

    carregarCarrinho();
    carrinho.classList.add("aberto");
}

function fecharCarrinho() {
    const carrinho = document.getElementById("carrinho");
    if (carrinho) {
        carrinho.classList.remove("aberto");
    }
}

function carregarCarrinho() {
    const carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
    const container = document.getElementById("itensCarrinho");
    const total = document.getElementById("totalCarrinho");

    if (!container || !total) return;

    container.innerHTML = "";

    let soma = 0;

    carrinho.forEach((produto) => {
        soma += Number(produto.preco || 0);

        container.innerHTML += `
            <div class="item-carrinho">
                <img src="${produto.imagem || ""}" alt="${produto.nome || produto.album || "Produto"}">
                <div>
                    <h4>${produto.nome || produto.album}</h4>
                    <p>R$ ${Number(produto.preco || 0).toFixed(2)}</p>
                </div>
            </div>
        `;
    });

    total.textContent = `Total: R$ ${soma.toFixed(2)}`;
}

function esvaziarCarrinho() {
    localStorage.removeItem("carrinho");
    carregarCarrinho();
    alert("Carrinho esvaziado!");
}

let criticos = [];

async function carregarCriticos() {
    try {
        const resposta = await fetch(`${window.API_BASE_URL}/criticos`);
        if (!resposta.ok) {
            throw new Error("Falha ao carregar críticos");
        }

        criticos = await resposta.json();

        const tbody = document.getElementById("lista-criticos");
        if (!tbody) return;

        tbody.innerHTML = "";

        criticos.forEach((c) => {
            tbody.innerHTML += `
                <tr>
                    <td>${c.nome}</td>

                    <td class="album-cell">
                        <img src="${c.imagem}" alt="${c.album}">
                        <div>
                            <strong>${c.album}</strong><br>
                            R$ ${Number(c.preco).toFixed(2)}
                        </div>
                    </td>

                    <td>${c.artista}</td>

                    <td>
                        <button class="btn-carrinho" onclick="adicionarCarrinho(${c.id})">
                            Adicionar ao carrinho
                        </button>
                    </td>
                </tr>
            `;
        });

    } catch (err) {
        console.error("Erro ao carregar críticos:", err);
    }
}

function adicionarCarrinho(id) {
    const item = criticos.find((c) => c.id == id);
    if (!item) return;

    const carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
    carrinho.push(item);

    localStorage.setItem("carrinho", JSON.stringify(carrinho));
    mostrarToast(`${item.album} foi adicionado ao carrinho!`);
}

function mostrarToast(mensagem) {
    let toast = document.getElementById("toast");

    if (!toast) {
        toast = document.createElement("div");
        toast.id = "toast";
        toast.className = "toast";
        document.body.appendChild(toast);
    }

    toast.textContent = mensagem;
    toast.classList.add("mostrar");

    setTimeout(() => {
        toast.classList.remove("mostrar");
    }, 2000);
}

const imagenscarrossel = [
    "../assets/img/carrossel1.jpg",
    "../assets/img/carrossel2.jpg",
    "../assets/img/carrossel3.jpg"
];

let i = 0;

function mostrar() {
    const img = document.getElementById("slide");
    if (img) img.src = imagenscarrossel[i];
}

function avancar() {
    i = (i + 1) % imagenscarrossel.length;
    mostrar();
}

function voltar() {
    i = (i - 1 + imagenscarrossel.length) % imagenscarrossel.length;
    mostrar();
}