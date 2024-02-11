CREATE TABLE `Socios` (
	`id_socio` INT(10) NOT NULL AUTO_INCREMENT,
	`nome` varchar(255) NOT NULL,
	`logradouro` varchar(255) NOT NULL,
	`cidade` varchar(255) NOT NULL,
	`estado` varchar(50) NOT NULL,
	`data_nascimento` DATE(10) NOT NULL,
	`idade` INT(3) NOT NULL,
	PRIMARY KEY (`id_socio`)
);

CREATE TABLE `Pilotos` (
	`id_brevet` INT(20) NOT NULL AUTO_INCREMENT,
	`fk_socio` INT(20) NOT NULL,
	PRIMARY KEY (`id_brevet`)
);

CREATE TABLE `Alunos` (
	`id_aluno` INT(10) NOT NULL AUTO_INCREMENT,
	`fk_socio` INT(10) NOT NULL,
	`horas_voo` INT(10) NOT NULL,
	PRIMARY KEY (`id_aluno`)
);

CREATE TABLE `Instrutores` (
	`id_instrutor` INT(20) NOT NULL AUTO_INCREMENT,
	`fk_socio` INT(20) NOT NULL,
	`fk_brevet` INT(20) NOT NULL,
	`nome_curso` varchar(255) NOT NULL,
	`data_diploma` DATE(10) NOT NULL,
	`instituicao` varchar(255) NOT NULL,
	PRIMARY KEY (`id_instrutor`)
);

CREATE TABLE `Saidas` (
	`id_saida` INT(10) NOT NULL AUTO_INCREMENT,
	`fk_aluno` INT(10) NOT NULL,
	`data_saida` DATE(10) NOT NULL,
	`hora_saida` TIME(8) NOT NULL,
	`data_chegada` DATE(10) NOT NULL,
	`hora_chegada` TIME(8) NOT NULL,
	`parecer_instrutor` varchar(1000) NOT NULL,
	PRIMARY KEY (`id_saida`)
);


ALTER TABLE `Pilotos` ADD CONSTRAINT `Pilotos_fk0` FOREIGN KEY (`fk_socio`) REFERENCES `Socios`(`id_socio`);
ALTER TABLE `Alunos` ADD CONSTRAINT `Alunos_fk0` FOREIGN KEY (`fk_socio`) REFERENCES `Socios`(`id_socio`);
ALTER TABLE `Instrutores` ADD CONSTRAINT `Instrutores_fk0` FOREIGN KEY (`fk_socio`) REFERENCES `Socios`(`id_socio`);
ALTER TABLE `Instrutores` ADD CONSTRAINT `Instrutores_fk1` FOREIGN KEY (`fk_brevet`) REFERENCES `Pilotos`(`id_brevet`);
ALTER TABLE `Saidas` ADD CONSTRAINT `Saidas_fk0` FOREIGN KEY (`fk_aluno`) REFERENCES `Alunos`(`id_aluno`);






