Dim objExcel, xlApp, xlBook

Set xlApp = CreateObject("Excel.Application")

xlApp.Visible = False
Set objExcel = CreateObject("Excel.Application")
' Set xlBook = xlApp.Workbooks.Open("C:\Users\gfalk\OneDrive - University of Georgia\SPL\Backup\testSPL00.xlsm", 0, False)
objExcel.Application.Run "'C:\Users\gfalk\OneDrive - University of Georgia\SPL\Backup\testSPL.xlsm'!inputSPL.Main"

xlBook.Application.Run "inputSPL.Main" 'Change to the Module and Macro that contains your macro

xlBook.Close False
set xlBook = Nothing

xlApp.DisplayAlerts = True

xlApp.Quit
Set xlApp = Nothing

WScript.Echo "Finished."
WScript.Quit