<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SinavSistemi.admin.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>WTSS - Yönetim Paneli</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://localhost:49394/maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
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
                    <a class="navbar-brand scroll-top" href="Default.aspx" style="padding: 0px;">
                        <img src="../img/logo.png" alt="" /></a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <asp:Label Text="" ID="lblSession" runat="server" ForeColor="DodgerBlue" BackColor="Transparent" CssClass="btn btn-primary btn-sm navbar-btn btn-menu" />
                        </li>
                        <li>
                            <asp:Button Text="Çıkış" ID="sessionCikis" OnClick="sessionCikis_Click" OnClientClick="return confirm('Çıkış yapmak istediğine emin misin?');" runat="server" CssClass="btn btn-primary btn-sm navbar-btn btn-menu" />
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- /Menü Bölümü -->

        <!-- Yönetici Bölümü -->
        <div id="top" class="jumbotron">
            <div class="container">
                <h1>Yönetim Paneli</h1>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <asp:Panel runat="server" ID="yonetici_paneli">
                    <section id="ogretmen">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#profil" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>&nbsp;<b>Profil</b></a></li>
                            <li><a href="#egitmenekle" data-toggle="tab"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;<b>Eğitmen Ekle</b></a></li>
                            <li><a href="#egitmenler" data-toggle="tab"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;<b>Eğitmenler</b></a></li>
                            <li><a href="#kullanicilar" data-toggle="tab"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;<b>Kullanicilar</b></a></li>
                            <li><a href="#ayar" onclick="" data-toggle="tab"><span class="glyphicon glyphicon-cog"></span>&nbsp;<b>Ayarlar</b></a></li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active in" id="profil">
                                <br />
                                <br />
                                <fieldset>
                                    <div class="col-lg-4 col-lg-offset-1 text-center">

                                        <asp:UpdatePanel runat="server">
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
                            <div class="tab-pane fade" id="egitmenekle">
                                <br />
                                <br />

                                <fieldset>
                                    <div class="col-lg-6 col-lg-offset-3 text-left">

                                        <asp:UpdatePanel runat="server" ID="updateKayit">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtKayitKadi" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKayitKadi" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                <br />
                                                <asp:TextBox ID="txtKayitAdi" runat="server" CssClass="form-control" placeholder="Adı" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKayitAdi" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                <br />
                                                <asp:TextBox ID="txtKayitSoyadi" runat="server" CssClass="form-control" placeholder="Soyadı" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKayitSoyadi" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                <br />
                                                <asp:TextBox ID="txtKayitEposta" runat="server" CssClass="form-control" placeholder="E-posta" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKayitEposta" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                <br />
                                                <asp:TextBox ID="txtKayitParola" TextMode="Password" runat="server" CssClass="form-control" placeholder="Parola" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKayitParola" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                <br />
                                                <asp:TextBox ID="txtKayitParolaTekrar" TextMode="Password" runat="server" CssClass="form-control" placeholder="Parola (Tekrar)" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKayitParolaTekrar" runat="server" ValidationGroup="kayit" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
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

                                <br />
                            </div>
                            <div class="tab-pane fade" id="egitmenler">
                                <br />
                                <br />
                                <fieldset>
                                    <div class="col-lg-12 text-left">

                                        <asp:UpdatePanel runat="server" ID="UpdatePanel5" UpdateMode="Conditional">
                                            <ContentTemplate>

                                                

                                                <asp:GridView ID="GridView1" CssClass="table table-responsive table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EgitmenListesi">
                                                    <Columns>
                                                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                                        <asp:BoundField DataField="kadi" HeaderText="Kullanıcı Adı" SortExpression="kadi" />
                                                        <asp:BoundField DataField="adi" HeaderText="Adi" SortExpression="adi" />
                                                        <asp:BoundField DataField="soyadi" HeaderText="Soyadi" SortExpression="soyadi" />
                                                        <asp:BoundField DataField="eposta" HeaderText="E-posta" SortExpression="eposta" />
                                                        <asp:BoundField DataField="parola" HeaderText="Parola" SortExpression="parola" />
                                                        <asp:TemplateField HeaderText="İşlem" ShowHeader="False">
                                                            <EditItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelle"></asp:LinkButton>
                                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal"></asp:LinkButton>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Düzenle"></asp:LinkButton>
                                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('Silmek istediğine emin misin?');" CausesValidation="False" CommandName="Delete" Text="Sil"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="EgitmenListesi" runat="server" ConnectionString="<%$ ConnectionStrings:db_sinav_sistemi %>" DeleteCommand="DELETE FROM [Egitmen] WHERE [id] = @id" InsertCommand="INSERT INTO [Egitmen] ([kadi], [adi], [soyadi], [eposta], [parola], [resim]) VALUES (@kadi, @adi, @soyadi, @eposta, @parola, @resim)" SelectCommand="SELECT * FROM [Egitmen]" UpdateCommand="UPDATE [Egitmen] SET [kadi] = @kadi, [adi] = @adi, [soyadi] = @soyadi, [eposta] = @eposta, [parola] = @parola, [resim] = @resim WHERE [id] = @id">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="id" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="kadi" Type="String" />
                                                        <asp:Parameter Name="adi" Type="String" />
                                                        <asp:Parameter Name="soyadi" Type="String" />
                                                        <asp:Parameter Name="eposta" Type="String" />
                                                        <asp:Parameter Name="parola" Type="String" />
                                                        <asp:Parameter Name="resim" Type="String" />
                                                    </InsertParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="kadi" Type="String" />
                                                        <asp:Parameter Name="adi" Type="String" />
                                                        <asp:Parameter Name="soyadi" Type="String" />
                                                        <asp:Parameter Name="eposta" Type="String" />
                                                        <asp:Parameter Name="parola" Type="String" />
                                                        <asp:Parameter Name="resim" Type="String" />
                                                        <asp:Parameter Name="id" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>

                                                

                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </div>
                                </fieldset>
                                <br />
                                <br />
                            </div>
                            <div class="tab-pane fade" id="kullanicilar">
                                <br />
                                <br />
                                <asp:UpdatePanel ID="updatepanelkullanici" UpdateMode="Conditional" runat="server">
                                    <ContentTemplate>
                                        <fieldset>
                                            <div class="col-lg-10 col-lg-offset-1 table-responsive text-left">
                                                <div class="col-lg-offset-1 col-lg-6">
                                                    <asp:TextBox CssClass="form-control" ID="txtKulAra" runat="server" placeholder="Aramak istediğiniz kişinin ADINI girin..." />
                                                </div>
                                                <div class="col-lg-3">
                                                    <asp:Button Text="ARA" ID="btnKulAra" CssClass="btn btn-success col-lg-6" OnClick="btnKulAra_Click" runat="server" />
                                                </div>
                                                <br />
                                                <br />
                                                <br />
                                                <table class="table table-hover table-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th>Kullanıcı Adı</th>
                                                            <th>Adı</th>
                                                            <th>Soyadı</th>
                                                            <th>E-posta</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="lstKullanicilar" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td><%#Eval("kadi") %></td>
                                                                    <td><%#Eval("adi") %></td>
                                                                    <td><%#Eval("soyadi") %></td>
                                                                    <td><%#Eval("eposta") %></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </fieldset>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnKulAra" EventName="Click" />
                                    </Triggers>
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
                    </section>
                </asp:Panel>
                <br />
                <br />
                <br />
            </div>
        </div>
        <!-- /Yönetici Bölümü -->
        
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
                    <img src="../img/yukari-cik.png" alt="Yukarı Çık" style="width: 30px; border-radius: 100%;" />
                </a>


            </div>
        </footer>
        <!-- /Footer Bölümü -->

    </form>

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
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
