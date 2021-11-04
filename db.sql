-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 04-Nov-2021 às 18:54
-- Versão do servidor: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pharma`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
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
('111.111.111-11', 'RUa', 'pedroADMIN', 'pedro@admin.com', 'Bernardino', 'JARDIM', 'SP', '(00) 0000-00000', '16d4074e1a1f081538a09b801586da6881e547def93e643e4bac5195d9ef14ecb45d636f34c7cd166408de6cb2ed987d3e53212e3ad12a597cac49e5b64197ab'),
('cpf', 'logradouro', 'nome', 'email', 'cidade', 'bairro', 'estado', 'celular', 'senha');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador`
--

CREATE TABLE IF NOT EXISTS `entregador` (
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `email` varchar(50) NOT NULL,
  `email2` varchar(50) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `numero` varchar(40) NOT NULL,
  `cidade` varchar(35) NOT NULL,
  `bairro` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `cep` varchar(40) NOT NULL,
  `senha` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `entregador`
--

INSERT INTO `entregador` (`nome`, `cpf`, `email`, `email2`, `telefone`, `logradouro`, `numero`, `cidade`, `bairro`, `estado`, `cep`, `senha`) VALUES
('PedroAdmin', '111.111.111-11', 'admin@admin.com', '', '(18) 5151-51515', 'Admin', '15', 'Bernardino', 'efef', 'AP', '18960-000', '16d4074e1a1f081538a09b801586da6881e547def93e643e4bac5195d9ef14ec'),
('er', 'ere.r', 'er@etec.com', '', '(', 'erer', 'ererre', 'er', 'wdwd', 'AC', '-', 'd8b98a9504562ad66a');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE IF NOT EXISTS `estoque` (
  `cod_produto` char(10) NOT NULL,
  `nome_produto` char(10) DEFAULT NULL,
  `validade` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto_produto`
--

CREATE TABLE IF NOT EXISTS `foto_produto` (
`cod` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `foto_produto`
--

INSERT INTO `foto_produto` (`cod`, `id_produto`, `foto`) VALUES
(11, 37, 'http://localhost//pharmalivery/252Variação Linguística.pdf'),
(12, 47, 'http://localhost//pharmalivery/411WhatsApp Image 2021-09-25 at 10.41.28.jpeg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE IF NOT EXISTS `loja` (
  `nome_fantasia` varchar(25) NOT NULL,
  `nota` float DEFAULT '0' COMMENT 'Classificacao da loja',
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

CREATE TABLE IF NOT EXISTS `pedido` (
  `cod_pedido` char(10) NOT NULL,
  `data_pedido` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `cidade` varchar(15) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `valor` char(10) DEFAULT NULL,
  `autorizado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`cod_pedido`, `data_pedido`, `cpf`, `rua`, `numero`, `bairro`, `cep`, `cidade`, `estado`, `latitude`, `longitude`, `valor`, `autorizado`) VALUES
('cod_pedido', 'data_pedid', 'cpf', 'rua', 123, 'bairro', 'cep', 'cidade', 'estado', 'latitude', 'longitude', 'valor', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_remedio`
--

CREATE TABLE IF NOT EXISTS `pedido_remedio` (
  `codpedido_receita` char(10) NOT NULL,
  `cod_pedido` char(10) DEFAULT NULL,
  `cod_receita` char(10) DEFAULT NULL,
  `qtdadeItem` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `receita`
--

CREATE TABLE IF NOT EXISTS `receita` (
  `cod_receita` char(10) NOT NULL,
  `quant_remedio` char(10) DEFAULT NULL,
  `CRM_medico` char(10) DEFAULT NULL,
  `cod_remedio` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `remedios`
--

CREATE TABLE IF NOT EXISTS `remedios` (
  `farmacia` varchar(25) NOT NULL,
`cod_remedio` int(10) NOT NULL,
  `valor` float DEFAULT NULL,
  `valorFrete` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `laboratorio` char(10) DEFAULT NULL,
  `tipo` char(10) DEFAULT NULL,
  `qtdade_unidade` char(10) DEFAULT NULL,
  `qtdadeEstoque` char(10) DEFAULT NULL,
  `desc` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `remedios`
--

INSERT INTO `remedios` (`farmacia`, `cod_remedio`, `valor`, `valorFrete`, `nome`, `laboratorio`, `tipo`, `qtdade_unidade`, `qtdadeEstoque`, `desc`) VALUES
('00.000.000/0000-00', 10, 12, 3, 'Hidroxido de pedro', 'efef', 'Veneno', '15', '20', 'teste'),
('00.000.000/0000-00', 47, 0, 0, 'bruh', 'br', 'er', 'NaN', 'NaN', 'bre');

-- --------------------------------------------------------

--
-- Estrutura da tabela `remedios_pedido`
--

CREATE TABLE IF NOT EXISTS `remedios_pedido` (
  `codproduto_estoque` char(10) NOT NULL,
  `cod_remedio` char(10) DEFAULT NULL,
  `cod_pedido` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`Cpf`);

--
-- Indexes for table `entregador`
--
ALTER TABLE `entregador`
 ADD PRIMARY KEY (`cpf`), ADD KEY `cpf` (`cpf`), ADD KEY `cpf_2` (`cpf`);

--
-- Indexes for table `estoque`
--
ALTER TABLE `estoque`
 ADD PRIMARY KEY (`cod_produto`);

--
-- Indexes for table `foto_produto`
--
ALTER TABLE `foto_produto`
 ADD PRIMARY KEY (`cod`);

--
-- Indexes for table `loja`
--
ALTER TABLE `loja`
 ADD PRIMARY KEY (`cnpj`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
 ADD PRIMARY KEY (`cod_pedido`);

--
-- Indexes for table `pedido_remedio`
--
ALTER TABLE `pedido_remedio`
 ADD PRIMARY KEY (`codpedido_receita`);

--
-- Indexes for table `receita`
--
ALTER TABLE `receita`
 ADD PRIMARY KEY (`cod_receita`);

--
-- Indexes for table `remedios`
--
ALTER TABLE `remedios`
 ADD PRIMARY KEY (`cod_remedio`);

--
-- Indexes for table `remedios_pedido`
--
ALTER TABLE `remedios_pedido`
 ADD PRIMARY KEY (`codproduto_estoque`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foto_produto`
--
ALTER TABLE `foto_produto`
MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `remedios`
--
ALTER TABLE `remedios`
MODIFY `cod_remedio` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
