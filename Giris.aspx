<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="SinavSistemi.Giris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>WTSS - Giriş</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnGiris">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Menü Bölümü -->
        <nav class="navbar navbar-default navbar-inverse" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand scroll-top" href="/" style="padding: 0px;">
                        <img src="img/logo.png" alt="" /></a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown buyuk">
                            <a data-toggle="dropdown" href="#">Dersler <span class="caret"></span></a>
                            <ul class="dropdown-menu" style="margin-top: 8px; background: #111;">
                                <asp:ListView ID="lstMenuDersler" runat="server">
                                    <ItemTemplate>
                                        <li><a href="./Sinav.aspx" class="kategori"><%#Eval("ders_adi") %></a></li>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ul>
                        </li>
                        <li>
                            <asp:Button PostBackUrl="~/Sinav.aspx" Text="Sınavlar" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu" />
                        </li>
                        <li>
                            <asp:Button Text="Projemiz" PostBackUrl="~/Default.aspx#project" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu scroll-link" />
                        </li>
                        <li>
                            <asp:Button Text="Hakkımızda" PostBackUrl="~/Default.aspx#about" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu scroll-link" />
                        </li>
                        <li>
                            <asp:Button Text="İletişim" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu" data-toggle="modal" data-target="#ModalIletisim" />
                        </li>
                        <li>
                            <asp:HyperLink ID="hyperSession" Text="" runat="server" ForeColor="DodgerBlue" CssClass="btn btn-primary btn-sm navbar-btn btn-menu"/>
                        </li>
                        <li>
                            <asp:Button PostBackUrl="~/Giris.aspx" ID="btnMenuGiris" Text="Giriş" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu active" />
                        </li>
                        <li>
                            <asp:Button ID="btnCikis" Text="Çıkış" OnClick="btnCikis_Click" OnClientClick = "return confirm('Çıkış yapmak istediğine emin misin?');" ForeColor="#FFFF00" Visible="false" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu" />
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- /Menü Bölümü -->

        <!-- İşlemler Bölümü -->
        <asp:Panel ID="kullanici_islemleri" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 giris-baslik">
                        <h3 class="text-center">Kullanıcı İşlemleri</h3>
                        <br />
                        <div class="container">
                            <div class="well">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#login" data-toggle="tab"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;&nbsp;<b>Giriş Yap</b></a></li>
                                    <li><a href="#create" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<b>Kayıt Ol</b></a></li>
                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane active in" id="login">
                                        <br />
                                        <fieldset>
                                            <div class="col-lg-8 col-lg-offset-2 text-left">

                                                <asp:UpdatePanel runat="server" ID="updateGiris">
                                                    <ContentTemplate>
                                                        <asp:TextBox ID="txtGirisKadi" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı" />
                                                        <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtGirisKadi" runat="server" ValidationGroup="giris" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                        <br />
                                                        <asp:TextBox ID="txtGirisParola" TextMode="Password" runat="server" CssClass="form-control" placeholder="Parola" />
                                                        <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtGirisParola" runat="server" ValidationGroup="giris" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                        <br />
                                                        <asp:Button Text="GİRİŞ YAP" ID="btnGiris" OnClick="btnGiris_Click" runat="server" Height="40" CssClass="form-control btn btn-primary" ValidationGroup="giris" />
                                                        <br />
                                                        <br />
                                                        <div class="text-center">
                                                            <asp:Label Text="" ID="lblGirisOK" runat="server" Font-Bold="true" ForeColor="Green" Font-Size="Small" />
                                                            <asp:Label Text="" ID="lblGirisFAIL" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Small" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnGiris" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </div>
                                        </fieldset>
                                        <br />
                                    </div>
                                    <div class="tab-pane fade" id="create">
                                        <br />
                                        <fieldset>
                                            <div class="col-lg-8 col-lg-offset-2 text-left">

                                                <asp:UpdatePanel runat="server" ID="updateKayit">
                                                    <ContentTemplate>
                                                        <asp:TextBox ID="txtKayitKadi" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı" />
                                                        <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKayitKadi" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                        <br />
                                                        <asp:TextBox ID="txtKayitAdi" runat="server" CssClass="form-control" placeholder="Adı" />
                                                        <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKayitAdi" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                        <br />
                                                        <asp:TextBox ID="txtKayitSoyadi" runat="server" CssClass="form-control" placeholder="Soyadı" />
                                                        <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKayitSoyadi" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                        <br />
                                                        <asp:TextBox ID="txtKayitEposta" runat="server" CssClass="form-control" placeholder="E-posta" />
                                                        <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKayitEposta" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                        <br />
                                                        <asp:TextBox ID="txtKayitParola" TextMode="Password" runat="server" CssClass="form-control" placeholder="Parola" />
                                                        <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKayitParola" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                        <br />
                                                        <asp:TextBox ID="txtKayitParolaTekrar" TextMode="Password" runat="server" CssClass="form-control" placeholder="Parola (Tekrar)" />
                                                        <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKayitParolaTekrar" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                        <br />
                                                        <asp:Button Text="KAYDET" ID="btnKaydet" OnClick="btnKaydet_Click" runat="server" Height="40" CssClass="form-control btn btn-primary" ValidationGroup="kayit" />
                                                        <br />
                                                        <br />
                                                        <div class="text-center">
                                                            <asp:Label Text="" ID="lblKayitOK" runat="server" Font-Bold="true" ForeColor="Green" Font-Size="Small" />
                                                            <asp:Label Text="" ID="lblKayitFAIL" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Small" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnKaydet" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <script type="text/javascript">

                                                    function ParolaKontrol() {
                                                        var p1 = document.getElementById("txtKayitParola").value;
                                                        var p2 = document.getElementById("txtKayitParolaTekrar").value;
                                                        if (p1 == p2) {
                                                            document.getElementById("btnKaydet").disabled = false;
                                                        }
                                                        else {
                                                            document.getElementById("btnKaydet").disabled = true;
                                                        }
                                                    }

                                                    setInterval(ParolaKontrol, 100);

                                                </script>

                                            </div>
                                        </fieldset>
                                    </div>
                                </div>

                            </div>

                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <!-- /İşlemler Bölümü -->

        <!-- İletişim Bölümü -->
        <div class="modal fade" id="ModalIletisim" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel" style="color: #000; font-weight: bold;">İletişim</h4>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                                <div class="team-member">
                                    <img src="img/recep.jpg" class="img-responsive img-circle" width="150" alt=""/>
                                    <h4>Recep Çoban</h4>
                                    <p class="text-muted"><i>Junior Developer</i></p>
                                    <ul class="list-inline social-buttons">
                                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                                        </li>
                                        <li><a href="https://www.facebook.com/cbnrcp" target="_new"><i class="fa fa-facebook"></i></a>
                                        </li>
                                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Kapat</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /İletişim Bölümü -->

        <!-- Footer Bölümü -->
        <footer>
            <div class="container clearfix">
                <p class="pull-left">
                    Copyright &copy; 2015
             
                </p>
                <p class="pull-right">
                    Tasarım: <a href="https://www.facebook.com/cbnrcp" target="_new">Recep Çoban</a>
                </p>


                <a href="#" class="go-top" title="Yukarı Çık">
                    <img src="img/yukari-cik.png" alt="Yukarı Çık" style="width: 30px; border-radius: 100%;" />
                </a>


            </div>
        </footer>
        <!-- /Footer Bölümü -->

    </form>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(".nav-link").click(function (e) {
            e.preventDefault();
            var link = $(this);
            var href = link.attr("href");
            $("html,body").animate({ scrollTop: $(href).offset().top - 80 }, 500);
            link.closest(".navbar").find(".navbar-toggle:not(.collapsed)").click();
        });

        $('.dropdown').hover(
        function () {
            $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeIn();
        },
        function () {
            $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeOut();
        }
      );

        $('.dropdown-menu').hover(
          function () {
              $(this).stop(true, true);
          },
          function () {
              $(this).stop(true, true).delay(100).fadeOut();
          }
        );


        $(document).ready(function () {
            // Show or hide the sticky footer button
            $(window).scroll(function () {
                if ($(this).scrollTop() > 200) {
                    $('.go-top').fadeIn(200);
                } else {
                    $('.go-top').fadeOut(200);
                }
            });

            // Animate the scroll to top
            $('.go-top').click(function (event) {
                event.preventDefault();

                $('html, body').animate({ scrollTop: 0 }, 1000);
            })
        });
    </script>
</body>
</html>
