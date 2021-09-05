create table marca_moto
(
    cod_marca          INTEGER               not null,
    desc_marca         VARCHAR(200)          not null,
    primary key (cod_marca)
);



create table origen
(
    cod_origen         VARCHAR(100)          not null,
    desc_origen        VARCHAR(200)          not null,
    primary key (cod_origen)
);



create table localidad
(
    cod_pos            VARCHAR(10)           not null,
    desc_localidad     VARCHAR(100)          not null,
    primary key (cod_pos)
);



create table modelo_moto
(
    cod_mod            INTEGER               not null,
    cod_marca          INTEGER               not null,
    cod_origen         VARCHAR(100)                  ,
    desc_mod           VARCHAR(200)          not null,
    primary key (cod_mod),
    foreign key  (cod_marca)
       references marca_moto (cod_marca),
    foreign key  (cod_origen)
       references origen (cod_origen)
);



create table repuesto
(
    cod_rep            INTEGER               not null,
    cod_origen         VARCHAR(100)                  ,
    desc_rep           VARCHAR(200)          not null,
    precio_vnta        DECIMAL(10,2)         not null,
    primary key (cod_rep),
    foreign key  (cod_origen)
       references origen (cod_origen)
);


create table domicilio
(
    cod_dom            VARCHAR(200)          not null,
    cod_pos            VARCHAR(10)           not null,
    calle_dom          VARCHAR(100)          not null,
    altura_dom         VARCHAR(5)            not null,
    piso_dom           VARCHAR(30)                   ,
    primary key (cod_dom),
    foreign key  (cod_pos)
       references localidad (cod_pos)
);



create table proveedores
(
    cod_prov           INTEGER               not null,
    cod_dom            VARCHAR(200)          not null,
    nombre_prov        VARCHAR(100)          not null,
    denominacion_prov  VARCHAR(200)          not null,
    telefono_prov      NUMERIC(20)           not null,
    primary key (cod_prov),
    foreign key  (cod_dom)
       references domicilio (cod_dom)
);

create unique index proveedores_PK on proveedores (cod_prov asc);

create index prov_dom_FK on proveedores (cod_dom asc);

create table lista_prov_art
(
    cod_rep            INTEGER               not null,
    cod_prov           INTEGER               not null,
    "fecha-ult-comp"   DATE                  not null,
    cant_comp          VARCHAR(200)          not null,
    precio_comp        DECIMAL(10,2)         not null,
    primary key (cod_rep, cod_prov),
    foreign key  (cod_prov)
       references proveedores (cod_prov),
    foreign key  (cod_rep)
       references repuesto (cod_rep)
);



create table repuesto_modelo
(
    cod_rep            INTEGER               not null,
    cod_mod            INTEGER               not null,
    primary key (cod_rep, cod_mod),
    foreign key  (cod_rep)
       references repuesto (cod_rep),
    foreign key  (cod_mod)
       references modelo_moto (cod_mod)
);



