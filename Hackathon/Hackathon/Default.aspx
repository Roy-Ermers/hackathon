<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>TestPagina</title>
    <link rel="stylesheet" href="<%=Page.ResolveUrl("Style/animate.css") %>">
    <script src='<%=Page.ResolveUrl("Js/wow.min.js") %>'></script>
        <script>
            new WOW().init();
        </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="body" Runat="Server">
        <div id="topper">
            <div class="container">
                <h1 id="title" class="wow fadeInUp" data-wow-delay="0.2s">
                    <%=Translator.Translate("Intro") %>
                </h1>
                <button class="wow fadeInUp" data-wow-delay="0.6s">
                    <%=Translator.Translate("FindDist") %>
                </button>
                <h1 id="down" class="wow fadeInUp" data-wow-delay="0.2s">
                    ▼
                </h1>
            </div>
        </div>
        <div id="orange_div">
            <h1>Partners</h1>
            <hr id="underline_partners"/>
            <div class="div4">
                <div class="div1">
                    <img class="partner_logo" src="<%=Page.ResolveUrl("Images/ing.png") %>"/>
                </div>                <div class="div1">

                    <img class="partner_logo" src="<%=Page.ResolveUrl("Images/bijenkorf.png") %>"/>
                </div>
                <div class="div1">
                    <img class="partner_logo" src="<%=Page.ResolveUrl("Images/philips.png") %>"/>
                </div>
                <div class="div1">
                    <img class="partner_logo" src="<%=Page.ResolveUrl("Images/bandicam.png") %>"/>
                </div>
            </div>
        </div>
        <div class="white_div">
            <div class="div2">
                <img class="side_photo" src="<%=Page.ResolveUrl("https://mariusdani.files.wordpress.com/2016/01/eindhoven-wallpaper.jpg?w=1200") %>"/>
            </div>
            <div class="div2">
                <h1>
                    <%=Translator.Translate("aboutBrabant") %>
                </h1>
                <p>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.
                </p>
            </div>
        </div>
       </asp:Content>

