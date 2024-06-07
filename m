Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F08E11718
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 23:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717803296; cv=none; b=qHGbsjgHj0lHoNkmh7ojP0ghqmf7X/Ux7NLfzvHMpCzdywPHJA0eoWlQDblZiDI9f9Tt7W5kyAdGeX49ilD2cfs6jdEBS2QCqqXTzWDYDxdtMAW9Ii/TNuAqnnG1/D4wfq8JrGeR8mKmeKuXEOR+9PZqp14gHkcLeNAx8IgjR6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717803296; c=relaxed/simple;
	bh=J6Nk2hWY1T83bp74j914iDGFsSCypwWtUpF+hnC14Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rhr+hMWWwlxTEcnaioKOqMOmT5xo9jRALwutLz/6QgZ6HwrG7K5F2bFTffLzgATciYWECNiJ1yQtMHlDWWhRraNRTenZ3cYVL1oBwWDoIDjyBQV6RaT2YIgtTTALf9Jnrr1SGZ6cxzrUOirZ4FZV0gREkPXNzGmnaVeWUwggUPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bieu7ozv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bieu7ozv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717803294; x=1749339294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J6Nk2hWY1T83bp74j914iDGFsSCypwWtUpF+hnC14Jc=;
  b=bieu7ozvVpRLzx3M90/bI6QcngqLJO7uAp7KLWnp9PJIQr9Z2OtdosBZ
   /y+3/Od0sTntQOuH9KQkCYBGW3clNj3t6xMn6SNcOcsZSi2SmXTMHfCpN
   6KEBXXDljhVzibfCqiSIGQUefJ8q54FmMBLcFifTqE6TjmNQGDEitzTca
   bf1WAhyDpxS+zogAAuJ3/R+lT3q4U4GFBGvNzLlLYYt2PXb1WKP2XkgiF
   1HAltI6TnDcX1KMV2BjyFEbLla5PqByF8VptPYWP7NM/h6NKz3+vogy5I
   vT8abqIKc8/GJ1n30NJN2mtqjcnBKzLgQ6TqUOZLiVdk5UK+FDlZu5kTD
   Q==;
X-CSE-ConnectionGUID: fI1hLURVTyC0on73LjeU3w==
X-CSE-MsgGUID: 60JOMIAnR1ybEZwXzzw6fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25950005"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25950005"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 16:34:53 -0700
X-CSE-ConnectionGUID: pp5cEMdOTb+gl/DWHgzqlw==
X-CSE-MsgGUID: AzOLh+fxQV6DKMaiZDfszQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="39048134"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Jun 2024 16:34:51 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFj6f-0000hW-0e;
	Fri, 07 Jun 2024 23:34:49 +0000
Date: Sat, 8 Jun 2024 07:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-ak4619-for-v6.1-2024-06-03 3382/17202]
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi:713.25-743.5: Warning
 (unique_unit_address): /soc/pcie@e65d0000: duplicate unit-address (also used
 in node /soc/pcie-ep@e65d0000)
Message-ID: <202406080751.Agp3SaMk-lkp@intel.com>
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
commit: 7b4e776804bdcd12e699ce676c27872ea3574589 [3382/17202] arm64: dts: renesas: r8a779g0: Add PCIe Host and Endpoint nodes
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080751.Agp3SaMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080751.Agp3SaMk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1799.30-1866.5: Warning (simple_bus_reg): /soc/sound@ec540000: simple-bus unit address format error, expected "ec5a0000"
>> arch/arm64/boot/dts/renesas/r8a779g0.dtsi:713.25-743.5: Warning (unique_unit_address): /soc/pcie@e65d0000: duplicate unit-address (also used in node /soc/pcie-ep@e65d0000)
>> arch/arm64/boot/dts/renesas/r8a779g0.dtsi:745.25-775.5: Warning (unique_unit_address): /soc/pcie@e65d8000: duplicate unit-address (also used in node /soc/pcie-ep@e65d8000)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1295.12-1305.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1323.12-1333.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1351.12-1361.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1379.12-1389.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1407.12-1417.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1435.12-1445.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1463.12-1473.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1491.12-1501.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2046.12-2056.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +713 arch/arm64/boot/dts/renesas/r8a779g0.dtsi

    11	
    12	/ {
    13		compatible = "renesas,r8a779g0";
    14		#address-cells = <2>;
    15		#size-cells = <2>;
    16	
    17		/* External CAN clock - to be overridden by boards that provide it */
    18		can_clk: can {
    19			compatible = "fixed-clock";
    20			#clock-cells = <0>;
    21			clock-frequency = <0>;
    22		};
    23	
    24		cluster0_opp: opp-table-0 {
    25			compatible = "operating-points-v2";
    26			opp-shared;
    27	
    28			opp-500000000 {
    29				opp-hz = /bits/ 64 <500000000>;
    30				opp-microvolt = <825000>;
    31				clock-latency-ns = <500000>;
    32			};
    33			opp-1000000000 {
    34				opp-hz = /bits/ 64 <1000000000>;
    35				opp-microvolt = <825000>;
    36				clock-latency-ns = <500000>;
    37			};
    38			opp-1500000000 {
    39				opp-hz = /bits/ 64 <1500000000>;
    40				opp-microvolt = <825000>;
    41				clock-latency-ns = <500000>;
    42			};
    43			opp-1700000000 {
    44				opp-hz = /bits/ 64 <1700000000>;
    45				opp-microvolt = <825000>;
    46				clock-latency-ns = <500000>;
    47				opp-suspend;
    48			};
    49			opp-1800000000 {
    50				opp-hz = /bits/ 64 <1800000000>;
    51				opp-microvolt = <880000>;
    52				clock-latency-ns = <500000>;
    53				turbo-mode;
    54			};
    55		};
    56	
    57		cpus {
    58			#address-cells = <1>;
    59			#size-cells = <0>;
    60	
    61			cpu-map {
    62				cluster0 {
    63					core0 {
    64						cpu = <&a76_0>;
    65					};
    66					core1 {
    67						cpu = <&a76_1>;
    68					};
    69				};
    70	
    71				cluster1 {
    72					core0 {
    73						cpu = <&a76_2>;
    74					};
    75					core1 {
    76						cpu = <&a76_3>;
    77					};
    78				};
    79			};
    80	
    81			a76_0: cpu@0 {
    82				compatible = "arm,cortex-a76";
    83				reg = <0>;
    84				device_type = "cpu";
    85				power-domains = <&sysc R8A779G0_PD_A1E0D0C0>;
    86				next-level-cache = <&L3_CA76_0>;
    87				enable-method = "psci";
    88				cpu-idle-states = <&CPU_SLEEP_0>;
    89				clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
    90				operating-points-v2 = <&cluster0_opp>;
    91			};
    92	
    93			a76_1: cpu@100 {
    94				compatible = "arm,cortex-a76";
    95				reg = <0x100>;
    96				device_type = "cpu";
    97				power-domains = <&sysc R8A779G0_PD_A1E0D0C1>;
    98				next-level-cache = <&L3_CA76_0>;
    99				enable-method = "psci";
   100				cpu-idle-states = <&CPU_SLEEP_0>;
   101				clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
   102				operating-points-v2 = <&cluster0_opp>;
   103			};
   104	
   105			a76_2: cpu@10000 {
   106				compatible = "arm,cortex-a76";
   107				reg = <0x10000>;
   108				device_type = "cpu";
   109				power-domains = <&sysc R8A779G0_PD_A1E0D1C0>;
   110				next-level-cache = <&L3_CA76_1>;
   111				enable-method = "psci";
   112				cpu-idle-states = <&CPU_SLEEP_0>;
   113				clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
   114				operating-points-v2 = <&cluster0_opp>;
   115			};
   116	
   117			a76_3: cpu@10100 {
   118				compatible = "arm,cortex-a76";
   119				reg = <0x10100>;
   120				device_type = "cpu";
   121				power-domains = <&sysc R8A779G0_PD_A1E0D1C1>;
   122				next-level-cache = <&L3_CA76_1>;
   123				enable-method = "psci";
   124				cpu-idle-states = <&CPU_SLEEP_0>;
   125				clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
   126				operating-points-v2 = <&cluster0_opp>;
   127			};
   128	
   129			idle-states {
   130				entry-method = "psci";
   131	
   132				CPU_SLEEP_0: cpu-sleep-0 {
   133					compatible = "arm,idle-state";
   134					arm,psci-suspend-param = <0x0010000>;
   135					local-timer-stop;
   136					entry-latency-us = <400>;
   137					exit-latency-us = <500>;
   138					min-residency-us = <4000>;
   139				};
   140		       };
   141	
   142			L3_CA76_0: cache-controller-0 {
   143				compatible = "cache";
   144				power-domains = <&sysc R8A779G0_PD_A2E0D0>;
   145				cache-unified;
   146				cache-level = <3>;
   147			};
   148	
   149			L3_CA76_1: cache-controller-1 {
   150				compatible = "cache";
   151				power-domains = <&sysc R8A779G0_PD_A2E0D1>;
   152				cache-unified;
   153				cache-level = <3>;
   154			};
   155		};
   156	
   157		psci {
   158			compatible = "arm,psci-1.0", "arm,psci-0.2";
   159			method = "smc";
   160		};
   161	
   162		extal_clk: extal {
   163			compatible = "fixed-clock";
   164			#clock-cells = <0>;
   165			/* This value must be overridden by the board */
   166			clock-frequency = <0>;
   167		};
   168	
   169		extalr_clk: extalr {
   170			compatible = "fixed-clock";
   171			#clock-cells = <0>;
   172			/* This value must be overridden by the board */
   173			clock-frequency = <0>;
   174		};
   175	
   176		pmu_a76 {
   177			compatible = "arm,cortex-a76-pmu";
   178			interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
   179		};
   180	
   181		/* External SCIF clock - to be overridden by boards that provide it */
   182		scif_clk: scif {
   183			compatible = "fixed-clock";
   184			#clock-cells = <0>;
   185			clock-frequency = <0>;
   186		};
   187	
   188		/*
   189		 * The clock from AUDIO_CLKIN pin are configured as 0 Hz fixed frequency
   190		 */
   191		audio_clkin: audio_clkin {
   192			compatible = "fixed-clock";
   193			#clock-cells = <0>;
   194			clock-frequency = <0>;
   195		};
   196	
   197		soc: soc {
   198			compatible = "simple-bus";
   199			interrupt-parent = <&gic>;
   200			#address-cells = <2>;
   201			#size-cells = <2>;
   202			ranges;
   203	
   204			rwdt: watchdog@e6020000 {
   205				compatible = "renesas,r8a779g0-wdt",
   206					     "renesas,rcar-gen4-wdt";
   207				reg = <0 0xe6020000 0 0x0c>;
   208				interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
   209				clocks = <&cpg CPG_MOD 907>;
   210				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   211				resets = <&cpg 907>;
   212				status = "disabled";
   213			};
   214	
   215			pfc: pinctrl@e6050000 {
   216				compatible = "renesas,pfc-r8a779g0";
   217				reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
   218				      <0 0xe6058000 0 0x16c>, <0 0xe6058800 0 0x16c>,
   219				      <0 0xe6060000 0 0x16c>, <0 0xe6060800 0 0x16c>,
   220				      <0 0xe6061000 0 0x16c>, <0 0xe6061800 0 0x16c>,
   221				      <0 0xe6068000 0 0x16c>;
   222			};
   223	
   224			gpio0: gpio@e6050180 {
   225				compatible = "renesas,gpio-r8a779g0",
   226					     "renesas,rcar-gen4-gpio";
   227				reg = <0 0xe6050180 0 0x54>;
   228				interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH>;
   229				clocks = <&cpg CPG_MOD 915>;
   230				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   231				resets = <&cpg 915>;
   232				gpio-controller;
   233				#gpio-cells = <2>;
   234				gpio-ranges = <&pfc 0 0 19>;
   235				interrupt-controller;
   236				#interrupt-cells = <2>;
   237			};
   238	
   239			gpio1: gpio@e6050980 {
   240				compatible = "renesas,gpio-r8a779g0",
   241					     "renesas,rcar-gen4-gpio";
   242				reg = <0 0xe6050980 0 0x54>;
   243				interrupts = <GIC_SPI 623 IRQ_TYPE_LEVEL_HIGH>;
   244				clocks = <&cpg CPG_MOD 915>;
   245				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   246				resets = <&cpg 915>;
   247				gpio-controller;
   248				#gpio-cells = <2>;
   249				gpio-ranges = <&pfc 0 32 29>;
   250				interrupt-controller;
   251				#interrupt-cells = <2>;
   252			};
   253	
   254			gpio2: gpio@e6058180 {
   255				compatible = "renesas,gpio-r8a779g0",
   256					     "renesas,rcar-gen4-gpio";
   257				reg = <0 0xe6058180 0 0x54>;
   258				interrupts = <GIC_SPI 627 IRQ_TYPE_LEVEL_HIGH>;
   259				clocks = <&cpg CPG_MOD 916>;
   260				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   261				resets = <&cpg 916>;
   262				gpio-controller;
   263				#gpio-cells = <2>;
   264				gpio-ranges = <&pfc 0 64 20>;
   265				interrupt-controller;
   266				#interrupt-cells = <2>;
   267			};
   268	
   269			gpio3: gpio@e6058980 {
   270				compatible = "renesas,gpio-r8a779g0",
   271					     "renesas,rcar-gen4-gpio";
   272				reg = <0 0xe6058980 0 0x54>;
   273				interrupts = <GIC_SPI 631 IRQ_TYPE_LEVEL_HIGH>;
   274				clocks = <&cpg CPG_MOD 916>;
   275				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   276				resets = <&cpg 916>;
   277				gpio-controller;
   278				#gpio-cells = <2>;
   279				gpio-ranges = <&pfc 0 96 30>;
   280				interrupt-controller;
   281				#interrupt-cells = <2>;
   282			};
   283	
   284			gpio4: gpio@e6060180 {
   285				compatible = "renesas,gpio-r8a779g0",
   286					     "renesas,rcar-gen4-gpio";
   287				reg = <0 0xe6060180 0 0x54>;
   288				interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH>;
   289				clocks = <&cpg CPG_MOD 917>;
   290				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   291				resets = <&cpg 917>;
   292				gpio-controller;
   293				#gpio-cells = <2>;
   294				gpio-ranges = <&pfc 0 128 25>;
   295				interrupt-controller;
   296				#interrupt-cells = <2>;
   297			};
   298	
   299			gpio5: gpio@e6060980 {
   300				compatible = "renesas,gpio-r8a779g0",
   301					     "renesas,rcar-gen4-gpio";
   302				reg = <0 0xe6060980 0 0x54>;
   303				interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>;
   304				clocks = <&cpg CPG_MOD 917>;
   305				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   306				resets = <&cpg 917>;
   307				gpio-controller;
   308				#gpio-cells = <2>;
   309				gpio-ranges = <&pfc 0 160 21>;
   310				interrupt-controller;
   311				#interrupt-cells = <2>;
   312			};
   313	
   314			gpio6: gpio@e6061180 {
   315				compatible = "renesas,gpio-r8a779g0",
   316					     "renesas,rcar-gen4-gpio";
   317				reg = <0 0xe6061180 0 0x54>;
   318				interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
   319				clocks = <&cpg CPG_MOD 917>;
   320				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   321				resets = <&cpg 917>;
   322				gpio-controller;
   323				#gpio-cells = <2>;
   324				gpio-ranges = <&pfc 0 192 21>;
   325				interrupt-controller;
   326				#interrupt-cells = <2>;
   327			};
   328	
   329			gpio7: gpio@e6061980 {
   330				compatible = "renesas,gpio-r8a779g0",
   331					     "renesas,rcar-gen4-gpio";
   332				reg = <0 0xe6061980 0 0x54>;
   333				interrupts = <GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>;
   334				clocks = <&cpg CPG_MOD 917>;
   335				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   336				resets = <&cpg 917>;
   337				gpio-controller;
   338				#gpio-cells = <2>;
   339				gpio-ranges = <&pfc 0 224 21>;
   340				interrupt-controller;
   341				#interrupt-cells = <2>;
   342			};
   343	
   344			gpio8: gpio@e6068180 {
   345				compatible = "renesas,gpio-r8a779g0",
   346					     "renesas,rcar-gen4-gpio";
   347				reg = <0 0xe6068180 0 0x54>;
   348				interrupts = <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH>;
   349				clocks = <&cpg CPG_MOD 918>;
   350				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   351				resets = <&cpg 918>;
   352				gpio-controller;
   353				#gpio-cells = <2>;
   354				gpio-ranges = <&pfc 0 256 14>;
   355				interrupt-controller;
   356				#interrupt-cells = <2>;
   357			};
   358	
   359			cmt0: timer@e60f0000 {
   360				compatible = "renesas,r8a779g0-cmt0",
   361					     "renesas,rcar-gen4-cmt0";
   362				reg = <0 0xe60f0000 0 0x1004>;
   363				interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
   364					     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
   365				clocks = <&cpg CPG_MOD 910>;
   366				clock-names = "fck";
   367				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   368				resets = <&cpg 910>;
   369				status = "disabled";
   370			};
   371	
   372			cmt1: timer@e6130000 {
   373				compatible = "renesas,r8a779g0-cmt1",
   374					     "renesas,rcar-gen4-cmt1";
   375				reg = <0 0xe6130000 0 0x1004>;
   376				interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
   377					     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
   378					     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
   379					     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
   380					     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
   381					     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
   382					     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
   383					     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
   384				clocks = <&cpg CPG_MOD 911>;
   385				clock-names = "fck";
   386				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   387				resets = <&cpg 911>;
   388				status = "disabled";
   389			};
   390	
   391			cmt2: timer@e6140000 {
   392				compatible = "renesas,r8a779g0-cmt1",
   393					     "renesas,rcar-gen4-cmt1";
   394				reg = <0 0xe6140000 0 0x1004>;
   395				interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
   396					     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
   397					     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
   398					     <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
   399					     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
   400					     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
   401					     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
   402					     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>;
   403				clocks = <&cpg CPG_MOD 912>;
   404				clock-names = "fck";
   405				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   406				resets = <&cpg 912>;
   407				status = "disabled";
   408			};
   409	
   410			cmt3: timer@e6148000 {
   411				compatible = "renesas,r8a779g0-cmt1",
   412					     "renesas,rcar-gen4-cmt1";
   413				reg = <0 0xe6148000 0 0x1004>;
   414				interrupts = <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
   415					     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
   416					     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
   417					     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
   418					     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
   419					     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
   420					     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
   421					     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>;
   422				clocks = <&cpg CPG_MOD 913>;
   423				clock-names = "fck";
   424				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   425				resets = <&cpg 913>;
   426				status = "disabled";
   427			};
   428	
   429			cpg: clock-controller@e6150000 {
   430				compatible = "renesas,r8a779g0-cpg-mssr";
   431				reg = <0 0xe6150000 0 0x4000>;
   432				clocks = <&extal_clk>, <&extalr_clk>;
   433				clock-names = "extal", "extalr";
   434				#clock-cells = <2>;
   435				#power-domain-cells = <0>;
   436				#reset-cells = <1>;
   437			};
   438	
   439			rst: reset-controller@e6160000 {
   440				compatible = "renesas,r8a779g0-rst";
   441				reg = <0 0xe6160000 0 0x4000>;
   442			};
   443	
   444			sysc: system-controller@e6180000 {
   445				compatible = "renesas,r8a779g0-sysc";
   446				reg = <0 0xe6180000 0 0x4000>;
   447				#power-domain-cells = <1>;
   448			};
   449	
   450			tsc: thermal@e6198000 {
   451				compatible = "renesas,r8a779g0-thermal";
   452				reg = <0 0xe6198000 0 0x200>,
   453				      <0 0xe61a0000 0 0x200>,
   454				      <0 0xe61a8000 0 0x200>,
   455				      <0 0xe61b0000 0 0x200>;
   456				clocks = <&cpg CPG_MOD 919>;
   457				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   458				resets = <&cpg 919>;
   459				#thermal-sensor-cells = <1>;
   460			};
   461	
   462			intc_ex: interrupt-controller@e61c0000 {
   463				compatible = "renesas,intc-ex-r8a779g0", "renesas,irqc";
   464				#interrupt-cells = <2>;
   465				interrupt-controller;
   466				reg = <0 0xe61c0000 0 0x200>;
   467				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
   468					     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
   469					     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
   470					     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
   471					     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
   472					     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
   473				clocks = <&cpg CPG_MOD 611>;
   474				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   475				resets = <&cpg 611>;
   476			};
   477	
   478			tmu0: timer@e61e0000 {
   479				compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
   480				reg = <0 0xe61e0000 0 0x30>;
   481				interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
   482					     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
   483					     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>;
   484				clocks = <&cpg CPG_MOD 713>;
   485				clock-names = "fck";
   486				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   487				resets = <&cpg 713>;
   488				status = "disabled";
   489			};
   490	
   491			tmu1: timer@e6fc0000 {
   492				compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
   493				reg = <0 0xe6fc0000 0 0x30>;
   494				interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
   495					     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
   496					     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
   497				clocks = <&cpg CPG_MOD 714>;
   498				clock-names = "fck";
   499				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   500				resets = <&cpg 714>;
   501				status = "disabled";
   502			};
   503	
   504			tmu2: timer@e6fd0000 {
   505				compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
   506				reg = <0 0xe6fd0000 0 0x30>;
   507				interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
   508					     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
   509					     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
   510				clocks = <&cpg CPG_MOD 715>;
   511				clock-names = "fck";
   512				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   513				resets = <&cpg 715>;
   514				status = "disabled";
   515			};
   516	
   517			tmu3: timer@e6fe0000 {
   518				compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
   519				reg = <0 0xe6fe0000 0 0x30>;
   520				interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
   521					     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
   522					     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
   523				clocks = <&cpg CPG_MOD 716>;
   524				clock-names = "fck";
   525				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   526				resets = <&cpg 716>;
   527				status = "disabled";
   528			};
   529	
   530			tmu4: timer@ffc00000 {
   531				compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
   532				reg = <0 0xffc00000 0 0x30>;
   533				interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
   534					     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
   535					     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
   536				clocks = <&cpg CPG_MOD 717>;
   537				clock-names = "fck";
   538				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   539				resets = <&cpg 717>;
   540				status = "disabled";
   541			};
   542	
   543			i2c0: i2c@e6500000 {
   544				compatible = "renesas,i2c-r8a779g0",
   545					     "renesas,rcar-gen4-i2c";
   546				reg = <0 0xe6500000 0 0x40>;
   547				interrupts = <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH>;
   548				clocks = <&cpg CPG_MOD 518>;
   549				dmas = <&dmac0 0x91>, <&dmac0 0x90>,
   550				       <&dmac1 0x91>, <&dmac1 0x90>;
   551				dma-names = "tx", "rx", "tx", "rx";
   552				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   553				resets = <&cpg 518>;
   554				i2c-scl-internal-delay-ns = <110>;
   555				#address-cells = <1>;
   556				#size-cells = <0>;
   557				status = "disabled";
   558			};
   559	
   560			i2c1: i2c@e6508000 {
   561				compatible = "renesas,i2c-r8a779g0",
   562					     "renesas,rcar-gen4-i2c";
   563				reg = <0 0xe6508000 0 0x40>;
   564				interrupts = <GIC_SPI 611 IRQ_TYPE_LEVEL_HIGH>;
   565				clocks = <&cpg CPG_MOD 519>;
   566				dmas = <&dmac0 0x93>, <&dmac0 0x92>,
   567				       <&dmac1 0x93>, <&dmac1 0x92>;
   568				dma-names = "tx", "rx", "tx", "rx";
   569				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   570				resets = <&cpg 519>;
   571				i2c-scl-internal-delay-ns = <110>;
   572				#address-cells = <1>;
   573				#size-cells = <0>;
   574				status = "disabled";
   575			};
   576	
   577			i2c2: i2c@e6510000 {
   578				compatible = "renesas,i2c-r8a779g0",
   579					     "renesas,rcar-gen4-i2c";
   580				reg = <0 0xe6510000 0 0x40>;
   581				interrupts = <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH>;
   582				clocks = <&cpg CPG_MOD 520>;
   583				dmas = <&dmac0 0x95>, <&dmac0 0x94>,
   584				       <&dmac1 0x95>, <&dmac1 0x94>;
   585				dma-names = "tx", "rx", "tx", "rx";
   586				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   587				resets = <&cpg 520>;
   588				i2c-scl-internal-delay-ns = <110>;
   589				#address-cells = <1>;
   590				#size-cells = <0>;
   591				status = "disabled";
   592			};
   593	
   594			i2c3: i2c@e66d0000 {
   595				compatible = "renesas,i2c-r8a779g0",
   596					     "renesas,rcar-gen4-i2c";
   597				reg = <0 0xe66d0000 0 0x40>;
   598				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH>;
   599				clocks = <&cpg CPG_MOD 521>;
   600				dmas = <&dmac0 0x97>, <&dmac0 0x96>,
   601				       <&dmac1 0x97>, <&dmac1 0x96>;
   602				dma-names = "tx", "rx", "tx", "rx";
   603				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   604				resets = <&cpg 521>;
   605				i2c-scl-internal-delay-ns = <110>;
   606				#address-cells = <1>;
   607				#size-cells = <0>;
   608				status = "disabled";
   609			};
   610	
   611			i2c4: i2c@e66d8000 {
   612				compatible = "renesas,i2c-r8a779g0",
   613					     "renesas,rcar-gen4-i2c";
   614				reg = <0 0xe66d8000 0 0x40>;
   615				interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>;
   616				clocks = <&cpg CPG_MOD 522>;
   617				dma-names = "tx", "rx", "tx", "rx";
   618				dmas = <&dmac0 0x99>, <&dmac0 0x98>,
   619				       <&dmac1 0x99>, <&dmac1 0x98>;
   620				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   621				resets = <&cpg 522>;
   622				i2c-scl-internal-delay-ns = <110>;
   623				#address-cells = <1>;
   624				#size-cells = <0>;
   625				status = "disabled";
   626			};
   627	
   628			i2c5: i2c@e66e0000 {
   629				compatible = "renesas,i2c-r8a779g0",
   630					     "renesas,rcar-gen4-i2c";
   631				reg = <0 0xe66e0000 0 0x40>;
   632				interrupts = <GIC_SPI 615 IRQ_TYPE_LEVEL_HIGH>;
   633				clocks = <&cpg CPG_MOD 523>;
   634				dmas = <&dmac0 0x9b>, <&dmac0 0x9a>,
   635				       <&dmac1 0x9b>, <&dmac1 0x9a>;
   636				dma-names = "tx", "rx", "tx", "rx";
   637				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   638				resets = <&cpg 523>;
   639				i2c-scl-internal-delay-ns = <110>;
   640				#address-cells = <1>;
   641				#size-cells = <0>;
   642				status = "disabled";
   643			};
   644	
   645			hscif0: serial@e6540000 {
   646				compatible = "renesas,hscif-r8a779g0",
   647					     "renesas,rcar-gen4-hscif", "renesas,hscif";
   648				reg = <0 0xe6540000 0 0x60>;
   649				interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
   650				clocks = <&cpg CPG_MOD 514>,
   651					 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
   652					 <&scif_clk>;
   653				clock-names = "fck", "brg_int", "scif_clk";
   654				dmas = <&dmac0 0x31>, <&dmac0 0x30>,
   655				       <&dmac1 0x31>, <&dmac1 0x30>;
   656				dma-names = "tx", "rx", "tx", "rx";
   657				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   658				resets = <&cpg 514>;
   659				status = "disabled";
   660			};
   661	
   662			hscif1: serial@e6550000 {
   663				compatible = "renesas,hscif-r8a779g0",
   664					     "renesas,rcar-gen4-hscif", "renesas,hscif";
   665				reg = <0 0xe6550000 0 0x60>;
   666				interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
   667				clocks = <&cpg CPG_MOD 515>,
   668					 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
   669					 <&scif_clk>;
   670				clock-names = "fck", "brg_int", "scif_clk";
   671				dmas = <&dmac0 0x33>, <&dmac0 0x32>,
   672				       <&dmac1 0x33>, <&dmac1 0x32>;
   673				dma-names = "tx", "rx", "tx", "rx";
   674				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   675				resets = <&cpg 515>;
   676				status = "disabled";
   677			};
   678	
   679			hscif2: serial@e6560000 {
   680				compatible = "renesas,hscif-r8a779g0",
   681					     "renesas,rcar-gen4-hscif", "renesas,hscif";
   682				reg = <0 0xe6560000 0 0x60>;
   683				interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
   684				clocks = <&cpg CPG_MOD 516>,
   685					 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
   686					 <&scif_clk>;
   687				clock-names = "fck", "brg_int", "scif_clk";
   688				dmas = <&dmac0 0x35>, <&dmac0 0x34>,
   689				       <&dmac1 0x35>, <&dmac1 0x34>;
   690				dma-names = "tx", "rx", "tx", "rx";
   691				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   692				resets = <&cpg 516>;
   693				status = "disabled";
   694			};
   695	
   696			hscif3: serial@e66a0000 {
   697				compatible = "renesas,hscif-r8a779g0",
   698					     "renesas,rcar-gen4-hscif", "renesas,hscif";
   699				reg = <0 0xe66a0000 0 0x60>;
   700				interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
   701				clocks = <&cpg CPG_MOD 517>,
   702					 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
   703					 <&scif_clk>;
   704				clock-names = "fck", "brg_int", "scif_clk";
   705				dmas = <&dmac0 0x37>, <&dmac0 0x36>,
   706				       <&dmac1 0x37>, <&dmac1 0x36>;
   707				dma-names = "tx", "rx", "tx", "rx";
   708				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   709				resets = <&cpg 517>;
   710				status = "disabled";
   711			};
   712	
 > 713			pciec0: pcie@e65d0000 {
   714				compatible = "renesas,r8a779g0-pcie",
   715					     "renesas,rcar-gen4-pcie";
   716				reg = <0 0xe65d0000 0 0x3000>, <0 0xe65d3000 0 0x2000>,
   717				      <0 0xe65d5000 0 0x1200>, <0 0xe65d6200 0 0x0e00>,
   718				      <0 0xfe000000 0 0x400000>;
   719				reg-names = "dbi", "atu", "dma", "app", "config";
   720				#address-cells = <3>;
   721				#size-cells = <2>;
   722				bus-range = <0x00 0xff>;
   723				device_type = "pci";
   724				ranges = <0x82000000 0 0x30000000 0 0x30000000 0 0x10000000>;
   725				dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
   726				interrupts = <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
   727					     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
   728					     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
   729					     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>;
   730				interrupt-names = "msi", "dma", "sft_ce", "app";
   731				#interrupt-cells = <1>;
   732				interrupt-map-mask = <0 0 0 7>;
   733				interrupt-map = <0 0 0 1 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
   734						<0 0 0 2 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
   735						<0 0 0 3 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
   736						<0 0 0 4 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>;
   737				clocks = <&cpg CPG_MOD 624>;
   738				power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
   739				resets = <&cpg 624>;
   740				num-lanes = <2>;
   741				max-link-speed = <4>;
   742				status = "disabled";
   743			};
   744	
 > 745			pciec1: pcie@e65d8000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
