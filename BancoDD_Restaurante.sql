CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Cardapio (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    nome_item VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    categoria ENUM('Entrada', 'Sobremesa', 'Prato Principal') NOT NULL
);

CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_hora_pedido DATETIME NOT NULL,
    status_pedido ENUM('Preparo', 'Entrega', 'Entregue') NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Pedido_Item (
    id_pedido_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_item INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_item) REFERENCES Cardapio(id_item)
);

CREATE TABLE Reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_hora_reserva DATETIME NOT NULL,
    numero_pessoas INT NOT NULL,
    status_reserva ENUM('Confirmada', 'Pendente', 'Cancelada') NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
