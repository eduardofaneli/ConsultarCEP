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
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
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
          'KingHost'
          'Correios')
        TabOrder = 1
        OnClick = rgOndeConsultarClick
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
        object btnConsultar: TBitBtn
          Left = 2
          Top = 15
          Width = 231
          Height = 34
          Align = alClient
          Caption = 'Consultar'
          Default = True
          TabOrder = 0
          OnClick = btnConsultarClick
          ExplicitLeft = 40
          ExplicitTop = 3
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
      object edtToken: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 536
        Height = 21
        Align = alClient
        TabOrder = 0
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
    end
  end
end
