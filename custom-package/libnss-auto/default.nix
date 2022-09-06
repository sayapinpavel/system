{stdenv, fetchFromGitHub }:
stdenv.mkDerivation rec {
  name = "nss_auto";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "donapieppo";
    repo = "libnss-ato";
    rev = "603cae82c6a93f1b023188687f7ca2b52e8192d9";
    hash = "sha256-NGkprM6NNGhXMo+Es9V80KlDN/mvudE4u0bz0I682GU=";
  };
  
  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/lib
    mkdir -p $out/etc
    mv libnss-ato.conf $out/etc
    mv libnss_ato.so.2 $out/lib
  '';
}
