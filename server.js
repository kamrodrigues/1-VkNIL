require("dotenv").config();

const path = require("path");
const express = require("express");
const { Pool } = require("pg");

const app = express();

const hasDatabaseConfig = () =>
    Boolean(
        process.env.DB_USER &&
        process.env.DB_HOST &&
        process.env.DB_NAME &&
        process.env.DB_PASSWORD &&
        process.env.DB_PORT
    );

const pool = hasDatabaseConfig()
    ? new Pool({
        user: process.env.DB_USER,
        host: process.env.DB_HOST,
        database: process.env.DB_NAME,
        password: process.env.DB_PASSWORD,
        port: process.env.DB_PORT
    })
    : null;

const fallbackVitrolas = [
    { id: 1, nome: "Victrola Clássica", marca: "Vinyl Pro", preco: 899.9, imagem: "assets/img/vitrolas1.gif" },
    { id: 2, nome: "Stereo Vintage", marca: "Retro Sound", preco: 1249.9, imagem: "assets/img/vitrolas1.gif" },
    { id: 3, nome: "Player Deluxe", marca: "Groove House", preco: 1599.9, imagem: "assets/img/vitrolas1.gif" }
];

const fallbackVinis = [
    { id: 1, nome: "The Wall", artista: "Pink Floyd", preco: 199.9, imagem: "assets/img/vinis/Rock Internacional/Pink Floyd - The Wall.jpg", genero_id: 1 },
    { id: 2, nome: "Nevermind", artista: "Nirvana", preco: 219.9, imagem: "assets/img/vinis/Rock Internacional/Nirvana - Nevermind.jpg", genero_id: 1 },
    { id: 3, nome: "Kind of Blue", artista: "Miles Davis", preco: 229.9, imagem: "assets/img/vinis/Jazz Internacional/Kind of Blue - Miles Davis.jpg", genero_id: 3 },
    { id: 4, nome: "Wave", artista: "Antônio Carlos Jobim", preco: 179.9, imagem: "assets/img/vinis/Jazz Nacional/Wave - Antônio Carlos Jobim.jpg", genero_id: 4 },
    { id: 5, nome: "Clair de Lune", artista: "Claude Debussy", preco: 189.9, imagem: "assets/img/vinis/Classica/Clair de Lune - Claude Debussy.jpg", genero_id: 5 },
    { id: 6, nome: "Construção", artista: "Chico Buarque", preco: 205.5, imagem: "assets/img/vinis/MPB/Construção - Chico Buarque.jpg", genero_id: 6 },
    { id: 7, nome: "Cartola", artista: "Cartola", preco: 185.0, imagem: "assets/img/vinis/Samba/Cartola - Cartola.jpg", genero_id: 7 }
];

const fallbackCriticos = [
    { id: 1, nome: "Luiza Costa", album: "The Wall", artista: "Pink Floyd", imagem: "assets/img/criticos/The Dark Side of the Moon.jpg", preco: 199.9 },
    { id: 2, nome: "João Ribeiro", album: "Kind of Blue", artista: "Miles Davis", imagem: "assets/img/criticos/Invincible - Michael Jackson.jpg", preco: 229.9 },
    { id: 3, nome: "Marina Souza", album: "Clair de Lune", artista: "Claude Debussy", imagem: "assets/img/criticos/Thriller - Michael Jackson.jpg", preco: 189.9 }
];

const PORT = process.env.PORT || 3000;

const isLocalFrontendOrigin = (origin) => {
    try {
        const url = new URL(origin);
        return url.protocol === "http:" && ["localhost", "127.0.0.1"].includes(url.hostname);
    } catch {
        return false;
    }
};

const queryWithFallback = async (tableName, fallbackRows, query, values = []) => {
    if (!pool) {
        return fallbackRows;
    }

    try {
        const result = await pool.query(query, values);
        return result.rows;
    } catch (error) {
        console.warn(`Usando dados locais para ${tableName}:`, error.message);
        return fallbackRows;
    }
};

const normalizeImagePaths = (rows) =>
    rows.map((row) => {
        if (typeof row.imagem !== "string" || !row.imagem.trim()) {
            return row;
        }

        const relativePath = row.imagem
            .replace(/\\/g, "/")
            .replace(/^\/+/, "")
            .replace(/^assets\//, "")
            .replace("Beatles - Abber Road.jpg", "Beatles - Abbey Road.jpg");

        return {
            ...row,
            imagem: `/assets/${relativePath.split("/").map(encodeURIComponent).join("/")}`
        };
    });

app.use(express.json());
app.use((req, res, next) => {
    const origin = req.get("Origin");

    if (origin && isLocalFrontendOrigin(origin)) {
        res.setHeader("Access-Control-Allow-Origin", origin);
        res.setHeader("Access-Control-Allow-Methods", "GET, OPTIONS");
        res.setHeader("Access-Control-Allow-Headers", "Content-Type");
        res.setHeader("Vary", "Origin");
    }

    if (req.method === "OPTIONS") {
        return res.sendStatus(204);
    }

    next();
});
app.use(express.static("public"));

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "public", "index.html"));
});

app.get("/vitrolas", async (req, res) => {
    const rows = await queryWithFallback("vitrolas", fallbackVitrolas, "SELECT * FROM vitrolas");
    res.json(normalizeImagePaths(rows));
});

app.get("/vinis", async (req, res) => {
    const { genero } = req.query;

    let rows = await queryWithFallback("vinis", fallbackVinis, "SELECT * FROM vinis");

    if (genero) {
        rows = rows.filter((vinil) => Number(vinil.genero_id) === Number(genero));
    }

    res.json(normalizeImagePaths(rows));
});

app.get("/criticos", async (req, res) => {
    const rows = await queryWithFallback("criticos", fallbackCriticos, "SELECT * FROM criticos");
    res.json(normalizeImagePaths(rows));
});

app.listen(PORT, () => {
    console.log(`Servidor rodando em http://localhost:${PORT}`);
});