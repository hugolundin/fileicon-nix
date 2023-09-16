{stdenv, fetchFromGitHub, lib}:

stdenv.mkDerivation {
  version = "0.3.4";
  name = "fileicon";

  src = fetchFromGitHub {
    owner = "mklement0";
    repo = "fileicon";
    rev = "9c41a44fac462f66a1194e223aa26e4c3b9b5ae3";
    sha256 = "lkDivFJoeebFeA55kHHN9av5N7nz5zUiW+uAw74IM5U=";
  };

  buildPhase = ''

  '';

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/man/man1
    install -m 0755 bin/fileicon $out/bin
    install -m 0444 man/fileicon.1 $out/share/man/man1
  '';

  meta = {
    homepage = "https://github.com/mklement0/fileicon";
    description = "macOS CLI for managing custom icons for files and folders";
    platforms = lib.platforms.darwin;
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.hugolundin ];
  };
}
