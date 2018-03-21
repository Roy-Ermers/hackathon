window.scrollTo(0, 0);
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