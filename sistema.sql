CREATE TABLE Categorias (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE Fornecedores (
    fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(50),
    endereco VARCHAR(150),
    cidade VARCHAR(50)
);

CREATE TABLE Produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    categoria_id INT,
    fornecedor_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedores(fornecedor_id)
);
    CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    cpf VARCHAR(14) NOT NULL,
    endereco VARCHAR(150),
    cidade VARCHAR(50)
);

CREATE TABLE Funcionarios (
    funcionario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    data_contratacao DATE,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    cliente_id INT,
    funcionario_id INT,
    status VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (funcionario_id) REFERENCES Funcionarios(funcionario_id)
);

CREATE TABLE Itens_Pedido (
    item_pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

CREATE TABLE Pagamentos (
    pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    valor DECIMAL(10, 2) NOT NULL,
    metodo_pagamento VARCHAR(50),
    data_pagamento DATE NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id)
);

INSERT INTO Categorias (categoria_id, nome, descricao) VALUES
    (1, 'Smartphones', 'Dispositivos móveis inteligentes'),
    (2, 'Notebooks', 'Computadores portáteis'),
    (3, 'Periféricos', 'Dispositivos de entrada e saída'),
    (4, 'Monitores', 'Telas de exibição'),
    (5, 'Impressoras', 'Dispositivos de impressão'),
    (6, 'Áudio', 'Dispositivos de áudio'),
    (7, 'Armazenamento', 'Dispositivos de armazenamento de dados'),
    (8, 'Componentes', 'Componentes de hardware'),
    (9, 'Móveis', 'Móveis para escritório'),
    (10, 'Redes', 'Dispositivos de rede'),
    (11, 'Acessórios', 'Acessórios diversos');

INSERT INTO Fornecedores (fornecedor_id, nome, contato, endereco, cidade) VALUES
    (1, 'Samsung', 'contato@samsung.com', 'Rua Samsung, 100', 'São Paulo'),
    (2, 'Dell', 'contato@dell.com', 'Avenida Dell, 200', 'Rio de Janeiro'),
    (3, 'Logitech', 'contato@logitech.com', 'Praça Logitech, 300', 'Curitiba'),
    (4, 'Razer', 'contato@razer.com', 'Rua Razer, 400', 'Porto Alegre'),
    (5, 'LG', 'contato@lg.com', 'Avenida LG, 500', 'Belo Horizonte'),
    (6, 'HP', 'contato@hp.com', 'Rua HP, 600', 'Brasília'),
    (7, 'Sony', 'contato@sony.com', 'Avenida Sony, 700', 'Fortaleza'),
    (8, 'Apple', 'contato@apple.com', 'Praça Apple, 800', 'Recife'),
    (9, 'Kingston', 'contato@kingston.com', 'Rua Kingston, 900', 'Salvador'),
    (10, 'NVIDIA', 'contato@nvidia.com', 'Avenida NVIDIA, 1000', 'Manaus'),
    (11, 'DXRacer', 'contato@dxracer.com', 'Rua DXRacer, 1100', 'Florianópolis'),
    (12, 'TP-Link', 'contato@tplink.com', 'Avenida TP-Link, 1200', 'Goiânia'),
    (13, 'Seagate', 'contato@seagate.com', 'Praça Seagate, 1300', 'Natal'),
    (14, 'Corsair', 'contato@corsair.com', 'Rua Corsair, 1400', 'João Pessoa');

INSERT INTO Produtos (nome, descricao, preco, estoque, categoria_id, fornecedor_id) VALUES
    ('Smartphone Samsung Galaxy S21', 'Tela de 6.2", 128GB, 8GB RAM, Câmera Tripla', 3999.99, 18, 1, 1),
    ('Notebook Dell Inspiron 15', 'Intel Core i7, 16GB RAM, 512GB SSD, Tela 15.6"', 5499.99, 5, 2, 2),
    ('Mouse Logitech MX Master 3', '4000 dpi, 12 cm, Conexão Bluetooth', 299.99, 25, 3, 3),
    ('Teclado Mecânico Razer BlackWidow', 'Switches Mecânicos, RGB, ABNT2', 699.99, 8, 3, 4),
    ('Monitor LG Ultrawide 29"', 'Resolução 2560x1080, IPS, 75Hz', 1299.99, 12, 4, 5),
    ('Impressora HP LaserJet Pro', 'Impressão a Laser, Wi-Fi, Duplex', 899.99, 3, 5, 6),
    ('Fone de Ouvido Sony WH-1000XM4', 'Cancelamento de Ruído, Bluetooth, 30h de Bateria', 1499.99, 20, 6, 7),
    ('Tablet Apple iPad Air', 'Tela de 10.9", 64GB, Wi-Fi', 4299.99, 7, 1, 8),
    ('SSD Kingston A2000', '1TB, NVMe, Leitura 2200MB/s', 799.99, 15, 7, 9),
    ('Placa de Vídeo NVIDIA RTX 3060', '12GB GDDR6, Ray Tracing, PCIe 4.0', 3499.99, 4, 8, 10),
    ('Cadeira Gamer DXRacer', 'Ergonômica, Reclinável, Suporta até 150kg', 1199.99, 6, 9, 11),
    ('Roteador TP-Link Archer AX50', 'Wi-Fi 6, Dual Band, 3000Mbps', 499.99, 18, 10, 12),
    ('HD Externo Seagate 2TB', 'USB 3.0, Portátil, Preto', 399.99, 22, 7, 13),
    ('Webcam Logitech C920', 'Full HD 1080p, Microfone Embutido', 349.99, 9, 3, 3),
    ('Fonte Corsair 650W', '80 Plus Bronze, Modular, ATX', 499.99, 11, 8, 14);

INSERT INTO Clientes (nome, email, telefone, cpf, endereco, cidade) VALUES
    ('João Silva', 'joao.silva@example.com', '(11) 98765-4321', '123.456.789-00', 'Rua das Flores, 123', 'São Paulo'),
    ('Maria Oliveira', 'maria.oliveira@example.com', '(21) 99876-5432', '234.567.890-11', 'Avenida Brasil, 456', 'Rio de Janeiro'),
    ('Pedro Santos', 'pedro.santos@example.com', '(31) 91234-5678', '345.678.901-22', 'Praça da Liberdade, 789', 'Belo Horizonte'),
    ('Ana Costa', 'ana.costa@example.com', '(41) 92345-6789', '456.789.012-33', 'Rua XV de Novembro, 101', 'Curitiba'),
    ('Carlos Pereira', 'carlos.pereira@example.com', '(51) 93456-7890', '567.890.123-44', 'Avenida Ipiranga, 202', 'Porto Alegre'),
    ('Fernanda Lima', 'fernanda.lima@example.com', '(61) 94567-8901', '678.901.234-55', 'Esplanada dos Ministérios, 303', 'Brasília'),
    ('Lucas Almeida', 'lucas.almeida@example.com', '(71) 95678-9012', '789.012.345-66', 'Rua Chile, 404', 'Salvador'),
    ('Juliana Rodrigues', 'juliana.rodrigues@example.com', '(81) 96789-0123', '890.123.456-77', 'Avenida Boa Viagem, 505', 'Recife'),
    ('Rafael Souza', 'rafael.souza@example.com', '(91) 97890-1234', '901.234.567-88', 'Rua dos Mundurucus, 606', 'Belém'),
    ('Patrícia Fernandes', 'patricia.fernandes@example.com', '(85) 98901-2345', '012.345.678-99', 'Avenida Beira Mar, 707', 'Fortaleza');

INSERT INTO Funcionarios (nome, cargo, salario, data_contratacao, email, telefone) VALUES
    ('João da Silva', 'Vendedor', 2500.00, '2020-01-15', 'joao.silva@empresa.com', '(11) 98765-4321'),
    ('Maria Oliveira', 'Gerente', 4500.00, '2018-03-22', 'maria.oliveira@empresa.com', '(21) 99876-5432'),
    ('Pedro Santos', 'Caixa', 2000.00, '2019-07-10', 'pedro.santos@empresa.com', '(31) 91234-5678'),
    ('Ana Costa', 'Atendente', 2200.00, '2021-05-05', 'ana.costa@empresa.com', '(41) 92345-6789'),
    ('Carlos Pereira', 'Supervisor', 3500.00, '2017-11-30', 'carlos.pereira@empresa.com', '(51) 93456-7890');

INSERT INTO Pedidos (data_pedido, cliente_id, funcionario_id, status) VALUES
    ('2024-10-25', 1, 1, 'Concluído'),
    ('2024-11-01', 2, 2, 'Em andamento'),
    ('2024-11-05', 3, 3, 'Concluído'),
    ('2024-11-10', 4, 4, 'Em andamento'),
    ('2024-11-15', 5, 5, 'Concluído'),
    ('2023-02-05', 6, 1, 'Em andamento'),
    ('2023-02-10', 7, 2, 'Concluído'),
    ('2023-02-15', 8, 3, 'Em andamento'),
    ('2023-02-20', 9, 4, 'Concluído'),
    ('2023-02-25', 10, 5, 'Em andamento');

INSERT INTO Itens_Pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
    (1, 1, 5, 3999.99),
    (1, 3, 10, 299.99),
    (2, 2, 1, 5499.99),
    (2, 4, 7, 699.99),
    (3, 5, 6, 1299.99),
    (3, 6, 1, 899.99),
    (4, 7, 8, 1499.99),
    (4, 8, 1, 4299.99),
    (5, 9, 10, 799.99),
    (5, 10, 4, 3499.99),
    (6, 11, 6, 1199.99),
    (6, 12, 7, 499.99),
    (7, 13, 8, 399.99),
    (7, 14, 5, 349.99),
    (8, 15, 6, 499.99),
    (8, 1, 7, 3999.99),
    (9, 2, 5, 5499.99),
    (9, 3, 9, 299.99),
    (10, 4, 6, 699.99),
    (10, 5, 7, 1299.99);

INSERT INTO Pagamentos (pedido_id, valor, metodo_pagamento, data_pagamento) VALUES
    (1, 19999.95, 'Cartão de Crédito', '2024-10-26'),
    (2, 5499.99, 'Boleto', '2024-11-02'),
    (3, 7799.94, 'Transferência Bancária', '2024-11-06'),
    (5, 7999.90, 'Boleto', '2024-11-16'),
    (6, 7199.94, 'Transferência Bancária', '2023-02-06'),
    (7, 3199.92, 'Cartão de Crédito', '2023-02-11'),
    (8, 2999.94, 'Boleto', '2023-02-16'),
    (9, 27499.95, 'Transferência Bancária', '2023-02-21');
-- Professor, nesse ponto usei a categoria "Smartphones", porque quase todos os produtos do meu sistema fictício são eletrônicos, mas a lógica é a mesma.

UPDATE Produtos
SET preco = preco * 1.10
WHERE categoria_id in (SELECT categoria_id FROM Categorias WHERE nome = 'Smartphones');


UPDATE Produtos
SET preco = preco * 0.95
WHERE estoque > 20;

UPDATE Produtos
SET preco = preco * 0.85
WHERE fornecedor_id in (SELECT fornecedor_id FROM Fornecedores WHERE nome = 'Logitech');

UPDATE Clientes
SET endereco = 'Novo Endereço, 456',
    telefone = '(51) 91234-5678'
WHERE cliente_id = 5;

UPDATE Funcionarios
SET cargo = 'Gerente',
    salario = salario * 1.20
WHERE funcionario_id = 3;

UPDATE Pedidos
SET status = 'Concluído'
WHERE pedido_id IN (SELECT pedido_id FROM Pagamentos);

--Professor aqui tinham algumas soluções mais sofisticadas, como criar uma tabela pra ser um log das alterações, porém eu preferi fazer o mais simples que é, apenas para exercitar a lógica, alterar para o preço normal os produtos que eu diminuí antes.

UPDATE Produtos
--preço / 0.85 pra reverter pra o valor original
SET preco = preco / 0.85
WHERE fornecedor_id in (SELECT fornecedor_id FROM Fornecedores WHERE nome = 'Logitech');

-- Pega o valor que está no estoque e diminue a quantidade que tem na tabela item_pedido onde o id do produto é o id desse produto e o status do pedido é 'Concluído'. Além disso ele verifica, com uma query muito parecids, se esse produto de fato teve alguma venda concluída.

UPDATE Produtos
SET estoque = estoque - (
    SELECT SUM(ip.quantidade)
    FROM Itens_Pedido ip
    WHERE ip.produto_id = Produtos.produto_id AND ip.pedido_id IN (
        SELECT pe.pedido_id
        FROM Pedidos pe
        WHERE pe.status = 'Concluído'
    )
)
WHERE produto_id IN (
    SELECT ip.produto_id
    FROM Itens_Pedido ip
    WHERE ip.pedido_id IN (
        SELECT pe.pedido_id
        FROM Pedidos pe
        WHERE pe.status = 'Concluído'
    )
);

UPDATE Fornecedores
SET endereco = 'Novo Endereço, 789',
    contato = '(21) 98765-4321'
WHERE fornecedor_id = 2;

-- Atualizar o estoque do produto vinculado ao item_pedido_id = 3 para 35
UPDATE Produtos
SET estoque = 35
WHERE produto_id = (SELECT produto_id FROM Itens_Pedido WHERE item_pedido_id = 3);

-- Atualizar a quantidade do item de pedido específico
UPDATE Itens_Pedido
SET quantidade = 10
WHERE item_pedido_id = 3;

SELECT p.nome AS produto, p.descricao, p.preco, p.estoque, c.nome AS categoria, f.nome AS fornecedor
FROM Produtos p
JOIN Categorias c ON p.categoria_id = c.categoria_id
JOIN Fornecedores f ON p.fornecedor_id = f.fornecedor_id
WHERE p.estoque > 10;

SELECT c.nome AS cliente, p.data_pedido, f.nome AS funcionario, p.status
FROM Pedidos p
JOIN Clientes c ON p.cliente_id = c.cliente_id
JOIN Funcionarios f ON p.funcionario_id = f.funcionario_id
WHERE c.nome = 'João Silva' AND p.data_pedido BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE();


/*
retorna uma lista de produtos que tiveram vendas superiores a 5 unidades.
Para cada produto, a consulta exibe o nome do produto e a quantidade
total vendida. A consulta combina dados das tabelas Itens_Pedido
e Produtos, agrupa os resultados pelo nome do produto
e filtra para exibir apenas os produtos que atenderam 
ao critério de vendas superiores a 5 unidades.
*/
SELECT p.nome AS produto, SUM(ip.quantidade) AS quantidade_total_vendida
FROM Itens_Pedido ip
JOIN Produtos p ON ip.produto_id = p.produto_id
GROUP BY p.nome
HAVING SUM(ip.quantidade) > 5;

SELECT p.pedido_id, SUM(p.valor) AS valor_total, p.metodo_pagamento, p.data_pagamento
FROM Pagamentos p
WHERE p.data_pagamento BETWEEN CURDATE() - INTERVAL 60 DAY AND CURDATE()
GROUP BY p.pedido_id, p.metodo_pagamento, p.data_pagamento;

-- aqui eu usei 5000 pq 100 é mt pouco, mas a lógica é a mesma
SELECT p.pedido_id, p.data_pedido, p.cliente_id, p.funcionario_id, p.status
FROM Pedidos p
JOIN Itens_Pedido ip ON p.pedido_id = ip.pedido_id
LEFT JOIN Pagamentos pg ON p.pedido_id = pg.pedido_id
WHERE p.status = 'Em andamento' OR pg.pedido_id IS NULL
GROUP BY p.pedido_id, p.data_pedido, p.cliente_id, p.funcionario_id, p.status
HAVING SUM(ip.quantidade * ip.preco_unitario) > 5000;

SELECT p.nome AS produto, p.estoque, p.preco, f.nome AS fornecedor
FROM Produtos p
JOIN Fornecedores f ON p.fornecedor_id = f.fornecedor_id
WHERE p.estoque < 5
ORDER BY p.nome;

--Mesma lógica, usei 15000 pq 500 é mt pouco
SELECT c.nome AS cliente, SUM(ip.quantidade * ip.preco_unitario) AS valor_total_gasto
FROM Clientes c
JOIN Pedidos p ON c.cliente_id = p.cliente_id
JOIN Itens_Pedido ip ON p.pedido_id = ip.pedido_id
GROUP BY c.nome
HAVING SUM(ip.quantidade * ip.preco_unitario) > 15000;

SELECT DATE_FORMAT(p.data_pedido, '%Y-%m') AS mes, SUM(ip.quantidade * ip.preco_unitario) AS valor_total
FROM Pedidos p
JOIN Itens_Pedido ip ON p.pedido_id = ip.pedido_id
GROUP BY DATE_FORMAT(p.data_pedido, '%Y-%m')
HAVING SUM(ip.quantidade * ip.preco_unitario) > 1000;


SELECT p.nome AS produto, c.nome AS categoria
FROM Produtos p
JOIN Categorias c ON p.categoria_id = c.categoria_id
WHERE p.produto_id NOT IN (
    SELECT DISTINCT ip.produto_id
    FROM Itens_Pedido ip
    JOIN Pedidos pe ON ip.pedido_id = pe.pedido_id
    WHERE pe.data_pedido BETWEEN CURDATE() - INTERVAL 90 DAY AND CURDATE()
)
ORDER BY p.nome;

-- usei 1 para o resultado ser mais dinâmico
SELECT f.cargo, COUNT(*) AS quantidade_funcionarios
FROM Funcionarios f
GROUP BY f.cargo
HAVING COUNT(*) > 1;

-- usei 0 pelo mesmo motivo das queries anteriores
SELECT c.nome AS cliente, f.nome AS funcionario, COUNT(p.pedido_id) AS total_pedidos
FROM Clientes c
JOIN Pedidos p ON c.cliente_id = p.cliente_id
JOIN Funcionarios f ON p.funcionario_id = f.funcionario_id
GROUP BY c.nome, f.nome
HAVING COUNT(p.pedido_id) > 0;

SELECT p.nome AS produto, ip.quantidade, ip.preco_unitario, pe.data_pedido
FROM Itens_Pedido ip
JOIN Produtos p ON ip.produto_id = p.produto_id
JOIN Pedidos pe ON ip.pedido_id = pe.pedido_id
JOIN Clientes c ON pe.cliente_id = c.cliente_id
WHERE c.nome = 'João Silva' AND pe.data_pedido BETWEEN CURDATE() - INTERVAL 1 YEAR AND CURDATE()
ORDER BY pe.data_pedido;

SELECT p.nome AS produto, SUM(ip.quantidade * ip.preco_unitario) AS receita_total
FROM Itens_Pedido ip
JOIN Produtos p ON ip.produto_id = p.produto_id
GROUP BY p.nome
ORDER BY receita_total DESC
LIMIT 1;

-- Adicionar coluna desconto na tabela Produtos
ALTER TABLE Produtos
ADD COLUMN desconto DECIMAL(5, 2) DEFAULT 0.00;

-- Adicionar coluna cpf na tabela Funcionarios
ALTER TABLE Funcionarios
ADD COLUMN cpf VARCHAR(14);

-- Adicionar coluna data_fabricacao na tabela Produtos
ALTER TABLE Produtos
ADD COLUMN data_fabricacao DATE;

-- Adicionar coluna data_nascimento na tabela Clientes
ALTER TABLE Clientes
ADD COLUMN data_nascimento DATE;

-- Adicionar coluna website na tabela Fornecedores
ALTER TABLE Fornecedores
ADD COLUMN website VARCHAR(100);

-- Adicionar coluna tipo na tabela Categorias
ALTER TABLE Categorias
ADD COLUMN tipo VARCHAR(50);

-- Adicionar coluna observacoes na tabela Pedidos
ALTER TABLE Pedidos
ADD COLUMN observacoes TEXT;

-- Adicionar coluna data_envio na tabela Itens_Pedido
ALTER TABLE Itens_Pedido
ADD COLUMN data_envio DATE;

-- Adicionar coluna status_pagamento na tabela Pagamentos
ALTER TABLE Pagamentos
ADD COLUMN status_pagamento VARCHAR(20);