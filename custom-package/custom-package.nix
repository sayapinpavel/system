{ pkgs, ...}:

{
    environment.systemPackages = with pkgs; [ libnss-auto ];

    nixpkgs.config.packageOverrides = pkgs: rec {
	libnss-auto = pkgs.callPackage ./libnss-auto { };
    };

}