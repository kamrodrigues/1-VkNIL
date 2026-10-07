let vinis = [];

function navegarPara(destino) {
    window.location.href = destino;
}

async function carregarVinis() {
    try {
        const resposta = await fetch(`${window.API_BASE_URL}/vinis`);
        if (!resposta.ok) {
            throw new Error("Falha ao carregar vinis");
        }

        vinis = await resposta.json();

        const lista = document.getElementById("lista-vinis");
        if (!lista) return;

        lista.innerHTML = "";

        vinis.forEach((vinil) => {
            lista.innerHTML += `
                <div class="card-vinil">
                    <img src="${vinil.imagem}" alt="${vinil.nome}">
                    <div class="infos">
                        <h2>${vinil.nome}</h2>
                        <p class="artista">${vinil.artista}</p>
                        <p class="preco">R$ ${Number(vinil.preco).toFixed(2)}</p>
                        <button class="btn-carrinho" onclick="adicionarCarrinho(${vinil.id})">Adicionar ao carrinho</button>
                    </div>
                </div>
            `;
        });

        atualizarQtdCarrinho();
    } catch (error) {
        console.error("Erro ao carregar vinis:", error);
    }
}

carregarVinis();

function adicionarCarrinho(id) {
    const vinil = vinis.find((v) => v.id == id);
    if (!vinil) return;

    const carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
    carrinho.push(vinil);

    localStorage.setItem("carrinho", JSON.stringify(carrinho));
    atualizarQtdCarrinho();
    mostrarToast(`${vinil.nome} foi adicionado ao carrinho!`);
}

function atualizarQtdCarrinho() {
    const carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
    const qtd = document.getElementById("qtd-carrinho");
    if (qtd) qtd.textContent = carrinho.length;
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
    setTimeout(() => toast.classList.remove("mostrar"), 2000);
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
                <img src="${produto.imagem || ""}" alt="${produto.nome || "Produto"}">
                <div>
                    <h4>${produto.nome}</h4>
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
    atualizarQtdCarrinho();
}

function finalizarcompra() {
    navegarPara("FinalizarCompra.html");
}

function MPB() { navegarPara("MPB.html"); }
function Jazz() { navegarPara("Jazz.html"); }
function Rock() { navegarPara("Rock.html"); }
function Classica() { navegarPara("Classica.html"); }
function Samba() { navegarPara("Samba.html"); }