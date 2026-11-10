-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 10/11/2026 às 14:45
-- Versão do servidor: 8.0.42-0ubuntu0.24.04.1
-- Versão do PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `seani_aula`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `linhas_producao`
--

CREATE TABLE `linhas_producao` (
  `id_linha` int NOT NULL,
  `id_unidade` int DEFAULT NULL,
  `nome_linha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `maquinas_senai`
--

CREATE TABLE `maquinas_senai` (
  `id_maquina` int NOT NULL,
  `id_linha` int DEFAULT NULL,
  `id_tipo` int DEFAULT NULL,
  `tag_patrimonio` varchar(30) DEFAULT NULL,
  `data_aquisicao` date DEFAULT NULL,
  `status_operacao` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TIPOS_MAQUINA`
--

CREATE TABLE `TIPOS_MAQUINA` (
  `id_tipo` int NOT NULL,
  `nome_tipo` varchar(50) DEFAULT NULL,
  `horas_revisao_padrao` int DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidade_senai`
--

CREATE TABLE `unidade_senai` (
  `id_unidade` int NOT NULL,
  `nome_unidade` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD PRIMARY KEY (`id_linha`),
  ADD KEY `fk_id_unidade` (`id_unidade`);

--
-- Índices de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD PRIMARY KEY (`id_maquina`),
  ADD KEY `fk_id_linha` (`id_linha`),
  ADD KEY `fk_id_tipo` (`id_tipo`);

--
-- Índices de tabela `TIPOS_MAQUINA`
--
ALTER TABLE `TIPOS_MAQUINA`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Índices de tabela `unidade_senai`
--
ALTER TABLE `unidade_senai`
  ADD PRIMARY KEY (`id_unidade`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  MODIFY `id_linha` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  MODIFY `id_maquina` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `TIPOS_MAQUINA`
--
ALTER TABLE `TIPOS_MAQUINA`
  MODIFY `id_tipo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `unidade_senai`
--
ALTER TABLE `unidade_senai`
  MODIFY `id_unidade` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD CONSTRAINT `fk_id_unidade` FOREIGN KEY (`id_unidade`) REFERENCES `unidade_senai` (`id_unidade`);

--
-- Restrições para tabelas `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD CONSTRAINT `fk_id_linha` FOREIGN KEY (`id_linha`) REFERENCES `linhas_producao` (`id_linha`),
  ADD CONSTRAINT `fk_id_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `TIPOS_MAQUINA` (`id_tipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
