CREATE TABLE clase (
    id_clase             NUMBER(10) NOT NULL,
    horario              VARCHAR2(25),
    aula                 VARCHAR2(25),
    profesor_id_profesor NUMBER(25) NOT NULL,
    curso_id_curso       NUMBER(10) NOT NULL
);

ALTER TABLE clase ADD CONSTRAINT clase_pk PRIMARY KEY ( id_clase );

CREATE TABLE curso (
    id_curso NUMBER(10) NOT NULL,
    nombre   VARCHAR2(40),
    nivel    VARCHAR2(25)
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( id_curso );

CREATE TABLE estudiante (
    persona_id_persona NUMBER(10) NOT NULL,
    matricula          VARCHAR2(25) NOT NULL,
    id_estudiante      NUMBER(25) NOT NULL,
    grado              VARCHAR2(15) NOT NULL
);

ALTER TABLE estudiante ADD CONSTRAINT estudiante_pk PRIMARY KEY ( id_estudiante );

CREATE TABLE inscripcion (
    id_curso                 NUMBER(10) NOT NULL,
    fecha_inscripcion        DATE,
    estudiante_id_estudiante NUMBER(25) NOT NULL,
    curso_id_curso           NUMBER(10) NOT NULL
);

ALTER TABLE inscripcion ADD CONSTRAINT inscripcion_pk PRIMARY KEY ( id_curso );

CREATE TABLE persona (
    id_persona       NUMBER(10) NOT NULL,
    nombre           VARCHAR2(25),
    apellido         VARCHAR2(25),
    fecha_nacimiento DATE
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( id_persona );

CREATE TABLE profesor (
    id_profesor          NUMBER(25) NOT NULL,
    titulo               VARCHAR2(25),
    especialidad         VARCHAR2(25),
    persona_id_persona   NUMBER(10) NOT NULL,
    profesor_id_profesor NUMBER(25)
);

ALTER TABLE profesor ADD CONSTRAINT profesor_pk PRIMARY KEY ( id_profesor );

ALTER TABLE clase
    ADD CONSTRAINT clase_curso_fk FOREIGN KEY ( curso_id_curso )
        REFERENCES curso ( id_curso );

ALTER TABLE clase
    ADD CONSTRAINT clase_profesor_fk FOREIGN KEY ( profesor_id_profesor )
        REFERENCES profesor ( id_profesor );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE inscripcion
    ADD CONSTRAINT inscripcion_curso_fk FOREIGN KEY ( curso_id_curso )
        REFERENCES curso ( id_curso );

ALTER TABLE inscripcion
    ADD CONSTRAINT inscripcion_estudiante_fk FOREIGN KEY ( estudiante_id_estudiante )
        REFERENCES estudiante ( id_estudiante );

ALTER TABLE profesor
    ADD CONSTRAINT profesor_mentor_fk FOREIGN KEY ( profesor_id_profesor )
        REFERENCES profesor ( id_profesor );

ALTER TABLE profesor
    ADD CONSTRAINT profesor_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );