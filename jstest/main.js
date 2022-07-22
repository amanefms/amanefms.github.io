window.onload = function(){
    setInterval(function(){
        var dateObj = new Date();
        var time_tag = document.getElementById ( "time" );
        time_tag.innerHTML = dateObj.getHours() + ":" + dateObj.getMinutes() + ":" + dateObj.getSeconds();
    }, 100);
}