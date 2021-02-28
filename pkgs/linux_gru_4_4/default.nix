let pkgs = import <nixpkgs> {
    crossSystem = {
      config = "aarch64-unknown-linux-gnu";
    };
  };
in
pkgs.callPackage ./kernel.nix {
  kernelPatches = [

    { name = "arch-1"; patch = ./0001-Input-atmel_mxt_ts-Use-KERN_DEBUG-loglevel-for-statu.patch; }
    { name = "arch-2"; patch = ./0002-Revert-CHROMIUM-drm-rockchip-Add-PSR-residency-debug.patch; }
    { name = "arch-3"; patch = ./0003-temporary-hack-to-fix-console-output.patch; }

    { name = "linux-nixos-toolchain-compat"; patch = ./linux-nixos-toolchain-compat.patch; }
  ];
}
