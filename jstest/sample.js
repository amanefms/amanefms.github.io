var map;
var marker;
var geocoder;
function initMap() {
   geocoder = new google.maps.Geocoder();
  geocoder.geocode({
      'address': '東京都杉並区西荻南3-25-1' // TAM 東京
   }, function(results, status) { // 結果
        if (status === google.maps.GeocoderStatus.OK) { // ステータスがOKの場合
          map = new google.maps.Map(document.getElementById('sample'), {
                center: results[0].geometry.location, // 地図の中心を指定
               zoom: 19 // 地図のズームを指定
           });
         marker = new google.maps.Marker({
               position: results[0].geometry.location, // マーカーを立てる位置を指定
                map: map // マーカーを立てる地図を指定
           });
     } else { // 失敗した場合
          alert(status);
      }
   });
}