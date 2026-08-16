<?php
/*******************************************************************************************************************/

use Predis\Command\Redis\SELECT;

/*                                              Se define la clase                                                 */
/*******************************************************************************************************************/
class reservasListado extends ControllerBase {

    /******************************************************************************/
    //Variables
    private $controllerName;
    private $FormInputs;
    private $Codification;
    private $DataDate;
    private $DataTime;
    private $DataNumbers;
    private $WidgetsCommon;
    private $ServerServer;
    private $DataText;

    /******************************************************************************/
    //Constructor
    public function __construct(){
        /*=========== Se instancian los datos ===========*/
        $DB_conn_1     = Database::getSQLConnection(ConfigData::MySQL_1);
        $queryBuilder  = new QueryBuilder();
        $checkData     = new CheckData();
        /*================== Instancias =================*/
        $this->controllerName = 'reservasListado';
		$this->FormInputs     = new UIFormInputs();
		$this->Codification   = new FunctionsSecurityCodification();
		$this->DataDate       = new FunctionsDataDate();
		$this->DataTime       = new FunctionsDataTime();
		$this->DataNumbers    = new FunctionsDataNumbers();
		$this->WidgetsCommon  = new UIWidgetsCommon();
		$this->ServerServer   = new FunctionsServerServer();
		$this->DataText       = new FunctionsDataText();
        /*========== Datos para la clase padre ==========*/
        parent::__construct($DB_conn_1, $queryBuilder, $checkData);
    }

    /******************************************************************************/
    /*                                  VISTAS                                    */
    /******************************************************************************/
    /******************************************************************************/
    //Listar Todo
    public function listAll($f3){
        /*******************************************************************/
        //Se genera la query
        $arrList = $this->getDataList('reservas_listado.idReserva!=0');

        /******************************/
        //Se genera la query
        $query = [
            'data'    => '
                espacios_listado.idEspacio AS ID1,
                espacios_listado.idCategoria AS ID2,
                CONCAT(espacios_listado.Nombre," ( Max. ",espacios_listado.nMaxPersonas," personas)") AS Nombre1,
                espacios_categorias.Nombre AS Nombre2',
            'table'   => 'espacios_listado',
            'join'    => 'LEFT JOIN espacios_categorias ON espacios_categorias.idCategoria = espacios_listado.idCategoria',
            'where'   => 'espacios_listado.idEstado=1',
            'group'   => '',
            'having'  => '',
            'order'   => 'espacios_categorias.Nombre ASC, espacios_listado.Nombre ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams     = ['query' => $query];
        $arrEspacios = $this->Base_GetList($xParams);

        /******************************/
        //Se genera la query
        $query = [
            'data'    => 'idPeriodicidad AS ID,Nombre',
            'table'   => 'periodicidad_listado',
            'join'    => '',
            'where'   => '',
            'group'   => '',
            'having'  => '',
            'order'   => 'Nombre ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams         = ['query' => $query];
        $arrPeriodicidad = $this->Base_GetList($xParams);

        /******************************/
        //Se genera la query
        $query = [
            'data'    => '
                recursos_listado.idRecurso,
                recursos_listado.Nombre,
                recursos_listado.Valor,
                core_tipos_cobro.Nombre AS TipoCobro',
            'table'   => 'recursos_listado',
            'join'    => 'LEFT JOIN core_tipos_cobro ON core_tipos_cobro.idTipoCobro = recursos_listado.idTipoCobro',
            'where'   => '',
            'group'   => '',
            'having'  => '',
            'order'   => 'recursos_listado.Nombre ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams     = ['query' => $query];
        $arrRecursos = $this->Base_GetList($xParams);

        /******************************/
        //Se genera la query
        $query = [
            'data'    => '
                idSolicitante AS ID,
                CONCAT_WS(" ", Nombre, ApellidoPat) AS Nombre',
            'table'   => 'solicitantes_listado',
            'join'    => '',
            'where'   => 'idEstado=1',
            'group'   => '',
            'having'  => '',
            'order'   => 'ApellidoPat ASC,Nombre ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams         = ['query' => $query];
        $arrSolicitantes = $this->Base_GetList($xParams);

        /******************************/
        //Se genera la query
        $query = [
            'data'    => 'idUnidades AS ID, Nombre',
            'table'   => 'unidades_listado',
            'join'    => '',
            'where'   => '',
            'group'   => '',
            'having'  => '',
            'order'   => 'Nombre ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams     = ['query' => $query];
        $arrUnidades = $this->Base_GetList($xParams);

        /******************************/
        //Se genera la query
        $query = [
            'data'    => 'idEstadoReserva AS ID, Nombre',
            'table'   => 'estados_listado',
            'join'    => '',
            'where'   => '',
            'group'   => '',
            'having'  => '',
            'order'   => 'Nombre ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams   = ['query' => $query];
        $arrEstado = $this->Base_GetList($xParams);

        /*******************************************************************/
        /*                         Imprimir Datos                          */
        /*******************************************************************/
        //Si hay resultados
        if($arrList['status'] && $arrEspacios['status'] && $arrPeriodicidad['status'] && $arrRecursos['status'] && $arrSolicitantes['status'] && $arrUnidades['status'] && $arrEstado['status']){

            /******************************************/
            //Datos enviados a la pagina
            $f3->data = [
                /*=========== Datos de la Pagina ===========*/
                'PageTitle'       => 'Listado Reservas',
                'PageDescription' => 'Listado Reservas.',
                'PageAuthor'      => ConfigAPP::SOFTWARE['SoftwareName'],
                'PageKeywords'    => ConfigAPP::SOFTWARE['SoftwareName'],
                'TableTitle'      => 'Listado Reservas',
                /*===========  Datos del usuario ===========*/
                'UserData'      => $this->getUserData($f3),
                'UserAccess'    => $this->getArrLevel($f3, $this->controllerName),
                /*===========   Funcionalidad   ===========*/
                'Fnc_FormInputs'      => $this->FormInputs,
                'Fnc_Codification'    => $this->Codification,
                'Fnc_ServerServer'    => $this->ServerServer,
                'Fnc_DataDate'        => $this->DataDate,
                'Fnc_DataTime'        => $this->DataTime,
                'Fnc_DataNumbers'     => $this->DataNumbers,
                /*=========== Datos Consultados ===========*/
                'arrList'          => $arrList['data'],
                'arrEspacios'      => $arrEspacios['data'],
                'arrPeriodicidad'  => $arrPeriodicidad['data'],
                'arrRecursos'      => $arrRecursos['data'],
                'arrSolicitantes'  => $arrSolicitantes['data'],
                'arrUnidades'      => $arrUnidades['data'],
                'arrEstado'        => $arrEstado['data'],
            ];

            /******************************************/
            //Se instancia la vista
            $this->showVista(1, $this->returnRutaVista(__DIR__, 'app').'/'.$this->controllerName.'-List.php');
        /*******************************************************************/
        //si no hay resultados
        } else {
            //Busco errores de la consulta
            $result = $this->mergeResponses([$arrList,$arrEspacios,$arrPeriodicidad,$arrRecursos,$arrSolicitantes,$arrUnidades,$arrEstado]);
            //Muestra los errores
            $this->showError(1, $f3, $result);
        }
    }

    /******************************************************************************/
    //List
    public function UpdateList($f3){
        /*******************************************************************/
        //Variables
        $WhereData_int     = 'idSolicitante,idUnidades,idPeriodicidad,idEspacio,idEstadoReserva';  //Datos búsqueda exacta
        $WhereData_string  = '';                                                                   //Datos búsqueda relativa
        $WhereData_between = 'Fecha-FechaInicio-FechaTermino';                                     //Datos búsqueda Between
        $whereInt          = '';                                                                   //se crea cadena
        /******************************************/
        //se validan las fechas
        $RespDataBetween = $this->searchValidateDates($WhereData_between);
        if($RespDataBetween!=''){
            Response::error($RespDataBetween, 500);
        }
        //agrego variable busqueda
        $whereInt = $this->searchWhere($whereInt, $WhereData_int, 'reservas_listado', 1);
        $whereInt = $this->searchWhere($whereInt, $WhereData_string, 'reservas_listado', 2);
        $whereInt = $this->searchWhere($whereInt, $WhereData_between, 'reservas_listado', 3);
        //Verifico si esta vacio
        $whereInt2 = $whereInt ? $whereInt . ' AND reservas_listado.idReserva!=0' : 'reservas_listado.idReserva!=0';

        /******************************/
        //Se genera la query
        $arrList = $this->getDataList($whereInt2);

        /*******************************************************************/
        /*                         Imprimir Datos                          */
        /*******************************************************************/
        //Si hay resultados
        if($arrList['status']){

            /******************************************/
            //Datos enviados a la pagina
            $f3->data = [
                /*=========== Datos de la Pagina ===========*/
                'TableTitle'      => 'Listado Reservas',
                /*===========  Datos del usuario ===========*/
                'UserData'      => $this->getUserData($f3),
                'UserAccess'    => $this->getArrLevel($f3, $this->controllerName),
                /*===========   Funcionalidad   ===========*/
                'Fnc_Codification'    => $this->Codification,
                'Fnc_DataDate'        => $this->DataDate,
                'Fnc_DataTime'        => $this->DataTime,
                /*=========== Datos Consultados ===========*/
                'arrList'         => $arrList['data'],
            ];

            /******************************************/
            //Se instancia la vista
            $this->showVista(2, $this->returnRutaVista(__DIR__, 'app').'/'.$this->controllerName.'-UpdateList.php');
        /*******************************************************************/
        //si no hay resultados
        } else {
            //Busco errores de la consulta
            $result = $this->mergeResponses([$arrList]);
            //Muestra los errores
            $this->showError(2, $f3, $result);
        }
    }

    /******************************************************************************/
    //View
    public function View($f3, $params){

        /******************************************/
        //Se genera la query
        $rowData     = $this->getDataDetail($this->Codification->encryptDecrypt('decrypt', $params['id']));
        $arrRecursos = $this->getDataDetailRecursos($this->Codification->encryptDecrypt('decrypt', $params['id']));

        /*******************************************************************/
        //Se genera la query
        $query = [
            'data'    => '
                reservas_listado_eventos.Evento,
                reservas_listado_eventos.FechaCreacion,
                usuarios_listado.Nombre AS Creador',
            'table'   => 'reservas_listado_eventos',
            'join'    => 'LEFT JOIN usuarios_listado       ON usuarios_listado.idUsuario     = reservas_listado_eventos.idUsuario',
            'where'   => 'reservas_listado_eventos.idReserva = "'.$this->Codification->encryptDecrypt('decrypt', $params['id']).'"',
            'group'   => '',
            'having'  => '',
            'order'   => 'reservas_listado_eventos.idEvento ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams    = ['query' => $query];
        $arrEventos = $this->Base_GetList($xParams);

        /*******************************************************************/
        /*                         Imprimir Datos                          */
        /*******************************************************************/
        //Si hay resultados
        if($rowData['status'] && $arrRecursos['status'] && $arrEventos['status']){
            /******************************************/
            //Datos enviados a la pagina
            $f3->data = [
                /*===========  Datos del usuario ===========*/
                'UserData'      => $this->getUserData($f3),
                'UserAccess'    => $this->getArrLevel($f3, $this->controllerName),
                /*===========   Funcionalidad   ===========*/
                'Fnc_WidgetsCommon'   => $this->WidgetsCommon,
                'Fnc_DataDate'        => $this->DataDate,
                'Fnc_DataTime'        => $this->DataTime,
                'Fnc_DataNumbers'     => $this->DataNumbers,
                'Fnc_DataText'        => $this->DataText,
                /*=========== Datos Consultados ===========*/
                'rowData'     => $rowData['data'],
                'arrRecursos' => $arrRecursos['data'],
                'arrEventos'  => $arrEventos['data'],
            ];

            /******************************************/
            //Se instancia la vista
            $this->showVista(2, $this->returnRutaVista(__DIR__, 'app').'/'.$this->controllerName.'-View.php');
        /*******************************************************************/
        //si no hay resultados
        } else {
            //Busco errores de la consulta
            $result = $this->mergeResponses([$rowData,$arrRecursos,$arrEventos]);
            //Muestra los errores
            $this->showError(2, $f3, $result);
        }
    }

    /******************************************************************************/
    //Resumen
    public function Resumen($f3, $params){
        /******************************************/
        //Se genera la query
        $rowData     = $this->getDataDetail($this->Codification->encryptDecrypt('decrypt', $params['id']));
        $arrRecursos = $this->getDataDetailRecursos($this->Codification->encryptDecrypt('decrypt', $params['id']));

        /*******************************************************************/
        //Se genera la query
        $query = [
            'data'    => '
                espacios_listado.idEspacio AS ID1,
                espacios_listado.idCategoria AS ID2,
                CONCAT(espacios_listado.Nombre," ( Max. ",espacios_listado.nMaxPersonas," personas)") AS Nombre1,
                espacios_categorias.Nombre AS Nombre2',
            'table'   => 'espacios_listado',
            'join'    => 'LEFT JOIN espacios_categorias ON espacios_categorias.idCategoria = espacios_listado.idCategoria',
            'where'   => 'espacios_listado.idEstado=1',
            'group'   => '',
            'having'  => '',
            'order'   => 'espacios_categorias.Nombre ASC, espacios_listado.Nombre ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams     = ['query' => $query];
        $arrEspacios = $this->Base_GetList($xParams);

        /*******************************************************************/
        //Se genera la query
        $query = [
            'data'    => 'idPeriodicidad AS ID,Nombre',
            'table'   => 'periodicidad_listado',
            'join'    => '',
            'where'   => '',
            'group'   => '',
            'having'  => '',
            'order'   => 'Nombre ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams         = ['query' => $query];
        $arrPeriodicidad = $this->Base_GetList($xParams);

        /******************************/
        //Se genera la query
        $query = [
            'data'    => '
                recursos_listado.idRecurso,
                recursos_listado.Nombre,
                recursos_listado.Valor,
                core_tipos_cobro.Nombre AS TipoCobro,
                recursos_listado.idRecurso AS ID,
                (SELECT idRecursoSolicitado FROM reservas_listado_recursos WHERE idRecurso = ID AND idReserva = '.$this->Codification->encryptDecrypt('decrypt', $params['id']).' LIMIT 1) AS RecursoSolicitadoID',
            'table'   => 'recursos_listado',
            'join'    => 'LEFT JOIN core_tipos_cobro ON core_tipos_cobro.idTipoCobro = recursos_listado.idTipoCobro',
            'where'   => '',
            'group'   => '',
            'having'  => '',
            'order'   => 'recursos_listado.Nombre ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams    = ['query' => $query];
        $arrRecurso = $this->Base_GetList($xParams);

        /******************************/
        //Se genera la query
        $query = [
            'data'    => '
                idSolicitante AS ID,
                CONCAT_WS(" ", Nombre, ApellidoPat) AS Nombre',
            'table'   => 'solicitantes_listado',
            'join'    => '',
            'where'   => 'idEstado=1',
            'group'   => '',
            'having'  => '',
            'order'   => 'ApellidoPat ASC,Nombre ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams         = ['query' => $query];
        $arrSolicitantes = $this->Base_GetList($xParams);

        /******************************/
        //Se genera la query
        $query = [
            'data'    => 'idUnidades AS ID, Nombre',
            'table'   => 'unidades_listado',
            'join'    => '',
            'where'   => '',
            'group'   => '',
            'having'  => '',
            'order'   => 'Nombre ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams     = ['query' => $query];
        $arrUnidades = $this->Base_GetList($xParams);

        /******************************/
        //Se genera la query
        $query = [
            'data'    => 'idEstadoReserva AS ID, Nombre',
            'table'   => 'estados_listado',
            'join'    => '',
            'where'   => '',
            'group'   => '',
            'having'  => '',
            'order'   => 'Nombre ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams   = ['query' => $query];
        $arrEstado = $this->Base_GetList($xParams);

        /*******************************************************************/
        /*                         Imprimir Datos                          */
        /*******************************************************************/
        //Si hay resultados
        if($rowData['status'] && $arrRecursos['status'] && $arrEspacios['status'] && $arrPeriodicidad['status'] && $arrRecurso['status'] && $arrSolicitantes['status'] && $arrUnidades['status'] && $arrEstado['status']){
            /******************************************/
            //Datos enviados a la pagina
            $f3->data = [
                /*=========== Datos de la Pagina ===========*/
                'PageTitle'        => 'Resumen Reservas',
                'PageDescription'  => 'Resumen Reservas.',
                'PageAuthor'       => ConfigAPP::SOFTWARE['SoftwareName'],
                'PageKeywords'     => ConfigAPP::SOFTWARE['SoftwareName'],
                /*===========  Datos del usuario ===========*/
                'UserData'      => $this->getUserData($f3),
                'UserAccess'    => $this->getArrLevel($f3, $this->controllerName),
                /*===========   Funcionalidad   ===========*/
                'Fnc_FormInputs'      => $this->FormInputs,
                'Fnc_Codification'    => $this->Codification,
                'Fnc_ServerServer'    => $this->ServerServer,
                'Fnc_WidgetsCommon'   => $this->WidgetsCommon,
                'Fnc_DataDate'        => $this->DataDate,
                'Fnc_DataTime'        => $this->DataTime,
                'Fnc_DataNumbers'     => $this->DataNumbers,
                'Fnc_DataText'        => $this->DataText,
                /*=========== Datos Consultados ===========*/
                'rowData'           => $rowData['data'],
                'arrRecursos'       => $arrRecursos['data'],
                'arrEspacios'       => $arrEspacios['data'],
                'arrPeriodicidad'   => $arrPeriodicidad['data'],
                'arrRecurso'        => $arrRecurso['data'],
                'arrSolicitantes'   => $arrSolicitantes['data'],
                'arrUnidades'       => $arrUnidades['data'],
                'arrEstado'         => $arrEstado['data'],
            ];

            /******************************************/
            //Se instancia la vista
            $this->showVista(1, $this->returnRutaVista(__DIR__, 'app').'/'.$this->controllerName.'-Resumen.php');
        /*******************************************************************/
        //si no hay resultados
        } else {
            //Busco errores de la consulta
            $result = $this->mergeResponses([$rowData,$arrRecursos,$arrEspacios,$arrPeriodicidad,$arrRecurso,$arrSolicitantes,$arrUnidades,$arrEstado]);
            //Muestra los errores
            $this->showError(1, $f3, $result);
        }
    }

    /******************************************************************************/
    //Resumen-Update
    public function ResumenUpdate($f3, $params){
        /******************************************/
        //Se genera la query
        $rowData     = $this->getDataDetail($this->Codification->encryptDecrypt('decrypt', $params['id']));
        $arrRecursos = $this->getDataDetailRecursos($this->Codification->encryptDecrypt('decrypt', $params['id']));

        /*******************************************************************/
        /*                         Imprimir Datos                          */
        /*******************************************************************/
        //Si hay resultados
        if($rowData['status']){
            /******************************************/
            //Datos enviados a la pagina
            $f3->data = [
                /*===========  Datos del usuario ===========*/
                'UserData'      => $this->getUserData($f3),
                'UserAccess'    => $this->getArrLevel($f3, $this->controllerName),
                /*===========   Funcionalidad   ===========*/
                'Fnc_WidgetsCommon'   => $this->WidgetsCommon,
                'Fnc_DataDate'        => $this->DataDate,
                'Fnc_DataTime'        => $this->DataTime,
                'Fnc_DataNumbers'     => $this->DataNumbers,
                /*=========== Datos Consultados ===========*/
                'rowData'          => $rowData['data'],
                'arrRecursos'      => $arrRecursos['data'],
            ];

            /******************************************/
            //Se instancia la vista
            $this->showVista(2, $this->returnRutaVista(__DIR__, 'app').'/'.$this->controllerName.'-Resumen-Update.php');
        /*******************************************************************/
        //si no hay resultados
        } else {
            //Busco errores de la consulta
            $result = $this->mergeResponses([$rowData]);
            //Muestra los errores
            $this->showError(2, $f3, $result);
        }
    }

    /******************************************************************************/
    //Se obtiene la lista
    private function getDataList($filter){
        //Se genera la query
        $query = [
            'data'    => '
                reservas_listado.idReserva,
                reservas_listado.Fecha,
                reservas_listado.Hora_Inicio,
                reservas_listado.Hora_Termino,
                reservas_listado.NAsistentes,

                estados_listado.Nombre AS EstadoNombre,
                estados_listado.Color AS EstadoColor,
                solicitantes_listado.Nombre AS SolicitanteNombre,
                solicitantes_listado.ApellidoPat AS SolicitanteApellido,
                solicitantes_listado.Email AS SolicitanteEmail,
                unidades_listado.Nombre AS Unidad,
                periodicidad_listado.Nombre AS Periodicidad,
                espacios_listado.Nombre AS EspacioNombre,
                espacios_listado.nMaxPersonas AS EspacioMaxPersonas',
            'table'   => 'reservas_listado',
            'join'    => '
                LEFT JOIN estados_listado       ON estados_listado.idEstadoReserva     = reservas_listado.idEstadoReserva
                LEFT JOIN solicitantes_listado  ON solicitantes_listado.idSolicitante  = reservas_listado.idSolicitante
                LEFT JOIN unidades_listado      ON unidades_listado.idUnidades         = reservas_listado.idUnidades
                LEFT JOIN periodicidad_listado  ON periodicidad_listado.idPeriodicidad = reservas_listado.idPeriodicidad
                LEFT JOIN espacios_listado      ON espacios_listado.idEspacio          = reservas_listado.idEspacio',
            'where'   => $filter,
            'group'   => '',
            'having'  => '',
            'order'   => 'reservas_listado.Fecha DESC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams = ['query' => $query];
        //Se retornan los datos
        return $this->Base_GetList($xParams);
    }

    /******************************************************************************/
    //Se obtienen los detalles
    private function getDataDetail($ID){
        //Se genera la query
        $query = [
            'data'    => '
                reservas_listado.idReserva,
                reservas_listado.idEstadoReserva,
                reservas_listado.idSolicitante,
                reservas_listado.idUnidades,
                reservas_listado.Fecha,
                reservas_listado.Hora_Inicio,
                reservas_listado.Hora_Termino,
                reservas_listado.idPeriodicidad,
                reservas_listado.NAsistentes,
                reservas_listado.idEspacio,
                reservas_listado.Observaciones,
                reservas_listado.Costo,
                reservas_listado.CentroCosto,

                estados_listado.Nombre AS EstadoNombre,
                estados_listado.Color AS EstadoColor,
                solicitantes_listado.Nombre AS SolicitanteNombre,
                solicitantes_listado.ApellidoPat AS SolicitanteApellido,
                solicitantes_listado.Email AS SolicitanteEmail,
                unidades_listado.Nombre AS Unidad,
                periodicidad_listado.Nombre AS Periodicidad,
                CONCAT(espacios_listado.Nombre," ( Max. ",espacios_listado.nMaxPersonas," personas)") AS Espacio',
            'table'   => 'reservas_listado',
            'join'    => '
                LEFT JOIN estados_listado       ON estados_listado.idEstadoReserva     = reservas_listado.idEstadoReserva
                LEFT JOIN solicitantes_listado  ON solicitantes_listado.idSolicitante  = reservas_listado.idSolicitante
                LEFT JOIN unidades_listado      ON unidades_listado.idUnidades         = reservas_listado.idUnidades
                LEFT JOIN periodicidad_listado  ON periodicidad_listado.idPeriodicidad = reservas_listado.idPeriodicidad
                LEFT JOIN espacios_listado      ON espacios_listado.idEspacio          = reservas_listado.idEspacio',
            'where'   => 'reservas_listado.idReserva = "'.$ID.'"',
            'group'   => '',
            'having'  => '',
            'order'   => ''
        ];
        //Ejecuto la query
        $xParams = ['query' => $query];
        //Se retornan los datos
        return $this->Base_GetByID($xParams);
    }

    /******************************************************************************/
    //Se obtienen los detalles
    private function getDataDetailRecursos($ID){
        //Se genera la query
        $query = [
            'data'    => '
                recursos_listado.idRecurso,
                recursos_listado.Nombre,
                recursos_listado.Valor,
                core_tipos_cobro.Nombre AS TipoCobro',
            'table'   => 'reservas_listado_recursos',
            'join'    => '
                LEFT JOIN recursos_listado  ON recursos_listado.idRecurso   = reservas_listado_recursos.idRecurso
                LEFT JOIN core_tipos_cobro  ON core_tipos_cobro.idTipoCobro = recursos_listado.idTipoCobro',
            'where'   => 'reservas_listado_recursos.idReserva = "'.$ID.'"',
            'group'   => '',
            'having'  => '',
            'order'   => 'recursos_listado.Nombre',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams    = ['query' => $query];
        //Se retornan los datos
        return $this->Base_GetList($xParams);

    }

    /******************************************************************************/
    /*                                  DATOS                                     */
    /******************************************************************************/
    /******************************************************************************/
    //Crear
    public function Insert($f3){

        /******************************/
        //Se genera el chequeo
        $DataCheck = $this->dataCheck($_POST);

        /******************************/
        //Se validan datos ingresados
        $checkDate = $this->checkDate($_POST['Fecha']);
        if($checkDate!=''){Response::error($checkDate, 500);}

        $checkNAsist = $this->checkNAsist($_POST['idEspacio'], $_POST['NAsistentes']);
        if($checkNAsist!=''){Response::error($checkNAsist, 500);}

        $checkExist = $this->checkExist($_POST, 1);
        if($checkExist!=''){Response::error($checkExist, 500);}

        $checkTime = $this->checkTime($_POST['Hora_Inicio'], $_POST['Hora_Termino']);
        if($checkTime!=''){Response::error($checkTime, 500);}

        /******************************/
        //Se consultan los recursos
        //Se genera la query
        $query = [
            'data'    => 'idRecurso,Valor,idTipoCobro',
            'table'   => 'recursos_listado',
            'join'    => '',
            'where'   => '',
            'group'   => '',
            'having'  => '',
            'order'   => 'idRecurso ASC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams     = ['query' => $query];
        $arrRecursos = $this->Base_GetList($xParams);

        /*******************************************************************/
        //Se obtiene el costo
        $_POST['Costo'] = $this->getCosto($arrRecursos, $_POST);

        /******************************/
        //Verifico si existe
        if(isset($_POST['Fecha'])&&$_POST['Fecha']!=''){
            $_POST['Fecha_Dia']     = $this->DataDate->fecha2NdiaMes($_POST['Fecha']);
            $_POST['Fecha_Semana']  = $this->DataDate->fecha2NSemana($_POST['Fecha']);
            $_POST['Fecha_Mes']     = $this->DataDate->fecha2NMes($_POST['Fecha']);
            $_POST['Fecha_Ano']     = $this->DataDate->fecha2Ano($_POST['Fecha']);
        }

        /******************************/
        //Se genera la query
        $query = [
            'data'      => 'idEstadoReserva,idSolicitante,idUnidades,Fecha,Fecha_Dia,Fecha_Semana,Fecha_Mes,Fecha_Ano,Hora_Inicio,Hora_Termino,idPeriodicidad,NAsistentes,idEspacio,Observaciones,Costo,CentroCosto',
            'required'  => 'idEstadoReserva,idSolicitante,idUnidades,Fecha,Fecha_Dia,Fecha_Semana,Fecha_Mes,Fecha_Ano,Hora_Inicio,Hora_Termino,idPeriodicidad,NAsistentes,idEspacio',
            'unique'    => '',
            'encode'    => '',
            'table'     => 'reservas_listado',
            'Post'      => $_POST
        ];
        //Ejecuto la query
        $xParams  = ['DataCheck' => $DataCheck, 'query' => $query];
        $Response = $this->Base_insert($xParams);

        /*******************************************************************/
        // Si hay datos
        if ($arrRecursos['status']){
            //Recorro los permisos
            foreach ($arrRecursos['data'] as $recursos){
                //Se verifica si esta marcado
                switch ($_POST['switch_'.$recursos['idRecurso']]) {
                    /*******************************************************************/
                    //Activo
                    case 2:
                        /******************************/
                        //Se borran los datos
                        $Post = [
                            'idReserva'  => $Response['data'],
                            'idRecurso'  => $recursos['idRecurso'],
                        ];
                        /******************************/
                        //Se genera la query
                        $query = [
                            'data'      => 'idReserva,idRecurso',
                            'required'  => 'idReserva,idRecurso',
                            'unique'    => '',
                            'encode'    => '',
                            'table'     => 'reservas_listado_recursos',
                            'Post'      => $Post
                        ];
                        //Ejecuto la query
                        $xParams = ['DataCheck' => '', 'query' => $query];
                        $this->Base_insert($xParams);

                        break;
                }
            }
        }

        /*******************************************************************/
        //Se guarda el historial
        $this->saveHistory($Response['data'], $_POST['idUsuario'], 'Reserva Creada', $_POST['FechaCreacion']);

        /*******************************************************************/
        //Se verifica si se checkbox esta marcado
        if(isset($_POST['notificar'])&&$_POST['notificar'] == 2){
            $this->sendNoti($f3, 1, 'Se ha creado una nueva Reserva', $_POST['idEstadoReserva'], $_POST['idSolicitante']);
        }

        /******************************/
        // Se asume que $Response contendrá un array de errores/datos, un ID numérico o algún otro valor.
        if ($Response['status']){
            // Si es un ID numérico, encripta y envía con código 200 (OK)
            $Data = $this->Codification->encryptDecrypt('encrypt', $Response['data']);
            Response::success($Data);
        } else {
            // Si es un array (errores o datos no esperados) o cualquier otra cosa no numérica,
            // se asume que es un error o una respuesta que debe enviarse con código 500 (Error del Servidor)
            Response::error('Error al operar con la Base de Datos', 500, $Response['error']);
        }
    }

    /******************************************************************************/
    //Editar por put (solo modificar datos)
    //Editar por post (modificar y subir archivos)
    public function Update($f3){
        //Verificacion metodo POST
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {

            /******************************/
            //Se obtienen los cambios
            $temp         = $this->getChanges($_POST);
            $Comparacion  = $temp['data']; //Cadena con los cambios
            $sendMail     = $temp['avance']; //Valor para envio de correo (true si, false no)

            /******************************/
            //Se genera el chequeo
            $DataCheck = $this->dataCheck($_POST);

            /******************************/
            //Se validan datos ingresados
            $checkDate = $this->checkDate($_POST['Fecha']);
            if($checkDate!=''){Response::error($checkDate, 500);}

            $checkNAsist = $this->checkNAsist($_POST['idEspacio'], $_POST['NAsistentes']);
            if($checkNAsist!=''){Response::error($checkNAsist, 500);}

            $checkExist = $this->checkExist($_POST, 2);
            if($checkExist!=''){Response::error($checkExist, 500);}

            $checkTime = $this->checkTime($_POST['Hora_Inicio'], $_POST['Hora_Termino']);
            if($checkTime!=''){Response::error($checkTime, 500);}

            /******************************/
            //Se consultan los recursos
            //Se genera la query
            $query = [
                'data'    => '
                    idRecurso,
                    idRecurso AS ID,
                    Nombre,
                    Valor,
                    idTipoCobro,
                    (SELECT idRecursoSolicitado FROM reservas_listado_recursos WHERE idRecurso = ID AND idReserva = '.$_POST['idReserva'].' LIMIT 1) AS RecursoSolicitadoID',
                'table'   => 'recursos_listado',
                'join'    => '',
                'where'   => '',
                'group'   => '',
                'having'  => '',
                'order'   => 'idRecurso ASC',
                'limit'   => ConfigAPP::APP["N_MaxItems"]
            ];
            //Ejecuto la query
            $xParams     = ['query' => $query];
            $arrRecursos = $this->Base_GetList($xParams);

            /*******************************************************************/
            //Se obtiene el costo
            $_POST['Costo'] = $this->getCosto($arrRecursos, $_POST);

            /******************************/
            //Verifico si existe
            if(isset($_POST['Fecha'])&&$_POST['Fecha']!=''){
                $_POST['Fecha_Dia']     = $this->DataDate->fecha2NdiaMes($_POST['Fecha']);
                $_POST['Fecha_Semana']  = $this->DataDate->fecha2NSemana($_POST['Fecha']);
                $_POST['Fecha_Mes']     = $this->DataDate->fecha2NMes($_POST['Fecha']);
                $_POST['Fecha_Ano']     = $this->DataDate->fecha2Ano($_POST['Fecha']);
            }

            /******************************/
            //Se genera la query
            $query = [
                'data'      => 'idReserva,idEstadoReserva,idSolicitante,idUnidades,Fecha,Fecha_Dia,Fecha_Semana,Fecha_Mes,Fecha_Ano,Hora_Inicio,Hora_Termino,idPeriodicidad,NAsistentes,idEspacio,Observaciones,Costo,CentroCosto',
                'required'  => 'idEstadoReserva,idSolicitante,idUnidades,Fecha,Fecha_Dia,Fecha_Semana,Fecha_Mes,Fecha_Ano,Hora_Inicio,Hora_Termino,idPeriodicidad,NAsistentes,idEspacio',
                'unique'    => '',
                'encode'    => '',
                'table'     => 'reservas_listado',
                'where'     => 'idReserva',
                'Post'      => $_POST,
            ];
            //Ejecuto la query
            $xParams  = ['DataCheck' => $DataCheck, 'query' => $query];
            $Response = $this->Base_update($xParams);

            /*******************************************************************/
            // Si hay datos
            if ($arrRecursos['status']){
                //Recorro los permisos
                foreach ($arrRecursos['data'] as $recursos){
                    //Se verifica si esta marcado
                    switch ($_POST['switch_'.$recursos['idRecurso']]) {
                        /*******************************************************************/
                        //Inactivo
                        case 1:
                            //Se verifica si permiso existe
                            switch ($recursos['RecursoSolicitadoID']) {
                                /*******************************************************************/
                                //No existe permiso previo
                                case 0:
                                    //nada
                                    break;
                                /*******************************************************************/
                                //Si hay al menos un permiso
                                default:
                                    /******************************/
                                    //Se borran los datos
                                    $Post = [
                                        'idRecursoSolicitado' => $this->Codification->encryptDecrypt('encrypt', $recursos['RecursoSolicitadoID']),
                                    ];

                                    /******************************/
                                    //Se genera la query
                                    $query = [
                                        'files'       => '',
                                        'table'       => 'reservas_listado_recursos',
                                        'where'       => 'idRecursoSolicitado',
                                        'SubCarpeta'  => '',
                                        'Post'        => $Post
                                    ];
                                    //Ejecuto la query
                                    $xParams    = ['query' => $query];
                                    $delConfirm = $this->Base_delete($xParams);
                                    // Se asume que $Response contendrá un array de errores/datos, un true o algún otro valor.
                                    if ($delConfirm['status']){
                                        //Se agrega el dato
                                        $Comparacion .= '<br> - se elimina el recurso '.$recursos['Nombre'];
                                    }
                                    break;
                            }
                            break;
                        /*******************************************************************/
                        //Activo
                        case 2:
                            //Verifico si existe
                            switch ($recursos['RecursoSolicitadoID']) {
                                /*******************************************************************/
                                //Si no hay permisos se crea
                                case 0:
                                    /******************************/
                                    //Se borran los datos
                                    $Post = [
                                        'idReserva'  => $_POST['idReserva'],
                                        'idRecurso'  => $recursos['idRecurso'],
                                    ];
                                    /******************************/
                                    //Se genera la query
                                    $query = [
                                        'data'      => 'idReserva,idRecurso',
                                        'required'  => 'idReserva,idRecurso',
                                        'unique'    => '',
                                        'encode'    => '',
                                        'table'     => 'reservas_listado_recursos',
                                        'Post'      => $Post
                                    ];
                                    //Ejecuto la query
                                    $xParams = ['DataCheck' => '', 'query' => $query];
                                    $addConfirm = $this->Base_insert($xParams);
                                    // Se asume que $Response contendrá un array de errores/datos, un true o algún otro valor.
                                    if ($addConfirm['status']){
                                        //Se agrega el dato
                                        $Comparacion .= '<br> - se agrega el recurso '.$recursos['Nombre'];
                                    }
                                    break;
                            }
                            break;
                    }
                }
            }

            /*******************************************************************/
            //Se guarda el historial
            $this->saveHistory($_POST['idReserva'], $_POST['idUsuario'], ($Comparacion!='' ? $Comparacion : 'No hay modificaciones'), $_POST['FechaCreacion']);

            /*******************************************************************/
            //Se verifica si se checkbox esta marcado
            if($sendMail){
                $this->sendNoti($f3, 2, 'Se ha actualizado la Reserva', $_POST['idEstadoReserva'], $_POST['idSolicitante']);
            }

            /******************************/
            // Se asume que $Response contendrá un array de errores/datos, un true o algún otro valor.
            if ($Response['status']){
                // Devuelvo $Response con código 200 (OK)
                Response::success($Response['data']);
            } else {
                // Si es un array (errores o datos no esperados) o cualquier otra cosa no numérica,
                // se asume que es un error o una respuesta que debe enviarse con código 500 (Error del Servidor)
                Response::error('Error al operar con la Base de Datos', 500, $Response['error']);
            }
        }else {
            // Request Method no esperado
            Response::error('Error en el Request Method', 500);
        }
    }

    /******************************************************************************/
    //Borrar dato y archivos
    public function Delete(){
        //Verificacion metodo PUT
        if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
            //Se parsean los datos
            parse_str(file_get_contents("php://input"),$dataDelete);
            /******************************/
            //Se genera la query
            $query = [
                'files'       => '',
                'table'       => 'reservas_listado',
                'where'       => 'idReserva',
                'SubCarpeta'  => '',
                'Post'        => $dataDelete
            ];
            //Ejecuto la query
            $xParams  = ['query' => $query];
            $Response = $this->Base_delete($xParams);

            /******************************/
            // Se asume que $Response contendrá un array de errores/datos, un true o algún otro valor.
            if ($Response['status']){
                /************************************************/
                //Listado de las tablas a eliminar los datos relacionados
                $arrTableDel  = array();
                $arrTableDel[] = ['table' => 'reservas_listado_eventos'];
                $arrTableDel[] = ['table' => 'reservas_listado_recursos'];

                /************************************************/
                //Verifico si existe
                if($arrTableDel){
                    //recorro
                    foreach ($arrTableDel as $tblDel) {
                        //Se genera la query
                        $query = ['files' => '', 'table' => $tblDel['table'], 'where' => 'idReserva', 'SubCarpeta' => '', 'Post' => $dataDelete];
                        //Ejecuto la query
                        $xParams = ['query' => $query];
                        $this->Base_delete($xParams);
                    }
                }

                /******************************/
                // Devuelvo $Response con código 200 (OK)
                Response::success($Response['data']);
            } else {
                // Si es un array (errores o datos no esperados) o cualquier otra cosa no numérica,
                // se asume que es un error o una respuesta que debe enviarse con código 500 (Error del Servidor)
                Response::error('Error al operar con la Base de Datos', 500, $Response['error']);
            }
        }else {
            // Request Method no esperado
            Response::error('Error en el Request Method', 500);
        }
    }


    /******************************************************************************/
    /*                             Métodos privados                               */
    /******************************************************************************/
    /******************************************************************************/
    //Se validan los datos
    private function dataCheck($POST){
        //Variables
        $DataChecking = [
            'emptyData'                 => '',
            'encode'                    => '',
            'ValidarEmail'              => '',
            'ValidarNumero'             => 'idReserva,idEstadoReserva,idSolicitante,idUnidades,idPeriodicidad,idEspacio,Fecha_Dia,Fecha_Semana,Fecha_Mes,Fecha_Ano,NAsistentes,Costo',
            'ValidarEntero'             => 'idReserva,idEstadoReserva,idSolicitante,idUnidades,idPeriodicidad,idEspacio,Fecha_Dia,Fecha_Semana,Fecha_Mes,Fecha_Ano,NAsistentes,Costo',
            'ValidarRut'                => '',
            'ValidarPatente'            => '',
            'ValidarFecha'              => 'Fecha',
            'ValidarHora'               => 'Hora_Inicio,Hora_Termino',
            'ValidarURL'                => '',
            'ValidarLargoMinimo'        => 'Observaciones,CentroCosto',
            'ValidarLargoMinimoN'       => 3,
            'ValidarLargoMaximo'        => 'CentroCosto',
            'ValidarLargoMaximoN'       => 255,
            'ValidarPalabrasCensuradas' => 'Observaciones,CentroCosto',
            'ValidarEspaciosVacios'     => '',
            'ValidarMayusculas'         => '',
            'ValidarCoincidencias'      => '',
            'ValidarDominioEmail'       => '',
            'ValidarPasswordSegura'     => '',
            'ValidarFechaRango'         => '',
            'ValidarEdadMinima'         => '',
            'ValidarJSON'               => '',
            'ValidarUUID'               => '',
            'ValidarIP'                 => '',
            'ValidarSoloAlfanumerico'   => '',
            'ValidarSoloLetras'         => '',
            'Post'                      => $POST,
        ];
        //Devuelvo
        return $DataChecking;
    }

    //Se valida la fecha ingresada contra la fecha actual
    private function checkDate($Date){
        //Verifico que la fecha ingresada no sea inferior a la actual
        if($Date < $this->ServerServer->fechaActual()){
            return 'La fecha ingresada es inferior a la fecha actual';
        }
        //Se retorna vacio en caso de no haber problemas
        return '';
    }

    //Verifica las horas, si la hora de termino inferior a la de ingreso
    private function checkTime($horaInicio, $horaTermino){
        // Elimina espacios
        $horaInicio  = trim($horaInicio);
        $horaTermino = trim($horaTermino);

        // Convierte HH:MM:SS a HH:MM si corresponde
        if (strlen($horaInicio) === 8) {
            $horaInicio = substr($horaInicio, 0, 5);
        }

        if (strlen($horaTermino) === 8) {
            $horaTermino = substr($horaTermino, 0, 5);
        }

        // Validar formato HH:MM
        if (
            !preg_match('/^(?:[01]\d|2[0-3]):[0-5]\d$/', $horaInicio) ||
            !preg_match('/^(?:[01]\d|2[0-3]):[0-5]\d$/', $horaTermino)
        ) {
            return 'La hora de termino es inferior a la hora de inicio 1'.$horaInicio;
        }

        // Convertir a minutos desde las 00:00
        [$horaI, $minutoI] = array_map('intval', explode(':', $horaInicio));
        [$horaT, $minutoT] = array_map('intval', explode(':', $horaTermino));

        $inicio  = ($horaI * 60) + $minutoI;
        $termino = ($horaT * 60) + $minutoT;

        // Verifico la fecha
        if($inicio >= $termino){
            return 'La hora de termino es inferior a la hora de inicio 2';
        }

        //Se retorna vacio en caso de no haber problemas
        return '';
    }

    //Se verifica el numero de asistentes
    private function checkNAsist($EspacioID, $NAsistentes){
        //Se genera la query
        $query = [
            'data'    => 'nMaxPersonas',
            'table'   => 'espacios_listado',
            'join'    => '',
            'where'   => 'idEspacio = "'.$EspacioID.'"',
            'group'   => '',
            'having'  => '',
            'order'   => ''
        ];
        //Ejecuto la query
        $xParams = ['query' => $query];
        $rowData = $this->Base_GetByID($xParams);

        //Se verifica si el espacio seleccionado tiene la capacidad necesaria para los asistentes
        if($rowData['status'] && $rowData['data']['nMaxPersonas'] < $NAsistentes){
            return 'El numero de asistentes es superior a la capacidad del espacio';
        }
        //Se retorna vacio en caso de no haber problemas
        return '';
    }

    //Se verifica si hay una reserva preexistente
    private function checkExist($Post, $Type){
        /*********************** verificasion del dia ***********************/
        //Se arma el where
        $where  = 'idEspacio = "'.$Post['idEspacio'].'"';
        $where .= ' AND Fecha = "'.$Post['Fecha'].'"';
        $where .= ' AND Hora_Inicio < "'.$Post['Hora_Termino'].'"';
        $where .= ' AND Hora_Termino > "'.$Post['Hora_Inicio'].'"';
        //una distinta a la actual
        $where .= $Type==2 ? ' AND idReserva != "'.$_POST['idReserva'].'"' : '';
        //Se genera la query
        $query = [
            'data'    => 'idReserva',
            'table'   => 'reservas_listado',
            'join'    => '',
            'where'   => $where,
            'group'   => '',
            'having'  => '',
            'order'   => ''
        ];
        //Ejecuto la query
        $xParams = ['query' => $query];
        $nData   = $this->Base_GetCountData($xParams);
        //Si hay datos se devuelve el error
        if($nData['data'] && $nData['data'] !=0){
            return 'Ya hay una solicitud programada en la misma fecha y hora';
        }
        //Se retorna vacio en caso de no haber problemas
        return '';
    }

    //Se hace el calculo de los costos
    private function getCosto($arrRecursos, $Post){
        //Variables
        $Costo = 0; //Variable con el costo

        // Si hay datos
        if ($arrRecursos['status']){
            //Recorro los permisos
            foreach ($arrRecursos['data'] as $recursos){
                //Se verifica si esta marcado
                switch ($Post['switch_'.$recursos['idRecurso']]) {
                    //Activo
                    case 2:
                        switch ($recursos['idTipoCobro']) {
                            case 1: $Costo += 0;                                           break; //Sin Costo
                            case 2: $Costo += $recursos['Valor'];                          break; //Por Reserva
                            case 3: $Costo += ($recursos['Valor'] * $Post['NAsistentes']); break; //Por Asistente
                        }
                        break;
                }
            }
        }
        //Se guarda el costo
        return $Costo;
    }

    //Se verifica si hay cambios
    private function getChanges($Post){

        /*****************************/
        //Se genera la query
        $query = [
            'data'    => 'idEstadoReserva,idSolicitante,idUnidades,Fecha,Hora_Inicio,Hora_Termino,idPeriodicidad,NAsistentes,idEspacio,Costo,CentroCosto',
            'table'   => 'reservas_listado',
            'join'    => '',
            'where'   => 'idReserva = '.$Post['idReserva'],
            'group'   => '',
            'having'  => '',
            'order'   => ''
        ];
        //Ejecuto la query
        $xParams = ['query' => $query];
        $rowData = $this->Base_GetByID($xParams);

        /*****************************/
        //Variable vacia
        $Comparacion         = array();
        $Comparacion['data'] = '';
        //Se hacen las comparaciones
        $Comparacion['data'] .= ($Post['idEstadoReserva'] != $rowData['data']['idEstadoReserva'])                        ? '<br> - se modifica el estado de la reserva' : '';
        $Comparacion['data'] .= ($Post['idUnidades'] != $rowData['data']['idUnidades'])                                  ? '<br> - se cambia la unidad' : '';
        $Comparacion['data'] .= ($Post['idSolicitante'] != $rowData['data']['idSolicitante'])                            ? '<br> - se modifica el solicitante' : '';
        $Comparacion['data'] .= ($Post['Fecha'] != $rowData['data']['Fecha'])                                            ? '<br> - se cambia la fecha (de '.$this->DataDate->fechaEstandar($rowData['data']['Fecha']).' a '.$this->DataDate->fechaEstandar($Post['Fecha']).')' : '';
        $Comparacion['data'] .= ($Post['Hora_Inicio'] != $rowData['data']['Hora_Inicio'])                                ? '<br> - se cambia la hora de inicio (de '.$this->DataTime->formatoHoraEstandar($rowData['data']['Hora_Inicio']).' a '.$this->DataTime->formatoHoraEstandar($Post['Hora_Inicio']).')' : '';
        $Comparacion['data'] .= ($Post['Hora_Termino'] != $rowData['data']['Hora_Termino'])                              ? '<br> - se cambia la hora de termino (de '.$this->DataTime->formatoHoraEstandar($rowData['data']['Hora_Termino']).' a '.$this->DataTime->formatoHoraEstandar($Post['Hora_Termino']).')' : '';
        $Comparacion['data'] .= ($Post['idPeriodicidad'] != $rowData['data']['idPeriodicidad'])                          ? '<br> - se cambia la periodicidad' : '';
        $Comparacion['data'] .= ($Post['NAsistentes'] != $rowData['data']['NAsistentes'])                                ? '<br> - se cambia el numero de asistentes (de '.$rowData['data']['NAsistentes'].' a '.$Post['NAsistentes'].')' : '';
        $Comparacion['data'] .= ($Post['idEspacio'] != $rowData['data']['idEspacio'])                                    ? '<br> - se cambia el espacio' : '';
        $Comparacion['data'] .= (isset($Post['Costo']) && $Post['Costo'] != $rowData['data']['Costo'])                   ? '<br> - se cambia el costo (de '.$rowData['data']['Costo'].' a '.$Post['Costo'].')' : '';
        $Comparacion['data'] .= (isset($Post['CentroCosto']) && $Post['CentroCosto'] != $rowData['data']['CentroCosto']) ? '<br> - se cambia el centro de costo (de '.$rowData['data']['CentroCosto'].' a '.$Post['CentroCosto'].')' : '';
        //Se verifica si el nuevo estado es superior al guardado
        $Comparacion['avance'] = ($Post['idEstadoReserva'] != $rowData['data']['idEstadoReserva']) ? true : false;

        //Retorno datos
        return $Comparacion;
    }

    //Se guardan los datos
    private function saveHistory($ReservaID, $UsuarioID, $Evento, $FechaCreacion){
        /******************************/
        //Se arma el dato
        $Post = [
            'idReserva'      => $ReservaID,
            'idUsuario'      => $UsuarioID,
            'Evento'         => $Evento,
            'FechaCreacion'  => $FechaCreacion,
        ];
        /******************************/
        //Se genera la query
        $query = [
            'data'      => 'idReserva,idUsuario,Evento,FechaCreacion',
            'required'  => 'idReserva,idUsuario,Evento,FechaCreacion',
            'unique'    => '',
            'encode'    => '',
            'table'     => 'reservas_listado_eventos',
            'Post'      => $Post
        ];
        //Ejecuto la query
        $xParams = ['DataCheck' => '', 'query' => $query];
        $this->Base_insert($xParams);
    }

    /******************************************************************************/
    //Se obtienen los detalles
    private function sendNoti($f3, $Type, $Asunto, $EstadoReservaID, $SolicitanteID){

        /******************************/
        //Se cargan los datos de la plataforma
        $query = [
            'data'   => 'Config_motorEmail',
            'table'  => 'core_sistemas',
            'join'   => '',
            'where'  => 'idSistema = "1"',
            'group'  => '',
            'having' => '',
            'order'  => ''
        ];
        //Verifico si hay un dato
        $xParams    = ['query' => $query];
        $rowSistema = $this->Base_GetByID($xParams);

        /******************************/
        //Se cargan los datos de la plataforma
        $query = [
            'data'   => 'Nombre',
            'table'  => 'estados_listado',
            'join'   => '',
            'where'  => 'idEstadoReserva = "'.$EstadoReservaID.'"',
            'group'  => '',
            'having' => '',
            'order'  => ''
        ];
        //Verifico si hay un dato
        $xParams   = ['query' => $query];
        $rowEstado = $this->Base_GetByID($xParams);

        /******************************/
        //Se cargan los datos de la plataforma
        $query = [
            'data'   => 'Nombre,ApellidoPat,Email',
            'table'  => 'solicitantes_listado',
            'join'   => '',
            'where'  => 'idSolicitante = "'.$SolicitanteID.'"',
            'group'  => '',
            'having' => '',
            'order'  => ''
        ];
        //Verifico si hay un dato
        $xParams        = ['query' => $query];
        $rowSolicitante = $this->Base_GetByID($xParams);

        /****************************************************/
        //Si hay resultados
        if($rowSistema['status'] && $rowEstado['status'] && $rowSolicitante['status']){
            /******************************/
            //Se genera el cuerpo del mensaje
            $BodyMail  = '<h1>Estimado '.$rowSolicitante['data']['Nombre'].' '.$rowSolicitante['data']['ApellidoPat'].'</h1>';
            $BodyMail .= '<p>'.($Type == 1 ? 'Se ha generado una nueva reserva' : 'Se ha actualizado la reserva').'</p>';
            $BodyMail .= '<p>tiene el estado: '.$rowEstado['data']['Nombre'].'</p>';

            /******************************/
            //Se agrega respuesta
            $arrData = [
                'Asunto'  => $Asunto,
                'Hacia'   => $rowSolicitante['data']['Email'],
                'Mensaje' => $BodyMail,
            ];
            //Se genera la query
            $query = [
                'data'      => 'Asunto,Hacia,Mensaje',
                'template'  => 1,
                'Post'      => $arrData,
            ];
            /******************************/
            //Se intenta enviar el correo
            try {
                $Respuesta = $this->Base_SelectMail($f3, $query, $rowSistema['data']['Config_motorEmail']);
                //si es la respuesta esperada
                if ($Respuesta===true) {
                    //imprimo resultados
                }else{
                    //imprimo resultados
                }
            } catch (\Throwable $th) {
                //nada;
            }
        }
    }

}
