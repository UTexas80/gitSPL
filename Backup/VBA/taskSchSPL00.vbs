' GetObject("C:\Users\gfalk\OneDrive - University of Georgia\SPL\Backup\SPL_Test.xlsm").Application.Run "SPL_Test.xlsm!Yahoo Share Data.Main" 
Set objExcel = CreateObject("Excel.Application")
objExcel.Application.Run "'C:\Users\gfalk\OneDrive - University of Georgia\SPL\Backup\testSPL.xlsm'!inputSPL.Main"
objExcel.DisplayAlerts = False
objExcel.Application.Quit
Set objExcel = Nothing