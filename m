Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E64F2F2B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718522819; cv=none; b=ZxL6+p+J+PHfZ0ldc7754JoeZ4E4/PIhGLgCR5RanK9kXe5aE2OLQ87fI3vKp8SMDqg+TYsAsLDir/gGdYJz8m3lzf4S6+i+mRa17PVEXRRbGlC1G8chCQtQoupprBtBh3gE60qF0c+i0/E2LYlgvPERP2AUCINWIVKXEqPe68Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718522819; c=relaxed/simple;
	bh=4vEgTvtlYyvWlVV4MLqAG9dQ8Hz3x8Dm4iHD6aFtaGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ovCGjvOyAkWLaOK3UqsdqGx1be1FITl6dn69+3auKNgT12dDroE0WflNhgriHyGe2haskn4Zu+EC+pftGRgRykM/WiAHHoOUohqLarBSLJ/K9/qR62w16VF4c1NjdpBGPEd2Z8TLYfbcFDg3TW5Fl1dCyt+9z8JybPE25uNuo3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOfAR0qx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOfAR0qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718522816; x=1750058816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4vEgTvtlYyvWlVV4MLqAG9dQ8Hz3x8Dm4iHD6aFtaGg=;
  b=aOfAR0qx3jRRUFzaLoSCqbqYLDieI64NeRdr9ZfcPoJgWXX17Ud0AR9Z
   LWgth8Hp3r+9jNtRHqnNBahb0hXDW7gepmHrpWA6nPV7yED+9h03acroa
   sjRH9EBe1E8nN5uO6n7vKHaTnX9AV14iF7d/SXKEt+r4+LmNW7AUDNX8i
   JeG9BKLvWOHA9hBesbdzRbr9Bq/Ngpw/zuKjflsd0pAbyhgFRRsT/R2Rn
   bVjTHJ9mZ/z5fKJHycr96e4LCiJsKpu9AdpVp52wZwMXs/OWI6F/AT8RQ
   5Y6HnYNMU81Kp47zN2Kr3tRWaShRRESq6OuRrYUmC7ItzNORF9lejn5to
   Q==;
X-CSE-ConnectionGUID: ow2EL/lXTl2RdxgE+lci0g==
X-CSE-MsgGUID: CFaU+5PlTMqvlpYqwLvDOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="19225927"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="19225927"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 00:26:55 -0700
X-CSE-ConnectionGUID: Hu5bh1CFT1ilmmZguSLKoQ==
X-CSE-MsgGUID: p8Ffw4xYRmKnTerz5CEsKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="64113627"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jun 2024 00:26:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIkHr-00029H-0w;
	Sun, 16 Jun 2024 07:26:51 +0000
Date: Sun, 16 Jun 2024 15:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 45/184]
 arch/arm64/boot/dts/apple/t8112.dtsi:448.30-454.5: Warning (simple_bus_reg):
 /soc/display-subsystem: missing or empty reg/ranges property
Message-ID: <202406161516.6IsITrFk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   7a67f4836b8673379e8014405fc0a17abea55160
commit: 0c09fe9a5eb4d7d0e93e70ca0c4b315bd0093d13 [45/184] arm64: dts: apple: t8112: Add dcp/disp0 nodes
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240616/202406161516.6IsITrFk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406161516.6IsITrFk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406161516.6IsITrFk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dts:155.14-174.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j413.dts:176.14-185.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t8112.dtsi:448.30-454.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:738.28-814.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:778.43-781.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8112-j493.dts:143.14-162.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j493.dts:164.14-173.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t8112.dtsi:448.30-454.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:738.28-814.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:778.43-781.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8112-j473.dts:115.14-124.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j473.dts:126.14-135.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t8112.dtsi:448.30-454.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:738.28-814.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:778.43-781.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +448 arch/arm64/boot/dts/apple/t8112.dtsi

    16	
    17	/ {
    18		compatible = "apple,t8112", "apple,arm-platform";
    19	
    20		#address-cells = <2>;
    21		#size-cells = <2>;
    22	
    23		cpus {
    24			#address-cells = <2>;
    25			#size-cells = <0>;
    26	
    27			cpu-map {
    28				cluster0 {
    29					core0 {
    30						cpu = <&cpu_e0>;
    31					};
    32					core1 {
    33						cpu = <&cpu_e1>;
    34					};
    35					core2 {
    36						cpu = <&cpu_e2>;
    37					};
    38					core3 {
    39						cpu = <&cpu_e3>;
    40					};
    41				};
    42	
    43				cluster1 {
    44					core0 {
    45						cpu = <&cpu_p0>;
    46					};
    47					core1 {
    48						cpu = <&cpu_p1>;
    49					};
    50					core2 {
    51						cpu = <&cpu_p2>;
    52					};
    53					core3 {
    54						cpu = <&cpu_p3>;
    55					};
    56				};
    57			};
    58	
    59			cpu_e0: cpu@0 {
    60				compatible = "apple,blizzard";
    61				device_type = "cpu";
    62				reg = <0x0 0x0>;
    63				enable-method = "spin-table";
    64				cpu-release-addr = <0 0>; /* To be filled by loader */
    65				operating-points-v2 = <&ecluster_opp>;
    66				capacity-dmips-mhz = <756>;
    67				performance-domains = <&cpufreq_e>;
    68				next-level-cache = <&l2_cache_0>;
    69				i-cache-size = <0x20000>;
    70				d-cache-size = <0x10000>;
    71			};
    72	
    73			cpu_e1: cpu@1 {
    74				compatible = "apple,blizzard";
    75				device_type = "cpu";
    76				reg = <0x0 0x1>;
    77				enable-method = "spin-table";
    78				cpu-release-addr = <0 0>; /* To be filled by loader */
    79				operating-points-v2 = <&ecluster_opp>;
    80				capacity-dmips-mhz = <756>;
    81				performance-domains = <&cpufreq_e>;
    82				next-level-cache = <&l2_cache_0>;
    83				i-cache-size = <0x20000>;
    84				d-cache-size = <0x10000>;
    85			};
    86	
    87			cpu_e2: cpu@2 {
    88				compatible = "apple,blizzard";
    89				device_type = "cpu";
    90				reg = <0x0 0x2>;
    91				enable-method = "spin-table";
    92				cpu-release-addr = <0 0>; /* To be filled by loader */
    93				operating-points-v2 = <&ecluster_opp>;
    94				capacity-dmips-mhz = <756>;
    95				performance-domains = <&cpufreq_e>;
    96				next-level-cache = <&l2_cache_0>;
    97				i-cache-size = <0x20000>;
    98				d-cache-size = <0x10000>;
    99			};
   100	
   101			cpu_e3: cpu@3 {
   102				compatible = "apple,blizzard";
   103				device_type = "cpu";
   104				reg = <0x0 0x3>;
   105				enable-method = "spin-table";
   106				cpu-release-addr = <0 0>; /* To be filled by loader */
   107				operating-points-v2 = <&ecluster_opp>;
   108				capacity-dmips-mhz = <756>;
   109				performance-domains = <&cpufreq_e>;
   110				next-level-cache = <&l2_cache_0>;
   111				i-cache-size = <0x20000>;
   112				d-cache-size = <0x10000>;
   113			};
   114	
   115			cpu_p0: cpu@10100 {
   116				compatible = "apple,avalanche";
   117				device_type = "cpu";
   118				reg = <0x0 0x10100>;
   119				enable-method = "spin-table";
   120				cpu-release-addr = <0 0>; /* To be filled by loader */
   121				operating-points-v2 = <&pcluster_opp>;
   122				capacity-dmips-mhz = <1024>;
   123				performance-domains = <&cpufreq_p>;
   124				next-level-cache = <&l2_cache_1>;
   125				i-cache-size = <0x30000>;
   126				d-cache-size = <0x20000>;
   127			};
   128	
   129			cpu_p1: cpu@10101 {
   130				compatible = "apple,avalanche";
   131				device_type = "cpu";
   132				reg = <0x0 0x10101>;
   133				enable-method = "spin-table";
   134				cpu-release-addr = <0 0>; /* To be filled by loader */
   135				operating-points-v2 = <&pcluster_opp>;
   136				capacity-dmips-mhz = <1024>;
   137				performance-domains = <&cpufreq_p>;
   138				next-level-cache = <&l2_cache_1>;
   139				i-cache-size = <0x30000>;
   140				d-cache-size = <0x20000>;
   141			};
   142	
   143			cpu_p2: cpu@10102 {
   144				compatible = "apple,avalanche";
   145				device_type = "cpu";
   146				reg = <0x0 0x10102>;
   147				enable-method = "spin-table";
   148				cpu-release-addr = <0 0>; /* To be filled by loader */
   149				operating-points-v2 = <&pcluster_opp>;
   150				capacity-dmips-mhz = <1024>;
   151				performance-domains = <&cpufreq_p>;
   152				next-level-cache = <&l2_cache_1>;
   153				i-cache-size = <0x30000>;
   154				d-cache-size = <0x20000>;
   155			};
   156	
   157			cpu_p3: cpu@10103 {
   158				compatible = "apple,avalanche";
   159				device_type = "cpu";
   160				reg = <0x0 0x10103>;
   161				enable-method = "spin-table";
   162				cpu-release-addr = <0 0>; /* To be filled by loader */
   163				operating-points-v2 = <&pcluster_opp>;
   164				capacity-dmips-mhz = <1024>;
   165				performance-domains = <&cpufreq_p>;
   166				next-level-cache = <&l2_cache_1>;
   167				i-cache-size = <0x30000>;
   168				d-cache-size = <0x20000>;
   169			};
   170	
   171			l2_cache_0: l2-cache-0 {
   172				compatible = "cache";
   173				cache-level = <2>;
   174				cache-unified;
   175				cache-size = <0x400000>;
   176			};
   177	
   178			l2_cache_1: l2-cache-1 {
   179				compatible = "cache";
   180				cache-level = <2>;
   181				cache-unified;
   182				cache-size = <0x1000000>;
   183			};
   184		};
   185	
   186		ecluster_opp: opp-table-0 {
   187			compatible = "operating-points-v2";
   188			opp-shared;
   189	
   190			opp01 {
   191				opp-hz = /bits/ 64 <600000000>;
   192				opp-level = <1>;
   193				clock-latency-ns = <7500>;
   194			};
   195			opp02 {
   196				opp-hz = /bits/ 64 <912000000>;
   197				opp-level = <2>;
   198				clock-latency-ns = <20000>;
   199			};
   200			opp03 {
   201				opp-hz = /bits/ 64 <1284000000>;
   202				opp-level = <3>;
   203				clock-latency-ns = <22000>;
   204			};
   205			opp04 {
   206				opp-hz = /bits/ 64 <1752000000>;
   207				opp-level = <4>;
   208				clock-latency-ns = <30000>;
   209			};
   210			opp05 {
   211				opp-hz = /bits/ 64 <2004000000>;
   212				opp-level = <5>;
   213				clock-latency-ns = <35000>;
   214			};
   215			opp06 {
   216				opp-hz = /bits/ 64 <2256000000>;
   217				opp-level = <6>;
   218				clock-latency-ns = <39000>;
   219			};
   220			opp07 {
   221				opp-hz = /bits/ 64 <2424000000>;
   222				opp-level = <7>;
   223				clock-latency-ns = <53000>;
   224			};
   225		};
   226	
   227		pcluster_opp: opp-table-1 {
   228			compatible = "operating-points-v2";
   229			opp-shared;
   230	
   231			opp01 {
   232				opp-hz = /bits/ 64 <660000000>;
   233				opp-level = <1>;
   234				clock-latency-ns = <9000>;
   235			};
   236			opp02 {
   237				opp-hz = /bits/ 64 <924000000>;
   238				opp-level = <2>;
   239				clock-latency-ns = <19000>;
   240			};
   241			opp03 {
   242				opp-hz = /bits/ 64 <1188000000>;
   243				opp-level = <3>;
   244				clock-latency-ns = <22000>;
   245			};
   246			opp04 {
   247				opp-hz = /bits/ 64 <1452000000>;
   248				opp-level = <4>;
   249				clock-latency-ns = <24000>;
   250			};
   251			opp05 {
   252				opp-hz = /bits/ 64 <1704000000>;
   253				opp-level = <5>;
   254				clock-latency-ns = <26000>;
   255			};
   256			opp06 {
   257				opp-hz = /bits/ 64 <1968000000>;
   258				opp-level = <6>;
   259				clock-latency-ns = <28000>;
   260			};
   261			opp07 {
   262				opp-hz = /bits/ 64 <2208000000>;
   263				opp-level = <7>;
   264				clock-latency-ns = <30000>;
   265			};
   266			opp08 {
   267				opp-hz = /bits/ 64 <2400000000>;
   268				opp-level = <8>;
   269				clock-latency-ns = <33000>;
   270			};
   271			opp09 {
   272				opp-hz = /bits/ 64 <2568000000>;
   273				opp-level = <9>;
   274				clock-latency-ns = <34000>;
   275			};
   276			opp10 {
   277				opp-hz = /bits/ 64 <2724000000>;
   278				opp-level = <10>;
   279				clock-latency-ns = <36000>;
   280			};
   281			opp11 {
   282				opp-hz = /bits/ 64 <2868000000>;
   283				opp-level = <11>;
   284				clock-latency-ns = <41000>;
   285			};
   286			opp12 {
   287				opp-hz = /bits/ 64 <2988000000>;
   288				opp-level = <12>;
   289				clock-latency-ns = <42000>;
   290			};
   291			opp13 {
   292				opp-hz = /bits/ 64 <3096000000>;
   293				opp-level = <13>;
   294				clock-latency-ns = <44000>;
   295			};
   296			opp14 {
   297				opp-hz = /bits/ 64 <3204000000>;
   298				opp-level = <14>;
   299				clock-latency-ns = <46000>;
   300			};
   301			/* Not available until CPU deep sleep is implemented */
   302	#if 0
   303			opp15 {
   304				opp-hz = /bits/ 64 <3324000000>;
   305				opp-level = <15>;
   306				clock-latency-ns = <62000>;
   307				turbo-mode;
   308			};
   309			opp16 {
   310				opp-hz = /bits/ 64 <3408000000>;
   311				opp-level = <16>;
   312				clock-latency-ns = <62000>;
   313				turbo-mode;
   314			};
   315			opp17 {
   316				opp-hz = /bits/ 64 <3504000000>;
   317				opp-level = <17>;
   318				clock-latency-ns = <62000>;
   319				turbo-mode;
   320			};
   321	#endif
   322		};
   323	
   324		timer {
   325			compatible = "arm,armv8-timer";
   326			interrupt-parent = <&aic>;
   327			interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
   328			interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
   329				     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
   330				     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
   331				     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
   332		};
   333	
   334		pmu-e {
   335			compatible = "apple,blizzard-pmu";
   336			interrupt-parent = <&aic>;
   337			interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
   338		};
   339	
   340		pmu-p {
   341			compatible = "apple,avalanche-pmu";
   342			interrupt-parent = <&aic>;
   343			interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
   344		};
   345	
   346		clkref: clock-ref {
   347			compatible = "fixed-clock";
   348			#clock-cells = <0>;
   349			clock-frequency = <24000000>;
   350			clock-output-names = "clkref";
   351		};
   352	
   353		/*
   354		 * This is a fabulated representation of the input clock
   355		 * to NCO since we don't know the true clock tree.
   356		 */
   357		nco_clkref: clock-ref-nco {
   358			compatible = "fixed-clock";
   359			#clock-cells = <0>;
   360			clock-output-names = "nco_ref";
   361		};
   362	
   363		/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
   364		clk_disp0: clock-disp0 {
   365			compatible = "fixed-clock";
   366			#clock-cells = <0>;
   367			clock-frequency = <533333328>;
   368			clock-output-names = "clk_disp0";
   369		};
   370	
   371		soc {
   372			compatible = "simple-bus";
   373			#address-cells = <2>;
   374			#size-cells = <2>;
   375	
   376			ranges;
   377			nonposted-mmio;
   378	
   379			cpufreq_e: cpufreq@210e20000 {
   380				compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
   381				reg = <0x2 0x10e20000 0 0x1000>;
   382				#performance-domain-cells = <0>;
   383			};
   384	
   385			cpufreq_p: cpufreq@211e20000 {
   386				compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
   387				reg = <0x2 0x11e20000 0 0x1000>;
   388				#performance-domain-cells = <0>;
   389			};
   390	
   391			disp0_dart: iommu@231304000 {
   392				compatible = "apple,t8112-dart", "apple,t8110-dart";
   393				reg = <0x2 0x31304000 0x0 0x4000>;
   394				#iommu-cells = <1>;
   395				interrupt-parent = <&aic>;
   396				interrupts = <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>;
   397				status = "disabled";
   398			};
   399	
   400			dcp_dart: iommu@23130c000 {
   401				compatible = "apple,t8112-dart", "apple,t8110-dart";
   402				reg = <0x2 0x3130c000 0x0 0x4000>;
   403				#iommu-cells = <1>;
   404				interrupt-parent = <&aic>;
   405				interrupts = <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>;
   406			};
   407	
   408			dcp_mbox: mbox@231c08000 {
   409				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
   410				reg = <0x2 0x31c08000 0x0 0x4000>;
   411				interrupt-parent = <&aic>;
   412				interrupts = <AIC_IRQ 535 IRQ_TYPE_LEVEL_HIGH>,
   413					<AIC_IRQ 536 IRQ_TYPE_LEVEL_HIGH>,
   414					<AIC_IRQ 537 IRQ_TYPE_LEVEL_HIGH>,
   415					<AIC_IRQ 538 IRQ_TYPE_LEVEL_HIGH>;
   416				interrupt-names = "send-empty", "send-not-empty",
   417					"recv-empty", "recv-not-empty";
   418				#mbox-cells = <0>;
   419				power-domains = <&ps_disp0_cpu0>;
   420				resets = <&ps_disp0_cpu0>;
   421			};
   422	
   423			dcp: dcp@231c00000 {
   424				compatible = "apple,t8112-dcp", "apple,dcp";
   425				mboxes = <&dcp_mbox>;
   426				mbox-names = "mbox";
   427				iommus = <&dcp_dart 5>;
   428	
   429				/* the ADT has 2 additional regs which seems to be unused */
   430				reg-names = "coproc", "disp-0", "disp-1", "disp-2", "disp-3";
   431				reg = <0x2 0x31c00000 0x0 0x4000>,
   432					<0x2 0x30000000 0x0 0x61c000>,
   433					<0x2 0x31320000 0x0 0x4000>,
   434					<0x2 0x31344000 0x0 0x4000>,
   435					<0x2 0x31800000 0x0 0x800000>;
   436				apple,bw-scratch = <&pmgr_dcp 0 4 0x5d8>;
   437				power-domains = <&ps_disp0_cpu0>;
   438				clocks = <&clk_disp0>;
   439				apple,asc-dram-mask = <0x0 0x0>;
   440				phandle = <&dcp>;
   441	
   442				disp0_piodma: piodma {
   443					iommus = <&disp0_dart 4>;
   444					phandle = <&disp0_piodma>;
   445				};
   446			};
   447	
 > 448			display: display-subsystem {
   449				compatible = "apple,display-subsystem";
   450				/* disp_dart0 must be 1st since it is locked */
   451				iommus = <&disp0_dart 0>;
   452				/* generate phandle explicitly for use in loader */
   453				phandle = <&display>;
   454			};
   455	
   456			sio_dart: iommu@235004000 {
   457				compatible = "apple,t8110-dart";
   458				reg = <0x2 0x35004000 0x0 0x4000>;
   459				interrupt-parent = <&aic>;
   460				interrupts = <AIC_IRQ 769 IRQ_TYPE_LEVEL_HIGH>;
   461				#iommu-cells = <1>;
   462				power-domains = <&ps_sio_cpu>;
   463			};
   464	
   465			i2c0: i2c@235010000 {
   466				compatible = "apple,t8112-i2c", "apple,i2c";
   467				reg = <0x2 0x35010000 0x0 0x4000>;
   468				clocks = <&clkref>;
   469				interrupt-parent = <&aic>;
   470				interrupts = <AIC_IRQ 761 IRQ_TYPE_LEVEL_HIGH>;
   471				pinctrl-0 = <&i2c0_pins>;
   472				pinctrl-names = "default";
   473				#address-cells = <0x1>;
   474				#size-cells = <0x0>;
   475				power-domains = <&ps_i2c0>;
   476				status = "disabled";
   477			};
   478	
   479			i2c1: i2c@235014000 {
   480				compatible = "apple,t8112-i2c", "apple,i2c";
   481				reg = <0x2 0x35014000 0x0 0x4000>;
   482				clocks = <&clkref>;
   483				interrupt-parent = <&aic>;
   484				interrupts = <AIC_IRQ 762 IRQ_TYPE_LEVEL_HIGH>;
   485				pinctrl-0 = <&i2c1_pins>;
   486				pinctrl-names = "default";
   487				#address-cells = <0x1>;
   488				#size-cells = <0x0>;
   489				power-domains = <&ps_i2c1>;
   490				status = "disabled";
   491			};
   492	
   493			i2c2: i2c@235018000 {
   494				compatible = "apple,t8112-i2c", "apple,i2c";
   495				reg = <0x2 0x35018000 0x0 0x4000>;
   496				clocks = <&clkref>;
   497				interrupt-parent = <&aic>;
   498				interrupts = <AIC_IRQ 763 IRQ_TYPE_LEVEL_HIGH>;
   499				pinctrl-0 = <&i2c2_pins>;
   500				pinctrl-names = "default";
   501				#address-cells = <0x1>;
   502				#size-cells = <0x0>;
   503				power-domains = <&ps_i2c2>;
   504				status = "disabled";
   505			};
   506	
   507			i2c3: i2c@23501c000 {
   508				compatible = "apple,t8112-i2c", "apple,i2c";
   509				reg = <0x2 0x3501c000 0x0 0x4000>;
   510				clocks = <&clkref>;
   511				interrupt-parent = <&aic>;
   512				interrupts = <AIC_IRQ 764 IRQ_TYPE_LEVEL_HIGH>;
   513				pinctrl-0 = <&i2c3_pins>;
   514				pinctrl-names = "default";
   515				#address-cells = <0x1>;
   516				#size-cells = <0x0>;
   517				power-domains = <&ps_i2c3>;
   518				status = "disabled";
   519			};
   520	
   521			i2c4: i2c@235020000 {
   522				compatible = "apple,t8112-i2c", "apple,i2c";
   523				reg = <0x2 0x35020000 0x0 0x4000>;
   524				clocks = <&clkref>;
   525				interrupt-parent = <&aic>;
   526				interrupts = <AIC_IRQ 765 IRQ_TYPE_LEVEL_HIGH>;
   527				pinctrl-0 = <&i2c4_pins>;
   528				pinctrl-names = "default";
   529				#address-cells = <0x1>;
   530				#size-cells = <0x0>;
   531				power-domains = <&ps_i2c4>;
   532				status = "disabled";
   533			};
   534	
   535			fpwm1: pwm@235044000 {
   536				compatible = "apple,t8112-fpwm", "apple,s5l-fpwm";
   537				reg = <0x2 0x35044000 0x0 0x4000>;
   538				power-domains = <&ps_fpwm1>;
   539				clocks = <&clkref>;
   540				#pwm-cells = <2>;
   541				status = "disabled";
   542			};
   543	
   544			spi3: spi@23510c000 {
   545				compatible = "apple,t8112-spi", "apple,spi";
   546				reg = <0x2 0x3510c000 0x0 0x4000>;
   547				interrupt-parent = <&aic>;
   548				interrupts = <AIC_IRQ 751 IRQ_TYPE_LEVEL_HIGH>;
   549				clocks = <&clkref>;
   550				pinctrl-0 = <&spi3_pins>;
   551				pinctrl-names = "default";
   552				power-domains = <&ps_spi3>;
   553				#address-cells = <1>;
   554				#size-cells = <0>;
   555				status = "disabled";
   556			};
   557	
   558			serial0: serial@235200000 {
   559				compatible = "apple,s5l-uart";
   560				reg = <0x2 0x35200000 0x0 0x1000>;
   561				reg-io-width = <4>;
   562				interrupt-parent = <&aic>;
   563				interrupts = <AIC_IRQ 739 IRQ_TYPE_LEVEL_HIGH>;
   564				/*
   565				 * TODO: figure out the clocking properly, there may
   566				 * be a third selectable clock.
   567				 */
   568				clocks = <&clkref>, <&clkref>;
   569				clock-names = "uart", "clk_uart_baud0";
   570				power-domains = <&ps_uart0>;
   571				status = "disabled";
   572			};
   573	
   574			serial2: serial@235208000 {
   575				compatible = "apple,s5l-uart";
   576				reg = <0x2 0x35208000 0x0 0x1000>;
   577				reg-io-width = <4>;
   578				interrupt-parent = <&aic>;
   579				interrupts = <AIC_IRQ 741 IRQ_TYPE_LEVEL_HIGH>;
   580				clocks = <&clkref>, <&clkref>;
   581				clock-names = "uart", "clk_uart_baud0";
   582				power-domains = <&ps_uart2>;
   583				status = "disabled";
   584			};
   585	
   586			admac: dma-controller@238200000 {
   587				compatible = "apple,t8112-admac", "apple,admac";
   588				reg = <0x2 0x38200000 0x0 0x34000>;
   589				dma-channels = <24>;
   590				interrupts-extended = <0>,
   591						      <&aic AIC_IRQ 760 IRQ_TYPE_LEVEL_HIGH>,
   592						      <0>,
   593						      <0>;
   594				#dma-cells = <1>;
   595				iommus = <&sio_dart 2>;
   596				power-domains = <&ps_sio_adma>;
   597				resets = <&ps_audio_p>;
   598			};
   599	
   600			mca: i2s@238400000 {
   601				compatible = "apple,t8112-mca", "apple,mca";
   602				reg = <0x2 0x38400000 0x0 0x18000>,
   603				      <0x2 0x38300000 0x0 0x30000>;
   604	
   605				interrupt-parent = <&aic>;
   606				interrupts = <AIC_IRQ 753 IRQ_TYPE_LEVEL_HIGH>,
   607					     <AIC_IRQ 754 IRQ_TYPE_LEVEL_HIGH>,
   608					     <AIC_IRQ 755 IRQ_TYPE_LEVEL_HIGH>,
   609					     <AIC_IRQ 756 IRQ_TYPE_LEVEL_HIGH>,
   610					     <AIC_IRQ 757 IRQ_TYPE_LEVEL_HIGH>,
   611					     <AIC_IRQ 758 IRQ_TYPE_LEVEL_HIGH>;
   612	
   613				resets = <&ps_audio_p>;
   614				clocks = <&nco 0>, <&nco 1>, <&nco 2>,
   615					 <&nco 3>, <&nco 4>, <&nco 4>;
   616				power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
   617						<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
   618				dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
   619				       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
   620				       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
   621				       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
   622				       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
   623				       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
   624				dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
   625					    "tx1a", "rx1a", "tx1b", "rx1b",
   626					    "tx2a", "rx2a", "tx2b", "rx2b",
   627					    "tx3a", "rx3a", "tx3b", "rx3b",
   628					    "tx4a", "rx4a", "tx4b", "rx4b",
   629					    "tx5a", "rx5a", "tx5b", "rx5b";
   630	
   631				#sound-dai-cells = <1>;
   632			};
   633	
   634			nco: clock-controller@23b044000 {
   635				compatible = "apple,t8112-nco", "apple,nco";
   636				reg = <0x2 0x3b044000 0x0 0x14000>;
   637				clocks = <&nco_clkref>;
   638				#clock-cells = <1>;
   639			};
   640	
   641			aic: interrupt-controller@23b0c0000 {
   642				compatible = "apple,t8112-aic", "apple,aic2";
   643				#interrupt-cells = <3>;
   644				interrupt-controller;
   645				reg = <0x2 0x3b0c0000 0x0 0x8000>,
   646					<0x2 0x3b0c8000 0x0 0x4>;
   647				reg-names = "core", "event";
   648				power-domains = <&ps_aic>;
   649	
   650				affinities {
   651					e-core-pmu-affinity {
   652						apple,fiq-index = <AIC_CPU_PMU_E>;
   653						cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
   654					};
   655	
   656					p-core-pmu-affinity {
   657						apple,fiq-index = <AIC_CPU_PMU_P>;
   658						cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
   659					};
   660				};
   661			};
   662	
   663			pmgr: power-management@23b700000 {
   664				compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
   665				#address-cells = <1>;
   666				#size-cells = <1>;
   667				reg = <0x2 0x3b700000 0 0x14000>;
   668				/* child nodes are added in t8103-pmgr.dtsi */
   669			};
   670	
   671			pmgr_dcp: power-management@23b3d0000 {
   672				reg = <0x2 0x3b3d0000 0x0 0x4000>;
   673				reg-names = "dcp-bw-scratch";
   674				#apple,bw-scratch-cells = <3>;
   675			};
   676	
   677			pinctrl_ap: pinctrl@23c100000 {
   678				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
   679				reg = <0x2 0x3c100000 0x0 0x100000>;
   680				power-domains = <&ps_gpio>;
   681	
   682				gpio-controller;
   683				#gpio-cells = <2>;
   684				gpio-ranges = <&pinctrl_ap 0 0 213>;
   685				apple,npins = <213>;
   686	
   687				interrupt-controller;
   688				#interrupt-cells = <2>;
   689				interrupt-parent = <&aic>;
   690				interrupts = <AIC_IRQ 199 IRQ_TYPE_LEVEL_HIGH>,
   691					     <AIC_IRQ 200 IRQ_TYPE_LEVEL_HIGH>,
   692					     <AIC_IRQ 201 IRQ_TYPE_LEVEL_HIGH>,
   693					     <AIC_IRQ 202 IRQ_TYPE_LEVEL_HIGH>,
   694					     <AIC_IRQ 203 IRQ_TYPE_LEVEL_HIGH>,
   695					     <AIC_IRQ 204 IRQ_TYPE_LEVEL_HIGH>,
   696					     <AIC_IRQ 205 IRQ_TYPE_LEVEL_HIGH>;
   697	
   698				i2c0_pins: i2c0-pins {
   699					pinmux = <APPLE_PINMUX(111, 1)>,
   700						 <APPLE_PINMUX(110, 1)>;
   701				};
   702	
   703				i2c1_pins: i2c1-pins {
   704					pinmux = <APPLE_PINMUX(113, 1)>,
   705						 <APPLE_PINMUX(112, 1)>;
   706				};
   707	
   708				i2c2_pins: i2c2-pins {
   709					pinmux = <APPLE_PINMUX(87, 1)>,
   710						 <APPLE_PINMUX(86, 1)>;
   711				};
   712	
   713				i2c3_pins: i2c3-pins {
   714					pinmux = <APPLE_PINMUX(54, 1)>,
   715						 <APPLE_PINMUX(53, 1)>;
   716				};
   717	
   718				i2c4_pins: i2c4-pins {
   719					pinmux = <APPLE_PINMUX(131, 1)>,
   720						 <APPLE_PINMUX(130, 1)>;
   721				};
   722	
   723				spi3_pins: spi3-pins {
   724					pinmux = <APPLE_PINMUX(93, 1)>,
   725						<APPLE_PINMUX(94, 1)>,
   726						<APPLE_PINMUX(95, 1)>,
   727						<APPLE_PINMUX(96, 1)>;
   728				};
   729	
   730				pcie_pins: pcie-pins {
   731					pinmux = <APPLE_PINMUX(162, 1)>,
   732						 <APPLE_PINMUX(163, 1)>,
   733						 <APPLE_PINMUX(164, 1)>;
   734					// TODO: 1 more CLKREQs
   735				};
   736			};
   737	
   738			nub_spmi: spmi@23d0d9300 {
   739				compatible = "apple,t8112-spmi", "apple,spmi";
   740				reg = <0x2 0x3d714000 0x0 0x100>;
   741				#address-cells = <2>;
   742				#size-cells = <0>;
   743				interrupt-parent = <&aic>;
   744				interrupts = <AIC_IRQ 256 IRQ_TYPE_LEVEL_HIGH>,
   745					<AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>;
   746	
   747				pmu1: pmu@e {
   748					compatible = "apple,stowe-pmu", "apple,spmi-pmu";
   749					reg = <0xe SPMI_USID>;
   750					#address-cells = <1>;
   751					#size-cells = <1>;
   752	
   753					rtc_nvmem@f800 {
   754						compatible = "apple,spmi-pmu-nvmem";
   755						reg = <0xf800 0x300>;
   756						#address-cells = <1>;
   757						#size-cells = <1>;
   758	
   759						pm_setting: pm-setting@1 {
   760							reg = <0x1 0x1>;
   761						};
   762	
   763						rtc_offset: rtc-offset@100 {
   764							reg = <0x100 0x6>;
   765						};
   766					};
   767	
   768					legacy_nvmem@f700 {
   769						compatible = "apple,spmi-pmu-nvmem";
   770						reg = <0xf700 0x20>;
   771						#address-cells = <1>;
   772						#size-cells = <1>;
   773	
   774						boot_stage: boot-stage@1 {
   775							reg = <0x1 0x1>;
   776						};
   777	
   778						boot_error_count: boot-error-count@2 {
   779							reg = <0x2 0x1>;
   780							bits = <0 4>;
   781						};
   782	
   783						panic_count: panic-count@2 {
   784							reg = <0x2 0x1>;
   785							bits = <4 4>;
   786						};
   787	
   788						boot_error_stage: boot-error-stage@3 {
   789							reg = <0x3 0x1>;
   790						};
   791	
   792						shutdown_flag: shutdown-flag@f {
   793							reg = <0xf 0x1>;
   794							bits = <3 1>;
   795						};
   796					};
   797	
   798					scrpad_nvmem@8000 {
   799						compatible = "apple,spmi-pmu-nvmem";
   800						reg = <0x8000 0x2800>;
   801						#address-cells = <1>;
   802						#size-cells = <1>;
   803	
   804						fault_shadow: fault-shadow@67b {
   805							reg = <0x67b 0x10>;
   806						};
   807	
   808						socd: socd@b00 {
   809							reg = <0xb00 0x400>;
   810						};
   811					};
   812	
   813				};
   814			};
   815	
   816			pinctrl_nub: pinctrl@23d1f0000 {
   817				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
   818				reg = <0x2 0x3d1f0000 0x0 0x4000>;
   819				power-domains = <&ps_nub_gpio>;
   820	
   821				gpio-controller;
   822				#gpio-cells = <2>;
   823				gpio-ranges = <&pinctrl_nub 0 0 24>;
   824				apple,npins = <24>;
   825	
   826				interrupt-controller;
   827				#interrupt-cells = <2>;
   828				interrupt-parent = <&aic>;
   829				interrupts = <AIC_IRQ 371 IRQ_TYPE_LEVEL_HIGH>,
   830					     <AIC_IRQ 372 IRQ_TYPE_LEVEL_HIGH>,
   831					     <AIC_IRQ 373 IRQ_TYPE_LEVEL_HIGH>,
   832					     <AIC_IRQ 374 IRQ_TYPE_LEVEL_HIGH>,
   833					     <AIC_IRQ 375 IRQ_TYPE_LEVEL_HIGH>,
   834					     <AIC_IRQ 376 IRQ_TYPE_LEVEL_HIGH>,
   835					     <AIC_IRQ 377 IRQ_TYPE_LEVEL_HIGH>;
   836			};
   837	
   838			pmgr_mini: power-management@23d280000 {
   839				compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
   840				#address-cells = <1>;
   841				#size-cells = <1>;
   842				reg = <0x2 0x3d280000 0 0x4000>;
   843				/* child nodes are added in t8103-pmgr.dtsi */
   844			};
   845	
   846			wdt: watchdog@23d2b0000 {
   847				compatible = "apple,t8112-wdt", "apple,wdt";
   848				reg = <0x2 0x3d2b0000 0x0 0x4000>;
   849				clocks = <&clkref>;
   850				interrupt-parent = <&aic>;
   851				interrupts = <AIC_IRQ 379 IRQ_TYPE_LEVEL_HIGH>;
   852			};
   853	
   854			efuse@23d2c8000 {
   855				compatible = "apple,t8112-efuses", "apple,efuses";
   856				reg = <0x2 0x3d2c8000 0x0 0x1000>;
   857				#address-cells = <1>;
   858				#size-cells = <1>;
   859	
   860				atcphy0_auspll_rodco_bias_adjust: efuse@480,20 {
   861					reg = <0x480 4>;
   862					bits = <20 3>;
   863				};
   864	
   865				atcphy0_auspll_rodco_encap: efuse@480,23 {
   866					reg = <0x480 4>;
   867					bits = <23 2>;
   868				};
   869	
   870				atcphy0_auspll_dtc_vreg_adjust: efuse@480,25 {
   871					reg = <0x480 4>;
   872					bits = <25 3>;
   873				};
   874	
   875				atcphy0_auspll_fracn_dll_start_capcode: efuse@480,28 {
   876					reg = <0x480 4>;
   877					bits = <28 2>;
   878				};
   879	
   880				atcphy0_aus_cmn_shm_vreg_trim: efuse@480,30 {
   881					reg = <0x480 8>;
   882					bits = <30 5>;
   883				};
   884	
   885				atcphy0_cio3pll_dco_coarsebin0: efuse@484,3 {
   886					reg = <0x484 4>;
   887					bits = <3 6>;
   888				};
   889	
   890				atcphy0_cio3pll_dco_coarsebin1: efuse@484,9 {
   891					reg = <0x484 4>;
   892					bits = <9 6>;
   893				};
   894	
   895				atcphy0_cio3pll_dll_start_capcode: efuse@484,15 {
   896					reg = <0x484 4>;
   897					bits = <15 2>;
   898				};
   899	
   900				atcphy0_cio3pll_dtc_vreg_adjust: efuse@484,17 {
   901					reg = <0x484 0x4>;
   902					bits = <17 3>;
   903				};
   904	
   905				atcphy1_auspll_rodco_bias_adjust: efuse@484,30 {
   906					reg = <0x484 8>;
   907					bits = <30 3>;
   908				};
   909	
   910				atcphy1_auspll_rodco_encap: efuse@488,1 {
   911					reg = <0x488 8>;
   912					bits = <1 2>;
   913				};
   914	
   915				atcphy1_auspll_dtc_vreg_adjust: efuse@488,3 {
   916					reg = <0x488 4>;
   917					bits = <3 3>;
   918				};
   919	
   920				atcphy1_auspll_fracn_dll_start_capcode: efuse@488,6 {
   921					reg = <0x488 4>;
   922					bits = <6 2>;
   923				};
   924	
   925				atcphy1_aus_cmn_shm_vreg_trim: efuse@488,8 {
   926					reg = <0x488 4>;
   927					bits = <8 5>;
   928				};
   929	
   930				atcphy1_cio3pll_dco_coarsebin0: efuse@488,13 {
   931					reg = <0x488 4>;
   932					bits = <13 6>;
   933				};
   934	
   935				atcphy1_cio3pll_dco_coarsebin1: efuse@488,19 {
   936					reg = <0x488 4>;
   937					bits = <19 6>;
   938				};
   939	
   940				atcphy1_cio3pll_dll_start_capcode: efuse@488,25 {
   941					reg = <0x488 4>;
   942					bits = <25 2>;
   943				};
   944	
   945				atcphy1_cio3pll_dtc_vreg_adjust: efuse@488,27 {
   946					reg = <0x488 0x4>;
   947					bits = <27 3>;
   948				};
   949			};
   950	
   951			smc_mbox: mbox@23e408000 {
   952				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
   953				reg = <0x2 0x3e408000 0x0 0x4000>;
   954				interrupt-parent = <&aic>;
   955				interrupts = <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>,
   956					<AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
   957					<AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
   958					<AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>;
   959				interrupt-names = "send-empty", "send-not-empty",
   960					"recv-empty", "recv-not-empty";
   961				#mbox-cells = <0>;
   962			};
   963	
   964			smc: smc@23e400000 {
   965				compatible = "apple,t8112-smc", "apple,smc";
   966				reg = <0x2 0x3e400000 0x0 0x4000>,
   967					<0x2 0x3fe00000 0x0 0x100000>;
   968				reg-names = "smc", "sram";
   969				mboxes = <&smc_mbox>;
   970	
   971				smc_gpio: gpio {
   972					gpio-controller;
   973					#gpio-cells = <2>;
   974				};
   975	
   976				smc_rtc: rtc {
   977					nvmem-cells = <&rtc_offset>;
   978					nvmem-cell-names = "rtc_offset";
   979				};
   980	
   981				smc_reboot: reboot {
   982					nvmem-cells = <&shutdown_flag>, <&boot_stage>,
   983						<&boot_error_count>, <&panic_count>, <&pm_setting>;
   984					nvmem-cell-names = "shutdown_flag", "boot_stage",
   985						"boot_error_count", "panic_count", "pm_setting";
   986				};
   987			};
   988	
   989			pinctrl_smc: pinctrl@23e820000 {
   990				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
   991				reg = <0x2 0x3e820000 0x0 0x4000>;
   992	
   993				gpio-controller;
   994				#gpio-cells = <2>;
   995				gpio-ranges = <&pinctrl_smc 0 0 18>;
   996				apple,npins = <18>;
   997	
   998				interrupt-controller;
   999				#interrupt-cells = <2>;
  1000				interrupt-parent = <&aic>;
  1001				interrupts = <AIC_IRQ 490 IRQ_TYPE_LEVEL_HIGH>,
  1002					     <AIC_IRQ 491 IRQ_TYPE_LEVEL_HIGH>,
  1003					     <AIC_IRQ 492 IRQ_TYPE_LEVEL_HIGH>,
  1004					     <AIC_IRQ 493 IRQ_TYPE_LEVEL_HIGH>,
  1005					     <AIC_IRQ 494 IRQ_TYPE_LEVEL_HIGH>,
  1006					     <AIC_IRQ 495 IRQ_TYPE_LEVEL_HIGH>,
  1007					     <AIC_IRQ 496 IRQ_TYPE_LEVEL_HIGH>;
  1008			};
  1009	
  1010			pinctrl_aop: pinctrl@24a820000 {
  1011				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
  1012				reg = <0x2 0x4a820000 0x0 0x4000>;
  1013	
  1014				gpio-controller;
  1015				#gpio-cells = <2>;
  1016				gpio-ranges = <&pinctrl_aop 0 0 54>;
  1017				apple,npins = <54>;
  1018	
  1019				interrupt-controller;
  1020				#interrupt-cells = <2>;
  1021				interrupt-parent = <&aic>;
  1022				interrupts = <AIC_IRQ 301 IRQ_TYPE_LEVEL_HIGH>,
  1023					     <AIC_IRQ 302 IRQ_TYPE_LEVEL_HIGH>,
  1024					     <AIC_IRQ 303 IRQ_TYPE_LEVEL_HIGH>,
  1025					     <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>,
  1026					     <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>,
  1027					     <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>,
  1028					     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
  1029			};
  1030	
  1031			mtp: mtp@24e400000 {
  1032				compatible = "apple,t8112-mtp", "apple,t8112-rtk-helper-asc4", "apple,mtp", "apple,rtk-helper-asc4";
  1033				reg = <0x2 0x4e400000 0x0 0x4000>,
  1034					<0x2 0x4ec00000 0x0 0x100000>;
  1035				reg-names = "asc", "sram";
  1036				mboxes = <&mtp_mbox>;
  1037				iommus = <&mtp_dart 1>;
  1038				#helper-cells = <0>;
  1039	
  1040				status = "disabled";
  1041			};
  1042	
  1043			mtp_mbox: mbox@24e408000 {
  1044				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
  1045				reg = <0x2 0x4e408000 0x0 0x4000>;
  1046				interrupt-parent = <&aic>;
  1047				interrupts = <AIC_IRQ 864 IRQ_TYPE_LEVEL_HIGH>,
  1048					<AIC_IRQ 865 IRQ_TYPE_LEVEL_HIGH>,
  1049					<AIC_IRQ 866 IRQ_TYPE_LEVEL_HIGH>,
  1050					<AIC_IRQ 867 IRQ_TYPE_LEVEL_HIGH>;
  1051				interrupt-names = "send-empty", "send-not-empty",
  1052					"recv-empty", "recv-not-empty";
  1053				#mbox-cells = <0>;
  1054	
  1055				status = "disabled";
  1056			};
  1057	
  1058			mtp_dart: iommu@24e808000 {
  1059				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1060				reg = <0x2 0x4e808000 0x0 0x4000>;
  1061				interrupt-parent = <&aic>;
  1062				interrupts = <AIC_IRQ 848 IRQ_TYPE_LEVEL_HIGH>;
  1063				#iommu-cells = <1>;
  1064	
  1065				status = "disabled";
  1066			};
  1067	
  1068			mtp_dockchannel: fifo@24eb14000 {
  1069				compatible = "apple,t8112-dockchannel", "apple,dockchannel";
  1070				reg = <0x2 0x4eb14000 0x0 0x4000>;
  1071				reg-names = "irq";
  1072				interrupt-parent = <&aic>;
  1073				interrupts = <AIC_IRQ 850 IRQ_TYPE_LEVEL_HIGH>;
  1074	
  1075				ranges = <0 0x2 0x4eb28000 0x20000>;
  1076				#address-cells = <1>;
  1077				#size-cells = <1>;
  1078	
  1079				interrupt-controller;
  1080				#interrupt-cells = <2>;
  1081	
  1082				status = "disabled";
  1083	
  1084				mtp_hid: input@8000 {
  1085					compatible = "apple,dockchannel-hid";
  1086					reg = <0x8000 0x4000>,
  1087						<0xc000 0x4000>,
  1088						<0x0000 0x4000>,
  1089						<0x4000 0x4000>;
  1090					reg-names = "config", "data",
  1091						"rmt-config", "rmt-data";
  1092					iommus = <&mtp_dart 1>;
  1093					interrupt-parent = <&mtp_dockchannel>;
  1094					interrupts = <2 IRQ_TYPE_LEVEL_HIGH>,
  1095						<3 IRQ_TYPE_LEVEL_HIGH>;
  1096					interrupt-names = "tx", "rx";
  1097	
  1098					apple,fifo-size = <0x800>;
  1099					apple,helper-cpu = <&mtp>;
  1100				};
  1101	
  1102			};
  1103	
  1104			ans_mbox: mbox@277408000 {
  1105				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
  1106				reg = <0x2 0x77408000 0x0 0x4000>;
  1107				interrupt-parent = <&aic>;
  1108				interrupts = <AIC_IRQ 717 IRQ_TYPE_LEVEL_HIGH>,
  1109					<AIC_IRQ 718 IRQ_TYPE_LEVEL_HIGH>,
  1110					<AIC_IRQ 719 IRQ_TYPE_LEVEL_HIGH>,
  1111					<AIC_IRQ 720 IRQ_TYPE_LEVEL_HIGH>;
  1112				interrupt-names = "send-empty", "send-not-empty",
  1113					"recv-empty", "recv-not-empty";
  1114				#mbox-cells = <0>;
  1115				power-domains = <&ps_ans>;
  1116			};
  1117	
  1118			sart: sart@27bc50000 {
  1119				compatible = "apple,t8112-sart", "apple,t6000-sart";
  1120				reg = <0x2 0x7bc50000 0x0 0x10000>;
  1121				power-domains = <&ps_ans>;
  1122			};
  1123	
  1124			nvme@27bcc0000 {
  1125				compatible = "apple,t8112-nvme-ans2", "apple,nvme-ans2";
  1126				reg = <0x2 0x7bcc0000 0x0 0x40000>,
  1127					<0x2 0x77400000 0x0 0x4000>;
  1128				reg-names = "nvme", "ans";
  1129				interrupt-parent = <&aic>;
  1130				interrupts = <AIC_IRQ 724 IRQ_TYPE_LEVEL_HIGH>;
  1131				mboxes = <&ans_mbox>;
  1132				apple,sart = <&sart>;
  1133				power-domains = <&ps_ans>, <&ps_apcie_st>;
  1134				power-domain-names = "ans", "apcie0";
  1135				resets = <&ps_ans>;
  1136			};
  1137	
  1138			dwc3_0: usb@382280000 {
  1139				compatible = "apple,t8112-dwc3", "apple,dwc3", "snps,dwc3";
  1140				reg = <0x3 0x82280000 0x0 0x100000>;
  1141				interrupt-parent = <&aic>;
  1142				interrupts = <AIC_IRQ 1031 IRQ_TYPE_LEVEL_HIGH>;
  1143				dr_mode = "otg";
  1144				usb-role-switch;
  1145				role-switch-default-mode = "host";
  1146				iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
  1147				power-domains = <&ps_atc0_usb>;
  1148				resets = <&atcphy0>;
  1149				phys = <&atcphy0 PHY_TYPE_USB2>, <&atcphy0 PHY_TYPE_USB3>;
  1150				phy-names = "usb2-phy", "usb3-phy";
  1151			};
  1152	
  1153			dwc3_0_dart_0: iommu@382f00000 {
  1154				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1155				reg = <0x3 0x82f00000 0x0 0x4000>;
  1156				interrupt-parent = <&aic>;
  1157				interrupts = <AIC_IRQ 1035 IRQ_TYPE_LEVEL_HIGH>;
  1158				#iommu-cells = <1>;
  1159				power-domains = <&ps_atc0_usb>;
  1160			};
  1161	
  1162			dwc3_0_dart_1: iommu@382f80000 {
  1163				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1164				reg = <0x3 0x82f80000 0x0 0x4000>;
  1165				interrupt-parent = <&aic>;
  1166				interrupts = <AIC_IRQ 1035 IRQ_TYPE_LEVEL_HIGH>;
  1167				#iommu-cells = <1>;
  1168				power-domains = <&ps_atc0_usb>;
  1169			};
  1170	
  1171			atcphy0: phy@383000000 {
  1172				compatible = "apple,t8112-atcphy", "apple,t8103-atcphy";
  1173				reg = <0x3 0x83000000 0x0 0x4c000>,
  1174					<0x3 0x83050000 0x0 0x8000>,
  1175					<0x3 0x80000000 0x0 0x4000>,
  1176					<0x3 0x82a90000 0x0 0x4000>,
  1177					<0x3 0x82a84000 0x0 0x4000>;
  1178				reg-names = "core", "lpdptx", "axi2af", "usb2phy",
  1179					"pipehandler";
  1180	
  1181				#phy-cells = <1>;
  1182				#reset-cells = <0>;
  1183	
  1184				nvmem-cells = <&atcphy0_aus_cmn_shm_vreg_trim>,
  1185					<&atcphy0_auspll_rodco_encap>,
  1186					<&atcphy0_auspll_rodco_bias_adjust>,
  1187					<&atcphy0_auspll_fracn_dll_start_capcode>,
  1188					<&atcphy0_auspll_dtc_vreg_adjust>,
  1189					<&atcphy0_cio3pll_dco_coarsebin0>,
  1190					<&atcphy0_cio3pll_dco_coarsebin1>,
  1191					<&atcphy0_cio3pll_dll_start_capcode>,
  1192					<&atcphy0_cio3pll_dtc_vreg_adjust>;
  1193				nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
  1194					"auspll_rodco_encap",
  1195					"auspll_rodco_bias_adjust",
  1196					"auspll_fracn_dll_start_capcode",
  1197					"auspll_dtc_vreg_adjust",
  1198					"cio3pll_dco_coarsebin0",
  1199					"cio3pll_dco_coarsebin1",
  1200					"cio3pll_dll_start_capcode",
  1201					"cio3pll_dtc_vreg_adjust";
  1202	
  1203				orientation-switch;
  1204				mode-switch;
  1205				svid = <0xff01>, <0x8087>;
  1206				power-domains = <&ps_atc0_usb>;
  1207			};
  1208	
  1209			dwc3_1: usb@502280000 {
  1210				compatible = "apple,t8112-dwc3", "apple,dwc3", "snps,dwc3";
  1211				reg = <0x5 0x02280000 0x0 0x100000>;
  1212				interrupt-parent = <&aic>;
  1213				interrupts = <AIC_IRQ 1112 IRQ_TYPE_LEVEL_HIGH>;
  1214				dr_mode = "otg";
  1215				usb-role-switch;
  1216				role-switch-default-mode = "host";
  1217				iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
  1218				power-domains = <&ps_atc1_usb>;
  1219				resets = <&atcphy1>;
  1220				phys = <&atcphy1 PHY_TYPE_USB2>, <&atcphy1 PHY_TYPE_USB3>;
  1221				phy-names = "usb2-phy", "usb3-phy";
  1222			};
  1223	
  1224			dwc3_1_dart_0: iommu@502f00000 {
  1225				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1226				reg = <0x5 0x02f00000 0x0 0x4000>;
  1227				interrupt-parent = <&aic>;
  1228				interrupts = <AIC_IRQ 1116 IRQ_TYPE_LEVEL_HIGH>;
  1229				#iommu-cells = <1>;
  1230				power-domains = <&ps_atc1_usb>;
  1231			};
  1232	
  1233			dwc3_1_dart_1: iommu@502f80000 {
  1234				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1235				reg = <0x5 0x02f80000 0x0 0x4000>;
  1236				interrupt-parent = <&aic>;
  1237				interrupts = <AIC_IRQ 1116 IRQ_TYPE_LEVEL_HIGH>;
  1238				#iommu-cells = <1>;
  1239				power-domains = <&ps_atc1_usb>;
  1240			};
  1241	
  1242			atcphy1: phy@503000000 {
  1243				compatible = "apple,t8112-atcphy", "apple,t8103-atcphy";
  1244				reg = <0x5 0x03000000 0x0 0x4c000>,
  1245					<0x5 0x03050000 0x0 0x8000>,
  1246					<0x5 0x0 0x0 0x4000>,
  1247					<0x5 0x02a90000 0x0 0x4000>,
  1248					<0x5 0x02a84000 0x0 0x4000>;
  1249				reg-names = "core", "lpdptx", "axi2af", "usb2phy",
  1250					"pipehandler";
  1251	
  1252				nvmem-cells = <&atcphy1_aus_cmn_shm_vreg_trim>,
  1253					<&atcphy1_auspll_rodco_encap>,
  1254					<&atcphy1_auspll_rodco_bias_adjust>,
  1255					<&atcphy1_auspll_fracn_dll_start_capcode>,
  1256					<&atcphy1_auspll_dtc_vreg_adjust>,
  1257					<&atcphy1_cio3pll_dco_coarsebin0>,
  1258					<&atcphy1_cio3pll_dco_coarsebin1>,
  1259					<&atcphy1_cio3pll_dll_start_capcode>,
  1260					<&atcphy1_cio3pll_dtc_vreg_adjust>;
  1261				nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
  1262					"auspll_rodco_encap",
  1263					"auspll_rodco_bias_adjust",
  1264					"auspll_fracn_dll_start_capcode",
  1265					"auspll_dtc_vreg_adjust",
  1266					"cio3pll_dco_coarsebin0",
  1267					"cio3pll_dco_coarsebin1",
  1268					"cio3pll_dll_start_capcode",
  1269					"cio3pll_dtc_vreg_adjust";
  1270	
  1271				#phy-cells = <1>;
  1272				#reset-cells = <0>;
  1273	
  1274				orientation-switch;
  1275				mode-switch;
  1276				svid = <0xff01>, <0x8087>;
  1277				power-domains = <&ps_atc1_usb>;
  1278			};
  1279	
  1280			pcie0_dart: iommu@681008000 {
  1281				compatible = "apple,t8110-dart";
  1282				reg = <0x6 0x81008000 0x0 0x4000>;
  1283				#iommu-cells = <1>;
  1284				interrupt-parent = <&aic>;
  1285				interrupts = <AIC_IRQ 782 IRQ_TYPE_LEVEL_HIGH>;
  1286				power-domains = <&ps_apcie_gp>;
  1287			};
  1288	
  1289			pcie1_dart: iommu@682008000 {
  1290				compatible = "apple,t8110-dart";
  1291				reg = <0x6 0x82008000 0x0 0x4000>;
  1292				#iommu-cells = <1>;
  1293				interrupt-parent = <&aic>;
  1294				interrupts = <AIC_IRQ 785 IRQ_TYPE_LEVEL_HIGH>;
  1295				power-domains = <&ps_apcie_gp>;
  1296				status = "disabled";
  1297			};
  1298	
  1299			pcie2_dart: iommu@683008000 {
  1300				compatible = "apple,t8110-dart";
  1301				reg = <0x6 0x83008000 0x0 0x4000>;
  1302				#iommu-cells = <1>;
  1303				interrupt-parent = <&aic>;
  1304				interrupts = <AIC_IRQ 788 IRQ_TYPE_LEVEL_HIGH>;
  1305				power-domains = <&ps_apcie_gp>;
  1306				status = "disabled";
  1307			};
  1308	
  1309			pcie3_dart: iommu@684008000 {
  1310				compatible = "apple,t8110-dart";
  1311				reg = <0x6 0x84008000 0x0 0x4000>;
  1312				#iommu-cells = <1>;
  1313				interrupt-parent = <&aic>;
  1314				interrupts = <AIC_IRQ 791 IRQ_TYPE_LEVEL_HIGH>;
  1315				power-domains = <&ps_apcie_gp>;
  1316				status = "disabled";
  1317			};
  1318	
  1319			pcie0: pcie@690000000 {
  1320				compatible = "apple,t8112-pcie", "apple,pcie";
  1321				device_type = "pci";
  1322	
  1323				reg = <0x6 0x90000000 0x0 0x1000000>,
  1324				      <0x6 0x80000000 0x0 0x100000>,
  1325				      <0x6 0x81000000 0x0 0x4000>,
  1326				      <0x6 0x82000000 0x0 0x4000>,
  1327				      <0x6 0x83000000 0x0 0x4000>,
  1328				      <0x6 0x84000000 0x0 0x4000>;
  1329				reg-names = "config", "rc", "port0", "port1", "port2", "port3";
  1330	
  1331				interrupt-parent = <&aic>;
  1332				interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>,
  1333					     <AIC_IRQ 784 IRQ_TYPE_LEVEL_HIGH>,
  1334					     <AIC_IRQ 787 IRQ_TYPE_LEVEL_HIGH>,
  1335					     <AIC_IRQ 790 IRQ_TYPE_LEVEL_HIGH>;
  1336	
  1337				msi-controller;
  1338				msi-parent = <&pcie0>;
  1339				msi-ranges = <&aic AIC_IRQ 793 IRQ_TYPE_EDGE_RISING 32>;
  1340	
  1341				iommu-map = <0x100 &pcie0_dart 0 1>,
  1342					    <0x200 &pcie1_dart 1 1>,
  1343					    <0x300 &pcie2_dart 2 1>,
  1344					    <0x400 &pcie3_dart 3 1>;
  1345				iommu-map-mask = <0xff00>;
  1346	
  1347				bus-range = <0 4>;
  1348				#address-cells = <3>;
  1349				#size-cells = <2>;
  1350				ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
  1351					 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
  1352	
  1353				power-domains = <&ps_apcie_gp>;
  1354				pinctrl-0 = <&pcie_pins>;
  1355				pinctrl-names = "default";
  1356	
  1357				port00: pci@0,0 {
  1358					device_type = "pci";
  1359					reg = <0x0 0x0 0x0 0x0 0x0>;
  1360					reset-gpios = <&pinctrl_ap 166 GPIO_ACTIVE_LOW>;
  1361	
  1362					#address-cells = <3>;
  1363					#size-cells = <2>;
  1364					ranges;
  1365	
  1366					interrupt-controller;
  1367					#interrupt-cells = <1>;
  1368	
  1369					interrupt-map-mask = <0 0 0 7>;
  1370					interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
  1371							<0 0 0 2 &port00 0 0 0 1>,
  1372							<0 0 0 3 &port00 0 0 0 2>,
  1373							<0 0 0 4 &port00 0 0 0 3>;
  1374				};
  1375	
  1376				port01: pci@1,0 {
  1377					device_type = "pci";
  1378					reg = <0x800 0x0 0x0 0x0 0x0>;
  1379					reset-gpios = <&pinctrl_ap 167 GPIO_ACTIVE_LOW>;
  1380	
  1381					#address-cells = <3>;
  1382					#size-cells = <2>;
  1383					ranges;
  1384	
  1385					interrupt-controller;
  1386					#interrupt-cells = <1>;
  1387	
  1388					interrupt-map-mask = <0 0 0 7>;
  1389					interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
  1390							<0 0 0 2 &port01 0 0 0 1>,
  1391							<0 0 0 3 &port01 0 0 0 2>,
  1392							<0 0 0 4 &port01 0 0 0 3>;
  1393	
  1394					status = "disabled";
  1395				};
  1396	
  1397				port02: pci@2,0 {
  1398					device_type = "pci";
  1399					reg = <0x1000 0x0 0x0 0x0 0x0>;
  1400					reset-gpios = <&pinctrl_ap 168 GPIO_ACTIVE_LOW>;
  1401	
  1402					#address-cells = <3>;
  1403					#size-cells = <2>;
  1404					ranges;
  1405	
  1406					interrupt-controller;
  1407					#interrupt-cells = <1>;
  1408	
  1409					interrupt-map-mask = <0 0 0 7>;
  1410					interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
  1411							<0 0 0 2 &port02 0 0 0 1>,
  1412							<0 0 0 3 &port02 0 0 0 2>,
  1413							<0 0 0 4 &port02 0 0 0 3>;
  1414	
  1415					status = "disabled";
  1416				};
  1417	
  1418				/* TODO: GPIO unknown */
  1419				port03: pci@3,0 {
  1420					device_type = "pci";
  1421					reg = <0x1800 0x0 0x0 0x0 0x0>;
  1422					//reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
  1423	
  1424					#address-cells = <3>;
  1425					#size-cells = <2>;
  1426					ranges;
  1427	
  1428					interrupt-controller;
  1429					#interrupt-cells = <1>;
  1430	
  1431					interrupt-map-mask = <0 0 0 7>;
  1432					interrupt-map = <0 0 0 1 &port03 0 0 0 0>,
  1433							<0 0 0 2 &port03 0 0 0 1>,
  1434							<0 0 0 3 &port03 0 0 0 2>,
  1435							<0 0 0 4 &port03 0 0 0 3>;
  1436	
  1437					status = "disabled";
  1438				};
  1439			};
  1440		};
  1441	};
  1442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
