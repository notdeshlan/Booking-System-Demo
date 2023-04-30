object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Form9'
  ClientHeight = 745
  ClientWidth = 1358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 192
    Top = 293
    Width = 56
    Height = 13
    Caption = 'Enter Name'
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 66
    Width = 320
    Height = 120
    DataSource = DataModule4.DataSource3
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object DBGrid2: TDBGrid
    Left = 392
    Top = 32
    Width = 766
    Height = 257
    DataSource = DataModule4.DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid2CellClick
  end
  object DBGrid3: TDBGrid
    Left = 392
    Top = 310
    Width = 753
    Height = 305
    DataSource = DataModule4.DataSource2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid3CellClick
  end
  object Panel1: TPanel
    Left = 1164
    Top = 32
    Width = 185
    Height = 41
    Caption = 'Show All Users'
    TabOrder = 3
    OnClick = Panel1Click
  end
  object Panel2: TPanel
    Left = 127
    Top = 208
    Width = 217
    Height = 41
    Caption = 'Number Of tickets sold for Artist'
    TabOrder = 4
    OnClick = Panel2Click
  end
  object Button1: TButton
    Left = 24
    Top = 208
    Width = 75
    Height = 25
    Caption = 'ASC'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 176
    Top = 312
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Button2: TButton
    Left = 24
    Top = 288
    Width = 105
    Height = 25
    Caption = 'Search For user'
    TabOrder = 7
    OnClick = Button2Click
  end
  object RichEdit1: TRichEdit
    Left = 40
    Top = 464
    Width = 281
    Height = 225
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 8
  end
  object Button3: TButton
    Left = 8
    Top = 425
    Width = 139
    Height = 25
    Caption = 'Read In Updated Costs'
    TabOrder = 9
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 208
    Top = 425
    Width = 89
    Height = 25
    Caption = 'Update Cost'
    Enabled = False
    TabOrder = 10
    OnClick = Button4Click
  end
  object Panel3: TPanel
    Left = 24
    Top = 19
    Width = 185
    Height = 41
    Caption = 'Click An Artist To Filter Info'
    TabOrder = 11
  end
  object Panel4: TPanel
    Left = 1165
    Top = 328
    Width = 185
    Height = 41
    Caption = 'Click A roomTo Filter Info'
    TabOrder = 12
  end
  object Button5: TButton
    Left = 40
    Top = 319
    Width = 75
    Height = 25
    Caption = 'Delete record'
    TabOrder = 13
    OnClick = Button5Click
  end
  object Panel5: TPanel
    Left = 1165
    Top = 416
    Width = 185
    Height = 41
    Caption = 'Filter By Room Only'
    TabOrder = 14
    OnClick = Panel5Click
  end
  object Button6: TButton
    Left = 240
    Top = 35
    Width = 121
    Height = 25
    Caption = 'Most expensive Ticket'
    TabOrder = 15
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 1165
    Top = 496
    Width = 140
    Height = 25
    Caption = 'Highest Room Price '
    TabOrder = 16
    OnClick = Button7Click
  end
end
