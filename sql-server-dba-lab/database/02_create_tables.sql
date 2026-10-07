## Creacion de tablas para Lab01
## Descripcion: Tablas principales para el laboratorio DBA Jr.

USE Lab01;
GO

CREATE TABLE departamentos (
    id_departamento INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
GO

CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    puesto VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    id_departamento INT NOT NULL,

    CONSTRAINT FK_empleados_departamentos
        FOREIGN KEY (id_departamento)
        REFERENCES departamentos(id_departamento)
);
GO

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    email VARCHAR(150),
    ciudad VARCHAR(100)
);
GO

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha_venta DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    estado VARCHAR(30) NOT NULL,

    CONSTRAINT FK_ventas_clientes
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT FK_ventas_empleados
        FOREIGN KEY (id_empleado)
        REFERENCES empleados(id_empleado)
);
GO

CREATE TABLE detalle_ventas (
    id_detalle INT PRIMARY KEY,
    id_venta INT NOT NULL,
    producto VARCHAR(150) NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_detalle_ventas
        FOREIGN KEY (id_venta)
        REFERENCES ventas(id_venta)
);
GO
