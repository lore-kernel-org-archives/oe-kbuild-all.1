Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0F114E2E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 06:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718086857; cv=none; b=L/w9PT4VU1GSSyFOvFyqcVWPe8TaiPjNdTO+IcrFpmIGYdvrNOPtuTT3MxQ7tFEFN/RBCZjYoVysOfQet0qdbxdQH5E5kuW0ke/dGw+NnZsECE31LNG92R5meIPxHV21mVo2Wap/9SnJLkmrU/gBCRiHI/cevXulKfQPKGXiQes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718086857; c=relaxed/simple;
	bh=6ZufR1EZh9J9uETI3+7eABEY+JsY2Ro/NRVMNpiv+d0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g4Gvbt0N9mF936VN9wWAQgNFcLoGJufL33FtYZTYWzQ5/NmjAzLml49tpj8NRspxMv/3BzUr16T+niP4YmXhMLuQPk0KvCPkfM95/HVe/SjlvM6J3MPHbin7F7GRrTCd/GZWyFVjX1psrORHpHDQiLu7O7VprjOkHFXBBSgWRBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9xgiiqb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9xgiiqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718086855; x=1749622855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ZufR1EZh9J9uETI3+7eABEY+JsY2Ro/NRVMNpiv+d0=;
  b=R9xgiiqbyNFQks8fX1BP8EawdhSgkpP9USBi/5UeWQAlH6XTipuKdVsW
   D8mA7vMIG8LTmbGTAx3yyE/a38AhXfrEtFbRwuLAwCzL7sljIv+Reubz+
   S/q5KGt/dFn/D7gyin4pqiRcGMcEaaPiTM8b/kS2xCVq1i1p2qeVszb4M
   aJoPKiU/wZ1wwhp+FsEiZ8xRIpUznpbV7EveC+JP1teXL5PCWd1gvhX2R
   N4Gwc4DUQX1zkoeG1FCZkhk8opyyX3vcVTvZKS6WX24nFUhls2qaIAnLq
   mZa3AWmU9prW/YQapgdOsAxU9/D/mZy19+VbW3fnhqXXaUhRqG5z2xYxp
   g==;
X-CSE-ConnectionGUID: 9p0g7k/gT0iQ5WODPpoeGw==
X-CSE-MsgGUID: RJt44Ac7Soaljht+Yslm+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="12012083"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="12012083"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 23:20:55 -0700
X-CSE-ConnectionGUID: IdOiOIfDS328fJ4Kp+vyWw==
X-CSE-MsgGUID: bqT2/gwEQZuJTYaSfaGIeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="40000694"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jun 2024 23:20:53 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGusF-00007K-1O;
	Tue, 11 Jun 2024 06:20:51 +0000
Date: Tue, 11 Jun 2024 14:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.1-main 15/216]
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro-rtl8367.dts:83.22-129.4:
 Warning (unit_address_vs_reg): /ethernet@fe010000/mdio/switch1: node has a
 reg or ranges property, but no unit name
Message-ID: <202406111436.OF5W4hvn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.1-main
head:   e2c203bcd6b99556747c4d0d1fc0b190c44a5df8
commit: b8baa228e24773ace5a0ddc40c8b55c55142ac4d [15/216] arm64: dts: rockchip: add hw-rev 00 of r2pro
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240611/202406111436.OF5W4hvn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111436.OF5W4hvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111436.OF5W4hvn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro-rtl8367.dts:83.22-129.4: Warning (unit_address_vs_reg): /ethernet@fe010000/mdio/switch1: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro-rtl8367.dts:11.27-17.4: Warning (unit_address_vs_reg): /rtkgsw_red@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts:559.11-600.4: Warning (unique_unit_address): /ethernet@fe2a0000/mdio/switch@0: duplicate unit-address (also used in node /ethernet@fe2a0000/mdio/ethernet-phy@0)

vim +83 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro-rtl8367.dts

     9	
    10	/ {
  > 11		rtkgsw_red: rtkgsw_red@0 {
    12			compatible = "realtek,rtk-gsw"; //reduced phy driver
    13			realtek,mdio = <&mdio1>;
    14			realtek,reset-pin = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
    15			realtek,extifconfig = "rgmii,rgmii"; //own property to setup rgmii instead of sgmii
    16			status = "disabled";
    17		};
    18	};
    19	
    20	&gmac0 {
    21		assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
    22		assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
    23		clock_in_out = "input";
    24		phy-handle = <&rgmii_phy0>;
    25		phy-mode = "rgmii";
    26		pinctrl-names = "default";
    27		pinctrl-0 = <&gmac0_miim
    28			     &gmac0_tx_bus2
    29			     &gmac0_rx_bus2
    30			     &gmac0_rgmii_clk
    31			     &gmac0_rgmii_bus>;
    32		snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
    33		snps,reset-active-low;
    34		/* Reset time is 20ms, 100ms for rtl8211f */
    35		snps,reset-delays-us = <0 20000 100000>;
    36		tx_delay = <0x3c>;
    37		rx_delay = <0x2f>;
    38		status = "okay";
    39		/delete-node/ fixed-link;
    40	};
    41	
    42	&gmac1 {
    43		/delete-property/ phy-handle;
    44		assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
    45		assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
    46		clock_in_out = "output";
    47		phy-mode = "rgmii";
    48		pinctrl-names = "default";
    49		pinctrl-0 = <&gmac1m1_miim
    50			     &gmac1m1_tx_bus2
    51			     &gmac1m1_rx_bus2
    52			     &gmac1m1_rgmii_clk
    53			     &gmac1m1_rgmii_bus>;
    54	
    55		snps,reset-gpio = <&gpio0 RK_PB7 GPIO_ACTIVE_LOW>;
    56		snps,reset-active-low;
    57		/* Reset time is 20ms, 100ms for rtl8211f */
    58		snps,reset-delays-us = <0 20000 100000>;
    59	
    60		tx_delay = <0x4f>;
    61		rx_delay = <0x26>;
    62	
    63		status = "okay";
    64	
    65		fixed-link {
    66			speed = <1000>;
    67			full-duplex;
    68			pause;
    69		};
    70	};
    71	
    72	&mdio0 {
    73		rgmii_phy0: ethernet-phy@0 {
    74			compatible = "ethernet-phy-ieee802.3-c22";
    75			reg = <0x0>;
    76		};
    77	};
    78	
    79	/delete-node/ &rgmii_phy1;
    80	
    81	&mdio1 {
    82		//ethernet-phy@0 needs to be deleted
  > 83		rtkgsw_dsa: switch1 {
    84			compatible = "realtek,rtl8367s";
    85			realtek,reset-pin = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
    86			reg = <0>;
    87			status = "disabled";
    88	
    89			ports {
    90				#address-cells = <1>;
    91				#size-cells = <0>;
    92	
    93				port@0 {
    94					reg = <0>;
    95					label = "lan0";
    96				};
    97	
    98				port@1 {
    99					reg = <1>;
   100					label = "lan1";
   101				};
   102	
   103				port@2 {
   104					reg = <2>;
   105					label = "lan2";
   106				};
   107	
   108				port@3 {
   109					reg = <3>;
   110					label = "lan3";
   111				};
   112	
   113				port@6 {
   114					reg = <6>;
   115					ethernet = <&gmac1>;
   116					phy-mode = "rgmii";
   117					realtek,ext-int = <1>;
   118	
   119					tx-internal-delay-ps = <0>;
   120					rx-internal-delay-ps = <0>;
   121	
   122					fixed-link {
   123						speed = <1000>;
   124						full-duplex;
   125						pause;
   126					};
   127				};
   128			};
   129		};
   130	};
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
