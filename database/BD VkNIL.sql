CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    vip BOOLEAN DEFAULT FALSE
);

CREATE TABLE generos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE vinis (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(300) NOT NULL,
    artista VARCHAR(300) NOT NULL,
    genero_id INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    imagem VARCHAR(300) NOT NULL,
	
    FOREIGN KEY (genero_id)
    REFERENCES generos(id)
);

CREATE TABLE vitrolas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(300) NOT NULL,
    marca VARCHAR(200) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    imagem VARCHAR(300) NOT NULL
);

CREATE TABLE criticos (
    id SERIAL PRIMARY KEY,
	nome VARCHAR (50) NOT NULL,
	album VARCHAR (200) NOT NULL,
	artista VARCHAR(200) NOT NULL,
	imagem VARCHAR(300) NOT NULL,
     preco DECIMAL(10,2) NOT NULL
);

INSERT INTO generos (id, nome)
VALUES
(1, 'Rock Internacional'),
(2, 'Rock Nacional'),
(3, 'Jazz Internacional'),
(4, 'Jazz Nacional'),
(5, 'Música Clássica'),
(6, 'MPB'),
(7, 'Samba');

--ROCK INT.
INSERT INTO vinis (id, nome, artista, genero_id, preco,imagem)
VALUES
(1, 'Highway to Hell', 'AC/DC', 1, 149.90, 'img/vinis/Rock Internacional/AC-DC - Highway to hell.jpg'),
(2, 'Whatever People Say I Am, Thats What Im Not', 'Arctic Monkeys', 1, 169.90, 'img/vinis/Rock Internacional/Arctic Monkeys - Whatever People Say I Am, Thats What Im Not.jpg'),
(3, 'Abbey Road', 'The Beatles', 1, 249.90, 'img/vinis/Rock Internacional/Beatles - Abbey Road.jpg'),
(4, 'Slippery When Wet', 'Bon Jovi', 1, 199.90, 'img/vinis/Rock Internacional/Bon Jovi - Slippery When Wet.jpg'),
(5, 'The Colour And The Shape', 'Foo Fighters', 1, 159.90, 'img/vinis/Rock Internacional/Foo Fighters - The Colour And The Shape.jpg'),
(6, 'Use Your Illusion I', 'Guns N'' Roses', 1, 179.90, 'img/vinis/Rock Internacional/Guns n Roses - Use your Illusion I.jpg'),
(7, 'Led Zeppelin IV', 'Led Zeppelin', 1, 259.90, 'img/vinis/Rock Internacional/Led Zeppelin - Led Zeppelin (Remaster).jpg'),
(8, '...And Justice For All', 'Metallica', 1, 229.90, 'img/vinis/Rock Internacional/Metallica - And justice for all.jpg'),
(9, 'Nevermind', 'Nirvana', 1, 219.90, 'img/vinis/Rock Internacional/Nirvana - Nevermind.jpg'),
(10, 'Ten', 'Pearl Jam', 1, 219.90, 'img/vinis/Rock Internacional/Pearl Jam - Ten.jpg'),
(11, 'The Wall', 'Pink Floyd', 1, 269.90, 'img/vinis/Rock Internacional/Pink Floyd - The Wall.jpg'),
(12, 'Pablo Honey', 'Radiohead', 1, 149.90, 'img/vinis/Rock Internacional/RadioHead - Pablo honey.jpg'),
(13, 'Californication', 'Red Hot Chili Peppers', 1, 229.90, 'img/vinis/Rock Internacional/Red hot chili peppers - Californication.jpg'),
(14, 'Toxicity', 'System Of A Down', 1, 189.90, 'img/vinis/Rock Internacional/System of a down - Toxicity.jpg'),
(15, 'Abbey Road', 'The Beatles', 1, 499.90, 'img/vinis/Rock Internacional/Beatles - Abber Road.jpg'),
(16, 'Nevermind', 'Nirvana', 1, 399.90, 'img/vinis/Rock Internacional/Nirvana - Nevermind.jpg'),
(17, 'The Wall', 'Pink Floyd', 1, 299.90, 'img/vinis/Rock Internacional/Pink Floyd - The Wall.jpg');

--ROCK NAC.
INSERT INTO vinis (id, nome, artista, genero_id, preco,imagem)
VALUES 
(18, 'Rosas e Vinho Tinto', 'Capital Inicial', 2, 149.90, 'img/vinis/Rock Nacional/Capital Inicial - Rosas e Vinho Tinto.jpg'),
(19, 'Exagerado', 'Cazuza', 2, 169.90, 'img/vinis/Rock Nacional/Cazuza - Exagerado.jpg'),
(20, 'Camisa 10 Joga Bola Até na Chuva', 'Charlie Brown', 2, 279.90, 'img/vinis/Rock Nacional/Charlie Brown Júnior - Camisa 10 Joga Bola Até na Chuva.jpg'),
(21, 'A Revolta dos Dandis', 'Engenheiros do Hawaii', 2, 179.90, 'img/vinis/Rock Nacional/Engenheiros do Hawaii - A Revolta dos Dandis.jpg'),
(22, 'Educação Sentimental', 'Kid Abelha', 2, 139.90, 'img/vinis/Rock Nacional/Kid Abelha - Educação Sentimental.jpg'),
(23, 'Dois', 'Legião Urbana', 2, 299.90, 'img/vinis/Rock Nacional/Legião Urbana - Dois.jpg'),
(24, 'A Divina Comédia ou Ando Meio Desligado', 'Os Mutantes', 2, 249.90, 'img/vinis/Rock Nacional/Os Mutantes - A Divina Comédia ou Ando Meio Desligado.jpg'),
(25, 'O Passo de Lui', 'Os Paralamas do Sucesso', 2, 179.90, 'img/vinis/Rock Nacional/Os Paralarmas do sucesso - O Passo do Lui.jpg'),
(26, 'Admirável Chip Novo', 'Pitty', 2, 189.90,'img/vinis/Rock Nacional/Pitty - Admirável Chip Novo.jpg'),
(27, 'Só no Forévis', 'Raimundos', 2, 169.90, 'img/vinis/Rock Nacional/Raimundos - Só no Forévis.jpg'),
(28, 'A Melhor Banda de Todos os Tempos da Última Semana', 'Titãs', 2, 159.90, 'img/vinis/Rock Nacional/Titãs - A Melhor Banda de Todos os  Tempos da Última Semana.jpg'),
(29, 'Cosmotron', 'Skank', 2, 149.90, 'img/vinis/Rock Nacional/Cosmotron - Skank.jpg');

--JAZZ INT.
INSERT INTO vinis (id, nome, artista, genero_id, preco, imagem)
VALUES
(30, 'A Love Supreme', 'John Coltrane', 3, 239.90, 'img/vinis/Jazz Internacional/A Love Supreme - John Coltrane.jpg'),
(31, 'Birth of the Cool', 'Miles Davis', 3, 199.90, 'img/vinis/Jazz Internacional/Birth of the Cool - Miles Davis.jpg'),
(32, 'Bitches Brew', 'Miles Davis', 3, 289.90, 'img/vinis/Jazz Internacional/Bitches Brew - Miles Davis.jpg'),
(33, 'Blue Train', 'John Coltrane', 3, 229.90, 'img/vinis/Jazz Internacional/Blue Train - John Coltrane.jpg'),
(34, 'Chet Baker Sings', 'Chet Baker', 3, 189.90, 'img/vinis/Jazz Internacional/Chet Baker Sings - Chet Baker.jpg'),
(35, 'Ella and Louis', 'Ella Fitzgerald & Louis Armstrong', 3, 219.90, 'img/vinis/Jazz Internacional/Ella and Louis - Ella Fitzgerald & Louis Armstrong.jpg'),
(36, 'Getz/Gilberto', 'Stan Getz & João Gilberto', 3, 249.90, 'img/vinis/Jazz Internacional/Getz/Gilberto - Stan Getz & João Gilberto.jpg'),
(37, 'Head Hunters', 'Herbie Hancock', 3, 209.90, 'img/vinis/Jazz Internacional/Head Hunters - Herbie Hancock.jpg'),
(38, 'Heavy Weather', 'Weather Report', 3, 219.90, 'img/vinis/Jazz Internacional/Heavy Weather - Weather Report.jpg'),
(39, 'Kind of Blue', 'Miles Davis', 3, 259.90, 'img/vinis/Jazz Internacional/Kind of Blue - Miles Davis.jpg'),
(40, 'Mingus Ah Um', 'Charles Mingus', 3, 199.90, 'img/vinis/Jazz Internacional/Mingus Ah Um - Charles Mingus.jpg'),
(41, 'Moanin''', 'Art Blakey & The Jazz Messengers', 3, 229.90, 'img/vinis/Jazz Internacional/Moanin - Art Blakey & The Jazz Messengers.jpg'),
(42, 'Saxophone Colossus', 'Sonny Rollins', 3, 209.90, 'img/vinis/Jazz Internacional/Saxophone Colossus - Sonny Rollins.jpg'),
(43, 'Somethin'' Else', 'Cannonball Adderley', 3, 239.90, 'img/vinis/Jazz Internacional/Somethin Else - Cannonball Adderley.jpg'),
(44, 'Speak No Evil', 'Wayne Shorter', 3, 219.90, 'img/vinis/Jazz Internacional/Speak No Evil - Wayne Shorter.jpg'),
(45, 'The Köln Concert', 'Keith Jarrett', 3, 269.90, 'img/vinis/Jazz Internacional/The Köln Concert - Keith Jarrett.jpg'),
(46, 'The Shape of Jazz to Come', 'Ornette Coleman', 3, 199.90, 'img/vinis/Jazz Internacional/The Shape of Jazz to Come - Ornette Coleman.jpg'),
(47, 'Time Out', 'The Dave Brubeck Quartet', 3, 229.90, 'img/vinis/Jazz Internacional/Time Out - The Dave Brubeck Quartet.jpg');

--JAZZ NAC.
INSERT INTO vinis (id, nome, artista, genero_id, preco, imagem)
VALUES
(48, 'Amazonas', 'João Donato', 4, 189.90, 'img/vinis/Jazz Nacional/Amazonas - João Donato.jpg'),
(49, 'Chega de Saudade', 'João Gilberto', 4, 239.90, 'img/vinis/Jazz Nacional/Chega de Saudade - João Gilberto.jpg'),
(50, 'Coisas', 'Moacir Santos', 4, 219.90, 'img/vinis/Jazz Nacional/Coisas - Moacir Santos.jpg'),
(51, 'Dança das Cabeças', 'Egberto Gismonti', 4, 249.90, 'img/vinis/Jazz Nacional/Dança das Cabeças - Egberto Gismonti.jpg'),
(52, 'João Gilberto', 'João Gilberto', 4, 199.90, 'img/vinis/Jazz Nacional/João Gilberto - João Gilberto.jpg'),
(53, 'O Amor, o Sorriso e a Flor', 'João Gilberto', 4, 229.90, 'img/vinis/Jazz Nacional/O Amor, o Sorriso e a Flor - João Gilberto.jpg'),
(54, 'Stone Flower', 'Antônio Carlos Jobim', 4, 259.90, 'img/vinis/Jazz Nacional/Stone Flower - Antônio Carlos Jobim.jpg'),
(55, 'Tamba Trio', 'Tamba Trio', 4, 179.90, 'img/vinis/Jazz Nacional/Tamba Trio - Tamba Trio.jpg'),
(56, 'The Composer of Desafinado, Plays', 'Antônio Carlos Jobim', 4, 239.90, 'img/vinis/Jazz Nacional/The Composer of Desafinado, Plays - Antônio Carlos Jobim.jpg'),
(57, 'Wave', 'Antônio Carlos Jobim', 4, 269.90, 'img/vinis/Jazz Nacional/Wave - Antônio Carlos Jobim.jpg');

--CLASSICA
INSERT INTO vinis (id, nome, artista, genero_id, preco, imagem)
VALUES
(58, 'Adagio for Strings', 'Samuel Barber', 5, 189.90, 'img/vinis/Classica/Adagio for Strings - Samuel Barber.jpg'),
(59, 'Boléro', 'Maurice Ravel', 5, 199.90, 'img/vinis/Classica/Boléro - Maurice Ravel.jpg'),
(60, 'Brandenburg Concertos', 'Johann Sebastian Bach', 5, 249.90, 'img/vinis/Classica/Brandenburg Concertos - Johann Sebastian Bach.jpg'),
(61, 'Canon in D', 'Johann Pachelbel', 5, 169.90, 'img/vinis/Classica/Canon in D - Johann Pachelbel.jpg'),
(62, 'Carmen Suite', 'Georges Bizet', 5, 189.90, 'img/vinis/Classica/Carmen Suite - Georges Bizet.jpg'),
(63, 'Clair de Lune', 'Claude Debussy', 5, 179.90, 'img/vinis/Classica/Clair de Lune - Claude Debussy.jpg'),
(64, 'Eine kleine Nachtmusik', 'Wolfgang Amadeus Mozart', 5, 199.90, 'img/vinis/Classica/Eine kleine Nachtmusik - Wolfgang Amadeus Mozart.jpg'),
(65, 'Hungarian Rhapsodies', 'Franz Liszt', 5, 209.90, 'img/vinis/Classica/Hungarian Rhapsodies - Franz Liszt.jpg'),
(66, 'Moonlight Sonata', 'Ludwig van Beethoven', 5, 229.90, 'img/vinis/Classica/Moonlight Sonata - Ludwig van Beethoven.jpg'),
(67, 'Nocturnes', 'Frédéric Chopin', 5, 189.90, 'img/vinis/Classica/Nocturnes - Frédéric Chopin.jpg'),
(68, 'Peer Gynt Suites', 'Edvard Grieg', 5, 199.90, 'img/vinis/Classica/Peer Gynt Suites - Edvard Grieg.jpg'),
(69, 'Requiem', 'Wolfgang Amadeus Mozart', 5, 239.90, 'img/vinis/Classica/Requiem - Wolfgang Amadeus Mozart.jpg'),
(70, 'Swan Lake', 'Pyotr Ilyich Tchaikovsky', 5, 219.90, 'img/vinis/Classica/Swan Lake - Pyotr Ilyich Tchaikovsky.jpg'),
(71, 'Symphony No. 5', 'Ludwig van Beethoven', 5, 229.90, 'img/vinis/Classica/Symphony No. 5 - Ludwig van Beethoven.jpg'),
(72, 'Symphony No. 6 “Pathétique”', 'Pyotr Ilyich Tchaikovsky', 5, 249.90, 'img/vinis/Classica/Symphony No. 6 “Pathétique” - Pyotr Ilyich Tchaikovsky.jpg'),
(73, 'Symphony No. 9 “From the New World”', 'Antonín Dvořák', 5, 259.90, 'img/vinis/Classica/Symphony No. 9 “From the New World” - Antonín Dvořák.jpg'),
(74, 'The Four Seasons', 'Antonio Vivaldi', 5, 239.90, 'img/vinis/Classica/The Four Seasons - Antonio Vivaldi.jpg'),
(75, 'The Nutcracker', 'Pyotr Ilyich Tchaikovsky', 5, 219.90, 'img/vinis/Classica/The Nutcracker - Pyotr Ilyich Tchaikovsky.jpg'),
(76, 'The Planets', 'Gustav Holst', 5, 229.90, 'img/vinis/Classica/The Planets - Gustav Holst.jpg'),
(77, 'Water Music', 'George Frideric Handel', 5, 199.90, 'img/vinis/Classica/Water Music - George Frideric Handel.jpg');

--MPB
INSERT INTO vinis (id, nome, artista, genero_id, preco, imagem)
VALUES
(78, 'A Tábua de Esmeralda', 'Jorge Ben Jor', 6, 249.90, 'img/vinis/MPB/A Tábua de Esmeralda - Jorge Ben Jor.jpg'),
(79, 'Acabou Chorare', 'Novos Baianos', 6, 239.90, 'img/vinis/MPB/Acabou Chorare - Novos Baianos.jpg'),
(80, 'Alucinação', 'Belchior', 6, 219.90, 'img/vinis/MPB/Alucinação - Belchior.jpg'),
(81, 'Caça à Raposa', 'João Bosco', 6, 199.90, 'img/vinis/MPB/Caça à Raposa - João Bosco.jpg'),
(82, 'Cantar', 'Gal Costa', 6, 189.90, 'img/vinis/MPB/Cantar - Gal Costa.jpg'),
(83, 'Clara Crocodilo', 'Arrigo Barnabé', 6, 209.90, 'img/vinis/MPB/Clara Crocodilo - Arrigo Barnabé.jpg'),
(84, 'Clube da Esquina', 'Milton Nascimento & Lô Borges', 6, 269.90, 'img/vinis/MPB/Clube da Esquina - Milton Nascimento & Lô Borges.jpg'),
(85, 'Construção', 'Chico Buarque', 6, 259.90, 'img/vinis/MPB/Construção - Chico Buarque.jpg'),
(86, 'Elis', 'Elis Regina', 6, 189.90, 'img/vinis/MPB/Elis - Elis Regina.jpg'),
(87, 'Elis & Tom', 'Elis Regina & Antônio Carlos Jobim', 6, 279.90, 'img/vinis/MPB/Elis & Tom - Elis Regina & Antônio Carlos Jobim.jpg'),
(88, 'Expresso 2222', 'Gilberto Gil', 6, 229.90, 'img/vinis/MPB/Expresso 2222 - Gilberto Gil.jpg'),
(89, 'Feito em Casa', 'João Donato', 6, 179.90, 'img/vinis/MPB/Feito em Casa - João Donato.jpg'),
(90, 'Gal Canta Caymmi', 'Gal Costa', 6, 219.90, 'img/vinis/MPB/Gal Canta Caymmi - Gal Costa.jpg'),
(91, 'Joia', 'Caetano Veloso', 6, 199.90, 'img/vinis/MPB/Joia - Caetano Veloso.jpg'),
(92, 'Meus Caros Amigos', 'Chico Buarque', 6, 239.90, 'img/vinis/MPB/Meus Caros Amigos - Chico Buarque.jpg'),
(93, 'Milagre dos Peixes', 'Milton Nascimento', 6, 249.90, 'img/vinis/MPB/Milagre dos Peixes - Milton Nascimento.jpg'),
(94, 'Nervos de Aço', 'Paulinho da Viola', 6, 189.90, 'img/vinis/MPB/Nervos de Aço - Paulinho da Viola.jpg'),
(95, 'Refazenda', 'Gilberto Gil', 6, 229.90, 'img/vinis/MPB/Refazenda - Gilberto Gil.jpg'),
(96, 'Sinal Fechado', 'Chico Buarque', 6, 209.90, 'img/vinis/MPB/Sinal Fechado - Chico Buarque.jpg'),
(97, 'Transa', 'Caetano Veloso', 6, 259.90, 'img/vinis/MPB/Transa - Caetano Veloso.jpg');

--SAMBA
INSERT INTO vinis (id, nome, artista, genero_id, preco, imagem)
VALUES
(98, 'Alvorecer', 'Clara Nunes', 7, 219.90, 'img/vinis/Samba/Alvorecer - Clara Nunes.jpg'),
(99, 'As Forças da Natureza', 'Clara Nunes', 7, 229.90, 'img/vinis/Samba/As Forças da Natureza - Clara Nunes.jpg'),
(100, 'Beth Carvalho', 'Beth Carvalho', 7, 189.90, 'img/vinis/Samba/Beth Carvalho - Beth Carvalho.jpg'),
(101, 'Canta Canta Minha Gente', 'Martinho da Vila', 7, 209.90, 'img/vinis/Samba/Canta Canta Minha Gente - Martinho da Vila.jpg'),
(102, 'Canto dos Escravos', 'Clementina de Jesus, Tia Doca e Geraldo Filme', 7, 249.90, 'img/vinis/Samba/Canto dos Escravos - Clementina de Jesus, Tia Doca e Geraldo Filme.jpg'),
(103, 'Cartola', 'Cartola', 7, 199.90, 'img/vinis/Samba/Cartola - Cartola.jpg'),
(104, 'Cartola II', 'Cartola', 7, 219.90, 'img/vinis/Samba/Cartola II - Cartola.jpg'),
(105, 'Clara Nunes', 'Clara Nunes', 7, 189.90, 'img/vinis/Samba/Clara Nunes - Clara Nunes.jpg'),
(106, 'De Pé no Chão', 'Beth Carvalho', 7, 209.90, 'img/vinis/Samba/De Pé no Chão - Beth Carvalho.jpg'),
(107, 'Foi um Rio que Passou em Minha Vida', 'Paulinho da Viola', 7, 239.90, 'img/vinis/Samba/Foi um Rio que Passou em Minha Vida - Paulinho da Viola.jpg'),
(108, 'Kizomba, Festa da Raça', 'Martinho da Vila', 7, 229.90, 'img/vinis/Samba/Kizomba, Festa da Raça - Martinho da Vila.jpg'),
(109, 'Mundo Melhor', 'Beth Carvalho', 7, 199.90, 'img/vinis/Samba/Mundo Melhor - Beth Carvalho.jpg'),
(110, 'Nelson Cavaquinho', 'Nelson Cavaquinho', 7, 219.90, 'img/vinis/Samba/Nelson Cavaquinho - Nelson Cavaquinho.jpg'),
(111, 'Paulinho da Viola', 'Paulinho da Viola', 7, 189.90, 'img/vinis/Samba/Paulinho da Viola - Paulinho da Viola.jpg'),
(112, 'Pérola Negra', 'Luiz Melodia', 7, 229.90, 'img/vinis/Samba/Pérola Negra - Luiz Melodia.jpg'),
(113, 'Samba na Madrugada', 'Martinho da Vila', 7, 209.90, 'img/vinis/Samba/Samba na Madrugada - Martinho da Vila.jpg'),
(114, 'Zicartola', 'Vários Artistas', 7, 249.90, 'img/vinis/Samba/Zicartola - Vários Artistas.jpg');


INSERT INTO vitrolas (id, nome, marca, preco, imagem)
VALUES
(1, 'Vitrola Retro Pulse Davis', 'Pulse', 479.20, 'img/vitrolas/Vitrola Retro Pulse Davis.jpg'),
(2, 'Vitrola Raveo Studio Ebony', 'Ebony', 650.07, 'img/vitrolas/Vitrola Raveo Studio Ebony.jpg'),
(3, 'Vitrola Raveo Sonetto Chrome', 'Raveo', 445.00, 'img/vitrolas/Vitrola Raveo Sonetto Chrome.jpg'),
(4, 'Vitrola Toca Discos Audifólio com Braço de Fibra de Carbono e Seleção Eletrônica de Velocidade', 'Eletiq', 990.61, 'img/vitrolas/Vitrola Toca Discos Audifólio com Braço de Fibra de Carbono e Seleção Eletrônica de Velocidade.jpg'),
(5, 'Toca Discos Bluetooth Spinner BT JBL', 'JBL', 941.42, 'img/vitrolas/Toca Discos Bluetooth Spinner BT JBL.jpg');

INSERT INTO criticos (id, nome, album, artista, imagem, preco) 
VALUES
(1, 'Arthur', 'The Dark Side of the Moon','Pink Floyd', 'img/criticos/The Dark Side of the Moon.jpg', 500.00),
(2, 'Fernanda', 'Luan City', 'Luan Santana', 'img/criticos/Luan City.jpg', 199.90),
(3, 'Olivia', 'Azul', 'Zimbra', 'img/criticos/Azul - Zimbra.jpg', 399.90),
(4, 'Sofia', 'Up All Night', 'One Direction', 'img/criticos/Up All Night - One Direction.jpg', 299.90),
(5, 'Yasmim', 'Sour', 'Olivia Rodrigo', 'img/criticos/Sour - Olivia Rodrigo.jpg', 199.90),
(6, 'Maria', 'Dark Blood', 'Enhypen', 'img/criticos/Dark Blood - Enhypen.jpg', 299.90),
(7, 'Rebeca', 'Millennium', 'Backstreet Boys', 'img/criticos/Millenium - Backstreet Boys.jpg', 249.90),
(8, 'Amanda Lana', 'Thriller', 'Michael Jackson', 'img/criticos/Thriller - Michael Jackson.jpg', 450.99),
(9, 'Maiara', 'Evolve', 'Imagine Dragons', 'img/criticos/Evolve - Imagine Dragons.jpg', 199.90),
(10, 'Shellen', 'Era Óbvio', 'Marisa Monte', 'img/criticos/Era Óbvio - Marisa Monte.jpg', 399.90),
(11, 'Lívia', 'NOEASY', 'Stray Kids', 'img/criticos/NOEASY - Stray Kids.jpg', 250.99),
(12, 'Bel', 'Invincible', 'Michael Jackson', 'img/criticos/Invincible - Michael Jackson.jpg', 399.90),
(13, 'Bianca', 'Rush!', 'Maneskin', 'img/criticos/Rush! - Maneskin.jpg', 299.90);