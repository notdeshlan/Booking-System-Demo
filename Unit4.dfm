object DataModule4: TDataModule4
  OldCreateOrder = False
  Height = 402
  Width = 643
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 128
    Top = 176
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tblUser'
    Left = 248
    Top = 264
  end
  object ADOTable2: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tblRoomBooking'
    Left = 304
    Top = 264
  end
  object ADOTable3: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tblArtists'
    Left = 368
    Top = 264
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 528
    Top = 160
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 528
    Top = 208
  end
  object DataSource3: TDataSource
    DataSet = ADOTable3
    Left = 528
    Top = 264
  end
  object ADOQuery1: TADOQuery
    EnableBCD = False
    Parameters = <>
    Left = 248
    Top = 216
  end
end
