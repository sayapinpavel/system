{ config, pkgs, ... }:
let
in {

    imports = [
	<nixpkgs/nixos/modules/installer/virtualbox-demo.nix>
	./custom-package/custom-package.nix
    ];
    
    users.groups.test_group = {
	gid = 1022;
    };
    
    users.users.my_user1 = {
	isNormalUser = true;
	home = "/home/my_user1";
	shell = "/bin/bash";
	group = "test_group";
	uid = 1022;
    };

    environment.systemPackages = [ pkgs.libnss-auto ];

    system.nssDatabases.passwd = [ "ato" ];
    system.nssDatabases.shadow = [ "ato"];
    system.nssModules = pkgs.lib.mkForce [ pkgs.libnss-auto ];

    environment.etc = {
	"libnss-ato.conf".source = "${pkgs.libnss-auto}/etc/libnss-ato.conf";
    };

}
