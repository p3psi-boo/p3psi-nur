{
  description = "P3psi's nur";
  outputs = { self }: {
    overlay = final: prev:
      import ./overlay.nix final prev;
  };
}
