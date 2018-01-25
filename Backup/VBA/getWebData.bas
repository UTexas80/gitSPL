Attribute VB_Name = "Module1"
Sub GetData()

    Dim QuerySheet As Worksheet
    Dim DataSheet As Worksheet
    Dim qurl As String
    Dim i As Integer
    Dim j As Integer
    Dim k As Integer
    
    Application.ScreenUpdating = False
    Application.DisplayAlerts = False
    Application.Calculation = xlCalculationManual
    
    Set DataSheet = ActiveSheet
  
    Range("C7").CurrentRegion.ClearContents
    i = 7
    qurl = "http://download.finance.yahoo.com/d/quotes.csv?s=" + Cells(i, 1)
    i = i + 1
    While Cells(i, 1) <> ""
        qurl = qurl + "+" + Cells(i, 1)
        i = i + 1
    Wend
    qurl = qurl + "&f=" + Range("C2")
    Range("c1") = qurl
QueryQuote:
             With ActiveSheet.QueryTables.Add(Connection:="URL;" & qurl, Destination:=DataSheet.Range("C7"))
                .BackgroundQuery = True
                .TablesOnlyFromHTML = False
                .Refresh BackgroundQuery:=False
                .SaveData = True
            End With

j = Range("A7").End(xlDown).Row

For k = 7 To j

Cells(k, "C").Value = Replace(Cells(k, "C").Value, ", Inc. Common Stoc", "")
Cells(k, "C").Value = Replace(Cells(k, "C").Value, ", Inc. Common St", "")
Cells(k, "C").Value = Replace(Cells(k, "C").Value, ", Inc. Co St", "")
Cells(k, "C").Value = Replace(Cells(k, "C").Value, ", Inc. Co", "")
Cells(k, "C").Value = Replace(Cells(k, "C").Value, ", Inc. (The)", "")
Cells(k, "C").Value = Replace(Cells(k, "C").Value, ", Inc. Com", "")
Cells(k, "C").Value = Replace(Cells(k, "C").Value, ", Inc.", "")
Cells(k, "C").Value = Replace(Cells(k, "C").Value, ", Incorporated C", "")

Next

            Range("C7").CurrentRegion.TextToColumns Destination:=Range("C7"), DataType:=xlDelimited, _
                TextQualifier:=xlDoubleQuote, ConsecutiveDelimiter:=False, Tab:=True, _
                Semicolon:=False, Comma:=True, Space:=False, other:=False
                        
    
'turn calculation back on
    Application.Calculation = xlCalculationAutomatic
    Application.DisplayAlerts = True
'    Range("C7:H2000").Select
'    Selection.Sort Key1:=Range("C8"), Order1:=xlAscending, Header:=xlGuess, _
'        OrderCustom:=1, MatchCase:=False, Orientation:=xlTopToBottom
    Columns("C:C").ColumnWidth = 25
    Rows("7:2000").RowHeight = 16
    Columns("J:J").ColumnWidth = 8.5
    Range("h2").Select

End Sub




