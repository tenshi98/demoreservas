<?php
/*******************************************************************************************************************/
/*                                              Se define la clase                                                 */
/*******************************************************************************************************************/
class espaciosInstaller extends ControllerBase {

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
        $this->controllerName = 'espaciosInstaller';
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
        //Rutas
        $nData1    = $this->GetCountDataModule();

        /******************************************/
        //si es la respuesta esperada
        $countPermisos = is_numeric($nData1)&&$nData1!=0 ? 1 : 0;

        /******************************************/
        //Verificar que existan los permisos
        $arrData = [
            'Nombre'        => 'Módulo de Gestión de Espacios',
            'Descripcion'   => 'Módulo para gestionar los Espacios',
            'Controller'    => $this->controllerName,
            'countPermisos' => $countPermisos,
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
            'idPermisosCat'  => '2',
            'idEstado'       => '1',
            'idTipo'         => '1',
            'Nombre'         => 'Espacios - Categorias',
            'Descripcion'    => 'Permite la mantencion de las categorias de los espacios',
            'idLevelLimit'   => '4',
            'RutaWeb'        => 'mantencion/espacios/categorias',
            'RutaController' => 'espaciosCategorias',
        ];
        $arrPermisos[] = [
            'idPermisosCat'  => '2',
            'idEstado'       => '1',
            'idTipo'         => '2',
            'Nombre'         => 'Espacios - Listado',
            'Descripcion'    => 'Permite la mantencion de los Espacios de las Reservas',
            'idLevelLimit'   => '4',
            'RutaWeb'        => 'mantencion/espacios/listado',
            'RutaController' => 'espaciosListado',
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
        $arrTableDel[] = ['table' => 'espacios_categorias'];
        $arrTableDel[] = ['table' => 'espacios_listado'];

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
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'mantencion/espacios/categorias/listAll',      'RutaController' => 'espaciosCategorias->listAll',      'Descripcion' => 'Listar Toda la Información',                     'idLevelLimit' => 1, 'Controller' => 'espaciosCategorias'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 2, 'RutaWeb' => 'mantencion/espacios/categorias/search',       'RutaController' => 'espaciosCategorias->UpdateList',   'Descripcion' => 'Filtrar datos',                                  'idLevelLimit' => 1, 'Controller' => 'espaciosCategorias'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'mantencion/espacios/categorias/updateList',   'RutaController' => 'espaciosCategorias->UpdateList',   'Descripcion' => 'Actualizar Lista',                               'idLevelLimit' => 2, 'Controller' => 'espaciosCategorias'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'mantencion/espacios/categorias/view/@id',     'RutaController' => 'espaciosCategorias->View',         'Descripcion' => 'Mostrar Detallado',                              'idLevelLimit' => 1, 'Controller' => 'espaciosCategorias'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'mantencion/espacios/categorias/getID/@id',    'RutaController' => 'espaciosCategorias->GetID',        'Descripcion' => 'Información para el formulario edición',         'idLevelLimit' => 2, 'Controller' => 'espaciosCategorias'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 2, 'RutaWeb' => 'mantencion/espacios/categorias',              'RutaController' => 'espaciosCategorias->Insert',       'Descripcion' => 'Crear Información',                              'idLevelLimit' => 3, 'Controller' => 'espaciosCategorias'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 2, 'RutaWeb' => 'mantencion/espacios/categorias/update',       'RutaController' => 'espaciosCategorias->Update',       'Descripcion' => 'Editar por post (modificar y subir archivos)',   'idLevelLimit' => 2, 'Controller' => 'espaciosCategorias'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 3, 'RutaWeb' => 'mantencion/espacios/categorias',              'RutaController' => 'espaciosCategorias->Delete',       'Descripcion' => 'Borrar dato y archivos',                         'idLevelLimit' => 4, 'Controller' => 'espaciosCategorias'];

                break;
            /******************************************/
            case 2:
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'mantencion/espacios/listado/listAll',      'RutaController' => 'espaciosListado->listAll',      'Descripcion' => 'Listar Toda la Información',                     'idLevelLimit' => 1, 'Controller' => 'espaciosListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 2, 'RutaWeb' => 'mantencion/espacios/listado/search',       'RutaController' => 'espaciosListado->UpdateList',   'Descripcion' => 'Filtrar datos',                                  'idLevelLimit' => 1, 'Controller' => 'espaciosListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'mantencion/espacios/listado/updateList',   'RutaController' => 'espaciosListado->UpdateList',   'Descripcion' => 'Actualizar Lista',                               'idLevelLimit' => 2, 'Controller' => 'espaciosListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'mantencion/espacios/listado/view/@id',     'RutaController' => 'espaciosListado->View',         'Descripcion' => 'Mostrar Detallado',                              'idLevelLimit' => 1, 'Controller' => 'espaciosListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 1, 'RutaWeb' => 'mantencion/espacios/listado/getID/@id',    'RutaController' => 'espaciosListado->GetID',        'Descripcion' => 'Información para el formulario edición',         'idLevelLimit' => 2, 'Controller' => 'espaciosListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 2, 'RutaWeb' => 'mantencion/espacios/listado',              'RutaController' => 'espaciosListado->Insert',       'Descripcion' => 'Crear Información',                              'idLevelLimit' => 3, 'Controller' => 'espaciosListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 2, 'RutaWeb' => 'mantencion/espacios/listado/update',       'RutaController' => 'espaciosListado->Update',       'Descripcion' => 'Editar por post (modificar y subir archivos)',   'idLevelLimit' => 2, 'Controller' => 'espaciosListado'];
                $arrRutas[] = ['idPermisos' => $permisosID, 'idMetodo' => 3, 'RutaWeb' => 'mantencion/espacios/listado',              'RutaController' => 'espaciosListado->Delete',       'Descripcion' => 'Borrar dato y archivos',                         'idLevelLimit' => 4, 'Controller' => 'espaciosListado'];

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
        $RutaController  = '"espaciosCategorias"';
        $RutaController .= ',"espaciosListado"';

        /******************************************/
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
            'table'      => 'espacios_categorias',
            'data'       => '`idCategoria` int(10) unsigned NOT NULL AUTO_INCREMENT,`Nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL',
            'primaryKey' => 'idCategoria',
            'comentario' => 'Creado desde el Instalador',
        ];
        $arrTables[] = [
            'table'      => 'espacios_listado',
            'data'       => '`idEspacio` int(10) unsigned NOT NULL AUTO_INCREMENT,`idCategoria` int(10) unsigned NOT NULL,`idEstado` int(10) unsigned NOT NULL, `Nombre` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,`nMaxPersonas` int(10) unsigned NOT NULL',
            'primaryKey' => 'idEspacio',
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
