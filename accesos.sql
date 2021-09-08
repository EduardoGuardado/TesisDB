CREATE DATABASE AccesosUsuario;
    USE DATABASE AccesosUsuario;
    CREATE TABLE roles
        (
            idRol INT PRIMARY KEY NOT NULL AUTO_INCREMENT ,
            rol   VARCHAR(16)
        )
        ENGINE=INNODB
    ;
    
    CREATE TABLE usuarios
        (
            idUsuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT ,
            nombre    VARCHAR(50)                             ,
            usuario   VARCHAR(35)                             ,
            clave     VARCHAR(45)                             ,
            id_rol    INT                                     ,
            FOREIGN KEY (idRol) REFERENCES roles(idRol)
        )
        ENGINE=INNODB
    ;
    
    CREATE TABLE materias
        (
            idMateria INT PRIMARY KEY NOT NULL AUTO_INCREMENT ,
            nombre    VARCHAR(20)
        )
        ENGINE=INNODB
    ;
    
    CREATE TABLE grados
        (
            idGrado INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
            Nombre  VARCHAR(11)                            ,
            Nivel   VARCHAR(20)
        )
        ENGINE=INNODB
    ;
    
    CREATE TABLE planificaciones
        (
            idPlanificacion INT PRIMARY KEY NOT NULL AUTO_INCREMENT ,
            idUsuario       INT                                     ,
            idMateria       INT                                     ,
            anio            DATE                                    ,
            nivel           VARCHAR(20)                             ,
            FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario)  ,
            FOREIGN KEY (idMateria) REFERENCES materias(idMateria)
        )
        ENGINE=INNODB
    ;
    
    CREATE TABLE plandetalles
        (
            idPlandetalle   INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
            idPlanificacion INT                                    ,
            desde           DATE                                   ,
            hasta           DATE                                   ,
            unidad          VARCHAR(22)                            ,
            contenido       VARCHAR(22)                            ,
            ejecutado ENUM('si','no')                              ,
            FOREIGN KEY (idPlanificacion) REFERENCES planificaciones(idPlanificacion)
        )
        ENGINE=INNODB
    ;
    
    CREATE TABLE recursos
        (
            idRecurso     INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
            idPlandetalle INT                                    ,
            tipo ENUM('enlace','archivo')
        )
        ENGINE=INNODB
    ;
    
    CREATE TABLE recursoDetalle
        (
            idRecursoDetalle INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
            idRecurso        INT                                    ,
            recurso          VARCHAR(20)                            ,
            FOREIGN KEY (idRecurso) REFERENCES recursos(idRecurso)
        )
        ENGINE=INNODB
    ;
    
    CREATE TABLE programas
        (
            idPrograma INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
            idMateria  INT                                    ,
            nivel      VARCHAR(20)                            ,
            FOREIGN KEY (idMateria) REFERENCES materias(idMateria)
        )
        ENGINE=INNODB
    ;
    
    CREATE TABLE programaDetalle
        (
            idProgramadetalle INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
            idPrograma        INT                                    ,
            unidad            VARCHAR(20)                            ,
            numeroContenido DOUBLE(2.2)                              ,
            contenido VARCHAR(20)                                    ,
            FOREIGN KEY (idPrograma) REFERENCES programas(idPrograma)
        )
        ENGINE=INNODB
    ;
    
    INSERT INTO roles
        (rol
        )
        values
        ('Director'
        )
        ,
        ('Profesor'
        )
    ;
    
    INSERT INTO usuarios
        (nombre     ,
            usuario ,
            clave   ,
            id_rol
        )
        values
        ('Eduardo'   ,
            'Ed'     ,
            '123456' ,
            2
        )
        ,
        ('Urrutia'   ,
            'Ut'     ,
            '123456' ,
            1
        )
    ;