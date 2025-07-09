# Proyecto de Automatización QA - ServeRest API

Este repositorio contiene una suite de pruebas automatizadas para la API de Usuarios de ServeRest (https://serverest.dev/) utilizando Karate DSL. El objetivo es gestionar los usuarios a través de las operaciones CRUD (Crear, Buscar, Actualizar, Eliminar) y validar las respuestas de la API.

## Requisitos Previos

- **Java**: Versión 11 o superior. //Se utilizo Java 17
- **Maven**: Versión 3.6.0 o superior.
- **Git**: Para clonar el repositorio.
- **Acceso a internet**: Para interactuar con la API de ServeRest.


## Configuración

1. **Clonar el repositorio**:
   git clone https://github.com/lramirezv1/karate-proyecto.git

   
2. **Instalar dependencias**:   
   mvn clean install

## Estructura del Proyecto 

**karate-proyecto/**
├── target/
│   └── karate-reports/
│       ├── karate-summary.html
│       └── com.ramirez.tests.sample.html
├── src/
│   └── test/
│       └── java/
│           └── karate-config.js
│           └── com/ramirez/
│               ├── KarateTests.java
│               └─  tests/
│                   └── sample.feature
├── pom.xml
└─── README.md


src/test/java/: Contiene karate-config.js donde configuramos la url base.
src/test/java/com/ramirez/: Contiene la clase de ejecución KarateTest.java.
src/test/java/com/ramirez/test/: Contiene los archivos .feature con los escenarios de prueba.
sample.feature: Incluye los tests para Servicios de usuarios.
pom.xml: Configuración de Maven con la dependencia de Karate.  

   

## Ejecución de las Pruebas   

1. **Ejecutar todas las pruebas**:
   mvn clean test
   
2. **Ver los reportes**:   
   ../ruta_proyecto/target/karate-reports/karate-summary.html
   
   donde ruta_proyecto es la ubicacion donde esta el proycto alojado 