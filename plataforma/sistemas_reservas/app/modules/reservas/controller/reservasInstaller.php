<?php
/*******************************************************************************************************************/
/*                                              Se define la clase                                                 */
/*******************************************************************************************************************/
class reservasInstaller extends ControllerBase {

    /******************************************************************************/
    //Variables
    private $controllerName;

    /******************************************************************************/
    //Constructor
    public function __construct(){
        /*=========== Se instancian los datos ===========*/
        $DB_conn_1     = Database::getSQLConnection(ConfigData::MySQL_ADMIN);
        $queryBuilder  = new QueryBuilder();
        $checkData     = new CheckData();
        /*================== Instancias =================*/
        $this->controllerName = 'reservasInstaller';
        /*========== Datos para la clase padre ==========*/
        parent::__construct($DB_conn_1, $queryBuilder, $checkData);
    }

    /******************************************************************************/
    /*                               INSTALACION                                  */
    /******************************************************************************/
    /******************************************************************************/
    //Se lista la informacion
    public function ListDataModule(){

        /*******************************************************/
        //Se instancian los datos
        $espaciosInstaller     = new espaciosInstaller();
		$estadosInstaller      = new estadosInstaller();
		$periodicidadInstaller = new periodicidadInstaller();
		$recursosInstaller     = new recursosInstaller();
		$solicitantesInstaller = new solicitantesInstaller();
		$unidadesInstaller     = new unidadesInstaller();

        /*******************************************************/
        //Rutas
        $nData1    = $this->GetCountDataModule();
        $DepData1  = $espaciosInstaller->GetCountDataModule();
        $DepData2  = $estadosInstaller->GetCountDataModule();
        $DepData3  = $periodicidadInstaller->GetCountDataModule();
        $DepData4  = $recursosInstaller->GetCountDataModule();
        $DepData5  = $solicitantesInstaller->GetCountDataModule();
        $DepData6  = $unidadesInstaller->GetCountDataModule();

        /******************************************/
        //si es la respuesta esperada
        $countPermisos = is_numeric($nData1)&&$nData1!=0 ? 1 : 0;
        $DepInstall_1  = is_numeric($DepData1)&&$DepData1!=0 ? 1 : 0;
        $DepInstall_2  = is_numeric($DepData2)&&$DepData2!=0 ? 1 : 0;
        $DepInstall_3  = is_numeric($DepData3)&&$DepData3!=0 ? 1 : 0;
        $DepInstall_4  = is_numeric($DepData4)&&$DepData4!=0 ? 1 : 0;
        $DepInstall_5  = is_numeric($DepData5)&&$DepData5!=0 ? 1 : 0;
        $DepInstall_6  = is_numeric($DepData6)&&$DepData6!=0 ? 1 : 0;

        /******************************************/
        //Verificar que existan los permisos
        $arrData = [
            'Nombre'        => 'Módulo de Gestión de Reservas',
            'Descripcion'   => 'Módulo para gestionar a las Reservas',
            'Controller'    => $this->controllerName,
            'countPermisos' => $countPermisos,
            'Dependencias'  => [
                [
                    'Nombre' => ' - Módulo de Gestión de Espacios',
                    'Numero' => $DepInstall_1,
                ],
                [
                    'Nombre' => ' - Módulo de Gestión de Estados',
                    'Numero' => $DepInstall_2,
                ],
                [
                    'Nombre' => ' - Módulo de Gestión de Periodicidad',
                    'Numero' => $DepInstall_3,
                ],
                [
                    'Nombre' => ' - Módulo de Gestión de Recursos',
                    'Numero' => $DepInstall_4,
                ],
                [
                    'Nombre' => ' - Módulo de Gestión de Solicitantes',
                    'Numero' => $DepInstall_5,
                ],
                [
                    'Nombre' => ' - Módulo de Gestión de Unidades',
                    'Numero' => $DepInstall_6,
                ],
            ]
        ];
        //devuelvo
        return $arrData;
    }
    /******************************************************************************/
    //Instalacion del modulo completo
    public function InstallModule(){

        /******************************************/
        //Variables
        $arrTables    = $this->listTables();
        $arrPermisos  = array();

        /************************************************/
        /************************************************/
        //Verifico si existe
        if($arrTables){
            //recorro
            foreach ($arrTables as $table) {
                /******************************/
                //Se genera la query
                $xParams = ['query' => $table];
                $this->Base_createTable($xParams);
            }
        }

        /*******************************************************/
        /*                 SE GENERAN LAS RUTAS                */
        /*******************************************************/
        $arrPermisos[] = [
            'idPermisosCat'  => '3',
            'idEstado'       => '1',
            'idTipo'         => '2',
            'Nombre'         => 'Reservas - Listado',
            'Descripcion'    => 'Permite administrar las Reservas',
            'idLevelLimit'   => '4',
            'RutaWeb'        => 'reservas/reservas/listado',
            'RutaController' => 'reservasListado',
        ];
        $arrPermisos[] = [
            'idPermisosCat'  => '4',
            'idEstado'       => '1',
            'idTipo'         => '3',
            'Nombre'         => 'Informe Solicitudes',
            'Descripcion'    => 'Permite visualizar la información consolidada',
            'idLevelLimit'   => '1',
            'RutaWeb'        => 'reservas/informe/reporte',
            'RutaController' => 'informeReservas',
        ];
        $arrPermisos[] = [
            'idPermisosCat'  => '4',
            'idEstado'       => '1',
            'idTipo'         => '3',
            'Nombre'         => 'Exportar Datos',
            'Descripcion'    => 'Permite exportar todos los datos de las reservas',
            'idLevelLimit'   => '1',
            'RutaWeb'        => 'reservas/informe/exportacion',
            'RutaController' => 'exportarReservas',
        ];

        /************************************************/
        /************************************************/
        //Verifico si existe
        if($arrPermisos){
            //Variable
            $IntCounter = 1;
            //recorro
            foreach ($arrPermisos as $permiso) {
                /************************************************/
                //Se genera la query
                $query = [
                    'data'      => 'idPermisosCat,idEstado,idTipo,Nombre,Descripcion,idLevelLimit,RutaWeb,RutaController',
                    'required'  => 'idPermisosCat,idEstado,idTipo,Nombre,Descripcion,idLevelLimit,RutaWeb,RutaController',
                    'unique'    => '',
                    'encode'    => '',
                    'table'     => 'core_permisos_listado',
                    'Post'      => $permiso
                ];
                //Ejecuto la query
                $xParams    = ['DataCheck' => '', 'query' => $query];
                $permisosID = $this->Base_insert($xParams);
                /************************************************/
                //Listar las rutas
                $arrRutas = $this->listRouteModule($IntCounter, $permisosID['data']);
                /************************************************/
                //Verifico si existe
                if($arrRutas){
                    //recorro
                    foreach ($arrRutas as $rutas) {
                        /******************************/
                        //Se genera la query
                        $query = [
                            'data'      => 'idPermisos,idMetodo,RutaWeb,RutaController,Descripcion,idLevelLimit,Controller',
                            'required'  => 'idPermisos,idMetodo,RutaWeb,RutaController,Descripcion,idLevelLimit,Controller',
                            'unique'    => '',
                            'encode'    => '',
                            'table'     => 'core_permisos_listado_rutas',
                            'Post'      => $rutas
                        ];
                        //Ejecuto la query
                        //Ejecuto la query
                        $xParams = ['DataCheck' => '', 'query' => $query, 'novalidate' => true];
                        $this->Base_insert($xParams);
                    }
                }
                /************************************************/
                //Se aumenta
                $IntCounter++;
            }
        }

        /************************************************/
        //devuelvo true
        return true;

    }
    /******************************************************************************/
    //Desinstalacion del modulo
    public function UninstallModule(){

        /*******************************************************/
        //Rutas
        $RutaController  = $this->RutaController();

        /*******************************************************/
        /*             SE CONSULTAN LOS PERMISOS               */
        /*******************************************************/
        //Se genera la query
        $query = [
            'data'    => 'idPermisos',
            'table'   => 'core_permisos_listado',
            'join'    => '',
            'where'   => 'RutaController IN ('.$RutaController.')',
            'group'   => '',
            'having'  => '',
            'order'   => 'idPermisos ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams     = ['query' => $query];
        $arrPermisos = $this->Base_GetList($xParams);

        /*******************************************************/
        /*        SE ELIMINAN PERMISOS DE LOS USUARIOS         */
        /*******************************************************/
        $subQuery = $arrPermisos['status']
                    ? ',' . implode(',', array_column($arrPermisos['data'], 'idPermisos'))
                    : '';

        /************************************************/
        //Se listan las query
        $arrPermDel   = array();
        $arrPermDel[] = 'DELETE FROM `usuarios_listado_permisos` WHERE idPermisos IN (0 '.$subQuery.')';
        $arrPermDel[] = 'DELETE FROM `core_permisos_listado` WHERE RutaController IN ('.$RutaController.')';
        $arrPermDel[] = 'DELETE FROM `core_permisos_listado_rutas` WHERE Controller IN ('.$RutaController.')';

        /************************************************/
        //Verifico si existe
        if($arrPermDel){
            //recorro
            foreach ($arrPermDel as $sql) {
                //Se ejecuta la query
                $xParams = ['query' => $sql];
                $this->Base_queryExecute($xParams);
            }
        }

        /*******************************************************/
        /*              SE ELIMINAN LAS TABLAS                 */
        /*******************************************************/
        $arrTableDel  = array();
        $arrTableDel[] = ['table' => 'reservas_listado'];
        $arrTableDel[] = ['table' => 'reservas_listado_eventos'];
        $arrTableDel[] = ['table' => 'reservas_listado_recursos'];

        /************************************************/
        //Verifico si existe
        if($arrTableDel){
            //recorro
            foreach ($arrTableDel as $tblDel) {
                //Se ejecuta la query
                $xParams = ['query' => $tblDel];
                $this->Base_dropTable($xParams);
            }
        }

        /************************************************/
        /************************************************/
        //devuelvo true
        return true;

    }
    /******************************************************************************/
    //Se cuentan las rutas del controlador
    public function GetCountDataModule(){

        /*******************************************************/
        //Rutas
        $RutaController  = $this->RutaController();

        /******************************************/
        //Se genera la query
        $query = [
            'data'    => 'idRutas',
            'table'   => 'core_permisos_listado_rutas',
            'join'    => '',
            'where'   => 'Controller IN ('.$RutaController.')',
            'group'   => '',
            'having'  => '',
            'order'   => ''
        ];
        //Ejecuto la query
        $xParams = ['query' => $query];
        $nData   = $this->Base_GetCountData($xParams);

        /******************************************/
        //devuelvo
        return $nData['data'];

    }
    /******************************************************************************/
    //Se listan las rutas
    public function listRouteModule($Type, $permisosID){

        /******************************************/
        //Variables
        $arrRutas  = array();

        /******************************************/
        //Variables
        switch ($Type) {
            /******************************************/
            case 1:
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'reservas/reservas/listado/listAll',                 'RutaController' => 'reservasListado->listAll',            'Descripcion' => 'Listar Toda la Información',                    'idLevelLimit' => 1, 'Controller' => 'reservasListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 2, 'RutaWeb' => 'reservas/reservas/listado/search',                  'RutaController' => 'reservasListado->UpdateList',         'Descripcion' => 'Filtrar datos',                                 'idLevelLimit' => 1, 'Controller' => 'reservasListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'reservas/reservas/listado/updateList',              'RutaController' => 'reservasListado->UpdateList',         'Descripcion' => 'Actualizar Lista',                              'idLevelLimit' => 2, 'Controller' => 'reservasListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'reservas/reservas/listado/view/@id',                'RutaController' => 'reservasListado->View',               'Descripcion' => 'Mostrar Detallado',                             'idLevelLimit' => 1, 'Controller' => 'reservasListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'reservas/reservas/listado/resumen/@id',             'RutaController' => 'reservasListado->Resumen',            'Descripcion' => 'Mostrar Resúmen',                               'idLevelLimit' => 2, 'Controller' => 'reservasListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'reservas/reservas/listado/resumenUpdate/@id',       'RutaController' => 'reservasListado->ResumenUpdate',      'Descripcion' => 'Mostrar información',                           'idLevelLimit' => 2, 'Controller' => 'reservasListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 2, 'RutaWeb' => 'reservas/reservas/listado',                         'RutaController' => 'reservasListado->Insert',             'Descripcion' => 'Crear Información',                             'idLevelLimit' => 3, 'Controller' => 'reservasListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 2, 'RutaWeb' => 'reservas/reservas/listado/update',                  'RutaController' => 'reservasListado->Update',             'Descripcion' => 'Editar por post (modificar y subir archivos)',  'idLevelLimit' => 2, 'Controller' => 'reservasListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 4, 'RutaWeb' => 'reservas/reservas/listado/delFiles',                'RutaController' => 'reservasListado->DelFiles',           'Descripcion' => 'Permite eliminar archivos',                     'idLevelLimit' => 2, 'Controller' => 'reservasListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 3, 'RutaWeb' => 'reservas/reservas/listado',                         'RutaController' => 'reservasListado->Delete',             'Descripcion' => 'Borrar dato y archivos',                        'idLevelLimit' => 4, 'Controller' => 'reservasListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'reservas/reservas/listado/eventos/updateList/@id',  'RutaController' => 'reservasListadoEventos->UpdateList',  'Descripcion' => 'Actualizar Lista',                              'idLevelLimit' => 2, 'Controller' => 'reservasListadoEventos'];

                break;
            /******************************************/
            case 2:
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'reservas/informe/reporte/listAll', 'RutaController' => 'informeReservas->listAll',    'Descripcion' => 'Filtro de búsqueda', 'idLevelLimit' => 1, 'Controller' => 'informeReservas'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 2, 'RutaWeb' => 'reservas/informe/reporte/search',  'RutaController' => 'informeReservas->UpdateList', 'Descripcion' => 'Filtrar datos',      'idLevelLimit' => 1, 'Controller' => 'informeReservas'];

                break;
            /******************************************/
            case 3:
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'reservas/informe/exportacion/listAll',         'RutaController' => 'exportarReservas->listAll',      'Descripcion' => 'Filtro de búsqueda', 'idLevelLimit' => 1, 'Controller' => 'exportarReservas'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 2, 'RutaWeb' => 'reservas/informe/exportacion/search',          'RutaController' => 'exportarReservas->UpdateList',   'Descripcion' => 'Filtrar datos',      'idLevelLimit' => 1, 'Controller' => 'exportarReservas'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'reservas/informe/exportacion/exportExcel/@id', 'RutaController' => 'exportarReservas->exportExcel',  'Descripcion' => 'Exportar Excel',     'idLevelLimit' => 1, 'Controller' => 'exportarReservas'];

                break;
        }

        /******************************************/
        //devuelvo
        return $arrRutas;

    }
    /******************************************************************************/
    //Se listan los controladores
    private function RutaController(){

        /*******************************************************/
        //Rutas
        $RutaController  = '"reservasListado"';
        $RutaController .= ',"reservasListadoEventos"';
        $RutaController .= ',"informeReservas"';
        $RutaController .= ',"exportarReservas"';

        //devuelvo
        return $RutaController;
    }
    /******************************************************************************/
    //Se listan las tablas
    public function listTables(){

        /******************************************/
        //Variables
        $arrTables    = array();

        /*******************************************************/
        /*                 SE GENERAN LAS TABLAS               */
        /*******************************************************/
        $arrTables[] = [
            'table'      => 'reservas_listado',
            'data'       => '`idReserva` int(10) unsigned NOT NULL AUTO_INCREMENT,`idEstadoReserva` int(10) unsigned NOT NULL,`idSolicitante` int(10) unsigned NOT NULL,`idUnidades` int(10) unsigned NOT NULL,`Fecha` date NOT NULL,`Fecha_Dia` tinyint(3) unsigned NOT NULL,`Fecha_Semana` tinyint(3) unsigned NOT NULL,`Fecha_Mes` tinyint(3) unsigned NOT NULL,`Fecha_Ano` smallint(5) unsigned NOT NULL,`Hora_Inicio` time NOT NULL,`Hora_Termino` time NOT NULL,`idPeriodicidad` int(10) unsigned NOT NULL,`NAsistentes` smallint(5) unsigned NOT NULL,`idEspacio` int(10) unsigned NOT NULL,`Observaciones` text DEFAULT NULL,`Costo` int(10) unsigned DEFAULT NULL,`CentroCosto` varchar(255) DEFAULT NULL',
            'primaryKey' => 'idReserva',
            'comentario' => 'Creado desde el Instalador',
        ];
        $arrTables[] = [
            'table'      => 'reservas_listado_eventos',
            'data'       => '`idEvento` int(10) unsigned NOT NULL AUTO_INCREMENT,`idReserva` int(10) unsigned NOT NULL,`idUsuario` int(10) unsigned NOT NULL,`Evento` text NOT NULL,`FechaCreacion` date NOT NULL',
            'primaryKey' => 'idEvento',
            'comentario' => 'Creado desde el Instalador',
        ];
        $arrTables[] = [
            'table'      => 'reservas_listado_recursos',
            'data'       => '`idRecursoSolicitado` int(10) unsigned NOT NULL AUTO_INCREMENT,`idReserva` int(10) unsigned NOT NULL,`idRecurso` int(10) unsigned NOT NULL',
            'primaryKey' => 'idRecursoSolicitado',
            'comentario' => 'Creado desde el Instalador',
        ];

        /************************************************/
        //devuelvo true
        return $arrTables;

    }
    /******************************************************************************/
    //Mapeo de las tablas
    public function mapTables(){

        $Data = '';

        /******************************************/
        //Variables
        $arrTables = $this->listTables();
        $dataSQL   = new FunctionsDataSQL();
        $Data     .= $dataSQL->minifyArrayTables($arrTables);

        /************************************************/
        //devuelvo true
        return $Data;

    }

}
