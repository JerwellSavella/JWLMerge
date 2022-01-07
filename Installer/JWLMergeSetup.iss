; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define Dependency_NoExampleSetup
#include "CodeDependencies.iss"

#define MyAppName "JWLMerge"
#define MyAppPublisher "Antony Corbett"
#define MyAppURL "https://github.com/AntonyCorbett/JWLMerge"
#define MyAppExeName "JWLMerge.exe"

#define MyAppVersion GetFileVersion('..\JWLMerge\bin\Release\net6.0-windows\publish\JWLMerge.exe');

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{53082E90-DEA3-405D-B4C8-6495076D3D98}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={commonpf}\JWLMerge
DefaultGroupName={#MyAppName}
OutputBaseFilename=JWLMergeSetup
SetupIconFile=..\JWLMerge.ico
Compression=lzma
SolidCompression=yes
AppContact=antony@corbetts.org.uk
DisableWelcomePage=false
SetupLogging=True
RestartApplications=False
CloseApplications=False
AppMutex=JWLMergeAC

PrivilegesRequired=admin

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[InstallDelete]
; files from pre-net-5 edition
Type: files; Name: "{app}\JWLMerge.exe.config"
Type: files; Name: "{app}\JWLMergeCLI.exe.config"
Type: files; Name: "{app}\Serilog.Settings.AppSettings.dll"
Type: files; Name: "{app}\SQLite.Interop.dll"
Type: files; Name: "{app}\System.Data.SQLite.dll"
Type: files; Name: "{app}\System.Windows.Interactivity.dll"
Type: files; Name: "{app}\GalaSoft.MvvmLight.dll"
Type: files; Name: "{app}\GalaSoft.MvvmLight.Extras.dll"
Type: files; Name: "{app}\GalaSoft.MvvmLight.Platform.dll"
Type: files; Name: "{app}\CommonServiceLocator.dll"

; from abortive net-5 pre-release
Type: filesandordirs; Name: "{app}\ref"
Type: filesandordirs; Name: "{app}\runtimes"

[Files]
Source: "..\JWLMerge\bin\Release\net6.0-windows\publish\*"; DestDir: "{app}"; Flags: ignoreversion; Excludes: "*.pdb"

// https://go.microsoft.com/fwlink/?linkid=2135256
Source: "netcorecheck.exe"; Flags: dontcopy noencryption

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[ThirdParty]
UseRelativePaths=True

[Code]
procedure InitializeWizard;
begin
  InitializeWizard;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
begin
  Result := PrepareToInstall(NeedsRestart);
end;

function NeedRestart: Boolean;
begin
  Result := NeedRestart;
end;

function UpdateReadyMemo(const Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
begin
  Result := UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo);
end;

function InitializeSetup: Boolean;
begin
  // add dependencies (.NET 6 x86 desktop runtime)  
  Dependency_ForceX86 := true;  
  Dependency_AddDotNet60Desktop;    
  
  Result := True;  
end;

