Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC0738FA0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718120508; cv=none; b=df7hH4fddwuzk9f85v4g1B5CvBAD4UmDa12WGWn+tC8TMdux0IUA5xygXG/pmEQ5aN3NKuIOscIYb9wP6WR1bylqSGe6w2T7mn++ad48QrAZmRPvpeLVM62VW9nkPQNlgj1sXatpOBV/o8aCkw4DcE2KLCfai+lPnV6yXR6lfmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718120508; c=relaxed/simple;
	bh=NUCrbsOlL+Q+0tPgpTjtzVxC8UiX+hL2PuUCXy1L0/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GYS/YLGgRY+fqrdilgbd5Jwb8glaAfh5xenuItXKz4/vB1Z7JhiPPrHKFM8xNMsZ/cX4NoEQsEtzPZ1R7RhpnprJ1MTro7UAuEIHodI9PSapW2awK2GVLTOLEEoQ475tqfUokGN9IpZELUyNHWOf2KxXn3A176YP9IkxWvWNzT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQ6Fa4MV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQ6Fa4MV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718120506; x=1749656506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUCrbsOlL+Q+0tPgpTjtzVxC8UiX+hL2PuUCXy1L0/o=;
  b=aQ6Fa4MVlCsywXxqmZa1mEj2IPmxPCnWXnTbfmpDz/eSE0XrR4q+FYer
   zO4Ac5+uvDGoB8QDUYhpBmhh6t2vpvE7cvn/gb56Ni+LquQkyRJRNhVv/
   W6jnS3WdJ94JIfeczUjwuerXSayyVtonH4npJkzeVzL2WNc7xFbXIx88x
   43DEiYI30cARYZ3Rm9SMIDLk7cSfN0M8t+bBIHjArjVbk9ILioYeHO+9F
   8PT/bbPmmyeeV7bjvsP1V4fk7jkJSM589Kn2kpmjKoCe3T3TLvrbGA9xC
   Xbs0GXeAYTjG2/mT6+recw8xz9fXlQxbLkS4X9c1hWPXjvjnK8M6sbgP4
   w==;
X-CSE-ConnectionGUID: 47KeEiGFRbyhzDKvhVjmqA==
X-CSE-MsgGUID: TWVfUN7ZSs2gbQnIhFnoAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37360070"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="37360070"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 08:41:45 -0700
X-CSE-ConnectionGUID: DuBJUpfxSMKDqlmQLjXbGw==
X-CSE-MsgGUID: AhfdVuPDSjWEjBVUL3cvNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="70658320"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jun 2024 08:41:44 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH3d0-0000bk-1Z;
	Tue, 11 Jun 2024 15:41:42 +0000
Date: Tue, 11 Jun 2024 23:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.1-main 51/216]
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi:358.28-372.5: Warning
 (unit_address_vs_reg): /soc/t-phy@11c00000: node has a unit name, but no reg
 or ranges property
Message-ID: <202406112313.ksf6QeZz-lkp@intel.com>
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
commit: b0d88200f69b38c9159d9770318a732b86d4f950 [51/216] arm64: dts: mt7986: add pcie related device nodes
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240611/202406112313.ksf6QeZz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406112313.ksf6QeZz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406112313.ksf6QeZz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:18.23-23.4: Warning (unit_address_vs_reg): /oscillator@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7986a.dtsi:358.28-372.5: Warning (unit_address_vs_reg): /soc/t-phy@11c00000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7986a.dtsi:358.28-372.5: Warning (simple_bus_reg): /soc/t-phy@11c00000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:18.23-23.4: Warning (unit_address_vs_reg): /oscillator@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7986a.dtsi:358.28-372.5: Warning (unit_address_vs_reg): /soc/t-phy@11c00000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7986a.dtsi:358.28-372.5: Warning (simple_bus_reg): /soc/t-phy@11c00000: missing or empty reg/ranges property

vim +358 arch/arm64/boot/dts/mediatek/mt7986a.dtsi

    12	
    13	/ {
    14		interrupt-parent = <&gic>;
    15		#address-cells = <2>;
    16		#size-cells = <2>;
    17	
    18		clk40m: oscillator@0 {
    19			compatible = "fixed-clock";
    20			clock-frequency = <40000000>;
    21			#clock-cells = <0>;
    22			clock-output-names = "clkxtal";
    23		};
    24	
    25		cpus {
    26			#address-cells = <1>;
    27			#size-cells = <0>;
    28			cpu0: cpu@0 {
    29				device_type = "cpu";
    30				compatible = "arm,cortex-a53";
    31				enable-method = "psci";
    32				reg = <0x0>;
    33				#cooling-cells = <2>;
    34			};
    35	
    36			cpu1: cpu@1 {
    37				device_type = "cpu";
    38				compatible = "arm,cortex-a53";
    39				enable-method = "psci";
    40				reg = <0x1>;
    41				#cooling-cells = <2>;
    42			};
    43	
    44			cpu2: cpu@2 {
    45				device_type = "cpu";
    46				compatible = "arm,cortex-a53";
    47				enable-method = "psci";
    48				reg = <0x2>;
    49				#cooling-cells = <2>;
    50			};
    51	
    52			cpu3: cpu@3 {
    53				device_type = "cpu";
    54				enable-method = "psci";
    55				compatible = "arm,cortex-a53";
    56				reg = <0x3>;
    57				#cooling-cells = <2>;
    58			};
    59		};
    60	
    61		psci {
    62			compatible = "arm,psci-0.2";
    63			method = "smc";
    64		};
    65	
    66		reserved-memory {
    67			#address-cells = <2>;
    68			#size-cells = <2>;
    69			ranges;
    70			/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
    71			secmon_reserved: secmon@43000000 {
    72				reg = <0 0x43000000 0 0x30000>;
    73				no-map;
    74			};
    75	
    76			wmcpu_emi: wmcpu-reserved@4fc00000 {
    77				no-map;
    78				reg = <0 0x4fc00000 0 0x00100000>;
    79			};
    80		};
    81	
    82		timer {
    83			compatible = "arm,armv8-timer";
    84			interrupt-parent = <&gic>;
    85			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
    86				     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
    87				     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
    88				     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
    89		};
    90	
    91		soc {
    92			#address-cells = <2>;
    93			#size-cells = <2>;
    94			compatible = "simple-bus";
    95			ranges;
    96	
    97			gic: interrupt-controller@c000000 {
    98				compatible = "arm,gic-v3";
    99				#interrupt-cells = <3>;
   100				interrupt-parent = <&gic>;
   101				interrupt-controller;
   102				reg = <0 0x0c000000 0 0x10000>,  /* GICD */
   103				      <0 0x0c080000 0 0x80000>,  /* GICR */
   104				      <0 0x0c400000 0 0x2000>,   /* GICC */
   105				      <0 0x0c410000 0 0x1000>,   /* GICH */
   106				      <0 0x0c420000 0 0x2000>;   /* GICV */
   107				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
   108			};
   109	
   110			infracfg: infracfg@10001000 {
   111				compatible = "mediatek,mt7986-infracfg", "syscon";
   112				reg = <0 0x10001000 0 0x1000>;
   113				#clock-cells = <1>;
   114			};
   115	
   116			wed_pcie: wed-pcie@10003000 {
   117				compatible = "mediatek,mt7986-wed-pcie",
   118					     "syscon";
   119				reg = <0 0x10003000 0 0x10>;
   120			};
   121	
   122			topckgen: topckgen@1001b000 {
   123				compatible = "mediatek,mt7986-topckgen", "syscon";
   124				reg = <0 0x1001B000 0 0x1000>;
   125				#clock-cells = <1>;
   126			};
   127	
   128			watchdog: watchdog@1001c000 {
   129				compatible = "mediatek,mt7986-wdt",
   130					     "mediatek,mt6589-wdt";
   131				reg = <0 0x1001c000 0 0x1000>;
   132				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
   133				#reset-cells = <1>;
   134				status = "disabled";
   135			};
   136	
   137			apmixedsys: apmixedsys@1001e000 {
   138				compatible = "mediatek,mt7986-apmixedsys";
   139				reg = <0 0x1001E000 0 0x1000>;
   140				#clock-cells = <1>;
   141			};
   142	
   143			pio: pinctrl@1001f000 {
   144				compatible = "mediatek,mt7986a-pinctrl";
   145				reg = <0 0x1001f000 0 0x1000>,
   146				      <0 0x11c30000 0 0x1000>,
   147				      <0 0x11c40000 0 0x1000>,
   148				      <0 0x11e20000 0 0x1000>,
   149				      <0 0x11e30000 0 0x1000>,
   150				      <0 0x11f00000 0 0x1000>,
   151				      <0 0x11f10000 0 0x1000>,
   152				      <0 0x1000b000 0 0x1000>;
   153				reg-names = "gpio", "iocfg_rt", "iocfg_rb", "iocfg_lt",
   154					    "iocfg_lb", "iocfg_tr", "iocfg_tl", "eint";
   155				gpio-controller;
   156				#gpio-cells = <2>;
   157				gpio-ranges = <&pio 0 0 100>;
   158				interrupt-controller;
   159				interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
   160				interrupt-parent = <&gic>;
   161				#interrupt-cells = <2>;
   162			};
   163	
   164			sgmiisys0: syscon@10060000 {
   165				compatible = "mediatek,mt7986-sgmiisys_0",
   166					     "syscon";
   167				reg = <0 0x10060000 0 0x1000>;
   168				#clock-cells = <1>;
   169			};
   170	
   171			sgmiisys1: syscon@10070000 {
   172				compatible = "mediatek,mt7986-sgmiisys_1",
   173					     "syscon";
   174				reg = <0 0x10070000 0 0x1000>;
   175				#clock-cells = <1>;
   176			};
   177	
   178			trng: rng@1020f000 {
   179				compatible = "mediatek,mt7986-rng",
   180					     "mediatek,mt7623-rng";
   181				reg = <0 0x1020f000 0 0x100>;
   182				clocks = <&infracfg CLK_INFRA_TRNG_CK>;
   183				clock-names = "rng";
   184				status = "disabled";
   185			};
   186	
   187			crypto: crypto@10320000 {
   188				compatible = "inside-secure,safexcel-eip97";
   189				reg = <0 0x10320000 0 0x40000>;
   190				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
   191					     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
   192					     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
   193					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
   194				interrupt-names = "ring0", "ring1", "ring2", "ring3";
   195				clocks = <&infracfg CLK_INFRA_EIP97_CK>;
   196				clock-names = "infra_eip97_ck";
   197				assigned-clocks = <&topckgen CLK_TOP_EIP_B_SEL>;
   198				assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>;
   199				status = "disabled";
   200			};
   201	
   202			uart0: serial@11002000 {
   203				compatible = "mediatek,mt7986-uart",
   204					     "mediatek,mt6577-uart";
   205				reg = <0 0x11002000 0 0x400>;
   206				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
   207				clocks = <&infracfg CLK_INFRA_UART0_SEL>,
   208					 <&infracfg CLK_INFRA_UART0_CK>;
   209				clock-names = "baud", "bus";
   210				assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
   211						  <&infracfg CLK_INFRA_UART0_SEL>;
   212				assigned-clock-parents = <&topckgen CLK_TOP_XTAL>,
   213							 <&topckgen CLK_TOP_UART_SEL>;
   214				status = "disabled";
   215			};
   216	
   217			uart1: serial@11003000 {
   218				compatible = "mediatek,mt7986-uart",
   219					     "mediatek,mt6577-uart";
   220				reg = <0 0x11003000 0 0x400>;
   221				interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
   222				clocks = <&infracfg CLK_INFRA_UART1_SEL>,
   223					 <&infracfg CLK_INFRA_UART1_CK>;
   224				clock-names = "baud", "bus";
   225				assigned-clocks = <&infracfg CLK_INFRA_UART1_SEL>;
   226				assigned-clock-parents = <&topckgen CLK_TOP_F26M_SEL>;
   227				status = "disabled";
   228			};
   229	
   230			uart2: serial@11004000 {
   231				compatible = "mediatek,mt7986-uart",
   232					     "mediatek,mt6577-uart";
   233				reg = <0 0x11004000 0 0x400>;
   234				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
   235				clocks = <&infracfg CLK_INFRA_UART2_SEL>,
   236					 <&infracfg CLK_INFRA_UART2_CK>;
   237				clock-names = "baud", "bus";
   238				assigned-clocks = <&infracfg CLK_INFRA_UART2_SEL>;
   239				assigned-clock-parents = <&topckgen CLK_TOP_F26M_SEL>;
   240				status = "disabled";
   241			};
   242	
   243			i2c0: i2c@11008000 {
   244				compatible = "mediatek,mt7986-i2c";
   245				reg = <0 0x11008000 0 0x90>,
   246				      <0 0x10217080 0 0x80>;
   247				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
   248				clock-div = <5>;
   249				clocks = <&infracfg CLK_INFRA_I2C0_CK>,
   250					 <&infracfg CLK_INFRA_AP_DMA_CK>;
   251				clock-names = "main", "dma";
   252				#address-cells = <1>;
   253				#size-cells = <0>;
   254				status = "disabled";
   255			};
   256	
   257			spi0: spi@1100a000 {
   258				compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
   259				#address-cells = <1>;
   260				#size-cells = <0>;
   261				reg = <0 0x1100a000 0 0x100>;
   262				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
   263				clocks = <&topckgen CLK_TOP_MPLL_D2>,
   264					 <&topckgen CLK_TOP_SPI_SEL>,
   265					 <&infracfg CLK_INFRA_SPI0_CK>,
   266					 <&infracfg CLK_INFRA_SPI0_HCK_CK>;
   267				clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
   268				status = "disabled";
   269			};
   270	
   271			spi1: spi@1100b000 {
   272				compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
   273				#address-cells = <1>;
   274				#size-cells = <0>;
   275				reg = <0 0x1100b000 0 0x100>;
   276				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
   277				clocks = <&topckgen CLK_TOP_MPLL_D2>,
   278					 <&topckgen CLK_TOP_SPIM_MST_SEL>,
   279					 <&infracfg CLK_INFRA_SPI1_CK>,
   280					 <&infracfg CLK_INFRA_SPI1_HCK_CK>;
   281				clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
   282				status = "disabled";
   283			};
   284	
   285			ssusb: usb@11200000 {
   286				compatible = "mediatek,mt7986-xhci",
   287					     "mediatek,mtk-xhci";
   288				reg = <0 0x11200000 0 0x2e00>,
   289				      <0 0x11203e00 0 0x0100>;
   290				reg-names = "mac", "ippc";
   291				interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
   292				clocks = <&infracfg CLK_INFRA_IUSB_SYS_CK>,
   293					 <&infracfg CLK_INFRA_IUSB_CK>,
   294					 <&infracfg CLK_INFRA_IUSB_133_CK>,
   295					 <&infracfg CLK_INFRA_IUSB_66M_CK>,
   296					 <&topckgen CLK_TOP_U2U3_XHCI_SEL>;
   297				clock-names = "sys_ck",
   298					      "ref_ck",
   299					      "mcu_ck",
   300					      "dma_ck",
   301					      "xhci_ck";
   302				phys = <&u2port0 PHY_TYPE_USB2>,
   303				       <&u3port0 PHY_TYPE_USB3>,
   304				       <&u2port1 PHY_TYPE_USB2>;
   305				status = "disabled";
   306			};
   307	
   308			mmc0: mmc@11230000 {
   309				compatible = "mediatek,mt7986-mmc";
   310				reg = <0 0x11230000 0 0x1000>,
   311				      <0 0x11c20000 0 0x1000>;
   312				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
   313				clocks = <&topckgen CLK_TOP_EMMC_416M_SEL>,
   314					 <&infracfg CLK_INFRA_MSDC_HCK_CK>,
   315					 <&infracfg CLK_INFRA_MSDC_CK>,
   316					 <&infracfg CLK_INFRA_MSDC_133M_CK>,
   317					 <&infracfg CLK_INFRA_MSDC_66M_CK>;
   318				clock-names = "source", "hclk", "source_cg", "bus_clk",
   319					      "sys_cg";
   320				status = "disabled";
   321			};
   322	
   323			pcie: pcie@11280000 {
   324				compatible = "mediatek,mt7986-pcie",
   325					     "mediatek,mt8192-pcie";
   326				device_type = "pci";
   327				#address-cells = <3>;
   328				#size-cells = <2>;
   329				reg = <0x00 0x11280000 0x00 0x4000>;
   330				reg-names = "pcie-mac";
   331				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
   332				bus-range = <0x00 0xff>;
   333				ranges = <0x82000000 0x00 0x20000000 0x00
   334					  0x20000000 0x00 0x10000000>;
   335				clocks = <&infracfg CLK_INFRA_IPCIE_PIPE_CK>,
   336					 <&infracfg CLK_INFRA_IPCIE_CK>,
   337					 <&infracfg CLK_INFRA_IPCIER_CK>,
   338					 <&infracfg CLK_INFRA_IPCIEB_CK>;
   339				clock-names = "pl_250m", "tl_26m", "peri_26m", "top_133m";
   340				status = "disabled";
   341	
   342				phys = <&pcie_port PHY_TYPE_PCIE>;
   343				phy-names = "pcie-phy";
   344	
   345				#interrupt-cells = <1>;
   346				interrupt-map-mask = <0 0 0 0x7>;
   347				interrupt-map = <0 0 0 1 &pcie_intc 0>,
   348						<0 0 0 2 &pcie_intc 1>,
   349						<0 0 0 3 &pcie_intc 2>,
   350						<0 0 0 4 &pcie_intc 3>;
   351				pcie_intc: interrupt-controller {
   352					#address-cells = <0>;
   353					#interrupt-cells = <1>;
   354					interrupt-controller;
   355				};
   356			};
   357	
 > 358			pcie_phy: t-phy@11c00000 {
   359				compatible = "mediatek,mt7986-tphy",
   360					     "mediatek,generic-tphy-v2";
   361				#address-cells = <2>;
   362				#size-cells = <2>;
   363				ranges;
   364				status = "disabled";
   365	
   366				pcie_port: pcie-phy@11c00000 {
   367					reg = <0 0x11c00000 0 0x20000>;
   368					clocks = <&clk40m>;
   369					clock-names = "ref";
   370					#phy-cells = <1>;
   371				};
   372			};
   373	
   374			usb_phy: t-phy@11e10000 {
   375				compatible = "mediatek,mt7986-tphy",
   376					     "mediatek,generic-tphy-v2";
   377				#address-cells = <1>;
   378				#size-cells = <1>;
   379				ranges = <0 0 0x11e10000 0x1700>;
   380				status = "disabled";
   381	
   382				u2port0: usb-phy@0 {
   383					reg = <0x0 0x700>;
   384					clocks = <&topckgen CLK_TOP_DA_U2_REFSEL>,
   385						 <&topckgen CLK_TOP_DA_U2_CK_1P_SEL>;
   386					clock-names = "ref", "da_ref";
   387					#phy-cells = <1>;
   388				};
   389	
   390				u3port0: usb-phy@700 {
   391					reg = <0x700 0x900>;
   392					clocks = <&topckgen CLK_TOP_USB3_PHY_SEL>;
   393					clock-names = "ref";
   394					#phy-cells = <1>;
   395				};
   396	
   397				u2port1: usb-phy@1000 {
   398					reg = <0x1000 0x700>;
   399					clocks = <&topckgen CLK_TOP_DA_U2_REFSEL>,
   400						 <&topckgen CLK_TOP_DA_U2_CK_1P_SEL>;
   401					clock-names = "ref", "da_ref";
   402					#phy-cells = <1>;
   403				};
   404			};
   405	
   406			ethsys: syscon@15000000 {
   407				 #address-cells = <1>;
   408				 #size-cells = <1>;
   409				 compatible = "mediatek,mt7986-ethsys",
   410					      "syscon";
   411				 reg = <0 0x15000000 0 0x1000>;
   412				 #clock-cells = <1>;
   413				 #reset-cells = <1>;
   414			};
   415	
   416			wed0: wed@15010000 {
   417				compatible = "mediatek,mt7986-wed",
   418					     "syscon";
   419				reg = <0 0x15010000 0 0x1000>;
   420				interrupt-parent = <&gic>;
   421				interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
   422			};
   423	
   424			wed1: wed@15011000 {
   425				compatible = "mediatek,mt7986-wed",
   426					     "syscon";
   427				reg = <0 0x15011000 0 0x1000>;
   428				interrupt-parent = <&gic>;
   429				interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
   430			};
   431	
   432			eth: ethernet@15100000 {
   433				compatible = "mediatek,mt7986-eth";
   434				reg = <0 0x15100000 0 0x80000>;
   435				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
   436					     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
   437					     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
   438					     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
   439				clocks = <&ethsys CLK_ETH_FE_EN>,
   440					 <&ethsys CLK_ETH_GP2_EN>,
   441					 <&ethsys CLK_ETH_GP1_EN>,
   442					 <&ethsys CLK_ETH_WOCPU1_EN>,
   443					 <&ethsys CLK_ETH_WOCPU0_EN>,
   444					 <&sgmiisys0 CLK_SGMII0_TX250M_EN>,
   445					 <&sgmiisys0 CLK_SGMII0_RX250M_EN>,
   446					 <&sgmiisys0 CLK_SGMII0_CDR_REF>,
   447					 <&sgmiisys0 CLK_SGMII0_CDR_FB>,
   448					 <&sgmiisys1 CLK_SGMII1_TX250M_EN>,
   449					 <&sgmiisys1 CLK_SGMII1_RX250M_EN>,
   450					 <&sgmiisys1 CLK_SGMII1_CDR_REF>,
   451					 <&sgmiisys1 CLK_SGMII1_CDR_FB>,
   452					 <&topckgen CLK_TOP_NETSYS_SEL>,
   453					 <&topckgen CLK_TOP_NETSYS_500M_SEL>;
   454				clock-names = "fe", "gp2", "gp1", "wocpu1", "wocpu0",
   455					      "sgmii_tx250m", "sgmii_rx250m",
   456					      "sgmii_cdr_ref", "sgmii_cdr_fb",
   457					      "sgmii2_tx250m", "sgmii2_rx250m",
   458					      "sgmii2_cdr_ref", "sgmii2_cdr_fb",
   459					      "netsys0", "netsys1";
   460				assigned-clocks = <&topckgen CLK_TOP_NETSYS_2X_SEL>,
   461						  <&topckgen CLK_TOP_SGM_325M_SEL>;
   462				assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>,
   463							 <&apmixedsys CLK_APMIXED_SGMPLL>;
   464				mediatek,ethsys = <&ethsys>;
   465				mediatek,sgmiisys = <&sgmiisys0>, <&sgmiisys1>;
   466				mediatek,wed-pcie = <&wed_pcie>;
   467				mediatek,wed = <&wed0>, <&wed1>;
   468				#reset-cells = <1>;
   469				#address-cells = <1>;
   470				#size-cells = <0>;
   471				status = "disabled";
   472			};
   473	
   474			wifi: wifi@18000000 {
   475				compatible = "mediatek,mt7986-wmac";
   476				resets = <&watchdog MT7986_TOPRGU_CONSYS_SW_RST>;
   477				reset-names = "consys";
   478				clocks = <&topckgen CLK_TOP_CONN_MCUSYS_SEL>,
   479					 <&topckgen CLK_TOP_AP2CNN_HOST_SEL>;
   480				clock-names = "mcu", "ap2conn";
   481				reg = <0 0x18000000 0 0x1000000>,
   482				      <0 0x10003000 0 0x1000>,
   483				      <0 0x11d10000 0 0x1000>;
   484				interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
   485					     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
   486					     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
   487					     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
   488				memory-region = <&wmcpu_emi>;
   489			};
   490		};
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
