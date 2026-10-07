let vitrolas = [];

// =========================
// CARREGAR VITROLAS
// =========================
async function carregarVitrolas() {
    const container = document.getElementById("container-vitrolas"); 

    try {
        const resposta = await fetch(`${window.API_BASE_URL}/vitrolas`);

        console.log("STATUS:", resposta.status);

        if (!resposta.ok) {
            throw new Error("Erro ao buscar vitrolas");
        }

        const dados = await resposta.json();
        console.log(dados);

        vitrolas = dados;

        container.innerHTML = "";

        dados.forEach(v => {
            container.innerHTML += `
                <div class="card-vitrola">
                    <img src="/${encodeURI(v.imagem)}" alt="${v.nome}">

                    <h2>${v.nome}</h2>

                    <p class="marca">${v.marca}</p>

                    <p class="preco">R$ ${Number(v.preco).toFixed(2)}</p>

                    <button class="btn-carrinho" onclick="adicionarCarrinho(${v.id})">
                        Adicionar ao carrinho
                    </button>
                </div>
            `;
        });

    } catch (error) {
        console.error("Erro ao carregar vitrolas:", error);
        container.innerHTML = "<p>Erro ao carregar vitrolas.</p>";
    }
}

carregarVitrolas();


// =========================
// CARRINHO
// =========================
function adicionarCarrinho(id) {
    const vitrola = vitrolas.find(v => v.id == id);

    if (!vitrola) return;

    let carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];

    carrinho.push(vitrola);

    localStorage.setItem("carrinho", JSON.stringify(carrinho));

    mostrarToast(`${vitrola.nome} foi adicionado ao carrinho!`);
}


// =========================
// TOAST
// =========================
function mostrarToast(mensagem) {
    const toast = document.getElementById("toast");

    toast.textContent = mensagem;
    toast.classList.add("mostrar");

    setTimeout(() => {
        toast.classList.remove("mostrar");
    }, 2000);
}