Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E3A18D65E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 05:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740116894; cv=none; b=BiIl3IrlLYT3K7t61TKGYvmeQlnhj/nSFO7WVEHi5B8ZENlI/DDMOJUzxpcLt9f8XVEBDr4GAC17U+4NFPp2DaF4aGrw8rX5n3dpcC5pkhQU0VW9Rpwkc7eKRMAvQd5It9ZEBQJN5aur9BrsGTNDgjTq5BTO/IdYH1LhHJP9t2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740116894; c=relaxed/simple;
	bh=EDWn0x1xKb9bUTCXXqR7p1qL+4KKQLWvWs8e6aCG9cw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+E93VhCJFgLaKmwCQgrJIORMrbw/rT9KceAvUExP+heg/DtFZ79dg7XO1KsW6vXCnjz3WZET4g8VClkpAjGcCnKDQhRu4iQhVCx7hobQIvCwrJGfaG9UvsoQTbhD7qgVFjjh/fvvfyEoHO9z9kaQEEWL09bPSAndYo+AJBbPwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCTGYzb9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCTGYzb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740116892; x=1771652892;
  h=date:from:cc:subject:message-id:mime-version;
  bh=EDWn0x1xKb9bUTCXXqR7p1qL+4KKQLWvWs8e6aCG9cw=;
  b=hCTGYzb94Y1XyXbfoOaD24/KC0iSrUzUef1u7ubmCRGVkWi2BuQoZ45X
   DUw+TEWbMeJCzuPbSRdHyuARuSqIqs+vNIdRWhiqpwvQMOVNQi9wXLyMK
   yhpnWDKLhpbYRxDeYgDZ2wgZCjagyQEpaaVmGHgqf0bEMqWyoKeHiaD/d
   /Q0b/Xzp79E+Rfsfq2pv2sEr0ousp962AvcUp22mHm+ZeBqevd+0OD2F3
   oEnM4+PXMv4dmOlY/KZjtANtpWJVEf3L0zi8g1KfcOh5iYzTg7PG67ob2
   31haQ9e2n1DmBtRjd60Y6XfwLD2M52mY6nMioVwujDv/JURCq9z+J8sbQ
   g==;
X-CSE-ConnectionGUID: xlKsjP3oRJSAaYxvD7P/PA==
X-CSE-MsgGUID: fuGTLCqjT/iqzBxLOLD5HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41131947"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41131947"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 21:48:11 -0800
X-CSE-ConnectionGUID: A27MsZUGQQybRyp2Ug+UIA==
X-CSE-MsgGUID: vahnayw/SBm2cSKw/HT34w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="146140007"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Feb 2025 21:48:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlLtO-0005AF-2n
	for oe-kbuild-all@lists.linux.dev;
	Fri, 21 Feb 2025 05:48:06 +0000
Date: Fri, 21 Feb 2025 13:47:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1]
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi:108.33-129.7: Warning
 (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a
 unit name, but no reg property
Message-ID: <202502211303.DQ3UeegO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 11a7bea17c9e0a36daab934d83e15a760f402147 [1/1] arm64: dts: meson: g12a: add pinctrl support controllers
config: arm64-randconfig-003-20250217 (https://download.01.org/0day-ci/archive/20250221/202502211303.DQ3UeegO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211303.DQ3UeegO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211303.DQ3UeegO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/meson-g12a.dtsi:108.33-129.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-g12a.dtsi:177.28-194.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-g12a.dtsi:108.33-129.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12a.dtsi:78.35-81.5: Warning (unique_unit_address): /reserved-memory/secmon@5000000: duplicate unit-address (also used in node /reserved-memory/bl32@5000000)
--
>> arch/arm64/boot/dts/amlogic/meson-g12a.dtsi:108.33-129.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-g12a.dtsi:177.28-194.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-g12a.dtsi:108.33-129.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property

vim +108 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi

    10	
    11	/ {
    12		compatible = "amlogic,g12a";
    13	
    14		interrupt-parent = <&gic>;
    15		#address-cells = <2>;
    16		#size-cells = <2>;
    17	
    18		cpus {
    19			#address-cells = <0x2>;
    20			#size-cells = <0x0>;
    21	
    22			cpu0: cpu@0 {
    23				device_type = "cpu";
    24				compatible = "arm,cortex-a53";
    25				reg = <0x0 0x0>;
    26				enable-method = "psci";
    27				next-level-cache = <&l2>;
    28			};
    29	
    30			cpu1: cpu@1 {
    31				device_type = "cpu";
    32				compatible = "arm,cortex-a53";
    33				reg = <0x0 0x1>;
    34				enable-method = "psci";
    35				next-level-cache = <&l2>;
    36			};
    37	
    38			cpu2: cpu@2 {
    39				device_type = "cpu";
    40				compatible = "arm,cortex-a53";
    41				reg = <0x0 0x2>;
    42				enable-method = "psci";
    43				next-level-cache = <&l2>;
    44			};
    45	
    46			cpu3: cpu@3 {
    47				device_type = "cpu";
    48				compatible = "arm,cortex-a53";
    49				reg = <0x0 0x3>;
    50				enable-method = "psci";
    51				next-level-cache = <&l2>;
    52			};
    53	
    54			l2: l2-cache0 {
    55				compatible = "cache";
    56			};
    57		};
    58	
    59		efuse: efuse {
    60			compatible = "amlogic,meson-gxbb-efuse";
    61			clocks = <&clkc CLKID_EFUSE>;
    62			#address-cells = <1>;
    63			#size-cells = <1>;
    64			read-only;
    65		};
    66	
    67		psci {
    68			compatible = "arm,psci-1.0";
    69			method = "smc";
    70		};
    71	
    72		reserved-memory {
    73			#address-cells = <2>;
    74			#size-cells = <2>;
    75			ranges;
    76	
    77			/* 3 MiB reserved for ARM Trusted Firmware (BL31) */
    78			secmon_reserved: secmon@5000000 {
    79				reg = <0x0 0x05000000 0x0 0x300000>;
    80				no-map;
    81			};
    82		};
    83	
    84		sm: secure-monitor {
    85			compatible = "amlogic,meson-gxbb-sm";
    86		};
    87	
    88		soc {
    89			compatible = "simple-bus";
    90			#address-cells = <2>;
    91			#size-cells = <2>;
    92			ranges;
    93	
    94			apb: bus@ff600000 {
    95				compatible = "simple-bus";
    96				reg = <0x0 0xff600000 0x0 0x200000>;
    97				#address-cells = <2>;
    98				#size-cells = <2>;
    99				ranges = <0x0 0x0 0x0 0xff600000 0x0 0x200000>;
   100	
   101				periphs: bus@34400 {
   102					compatible = "simple-bus";
   103					reg = <0x0 0x34400 0x0 0x400>;
   104					#address-cells = <2>;
   105					#size-cells = <2>;
   106					ranges = <0x0 0x0 0x0 0x34400 0x0 0x400>;
   107	
 > 108					periphs_pinctrl: pinctrl@40 {
   109						compatible = "amlogic,meson-g12a-periphs-pinctrl";
   110						#address-cells = <2>;
   111						#size-cells = <2>;
   112						ranges;
   113	
   114						gpio: bank@40 {
   115							reg = <0x0 0x40  0x0 0x4c>,
   116							      <0x0 0xe8  0x0 0x18>,
   117							      <0x0 0x120 0x0 0x18>,
   118							      <0x0 0x2c0 0x0 0x40>,
   119							      <0x0 0x340 0x0 0x1c>;
   120							reg-names = "gpio",
   121								    "pull",
   122								    "pull-enable",
   123								    "mux",
   124								    "ds";
   125							gpio-controller;
   126							#gpio-cells = <2>;
   127							gpio-ranges = <&periphs_pinctrl 0 0 86>;
   128						};
   129					};
   130				};
   131	
   132				hiu: bus@3c000 {
   133					compatible = "simple-bus";
   134					reg = <0x0 0x3c000 0x0 0x1400>;
   135					#address-cells = <2>;
   136					#size-cells = <2>;
   137					ranges = <0x0 0x0 0x0 0x3c000 0x0 0x1400>;
   138	
   139					hhi: system-controller@0 {
   140						compatible = "amlogic,meson-gx-hhi-sysctrl",
   141							     "simple-mfd", "syscon";
   142						reg = <0 0 0 0x400>;
   143	
   144						clkc: clock-controller {
   145							compatible = "amlogic,g12a-clkc";
   146							#clock-cells = <1>;
   147							clocks = <&xtal>;
   148							clock-names = "xtal";
   149						};
   150					};
   151				};
   152			};
   153	
   154			aobus: bus@ff800000 {
   155				compatible = "simple-bus";
   156				reg = <0x0 0xff800000 0x0 0x100000>;
   157				#address-cells = <2>;
   158				#size-cells = <2>;
   159				ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
   160	
   161				rti: sys-ctrl@0 {
   162					compatible = "amlogic,meson-gx-ao-sysctrl",
   163						     "simple-mfd", "syscon";
   164					reg = <0x0 0x0 0x0 0x100>;
   165					#address-cells = <2>;
   166					#size-cells = <2>;
   167					ranges = <0x0 0x0 0x0 0x0 0x0 0x100>;
   168	
   169					clkc_AO: clock-controller {
   170						compatible = "amlogic,meson-g12a-aoclkc";
   171						#clock-cells = <1>;
   172						#reset-cells = <1>;
   173						clocks = <&xtal>, <&clkc CLKID_CLK81>;
   174						clock-names = "xtal", "mpeg-clk";
   175					};
   176	
 > 177					ao_pinctrl: pinctrl@14 {
   178						compatible = "amlogic,meson-g12a-aobus-pinctrl";
   179						#address-cells = <2>;
   180						#size-cells = <2>;
   181						ranges;
   182	
   183						gpio_ao: bank@14 {
   184							reg = <0x0 0x14 0x0 0x8>,
   185							      <0x0 0x1c 0x0 0x8>,
   186							      <0x0 0x24 0x0 0x14>;
   187							reg-names = "mux",
   188								    "ds",
   189								    "gpio";
   190							gpio-controller;
   191							#gpio-cells = <2>;
   192							gpio-ranges = <&ao_pinctrl 0 0 15>;
   193						};
   194					};
   195				};
   196	
   197				sec_AO: ao-secure@140 {
   198					compatible = "amlogic,meson-gx-ao-secure", "syscon";
   199					reg = <0x0 0x140 0x0 0x140>;
   200					amlogic,has-chip-id;
   201				};
   202	
   203				uart_AO: serial@3000 {
   204					compatible = "amlogic,meson-gx-uart",
   205						     "amlogic,meson-ao-uart";
   206					reg = <0x0 0x3000 0x0 0x18>;
   207					interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
   208					clocks = <&xtal>, <&xtal>, <&xtal>;
   209					clock-names = "xtal", "pclk", "baud";
   210					status = "disabled";
   211				};
   212	
   213				uart_AO_B: serial@4000 {
   214					compatible = "amlogic,meson-gx-uart",
   215						     "amlogic,meson-ao-uart";
   216					reg = <0x0 0x4000 0x0 0x18>;
   217					interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
   218					clocks = <&xtal>, <&xtal>, <&xtal>;
   219					clock-names = "xtal", "pclk", "baud";
   220					status = "disabled";
   221				};
   222			};
   223	
   224			gic: interrupt-controller@ffc01000 {
   225				compatible = "arm,gic-400";
   226				reg = <0x0 0xffc01000 0 0x1000>,
   227				      <0x0 0xffc02000 0 0x2000>,
   228				      <0x0 0xffc04000 0 0x2000>,
   229				      <0x0 0xffc06000 0 0x2000>;
   230				interrupt-controller;
   231				interrupts = <GIC_PPI 9
   232					(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
   233				#interrupt-cells = <3>;
   234				#address-cells = <0>;
   235			};
   236	
   237			cbus: bus@ffd00000 {
   238				compatible = "simple-bus";
   239				reg = <0x0 0xffd00000 0x0 0x100000>;
   240				#address-cells = <2>;
   241				#size-cells = <2>;
   242				ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x100000>;
   243	
   244				clk_msr: clock-measure@18000 {
   245					compatible = "amlogic,meson-g12a-clk-measure";
   246					reg = <0x0 0x18000 0x0 0x10>;
   247				};
   248			};
   249		};
   250	
   251		timer {
   252			compatible = "arm,armv8-timer";
   253			interrupts = <GIC_PPI 13
   254				(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
   255				     <GIC_PPI 14
   256				(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
   257				     <GIC_PPI 11
   258				(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
   259				     <GIC_PPI 10
   260				(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>;
   261		};
   262	
   263		xtal: xtal-clk {
   264			compatible = "fixed-clock";
   265			clock-frequency = <24000000>;
   266			clock-output-names = "xtal";
   267			#clock-cells = <0>;
   268		};
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
