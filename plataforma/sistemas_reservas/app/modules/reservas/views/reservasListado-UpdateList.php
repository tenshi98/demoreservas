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
                    <td><?php echo '<span class="badge-sp1 badge-sp1-bg-info" style="background-color: '.colorMasClaro($crud['EstadoColor'], 0.40).';color: '.$crud['EstadoColor'].'; border: 1px solid '.$crud['EstadoColor'].';">'.$crud['EstadoNombre'].'</span>';?></td>
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

<?php
/**
 * Genera una versión más clara de un color hexadecimal aumentando
 * su componente de luminosidad en el espacio de color HSL.
 *
 * La función acepta colores en formato hexadecimal completo (#RRGGBB)
 * o abreviado (#RGB). El color se convierte de HEX a RGB, posteriormente
 * a HSL, se incrementa la luminosidad según el factor indicado y finalmente
 * se convierte nuevamente a RGB y formato hexadecimal.
 *
 * @param string $hex    Código de color hexadecimal de entrada.
 * @param float  $factor Factor de incremento de luminosidad. Por defecto 0.35.
 *
 * @return string Código de color hexadecimal correspondiente al color aclarado.
 */
function colorMasClaro(string $hex, float $factor = 0.35): string {
    // Eliminar #
    $hex = ltrim($hex, '#');

    // Soportar formato corto #RGB
    if (strlen($hex) === 3) {
        $hex = $hex[0] . $hex[0]
             . $hex[1] . $hex[1]
             . $hex[2] . $hex[2];
    }

    // Convertir HEX a RGB
    $r = hexdec(substr($hex, 0, 2)) / 255;
    $g = hexdec(substr($hex, 2, 2)) / 255;
    $b = hexdec(substr($hex, 4, 2)) / 255;

    // RGB -> HSL
    $max = max($r, $g, $b);
    $min = min($r, $g, $b);

    $h = 0;
    $s = 0;
    $l = ($max + $min) / 2;

    // Calcular saturación y tono cuando el color no es acromático
    if ($max !== $min) {
        $d = $max - $min;

        $s = ($l > 0.5)
            ? $d / (2 - $max - $min)
            : $d / ($max + $min);

        // Determinar el componente dominante para calcular el tono
        switch ($max) {
            case $r: $h = (($g - $b) / $d) + ($g < $b ? 6 : 0); break;
            case $g: $h = (($b - $r) / $d) + 2; break;
            case $b: $h = (($r - $g) / $d) + 4; break;
        }

        $h /= 6;
    }

    // Aumentar luminosidad
    $l = min(1, $l + $factor);

    // HSL -> RGB
    if ($s == 0) {
        $r = $g = $b = $l;
    } else {
        $q = $l < 0.5
            ? $l * (1 + $s)
            : $l + $s - ($l * $s);

        $p = 2 * $l - $q;

        // Convierte un componente de tono HSL a su correspondiente valor RGB
        $hue2rgb = function ($p, $q, $t) {
            if ($t < 0) $t += 1;
            if ($t > 1) $t -= 1;
            if ($t < 1 / 6) return $p + ($q - $p) * 6 * $t;
            if ($t < 1 / 2) return $q;
            if ($t < 2 / 3) return $p + ($q - $p) * (2 / 3 - $t) * 6;
            return $p;
        };

        $r = $hue2rgb($p, $q, $h + 1 / 3);
        $g = $hue2rgb($p, $q, $h);
        $b = $hue2rgb($p, $q, $h - 1 / 3);
    }

    // Convertir los componentes RGB normalizados nuevamente a hexadecimal
    return sprintf(
        '#%02X%02X%02X',
        round($r * 255),
        round($g * 255),
        round($b * 255)
    );
}
?>
