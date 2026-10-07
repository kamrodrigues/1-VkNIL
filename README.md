# VkNIL 🎵

## 📌 Sobre o projeto

O VkNIL é um projeto fictício que consiste em uma curadoria de vinis desenvolvida como uma aplicação full stack, voltada para a exploração e organização de álbuns musicais em diferentes gêneros. Este foi o primeiro projeto full stack que desenvolvi, realizado como um projeto escolar. A plataforma permite que o usuário navegue por categorias musicais, como jazz, rock e outros estilos e vitrolas, visualizando uma seleção de produtos exclusivos e organizados.

Cada álbum apresentado contém informações detalhadas, incluindo nome do álbum, artista, capa, e preço, proporcionando uma experiência visual e informativa mais completa. Além disso, o sistema conta com funcionalidades de carrinho de compras, permitindo ao usuário adicionar e visualizar os itens selecionados de forma dinâmica.


### Front-end
- HTML
- CSS
- JavaScript

### Back-end
- Node.js
- Express (se estiver usando)
- PostgreSQL

## Funcionalidades

- Navegação por categorias musicais
- Exibição de álbuns com imagem, artista e preço
- Sistema de vitrolas (curadoria de vinis)
- Adição de itens ao carrinho de compras
- Visualização dinâmica do carrinho

## Banco de dados

O projeto utiliza PostgreSQL para armazenar e consultar informações sobre vinis, como álbuns, artistas, preços e categorias.

## Objetivo

O objetivo do VkNIL é simular uma plataforma de e-commerce de vinis, integrando front-end e back-end, com foco em organização de dados, experiência do usuário e consumo de API.

## Executar localmente com o Live Server

O Live Server serve as páginas e os arquivos estáticos; a API continua sendo executada pelo Express. Para usar os dois:

1. No terminal, entre na pasta `VkNIL` e execute `node server.js`. A API ficará disponível em `http://localhost:3000`.
2. No VS Code, abra `public/index.html` com o Live Server.
3. Mantenha os dois servidores em execução enquanto usar o site.

O front-end está configurado para consultar a API em `http://localhost:3000`. O Express permite essas chamadas durante o desenvolvimento a partir de origens locais como `http://127.0.0.1:5500` e `http://localhost:5500`.
