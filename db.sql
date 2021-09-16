-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Set-2021 às 00:43
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
('111.111.111-11', 'RUa', 'pedroADMIN', 'pedro@admin.com', 'Bernardino', 'JARDIM', 'SP', '(00) 0000-00000', '16d4074e1a1f081538a09b801586da6881e547def93e643e4bac5195d9ef14ecb45d636f34c7cd166408de6cb2ed987d3e53212e3ad12a597cac49e5b64197ab'),
('cpf', 'logradouro', 'nome', 'email', 'cidade', 'bairro', 'estado', 'celular', 'senha');

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
  `cod_pedido` char(10) NOT NULL,
  `data_pedido` char(10) DEFAULT NULL,
  `valor` char(10) DEFAULT NULL,
  `Cpf` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `cod_remedio` char(10) NOT NULL,
  `valor` char(10) DEFAULT NULL,
  `nome` char(10) DEFAULT NULL,
  `laboratorio` char(10) DEFAULT NULL,
  `tipo` char(10) DEFAULT NULL,
  `qtdade_unidade` char(10) DEFAULT NULL,
  `qtdadeEstoque` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `remedios_pedido`
--

CREATE TABLE `remedios_pedido` (
  `codproduto_estoque` char(10) NOT NULL,
  `cod_remedio` char(10) DEFAULT NULL,
  `cod_pedido` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Cpf`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`cod_produto`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;