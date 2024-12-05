Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307A4C83
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 04:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733372735; cv=none; b=T7eG7Gns9oE0CvkVlejOB/FivbJysdkyq655lmN80/3jYE4DfIDtqvyUgeWQrUJBCqFvm5WGiAf/c/zMq+SN+6O6s5HqCLoDPmPGXwjBIlUVY71fMw1y46JIVth9X4jEet4WKTRO0Jz00kjU233gTtaTC9HT0z0xnfI5sHqdyag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733372735; c=relaxed/simple;
	bh=XQMEGhvw9/uUyFjzDLwIe7ewd1/6d/15cJD0b0ZNyP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oknymjpVPxpKn0uu0sJ08mikTORELDgrAdFwcmQN0yA6QXTnRhSMuHwpVQ5HbRJWRPjeFag6WyFbExIHWCXnGLb+vNJNX5orGZ+oU4aUtEU1ILS0nr9L4QnDV1MhERhDbsNRR1WAtVNIbyg9S3a+NFJjIlYEURYL65PoF3uK340=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDk/EYwg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDk/EYwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733372733; x=1764908733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XQMEGhvw9/uUyFjzDLwIe7ewd1/6d/15cJD0b0ZNyP0=;
  b=IDk/EYwg7XNJz9s/1qSlMBgmBEGU70y3sxPXwrm+I0n3BB2UtogHycac
   0oQDIbeujXbyOU9zxA69oX7rzfvOkeEpM9KdF+4i5mI8Tnuf6ALk+C3x2
   WXUXjGah8aES/Qzs8MCIAGxBNJUD2tJbo0hmAdiRmbEG8TqTjG+Z8+IiM
   +XOO86cFn67xTIajW+G5iqm1zKpj9h4ysVOh/+Gcfx73yG4OcZfNyqreh
   GAuU6nZ2KrQ3Zfd18D8MOx0mKFKovgKfNDI4uBtQAmHwDYKum/yPiGWWx
   +BFdy8PPutkLNABWpqvRR9QWKAqPKJBqjkL5fWpi6w2Muy/GymAW/bCrZ
   g==;
X-CSE-ConnectionGUID: qzf0fZXqTSCWUPC81s/oQg==
X-CSE-MsgGUID: KyR1wjsiRGSCb9DNCMll3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44697805"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="44697805"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 20:25:31 -0800
X-CSE-ConnectionGUID: /WMrwpdiQb63nSsSiYd/2g==
X-CSE-MsgGUID: yK4kM2VBSvib6oKu7AUw7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94442080"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Dec 2024 20:25:28 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ3QV-0003ml-0X;
	Thu, 05 Dec 2024 04:25:20 +0000
Date: Thu, 5 Dec 2024 12:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-mt7988upstream 32/46]
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi:411.19-433.5: Warning
 (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no
 reg or ranges property
Message-ID: <202412051235.eAGd34wY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-mt7988upstream
head:   c7a96ad8bf35721051a35d961f75fa68227c2fbe
commit: e47767d284d4f6ea06bad5d70fe81a7f0fe2f297 [32/46] WIP: arm64: dts: mediatek: mt7988: Add xsphy for ssusb0
config: arm64-randconfig-001 (https://download.01.org/0day-ci/archive/20241205/202412051235.eAGd34wY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051235.eAGd34wY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051235.eAGd34wY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:378.18-399.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:411.19-433.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:378.18-399.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:411.19-433.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property

vim +411 arch/arm64/boot/dts/mediatek/mt7988a.dtsi

     8	
     9	/ {
    10		compatible = "mediatek,mt7988a";
    11		interrupt-parent = <&gic>;
    12		#address-cells = <2>;
    13		#size-cells = <2>;
    14	
    15		cpus {
    16			#address-cells = <1>;
    17			#size-cells = <0>;
    18	
    19			cpu0: cpu@0 {
    20				compatible = "arm,cortex-a73";
    21				reg = <0x0>;
    22				device_type = "cpu";
    23				enable-method = "psci";
    24				clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
    25					 <&topckgen CLK_TOP_XTAL>;
    26				clock-names = "cpu", "intermediate";
    27				operating-points-v2 = <&cluster0_opp>;
    28			};
    29	
    30			cpu1: cpu@1 {
    31				compatible = "arm,cortex-a73";
    32				reg = <0x1>;
    33				device_type = "cpu";
    34				enable-method = "psci";
    35				clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
    36					 <&topckgen CLK_TOP_XTAL>;
    37				clock-names = "cpu", "intermediate";
    38				operating-points-v2 = <&cluster0_opp>;
    39			};
    40	
    41			cpu2: cpu@2 {
    42				compatible = "arm,cortex-a73";
    43				reg = <0x2>;
    44				device_type = "cpu";
    45				enable-method = "psci";
    46				clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
    47					 <&topckgen CLK_TOP_XTAL>;
    48				clock-names = "cpu", "intermediate";
    49				operating-points-v2 = <&cluster0_opp>;
    50			};
    51	
    52			cpu3: cpu@3 {
    53				compatible = "arm,cortex-a73";
    54				reg = <0x3>;
    55				device_type = "cpu";
    56				enable-method = "psci";
    57				clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
    58					 <&topckgen CLK_TOP_XTAL>;
    59				clock-names = "cpu", "intermediate";
    60				operating-points-v2 = <&cluster0_opp>;
    61			};
    62	
    63			cluster0_opp: opp-table-0 {
    64				compatible = "operating-points-v2";
    65				opp-shared;
    66	
    67				opp-800000000 {
    68					opp-hz = /bits/ 64 <800000000>;
    69					opp-microvolt = <850000>;
    70				};
    71				opp-1100000000 {
    72					opp-hz = /bits/ 64 <1100000000>;
    73					opp-microvolt = <850000>;
    74				};
    75				opp-1500000000 {
    76					opp-hz = /bits/ 64 <1500000000>;
    77					opp-microvolt = <850000>;
    78				};
    79				opp-1800000000 {
    80					opp-hz = /bits/ 64 <1800000000>;
    81					opp-microvolt = <900000>;
    82				};
    83			};
    84		};
    85	
    86		oscillator-40m {
    87			compatible = "fixed-clock";
    88			clock-frequency = <40000000>;
    89			#clock-cells = <0>;
    90			clock-output-names = "clkxtal";
    91		};
    92	
    93		pmu {
    94			compatible = "arm,cortex-a73-pmu";
    95			interrupt-parent = <&gic>;
    96			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
    97		};
    98	
    99		psci {
   100			compatible = "arm,psci-0.2";
   101			method = "smc";
   102		};
   103	
   104		reserved-memory {
   105			#address-cells = <2>;
   106			#size-cells = <2>;
   107			ranges;
   108	
   109			/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
   110			secmon@43000000 {
   111				reg = <0 0x43000000 0 0x50000>;
   112				no-map;
   113			};
   114		};
   115	
   116		soc {
   117			compatible = "simple-bus";
   118			ranges;
   119			#address-cells = <2>;
   120			#size-cells = <2>;
   121	
   122			gic: interrupt-controller@c000000 {
   123				compatible = "arm,gic-v3";
   124				reg = <0 0x0c000000 0 0x40000>,  /* GICD */
   125				      <0 0x0c080000 0 0x200000>, /* GICR */
   126				      <0 0x0c400000 0 0x2000>,   /* GICC */
   127				      <0 0x0c410000 0 0x1000>,   /* GICH */
   128				      <0 0x0c420000 0 0x2000>;   /* GICV */
   129				interrupt-parent = <&gic>;
   130				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
   131				interrupt-controller;
   132				#interrupt-cells = <3>;
   133			};
   134	
   135			infracfg: clock-controller@10001000 {
   136				compatible = "mediatek,mt7988-infracfg", "syscon";
   137				reg = <0 0x10001000 0 0x1000>;
   138				#clock-cells = <1>;
   139				#reset-cells = <1>;
   140			};
   141	
   142			topckgen: clock-controller@1001b000 {
   143				compatible = "mediatek,mt7988-topckgen", "syscon";
   144				reg = <0 0x1001b000 0 0x1000>;
   145				#clock-cells = <1>;
   146			};
   147	
   148			watchdog: watchdog@1001c000 {
   149				compatible = "mediatek,mt7988-wdt";
   150				reg = <0 0x1001c000 0 0x1000>;
   151				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
   152				#reset-cells = <1>;
   153			};
   154	
   155			apmixedsys: clock-controller@1001e000 {
   156				compatible = "mediatek,mt7988-apmixedsys";
   157				reg = <0 0x1001e000 0 0x1000>;
   158				#clock-cells = <1>;
   159			};
   160	
   161			pio: pinctrl@1001f000 {
   162				compatible = "mediatek,mt7988-pinctrl";
   163				reg = <0 0x1001f000 0 0x1000>,
   164				      <0 0x11c10000 0 0x1000>,
   165				      <0 0x11d00000 0 0x1000>,
   166				      <0 0x11d20000 0 0x1000>,
   167				      <0 0x11e00000 0 0x1000>,
   168				      <0 0x11f00000 0 0x1000>,
   169				      <0 0x1000b000 0 0x1000>;
   170				reg-names = "gpio", "iocfg_tr",
   171					    "iocfg_br", "iocfg_rb",
   172					    "iocfg_lb", "iocfg_tl", "eint";
   173				gpio-controller;
   174				#gpio-cells = <2>;
   175				gpio-ranges = <&pio 0 0 84>;
   176				interrupt-controller;
   177				interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
   178				interrupt-parent = <&gic>;
   179				#interrupt-cells = <2>;
   180	
   181				pcie0_pins: pcie0-pins {
   182					mux {
   183						function = "pcie";
   184						groups = "pcie_2l_0_pereset", "pcie_clk_req_n0_0",
   185							 "pcie_wake_n0_0";
   186					};
   187				};
   188	
   189				pcie1_pins: pcie1-pins {
   190					mux {
   191						function = "pcie";
   192						groups = "pcie_2l_1_pereset", "pcie_clk_req_n1",
   193							 "pcie_wake_n1_0";
   194					};
   195				};
   196	
   197				pcie2_pins: pcie2-pins {
   198					mux {
   199						function = "pcie";
   200						groups = "pcie_1l_0_pereset", "pcie_clk_req_n2_0",
   201							 "pcie_wake_n2_0";
   202					};
   203				};
   204	
   205				pcie3_pins: pcie3-pins {
   206					mux {
   207						function = "pcie";
   208						groups = "pcie_1l_1_pereset", "pcie_clk_req_n3",
   209							 "pcie_wake_n3_0";
   210					};
   211				};
   212			};
   213	
   214			pwm: pwm@10048000 {
   215				compatible = "mediatek,mt7988-pwm";
   216				reg = <0 0x10048000 0 0x1000>;
   217				clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
   218					 <&infracfg CLK_INFRA_66M_PWM_HCK>,
   219					 <&infracfg CLK_INFRA_66M_PWM_CK1>,
   220					 <&infracfg CLK_INFRA_66M_PWM_CK2>,
   221					 <&infracfg CLK_INFRA_66M_PWM_CK3>,
   222					 <&infracfg CLK_INFRA_66M_PWM_CK4>,
   223					 <&infracfg CLK_INFRA_66M_PWM_CK5>,
   224					 <&infracfg CLK_INFRA_66M_PWM_CK6>,
   225					 <&infracfg CLK_INFRA_66M_PWM_CK7>,
   226					 <&infracfg CLK_INFRA_66M_PWM_CK8>;
   227				clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
   228					      "pwm4", "pwm5", "pwm6", "pwm7", "pwm8";
   229				#pwm-cells = <2>;
   230				status = "disabled";
   231			};
   232	
   233			mcusys: mcusys@100e0000 {
   234				compatible = "mediatek,mt7988-mcusys", "syscon";
   235				reg = <0 0x100e0000 0 0x1000>;
   236				#clock-cells = <1>;
   237			};
   238	
   239			serial0: serial@11000000 {
   240				compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
   241				reg = <0 0x11000000 0 0x100>;
   242				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
   243				interrupt-names = "uart", "wakeup";
   244				clocks = <&topckgen CLK_TOP_UART_SEL>,
   245					 <&infracfg CLK_INFRA_52M_UART0_CK>;
   246				clock-names = "baud", "bus";
   247				status = "disabled";
   248			};
   249	
   250			serial@11000100 {
   251				compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
   252				reg = <0 0x11000100 0 0x100>;
   253				interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
   254				interrupt-names = "uart", "wakeup";
   255				clocks = <&topckgen CLK_TOP_UART_SEL>,
   256					 <&infracfg CLK_INFRA_52M_UART1_CK>;
   257				clock-names = "baud", "bus";
   258				status = "disabled";
   259			};
   260	
   261			serial@11000200 {
   262				compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
   263				reg = <0 0x11000200 0 0x100>;
   264				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
   265				interrupt-names = "uart", "wakeup";
   266				clocks = <&topckgen CLK_TOP_UART_SEL>,
   267					 <&infracfg CLK_INFRA_52M_UART2_CK>;
   268				clock-names = "baud", "bus";
   269				status = "disabled";
   270			};
   271	
   272			i2c0: i2c@11003000 {
   273				compatible = "mediatek,mt7981-i2c";
   274				reg = <0 0x11003000 0 0x1000>,
   275				      <0 0x10217080 0 0x80>;
   276				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
   277				clock-div = <1>;
   278				clocks = <&infracfg CLK_INFRA_I2C_BCK>,
   279					 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
   280				clock-names = "main", "dma";
   281				#address-cells = <1>;
   282				#size-cells = <0>;
   283				status = "disabled";
   284			};
   285	
   286			i2c1: i2c@11004000 {
   287				compatible = "mediatek,mt7981-i2c";
   288				reg = <0 0x11004000 0 0x1000>,
   289				      <0 0x10217100 0 0x80>;
   290				interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
   291				clock-div = <1>;
   292				clocks = <&infracfg CLK_INFRA_I2C_BCK>,
   293					 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
   294				clock-names = "main", "dma";
   295				#address-cells = <1>;
   296				#size-cells = <0>;
   297				status = "disabled";
   298			};
   299	
   300			i2c2: i2c@11005000 {
   301				compatible = "mediatek,mt7981-i2c";
   302				reg = <0 0x11005000 0 0x1000>,
   303				      <0 0x10217180 0 0x80>;
   304				interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
   305				clock-div = <1>;
   306				clocks = <&infracfg CLK_INFRA_I2C_BCK>,
   307					 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
   308				clock-names = "main", "dma";
   309				#address-cells = <1>;
   310				#size-cells = <0>;
   311				status = "disabled";
   312			};
   313	
   314			lvts: lvts@1100a000 {
   315				compatible = "mediatek,mt7988-lvts-ap";
   316				#thermal-sensor-cells = <1>;
   317				reg = <0 0x1100a000 0 0x1000>;
   318				clocks = <&infracfg CLK_INFRA_26M_THERM_SYSTEM>;
   319				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
   320				resets = <&infracfg MT7988_INFRA_RST1_THERM_CTRL_SWRST>;
   321				nvmem-cells = <&lvts_calibration>;
   322				nvmem-cell-names = "lvts-calib-data-1";
   323			};
   324	
   325			usb@11190000 {
   326				compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
   327				reg = <0 0x11190000 0 0x2e00>,
   328				      <0 0x11193e00 0 0x0100>;
   329				reg-names = "mac", "ippc";
   330				interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
   331				clocks = <&infracfg CLK_INFRA_USB_SYS>,
   332					 <&infracfg CLK_INFRA_USB_REF>,
   333					 <&infracfg CLK_INFRA_66M_USB_HCK>,
   334					 <&infracfg CLK_INFRA_133M_USB_HCK>,
   335					 <&infracfg CLK_INFRA_USB_XHCI>;
   336				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
   337				phys = <&xphyu2port0 PHY_TYPE_USB2>,
   338				       <&xphyu3port0 PHY_TYPE_USB3>;
   339				status = "disabled";
   340			};
   341	
   342			ssusb1: usb@11200000 {
   343				compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
   344				reg = <0 0x11200000 0 0x2e00>,
   345				      <0 0x11203e00 0 0x0100>;
   346				reg-names = "mac", "ippc";
   347				interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
   348				clocks = <&infracfg CLK_INFRA_USB_SYS_CK_P1>,
   349					 <&infracfg CLK_INFRA_USB_CK_P1>,
   350					 <&infracfg CLK_INFRA_66M_USB_HCK_CK_P1>,
   351					 <&infracfg CLK_INFRA_133M_USB_HCK_CK_P1>,
   352					 <&infracfg CLK_INFRA_USB_XHCI_CK_P1>;
   353				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
   354				phys = <&tphyu2port0 PHY_TYPE_USB2>,
   355				       <&tphyu3port0 PHY_TYPE_USB3>;
   356				status = "disabled";
   357			};
   358	
   359			mmc0: mmc@11230000 {
   360				compatible = "mediatek,mt7988-mmc";
   361				reg = <0 0x11230000 0 0x1000>,
   362				      <0 0x11D60000 0 0x1000>;
   363				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
   364				clocks = <&infracfg CLK_INFRA_MSDC400>,
   365					 <&infracfg CLK_INFRA_MSDC2_HCK>,
   366					 <&infracfg CLK_INFRA_66M_MSDC_0_HCK>,
   367					 <&infracfg CLK_INFRA_133M_MSDC_0_HCK>;
   368				assigned-clocks = <&topckgen CLK_TOP_EMMC_250M_SEL>,
   369						  <&topckgen CLK_TOP_EMMC_400M_SEL>;
   370				assigned-clock-parents = <&topckgen CLK_TOP_NET1PLL_D5_D2>,
   371							 <&apmixedsys CLK_APMIXED_MSDCPLL>;
   372				clock-names = "source", "hclk", "axi_cg", "ahb_cg";
   373				#address-cells = <1>;
   374				#size-cells = <0>;
   375				status = "disabled";
   376			};
   377	
   378			t-phy@11c50000 {
   379				compatible = "mediatek,mt7986-tphy",
   380					     "mediatek,generic-tphy-v2";
   381				#address-cells = <2>;
   382				#size-cells = <2>;
   383				ranges;
   384				status = "disabled";
   385	
   386				tphyu2port0: usb-phy@11c50000 {
   387					reg = <0 0x11c50000 0 0x700>;
   388					clocks = <&infracfg CLK_INFRA_USB_UTMI_CK_P1>;
   389					clock-names = "ref";
   390					#phy-cells = <1>;
   391				};
   392	
   393				tphyu3port0: usb-phy@11c50700 {
   394					reg = <0 0x11c50700 0 0x900>;
   395					clocks = <&infracfg CLK_INFRA_USB_PIPE_CK_P1>;
   396					clock-names = "ref";
   397					#phy-cells = <1>;
   398				};
   399			};
   400	
   401			/*topmisc: topmisc@11d10000 {
   402				compatible = "mediatek,mt7988-topmisc", "syscon",
   403					     "mediatek,mt7988-power-controller";
   404				reg = <0 0x11d10000 0 0x10000>;
   405				#clock-cells = <1>;
   406				#power-domain-cells = <1>;
   407				#address-cells = <1>;
   408				#size-cells = <0>;
   409			};*/
   410	
 > 411			xs-phy@11e10000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
