<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SinavSistemi.Default" 
   EnableEventValidation="false" %>

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
                            <asp:Button Text="Projemiz" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu scroll-link" data-id="project" />
                        </li>
                        <li>
                            <asp:Button Text="Hakkımızda" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu scroll-link" data-id="about" />
                        </li>
                        <li>
                            <asp:Button Text="İletişim" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu" data-toggle="modal" data-target="#ModalIletisim" />
                        </li>
                        <li>
                            <asp:HyperLink ID="hyperSession" Text="" runat="server" ForeColor="DodgerBlue" CssClass="btn btn-primary btn-sm navbar-btn btn-menu"/>
                        </li>
                        <li>
                            <asp:Button PostBackUrl="~/Giris.aspx" ID="btnMenuGiris" Text="Giriş" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu" />
                        </li>
                        <li>
                            <asp:Button ID="btnCikis" Text="Çıkış" OnClick="btnCikis_Click" OnClientClick = "return confirm('Çıkış yapmak istediğine emin misin?');"  ForeColor="#FFFF00" Visible="false" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu" />
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- /Menü Bölümü -->

        <!-- Slider Bölümü -->
        <div id="top" class="jumbotron">
            <div class="container">
                <h1>Web Tabanlı Sinav Sistemi</h1>
                <div id="macbook">
                    <div id="tour" class="carousel slide">
                        <ol class="carousel-indicators">
                            <li data-target="#tour" data-slide-to="0" class="active"></li>
                            <li data-target="#tour" data-slide-to="1"></li>
                            <li data-target="#tour" data-slide-to="2"></li>
                            <li data-target="#tour" data-slide-to="3"></li>
                            <li data-target="#tour" data-slide-to="4"></li>
                        </ol>

                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="img/resim1.png">
                                <div class="carousel-caption">
                                    <p class="back-light">Web Tabanlı Sinav Sistemi</p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="img/resim4.jpg">
                                <div class="carousel-caption">
                                    <p class="back-light">Web Tabanlı Sinav Sistemi</p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="img/resim3.jpg">
                                <div class="carousel-caption">
                                    <p class="back-light">Web Tabanlı Sinav Sistemi</p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="img/resim5.jpg">
                                <div class="carousel-caption">
                                    <p class="back-light">Web Tabanlı Sinav Sistemi</p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="img/resim2.jpg" />
                                <div class="carousel-caption">
                                    <p class="back-light">Web Tabanlı Sinav Sistemi</p>
                                </div>
                            </div>
                        </div>

                        <a class="left carousel-control" href="#tour" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#tour" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Slider Bölümü -->

        <!-- Açıklamalar -->
        <div class="container">
            <div class="row">

                <div class="col-md-12 col-sm-12 feature-text">
                    <h3>Web Tabanlı Sinav Sistemi</h3>
                    <p>
                        <span class="glyphicon glyphicon-ok"></span>Gelişen teknolojinin eğitimde kullanılması bu sınavların mekândan bağımsız olarak hazırlanmasını, uygulanmasını ve değerlendirmesinin hızlı bir şekilde yapılmasına imkan vermektedir. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Bu işlemlerin eğitmenler açısından hızlı bir şekilde sonuçlanması eğitmenlerin zamanını daha verimli kullanmasını sağlayacaktır. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Eğitmenler hızlı bir şekilde ölçme ihtiyaçlarını giderdiğinden, sınıf içinde kullandıkları materyal, öğretim yöntem ve tekniklerinin ve sınıf başarısını sorgulama fırsatı bulacaklardır. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Bu sorgulamadan sonra eğitmenler gerek kendi başarısı gerekse öğrencilerinin başarısı hakkında daha verimli sonuçlar alarak buna göre gerekli gözden geçirmeleri yapacaktır. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>İşte bu amaçla kurulacak olan sistem web tabanlı bir mimari üzerine kurulması planlanıp eğitmenler ve öğrenciler sisteme internet üzerinden erişebilecek şekilde tasarlanması kararlaştırılmıştır. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Sistem eğitmenlerin çoktan seçmeli  soru bankası oluşturma, sınav hazırlama  ve değerlendirmelerine yardımcı olmakta, öğrencilerin de eş zamanlı olarak oluşturulmuş sınavlara katılmalarına olanak sağlayacak şekilde tasarlanması kararlaştırılmıştır.
               
                    </p>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
        <!-- /Açıklamalar -->

        <!-- Projemiz Bölümü -->
        <div id="top" class="jumbotron">
            <div class="container" id="project">
                <h1>Projemiz</h1>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 feature-text">
                    <h3>Web Tabanlı Sınav Sistemi</h3>
                    <p>
                        <span class="glyphicon glyphicon-ok"></span>Bilindiği gibi Web teknolojisi iletişim aracı olarak interneti kullanmaktadır. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Dolayısı ile, <i>Web Tabanlı Sınav Sistemi</i> aynı zamanda internete dayalı sınav sistemidir. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Internete dayalı sınav sisteminde, özel olarak geliştirilmiş herhangi bir bilgisayar, program kullanılmak suretiyle sınav yapılabilirken, web destekli sınav sistemlerinde web teknolojilerinin ve bu teknolojinin kullanmakta olduğu HTTP (Hypertext Transfer Protocol) kullanılması gerekmektedir. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Bu sistemle hazırlanmış bir sınavın alınması için, herhangi bir sistem üzerinde bulunan bir web gezgini yeterli olurken, diğerlerinde özel program gereksinimi olabilir. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Herhangi bir sınav sistemi aynı anda, “Bilgisayara Dayalı”, “Internete Dayalı” ve “Web Destekli” olabilir. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Tüm Web Destekli sistemler aynı zamanda “Internete Dayalı” sistemlerdir. 
                 
                        <br>
                        <br>
                        &emsp;<b>ANALİZ</b>
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Bilindiği gibi, sınav sistemleri değişik faktörlere bağlı olmak üzere farklılıklar arzetmektedir. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Bu faktörlerden en önemlileri olan sınav konusu, sınavın eğitsel amacı, sınavın uygulanacağı kitle, çevrimiçi sınav sisteminin geliştirilmesinde de en önemli kriterleri belirlemektedir. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Bu aşamada yapılması gereken en önemli şeylerden birisi “İhtiyaç Analizi” (Requirement Analysis) ve "İhtiyaç Tanımları" (Requirement Specification) 'dır. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Bizim, bu çalışmada üzerinde duracağımız sınav sistemi, çoktan seçmeli sınav sistemidir.
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Analiz aşamasında yapılması gereken en önemli şeylerin başında kullanım durumlarının çıkarılmasıdır (Use-Cases). 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Kullanım durumlarının tespit edilmesinin ve senaryolaştırılmasının en kolay yollarından birisi, kullanıcı guruplarının belirlenmesidir. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Kullanıcı gurupları belirlendikten sonra, sistem tam anlamı ile çalışıyor farzedilerek kullanım senaryoları oluşturulur. 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-ok"></span>Böylelikle hem sistemin işlevsellikleri, hem de sahip olması gereken verilerin yapılarına ulaşılabilir 
                 
                        <br>
                        <br>
                        <span class="glyphicon glyphicon-tag"></span>Genel anlamı ile sistemin kullanıcı kitlesini;
                 
                        <br>
                        <br>
                        &emsp;&emsp;&emsp;<span class="glyphicon glyphicon-arrow-right"></span> Yönetici
                 
                        <br>
                        <br>
                        &emsp;&emsp;&emsp;<span class="glyphicon glyphicon-arrow-right"></span> Eğitmen (sınav hazırlayıcı)
                 
                        <br>
                        <br>
                        &emsp;&emsp;&emsp;<span class="glyphicon glyphicon-arrow-right"></span> Öğrenci
                 
                        <br>
                        <br>
                        oluşturmaktadır.
               
                    </p>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
        <!-- /Projemiz Bölümü -->

        <!-- Hakkımızda Bölümü -->
        <div id="top" class="jumbotron">
            <div class="container" id="about">
                <h1>Hakkımızda</h1>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <div class="team-member">
                        <img src="img/recep.jpg" class="img-responsive img-circle" alt=""/>
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
                        <br>
                        <p>
                            1989 Diyarbakır doğumlu. İlköğrenimini ve lise öğrenimini Diyarbakır ve Şanlıurfa şehirlerinde tamamladı. Tes-iş Anadolu Lisesi'nden mezun oldu. 2010 yılından beri İstanbul Üniversitesi Mühendislik Fakültesi Bilgisayar Mühendisliği Bölümü'ne devam etmektedir.
                           
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Hakkımızda Bölümü -->

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
                    <img src="img/yukari-cik.png" alt="Yukarı Çık" style="width: 30px; border-radius: 100%;"/>
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
    <script type="text/javascript">
        $(document).ready(function () {
            // navigation click actions 
            $('.scroll-link').on('click', function (event) {
                event.preventDefault();
                var sectionID = $(this).attr("data-id");
                scrollToID('#' + sectionID, 750);
            });
            // scroll to top action
            $('.scroll-top').on('click', function (event) {
                event.preventDefault();
                $('html, body').animate({ scrollTop: 0 }, 'slow');
            });
            // mobile nav toggle
            $('#nav-toggle').on('click', function (event) {
                event.preventDefault();
                $('#main-nav').toggleClass("open");
            });
        });
        // scroll function
        function scrollToID(id, speed) {
            var offSet = 0;
            var targetOffset = $(id).offset().top - offSet;
            var mainNav = $('#main-nav');
            $('html,body').animate({ scrollTop: targetOffset }, speed);
            if (mainNav.hasClass("open")) {
                mainNav.css("height", "1px").removeClass("in").addClass("collapse");
                mainNav.removeClass("open");
            }
        }
        if (typeof console === "undefined") {
            console = {
                log: function () { }
            };
        }
    </script>

</body>
</html>
