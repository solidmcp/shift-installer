
; For more information about how to use inno, please see following page:
;    http://blog.csdn.net/wangyong0921/article/details/6873473

[Setup]

AppName=SolidMCP Shift Gateway
AppVerName=SolidMCP Gateway 2013
AppPublisher=SolidMCP
OutputBaseFilename=SolidMCP-Shift-Gateway-2013
DefaultDirName={pf}\SolidMCP\Shift 2013
DefaultGroupName=SolidMCP\Shift 2013
Compression=lzma/max
SolidCompression=yes


[Icons]

; Desktop Shortcut
Name: "{commondesktop}\SolidMCP Shift"; Filename: "{app}\bin\gateway.exe";IconFilename:"{app}\resources\skateboard.ico"

; Start Menu
Name: "{group}\Shift"; Filename: "{app}\bin\gateway.exe";
Name: "{group}\Uninstall"; Filename: "{uninstallexe}"

[Files]

; Readme
Source: "..\..\..\shift-gateway\README.md"; DestDir: {app}; Flags: ignoreversion replacesameversion isreadme;

; VC Redist
Source: "..\..\win32\tools\vcredist\x86\*.dll"; DestDir: {app}\bin; Flags: ignoreversion replacesameversion;


; Dlls
Source: "..\..\..\shift-gateway\src\Release\*.dll"; DestDir: {app}\bin; Flags: ignoreversion replacesameversion;

; Dlls
Source: "..\..\..\shift-gateway\src\Release\*.exe"; DestDir: {app}\bin; Flags: ignoreversion replacesameversion;

; Dlls
Source: "..\..\..\shift-gateway\src\Release\*.pak"; DestDir: {app}\bin; Flags: ignoreversion replacesameversion;

; locales
Source: "..\..\..\shift-gateway\src\Release\locales\*"; DestDir: {app}\bin\locales; Flags: ignoreversion replacesameversion Recursesubdirs;

Source: "..\..\..\shift-gateway\resources\*"; DestDir: {app}\resources; Flags: ignoreversion replacesameversion Recursesubdirs;


[Code]
function InitializeUninstall(): Boolean;
begin
  Result := True
end;

procedure DeinitializeUninstall();
begin
  //MsgBox('DeinitializeUninstall:' #13#13 'Bye bye!', mbinformation, MB_OK);
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  case CurUninstallStep of
    usUninstall:
      begin
	    DeleteFile(ExpandConstant('{app}\bin\debug.log'));
		DeleteFile(ExpandConstant('{app}\bin\console.log'));
		//MsgBox('usUninstall:' #13#13 'Ok, bye bye.', mbinformation, MB_OK);
      end;
    usPostUninstall:
      begin
		//MsgBox('usPostUninstall:' #13#13 'Ok, bye bye.', mbinformation, MB_OK);
      end;
  end;
end;

