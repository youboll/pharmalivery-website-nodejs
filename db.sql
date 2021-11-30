-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Nov-2021 às 22:16
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pharma`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `Cpf` varchar(14) NOT NULL,
  `Logradouro` varchar(50) DEFAULT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `bairro` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `senha` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`Cpf`, `Logradouro`, `Nome`, `Email`, `cidade`, `bairro`, `estado`, `celular`, `senha`) VALUES
('000.000.000-00', 'Rua', 'teste', 'blabla@gmail.com', 'Cdiade', 'bairro', 'AC', '(11) 5565-11511', '16d4074e1a1f081538a09b801586da6881e547def93e643e4bac5195d9ef14ecb45d636f34c7cd166408de6cb2ed987d3e53212e3ad12a597cac49e5b64197ab'),
('111.111.111-11', 'RUa', 'pedroADMIN', 'pedro@admin.com', 'Bernardino', 'JARDIM', 'SP', '(00) 0000-00000', '16d4074e1a1f081538a09b801586da6881e547def93e643e4bac5195d9ef14ecb45d636f34c7cd166408de6cb2ed987d3e53212e3ad12a597cac49e5b64197ab'),
('cpf', 'logradouro', 'nome', 'email', 'cidade', 'bairro', 'estado', 'celular', 'senha');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador`
--

CREATE TABLE `entregador` (
  `nome` varchar(60) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `senha` char(128) NOT NULL,
  `email` varchar(35) NOT NULL,
  `telefone` varchar(18) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `bairro` varchar(35) NOT NULL,
  `cidade` varchar(35) NOT NULL,
  `estado` varchar(35) NOT NULL,
  `cep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entregador`
--

INSERT INTO `entregador` (`nome`, `cpf`, `senha`, `email`, `telefone`, `logradouro`, `numero`, `bairro`, `cidade`, `estado`, `cep`) VALUES
('pedroAdmin', '222.222.222-22', 'd9e6762dd1c8eaf6d61b3c6192fc408d4d6d5f1176d0c29169bc24e71c3f274ad27fcd5811b313d681f7e55ec02d73d499c95455b6b5bb503acf574fba8ffe85', 'pedro@admin.com', '(00) 0000-00000', 'AV', '2323', '232323', '2323', 'AC', '23232-323'),
('5t5t5t', '5t5.t5', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'pedro@admin.com', '(55) 4444-44444', 'gtg', 'gtgtg', 'tgtg', 'tggtg', 'CE', '-');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `cod_produto` char(10) NOT NULL,
  `nome_produto` char(10) DEFAULT NULL,
  `validade` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto_produto`
--

CREATE TABLE `foto_produto` (
  `cod` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `foto_produto`
--

INSERT INTO `foto_produto` (`cod`, `id_produto`, `foto`) VALUES
(11, 37, 'http://localhost//pharmalivery/252Variação Linguística.pdf'),
(12, 47, 'http://localhost//pharmalivery/411WhatsApp Image 2021-09-25 at 10.41.28.jpeg'),
(13, 59, '/pedro/projects/pharmalivery-website-nodejs/static/fotos/742WhatsApp Image 2021-09-25 at 10.41.28.jp'),
(14, 60, '/fotos/56libekrdade canto.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE `loja` (
  `nome_fantasia` varchar(25) NOT NULL,
  `nota` float DEFAULT 0 COMMENT 'Classificacao da loja',
  `cnpj` varchar(18) NOT NULL,
  `senha` varchar(128) NOT NULL,
  `insc_estadual` varchar(15) NOT NULL,
  `site` varchar(35) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `bairro` varchar(25) NOT NULL,
  `cidade` varchar(25) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `loja`
--

INSERT INTO `loja` (`nome_fantasia`, `nota`, `cnpj`, `senha`, `insc_estadual`, `site`, `email`, `cep`, `endereco`, `numero`, `bairro`, `cidade`, `estado`, `telefone`, `celular`, `id`) VALUES
('Loja_adm', 0, '00.000.000/0000-00', 'd9e6762dd1c8eaf6d61b3c6192fc408d4d6d5f1176d0c29169bc24e71c3f274ad27fcd5811b313d681f7e55ec02d73d499c95455b6b5bb503acf574fba8ffe85', '123456', 'www.coco.com', 'loja@loja.com', '00000-000', 'rua bla', '12121', 'xefefg', 'Ipaussu', 'SP', '(00) 0000-00000', '12345', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `cod_pedido` int(11) NOT NULL,
  `data_pedido` date DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `pagamentoEfetuado` tinyint(1) NOT NULL DEFAULT 0,
  `atribuida` tinyint(1) NOT NULL DEFAULT 0,
  `cpfEntregador` varchar(14) NOT NULL,
  `EntregaEfetuada` tinyint(1) NOT NULL DEFAULT 0,
  `precoTotal` double DEFAULT NULL,
  `frete` double NOT NULL,
  `preco` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`cod_pedido`, `data_pedido`, `cpf`, `rua`, `numero`, `bairro`, `cep`, `cidade`, `estado`, `latitude`, `longitude`, `pagamentoEfetuado`, `atribuida`, `cpfEntregador`, `EntregaEfetuada`, `precoTotal`, `frete`, `preco`) VALUES
(1, '2021-11-07', '111.111.111-11', 'ef', 23, 'xefefg', 'efe', 'efef', 'AC', 'undefined', 'undefined', 0, 0, '0', 0, 0, 0, 0),
(2, '2021-11-07', '111.111.111-11', 'ef', 23, 'xefefg', 'efe', 'efef', 'AC', 'null', 'null', 0, 0, '0', 0, 0, 0, 0),
(3, '2021-11-07', '111.111.111-11', 'ef', 23, 'xefefg', 'efe', 'efef', 'AC', 'null', 'null', 0, 0, '0', 0, 0, 0, 0),
(4, '2021-11-07', '111.111.111-11', 'ef', 23, 'xefefg', 'efe', 'efef', 'AC', 'null', 'null', 0, 0, '0', 0, 0, 0, 0),
(5, '2021-11-07', '111.111.111-11', 'ef', 23, 'xefefg', 'efe', 'efef', 'AC', 'null', 'null', 0, 0, '0', 0, 0, 0, 0),
(6, '2021-11-07', '111.111.111-11', 'ef', 23, 'xefefg', 'efe', 'efef', 'AC', 'null', 'null', 0, 0, '0', 0, 0, 0, 0),
(7, '2021-11-07', '111.111.111-11', 'ef', 23, 'xefefg', 'efe', 'efef', 'AC', 'null', 'null', 0, 0, '0', 0, 0, 0, 0),
(8, '2021-11-07', '111.111.111-11', 'ef', 151, 'efef', 'efefef', 'efef', 'AC', 'null', 'null', 0, 0, '0', 0, 0, 0, 0),
(9, '2021-11-07', '111.111.111-11', 'pedro', 128, 'efef', 'efefef', 'efef', 'AC', '-23.0153559', '-49.482465', 0, 0, '0', 0, 0, 0, 0),
(10, '2021-11-07', '111.111.111-11', 'yhyh', 128, 'yhyh', 'yhyhyh', 'yhyh', 'AC', '-23.015354', '-49.4824559', 0, 0, '0', 0, 0, 0, 0),
(11, '2021-11-07', '111.111.111-11', 'erer', 128, 'efefef', 'efef', 'efef', 'AC', '-23.0153576', '-49.4824545', 0, 0, '0', 0, 0, 0, 0),
(12, '2021-11-07', '111.111.111-11', 'ererre', 128, 'erer', '26262', 'erer', 'AC', '-23.0153554', '-49.4824615', 0, 0, '0', 0, 6, 2, 4),
(13, '2021-11-07', '111.111.111-11', 'efef', 1118, 'efef', 'efefefef', 'efef', 'AC', '-23.0153555', '-49.4824594', 0, 0, '0', 0, 5.6, 2, 3.6),
(16, '2021-11-10', '111.111.111-11', 'Pedido longo', 12, '23232323', '2323', '33', 'AC', '-22.9796575', '-49.8666218', 1, 1, '222.222.222-22', 0, 29.9, 8, 21.9),
(18, '2021-11-10', '111.111.111-11', 'Pedido Longo DUPLICADO', 233, '45454', '233232343', '56566', 'AC', '-23.015339', '-49.4824676', 1, 1, '222.222.222-22', 0, 14.95, 4, 10.95),
(19, '2021-11-18', '111.111.111-11', 'Rua das cerejeiras', 206, 'Jardim Brasil IV', '18960-000', 'Bernardino de c', 'SP', '-22.6721792', '-50.4168448', 0, 0, '0', 0, 16.7, 2, 14.7),
(20, '2021-11-18', '111.111.111-11', 'Rua das cerejeiras', 206, 'Jardim Brasil IV', '18960-000', 'Bernardino de c', 'SP', '-22.6721792', '-50.4168448', 1, 1, '222.222.222-22', 1, 16.7, 2, 14.7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_receita`
--

CREATE TABLE `pedido_receita` (
  `codpedido_receita` char(10) NOT NULL,
  `cod_pedido` char(10) DEFAULT NULL,
  `cod_receita` char(10) DEFAULT NULL,
  `qtdadeItem` char(10) DEFAULT NULL,
  `valorItem` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `receita`
--

CREATE TABLE `receita` (
  `cod_receita` char(10) NOT NULL,
  `quant_remedio` char(10) DEFAULT NULL,
  `CRM_medico` char(10) DEFAULT NULL,
  `cod_remedio` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `remedios`
--

CREATE TABLE `remedios` (
  `farmacia` varchar(25) NOT NULL,
  `cod_remedio` int(10) NOT NULL,
  `valor` float DEFAULT NULL,
  `valorFrete` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `laboratorio` char(10) DEFAULT NULL,
  `tipo` char(10) DEFAULT NULL,
  `qtdade_unidade` char(10) DEFAULT NULL,
  `qtdadeEstoque` char(10) DEFAULT NULL,
  `desc` text NOT NULL,
  `foto1` varchar(100) NOT NULL,
  `foto2` varchar(100) NOT NULL,
  `foto3` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `remedios`
--

INSERT INTO `remedios` (`farmacia`, `cod_remedio`, `valor`, `valorFrete`, `nome`, `laboratorio`, `tipo`, `qtdade_unidade`, `qtdadeEstoque`, `desc`, `foto1`, `foto2`, `foto3`) VALUES
('00.000.000/0000-00', 10, 12, 3, 'Hidroxido de pedro', 'efef', 'Veneno', '15', '20', 'teste', '', '', ''),
('00.000.000/0000-00', 47, 0, 0, 'bruh', 'br', 'er', 'NaN', 'NaN', 'bre', '/fotos/377WhatsAppImage2021-09-25at10.41.28.jpeg', '', ''),
('00.000.000/0000-00', 62, 7.35, 2, 'Glifage XR 500mg Merck S/A 30 ', 'Merck', 'Remedio', '30', '10', 'Glifage XR 500mg Merck S/A 30 comprimidos é indicado para tratar diabetes tipo 2, associado a uma dieta alimentar. Pode ser usado junto com a insulinoterapia, na diabetes tipo 1, prevenção da diabetes tipo 2, em pré-diabéticos e síndrome do ovário policístico. Uso adulto, sob orientação médica.', '/fotos/110Figura-Caixa-de-Remedio-PNG.png', 'null', 'null'),
('00.000.000/0000-00', 63, 3.6, 2, 'Atenolol 25mg Genérico Medley ', 'Medley', 'Generico', '30', '10', 'O Atenolol 25mg Genérico Medley é indicado para o tratamento de hipertensão arterial. O fármaco age nos receptores localizados no coração e na circulação, controlando o fluxo sanguíneo. Deve ser comprado com apresentação de receita médica. A embalagem contém 30 comprimidos.', '/fotos/245Figura-Caixa-de-Remedio-PNG.png', 'null', 'null');

-- --------------------------------------------------------

--
-- Estrutura da tabela `remedios_pedido`
--

CREATE TABLE `remedios_pedido` (
  `codproduto_estoque` int(11) NOT NULL,
  `cod_remedio` char(10) DEFAULT NULL,
  `cod_pedido` char(10) DEFAULT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `remedios_pedido`
--

INSERT INTO `remedios_pedido` (`codproduto_estoque`, `cod_remedio`, `cod_pedido`, `quantidade`) VALUES
(1, '62', '6', 1),
(2, '0', '0', 1),
(3, '62', '7', 1),
(4, '62', '7', 1),
(5, '62', '8', 1),
(6, '62', '8', 1),
(7, '62', '9', 1),
(8, '63', '10', 1),
(9, '63', '11', 1),
(10, '63', '12', 1),
(11, '63', '13', 1),
(12, '62', '16', 1),
(13, '63', '16', 1),
(14, '62', '16', 1),
(15, '63', '16', 1),
(16, '62', '18', 1),
(17, '63', '18', 1),
(18, '62', '20', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Cpf`);

--
-- Índices para tabela `entregador`
--
ALTER TABLE `entregador`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`cod_produto`);

--
-- Índices para tabela `foto_produto`
--
ALTER TABLE `foto_produto`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`cnpj`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`cod_pedido`);

--
-- Índices para tabela `pedido_receita`
--
ALTER TABLE `pedido_receita`
  ADD PRIMARY KEY (`codpedido_receita`);

--
-- Índices para tabela `receita`
--
ALTER TABLE `receita`
  ADD PRIMARY KEY (`cod_receita`);

--
-- Índices para tabela `remedios`
--
ALTER TABLE `remedios`
  ADD PRIMARY KEY (`cod_remedio`);

--
-- Índices para tabela `remedios_pedido`
--
ALTER TABLE `remedios_pedido`
  ADD PRIMARY KEY (`codproduto_estoque`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `foto_produto`
--
ALTER TABLE `foto_produto`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `cod_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `remedios`
--
ALTER TABLE `remedios`
  MODIFY `cod_remedio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de tabela `remedios_pedido`
--
ALTER TABLE `remedios_pedido`
  MODIFY `codproduto_estoque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
