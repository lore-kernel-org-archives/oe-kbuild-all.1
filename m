Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2228188580
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 21:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732309941; cv=none; b=i+KbbT11aSLwdBebHRDVmEPcQZwzf9NfluuiOI1mU7bY8jVkqqw0Dcbf2bPSR4SIJHA/SYtM/dZxww/GQisT2iDh2QRgGvPfTdhZeefJn8mmt+OmEPUK5uBfvhqqKclEPws5djyeuxICfY29w0R6H5JH6BCrHf8vYVsZODXds6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732309941; c=relaxed/simple;
	bh=LTWBw9/03xJxUNZF7oP9vCQrna7PD/JgEqReKYYdzBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gWCrOuu6SCIe/oJs0K+NFXb6LM20ETrypwQVIKdV96Uxl1/UbFasl0IxXDpRvHF7i47D/Wo3IzhtTqNVyapvLpNrc8rfp6DFXIe6t3+8tLbZOCUiX00AmpTTnI5gG0IsQMW2gFbouHLoaSVoi37YsOYNJ2ku4BpmWSeCw2lfITM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqwL2HFz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqwL2HFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732309939; x=1763845939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LTWBw9/03xJxUNZF7oP9vCQrna7PD/JgEqReKYYdzBE=;
  b=gqwL2HFzxYQZd7hJH/3OKLPlYLsVmZ0xchBsomc/QVXe07sUDg6GI9a8
   5teCkpg3F+qzOzH0vsDnuKC9UHfSLi1VIO/6U/Ux52oHIEcKqpxJeYJ1L
   YPubAySjXTsm3vXfuMoOKlPCC1SksW4ArqAZ2OEa+2xDUTvQHXz4gpkuw
   ZgGS1DihB2wNRXzAmGstewtrw20nQxqO63ZB1TDKIBt7djOhozYoRaKZd
   2GYZzfexJkyln7AxDq4u2d6bYvLHUQsA0uB9PvUQJHQyA3RNFWg2RzfrM
   EsALcno1HKX/8J8mIaeyazEHqUA+I7z5A9Q4cK171zwRI2M5zucA/9FDO
   w==;
X-CSE-ConnectionGUID: ucLujQq2T9yVGNSOgaI5+A==
X-CSE-MsgGUID: swEDoGtUQS+Vj9wRI/BmHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43125443"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="43125443"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 13:12:18 -0800
X-CSE-ConnectionGUID: UT2PAOAsTf+nRw+lwpLPdw==
X-CSE-MsgGUID: l6oVqxh9Sta1nAPgn4mnHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="90674806"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Nov 2024 13:12:17 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEawo-0004DD-10;
	Fri, 22 Nov 2024 21:12:14 +0000
Date: Sat, 23 Nov 2024 05:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-main 32/62]
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1029.23-1050.5: Warning
 (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg
 or ranges property
Message-ID: <202411230513.5JCQKQb6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-main
head:   fc18a51777815a2de7bd2a88e44b3707632980d4
commit: 743b1a5445bb72bba71015a572ca4f3ed35c7573 [32/62] dts: arm64: mediatek: add MT7988A reference board device tree
config: arm64-randconfig-002-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230513.5JCQKQb6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230513.5JCQKQb6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230513.5JCQKQb6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1029.23-1050.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1062.23-1084.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1029.23-1050.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1062.23-1084.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1145.27-1310.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1029.23-1050.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1062.23-1084.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dts:25.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1029.23-1050.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1062.23-1084.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1145.27-1310.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +1029 arch/arm64/boot/dts/mediatek/mt7988a.dtsi

    11	
    12	/ {
    13		compatible = "mediatek,mt7988a";
    14		interrupt-parent = <&gic>;
    15		#address-cells = <2>;
    16		#size-cells = <2>;
    17	
    18		cpus {
    19			#address-cells = <1>;
    20			#size-cells = <0>;
    21	
    22			cpu0: cpu@0 {
    23				compatible = "arm,cortex-a73";
    24				reg = <0x0>;
    25				device_type = "cpu";
    26				enable-method = "psci";
    27				clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
    28					 <&topckgen CLK_TOP_XTAL>;
    29				clock-names = "cpu", "intermediate";
    30				operating-points-v2 = <&cluster0_opp>;
    31				mediatek,cci = <&cci>;
    32			};
    33	
    34			cpu1: cpu@1 {
    35				compatible = "arm,cortex-a73";
    36				reg = <0x1>;
    37				device_type = "cpu";
    38				enable-method = "psci";
    39				clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
    40					 <&topckgen CLK_TOP_XTAL>;
    41				clock-names = "cpu", "intermediate";
    42				operating-points-v2 = <&cluster0_opp>;
    43				mediatek,cci = <&cci>;
    44			};
    45	
    46			cpu2: cpu@2 {
    47				compatible = "arm,cortex-a73";
    48				reg = <0x2>;
    49				device_type = "cpu";
    50				enable-method = "psci";
    51				clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
    52					 <&topckgen CLK_TOP_XTAL>;
    53				clock-names = "cpu", "intermediate";
    54				operating-points-v2 = <&cluster0_opp>;
    55				mediatek,cci = <&cci>;
    56			};
    57	
    58			cpu3: cpu@3 {
    59				compatible = "arm,cortex-a73";
    60				reg = <0x3>;
    61				device_type = "cpu";
    62				enable-method = "psci";
    63				clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
    64					 <&topckgen CLK_TOP_XTAL>;
    65				clock-names = "cpu", "intermediate";
    66				operating-points-v2 = <&cluster0_opp>;
    67				mediatek,cci = <&cci>;
    68			};
    69	
    70			cluster0_opp: opp_table0 {
    71				compatible = "operating-points-v2";
    72				opp-shared;
    73				opp00 {
    74					opp-hz = /bits/ 64 <800000000>;
    75					opp-microvolt = <850000>;
    76				};
    77				opp01 {
    78					opp-hz = /bits/ 64 <1100000000>;
    79					opp-microvolt = <850000>;
    80				};
    81				opp02 {
    82					opp-hz = /bits/ 64 <1500000000>;
    83					opp-microvolt = <850000>;
    84				};
    85				opp03 {
    86					opp-hz = /bits/ 64 <1800000000>;
    87					opp-microvolt = <900000>;
    88				};
    89			};
    90		};
    91	
    92		cci: cci {
    93			compatible = "mediatek,mt7988-cci",
    94				     "mediatek,mt8183-cci";
    95			clocks = <&mcusys CLK_MCU_BUS_DIV_SEL>,
    96				 <&topckgen CLK_TOP_XTAL>;
    97			clock-names = "cci", "intermediate";
    98			operating-points-v2 = <&cci_opp>;
    99		};
   100	
   101		cci_opp: opp_table_cci {
   102			compatible = "operating-points-v2";
   103			opp-shared;
   104			opp00 {
   105				opp-hz = /bits/ 64 <480000000>;
   106				opp-microvolt = <850000>;
   107			};
   108			opp01 {
   109				opp-hz = /bits/ 64 <660000000>;
   110				opp-microvolt = <850000>;
   111			};
   112			opp02 {
   113				opp-hz = /bits/ 64 <900000000>;
   114				opp-microvolt = <850000>;
   115			};
   116			opp03 {
   117				opp-hz = /bits/ 64 <1080000000>;
   118				opp-microvolt = <900000>;
   119			};
   120		};
   121	
   122		fan: pwm-fan {
   123			compatible = "pwm-fan";
   124			/* cooling level (0, 1, 2) : (0% duty, 50% duty, 100% duty) */
   125			cooling-levels = <0 128 255>;
   126			#cooling-cells = <2>;
   127			#thermal-sensor-cells = <1>;
   128			status = "disabled";
   129		};
   130	
   131		oscillator-40m {
   132			compatible = "fixed-clock";
   133			clock-frequency = <40000000>;
   134			#clock-cells = <0>;
   135			clock-output-names = "clkxtal";
   136		};
   137	
   138		pmu {
   139			compatible = "arm,cortex-a73-pmu";
   140			interrupt-parent = <&gic>;
   141			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
   142		};
   143	
   144		psci {
   145			compatible = "arm,psci-0.2";
   146			method = "smc";
   147		};
   148	
   149		reserved-memory {
   150			#address-cells = <2>;
   151			#size-cells = <2>;
   152			ranges;
   153	
   154			/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
   155			secmon_reserved: secmon@43000000 {
   156				reg = <0 0x43000000 0 0x50000>;
   157				no-map;
   158			};
   159		};
   160	
   161		timer {
   162			compatible = "arm,armv8-timer";
   163			interrupt-parent = <&gic>;
   164			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
   165				     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
   166				     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
   167				     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
   168		};
   169	
   170		reg_1p8v: regulator-1p8v {
   171			compatible = "regulator-fixed";
   172			regulator-name = "fixed-1.8V";
   173			regulator-min-microvolt = <1800000>;
   174			regulator-max-microvolt = <1800000>;
   175			regulator-boot-on;
   176			regulator-always-on;
   177		};
   178	
   179		reg_3p3v: regulator-3p3v {
   180			compatible = "regulator-fixed";
   181			regulator-name = "fixed-3.3V";
   182			regulator-min-microvolt = <3300000>;
   183			regulator-max-microvolt = <3300000>;
   184			regulator-boot-on;
   185			regulator-always-on;
   186		};
   187	
   188		thermal-zones {
   189			cpu_thermal: cpu-thermal {
   190				polling-delay-passive = <1000>;
   191				polling-delay = <1000>;
   192				thermal-sensors = <&lvts 0>;
   193				trips {
   194					cpu_trip_crit: crit {
   195						temperature = <125000>;
   196						hysteresis = <2000>;
   197						type = "critical";
   198					};
   199	
   200					cpu_trip_hot: hot {
   201						temperature = <120000>;
   202						hysteresis = <2000>;
   203						type = "hot";
   204					};
   205	
   206					cpu_trip_active_high: active-high {
   207						temperature = <115000>;
   208						hysteresis = <2000>;
   209						type = "active";
   210					};
   211	
   212					cpu_trip_active_med: active-med {
   213						temperature = <85000>;
   214						hysteresis = <2000>;
   215						type = "active";
   216					};
   217	
   218					cpu_trip_active_low: active-low {
   219						temperature = <40000>;
   220						hysteresis = <2000>;
   221						type = "active";
   222					};
   223				};
   224	
   225				cooling-maps {
   226					cpu-active-high {
   227					/* active: set fan to cooling level 2 */
   228						cooling-device = <&fan 3 3>;
   229						trip = <&cpu_trip_active_high>;
   230					};
   231	
   232					cpu-active-low {
   233					/* active: set fan to cooling level 1 */
   234						cooling-device = <&fan 2 2>;
   235						trip = <&cpu_trip_active_med>;
   236					};
   237	
   238					cpu-passive {
   239					/* passive: set fan to cooling level 0 */
   240						cooling-device = <&fan 1 1>;
   241						trip = <&cpu_trip_active_low>;
   242					};
   243				};
   244			};
   245		};
   246	
   247		soc {
   248			compatible = "simple-bus";
   249			ranges;
   250			#address-cells = <2>;
   251			#size-cells = <2>;
   252	
   253			gic: interrupt-controller@c000000 {
   254				compatible = "arm,gic-v3";
   255				reg = <0 0x0c000000 0 0x40000>,  /* GICD */
   256				      <0 0x0c080000 0 0x200000>, /* GICR */
   257				      <0 0x0c400000 0 0x2000>,   /* GICC */
   258				      <0 0x0c410000 0 0x1000>,   /* GICH */
   259				      <0 0x0c420000 0 0x2000>;   /* GICV */
   260				interrupt-parent = <&gic>;
   261				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
   262				interrupt-controller;
   263				#interrupt-cells = <3>;
   264			};
   265	
   266			phyfw: phy-firmware@f000000 {
   267				compatible = "mediatek,2p5gphy-fw";
   268				reg = <0 0x0f000000 0 0x8000>,
   269				      <0 0x0f100000 0 0x20000>,
   270				      <0 0x0f0f0000 0 0x200>;
   271			};
   272	
   273			infracfg: clock-controller@10001000 {
   274				compatible = "mediatek,mt7988-infracfg", "syscon";
   275				reg = <0 0x10001000 0 0x1000>;
   276				#clock-cells = <1>;
   277				#reset-cells = <1>;
   278			};
   279	
   280			topckgen: clock-controller@1001b000 {
   281				compatible = "mediatek,mt7988-topckgen", "syscon";
   282				reg = <0 0x1001b000 0 0x1000>;
   283				#clock-cells = <1>;
   284			};
   285	
   286			watchdog: watchdog@1001c000 {
   287				compatible = "mediatek,mt7988-wdt";
   288				reg = <0 0x1001c000 0 0x1000>;
   289				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
   290				#reset-cells = <1>;
   291			};
   292	
   293			apmixedsys: clock-controller@1001e000 {
   294				compatible = "mediatek,mt7988-apmixedsys";
   295				reg = <0 0x1001e000 0 0x1000>;
   296				#clock-cells = <1>;
   297			};
   298	
   299			pio: pinctrl@1001f000 {
   300				compatible = "mediatek,mt7988-pinctrl", "syscon";
   301				reg = <0 0x1001f000 0 0x1000>,
   302				<0 0x11c10000 0 0x1000>,
   303				<0 0x11d00000 0 0x1000>,
   304				<0 0x11d20000 0 0x1000>,
   305				<0 0x11e00000 0 0x1000>,
   306				<0 0x11f00000 0 0x1000>,
   307				<0 0x1000b000 0 0x1000>;
   308				reg-names = "gpio_base", "iocfg_tr_base",
   309					    "iocfg_br_base", "iocfg_rb_base",
   310					    "iocfg_lb_base", "iocfg_tl_base", "eint";
   311				gpio-controller;
   312				#gpio-cells = <2>;
   313				gpio-ranges = <&pio 0 0 84>;
   314				interrupt-controller;
   315				interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
   316				interrupt-parent = <&gic>;
   317				#interrupt-cells = <2>;
   318	
   319				mdio0_pins: mdio0-pins {
   320					mux {
   321						function = "eth";
   322						groups = "mdc_mdio0";
   323					};
   324	
   325					conf {
   326						groups = "mdc_mdio0";
   327						drive-strength = <MTK_DRIVE_8mA>;
   328					};
   329				};
   330	
   331				i2c0_pins: i2c0-pins-g0 {
   332					mux {
   333						function = "i2c";
   334						groups = "i2c0_1";
   335					};
   336				};
   337	
   338				i2c1_pins: i2c1-pins-g0 {
   339					mux {
   340						function = "i2c";
   341						groups = "i2c1_0";
   342					};
   343				};
   344	
   345				i2c1_sfp_pins: i2c1-sfp-pins-g0 {
   346					mux {
   347						function = "i2c";
   348						groups = "i2c1_sfp";
   349					};
   350				};
   351	
   352				i2c2_pins: i2c2-pins {
   353					mux {
   354						function = "i2c";
   355						groups = "i2c2";
   356					};
   357				};
   358	
   359				i2c2_0_pins: i2c2-pins-g0 {
   360					mux {
   361						function = "i2c";
   362						groups = "i2c2_0";
   363					};
   364				};
   365	
   366				i2c2_1_pins: i2c2-pins-g1 {
   367					mux {
   368						function = "i2c";
   369						groups = "i2c2_1";
   370					};
   371				};
   372	
   373				gbe0_led0_pins: gbe0-led0-pins {
   374					mux {
   375						function = "led";
   376						groups = "gbe0_led0";
   377					};
   378				};
   379	
   380				gbe1_led0_pins: gbe1-led0-pins {
   381					mux {
   382						function = "led";
   383						groups = "gbe1_led0";
   384					};
   385				};
   386	
   387				gbe2_led0_pins: gbe2-led0-pins {
   388					mux {
   389						function = "led";
   390						groups = "gbe2_led0";
   391					};
   392				};
   393	
   394				gbe3_led0_pins: gbe3-led0-pins {
   395					mux {
   396						function = "led";
   397						groups = "gbe3_led0";
   398					};
   399				};
   400	
   401				gbe0_led1_pins: gbe0-led1-pins {
   402					mux {
   403						function = "led";
   404						groups = "gbe0_led1";
   405					};
   406				};
   407	
   408				gbe1_led1_pins: gbe1-led1-pins {
   409					mux {
   410						function = "led";
   411						groups = "gbe1_led1";
   412					};
   413				};
   414	
   415				gbe2_led1_pins: gbe2-led1-pins {
   416					mux {
   417						function = "led";
   418						groups = "gbe2_led1";
   419					};
   420				};
   421	
   422				gbe3_led1_pins: gbe3-led1-pins {
   423					mux {
   424						function = "led";
   425						groups = "gbe3_led1";
   426					};
   427				};
   428	
   429				i2p5gbe_led0_pins: 2p5gbe-led0-pins {
   430					mux {
   431						function = "led";
   432						groups = "2p5gbe_led0";
   433					};
   434				};
   435	
   436				i2p5gbe_led1_pins: 2p5gbe-led1-pins {
   437					mux {
   438						function = "led";
   439						groups = "2p5gbe_led1";
   440					};
   441				};
   442	
   443				mmc0_pins_emmc_45: mmc0-pins-emmc-45 {
   444					mux {
   445						function = "flash";
   446						groups = "emmc_45";
   447					};
   448				};
   449	
   450				mmc0_pins_emmc_51: mmc0-pins-emmc-51 {
   451					mux {
   452						function = "flash";
   453						groups = "emmc_51";
   454					};
   455				};
   456	
   457				mmc0_pins_sdcard: mmc0-pins-sdcard {
   458					mux {
   459						function = "flash";
   460						groups = "sdcard";
   461					};
   462				};
   463	
   464				uart0_pins: uart0-pins {
   465					mux {
   466						function = "uart";
   467						groups =  "uart0";
   468					};
   469				};
   470	
   471				snfi_pins: snfi-pins {
   472					mux {
   473						function = "flash";
   474						groups = "snfi";
   475					};
   476				};
   477	
   478				spi0_pins: spi0-pins {
   479					mux {
   480						function = "spi";
   481						groups = "spi0";
   482					};
   483				};
   484	
   485				spi0_flash_pins: spi0-flash-pins {
   486					mux {
   487						function = "spi";
   488						groups = "spi0", "spi0_wp_hold";
   489					};
   490				};
   491	
   492				spi1_pins: spi1-pins {
   493					mux {
   494						function = "spi";
   495						groups = "spi1";
   496					};
   497				};
   498	
   499				spi2_pins: spi2-pins {
   500					mux {
   501						function = "spi";
   502						groups = "spi2";
   503					};
   504				};
   505	
   506				spi2_flash_pins: spi2-flash-pins {
   507					mux {
   508						function = "spi";
   509						groups = "spi2", "spi2_wp_hold";
   510					};
   511				};
   512	
   513				pcie0_pins: pcie0-pins {
   514					mux {
   515						function = "pcie";
   516						groups = "pcie_2l_0_pereset", "pcie_clk_req_n0_0",
   517							 "pcie_wake_n0_0";
   518					};
   519				};
   520	
   521				pcie1_pins: pcie1-pins {
   522					mux {
   523						function = "pcie";
   524						groups = "pcie_2l_1_pereset", "pcie_clk_req_n1",
   525							 "pcie_wake_n1_0";
   526					};
   527				};
   528	
   529				pcie2_pins: pcie2-pins {
   530					mux {
   531						function = "pcie";
   532						groups = "pcie_1l_0_pereset", "pcie_clk_req_n2_0",
   533							 "pcie_wake_n2_0";
   534					};
   535				};
   536	
   537				pcie3_pins: pcie3-pins {
   538					mux {
   539						function = "pcie";
   540						groups = "pcie_1l_1_pereset", "pcie_clk_req_n3",
   541							 "pcie_wake_n3_0";
   542					};
   543				};
   544			};
   545	
   546			pwm: pwm@10048000 {
   547				compatible = "mediatek,mt7988-pwm";
   548				reg = <0 0x10048000 0 0x1000>;
   549				clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
   550					 <&infracfg CLK_INFRA_66M_PWM_HCK>,
   551					 <&infracfg CLK_INFRA_66M_PWM_CK1>,
   552					 <&infracfg CLK_INFRA_66M_PWM_CK2>,
   553					 <&infracfg CLK_INFRA_66M_PWM_CK3>,
   554					 <&infracfg CLK_INFRA_66M_PWM_CK4>,
   555					 <&infracfg CLK_INFRA_66M_PWM_CK5>,
   556					 <&infracfg CLK_INFRA_66M_PWM_CK6>,
   557					 <&infracfg CLK_INFRA_66M_PWM_CK7>,
   558					 <&infracfg CLK_INFRA_66M_PWM_CK8>;
   559				clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
   560					      "pwm4", "pwm5", "pwm6", "pwm7", "pwm8";
   561				#pwm-cells = <2>;
   562				status = "disabled";
   563			};
   564	
   565			sgmiisys0: syscon@10060000 {
   566				compatible = "mediatek,mt7988-sgmiisys",
   567					     "mediatek,mt7988-sgmiisys0",
   568					     "syscon",
   569					     "simple-mfd";
   570				reg = <0 0x10060000 0 0x1000>;
   571				resets = <&watchdog 1>;
   572				#clock-cells = <1>;
   573	
   574				sgmiipcs0: pcs {
   575					compatible = "mediatek,mt7988-sgmii";
   576					clocks = <&topckgen CLK_TOP_SGM_0_SEL>,
   577						 <&sgmiisys0 CLK_SGM0_TX_EN>,
   578						 <&sgmiisys0 CLK_SGM0_RX_EN>;
   579					clock-names = "sgmii_sel", "sgmii_tx", "sgmii_rx";
   580					phys = <&xfi_tphy0>;
   581					#pcs-cells = <0>;
   582				};
   583			};
   584	
   585			sgmiisys1: syscon@10070000 {
   586				compatible = "mediatek,mt7988-sgmiisys",
   587					     "mediatek,mt7988-sgmiisys1",
   588					     "syscon",
   589					     "simple-mfd";
   590				reg = <0 0x10070000 0 0x1000>;
   591				resets = <&watchdog 2>;
   592				#clock-cells = <1>;
   593	
   594				sgmiipcs1: pcs {
   595					compatible = "mediatek,mt7988-sgmii";
   596					clocks = <&topckgen CLK_TOP_SGM_1_SEL>,
   597						 <&sgmiisys1 CLK_SGM1_TX_EN>,
   598						 <&sgmiisys1 CLK_SGM1_RX_EN>;
   599					clock-names = "sgmii_sel", "sgmii_tx", "sgmii_rx";
   600					phys = <&xfi_tphy1>;
   601					#pcs-cells = <0>;
   602				};
   603			};
   604	
   605			usxgmiisys0: pcs@10080000 {
   606				compatible = "mediatek,mt7988-usxgmiisys";
   607				reg = <0 0x10080000 0 0x1000>;
   608				resets = <&watchdog 12>;
   609				clocks = <&topckgen CLK_TOP_USXGMII_SBUS_0_SEL>;
   610				phys = <&xfi_tphy0>;
   611				#pcs-cells = <0>;
   612			};
   613	
   614			usxgmiisys1: pcs@10081000 {
   615				compatible = "mediatek,mt7988-usxgmiisys";
   616				reg = <0 0x10081000 0 0x1000>;
   617				resets = <&watchdog 13>;
   618				clocks = <&topckgen CLK_TOP_USXGMII_SBUS_1_SEL>;
   619				phys = <&xfi_tphy1>;
   620				#pcs-cells = <0>;
   621			};
   622	
   623			mcusys: mcusys@100e0000 {
   624				compatible = "mediatek,mt7988-mcusys", "syscon";
   625				reg = <0 0x100e0000 0 0x1000>;
   626				#clock-cells = <1>;
   627			};
   628	
   629			uart0: serial@11000000 {
   630				compatible = "mediatek,mt7986-uart",
   631					     "mediatek,mt6577-uart";
   632				reg = <0 0x11000000 0 0x100>;
   633				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
   634				/*
   635				 * 8250-mtk driver don't control "baud" clock since commit
   636				 * e32a83c70cf9 (kernel v5.7), but both "baud" and "bus" clocks
   637				 * still need to be passed to the driver to prevent probe fail
   638				 */
   639				clocks = <&topckgen CLK_TOP_UART_SEL>,
   640					 <&infracfg CLK_INFRA_52M_UART0_CK>;
   641				clock-names = "baud", "bus";
   642				assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
   643						  <&infracfg CLK_INFRA_MUX_UART0_SEL>;
   644				assigned-clock-parents = <&topckgen CLK_TOP_XTAL>,
   645							 <&topckgen CLK_TOP_UART_SEL>;
   646				pinctrl-names = "default";
   647				pinctrl-0 = <&uart0_pins>;
   648				status = "disabled";
   649			};
   650	
   651			snand: spi@11001000 {
   652				compatible = "mediatek,mt7986-snand";
   653				reg = <0 0x11001000 0 0x1000>;
   654				interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
   655				clocks = <&infracfg CLK_INFRA_SPINFI>,
   656					 <&infracfg CLK_INFRA_NFI>,
   657					 <&infracfg CLK_INFRA_66M_NFI_HCK>;
   658				clock-names = "pad_clk", "nfi_clk", "nfi_hclk";
   659				nand-ecc-engine = <&bch>;
   660				mediatek,quad-spi;
   661				#address-cells = <1>;
   662				#size-cells = <0>;
   663				pinctrl-names = "default";
   664				pinctrl-0 = <&snfi_pins>;
   665				status = "disabled";
   666			};
   667	
   668			bch: ecc@11002000 {
   669				compatible = "mediatek,mt7686-ecc";
   670				reg = <0 0x11002000 0 0x1000>;
   671				interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
   672				clocks = <&infracfg CLK_INFRA_NFI>;
   673				clock-names = "nfiecc_clk";
   674				status = "disabled";
   675			};
   676	
   677			i2c0: i2c@11003000 {
   678				compatible = "mediatek,mt7988-i2c",
   679					     "mediatek,mt7981-i2c";
   680				reg = <0 0x11003000 0 0x1000>,
   681				      <0 0x10217080 0 0x80>;
   682				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
   683				clock-div = <1>;
   684				clocks = <&infracfg CLK_INFRA_I2C_BCK>,
   685					 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
   686				clock-names = "main", "dma";
   687				#address-cells = <1>;
   688				#size-cells = <0>;
   689				status = "disabled";
   690			};
   691	
   692			i2c1: i2c@11004000 {
   693				compatible = "mediatek,mt7988-i2c",
   694					     "mediatek,mt7981-i2c";
   695				reg = <0 0x11004000 0 0x1000>,
   696				      <0 0x10217100 0 0x80>;
   697				interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
   698				clock-div = <1>;
   699				clocks = <&infracfg CLK_INFRA_I2C_BCK>,
   700					 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
   701				clock-names = "main", "dma";
   702				#address-cells = <1>;
   703				#size-cells = <0>;
   704				status = "disabled";
   705			};
   706	
   707			i2c2: i2c@11005000 {
   708				compatible = "mediatek,mt7988-i2c",
   709					"mediatek,mt7981-i2c";
   710				reg = <0 0x11005000 0 0x1000>,
   711				      <0 0x10217180 0 0x80>;
   712				interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
   713				clock-div = <1>;
   714				clocks = <&infracfg CLK_INFRA_I2C_BCK>,
   715					 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
   716				clock-names = "main", "dma";
   717				#address-cells = <1>;
   718				#size-cells = <0>;
   719				status = "disabled";
   720			};
   721	
   722			spi0: spi@11007000 {
   723				compatible = "mediatek,ipm-spi-quad", "mediatek,spi-ipm";
   724				reg = <0 0x11007000 0 0x100>;
   725				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
   726				clocks = <&topckgen CLK_TOP_MPLL_D2>,
   727					 <&topckgen CLK_TOP_SPI_SEL>,
   728					 <&infracfg CLK_INFRA_104M_SPI0>,
   729					 <&infracfg CLK_INFRA_66M_SPI0_HCK>;
   730				clock-names = "parent-clk", "sel-clk", "spi-clk",
   731					      "spi-hclk";
   732				#address-cells = <1>;
   733				#size-cells = <0>;
   734				status = "disabled";
   735			};
   736	
   737			spi1: spi@11008000 {
   738				compatible = "mediatek,ipm-spi-single", "mediatek,spi-ipm";
   739				reg = <0 0x11008000 0 0x100>;
   740				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
   741				clocks = <&topckgen CLK_TOP_MPLL_D2>,
   742					 <&topckgen CLK_TOP_SPI_SEL>,
   743					 <&infracfg CLK_INFRA_104M_SPI1>,
   744					 <&infracfg CLK_INFRA_66M_SPI1_HCK>;
   745				clock-names = "parent-clk", "sel-clk", "spi-clk",
   746					      "spi-hclk";
   747				#address-cells = <1>;
   748				#size-cells = <0>;
   749				pinctrl-names = "default";
   750				pinctrl-0 = <&spi1_pins>;
   751				status = "disabled";
   752			};
   753	
   754			spi2: spi@11009000 {
   755				compatible = "mediatek,ipm-spi-quad", "mediatek,spi-ipm";
   756				reg = <0 0x11009000 0 0x100>;
   757				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
   758				clocks = <&topckgen CLK_TOP_MPLL_D2>,
   759					 <&topckgen CLK_TOP_SPI_SEL>,
   760					 <&infracfg CLK_INFRA_104M_SPI2_BCK>,
   761					 <&infracfg CLK_INFRA_66M_SPI2_HCK>;
   762				clock-names = "parent-clk", "sel-clk", "spi-clk",
   763					      "spi-hclk";
   764				#address-cells = <1>;
   765				#size-cells = <0>;
   766				status = "disabled";
   767			};
   768	
   769			lvts: lvts@1100a000 {
   770				compatible = "mediatek,mt7988-lvts-ap";
   771				#thermal-sensor-cells = <1>;
   772				reg = <0 0x1100a000 0 0x1000>;
   773				clocks = <&infracfg CLK_INFRA_26M_THERM_SYSTEM>;
   774				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
   775				resets = <&infracfg MT7988_INFRA_RST1_THERM_CTRL_SWRST>;
   776				nvmem-cells = <&lvts_calibration>;
   777				nvmem-cell-names = "lvts-calib-data-1";
   778			};
   779	
   780			ssusb0: usb@11190000 {
   781				compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
   782				reg = <0 0x11190000 0 0x2e00>,
   783				      <0 0x11193e00 0 0x0100>;
   784				reg-names = "mac", "ippc";
   785				interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
   786				clocks = <&infracfg CLK_INFRA_USB_SYS>,
   787					 <&infracfg CLK_INFRA_USB_XHCI>,
   788					 <&infracfg CLK_INFRA_USB_REF>,
   789					 <&infracfg CLK_INFRA_66M_USB_HCK>,
   790					 <&infracfg CLK_INFRA_133M_USB_HCK>;
   791				clock-names = "sys_ck", "xhci_ck", "ref_ck", "mcu_ck", "dma_ck";
   792				phys = <&xphyu2port0 PHY_TYPE_USB2>,
   793				       <&xphyu3port0 PHY_TYPE_USB3>;
   794				#address-cells = <2>;
   795				#size-cells = <2>;
   796				status = "disabled";
   797			};
   798	
   799			ssusb1: usb@11200000 {
   800				compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
   801				reg = <0 0x11200000 0 0x2e00>,
   802				      <0 0x11203e00 0 0x0100>;
   803				reg-names = "mac", "ippc";
   804				interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
   805				clocks = <&infracfg CLK_INFRA_USB_SYS_CK_P1>,
   806					 <&infracfg CLK_INFRA_USB_XHCI_CK_P1>,
   807					 <&infracfg CLK_INFRA_USB_CK_P1>,
   808					 <&infracfg CLK_INFRA_66M_USB_HCK_CK_P1>,
   809					 <&infracfg CLK_INFRA_133M_USB_HCK_CK_P1>;
   810				clock-names = "sys_ck", "xhci_ck", "ref_ck", "mcu_ck", "dma_ck";
   811				phys = <&tphyu2port0 PHY_TYPE_USB2>,
   812				       <&tphyu3port0 PHY_TYPE_USB3>;
   813				#address-cells = <2>;
   814				#size-cells = <2>;
   815				status = "disabled";
   816			};
   817	
   818			afe: audio-controller@11210000 {
   819				compatible = "mediatek,mt79xx-audio";
   820				reg = <0 0x11210000 0 0x9000>;
   821				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
   822				clocks = <&infracfg CLK_INFRA_66M_AUD_SLV_BCK>,
   823					 <&infracfg CLK_INFRA_AUD_26M>,
   824					 <&infracfg CLK_INFRA_AUD_L>,
   825					 <&infracfg CLK_INFRA_AUD_AUD>,
   826					 <&infracfg CLK_INFRA_AUD_EG2>,
   827					 <&topckgen CLK_TOP_AUD_SEL>,
   828					 <&topckgen CLK_TOP_AUD_I2S_M>;
   829				clock-names = "aud_bus_ck",
   830					      "aud_26m_ck",
   831					      "aud_l_ck",
   832					      "aud_aud_ck",
   833					      "aud_eg2_ck",
   834					      "aud_sel",
   835					      "aud_i2s_m";
   836				assigned-clocks = <&topckgen CLK_TOP_AUD_SEL>,
   837						  <&topckgen CLK_TOP_A1SYS_SEL>,
   838						  <&topckgen CLK_TOP_AUD_L_SEL>,
   839						  <&topckgen CLK_TOP_A_TUNER_SEL>;
   840				assigned-clock-parents = <&apmixedsys CLK_APMIXED_APLL2>,
   841							 <&topckgen CLK_TOP_APLL2_D4>,
   842							 <&apmixedsys CLK_APMIXED_APLL2>,
   843							 <&topckgen CLK_TOP_APLL2_D4>;
   844				status = "disabled";
   845			};
   846	
   847			mmc0: mmc@11230000 {
   848				compatible = "mediatek,mt7986-mmc",
   849					     "mediatek,mt7981-mmc";
   850				reg = <0 0x11230000 0 0x1000>,
   851				      <0 0x11D60000 0 0x1000>;
   852				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
   853				clocks = <&infracfg CLK_INFRA_MSDC400>,
   854					 <&infracfg CLK_INFRA_MSDC2_HCK>,
   855					 <&infracfg CLK_INFRA_66M_MSDC_0_HCK>,
   856					 <&infracfg CLK_INFRA_133M_MSDC_0_HCK>;
   857				assigned-clocks = <&topckgen CLK_TOP_EMMC_250M_SEL>,
   858						  <&topckgen CLK_TOP_EMMC_400M_SEL>;
   859				assigned-clock-parents = <&topckgen CLK_TOP_NET1PLL_D5_D2>,
   860							 <&apmixedsys CLK_APMIXED_MSDCPLL>;
   861				clock-names = "source",
   862					      "hclk",
   863					      "axi_cg",
   864					      "ahb_cg";
   865				#address-cells = <1>;
   866				#size-cells = <0>;
   867				status = "disabled";
   868			};
   869	
   870			pcie2: pcie@11280000 {
   871				compatible = "mediatek,mt7988-pcie",
   872					     "mediatek,mt7986-pcie",
   873					     "mediatek,mt8192-pcie";
   874				device_type = "pci";
   875				#address-cells = <3>;
   876				#size-cells = <2>;
   877				reg = <0 0x11280000 0 0x2000>;
   878				reg-names = "pcie-mac";
   879				linux,pci-domain = <3>;
   880				interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
   881				bus-range = <0x00 0xff>;
   882				ranges = <0x81000000 0x00 0x20000000 0x00
   883					  0x20000000 0x00 0x00200000>,
   884					 <0x82000000 0x00 0x20200000 0x00
   885					  0x20200000 0x00 0x07e00000>;
   886				clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P2>,
   887					 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P2>,
   888					 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P2>,
   889					 <&infracfg CLK_INFRA_133M_PCIE_CK_P2>;
   890				clock-names = "pl_250m", "tl_26m", "peri_26m",
   891					      "top_133m";
   892				pinctrl-names = "default";
   893				pinctrl-0 = <&pcie2_pins>;
   894				status = "disabled";
   895	
   896				phys = <&xphyu3port0 PHY_TYPE_PCIE>;
   897				phy-names = "pcie-phy";
   898	
   899				#interrupt-cells = <1>;
   900				interrupt-map-mask = <0 0 0 0x7>;
   901				interrupt-map = <0 0 0 1 &pcie_intc2 0>,
   902						<0 0 0 2 &pcie_intc2 1>,
   903						<0 0 0 3 &pcie_intc2 2>,
   904						<0 0 0 4 &pcie_intc2 3>;
   905				pcie_intc2: interrupt-controller {
   906					#address-cells = <0>;
   907					#interrupt-cells = <1>;
   908					interrupt-controller;
   909				};
   910			};
   911	
   912			pcie3: pcie@11290000 {
   913				compatible = "mediatek,mt7988-pcie",
   914					     "mediatek,mt7986-pcie",
   915					     "mediatek,mt8192-pcie";
   916				device_type = "pci";
   917				#address-cells = <3>;
   918				#size-cells = <2>;
   919				reg = <0 0x11290000 0 0x2000>;
   920				reg-names = "pcie-mac";
   921				linux,pci-domain = <2>;
   922				interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
   923				bus-range = <0x00 0xff>;
   924				ranges = <0x81000000 0x00 0x28000000 0x00
   925					  0x28000000 0x00 0x00200000>,
   926					 <0x82000000 0x00 0x28200000 0x00
   927					  0x28200000 0x00 0x07e00000>;
   928				clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P3>,
   929					 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P3>,
   930					 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P3>,
   931					 <&infracfg CLK_INFRA_133M_PCIE_CK_P3>;
   932				clock-names = "pl_250m", "tl_26m", "peri_26m",
   933					      "top_133m";
   934				pinctrl-names = "default";
   935				pinctrl-0 = <&pcie3_pins>;
   936				status = "disabled";
   937	
   938				#interrupt-cells = <1>;
   939				interrupt-map-mask = <0 0 0 0x7>;
   940				interrupt-map = <0 0 0 1 &pcie_intc3 0>,
   941						<0 0 0 2 &pcie_intc3 1>,
   942						<0 0 0 3 &pcie_intc3 2>,
   943						<0 0 0 4 &pcie_intc3 3>;
   944				pcie_intc3: interrupt-controller {
   945					#address-cells = <0>;
   946					#interrupt-cells = <1>;
   947					interrupt-controller;
   948				};
   949			};
   950	
   951			pcie0: pcie@11300000 {
   952				compatible = "mediatek,mt7988-pcie",
   953					     "mediatek,mt7986-pcie",
   954					     "mediatek,mt8192-pcie";
   955				device_type = "pci";
   956				#address-cells = <3>;
   957				#size-cells = <2>;
   958				reg = <0 0x11300000 0 0x2000>;
   959				reg-names = "pcie-mac";
   960				linux,pci-domain = <0>;
   961				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
   962				bus-range = <0x00 0xff>;
   963				ranges = <0x81000000 0x00 0x30000000 0x00
   964					  0x30000000 0x00 0x00200000>,
   965					 <0x82000000 0x00 0x30200000 0x00
   966					  0x30200000 0x00 0x07e00000>;
   967				clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P0>,
   968					 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P0>,
   969					 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P0>,
   970					 <&infracfg CLK_INFRA_133M_PCIE_CK_P0>;
   971				clock-names = "pl_250m", "tl_26m", "peri_26m",
   972					      "top_133m";
   973				pinctrl-names = "default";
   974				pinctrl-0 = <&pcie0_pins>;
   975				status = "disabled";
   976	
   977				#interrupt-cells = <1>;
   978				interrupt-map-mask = <0 0 0 0x7>;
   979				interrupt-map = <0 0 0 1 &pcie_intc0 0>,
   980						<0 0 0 2 &pcie_intc0 1>,
   981						<0 0 0 3 &pcie_intc0 2>,
   982						<0 0 0 4 &pcie_intc0 3>;
   983				pcie_intc0: interrupt-controller {
   984					#address-cells = <0>;
   985					#interrupt-cells = <1>;
   986					interrupt-controller;
   987				};
   988			};
   989	
   990			pcie1: pcie@11310000 {
   991				compatible = "mediatek,mt7988-pcie",
   992					     "mediatek,mt7986-pcie",
   993					     "mediatek,mt8192-pcie";
   994				device_type = "pci";
   995				#address-cells = <3>;
   996				#size-cells = <2>;
   997				reg = <0 0x11310000 0 0x2000>;
   998				reg-names = "pcie-mac";
   999				linux,pci-domain = <1>;
  1000				interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
  1001				bus-range = <0x00 0xff>;
  1002				ranges = <0x81000000 0x00 0x38000000 0x00
  1003					  0x38000000 0x00 0x00200000>,
  1004					 <0x82000000 0x00 0x38200000 0x00
  1005					  0x38200000 0x00 0x07e00000>;
  1006				clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P1>,
  1007					 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P1>,
  1008					 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P1>,
  1009					 <&infracfg CLK_INFRA_133M_PCIE_CK_P1>;
  1010				clock-names = "pl_250m", "tl_26m", "peri_26m",
  1011					      "top_133m";
  1012				pinctrl-names = "default";
  1013				pinctrl-0 = <&pcie1_pins>;
  1014				status = "disabled";
  1015	
  1016				#interrupt-cells = <1>;
  1017				interrupt-map-mask = <0 0 0 0x7>;
  1018				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
  1019						<0 0 0 2 &pcie_intc1 1>,
  1020						<0 0 0 3 &pcie_intc1 2>,
  1021						<0 0 0 4 &pcie_intc1 3>;
  1022				pcie_intc1: interrupt-controller {
  1023					#address-cells = <0>;
  1024					#interrupt-cells = <1>;
  1025					interrupt-controller;
  1026				};
  1027			};
  1028	
> 1029			tphy: tphy@11c50000 {
  1030				compatible = "mediatek,mt7988",
  1031					     "mediatek,generic-tphy-v2";
  1032				#address-cells = <2>;
  1033				#size-cells = <2>;
  1034				ranges;
  1035				status = "disabled";
  1036				tphyu2port0: usb-phy@11c50000 {
  1037					reg = <0 0x11c50000 0 0x700>;
  1038					clocks = <&infracfg CLK_INFRA_USB_UTMI_CK_P1>;
  1039					clock-names = "ref";
  1040					#phy-cells = <1>;
  1041				};
  1042				tphyu3port0: usb-phy@11c50700 {
  1043					reg = <0 0x11c50700 0 0x900>;
  1044					clocks = <&infracfg CLK_INFRA_USB_PIPE_CK_P1>;
  1045					clock-names = "ref";
  1046					#phy-cells = <1>;
  1047					mediatek,usb3-pll-ssc-delta;
  1048					mediatek,usb3-pll-ssc-delta1;
  1049				};
  1050			};
  1051	
  1052			topmisc: topmisc@11d10000 {
  1053				compatible = "mediatek,mt7988-topmisc", "syscon",
  1054					     "mediatek,mt7988-power-controller";
  1055				reg = <0 0x11d10000 0 0x10000>;
  1056				#clock-cells = <1>;
  1057				#power-domain-cells = <1>;
  1058				#address-cells = <1>;
  1059				#size-cells = <0>;
  1060			};
  1061	
> 1062			xphy: xphy@11e10000 {
  1063				compatible = "mediatek,mt7988",
  1064					     "mediatek,xsphy";
  1065				#address-cells = <2>;
  1066				#size-cells = <2>;
  1067				ranges;
  1068				status = "disabled";
  1069	
  1070				xphyu2port0: usb-phy@11e10000 {
  1071					reg = <0 0x11e10000 0 0x400>;
  1072					clocks = <&infracfg CLK_INFRA_USB_UTMI>;
  1073					clock-names = "ref";
  1074					#phy-cells = <1>;
  1075				};
  1076	
  1077				xphyu3port0: usb-phy@11e13000 {
  1078					reg = <0 0x11e13400 0 0x500>;
  1079					clocks = <&infracfg CLK_INFRA_USB_PIPE>;
  1080					clock-names = "ref";
  1081					#phy-cells = <1>;
  1082					mediatek,syscon-type = <&topmisc 0x218 0>;
  1083				};
  1084			};
  1085	
  1086			xfi_tphy0: phy@11f20000 {
  1087				compatible = "mediatek,mt7988-xfi-tphy";
  1088				reg = <0 0x11f20000 0 0x10000>;
  1089				resets = <&watchdog 14>;
  1090				clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>, <&topckgen CLK_TOP_XFI_PHY_0_XTAL_SEL>;
  1091				clock-names = "xfipll", "topxtal";
  1092				mediatek,usxgmii-performance-errata;
  1093				#phy-cells = <0>;
  1094			};
  1095	
  1096			xfi_tphy1: phy@11f30000 {
  1097				compatible = "mediatek,mt7988-xfi-tphy";
  1098				reg = <0 0x11f30000 0 0x10000>;
  1099				resets = <&watchdog 15>;
  1100				clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>, <&topckgen CLK_TOP_XFI_PHY_1_XTAL_SEL>;
  1101				clock-names = "xfipll", "topxtal";
  1102				#phy-cells = <0>;
  1103			};
  1104	
  1105			xfi_pll: clock-controller@11f40000 {
  1106				compatible = "mediatek,mt7988-xfi-pll";
  1107				reg = <0 0x11f40000 0 0x1000>;
  1108				resets = <&watchdog 16>;
  1109				#clock-cells = <1>;
  1110			};
  1111	
  1112			efuse: efuse@11f50000 {
  1113				compatible = "mediatek,efuse";
  1114				reg = <0 0x11f50000 0 0x1000>;
  1115				#address-cells = <1>;
  1116				#size-cells = <1>;
  1117	
  1118				cpufreq_calibration: calib@278 {
  1119					reg = <0x278 0x1>;
  1120				};
  1121				lvts_calibration: calib@918 {
  1122					reg = <0x918 0x28>;
  1123				};
  1124				phy_calibration_p0: calib@940 {
  1125					reg = <0x940 0x10>;
  1126				};
  1127				phy_calibration_p1: calib@954 {
  1128					reg = <0x954 0x10>;
  1129				};
  1130				phy_calibration_p2: calib@968 {
  1131					reg = <0x968 0x10>;
  1132				};
  1133				phy_calibration_p3: calib@97c {
  1134					reg = <0x97c 0x10>;
  1135				};
  1136			};
  1137	
  1138			ethsys: clock-controller@15000000 {
  1139				compatible = "mediatek,mt7988-ethsys", "syscon";
  1140				reg = <0 0x15000000 0 0x1000>;
  1141				#clock-cells = <1>;
  1142				#reset-cells = <1>;
  1143			};
  1144	
> 1145			switch: switch@15020000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
