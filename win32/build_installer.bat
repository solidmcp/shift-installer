SETLOCAL
SET THIS_FOLDER=%~dp0
CD /D %THIS_FOLDER%

:: Using inno to create an installer.
%THIS_FOLDER%tools\inno_setup\ISCC.exe /O"%THIS_FOLDER%..\..\..\outputs\installer" %THIS_FOLDER%Inno\build_installer.iss

ENDLOCAL