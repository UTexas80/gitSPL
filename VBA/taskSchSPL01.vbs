Dim xlApp, xlBook

Set xlApp = CreateObject("Excel.Application")
xlApp.DisplayAlerts = False
Set xlBook = xlApp.Workbooks.Open("C:\Users\gfalk\OneDrive - University of Georgia\SPL\Backup\testSPL00.xlsm", 0, False)

xlApp.Run "Main"

xlbook.Save
xlBook.Close False
set xlBook = Nothing

xlApp.DisplayAlerts = True

xlApp.Quit
Set xlApp = Nothing

WScript.Echo "Finished."
WScript.Quit