{
  description = ''Cirru EDN loader in Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-cirru_edn-v0_3_3.flake = false;
  inputs.src-cirru_edn-v0_3_3.owner = "Cirru";
  inputs.src-cirru_edn-v0_3_3.ref   = "v0_3_3";
  inputs.src-cirru_edn-v0_3_3.repo  = "cirru-edn.nim";
  inputs.src-cirru_edn-v0_3_3.type  = "github";
  
  inputs."cirru-parser".owner = "nim-nix-pkgs";
  inputs."cirru-parser".ref   = "master";
  inputs."cirru-parser".repo  = "cirru-parser";
  inputs."cirru-parser".dir   = "";
  inputs."cirru-parser".type  = "github";
  inputs."cirru-parser".inputs.nixpkgs.follows = "nixpkgs";
  inputs."cirru-parser".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-cirru_edn-v0_3_3"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-cirru_edn-v0_3_3";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}