<?php
/** @var string $BASE */  // Variable global para datos de F3
/** @var array $data */   // Variable global para datos de F3
/** @var \F3 $f3 */       // Instancia global de Fat-Free Framework (opcional, si la usas)

?>
<table class="table table-sm table-hover datatable">
    <thead>
        <tr>
            <th scope="col">Fecha Creacion</th>
            <th scope="col">Evento</th>
        </tr>
    </thead>
    <tbody>
        <?php
        //Verifico si hay datos
        if(is_array($data['arrEventos'])&&!empty($data['arrEventos'])){
            //Recorro
            foreach($data['arrEventos'] as $crud){ ?>
                <tr>
                    <td><?php echo $data['Fnc_DataDate']->fechaEstandar($crud['FechaCreacion']); ?></td>
                    <td>
                        <?php
                        echo '<strong>'.$crud['Creador'].'</strong><br>';
                        echo $crud['Evento'] ? 'Modificaciones: '.$data['Fnc_DataText']->desanitizarTexto($crud['Evento']) : '';
                        ?>
                    </td>
                </tr>
            <?php } ?>
        <?php } ?>
    </tbody>
</table>
