CREATE TABLE Usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido_materno VARCHAR(50) NOT NULL,
  apellido_paterno VARCHAR(50) NOT NULL,
  grado_escolaridad VARCHAR(100) NOT NULL,
  institucion VARCHAR(100) NOT NULL,
  puesto VARCHAR(100) NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  pais VARCHAR(50) NOT NULL,
  ciudad VARCHAR(50) NOT NULL,
  estado VARCHAR(50) NOT NULL,
  password VARCHAR(20) NOT NULL,
  es_organizador TINYINT NOT NULL,
  es_evaluador TINYINT NOT NULL,
  es_ponente TINYINT NOT NULL
);

CREATE TABLE EjesTematicos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Ponencias (
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL,
  resumen VARCHAR(500) NOT NULL,
  archivo VARCHAR(100) NOT NULL,
  id_ejes_tematicos INT NOT NULL,
  id_ponente INT NOT NULL,
  estado ENUM('ENVIADA', 'ACEPTADA', 'RECHAZADA', 'REVISIÓN') NOT NULL,
  intentos_evaluacion INT NOT NULL DEFAULT 0,
  FOREIGN KEY (id_ejes_tematicos) REFERENCES EjesTematicos(id),
  FOREIGN KEY (id_ponente) REFERENCES Usuarios(id)  
);

CREATE TABLE Evaluaciones (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_ponencia INT NOT NULL,
  id_evaluador INT NOT NULL,
  resultado ENUM('ACEPTADA', 'RECHAZADA', 'REVISIÓN') NOT NULL,
  observaciones VARCHAR(500) NOT NULL,
  fecha DATE NOT NULL,
  FOREIGN KEY (id_ponencia) REFERENCES Ponencias(id),
  FOREIGN KEY (id_evaluador) REFERENCES Usuarios(id)
);

CREATE TABLE EvaluadoresEjes (
  id_evaluador INT NOT NULL,
  id_ejes INT NOT NULL,
  PRIMARY KEY (id_evaluador, id_ejes),
  FOREIGN KEY (id_evaluador) REFERENCES Usuarios(id),
  FOREIGN KEY (id_ejes) REFERENCES EjesTematicos(id)
);