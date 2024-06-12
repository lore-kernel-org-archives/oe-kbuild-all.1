Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB2F10F2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 01:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718154439; cv=none; b=ZWeSc4BD+Up9uYsWgma6HeIc/Zp0rWAAu+YlWE6iuY0ahD4fWDYrU2xP9L5HYKkElplR5Fkd6aPosYCTkDJblyMIapiOnhCeOfNLPJdp4U1TTDANOOT5H+x5G7iGUarD1Pc7/4u44zs47WPePGjq0b16jodQy0MBVxNTDj56Euk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718154439; c=relaxed/simple;
	bh=f7EzAQJ1FvkxfagVR67LjhnHWC3k4oJgfIIhQV6KAWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ocvyJbBLnb1rjDqdmC8UdQqdQbIlJzV82KyjWlpylEVQRjLuU1b8i8Xz3tkJznsJlITTXESC/hfQYL+UKs8nzRc8e/I2eYwOBR1ado0QJYEwEc3gIM+mIPKojgHBMutVDtCeLbzLk3xQeepkdlR4ISfP6y+7NZUc2QxW2OKqH/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/iuVfqn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/iuVfqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718154437; x=1749690437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f7EzAQJ1FvkxfagVR67LjhnHWC3k4oJgfIIhQV6KAWY=;
  b=W/iuVfqnden6qRkKVX6lIhg6f4RJu/FNsW0Z4OsPR4jj2RC9RpDGGeIN
   0RWLvkYKwfI+8SGg4zL7qdQxtGdObT3HtYvBTY4nGH4hqGQhU5ENglVUz
   rWm7Yt/mmMT9H3j/o+8/eOo0VStUokdUOFQJZ4T/URBH2aAXIckqnuae6
   U+ZObz6mU8B9Gi72EdStMe/w5zeZeIPTOECG4ouAZaBy3Dw/k+qNnyJD1
   k8aeG9PyXROV+iJPjNbC2CQgMzMQLkKJp7ndIKCrcejzHX7gaFouDorZO
   RGc3g0jsYnYmE4uS6JwWa8cBZ3E08pvtB3b0HvseOTjflgrOwF2aacT7Z
   w==;
X-CSE-ConnectionGUID: OqAK7YHAQ2+H2bjl0wSXUg==
X-CSE-MsgGUID: A1ydlC6dS66nUcHWk+y2+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37422217"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="37422217"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 18:07:16 -0700
X-CSE-ConnectionGUID: bdKIOa/1QSOxXcxcudwQxA==
X-CSE-MsgGUID: 6FQXYL7nSKeqC8dykigOeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="39481213"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2024 18:07:14 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHCSG-00012o-1T;
	Wed, 12 Jun 2024 01:07:12 +0000
Date: Wed, 12 Jun 2024 09:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 675/30000]
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi:370.10-375.5: Warning
 (simple_bus_reg): /soc/reboot: missing or empty reg/ranges property
Message-ID: <202406120829.wOgHVNWx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   73b793dd7d4876d09ef0e420c145fab7782f199c
commit: 6defa0d59d34ffcf3d002d01599d106750eb5137 [675/30000] ANDROID: arm64: dts: hi3660: adb reboot node
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240612/202406120829.wOgHVNWx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120829.wOgHVNWx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120829.wOgHVNWx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1150.30-1154.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1156.27-1160.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@1: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:60.13-65.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:211.19-220.4: Warning (unit_address_vs_reg): /hi3660_i2s: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:345.31-349.5: Warning (simple_bus_reg): /soc/crg_rst_controller: missing or empty reg/ranges property
>> arch/arm64/boot/dts/hisilicon/hi3660.dtsi:370.10-375.5: Warning (simple_bus_reg): /soc/reboot: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:384.20-388.5: Warning (simple_bus_reg): /soc/reset: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1139.17-1182.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi:299.10-333.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi:390.14-422.5: Warning (simple_bus_reg): /soc/replicator: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi:12.21-14.5: Warning (simple_bus_reg): /soc/gpio-range: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660-drm.dtsi:94.12-112.6: Warning (avoid_unnecessary_addr_size): /dsi@E8601000/panel@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi:351.13-362.6: Warning (graph_child_address): /soc/funnel@ec031000/in-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +370 arch/arm64/boot/dts/hisilicon/hi3660.dtsi

    11	
    12	/ {
    13		compatible = "hisilicon,hi3660";
    14		interrupt-parent = <&gic>;
    15		#address-cells = <2>;
    16		#size-cells = <2>;
    17	
    18		psci {
    19			compatible = "arm,psci-0.2";
    20			method = "smc";
    21		};
    22	
    23		cpus {
    24			#address-cells = <2>;
    25			#size-cells = <0>;
    26	
    27			cpu-map {
    28				cluster0 {
    29					core0 {
    30						cpu = <&cpu0>;
    31					};
    32					core1 {
    33						cpu = <&cpu1>;
    34					};
    35					core2 {
    36						cpu = <&cpu2>;
    37					};
    38					core3 {
    39						cpu = <&cpu3>;
    40					};
    41				};
    42				cluster1 {
    43					core0 {
    44						cpu = <&cpu4>;
    45					};
    46					core1 {
    47						cpu = <&cpu5>;
    48					};
    49					core2 {
    50						cpu = <&cpu6>;
    51					};
    52					core3 {
    53						cpu = <&cpu7>;
    54					};
    55				};
    56			};
    57	
    58			cpu0: cpu@0 {
    59				compatible = "arm,cortex-a53";
    60				device_type = "cpu";
    61				reg = <0x0 0x0>;
    62				enable-method = "psci";
    63				next-level-cache = <&A53_L2>;
    64				cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
    65				capacity-dmips-mhz = <592>;
    66				clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER0>;
    67				operating-points-v2 = <&cluster0_opp>;
    68				#cooling-cells = <2>;
    69				dynamic-power-coefficient = <110>;
    70			};
    71	
    72			cpu1: cpu@1 {
    73				compatible = "arm,cortex-a53";
    74				device_type = "cpu";
    75				reg = <0x0 0x1>;
    76				enable-method = "psci";
    77				next-level-cache = <&A53_L2>;
    78				cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
    79				capacity-dmips-mhz = <592>;
    80				clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER0>;
    81				operating-points-v2 = <&cluster0_opp>;
    82				#cooling-cells = <2>;
    83			};
    84	
    85			cpu2: cpu@2 {
    86				compatible = "arm,cortex-a53";
    87				device_type = "cpu";
    88				reg = <0x0 0x2>;
    89				enable-method = "psci";
    90				next-level-cache = <&A53_L2>;
    91				cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
    92				capacity-dmips-mhz = <592>;
    93				clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER0>;
    94				operating-points-v2 = <&cluster0_opp>;
    95				#cooling-cells = <2>;
    96			};
    97	
    98			cpu3: cpu@3 {
    99				compatible = "arm,cortex-a53";
   100				device_type = "cpu";
   101				reg = <0x0 0x3>;
   102				enable-method = "psci";
   103				next-level-cache = <&A53_L2>;
   104				cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
   105				capacity-dmips-mhz = <592>;
   106				clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER0>;
   107				operating-points-v2 = <&cluster0_opp>;
   108				#cooling-cells = <2>;
   109			};
   110	
   111			cpu4: cpu@100 {
   112				compatible = "arm,cortex-a73";
   113				device_type = "cpu";
   114				reg = <0x0 0x100>;
   115				enable-method = "psci";
   116				next-level-cache = <&A73_L2>;
   117				cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_1>;
   118				capacity-dmips-mhz = <1024>;
   119				clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER1>;
   120				operating-points-v2 = <&cluster1_opp>;
   121				#cooling-cells = <2>;
   122				dynamic-power-coefficient = <550>;
   123			};
   124	
   125			cpu5: cpu@101 {
   126				compatible = "arm,cortex-a73";
   127				device_type = "cpu";
   128				reg = <0x0 0x101>;
   129				enable-method = "psci";
   130				next-level-cache = <&A73_L2>;
   131				cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_1>;
   132				capacity-dmips-mhz = <1024>;
   133				clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER1>;
   134				operating-points-v2 = <&cluster1_opp>;
   135				#cooling-cells = <2>;
   136			};
   137	
   138			cpu6: cpu@102 {
   139				compatible = "arm,cortex-a73";
   140				device_type = "cpu";
   141				reg = <0x0 0x102>;
   142				enable-method = "psci";
   143				next-level-cache = <&A73_L2>;
   144				cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_1>;
   145				capacity-dmips-mhz = <1024>;
   146				clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER1>;
   147				operating-points-v2 = <&cluster1_opp>;
   148				#cooling-cells = <2>;
   149			};
   150	
   151			cpu7: cpu@103 {
   152				compatible = "arm,cortex-a73";
   153				device_type = "cpu";
   154				reg = <0x0 0x103>;
   155				enable-method = "psci";
   156				next-level-cache = <&A73_L2>;
   157				cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_1>;
   158				capacity-dmips-mhz = <1024>;
   159				clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER1>;
   160				operating-points-v2 = <&cluster1_opp>;
   161				#cooling-cells = <2>;
   162			};
   163	
   164			idle-states {
   165				entry-method = "psci";
   166	
   167				CPU_SLEEP_0: cpu-sleep-0 {
   168					compatible = "arm,idle-state";
   169					local-timer-stop;
   170					arm,psci-suspend-param = <0x0010000>;
   171					entry-latency-us = <400>;
   172					exit-latency-us = <650>;
   173					min-residency-us = <1500>;
   174				};
   175				CLUSTER_SLEEP_0: cluster-sleep-0 {
   176					compatible = "arm,idle-state";
   177					local-timer-stop;
   178					arm,psci-suspend-param = <0x1010000>;
   179					entry-latency-us = <500>;
   180					exit-latency-us = <1600>;
   181					min-residency-us = <3500>;
   182				};
   183	
   184	
   185				CPU_SLEEP_1: cpu-sleep-1 {
   186					compatible = "arm,idle-state";
   187					local-timer-stop;
   188					arm,psci-suspend-param = <0x0010000>;
   189					entry-latency-us = <400>;
   190					exit-latency-us = <550>;
   191					min-residency-us = <1500>;
   192				};
   193	
   194				CLUSTER_SLEEP_1: cluster-sleep-1 {
   195					compatible = "arm,idle-state";
   196					local-timer-stop;
   197					arm,psci-suspend-param = <0x1010000>;
   198					entry-latency-us = <800>;
   199					exit-latency-us = <2900>;
   200					min-residency-us = <3500>;
   201				};
   202			};
   203	
   204			A53_L2: l2-cache0 {
   205				compatible = "cache";
   206			};
   207	
   208			A73_L2: l2-cache1 {
   209				compatible = "cache";
   210			};
   211		};
   212	
   213		cluster0_opp: opp_table0 {
   214			compatible = "operating-points-v2";
   215			opp-shared;
   216	
   217			opp00 {
   218				opp-hz = /bits/ 64 <533000000>;
   219				opp-microvolt = <700000>;
   220				clock-latency-ns = <300000>;
   221			};
   222	
   223			opp01 {
   224				opp-hz = /bits/ 64 <999000000>;
   225				opp-microvolt = <800000>;
   226				clock-latency-ns = <300000>;
   227			};
   228	
   229			opp02 {
   230				opp-hz = /bits/ 64 <1402000000>;
   231				opp-microvolt = <900000>;
   232				clock-latency-ns = <300000>;
   233			};
   234	
   235			opp03 {
   236				opp-hz = /bits/ 64 <1709000000>;
   237				opp-microvolt = <1000000>;
   238				clock-latency-ns = <300000>;
   239			};
   240	
   241			opp04 {
   242				opp-hz = /bits/ 64 <1844000000>;
   243				opp-microvolt = <1100000>;
   244				clock-latency-ns = <300000>;
   245			};
   246		};
   247	
   248		cluster1_opp: opp_table1 {
   249			compatible = "operating-points-v2";
   250			opp-shared;
   251	
   252			opp10 {
   253				opp-hz = /bits/ 64 <903000000>;
   254				opp-microvolt = <700000>;
   255				clock-latency-ns = <300000>;
   256			};
   257	
   258			opp11 {
   259				opp-hz = /bits/ 64 <1421000000>;
   260				opp-microvolt = <800000>;
   261				clock-latency-ns = <300000>;
   262			};
   263	
   264			opp12 {
   265				opp-hz = /bits/ 64 <1805000000>;
   266				opp-microvolt = <900000>;
   267				clock-latency-ns = <300000>;
   268			};
   269	
   270			opp13 {
   271				opp-hz = /bits/ 64 <2112000000>;
   272				opp-microvolt = <1000000>;
   273				clock-latency-ns = <300000>;
   274			};
   275	
   276			opp14 {
   277				opp-hz = /bits/ 64 <2362000000>;
   278				opp-microvolt = <1100000>;
   279				clock-latency-ns = <300000>;
   280			};
   281		};
   282	
   283		gic: interrupt-controller@e82b0000 {
   284			compatible = "arm,gic-400";
   285			reg = <0x0 0xe82b1000 0 0x1000>, /* GICD */
   286			      <0x0 0xe82b2000 0 0x2000>, /* GICC */
   287			      <0x0 0xe82b4000 0 0x2000>, /* GICH */
   288			      <0x0 0xe82b6000 0 0x2000>; /* GICV */
   289			#address-cells = <0>;
   290			#interrupt-cells = <3>;
   291			interrupt-controller;
   292			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
   293						 IRQ_TYPE_LEVEL_HIGH)>;
   294		};
   295	
   296		a53-pmu {
   297			compatible = "arm,cortex-a53-pmu";
   298			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
   299				     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
   300				     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
   301				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
   302			interrupt-affinity = <&cpu0>,
   303					     <&cpu1>,
   304					     <&cpu2>,
   305					     <&cpu3>;
   306		};
   307	
   308		a73-pmu {
   309			compatible = "arm,cortex-a73-pmu";
   310			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
   311				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
   312				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
   313				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
   314			interrupt-affinity = <&cpu4>,
   315					     <&cpu5>,
   316					     <&cpu6>,
   317					     <&cpu7>;
   318		};
   319	
   320		timer {
   321			compatible = "arm,armv8-timer";
   322			interrupt-parent = <&gic>;
   323			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) |
   324						  IRQ_TYPE_LEVEL_LOW)>,
   325				     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) |
   326						  IRQ_TYPE_LEVEL_LOW)>,
   327				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) |
   328						  IRQ_TYPE_LEVEL_LOW)>,
   329				     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) |
   330						  IRQ_TYPE_LEVEL_LOW)>;
   331		};
   332	
   333		soc {
   334			compatible = "simple-bus";
   335			#address-cells = <2>;
   336			#size-cells = <2>;
   337			ranges;
   338	
   339			crg_ctrl: crg_ctrl@fff35000 {
   340				compatible = "hisilicon,hi3660-crgctrl", "syscon";
   341				reg = <0x0 0xfff35000 0x0 0x1000>;
   342				#clock-cells = <1>;
   343			};
   344	
   345			crg_rst: crg_rst_controller {
   346				compatible = "hisilicon,hi3660-reset";
   347				#reset-cells = <2>;
   348				hisi,rst-syscon = <&crg_ctrl>;
   349			};
   350	
   351	
   352			pctrl: pctrl@e8a09000 {
   353				compatible = "hisilicon,hi3660-pctrl", "syscon";
   354				reg = <0x0 0xe8a09000 0x0 0x2000>;
   355				#clock-cells = <1>;
   356			};
   357	
   358			pmuctrl: crg_ctrl@fff34000 {
   359				compatible = "hisilicon,hi3660-pmuctrl", "syscon";
   360				reg = <0x0 0xfff34000 0x0 0x1000>;
   361				#clock-cells = <1>;
   362			};
   363	
   364			sctrl: sctrl@fff0a000 {
   365				compatible = "hisilicon,hi3660-sctrl", "syscon";
   366				reg = <0x0 0xfff0a000 0x0 0x1000>;
   367				#clock-cells = <1>;
   368			};
   369	
 > 370			reboot {
   371				compatible = "hisilicon,hi3660-reboot";
   372				pmu-regmap = <&pmuctrl>;
   373				sctrl-regmap = <&sctrl>;
   374				reboot-offset = <0x4>;
   375			};
   376	
   377			iomcu: iomcu@ffd7e000 {
   378				compatible = "hisilicon,hi3660-iomcu", "syscon";
   379				reg = <0x0 0xffd7e000 0x0 0x1000>;
   380				#clock-cells = <1>;
   381	
   382			};
   383	
   384			iomcu_rst: reset {
   385				compatible = "hisilicon,hi3660-reset";
   386				hisi,rst-syscon = <&iomcu>;
   387				#reset-cells = <2>;
   388			};
   389	
   390			mailbox: mailbox@e896b000 {
   391				compatible = "hisilicon,hi3660-mbox";
   392				reg = <0x0 0xe896b000 0x0 0x1000>;
   393				interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
   394					     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
   395				#mbox-cells = <3>;
   396			};
   397	
   398			stub_clock: stub_clock@e896b500 {
   399				compatible = "hisilicon,hi3660-stub-clk";
   400				reg = <0x0 0xe896b500 0x0 0x0100>;
   401				#clock-cells = <1>;
   402				mboxes = <&mailbox 13 3 0>;
   403			};
   404	
   405			dual_timer0: timer@fff14000 {
   406				compatible = "arm,sp804", "arm,primecell";
   407				reg = <0x0 0xfff14000 0x0 0x1000>;
   408				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
   409					     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
   410				clocks = <&crg_ctrl HI3660_OSC32K>,
   411					 <&crg_ctrl HI3660_OSC32K>,
   412					 <&crg_ctrl HI3660_OSC32K>;
   413				clock-names = "timer1", "timer2", "apb_pclk";
   414			};
   415	
   416			i2c0: i2c@ffd71000 {
   417				compatible = "snps,designware-i2c";
   418				reg = <0x0 0xffd71000 0x0 0x1000>;
   419				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
   420				#address-cells = <1>;
   421				#size-cells = <0>;
   422				clock-frequency = <400000>;
   423				clocks = <&crg_ctrl HI3660_CLK_GATE_I2C0>;
   424				resets = <&iomcu_rst 0x20 3>;
   425				pinctrl-names = "default";
   426				pinctrl-0 = <&i2c0_pmx_func &i2c0_cfg_func>;
   427				status = "disabled";
   428			};
   429	
   430			i2c1: i2c@ffd72000 {
   431				compatible = "snps,designware-i2c";
   432				reg = <0x0 0xffd72000 0x0 0x1000>;
   433				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
   434				#address-cells = <1>;
   435				#size-cells = <0>;
   436				clock-frequency = <400000>;
   437				clocks = <&crg_ctrl HI3660_CLK_GATE_I2C1>;
   438				resets = <&iomcu_rst 0x20 4>;
   439				pinctrl-names = "default";
   440				pinctrl-0 = <&i2c1_pmx_func &i2c1_cfg_func>;
   441				status = "ok";
   442	
   443				adv7533: adv7533@39 {
   444					status = "ok";
   445					compatible = "adi,adv7533";
   446					reg = <0x39>;
   447					v1p2-supply = <&ldo3>;
   448					vdd-supply = <&ldo3>;
   449					interrupt-parent = <&gpio1>;
   450					interrupts = <1 2>;
   451					pd-gpio = <&gpio5 1 0>;
   452					sel-gpio = <&gpio2 4 0>;
   453					adi,dsi-lanes = <4>;
   454					adi,disable-timing-generator;
   455					#sound-dai-cells = <0>;
   456	
   457					port {
   458						adv7533_in: endpoint {
   459							remote-endpoint = <&dsi_out0>;
   460						};
   461					};
   462				};
   463			};
   464	
   465			i2c3: i2c@fdf0c000 {
   466				compatible = "snps,designware-i2c";
   467				reg = <0x0 0xfdf0c000 0x0 0x1000>;
   468				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
   469				#address-cells = <1>;
   470				#size-cells = <0>;
   471				clock-frequency = <400000>;
   472				clocks = <&crg_ctrl HI3660_CLK_GATE_I2C3>;
   473				resets = <&crg_rst 0x78 7>;
   474				pinctrl-names = "default";
   475				pinctrl-0 = <&i2c3_pmx_func &i2c3_cfg_func>;
   476				status = "disabled";
   477			};
   478	
   479			i2c7: i2c@fdf0b000 {
   480				compatible = "snps,designware-i2c";
   481				reg = <0x0 0xfdf0b000 0x0 0x1000>;
   482				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
   483				#address-cells = <1>;
   484				#size-cells = <0>;
   485				clock-frequency = <400000>;
   486				clocks = <&crg_ctrl HI3660_CLK_GATE_I2C7>;
   487				resets = <&crg_rst 0x60 14>;
   488				pinctrl-names = "default";
   489				pinctrl-0 = <&i2c7_pmx_func &i2c7_cfg_func>;
   490				status = "disabled";
   491			};
   492	
   493			uart0: serial@fdf02000 {
   494				compatible = "arm,pl011", "arm,primecell";
   495				reg = <0x0 0xfdf02000 0x0 0x1000>;
   496				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
   497				clocks = <&crg_ctrl HI3660_CLK_MUX_UART0>,
   498					 <&crg_ctrl HI3660_PCLK>;
   499				clock-names = "uartclk", "apb_pclk";
   500				pinctrl-names = "default";
   501				pinctrl-0 = <&uart0_pmx_func &uart0_cfg_func>;
   502				status = "disabled";
   503			};
   504	
   505			uart1: serial@fdf00000 {
   506				compatible = "arm,pl011", "arm,primecell";
   507				reg = <0x0 0xfdf00000 0x0 0x1000>;
   508				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
   509				dma-names = "rx", "tx";
   510				dmas =  <&dma0 2 &dma0 3>;
   511				clocks = <&crg_ctrl HI3660_CLK_GATE_UART1>,
   512					 <&crg_ctrl HI3660_CLK_GATE_UART1>;
   513				clock-names = "uartclk", "apb_pclk";
   514				pinctrl-names = "default";
   515				pinctrl-0 = <&uart1_pmx_func &uart1_cfg_func>;
   516				status = "disabled";
   517			};
   518	
   519			uart2: serial@fdf03000 {
   520				compatible = "arm,pl011", "arm,primecell";
   521				reg = <0x0 0xfdf03000 0x0 0x1000>;
   522				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
   523				dma-names = "rx", "tx";
   524				dmas =  <&dma0 4 &dma0 5>;
   525				clocks = <&crg_ctrl HI3660_CLK_GATE_UART2>,
   526					 <&crg_ctrl HI3660_PCLK>;
   527				clock-names = "uartclk", "apb_pclk";
   528				pinctrl-names = "default";
   529				pinctrl-0 = <&uart2_pmx_func &uart2_cfg_func>;
   530				status = "disabled";
   531			};
   532	
   533			uart3: serial@ffd74000 {
   534				compatible = "arm,pl011", "arm,primecell";
   535				reg = <0x0 0xffd74000 0x0 0x1000>;
   536				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
   537				clocks = <&crg_ctrl HI3660_FACTOR_UART3>,
   538					 <&crg_ctrl HI3660_PCLK>;
   539				clock-names = "uartclk", "apb_pclk";
   540				pinctrl-names = "default";
   541				pinctrl-0 = <&uart3_pmx_func &uart3_cfg_func>;
   542				status = "disabled";
   543			};
   544	
   545			uart4: serial@fdf01000 {
   546				compatible = "arm,pl011", "arm,primecell";
   547				reg = <0x0 0xfdf01000 0x0 0x1000>;
   548				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
   549				dma-names = "rx", "tx";
   550				dmas =  <&dma0 6 &dma0 7>;
   551				clocks = <&crg_ctrl HI3660_CLK_GATE_UART4>,
   552					 <&crg_ctrl HI3660_CLK_GATE_UART4>;
   553				clock-names = "uartclk", "apb_pclk";
   554				pinctrl-names = "default";
   555				pinctrl-0 = <&uart4_pmx_func &uart4_cfg_func>;
   556				status = "disabled";
   557			};
   558	
   559			uart5: serial@fdf05000 {
   560				compatible = "arm,pl011", "arm,primecell";
   561				reg = <0x0 0xfdf05000 0x0 0x1000>;
   562				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
   563				dma-names = "rx", "tx";
   564				dmas =  <&dma0 8 &dma0 9>;
   565				clocks = <&crg_ctrl HI3660_CLK_GATE_UART5>,
   566					 <&crg_ctrl HI3660_CLK_GATE_UART5>;
   567				clock-names = "uartclk", "apb_pclk";
   568				pinctrl-names = "default";
   569				pinctrl-0 = <&uart5_pmx_func &uart5_cfg_func>;
   570				status = "disabled";
   571			};
   572	
   573			uart6: serial@fff32000 {
   574				compatible = "arm,pl011", "arm,primecell";
   575				reg = <0x0 0xfff32000 0x0 0x1000>;
   576				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
   577				clocks = <&crg_ctrl HI3660_CLK_UART6>,
   578					 <&crg_ctrl HI3660_PCLK>;
   579				clock-names = "uartclk", "apb_pclk";
   580				pinctrl-names = "default";
   581				pinctrl-0 = <&uart6_pmx_func &uart6_cfg_func>;
   582				status = "disabled";
   583			};
   584	
   585			dma0: dma@fdf30000 {
   586				compatible = "hisilicon,k3-dma-1.0";
   587				reg = <0x0 0xfdf30000 0x0 0x1000>;
   588				#dma-cells = <1>;
   589				dma-channels = <16>;
   590				dma-requests = <32>;
   591				dma-channel-mask = <0xfffe>;
   592				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
   593				clocks = <&crg_ctrl HI3660_CLK_GATE_DMAC>;
   594				dma-no-cci;
   595				dma-type = "hi3660_dma";
   596			};
   597	
   598			asp_dmac: dma-controller@e804b000 {
   599				compatible = "hisilicon,hisi-pcm-asp-dma-1.0";
   600				reg = <0x0 0xe804b000 0x0 0x1000>;
   601				#dma-cells = <1>;
   602				dma-channels = <16>;
   603				dma-requests = <32>;
   604				interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
   605				interrupt-names = "asp_dma_irq";
   606			};
   607	
   608			rtc0: rtc@fff04000 {
   609				compatible = "arm,pl031", "arm,primecell";
   610				reg = <0x0 0Xfff04000 0x0 0x1000>;
   611				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
   612				clocks = <&crg_ctrl HI3660_PCLK>;
   613				clock-names = "apb_pclk";
   614			};
   615	
   616			gpio0: gpio@e8a0b000 {
   617				compatible = "arm,pl061", "arm,primecell";
   618				reg = <0 0xe8a0b000 0 0x1000>;
   619				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
   620				gpio-controller;
   621				#gpio-cells = <2>;
   622				gpio-ranges = <&pmx0 1 0 7>;
   623				interrupt-controller;
   624				#interrupt-cells = <2>;
   625				clocks = <&crg_ctrl HI3660_PCLK_GPIO0>;
   626				clock-names = "apb_pclk";
   627			};
   628	
   629			gpio1: gpio@e8a0c000 {
   630				compatible = "arm,pl061", "arm,primecell";
   631				reg = <0 0xe8a0c000 0 0x1000>;
   632				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
   633				gpio-controller;
   634				#gpio-cells = <2>;
   635				gpio-ranges = <&pmx0 1 7 7>;
   636				interrupt-controller;
   637				#interrupt-cells = <2>;
   638				clocks = <&crg_ctrl HI3660_PCLK_GPIO1>;
   639				clock-names = "apb_pclk";
   640			};
   641	
   642			gpio2: gpio@e8a0d000 {
   643				compatible = "arm,pl061", "arm,primecell";
   644				reg = <0 0xe8a0d000 0 0x1000>;
   645				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
   646				gpio-controller;
   647				#gpio-cells = <2>;
   648				gpio-ranges = <&pmx0 0 14 8>;
   649				interrupt-controller;
   650				#interrupt-cells = <2>;
   651				clocks = <&crg_ctrl HI3660_PCLK_GPIO2>;
   652				clock-names = "apb_pclk";
   653			};
   654	
   655			gpio3: gpio@e8a0e000 {
   656				compatible = "arm,pl061", "arm,primecell";
   657				reg = <0 0xe8a0e000 0 0x1000>;
   658				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
   659				gpio-controller;
   660				#gpio-cells = <2>;
   661				gpio-ranges = <&pmx0 0 22 8>;
   662				interrupt-controller;
   663				#interrupt-cells = <2>;
   664				clocks = <&crg_ctrl HI3660_PCLK_GPIO3>;
   665				clock-names = "apb_pclk";
   666			};
   667	
   668			gpio4: gpio@e8a0f000 {
   669				compatible = "arm,pl061", "arm,primecell";
   670				reg = <0 0xe8a0f000 0 0x1000>;
   671				interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
   672				gpio-controller;
   673				#gpio-cells = <2>;
   674				gpio-ranges = <&pmx0 0 30 8>;
   675				interrupt-controller;
   676				#interrupt-cells = <2>;
   677				clocks = <&crg_ctrl HI3660_PCLK_GPIO4>;
   678				clock-names = "apb_pclk";
   679			};
   680	
   681			gpio5: gpio@e8a10000 {
   682				compatible = "arm,pl061", "arm,primecell";
   683				reg = <0 0xe8a10000 0 0x1000>;
   684				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
   685				gpio-controller;
   686				#gpio-cells = <2>;
   687				gpio-ranges = <&pmx0 0 38 8>;
   688				interrupt-controller;
   689				#interrupt-cells = <2>;
   690				clocks = <&crg_ctrl HI3660_PCLK_GPIO5>;
   691				clock-names = "apb_pclk";
   692			};
   693	
   694			gpio6: gpio@e8a11000 {
   695				compatible = "arm,pl061", "arm,primecell";
   696				reg = <0 0xe8a11000 0 0x1000>;
   697				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
   698				gpio-controller;
   699				#gpio-cells = <2>;
   700				gpio-ranges = <&pmx0 0 46 8>;
   701				interrupt-controller;
   702				#interrupt-cells = <2>;
   703				clocks = <&crg_ctrl HI3660_PCLK_GPIO6>;
   704				clock-names = "apb_pclk";
   705			};
   706	
   707			gpio7: gpio@e8a12000 {
   708				compatible = "arm,pl061", "arm,primecell";
   709				reg = <0 0xe8a12000 0 0x1000>;
   710				interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
   711				gpio-controller;
   712				#gpio-cells = <2>;
   713				gpio-ranges = <&pmx0 0 54 8>;
   714				interrupt-controller;
   715				#interrupt-cells = <2>;
   716				clocks = <&crg_ctrl HI3660_PCLK_GPIO7>;
   717				clock-names = "apb_pclk";
   718			};
   719	
   720			gpio8: gpio@e8a13000 {
   721				compatible = "arm,pl061", "arm,primecell";
   722				reg = <0 0xe8a13000 0 0x1000>;
   723				interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
   724				gpio-controller;
   725				#gpio-cells = <2>;
   726				gpio-ranges = <&pmx0 0 62 8>;
   727				interrupt-controller;
   728				#interrupt-cells = <2>;
   729				clocks = <&crg_ctrl HI3660_PCLK_GPIO8>;
   730				clock-names = "apb_pclk";
   731			};
   732	
   733			gpio9: gpio@e8a14000 {
   734				compatible = "arm,pl061", "arm,primecell";
   735				reg = <0 0xe8a14000 0 0x1000>;
   736				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
   737				gpio-controller;
   738				#gpio-cells = <2>;
   739				gpio-ranges = <&pmx0 0 70 8>;
   740				interrupt-controller;
   741				#interrupt-cells = <2>;
   742				clocks = <&crg_ctrl HI3660_PCLK_GPIO9>;
   743				clock-names = "apb_pclk";
   744			};
   745	
   746			gpio10: gpio@e8a15000 {
   747				compatible = "arm,pl061", "arm,primecell";
   748				reg = <0 0xe8a15000 0 0x1000>;
   749				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
   750				gpio-controller;
   751				#gpio-cells = <2>;
   752				gpio-ranges = <&pmx0 0 78 8>;
   753				interrupt-controller;
   754				#interrupt-cells = <2>;
   755				clocks = <&crg_ctrl HI3660_PCLK_GPIO10>;
   756				clock-names = "apb_pclk";
   757			};
   758	
   759			gpio11: gpio@e8a16000 {
   760				compatible = "arm,pl061", "arm,primecell";
   761				reg = <0 0xe8a16000 0 0x1000>;
   762				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
   763				gpio-controller;
   764				#gpio-cells = <2>;
   765				gpio-ranges = <&pmx0 0 86 8>;
   766				interrupt-controller;
   767				#interrupt-cells = <2>;
   768				clocks = <&crg_ctrl HI3660_PCLK_GPIO11>;
   769				clock-names = "apb_pclk";
   770			};
   771	
   772			gpio12: gpio@e8a17000 {
   773				compatible = "arm,pl061", "arm,primecell";
   774				reg = <0 0xe8a17000 0 0x1000>;
   775				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
   776				gpio-controller;
   777				#gpio-cells = <2>;
   778				gpio-ranges = <&pmx0 0 94 3 &pmx0 7 101 1>;
   779				interrupt-controller;
   780				#interrupt-cells = <2>;
   781				clocks = <&crg_ctrl HI3660_PCLK_GPIO12>;
   782				clock-names = "apb_pclk";
   783			};
   784	
   785			gpio13: gpio@e8a18000 {
   786				compatible = "arm,pl061", "arm,primecell";
   787				reg = <0 0xe8a18000 0 0x1000>;
   788				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
   789				gpio-controller;
   790				#gpio-cells = <2>;
   791				gpio-ranges = <&pmx0 0 102 8>;
   792				interrupt-controller;
   793				#interrupt-cells = <2>;
   794				clocks = <&crg_ctrl HI3660_PCLK_GPIO13>;
   795				clock-names = "apb_pclk";
   796			};
   797	
   798			gpio14: gpio@e8a19000 {
   799				compatible = "arm,pl061", "arm,primecell";
   800				reg = <0 0xe8a19000 0 0x1000>;
   801				interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
   802				gpio-controller;
   803				#gpio-cells = <2>;
   804				gpio-ranges = <&pmx0 0 110 8>;
   805				interrupt-controller;
   806				#interrupt-cells = <2>;
   807				clocks = <&crg_ctrl HI3660_PCLK_GPIO14>;
   808				clock-names = "apb_pclk";
   809			};
   810	
   811			gpio15: gpio@e8a1a000 {
   812				compatible = "arm,pl061", "arm,primecell";
   813				reg = <0 0xe8a1a000 0 0x1000>;
   814				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
   815				gpio-controller;
   816				#gpio-cells = <2>;
   817				gpio-ranges = <&pmx0 0 118 6>;
   818				interrupt-controller;
   819				#interrupt-cells = <2>;
   820				clocks = <&crg_ctrl HI3660_PCLK_GPIO15>;
   821				clock-names = "apb_pclk";
   822			};
   823	
   824			gpio16: gpio@e8a1b000 {
   825				compatible = "arm,pl061", "arm,primecell";
   826				reg = <0 0xe8a1b000 0 0x1000>;
   827				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
   828				gpio-controller;
   829				#gpio-cells = <2>;
   830				interrupt-controller;
   831				#interrupt-cells = <2>;
   832				clocks = <&crg_ctrl HI3660_PCLK_GPIO16>;
   833				clock-names = "apb_pclk";
   834			};
   835	
   836			gpio17: gpio@e8a1c000 {
   837				compatible = "arm,pl061", "arm,primecell";
   838				reg = <0 0xe8a1c000 0 0x1000>;
   839				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
   840				gpio-controller;
   841				#gpio-cells = <2>;
   842				interrupt-controller;
   843				#interrupt-cells = <2>;
   844				clocks = <&crg_ctrl HI3660_PCLK_GPIO17>;
   845				clock-names = "apb_pclk";
   846			};
   847	
   848			gpio18: gpio@ff3b4000 {
   849				compatible = "arm,pl061", "arm,primecell";
   850				reg = <0 0xff3b4000 0 0x1000>;
   851				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
   852				gpio-controller;
   853				#gpio-cells = <2>;
   854				gpio-ranges = <&pmx2 0 0 8>;
   855				interrupt-controller;
   856				#interrupt-cells = <2>;
   857				clocks = <&crg_ctrl HI3660_PCLK_GPIO18>;
   858				clock-names = "apb_pclk";
   859			};
   860	
   861			gpio19: gpio@ff3b5000 {
   862				compatible = "arm,pl061", "arm,primecell";
   863				reg = <0 0xff3b5000 0 0x1000>;
   864				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
   865				gpio-controller;
   866				#gpio-cells = <2>;
   867				gpio-ranges = <&pmx2 0 8 4>;
   868				interrupt-controller;
   869				#interrupt-cells = <2>;
   870				clocks = <&crg_ctrl HI3660_PCLK_GPIO19>;
   871				clock-names = "apb_pclk";
   872			};
   873	
   874			gpio20: gpio@e8a1f000 {
   875				compatible = "arm,pl061", "arm,primecell";
   876				reg = <0 0xe8a1f000 0 0x1000>;
   877				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
   878				gpio-controller;
   879				#gpio-cells = <2>;
   880				gpio-ranges = <&pmx1 0 0 6>;
   881				interrupt-controller;
   882				#interrupt-cells = <2>;
   883				clocks = <&crg_ctrl HI3660_PCLK_GPIO20>;
   884				clock-names = "apb_pclk";
   885			};
   886	
   887			gpio21: gpio@e8a20000 {
   888				compatible = "arm,pl061", "arm,primecell";
   889				reg = <0 0xe8a20000 0 0x1000>;
   890				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
   891				gpio-controller;
   892				#gpio-cells = <2>;
   893				interrupt-controller;
   894				#interrupt-cells = <2>;
   895				gpio-ranges = <&pmx3 0 0 6>;
   896				clocks = <&crg_ctrl HI3660_PCLK_GPIO21>;
   897				clock-names = "apb_pclk";
   898			};
   899	
   900			gpio22: gpio@fff0b000 {
   901				compatible = "arm,pl061", "arm,primecell";
   902				reg = <0 0xfff0b000 0 0x1000>;
   903				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
   904				gpio-controller;
   905				#gpio-cells = <2>;
   906				/* GPIO176 */
   907				gpio-ranges = <&pmx4 2 0 6>;
   908				interrupt-controller;
   909				#interrupt-cells = <2>;
   910				clocks = <&sctrl HI3660_PCLK_AO_GPIO0>;
   911				clock-names = "apb_pclk";
   912			};
   913	
   914			gpio23: gpio@fff0c000 {
   915				compatible = "arm,pl061", "arm,primecell";
   916				reg = <0 0xfff0c000 0 0x1000>;
   917				interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
   918				gpio-controller;
   919				#gpio-cells = <2>;
   920				/* GPIO184 */
   921				gpio-ranges = <&pmx4 0 6 7>;
   922				interrupt-controller;
   923				#interrupt-cells = <2>;
   924				clocks = <&sctrl HI3660_PCLK_AO_GPIO1>;
   925				clock-names = "apb_pclk";
   926			};
   927	
   928			gpio24: gpio@fff0d000 {
   929				compatible = "arm,pl061", "arm,primecell";
   930				reg = <0 0xfff0d000 0 0x1000>;
   931				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
   932				gpio-controller;
   933				#gpio-cells = <2>;
   934				/* GPIO192 */
   935				gpio-ranges = <&pmx4 0 13 8>;
   936				interrupt-controller;
   937				#interrupt-cells = <2>;
   938				clocks = <&sctrl HI3660_PCLK_AO_GPIO2>;
   939				clock-names = "apb_pclk";
   940			};
   941	
   942			gpio25: gpio@fff0e000 {
   943				compatible = "arm,pl061", "arm,primecell";
   944				reg = <0 0xfff0e000 0 0x1000>;
   945				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
   946				gpio-controller;
   947				#gpio-cells = <2>;
   948				/* GPIO200 */
   949				gpio-ranges = <&pmx4 0 21 4 &pmx4 5 25 3>;
   950				interrupt-controller;
   951				#interrupt-cells = <2>;
   952				clocks = <&sctrl HI3660_PCLK_AO_GPIO3>;
   953				clock-names = "apb_pclk";
   954			};
   955	
   956			gpio26: gpio@fff0f000 {
   957				compatible = "arm,pl061", "arm,primecell";
   958				reg = <0 0xfff0f000 0 0x1000>;
   959				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
   960				gpio-controller;
   961				#gpio-cells = <2>;
   962				/* GPIO208 */
   963				gpio-ranges = <&pmx4 0 28 8>;
   964				interrupt-controller;
   965				#interrupt-cells = <2>;
   966				clocks = <&sctrl HI3660_PCLK_AO_GPIO4>;
   967				clock-names = "apb_pclk";
   968			};
   969	
   970			gpio27: gpio@fff10000 {
   971				compatible = "arm,pl061", "arm,primecell";
   972				reg = <0 0xfff10000 0 0x1000>;
   973				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
   974				gpio-controller;
   975				#gpio-cells = <2>;
   976				/* GPIO216 */
   977				gpio-ranges = <&pmx4 0 36 6>;
   978				interrupt-controller;
   979				#interrupt-cells = <2>;
   980				clocks = <&sctrl HI3660_PCLK_AO_GPIO5>;
   981				clock-names = "apb_pclk";
   982			};
   983	
   984			gpio28: gpio@fff1d000 {
   985				compatible = "arm,pl061", "arm,primecell";
   986				reg = <0 0xfff1d000 0 0x1000>;
   987				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
   988				gpio-controller;
   989				#gpio-cells = <2>;
   990				interrupt-controller;
   991				#interrupt-cells = <2>;
   992				clocks = <&sctrl HI3660_PCLK_AO_GPIO6>;
   993				clock-names = "apb_pclk";
   994			};
   995	
   996			spi2: spi@ffd68000 {
   997				compatible = "arm,pl022", "arm,primecell";
   998				reg = <0x0 0xffd68000 0x0 0x1000>;
   999				#address-cells = <1>;
  1000				#size-cells = <0>;
  1001				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
  1002				clocks = <&crg_ctrl HI3660_CLK_GATE_SPI2>;
  1003				clock-names = "apb_pclk";
  1004				pinctrl-names = "default";
  1005				pinctrl-0 = <&spi2_pmx_func>;
  1006				num-cs = <1>;
  1007				cs-gpios = <&gpio27 2 0>;
  1008				status = "disabled";
  1009			};
  1010	
  1011			spi3: spi@ff3b3000 {
  1012				compatible = "arm,pl022", "arm,primecell";
  1013				reg = <0x0 0xff3b3000 0x0 0x1000>;
  1014				#address-cells = <1>;
  1015				#size-cells = <0>;
  1016				interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
  1017				clocks = <&crg_ctrl HI3660_CLK_GATE_SPI3>;
  1018				clock-names = "apb_pclk";
  1019				pinctrl-names = "default";
  1020				pinctrl-0 = <&spi3_pmx_func>;
  1021				num-cs = <1>;
  1022				cs-gpios = <&gpio18 5 0>;
  1023				status = "disabled";
  1024			};
  1025	
  1026			pcie@f4000000 {
  1027				compatible = "hisilicon,kirin960-pcie";
  1028				reg = <0x0 0xf4000000 0x0 0x1000>,
  1029				      <0x0 0xff3fe000 0x0 0x1000>,
  1030				      <0x0 0xf3f20000 0x0 0x40000>,
  1031				      <0x0 0xf5000000 0x0 0x2000>;
  1032				reg-names = "dbi", "apb", "phy", "config";
  1033				bus-range = <0x0  0x1>;
  1034				#address-cells = <3>;
  1035				#size-cells = <2>;
  1036				device_type = "pci";
  1037				ranges = <0x02000000 0x0 0x00000000
  1038					  0x0 0xf6000000
  1039					  0x0 0x02000000>;
  1040				num-lanes = <1>;
  1041				#interrupt-cells = <1>;
  1042				interrupts = <0 283 4>;
  1043				interrupt-names = "msi";
  1044				interrupt-map-mask = <0xf800 0 0 7>;
  1045				interrupt-map = <0x0 0 0 1
  1046						 &gic GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
  1047						<0x0 0 0 2
  1048						 &gic GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
  1049						<0x0 0 0 3
  1050						 &gic GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
  1051						<0x0 0 0 4
  1052						 &gic GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>;
  1053				clocks = <&crg_ctrl HI3660_PCIEPHY_REF>,
  1054					 <&crg_ctrl HI3660_CLK_GATE_PCIEAUX>,
  1055					 <&crg_ctrl HI3660_PCLK_GATE_PCIE_PHY>,
  1056					 <&crg_ctrl HI3660_PCLK_GATE_PCIE_SYS>,
  1057					 <&crg_ctrl HI3660_ACLK_GATE_PCIE>;
  1058				clock-names = "pcie_phy_ref", "pcie_aux",
  1059					      "pcie_apb_phy", "pcie_apb_sys",
  1060					      "pcie_aclk";
  1061				reset-gpios = <&gpio11 1 0 >;
  1062			};
  1063	
  1064			/* UFS */
  1065			ufs: ufs@ff3b0000 {
  1066				compatible = "hisilicon,hi3660-ufs", "jedec,ufs-1.1";
  1067				/* 0: HCI standard */
  1068				/* 1: UFS SYS CTRL */
  1069				reg = <0x0 0xff3b0000 0x0 0x1000>,
  1070					<0x0 0xff3b1000 0x0 0x1000>;
  1071				interrupt-parent = <&gic>;
  1072				interrupts = <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>;
  1073				clocks = <&crg_ctrl HI3660_CLK_GATE_UFSIO_REF>,
  1074					<&crg_ctrl HI3660_CLK_GATE_UFSPHY_CFG>;
  1075				clock-names = "ref_clk", "phy_clk";
  1076				freq-table-hz = <0 0>, <0 0>;
  1077				/* offset: 0x84; bit: 12 */
  1078				resets = <&crg_rst 0x84 12>;
  1079				reset-names = "rst";
  1080			};
  1081	
  1082			/* SD */
  1083			dwmmc1: dwmmc1@ff37f000 {
  1084				compatible = "hisilicon,hi3660-dw-mshc";
  1085				reg = <0x0 0xff37f000 0x0 0x1000>;
  1086				#address-cells = <1>;
  1087				#size-cells = <0>;
  1088				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
  1089				clocks = <&crg_ctrl HI3660_CLK_GATE_SD>,
  1090					<&crg_ctrl HI3660_HCLK_GATE_SD>;
  1091				clock-names = "ciu", "biu";
  1092				clock-frequency = <3200000>;
  1093				resets = <&crg_rst 0x94 18>;
  1094				reset-names = "reset";
  1095				hisilicon,peripheral-syscon = <&sctrl>;
  1096				card-detect-delay = <200>;
  1097				status = "disabled";
  1098			};
  1099	
  1100			/* SDIO */
  1101			dwmmc2: dwmmc2@ff3ff000 {
  1102				compatible = "hisilicon,hi3660-dw-mshc";
  1103				reg = <0x0 0xff3ff000 0x0 0x1000>;
  1104				#address-cells = <0x1>;
  1105				#size-cells = <0x0>;
  1106				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
  1107				clocks = <&crg_ctrl HI3660_CLK_GATE_SDIO0>,
  1108					 <&crg_ctrl HI3660_HCLK_GATE_SDIO0>;
  1109				clock-names = "ciu", "biu";
  1110				resets = <&crg_rst 0x94 20>;
  1111				reset-names = "reset";
  1112				card-detect-delay = <200>;
  1113				status = "disabled";
  1114			};
  1115	
  1116			watchdog0: watchdog@e8a06000 {
  1117				compatible = "arm,sp805-wdt", "arm,primecell";
  1118				reg = <0x0 0xe8a06000 0x0 0x1000>;
  1119				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
  1120				clocks = <&crg_ctrl HI3660_OSC32K>;
  1121				clock-names = "apb_pclk";
  1122			};
  1123	
  1124			watchdog1: watchdog@e8a07000 {
  1125				compatible = "arm,sp805-wdt", "arm,primecell";
  1126				reg = <0x0 0xe8a07000 0x0 0x1000>;
  1127				interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
  1128				clocks = <&crg_ctrl HI3660_OSC32K>;
  1129				clock-names = "apb_pclk";
  1130			};
  1131	
  1132			tsensor: tsensor@fff30000 {
  1133				compatible = "hisilicon,hi3660-tsensor";
  1134				reg = <0x0 0xfff30000 0x0 0x1000>;
  1135				interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
  1136				#thermal-sensor-cells = <1>;
  1137			};
  1138	
  1139			thermal-zones {
  1140	
  1141				cls0: cls0 {
  1142					polling-delay = <1000>;
  1143					polling-delay-passive = <100>;
  1144					sustainable-power = <4500>;
  1145	
  1146					/* sensor ID */
  1147					thermal-sensors = <&tsensor 1>;
  1148	
  1149					trips {
  1150						threshold: trip-point@0 {
  1151							temperature = <65000>;
  1152							hysteresis = <1000>;
  1153							type = "passive";
  1154						};
  1155	
  1156						target: trip-point@1 {
  1157							temperature = <75000>;
  1158							hysteresis = <1000>;
  1159							type = "passive";
  1160						};
  1161					};
  1162	
  1163					cooling-maps {
  1164						map0 {
  1165							trip = <&target>;
  1166							contribution = <1024>;
  1167							cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
  1168									 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
  1169									 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
  1170									 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
  1171						};
  1172						map1 {
  1173							trip = <&target>;
  1174							contribution = <512>;
  1175							cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
  1176									 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
  1177									 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
  1178									 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
  1179						};
  1180					};
  1181				};
  1182			};
  1183		};
  1184	};
  1185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
