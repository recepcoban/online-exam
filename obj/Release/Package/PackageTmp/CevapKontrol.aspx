<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CevapKontrol.aspx.cs" Inherits="SinavSistemi.CevapKontrol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>WTSS - Cevap Kontrolü</title>
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
                <h1>Cevap Kontrolü</h1>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 feature-text">

                    <asp:DataList ID="DataList1" runat="server" CssClass="col-lg-12">
                        <HeaderTemplate>
                            <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="well container">
                                <div class="col-lg-7">
                                    <pre style="color: blue; font-weight: bold; background-color: #eeeeee"><span style="color:red">Soru:</span> <br /><%# DataBinder.Eval( Container.DataItem,"SoruTest")%></pre>
                                </div>
                                <div class="col-lg-5">
                                    <asp:Image ID="imgSoruSekil" ImageUrl='<%# DataBinder.Eval( Container.DataItem,"SoruResim")%>' Width="300" Height="150" CssClass="img-responsive" AlternateText="Soru Şekli" ToolTip="Soru Şekli" runat="server" />
                                </div>
                            </div>
                            <pre>A. <%# DataBinder.Eval( Container.DataItem,"Cevap1") %></pre>
                            <pre>B. <%# DataBinder.Eval( Container.DataItem,"Cevap2") %></pre>
                            <pre>C. <%# DataBinder.Eval( Container.DataItem,"Cevap3") %></pre>
                            <pre>D. <%# DataBinder.Eval( Container.DataItem,"Cevap4") %></pre>
                            <pre style="color: green;">Doğru Cevap : <%# DataBinder.Eval( Container.DataItem,"DogruCevap") %></pre>
                            <pre style="color: Red;">Senin Cevabın : <%# DataBinder.Eval( Container.DataItem,"SecilenCevap") %></pre>
                        </ItemTemplate>
                        <SeparatorTemplate>
                            <hr />
                        </SeparatorTemplate>
                        <FooterTemplate>
                            <hr />
                        </FooterTemplate>
                    </asp:DataList>

                </div>
            </div>
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
