<?php
/** @var string $BASE */  // Variable global para datos de F3
/** @var array $data */   // Variable global para datos de F3
/** @var \F3 $f3 */       // Instancia global de Fat-Free Framework (opcional, si la usas)

?>
<table class="table table-sm table-hover datatable">
    <thead>
        <tr>
            <th scope="col">Solicitante</th>
            <th scope="col">Espacio</th>
            <th scope="col">N° Asistentes</th>
            <th scope="col">Fecha</th>
            <th scope="col">Periodicidad</th>
            <th scope="col">Unidad</th>
            <th scope="col">Estado</th>
            <th scope="col" style="width: 10px;">Acciones</th>
        </tr>
    </thead>
    <tbody>
        <?php
        //Verifico si hay datos
        if(is_array($data['arrList'])&&!empty($data['arrList'])){
            //Recorro
            foreach($data['arrList'] as $crud){
                //Se obtiene el nombre
                $Solicitante = $crud['SolicitanteNombre'].' '.$crud['SolicitanteApellido'];

                //Variables
                $encryptedId = $data['Fnc_Codification']->encryptDecrypt('encrypt', $crud['idReserva']);
                $level       = $data['UserAccess']['LevelAccess'];
                $route       = $BASE.'/'.$data['UserAccess']['RouteAccess'].'/resumen/'.$encryptedId; ?>
                <tr>
                    <td><?php echo '<strong>'.$Solicitante.'</strong><br><small>'.$crud['SolicitanteEmail'].'</small>'; ?></td>
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
                    <td>
                        <div class="btn-group" role="group">
                            <?php
                            //Valido
                            if ($level >= 1) {echo '<button type="button" onclick="listTableDataView(\''.$encryptedId.'\')"                                  class="btn btn-primary   btn-sm tooltiplink" data-title="Ver Información"><i class="bi bi-eye"></i></button>';}
                            if ($level >= 2) {echo '<a href="'.$route.'"                                                                                     class="btn btn-secondary btn-sm tooltiplink" data-title="Editar Información"><i class="bi bi-pencil-square"></i></a>';}
                            if ($level >= 4) {echo '<button type="button" onclick="listTableDataDel(\''.$encryptedId.'\', \''.addslashes($Solicitante).'\')" class="btn btn-danger    btn-sm tooltiplink" data-title="Borrar Información"><i class="bi bi-trash"></i></button>';}
                            ?>
                        </div>
                    </td>
                </tr>
            <?php } ?>
        <?php } ?>
    </tbody>
</table>
