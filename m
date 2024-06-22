Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E97B137E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 02:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719023856; cv=none; b=NP/2LlXvC7/yOwGOMHJ67PhORqPvOhUXFmTS1FUd5YbExDpDyx3NirMXx1h9XRV0t4UrchxerbMbmt0cpSlrEcn8SFWbSPgDAL+GDkHeYwXA8OZ5chuD+4iUhIHnfiMIdmQlxU3C19duDo+lV/cOCKBvZ/mxPEUOL1Vf8UlzyYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719023856; c=relaxed/simple;
	bh=VSWkwKEZv78aDiJxgM/9Y0OMVEisHSQV5y11Xs+tlfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nfh8BxhlKLhFR6ignkPrj5QB431heJQjPnHPX2NPDFjuQzpWAIUD82k98LCraje+FD0KXQRBZyrQTja42F7ukXtNlOxol2LpUzf2PCgJpHp8H/GbjOZubo8Qrvi1yQcFPOt0K5w/Es3Rp4vzd7vzYUmFXg1LyOZnOSwst68u78o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HK8Ib5H6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HK8Ib5H6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719023852; x=1750559852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VSWkwKEZv78aDiJxgM/9Y0OMVEisHSQV5y11Xs+tlfg=;
  b=HK8Ib5H63IAXAorLplZ+Kt78PIhYg819tCs/Nr+bmpzwjNsJAu9OoEZA
   YzWsVuY+/bcuPokNAWfp6/pRrw5tTeG+9fLhkpv4manWTbNcai4uWCe3B
   IqQsQ/z/fF/92KMIzXnj5Lwe2NK/O9sXTW8tZmgdovKRe/++jGi1bVmSJ
   FV8kSDKj7RNFVwsqmAI1P5u1WrrcV5T7BALVRvjQ3rL8nhBUqvc83CoG1
   5hin6Xc/0x9tHLSjupzbdJ+4gYwmkJnvn4Kbuyg8J2RU48/u3QAX3+jqR
   qAjgPaHAW6WjkeYXO+nPMq5ClTvBpF2ibFzwHc+M/CyojbQxRhHabUdrE
   g==;
X-CSE-ConnectionGUID: 6vWxKRYESnOEfezi7lnwxw==
X-CSE-MsgGUID: TXyQFTwGRZKVTxOf/TptZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="33616907"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="33616907"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 19:37:31 -0700
X-CSE-ConnectionGUID: zPcKi65JScG9IoHwEM3KNg==
X-CSE-MsgGUID: hAvkLmHSRUKIsjudFJZAkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="42736563"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jun 2024 19:37:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKqd6-0009Ew-00;
	Sat, 22 Jun 2024 02:37:28 +0000
Date: Sat, 22 Jun 2024 10:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 176/184]
 arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning
 (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child
 node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202406221007.e4TxzkUS-lkp@intel.com>
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
commit: 3f90de4d0dff0f40f181d9e1200e9747b919e984 [176/184] arm64: apple: t8112: Add SIO, DPA nodes; hook up to DCP
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240622/202406221007.e4TxzkUS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221007.e4TxzkUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221007.e4TxzkUS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dts:185.14-195.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j413.dts:197.14-206.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:718.30-724.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:1108.28-1184.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112.dtsi:919.10-928.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:940.10-949.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112.dtsi:1540.10-1549.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8112-j415.dts:203.14-217.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j415.dts:219.14-228.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:718.30-724.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:1108.28-1184.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112.dtsi:919.10-928.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:940.10-949.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112.dtsi:1540.10-1549.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8112-j493.dts:189.14-199.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j493.dts:201.14-210.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:718.30-724.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:1108.28-1184.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112.dtsi:919.10-928.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:940.10-949.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112.dtsi:1540.10-1549.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8112-j473.dts:163.14-172.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j473.dts:174.14-183.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:718.30-724.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:1108.28-1184.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1148.43-1151.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8112.dtsi:706.10-715.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112.dtsi:919.10-928.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:940.10-949.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112.dtsi:1540.10-1549.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +706 arch/arm64/boot/dts/apple/t8112.dtsi

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
   198				opp-microwatt = <26000>;
   199			};
   200			opp02 {
   201				opp-hz = /bits/ 64 <912000000>;
   202				opp-level = <2>;
   203				clock-latency-ns = <20000>;
   204				opp-microwatt = <56000>;
   205			};
   206			opp03 {
   207				opp-hz = /bits/ 64 <1284000000>;
   208				opp-level = <3>;
   209				clock-latency-ns = <22000>;
   210				opp-microwatt = <88000>;
   211			};
   212			opp04 {
   213				opp-hz = /bits/ 64 <1752000000>;
   214				opp-level = <4>;
   215				clock-latency-ns = <30000>;
   216				opp-microwatt = <155000>;
   217			};
   218			opp05 {
   219				opp-hz = /bits/ 64 <2004000000>;
   220				opp-level = <5>;
   221				clock-latency-ns = <35000>;
   222				opp-microwatt = <231000>;
   223			};
   224			opp06 {
   225				opp-hz = /bits/ 64 <2256000000>;
   226				opp-level = <6>;
   227				clock-latency-ns = <39000>;
   228				opp-microwatt = <254000>;
   229			};
   230			opp07 {
   231				opp-hz = /bits/ 64 <2424000000>;
   232				opp-level = <7>;
   233				clock-latency-ns = <53000>;
   234				opp-microwatt = <351000>;
   235			};
   236		};
   237	
   238		pcluster_opp: opp-table-1 {
   239			compatible = "operating-points-v2";
   240			opp-shared;
   241	
   242			opp01 {
   243				opp-hz = /bits/ 64 <660000000>;
   244				opp-level = <1>;
   245				clock-latency-ns = <9000>;
   246				opp-microwatt = <133000>;
   247			};
   248			opp02 {
   249				opp-hz = /bits/ 64 <924000000>;
   250				opp-level = <2>;
   251				clock-latency-ns = <19000>;
   252				opp-microwatt = <212000>;
   253			};
   254			opp03 {
   255				opp-hz = /bits/ 64 <1188000000>;
   256				opp-level = <3>;
   257				clock-latency-ns = <22000>;
   258				opp-microwatt = <261000>;
   259			};
   260			opp04 {
   261				opp-hz = /bits/ 64 <1452000000>;
   262				opp-level = <4>;
   263				clock-latency-ns = <24000>;
   264				opp-microwatt = <345000>;
   265			};
   266			opp05 {
   267				opp-hz = /bits/ 64 <1704000000>;
   268				opp-level = <5>;
   269				clock-latency-ns = <26000>;
   270				opp-microwatt = <441000>;
   271			};
   272			opp06 {
   273				opp-hz = /bits/ 64 <1968000000>;
   274				opp-level = <6>;
   275				clock-latency-ns = <28000>;
   276				opp-microwatt = <619000>;
   277			};
   278			opp07 {
   279				opp-hz = /bits/ 64 <2208000000>;
   280				opp-level = <7>;
   281				clock-latency-ns = <30000>;
   282				opp-microwatt = <740000>;
   283			};
   284			opp08 {
   285				opp-hz = /bits/ 64 <2400000000>;
   286				opp-level = <8>;
   287				clock-latency-ns = <33000>;
   288				opp-microwatt = <855000>;
   289			};
   290			opp09 {
   291				opp-hz = /bits/ 64 <2568000000>;
   292				opp-level = <9>;
   293				clock-latency-ns = <34000>;
   294				opp-microwatt = <1006000>;
   295			};
   296			opp10 {
   297				opp-hz = /bits/ 64 <2724000000>;
   298				opp-level = <10>;
   299				clock-latency-ns = <36000>;
   300				opp-microwatt = <1217000>;
   301			};
   302			opp11 {
   303				opp-hz = /bits/ 64 <2868000000>;
   304				opp-level = <11>;
   305				clock-latency-ns = <41000>;
   306				opp-microwatt = <1534000>;
   307			};
   308			opp12 {
   309				opp-hz = /bits/ 64 <2988000000>;
   310				opp-level = <12>;
   311				clock-latency-ns = <42000>;
   312				opp-microwatt = <1714000>;
   313			};
   314			opp13 {
   315				opp-hz = /bits/ 64 <3096000000>;
   316				opp-level = <13>;
   317				clock-latency-ns = <44000>;
   318				opp-microwatt = <1877000>;
   319			};
   320			opp14 {
   321				opp-hz = /bits/ 64 <3204000000>;
   322				opp-level = <14>;
   323				clock-latency-ns = <46000>;
   324				opp-microwatt = <2159000>;
   325			};
   326			opp15 {
   327				opp-hz = /bits/ 64 <3324000000>;
   328				opp-level = <15>;
   329				clock-latency-ns = <62000>;
   330				opp-microwatt = <2393000>;
   331				turbo-mode;
   332			};
   333			opp16 {
   334				opp-hz = /bits/ 64 <3408000000>;
   335				opp-level = <16>;
   336				clock-latency-ns = <62000>;
   337				opp-microwatt = <2497000>;
   338				turbo-mode;
   339			};
   340			opp17 {
   341				opp-hz = /bits/ 64 <3504000000>;
   342				opp-level = <17>;
   343				clock-latency-ns = <62000>;
   344				opp-microwatt = <2648000>;
   345				turbo-mode;
   346			};
   347		};
   348	
   349		gpu_opp: opp-table-gpu {
   350			compatible = "operating-points-v2";
   351	
   352			/*
   353			 * NOTE: The voltage and power values are device-specific and
   354			 * must be filled in by the bootloader.
   355			 */
   356			opp00 {
   357				opp-hz = /bits/ 64 <0>;
   358				opp-microvolt = <400000>;
   359				opp-microwatt = <0>;
   360			};
   361			opp01 {
   362				opp-hz = /bits/ 64 <444000000>;
   363				opp-microvolt = <603000>;
   364				opp-microwatt = <4295000>;
   365			};
   366			opp02 {
   367				opp-hz = /bits/ 64 <612000000>;
   368				opp-microvolt = <675000>;
   369				opp-microwatt = <6251000>;
   370			};
   371			opp03 {
   372				opp-hz = /bits/ 64 <808000000>;
   373				opp-microvolt = <710000>;
   374				opp-microwatt = <8625000>;
   375			};
   376			opp04 {
   377				opp-hz = /bits/ 64 <968000000>;
   378				opp-microvolt = <775000>;
   379				opp-microwatt = <11948000>;
   380			};
   381			opp05 {
   382				opp-hz = /bits/ 64 <1110000000>;
   383				opp-microvolt = <820000>;
   384				opp-microwatt = <15071000>;
   385			};
   386			opp06 {
   387				opp-hz = /bits/ 64 <1236000000>;
   388				opp-microvolt = <875000>;
   389				opp-microwatt = <18891000>;
   390			};
   391			opp07 {
   392				opp-hz = /bits/ 64 <1338000000>;
   393				opp-microvolt = <915000>;
   394				opp-microwatt = <21960000>;
   395			};
   396			opp08 {
   397				opp-hz = /bits/ 64 <1398000000>;
   398				opp-microvolt = <950000>;
   399				opp-microwatt = <22800000>;
   400			};
   401		};
   402	
   403		timer {
   404			compatible = "arm,armv8-timer";
   405			interrupt-parent = <&aic>;
   406			interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
   407			interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
   408				     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
   409				     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
   410				     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
   411		};
   412	
   413		pmu-e {
   414			compatible = "apple,blizzard-pmu";
   415			interrupt-parent = <&aic>;
   416			interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
   417		};
   418	
   419		pmu-p {
   420			compatible = "apple,avalanche-pmu";
   421			interrupt-parent = <&aic>;
   422			interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
   423		};
   424	
   425		clkref: clock-ref {
   426			compatible = "fixed-clock";
   427			#clock-cells = <0>;
   428			clock-frequency = <24000000>;
   429			clock-output-names = "clkref";
   430		};
   431	
   432		/*
   433		 * This is a fabulated representation of the input clock
   434		 * to NCO since we don't know the true clock tree.
   435		 */
   436		nco_clkref: clock-ref-nco {
   437			compatible = "fixed-clock";
   438			#clock-cells = <0>;
   439			clock-output-names = "nco_ref";
   440		};
   441	
   442		/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
   443		clk_disp0: clock-disp0 {
   444			compatible = "fixed-clock";
   445			#clock-cells = <0>;
   446			clock-frequency = <533333328>;
   447			clock-output-names = "clk_disp0";
   448		};
   449	
   450		/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
   451		clk_dispext0: clock-dispext0 {
   452			compatible = "fixed-clock";
   453			#clock-cells = <0>;
   454			clock-frequency = <0>;
   455			clock-output-names = "clk_dispext0";
   456		};
   457	
   458		reserved-memory {
   459			#address-cells = <2>;
   460			#size-cells = <2>;
   461			ranges;
   462	
   463			uat_handoff: uat-handoff {
   464				reg = <0x0 0 0 0>;
   465				no-map;
   466			};
   467	
   468			uat_pagetables: uat-pagetables {
   469				reg = <0x0 0 0 0>;
   470				no-map;
   471			};
   472	
   473			uat_ttbs: uat-ttbs {
   474				reg = <0x0 0 0 0>;
   475				no-map;
   476			};
   477		};
   478	
   479		clk_200m: clock-200m {
   480			compatible = "fixed-clock";
   481			#clock-cells = <0>;
   482			clock-frequency = <200000000>;
   483			clock-output-names = "clk_200m";
   484		};
   485	
   486		soc {
   487			compatible = "simple-bus";
   488			#address-cells = <2>;
   489			#size-cells = <2>;
   490	
   491			ranges;
   492			nonposted-mmio;
   493			/* Required to get >32-bit DMA via DARTs */
   494			dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
   495	
   496			gpu: gpu@206400000 {
   497				compatible = "apple,agx-t8112", "apple,agx-g14g";
   498				reg = <0x2 0x6400000 0 0x40000>,
   499					<0x2 0x4000000 0 0x1000000>;
   500				reg-names = "asc", "sgx";
   501				interrupt-parent = <&aic>;
   502				interrupts = <AIC_IRQ 697 IRQ_TYPE_LEVEL_HIGH>,
   503					<AIC_IRQ 698 IRQ_TYPE_LEVEL_HIGH>,
   504					<AIC_IRQ 699 IRQ_TYPE_LEVEL_HIGH>,
   505					<AIC_IRQ 700 IRQ_TYPE_LEVEL_HIGH>,
   506					<AIC_IRQ 713 IRQ_TYPE_LEVEL_HIGH>;
   507				mboxes = <&agx_mbox>;
   508				power-domains = <&ps_gfx>;
   509				memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>;
   510				memory-region-names = "ttbs", "pagetables", "handoff";
   511	
   512				apple,firmware-version = <12 4 0>;
   513				apple,firmware-compat = <12 4 0>;
   514	
   515				operating-points-v2 = <&gpu_opp>;
   516				apple,perf-base-pstate = <1>;
   517				apple,min-sram-microvolt = <780000>;
   518				apple,avg-power-filter-tc-ms = <300>;
   519				apple,avg-power-ki-only = <9.375>;
   520				apple,avg-power-kp = <3.22>;
   521				apple,avg-power-min-duty-cycle = <40>;
   522				apple,avg-power-target-filter-tc = <1>;
   523				apple,fast-die0-integral-gain = <200.0>;
   524				apple,fast-die0-proportional-gain = <5.0>;
   525				apple,perf-boost-ce-step = <50>;
   526				apple,perf-boost-min-util = <90>;
   527				apple,perf-filter-drop-threshold = <0>;
   528				apple,perf-filter-time-constant = <5>;
   529				apple,perf-filter-time-constant2 = <200>;
   530				apple,perf-integral-gain = <5.94>;
   531				apple,perf-integral-gain2 = <5.94>;
   532				apple,perf-integral-min-clamp = <0>;
   533				apple,perf-proportional-gain = <14.85>;
   534				apple,perf-proportional-gain2 = <14.85>;
   535				apple,perf-tgt-utilization = <85>;
   536				apple,power-sample-period = <8>;
   537				apple,ppm-filter-time-constant-ms = <34>;
   538				apple,ppm-ki = <205.0>;
   539				apple,ppm-kp = <0.75>;
   540				apple,pwr-min-duty-cycle = <40>;
   541				apple,core-leak-coef = <1920.0>;
   542				apple,sram-leak-coef = <74.0>;
   543			};
   544	
   545			agx_mbox: mbox@206408000 {
   546				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
   547				reg = <0x2 0x6408000 0x0 0x4000>;
   548				interrupt-parent = <&aic>;
   549				interrupts = <AIC_IRQ 709 IRQ_TYPE_LEVEL_HIGH>,
   550					<AIC_IRQ 710 IRQ_TYPE_LEVEL_HIGH>,
   551					<AIC_IRQ 711 IRQ_TYPE_LEVEL_HIGH>,
   552					<AIC_IRQ 712 IRQ_TYPE_LEVEL_HIGH>;
   553				interrupt-names = "send-empty", "send-not-empty",
   554					"recv-empty", "recv-not-empty";
   555				#mbox-cells = <0>;
   556			};
   557	
   558			cpufreq_e: cpufreq@210e20000 {
   559				compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
   560				reg = <0x2 0x10e20000 0 0x1000>;
   561				#performance-domain-cells = <0>;
   562			};
   563	
   564			cpufreq_p: cpufreq@211e20000 {
   565				compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
   566				reg = <0x2 0x11e20000 0 0x1000>;
   567				#performance-domain-cells = <0>;
   568			};
   569	
   570			display_dfr: display-pipe@228200000 {
   571				compatible = "apple,t8112-display-pipe", "apple,h7-display-pipe";
   572				reg-names = "be", "fe", "mipi";
   573				reg = <0x2 0x28200000 0x0 0xc000>,
   574					<0x2 0x28400000 0x0 0x4000>,
   575					<0x2 0x28600000 0x0 0x100000>;
   576				power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>, <&ps_mipi_dsi>;
   577				interrupt-parent = <&aic>;
   578				interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>,
   579					<AIC_IRQ 618 IRQ_TYPE_LEVEL_HIGH>;
   580				interrupt-names = "be", "fe";
   581				status = "disabled";
   582				iommus = <&displaydfr_dart 0>;
   583			};
   584	
   585			displaydfr_dart: iommu@228304000 {
   586				compatible = "apple,t8110-dart";
   587				reg = <0x2 0x28304000 0x0 0x4000>;
   588				interrupt-parent = <&aic>;
   589				interrupts = <AIC_IRQ 616 IRQ_TYPE_LEVEL_HIGH>;
   590				#iommu-cells = <1>;
   591				power-domains = <&ps_dispdfr_fe>;
   592				status = "disabled";
   593			};
   594	
   595			isp_dart0: iommu@22c4a8000 {
   596				compatible = "apple,t8110-dart";
   597				reg = <0x2 0x2c4a8000 0x0 0x4000>;
   598				#iommu-cells = <1>;
   599				interrupt-parent = <&aic>;
   600				interrupts = <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
   601				power-domains = <&ps_isp_sys>;
   602				status = "disabled";
   603			};
   604	
   605			isp_dart1: iommu@22c4b4000 {
   606				compatible = "apple,t8110-dart";
   607				reg = <0x2 0x2c4b4000 0x0 0x4000>;
   608				#iommu-cells = <1>;
   609				interrupt-parent = <&aic>;
   610				interrupts = <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
   611				power-domains = <&ps_isp_sys>;
   612				status = "disabled";
   613			};
   614	
   615			isp_dart2: iommu@22c4bc000 {
   616				compatible = "apple,t8110-dart";
   617				reg = <0x2 0x2c4bc000 0x0 0x4000>;
   618				#iommu-cells = <1>;
   619				interrupt-parent = <&aic>;
   620				interrupts = <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
   621				power-domains = <&ps_isp_sys>;
   622				status = "disabled";
   623			};
   624	
   625			isp: isp@22a000000 {
   626				compatible = "apple,t8112-isp", "apple,isp";
   627				iommus = <&isp_dart0 0>, <&isp_dart1 0>, <&isp_dart2 0>;
   628				reg-names = "coproc", "mbox", "gpio", "mbox2";
   629				reg = <0x2 0x2a000000 0x0 0x2000000>,
   630					<0x2 0x2c4c4000 0x0 0x100>,
   631					<0x2 0x2c4c41b0 0x0 0x100>,
   632					<0x2 0x2c4c4430 0x0 0x100>;
   633				interrupt-parent = <&aic>;
   634				interrupts = <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>;
   635				power-domains = <&ps_isp_sys>, <&ps_isp_set0>,
   636					<&ps_isp_set1>, <&ps_isp_set2>, <&ps_isp_fe>,
   637					<&ps_isp_set4>, <&ps_isp_set5>, <&ps_isp_set6>,
   638					<&ps_isp_set7>, <&ps_isp_set8>, <&ps_isp_set9>,
   639					<&ps_isp_set10>, <&ps_isp_set11>,
   640					<&ps_isp_set12>;
   641	
   642				apple,dart-vm-size = <0x0 0xa0000000>;
   643				status = "disabled";
   644			};
   645	
   646			disp0_dart: iommu@231304000 {
   647				compatible = "apple,t8112-dart", "apple,t8110-dart";
   648				reg = <0x2 0x31304000 0x0 0x4000>;
   649				#iommu-cells = <1>;
   650				interrupt-parent = <&aic>;
   651				interrupts = <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>;
   652				power-domains = <&ps_disp0_cpu0>;
   653				apple,dma-range = <0x0 0x0 0xf 0xffff0000>;
   654				status = "disabled";
   655			};
   656	
   657			dcp_dart: iommu@23130c000 {
   658				compatible = "apple,t8112-dart", "apple,t8110-dart";
   659				reg = <0x2 0x3130c000 0x0 0x4000>;
   660				#iommu-cells = <1>;
   661				interrupt-parent = <&aic>;
   662				interrupts = <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>;
   663				power-domains = <&ps_disp0_cpu0>;
   664				apple,dma-range = <0x8 0x00000000 0x7 0xffff0000>;
   665			};
   666	
   667			dcp_mbox: mbox@231c08000 {
   668				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
   669				reg = <0x2 0x31c08000 0x0 0x4000>;
   670				interrupt-parent = <&aic>;
   671				interrupts = <AIC_IRQ 535 IRQ_TYPE_LEVEL_HIGH>,
   672					<AIC_IRQ 536 IRQ_TYPE_LEVEL_HIGH>,
   673					<AIC_IRQ 537 IRQ_TYPE_LEVEL_HIGH>,
   674					<AIC_IRQ 538 IRQ_TYPE_LEVEL_HIGH>;
   675				interrupt-names = "send-empty", "send-not-empty",
   676					"recv-empty", "recv-not-empty";
   677				#mbox-cells = <0>;
   678				power-domains = <&ps_disp0_cpu0>;
   679				resets = <&ps_disp0_cpu0>;
   680			};
   681	
   682			dcp: dcp@231c00000 {
   683				compatible = "apple,t8112-dcp", "apple,dcp";
   684				mboxes = <&dcp_mbox>;
   685				mbox-names = "mbox";
   686				iommus = <&dcp_dart 5>;
   687	
   688				/* the ADT has 2 additional regs which seems to be unused */
   689				reg-names = "coproc", "disp-0", "disp-1", "disp-2", "disp-3";
   690				reg = <0x2 0x31c00000 0x0 0x4000>,
   691					<0x2 0x30000000 0x0 0x61c000>,
   692					<0x2 0x31320000 0x0 0x4000>,
   693					<0x2 0x31344000 0x0 0x4000>,
   694					<0x2 0x31800000 0x0 0x800000>;
   695				apple,bw-scratch = <&pmgr_dcp 0 4 0x5d8>;
   696				power-domains = <&ps_disp0_cpu0>;
   697				resets = <&ps_disp0_cpu0>;
   698				clocks = <&clk_disp0>;
   699				phandle = <&dcp>;
   700	
   701				disp0_piodma: piodma {
   702					iommus = <&disp0_dart 4>;
   703					phandle = <&disp0_piodma>;
   704				};
   705	
 > 706				ports {
   707					#address-cells = <1>;
   708					#size-cells = <0>;
   709					port@0 {
   710						reg = <0>;
   711						dcp_audio: endpoint {
   712							remote-endpoint = <&dpaudio0_dcp>;
   713						};
   714					};
   715				};
   716			};
   717	
 > 718			display: display-subsystem {
   719				compatible = "apple,display-subsystem";
   720				/* disp_dart0 must be 1st since it is locked */
   721				iommus = <&disp0_dart 0>;
   722				/* generate phandle explicitly for use in loader */
   723				phandle = <&display>;
   724			};
   725	
   726			sio_dart: iommu@235004000 {
   727				compatible = "apple,t8110-dart";
   728				reg = <0x2 0x35004000 0x0 0x4000>;
   729				interrupt-parent = <&aic>;
   730				interrupts = <AIC_IRQ 769 IRQ_TYPE_LEVEL_HIGH>;
   731				#iommu-cells = <1>;
   732				power-domains = <&ps_sio_cpu>;
   733			};
   734	
   735			i2c0: i2c@235010000 {
   736				compatible = "apple,t8112-i2c", "apple,i2c";
   737				reg = <0x2 0x35010000 0x0 0x4000>;
   738				clocks = <&clkref>;
   739				interrupt-parent = <&aic>;
   740				interrupts = <AIC_IRQ 761 IRQ_TYPE_LEVEL_HIGH>;
   741				pinctrl-0 = <&i2c0_pins>;
   742				pinctrl-names = "default";
   743				#address-cells = <0x1>;
   744				#size-cells = <0x0>;
   745				power-domains = <&ps_i2c0>;
   746				status = "disabled";
   747			};
   748	
   749			i2c1: i2c@235014000 {
   750				compatible = "apple,t8112-i2c", "apple,i2c";
   751				reg = <0x2 0x35014000 0x0 0x4000>;
   752				clocks = <&clkref>;
   753				interrupt-parent = <&aic>;
   754				interrupts = <AIC_IRQ 762 IRQ_TYPE_LEVEL_HIGH>;
   755				pinctrl-0 = <&i2c1_pins>;
   756				pinctrl-names = "default";
   757				#address-cells = <0x1>;
   758				#size-cells = <0x0>;
   759				power-domains = <&ps_i2c1>;
   760				status = "disabled";
   761			};
   762	
   763			i2c2: i2c@235018000 {
   764				compatible = "apple,t8112-i2c", "apple,i2c";
   765				reg = <0x2 0x35018000 0x0 0x4000>;
   766				clocks = <&clkref>;
   767				interrupt-parent = <&aic>;
   768				interrupts = <AIC_IRQ 763 IRQ_TYPE_LEVEL_HIGH>;
   769				pinctrl-0 = <&i2c2_pins>;
   770				pinctrl-names = "default";
   771				#address-cells = <0x1>;
   772				#size-cells = <0x0>;
   773				power-domains = <&ps_i2c2>;
   774				status = "disabled";
   775			};
   776	
   777			i2c3: i2c@23501c000 {
   778				compatible = "apple,t8112-i2c", "apple,i2c";
   779				reg = <0x2 0x3501c000 0x0 0x4000>;
   780				clocks = <&clkref>;
   781				interrupt-parent = <&aic>;
   782				interrupts = <AIC_IRQ 764 IRQ_TYPE_LEVEL_HIGH>;
   783				pinctrl-0 = <&i2c3_pins>;
   784				pinctrl-names = "default";
   785				#address-cells = <0x1>;
   786				#size-cells = <0x0>;
   787				power-domains = <&ps_i2c3>;
   788				status = "disabled";
   789			};
   790	
   791			i2c4: i2c@235020000 {
   792				compatible = "apple,t8112-i2c", "apple,i2c";
   793				reg = <0x2 0x35020000 0x0 0x4000>;
   794				clocks = <&clkref>;
   795				interrupt-parent = <&aic>;
   796				interrupts = <AIC_IRQ 765 IRQ_TYPE_LEVEL_HIGH>;
   797				pinctrl-0 = <&i2c4_pins>;
   798				pinctrl-names = "default";
   799				#address-cells = <0x1>;
   800				#size-cells = <0x0>;
   801				power-domains = <&ps_i2c4>;
   802				status = "disabled";
   803			};
   804	
   805			fpwm1: pwm@235044000 {
   806				compatible = "apple,t8112-fpwm", "apple,s5l-fpwm";
   807				reg = <0x2 0x35044000 0x0 0x4000>;
   808				power-domains = <&ps_fpwm1>;
   809				clocks = <&clkref>;
   810				#pwm-cells = <2>;
   811				status = "disabled";
   812			};
   813	
   814			spi1: spi@235104000 {
   815				compatible = "apple,t8112-spi", "apple,spi";
   816				reg = <0x2 0x35104000 0x0 0x4000>;
   817				interrupt-parent = <&aic>;
   818				interrupts = <AIC_IRQ 749 IRQ_TYPE_LEVEL_HIGH>;
   819				clocks = <&clk_200m>;
   820				pinctrl-0 = <&spi1_pins>;
   821				pinctrl-names = "default";
   822				power-domains = <&ps_spi1>;
   823				#address-cells = <1>;
   824				#size-cells = <0>;
   825				status = "disabled";
   826			};
   827	
   828			spi3: spi@23510c000 {
   829				compatible = "apple,t8112-spi", "apple,spi";
   830				reg = <0x2 0x3510c000 0x0 0x4000>;
   831				interrupt-parent = <&aic>;
   832				interrupts = <AIC_IRQ 751 IRQ_TYPE_LEVEL_HIGH>;
   833				clocks = <&clkref>;
   834				pinctrl-0 = <&spi3_pins>;
   835				pinctrl-names = "default";
   836				power-domains = <&ps_spi3>;
   837				#address-cells = <1>;
   838				#size-cells = <0>;
   839				status = "disabled";
   840			};
   841	
   842			serial0: serial@235200000 {
   843				compatible = "apple,s5l-uart";
   844				reg = <0x2 0x35200000 0x0 0x1000>;
   845				reg-io-width = <4>;
   846				interrupt-parent = <&aic>;
   847				interrupts = <AIC_IRQ 739 IRQ_TYPE_LEVEL_HIGH>;
   848				/*
   849				 * TODO: figure out the clocking properly, there may
   850				 * be a third selectable clock.
   851				 */
   852				clocks = <&clkref>, <&clkref>;
   853				clock-names = "uart", "clk_uart_baud0";
   854				power-domains = <&ps_uart0>;
   855				status = "disabled";
   856			};
   857	
   858			serial2: serial@235208000 {
   859				compatible = "apple,s5l-uart";
   860				reg = <0x2 0x35208000 0x0 0x1000>;
   861				reg-io-width = <4>;
   862				interrupt-parent = <&aic>;
   863				interrupts = <AIC_IRQ 741 IRQ_TYPE_LEVEL_HIGH>;
   864				clocks = <&clkref>, <&clkref>;
   865				clock-names = "uart", "clk_uart_baud0";
   866				power-domains = <&ps_uart2>;
   867				status = "disabled";
   868			};
   869	
   870			sio_mbox: mbox@236408000 {
   871				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
   872				reg = <0x2 0x36408000 0x0 0x4000>;
   873				interrupt-parent = <&aic>;
   874				interrupts = <AIC_IRQ 774 IRQ_TYPE_LEVEL_HIGH>,
   875					<AIC_IRQ 775 IRQ_TYPE_LEVEL_HIGH>,
   876					<AIC_IRQ 776 IRQ_TYPE_LEVEL_HIGH>,
   877					<AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
   878				interrupt-names = "send-empty", "send-not-empty",
   879					"recv-empty", "recv-not-empty";
   880				#mbox-cells = <0>;
   881				power-domains = <&ps_sio_cpu>;
   882			};
   883	
   884			sio: sio@236400000 {
   885				compatible = "apple,t8112-sio", "apple,sio";
   886				reg = <0x2 0x36400000 0x0 0x8000>;
   887				dma-channels = <128>;
   888				#dma-cells = <1>;
   889				mboxes = <&sio_mbox>;
   890				iommus = <&sio_dart 0>;
   891				power-domains = <&ps_sio_cpu>;
   892				resets = <&ps_sio>; /* TODO: verify reset does something */
   893				status = "disabled";
   894			};
   895	
   896			admac: dma-controller@238200000 {
   897				compatible = "apple,t8112-admac", "apple,admac";
   898				reg = <0x2 0x38200000 0x0 0x34000>;
   899				dma-channels = <24>;
   900				interrupts-extended = <0>,
   901						      <&aic AIC_IRQ 760 IRQ_TYPE_LEVEL_HIGH>,
   902						      <0>,
   903						      <0>;
   904				#dma-cells = <1>;
   905				iommus = <&sio_dart 2>;
   906				power-domains = <&ps_sio_adma>;
   907				resets = <&ps_audio_p>;
   908			};
   909	
   910			dpaudio0: audio-controller@238330000 {
   911				compatible = "apple,t8112-dpaudio", "apple,dpaudio";
   912				reg = <0x2 0x38330000 0x0 0x4000>;
   913				dmas = <&sio 0x64>;
   914				dma-names = "tx";
   915				power-domains = <&ps_dpa0>;
   916				reset-domains = <&ps_dpa0>;
   917				status = "disabled";
   918	
   919				ports {
   920					#address-cells = <1>;
   921					#size-cells = <0>;
   922					port@0 {
   923						reg = <0>;
   924						dpaudio0_dcp: endpoint {
   925							remote-endpoint = <&dcp_audio>;
   926						};
   927					};
   928				};
   929			};
   930	
   931			dpaudio1: audio-controller@238334000 {
   932				compatible = "apple,t8112-dpaudio", "apple,dpaudio";
   933				reg = <0x2 0x38334000 0x0 0x4000>;
   934				dmas = <&sio 0x66>;
   935				dma-names = "tx";
   936				power-domains = <&ps_dpa1>;
   937				reset-domains = <&ps_dpa1>;
   938				status = "disabled";
   939	
   940				ports {
   941					#address-cells = <1>;
   942					#size-cells = <0>;
   943					port@0 {
   944						reg = <0>;
   945						dpaudio1_dcp: endpoint {
   946							remote-endpoint = <&dcpext_audio>;
   947						};
   948					};
   949				};
   950			};
   951	
   952			mca: i2s@238400000 {
   953				compatible = "apple,t8112-mca", "apple,mca";
   954				reg = <0x2 0x38400000 0x0 0x18000>,
   955				      <0x2 0x38300000 0x0 0x30000>;
   956	
   957				interrupt-parent = <&aic>;
   958				interrupts = <AIC_IRQ 753 IRQ_TYPE_LEVEL_HIGH>,
   959					     <AIC_IRQ 754 IRQ_TYPE_LEVEL_HIGH>,
   960					     <AIC_IRQ 755 IRQ_TYPE_LEVEL_HIGH>,
   961					     <AIC_IRQ 756 IRQ_TYPE_LEVEL_HIGH>,
   962					     <AIC_IRQ 757 IRQ_TYPE_LEVEL_HIGH>,
   963					     <AIC_IRQ 758 IRQ_TYPE_LEVEL_HIGH>;
   964	
   965				resets = <&ps_audio_p>;
   966				clocks = <&nco 0>, <&nco 1>, <&nco 2>,
   967					 <&nco 3>, <&nco 4>, <&nco 4>;
   968				power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
   969						<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
   970				dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
   971				       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
   972				       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
   973				       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
   974				       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
   975				       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
   976				dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
   977					    "tx1a", "rx1a", "tx1b", "rx1b",
   978					    "tx2a", "rx2a", "tx2b", "rx2b",
   979					    "tx3a", "rx3a", "tx3b", "rx3b",
   980					    "tx4a", "rx4a", "tx4b", "rx4b",
   981					    "tx5a", "rx5a", "tx5b", "rx5b";
   982	
   983				#sound-dai-cells = <1>;
   984			};
   985	
   986			nco: clock-controller@23b044000 {
   987				compatible = "apple,t8112-nco", "apple,nco";
   988				reg = <0x2 0x3b044000 0x0 0x14000>;
   989				clocks = <&nco_clkref>;
   990				#clock-cells = <1>;
   991			};
   992	
   993			aic: interrupt-controller@23b0c0000 {
   994				compatible = "apple,t8112-aic", "apple,aic2";
   995				#interrupt-cells = <3>;
   996				interrupt-controller;
   997				reg = <0x2 0x3b0c0000 0x0 0x8000>,
   998					<0x2 0x3b0c8000 0x0 0x4>;
   999				reg-names = "core", "event";
  1000				power-domains = <&ps_aic>;
  1001	
  1002				affinities {
  1003					e-core-pmu-affinity {
  1004						apple,fiq-index = <AIC_CPU_PMU_E>;
  1005						cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
  1006					};
  1007	
  1008					p-core-pmu-affinity {
  1009						apple,fiq-index = <AIC_CPU_PMU_P>;
  1010						cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
  1011					};
  1012				};
  1013			};
  1014	
  1015			pmgr: power-management@23b700000 {
  1016				compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
  1017				#address-cells = <1>;
  1018				#size-cells = <1>;
  1019				reg = <0x2 0x3b700000 0 0x14000>;
  1020				/* child nodes are added in t8103-pmgr.dtsi */
  1021			};
  1022	
  1023			pmgr_dcp: power-management@23b3d0000 {
  1024				reg = <0x2 0x3b3d0000 0x0 0x4000>;
  1025				reg-names = "dcp-bw-scratch";
  1026				#apple,bw-scratch-cells = <3>;
  1027			};
  1028	
  1029			pinctrl_ap: pinctrl@23c100000 {
  1030				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
  1031				reg = <0x2 0x3c100000 0x0 0x100000>;
  1032				power-domains = <&ps_gpio>;
  1033	
  1034				gpio-controller;
  1035				#gpio-cells = <2>;
  1036				gpio-ranges = <&pinctrl_ap 0 0 213>;
  1037				apple,npins = <213>;
  1038	
  1039				interrupt-controller;
  1040				#interrupt-cells = <2>;
  1041				interrupt-parent = <&aic>;
  1042				interrupts = <AIC_IRQ 199 IRQ_TYPE_LEVEL_HIGH>,
  1043					     <AIC_IRQ 200 IRQ_TYPE_LEVEL_HIGH>,
  1044					     <AIC_IRQ 201 IRQ_TYPE_LEVEL_HIGH>,
  1045					     <AIC_IRQ 202 IRQ_TYPE_LEVEL_HIGH>,
  1046					     <AIC_IRQ 203 IRQ_TYPE_LEVEL_HIGH>,
  1047					     <AIC_IRQ 204 IRQ_TYPE_LEVEL_HIGH>,
  1048					     <AIC_IRQ 205 IRQ_TYPE_LEVEL_HIGH>;
  1049	
  1050				i2c0_pins: i2c0-pins {
  1051					pinmux = <APPLE_PINMUX(111, 1)>,
  1052						 <APPLE_PINMUX(110, 1)>;
  1053				};
  1054	
  1055				i2c1_pins: i2c1-pins {
  1056					pinmux = <APPLE_PINMUX(113, 1)>,
  1057						 <APPLE_PINMUX(112, 1)>;
  1058				};
  1059	
  1060				i2c2_pins: i2c2-pins {
  1061					pinmux = <APPLE_PINMUX(87, 1)>,
  1062						 <APPLE_PINMUX(86, 1)>;
  1063				};
  1064	
  1065				i2c3_pins: i2c3-pins {
  1066					pinmux = <APPLE_PINMUX(54, 1)>,
  1067						 <APPLE_PINMUX(53, 1)>;
  1068				};
  1069	
  1070				i2c4_pins: i2c4-pins {
  1071					pinmux = <APPLE_PINMUX(131, 1)>,
  1072						 <APPLE_PINMUX(130, 1)>;
  1073				};
  1074	
  1075				spi1_pins: spi1-pins {
  1076					pinmux = <APPLE_PINMUX(46, 1)>,
  1077						<APPLE_PINMUX(47, 1)>,
  1078						<APPLE_PINMUX(48, 1)>,
  1079						<APPLE_PINMUX(49, 1)>;
  1080				};
  1081	
  1082				spi3_pins: spi3-pins {
  1083					pinmux = <APPLE_PINMUX(93, 1)>,
  1084						<APPLE_PINMUX(94, 1)>,
  1085						<APPLE_PINMUX(95, 1)>,
  1086						<APPLE_PINMUX(96, 1)>;
  1087				};
  1088	
  1089				pcie_pins: pcie-pins {
  1090					pinmux = <APPLE_PINMUX(162, 1)>,
  1091						 <APPLE_PINMUX(163, 1)>,
  1092						 <APPLE_PINMUX(164, 1)>;
  1093					// TODO: 1 more CLKREQs
  1094				};
  1095			};
  1096	
  1097			dptxphy: phy@23c500000 {
  1098				compatible = "apple,t8112-dptx-phy", "apple,dptx-phy";
  1099				reg = <0x2 0x3c500000 0x0 0x4000>,
  1100					<0x2 0x3c540000 0x0 0xc000>;
  1101				reg-names = "core", "dptx";
  1102				power-domains = <&ps_dptx_ext_phy>;
  1103				#phy-cells = <0>;
  1104				#reset-cells = <0>;
  1105				status = "disabled"; /* only used on j473 */
  1106	               };
  1107	
  1108			nub_spmi: spmi@23d0d9300 {
  1109				compatible = "apple,t8112-spmi", "apple,spmi";
  1110				reg = <0x2 0x3d714000 0x0 0x100>;
  1111				#address-cells = <2>;
  1112				#size-cells = <0>;
  1113				interrupt-parent = <&aic>;
  1114				interrupts = <AIC_IRQ 256 IRQ_TYPE_LEVEL_HIGH>,
  1115					<AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>;
  1116	
  1117				pmu1: pmu@e {
  1118					compatible = "apple,stowe-pmu", "apple,spmi-pmu";
  1119					reg = <0xe SPMI_USID>;
  1120					#address-cells = <1>;
  1121					#size-cells = <1>;
  1122	
  1123					rtc_nvmem@f800 {
  1124						compatible = "apple,spmi-pmu-nvmem";
  1125						reg = <0xf800 0x300>;
  1126						#address-cells = <1>;
  1127						#size-cells = <1>;
  1128	
  1129						pm_setting: pm-setting@1 {
  1130							reg = <0x1 0x1>;
  1131						};
  1132	
  1133						rtc_offset: rtc-offset@100 {
  1134							reg = <0x100 0x6>;
  1135						};
  1136					};
  1137	
  1138					legacy_nvmem@f700 {
  1139						compatible = "apple,spmi-pmu-nvmem";
  1140						reg = <0xf700 0x20>;
  1141						#address-cells = <1>;
  1142						#size-cells = <1>;
  1143	
  1144						boot_stage: boot-stage@1 {
  1145							reg = <0x1 0x1>;
  1146						};
  1147	
  1148						boot_error_count: boot-error-count@2 {
  1149							reg = <0x2 0x1>;
  1150							bits = <0 4>;
  1151						};
  1152	
  1153						panic_count: panic-count@2 {
  1154							reg = <0x2 0x1>;
  1155							bits = <4 4>;
  1156						};
  1157	
  1158						boot_error_stage: boot-error-stage@3 {
  1159							reg = <0x3 0x1>;
  1160						};
  1161	
  1162						shutdown_flag: shutdown-flag@f {
  1163							reg = <0xf 0x1>;
  1164							bits = <3 1>;
  1165						};
  1166					};
  1167	
  1168					scrpad_nvmem@8000 {
  1169						compatible = "apple,spmi-pmu-nvmem";
  1170						reg = <0x8000 0x2800>;
  1171						#address-cells = <1>;
  1172						#size-cells = <1>;
  1173	
  1174						fault_shadow: fault-shadow@67b {
  1175							reg = <0x67b 0x10>;
  1176						};
  1177	
  1178						socd: socd@b00 {
  1179							reg = <0xb00 0x400>;
  1180						};
  1181					};
  1182	
  1183				};
  1184			};
  1185	
  1186			pinctrl_nub: pinctrl@23d1f0000 {
  1187				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
  1188				reg = <0x2 0x3d1f0000 0x0 0x4000>;
  1189				power-domains = <&ps_nub_gpio>;
  1190	
  1191				gpio-controller;
  1192				#gpio-cells = <2>;
  1193				gpio-ranges = <&pinctrl_nub 0 0 24>;
  1194				apple,npins = <24>;
  1195	
  1196				interrupt-controller;
  1197				#interrupt-cells = <2>;
  1198				interrupt-parent = <&aic>;
  1199				interrupts = <AIC_IRQ 371 IRQ_TYPE_LEVEL_HIGH>,
  1200					     <AIC_IRQ 372 IRQ_TYPE_LEVEL_HIGH>,
  1201					     <AIC_IRQ 373 IRQ_TYPE_LEVEL_HIGH>,
  1202					     <AIC_IRQ 374 IRQ_TYPE_LEVEL_HIGH>,
  1203					     <AIC_IRQ 375 IRQ_TYPE_LEVEL_HIGH>,
  1204					     <AIC_IRQ 376 IRQ_TYPE_LEVEL_HIGH>,
  1205					     <AIC_IRQ 377 IRQ_TYPE_LEVEL_HIGH>;
  1206			};
  1207	
  1208			pmgr_mini: power-management@23d280000 {
  1209				compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
  1210				#address-cells = <1>;
  1211				#size-cells = <1>;
  1212				reg = <0x2 0x3d280000 0 0x4000>;
  1213				/* child nodes are added in t8103-pmgr.dtsi */
  1214			};
  1215	
  1216			wdt: watchdog@23d2b0000 {
  1217				compatible = "apple,t8112-wdt", "apple,wdt";
  1218				reg = <0x2 0x3d2b0000 0x0 0x4000>;
  1219				clocks = <&clkref>;
  1220				interrupt-parent = <&aic>;
  1221				interrupts = <AIC_IRQ 379 IRQ_TYPE_LEVEL_HIGH>;
  1222			};
  1223	
  1224			efuse@23d2c8000 {
  1225				compatible = "apple,t8112-efuses", "apple,efuses";
  1226				reg = <0x2 0x3d2c8000 0x0 0x1000>;
  1227				#address-cells = <1>;
  1228				#size-cells = <1>;
  1229	
  1230				atcphy0_auspll_rodco_bias_adjust: efuse@480,20 {
  1231					reg = <0x480 4>;
  1232					bits = <20 3>;
  1233				};
  1234	
  1235				atcphy0_auspll_rodco_encap: efuse@480,23 {
  1236					reg = <0x480 4>;
  1237					bits = <23 2>;
  1238				};
  1239	
  1240				atcphy0_auspll_dtc_vreg_adjust: efuse@480,25 {
  1241					reg = <0x480 4>;
  1242					bits = <25 3>;
  1243				};
  1244	
  1245				atcphy0_auspll_fracn_dll_start_capcode: efuse@480,28 {
  1246					reg = <0x480 4>;
  1247					bits = <28 2>;
  1248				};
  1249	
  1250				atcphy0_aus_cmn_shm_vreg_trim: efuse@480,30 {
  1251					reg = <0x480 8>;
  1252					bits = <30 5>;
  1253				};
  1254	
  1255				atcphy0_cio3pll_dco_coarsebin0: efuse@484,3 {
  1256					reg = <0x484 4>;
  1257					bits = <3 6>;
  1258				};
  1259	
  1260				atcphy0_cio3pll_dco_coarsebin1: efuse@484,9 {
  1261					reg = <0x484 4>;
  1262					bits = <9 6>;
  1263				};
  1264	
  1265				atcphy0_cio3pll_dll_start_capcode: efuse@484,15 {
  1266					reg = <0x484 4>;
  1267					bits = <15 2>;
  1268				};
  1269	
  1270				atcphy0_cio3pll_dtc_vreg_adjust: efuse@484,17 {
  1271					reg = <0x484 0x4>;
  1272					bits = <17 3>;
  1273				};
  1274	
  1275				atcphy1_auspll_rodco_bias_adjust: efuse@484,30 {
  1276					reg = <0x484 8>;
  1277					bits = <30 3>;
  1278				};
  1279	
  1280				atcphy1_auspll_rodco_encap: efuse@488,1 {
  1281					reg = <0x488 8>;
  1282					bits = <1 2>;
  1283				};
  1284	
  1285				atcphy1_auspll_dtc_vreg_adjust: efuse@488,3 {
  1286					reg = <0x488 4>;
  1287					bits = <3 3>;
  1288				};
  1289	
  1290				atcphy1_auspll_fracn_dll_start_capcode: efuse@488,6 {
  1291					reg = <0x488 4>;
  1292					bits = <6 2>;
  1293				};
  1294	
  1295				atcphy1_aus_cmn_shm_vreg_trim: efuse@488,8 {
  1296					reg = <0x488 4>;
  1297					bits = <8 5>;
  1298				};
  1299	
  1300				atcphy1_cio3pll_dco_coarsebin0: efuse@488,13 {
  1301					reg = <0x488 4>;
  1302					bits = <13 6>;
  1303				};
  1304	
  1305				atcphy1_cio3pll_dco_coarsebin1: efuse@488,19 {
  1306					reg = <0x488 4>;
  1307					bits = <19 6>;
  1308				};
  1309	
  1310				atcphy1_cio3pll_dll_start_capcode: efuse@488,25 {
  1311					reg = <0x488 4>;
  1312					bits = <25 2>;
  1313				};
  1314	
  1315				atcphy1_cio3pll_dtc_vreg_adjust: efuse@488,27 {
  1316					reg = <0x488 0x4>;
  1317					bits = <27 3>;
  1318				};
  1319			};
  1320	
  1321			smc_mbox: mbox@23e408000 {
  1322				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
  1323				reg = <0x2 0x3e408000 0x0 0x4000>;
  1324				interrupt-parent = <&aic>;
  1325				interrupts = <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>,
  1326					<AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
  1327					<AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
  1328					<AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>;
  1329				interrupt-names = "send-empty", "send-not-empty",
  1330					"recv-empty", "recv-not-empty";
  1331				#mbox-cells = <0>;
  1332			};
  1333	
  1334			smc: smc@23e400000 {
  1335				compatible = "apple,t8112-smc", "apple,smc";
  1336				reg = <0x2 0x3e400000 0x0 0x4000>,
  1337					<0x2 0x3fe00000 0x0 0x100000>;
  1338				reg-names = "smc", "sram";
  1339				mboxes = <&smc_mbox>;
  1340	
  1341				smc_gpio: gpio {
  1342					gpio-controller;
  1343					#gpio-cells = <2>;
  1344				};
  1345	
  1346				smc_rtc: rtc {
  1347					nvmem-cells = <&rtc_offset>;
  1348					nvmem-cell-names = "rtc_offset";
  1349				};
  1350	
  1351				smc_reboot: reboot {
  1352					nvmem-cells = <&shutdown_flag>, <&boot_stage>,
  1353						<&boot_error_count>, <&panic_count>, <&pm_setting>;
  1354					nvmem-cell-names = "shutdown_flag", "boot_stage",
  1355						"boot_error_count", "panic_count", "pm_setting";
  1356				};
  1357			};
  1358	
  1359			pinctrl_smc: pinctrl@23e820000 {
  1360				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
  1361				reg = <0x2 0x3e820000 0x0 0x4000>;
  1362	
  1363				gpio-controller;
  1364				#gpio-cells = <2>;
  1365				gpio-ranges = <&pinctrl_smc 0 0 18>;
  1366				apple,npins = <18>;
  1367	
  1368				interrupt-controller;
  1369				#interrupt-cells = <2>;
  1370				interrupt-parent = <&aic>;
  1371				interrupts = <AIC_IRQ 490 IRQ_TYPE_LEVEL_HIGH>,
  1372					     <AIC_IRQ 491 IRQ_TYPE_LEVEL_HIGH>,
  1373					     <AIC_IRQ 492 IRQ_TYPE_LEVEL_HIGH>,
  1374					     <AIC_IRQ 493 IRQ_TYPE_LEVEL_HIGH>,
  1375					     <AIC_IRQ 494 IRQ_TYPE_LEVEL_HIGH>,
  1376					     <AIC_IRQ 495 IRQ_TYPE_LEVEL_HIGH>,
  1377					     <AIC_IRQ 496 IRQ_TYPE_LEVEL_HIGH>;
  1378			};
  1379	
  1380			pinctrl_aop: pinctrl@24a820000 {
  1381				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
  1382				reg = <0x2 0x4a820000 0x0 0x4000>;
  1383	
  1384				gpio-controller;
  1385				#gpio-cells = <2>;
  1386				gpio-ranges = <&pinctrl_aop 0 0 54>;
  1387				apple,npins = <54>;
  1388	
  1389				interrupt-controller;
  1390				#interrupt-cells = <2>;
  1391				interrupt-parent = <&aic>;
  1392				interrupts = <AIC_IRQ 301 IRQ_TYPE_LEVEL_HIGH>,
  1393					     <AIC_IRQ 302 IRQ_TYPE_LEVEL_HIGH>,
  1394					     <AIC_IRQ 303 IRQ_TYPE_LEVEL_HIGH>,
  1395					     <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>,
  1396					     <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>,
  1397					     <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>,
  1398					     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
  1399			};
  1400	
  1401			mtp: mtp@24e400000 {
  1402				compatible = "apple,t8112-mtp", "apple,t8112-rtk-helper-asc4", "apple,mtp", "apple,rtk-helper-asc4";
  1403				reg = <0x2 0x4e400000 0x0 0x4000>,
  1404					<0x2 0x4ec00000 0x0 0x100000>;
  1405				reg-names = "asc", "sram";
  1406				mboxes = <&mtp_mbox>;
  1407				iommus = <&mtp_dart 1>;
  1408				#helper-cells = <0>;
  1409	
  1410				status = "disabled";
  1411			};
  1412	
  1413			mtp_mbox: mbox@24e408000 {
  1414				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
  1415				reg = <0x2 0x4e408000 0x0 0x4000>;
  1416				interrupt-parent = <&aic>;
  1417				interrupts = <AIC_IRQ 864 IRQ_TYPE_LEVEL_HIGH>,
  1418					<AIC_IRQ 865 IRQ_TYPE_LEVEL_HIGH>,
  1419					<AIC_IRQ 866 IRQ_TYPE_LEVEL_HIGH>,
  1420					<AIC_IRQ 867 IRQ_TYPE_LEVEL_HIGH>;
  1421				interrupt-names = "send-empty", "send-not-empty",
  1422					"recv-empty", "recv-not-empty";
  1423				#mbox-cells = <0>;
  1424	
  1425				status = "disabled";
  1426			};
  1427	
  1428			mtp_dart: iommu@24e808000 {
  1429				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1430				reg = <0x2 0x4e808000 0x0 0x4000>;
  1431				interrupt-parent = <&aic>;
  1432				interrupts = <AIC_IRQ 848 IRQ_TYPE_LEVEL_HIGH>;
  1433				#iommu-cells = <1>;
  1434	
  1435				status = "disabled";
  1436			};
  1437	
  1438			mtp_dockchannel: fifo@24eb14000 {
  1439				compatible = "apple,t8112-dockchannel", "apple,dockchannel";
  1440				reg = <0x2 0x4eb14000 0x0 0x4000>;
  1441				reg-names = "irq";
  1442				interrupt-parent = <&aic>;
  1443				interrupts = <AIC_IRQ 850 IRQ_TYPE_LEVEL_HIGH>;
  1444	
  1445				ranges = <0 0x2 0x4eb28000 0x20000>;
  1446				nonposted-mmio;
  1447				#address-cells = <1>;
  1448				#size-cells = <1>;
  1449	
  1450				interrupt-controller;
  1451				#interrupt-cells = <2>;
  1452	
  1453				status = "disabled";
  1454	
  1455				mtp_hid: input@8000 {
  1456					compatible = "apple,dockchannel-hid";
  1457					reg = <0x8000 0x4000>,
  1458						<0xc000 0x4000>,
  1459						<0x0000 0x4000>,
  1460						<0x4000 0x4000>;
  1461					reg-names = "config", "data",
  1462						"rmt-config", "rmt-data";
  1463					iommus = <&mtp_dart 1>;
  1464					interrupt-parent = <&mtp_dockchannel>;
  1465					interrupts = <2 IRQ_TYPE_LEVEL_HIGH>,
  1466						<3 IRQ_TYPE_LEVEL_HIGH>;
  1467					interrupt-names = "tx", "rx";
  1468	
  1469					apple,fifo-size = <0x800>;
  1470					apple,helper-cpu = <&mtp>;
  1471				};
  1472	
  1473			};
  1474	
  1475			dispext0_dart: iommu@271304000 {
  1476				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1477				reg = <0x2 0x71304000 0x0 0x4000>;
  1478				#iommu-cells = <1>;
  1479				apple,dma-range = <0x0 0x0 0xf 0xffff0000>;
  1480				interrupt-parent = <&aic>;
  1481				interrupts = <AIC_IRQ 593 IRQ_TYPE_LEVEL_HIGH>;
  1482				power-domains = <&ps_dispext_cpu0>;
  1483				status = "disabled";
  1484			};
  1485	
  1486			dcpext_dart: iommu@27130c000 {
  1487				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1488				reg = <0x2 0x7130c000 0x0 0x4000>;
  1489				#iommu-cells = <1>;
  1490				apple,dma-range = <0x8 0x0 0x7 0xffff0000>;
  1491				interrupt-parent = <&aic>;
  1492				interrupts = <AIC_IRQ 593 IRQ_TYPE_LEVEL_HIGH>;
  1493				power-domains = <&ps_dispext_cpu0>;
  1494				status = "disabled";
  1495			};
  1496	
  1497			dcpext_mbox: mbox@271c08000 {
  1498				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
  1499				reg = <0x2 0x71c08000 0x0 0x4000>;
  1500				interrupt-parent = <&aic>;
  1501				interrupts = <AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>,
  1502				<AIC_IRQ 579 IRQ_TYPE_LEVEL_HIGH>,
  1503				<AIC_IRQ 580 IRQ_TYPE_LEVEL_HIGH>,
  1504				<AIC_IRQ 581 IRQ_TYPE_LEVEL_HIGH>;
  1505				interrupt-names = "send-empty", "send-not-empty",
  1506				"recv-empty", "recv-not-empty";
  1507				#mbox-cells = <0>;
  1508				power-domains = <&ps_dispext_cpu0>;
  1509				resets = <&ps_dispext_cpu0>;
  1510				status = "disabled";
  1511			};
  1512	
  1513			dcpext: dcp@271c00000 {
  1514				compatible = "apple,t8112-dcpext", "apple,dcpext";
  1515				mboxes = <&dcpext_mbox>;
  1516				mbox-names = "mbox";
  1517				iommus = <&dcpext_dart 5>;
  1518				phandle = <&dcpext>;
  1519	
  1520				/* the ADT has 2 additional regs which seems to be unused */
  1521				reg-names = "coproc", "disp-0", "disp-1", "disp-2", "disp-3";
  1522				reg = <0x2 0x71c00000 0x0 0x4000>,
  1523				      <0x2 0x70000000 0x0 0x61C000>,
  1524				      <0x2 0x71320000 0x0 0x4000>,
  1525				      <0x2 0x71344000 0x0 0x4000>,
  1526				      <0x2 0x71800000 0x0 0x800000>;
  1527				apple,bw-scratch = <&pmgr_dcp 0 4 0x5e0>;
  1528				power-domains = <&ps_dispext_cpu0>;
  1529				resets = <&ps_dispext_cpu0>;
  1530				clocks = <&clk_dispext0>;
  1531				apple,asc-dram-mask = <0x0 0x0>;
  1532				apple,dcp-index = <1>;
  1533				status = "disabled";
  1534	
  1535				dispext0_piodma: piodma {
  1536					iommus = <&dispext0_dart 4>;
  1537					phandle = <&dispext0_piodma>;
  1538				};
  1539	
  1540				ports {
  1541					#address-cells = <1>;
  1542					#size-cells = <0>;
  1543					port@0 {
  1544						reg = <0>;
  1545						dcpext_audio: endpoint {
  1546							remote-endpoint = <&dpaudio1_dcp>;
  1547						};
  1548					};
  1549				};
  1550			};
  1551	
  1552			ans_mbox: mbox@277408000 {
  1553				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
  1554				reg = <0x2 0x77408000 0x0 0x4000>;
  1555				interrupt-parent = <&aic>;
  1556				interrupts = <AIC_IRQ 717 IRQ_TYPE_LEVEL_HIGH>,
  1557					<AIC_IRQ 718 IRQ_TYPE_LEVEL_HIGH>,
  1558					<AIC_IRQ 719 IRQ_TYPE_LEVEL_HIGH>,
  1559					<AIC_IRQ 720 IRQ_TYPE_LEVEL_HIGH>;
  1560				interrupt-names = "send-empty", "send-not-empty",
  1561					"recv-empty", "recv-not-empty";
  1562				#mbox-cells = <0>;
  1563				power-domains = <&ps_ans>;
  1564			};
  1565	
  1566			sart: sart@27bc50000 {
  1567				compatible = "apple,t8112-sart", "apple,t6000-sart";
  1568				reg = <0x2 0x7bc50000 0x0 0x10000>;
  1569				power-domains = <&ps_ans>;
  1570			};
  1571	
  1572			nvme@27bcc0000 {
  1573				compatible = "apple,t8112-nvme-ans2", "apple,nvme-ans2";
  1574				reg = <0x2 0x7bcc0000 0x0 0x40000>,
  1575					<0x2 0x77400000 0x0 0x4000>;
  1576				reg-names = "nvme", "ans";
  1577				interrupt-parent = <&aic>;
  1578				interrupts = <AIC_IRQ 724 IRQ_TYPE_LEVEL_HIGH>;
  1579				mboxes = <&ans_mbox>;
  1580				apple,sart = <&sart>;
  1581				power-domains = <&ps_ans>, <&ps_apcie_st>;
  1582				power-domain-names = "ans", "apcie0";
  1583				resets = <&ps_ans>;
  1584			};
  1585	
  1586			dwc3_0: usb@382280000 {
  1587				compatible = "apple,t8112-dwc3", "apple,dwc3", "snps,dwc3";
  1588				reg = <0x3 0x82280000 0x0 0x100000>;
  1589				interrupt-parent = <&aic>;
  1590				interrupts = <AIC_IRQ 1031 IRQ_TYPE_LEVEL_HIGH>;
  1591				dr_mode = "otg";
  1592				usb-role-switch;
  1593				role-switch-default-mode = "host";
  1594				iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
  1595				power-domains = <&ps_atc0_usb>;
  1596				resets = <&atcphy0>;
  1597				phys = <&atcphy0 PHY_TYPE_USB2>, <&atcphy0 PHY_TYPE_USB3>;
  1598				phy-names = "usb2-phy", "usb3-phy";
  1599			};
  1600	
  1601			dwc3_0_dart_0: iommu@382f00000 {
  1602				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1603				reg = <0x3 0x82f00000 0x0 0x4000>;
  1604				interrupt-parent = <&aic>;
  1605				interrupts = <AIC_IRQ 1035 IRQ_TYPE_LEVEL_HIGH>;
  1606				#iommu-cells = <1>;
  1607				power-domains = <&ps_atc0_usb>;
  1608			};
  1609	
  1610			dwc3_0_dart_1: iommu@382f80000 {
  1611				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1612				reg = <0x3 0x82f80000 0x0 0x4000>;
  1613				interrupt-parent = <&aic>;
  1614				interrupts = <AIC_IRQ 1035 IRQ_TYPE_LEVEL_HIGH>;
  1615				#iommu-cells = <1>;
  1616				power-domains = <&ps_atc0_usb>;
  1617			};
  1618	
  1619			atcphy0: phy@383000000 {
  1620				compatible = "apple,t8112-atcphy", "apple,t8103-atcphy";
  1621				reg = <0x3 0x83000000 0x0 0x4c000>,
  1622					<0x3 0x83050000 0x0 0x8000>,
  1623					<0x3 0x80000000 0x0 0x4000>,
  1624					<0x3 0x82a90000 0x0 0x4000>,
  1625					<0x3 0x82a84000 0x0 0x4000>;
  1626				reg-names = "core", "lpdptx", "axi2af", "usb2phy",
  1627					"pipehandler";
  1628	
  1629				#phy-cells = <1>;
  1630				#reset-cells = <0>;
  1631	
  1632				nvmem-cells = <&atcphy0_aus_cmn_shm_vreg_trim>,
  1633					<&atcphy0_auspll_rodco_encap>,
  1634					<&atcphy0_auspll_rodco_bias_adjust>,
  1635					<&atcphy0_auspll_fracn_dll_start_capcode>,
  1636					<&atcphy0_auspll_dtc_vreg_adjust>,
  1637					<&atcphy0_cio3pll_dco_coarsebin0>,
  1638					<&atcphy0_cio3pll_dco_coarsebin1>,
  1639					<&atcphy0_cio3pll_dll_start_capcode>,
  1640					<&atcphy0_cio3pll_dtc_vreg_adjust>;
  1641				nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
  1642					"auspll_rodco_encap",
  1643					"auspll_rodco_bias_adjust",
  1644					"auspll_fracn_dll_start_capcode",
  1645					"auspll_dtc_vreg_adjust",
  1646					"cio3pll_dco_coarsebin0",
  1647					"cio3pll_dco_coarsebin1",
  1648					"cio3pll_dll_start_capcode",
  1649					"cio3pll_dtc_vreg_adjust";
  1650	
  1651				orientation-switch;
  1652				mode-switch;
  1653				svid = <0xff01>, <0x8087>;
  1654				power-domains = <&ps_atc0_usb>;
  1655			};
  1656	
  1657			dwc3_1: usb@502280000 {
  1658				compatible = "apple,t8112-dwc3", "apple,dwc3", "snps,dwc3";
  1659				reg = <0x5 0x02280000 0x0 0x100000>;
  1660				interrupt-parent = <&aic>;
  1661				interrupts = <AIC_IRQ 1112 IRQ_TYPE_LEVEL_HIGH>;
  1662				dr_mode = "otg";
  1663				usb-role-switch;
  1664				role-switch-default-mode = "host";
  1665				iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
  1666				power-domains = <&ps_atc1_usb>;
  1667				resets = <&atcphy1>;
  1668				phys = <&atcphy1 PHY_TYPE_USB2>, <&atcphy1 PHY_TYPE_USB3>;
  1669				phy-names = "usb2-phy", "usb3-phy";
  1670			};
  1671	
  1672			dwc3_1_dart_0: iommu@502f00000 {
  1673				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1674				reg = <0x5 0x02f00000 0x0 0x4000>;
  1675				interrupt-parent = <&aic>;
  1676				interrupts = <AIC_IRQ 1116 IRQ_TYPE_LEVEL_HIGH>;
  1677				#iommu-cells = <1>;
  1678				power-domains = <&ps_atc1_usb>;
  1679			};
  1680	
  1681			dwc3_1_dart_1: iommu@502f80000 {
  1682				compatible = "apple,t8112-dart", "apple,t8110-dart";
  1683				reg = <0x5 0x02f80000 0x0 0x4000>;
  1684				interrupt-parent = <&aic>;
  1685				interrupts = <AIC_IRQ 1116 IRQ_TYPE_LEVEL_HIGH>;
  1686				#iommu-cells = <1>;
  1687				power-domains = <&ps_atc1_usb>;
  1688			};
  1689	
  1690			atcphy1: phy@503000000 {
  1691				compatible = "apple,t8112-atcphy", "apple,t8103-atcphy";
  1692				reg = <0x5 0x03000000 0x0 0x4c000>,
  1693					<0x5 0x03050000 0x0 0x8000>,
  1694					<0x5 0x0 0x0 0x4000>,
  1695					<0x5 0x02a90000 0x0 0x4000>,
  1696					<0x5 0x02a84000 0x0 0x4000>;
  1697				reg-names = "core", "lpdptx", "axi2af", "usb2phy",
  1698					"pipehandler";
  1699	
  1700				nvmem-cells = <&atcphy1_aus_cmn_shm_vreg_trim>,
  1701					<&atcphy1_auspll_rodco_encap>,
  1702					<&atcphy1_auspll_rodco_bias_adjust>,
  1703					<&atcphy1_auspll_fracn_dll_start_capcode>,
  1704					<&atcphy1_auspll_dtc_vreg_adjust>,
  1705					<&atcphy1_cio3pll_dco_coarsebin0>,
  1706					<&atcphy1_cio3pll_dco_coarsebin1>,
  1707					<&atcphy1_cio3pll_dll_start_capcode>,
  1708					<&atcphy1_cio3pll_dtc_vreg_adjust>;
  1709				nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
  1710					"auspll_rodco_encap",
  1711					"auspll_rodco_bias_adjust",
  1712					"auspll_fracn_dll_start_capcode",
  1713					"auspll_dtc_vreg_adjust",
  1714					"cio3pll_dco_coarsebin0",
  1715					"cio3pll_dco_coarsebin1",
  1716					"cio3pll_dll_start_capcode",
  1717					"cio3pll_dtc_vreg_adjust";
  1718	
  1719				#phy-cells = <1>;
  1720				#reset-cells = <0>;
  1721	
  1722				orientation-switch;
  1723				mode-switch;
  1724				svid = <0xff01>, <0x8087>;
  1725				power-domains = <&ps_atc1_usb>;
  1726			};
  1727	
  1728			pcie0_dart: iommu@681008000 {
  1729				compatible = "apple,t8110-dart";
  1730				reg = <0x6 0x81008000 0x0 0x4000>;
  1731				#iommu-cells = <1>;
  1732				interrupt-parent = <&aic>;
  1733				interrupts = <AIC_IRQ 782 IRQ_TYPE_LEVEL_HIGH>;
  1734				power-domains = <&ps_apcie_gp>;
  1735			};
  1736	
  1737			pcie1_dart: iommu@682008000 {
  1738				compatible = "apple,t8110-dart";
  1739				reg = <0x6 0x82008000 0x0 0x4000>;
  1740				#iommu-cells = <1>;
  1741				interrupt-parent = <&aic>;
  1742				interrupts = <AIC_IRQ 785 IRQ_TYPE_LEVEL_HIGH>;
  1743				power-domains = <&ps_apcie_gp>;
  1744				status = "disabled";
  1745			};
  1746	
  1747			pcie2_dart: iommu@683008000 {
  1748				compatible = "apple,t8110-dart";
  1749				reg = <0x6 0x83008000 0x0 0x4000>;
  1750				#iommu-cells = <1>;
  1751				interrupt-parent = <&aic>;
  1752				interrupts = <AIC_IRQ 788 IRQ_TYPE_LEVEL_HIGH>;
  1753				power-domains = <&ps_apcie_gp>;
  1754				status = "disabled";
  1755			};
  1756	
  1757			pcie3_dart: iommu@684008000 {
  1758				compatible = "apple,t8110-dart";
  1759				reg = <0x6 0x84008000 0x0 0x4000>;
  1760				#iommu-cells = <1>;
  1761				interrupt-parent = <&aic>;
  1762				interrupts = <AIC_IRQ 791 IRQ_TYPE_LEVEL_HIGH>;
  1763				power-domains = <&ps_apcie_gp>;
  1764				status = "disabled";
  1765			};
  1766	
  1767			pcie0: pcie@690000000 {
  1768				compatible = "apple,t8112-pcie", "apple,pcie";
  1769				device_type = "pci";
  1770	
  1771				reg = <0x6 0x90000000 0x0 0x1000000>,
  1772				      <0x6 0x80000000 0x0 0x100000>,
  1773				      <0x6 0x81000000 0x0 0x4000>,
  1774				      <0x6 0x82000000 0x0 0x4000>,
  1775				      <0x6 0x83000000 0x0 0x4000>,
  1776				      <0x6 0x84000000 0x0 0x4000>;
  1777				reg-names = "config", "rc", "port0", "port1", "port2", "port3";
  1778	
  1779				interrupt-parent = <&aic>;
  1780				interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>,
  1781					     <AIC_IRQ 784 IRQ_TYPE_LEVEL_HIGH>,
  1782					     <AIC_IRQ 787 IRQ_TYPE_LEVEL_HIGH>,
  1783					     <AIC_IRQ 790 IRQ_TYPE_LEVEL_HIGH>;
  1784	
  1785				msi-controller;
  1786				msi-parent = <&pcie0>;
  1787				msi-ranges = <&aic AIC_IRQ 793 IRQ_TYPE_EDGE_RISING 32>;
  1788	
  1789				iommu-map = <0x100 &pcie0_dart 0 1>,
  1790					    <0x200 &pcie1_dart 1 1>,
  1791					    <0x300 &pcie2_dart 2 1>,
  1792					    <0x400 &pcie3_dart 3 1>;
  1793				iommu-map-mask = <0xff00>;
  1794	
  1795				bus-range = <0 4>;
  1796				#address-cells = <3>;
  1797				#size-cells = <2>;
  1798				ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
  1799					 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
  1800	
  1801				power-domains = <&ps_apcie_gp>;
  1802				pinctrl-0 = <&pcie_pins>;
  1803				pinctrl-names = "default";
  1804	
  1805				port00: pci@0,0 {
  1806					device_type = "pci";
  1807					reg = <0x0 0x0 0x0 0x0 0x0>;
  1808					reset-gpios = <&pinctrl_ap 166 GPIO_ACTIVE_LOW>;
  1809	
  1810					#address-cells = <3>;
  1811					#size-cells = <2>;
  1812					ranges;
  1813	
  1814					interrupt-controller;
  1815					#interrupt-cells = <1>;
  1816	
  1817					interrupt-map-mask = <0 0 0 7>;
  1818					interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
  1819							<0 0 0 2 &port00 0 0 0 1>,
  1820							<0 0 0 3 &port00 0 0 0 2>,
  1821							<0 0 0 4 &port00 0 0 0 3>;
  1822				};
  1823	
  1824				port01: pci@1,0 {
  1825					device_type = "pci";
  1826					reg = <0x800 0x0 0x0 0x0 0x0>;
  1827					reset-gpios = <&pinctrl_ap 167 GPIO_ACTIVE_LOW>;
  1828	
  1829					#address-cells = <3>;
  1830					#size-cells = <2>;
  1831					ranges;
  1832	
  1833					interrupt-controller;
  1834					#interrupt-cells = <1>;
  1835	
  1836					interrupt-map-mask = <0 0 0 7>;
  1837					interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
  1838							<0 0 0 2 &port01 0 0 0 1>,
  1839							<0 0 0 3 &port01 0 0 0 2>,
  1840							<0 0 0 4 &port01 0 0 0 3>;
  1841	
  1842					status = "disabled";
  1843				};
  1844	
  1845				port02: pci@2,0 {
  1846					device_type = "pci";
  1847					reg = <0x1000 0x0 0x0 0x0 0x0>;
  1848					reset-gpios = <&pinctrl_ap 168 GPIO_ACTIVE_LOW>;
  1849	
  1850					#address-cells = <3>;
  1851					#size-cells = <2>;
  1852					ranges;
  1853	
  1854					interrupt-controller;
  1855					#interrupt-cells = <1>;
  1856	
  1857					interrupt-map-mask = <0 0 0 7>;
  1858					interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
  1859							<0 0 0 2 &port02 0 0 0 1>,
  1860							<0 0 0 3 &port02 0 0 0 2>,
  1861							<0 0 0 4 &port02 0 0 0 3>;
  1862	
  1863					status = "disabled";
  1864				};
  1865	
  1866				/* TODO: GPIO unknown */
  1867				port03: pci@3,0 {
  1868					device_type = "pci";
  1869					reg = <0x1800 0x0 0x0 0x0 0x0>;
  1870					//reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
  1871	
  1872					#address-cells = <3>;
  1873					#size-cells = <2>;
  1874					ranges;
  1875	
  1876					interrupt-controller;
  1877					#interrupt-cells = <1>;
  1878	
  1879					interrupt-map-mask = <0 0 0 7>;
  1880					interrupt-map = <0 0 0 1 &port03 0 0 0 0>,
  1881							<0 0 0 2 &port03 0 0 0 1>,
  1882							<0 0 0 3 &port03 0 0 0 2>,
  1883							<0 0 0 4 &port03 0 0 0 3>;
  1884	
  1885					status = "disabled";
  1886				};
  1887			};
  1888		};
  1889	};
  1890	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
