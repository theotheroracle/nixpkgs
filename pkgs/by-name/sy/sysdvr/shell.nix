# shell.nix
with import <nixpkgs> { };

mkShell {
  name = "dotnet-env";
  packages = [
    nuget-to-json
    (
      with dotnetCorePackages;
      combinePackages [
        sdk_9_0
      ]
    )
  ];
}
