{
  pkgs ? import <nixpkgs> {}
}:
pkgs.stdenv.mkDerivation rec {
  name = "stm8flash-${version}";
  version = "1.0";
  src = builtins.fetchGit {
    url = "https://github.com/vdudouyt/stm8flash/";
  };

  buildInputs = [
    pkgs.libusb1
    pkgs.pkg-config
  ];

  buildPhase = "make";
  installPhase = ''
    mkdir -p $out/bin
    mv stm8flash $out/bin
  '';

  meta = with pkgs.stdenv.lib; {
    description = "program your stm8 devices with SWIM/stlinkv(1,2)";
    homepage = "https://github.com/vdudouyt/stm8flash/";
    license = licenses.gpl2;
    maintainers = with maintainers; [vdudouyt];
    platforms = platforms.unix;
  };
}
