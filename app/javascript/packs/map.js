function initMap(){
    let map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: <%= @post.latitude %>, lng: <%= @post.longitude %> },
    zoom: 15
    });
}