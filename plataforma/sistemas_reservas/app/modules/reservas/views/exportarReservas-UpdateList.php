<?php
/** @var string $BASE */  // Variable global para datos de F3
/** @var array $data */   // Variable global para datos de F3
/** @var \F3 $f3 */       // Instancia global de Fat-Free Framework (opcional, si la usas)

?>
<section class="section" data-aos="fade-up" data-aos-delay="300" data-aos-offset="200" data-aos-duration="500">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        <?php echo $data['TableTitle']; ?>
                        <button type="button" class="btn btn-sm btn-success float-end" onclick="exportTableToExcel('tableData', 'reservas')"><i class="ri-file-excel-2-line"></i> Exportar a Excel</button>
                    </h5>
                    <div class="clearfix"></div>
                    <div class="table-responsive">
                        <table class="table table-sm table-hover datatable" id="tableData">
                            <thead>
                                <tr>
                                    <th scope="col">Solicitante Nombre</th>
                                    <th scope="col">Solicitante Email</th>
                                    <th scope="col">Espacio Nombre</th>
                                    <th scope="col">Espacio capacidad</th>
                                    <th scope="col">N° Asistentes</th>
                                    <th scope="col">Fecha</th>
                                    <th scope="col">Horario</th>
                                    <th scope="col">Periodicidad</th>
                                    <th scope="col">Unidad</th>
                                    <th scope="col">Estado</th>
                                    <th scope="col">Costo</th>
                                    <th scope="col">Centro de costos</th>
                                    <th scope="col">Observaciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                //Verifico si hay datos
                                if(is_array($data['arrList'])&&!empty($data['arrList'])){
                                    //Recorro
                                    foreach($data['arrList'] as $crud){ ?>
                                        <tr>
                                            <td><?php echo $crud['SolicitanteNombre'].' '.$crud['SolicitanteApellido']; ?></td>
                                            <td><?php echo $crud['SolicitanteEmail']; ?></td>
                                            <td><?php echo $crud['EspacioNombre']; ?></td>
                                            <td><?php echo $crud['EspacioMaxPersonas']; ?></td>
                                            <td><?php echo $crud['NAsistentes']; ?></td>
                                            <td><?php echo $data['Fnc_DataDate']->fechaEstandar($crud['Fecha']); ?></td>
                                            <td><?php echo $data['Fnc_DataTime']->formatoHoraEstandar($crud['Hora_Inicio']).' - '.$data['Fnc_DataTime']->formatoHoraEstandar($crud['Hora_Termino']);?></td>
                                            <td><?php echo $crud['Periodicidad']; ?></td>
                                            <td><?php echo $crud['Unidad']; ?></td>
                                            <td><?php echo $crud['EstadoNombre'];?></td>
                                            <td><?php echo $data['Fnc_DataNumbers']->Valores($crud['Costo'], 0); ?></td>
                                            <td><?php echo $crud['CentroCosto']; ?></td>
                                            <td><?php echo $crud['Observaciones']; ?></td>
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

<div class="clearfix"></div>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
    <a href="<?php echo $BASE.'/'.$data['UserAccess']['RouteAccess'].'/listAll'; ?>" class="btn btn-danger float-end"><i class="bi bi-arrow-left-circle"></i> Volver</a>
</div>
<div class="clearfix"></div>
