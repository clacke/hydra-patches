{ pkgs ? import <nixpkgs> {}
, hydra ? pkgs.hydra
}:

hydra.overrideAttrs (oldAttrs: {
  prePatch = ''
    sed -i -e 's/getGCRootsDir,/& "--show-trace",/' src/script/hydra-eval-jobset
  '';
})
