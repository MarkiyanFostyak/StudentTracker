$(document).ready(function () {
    var prevBgColour = $('input[id*="bgColorTxt"]').val();
    var prevHdColour = $('input[id*="hdColorTxt"]').val();
    $('#preview-header').css('background-color', prevHdColour);
    $('.preview-cont').css('background-color', prevBgColour);
    $('#selected-bg-color').val(prevBgColour);
    $('#selected-hd-color').val(prevHdColour);
    $('.bg-colour-picker').colorpicker({ color: prevBgColour }).on('changeColor.colopicker', function (event) {
        var bgColor = event.color.toHex();
        $('input[id*="bgColorTxt"]').val(bgColor);
        $('.preview-cont').css('background-color', bgColor);
    });
    $('.hd-colour-picker').colorpicker({ color: prevHdColour }).on('changeColor.colopicker', function (event) {
        var hdColor = event.color.toHex();
        $('input[id*="hdColorTxt"]').val(hdColor);
        $('#preview-header').css('background-color', hdColor);
    });
});