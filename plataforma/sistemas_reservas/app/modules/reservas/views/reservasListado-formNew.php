<?php
/** @var string $BASE */  // Variable global para datos de F3
/** @var array $data */   // Variable global para datos de F3
/** @var \F3 $f3 */       // Instancia global de Fat-Free Framework (opcional, si la usas)

?>
<div class="modal fade" id="newFormModal" tabindex="-1">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form id="FormNewData" name="FormNewData" autocomplete="off" method="POST" action="" role="form" novalidate enctype="multipart/form-data" aria-label="Formulario de ejecucion">
                <div class="modal-header">
                    <?php
                    switch ($data['UserData']["sistemaModalSubtitle"]) {
                        case 1:
                            echo '
                            <h5 class="modal-title">
                                <i class="bi bi-file-earmark"></i> Crear Nuevo
                            </h5>';
                            break;
                        case 2:
                            echo '
                            <h5 class="modal-title modal-subtitle">
                                <div class="icon"><i class="bi bi-file-earmark"></i></div>
                                Crear Nuevo<br>
                                <small>Permite crear un nuevo elemento</small>
                            </h5>';
                            break;
                    } ?>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10 col-xxl-10 mx-auto">
                        <h4 class="text-muted"><i class="bx bx-user text-color-blue"></i> Datos del Solicitante:</h4>
                        <hr>
                        <div class="row">
                            <div class="col"><?php $data['Fnc_FormInputs']->formSelectFilter([ 'FormAling' => 2,'FormCol' => 12,'Placeholder' => 'Solicitante', 'Name' => 'idSolicitante', 'Value' => '', 'Required' => 2, 'arrData' => $data['arrSolicitantes'], 'BASE' => $BASE, 'selectProperties' => 'data-dropdown-parent="#newFormModal"']);?></div>
                            <div class="col"><?php $data['Fnc_FormInputs']->formSelectFilter([ 'FormAling' => 2,'FormCol' => 12,'Placeholder' => 'Unidad',      'Name' => 'idUnidades',    'Value' => '', 'Required' => 2, 'arrData' => $data['arrUnidades'],     'BASE' => $BASE, 'selectProperties' => 'data-dropdown-parent="#newFormModal"']);?></div>
                        </div>
                    </div>
                    <br>

                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10 col-xxl-10 mx-auto">
                        <h4 class="text-muted"><i class="bi bi-calendar-event-fill text-color-blue"></i> Datos de la Actividad:</h4>
                        <hr>
                        <div class="row">
                            <div class="col"><?php $data['Fnc_FormInputs']->formInput(['FormType' => 8, 'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Fecha',         'Name' => 'Fecha',          'Value' => '', 'Required' => 2,'Icon' => 'bi bi-calendar3']);?></div>
                            <div class="col"><?php $data['Fnc_FormInputs']->formTime([                  'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Hora inicio',   'Name' => 'Hora_Inicio',    'Value' => '', 'Required' => 2,'Position' => 2,'Icon' => 'bi bi-clock']);?></div>
                            <div class="col"><?php $data['Fnc_FormInputs']->formTime([                  'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Hora término',  'Name' => 'Hora_Termino',   'Value' => '', 'Required' => 2,'Position' => 2,'Icon' => 'bi bi-clock']);?></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col"><?php $data['Fnc_FormInputs']->formSelect([                'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Periodicidad',         'Name' => 'idPeriodicidad', 'Value' => '','Required' => 2,'arrData' => $data['arrPeriodicidad']]);?></div>
                            <div class="col"><?php $data['Fnc_FormInputs']->formInput(['FormType' => 4, 'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Número de asistentes', 'Name' => 'NAsistentes',    'Value' => '','Required' => 2,'Icon' => 'bi bi-sort-numeric-down']);?></div>
                        </div>
                    </div>
                    <br>

                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10 col-xxl-10 mx-auto">
                        <h4 class="text-muted"><i class="bi bi-building text-color-blue"></i> Espacio y Recursos:</h4>
                        <hr>
                        <div class="row">
                            <div class="col-4"><?php $data['Fnc_FormInputs']->formSelectGroup(['FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Espacio solicitado',    'Name' => 'idEspacio',   'Value' => '','Required' => 2,'arrData' => $data['arrEspacios'], 'BASE' => $BASE]);?></div>
                            <div class="col">
                                <table class="table table-sm table-hover">
                                    <tbody>
                                        <?php
                                        //Verifico si hay datos
                                        if(is_array($data['arrRecursos'])&&!empty($data['arrRecursos'])){
                                            //se recorren los datos dentro de la categoría
                                            foreach ($data['arrRecursos'] as $recurso){ ?>
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
                                                        ?>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-8 field">
                                                            <div class="form-check checkbox-success form-switch required=" required>
                                                                <input                          type="hidden"   value="1" name="<?php echo 'switch_'.$recurso['idRecurso']; ?>">
                                                                <input class="form-check-input" type="checkbox" value="2" name="<?php echo 'switch_'.$recurso['idRecurso']; ?>" <?php echo $on_click; ?>>
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
                            <div class="col"><?php $data['Fnc_FormInputs']->formInput(['FormType' => 1,'FormAling' => 2,'FormCol' => 12, 'Placeholder' => 'Centro de Costos', 'Name' => 'CentroCosto', 'Value' => '', 'Required' => 1]);?></div>
                        </div>
                    </div>
                    <br>

                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10 col-xxl-10 mx-auto">
                        <h4 class="text-muted"><i class="bi bi-chat-left-text-fill text-color-blue"></i> Observaciones:</h4>
                        <hr>
                        <div class="row">
                            <div class="col"><?php $data['Fnc_FormInputs']->formTextarea(['FormAling' => 1,'FormCol' => 12, 'Placeholder' => 'Observaciones','Name' => 'Observaciones', 'Value' => '','Required' => 1]);?></div>
                        </div>
                    </div>
                    <br>

                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xl-10 col-xxl-10 mx-auto">
                        <div class="row">
                            <div class="col"></div>
                            <div class="col"><?php $data['Fnc_FormInputs']->formCheckbox(['FormCol' => 12, 'Placeholder' => 'Notificar al solicitante?','Name' => 'notificar','Required' => 1,'Color' => 4, 'DataInfo' => 'Permite enviar un correo de notificacion al solicitante al crear la reserva']);?></div>
                        </div>
                    </div>

                </div>
                <?php
                //datos ocultos
                $data['Fnc_FormInputs']->formInputHidden(['Name' => 'idUsuario',        'Value' => $data['UserData']['UserID'],               'Required' => 2]);  //Usuario que lo creo
                $data['Fnc_FormInputs']->formInputHidden(['Name' => 'idEstadoReserva',  'Value' => 1,                                         'Required' => 2]);
                $data['Fnc_FormInputs']->formInputHidden(['Name' => 'FechaCreacion',    'Value' => $data['Fnc_ServerServer']->fechaActual(),  'Required' => 2]);  //Fecha de creacion eventos
                ?>
                <div class="modal-footer">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end w-100">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="bx bi-x-circle"></i> Cerrar</button>
                        <button type="submit" class="btn btn-success"><i class="bx bx-save"></i> Guardar Cambios</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    /*********************************************************************/
    /*                      EJECUCION DE LA LOGICA                       */
    /*********************************************************************/
    /******************************************/
    $("#FormNewData").submit(function(e) {
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
            let Direccion   = '<?php echo $BASE.'/'.$data['UserAccess']['RouteAccess']; ?>';
            let Informacion = $("#FormNewData").serialize();
            const Options     = {
                DestinoFrom:'<?php echo $BASE.'/'.$data['UserAccess']['RouteAccess'].'/resumen/'; ?>',
                ClearForm:'FormNewData',
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




</script>
