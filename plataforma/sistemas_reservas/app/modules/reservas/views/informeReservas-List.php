<?php
/** @var string $BASE */  // Variable global para datos de F3
/** @var array $data */   // Variable global para datos de F3
/** @var \F3 $f3 */       // Instancia global de Fat-Free Framework (opcional, si la usas)

?>
<div id="listTableData" data-aos="fade-up" data-aos-delay="300" data-aos-offset="200" data-aos-duration="500">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12">
        <div class="card">
            <div class="card-body">
                <div class="d-flex justify-content-center pt-3">
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 col-xxl-6">
                        <div class="text-center">
                            <h5 class="search-title"><i class="bi bi-search"></i> Filtrar Datos</h5>
                        </div>
                        <form id="FormSearchData" name="FormSearchData" autocomplete="off" method="POST" action="" role="form" novalidate enctype="multipart/form-data" aria-label="Formulario de ejecucion">
                            <?php
                            //se dibujan los inputs
                            $data['Fnc_FormInputs']->formSelectFilter([           'Placeholder' => 'Solicitante',          'Name' => 'idSolicitante',   'Id' => 'Search_idSolicitante',     'Value' => '', 'Required' => 1, 'arrData' => $data['arrSolicitantes'], 'BASE' => $BASE]);
                            $data['Fnc_FormInputs']->formSelectFilter([           'Placeholder' => 'Unidad',               'Name' => 'idUnidades',      'Id' => 'Search_idUnidades',        'Value' => '', 'Required' => 1, 'arrData' => $data['arrUnidades'],     'BASE' => $BASE]);
                            $data['Fnc_FormInputs']->formInput(['FormType' => 8,  'Placeholder' => 'Fecha Inicio',         'Name' => 'FechaInicio',     'Id' => 'Search_FechaInicio',       'Value' => '', 'Required' => 1, 'Icon' => 'bi bi-calendar3']);
                            $data['Fnc_FormInputs']->formInput(['FormType' => 8,  'Placeholder' => 'Fecha Termino',        'Name' => 'FechaTermino',    'Id' => 'Search_FechaTermino',      'Value' => '', 'Required' => 1, 'Icon' => 'bi bi-calendar3']);
                            $data['Fnc_FormInputs']->formSelect([                 'Placeholder' => 'Periodicidad',         'Name' => 'idPeriodicidad',  'Id' => 'Search_idPeriodicidad',    'Value' => '', 'Required' => 1, 'arrData' => $data['arrPeriodicidad']]);
                            $data['Fnc_FormInputs']->formSelectGroup([            'Placeholder' => 'Espacio solicitado',   'Name' => 'idEspacio',       'Id' => 'Search_idEspacio',         'Value' => '', 'Required' => 1, 'arrData' => $data['arrEspacios'], 'BASE' => $BASE]);
                            $data['Fnc_FormInputs']->formSelect([                 'Placeholder' => 'Estado de la Reserva', 'Name' => 'idEstadoReserva', 'Id' => 'Search_idEstadoReserva',   'Value' => '', 'Required' => 1, 'arrData' => $data['arrEstado']]);

                            ?>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                                <button type="submit" class="btn btn-success"><i class="bi bi-search"></i> Filtrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    /*********************************************************************/
    /*                      FORMULARIO DE BUSQUEDA                       */
    /*********************************************************************/
    /******************************************/
    $("#FormSearchData").submit(function(e) {
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
            let Direccion   = '<?php echo $BASE.'/'.$data['UserAccess']['RouteAccess'].'/search'; ?>';
            let Informacion = $("#FormSearchData").serialize();
            const Options     = {
                UpdateDivFrom : 'listTableData',
                refreshTables : 'true',
                closeObject:'#PDloader',
                changeValForm: ejecutandoForm,
            };
            //Se envian los datos al formulario
            SendDataForms(Metodo, Direccion, Informacion, Options);
        }
    });




</script>
