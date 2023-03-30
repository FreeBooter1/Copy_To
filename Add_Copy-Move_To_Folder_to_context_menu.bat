:: Add Copy To and Move to Context Menu in Windows 10 and Windows 11


@Echo Off
Cls & Color 1A

(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)



:Ask
Cls & Mode CON  LINES=6 COLS=80 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo        Add "Copy To..." and "Move To..." to Context Menu (A)   
Echo.       
Echo        Remove "Copy To..." and "Move To..." from Context Menu (R)
Echo.


Set /p input=^> 

If /i  Not %input%==A (Goto :_Ex) Else (Goto :_Add) 

:_Ex
If /i Not %input%==R  (Goto :ASK) Else (Goto :_RegRestore)



:_Add

Reg.exe add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\CopyToFolder" /ve /t REG_SZ /d "{C2FBB630-2971-11d1-A18C-00C04FD75D13}" /f > Nul
Reg.exe add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\MoveToFolder" /ve /t REG_SZ /d "{C2FBB631-2971-11D1-A18C-00C04FD75D13}" /f > Nul


Cls & Mode CON  LINES=11 COLS=80 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo           Adding "Copy To..." and "Move To..." to context menu  
Echo.
Echo.
Echo. 
Ping -n 5 localhost >Nul
Exit


:_RegRestore

Reg.exe add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\CopyToFolder" /f > Nul
Reg.exe add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\MoveToFolder" /f > Nul


Cls & Mode CON  LINES=11 COLS=80 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo           Removing "Copy To..." and "Move To..." from context menu    
Echo.
Echo.
Echo. 
Ping -n 5 localhost >Nul
Exit
