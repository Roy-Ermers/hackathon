<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
     <div id="map"></div>
    <script>
      function initMap() {
        // Create a map object and specify the DOM element for display.
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 51.466777, lng: 5.492405},
          zoom: 17,
          zoomControl: false,
          mapTypeControl: false,
          scaleControl: false,
          streetViewControl: false,
          rotateControl: false,
          fullscreenControl: false  
          });
          var marker = new google.maps.Marker({
          position: {lat: 51.466777, lng: 5.492405},
          map: map
        });
        } 

        initMap();
    </script>
    <div class="contact">
        <div id="contact_container">
            <h1>Contact</h1>
             <div id="contact_right">
                <label>Name</label><br />
                <input type="text" name="name" placeholder="Enter your name"/><br>
                <label>Email</label><br />
                <input type="email" name="email" placeholder="Enter your email"/><br />
                <input type="submit" name="submit" value="Send" />
            </div>
            <div id="contact_left">
                <label>Message</label><br />
                <textarea id="contact_textarea" placeholder="Enter your message to us"></textarea>
            </div>
        </div>
    </div>
</asp:Content>

