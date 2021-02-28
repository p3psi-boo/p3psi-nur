{ stdenv, fetchgit, linuxManualConfig, ... } @ args:

linuxManualConfig ({
  inherit stdenv;

  version = "4.4.179-ARCH";
  modDirVersion = "4.4.179-ARCH";

  configfile = ./linux-gru.config;

  extraMeta.platforms = [ "aarch64-linux" ];
  extraMeta.branch = "4.4";

  src = fetchgit {
    url = "https://chromium.googlesource.com/chromiumos/third_party/kernel/";
    rev = "5fce67aba2047d29a6290bbfdd98c22926621957";
    sha256 = "1kh1bq2lyz6j8i9wn0piyi8x5g4x09kas0h8yadcmwrg02jrw9jr";
  };

  kernelPatches = [
    { name = "arch-1"; patch = ./0001-Input-atmel_mxt_ts-Use-KERN_DEBUG-loglevel-for-statu.patch; }
    { name = "arch-2"; patch = ./0002-Revert-CHROMIUM-drm-rockchip-Add-PSR-residency-debug.patch; }
    { name = "arch-3"; patch = ./0003-temporary-hack-to-fix-console-output.patch; }
    { name = "linux-nixos-toolchain-compat"; patch = ./linux-nixos-toolchain-compat.patch; }
  ];

  features = { };
})
