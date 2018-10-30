@echo off
rem Edit this variable to point to
rem the openssl.cnf file included
rem with easy-rsa.

rem Automatically set PATH to openssl.exe
FOR /F "tokens=2*" %%a IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\OpenVPN"') DO set "PATH=%PATH%;%%b\bin"

rem Alternatively define the PATH to openssl.exe manually
rem set "PATH=%PATH%;C:\Program Files\OpenVPN\bin"

set HOME=easy-rsa
set KEY_CONFIG=openssl-1.0.0.cnf

rem Edit this variable to point to
rem your soon-to-be-created key
rem directory.
rem
rem WARNING: clean-all will do
rem a rm -rf on this directory
rem so make sure you define
rem it correctly!
set KEY_DIR=keys

rem Increase this if you
rem are paranoid.  This will slow
rem down TLS negotiation performance
rem as well as the one-time DH parms
rem generation process.
set DH_KEY_SIZE=2048

rem Private key size
set KEY_SIZE=4096

rem These are the default values for fields
rem which will be placed in the certificate.
rem Change these to reflect your site.
rem Don't leave any of these parms blank.

set KEY_COUNTRY=US
set KEY_PROVINCE=CA
set KEY_CITY=SanFrancisco
set KEY_ORG=OpenVPN
set KEY_EMAIL=mail@host.domain
set KEY_CN=changeme
set KEY_NAME=changeme
set KEY_OU=changeme
set PKCS11_MODULE_PATH=changeme
set PKCS11_PIN=1234

cd %HOME%
rem build a request for a cert that will be valid for ten years
openssl req -days 3650 -nodes -new -keyout %KEY_DIR%\%1.key -out %KEY_DIR%\%1.csr -config %KEY_CONFIG% -subj "/C=CN/ST=BJ/L=CY/O=AVIC/OU=dev/CN=%1/emailAddress=songzc@avic-digital.com"
rem sign the cert request with our ca, creating a cert/key pair
openssl ca -batch -days 3650 -out %KEY_DIR%\%1.crt -in %KEY_DIR%\%1.csr -config %KEY_CONFIG%
rem delete any .old files created in this process, to avoid future file creation errors
del /q %KEY_DIR%\*.old