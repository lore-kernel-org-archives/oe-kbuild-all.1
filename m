Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C18C1ACEAF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 08:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736323422; cv=none; b=kR7SeXDwNjSR3gxI83l2ffk5tD9BC6iEKK+yIW/CXSCF/7EJOcndW8gtsr8b5ELl8PbYwAf/v6aKEb+NI5w7t/EigMJ4vi+zUuabtp+kLRXCoQgjcJbFh+UvzxayjMZJFuc8+udM+YWUKqmluAdM1Ay7X1rWBlEuXXmsWUDddeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736323422; c=relaxed/simple;
	bh=69gDV7Xi4TVTSQfg3eyM2EhXGh0ffzE6JqiHAOF15mc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MzIWkyYf9Ew7p3Pv3zARFND2rqzQjiQ9xP8a+rbBYGJvsKCYnpYunACrxNIP4KsqsyabVi31GNY2nSmf7W2SkYWorqM5oEbd02ol2LGRHzw7XyNN2535ftHNmweFDyKYZZVRnt9xVx0OAeds9v32hhvdhAnz45DmErv/vgiPX6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oq10pzrd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oq10pzrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736323421; x=1767859421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=69gDV7Xi4TVTSQfg3eyM2EhXGh0ffzE6JqiHAOF15mc=;
  b=Oq10pzrdcKjbZ10SfJD7CiUFCp/1d7e/1WAXqFSU5YvrEUlcOgs71p9O
   F31HYDQePBo1sHWkxsKPwKzFXDHqJRRdgwirYvvfcLezyK4GAZ8lmlzms
   mxNi7yOL3fNOTt6l+T55o+47JHqVVGqiS9e2oqvSbq630qkN3/iAG1OYx
   o7RMWDqLD28j749hsA7xhq72ivYc+NHp1773YW5AzyR8/Ij0siolf4Qgq
   dD/cVFOOhhqGQi0D2H3OJuu3BOihPUjLlI74z3dHjhxFlKbi/Zl3+lF7c
   +RaoK3gytGlMqeu5b+upVjBDRyzXvv7b65RJqQwEZU+IpXx19Lyld99r+
   Q==;
X-CSE-ConnectionGUID: uWJfO6eCTvyCu414DleNgQ==
X-CSE-MsgGUID: NRRBMS45T9mvsAlhA8JevA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36419840"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36419840"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:03:39 -0800
X-CSE-ConnectionGUID: 5SlKoKBPQ+2/J4PrZf7mfw==
X-CSE-MsgGUID: +yI7gE5AQ1ysSl7/Z8OJsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108117949"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2025 00:03:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVR2M-000FmQ-2B;
	Wed, 08 Jan 2025 08:03:34 +0000
Date: Wed, 8 Jan 2025 16:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 215/215]
 arch/arm64/boot/dts/mediatek/mt8196.dtsi:568.37-593.5: Warning
 (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000:
 unnecessary #address-cells/#size-cells without "ranges" or child "reg"
 property
Message-ID: <202501081503.zEbfTrZ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   3a88be543121017097505213a7494def9c514427
commit: 3a88be543121017097505213a7494def9c514427 [215/215] CHROMIUM: arm64: dts: mt8196: Add MT8196 EVB dts
config: arm64-randconfig-003-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081503.zEbfTrZ9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081503.zEbfTrZ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081503.zEbfTrZ9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:568.37-593.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +568 arch/arm64/boot/dts/mediatek/mt8196.dtsi

    16	
    17	/ {
    18		compatible = "mediatek,mt8196";
    19		interrupt-parent = <&gic>;
    20		#address-cells = <2>;
    21		#size-cells = <2>;
    22	
    23		aliases {
    24			i2c0 = &i2c0;
    25			i2c1 = &i2c1;
    26			i2c2 = &i2c2;
    27			i2c3 = &i2c3;
    28			i2c4 = &i2c4;
    29			i2c5 = &i2c5;
    30			i2c6 = &i2c6;
    31			i2c7 = &i2c7;
    32			i2c8 = &i2c8;
    33			i2c9 = &i2c9;
    34			i2c10 = &i2c10;
    35			i2c11 = &i2c11;
    36			i2c12 = &i2c12;
    37			i2c13 = &i2c13;
    38			i2c14 = &i2c14;
    39			mmc1 = &mmc1;
    40			mmc2 = &mmc2;
    41			serial0 = &uart0;
    42			spi0 = &spi0;
    43			spi1 = &spi1;
    44			spi2 = &spi2;
    45			spi3 = &spi3;
    46			spi4 = &spi4;
    47			spi5 = &spi5;
    48			spi6 = &spi6;
    49			spi7 = &spi7;
    50		};
    51	
    52		cpus {
    53			#address-cells = <1>;
    54			#size-cells = <0>;
    55	
    56			cpu0: cpu@0 {
    57				device_type = "cpu";
    58				compatible = "arm,cortex-a720";
    59				reg = <0x000>;
    60				performance-domains = <&performance 0>;
    61				enable-method = "psci";
    62				clock-frequency = <2100000000>;
    63				capacity-dmips-mhz = <714>;
    64				cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
    65						   &system_vcore &s2idle>;
    66				i-cache-size = <65536>;
    67				i-cache-line-size = <64>;
    68				i-cache-sets = <256>;
    69				d-cache-size = <65536>;
    70				d-cache-line-size = <64>;
    71				d-cache-sets = <256>;
    72				next-level-cache = <&l2_0>;
    73				#cooling-cells = <2>;
    74			};
    75	
    76			cpu1: cpu@100 {
    77				device_type = "cpu";
    78				compatible = "arm,cortex-a720";
    79				reg = <0x100>;
    80				performance-domains = <&performance 0>;
    81				enable-method = "psci";
    82				clock-frequency = <2100000000>;
    83				capacity-dmips-mhz = <714>;
    84				cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
    85						   &system_vcore &s2idle>;
    86				i-cache-size = <65536>;
    87				i-cache-line-size = <64>;
    88				i-cache-sets = <256>;
    89				d-cache-size = <65536>;
    90				d-cache-line-size = <64>;
    91				d-cache-sets = <256>;
    92				next-level-cache = <&l2_0>;
    93				#cooling-cells = <2>;
    94			};
    95	
    96			cpu2: cpu@200 {
    97				device_type = "cpu";
    98				compatible = "arm,cortex-a720";
    99				reg = <0x200>;
   100				performance-domains = <&performance 0>;
   101				enable-method = "psci";
   102				clock-frequency = <2100000000>;
   103				capacity-dmips-mhz = <714>;
   104				cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
   105						   &system_vcore &s2idle>;
   106				i-cache-size = <65536>;
   107				i-cache-line-size = <64>;
   108				i-cache-sets = <256>;
   109				d-cache-size = <65536>;
   110				d-cache-line-size = <64>;
   111				d-cache-sets = <256>;
   112				next-level-cache = <&l2_0>;
   113				#cooling-cells = <2>;
   114			};
   115	
   116			cpu3: cpu@300 {
   117				device_type = "cpu";
   118				compatible = "arm,cortex-a720";
   119				reg = <0x300>;
   120				performance-domains = <&performance 0>;
   121				enable-method = "psci";
   122				clock-frequency = <2100000000>;
   123				capacity-dmips-mhz = <714>;
   124				cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
   125						   &system_vcore &s2idle>;
   126				i-cache-size = <65536>;
   127				i-cache-line-size = <64>;
   128				i-cache-sets = <256>;
   129				d-cache-size = <65536>;
   130				d-cache-line-size = <64>;
   131				d-cache-sets = <256>;
   132				next-level-cache = <&l2_0>;
   133				#cooling-cells = <2>;
   134			};
   135	
   136			cpu4: cpu@400 {
   137				device_type = "cpu";
   138				compatible = "arm,cortex-x4";
   139				reg = <0x400>;
   140				performance-domains = <&performance 1>;
   141				enable-method = "psci";
   142				clock-frequency = <2800000000>;
   143				capacity-dmips-mhz = <1024>;
   144				cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m
   145						   &system_vcore &s2idle>;
   146				i-cache-size = <65536>;
   147				i-cache-line-size = <64>;
   148				i-cache-sets = <256>;
   149				d-cache-size = <65536>;
   150				d-cache-line-size = <64>;
   151				d-cache-sets = <256>;
   152				next-level-cache = <&l2_1>;
   153				#cooling-cells = <2>;
   154			};
   155	
   156			cpu5: cpu@500 {
   157				device_type = "cpu";
   158				compatible = "arm,cortex-x4";
   159				reg = <0x500>;
   160				performance-domains = <&performance 1>;
   161				enable-method = "psci";
   162				clock-frequency = <2800000000>;
   163				capacity-dmips-mhz = <1024>;
   164				cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m
   165						   &system_vcore &s2idle>;
   166				i-cache-size = <65536>;
   167				i-cache-line-size = <64>;
   168				i-cache-sets = <256>;
   169				d-cache-size = <65536>;
   170				d-cache-line-size = <64>;
   171				d-cache-sets = <256>;
   172				next-level-cache = <&l2_1>;
   173				#cooling-cells = <2>;
   174			};
   175	
   176			cpu6: cpu@600 {
   177				device_type = "cpu";
   178				compatible = "arm,cortex-x4";
   179				reg = <0x600>;
   180				performance-domains = <&performance 1>;
   181				enable-method = "psci";
   182				clock-frequency = <2800000000>;
   183				capacity-dmips-mhz = <1024>;
   184				cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m
   185						   &system_vcore &s2idle>;
   186				i-cache-size = <65536>;
   187				i-cache-line-size = <64>;
   188				i-cache-sets = <256>;
   189				d-cache-size = <65536>;
   190				d-cache-line-size = <64>;
   191				d-cache-sets = <256>;
   192				next-level-cache = <&l2_1>;
   193				#cooling-cells = <2>;
   194			};
   195	
   196			cpu7: cpu@700 {
   197				device_type = "cpu";
   198				compatible = "arm,cortex-x925";
   199				reg = <0x700>;
   200				performance-domains = <&performance 2>;
   201				enable-method = "psci";
   202				clock-frequency = <3600000000>;
   203				capacity-dmips-mhz = <937>;
   204				cpu-idle-states = <&cpuoff_b &clusteroff_b &mcusysoff_b
   205						   &system_vcore &s2idle>;
   206				i-cache-size = <65536>;
   207				i-cache-line-size = <64>;
   208				i-cache-sets = <256>;
   209				d-cache-size = <65536>;
   210				d-cache-line-size = <64>;
   211				d-cache-sets = <256>;
   212				next-level-cache = <&l2_2>;
   213				#cooling-cells = <2>;
   214			};
   215	
   216			cpu-map {
   217				cluster0 {
   218					core0 {
   219						cpu = <&cpu0>;
   220					};
   221					core1 {
   222						cpu = <&cpu1>;
   223					};
   224					core2 {
   225						cpu = <&cpu2>;
   226					};
   227					core3 {
   228						cpu = <&cpu3>;
   229					};
   230				};
   231	
   232				cluster1 {
   233					core0 {
   234						cpu = <&cpu4>;
   235					};
   236					core1 {
   237						cpu = <&cpu5>;
   238					};
   239					core2 {
   240						cpu = <&cpu6>;
   241					};
   242				};
   243	
   244				cluster2 {
   245					core0 {
   246						cpu = <&cpu7>;
   247					};
   248				};
   249			};
   250	
   251			idle-states {
   252				entry-method = "arm,psci";
   253				cpuoff_l: cpuoff-l {
   254					compatible = "arm,idle-state";
   255					arm,psci-suspend-param = <0x00010000>;
   256					local-timer-stop;
   257					entry-latency-us = <97>;
   258					exit-latency-us = <252>;
   259					min-residency-us = <6710>;
   260				};
   261	
   262				cpuoff_m: cpuoff-m {
   263					compatible = "arm,idle-state";
   264					arm,psci-suspend-param = <0x00010000>;
   265					local-timer-stop;
   266					entry-latency-us = <53>;
   267					exit-latency-us = <143>;
   268					min-residency-us = <2120>;
   269				};
   270	
   271				cpuoff_b: cpuoff-b {
   272					compatible = "arm,idle-state";
   273					arm,psci-suspend-param = <0x00010000>;
   274					local-timer-stop;
   275					entry-latency-us = <40>;
   276					exit-latency-us = <107>;
   277					min-residency-us = <2580>;
   278				};
   279	
   280				clusteroff_l: clusteroff-l {
   281					compatible = "arm,idle-state";
   282					arm,psci-suspend-param = <0x01010001>;
   283					local-timer-stop;
   284					entry-latency-us = <109>;
   285					exit-latency-us = <325>;
   286					min-residency-us = <6710>;
   287				};
   288	
   289				clusteroff_m: clusteroff-m {
   290					compatible = "arm,idle-state";
   291					arm,psci-suspend-param = <0x01010001>;
   292					local-timer-stop;
   293					entry-latency-us = <59>;
   294					exit-latency-us = <188>;
   295					min-residency-us = <2120>;
   296				};
   297	
   298				clusteroff_b: clusteroff-b {
   299					compatible = "arm,idle-state";
   300					arm,psci-suspend-param = <0x01010001>;
   301					local-timer-stop;
   302					entry-latency-us = <43>;
   303					exit-latency-us = <138>;
   304					min-residency-us = <2580>;
   305				};
   306	
   307				mcusysoff_l: mcusysoff-l {
   308					compatible = "arm,idle-state";
   309					arm,psci-suspend-param = <0x02010007>;
   310					local-timer-stop;
   311					entry-latency-us = <1357>;
   312					exit-latency-us = <835>;
   313					min-residency-us = <6710>;
   314				};
   315	
   316				mcusysoff_m: mcusysoff-m {
   317					compatible = "arm,idle-state";
   318					arm,psci-suspend-param = <0x02010007>;
   319					local-timer-stop;
   320					entry-latency-us = <1202>;
   321					exit-latency-us = <679>;
   322					min-residency-us = <2120>;
   323				};
   324	
   325				mcusysoff_b: mcusysoff-b {
   326					compatible = "arm,idle-state";
   327					arm,psci-suspend-param = <0x02010007>;
   328					local-timer-stop;
   329					entry-latency-us = <1143>;
   330					exit-latency-us = <611>;
   331					min-residency-us = <2580>;
   332				};
   333	
   334				system_vcore: system-vcore {
   335					compatible = "arm,idle-state";
   336					arm,psci-suspend-param = <0x020100ff>;
   337					local-timer-stop;
   338					entry-latency-us = <940>;
   339					exit-latency-us = <3500>;
   340					min-residency-us = <35200>;
   341				};
   342	
   343				s2idle: s2idle {
   344					compatible = "arm,idle-state";
   345					arm,psci-suspend-param = <0x020180ff>;
   346					local-timer-stop;
   347					entry-latency-us = <10000>;
   348					exit-latency-us = <10000>;
   349					min-residency-us = <4294967295>;
   350				};
   351			};
   352	
   353			l2_0: l2-cache0 {
   354				compatible = "cache";
   355				cache-level = <2>;
   356				cache-size = <524288>;
   357				cache-line-size = <64>;
   358				cache-sets = <2048>;
   359				next-level-cache = <&l3_0>;
   360				cache-unified;
   361			};
   362	
   363			l2_1: l2-cache1 {
   364				compatible = "cache";
   365				cache-level = <2>;
   366				cache-size = <1048576>;
   367				cache-line-size = <64>;
   368				cache-sets = <4096>;
   369				next-level-cache = <&l3_0>;
   370				cache-unified;
   371			};
   372	
   373			l2_2: l2-cache2 {
   374				compatible = "cache";
   375				cache-level = <2>;
   376				cache-size = <2097152>;
   377				cache-line-size = <64>;
   378				cache-sets = <8192>;
   379				next-level-cache = <&l3_0>;
   380				cache-unified;
   381			};
   382	
   383			l3_0: l3-cache {
   384				compatible = "cache";
   385				cache-level = <3>;
   386				cache-size = <12582912>;
   387				cache-line-size = <64>;
   388				cache-sets = <49152>;
   389				cache-unified;
   390			};
   391		};
   392	
   393		clk_ao: clk-ao {
   394			compatible = "simple-bus";
   395			#address-cells = <1>;
   396			#size-cells = <0>;
   397		};
   398	
   399		clkitg: clkitg {
   400			compatible = "simple-bus";
   401			#address-cells = <1>;
   402			#size-cells = <0>;
   403		};
   404	
   405		clocks {
   406			clk_null: clk-null {
   407				compatible = "fixed-clock";
   408				#clock-cells = <0>;
   409				clock-frequency = <0>;
   410			};
   411	
   412			clk32k: clk32k {
   413				compatible = "fixed-clock";
   414				#clock-cells = <0>;
   415				clock-frequency = <32000>;
   416			};
   417	
   418			clk13m: clk13m {
   419				compatible = "fixed-clock";
   420				#clock-cells = <0>;
   421				clock-frequency = <13000000>;
   422			};
   423	
   424			clk26m: clk26m {
   425				compatible = "fixed-clock";
   426				#clock-cells = <0>;
   427				clock-frequency = <26000000>;
   428			};
   429	
   430			/*
   431			 * ulposc: Ultra Low Power Oscillator
   432			 * It is used by soc when the 26Mhz clock is turned
   433			 * off. It also is used by other modules.
   434			 */
   435			ulposc: ulposc {
   436				compatible = "fixed-clock";
   437				#clock-cells = <0>;
   438				clock-frequency = <520000000>;
   439			};
   440	
   441			/*
   442			 * ulposc3: Ultra Low Power Oscillator 3
   443			 * It is used by soc when the 26Mhz clock is turned
   444			 * off. It also is used by other modules.
   445			 */
   446			ulposc3: ulposc3 {
   447				compatible = "fixed-clock";
   448				#clock-cells = <0>;
   449				clock-frequency = <26000000>;
   450			};
   451	
   452			clk104m: clk104m {
   453				compatible = "fixed-clock";
   454				#clock-cells = <0>;
   455				clock-frequency = <104000000>;
   456			};
   457		};
   458	
   459		memory: memory@80000000 {
   460			device_type = "memory";
   461			reg = <0 0x80000000 0 0x40000000>;
   462		};
   463	
   464		pmu_hunter: pmu-hunter {
   465			compatible = "arm,cortex-a720-pmu";
   466			interrupt-parent = <&gic>;
   467			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
   468		};
   469	
   470		pmu_hunter_elp: pmu-hunter-elp {
   471			compatible = "arm,cortex-x4-pmu";
   472			interrupt-parent = <&gic>;
   473			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
   474		};
   475	
   476		pmu_blackhawk: pmu-blackhawk{
   477			compatible = "arm,cortex-x925-pmu";
   478			interrupt-parent = <&gic>;
   479			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
   480		};
   481	
   482		reserved-memory {
   483			#address-cells = <2>;
   484			#size-cells = <2>;
   485			ranges;
   486		};
   487	
   488		timer: timer {
   489			compatible = "arm,armv8-timer";
   490			interrupt-parent = <&gic>;
   491			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
   492					<GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
   493					<GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
   494					<GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
   495			clock-frequency = <13000000>;
   496		};
   497	
   498		psci {
   499			compatible = "arm,psci-1.0";
   500			method = "smc";
   501		};
   502	
   503		soc {
   504			compatible = "simple-bus";
   505			#address-cells = <2>;
   506			#size-cells = <2>;
   507			ranges;
   508			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
   509	
   510			csram_sys: csram-sysram@11bc00 {
   511				reg = <0 0x11bc00 0 0x1400>; /* 5KB */
   512			};
   513	
   514			cpu_mcucfg: mcusys-ao-cfg@c000000 {
   515				reg = <0 0xc000000 0 0x10000>; /* 64KB */
   516			};
   517	
   518			cpu_pll: mcusys-pll1u-top@c030000 {
   519				reg = <0 0xc030000 0 0x1000>; /* 4KB */
   520			};
   521	
   522			ccipll_pll_ctrl_clk: syscon@c1e0000 {
   523				/* TODO: Fix compatible in driver */
   524				compatible = "mediatek,mt8196-ccipll-pll-ctrl", "mediatek,mt8196-ccipll_pll_ctrl", "syscon";
   525				reg = <0 0xc1e0000 0 0x400>;
   526				#clock-cells = <1>;
   527			};
   528	
   529			armpll_ll_pll_ctrl_clk: syscon@c1e0400 {
   530				/* TODO: Fix compatible in driver */
   531				compatible = "mediatek,mt8196-armpll-ll-pll-ctrl", "mediatek,mt8196-armpll_ll_pll_ctrl", "syscon";
   532				reg = <0 0xc1e0400 0 0x400>;
   533				#clock-cells = <1>;
   534			};
   535	
   536			armpll_bl_pll_ctrl_clk: syscon@c1e0800 {
   537				/* TODO: Fix compatible in driver */
   538				compatible = "mediatek,mt8196-armpll-bl-pll-ctrl", "mediatek,mt8196-armpll_bl_pll_ctrl", "syscon";
   539				reg = <0 0xc1e0800 0 0x400>;
   540				#clock-cells = <1>;
   541			};
   542	
   543			armpll_b_pll_ctrl_clk: syscon@c1e0c00 {
   544				/* TODO: Fix compatible in driver */
   545				compatible = "mediatek,mt8196-armpll-b-pll-ctrl", "mediatek,mt8196-armpll_b_pll_ctrl", "syscon";
   546				reg = <0 0xc1e0c00 0 0x1000>;
   547				#clock-cells = <1>;
   548			};
   549	
   550			ptppll_pll_ctrl_clk: syscon@c1e4000 {
   551				/* TODO: Fix compatible in driver */
   552				compatible = "mediatek,mt8196-ptppll-pll-ctrl", "mediatek,mt8196-ptppll_pll_ctrl", "syscon";
   553				reg = <0 0xc1e4000 0 0x1000>;
   554				#clock-cells = <1>;
   555			};
   556	
   557			performance: performance-controller@c2c0f20 {
   558				compatible = "mediatek,cpufreq-hw";
   559				reg = <0 0xc2c0f20 0 0x120>,
   560				      <0 0xc2c1040 0 0x120>,
   561				      <0 0xc2c1160 0 0x120>;
   562				reg-names = "performance-domain0",
   563					    "performance-domain1",
   564					    "performance-domain2";
   565				#performance-domain-cells = <1>;
   566			};
   567	
 > 568			gic: interrupt-controller@c400000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
