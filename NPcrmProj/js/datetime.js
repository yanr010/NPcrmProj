var localLocale = moment();


$(document).ready(function () {
    datetime = $('#datetime')
    update();
    setInterval(update, 1000);
});

var update = function () {

    localLocale = moment();
    localLocale.locale('he')
    datetime.html(localLocale.format('LLLL'));

};