window.addEventListener('message', function (event) {
    var item = event.data;
    if (item.clear == true) {
        $(".items").empty();
    }
    if (item.display == true) {
        $(".container").show();
    }
    if (item.display == false) {
        $(".container").fadeOut(100);
    }
});

document.addEventListener('DOMContentLoaded', function () {
    $(".container").hide();
});

function buyItem(item, zone) {
    $.post('http://esx_shops/buyItem', JSON.stringify({ item: item, zone: zone}));
}

window.addEventListener('message', function (event) {
    var data = event.data;

    if (data.price !== undefined) {
    $(".items").append(`
        <div class="item" onclick="buyItem('`+data.item+`', '`+data.zone+`')">
            <img src="`+data.imglink+`">
            <div class="label">
                <p>`+data.itemLabel+`<p>
                <p>Price: `+data.price+`$<p>
            </div>
        </div>
    `);
    }
});
