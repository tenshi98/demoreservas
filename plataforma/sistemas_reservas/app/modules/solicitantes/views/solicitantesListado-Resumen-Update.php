<?php
/** @var string $BASE */  // Variable global para datos de F3
/** @var array $data */   // Variable global para datos de F3
/** @var \F3 $f3 */       // Instancia global de Fat-Free Framework (opcional, si la usas)

?>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-5 col-lg-4 col-xl-3 col-xxl-2">
        <?php
        //Imagen
        $UserIMG  = !empty($data['rowData']['Direccion_img'])
                    ? $data['UserData']['MainPathUrl'].$data['rowData']['Direccion_img']
                    : $BASE.'/img/picture-img.jpg';
        ?>
        <img src="<?php echo $UserIMG; ?>" alt="Profile" class="square-rounded-2 square-border-3 w-100 mb-2">

    </div>
    <div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 col-xl-9 col-xxl-10">
        <?php
        $arrData_1 = [
            ['Icon' => '','Titulo' => 'Nombre',           'Texto' => $data['rowData']['ApellidoPat'].' '.$data['rowData']['ApellidoMat'].', '.$data['rowData']['Nombre']],
            ['Icon' => '','Titulo' => 'Fecha Nacimiento', 'Texto' => $data['Fnc_DataDate']->fechaEstandar($data['rowData']['FNacimiento'])],
            ['Icon' => '','Titulo' => 'Sexo',             'Texto' => $data['rowData']['Sexo']],
        ];
        $arrData_2 = [
            ['Icon' => '','Titulo' => 'Rut',        'Texto' => $data['rowData']['Rut']],
            ['Icon' => '','Titulo' => 'Email',      'Texto' => $data['rowData']['Email']],
            ['Icon' => '','Titulo' => 'Celular',    'Texto' => $data['Fnc_DataNumbers']->formatPhone($data['rowData']['Fono1'])],
            ['Icon' => '','Titulo' => 'Teléfono',   'Texto' => $data['Fnc_DataNumbers']->formatPhone($data['rowData']['Fono2'])],
        ];
        $arrData_3 = [
            ['Icon' => '','Titulo' => 'Ciudad',      'Texto' => $data['rowData']['Ciudad']],
            ['Icon' => '','Titulo' => 'Comuna',      'Texto' => $data['rowData']['Comuna']],
            ['Icon' => '','Titulo' => 'Dirección',   'Texto' => $data['rowData']['Direccion']],
            ['Icon' => '','Titulo' => 'Estado',      'Texto' => '<span class="badge-sp1 badge-sp1-'.$data['rowData']['EstadoColor'].'">'.$data['rowData']['Estado'].'</span>'],
        ];
        $arrData_4 = [
            ['Icon' => '','Titulo' => 'X',          'Texto' => $data['rowData']['Social_X']],
            ['Icon' => '','Titulo' => 'Facebook',   'Texto' => $data['rowData']['Social_Facebook']],
            ['Icon' => '','Titulo' => 'Instagram',  'Texto' => $data['rowData']['Social_Instagram']],
            ['Icon' => '','Titulo' => 'Linkedin',   'Texto' => $data['rowData']['Social_Linkedin']],
        ];

        echo '<h5 class="box-title text-color-red-dark">Datos Básicos</h5>';
        $data['Fnc_WidgetsCommon']->responsiveTable($arrData_1, 8);
        $data['Fnc_WidgetsCommon']->responsiveTable($arrData_2, 8);
        $data['Fnc_WidgetsCommon']->responsiveTable($arrData_3, 8);

        echo '<h5 class="box-title text-color-red-dark">Social</h5>';
        $data['Fnc_WidgetsCommon']->responsiveTable($arrData_4, 8);

        ?>
    </div>
</div>
