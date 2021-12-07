-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Dez-2021 às 02:36
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
('121.223.322-32', 'efef', '111.111.111-11', 'pedro.ciclobrasil@gmail', 'undefined', 'undefined', 'SP', '(14) 9990-72739', 'd9e6762dd1c8eaf6d61b3c6192fc408d4d6d5f1176d0c29169bc24e71c3f274ad27fcd5811b313d681f7e55ec02d73d499c95455b6b5bb503acf574fba8ffe85'),
('222.222.222-22', 'Rua das cerejeiras', '111.111.111-11', 'pedro.ciclobrasil@gmail', 'undefined', 'undefined', 'SP', '(14) 9990-72739', 'd9e6762dd1c8eaf6d61b3c6192fc408d4d6d5f1176d0c29169bc24e71c3f274ad27fcd5811b313d681f7e55ec02d73d499c95455b6b5bb503acf574fba8ffe85'),
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
  `numero` varchar(15) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `pagamentoEfetuado` tinyint(1) NOT NULL DEFAULT 1,
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
(21, '2021-12-06', '111.111.111-11', 'undefined', '206', 'Jardim Brasil IV', '18960-000', 'Bernardino de Campos', 'SP', '-22.6393212', '-50.4023985', 1, 1, '222.222.222-22', 1, 7.99, 1, 6.99),
(22, '2021-12-06', 'undefined', 'Rua das cerejeiras', '206', 'Jardim Brasil IV', '18960-000', 'Bernardino de Campos', 'SP', '-23.0153484', '-49.4824562', 1, 0, '', 0, 7.99, 1, 6.99);

-- --------------------------------------------------------

--
-- Estrutura da tabela `remedios`
--

CREATE TABLE `remedios` (
  `farmacia` varchar(25) NOT NULL,
  `cod_remedio` int(10) NOT NULL,
  `valor` float DEFAULT NULL,
  `valorFrete` double NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `laboratorio` varchar(10) DEFAULT NULL,
  `tipo` varchar(35) DEFAULT NULL,
  `qtdade_unidade` varchar(10) DEFAULT NULL,
  `qtdadeEstoque` varchar(10) DEFAULT NULL,
  `desc` text NOT NULL,
  `foto1` varchar(200) NOT NULL,
  `foto2` varchar(100) NOT NULL,
  `foto3` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `remedios`
--

INSERT INTO `remedios` (`farmacia`, `cod_remedio`, `valor`, `valorFrete`, `nome`, `laboratorio`, `tipo`, `qtdade_unidade`, `qtdadeEstoque`, `desc`, `foto1`, `foto2`, `foto3`) VALUES
('00.000.000/0000-00', 62, 7.35, 2, 'Glifage XR 500mg Merck S/A 30 ', 'Merck', 'Generico', '30', '10', 'Glifage XR 500mg Merck S/A 30 comprimidos é indicado para tratar diabetes tipo 2, associado a uma dieta alimentar. Pode ser usado junto com a insulinoterapia, na diabetes tipo 1, prevenção da diabetes tipo 2, em pré-diabéticos e síndrome do ovário policístico. Uso adulto, sob orientação médica.', '/fotos/110Figura-Caixa-de-Remedio-PNG.png', 'null', 'null'),
('00.000.000/0000-00', 63, 3.6, 2, 'Atenolol 25mg Genérico Medley ', 'Medley', 'Generico', '30', '10', 'O Atenolol 25mg Genérico Medley é indicado para o tratamento de hipertensão arterial. O fármaco age nos receptores localizados no coração e na circulação, controlando o fluxo sanguíneo. Deve ser comprado com apresentação de receita médica. A embalagem contém 30 comprimidos.', '/fotos/245Figura-Caixa-de-Remedio-PNG.png', 'null', 'null'),
('00.000.000/0000-00', 65, 16.75, 3, 'Enxaguante Bucal Listerine Zer', 'Listerine ', 'dia a dia', '1', '5', 'O Listerine Zero é um Enxaguante bucal que remove até 99% dos germes que causam placa, gengivite e mau hálito. Sua fórmula suave e zero álcool garante até 12 horas de proteção para que seu sorriso fique bonito e saudávelAlcançando onde o fio e a escova não chegam. Nenhum outro Enxaguante bucal sem álcool é mais efetivo em remover os germes do que listerine zero.* *estudo in vitro', '/fotos/141listerine.png', 'null', 'null'),
('00.000.000/0000-00', 67, 26.99, 4, 'Shampoo Anticaspa Clear Men Co', 'Clear Men ', 'Higiene pessoal', '1', '2', 'O shampoo Anticaspa Clear Men Controle e Alívio da Coceira com 400ml conta com vitamina B3, eucalipto e melaleuca para combater a caspa nos homens. Sua fórmula ajuda a ativar defesas naturais do couro cabeludo, eliminando a caspa e sintomas como a coceira. ', '/fotos/772shampooClear.png', 'null', 'null'),
('00.000.000/0000-00', 68, 19.7, 2, 'Kit Desodorante Aerosol Nivea ', 'Nivea', 'Higiene pessoal', '1', '15', 'Desodorante Aerosol Nivea Men Invisible For Black & White 150ml', '/fotos/220desodoranteNiveaMen.png', 'null', 'null'),
('00.000.000/0000-00', 69, 8.95, 3, 'Loção Deo-Hidratante Corporal ', 'Nivea ', 'Higiene pessoal', '1', '25', 'O que é? NIVEA Loção Hidratante Milk hidrata profundamente a pele. Tem 2x mais óleo de amendoas, nutrindo intensamente por 48h. Aproveite!  Para que serve o NIVEA Loção Hidratante Milk? Este hidratante corporal promove uma agradável sensação de maciez na pele, cuidando e protegendo do ressecamento. É indicado para pele seca e extrasseca.  Benefícios e diferenciais - 2x mais óleo de amêndoas - Fórmula cremosa - Não contém corantes nem álcool etílico - Livre de ingredientes de origem animal  Como usar o NIVEA Loção Hidratante Milk? Aplique o produto massageando a pele até ser absorvido. Indicado para joelhos, pés, calcanhares e regiões mais ressecadas. Use todos os dias.  Uma unidade de embalagem contém 200ml', '/fotos/624cremeNivea.png', 'null', 'null'),
('00.000.000/0000-00', 71, 2.99, 1, 'Dipirona Prati 500mg Genérico ', 'Prati-Dona', 'Generico', '10', '15', 'Como age o Dipirona Sódica? A Dipirona é um derivado pirazolônico não narcótico com efeitos analgésico, antipirético e espasmolítico. A Dipirona é uma pró-droga cuja metabolização gera a formação de vários metabólitos entre os quais há 2 com propriedades analgésicas: 4-metil-aminoantipirina (4-MAA) e o 4-amino-antipirina (4-AA).  Indicações Este medicamento é indicado como analgésico e antitérmico.', 'null', 'null', 'null'),
('00.000.000/0000-00', 72, 39.9, 3, 'Protetor Solar Facial Nivea Su', 'Nivea ', 'dia a dia', '1', '5', 'NIVEA Sun Facial Toque Seco Antissinais é um protetor solar facial para uso diário. Com exclusiva fórmula de textura leve, rápida absorção e toque seco, controla o brilho e deixa sua pele macia e radiante. Além de oferecer alta proteção imediata UVA/UVB contra os efeitos do sol, previne o envelhecimento precoce da pele causado pela exposição solar/radiação. Perfeito para usar até mesmo antes da maquiagem. - Alta proteção contra raios UVA/UVB - Oil free - Textura ultra leve - Toque seco - Reduz e controla o brilho - Resistente à água - Previne o envelhecimento da pele causado pela exposição solar', '/fotos/646ProtetorSolaNivea.png', 'null', 'null'),
('00.000.000/0000-00', 73, 29.99, 5, 'Sabonete Facial em Gel Nivea M', 'Nivea', 'Higiene pessoal', '1', '5', 'O que é? Sabonete em gel para o rosto com tecnologia MicellAir. Esfolia a pele com todo cuidado, garantindo maciez todos os dias. Conheça +detalhes!  Para que serve o Sabonete Gel Facial Micellair Expert? Sua fórmula combina ácido lático com esfoliantes naturais que removem impurezas acumuladas na pele durante à noite. Deixa a pele pronta para maquiagem.  Benefícios e diferenciais - Deixa a pele mais uniforme e bonita - Com ácido lático - Não resseca nem irrita a pele - Dermatologicamente testado', '/fotos/518micellair.png', 'null', 'null'),
('00.000.000/0000-00', 74, 18.21, 8, 'Tadalafila 20mg Genérico Cimed', 'Cimed ', 'Generico', '4', '10', 'Tadalafila 20mg Genérico Cimed 4 Comprimidos  Tipo de Medicamento: Genéricos', 'null', 'null', 'null'),
('00.000.000/0000-00', 75, 6.99, 1, 'Sabonete Líquido Protex Vitami', 'Protex ', 'dia a dia', '1', '7', 'Protex® Vitamina E combina a proteção antibacteriana prolongada de Protex® com a Vitamina E, um conhecido ingrediente essencial para a pele.', '/fotos/556sabonete-liquido-protex-vitamina-e-250ml-Pacheco-349860-1-removebg-preview.png', 'null', 'null'),
('00.000.000/0000-00', 76, 78.95, 2, 'Nervocalm 250mg WP Lab 60 Comp', 'WP Lab', 'dia a dia', '60', '5', 'Nervocalm 250mg WP Lab 60 Comprimidos é um medicamento indicado como auxiliar no tratamento da ansiedade, depressão, insônia, nervosismo, irritabilidade, inquietude, impulsividade, agitação, sono perturbado, tremores, palpitação e cefaleia (dor de cabeça). Ele age equilibrando o organismo, atenuando a intensidade e espaçando as crises de ansiedade. POSOLOGIA: TOMAR 02 COMPRIMIDOS AO DEITAR.  Princípio Ativo: Com Argentum Nitricum, Com Kali Bromatum', '/fotos/872515817---nervocalm-250mg-wp-lab-60-comprimidos-removebg-preview.png', 'null', 'null'),
('00.000.000/0000-00', 77, 5.85, 2, 'Analgésico Dorflex 10 Comprimi', 'Safoni Ave', 'Analgésicos', '10', '2', 'Dorflex possui ação analgésica e relaxante muscular. O início da ação ocorre a partir de 30 minutos. Dorflex é indicado no alívio da dor associada a contraturas musculares, incluindo dor de cabeça tensional.', '/fotos/60059790---Analgesico-Dorflex-10-Comprimidos-1-removebg-preview.png', 'null', 'null'),
('00.000.000/0000-00', 78, 9.19, 2, 'Antigripal Coristina D 4 Compr', 'Hyper Marc', 'Analgésicos', '4', '10', 'Coristina d é o único antigripal que vale por 3 no combate a gripe e resfriado: Descongestiona, Tira dor e febre e Devolve a disposição, por conter cafeina na sua composição.  Princípio Ativo: Com Ácido Acetilsalicílico, Com Maleato De Dexclorfeniramina, Com Cloridrato De Fenilefrina, Com Cafeína', '/fotos/48133189---Antigripal-Coristina-D-4-Comprimidos-1-removebg-preview(1).png', 'null', 'null'),
('00.000.000/0000-00', 79, 46.99, 3, 'Descongestionante Vick VapoRub', 'Vicks', 'Analgésicos', '1', '3', 'Vick VapoRub é uma pomada que combina mentol, óleo de eucalipto e cânfora e ajuda a aliviar alguns sintomas de constipação como congestão nasal, tosse e dores musculares. Vick VapoRub proporciona alívio da congestão nasal em 2 minutos por até 8 horas, para uma boa noite de sono. Vick VapoRub pode ser aplicado no pescoço (para aliviar a tosse), peito (para ajudar a limpar as vias aéreas) e costas (para aliviar as dores musculares e as dores de um resfriado). Não usar em crianças com menos de 2 anos de idade.   •	Alivia alguns sintomas da gripe   •	Alivia a tosse  •	Alívio de dores musculares próprias da gripe e resfriados  •	Alívio da congestão nasal em 2 minutos por até 8 horas  •	Alívio de congestão nasal   Passe uma camada fina até 3 vezes ao dia, no peito para acalmar a tosse, no pescoço para que, ao inalar seus vapores medicinais eles aliviem a congestão nasal e facilitem a respiração, nas costas para que a sensação de calor oferecida por vick vaporub ajude a acalmar o mal-estar muscular que acompanha gripes e resfriados.  Princípio Ativo: Com Cânfora, Com Levomentol, Com Óleo De Eucalipto', '/fotos/288721425---descongestionante-vick-vaporub-100g-removebg-preview.png', 'null', 'null'),
('00.000.000/0000-00', 80, 26.49, 3, 'Analgésico Novalgina 500mg', 'Sanofi ', 'Analgésicos', '30', '5', 'Com quase 100 anos de tradição, Novalgina é indicado como antitérmico para febre e analgésico para dor. Novalgina é um medicamento à base de dipirona, utilizado no tratamento dor e febre. Os efeitos analgésico e antitérmico podem ser esperados em 30 a 60 minutos após a administração e geralmente persistem por aproximadamente 4 horas. Novalgina cuidando de toda a família.', '/fotos/7266893---analgesico-novalgina-500mg-sanofi-30-comprimidos-removebg-preview.png', 'null', 'null'),
('00.000.000/0000-00', 81, 93.95, 10, 'Fralda Pampers Pants Ajuste To', 'Pampers ', 'Mamãe e Bebê', '66', '3', 'A fralda Pampers Pants Ajuste Total veste como shortinho, tem cintura elástica de 360°, ajuste inteligente, canais de ar e camada com gel super absorvente oferecendo até 12 horas de conforto e proteção para a pele do bebê. O tamanho XG veste crianças de 11 a 15 kg.', '/fotos/96Fralda-Pampers-Confort-Sec-Pants-Top-Xg-66-Unidades-Drogaria-SP-691658-removebg-preview.png', 'null', 'null'),
('00.000.000/0000-00', 82, 42.99, 5, 'Fórmula Infantil Ninho Nutrigo', 'Nestle', 'Mamãe e Bebê', '1', '5', 'Para bebês a partir de 1 ano. A nutrição ideal para a fase de desenvolvimento acelerado do seu filho, com prebióticos, DHA e ARA. NÃO CONTÉM GLÚTEN.', '/fotos/825Formula-Infantil-Ninho-Nutrigold-800g-Drogaria-SP-666416-removebg-preview.png', 'null', 'null'),
('00.000.000/0000-00', 83, 23.19, 3, 'Sabonete Líquido de Glicerina ', 'Johnson', 'Mamãe e Bebê', '1', '5', 'O Baby Sabonete Líquido de Glicerina JOHNSON® possui uma fórmula tão suave quanto a água pura para os olhos, a pele e o cabelo do bebê. Com pH fisiológico, é hipoalergênico e livre de parabenos, sulfatos, corantes e ftalatos', '/fotos/178578525---Sabonete-Liquido-Johnsons-Baby-da-Cabeca-aos-Pes-400ml-1-removebg-preview.png', 'null', 'null'),
('00.000.000/0000-00', 87, 13.49, 4, 'Lenço Umedecido Baby Aloe Vera', 'Ever Care', 'Mamãe e Bebê', '96', '15', 'O Lenço Umedecido Baby Aloe Vera Ever Care 96 Unidades é ideal para a limpeza eficaz e segura do bebê. Hipoalergênico e dermatologicamente testado, sem parabenos e álcool etílico, possui etiqueta rígida, que ajuda a manter a umidade das toalhas por mais tempo.', '/fotos/167lenco-umedecido-baby-aloe-vera-ever-care-96un-Drogaria-SP-671800-removebg-preview.png', 'null', 'null');

-- --------------------------------------------------------

--
-- Estrutura da tabela `remedios_pedido`
--

CREATE TABLE `remedios_pedido` (
  `codproduto_estoque` int(11) NOT NULL,
  `cod_remedio` varchar(10) DEFAULT NULL,
  `cod_pedido` varchar(10) DEFAULT NULL,
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
(18, '62', '20', 2),
(19, '75', '21', 1),
(20, '75', '22', 1);

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
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `cod_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `remedios`
--
ALTER TABLE `remedios`
  MODIFY `cod_remedio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de tabela `remedios_pedido`
--
ALTER TABLE `remedios_pedido`
  MODIFY `codproduto_estoque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
