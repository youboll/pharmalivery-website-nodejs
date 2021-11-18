let allData = JSON.parse(localStorage.getItem('allData'));

function getPedido(numeroPedido) {
    for (var x=0;x<allData.length;x++) {
        if (allData[x][0].cod_pedido == numeroPedido) {
            return(allData[x])
        }
    }
}
function showData(numeroPedido) {
    let pedidoData = getPedido(numeroPedido);

    var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: new google.maps.LatLng(pedidoData[0].latitude, pedidoData[0].longitude ),
    mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    
    marker = new google.maps.Marker({
        position: new google.maps.LatLng(pedidoData[0].latitude,pedidoData[0].longitude),
        map: map
    });
    

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
        infowindow.setContent("Pedido");
        infowindow.open(map, marker);
        }
    })(marker, i));
    writeData(numeroPedido)
    }

function writeData (numeroPedido) {
    pedidoData = getPedido(numeroPedido);
    console.log(pedidoData)
    const mainDiv = document.getElementById('dadosPedido').style.visibility= 'visible';
    let nomeDiv = document.getElementById('pedidoNome').innerHTML = "Código: "+pedidoData[0].cod_pedido;
    let ruaDiv = document.getElementById('pedidoRua').innerHTML = "Rua: "+pedidoData[0].rua;
    let bairroDiv = document.getElementById('pedidoBairro').innerHTML = "Bairro: "+pedidoData[0].bairro;
    let cidadeDiv = document.getElementById('pedidoCidade').innerHTML = "Cidade: "+pedidoData[0].cidade;
    //Pedidos
    let pedidosDiv = document.getElementById('pedidoProdutos')
    pedidosDiv.innerHTML = ""
    for (var x=0;x<pedidoData.length;x++) {
        let produtoData = document.createElement("div")
        produtoData.setAttribute("class","produtosCard");
        produtoData.innerHTML = "Nome: "+pedidoData[x].nome+" Quantidade: "+pedidoData[x].quantidade+""
        pedidosDiv.append(produtoData)
    }
    pedidosDiv.innerHTML = pedidosDiv.innerHTML + '<a href="/entregador/checkout?entrega='+pedidoData[0].cod_pedido+'"><button>Selecionar entrega</button></a>';
}