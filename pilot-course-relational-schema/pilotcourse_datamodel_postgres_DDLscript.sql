CREATE TABLE "public.Socios" (
	"id_socio" serial(10),
	"nome" varchar(255) NOT NULL,
	"logradouro" varchar(255) NOT NULL,
	"cidade" varchar(255) NOT NULL,
	"estado" varchar(50) NOT NULL,
	"data_nascimento" DATE(10) NOT NULL,
	"idade" integer(3) NOT NULL,
	CONSTRAINT "Socios_pk" PRIMARY KEY ("id_socio")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.Pilotos" (
	"id_brevet" serial(20),
	"fk_socio" integer(20) NOT NULL,
	CONSTRAINT "Pilotos_pk" PRIMARY KEY ("id_brevet")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.Alunos" (
	"id_aluno" serial(10),
	"fk_socio" integer(10) NOT NULL,
	"horas_voo" integer(10) NOT NULL,
	CONSTRAINT "Alunos_pk" PRIMARY KEY ("id_aluno")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.Instrutores" (
	"id_instrutor" serial(20) NOT NULL,
	"fk_socio" integer(20) NOT NULL,
	"fk_brevet" integer(20) NOT NULL,
	"nome_curso" varchar(255) NOT NULL,
	"data_diploma" DATE(10) NOT NULL,
	"instituicao" varchar(255) NOT NULL,
	CONSTRAINT "Instrutores_pk" PRIMARY KEY ("id_instrutor")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.Saidas" (
	"id_saida" serial(10) NOT NULL,
	"fk_aluno" integer(10) NOT NULL,
	"data_saida" DATE(10) NOT NULL,
	"hora_saida" TIME(8) NOT NULL,
	"data_chegada" DATE(10) NOT NULL,
	"hora_chegada" TIME(8) NOT NULL,
	"parecer_instrutor" varchar(1000) NOT NULL,
	CONSTRAINT "Saidas_pk" PRIMARY KEY ("id_saida")
) WITH (
  OIDS=FALSE
);


ALTER TABLE "Pilotos" ADD CONSTRAINT "Pilotos_fk0" FOREIGN KEY ("fk_socio") REFERENCES "Socios"("id_socio");
ALTER TABLE "Alunos" ADD CONSTRAINT "Alunos_fk0" FOREIGN KEY ("fk_socio") REFERENCES "Socios"("id_socio");
ALTER TABLE "Instrutores" ADD CONSTRAINT "Instrutores_fk0" FOREIGN KEY ("fk_socio") REFERENCES "Socios"("id_socio");
ALTER TABLE "Instrutores" ADD CONSTRAINT "Instrutores_fk1" FOREIGN KEY ("fk_brevet") REFERENCES "Pilotos"("id_brevet");
ALTER TABLE "Saidas" ADD CONSTRAINT "Saidas_fk0" FOREIGN KEY ("fk_aluno") REFERENCES "Alunos"("id_aluno");

