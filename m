Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529E417557
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718442657; cv=none; b=oDkztgR4u2MhLw4/zgLx/CGe1R+sXXm4VNJITAOiAuDtAXLqUYx4+r3gzMCmnIOWMZLO1ZPGmiB3h0uesEx4EM5/hQwDPn0wklo4oNzzYb8Of62clLWmr2vpSZD6dB3IKjMetOlsppQ+O2ZpXC7+Y6GsK2Tzk4ePzTUCNj4WGFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718442657; c=relaxed/simple;
	bh=e//tjEXNwnTORLs0/9p1OUZFlUJKM8JTYcSY0wz0i20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DyX20vvN/pypl5ErAv3cU5yrBpmWuCVqKumNqCernZ2An4PlOZ3cDcCnnq2WCHh7uC+W5Y9qLHosEeRiK7d5JHLi972+bEAIgRZ0yMTGApQ8QEvrMzD1SKxNAeJuhuBHw0GzPYulawmxYgB8tdcMCkgBAUxoq6XjD16T+O5Ymb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WS8NA41e; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WS8NA41e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718442654; x=1749978654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e//tjEXNwnTORLs0/9p1OUZFlUJKM8JTYcSY0wz0i20=;
  b=WS8NA41eRwxI6DRNU//C6KwfDZ36BnyKPMForQ5ym3Tpa3wd3uIT06V3
   xmxC2KwhFt+4hB+tjK6Wsux5VEJpzyCif73rt2o52IrJE3uMnXi3+k2cK
   RPUDvCz3EwHrlIuBcIpf+mwK69A+9OLkEJKmQvcYjtUjQ2Vk4T6kqiB5S
   Rzgbxpzqkwl+KtY+Agkf4o4oDqa80u+Vk7FGrBBvSWiJpxQUQZ26w+uNw
   LgfwG1FPRNpK2R91odfvxJhzms7dY+Sz1RNQ7d1DKUtjnj+BzZyTDmPea
   YVhN4X3DXwmGZk4Bn0luip22SRakwlLB2Bl/kNXu+W2mSEg9mmTFVdjaq
   A==;
X-CSE-ConnectionGUID: FNThfwubQq2J4AkJKIt9rg==
X-CSE-MsgGUID: SPB8HFNkTKabdgzCT9nTqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19165306"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="19165306"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 02:10:53 -0700
X-CSE-ConnectionGUID: JBzYDHvzTDG31uK4dLMfKw==
X-CSE-MsgGUID: b4pgzwZGTBKGiBN/65Ostw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="41456153"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Jun 2024 02:10:53 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIPQv-0002PT-2W;
	Sat, 15 Jun 2024 09:10:49 +0000
Date: Sat, 15 Jun 2024 17:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 33/184]
 arch/arm64/boot/dts/apple/t8103.dtsi:434.30-439.5: Warning (simple_bus_reg):
 /soc/display-subsystem: missing or empty reg/ranges property
Message-ID: <202406151725.oOaeaHdn-lkp@intel.com>
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
commit: ca445d49b86404d4ea0bda37f6502791c16b1786 [33/184] arch: arm64: apple: Add display controller related device tree nodes
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240615/202406151725.oOaeaHdn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151725.oOaeaHdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151725.oOaeaHdn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-j457.dts:82.14-91.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t8103.dtsi:434.30-439.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:755.43-758.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:97.10-106.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103-j313.dts:114.14-131.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:133.14-142.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t8103.dtsi:434.30-439.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:755.43-758.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:97.10-106.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103-j274.dts:102.14-111.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:113.14-122.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t8103.dtsi:434.30-439.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:755.43-758.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:97.10-106.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103-j293.dts:137.14-156.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:158.14-167.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t8103.dtsi:434.30-439.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:755.43-758.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:97.10-106.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103-j456.dts:109.14-118.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t8103.dtsi:434.30-439.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:755.43-758.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:13.10-21.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:72.10-81.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:97.10-106.6: Warning (graph_child_address): /soc/i2c@235010000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +434 arch/arm64/boot/dts/apple/t8103.dtsi

    15	
    16	/ {
    17		compatible = "apple,t8103", "apple,arm-platform";
    18	
    19		#address-cells = <2>;
    20		#size-cells = <2>;
    21	
    22		cpus {
    23			#address-cells = <2>;
    24			#size-cells = <0>;
    25	
    26			cpu-map {
    27				cluster0 {
    28					core0 {
    29						cpu = <&cpu_e0>;
    30					};
    31					core1 {
    32						cpu = <&cpu_e1>;
    33					};
    34					core2 {
    35						cpu = <&cpu_e2>;
    36					};
    37					core3 {
    38						cpu = <&cpu_e3>;
    39					};
    40				};
    41	
    42				cluster1 {
    43					core0 {
    44						cpu = <&cpu_p0>;
    45					};
    46					core1 {
    47						cpu = <&cpu_p1>;
    48					};
    49					core2 {
    50						cpu = <&cpu_p2>;
    51					};
    52					core3 {
    53						cpu = <&cpu_p3>;
    54					};
    55				};
    56			};
    57	
    58			cpu_e0: cpu@0 {
    59				compatible = "apple,icestorm";
    60				device_type = "cpu";
    61				reg = <0x0 0x0>;
    62				enable-method = "spin-table";
    63				cpu-release-addr = <0 0>; /* To be filled by loader */
    64				operating-points-v2 = <&ecluster_opp>;
    65				capacity-dmips-mhz = <714>;
    66				performance-domains = <&cpufreq_e>;
    67				next-level-cache = <&l2_cache_0>;
    68				i-cache-size = <0x20000>;
    69				d-cache-size = <0x10000>;
    70			};
    71	
    72			cpu_e1: cpu@1 {
    73				compatible = "apple,icestorm";
    74				device_type = "cpu";
    75				reg = <0x0 0x1>;
    76				enable-method = "spin-table";
    77				cpu-release-addr = <0 0>; /* To be filled by loader */
    78				operating-points-v2 = <&ecluster_opp>;
    79				capacity-dmips-mhz = <714>;
    80				performance-domains = <&cpufreq_e>;
    81				next-level-cache = <&l2_cache_0>;
    82				i-cache-size = <0x20000>;
    83				d-cache-size = <0x10000>;
    84			};
    85	
    86			cpu_e2: cpu@2 {
    87				compatible = "apple,icestorm";
    88				device_type = "cpu";
    89				reg = <0x0 0x2>;
    90				enable-method = "spin-table";
    91				cpu-release-addr = <0 0>; /* To be filled by loader */
    92				operating-points-v2 = <&ecluster_opp>;
    93				capacity-dmips-mhz = <714>;
    94				performance-domains = <&cpufreq_e>;
    95				next-level-cache = <&l2_cache_0>;
    96				i-cache-size = <0x20000>;
    97				d-cache-size = <0x10000>;
    98			};
    99	
   100			cpu_e3: cpu@3 {
   101				compatible = "apple,icestorm";
   102				device_type = "cpu";
   103				reg = <0x0 0x3>;
   104				enable-method = "spin-table";
   105				cpu-release-addr = <0 0>; /* To be filled by loader */
   106				operating-points-v2 = <&ecluster_opp>;
   107				capacity-dmips-mhz = <714>;
   108				performance-domains = <&cpufreq_e>;
   109				next-level-cache = <&l2_cache_0>;
   110				i-cache-size = <0x20000>;
   111				d-cache-size = <0x10000>;
   112			};
   113	
   114			cpu_p0: cpu@10100 {
   115				compatible = "apple,firestorm";
   116				device_type = "cpu";
   117				reg = <0x0 0x10100>;
   118				enable-method = "spin-table";
   119				cpu-release-addr = <0 0>; /* To be filled by loader */
   120				operating-points-v2 = <&pcluster_opp>;
   121				capacity-dmips-mhz = <1024>;
   122				performance-domains = <&cpufreq_p>;
   123				next-level-cache = <&l2_cache_1>;
   124				i-cache-size = <0x30000>;
   125				d-cache-size = <0x20000>;
   126			};
   127	
   128			cpu_p1: cpu@10101 {
   129				compatible = "apple,firestorm";
   130				device_type = "cpu";
   131				reg = <0x0 0x10101>;
   132				enable-method = "spin-table";
   133				cpu-release-addr = <0 0>; /* To be filled by loader */
   134				operating-points-v2 = <&pcluster_opp>;
   135				capacity-dmips-mhz = <1024>;
   136				performance-domains = <&cpufreq_p>;
   137				next-level-cache = <&l2_cache_1>;
   138				i-cache-size = <0x30000>;
   139				d-cache-size = <0x20000>;
   140			};
   141	
   142			cpu_p2: cpu@10102 {
   143				compatible = "apple,firestorm";
   144				device_type = "cpu";
   145				reg = <0x0 0x10102>;
   146				enable-method = "spin-table";
   147				cpu-release-addr = <0 0>; /* To be filled by loader */
   148				operating-points-v2 = <&pcluster_opp>;
   149				capacity-dmips-mhz = <1024>;
   150				performance-domains = <&cpufreq_p>;
   151				next-level-cache = <&l2_cache_1>;
   152				i-cache-size = <0x30000>;
   153				d-cache-size = <0x20000>;
   154			};
   155	
   156			cpu_p3: cpu@10103 {
   157				compatible = "apple,firestorm";
   158				device_type = "cpu";
   159				reg = <0x0 0x10103>;
   160				enable-method = "spin-table";
   161				cpu-release-addr = <0 0>; /* To be filled by loader */
   162				operating-points-v2 = <&pcluster_opp>;
   163				capacity-dmips-mhz = <1024>;
   164				performance-domains = <&cpufreq_p>;
   165				next-level-cache = <&l2_cache_1>;
   166				i-cache-size = <0x30000>;
   167				d-cache-size = <0x20000>;
   168			};
   169	
   170			l2_cache_0: l2-cache-0 {
   171				compatible = "cache";
   172				cache-level = <2>;
   173				cache-unified;
   174				cache-size = <0x400000>;
   175			};
   176	
   177			l2_cache_1: l2-cache-1 {
   178				compatible = "cache";
   179				cache-level = <2>;
   180				cache-unified;
   181				cache-size = <0xc00000>;
   182			};
   183		};
   184	
   185		ecluster_opp: opp-table-0 {
   186			compatible = "operating-points-v2";
   187	
   188			opp01 {
   189				opp-hz = /bits/ 64 <600000000>;
   190				opp-level = <1>;
   191				clock-latency-ns = <7500>;
   192			};
   193			opp02 {
   194				opp-hz = /bits/ 64 <972000000>;
   195				opp-level = <2>;
   196				clock-latency-ns = <22000>;
   197			};
   198			opp03 {
   199				opp-hz = /bits/ 64 <1332000000>;
   200				opp-level = <3>;
   201				clock-latency-ns = <27000>;
   202			};
   203			opp04 {
   204				opp-hz = /bits/ 64 <1704000000>;
   205				opp-level = <4>;
   206				clock-latency-ns = <33000>;
   207			};
   208			opp05 {
   209				opp-hz = /bits/ 64 <2064000000>;
   210				opp-level = <5>;
   211				clock-latency-ns = <50000>;
   212			};
   213		};
   214	
   215		pcluster_opp: opp-table-1 {
   216			compatible = "operating-points-v2";
   217	
   218			opp01 {
   219				opp-hz = /bits/ 64 <600000000>;
   220				opp-level = <1>;
   221				clock-latency-ns = <8000>;
   222			};
   223			opp02 {
   224				opp-hz = /bits/ 64 <828000000>;
   225				opp-level = <2>;
   226				clock-latency-ns = <19000>;
   227			};
   228			opp03 {
   229				opp-hz = /bits/ 64 <1056000000>;
   230				opp-level = <3>;
   231				clock-latency-ns = <21000>;
   232			};
   233			opp04 {
   234				opp-hz = /bits/ 64 <1284000000>;
   235				opp-level = <4>;
   236				clock-latency-ns = <23000>;
   237			};
   238			opp05 {
   239				opp-hz = /bits/ 64 <1500000000>;
   240				opp-level = <5>;
   241				clock-latency-ns = <24000>;
   242			};
   243			opp06 {
   244				opp-hz = /bits/ 64 <1728000000>;
   245				opp-level = <6>;
   246				clock-latency-ns = <29000>;
   247			};
   248			opp07 {
   249				opp-hz = /bits/ 64 <1956000000>;
   250				opp-level = <7>;
   251				clock-latency-ns = <31000>;
   252			};
   253			opp08 {
   254				opp-hz = /bits/ 64 <2184000000>;
   255				opp-level = <8>;
   256				clock-latency-ns = <34000>;
   257			};
   258			opp09 {
   259				opp-hz = /bits/ 64 <2388000000>;
   260				opp-level = <9>;
   261				clock-latency-ns = <36000>;
   262			};
   263			opp10 {
   264				opp-hz = /bits/ 64 <2592000000>;
   265				opp-level = <10>;
   266				clock-latency-ns = <51000>;
   267			};
   268			opp11 {
   269				opp-hz = /bits/ 64 <2772000000>;
   270				opp-level = <11>;
   271				clock-latency-ns = <54000>;
   272			};
   273			opp12 {
   274				opp-hz = /bits/ 64 <2988000000>;
   275				opp-level = <12>;
   276				clock-latency-ns = <55000>;
   277			};
   278	#if 0
   279			/* Not available until CPU deep sleep is implemented */
   280			opp13 {
   281				opp-hz = /bits/ 64 <3096000000>;
   282				opp-level = <13>;
   283				clock-latency-ns = <55000>;
   284				turbo-mode;
   285			};
   286			opp14 {
   287				opp-hz = /bits/ 64 <3144000000>;
   288				opp-level = <14>;
   289				clock-latency-ns = <56000>;
   290				turbo-mode;
   291			};
   292			opp15 {
   293				opp-hz = /bits/ 64 <3204000000>;
   294				opp-level = <15>;
   295				clock-latency-ns = <56000>;
   296				turbo-mode;
   297			};
   298	#endif
   299		};
   300	
   301		timer {
   302			compatible = "arm,armv8-timer";
   303			interrupt-parent = <&aic>;
   304			interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
   305			interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
   306				     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
   307				     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
   308				     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
   309		};
   310	
   311		pmu-e {
   312			compatible = "apple,icestorm-pmu";
   313			interrupt-parent = <&aic>;
   314			interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
   315		};
   316	
   317		pmu-p {
   318			compatible = "apple,firestorm-pmu";
   319			interrupt-parent = <&aic>;
   320			interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
   321		};
   322	
   323		clkref: clock-ref {
   324			compatible = "fixed-clock";
   325			#clock-cells = <0>;
   326			clock-frequency = <24000000>;
   327			clock-output-names = "clkref";
   328		};
   329	
   330		clk_120m: clock-120m {
   331			compatible = "fixed-clock";
   332			#clock-cells = <0>;
   333			clock-frequency = <120000000>;
   334			clock-output-names = "clk_120m";
   335		};
   336	
   337		/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
   338		clk_disp0: clock-disp0 {
   339			compatible = "fixed-clock";
   340			#clock-cells = <0>;
   341			clock-frequency = <533333328>;
   342			clock-output-names = "clk_disp0";
   343		};
   344	
   345		/*
   346		 * This is a fabulated representation of the input clock
   347		 * to NCO since we don't know the true clock tree.
   348		 */
   349		nco_clkref: clock-ref-nco {
   350			compatible = "fixed-clock";
   351			#clock-cells = <0>;
   352			clock-output-names = "nco_ref";
   353		};
   354	
   355		soc {
   356			compatible = "simple-bus";
   357			#address-cells = <2>;
   358			#size-cells = <2>;
   359	
   360			ranges;
   361			nonposted-mmio;
   362	
   363			cpufreq_e: performance-controller@210e20000 {
   364				compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
   365				reg = <0x2 0x10e20000 0 0x1000>;
   366				#performance-domain-cells = <0>;
   367			};
   368	
   369			cpufreq_p: performance-controller@211e20000 {
   370				compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
   371				reg = <0x2 0x11e20000 0 0x1000>;
   372				#performance-domain-cells = <0>;
   373			};
   374	
   375			disp0_dart: iommu@231304000 {
   376				compatible = "apple,t8103-dart";
   377				reg = <0x2 0x31304000 0x0 0x4000>;
   378				#iommu-cells = <1>;
   379				interrupt-parent = <&aic>;
   380				interrupts = <AIC_IRQ 445 IRQ_TYPE_LEVEL_HIGH>;
   381				status = "disabled";
   382			};
   383	
   384			dcp_dart: iommu@23130c000 {
   385				compatible = "apple,t8103-dart";
   386				reg = <0x2 0x3130c000 0x0 0x4000>;
   387				#iommu-cells = <1>;
   388				interrupt-parent = <&aic>;
   389				interrupts = <AIC_IRQ 445 IRQ_TYPE_LEVEL_HIGH>;
   390			};
   391	
   392			dcp_mbox: mbox@231c08000 {
   393				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
   394				reg = <0x2 0x31c08000 0x0 0x4000>;
   395				interrupt-parent = <&aic>;
   396				interrupts = <AIC_IRQ 427 IRQ_TYPE_LEVEL_HIGH>,
   397					<AIC_IRQ 428 IRQ_TYPE_LEVEL_HIGH>,
   398					<AIC_IRQ 429 IRQ_TYPE_LEVEL_HIGH>,
   399					<AIC_IRQ 430 IRQ_TYPE_LEVEL_HIGH>;
   400				interrupt-names = "send-empty", "send-not-empty",
   401					"recv-empty", "recv-not-empty";
   402				#mbox-cells = <0>;
   403				power-domains = <&ps_disp0_cpu0>;
   404				resets = <&ps_disp0_cpu0>;
   405			};
   406	
   407			dcp: dcp@231c00000 {
   408				compatible = "apple,t8103-dcp", "apple,dcp";
   409				mboxes = <&dcp_mbox>;
   410				mbox-names = "mbox";
   411				iommus = <&dcp_dart 0>;
   412	
   413				reg-names = "coproc", "disp-0", "disp-1", "disp-2",
   414					"disp-3", "disp-4";
   415				reg = <0x2 0x31c00000 0x0 0x4000>,
   416					<0x2 0x30000000 0x0 0x3e8000>,
   417					<0x2 0x31320000 0x0 0x4000>,
   418					<0x2 0x31344000 0x0 0x4000>,
   419					<0x2 0x31800000 0x0 0x800000>,
   420					<0x2 0x3b3d0000 0x0 0x4000>;
   421				apple,bw-scratch = <&pmgr_dcp 0 5 0x14>;
   422				apple,bw-doorbell = <&pmgr_dcp 1 6>;
   423				power-domains = <&ps_disp0_cpu0>;
   424				clocks = <&clk_disp0>;
   425				apple,asc-dram-mask = <0xf 0x00000000>;
   426				phandle = <&dcp>;
   427	
   428				disp0_piodma: piodma {
   429					iommus = <&disp0_dart 4>;
   430					phandle = <&disp0_piodma>;
   431				};
   432			};
   433	
 > 434			display: display-subsystem {
   435				compatible = "apple,display-subsystem";
   436				iommus = <&disp0_dart 0>;
   437				/* generate phandle explicitly for use in loader */
   438				phandle = <&display>;
   439			};
   440	
   441			sio_dart: iommu@235004000 {
   442				compatible = "apple,t8103-dart";
   443				reg = <0x2 0x35004000 0x0 0x4000>;
   444				interrupt-parent = <&aic>;
   445				interrupts = <AIC_IRQ 635 IRQ_TYPE_LEVEL_HIGH>;
   446				#iommu-cells = <1>;
   447				power-domains = <&ps_sio_cpu>;
   448			};
   449	
   450			i2c0: i2c@235010000 {
   451				compatible = "apple,t8103-i2c", "apple,i2c";
   452				reg = <0x2 0x35010000 0x0 0x4000>;
   453				clocks = <&clkref>;
   454				interrupt-parent = <&aic>;
   455				interrupts = <AIC_IRQ 627 IRQ_TYPE_LEVEL_HIGH>;
   456				pinctrl-0 = <&i2c0_pins>;
   457				pinctrl-names = "default";
   458				#address-cells = <0x1>;
   459				#size-cells = <0x0>;
   460				power-domains = <&ps_i2c0>;
   461			};
   462	
   463			i2c1: i2c@235014000 {
   464				compatible = "apple,t8103-i2c", "apple,i2c";
   465				reg = <0x2 0x35014000 0x0 0x4000>;
   466				clocks = <&clkref>;
   467				interrupt-parent = <&aic>;
   468				interrupts = <AIC_IRQ 628 IRQ_TYPE_LEVEL_HIGH>;
   469				pinctrl-0 = <&i2c1_pins>;
   470				pinctrl-names = "default";
   471				#address-cells = <0x1>;
   472				#size-cells = <0x0>;
   473				power-domains = <&ps_i2c1>;
   474			};
   475	
   476			i2c2: i2c@235018000 {
   477				compatible = "apple,t8103-i2c", "apple,i2c";
   478				reg = <0x2 0x35018000 0x0 0x4000>;
   479				clocks = <&clkref>;
   480				interrupt-parent = <&aic>;
   481				interrupts = <AIC_IRQ 629 IRQ_TYPE_LEVEL_HIGH>;
   482				pinctrl-0 = <&i2c2_pins>;
   483				pinctrl-names = "default";
   484				#address-cells = <0x1>;
   485				#size-cells = <0x0>;
   486				status = "disabled"; /* not used in all devices */
   487				power-domains = <&ps_i2c2>;
   488			};
   489	
   490			i2c3: i2c@23501c000 {
   491				compatible = "apple,t8103-i2c", "apple,i2c";
   492				reg = <0x2 0x3501c000 0x0 0x4000>;
   493				clocks = <&clkref>;
   494				interrupt-parent = <&aic>;
   495				interrupts = <AIC_IRQ 630 IRQ_TYPE_LEVEL_HIGH>;
   496				pinctrl-0 = <&i2c3_pins>;
   497				pinctrl-names = "default";
   498				#address-cells = <0x1>;
   499				#size-cells = <0x0>;
   500				power-domains = <&ps_i2c3>;
   501			};
   502	
   503			i2c4: i2c@235020000 {
   504				compatible = "apple,t8103-i2c", "apple,i2c";
   505				reg = <0x2 0x35020000 0x0 0x4000>;
   506				clocks = <&clkref>;
   507				interrupt-parent = <&aic>;
   508				interrupts = <AIC_IRQ 631 IRQ_TYPE_LEVEL_HIGH>;
   509				pinctrl-0 = <&i2c4_pins>;
   510				pinctrl-names = "default";
   511				#address-cells = <0x1>;
   512				#size-cells = <0x0>;
   513				power-domains = <&ps_i2c4>;
   514				status = "disabled"; /* only used in J293 */
   515			};
   516	
   517			fpwm1: pwm@235044000 {
   518				compatible = "apple,t8103-fpwm", "apple,s5l-fpwm";
   519				reg = <0x2 0x35044000 0x0 0x4000>;
   520				power-domains = <&ps_fpwm1>;
   521				clocks = <&clkref>;
   522				#pwm-cells = <2>;
   523				status = "disabled";
   524			};
   525	
   526			spi3: spi@23510c000 {
   527				compatible = "apple,t8103-spi", "apple,spi";
   528				reg = <0x2 0x3510c000 0x0 0x4000>;
   529				interrupt-parent = <&aic>;
   530				interrupts = <AIC_IRQ 617 IRQ_TYPE_LEVEL_HIGH>;
   531				clocks = <&clk_120m>;
   532				pinctrl-0 = <&spi3_pins>;
   533				pinctrl-names = "default";
   534				power-domains = <&ps_spi3>;
   535				#address-cells = <1>;
   536				#size-cells = <0>;
   537				status = "disabled"; /* only used in J293/J313 */
   538			};
   539	
   540			serial0: serial@235200000 {
   541				compatible = "apple,s5l-uart";
   542				reg = <0x2 0x35200000 0x0 0x1000>;
   543				reg-io-width = <4>;
   544				interrupt-parent = <&aic>;
   545				interrupts = <AIC_IRQ 605 IRQ_TYPE_LEVEL_HIGH>;
   546				/*
   547				 * TODO: figure out the clocking properly, there may
   548				 * be a third selectable clock.
   549				 */
   550				clocks = <&clkref>, <&clkref>;
   551				clock-names = "uart", "clk_uart_baud0";
   552				power-domains = <&ps_uart0>;
   553				status = "disabled";
   554			};
   555	
   556			serial2: serial@235208000 {
   557				compatible = "apple,s5l-uart";
   558				reg = <0x2 0x35208000 0x0 0x1000>;
   559				reg-io-width = <4>;
   560				interrupt-parent = <&aic>;
   561				interrupts = <AIC_IRQ 607 IRQ_TYPE_LEVEL_HIGH>;
   562				clocks = <&clkref>, <&clkref>;
   563				clock-names = "uart", "clk_uart_baud0";
   564				power-domains = <&ps_uart2>;
   565				status = "disabled";
   566			};
   567	
   568			admac: dma-controller@238200000 {
   569				compatible = "apple,t8103-admac", "apple,admac";
   570				reg = <0x2 0x38200000 0x0 0x34000>;
   571				dma-channels = <24>;
   572				interrupts-extended = <0>,
   573						      <&aic AIC_IRQ 626 IRQ_TYPE_LEVEL_HIGH>,
   574						      <0>,
   575						      <0>;
   576				#dma-cells = <1>;
   577				iommus = <&sio_dart 2>;
   578				power-domains = <&ps_sio_adma>;
   579				resets = <&ps_audio_p>;
   580			};
   581	
   582			mca: i2s@238400000 {
   583				compatible = "apple,t8103-mca", "apple,mca";
   584				reg = <0x2 0x38400000 0x0 0x18000>,
   585				      <0x2 0x38300000 0x0 0x30000>;
   586	
   587				interrupt-parent = <&aic>;
   588				interrupts = <AIC_IRQ 619 IRQ_TYPE_LEVEL_HIGH>,
   589					     <AIC_IRQ 620 IRQ_TYPE_LEVEL_HIGH>,
   590					     <AIC_IRQ 621 IRQ_TYPE_LEVEL_HIGH>,
   591					     <AIC_IRQ 622 IRQ_TYPE_LEVEL_HIGH>,
   592					     <AIC_IRQ 623 IRQ_TYPE_LEVEL_HIGH>,
   593					     <AIC_IRQ 624 IRQ_TYPE_LEVEL_HIGH>;
   594	
   595				resets = <&ps_audio_p>;
   596				clocks = <&nco 0>, <&nco 1>, <&nco 2>,
   597					 <&nco 3>, <&nco 4>, <&nco 4>;
   598				power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
   599						<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
   600				dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
   601				       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
   602				       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
   603				       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
   604				       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
   605				       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
   606				dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
   607					"tx1a", "rx1a", "tx1b", "rx1b",
   608					"tx2a", "rx2a", "tx2b", "rx2b",
   609					"tx3a", "rx3a", "tx3b", "rx3b",
   610					"tx4a", "rx4a", "tx4b", "rx4b",
   611					"tx5a", "rx5a", "tx5b", "rx5b";
   612	
   613				#sound-dai-cells = <1>;
   614			};
   615	
   616			nco: clock-controller@23b044000 {
   617				compatible = "apple,t8103-nco", "apple,nco";
   618				reg = <0x2 0x3b044000 0x0 0x14000>;
   619				clocks = <&nco_clkref>;
   620				#clock-cells = <1>;
   621			};
   622	
   623			aic: interrupt-controller@23b100000 {
   624				compatible = "apple,t8103-aic", "apple,aic";
   625				#interrupt-cells = <3>;
   626				interrupt-controller;
   627				reg = <0x2 0x3b100000 0x0 0x8000>;
   628				power-domains = <&ps_aic>;
   629	
   630				affinities {
   631					e-core-pmu-affinity {
   632						apple,fiq-index = <AIC_CPU_PMU_E>;
   633						cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
   634					};
   635	
   636					p-core-pmu-affinity {
   637						apple,fiq-index = <AIC_CPU_PMU_P>;
   638						cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
   639					};
   640				};
   641			};
   642	
   643			pmgr: power-management@23b700000 {
   644				compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
   645				#address-cells = <1>;
   646				#size-cells = <1>;
   647				reg = <0x2 0x3b700000 0 0x14000>;
   648			};
   649	
   650			pmgr_dcp: power-management@23b738000 {
   651				reg = <0x2 0x3b738000 0x0 0x1000>,
   652					<0x2 0x3bc3c000 0x0 0x1000>;
   653				reg-names = "dcp-bw-scratch", "dcp-bw-doorbell";
   654				#apple,bw-scratch-cells = <3>;
   655				#apple,bw-doorbell-cells = <2>;
   656			};
   657	
   658			pinctrl_ap: pinctrl@23c100000 {
   659				compatible = "apple,t8103-pinctrl", "apple,pinctrl";
   660				reg = <0x2 0x3c100000 0x0 0x100000>;
   661				power-domains = <&ps_gpio>;
   662	
   663				gpio-controller;
   664				#gpio-cells = <2>;
   665				gpio-ranges = <&pinctrl_ap 0 0 212>;
   666				apple,npins = <212>;
   667	
   668				interrupt-controller;
   669				#interrupt-cells = <2>;
   670				interrupt-parent = <&aic>;
   671				interrupts = <AIC_IRQ 190 IRQ_TYPE_LEVEL_HIGH>,
   672					     <AIC_IRQ 191 IRQ_TYPE_LEVEL_HIGH>,
   673					     <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>,
   674					     <AIC_IRQ 193 IRQ_TYPE_LEVEL_HIGH>,
   675					     <AIC_IRQ 194 IRQ_TYPE_LEVEL_HIGH>,
   676					     <AIC_IRQ 195 IRQ_TYPE_LEVEL_HIGH>,
   677					     <AIC_IRQ 196 IRQ_TYPE_LEVEL_HIGH>;
   678	
   679				i2c0_pins: i2c0-pins {
   680					pinmux = <APPLE_PINMUX(192, 1)>,
   681						 <APPLE_PINMUX(188, 1)>;
   682				};
   683	
   684				i2c1_pins: i2c1-pins {
   685					pinmux = <APPLE_PINMUX(201, 1)>,
   686						 <APPLE_PINMUX(199, 1)>;
   687				};
   688	
   689				i2c2_pins: i2c2-pins {
   690					pinmux = <APPLE_PINMUX(163, 1)>,
   691						 <APPLE_PINMUX(162, 1)>;
   692				};
   693	
   694				i2c3_pins: i2c3-pins {
   695					pinmux = <APPLE_PINMUX(73, 1)>,
   696						 <APPLE_PINMUX(72, 1)>;
   697				};
   698	
   699				i2c4_pins: i2c4-pins {
   700					pinmux = <APPLE_PINMUX(135, 1)>,
   701						 <APPLE_PINMUX(134, 1)>;
   702				};
   703	
   704				spi3_pins: spi3-pins {
   705					pinmux = <APPLE_PINMUX(46, 1)>,
   706						<APPLE_PINMUX(47, 1)>,
   707						<APPLE_PINMUX(48, 1)>,
   708						<APPLE_PINMUX(49, 1)>;
   709				};
   710	
   711				pcie_pins: pcie-pins {
   712					pinmux = <APPLE_PINMUX(150, 1)>,
   713						 <APPLE_PINMUX(151, 1)>,
   714						 <APPLE_PINMUX(32, 1)>;
   715				};
   716			};
   717	
   718			nub_spmi: spmi@23d0d9300 {
   719				compatible = "apple,t8103-spmi", "apple,spmi";
   720				reg = <0x2 0x3d0d9300 0x0 0x100>;
   721				#address-cells = <2>;
   722				#size-cells = <0>;
   723	
   724				pmu1: pmu@f {
   725					compatible = "apple,sera-pmu", "apple,spmi-pmu";
   726					reg = <0xf SPMI_USID>;
   727					#address-cells = <1>;
   728					#size-cells = <1>;
   729	
   730					rtc_nvmem@d000 {
   731						compatible = "apple,spmi-pmu-nvmem";
   732						reg = <0xd000 0x300>;
   733						#address-cells = <1>;
   734						#size-cells = <1>;
   735	
   736						pm_setting: pm-setting@1 {
   737							reg = <0x1 0x1>;
   738						};
   739	
   740						rtc_offset: rtc-offset@100 {
   741							reg = <0x100 0x6>;
   742						};
   743					};
   744	
   745					legacy_nvmem@9f00 {
   746						compatible = "apple,spmi-pmu-nvmem";
   747						reg = <0x9f00 0x20>;
   748						#address-cells = <1>;
   749						#size-cells = <1>;
   750	
   751						boot_stage: boot-stage@1 {
   752							reg = <0x1 0x1>;
   753						};
   754	
   755						boot_error_count: boot-error-count@2 {
   756							reg = <0x2 0x1>;
   757							bits = <0 4>;
   758						};
   759	
   760						panic_count: panic-count@2 {
   761							reg = <0x2 0x1>;
   762							bits = <4 4>;
   763						};
   764	
   765						boot_error_stage: boot-error-stage@3 {
   766							reg = <0x3 0x1>;
   767						};
   768	
   769						shutdown_flag: shutdown-flag@f {
   770							reg = <0xf 0x1>;
   771							bits = <3 1>;
   772						};
   773					};
   774	
   775					scrpad_nvmem@a000 {
   776						compatible = "apple,spmi-pmu-nvmem";
   777						reg = <0xa000 0x1000>;
   778						#address-cells = <1>;
   779						#size-cells = <1>;
   780	
   781						fault_shadow: fault-shadow@67b {
   782							reg = <0x67b 0x10>;
   783						};
   784	
   785						socd: socd@b00 {
   786							reg = <0xb00 0x400>;
   787						};
   788					};
   789	
   790				};
   791			};
   792	
   793			pinctrl_nub: pinctrl@23d1f0000 {
   794				compatible = "apple,t8103-pinctrl", "apple,pinctrl";
   795				reg = <0x2 0x3d1f0000 0x0 0x4000>;
   796				power-domains = <&ps_nub_gpio>;
   797	
   798				gpio-controller;
   799				#gpio-cells = <2>;
   800				gpio-ranges = <&pinctrl_nub 0 0 23>;
   801				apple,npins = <23>;
   802	
   803				interrupt-controller;
   804				#interrupt-cells = <2>;
   805				interrupt-parent = <&aic>;
   806				interrupts = <AIC_IRQ 330 IRQ_TYPE_LEVEL_HIGH>,
   807					     <AIC_IRQ 331 IRQ_TYPE_LEVEL_HIGH>,
   808					     <AIC_IRQ 332 IRQ_TYPE_LEVEL_HIGH>,
   809					     <AIC_IRQ 333 IRQ_TYPE_LEVEL_HIGH>,
   810					     <AIC_IRQ 334 IRQ_TYPE_LEVEL_HIGH>,
   811					     <AIC_IRQ 335 IRQ_TYPE_LEVEL_HIGH>,
   812					     <AIC_IRQ 336 IRQ_TYPE_LEVEL_HIGH>;
   813			};
   814	
   815			pmgr_mini: power-management@23d280000 {
   816				compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
   817				#address-cells = <1>;
   818				#size-cells = <1>;
   819				reg = <0x2 0x3d280000 0 0x4000>;
   820			};
   821	
   822			wdt: watchdog@23d2b0000 {
   823				compatible = "apple,t8103-wdt", "apple,wdt";
   824				reg = <0x2 0x3d2b0000 0x0 0x4000>;
   825				clocks = <&clkref>;
   826				interrupt-parent = <&aic>;
   827				interrupts = <AIC_IRQ 338 IRQ_TYPE_LEVEL_HIGH>;
   828			};
   829	
   830			smc_mbox: mbox@23e408000 {
   831				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
   832				reg = <0x2 0x3e408000 0x0 0x4000>;
   833				interrupt-parent = <&aic>;
   834				interrupts = <AIC_IRQ 400 IRQ_TYPE_LEVEL_HIGH>,
   835					<AIC_IRQ 401 IRQ_TYPE_LEVEL_HIGH>,
   836					<AIC_IRQ 402 IRQ_TYPE_LEVEL_HIGH>,
   837					<AIC_IRQ 403 IRQ_TYPE_LEVEL_HIGH>;
   838				interrupt-names = "send-empty", "send-not-empty",
   839					"recv-empty", "recv-not-empty";
   840				#mbox-cells = <0>;
   841			};
   842	
   843			smc: smc@23e400000 {
   844				compatible = "apple,t8103-smc", "apple,smc";
   845				reg = <0x2 0x3e400000 0x0 0x4000>,
   846					<0x2 0x3fe00000 0x0 0x100000>;
   847				reg-names = "smc", "sram";
   848				mboxes = <&smc_mbox>;
   849	
   850				smc_gpio: gpio {
   851					gpio-controller;
   852					#gpio-cells = <2>;
   853				};
   854	
   855				smc_rtc: rtc {
   856					nvmem-cells = <&rtc_offset>;
   857					nvmem-cell-names = "rtc_offset";
   858				};
   859	
   860				smc_reboot: reboot {
   861					nvmem-cells = <&shutdown_flag>, <&boot_stage>,
   862						<&boot_error_count>, <&panic_count>, <&pm_setting>;
   863					nvmem-cell-names = "shutdown_flag", "boot_stage",
   864						"boot_error_count", "panic_count", "pm_setting";
   865				};
   866			};
   867	
   868			pinctrl_smc: pinctrl@23e820000 {
   869				compatible = "apple,t8103-pinctrl", "apple,pinctrl";
   870				reg = <0x2 0x3e820000 0x0 0x4000>;
   871	
   872				gpio-controller;
   873				#gpio-cells = <2>;
   874				gpio-ranges = <&pinctrl_smc 0 0 16>;
   875				apple,npins = <16>;
   876	
   877				interrupt-controller;
   878				#interrupt-cells = <2>;
   879				interrupt-parent = <&aic>;
   880				interrupts = <AIC_IRQ 391 IRQ_TYPE_LEVEL_HIGH>,
   881					     <AIC_IRQ 392 IRQ_TYPE_LEVEL_HIGH>,
   882					     <AIC_IRQ 393 IRQ_TYPE_LEVEL_HIGH>,
   883					     <AIC_IRQ 394 IRQ_TYPE_LEVEL_HIGH>,
   884					     <AIC_IRQ 395 IRQ_TYPE_LEVEL_HIGH>,
   885					     <AIC_IRQ 396 IRQ_TYPE_LEVEL_HIGH>,
   886					     <AIC_IRQ 397 IRQ_TYPE_LEVEL_HIGH>;
   887			};
   888	
   889			pinctrl_aop: pinctrl@24a820000 {
   890				compatible = "apple,t8103-pinctrl", "apple,pinctrl";
   891				reg = <0x2 0x4a820000 0x0 0x4000>;
   892	
   893				gpio-controller;
   894				#gpio-cells = <2>;
   895				gpio-ranges = <&pinctrl_aop 0 0 42>;
   896				apple,npins = <42>;
   897	
   898				interrupt-controller;
   899				#interrupt-cells = <2>;
   900				interrupt-parent = <&aic>;
   901				interrupts = <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
   902					     <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>,
   903					     <AIC_IRQ 270 IRQ_TYPE_LEVEL_HIGH>,
   904					     <AIC_IRQ 271 IRQ_TYPE_LEVEL_HIGH>,
   905					     <AIC_IRQ 272 IRQ_TYPE_LEVEL_HIGH>,
   906					     <AIC_IRQ 273 IRQ_TYPE_LEVEL_HIGH>,
   907					     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
   908			};
   909	
   910			ans_mbox: mbox@277408000 {
   911				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
   912				reg = <0x2 0x77408000 0x0 0x4000>;
   913				interrupt-parent = <&aic>;
   914				interrupts = <AIC_IRQ 583 IRQ_TYPE_LEVEL_HIGH>,
   915					<AIC_IRQ 584 IRQ_TYPE_LEVEL_HIGH>,
   916					<AIC_IRQ 585 IRQ_TYPE_LEVEL_HIGH>,
   917					<AIC_IRQ 586 IRQ_TYPE_LEVEL_HIGH>;
   918				interrupt-names = "send-empty", "send-not-empty",
   919					"recv-empty", "recv-not-empty";
   920				#mbox-cells = <0>;
   921				power-domains = <&ps_ans2>;
   922			};
   923	
   924			sart: iommu@27bc50000 {
   925				compatible = "apple,t8103-sart";
   926				reg = <0x2 0x7bc50000 0x0 0x10000>;
   927				power-domains = <&ps_ans2>;
   928			};
   929	
   930			nvme@27bcc0000 {
   931				compatible = "apple,t8103-nvme-ans2", "apple,nvme-ans2";
   932				reg = <0x2 0x7bcc0000 0x0 0x40000>,
   933					<0x2 0x77400000 0x0 0x4000>;
   934				reg-names = "nvme", "ans";
   935				interrupt-parent = <&aic>;
   936				interrupts = <AIC_IRQ 590 IRQ_TYPE_LEVEL_HIGH>;
   937				mboxes = <&ans_mbox>;
   938				apple,sart = <&sart>;
   939				power-domains = <&ps_ans2>, <&ps_apcie_st>;
   940				power-domain-names = "ans", "apcie0";
   941				resets = <&ps_ans2>;
   942			};
   943	
   944			dwc3_0: usb@382280000 {
   945				compatible = "apple,t8103-dwc3", "apple,dwc3", "snps,dwc3";
   946				reg = <0x3 0x82280000 0x0 0x100000>;
   947				interrupt-parent = <&aic>;
   948				interrupts = <AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
   949				dr_mode = "otg";
   950				usb-role-switch;
   951				role-switch-default-mode = "host";
   952				iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
   953				power-domains = <&ps_atc0_usb>;
   954			};
   955	
   956			dwc3_0_dart_0: iommu@382f00000 {
   957				compatible = "apple,t8103-dart";
   958				reg = <0x3 0x82f00000 0x0 0x4000>;
   959				interrupt-parent = <&aic>;
   960				interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
   961				#iommu-cells = <1>;
   962				power-domains = <&ps_atc0_usb>;
   963			};
   964	
   965			dwc3_0_dart_1: iommu@382f80000 {
   966				compatible = "apple,t8103-dart";
   967				reg = <0x3 0x82f80000 0x0 0x4000>;
   968				interrupt-parent = <&aic>;
   969				interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
   970				#iommu-cells = <1>;
   971				power-domains = <&ps_atc0_usb>;
   972			};
   973	
   974			dwc3_1: usb@502280000 {
   975				compatible = "apple,t8103-dwc3", "apple,dwc3", "snps,dwc3";
   976				reg = <0x5 0x02280000 0x0 0x100000>;
   977				interrupt-parent = <&aic>;
   978				interrupts = <AIC_IRQ 857 IRQ_TYPE_LEVEL_HIGH>;
   979				dr_mode = "otg";
   980				usb-role-switch;
   981				role-switch-default-mode = "host";
   982				iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
   983				power-domains = <&ps_atc1_usb>;
   984			};
   985	
   986			dwc3_1_dart_0: iommu@502f00000 {
   987				compatible = "apple,t8103-dart";
   988				reg = <0x5 0x02f00000 0x0 0x4000>;
   989				interrupt-parent = <&aic>;
   990				interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
   991				#iommu-cells = <1>;
   992				power-domains = <&ps_atc1_usb>;
   993			};
   994	
   995			dwc3_1_dart_1: iommu@502f80000 {
   996				compatible = "apple,t8103-dart";
   997				reg = <0x5 0x02f80000 0x0 0x4000>;
   998				interrupt-parent = <&aic>;
   999				interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
  1000				#iommu-cells = <1>;
  1001				power-domains = <&ps_atc1_usb>;
  1002			};
  1003	
  1004			pcie0_dart_0: iommu@681008000 {
  1005				compatible = "apple,t8103-dart";
  1006				reg = <0x6 0x81008000 0x0 0x4000>;
  1007				#iommu-cells = <1>;
  1008				interrupt-parent = <&aic>;
  1009				interrupts = <AIC_IRQ 696 IRQ_TYPE_LEVEL_HIGH>;
  1010				power-domains = <&ps_apcie_gp>;
  1011			};
  1012	
  1013			pcie0_dart_1: iommu@682008000 {
  1014				compatible = "apple,t8103-dart";
  1015				reg = <0x6 0x82008000 0x0 0x4000>;
  1016				#iommu-cells = <1>;
  1017				interrupt-parent = <&aic>;
  1018				interrupts = <AIC_IRQ 699 IRQ_TYPE_LEVEL_HIGH>;
  1019				power-domains = <&ps_apcie_gp>;
  1020				status = "disabled";
  1021			};
  1022	
  1023			pcie0_dart_2: iommu@683008000 {
  1024				compatible = "apple,t8103-dart";
  1025				reg = <0x6 0x83008000 0x0 0x4000>;
  1026				#iommu-cells = <1>;
  1027				interrupt-parent = <&aic>;
  1028				interrupts = <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>;
  1029				power-domains = <&ps_apcie_gp>;
  1030				status = "disabled";
  1031			};
  1032	
  1033			pcie0: pcie@690000000 {
  1034				compatible = "apple,t8103-pcie", "apple,pcie";
  1035				device_type = "pci";
  1036	
  1037				reg = <0x6 0x90000000 0x0 0x1000000>,
  1038				      <0x6 0x80000000 0x0 0x100000>,
  1039				      <0x6 0x81000000 0x0 0x4000>,
  1040				      <0x6 0x82000000 0x0 0x4000>,
  1041				      <0x6 0x83000000 0x0 0x4000>;
  1042				reg-names = "config", "rc", "port0", "port1", "port2";
  1043	
  1044				interrupt-parent = <&aic>;
  1045				interrupts = <AIC_IRQ 695 IRQ_TYPE_LEVEL_HIGH>,
  1046					     <AIC_IRQ 698 IRQ_TYPE_LEVEL_HIGH>,
  1047					     <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>;
  1048	
  1049				msi-controller;
  1050				msi-parent = <&pcie0>;
  1051				msi-ranges = <&aic AIC_IRQ 704 IRQ_TYPE_EDGE_RISING 32>;
  1052	
  1053	
  1054				iommu-map = <0x100 &pcie0_dart_0 1 1>,
  1055					    <0x200 &pcie0_dart_1 1 1>,
  1056					    <0x300 &pcie0_dart_2 1 1>;
  1057				iommu-map-mask = <0xff00>;
  1058	
  1059				bus-range = <0 3>;
  1060				#address-cells = <3>;
  1061				#size-cells = <2>;
  1062				ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
  1063					 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
  1064	
  1065				power-domains = <&ps_apcie_gp>;
  1066				pinctrl-0 = <&pcie_pins>;
  1067				pinctrl-names = "default";
  1068	
  1069				port00: pci@0,0 {
  1070					device_type = "pci";
  1071					reg = <0x0 0x0 0x0 0x0 0x0>;
  1072					reset-gpios = <&pinctrl_ap 152 GPIO_ACTIVE_LOW>;
  1073	
  1074					#address-cells = <3>;
  1075					#size-cells = <2>;
  1076					ranges;
  1077	
  1078					interrupt-controller;
  1079					#interrupt-cells = <1>;
  1080	
  1081					interrupt-map-mask = <0 0 0 7>;
  1082					interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
  1083							<0 0 0 2 &port00 0 0 0 1>,
  1084							<0 0 0 3 &port00 0 0 0 2>,
  1085							<0 0 0 4 &port00 0 0 0 3>;
  1086				};
  1087	
  1088				port01: pci@1,0 {
  1089					device_type = "pci";
  1090					reg = <0x800 0x0 0x0 0x0 0x0>;
  1091					reset-gpios = <&pinctrl_ap 153 GPIO_ACTIVE_LOW>;
  1092	
  1093					#address-cells = <3>;
  1094					#size-cells = <2>;
  1095					ranges;
  1096	
  1097					interrupt-controller;
  1098					#interrupt-cells = <1>;
  1099	
  1100					interrupt-map-mask = <0 0 0 7>;
  1101					interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
  1102							<0 0 0 2 &port01 0 0 0 1>,
  1103							<0 0 0 3 &port01 0 0 0 2>,
  1104							<0 0 0 4 &port01 0 0 0 3>;
  1105					status = "disabled";
  1106				};
  1107	
  1108				port02: pci@2,0 {
  1109					device_type = "pci";
  1110					reg = <0x1000 0x0 0x0 0x0 0x0>;
  1111					reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
  1112	
  1113					#address-cells = <3>;
  1114					#size-cells = <2>;
  1115					ranges;
  1116	
  1117					interrupt-controller;
  1118					#interrupt-cells = <1>;
  1119	
  1120					interrupt-map-mask = <0 0 0 7>;
  1121					interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
  1122							<0 0 0 2 &port02 0 0 0 1>,
  1123							<0 0 0 3 &port02 0 0 0 2>,
  1124							<0 0 0 4 &port02 0 0 0 3>;
  1125					status = "disabled";
  1126				};
  1127			};
  1128		};
  1129	};
  1130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
