<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sinav.aspx.cs" Inherits="SinavSistemi.Sinav" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Web Tabanlı Sinav Sistemi</title>
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
                            <asp:Button PostBackUrl="~/Sinav.aspx" Text="Sınavlar" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu active" />
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

        <!-- İçerik Bölümü -->
        <div id="top" class="jumbotron">
            <div class="container">
                <h1>Sınavlar</h1>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 feature-text">


                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <asp:Panel ID="beforeCreateExam" runat="server">
                                <div class="text-center">
                                    <asp:Label Text="" ID="lblUyari" ForeColor="Red" runat="server" />
                                </div>
                                <div class="well container" style="box-shadow: 0 0 30px black; margin-top: 50px;">
                                    <div class="col-md-4">
                                        <asp:DropDownList OnSelectedIndexChanged="dropDersler_SelectedIndexChanged" runat="server" CssClass="form-control" ID="dropDersler" AppendDataBoundItems="True" AutoPostBack="true">
                                            <asp:ListItem Text="Ders Seçiniz" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="dropSinavlar" AppendDataBoundItems="True">
                                            <asp:ListItem Text="Sınav Seçiniz" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Button Text="Sınava Başla" ID="btnSinavaBasla" OnClick="btnSinavaBasla_Click" CssClass="form-control btn btn-primary" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <br />
                                    <br />
                                    <p style="color: red;">
                                        <span class="glyphicon glyphicon-tag"></span>
                                        Öncelikle yukarıdaki alanlardan;                 
                            <br />
                                        <br />
                                        &emsp;&emsp;&emsp;<span class="glyphicon glyphicon-arrow-right"></span>
                                        Bilginizi ölçmek istediğiniz <i>dersi</i>,                 
                            <br />
                                        <br />
                                        &emsp;&emsp;&emsp;<span class="glyphicon glyphicon-arrow-right"></span>
                                        Seçilen derse ait olan sınavlardan bilginizi ölçmek istediğiniz <i>sınavı</i>,                 
                            <br />
                                        <br />
                                        &emsp;&emsp;&emsp;<span class="glyphicon glyphicon-arrow-right"></span>
                                        Seçtikten sonra <i>"Sınava Başla"</i> butonuna tıklayarak sınava başlayabilirsiniz...
                                    </p>
                                    <div class="text-center">
                                        <p style="font-weight: bold;">Başarılar :)</p>
                                    </div>
                                </div>

                            </asp:Panel>
                            <asp:Panel ID="afterCreateExam" Visible="false" runat="server">

                                <div class="col-md-12">
                                    <table class="table table-responsive table-bordered">
                                        <tr>
                                            <td>
                                                <asp:Label Text="Ders : " Font-Bold="true" runat="server" />
                                                <asp:Label Text="" ID="lblDersAdi" Font-Bold="true" ForeColor="Red" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label Text="Tarih : " Font-Bold="true" runat="server" />
                                                <asp:Label ID="lblTarih" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                            </td>
                                            <td rowspan="2" style="text-align: center; vertical-align: middle;">
                                                <asp:Label Text="Kalan Süre : " Font-Bold="true" runat="server" Font-Size="Medium" />
                                                <asp:Timer ID="timerSinavSuresi" Interval="1000" runat="server" OnTick="timerSinavSuresi_Tick">
                                                </asp:Timer>
                                                <asp:Label ID="lblSure" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Medium"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label Text="Sınav : " Font-Bold="true" runat="server" />
                                                <asp:Label Text="" ID="lblSinavAdi" Font-Bold="true" ForeColor="Red" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label Text="Soru No : " Font-Bold="true" runat="server" />
                                                <asp:Label ID="lblSoruNo" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <hr />
                                    <br />

                                    <!-- Sorular -->

                                    <div class="well container">
                                        <div class="col-lg-7">
                                            <asp:Label ID="lblSoruAciklama" Font-Bold="true" BackColor="#EEEEEE" runat="server" />
                                        </div>
                                        <div class="col-lg-5">
                                            <asp:Image ID="imgSoruSekil" Width="300" Height="150" CssClass="img-responsive" AlternateText="Soru Şekli" ToolTip="Soru Şekli" runat="server" />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div style="background-color: #EEEEEE; padding: 3px; padding-left: 20px; width: auto; margin-bottom: 10px;">
                                        <asp:RadioButton ID="rdBtnCevap1" CssClass="radio" runat="server" GroupName="radio_cevap" />
                                    </div>
                                    <div style="background-color: #EEEEEE; padding: 3px; padding-left: 20px; width: auto; margin-bottom: 10px;">
                                        <asp:RadioButton ID="rdBtnCevap2" CssClass="radio" runat="server" GroupName="radio_cevap" />
                                    </div>
                                    <div style="background-color: #EEEEEE; padding: 3px; padding-left: 20px; width: auto; margin-bottom: 10px;">
                                        <asp:RadioButton ID="rdBtnCevap3" CssClass="radio" runat="server" GroupName="radio_cevap" />
                                    </div>
                                    <div style="background-color: #EEEEEE; padding: 3px; padding-left: 20px; width: auto; margin-bottom: 10px;">
                                        <asp:RadioButton ID="rdBtnCevap4" CssClass="radio" runat="server" GroupName="radio_cevap" />
                                    </div>

                                    <br />
                                    <br />
                                    <asp:Button CssClass="btn btn-primary" ID="btnPrev" runat="server" Text="Önceki" OnClick="btnPrev_Click" />
                                    <asp:Button CssClass="btn btn-success" ID="btnNext" runat="server" Text="Sonraki" OnClick="btnNext_Click" />
                                    <asp:Button CssClass="btn btn-danger pull-right" ID="btnCancel" runat="server" Text="Sinavı İptal Et" OnClick="btnCancel_Click" />
                                    <br />
                                    <hr />

                                    <!-- /Sorular -->
                                </div>
                                <br />

                            </asp:Panel>
                            <asp:Panel ID="panelSinavSonucu" Visible="false" runat="server">

                                <div class="col-lg-8 col-lg-offset-2" style="background-color: #f8f2f2; padding-top: 20px;">
                                    <table class="table table-responsive table-bordered" style="font-weight: bold;">
                                        <tr class="text-center" style="font-weight: bold; font-size: xx-large">
                                            <td colspan="2">Sınav Sonucu
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 50%;">Ders : </td>
                                            <td style="width: 50%;">
                                                <asp:Label ID="lblDers" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Sınav : </td>
                                            <td>
                                                <asp:Label ID="lblSinav" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Başlama Tarihi : </td>
                                            <td>
                                                <asp:Label ID="lblBaslama" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Sınav Süresi (dk) : </td>
                                            <td>
                                                <asp:Label ID="lblMin" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Soru Sayısı : </td>
                                            <td>
                                                <asp:Label ID="lblNquestions" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Doğru Sayısı : </td>
                                            <td>
                                                <asp:Label ID="lblNcans" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Başarı Oranı : </td>
                                            <td>
                                                <asp:Label ID="lblGrade" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="clearfix"></div>
                                <br />
                                <div class="text-center">
                                    <asp:Button Text="Cevaplarını Kontrol Et" ID="btnCevapKontrolEt" OnClick="btnCevapKontrolEt_Click" CssClass="btn btn-primary" runat="server" />
                                </div>

                            </asp:Panel>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
            <br />
            <br />
        </div>
        <!-- /İçerik Bölümü -->

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
