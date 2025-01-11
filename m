Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9433F17BED0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736586926; cv=none; b=SrrEECT3p8QV2noSan8hfFiRXNSP2wq6KiX9K3VouazRz3I1GxY5hpDJTo/Nh0Tsd5ovI5bm+jmZsC5g7MYy5LEiMjLNmYlVnP8daB5weLZzkcMy0WWfGtda1FtnRhNBYrAcpOuSi9t2YOBYT1MYenNKYwQMe3PBOPpDY4giVIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736586926; c=relaxed/simple;
	bh=sswMfUSB5763PmHdr7TPsKKr7qSMy2w9D2hz8XEW6oA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sNYWP5FHrC+Q9JkIwNsD/urLswv9uL90jkGCWGYpnaJrAuH1ByP+Ni6oWe6yo82nft+bbPZm65tnqLvq+c2JVXLHUd1+D5Ud1/1NJXS1xf47i7V5NyrnJhzJ/k3/kX2cxIuxmw+f98A1OBe2XNrhw3Li+XnVxaOVWmXfSU3zXSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akXDStQU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akXDStQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736586925; x=1768122925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sswMfUSB5763PmHdr7TPsKKr7qSMy2w9D2hz8XEW6oA=;
  b=akXDStQU5KRMbXi3d9612McCTK0bAy7lR1VgowXvtghTG6jwRpl+24g8
   YnTAHLt/+yJKiCC5LDFR/yeMe+5+cmbeOgflqyNSsfyUf5XQ0vmnuJ22h
   +X7xZpJINHFyDFNX05rnVqM1E1K2gHepOk7X994Oywk12Ge0zVpcp8YRm
   JWu1qYMcj8tOWsdhksXz/JdrkEBsUiNnAvfx9a5nD7E6LvffcSRrCI7zb
   vxtRKCK5KkS+xVJaZ79wiDMDS9Zbl85jErjRHfviNSAjzr945hmfVX0Hy
   8GpRCovKBMIDwP21W8yD0NjGGri4FfrnMP5MH07ONupjiqfoQQQhw1ncu
   w==;
X-CSE-ConnectionGUID: L2Qjb327TZSJKuqP1jtMtQ==
X-CSE-MsgGUID: PydwAWckQDG3MHwiWVxjnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="24486920"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="24486920"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 01:15:24 -0800
X-CSE-ConnectionGUID: NffpYoqGR5+jOcwQ2rR5VQ==
X-CSE-MsgGUID: dyx8dzuTRSOJTEG35asptw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="104509070"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jan 2025 01:15:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWXaS-000KQX-2b;
	Sat, 11 Jan 2025 09:15:20 +0000
Date: Sat, 11 Jan 2025 17:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com
Subject: [xilinx-xlnx:lkp_test 497/504]
 arch/arm64/boot/dts/xilinx/zynqmp-sc-vn-p-b2197-00-revA.dtso:180:2: warning:
 '/*' within block comment
Message-ID: <202501111756.IcKlG6rs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: c55a45b8733c05d614ac84dd252c0dbebc4a99f5 [497/504] arm64: zynqmp: Add/Update/Sync DTs for xilinx platforms
config: arm64-randconfig-052-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111756.IcKlG6rs-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111756.IcKlG6rs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111756.IcKlG6rs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/boot/dts/xilinx/zynqmp-sc-vn-p-b2197-00-revA.dtso:180:2: warning: '/*' within block comment [-Wcomment]
           /* i2c_main_1 - u147 - j157 - disable translation, add 8 */
           ^
   1 warning generated.


vim +180 arch/arm64/boot/dts/xilinx/zynqmp-sc-vn-p-b2197-00-revA.dtso

   131	
   132	&i2c1 {
   133		#address-cells = <1>;
   134		#size-cells = <0>;
   135	
   136		/* u97 eeprom at 0x54 described in sc-revB - WP protection via BOARD_EEPROM_WP - J1801 */
   137		/* DC/SE eeprom at 0x52 */
   138		x_prc_eeprom: eeprom@52 { /* u4 - DC card identification - possible WP */
   139			compatible = "atmel,24c02";
   140			reg = <0x52>;
   141			bootph-all;
   142		};
   143	
   144		x_prc_tca9534: gpio@22 { /* u5 */
   145			compatible = "nxp,pca9534";
   146			reg = <0x22>;
   147			gpio-controller; /* IRQ not connected */
   148			#gpio-cells = <2>;
   149			gpio-line-names = "xprc_sw_1", "xprc_sw_2", "xprc_sw_3", "xprc_sw_4",
   150						"", "", "", "";
   151			gtr-sel0-hog {
   152				gpio-hog;
   153				gpios = <0 0>;
   154				input; /* FIXME add meaning */
   155				line-name = "xprc_sw_1";
   156			};
   157			gtr-sel1-hog {
   158				gpio-hog;
   159				gpios = <1 0>;
   160				input; /* FIXME add meaning */
   161				line-name = "xprc_sw_1";
   162			};
   163			gtr-sel2-hog {
   164				gpio-hog;
   165				gpios = <2 0>;
   166				input; /* FIXME add meaning */
   167				line-name = "xprc_sw_1";
   168			};
   169			gtr-sel3-hog {
   170				gpio-hog;
   171				gpios = <3 0>;
   172				input; /* FIXME add meaning */
   173				line-name = "xprc_sw_1";
   174			};
   175		};
   176	
   177		/* FMC eeproms at 0x50/0x51 */
   178		/* via j3/j5 to 0x68 to u32/9FGV1006C
   179	
 > 180		/* i2c_main_1 - u147 - j157 - disable translation, add 8 */
   181		/* J1 - OE for u43@55 + 8 - 161,132813MHz - QSFP56G_0 */
   182		qsfp56g_0_clk: clock-controller@5d {
   183			compatible = "renesas,proxo-xp";
   184			reg = <0x5d>;
   185			#clock-cells = <0>;
   186			clock-output-names = "qsfp56g_0_clk";
   187		};
   188	
   189		/* J2 - OE for u41@57 + 8 - 322,265625MHz - QSFP56G_1 */
   190		qsfp56g_1_clk: clock-controller@5f {
   191			compatible = "renesas,proxo-xp";
   192			reg = <0x5f>;
   193			#clock-cells = <0>;
   194			clock-output-names = "qsfp56g_1_clk";
   195		};
   196	
   197		/* J81 - OE for u115@50 + 8 - 320MHz - LPDDR5_C0 */
   198		lpddr5_c0_clk: clock-controller@58 {
   199			compatible = "renesas,proxo-xp";
   200			reg = <0x58>;
   201			#clock-cells = <0>;
   202			clock-output-names = "lpddr5_c0_clk";
   203		};
   204	
   205		/* i2c_main_2 - u148 - j122 - disable translation, add 9 */
   206		/* J112 - OE for u63@50 + 9 - 320MHz - LPDDR5_C2 */
   207		lpddr5_c2_clk: clock-controller@59 {
   208			compatible = "renesas,proxo-xp";
   209			reg = <0x59>;
   210			#clock-cells = <0>;
   211			clock-output-names = "lpddr5_c2_clk";
   212		};
   213	
   214		/* i2c_main_3 - u149 - j154 - disable translation, add 6 */
   215		/* J78 - OE for u116@50 + 6  - 320MHz - DDR5_UDIMM */
   216		ddr5_udimm_clk: clock-controller@56 {
   217			compatible = "renesas,proxo-xp";
   218			reg = <0x56>;
   219			#clock-cells = <0>;
   220			clock-output-names = "ddr5_udimm_clk";
   221		};
   222	
   223		/* i2c_main_4 - u150 - j146 - disable translation, add 5 */
   224		/* J107 - OE for u39@50 + 5 - 33,3333MHz - PS_REFCLK */
   225		ps_refclk: clock-controller@55 {
   226			compatible = "renesas,proxo-xp";
   227			reg = <0x55>;
   228			#clock-cells = <0>;
   229			clock-output-names = "ps_refclk";
   230		};
   231	
   232		/* i2c_main_5 - u1782 - j1798 - disable translation, add 7 */
   233		/* J77 - OE for u1783@50 + 7 - 320MHz - DDR4 */
   234		ddr4_clk: clock-controller@57 {
   235			compatible = "renesas,proxo-xp";
   236			reg = <0x57>;
   237			#clock-cells = <0>;
   238			clock-output-names = "ddr4_clk";
   239		};
   240	
   241		/* LTC4316 - not wired XORH/XORL - FIXME */
   242		/* J3 gate - FIXME should be connected for SW handling */
   243		/* i2c_main_1 bus */
   244		i2c1_u32: clock-controller@68 {
   245			compatible = "renesas,9fgv1006";
   246			reg = <0x68>;
   247		};
   248	
   249		/* J71 - selection to LP_I2C_SCL_J or LP_I2C_PMC_SCL_J */
   250		/* J70 - selection to LP_I2C_SDA_J or LP_I2C_PMC_SDA_J */
   251		/* this should be SW controlable too */
   252	};
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
