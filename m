Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B49673459
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718697104; cv=none; b=WSqzm+KYog4F5igsDiunFd+WjZ80ToKtx8teqXDrXTgPu45+OkQhLLzP0UD/iyven7agNggtiY3BUTV4350yu0kpX1E2PKhptwu+sWPjeXwy3ong8x9atPpwHev293aR4BKN/zPVMJtMnouDtWusEx6zyG5tg3mpLK8lBVhP5BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718697104; c=relaxed/simple;
	bh=jhVO+Kctnhqk+DKu1J9RYoW2A18o77Wr5TFqJNZ2IZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1IczRRE78BtpJnN7BHwez2UlNsGkLpTbZnHML5k4GBTWPmszNQwVH4e/NuShP3uMDO4VxoWYqq5p6yZlglJz2b3jq4Q0kKHfWBrEAAGvfIKjYEFaGf60VF/YmR3oVVTjllmvRAhhKGNmkWiErIuPoshpzYFzD5ysfXsyr/5Pkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKRo0yaS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKRo0yaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718697102; x=1750233102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jhVO+Kctnhqk+DKu1J9RYoW2A18o77Wr5TFqJNZ2IZA=;
  b=GKRo0yaSw9N0NObZRU92DOfswMQUdG5iuP2ap87ZHLsYChIrB2vdKc/z
   cw3xlb2jvh9T2BLO9lOml434fqFCCmb1qRrwn/WpzLJ5dyGG/dCDx9CYR
   tvqV0DzbsScBV7xFNNGDw/wa8ONV/aSgmq8jyOLqFIjXDjNd23b+j/ybU
   WjfWS0SMFZaVBNZ0mco4C+W+wJQF+5gbPDxYnxP0RpLTUD0UmZ68RJfl8
   vwlgBnm+gyHdBYzsIHBwsLg4sRHzJtD4BelZbLBdogZ17bp5NMyPjaBBA
   n2pk82bfPvhW5O403jwP1eFMKGZy0Cj63MveXN+K5aNnFOc8wq2yuZwXp
   A==;
X-CSE-ConnectionGUID: UaPsW6CGTNarlo60LkvWfg==
X-CSE-MsgGUID: 1Jx+BxTBTqOlT1BcAvmEOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15791377"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15791377"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 00:51:41 -0700
X-CSE-ConnectionGUID: P08tAR9nQbu/jHY1F94LNw==
X-CSE-MsgGUID: bGHKiTubR9KwH+fu8ReT9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="72210960"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jun 2024 00:51:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJTcu-0005Jl-2L;
	Tue, 18 Jun 2024 07:51:36 +0000
Date: Tue, 18 Jun 2024 15:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 53/184]
 arch/arm64/boot/dts/apple/t8112.dtsi:434.28-437.5: Warning
 (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or
 ranges property, but no unit name
Message-ID: <202406181550.fbX0KwC3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: c1d28c604378a52de4ac2971c8b0cf6eb1005926 [53/184] arm64: dts: apple: Add GPU nodes to T8112
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240618/202406181550.fbX0KwC3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406181550.fbX0KwC3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406181550.fbX0KwC3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8112.dtsi:434.28-437.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8112.dtsi:439.34-442.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8112.dtsi:444.22-447.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j413.dts:155.14-174.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j413.dts:176.14-185.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:589.30-595.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:879.28-955.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:919.43-922.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
>> arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
>> arch/arm64/boot/dts/apple/t8112.dtsi:434.28-437.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8112.dtsi:439.34-442.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8112.dtsi:444.22-447.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j493.dts:143.14-162.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j493.dts:164.14-173.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:589.30-595.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:879.28-955.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:919.43-922.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
>> arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
>> arch/arm64/boot/dts/apple/t8112.dtsi:434.28-437.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8112.dtsi:439.34-442.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t8112.dtsi:444.22-447.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j473.dts:115.14-124.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j473.dts:126.14-135.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:589.30-595.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:879.28-955.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:919.43-922.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
>> arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +434 arch/arm64/boot/dts/apple/t8112.dtsi

    16	
    17	/ {
    18		compatible = "apple,t8112", "apple,arm-platform";
    19	
    20		#address-cells = <2>;
    21		#size-cells = <2>;
    22	
    23		aliases {
    24			gpu = &gpu;
    25		};
    26	
    27		cpus {
    28			#address-cells = <2>;
    29			#size-cells = <0>;
    30	
    31			cpu-map {
    32				cluster0 {
    33					core0 {
    34						cpu = <&cpu_e0>;
    35					};
    36					core1 {
    37						cpu = <&cpu_e1>;
    38					};
    39					core2 {
    40						cpu = <&cpu_e2>;
    41					};
    42					core3 {
    43						cpu = <&cpu_e3>;
    44					};
    45				};
    46	
    47				cluster1 {
    48					core0 {
    49						cpu = <&cpu_p0>;
    50					};
    51					core1 {
    52						cpu = <&cpu_p1>;
    53					};
    54					core2 {
    55						cpu = <&cpu_p2>;
    56					};
    57					core3 {
    58						cpu = <&cpu_p3>;
    59					};
    60				};
    61			};
    62	
    63			cpu_e0: cpu@0 {
    64				compatible = "apple,blizzard";
    65				device_type = "cpu";
    66				reg = <0x0 0x0>;
    67				enable-method = "spin-table";
    68				cpu-release-addr = <0 0>; /* To be filled by loader */
    69				operating-points-v2 = <&ecluster_opp>;
    70				capacity-dmips-mhz = <756>;
    71				performance-domains = <&cpufreq_e>;
    72				next-level-cache = <&l2_cache_0>;
    73				i-cache-size = <0x20000>;
    74				d-cache-size = <0x10000>;
    75			};
    76	
    77			cpu_e1: cpu@1 {
    78				compatible = "apple,blizzard";
    79				device_type = "cpu";
    80				reg = <0x0 0x1>;
    81				enable-method = "spin-table";
    82				cpu-release-addr = <0 0>; /* To be filled by loader */
    83				operating-points-v2 = <&ecluster_opp>;
    84				capacity-dmips-mhz = <756>;
    85				performance-domains = <&cpufreq_e>;
    86				next-level-cache = <&l2_cache_0>;
    87				i-cache-size = <0x20000>;
    88				d-cache-size = <0x10000>;
    89			};
    90	
    91			cpu_e2: cpu@2 {
    92				compatible = "apple,blizzard";
    93				device_type = "cpu";
    94				reg = <0x0 0x2>;
    95				enable-method = "spin-table";
    96				cpu-release-addr = <0 0>; /* To be filled by loader */
    97				operating-points-v2 = <&ecluster_opp>;
    98				capacity-dmips-mhz = <756>;
    99				performance-domains = <&cpufreq_e>;
   100				next-level-cache = <&l2_cache_0>;
   101				i-cache-size = <0x20000>;
   102				d-cache-size = <0x10000>;
   103			};
   104	
   105			cpu_e3: cpu@3 {
   106				compatible = "apple,blizzard";
   107				device_type = "cpu";
   108				reg = <0x0 0x3>;
   109				enable-method = "spin-table";
   110				cpu-release-addr = <0 0>; /* To be filled by loader */
   111				operating-points-v2 = <&ecluster_opp>;
   112				capacity-dmips-mhz = <756>;
   113				performance-domains = <&cpufreq_e>;
   114				next-level-cache = <&l2_cache_0>;
   115				i-cache-size = <0x20000>;
   116				d-cache-size = <0x10000>;
   117			};
   118	
   119			cpu_p0: cpu@10100 {
   120				compatible = "apple,avalanche";
   121				device_type = "cpu";
   122				reg = <0x0 0x10100>;
   123				enable-method = "spin-table";
   124				cpu-release-addr = <0 0>; /* To be filled by loader */
   125				operating-points-v2 = <&pcluster_opp>;
   126				capacity-dmips-mhz = <1024>;
   127				performance-domains = <&cpufreq_p>;
   128				next-level-cache = <&l2_cache_1>;
   129				i-cache-size = <0x30000>;
   130				d-cache-size = <0x20000>;
   131			};
   132	
   133			cpu_p1: cpu@10101 {
   134				compatible = "apple,avalanche";
   135				device_type = "cpu";
   136				reg = <0x0 0x10101>;
   137				enable-method = "spin-table";
   138				cpu-release-addr = <0 0>; /* To be filled by loader */
   139				operating-points-v2 = <&pcluster_opp>;
   140				capacity-dmips-mhz = <1024>;
   141				performance-domains = <&cpufreq_p>;
   142				next-level-cache = <&l2_cache_1>;
   143				i-cache-size = <0x30000>;
   144				d-cache-size = <0x20000>;
   145			};
   146	
   147			cpu_p2: cpu@10102 {
   148				compatible = "apple,avalanche";
   149				device_type = "cpu";
   150				reg = <0x0 0x10102>;
   151				enable-method = "spin-table";
   152				cpu-release-addr = <0 0>; /* To be filled by loader */
   153				operating-points-v2 = <&pcluster_opp>;
   154				capacity-dmips-mhz = <1024>;
   155				performance-domains = <&cpufreq_p>;
   156				next-level-cache = <&l2_cache_1>;
   157				i-cache-size = <0x30000>;
   158				d-cache-size = <0x20000>;
   159			};
   160	
   161			cpu_p3: cpu@10103 {
   162				compatible = "apple,avalanche";
   163				device_type = "cpu";
   164				reg = <0x0 0x10103>;
   165				enable-method = "spin-table";
   166				cpu-release-addr = <0 0>; /* To be filled by loader */
   167				operating-points-v2 = <&pcluster_opp>;
   168				capacity-dmips-mhz = <1024>;
   169				performance-domains = <&cpufreq_p>;
   170				next-level-cache = <&l2_cache_1>;
   171				i-cache-size = <0x30000>;
   172				d-cache-size = <0x20000>;
   173			};
   174	
   175			l2_cache_0: l2-cache-0 {
   176				compatible = "cache";
   177				cache-level = <2>;
   178				cache-unified;
   179				cache-size = <0x400000>;
   180			};
   181	
   182			l2_cache_1: l2-cache-1 {
   183				compatible = "cache";
   184				cache-level = <2>;
   185				cache-unified;
   186				cache-size = <0x1000000>;
   187			};
   188		};
   189	
   190		ecluster_opp: opp-table-0 {
   191			compatible = "operating-points-v2";
   192			opp-shared;
   193	
   194			opp01 {
   195				opp-hz = /bits/ 64 <600000000>;
   196				opp-level = <1>;
   197				clock-latency-ns = <7500>;
   198			};
   199			opp02 {
   200				opp-hz = /bits/ 64 <912000000>;
   201				opp-level = <2>;
   202				clock-latency-ns = <20000>;
   203			};
   204			opp03 {
   205				opp-hz = /bits/ 64 <1284000000>;
   206				opp-level = <3>;
   207				clock-latency-ns = <22000>;
   208			};
   209			opp04 {
   210				opp-hz = /bits/ 64 <1752000000>;
   211				opp-level = <4>;
   212				clock-latency-ns = <30000>;
   213			};
   214			opp05 {
   215				opp-hz = /bits/ 64 <2004000000>;
   216				opp-level = <5>;
   217				clock-latency-ns = <35000>;
   218			};
   219			opp06 {
   220				opp-hz = /bits/ 64 <2256000000>;
   221				opp-level = <6>;
   222				clock-latency-ns = <39000>;
   223			};
   224			opp07 {
   225				opp-hz = /bits/ 64 <2424000000>;
   226				opp-level = <7>;
   227				clock-latency-ns = <53000>;
   228			};
   229		};
   230	
   231		pcluster_opp: opp-table-1 {
   232			compatible = "operating-points-v2";
   233			opp-shared;
   234	
   235			opp01 {
   236				opp-hz = /bits/ 64 <660000000>;
   237				opp-level = <1>;
   238				clock-latency-ns = <9000>;
   239			};
   240			opp02 {
   241				opp-hz = /bits/ 64 <924000000>;
   242				opp-level = <2>;
   243				clock-latency-ns = <19000>;
   244			};
   245			opp03 {
   246				opp-hz = /bits/ 64 <1188000000>;
   247				opp-level = <3>;
   248				clock-latency-ns = <22000>;
   249			};
   250			opp04 {
   251				opp-hz = /bits/ 64 <1452000000>;
   252				opp-level = <4>;
   253				clock-latency-ns = <24000>;
   254			};
   255			opp05 {
   256				opp-hz = /bits/ 64 <1704000000>;
   257				opp-level = <5>;
   258				clock-latency-ns = <26000>;
   259			};
   260			opp06 {
   261				opp-hz = /bits/ 64 <1968000000>;
   262				opp-level = <6>;
   263				clock-latency-ns = <28000>;
   264			};
   265			opp07 {
   266				opp-hz = /bits/ 64 <2208000000>;
   267				opp-level = <7>;
   268				clock-latency-ns = <30000>;
   269			};
   270			opp08 {
   271				opp-hz = /bits/ 64 <2400000000>;
   272				opp-level = <8>;
   273				clock-latency-ns = <33000>;
   274			};
   275			opp09 {
   276				opp-hz = /bits/ 64 <2568000000>;
   277				opp-level = <9>;
   278				clock-latency-ns = <34000>;
   279			};
   280			opp10 {
   281				opp-hz = /bits/ 64 <2724000000>;
   282				opp-level = <10>;
   283				clock-latency-ns = <36000>;
   284			};
   285			opp11 {
   286				opp-hz = /bits/ 64 <2868000000>;
   287				opp-level = <11>;
   288				clock-latency-ns = <41000>;
   289			};
   290			opp12 {
   291				opp-hz = /bits/ 64 <2988000000>;
   292				opp-level = <12>;
   293				clock-latency-ns = <42000>;
   294			};
   295			opp13 {
   296				opp-hz = /bits/ 64 <3096000000>;
   297				opp-level = <13>;
   298				clock-latency-ns = <44000>;
   299			};
   300			opp14 {
   301				opp-hz = /bits/ 64 <3204000000>;
   302				opp-level = <14>;
   303				clock-latency-ns = <46000>;
   304			};
   305			/* Not available until CPU deep sleep is implemented */
   306	#if 0
   307			opp15 {
   308				opp-hz = /bits/ 64 <3324000000>;
   309				opp-level = <15>;
   310				clock-latency-ns = <62000>;
   311				turbo-mode;
   312			};
   313			opp16 {
   314				opp-hz = /bits/ 64 <3408000000>;
   315				opp-level = <16>;
   316				clock-latency-ns = <62000>;
   317				turbo-mode;
   318			};
   319			opp17 {
   320				opp-hz = /bits/ 64 <3504000000>;
   321				opp-level = <17>;
   322				clock-latency-ns = <62000>;
   323				turbo-mode;
   324			};
   325	#endif
   326		};
   327	
   328		gpu_opp: opp-table-gpu {
   329			compatible = "operating-points-v2";
   330	
   331			/*
   332			 * NOTE: The voltage and power values are device-specific and
   333			 * must be filled in by the bootloader.
   334			 */
   335			opp00 {
   336				opp-hz = /bits/ 64 <0>;
   337				opp-microvolt = <400000>;
   338				opp-microwatt = <0>;
   339			};
   340			opp01 {
   341				opp-hz = /bits/ 64 <444000000>;
   342				opp-microvolt = <603000>;
   343				opp-microwatt = <4295000>;
   344			};
   345			opp02 {
   346				opp-hz = /bits/ 64 <612000000>;
   347				opp-microvolt = <675000>;
   348				opp-microwatt = <6251000>;
   349			};
   350			opp03 {
   351				opp-hz = /bits/ 64 <808000000>;
   352				opp-microvolt = <710000>;
   353				opp-microwatt = <8625000>;
   354			};
   355			opp04 {
   356				opp-hz = /bits/ 64 <968000000>;
   357				opp-microvolt = <775000>;
   358				opp-microwatt = <11948000>;
   359			};
   360			opp05 {
   361				opp-hz = /bits/ 64 <1110000000>;
   362				opp-microvolt = <820000>;
   363				opp-microwatt = <15071000>;
   364			};
   365			opp06 {
   366				opp-hz = /bits/ 64 <1236000000>;
   367				opp-microvolt = <875000>;
   368				opp-microwatt = <18891000>;
   369			};
   370			opp07 {
   371				opp-hz = /bits/ 64 <1338000000>;
   372				opp-microvolt = <915000>;
   373				opp-microwatt = <21960000>;
   374			};
   375			opp08 {
   376				opp-hz = /bits/ 64 <1398000000>;
   377				opp-microvolt = <950000>;
   378				opp-microwatt = <22800000>;
   379			};
   380		};
   381	
   382		timer {
   383			compatible = "arm,armv8-timer";
   384			interrupt-parent = <&aic>;
   385			interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
   386			interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
   387				     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
   388				     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
   389				     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
   390		};
   391	
   392		pmu-e {
   393			compatible = "apple,blizzard-pmu";
   394			interrupt-parent = <&aic>;
   395			interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
   396		};
   397	
   398		pmu-p {
   399			compatible = "apple,avalanche-pmu";
   400			interrupt-parent = <&aic>;
   401			interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
   402		};
   403	
   404		clkref: clock-ref {
   405			compatible = "fixed-clock";
   406			#clock-cells = <0>;
   407			clock-frequency = <24000000>;
   408			clock-output-names = "clkref";
   409		};
   410	
   411		/*
   412		 * This is a fabulated representation of the input clock
   413		 * to NCO since we don't know the true clock tree.
   414		 */
   415		nco_clkref: clock-ref-nco {
   416			compatible = "fixed-clock";
   417			#clock-cells = <0>;
   418			clock-output-names = "nco_ref";
   419		};
   420	
   421		/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
   422		clk_disp0: clock-disp0 {
   423			compatible = "fixed-clock";
   424			#clock-cells = <0>;
   425			clock-frequency = <533333328>;
   426			clock-output-names = "clk_disp0";
   427		};
   428	
   429		reserved-memory {
   430			#address-cells = <2>;
   431			#size-cells = <2>;
   432			ranges;
   433	
 > 434			uat_handoff: uat-handoff {
   435				reg = <0x0 0 0 0>;
   436				no-map;
   437			};
   438	
 > 439			uat_pagetables: uat-pagetables {
   440				reg = <0x0 0 0 0>;
   441				no-map;
   442			};
   443	
 > 444			uat_ttbs: uat-ttbs {
   445				reg = <0x0 0 0 0>;
   446				no-map;
   447			};
   448		};
   449	
   450		soc {
   451			compatible = "simple-bus";
   452			#address-cells = <2>;
   453			#size-cells = <2>;
   454	
   455			ranges;
   456			nonposted-mmio;
   457	
   458			gpu: gpu@206400000 {
   459				compatible = "apple,agx-t8112", "apple,agx-g14g";
   460				reg = <0x2 0x6400000 0 0x40000>,
   461					<0x2 0x4000000 0 0x1000000>;
   462				reg-names = "asc", "sgx";
   463				interrupt-parent = <&aic>;
   464				interrupts = <AIC_IRQ 697 IRQ_TYPE_LEVEL_HIGH>,
   465					<AIC_IRQ 698 IRQ_TYPE_LEVEL_HIGH>,
   466					<AIC_IRQ 699 IRQ_TYPE_LEVEL_HIGH>,
   467					<AIC_IRQ 700 IRQ_TYPE_LEVEL_HIGH>,
   468					<AIC_IRQ 713 IRQ_TYPE_LEVEL_HIGH>;
   469				mboxes = <&agx_mbox>;
   470				power-domains = <&ps_gfx>;
   471				memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>;
   472				memory-region-names = "ttbs", "pagetables", "handoff";
   473	
   474				apple,firmware-version = <12 4 0>;
   475				apple,firmware-compat = <12 4 0>;
   476	
   477				operating-points-v2 = <&gpu_opp>;
   478				apple,perf-base-pstate = <1>;
   479				apple,min-sram-microvolt = <780000>;
   480				apple,avg-power-filter-tc-ms = <300>;
   481				apple,avg-power-ki-only = <9.375>;
   482				apple,avg-power-kp = <3.22>;
   483				apple,avg-power-min-duty-cycle = <40>;
   484				apple,avg-power-target-filter-tc = <1>;
   485				apple,fast-die0-integral-gain = <200.0>;
   486				apple,fast-die0-proportional-gain = <5.0>;
   487				apple,perf-boost-ce-step = <50>;
   488				apple,perf-boost-min-util = <90>;
   489				apple,perf-filter-drop-threshold = <0>;
   490				apple,perf-filter-time-constant = <5>;
   491				apple,perf-filter-time-constant2 = <200>;
   492				apple,perf-integral-gain = <5.94>;
   493				apple,perf-integral-gain2 = <5.94>;
   494				apple,perf-integral-min-clamp = <0>;
   495				apple,perf-proportional-gain = <14.85>;
   496				apple,perf-proportional-gain2 = <14.85>;
   497				apple,perf-tgt-utilization = <85>;
   498				apple,power-sample-period = <8>;
   499				apple,ppm-filter-time-constant-ms = <34>;
   500				apple,ppm-ki = <205.0>;
   501				apple,ppm-kp = <0.75>;
   502				apple,pwr-min-duty-cycle = <40>;
   503				apple,core-leak-coef = <1920.0>;
   504				apple,sram-leak-coef = <74.0>;
   505			};
   506	
   507			agx_mbox: mbox@206408000 {
   508				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
   509				reg = <0x2 0x6408000 0x0 0x4000>;
   510				interrupt-parent = <&aic>;
   511				interrupts = <AIC_IRQ 709 IRQ_TYPE_LEVEL_HIGH>,
   512					<AIC_IRQ 710 IRQ_TYPE_LEVEL_HIGH>,
   513					<AIC_IRQ 711 IRQ_TYPE_LEVEL_HIGH>,
   514					<AIC_IRQ 712 IRQ_TYPE_LEVEL_HIGH>;
   515				interrupt-names = "send-empty", "send-not-empty",
   516					"recv-empty", "recv-not-empty";
   517				#mbox-cells = <0>;
   518			};
   519	
   520			cpufreq_e: cpufreq@210e20000 {
   521				compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
   522				reg = <0x2 0x10e20000 0 0x1000>;
   523				#performance-domain-cells = <0>;
   524			};
   525	
   526			cpufreq_p: cpufreq@211e20000 {
   527				compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
   528				reg = <0x2 0x11e20000 0 0x1000>;
   529				#performance-domain-cells = <0>;
   530			};
   531	
   532			disp0_dart: iommu@231304000 {
   533				compatible = "apple,t8112-dart", "apple,t8110-dart";
   534				reg = <0x2 0x31304000 0x0 0x4000>;
   535				#iommu-cells = <1>;
   536				interrupt-parent = <&aic>;
   537				interrupts = <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>;
   538				status = "disabled";
   539			};
   540	
   541			dcp_dart: iommu@23130c000 {
   542				compatible = "apple,t8112-dart", "apple,t8110-dart";
   543				reg = <0x2 0x3130c000 0x0 0x4000>;
   544				#iommu-cells = <1>;
   545				interrupt-parent = <&aic>;
   546				interrupts = <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>;
   547			};
   548	
   549			dcp_mbox: mbox@231c08000 {
   550				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
   551				reg = <0x2 0x31c08000 0x0 0x4000>;
   552				interrupt-parent = <&aic>;
   553				interrupts = <AIC_IRQ 535 IRQ_TYPE_LEVEL_HIGH>,
   554					<AIC_IRQ 536 IRQ_TYPE_LEVEL_HIGH>,
   555					<AIC_IRQ 537 IRQ_TYPE_LEVEL_HIGH>,
   556					<AIC_IRQ 538 IRQ_TYPE_LEVEL_HIGH>;
   557				interrupt-names = "send-empty", "send-not-empty",
   558					"recv-empty", "recv-not-empty";
   559				#mbox-cells = <0>;
   560				power-domains = <&ps_disp0_cpu0>;
   561				resets = <&ps_disp0_cpu0>;
   562			};
   563	
   564			dcp: dcp@231c00000 {
   565				compatible = "apple,t8112-dcp", "apple,dcp";
   566				mboxes = <&dcp_mbox>;
   567				mbox-names = "mbox";
   568				iommus = <&dcp_dart 5>;
   569	
   570				/* the ADT has 2 additional regs which seems to be unused */
   571				reg-names = "coproc", "disp-0", "disp-1", "disp-2", "disp-3";
   572				reg = <0x2 0x31c00000 0x0 0x4000>,
   573					<0x2 0x30000000 0x0 0x61c000>,
   574					<0x2 0x31320000 0x0 0x4000>,
   575					<0x2 0x31344000 0x0 0x4000>,
   576					<0x2 0x31800000 0x0 0x800000>;
   577				apple,bw-scratch = <&pmgr_dcp 0 4 0x5d8>;
   578				power-domains = <&ps_disp0_cpu0>;
   579				clocks = <&clk_disp0>;
   580				apple,asc-dram-mask = <0x0 0x0>;
   581				phandle = <&dcp>;
   582	
   583				disp0_piodma: piodma {
   584					iommus = <&disp0_dart 4>;
   585					phandle = <&disp0_piodma>;
   586				};
   587			};
   588	
   589			display: display-subsystem {
   590				compatible = "apple,display-subsystem";
   591				/* disp_dart0 must be 1st since it is locked */
   592				iommus = <&disp0_dart 0>;
   593				/* generate phandle explicitly for use in loader */
   594				phandle = <&display>;
   595			};
   596	
   597			sio_dart: iommu@235004000 {
   598				compatible = "apple,t8110-dart";
   599				reg = <0x2 0x35004000 0x0 0x4000>;
   600				interrupt-parent = <&aic>;
   601				interrupts = <AIC_IRQ 769 IRQ_TYPE_LEVEL_HIGH>;
   602				#iommu-cells = <1>;
   603				power-domains = <&ps_sio_cpu>;
   604			};
   605	
   606			i2c0: i2c@235010000 {
   607				compatible = "apple,t8112-i2c", "apple,i2c";
   608				reg = <0x2 0x35010000 0x0 0x4000>;
   609				clocks = <&clkref>;
   610				interrupt-parent = <&aic>;
   611				interrupts = <AIC_IRQ 761 IRQ_TYPE_LEVEL_HIGH>;
   612				pinctrl-0 = <&i2c0_pins>;
   613				pinctrl-names = "default";
   614				#address-cells = <0x1>;
   615				#size-cells = <0x0>;
   616				power-domains = <&ps_i2c0>;
   617				status = "disabled";
   618			};
   619	
   620			i2c1: i2c@235014000 {
   621				compatible = "apple,t8112-i2c", "apple,i2c";
   622				reg = <0x2 0x35014000 0x0 0x4000>;
   623				clocks = <&clkref>;
   624				interrupt-parent = <&aic>;
   625				interrupts = <AIC_IRQ 762 IRQ_TYPE_LEVEL_HIGH>;
   626				pinctrl-0 = <&i2c1_pins>;
   627				pinctrl-names = "default";
   628				#address-cells = <0x1>;
   629				#size-cells = <0x0>;
   630				power-domains = <&ps_i2c1>;
   631				status = "disabled";
   632			};
   633	
   634			i2c2: i2c@235018000 {
   635				compatible = "apple,t8112-i2c", "apple,i2c";
   636				reg = <0x2 0x35018000 0x0 0x4000>;
   637				clocks = <&clkref>;
   638				interrupt-parent = <&aic>;
   639				interrupts = <AIC_IRQ 763 IRQ_TYPE_LEVEL_HIGH>;
   640				pinctrl-0 = <&i2c2_pins>;
   641				pinctrl-names = "default";
   642				#address-cells = <0x1>;
   643				#size-cells = <0x0>;
   644				power-domains = <&ps_i2c2>;
   645				status = "disabled";
   646			};
   647	
   648			i2c3: i2c@23501c000 {
   649				compatible = "apple,t8112-i2c", "apple,i2c";
   650				reg = <0x2 0x3501c000 0x0 0x4000>;
   651				clocks = <&clkref>;
   652				interrupt-parent = <&aic>;
   653				interrupts = <AIC_IRQ 764 IRQ_TYPE_LEVEL_HIGH>;
   654				pinctrl-0 = <&i2c3_pins>;
   655				pinctrl-names = "default";
   656				#address-cells = <0x1>;
   657				#size-cells = <0x0>;
   658				power-domains = <&ps_i2c3>;
   659				status = "disabled";
   660			};
   661	
   662			i2c4: i2c@235020000 {
   663				compatible = "apple,t8112-i2c", "apple,i2c";
   664				reg = <0x2 0x35020000 0x0 0x4000>;
   665				clocks = <&clkref>;
   666				interrupt-parent = <&aic>;
   667				interrupts = <AIC_IRQ 765 IRQ_TYPE_LEVEL_HIGH>;
   668				pinctrl-0 = <&i2c4_pins>;
   669				pinctrl-names = "default";
   670				#address-cells = <0x1>;
   671				#size-cells = <0x0>;
   672				power-domains = <&ps_i2c4>;
   673				status = "disabled";
   674			};
   675	
   676			fpwm1: pwm@235044000 {
   677				compatible = "apple,t8112-fpwm", "apple,s5l-fpwm";
   678				reg = <0x2 0x35044000 0x0 0x4000>;
   679				power-domains = <&ps_fpwm1>;
   680				clocks = <&clkref>;
   681				#pwm-cells = <2>;
   682				status = "disabled";
   683			};
   684	
   685			spi3: spi@23510c000 {
   686				compatible = "apple,t8112-spi", "apple,spi";
   687				reg = <0x2 0x3510c000 0x0 0x4000>;
   688				interrupt-parent = <&aic>;
   689				interrupts = <AIC_IRQ 751 IRQ_TYPE_LEVEL_HIGH>;
   690				clocks = <&clkref>;
   691				pinctrl-0 = <&spi3_pins>;
   692				pinctrl-names = "default";
   693				power-domains = <&ps_spi3>;
   694				#address-cells = <1>;
   695				#size-cells = <0>;
   696				status = "disabled";
   697			};
   698	
   699			serial0: serial@235200000 {
   700				compatible = "apple,s5l-uart";
   701				reg = <0x2 0x35200000 0x0 0x1000>;
   702				reg-io-width = <4>;
   703				interrupt-parent = <&aic>;
   704				interrupts = <AIC_IRQ 739 IRQ_TYPE_LEVEL_HIGH>;
   705				/*
   706				 * TODO: figure out the clocking properly, there may
   707				 * be a third selectable clock.
   708				 */
   709				clocks = <&clkref>, <&clkref>;
   710				clock-names = "uart", "clk_uart_baud0";
   711				power-domains = <&ps_uart0>;
   712				status = "disabled";
   713			};
   714	
   715			serial2: serial@235208000 {
   716				compatible = "apple,s5l-uart";
   717				reg = <0x2 0x35208000 0x0 0x1000>;
   718				reg-io-width = <4>;
   719				interrupt-parent = <&aic>;
   720				interrupts = <AIC_IRQ 741 IRQ_TYPE_LEVEL_HIGH>;
   721				clocks = <&clkref>, <&clkref>;
   722				clock-names = "uart", "clk_uart_baud0";
   723				power-domains = <&ps_uart2>;
   724				status = "disabled";
   725			};
   726	
   727			admac: dma-controller@238200000 {
   728				compatible = "apple,t8112-admac", "apple,admac";
   729				reg = <0x2 0x38200000 0x0 0x34000>;
   730				dma-channels = <24>;
   731				interrupts-extended = <0>,
   732						      <&aic AIC_IRQ 760 IRQ_TYPE_LEVEL_HIGH>,
   733						      <0>,
   734						      <0>;
   735				#dma-cells = <1>;
   736				iommus = <&sio_dart 2>;
   737				power-domains = <&ps_sio_adma>;
   738				resets = <&ps_audio_p>;
   739			};
   740	
   741			mca: i2s@238400000 {
   742				compatible = "apple,t8112-mca", "apple,mca";
   743				reg = <0x2 0x38400000 0x0 0x18000>,
   744				      <0x2 0x38300000 0x0 0x30000>;
   745	
   746				interrupt-parent = <&aic>;
   747				interrupts = <AIC_IRQ 753 IRQ_TYPE_LEVEL_HIGH>,
   748					     <AIC_IRQ 754 IRQ_TYPE_LEVEL_HIGH>,
   749					     <AIC_IRQ 755 IRQ_TYPE_LEVEL_HIGH>,
   750					     <AIC_IRQ 756 IRQ_TYPE_LEVEL_HIGH>,
   751					     <AIC_IRQ 757 IRQ_TYPE_LEVEL_HIGH>,
   752					     <AIC_IRQ 758 IRQ_TYPE_LEVEL_HIGH>;
   753	
   754				resets = <&ps_audio_p>;
   755				clocks = <&nco 0>, <&nco 1>, <&nco 2>,
   756					 <&nco 3>, <&nco 4>, <&nco 4>;
   757				power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
   758						<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
   759				dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
   760				       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
   761				       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
   762				       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
   763				       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
   764				       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
   765				dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
   766					    "tx1a", "rx1a", "tx1b", "rx1b",
   767					    "tx2a", "rx2a", "tx2b", "rx2b",
   768					    "tx3a", "rx3a", "tx3b", "rx3b",
   769					    "tx4a", "rx4a", "tx4b", "rx4b",
   770					    "tx5a", "rx5a", "tx5b", "rx5b";
   771	
   772				#sound-dai-cells = <1>;
   773			};
   774	
   775			nco: clock-controller@23b044000 {
   776				compatible = "apple,t8112-nco", "apple,nco";
   777				reg = <0x2 0x3b044000 0x0 0x14000>;
   778				clocks = <&nco_clkref>;
   779				#clock-cells = <1>;
   780			};
   781	
   782			aic: interrupt-controller@23b0c0000 {
   783				compatible = "apple,t8112-aic", "apple,aic2";
   784				#interrupt-cells = <3>;
   785				interrupt-controller;
   786				reg = <0x2 0x3b0c0000 0x0 0x8000>,
   787					<0x2 0x3b0c8000 0x0 0x4>;
   788				reg-names = "core", "event";
   789				power-domains = <&ps_aic>;
   790	
   791				affinities {
   792					e-core-pmu-affinity {
   793						apple,fiq-index = <AIC_CPU_PMU_E>;
   794						cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
   795					};
   796	
   797					p-core-pmu-affinity {
   798						apple,fiq-index = <AIC_CPU_PMU_P>;
   799						cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
   800					};
   801				};
   802			};
   803	
   804			pmgr: power-management@23b700000 {
   805				compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
   806				#address-cells = <1>;
   807				#size-cells = <1>;
   808				reg = <0x2 0x3b700000 0 0x14000>;
   809				/* child nodes are added in t8103-pmgr.dtsi */
   810			};
   811	
   812			pmgr_dcp: power-management@23b3d0000 {
   813				reg = <0x2 0x3b3d0000 0x0 0x4000>;
   814				reg-names = "dcp-bw-scratch";
   815				#apple,bw-scratch-cells = <3>;
   816			};
   817	
   818			pinctrl_ap: pinctrl@23c100000 {
   819				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
   820				reg = <0x2 0x3c100000 0x0 0x100000>;
   821				power-domains = <&ps_gpio>;
   822	
   823				gpio-controller;
   824				#gpio-cells = <2>;
   825				gpio-ranges = <&pinctrl_ap 0 0 213>;
   826				apple,npins = <213>;
   827	
   828				interrupt-controller;
   829				#interrupt-cells = <2>;
   830				interrupt-parent = <&aic>;
   831				interrupts = <AIC_IRQ 199 IRQ_TYPE_LEVEL_HIGH>,
   832					     <AIC_IRQ 200 IRQ_TYPE_LEVEL_HIGH>,
   833					     <AIC_IRQ 201 IRQ_TYPE_LEVEL_HIGH>,
   834					     <AIC_IRQ 202 IRQ_TYPE_LEVEL_HIGH>,
   835					     <AIC_IRQ 203 IRQ_TYPE_LEVEL_HIGH>,
   836					     <AIC_IRQ 204 IRQ_TYPE_LEVEL_HIGH>,
   837					     <AIC_IRQ 205 IRQ_TYPE_LEVEL_HIGH>;
   838	
   839				i2c0_pins: i2c0-pins {
   840					pinmux = <APPLE_PINMUX(111, 1)>,
   841						 <APPLE_PINMUX(110, 1)>;
   842				};
   843	
   844				i2c1_pins: i2c1-pins {
   845					pinmux = <APPLE_PINMUX(113, 1)>,
   846						 <APPLE_PINMUX(112, 1)>;
   847				};
   848	
   849				i2c2_pins: i2c2-pins {
   850					pinmux = <APPLE_PINMUX(87, 1)>,
   851						 <APPLE_PINMUX(86, 1)>;
   852				};
   853	
   854				i2c3_pins: i2c3-pins {
   855					pinmux = <APPLE_PINMUX(54, 1)>,
   856						 <APPLE_PINMUX(53, 1)>;
   857				};
   858	
   859				i2c4_pins: i2c4-pins {
   860					pinmux = <APPLE_PINMUX(131, 1)>,
   861						 <APPLE_PINMUX(130, 1)>;
   862				};
   863	
   864				spi3_pins: spi3-pins {
   865					pinmux = <APPLE_PINMUX(93, 1)>,
   866						<APPLE_PINMUX(94, 1)>,
   867						<APPLE_PINMUX(95, 1)>,
   868						<APPLE_PINMUX(96, 1)>;
   869				};
   870	
   871				pcie_pins: pcie-pins {
   872					pinmux = <APPLE_PINMUX(162, 1)>,
   873						 <APPLE_PINMUX(163, 1)>,
   874						 <APPLE_PINMUX(164, 1)>;
   875					// TODO: 1 more CLKREQs
   876				};
   877			};
   878	
   879			nub_spmi: spmi@23d0d9300 {
   880				compatible = "apple,t8112-spmi", "apple,spmi";
   881				reg = <0x2 0x3d714000 0x0 0x100>;
   882				#address-cells = <2>;
   883				#size-cells = <0>;
   884				interrupt-parent = <&aic>;
   885				interrupts = <AIC_IRQ 256 IRQ_TYPE_LEVEL_HIGH>,
   886					<AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>;
   887	
   888				pmu1: pmu@e {
   889					compatible = "apple,stowe-pmu", "apple,spmi-pmu";
   890					reg = <0xe SPMI_USID>;
   891					#address-cells = <1>;
   892					#size-cells = <1>;
   893	
   894					rtc_nvmem@f800 {
   895						compatible = "apple,spmi-pmu-nvmem";
   896						reg = <0xf800 0x300>;
   897						#address-cells = <1>;
   898						#size-cells = <1>;
   899	
   900						pm_setting: pm-setting@1 {
   901							reg = <0x1 0x1>;
   902						};
   903	
   904						rtc_offset: rtc-offset@100 {
   905							reg = <0x100 0x6>;
   906						};
   907					};
   908	
   909					legacy_nvmem@f700 {
   910						compatible = "apple,spmi-pmu-nvmem";
   911						reg = <0xf700 0x20>;
   912						#address-cells = <1>;
   913						#size-cells = <1>;
   914	
   915						boot_stage: boot-stage@1 {
   916							reg = <0x1 0x1>;
   917						};
   918	
   919						boot_error_count: boot-error-count@2 {
   920							reg = <0x2 0x1>;
   921							bits = <0 4>;
   922						};
   923	
   924						panic_count: panic-count@2 {
   925							reg = <0x2 0x1>;
   926							bits = <4 4>;
   927						};
   928	
   929						boot_error_stage: boot-error-stage@3 {
   930							reg = <0x3 0x1>;
   931						};
   932	
   933						shutdown_flag: shutdown-flag@f {
   934							reg = <0xf 0x1>;
   935							bits = <3 1>;
   936						};
   937					};
   938	
   939					scrpad_nvmem@8000 {
   940						compatible = "apple,spmi-pmu-nvmem";
   941						reg = <0x8000 0x2800>;
   942						#address-cells = <1>;
   943						#size-cells = <1>;
   944	
   945						fault_shadow: fault-shadow@67b {
   946							reg = <0x67b 0x10>;
   947						};
   948	
   949						socd: socd@b00 {
   950							reg = <0xb00 0x400>;
   951						};
   952					};
   953	
   954				};
   955			};
   956	
   957			pinctrl_nub: pinctrl@23d1f0000 {
   958				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
   959				reg = <0x2 0x3d1f0000 0x0 0x4000>;
   960				power-domains = <&ps_nub_gpio>;
   961	
   962				gpio-controller;
   963				#gpio-cells = <2>;
   964				gpio-ranges = <&pinctrl_nub 0 0 24>;
   965				apple,npins = <24>;
   966	
   967				interrupt-controller;
   968				#interrupt-cells = <2>;
   969				interrupt-parent = <&aic>;
   970				interrupts = <AIC_IRQ 371 IRQ_TYPE_LEVEL_HIGH>,
   971					     <AIC_IRQ 372 IRQ_TYPE_LEVEL_HIGH>,
   972					     <AIC_IRQ 373 IRQ_TYPE_LEVEL_HIGH>,
   973					     <AIC_IRQ 374 IRQ_TYPE_LEVEL_HIGH>,
   974					     <AIC_IRQ 375 IRQ_TYPE_LEVEL_HIGH>,
   975					     <AIC_IRQ 376 IRQ_TYPE_LEVEL_HIGH>,
   976					     <AIC_IRQ 377 IRQ_TYPE_LEVEL_HIGH>;
   977			};
   978	
   979			pmgr_mini: power-management@23d280000 {
   980				compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
   981				#address-cells = <1>;
   982				#size-cells = <1>;
   983				reg = <0x2 0x3d280000 0 0x4000>;
   984				/* child nodes are added in t8103-pmgr.dtsi */
   985			};
   986	
   987			wdt: watchdog@23d2b0000 {
   988				compatible = "apple,t8112-wdt", "apple,wdt";
   989				reg = <0x2 0x3d2b0000 0x0 0x4000>;
   990				clocks = <&clkref>;
   991				interrupt-parent = <&aic>;
   992				interrupts = <AIC_IRQ 379 IRQ_TYPE_LEVEL_HIGH>;
   993			};
   994	
   995			efuse@23d2c8000 {
   996				compatible = "apple,t8112-efuses", "apple,efuses";
   997				reg = <0x2 0x3d2c8000 0x0 0x1000>;
   998				#address-cells = <1>;
   999				#size-cells = <1>;
  1000	
  1001				atcphy0_auspll_rodco_bias_adjust: efuse@480,20 {
  1002					reg = <0x480 4>;
  1003					bits = <20 3>;
  1004				};
  1005	
  1006				atcphy0_auspll_rodco_encap: efuse@480,23 {
  1007					reg = <0x480 4>;
  1008					bits = <23 2>;
  1009				};
  1010	
  1011				atcphy0_auspll_dtc_vreg_adjust: efuse@480,25 {
  1012					reg = <0x480 4>;
  1013					bits = <25 3>;
  1014				};
  1015	
  1016				atcphy0_auspll_fracn_dll_start_capcode: efuse@480,28 {
  1017					reg = <0x480 4>;
  1018					bits = <28 2>;
  1019				};
  1020	
  1021				atcphy0_aus_cmn_shm_vreg_trim: efuse@480,30 {
  1022					reg = <0x480 8>;
  1023					bits = <30 5>;
  1024				};
  1025	
  1026				atcphy0_cio3pll_dco_coarsebin0: efuse@484,3 {
  1027					reg = <0x484 4>;
  1028					bits = <3 6>;
  1029				};
  1030	
  1031				atcphy0_cio3pll_dco_coarsebin1: efuse@484,9 {
  1032					reg = <0x484 4>;
  1033					bits = <9 6>;
  1034				};
  1035	
  1036				atcphy0_cio3pll_dll_start_capcode: efuse@484,15 {
  1037					reg = <0x484 4>;
  1038					bits = <15 2>;
  1039				};
  1040	
  1041				atcphy0_cio3pll_dtc_vreg_adjust: efuse@484,17 {
  1042					reg = <0x484 0x4>;
  1043					bits = <17 3>;
  1044				};
  1045	
  1046				atcphy1_auspll_rodco_bias_adjust: efuse@484,30 {
  1047					reg = <0x484 8>;
  1048					bits = <30 3>;
  1049				};
  1050	
  1051				atcphy1_auspll_rodco_encap: efuse@488,1 {
  1052					reg = <0x488 8>;
  1053					bits = <1 2>;
  1054				};
  1055	
  1056				atcphy1_auspll_dtc_vreg_adjust: efuse@488,3 {
  1057					reg = <0x488 4>;
  1058					bits = <3 3>;
  1059				};
  1060	
  1061				atcphy1_auspll_fracn_dll_start_capcode: efuse@488,6 {
  1062					reg = <0x488 4>;
  1063					bits = <6 2>;
  1064				};
  1065	
  1066				atcphy1_aus_cmn_shm_vreg_trim: efuse@488,8 {
  1067					reg = <0x488 4>;
  1068					bits = <8 5>;
  1069				};
  1070	
  1071				atcphy1_cio3pll_dco_coarsebin0: efuse@488,13 {
  1072					reg = <0x488 4>;
  1073					bits = <13 6>;
  1074				};
  1075	
  1076				atcphy1_cio3pll_dco_coarsebin1: efuse@488,19 {
  1077					reg = <0x488 4>;
  1078					bits = <19 6>;
  1079				};
  1080	
  1081				atcphy1_cio3pll_dll_start_capcode: efuse@488,25 {
  1082					reg = <0x488 4>;
  1083					bits = <25 2>;
  1084				};
  1085	
  1086				atcphy1_cio3pll_dtc_vreg_adjust: efuse@488,27 {
  1087					reg = <0x488 0x4>;
  1088					bits = <27 3>;
  1089				};
  1090			};
  1091	
  1092			smc_mbox: mbox@23e408000 {
  1093				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
  1094				reg = <0x2 0x3e408000 0x0 0x4000>;
  1095				interrupt-parent = <&aic>;
  1096				interrupts = <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>,
  1097					<AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
  1098					<AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
  1099					<AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>;
  1100				interrupt-names = "send-empty", "send-not-empty",
  1101					"recv-empty", "recv-not-empty";
  1102				#mbox-cells = <0>;
  1103			};
  1104	
  1105			smc: smc@23e400000 {
  1106				compatible = "apple,t8112-smc", "apple,smc";
  1107				reg = <0x2 0x3e400000 0x0 0x4000>,
  1108					<0x2 0x3fe00000 0x0 0x100000>;
  1109				reg-names = "smc", "sram";
  1110				mboxes = <&smc_mbox>;
  1111	
  1112				smc_gpio: gpio {
  1113					gpio-controller;
  1114					#gpio-cells = <2>;
  1115				};
  1116	
  1117				smc_rtc: rtc {
  1118					nvmem-cells = <&rtc_offset>;
  1119					nvmem-cell-names = "rtc_offset";
  1120				};
  1121	
  1122				smc_reboot: reboot {
  1123					nvmem-cells = <&shutdown_flag>, <&boot_stage>,
  1124						<&boot_error_count>, <&panic_count>, <&pm_setting>;
  1125					nvmem-cell-names = "shutdown_flag", "boot_stage",
  1126						"boot_error_count", "panic_count", "pm_setting";
  1127				};
  1128			};
  1129	
  1130			pinctrl_smc: pinctrl@23e820000 {
  1131				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
  1132				reg = <0x2 0x3e820000 0x0 0x4000>;
  1133	
  1134				gpio-controller;
  1135				#gpio-cells = <2>;
  1136				gpio-ranges = <&pinctrl_smc 0 0 18>;
  1137				apple,npins = <18>;
  1138	
  1139				interrupt-controller;
  1140				#interrupt-cells = <2>;
  1141				interrupt-parent = <&aic>;
  1142				interrupts = <AIC_IRQ 490 IRQ_TYPE_LEVEL_HIGH>,
  1143					     <AIC_IRQ 491 IRQ_TYPE_LEVEL_HIGH>,
  1144					     <AIC_IRQ 492 IRQ_TYPE_LEVEL_HIGH>,
  1145					     <AIC_IRQ 493 IRQ_TYPE_LEVEL_HIGH>,
  1146					     <AIC_IRQ 494 IRQ_TYPE_LEVEL_HIGH>,
  1147					     <AIC_IRQ 495 IRQ_TYPE_LEVEL_HIGH>,
  1148					     <AIC_IRQ 496 IRQ_TYPE_LEVEL_HIGH>;
  1149			};
  1150	
  1151			pinctrl_aop: pinctrl@24a820000 {
  1152				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
  1153				reg = <0x2 0x4a820000 0x0 0x4000>;
  1154	
  1155				gpio-controller;
  1156				#gpio-cells = <2>;
  1157				gpio-ranges = <&pinctrl_aop 0 0 54>;
  1158				apple,npins = <54>;
  1159	
  1160				interrupt-controller;
  1161				#interrupt-cells = <2>;
  1162				interrupt-parent = <&aic>;
  1163				interrupts = <AIC_IRQ 301 IRQ_TYPE_LEVEL_HIGH>,
  1164					     <AIC_IRQ 302 IRQ_TYPE_LEVEL_HIGH>,
  1165					     <AIC_IRQ 303 IRQ_TYPE_LEVEL_HIGH>,
  1166					     <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>,
  1167					     <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>,
  1168					     <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>,
  1169					     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
  1170			};
  1171	
  1172			mtp: mtp@24e400000 {
  1173				compatible = "apple,t8112-mtp", "apple,t8112-rtk-helper-asc4", "apple,mtp", "apple,rtk-helper-asc4";
  1174				reg = <0x2 0x4e400000 0x0 0x4000>,
  1175					<0x2 0x4ec00000 0x0 0x100000>;
  1176				reg-names = "asc", "sram";
  1177				mboxes = <&mtp_mbox>;
  1178				iommus = <&mtp_dart 1>;
  1179				#helper-cells = <0>;
  1180	
  1181				status = "disabled";
  1182			};
  1183	
  1184			mtp_mbox: mbox@24e408000 {
  1185				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
  1186				reg = <0x2 0x4e408000 0x0 0x4000>;
  1187				interrupt-parent = <&aic>;
  1188				interrupts = <AIC_IRQ 864 IRQ_TYPE_LEVEL_HIGH>,
  1189					<AIC_IRQ 865 IRQ_TYPE_LEVEL_HIGH>,
  1190					<AIC_IRQ 866 IRQ_TYPE_LEVEL_HIGH>,
  1191					<AIC_IRQ 867 IRQ_TYPE_LEVEL_HIGH>;
  1192				interrupt-names = "send-empty", "send-not-empty",
  1193					"recv-empty", "recv-not-empty";
  1194				#mbox-cells = <0>;
  1195	
  1196				status = "disabled";
  1197			};
  1198	
  1199			mtp_dart: iommu@24e808000 {
  1200				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1201				reg = <0x2 0x4e808000 0x0 0x4000>;
  1202				interrupt-parent = <&aic>;
  1203				interrupts = <AIC_IRQ 848 IRQ_TYPE_LEVEL_HIGH>;
  1204				#iommu-cells = <1>;
  1205	
  1206				status = "disabled";
  1207			};
  1208	
  1209			mtp_dockchannel: fifo@24eb14000 {
  1210				compatible = "apple,t8112-dockchannel", "apple,dockchannel";
  1211				reg = <0x2 0x4eb14000 0x0 0x4000>;
  1212				reg-names = "irq";
  1213				interrupt-parent = <&aic>;
  1214				interrupts = <AIC_IRQ 850 IRQ_TYPE_LEVEL_HIGH>;
  1215	
  1216				ranges = <0 0x2 0x4eb28000 0x20000>;
  1217				#address-cells = <1>;
  1218				#size-cells = <1>;
  1219	
  1220				interrupt-controller;
  1221				#interrupt-cells = <2>;
  1222	
  1223				status = "disabled";
  1224	
  1225				mtp_hid: input@8000 {
  1226					compatible = "apple,dockchannel-hid";
  1227					reg = <0x8000 0x4000>,
  1228						<0xc000 0x4000>,
  1229						<0x0000 0x4000>,
  1230						<0x4000 0x4000>;
  1231					reg-names = "config", "data",
  1232						"rmt-config", "rmt-data";
  1233					iommus = <&mtp_dart 1>;
  1234					interrupt-parent = <&mtp_dockchannel>;
  1235					interrupts = <2 IRQ_TYPE_LEVEL_HIGH>,
  1236						<3 IRQ_TYPE_LEVEL_HIGH>;
  1237					interrupt-names = "tx", "rx";
  1238	
  1239					apple,fifo-size = <0x800>;
  1240					apple,helper-cpu = <&mtp>;
  1241				};
  1242	
  1243			};
  1244	
  1245			ans_mbox: mbox@277408000 {
  1246				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
  1247				reg = <0x2 0x77408000 0x0 0x4000>;
  1248				interrupt-parent = <&aic>;
  1249				interrupts = <AIC_IRQ 717 IRQ_TYPE_LEVEL_HIGH>,
  1250					<AIC_IRQ 718 IRQ_TYPE_LEVEL_HIGH>,
  1251					<AIC_IRQ 719 IRQ_TYPE_LEVEL_HIGH>,
  1252					<AIC_IRQ 720 IRQ_TYPE_LEVEL_HIGH>;
  1253				interrupt-names = "send-empty", "send-not-empty",
  1254					"recv-empty", "recv-not-empty";
  1255				#mbox-cells = <0>;
  1256				power-domains = <&ps_ans>;
  1257			};
  1258	
  1259			sart: sart@27bc50000 {
  1260				compatible = "apple,t8112-sart", "apple,t6000-sart";
  1261				reg = <0x2 0x7bc50000 0x0 0x10000>;
  1262				power-domains = <&ps_ans>;
  1263			};
  1264	
  1265			nvme@27bcc0000 {
  1266				compatible = "apple,t8112-nvme-ans2", "apple,nvme-ans2";
  1267				reg = <0x2 0x7bcc0000 0x0 0x40000>,
  1268					<0x2 0x77400000 0x0 0x4000>;
  1269				reg-names = "nvme", "ans";
  1270				interrupt-parent = <&aic>;
  1271				interrupts = <AIC_IRQ 724 IRQ_TYPE_LEVEL_HIGH>;
  1272				mboxes = <&ans_mbox>;
  1273				apple,sart = <&sart>;
  1274				power-domains = <&ps_ans>, <&ps_apcie_st>;
  1275				power-domain-names = "ans", "apcie0";
  1276				resets = <&ps_ans>;
  1277			};
  1278	
  1279			dwc3_0: usb@382280000 {
  1280				compatible = "apple,t8112-dwc3", "apple,dwc3", "snps,dwc3";
  1281				reg = <0x3 0x82280000 0x0 0x100000>;
  1282				interrupt-parent = <&aic>;
  1283				interrupts = <AIC_IRQ 1031 IRQ_TYPE_LEVEL_HIGH>;
  1284				dr_mode = "otg";
  1285				usb-role-switch;
  1286				role-switch-default-mode = "host";
  1287				iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
  1288				power-domains = <&ps_atc0_usb>;
  1289				resets = <&atcphy0>;
  1290				phys = <&atcphy0 PHY_TYPE_USB2>, <&atcphy0 PHY_TYPE_USB3>;
  1291				phy-names = "usb2-phy", "usb3-phy";
  1292			};
  1293	
  1294			dwc3_0_dart_0: iommu@382f00000 {
  1295				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1296				reg = <0x3 0x82f00000 0x0 0x4000>;
  1297				interrupt-parent = <&aic>;
  1298				interrupts = <AIC_IRQ 1035 IRQ_TYPE_LEVEL_HIGH>;
  1299				#iommu-cells = <1>;
  1300				power-domains = <&ps_atc0_usb>;
  1301			};
  1302	
  1303			dwc3_0_dart_1: iommu@382f80000 {
  1304				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1305				reg = <0x3 0x82f80000 0x0 0x4000>;
  1306				interrupt-parent = <&aic>;
  1307				interrupts = <AIC_IRQ 1035 IRQ_TYPE_LEVEL_HIGH>;
  1308				#iommu-cells = <1>;
  1309				power-domains = <&ps_atc0_usb>;
  1310			};
  1311	
  1312			atcphy0: phy@383000000 {
  1313				compatible = "apple,t8112-atcphy", "apple,t8103-atcphy";
  1314				reg = <0x3 0x83000000 0x0 0x4c000>,
  1315					<0x3 0x83050000 0x0 0x8000>,
  1316					<0x3 0x80000000 0x0 0x4000>,
  1317					<0x3 0x82a90000 0x0 0x4000>,
  1318					<0x3 0x82a84000 0x0 0x4000>;
  1319				reg-names = "core", "lpdptx", "axi2af", "usb2phy",
  1320					"pipehandler";
  1321	
  1322				#phy-cells = <1>;
  1323				#reset-cells = <0>;
  1324	
  1325				nvmem-cells = <&atcphy0_aus_cmn_shm_vreg_trim>,
  1326					<&atcphy0_auspll_rodco_encap>,
  1327					<&atcphy0_auspll_rodco_bias_adjust>,
  1328					<&atcphy0_auspll_fracn_dll_start_capcode>,
  1329					<&atcphy0_auspll_dtc_vreg_adjust>,
  1330					<&atcphy0_cio3pll_dco_coarsebin0>,
  1331					<&atcphy0_cio3pll_dco_coarsebin1>,
  1332					<&atcphy0_cio3pll_dll_start_capcode>,
  1333					<&atcphy0_cio3pll_dtc_vreg_adjust>;
  1334				nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
  1335					"auspll_rodco_encap",
  1336					"auspll_rodco_bias_adjust",
  1337					"auspll_fracn_dll_start_capcode",
  1338					"auspll_dtc_vreg_adjust",
  1339					"cio3pll_dco_coarsebin0",
  1340					"cio3pll_dco_coarsebin1",
  1341					"cio3pll_dll_start_capcode",
  1342					"cio3pll_dtc_vreg_adjust";
  1343	
  1344				orientation-switch;
  1345				mode-switch;
  1346				svid = <0xff01>, <0x8087>;
  1347				power-domains = <&ps_atc0_usb>;
  1348			};
  1349	
  1350			dwc3_1: usb@502280000 {
  1351				compatible = "apple,t8112-dwc3", "apple,dwc3", "snps,dwc3";
  1352				reg = <0x5 0x02280000 0x0 0x100000>;
  1353				interrupt-parent = <&aic>;
  1354				interrupts = <AIC_IRQ 1112 IRQ_TYPE_LEVEL_HIGH>;
  1355				dr_mode = "otg";
  1356				usb-role-switch;
  1357				role-switch-default-mode = "host";
  1358				iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
  1359				power-domains = <&ps_atc1_usb>;
  1360				resets = <&atcphy1>;
  1361				phys = <&atcphy1 PHY_TYPE_USB2>, <&atcphy1 PHY_TYPE_USB3>;
  1362				phy-names = "usb2-phy", "usb3-phy";
  1363			};
  1364	
  1365			dwc3_1_dart_0: iommu@502f00000 {
  1366				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1367				reg = <0x5 0x02f00000 0x0 0x4000>;
  1368				interrupt-parent = <&aic>;
  1369				interrupts = <AIC_IRQ 1116 IRQ_TYPE_LEVEL_HIGH>;
  1370				#iommu-cells = <1>;
  1371				power-domains = <&ps_atc1_usb>;
  1372			};
  1373	
  1374			dwc3_1_dart_1: iommu@502f80000 {
  1375				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1376				reg = <0x5 0x02f80000 0x0 0x4000>;
  1377				interrupt-parent = <&aic>;
  1378				interrupts = <AIC_IRQ 1116 IRQ_TYPE_LEVEL_HIGH>;
  1379				#iommu-cells = <1>;
  1380				power-domains = <&ps_atc1_usb>;
  1381			};
  1382	
  1383			atcphy1: phy@503000000 {
  1384				compatible = "apple,t8112-atcphy", "apple,t8103-atcphy";
  1385				reg = <0x5 0x03000000 0x0 0x4c000>,
  1386					<0x5 0x03050000 0x0 0x8000>,
  1387					<0x5 0x0 0x0 0x4000>,
  1388					<0x5 0x02a90000 0x0 0x4000>,
  1389					<0x5 0x02a84000 0x0 0x4000>;
  1390				reg-names = "core", "lpdptx", "axi2af", "usb2phy",
  1391					"pipehandler";
  1392	
  1393				nvmem-cells = <&atcphy1_aus_cmn_shm_vreg_trim>,
  1394					<&atcphy1_auspll_rodco_encap>,
  1395					<&atcphy1_auspll_rodco_bias_adjust>,
  1396					<&atcphy1_auspll_fracn_dll_start_capcode>,
  1397					<&atcphy1_auspll_dtc_vreg_adjust>,
  1398					<&atcphy1_cio3pll_dco_coarsebin0>,
  1399					<&atcphy1_cio3pll_dco_coarsebin1>,
  1400					<&atcphy1_cio3pll_dll_start_capcode>,
  1401					<&atcphy1_cio3pll_dtc_vreg_adjust>;
  1402				nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
  1403					"auspll_rodco_encap",
  1404					"auspll_rodco_bias_adjust",
  1405					"auspll_fracn_dll_start_capcode",
  1406					"auspll_dtc_vreg_adjust",
  1407					"cio3pll_dco_coarsebin0",
  1408					"cio3pll_dco_coarsebin1",
  1409					"cio3pll_dll_start_capcode",
  1410					"cio3pll_dtc_vreg_adjust";
  1411	
  1412				#phy-cells = <1>;
  1413				#reset-cells = <0>;
  1414	
  1415				orientation-switch;
  1416				mode-switch;
  1417				svid = <0xff01>, <0x8087>;
  1418				power-domains = <&ps_atc1_usb>;
  1419			};
  1420	
  1421			pcie0_dart: iommu@681008000 {
  1422				compatible = "apple,t8110-dart";
  1423				reg = <0x6 0x81008000 0x0 0x4000>;
  1424				#iommu-cells = <1>;
  1425				interrupt-parent = <&aic>;
  1426				interrupts = <AIC_IRQ 782 IRQ_TYPE_LEVEL_HIGH>;
  1427				power-domains = <&ps_apcie_gp>;
  1428			};
  1429	
  1430			pcie1_dart: iommu@682008000 {
  1431				compatible = "apple,t8110-dart";
  1432				reg = <0x6 0x82008000 0x0 0x4000>;
  1433				#iommu-cells = <1>;
  1434				interrupt-parent = <&aic>;
  1435				interrupts = <AIC_IRQ 785 IRQ_TYPE_LEVEL_HIGH>;
  1436				power-domains = <&ps_apcie_gp>;
  1437				status = "disabled";
  1438			};
  1439	
  1440			pcie2_dart: iommu@683008000 {
  1441				compatible = "apple,t8110-dart";
  1442				reg = <0x6 0x83008000 0x0 0x4000>;
  1443				#iommu-cells = <1>;
  1444				interrupt-parent = <&aic>;
  1445				interrupts = <AIC_IRQ 788 IRQ_TYPE_LEVEL_HIGH>;
  1446				power-domains = <&ps_apcie_gp>;
  1447				status = "disabled";
  1448			};
  1449	
  1450			pcie3_dart: iommu@684008000 {
  1451				compatible = "apple,t8110-dart";
  1452				reg = <0x6 0x84008000 0x0 0x4000>;
  1453				#iommu-cells = <1>;
  1454				interrupt-parent = <&aic>;
  1455				interrupts = <AIC_IRQ 791 IRQ_TYPE_LEVEL_HIGH>;
  1456				power-domains = <&ps_apcie_gp>;
  1457				status = "disabled";
  1458			};
  1459	
  1460			pcie0: pcie@690000000 {
  1461				compatible = "apple,t8112-pcie", "apple,pcie";
  1462				device_type = "pci";
  1463	
  1464				reg = <0x6 0x90000000 0x0 0x1000000>,
  1465				      <0x6 0x80000000 0x0 0x100000>,
  1466				      <0x6 0x81000000 0x0 0x4000>,
  1467				      <0x6 0x82000000 0x0 0x4000>,
  1468				      <0x6 0x83000000 0x0 0x4000>,
  1469				      <0x6 0x84000000 0x0 0x4000>;
  1470				reg-names = "config", "rc", "port0", "port1", "port2", "port3";
  1471	
  1472				interrupt-parent = <&aic>;
  1473				interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>,
  1474					     <AIC_IRQ 784 IRQ_TYPE_LEVEL_HIGH>,
  1475					     <AIC_IRQ 787 IRQ_TYPE_LEVEL_HIGH>,
  1476					     <AIC_IRQ 790 IRQ_TYPE_LEVEL_HIGH>;
  1477	
  1478				msi-controller;
  1479				msi-parent = <&pcie0>;
  1480				msi-ranges = <&aic AIC_IRQ 793 IRQ_TYPE_EDGE_RISING 32>;
  1481	
  1482				iommu-map = <0x100 &pcie0_dart 0 1>,
  1483					    <0x200 &pcie1_dart 1 1>,
  1484					    <0x300 &pcie2_dart 2 1>,
  1485					    <0x400 &pcie3_dart 3 1>;
  1486				iommu-map-mask = <0xff00>;
  1487	
  1488				bus-range = <0 4>;
  1489				#address-cells = <3>;
  1490				#size-cells = <2>;
  1491				ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
  1492					 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
  1493	
  1494				power-domains = <&ps_apcie_gp>;
  1495				pinctrl-0 = <&pcie_pins>;
  1496				pinctrl-names = "default";
  1497	
  1498				port00: pci@0,0 {
  1499					device_type = "pci";
  1500					reg = <0x0 0x0 0x0 0x0 0x0>;
  1501					reset-gpios = <&pinctrl_ap 166 GPIO_ACTIVE_LOW>;
  1502	
  1503					#address-cells = <3>;
  1504					#size-cells = <2>;
  1505					ranges;
  1506	
  1507					interrupt-controller;
  1508					#interrupt-cells = <1>;
  1509	
  1510					interrupt-map-mask = <0 0 0 7>;
  1511					interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
  1512							<0 0 0 2 &port00 0 0 0 1>,
  1513							<0 0 0 3 &port00 0 0 0 2>,
  1514							<0 0 0 4 &port00 0 0 0 3>;
  1515				};
  1516	
  1517				port01: pci@1,0 {
  1518					device_type = "pci";
  1519					reg = <0x800 0x0 0x0 0x0 0x0>;
  1520					reset-gpios = <&pinctrl_ap 167 GPIO_ACTIVE_LOW>;
  1521	
  1522					#address-cells = <3>;
  1523					#size-cells = <2>;
  1524					ranges;
  1525	
  1526					interrupt-controller;
  1527					#interrupt-cells = <1>;
  1528	
  1529					interrupt-map-mask = <0 0 0 7>;
  1530					interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
  1531							<0 0 0 2 &port01 0 0 0 1>,
  1532							<0 0 0 3 &port01 0 0 0 2>,
  1533							<0 0 0 4 &port01 0 0 0 3>;
  1534	
  1535					status = "disabled";
  1536				};
  1537	
  1538				port02: pci@2,0 {
  1539					device_type = "pci";
  1540					reg = <0x1000 0x0 0x0 0x0 0x0>;
  1541					reset-gpios = <&pinctrl_ap 168 GPIO_ACTIVE_LOW>;
  1542	
  1543					#address-cells = <3>;
  1544					#size-cells = <2>;
  1545					ranges;
  1546	
  1547					interrupt-controller;
  1548					#interrupt-cells = <1>;
  1549	
  1550					interrupt-map-mask = <0 0 0 7>;
  1551					interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
  1552							<0 0 0 2 &port02 0 0 0 1>,
  1553							<0 0 0 3 &port02 0 0 0 2>,
  1554							<0 0 0 4 &port02 0 0 0 3>;
  1555	
  1556					status = "disabled";
  1557				};
  1558	
  1559				/* TODO: GPIO unknown */
  1560				port03: pci@3,0 {
  1561					device_type = "pci";
  1562					reg = <0x1800 0x0 0x0 0x0 0x0>;
  1563					//reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
  1564	
  1565					#address-cells = <3>;
  1566					#size-cells = <2>;
  1567					ranges;
  1568	
  1569					interrupt-controller;
  1570					#interrupt-cells = <1>;
  1571	
  1572					interrupt-map-mask = <0 0 0 7>;
  1573					interrupt-map = <0 0 0 1 &port03 0 0 0 0>,
  1574							<0 0 0 2 &port03 0 0 0 1>,
  1575							<0 0 0 3 &port03 0 0 0 2>,
  1576							<0 0 0 4 &port03 0 0 0 3>;
  1577	
  1578					status = "disabled";
  1579				};
  1580			};
  1581		};
  1582	};
  1583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
