Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC1F10E5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891038; cv=none; b=L2ygcQmuqemIDjS1cUonxAjw+3tTxObiX1F0oQJ4qKE0y/znaBphgTLzflyOtiHL5Ms3WLLXjcXYRN7Ktu6GwcoUjp9Tj2bDPP7yTSwaPHb2S59pH1x4WPb/bUNVbQ4kCeXWlDK5g3fqiV+xFBqhmUr5/F4nmFOgm9k0sNiFZLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891038; c=relaxed/simple;
	bh=HEqzjS3dtX5kTLe4I/atLfX6YutGAY0UQekuZ2/FMAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ETxZ1VjD6zVWJ4LWQpf9Fz+czG+F3Y8s+IazY6aUWUMKhBIl4mHN6ZRNVlZSNjj5027IgibpaET8HVedVCe9glzm2qlRPslk0LHuS1ZL702RKI+OT/5mK97i2xvdnf6ph0iaVS36Oxeeq6r9IRQYmYM0QffSt8IVji7OwIHQWPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cg9YoOFj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cg9YoOFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744891035; x=1776427035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HEqzjS3dtX5kTLe4I/atLfX6YutGAY0UQekuZ2/FMAs=;
  b=Cg9YoOFj1AOBLlnV5xv2r85qFbtt1vG/QFQRJKeQp0ZHMDqfbwiXv3SB
   8CpkijDTravnLiuEKNyOzBLjcEV7GNOdO4o7lJnztCRDx9W3JFG5nV6ON
   MGssNTEFdmlZTf9zd4MZhFFvcNhNASmDEncHtqYRZE+yAAeGnEZjsPrbE
   mmaG3Z40R2TTXZ59A7XKy9kznk35W0wR2ZvqCLkfy12AaWMyTCjLIQHqi
   3ZrvElBVeT1PbhE6nU7REAWOSbT/I1KvXLeBXwOV6gzPydTup+saTg6ky
   SS5xee+f6iRnK0WnxDx1QhwxN3ryvYg9Js3b95482D/2MhYLhaV8A2dcE
   g==;
X-CSE-ConnectionGUID: 7tZo/xfzSbmy859oomAB+Q==
X-CSE-MsgGUID: LZ3v8x+wQ9ihnPkrQ2+SyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45708281"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="45708281"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 04:57:14 -0700
X-CSE-ConnectionGUID: 4noSCLcwTZ6dnO6+SV56tQ==
X-CSE-MsgGUID: mSYJv/SRRwiYqjVxSDqhBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130778088"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Apr 2025 04:57:13 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Nrj-000Mcg-1t;
	Thu, 17 Apr 2025 11:57:11 +0000
Date: Thu, 17 Apr 2025 19:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.15-rc 69/70]
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi:700.39-704.5: Warning
 (simple_bus_reg): /soc/system-controller@11d10000: simple-bus unit address
 format error, expected "11d10084"
Message-ID: <202504171912.jYs4BXKZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/frank-w/BPI-R2-4.14 6.15-rc
head:   60a2ff7b16d67424e22c6e1733687ca59418386e
commit: dd97f441de17835b0f440f032eb7303ea9b70fdd [69/70] arm64: dts: change topmisc back to syscon and change reg to exclude pwr-ctrl
config: arm64-randconfig-004-20250417 (https://download.01.org/0day-ci/archive/20250417/202504171912.jYs4BXKZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171912.jYs4BXKZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171912.jYs4BXKZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:677.24-698.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:706.26-728.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi:33.9-35.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:463.31-467.5: Warning (simple_bus_reg): /soc/phy-firmware@f000000: simple-bus unit address format error, expected "f100000"
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:677.24-698.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:700.39-704.5: Warning (simple_bus_reg): /soc/system-controller@11d10000: simple-bus unit address format error, expected "11d10084"
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:706.26-728.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:789.27-954.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +/11d10084 +700 arch/arm64/boot/dts/mediatek/mt7988a.dtsi

     8	
     9	/ {
    10		compatible = "mediatek,mt7988a";
    11		interrupt-parent = <&gic>;
    12		#address-cells = <2>;
    13		#size-cells = <2>;
    14	
    15		cci: cci {
    16			compatible = "mediatek,mt7988-cci",
    17				     "mediatek,mt8183-cci";
    18			clocks = <&mcusys CLK_MCU_BUS_DIV_SEL>,
    19				 <&topckgen CLK_TOP_XTAL>;
    20			clock-names = "cci", "intermediate";
    21			operating-points-v2 = <&cci_opp>;
    22		};
    23	
    24		cci_opp: opp_table_cci {
    25			compatible = "operating-points-v2";
    26			opp-shared;
    27			opp00 {
    28				opp-hz = /bits/ 64 <480000000>;
    29				opp-microvolt = <850000>;
    30			};
    31			opp01 {
    32				opp-hz = /bits/ 64 <660000000>;
    33				opp-microvolt = <850000>;
    34			};
    35			opp02 {
    36				opp-hz = /bits/ 64 <900000000>;
    37				opp-microvolt = <850000>;
    38			};
    39			opp03 {
    40				opp-hz = /bits/ 64 <1080000000>;
    41				opp-microvolt = <900000>;
    42			};
    43		};
    44	
    45		cpus {
    46			#address-cells = <1>;
    47			#size-cells = <0>;
    48	
    49			cpu0: cpu@0 {
    50				compatible = "arm,cortex-a73";
    51				reg = <0x0>;
    52				device_type = "cpu";
    53				enable-method = "psci";
    54				clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
    55					 <&topckgen CLK_TOP_XTAL>;
    56				clock-names = "cpu", "intermediate";
    57				operating-points-v2 = <&cluster0_opp>;
    58				mediatek,cci = <&cci>;
    59			};
    60	
    61			cpu1: cpu@1 {
    62				compatible = "arm,cortex-a73";
    63				reg = <0x1>;
    64				device_type = "cpu";
    65				enable-method = "psci";
    66				clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
    67					 <&topckgen CLK_TOP_XTAL>;
    68				clock-names = "cpu", "intermediate";
    69				operating-points-v2 = <&cluster0_opp>;
    70				mediatek,cci = <&cci>;
    71			};
    72	
    73			cpu2: cpu@2 {
    74				compatible = "arm,cortex-a73";
    75				reg = <0x2>;
    76				device_type = "cpu";
    77				enable-method = "psci";
    78				clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
    79					 <&topckgen CLK_TOP_XTAL>;
    80				clock-names = "cpu", "intermediate";
    81				operating-points-v2 = <&cluster0_opp>;
    82				mediatek,cci = <&cci>;
    83			};
    84	
    85			cpu3: cpu@3 {
    86				compatible = "arm,cortex-a73";
    87				reg = <0x3>;
    88				device_type = "cpu";
    89				enable-method = "psci";
    90				clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
    91					 <&topckgen CLK_TOP_XTAL>;
    92				clock-names = "cpu", "intermediate";
    93				operating-points-v2 = <&cluster0_opp>;
    94				mediatek,cci = <&cci>;
    95			};
    96	
    97			cluster0_opp: opp-table-0 {
    98				compatible = "operating-points-v2";
    99				opp-shared;
   100	
   101				opp-800000000 {
   102					opp-hz = /bits/ 64 <800000000>;
   103					opp-microvolt = <850000>;
   104				};
   105				opp-1100000000 {
   106					opp-hz = /bits/ 64 <1100000000>;
   107					opp-microvolt = <850000>;
   108				};
   109				opp-1500000000 {
   110					opp-hz = /bits/ 64 <1500000000>;
   111					opp-microvolt = <850000>;
   112				};
   113				opp-1800000000 {
   114					opp-hz = /bits/ 64 <1800000000>;
   115					opp-microvolt = <900000>;
   116				};
   117			};
   118		};
   119	
   120		oscillator-40m {
   121			compatible = "fixed-clock";
   122			clock-frequency = <40000000>;
   123			#clock-cells = <0>;
   124			clock-output-names = "clkxtal";
   125		};
   126	
   127		pmu {
   128			compatible = "arm,cortex-a73-pmu";
   129			interrupt-parent = <&gic>;
   130			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
   131		};
   132	
   133		psci {
   134			compatible = "arm,psci-0.2";
   135			method = "smc";
   136		};
   137	
   138		reserved-memory {
   139			#address-cells = <2>;
   140			#size-cells = <2>;
   141			ranges;
   142	
   143			/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
   144			secmon@43000000 {
   145				reg = <0 0x43000000 0 0x50000>;
   146				no-map;
   147			};
   148		};
   149	
   150		soc {
   151			compatible = "simple-bus";
   152			ranges;
   153			#address-cells = <2>;
   154			#size-cells = <2>;
   155	
   156			gic: interrupt-controller@c000000 {
   157				compatible = "arm,gic-v3";
   158				reg = <0 0x0c000000 0 0x40000>,  /* GICD */
   159				      <0 0x0c080000 0 0x200000>, /* GICR */
   160				      <0 0x0c400000 0 0x2000>,   /* GICC */
   161				      <0 0x0c410000 0 0x1000>,   /* GICH */
   162				      <0 0x0c420000 0 0x2000>;   /* GICV */
   163				interrupt-parent = <&gic>;
   164				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
   165				interrupt-controller;
   166				#interrupt-cells = <3>;
   167			};
   168	
   169			infracfg: clock-controller@10001000 {
   170				compatible = "mediatek,mt7988-infracfg", "syscon";
   171				reg = <0 0x10001000 0 0x1000>;
   172				#clock-cells = <1>;
   173				#reset-cells = <1>;
   174			};
   175	
   176			topckgen: clock-controller@1001b000 {
   177				compatible = "mediatek,mt7988-topckgen", "syscon";
   178				reg = <0 0x1001b000 0 0x1000>;
   179				#clock-cells = <1>;
   180			};
   181	
   182			watchdog: watchdog@1001c000 {
   183				compatible = "mediatek,mt7988-wdt";
   184				reg = <0 0x1001c000 0 0x1000>;
   185				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
   186				#reset-cells = <1>;
   187			};
   188	
   189			apmixedsys: clock-controller@1001e000 {
   190				compatible = "mediatek,mt7988-apmixedsys";
   191				reg = <0 0x1001e000 0 0x1000>;
   192				#clock-cells = <1>;
   193			};
   194	
   195			pio: pinctrl@1001f000 {
   196				compatible = "mediatek,mt7988-pinctrl", "syscon";
   197				reg = <0 0x1001f000 0 0x1000>,
   198				      <0 0x11c10000 0 0x1000>,
   199				      <0 0x11d00000 0 0x1000>,
   200				      <0 0x11d20000 0 0x1000>,
   201				      <0 0x11e00000 0 0x1000>,
   202				      <0 0x11f00000 0 0x1000>,
   203				      <0 0x1000b000 0 0x1000>;
   204				reg-names = "gpio", "iocfg_tr",
   205					    "iocfg_br", "iocfg_rb",
   206					    "iocfg_lb", "iocfg_tl", "eint";
   207				gpio-controller;
   208				#gpio-cells = <2>;
   209				gpio-ranges = <&pio 0 0 84>;
   210				interrupt-controller;
   211				interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
   212				interrupt-parent = <&gic>;
   213				#interrupt-cells = <2>;
   214	
   215				pcie0_pins: pcie0-pins {
   216					mux {
   217						function = "pcie";
   218						groups = "pcie_2l_0_pereset", "pcie_clk_req_n0_0",
   219							 "pcie_wake_n0_0";
   220					};
   221				};
   222	
   223				pcie1_pins: pcie1-pins {
   224					mux {
   225						function = "pcie";
   226						groups = "pcie_2l_1_pereset", "pcie_clk_req_n1",
   227							 "pcie_wake_n1_0";
   228					};
   229				};
   230	
   231				pcie2_pins: pcie2-pins {
   232					mux {
   233						function = "pcie";
   234						groups = "pcie_1l_0_pereset", "pcie_clk_req_n2_0",
   235							 "pcie_wake_n2_0";
   236					};
   237				};
   238	
   239				pcie3_pins: pcie3-pins {
   240					mux {
   241						function = "pcie";
   242						groups = "pcie_1l_1_pereset", "pcie_clk_req_n3",
   243							 "pcie_wake_n3_0";
   244					};
   245				};
   246			};
   247	
   248			pwm: pwm@10048000 {
   249				compatible = "mediatek,mt7988-pwm";
   250				reg = <0 0x10048000 0 0x1000>;
   251				clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
   252					 <&infracfg CLK_INFRA_66M_PWM_HCK>,
   253					 <&infracfg CLK_INFRA_66M_PWM_CK1>,
   254					 <&infracfg CLK_INFRA_66M_PWM_CK2>,
   255					 <&infracfg CLK_INFRA_66M_PWM_CK3>,
   256					 <&infracfg CLK_INFRA_66M_PWM_CK4>,
   257					 <&infracfg CLK_INFRA_66M_PWM_CK5>,
   258					 <&infracfg CLK_INFRA_66M_PWM_CK6>,
   259					 <&infracfg CLK_INFRA_66M_PWM_CK7>,
   260					 <&infracfg CLK_INFRA_66M_PWM_CK8>;
   261				clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
   262					      "pwm4", "pwm5", "pwm6", "pwm7", "pwm8";
   263				#pwm-cells = <2>;
   264				status = "disabled";
   265			};
   266	
   267			sgmiisys0: syscon@10060000 {
   268				compatible = /*"mediatek,mt7988-sgmiisys",*/
   269					     "mediatek,mt7988-sgmiisys0",
   270					     "simple-mfd",
   271					     "syscon";
   272				reg = <0 0x10060000 0 0x1000>;
   273				resets = <&watchdog 1>;
   274				#clock-cells = <1>;
   275	
   276				sgmiipcs0: pcs {
   277					compatible = "mediatek,mt7988-sgmii";
   278					clocks = <&topckgen CLK_TOP_SGM_0_SEL>,
   279						 <&sgmiisys0 CLK_SGM0_TX_EN>,
   280						 <&sgmiisys0 CLK_SGM0_RX_EN>;
   281					clock-names = "sgmii_sel", "sgmii_tx", "sgmii_rx";
   282					phys = <&xfi_tphy0>;
   283					#pcs-cells = <0>;
   284				};
   285			};
   286	
   287			sgmiisys1: syscon@10070000 {
   288				compatible = /*"mediatek,mt7988-sgmiisys",*/
   289					     "mediatek,mt7988-sgmiisys1",
   290					     "simple-mfd",
   291					     "syscon";
   292				reg = <0 0x10070000 0 0x1000>;
   293				resets = <&watchdog 2>;
   294				#clock-cells = <1>;
   295	
   296				sgmiipcs1: pcs {
   297					compatible = "mediatek,mt7988-sgmii";
   298					clocks = <&topckgen CLK_TOP_SGM_1_SEL>,
   299						 <&sgmiisys1 CLK_SGM1_TX_EN>,
   300						 <&sgmiisys1 CLK_SGM1_RX_EN>;
   301					clock-names = "sgmii_sel", "sgmii_tx", "sgmii_rx";
   302					phys = <&xfi_tphy1>;
   303					#pcs-cells = <0>;
   304				};
   305			};
   306	
   307			usxgmiisys0: pcs@10080000 {
   308				compatible = "mediatek,mt7988-usxgmiisys";
   309				reg = <0 0x10080000 0 0x1000>;
   310				resets = <&watchdog 12>;
   311				clocks = <&topckgen CLK_TOP_USXGMII_SBUS_0_SEL>;
   312				phys = <&xfi_tphy0>;
   313				#pcs-cells = <0>;
   314			};
   315	
   316			usxgmiisys1: pcs@10081000 {
   317				compatible = "mediatek,mt7988-usxgmiisys";
   318				reg = <0 0x10081000 0 0x1000>;
   319				resets = <&watchdog 13>;
   320				clocks = <&topckgen CLK_TOP_USXGMII_SBUS_1_SEL>;
   321				phys = <&xfi_tphy1>;
   322				#pcs-cells = <0>;
   323			};
   324	
   325	
   326			mcusys: mcusys@100e0000 {
   327				compatible = "mediatek,mt7988-mcusys", "syscon";
   328				reg = <0 0x100e0000 0 0x1000>;
   329				#clock-cells = <1>;
   330			};
   331	
   332			serial0: serial@11000000 {
   333				compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
   334				reg = <0 0x11000000 0 0x100>;
   335				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
   336				interrupt-names = "uart", "wakeup";
   337				clocks = <&topckgen CLK_TOP_UART_SEL>,
   338					 <&infracfg CLK_INFRA_52M_UART0_CK>;
   339				clock-names = "baud", "bus";
   340				status = "disabled";
   341			};
   342	
   343			serial1: serial@11000100 {
   344				compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
   345				reg = <0 0x11000100 0 0x100>;
   346				interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
   347				interrupt-names = "uart", "wakeup";
   348				clocks = <&topckgen CLK_TOP_UART_SEL>,
   349					 <&infracfg CLK_INFRA_52M_UART1_CK>;
   350				clock-names = "baud", "bus";
   351				status = "disabled";
   352			};
   353	
   354			serial2: serial@11000200 {
   355				compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
   356				reg = <0 0x11000200 0 0x100>;
   357				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
   358				interrupt-names = "uart", "wakeup";
   359				clocks = <&topckgen CLK_TOP_UART_SEL>,
   360					 <&infracfg CLK_INFRA_52M_UART2_CK>;
   361				clock-names = "baud", "bus";
   362				status = "disabled";
   363			};
   364	
   365			i2c0: i2c@11003000 {
   366				compatible = "mediatek,mt7981-i2c";
   367				reg = <0 0x11003000 0 0x1000>,
   368				      <0 0x10217080 0 0x80>;
   369				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
   370				clock-div = <1>;
   371				clocks = <&infracfg CLK_INFRA_I2C_BCK>,
   372					 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
   373				clock-names = "main", "dma";
   374				#address-cells = <1>;
   375				#size-cells = <0>;
   376				status = "disabled";
   377			};
   378	
   379			i2c1: i2c@11004000 {
   380				compatible = "mediatek,mt7981-i2c";
   381				reg = <0 0x11004000 0 0x1000>,
   382				      <0 0x10217100 0 0x80>;
   383				interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
   384				clock-div = <1>;
   385				clocks = <&infracfg CLK_INFRA_I2C_BCK>,
   386					 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
   387				clock-names = "main", "dma";
   388				#address-cells = <1>;
   389				#size-cells = <0>;
   390				status = "disabled";
   391			};
   392	
   393			i2c2: i2c@11005000 {
   394				compatible = "mediatek,mt7981-i2c";
   395				reg = <0 0x11005000 0 0x1000>,
   396				      <0 0x10217180 0 0x80>;
   397				interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
   398				clock-div = <1>;
   399				clocks = <&infracfg CLK_INFRA_I2C_BCK>,
   400					 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
   401				clock-names = "main", "dma";
   402				#address-cells = <1>;
   403				#size-cells = <0>;
   404				status = "disabled";
   405			};
   406	
   407			spi0: spi@11007000 {
   408				compatible = "mediatek,mt7988-spi-quad", "mediatek,spi-ipm";
   409				reg = <0 0x11007000 0 0x100>;
   410				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
   411				clocks = <&topckgen CLK_TOP_MPLL_D2>,
   412					 <&topckgen CLK_TOP_SPI_SEL>,
   413					 <&infracfg CLK_INFRA_104M_SPI0>,
   414					 <&infracfg CLK_INFRA_66M_SPI0_HCK>;
   415				clock-names = "parent-clk", "sel-clk", "spi-clk",
   416					      "hclk";
   417				#address-cells = <1>;
   418				#size-cells = <0>;
   419				status = "disabled";
   420			};
   421	
   422			spi1: spi@11008000 {
   423				compatible = "mediatek,mt7988-spi-single", "mediatek,spi-ipm";
   424				reg = <0 0x11008000 0 0x100>;
   425				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
   426				clocks = <&topckgen CLK_TOP_MPLL_D2>,
   427					 <&topckgen CLK_TOP_SPIM_MST_SEL>,
   428					 <&infracfg CLK_INFRA_104M_SPI1>,
   429					 <&infracfg CLK_INFRA_66M_SPI1_HCK>;
   430				clock-names = "parent-clk", "sel-clk", "spi-clk",
   431					      "hclk";
   432				#address-cells = <1>;
   433				#size-cells = <0>;
   434				status = "disabled";
   435			};
   436	
   437			spi2: spi@11009000 {
   438				compatible = "mediatek,mt7988-spi-quad", "mediatek,spi-ipm";
   439				reg = <0 0x11009000 0 0x100>;
   440				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
   441				clocks = <&topckgen CLK_TOP_MPLL_D2>,
   442					 <&topckgen CLK_TOP_SPI_SEL>,
   443					 <&infracfg CLK_INFRA_104M_SPI2_BCK>,
   444					 <&infracfg CLK_INFRA_66M_SPI2_HCK>;
   445				clock-names = "parent-clk", "sel-clk", "spi-clk",
   446					      "hclk";
   447				#address-cells = <1>;
   448				#size-cells = <0>;
   449				status = "disabled";
   450			};
   451	
   452			lvts: lvts@1100a000 {
   453				compatible = "mediatek,mt7988-lvts-ap";
   454				#thermal-sensor-cells = <1>;
   455				reg = <0 0x1100a000 0 0x1000>;
   456				clocks = <&infracfg CLK_INFRA_26M_THERM_SYSTEM>;
   457				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
   458				resets = <&infracfg MT7988_INFRA_RST1_THERM_CTRL_SWRST>;
   459				nvmem-cells = <&lvts_calibration>;
   460				nvmem-cell-names = "lvts-calib-data-1";
   461			};
   462	
   463			phyfw: phy-firmware@f000000 {
   464				compatible = "mediatek,2p5gphy-fw";
   465				reg = <0 0x0f100000 0 0x20000>,
   466				      <0 0x0f0f0018 0 0x20>;
   467			};
   468	
   469			ssusb0: usb@11190000 {
   470				compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
   471				reg = <0 0x11190000 0 0x2e00>,
   472				      <0 0x11193e00 0 0x0100>;
   473				reg-names = "mac", "ippc";
   474				interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
   475				clocks = <&infracfg CLK_INFRA_USB_SYS>,
   476					 <&infracfg CLK_INFRA_USB_REF>,
   477					 <&infracfg CLK_INFRA_66M_USB_HCK>,
   478					 <&infracfg CLK_INFRA_133M_USB_HCK>,
   479					 <&infracfg CLK_INFRA_USB_XHCI>;
   480				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
   481				phys = <&xphyu2port0 PHY_TYPE_USB2>,
   482				       <&xphyu3port0 PHY_TYPE_USB3>;
   483				status = "disabled";
   484			};
   485	
   486			ssusb1: usb@11200000 {
   487				compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
   488				reg = <0 0x11200000 0 0x2e00>,
   489				      <0 0x11203e00 0 0x0100>;
   490				reg-names = "mac", "ippc";
   491				interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
   492				clocks = <&infracfg CLK_INFRA_USB_SYS_CK_P1>,
   493					 <&infracfg CLK_INFRA_USB_CK_P1>,
   494					 <&infracfg CLK_INFRA_66M_USB_HCK_CK_P1>,
   495					 <&infracfg CLK_INFRA_133M_USB_HCK_CK_P1>,
   496					 <&infracfg CLK_INFRA_USB_XHCI_CK_P1>;
   497				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
   498				phys = <&tphyu2port0 PHY_TYPE_USB2>,
   499				       <&tphyu3port0 PHY_TYPE_USB3>;
   500				status = "disabled";
   501			};
   502	
   503			mmc0: mmc@11230000 {
   504				compatible = "mediatek,mt7988-mmc";
   505				reg = <0 0x11230000 0 0x1000>,
   506				      <0 0x11D60000 0 0x1000>;
   507				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
   508				clocks = <&infracfg CLK_INFRA_MSDC400>,
   509					 <&infracfg CLK_INFRA_MSDC2_HCK>,
   510					 <&infracfg CLK_INFRA_66M_MSDC_0_HCK>,
   511					 <&infracfg CLK_INFRA_133M_MSDC_0_HCK>;
   512				assigned-clocks = <&topckgen CLK_TOP_EMMC_250M_SEL>,
   513						  <&topckgen CLK_TOP_EMMC_400M_SEL>;
   514				assigned-clock-parents = <&topckgen CLK_TOP_NET1PLL_D5_D2>,
   515							 <&apmixedsys CLK_APMIXED_MSDCPLL>;
   516				clock-names = "source", "hclk", "axi_cg", "ahb_cg";
   517				#address-cells = <1>;
   518				#size-cells = <0>;
   519				status = "disabled";
   520			};
   521	
   522			pcie2: pcie@11280000 {
   523				compatible = "mediatek,mt7986-pcie",
   524					     "mediatek,mt8192-pcie";
   525				device_type = "pci";
   526				#address-cells = <3>;
   527				#size-cells = <2>;
   528				reg = <0 0x11280000 0 0x2000>;
   529				reg-names = "pcie-mac";
   530				linux,pci-domain = <3>;
   531				interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
   532				bus-range = <0x00 0xff>;
   533				ranges = <0x81000000 0x00 0x20000000 0x00
   534					  0x20000000 0x00 0x00200000>,
   535					 <0x82000000 0x00 0x20200000 0x00
   536					  0x20200000 0x00 0x07e00000>;
   537				clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P2>,
   538					 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P2>,
   539					 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P2>,
   540					 <&infracfg CLK_INFRA_133M_PCIE_CK_P2>;
   541				clock-names = "pl_250m", "tl_26m", "peri_26m",
   542					      "top_133m";
   543				pinctrl-names = "default";
   544				pinctrl-0 = <&pcie2_pins>;
   545				status = "disabled";
   546	
   547				phys = <&xphyu3port0 PHY_TYPE_PCIE>;
   548				phy-names = "pcie-phy";
   549	
   550				#interrupt-cells = <1>;
   551				interrupt-map-mask = <0 0 0 0x7>;
   552				interrupt-map = <0 0 0 1 &pcie_intc2 0>,
   553						<0 0 0 2 &pcie_intc2 1>,
   554						<0 0 0 3 &pcie_intc2 2>,
   555						<0 0 0 4 &pcie_intc2 3>;
   556				pcie_intc2: interrupt-controller {
   557					#address-cells = <0>;
   558					#interrupt-cells = <1>;
   559					interrupt-controller;
   560				};
   561			};
   562	
   563			pcie3: pcie@11290000 {
   564				compatible = "mediatek,mt7986-pcie",
   565					     "mediatek,mt8192-pcie";
   566				device_type = "pci";
   567				#address-cells = <3>;
   568				#size-cells = <2>;
   569				reg = <0 0x11290000 0 0x2000>;
   570				reg-names = "pcie-mac";
   571				linux,pci-domain = <2>;
   572				interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
   573				bus-range = <0x00 0xff>;
   574				ranges = <0x81000000 0x00 0x28000000 0x00
   575					  0x28000000 0x00 0x00200000>,
   576					 <0x82000000 0x00 0x28200000 0x00
   577					  0x28200000 0x00 0x07e00000>;
   578				clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P3>,
   579					 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P3>,
   580					 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P3>,
   581					 <&infracfg CLK_INFRA_133M_PCIE_CK_P3>;
   582				clock-names = "pl_250m", "tl_26m", "peri_26m",
   583					      "top_133m";
   584				pinctrl-names = "default";
   585				pinctrl-0 = <&pcie3_pins>;
   586				status = "disabled";
   587	
   588				#interrupt-cells = <1>;
   589				interrupt-map-mask = <0 0 0 0x7>;
   590				interrupt-map = <0 0 0 1 &pcie_intc3 0>,
   591						<0 0 0 2 &pcie_intc3 1>,
   592						<0 0 0 3 &pcie_intc3 2>,
   593						<0 0 0 4 &pcie_intc3 3>;
   594				pcie_intc3: interrupt-controller {
   595					#address-cells = <0>;
   596					#interrupt-cells = <1>;
   597					interrupt-controller;
   598				};
   599			};
   600	
   601			pcie0: pcie@11300000 {
   602				compatible = "mediatek,mt7986-pcie",
   603					     "mediatek,mt8192-pcie";
   604				device_type = "pci";
   605				#address-cells = <3>;
   606				#size-cells = <2>;
   607				reg = <0 0x11300000 0 0x2000>;
   608				reg-names = "pcie-mac";
   609				linux,pci-domain = <0>;
   610				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
   611				bus-range = <0x00 0xff>;
   612				ranges = <0x81000000 0x00 0x30000000 0x00
   613					  0x30000000 0x00 0x00200000>,
   614					 <0x82000000 0x00 0x30200000 0x00
   615					  0x30200000 0x00 0x07e00000>;
   616				clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P0>,
   617					 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P0>,
   618					 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P0>,
   619					 <&infracfg CLK_INFRA_133M_PCIE_CK_P0>;
   620				clock-names = "pl_250m", "tl_26m", "peri_26m",
   621					      "top_133m";
   622				pinctrl-names = "default";
   623				pinctrl-0 = <&pcie0_pins>;
   624				status = "disabled";
   625	
   626				#interrupt-cells = <1>;
   627				interrupt-map-mask = <0 0 0 0x7>;
   628				interrupt-map = <0 0 0 1 &pcie_intc0 0>,
   629						<0 0 0 2 &pcie_intc0 1>,
   630						<0 0 0 3 &pcie_intc0 2>,
   631						<0 0 0 4 &pcie_intc0 3>;
   632				pcie_intc0: interrupt-controller {
   633					#address-cells = <0>;
   634					#interrupt-cells = <1>;
   635					interrupt-controller;
   636				};
   637			};
   638	
   639			pcie1: pcie@11310000 {
   640				compatible = "mediatek,mt7986-pcie",
   641					     "mediatek,mt8192-pcie";
   642				device_type = "pci";
   643				#address-cells = <3>;
   644				#size-cells = <2>;
   645				reg = <0 0x11310000 0 0x2000>;
   646				reg-names = "pcie-mac";
   647				linux,pci-domain = <1>;
   648				interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
   649				bus-range = <0x00 0xff>;
   650				ranges = <0x81000000 0x00 0x38000000 0x00
   651					  0x38000000 0x00 0x00200000>,
   652					 <0x82000000 0x00 0x38200000 0x00
   653					  0x38200000 0x00 0x07e00000>;
   654				clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P1>,
   655					 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P1>,
   656					 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P1>,
   657					 <&infracfg CLK_INFRA_133M_PCIE_CK_P1>;
   658				clock-names = "pl_250m", "tl_26m", "peri_26m",
   659					      "top_133m";
   660				pinctrl-names = "default";
   661				pinctrl-0 = <&pcie1_pins>;
   662				status = "disabled";
   663	
   664				#interrupt-cells = <1>;
   665				interrupt-map-mask = <0 0 0 0x7>;
   666				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
   667						<0 0 0 2 &pcie_intc1 1>,
   668						<0 0 0 3 &pcie_intc1 2>,
   669						<0 0 0 4 &pcie_intc1 3>;
   670				pcie_intc1: interrupt-controller {
   671					#address-cells = <0>;
   672					#interrupt-cells = <1>;
   673					interrupt-controller;
   674				};
   675			};
   676	
 > 677			tphy: t-phy@11c50000 {
   678				compatible = "mediatek,mt7986-tphy",
   679					     "mediatek,generic-tphy-v2";
   680				#address-cells = <2>;
   681				#size-cells = <2>;
   682				ranges;
   683				status = "disabled";
   684	
   685				tphyu2port0: usb-phy@11c50000 {
   686					reg = <0 0x11c50000 0 0x700>;
   687					clocks = <&infracfg CLK_INFRA_USB_UTMI_CK_P1>;
   688					clock-names = "ref";
   689					#phy-cells = <1>;
   690				};
   691	
   692				tphyu3port0: usb-phy@11c50700 {
   693					reg = <0 0x11c50700 0 0x900>;
   694					clocks = <&infracfg CLK_INFRA_USB_PIPE_CK_P1>;
   695					clock-names = "ref";
   696					#phy-cells = <1>;
   697				};
   698			};
   699	
 > 700			topmisc: system-controller@11d10000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
