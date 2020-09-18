(function () {
    let status = [];

	let renderStatus = function () {

        $(".card").empty();

        $(".card").append(`
            <div class="progress-bar">
                <span class="progress-bar-fill" style="width: `+event.data.health/2+`%;"></span>
            </div>
        `);

		for (let i = 0; i < status.length; i++) {

			if (!status[i].visible) {
				continue;
            }
            
            $(".card").append(`
                <div class="progress-bar">
                    <span class="progress-bar-fill" style="width: `+status[i].val/10000+`%;"></span>
                </div>
            `);
        }

            $(".card").append(`
                <div class="progress-bar">
                    <span class="progress-bar-fill" style="width: `+event.data.alcohol+`%;"></span>
                </div>
            `);
        
            $(".card").append(`
                <p>Health</p>
                <p>Hunger</p>
                <p>Thirst</p>
                <p>Alcohol</p>
                <div class="item" onclick="ShowID('idcard')"><img src="https://i.imgur.com/DYxX7wR.png"></div>  
                <div class="item" onclick="ShowID('businesscard')"><img src="https://i.imgur.com/QXZcy5i.png"></div>
                <div class="item" onclick="ShowID('license')"><img src="https://i.imgur.com/gN0Ct1G.png"></div>
                <div class="item" onclick="ShowID('driverlicense')"><img src="https://i.imgur.com/cBaHpqU.png"></div>
            `)

	};

	window.onData = function (data) {
		if (data.update) {
			status.length = 0;

			for (let i = 0; i < data.status.length; i++) {
				status.push(data.status[i]);
			}

			renderStatus();
		}

		if (data.setDisplay) {
			$('#status_list').css({ 'opacity': data.display });
        }
        
        if (data.display == true) {
            $(".container").show();
        }
        if (data.display == false) {
            $(".container").fadeOut(100);
        }
	};

	window.onload = function (e) {
		window.addEventListener('message', function (event) {
			onData(event.data);
		});
    };

})();

document.addEventListener('DOMContentLoaded', function () {
    $(".container").hide();
});