<?php
/*******************************************************************************************************************/
/*                                              Se define la clase                                                 */
/*******************************************************************************************************************/
class reservasWidgets extends ControllerBase {

    /******************************************************************************/
    //Variables
    private $CommonData;
    private $DataDate;
    private $DataTime;
    private $DataNumbers;
    private $ServerServer;

    /******************************************************************************/
    //Constructor
    public function __construct(){
        /*=========== Se instancian los datos ===========*/
        $DB_conn_1     = Database::getSQLConnection(ConfigData::MySQL_1);
        $queryBuilder  = new QueryBuilder();
        $checkData     = new CheckData();
        /*================== Instancias =================*/
		$this->CommonData     = new FunctionsCommonData();
		$this->DataDate       = new FunctionsDataDate();
		$this->DataTime       = new FunctionsDataTime();
		$this->DataNumbers    = new FunctionsDataNumbers();
		$this->ServerServer   = new FunctionsServerServer();
        /*========== Datos para la clase padre ==========*/
        parent::__construct($DB_conn_1, $queryBuilder, $checkData);
    }

    /******************************************************************************/
    /*                                 EJECUCION                                  */
    /******************************************************************************/
    /******************************************************************************/
    //Instalacion del modulo completo
    public function loadWidgets(){

        //Variables
        $Data['Menu_Name']   = 'Reservas';
        $Data['Menu_Value']  = [
            'Reservas - Listado'   => '../app/modules/reservas/views/reservasWidgets-view.php',
        ];

        //Devuelvo
        return $Data;
    }

    /******************************************************************************/
    /*                                  VISTAS                                    */
    /******************************************************************************/
    /******************************************************************************/
    //Actualizacion campañas
    public function reservasSolicitadas($f3, $params){
        /*******************************************************************/
        //Se llaman los datos
        $arrMenu  = $f3->get('SESSION.arrMenu');

        /*******************************************************************/
        //Variables
        $MainViewData = [
            'Count_Permisos'   => 0,
            'Data_arrReservas' => '',
        ];
        //Se asignan datos a buscar
        $menuCounters = [
            'Reservas' => [
                'Reservas - Listado'   => 'Count_Permisos',
            ],
            'Informes' => [
                'Exportar Datos'        => 'Count_Permisos',
                'Informe Solicitudes'   => 'Count_Permisos',
            ],
        ];
        //Se recorren los permisos y se validan
        foreach ($menuCounters as $section => $names) {
            if (!empty($arrMenu[$section])) {
                foreach ($arrMenu[$section] as $asd) {
                    if (isset($names[$asd['Nombre']])) {
                        $MainViewData[$names[$asd['Nombre']]]++;
                    }
                }
            }
        }

        /*******************************************************************/
        //Se hacen las consultas
        /******************************************/
        if($MainViewData['Count_Permisos']!=0){
            //Verifico si esta vacio
            $where  = 'reservas_listado.Fecha_Mes='.$this->ServerServer->mesActual();
            $where .= ' AND reservas_listado.Fecha_Ano='.$this->ServerServer->anoActual();

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
                'where'   => $where,
                'group'   => '',
                'having'  => '',
                'order'   => 'reservas_listado.Fecha DESC',
                'limit'   => ConfigAPP::APP["N_MaxItems"]
            ];
            //Ejecuto la query
            $xParams = ['query' => $query];
            $TempData = $this->Base_GetList($xParams);
            //Datos
            $MainViewData['Data_arrReservas'] = $TempData['data'];
        }

        /******************************************/
        //Datos enviados a la pagina
        $f3->data = [
            /*===========  Datos del usuario ===========*/
            'UserData'      => $this->getUserData($f3),
            /*===========   Funcionalidad   ===========*/
            'Fnc_CommonData'      => $this->CommonData,
            'Fnc_DataNumbers'     => $this->DataNumbers,
            'Fnc_DataDate'        => $this->DataDate,
            'Fnc_DataTime'        => $this->DataTime,
            'Fnc_DataNumbers'     => $this->DataNumbers,
            /*=========== Datos Consultados ===========*/
            'MainViewData'    => $MainViewData,
        ];

        //Se instancia la vista
        $this->showVista(2, $this->returnRutaVista(__DIR__, 'app').'/reservasWidgets-view-update.php');
    }

}
