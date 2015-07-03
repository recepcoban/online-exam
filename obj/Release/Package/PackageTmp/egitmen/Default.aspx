<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SinavSistemi.egitmen.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>WTSS - Eğitmen Paneli</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script type="text/javascript" language="javascript">
        function sedeceSayi(evt) {
            evt = (evt) ? evt : window.event
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false
            }
            return true
        }
    </script>
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

        <!-- Eğitmen Bölümü -->
        <div id="top" class="jumbotron">
            <div class="container">
                <h1>Eğitmen Paneli</h1>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <asp:Panel runat="server" ID="yonetici_paneli">
                    <section id="ogretmen">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#profil" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>&nbsp;<b>Profil</b></a></li>
                            <li><a href="#dersekle" data-toggle="tab"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;<b>Ders Ekle</b></a></li>
                            <li><a href="#sinavolustur" data-toggle="tab"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;<b>Sınav Oluştur</b></a></li>
                            <li><a href="#soruekle" data-toggle="tab"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;<b>Soru Ekle</b></a></li>
                            <li><a href="#sorular" data-toggle="tab"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;<b>Sorular</b></a></li>
                            <li><a href="#kullanicilar" data-toggle="tab"><span class="glyphicon glyphicon-folder-open"></span>&nbsp;<b>Kullanicilar</b></a></li>
                            <li><a href="#ayar" onclick="" data-toggle="tab"><span class="glyphicon glyphicon-cog"></span>&nbsp;<b>Ayarlar</b></a></li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active in" id="profil">
                                <br />
                                <br />
                                <fieldset>
                                    <div class="col-lg-4 col-lg-offset-1 text-center">

                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                            <div class="tab-pane fade" id="sinavolustur">
                                <br />
                                <br />
                                <fieldset>
                                    <div class="col-lg-6 col-lg-offset-3 text-left">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional">
                                            <ContentTemplate>

                                                <asp:GridView CssClass="table table-responsive table-bordered table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sinav_id" DataSourceID="gvSinavListesi">
                                                    <Columns>
                                                        <asp:BoundField DataField="sinav_id" HeaderText="Sınav ID" InsertVisible="False" ReadOnly="True" SortExpression="sinav_id" />
                                                        <asp:BoundField DataField="sinav_adi" HeaderText="Sınav Adı" SortExpression="sinav_adi" />
                                                        <asp:BoundField DataField="sinav_sure" HeaderText="Sınav Süresi" SortExpression="sinav_adi" />
                                                        <asp:BoundField DataField="ders_id" HeaderText="Ders ID" SortExpression="ders_id" />
                                                        <asp:TemplateField HeaderText="İşlem" ShowHeader="False">
                                                            <EditItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelle"></asp:LinkButton>
                                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal"></asp:LinkButton>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Düzenle"></asp:LinkButton>
                                                                &nbsp;<asp:LinkButton ForeColor="Red" OnClientClick="return confirm('Silmek istediğine emin misin?');" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="gvSinavListesi" runat="server" ConnectionString="<%$ ConnectionStrings:db_sinav_sistemi %>" DeleteCommand="DELETE FROM [Sinavlar] WHERE [sinav_id] = @sinav_id" InsertCommand="INSERT INTO [Sinavlar] ([sinav_adi], [sinav_sure], [ders_id]) VALUES (@sinav_adi, @sinav_sure, @ders_id)" SelectCommand="SELECT * FROM [Sinavlar]" UpdateCommand="UPDATE [Sinavlar] SET [sinav_adi] = @sinav_adi, [sinav_sure] = @sinav_sure, [ders_id] = @ders_id WHERE [sinav_id] = @sinav_id">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="sinav_id" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="sinav_adi" Type="String" />
                                                        <asp:Parameter Name="sinav_sure" Type="Int32" />
                                                        <asp:Parameter Name="ders_id" Type="Int32" />
                                                    </InsertParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="sinav_adi" Type="String" />
                                                        <asp:Parameter Name="sinav_sure" Type="Int32" />
                                                        <asp:Parameter Name="ders_id" Type="Int32" />
                                                        <asp:Parameter Name="sinav_id" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>


                                                <asp:TextBox runat="server" ID="txtSinavAdi" placeholder="Sınav Adı" CssClass="form-control" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Bu Alan Boş Geçilemez!" ValidationGroup="sinavKayit" ControlToValidate="txtSinavAdi" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                <br />
                                                <asp:TextBox runat="server" ID="txtSinavSuresi" onKeyPress="return sedeceSayi(event)" TextMode="Number" placeholder="Sınav Süresi (dakika olarak girin)" CssClass="form-control" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ErrorMessage="Bu Alan Boş Geçilemez!" ValidationGroup="sinavKayit" ControlToValidate="txtSinavSuresi" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                <br />
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="lstSinavDersler" AppendDataBoundItems="True">
                                                    <asp:ListItem Text="Ders Seçiniz" />
                                                </asp:DropDownList>
                                                <br />
                                                <asp:Button Text="KAYDET" runat="server" ID="btnSinavEkle" OnClick="btnSinavEkle_Click" CssClass="btn btn-xl btn-lg btn-primary btn-block" ValidationGroup="sinavKayit" />
                                                <br />
                                                <div class="text-center">
                                                    <asp:Label Text="" ForeColor="Green" ID="lblSinavOK" runat="server" />
                                                    <asp:Label Text="" ForeColor="Red" ID="lblSinavFAIL" runat="server" />
                                                </div>


                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnSinavEkle" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </fieldset>
                                <br />
                            </div>
                            <div class="tab-pane fade" id="dersekle">
                                <br />
                                <br />
                                <fieldset>
                                    <div class="col-lg-6 col-lg-offset-3 text-left">

                                        <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                                            <ContentTemplate>

                                                <asp:GridView CssClass="table table-bordered table-hover table-responsive" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ders_id" DataSourceID="gvDersListesi">
                                                    <Columns>
                                                        <asp:BoundField DataField="ders_id" HeaderText="Ders ID" InsertVisible="False" ReadOnly="True" SortExpression="ders_id" />
                                                        <asp:BoundField DataField="ders_adi" HeaderText="Ders Adı" SortExpression="ders_adi" />
                                                        <asp:TemplateField HeaderText="İşlem" ShowHeader="False">
                                                            <EditItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelle"></asp:LinkButton>
                                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal"></asp:LinkButton>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Düzenle"></asp:LinkButton>
                                                                &nbsp;<asp:LinkButton ID="LinkButton2" OnClientClick="return confirm('Silmek istediğine emin misin?');" ForeColor="Red" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="gvDersListesi" runat="server" ConnectionString="<%$ ConnectionStrings:db_sinav_sistemi %>" DeleteCommand="DELETE FROM [Dersler] WHERE [ders_id] = @ders_id" InsertCommand="INSERT INTO [Dersler] ([ders_adi]) VALUES (@ders_adi)" SelectCommand="SELECT * FROM [Dersler]" UpdateCommand="UPDATE [Dersler] SET [ders_adi] = @ders_adi WHERE [ders_id] = @ders_id">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="ders_id" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="ders_adi" Type="String" />
                                                    </InsertParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="ders_adi" Type="String" />
                                                        <asp:Parameter Name="ders_id" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>

                                                <asp:TextBox runat="server" ID="txtDersAdi" placeholder="Ders Adı" CssClass="form-control" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Bu Alan Boş Geçilemez!" ValidationGroup="dersKayit" ControlToValidate="txtDersAdi" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                <br />
                                                <asp:Button Text="KAYDET" runat="server" ID="btnDersEkle" OnClick="btnDersEkle_Click" CssClass="btn btn-xl btn-lg btn-primary btn-block" ValidationGroup="dersKayit" />
                                                <br />
                                                <div class="text-center">
                                                    <asp:Label Text="" ForeColor="Green" ID="lblDersOK" runat="server" />
                                                    <asp:Label Text="" ForeColor="Red" ID="lblDersFAIL" runat="server" />
                                                </div>


                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnDersEkle" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>

                                    </div>
                                </fieldset>
                                <br />
                                <br />
                            </div>
                            <div class="tab-pane fade" id="soruekle">
                                <br />
                                <br />
                                <fieldset>
                                    <div class="col-lg-6 col-lg-offset-3 text-left">

                                        <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DropDownList OnSelectedIndexChanged="dropDersler_SelectedIndexChanged" runat="server" CssClass="form-control" ID="dropDersler" AppendDataBoundItems="True" AutoPostBack="true">
                                                    <asp:ListItem Text="Ders Seçiniz" />
                                                </asp:DropDownList>
                                                <br />
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="dropSinavlar" AppendDataBoundItems="True">
                                                    <asp:ListItem Text="Sınav Seçiniz" />
                                                </asp:DropDownList>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtSoru" placeholder="Soruyu Buraya Yazın..." TextMode="MultiLine" Rows="4" CssClass="form-control" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Bu Alan Boş Geçilemez!" ValidationGroup="soruKayit" ControlToValidate="txtSoru" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                <br />
                                                <span class="btn btn-default form-control btn-file">Şekil Seçiniz (Varsa)
                                                    <asp:FileUpload ID="fileSoruSekil" runat="server" />
                                                </span>
                                                <asp:RegularExpressionValidator ErrorMessage="Lütfen .png, .jpg, .jpeg uzantılı dosya seçiniz." ValidationExpression="([a-zA-Z\\].*(.jpg|.png|.jpeg|.JPG|.PNG|.JPEG)$)" ControlToValidate="fileSoruSekil" ForeColor="Red" ValidationGroup="soruKayit" runat="server" />
                                                <br />
                                                <asp:TextBox runat="server" ID="txtCvp1" placeholder="A Şıkkı" CssClass="form-control" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="Bu Alan Boş Geçilemez!" ValidationGroup="soruKayit" ControlToValidate="txtCvp1" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                <br />
                                                <asp:TextBox runat="server" ID="txtCvp2" placeholder="B Şıkkı" CssClass="form-control" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="Bu Alan Boş Geçilemez!" ValidationGroup="soruKayit" ControlToValidate="txtCvp2" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                <br />
                                                <asp:TextBox runat="server" ID="txtCvp3" placeholder="C Şıkkı" CssClass="form-control" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ErrorMessage="Bu Alan Boş Geçilemez!" ValidationGroup="soruKayit" ControlToValidate="txtCvp3" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                <br />
                                                <asp:TextBox runat="server" ID="txtCvp4" placeholder="D Şıkkı" CssClass="form-control" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ErrorMessage="Bu Alan Boş Geçilemez!" ValidationGroup="soruKayit" ControlToValidate="txtCvp4" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                                                <br />
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="dropDogruCevap">
                                                    <asp:ListItem Selected="True" Text="Doğru Cevap Seçiniz" />
                                                    <asp:ListItem Text="A" />
                                                    <asp:ListItem Text="B" />
                                                    <asp:ListItem Text="C" />
                                                    <asp:ListItem Text="D" />
                                                </asp:DropDownList>
                                                <br />
                                                <asp:Button Text="KAYDET" runat="server" ID="btnSoruEkle" OnClick="btnSoruEkle_Click" CssClass="btn btn-xl btn-lg btn-primary btn-block" ValidationGroup="soruKayit" />
                                                <br />
                                                <div class="text-center">
                                                    <asp:Label Text="" ForeColor="Green" ID="lblSoruOK" runat="server" />
                                                    <asp:Label Text="" ForeColor="Red" ID="lblSoruFAIL" runat="server" />
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="btnSoruEkle" />
                                            </Triggers>
                                        </asp:UpdatePanel>

                                    </div>
                                </fieldset>
                                <br />
                            </div>
                            <div class="tab-pane fade" id="sorular">
                                <br />
                                <br />
                                <fieldset>
                                    <div class="col-lg-12 text-left">

                                        <asp:UpdatePanel runat="server" ID="UpdatePanel5" UpdateMode="Conditional">
                                            <ContentTemplate>

                                                <div class="col-lg-6">
                                                    <asp:DropDownList OnSelectedIndexChanged="sorular_ders_SelectedIndexChanged" runat="server" CssClass="form-control" ID="sorular_ders" AppendDataBoundItems="True" AutoPostBack="true">
                                                        <asp:ListItem Text="Ders Seçiniz" />
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-lg-6">
                                                    <asp:DropDownList OnSelectedIndexChanged="sorular_sinav_SelectedIndexChanged" runat="server" CssClass="form-control" ID="sorular_sinav" AutoPostBack="true" AppendDataBoundItems="True">
                                                        <asp:ListItem Text="Sınav Seçiniz" />
                                                    </asp:DropDownList>
                                                </div>
                                                <br />
                                                <br />
                                                <br />


                                                <asp:GridView ID="GridView3" CssClass="col-lg-12 table table-bordered table-hover table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="soru_id" DataSourceID="gvSoruListesi" AllowPaging="True" PagerSettings-Mode="Numeric" PagerStyle-HorizontalAlign="Center" PagerStyle-CssClass="GridPager">
                                                    <Columns>
                                                        <asp:BoundField DataField="soru_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="soru_id" />
                                                        <asp:BoundField DataField="ders_id" HeaderText="Ders ID" SortExpression="ders_id" />
                                                        <asp:BoundField DataField="sinav_id" HeaderText="Sınav ID" SortExpression="sinav_id" />
                                                        <asp:BoundField DataField="soru_aciklama" HeaderText="Soru" SortExpression="soru_aciklama" />
                                                        <asp:BoundField DataField="soru_resim" HeaderText="Şekil" SortExpression="soru_resim" />
                                                        <asp:BoundField DataField="soru_cvp1" HeaderText="A Şıkkı" SortExpression="soru_cvp1" />
                                                        <asp:BoundField DataField="soru_cvp2" HeaderText="B Şıkkı" SortExpression="soru_cvp2" />
                                                        <asp:BoundField DataField="soru_cvp3" HeaderText="C Şıkkı" SortExpression="soru_cvp3" />
                                                        <asp:BoundField DataField="soru_cvp4" HeaderText="D Şıkkı" SortExpression="soru_cvp4" />
                                                        <asp:BoundField DataField="dogru_cvp" HeaderText="Doğru Cevap" SortExpression="dogru_cvp" />
                                                        <asp:TemplateField HeaderText="İşlem" ShowHeader="False">
                                                            <EditItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelle"></asp:LinkButton>
                                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal"></asp:LinkButton>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Düzenle"></asp:LinkButton>
                                                                &nbsp;<asp:LinkButton ID="LinkButton2" OnClientClick="return confirm('Silmek istediğine emin misin?');" ForeColor="Red" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <PagerStyle CssClass="GridPager" HorizontalAlign="Center" />
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="gvSoruListesi" runat="server" ConnectionString="<%$ ConnectionStrings:db_sinav_sistemi %>" DeleteCommand="DELETE FROM [Sorular] WHERE [soru_id] = @soru_id" InsertCommand="INSERT INTO [Sorular] ([ders_id], [sinav_id], [soru_aciklama], [soru_resim], [soru_cvp1], [soru_cvp2], [soru_cvp3], [soru_cvp4], [dogru_cvp]) VALUES (@ders_id, @sinav_id, @soru_aciklama, @soru_resim, @soru_cvp1, @soru_cvp2, @soru_cvp3, @soru_cvp4, @dogru_cvp)" SelectCommand="SELECT * FROM [Sorular] WHERE ([sinav_id] = @sinav_id)" UpdateCommand="UPDATE [Sorular] SET [ders_id] = @ders_id, [sinav_id] = @sinav_id, [soru_aciklama] = @soru_aciklama, [soru_resim] = @soru_resim, [soru_cvp1] = @soru_cvp1, [soru_cvp2] = @soru_cvp2, [soru_cvp3] = @soru_cvp3, [soru_cvp4] = @soru_cvp4, [dogru_cvp] = @dogru_cvp WHERE [soru_id] = @soru_id">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="soru_id" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="ders_id" Type="Int32" />
                                                        <asp:Parameter Name="sinav_id" Type="Int32" />
                                                        <asp:Parameter Name="soru_aciklama" Type="String" />
                                                        <asp:Parameter Name="soru_resim" Type="String" />
                                                        <asp:Parameter Name="soru_cvp1" Type="String" />
                                                        <asp:Parameter Name="soru_cvp2" Type="String" />
                                                        <asp:Parameter Name="soru_cvp3" Type="String" />
                                                        <asp:Parameter Name="soru_cvp4" Type="String" />
                                                        <asp:Parameter Name="dogru_cvp" Type="String" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:Parameter Name="sinav_id" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="ders_id" Type="Int32" />
                                                        <asp:Parameter Name="sinav_id" Type="Int32" />
                                                        <asp:Parameter Name="soru_aciklama" Type="String" />
                                                        <asp:Parameter Name="soru_resim" Type="String" />
                                                        <asp:Parameter Name="soru_cvp1" Type="String" />
                                                        <asp:Parameter Name="soru_cvp2" Type="String" />
                                                        <asp:Parameter Name="soru_cvp3" Type="String" />
                                                        <asp:Parameter Name="soru_cvp4" Type="String" />
                                                        <asp:Parameter Name="dogru_cvp" Type="String" />
                                                        <asp:Parameter Name="soru_id" Type="Int32" />
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

                                        <asp:UpdatePanel runat="server" ID="UpdatePanel6" UpdateMode="Conditional">
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
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarEposta" runat="server" ValidationGroup="yonAyar" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                <br />
                                                <asp:TextBox runat="server" ID="txtAyarParola" TextMode="Password" CssClass="form-control" placeholder="Parola" Font-Bold="true" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarParola" runat="server" ValidationGroup="yonAyar" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                                <br />
                                                <asp:TextBox runat="server" ID="txtAyarParolaTekrar" TextMode="Password" CssClass="form-control" placeholder="Parola (Tekrar)" Font-Bold="true" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtAyarParolaTekrar" runat="server" ValidationGroup="yonAyar" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
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
        <!-- /Eğitmen Bölümü -->

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

