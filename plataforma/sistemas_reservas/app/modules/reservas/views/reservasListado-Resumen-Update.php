<?php
/** @var string $BASE */  // Variable global para datos de F3
/** @var array $data */   // Variable global para datos de F3
/** @var \F3 $f3 */       // Instancia global de Fat-Free Framework (opcional, si la usas)

?>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-5 col-lg-4 col-xl-3 col-xxl-2">
        <?php
        //Imagen
        $UserIMG  = $BASE.'/img/picture-img.jpg';
        ?>
        <img src="<?php echo $UserIMG; ?>" alt="Profile" class="square-rounded-2 square-border-3 w-100 mb-2">

    </div>
    <div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 col-xl-9 col-xxl-10">
        <?php
        $arrData_1 = [
            ['Icon' => '','Titulo' => 'Nombre',  'Texto' => $data['rowData']['SolicitanteNombre'].' '.$data['rowData']['SolicitanteApellido']],
            ['Icon' => '','Titulo' => 'Email',   'Texto' => $data['rowData']['SolicitanteEmail']],
            ['Icon' => '','Titulo' => 'Unidad',  'Texto' => $data['rowData']['Unidad']],
        ];
        $arrData_2 = [
            ['Icon' => '','Titulo' => 'Fecha',                  'Texto' => $data['Fnc_DataDate']->fechaEstandar($data['rowData']['Fecha'])],
            ['Icon' => '','Titulo' => 'Hora inicio',            'Texto' => $data['Fnc_DataTime']->formatoHoraEstandar($data['rowData']['Hora_Inicio'])],
            ['Icon' => '','Titulo' => 'Hora término',           'Texto' => $data['Fnc_DataTime']->formatoHoraEstandar($data['rowData']['Hora_Termino'])],
            ['Icon' => '','Titulo' => 'Periodicidad',           'Texto' => $data['rowData']['Periodicidad']],
            ['Icon' => '','Titulo' => 'Número de asistentes',   'Texto' => $data['rowData']['NAsistentes'].' Personas'],
            ['Icon' => '','Titulo' => 'Costo Total',            'Texto' => $data['Fnc_DataNumbers']->Valores($data['rowData']['Costo'], 0)],
            ['Icon' => '','Titulo' => 'Centro de Costo',        'Texto' => $data['rowData']['CentroCosto']],
            ['Icon' => '','Titulo' => 'Estado',                 'Texto' => $data['rowData']['EstadoNombre']],
        ];
        $arrData_3 = [
            ['Icon' => '','Titulo' => 'Espacio',  'Texto' => $data['rowData']['Espacio']],
        ];
        $arrData_4 = [
            ['Icon' => '','Titulo' => 'Observaciones',  'Texto' => $data['rowData']['Observaciones']],
        ];


        echo '<h5 class="box-title text-color-red-dark">Datos del Solicitante:</h5>';
        $data['Fnc_WidgetsCommon']->responsiveTable($arrData_1, 8);
        echo '<h5 class="box-title text-color-red-dark">Datos de la Actividad:</h5>';
        $data['Fnc_WidgetsCommon']->responsiveTable($arrData_2, 8);
        echo '<h5 class="box-title text-color-red-dark">Espacio y Recursos:</h5>';
        echo '
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 col-xxl-4">';
            $data['Fnc_WidgetsCommon']->responsiveTable($arrData_3, 8);
            echo '
            </div>
            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-8 col-xxl-8">
                <table class="table table-sm table-hover">
                    <thead>
                        <tr><th>Recursos</th></tr>
                    </thead>
                    <tbody>';
                        //Verifico si hay datos
                        if(is_array($data['arrRecursos'])&&!empty($data['arrRecursos'])){
                            //se recorren los datos dentro de la categoría
                            foreach ($data['arrRecursos'] as $recurso){ ?>
                                <tr>
                                    <td>
                                        <?php
                                        //Se imprime
                                        echo $recurso['Nombre'];
                                        //Solo si hay un valor
                                        if(isset($recurso['Valor'])&&$recurso['Valor']!=0){
                                            echo ' ('.$data['Fnc_DataNumbers']->Valores($recurso['Valor'], 0).' '.$recurso['TipoCobro'].')';
                                        }
                                        ?>
                                    </td>
                                </tr>
                            <?php
                            }
                        }
                    echo '
                    </tbody>
                </table>
            </div>
        </div>';
        echo '<h5 class="box-title text-color-red-dark">Observaciones:</h5>';
        $data['Fnc_WidgetsCommon']->responsiveTable($arrData_4, 8);
        ?>

    </div>
</div>
