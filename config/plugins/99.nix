{
  lib,
  fetchFromGitHub,
  vimUtils,
}:

let
  pname = "99";
  version = "2c771814e1d95280ee99545de61b28dfa773c5fa";

  src = fetchFromGitHub {
    owner = "ThePrimeagen";
    repo = pname;
    rev = version;
    sha256 = "sha256-Gzh7YMWJtBzacy1ivOZhGrTVXhwMI2Yz3SiEWzET+PM=";
  };
in
vimUtils.buildVimPlugin {
  inherit pname version src;
  dependencies = [ ];
}
