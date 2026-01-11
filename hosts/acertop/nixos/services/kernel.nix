{pkgs,...}: {
    boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.kernel.sysctl."net.ipv4.tcp_congestion_control" = "bbr";
    boot.kernel.sysctl."net.core.default_qdisc" = "fq"; 
    	
}

