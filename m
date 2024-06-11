Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF61A17BB3C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 11:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106864; cv=none; b=e4epV8xcIte3jTBe5/HRJ9XYncE+AyNexAXfzjLE4DyJmHaBKBdVrzFd3JVXVnyF8eYkE5OJ1BhCB0yXR4rRix9gQRkCvfvqXkM7oipyKQIqfLsWS/KT1VJOcmYnWxIDA3n+BVlSREcSwnZ2CXQvfyTFstoF9y6W9Vjnf7IiofM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106864; c=relaxed/simple;
	bh=wDJRS0l3aFbVw1GQyGma1BahGrD8tMzjc2tycbHicok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYerB8tSkwM3MfBS44yjvnEHzsfMBxaJVRE6tsMIgqL26wDb1MY5kspPIiH7enaRWSz7YhN9d9vZOMuOn5d0zozldlblIQQMX3xHN9wUxViMamU9cfAkjTMEYbNMqhXFkHZkl5mLbdNX0r7coAtZZV+QCJ+iY6MBu4sN0jdvVWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdZQtn6M; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdZQtn6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718106862; x=1749642862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wDJRS0l3aFbVw1GQyGma1BahGrD8tMzjc2tycbHicok=;
  b=JdZQtn6Md4z49wRHko4n9SziFeGsh1AF92fkFZ1XPl69rT3SRs5KvgU7
   vG0Z8k8zNj6ThIAzlhSr2G8YDf1+IbspD5e7iepIO7Oy4/c9FLkmL5BoW
   PHF3dZeEf8/bnbmubaJV9Rfy7mP1Nki8PAKR6TbmJEZMKWd3vG6fEB5U3
   9KHzeW9p4LEWS45A5YsLxzyQdswipk7aCyst5m1+hrwtzEYbz//hfDr8l
   6biQ9gohKaRZZvodS4rnrLVJ8mD5wJaIjuCDOp37QTN/zi7HcIeQEf+1c
   rS/EOOmg7QJKDRjZGhIkvZ1EgjtzM87DrxfANcB/wJTiXZUJPbYwzRk3+
   g==;
X-CSE-ConnectionGUID: I2jtPPBKQkGrfLo6K3C1yQ==
X-CSE-MsgGUID: tgW6e8FaTzeZ5P1tgIuBOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14981350"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="14981350"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 04:54:20 -0700
X-CSE-ConnectionGUID: mNRbvHuNQ1+5JN2w0kI2Iw==
X-CSE-MsgGUID: CodJclhLR3SFLnEuBuQPxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="43847788"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2024 04:54:18 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH04u-0000Ns-1h;
	Tue, 11 Jun 2024 11:54:16 +0000
Date: Tue, 11 Jun 2024 19:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.1-main 15/216]
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro-rtl8367.dts:83.22-129.4:
 Warning (unit_address_vs_reg): /ethernet@fe010000/mdio/switch1: node has a
 reg or ranges property, but no unit name
Message-ID: <202406111950.fWb0VVmY-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240611/202406111950.fWb0VVmY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111950.fWb0VVmY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111950.fWb0VVmY-lkp@intel.com/

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
