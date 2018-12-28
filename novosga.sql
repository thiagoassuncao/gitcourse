-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 20/12/2018 às 08:41
-- Versão do servidor: 5.5.62-0ubuntu0.14.04.1
-- Versão do PHP: 5.5.9-1ubuntu4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `novosga`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimentos`
--

CREATE TABLE IF NOT EXISTS `atendimentos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unidade_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `usuario_tri_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  `prioridade_id` int(11) NOT NULL,
  `atendimento_id` bigint(20) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `sigla_senha` varchar(1) NOT NULL,
  `num_senha` int(11) NOT NULL,
  `num_senha_serv` int(11) NOT NULL,
  `nm_cli` varchar(100) DEFAULT NULL,
  `num_local` smallint(6) NOT NULL,
  `dt_cheg` datetime NOT NULL,
  `dt_cha` datetime DEFAULT NULL,
  `dt_ini` datetime DEFAULT NULL,
  `dt_fim` datetime DEFAULT NULL,
  `ident_cli` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `atendimentos_ibfk_1` (`prioridade_id`),
  KEY `atendimentos_ibfk_2` (`unidade_id`,`servico_id`),
  KEY `atendimentos_ibfk_4` (`usuario_id`),
  KEY `atendimentos_ibfk_5` (`usuario_tri_id`),
  KEY `atendimentos_ibfk_6` (`atendimento_id`),
  KEY `fki_atendimentos_ibfk_3` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `atend_codif`
--

CREATE TABLE IF NOT EXISTS `atend_codif` (
  `atendimento_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `servico_id` int(11) NOT NULL,
  `valor_peso` smallint(6) NOT NULL,
  PRIMARY KEY (`atendimento_id`,`servico_id`),
  KEY `atend_codif_ibfk_2` (`servico_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `atend_meta`
--

CREATE TABLE IF NOT EXISTS `atend_meta` (
  `atendimento_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text,
  PRIMARY KEY (`atendimento_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargos`
--

CREATE TABLE IF NOT EXISTS `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `esquerda` int(11) NOT NULL,
  `direita` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Fazendo dump de dados para tabela `cargos`
--

INSERT INTO `cargos` (`id`, `nome`, `descricao`, `esquerda`, `direita`, `nivel`) VALUES
(1, 'Administrador', 'Administrador geral do sistema', 1, 6, 0),
(2, 'ATENDENTE', 'CARGOS DESTINADO AOS ATENDENTES', 2, 5, 1),
(3, 'TRIAGEM', 'Cargo destinado a Triagem', 3, 4, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargos_mod_perm`
--

CREATE TABLE IF NOT EXISTS `cargos_mod_perm` (
  `cargo_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `permissao` int(11) NOT NULL,
  PRIMARY KEY (`cargo_id`,`modulo_id`),
  KEY `cargos_mod_perm_ibfk_2` (`modulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `cargos_mod_perm`
--

INSERT INTO `cargos_mod_perm` (`cargo_id`, `modulo_id`, `permissao`) VALUES
(1, 1, 3),
(1, 2, 3),
(1, 3, 3),
(1, 4, 3),
(1, 5, 3),
(1, 6, 3),
(1, 7, 3),
(1, 8, 3),
(1, 9, 3),
(1, 10, 3),
(1, 11, 3),
(1, 12, 3),
(1, 13, 3),
(1, 14, 3),
(2, 2, 3),
(3, 11, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `chave` varchar(150) NOT NULL,
  `valor` text NOT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`chave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `config`
--

INSERT INTO `config` (`chave`, `valor`, `tipo`) VALUES
('auth', 'a:3:{s:4:"type";s:2:"db";s:2:"db";a:0:{}s:4:"ldap";a:7:{s:4:"host";s:0:"";s:4:"port";s:0:"";s:6:"baseDn";s:0:"";s:14:"loginAttribute";s:0:"";s:8:"username";s:0:"";s:8:"password";s:0:"";s:6:"filter";s:0:"";}}', 3),
('numeracao', '1', 2),
('version', '1.5.0', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contador`
--

CREATE TABLE IF NOT EXISTS `contador` (
  `unidade_id` int(11) NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unidade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `contador`
--

INSERT INTO `contador` (`unidade_id`, `total`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `esquerda` int(11) NOT NULL,
  `direita` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `direita` (`direita`),
  KEY `esqdir` (`esquerda`,`direita`),
  KEY `esquerda` (`esquerda`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Fazendo dump de dados para tabela `grupos`
--

INSERT INTO `grupos` (`id`, `nome`, `descricao`, `esquerda`, `direita`, `nivel`) VALUES
(1, 'Raíz', 'Grupo Raíz', 1, 4, 0),
(2, 'ATENDIMENTO', 'ATE', 2, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_atendimentos`
--

CREATE TABLE IF NOT EXISTS `historico_atendimentos` (
  `id` bigint(20) NOT NULL,
  `unidade_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `usuario_tri_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  `prioridade_id` int(11) NOT NULL,
  `atendimento_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `sigla_senha` varchar(1) NOT NULL,
  `num_senha` int(11) NOT NULL,
  `num_senha_serv` int(11) NOT NULL,
  `nm_cli` varchar(100) DEFAULT NULL,
  `num_local` smallint(6) NOT NULL,
  `dt_cheg` datetime NOT NULL,
  `dt_cha` datetime DEFAULT NULL,
  `dt_ini` datetime DEFAULT NULL,
  `dt_fim` datetime DEFAULT NULL,
  `ident_cli` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `historico_atendimentos_ibfk_1` (`prioridade_id`),
  KEY `historico_atendimentos_ibfk_2` (`unidade_id`,`servico_id`),
  KEY `historico_atendimentos_ibfk_4` (`usuario_id`),
  KEY `historico_atendimentos_ibfk_5` (`usuario_tri_id`),
  KEY `historico_atendimentos_ibfk_6` (`atendimento_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `historico_atendimentos`
--

INSERT INTO `historico_atendimentos` (`id`, `unidade_id`, `usuario_id`, `usuario_tri_id`, `servico_id`, `prioridade_id`, `atendimento_id`, `status`, `sigla_senha`, `num_senha`, `num_senha_serv`, `nm_cli`, `num_local`, `dt_cheg`, `dt_cha`, `dt_ini`, `dt_fim`, `ident_cli`) VALUES
(1, 1, 2, 1, 2, 1, NULL, 8, 'A', 1, 1, '', 1, '2018-01-12 23:33:44', '2018-01-12 23:41:09', '2018-01-12 23:46:21', '2018-01-12 23:46:44', ''),
(2, 1, 2, 1, 2, 1, NULL, 8, 'A', 2, 2, '', 1, '2018-01-12 23:34:59', '2018-01-12 23:46:46', '2018-01-12 23:46:54', '2018-01-12 23:47:06', ''),
(3, 1, 2, 1, 2, 1, NULL, 8, 'A', 3, 3, '', 1, '2018-01-12 23:35:09', '2018-01-12 23:47:08', '2018-01-12 23:48:38', '2018-01-12 23:48:52', ''),
(4, 1, 2, 1, 2, 1, NULL, 2, 'A', 4, 4, '', 1, '2018-01-12 23:35:16', '2018-01-12 23:48:56', NULL, NULL, ''),
(8, 1, 2, 1, 2, 1, NULL, 2, 'A', 4, 4, '', 1, '2018-01-13 11:10:05', '2018-01-13 11:13:41', NULL, NULL, ''),
(6, 1, 2, 1, 2, 1, NULL, 5, 'A', 2, 2, '', 1, '2018-01-13 11:09:56', '2018-01-13 11:12:37', NULL, '2018-01-13 11:12:59', ''),
(7, 1, 2, 1, 2, 1, NULL, 5, 'A', 3, 3, '', 1, '2018-01-13 11:10:00', '2018-01-13 11:13:00', NULL, '2018-01-13 11:13:40', ''),
(5, 1, 2, 1, 2, 1, NULL, 8, 'A', 1, 1, '', 1, '2018-01-13 11:09:49', '2018-01-13 11:10:18', '2018-01-13 11:12:20', '2018-01-13 11:12:35', ''),
(10, 1, 2, 1, 2, 1, NULL, 8, 'A', 2, 2, '', 1, '2018-01-22 22:36:54', '2018-01-22 22:40:06', '2018-01-22 22:40:11', '2018-01-22 22:40:21', ''),
(11, 1, 2, 1, 2, 1, NULL, 8, 'A', 3, 3, '', 1, '2018-01-22 22:37:15', '2018-01-22 22:40:23', '2018-01-22 22:40:32', '2018-01-22 22:40:41', ''),
(12, 1, 2, 1, 2, 1, NULL, 8, 'A', 4, 4, '', 1, '2018-01-22 22:37:19', '2018-01-22 22:40:42', '2018-01-22 22:40:52', '2018-01-22 22:40:58', ''),
(9, 1, 2, 1, 2, 1, NULL, 8, 'A', 1, 1, '', 1, '2018-01-22 22:36:28', '2018-01-22 22:39:11', '2018-01-22 22:39:45', '2018-01-22 22:40:04', ''),
(13, 1, 2, 13, 2, 1, NULL, 8, 'A', 1, 1, 'thiago', 1, '2018-09-16 08:41:18', '2018-09-16 08:43:53', '2018-09-16 08:44:00', '2018-09-16 08:44:26', '00000000077');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_atend_codif`
--

CREATE TABLE IF NOT EXISTS `historico_atend_codif` (
  `atendimento_id` bigint(20) NOT NULL,
  `servico_id` int(11) NOT NULL,
  `valor_peso` smallint(6) NOT NULL,
  PRIMARY KEY (`atendimento_id`,`servico_id`),
  KEY `historico_atend_codif_ibfk_2` (`servico_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `historico_atend_codif`
--

INSERT INTO `historico_atend_codif` (`atendimento_id`, `servico_id`, `valor_peso`) VALUES
(1, 2, 1),
(2, 2, 1),
(3, 2, 1),
(5, 2, 1),
(11, 2, 1),
(10, 2, 1),
(9, 2, 1),
(12, 2, 1),
(13, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_atend_meta`
--

CREATE TABLE IF NOT EXISTS `historico_atend_meta` (
  `atendimento_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text,
  PRIMARY KEY (`atendimento_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `locais`
--

CREATE TABLE IF NOT EXISTS `locais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `local_serv_nm` (`nome`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Fazendo dump de dados para tabela `locais`
--

INSERT INTO `locais` (`id`, `nome`) VALUES
(1, 'Guichê'),
(3, 'Mesa'),
(2, 'Sala');

-- --------------------------------------------------------

--
-- Estrutura para tabela `modulos`
--

CREATE TABLE IF NOT EXISTS `modulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chave` varchar(50) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `tipo` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modulos_chave` (`chave`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Fazendo dump de dados para tabela `modulos`
--

INSERT INTO `modulos` (`id`, `chave`, `nome`, `descricao`, `tipo`, `status`) VALUES
(1, 'sga.admin', 'Administração', 'Configurações gerais do sistema', 1, 1),
(2, 'sga.atendimento', 'Atendimento', 'Efetue o atendimento às senhas distribuídas dos serviços que você atende', 0, 1),
(3, 'sga.cargos', 'Cargos', 'Gerencie os cargos do sistema', 1, 1),
(4, 'sga.estatisticas', 'Estatísticas', 'Visualize e exporte estastísticas e relatórios sobre o sistema', 1, 1),
(5, 'sga.grupos', 'Grupos', 'Gerencie os grupos do sistema', 1, 1),
(6, 'sga.locais', 'Locais', 'Gerencie os locais de atendimento', 1, 1),
(7, 'sga.modulos', 'Módulos', 'Gerencie os módulos instalados', 1, 1),
(8, 'sga.monitor', 'Monitor', 'Gerencie as senhas aguardando atendimento', 0, 1),
(9, 'sga.prioridades', 'Prioridades', 'Gerencie os prioridades do sistema', 1, 1),
(10, 'sga.servicos', 'Serviços', 'Gerencie os serviços do sistema', 1, 1),
(11, 'sga.triagem', 'Triagem', 'Gerencie a distribuíção das senhas da unidade atual', 0, 1),
(12, 'sga.unidade', 'Configuração', 'Módulo para gerenciamento da unidade atual', 0, 1),
(13, 'sga.unidades', 'Unidades', 'Gerencie as unidades do sistema', 1, 1),
(14, 'sga.usuarios', 'Usuários', 'Gerencie os usuários do sistema', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(100) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `oauth_scopes`
--

CREATE TABLE IF NOT EXISTS `oauth_scopes` (
  `scope` text,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paineis`
--

CREATE TABLE IF NOT EXISTS `paineis` (
  `unidade_id` int(11) NOT NULL,
  `host` int(11) NOT NULL,
  PRIMARY KEY (`host`),
  KEY `paineis_ibfk_1` (`unidade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paineis_servicos`
--

CREATE TABLE IF NOT EXISTS `paineis_servicos` (
  `host` int(11) NOT NULL,
  `unidade_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  PRIMARY KEY (`host`,`servico_id`),
  KEY `paineis_servicos_ibfk_2` (`unidade_id`,`servico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `painel_senha`
--

CREATE TABLE IF NOT EXISTS `painel_senha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unidade_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  `num_senha` int(11) NOT NULL,
  `sig_senha` varchar(1) NOT NULL,
  `msg_senha` varchar(20) NOT NULL,
  `local` varchar(15) NOT NULL,
  `num_local` smallint(6) NOT NULL,
  `peso` smallint(6) NOT NULL,
  `prioridade` varchar(100) DEFAULT NULL,
  `nome_cliente` varchar(100) DEFAULT NULL,
  `documento_cliente` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `painel_senha_ibfk_1` (`unidade_id`),
  KEY `painel_senha_ibfk_2` (`servico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `prioridades`
--

CREATE TABLE IF NOT EXISTS `prioridades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `peso` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Fazendo dump de dados para tabela `prioridades`
--

INSERT INTO `prioridades` (`id`, `nome`, `descricao`, `peso`, `status`) VALUES
(1, 'Sem prioridade', 'Atendimento normal', 0, 1),
(2, 'Portador de Deficiência', 'Atendimento prioritáro para portadores de deficiência', 1, 1),
(3, 'Gestante', 'Atendimento prioritáro para gestantes', 1, 1),
(4, 'Idoso', 'Atendimento prioritáro para idosos', 1, 1),
(5, 'Outros', 'Qualquer outra prioridade', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE IF NOT EXISTS `servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `macro_id` int(11) DEFAULT NULL,
  `descricao` varchar(100) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `status` smallint(6) NOT NULL,
  `peso` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `servicos_ibfk_1` (`macro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Fazendo dump de dados para tabela `servicos`
--

INSERT INTO `servicos` (`id`, `macro_id`, `descricao`, `nome`, `status`, `peso`) VALUES
(1, NULL, 'Atendimento ao Seguro Desemprego', 'SEGURO', 1, 1),
(2, NULL, 'ATENDIMENTO', 'ATENDIMENTO', 1, 1),
(4, NULL, 'CARTEIRA', 'CARTEIRA', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `serv_meta`
--

CREATE TABLE IF NOT EXISTS `serv_meta` (
  `servico_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text,
  PRIMARY KEY (`servico_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidades`
--

CREATE TABLE IF NOT EXISTS `unidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `status` smallint(6) NOT NULL,
  `stat_imp` smallint(6) NOT NULL,
  `msg_imp` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `unidades_grupo_id_fkey` (`grupo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Fazendo dump de dados para tabela `unidades`
--

INSERT INTO `unidades` (`id`, `grupo_id`, `codigo`, `nome`, `status`, `stat_imp`, `msg_imp`) VALUES
(1, 2, '1', 'Unidade Padrão', 1, 0, 'Novo SGA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `uni_meta`
--

CREATE TABLE IF NOT EXISTS `uni_meta` (
  `unidade_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text,
  PRIMARY KEY (`unidade_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `uni_serv`
--

CREATE TABLE IF NOT EXISTS `uni_serv` (
  `unidade_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  `local_id` int(11) NOT NULL,
  `sigla` varchar(1) NOT NULL,
  `status` smallint(6) NOT NULL,
  `peso` smallint(6) NOT NULL,
  PRIMARY KEY (`unidade_id`,`servico_id`),
  KEY `uni_serv_ibfk_2` (`servico_id`),
  KEY `uni_serv_ibfk_3` (`local_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `uni_serv`
--

INSERT INTO `uni_serv` (`unidade_id`, `servico_id`, `local_id`, `sigla`, `status`, `peso`) VALUES
(1, 1, 1, 'A', 1, 1),
(1, 2, 1, 'A', 1, 1),
(1, 4, 1, 'A', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `ult_acesso` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Fazendo dump de dados para tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `login`, `nome`, `sobrenome`, `senha`, `ult_acesso`, `status`, `session_id`) VALUES
(1, 'admin', 'administrador', 'sga', '75266f2a5035145ef71d043cc44ef262', '2018-12-20 08:18:11', 1, 'ht6df5pll003se8nditgn4sas7'),
(2, 'thiago', 'thiago', 'ramos', 'e10adc3949ba59abbe56e057f20f883e', '2018-11-12 21:00:58', 1, 'f2dnkcmleq6vre4rio69gbni33'),
(3, 'josuel', 'Josuel', 'Rocínio', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(4, 'rafaela', 'Rafaela', 'Machado', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(5, 'ebenezer', 'Ebenézer', 'Junior', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(6, 'thays', 'Thays', 'Grazielly', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(7, 'maxwell', 'Maxwell', 'Lima', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(8, 'cecilia', 'Cecilia', 'null', '62ef34f4e7b271b4ccdb5cbeb1546fd5', '2018-09-16 08:32:19', 1, 'anusa846q3bh9mq8dp6mpvv227'),
(9, 'wellington', 'Wellington', 'null', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(10, 'gabriel', 'Gabriel', 'null', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(11, 'vitor', 'Vitor', 'null', '62ef34f4e7b271b4ccdb5cbeb1546fd5', '2018-11-12 20:59:17', 1, 'f2dnkcmleq6vre4rio69gbni33'),
(12, 'gustavo', 'Gustavo', 'Vençosa', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(13, 'triagem', 'Triagem', 'triagem', '62ef34f4e7b271b4ccdb5cbeb1546fd5', '2018-09-16 08:40:46', 1, 'anusa846q3bh9mq8dp6mpvv227'),
(14, 'ferista1', 'ferista', 'ferista', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(15, 'ferista2', 'ferista2', 'ferista', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(16, 'ferista3', 'ferista3', 'ferista', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(17, 'ferista4', 'ferista4', 'ferista', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(18, 'ferista5', 'ferista5', 'ferista', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(19, 'ferista6', 'ferista6', 'ferista', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(20, 'ferista7', 'ferista7', 'ferista', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(21, 'ferista8', 'ferista8', 'ferista', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(22, 'ferista9', 'ferista9', 'ferista', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(23, 'ferista10', 'ferista10', 'ferista', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(24, 'natalia.silva', 'Natalia', 'Eliana da Penha Raposo da Silva', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(25, 'luciano.sobrinho', 'Luciano', 'Filizola Sobrinho', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(26, 'iverton.santos', 'Iverton', 'Aguiar dos Santos', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(27, 'roselane.rodrigues', 'Roselane', 'Carmelita da Silva Rodrigues', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(28, 'josefa.feitosa', 'Josefa', 'Cecilia Silva Feitosa', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(29, 'fabiana.silva', 'Fabiana', 'Vila Nova da Silva', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(30, 'anderson.silva', 'Anderson', 'Cavalcanti Silva', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(31, 'claudilene.gomes', 'Claudilene', 'Pereira Gomes', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(32, 'edson.franco', 'Edson', 'Franco', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(33, 'tayrone', 'Tayrone', 'Emanuel', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(34, 'madson', 'Madson', 'Andrey Costa Nascimento', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(35, 'jaqueline', 'Jaqueline', 'Gomes Pessoa Baptista', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(36, 'jandicleise', 'Jandicleise', 'Gomes de Oliveira Alves', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(37, 'micherlli', 'Mecherlli', 'Odilia Juqueira Cavalcanti da Silva Fonseca', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, ''),
(38, 'vanilce', 'Vanilce', 'Melo de França', '62ef34f4e7b271b4ccdb5cbeb1546fd5', NULL, 1, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usu_grup_cargo`
--

CREATE TABLE IF NOT EXISTS `usu_grup_cargo` (
  `usuario_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  PRIMARY KEY (`usuario_id`,`grupo_id`),
  KEY `usu_grup_cargo_ibfk_2` (`grupo_id`),
  KEY `usu_grup_cargo_ibfk_3` (`cargo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `usu_grup_cargo`
--

INSERT INTO `usu_grup_cargo` (`usuario_id`, `grupo_id`, `cargo_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 2),
(4, 2, 2),
(5, 2, 2),
(6, 2, 2),
(7, 2, 2),
(8, 2, 2),
(9, 2, 2),
(10, 2, 2),
(11, 2, 2),
(12, 2, 2),
(14, 2, 2),
(15, 2, 2),
(16, 2, 2),
(17, 2, 2),
(18, 2, 2),
(19, 2, 2),
(20, 2, 2),
(21, 2, 2),
(22, 2, 2),
(23, 2, 2),
(24, 2, 2),
(25, 2, 2),
(26, 2, 2),
(27, 2, 2),
(28, 2, 2),
(29, 2, 2),
(30, 2, 2),
(31, 2, 2),
(32, 2, 2),
(33, 2, 2),
(34, 2, 2),
(35, 2, 2),
(36, 2, 2),
(37, 2, 2),
(38, 2, 2),
(13, 2, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usu_meta`
--

CREATE TABLE IF NOT EXISTS `usu_meta` (
  `usuario_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text,
  PRIMARY KEY (`usuario_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `usu_meta`
--

INSERT INTO `usu_meta` (`usuario_id`, `name`, `value`) VALUES
(1, 'unidade', '1'),
(1, 'atendimento.local', '1'),
(1, 'atendimento.tipo', '1'),
(2, 'unidade', '1'),
(2, 'atendimento.local', '1'),
(2, 'atendimento.tipo', '1'),
(8, 'unidade', '1'),
(8, 'atendimento.local', '1'),
(8, 'atendimento.tipo', '1'),
(13, 'unidade', '1'),
(11, 'unidade', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usu_serv`
--

CREATE TABLE IF NOT EXISTS `usu_serv` (
  `unidade_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`unidade_id`,`servico_id`,`usuario_id`),
  KEY `usu_serv_ibfk_1` (`servico_id`,`unidade_id`),
  KEY `usu_serv_ibfk_2` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `usu_serv`
--

INSERT INTO `usu_serv` (`unidade_id`, `servico_id`, `usuario_id`) VALUES
(1, 2, 2),
(1, 1, 3),
(1, 2, 3),
(1, 4, 3),
(1, 1, 4),
(1, 2, 4),
(1, 4, 4),
(1, 1, 5),
(1, 2, 5),
(1, 4, 5),
(1, 1, 6),
(1, 2, 6),
(1, 4, 6),
(1, 1, 7),
(1, 2, 7),
(1, 4, 7),
(1, 1, 8),
(1, 2, 8),
(1, 1, 9),
(1, 2, 9),
(1, 4, 9),
(1, 1, 10),
(1, 2, 10),
(1, 4, 10),
(1, 1, 11),
(1, 2, 11),
(1, 4, 11),
(1, 1, 12),
(1, 2, 12),
(1, 4, 12),
(1, 1, 14),
(1, 2, 14),
(1, 4, 14),
(1, 1, 15),
(1, 2, 15),
(1, 4, 15),
(1, 1, 16),
(1, 2, 16),
(1, 4, 16),
(1, 1, 17),
(1, 2, 17),
(1, 4, 17),
(1, 1, 18),
(1, 2, 18),
(1, 4, 18),
(1, 1, 19),
(1, 2, 19),
(1, 4, 19),
(1, 1, 20),
(1, 2, 20),
(1, 4, 20),
(1, 1, 21),
(1, 2, 21),
(1, 4, 21),
(1, 1, 22),
(1, 2, 22),
(1, 4, 22),
(1, 1, 23),
(1, 2, 23),
(1, 4, 23),
(1, 1, 24),
(1, 2, 24),
(1, 4, 24),
(1, 1, 25),
(1, 2, 25),
(1, 4, 25),
(1, 1, 26),
(1, 2, 26),
(1, 4, 26),
(1, 1, 27),
(1, 2, 27),
(1, 4, 27),
(1, 1, 28),
(1, 2, 28),
(1, 4, 28),
(1, 1, 29),
(1, 2, 29),
(1, 4, 29),
(1, 1, 30),
(1, 2, 30),
(1, 4, 30),
(1, 1, 31),
(1, 2, 31),
(1, 4, 31),
(1, 1, 32),
(1, 2, 32),
(1, 4, 32),
(1, 1, 33),
(1, 2, 33),
(1, 4, 33),
(1, 1, 34),
(1, 2, 34),
(1, 4, 34),
(1, 1, 35),
(1, 2, 35),
(1, 4, 35),
(1, 1, 36),
(1, 2, 36),
(1, 4, 36),
(1, 1, 37),
(1, 2, 37),
(1, 4, 37),
(1, 1, 38),
(1, 2, 38),
(1, 4, 38);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `view_historico_atendimentos`
--
CREATE TABLE IF NOT EXISTS `view_historico_atendimentos` (
`id` bigint(20)
,`unidade_id` int(11)
,`usuario_id` int(11)
,`usuario_tri_id` int(11)
,`servico_id` int(11)
,`prioridade_id` int(11)
,`atendimento_id` bigint(20)
,`status` int(11)
,`sigla_senha` varchar(1)
,`num_senha` int(11)
,`num_senha_serv` int(11)
,`nm_cli` varchar(100)
,`num_local` smallint(6)
,`dt_cheg` datetime
,`dt_cha` datetime
,`dt_ini` datetime
,`dt_fim` datetime
,`ident_cli` varchar(11)
);
-- --------------------------------------------------------

--
-- Estrutura stand-in para view `view_historico_atend_codif`
--
CREATE TABLE IF NOT EXISTS `view_historico_atend_codif` (
`atendimento_id` bigint(20)
,`servico_id` int(11)
,`valor_peso` smallint(6)
);
-- --------------------------------------------------------

--
-- Estrutura stand-in para view `view_historico_atend_meta`
--
CREATE TABLE IF NOT EXISTS `view_historico_atend_meta` (
`atendimento_id` bigint(20)
,`name` varchar(50)
,`value` text
);
-- --------------------------------------------------------

--
-- Estrutura para view `view_historico_atendimentos`
--
DROP TABLE IF EXISTS `view_historico_atendimentos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`novosga`@`%` SQL SECURITY DEFINER VIEW `view_historico_atendimentos` AS select `atendimentos`.`id` AS `id`,`atendimentos`.`unidade_id` AS `unidade_id`,`atendimentos`.`usuario_id` AS `usuario_id`,`atendimentos`.`usuario_tri_id` AS `usuario_tri_id`,`atendimentos`.`servico_id` AS `servico_id`,`atendimentos`.`prioridade_id` AS `prioridade_id`,`atendimentos`.`atendimento_id` AS `atendimento_id`,`atendimentos`.`status` AS `status`,`atendimentos`.`sigla_senha` AS `sigla_senha`,`atendimentos`.`num_senha` AS `num_senha`,`atendimentos`.`num_senha_serv` AS `num_senha_serv`,`atendimentos`.`nm_cli` AS `nm_cli`,`atendimentos`.`num_local` AS `num_local`,`atendimentos`.`dt_cheg` AS `dt_cheg`,`atendimentos`.`dt_cha` AS `dt_cha`,`atendimentos`.`dt_ini` AS `dt_ini`,`atendimentos`.`dt_fim` AS `dt_fim`,`atendimentos`.`ident_cli` AS `ident_cli` from `atendimentos` union all select `historico_atendimentos`.`id` AS `id`,`historico_atendimentos`.`unidade_id` AS `unidade_id`,`historico_atendimentos`.`usuario_id` AS `usuario_id`,`historico_atendimentos`.`usuario_tri_id` AS `usuario_tri_id`,`historico_atendimentos`.`servico_id` AS `servico_id`,`historico_atendimentos`.`prioridade_id` AS `prioridade_id`,`historico_atendimentos`.`atendimento_id` AS `atendimento_id`,`historico_atendimentos`.`status` AS `status`,`historico_atendimentos`.`sigla_senha` AS `sigla_senha`,`historico_atendimentos`.`num_senha` AS `num_senha`,`historico_atendimentos`.`num_senha_serv` AS `num_senha_serv`,`historico_atendimentos`.`nm_cli` AS `nm_cli`,`historico_atendimentos`.`num_local` AS `num_local`,`historico_atendimentos`.`dt_cheg` AS `dt_cheg`,`historico_atendimentos`.`dt_cha` AS `dt_cha`,`historico_atendimentos`.`dt_ini` AS `dt_ini`,`historico_atendimentos`.`dt_fim` AS `dt_fim`,`historico_atendimentos`.`ident_cli` AS `ident_cli` from `historico_atendimentos`;

-- --------------------------------------------------------

--
-- Estrutura para view `view_historico_atend_codif`
--
DROP TABLE IF EXISTS `view_historico_atend_codif`;

CREATE ALGORITHM=UNDEFINED DEFINER=`novosga`@`%` SQL SECURITY DEFINER VIEW `view_historico_atend_codif` AS select `atend_codif`.`atendimento_id` AS `atendimento_id`,`atend_codif`.`servico_id` AS `servico_id`,`atend_codif`.`valor_peso` AS `valor_peso` from `atend_codif` union all select `historico_atend_codif`.`atendimento_id` AS `atendimento_id`,`historico_atend_codif`.`servico_id` AS `servico_id`,`historico_atend_codif`.`valor_peso` AS `valor_peso` from `historico_atend_codif`;

-- --------------------------------------------------------

--
-- Estrutura para view `view_historico_atend_meta`
--
DROP TABLE IF EXISTS `view_historico_atend_meta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`novosga`@`%` SQL SECURITY DEFINER VIEW `view_historico_atend_meta` AS select `atend_meta`.`atendimento_id` AS `atendimento_id`,`atend_meta`.`name` AS `name`,`atend_meta`.`value` AS `value` from `atend_meta` union all select `historico_atend_meta`.`atendimento_id` AS `atendimento_id`,`historico_atend_meta`.`name` AS `name`,`historico_atend_meta`.`value` AS `value` from `historico_atend_meta`;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `cargos_mod_perm`
--
ALTER TABLE `cargos_mod_perm`
  ADD CONSTRAINT `cargos_mod_perm_ibfk_1` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`),
  ADD CONSTRAINT `cargos_mod_perm_ibfk_2` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`);

--
-- Restrições para tabelas `contador`
--
ALTER TABLE `contador`
  ADD CONSTRAINT `contador_ibfk_1` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`);

--
-- Restrições para tabelas `paineis`
--
ALTER TABLE `paineis`
  ADD CONSTRAINT `paineis_ibfk_1` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`);

--
-- Restrições para tabelas `paineis_servicos`
--
ALTER TABLE `paineis_servicos`
  ADD CONSTRAINT `paineis_servicos_ibfk_1` FOREIGN KEY (`host`) REFERENCES `paineis` (`host`),
  ADD CONSTRAINT `paineis_servicos_ibfk_2` FOREIGN KEY (`unidade_id`, `servico_id`) REFERENCES `uni_serv` (`unidade_id`, `servico_id`);

--
-- Restrições para tabelas `painel_senha`
--
ALTER TABLE `painel_senha`
  ADD CONSTRAINT `painel_senha_ibfk_1` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`),
  ADD CONSTRAINT `painel_senha_ibfk_2` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`);

--
-- Restrições para tabelas `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `servicos_ibfk_1` FOREIGN KEY (`macro_id`) REFERENCES `servicos` (`id`);

--
-- Restrições para tabelas `unidades`
--
ALTER TABLE `unidades`
  ADD CONSTRAINT `unidades_grupo_id_fkey` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`);

--
-- Restrições para tabelas `uni_serv`
--
ALTER TABLE `uni_serv`
  ADD CONSTRAINT `uni_serv_ibfk_1` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`),
  ADD CONSTRAINT `uni_serv_ibfk_2` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`),
  ADD CONSTRAINT `uni_serv_ibfk_3` FOREIGN KEY (`local_id`) REFERENCES `locais` (`id`);

--
-- Restrições para tabelas `usu_grup_cargo`
--
ALTER TABLE `usu_grup_cargo`
  ADD CONSTRAINT `usu_grup_cargo_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `usu_grup_cargo_ibfk_2` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`),
  ADD CONSTRAINT `usu_grup_cargo_ibfk_3` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`);

--
-- Restrições para tabelas `usu_serv`
--
ALTER TABLE `usu_serv`
  ADD CONSTRAINT `usu_serv_ibfk_1` FOREIGN KEY (`servico_id`, `unidade_id`) REFERENCES `uni_serv` (`servico_id`, `unidade_id`),
  ADD CONSTRAINT `usu_serv_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
