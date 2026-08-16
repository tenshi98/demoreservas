<?php
/** @var string $BASE */  // Variable global para datos de F3
/** @var array $data */   // Variable global para datos de F3
/** @var \F3 $f3 */       // Instancia global de Fat-Free Framework (opcional, si la usas)

?>
<section class="section dashboard" data-aos="fade-up" data-aos-delay="300" data-aos-offset="200" data-aos-duration="500">
    <div class="row">
        <?php
        //Verifico si hay datos
        if(is_array($data['arrList'])&&!empty($data['arrList'])){
            //Obtengo las estadisticas agrupadas
            $estadisticas = obtenerEstadisticas($data['arrList']); ?>

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
                                        foreach ($estadisticas['solicitudes_por_espacio'] as $item) { ?>
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
                                        foreach ($estadisticas['solicitudes_por_estado'] as $item) { ?>
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
                                        foreach ($estadisticas['solicitudes_por_unidad'] as $item) { ?>
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
                        <?php echo $data['TableTitle'].' ('.($estadisticas['cantidad_solicitudes'] ?? 0).' Solicitudes)'; ?>
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
                                if(is_array($data['arrList'])&&!empty($data['arrList'])){
                                    //Recorro
                                    foreach($data['arrList'] as $crud){ ?>
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
                                            <td><?php echo '<span class="badge-sp1 badge-sp1-bg-info" style="background-color: '.colorMasClaro($crud['EstadoColor'], 0.40).';color: '.$crud['EstadoColor'].'; border: 1px solid '.$crud['EstadoColor'].';">'.$crud['EstadoNombre'].'</span>';?></td>
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

/**
 * Obtiene estadísticas agrupadas de un listado de solicitudes.
 *
 * La función calcula la cantidad total de solicitudes y agrupa los registros
 * según espacio, estado y unidad. Para cada agrupación se genera una lista
 * con el nombre del elemento y la cantidad de solicitudes asociadas.
 *
 * Si alguno de los campos utilizados para realizar las agrupaciones no está
 * definido en una solicitud, se utiliza un valor predeterminado que identifica
 * la ausencia del dato.
 *
 * @param array $arrList Listado de solicitudes a procesar.
 *
 * @return array Arreglo con la cantidad total de solicitudes y las estadísticas
 *               agrupadas por espacio, estado y unidad.
 */
function obtenerEstadisticas(array $arrList): array {
    $espacios = [];
    $estados  = [];
    $unidades = [];

    // Recorrer cada solicitud para acumular las cantidades por categoría
    foreach ($arrList as $solicitud) {

        // Solicitudes por espacio
        $espacio = $solicitud['EspacioNombre'] ?? 'Sin espacio';
        // Inicializar el contador del espacio cuando aún no existe
        if (!isset($espacios[$espacio])) {$espacios[$espacio] = 0;}
        $espacios[$espacio]++;

        // Solicitudes por estado
        $estado = $solicitud['EstadoNombre'] ?? 'Sin estado';
        // Inicializar el contador del estado cuando aún no existe
        if (!isset($estados[$estado])) {$estados[$estado] = 0;}
        $estados[$estado]++;


        // Solicitudes por unidad
        $unidad = $solicitud['Unidad'] ?? 'Sin unidad';
        // Inicializar el contador de la unidad cuando aún no existe
        if (!isset($unidades[$unidad])) {$unidades[$unidad] = 0;}
        $unidades[$unidad]++;
    }

    // Convertir los arreglos asociativos de conteos al formato nombre/cantidad
    $formatear = function (array $datos): array {
        $resultado = [];
        foreach ($datos as $nombre => $cantidad) {
            $resultado[] = [
                'nombre'   => $nombre,
                'cantidad' => $cantidad
            ];
        }
        return $resultado;
    };

    // Retornar el total y las estadísticas agrupadas en un único arreglo
    return [
        'cantidad_solicitudes' => count($arrList),
        'solicitudes_por_espacio' => $formatear($espacios),
        'solicitudes_por_estado' => $formatear($estados),
        'solicitudes_por_unidad' => $formatear($unidades)
    ];
}
?>
