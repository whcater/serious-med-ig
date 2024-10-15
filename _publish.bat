@ECHO OFF

SET publisher_jar=publisher.jar
SET input_cache_path=%CD%\input-cache

ECHO Checking internet connection...
PING tx.fhir.org -4 -n 1 -w 1000 | FINDSTR TTL && GOTO isonline
ECHO We're offline...
SET txoption= -no-network -validation-off -no-validade -tx n/a
@REM -no-sushi 
GOTO igpublish

:isonline
ECHO We're online
SET txoption=

:igpublish

SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%input_cache_path%\%publisher_jar%" (
	JAVA -jar "%input_cache_path%\%publisher_jar%" -ig . %txoption% %*
) ELSE If exist "..\%publisher_jar%" (
	JAVA -jar "..\%publisher_jar%" -ig . %txoption% %*
) ELSE (
	ECHO IG Publisher NOT FOUND in input-cache or parent folder.  Please run _updatePublisher.  Aborting...
)

xcopy /Y .\output\package.tgz C:\dev\ig\fhir-ig-validation\src\main\resources\hl7-fhir-ig\pmi-ig\  
xcopy /E/Y .\output\*  ..\deploy\ig\serious-med-ig\ 
start ..\deploy\ig\serious-med-ig\artifacts.html
call zip-ig.bat

PAUSE
