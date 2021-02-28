self: super:
{
  linux_gru_4_4 = super.callPackage ../pkgs/linux_gru_4_4;
  linuxPackages_gru_4_4 = self.lnuxPackagesFor self.linux_gru_4_4;
}
