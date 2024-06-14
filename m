Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE48146006
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 16:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718380996; cv=none; b=hidolPloclhkeg5lq8oEmkDGnmnSEiB4o04KX2jz2Fb++7JwgOq1Zun/l2NBjylqaO9qnCcEaf1CeC+hWKadJWj6muZqPtWqYU9VCGm8yvYf7+4mTq7eJHSKmjsEvottU6GJWTTQdI7rcnFBrC4At5ooufEUfGiZyjJNVse9lAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718380996; c=relaxed/simple;
	bh=h/oRf8oOL/HLrWw3QxY4QtRs8/nmFFRndZdVnZBOTfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L4FsW6mrT2PGs3iSUp+uAIKpydXZor6Uo8Fj+n1TQ+kiId/OcM/U2ZGz1Hb+3+zNeJhlXbKAuigXrQjZYlMrDZ2UrGw1cqd4vSfKzwgVDoG3tSwODRhD4MupKX+jH4n4MBsetxeQ4eEBLIwuiw5FU76+ju81RqMOLbf3kY4eFJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtNz2/fR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtNz2/fR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718380990; x=1749916990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h/oRf8oOL/HLrWw3QxY4QtRs8/nmFFRndZdVnZBOTfk=;
  b=CtNz2/fRRUxOJL8S/FkFif1VKRa0z/ReaXQTXO3nwnCI5OGRheZxQTwy
   kkB5IauruqW9lZ4teyr0rJunRr54NLcfHVmBe5Z/YJjDEoVkyDT8tItz4
   AW33mZdUEYyft/EcYiR7xL1isZSKLMRG9XukrNBw1NNGZRc9PQ7OWQlCs
   cgptMgcBpDvLPJwv/xXQ/mToGAi3SbWygDsXhFvc/qjFXQMgT8VEjCe26
   uR+qv4gcqG9XL1X09UCFzdrOffnWTXWrljIhZFldyB+2gvz7GgzvU+dTc
   E9EkoDz70XLpB55qpqj+JqDjJC5fZFzLY0ih9s/P3tZA+KqiqAoZRHvfY
   g==;
X-CSE-ConnectionGUID: 6TGipycUSDyLGnlv+0kv0A==
X-CSE-MsgGUID: Nqk3RmcXRhG79poboUpBUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25851487"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="25851487"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 09:03:09 -0700
X-CSE-ConnectionGUID: XgVjgKClQBiR6VHOeTOExQ==
X-CSE-MsgGUID: 9mJDskO+TxGGevHuqTwc3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="40504814"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jun 2024 09:03:07 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI9OK-0001TT-32;
	Fri, 14 Jun 2024 16:03:04 +0000
Date: Sat, 15 Jun 2024 00:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 68/91]
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2253.20-2261.6: Warning
 (avoid_unnecessary_addr_size): /soc/bus@ffd00000/i2c@1c000: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202406142308.GJ1iaVkQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   a50c6922e2b4c1d7c895bde521d13096ba16a863
commit: 6a8f4ac08c8803dc9f02bb2a3c66b2cad57055c2 [68/91] arm64/dts: meson: Add minimal support for Hardkernel ODROID-N2L
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240614/202406142308.GJ1iaVkQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406142308.GJ1iaVkQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406142308.GJ1iaVkQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1731.28-2012.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2253.20-2261.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/i2c@1c000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +2253 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi

1499218c80c99a Neil Armstrong      2019-07-29    14  
1499218c80c99a Neil Armstrong      2019-07-29    15  / {
1499218c80c99a Neil Armstrong      2019-07-29    16  	interrupt-parent = <&gic>;
1499218c80c99a Neil Armstrong      2019-07-29    17  	#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29    18  	#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29    19  
ab547c4fb39fe1 Alexander Stein     2021-02-03    20  	aliases {
ab547c4fb39fe1 Alexander Stein     2021-02-03    21  		mmc0 = &sd_emmc_b; /* SD card */
ab547c4fb39fe1 Alexander Stein     2021-02-03    22  		mmc1 = &sd_emmc_c; /* eMMC */
ab547c4fb39fe1 Alexander Stein     2021-02-03    23  		mmc2 = &sd_emmc_a; /* SDIO */
ab547c4fb39fe1 Alexander Stein     2021-02-03    24  	};
ab547c4fb39fe1 Alexander Stein     2021-02-03    25  
15767cfd81eb9f Neil Armstrong      2019-10-03    26  	chosen {
15767cfd81eb9f Neil Armstrong      2019-10-03    27  		#address-cells = <2>;
15767cfd81eb9f Neil Armstrong      2019-10-03    28  		#size-cells = <2>;
15767cfd81eb9f Neil Armstrong      2019-10-03    29  		ranges;
15767cfd81eb9f Neil Armstrong      2019-10-03    30  
15767cfd81eb9f Neil Armstrong      2019-10-03    31  		simplefb_cvbs: framebuffer-cvbs {
15767cfd81eb9f Neil Armstrong      2019-10-03    32  			compatible = "amlogic,simple-framebuffer",
15767cfd81eb9f Neil Armstrong      2019-10-03    33  				     "simple-framebuffer";
15767cfd81eb9f Neil Armstrong      2019-10-03    34  			amlogic,pipeline = "vpu-cvbs";
15767cfd81eb9f Neil Armstrong      2019-10-03    35  			clocks = <&clkc CLKID_HDMI>,
15767cfd81eb9f Neil Armstrong      2019-10-03    36  				 <&clkc CLKID_HTX_PCLK>,
15767cfd81eb9f Neil Armstrong      2019-10-03    37  				 <&clkc CLKID_VPU_INTR>;
15767cfd81eb9f Neil Armstrong      2019-10-03    38  			status = "disabled";
15767cfd81eb9f Neil Armstrong      2019-10-03    39  		};
15767cfd81eb9f Neil Armstrong      2019-10-03    40  
15767cfd81eb9f Neil Armstrong      2019-10-03    41  		simplefb_hdmi: framebuffer-hdmi {
15767cfd81eb9f Neil Armstrong      2019-10-03    42  			compatible = "amlogic,simple-framebuffer",
15767cfd81eb9f Neil Armstrong      2019-10-03    43  				    "simple-framebuffer";
15767cfd81eb9f Neil Armstrong      2019-10-03    44  			amlogic,pipeline = "vpu-hdmi";
15767cfd81eb9f Neil Armstrong      2019-10-03    45  			clocks = <&clkc CLKID_HDMI>,
15767cfd81eb9f Neil Armstrong      2019-10-03    46  				 <&clkc CLKID_HTX_PCLK>,
15767cfd81eb9f Neil Armstrong      2019-10-03    47  				 <&clkc CLKID_VPU_INTR>;
15767cfd81eb9f Neil Armstrong      2019-10-03    48  			status = "disabled";
15767cfd81eb9f Neil Armstrong      2019-10-03    49  		};
15767cfd81eb9f Neil Armstrong      2019-10-03    50  	};
15767cfd81eb9f Neil Armstrong      2019-10-03    51  
1499218c80c99a Neil Armstrong      2019-07-29    52  	efuse: efuse {
1499218c80c99a Neil Armstrong      2019-07-29    53  		compatible = "amlogic,meson-gxbb-efuse";
1499218c80c99a Neil Armstrong      2019-07-29    54  		clocks = <&clkc CLKID_EFUSE>;
1499218c80c99a Neil Armstrong      2019-07-29    55  		#address-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29    56  		#size-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29    57  		read-only;
de82e74a9f2631 Carlo Caione        2019-07-31    58  		secure-monitor = <&sm>;
1499218c80c99a Neil Armstrong      2019-07-29    59  	};
1499218c80c99a Neil Armstrong      2019-07-29    60  
bb98a6fd0b0e22 Alexander Stein     2021-10-26    61  	gpu_opp_table: opp-table-gpu {
916a0edc43f03f Martin Blumenstingl 2020-07-19    62  		compatible = "operating-points-v2";
916a0edc43f03f Martin Blumenstingl 2020-07-19    63  
916a0edc43f03f Martin Blumenstingl 2020-07-19    64  		opp-124999998 {
916a0edc43f03f Martin Blumenstingl 2020-07-19    65  			opp-hz = /bits/ 64 <124999998>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    66  			opp-microvolt = <800000>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    67  		};
916a0edc43f03f Martin Blumenstingl 2020-07-19    68  		opp-249999996 {
916a0edc43f03f Martin Blumenstingl 2020-07-19    69  			opp-hz = /bits/ 64 <249999996>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    70  			opp-microvolt = <800000>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    71  		};
916a0edc43f03f Martin Blumenstingl 2020-07-19    72  		opp-285714281 {
916a0edc43f03f Martin Blumenstingl 2020-07-19    73  			opp-hz = /bits/ 64 <285714281>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    74  			opp-microvolt = <800000>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    75  		};
916a0edc43f03f Martin Blumenstingl 2020-07-19    76  		opp-399999994 {
916a0edc43f03f Martin Blumenstingl 2020-07-19    77  			opp-hz = /bits/ 64 <399999994>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    78  			opp-microvolt = <800000>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    79  		};
916a0edc43f03f Martin Blumenstingl 2020-07-19    80  		opp-499999992 {
916a0edc43f03f Martin Blumenstingl 2020-07-19    81  			opp-hz = /bits/ 64 <499999992>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    82  			opp-microvolt = <800000>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    83  		};
916a0edc43f03f Martin Blumenstingl 2020-07-19    84  		opp-666666656 {
916a0edc43f03f Martin Blumenstingl 2020-07-19    85  			opp-hz = /bits/ 64 <666666656>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    86  			opp-microvolt = <800000>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    87  		};
916a0edc43f03f Martin Blumenstingl 2020-07-19    88  		opp-799999987 {
916a0edc43f03f Martin Blumenstingl 2020-07-19    89  			opp-hz = /bits/ 64 <799999987>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    90  			opp-microvolt = <800000>;
916a0edc43f03f Martin Blumenstingl 2020-07-19    91  		};
916a0edc43f03f Martin Blumenstingl 2020-07-19    92  	};
916a0edc43f03f Martin Blumenstingl 2020-07-19    93  
1499218c80c99a Neil Armstrong      2019-07-29    94  	psci {
1499218c80c99a Neil Armstrong      2019-07-29    95  		compatible = "arm,psci-1.0";
1499218c80c99a Neil Armstrong      2019-07-29    96  		method = "smc";
1499218c80c99a Neil Armstrong      2019-07-29    97  	};
1499218c80c99a Neil Armstrong      2019-07-29    98  
1499218c80c99a Neil Armstrong      2019-07-29    99  	reserved-memory {
1499218c80c99a Neil Armstrong      2019-07-29   100  		#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   101  		#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   102  		ranges;
1499218c80c99a Neil Armstrong      2019-07-29   103  
1499218c80c99a Neil Armstrong      2019-07-29   104  		/* 3 MiB reserved for ARM Trusted Firmware (BL31) */
1499218c80c99a Neil Armstrong      2019-07-29   105  		secmon_reserved: secmon@5000000 {
1499218c80c99a Neil Armstrong      2019-07-29   106  			reg = <0x0 0x05000000 0x0 0x300000>;
1499218c80c99a Neil Armstrong      2019-07-29   107  			no-map;
1499218c80c99a Neil Armstrong      2019-07-29   108  		};
1499218c80c99a Neil Armstrong      2019-07-29   109  
08982a1b3aa261 Christian Hewitt    2022-01-26   110  		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
08982a1b3aa261 Christian Hewitt    2022-01-26   111  		secmon_reserved_bl32: secmon@5300000 {
08982a1b3aa261 Christian Hewitt    2022-01-26   112  			reg = <0x0 0x05300000 0x0 0x2000000>;
08982a1b3aa261 Christian Hewitt    2022-01-26   113  			no-map;
08982a1b3aa261 Christian Hewitt    2022-01-26   114  		};
08982a1b3aa261 Christian Hewitt    2022-01-26   115  
1499218c80c99a Neil Armstrong      2019-07-29   116  		linux,cma {
1499218c80c99a Neil Armstrong      2019-07-29   117  			compatible = "shared-dma-pool";
1499218c80c99a Neil Armstrong      2019-07-29   118  			reusable;
1499218c80c99a Neil Armstrong      2019-07-29   119  			size = <0x0 0x10000000>;
1499218c80c99a Neil Armstrong      2019-07-29   120  			alignment = <0x0 0x400000>;
1499218c80c99a Neil Armstrong      2019-07-29   121  			linux,cma-default;
1499218c80c99a Neil Armstrong      2019-07-29   122  		};
1499218c80c99a Neil Armstrong      2019-07-29   123  	};
1499218c80c99a Neil Armstrong      2019-07-29   124  
1499218c80c99a Neil Armstrong      2019-07-29   125  	sm: secure-monitor {
1499218c80c99a Neil Armstrong      2019-07-29   126  		compatible = "amlogic,meson-gxbb-sm";
1499218c80c99a Neil Armstrong      2019-07-29   127  	};
1499218c80c99a Neil Armstrong      2019-07-29   128  
1499218c80c99a Neil Armstrong      2019-07-29   129  	soc {
1499218c80c99a Neil Armstrong      2019-07-29   130  		compatible = "simple-bus";
1499218c80c99a Neil Armstrong      2019-07-29   131  		#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   132  		#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   133  		ranges;
1499218c80c99a Neil Armstrong      2019-07-29   134  
1f8607d597635c Neil Armstrong      2019-09-16   135  		pcie: pcie@fc000000 {
1f8607d597635c Neil Armstrong      2019-09-16   136  			compatible = "amlogic,g12a-pcie", "snps,dw-pcie";
d9421d6c52942b Kevin Hilman        2021-04-21   137  			reg = <0x0 0xfc000000 0x0 0x400000>,
d9421d6c52942b Kevin Hilman        2021-04-21   138  			      <0x0 0xff648000 0x0 0x2000>,
d9421d6c52942b Kevin Hilman        2021-04-21   139  			      <0x0 0xfc400000 0x0 0x200000>;
1f8607d597635c Neil Armstrong      2019-09-16   140  			reg-names = "elbi", "cfg", "config";
1f8607d597635c Neil Armstrong      2019-09-16   141  			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
1f8607d597635c Neil Armstrong      2019-09-16   142  			#interrupt-cells = <1>;
1f8607d597635c Neil Armstrong      2019-09-16   143  			interrupt-map-mask = <0 0 0 0>;
1f8607d597635c Neil Armstrong      2019-09-16   144  			interrupt-map = <0 0 0 0 &gic GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
1f8607d597635c Neil Armstrong      2019-09-16   145  			bus-range = <0x0 0xff>;
1f8607d597635c Neil Armstrong      2019-09-16   146  			#address-cells = <3>;
1f8607d597635c Neil Armstrong      2019-09-16   147  			#size-cells = <2>;
1f8607d597635c Neil Armstrong      2019-09-16   148  			device_type = "pci";
d9421d6c52942b Kevin Hilman        2021-04-21   149  			ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000>,
d9421d6c52942b Kevin Hilman        2021-04-21   150  				 <0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
1f8607d597635c Neil Armstrong      2019-09-16   151  
1f8607d597635c Neil Armstrong      2019-09-16   152  			clocks = <&clkc CLKID_PCIE_PHY
1f8607d597635c Neil Armstrong      2019-09-16   153  				  &clkc CLKID_PCIE_COMB
1f8607d597635c Neil Armstrong      2019-09-16   154  				  &clkc CLKID_PCIE_PLL>;
1f8607d597635c Neil Armstrong      2019-09-16   155  			clock-names = "general",
1f8607d597635c Neil Armstrong      2019-09-16   156  				      "pclk",
1f8607d597635c Neil Armstrong      2019-09-16   157  				      "port";
1f8607d597635c Neil Armstrong      2019-09-16   158  			resets = <&reset RESET_PCIE_CTRL_A>,
1f8607d597635c Neil Armstrong      2019-09-16   159  				 <&reset RESET_PCIE_APB>;
1f8607d597635c Neil Armstrong      2019-09-16   160  			reset-names = "port",
1f8607d597635c Neil Armstrong      2019-09-16   161  				      "apb";
1f8607d597635c Neil Armstrong      2019-09-16   162  			num-lanes = <1>;
1f8607d597635c Neil Armstrong      2019-09-16   163  			phys = <&usb3_pcie_phy PHY_TYPE_PCIE>;
1f8607d597635c Neil Armstrong      2019-09-16   164  			phy-names = "pcie";
1f8607d597635c Neil Armstrong      2019-09-16   165  			status = "disabled";
1f8607d597635c Neil Armstrong      2019-09-16   166  		};
1f8607d597635c Neil Armstrong      2019-09-16   167  
1499218c80c99a Neil Armstrong      2019-07-29   168  		ethmac: ethernet@ff3f0000 {
1fdc97ae450ede Martin Blumenstingl 2020-09-25   169  			compatible = "amlogic,meson-g12a-dwmac",
1499218c80c99a Neil Armstrong      2019-07-29   170  				     "snps,dwmac-3.70a",
1499218c80c99a Neil Armstrong      2019-07-29   171  				     "snps,dwmac";
3ad6c9e3575611 Neil Armstrong      2019-08-23   172  			reg = <0x0 0xff3f0000 0x0 0x10000>,
3ad6c9e3575611 Neil Armstrong      2019-08-23   173  			      <0x0 0xff634540 0x0 0x8>;
1499218c80c99a Neil Armstrong      2019-07-29   174  			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
1499218c80c99a Neil Armstrong      2019-07-29   175  			interrupt-names = "macirq";
1499218c80c99a Neil Armstrong      2019-07-29   176  			clocks = <&clkc CLKID_ETH>,
1499218c80c99a Neil Armstrong      2019-07-29   177  				 <&clkc CLKID_FCLK_DIV2>,
32b5f4b63487a2 Martin Blumenstingl 2020-06-20   178  				 <&clkc CLKID_MPLL2>,
32b5f4b63487a2 Martin Blumenstingl 2020-06-20   179  				 <&clkc CLKID_FCLK_DIV2>;
32b5f4b63487a2 Martin Blumenstingl 2020-06-20   180  			clock-names = "stmmaceth", "clkin0", "clkin1",
32b5f4b63487a2 Martin Blumenstingl 2020-06-20   181  				      "timing-adjustment";
ef68984eab6bbe Jerome Brunet       2019-07-18   182  			rx-fifo-depth = <4096>;
ef68984eab6bbe Jerome Brunet       2019-07-18   183  			tx-fifo-depth = <2048>;
1499218c80c99a Neil Armstrong      2019-07-29   184  			status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29   185  
1499218c80c99a Neil Armstrong      2019-07-29   186  			mdio0: mdio {
1499218c80c99a Neil Armstrong      2019-07-29   187  				#address-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29   188  				#size-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29   189  				compatible = "snps,dwmac-mdio";
1499218c80c99a Neil Armstrong      2019-07-29   190  			};
1499218c80c99a Neil Armstrong      2019-07-29   191  		};
1499218c80c99a Neil Armstrong      2019-07-29   192  
1499218c80c99a Neil Armstrong      2019-07-29   193  		apb: bus@ff600000 {
1499218c80c99a Neil Armstrong      2019-07-29   194  			compatible = "simple-bus";
1499218c80c99a Neil Armstrong      2019-07-29   195  			reg = <0x0 0xff600000 0x0 0x200000>;
1499218c80c99a Neil Armstrong      2019-07-29   196  			#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   197  			#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   198  			ranges = <0x0 0x0 0x0 0xff600000 0x0 0x200000>;
1499218c80c99a Neil Armstrong      2019-07-29   199  
1499218c80c99a Neil Armstrong      2019-07-29   200  			hdmi_tx: hdmi-tx@0 {
1499218c80c99a Neil Armstrong      2019-07-29   201  				compatible = "amlogic,meson-g12a-dw-hdmi";
1499218c80c99a Neil Armstrong      2019-07-29   202  				reg = <0x0 0x0 0x0 0x10000>;
1499218c80c99a Neil Armstrong      2019-07-29   203  				interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29   204  				resets = <&reset RESET_HDMITX_CAPB3>,
1499218c80c99a Neil Armstrong      2019-07-29   205  					 <&reset RESET_HDMITX_PHY>,
1499218c80c99a Neil Armstrong      2019-07-29   206  					 <&reset RESET_HDMITX>;
1499218c80c99a Neil Armstrong      2019-07-29   207  				reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
1499218c80c99a Neil Armstrong      2019-07-29   208  				clocks = <&clkc CLKID_HDMI>,
1499218c80c99a Neil Armstrong      2019-07-29   209  					 <&clkc CLKID_HTX_PCLK>,
1499218c80c99a Neil Armstrong      2019-07-29   210  					 <&clkc CLKID_VPU_INTR>;
1499218c80c99a Neil Armstrong      2019-07-29   211  				clock-names = "isfr", "iahb", "venci";
1499218c80c99a Neil Armstrong      2019-07-29   212  				#address-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29   213  				#size-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29   214  				#sound-dai-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29   215  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29   216  
1499218c80c99a Neil Armstrong      2019-07-29   217  				/* VPU VENC Input */
1499218c80c99a Neil Armstrong      2019-07-29   218  				hdmi_tx_venc_port: port@0 {
1499218c80c99a Neil Armstrong      2019-07-29   219  					reg = <0>;
1499218c80c99a Neil Armstrong      2019-07-29   220  
1499218c80c99a Neil Armstrong      2019-07-29   221  					hdmi_tx_in: endpoint {
1499218c80c99a Neil Armstrong      2019-07-29   222  						remote-endpoint = <&hdmi_tx_out>;
1499218c80c99a Neil Armstrong      2019-07-29   223  					};
1499218c80c99a Neil Armstrong      2019-07-29   224  				};
1499218c80c99a Neil Armstrong      2019-07-29   225  
1499218c80c99a Neil Armstrong      2019-07-29   226  				/* TMDS Output */
1499218c80c99a Neil Armstrong      2019-07-29   227  				hdmi_tx_tmds_port: port@1 {
1499218c80c99a Neil Armstrong      2019-07-29   228  					reg = <1>;
1499218c80c99a Neil Armstrong      2019-07-29   229  				};
1499218c80c99a Neil Armstrong      2019-07-29   230  			};
1499218c80c99a Neil Armstrong      2019-07-29   231  
1499218c80c99a Neil Armstrong      2019-07-29   232  			apb_efuse: bus@30000 {
1499218c80c99a Neil Armstrong      2019-07-29   233  				compatible = "simple-bus";
1499218c80c99a Neil Armstrong      2019-07-29   234  				reg = <0x0 0x30000 0x0 0x2000>;
1499218c80c99a Neil Armstrong      2019-07-29   235  				#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   236  				#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   237  				ranges = <0x0 0x0 0x0 0x30000 0x0 0x2000>;
1499218c80c99a Neil Armstrong      2019-07-29   238  
1499218c80c99a Neil Armstrong      2019-07-29   239  				hwrng: rng@218 {
1499218c80c99a Neil Armstrong      2019-07-29   240  					compatible = "amlogic,meson-rng";
1499218c80c99a Neil Armstrong      2019-07-29   241  					reg = <0x0 0x218 0x0 0x4>;
a1afbbb0285797 Scott K Logan       2020-09-25   242  					clocks = <&clkc CLKID_RNG0>;
a1afbbb0285797 Scott K Logan       2020-09-25   243  					clock-names = "core";
1499218c80c99a Neil Armstrong      2019-07-29   244  				};
1499218c80c99a Neil Armstrong      2019-07-29   245  			};
1499218c80c99a Neil Armstrong      2019-07-29   246  
457fa78771a23e Jerome Brunet       2020-05-07   247  			acodec: audio-controller@32000 {
457fa78771a23e Jerome Brunet       2020-05-07   248  				compatible = "amlogic,t9015";
457fa78771a23e Jerome Brunet       2020-05-07   249  				reg = <0x0 0x32000 0x0 0x14>;
457fa78771a23e Jerome Brunet       2020-05-07   250  				#sound-dai-cells = <0>;
457fa78771a23e Jerome Brunet       2020-05-07   251  				sound-name-prefix = "ACODEC";
457fa78771a23e Jerome Brunet       2020-05-07   252  				clocks = <&clkc CLKID_AUDIO_CODEC>;
457fa78771a23e Jerome Brunet       2020-05-07   253  				clock-names = "pclk";
457fa78771a23e Jerome Brunet       2020-05-07   254  				resets = <&reset RESET_AUDIO_CODEC>;
457fa78771a23e Jerome Brunet       2020-05-07   255  				status = "disabled";
457fa78771a23e Jerome Brunet       2020-05-07   256  			};
457fa78771a23e Jerome Brunet       2020-05-07   257  
1499218c80c99a Neil Armstrong      2019-07-29   258  			periphs: bus@34400 {
1499218c80c99a Neil Armstrong      2019-07-29   259  				compatible = "simple-bus";
1499218c80c99a Neil Armstrong      2019-07-29   260  				reg = <0x0 0x34400 0x0 0x400>;
1499218c80c99a Neil Armstrong      2019-07-29   261  				#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   262  				#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   263  				ranges = <0x0 0x0 0x0 0x34400 0x0 0x400>;
1499218c80c99a Neil Armstrong      2019-07-29   264  
1499218c80c99a Neil Armstrong      2019-07-29   265  				periphs_pinctrl: pinctrl@40 {
1499218c80c99a Neil Armstrong      2019-07-29   266  					compatible = "amlogic,meson-g12a-periphs-pinctrl";
1499218c80c99a Neil Armstrong      2019-07-29   267  					#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   268  					#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   269  					ranges;
1499218c80c99a Neil Armstrong      2019-07-29   270  
1499218c80c99a Neil Armstrong      2019-07-29   271  					gpio: bank@40 {
1499218c80c99a Neil Armstrong      2019-07-29   272  						reg = <0x0 0x40  0x0 0x4c>,
1499218c80c99a Neil Armstrong      2019-07-29   273  						      <0x0 0xe8  0x0 0x18>,
1499218c80c99a Neil Armstrong      2019-07-29   274  						      <0x0 0x120 0x0 0x18>,
1499218c80c99a Neil Armstrong      2019-07-29   275  						      <0x0 0x2c0 0x0 0x40>,
1499218c80c99a Neil Armstrong      2019-07-29   276  						      <0x0 0x340 0x0 0x1c>;
1499218c80c99a Neil Armstrong      2019-07-29   277  						reg-names = "gpio",
1499218c80c99a Neil Armstrong      2019-07-29   278  							    "pull",
1499218c80c99a Neil Armstrong      2019-07-29   279  							    "pull-enable",
1499218c80c99a Neil Armstrong      2019-07-29   280  							    "mux",
1499218c80c99a Neil Armstrong      2019-07-29   281  							    "ds";
1499218c80c99a Neil Armstrong      2019-07-29   282  						gpio-controller;
1499218c80c99a Neil Armstrong      2019-07-29   283  						#gpio-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29   284  						gpio-ranges = <&periphs_pinctrl 0 0 86>;
1499218c80c99a Neil Armstrong      2019-07-29   285  					};
1499218c80c99a Neil Armstrong      2019-07-29   286  
1499218c80c99a Neil Armstrong      2019-07-29   287  					cec_ao_a_h_pins: cec_ao_a_h {
1499218c80c99a Neil Armstrong      2019-07-29   288  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   289  							groups = "cec_ao_a_h";
1499218c80c99a Neil Armstrong      2019-07-29   290  							function = "cec_ao_a_h";
1499218c80c99a Neil Armstrong      2019-07-29   291  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   292  						};
1499218c80c99a Neil Armstrong      2019-07-29   293  					};
1499218c80c99a Neil Armstrong      2019-07-29   294  
1499218c80c99a Neil Armstrong      2019-07-29   295  					cec_ao_b_h_pins: cec_ao_b_h {
1499218c80c99a Neil Armstrong      2019-07-29   296  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   297  							groups = "cec_ao_b_h";
1499218c80c99a Neil Armstrong      2019-07-29   298  							function = "cec_ao_b_h";
1499218c80c99a Neil Armstrong      2019-07-29   299  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   300  						};
1499218c80c99a Neil Armstrong      2019-07-29   301  					};
1499218c80c99a Neil Armstrong      2019-07-29   302  
4d2cb376e5ccac Neil Armstrong      2020-03-13   303  					emmc_ctrl_pins: emmc-ctrl {
1499218c80c99a Neil Armstrong      2019-07-29   304  						mux-0 {
4d2cb376e5ccac Neil Armstrong      2020-03-13   305  							groups = "emmc_cmd";
1499218c80c99a Neil Armstrong      2019-07-29   306  							function = "emmc";
1499218c80c99a Neil Armstrong      2019-07-29   307  							bias-pull-up;
1499218c80c99a Neil Armstrong      2019-07-29   308  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   309  						};
1499218c80c99a Neil Armstrong      2019-07-29   310  
1499218c80c99a Neil Armstrong      2019-07-29   311  						mux-1 {
1499218c80c99a Neil Armstrong      2019-07-29   312  							groups = "emmc_clk";
1499218c80c99a Neil Armstrong      2019-07-29   313  							function = "emmc";
1499218c80c99a Neil Armstrong      2019-07-29   314  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   315  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   316  						};
1499218c80c99a Neil Armstrong      2019-07-29   317  					};
1499218c80c99a Neil Armstrong      2019-07-29   318  
4d2cb376e5ccac Neil Armstrong      2020-03-13   319  					emmc_data_4b_pins: emmc-data-4b {
4d2cb376e5ccac Neil Armstrong      2020-03-13   320  						mux-0 {
4d2cb376e5ccac Neil Armstrong      2020-03-13   321  							groups = "emmc_nand_d0",
4d2cb376e5ccac Neil Armstrong      2020-03-13   322  								 "emmc_nand_d1",
4d2cb376e5ccac Neil Armstrong      2020-03-13   323  								 "emmc_nand_d2",
4d2cb376e5ccac Neil Armstrong      2020-03-13   324  								 "emmc_nand_d3";
4d2cb376e5ccac Neil Armstrong      2020-03-13   325  							function = "emmc";
4d2cb376e5ccac Neil Armstrong      2020-03-13   326  							bias-pull-up;
4d2cb376e5ccac Neil Armstrong      2020-03-13   327  							drive-strength-microamp = <4000>;
4d2cb376e5ccac Neil Armstrong      2020-03-13   328  						};
4d2cb376e5ccac Neil Armstrong      2020-03-13   329  					};
4d2cb376e5ccac Neil Armstrong      2020-03-13   330  
4d2cb376e5ccac Neil Armstrong      2020-03-13   331  					emmc_data_8b_pins: emmc-data-8b {
4d2cb376e5ccac Neil Armstrong      2020-03-13   332  						mux-0 {
4d2cb376e5ccac Neil Armstrong      2020-03-13   333  							groups = "emmc_nand_d0",
4d2cb376e5ccac Neil Armstrong      2020-03-13   334  								 "emmc_nand_d1",
4d2cb376e5ccac Neil Armstrong      2020-03-13   335  								 "emmc_nand_d2",
4d2cb376e5ccac Neil Armstrong      2020-03-13   336  								 "emmc_nand_d3",
4d2cb376e5ccac Neil Armstrong      2020-03-13   337  								 "emmc_nand_d4",
4d2cb376e5ccac Neil Armstrong      2020-03-13   338  								 "emmc_nand_d5",
4d2cb376e5ccac Neil Armstrong      2020-03-13   339  								 "emmc_nand_d6",
4d2cb376e5ccac Neil Armstrong      2020-03-13   340  								 "emmc_nand_d7";
4d2cb376e5ccac Neil Armstrong      2020-03-13   341  							function = "emmc";
4d2cb376e5ccac Neil Armstrong      2020-03-13   342  							bias-pull-up;
4d2cb376e5ccac Neil Armstrong      2020-03-13   343  							drive-strength-microamp = <4000>;
4d2cb376e5ccac Neil Armstrong      2020-03-13   344  						};
4d2cb376e5ccac Neil Armstrong      2020-03-13   345  					};
4d2cb376e5ccac Neil Armstrong      2020-03-13   346  
1499218c80c99a Neil Armstrong      2019-07-29   347  					emmc_ds_pins: emmc-ds {
1499218c80c99a Neil Armstrong      2019-07-29   348  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   349  							groups = "emmc_nand_ds";
1499218c80c99a Neil Armstrong      2019-07-29   350  							function = "emmc";
1499218c80c99a Neil Armstrong      2019-07-29   351  							bias-pull-down;
1499218c80c99a Neil Armstrong      2019-07-29   352  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   353  						};
1499218c80c99a Neil Armstrong      2019-07-29   354  					};
1499218c80c99a Neil Armstrong      2019-07-29   355  
1499218c80c99a Neil Armstrong      2019-07-29   356  					emmc_clk_gate_pins: emmc_clk_gate {
1499218c80c99a Neil Armstrong      2019-07-29   357  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   358  							groups = "BOOT_8";
1499218c80c99a Neil Armstrong      2019-07-29   359  							function = "gpio_periphs";
1499218c80c99a Neil Armstrong      2019-07-29   360  							bias-pull-down;
1499218c80c99a Neil Armstrong      2019-07-29   361  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   362  						};
1499218c80c99a Neil Armstrong      2019-07-29   363  					};
1499218c80c99a Neil Armstrong      2019-07-29   364  
1499218c80c99a Neil Armstrong      2019-07-29   365  					hdmitx_ddc_pins: hdmitx_ddc {
1499218c80c99a Neil Armstrong      2019-07-29   366  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   367  							groups = "hdmitx_sda",
1499218c80c99a Neil Armstrong      2019-07-29   368  								 "hdmitx_sck";
1499218c80c99a Neil Armstrong      2019-07-29   369  							function = "hdmitx";
1499218c80c99a Neil Armstrong      2019-07-29   370  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   371  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   372  						};
1499218c80c99a Neil Armstrong      2019-07-29   373  					};
1499218c80c99a Neil Armstrong      2019-07-29   374  
1499218c80c99a Neil Armstrong      2019-07-29   375  					hdmitx_hpd_pins: hdmitx_hpd {
1499218c80c99a Neil Armstrong      2019-07-29   376  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   377  							groups = "hdmitx_hpd_in";
1499218c80c99a Neil Armstrong      2019-07-29   378  							function = "hdmitx";
1499218c80c99a Neil Armstrong      2019-07-29   379  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   380  						};
1499218c80c99a Neil Armstrong      2019-07-29   381  					};
1499218c80c99a Neil Armstrong      2019-07-29   382  
1499218c80c99a Neil Armstrong      2019-07-29   383  
1499218c80c99a Neil Armstrong      2019-07-29   384  					i2c0_sda_c_pins: i2c0-sda-c {
1499218c80c99a Neil Armstrong      2019-07-29   385  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   386  							groups = "i2c0_sda_c";
1499218c80c99a Neil Armstrong      2019-07-29   387  							function = "i2c0";
1499218c80c99a Neil Armstrong      2019-07-29   388  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   389  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   390  
1499218c80c99a Neil Armstrong      2019-07-29   391  						};
1499218c80c99a Neil Armstrong      2019-07-29   392  					};
1499218c80c99a Neil Armstrong      2019-07-29   393  
1499218c80c99a Neil Armstrong      2019-07-29   394  					i2c0_sck_c_pins: i2c0-sck-c {
1499218c80c99a Neil Armstrong      2019-07-29   395  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   396  							groups = "i2c0_sck_c";
1499218c80c99a Neil Armstrong      2019-07-29   397  							function = "i2c0";
1499218c80c99a Neil Armstrong      2019-07-29   398  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   399  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   400  						};
1499218c80c99a Neil Armstrong      2019-07-29   401  					};
1499218c80c99a Neil Armstrong      2019-07-29   402  
1499218c80c99a Neil Armstrong      2019-07-29   403  					i2c0_sda_z0_pins: i2c0-sda-z0 {
1499218c80c99a Neil Armstrong      2019-07-29   404  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   405  							groups = "i2c0_sda_z0";
1499218c80c99a Neil Armstrong      2019-07-29   406  							function = "i2c0";
1499218c80c99a Neil Armstrong      2019-07-29   407  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   408  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   409  						};
1499218c80c99a Neil Armstrong      2019-07-29   410  					};
1499218c80c99a Neil Armstrong      2019-07-29   411  
1499218c80c99a Neil Armstrong      2019-07-29   412  					i2c0_sck_z1_pins: i2c0-sck-z1 {
1499218c80c99a Neil Armstrong      2019-07-29   413  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   414  							groups = "i2c0_sck_z1";
1499218c80c99a Neil Armstrong      2019-07-29   415  							function = "i2c0";
1499218c80c99a Neil Armstrong      2019-07-29   416  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   417  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   418  						};
1499218c80c99a Neil Armstrong      2019-07-29   419  					};
1499218c80c99a Neil Armstrong      2019-07-29   420  
1499218c80c99a Neil Armstrong      2019-07-29   421  					i2c0_sda_z7_pins: i2c0-sda-z7 {
1499218c80c99a Neil Armstrong      2019-07-29   422  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   423  							groups = "i2c0_sda_z7";
1499218c80c99a Neil Armstrong      2019-07-29   424  							function = "i2c0";
1499218c80c99a Neil Armstrong      2019-07-29   425  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   426  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   427  						};
1499218c80c99a Neil Armstrong      2019-07-29   428  					};
1499218c80c99a Neil Armstrong      2019-07-29   429  
1499218c80c99a Neil Armstrong      2019-07-29   430  					i2c0_sda_z8_pins: i2c0-sda-z8 {
1499218c80c99a Neil Armstrong      2019-07-29   431  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   432  							groups = "i2c0_sda_z8";
1499218c80c99a Neil Armstrong      2019-07-29   433  							function = "i2c0";
1499218c80c99a Neil Armstrong      2019-07-29   434  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   435  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   436  						};
1499218c80c99a Neil Armstrong      2019-07-29   437  					};
1499218c80c99a Neil Armstrong      2019-07-29   438  
1499218c80c99a Neil Armstrong      2019-07-29   439  					i2c1_sda_x_pins: i2c1-sda-x {
1499218c80c99a Neil Armstrong      2019-07-29   440  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   441  							groups = "i2c1_sda_x";
1499218c80c99a Neil Armstrong      2019-07-29   442  							function = "i2c1";
1499218c80c99a Neil Armstrong      2019-07-29   443  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   444  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   445  						};
1499218c80c99a Neil Armstrong      2019-07-29   446  					};
1499218c80c99a Neil Armstrong      2019-07-29   447  
1499218c80c99a Neil Armstrong      2019-07-29   448  					i2c1_sck_x_pins: i2c1-sck-x {
1499218c80c99a Neil Armstrong      2019-07-29   449  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   450  							groups = "i2c1_sck_x";
1499218c80c99a Neil Armstrong      2019-07-29   451  							function = "i2c1";
1499218c80c99a Neil Armstrong      2019-07-29   452  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   453  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   454  						};
1499218c80c99a Neil Armstrong      2019-07-29   455  					};
1499218c80c99a Neil Armstrong      2019-07-29   456  
1499218c80c99a Neil Armstrong      2019-07-29   457  					i2c1_sda_h2_pins: i2c1-sda-h2 {
1499218c80c99a Neil Armstrong      2019-07-29   458  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   459  							groups = "i2c1_sda_h2";
1499218c80c99a Neil Armstrong      2019-07-29   460  							function = "i2c1";
1499218c80c99a Neil Armstrong      2019-07-29   461  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   462  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   463  						};
1499218c80c99a Neil Armstrong      2019-07-29   464  					};
1499218c80c99a Neil Armstrong      2019-07-29   465  
1499218c80c99a Neil Armstrong      2019-07-29   466  					i2c1_sck_h3_pins: i2c1-sck-h3 {
1499218c80c99a Neil Armstrong      2019-07-29   467  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   468  							groups = "i2c1_sck_h3";
1499218c80c99a Neil Armstrong      2019-07-29   469  							function = "i2c1";
1499218c80c99a Neil Armstrong      2019-07-29   470  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   471  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   472  						};
1499218c80c99a Neil Armstrong      2019-07-29   473  					};
1499218c80c99a Neil Armstrong      2019-07-29   474  
1499218c80c99a Neil Armstrong      2019-07-29   475  					i2c1_sda_h6_pins: i2c1-sda-h6 {
1499218c80c99a Neil Armstrong      2019-07-29   476  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   477  							groups = "i2c1_sda_h6";
1499218c80c99a Neil Armstrong      2019-07-29   478  							function = "i2c1";
1499218c80c99a Neil Armstrong      2019-07-29   479  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   480  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   481  						};
1499218c80c99a Neil Armstrong      2019-07-29   482  					};
1499218c80c99a Neil Armstrong      2019-07-29   483  
1499218c80c99a Neil Armstrong      2019-07-29   484  					i2c1_sck_h7_pins: i2c1-sck-h7 {
1499218c80c99a Neil Armstrong      2019-07-29   485  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   486  							groups = "i2c1_sck_h7";
1499218c80c99a Neil Armstrong      2019-07-29   487  							function = "i2c1";
1499218c80c99a Neil Armstrong      2019-07-29   488  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   489  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   490  						};
1499218c80c99a Neil Armstrong      2019-07-29   491  					};
1499218c80c99a Neil Armstrong      2019-07-29   492  
1499218c80c99a Neil Armstrong      2019-07-29   493  					i2c2_sda_x_pins: i2c2-sda-x {
1499218c80c99a Neil Armstrong      2019-07-29   494  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   495  							groups = "i2c2_sda_x";
1499218c80c99a Neil Armstrong      2019-07-29   496  							function = "i2c2";
1499218c80c99a Neil Armstrong      2019-07-29   497  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   498  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   499  						};
1499218c80c99a Neil Armstrong      2019-07-29   500  					};
1499218c80c99a Neil Armstrong      2019-07-29   501  
1499218c80c99a Neil Armstrong      2019-07-29   502  					i2c2_sck_x_pins: i2c2-sck-x {
1499218c80c99a Neil Armstrong      2019-07-29   503  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   504  							groups = "i2c2_sck_x";
1499218c80c99a Neil Armstrong      2019-07-29   505  							function = "i2c2";
1499218c80c99a Neil Armstrong      2019-07-29   506  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   507  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   508  						};
1499218c80c99a Neil Armstrong      2019-07-29   509  					};
1499218c80c99a Neil Armstrong      2019-07-29   510  
1499218c80c99a Neil Armstrong      2019-07-29   511  					i2c2_sda_z_pins: i2c2-sda-z {
1499218c80c99a Neil Armstrong      2019-07-29   512  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   513  							groups = "i2c2_sda_z";
1499218c80c99a Neil Armstrong      2019-07-29   514  							function = "i2c2";
1499218c80c99a Neil Armstrong      2019-07-29   515  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   516  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   517  						};
1499218c80c99a Neil Armstrong      2019-07-29   518  					};
1499218c80c99a Neil Armstrong      2019-07-29   519  
1499218c80c99a Neil Armstrong      2019-07-29   520  					i2c2_sck_z_pins: i2c2-sck-z {
1499218c80c99a Neil Armstrong      2019-07-29   521  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   522  							groups = "i2c2_sck_z";
1499218c80c99a Neil Armstrong      2019-07-29   523  							function = "i2c2";
1499218c80c99a Neil Armstrong      2019-07-29   524  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   525  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   526  						};
1499218c80c99a Neil Armstrong      2019-07-29   527  					};
1499218c80c99a Neil Armstrong      2019-07-29   528  
1499218c80c99a Neil Armstrong      2019-07-29   529  					i2c3_sda_h_pins: i2c3-sda-h {
1499218c80c99a Neil Armstrong      2019-07-29   530  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   531  							groups = "i2c3_sda_h";
1499218c80c99a Neil Armstrong      2019-07-29   532  							function = "i2c3";
1499218c80c99a Neil Armstrong      2019-07-29   533  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   534  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   535  						};
1499218c80c99a Neil Armstrong      2019-07-29   536  					};
1499218c80c99a Neil Armstrong      2019-07-29   537  
1499218c80c99a Neil Armstrong      2019-07-29   538  					i2c3_sck_h_pins: i2c3-sck-h {
1499218c80c99a Neil Armstrong      2019-07-29   539  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   540  							groups = "i2c3_sck_h";
1499218c80c99a Neil Armstrong      2019-07-29   541  							function = "i2c3";
1499218c80c99a Neil Armstrong      2019-07-29   542  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   543  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   544  						};
1499218c80c99a Neil Armstrong      2019-07-29   545  					};
1499218c80c99a Neil Armstrong      2019-07-29   546  
1499218c80c99a Neil Armstrong      2019-07-29   547  					i2c3_sda_a_pins: i2c3-sda-a {
1499218c80c99a Neil Armstrong      2019-07-29   548  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   549  							groups = "i2c3_sda_a";
1499218c80c99a Neil Armstrong      2019-07-29   550  							function = "i2c3";
1499218c80c99a Neil Armstrong      2019-07-29   551  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   552  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   553  						};
1499218c80c99a Neil Armstrong      2019-07-29   554  					};
1499218c80c99a Neil Armstrong      2019-07-29   555  
1499218c80c99a Neil Armstrong      2019-07-29   556  					i2c3_sck_a_pins: i2c3-sck-a {
1499218c80c99a Neil Armstrong      2019-07-29   557  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   558  							groups = "i2c3_sck_a";
1499218c80c99a Neil Armstrong      2019-07-29   559  							function = "i2c3";
1499218c80c99a Neil Armstrong      2019-07-29   560  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   561  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   562  						};
1499218c80c99a Neil Armstrong      2019-07-29   563  					};
1499218c80c99a Neil Armstrong      2019-07-29   564  
1499218c80c99a Neil Armstrong      2019-07-29   565  					mclk0_a_pins: mclk0-a {
1499218c80c99a Neil Armstrong      2019-07-29   566  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   567  							groups = "mclk0_a";
1499218c80c99a Neil Armstrong      2019-07-29   568  							function = "mclk0";
1499218c80c99a Neil Armstrong      2019-07-29   569  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   570  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   571  						};
1499218c80c99a Neil Armstrong      2019-07-29   572  					};
1499218c80c99a Neil Armstrong      2019-07-29   573  
1499218c80c99a Neil Armstrong      2019-07-29   574  					mclk1_a_pins: mclk1-a {
1499218c80c99a Neil Armstrong      2019-07-29   575  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   576  							groups = "mclk1_a";
1499218c80c99a Neil Armstrong      2019-07-29   577  							function = "mclk1";
1499218c80c99a Neil Armstrong      2019-07-29   578  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   579  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   580  						};
1499218c80c99a Neil Armstrong      2019-07-29   581  					};
1499218c80c99a Neil Armstrong      2019-07-29   582  
1499218c80c99a Neil Armstrong      2019-07-29   583  					mclk1_x_pins: mclk1-x {
1499218c80c99a Neil Armstrong      2019-07-29   584  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   585  							groups = "mclk1_x";
1499218c80c99a Neil Armstrong      2019-07-29   586  							function = "mclk1";
1499218c80c99a Neil Armstrong      2019-07-29   587  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   588  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   589  						};
1499218c80c99a Neil Armstrong      2019-07-29   590  					};
1499218c80c99a Neil Armstrong      2019-07-29   591  
1499218c80c99a Neil Armstrong      2019-07-29   592  					mclk1_z_pins: mclk1-z {
1499218c80c99a Neil Armstrong      2019-07-29   593  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   594  							groups = "mclk1_z";
1499218c80c99a Neil Armstrong      2019-07-29   595  							function = "mclk1";
1499218c80c99a Neil Armstrong      2019-07-29   596  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   597  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29   598  						};
1499218c80c99a Neil Armstrong      2019-07-29   599  					};
1499218c80c99a Neil Armstrong      2019-07-29   600  
f12a463d2f43b9 Neil Armstrong      2020-03-13   601  					nor_pins: nor {
f12a463d2f43b9 Neil Armstrong      2020-03-13   602  						mux {
f12a463d2f43b9 Neil Armstrong      2020-03-13   603  							groups = "nor_d",
f12a463d2f43b9 Neil Armstrong      2020-03-13   604  							       "nor_q",
f12a463d2f43b9 Neil Armstrong      2020-03-13   605  							       "nor_c",
f12a463d2f43b9 Neil Armstrong      2020-03-13   606  							       "nor_cs";
f12a463d2f43b9 Neil Armstrong      2020-03-13   607  							function = "nor";
f12a463d2f43b9 Neil Armstrong      2020-03-13   608  							bias-disable;
f12a463d2f43b9 Neil Armstrong      2020-03-13   609  						};
f12a463d2f43b9 Neil Armstrong      2020-03-13   610  					};
f12a463d2f43b9 Neil Armstrong      2020-03-13   611  
1499218c80c99a Neil Armstrong      2019-07-29   612  					pdm_din0_a_pins: pdm-din0-a {
1499218c80c99a Neil Armstrong      2019-07-29   613  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   614  							groups = "pdm_din0_a";
1499218c80c99a Neil Armstrong      2019-07-29   615  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   616  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   617  						};
1499218c80c99a Neil Armstrong      2019-07-29   618  					};
1499218c80c99a Neil Armstrong      2019-07-29   619  
1499218c80c99a Neil Armstrong      2019-07-29   620  					pdm_din0_c_pins: pdm-din0-c {
1499218c80c99a Neil Armstrong      2019-07-29   621  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   622  							groups = "pdm_din0_c";
1499218c80c99a Neil Armstrong      2019-07-29   623  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   624  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   625  						};
1499218c80c99a Neil Armstrong      2019-07-29   626  					};
1499218c80c99a Neil Armstrong      2019-07-29   627  
1499218c80c99a Neil Armstrong      2019-07-29   628  					pdm_din0_x_pins: pdm-din0-x {
1499218c80c99a Neil Armstrong      2019-07-29   629  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   630  							groups = "pdm_din0_x";
1499218c80c99a Neil Armstrong      2019-07-29   631  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   632  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   633  						};
1499218c80c99a Neil Armstrong      2019-07-29   634  					};
1499218c80c99a Neil Armstrong      2019-07-29   635  
1499218c80c99a Neil Armstrong      2019-07-29   636  					pdm_din0_z_pins: pdm-din0-z {
1499218c80c99a Neil Armstrong      2019-07-29   637  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   638  							groups = "pdm_din0_z";
1499218c80c99a Neil Armstrong      2019-07-29   639  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   640  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   641  						};
1499218c80c99a Neil Armstrong      2019-07-29   642  					};
1499218c80c99a Neil Armstrong      2019-07-29   643  
1499218c80c99a Neil Armstrong      2019-07-29   644  					pdm_din1_a_pins: pdm-din1-a {
1499218c80c99a Neil Armstrong      2019-07-29   645  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   646  							groups = "pdm_din1_a";
1499218c80c99a Neil Armstrong      2019-07-29   647  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   648  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   649  						};
1499218c80c99a Neil Armstrong      2019-07-29   650  					};
1499218c80c99a Neil Armstrong      2019-07-29   651  
1499218c80c99a Neil Armstrong      2019-07-29   652  					pdm_din1_c_pins: pdm-din1-c {
1499218c80c99a Neil Armstrong      2019-07-29   653  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   654  							groups = "pdm_din1_c";
1499218c80c99a Neil Armstrong      2019-07-29   655  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   656  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   657  						};
1499218c80c99a Neil Armstrong      2019-07-29   658  					};
1499218c80c99a Neil Armstrong      2019-07-29   659  
1499218c80c99a Neil Armstrong      2019-07-29   660  					pdm_din1_x_pins: pdm-din1-x {
1499218c80c99a Neil Armstrong      2019-07-29   661  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   662  							groups = "pdm_din1_x";
1499218c80c99a Neil Armstrong      2019-07-29   663  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   664  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   665  						};
1499218c80c99a Neil Armstrong      2019-07-29   666  					};
1499218c80c99a Neil Armstrong      2019-07-29   667  
1499218c80c99a Neil Armstrong      2019-07-29   668  					pdm_din1_z_pins: pdm-din1-z {
1499218c80c99a Neil Armstrong      2019-07-29   669  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   670  							groups = "pdm_din1_z";
1499218c80c99a Neil Armstrong      2019-07-29   671  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   672  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   673  						};
1499218c80c99a Neil Armstrong      2019-07-29   674  					};
1499218c80c99a Neil Armstrong      2019-07-29   675  
1499218c80c99a Neil Armstrong      2019-07-29   676  					pdm_din2_a_pins: pdm-din2-a {
1499218c80c99a Neil Armstrong      2019-07-29   677  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   678  							groups = "pdm_din2_a";
1499218c80c99a Neil Armstrong      2019-07-29   679  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   680  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   681  						};
1499218c80c99a Neil Armstrong      2019-07-29   682  					};
1499218c80c99a Neil Armstrong      2019-07-29   683  
1499218c80c99a Neil Armstrong      2019-07-29   684  					pdm_din2_c_pins: pdm-din2-c {
1499218c80c99a Neil Armstrong      2019-07-29   685  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   686  							groups = "pdm_din2_c";
1499218c80c99a Neil Armstrong      2019-07-29   687  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   688  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   689  						};
1499218c80c99a Neil Armstrong      2019-07-29   690  					};
1499218c80c99a Neil Armstrong      2019-07-29   691  
1499218c80c99a Neil Armstrong      2019-07-29   692  					pdm_din2_x_pins: pdm-din2-x {
1499218c80c99a Neil Armstrong      2019-07-29   693  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   694  							groups = "pdm_din2_x";
1499218c80c99a Neil Armstrong      2019-07-29   695  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   696  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   697  						};
1499218c80c99a Neil Armstrong      2019-07-29   698  					};
1499218c80c99a Neil Armstrong      2019-07-29   699  
1499218c80c99a Neil Armstrong      2019-07-29   700  					pdm_din2_z_pins: pdm-din2-z {
1499218c80c99a Neil Armstrong      2019-07-29   701  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   702  							groups = "pdm_din2_z";
1499218c80c99a Neil Armstrong      2019-07-29   703  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   704  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   705  						};
1499218c80c99a Neil Armstrong      2019-07-29   706  					};
1499218c80c99a Neil Armstrong      2019-07-29   707  
1499218c80c99a Neil Armstrong      2019-07-29   708  					pdm_din3_a_pins: pdm-din3-a {
1499218c80c99a Neil Armstrong      2019-07-29   709  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   710  							groups = "pdm_din3_a";
1499218c80c99a Neil Armstrong      2019-07-29   711  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   712  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   713  						};
1499218c80c99a Neil Armstrong      2019-07-29   714  					};
1499218c80c99a Neil Armstrong      2019-07-29   715  
1499218c80c99a Neil Armstrong      2019-07-29   716  					pdm_din3_c_pins: pdm-din3-c {
1499218c80c99a Neil Armstrong      2019-07-29   717  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   718  							groups = "pdm_din3_c";
1499218c80c99a Neil Armstrong      2019-07-29   719  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   720  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   721  						};
1499218c80c99a Neil Armstrong      2019-07-29   722  					};
1499218c80c99a Neil Armstrong      2019-07-29   723  
1499218c80c99a Neil Armstrong      2019-07-29   724  					pdm_din3_x_pins: pdm-din3-x {
1499218c80c99a Neil Armstrong      2019-07-29   725  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   726  							groups = "pdm_din3_x";
1499218c80c99a Neil Armstrong      2019-07-29   727  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   728  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   729  						};
1499218c80c99a Neil Armstrong      2019-07-29   730  					};
1499218c80c99a Neil Armstrong      2019-07-29   731  
1499218c80c99a Neil Armstrong      2019-07-29   732  					pdm_din3_z_pins: pdm-din3-z {
1499218c80c99a Neil Armstrong      2019-07-29   733  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   734  							groups = "pdm_din3_z";
1499218c80c99a Neil Armstrong      2019-07-29   735  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   736  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   737  						};
1499218c80c99a Neil Armstrong      2019-07-29   738  					};
1499218c80c99a Neil Armstrong      2019-07-29   739  
1499218c80c99a Neil Armstrong      2019-07-29   740  					pdm_dclk_a_pins: pdm-dclk-a {
1499218c80c99a Neil Armstrong      2019-07-29   741  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   742  							groups = "pdm_dclk_a";
1499218c80c99a Neil Armstrong      2019-07-29   743  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   744  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   745  							drive-strength-microamp = <500>;
1499218c80c99a Neil Armstrong      2019-07-29   746  						};
1499218c80c99a Neil Armstrong      2019-07-29   747  					};
1499218c80c99a Neil Armstrong      2019-07-29   748  
1499218c80c99a Neil Armstrong      2019-07-29   749  					pdm_dclk_c_pins: pdm-dclk-c {
1499218c80c99a Neil Armstrong      2019-07-29   750  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   751  							groups = "pdm_dclk_c";
1499218c80c99a Neil Armstrong      2019-07-29   752  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   753  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   754  							drive-strength-microamp = <500>;
1499218c80c99a Neil Armstrong      2019-07-29   755  						};
1499218c80c99a Neil Armstrong      2019-07-29   756  					};
1499218c80c99a Neil Armstrong      2019-07-29   757  
1499218c80c99a Neil Armstrong      2019-07-29   758  					pdm_dclk_x_pins: pdm-dclk-x {
1499218c80c99a Neil Armstrong      2019-07-29   759  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   760  							groups = "pdm_dclk_x";
1499218c80c99a Neil Armstrong      2019-07-29   761  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   762  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   763  							drive-strength-microamp = <500>;
1499218c80c99a Neil Armstrong      2019-07-29   764  						};
1499218c80c99a Neil Armstrong      2019-07-29   765  					};
1499218c80c99a Neil Armstrong      2019-07-29   766  
1499218c80c99a Neil Armstrong      2019-07-29   767  					pdm_dclk_z_pins: pdm-dclk-z {
1499218c80c99a Neil Armstrong      2019-07-29   768  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   769  							groups = "pdm_dclk_z";
1499218c80c99a Neil Armstrong      2019-07-29   770  							function = "pdm";
1499218c80c99a Neil Armstrong      2019-07-29   771  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   772  							drive-strength-microamp = <500>;
1499218c80c99a Neil Armstrong      2019-07-29   773  						};
1499218c80c99a Neil Armstrong      2019-07-29   774  					};
1499218c80c99a Neil Armstrong      2019-07-29   775  
1499218c80c99a Neil Armstrong      2019-07-29   776  					pwm_a_pins: pwm-a {
1499218c80c99a Neil Armstrong      2019-07-29   777  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   778  							groups = "pwm_a";
1499218c80c99a Neil Armstrong      2019-07-29   779  							function = "pwm_a";
1499218c80c99a Neil Armstrong      2019-07-29   780  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   781  						};
1499218c80c99a Neil Armstrong      2019-07-29   782  					};
1499218c80c99a Neil Armstrong      2019-07-29   783  
1499218c80c99a Neil Armstrong      2019-07-29   784  					pwm_b_x7_pins: pwm-b-x7 {
1499218c80c99a Neil Armstrong      2019-07-29   785  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   786  							groups = "pwm_b_x7";
1499218c80c99a Neil Armstrong      2019-07-29   787  							function = "pwm_b";
1499218c80c99a Neil Armstrong      2019-07-29   788  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   789  						};
1499218c80c99a Neil Armstrong      2019-07-29   790  					};
1499218c80c99a Neil Armstrong      2019-07-29   791  
1499218c80c99a Neil Armstrong      2019-07-29   792  					pwm_b_x19_pins: pwm-b-x19 {
1499218c80c99a Neil Armstrong      2019-07-29   793  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   794  							groups = "pwm_b_x19";
1499218c80c99a Neil Armstrong      2019-07-29   795  							function = "pwm_b";
1499218c80c99a Neil Armstrong      2019-07-29   796  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   797  						};
1499218c80c99a Neil Armstrong      2019-07-29   798  					};
1499218c80c99a Neil Armstrong      2019-07-29   799  
1499218c80c99a Neil Armstrong      2019-07-29   800  					pwm_c_c_pins: pwm-c-c {
1499218c80c99a Neil Armstrong      2019-07-29   801  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   802  							groups = "pwm_c_c";
1499218c80c99a Neil Armstrong      2019-07-29   803  							function = "pwm_c";
1499218c80c99a Neil Armstrong      2019-07-29   804  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   805  						};
1499218c80c99a Neil Armstrong      2019-07-29   806  					};
1499218c80c99a Neil Armstrong      2019-07-29   807  
1499218c80c99a Neil Armstrong      2019-07-29   808  					pwm_c_x5_pins: pwm-c-x5 {
1499218c80c99a Neil Armstrong      2019-07-29   809  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   810  							groups = "pwm_c_x5";
1499218c80c99a Neil Armstrong      2019-07-29   811  							function = "pwm_c";
1499218c80c99a Neil Armstrong      2019-07-29   812  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   813  						};
1499218c80c99a Neil Armstrong      2019-07-29   814  					};
1499218c80c99a Neil Armstrong      2019-07-29   815  
1499218c80c99a Neil Armstrong      2019-07-29   816  					pwm_c_x8_pins: pwm-c-x8 {
1499218c80c99a Neil Armstrong      2019-07-29   817  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   818  							groups = "pwm_c_x8";
1499218c80c99a Neil Armstrong      2019-07-29   819  							function = "pwm_c";
1499218c80c99a Neil Armstrong      2019-07-29   820  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   821  						};
1499218c80c99a Neil Armstrong      2019-07-29   822  					};
1499218c80c99a Neil Armstrong      2019-07-29   823  
1499218c80c99a Neil Armstrong      2019-07-29   824  					pwm_d_x3_pins: pwm-d-x3 {
1499218c80c99a Neil Armstrong      2019-07-29   825  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   826  							groups = "pwm_d_x3";
1499218c80c99a Neil Armstrong      2019-07-29   827  							function = "pwm_d";
1499218c80c99a Neil Armstrong      2019-07-29   828  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   829  						};
1499218c80c99a Neil Armstrong      2019-07-29   830  					};
1499218c80c99a Neil Armstrong      2019-07-29   831  
1499218c80c99a Neil Armstrong      2019-07-29   832  					pwm_d_x6_pins: pwm-d-x6 {
1499218c80c99a Neil Armstrong      2019-07-29   833  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   834  							groups = "pwm_d_x6";
1499218c80c99a Neil Armstrong      2019-07-29   835  							function = "pwm_d";
1499218c80c99a Neil Armstrong      2019-07-29   836  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   837  						};
1499218c80c99a Neil Armstrong      2019-07-29   838  					};
1499218c80c99a Neil Armstrong      2019-07-29   839  
1499218c80c99a Neil Armstrong      2019-07-29   840  					pwm_e_pins: pwm-e {
1499218c80c99a Neil Armstrong      2019-07-29   841  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   842  							groups = "pwm_e";
1499218c80c99a Neil Armstrong      2019-07-29   843  							function = "pwm_e";
1499218c80c99a Neil Armstrong      2019-07-29   844  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   845  						};
1499218c80c99a Neil Armstrong      2019-07-29   846  					};
1499218c80c99a Neil Armstrong      2019-07-29   847  
07398323330264 Gary Bisson         2022-01-12   848  					pwm_f_z_pins: pwm-f-z {
07398323330264 Gary Bisson         2022-01-12   849  						mux {
07398323330264 Gary Bisson         2022-01-12   850  							groups = "pwm_f_z";
07398323330264 Gary Bisson         2022-01-12   851  							function = "pwm_f";
07398323330264 Gary Bisson         2022-01-12   852  							bias-disable;
07398323330264 Gary Bisson         2022-01-12   853  						};
07398323330264 Gary Bisson         2022-01-12   854  					};
07398323330264 Gary Bisson         2022-01-12   855  
07398323330264 Gary Bisson         2022-01-12   856  					pwm_f_a_pins: pwm-f-a {
07398323330264 Gary Bisson         2022-01-12   857  						mux {
07398323330264 Gary Bisson         2022-01-12   858  							groups = "pwm_f_a";
07398323330264 Gary Bisson         2022-01-12   859  							function = "pwm_f";
07398323330264 Gary Bisson         2022-01-12   860  							bias-disable;
07398323330264 Gary Bisson         2022-01-12   861  						};
07398323330264 Gary Bisson         2022-01-12   862  					};
07398323330264 Gary Bisson         2022-01-12   863  
1499218c80c99a Neil Armstrong      2019-07-29   864  					pwm_f_x_pins: pwm-f-x {
1499218c80c99a Neil Armstrong      2019-07-29   865  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   866  							groups = "pwm_f_x";
1499218c80c99a Neil Armstrong      2019-07-29   867  							function = "pwm_f";
1499218c80c99a Neil Armstrong      2019-07-29   868  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   869  						};
1499218c80c99a Neil Armstrong      2019-07-29   870  					};
1499218c80c99a Neil Armstrong      2019-07-29   871  
1499218c80c99a Neil Armstrong      2019-07-29   872  					pwm_f_h_pins: pwm-f-h {
1499218c80c99a Neil Armstrong      2019-07-29   873  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   874  							groups = "pwm_f_h";
1499218c80c99a Neil Armstrong      2019-07-29   875  							function = "pwm_f";
1499218c80c99a Neil Armstrong      2019-07-29   876  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   877  						};
1499218c80c99a Neil Armstrong      2019-07-29   878  					};
1499218c80c99a Neil Armstrong      2019-07-29   879  
1499218c80c99a Neil Armstrong      2019-07-29   880  					sdcard_c_pins: sdcard_c {
1499218c80c99a Neil Armstrong      2019-07-29   881  						mux-0 {
1499218c80c99a Neil Armstrong      2019-07-29   882  							groups = "sdcard_d0_c",
1499218c80c99a Neil Armstrong      2019-07-29   883  								 "sdcard_d1_c",
1499218c80c99a Neil Armstrong      2019-07-29   884  								 "sdcard_d2_c",
1499218c80c99a Neil Armstrong      2019-07-29   885  								 "sdcard_d3_c",
1499218c80c99a Neil Armstrong      2019-07-29   886  								 "sdcard_cmd_c";
1499218c80c99a Neil Armstrong      2019-07-29   887  							function = "sdcard";
1499218c80c99a Neil Armstrong      2019-07-29   888  							bias-pull-up;
1499218c80c99a Neil Armstrong      2019-07-29   889  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   890  						};
1499218c80c99a Neil Armstrong      2019-07-29   891  
1499218c80c99a Neil Armstrong      2019-07-29   892  						mux-1 {
1499218c80c99a Neil Armstrong      2019-07-29   893  							groups = "sdcard_clk_c";
1499218c80c99a Neil Armstrong      2019-07-29   894  							function = "sdcard";
1499218c80c99a Neil Armstrong      2019-07-29   895  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   896  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   897  						};
1499218c80c99a Neil Armstrong      2019-07-29   898  					};
1499218c80c99a Neil Armstrong      2019-07-29   899  
1499218c80c99a Neil Armstrong      2019-07-29   900  					sdcard_clk_gate_c_pins: sdcard_clk_gate_c {
1499218c80c99a Neil Armstrong      2019-07-29   901  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   902  							groups = "GPIOC_4";
1499218c80c99a Neil Armstrong      2019-07-29   903  							function = "gpio_periphs";
1499218c80c99a Neil Armstrong      2019-07-29   904  							bias-pull-down;
1499218c80c99a Neil Armstrong      2019-07-29   905  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   906  						};
1499218c80c99a Neil Armstrong      2019-07-29   907  					};
1499218c80c99a Neil Armstrong      2019-07-29   908  
1499218c80c99a Neil Armstrong      2019-07-29   909  					sdcard_z_pins: sdcard_z {
1499218c80c99a Neil Armstrong      2019-07-29   910  						mux-0 {
1499218c80c99a Neil Armstrong      2019-07-29   911  							groups = "sdcard_d0_z",
1499218c80c99a Neil Armstrong      2019-07-29   912  								 "sdcard_d1_z",
1499218c80c99a Neil Armstrong      2019-07-29   913  								 "sdcard_d2_z",
1499218c80c99a Neil Armstrong      2019-07-29   914  								 "sdcard_d3_z",
1499218c80c99a Neil Armstrong      2019-07-29   915  								 "sdcard_cmd_z";
1499218c80c99a Neil Armstrong      2019-07-29   916  							function = "sdcard";
1499218c80c99a Neil Armstrong      2019-07-29   917  							bias-pull-up;
1499218c80c99a Neil Armstrong      2019-07-29   918  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   919  						};
1499218c80c99a Neil Armstrong      2019-07-29   920  
1499218c80c99a Neil Armstrong      2019-07-29   921  						mux-1 {
1499218c80c99a Neil Armstrong      2019-07-29   922  							groups = "sdcard_clk_z";
1499218c80c99a Neil Armstrong      2019-07-29   923  							function = "sdcard";
1499218c80c99a Neil Armstrong      2019-07-29   924  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   925  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   926  						};
1499218c80c99a Neil Armstrong      2019-07-29   927  					};
1499218c80c99a Neil Armstrong      2019-07-29   928  
1499218c80c99a Neil Armstrong      2019-07-29   929  					sdcard_clk_gate_z_pins: sdcard_clk_gate_z {
1499218c80c99a Neil Armstrong      2019-07-29   930  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   931  							groups = "GPIOZ_6";
1499218c80c99a Neil Armstrong      2019-07-29   932  							function = "gpio_periphs";
1499218c80c99a Neil Armstrong      2019-07-29   933  							bias-pull-down;
1499218c80c99a Neil Armstrong      2019-07-29   934  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   935  						};
1499218c80c99a Neil Armstrong      2019-07-29   936  					};
1499218c80c99a Neil Armstrong      2019-07-29   937  
1499218c80c99a Neil Armstrong      2019-07-29   938  					sdio_pins: sdio {
1499218c80c99a Neil Armstrong      2019-07-29   939  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   940  							groups = "sdio_d0",
1499218c80c99a Neil Armstrong      2019-07-29   941  								 "sdio_d1",
1499218c80c99a Neil Armstrong      2019-07-29   942  								 "sdio_d2",
1499218c80c99a Neil Armstrong      2019-07-29   943  								 "sdio_d3",
1499218c80c99a Neil Armstrong      2019-07-29   944  								 "sdio_clk",
1499218c80c99a Neil Armstrong      2019-07-29   945  								 "sdio_cmd";
1499218c80c99a Neil Armstrong      2019-07-29   946  							function = "sdio";
1499218c80c99a Neil Armstrong      2019-07-29   947  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   948  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   949  						};
1499218c80c99a Neil Armstrong      2019-07-29   950  					};
1499218c80c99a Neil Armstrong      2019-07-29   951  
1499218c80c99a Neil Armstrong      2019-07-29   952  					sdio_clk_gate_pins: sdio_clk_gate {
1499218c80c99a Neil Armstrong      2019-07-29   953  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   954  							groups = "GPIOX_4";
1499218c80c99a Neil Armstrong      2019-07-29   955  							function = "gpio_periphs";
1499218c80c99a Neil Armstrong      2019-07-29   956  							bias-pull-down;
1499218c80c99a Neil Armstrong      2019-07-29   957  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29   958  						};
1499218c80c99a Neil Armstrong      2019-07-29   959  					};
1499218c80c99a Neil Armstrong      2019-07-29   960  
1499218c80c99a Neil Armstrong      2019-07-29   961  					spdif_in_a10_pins: spdif-in-a10 {
1499218c80c99a Neil Armstrong      2019-07-29   962  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   963  							groups = "spdif_in_a10";
1499218c80c99a Neil Armstrong      2019-07-29   964  							function = "spdif_in";
1499218c80c99a Neil Armstrong      2019-07-29   965  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   966  						};
1499218c80c99a Neil Armstrong      2019-07-29   967  					};
1499218c80c99a Neil Armstrong      2019-07-29   968  
1499218c80c99a Neil Armstrong      2019-07-29   969  					spdif_in_a12_pins: spdif-in-a12 {
1499218c80c99a Neil Armstrong      2019-07-29   970  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   971  							groups = "spdif_in_a12";
1499218c80c99a Neil Armstrong      2019-07-29   972  							function = "spdif_in";
1499218c80c99a Neil Armstrong      2019-07-29   973  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   974  						};
1499218c80c99a Neil Armstrong      2019-07-29   975  					};
1499218c80c99a Neil Armstrong      2019-07-29   976  
1499218c80c99a Neil Armstrong      2019-07-29   977  					spdif_in_h_pins: spdif-in-h {
1499218c80c99a Neil Armstrong      2019-07-29   978  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   979  							groups = "spdif_in_h";
1499218c80c99a Neil Armstrong      2019-07-29   980  							function = "spdif_in";
1499218c80c99a Neil Armstrong      2019-07-29   981  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   982  						};
1499218c80c99a Neil Armstrong      2019-07-29   983  					};
1499218c80c99a Neil Armstrong      2019-07-29   984  
1499218c80c99a Neil Armstrong      2019-07-29   985  					spdif_out_h_pins: spdif-out-h {
1499218c80c99a Neil Armstrong      2019-07-29   986  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   987  							groups = "spdif_out_h";
1499218c80c99a Neil Armstrong      2019-07-29   988  							function = "spdif_out";
1499218c80c99a Neil Armstrong      2019-07-29   989  							drive-strength-microamp = <500>;
1499218c80c99a Neil Armstrong      2019-07-29   990  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29   991  						};
1499218c80c99a Neil Armstrong      2019-07-29   992  					};
1499218c80c99a Neil Armstrong      2019-07-29   993  
1499218c80c99a Neil Armstrong      2019-07-29   994  					spdif_out_a11_pins: spdif-out-a11 {
1499218c80c99a Neil Armstrong      2019-07-29   995  						mux {
1499218c80c99a Neil Armstrong      2019-07-29   996  							groups = "spdif_out_a11";
1499218c80c99a Neil Armstrong      2019-07-29   997  							function = "spdif_out";
1499218c80c99a Neil Armstrong      2019-07-29   998  							drive-strength-microamp = <500>;
1499218c80c99a Neil Armstrong      2019-07-29   999  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1000  						};
1499218c80c99a Neil Armstrong      2019-07-29  1001  					};
1499218c80c99a Neil Armstrong      2019-07-29  1002  
1499218c80c99a Neil Armstrong      2019-07-29  1003  					spdif_out_a13_pins: spdif-out-a13 {
1499218c80c99a Neil Armstrong      2019-07-29  1004  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1005  							groups = "spdif_out_a13";
1499218c80c99a Neil Armstrong      2019-07-29  1006  							function = "spdif_out";
1499218c80c99a Neil Armstrong      2019-07-29  1007  							drive-strength-microamp = <500>;
1499218c80c99a Neil Armstrong      2019-07-29  1008  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1009  						};
1499218c80c99a Neil Armstrong      2019-07-29  1010  					};
1499218c80c99a Neil Armstrong      2019-07-29  1011  
5fa86f4f72e049 Neil Armstrong      2020-03-13  1012  					spicc0_x_pins: spicc0-x {
5fa86f4f72e049 Neil Armstrong      2020-03-13  1013  						mux {
5fa86f4f72e049 Neil Armstrong      2020-03-13  1014  							groups = "spi0_mosi_x",
5fa86f4f72e049 Neil Armstrong      2020-03-13  1015  							       "spi0_miso_x",
5fa86f4f72e049 Neil Armstrong      2020-03-13  1016  							       "spi0_clk_x";
5fa86f4f72e049 Neil Armstrong      2020-03-13  1017  							function = "spi0";
5fa86f4f72e049 Neil Armstrong      2020-03-13  1018  							drive-strength-microamp = <4000>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  1019  							bias-disable;
5fa86f4f72e049 Neil Armstrong      2020-03-13  1020  						};
5fa86f4f72e049 Neil Armstrong      2020-03-13  1021  					};
5fa86f4f72e049 Neil Armstrong      2020-03-13  1022  
5fa86f4f72e049 Neil Armstrong      2020-03-13  1023  					spicc0_ss0_x_pins: spicc0-ss0-x {
5fa86f4f72e049 Neil Armstrong      2020-03-13  1024  						mux {
5fa86f4f72e049 Neil Armstrong      2020-03-13  1025  							groups = "spi0_ss0_x";
5fa86f4f72e049 Neil Armstrong      2020-03-13  1026  							function = "spi0";
5fa86f4f72e049 Neil Armstrong      2020-03-13  1027  							drive-strength-microamp = <4000>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  1028  							bias-disable;
5fa86f4f72e049 Neil Armstrong      2020-03-13  1029  						};
5fa86f4f72e049 Neil Armstrong      2020-03-13  1030  					};
5fa86f4f72e049 Neil Armstrong      2020-03-13  1031  
5fa86f4f72e049 Neil Armstrong      2020-03-13  1032  					spicc0_c_pins: spicc0-c {
5fa86f4f72e049 Neil Armstrong      2020-03-13  1033  						mux {
5fa86f4f72e049 Neil Armstrong      2020-03-13  1034  							groups = "spi0_mosi_c",
5fa86f4f72e049 Neil Armstrong      2020-03-13  1035  							       "spi0_miso_c",
5fa86f4f72e049 Neil Armstrong      2020-03-13  1036  							       "spi0_ss0_c",
5fa86f4f72e049 Neil Armstrong      2020-03-13  1037  							       "spi0_clk_c";
5fa86f4f72e049 Neil Armstrong      2020-03-13  1038  							function = "spi0";
5fa86f4f72e049 Neil Armstrong      2020-03-13  1039  							drive-strength-microamp = <4000>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  1040  							bias-disable;
5fa86f4f72e049 Neil Armstrong      2020-03-13  1041  						};
5fa86f4f72e049 Neil Armstrong      2020-03-13  1042  					};
5fa86f4f72e049 Neil Armstrong      2020-03-13  1043  
5fa86f4f72e049 Neil Armstrong      2020-03-13  1044  					spicc1_pins: spicc1 {
5fa86f4f72e049 Neil Armstrong      2020-03-13  1045  						mux {
5fa86f4f72e049 Neil Armstrong      2020-03-13  1046  							groups = "spi1_mosi",
5fa86f4f72e049 Neil Armstrong      2020-03-13  1047  							       "spi1_miso",
5fa86f4f72e049 Neil Armstrong      2020-03-13  1048  							       "spi1_clk";
5fa86f4f72e049 Neil Armstrong      2020-03-13  1049  							function = "spi1";
5fa86f4f72e049 Neil Armstrong      2020-03-13  1050  							drive-strength-microamp = <4000>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  1051  						};
5fa86f4f72e049 Neil Armstrong      2020-03-13  1052  					};
5fa86f4f72e049 Neil Armstrong      2020-03-13  1053  
5fa86f4f72e049 Neil Armstrong      2020-03-13  1054  					spicc1_ss0_pins: spicc1-ss0 {
5fa86f4f72e049 Neil Armstrong      2020-03-13  1055  						mux {
5fa86f4f72e049 Neil Armstrong      2020-03-13  1056  							groups = "spi1_ss0";
5fa86f4f72e049 Neil Armstrong      2020-03-13  1057  							function = "spi1";
5fa86f4f72e049 Neil Armstrong      2020-03-13  1058  							drive-strength-microamp = <4000>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  1059  							bias-disable;
5fa86f4f72e049 Neil Armstrong      2020-03-13  1060  						};
5fa86f4f72e049 Neil Armstrong      2020-03-13  1061  					};
5fa86f4f72e049 Neil Armstrong      2020-03-13  1062  
1499218c80c99a Neil Armstrong      2019-07-29  1063  					tdm_a_din0_pins: tdm-a-din0 {
1499218c80c99a Neil Armstrong      2019-07-29  1064  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1065  							groups = "tdm_a_din0";
1499218c80c99a Neil Armstrong      2019-07-29  1066  							function = "tdm_a";
1499218c80c99a Neil Armstrong      2019-07-29  1067  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1068  						};
1499218c80c99a Neil Armstrong      2019-07-29  1069  					};
1499218c80c99a Neil Armstrong      2019-07-29  1070  
1499218c80c99a Neil Armstrong      2019-07-29  1071  
1499218c80c99a Neil Armstrong      2019-07-29  1072  					tdm_a_din1_pins: tdm-a-din1 {
1499218c80c99a Neil Armstrong      2019-07-29  1073  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1074  							groups = "tdm_a_din1";
1499218c80c99a Neil Armstrong      2019-07-29  1075  							function = "tdm_a";
1499218c80c99a Neil Armstrong      2019-07-29  1076  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1077  						};
1499218c80c99a Neil Armstrong      2019-07-29  1078  					};
1499218c80c99a Neil Armstrong      2019-07-29  1079  
1499218c80c99a Neil Armstrong      2019-07-29  1080  					tdm_a_dout0_pins: tdm-a-dout0 {
1499218c80c99a Neil Armstrong      2019-07-29  1081  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1082  							groups = "tdm_a_dout0";
1499218c80c99a Neil Armstrong      2019-07-29  1083  							function = "tdm_a";
1499218c80c99a Neil Armstrong      2019-07-29  1084  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1085  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1086  						};
1499218c80c99a Neil Armstrong      2019-07-29  1087  					};
1499218c80c99a Neil Armstrong      2019-07-29  1088  
1499218c80c99a Neil Armstrong      2019-07-29  1089  					tdm_a_dout1_pins: tdm-a-dout1 {
1499218c80c99a Neil Armstrong      2019-07-29  1090  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1091  							groups = "tdm_a_dout1";
1499218c80c99a Neil Armstrong      2019-07-29  1092  							function = "tdm_a";
1499218c80c99a Neil Armstrong      2019-07-29  1093  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1094  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1095  						};
1499218c80c99a Neil Armstrong      2019-07-29  1096  					};
1499218c80c99a Neil Armstrong      2019-07-29  1097  
1499218c80c99a Neil Armstrong      2019-07-29  1098  					tdm_a_fs_pins: tdm-a-fs {
1499218c80c99a Neil Armstrong      2019-07-29  1099  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1100  							groups = "tdm_a_fs";
1499218c80c99a Neil Armstrong      2019-07-29  1101  							function = "tdm_a";
1499218c80c99a Neil Armstrong      2019-07-29  1102  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1103  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1104  						};
1499218c80c99a Neil Armstrong      2019-07-29  1105  					};
1499218c80c99a Neil Armstrong      2019-07-29  1106  
1499218c80c99a Neil Armstrong      2019-07-29  1107  					tdm_a_sclk_pins: tdm-a-sclk {
1499218c80c99a Neil Armstrong      2019-07-29  1108  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1109  							groups = "tdm_a_sclk";
1499218c80c99a Neil Armstrong      2019-07-29  1110  							function = "tdm_a";
1499218c80c99a Neil Armstrong      2019-07-29  1111  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1112  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1113  						};
1499218c80c99a Neil Armstrong      2019-07-29  1114  					};
1499218c80c99a Neil Armstrong      2019-07-29  1115  
1499218c80c99a Neil Armstrong      2019-07-29  1116  					tdm_a_slv_fs_pins: tdm-a-slv-fs {
1499218c80c99a Neil Armstrong      2019-07-29  1117  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1118  							groups = "tdm_a_slv_fs";
1499218c80c99a Neil Armstrong      2019-07-29  1119  							function = "tdm_a";
1499218c80c99a Neil Armstrong      2019-07-29  1120  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1121  						};
1499218c80c99a Neil Armstrong      2019-07-29  1122  					};
1499218c80c99a Neil Armstrong      2019-07-29  1123  
1499218c80c99a Neil Armstrong      2019-07-29  1124  
1499218c80c99a Neil Armstrong      2019-07-29  1125  					tdm_a_slv_sclk_pins: tdm-a-slv-sclk {
1499218c80c99a Neil Armstrong      2019-07-29  1126  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1127  							groups = "tdm_a_slv_sclk";
1499218c80c99a Neil Armstrong      2019-07-29  1128  							function = "tdm_a";
1499218c80c99a Neil Armstrong      2019-07-29  1129  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1130  						};
1499218c80c99a Neil Armstrong      2019-07-29  1131  					};
1499218c80c99a Neil Armstrong      2019-07-29  1132  
1499218c80c99a Neil Armstrong      2019-07-29  1133  					tdm_b_din0_pins: tdm-b-din0 {
1499218c80c99a Neil Armstrong      2019-07-29  1134  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1135  							groups = "tdm_b_din0";
1499218c80c99a Neil Armstrong      2019-07-29  1136  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1137  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1138  						};
1499218c80c99a Neil Armstrong      2019-07-29  1139  					};
1499218c80c99a Neil Armstrong      2019-07-29  1140  
1499218c80c99a Neil Armstrong      2019-07-29  1141  					tdm_b_din1_pins: tdm-b-din1 {
1499218c80c99a Neil Armstrong      2019-07-29  1142  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1143  							groups = "tdm_b_din1";
1499218c80c99a Neil Armstrong      2019-07-29  1144  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1145  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1146  						};
1499218c80c99a Neil Armstrong      2019-07-29  1147  					};
1499218c80c99a Neil Armstrong      2019-07-29  1148  
1499218c80c99a Neil Armstrong      2019-07-29  1149  					tdm_b_din2_pins: tdm-b-din2 {
1499218c80c99a Neil Armstrong      2019-07-29  1150  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1151  							groups = "tdm_b_din2";
1499218c80c99a Neil Armstrong      2019-07-29  1152  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1153  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1154  						};
1499218c80c99a Neil Armstrong      2019-07-29  1155  					};
1499218c80c99a Neil Armstrong      2019-07-29  1156  
1499218c80c99a Neil Armstrong      2019-07-29  1157  					tdm_b_din3_a_pins: tdm-b-din3-a {
1499218c80c99a Neil Armstrong      2019-07-29  1158  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1159  							groups = "tdm_b_din3_a";
1499218c80c99a Neil Armstrong      2019-07-29  1160  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1161  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1162  						};
1499218c80c99a Neil Armstrong      2019-07-29  1163  					};
1499218c80c99a Neil Armstrong      2019-07-29  1164  
1499218c80c99a Neil Armstrong      2019-07-29  1165  					tdm_b_din3_h_pins: tdm-b-din3-h {
1499218c80c99a Neil Armstrong      2019-07-29  1166  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1167  							groups = "tdm_b_din3_h";
1499218c80c99a Neil Armstrong      2019-07-29  1168  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1169  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1170  						};
1499218c80c99a Neil Armstrong      2019-07-29  1171  					};
1499218c80c99a Neil Armstrong      2019-07-29  1172  
1499218c80c99a Neil Armstrong      2019-07-29  1173  					tdm_b_dout0_pins: tdm-b-dout0 {
1499218c80c99a Neil Armstrong      2019-07-29  1174  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1175  							groups = "tdm_b_dout0";
1499218c80c99a Neil Armstrong      2019-07-29  1176  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1177  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1178  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1179  						};
1499218c80c99a Neil Armstrong      2019-07-29  1180  					};
1499218c80c99a Neil Armstrong      2019-07-29  1181  
1499218c80c99a Neil Armstrong      2019-07-29  1182  					tdm_b_dout1_pins: tdm-b-dout1 {
1499218c80c99a Neil Armstrong      2019-07-29  1183  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1184  							groups = "tdm_b_dout1";
1499218c80c99a Neil Armstrong      2019-07-29  1185  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1186  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1187  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1188  						};
1499218c80c99a Neil Armstrong      2019-07-29  1189  					};
1499218c80c99a Neil Armstrong      2019-07-29  1190  
1499218c80c99a Neil Armstrong      2019-07-29  1191  					tdm_b_dout2_pins: tdm-b-dout2 {
1499218c80c99a Neil Armstrong      2019-07-29  1192  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1193  							groups = "tdm_b_dout2";
1499218c80c99a Neil Armstrong      2019-07-29  1194  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1195  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1196  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1197  						};
1499218c80c99a Neil Armstrong      2019-07-29  1198  					};
1499218c80c99a Neil Armstrong      2019-07-29  1199  
1499218c80c99a Neil Armstrong      2019-07-29  1200  					tdm_b_dout3_a_pins: tdm-b-dout3-a {
1499218c80c99a Neil Armstrong      2019-07-29  1201  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1202  							groups = "tdm_b_dout3_a";
1499218c80c99a Neil Armstrong      2019-07-29  1203  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1204  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1205  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1206  						};
1499218c80c99a Neil Armstrong      2019-07-29  1207  					};
1499218c80c99a Neil Armstrong      2019-07-29  1208  
1499218c80c99a Neil Armstrong      2019-07-29  1209  					tdm_b_dout3_h_pins: tdm-b-dout3-h {
1499218c80c99a Neil Armstrong      2019-07-29  1210  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1211  							groups = "tdm_b_dout3_h";
1499218c80c99a Neil Armstrong      2019-07-29  1212  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1213  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1214  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1215  						};
1499218c80c99a Neil Armstrong      2019-07-29  1216  					};
1499218c80c99a Neil Armstrong      2019-07-29  1217  
1499218c80c99a Neil Armstrong      2019-07-29  1218  					tdm_b_fs_pins: tdm-b-fs {
1499218c80c99a Neil Armstrong      2019-07-29  1219  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1220  							groups = "tdm_b_fs";
1499218c80c99a Neil Armstrong      2019-07-29  1221  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1222  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1223  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1224  						};
1499218c80c99a Neil Armstrong      2019-07-29  1225  					};
1499218c80c99a Neil Armstrong      2019-07-29  1226  
1499218c80c99a Neil Armstrong      2019-07-29  1227  					tdm_b_sclk_pins: tdm-b-sclk {
1499218c80c99a Neil Armstrong      2019-07-29  1228  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1229  							groups = "tdm_b_sclk";
1499218c80c99a Neil Armstrong      2019-07-29  1230  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1231  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1232  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1233  						};
1499218c80c99a Neil Armstrong      2019-07-29  1234  					};
1499218c80c99a Neil Armstrong      2019-07-29  1235  
1499218c80c99a Neil Armstrong      2019-07-29  1236  					tdm_b_slv_fs_pins: tdm-b-slv-fs {
1499218c80c99a Neil Armstrong      2019-07-29  1237  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1238  							groups = "tdm_b_slv_fs";
1499218c80c99a Neil Armstrong      2019-07-29  1239  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1240  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1241  						};
1499218c80c99a Neil Armstrong      2019-07-29  1242  					};
1499218c80c99a Neil Armstrong      2019-07-29  1243  
1499218c80c99a Neil Armstrong      2019-07-29  1244  					tdm_b_slv_sclk_pins: tdm-b-slv-sclk {
1499218c80c99a Neil Armstrong      2019-07-29  1245  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1246  							groups = "tdm_b_slv_sclk";
1499218c80c99a Neil Armstrong      2019-07-29  1247  							function = "tdm_b";
1499218c80c99a Neil Armstrong      2019-07-29  1248  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1249  						};
1499218c80c99a Neil Armstrong      2019-07-29  1250  					};
1499218c80c99a Neil Armstrong      2019-07-29  1251  
1499218c80c99a Neil Armstrong      2019-07-29  1252  					tdm_c_din0_a_pins: tdm-c-din0-a {
1499218c80c99a Neil Armstrong      2019-07-29  1253  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1254  							groups = "tdm_c_din0_a";
1499218c80c99a Neil Armstrong      2019-07-29  1255  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1256  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1257  						};
1499218c80c99a Neil Armstrong      2019-07-29  1258  					};
1499218c80c99a Neil Armstrong      2019-07-29  1259  
1499218c80c99a Neil Armstrong      2019-07-29  1260  					tdm_c_din0_z_pins: tdm-c-din0-z {
1499218c80c99a Neil Armstrong      2019-07-29  1261  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1262  							groups = "tdm_c_din0_z";
1499218c80c99a Neil Armstrong      2019-07-29  1263  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1264  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1265  						};
1499218c80c99a Neil Armstrong      2019-07-29  1266  					};
1499218c80c99a Neil Armstrong      2019-07-29  1267  
1499218c80c99a Neil Armstrong      2019-07-29  1268  					tdm_c_din1_a_pins: tdm-c-din1-a {
1499218c80c99a Neil Armstrong      2019-07-29  1269  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1270  							groups = "tdm_c_din1_a";
1499218c80c99a Neil Armstrong      2019-07-29  1271  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1272  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1273  						};
1499218c80c99a Neil Armstrong      2019-07-29  1274  					};
1499218c80c99a Neil Armstrong      2019-07-29  1275  
1499218c80c99a Neil Armstrong      2019-07-29  1276  					tdm_c_din1_z_pins: tdm-c-din1-z {
1499218c80c99a Neil Armstrong      2019-07-29  1277  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1278  							groups = "tdm_c_din1_z";
1499218c80c99a Neil Armstrong      2019-07-29  1279  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1280  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1281  						};
1499218c80c99a Neil Armstrong      2019-07-29  1282  					};
1499218c80c99a Neil Armstrong      2019-07-29  1283  
1499218c80c99a Neil Armstrong      2019-07-29  1284  					tdm_c_din2_a_pins: tdm-c-din2-a {
1499218c80c99a Neil Armstrong      2019-07-29  1285  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1286  							groups = "tdm_c_din2_a";
1499218c80c99a Neil Armstrong      2019-07-29  1287  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1288  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1289  						};
1499218c80c99a Neil Armstrong      2019-07-29  1290  					};
1499218c80c99a Neil Armstrong      2019-07-29  1291  
1499218c80c99a Neil Armstrong      2019-07-29  1292  					eth_leds_pins: eth-leds {
1499218c80c99a Neil Armstrong      2019-07-29  1293  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1294  							groups = "eth_link_led",
1499218c80c99a Neil Armstrong      2019-07-29  1295  								 "eth_act_led";
1499218c80c99a Neil Armstrong      2019-07-29  1296  							function = "eth";
1499218c80c99a Neil Armstrong      2019-07-29  1297  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1298  						};
1499218c80c99a Neil Armstrong      2019-07-29  1299  					};
1499218c80c99a Neil Armstrong      2019-07-29  1300  
1499218c80c99a Neil Armstrong      2019-07-29  1301  					eth_pins: eth {
1499218c80c99a Neil Armstrong      2019-07-29  1302  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1303  							groups = "eth_mdio",
1499218c80c99a Neil Armstrong      2019-07-29  1304  								 "eth_mdc",
1499218c80c99a Neil Armstrong      2019-07-29  1305  								 "eth_rgmii_rx_clk",
1499218c80c99a Neil Armstrong      2019-07-29  1306  								 "eth_rx_dv",
1499218c80c99a Neil Armstrong      2019-07-29  1307  								 "eth_rxd0",
1499218c80c99a Neil Armstrong      2019-07-29  1308  								 "eth_rxd1",
1499218c80c99a Neil Armstrong      2019-07-29  1309  								 "eth_txen",
1499218c80c99a Neil Armstrong      2019-07-29  1310  								 "eth_txd0",
1499218c80c99a Neil Armstrong      2019-07-29  1311  								 "eth_txd1";
1499218c80c99a Neil Armstrong      2019-07-29  1312  							function = "eth";
1499218c80c99a Neil Armstrong      2019-07-29  1313  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29  1314  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1315  						};
1499218c80c99a Neil Armstrong      2019-07-29  1316  					};
1499218c80c99a Neil Armstrong      2019-07-29  1317  
1499218c80c99a Neil Armstrong      2019-07-29  1318  					eth_rgmii_pins: eth-rgmii {
1499218c80c99a Neil Armstrong      2019-07-29  1319  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1320  							groups = "eth_rxd2_rgmii",
1499218c80c99a Neil Armstrong      2019-07-29  1321  								 "eth_rxd3_rgmii",
1499218c80c99a Neil Armstrong      2019-07-29  1322  								 "eth_rgmii_tx_clk",
1499218c80c99a Neil Armstrong      2019-07-29  1323  								 "eth_txd2_rgmii",
1499218c80c99a Neil Armstrong      2019-07-29  1324  								 "eth_txd3_rgmii";
1499218c80c99a Neil Armstrong      2019-07-29  1325  							function = "eth";
1499218c80c99a Neil Armstrong      2019-07-29  1326  							drive-strength-microamp = <4000>;
1499218c80c99a Neil Armstrong      2019-07-29  1327  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1328  						};
1499218c80c99a Neil Armstrong      2019-07-29  1329  					};
1499218c80c99a Neil Armstrong      2019-07-29  1330  
1499218c80c99a Neil Armstrong      2019-07-29  1331  					tdm_c_din2_z_pins: tdm-c-din2-z {
1499218c80c99a Neil Armstrong      2019-07-29  1332  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1333  							groups = "tdm_c_din2_z";
1499218c80c99a Neil Armstrong      2019-07-29  1334  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1335  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1336  						};
1499218c80c99a Neil Armstrong      2019-07-29  1337  					};
1499218c80c99a Neil Armstrong      2019-07-29  1338  
1499218c80c99a Neil Armstrong      2019-07-29  1339  					tdm_c_din3_a_pins: tdm-c-din3-a {
1499218c80c99a Neil Armstrong      2019-07-29  1340  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1341  							groups = "tdm_c_din3_a";
1499218c80c99a Neil Armstrong      2019-07-29  1342  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1343  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1344  						};
1499218c80c99a Neil Armstrong      2019-07-29  1345  					};
1499218c80c99a Neil Armstrong      2019-07-29  1346  
1499218c80c99a Neil Armstrong      2019-07-29  1347  					tdm_c_din3_z_pins: tdm-c-din3-z {
1499218c80c99a Neil Armstrong      2019-07-29  1348  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1349  							groups = "tdm_c_din3_z";
1499218c80c99a Neil Armstrong      2019-07-29  1350  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1351  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1352  						};
1499218c80c99a Neil Armstrong      2019-07-29  1353  					};
1499218c80c99a Neil Armstrong      2019-07-29  1354  
1499218c80c99a Neil Armstrong      2019-07-29  1355  					tdm_c_dout0_a_pins: tdm-c-dout0-a {
1499218c80c99a Neil Armstrong      2019-07-29  1356  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1357  							groups = "tdm_c_dout0_a";
1499218c80c99a Neil Armstrong      2019-07-29  1358  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1359  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1360  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1361  						};
1499218c80c99a Neil Armstrong      2019-07-29  1362  					};
1499218c80c99a Neil Armstrong      2019-07-29  1363  
1499218c80c99a Neil Armstrong      2019-07-29  1364  					tdm_c_dout0_z_pins: tdm-c-dout0-z {
1499218c80c99a Neil Armstrong      2019-07-29  1365  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1366  							groups = "tdm_c_dout0_z";
1499218c80c99a Neil Armstrong      2019-07-29  1367  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1368  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1369  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1370  						};
1499218c80c99a Neil Armstrong      2019-07-29  1371  					};
1499218c80c99a Neil Armstrong      2019-07-29  1372  
1499218c80c99a Neil Armstrong      2019-07-29  1373  					tdm_c_dout1_a_pins: tdm-c-dout1-a {
1499218c80c99a Neil Armstrong      2019-07-29  1374  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1375  							groups = "tdm_c_dout1_a";
1499218c80c99a Neil Armstrong      2019-07-29  1376  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1377  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1378  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1379  						};
1499218c80c99a Neil Armstrong      2019-07-29  1380  					};
1499218c80c99a Neil Armstrong      2019-07-29  1381  
1499218c80c99a Neil Armstrong      2019-07-29  1382  					tdm_c_dout1_z_pins: tdm-c-dout1-z {
1499218c80c99a Neil Armstrong      2019-07-29  1383  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1384  							groups = "tdm_c_dout1_z";
1499218c80c99a Neil Armstrong      2019-07-29  1385  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1386  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1387  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1388  						};
1499218c80c99a Neil Armstrong      2019-07-29  1389  					};
1499218c80c99a Neil Armstrong      2019-07-29  1390  
1499218c80c99a Neil Armstrong      2019-07-29  1391  					tdm_c_dout2_a_pins: tdm-c-dout2-a {
1499218c80c99a Neil Armstrong      2019-07-29  1392  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1393  							groups = "tdm_c_dout2_a";
1499218c80c99a Neil Armstrong      2019-07-29  1394  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1395  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1396  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1397  						};
1499218c80c99a Neil Armstrong      2019-07-29  1398  					};
1499218c80c99a Neil Armstrong      2019-07-29  1399  
1499218c80c99a Neil Armstrong      2019-07-29  1400  					tdm_c_dout2_z_pins: tdm-c-dout2-z {
1499218c80c99a Neil Armstrong      2019-07-29  1401  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1402  							groups = "tdm_c_dout2_z";
1499218c80c99a Neil Armstrong      2019-07-29  1403  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1404  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1405  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1406  						};
1499218c80c99a Neil Armstrong      2019-07-29  1407  					};
1499218c80c99a Neil Armstrong      2019-07-29  1408  
1499218c80c99a Neil Armstrong      2019-07-29  1409  					tdm_c_dout3_a_pins: tdm-c-dout3-a {
1499218c80c99a Neil Armstrong      2019-07-29  1410  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1411  							groups = "tdm_c_dout3_a";
1499218c80c99a Neil Armstrong      2019-07-29  1412  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1413  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1414  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1415  						};
1499218c80c99a Neil Armstrong      2019-07-29  1416  					};
1499218c80c99a Neil Armstrong      2019-07-29  1417  
1499218c80c99a Neil Armstrong      2019-07-29  1418  					tdm_c_dout3_z_pins: tdm-c-dout3-z {
1499218c80c99a Neil Armstrong      2019-07-29  1419  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1420  							groups = "tdm_c_dout3_z";
1499218c80c99a Neil Armstrong      2019-07-29  1421  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1422  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1423  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1424  						};
1499218c80c99a Neil Armstrong      2019-07-29  1425  					};
1499218c80c99a Neil Armstrong      2019-07-29  1426  
1499218c80c99a Neil Armstrong      2019-07-29  1427  					tdm_c_fs_a_pins: tdm-c-fs-a {
1499218c80c99a Neil Armstrong      2019-07-29  1428  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1429  							groups = "tdm_c_fs_a";
1499218c80c99a Neil Armstrong      2019-07-29  1430  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1431  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1432  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1433  						};
1499218c80c99a Neil Armstrong      2019-07-29  1434  					};
1499218c80c99a Neil Armstrong      2019-07-29  1435  
1499218c80c99a Neil Armstrong      2019-07-29  1436  					tdm_c_fs_z_pins: tdm-c-fs-z {
1499218c80c99a Neil Armstrong      2019-07-29  1437  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1438  							groups = "tdm_c_fs_z";
1499218c80c99a Neil Armstrong      2019-07-29  1439  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1440  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1441  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1442  						};
1499218c80c99a Neil Armstrong      2019-07-29  1443  					};
1499218c80c99a Neil Armstrong      2019-07-29  1444  
1499218c80c99a Neil Armstrong      2019-07-29  1445  					tdm_c_sclk_a_pins: tdm-c-sclk-a {
1499218c80c99a Neil Armstrong      2019-07-29  1446  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1447  							groups = "tdm_c_sclk_a";
1499218c80c99a Neil Armstrong      2019-07-29  1448  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1449  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1450  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1451  						};
1499218c80c99a Neil Armstrong      2019-07-29  1452  					};
1499218c80c99a Neil Armstrong      2019-07-29  1453  
1499218c80c99a Neil Armstrong      2019-07-29  1454  					tdm_c_sclk_z_pins: tdm-c-sclk-z {
1499218c80c99a Neil Armstrong      2019-07-29  1455  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1456  							groups = "tdm_c_sclk_z";
1499218c80c99a Neil Armstrong      2019-07-29  1457  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1458  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1459  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1460  						};
1499218c80c99a Neil Armstrong      2019-07-29  1461  					};
1499218c80c99a Neil Armstrong      2019-07-29  1462  
1499218c80c99a Neil Armstrong      2019-07-29  1463  					tdm_c_slv_fs_a_pins: tdm-c-slv-fs-a {
1499218c80c99a Neil Armstrong      2019-07-29  1464  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1465  							groups = "tdm_c_slv_fs_a";
1499218c80c99a Neil Armstrong      2019-07-29  1466  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1467  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1468  						};
1499218c80c99a Neil Armstrong      2019-07-29  1469  					};
1499218c80c99a Neil Armstrong      2019-07-29  1470  
1499218c80c99a Neil Armstrong      2019-07-29  1471  					tdm_c_slv_fs_z_pins: tdm-c-slv-fs-z {
1499218c80c99a Neil Armstrong      2019-07-29  1472  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1473  							groups = "tdm_c_slv_fs_z";
1499218c80c99a Neil Armstrong      2019-07-29  1474  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1475  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1476  						};
1499218c80c99a Neil Armstrong      2019-07-29  1477  					};
1499218c80c99a Neil Armstrong      2019-07-29  1478  
1499218c80c99a Neil Armstrong      2019-07-29  1479  					tdm_c_slv_sclk_a_pins: tdm-c-slv-sclk-a {
1499218c80c99a Neil Armstrong      2019-07-29  1480  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1481  							groups = "tdm_c_slv_sclk_a";
1499218c80c99a Neil Armstrong      2019-07-29  1482  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1483  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1484  						};
1499218c80c99a Neil Armstrong      2019-07-29  1485  					};
1499218c80c99a Neil Armstrong      2019-07-29  1486  
1499218c80c99a Neil Armstrong      2019-07-29  1487  					tdm_c_slv_sclk_z_pins: tdm-c-slv-sclk-z {
1499218c80c99a Neil Armstrong      2019-07-29  1488  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1489  							groups = "tdm_c_slv_sclk_z";
1499218c80c99a Neil Armstrong      2019-07-29  1490  							function = "tdm_c";
1499218c80c99a Neil Armstrong      2019-07-29  1491  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1492  						};
1499218c80c99a Neil Armstrong      2019-07-29  1493  					};
1499218c80c99a Neil Armstrong      2019-07-29  1494  
1499218c80c99a Neil Armstrong      2019-07-29  1495  					uart_a_pins: uart-a {
1499218c80c99a Neil Armstrong      2019-07-29  1496  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1497  							groups = "uart_a_tx",
1499218c80c99a Neil Armstrong      2019-07-29  1498  								 "uart_a_rx";
1499218c80c99a Neil Armstrong      2019-07-29  1499  							function = "uart_a";
1499218c80c99a Neil Armstrong      2019-07-29  1500  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1501  						};
1499218c80c99a Neil Armstrong      2019-07-29  1502  					};
1499218c80c99a Neil Armstrong      2019-07-29  1503  
1499218c80c99a Neil Armstrong      2019-07-29  1504  					uart_a_cts_rts_pins: uart-a-cts-rts {
1499218c80c99a Neil Armstrong      2019-07-29  1505  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1506  							groups = "uart_a_cts",
1499218c80c99a Neil Armstrong      2019-07-29  1507  								 "uart_a_rts";
1499218c80c99a Neil Armstrong      2019-07-29  1508  							function = "uart_a";
1499218c80c99a Neil Armstrong      2019-07-29  1509  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1510  						};
1499218c80c99a Neil Armstrong      2019-07-29  1511  					};
1499218c80c99a Neil Armstrong      2019-07-29  1512  
1499218c80c99a Neil Armstrong      2019-07-29  1513  					uart_b_pins: uart-b {
1499218c80c99a Neil Armstrong      2019-07-29  1514  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1515  							groups = "uart_b_tx",
1499218c80c99a Neil Armstrong      2019-07-29  1516  								 "uart_b_rx";
1499218c80c99a Neil Armstrong      2019-07-29  1517  							function = "uart_b";
1499218c80c99a Neil Armstrong      2019-07-29  1518  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1519  						};
1499218c80c99a Neil Armstrong      2019-07-29  1520  					};
1499218c80c99a Neil Armstrong      2019-07-29  1521  
1499218c80c99a Neil Armstrong      2019-07-29  1522  					uart_c_pins: uart-c {
1499218c80c99a Neil Armstrong      2019-07-29  1523  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1524  							groups = "uart_c_tx",
1499218c80c99a Neil Armstrong      2019-07-29  1525  								 "uart_c_rx";
1499218c80c99a Neil Armstrong      2019-07-29  1526  							function = "uart_c";
1499218c80c99a Neil Armstrong      2019-07-29  1527  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1528  						};
1499218c80c99a Neil Armstrong      2019-07-29  1529  					};
1499218c80c99a Neil Armstrong      2019-07-29  1530  
1499218c80c99a Neil Armstrong      2019-07-29  1531  					uart_c_cts_rts_pins: uart-c-cts-rts {
1499218c80c99a Neil Armstrong      2019-07-29  1532  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1533  							groups = "uart_c_cts",
1499218c80c99a Neil Armstrong      2019-07-29  1534  								 "uart_c_rts";
1499218c80c99a Neil Armstrong      2019-07-29  1535  							function = "uart_c";
1499218c80c99a Neil Armstrong      2019-07-29  1536  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1537  						};
1499218c80c99a Neil Armstrong      2019-07-29  1538  					};
1499218c80c99a Neil Armstrong      2019-07-29  1539  				};
1499218c80c99a Neil Armstrong      2019-07-29  1540  			};
1499218c80c99a Neil Armstrong      2019-07-29  1541  
8656783f07613a Guillaume La Roque  2019-10-04  1542  			cpu_temp: temperature-sensor@34800 {
8656783f07613a Guillaume La Roque  2019-10-04  1543  				compatible = "amlogic,g12a-cpu-thermal",
8656783f07613a Guillaume La Roque  2019-10-04  1544  					     "amlogic,g12a-thermal";
8656783f07613a Guillaume La Roque  2019-10-04  1545  				reg = <0x0 0x34800 0x0 0x50>;
8656783f07613a Guillaume La Roque  2019-10-04  1546  				interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
8656783f07613a Guillaume La Roque  2019-10-04  1547  				clocks = <&clkc CLKID_TS>;
8656783f07613a Guillaume La Roque  2019-10-04  1548  				#thermal-sensor-cells = <0>;
8656783f07613a Guillaume La Roque  2019-10-04  1549  				amlogic,ao-secure = <&sec_AO>;
8656783f07613a Guillaume La Roque  2019-10-04  1550  			};
8656783f07613a Guillaume La Roque  2019-10-04  1551  
8656783f07613a Guillaume La Roque  2019-10-04  1552  			ddr_temp: temperature-sensor@34c00 {
8656783f07613a Guillaume La Roque  2019-10-04  1553  				compatible = "amlogic,g12a-ddr-thermal",
8656783f07613a Guillaume La Roque  2019-10-04  1554  					     "amlogic,g12a-thermal";
8656783f07613a Guillaume La Roque  2019-10-04  1555  				reg = <0x0 0x34c00 0x0 0x50>;
8656783f07613a Guillaume La Roque  2019-10-04  1556  				interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
8656783f07613a Guillaume La Roque  2019-10-04  1557  				clocks = <&clkc CLKID_TS>;
8656783f07613a Guillaume La Roque  2019-10-04  1558  				#thermal-sensor-cells = <0>;
8656783f07613a Guillaume La Roque  2019-10-04  1559  				amlogic,ao-secure = <&sec_AO>;
8656783f07613a Guillaume La Roque  2019-10-04  1560  			};
8656783f07613a Guillaume La Roque  2019-10-04  1561  
1499218c80c99a Neil Armstrong      2019-07-29  1562  			usb2_phy0: phy@36000 {
1499218c80c99a Neil Armstrong      2019-07-29  1563  				compatible = "amlogic,g12a-usb2-phy";
1499218c80c99a Neil Armstrong      2019-07-29  1564  				reg = <0x0 0x36000 0x0 0x2000>;
1499218c80c99a Neil Armstrong      2019-07-29  1565  				clocks = <&xtal>;
1499218c80c99a Neil Armstrong      2019-07-29  1566  				clock-names = "xtal";
1499218c80c99a Neil Armstrong      2019-07-29  1567  				resets = <&reset RESET_USB_PHY20>;
1499218c80c99a Neil Armstrong      2019-07-29  1568  				reset-names = "phy";
1499218c80c99a Neil Armstrong      2019-07-29  1569  				#phy-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  1570  			};
1499218c80c99a Neil Armstrong      2019-07-29  1571  
1499218c80c99a Neil Armstrong      2019-07-29  1572  			dmc: bus@38000 {
1499218c80c99a Neil Armstrong      2019-07-29  1573  				compatible = "simple-bus";
1499218c80c99a Neil Armstrong      2019-07-29  1574  				reg = <0x0 0x38000 0x0 0x400>;
1499218c80c99a Neil Armstrong      2019-07-29  1575  				#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  1576  				#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  1577  				ranges = <0x0 0x0 0x0 0x38000 0x0 0x400>;
1499218c80c99a Neil Armstrong      2019-07-29  1578  
1499218c80c99a Neil Armstrong      2019-07-29  1579  				canvas: video-lut@48 {
1499218c80c99a Neil Armstrong      2019-07-29  1580  					compatible = "amlogic,canvas";
1499218c80c99a Neil Armstrong      2019-07-29  1581  					reg = <0x0 0x48 0x0 0x14>;
1499218c80c99a Neil Armstrong      2019-07-29  1582  				};
1499218c80c99a Neil Armstrong      2019-07-29  1583  			};
1499218c80c99a Neil Armstrong      2019-07-29  1584  
1499218c80c99a Neil Armstrong      2019-07-29  1585  			usb2_phy1: phy@3a000 {
1499218c80c99a Neil Armstrong      2019-07-29  1586  				compatible = "amlogic,g12a-usb2-phy";
1499218c80c99a Neil Armstrong      2019-07-29  1587  				reg = <0x0 0x3a000 0x0 0x2000>;
1499218c80c99a Neil Armstrong      2019-07-29  1588  				clocks = <&xtal>;
1499218c80c99a Neil Armstrong      2019-07-29  1589  				clock-names = "xtal";
1499218c80c99a Neil Armstrong      2019-07-29  1590  				resets = <&reset RESET_USB_PHY21>;
1499218c80c99a Neil Armstrong      2019-07-29  1591  				reset-names = "phy";
1499218c80c99a Neil Armstrong      2019-07-29  1592  				#phy-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  1593  			};
1499218c80c99a Neil Armstrong      2019-07-29  1594  
1499218c80c99a Neil Armstrong      2019-07-29  1595  			hiu: bus@3c000 {
1499218c80c99a Neil Armstrong      2019-07-29  1596  				compatible = "simple-bus";
1499218c80c99a Neil Armstrong      2019-07-29  1597  				reg = <0x0 0x3c000 0x0 0x1400>;
1499218c80c99a Neil Armstrong      2019-07-29  1598  				#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  1599  				#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  1600  				ranges = <0x0 0x0 0x0 0x3c000 0x0 0x1400>;
1499218c80c99a Neil Armstrong      2019-07-29  1601  
1499218c80c99a Neil Armstrong      2019-07-29  1602  				hhi: system-controller@0 {
1499218c80c99a Neil Armstrong      2019-07-29  1603  					compatible = "amlogic,meson-gx-hhi-sysctrl",
1499218c80c99a Neil Armstrong      2019-07-29  1604  						     "simple-mfd", "syscon";
1499218c80c99a Neil Armstrong      2019-07-29  1605  					reg = <0 0 0 0x400>;
1499218c80c99a Neil Armstrong      2019-07-29  1606  
1499218c80c99a Neil Armstrong      2019-07-29  1607  					clkc: clock-controller {
1499218c80c99a Neil Armstrong      2019-07-29  1608  						compatible = "amlogic,g12a-clkc";
1499218c80c99a Neil Armstrong      2019-07-29  1609  						#clock-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  1610  						clocks = <&xtal>;
1499218c80c99a Neil Armstrong      2019-07-29  1611  						clock-names = "xtal";
1499218c80c99a Neil Armstrong      2019-07-29  1612  					};
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1613  
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1614  					pwrc: power-controller {
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1615  						compatible = "amlogic,meson-g12a-pwrc";
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1616  						#power-domain-cells = <1>;
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1617  						amlogic,ao-sysctrl = <&rti>;
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1618  						resets = <&reset RESET_VIU>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1619  							 <&reset RESET_VENC>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1620  							 <&reset RESET_VCBUS>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1621  							 <&reset RESET_BT656>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1622  							 <&reset RESET_RDMA>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1623  							 <&reset RESET_VENCI>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1624  							 <&reset RESET_VENCP>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1625  							 <&reset RESET_VDAC>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1626  							 <&reset RESET_VDI6>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1627  							 <&reset RESET_VENCL>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1628  							 <&reset RESET_VID_LOCK>;
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1629  						reset-names = "viu", "venc", "vcbus", "bt656",
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1630  							      "rdma", "venci", "vencp", "vdac",
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1631  							      "vdi6", "vencl", "vid_lock";
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1632  						clocks = <&clkc CLKID_VPU>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1633  							 <&clkc CLKID_VAPB>;
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1634  						clock-names = "vpu", "vapb";
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1635  						/*
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1636  						 * VPU clocking is provided by two identical clock paths
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1637  						 * VPU_0 and VPU_1 muxed to a single clock by a glitch
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1638  						 * free mux to safely change frequency while running.
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1639  						 * Same for VAPB but with a final gate after the glitch free mux.
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1640  						 */
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1641  						assigned-clocks = <&clkc CLKID_VPU_0_SEL>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1642  								  <&clkc CLKID_VPU_0>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1643  								  <&clkc CLKID_VPU>, /* Glitch free mux */
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1644  								  <&clkc CLKID_VAPB_0_SEL>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1645  								  <&clkc CLKID_VAPB_0>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1646  								  <&clkc CLKID_VAPB_SEL>; /* Glitch free mux */
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1647  						assigned-clock-parents = <&clkc CLKID_FCLK_DIV3>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1648  									 <0>, /* Do Nothing */
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1649  									 <&clkc CLKID_VPU_0>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1650  									 <&clkc CLKID_FCLK_DIV4>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1651  									 <0>, /* Do Nothing */
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1652  									 <&clkc CLKID_VAPB_0>;
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1653  						assigned-clock-rates = <0>, /* Do Nothing */
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1654  								       <666666666>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1655  								       <0>, /* Do Nothing */
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1656  								       <0>, /* Do Nothing */
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1657  								       <250000000>,
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1658  								       <0>; /* Do Nothing */
f4f1c8d9ace7a0 Neil Armstrong      2019-08-23  1659  					};
1499218c80c99a Neil Armstrong      2019-07-29  1660  				};
1499218c80c99a Neil Armstrong      2019-07-29  1661  			};
1499218c80c99a Neil Armstrong      2019-07-29  1662  
1499218c80c99a Neil Armstrong      2019-07-29  1663  			usb3_pcie_phy: phy@46000 {
1499218c80c99a Neil Armstrong      2019-07-29  1664  				compatible = "amlogic,g12a-usb3-pcie-phy";
1499218c80c99a Neil Armstrong      2019-07-29  1665  				reg = <0x0 0x46000 0x0 0x2000>;
1499218c80c99a Neil Armstrong      2019-07-29  1666  				clocks = <&clkc CLKID_PCIE_PLL>;
1499218c80c99a Neil Armstrong      2019-07-29  1667  				clock-names = "ref_clk";
1499218c80c99a Neil Armstrong      2019-07-29  1668  				resets = <&reset RESET_PCIE_PHY>;
1499218c80c99a Neil Armstrong      2019-07-29  1669  				reset-names = "phy";
1499218c80c99a Neil Armstrong      2019-07-29  1670  				assigned-clocks = <&clkc CLKID_PCIE_PLL>;
1499218c80c99a Neil Armstrong      2019-07-29  1671  				assigned-clock-rates = <100000000>;
1499218c80c99a Neil Armstrong      2019-07-29  1672  				#phy-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  1673  			};
1499218c80c99a Neil Armstrong      2019-07-29  1674  
1499218c80c99a Neil Armstrong      2019-07-29  1675  			eth_phy: mdio-multiplexer@4c000 {
1499218c80c99a Neil Armstrong      2019-07-29  1676  				compatible = "amlogic,g12a-mdio-mux";
1499218c80c99a Neil Armstrong      2019-07-29  1677  				reg = <0x0 0x4c000 0x0 0xa4>;
1499218c80c99a Neil Armstrong      2019-07-29  1678  				clocks = <&clkc CLKID_ETH_PHY>,
1499218c80c99a Neil Armstrong      2019-07-29  1679  					 <&xtal>,
1499218c80c99a Neil Armstrong      2019-07-29  1680  					 <&clkc CLKID_MPLL_50M>;
1499218c80c99a Neil Armstrong      2019-07-29  1681  				clock-names = "pclk", "clkin0", "clkin1";
1499218c80c99a Neil Armstrong      2019-07-29  1682  				mdio-parent-bus = <&mdio0>;
1499218c80c99a Neil Armstrong      2019-07-29  1683  				#address-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  1684  				#size-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  1685  
1499218c80c99a Neil Armstrong      2019-07-29  1686  				ext_mdio: mdio@0 {
1499218c80c99a Neil Armstrong      2019-07-29  1687  					reg = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  1688  					#address-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  1689  					#size-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  1690  				};
1499218c80c99a Neil Armstrong      2019-07-29  1691  
1499218c80c99a Neil Armstrong      2019-07-29  1692  				int_mdio: mdio@1 {
1499218c80c99a Neil Armstrong      2019-07-29  1693  					reg = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  1694  					#address-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  1695  					#size-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  1696  
1499218c80c99a Neil Armstrong      2019-07-29  1697  					internal_ephy: ethernet_phy@8 {
1499218c80c99a Neil Armstrong      2019-07-29  1698  						compatible = "ethernet-phy-id0180.3301",
1499218c80c99a Neil Armstrong      2019-07-29  1699  							     "ethernet-phy-ieee802.3-c22";
1499218c80c99a Neil Armstrong      2019-07-29  1700  						interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
1499218c80c99a Neil Armstrong      2019-07-29  1701  						reg = <8>;
1499218c80c99a Neil Armstrong      2019-07-29  1702  						max-speed = <100>;
1499218c80c99a Neil Armstrong      2019-07-29  1703  					};
1499218c80c99a Neil Armstrong      2019-07-29  1704  				};
1499218c80c99a Neil Armstrong      2019-07-29  1705  			};
1499218c80c99a Neil Armstrong      2019-07-29  1706  		};
1499218c80c99a Neil Armstrong      2019-07-29  1707  
1499218c80c99a Neil Armstrong      2019-07-29  1708  		aobus: bus@ff800000 {
1499218c80c99a Neil Armstrong      2019-07-29  1709  			compatible = "simple-bus";
1499218c80c99a Neil Armstrong      2019-07-29  1710  			reg = <0x0 0xff800000 0x0 0x100000>;
1499218c80c99a Neil Armstrong      2019-07-29  1711  			#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  1712  			#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  1713  			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
1499218c80c99a Neil Armstrong      2019-07-29  1714  
1499218c80c99a Neil Armstrong      2019-07-29  1715  			rti: sys-ctrl@0 {
1499218c80c99a Neil Armstrong      2019-07-29  1716  				compatible = "amlogic,meson-gx-ao-sysctrl",
1499218c80c99a Neil Armstrong      2019-07-29  1717  					     "simple-mfd", "syscon";
1499218c80c99a Neil Armstrong      2019-07-29  1718  				reg = <0x0 0x0 0x0 0x100>;
1499218c80c99a Neil Armstrong      2019-07-29  1719  				#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  1720  				#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  1721  				ranges = <0x0 0x0 0x0 0x0 0x0 0x100>;
1499218c80c99a Neil Armstrong      2019-07-29  1722  
1499218c80c99a Neil Armstrong      2019-07-29  1723  				clkc_AO: clock-controller {
1499218c80c99a Neil Armstrong      2019-07-29  1724  					compatible = "amlogic,meson-g12a-aoclkc";
1499218c80c99a Neil Armstrong      2019-07-29  1725  					#clock-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  1726  					#reset-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  1727  					clocks = <&xtal>, <&clkc CLKID_CLK81>;
1499218c80c99a Neil Armstrong      2019-07-29  1728  					clock-names = "xtal", "mpeg-clk";
1499218c80c99a Neil Armstrong      2019-07-29  1729  				};
1499218c80c99a Neil Armstrong      2019-07-29  1730  
1499218c80c99a Neil Armstrong      2019-07-29  1731  				ao_pinctrl: pinctrl@14 {
1499218c80c99a Neil Armstrong      2019-07-29  1732  					compatible = "amlogic,meson-g12a-aobus-pinctrl";
1499218c80c99a Neil Armstrong      2019-07-29  1733  					#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  1734  					#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  1735  					ranges;
1499218c80c99a Neil Armstrong      2019-07-29  1736  
1499218c80c99a Neil Armstrong      2019-07-29  1737  					gpio_ao: bank@14 {
1499218c80c99a Neil Armstrong      2019-07-29  1738  						reg = <0x0 0x14 0x0 0x8>,
1499218c80c99a Neil Armstrong      2019-07-29  1739  						      <0x0 0x1c 0x0 0x8>,
1499218c80c99a Neil Armstrong      2019-07-29  1740  						      <0x0 0x24 0x0 0x14>;
1499218c80c99a Neil Armstrong      2019-07-29  1741  						reg-names = "mux",
1499218c80c99a Neil Armstrong      2019-07-29  1742  							    "ds",
1499218c80c99a Neil Armstrong      2019-07-29  1743  							    "gpio";
1499218c80c99a Neil Armstrong      2019-07-29  1744  						gpio-controller;
1499218c80c99a Neil Armstrong      2019-07-29  1745  						#gpio-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  1746  						gpio-ranges = <&ao_pinctrl 0 0 15>;
1499218c80c99a Neil Armstrong      2019-07-29  1747  					};
1499218c80c99a Neil Armstrong      2019-07-29  1748  
1499218c80c99a Neil Armstrong      2019-07-29  1749  					i2c_ao_sck_pins: i2c_ao_sck_pins {
1499218c80c99a Neil Armstrong      2019-07-29  1750  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1751  							groups = "i2c_ao_sck";
1499218c80c99a Neil Armstrong      2019-07-29  1752  							function = "i2c_ao";
1499218c80c99a Neil Armstrong      2019-07-29  1753  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1754  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1755  						};
1499218c80c99a Neil Armstrong      2019-07-29  1756  					};
1499218c80c99a Neil Armstrong      2019-07-29  1757  
1499218c80c99a Neil Armstrong      2019-07-29  1758  					i2c_ao_sda_pins: i2c_ao_sda {
1499218c80c99a Neil Armstrong      2019-07-29  1759  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1760  							groups = "i2c_ao_sda";
1499218c80c99a Neil Armstrong      2019-07-29  1761  							function = "i2c_ao";
1499218c80c99a Neil Armstrong      2019-07-29  1762  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1763  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1764  						};
1499218c80c99a Neil Armstrong      2019-07-29  1765  					};
1499218c80c99a Neil Armstrong      2019-07-29  1766  
1499218c80c99a Neil Armstrong      2019-07-29  1767  					i2c_ao_sck_e_pins: i2c_ao_sck_e {
1499218c80c99a Neil Armstrong      2019-07-29  1768  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1769  							groups = "i2c_ao_sck_e";
1499218c80c99a Neil Armstrong      2019-07-29  1770  							function = "i2c_ao";
1499218c80c99a Neil Armstrong      2019-07-29  1771  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1772  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1773  						};
1499218c80c99a Neil Armstrong      2019-07-29  1774  					};
1499218c80c99a Neil Armstrong      2019-07-29  1775  
1499218c80c99a Neil Armstrong      2019-07-29  1776  					i2c_ao_sda_e_pins: i2c_ao_sda_e {
1499218c80c99a Neil Armstrong      2019-07-29  1777  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1778  							groups = "i2c_ao_sda_e";
1499218c80c99a Neil Armstrong      2019-07-29  1779  							function = "i2c_ao";
1499218c80c99a Neil Armstrong      2019-07-29  1780  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1781  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1782  						};
1499218c80c99a Neil Armstrong      2019-07-29  1783  					};
1499218c80c99a Neil Armstrong      2019-07-29  1784  
1499218c80c99a Neil Armstrong      2019-07-29  1785  					mclk0_ao_pins: mclk0-ao {
1499218c80c99a Neil Armstrong      2019-07-29  1786  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1787  							groups = "mclk0_ao";
1499218c80c99a Neil Armstrong      2019-07-29  1788  							function = "mclk0_ao";
1499218c80c99a Neil Armstrong      2019-07-29  1789  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1790  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1791  						};
1499218c80c99a Neil Armstrong      2019-07-29  1792  					};
1499218c80c99a Neil Armstrong      2019-07-29  1793  
1499218c80c99a Neil Armstrong      2019-07-29  1794  					tdm_ao_b_din0_pins: tdm-ao-b-din0 {
1499218c80c99a Neil Armstrong      2019-07-29  1795  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1796  							groups = "tdm_ao_b_din0";
1499218c80c99a Neil Armstrong      2019-07-29  1797  							function = "tdm_ao_b";
1499218c80c99a Neil Armstrong      2019-07-29  1798  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1799  						};
1499218c80c99a Neil Armstrong      2019-07-29  1800  					};
1499218c80c99a Neil Armstrong      2019-07-29  1801  
1499218c80c99a Neil Armstrong      2019-07-29  1802  					spdif_ao_out_pins: spdif-ao-out {
1499218c80c99a Neil Armstrong      2019-07-29  1803  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1804  							groups = "spdif_ao_out";
1499218c80c99a Neil Armstrong      2019-07-29  1805  							function = "spdif_ao_out";
1499218c80c99a Neil Armstrong      2019-07-29  1806  							drive-strength-microamp = <500>;
1499218c80c99a Neil Armstrong      2019-07-29  1807  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1808  						};
1499218c80c99a Neil Armstrong      2019-07-29  1809  					};
1499218c80c99a Neil Armstrong      2019-07-29  1810  
1499218c80c99a Neil Armstrong      2019-07-29  1811  					tdm_ao_b_din1_pins: tdm-ao-b-din1 {
1499218c80c99a Neil Armstrong      2019-07-29  1812  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1813  							groups = "tdm_ao_b_din1";
1499218c80c99a Neil Armstrong      2019-07-29  1814  							function = "tdm_ao_b";
1499218c80c99a Neil Armstrong      2019-07-29  1815  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1816  						};
1499218c80c99a Neil Armstrong      2019-07-29  1817  					};
1499218c80c99a Neil Armstrong      2019-07-29  1818  
1499218c80c99a Neil Armstrong      2019-07-29  1819  					tdm_ao_b_din2_pins: tdm-ao-b-din2 {
1499218c80c99a Neil Armstrong      2019-07-29  1820  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1821  							groups = "tdm_ao_b_din2";
1499218c80c99a Neil Armstrong      2019-07-29  1822  							function = "tdm_ao_b";
1499218c80c99a Neil Armstrong      2019-07-29  1823  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1824  						};
1499218c80c99a Neil Armstrong      2019-07-29  1825  					};
1499218c80c99a Neil Armstrong      2019-07-29  1826  
1499218c80c99a Neil Armstrong      2019-07-29  1827  					tdm_ao_b_dout0_pins: tdm-ao-b-dout0 {
1499218c80c99a Neil Armstrong      2019-07-29  1828  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1829  							groups = "tdm_ao_b_dout0";
1499218c80c99a Neil Armstrong      2019-07-29  1830  							function = "tdm_ao_b";
1499218c80c99a Neil Armstrong      2019-07-29  1831  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1832  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1833  						};
1499218c80c99a Neil Armstrong      2019-07-29  1834  					};
1499218c80c99a Neil Armstrong      2019-07-29  1835  
1499218c80c99a Neil Armstrong      2019-07-29  1836  					tdm_ao_b_dout1_pins: tdm-ao-b-dout1 {
1499218c80c99a Neil Armstrong      2019-07-29  1837  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1838  							groups = "tdm_ao_b_dout1";
1499218c80c99a Neil Armstrong      2019-07-29  1839  							function = "tdm_ao_b";
1499218c80c99a Neil Armstrong      2019-07-29  1840  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1841  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1842  						};
1499218c80c99a Neil Armstrong      2019-07-29  1843  					};
1499218c80c99a Neil Armstrong      2019-07-29  1844  
1499218c80c99a Neil Armstrong      2019-07-29  1845  					tdm_ao_b_dout2_pins: tdm-ao-b-dout2 {
1499218c80c99a Neil Armstrong      2019-07-29  1846  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1847  							groups = "tdm_ao_b_dout2";
1499218c80c99a Neil Armstrong      2019-07-29  1848  							function = "tdm_ao_b";
1499218c80c99a Neil Armstrong      2019-07-29  1849  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1850  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1851  						};
1499218c80c99a Neil Armstrong      2019-07-29  1852  					};
1499218c80c99a Neil Armstrong      2019-07-29  1853  
1499218c80c99a Neil Armstrong      2019-07-29  1854  					tdm_ao_b_fs_pins: tdm-ao-b-fs {
1499218c80c99a Neil Armstrong      2019-07-29  1855  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1856  							groups = "tdm_ao_b_fs";
1499218c80c99a Neil Armstrong      2019-07-29  1857  							function = "tdm_ao_b";
1499218c80c99a Neil Armstrong      2019-07-29  1858  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1859  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1860  						};
1499218c80c99a Neil Armstrong      2019-07-29  1861  					};
1499218c80c99a Neil Armstrong      2019-07-29  1862  
1499218c80c99a Neil Armstrong      2019-07-29  1863  					tdm_ao_b_sclk_pins: tdm-ao-b-sclk {
1499218c80c99a Neil Armstrong      2019-07-29  1864  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1865  							groups = "tdm_ao_b_sclk";
1499218c80c99a Neil Armstrong      2019-07-29  1866  							function = "tdm_ao_b";
1499218c80c99a Neil Armstrong      2019-07-29  1867  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1868  							drive-strength-microamp = <3000>;
1499218c80c99a Neil Armstrong      2019-07-29  1869  						};
1499218c80c99a Neil Armstrong      2019-07-29  1870  					};
1499218c80c99a Neil Armstrong      2019-07-29  1871  
1499218c80c99a Neil Armstrong      2019-07-29  1872  					tdm_ao_b_slv_fs_pins: tdm-ao-b-slv-fs {
1499218c80c99a Neil Armstrong      2019-07-29  1873  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1874  							groups = "tdm_ao_b_slv_fs";
1499218c80c99a Neil Armstrong      2019-07-29  1875  							function = "tdm_ao_b";
1499218c80c99a Neil Armstrong      2019-07-29  1876  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1877  						};
1499218c80c99a Neil Armstrong      2019-07-29  1878  					};
1499218c80c99a Neil Armstrong      2019-07-29  1879  
1499218c80c99a Neil Armstrong      2019-07-29  1880  					tdm_ao_b_slv_sclk_pins: tdm-ao-b-slv-sclk {
1499218c80c99a Neil Armstrong      2019-07-29  1881  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1882  							groups = "tdm_ao_b_slv_sclk";
1499218c80c99a Neil Armstrong      2019-07-29  1883  							function = "tdm_ao_b";
1499218c80c99a Neil Armstrong      2019-07-29  1884  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1885  						};
1499218c80c99a Neil Armstrong      2019-07-29  1886  					};
1499218c80c99a Neil Armstrong      2019-07-29  1887  
7e6e758ca15e9d Lee Seungcheol      2022-02-08  1888  					uart_ao_b_pins: uart-b-ao {
7e6e758ca15e9d Lee Seungcheol      2022-02-08  1889  						mux {
7e6e758ca15e9d Lee Seungcheol      2022-02-08  1890  							groups = "uart_ao_b_tx_8",
7e6e758ca15e9d Lee Seungcheol      2022-02-08  1891  								 "uart_ao_b_rx_9";
7e6e758ca15e9d Lee Seungcheol      2022-02-08  1892  							function = "uart_ao_b";
7e6e758ca15e9d Lee Seungcheol      2022-02-08  1893  							bias-disable;
7e6e758ca15e9d Lee Seungcheol      2022-02-08  1894  						};
7e6e758ca15e9d Lee Seungcheol      2022-02-08  1895  					};
7e6e758ca15e9d Lee Seungcheol      2022-02-08  1896  
1499218c80c99a Neil Armstrong      2019-07-29  1897  					uart_ao_a_pins: uart-a-ao {
1499218c80c99a Neil Armstrong      2019-07-29  1898  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1899  							groups = "uart_ao_a_tx",
1499218c80c99a Neil Armstrong      2019-07-29  1900  								 "uart_ao_a_rx";
1499218c80c99a Neil Armstrong      2019-07-29  1901  							function = "uart_ao_a";
1499218c80c99a Neil Armstrong      2019-07-29  1902  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1903  						};
1499218c80c99a Neil Armstrong      2019-07-29  1904  					};
1499218c80c99a Neil Armstrong      2019-07-29  1905  
1499218c80c99a Neil Armstrong      2019-07-29  1906  					uart_ao_a_cts_rts_pins: uart-ao-a-cts-rts {
1499218c80c99a Neil Armstrong      2019-07-29  1907  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1908  							groups = "uart_ao_a_cts",
1499218c80c99a Neil Armstrong      2019-07-29  1909  								 "uart_ao_a_rts";
1499218c80c99a Neil Armstrong      2019-07-29  1910  							function = "uart_ao_a";
1499218c80c99a Neil Armstrong      2019-07-29  1911  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1912  						};
1499218c80c99a Neil Armstrong      2019-07-29  1913  					};
1499218c80c99a Neil Armstrong      2019-07-29  1914  
2c420d79dae47f Gary Bisson         2022-01-12  1915  					uart_ao_b_2_3_pins: uart-ao-b-2-3 {
2c420d79dae47f Gary Bisson         2022-01-12  1916  						mux {
2c420d79dae47f Gary Bisson         2022-01-12  1917  							groups = "uart_ao_b_tx_2",
2c420d79dae47f Gary Bisson         2022-01-12  1918  								 "uart_ao_b_rx_3";
2c420d79dae47f Gary Bisson         2022-01-12  1919  							function = "uart_ao_b";
2c420d79dae47f Gary Bisson         2022-01-12  1920  							bias-disable;
2c420d79dae47f Gary Bisson         2022-01-12  1921  						};
2c420d79dae47f Gary Bisson         2022-01-12  1922  					};
2c420d79dae47f Gary Bisson         2022-01-12  1923  
2c420d79dae47f Gary Bisson         2022-01-12  1924  					uart_ao_b_8_9_pins: uart-ao-b-8-9 {
2c420d79dae47f Gary Bisson         2022-01-12  1925  						mux {
2c420d79dae47f Gary Bisson         2022-01-12  1926  							groups = "uart_ao_b_tx_8",
2c420d79dae47f Gary Bisson         2022-01-12  1927  								 "uart_ao_b_rx_9";
2c420d79dae47f Gary Bisson         2022-01-12  1928  							function = "uart_ao_b";
2c420d79dae47f Gary Bisson         2022-01-12  1929  							bias-disable;
2c420d79dae47f Gary Bisson         2022-01-12  1930  						};
2c420d79dae47f Gary Bisson         2022-01-12  1931  					};
2c420d79dae47f Gary Bisson         2022-01-12  1932  
2c420d79dae47f Gary Bisson         2022-01-12  1933  					uart_ao_b_cts_rts_pins: uart-ao-b-cts-rts {
2c420d79dae47f Gary Bisson         2022-01-12  1934  						mux {
2c420d79dae47f Gary Bisson         2022-01-12  1935  							groups = "uart_ao_b_cts",
2c420d79dae47f Gary Bisson         2022-01-12  1936  								 "uart_ao_b_rts";
2c420d79dae47f Gary Bisson         2022-01-12  1937  							function = "uart_ao_b";
2c420d79dae47f Gary Bisson         2022-01-12  1938  							bias-disable;
2c420d79dae47f Gary Bisson         2022-01-12  1939  						};
2c420d79dae47f Gary Bisson         2022-01-12  1940  					};
2c420d79dae47f Gary Bisson         2022-01-12  1941  
cca30c891247fc Neil Armstrong      2019-07-29  1942  					pwm_a_e_pins: pwm-a-e {
cca30c891247fc Neil Armstrong      2019-07-29  1943  						mux {
cca30c891247fc Neil Armstrong      2019-07-29  1944  							groups = "pwm_a_e";
cca30c891247fc Neil Armstrong      2019-07-29  1945  							function = "pwm_a_e";
cca30c891247fc Neil Armstrong      2019-07-29  1946  							bias-disable;
cca30c891247fc Neil Armstrong      2019-07-29  1947  						};
cca30c891247fc Neil Armstrong      2019-07-29  1948  					};
cca30c891247fc Neil Armstrong      2019-07-29  1949  
1499218c80c99a Neil Armstrong      2019-07-29  1950  					pwm_ao_a_pins: pwm-ao-a {
1499218c80c99a Neil Armstrong      2019-07-29  1951  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1952  							groups = "pwm_ao_a";
1499218c80c99a Neil Armstrong      2019-07-29  1953  							function = "pwm_ao_a";
1499218c80c99a Neil Armstrong      2019-07-29  1954  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1955  						};
1499218c80c99a Neil Armstrong      2019-07-29  1956  					};
1499218c80c99a Neil Armstrong      2019-07-29  1957  
1499218c80c99a Neil Armstrong      2019-07-29  1958  					pwm_ao_b_pins: pwm-ao-b {
1499218c80c99a Neil Armstrong      2019-07-29  1959  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1960  							groups = "pwm_ao_b";
1499218c80c99a Neil Armstrong      2019-07-29  1961  							function = "pwm_ao_b";
1499218c80c99a Neil Armstrong      2019-07-29  1962  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1963  						};
1499218c80c99a Neil Armstrong      2019-07-29  1964  					};
1499218c80c99a Neil Armstrong      2019-07-29  1965  
1499218c80c99a Neil Armstrong      2019-07-29  1966  					pwm_ao_c_4_pins: pwm-ao-c-4 {
1499218c80c99a Neil Armstrong      2019-07-29  1967  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1968  							groups = "pwm_ao_c_4";
1499218c80c99a Neil Armstrong      2019-07-29  1969  							function = "pwm_ao_c";
1499218c80c99a Neil Armstrong      2019-07-29  1970  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1971  						};
1499218c80c99a Neil Armstrong      2019-07-29  1972  					};
1499218c80c99a Neil Armstrong      2019-07-29  1973  
1499218c80c99a Neil Armstrong      2019-07-29  1974  					pwm_ao_c_6_pins: pwm-ao-c-6 {
1499218c80c99a Neil Armstrong      2019-07-29  1975  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1976  							groups = "pwm_ao_c_6";
1499218c80c99a Neil Armstrong      2019-07-29  1977  							function = "pwm_ao_c";
1499218c80c99a Neil Armstrong      2019-07-29  1978  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1979  						};
1499218c80c99a Neil Armstrong      2019-07-29  1980  					};
1499218c80c99a Neil Armstrong      2019-07-29  1981  
1499218c80c99a Neil Armstrong      2019-07-29  1982  					pwm_ao_d_5_pins: pwm-ao-d-5 {
1499218c80c99a Neil Armstrong      2019-07-29  1983  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1984  							groups = "pwm_ao_d_5";
1499218c80c99a Neil Armstrong      2019-07-29  1985  							function = "pwm_ao_d";
1499218c80c99a Neil Armstrong      2019-07-29  1986  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1987  						};
1499218c80c99a Neil Armstrong      2019-07-29  1988  					};
1499218c80c99a Neil Armstrong      2019-07-29  1989  
1499218c80c99a Neil Armstrong      2019-07-29  1990  					pwm_ao_d_10_pins: pwm-ao-d-10 {
1499218c80c99a Neil Armstrong      2019-07-29  1991  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  1992  							groups = "pwm_ao_d_10";
1499218c80c99a Neil Armstrong      2019-07-29  1993  							function = "pwm_ao_d";
1499218c80c99a Neil Armstrong      2019-07-29  1994  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  1995  						};
1499218c80c99a Neil Armstrong      2019-07-29  1996  					};
1499218c80c99a Neil Armstrong      2019-07-29  1997  
1499218c80c99a Neil Armstrong      2019-07-29  1998  					pwm_ao_d_e_pins: pwm-ao-d-e {
1499218c80c99a Neil Armstrong      2019-07-29  1999  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  2000  							groups = "pwm_ao_d_e";
1499218c80c99a Neil Armstrong      2019-07-29  2001  							function = "pwm_ao_d";
1499218c80c99a Neil Armstrong      2019-07-29  2002  						};
1499218c80c99a Neil Armstrong      2019-07-29  2003  					};
1499218c80c99a Neil Armstrong      2019-07-29  2004  
1499218c80c99a Neil Armstrong      2019-07-29  2005  					remote_input_ao_pins: remote-input-ao {
1499218c80c99a Neil Armstrong      2019-07-29  2006  						mux {
1499218c80c99a Neil Armstrong      2019-07-29  2007  							groups = "remote_ao_input";
1499218c80c99a Neil Armstrong      2019-07-29  2008  							function = "remote_ao_input";
1499218c80c99a Neil Armstrong      2019-07-29  2009  							bias-disable;
1499218c80c99a Neil Armstrong      2019-07-29  2010  						};
1499218c80c99a Neil Armstrong      2019-07-29  2011  					};
1499218c80c99a Neil Armstrong      2019-07-29  2012  				};
1499218c80c99a Neil Armstrong      2019-07-29  2013  			};
1499218c80c99a Neil Armstrong      2019-07-29  2014  
d9421d6c52942b Kevin Hilman        2021-04-21  2015  			vrtc: rtc@a8 {
a833a15e596905 Kevin Hilman        2019-08-07  2016  				compatible = "amlogic,meson-vrtc";
a833a15e596905 Kevin Hilman        2019-08-07  2017  				reg = <0x0 0x000a8 0x0 0x4>;
a833a15e596905 Kevin Hilman        2019-08-07  2018  			};
a833a15e596905 Kevin Hilman        2019-08-07  2019  
1499218c80c99a Neil Armstrong      2019-07-29  2020  			cec_AO: cec@100 {
1499218c80c99a Neil Armstrong      2019-07-29  2021  				compatible = "amlogic,meson-gx-ao-cec";
1499218c80c99a Neil Armstrong      2019-07-29  2022  				reg = <0x0 0x00100 0x0 0x14>;
1499218c80c99a Neil Armstrong      2019-07-29  2023  				interrupts = <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2024  				clocks = <&clkc_AO CLKID_AO_CEC>;
1499218c80c99a Neil Armstrong      2019-07-29  2025  				clock-names = "core";
1499218c80c99a Neil Armstrong      2019-07-29  2026  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2027  			};
1499218c80c99a Neil Armstrong      2019-07-29  2028  
1499218c80c99a Neil Armstrong      2019-07-29  2029  			sec_AO: ao-secure@140 {
1499218c80c99a Neil Armstrong      2019-07-29  2030  				compatible = "amlogic,meson-gx-ao-secure", "syscon";
1499218c80c99a Neil Armstrong      2019-07-29  2031  				reg = <0x0 0x140 0x0 0x140>;
1499218c80c99a Neil Armstrong      2019-07-29  2032  				amlogic,has-chip-id;
1499218c80c99a Neil Armstrong      2019-07-29  2033  			};
1499218c80c99a Neil Armstrong      2019-07-29  2034  
1499218c80c99a Neil Armstrong      2019-07-29  2035  			cecb_AO: cec@280 {
1499218c80c99a Neil Armstrong      2019-07-29  2036  				compatible = "amlogic,meson-g12a-ao-cec";
1499218c80c99a Neil Armstrong      2019-07-29  2037  				reg = <0x0 0x00280 0x0 0x1c>;
1499218c80c99a Neil Armstrong      2019-07-29  2038  				interrupts = <GIC_SPI 203 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2039  				clocks = <&clkc_AO CLKID_AO_CTS_OSCIN>;
1499218c80c99a Neil Armstrong      2019-07-29  2040  				clock-names = "oscin";
1499218c80c99a Neil Armstrong      2019-07-29  2041  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2042  			};
1499218c80c99a Neil Armstrong      2019-07-29  2043  
1499218c80c99a Neil Armstrong      2019-07-29  2044  			pwm_AO_cd: pwm@2000 {
1499218c80c99a Neil Armstrong      2019-07-29  2045  				compatible = "amlogic,meson-g12a-ao-pwm-cd";
1499218c80c99a Neil Armstrong      2019-07-29  2046  				reg = <0x0 0x2000 0x0 0x20>;
1499218c80c99a Neil Armstrong      2019-07-29  2047  				#pwm-cells = <3>;
1499218c80c99a Neil Armstrong      2019-07-29  2048  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2049  			};
1499218c80c99a Neil Armstrong      2019-07-29  2050  
1499218c80c99a Neil Armstrong      2019-07-29  2051  			uart_AO: serial@3000 {
1499218c80c99a Neil Armstrong      2019-07-29  2052  				compatible = "amlogic,meson-gx-uart",
1499218c80c99a Neil Armstrong      2019-07-29  2053  					     "amlogic,meson-ao-uart";
1499218c80c99a Neil Armstrong      2019-07-29  2054  				reg = <0x0 0x3000 0x0 0x18>;
1499218c80c99a Neil Armstrong      2019-07-29  2055  				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2056  				clocks = <&xtal>, <&clkc_AO CLKID_AO_UART>, <&xtal>;
1499218c80c99a Neil Armstrong      2019-07-29  2057  				clock-names = "xtal", "pclk", "baud";
1499218c80c99a Neil Armstrong      2019-07-29  2058  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2059  			};
1499218c80c99a Neil Armstrong      2019-07-29  2060  
1499218c80c99a Neil Armstrong      2019-07-29  2061  			uart_AO_B: serial@4000 {
1499218c80c99a Neil Armstrong      2019-07-29  2062  				compatible = "amlogic,meson-gx-uart",
1499218c80c99a Neil Armstrong      2019-07-29  2063  					     "amlogic,meson-ao-uart";
1499218c80c99a Neil Armstrong      2019-07-29  2064  				reg = <0x0 0x4000 0x0 0x18>;
1499218c80c99a Neil Armstrong      2019-07-29  2065  				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2066  				clocks = <&xtal>, <&clkc_AO CLKID_AO_UART2>, <&xtal>;
1499218c80c99a Neil Armstrong      2019-07-29  2067  				clock-names = "xtal", "pclk", "baud";
1499218c80c99a Neil Armstrong      2019-07-29  2068  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2069  			};
1499218c80c99a Neil Armstrong      2019-07-29  2070  
1499218c80c99a Neil Armstrong      2019-07-29  2071  			i2c_AO: i2c@5000 {
1499218c80c99a Neil Armstrong      2019-07-29  2072  				compatible = "amlogic,meson-axg-i2c";
1499218c80c99a Neil Armstrong      2019-07-29  2073  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2074  				reg = <0x0 0x05000 0x0 0x20>;
1499218c80c99a Neil Armstrong      2019-07-29  2075  				interrupts = <GIC_SPI 195 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2076  				#address-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  2077  				#size-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  2078  				clocks = <&clkc CLKID_I2C>;
1499218c80c99a Neil Armstrong      2019-07-29  2079  			};
1499218c80c99a Neil Armstrong      2019-07-29  2080  
1499218c80c99a Neil Armstrong      2019-07-29  2081  			pwm_AO_ab: pwm@7000 {
1499218c80c99a Neil Armstrong      2019-07-29  2082  				compatible = "amlogic,meson-g12a-ao-pwm-ab";
1499218c80c99a Neil Armstrong      2019-07-29  2083  				reg = <0x0 0x7000 0x0 0x20>;
1499218c80c99a Neil Armstrong      2019-07-29  2084  				#pwm-cells = <3>;
1499218c80c99a Neil Armstrong      2019-07-29  2085  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2086  			};
1499218c80c99a Neil Armstrong      2019-07-29  2087  
1499218c80c99a Neil Armstrong      2019-07-29  2088  			ir: ir@8000 {
1499218c80c99a Neil Armstrong      2019-07-29  2089  				compatible = "amlogic,meson-gxbb-ir";
1499218c80c99a Neil Armstrong      2019-07-29  2090  				reg = <0x0 0x8000 0x0 0x20>;
1499218c80c99a Neil Armstrong      2019-07-29  2091  				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2092  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2093  			};
1499218c80c99a Neil Armstrong      2019-07-29  2094  
1499218c80c99a Neil Armstrong      2019-07-29  2095  			saradc: adc@9000 {
1499218c80c99a Neil Armstrong      2019-07-29  2096  				compatible = "amlogic,meson-g12a-saradc",
1499218c80c99a Neil Armstrong      2019-07-29  2097  					     "amlogic,meson-saradc";
1499218c80c99a Neil Armstrong      2019-07-29  2098  				reg = <0x0 0x9000 0x0 0x48>;
1499218c80c99a Neil Armstrong      2019-07-29  2099  				#io-channel-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  2100  				interrupts = <GIC_SPI 200 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2101  				clocks = <&xtal>,
1499218c80c99a Neil Armstrong      2019-07-29  2102  					 <&clkc_AO CLKID_AO_SAR_ADC>,
1499218c80c99a Neil Armstrong      2019-07-29  2103  					 <&clkc_AO CLKID_AO_SAR_ADC_CLK>,
1499218c80c99a Neil Armstrong      2019-07-29  2104  					 <&clkc_AO CLKID_AO_SAR_ADC_SEL>;
1499218c80c99a Neil Armstrong      2019-07-29  2105  				clock-names = "clkin", "core", "adc_clk", "adc_sel";
1499218c80c99a Neil Armstrong      2019-07-29  2106  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2107  			};
1499218c80c99a Neil Armstrong      2019-07-29  2108  		};
1499218c80c99a Neil Armstrong      2019-07-29  2109  
fbceee82c19a42 Maxime Jourdan      2019-11-20  2110  		vdec: video-decoder@ff620000 {
fbceee82c19a42 Maxime Jourdan      2019-11-20  2111  			compatible = "amlogic,g12a-vdec";
fbceee82c19a42 Maxime Jourdan      2019-11-20  2112  			reg = <0x0 0xff620000 0x0 0x10000>,
fbceee82c19a42 Maxime Jourdan      2019-11-20  2113  			      <0x0 0xffd0e180 0x0 0xe4>;
fbceee82c19a42 Maxime Jourdan      2019-11-20  2114  			reg-names = "dos", "esparser";
fbceee82c19a42 Maxime Jourdan      2019-11-20  2115  			interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING>,
fbceee82c19a42 Maxime Jourdan      2019-11-20  2116  				     <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
fbceee82c19a42 Maxime Jourdan      2019-11-20  2117  			interrupt-names = "vdec", "esparser";
fbceee82c19a42 Maxime Jourdan      2019-11-20  2118  
fbceee82c19a42 Maxime Jourdan      2019-11-20  2119  			amlogic,ao-sysctrl = <&rti>;
fbceee82c19a42 Maxime Jourdan      2019-11-20  2120  			amlogic,canvas = <&canvas>;
fbceee82c19a42 Maxime Jourdan      2019-11-20  2121  
fbceee82c19a42 Maxime Jourdan      2019-11-20  2122  			clocks = <&clkc CLKID_PARSER>,
fbceee82c19a42 Maxime Jourdan      2019-11-20  2123  				 <&clkc CLKID_DOS>,
fbceee82c19a42 Maxime Jourdan      2019-11-20  2124  				 <&clkc CLKID_VDEC_1>,
fbceee82c19a42 Maxime Jourdan      2019-11-20  2125  				 <&clkc CLKID_VDEC_HEVC>,
fbceee82c19a42 Maxime Jourdan      2019-11-20  2126  				 <&clkc CLKID_VDEC_HEVCF>;
fbceee82c19a42 Maxime Jourdan      2019-11-20  2127  			clock-names = "dos_parser", "dos", "vdec_1",
fbceee82c19a42 Maxime Jourdan      2019-11-20  2128  				      "vdec_hevc", "vdec_hevcf";
fbceee82c19a42 Maxime Jourdan      2019-11-20  2129  			resets = <&reset RESET_PARSER>;
fbceee82c19a42 Maxime Jourdan      2019-11-20  2130  			reset-names = "esparser";
fbceee82c19a42 Maxime Jourdan      2019-11-20  2131  		};
fbceee82c19a42 Maxime Jourdan      2019-11-20  2132  
1499218c80c99a Neil Armstrong      2019-07-29  2133  		vpu: vpu@ff900000 {
1499218c80c99a Neil Armstrong      2019-07-29  2134  			compatible = "amlogic,meson-g12a-vpu";
1499218c80c99a Neil Armstrong      2019-07-29  2135  			reg = <0x0 0xff900000 0x0 0x100000>,
1499218c80c99a Neil Armstrong      2019-07-29  2136  			      <0x0 0xff63c000 0x0 0x1000>;
1499218c80c99a Neil Armstrong      2019-07-29  2137  			reg-names = "vpu", "hhi";
1499218c80c99a Neil Armstrong      2019-07-29  2138  			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2139  			#address-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  2140  			#size-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  2141  			amlogic,canvas = <&canvas>;
1499218c80c99a Neil Armstrong      2019-07-29  2142  
1499218c80c99a Neil Armstrong      2019-07-29  2143  			/* CVBS VDAC output port */
1499218c80c99a Neil Armstrong      2019-07-29  2144  			cvbs_vdac_port: port@0 {
1499218c80c99a Neil Armstrong      2019-07-29  2145  				reg = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  2146  			};
1499218c80c99a Neil Armstrong      2019-07-29  2147  
1499218c80c99a Neil Armstrong      2019-07-29  2148  			/* HDMI-TX output port */
1499218c80c99a Neil Armstrong      2019-07-29  2149  			hdmi_tx_port: port@1 {
1499218c80c99a Neil Armstrong      2019-07-29  2150  				reg = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  2151  
1499218c80c99a Neil Armstrong      2019-07-29  2152  				hdmi_tx_out: endpoint {
1499218c80c99a Neil Armstrong      2019-07-29  2153  					remote-endpoint = <&hdmi_tx_in>;
1499218c80c99a Neil Armstrong      2019-07-29  2154  				};
1499218c80c99a Neil Armstrong      2019-07-29  2155  			};
1499218c80c99a Neil Armstrong      2019-07-29  2156  		};
1499218c80c99a Neil Armstrong      2019-07-29  2157  
1499218c80c99a Neil Armstrong      2019-07-29  2158  		gic: interrupt-controller@ffc01000 {
1499218c80c99a Neil Armstrong      2019-07-29  2159  			compatible = "arm,gic-400";
1499218c80c99a Neil Armstrong      2019-07-29  2160  			reg = <0x0 0xffc01000 0 0x1000>,
1499218c80c99a Neil Armstrong      2019-07-29  2161  			      <0x0 0xffc02000 0 0x2000>,
1499218c80c99a Neil Armstrong      2019-07-29  2162  			      <0x0 0xffc04000 0 0x2000>,
1499218c80c99a Neil Armstrong      2019-07-29  2163  			      <0x0 0xffc06000 0 0x2000>;
1499218c80c99a Neil Armstrong      2019-07-29  2164  			interrupt-controller;
1499218c80c99a Neil Armstrong      2019-07-29  2165  			interrupts = <GIC_PPI 9
1499218c80c99a Neil Armstrong      2019-07-29  2166  				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
1499218c80c99a Neil Armstrong      2019-07-29  2167  			#interrupt-cells = <3>;
1499218c80c99a Neil Armstrong      2019-07-29  2168  			#address-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  2169  		};
1499218c80c99a Neil Armstrong      2019-07-29  2170  
1499218c80c99a Neil Armstrong      2019-07-29  2171  		cbus: bus@ffd00000 {
1499218c80c99a Neil Armstrong      2019-07-29  2172  			compatible = "simple-bus";
1499218c80c99a Neil Armstrong      2019-07-29  2173  			reg = <0x0 0xffd00000 0x0 0x100000>;
1499218c80c99a Neil Armstrong      2019-07-29  2174  			#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  2175  			#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  2176  			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x100000>;
1499218c80c99a Neil Armstrong      2019-07-29  2177  
1499218c80c99a Neil Armstrong      2019-07-29  2178  			reset: reset-controller@1004 {
795e7de8c7afc2 Neil Armstrong      2019-08-23  2179  				compatible = "amlogic,meson-axg-reset";
1499218c80c99a Neil Armstrong      2019-07-29  2180  				reg = <0x0 0x1004 0x0 0x9c>;
1499218c80c99a Neil Armstrong      2019-07-29  2181  				#reset-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  2182  			};
1499218c80c99a Neil Armstrong      2019-07-29  2183  
1499218c80c99a Neil Armstrong      2019-07-29  2184  			gpio_intc: interrupt-controller@f080 {
1499218c80c99a Neil Armstrong      2019-07-29  2185  				compatible = "amlogic,meson-g12a-gpio-intc",
1499218c80c99a Neil Armstrong      2019-07-29  2186  					     "amlogic,meson-gpio-intc";
1499218c80c99a Neil Armstrong      2019-07-29  2187  				reg = <0x0 0xf080 0x0 0x10>;
1499218c80c99a Neil Armstrong      2019-07-29  2188  				interrupt-controller;
1499218c80c99a Neil Armstrong      2019-07-29  2189  				#interrupt-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  2190  				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
1499218c80c99a Neil Armstrong      2019-07-29  2191  			};
1499218c80c99a Neil Armstrong      2019-07-29  2192  
d9421d6c52942b Kevin Hilman        2021-04-21  2193  			watchdog: watchdog@f0d0 {
7bd5175918eb4b Christian Hewitt    2020-11-01  2194  				compatible = "amlogic,meson-gxbb-wdt";
7bd5175918eb4b Christian Hewitt    2020-11-01  2195  				reg = <0x0 0xf0d0 0x0 0x10>;
7bd5175918eb4b Christian Hewitt    2020-11-01  2196  				clocks = <&xtal>;
7bd5175918eb4b Christian Hewitt    2020-11-01  2197  			};
7bd5175918eb4b Christian Hewitt    2020-11-01  2198  
5fa86f4f72e049 Neil Armstrong      2020-03-13  2199  			spicc0: spi@13000 {
5fa86f4f72e049 Neil Armstrong      2020-03-13  2200  				compatible = "amlogic,meson-g12a-spicc";
5fa86f4f72e049 Neil Armstrong      2020-03-13  2201  				reg = <0x0 0x13000 0x0 0x44>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  2202  				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  2203  				clocks = <&clkc CLKID_SPICC0>,
5fa86f4f72e049 Neil Armstrong      2020-03-13  2204  					 <&clkc CLKID_SPICC0_SCLK>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  2205  				clock-names = "core", "pclk";
5fa86f4f72e049 Neil Armstrong      2020-03-13  2206  				#address-cells = <1>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  2207  				#size-cells = <0>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  2208  				status = "disabled";
5fa86f4f72e049 Neil Armstrong      2020-03-13  2209  			};
5fa86f4f72e049 Neil Armstrong      2020-03-13  2210  
5fa86f4f72e049 Neil Armstrong      2020-03-13  2211  			spicc1: spi@15000 {
5fa86f4f72e049 Neil Armstrong      2020-03-13  2212  				compatible = "amlogic,meson-g12a-spicc";
5fa86f4f72e049 Neil Armstrong      2020-03-13  2213  				reg = <0x0 0x15000 0x0 0x44>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  2214  				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  2215  				clocks = <&clkc CLKID_SPICC1>,
5fa86f4f72e049 Neil Armstrong      2020-03-13  2216  					 <&clkc CLKID_SPICC1_SCLK>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  2217  				clock-names = "core", "pclk";
5fa86f4f72e049 Neil Armstrong      2020-03-13  2218  				#address-cells = <1>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  2219  				#size-cells = <0>;
5fa86f4f72e049 Neil Armstrong      2020-03-13  2220  				status = "disabled";
5fa86f4f72e049 Neil Armstrong      2020-03-13  2221  			};
5fa86f4f72e049 Neil Armstrong      2020-03-13  2222  
f12a463d2f43b9 Neil Armstrong      2020-03-13  2223  			spifc: spi@14000 {
f12a463d2f43b9 Neil Armstrong      2020-03-13  2224  				compatible = "amlogic,meson-gxbb-spifc";
f12a463d2f43b9 Neil Armstrong      2020-03-13  2225  				status = "disabled";
f12a463d2f43b9 Neil Armstrong      2020-03-13  2226  				reg = <0x0 0x14000 0x0 0x80>;
f12a463d2f43b9 Neil Armstrong      2020-03-13  2227  				#address-cells = <1>;
f12a463d2f43b9 Neil Armstrong      2020-03-13  2228  				#size-cells = <0>;
f12a463d2f43b9 Neil Armstrong      2020-03-13  2229  				clocks = <&clkc CLKID_CLK81>;
f12a463d2f43b9 Neil Armstrong      2020-03-13  2230  			};
f12a463d2f43b9 Neil Armstrong      2020-03-13  2231  
1499218c80c99a Neil Armstrong      2019-07-29  2232  			pwm_ef: pwm@19000 {
1499218c80c99a Neil Armstrong      2019-07-29  2233  				compatible = "amlogic,meson-g12a-ee-pwm";
1499218c80c99a Neil Armstrong      2019-07-29  2234  				reg = <0x0 0x19000 0x0 0x20>;
1499218c80c99a Neil Armstrong      2019-07-29  2235  				#pwm-cells = <3>;
1499218c80c99a Neil Armstrong      2019-07-29  2236  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2237  			};
1499218c80c99a Neil Armstrong      2019-07-29  2238  
1499218c80c99a Neil Armstrong      2019-07-29  2239  			pwm_cd: pwm@1a000 {
1499218c80c99a Neil Armstrong      2019-07-29  2240  				compatible = "amlogic,meson-g12a-ee-pwm";
1499218c80c99a Neil Armstrong      2019-07-29  2241  				reg = <0x0 0x1a000 0x0 0x20>;
1499218c80c99a Neil Armstrong      2019-07-29  2242  				#pwm-cells = <3>;
1499218c80c99a Neil Armstrong      2019-07-29  2243  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2244  			};
1499218c80c99a Neil Armstrong      2019-07-29  2245  
1499218c80c99a Neil Armstrong      2019-07-29  2246  			pwm_ab: pwm@1b000 {
1499218c80c99a Neil Armstrong      2019-07-29  2247  				compatible = "amlogic,meson-g12a-ee-pwm";
1499218c80c99a Neil Armstrong      2019-07-29  2248  				reg = <0x0 0x1b000 0x0 0x20>;
1499218c80c99a Neil Armstrong      2019-07-29  2249  				#pwm-cells = <3>;
1499218c80c99a Neil Armstrong      2019-07-29  2250  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2251  			};
1499218c80c99a Neil Armstrong      2019-07-29  2252  
1499218c80c99a Neil Armstrong      2019-07-29 @2253  			i2c3: i2c@1c000 {
1499218c80c99a Neil Armstrong      2019-07-29  2254  				compatible = "amlogic,meson-axg-i2c";
1499218c80c99a Neil Armstrong      2019-07-29  2255  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2256  				reg = <0x0 0x1c000 0x0 0x20>;
1499218c80c99a Neil Armstrong      2019-07-29  2257  				interrupts = <GIC_SPI 39 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2258  				#address-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  2259  				#size-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  2260  				clocks = <&clkc CLKID_I2C>;
1499218c80c99a Neil Armstrong      2019-07-29  2261  			};
1499218c80c99a Neil Armstrong      2019-07-29  2262  
1499218c80c99a Neil Armstrong      2019-07-29  2263  			i2c2: i2c@1d000 {
1499218c80c99a Neil Armstrong      2019-07-29  2264  				compatible = "amlogic,meson-axg-i2c";
1499218c80c99a Neil Armstrong      2019-07-29  2265  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2266  				reg = <0x0 0x1d000 0x0 0x20>;
1499218c80c99a Neil Armstrong      2019-07-29  2267  				interrupts = <GIC_SPI 215 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2268  				#address-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  2269  				#size-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  2270  				clocks = <&clkc CLKID_I2C>;
1499218c80c99a Neil Armstrong      2019-07-29  2271  			};
1499218c80c99a Neil Armstrong      2019-07-29  2272  
1499218c80c99a Neil Armstrong      2019-07-29  2273  			i2c1: i2c@1e000 {
1499218c80c99a Neil Armstrong      2019-07-29  2274  				compatible = "amlogic,meson-axg-i2c";
1499218c80c99a Neil Armstrong      2019-07-29  2275  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2276  				reg = <0x0 0x1e000 0x0 0x20>;
1499218c80c99a Neil Armstrong      2019-07-29  2277  				interrupts = <GIC_SPI 214 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2278  				#address-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  2279  				#size-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  2280  				clocks = <&clkc CLKID_I2C>;
1499218c80c99a Neil Armstrong      2019-07-29  2281  			};
1499218c80c99a Neil Armstrong      2019-07-29  2282  
1499218c80c99a Neil Armstrong      2019-07-29  2283  			i2c0: i2c@1f000 {
1499218c80c99a Neil Armstrong      2019-07-29  2284  				compatible = "amlogic,meson-axg-i2c";
1499218c80c99a Neil Armstrong      2019-07-29  2285  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2286  				reg = <0x0 0x1f000 0x0 0x20>;
1499218c80c99a Neil Armstrong      2019-07-29  2287  				interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2288  				#address-cells = <1>;
1499218c80c99a Neil Armstrong      2019-07-29  2289  				#size-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  2290  				clocks = <&clkc CLKID_I2C>;
1499218c80c99a Neil Armstrong      2019-07-29  2291  			};
1499218c80c99a Neil Armstrong      2019-07-29  2292  
1499218c80c99a Neil Armstrong      2019-07-29  2293  			clk_msr: clock-measure@18000 {
1499218c80c99a Neil Armstrong      2019-07-29  2294  				compatible = "amlogic,meson-g12a-clk-measure";
1499218c80c99a Neil Armstrong      2019-07-29  2295  				reg = <0x0 0x18000 0x0 0x10>;
1499218c80c99a Neil Armstrong      2019-07-29  2296  			};
1499218c80c99a Neil Armstrong      2019-07-29  2297  
1499218c80c99a Neil Armstrong      2019-07-29  2298  			uart_C: serial@22000 {
1499218c80c99a Neil Armstrong      2019-07-29  2299  				compatible = "amlogic,meson-gx-uart";
1499218c80c99a Neil Armstrong      2019-07-29  2300  				reg = <0x0 0x22000 0x0 0x18>;
1499218c80c99a Neil Armstrong      2019-07-29  2301  				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2302  				clocks = <&xtal>, <&clkc CLKID_UART2>, <&xtal>;
1499218c80c99a Neil Armstrong      2019-07-29  2303  				clock-names = "xtal", "pclk", "baud";
1499218c80c99a Neil Armstrong      2019-07-29  2304  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2305  			};
1499218c80c99a Neil Armstrong      2019-07-29  2306  
1499218c80c99a Neil Armstrong      2019-07-29  2307  			uart_B: serial@23000 {
1499218c80c99a Neil Armstrong      2019-07-29  2308  				compatible = "amlogic,meson-gx-uart";
1499218c80c99a Neil Armstrong      2019-07-29  2309  				reg = <0x0 0x23000 0x0 0x18>;
1499218c80c99a Neil Armstrong      2019-07-29  2310  				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2311  				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
1499218c80c99a Neil Armstrong      2019-07-29  2312  				clock-names = "xtal", "pclk", "baud";
1499218c80c99a Neil Armstrong      2019-07-29  2313  				status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2314  			};
1499218c80c99a Neil Armstrong      2019-07-29  2315  
1499218c80c99a Neil Armstrong      2019-07-29  2316  			uart_A: serial@24000 {
1499218c80c99a Neil Armstrong      2019-07-29  2317  				compatible = "amlogic,meson-gx-uart";
1499218c80c99a Neil Armstrong      2019-07-29  2318  				reg = <0x0 0x24000 0x0 0x18>;
1499218c80c99a Neil Armstrong      2019-07-29  2319  				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2320  				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
1499218c80c99a Neil Armstrong      2019-07-29  2321  				clock-names = "xtal", "pclk", "baud";
1499218c80c99a Neil Armstrong      2019-07-29  2322  				status = "disabled";
a270a2b24de5be Neil Armstrong      2021-05-18  2323  				fifo-size = <128>;
1499218c80c99a Neil Armstrong      2019-07-29  2324  			};
1499218c80c99a Neil Armstrong      2019-07-29  2325  		};
1499218c80c99a Neil Armstrong      2019-07-29  2326  
1499218c80c99a Neil Armstrong      2019-07-29  2327  		sd_emmc_a: sd@ffe03000 {
1499218c80c99a Neil Armstrong      2019-07-29  2328  			compatible = "amlogic,meson-axg-mmc";
1499218c80c99a Neil Armstrong      2019-07-29  2329  			reg = <0x0 0xffe03000 0x0 0x800>;
1499218c80c99a Neil Armstrong      2019-07-29  2330  			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2331  			status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2332  			clocks = <&clkc CLKID_SD_EMMC_A>,
1499218c80c99a Neil Armstrong      2019-07-29  2333  				 <&clkc CLKID_SD_EMMC_A_CLK0>,
1499218c80c99a Neil Armstrong      2019-07-29  2334  				 <&clkc CLKID_FCLK_DIV2>;
1499218c80c99a Neil Armstrong      2019-07-29  2335  			clock-names = "core", "clkin0", "clkin1";
1499218c80c99a Neil Armstrong      2019-07-29  2336  			resets = <&reset RESET_SD_EMMC_A>;
1499218c80c99a Neil Armstrong      2019-07-29  2337  		};
1499218c80c99a Neil Armstrong      2019-07-29  2338  
1499218c80c99a Neil Armstrong      2019-07-29  2339  		sd_emmc_b: sd@ffe05000 {
1499218c80c99a Neil Armstrong      2019-07-29  2340  			compatible = "amlogic,meson-axg-mmc";
1499218c80c99a Neil Armstrong      2019-07-29  2341  			reg = <0x0 0xffe05000 0x0 0x800>;
1499218c80c99a Neil Armstrong      2019-07-29  2342  			interrupts = <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2343  			status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2344  			clocks = <&clkc CLKID_SD_EMMC_B>,
1499218c80c99a Neil Armstrong      2019-07-29  2345  				 <&clkc CLKID_SD_EMMC_B_CLK0>,
1499218c80c99a Neil Armstrong      2019-07-29  2346  				 <&clkc CLKID_FCLK_DIV2>;
1499218c80c99a Neil Armstrong      2019-07-29  2347  			clock-names = "core", "clkin0", "clkin1";
1499218c80c99a Neil Armstrong      2019-07-29  2348  			resets = <&reset RESET_SD_EMMC_B>;
1499218c80c99a Neil Armstrong      2019-07-29  2349  		};
1499218c80c99a Neil Armstrong      2019-07-29  2350  
1499218c80c99a Neil Armstrong      2019-07-29  2351  		sd_emmc_c: mmc@ffe07000 {
1499218c80c99a Neil Armstrong      2019-07-29  2352  			compatible = "amlogic,meson-axg-mmc";
1499218c80c99a Neil Armstrong      2019-07-29  2353  			reg = <0x0 0xffe07000 0x0 0x800>;
1499218c80c99a Neil Armstrong      2019-07-29  2354  			interrupts = <GIC_SPI 191 IRQ_TYPE_EDGE_RISING>;
1499218c80c99a Neil Armstrong      2019-07-29  2355  			status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2356  			clocks = <&clkc CLKID_SD_EMMC_C>,
1499218c80c99a Neil Armstrong      2019-07-29  2357  				 <&clkc CLKID_SD_EMMC_C_CLK0>,
1499218c80c99a Neil Armstrong      2019-07-29  2358  				 <&clkc CLKID_FCLK_DIV2>;
1499218c80c99a Neil Armstrong      2019-07-29  2359  			clock-names = "core", "clkin0", "clkin1";
1499218c80c99a Neil Armstrong      2019-07-29  2360  			resets = <&reset RESET_SD_EMMC_C>;
1499218c80c99a Neil Armstrong      2019-07-29  2361  		};
1499218c80c99a Neil Armstrong      2019-07-29  2362  
1499218c80c99a Neil Armstrong      2019-07-29  2363  		usb: usb@ffe09000 {
1499218c80c99a Neil Armstrong      2019-07-29  2364  			status = "disabled";
1499218c80c99a Neil Armstrong      2019-07-29  2365  			compatible = "amlogic,meson-g12a-usb-ctrl";
1499218c80c99a Neil Armstrong      2019-07-29  2366  			reg = <0x0 0xffe09000 0x0 0xa0>;
1499218c80c99a Neil Armstrong      2019-07-29  2367  			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
1499218c80c99a Neil Armstrong      2019-07-29  2368  			#address-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  2369  			#size-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  2370  			ranges;
1499218c80c99a Neil Armstrong      2019-07-29  2371  
1499218c80c99a Neil Armstrong      2019-07-29  2372  			clocks = <&clkc CLKID_USB>;
1499218c80c99a Neil Armstrong      2019-07-29  2373  			resets = <&reset RESET_USB>;
1499218c80c99a Neil Armstrong      2019-07-29  2374  
1499218c80c99a Neil Armstrong      2019-07-29  2375  			dr_mode = "otg";
1499218c80c99a Neil Armstrong      2019-07-29  2376  
1499218c80c99a Neil Armstrong      2019-07-29  2377  			phys = <&usb2_phy0>, <&usb2_phy1>,
1499218c80c99a Neil Armstrong      2019-07-29  2378  			       <&usb3_pcie_phy PHY_TYPE_USB3>;
1499218c80c99a Neil Armstrong      2019-07-29  2379  			phy-names = "usb2-phy0", "usb2-phy1", "usb3-phy0";
1499218c80c99a Neil Armstrong      2019-07-29  2380  
1499218c80c99a Neil Armstrong      2019-07-29  2381  			dwc2: usb@ff400000 {
1499218c80c99a Neil Armstrong      2019-07-29  2382  				compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
1499218c80c99a Neil Armstrong      2019-07-29  2383  				reg = <0x0 0xff400000 0x0 0x40000>;
1499218c80c99a Neil Armstrong      2019-07-29  2384  				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
1499218c80c99a Neil Armstrong      2019-07-29  2385  				clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
e4f634d8126340 Neil Armstrong      2020-03-26  2386  				clock-names = "otg";
1499218c80c99a Neil Armstrong      2019-07-29  2387  				phys = <&usb2_phy1>;
1499218c80c99a Neil Armstrong      2019-07-29  2388  				phy-names = "usb2-phy";
1499218c80c99a Neil Armstrong      2019-07-29  2389  				dr_mode = "peripheral";
1499218c80c99a Neil Armstrong      2019-07-29  2390  				g-rx-fifo-size = <192>;
1499218c80c99a Neil Armstrong      2019-07-29  2391  				g-np-tx-fifo-size = <128>;
1499218c80c99a Neil Armstrong      2019-07-29  2392  				g-tx-fifo-size = <128 128 16 16 16>;
1499218c80c99a Neil Armstrong      2019-07-29  2393  			};
1499218c80c99a Neil Armstrong      2019-07-29  2394  
1499218c80c99a Neil Armstrong      2019-07-29  2395  			dwc3: usb@ff500000 {
1499218c80c99a Neil Armstrong      2019-07-29  2396  				compatible = "snps,dwc3";
1499218c80c99a Neil Armstrong      2019-07-29  2397  				reg = <0x0 0xff500000 0x0 0x100000>;
1499218c80c99a Neil Armstrong      2019-07-29  2398  				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
1499218c80c99a Neil Armstrong      2019-07-29  2399  				dr_mode = "host";
1499218c80c99a Neil Armstrong      2019-07-29  2400  				snps,dis_u2_susphy_quirk;
7386a559caa641 Serge Semin         2020-12-10  2401  				snps,quirk-frame-length-adjustment = <0x20>;
a81bcfb6ac20cd Neil Armstrong      2020-02-21  2402  				snps,parkmode-disable-ss-quirk;
1499218c80c99a Neil Armstrong      2019-07-29  2403  			};
1499218c80c99a Neil Armstrong      2019-07-29  2404  		};
1499218c80c99a Neil Armstrong      2019-07-29  2405  
1499218c80c99a Neil Armstrong      2019-07-29  2406  		mali: gpu@ffe40000 {
1499218c80c99a Neil Armstrong      2019-07-29  2407  			compatible = "amlogic,meson-g12a-mali", "arm,mali-bifrost";
1499218c80c99a Neil Armstrong      2019-07-29  2408  			reg = <0x0 0xffe40000 0x0 0x40000>;
1499218c80c99a Neil Armstrong      2019-07-29  2409  			interrupt-parent = <&gic>;
711f9cb1f13aff Neil Armstrong      2019-10-21  2410  			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
1499218c80c99a Neil Armstrong      2019-07-29  2411  				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
711f9cb1f13aff Neil Armstrong      2019-10-21  2412  				     <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
711f9cb1f13aff Neil Armstrong      2019-10-21  2413  			interrupt-names = "job", "mmu", "gpu";
1499218c80c99a Neil Armstrong      2019-07-29  2414  			clocks = <&clkc CLKID_MALI>;
1499218c80c99a Neil Armstrong      2019-07-29  2415  			resets = <&reset RESET_DVALIN_CAPB3>, <&reset RESET_DVALIN>;
916a0edc43f03f Martin Blumenstingl 2020-07-19  2416  			operating-points-v2 = <&gpu_opp_table>;
e7251ed74ef79b Guillaume La Roque  2019-10-04  2417  			#cooling-cells = <2>;
1499218c80c99a Neil Armstrong      2019-07-29  2418  		};
1499218c80c99a Neil Armstrong      2019-07-29  2419  	};
1499218c80c99a Neil Armstrong      2019-07-29  2420  
cdc50916945956 Alexander Stein     2021-10-26  2421  	thermal-zones {
cdc50916945956 Alexander Stein     2021-10-26  2422  		cpu_thermal: cpu-thermal {
cdc50916945956 Alexander Stein     2021-10-26  2423  			polling-delay = <1000>;
cdc50916945956 Alexander Stein     2021-10-26  2424  			polling-delay-passive = <100>;
cdc50916945956 Alexander Stein     2021-10-26  2425  			thermal-sensors = <&cpu_temp>;
cdc50916945956 Alexander Stein     2021-10-26  2426  
cdc50916945956 Alexander Stein     2021-10-26  2427  			trips {
cdc50916945956 Alexander Stein     2021-10-26  2428  				cpu_passive: cpu-passive {
cdc50916945956 Alexander Stein     2021-10-26  2429  					temperature = <85000>; /* millicelsius */
cdc50916945956 Alexander Stein     2021-10-26  2430  					hysteresis = <2000>; /* millicelsius */
cdc50916945956 Alexander Stein     2021-10-26  2431  					type = "passive";
cdc50916945956 Alexander Stein     2021-10-26  2432  				};
cdc50916945956 Alexander Stein     2021-10-26  2433  
cdc50916945956 Alexander Stein     2021-10-26  2434  				cpu_hot: cpu-hot {
cdc50916945956 Alexander Stein     2021-10-26  2435  					temperature = <95000>; /* millicelsius */
cdc50916945956 Alexander Stein     2021-10-26  2436  					hysteresis = <2000>; /* millicelsius */
cdc50916945956 Alexander Stein     2021-10-26  2437  					type = "hot";
cdc50916945956 Alexander Stein     2021-10-26  2438  				};
cdc50916945956 Alexander Stein     2021-10-26  2439  
cdc50916945956 Alexander Stein     2021-10-26  2440  				cpu_critical: cpu-critical {
cdc50916945956 Alexander Stein     2021-10-26  2441  					temperature = <110000>; /* millicelsius */
cdc50916945956 Alexander Stein     2021-10-26  2442  					hysteresis = <2000>; /* millicelsius */
cdc50916945956 Alexander Stein     2021-10-26  2443  					type = "critical";
cdc50916945956 Alexander Stein     2021-10-26  2444  				};
cdc50916945956 Alexander Stein     2021-10-26  2445  			};
cdc50916945956 Alexander Stein     2021-10-26  2446  		};
cdc50916945956 Alexander Stein     2021-10-26  2447  
cdc50916945956 Alexander Stein     2021-10-26  2448  		ddr_thermal: ddr-thermal {
cdc50916945956 Alexander Stein     2021-10-26  2449  			polling-delay = <1000>;
cdc50916945956 Alexander Stein     2021-10-26  2450  			polling-delay-passive = <100>;
cdc50916945956 Alexander Stein     2021-10-26  2451  			thermal-sensors = <&ddr_temp>;
cdc50916945956 Alexander Stein     2021-10-26  2452  
cdc50916945956 Alexander Stein     2021-10-26  2453  			trips {
cdc50916945956 Alexander Stein     2021-10-26  2454  				ddr_passive: ddr-passive {
cdc50916945956 Alexander Stein     2021-10-26  2455  					temperature = <85000>; /* millicelsius */
cdc50916945956 Alexander Stein     2021-10-26  2456  					hysteresis = <2000>; /* millicelsius */
cdc50916945956 Alexander Stein     2021-10-26  2457  					type = "passive";
cdc50916945956 Alexander Stein     2021-10-26  2458  				};
cdc50916945956 Alexander Stein     2021-10-26  2459  
cdc50916945956 Alexander Stein     2021-10-26  2460  				ddr_critical: ddr-critical {
cdc50916945956 Alexander Stein     2021-10-26  2461  					temperature = <110000>; /* millicelsius */
cdc50916945956 Alexander Stein     2021-10-26  2462  					hysteresis = <2000>; /* millicelsius */
cdc50916945956 Alexander Stein     2021-10-26  2463  					type = "critical";
cdc50916945956 Alexander Stein     2021-10-26  2464  				};
cdc50916945956 Alexander Stein     2021-10-26  2465  			};
cdc50916945956 Alexander Stein     2021-10-26  2466  
cdc50916945956 Alexander Stein     2021-10-26  2467  			cooling-maps {
cdc50916945956 Alexander Stein     2021-10-26  2468  				map {
cdc50916945956 Alexander Stein     2021-10-26  2469  					trip = <&ddr_passive>;
cdc50916945956 Alexander Stein     2021-10-26  2470  					cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
cdc50916945956 Alexander Stein     2021-10-26  2471  				};
cdc50916945956 Alexander Stein     2021-10-26  2472  			};
cdc50916945956 Alexander Stein     2021-10-26  2473  		};
cdc50916945956 Alexander Stein     2021-10-26  2474  	};
cdc50916945956 Alexander Stein     2021-10-26  2475  
1499218c80c99a Neil Armstrong      2019-07-29  2476  	timer {
1499218c80c99a Neil Armstrong      2019-07-29  2477  		compatible = "arm,armv8-timer";
1499218c80c99a Neil Armstrong      2019-07-29  2478  		interrupts = <GIC_PPI 13
1499218c80c99a Neil Armstrong      2019-07-29  2479  			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
1499218c80c99a Neil Armstrong      2019-07-29  2480  			     <GIC_PPI 14
1499218c80c99a Neil Armstrong      2019-07-29  2481  			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
1499218c80c99a Neil Armstrong      2019-07-29  2482  			     <GIC_PPI 11
1499218c80c99a Neil Armstrong      2019-07-29  2483  			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
1499218c80c99a Neil Armstrong      2019-07-29  2484  			     <GIC_PPI 10
1499218c80c99a Neil Armstrong      2019-07-29  2485  			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>;
a55022706068c4 Kevin Hilman        2019-08-08  2486  		arm,no-tick-in-suspend;
1499218c80c99a Neil Armstrong      2019-07-29  2487  	};
1499218c80c99a Neil Armstrong      2019-07-29  2488  
1499218c80c99a Neil Armstrong      2019-07-29  2489  	xtal: xtal-clk {
1499218c80c99a Neil Armstrong      2019-07-29  2490  		compatible = "fixed-clock";
1499218c80c99a Neil Armstrong      2019-07-29  2491  		clock-frequency = <24000000>;
1499218c80c99a Neil Armstrong      2019-07-29  2492  		clock-output-names = "xtal";
1499218c80c99a Neil Armstrong      2019-07-29  2493  		#clock-cells = <0>;
1499218c80c99a Neil Armstrong      2019-07-29  2494  	};
1499218c80c99a Neil Armstrong      2019-07-29  2495  

:::::: The code at line 2253 was first introduced by commit
:::::: 1499218c80c99ae73c937c370142c8f6048002d5 arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi

:::::: TO: Neil Armstrong <narmstrong@baylibre.com>
:::::: CC: Kevin Hilman <khilman@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
