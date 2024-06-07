Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67B719309F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717765621; cv=none; b=fvD3ODWGnr/FfnFF/XEmc086+hoXgtHADBdzjytSdqIAZcXU043YcDtXG28TCziPSti+D+BDCZG5sF1CATuGH+vWiLvN82oGoIRIw/aTtg2YMcqfTjtZsCOEWlodmbHmscp4WIETZPKYZXwZ9LFPf0Fr67Myth4jlTpC2OY2P0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717765621; c=relaxed/simple;
	bh=0g8Pj7sSd2SAZYcn3dwNNwtwzK2Q8vZXG5DEvoUwxRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOd0t/tzjBSWWXQ6R5G+gvAxNZPG4vAHQ02vXW2pnOpzz+JD5/JVYiwHYfoglRuk9RZHbuswBMgJmKJ7E2itSq1bDjoP0LXaneJM6aRaRHV8PyLPAxNx65PIgxJOxNilBFrCZZXdnB6AS3zyPaVTNI8Ys6dEpB2tA1j5gD3/GAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfZIOnER; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfZIOnER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717765619; x=1749301619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0g8Pj7sSd2SAZYcn3dwNNwtwzK2Q8vZXG5DEvoUwxRE=;
  b=BfZIOnER0OB6XKF6+ROMoqiAL3pFOb5cM+2QkcwgKbxe5+h+cwqT6XuU
   Brf1L+1yffkn/Q8YSY+HEsNJcKi1YOVHC+Vjk/1hX4qnP4KUNREfNGJPq
   sfiWaO0ujm8Werj0odg3gdSsiqWcwp9NYiDjUipqxj2ZhyxB1NYVTUfDR
   om6Y9cpzl3Fdwr7KQasjB4Ko7luYakAQCf8WLIpOI/fkXrLsyz3Ew8h+Y
   UlCc4+DbyBH2YeUtwnHaBMRrys8wv7H7B/Kqy2P/92KI968Jn+vMtvIiy
   9jH1zLv+QO8xaLMeeNADAQo8ibAFo4gqJOZdjfDx8/LyAF9jTkFo+qnB4
   w==;
X-CSE-ConnectionGUID: KWG8s8WOTcSE8LH/UtPw/Q==
X-CSE-MsgGUID: NN6KH9M+SOKmYwPtbCwpVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25587508"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25587508"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 06:06:57 -0700
X-CSE-ConnectionGUID: ERe6Vyx7QMGusf+aerq2zg==
X-CSE-MsgGUID: XNoyuoqfQU+LyMpS3U2spg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="61522731"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jun 2024 06:06:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFZJ0-0004oM-0D;
	Fri, 07 Jun 2024 13:06:54 +0000
Date: Fri, 7 Jun 2024 21:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-ak4619-for-v6.1-2024-06-03 3374/17202]
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi:714.25-745.5: Warning
 (unique_unit_address): /soc/pcie@e65d0000: duplicate unit-address (also used
 in node /soc/pcie-ep@e65d0000)
Message-ID: <202406072108.nUOeHEky-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-ak4619-for-v6.1-2024-06-03
head:   fcb2c815fbf0f03847caecb88b5f1da7d72c7123
commit: e4053d3462c6f3714937a08d4c4035492c2148a7 [3374/17202] arm64: dts: renesas: r8a779f0: Add PCIe Host and Endpoint nodes
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406072108.nUOeHEky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406072108.nUOeHEky-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779f0.dtsi:714.25-745.5: Warning (unique_unit_address): /soc/pcie@e65d0000: duplicate unit-address (also used in node /soc/pcie-ep@e65d0000)
>> arch/arm64/boot/dts/renesas/r8a779f0.dtsi:747.25-778.5: Warning (unique_unit_address): /soc/pcie@e65d8000: duplicate unit-address (also used in node /soc/pcie-ep@e65d8000)

vim +714 arch/arm64/boot/dts/renesas/r8a779f0.dtsi

    11	
    12	/ {
    13		compatible = "renesas,r8a779f0";
    14		#address-cells = <2>;
    15		#size-cells = <2>;
    16	
    17		cluster01_opp: opp-table-0 {
    18			compatible = "operating-points-v2";
    19			opp-shared;
    20	
    21			opp-500000000 {
    22				opp-hz = /bits/ 64 <500000000>;
    23				opp-microvolt = <880000>;
    24				clock-latency-ns = <500000>;
    25			};
    26			opp-800000000 {
    27				opp-hz = /bits/ 64 <800000000>;
    28				opp-microvolt = <880000>;
    29				clock-latency-ns = <500000>;
    30			};
    31			opp-1000000000 {
    32				opp-hz = /bits/ 64 <1000000000>;
    33				opp-microvolt = <880000>;
    34				clock-latency-ns = <500000>;
    35			};
    36			opp-1200000000 {
    37				opp-hz = /bits/ 64 <1200000000>;
    38				opp-microvolt = <880000>;
    39				clock-latency-ns = <500000>;
    40				opp-suspend;
    41			};
    42		};
    43	
    44		cluster23_opp: opp-table-1 {
    45			compatible = "operating-points-v2";
    46			opp-shared;
    47	
    48			opp-500000000 {
    49				opp-hz = /bits/ 64 <500000000>;
    50				opp-microvolt = <880000>;
    51				clock-latency-ns = <500000>;
    52			};
    53			opp-800000000 {
    54				opp-hz = /bits/ 64 <800000000>;
    55				opp-microvolt = <880000>;
    56				clock-latency-ns = <500000>;
    57			};
    58			opp-1000000000 {
    59				opp-hz = /bits/ 64 <1000000000>;
    60				opp-microvolt = <880000>;
    61				clock-latency-ns = <500000>;
    62			};
    63			opp-1200000000 {
    64				opp-hz = /bits/ 64 <1200000000>;
    65				opp-microvolt = <880000>;
    66				clock-latency-ns = <500000>;
    67				opp-suspend;
    68			};
    69		};
    70	
    71		cpus {
    72			#address-cells = <1>;
    73			#size-cells = <0>;
    74	
    75			cpu-map {
    76				cluster0 {
    77					core0 {
    78						cpu = <&a55_0>;
    79					};
    80					core1 {
    81						cpu = <&a55_1>;
    82					};
    83				};
    84	
    85				cluster1 {
    86					core0 {
    87						cpu = <&a55_2>;
    88					};
    89					core1 {
    90						cpu = <&a55_3>;
    91					};
    92				};
    93	
    94				cluster2 {
    95					core0 {
    96						cpu = <&a55_4>;
    97					};
    98					core1 {
    99						cpu = <&a55_5>;
   100					};
   101				};
   102	
   103				cluster3 {
   104					core0 {
   105						cpu = <&a55_6>;
   106					};
   107					core1 {
   108						cpu = <&a55_7>;
   109					};
   110				};
   111			};
   112	
   113			a55_0: cpu@0 {
   114				compatible = "arm,cortex-a55";
   115				reg = <0>;
   116				device_type = "cpu";
   117				power-domains = <&sysc R8A779F0_PD_A1E0D0C0>;
   118				next-level-cache = <&L3_CA55_0>;
   119				enable-method = "psci";
   120				cpu-idle-states = <&CPU_SLEEP_0>;
   121				clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
   122				operating-points-v2 = <&cluster01_opp>;
   123			};
   124	
   125			a55_1: cpu@100 {
   126				compatible = "arm,cortex-a55";
   127				reg = <0x100>;
   128				device_type = "cpu";
   129				power-domains = <&sysc R8A779F0_PD_A1E0D0C1>;
   130				next-level-cache = <&L3_CA55_0>;
   131				enable-method = "psci";
   132				cpu-idle-states = <&CPU_SLEEP_0>;
   133				clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
   134				operating-points-v2 = <&cluster01_opp>;
   135			};
   136	
   137			a55_2: cpu@10000 {
   138				compatible = "arm,cortex-a55";
   139				reg = <0x10000>;
   140				device_type = "cpu";
   141				power-domains = <&sysc R8A779F0_PD_A1E0D1C0>;
   142				next-level-cache = <&L3_CA55_1>;
   143				enable-method = "psci";
   144				cpu-idle-states = <&CPU_SLEEP_0>;
   145				clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
   146				operating-points-v2 = <&cluster01_opp>;
   147			};
   148	
   149			a55_3: cpu@10100 {
   150				compatible = "arm,cortex-a55";
   151				reg = <0x10100>;
   152				device_type = "cpu";
   153				power-domains = <&sysc R8A779F0_PD_A1E0D1C1>;
   154				next-level-cache = <&L3_CA55_1>;
   155				enable-method = "psci";
   156				cpu-idle-states = <&CPU_SLEEP_0>;
   157				clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
   158				operating-points-v2 = <&cluster01_opp>;
   159			};
   160	
   161			a55_4: cpu@20000 {
   162				compatible = "arm,cortex-a55";
   163				reg = <0x20000>;
   164				device_type = "cpu";
   165				power-domains = <&sysc R8A779F0_PD_A1E1D0C0>;
   166				next-level-cache = <&L3_CA55_2>;
   167				enable-method = "psci";
   168				cpu-idle-states = <&CPU_SLEEP_0>;
   169				clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
   170				operating-points-v2 = <&cluster23_opp>;
   171			};
   172	
   173			a55_5: cpu@20100 {
   174				compatible = "arm,cortex-a55";
   175				reg = <0x20100>;
   176				device_type = "cpu";
   177				power-domains = <&sysc R8A779F0_PD_A1E1D0C1>;
   178				next-level-cache = <&L3_CA55_2>;
   179				enable-method = "psci";
   180				cpu-idle-states = <&CPU_SLEEP_0>;
   181				clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
   182				operating-points-v2 = <&cluster23_opp>;
   183			};
   184	
   185			a55_6: cpu@30000 {
   186				compatible = "arm,cortex-a55";
   187				reg = <0x30000>;
   188				device_type = "cpu";
   189				power-domains = <&sysc R8A779F0_PD_A1E1D1C0>;
   190				next-level-cache = <&L3_CA55_3>;
   191				enable-method = "psci";
   192				cpu-idle-states = <&CPU_SLEEP_0>;
   193				clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
   194				operating-points-v2 = <&cluster23_opp>;
   195			};
   196	
   197			a55_7: cpu@30100 {
   198				compatible = "arm,cortex-a55";
   199				reg = <0x30100>;
   200				device_type = "cpu";
   201				power-domains = <&sysc R8A779F0_PD_A1E1D1C1>;
   202				next-level-cache = <&L3_CA55_3>;
   203				enable-method = "psci";
   204				cpu-idle-states = <&CPU_SLEEP_0>;
   205				clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
   206				operating-points-v2 = <&cluster23_opp>;
   207			};
   208	
   209			L3_CA55_0: cache-controller-0 {
   210				compatible = "cache";
   211				power-domains = <&sysc R8A779F0_PD_A2E0D0>;
   212				cache-unified;
   213				cache-level = <3>;
   214			};
   215	
   216			L3_CA55_1: cache-controller-1 {
   217				compatible = "cache";
   218				power-domains = <&sysc R8A779F0_PD_A2E0D1>;
   219				cache-unified;
   220				cache-level = <3>;
   221			};
   222	
   223			L3_CA55_2: cache-controller-2 {
   224				compatible = "cache";
   225				power-domains = <&sysc R8A779F0_PD_A2E1D0>;
   226				cache-unified;
   227				cache-level = <3>;
   228			};
   229	
   230			L3_CA55_3: cache-controller-3 {
   231				compatible = "cache";
   232				power-domains = <&sysc R8A779F0_PD_A2E1D1>;
   233				cache-unified;
   234				cache-level = <3>;
   235			};
   236	
   237			idle-states {
   238				entry-method = "psci";
   239	
   240				CPU_SLEEP_0: cpu-sleep-0 {
   241					compatible = "arm,idle-state";
   242					arm,psci-suspend-param = <0x0010000>;
   243					local-timer-stop;
   244					entry-latency-us = <400>;
   245					exit-latency-us = <500>;
   246					min-residency-us = <4000>;
   247				};
   248			};
   249		};
   250	
   251		extal_clk: extal {
   252			compatible = "fixed-clock";
   253			#clock-cells = <0>;
   254			/* This value must be overridden by the board */
   255			clock-frequency = <0>;
   256		};
   257	
   258		extalr_clk: extalr {
   259			compatible = "fixed-clock";
   260			#clock-cells = <0>;
   261			/* This value must be overridden by the board */
   262			clock-frequency = <0>;
   263		};
   264	
   265		pmu_a55 {
   266			compatible = "arm,cortex-a55-pmu";
   267			interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
   268		};
   269	
   270		psci {
   271			compatible = "arm,psci-1.0", "arm,psci-0.2";
   272			method = "smc";
   273		};
   274	
   275		/* External SCIF clock - to be overridden by boards that provide it */
   276		scif_clk: scif {
   277			compatible = "fixed-clock";
   278			#clock-cells = <0>;
   279			clock-frequency = <0>;
   280		};
   281	
   282		soc: soc {
   283			compatible = "simple-bus";
   284			interrupt-parent = <&gic>;
   285			#address-cells = <2>;
   286			#size-cells = <2>;
   287			ranges;
   288	
   289			rwdt: watchdog@e6020000 {
   290				compatible = "renesas,r8a779f0-wdt",
   291					     "renesas,rcar-gen4-wdt";
   292				reg = <0 0xe6020000 0 0x0c>;
   293				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
   294				clocks = <&cpg CPG_MOD 907>;
   295				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   296				resets = <&cpg 907>;
   297				status = "disabled";
   298			};
   299	
   300			pfc: pinctrl@e6050000 {
   301				compatible = "renesas,pfc-r8a779f0";
   302				reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
   303				      <0 0xe6051000 0 0x16c>, <0 0xe6051800 0 0x16c>;
   304			};
   305	
   306			gpio0: gpio@e6050180 {
   307				compatible = "renesas,gpio-r8a779f0",
   308					     "renesas,rcar-gen4-gpio";
   309				reg = <0 0xe6050180 0 0x54>;
   310				interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH>;
   311				clocks = <&cpg CPG_MOD 915>;
   312				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   313				resets = <&cpg 915>;
   314				gpio-controller;
   315				#gpio-cells = <2>;
   316				gpio-ranges = <&pfc 0 0 21>;
   317				interrupt-controller;
   318				#interrupt-cells = <2>;
   319			};
   320	
   321			gpio1: gpio@e6050980 {
   322				compatible = "renesas,gpio-r8a779f0",
   323					     "renesas,rcar-gen4-gpio";
   324				reg = <0 0xe6050980 0 0x54>;
   325				interrupts = <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>;
   326				clocks = <&cpg CPG_MOD 915>;
   327				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   328				resets = <&cpg 915>;
   329				gpio-controller;
   330				#gpio-cells = <2>;
   331				gpio-ranges = <&pfc 0 32 25>;
   332				interrupt-controller;
   333				#interrupt-cells = <2>;
   334			};
   335	
   336			gpio2: gpio@e6051180 {
   337				compatible = "renesas,gpio-r8a779f0",
   338					     "renesas,rcar-gen4-gpio";
   339				reg = <0 0xe6051180 0 0x54>;
   340				interrupts = <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH>;
   341				clocks = <&cpg CPG_MOD 915>;
   342				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   343				resets = <&cpg 915>;
   344				gpio-controller;
   345				#gpio-cells = <2>;
   346				gpio-ranges = <&pfc 0 64 17>;
   347				interrupt-controller;
   348				#interrupt-cells = <2>;
   349			};
   350	
   351			gpio3: gpio@e6051980 {
   352				compatible = "renesas,gpio-r8a779f0",
   353					     "renesas,rcar-gen4-gpio";
   354				reg = <0 0xe6051980 0 0x54>;
   355				interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH>;
   356				clocks = <&cpg CPG_MOD 915>;
   357				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   358				resets = <&cpg 915>;
   359				gpio-controller;
   360				#gpio-cells = <2>;
   361				gpio-ranges = <&pfc 0 96 19>;
   362				interrupt-controller;
   363				#interrupt-cells = <2>;
   364			};
   365	
   366			cmt0: timer@e60f0000 {
   367				compatible = "renesas,r8a779f0-cmt0",
   368					     "renesas,rcar-gen4-cmt0";
   369				reg = <0 0xe60f0000 0 0x1004>;
   370				interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
   371					     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
   372				clocks = <&cpg CPG_MOD 910>;
   373				clock-names = "fck";
   374				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   375				resets = <&cpg 910>;
   376				status = "disabled";
   377			};
   378	
   379			cmt1: timer@e6130000 {
   380				compatible = "renesas,r8a779f0-cmt1",
   381					     "renesas,rcar-gen4-cmt1";
   382				reg = <0 0xe6130000 0 0x1004>;
   383				interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
   384					     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
   385					     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
   386					     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
   387					     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
   388					     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
   389					     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
   390					     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>;
   391				clocks = <&cpg CPG_MOD 911>;
   392				clock-names = "fck";
   393				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   394				resets = <&cpg 911>;
   395				status = "disabled";
   396			};
   397	
   398			cmt2: timer@e6140000 {
   399				compatible = "renesas,r8a779f0-cmt1",
   400					     "renesas,rcar-gen4-cmt1";
   401				reg = <0 0xe6140000 0 0x1004>;
   402				interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
   403					     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
   404					     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
   405					     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
   406					     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
   407					     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
   408					     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
   409					     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
   410				clocks = <&cpg CPG_MOD 912>;
   411				clock-names = "fck";
   412				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   413				resets = <&cpg 912>;
   414				status = "disabled";
   415			};
   416	
   417			cmt3: timer@e6148000 {
   418				compatible = "renesas,r8a779f0-cmt1",
   419					     "renesas,rcar-gen4-cmt1";
   420				reg = <0 0xe6148000 0 0x1004>;
   421				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
   422					     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
   423					     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
   424					     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
   425					     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
   426					     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
   427					     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
   428					     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
   429				clocks = <&cpg CPG_MOD 913>;
   430				clock-names = "fck";
   431				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   432				resets = <&cpg 913>;
   433				status = "disabled";
   434			};
   435	
   436			cpg: clock-controller@e6150000 {
   437				compatible = "renesas,r8a779f0-cpg-mssr";
   438				reg = <0 0xe6150000 0 0x4000>;
   439				clocks = <&extal_clk>, <&extalr_clk>;
   440				clock-names = "extal", "extalr";
   441				#clock-cells = <2>;
   442				#power-domain-cells = <0>;
   443				#reset-cells = <1>;
   444			};
   445	
   446			rst: reset-controller@e6160000 {
   447				compatible = "renesas,r8a779f0-rst";
   448				reg = <0 0xe6160000 0 0x4000>;
   449			};
   450	
   451			sysc: system-controller@e6180000 {
   452				compatible = "renesas,r8a779f0-sysc";
   453				reg = <0 0xe6180000 0 0x4000>;
   454				#power-domain-cells = <1>;
   455			};
   456	
   457			tsc: thermal@e6198000 {
   458				compatible = "renesas,r8a779f0-thermal";
   459				/* The 4th sensor is in control domain and not for Linux */
   460				reg = <0 0xe6198000 0 0x200>,
   461				      <0 0xe61a0000 0 0x200>,
   462				      <0 0xe61a8000 0 0x200>;
   463				clocks = <&cpg CPG_MOD 919>;
   464				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   465				resets = <&cpg 919>;
   466				#thermal-sensor-cells = <1>;
   467			};
   468	
   469			tmu0: timer@e61e0000 {
   470				compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
   471				reg = <0 0xe61e0000 0 0x30>;
   472				interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
   473					     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>,
   474					     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>;
   475				clocks = <&cpg CPG_MOD 713>;
   476				clock-names = "fck";
   477				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   478				resets = <&cpg 713>;
   479				status = "disabled";
   480			};
   481	
   482			tmu1: timer@e6fc0000 {
   483				compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
   484				reg = <0 0xe6fc0000 0 0x30>;
   485				interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
   486					     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
   487					     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>;
   488				clocks = <&cpg CPG_MOD 714>;
   489				clock-names = "fck";
   490				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   491				resets = <&cpg 714>;
   492				status = "disabled";
   493			};
   494	
   495			tmu2: timer@e6fd0000 {
   496				compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
   497				reg = <0 0xe6fd0000 0 0x30>;
   498				interrupts = <GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH>,
   499					     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
   500					     <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH>;
   501				clocks = <&cpg CPG_MOD 715>;
   502				clock-names = "fck";
   503				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   504				resets = <&cpg 715>;
   505				status = "disabled";
   506			};
   507	
   508			tmu3: timer@e6fe0000 {
   509				compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
   510				reg = <0 0xe6fe0000 0 0x30>;
   511				interrupts = <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>,
   512					     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
   513					     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>;
   514				clocks = <&cpg CPG_MOD 716>;
   515				clock-names = "fck";
   516				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   517				resets = <&cpg 716>;
   518				status = "disabled";
   519			};
   520	
   521			tmu4: timer@ffc00000 {
   522				compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
   523				reg = <0 0xffc00000 0 0x30>;
   524				interrupts = <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
   525					     <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
   526					     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
   527				clocks = <&cpg CPG_MOD 717>;
   528				clock-names = "fck";
   529				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   530				resets = <&cpg 717>;
   531				status = "disabled";
   532			};
   533	
   534			eth_serdes: phy@e6444000 {
   535				compatible = "renesas,r8a779f0-ether-serdes";
   536				reg = <0 0xe6444000 0 0x2800>;
   537				clocks = <&cpg CPG_MOD 1506>;
   538				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   539				resets = <&cpg 1506>;
   540				#phy-cells = <1>;
   541				status = "disabled";
   542			};
   543	
   544			i2c0: i2c@e6500000 {
   545				compatible = "renesas,i2c-r8a779f0",
   546					     "renesas,rcar-gen4-i2c";
   547				reg = <0 0xe6500000 0 0x40>;
   548				interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
   549				clocks = <&cpg CPG_MOD 518>;
   550				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   551				resets = <&cpg 518>;
   552				dmas = <&dmac0 0x91>, <&dmac0 0x90>,
   553				       <&dmac1 0x91>, <&dmac1 0x90>;
   554				dma-names = "tx", "rx", "tx", "rx";
   555				i2c-scl-internal-delay-ns = <110>;
   556				#address-cells = <1>;
   557				#size-cells = <0>;
   558				status = "disabled";
   559			};
   560	
   561			i2c1: i2c@e6508000 {
   562				compatible = "renesas,i2c-r8a779f0",
   563					     "renesas,rcar-gen4-i2c";
   564				reg = <0 0xe6508000 0 0x40>;
   565				interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
   566				clocks = <&cpg CPG_MOD 519>;
   567				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   568				resets = <&cpg 519>;
   569				dmas = <&dmac0 0x93>, <&dmac0 0x92>,
   570				       <&dmac1 0x93>, <&dmac1 0x92>;
   571				dma-names = "tx", "rx", "tx", "rx";
   572				i2c-scl-internal-delay-ns = <110>;
   573				#address-cells = <1>;
   574				#size-cells = <0>;
   575				status = "disabled";
   576			};
   577	
   578			i2c2: i2c@e6510000 {
   579				compatible = "renesas,i2c-r8a779f0",
   580					     "renesas,rcar-gen4-i2c";
   581				reg = <0 0xe6510000 0 0x40>;
   582				interrupts = <0 240 IRQ_TYPE_LEVEL_HIGH>;
   583				clocks = <&cpg CPG_MOD 520>;
   584				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   585				resets = <&cpg 520>;
   586				dmas = <&dmac0 0x95>, <&dmac0 0x94>,
   587				       <&dmac1 0x95>, <&dmac1 0x94>;
   588				dma-names = "tx", "rx", "tx", "rx";
   589				i2c-scl-internal-delay-ns = <110>;
   590				#address-cells = <1>;
   591				#size-cells = <0>;
   592				status = "disabled";
   593			};
   594	
   595			i2c3: i2c@e66d0000 {
   596				compatible = "renesas,i2c-r8a779f0",
   597					     "renesas,rcar-gen4-i2c";
   598				reg = <0 0xe66d0000 0 0x40>;
   599				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
   600				clocks = <&cpg CPG_MOD 521>;
   601				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   602				resets = <&cpg 521>;
   603				dmas = <&dmac0 0x97>, <&dmac0 0x96>,
   604				       <&dmac1 0x97>, <&dmac1 0x96>;
   605				dma-names = "tx", "rx", "tx", "rx";
   606				i2c-scl-internal-delay-ns = <110>;
   607				#address-cells = <1>;
   608				#size-cells = <0>;
   609				status = "disabled";
   610			};
   611	
   612			i2c4: i2c@e66d8000 {
   613				compatible = "renesas,i2c-r8a779f0",
   614					     "renesas,rcar-gen4-i2c";
   615				reg = <0 0xe66d8000 0 0x40>;
   616				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
   617				clocks = <&cpg CPG_MOD 522>;
   618				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   619				resets = <&cpg 522>;
   620				dmas = <&dmac0 0x99>, <&dmac0 0x98>,
   621				       <&dmac1 0x99>, <&dmac1 0x98>;
   622				dma-names = "tx", "rx", "tx", "rx";
   623				i2c-scl-internal-delay-ns = <110>;
   624				#address-cells = <1>;
   625				#size-cells = <0>;
   626				status = "disabled";
   627			};
   628	
   629			i2c5: i2c@e66e0000 {
   630				compatible = "renesas,i2c-r8a779f0",
   631					     "renesas,rcar-gen4-i2c";
   632				reg = <0 0xe66e0000 0 0x40>;
   633				interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
   634				clocks = <&cpg CPG_MOD 523>;
   635				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   636				resets = <&cpg 523>;
   637				dmas = <&dmac0 0x9b>, <&dmac0 0x9a>,
   638				       <&dmac1 0x9b>, <&dmac1 0x9a>;
   639				dma-names = "tx", "rx", "tx", "rx";
   640				i2c-scl-internal-delay-ns = <110>;
   641				#address-cells = <1>;
   642				#size-cells = <0>;
   643				status = "disabled";
   644			};
   645	
   646			hscif0: serial@e6540000 {
   647				compatible = "renesas,hscif-r8a779f0",
   648					     "renesas,rcar-gen4-hscif", "renesas,hscif";
   649				reg = <0 0xe6540000 0 0x60>;
   650				interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
   651				clocks = <&cpg CPG_MOD 514>,
   652					 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
   653					 <&scif_clk>;
   654				clock-names = "fck", "brg_int", "scif_clk";
   655				dmas = <&dmac0 0x31>, <&dmac0 0x30>,
   656				       <&dmac1 0x31>, <&dmac1 0x30>;
   657				dma-names = "tx", "rx", "tx", "rx";
   658				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   659				resets = <&cpg 514>;
   660				status = "disabled";
   661			};
   662	
   663			hscif1: serial@e6550000 {
   664				compatible = "renesas,hscif-r8a779f0",
   665					     "renesas,rcar-gen4-hscif", "renesas,hscif";
   666				reg = <0 0xe6550000 0 0x60>;
   667				interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
   668				clocks = <&cpg CPG_MOD 515>,
   669					 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
   670					 <&scif_clk>;
   671				clock-names = "fck", "brg_int", "scif_clk";
   672				dmas = <&dmac0 0x33>, <&dmac0 0x32>,
   673				       <&dmac1 0x33>, <&dmac1 0x32>;
   674				dma-names = "tx", "rx", "tx", "rx";
   675				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   676				resets = <&cpg 515>;
   677				status = "disabled";
   678			};
   679	
   680			hscif2: serial@e6560000 {
   681				compatible = "renesas,hscif-r8a779f0",
   682					     "renesas,rcar-gen4-hscif", "renesas,hscif";
   683				reg = <0 0xe6560000 0 0x60>;
   684				interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
   685				clocks = <&cpg CPG_MOD 516>,
   686					 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
   687					 <&scif_clk>;
   688				clock-names = "fck", "brg_int", "scif_clk";
   689				dmas = <&dmac0 0x35>, <&dmac0 0x34>,
   690				       <&dmac1 0x35>, <&dmac1 0x34>;
   691				dma-names = "tx", "rx", "tx", "rx";
   692				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   693				resets = <&cpg 516>;
   694				status = "disabled";
   695			};
   696	
   697			hscif3: serial@e66a0000 {
   698				compatible = "renesas,hscif-r8a779f0",
   699					     "renesas,rcar-gen4-hscif", "renesas,hscif";
   700				reg = <0 0xe66a0000 0 0x60>;
   701				interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
   702				clocks = <&cpg CPG_MOD 517>,
   703					 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
   704					 <&scif_clk>;
   705				clock-names = "fck", "brg_int", "scif_clk";
   706				dmas = <&dmac0 0x37>, <&dmac0 0x36>,
   707				       <&dmac1 0x37>, <&dmac1 0x36>;
   708				dma-names = "tx", "rx", "tx", "rx";
   709				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   710				resets = <&cpg 517>;
   711				status = "disabled";
   712			};
   713	
 > 714			pciec0: pcie@e65d0000 {
   715				compatible = "renesas,r8a779f0-pcie",
   716					     "renesas,rcar-gen4-pcie";
   717				reg = <0 0xe65d0000 0 0x3000>, <0 0xe65d3000 0 0x2000>,
   718				      <0 0xe65d5000 0 0x1200>, <0 0xe65d6200 0 0x0e00>,
   719				      <0 0xfe000000 0 0x400000>;
   720				reg-names = "dbi", "atu", "dma", "app", "config";
   721				#address-cells = <3>;
   722				#size-cells = <2>;
   723				bus-range = <0x00 0xff>;
   724				device_type = "pci";
   725				ranges = <0x82000000 0 0x30000000 0 0x30000000 0 0x10000000>;
   726				dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
   727				interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
   728					     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
   729					     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
   730					     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
   731				interrupt-names = "msi", "dma", "sft_ce", "app";
   732				#interrupt-cells = <1>;
   733				interrupt-map-mask = <0 0 0 7>;
   734				interrupt-map = <0 0 0 1 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
   735						<0 0 0 2 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
   736						<0 0 0 3 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
   737						<0 0 0 4 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>;
   738				clocks = <&cpg CPG_MOD 624>;
   739				power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
   740				resets = <&cpg 624>;
   741				num-lanes = <2>;
   742				snps,enable-cdm-check;
   743				max-link-speed = <4>;
   744				status = "disabled";
   745			};
   746	
 > 747			pciec1: pcie@e65d8000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
