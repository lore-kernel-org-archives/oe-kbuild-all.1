Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10A621FF44
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748473029; cv=none; b=R5xbROGZW8Qjigyp6VP0xd9unINbuG6CoqF53QYy5PF0AXKkpRGhFXd8bOt04C4QzhPNB0upfVcZFP2gK1xjwsLH+gxyA9sHYHTMljisMuzlPiEPoMpE5mCih9ZNYhpieT7vUCYHu0cli18LJT76v02Mddw06zhej1dS/SfGVOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748473029; c=relaxed/simple;
	bh=2s0qm7e1il8SxPOcdk/8QY5Ys7B2R1xr+AecZ8p1h7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Usg8P37Ip+inKadzPHy3xFmSMnaZBNMp/mJof2zBmmjMMP3G2EY2vvr0xnCKnbwx/YJVBD3qzgzMY002GUSM5MGxYpHvYNeHoUDE/x6tE9VvLDgbmHEGCgbUYOqNAOEJvpHcOX5KgxLrBmYDLaSI2qq6LYhpWPPytXhEk1OzjI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hST4uD+p; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hST4uD+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748473023; x=1780009023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2s0qm7e1il8SxPOcdk/8QY5Ys7B2R1xr+AecZ8p1h7E=;
  b=hST4uD+pErq1bOhKuyj3i6WjsuhPY1rlMjyITg+l/rWLKXpgBSvl5zj+
   oUFFJvIB2j458bH/wUb2JnFPc/4CGG5/1SjO+H8a6Pmz1Kq+Dbn/dsM/T
   jGbij2QRzWI2of236oYwMYv+IUP7CeaDRzesCAJ9Bky3rTQcZrcGnc+1/
   GNOm1HFmhcG9O04CXu9Gsy5OE3/ovQDK8Werpk2gJ83igBuazsOx3hG37
   /bzNjcO7EqnWW/UDlSB5kwltH4Sg/OCc7TCg7j4BjGo0wKlKv5pKCQISN
   ZcKsvC1PM6EjswnfjirWIAreGbDOLsBgDeGsB3clWE/VXKOa7irvkw89L
   g==;
X-CSE-ConnectionGUID: fHp80HxXSymJ12fgBY3Q6w==
X-CSE-MsgGUID: Ul3/tGrNRrWa6USbgqj3Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61872036"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="61872036"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 15:57:02 -0700
X-CSE-ConnectionGUID: hqYFzbgiRT2zZjNGxHCrAw==
X-CSE-MsgGUID: P5C6pHimS7qiC0CfVoFBCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="174259039"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2025 15:56:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKPhh-000W8I-21;
	Wed, 28 May 2025 22:56:57 +0000
Date: Thu, 29 May 2025 06:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <steve@how2flow.net>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.15.y 36/42]
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2315.5-2318.17: ERROR
 (duplicate_property_names): /soc/bus@ffd00000/pwm@19000:clocks: Duplicate
 property name
Message-ID: <202505290622.h45LpaDs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.15.y
head:   62efa5294148d0ccb18203491839df4fb9dc18d1
commit: 696ab4ead474994c1ab9809c2b7c2fd4ebd032a6 [36/42] ODROID-N2/C4: arm64/dts: Add clock properties to pwm
config: arm64-randconfig-004-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290622.h45LpaDs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290622.h45LpaDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290622.h45LpaDs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2315.5-2318.17: ERROR (duplicate_property_names): /soc/bus@ffd00000/pwm@19000:clocks: Duplicate property name
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2335.5-2338.17: ERROR (duplicate_property_names): /soc/bus@ffd00000/pwm@1a000:clocks: Duplicate property name
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2355.5-2358.17: ERROR (duplicate_property_names): /soc/bus@ffd00000/pwm@1b000:clocks: Duplicate property name
   ERROR: Input tree has errors, aborting (use -f to force output)

vim +2315 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi

1499218c80c99ae Neil Armstrong      2019-07-29    15  
1499218c80c99ae Neil Armstrong      2019-07-29    16  / {
1499218c80c99ae Neil Armstrong      2019-07-29    17  	interrupt-parent = <&gic>;
1499218c80c99ae Neil Armstrong      2019-07-29    18  	#address-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29    19  	#size-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29    20  
ab547c4fb39fe14 Alexander Stein     2021-02-03    21  	aliases {
ab547c4fb39fe14 Alexander Stein     2021-02-03    22  		mmc0 = &sd_emmc_b; /* SD card */
ab547c4fb39fe14 Alexander Stein     2021-02-03    23  		mmc1 = &sd_emmc_c; /* eMMC */
ab547c4fb39fe14 Alexander Stein     2021-02-03    24  		mmc2 = &sd_emmc_a; /* SDIO */
ab547c4fb39fe14 Alexander Stein     2021-02-03    25  	};
ab547c4fb39fe14 Alexander Stein     2021-02-03    26  
15767cfd81eb9ff Neil Armstrong      2019-10-03    27  	chosen {
15767cfd81eb9ff Neil Armstrong      2019-10-03    28  		#address-cells = <2>;
15767cfd81eb9ff Neil Armstrong      2019-10-03    29  		#size-cells = <2>;
15767cfd81eb9ff Neil Armstrong      2019-10-03    30  		ranges;
15767cfd81eb9ff Neil Armstrong      2019-10-03    31  
15767cfd81eb9ff Neil Armstrong      2019-10-03    32  		simplefb_cvbs: framebuffer-cvbs {
15767cfd81eb9ff Neil Armstrong      2019-10-03    33  			compatible = "amlogic,simple-framebuffer",
15767cfd81eb9ff Neil Armstrong      2019-10-03    34  				     "simple-framebuffer";
15767cfd81eb9ff Neil Armstrong      2019-10-03    35  			amlogic,pipeline = "vpu-cvbs";
15767cfd81eb9ff Neil Armstrong      2019-10-03    36  			clocks = <&clkc CLKID_HDMI>,
15767cfd81eb9ff Neil Armstrong      2019-10-03    37  				 <&clkc CLKID_HTX_PCLK>,
15767cfd81eb9ff Neil Armstrong      2019-10-03    38  				 <&clkc CLKID_VPU_INTR>;
15767cfd81eb9ff Neil Armstrong      2019-10-03    39  			status = "disabled";
15767cfd81eb9ff Neil Armstrong      2019-10-03    40  		};
15767cfd81eb9ff Neil Armstrong      2019-10-03    41  
15767cfd81eb9ff Neil Armstrong      2019-10-03    42  		simplefb_hdmi: framebuffer-hdmi {
15767cfd81eb9ff Neil Armstrong      2019-10-03    43  			compatible = "amlogic,simple-framebuffer",
15767cfd81eb9ff Neil Armstrong      2019-10-03    44  				    "simple-framebuffer";
15767cfd81eb9ff Neil Armstrong      2019-10-03    45  			amlogic,pipeline = "vpu-hdmi";
15767cfd81eb9ff Neil Armstrong      2019-10-03    46  			clocks = <&clkc CLKID_HDMI>,
15767cfd81eb9ff Neil Armstrong      2019-10-03    47  				 <&clkc CLKID_HTX_PCLK>,
15767cfd81eb9ff Neil Armstrong      2019-10-03    48  				 <&clkc CLKID_VPU_INTR>;
15767cfd81eb9ff Neil Armstrong      2019-10-03    49  			status = "disabled";
15767cfd81eb9ff Neil Armstrong      2019-10-03    50  		};
15767cfd81eb9ff Neil Armstrong      2019-10-03    51  	};
15767cfd81eb9ff Neil Armstrong      2019-10-03    52  
1499218c80c99ae Neil Armstrong      2019-07-29    53  	efuse: efuse {
1499218c80c99ae Neil Armstrong      2019-07-29    54  		compatible = "amlogic,meson-gxbb-efuse";
1499218c80c99ae Neil Armstrong      2019-07-29    55  		clocks = <&clkc CLKID_EFUSE>;
1499218c80c99ae Neil Armstrong      2019-07-29    56  		#address-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29    57  		#size-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29    58  		read-only;
de82e74a9f2631e Carlo Caione        2019-07-31    59  		secure-monitor = <&sm>;
1499218c80c99ae Neil Armstrong      2019-07-29    60  	};
1499218c80c99ae Neil Armstrong      2019-07-29    61  
bb98a6fd0b0e227 Alexander Stein     2021-10-26    62  	gpu_opp_table: opp-table-gpu {
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    63  		compatible = "operating-points-v2";
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    64  
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    65  		opp-124999998 {
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    66  			opp-hz = /bits/ 64 <124999998>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    67  			opp-microvolt = <800000>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    68  		};
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    69  		opp-249999996 {
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    70  			opp-hz = /bits/ 64 <249999996>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    71  			opp-microvolt = <800000>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    72  		};
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    73  		opp-285714281 {
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    74  			opp-hz = /bits/ 64 <285714281>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    75  			opp-microvolt = <800000>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    76  		};
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    77  		opp-399999994 {
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    78  			opp-hz = /bits/ 64 <399999994>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    79  			opp-microvolt = <800000>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    80  		};
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    81  		opp-499999992 {
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    82  			opp-hz = /bits/ 64 <499999992>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    83  			opp-microvolt = <800000>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    84  		};
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    85  		opp-666666656 {
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    86  			opp-hz = /bits/ 64 <666666656>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    87  			opp-microvolt = <800000>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    88  		};
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    89  		opp-799999987 {
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    90  			opp-hz = /bits/ 64 <799999987>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    91  			opp-microvolt = <800000>;
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    92  		};
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    93  	};
916a0edc43f03f8 Martin Blumenstingl 2020-07-19    94  
1499218c80c99ae Neil Armstrong      2019-07-29    95  	psci {
1499218c80c99ae Neil Armstrong      2019-07-29    96  		compatible = "arm,psci-1.0";
1499218c80c99ae Neil Armstrong      2019-07-29    97  		method = "smc";
1499218c80c99ae Neil Armstrong      2019-07-29    98  	};
1499218c80c99ae Neil Armstrong      2019-07-29    99  
1499218c80c99ae Neil Armstrong      2019-07-29   100  	reserved-memory {
1499218c80c99ae Neil Armstrong      2019-07-29   101  		#address-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   102  		#size-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   103  		ranges;
1499218c80c99ae Neil Armstrong      2019-07-29   104  
1499218c80c99ae Neil Armstrong      2019-07-29   105  		/* 3 MiB reserved for ARM Trusted Firmware (BL31) */
1499218c80c99ae Neil Armstrong      2019-07-29   106  		secmon_reserved: secmon@5000000 {
1499218c80c99ae Neil Armstrong      2019-07-29   107  			reg = <0x0 0x05000000 0x0 0x300000>;
1499218c80c99ae Neil Armstrong      2019-07-29   108  			no-map;
1499218c80c99ae Neil Armstrong      2019-07-29   109  		};
1499218c80c99ae Neil Armstrong      2019-07-29   110  
08982a1b3aa2611 Christian Hewitt    2022-01-26   111  		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
08982a1b3aa2611 Christian Hewitt    2022-01-26   112  		secmon_reserved_bl32: secmon@5300000 {
08982a1b3aa2611 Christian Hewitt    2022-01-26   113  			reg = <0x0 0x05300000 0x0 0x2000000>;
08982a1b3aa2611 Christian Hewitt    2022-01-26   114  			no-map;
08982a1b3aa2611 Christian Hewitt    2022-01-26   115  		};
08982a1b3aa2611 Christian Hewitt    2022-01-26   116  
1499218c80c99ae Neil Armstrong      2019-07-29   117  		linux,cma {
1499218c80c99ae Neil Armstrong      2019-07-29   118  			compatible = "shared-dma-pool";
1499218c80c99ae Neil Armstrong      2019-07-29   119  			reusable;
1499218c80c99ae Neil Armstrong      2019-07-29   120  			size = <0x0 0x10000000>;
1499218c80c99ae Neil Armstrong      2019-07-29   121  			alignment = <0x0 0x400000>;
1499218c80c99ae Neil Armstrong      2019-07-29   122  			linux,cma-default;
1499218c80c99ae Neil Armstrong      2019-07-29   123  		};
1499218c80c99ae Neil Armstrong      2019-07-29   124  	};
1499218c80c99ae Neil Armstrong      2019-07-29   125  
1499218c80c99ae Neil Armstrong      2019-07-29   126  	sm: secure-monitor {
1499218c80c99ae Neil Armstrong      2019-07-29   127  		compatible = "amlogic,meson-gxbb-sm";
1499218c80c99ae Neil Armstrong      2019-07-29   128  	};
1499218c80c99ae Neil Armstrong      2019-07-29   129  
1499218c80c99ae Neil Armstrong      2019-07-29   130  	soc {
1499218c80c99ae Neil Armstrong      2019-07-29   131  		compatible = "simple-bus";
1499218c80c99ae Neil Armstrong      2019-07-29   132  		#address-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   133  		#size-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   134  		ranges;
1499218c80c99ae Neil Armstrong      2019-07-29   135  
1f8607d597635c2 Neil Armstrong      2019-09-16   136  		pcie: pcie@fc000000 {
1f8607d597635c2 Neil Armstrong      2019-09-16   137  			compatible = "amlogic,g12a-pcie", "snps,dw-pcie";
d9421d6c52942be Kevin Hilman        2021-04-21   138  			reg = <0x0 0xfc000000 0x0 0x400000>,
d9421d6c52942be Kevin Hilman        2021-04-21   139  			      <0x0 0xff648000 0x0 0x2000>,
d9421d6c52942be Kevin Hilman        2021-04-21   140  			      <0x0 0xfc400000 0x0 0x200000>;
1f8607d597635c2 Neil Armstrong      2019-09-16   141  			reg-names = "elbi", "cfg", "config";
1f8607d597635c2 Neil Armstrong      2019-09-16   142  			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
1f8607d597635c2 Neil Armstrong      2019-09-16   143  			#interrupt-cells = <1>;
1f8607d597635c2 Neil Armstrong      2019-09-16   144  			interrupt-map-mask = <0 0 0 0>;
1f8607d597635c2 Neil Armstrong      2019-09-16   145  			interrupt-map = <0 0 0 0 &gic GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
1f8607d597635c2 Neil Armstrong      2019-09-16   146  			bus-range = <0x0 0xff>;
1f8607d597635c2 Neil Armstrong      2019-09-16   147  			#address-cells = <3>;
1f8607d597635c2 Neil Armstrong      2019-09-16   148  			#size-cells = <2>;
1f8607d597635c2 Neil Armstrong      2019-09-16   149  			device_type = "pci";
d9421d6c52942be Kevin Hilman        2021-04-21   150  			ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000>,
d9421d6c52942be Kevin Hilman        2021-04-21   151  				 <0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
1f8607d597635c2 Neil Armstrong      2019-09-16   152  
1f8607d597635c2 Neil Armstrong      2019-09-16   153  			clocks = <&clkc CLKID_PCIE_PHY
1f8607d597635c2 Neil Armstrong      2019-09-16   154  				  &clkc CLKID_PCIE_COMB
1f8607d597635c2 Neil Armstrong      2019-09-16   155  				  &clkc CLKID_PCIE_PLL>;
1f8607d597635c2 Neil Armstrong      2019-09-16   156  			clock-names = "general",
1f8607d597635c2 Neil Armstrong      2019-09-16   157  				      "pclk",
1f8607d597635c2 Neil Armstrong      2019-09-16   158  				      "port";
1f8607d597635c2 Neil Armstrong      2019-09-16   159  			resets = <&reset RESET_PCIE_CTRL_A>,
1f8607d597635c2 Neil Armstrong      2019-09-16   160  				 <&reset RESET_PCIE_APB>;
1f8607d597635c2 Neil Armstrong      2019-09-16   161  			reset-names = "port",
1f8607d597635c2 Neil Armstrong      2019-09-16   162  				      "apb";
1f8607d597635c2 Neil Armstrong      2019-09-16   163  			num-lanes = <1>;
1f8607d597635c2 Neil Armstrong      2019-09-16   164  			phys = <&usb3_pcie_phy PHY_TYPE_PCIE>;
1f8607d597635c2 Neil Armstrong      2019-09-16   165  			phy-names = "pcie";
1f8607d597635c2 Neil Armstrong      2019-09-16   166  			status = "disabled";
1f8607d597635c2 Neil Armstrong      2019-09-16   167  		};
1f8607d597635c2 Neil Armstrong      2019-09-16   168  
1499218c80c99ae Neil Armstrong      2019-07-29   169  		ethmac: ethernet@ff3f0000 {
1fdc97ae450ede2 Martin Blumenstingl 2020-09-25   170  			compatible = "amlogic,meson-g12a-dwmac",
1499218c80c99ae Neil Armstrong      2019-07-29   171  				     "snps,dwmac-3.70a",
1499218c80c99ae Neil Armstrong      2019-07-29   172  				     "snps,dwmac";
3ad6c9e35756111 Neil Armstrong      2019-08-23   173  			reg = <0x0 0xff3f0000 0x0 0x10000>,
3ad6c9e35756111 Neil Armstrong      2019-08-23   174  			      <0x0 0xff634540 0x0 0x8>;
1499218c80c99ae Neil Armstrong      2019-07-29   175  			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
1499218c80c99ae Neil Armstrong      2019-07-29   176  			interrupt-names = "macirq";
1499218c80c99ae Neil Armstrong      2019-07-29   177  			clocks = <&clkc CLKID_ETH>,
1499218c80c99ae Neil Armstrong      2019-07-29   178  				 <&clkc CLKID_FCLK_DIV2>,
32b5f4b63487a24 Martin Blumenstingl 2020-06-20   179  				 <&clkc CLKID_MPLL2>,
32b5f4b63487a24 Martin Blumenstingl 2020-06-20   180  				 <&clkc CLKID_FCLK_DIV2>;
32b5f4b63487a24 Martin Blumenstingl 2020-06-20   181  			clock-names = "stmmaceth", "clkin0", "clkin1",
32b5f4b63487a24 Martin Blumenstingl 2020-06-20   182  				      "timing-adjustment";
ef68984eab6bbe3 Jerome Brunet       2019-07-18   183  			rx-fifo-depth = <4096>;
ef68984eab6bbe3 Jerome Brunet       2019-07-18   184  			tx-fifo-depth = <2048>;
1499218c80c99ae Neil Armstrong      2019-07-29   185  			status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29   186  
1499218c80c99ae Neil Armstrong      2019-07-29   187  			mdio0: mdio {
1499218c80c99ae Neil Armstrong      2019-07-29   188  				#address-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29   189  				#size-cells = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29   190  				compatible = "snps,dwmac-mdio";
1499218c80c99ae Neil Armstrong      2019-07-29   191  			};
1499218c80c99ae Neil Armstrong      2019-07-29   192  		};
1499218c80c99ae Neil Armstrong      2019-07-29   193  
1499218c80c99ae Neil Armstrong      2019-07-29   194  		apb: bus@ff600000 {
1499218c80c99ae Neil Armstrong      2019-07-29   195  			compatible = "simple-bus";
1499218c80c99ae Neil Armstrong      2019-07-29   196  			reg = <0x0 0xff600000 0x0 0x200000>;
1499218c80c99ae Neil Armstrong      2019-07-29   197  			#address-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   198  			#size-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   199  			ranges = <0x0 0x0 0x0 0xff600000 0x0 0x200000>;
1499218c80c99ae Neil Armstrong      2019-07-29   200  
1499218c80c99ae Neil Armstrong      2019-07-29   201  			hdmi_tx: hdmi-tx@0 {
1499218c80c99ae Neil Armstrong      2019-07-29   202  				compatible = "amlogic,meson-g12a-dw-hdmi";
1499218c80c99ae Neil Armstrong      2019-07-29   203  				reg = <0x0 0x0 0x0 0x10000>;
1499218c80c99ae Neil Armstrong      2019-07-29   204  				interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
1499218c80c99ae Neil Armstrong      2019-07-29   205  				resets = <&reset RESET_HDMITX_CAPB3>,
1499218c80c99ae Neil Armstrong      2019-07-29   206  					 <&reset RESET_HDMITX_PHY>,
1499218c80c99ae Neil Armstrong      2019-07-29   207  					 <&reset RESET_HDMITX>;
1499218c80c99ae Neil Armstrong      2019-07-29   208  				reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
1499218c80c99ae Neil Armstrong      2019-07-29   209  				clocks = <&clkc CLKID_HDMI>,
1499218c80c99ae Neil Armstrong      2019-07-29   210  					 <&clkc CLKID_HTX_PCLK>,
1499218c80c99ae Neil Armstrong      2019-07-29   211  					 <&clkc CLKID_VPU_INTR>;
1499218c80c99ae Neil Armstrong      2019-07-29   212  				clock-names = "isfr", "iahb", "venci";
1499218c80c99ae Neil Armstrong      2019-07-29   213  				#address-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29   214  				#size-cells = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29   215  				#sound-dai-cells = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29   216  				status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29   217  
1443b6ea806dfcd Jerome Brunet       2024-06-26   218  				assigned-clocks = <&clkc CLKID_HDMI_SEL>,
1443b6ea806dfcd Jerome Brunet       2024-06-26   219  						  <&clkc CLKID_HDMI>;
1443b6ea806dfcd Jerome Brunet       2024-06-26   220  				assigned-clock-parents = <&xtal>, <0>;
1443b6ea806dfcd Jerome Brunet       2024-06-26   221  				assigned-clock-rates = <0>, <24000000>;
1443b6ea806dfcd Jerome Brunet       2024-06-26   222  
1499218c80c99ae Neil Armstrong      2019-07-29   223  				/* VPU VENC Input */
1499218c80c99ae Neil Armstrong      2019-07-29   224  				hdmi_tx_venc_port: port@0 {
1499218c80c99ae Neil Armstrong      2019-07-29   225  					reg = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29   226  
1499218c80c99ae Neil Armstrong      2019-07-29   227  					hdmi_tx_in: endpoint {
1499218c80c99ae Neil Armstrong      2019-07-29   228  						remote-endpoint = <&hdmi_tx_out>;
1499218c80c99ae Neil Armstrong      2019-07-29   229  					};
1499218c80c99ae Neil Armstrong      2019-07-29   230  				};
1499218c80c99ae Neil Armstrong      2019-07-29   231  
1499218c80c99ae Neil Armstrong      2019-07-29   232  				/* TMDS Output */
1499218c80c99ae Neil Armstrong      2019-07-29   233  				hdmi_tx_tmds_port: port@1 {
1499218c80c99ae Neil Armstrong      2019-07-29   234  					reg = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29   235  				};
1499218c80c99ae Neil Armstrong      2019-07-29   236  			};
1499218c80c99ae Neil Armstrong      2019-07-29   237  
1499218c80c99ae Neil Armstrong      2019-07-29   238  			apb_efuse: bus@30000 {
1499218c80c99ae Neil Armstrong      2019-07-29   239  				compatible = "simple-bus";
1499218c80c99ae Neil Armstrong      2019-07-29   240  				reg = <0x0 0x30000 0x0 0x2000>;
1499218c80c99ae Neil Armstrong      2019-07-29   241  				#address-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   242  				#size-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   243  				ranges = <0x0 0x0 0x0 0x30000 0x0 0x2000>;
1499218c80c99ae Neil Armstrong      2019-07-29   244  
1499218c80c99ae Neil Armstrong      2019-07-29   245  				hwrng: rng@218 {
1499218c80c99ae Neil Armstrong      2019-07-29   246  					compatible = "amlogic,meson-rng";
1499218c80c99ae Neil Armstrong      2019-07-29   247  					reg = <0x0 0x218 0x0 0x4>;
a1afbbb0285797e Scott K Logan       2020-09-25   248  					clocks = <&clkc CLKID_RNG0>;
a1afbbb0285797e Scott K Logan       2020-09-25   249  					clock-names = "core";
1499218c80c99ae Neil Armstrong      2019-07-29   250  				};
1499218c80c99ae Neil Armstrong      2019-07-29   251  			};
1499218c80c99ae Neil Armstrong      2019-07-29   252  
457fa78771a23ec Jerome Brunet       2020-05-07   253  			acodec: audio-controller@32000 {
457fa78771a23ec Jerome Brunet       2020-05-07   254  				compatible = "amlogic,t9015";
457fa78771a23ec Jerome Brunet       2020-05-07   255  				reg = <0x0 0x32000 0x0 0x14>;
457fa78771a23ec Jerome Brunet       2020-05-07   256  				#sound-dai-cells = <0>;
457fa78771a23ec Jerome Brunet       2020-05-07   257  				sound-name-prefix = "ACODEC";
457fa78771a23ec Jerome Brunet       2020-05-07   258  				clocks = <&clkc CLKID_AUDIO_CODEC>;
457fa78771a23ec Jerome Brunet       2020-05-07   259  				clock-names = "pclk";
457fa78771a23ec Jerome Brunet       2020-05-07   260  				resets = <&reset RESET_AUDIO_CODEC>;
457fa78771a23ec Jerome Brunet       2020-05-07   261  				status = "disabled";
457fa78771a23ec Jerome Brunet       2020-05-07   262  			};
457fa78771a23ec Jerome Brunet       2020-05-07   263  
1499218c80c99ae Neil Armstrong      2019-07-29   264  			periphs: bus@34400 {
1499218c80c99ae Neil Armstrong      2019-07-29   265  				compatible = "simple-bus";
1499218c80c99ae Neil Armstrong      2019-07-29   266  				reg = <0x0 0x34400 0x0 0x400>;
1499218c80c99ae Neil Armstrong      2019-07-29   267  				#address-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   268  				#size-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   269  				ranges = <0x0 0x0 0x0 0x34400 0x0 0x400>;
1499218c80c99ae Neil Armstrong      2019-07-29   270  
1499218c80c99ae Neil Armstrong      2019-07-29   271  				periphs_pinctrl: pinctrl@40 {
1499218c80c99ae Neil Armstrong      2019-07-29   272  					compatible = "amlogic,meson-g12a-periphs-pinctrl";
1499218c80c99ae Neil Armstrong      2019-07-29   273  					#address-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   274  					#size-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   275  					ranges;
1499218c80c99ae Neil Armstrong      2019-07-29   276  
1499218c80c99ae Neil Armstrong      2019-07-29   277  					gpio: bank@40 {
1499218c80c99ae Neil Armstrong      2019-07-29   278  						reg = <0x0 0x40  0x0 0x4c>,
1499218c80c99ae Neil Armstrong      2019-07-29   279  						      <0x0 0xe8  0x0 0x18>,
1499218c80c99ae Neil Armstrong      2019-07-29   280  						      <0x0 0x120 0x0 0x18>,
1499218c80c99ae Neil Armstrong      2019-07-29   281  						      <0x0 0x2c0 0x0 0x40>,
1499218c80c99ae Neil Armstrong      2019-07-29   282  						      <0x0 0x340 0x0 0x1c>;
1499218c80c99ae Neil Armstrong      2019-07-29   283  						reg-names = "gpio",
1499218c80c99ae Neil Armstrong      2019-07-29   284  							    "pull",
1499218c80c99ae Neil Armstrong      2019-07-29   285  							    "pull-enable",
1499218c80c99ae Neil Armstrong      2019-07-29   286  							    "mux",
1499218c80c99ae Neil Armstrong      2019-07-29   287  							    "ds";
1499218c80c99ae Neil Armstrong      2019-07-29   288  						gpio-controller;
1499218c80c99ae Neil Armstrong      2019-07-29   289  						#gpio-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29   290  						gpio-ranges = <&periphs_pinctrl 0 0 86>;
1499218c80c99ae Neil Armstrong      2019-07-29   291  					};
1499218c80c99ae Neil Armstrong      2019-07-29   292  
1499218c80c99ae Neil Armstrong      2019-07-29   293  					cec_ao_a_h_pins: cec_ao_a_h {
1499218c80c99ae Neil Armstrong      2019-07-29   294  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   295  							groups = "cec_ao_a_h";
1499218c80c99ae Neil Armstrong      2019-07-29   296  							function = "cec_ao_a_h";
1499218c80c99ae Neil Armstrong      2019-07-29   297  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   298  						};
1499218c80c99ae Neil Armstrong      2019-07-29   299  					};
1499218c80c99ae Neil Armstrong      2019-07-29   300  
1499218c80c99ae Neil Armstrong      2019-07-29   301  					cec_ao_b_h_pins: cec_ao_b_h {
1499218c80c99ae Neil Armstrong      2019-07-29   302  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   303  							groups = "cec_ao_b_h";
1499218c80c99ae Neil Armstrong      2019-07-29   304  							function = "cec_ao_b_h";
1499218c80c99ae Neil Armstrong      2019-07-29   305  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   306  						};
1499218c80c99ae Neil Armstrong      2019-07-29   307  					};
1499218c80c99ae Neil Armstrong      2019-07-29   308  
4d2cb376e5ccacd Neil Armstrong      2020-03-13   309  					emmc_ctrl_pins: emmc-ctrl {
1499218c80c99ae Neil Armstrong      2019-07-29   310  						mux-0 {
4d2cb376e5ccacd Neil Armstrong      2020-03-13   311  							groups = "emmc_cmd";
1499218c80c99ae Neil Armstrong      2019-07-29   312  							function = "emmc";
1499218c80c99ae Neil Armstrong      2019-07-29   313  							bias-pull-up;
1499218c80c99ae Neil Armstrong      2019-07-29   314  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   315  						};
1499218c80c99ae Neil Armstrong      2019-07-29   316  
1499218c80c99ae Neil Armstrong      2019-07-29   317  						mux-1 {
1499218c80c99ae Neil Armstrong      2019-07-29   318  							groups = "emmc_clk";
1499218c80c99ae Neil Armstrong      2019-07-29   319  							function = "emmc";
1499218c80c99ae Neil Armstrong      2019-07-29   320  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   321  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   322  						};
1499218c80c99ae Neil Armstrong      2019-07-29   323  					};
1499218c80c99ae Neil Armstrong      2019-07-29   324  
4d2cb376e5ccacd Neil Armstrong      2020-03-13   325  					emmc_data_4b_pins: emmc-data-4b {
4d2cb376e5ccacd Neil Armstrong      2020-03-13   326  						mux-0 {
4d2cb376e5ccacd Neil Armstrong      2020-03-13   327  							groups = "emmc_nand_d0",
4d2cb376e5ccacd Neil Armstrong      2020-03-13   328  								 "emmc_nand_d1",
4d2cb376e5ccacd Neil Armstrong      2020-03-13   329  								 "emmc_nand_d2",
4d2cb376e5ccacd Neil Armstrong      2020-03-13   330  								 "emmc_nand_d3";
4d2cb376e5ccacd Neil Armstrong      2020-03-13   331  							function = "emmc";
4d2cb376e5ccacd Neil Armstrong      2020-03-13   332  							bias-pull-up;
4d2cb376e5ccacd Neil Armstrong      2020-03-13   333  							drive-strength-microamp = <4000>;
4d2cb376e5ccacd Neil Armstrong      2020-03-13   334  						};
4d2cb376e5ccacd Neil Armstrong      2020-03-13   335  					};
4d2cb376e5ccacd Neil Armstrong      2020-03-13   336  
4d2cb376e5ccacd Neil Armstrong      2020-03-13   337  					emmc_data_8b_pins: emmc-data-8b {
4d2cb376e5ccacd Neil Armstrong      2020-03-13   338  						mux-0 {
4d2cb376e5ccacd Neil Armstrong      2020-03-13   339  							groups = "emmc_nand_d0",
4d2cb376e5ccacd Neil Armstrong      2020-03-13   340  								 "emmc_nand_d1",
4d2cb376e5ccacd Neil Armstrong      2020-03-13   341  								 "emmc_nand_d2",
4d2cb376e5ccacd Neil Armstrong      2020-03-13   342  								 "emmc_nand_d3",
4d2cb376e5ccacd Neil Armstrong      2020-03-13   343  								 "emmc_nand_d4",
4d2cb376e5ccacd Neil Armstrong      2020-03-13   344  								 "emmc_nand_d5",
4d2cb376e5ccacd Neil Armstrong      2020-03-13   345  								 "emmc_nand_d6",
4d2cb376e5ccacd Neil Armstrong      2020-03-13   346  								 "emmc_nand_d7";
4d2cb376e5ccacd Neil Armstrong      2020-03-13   347  							function = "emmc";
4d2cb376e5ccacd Neil Armstrong      2020-03-13   348  							bias-pull-up;
4d2cb376e5ccacd Neil Armstrong      2020-03-13   349  							drive-strength-microamp = <4000>;
4d2cb376e5ccacd Neil Armstrong      2020-03-13   350  						};
4d2cb376e5ccacd Neil Armstrong      2020-03-13   351  					};
4d2cb376e5ccacd Neil Armstrong      2020-03-13   352  
1499218c80c99ae Neil Armstrong      2019-07-29   353  					emmc_ds_pins: emmc-ds {
1499218c80c99ae Neil Armstrong      2019-07-29   354  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   355  							groups = "emmc_nand_ds";
1499218c80c99ae Neil Armstrong      2019-07-29   356  							function = "emmc";
1499218c80c99ae Neil Armstrong      2019-07-29   357  							bias-pull-down;
1499218c80c99ae Neil Armstrong      2019-07-29   358  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   359  						};
1499218c80c99ae Neil Armstrong      2019-07-29   360  					};
1499218c80c99ae Neil Armstrong      2019-07-29   361  
1499218c80c99ae Neil Armstrong      2019-07-29   362  					emmc_clk_gate_pins: emmc_clk_gate {
1499218c80c99ae Neil Armstrong      2019-07-29   363  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   364  							groups = "BOOT_8";
1499218c80c99ae Neil Armstrong      2019-07-29   365  							function = "gpio_periphs";
1499218c80c99ae Neil Armstrong      2019-07-29   366  							bias-pull-down;
1499218c80c99ae Neil Armstrong      2019-07-29   367  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   368  						};
1499218c80c99ae Neil Armstrong      2019-07-29   369  					};
1499218c80c99ae Neil Armstrong      2019-07-29   370  
1499218c80c99ae Neil Armstrong      2019-07-29   371  					hdmitx_ddc_pins: hdmitx_ddc {
1499218c80c99ae Neil Armstrong      2019-07-29   372  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   373  							groups = "hdmitx_sda",
1499218c80c99ae Neil Armstrong      2019-07-29   374  								 "hdmitx_sck";
1499218c80c99ae Neil Armstrong      2019-07-29   375  							function = "hdmitx";
1499218c80c99ae Neil Armstrong      2019-07-29   376  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   377  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   378  						};
1499218c80c99ae Neil Armstrong      2019-07-29   379  					};
1499218c80c99ae Neil Armstrong      2019-07-29   380  
1499218c80c99ae Neil Armstrong      2019-07-29   381  					hdmitx_hpd_pins: hdmitx_hpd {
1499218c80c99ae Neil Armstrong      2019-07-29   382  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   383  							groups = "hdmitx_hpd_in";
1499218c80c99ae Neil Armstrong      2019-07-29   384  							function = "hdmitx";
1499218c80c99ae Neil Armstrong      2019-07-29   385  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   386  						};
1499218c80c99ae Neil Armstrong      2019-07-29   387  					};
1499218c80c99ae Neil Armstrong      2019-07-29   388  
1499218c80c99ae Neil Armstrong      2019-07-29   389  
1499218c80c99ae Neil Armstrong      2019-07-29   390  					i2c0_sda_c_pins: i2c0-sda-c {
1499218c80c99ae Neil Armstrong      2019-07-29   391  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   392  							groups = "i2c0_sda_c";
1499218c80c99ae Neil Armstrong      2019-07-29   393  							function = "i2c0";
1499218c80c99ae Neil Armstrong      2019-07-29   394  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   395  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   396  
1499218c80c99ae Neil Armstrong      2019-07-29   397  						};
1499218c80c99ae Neil Armstrong      2019-07-29   398  					};
1499218c80c99ae Neil Armstrong      2019-07-29   399  
1499218c80c99ae Neil Armstrong      2019-07-29   400  					i2c0_sck_c_pins: i2c0-sck-c {
1499218c80c99ae Neil Armstrong      2019-07-29   401  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   402  							groups = "i2c0_sck_c";
1499218c80c99ae Neil Armstrong      2019-07-29   403  							function = "i2c0";
1499218c80c99ae Neil Armstrong      2019-07-29   404  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   405  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   406  						};
1499218c80c99ae Neil Armstrong      2019-07-29   407  					};
1499218c80c99ae Neil Armstrong      2019-07-29   408  
1499218c80c99ae Neil Armstrong      2019-07-29   409  					i2c0_sda_z0_pins: i2c0-sda-z0 {
1499218c80c99ae Neil Armstrong      2019-07-29   410  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   411  							groups = "i2c0_sda_z0";
1499218c80c99ae Neil Armstrong      2019-07-29   412  							function = "i2c0";
1499218c80c99ae Neil Armstrong      2019-07-29   413  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   414  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   415  						};
1499218c80c99ae Neil Armstrong      2019-07-29   416  					};
1499218c80c99ae Neil Armstrong      2019-07-29   417  
1499218c80c99ae Neil Armstrong      2019-07-29   418  					i2c0_sck_z1_pins: i2c0-sck-z1 {
1499218c80c99ae Neil Armstrong      2019-07-29   419  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   420  							groups = "i2c0_sck_z1";
1499218c80c99ae Neil Armstrong      2019-07-29   421  							function = "i2c0";
1499218c80c99ae Neil Armstrong      2019-07-29   422  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   423  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   424  						};
1499218c80c99ae Neil Armstrong      2019-07-29   425  					};
1499218c80c99ae Neil Armstrong      2019-07-29   426  
1499218c80c99ae Neil Armstrong      2019-07-29   427  					i2c0_sda_z7_pins: i2c0-sda-z7 {
1499218c80c99ae Neil Armstrong      2019-07-29   428  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   429  							groups = "i2c0_sda_z7";
1499218c80c99ae Neil Armstrong      2019-07-29   430  							function = "i2c0";
1499218c80c99ae Neil Armstrong      2019-07-29   431  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   432  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   433  						};
1499218c80c99ae Neil Armstrong      2019-07-29   434  					};
1499218c80c99ae Neil Armstrong      2019-07-29   435  
1499218c80c99ae Neil Armstrong      2019-07-29   436  					i2c0_sda_z8_pins: i2c0-sda-z8 {
1499218c80c99ae Neil Armstrong      2019-07-29   437  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   438  							groups = "i2c0_sda_z8";
1499218c80c99ae Neil Armstrong      2019-07-29   439  							function = "i2c0";
1499218c80c99ae Neil Armstrong      2019-07-29   440  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   441  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   442  						};
1499218c80c99ae Neil Armstrong      2019-07-29   443  					};
1499218c80c99ae Neil Armstrong      2019-07-29   444  
1499218c80c99ae Neil Armstrong      2019-07-29   445  					i2c1_sda_x_pins: i2c1-sda-x {
1499218c80c99ae Neil Armstrong      2019-07-29   446  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   447  							groups = "i2c1_sda_x";
1499218c80c99ae Neil Armstrong      2019-07-29   448  							function = "i2c1";
1499218c80c99ae Neil Armstrong      2019-07-29   449  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   450  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   451  						};
1499218c80c99ae Neil Armstrong      2019-07-29   452  					};
1499218c80c99ae Neil Armstrong      2019-07-29   453  
1499218c80c99ae Neil Armstrong      2019-07-29   454  					i2c1_sck_x_pins: i2c1-sck-x {
1499218c80c99ae Neil Armstrong      2019-07-29   455  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   456  							groups = "i2c1_sck_x";
1499218c80c99ae Neil Armstrong      2019-07-29   457  							function = "i2c1";
1499218c80c99ae Neil Armstrong      2019-07-29   458  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   459  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   460  						};
1499218c80c99ae Neil Armstrong      2019-07-29   461  					};
1499218c80c99ae Neil Armstrong      2019-07-29   462  
1499218c80c99ae Neil Armstrong      2019-07-29   463  					i2c1_sda_h2_pins: i2c1-sda-h2 {
1499218c80c99ae Neil Armstrong      2019-07-29   464  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   465  							groups = "i2c1_sda_h2";
1499218c80c99ae Neil Armstrong      2019-07-29   466  							function = "i2c1";
1499218c80c99ae Neil Armstrong      2019-07-29   467  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   468  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   469  						};
1499218c80c99ae Neil Armstrong      2019-07-29   470  					};
1499218c80c99ae Neil Armstrong      2019-07-29   471  
1499218c80c99ae Neil Armstrong      2019-07-29   472  					i2c1_sck_h3_pins: i2c1-sck-h3 {
1499218c80c99ae Neil Armstrong      2019-07-29   473  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   474  							groups = "i2c1_sck_h3";
1499218c80c99ae Neil Armstrong      2019-07-29   475  							function = "i2c1";
1499218c80c99ae Neil Armstrong      2019-07-29   476  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   477  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   478  						};
1499218c80c99ae Neil Armstrong      2019-07-29   479  					};
1499218c80c99ae Neil Armstrong      2019-07-29   480  
1499218c80c99ae Neil Armstrong      2019-07-29   481  					i2c1_sda_h6_pins: i2c1-sda-h6 {
1499218c80c99ae Neil Armstrong      2019-07-29   482  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   483  							groups = "i2c1_sda_h6";
1499218c80c99ae Neil Armstrong      2019-07-29   484  							function = "i2c1";
1499218c80c99ae Neil Armstrong      2019-07-29   485  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   486  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   487  						};
1499218c80c99ae Neil Armstrong      2019-07-29   488  					};
1499218c80c99ae Neil Armstrong      2019-07-29   489  
1499218c80c99ae Neil Armstrong      2019-07-29   490  					i2c1_sck_h7_pins: i2c1-sck-h7 {
1499218c80c99ae Neil Armstrong      2019-07-29   491  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   492  							groups = "i2c1_sck_h7";
1499218c80c99ae Neil Armstrong      2019-07-29   493  							function = "i2c1";
1499218c80c99ae Neil Armstrong      2019-07-29   494  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   495  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   496  						};
1499218c80c99ae Neil Armstrong      2019-07-29   497  					};
1499218c80c99ae Neil Armstrong      2019-07-29   498  
1499218c80c99ae Neil Armstrong      2019-07-29   499  					i2c2_sda_x_pins: i2c2-sda-x {
1499218c80c99ae Neil Armstrong      2019-07-29   500  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   501  							groups = "i2c2_sda_x";
1499218c80c99ae Neil Armstrong      2019-07-29   502  							function = "i2c2";
1499218c80c99ae Neil Armstrong      2019-07-29   503  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   504  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   505  						};
1499218c80c99ae Neil Armstrong      2019-07-29   506  					};
1499218c80c99ae Neil Armstrong      2019-07-29   507  
1499218c80c99ae Neil Armstrong      2019-07-29   508  					i2c2_sck_x_pins: i2c2-sck-x {
1499218c80c99ae Neil Armstrong      2019-07-29   509  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   510  							groups = "i2c2_sck_x";
1499218c80c99ae Neil Armstrong      2019-07-29   511  							function = "i2c2";
1499218c80c99ae Neil Armstrong      2019-07-29   512  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   513  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   514  						};
1499218c80c99ae Neil Armstrong      2019-07-29   515  					};
1499218c80c99ae Neil Armstrong      2019-07-29   516  
1499218c80c99ae Neil Armstrong      2019-07-29   517  					i2c2_sda_z_pins: i2c2-sda-z {
1499218c80c99ae Neil Armstrong      2019-07-29   518  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   519  							groups = "i2c2_sda_z";
1499218c80c99ae Neil Armstrong      2019-07-29   520  							function = "i2c2";
1499218c80c99ae Neil Armstrong      2019-07-29   521  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   522  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   523  						};
1499218c80c99ae Neil Armstrong      2019-07-29   524  					};
1499218c80c99ae Neil Armstrong      2019-07-29   525  
1499218c80c99ae Neil Armstrong      2019-07-29   526  					i2c2_sck_z_pins: i2c2-sck-z {
1499218c80c99ae Neil Armstrong      2019-07-29   527  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   528  							groups = "i2c2_sck_z";
1499218c80c99ae Neil Armstrong      2019-07-29   529  							function = "i2c2";
1499218c80c99ae Neil Armstrong      2019-07-29   530  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   531  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   532  						};
1499218c80c99ae Neil Armstrong      2019-07-29   533  					};
1499218c80c99ae Neil Armstrong      2019-07-29   534  
1499218c80c99ae Neil Armstrong      2019-07-29   535  					i2c3_sda_h_pins: i2c3-sda-h {
1499218c80c99ae Neil Armstrong      2019-07-29   536  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   537  							groups = "i2c3_sda_h";
1499218c80c99ae Neil Armstrong      2019-07-29   538  							function = "i2c3";
1499218c80c99ae Neil Armstrong      2019-07-29   539  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   540  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   541  						};
1499218c80c99ae Neil Armstrong      2019-07-29   542  					};
1499218c80c99ae Neil Armstrong      2019-07-29   543  
1499218c80c99ae Neil Armstrong      2019-07-29   544  					i2c3_sck_h_pins: i2c3-sck-h {
1499218c80c99ae Neil Armstrong      2019-07-29   545  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   546  							groups = "i2c3_sck_h";
1499218c80c99ae Neil Armstrong      2019-07-29   547  							function = "i2c3";
1499218c80c99ae Neil Armstrong      2019-07-29   548  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   549  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   550  						};
1499218c80c99ae Neil Armstrong      2019-07-29   551  					};
1499218c80c99ae Neil Armstrong      2019-07-29   552  
1499218c80c99ae Neil Armstrong      2019-07-29   553  					i2c3_sda_a_pins: i2c3-sda-a {
1499218c80c99ae Neil Armstrong      2019-07-29   554  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   555  							groups = "i2c3_sda_a";
1499218c80c99ae Neil Armstrong      2019-07-29   556  							function = "i2c3";
1499218c80c99ae Neil Armstrong      2019-07-29   557  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   558  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   559  						};
1499218c80c99ae Neil Armstrong      2019-07-29   560  					};
1499218c80c99ae Neil Armstrong      2019-07-29   561  
1499218c80c99ae Neil Armstrong      2019-07-29   562  					i2c3_sck_a_pins: i2c3-sck-a {
1499218c80c99ae Neil Armstrong      2019-07-29   563  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   564  							groups = "i2c3_sck_a";
1499218c80c99ae Neil Armstrong      2019-07-29   565  							function = "i2c3";
1499218c80c99ae Neil Armstrong      2019-07-29   566  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   567  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   568  						};
1499218c80c99ae Neil Armstrong      2019-07-29   569  					};
1499218c80c99ae Neil Armstrong      2019-07-29   570  
1499218c80c99ae Neil Armstrong      2019-07-29   571  					mclk0_a_pins: mclk0-a {
1499218c80c99ae Neil Armstrong      2019-07-29   572  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   573  							groups = "mclk0_a";
1499218c80c99ae Neil Armstrong      2019-07-29   574  							function = "mclk0";
1499218c80c99ae Neil Armstrong      2019-07-29   575  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   576  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   577  						};
1499218c80c99ae Neil Armstrong      2019-07-29   578  					};
1499218c80c99ae Neil Armstrong      2019-07-29   579  
1499218c80c99ae Neil Armstrong      2019-07-29   580  					mclk1_a_pins: mclk1-a {
1499218c80c99ae Neil Armstrong      2019-07-29   581  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   582  							groups = "mclk1_a";
1499218c80c99ae Neil Armstrong      2019-07-29   583  							function = "mclk1";
1499218c80c99ae Neil Armstrong      2019-07-29   584  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   585  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   586  						};
1499218c80c99ae Neil Armstrong      2019-07-29   587  					};
1499218c80c99ae Neil Armstrong      2019-07-29   588  
1499218c80c99ae Neil Armstrong      2019-07-29   589  					mclk1_x_pins: mclk1-x {
1499218c80c99ae Neil Armstrong      2019-07-29   590  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   591  							groups = "mclk1_x";
1499218c80c99ae Neil Armstrong      2019-07-29   592  							function = "mclk1";
1499218c80c99ae Neil Armstrong      2019-07-29   593  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   594  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   595  						};
1499218c80c99ae Neil Armstrong      2019-07-29   596  					};
1499218c80c99ae Neil Armstrong      2019-07-29   597  
1499218c80c99ae Neil Armstrong      2019-07-29   598  					mclk1_z_pins: mclk1-z {
1499218c80c99ae Neil Armstrong      2019-07-29   599  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   600  							groups = "mclk1_z";
1499218c80c99ae Neil Armstrong      2019-07-29   601  							function = "mclk1";
1499218c80c99ae Neil Armstrong      2019-07-29   602  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   603  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   604  						};
1499218c80c99ae Neil Armstrong      2019-07-29   605  					};
1499218c80c99ae Neil Armstrong      2019-07-29   606  
f12a463d2f43b9c Neil Armstrong      2020-03-13   607  					nor_pins: nor {
f12a463d2f43b9c Neil Armstrong      2020-03-13   608  						mux {
f12a463d2f43b9c Neil Armstrong      2020-03-13   609  							groups = "nor_d",
f12a463d2f43b9c Neil Armstrong      2020-03-13   610  							       "nor_q",
f12a463d2f43b9c Neil Armstrong      2020-03-13   611  							       "nor_c",
f12a463d2f43b9c Neil Armstrong      2020-03-13   612  							       "nor_cs";
f12a463d2f43b9c Neil Armstrong      2020-03-13   613  							function = "nor";
f12a463d2f43b9c Neil Armstrong      2020-03-13   614  							bias-disable;
f12a463d2f43b9c Neil Armstrong      2020-03-13   615  						};
f12a463d2f43b9c Neil Armstrong      2020-03-13   616  					};
f12a463d2f43b9c Neil Armstrong      2020-03-13   617  
1499218c80c99ae Neil Armstrong      2019-07-29   618  					pdm_din0_a_pins: pdm-din0-a {
1499218c80c99ae Neil Armstrong      2019-07-29   619  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   620  							groups = "pdm_din0_a";
1499218c80c99ae Neil Armstrong      2019-07-29   621  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   622  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   623  						};
1499218c80c99ae Neil Armstrong      2019-07-29   624  					};
1499218c80c99ae Neil Armstrong      2019-07-29   625  
1499218c80c99ae Neil Armstrong      2019-07-29   626  					pdm_din0_c_pins: pdm-din0-c {
1499218c80c99ae Neil Armstrong      2019-07-29   627  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   628  							groups = "pdm_din0_c";
1499218c80c99ae Neil Armstrong      2019-07-29   629  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   630  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   631  						};
1499218c80c99ae Neil Armstrong      2019-07-29   632  					};
1499218c80c99ae Neil Armstrong      2019-07-29   633  
1499218c80c99ae Neil Armstrong      2019-07-29   634  					pdm_din0_x_pins: pdm-din0-x {
1499218c80c99ae Neil Armstrong      2019-07-29   635  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   636  							groups = "pdm_din0_x";
1499218c80c99ae Neil Armstrong      2019-07-29   637  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   638  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   639  						};
1499218c80c99ae Neil Armstrong      2019-07-29   640  					};
1499218c80c99ae Neil Armstrong      2019-07-29   641  
1499218c80c99ae Neil Armstrong      2019-07-29   642  					pdm_din0_z_pins: pdm-din0-z {
1499218c80c99ae Neil Armstrong      2019-07-29   643  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   644  							groups = "pdm_din0_z";
1499218c80c99ae Neil Armstrong      2019-07-29   645  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   646  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   647  						};
1499218c80c99ae Neil Armstrong      2019-07-29   648  					};
1499218c80c99ae Neil Armstrong      2019-07-29   649  
1499218c80c99ae Neil Armstrong      2019-07-29   650  					pdm_din1_a_pins: pdm-din1-a {
1499218c80c99ae Neil Armstrong      2019-07-29   651  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   652  							groups = "pdm_din1_a";
1499218c80c99ae Neil Armstrong      2019-07-29   653  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   654  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   655  						};
1499218c80c99ae Neil Armstrong      2019-07-29   656  					};
1499218c80c99ae Neil Armstrong      2019-07-29   657  
1499218c80c99ae Neil Armstrong      2019-07-29   658  					pdm_din1_c_pins: pdm-din1-c {
1499218c80c99ae Neil Armstrong      2019-07-29   659  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   660  							groups = "pdm_din1_c";
1499218c80c99ae Neil Armstrong      2019-07-29   661  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   662  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   663  						};
1499218c80c99ae Neil Armstrong      2019-07-29   664  					};
1499218c80c99ae Neil Armstrong      2019-07-29   665  
1499218c80c99ae Neil Armstrong      2019-07-29   666  					pdm_din1_x_pins: pdm-din1-x {
1499218c80c99ae Neil Armstrong      2019-07-29   667  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   668  							groups = "pdm_din1_x";
1499218c80c99ae Neil Armstrong      2019-07-29   669  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   670  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   671  						};
1499218c80c99ae Neil Armstrong      2019-07-29   672  					};
1499218c80c99ae Neil Armstrong      2019-07-29   673  
1499218c80c99ae Neil Armstrong      2019-07-29   674  					pdm_din1_z_pins: pdm-din1-z {
1499218c80c99ae Neil Armstrong      2019-07-29   675  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   676  							groups = "pdm_din1_z";
1499218c80c99ae Neil Armstrong      2019-07-29   677  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   678  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   679  						};
1499218c80c99ae Neil Armstrong      2019-07-29   680  					};
1499218c80c99ae Neil Armstrong      2019-07-29   681  
1499218c80c99ae Neil Armstrong      2019-07-29   682  					pdm_din2_a_pins: pdm-din2-a {
1499218c80c99ae Neil Armstrong      2019-07-29   683  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   684  							groups = "pdm_din2_a";
1499218c80c99ae Neil Armstrong      2019-07-29   685  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   686  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   687  						};
1499218c80c99ae Neil Armstrong      2019-07-29   688  					};
1499218c80c99ae Neil Armstrong      2019-07-29   689  
1499218c80c99ae Neil Armstrong      2019-07-29   690  					pdm_din2_c_pins: pdm-din2-c {
1499218c80c99ae Neil Armstrong      2019-07-29   691  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   692  							groups = "pdm_din2_c";
1499218c80c99ae Neil Armstrong      2019-07-29   693  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   694  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   695  						};
1499218c80c99ae Neil Armstrong      2019-07-29   696  					};
1499218c80c99ae Neil Armstrong      2019-07-29   697  
1499218c80c99ae Neil Armstrong      2019-07-29   698  					pdm_din2_x_pins: pdm-din2-x {
1499218c80c99ae Neil Armstrong      2019-07-29   699  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   700  							groups = "pdm_din2_x";
1499218c80c99ae Neil Armstrong      2019-07-29   701  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   702  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   703  						};
1499218c80c99ae Neil Armstrong      2019-07-29   704  					};
1499218c80c99ae Neil Armstrong      2019-07-29   705  
1499218c80c99ae Neil Armstrong      2019-07-29   706  					pdm_din2_z_pins: pdm-din2-z {
1499218c80c99ae Neil Armstrong      2019-07-29   707  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   708  							groups = "pdm_din2_z";
1499218c80c99ae Neil Armstrong      2019-07-29   709  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   710  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   711  						};
1499218c80c99ae Neil Armstrong      2019-07-29   712  					};
1499218c80c99ae Neil Armstrong      2019-07-29   713  
1499218c80c99ae Neil Armstrong      2019-07-29   714  					pdm_din3_a_pins: pdm-din3-a {
1499218c80c99ae Neil Armstrong      2019-07-29   715  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   716  							groups = "pdm_din3_a";
1499218c80c99ae Neil Armstrong      2019-07-29   717  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   718  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   719  						};
1499218c80c99ae Neil Armstrong      2019-07-29   720  					};
1499218c80c99ae Neil Armstrong      2019-07-29   721  
1499218c80c99ae Neil Armstrong      2019-07-29   722  					pdm_din3_c_pins: pdm-din3-c {
1499218c80c99ae Neil Armstrong      2019-07-29   723  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   724  							groups = "pdm_din3_c";
1499218c80c99ae Neil Armstrong      2019-07-29   725  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   726  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   727  						};
1499218c80c99ae Neil Armstrong      2019-07-29   728  					};
1499218c80c99ae Neil Armstrong      2019-07-29   729  
1499218c80c99ae Neil Armstrong      2019-07-29   730  					pdm_din3_x_pins: pdm-din3-x {
1499218c80c99ae Neil Armstrong      2019-07-29   731  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   732  							groups = "pdm_din3_x";
1499218c80c99ae Neil Armstrong      2019-07-29   733  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   734  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   735  						};
1499218c80c99ae Neil Armstrong      2019-07-29   736  					};
1499218c80c99ae Neil Armstrong      2019-07-29   737  
1499218c80c99ae Neil Armstrong      2019-07-29   738  					pdm_din3_z_pins: pdm-din3-z {
1499218c80c99ae Neil Armstrong      2019-07-29   739  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   740  							groups = "pdm_din3_z";
1499218c80c99ae Neil Armstrong      2019-07-29   741  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   742  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   743  						};
1499218c80c99ae Neil Armstrong      2019-07-29   744  					};
1499218c80c99ae Neil Armstrong      2019-07-29   745  
1499218c80c99ae Neil Armstrong      2019-07-29   746  					pdm_dclk_a_pins: pdm-dclk-a {
1499218c80c99ae Neil Armstrong      2019-07-29   747  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   748  							groups = "pdm_dclk_a";
1499218c80c99ae Neil Armstrong      2019-07-29   749  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   750  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   751  							drive-strength-microamp = <500>;
1499218c80c99ae Neil Armstrong      2019-07-29   752  						};
1499218c80c99ae Neil Armstrong      2019-07-29   753  					};
1499218c80c99ae Neil Armstrong      2019-07-29   754  
1499218c80c99ae Neil Armstrong      2019-07-29   755  					pdm_dclk_c_pins: pdm-dclk-c {
1499218c80c99ae Neil Armstrong      2019-07-29   756  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   757  							groups = "pdm_dclk_c";
1499218c80c99ae Neil Armstrong      2019-07-29   758  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   759  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   760  							drive-strength-microamp = <500>;
1499218c80c99ae Neil Armstrong      2019-07-29   761  						};
1499218c80c99ae Neil Armstrong      2019-07-29   762  					};
1499218c80c99ae Neil Armstrong      2019-07-29   763  
1499218c80c99ae Neil Armstrong      2019-07-29   764  					pdm_dclk_x_pins: pdm-dclk-x {
1499218c80c99ae Neil Armstrong      2019-07-29   765  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   766  							groups = "pdm_dclk_x";
1499218c80c99ae Neil Armstrong      2019-07-29   767  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   768  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   769  							drive-strength-microamp = <500>;
1499218c80c99ae Neil Armstrong      2019-07-29   770  						};
1499218c80c99ae Neil Armstrong      2019-07-29   771  					};
1499218c80c99ae Neil Armstrong      2019-07-29   772  
1499218c80c99ae Neil Armstrong      2019-07-29   773  					pdm_dclk_z_pins: pdm-dclk-z {
1499218c80c99ae Neil Armstrong      2019-07-29   774  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   775  							groups = "pdm_dclk_z";
1499218c80c99ae Neil Armstrong      2019-07-29   776  							function = "pdm";
1499218c80c99ae Neil Armstrong      2019-07-29   777  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   778  							drive-strength-microamp = <500>;
1499218c80c99ae Neil Armstrong      2019-07-29   779  						};
1499218c80c99ae Neil Armstrong      2019-07-29   780  					};
1499218c80c99ae Neil Armstrong      2019-07-29   781  
1499218c80c99ae Neil Armstrong      2019-07-29   782  					pwm_a_pins: pwm-a {
1499218c80c99ae Neil Armstrong      2019-07-29   783  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   784  							groups = "pwm_a";
1499218c80c99ae Neil Armstrong      2019-07-29   785  							function = "pwm_a";
1499218c80c99ae Neil Armstrong      2019-07-29   786  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   787  						};
1499218c80c99ae Neil Armstrong      2019-07-29   788  					};
1499218c80c99ae Neil Armstrong      2019-07-29   789  
1499218c80c99ae Neil Armstrong      2019-07-29   790  					pwm_b_x7_pins: pwm-b-x7 {
1499218c80c99ae Neil Armstrong      2019-07-29   791  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   792  							groups = "pwm_b_x7";
1499218c80c99ae Neil Armstrong      2019-07-29   793  							function = "pwm_b";
1499218c80c99ae Neil Armstrong      2019-07-29   794  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   795  						};
1499218c80c99ae Neil Armstrong      2019-07-29   796  					};
1499218c80c99ae Neil Armstrong      2019-07-29   797  
1499218c80c99ae Neil Armstrong      2019-07-29   798  					pwm_b_x19_pins: pwm-b-x19 {
1499218c80c99ae Neil Armstrong      2019-07-29   799  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   800  							groups = "pwm_b_x19";
1499218c80c99ae Neil Armstrong      2019-07-29   801  							function = "pwm_b";
1499218c80c99ae Neil Armstrong      2019-07-29   802  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   803  						};
1499218c80c99ae Neil Armstrong      2019-07-29   804  					};
1499218c80c99ae Neil Armstrong      2019-07-29   805  
1499218c80c99ae Neil Armstrong      2019-07-29   806  					pwm_c_c_pins: pwm-c-c {
1499218c80c99ae Neil Armstrong      2019-07-29   807  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   808  							groups = "pwm_c_c";
1499218c80c99ae Neil Armstrong      2019-07-29   809  							function = "pwm_c";
1499218c80c99ae Neil Armstrong      2019-07-29   810  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   811  						};
1499218c80c99ae Neil Armstrong      2019-07-29   812  					};
1499218c80c99ae Neil Armstrong      2019-07-29   813  
1499218c80c99ae Neil Armstrong      2019-07-29   814  					pwm_c_x5_pins: pwm-c-x5 {
1499218c80c99ae Neil Armstrong      2019-07-29   815  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   816  							groups = "pwm_c_x5";
1499218c80c99ae Neil Armstrong      2019-07-29   817  							function = "pwm_c";
1499218c80c99ae Neil Armstrong      2019-07-29   818  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   819  						};
1499218c80c99ae Neil Armstrong      2019-07-29   820  					};
1499218c80c99ae Neil Armstrong      2019-07-29   821  
1499218c80c99ae Neil Armstrong      2019-07-29   822  					pwm_c_x8_pins: pwm-c-x8 {
1499218c80c99ae Neil Armstrong      2019-07-29   823  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   824  							groups = "pwm_c_x8";
1499218c80c99ae Neil Armstrong      2019-07-29   825  							function = "pwm_c";
1499218c80c99ae Neil Armstrong      2019-07-29   826  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   827  						};
1499218c80c99ae Neil Armstrong      2019-07-29   828  					};
1499218c80c99ae Neil Armstrong      2019-07-29   829  
1499218c80c99ae Neil Armstrong      2019-07-29   830  					pwm_d_x3_pins: pwm-d-x3 {
1499218c80c99ae Neil Armstrong      2019-07-29   831  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   832  							groups = "pwm_d_x3";
1499218c80c99ae Neil Armstrong      2019-07-29   833  							function = "pwm_d";
1499218c80c99ae Neil Armstrong      2019-07-29   834  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   835  						};
1499218c80c99ae Neil Armstrong      2019-07-29   836  					};
1499218c80c99ae Neil Armstrong      2019-07-29   837  
1499218c80c99ae Neil Armstrong      2019-07-29   838  					pwm_d_x6_pins: pwm-d-x6 {
1499218c80c99ae Neil Armstrong      2019-07-29   839  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   840  							groups = "pwm_d_x6";
1499218c80c99ae Neil Armstrong      2019-07-29   841  							function = "pwm_d";
1499218c80c99ae Neil Armstrong      2019-07-29   842  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   843  						};
1499218c80c99ae Neil Armstrong      2019-07-29   844  					};
1499218c80c99ae Neil Armstrong      2019-07-29   845  
1499218c80c99ae Neil Armstrong      2019-07-29   846  					pwm_e_pins: pwm-e {
1499218c80c99ae Neil Armstrong      2019-07-29   847  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   848  							groups = "pwm_e";
1499218c80c99ae Neil Armstrong      2019-07-29   849  							function = "pwm_e";
1499218c80c99ae Neil Armstrong      2019-07-29   850  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   851  						};
1499218c80c99ae Neil Armstrong      2019-07-29   852  					};
1499218c80c99ae Neil Armstrong      2019-07-29   853  
073983233302641 Gary Bisson         2022-01-12   854  					pwm_f_z_pins: pwm-f-z {
073983233302641 Gary Bisson         2022-01-12   855  						mux {
073983233302641 Gary Bisson         2022-01-12   856  							groups = "pwm_f_z";
073983233302641 Gary Bisson         2022-01-12   857  							function = "pwm_f";
073983233302641 Gary Bisson         2022-01-12   858  							bias-disable;
073983233302641 Gary Bisson         2022-01-12   859  						};
073983233302641 Gary Bisson         2022-01-12   860  					};
073983233302641 Gary Bisson         2022-01-12   861  
073983233302641 Gary Bisson         2022-01-12   862  					pwm_f_a_pins: pwm-f-a {
073983233302641 Gary Bisson         2022-01-12   863  						mux {
073983233302641 Gary Bisson         2022-01-12   864  							groups = "pwm_f_a";
073983233302641 Gary Bisson         2022-01-12   865  							function = "pwm_f";
073983233302641 Gary Bisson         2022-01-12   866  							bias-disable;
073983233302641 Gary Bisson         2022-01-12   867  						};
073983233302641 Gary Bisson         2022-01-12   868  					};
073983233302641 Gary Bisson         2022-01-12   869  
1499218c80c99ae Neil Armstrong      2019-07-29   870  					pwm_f_x_pins: pwm-f-x {
1499218c80c99ae Neil Armstrong      2019-07-29   871  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   872  							groups = "pwm_f_x";
1499218c80c99ae Neil Armstrong      2019-07-29   873  							function = "pwm_f";
1499218c80c99ae Neil Armstrong      2019-07-29   874  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   875  						};
1499218c80c99ae Neil Armstrong      2019-07-29   876  					};
1499218c80c99ae Neil Armstrong      2019-07-29   877  
1499218c80c99ae Neil Armstrong      2019-07-29   878  					pwm_f_h_pins: pwm-f-h {
1499218c80c99ae Neil Armstrong      2019-07-29   879  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   880  							groups = "pwm_f_h";
1499218c80c99ae Neil Armstrong      2019-07-29   881  							function = "pwm_f";
1499218c80c99ae Neil Armstrong      2019-07-29   882  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   883  						};
1499218c80c99ae Neil Armstrong      2019-07-29   884  					};
1499218c80c99ae Neil Armstrong      2019-07-29   885  
1499218c80c99ae Neil Armstrong      2019-07-29   886  					sdcard_c_pins: sdcard_c {
1499218c80c99ae Neil Armstrong      2019-07-29   887  						mux-0 {
1499218c80c99ae Neil Armstrong      2019-07-29   888  							groups = "sdcard_d0_c",
1499218c80c99ae Neil Armstrong      2019-07-29   889  								 "sdcard_d1_c",
1499218c80c99ae Neil Armstrong      2019-07-29   890  								 "sdcard_d2_c",
1499218c80c99ae Neil Armstrong      2019-07-29   891  								 "sdcard_d3_c",
1499218c80c99ae Neil Armstrong      2019-07-29   892  								 "sdcard_cmd_c";
1499218c80c99ae Neil Armstrong      2019-07-29   893  							function = "sdcard";
1499218c80c99ae Neil Armstrong      2019-07-29   894  							bias-pull-up;
1499218c80c99ae Neil Armstrong      2019-07-29   895  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   896  						};
1499218c80c99ae Neil Armstrong      2019-07-29   897  
1499218c80c99ae Neil Armstrong      2019-07-29   898  						mux-1 {
1499218c80c99ae Neil Armstrong      2019-07-29   899  							groups = "sdcard_clk_c";
1499218c80c99ae Neil Armstrong      2019-07-29   900  							function = "sdcard";
1499218c80c99ae Neil Armstrong      2019-07-29   901  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   902  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   903  						};
1499218c80c99ae Neil Armstrong      2019-07-29   904  					};
1499218c80c99ae Neil Armstrong      2019-07-29   905  
1499218c80c99ae Neil Armstrong      2019-07-29   906  					sdcard_clk_gate_c_pins: sdcard_clk_gate_c {
1499218c80c99ae Neil Armstrong      2019-07-29   907  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   908  							groups = "GPIOC_4";
1499218c80c99ae Neil Armstrong      2019-07-29   909  							function = "gpio_periphs";
1499218c80c99ae Neil Armstrong      2019-07-29   910  							bias-pull-down;
1499218c80c99ae Neil Armstrong      2019-07-29   911  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   912  						};
1499218c80c99ae Neil Armstrong      2019-07-29   913  					};
1499218c80c99ae Neil Armstrong      2019-07-29   914  
1499218c80c99ae Neil Armstrong      2019-07-29   915  					sdcard_z_pins: sdcard_z {
1499218c80c99ae Neil Armstrong      2019-07-29   916  						mux-0 {
1499218c80c99ae Neil Armstrong      2019-07-29   917  							groups = "sdcard_d0_z",
1499218c80c99ae Neil Armstrong      2019-07-29   918  								 "sdcard_d1_z",
1499218c80c99ae Neil Armstrong      2019-07-29   919  								 "sdcard_d2_z",
1499218c80c99ae Neil Armstrong      2019-07-29   920  								 "sdcard_d3_z",
1499218c80c99ae Neil Armstrong      2019-07-29   921  								 "sdcard_cmd_z";
1499218c80c99ae Neil Armstrong      2019-07-29   922  							function = "sdcard";
1499218c80c99ae Neil Armstrong      2019-07-29   923  							bias-pull-up;
1499218c80c99ae Neil Armstrong      2019-07-29   924  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   925  						};
1499218c80c99ae Neil Armstrong      2019-07-29   926  
1499218c80c99ae Neil Armstrong      2019-07-29   927  						mux-1 {
1499218c80c99ae Neil Armstrong      2019-07-29   928  							groups = "sdcard_clk_z";
1499218c80c99ae Neil Armstrong      2019-07-29   929  							function = "sdcard";
1499218c80c99ae Neil Armstrong      2019-07-29   930  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   931  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   932  						};
1499218c80c99ae Neil Armstrong      2019-07-29   933  					};
1499218c80c99ae Neil Armstrong      2019-07-29   934  
1499218c80c99ae Neil Armstrong      2019-07-29   935  					sdcard_clk_gate_z_pins: sdcard_clk_gate_z {
1499218c80c99ae Neil Armstrong      2019-07-29   936  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   937  							groups = "GPIOZ_6";
1499218c80c99ae Neil Armstrong      2019-07-29   938  							function = "gpio_periphs";
1499218c80c99ae Neil Armstrong      2019-07-29   939  							bias-pull-down;
1499218c80c99ae Neil Armstrong      2019-07-29   940  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   941  						};
1499218c80c99ae Neil Armstrong      2019-07-29   942  					};
1499218c80c99ae Neil Armstrong      2019-07-29   943  
1499218c80c99ae Neil Armstrong      2019-07-29   944  					sdio_pins: sdio {
1499218c80c99ae Neil Armstrong      2019-07-29   945  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   946  							groups = "sdio_d0",
1499218c80c99ae Neil Armstrong      2019-07-29   947  								 "sdio_d1",
1499218c80c99ae Neil Armstrong      2019-07-29   948  								 "sdio_d2",
1499218c80c99ae Neil Armstrong      2019-07-29   949  								 "sdio_d3",
1499218c80c99ae Neil Armstrong      2019-07-29   950  								 "sdio_clk",
1499218c80c99ae Neil Armstrong      2019-07-29   951  								 "sdio_cmd";
1499218c80c99ae Neil Armstrong      2019-07-29   952  							function = "sdio";
1499218c80c99ae Neil Armstrong      2019-07-29   953  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   954  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   955  						};
1499218c80c99ae Neil Armstrong      2019-07-29   956  					};
1499218c80c99ae Neil Armstrong      2019-07-29   957  
1499218c80c99ae Neil Armstrong      2019-07-29   958  					sdio_clk_gate_pins: sdio_clk_gate {
1499218c80c99ae Neil Armstrong      2019-07-29   959  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   960  							groups = "GPIOX_4";
1499218c80c99ae Neil Armstrong      2019-07-29   961  							function = "gpio_periphs";
1499218c80c99ae Neil Armstrong      2019-07-29   962  							bias-pull-down;
1499218c80c99ae Neil Armstrong      2019-07-29   963  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29   964  						};
1499218c80c99ae Neil Armstrong      2019-07-29   965  					};
1499218c80c99ae Neil Armstrong      2019-07-29   966  
1499218c80c99ae Neil Armstrong      2019-07-29   967  					spdif_in_a10_pins: spdif-in-a10 {
1499218c80c99ae Neil Armstrong      2019-07-29   968  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   969  							groups = "spdif_in_a10";
1499218c80c99ae Neil Armstrong      2019-07-29   970  							function = "spdif_in";
1499218c80c99ae Neil Armstrong      2019-07-29   971  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   972  						};
1499218c80c99ae Neil Armstrong      2019-07-29   973  					};
1499218c80c99ae Neil Armstrong      2019-07-29   974  
1499218c80c99ae Neil Armstrong      2019-07-29   975  					spdif_in_a12_pins: spdif-in-a12 {
1499218c80c99ae Neil Armstrong      2019-07-29   976  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   977  							groups = "spdif_in_a12";
1499218c80c99ae Neil Armstrong      2019-07-29   978  							function = "spdif_in";
1499218c80c99ae Neil Armstrong      2019-07-29   979  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   980  						};
1499218c80c99ae Neil Armstrong      2019-07-29   981  					};
1499218c80c99ae Neil Armstrong      2019-07-29   982  
1499218c80c99ae Neil Armstrong      2019-07-29   983  					spdif_in_h_pins: spdif-in-h {
1499218c80c99ae Neil Armstrong      2019-07-29   984  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   985  							groups = "spdif_in_h";
1499218c80c99ae Neil Armstrong      2019-07-29   986  							function = "spdif_in";
1499218c80c99ae Neil Armstrong      2019-07-29   987  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   988  						};
1499218c80c99ae Neil Armstrong      2019-07-29   989  					};
1499218c80c99ae Neil Armstrong      2019-07-29   990  
1499218c80c99ae Neil Armstrong      2019-07-29   991  					spdif_out_h_pins: spdif-out-h {
1499218c80c99ae Neil Armstrong      2019-07-29   992  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29   993  							groups = "spdif_out_h";
1499218c80c99ae Neil Armstrong      2019-07-29   994  							function = "spdif_out";
84f6ab5fedf735a Jerome Brunet       2024-06-25   995  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29   996  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29   997  						};
1499218c80c99ae Neil Armstrong      2019-07-29   998  					};
1499218c80c99ae Neil Armstrong      2019-07-29   999  
1499218c80c99ae Neil Armstrong      2019-07-29  1000  					spdif_out_a11_pins: spdif-out-a11 {
1499218c80c99ae Neil Armstrong      2019-07-29  1001  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1002  							groups = "spdif_out_a11";
1499218c80c99ae Neil Armstrong      2019-07-29  1003  							function = "spdif_out";
84f6ab5fedf735a Jerome Brunet       2024-06-25  1004  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1005  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1006  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1007  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1008  
1499218c80c99ae Neil Armstrong      2019-07-29  1009  					spdif_out_a13_pins: spdif-out-a13 {
1499218c80c99ae Neil Armstrong      2019-07-29  1010  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1011  							groups = "spdif_out_a13";
1499218c80c99ae Neil Armstrong      2019-07-29  1012  							function = "spdif_out";
84f6ab5fedf735a Jerome Brunet       2024-06-25  1013  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1014  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1015  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1016  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1017  
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1018  					spicc0_x_pins: spicc0-x {
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1019  						mux {
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1020  							groups = "spi0_mosi_x",
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1021  							       "spi0_miso_x",
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1022  							       "spi0_clk_x";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1023  							function = "spi0";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1024  							drive-strength-microamp = <4000>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1025  							bias-disable;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1026  						};
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1027  					};
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1028  
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1029  					spicc0_ss0_x_pins: spicc0-ss0-x {
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1030  						mux {
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1031  							groups = "spi0_ss0_x";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1032  							function = "spi0";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1033  							drive-strength-microamp = <4000>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1034  							bias-disable;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1035  						};
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1036  					};
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1037  
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1038  					spicc0_c_pins: spicc0-c {
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1039  						mux {
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1040  							groups = "spi0_mosi_c",
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1041  							       "spi0_miso_c",
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1042  							       "spi0_ss0_c",
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1043  							       "spi0_clk_c";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1044  							function = "spi0";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1045  							drive-strength-microamp = <4000>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1046  							bias-disable;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1047  						};
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1048  					};
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1049  
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1050  					spicc1_pins: spicc1 {
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1051  						mux {
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1052  							groups = "spi1_mosi",
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1053  							       "spi1_miso",
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1054  							       "spi1_clk";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1055  							function = "spi1";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1056  							drive-strength-microamp = <4000>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1057  						};
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1058  					};
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1059  
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1060  					spicc1_ss0_pins: spicc1-ss0 {
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1061  						mux {
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1062  							groups = "spi1_ss0";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1063  							function = "spi1";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1064  							drive-strength-microamp = <4000>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1065  							bias-disable;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1066  						};
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1067  					};
5fa86f4f72e0494 Neil Armstrong      2020-03-13  1068  
1499218c80c99ae Neil Armstrong      2019-07-29  1069  					tdm_a_din0_pins: tdm-a-din0 {
1499218c80c99ae Neil Armstrong      2019-07-29  1070  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1071  							groups = "tdm_a_din0";
1499218c80c99ae Neil Armstrong      2019-07-29  1072  							function = "tdm_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1073  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1074  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1075  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1076  
1499218c80c99ae Neil Armstrong      2019-07-29  1077  
1499218c80c99ae Neil Armstrong      2019-07-29  1078  					tdm_a_din1_pins: tdm-a-din1 {
1499218c80c99ae Neil Armstrong      2019-07-29  1079  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1080  							groups = "tdm_a_din1";
1499218c80c99ae Neil Armstrong      2019-07-29  1081  							function = "tdm_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1082  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1083  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1084  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1085  
1499218c80c99ae Neil Armstrong      2019-07-29  1086  					tdm_a_dout0_pins: tdm-a-dout0 {
1499218c80c99ae Neil Armstrong      2019-07-29  1087  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1088  							groups = "tdm_a_dout0";
1499218c80c99ae Neil Armstrong      2019-07-29  1089  							function = "tdm_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1090  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1091  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1092  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1093  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1094  
1499218c80c99ae Neil Armstrong      2019-07-29  1095  					tdm_a_dout1_pins: tdm-a-dout1 {
1499218c80c99ae Neil Armstrong      2019-07-29  1096  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1097  							groups = "tdm_a_dout1";
1499218c80c99ae Neil Armstrong      2019-07-29  1098  							function = "tdm_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1099  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1100  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1101  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1102  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1103  
1499218c80c99ae Neil Armstrong      2019-07-29  1104  					tdm_a_fs_pins: tdm-a-fs {
1499218c80c99ae Neil Armstrong      2019-07-29  1105  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1106  							groups = "tdm_a_fs";
1499218c80c99ae Neil Armstrong      2019-07-29  1107  							function = "tdm_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1108  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1109  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1110  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1111  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1112  
1499218c80c99ae Neil Armstrong      2019-07-29  1113  					tdm_a_sclk_pins: tdm-a-sclk {
1499218c80c99ae Neil Armstrong      2019-07-29  1114  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1115  							groups = "tdm_a_sclk";
1499218c80c99ae Neil Armstrong      2019-07-29  1116  							function = "tdm_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1117  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1118  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1119  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1120  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1121  
1499218c80c99ae Neil Armstrong      2019-07-29  1122  					tdm_a_slv_fs_pins: tdm-a-slv-fs {
1499218c80c99ae Neil Armstrong      2019-07-29  1123  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1124  							groups = "tdm_a_slv_fs";
1499218c80c99ae Neil Armstrong      2019-07-29  1125  							function = "tdm_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1126  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1127  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1128  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1129  
1499218c80c99ae Neil Armstrong      2019-07-29  1130  
1499218c80c99ae Neil Armstrong      2019-07-29  1131  					tdm_a_slv_sclk_pins: tdm-a-slv-sclk {
1499218c80c99ae Neil Armstrong      2019-07-29  1132  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1133  							groups = "tdm_a_slv_sclk";
1499218c80c99ae Neil Armstrong      2019-07-29  1134  							function = "tdm_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1135  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1136  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1137  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1138  
1499218c80c99ae Neil Armstrong      2019-07-29  1139  					tdm_b_din0_pins: tdm-b-din0 {
1499218c80c99ae Neil Armstrong      2019-07-29  1140  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1141  							groups = "tdm_b_din0";
1499218c80c99ae Neil Armstrong      2019-07-29  1142  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1143  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1144  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1145  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1146  
1499218c80c99ae Neil Armstrong      2019-07-29  1147  					tdm_b_din1_pins: tdm-b-din1 {
1499218c80c99ae Neil Armstrong      2019-07-29  1148  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1149  							groups = "tdm_b_din1";
1499218c80c99ae Neil Armstrong      2019-07-29  1150  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1151  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1152  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1153  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1154  
1499218c80c99ae Neil Armstrong      2019-07-29  1155  					tdm_b_din2_pins: tdm-b-din2 {
1499218c80c99ae Neil Armstrong      2019-07-29  1156  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1157  							groups = "tdm_b_din2";
1499218c80c99ae Neil Armstrong      2019-07-29  1158  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1159  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1160  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1161  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1162  
1499218c80c99ae Neil Armstrong      2019-07-29  1163  					tdm_b_din3_a_pins: tdm-b-din3-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1164  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1165  							groups = "tdm_b_din3_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1166  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1167  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1168  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1169  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1170  
1499218c80c99ae Neil Armstrong      2019-07-29  1171  					tdm_b_din3_h_pins: tdm-b-din3-h {
1499218c80c99ae Neil Armstrong      2019-07-29  1172  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1173  							groups = "tdm_b_din3_h";
1499218c80c99ae Neil Armstrong      2019-07-29  1174  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1175  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1176  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1177  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1178  
1499218c80c99ae Neil Armstrong      2019-07-29  1179  					tdm_b_dout0_pins: tdm-b-dout0 {
1499218c80c99ae Neil Armstrong      2019-07-29  1180  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1181  							groups = "tdm_b_dout0";
1499218c80c99ae Neil Armstrong      2019-07-29  1182  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1183  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1184  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1185  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1186  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1187  
1499218c80c99ae Neil Armstrong      2019-07-29  1188  					tdm_b_dout1_pins: tdm-b-dout1 {
1499218c80c99ae Neil Armstrong      2019-07-29  1189  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1190  							groups = "tdm_b_dout1";
1499218c80c99ae Neil Armstrong      2019-07-29  1191  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1192  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1193  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1194  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1195  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1196  
1499218c80c99ae Neil Armstrong      2019-07-29  1197  					tdm_b_dout2_pins: tdm-b-dout2 {
1499218c80c99ae Neil Armstrong      2019-07-29  1198  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1199  							groups = "tdm_b_dout2";
1499218c80c99ae Neil Armstrong      2019-07-29  1200  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1201  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1202  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1203  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1204  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1205  
1499218c80c99ae Neil Armstrong      2019-07-29  1206  					tdm_b_dout3_a_pins: tdm-b-dout3-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1207  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1208  							groups = "tdm_b_dout3_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1209  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1210  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1211  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1212  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1213  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1214  
1499218c80c99ae Neil Armstrong      2019-07-29  1215  					tdm_b_dout3_h_pins: tdm-b-dout3-h {
1499218c80c99ae Neil Armstrong      2019-07-29  1216  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1217  							groups = "tdm_b_dout3_h";
1499218c80c99ae Neil Armstrong      2019-07-29  1218  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1219  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1220  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1221  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1222  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1223  
1499218c80c99ae Neil Armstrong      2019-07-29  1224  					tdm_b_fs_pins: tdm-b-fs {
1499218c80c99ae Neil Armstrong      2019-07-29  1225  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1226  							groups = "tdm_b_fs";
1499218c80c99ae Neil Armstrong      2019-07-29  1227  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1228  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1229  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1230  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1231  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1232  
1499218c80c99ae Neil Armstrong      2019-07-29  1233  					tdm_b_sclk_pins: tdm-b-sclk {
1499218c80c99ae Neil Armstrong      2019-07-29  1234  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1235  							groups = "tdm_b_sclk";
1499218c80c99ae Neil Armstrong      2019-07-29  1236  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1237  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1238  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1239  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1240  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1241  
1499218c80c99ae Neil Armstrong      2019-07-29  1242  					tdm_b_slv_fs_pins: tdm-b-slv-fs {
1499218c80c99ae Neil Armstrong      2019-07-29  1243  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1244  							groups = "tdm_b_slv_fs";
1499218c80c99ae Neil Armstrong      2019-07-29  1245  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1246  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1247  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1248  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1249  
1499218c80c99ae Neil Armstrong      2019-07-29  1250  					tdm_b_slv_sclk_pins: tdm-b-slv-sclk {
1499218c80c99ae Neil Armstrong      2019-07-29  1251  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1252  							groups = "tdm_b_slv_sclk";
1499218c80c99ae Neil Armstrong      2019-07-29  1253  							function = "tdm_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1254  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1255  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1256  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1257  
1499218c80c99ae Neil Armstrong      2019-07-29  1258  					tdm_c_din0_a_pins: tdm-c-din0-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1259  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1260  							groups = "tdm_c_din0_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1261  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1262  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1263  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1264  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1265  
1499218c80c99ae Neil Armstrong      2019-07-29  1266  					tdm_c_din0_z_pins: tdm-c-din0-z {
1499218c80c99ae Neil Armstrong      2019-07-29  1267  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1268  							groups = "tdm_c_din0_z";
1499218c80c99ae Neil Armstrong      2019-07-29  1269  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1270  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1271  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1272  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1273  
1499218c80c99ae Neil Armstrong      2019-07-29  1274  					tdm_c_din1_a_pins: tdm-c-din1-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1275  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1276  							groups = "tdm_c_din1_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1277  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1278  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1279  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1280  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1281  
1499218c80c99ae Neil Armstrong      2019-07-29  1282  					tdm_c_din1_z_pins: tdm-c-din1-z {
1499218c80c99ae Neil Armstrong      2019-07-29  1283  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1284  							groups = "tdm_c_din1_z";
1499218c80c99ae Neil Armstrong      2019-07-29  1285  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1286  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1287  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1288  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1289  
1499218c80c99ae Neil Armstrong      2019-07-29  1290  					tdm_c_din2_a_pins: tdm-c-din2-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1291  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1292  							groups = "tdm_c_din2_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1293  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1294  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1295  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1296  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1297  
1499218c80c99ae Neil Armstrong      2019-07-29  1298  					eth_leds_pins: eth-leds {
1499218c80c99ae Neil Armstrong      2019-07-29  1299  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1300  							groups = "eth_link_led",
1499218c80c99ae Neil Armstrong      2019-07-29  1301  								 "eth_act_led";
1499218c80c99ae Neil Armstrong      2019-07-29  1302  							function = "eth";
1499218c80c99ae Neil Armstrong      2019-07-29  1303  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1304  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1305  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1306  
1499218c80c99ae Neil Armstrong      2019-07-29  1307  					eth_pins: eth {
1499218c80c99ae Neil Armstrong      2019-07-29  1308  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1309  							groups = "eth_mdio",
1499218c80c99ae Neil Armstrong      2019-07-29  1310  								 "eth_mdc",
1499218c80c99ae Neil Armstrong      2019-07-29  1311  								 "eth_rgmii_rx_clk",
1499218c80c99ae Neil Armstrong      2019-07-29  1312  								 "eth_rx_dv",
1499218c80c99ae Neil Armstrong      2019-07-29  1313  								 "eth_rxd0",
1499218c80c99ae Neil Armstrong      2019-07-29  1314  								 "eth_rxd1",
1499218c80c99ae Neil Armstrong      2019-07-29  1315  								 "eth_txen",
1499218c80c99ae Neil Armstrong      2019-07-29  1316  								 "eth_txd0",
1499218c80c99ae Neil Armstrong      2019-07-29  1317  								 "eth_txd1";
1499218c80c99ae Neil Armstrong      2019-07-29  1318  							function = "eth";
1499218c80c99ae Neil Armstrong      2019-07-29  1319  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1320  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1321  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1322  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1323  
1499218c80c99ae Neil Armstrong      2019-07-29  1324  					eth_rgmii_pins: eth-rgmii {
1499218c80c99ae Neil Armstrong      2019-07-29  1325  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1326  							groups = "eth_rxd2_rgmii",
1499218c80c99ae Neil Armstrong      2019-07-29  1327  								 "eth_rxd3_rgmii",
1499218c80c99ae Neil Armstrong      2019-07-29  1328  								 "eth_rgmii_tx_clk",
1499218c80c99ae Neil Armstrong      2019-07-29  1329  								 "eth_txd2_rgmii",
1499218c80c99ae Neil Armstrong      2019-07-29  1330  								 "eth_txd3_rgmii";
1499218c80c99ae Neil Armstrong      2019-07-29  1331  							function = "eth";
1499218c80c99ae Neil Armstrong      2019-07-29  1332  							drive-strength-microamp = <4000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1333  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1334  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1335  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1336  
1499218c80c99ae Neil Armstrong      2019-07-29  1337  					tdm_c_din2_z_pins: tdm-c-din2-z {
1499218c80c99ae Neil Armstrong      2019-07-29  1338  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1339  							groups = "tdm_c_din2_z";
1499218c80c99ae Neil Armstrong      2019-07-29  1340  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1341  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1342  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1343  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1344  
1499218c80c99ae Neil Armstrong      2019-07-29  1345  					tdm_c_din3_a_pins: tdm-c-din3-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1346  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1347  							groups = "tdm_c_din3_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1348  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1349  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1350  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1351  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1352  
1499218c80c99ae Neil Armstrong      2019-07-29  1353  					tdm_c_din3_z_pins: tdm-c-din3-z {
1499218c80c99ae Neil Armstrong      2019-07-29  1354  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1355  							groups = "tdm_c_din3_z";
1499218c80c99ae Neil Armstrong      2019-07-29  1356  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1357  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1358  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1359  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1360  
1499218c80c99ae Neil Armstrong      2019-07-29  1361  					tdm_c_dout0_a_pins: tdm-c-dout0-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1362  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1363  							groups = "tdm_c_dout0_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1364  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1365  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1366  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1367  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1368  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1369  
1499218c80c99ae Neil Armstrong      2019-07-29  1370  					tdm_c_dout0_z_pins: tdm-c-dout0-z {
1499218c80c99ae Neil Armstrong      2019-07-29  1371  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1372  							groups = "tdm_c_dout0_z";
1499218c80c99ae Neil Armstrong      2019-07-29  1373  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1374  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1375  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1376  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1377  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1378  
1499218c80c99ae Neil Armstrong      2019-07-29  1379  					tdm_c_dout1_a_pins: tdm-c-dout1-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1380  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1381  							groups = "tdm_c_dout1_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1382  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1383  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1384  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1385  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1386  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1387  
1499218c80c99ae Neil Armstrong      2019-07-29  1388  					tdm_c_dout1_z_pins: tdm-c-dout1-z {
1499218c80c99ae Neil Armstrong      2019-07-29  1389  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1390  							groups = "tdm_c_dout1_z";
1499218c80c99ae Neil Armstrong      2019-07-29  1391  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1392  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1393  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1394  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1395  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1396  
1499218c80c99ae Neil Armstrong      2019-07-29  1397  					tdm_c_dout2_a_pins: tdm-c-dout2-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1398  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1399  							groups = "tdm_c_dout2_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1400  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1401  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1402  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1403  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1404  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1405  
1499218c80c99ae Neil Armstrong      2019-07-29  1406  					tdm_c_dout2_z_pins: tdm-c-dout2-z {
1499218c80c99ae Neil Armstrong      2019-07-29  1407  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1408  							groups = "tdm_c_dout2_z";
1499218c80c99ae Neil Armstrong      2019-07-29  1409  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1410  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1411  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1412  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1413  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1414  
1499218c80c99ae Neil Armstrong      2019-07-29  1415  					tdm_c_dout3_a_pins: tdm-c-dout3-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1416  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1417  							groups = "tdm_c_dout3_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1418  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1419  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1420  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1421  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1422  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1423  
1499218c80c99ae Neil Armstrong      2019-07-29  1424  					tdm_c_dout3_z_pins: tdm-c-dout3-z {
1499218c80c99ae Neil Armstrong      2019-07-29  1425  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1426  							groups = "tdm_c_dout3_z";
1499218c80c99ae Neil Armstrong      2019-07-29  1427  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1428  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1429  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1430  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1431  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1432  
1499218c80c99ae Neil Armstrong      2019-07-29  1433  					tdm_c_fs_a_pins: tdm-c-fs-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1434  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1435  							groups = "tdm_c_fs_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1436  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1437  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1438  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1439  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1440  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1441  
1499218c80c99ae Neil Armstrong      2019-07-29  1442  					tdm_c_fs_z_pins: tdm-c-fs-z {
1499218c80c99ae Neil Armstrong      2019-07-29  1443  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1444  							groups = "tdm_c_fs_z";
1499218c80c99ae Neil Armstrong      2019-07-29  1445  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1446  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1447  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1448  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1449  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1450  
1499218c80c99ae Neil Armstrong      2019-07-29  1451  					tdm_c_sclk_a_pins: tdm-c-sclk-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1452  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1453  							groups = "tdm_c_sclk_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1454  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1455  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1456  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1457  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1458  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1459  
1499218c80c99ae Neil Armstrong      2019-07-29  1460  					tdm_c_sclk_z_pins: tdm-c-sclk-z {
1499218c80c99ae Neil Armstrong      2019-07-29  1461  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1462  							groups = "tdm_c_sclk_z";
1499218c80c99ae Neil Armstrong      2019-07-29  1463  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1464  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1465  							drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1466  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1467  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1468  
1499218c80c99ae Neil Armstrong      2019-07-29  1469  					tdm_c_slv_fs_a_pins: tdm-c-slv-fs-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1470  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1471  							groups = "tdm_c_slv_fs_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1472  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1473  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1474  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1475  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1476  
1499218c80c99ae Neil Armstrong      2019-07-29  1477  					tdm_c_slv_fs_z_pins: tdm-c-slv-fs-z {
1499218c80c99ae Neil Armstrong      2019-07-29  1478  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1479  							groups = "tdm_c_slv_fs_z";
1499218c80c99ae Neil Armstrong      2019-07-29  1480  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1481  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1482  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1483  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1484  
1499218c80c99ae Neil Armstrong      2019-07-29  1485  					tdm_c_slv_sclk_a_pins: tdm-c-slv-sclk-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1486  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1487  							groups = "tdm_c_slv_sclk_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1488  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1489  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1490  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1491  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1492  
1499218c80c99ae Neil Armstrong      2019-07-29  1493  					tdm_c_slv_sclk_z_pins: tdm-c-slv-sclk-z {
1499218c80c99ae Neil Armstrong      2019-07-29  1494  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1495  							groups = "tdm_c_slv_sclk_z";
1499218c80c99ae Neil Armstrong      2019-07-29  1496  							function = "tdm_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1497  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1498  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1499  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1500  
1499218c80c99ae Neil Armstrong      2019-07-29  1501  					uart_a_pins: uart-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1502  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1503  							groups = "uart_a_tx",
1499218c80c99ae Neil Armstrong      2019-07-29  1504  								 "uart_a_rx";
1499218c80c99ae Neil Armstrong      2019-07-29  1505  							function = "uart_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1506  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1507  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1508  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1509  
1499218c80c99ae Neil Armstrong      2019-07-29  1510  					uart_a_cts_rts_pins: uart-a-cts-rts {
1499218c80c99ae Neil Armstrong      2019-07-29  1511  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1512  							groups = "uart_a_cts",
1499218c80c99ae Neil Armstrong      2019-07-29  1513  								 "uart_a_rts";
1499218c80c99ae Neil Armstrong      2019-07-29  1514  							function = "uart_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1515  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1516  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1517  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1518  
1499218c80c99ae Neil Armstrong      2019-07-29  1519  					uart_b_pins: uart-b {
1499218c80c99ae Neil Armstrong      2019-07-29  1520  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1521  							groups = "uart_b_tx",
1499218c80c99ae Neil Armstrong      2019-07-29  1522  								 "uart_b_rx";
1499218c80c99ae Neil Armstrong      2019-07-29  1523  							function = "uart_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1524  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1525  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1526  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1527  
1499218c80c99ae Neil Armstrong      2019-07-29  1528  					uart_c_pins: uart-c {
1499218c80c99ae Neil Armstrong      2019-07-29  1529  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1530  							groups = "uart_c_tx",
1499218c80c99ae Neil Armstrong      2019-07-29  1531  								 "uart_c_rx";
1499218c80c99ae Neil Armstrong      2019-07-29  1532  							function = "uart_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1533  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1534  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1535  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1536  
1499218c80c99ae Neil Armstrong      2019-07-29  1537  					uart_c_cts_rts_pins: uart-c-cts-rts {
1499218c80c99ae Neil Armstrong      2019-07-29  1538  						mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1539  							groups = "uart_c_cts",
1499218c80c99ae Neil Armstrong      2019-07-29  1540  								 "uart_c_rts";
1499218c80c99ae Neil Armstrong      2019-07-29  1541  							function = "uart_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1542  							bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1543  						};
1499218c80c99ae Neil Armstrong      2019-07-29  1544  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1545  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1546  			};
1499218c80c99ae Neil Armstrong      2019-07-29  1547  
8656783f07613ad Guillaume La Roque  2019-10-04  1548  			cpu_temp: temperature-sensor@34800 {
8656783f07613ad Guillaume La Roque  2019-10-04  1549  				compatible = "amlogic,g12a-cpu-thermal",
8656783f07613ad Guillaume La Roque  2019-10-04  1550  					     "amlogic,g12a-thermal";
8656783f07613ad Guillaume La Roque  2019-10-04  1551  				reg = <0x0 0x34800 0x0 0x50>;
8656783f07613ad Guillaume La Roque  2019-10-04  1552  				interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
8656783f07613ad Guillaume La Roque  2019-10-04  1553  				clocks = <&clkc CLKID_TS>;
8656783f07613ad Guillaume La Roque  2019-10-04  1554  				#thermal-sensor-cells = <0>;
8656783f07613ad Guillaume La Roque  2019-10-04  1555  				amlogic,ao-secure = <&sec_AO>;
8656783f07613ad Guillaume La Roque  2019-10-04  1556  			};
8656783f07613ad Guillaume La Roque  2019-10-04  1557  
8656783f07613ad Guillaume La Roque  2019-10-04  1558  			ddr_temp: temperature-sensor@34c00 {
8656783f07613ad Guillaume La Roque  2019-10-04  1559  				compatible = "amlogic,g12a-ddr-thermal",
8656783f07613ad Guillaume La Roque  2019-10-04  1560  					     "amlogic,g12a-thermal";
8656783f07613ad Guillaume La Roque  2019-10-04  1561  				reg = <0x0 0x34c00 0x0 0x50>;
8656783f07613ad Guillaume La Roque  2019-10-04  1562  				interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
8656783f07613ad Guillaume La Roque  2019-10-04  1563  				clocks = <&clkc CLKID_TS>;
8656783f07613ad Guillaume La Roque  2019-10-04  1564  				#thermal-sensor-cells = <0>;
8656783f07613ad Guillaume La Roque  2019-10-04  1565  				amlogic,ao-secure = <&sec_AO>;
8656783f07613ad Guillaume La Roque  2019-10-04  1566  			};
8656783f07613ad Guillaume La Roque  2019-10-04  1567  
1499218c80c99ae Neil Armstrong      2019-07-29  1568  			usb2_phy0: phy@36000 {
1499218c80c99ae Neil Armstrong      2019-07-29  1569  				compatible = "amlogic,g12a-usb2-phy";
1499218c80c99ae Neil Armstrong      2019-07-29  1570  				reg = <0x0 0x36000 0x0 0x2000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1571  				clocks = <&xtal>;
1499218c80c99ae Neil Armstrong      2019-07-29  1572  				clock-names = "xtal";
1499218c80c99ae Neil Armstrong      2019-07-29  1573  				resets = <&reset RESET_USB_PHY20>;
1499218c80c99ae Neil Armstrong      2019-07-29  1574  				reset-names = "phy";
1499218c80c99ae Neil Armstrong      2019-07-29  1575  				#phy-cells = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29  1576  			};
1499218c80c99ae Neil Armstrong      2019-07-29  1577  
1499218c80c99ae Neil Armstrong      2019-07-29  1578  			dmc: bus@38000 {
1499218c80c99ae Neil Armstrong      2019-07-29  1579  				compatible = "simple-bus";
1499218c80c99ae Neil Armstrong      2019-07-29  1580  				#address-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29  1581  				#size-cells = <2>;
aec4353114a408b Marc Gonzalez       2023-03-27  1582  				ranges = <0x0 0x0 0x0 0x38000 0x0 0x2000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1583  
1499218c80c99ae Neil Armstrong      2019-07-29  1584  				canvas: video-lut@48 {
1499218c80c99ae Neil Armstrong      2019-07-29  1585  					compatible = "amlogic,canvas";
1499218c80c99ae Neil Armstrong      2019-07-29  1586  					reg = <0x0 0x48 0x0 0x14>;
1499218c80c99ae Neil Armstrong      2019-07-29  1587  				};
33acea2049b5058 Marc Gonzalez       2023-03-27  1588  
33acea2049b5058 Marc Gonzalez       2023-03-27  1589  				pmu: pmu@80 {
33acea2049b5058 Marc Gonzalez       2023-03-27  1590  					reg = <0x0 0x80 0x0 0x40>,
33acea2049b5058 Marc Gonzalez       2023-03-27  1591  					      <0x0 0xc00 0x0 0x40>;
33acea2049b5058 Marc Gonzalez       2023-03-27  1592  					interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
33acea2049b5058 Marc Gonzalez       2023-03-27  1593  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1594  			};
1499218c80c99ae Neil Armstrong      2019-07-29  1595  
1499218c80c99ae Neil Armstrong      2019-07-29  1596  			usb2_phy1: phy@3a000 {
1499218c80c99ae Neil Armstrong      2019-07-29  1597  				compatible = "amlogic,g12a-usb2-phy";
1499218c80c99ae Neil Armstrong      2019-07-29  1598  				reg = <0x0 0x3a000 0x0 0x2000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1599  				clocks = <&xtal>;
1499218c80c99ae Neil Armstrong      2019-07-29  1600  				clock-names = "xtal";
1499218c80c99ae Neil Armstrong      2019-07-29  1601  				resets = <&reset RESET_USB_PHY21>;
1499218c80c99ae Neil Armstrong      2019-07-29  1602  				reset-names = "phy";
1499218c80c99ae Neil Armstrong      2019-07-29  1603  				#phy-cells = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29  1604  			};
1499218c80c99ae Neil Armstrong      2019-07-29  1605  
1499218c80c99ae Neil Armstrong      2019-07-29  1606  			hiu: bus@3c000 {
1499218c80c99ae Neil Armstrong      2019-07-29  1607  				compatible = "simple-bus";
1499218c80c99ae Neil Armstrong      2019-07-29  1608  				reg = <0x0 0x3c000 0x0 0x1400>;
1499218c80c99ae Neil Armstrong      2019-07-29  1609  				#address-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29  1610  				#size-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29  1611  				ranges = <0x0 0x0 0x0 0x3c000 0x0 0x1400>;
1499218c80c99ae Neil Armstrong      2019-07-29  1612  
1499218c80c99ae Neil Armstrong      2019-07-29  1613  				hhi: system-controller@0 {
1499218c80c99ae Neil Armstrong      2019-07-29  1614  					compatible = "amlogic,meson-gx-hhi-sysctrl",
1499218c80c99ae Neil Armstrong      2019-07-29  1615  						     "simple-mfd", "syscon";
1499218c80c99ae Neil Armstrong      2019-07-29  1616  					reg = <0 0 0 0x400>;
1499218c80c99ae Neil Armstrong      2019-07-29  1617  
1499218c80c99ae Neil Armstrong      2019-07-29  1618  					clkc: clock-controller {
1499218c80c99ae Neil Armstrong      2019-07-29  1619  						compatible = "amlogic,g12a-clkc";
1499218c80c99ae Neil Armstrong      2019-07-29  1620  						#clock-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  1621  						clocks = <&xtal>;
1499218c80c99ae Neil Armstrong      2019-07-29  1622  						clock-names = "xtal";
1499218c80c99ae Neil Armstrong      2019-07-29  1623  					};
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1624  
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1625  					pwrc: power-controller {
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1626  						compatible = "amlogic,meson-g12a-pwrc";
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1627  						#power-domain-cells = <1>;
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1628  						amlogic,ao-sysctrl = <&rti>;
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1629  						resets = <&reset RESET_VIU>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1630  							 <&reset RESET_VENC>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1631  							 <&reset RESET_VCBUS>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1632  							 <&reset RESET_BT656>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1633  							 <&reset RESET_RDMA>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1634  							 <&reset RESET_VENCI>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1635  							 <&reset RESET_VENCP>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1636  							 <&reset RESET_VDAC>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1637  							 <&reset RESET_VDI6>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1638  							 <&reset RESET_VENCL>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1639  							 <&reset RESET_VID_LOCK>;
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1640  						reset-names = "viu", "venc", "vcbus", "bt656",
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1641  							      "rdma", "venci", "vencp", "vdac",
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1642  							      "vdi6", "vencl", "vid_lock";
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1643  						clocks = <&clkc CLKID_VPU>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1644  							 <&clkc CLKID_VAPB>;
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1645  						clock-names = "vpu", "vapb";
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1646  						/*
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1647  						 * VPU clocking is provided by two identical clock paths
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1648  						 * VPU_0 and VPU_1 muxed to a single clock by a glitch
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1649  						 * free mux to safely change frequency while running.
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1650  						 * Same for VAPB but with a final gate after the glitch free mux.
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1651  						 */
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1652  						assigned-clocks = <&clkc CLKID_VPU_0_SEL>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1653  								  <&clkc CLKID_VPU_0>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1654  								  <&clkc CLKID_VPU>, /* Glitch free mux */
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1655  								  <&clkc CLKID_VAPB_0_SEL>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1656  								  <&clkc CLKID_VAPB_0>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1657  								  <&clkc CLKID_VAPB_SEL>; /* Glitch free mux */
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1658  						assigned-clock-parents = <&clkc CLKID_FCLK_DIV3>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1659  									 <0>, /* Do Nothing */
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1660  									 <&clkc CLKID_VPU_0>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1661  									 <&clkc CLKID_FCLK_DIV4>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1662  									 <0>, /* Do Nothing */
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1663  									 <&clkc CLKID_VAPB_0>;
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1664  						assigned-clock-rates = <0>, /* Do Nothing */
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1665  								       <666666666>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1666  								       <0>, /* Do Nothing */
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1667  								       <0>, /* Do Nothing */
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1668  								       <250000000>,
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1669  								       <0>; /* Do Nothing */
f4f1c8d9ace7a00 Neil Armstrong      2019-08-23  1670  					};
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1671  
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1672  					mipi_analog_dphy: phy {
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1673  						compatible = "amlogic,g12a-mipi-dphy-analog";
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1674  						#phy-cells = <0>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1675  						status = "disabled";
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1676  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1677  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1678  			};
1499218c80c99ae Neil Armstrong      2019-07-29  1679  
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1680  			mipi_dphy: phy@44000 {
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1681  				compatible = "amlogic,axg-mipi-dphy";
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1682  				reg = <0x0 0x44000 0x0 0x2000>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1683  				clocks = <&clkc CLKID_MIPI_DSI_PHY>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1684  				clock-names = "pclk";
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1685  				resets = <&reset RESET_MIPI_DSI_PHY>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1686  				reset-names = "phy";
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1687  				phys = <&mipi_analog_dphy>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1688  				phy-names = "analog";
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1689  				#phy-cells = <0>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1690  				status = "disabled";
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1691  			};
6f1c2a12ed1138c Neil Armstrong      2024-04-03  1692  
1499218c80c99ae Neil Armstrong      2019-07-29  1693  			usb3_pcie_phy: phy@46000 {
1499218c80c99ae Neil Armstrong      2019-07-29  1694  				compatible = "amlogic,g12a-usb3-pcie-phy";
1499218c80c99ae Neil Armstrong      2019-07-29  1695  				reg = <0x0 0x46000 0x0 0x2000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1696  				clocks = <&clkc CLKID_PCIE_PLL>;
1499218c80c99ae Neil Armstrong      2019-07-29  1697  				clock-names = "ref_clk";
1499218c80c99ae Neil Armstrong      2019-07-29  1698  				resets = <&reset RESET_PCIE_PHY>;
1499218c80c99ae Neil Armstrong      2019-07-29  1699  				reset-names = "phy";
1499218c80c99ae Neil Armstrong      2019-07-29  1700  				assigned-clocks = <&clkc CLKID_PCIE_PLL>;
1499218c80c99ae Neil Armstrong      2019-07-29  1701  				assigned-clock-rates = <100000000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1702  				#phy-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  1703  			};
1499218c80c99ae Neil Armstrong      2019-07-29  1704  
1499218c80c99ae Neil Armstrong      2019-07-29  1705  			eth_phy: mdio-multiplexer@4c000 {
1499218c80c99ae Neil Armstrong      2019-07-29  1706  				compatible = "amlogic,g12a-mdio-mux";
1499218c80c99ae Neil Armstrong      2019-07-29  1707  				reg = <0x0 0x4c000 0x0 0xa4>;
1499218c80c99ae Neil Armstrong      2019-07-29  1708  				clocks = <&clkc CLKID_ETH_PHY>,
1499218c80c99ae Neil Armstrong      2019-07-29  1709  					 <&xtal>,
1499218c80c99ae Neil Armstrong      2019-07-29  1710  					 <&clkc CLKID_MPLL_50M>;
1499218c80c99ae Neil Armstrong      2019-07-29  1711  				clock-names = "pclk", "clkin0", "clkin1";
1499218c80c99ae Neil Armstrong      2019-07-29  1712  				mdio-parent-bus = <&mdio0>;
1499218c80c99ae Neil Armstrong      2019-07-29  1713  				#address-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  1714  				#size-cells = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29  1715  
1499218c80c99ae Neil Armstrong      2019-07-29  1716  				ext_mdio: mdio@0 {
1499218c80c99ae Neil Armstrong      2019-07-29  1717  					reg = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29  1718  					#address-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  1719  					#size-cells = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29  1720  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1721  
1499218c80c99ae Neil Armstrong      2019-07-29  1722  				int_mdio: mdio@1 {
1499218c80c99ae Neil Armstrong      2019-07-29  1723  					reg = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  1724  					#address-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  1725  					#size-cells = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29  1726  
e7303651bbc76c8 Martin Blumenstingl 2023-01-11  1727  					internal_ephy: ethernet-phy@8 {
1499218c80c99ae Neil Armstrong      2019-07-29  1728  						compatible = "ethernet-phy-id0180.3301",
1499218c80c99ae Neil Armstrong      2019-07-29  1729  							     "ethernet-phy-ieee802.3-c22";
1499218c80c99ae Neil Armstrong      2019-07-29  1730  						interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
1499218c80c99ae Neil Armstrong      2019-07-29  1731  						reg = <8>;
1499218c80c99ae Neil Armstrong      2019-07-29  1732  						max-speed = <100>;
1499218c80c99ae Neil Armstrong      2019-07-29  1733  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1734  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1735  			};
1499218c80c99ae Neil Armstrong      2019-07-29  1736  		};
1499218c80c99ae Neil Armstrong      2019-07-29  1737  
1499218c80c99ae Neil Armstrong      2019-07-29  1738  		aobus: bus@ff800000 {
1499218c80c99ae Neil Armstrong      2019-07-29  1739  			compatible = "simple-bus";
1499218c80c99ae Neil Armstrong      2019-07-29  1740  			reg = <0x0 0xff800000 0x0 0x100000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1741  			#address-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29  1742  			#size-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29  1743  			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1744  
1499218c80c99ae Neil Armstrong      2019-07-29  1745  			rti: sys-ctrl@0 {
1499218c80c99ae Neil Armstrong      2019-07-29  1746  				compatible = "amlogic,meson-gx-ao-sysctrl",
1499218c80c99ae Neil Armstrong      2019-07-29  1747  					     "simple-mfd", "syscon";
1499218c80c99ae Neil Armstrong      2019-07-29  1748  				reg = <0x0 0x0 0x0 0x100>;
1499218c80c99ae Neil Armstrong      2019-07-29  1749  
1499218c80c99ae Neil Armstrong      2019-07-29  1750  				clkc_AO: clock-controller {
1499218c80c99ae Neil Armstrong      2019-07-29  1751  					compatible = "amlogic,meson-g12a-aoclkc";
1499218c80c99ae Neil Armstrong      2019-07-29  1752  					#clock-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  1753  					#reset-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  1754  					clocks = <&xtal>, <&clkc CLKID_CLK81>;
1499218c80c99ae Neil Armstrong      2019-07-29  1755  					clock-names = "xtal", "mpeg-clk";
1499218c80c99ae Neil Armstrong      2019-07-29  1756  				};
cf42ea27fd7f087 Neil Armstrong      2024-06-06  1757  			};
1499218c80c99ae Neil Armstrong      2019-07-29  1758  
cf42ea27fd7f087 Neil Armstrong      2024-06-06  1759  			ao_pinctrl: pinctrl@14 {
1499218c80c99ae Neil Armstrong      2019-07-29  1760  				compatible = "amlogic,meson-g12a-aobus-pinctrl";
1499218c80c99ae Neil Armstrong      2019-07-29  1761  				#address-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29  1762  				#size-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29  1763  				ranges;
1499218c80c99ae Neil Armstrong      2019-07-29  1764  
1499218c80c99ae Neil Armstrong      2019-07-29  1765  				gpio_ao: bank@14 {
1499218c80c99ae Neil Armstrong      2019-07-29  1766  					reg = <0x0 0x14 0x0 0x8>,
1499218c80c99ae Neil Armstrong      2019-07-29  1767  					      <0x0 0x1c 0x0 0x8>,
1499218c80c99ae Neil Armstrong      2019-07-29  1768  					      <0x0 0x24 0x0 0x14>;
1499218c80c99ae Neil Armstrong      2019-07-29  1769  					reg-names = "mux",
1499218c80c99ae Neil Armstrong      2019-07-29  1770  						    "ds",
1499218c80c99ae Neil Armstrong      2019-07-29  1771  						    "gpio";
1499218c80c99ae Neil Armstrong      2019-07-29  1772  					gpio-controller;
1499218c80c99ae Neil Armstrong      2019-07-29  1773  					#gpio-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29  1774  					gpio-ranges = <&ao_pinctrl 0 0 15>;
1499218c80c99ae Neil Armstrong      2019-07-29  1775  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1776  
1499218c80c99ae Neil Armstrong      2019-07-29  1777  				i2c_ao_sck_pins: i2c_ao_sck_pins {
1499218c80c99ae Neil Armstrong      2019-07-29  1778  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1779  						groups = "i2c_ao_sck";
1499218c80c99ae Neil Armstrong      2019-07-29  1780  						function = "i2c_ao";
1499218c80c99ae Neil Armstrong      2019-07-29  1781  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1782  						drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1783  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1784  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1785  
1499218c80c99ae Neil Armstrong      2019-07-29  1786  				i2c_ao_sda_pins: i2c_ao_sda {
1499218c80c99ae Neil Armstrong      2019-07-29  1787  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1788  						groups = "i2c_ao_sda";
1499218c80c99ae Neil Armstrong      2019-07-29  1789  						function = "i2c_ao";
1499218c80c99ae Neil Armstrong      2019-07-29  1790  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1791  						drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1792  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1793  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1794  
1499218c80c99ae Neil Armstrong      2019-07-29  1795  				i2c_ao_sck_e_pins: i2c_ao_sck_e {
1499218c80c99ae Neil Armstrong      2019-07-29  1796  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1797  						groups = "i2c_ao_sck_e";
1499218c80c99ae Neil Armstrong      2019-07-29  1798  						function = "i2c_ao";
1499218c80c99ae Neil Armstrong      2019-07-29  1799  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1800  						drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1801  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1802  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1803  
1499218c80c99ae Neil Armstrong      2019-07-29  1804  				i2c_ao_sda_e_pins: i2c_ao_sda_e {
1499218c80c99ae Neil Armstrong      2019-07-29  1805  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1806  						groups = "i2c_ao_sda_e";
1499218c80c99ae Neil Armstrong      2019-07-29  1807  						function = "i2c_ao";
1499218c80c99ae Neil Armstrong      2019-07-29  1808  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1809  						drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1810  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1811  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1812  
1499218c80c99ae Neil Armstrong      2019-07-29  1813  				mclk0_ao_pins: mclk0-ao {
1499218c80c99ae Neil Armstrong      2019-07-29  1814  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1815  						groups = "mclk0_ao";
1499218c80c99ae Neil Armstrong      2019-07-29  1816  						function = "mclk0_ao";
1499218c80c99ae Neil Armstrong      2019-07-29  1817  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1818  						drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1819  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1820  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1821  
1499218c80c99ae Neil Armstrong      2019-07-29  1822  				tdm_ao_b_din0_pins: tdm-ao-b-din0 {
1499218c80c99ae Neil Armstrong      2019-07-29  1823  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1824  						groups = "tdm_ao_b_din0";
1499218c80c99ae Neil Armstrong      2019-07-29  1825  						function = "tdm_ao_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1826  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1827  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1828  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1829  
1499218c80c99ae Neil Armstrong      2019-07-29  1830  				spdif_ao_out_pins: spdif-ao-out {
1499218c80c99ae Neil Armstrong      2019-07-29  1831  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1832  						groups = "spdif_ao_out";
1499218c80c99ae Neil Armstrong      2019-07-29  1833  						function = "spdif_ao_out";
84f6ab5fedf735a Jerome Brunet       2024-06-25  1834  						drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1835  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1836  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1837  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1838  
1499218c80c99ae Neil Armstrong      2019-07-29  1839  				tdm_ao_b_din1_pins: tdm-ao-b-din1 {
1499218c80c99ae Neil Armstrong      2019-07-29  1840  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1841  						groups = "tdm_ao_b_din1";
1499218c80c99ae Neil Armstrong      2019-07-29  1842  						function = "tdm_ao_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1843  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1844  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1845  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1846  
1499218c80c99ae Neil Armstrong      2019-07-29  1847  				tdm_ao_b_din2_pins: tdm-ao-b-din2 {
1499218c80c99ae Neil Armstrong      2019-07-29  1848  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1849  						groups = "tdm_ao_b_din2";
1499218c80c99ae Neil Armstrong      2019-07-29  1850  						function = "tdm_ao_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1851  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1852  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1853  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1854  
1499218c80c99ae Neil Armstrong      2019-07-29  1855  				tdm_ao_b_dout0_pins: tdm-ao-b-dout0 {
1499218c80c99ae Neil Armstrong      2019-07-29  1856  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1857  						groups = "tdm_ao_b_dout0";
1499218c80c99ae Neil Armstrong      2019-07-29  1858  						function = "tdm_ao_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1859  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1860  						drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1861  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1862  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1863  
1499218c80c99ae Neil Armstrong      2019-07-29  1864  				tdm_ao_b_dout1_pins: tdm-ao-b-dout1 {
1499218c80c99ae Neil Armstrong      2019-07-29  1865  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1866  						groups = "tdm_ao_b_dout1";
1499218c80c99ae Neil Armstrong      2019-07-29  1867  						function = "tdm_ao_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1868  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1869  						drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1870  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1871  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1872  
1499218c80c99ae Neil Armstrong      2019-07-29  1873  				tdm_ao_b_dout2_pins: tdm-ao-b-dout2 {
1499218c80c99ae Neil Armstrong      2019-07-29  1874  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1875  						groups = "tdm_ao_b_dout2";
1499218c80c99ae Neil Armstrong      2019-07-29  1876  						function = "tdm_ao_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1877  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1878  						drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1879  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1880  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1881  
1499218c80c99ae Neil Armstrong      2019-07-29  1882  				tdm_ao_b_fs_pins: tdm-ao-b-fs {
1499218c80c99ae Neil Armstrong      2019-07-29  1883  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1884  						groups = "tdm_ao_b_fs";
1499218c80c99ae Neil Armstrong      2019-07-29  1885  						function = "tdm_ao_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1886  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1887  						drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1888  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1889  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1890  
1499218c80c99ae Neil Armstrong      2019-07-29  1891  				tdm_ao_b_sclk_pins: tdm-ao-b-sclk {
1499218c80c99ae Neil Armstrong      2019-07-29  1892  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1893  						groups = "tdm_ao_b_sclk";
1499218c80c99ae Neil Armstrong      2019-07-29  1894  						function = "tdm_ao_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1895  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1896  						drive-strength-microamp = <3000>;
1499218c80c99ae Neil Armstrong      2019-07-29  1897  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1898  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1899  
1499218c80c99ae Neil Armstrong      2019-07-29  1900  				tdm_ao_b_slv_fs_pins: tdm-ao-b-slv-fs {
1499218c80c99ae Neil Armstrong      2019-07-29  1901  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1902  						groups = "tdm_ao_b_slv_fs";
1499218c80c99ae Neil Armstrong      2019-07-29  1903  						function = "tdm_ao_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1904  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1905  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1906  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1907  
1499218c80c99ae Neil Armstrong      2019-07-29  1908  				tdm_ao_b_slv_sclk_pins: tdm-ao-b-slv-sclk {
1499218c80c99ae Neil Armstrong      2019-07-29  1909  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1910  						groups = "tdm_ao_b_slv_sclk";
1499218c80c99ae Neil Armstrong      2019-07-29  1911  						function = "tdm_ao_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1912  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1913  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1914  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1915  
eeb12b07012f060 Theo Debrouwere     2024-09-05  1916  				uart_ao_a_pins: uart-ao-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1917  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1918  						groups = "uart_ao_a_tx",
1499218c80c99ae Neil Armstrong      2019-07-29  1919  							 "uart_ao_a_rx";
1499218c80c99ae Neil Armstrong      2019-07-29  1920  						function = "uart_ao_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1921  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1922  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1923  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1924  
1499218c80c99ae Neil Armstrong      2019-07-29  1925  				uart_ao_a_cts_rts_pins: uart-ao-a-cts-rts {
1499218c80c99ae Neil Armstrong      2019-07-29  1926  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1927  						groups = "uart_ao_a_cts",
1499218c80c99ae Neil Armstrong      2019-07-29  1928  							 "uart_ao_a_rts";
1499218c80c99ae Neil Armstrong      2019-07-29  1929  						function = "uart_ao_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1930  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1931  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1932  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1933  
2c420d79dae47f9 Gary Bisson         2022-01-12  1934  				uart_ao_b_2_3_pins: uart-ao-b-2-3 {
2c420d79dae47f9 Gary Bisson         2022-01-12  1935  					mux {
2c420d79dae47f9 Gary Bisson         2022-01-12  1936  						groups = "uart_ao_b_tx_2",
2c420d79dae47f9 Gary Bisson         2022-01-12  1937  							 "uart_ao_b_rx_3";
2c420d79dae47f9 Gary Bisson         2022-01-12  1938  						function = "uart_ao_b";
2c420d79dae47f9 Gary Bisson         2022-01-12  1939  						bias-disable;
2c420d79dae47f9 Gary Bisson         2022-01-12  1940  					};
2c420d79dae47f9 Gary Bisson         2022-01-12  1941  				};
2c420d79dae47f9 Gary Bisson         2022-01-12  1942  
2c420d79dae47f9 Gary Bisson         2022-01-12  1943  				uart_ao_b_8_9_pins: uart-ao-b-8-9 {
2c420d79dae47f9 Gary Bisson         2022-01-12  1944  					mux {
2c420d79dae47f9 Gary Bisson         2022-01-12  1945  						groups = "uart_ao_b_tx_8",
2c420d79dae47f9 Gary Bisson         2022-01-12  1946  							 "uart_ao_b_rx_9";
2c420d79dae47f9 Gary Bisson         2022-01-12  1947  						function = "uart_ao_b";
2c420d79dae47f9 Gary Bisson         2022-01-12  1948  						bias-disable;
2c420d79dae47f9 Gary Bisson         2022-01-12  1949  					};
2c420d79dae47f9 Gary Bisson         2022-01-12  1950  				};
2c420d79dae47f9 Gary Bisson         2022-01-12  1951  
2c420d79dae47f9 Gary Bisson         2022-01-12  1952  				uart_ao_b_cts_rts_pins: uart-ao-b-cts-rts {
2c420d79dae47f9 Gary Bisson         2022-01-12  1953  					mux {
2c420d79dae47f9 Gary Bisson         2022-01-12  1954  						groups = "uart_ao_b_cts",
2c420d79dae47f9 Gary Bisson         2022-01-12  1955  							 "uart_ao_b_rts";
2c420d79dae47f9 Gary Bisson         2022-01-12  1956  						function = "uart_ao_b";
2c420d79dae47f9 Gary Bisson         2022-01-12  1957  						bias-disable;
2c420d79dae47f9 Gary Bisson         2022-01-12  1958  					};
2c420d79dae47f9 Gary Bisson         2022-01-12  1959  				};
2c420d79dae47f9 Gary Bisson         2022-01-12  1960  
cca30c891247fc3 Neil Armstrong      2019-07-29  1961  				pwm_a_e_pins: pwm-a-e {
cca30c891247fc3 Neil Armstrong      2019-07-29  1962  					mux {
cca30c891247fc3 Neil Armstrong      2019-07-29  1963  						groups = "pwm_a_e";
cca30c891247fc3 Neil Armstrong      2019-07-29  1964  						function = "pwm_a_e";
cca30c891247fc3 Neil Armstrong      2019-07-29  1965  						bias-disable;
cca30c891247fc3 Neil Armstrong      2019-07-29  1966  					};
cca30c891247fc3 Neil Armstrong      2019-07-29  1967  				};
cca30c891247fc3 Neil Armstrong      2019-07-29  1968  
1499218c80c99ae Neil Armstrong      2019-07-29  1969  				pwm_ao_a_pins: pwm-ao-a {
1499218c80c99ae Neil Armstrong      2019-07-29  1970  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1971  						groups = "pwm_ao_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1972  						function = "pwm_ao_a";
1499218c80c99ae Neil Armstrong      2019-07-29  1973  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1974  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1975  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1976  
1499218c80c99ae Neil Armstrong      2019-07-29  1977  				pwm_ao_b_pins: pwm-ao-b {
1499218c80c99ae Neil Armstrong      2019-07-29  1978  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1979  						groups = "pwm_ao_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1980  						function = "pwm_ao_b";
1499218c80c99ae Neil Armstrong      2019-07-29  1981  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1982  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1983  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1984  
1499218c80c99ae Neil Armstrong      2019-07-29  1985  				pwm_ao_c_4_pins: pwm-ao-c-4 {
1499218c80c99ae Neil Armstrong      2019-07-29  1986  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1987  						groups = "pwm_ao_c_4";
1499218c80c99ae Neil Armstrong      2019-07-29  1988  						function = "pwm_ao_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1989  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1990  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1991  				};
1499218c80c99ae Neil Armstrong      2019-07-29  1992  
1499218c80c99ae Neil Armstrong      2019-07-29  1993  				pwm_ao_c_6_pins: pwm-ao-c-6 {
1499218c80c99ae Neil Armstrong      2019-07-29  1994  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  1995  						groups = "pwm_ao_c_6";
1499218c80c99ae Neil Armstrong      2019-07-29  1996  						function = "pwm_ao_c";
1499218c80c99ae Neil Armstrong      2019-07-29  1997  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  1998  					};
1499218c80c99ae Neil Armstrong      2019-07-29  1999  				};
1499218c80c99ae Neil Armstrong      2019-07-29  2000  
1499218c80c99ae Neil Armstrong      2019-07-29  2001  				pwm_ao_d_5_pins: pwm-ao-d-5 {
1499218c80c99ae Neil Armstrong      2019-07-29  2002  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  2003  						groups = "pwm_ao_d_5";
1499218c80c99ae Neil Armstrong      2019-07-29  2004  						function = "pwm_ao_d";
1499218c80c99ae Neil Armstrong      2019-07-29  2005  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  2006  					};
1499218c80c99ae Neil Armstrong      2019-07-29  2007  				};
1499218c80c99ae Neil Armstrong      2019-07-29  2008  
1499218c80c99ae Neil Armstrong      2019-07-29  2009  				pwm_ao_d_10_pins: pwm-ao-d-10 {
1499218c80c99ae Neil Armstrong      2019-07-29  2010  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  2011  						groups = "pwm_ao_d_10";
1499218c80c99ae Neil Armstrong      2019-07-29  2012  						function = "pwm_ao_d";
1499218c80c99ae Neil Armstrong      2019-07-29  2013  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  2014  					};
1499218c80c99ae Neil Armstrong      2019-07-29  2015  				};
1499218c80c99ae Neil Armstrong      2019-07-29  2016  
1499218c80c99ae Neil Armstrong      2019-07-29  2017  				pwm_ao_d_e_pins: pwm-ao-d-e {
1499218c80c99ae Neil Armstrong      2019-07-29  2018  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  2019  						groups = "pwm_ao_d_e";
1499218c80c99ae Neil Armstrong      2019-07-29  2020  						function = "pwm_ao_d";
1499218c80c99ae Neil Armstrong      2019-07-29  2021  					};
1499218c80c99ae Neil Armstrong      2019-07-29  2022  				};
1499218c80c99ae Neil Armstrong      2019-07-29  2023  
1499218c80c99ae Neil Armstrong      2019-07-29  2024  				remote_input_ao_pins: remote-input-ao {
1499218c80c99ae Neil Armstrong      2019-07-29  2025  					mux {
1499218c80c99ae Neil Armstrong      2019-07-29  2026  						groups = "remote_ao_input";
1499218c80c99ae Neil Armstrong      2019-07-29  2027  						function = "remote_ao_input";
1499218c80c99ae Neil Armstrong      2019-07-29  2028  						bias-disable;
1499218c80c99ae Neil Armstrong      2019-07-29  2029  					};
1499218c80c99ae Neil Armstrong      2019-07-29  2030  				};
1499218c80c99ae Neil Armstrong      2019-07-29  2031  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2032  
d9421d6c52942be Kevin Hilman        2021-04-21  2033  			vrtc: rtc@a8 {
a833a15e5969053 Kevin Hilman        2019-08-07  2034  				compatible = "amlogic,meson-vrtc";
a833a15e5969053 Kevin Hilman        2019-08-07  2035  				reg = <0x0 0x000a8 0x0 0x4>;
a833a15e5969053 Kevin Hilman        2019-08-07  2036  			};
a833a15e5969053 Kevin Hilman        2019-08-07  2037  
1499218c80c99ae Neil Armstrong      2019-07-29  2038  			cec_AO: cec@100 {
1499218c80c99ae Neil Armstrong      2019-07-29  2039  				compatible = "amlogic,meson-gx-ao-cec";
1499218c80c99ae Neil Armstrong      2019-07-29  2040  				reg = <0x0 0x00100 0x0 0x14>;
1499218c80c99ae Neil Armstrong      2019-07-29  2041  				interrupts = <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>;
1499218c80c99ae Neil Armstrong      2019-07-29  2042  				clocks = <&clkc_AO CLKID_AO_CEC>;
1499218c80c99ae Neil Armstrong      2019-07-29  2043  				clock-names = "core";
1499218c80c99ae Neil Armstrong      2019-07-29  2044  				status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29  2045  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2046  
1499218c80c99ae Neil Armstrong      2019-07-29  2047  			sec_AO: ao-secure@140 {
1499218c80c99ae Neil Armstrong      2019-07-29  2048  				compatible = "amlogic,meson-gx-ao-secure", "syscon";
1499218c80c99ae Neil Armstrong      2019-07-29  2049  				reg = <0x0 0x140 0x0 0x140>;
1499218c80c99ae Neil Armstrong      2019-07-29  2050  				amlogic,has-chip-id;
1499218c80c99ae Neil Armstrong      2019-07-29  2051  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2052  
1499218c80c99ae Neil Armstrong      2019-07-29  2053  			cecb_AO: cec@280 {
1499218c80c99ae Neil Armstrong      2019-07-29  2054  				compatible = "amlogic,meson-g12a-ao-cec";
1499218c80c99ae Neil Armstrong      2019-07-29  2055  				reg = <0x0 0x00280 0x0 0x1c>;
1499218c80c99ae Neil Armstrong      2019-07-29  2056  				interrupts = <GIC_SPI 203 IRQ_TYPE_EDGE_RISING>;
1499218c80c99ae Neil Armstrong      2019-07-29  2057  				clocks = <&clkc_AO CLKID_AO_CTS_OSCIN>;
1499218c80c99ae Neil Armstrong      2019-07-29  2058  				clock-names = "oscin";
1499218c80c99ae Neil Armstrong      2019-07-29  2059  				status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29  2060  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2061  
1499218c80c99ae Neil Armstrong      2019-07-29  2062  			pwm_AO_cd: pwm@2000 {
e6884f2e412959f Martin Blumenstingl 2024-12-27  2063  				compatible = "amlogic,meson-g12-pwm-v2",
e6884f2e412959f Martin Blumenstingl 2024-12-27  2064  					     "amlogic,meson8-pwm-v2";
1499218c80c99ae Neil Armstrong      2019-07-29  2065  				reg = <0x0 0x2000 0x0 0x20>;
e6884f2e412959f Martin Blumenstingl 2024-12-27  2066  				clocks = <&xtal>,
e6884f2e412959f Martin Blumenstingl 2024-12-27  2067  					 <&clkc_AO CLKID_AO_CLK81>;
1499218c80c99ae Neil Armstrong      2019-07-29  2068  				#pwm-cells = <3>;
1499218c80c99ae Neil Armstrong      2019-07-29  2069  				status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29  2070  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2071  
1499218c80c99ae Neil Armstrong      2019-07-29  2072  			uart_AO: serial@3000 {
f335201ba28fc20 Martin Blumenstingl 2023-03-07  2073  				compatible = "amlogic,meson-g12a-uart",
f335201ba28fc20 Martin Blumenstingl 2023-03-07  2074  					     "amlogic,meson-gx-uart",
1499218c80c99ae Neil Armstrong      2019-07-29  2075  					     "amlogic,meson-ao-uart";
1499218c80c99ae Neil Armstrong      2019-07-29  2076  				reg = <0x0 0x3000 0x0 0x18>;
1499218c80c99ae Neil Armstrong      2019-07-29  2077  				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
1499218c80c99ae Neil Armstrong      2019-07-29  2078  				clocks = <&xtal>, <&clkc_AO CLKID_AO_UART>, <&xtal>;
1499218c80c99ae Neil Armstrong      2019-07-29  2079  				clock-names = "xtal", "pclk", "baud";
1499218c80c99ae Neil Armstrong      2019-07-29  2080  				status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29  2081  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2082  
1499218c80c99ae Neil Armstrong      2019-07-29  2083  			uart_AO_B: serial@4000 {
f335201ba28fc20 Martin Blumenstingl 2023-03-07  2084  				compatible = "amlogic,meson-g12a-uart",
f335201ba28fc20 Martin Blumenstingl 2023-03-07  2085  					     "amlogic,meson-gx-uart",
1499218c80c99ae Neil Armstrong      2019-07-29  2086  					     "amlogic,meson-ao-uart";
1499218c80c99ae Neil Armstrong      2019-07-29  2087  				reg = <0x0 0x4000 0x0 0x18>;
1499218c80c99ae Neil Armstrong      2019-07-29  2088  				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
1499218c80c99ae Neil Armstrong      2019-07-29  2089  				clocks = <&xtal>, <&clkc_AO CLKID_AO_UART2>, <&xtal>;
1499218c80c99ae Neil Armstrong      2019-07-29  2090  				clock-names = "xtal", "pclk", "baud";
1499218c80c99ae Neil Armstrong      2019-07-29  2091  				status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29  2092  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2093  
1499218c80c99ae Neil Armstrong      2019-07-29  2094  			i2c_AO: i2c@5000 {
1499218c80c99ae Neil Armstrong      2019-07-29  2095  				compatible = "amlogic,meson-axg-i2c";
1499218c80c99ae Neil Armstrong      2019-07-29  2096  				status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29  2097  				reg = <0x0 0x05000 0x0 0x20>;
1499218c80c99ae Neil Armstrong      2019-07-29  2098  				interrupts = <GIC_SPI 195 IRQ_TYPE_EDGE_RISING>;
1499218c80c99ae Neil Armstrong      2019-07-29  2099  				#address-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  2100  				#size-cells = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29  2101  				clocks = <&clkc CLKID_I2C>;
1499218c80c99ae Neil Armstrong      2019-07-29  2102  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2103  
1499218c80c99ae Neil Armstrong      2019-07-29  2104  			pwm_AO_ab: pwm@7000 {
e6884f2e412959f Martin Blumenstingl 2024-12-27  2105  				compatible = "amlogic,meson-g12-pwm-v2",
e6884f2e412959f Martin Blumenstingl 2024-12-27  2106  					     "amlogic,meson8-pwm-v2";
1499218c80c99ae Neil Armstrong      2019-07-29  2107  				reg = <0x0 0x7000 0x0 0x20>;
e6884f2e412959f Martin Blumenstingl 2024-12-27  2108  				clocks = <&xtal>,
e6884f2e412959f Martin Blumenstingl 2024-12-27  2109  					 <&clkc_AO CLKID_AO_CLK81>,
e6884f2e412959f Martin Blumenstingl 2024-12-27  2110  					 <&clkc CLKID_FCLK_DIV4>,
e6884f2e412959f Martin Blumenstingl 2024-12-27  2111  					 <&clkc CLKID_FCLK_DIV5>;
1499218c80c99ae Neil Armstrong      2019-07-29  2112  				#pwm-cells = <3>;
1499218c80c99ae Neil Armstrong      2019-07-29  2113  				status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29  2114  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2115  
1499218c80c99ae Neil Armstrong      2019-07-29  2116  			ir: ir@8000 {
1499218c80c99ae Neil Armstrong      2019-07-29  2117  				compatible = "amlogic,meson-gxbb-ir";
1499218c80c99ae Neil Armstrong      2019-07-29  2118  				reg = <0x0 0x8000 0x0 0x20>;
1499218c80c99ae Neil Armstrong      2019-07-29  2119  				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
1499218c80c99ae Neil Armstrong      2019-07-29  2120  				status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29  2121  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2122  
1499218c80c99ae Neil Armstrong      2019-07-29  2123  			saradc: adc@9000 {
1499218c80c99ae Neil Armstrong      2019-07-29  2124  				compatible = "amlogic,meson-g12a-saradc",
1499218c80c99ae Neil Armstrong      2019-07-29  2125  					     "amlogic,meson-saradc";
1499218c80c99ae Neil Armstrong      2019-07-29  2126  				reg = <0x0 0x9000 0x0 0x48>;
1499218c80c99ae Neil Armstrong      2019-07-29  2127  				#io-channel-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  2128  				interrupts = <GIC_SPI 200 IRQ_TYPE_EDGE_RISING>;
1499218c80c99ae Neil Armstrong      2019-07-29  2129  				clocks = <&xtal>,
1499218c80c99ae Neil Armstrong      2019-07-29  2130  					 <&clkc_AO CLKID_AO_SAR_ADC>,
1499218c80c99ae Neil Armstrong      2019-07-29  2131  					 <&clkc_AO CLKID_AO_SAR_ADC_CLK>,
1499218c80c99ae Neil Armstrong      2019-07-29  2132  					 <&clkc_AO CLKID_AO_SAR_ADC_SEL>;
1499218c80c99ae Neil Armstrong      2019-07-29  2133  				clock-names = "clkin", "core", "adc_clk", "adc_sel";
1499218c80c99ae Neil Armstrong      2019-07-29  2134  				status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29  2135  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2136  		};
1499218c80c99ae Neil Armstrong      2019-07-29  2137  
fbceee82c19a423 Maxime Jourdan      2019-11-20  2138  		vdec: video-decoder@ff620000 {
fbceee82c19a423 Maxime Jourdan      2019-11-20  2139  			compatible = "amlogic,g12a-vdec";
fbceee82c19a423 Maxime Jourdan      2019-11-20  2140  			reg = <0x0 0xff620000 0x0 0x10000>,
fbceee82c19a423 Maxime Jourdan      2019-11-20  2141  			      <0x0 0xffd0e180 0x0 0xe4>;
fbceee82c19a423 Maxime Jourdan      2019-11-20  2142  			reg-names = "dos", "esparser";
fbceee82c19a423 Maxime Jourdan      2019-11-20  2143  			interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING>,
fbceee82c19a423 Maxime Jourdan      2019-11-20  2144  				     <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
fbceee82c19a423 Maxime Jourdan      2019-11-20  2145  			interrupt-names = "vdec", "esparser";
fbceee82c19a423 Maxime Jourdan      2019-11-20  2146  
fbceee82c19a423 Maxime Jourdan      2019-11-20  2147  			amlogic,ao-sysctrl = <&rti>;
fbceee82c19a423 Maxime Jourdan      2019-11-20  2148  			amlogic,canvas = <&canvas>;
fbceee82c19a423 Maxime Jourdan      2019-11-20  2149  
fbceee82c19a423 Maxime Jourdan      2019-11-20  2150  			clocks = <&clkc CLKID_PARSER>,
fbceee82c19a423 Maxime Jourdan      2019-11-20  2151  				 <&clkc CLKID_DOS>,
fbceee82c19a423 Maxime Jourdan      2019-11-20  2152  				 <&clkc CLKID_VDEC_1>,
fbceee82c19a423 Maxime Jourdan      2019-11-20  2153  				 <&clkc CLKID_VDEC_HEVC>,
fbceee82c19a423 Maxime Jourdan      2019-11-20  2154  				 <&clkc CLKID_VDEC_HEVCF>;
fbceee82c19a423 Maxime Jourdan      2019-11-20  2155  			clock-names = "dos_parser", "dos", "vdec_1",
fbceee82c19a423 Maxime Jourdan      2019-11-20  2156  				      "vdec_hevc", "vdec_hevcf";
fbceee82c19a423 Maxime Jourdan      2019-11-20  2157  			resets = <&reset RESET_PARSER>;
fbceee82c19a423 Maxime Jourdan      2019-11-20  2158  			reset-names = "esparser";
fbceee82c19a423 Maxime Jourdan      2019-11-20  2159  		};
fbceee82c19a423 Maxime Jourdan      2019-11-20  2160  
1499218c80c99ae Neil Armstrong      2019-07-29  2161  		vpu: vpu@ff900000 {
1499218c80c99ae Neil Armstrong      2019-07-29  2162  			compatible = "amlogic,meson-g12a-vpu";
1499218c80c99ae Neil Armstrong      2019-07-29  2163  			reg = <0x0 0xff900000 0x0 0x100000>,
1499218c80c99ae Neil Armstrong      2019-07-29  2164  			      <0x0 0xff63c000 0x0 0x1000>;
1499218c80c99ae Neil Armstrong      2019-07-29  2165  			reg-names = "vpu", "hhi";
1499218c80c99ae Neil Armstrong      2019-07-29  2166  			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
1499218c80c99ae Neil Armstrong      2019-07-29  2167  			#address-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  2168  			#size-cells = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29  2169  			amlogic,canvas = <&canvas>;
1499218c80c99ae Neil Armstrong      2019-07-29  2170  
1499218c80c99ae Neil Armstrong      2019-07-29  2171  			/* CVBS VDAC output port */
1499218c80c99ae Neil Armstrong      2019-07-29  2172  			cvbs_vdac_port: port@0 {
1499218c80c99ae Neil Armstrong      2019-07-29  2173  				reg = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29  2174  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2175  
1499218c80c99ae Neil Armstrong      2019-07-29  2176  			/* HDMI-TX output port */
1499218c80c99ae Neil Armstrong      2019-07-29  2177  			hdmi_tx_port: port@1 {
1499218c80c99ae Neil Armstrong      2019-07-29  2178  				reg = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  2179  
1499218c80c99ae Neil Armstrong      2019-07-29  2180  				hdmi_tx_out: endpoint {
1499218c80c99ae Neil Armstrong      2019-07-29  2181  					remote-endpoint = <&hdmi_tx_in>;
1499218c80c99ae Neil Armstrong      2019-07-29  2182  				};
1499218c80c99ae Neil Armstrong      2019-07-29  2183  			};
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2184  
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2185  			/* DPI output port */
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2186  			dpi_port: port@2 {
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2187  				reg = <2>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2188  
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2189  				dpi_out: endpoint {
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2190  					remote-endpoint = <&mipi_dsi_in>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2191  				};
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2192  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2193  		};
1499218c80c99ae Neil Armstrong      2019-07-29  2194  
1499218c80c99ae Neil Armstrong      2019-07-29  2195  		gic: interrupt-controller@ffc01000 {
1499218c80c99ae Neil Armstrong      2019-07-29  2196  			compatible = "arm,gic-400";
1499218c80c99ae Neil Armstrong      2019-07-29  2197  			reg = <0x0 0xffc01000 0 0x1000>,
1499218c80c99ae Neil Armstrong      2019-07-29  2198  			      <0x0 0xffc02000 0 0x2000>,
1499218c80c99ae Neil Armstrong      2019-07-29  2199  			      <0x0 0xffc04000 0 0x2000>,
1499218c80c99ae Neil Armstrong      2019-07-29  2200  			      <0x0 0xffc06000 0 0x2000>;
1499218c80c99ae Neil Armstrong      2019-07-29  2201  			interrupt-controller;
1499218c80c99ae Neil Armstrong      2019-07-29  2202  			interrupts = <GIC_PPI 9
1499218c80c99ae Neil Armstrong      2019-07-29  2203  				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
1499218c80c99ae Neil Armstrong      2019-07-29  2204  			#interrupt-cells = <3>;
1499218c80c99ae Neil Armstrong      2019-07-29  2205  			#address-cells = <0>;
1499218c80c99ae Neil Armstrong      2019-07-29  2206  		};
1499218c80c99ae Neil Armstrong      2019-07-29  2207  
1499218c80c99ae Neil Armstrong      2019-07-29  2208  		cbus: bus@ffd00000 {
1499218c80c99ae Neil Armstrong      2019-07-29  2209  			compatible = "simple-bus";
1499218c80c99ae Neil Armstrong      2019-07-29  2210  			reg = <0x0 0xffd00000 0x0 0x100000>;
1499218c80c99ae Neil Armstrong      2019-07-29  2211  			#address-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29  2212  			#size-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29  2213  			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x100000>;
1499218c80c99ae Neil Armstrong      2019-07-29  2214  
1499218c80c99ae Neil Armstrong      2019-07-29  2215  			reset: reset-controller@1004 {
795e7de8c7afc22 Neil Armstrong      2019-08-23  2216  				compatible = "amlogic,meson-axg-reset";
1499218c80c99ae Neil Armstrong      2019-07-29  2217  				reg = <0x0 0x1004 0x0 0x9c>;
1499218c80c99ae Neil Armstrong      2019-07-29  2218  				#reset-cells = <1>;
1499218c80c99ae Neil Armstrong      2019-07-29  2219  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2220  
1499218c80c99ae Neil Armstrong      2019-07-29  2221  			gpio_intc: interrupt-controller@f080 {
1499218c80c99ae Neil Armstrong      2019-07-29  2222  				compatible = "amlogic,meson-g12a-gpio-intc",
1499218c80c99ae Neil Armstrong      2019-07-29  2223  					     "amlogic,meson-gpio-intc";
1499218c80c99ae Neil Armstrong      2019-07-29  2224  				reg = <0x0 0xf080 0x0 0x10>;
1499218c80c99ae Neil Armstrong      2019-07-29  2225  				interrupt-controller;
1499218c80c99ae Neil Armstrong      2019-07-29  2226  				#interrupt-cells = <2>;
1499218c80c99ae Neil Armstrong      2019-07-29  2227  				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
1499218c80c99ae Neil Armstrong      2019-07-29  2228  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2229  
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2230  			mipi_dsi: dsi@7000 {
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2231  				compatible = "amlogic,meson-g12a-dw-mipi-dsi";
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2232  				reg = <0x0 0x7000 0x0 0x1000>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2233  				resets = <&reset RESET_MIPI_DSI_HOST>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2234  				reset-names = "top";
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2235  				clocks = <&clkc CLKID_MIPI_DSI_HOST>,
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2236  					 <&clkc CLKID_MIPI_DSI_PXCLK>,
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2237  					 <&clkc CLKID_CTS_ENCL>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2238  				clock-names = "pclk", "bit", "px";
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2239  				phys = <&mipi_dphy>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2240  				phy-names = "dphy";
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2241  				#address-cells = <1>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2242  				#size-cells = <0>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2243  				status = "disabled";
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2244  
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2245  				assigned-clocks = <&clkc CLKID_MIPI_DSI_PXCLK_SEL>,
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2246  					 <&clkc CLKID_CTS_ENCL_SEL>,
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2247  					 <&clkc CLKID_VCLK2_SEL>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2248  				assigned-clock-parents = <&clkc CLKID_GP0_PLL>,
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2249  					 <&clkc CLKID_VCLK2_DIV1>,
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2250  					 <&clkc CLKID_GP0_PLL>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2251  
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2252  				ports {
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2253  					#address-cells = <1>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2254  					#size-cells = <0>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2255  
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2256  					/* VPU VENC Input */
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2257  					mipi_dsi_venc_port: port@0 {
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2258  						reg = <0>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2259  
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2260  						mipi_dsi_in: endpoint {
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2261  							remote-endpoint = <&dpi_out>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2262  						};
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2263  					};
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2264  
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2265  					/* DSI Output */
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2266  					mipi_dsi_panel_port: port@1 {
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2267  						reg = <1>;
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2268  					};
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2269  				};
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2270  			};
6f1c2a12ed1138c Neil Armstrong      2024-04-03  2271  
d9421d6c52942be Kevin Hilman        2021-04-21  2272  			watchdog: watchdog@f0d0 {
7bd5175918eb4b2 Christian Hewitt    2020-11-01  2273  				compatible = "amlogic,meson-gxbb-wdt";
7bd5175918eb4b2 Christian Hewitt    2020-11-01  2274  				reg = <0x0 0xf0d0 0x0 0x10>;
7bd5175918eb4b2 Christian Hewitt    2020-11-01  2275  				clocks = <&xtal>;
7bd5175918eb4b2 Christian Hewitt    2020-11-01  2276  			};
7bd5175918eb4b2 Christian Hewitt    2020-11-01  2277  
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2278  			spicc0: spi@13000 {
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2279  				compatible = "amlogic,meson-g12a-spicc";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2280  				reg = <0x0 0x13000 0x0 0x44>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2281  				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2282  				clocks = <&clkc CLKID_SPICC0>,
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2283  					 <&clkc CLKID_SPICC0_SCLK>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2284  				clock-names = "core", "pclk";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2285  				#address-cells = <1>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2286  				#size-cells = <0>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2287  				status = "disabled";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2288  			};
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2289  
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2290  			spicc1: spi@15000 {
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2291  				compatible = "amlogic,meson-g12a-spicc";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2292  				reg = <0x0 0x15000 0x0 0x44>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2293  				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2294  				clocks = <&clkc CLKID_SPICC1>,
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2295  					 <&clkc CLKID_SPICC1_SCLK>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2296  				clock-names = "core", "pclk";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2297  				#address-cells = <1>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2298  				#size-cells = <0>;
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2299  				status = "disabled";
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2300  			};
5fa86f4f72e0494 Neil Armstrong      2020-03-13  2301  
f12a463d2f43b9c Neil Armstrong      2020-03-13  2302  			spifc: spi@14000 {
f12a463d2f43b9c Neil Armstrong      2020-03-13  2303  				compatible = "amlogic,meson-gxbb-spifc";
f12a463d2f43b9c Neil Armstrong      2020-03-13  2304  				status = "disabled";
f12a463d2f43b9c Neil Armstrong      2020-03-13  2305  				reg = <0x0 0x14000 0x0 0x80>;
f12a463d2f43b9c Neil Armstrong      2020-03-13  2306  				#address-cells = <1>;
f12a463d2f43b9c Neil Armstrong      2020-03-13  2307  				#size-cells = <0>;
f12a463d2f43b9c Neil Armstrong      2020-03-13  2308  				clocks = <&clkc CLKID_CLK81>;
f12a463d2f43b9c Neil Armstrong      2020-03-13  2309  			};
f12a463d2f43b9c Neil Armstrong      2020-03-13  2310  
1499218c80c99ae Neil Armstrong      2019-07-29  2311  			pwm_ef: pwm@19000 {
e6884f2e412959f Martin Blumenstingl 2024-12-27  2312  				compatible = "amlogic,meson-g12-pwm-v2",
e6884f2e412959f Martin Blumenstingl 2024-12-27  2313  					     "amlogic,meson8-pwm-v2";
1499218c80c99ae Neil Armstrong      2019-07-29  2314  				reg = <0x0 0x19000 0x0 0x20>;
e6884f2e412959f Martin Blumenstingl 2024-12-27 @2315  				clocks = <&xtal>,
a08b28c1ed45450 Martin Blumenstingl 2025-04-20  2316  					 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
e6884f2e412959f Martin Blumenstingl 2024-12-27  2317  					 <&clkc CLKID_FCLK_DIV4>,
e6884f2e412959f Martin Blumenstingl 2024-12-27  2318  					 <&clkc CLKID_FCLK_DIV3>;
1499218c80c99ae Neil Armstrong      2019-07-29  2319  				#pwm-cells = <3>;
696ab4ead474994 Steve Jeong         2024-01-17  2320  				clocks = <&xtal>,
696ab4ead474994 Steve Jeong         2024-01-17  2321  					<&xtal>,
696ab4ead474994 Steve Jeong         2024-01-17  2322  					<&xtal>,
696ab4ead474994 Steve Jeong         2024-01-17  2323  					<&xtal>;
696ab4ead474994 Steve Jeong         2024-01-17  2324  				clock-names = "clkin0",
696ab4ead474994 Steve Jeong         2024-01-17  2325  					"clkin1",
696ab4ead474994 Steve Jeong         2024-01-17  2326  					"clkin2",
696ab4ead474994 Steve Jeong         2024-01-17  2327  					"clkin3";
1499218c80c99ae Neil Armstrong      2019-07-29  2328  				status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29  2329  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2330  
1499218c80c99ae Neil Armstrong      2019-07-29  2331  			pwm_cd: pwm@1a000 {
e6884f2e412959f Martin Blumenstingl 2024-12-27  2332  				compatible = "amlogic,meson-g12-pwm-v2",
e6884f2e412959f Martin Blumenstingl 2024-12-27  2333  					     "amlogic,meson8-pwm-v2";
1499218c80c99ae Neil Armstrong      2019-07-29  2334  				reg = <0x0 0x1a000 0x0 0x20>;
e6884f2e412959f Martin Blumenstingl 2024-12-27 @2335  				clocks = <&xtal>,
a08b28c1ed45450 Martin Blumenstingl 2025-04-20  2336  					 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
e6884f2e412959f Martin Blumenstingl 2024-12-27  2337  					 <&clkc CLKID_FCLK_DIV4>,
e6884f2e412959f Martin Blumenstingl 2024-12-27  2338  					 <&clkc CLKID_FCLK_DIV3>;
1499218c80c99ae Neil Armstrong      2019-07-29  2339  				#pwm-cells = <3>;
696ab4ead474994 Steve Jeong         2024-01-17  2340  				clocks = <&xtal>,
696ab4ead474994 Steve Jeong         2024-01-17  2341  					<&xtal>,
696ab4ead474994 Steve Jeong         2024-01-17  2342  					<&xtal>,
696ab4ead474994 Steve Jeong         2024-01-17  2343  					<&xtal>;
696ab4ead474994 Steve Jeong         2024-01-17  2344  				clock-names = "clkin0",
696ab4ead474994 Steve Jeong         2024-01-17  2345  					"clkin1",
696ab4ead474994 Steve Jeong         2024-01-17  2346  					"clkin2",
696ab4ead474994 Steve Jeong         2024-01-17  2347  					"clkin3";
1499218c80c99ae Neil Armstrong      2019-07-29  2348  				status = "disabled";
1499218c80c99ae Neil Armstrong      2019-07-29  2349  			};
1499218c80c99ae Neil Armstrong      2019-07-29  2350  
1499218c80c99ae Neil Armstrong      2019-07-29  2351  			pwm_ab: pwm@1b000 {
e6884f2e412959f Martin Blumenstingl 2024-12-27  2352  				compatible = "amlogic,meson-g12-pwm-v2",
e6884f2e412959f Martin Blumenstingl 2024-12-27  2353  					     "amlogic,meson8-pwm-v2";
1499218c80c99ae Neil Armstrong      2019-07-29  2354  				reg = <0x0 0x1b000 0x0 0x20>;
e6884f2e412959f Martin Blumenstingl 2024-12-27 @2355  				clocks = <&xtal>,

:::::: The code at line 2315 was first introduced by commit
:::::: e6884f2e412959f0cea16c0b3d3571ba950617da arm64: dts: amlogic: g12: switch to the new PWM controller binding

:::::: TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
:::::: CC: Neil Armstrong <neil.armstrong@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
