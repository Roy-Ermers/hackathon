if ($("#topper").length) {
    $("main").css("margin-top", "0");
    $("header").css("background", "transparent");
}

var scroll = 0;
$(window).scroll(
    function () {
        var top = $(this).scrollTop();

        if (top > scroll) {
            if ($("#topper").length) {
                $("header").css("background", "#2c3e50");
            }
        } else {
            if ($("#topper").length) {
                $("header").css("background", "transparent");
            }
        }
        scroll = top;
    }
);