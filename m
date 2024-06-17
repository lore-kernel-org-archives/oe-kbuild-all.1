Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F44218F2D5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718613198; cv=none; b=QDe9siaV1SzOTBkh2O7wBKS0ivZqk/6MBmLVRKzoq06ULn3LWO6NRnC+LXF47R5DmmatsP7YNYttAzdyIxX8MVtN0JaA3+4ypyr3+Q7utD3UXtLzVG0y0D4QU807Fk+BqvgWNX0GIZs/l9MpAPwSUSBaxRs3GS1yVGypOVvEeL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718613198; c=relaxed/simple;
	bh=C5F0ojEd03lSl2lpugzNPF2HKxpEQCZWh9QPeFnMDaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jYSczmjBquwzwwh7gqMG3pS46jbVjWtyQNCQtc0DW3DcZQRPI4PtY2B3s6seABcrJoy5/i2UG/CxOM40ig8XvZc8/zJ2kheqqV99lZWY0ZHCDlQYQk0wjy9ZAGLRXJlndWN1pgZCF0oYM5Wd2bKXwGpbeiILqy1EPVYdY97EDMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4qs7/ZC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4qs7/ZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718613195; x=1750149195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C5F0ojEd03lSl2lpugzNPF2HKxpEQCZWh9QPeFnMDaM=;
  b=V4qs7/ZCK0yDr+y7WVoAemlCoINcKr0KrYN7KQpzebR8MTJiTZSGTVA2
   tuwNuibOC2ru/95M7CIw90XXrCYo4J0rRQbbH2Cgc0QT3yHyjmt8D79xY
   Fp0xvBdfX1WC/Tj+MXuD/ZwGqp/fdHI7gSRrhFBNccN4lCQ6uwYyNRVkD
   eKgNaQ6N0BQ+TbL77wHG5z25Wpn9LfCoKxUvm2Oee8P5efZi22Pn0FGZ3
   7T7L8oujoTHFxR2LJCYfq1aNbgyw5l5WdpQqsaCHifK/wpvj0zCuVOZbl
   5lmduGcf9XE1Gm8egM9qKFNqxAY4HYbo4pNlxYKjJun+SYnTKwGOdbJyi
   Q==;
X-CSE-ConnectionGUID: Sl9Hp5bJReCsACUBdf8j3g==
X-CSE-MsgGUID: N2+Qj36gQgGO6U15DxVSCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26114077"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26114077"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 01:33:15 -0700
X-CSE-ConnectionGUID: ckJ2JWDSR8KT0dOmwEeuLQ==
X-CSE-MsgGUID: 0F6tKQd8QVOCPJu3g7iwvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="45577258"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jun 2024 01:33:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ7na-000434-2o;
	Mon, 17 Jun 2024 08:33:10 +0000
Date: Mon, 17 Jun 2024 16:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 48/184]
 arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths):
 /aliases: aliases property name must include only lowercase and '-'
Message-ID: <202406171607.rAVzvhlQ-lkp@intel.com>
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
commit: e670ab378e51d66671d36006e007d536bc5e2645 [48/184] arm64: dts: Add GPU performance data to t8103.dts
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240617/202406171607.rAVzvhlQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171607.rAVzvhlQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171607.rAVzvhlQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:409.28-412.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:414.34-417.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:419.22-422.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j457.dts:91.14-100.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:536.30-541.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:857.43-860.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
>> arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8103.dtsi:409.28-412.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:414.34-417.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:419.22-422.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j313.dts:123.14-140.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:142.14-151.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:536.30-541.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:857.43-860.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
>> arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8103.dtsi:409.28-412.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:414.34-417.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:419.22-422.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j274.dts:106.14-115.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:117.14-126.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:536.30-541.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:857.43-860.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
>> arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8103.dtsi:409.28-412.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:414.34-417.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:419.22-422.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j293.dts:146.14-165.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:167.14-176.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:536.30-541.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:857.43-860.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
>> arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8103.dtsi:409.28-412.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:414.34-417.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:419.22-422.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j456.dts:118.14-127.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:536.30-541.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:857.43-860.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
>> arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +23 arch/arm64/boot/dts/apple/t8103.dtsi

    16	
    17	/ {
    18		compatible = "apple,t8103", "apple,arm-platform";
    19	
    20		#address-cells = <2>;
    21		#size-cells = <2>;
    22	
  > 23		aliases {
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
    64				compatible = "apple,icestorm";
    65				device_type = "cpu";
    66				reg = <0x0 0x0>;
    67				enable-method = "spin-table";
    68				cpu-release-addr = <0 0>; /* To be filled by loader */
    69				operating-points-v2 = <&ecluster_opp>;
    70				capacity-dmips-mhz = <714>;
    71				performance-domains = <&cpufreq_e>;
    72				next-level-cache = <&l2_cache_0>;
    73				i-cache-size = <0x20000>;
    74				d-cache-size = <0x10000>;
    75			};
    76	
    77			cpu_e1: cpu@1 {
    78				compatible = "apple,icestorm";
    79				device_type = "cpu";
    80				reg = <0x0 0x1>;
    81				enable-method = "spin-table";
    82				cpu-release-addr = <0 0>; /* To be filled by loader */
    83				operating-points-v2 = <&ecluster_opp>;
    84				capacity-dmips-mhz = <714>;
    85				performance-domains = <&cpufreq_e>;
    86				next-level-cache = <&l2_cache_0>;
    87				i-cache-size = <0x20000>;
    88				d-cache-size = <0x10000>;
    89			};
    90	
    91			cpu_e2: cpu@2 {
    92				compatible = "apple,icestorm";
    93				device_type = "cpu";
    94				reg = <0x0 0x2>;
    95				enable-method = "spin-table";
    96				cpu-release-addr = <0 0>; /* To be filled by loader */
    97				operating-points-v2 = <&ecluster_opp>;
    98				capacity-dmips-mhz = <714>;
    99				performance-domains = <&cpufreq_e>;
   100				next-level-cache = <&l2_cache_0>;
   101				i-cache-size = <0x20000>;
   102				d-cache-size = <0x10000>;
   103			};
   104	
   105			cpu_e3: cpu@3 {
   106				compatible = "apple,icestorm";
   107				device_type = "cpu";
   108				reg = <0x0 0x3>;
   109				enable-method = "spin-table";
   110				cpu-release-addr = <0 0>; /* To be filled by loader */
   111				operating-points-v2 = <&ecluster_opp>;
   112				capacity-dmips-mhz = <714>;
   113				performance-domains = <&cpufreq_e>;
   114				next-level-cache = <&l2_cache_0>;
   115				i-cache-size = <0x20000>;
   116				d-cache-size = <0x10000>;
   117			};
   118	
   119			cpu_p0: cpu@10100 {
   120				compatible = "apple,firestorm";
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
   134				compatible = "apple,firestorm";
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
   148				compatible = "apple,firestorm";
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
   162				compatible = "apple,firestorm";
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
   186				cache-size = <0xc00000>;
   187			};
   188		};
   189	
   190		ecluster_opp: opp-table-0 {
   191			compatible = "operating-points-v2";
   192	
   193			opp01 {
   194				opp-hz = /bits/ 64 <600000000>;
   195				opp-level = <1>;
   196				clock-latency-ns = <7500>;
   197			};
   198			opp02 {
   199				opp-hz = /bits/ 64 <972000000>;
   200				opp-level = <2>;
   201				clock-latency-ns = <22000>;
   202			};
   203			opp03 {
   204				opp-hz = /bits/ 64 <1332000000>;
   205				opp-level = <3>;
   206				clock-latency-ns = <27000>;
   207			};
   208			opp04 {
   209				opp-hz = /bits/ 64 <1704000000>;
   210				opp-level = <4>;
   211				clock-latency-ns = <33000>;
   212			};
   213			opp05 {
   214				opp-hz = /bits/ 64 <2064000000>;
   215				opp-level = <5>;
   216				clock-latency-ns = <50000>;
   217			};
   218		};
   219	
   220		pcluster_opp: opp-table-1 {
   221			compatible = "operating-points-v2";
   222	
   223			opp01 {
   224				opp-hz = /bits/ 64 <600000000>;
   225				opp-level = <1>;
   226				clock-latency-ns = <8000>;
   227			};
   228			opp02 {
   229				opp-hz = /bits/ 64 <828000000>;
   230				opp-level = <2>;
   231				clock-latency-ns = <19000>;
   232			};
   233			opp03 {
   234				opp-hz = /bits/ 64 <1056000000>;
   235				opp-level = <3>;
   236				clock-latency-ns = <21000>;
   237			};
   238			opp04 {
   239				opp-hz = /bits/ 64 <1284000000>;
   240				opp-level = <4>;
   241				clock-latency-ns = <23000>;
   242			};
   243			opp05 {
   244				opp-hz = /bits/ 64 <1500000000>;
   245				opp-level = <5>;
   246				clock-latency-ns = <24000>;
   247			};
   248			opp06 {
   249				opp-hz = /bits/ 64 <1728000000>;
   250				opp-level = <6>;
   251				clock-latency-ns = <29000>;
   252			};
   253			opp07 {
   254				opp-hz = /bits/ 64 <1956000000>;
   255				opp-level = <7>;
   256				clock-latency-ns = <31000>;
   257			};
   258			opp08 {
   259				opp-hz = /bits/ 64 <2184000000>;
   260				opp-level = <8>;
   261				clock-latency-ns = <34000>;
   262			};
   263			opp09 {
   264				opp-hz = /bits/ 64 <2388000000>;
   265				opp-level = <9>;
   266				clock-latency-ns = <36000>;
   267			};
   268			opp10 {
   269				opp-hz = /bits/ 64 <2592000000>;
   270				opp-level = <10>;
   271				clock-latency-ns = <51000>;
   272			};
   273			opp11 {
   274				opp-hz = /bits/ 64 <2772000000>;
   275				opp-level = <11>;
   276				clock-latency-ns = <54000>;
   277			};
   278			opp12 {
   279				opp-hz = /bits/ 64 <2988000000>;
   280				opp-level = <12>;
   281				clock-latency-ns = <55000>;
   282			};
   283	#if 0
   284			/* Not available until CPU deep sleep is implemented */
   285			opp13 {
   286				opp-hz = /bits/ 64 <3096000000>;
   287				opp-level = <13>;
   288				clock-latency-ns = <55000>;
   289				turbo-mode;
   290			};
   291			opp14 {
   292				opp-hz = /bits/ 64 <3144000000>;
   293				opp-level = <14>;
   294				clock-latency-ns = <56000>;
   295				turbo-mode;
   296			};
   297			opp15 {
   298				opp-hz = /bits/ 64 <3204000000>;
   299				opp-level = <15>;
   300				clock-latency-ns = <56000>;
   301				turbo-mode;
   302			};
   303	#endif
   304		};
   305	
   306		gpu_opp: opp-table-gpu {
   307			compatible = "operating-points-v2";
   308	
   309			/*
   310			 * NOTE: The voltage and power values are device-specific and
   311			 * must be filled in by the bootloader.
   312			 */
   313			opp00 {
   314				opp-hz = /bits/ 64 <0>;
   315				opp-microvolt = <400000>;
   316				apple,opp-rel-power = <0>;
   317			};
   318			opp01 {
   319				opp-hz = /bits/ 64 <396000000>;
   320				opp-microvolt = <603000>;
   321				apple,opp-rel-power = <19>;
   322			};
   323			opp02 {
   324				opp-hz = /bits/ 64 <528000000>;
   325				opp-microvolt = <640000>;
   326				apple,opp-rel-power = <26>;
   327			};
   328			opp03 {
   329				opp-hz = /bits/ 64 <720000000>;
   330				opp-microvolt = <690000>;
   331				apple,opp-rel-power = <38>;
   332			};
   333			opp04 {
   334				opp-hz = /bits/ 64 <924000000>;
   335				opp-microvolt = <784000>;
   336				apple,opp-rel-power = <60>;
   337			};
   338			opp05 {
   339				opp-hz = /bits/ 64 <1128000000>;
   340				opp-microvolt = <862000>;
   341				apple,opp-rel-power = <87>;
   342			};
   343			opp06 {
   344				opp-hz = /bits/ 64 <1278000000>;
   345				opp-microvolt = <931000>;
   346				apple,opp-rel-power = <100>;
   347			};
   348		};
   349	
   350		timer {
   351			compatible = "arm,armv8-timer";
   352			interrupt-parent = <&aic>;
   353			interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
   354			interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
   355				     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
   356				     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
   357				     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
   358		};
   359	
   360		pmu-e {
   361			compatible = "apple,icestorm-pmu";
   362			interrupt-parent = <&aic>;
   363			interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
   364		};
   365	
   366		pmu-p {
   367			compatible = "apple,firestorm-pmu";
   368			interrupt-parent = <&aic>;
   369			interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
   370		};
   371	
   372		clkref: clock-ref {
   373			compatible = "fixed-clock";
   374			#clock-cells = <0>;
   375			clock-frequency = <24000000>;
   376			clock-output-names = "clkref";
   377		};
   378	
   379		clk_120m: clock-120m {
   380			compatible = "fixed-clock";
   381			#clock-cells = <0>;
   382			clock-frequency = <120000000>;
   383			clock-output-names = "clk_120m";
   384		};
   385	
   386		/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
   387		clk_disp0: clock-disp0 {
   388			compatible = "fixed-clock";
   389			#clock-cells = <0>;
   390			clock-frequency = <533333328>;
   391			clock-output-names = "clk_disp0";
   392		};
   393	
   394		/*
   395		 * This is a fabulated representation of the input clock
   396		 * to NCO since we don't know the true clock tree.
   397		 */
   398		nco_clkref: clock-ref-nco {
   399			compatible = "fixed-clock";
   400			#clock-cells = <0>;
   401			clock-output-names = "nco_ref";
   402		};
   403	
   404		reserved-memory {
   405			#address-cells = <2>;
   406			#size-cells = <2>;
   407			ranges;
   408	
   409			uat_handoff: uat-handoff {
   410				reg = <0 0 0 0>;
   411				no-map;
   412			};
   413	
   414			uat_pagetables: uat-pagetables {
   415				reg = <0 0 0 0>;
   416				no-map;
   417			};
   418	
   419			uat_ttbs: uat-ttbs {
   420				reg = <0 0 0 0>;
   421				no-map;
   422			};
   423		};
   424	
   425		soc {
   426			compatible = "simple-bus";
   427			#address-cells = <2>;
   428			#size-cells = <2>;
   429	
   430			ranges;
   431			nonposted-mmio;
   432	
   433			gpu: gpu@206400000 {
   434				compatible = "apple,agx-t8103", "apple,agx-g13g";
   435				reg = <0x2 0x6400000 0 0x40000>,
   436					<0x2 0x4000000 0 0x1000000>;
   437				reg-names = "asc", "sgx";
   438				interrupt-parent = <&aic>;
   439				interrupts = <AIC_IRQ 563 IRQ_TYPE_LEVEL_HIGH>,
   440					<AIC_IRQ 564 IRQ_TYPE_LEVEL_HIGH>,
   441					<AIC_IRQ 565 IRQ_TYPE_LEVEL_HIGH>,
   442					<AIC_IRQ 566 IRQ_TYPE_LEVEL_HIGH>,
   443					<AIC_IRQ 579 IRQ_TYPE_LEVEL_HIGH>;
   444				mboxes = <&agx_mbox>;
   445				power-domains = <&ps_gfx>;
   446				memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>;
   447				memory-region-names = "ttbs", "pagetables", "handoff";
   448	
   449				operating-points-v2 = <&gpu_opp>;
   450			};
   451	
   452			agx_mbox: mbox@206408000 {
   453				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
   454				reg = <0x2 0x6408000 0x0 0x4000>;
   455				interrupt-parent = <&aic>;
   456				interrupts = <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
   457					<AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
   458					<AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
   459					<AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
   460				interrupt-names = "send-empty", "send-not-empty",
   461					"recv-empty", "recv-not-empty";
   462				#mbox-cells = <0>;
   463			};
   464	
   465			cpufreq_e: performance-controller@210e20000 {
   466				compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
   467				reg = <0x2 0x10e20000 0 0x1000>;
   468				#performance-domain-cells = <0>;
   469			};
   470	
   471			cpufreq_p: performance-controller@211e20000 {
   472				compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
   473				reg = <0x2 0x11e20000 0 0x1000>;
   474				#performance-domain-cells = <0>;
   475			};
   476	
   477			disp0_dart: iommu@231304000 {
   478				compatible = "apple,t8103-dart";
   479				reg = <0x2 0x31304000 0x0 0x4000>;
   480				#iommu-cells = <1>;
   481				interrupt-parent = <&aic>;
   482				interrupts = <AIC_IRQ 445 IRQ_TYPE_LEVEL_HIGH>;
   483				status = "disabled";
   484			};
   485	
   486			dcp_dart: iommu@23130c000 {
   487				compatible = "apple,t8103-dart";
   488				reg = <0x2 0x3130c000 0x0 0x4000>;
   489				#iommu-cells = <1>;
   490				interrupt-parent = <&aic>;
   491				interrupts = <AIC_IRQ 445 IRQ_TYPE_LEVEL_HIGH>;
   492			};
   493	
   494			dcp_mbox: mbox@231c08000 {
   495				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
   496				reg = <0x2 0x31c08000 0x0 0x4000>;
   497				interrupt-parent = <&aic>;
   498				interrupts = <AIC_IRQ 427 IRQ_TYPE_LEVEL_HIGH>,
   499					<AIC_IRQ 428 IRQ_TYPE_LEVEL_HIGH>,
   500					<AIC_IRQ 429 IRQ_TYPE_LEVEL_HIGH>,
   501					<AIC_IRQ 430 IRQ_TYPE_LEVEL_HIGH>;
   502				interrupt-names = "send-empty", "send-not-empty",
   503					"recv-empty", "recv-not-empty";
   504				#mbox-cells = <0>;
   505				power-domains = <&ps_disp0_cpu0>;
   506				resets = <&ps_disp0_cpu0>;
   507			};
   508	
   509			dcp: dcp@231c00000 {
   510				compatible = "apple,t8103-dcp", "apple,dcp";
   511				mboxes = <&dcp_mbox>;
   512				mbox-names = "mbox";
   513				iommus = <&dcp_dart 0>;
   514	
   515				reg-names = "coproc", "disp-0", "disp-1", "disp-2",
   516					"disp-3", "disp-4";
   517				reg = <0x2 0x31c00000 0x0 0x4000>,
   518					<0x2 0x30000000 0x0 0x3e8000>,
   519					<0x2 0x31320000 0x0 0x4000>,
   520					<0x2 0x31344000 0x0 0x4000>,
   521					<0x2 0x31800000 0x0 0x800000>,
   522					<0x2 0x3b3d0000 0x0 0x4000>;
   523				apple,bw-scratch = <&pmgr_dcp 0 5 0x14>;
   524				apple,bw-doorbell = <&pmgr_dcp 1 6>;
   525				power-domains = <&ps_disp0_cpu0>;
   526				clocks = <&clk_disp0>;
   527				apple,asc-dram-mask = <0xf 0x00000000>;
   528				phandle = <&dcp>;
   529	
   530				disp0_piodma: piodma {
   531					iommus = <&disp0_dart 4>;
   532					phandle = <&disp0_piodma>;
   533				};
   534			};
   535	
   536			display: display-subsystem {
   537				compatible = "apple,display-subsystem";
   538				iommus = <&disp0_dart 0>;
   539				/* generate phandle explicitly for use in loader */
   540				phandle = <&display>;
   541			};
   542	
   543			sio_dart: iommu@235004000 {
   544				compatible = "apple,t8103-dart";
   545				reg = <0x2 0x35004000 0x0 0x4000>;
   546				interrupt-parent = <&aic>;
   547				interrupts = <AIC_IRQ 635 IRQ_TYPE_LEVEL_HIGH>;
   548				#iommu-cells = <1>;
   549				power-domains = <&ps_sio_cpu>;
   550			};
   551	
   552			i2c0: i2c@235010000 {
   553				compatible = "apple,t8103-i2c", "apple,i2c";
   554				reg = <0x2 0x35010000 0x0 0x4000>;
   555				clocks = <&clkref>;
   556				interrupt-parent = <&aic>;
   557				interrupts = <AIC_IRQ 627 IRQ_TYPE_LEVEL_HIGH>;
   558				pinctrl-0 = <&i2c0_pins>;
   559				pinctrl-names = "default";
   560				#address-cells = <0x1>;
   561				#size-cells = <0x0>;
   562				power-domains = <&ps_i2c0>;
   563			};
   564	
   565			i2c1: i2c@235014000 {
   566				compatible = "apple,t8103-i2c", "apple,i2c";
   567				reg = <0x2 0x35014000 0x0 0x4000>;
   568				clocks = <&clkref>;
   569				interrupt-parent = <&aic>;
   570				interrupts = <AIC_IRQ 628 IRQ_TYPE_LEVEL_HIGH>;
   571				pinctrl-0 = <&i2c1_pins>;
   572				pinctrl-names = "default";
   573				#address-cells = <0x1>;
   574				#size-cells = <0x0>;
   575				power-domains = <&ps_i2c1>;
   576			};
   577	
   578			i2c2: i2c@235018000 {
   579				compatible = "apple,t8103-i2c", "apple,i2c";
   580				reg = <0x2 0x35018000 0x0 0x4000>;
   581				clocks = <&clkref>;
   582				interrupt-parent = <&aic>;
   583				interrupts = <AIC_IRQ 629 IRQ_TYPE_LEVEL_HIGH>;
   584				pinctrl-0 = <&i2c2_pins>;
   585				pinctrl-names = "default";
   586				#address-cells = <0x1>;
   587				#size-cells = <0x0>;
   588				status = "disabled"; /* not used in all devices */
   589				power-domains = <&ps_i2c2>;
   590			};
   591	
   592			i2c3: i2c@23501c000 {
   593				compatible = "apple,t8103-i2c", "apple,i2c";
   594				reg = <0x2 0x3501c000 0x0 0x4000>;
   595				clocks = <&clkref>;
   596				interrupt-parent = <&aic>;
   597				interrupts = <AIC_IRQ 630 IRQ_TYPE_LEVEL_HIGH>;
   598				pinctrl-0 = <&i2c3_pins>;
   599				pinctrl-names = "default";
   600				#address-cells = <0x1>;
   601				#size-cells = <0x0>;
   602				power-domains = <&ps_i2c3>;
   603			};
   604	
   605			i2c4: i2c@235020000 {
   606				compatible = "apple,t8103-i2c", "apple,i2c";
   607				reg = <0x2 0x35020000 0x0 0x4000>;
   608				clocks = <&clkref>;
   609				interrupt-parent = <&aic>;
   610				interrupts = <AIC_IRQ 631 IRQ_TYPE_LEVEL_HIGH>;
   611				pinctrl-0 = <&i2c4_pins>;
   612				pinctrl-names = "default";
   613				#address-cells = <0x1>;
   614				#size-cells = <0x0>;
   615				power-domains = <&ps_i2c4>;
   616				status = "disabled"; /* only used in J293 */
   617			};
   618	
   619			fpwm1: pwm@235044000 {
   620				compatible = "apple,t8103-fpwm", "apple,s5l-fpwm";
   621				reg = <0x2 0x35044000 0x0 0x4000>;
   622				power-domains = <&ps_fpwm1>;
   623				clocks = <&clkref>;
   624				#pwm-cells = <2>;
   625				status = "disabled";
   626			};
   627	
   628			spi3: spi@23510c000 {
   629				compatible = "apple,t8103-spi", "apple,spi";
   630				reg = <0x2 0x3510c000 0x0 0x4000>;
   631				interrupt-parent = <&aic>;
   632				interrupts = <AIC_IRQ 617 IRQ_TYPE_LEVEL_HIGH>;
   633				clocks = <&clk_120m>;
   634				pinctrl-0 = <&spi3_pins>;
   635				pinctrl-names = "default";
   636				power-domains = <&ps_spi3>;
   637				#address-cells = <1>;
   638				#size-cells = <0>;
   639				status = "disabled"; /* only used in J293/J313 */
   640			};
   641	
   642			serial0: serial@235200000 {
   643				compatible = "apple,s5l-uart";
   644				reg = <0x2 0x35200000 0x0 0x1000>;
   645				reg-io-width = <4>;
   646				interrupt-parent = <&aic>;
   647				interrupts = <AIC_IRQ 605 IRQ_TYPE_LEVEL_HIGH>;
   648				/*
   649				 * TODO: figure out the clocking properly, there may
   650				 * be a third selectable clock.
   651				 */
   652				clocks = <&clkref>, <&clkref>;
   653				clock-names = "uart", "clk_uart_baud0";
   654				power-domains = <&ps_uart0>;
   655				status = "disabled";
   656			};
   657	
   658			serial2: serial@235208000 {
   659				compatible = "apple,s5l-uart";
   660				reg = <0x2 0x35208000 0x0 0x1000>;
   661				reg-io-width = <4>;
   662				interrupt-parent = <&aic>;
   663				interrupts = <AIC_IRQ 607 IRQ_TYPE_LEVEL_HIGH>;
   664				clocks = <&clkref>, <&clkref>;
   665				clock-names = "uart", "clk_uart_baud0";
   666				power-domains = <&ps_uart2>;
   667				status = "disabled";
   668			};
   669	
   670			admac: dma-controller@238200000 {
   671				compatible = "apple,t8103-admac", "apple,admac";
   672				reg = <0x2 0x38200000 0x0 0x34000>;
   673				dma-channels = <24>;
   674				interrupts-extended = <0>,
   675						      <&aic AIC_IRQ 626 IRQ_TYPE_LEVEL_HIGH>,
   676						      <0>,
   677						      <0>;
   678				#dma-cells = <1>;
   679				iommus = <&sio_dart 2>;
   680				power-domains = <&ps_sio_adma>;
   681				resets = <&ps_audio_p>;
   682			};
   683	
   684			mca: i2s@238400000 {
   685				compatible = "apple,t8103-mca", "apple,mca";
   686				reg = <0x2 0x38400000 0x0 0x18000>,
   687				      <0x2 0x38300000 0x0 0x30000>;
   688	
   689				interrupt-parent = <&aic>;
   690				interrupts = <AIC_IRQ 619 IRQ_TYPE_LEVEL_HIGH>,
   691					     <AIC_IRQ 620 IRQ_TYPE_LEVEL_HIGH>,
   692					     <AIC_IRQ 621 IRQ_TYPE_LEVEL_HIGH>,
   693					     <AIC_IRQ 622 IRQ_TYPE_LEVEL_HIGH>,
   694					     <AIC_IRQ 623 IRQ_TYPE_LEVEL_HIGH>,
   695					     <AIC_IRQ 624 IRQ_TYPE_LEVEL_HIGH>;
   696	
   697				resets = <&ps_audio_p>;
   698				clocks = <&nco 0>, <&nco 1>, <&nco 2>,
   699					 <&nco 3>, <&nco 4>, <&nco 4>;
   700				power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
   701						<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
   702				dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
   703				       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
   704				       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
   705				       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
   706				       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
   707				       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
   708				dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
   709					"tx1a", "rx1a", "tx1b", "rx1b",
   710					"tx2a", "rx2a", "tx2b", "rx2b",
   711					"tx3a", "rx3a", "tx3b", "rx3b",
   712					"tx4a", "rx4a", "tx4b", "rx4b",
   713					"tx5a", "rx5a", "tx5b", "rx5b";
   714	
   715				#sound-dai-cells = <1>;
   716			};
   717	
   718			nco: clock-controller@23b044000 {
   719				compatible = "apple,t8103-nco", "apple,nco";
   720				reg = <0x2 0x3b044000 0x0 0x14000>;
   721				clocks = <&nco_clkref>;
   722				#clock-cells = <1>;
   723			};
   724	
   725			aic: interrupt-controller@23b100000 {
   726				compatible = "apple,t8103-aic", "apple,aic";
   727				#interrupt-cells = <3>;
   728				interrupt-controller;
   729				reg = <0x2 0x3b100000 0x0 0x8000>;
   730				power-domains = <&ps_aic>;
   731	
   732				affinities {
   733					e-core-pmu-affinity {
   734						apple,fiq-index = <AIC_CPU_PMU_E>;
   735						cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
   736					};
   737	
   738					p-core-pmu-affinity {
   739						apple,fiq-index = <AIC_CPU_PMU_P>;
   740						cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
   741					};
   742				};
   743			};
   744	
   745			pmgr: power-management@23b700000 {
   746				compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
   747				#address-cells = <1>;
   748				#size-cells = <1>;
   749				reg = <0x2 0x3b700000 0 0x14000>;
   750			};
   751	
   752			pmgr_dcp: power-management@23b738000 {
   753				reg = <0x2 0x3b738000 0x0 0x1000>,
   754					<0x2 0x3bc3c000 0x0 0x1000>;
   755				reg-names = "dcp-bw-scratch", "dcp-bw-doorbell";
   756				#apple,bw-scratch-cells = <3>;
   757				#apple,bw-doorbell-cells = <2>;
   758			};
   759	
   760			pinctrl_ap: pinctrl@23c100000 {
   761				compatible = "apple,t8103-pinctrl", "apple,pinctrl";
   762				reg = <0x2 0x3c100000 0x0 0x100000>;
   763				power-domains = <&ps_gpio>;
   764	
   765				gpio-controller;
   766				#gpio-cells = <2>;
   767				gpio-ranges = <&pinctrl_ap 0 0 212>;
   768				apple,npins = <212>;
   769	
   770				interrupt-controller;
   771				#interrupt-cells = <2>;
   772				interrupt-parent = <&aic>;
   773				interrupts = <AIC_IRQ 190 IRQ_TYPE_LEVEL_HIGH>,
   774					     <AIC_IRQ 191 IRQ_TYPE_LEVEL_HIGH>,
   775					     <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>,
   776					     <AIC_IRQ 193 IRQ_TYPE_LEVEL_HIGH>,
   777					     <AIC_IRQ 194 IRQ_TYPE_LEVEL_HIGH>,
   778					     <AIC_IRQ 195 IRQ_TYPE_LEVEL_HIGH>,
   779					     <AIC_IRQ 196 IRQ_TYPE_LEVEL_HIGH>;
   780	
   781				i2c0_pins: i2c0-pins {
   782					pinmux = <APPLE_PINMUX(192, 1)>,
   783						 <APPLE_PINMUX(188, 1)>;
   784				};
   785	
   786				i2c1_pins: i2c1-pins {
   787					pinmux = <APPLE_PINMUX(201, 1)>,
   788						 <APPLE_PINMUX(199, 1)>;
   789				};
   790	
   791				i2c2_pins: i2c2-pins {
   792					pinmux = <APPLE_PINMUX(163, 1)>,
   793						 <APPLE_PINMUX(162, 1)>;
   794				};
   795	
   796				i2c3_pins: i2c3-pins {
   797					pinmux = <APPLE_PINMUX(73, 1)>,
   798						 <APPLE_PINMUX(72, 1)>;
   799				};
   800	
   801				i2c4_pins: i2c4-pins {
   802					pinmux = <APPLE_PINMUX(135, 1)>,
   803						 <APPLE_PINMUX(134, 1)>;
   804				};
   805	
   806				spi3_pins: spi3-pins {
   807					pinmux = <APPLE_PINMUX(46, 1)>,
   808						<APPLE_PINMUX(47, 1)>,
   809						<APPLE_PINMUX(48, 1)>,
   810						<APPLE_PINMUX(49, 1)>;
   811				};
   812	
   813				pcie_pins: pcie-pins {
   814					pinmux = <APPLE_PINMUX(150, 1)>,
   815						 <APPLE_PINMUX(151, 1)>,
   816						 <APPLE_PINMUX(32, 1)>;
   817				};
   818			};
   819	
   820			nub_spmi: spmi@23d0d9300 {
   821				compatible = "apple,t8103-spmi", "apple,spmi";
   822				reg = <0x2 0x3d0d9300 0x0 0x100>;
   823				#address-cells = <2>;
   824				#size-cells = <0>;
   825	
   826				pmu1: pmu@f {
   827					compatible = "apple,sera-pmu", "apple,spmi-pmu";
   828					reg = <0xf SPMI_USID>;
   829					#address-cells = <1>;
   830					#size-cells = <1>;
   831	
   832					rtc_nvmem@d000 {
   833						compatible = "apple,spmi-pmu-nvmem";
   834						reg = <0xd000 0x300>;
   835						#address-cells = <1>;
   836						#size-cells = <1>;
   837	
   838						pm_setting: pm-setting@1 {
   839							reg = <0x1 0x1>;
   840						};
   841	
   842						rtc_offset: rtc-offset@100 {
   843							reg = <0x100 0x6>;
   844						};
   845					};
   846	
   847					legacy_nvmem@9f00 {
   848						compatible = "apple,spmi-pmu-nvmem";
   849						reg = <0x9f00 0x20>;
   850						#address-cells = <1>;
   851						#size-cells = <1>;
   852	
   853						boot_stage: boot-stage@1 {
   854							reg = <0x1 0x1>;
   855						};
   856	
   857						boot_error_count: boot-error-count@2 {
   858							reg = <0x2 0x1>;
   859							bits = <0 4>;
   860						};
   861	
   862						panic_count: panic-count@2 {
   863							reg = <0x2 0x1>;
   864							bits = <4 4>;
   865						};
   866	
   867						boot_error_stage: boot-error-stage@3 {
   868							reg = <0x3 0x1>;
   869						};
   870	
   871						shutdown_flag: shutdown-flag@f {
   872							reg = <0xf 0x1>;
   873							bits = <3 1>;
   874						};
   875					};
   876	
   877					scrpad_nvmem@a000 {
   878						compatible = "apple,spmi-pmu-nvmem";
   879						reg = <0xa000 0x1000>;
   880						#address-cells = <1>;
   881						#size-cells = <1>;
   882	
   883						fault_shadow: fault-shadow@67b {
   884							reg = <0x67b 0x10>;
   885						};
   886	
   887						socd: socd@b00 {
   888							reg = <0xb00 0x400>;
   889						};
   890					};
   891	
   892				};
   893			};
   894	
   895			pinctrl_nub: pinctrl@23d1f0000 {
   896				compatible = "apple,t8103-pinctrl", "apple,pinctrl";
   897				reg = <0x2 0x3d1f0000 0x0 0x4000>;
   898				power-domains = <&ps_nub_gpio>;
   899	
   900				gpio-controller;
   901				#gpio-cells = <2>;
   902				gpio-ranges = <&pinctrl_nub 0 0 23>;
   903				apple,npins = <23>;
   904	
   905				interrupt-controller;
   906				#interrupt-cells = <2>;
   907				interrupt-parent = <&aic>;
   908				interrupts = <AIC_IRQ 330 IRQ_TYPE_LEVEL_HIGH>,
   909					     <AIC_IRQ 331 IRQ_TYPE_LEVEL_HIGH>,
   910					     <AIC_IRQ 332 IRQ_TYPE_LEVEL_HIGH>,
   911					     <AIC_IRQ 333 IRQ_TYPE_LEVEL_HIGH>,
   912					     <AIC_IRQ 334 IRQ_TYPE_LEVEL_HIGH>,
   913					     <AIC_IRQ 335 IRQ_TYPE_LEVEL_HIGH>,
   914					     <AIC_IRQ 336 IRQ_TYPE_LEVEL_HIGH>;
   915			};
   916	
   917			pmgr_mini: power-management@23d280000 {
   918				compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
   919				#address-cells = <1>;
   920				#size-cells = <1>;
   921				reg = <0x2 0x3d280000 0 0x4000>;
   922			};
   923	
   924			wdt: watchdog@23d2b0000 {
   925				compatible = "apple,t8103-wdt", "apple,wdt";
   926				reg = <0x2 0x3d2b0000 0x0 0x4000>;
   927				clocks = <&clkref>;
   928				interrupt-parent = <&aic>;
   929				interrupts = <AIC_IRQ 338 IRQ_TYPE_LEVEL_HIGH>;
   930			};
   931	
   932			smc_mbox: mbox@23e408000 {
   933				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
   934				reg = <0x2 0x3e408000 0x0 0x4000>;
   935				interrupt-parent = <&aic>;
   936				interrupts = <AIC_IRQ 400 IRQ_TYPE_LEVEL_HIGH>,
   937					<AIC_IRQ 401 IRQ_TYPE_LEVEL_HIGH>,
   938					<AIC_IRQ 402 IRQ_TYPE_LEVEL_HIGH>,
   939					<AIC_IRQ 403 IRQ_TYPE_LEVEL_HIGH>;
   940				interrupt-names = "send-empty", "send-not-empty",
   941					"recv-empty", "recv-not-empty";
   942				#mbox-cells = <0>;
   943			};
   944	
   945			smc: smc@23e400000 {
   946				compatible = "apple,t8103-smc", "apple,smc";
   947				reg = <0x2 0x3e400000 0x0 0x4000>,
   948					<0x2 0x3fe00000 0x0 0x100000>;
   949				reg-names = "smc", "sram";
   950				mboxes = <&smc_mbox>;
   951	
   952				smc_gpio: gpio {
   953					gpio-controller;
   954					#gpio-cells = <2>;
   955				};
   956	
   957				smc_rtc: rtc {
   958					nvmem-cells = <&rtc_offset>;
   959					nvmem-cell-names = "rtc_offset";
   960				};
   961	
   962				smc_reboot: reboot {
   963					nvmem-cells = <&shutdown_flag>, <&boot_stage>,
   964						<&boot_error_count>, <&panic_count>, <&pm_setting>;
   965					nvmem-cell-names = "shutdown_flag", "boot_stage",
   966						"boot_error_count", "panic_count", "pm_setting";
   967				};
   968			};
   969	
   970			pinctrl_smc: pinctrl@23e820000 {
   971				compatible = "apple,t8103-pinctrl", "apple,pinctrl";
   972				reg = <0x2 0x3e820000 0x0 0x4000>;
   973	
   974				gpio-controller;
   975				#gpio-cells = <2>;
   976				gpio-ranges = <&pinctrl_smc 0 0 16>;
   977				apple,npins = <16>;
   978	
   979				interrupt-controller;
   980				#interrupt-cells = <2>;
   981				interrupt-parent = <&aic>;
   982				interrupts = <AIC_IRQ 391 IRQ_TYPE_LEVEL_HIGH>,
   983					     <AIC_IRQ 392 IRQ_TYPE_LEVEL_HIGH>,
   984					     <AIC_IRQ 393 IRQ_TYPE_LEVEL_HIGH>,
   985					     <AIC_IRQ 394 IRQ_TYPE_LEVEL_HIGH>,
   986					     <AIC_IRQ 395 IRQ_TYPE_LEVEL_HIGH>,
   987					     <AIC_IRQ 396 IRQ_TYPE_LEVEL_HIGH>,
   988					     <AIC_IRQ 397 IRQ_TYPE_LEVEL_HIGH>;
   989			};
   990	
   991			pinctrl_aop: pinctrl@24a820000 {
   992				compatible = "apple,t8103-pinctrl", "apple,pinctrl";
   993				reg = <0x2 0x4a820000 0x0 0x4000>;
   994	
   995				gpio-controller;
   996				#gpio-cells = <2>;
   997				gpio-ranges = <&pinctrl_aop 0 0 42>;
   998				apple,npins = <42>;
   999	
  1000				interrupt-controller;
  1001				#interrupt-cells = <2>;
  1002				interrupt-parent = <&aic>;
  1003				interrupts = <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
  1004					     <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>,
  1005					     <AIC_IRQ 270 IRQ_TYPE_LEVEL_HIGH>,
  1006					     <AIC_IRQ 271 IRQ_TYPE_LEVEL_HIGH>,
  1007					     <AIC_IRQ 272 IRQ_TYPE_LEVEL_HIGH>,
  1008					     <AIC_IRQ 273 IRQ_TYPE_LEVEL_HIGH>,
  1009					     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
  1010			};
  1011	
  1012			ans_mbox: mbox@277408000 {
  1013				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
  1014				reg = <0x2 0x77408000 0x0 0x4000>;
  1015				interrupt-parent = <&aic>;
  1016				interrupts = <AIC_IRQ 583 IRQ_TYPE_LEVEL_HIGH>,
  1017					<AIC_IRQ 584 IRQ_TYPE_LEVEL_HIGH>,
  1018					<AIC_IRQ 585 IRQ_TYPE_LEVEL_HIGH>,
  1019					<AIC_IRQ 586 IRQ_TYPE_LEVEL_HIGH>;
  1020				interrupt-names = "send-empty", "send-not-empty",
  1021					"recv-empty", "recv-not-empty";
  1022				#mbox-cells = <0>;
  1023				power-domains = <&ps_ans2>;
  1024			};
  1025	
  1026			sart: iommu@27bc50000 {
  1027				compatible = "apple,t8103-sart";
  1028				reg = <0x2 0x7bc50000 0x0 0x10000>;
  1029				power-domains = <&ps_ans2>;
  1030			};
  1031	
  1032			nvme@27bcc0000 {
  1033				compatible = "apple,t8103-nvme-ans2", "apple,nvme-ans2";
  1034				reg = <0x2 0x7bcc0000 0x0 0x40000>,
  1035					<0x2 0x77400000 0x0 0x4000>;
  1036				reg-names = "nvme", "ans";
  1037				interrupt-parent = <&aic>;
  1038				interrupts = <AIC_IRQ 590 IRQ_TYPE_LEVEL_HIGH>;
  1039				mboxes = <&ans_mbox>;
  1040				apple,sart = <&sart>;
  1041				power-domains = <&ps_ans2>, <&ps_apcie_st>;
  1042				power-domain-names = "ans", "apcie0";
  1043				resets = <&ps_ans2>;
  1044			};
  1045	
  1046			efuse@23d2bc000 {
  1047				compatible = "apple,t8103-efuses", "apple,efuses";
  1048				reg = <0x2 0x3d2bc000 0x0 0x1000>;
  1049				#address-cells = <1>;
  1050				#size-cells = <1>;
  1051				atcphy0_auspll_rodco_bias_adjust: efuse@430,26 {
  1052					reg = <0x430 4>;
  1053					bits = <26 3>;
  1054				};
  1055	
  1056				atcphy0_auspll_rodco_encap: efuse@430,29 {
  1057					reg = <0x430 4>;
  1058					bits = <29 2>;
  1059				};
  1060	
  1061				atcphy0_auspll_dtc_vreg_adjust: efuse@430,31 {
  1062					reg = <0x430 8>;
  1063					bits = <31 3>;
  1064				};
  1065	
  1066				atcphy0_auspll_fracn_dll_start_capcode: efuse@434,2 {
  1067					reg = <0x434 4>;
  1068					bits = <2 2>;
  1069				};
  1070	
  1071				atcphy0_aus_cmn_shm_vreg_trim: efuse@434,4 {
  1072					reg = <0x434 4>;
  1073					bits = <4 5>;
  1074				};
  1075	
  1076				atcphy0_cio3pll_dco_coarsebin0: efuse@434,9 {
  1077					reg = <0x434 4>;
  1078					bits = <9 6>;
  1079				};
  1080	
  1081				atcphy0_cio3pll_dco_coarsebin1: efuse@434,15 {
  1082					reg = <0x434 4>;
  1083					bits = <15 6>;
  1084				};
  1085	
  1086				atcphy0_cio3pll_dll_start_capcode: efuse@434,21 {
  1087					reg = <0x434 4>;
  1088					bits = <21 2>;
  1089				};
  1090	
  1091				atcphy0_cio3pll_dtc_vreg_adjust: efuse@434,23 {
  1092					reg = <0x434 0x4>;
  1093					bits = <23 3>;
  1094				};
  1095	
  1096				atcphy1_auspll_rodco_bias_adjust: efuse@438,4 {
  1097					reg = <0x438 4>;
  1098					bits = <4 3>;
  1099				};
  1100	
  1101				atcphy1_auspll_rodco_encap: efuse@438,7 {
  1102					reg = <0x438 4>;
  1103					bits = <7 2>;
  1104				};
  1105	
  1106				atcphy1_auspll_dtc_vreg_adjust: efuse@438,9 {
  1107					reg = <0x438 4>;
  1108					bits = <9 3>;
  1109				};
  1110	
  1111				atcphy1_auspll_fracn_dll_start_capcode: efuse@438,12 {
  1112					reg = <0x438 4>;
  1113					bits = <12 2>;
  1114				};
  1115	
  1116				atcphy1_aus_cmn_shm_vreg_trim: efuse@438,14 {
  1117					reg = <0x438 4>;
  1118					bits = <14 5>;
  1119				};
  1120	
  1121				atcphy1_cio3pll_dco_coarsebin0: efuse@438,19 {
  1122					reg = <0x438 4>;
  1123					bits = <19 6>;
  1124				};
  1125	
  1126				atcphy1_cio3pll_dco_coarsebin1: efuse@438,25 {
  1127					reg = <0x438 4>;
  1128					bits = <25 6>;
  1129				};
  1130	
  1131				atcphy1_cio3pll_dll_start_capcode: efuse@438,31 {
  1132					reg = <0x438 4>;
  1133					bits = <31 1>;
  1134				};
  1135	
  1136				atcphy1_cio3pll_dll_start_capcode_workaround: efuse@43c,0 {
  1137					reg = <0x43c 0x4>;
  1138					bits = <0 1>;
  1139				};
  1140	
  1141				atcphy1_cio3pll_dtc_vreg_adjust: efuse@43c,1 {
  1142					reg = <0x43c 0x4>;
  1143					bits = <1 3>;
  1144				};
  1145			};
  1146	
  1147			dwc3_0: usb@382280000 {
  1148				compatible = "apple,t8103-dwc3", "apple,dwc3", "snps,dwc3";
  1149				reg = <0x3 0x82280000 0x0 0x100000>;
  1150				interrupt-parent = <&aic>;
  1151				interrupts = <AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
  1152				dr_mode = "otg";
  1153				usb-role-switch;
  1154				role-switch-default-mode = "host";
  1155				iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
  1156				power-domains = <&ps_atc0_usb>;
  1157				resets = <&atcphy0>;
  1158				phys = <&atcphy0 PHY_TYPE_USB2>, <&atcphy0 PHY_TYPE_USB3>;
  1159				phy-names = "usb2-phy", "usb3-phy";
  1160			};
  1161	
  1162			dwc3_0_dart_0: iommu@382f00000 {
  1163				compatible = "apple,t8103-dart";
  1164				reg = <0x3 0x82f00000 0x0 0x4000>;
  1165				interrupt-parent = <&aic>;
  1166				interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
  1167				#iommu-cells = <1>;
  1168				power-domains = <&ps_atc0_usb>;
  1169			};
  1170	
  1171			dwc3_0_dart_1: iommu@382f80000 {
  1172				compatible = "apple,t8103-dart";
  1173				reg = <0x3 0x82f80000 0x0 0x4000>;
  1174				interrupt-parent = <&aic>;
  1175				interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
  1176				#iommu-cells = <1>;
  1177				power-domains = <&ps_atc0_usb>;
  1178			};
  1179	
  1180			atcphy0: phy@383000000 {
  1181				compatible = "apple,t8103-atcphy";
  1182				reg = <0x3 0x83000000 0x0 0x4c000>,
  1183					<0x3 0x83050000 0x0 0x8000>,
  1184					<0x3 0x80000000 0x0 0x4000>,
  1185					<0x3 0x82a90000 0x0 0x4000>,
  1186					<0x3 0x82a84000 0x0 0x4000>;
  1187				reg-names = "core", "lpdptx", "axi2af", "usb2phy",
  1188					"pipehandler";
  1189	
  1190				#phy-cells = <1>;
  1191				#reset-cells = <0>;
  1192	
  1193				nvmem-cells = <&atcphy0_aus_cmn_shm_vreg_trim>,
  1194					<&atcphy0_auspll_rodco_encap>,
  1195					<&atcphy0_auspll_rodco_bias_adjust>,
  1196					<&atcphy0_auspll_fracn_dll_start_capcode>,
  1197					<&atcphy0_auspll_dtc_vreg_adjust>,
  1198					<&atcphy0_cio3pll_dco_coarsebin0>,
  1199					<&atcphy0_cio3pll_dco_coarsebin1>,
  1200					<&atcphy0_cio3pll_dll_start_capcode>,
  1201					<&atcphy0_cio3pll_dtc_vreg_adjust>;
  1202				nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
  1203					"auspll_rodco_encap",
  1204					"auspll_rodco_bias_adjust",
  1205					"auspll_fracn_dll_start_capcode",
  1206					"auspll_dtc_vreg_adjust",
  1207					"cio3pll_dco_coarsebin0",
  1208					"cio3pll_dco_coarsebin1",
  1209					"cio3pll_dll_start_capcode",
  1210					"cio3pll_dtc_vreg_adjust";
  1211	
  1212				orientation-switch;
  1213				mode-switch;
  1214				svid = <0xff01>, <0x8087>;
  1215				power-domains = <&ps_atc0_usb>;
  1216			};
  1217	
  1218			dwc3_1: usb@502280000 {
  1219				compatible = "apple,t8103-dwc3", "apple,dwc3", "snps,dwc3";
  1220				reg = <0x5 0x02280000 0x0 0x100000>;
  1221				interrupt-parent = <&aic>;
  1222				interrupts = <AIC_IRQ 857 IRQ_TYPE_LEVEL_HIGH>;
  1223				dr_mode = "otg";
  1224				usb-role-switch;
  1225				role-switch-default-mode = "host";
  1226				iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
  1227				power-domains = <&ps_atc1_usb>;
  1228				resets = <&atcphy1>;
  1229				phys = <&atcphy1 PHY_TYPE_USB2>, <&atcphy1 PHY_TYPE_USB3>;
  1230				phy-names = "usb2-phy", "usb3-phy";
  1231			};
  1232	
  1233			dwc3_1_dart_0: iommu@502f00000 {
  1234				compatible = "apple,t8103-dart";
  1235				reg = <0x5 0x02f00000 0x0 0x4000>;
  1236				interrupt-parent = <&aic>;
  1237				interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
  1238				#iommu-cells = <1>;
  1239				power-domains = <&ps_atc1_usb>;
  1240			};
  1241	
  1242			dwc3_1_dart_1: iommu@502f80000 {
  1243				compatible = "apple,t8103-dart";
  1244				reg = <0x5 0x02f80000 0x0 0x4000>;
  1245				interrupt-parent = <&aic>;
  1246				interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
  1247				#iommu-cells = <1>;
  1248				power-domains = <&ps_atc1_usb>;
  1249			};
  1250	
  1251			atcphy1: phy@503000000 {
  1252				compatible = "apple,t8103-atcphy";
  1253				reg = <0x5 0x03000000 0x0 0x4c000>,
  1254					<0x5 0x03050000 0x0 0x8000>,
  1255					<0x5 0x0 0x0 0x4000>,
  1256					<0x5 0x02a90000 0x0 0x4000>,
  1257					<0x5 0x02a84000 0x0 0x4000>;
  1258				reg-names = "core", "lpdptx", "axi2af", "usb2phy",
  1259					"pipehandler";
  1260	
  1261				nvmem-cells = <&atcphy1_aus_cmn_shm_vreg_trim>,
  1262					<&atcphy1_auspll_rodco_encap>,
  1263					<&atcphy1_auspll_rodco_bias_adjust>,
  1264					<&atcphy1_auspll_fracn_dll_start_capcode>,
  1265					<&atcphy1_auspll_dtc_vreg_adjust>,
  1266					<&atcphy1_cio3pll_dco_coarsebin0>,
  1267					<&atcphy1_cio3pll_dco_coarsebin1>,
  1268					<&atcphy1_cio3pll_dll_start_capcode>,
  1269					<&atcphy1_cio3pll_dtc_vreg_adjust>,
  1270					<&atcphy1_cio3pll_dll_start_capcode_workaround>;
  1271				nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
  1272					"auspll_rodco_encap",
  1273					"auspll_rodco_bias_adjust",
  1274					"auspll_fracn_dll_start_capcode",
  1275					"auspll_dtc_vreg_adjust",
  1276					"cio3pll_dco_coarsebin0",
  1277					"cio3pll_dco_coarsebin1",
  1278					"cio3pll_dll_start_capcode",
  1279					"cio3pll_dtc_vreg_adjust",
  1280					"cio3pll_dll_start_capcode_workaround";
  1281	
  1282				#phy-cells = <1>;
  1283				#reset-cells = <0>;
  1284	
  1285				orientation-switch;
  1286				mode-switch;
  1287				svid = <0xff01>, <0x8087>;
  1288				power-domains = <&ps_atc1_usb>;
  1289			};
  1290	
  1291			pcie0_dart_0: iommu@681008000 {
  1292				compatible = "apple,t8103-dart";
  1293				reg = <0x6 0x81008000 0x0 0x4000>;
  1294				#iommu-cells = <1>;
  1295				interrupt-parent = <&aic>;
  1296				interrupts = <AIC_IRQ 696 IRQ_TYPE_LEVEL_HIGH>;
  1297				power-domains = <&ps_apcie_gp>;
  1298			};
  1299	
  1300			pcie0_dart_1: iommu@682008000 {
  1301				compatible = "apple,t8103-dart";
  1302				reg = <0x6 0x82008000 0x0 0x4000>;
  1303				#iommu-cells = <1>;
  1304				interrupt-parent = <&aic>;
  1305				interrupts = <AIC_IRQ 699 IRQ_TYPE_LEVEL_HIGH>;
  1306				power-domains = <&ps_apcie_gp>;
  1307				status = "disabled";
  1308			};
  1309	
  1310			pcie0_dart_2: iommu@683008000 {
  1311				compatible = "apple,t8103-dart";
  1312				reg = <0x6 0x83008000 0x0 0x4000>;
  1313				#iommu-cells = <1>;
  1314				interrupt-parent = <&aic>;
  1315				interrupts = <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>;
  1316				power-domains = <&ps_apcie_gp>;
  1317				status = "disabled";
  1318			};
  1319	
  1320			pcie0: pcie@690000000 {
  1321				compatible = "apple,t8103-pcie", "apple,pcie";
  1322				device_type = "pci";
  1323	
  1324				reg = <0x6 0x90000000 0x0 0x1000000>,
  1325				      <0x6 0x80000000 0x0 0x100000>,
  1326				      <0x6 0x81000000 0x0 0x4000>,
  1327				      <0x6 0x82000000 0x0 0x4000>,
  1328				      <0x6 0x83000000 0x0 0x4000>;
  1329				reg-names = "config", "rc", "port0", "port1", "port2";
  1330	
  1331				interrupt-parent = <&aic>;
  1332				interrupts = <AIC_IRQ 695 IRQ_TYPE_LEVEL_HIGH>,
  1333					     <AIC_IRQ 698 IRQ_TYPE_LEVEL_HIGH>,
  1334					     <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>;
  1335	
  1336				msi-controller;
  1337				msi-parent = <&pcie0>;
  1338				msi-ranges = <&aic AIC_IRQ 704 IRQ_TYPE_EDGE_RISING 32>;
  1339	
  1340	
  1341				iommu-map = <0x100 &pcie0_dart_0 1 1>,
  1342					    <0x200 &pcie0_dart_1 1 1>,
  1343					    <0x300 &pcie0_dart_2 1 1>;
  1344				iommu-map-mask = <0xff00>;
  1345	
  1346				bus-range = <0 3>;
  1347				#address-cells = <3>;
  1348				#size-cells = <2>;
  1349				ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
  1350					 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
  1351	
  1352				power-domains = <&ps_apcie_gp>;
  1353				pinctrl-0 = <&pcie_pins>;
  1354				pinctrl-names = "default";
  1355	
  1356				port00: pci@0,0 {
  1357					device_type = "pci";
  1358					reg = <0x0 0x0 0x0 0x0 0x0>;
  1359					reset-gpios = <&pinctrl_ap 152 GPIO_ACTIVE_LOW>;
  1360	
  1361					#address-cells = <3>;
  1362					#size-cells = <2>;
  1363					ranges;
  1364	
  1365					interrupt-controller;
  1366					#interrupt-cells = <1>;
  1367	
  1368					interrupt-map-mask = <0 0 0 7>;
  1369					interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
  1370							<0 0 0 2 &port00 0 0 0 1>,
  1371							<0 0 0 3 &port00 0 0 0 2>,
  1372							<0 0 0 4 &port00 0 0 0 3>;
  1373				};
  1374	
  1375				port01: pci@1,0 {
  1376					device_type = "pci";
  1377					reg = <0x800 0x0 0x0 0x0 0x0>;
  1378					reset-gpios = <&pinctrl_ap 153 GPIO_ACTIVE_LOW>;
  1379	
  1380					#address-cells = <3>;
  1381					#size-cells = <2>;
  1382					ranges;
  1383	
  1384					interrupt-controller;
  1385					#interrupt-cells = <1>;
  1386	
  1387					interrupt-map-mask = <0 0 0 7>;
  1388					interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
  1389							<0 0 0 2 &port01 0 0 0 1>,
  1390							<0 0 0 3 &port01 0 0 0 2>,
  1391							<0 0 0 4 &port01 0 0 0 3>;
  1392					status = "disabled";
  1393				};
  1394	
  1395				port02: pci@2,0 {
  1396					device_type = "pci";
  1397					reg = <0x1000 0x0 0x0 0x0 0x0>;
  1398					reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
  1399	
  1400					#address-cells = <3>;
  1401					#size-cells = <2>;
  1402					ranges;
  1403	
  1404					interrupt-controller;
  1405					#interrupt-cells = <1>;
  1406	
  1407					interrupt-map-mask = <0 0 0 7>;
  1408					interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
  1409							<0 0 0 2 &port02 0 0 0 1>,
  1410							<0 0 0 3 &port02 0 0 0 2>,
  1411							<0 0 0 4 &port02 0 0 0 3>;
  1412					status = "disabled";
  1413				};
  1414			};
  1415		};
  1416	};
  1417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
