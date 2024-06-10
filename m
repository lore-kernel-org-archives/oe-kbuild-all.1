Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CA086255
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 16:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718037474; cv=none; b=BayxqLP9vhuykEyAH8d2cAK6p4wPbUgUOZ6LZFy56QZqJ7fhb933qmpa3AJ80Tr1vGyIh1RBlg4FUlKUAmTpoehqHGjcZQHadT3mOAEBZsZUNS3GXfcT57bicGya/A5305FO+NxGo3Pzf3idx7DVZoD9ZmqfcBCFX14j0RmyTTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718037474; c=relaxed/simple;
	bh=gGD28lO/d8Ebfz8z+aa5bQ0ntn+GA8HLDpS0447ZkmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mKQ6O8fA/2V9SpACkPywPwGw4YUJYWkiAgU5c7bxuOqxHho8Csa+i2K5dDYIAezALxz1mt9xmyW5I8aqz5kEHl6d0VM0ZUZIWr5kziGOldguDIMG4XzsqTytlz6YUCxOsyVEla4WeaDWIb14AF6zUFTVneCfLIHhPFe4zl+lo6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSoU4EQS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSoU4EQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718037471; x=1749573471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gGD28lO/d8Ebfz8z+aa5bQ0ntn+GA8HLDpS0447ZkmE=;
  b=jSoU4EQSOPXDEbiJua2lM0VDgrl3ezNu1ghyTzFC4+6XXZz8gVJESiEW
   fZPhXU9M/kPTxx6fb5TWDq9zf08k20U/g/loepvH7bxRT1/PAJF5tQdoQ
   AfivKuLG+5hfhr1K2/UBxPzt36q7DNgXOuEtO6Y7GkY9eU6RXRXRmYyuy
   GByyoKptJUL/k/+HJ10fOQ2MnuogEK4j6goQ0shECDaE49/evyJniX+1C
   Tko8j9Q8aB6rxHlqfDmU+64xjNunJuraW9BqcP4UKw7FM1FYz6GSr9W4x
   OhFlWLlRCmGVCApqVCFe7OAFkKMXD88DzfgNWMxQTBxmrcDv7OGuiXXT7
   g==;
X-CSE-ConnectionGUID: tVAWfOBTR3iFlUscXqsdJg==
X-CSE-MsgGUID: ez8cAHZRQYuUQfqBPbZY3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14587599"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14587599"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 09:37:51 -0700
X-CSE-ConnectionGUID: kCeBv1KuSvKJeEsQMJdOEA==
X-CSE-MsgGUID: Iqc3XGmUTx2vRVW9per3zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39791166"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jun 2024 09:37:49 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGi1i-0002Ir-25;
	Mon, 10 Jun 2024 16:37:46 +0000
Date: Tue, 11 Jun 2024 00:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.10-rc 7/27]
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning
 (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
Message-ID: <202406110021.8dy5prTn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-rc
head:   fad325f97e2b1111b0ab5bbee1a0463e79782825
commit: 0449e067da2003c911003d7f6fed6b34952c1607 [7/27] dts: arm64: mediatek: add MT7988A reference board device tree
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240611/202406110021.8dy5prTn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110021.8dy5prTn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406110021.8dy5prTn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1044.23-1066.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1044.23-1066.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1127.27-1288.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1044.23-1066.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dts:25.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1011.23-1032.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1044.23-1066.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1127.27-1288.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +1011 arch/arm64/boot/dts/mediatek/mt7988a.dtsi

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
   549				#pwm-cells = <2>;
   550				clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
   551					 <&infracfg CLK_INFRA_66M_PWM_HCK>,
   552					 <&infracfg CLK_INFRA_66M_PWM_CK1>,
   553					 <&infracfg CLK_INFRA_66M_PWM_CK2>,
   554					 <&infracfg CLK_INFRA_66M_PWM_CK3>,
   555					 <&infracfg CLK_INFRA_66M_PWM_CK4>,
   556					 <&infracfg CLK_INFRA_66M_PWM_CK5>,
   557					 <&infracfg CLK_INFRA_66M_PWM_CK6>,
   558					 <&infracfg CLK_INFRA_66M_PWM_CK7>,
   559					 <&infracfg CLK_INFRA_66M_PWM_CK8>;
   560				clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
   561					      "pwm4","pwm5","pwm6","pwm7","pwm8";
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
   580				};
   581			};
   582	
   583			sgmiisys1: syscon@10070000 {
   584				compatible = "mediatek,mt7988-sgmiisys",
   585					     "mediatek,mt7988-sgmiisys1",
   586					     "syscon",
   587					     "simple-mfd";
   588				reg = <0 0x10070000 0 0x1000>;
   589				resets = <&watchdog 2>;
   590				#clock-cells = <1>;
   591	
   592				sgmiipcs1: pcs {
   593					compatible = "mediatek,mt7988-sgmii";
   594					clocks = <&topckgen CLK_TOP_SGM_1_SEL>,
   595						 <&sgmiisys1 CLK_SGM1_TX_EN>,
   596						 <&sgmiisys1 CLK_SGM1_RX_EN>;
   597					clock-names = "sgmii_sel", "sgmii_tx", "sgmii_rx";
   598				};
   599			};
   600	
   601			usxgmiisys0: pcs@10080000 {
   602				compatible = "mediatek,mt7988-usxgmiisys";
   603				reg = <0 0x10080000 0 0x1000>;
   604				resets = <&watchdog 12>;
   605				clocks = <&topckgen CLK_TOP_USXGMII_SBUS_0_SEL>;
   606			};
   607	
   608			usxgmiisys1: pcs@10081000 {
   609				compatible = "mediatek,mt7988-usxgmiisys";
   610				reg = <0 0x10081000 0 0x1000>;
   611				resets = <&watchdog 13>;
   612				clocks = <&topckgen CLK_TOP_USXGMII_SBUS_1_SEL>;
   613			};
   614	
   615			mcusys: mcusys@100e0000 {
   616				compatible = "mediatek,mt7988-mcusys", "syscon";
   617				reg = <0 0x100e0000 0 0x1000>;
   618				#clock-cells = <1>;
   619			};
   620	
   621			uart0: serial@11000000 {
   622				compatible = "mediatek,mt7986-uart",
   623					     "mediatek,mt6577-uart";
   624				reg = <0 0x11000000 0 0x100>;
   625				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
   626				/*
   627				 * 8250-mtk driver don't control "baud" clock since commit
   628				 * e32a83c70cf9 (kernel v5.7), but both "baud" and "bus" clocks
   629				 * still need to be passed to the driver to prevent probe fail
   630				 */
   631				clocks = <&topckgen CLK_TOP_UART_SEL>,
   632					 <&infracfg CLK_INFRA_52M_UART0_CK>;
   633				clock-names = "baud", "bus";
   634				assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
   635						  <&infracfg CLK_INFRA_MUX_UART0_SEL>;
   636				assigned-clock-parents = <&topckgen CLK_TOP_XTAL>,
   637							 <&topckgen CLK_TOP_UART_SEL>;
   638				pinctrl-names = "default";
   639				pinctrl-0 = <&uart0_pins>;
   640				status = "disabled";
   641			};
   642	
   643			snand: spi@11001000 {
   644				compatible = "mediatek,mt7986-snand";
   645				reg = <0 0x11001000 0 0x1000>;
   646				interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
   647				clocks = <&infracfg CLK_INFRA_SPINFI>,
   648					 <&infracfg CLK_INFRA_NFI>,
   649					 <&infracfg CLK_INFRA_66M_NFI_HCK>;
   650				clock-names = "pad_clk", "nfi_clk", "nfi_hclk";
   651				nand-ecc-engine = <&bch>;
   652				mediatek,quad-spi;
   653				#address-cells = <1>;
   654				#size-cells = <0>;
   655				pinctrl-names = "default";
   656				pinctrl-0 = <&snfi_pins>;
   657				status = "disabled";
   658			};
   659	
   660			bch: ecc@11002000 {
   661				compatible = "mediatek,mt7686-ecc";
   662				reg = <0 0x11002000 0 0x1000>;
   663				interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
   664				clocks = <&infracfg CLK_INFRA_NFI>;
   665				clock-names = "nfiecc_clk";
   666				status = "disabled";
   667			};
   668	
   669			i2c0: i2c@11003000 {
   670				compatible = "mediatek,mt7988-i2c",
   671					     "mediatek,mt7981-i2c";
   672				reg = <0 0x11003000 0 0x1000>,
   673				      <0 0x10217080 0 0x80>;
   674				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
   675				clock-div = <1>;
   676				clocks = <&infracfg CLK_INFRA_I2C_BCK>,
   677					 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
   678				clock-names = "main", "dma";
   679				#address-cells = <1>;
   680				#size-cells = <0>;
   681				status = "disabled";
   682			};
   683	
   684			i2c1: i2c@11004000 {
   685				compatible = "mediatek,mt7988-i2c",
   686					     "mediatek,mt7981-i2c";
   687				reg = <0 0x11004000 0 0x1000>,
   688				      <0 0x10217100 0 0x80>;
   689				interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
   690				clock-div = <1>;
   691				clocks = <&infracfg CLK_INFRA_I2C_BCK>,
   692					 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
   693				clock-names = "main", "dma";
   694				#address-cells = <1>;
   695				#size-cells = <0>;
   696				status = "disabled";
   697			};
   698	
   699			i2c2: i2c@11005000 {
   700				compatible = "mediatek,mt7988-i2c",
   701					"mediatek,mt7981-i2c";
   702				reg = <0 0x11005000 0 0x1000>,
   703				      <0 0x10217180 0 0x80>;
   704				interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
   705				clock-div = <1>;
   706				clocks = <&infracfg CLK_INFRA_I2C_BCK>,
   707					 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
   708				clock-names = "main", "dma";
   709				#address-cells = <1>;
   710				#size-cells = <0>;
   711				status = "disabled";
   712			};
   713	
   714			spi0: spi@11007000 {
   715				compatible = "mediatek,ipm-spi-quad", "mediatek,spi-ipm";
   716				reg = <0 0x11007000 0 0x100>;
   717				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
   718				clocks = <&topckgen CLK_TOP_MPLL_D2>,
   719					 <&topckgen CLK_TOP_SPI_SEL>,
   720					 <&infracfg CLK_INFRA_104M_SPI0>,
   721					 <&infracfg CLK_INFRA_66M_SPI0_HCK>;
   722				clock-names = "parent-clk", "sel-clk", "spi-clk",
   723					      "spi-hclk";
   724				#address-cells = <1>;
   725				#size-cells = <0>;
   726				status = "disabled";
   727			};
   728	
   729			spi1: spi@11008000 {
   730				compatible = "mediatek,ipm-spi-single", "mediatek,spi-ipm";
   731				reg = <0 0x11008000 0 0x100>;
   732				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
   733				clocks = <&topckgen CLK_TOP_MPLL_D2>,
   734					 <&topckgen CLK_TOP_SPI_SEL>,
   735					 <&infracfg CLK_INFRA_104M_SPI1>,
   736					 <&infracfg CLK_INFRA_66M_SPI1_HCK>;
   737				clock-names = "parent-clk", "sel-clk", "spi-clk",
   738					      "spi-hclk";
   739				#address-cells = <1>;
   740				#size-cells = <0>;
   741				pinctrl-names = "default";
   742				pinctrl-0 = <&spi1_pins>;
   743				status = "disabled";
   744			};
   745	
   746			spi2: spi@11009000 {
   747				compatible = "mediatek,ipm-spi-quad", "mediatek,spi-ipm";
   748				reg = <0 0x11009000 0 0x100>;
   749				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
   750				clocks = <&topckgen CLK_TOP_MPLL_D2>,
   751					 <&topckgen CLK_TOP_SPI_SEL>,
   752					 <&infracfg CLK_INFRA_104M_SPI2_BCK>,
   753					 <&infracfg CLK_INFRA_66M_SPI2_HCK>;
   754				clock-names = "parent-clk", "sel-clk", "spi-clk",
   755					      "spi-hclk";
   756				#address-cells = <1>;
   757				#size-cells = <0>;
   758				status = "disabled";
   759			};
   760	
   761			lvts: lvts@1100a000 {
   762				compatible = "mediatek,mt7988-lvts-ap";
   763				#thermal-sensor-cells = <1>;
   764				reg = <0 0x1100a000 0 0x1000>;
   765				clocks = <&infracfg CLK_INFRA_26M_THERM_SYSTEM>;
   766				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
   767				resets = <&infracfg MT7988_INFRA_RST1_THERM_CTRL_SWRST>;
   768				nvmem-cells = <&lvts_calibration>;
   769				nvmem-cell-names = "lvts-calib-data-1";
   770			};
   771	
   772			ssusb0: usb@11190000 {
   773				compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
   774				reg = <0 0x11190000 0 0x2e00>,
   775				      <0 0x11193e00 0 0x0100>;
   776				reg-names = "mac", "ippc";
   777				interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
   778				clocks = <&infracfg CLK_INFRA_USB_SYS>,
   779					 <&infracfg CLK_INFRA_USB_REF>,
   780					 <&infracfg CLK_INFRA_66M_USB_HCK>,
   781					 <&infracfg CLK_INFRA_133M_USB_HCK>,
   782					 <&infracfg CLK_INFRA_USB_XHCI>;
   783				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
   784			};
   785	
   786			ssusb1: usb@11200000 {
   787				compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
   788				reg = <0 0x11200000 0 0x2e00>,
   789				      <0 0x11203e00 0 0x0100>;
   790				reg-names = "mac", "ippc";
   791				interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
   792				clocks = <&infracfg CLK_INFRA_USB_SYS_CK_P1>,
   793					 <&infracfg CLK_INFRA_USB_CK_P1>,
   794					 <&infracfg CLK_INFRA_66M_USB_HCK_CK_P1>,
   795					 <&infracfg CLK_INFRA_133M_USB_HCK_CK_P1>,
   796					 <&infracfg CLK_INFRA_USB_XHCI_CK_P1>;
   797				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
   798			};
   799	
   800			afe: audio-controller@11210000 {
   801				compatible = "mediatek,mt79xx-audio";
   802				reg = <0 0x11210000 0 0x9000>;
   803				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
   804				clocks = <&infracfg CLK_INFRA_66M_AUD_SLV_BCK>,
   805					 <&infracfg CLK_INFRA_AUD_26M>,
   806					 <&infracfg CLK_INFRA_AUD_L>,
   807					 <&infracfg CLK_INFRA_AUD_AUD>,
   808					 <&infracfg CLK_INFRA_AUD_EG2>,
   809					 <&topckgen CLK_TOP_AUD_SEL>,
   810					 <&topckgen CLK_TOP_AUD_I2S_M>;
   811				clock-names = "aud_bus_ck",
   812					      "aud_26m_ck",
   813					      "aud_l_ck",
   814					      "aud_aud_ck",
   815					      "aud_eg2_ck",
   816					      "aud_sel",
   817					      "aud_i2s_m";
   818				assigned-clocks = <&topckgen CLK_TOP_AUD_SEL>,
   819						  <&topckgen CLK_TOP_A1SYS_SEL>,
   820						  <&topckgen CLK_TOP_AUD_L_SEL>,
   821						  <&topckgen CLK_TOP_A_TUNER_SEL>;
   822				assigned-clock-parents = <&apmixedsys CLK_APMIXED_APLL2>,
   823							 <&topckgen CLK_TOP_APLL2_D4>,
   824							 <&apmixedsys CLK_APMIXED_APLL2>,
   825							 <&topckgen CLK_TOP_APLL2_D4>;
   826				status = "disabled";
   827			};
   828	
   829			mmc0: mmc@11230000 {
   830				compatible = "mediatek,mt7986-mmc",
   831					     "mediatek,mt7981-mmc";
   832				reg = <0 0x11230000 0 0x1000>,
   833				      <0 0x11D60000 0 0x1000>;
   834				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
   835				clocks = <&infracfg CLK_INFRA_MSDC400>,
   836					 <&infracfg CLK_INFRA_MSDC2_HCK>,
   837					 <&infracfg CLK_INFRA_66M_MSDC_0_HCK>,
   838					 <&infracfg CLK_INFRA_133M_MSDC_0_HCK>;
   839				assigned-clocks = <&topckgen CLK_TOP_EMMC_250M_SEL>,
   840						  <&topckgen CLK_TOP_EMMC_400M_SEL>;
   841				assigned-clock-parents = <&topckgen CLK_TOP_NET1PLL_D5_D2>,
   842							 <&apmixedsys CLK_APMIXED_MSDCPLL>;
   843				clock-names = "source",
   844					      "hclk",
   845					      "axi_cg",
   846					      "ahb_cg";
   847				#address-cells = <1>;
   848				#size-cells = <0>;
   849				status = "disabled";
   850			};
   851	
   852			pcie2: pcie@11280000 {
   853				compatible = "mediatek,mt7988-pcie",
   854					     "mediatek,mt7986-pcie",
   855					     "mediatek,mt8192-pcie";
   856				device_type = "pci";
   857				#address-cells = <3>;
   858				#size-cells = <2>;
   859				reg = <0 0x11280000 0 0x2000>;
   860				reg-names = "pcie-mac";
   861				linux,pci-domain = <3>;
   862				interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
   863				bus-range = <0x00 0xff>;
   864				ranges = <0x81000000 0x00 0x20000000 0x00
   865					  0x20000000 0x00 0x00200000>,
   866					 <0x82000000 0x00 0x20200000 0x00
   867					  0x20200000 0x00 0x07e00000>;
   868				clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P2>,
   869					 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P2>,
   870					 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P2>,
   871					 <&infracfg CLK_INFRA_133M_PCIE_CK_P2>;
   872				clock-names = "pl_250m", "tl_26m", "peri_26m",
   873					      "top_133m";
   874				pinctrl-names = "default";
   875				pinctrl-0 = <&pcie2_pins>;
   876				status = "disabled";
   877	
   878				phys = <&xphyu3port0 PHY_TYPE_PCIE>;
   879				phy-names = "pcie-phy";
   880	
   881				#interrupt-cells = <1>;
   882				interrupt-map-mask = <0 0 0 0x7>;
   883				interrupt-map = <0 0 0 1 &pcie_intc2 0>,
   884						<0 0 0 2 &pcie_intc2 1>,
   885						<0 0 0 3 &pcie_intc2 2>,
   886						<0 0 0 4 &pcie_intc2 3>;
   887				pcie_intc2: interrupt-controller {
   888					#address-cells = <0>;
   889					#interrupt-cells = <1>;
   890					interrupt-controller;
   891				};
   892			};
   893	
   894			pcie3: pcie@11290000 {
   895				compatible = "mediatek,mt7988-pcie",
   896					     "mediatek,mt7986-pcie",
   897					     "mediatek,mt8192-pcie";
   898				device_type = "pci";
   899				#address-cells = <3>;
   900				#size-cells = <2>;
   901				reg = <0 0x11290000 0 0x2000>;
   902				reg-names = "pcie-mac";
   903				linux,pci-domain = <2>;
   904				interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
   905				bus-range = <0x00 0xff>;
   906				ranges = <0x81000000 0x00 0x28000000 0x00
   907					  0x28000000 0x00 0x00200000>,
   908					 <0x82000000 0x00 0x28200000 0x00
   909					  0x28200000 0x00 0x07e00000>;
   910				clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P3>,
   911					 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P3>,
   912					 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P3>,
   913					 <&infracfg CLK_INFRA_133M_PCIE_CK_P3>;
   914				clock-names = "pl_250m", "tl_26m", "peri_26m",
   915					      "top_133m";
   916				pinctrl-names = "default";
   917				pinctrl-0 = <&pcie3_pins>;
   918				status = "disabled";
   919	
   920				#interrupt-cells = <1>;
   921				interrupt-map-mask = <0 0 0 0x7>;
   922				interrupt-map = <0 0 0 1 &pcie_intc3 0>,
   923						<0 0 0 2 &pcie_intc3 1>,
   924						<0 0 0 3 &pcie_intc3 2>,
   925						<0 0 0 4 &pcie_intc3 3>;
   926				pcie_intc3: interrupt-controller {
   927					#address-cells = <0>;
   928					#interrupt-cells = <1>;
   929					interrupt-controller;
   930				};
   931			};
   932	
   933			pcie0: pcie@11300000 {
   934				compatible = "mediatek,mt7988-pcie",
   935					     "mediatek,mt7986-pcie",
   936					     "mediatek,mt8192-pcie";
   937				device_type = "pci";
   938				#address-cells = <3>;
   939				#size-cells = <2>;
   940				reg = <0 0x11300000 0 0x2000>;
   941				reg-names = "pcie-mac";
   942				linux,pci-domain = <0>;
   943				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
   944				bus-range = <0x00 0xff>;
   945				ranges = <0x81000000 0x00 0x30000000 0x00
   946					  0x30000000 0x00 0x00200000>,
   947					 <0x82000000 0x00 0x30200000 0x00
   948					  0x30200000 0x00 0x07e00000>;
   949				clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P0>,
   950					 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P0>,
   951					 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P0>,
   952					 <&infracfg CLK_INFRA_133M_PCIE_CK_P0>;
   953				clock-names = "pl_250m", "tl_26m", "peri_26m",
   954					      "top_133m";
   955				pinctrl-names = "default";
   956				pinctrl-0 = <&pcie0_pins>;
   957				status = "disabled";
   958	
   959				#interrupt-cells = <1>;
   960				interrupt-map-mask = <0 0 0 0x7>;
   961				interrupt-map = <0 0 0 1 &pcie_intc0 0>,
   962						<0 0 0 2 &pcie_intc0 1>,
   963						<0 0 0 3 &pcie_intc0 2>,
   964						<0 0 0 4 &pcie_intc0 3>;
   965				pcie_intc0: interrupt-controller {
   966					#address-cells = <0>;
   967					#interrupt-cells = <1>;
   968					interrupt-controller;
   969				};
   970			};
   971	
   972			pcie1: pcie@11310000 {
   973				compatible = "mediatek,mt7988-pcie",
   974					     "mediatek,mt7986-pcie",
   975					     "mediatek,mt8192-pcie";
   976				device_type = "pci";
   977				#address-cells = <3>;
   978				#size-cells = <2>;
   979				reg = <0 0x11310000 0 0x2000>;
   980				reg-names = "pcie-mac";
   981				linux,pci-domain = <1>;
   982				interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
   983				bus-range = <0x00 0xff>;
   984				ranges = <0x81000000 0x00 0x38000000 0x00
   985					  0x38000000 0x00 0x00200000>,
   986					 <0x82000000 0x00 0x38200000 0x00
   987					  0x38200000 0x00 0x07e00000>;
   988				clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P1>,
   989					 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P1>,
   990					 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P1>,
   991					 <&infracfg CLK_INFRA_133M_PCIE_CK_P1>;
   992				clock-names = "pl_250m", "tl_26m", "peri_26m",
   993					      "top_133m";
   994				pinctrl-names = "default";
   995				pinctrl-0 = <&pcie1_pins>;
   996				status = "disabled";
   997	
   998				#interrupt-cells = <1>;
   999				interrupt-map-mask = <0 0 0 0x7>;
  1000				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
  1001						<0 0 0 2 &pcie_intc1 1>,
  1002						<0 0 0 3 &pcie_intc1 2>,
  1003						<0 0 0 4 &pcie_intc1 3>;
  1004				pcie_intc1: interrupt-controller {
  1005					#address-cells = <0>;
  1006					#interrupt-cells = <1>;
  1007					interrupt-controller;
  1008				};
  1009			};
  1010	
> 1011			tphy: tphy@11c50000 {
  1012				compatible = "mediatek,mt7988",
  1013					     "mediatek,generic-tphy-v2";
  1014				#address-cells = <2>;
  1015				#size-cells = <2>;
  1016				ranges;
  1017				status = "disabled";
  1018				tphyu2port0: usb-phy@11c50000 {
  1019					reg = <0 0x11c50000 0 0x700>;
  1020					clocks = <&infracfg CLK_INFRA_USB_UTMI_CK_P1>;
  1021					clock-names = "ref";
  1022					#phy-cells = <1>;
  1023				};
  1024				tphyu3port0: usb-phy@11c50700 {
  1025					reg = <0 0x11c50700 0 0x900>;
  1026					clocks = <&infracfg CLK_INFRA_USB_PIPE_CK_P1>;
  1027					clock-names = "ref";
  1028					#phy-cells = <1>;
  1029					mediatek,usb3-pll-ssc-delta;
  1030					mediatek,usb3-pll-ssc-delta1;
  1031				};
  1032			};
  1033	
  1034			topmisc: topmisc@11d10000 {
  1035				compatible = "mediatek,mt7988-topmisc", "syscon",
  1036					     "mediatek,mt7988-power-controller";
  1037				reg = <0 0x11d10000 0 0x10000>;
  1038				#clock-cells = <1>;
  1039				#power-domain-cells = <1>;
  1040				#address-cells = <1>;
  1041				#size-cells = <0>;
  1042			};
  1043	
> 1044			xphy: xphy@11e10000 {
  1045				compatible = "mediatek,mt7988",
  1046					     "mediatek,xsphy";
  1047				#address-cells = <2>;
  1048				#size-cells = <2>;
  1049				ranges;
  1050				status = "disabled";
  1051	
  1052				xphyu2port0: usb-phy@11e10000 {
  1053					reg = <0 0x11e10000 0 0x400>;
  1054					clocks = <&infracfg CLK_INFRA_USB_UTMI>;
  1055					clock-names = "ref";
  1056					#phy-cells = <1>;
  1057				};
  1058	
  1059				xphyu3port0: usb-phy@11e13000 {
  1060					reg = <0 0x11e13400 0 0x500>;
  1061					clocks = <&infracfg CLK_INFRA_USB_PIPE>;
  1062					clock-names = "ref";
  1063					#phy-cells = <1>;
  1064					mediatek,syscon-type = <&topmisc 0x218 0>;
  1065				};
  1066			};
  1067	
  1068			xfi_tphy0: phy@11f20000 {
  1069				compatible = "mediatek,mt7988-xfi-tphy";
  1070				reg = <0 0x11f20000 0 0x10000>;
  1071				resets = <&watchdog 14>;
  1072				clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>, <&topckgen CLK_TOP_XFI_PHY_0_XTAL_SEL>;
  1073				clock-names = "xfipll", "topxtal";
  1074				mediatek,usxgmii-performance-errata;
  1075				#phy-cells = <0>;
  1076			};
  1077	
  1078			xfi_tphy1: phy@11f30000 {
  1079				compatible = "mediatek,mt7988-xfi-tphy";
  1080				reg = <0 0x11f30000 0 0x10000>;
  1081				resets = <&watchdog 15>;
  1082				clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>, <&topckgen CLK_TOP_XFI_PHY_1_XTAL_SEL>;
  1083				clock-names = "xfipll", "topxtal";
  1084				#phy-cells = <0>;
  1085			};
  1086	
  1087			xfi_pll: clock-controller@11f40000 {
  1088				compatible = "mediatek,mt7988-xfi-pll";
  1089				reg = <0 0x11f40000 0 0x1000>;
  1090				resets = <&watchdog 16>;
  1091				#clock-cells = <1>;
  1092			};
  1093	
  1094			efuse: efuse@11f50000 {
  1095				compatible = "mediatek,efuse";
  1096				reg = <0 0x11f50000 0 0x1000>;
  1097				#address-cells = <1>;
  1098				#size-cells = <1>;
  1099	
  1100				cpufreq_calibration: calib@278 {
  1101					reg = <0x278 0x1>;
  1102				};
  1103				lvts_calibration: calib@918 {
  1104					reg = <0x918 0x28>;
  1105				};
  1106				phy_calibration_p0: calib@940 {
  1107					reg = <0x940 0x10>;
  1108				};
  1109				phy_calibration_p1: calib@954 {
  1110					reg = <0x954 0x10>;
  1111				};
  1112				phy_calibration_p2: calib@968 {
  1113					reg = <0x968 0x10>;
  1114				};
  1115				phy_calibration_p3: calib@97c {
  1116					reg = <0x97c 0x10>;
  1117				};
  1118			};
  1119	
  1120			ethsys: clock-controller@15000000 {
  1121				compatible = "mediatek,mt7988-ethsys", "syscon";
  1122				reg = <0 0x15000000 0 0x1000>;
  1123				#clock-cells = <1>;
  1124				#reset-cells = <1>;
  1125			};
  1126	
> 1127			switch: switch@15020000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
