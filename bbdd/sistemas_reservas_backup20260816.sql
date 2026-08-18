/*
 Navicat Premium Dump SQL

 Source Server         : lamp-mysql
 Source Server Type    : MySQL
 Source Server Version : 110803 (11.8.3-MariaDB-ubu2404)
 Source Host           : 127.0.0.1:3306
 Source Schema         : sistemas_reservas

 Target Server Type    : MySQL
 Target Server Version : 110803 (11.8.3-MariaDB-ubu2404)
 File Encoding         : 65001

 Date: 16/08/2026 16:52:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for core_config_email
-- ----------------------------
DROP TABLE IF EXISTS `core_config_email`;
CREATE TABLE `core_config_email` (
  `idConfigEmail` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idConfigEmail`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_config_email
-- ----------------------------
BEGIN;
INSERT INTO `core_config_email` (`idConfigEmail`, `Nombre`) VALUES (1, 'Email SMTP');
INSERT INTO `core_config_email` (`idConfigEmail`, `Nombre`) VALUES (2, 'Email Gmail');
INSERT INTO `core_config_email` (`idConfigEmail`, `Nombre`) VALUES (3, 'Email Sending Blue');
COMMIT;

-- ----------------------------
-- Table structure for core_config_map
-- ----------------------------
DROP TABLE IF EXISTS `core_config_map`;
CREATE TABLE `core_config_map` (
  `idConfigMap` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idConfigMap`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_config_map
-- ----------------------------
BEGIN;
INSERT INTO `core_config_map` (`idConfigMap`, `Nombre`) VALUES (1, 'Google Maps');
INSERT INTO `core_config_map` (`idConfigMap`, `Nombre`) VALUES (2, 'Leafet');
COMMIT;

-- ----------------------------
-- Table structure for core_estados
-- ----------------------------
DROP TABLE IF EXISTS `core_estados`;
CREATE TABLE `core_estados` (
  `idEstado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Color` varchar(255) NOT NULL,
  PRIMARY KEY (`idEstado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_estados
-- ----------------------------
BEGIN;
INSERT INTO `core_estados` (`idEstado`, `Nombre`, `Color`) VALUES (1, 'Activo', 'bg-success');
INSERT INTO `core_estados` (`idEstado`, `Nombre`, `Color`) VALUES (2, 'Inactivo', 'bg-danger');
COMMIT;

-- ----------------------------
-- Table structure for core_iconos_colores
-- ----------------------------
DROP TABLE IF EXISTS `core_iconos_colores`;
CREATE TABLE `core_iconos_colores` (
  `idColor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idColor`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_iconos_colores
-- ----------------------------
BEGIN;
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (1, 'text-color-red');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (2, 'text-color-red-light');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (3, 'text-color-red-dark');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (4, 'text-color-blue');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (5, 'text-color-blue-light');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (6, 'text-color-blue-dark');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (7, 'text-color-green');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (8, 'text-color-green-light');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (9, 'text-color-green-dark');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (10, 'text-color-yellow');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (11, 'text-color-yellow-light');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (12, 'text-color-yellow-dark');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (13, 'text-color-white');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (14, 'text-color-dark');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (15, 'text-color-dark-light');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (16, 'text-color-dark-dark');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (17, 'text-color-gray');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (18, 'text-color-gray-light');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (19, 'text-color-gray-dark');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (20, 'text-color-mdb-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (21, 'text-color-red-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (22, 'text-color-pink-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (23, 'text-color-purple-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (24, 'text-color-deep-purple-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (25, 'text-color-indigo-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (26, 'text-color-blue-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (27, 'text-color-light-blue-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (28, 'text-color-cyan-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (29, 'text-color-teal-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (30, 'text-color-green-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (31, 'text-color-light-green-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (32, 'text-color-lime-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (33, 'text-color-yellow-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (34, 'text-color-amber-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (35, 'text-color-orange-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (36, 'text-color-deep-orange-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (37, 'text-color-brown-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (38, 'text-color-blue-grey-text');
INSERT INTO `core_iconos_colores` (`idColor`, `Nombre`) VALUES (39, 'text-color-grey-text');
COMMIT;

-- ----------------------------
-- Table structure for core_permisos_categorias
-- ----------------------------
DROP TABLE IF EXISTS `core_permisos_categorias`;
CREATE TABLE `core_permisos_categorias` (
  `idPermisosCat` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `Icon` varchar(120) NOT NULL,
  `IdIconColor` int(10) unsigned NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Carpeta` varchar(255) NOT NULL,
  PRIMARY KEY (`idPermisosCat`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Administrador';

-- ----------------------------
-- Records of core_permisos_categorias
-- ----------------------------
BEGIN;
INSERT INTO `core_permisos_categorias` (`idPermisosCat`, `Nombre`, `Icon`, `IdIconColor`, `Descripcion`, `Carpeta`) VALUES (1, 'Administración', 'bi bi-card-list', 4, 'Categoria para la administracion', 'administracion');
INSERT INTO `core_permisos_categorias` (`idPermisosCat`, `Nombre`, `Icon`, `IdIconColor`, `Descripcion`, `Carpeta`) VALUES (2, 'Mantencion', 'bi bi-wrench', 3, 'Categoria para las transacciones de mantenimiento', 'mantencion');
INSERT INTO `core_permisos_categorias` (`idPermisosCat`, `Nombre`, `Icon`, `IdIconColor`, `Descripcion`, `Carpeta`) VALUES (3, 'Reservas', 'bi bi-bell', 7, 'Categoria para las reservas de ubicaciones', 'reservas');
INSERT INTO `core_permisos_categorias` (`idPermisosCat`, `Nombre`, `Icon`, `IdIconColor`, `Descripcion`, `Carpeta`) VALUES (4, 'Informes', 'bi bi-graph-up', 29, 'Informes y reportes', 'informes');
COMMIT;

-- ----------------------------
-- Table structure for core_permisos_listado
-- ----------------------------
DROP TABLE IF EXISTS `core_permisos_listado`;
CREATE TABLE `core_permisos_listado` (
  `idPermisos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idPermisosCat` int(10) unsigned NOT NULL,
  `idEstado` int(10) unsigned NOT NULL,
  `idTipo` int(10) unsigned NOT NULL,
  `Nombre` varchar(120) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `idLevelLimit` int(10) unsigned NOT NULL,
  `RutaWeb` varchar(255) NOT NULL,
  `RutaController` varchar(255) NOT NULL,
  PRIMARY KEY (`idPermisos`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Administrador';

-- ----------------------------
-- Records of core_permisos_listado
-- ----------------------------
BEGIN;
INSERT INTO `core_permisos_listado` (`idPermisos`, `idPermisosCat`, `idEstado`, `idTipo`, `Nombre`, `Descripcion`, `idLevelLimit`, `RutaWeb`, `RutaController`) VALUES (1, 1, 1, 2, 'Datos de la Empresa', 'Permite administrar los datos de la empresa', 2, 'administracion/sistema', 'coreSistema');
INSERT INTO `core_permisos_listado` (`idPermisos`, `idPermisosCat`, `idEstado`, `idTipo`, `Nombre`, `Descripcion`, `idLevelLimit`, `RutaWeb`, `RutaController`) VALUES (2, 1, 1, 2, 'Usuarios - Listado', 'Permite la administracion de los usuarios al interior de la plataforma', 3, 'administracion/usuarios', 'usuariosListado');
INSERT INTO `core_permisos_listado` (`idPermisos`, `idPermisosCat`, `idEstado`, `idTipo`, `Nombre`, `Descripcion`, `idLevelLimit`, `RutaWeb`, `RutaController`) VALUES (3, 2, 1, 1, 'Espacios - Categorias', 'Permite la administracion de las categorias de los espacios', 4, 'mantencion/espacios/categorias', 'espaciosCategorias');
INSERT INTO `core_permisos_listado` (`idPermisos`, `idPermisosCat`, `idEstado`, `idTipo`, `Nombre`, `Descripcion`, `idLevelLimit`, `RutaWeb`, `RutaController`) VALUES (4, 2, 1, 2, 'Espacios - Listado', 'Permite la administracion de los espacios', 4, 'mantencion/espacios/listado', 'espaciosListado');
INSERT INTO `core_permisos_listado` (`idPermisos`, `idPermisosCat`, `idEstado`, `idTipo`, `Nombre`, `Descripcion`, `idLevelLimit`, `RutaWeb`, `RutaController`) VALUES (5, 2, 1, 1, 'Estados - Listado', 'Permite la administracion de los estados de las reservas', 4, 'mantencion/estados/listado', 'estadosListado');
INSERT INTO `core_permisos_listado` (`idPermisos`, `idPermisosCat`, `idEstado`, `idTipo`, `Nombre`, `Descripcion`, `idLevelLimit`, `RutaWeb`, `RutaController`) VALUES (6, 2, 1, 1, 'Periodicidad - Listado', 'Permite la administracion de la Periodicidad de las Reservas', 4, 'mantencion/periodicidad/listado', 'periodicidadListado');
INSERT INTO `core_permisos_listado` (`idPermisos`, `idPermisosCat`, `idEstado`, `idTipo`, `Nombre`, `Descripcion`, `idLevelLimit`, `RutaWeb`, `RutaController`) VALUES (7, 2, 1, 1, 'Recursos - Listado', 'Permite la administracion de los Recursos de las Reservas', 4, 'mantencion/recursos/listado', 'recursosListado');
INSERT INTO `core_permisos_listado` (`idPermisos`, `idPermisosCat`, `idEstado`, `idTipo`, `Nombre`, `Descripcion`, `idLevelLimit`, `RutaWeb`, `RutaController`) VALUES (8, 2, 1, 1, 'Unidades - Listado', 'Permite la administracion de las Unidades de las Reservas', 4, 'mantencion/unidades/listado', 'unidadesListado');
INSERT INTO `core_permisos_listado` (`idPermisos`, `idPermisosCat`, `idEstado`, `idTipo`, `Nombre`, `Descripcion`, `idLevelLimit`, `RutaWeb`, `RutaController`) VALUES (9, 1, 1, 2, 'Solicitantes - Listado', 'Permite administrar los Solicitantes', 4, 'administracion/solicitantes/listado', 'solicitantesListado');
INSERT INTO `core_permisos_listado` (`idPermisos`, `idPermisosCat`, `idEstado`, `idTipo`, `Nombre`, `Descripcion`, `idLevelLimit`, `RutaWeb`, `RutaController`) VALUES (10, 3, 1, 2, 'Reservas - Listado', 'Permite administrar las Reservas', 4, 'reservas/reservas/listado', 'reservasListado');
INSERT INTO `core_permisos_listado` (`idPermisos`, `idPermisosCat`, `idEstado`, `idTipo`, `Nombre`, `Descripcion`, `idLevelLimit`, `RutaWeb`, `RutaController`) VALUES (11, 4, 1, 3, 'Informe Solicitudes', 'Permite visualizar la información consolidada', 1, 'reservas/informe/reporte', 'informeReservas');
INSERT INTO `core_permisos_listado` (`idPermisos`, `idPermisosCat`, `idEstado`, `idTipo`, `Nombre`, `Descripcion`, `idLevelLimit`, `RutaWeb`, `RutaController`) VALUES (12, 4, 1, 3, 'Exportar Datos', 'Permite exportar todos los datos de las reservas', 1, 'reservas/informe/exportacion', 'exportarReservas');
COMMIT;

-- ----------------------------
-- Table structure for core_permisos_listado_level_limit
-- ----------------------------
DROP TABLE IF EXISTS `core_permisos_listado_level_limit`;
CREATE TABLE `core_permisos_listado_level_limit` (
  `idLevelLimit` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) NOT NULL,
  `NombreCorto` varchar(120) NOT NULL,
  `Objetivo` varchar(120) NOT NULL,
  PRIMARY KEY (`idLevelLimit`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_permisos_listado_level_limit
-- ----------------------------
BEGIN;
INSERT INTO `core_permisos_listado_level_limit` (`idLevelLimit`, `Nombre`, `NombreCorto`, `Objetivo`) VALUES (1, 'Solo Ver', 'view', 'Ver');
INSERT INTO `core_permisos_listado_level_limit` (`idLevelLimit`, `Nombre`, `NombreCorto`, `Objetivo`) VALUES (2, 'Ver / Editar', 'view / edit', 'Editar');
INSERT INTO `core_permisos_listado_level_limit` (`idLevelLimit`, `Nombre`, `NombreCorto`, `Objetivo`) VALUES (3, 'Ver / Editar / Crear', 'view / edit / create', 'Crear');
INSERT INTO `core_permisos_listado_level_limit` (`idLevelLimit`, `Nombre`, `NombreCorto`, `Objetivo`) VALUES (4, 'Ver / Editar / Crear / Borrar', 'view / edit / create / del', 'Borrar');
COMMIT;

-- ----------------------------
-- Table structure for core_permisos_listado_rutas
-- ----------------------------
DROP TABLE IF EXISTS `core_permisos_listado_rutas`;
CREATE TABLE `core_permisos_listado_rutas` (
  `idRutas` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idPermisos` int(10) unsigned NOT NULL,
  `idMetodo` int(10) unsigned NOT NULL,
  `RutaWeb` varchar(255) NOT NULL,
  `RutaController` varchar(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `idLevelLimit` int(10) unsigned NOT NULL,
  `Controller` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idRutas`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Administrador';

-- ----------------------------
-- Records of core_permisos_listado_rutas
-- ----------------------------
BEGIN;
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (1, 1, 1, 'administracion/sistema/listAll', 'coreSistema->Resumen', 'Mostrar Resúmen', 2, 'coreSistema');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (2, 1, 1, 'administracion/sistema/resumenUpdate', 'coreSistema->ResumenUpdate', 'Mostrar información', 2, 'coreSistema');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (3, 1, 2, 'administracion/sistema/update', 'coreSistema->Update', 'Editar por post (modificar y subir archivos)', 2, 'coreSistema');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (4, 1, 4, 'administracion/sistema/delFiles', 'coreSistema->DelFiles', 'Permite eliminar archivos', 2, 'coreSistema');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (5, 2, 1, 'administracion/usuarios/listAll', 'usuariosListado->listAll', 'Listar Toda la Información', 1, 'usuariosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (6, 2, 2, 'administracion/usuarios/search', 'usuariosListado->UpdateList', 'Filtrar datos', 1, 'usuariosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (7, 2, 1, 'administracion/usuarios/updateList', 'usuariosListado->UpdateList', 'Actualizar Lista', 2, 'usuariosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (8, 2, 1, 'administracion/usuarios/view/@id', 'usuariosListado->View', 'Mostrar Detallado', 1, 'usuariosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (9, 2, 1, 'administracion/usuarios/resumen/@id', 'usuariosListado->Resumen', 'Mostrar Resúmen', 2, 'usuariosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (10, 2, 1, 'administracion/usuarios/resumenUpdate/@id', 'usuariosListado->ResumenUpdate', 'Mostrar información', 2, 'usuariosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (11, 2, 2, 'administracion/usuarios', 'usuariosListado->Insert', 'Crear Información', 3, 'usuariosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (12, 2, 2, 'administracion/usuarios/update', 'usuariosListado->Update', 'Editar por post (modificar y subir archivos)', 2, 'usuariosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (13, 2, 4, 'administracion/usuarios/delFiles', 'usuariosListado->DelFiles', 'Permite eliminar archivos', 2, 'usuariosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (14, 2, 3, 'administracion/usuarios', 'usuariosListado->Delete', 'Borrar dato y archivos', 4, 'usuariosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (15, 2, 1, 'administracion/usuarios/observaciones/new/@id', 'usuariosListadoObs->New', 'Mostrar modal nuevo', 2, 'usuariosListadoObs');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (16, 2, 1, 'administracion/usuarios/observaciones/updateList/@id', 'usuariosListadoObs->UpdateList', 'Actualizar Lista', 2, 'usuariosListadoObs');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (17, 2, 1, 'administracion/usuarios/observaciones/view/@id', 'usuariosListadoObs->View', 'Mostrar Detallado', 2, 'usuariosListadoObs');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (18, 2, 1, 'administracion/usuarios/observaciones/getID/@id', 'usuariosListadoObs->GetID', 'Información para el formulario edición', 2, 'usuariosListadoObs');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (19, 2, 2, 'administracion/usuarios/observaciones', 'usuariosListadoObs->Insert', 'Crear Información', 2, 'usuariosListadoObs');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (20, 2, 2, 'administracion/usuarios/observaciones/update', 'usuariosListadoObs->Update', 'Editar por post (modificar y subir archivos)', 2, 'usuariosListadoObs');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (21, 2, 3, 'administracion/usuarios/observaciones', 'usuariosListadoObs->Delete', 'Borrar dato y archivos', 2, 'usuariosListadoObs');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (22, 2, 2, 'administracion/usuarios/permisos/update', 'usuariosListadoPermisos->Update', 'Modificar los permisos de los usuarios', 2, 'usuariosListadoPermisos');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (23, 2, 2, 'administracion/usuarios/bodegas/update', 'usuariosListadoPermisosBodegas->Update', 'Modificar los permisos de acceso a bodegas de los usuarios', 2, 'usuariosListadoPermisosBodegas');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (24, 2, 2, 'administracion/usuarios/maquinas/update', 'usuariosListadoPermisosMaquinas->Update', 'Modificar los permisos de acceso a maquinas de los usuarios', 2, 'usuariosListadoPermisosMaquinas');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (25, 3, 1, 'mantencion/espacios/categorias/listAll', 'espaciosCategorias->listAll', 'Listar Toda la Información', 1, 'espaciosCategorias');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (26, 3, 2, 'mantencion/espacios/categorias/search', 'espaciosCategorias->UpdateList', 'Filtrar datos', 1, 'espaciosCategorias');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (27, 3, 1, 'mantencion/espacios/categorias/updateList', 'espaciosCategorias->UpdateList', 'Actualizar Lista', 2, 'espaciosCategorias');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (28, 3, 1, 'mantencion/espacios/categorias/view/@id', 'espaciosCategorias->View', 'Mostrar Detallado', 1, 'espaciosCategorias');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (29, 3, 1, 'mantencion/espacios/categorias/getID/@id', 'espaciosCategorias->GetID', 'Información para el formulario edición', 2, 'espaciosCategorias');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (30, 3, 2, 'mantencion/espacios/categorias', 'espaciosCategorias->Insert', 'Crear Información', 3, 'espaciosCategorias');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (31, 3, 2, 'mantencion/espacios/categorias/update', 'espaciosCategorias->Update', 'Editar por post (modificar y subir archivos)', 2, 'espaciosCategorias');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (32, 3, 3, 'mantencion/espacios/categorias', 'espaciosCategorias->Delete', 'Borrar dato y archivos', 4, 'espaciosCategorias');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (33, 4, 1, 'mantencion/espacios/listado/listAll', 'espaciosListado->listAll', 'Listar Toda la Información', 1, 'espaciosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (34, 4, 2, 'mantencion/espacios/listado/search', 'espaciosListado->UpdateList', 'Filtrar datos', 1, 'espaciosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (35, 4, 1, 'mantencion/espacios/listado/updateList', 'espaciosListado->UpdateList', 'Actualizar Lista', 2, 'espaciosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (36, 4, 1, 'mantencion/espacios/listado/view/@id', 'espaciosListado->View', 'Mostrar Detallado', 1, 'espaciosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (37, 4, 1, 'mantencion/espacios/listado/getID/@id', 'espaciosListado->GetID', 'Información para el formulario edición', 2, 'espaciosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (38, 4, 2, 'mantencion/espacios/listado', 'espaciosListado->Insert', 'Crear Información', 3, 'espaciosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (39, 4, 2, 'mantencion/espacios/listado/update', 'espaciosListado->Update', 'Editar por post (modificar y subir archivos)', 2, 'espaciosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (40, 4, 3, 'mantencion/espacios/listado', 'espaciosListado->Delete', 'Borrar dato y archivos', 4, 'espaciosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (41, 5, 1, 'mantencion/estados/listado/listAll', 'estadosListado->listAll', 'Listar Toda la Información', 1, 'estadosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (42, 5, 2, 'mantencion/estados/listado/search', 'estadosListado->UpdateList', 'Filtrar datos', 1, 'estadosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (43, 5, 1, 'mantencion/estados/listado/updateList', 'estadosListado->UpdateList', 'Actualizar Lista', 2, 'estadosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (44, 5, 1, 'mantencion/estados/listado/view/@id', 'estadosListado->View', 'Mostrar Detallado', 1, 'estadosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (45, 5, 1, 'mantencion/estados/listado/getID/@id', 'estadosListado->GetID', 'Información para el formulario edición', 2, 'estadosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (46, 5, 2, 'mantencion/estados/listado', 'estadosListado->Insert', 'Crear Información', 3, 'estadosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (47, 5, 2, 'mantencion/estados/listado/update', 'estadosListado->Update', 'Editar por post (modificar y subir archivos)', 2, 'estadosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (48, 5, 3, 'mantencion/estados/listado', 'estadosListado->Delete', 'Borrar dato y archivos', 4, 'estadosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (49, 6, 1, 'mantencion/periodicidad/listado/listAll', 'periodicidadListado->listAll', 'Listar Toda la Información', 1, 'periodicidadListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (50, 6, 2, 'mantencion/periodicidad/listado/search', 'periodicidadListado->UpdateList', 'Filtrar datos', 1, 'periodicidadListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (51, 6, 1, 'mantencion/periodicidad/listado/updateList', 'periodicidadListado->UpdateList', 'Actualizar Lista', 2, 'periodicidadListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (52, 6, 1, 'mantencion/periodicidad/listado/view/@id', 'periodicidadListado->View', 'Mostrar Detallado', 1, 'periodicidadListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (53, 6, 1, 'mantencion/periodicidad/listado/getID/@id', 'periodicidadListado->GetID', 'Información para el formulario edición', 2, 'periodicidadListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (54, 6, 2, 'mantencion/periodicidad/listado', 'periodicidadListado->Insert', 'Crear Información', 3, 'periodicidadListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (55, 6, 2, 'mantencion/periodicidad/listado/update', 'periodicidadListado->Update', 'Editar por post (modificar y subir archivos)', 2, 'periodicidadListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (56, 6, 3, 'mantencion/periodicidad/listado', 'periodicidadListado->Delete', 'Borrar dato y archivos', 4, 'periodicidadListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (57, 7, 1, 'mantencion/recursos/listado/listAll', 'recursosListado->listAll', 'Listar Toda la Información', 1, 'recursosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (58, 7, 2, 'mantencion/recursos/listado/search', 'recursosListado->UpdateList', 'Filtrar datos', 1, 'recursosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (59, 7, 1, 'mantencion/recursos/listado/updateList', 'recursosListado->UpdateList', 'Actualizar Lista', 2, 'recursosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (60, 7, 1, 'mantencion/recursos/listado/view/@id', 'recursosListado->View', 'Mostrar Detallado', 1, 'recursosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (61, 7, 1, 'mantencion/recursos/listado/getID/@id', 'recursosListado->GetID', 'Información para el formulario edición', 2, 'recursosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (62, 7, 2, 'mantencion/recursos/listado', 'recursosListado->Insert', 'Crear Información', 3, 'recursosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (63, 7, 2, 'mantencion/recursos/listado/update', 'recursosListado->Update', 'Editar por post (modificar y subir archivos)', 2, 'recursosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (64, 7, 3, 'mantencion/recursos/listado', 'recursosListado->Delete', 'Borrar dato y archivos', 4, 'recursosListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (65, 8, 1, 'mantencion/unidades/listado/listAll', 'unidadesListado->listAll', 'Listar Toda la Información', 1, 'unidadesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (66, 8, 2, 'mantencion/unidades/listado/search', 'unidadesListado->UpdateList', 'Filtrar datos', 1, 'unidadesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (67, 8, 1, 'mantencion/unidades/listado/updateList', 'unidadesListado->UpdateList', 'Actualizar Lista', 2, 'unidadesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (68, 8, 1, 'mantencion/unidades/listado/view/@id', 'unidadesListado->View', 'Mostrar Detallado', 1, 'unidadesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (69, 8, 1, 'mantencion/unidades/listado/getID/@id', 'unidadesListado->GetID', 'Información para el formulario edición', 2, 'unidadesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (70, 8, 2, 'mantencion/unidades/listado', 'unidadesListado->Insert', 'Crear Información', 3, 'unidadesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (71, 8, 2, 'mantencion/unidades/listado/update', 'unidadesListado->Update', 'Editar por post (modificar y subir archivos)', 2, 'unidadesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (72, 8, 3, 'mantencion/unidades/listado', 'unidadesListado->Delete', 'Borrar dato y archivos', 4, 'unidadesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (98, 9, 1, 'administracion/solicitantes/listado/listAll', 'solicitantesListado->listAll', 'Listar Toda la Información', 1, 'solicitantesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (99, 9, 2, 'administracion/solicitantes/listado/search', 'solicitantesListado->UpdateList', 'Filtrar datos', 1, 'solicitantesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (100, 9, 1, 'administracion/solicitantes/listado/updateList', 'solicitantesListado->UpdateList', 'Actualizar Lista', 2, 'solicitantesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (101, 9, 1, 'administracion/solicitantes/listado/view/@id', 'solicitantesListado->View', 'Mostrar Detallado', 1, 'solicitantesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (102, 9, 1, 'administracion/solicitantes/listado/resumen/@id', 'solicitantesListado->Resumen', 'Mostrar Resúmen', 2, 'solicitantesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (103, 9, 1, 'administracion/solicitantes/listado/resumenUpdate/@id', 'solicitantesListado->ResumenUpdate', 'Mostrar información', 2, 'solicitantesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (104, 9, 2, 'administracion/solicitantes/listado', 'solicitantesListado->Insert', 'Crear Información', 3, 'solicitantesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (105, 9, 2, 'administracion/solicitantes/listado/update', 'solicitantesListado->Update', 'Editar por post (modificar y subir archivos)', 2, 'solicitantesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (106, 9, 4, 'administracion/solicitantes/listado/delFiles', 'solicitantesListado->DelFiles', 'Permite eliminar archivos', 2, 'solicitantesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (107, 9, 3, 'administracion/solicitantes/listado', 'solicitantesListado->Delete', 'Borrar dato y archivos', 4, 'solicitantesListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (108, 9, 1, 'administracion/solicitantes/listado/observaciones/new/@id', 'solicitantesListadoObservaciones->New', 'Mostrar modal nuevo', 2, 'solicitantesListadoObservaciones');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (109, 9, 1, 'administracion/solicitantes/listado/observaciones/updateList/@id', 'solicitantesListadoObservaciones->UpdateList', 'Actualizar Lista', 2, 'solicitantesListadoObservaciones');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (110, 9, 1, 'administracion/solicitantes/listado/observaciones/view/@id', 'solicitantesListadoObservaciones->View', 'Mostrar Detallado', 2, 'solicitantesListadoObservaciones');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (111, 9, 1, 'administracion/solicitantes/listado/observaciones/getID/@id', 'solicitantesListadoObservaciones->GetID', 'Información para el formulario edición', 2, 'solicitantesListadoObservaciones');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (112, 9, 2, 'administracion/solicitantes/listado/observaciones', 'solicitantesListadoObservaciones->Insert', 'Crear Información', 2, 'solicitantesListadoObservaciones');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (113, 9, 2, 'administracion/solicitantes/listado/observaciones/update', 'solicitantesListadoObservaciones->Update', 'Editar por post (modificar y subir archivos)', 2, 'solicitantesListadoObservaciones');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (114, 9, 3, 'administracion/solicitantes/listado/observaciones', 'solicitantesListadoObservaciones->Delete', 'Borrar dato y archivos', 2, 'solicitantesListadoObservaciones');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (115, 9, 1, 'administracion/solicitantes/listado/contactos/new/@id', 'solicitantesListadoContactos->New', 'Mostrar modal nuevo', 2, 'solicitantesListadoContactos');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (116, 9, 1, 'administracion/solicitantes/listado/contactos/updateList/@id', 'solicitantesListadoContactos->UpdateList', 'Actualizar Lista', 2, 'solicitantesListadoContactos');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (117, 9, 1, 'administracion/solicitantes/listado/contactos/view/@id', 'solicitantesListadoContactos->View', 'Mostrar Detallado', 2, 'solicitantesListadoContactos');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (118, 9, 1, 'administracion/solicitantes/listado/contactos/getID/@id', 'solicitantesListadoContactos->GetID', 'Información para el formulario edición', 2, 'solicitantesListadoContactos');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (119, 9, 2, 'administracion/solicitantes/listado/contactos', 'solicitantesListadoContactos->Insert', 'Crear Información', 2, 'solicitantesListadoContactos');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (120, 9, 2, 'administracion/solicitantes/listado/contactos/update', 'solicitantesListadoContactos->Update', 'Editar por post (modificar y subir archivos)', 2, 'solicitantesListadoContactos');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (121, 9, 3, 'administracion/solicitantes/listado/contactos', 'solicitantesListadoContactos->Delete', 'Borrar dato y archivos', 2, 'solicitantesListadoContactos');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (122, 10, 1, 'reservas/reservas/listado/listAll', 'reservasListado->listAll', 'Listar Toda la Información', 1, 'reservasListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (123, 10, 2, 'reservas/reservas/listado/search', 'reservasListado->UpdateList', 'Filtrar datos', 1, 'reservasListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (124, 10, 1, 'reservas/reservas/listado/updateList', 'reservasListado->UpdateList', 'Actualizar Lista', 2, 'reservasListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (125, 10, 1, 'reservas/reservas/listado/view/@id', 'reservasListado->View', 'Mostrar Detallado', 1, 'reservasListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (126, 10, 1, 'reservas/reservas/listado/resumen/@id', 'reservasListado->Resumen', 'Mostrar Resúmen', 2, 'reservasListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (127, 10, 1, 'reservas/reservas/listado/resumenUpdate/@id', 'reservasListado->ResumenUpdate', 'Mostrar información', 2, 'reservasListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (128, 10, 2, 'reservas/reservas/listado', 'reservasListado->Insert', 'Crear Información', 3, 'reservasListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (129, 10, 2, 'reservas/reservas/listado/update', 'reservasListado->Update', 'Editar por post (modificar y subir archivos)', 2, 'reservasListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (130, 10, 4, 'reservas/reservas/listado/delFiles', 'reservasListado->DelFiles', 'Permite eliminar archivos', 2, 'reservasListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (131, 10, 3, 'reservas/reservas/listado', 'reservasListado->Delete', 'Borrar dato y archivos', 4, 'reservasListado');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (133, 10, 1, 'reservas/reservas/listado/eventos/updateList/@id', 'reservasListadoEventos->UpdateList', 'Actualizar Lista', 2, 'reservasListadoEventos');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (139, 11, 1, 'reservas/informe/reporte/listAll', 'informeReservas->listAll', 'Filtro de búsqueda', 1, 'informeReservas');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (140, 11, 2, 'reservas/informe/reporte/search', 'informeReservas->UpdateList', 'Filtrar datos', 1, 'informeReservas');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (141, 12, 1, 'reservas/informe/exportacion/listAll', 'exportarReservas->listAll', 'Filtro de búsqueda', 1, 'exportarReservas');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (142, 12, 2, 'reservas/informe/exportacion/search', 'exportarReservas->UpdateList', 'Filtrar datos', 1, 'exportarReservas');
INSERT INTO `core_permisos_listado_rutas` (`idRutas`, `idPermisos`, `idMetodo`, `RutaWeb`, `RutaController`, `Descripcion`, `idLevelLimit`, `Controller`) VALUES (143, 12, 1, 'reservas/informe/exportacion/exportExcel/@id', 'exportarReservas->exportExcel', 'Exportar Excel', 1, 'exportarReservas');
COMMIT;

-- ----------------------------
-- Table structure for core_permisos_listado_rutas_metodo
-- ----------------------------
DROP TABLE IF EXISTS `core_permisos_listado_rutas_metodo`;
CREATE TABLE `core_permisos_listado_rutas_metodo` (
  `idMetodo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) NOT NULL,
  PRIMARY KEY (`idMetodo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_permisos_listado_rutas_metodo
-- ----------------------------
BEGIN;
INSERT INTO `core_permisos_listado_rutas_metodo` (`idMetodo`, `Nombre`) VALUES (1, 'GET');
INSERT INTO `core_permisos_listado_rutas_metodo` (`idMetodo`, `Nombre`) VALUES (2, 'POST');
INSERT INTO `core_permisos_listado_rutas_metodo` (`idMetodo`, `Nombre`) VALUES (3, 'DELETE');
INSERT INTO `core_permisos_listado_rutas_metodo` (`idMetodo`, `Nombre`) VALUES (4, 'PUT');
COMMIT;

-- ----------------------------
-- Table structure for core_permisos_listado_tipo
-- ----------------------------
DROP TABLE IF EXISTS `core_permisos_listado_tipo`;
CREATE TABLE `core_permisos_listado_tipo` (
  `idTipo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) NOT NULL,
  PRIMARY KEY (`idTipo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_permisos_listado_tipo
-- ----------------------------
BEGIN;
INSERT INTO `core_permisos_listado_tipo` (`idTipo`, `Nombre`) VALUES (1, 'Crud Normal');
INSERT INTO `core_permisos_listado_tipo` (`idTipo`, `Nombre`) VALUES (2, 'Crud Resumen');
INSERT INTO `core_permisos_listado_tipo` (`idTipo`, `Nombre`) VALUES (3, 'Informe');
INSERT INTO `core_permisos_listado_tipo` (`idTipo`, `Nombre`) VALUES (4, 'Otros');
COMMIT;

-- ----------------------------
-- Table structure for core_posicion_menu
-- ----------------------------
DROP TABLE IF EXISTS `core_posicion_menu`;
CREATE TABLE `core_posicion_menu` (
  `idMenuPosicion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) NOT NULL,
  PRIMARY KEY (`idMenuPosicion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_posicion_menu
-- ----------------------------
BEGIN;
INSERT INTO `core_posicion_menu` (`idMenuPosicion`, `Nombre`) VALUES (1, 'Lateral');
INSERT INTO `core_posicion_menu` (`idMenuPosicion`, `Nombre`) VALUES (2, 'Superior');
COMMIT;

-- ----------------------------
-- Table structure for core_sexo
-- ----------------------------
DROP TABLE IF EXISTS `core_sexo`;
CREATE TABLE `core_sexo` (
  `idSexo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) NOT NULL,
  `Mascota` varchar(120) NOT NULL,
  PRIMARY KEY (`idSexo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_sexo
-- ----------------------------
BEGIN;
INSERT INTO `core_sexo` (`idSexo`, `Nombre`, `Mascota`) VALUES (1, 'Masculino', 'Macho');
INSERT INTO `core_sexo` (`idSexo`, `Nombre`, `Mascota`) VALUES (2, 'Femenino', 'Hembra');
COMMIT;

-- ----------------------------
-- Table structure for core_sistemas
-- ----------------------------
DROP TABLE IF EXISTS `core_sistemas`;
CREATE TABLE `core_sistemas` (
  `idSistema` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Sistema_Nombre` varchar(120) NOT NULL,
  `Sistema_Email` varchar(60) DEFAULT NULL,
  `Sistema_Rut` varchar(13) DEFAULT NULL,
  `Sistema_idCiudad` int(10) unsigned DEFAULT NULL,
  `Sistema_idComuna` int(10) unsigned DEFAULT NULL,
  `Sistema_Direccion` varchar(180) DEFAULT NULL,
  `Sistema_IMGLogo` varchar(250) DEFAULT NULL,
  `Sistema_idTema` int(10) unsigned NOT NULL,
  `Contacto_Nombre` varchar(120) DEFAULT NULL,
  `Contacto_Fono1` varchar(15) DEFAULT NULL,
  `Contacto_Fono2` varchar(15) DEFAULT NULL,
  `Contacto_Fax` varchar(15) DEFAULT NULL,
  `Contacto_Email` varchar(120) DEFAULT NULL,
  `Contacto_Web` varchar(120) DEFAULT NULL,
  `RepresentanteNombre` varchar(120) DEFAULT NULL,
  `RepresentanteRut` varchar(13) DEFAULT NULL,
  `RepresentanteFono` varchar(120) DEFAULT NULL,
  `RepresentanteEmail` varchar(120) DEFAULT NULL,
  `Config_API_GoogleMaps` varchar(255) DEFAULT NULL,
  `sistemaModalSubtitle` int(10) unsigned NOT NULL,
  `sistemaModalCloseBTN` int(10) unsigned NOT NULL,
  `Config_motorEmail` int(10) unsigned NOT NULL,
  `Config_motorMap` int(10) unsigned NOT NULL,
  `Latitud` double DEFAULT NULL,
  `Longitud` double DEFAULT NULL,
  `Config_Principal_Meteo` int(10) unsigned NOT NULL,
  `Config_Principal_Radio` int(10) unsigned NOT NULL,
  `Config_Principal_Feed` int(10) unsigned NOT NULL,
  `Config_Principal_FeedURL` varchar(255) NOT NULL,
  `Social_X` varchar(255) DEFAULT NULL,
  `Social_Facebook` varchar(255) DEFAULT NULL,
  `Social_Instagram` varchar(255) DEFAULT NULL,
  `Social_Linkedin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idSistema`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Administrador';

-- ----------------------------
-- Records of core_sistemas
-- ----------------------------
BEGIN;
INSERT INTO `core_sistemas` (`idSistema`, `Sistema_Nombre`, `Sistema_Email`, `Sistema_Rut`, `Sistema_idCiudad`, `Sistema_idComuna`, `Sistema_Direccion`, `Sistema_IMGLogo`, `Sistema_idTema`, `Contacto_Nombre`, `Contacto_Fono1`, `Contacto_Fono2`, `Contacto_Fax`, `Contacto_Email`, `Contacto_Web`, `RepresentanteNombre`, `RepresentanteRut`, `RepresentanteFono`, `RepresentanteEmail`, `Config_API_GoogleMaps`, `sistemaModalSubtitle`, `sistemaModalCloseBTN`, `Config_motorEmail`, `Config_motorMap`, `Latitud`, `Longitud`, `Config_Principal_Meteo`, `Config_Principal_Radio`, `Config_Principal_Feed`, `Config_Principal_FeedURL`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`) VALUES (1, 'Universidad Católica', 'contacto@uc.cl', '1-9', 13, 323, 'Av. Vicuña Mackenna 4860', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, 2, -33.4987744, -70.6106795, 1, 1, 1, '0', '#', '#', 'https://www.instagram.com/bibliotecas_uc/', 'https://www.linkedin.com/company/bibliotecas-uc/home/');
COMMIT;

-- ----------------------------
-- Table structure for core_temas
-- ----------------------------
DROP TABLE IF EXISTS `core_temas`;
CREATE TABLE `core_temas` (
  `idTema` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idTema`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_temas
-- ----------------------------
BEGIN;
INSERT INTO `core_temas` (`idTema`, `Nombre`) VALUES (1, 'Por Defecto');
INSERT INTO `core_temas` (`idTema`, `Nombre`) VALUES (2, 'Universidad Catolica');
INSERT INTO `core_temas` (`idTema`, `Nombre`) VALUES (3, 'Sneat');
COMMIT;

-- ----------------------------
-- Table structure for core_tipos_cobro
-- ----------------------------
DROP TABLE IF EXISTS `core_tipos_cobro`;
CREATE TABLE `core_tipos_cobro` (
  `idTipoCobro` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) NOT NULL,
  PRIMARY KEY (`idTipoCobro`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_tipos_cobro
-- ----------------------------
BEGIN;
INSERT INTO `core_tipos_cobro` (`idTipoCobro`, `Nombre`) VALUES (1, 'Sin Costo');
INSERT INTO `core_tipos_cobro` (`idTipoCobro`, `Nombre`) VALUES (2, 'Por Reserva');
INSERT INTO `core_tipos_cobro` (`idTipoCobro`, `Nombre`) VALUES (3, 'Por Asistente');
COMMIT;

-- ----------------------------
-- Table structure for core_tipos_contactos
-- ----------------------------
DROP TABLE IF EXISTS `core_tipos_contactos`;
CREATE TABLE `core_tipos_contactos` (
  `idTipoContacto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) NOT NULL,
  PRIMARY KEY (`idTipoContacto`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_tipos_contactos
-- ----------------------------
BEGIN;
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (4, 'Abogado del propietario');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (5, 'Analista de Inversiones');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (6, 'Analista de proyectos');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (7, 'Arquitecto');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (8, 'Asistente Legal');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (9, 'Director Ejecutivo');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (10, 'Encargada de Gestión y Venta Inmobiliaria');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (11, 'Encargado de Operaciones Habitacionales');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (12, 'Gerente Comercial');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (13, 'Gerente Corporativo de Estrategia');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (14, 'Gerente de Administración y Finanzas');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (15, 'Gerente de Compra de Terrenos');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (16, 'Gerente de desarrollo');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (17, 'Gerente de Nuevos Negocios');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (18, 'Gerente de Operaciones');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (19, 'Gerente de Proyecto');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (20, 'Gerente de Ventas');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (21, 'Gerente Finanzas');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (22, 'Gerente General');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (23, 'Gerente Inmobiliario');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (24, 'Gerente Nuevos Negocios');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (25, 'Gerente Técnico');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (26, 'Ingeniera de Proyecto');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (27, 'Ingeniero de Estudios Inmobiliarios');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (28, 'Jefe de Desarrollo');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (29, 'Jefe de Estudios');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (30, 'Jefe de Gestión Inmobiliaria');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (31, 'Jefe de Negocios Inmobiliarios');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (32, 'Jefe de Proyectos Inmobiliarios');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (33, 'Jefe de Ventas Inmobiliaria VI Región');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (34, 'Jefe Nuevos Negocios');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (35, 'Representante comercial de la empresa');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (36, 'Representante del propietario');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (37, 'Representante legal de la empresa');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (38, 'Representante técnico de la empresa');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (39, 'Secretaria');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (40, 'Sub Gerente Comercial');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (41, 'Sub Gerente de Estudios');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (42, 'Sub Gerente de Gestión Inmobiliaria');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (43, 'Sub Gerente de Negocios Inmobiliarios');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (44, 'Sub Gerente de Proyecto');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (45, 'Sub Gerente Desarrollo Inmobiliario');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (46, 'Sub Gerente Técnico');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (47, 'Asistente Administrativo');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (48, 'Corredor Externo');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (49, 'CEO & Cofounder');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (50, 'Gerente de Estudios y Adquisiciones');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (51, 'Gerente Desarrollos Proyectos Comerciales');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (52, 'Asistente de Gerencia');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (53, 'Constructor Civil');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (54, 'Gerente General Fai Sur');
INSERT INTO `core_tipos_contactos` (`idTipoContacto`, `Nombre`) VALUES (55, 'Secretaria de Gerencia');
COMMIT;

-- ----------------------------
-- Table structure for core_tipos_usuario
-- ----------------------------
DROP TABLE IF EXISTS `core_tipos_usuario`;
CREATE TABLE `core_tipos_usuario` (
  `idTipoUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) NOT NULL,
  PRIMARY KEY (`idTipoUsuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_tipos_usuario
-- ----------------------------
BEGIN;
INSERT INTO `core_tipos_usuario` (`idTipoUsuario`, `Nombre`) VALUES (1, 'SuperAdministrador');
INSERT INTO `core_tipos_usuario` (`idTipoUsuario`, `Nombre`) VALUES (2, 'Administrador');
INSERT INTO `core_tipos_usuario` (`idTipoUsuario`, `Nombre`) VALUES (3, 'Operaciones');
COMMIT;

-- ----------------------------
-- Table structure for core_ubicacion_ciudad
-- ----------------------------
DROP TABLE IF EXISTS `core_ubicacion_ciudad`;
CREATE TABLE `core_ubicacion_ciudad` (
  `idCiudad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) NOT NULL,
  `Wheater` varchar(255) NOT NULL,
  PRIMARY KEY (`idCiudad`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_ubicacion_ciudad
-- ----------------------------
BEGIN;
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (1, 'Región de Tarapacá', 'https://forecast7.com/en/n20d20n69d29/tarapaca/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (2, 'Región de Antofagasta', 'https://forecast7.com/en/n23d84n69d29/antofagasta-region/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (3, 'Región de Atacama', 'https://forecast7.com/en/n27d57n70d05/atacama-region/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (4, 'Región de Coquimbo', 'https://forecast7.com/en/n30d54n70d81/coquimbo/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (5, 'Región de Valparaiso', 'https://forecast7.com/en/n32d50n71d00/valparaiso-region/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (6, 'Región del Libertador General Bernardo O Higgins', 'https://forecast7.com/en/n34d58n71d00/ohiggins-region/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (7, 'Región del Maule', 'https://forecast7.com/en/n35d52n71d57/maule-region/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (8, 'Región del Bío-Bío', 'https://forecast7.com/en/n36d98n72d33/bio-bio-region/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (9, 'Región de la Araucanía', 'https://forecast7.com/en/n38d95n72d33/araucania/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (10, 'Región de Los Lagos', 'https://forecast7.com/en/n41d92n72d14/los-lagos/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (11, 'Región de Aysén del General Carlos Ibáñez del Campo', 'https://forecast7.com/en/n46d38n72d30/aysen-region/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (12, 'Región de Magallanes y la Antártica Chilena', 'https://forecast7.com/en/n52d21n72d17/magallanes-and-chilean-antarctica/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (13, 'Región Metropolitana', 'https://forecast7.com/en/n33d44n70d65/santiago-metropolitan-region/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (14, 'Región de Los Ríos', 'https://forecast7.com/en/n40d23n72d33/los-rios/');
INSERT INTO `core_ubicacion_ciudad` (`idCiudad`, `Nombre`, `Wheater`) VALUES (15, 'Región de Arica y Parinacota', 'https://forecast7.com/en/n18d59n69d48/arica-y-parinacota-region/');
COMMIT;

-- ----------------------------
-- Table structure for core_ubicacion_comunas
-- ----------------------------
DROP TABLE IF EXISTS `core_ubicacion_comunas`;
CREATE TABLE `core_ubicacion_comunas` (
  `idComuna` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idCiudad` int(10) unsigned NOT NULL,
  `Nombre` varchar(120) NOT NULL,
  `Wheater` varchar(220) NOT NULL,
  PRIMARY KEY (`idComuna`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Fija';

-- ----------------------------
-- Records of core_ubicacion_comunas
-- ----------------------------
BEGIN;
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (1, 15, 'Arica', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (2, 1, 'Iquique', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (3, 1, 'Huara', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (4, 1, 'Pica', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (5, 1, 'Pozo almonte', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (6, 2, 'Tocopilla', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (7, 2, 'Antofagasta', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (8, 2, 'Mejillones', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (9, 2, 'Taltal', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (10, 2, 'Calama', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (11, 3, 'ChaÑaral', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (12, 3, 'Diego de almagro', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (13, 3, 'Copiapo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (14, 3, 'Caldera', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (15, 3, 'Tierra amarilla', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (16, 3, 'Vallenar', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (17, 3, 'Freirina', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (18, 3, 'Huasco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (19, 4, 'La serena', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (20, 4, 'La higuera', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (21, 4, 'Coquimbo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (22, 4, 'Andacollo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (23, 4, 'VicuÑa', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (24, 4, 'Paihuano', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (25, 4, 'Ovalle', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (26, 4, 'Monte patria', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (27, 4, 'Punitaqui', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (28, 4, 'Rio hurtado', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (29, 4, 'Combarbala', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (30, 4, 'Illapel', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (31, 4, 'Canela', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (32, 4, 'Salamanca', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (33, 4, 'Los vilos', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (34, 5, 'Valparaiso', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (35, 5, 'Quintero', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (36, 5, 'Puchuncavi', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (37, 5, 'ViÑa del mar', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (38, 5, 'Quilpue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (39, 5, 'Villa alemana', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (40, 5, 'Casablanca', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (41, 5, 'Isla de pascua', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (42, 5, 'San antonio', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (43, 5, 'Santo domingo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (44, 5, 'Algarrobo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (45, 5, 'El quisco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (46, 5, 'Cartagena', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (47, 5, 'El tabo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (48, 5, 'Quillota', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (49, 5, 'La cruz', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (50, 5, 'La calera', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (51, 5, 'Hijuelas', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (52, 5, 'Nogales', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (53, 5, 'Limache', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (54, 5, 'Olmue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (55, 5, 'Petorca', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (56, 5, 'Cabildo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (57, 5, 'Papudo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (58, 5, 'Zapallar', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (59, 5, 'La ligua', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (60, 5, 'San felipe', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (61, 5, 'Putaendo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (62, 5, 'Panquehue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (63, 5, 'Catemu', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (64, 5, 'Santa maria', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (65, 5, 'Llay llay', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (66, 5, 'Los andes', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (67, 5, 'Calle larga', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (68, 5, 'Rinconada', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (69, 5, 'San esteban', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (70, 13, 'Santiago centro', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (71, 13, 'Las condes', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (72, 13, 'Providencia', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (73, 13, 'Santiago oeste', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (75, 13, 'Conchali', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (76, 13, 'Colina', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (77, 13, 'Renca', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (78, 13, 'Lampa', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (79, 13, 'Quilicura', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (80, 13, 'Til-til', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (81, 13, 'Quinta normal', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (82, 13, 'Pudahuel', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (83, 13, 'Curacavi', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (84, 13, 'Santiago sur', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (85, 13, 'PeÑaflor', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (86, 13, 'Talagante', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (87, 13, 'Isla de maipo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (88, 13, 'Melipilla', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (89, 13, 'El monte', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (90, 13, 'Maria pinto', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (91, 13, 'ÑuÑoa', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (92, 13, 'La reina', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (93, 13, 'La florida', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (94, 13, 'Maipu', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (95, 13, 'San miguel', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (96, 13, 'La cisterna', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (97, 13, 'La granja', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (98, 13, 'San bernardo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (99, 13, 'Calera de tango', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (100, 13, 'Puente alto', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (101, 13, 'Pirque', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (102, 13, 'San jose de maipo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (103, 13, 'Buin', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (104, 13, 'Paine', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (105, 6, 'Rancagua', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (106, 6, 'Machali', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (107, 6, 'Graneros', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (108, 13, 'San pedro', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (109, 13, 'Alhue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (110, 6, 'Codegua', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (111, 6, 'San francisco de mostazal', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (112, 6, 'DoÑihue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (113, 6, 'Coltauco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (114, 6, 'Coinco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (115, 6, 'Peumo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (116, 6, 'Las cabras', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (117, 6, 'San vicente', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (118, 6, 'Pichidegua', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (119, 6, 'Requinoa', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (120, 6, 'Olivar', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (121, 6, 'Rengo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (122, 6, 'Malloa', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (123, 6, 'Quinta de tilcoco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (124, 6, 'San fernando', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (125, 6, 'Chimbarongo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (126, 6, 'Nancagua', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (127, 6, 'Placilla', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (128, 6, 'Santa cruz', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (129, 6, 'Lolol', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (130, 6, 'Palmilla', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (131, 6, 'Peralillo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (132, 6, 'Chepica', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (133, 6, 'Paredones', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (134, 6, 'Marchigue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (135, 6, 'Pumanque', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (136, 6, 'Litueche', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (137, 6, 'Pichilemu', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (138, 6, 'Navidad', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (139, 6, 'La estrella', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (140, 7, 'Curico', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (141, 7, 'Romeral', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (142, 7, 'Teno', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (143, 7, 'Rauco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (144, 7, 'HualaÑe', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (145, 7, 'Licanten', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (146, 7, 'Vichuquen', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (147, 7, 'Molina', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (148, 7, 'Sagrada familia', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (149, 7, 'Rio claro', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (150, 7, 'Talca', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (151, 7, 'San clemente', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (152, 7, 'Pelarco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (153, 7, 'Pencahue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (154, 7, 'Maule', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (155, 7, 'Curepto', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (156, 7, 'San javier', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (157, 7, 'Constitucion', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (158, 7, 'Empedrado', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (159, 7, 'Linares', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (160, 7, 'Yerbas buenas', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (161, 7, 'Colbun', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (162, 7, 'Longavi', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (163, 7, 'Villa alegre', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (164, 7, 'Parral', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (165, 7, 'Retiro', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (166, 7, 'Cauquenes', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (167, 7, 'Chanco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (168, 8, 'Chillan', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (169, 8, 'Pinto', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (170, 8, 'Coihueco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (171, 8, 'Portezuelo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (172, 8, 'Quirihue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (173, 8, 'Trehuaco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (174, 8, 'Ninhue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (175, 8, 'Cobquecura', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (176, 8, 'San carlos', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (177, 8, 'San gregorio de Ñiquen', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (178, 8, 'San fabian', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (179, 8, 'San nicolas', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (180, 8, 'Bulnes', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (181, 8, 'San ignacio', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (182, 8, 'Quillon', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (183, 8, 'Yungay', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (184, 8, 'Pemuco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (185, 8, 'El carmen', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (186, 8, 'Coelemu', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (187, 8, 'Ranquil', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (188, 8, 'Concepcion', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (189, 8, 'Talcahuano', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (190, 8, 'Tome', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (191, 8, 'Penco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (192, 8, 'Hualqui', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (193, 8, 'Florida', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (194, 8, 'Coronel', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (195, 8, 'Lota', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (196, 8, 'Santa juana', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (197, 8, 'Curanilahue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (198, 8, 'Arauco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (199, 8, 'Lebu', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (200, 8, 'Los alamos', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (201, 8, 'CaÑete', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (202, 8, 'Contulmo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (203, 8, 'Tirua', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (204, 8, 'Los angeles', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (205, 8, 'Santa barbara', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (206, 8, 'Quilleco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (207, 8, 'Yumbel', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (208, 8, 'Cabrero', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (209, 8, 'Tucapel', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (210, 8, 'Laja', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (211, 8, 'San rosendo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (212, 8, 'Nacimiento', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (213, 8, 'Negrete', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (214, 8, 'Mulchen', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (215, 8, 'Quilaco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (216, 9, 'Angol', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (217, 9, 'Puren', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (218, 9, 'Los sauces', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (219, 9, 'Renaico', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (220, 9, 'Collipulli', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (221, 9, 'Ercilla', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (222, 9, 'Traiguen', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (223, 9, 'Lumaco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (224, 9, 'Victoria', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (225, 9, 'Curacautin', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (226, 9, 'Lonquimay', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (227, 9, 'Temuco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (228, 9, 'Vilcun', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (229, 9, 'Freire', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (230, 9, 'Cunco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (231, 9, 'Lautaro', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (232, 9, 'Galvarino', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (233, 9, 'Perquenco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (234, 9, 'Nueva imperial', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (235, 9, 'Carahue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (236, 9, 'Puerto saavedra', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (237, 9, 'Pitrufquen', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (238, 9, 'Gorbea', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (239, 9, 'Tolten', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (240, 9, 'Loncoche', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (241, 9, 'Villarrica', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (242, 9, 'Pucon', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (243, 14, 'Valdivia', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (244, 14, 'Corral', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (245, 14, 'Mariquina', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (246, 14, 'Mafil', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (247, 14, 'Los lagos', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (248, 14, 'Futrono', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (249, 14, 'Lanco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (250, 14, 'Panguipulli', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (251, 14, 'La union', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (252, 14, 'Paillaco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (253, 14, 'Rio bueno', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (254, 14, 'Lago ranco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (255, 10, 'Osorno', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (256, 10, 'Puyehue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (257, 10, 'San pablo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (258, 10, 'Puerto octay', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (259, 10, 'Rio negro', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (260, 10, 'Purranque', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (261, 10, 'Puerto montt', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (262, 10, 'Cochamo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (263, 10, 'Maullin', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (264, 10, 'Los muermos', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (265, 10, 'Calbuco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (266, 10, 'Puerto varas', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (267, 10, 'Llanquihue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (268, 10, 'Fresia', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (269, 10, 'Frutillar', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (270, 10, 'Castro', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (271, 10, 'Chonchi', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (272, 10, 'Queilen', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (273, 10, 'Quellon', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (274, 10, 'Puqueldon', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (275, 10, 'Quinchao', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (276, 10, 'Curaco de velez', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (277, 10, 'Ancud', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (278, 10, 'Quemchi', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (279, 10, 'Dalcahue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (280, 10, 'Chaiten', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (281, 10, 'Futaleufu', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (282, 10, 'Palena', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (284, 11, 'Coyhaique', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (285, 11, 'Aysen', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (286, 11, 'Cisnes', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (287, 11, 'Chile chico', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (288, 11, 'Rio ibaÑez', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (289, 11, 'Cochrane', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (290, 12, 'Punta arenas', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (291, 12, 'Puerto natales', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (292, 12, 'Porvenir', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (293, 15, 'General lagos', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (294, 15, 'Putre', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (295, 15, 'Camarones', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (296, 1, 'Camina', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (297, 1, 'Colchane', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (298, 2, 'Maria elena', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (299, 2, 'Sierra gorda', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (300, 2, 'OllagÜe', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (301, 2, 'San pedro de atacama', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (302, 3, 'Alto del carmen', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (303, 8, 'Antuco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (304, 9, 'Melipeuco', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (305, 9, 'Curarrehue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (306, 9, 'Teodoro schmidt', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (307, 10, 'San juan de la costa', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (308, 10, 'Hualaihue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (309, 11, 'Guaitecas', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (310, 11, 'O´higgins', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (311, 11, 'Tortel', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (312, 11, 'Lago verde', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (313, 12, 'Torres del paine', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (314, 12, 'Rio verde', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (315, 12, 'San gregorio', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (316, 12, 'Laguna blanca', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (317, 12, 'Primavera', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (318, 12, 'Timaukel', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (319, 12, 'Navarino', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (320, 7, 'Pelluhue', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (321, 5, 'Juan fernandez', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (322, 13, 'PeÑalolen', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (323, 13, 'Macul', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (324, 13, 'Cerro navia', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (325, 13, 'Lo prado', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (326, 13, 'San ramon', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (327, 13, 'La pintana', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (328, 13, 'Estacion central', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (329, 13, 'Recoleta', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (330, 13, 'Independencia', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (331, 13, 'Vitacura', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (332, 13, 'Lo barnechea', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (333, 13, 'Cerrillos', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (334, 13, 'Huechuraba', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (335, 13, 'San joaquin', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (336, 13, 'Pedro aguirre cerda', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (337, 13, 'Lo espejo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (338, 13, 'El bosque', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (339, 13, 'Padre hurtado', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (340, 5, 'Concon', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (341, 7, 'San rafael', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (342, 8, 'Chillan viejo', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (343, 8, 'San pedro de la paz', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (344, 8, 'Chiguayante', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (345, 9, 'Padre las casas', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (346, 1, 'Alto hospicio', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (347, 12, 'Antartica', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (348, 6, 'Mostazal', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (349, 8, 'Niquen', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (350, 0, 'Sin Información', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (351, 8, 'Hualpen', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (352, 6, 'San Vicente Tagua Tagua', '');
INSERT INTO `core_ubicacion_comunas` (`idComuna`, `idCiudad`, `Nombre`, `Wheater`) VALUES (353, 5, 'Curauma', '');
COMMIT;

-- ----------------------------
-- Table structure for espacios_categorias
-- ----------------------------
DROP TABLE IF EXISTS `espacios_categorias`;
CREATE TABLE `espacios_categorias` (
  `idCategoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`idCategoria`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Creado desde el Instalador';

-- ----------------------------
-- Records of espacios_categorias
-- ----------------------------
BEGIN;
INSERT INTO `espacios_categorias` (`idCategoria`, `Nombre`) VALUES (1, 'Salas Hibridas (15 personas)');
INSERT INTO `espacios_categorias` (`idCategoria`, `Nombre`) VALUES (2, 'Salas Hibridas (30 personas)');
INSERT INTO `espacios_categorias` (`idCategoria`, `Nombre`) VALUES (3, 'Salas no Hibridas');
COMMIT;

-- ----------------------------
-- Table structure for espacios_listado
-- ----------------------------
DROP TABLE IF EXISTS `espacios_listado`;
CREATE TABLE `espacios_listado` (
  `idEspacio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idCategoria` int(10) unsigned NOT NULL,
  `idEstado` int(10) unsigned NOT NULL,
  `Nombre` varchar(120) NOT NULL,
  `nMaxPersonas` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idEspacio`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Creado desde el Instalador';

-- ----------------------------
-- Records of espacios_listado
-- ----------------------------
BEGIN;
INSERT INTO `espacios_listado` (`idEspacio`, `idCategoria`, `idEstado`, `Nombre`, `nMaxPersonas`) VALUES (1, 1, 1, 'Sala A', 15);
INSERT INTO `espacios_listado` (`idEspacio`, `idCategoria`, `idEstado`, `Nombre`, `nMaxPersonas`) VALUES (2, 1, 1, 'Sala B', 15);
INSERT INTO `espacios_listado` (`idEspacio`, `idCategoria`, `idEstado`, `Nombre`, `nMaxPersonas`) VALUES (3, 2, 1, 'Sala C', 25);
INSERT INTO `espacios_listado` (`idEspacio`, `idCategoria`, `idEstado`, `Nombre`, `nMaxPersonas`) VALUES (4, 2, 1, 'Sala D', 28);
INSERT INTO `espacios_listado` (`idEspacio`, `idCategoria`, `idEstado`, `Nombre`, `nMaxPersonas`) VALUES (5, 2, 1, 'Sala E', 30);
INSERT INTO `espacios_listado` (`idEspacio`, `idCategoria`, `idEstado`, `Nombre`, `nMaxPersonas`) VALUES (6, 3, 1, 'Sala Principal', 100);
COMMIT;

-- ----------------------------
-- Table structure for estados_listado
-- ----------------------------
DROP TABLE IF EXISTS `estados_listado`;
CREATE TABLE `estados_listado` (
  `idEstadoReserva` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Color` varchar(255) NOT NULL,
  PRIMARY KEY (`idEstadoReserva`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Creado desde el Instalador';

-- ----------------------------
-- Records of estados_listado
-- ----------------------------
BEGIN;
INSERT INTO `estados_listado` (`idEstadoReserva`, `Nombre`, `Color`) VALUES (1, 'Ingresada', '#1c71d8');
INSERT INTO `estados_listado` (`idEstadoReserva`, `Nombre`, `Color`) VALUES (2, 'En Revision', '#f5c211');
INSERT INTO `estados_listado` (`idEstadoReserva`, `Nombre`, `Color`) VALUES (3, 'Aprobada', '#26a269');
INSERT INTO `estados_listado` (`idEstadoReserva`, `Nombre`, `Color`) VALUES (4, 'Rechazada', '#e01b24');
INSERT INTO `estados_listado` (`idEstadoReserva`, `Nombre`, `Color`) VALUES (5, 'Ejecutada', '#813d9c');
COMMIT;

-- ----------------------------
-- Table structure for periodicidad_listado
-- ----------------------------
DROP TABLE IF EXISTS `periodicidad_listado`;
CREATE TABLE `periodicidad_listado` (
  `idPeriodicidad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`idPeriodicidad`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Creado desde el Instalador';

-- ----------------------------
-- Records of periodicidad_listado
-- ----------------------------
BEGIN;
INSERT INTO `periodicidad_listado` (`idPeriodicidad`, `Nombre`) VALUES (1, 'Unica');
INSERT INTO `periodicidad_listado` (`idPeriodicidad`, `Nombre`) VALUES (2, 'Semanal');
INSERT INTO `periodicidad_listado` (`idPeriodicidad`, `Nombre`) VALUES (3, 'Quincenal');
INSERT INTO `periodicidad_listado` (`idPeriodicidad`, `Nombre`) VALUES (4, 'Mensual');
COMMIT;

-- ----------------------------
-- Table structure for recursos_listado
-- ----------------------------
DROP TABLE IF EXISTS `recursos_listado`;
CREATE TABLE `recursos_listado` (
  `idRecurso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `idTipoCobro` int(10) unsigned NOT NULL,
  `Valor` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idRecurso`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Creado desde el Instalador';

-- ----------------------------
-- Records of recursos_listado
-- ----------------------------
BEGIN;
INSERT INTO `recursos_listado` (`idRecurso`, `Nombre`, `idTipoCobro`, `Valor`) VALUES (1, 'Apoyo audiovisual', 1, NULL);
INSERT INTO `recursos_listado` (`idRecurso`, `Nombre`, `idTipoCobro`, `Valor`) VALUES (2, 'Disposición del espacio físico', 1, NULL);
INSERT INTO `recursos_listado` (`idRecurso`, `Nombre`, `idTipoCobro`, `Valor`) VALUES (3, 'Servicios de alimentación externo', 1, NULL);
INSERT INTO `recursos_listado` (`idRecurso`, `Nombre`, `idTipoCobro`, `Valor`) VALUES (4, 'Servicios de alimentación interno', 3, 350);
INSERT INTO `recursos_listado` (`idRecurso`, `Nombre`, `idTipoCobro`, `Valor`) VALUES (5, 'Apoyo Profesional', 2, 45000);
COMMIT;

-- ----------------------------
-- Table structure for reservas_listado
-- ----------------------------
DROP TABLE IF EXISTS `reservas_listado`;
CREATE TABLE `reservas_listado` (
  `idReserva` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEstadoReserva` int(10) unsigned NOT NULL,
  `idSolicitante` int(10) unsigned NOT NULL,
  `idUnidades` int(10) unsigned NOT NULL,
  `Fecha` date NOT NULL,
  `Fecha_Dia` tinyint(3) unsigned NOT NULL,
  `Fecha_Semana` tinyint(3) unsigned NOT NULL,
  `Fecha_Mes` tinyint(3) unsigned NOT NULL,
  `Fecha_Ano` smallint(5) unsigned NOT NULL,
  `Hora_Inicio` time NOT NULL,
  `Hora_Termino` time NOT NULL,
  `idPeriodicidad` int(10) unsigned NOT NULL,
  `NAsistentes` smallint(5) unsigned NOT NULL,
  `idEspacio` int(10) unsigned NOT NULL,
  `Observaciones` text DEFAULT NULL,
  `Costo` int(10) unsigned DEFAULT NULL,
  `CentroCosto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idReserva`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Creado desde el Instalador';

-- ----------------------------
-- Records of reservas_listado
-- ----------------------------
BEGIN;
INSERT INTO `reservas_listado` (`idReserva`, `idEstadoReserva`, `idSolicitante`, `idUnidades`, `Fecha`, `Fecha_Dia`, `Fecha_Semana`, `Fecha_Mes`, `Fecha_Ano`, `Hora_Inicio`, `Hora_Termino`, `idPeriodicidad`, `NAsistentes`, `idEspacio`, `Observaciones`, `Costo`, `CentroCosto`) VALUES (1, 4, 1, 6, '2026-08-17', 17, 34, 8, 2026, '10:00:00', '12:30:00', 1, 20, 3, NULL, 45000, 'cc334');
INSERT INTO `reservas_listado` (`idReserva`, `idEstadoReserva`, `idSolicitante`, `idUnidades`, `Fecha`, `Fecha_Dia`, `Fecha_Semana`, `Fecha_Mes`, `Fecha_Ano`, `Hora_Inicio`, `Hora_Termino`, `idPeriodicidad`, `NAsistentes`, `idEspacio`, `Observaciones`, `Costo`, `CentroCosto`) VALUES (2, 3, 3, 6, '2026-08-18', 18, 34, 8, 2026, '13:00:00', '16:00:00', 1, 30, 5, NULL, 10500, 'dd33');
INSERT INTO `reservas_listado` (`idReserva`, `idEstadoReserva`, `idSolicitante`, `idUnidades`, `Fecha`, `Fecha_Dia`, `Fecha_Semana`, `Fecha_Mes`, `Fecha_Ano`, `Hora_Inicio`, `Hora_Termino`, `idPeriodicidad`, `NAsistentes`, `idEspacio`, `Observaciones`, `Costo`, `CentroCosto`) VALUES (3, 3, 4, 3, '2026-08-17', 17, 34, 8, 2026, '09:00:00', '11:00:00', 2, 15, 2, NULL, NULL, NULL);
INSERT INTO `reservas_listado` (`idReserva`, `idEstadoReserva`, `idSolicitante`, `idUnidades`, `Fecha`, `Fecha_Dia`, `Fecha_Semana`, `Fecha_Mes`, `Fecha_Ano`, `Hora_Inicio`, `Hora_Termino`, `idPeriodicidad`, `NAsistentes`, `idEspacio`, `Observaciones`, `Costo`, `CentroCosto`) VALUES (4, 1, 5, 1, '2026-08-18', 18, 34, 8, 2026, '15:00:00', '18:00:00', 1, 25, 4, NULL, NULL, NULL);
INSERT INTO `reservas_listado` (`idReserva`, `idEstadoReserva`, `idSolicitante`, `idUnidades`, `Fecha`, `Fecha_Dia`, `Fecha_Semana`, `Fecha_Mes`, `Fecha_Ano`, `Hora_Inicio`, `Hora_Termino`, `idPeriodicidad`, `NAsistentes`, `idEspacio`, `Observaciones`, `Costo`, `CentroCosto`) VALUES (5, 5, 6, 1, '2026-08-18', 18, 34, 8, 2026, '08:30:00', '10:00:00', 1, 15, 2, NULL, 5250, 'dd33');
INSERT INTO `reservas_listado` (`idReserva`, `idEstadoReserva`, `idSolicitante`, `idUnidades`, `Fecha`, `Fecha_Dia`, `Fecha_Semana`, `Fecha_Mes`, `Fecha_Ano`, `Hora_Inicio`, `Hora_Termino`, `idPeriodicidad`, `NAsistentes`, `idEspacio`, `Observaciones`, `Costo`, `CentroCosto`) VALUES (6, 1, 7, 2, '2026-08-19', 19, 34, 8, 2026, '10:00:00', '12:00:00', 1, 80, 6, NULL, 45000, 'cc44');
INSERT INTO `reservas_listado` (`idReserva`, `idEstadoReserva`, `idSolicitante`, `idUnidades`, `Fecha`, `Fecha_Dia`, `Fecha_Semana`, `Fecha_Mes`, `Fecha_Ano`, `Hora_Inicio`, `Hora_Termino`, `idPeriodicidad`, `NAsistentes`, `idEspacio`, `Observaciones`, `Costo`, `CentroCosto`) VALUES (7, 2, 8, 1, '2026-08-20', 20, 34, 8, 2026, '14:00:00', '17:00:00', 1, 20, 3, NULL, 7000, 'ff55');
INSERT INTO `reservas_listado` (`idReserva`, `idEstadoReserva`, `idSolicitante`, `idUnidades`, `Fecha`, `Fecha_Dia`, `Fecha_Semana`, `Fecha_Mes`, `Fecha_Ano`, `Hora_Inicio`, `Hora_Termino`, `idPeriodicidad`, `NAsistentes`, `idEspacio`, `Observaciones`, `Costo`, `CentroCosto`) VALUES (8, 2, 9, 3, '2026-08-25', 25, 35, 8, 2026, '09:00:00', '11:30:00', 2, 28, 4, NULL, 54800, 'ff4');
INSERT INTO `reservas_listado` (`idReserva`, `idEstadoReserva`, `idSolicitante`, `idUnidades`, `Fecha`, `Fecha_Dia`, `Fecha_Semana`, `Fecha_Mes`, `Fecha_Ano`, `Hora_Inicio`, `Hora_Termino`, `idPeriodicidad`, `NAsistentes`, `idEspacio`, `Observaciones`, `Costo`, `CentroCosto`) VALUES (9, 1, 10, 2, '2026-08-21', 21, 34, 8, 2026, '11:00:00', '12:00:00', 1, 10, 1, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for reservas_listado_eventos
-- ----------------------------
DROP TABLE IF EXISTS `reservas_listado_eventos`;
CREATE TABLE `reservas_listado_eventos` (
  `idEvento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idReserva` int(10) unsigned NOT NULL,
  `idUsuario` int(10) unsigned NOT NULL,
  `Evento` text NOT NULL,
  `FechaCreacion` date NOT NULL,
  PRIMARY KEY (`idEvento`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Creado desde el Instalador';

-- ----------------------------
-- Records of reservas_listado_eventos
-- ----------------------------
BEGIN;
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (1, 1, 1, 'Reserva Creada', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (2, 2, 1, 'Reserva Creada', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (3, 3, 1, 'Reserva Creada', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (4, 4, 1, 'Reserva Creada', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (5, 5, 1, 'Reserva Creada', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (6, 6, 1, 'Reserva Creada', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (7, 7, 1, 'Reserva Creada', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (8, 8, 1, 'Reserva Creada', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (9, 8, 1, '<br> - se modifica el estado de la reserva', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (10, 8, 1, 'No hay modificaciones', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (11, 8, 1, 'No hay modificaciones', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (12, 7, 1, '<br> - se modifica el estado de la reserva', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (13, 7, 1, 'No hay modificaciones', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (14, 2, 1, '<br> - se modifica el estado de la reserva', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (15, 2, 1, 'No hay modificaciones', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (16, 5, 1, '<br> - se modifica el estado de la reserva', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (17, 1, 1, '<br> - se modifica el estado de la reserva', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (18, 3, 1, '<br> - se modifica el estado de la reserva', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (19, 9, 1, 'Reserva Creada', '2026-08-16');
INSERT INTO `reservas_listado_eventos` (`idEvento`, `idReserva`, `idUsuario`, `Evento`, `FechaCreacion`) VALUES (20, 9, 1, 'No hay modificaciones', '2026-08-16');
COMMIT;

-- ----------------------------
-- Table structure for reservas_listado_recursos
-- ----------------------------
DROP TABLE IF EXISTS `reservas_listado_recursos`;
CREATE TABLE `reservas_listado_recursos` (
  `idRecursoSolicitado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idReserva` int(10) unsigned NOT NULL,
  `idRecurso` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idRecursoSolicitado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Creado desde el Instalador';

-- ----------------------------
-- Records of reservas_listado_recursos
-- ----------------------------
BEGIN;
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (1, 1, 1);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (2, 1, 5);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (3, 2, 2);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (4, 2, 4);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (5, 3, 1);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (6, 3, 2);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (7, 4, 1);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (8, 4, 2);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (9, 4, 3);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (10, 5, 4);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (11, 6, 1);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (12, 6, 2);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (13, 6, 5);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (14, 7, 1);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (15, 7, 4);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (16, 8, 1);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (17, 8, 4);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (18, 8, 5);
INSERT INTO `reservas_listado_recursos` (`idRecursoSolicitado`, `idReserva`, `idRecurso`) VALUES (19, 9, 1);
COMMIT;

-- ----------------------------
-- Table structure for solicitantes_listado
-- ----------------------------
DROP TABLE IF EXISTS `solicitantes_listado`;
CREATE TABLE `solicitantes_listado` (
  `idSolicitante` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEstado` int(10) unsigned NOT NULL,
  `idSexo` int(10) unsigned DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `ApellidoPat` varchar(255) DEFAULT NULL,
  `ApellidoMat` varchar(255) DEFAULT NULL,
  `Rut` varchar(15) DEFAULT NULL,
  `idCiudad` int(10) unsigned DEFAULT NULL,
  `idComuna` int(10) unsigned DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Direccion_img` varchar(255) DEFAULT NULL,
  `FNacimiento` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Fono1` varchar(15) DEFAULT NULL,
  `Fono2` varchar(15) DEFAULT NULL,
  `Social_X` varchar(255) DEFAULT NULL,
  `Social_Facebook` varchar(255) DEFAULT NULL,
  `Social_Instagram` varchar(255) DEFAULT NULL,
  `Social_Linkedin` varchar(255) DEFAULT NULL,
  `IP_Client` varchar(120) DEFAULT NULL,
  `Agent_Transp` varchar(240) DEFAULT NULL,
  `Ultimo_acceso` date DEFAULT NULL,
  PRIMARY KEY (`idSolicitante`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Creado desde el Instalador';

-- ----------------------------
-- Records of solicitantes_listado
-- ----------------------------
BEGIN;
INSERT INTO `solicitantes_listado` (`idSolicitante`, `idEstado`, `idSexo`, `password`, `Nombre`, `ApellidoPat`, `ApellidoMat`, `Rut`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `FNacimiento`, `Email`, `Fono1`, `Fono2`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `Ultimo_acceso`) VALUES (1, 1, NULL, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 'Roberto', 'Figueroa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rfigueroa@uc.cl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `solicitantes_listado` (`idSolicitante`, `idEstado`, `idSexo`, `password`, `Nombre`, `ApellidoPat`, `ApellidoMat`, `Rut`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `FNacimiento`, `Email`, `Fono1`, `Fono2`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `Ultimo_acceso`) VALUES (3, 1, NULL, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 'Valentina', 'Lagos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vlagos@ucx.cl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `solicitantes_listado` (`idSolicitante`, `idEstado`, `idSexo`, `password`, `Nombre`, `ApellidoPat`, `ApellidoMat`, `Rut`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `FNacimiento`, `Email`, `Fono1`, `Fono2`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `Ultimo_acceso`) VALUES (4, 1, 1, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 'Matias', 'Bravo', NULL, NULL, NULL, NULL, NULL, '', NULL, 'mbravo@uc.cl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `solicitantes_listado` (`idSolicitante`, `idEstado`, `idSexo`, `password`, `Nombre`, `ApellidoPat`, `ApellidoMat`, `Rut`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `FNacimiento`, `Email`, `Fono1`, `Fono2`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `Ultimo_acceso`) VALUES (5, 1, 2, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 'Laura', 'Campos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'lcampos@uc.cl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `solicitantes_listado` (`idSolicitante`, `idEstado`, `idSexo`, `password`, `Nombre`, `ApellidoPat`, `ApellidoMat`, `Rut`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `FNacimiento`, `Email`, `Fono1`, `Fono2`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `Ultimo_acceso`) VALUES (6, 1, 1, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 'Diego', 'Fernandez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dfernandez@uc.cl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `solicitantes_listado` (`idSolicitante`, `idEstado`, `idSexo`, `password`, `Nombre`, `ApellidoPat`, `ApellidoMat`, `Rut`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `FNacimiento`, `Email`, `Fono1`, `Fono2`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `Ultimo_acceso`) VALUES (7, 1, NULL, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 'Ana', 'Rivera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'arivera@ucx.cl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `solicitantes_listado` (`idSolicitante`, `idEstado`, `idSexo`, `password`, `Nombre`, `ApellidoPat`, `ApellidoMat`, `Rut`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `FNacimiento`, `Email`, `Fono1`, `Fono2`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `Ultimo_acceso`) VALUES (8, 1, NULL, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 'Pedro', 'Soto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'psoto@ucx.cl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `solicitantes_listado` (`idSolicitante`, `idEstado`, `idSexo`, `password`, `Nombre`, `ApellidoPat`, `ApellidoMat`, `Rut`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `FNacimiento`, `Email`, `Fono1`, `Fono2`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `Ultimo_acceso`) VALUES (9, 1, NULL, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 'Carolina', 'Muñoz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmunoz@ucx.cl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `solicitantes_listado` (`idSolicitante`, `idEstado`, `idSexo`, `password`, `Nombre`, `ApellidoPat`, `ApellidoMat`, `Rut`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `FNacimiento`, `Email`, `Fono1`, `Fono2`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `Ultimo_acceso`) VALUES (10, 1, NULL, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 'Victor', 'Reyes', 'Galvez', NULL, NULL, NULL, NULL, NULL, NULL, 'tenshi98@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for solicitantes_listado_contactos
-- ----------------------------
DROP TABLE IF EXISTS `solicitantes_listado_contactos`;
CREATE TABLE `solicitantes_listado_contactos` (
  `idContacto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idSolicitante` int(10) unsigned NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `ApellidoPat` varchar(255) NOT NULL,
  `ApellidoMat` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Rut` varchar(15) DEFAULT NULL,
  `Fono1` varchar(15) DEFAULT NULL,
  `Fono2` varchar(15) DEFAULT NULL,
  `idCiudad` int(10) unsigned DEFAULT NULL,
  `idComuna` int(10) unsigned DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `idTipoContacto` int(10) unsigned DEFAULT NULL,
  `Cargo` varchar(255) DEFAULT NULL,
  `idEstado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idContacto`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Creado desde el Instalador';

-- ----------------------------
-- Records of solicitantes_listado_contactos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for solicitantes_listado_observaciones
-- ----------------------------
DROP TABLE IF EXISTS `solicitantes_listado_observaciones`;
CREATE TABLE `solicitantes_listado_observaciones` (
  `idObservaciones` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idSolicitante` int(10) unsigned NOT NULL,
  `Observacion` text NOT NULL,
  `FechaCreacion` date NOT NULL,
  PRIMARY KEY (`idObservaciones`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Creado desde el Instalador';

-- ----------------------------
-- Records of solicitantes_listado_observaciones
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for unidades_listado
-- ----------------------------
DROP TABLE IF EXISTS `unidades_listado`;
CREATE TABLE `unidades_listado` (
  `idUnidades` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`idUnidades`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Creado desde el Instalador';

-- ----------------------------
-- Records of unidades_listado
-- ----------------------------
BEGIN;
INSERT INTO `unidades_listado` (`idUnidades`, `Nombre`) VALUES (1, 'Departamento de Informatica');
INSERT INTO `unidades_listado` (`idUnidades`, `Nombre`) VALUES (2, 'Departamento de Matematicas');
INSERT INTO `unidades_listado` (`idUnidades`, `Nombre`) VALUES (3, 'Departamento de Fisica');
INSERT INTO `unidades_listado` (`idUnidades`, `Nombre`) VALUES (4, 'Direccion de Pre-Grado');
INSERT INTO `unidades_listado` (`idUnidades`, `Nombre`) VALUES (5, 'Direccion de Post-Grado');
INSERT INTO `unidades_listado` (`idUnidades`, `Nombre`) VALUES (6, 'Departamento de Ciencias');
COMMIT;

-- ----------------------------
-- Table structure for usuarios_accesos
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_accesos`;
CREATE TABLE `usuarios_accesos` (
  `idAcceso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUsuario` int(10) unsigned NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL DEFAULT '00:00:00',
  `DateTime` datetime NOT NULL,
  `IP_Client` varchar(120) NOT NULL,
  `Agent_Transp` varchar(240) NOT NULL,
  `idSistema` int(10) unsigned NOT NULL,
  `token` text NOT NULL,
  `expiration_date` datetime NOT NULL,
  `idEstado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idAcceso`) USING BTREE,
  KEY `fk_Usuario` (`idUsuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Limpiar al entregar';

-- ----------------------------
-- Records of usuarios_accesos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for usuarios_checkbrute
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_checkbrute`;
CREATE TABLE `usuarios_checkbrute` (
  `idAcceso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL DEFAULT '00:00:00',
  `DateTime` varchar(30) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `IP_Client` varchar(120) NOT NULL,
  `Agent_Transp` varchar(240) NOT NULL,
  PRIMARY KEY (`idAcceso`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Limpiar al entregar';

-- ----------------------------
-- Records of usuarios_checkbrute
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for usuarios_listado
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_listado`;
CREATE TABLE `usuarios_listado` (
  `idUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `password` text NOT NULL,
  `idTipoUsuario` int(10) unsigned NOT NULL,
  `idEstado` int(10) unsigned NOT NULL,
  `email` varchar(60) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Rut` varchar(13) DEFAULT NULL,
  `fNacimiento` date DEFAULT NULL,
  `Fono` varchar(15) DEFAULT NULL,
  `idCiudad` int(10) unsigned DEFAULT NULL,
  `idComuna` int(10) unsigned DEFAULT NULL,
  `Direccion` varchar(60) DEFAULT NULL,
  `Direccion_img` varchar(120) DEFAULT NULL,
  `Ultimo_acceso` date DEFAULT NULL,
  `Social_X` varchar(255) DEFAULT NULL,
  `Social_Facebook` varchar(255) DEFAULT NULL,
  `Social_Instagram` varchar(255) DEFAULT NULL,
  `Social_Linkedin` varchar(255) DEFAULT NULL,
  `IP_Client` varchar(120) DEFAULT NULL,
  `Agent_Transp` varchar(240) DEFAULT NULL,
  `idMenuPosicion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idUsuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Cuidado';

-- ----------------------------
-- Records of usuarios_listado
-- ----------------------------
BEGIN;
INSERT INTO `usuarios_listado` (`idUsuario`, `password`, `idTipoUsuario`, `idEstado`, `email`, `Nombre`, `Rut`, `fNacimiento`, `Fono`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `Ultimo_acceso`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `idMenuPosicion`) VALUES (1, 'L25Yb0t6NUhzakJxRGVQMlpUSWYyQT09', 1, 1, 'tenshi98@gmail.com', 'Victor Reyes Galvez', '16.029.464-7', '1985-02-23', '955391914', 13, 331, 'Los Lirios 09362', 'Perfil_1786672709.png', '2026-08-16', 'https://www.google.cl', 'https://www.google.cl', 'https://www.google.cl', 'https://www.google.cl', '172.18.0.1', 'Mozilla Firefox', 2);
INSERT INTO `usuarios_listado` (`idUsuario`, `password`, `idTipoUsuario`, `idEstado`, `email`, `Nombre`, `Rut`, `fNacimiento`, `Fono`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `Ultimo_acceso`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `idMenuPosicion`) VALUES (2, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 1, 1, 'admin@test.cl', 'Administrador', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-16', NULL, NULL, NULL, NULL, '172.18.0.1', 'Mozilla Firefox', 2);
INSERT INTO `usuarios_listado` (`idUsuario`, `password`, `idTipoUsuario`, `idEstado`, `email`, `Nombre`, `Rut`, `fNacimiento`, `Fono`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `Ultimo_acceso`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `idMenuPosicion`) VALUES (3, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 2, 1, 'administrador@test.cl', 'Administrador Sistema', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-16', NULL, NULL, NULL, NULL, '172.18.0.1', 'Mozilla Firefox', 2);
INSERT INTO `usuarios_listado` (`idUsuario`, `password`, `idTipoUsuario`, `idEstado`, `email`, `Nombre`, `Rut`, `fNacimiento`, `Fono`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `Ultimo_acceso`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `idMenuPosicion`) VALUES (4, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 3, 1, 'operador@test.cl', 'Operador', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-16', NULL, NULL, NULL, NULL, '172.18.0.1', 'Mozilla Firefox', 2);
INSERT INTO `usuarios_listado` (`idUsuario`, `password`, `idTipoUsuario`, `idEstado`, `email`, `Nombre`, `Rut`, `fNacimiento`, `Fono`, `idCiudad`, `idComuna`, `Direccion`, `Direccion_img`, `Ultimo_acceso`, `Social_X`, `Social_Facebook`, `Social_Instagram`, `Social_Linkedin`, `IP_Client`, `Agent_Transp`, `idMenuPosicion`) VALUES (5, 'SFRjQTFXSnBsNWUrVmNwUHRsVHhSdz09', 3, 1, 'visualizador@test.cl', 'Visualizador', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-16', NULL, NULL, NULL, NULL, '172.18.0.1', 'Mozilla Firefox', 2);
COMMIT;

-- ----------------------------
-- Table structure for usuarios_listado_observaciones
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_listado_observaciones`;
CREATE TABLE `usuarios_listado_observaciones` (
  `idObservaciones` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUsuario` int(10) unsigned NOT NULL,
  `Observacion` text NOT NULL,
  `FechaCreacion` date NOT NULL,
  PRIMARY KEY (`idObservaciones`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Limpiar al entregar';

-- ----------------------------
-- Records of usuarios_listado_observaciones
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for usuarios_listado_permisos
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_listado_permisos`;
CREATE TABLE `usuarios_listado_permisos` (
  `idPermisoUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUsuario` int(10) unsigned NOT NULL,
  `idPermisos` int(10) unsigned NOT NULL,
  `idLevelLimit` int(10) unsigned NOT NULL,
  `fechaCreacion` date DEFAULT NULL,
  PRIMARY KEY (`idPermisoUsuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Limpiar al entregar';

-- ----------------------------
-- Records of usuarios_listado_permisos
-- ----------------------------
BEGIN;
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (1, 3, 1, 2, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (2, 3, 2, 3, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (3, 3, 3, 4, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (4, 3, 4, 4, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (5, 3, 5, 4, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (6, 3, 6, 4, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (7, 3, 7, 4, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (8, 3, 8, 4, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (9, 3, 9, 4, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (10, 3, 10, 4, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (11, 3, 11, 1, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (12, 3, 12, 1, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (13, 4, 3, 3, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (14, 4, 4, 3, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (15, 4, 7, 3, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (16, 4, 8, 3, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (17, 4, 9, 3, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (18, 4, 10, 3, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (19, 4, 11, 1, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (20, 4, 12, 1, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (21, 5, 10, 1, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (22, 5, 11, 1, '2026-08-16');
INSERT INTO `usuarios_listado_permisos` (`idPermisoUsuario`, `idUsuario`, `idPermisos`, `idLevelLimit`, `fechaCreacion`) VALUES (23, 5, 12, 1, '2026-08-16');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
