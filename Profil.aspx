<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profil.aspx.cs" Inherits="SinavSistemi.Profil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>WTSS - Kullanıcı Paneli</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <form id="form1" runat="server">

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
                            <asp:HyperLink ID="hyperSession" Text="" runat="server" ForeColor="DodgerBlue" CssClass="btn btn-primary btn-sm navbar-btn btn-menu" />
                        </li>
                        <li>
                            <asp:Button PostBackUrl="~/Giris.aspx" ID="btnMenuGiris" Text="Giriş" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu" />
                        </li>
                        <li>
                            <asp:Button ID="btnCikis" Text="Çıkış" OnClick="btnCikis_Click" OnClientClick="return confirm('Çıkış yapmak istediğine emin misin?');" ForeColor="#FFFF00" Visible="false" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu" />
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
                        <h3 class="text-center">Kullanıcı Paneli</h3>
                        <br />
                        <div class="container">
                            <div class="row">

                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#profil" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>&nbsp;<b>Profil</b></a></li>
                                    <li><a href="#sonuc" data-toggle="tab"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;<b>Sonuçlar</b></a></li>
                                    <li><a href="#ayar" onclick="" data-toggle="tab"><span class="glyphicon glyphicon-cog"></span>&nbsp;<b>Ayarlar</b></a></li>
                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane active in" id="profil">
                                        <br />
                                        <br />
                                        <fieldset>
                                            <div class="col-lg-4 col-lg-offset-1 text-center">

                                                <asp:UpdatePanel ID="updatepanelprofil" UpdateMode="Conditional" runat="server">
                                                    <ContentTemplate>

                                                        <asp:Image ID="imgProfilResim" Width="200" Height="200" CssClass="img-circle" AlternateText="Profil Resmi" ToolTip="Profil Resmi" runat="server" />
                                                        <br />
                                                        <span class="btn btn-primary btn-file">Resim Seç
                                            <asp:FileUpload ID="FileProfilResim" runat="server" />
                                                        </span>
                                                        <asp:Button Text="Yükle" ID="btnResimYukle" OnClick="btnResimYukle_Click" CssClass="btn btn-success" runat="server" />
                                                        <br />
                                                        <asp:Label Text="" ID="lblResimHata" ForeColor="Red" runat="server" />
                                                        <asp:Label Text="" ID="lblResimOK" ForeColor="Green" runat="server" />

                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnResimYukle" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <br />
                                            </div>
                                            <div class="col-lg-4 text-left">
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td>Kullanıcı Adı</td>
                                                            <td>
                                                                <b>
                                                                    <asp:Label Text="" ID="lblKadi" runat="server" />
                                                                </b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Adı</td>
                                                            <td>
                                                                <b>
                                                                    <asp:Label Text="" ID="lblAdi" runat="server" />
                                                                </b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Soyadı</td>
                                                            <td>
                                                                <b>
                                                                    <asp:Label Text="" ID="lblSoyadi" runat="server" />
                                                                </b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>E-posta</td>
                                                            <td>
                                                                <b>
                                                                    <asp:Label Text="" ID="lblEposta" runat="server" />
                                                                </b>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </fieldset>
                                        <br />
                                    </div>
                                    <div class="tab-pane fade" id="sonuc">
                                        <br />
                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
                                                <fieldset>
                                                    <div class="col-lg-10 col-lg-offset-1 table-responsive text-left">
                                                        <div class="text-center">
                                                            <asp:Label Text="Sınav Sonuçlarım" Font-Bold="true" Font-Size="X-Large" runat="server" />
                                                        </div>
                                                        <br />
                                                        <table class="table table-hover">
                                                            <thead>
                                                                <tr style="background-color: #d5d5d5;">
                                                                    <th>Kullanıcı Adı</th>
                                                                    <th>Ders Adı</th>
                                                                    <th>Sınav Adı</th>
                                                                    <th>Soru Sayısı</th>
                                                                    <th>Doğru Sayısı</th>
                                                                    <th>Başarı Oranı</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:ListView ID="lstSonuclar" runat="server">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td><%#Eval("kadi") %></td>
                                                                            <td><%#Eval("ders_adi") %></td>
                                                                            <td><%#Eval("sinav_adi") %></td>
                                                                            <td><%#Eval("soru_sayisi") %></td>
                                                                            <td><%#Eval("dogru_sayisi") %></td>
                                                                            <td><%#Eval("oran") %></td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:ListView>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </fieldset>
                                                <br />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                    <div class="tab-pane fade" id="ayar">
                                        <br />
                                        <fieldset>
                                            <div class="col-lg-6 col-lg-offset-3 text-left">

                                                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Button Text="Bilgileri Getir" ID="btnBilgiGetir" OnClick="btnBilgiGetir_Click" CssClass="btn btn-default pull-right" runat="server" />
                                                        <br />
                                                        <br />
                                                        <asp:TextBox runat="server" ID="txtAyarKadi" Enabled="false" CssClass="form-control" placeholder="Kullanıcı Adı" Font-Bold="true" />
                                                        <br />
                                                        <asp:TextBox runat="server" ID="txtAyarAdi" Enabled="false" CssClass="form-control" placeholder="Adı" Font-Bold="true" />
                                                        <br />
                                                        <asp:TextBox runat="server" ID="txtAyarSoyadi" Enabled="false" CssClass="form-control" placeholder="Soyadı" Font-Bold="true" />
                                                        <br />
                                                        <asp:TextBox runat="server" ID="txtAyarEposta" CssClass="form-control" placeholder="E-posta" Font-Bold="true" />
                                                        <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarEposta" runat="server" ValidationGroup="yonAyar" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                        <br />
                                                        <asp:TextBox runat="server" ID="txtAyarParola" TextMode="Password" CssClass="form-control" placeholder="Parola" Font-Bold="true" />
                                                        <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarParola" runat="server" ValidationGroup="yonAyar" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                        <br />
                                                        <asp:TextBox runat="server" ID="txtAyarParolaTekrar" TextMode="Password" CssClass="form-control" placeholder="Parola (Tekrar)" Font-Bold="true" />
                                                        <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarParolaTekrar" runat="server" ValidationGroup="yonAyar" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                        <br />
                                                        <asp:Button Text="GÜNCELLE" runat="server" ID="btnGuncelle" OnClick="btnGuncelle_Click" CssClass="btn btn-xl btn-lg btn-primary btn-block" ValidationGroup="yonAyar" />
                                                        <br />
                                                        <div class="text-center">
                                                            <asp:Label Text="" ForeColor="Green" ID="lblAyarOK" runat="server" />
                                                            <asp:Label Text="" ForeColor="Red" ID="lblAyarFAIL" runat="server" />
                                                        </div>

                                                        <script type="text/javascript">
                                                            function btnGuncelleEnable() {
                                                                var p1 = $("#txtAyarParola").val();
                                                                var p2 = $("#txtAyarParolaTekrar").val();
                                                                if (p1 == p2) {
                                                                    document.getElementById("btnGuncelle").disabled = false;
                                                                }
                                                                else {
                                                                    document.getElementById("btnGuncelle").disabled = true;
                                                                }
                                                            }
                                                            setInterval("btnGuncelleEnable()", 100);
                                                        </script>

                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnGuncelle" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </fieldset>
                                        <br />
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
