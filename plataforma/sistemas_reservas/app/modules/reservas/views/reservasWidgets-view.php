<h1 class="title-divider"><span class="divider-text">Reservas de mes Actual</span></h1>

<div class="row" id="reservasWidgets-view"></div>

<script>
    /*********************************************************************/
    /*                      EJECUCION DE LA LOGICA                       */
    /*********************************************************************/
    /******************************************/
    //Últimas partidas confirmadas
    function reservasWidgets() {
        //Cargo el loader
        $('#PDloader').show();
        //Ejecuto
        let Div       = '#reservasWidgets-view';
        let URL       = 'principal/reservas';
        const Options = {
            closeObject:'#PDloader',
        };
        //Se envian los datos al formulario
        UpdateContentId(Div, URL, Options);
    }

    /*********************************************************************/
    /*                              ONLOAD                               */
    /*********************************************************************/
    $(document).ready(function() {
        loadAsynch_reservasWidgets();
    });
    //Carga asincrona
    async function loadAsynch_reservasWidgets() {
        //Actualizacion de las partidas
        await reservasWidgets();
    }

</script>
