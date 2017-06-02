object frmConsultarCEP: TfrmConsultarCEP
  Left = 324
  Top = 91
  Caption = 'Consultar CEP'
  ClientHeight = 577
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbRetorno: TGroupBox
    Left = 0
    Top = 351
    Width = 552
    Height = 226
    Align = alClient
    Caption = 'Retorno'
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    ExplicitTop = 328
    ExplicitHeight = 249
    object mmRetorno: TMemo
      Left = 2
      Top = 15
      Width = 548
      Height = 209
      Align = alClient
      Color = clGradientInactiveCaption
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 552
    Height = 351
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object gbDados: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 159
      Width = 546
      Height = 189
      Align = alClient
      Caption = 'Retorno WS'
      Enabled = False
      TabOrder = 0
      ExplicitTop = 156
      ExplicitHeight = 183
      object lblCEP: TLabel
        Left = 21
        Top = 15
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object lblLogradouro: TLabel
        Left = 21
        Top = 58
        Width = 61
        Height = 13
        Caption = 'Logradouro'
      end
      object lblComplemento: TLabel
        Left = 21
        Top = 101
        Width = 72
        Height = 13
        Caption = 'Complemento'
      end
      object lblBairro: TLabel
        Left = 21
        Top = 144
        Width = 31
        Height = 13
        Caption = 'Bairro'
      end
      object lblLocalidade: TLabel
        Left = 282
        Top = 15
        Width = 55
        Height = 13
        Caption = 'Localidade'
      end
      object lblUF: TLabel
        Left = 282
        Top = 58
        Width = 14
        Height = 13
        Caption = 'UF'
      end
      object lblUnidade: TLabel
        Left = 282
        Top = 101
        Width = 44
        Height = 13
        Caption = 'Unidade'
      end
      object lblIBGE: TLabel
        Left = 282
        Top = 144
        Width = 24
        Height = 13
        Caption = 'IBGE'
      end
      object edtLogradouro: TEdit
        Left = 21
        Top = 74
        Width = 255
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object edtCEP: TEdit
        Left = 21
        Top = 31
        Width = 60
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtComplemento: TEdit
        Left = 21
        Top = 117
        Width = 255
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object edtBairro: TEdit
        Left = 21
        Top = 160
        Width = 255
        Height = 21
        Enabled = False
        TabOrder = 6
      end
      object edtLocalidade: TEdit
        Left = 282
        Top = 31
        Width = 255
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object edtUF: TEdit
        Left = 282
        Top = 74
        Width = 31
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object edtUnidade: TEdit
        Left = 282
        Top = 117
        Width = 60
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object edtIBGE: TEdit
        Left = 282
        Top = 160
        Width = 60
        Height = 21
        Enabled = False
        TabOrder = 7
      end
    end
    object pnlRequisicao: TPanel
      Left = 0
      Top = 0
      Width = 552
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object gbConsulta: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 114
        Height = 51
        Align = alLeft
        Caption = 'CEP Consulta'
        TabOrder = 0
        object edtConsulta: TEdit
          AlignWithMargins = True
          Left = 13
          Top = 21
          Width = 80
          Height = 21
          NumbersOnly = True
          TabOrder = 0
        end
      end
      object rgOndeConsultar: TRadioGroup
        AlignWithMargins = True
        Left = 123
        Top = 3
        Width = 185
        Height = 51
        Align = alLeft
        Caption = 'Onde consultar?'
        Columns = 2
        Items.Strings = (
          'ViaCEP'
          'KingHost')
        TabOrder = 1
        OnClick = rgOndeConsultarClick
        ExplicitHeight = 94
      end
      object gbConsultar: TGroupBox
        AlignWithMargins = True
        Left = 314
        Top = 3
        Width = 235
        Height = 51
        Align = alLeft
        Caption = ' '
        TabOrder = 2
        object btnConsultar: TPngBitBtn
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 225
          Height = 28
          Align = alClient
          Caption = 'Consultar'
          TabOrder = 0
          OnClick = btnConsultarClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F800000006624B474400FF00FF00FFA0BDA793000003CD4944415478DACD956D
            6C535518C7FFF7F6B6EBBD5DD7150ACCF66EA56C63C9CC5436060C148D98881A
            FD8028C664323FF8F2412531C05062B2443F005B8C6FF125A246184AC2829FD0
            C0078C1BD97B1DA8339AAD6E2BED5D98DD4BF7D2DBDBDB7B8FE776013B6DB799
            60C2939CF4DC9E9EFFAFE77F9EE7B90CFEE7606E6900D98687C0E2309D96D231
            40C79B4C1BCEDF1400D98E8741702EC3D2CE74C8D28006C28A965035CB621708
            5B4E5804599096A17385471942AAE92F0E52D071FAF93C553B424727D38A9A25
            0125EF0DE490B8B08F30CC611343AC549C53349D728C5D8CDEFF5D312B6832FC
            0555F91BCFF8A3D42E3BB56B9AAECED213D81705F89A242F4B705E749AC535B9
            9C6D6452C5EEBBF2F0FE0FE3700A264CC6345CE8790C65637E9C29A9EB8C27B5
            076A874EBEB4AC13B89B249795E0E71A1FEFAA1479EED3F6092A9E0F57AE096F
            5F8CA0BA88474F50C613520B9AFAF665B81C3CC35CC2C9AC809246E947A78DBB
            A3C8C9998C7F3A369344D99A9CD45ACF888C0D228F2B61194427F8B6FB519447
            FAD2B7B7A30D773306261360EDD1D0168E65BFAFF6F25696613030A6C0966382
            DBC1A5D6DB0273B8A7D886C14802A35115DBA6BA70AA7D3718A24367587C55F4
            F48BB5CDCD9FA46B2E0094368D7EBEC9CBD75140EAFB533D53D851968B82BC79
            8061D1ABF7BB20AB3ABEE898443C49F0E1B5463CD2FB0E4E57BC82377C879A07
            0FB86B170148A13D95F91EC36F233EBE3481BD9BF3C19BD90500232E87155CFC
            7D0602547C39F21AF67A8F403571E381031E575680EF9894A82AE4CDA6793D74
            0ECBD8ECE56956CE3F770CC550E31352737A05E8A2EB69761B6A5AB0DEC3DD34
            4037BD740B3DAC42ADB29A192492BA3A5C2F5A16B1281CDE53E9745FB7E8A3B6
            09D46DC96C512C4170A2DB4861075A2E4F63C7FA5C5CF86D2634B0DF5D9815B0
            AE513ABE75ADF0EC462F9F52FCDA1FC57DA5026ECB33FF0B204DA9680DC4F054
            9503B38A8E5F4715AD2B18FB2CB0DFFD4256C0F534ADF058699A02C3132A047A
            F4D576EE461DD00C4BCDAFD1FA88AB04DE15E6945DBF48B2226BFAF6507D6177
            568011C5C7C2BDABECE63B8B5D162E32AB61745A4585DBBAA00E8CF8498AC3E3
            3063A5CD84C13F95E4D8ACDA377450DCF44FBDCCAD42A7AD62DDDFADE2F10D0E
            ACB271372C32AAFB9B2B513CB77505FC57E36AC7702CA2A87A45F875717C4940
            2A9BD29A5D819DB30568E53E49211FB48EE3E57B57E234BD9BF5AB2D90A2EA5C
            389ABCAA27F1E01F87DCC14C5AFFB95DE7D007DA1B548D307102F2963037F56E
            7FC3ED896C3ACB7FE170EC2E6828D759F4D32A381B92C55E3430FA52DB6FED97
            FE72E22FE18DA528B1FCB6170000000049454E44AE426082}
          ExplicitLeft = 48
          ExplicitTop = 23
          ExplicitWidth = 75
          ExplicitHeight = 25
        end
      end
    end
    object gbToken: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 60
      Width = 546
      Height = 44
      Align = alTop
      Caption = 'Token'
      TabOrder = 2
      Visible = False
      ExplicitLeft = 0
      ExplicitTop = 57
      ExplicitWidth = 552
      object edtToken: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 536
        Height = 21
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 44
        ExplicitTop = 24
        ExplicitWidth = 121
      end
    end
    object rgEncode: TRadioGroup
      AlignWithMargins = True
      Left = 3
      Top = 110
      Width = 546
      Height = 43
      Align = alTop
      Caption = 'Tipo Encode'
      Columns = 5
      ItemIndex = 0
      Items.Strings = (
        'Nenhum'
        'UTF-8'
        'Ansi'
        'AscII'
        'Unicode')
      TabOrder = 3
      ExplicitLeft = 0
      ExplicitTop = 107
      ExplicitWidth = 552
    end
  end
end
