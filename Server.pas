unit Server;

interface

uses
  System.SysUtils,
  Sparkle.HttpSys.Server,
  Sparkle.HttpServer.Context,
  Sparkle.HttpServer.Module;

procedure StartServer;
procedure StopServer;

implementation

uses
  System.IOUtils;

var
  SparkleServer: THttpSysServer;

procedure StartServer;
var
  Module : TAnonymousServerModule;
begin
  if Assigned(SparkleServer) then
     Exit;

  SparkleServer := THttpSysServer.Create;

  Module := TAnonymousServerModule.Create(
    'http://+:2001/tms/sparkle',
    procedure(const C: THttpServerContext) 
    begin 
      C.Response.StatusCode := 200; 
      C.Response.ContentType := 'text/html'; 
      C.Response.Close(TEncoding.UTF8.GetBytes('<h1>Hello, World!</h1><br/>Implement your server response here.')); 
    end
  );
  SparkleServer.AddModule(Module);

  SparkleServer.Start;
end;

procedure StopServer;
begin
  FreeAndNil(SparkleServer);
end;

initialization
  SparkleServer := nil;
finalization
  StopServer;
end.
