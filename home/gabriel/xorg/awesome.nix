{
  pkgs,
  ...
}:
let
  awesome = pkgs.awesome.overrideAttrs (oa: {
    version = "e6f5c79";
    src = pkgs.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "e6f5c79";
      hash = "sha256-afviu5b86JDWd5F12Ag81JPTu9qbXi3fAlBp9tv58fI=";
    };

    patches = [ ];

    postPatch = ''
      patchShebangs tests/examples/_postprocess.lua
    '';
  });
in {
  xsession.windowManager.awesome = {
    enable = false;
    package = awesome;
  };
}
