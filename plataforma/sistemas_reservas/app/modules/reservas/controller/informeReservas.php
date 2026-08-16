<?php
/*******************************************************************************************************************/
/*                                              Se define la clase                                                 */
/*******************************************************************************************************************/
class informeReservas extends ControllerBase {

    /******************************************************************************/
    //Variables
    private $controllerName;
    private $FormInputs;
    private $DataDate;
    private $DataTime;
    private $DataNumbers;

    /******************************************************************************/
    //Constructor
    public function __construct(){
        /*=========== Se instancian los datos ===========*/
        $DB_conn_1     = Database::getSQLConnection(ConfigData::MySQL_1);
        $queryBuilder  = new QueryBuilder();
        $checkData     = new CheckData();
        /*================== Instancias =================*/
        $this->controllerName    = 'informeReservas';
		$this->FormInputs     = new UIFormInputs();
		$this->DataDate       = new FunctionsDataDate();
		$this->DataTime       = new FunctionsDataTime();
		$this->DataNumbers    = new FunctionsDataNumbers();
        /*========== Datos para la clase padre ==========*/
        parent::__construct($DB_conn_1, $queryBuilder, $checkData);
    }

    /******************************************************************************/
    /*                                  VISTAS                                    */
    /******************************************************************************/
    /******************************************************************************/
    //Listar Todo
    public function listAll($f3){
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
        if($arrEspacios['status'] && $arrPeriodicidad['status'] && $arrRecursos['status'] && $arrSolicitantes['status'] && $arrUnidades['status'] && $arrEstado['status']){

            /******************************************/
            //Datos enviados a la pagina
            $f3->data = [
                /*=========== Datos de la Pagina ===========*/
                'PageTitle'       => 'Informe de Solicitudes',
                'PageDescription' => 'Informe de Solicitudes.',
                'PageAuthor'      => ConfigAPP::SOFTWARE['SoftwareName'],
                'PageKeywords'    => ConfigAPP::SOFTWARE['SoftwareName'],
                'TableTitle'      => 'Informe de Solicitudes',
                /*===========  Datos del usuario ===========*/
                'UserData'      => $this->getUserData($f3),
                'UserAccess'    => $this->getArrLevel($f3, $this->controllerName),
                /*===========   Funcionalidad   ===========*/
                'Fnc_FormInputs'      => $this->FormInputs,
                /*=========== Datos Consultados ===========*/
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
            $result = $this->mergeResponses([$arrEspacios,$arrPeriodicidad,$arrRecursos,$arrSolicitantes,$arrUnidades,$arrEstado]);
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
        $query = [
            'data'    => '
                reservas_listado.Fecha,
                reservas_listado.Hora_Inicio,
                reservas_listado.Hora_Termino,
                reservas_listado.NAsistentes,
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
                espacios_listado.Nombre AS EspacioNombre,
                espacios_listado.nMaxPersonas AS EspacioMaxPersonas',
            'table'   => 'reservas_listado',
            'join'    => '
                LEFT JOIN estados_listado       ON estados_listado.idEstadoReserva     = reservas_listado.idEstadoReserva
                LEFT JOIN solicitantes_listado  ON solicitantes_listado.idSolicitante  = reservas_listado.idSolicitante
                LEFT JOIN unidades_listado      ON unidades_listado.idUnidades         = reservas_listado.idUnidades
                LEFT JOIN periodicidad_listado  ON periodicidad_listado.idPeriodicidad = reservas_listado.idPeriodicidad
                LEFT JOIN espacios_listado      ON espacios_listado.idEspacio          = reservas_listado.idEspacio',
            'where'   => $whereInt2,
            'group'   => '',
            'having'  => '',
            'order'   => 'reservas_listado.Fecha DESC',
            'limit'   => ConfigAPP::APP["N_MaxItems"]
        ];
        //Ejecuto la query
        $xParams = ['query' => $query];
        $arrList = $this->Base_GetList($xParams);

        /*******************************************************************/
        /*                         Imprimir Datos                          */
        /*******************************************************************/
        //Si hay resultados
        if($arrList['status']){

            /******************************************/
            //Datos enviados a la pagina
            $f3->data = [
                /*=========== Datos de la Pagina ===========*/
                'TableTitle'      => 'Informe de Solicitudes',
                /*===========  Datos del usuario ===========*/
                'UserData'      => $this->getUserData($f3),
                'UserAccess'    => $this->getArrLevel($f3, $this->controllerName),
                /*===========   Funcionalidad   ===========*/
                'Fnc_DataNumbers'     => $this->DataNumbers,
                'Fnc_DataDate'        => $this->DataDate,
                'Fnc_DataTime'        => $this->DataTime,
                'Fnc_DataNumbers'     => $this->DataNumbers,
                /*=========== Datos Consultados ===========*/
                'arrList'       => $arrList['data'],
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


}
