const carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];

const container = document.getElementById("itens");
const totalEl = document.getElementById("total");
const mensagem = document.getElementById("mensagem");

function carregarResumo() {
    if (!container || !totalEl) return;

    container.innerHTML = "";

    let total = 0;

    carrinho.forEach((produto) => {
        total += Number(produto.preco || 0);

        container.innerHTML += `
            <div class="item">
                <img src="${produto.imagem}" class="img-produto" alt="${produto.nome}">

                <div class="info-produto">
                  <p>${produto.nome}</p>
                  <p>R$ ${Number(produto.preco || 0).toFixed(2)}</p>
                </div>
            </div>
        `;
    });

    totalEl.textContent = `Total: R$ ${total.toFixed(2)}`;
}

carregarResumo();

function finalizarCompra() {
    const nomeInput = document.getElementById("nome");
    const enderecoInput = document.getElementById("endereco");
    const pagamento = document.querySelector('input[name="pagamento"]:checked');

    if (!nomeInput || !enderecoInput || !mensagem) {
        return;
    }

    const nome = nomeInput.value.trim();
    const endereco = enderecoInput.value.trim();

    if (!nome || !endereco || !pagamento) {
        mensagem.textContent = "Preencha todos os campos!";
        mensagem.style.color = "red";
        return;
    }

    localStorage.removeItem("carrinho");

    mensagem.textContent = "Compra realizada com sucesso! 🎉";
    mensagem.style.color = "green";

    if (container) container.innerHTML = "";
    if (totalEl) totalEl.textContent = "";
}