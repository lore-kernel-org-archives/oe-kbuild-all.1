Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EBF101D5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 20:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718570984; cv=none; b=GIWMpF1xAn96/u5PVhfuSmIl64uakYcWxFyNmRFrjxze8TUn2qi/oPHghfsDwhhGNFLoMG7qUbfHWmDXV+YC91tGkQWzyi5IZRnSCDvJefdVQ7YdpcM2Uyg0xP/eAm3lxRccDX+D9iJhRsb9QsvB3ZtL3Kz9/x2qTHvLMdTqi1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718570984; c=relaxed/simple;
	bh=apLKQZe4lh/wZicHuhu8+qShbOLGK1AS0Ue0MFOydm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aAvLey+7qnyWDbNVmNBJevGPBKMJTPVi9zpwCfh6vrhT7zQa/rioY1v7f+oon+ugBd/pXaJZqUpBzQcPqRhL8hTNIGAs2RCbSFZTVIG3cd/QDozdt0hU/od70VNv1953cFZlBjdxwBD4/6tcMJ4qD9uJvSz+nKSsEihfZLeLGUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuTlTq8O; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuTlTq8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718570982; x=1750106982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=apLKQZe4lh/wZicHuhu8+qShbOLGK1AS0Ue0MFOydm8=;
  b=CuTlTq8OowtjEzO0PTAZHmyEsKcBbEo1IkrFFYvd+ozioFToZ5TSbDmH
   S/xV8ic2EZCYf5wHKlh3i9EkzoKcM4rgAWTGfqLhoRjb0LyFeFdW/qlnk
   OUYwVgsptHAX9ITdJgot1IP1aIMQK795cxEfwo5D3YHST7xgQHb+CSF2o
   NKlG6VjLFshbvd78bRkY7SjqxXNF3ToR4FjX3fIKgcHXm18f3SxT8742F
   8xExekbKcBwIUzap3WsiGYato4gLMZCzqvGhf775sBD289E47o6tavvy7
   yvbucI8xXNZGeeJIC0+4XYYAfEcVObn+YJ8rxOY+1x+SdMRQATO5H/m2Y
   g==;
X-CSE-ConnectionGUID: NcRxrLSoRgGZJHQwk2QswQ==
X-CSE-MsgGUID: 6XQU2agyQYW9doyO4nWbTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15270852"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="15270852"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 13:49:41 -0700
X-CSE-ConnectionGUID: YbUF8nZ0RKajvRHGvr5fpA==
X-CSE-MsgGUID: SlfVjIp0RLq1ZD5gkLy6eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="41157009"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2024 13:49:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIwoj-0003IE-1Q;
	Sun, 16 Jun 2024 20:49:37 +0000
Date: Mon, 17 Jun 2024 04:49:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.10-rsslro 2581/2587]
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi:705.18-710.5: Warning
 (simple_bus_reg): /soc/ice_debug: missing or empty reg/ranges property
Message-ID: <202406170441.6qMLnqZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-rsslro
head:   eb3136f791cd4e799431e1050a94b2b25b20dc0d
commit: f5afec069885716c0aaeb2e44e7b2aff8d28b9fa [2581/2587] complete mt7981 dts and add GL.iNet MT3000
config: arm64-randconfig-001-20240616 (https://download.01.org/0day-ci/archive/20240617/202406170441.6qMLnqZM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170441.6qMLnqZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170441.6qMLnqZM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7981b.dtsi:705.18-710.5: Warning (simple_bus_reg): /soc/ice_debug: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7981b.dtsi:188.33-195.5: Warning (unique_unit_address_if_enabled): /soc/ap2woccif@151a5000: duplicate unit-address (also used in node /soc/syscon@151a5000)
>> arch/arm64/boot/dts/mediatek/mt7981b.dtsi:662.36-665.6: Warning (unique_unit_address_if_enabled): /soc/efuse@11f20000/usb3-rx-imp@8c8: duplicate unit-address (also used in node /soc/efuse@11f20000/usb3-tx-imp@8c8)
--
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:90.3-13: Warning (reg_format): /soc/ethernet@15100000/mac@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:99.3-13: Warning (reg_format): /soc/ethernet@15100000/mac@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:42.24-45.5: Warning (unit_address_vs_reg): /leds/led@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:47.20-50.5: Warning (unit_address_vs_reg): /leds/led@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:88.15-95.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:88.15-95.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:97.15-105.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:97.15-105.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@1: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

vim +705 arch/arm64/boot/dts/mediatek/mt7981b.dtsi

    13	
    14	/ {
    15		compatible = "mediatek,mt7981b";
    16		interrupt-parent = <&gic>;
    17		#address-cells = <2>;
    18		#size-cells = <2>;
    19	
    20		cpus {
    21			#address-cells = <1>;
    22			#size-cells = <0>;
    23	
    24			cpu@0 {
    25				compatible = "arm,cortex-a53";
    26				reg = <0x0>;
    27				device_type = "cpu";
    28				enable-method = "psci";
    29			};
    30	
    31			cpu@1 {
    32				compatible = "arm,cortex-a53";
    33				reg = <0x1>;
    34				device_type = "cpu";
    35				enable-method = "psci";
    36			};
    37		};
    38	
    39		oscillator-40m {
    40			compatible = "fixed-clock";
    41			clock-frequency = <40000000>;
    42			clock-output-names = "clkxtal";
    43			#clock-cells = <0>;
    44		};
    45	
    46		psci {
    47			compatible = "arm,psci-1.0";
    48			method = "smc";
    49		};
    50	
    51		fan: pwm-fan {
    52			compatible = "pwm-fan";
    53			/* cooling level (0, 1, 2, 3) : (0% duty, 50% duty, 75% duty, 100% duty) */
    54			cooling-levels = <0 128 192 255>;
    55			#cooling-cells = <2>;
    56			status = "disabled";
    57		};
    58	
    59		reg_3p3v: regulator-3p3v {
    60			compatible = "regulator-fixed";
    61			regulator-name = "fixed-3.3V";
    62			regulator-min-microvolt = <3300000>;
    63			regulator-max-microvolt = <3300000>;
    64			regulator-boot-on;
    65			regulator-always-on;
    66		};
    67	
    68		reserved-memory {
    69			#address-cells = <2>;
    70			#size-cells = <2>;
    71			ranges;
    72	
    73			/* 64 KiB reserved for ramoops/pstore */
    74			ramoops@42ff0000 {
    75				compatible = "ramoops";
    76				reg = <0 0x42ff0000 0 0x10000>;
    77				record-size = <0x1000>;
    78			};
    79	
    80			/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
    81			secmon_reserved: secmon@43000000 {
    82				reg = <0 0x43000000 0 0x30000>;
    83				no-map;
    84			};
    85	
    86			wmcpu_emi: wmcpu-reserved@47c80000 {
    87				reg = <0 0x47c80000 0 0x100000>;
    88				no-map;
    89			};
    90	
    91			wo_emi0: wo-emi@47d80000 {
    92				reg = <0 0x47d80000 0 0x40000>;
    93				no-map;
    94			};
    95	
    96			wo_data: wo-data@47dc0000 {
    97				reg = <0 0x47dc0000 0 0x240000>;
    98				no-map;
    99			};
   100		};
   101	
   102		soc {
   103			compatible = "simple-bus";
   104			ranges;
   105			#address-cells = <2>;
   106			#size-cells = <2>;
   107	
   108			gic: interrupt-controller@c000000 {
   109				compatible = "arm,gic-v3";
   110				reg = <0 0x0c000000 0 0x40000>,  /* GICD */
   111				      <0 0x0c080000 0 0x200000>; /* GICR */
   112				interrupt-parent = <&gic>;
   113				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
   114				interrupt-controller;
   115				#interrupt-cells = <3>;
   116			};
   117	
   118			infracfg: clock-controller@10001000 {
   119				compatible = "mediatek,mt7981-infracfg", "syscon";
   120				reg = <0 0x10001000 0 0x1000>;
   121				#clock-cells = <1>;
   122			};
   123	
   124			topckgen: clock-controller@1001b000 {
   125				compatible = "mediatek,mt7981-topckgen", "syscon";
   126				reg = <0 0x1001b000 0 0x1000>;
   127				#clock-cells = <1>;
   128			};
   129	
   130			watchdog: watchdog@1001c000 {
   131				compatible = "mediatek,mt7986-wdt",
   132					     "mediatek,mt6589-wdt";
   133				reg = <0 0x1001c000 0 0x1000>;
   134				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
   135				#reset-cells = <1>;
   136				status = "disabled";
   137			};
   138	
   139			apmixedsys: clock-controller@1001e000 {
   140				compatible = "mediatek,mt7981-apmixedsys";
   141				reg = <0 0x1001e000 0 0x1000>;
   142				#clock-cells = <1>;
   143			};
   144	
   145			pwm: pwm@10048000 {
   146				compatible = "mediatek,mt7981-pwm";
   147				reg = <0 0x10048000 0 0x1000>;
   148				clocks = <&infracfg CLK_INFRA_PWM_STA>,
   149					<&infracfg CLK_INFRA_PWM_HCK>,
   150					<&infracfg CLK_INFRA_PWM1_CK>,
   151					<&infracfg CLK_INFRA_PWM2_CK>,
   152					<&infracfg CLK_INFRA_PWM3_CK>;
   153				clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
   154				#pwm-cells = <2>;
   155			};
   156	
   157			thermal: thermal@1100c800 {
   158				#thermal-sensor-cells = <1>;
   159				compatible = "mediatek,mt7981-thermal", "mediatek,mt7986-thermal";
   160				reg = <0 0x1100c800 0 0x800>;
   161				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
   162				clocks = <&infracfg CLK_INFRA_THERM_CK>,
   163					 <&infracfg CLK_INFRA_ADC_26M_CK>;
   164				clock-names = "therm", "auxadc";
   165				mediatek,auxadc = <&auxadc>;
   166				mediatek,apmixedsys = <&apmixedsys>;
   167				nvmem-cells = <&thermal_calibration>;
   168				nvmem-cell-names = "calibration-data";
   169			};
   170	
   171			auxadc: adc@1100d000 {
   172				compatible = "mediatek,mt7981-auxadc",
   173					     "mediatek,mt7986-auxadc",
   174					     "mediatek,mt7622-auxadc";
   175				reg = <0 0x1100d000 0 0x1000>;
   176				clocks = <&infracfg CLK_INFRA_ADC_26M_CK>,
   177					 <&infracfg CLK_INFRA_ADC_FRC_CK>;
   178				clock-names = "main", "32k";
   179				#io-channel-cells = <1>;
   180			};
   181	
   182			wdma: wdma@15104800 {
   183				compatible = "mediatek,wed-wdma";
   184				reg = <0 0x15104800 0 0x400>,
   185				      <0 0x15104c00 0 0x400>;
   186			};
   187	
   188			ap2woccif: ap2woccif@151a5000 {
   189				compatible = "mediatek,ap2woccif";
   190				reg = <0 0x151a5000 0 0x1000>,
   191				      <0 0x151ad000 0 0x1000>;
   192				interrupt-parent = <&gic>;
   193				interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
   194					     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
   195			};
   196	
   197	
   198			uart0: serial@11002000 {
   199				compatible = "mediatek,mt6577-uart";
   200				reg = <0 0x11002000 0 0x400>;
   201				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
   202				clocks = <&infracfg CLK_INFRA_UART0_SEL>,
   203					<&infracfg CLK_INFRA_UART0_CK>;
   204				clock-names = "baud", "bus";
   205				assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
   206						  <&infracfg CLK_INFRA_UART0_SEL>;
   207				assigned-clock-parents = <&topckgen CLK_TOP_CB_CKSQ_40M>,
   208							 <&topckgen CLK_TOP_UART_SEL>;
   209				pinctrl-0 = <&uart0_pins>;
   210				pinctrl-names = "default";
   211				status = "disabled";
   212			};
   213	
   214			uart1: serial@11003000 {
   215				compatible = "mediatek,mt6577-uart";
   216				reg = <0 0x11003000 0 0x400>;
   217				interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
   218				clocks = <&infracfg CLK_INFRA_UART1_SEL>,
   219					<&infracfg CLK_INFRA_UART1_CK>;
   220				clock-names = "baud", "bus";
   221				assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
   222						  <&infracfg CLK_INFRA_UART1_SEL>;
   223				assigned-clock-parents = <&topckgen CLK_TOP_CB_CKSQ_40M>,
   224							 <&topckgen CLK_TOP_UART_SEL>;
   225				status = "disabled";
   226			};
   227	
   228			uart2: serial@11004000 {
   229				compatible = "mediatek,mt6577-uart";
   230				reg = <0 0x11004000 0 0x400>;
   231				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
   232				clocks = <&infracfg CLK_INFRA_UART2_SEL>,
   233					<&infracfg CLK_INFRA_UART2_CK>;
   234				clock-names = "baud", "bus";
   235				assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
   236						  <&infracfg CLK_INFRA_UART2_SEL>;
   237				assigned-clock-parents = <&topckgen CLK_TOP_CB_CKSQ_40M>,
   238							 <&topckgen CLK_TOP_UART_SEL>;
   239				status = "disabled";
   240			};
   241	
   242			i2c0: i2c@11007000 {
   243				compatible = "mediatek,mt7981-i2c";
   244				reg = <0 0x11007000 0 0x1000>,
   245				      <0 0x10217080 0 0x80>;
   246				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
   247				clock-div = <1>;
   248				clocks = <&infracfg CLK_INFRA_I2C0_CK>,
   249					 <&infracfg CLK_INFRA_AP_DMA_CK>,
   250					 <&infracfg CLK_INFRA_I2C_MCK_CK>,
   251					 <&infracfg CLK_INFRA_I2C_PCK_CK>;
   252				clock-names = "main", "dma", "arb", "pmic";
   253				#address-cells = <1>;
   254				#size-cells = <0>;
   255				status = "disabled";
   256			};
   257	
   258			pcie: pcie@11280000 {
   259				compatible = "mediatek,mt7981-pcie",
   260					     "mediatek,mt7986-pcie";
   261				device_type = "pci";
   262				reg = <0 0x11280000 0 0x4000>;
   263				reg-names = "pcie-mac";
   264				#address-cells = <3>;
   265				#size-cells = <2>;
   266				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
   267				bus-range = <0x00 0xff>;
   268				ranges = <0x82000000 0 0x20000000
   269					  0x0 0x20000000 0 0x10000000>;
   270				status = "disabled";
   271	
   272				clocks = <&infracfg CLK_INFRA_IPCIE_CK>,
   273					 <&infracfg CLK_INFRA_IPCIE_PIPE_CK>,
   274					 <&infracfg CLK_INFRA_IPCIER_CK>,
   275					 <&infracfg CLK_INFRA_IPCIEB_CK>;
   276	
   277				phys = <&u3port0 PHY_TYPE_PCIE>;
   278				phy-names = "pcie-phy";
   279	
   280				#interrupt-cells = <1>;
   281				interrupt-map-mask = <0 0 0 7>;
   282				interrupt-map = <0 0 0 1 &pcie_intc 0>,
   283						<0 0 0 2 &pcie_intc 1>,
   284						<0 0 0 3 &pcie_intc 2>,
   285						<0 0 0 4 &pcie_intc 3>;
   286				pcie_intc: interrupt-controller {
   287					interrupt-controller;
   288					#address-cells = <0>;
   289					#interrupt-cells = <1>;
   290				};
   291			};
   292	
   293			crypto: crypto@10320000 {
   294				compatible = "inside-secure,safexcel-eip97";
   295				reg = <0 0x10320000 0 0x40000>;
   296				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
   297					     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
   298					     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
   299					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
   300				interrupt-names = "ring0", "ring1", "ring2", "ring3";
   301				clocks = <&topckgen CLK_TOP_EIP97B>;
   302				clock-names = "top_eip97_ck";
   303				assigned-clocks = <&topckgen CLK_TOP_EIP97B_SEL>;
   304				assigned-clock-parents = <&topckgen CLK_TOP_CB_NET1_D5>;
   305			};
   306	
   307			pio: pinctrl@11d00000 {
   308				compatible = "mediatek,mt7981-pinctrl";
   309				reg = <0 0x11d00000 0 0x1000>,
   310				      <0 0x11c00000 0 0x1000>,
   311				      <0 0x11c10000 0 0x1000>,
   312				      <0 0x11d20000 0 0x1000>,
   313				      <0 0x11e00000 0 0x1000>,
   314				      <0 0x11e20000 0 0x1000>,
   315				      <0 0x11f00000 0 0x1000>,
   316				      <0 0x11f10000 0 0x1000>,
   317				      <0 0x1000b000 0 0x1000>;
   318				reg-names = "gpio", "iocfg_rt", "iocfg_rm", "iocfg_rb", "iocfg_lb",
   319					    "iocfg_bl", "iocfg_tm", "iocfg_tl", "eint";
   320				interrupt-controller;
   321				interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
   322				interrupt-parent = <&gic>;
   323				gpio-ranges = <&pio 0 0 56>;
   324				gpio-controller;
   325				#gpio-cells = <2>;
   326				#interrupt-cells = <2>;
   327	
   328				mdio_pins: mdc-mdio-pins {
   329					mux {
   330						function = "eth";
   331						groups = "smi_mdc_mdio";
   332					};
   333				};
   334	
   335				uart0_pins: uart0-pins {
   336					mux {
   337						function = "uart";
   338						groups = "uart0";
   339					};
   340				};
   341	
   342				wifi_dbdc_pins: wifi-dbdc-pins {
   343					mux {
   344						function = "eth";
   345						groups = "wf0_mode1";
   346					};
   347					conf {
   348						pins = "WF_HB1", "WF_HB2", "WF_HB3", "WF_HB4",
   349						       "WF_HB0", "WF_HB0_B", "WF_HB5", "WF_HB6",
   350						       "WF_HB7", "WF_HB8", "WF_HB9", "WF_HB10",
   351						       "WF_TOP_CLK", "WF_TOP_DATA", "WF_XO_REQ",
   352						       "WF_CBA_RESETB", "WF_DIG_RESETB";
   353						drive-strength = <4>;
   354					};
   355				};
   356	
   357				gbe_led0_pins: gbe-led0-pins {
   358					mux {
   359						function = "led";
   360						groups = "gbe_led0";
   361					};
   362				};
   363	
   364				gbe_led1_pins: gbe-led1-pins {
   365					mux {
   366						function = "led";
   367						groups = "gbe_led1";
   368					};
   369				};
   370			};
   371	
   372			ethsys: clock-controller@15000000 {
   373				compatible = "mediatek,mt7981-ethsys", "syscon";
   374				reg = <0 0x15000000 0 0x1000>;
   375				#clock-cells = <1>;
   376				#reset-cells = <1>;
   377			};
   378	
   379			wed: wed@15010000 {
   380				compatible = "mediatek,mt7981-wed",
   381					     "mediatek,mt7986-wed",
   382					     "syscon";
   383				reg = <0 0x15010000 0 0x1000>;
   384				interrupt-parent = <&gic>;
   385				interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
   386				memory-region = <&wo_emi0>, <&wo_data>;
   387				memory-region-names = "wo-emi", "wo-data";
   388				mediatek,wo-ccif = <&wo_ccif0>;
   389				mediatek,wo-ilm = <&wo_ilm0>;
   390				mediatek,wo-dlm = <&wo_dlm0>;
   391				mediatek,wo-cpuboot = <&wo_cpuboot>;
   392			};
   393	
   394			eth: ethernet@15100000 {
   395				compatible = "mediatek,mt7981-eth";
   396				reg = <0 0x15100000 0 0x80000>;
   397				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
   398						<GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
   399						<GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
   400						<GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
   401				clocks = <&ethsys CLK_ETH_FE_EN>,
   402					<&ethsys CLK_ETH_GP2_EN>,
   403					<&ethsys CLK_ETH_GP1_EN>,
   404					<&ethsys CLK_ETH_WOCPU0_EN>,
   405					<&sgmiisys0 CLK_SGM0_TX_EN>,
   406					<&sgmiisys0 CLK_SGM0_RX_EN>,
   407					<&sgmiisys0 CLK_SGM0_CK0_EN>,
   408					<&sgmiisys0 CLK_SGM0_CDR_CK0_EN>,
   409					<&sgmiisys1 CLK_SGM1_TX_EN>,
   410					<&sgmiisys1 CLK_SGM1_RX_EN>,
   411					<&sgmiisys1 CLK_SGM1_CK1_EN>,
   412					<&sgmiisys1 CLK_SGM1_CDR_CK1_EN>,
   413					<&topckgen CLK_TOP_SGM_REG>,
   414					<&topckgen CLK_TOP_NETSYS_SEL>,
   415					<&topckgen CLK_TOP_NETSYS_500M_SEL>;
   416				clock-names = "fe", "gp2", "gp1", "wocpu0",
   417							"sgmii_tx250m", "sgmii_rx250m",
   418							"sgmii_cdr_ref", "sgmii_cdr_fb",
   419							"sgmii2_tx250m", "sgmii2_rx250m",
   420							"sgmii2_cdr_ref", "sgmii2_cdr_fb",
   421							"sgmii_ck", "netsys0", "netsys1";
   422				assigned-clocks = <&topckgen CLK_TOP_NETSYS_2X_SEL>,
   423						  <&topckgen CLK_TOP_SGM_325M_SEL>;
   424				assigned-clock-parents = <&topckgen CLK_TOP_CB_NET2_800M>,
   425							 <&topckgen CLK_TOP_CB_SGM_325M>;
   426				mediatek,ethsys = <&ethsys>;
   427				mediatek,sgmiisys = <&sgmiisys0>, <&sgmiisys1>;
   428				mediatek,infracfg = <&topmisc>;
   429				mediatek,wed = <&wed>;
   430				status = "disabled";
   431	
   432				mdio_bus: mdio-bus {
   433					#address-cells = <1>;
   434					#size-cells = <0>;
   435	
   436					int_gbe_phy: ethernet-phy@0 {
   437						reg = <0>;
   438						compatible = "ethernet-phy-ieee802.3-c22";
   439						phy-mode = "gmii";
   440						phy-is-integrated;
   441						nvmem-cells = <&phy_calibration>;
   442						nvmem-cell-names = "phy-cal-data";
   443	
   444						leds {
   445							#address-cells = <1>;
   446							#size-cells = <0>;
   447	
   448							int_gbe_phy_led0: int-gbe-phy-led0@0 {
   449								reg = <0>;
   450								function = LED_FUNCTION_LAN;
   451								pinctrl-0 = <&gbe_led0_pins>;
   452								pinctrl-names = "default";
   453								status = "disabled";
   454							};
   455	
   456							int_gbe_phy_led1: int-gbe-phy-led1@1 {
   457								reg = <1>;
   458								function = LED_FUNCTION_LAN;
   459								pinctrl-0 = <&gbe_led1_pins>;
   460								pinctrl-names = "default";
   461								status = "disabled";
   462							};
   463						};
   464					};
   465				};
   466			};
   467	
   468			wo_dlm0: syscon@151e8000 {
   469				compatible = "mediatek,mt7986-wo-dlm", "syscon";
   470				reg = <0 0x151e8000 0 0x2000>;
   471			};
   472	
   473			wo_ilm0: syscon@151e0000 {
   474				compatible = "mediatek,mt7986-wo-ilm", "syscon";
   475				reg = <0 0x151e0000 0 0x8000>;
   476			};
   477	
   478			wo_cpuboot: syscon@15194000 {
   479				compatible = "mediatek,mt7986-wo-cpuboot", "syscon";
   480				reg = <0 0x15194000 0 0x1000>;
   481			};
   482	
   483			wo_ccif0: syscon@151a5000 {
   484				compatible = "mediatek,mt7986-wo-ccif", "syscon";
   485				reg = <0 0x151a5000 0 0x1000>;
   486				interrupt-parent = <&gic>;
   487				interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
   488			};
   489	
   490			sgmiisys0: syscon@10060000 {
   491				compatible = "mediatek,mt7981-sgmiisys_0", "mediatek,mt7986-sgmiisys_0", "syscon";
   492				reg = <0 0x10060000 0 0x1000>;
   493				mediatek,pnswap;
   494				#clock-cells = <1>;
   495			};
   496	
   497			sgmiisys1: syscon@10070000 {
   498				compatible = "mediatek,mt7981-sgmiisys_1", "mediatek,mt7986-sgmiisys_1", "syscon";
   499				reg = <0 0x10070000 0 0x1000>;
   500				#clock-cells = <1>;
   501			};
   502	
   503			topmisc: topmisc@11d10000 {
   504				compatible = "mediatek,mt7981-topmisc", "syscon";
   505				reg = <0 0x11d10000 0 0x10000>;
   506				#clock-cells = <1>;
   507			};
   508	
   509			snand: snfi@11005000 {
   510				compatible = "mediatek,mt7986-snand";
   511				reg = <0 0x11005000 0 0x1000>, <0 0x11006000 0 0x1000>;
   512				reg-names = "nfi", "ecc";
   513				interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
   514				clocks = <&infracfg CLK_INFRA_SPINFI1_CK>,
   515					 <&infracfg CLK_INFRA_NFI1_CK>,
   516					 <&infracfg CLK_INFRA_NFI_HCK_CK>;
   517				clock-names = "pad_clk", "nfi_clk", "nfi_hclk";
   518				assigned-clocks = <&topckgen CLK_TOP_SPINFI_SEL>,
   519						  <&topckgen CLK_TOP_NFI1X_SEL>;
   520				assigned-clock-parents = <&topckgen CLK_TOP_CB_M_D8>,
   521							 <&topckgen CLK_TOP_CB_M_D8>;
   522				#address-cells = <1>;
   523				#size-cells = <0>;
   524				status = "disabled";
   525			};
   526	
   527			mmc0: mmc@11230000 {
   528				compatible = "mediatek,mt7986-mmc",
   529							"mediatek,mt7981-mmc";
   530				reg = <0 0x11230000 0 0x1000>, <0 0x11c20000 0 0x1000>;
   531				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
   532				clocks = <&infracfg CLK_INFRA_MSDC_CK>,
   533					 <&infracfg CLK_INFRA_MSDC_HCK_CK>,
   534					 <&infracfg CLK_INFRA_MSDC_66M_CK>,
   535					 <&infracfg CLK_INFRA_MSDC_133M_CK>;
   536				assigned-clocks = <&topckgen CLK_TOP_EMMC_208M_SEL>,
   537						  <&topckgen CLK_TOP_EMMC_400M_SEL>;
   538				assigned-clock-parents = <&topckgen CLK_TOP_CB_M_D2>,
   539							 <&topckgen CLK_TOP_CB_NET2_D2>;
   540				clock-names = "source", "hclk", "axi_cg", "ahb_cg";
   541				status = "disabled";
   542			};
   543	
   544			wed_pcie: wed_pcie@10003000 {
   545				compatible = "mediatek,wed_pcie";
   546				reg = <0 0x10003000 0 0x10>;
   547			};
   548	
   549			spi0: spi@1100a000 {
   550				compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
   551				#address-cells = <1>;
   552				#size-cells = <0>;
   553				reg = <0 0x1100a000 0 0x100>;
   554				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
   555				clocks = <&topckgen CLK_TOP_CB_M_D2>,
   556					 <&topckgen CLK_TOP_SPI_SEL>,
   557					 <&infracfg CLK_INFRA_SPI0_CK>,
   558					 <&infracfg CLK_INFRA_SPI0_HCK_CK>;
   559	
   560				clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
   561				status = "disabled";
   562			};
   563	
   564			spi1: spi@1100b000 {
   565				compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
   566				#address-cells = <1>;
   567				#size-cells = <0>;
   568				reg = <0 0x1100b000 0 0x100>;
   569				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
   570				clocks = <&topckgen CLK_TOP_CB_M_D2>,
   571					 <&topckgen CLK_TOP_SPIM_MST_SEL>,
   572					 <&infracfg CLK_INFRA_SPI1_CK>,
   573					 <&infracfg CLK_INFRA_SPI1_HCK_CK>;
   574				clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
   575				status = "disabled";
   576			};
   577	
   578			spi2: spi@11009000 {
   579				compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
   580				#address-cells = <1>;
   581				#size-cells = <0>;
   582				reg = <0 0x11009000 0 0x100>;
   583				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
   584				clocks = <&topckgen CLK_TOP_CB_M_D2>,
   585					 <&topckgen CLK_TOP_SPI_SEL>,
   586					 <&infracfg CLK_INFRA_SPI2_CK>,
   587					 <&infracfg CLK_INFRA_SPI2_HCK_CK>;
   588				clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
   589				status = "disabled";
   590			};
   591	
   592			consys: consys@10000000 {
   593				compatible = "mediatek,mt7981-consys";
   594				reg = <0 0x10000000 0 0x8600000>;
   595				memory-region = <&wmcpu_emi>;
   596			};
   597	
   598			xhci: usb@11200000 {
   599				compatible = "mediatek,mt7986-xhci",
   600					     "mediatek,mtk-xhci";
   601				reg = <0 0x11200000 0 0x2e00>,
   602				      <0 0x11203e00 0 0x0100>;
   603				reg-names = "mac", "ippc";
   604				interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
   605				clocks = <&infracfg CLK_INFRA_IUSB_SYS_CK>,
   606					 <&infracfg CLK_INFRA_IUSB_CK>,
   607					 <&infracfg CLK_INFRA_IUSB_133_CK>,
   608					 <&infracfg CLK_INFRA_IUSB_66M_CK>,
   609					 <&topckgen CLK_TOP_U2U3_XHCI_SEL>;
   610				clock-names = "sys_ck",
   611					      "ref_ck",
   612					      "mcu_ck",
   613					      "dma_ck",
   614					      "xhci_ck";
   615				phys = <&u2port0 PHY_TYPE_USB2>,
   616				       <&u3port0 PHY_TYPE_USB3>;
   617				vusb33-supply = <&reg_3p3v>;
   618				status = "disabled";
   619			};
   620	
   621			usb_phy: usb-phy@11e10000 {
   622				compatible = "mediatek,mt7981",
   623					     "mediatek,generic-tphy-v2";
   624				#address-cells = <1>;
   625				#size-cells = <1>;
   626				ranges = <0 0 0x11e10000 0x1700>;
   627				status = "disabled";
   628	
   629				u2port0: usb-phy@0 {
   630					reg = <0x0 0x700>;
   631					clocks = <&topckgen CLK_TOP_USB_FRMCNT_SEL>;
   632					clock-names = "ref";
   633					#phy-cells = <1>;
   634				};
   635	
   636				u3port0: usb-phy@700 {
   637					reg = <0x700 0x900>;
   638					clocks = <&topckgen CLK_TOP_USB3_PHY_SEL>;
   639					clock-names = "ref";
   640					#phy-cells = <1>;
   641					mediatek,syscon-type = <&topmisc 0x218 0>;
   642					status = "okay";
   643				};
   644			};
   645	
   646			efuse: efuse@11f20000 {
   647				compatible = "mediatek,mt7981-efuse",
   648					     "mediatek,efuse";
   649				reg = <0 0x11f20000 0 0x1000>;
   650				#address-cells = <1>;
   651				#size-cells = <1>;
   652				status = "okay";
   653	
   654				thermal_calibration: thermal-calib@274 {
   655					reg = <0x274 0xc>;
   656				};
   657	
   658				phy_calibration: phy-calib@8dc {
   659					reg = <0x8dc 0x10>;
   660				};
   661	
 > 662				comb_rx_imp_p0: usb3-rx-imp@8c8 {
   663					reg = <0x8c8 1>;
   664					bits = <0 5>;
   665				};
   666	
   667				comb_tx_imp_p0: usb3-tx-imp@8c8 {
   668					reg = <0x8c8 2>;
   669					bits = <5 5>;
   670				};
   671	
   672				comb_intr_p0: usb3-intr@8c9 {
   673					reg = <0x8c9 1>;
   674					bits = <2 6>;
   675				};
   676			};
   677	
   678			afe: audio-controller@11210000 {
   679				compatible = "mediatek,mt79xx-audio";
   680				reg = <0 0x11210000 0 0x9000>;
   681				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
   682				clocks = <&infracfg CLK_INFRA_AUD_BUS_CK>,
   683					 <&infracfg CLK_INFRA_AUD_26M_CK>,
   684					 <&infracfg CLK_INFRA_AUD_L_CK>,
   685					 <&infracfg CLK_INFRA_AUD_AUD_CK>,
   686					 <&infracfg CLK_INFRA_AUD_EG2_CK>,
   687					 <&topckgen CLK_TOP_AUD_SEL>;
   688				clock-names = "aud_bus_ck",
   689					      "aud_26m_ck",
   690					      "aud_l_ck",
   691					      "aud_aud_ck",
   692					      "aud_eg2_ck",
   693					      "aud_sel";
   694				assigned-clocks = <&topckgen CLK_TOP_AUD_SEL>,
   695						  <&topckgen CLK_TOP_A1SYS_SEL>,
   696						  <&topckgen CLK_TOP_AUD_L_SEL>,
   697						  <&topckgen CLK_TOP_A_TUNER_SEL>;
   698				assigned-clock-parents = <&topckgen CLK_TOP_CB_APLL2_196M>,
   699							 <&topckgen CLK_TOP_APLL2_D4>,
   700							 <&topckgen CLK_TOP_CB_APLL2_196M>,
   701							 <&topckgen CLK_TOP_APLL2_D4>;
   702				status = "disabled";
   703			};
   704	
 > 705			ice: ice_debug {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
