<?php
/** @var string $BASE */  // Variable global para datos de F3
/** @var array $data */   // Variable global para datos de F3
/** @var \F3 $f3 */       // Instancia global de Fat-Free Framework (opcional, si la usas)

?>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12" data-aos="fade-up" data-aos-delay="600" data-aos-offset="200" data-aos-duration="500">

    <div class="card">
        <div class="card-body pt-3">

            <ul class="nav nav-tabs nav-tabs-bordered d-grid d-md-flex justify-content-md-between">
                <li class="nav-item flex-fill"><button class="nav-link w-100 active" data-bs-toggle="tab" data-bs-target="#resumen"><i class="bi bi-card-list"></i> Resumen</button></li>
                <li class="nav-item flex-fill"><button class="nav-link w-100" data-bs-toggle="tab" data-bs-target="#resumen-edit"><i class="bi bi-pencil-square"></i> Editar Datos</button></li>
                <li class="nav-item flex-fill"><button class="nav-link w-100" data-bs-toggle="tab" data-bs-target="#resumen-eventos" onclick="tabEventLoadList()"><i class="bi bi-chat-dots"></i> Eventos</button></li>
            </ul>
            <div class="tab-content pt-2">

                <div class="tab-pane fade show active" id="resumen">
                    <?php require_once('reservasListado-Resumen-Update.php'); ?>
                </div>

                <div class="tab-pane fade" id="resumen-edit">

                    <form id="FormEditData" name="FormEditData" autocomplete="off" method="POST" action="" role="form" novalidate enctype="multipart/form-data" aria-label="Formulario de ejecucion">
                        <div class="d-flex justify-content-center pt-4">
                            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10 col-xxl-10">

                                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10 col-xxl-10 mx-auto">
                                    <h4 class="text-muted"><i class="bx bx-user text-color-blue"></i> Datos del Solicitante:</h4>
                                    <hr>
                                    <div class="row">
                                        <div class="col"><?php $data['Fnc_FormInputs']->formSelectFilter([ 'FormAling' => 2,'FormCol' => 12,'Placeholder' => 'Solicitante', 'Name' => 'idSolicitante', 'Value' => ($data['rowData']['idSolicitante'] ?? ''), 'Required' => 2, 'arrData' => $data['arrSolicitantes'], 'BASE' => $BASE]);?></div>
                                        <div class="col"><?php $data['Fnc_FormInputs']->formSelectFilter([ 'FormAling' => 2,'FormCol' => 12,'Placeholder' => 'Unidad',      'Name' => 'idUnidades',    'Value' => ($data['rowData']['idUnidades'] ?? ''),    'Required' => 2, 'arrData' => $data['arrUnidades'],     'BASE' => $BASE]);?></div>
                                    </div>
                                </div>
                                <br>

                                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10 col-xxl-10 mx-auto">
                                    <h4 class="text-muted"><i class="bi bi-calendar-event-fill text-color-blue"></i> Datos de la Actividad:</h4>
                                    <hr>
                                    <div class="row">
                                        <div class="col"><?php $data['Fnc_FormInputs']->formInput(['FormType' => 8, 'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Fecha',         'Name' => 'Fecha',          'Value' => ($data['rowData']['Fecha'] ?? ''),        'Required' => 2,'Icon' => 'bi bi-calendar3']);?></div>
                                        <div class="col"><?php $data['Fnc_FormInputs']->formTime([                  'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Hora inicio',   'Name' => 'Hora_Inicio',    'Value' => ($data['rowData']['Hora_Inicio'] ?? ''),  'Required' => 2,'Position' => 2,'Icon' => 'bi bi-clock']);?></div>
                                        <div class="col"><?php $data['Fnc_FormInputs']->formTime([                  'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Hora término',  'Name' => 'Hora_Termino',   'Value' => ($data['rowData']['Hora_Termino'] ?? ''), 'Required' => 2,'Position' => 2,'Icon' => 'bi bi-clock']);?></div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col"><?php $data['Fnc_FormInputs']->formSelect([                'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Periodicidad',         'Name' => 'idPeriodicidad', 'Value' => ($data['rowData']['idPeriodicidad'] ?? ''), 'Required' => 2,'arrData' => $data['arrPeriodicidad']]);?></div>
                                        <div class="col"><?php $data['Fnc_FormInputs']->formInput(['FormType' => 4, 'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Número de asistentes', 'Name' => 'NAsistentes',    'Value' => ($data['rowData']['NAsistentes'] ?? ''),    'Required' => 2,'Icon' => 'bi bi-sort-numeric-down']);?></div>
                                    </div>
                                </div>
                                <br>

                                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10 col-xxl-10 mx-auto">
                                    <h4 class="text-muted"><i class="bi bi-building text-color-blue"></i> Espacio y Recursos:</h4>
                                    <hr>
                                    <div class="row">
                                        <div class="col-4"><?php $data['Fnc_FormInputs']->formSelectGroup(['FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Espacio solicitado',    'Name' => 'idEspacio',   'Value' => ($data['rowData']['idEspacio'] ?? ''),'Required' => 2,'arrData' => $data['arrEspacios'], 'BASE' => $BASE]);?></div>
                                        <div class="col">
                                            <table class="table table-sm table-hover">
                                                <tbody>
                                                    <?php
                                                    //Verifico si hay datos
                                                    if(is_array($data['arrRecurso'])&&!empty($data['arrRecurso'])){
                                                        //se recorren los datos dentro de la categoría
                                                        foreach ($data['arrRecurso'] as $recurso){ ?>
                                                            <tr>
                                                                <td>
                                                                    <?php
                                                                    //Variable
                                                                    $on_click = '';
                                                                    //Se imprime
                                                                    echo $recurso['Nombre'];
                                                                    //Solo si hay un valor
                                                                    if(isset($recurso['Valor'])&&$recurso['Valor']!=0){
                                                                        echo ' ('.$data['Fnc_DataNumbers']->Valores($recurso['Valor'], 0).' '.$recurso['TipoCobro'].')';
                                                                        $on_click = 'onclick="activarCCosto()"';
                                                                    }
                                                                    //si esta seleccionado
                                                                    if(isset($recurso['RecursoSolicitadoID'])&&$recurso['RecursoSolicitadoID']!=0){
                                                                        $checked = ' checked';
                                                                    }else{
                                                                        $checked  = '';
                                                                    }
                                                                    ?>
                                                                </td>
                                                                <td>
                                                                    <div class="col-sm-8 field">
                                                                        <div class="form-check checkbox-success form-switch required=" required>
                                                                            <input                          type="hidden"   value="1" name="<?php echo 'switch_'.$recurso['idRecurso']; ?>">
                                                                            <input class="form-check-input" type="checkbox" value="2" name="<?php echo 'switch_'.$recurso['idRecurso']; ?>" <?php echo $on_click.$checked; ?>>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        <?php
                                                        }
                                                    } ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row" id="div_costos" style="display: none;">
                                        <div class="col"><?php $data['Fnc_FormInputs']->formInput(['FormType' => 1,'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Centro de Costos', 'Name' => 'CentroCosto', 'Value' => ($data['rowData']['CentroCosto'] ?? ''), 'Required' => 1]);?></div>
                                    </div>
                                </div>
                                <br>

                                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10 col-xxl-10 mx-auto">
                                    <h4 class="text-muted"><i class="bi bi-chat-left-text-fill text-color-blue"></i> Observaciones:</h4>
                                    <hr>
                                    <div class="row">
                                        <div class="col"><?php $data['Fnc_FormInputs']->formTextarea(['FormAling' => 1,'FormCol' => 12, 'Placeholder' => 'Observaciones','Name' => 'Observaciones', 'Value' => ($data['rowData']['Observaciones'] ?? ''),'Required' => 1]);?></div>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10 col-xxl-10 mx-auto">
                                    <h4 class="text-muted"><i class="bi bi-calendar-event-fill text-color-blue"></i> Estado Actividad:</h4>
                                    <hr>
                                    <div class="row">
                                        <div class="col-4"><?php $data['Fnc_FormInputs']->formSelect([  'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Estado de la Reserva', 'Name' => 'idEstadoReserva', 'Value' => ($data['rowData']['idEstadoReserva'] ?? ''),'Required' => 2,'arrData' => $data['arrEstado']]);?></div>
                                    </div>
                                </div>
                                <br>

                                <?php
                                //datos ocultos
                                $data['Fnc_FormInputs']->formInputHidden(['Name' => 'idUsuario',        'Value' => $data['UserData']['UserID'],               'Required' => 2]);  //Usuario que lo creo
                                $data['Fnc_FormInputs']->formInputHidden(['Name' => 'FechaCreacion',    'Value' => $data['Fnc_ServerServer']->fechaActual(),  'Required' => 2]);  //Fecha de creacion eventos
                                $data['Fnc_FormInputs']->formInputHidden(['Name' => 'idReserva',        'Value' => $data['rowData']['idReserva'],             'Required' => 2]);
                                ?>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                                    <button type="submit" class="btn btn-success"><i class="bx bx-save"></i> Guardar Cambios</button>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>

                <div class="tab-pane fade" id="resumen-eventos">
                    <h5 class="text-color-red-dark">
                        <div class="d-grid gap-2 d-md-flex justify-content-md-between">
                            Eventos de la Reserva
                        </div>
                    </h5>
                    <div class="clearfix"></div>
                    <div class="table-responsive" id="tabEventDataTable">

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>

<div class="clearfix"></div>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
    <a href="<?php echo $BASE.'/'.$data['UserAccess']['RouteAccess'].'/listAll'; ?>" class="btn btn-danger float-end"><i class="bi bi-arrow-left-circle"></i> Volver</a>
</div>
<div class="clearfix"></div>

<script>
    /*********************************************************************/
    /*                      EJECUCION DE LA LOGICA                       */
    /*********************************************************************/
    /******************************************/
    $("#FormEditData").submit(function(e) {
        //Se validan los datos de los formularios
        var validatorResult = validator.checkAll(this);
        //verifico el resultado
        if(validatorResult.valid===false){
            return !!validatorResult.valid;
        }else{
            // Si ya se está ejecutando, salimos
            if (ejecutandoForm.valor) return;
            //Cambio los valores
            ejecutandoForm.valor = true;
            //Ejecucion normal
            e.preventDefault();
            //Cargo el loader
            $('#PDloader').show();
            //Ejecuto
            let Metodo      = 'POST';
            let Direccion   = '<?php echo $BASE.'/'.$data['UserAccess']['RouteAccess'].'/update'; ?>';
            let Informacion = $("#FormEditData").serialize();
            const Options     = {
                UpdateDiv : [
                    {Div:'#resumen', fromData:'<?php echo $BASE.'/'.$data['UserAccess']['RouteAccess'].'/resumenUpdate/'.$data['Fnc_Codification']->encryptDecrypt('encrypt', $data['rowData']['idReserva']); ?>'},
                ],
                showNoti:'Datos Editados Correctamente',
                triggerTab:'.nav-tabs button[data-bs-target="#resumen"]',
                closeObject:'#PDloader',
                changeValForm: ejecutandoForm,
            };
            //Se envian los datos al formulario
            SendDataForms(Metodo, Direccion, Informacion, Options);
        }
    });

    /******************************************/
    //Funcion para mostrar div
    function activarCCosto() {
        let mostrarCosto = false;

        $('input[name^="switch_"][value="2"]').each(function () {
            if ($(this).is(':checked')) {
                mostrarCosto = true;
                return false; // Detener el each
            }
        });

        if (mostrarCosto) {
            $('#div_costos').show();
        } else {
            $('#div_costos').hide();
        }
    }

    /*********************************************************************/
    /*                          OBSERVACIONES                            */
    /*********************************************************************/
    //Variables
    let ObsLoad = 0;
    /******************************************/
    function tabEventLoadList() {
        //Comparo
        if(ObsLoad===0){
            //Cargo el loader
            $('#PDloader').show();
            //Ejecuto
            let Div       = '#tabEventDataTable';
            let URL       = '<?php echo $BASE.'/'.$data['UserAccess']['RouteAccess'].'/eventos/updateList/'.$data['Fnc_Codification']->encryptDecrypt('encrypt', $data['rowData']['idReserva']); ?>';
            const Options = {
                closeObject:'#PDloader',
                refreshTables:'true',
            };
            //Se envian los datos al formulario
            UpdateContentId(Div, URL, Options);
            //Indico que esta cargado
            ObsLoad = 1;
        }
    }
</script>
