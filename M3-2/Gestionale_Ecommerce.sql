use gestionaledb;

/*Create table prodotti*/
CREATE TABLE prodotti (
    id_prodotto INT PRIMARY KEY AUTO_INCREMENT,
    nome_prodotto VARCHAR(20),
    prezzo float(30)
);

/*insert into table prodotti*/
INSERT INTO prodotti ( nome_prodotto, prezzo) VALUES
( 'Tablet', 300.00),
( 'Mouse', 20.00),
( 'Tastiera', 25.00),
( 'Monitor', 180.00),
( 'HDD', 90.00),
( 'SSD', 200.00),
( 'RAM', 100.00),
( 'Router', 80.00),
( 'Webcam', 45.00),
( 'GPU', 1250.00),
( 'Trackpad', 500.00),
( 'Techmagazine', 5.00),
( 'Martech', 50.00);

/*Create table clienti*/
CREATE TABLE clienti (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20),
    email VARCHAR(50)
);

/*insert into table prodotti*/
INSERT INTO clienti ( nome, email) VALUES
( 'Antonio', ''),
( 'Battista', 'battista@mailmail.it'),
( 'Maria', 'maria@posta.it'),
( 'Franca', 'franca@lettere.it'),
( 'Ettore', ''),
( 'Arianna', 'arianna@posta.it'),
( 'Piero', 'piero@lavoro.it');

/*Create table ordini*/
CREATE TABLE ordini (
    id_ordine INT PRIMARY KEY AUTO_INCREMENT,
    id_prodotto int,
    id_cliente int,
    quantità int,
     FOREIGN KEY (id_prodotto)
        REFERENCES prodotti (id_prodotto)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_cliente)
        REFERENCES clienti (id_cliente)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO ordini ( id_prodotto,id_cliente, quantità) VALUES
( 2,1, 10),
( 6,2, 2),
( 5,3, 3),
( 1,4, 1),
( 9,5, 1),
( 4,6, 2),
( 11,7, 6),
( 10,2, 2),
( 3,3, 3),
( 3,4, 1),
( 2,2, 1);

/*Create table dettaglio_ordine*/
CREATE TABLE dettaglio_ordine (
    id_ordine int,
    id_prodotto int,
    id_cliente int,
    prezzo_totale float,
    PRIMARY KEY (id_ordine, id_prodotto, id_cliente),
     FOREIGN KEY (id_ordine)
        REFERENCES ordini (id_ordine)
        ON DELETE RESTRICT ON UPDATE CASCADE,
     FOREIGN KEY (id_prodotto)
        REFERENCES prodotti (id_prodotto)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_cliente)
        REFERENCES clienti (id_cliente)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

/*insert into table dettaglio_ordine*/
INSERT INTO dettaglio_ordine (id_ordine, id_prodotto, id_cliente, prezzo_totale) SELECT
ord.id_ordine,
ord.id_prodotto,
ord.id_cliente,
prd.prezzo * ord.quantità as prezzo_totale
FROM ordini ord JOIN prodotti prd ON ord.id_prodotto = prd.id_prodotto




