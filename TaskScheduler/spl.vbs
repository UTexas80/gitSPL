Dim objExcel, objWorkbook

'objExcel.Visible = False
'objExcel.DisplayAlerts = False

Set objExcel = CreateObject("Excel.Application")
Set objWorkbook = objExcel.Workbooks.Open("C:\Users\gfalk\OneDrive - University of Georgia\SPL\SPL.xlsm")

objExcel.Application.Visible = True
objExcel.Application.Run "SPL.xlsm!Main" 
 
objWorkbook.Save
objExcel.Application.Quit



'xlBook.Save
'xlBook.Close False
'set xlBook = Nothing

'objExcel.Close False
'set objExcel = Nothing

'objExcel.DisplayAlerts = True

WScript.Echo "Finished."
WScript.Quit