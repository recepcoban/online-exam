<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="SinavSistemi.admin.Giris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>WTSS - Yönetici Girişi</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Yönetici Giriş Bölümü -->
        <div id="top" class="jumbotron">
            <div class="container">
                <h1>Yönetici Girişi</h1>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 giris-baslik">
                    <br />
                    <div class="container">
                        <div class="well">

                            <fieldset>
                                <div class="col-lg-8 col-lg-offset-2 text-left">
                                    <br />
                                    <br />
                                    <asp:UpdatePanel runat="server" ID="updateGiris">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtKadi" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı" />
                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtKadi" runat="server" ValidationGroup="yonGiris" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                            <br />
                                            <asp:TextBox ID="txtParola" TextMode="Password" runat="server" CssClass="form-control" placeholder="Parola" />
                                            <asp:RequiredFieldValidator ErrorMessage="Bu Alan Boş Geçilemez!" ControlToValidate="txtParola" runat="server" ValidationGroup="yonGiris" ForeColor="Red" Font-Size="Small" Font-Bold="true" />
                                            <br />
                                            <asp:Button Text="GİRİŞ YAP" ID="btnGiris" OnClick="btnGiris_Click" runat="server" Height="40" CssClass="form-control btn btn-primary" ValidationGroup="yonGiris" />
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
                                    <br />
                                </div>
                            </fieldset>

                        </div>

                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
        <!-- /İşlemler Bölümü -->

    </form>

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>
