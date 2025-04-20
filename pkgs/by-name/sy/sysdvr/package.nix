{
  lib,
  dotnetCorePackages,
  fetchFromGitHub,
  buildDotnetModule,
}:

buildDotnetModule rec {
  pname = "sysdvr";
  version = "6.2";

  src = fetchFromGitHub {
    owner = "exelix11";
    repo = "SysDVR";
    tag = "v${version}";
    hash = "sha256-3t87KWltTdK/4Cd68lwjxOFaqylaG6ZCwHQ54MLzBGc=";
  };

  projectFile = "Client/Client.csproj";

  dotnet-sdk = dotnetCorePackages.dotnet_9.sdk;
  dotnet-runtime = dotnetCorePackages.runtime_9_0-bin;
  nugetDeps = ./deps.json;

  meta = with lib; {
    homepage = "https://github.com/exelix11/SysDVR/";
    description = "sysdvr screen capture client for switch";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [
      theotheroracle
    ];
  };
}
