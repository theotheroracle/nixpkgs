{
  lib,
  stdenv,
  fetchFromGithub,
}:

stdenv.mkDerivation {
  pname = "sysdvr-udev";
  version = "6.2";

  src = fetchFromGitHub {
    owner = "exelix11";
    repo = "SysDVR";
    tag = "v${version}";
    hash = "";
  };

  installPhase = ''
    install -Dpm644 $src/Client/Platform/Linux/sysdvr.rules $out/lib/udev/rules.d/50-wooting.rules
  '';

  meta = with lib; {
    homepage = "https://github.com/exelix11/SysDVR/";
    description = "udev rules that give NixOS permission to communicate with sysdvr on switch";
    platforms = platforms.linux;
    license = "GPL2";
    maintainers = with maintainers; [
      theotheroracle
    ];
  };
}
