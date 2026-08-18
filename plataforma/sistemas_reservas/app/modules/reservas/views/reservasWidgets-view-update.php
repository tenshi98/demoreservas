<?php
/** @var string $BASE */  // Variable global para datos de F3
/** @var array $data */   // Variable global para datos de F3
/** @var \F3 $f3 */       // Instancia global de Fat-Free Framework (opcional, si la usas)

?>

<section class="section dashboard" data-aos="fade-up" data-aos-delay="300" data-aos-offset="200" data-aos-duration="500">
    <div class="row">
        <?php
        //Verifico si hay datos
        if(is_array($data['MainViewData']['Data_arrReservas'])&&!empty($data['MainViewData']['Data_arrReservas'])){

            //Variables
            $dataRequired   = [];
            $dataRequired[] = 'EspacioNombre';
            $dataRequired[] = 'EstadoNombre';
            $dataRequired[] = 'Unidad';

            //Obtengo las estadisticas agrupadas
            $estadisticas = $data['Fnc_CommonData']->agruparYContar($data['MainViewData']['Data_arrReservas'], $dataRequired); ?>

            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 col-xxl-4">
                <div class="card info-card sales-card">
                    <div class="card-body">
                        <h5 class="card-title">Solicitudes por Espacio</h5>
                        <div class="d-flex align-items-center">
                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="bi bi-building"></i>
                            </div>
                            <div class="ps-3" style="width: -moz-available;width: -moz-available;width: -webkit-fill-available;">
                                <table class="table table-sm table-hover">
                                    <tbody>
                                        <?php
                                        //se recorren los datos dentro de la categoría
                                        foreach ($estadisticas['EspacioNombre'] as $item) { ?>
                                            <tr>
                                                <td><?php echo $item['nombre']; ?></td>
                                                <td><?php echo $item['cantidad']; ?></td>
                                            </tr>
                                        <?php }?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 col-xxl-4">
                <div class="card info-card revenue-card">
                    <div class="card-body">
                        <h5 class="card-title">Solicitudes por Estado</h5>
                        <div class="d-flex align-items-center">
                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="bi bi-list-check"></i>
                            </div>
                            <div class="ps-3" style="width: -moz-available;width: -moz-available;width: -webkit-fill-available;">
                                <table class="table table-sm table-hover">
                                    <tbody>
                                        <?php
                                        //se recorren los datos dentro de la categoría
                                        foreach ($estadisticas['EstadoNombre'] as $item) { ?>
                                            <tr>
                                                <td><?php echo $item['nombre']; ?></td>
                                                <td><?php echo $item['cantidad']; ?></td>
                                            </tr>
                                        <?php }?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 col-xxl-4">
                <div class="card info-card customers-card">
                    <div class="card-body">
                        <h5 class="card-title">Solicitudes por Unidad</h5>
                        <div class="d-flex align-items-center">
                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                <i class="bi bi-people"></i>
                            </div>
                            <div class="ps-3" style="width: -moz-available;width: -moz-available;width: -webkit-fill-available;">
                                <table class="table table-sm table-hover">
                                    <tbody>
                                        <?php
                                        //se recorren los datos dentro de la categoría
                                        foreach ($estadisticas['Unidad'] as $item) { ?>
                                            <tr>
                                                <td><?php echo $item['nombre']; ?></td>
                                                <td><?php echo $item['cantidad']; ?></td>
                                            </tr>
                                        <?php }?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        <?php echo 'Listado de Solicitudes (<strong>'.($estadisticas['totalElementos'] ?? 0).' Solicitudes</strong>)'; ?>
                    </h5>
                    <div class="clearfix"></div>
                    <div class="table-responsive">
                        <table class="table table-sm table-hover datatable" id="tableData">
                            <thead>
                                <tr>
                                    <th scope="col">Solicitante</th>
                                    <th scope="col">Espacio</th>
                                    <th scope="col">N° Asistentes</th>
                                    <th scope="col">Fecha</th>
                                    <th scope="col">Periodicidad</th>
                                    <th scope="col">Unidad</th>
                                    <th scope="col">Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                //Verifico si hay datos
                                if(is_array($data['MainViewData']['Data_arrReservas'])&&!empty($data['MainViewData']['Data_arrReservas'])){
                                    //Recorro
                                    foreach($data['MainViewData']['Data_arrReservas'] as $crud){ ?>
                                        <tr>
                                            <td><?php echo '<strong>'.$crud['SolicitanteNombre'].' '.$crud['SolicitanteApellido'].'</strong><br><small>'.$crud['SolicitanteEmail'].'</small>'; ?></td>
                                            <td><?php echo '<strong>'.$crud['EspacioNombre'].'</strong><br><small>Cap. '.$crud['EspacioMaxPersonas'].' personas</small>'; ?></td>
                                            <td><?php echo $crud['NAsistentes']; ?></td>
                                            <td>
                                                <?php
                                                echo '<strong>'.$data['Fnc_DataDate']->fechaEstandar($crud['Fecha']).'</strong><br>
                                                <small>'.$data['Fnc_DataTime']->formatoHoraEstandar($crud['Hora_Inicio']).' - '.$data['Fnc_DataTime']->formatoHoraEstandar($crud['Hora_Termino']).'</small>';
                                                ?>
                                            </td>
                                            <td><?php echo $crud['Periodicidad']; ?></td>
                                            <td><?php echo '<span class="badge-sp1 badge-sp1-bg-info">'.$crud['Unidad'].'</span>'; ?></td>
                                            <td><?php echo '<span class="badge-sp1 badge-sp1-bg-info" style="background-color: '.$crud['EstadoColorClaro'].';color: '.$crud['EstadoColor'].'; border: 1px solid '.$crud['EstadoColor'].';">'.$crud['EstadoNombre'].'</span>';?></td>
                                        </tr>
                                    <?php } ?>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
