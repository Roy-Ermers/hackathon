window.scrollTo(0, 0);
$("#loading").fadeOut(1000);

if ($("#topper").length) {
    $("header").css("background", "transparent");
    $(":root").css("--header-height", "100px");
    $("main").css("margin-top", "0");
}

var scroll = 0;
$(window).scroll(
    function () {
        var top = $(this).scrollTop();
        console.log(top);

        if (top > scroll) {
            if ($("#topper").length) {
                $("header").css("background", "#2c3e50");
                $(":root").css("--header-height", "75px");
            }
        } else {
            if ($("#topper").length) {
                if (top <= 10) {
                    $("header").css("background", "transparent");
                    $(":root").css("--header-height", "100px");
                }
            }
        }
        scroll = top;
    }
);

var param = new URLSearchParams(location.search);
var citizen = parseInt(param.get("citizen"));
var averageAge = parseInt(param.get("averageAge"));

$("#citizens").val(citizen);
$("#averageAge").val(averageAge);

$("#citizens").change(
    function () {
        param.set("citizen", $(this).val());
        location.search = param.toString();
    }
);

$("#averageAge").change(
    function () {
        param.set("averageAge", $(this).val());
        location.search = param.toString();
    }
);
