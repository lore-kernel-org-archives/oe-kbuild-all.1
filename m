Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7E015F3E8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718985377; cv=none; b=px/qUlrGLFkEHixuRa9vQQ6m29vpByjvDUjHqcO18qbPiQ7m27c7pBkS9j6zLhg3MnUD25kAPTORMrSaSHBWEiDKjR7VTSQCQZtHc2FDEnPOkLNJUUcciQe5G/UMntkrdX2nTemXZ9yaMk9fcpEZ9sQaZxyb865lrm2L00+tC+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718985377; c=relaxed/simple;
	bh=aLUNk4PYclsX6Vkb2xd3f/dtdpAQ5+6/MxtjxlO8lb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tnnr5JCcykfHPeDxOhB593XnclwrLBNrpaLjOLiU/+qHgySG0sZ8z8Gcz7/BsjpLELCkQyF43Sj7FBiWN5nTjbQ10YbHDOwLeinD9AobiVALYdLQliqH60PHwDL3oXfoKM+I8jQU/XOPyq+UFD3Ld22Ez39BhE9EYH8QGYH/7iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1FGdGqL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1FGdGqL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718985373; x=1750521373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aLUNk4PYclsX6Vkb2xd3f/dtdpAQ5+6/MxtjxlO8lb8=;
  b=M1FGdGqLcgMwN2mflun7zOvFbRZE6fz+sNc8pkdD3k7/XTbd4zRBh0yV
   007KuNQ7nxFWlrG11zTRaPYXZzuHNVihReoa1xQBERp+qKlMQUclBjlYG
   QKPadib+tF8/JgrQkm0+Oy+EH6XtV2xeEinmz37SHjwZKoTH6jalpMK3+
   A7J/vbblpjaloVK4aXiXashrYP5UV0Fud4AWjpsi/Cich2/i8V7Mg0uhC
   BlBHILui31ylL4VWDrXPq8sNNGAEyyAKyrYvvRBh5c4QWWhh2qIH+gxlm
   XB71wt8HuMr84/OG3AKTeMh200nu7E0OnlCOBqCbiRBxYxFdGQafpb4XN
   w==;
X-CSE-ConnectionGUID: GeTbm6pOT1Khi9VPa2B6mQ==
X-CSE-MsgGUID: 71/4G8+RTEqlc5jZOj05Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16169982"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="16169982"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 08:56:12 -0700
X-CSE-ConnectionGUID: p+ibhthpQIyZwfLrcxXF8g==
X-CSE-MsgGUID: HCdFVFOiSXWTiaTqea+ODA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="46987959"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jun 2024 08:56:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKgcS-0008io-2Z;
	Fri, 21 Jun 2024 15:56:08 +0000
Date: Fri, 21 Jun 2024 23:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 175/184]
 arch/arm64/boot/dts/apple/t8103.dtsi:632.10-641.6: Warning
 (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child
 node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202406212329.5jakD8J1-lkp@intel.com>
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
commit: bead1a28877d30573ab88e5d60bda08f89b7618a [175/184] arm64: apple: t8103: Add SIO, DPA nodes; hook up to DCP
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240621/202406212329.5jakD8J1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406212329.5jakD8J1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406212329.5jakD8J1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j313.dts:146.14-155.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:157.14-166.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:644.30-650.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1122.43-1125.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103.dtsi:632.10-641.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103.dtsi:909.10-918.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:930.10-939.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103.dtsi:1341.10-1350.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j293.dts:212.14-222.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:224.14-233.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:644.30-650.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1122.43-1125.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103.dtsi:632.10-641.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103.dtsi:909.10-918.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:930.10-939.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103.dtsi:1341.10-1350.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103.dtsi:447.34-450.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j274.dts:114.14-123.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:125.14-134.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:644.30-650.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1122.43-1125.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103.dtsi:632.10-641.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103.dtsi:909.10-918.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:930.10-939.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103.dtsi:1341.10-1350.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j457.dts:95.14-104.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:644.30-650.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1122.43-1125.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103.dtsi:632.10-641.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103.dtsi:909.10-918.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:930.10-939.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103.dtsi:1341.10-1350.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j456.dts:122.14-131.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:644.30-650.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1122.43-1125.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
>> arch/arm64/boot/dts/apple/t8103.dtsi:632.10-641.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103.dtsi:909.10-918.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:930.10-939.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103.dtsi:1341.10-1350.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +632 arch/arm64/boot/dts/apple/t8103.dtsi

    16	
    17	/ {
    18		compatible = "apple,t8103", "apple,arm-platform";
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
   197				opp-microwatt = <47296>;
   198			};
   199			opp02 {
   200				opp-hz = /bits/ 64 <972000000>;
   201				opp-level = <2>;
   202				clock-latency-ns = <22000>;
   203				opp-microwatt = <99715>;
   204			};
   205			opp03 {
   206				opp-hz = /bits/ 64 <1332000000>;
   207				opp-level = <3>;
   208				clock-latency-ns = <27000>;
   209				opp-microwatt = <188860>;
   210			};
   211			opp04 {
   212				opp-hz = /bits/ 64 <1704000000>;
   213				opp-level = <4>;
   214				clock-latency-ns = <33000>;
   215				opp-microwatt = <288891>;
   216			};
   217			opp05 {
   218				opp-hz = /bits/ 64 <2064000000>;
   219				opp-level = <5>;
   220				clock-latency-ns = <50000>;
   221				opp-microwatt = <412979>;
   222			};
   223		};
   224	
   225		pcluster_opp: opp-table-1 {
   226			compatible = "operating-points-v2";
   227	
   228			opp01 {
   229				opp-hz = /bits/ 64 <600000000>;
   230				opp-level = <1>;
   231				clock-latency-ns = <8000>;
   232				opp-microwatt = <290230>;
   233			};
   234			opp02 {
   235				opp-hz = /bits/ 64 <828000000>;
   236				opp-level = <2>;
   237				clock-latency-ns = <19000>;
   238				opp-microwatt = <449013>;
   239			};
   240			opp03 {
   241				opp-hz = /bits/ 64 <1056000000>;
   242				opp-level = <3>;
   243				clock-latency-ns = <21000>;
   244				opp-microwatt = <647097>;
   245			};
   246			opp04 {
   247				opp-hz = /bits/ 64 <1284000000>;
   248				opp-level = <4>;
   249				clock-latency-ns = <23000>;
   250				opp-microwatt = <865620>;
   251			};
   252			opp05 {
   253				opp-hz = /bits/ 64 <1500000000>;
   254				opp-level = <5>;
   255				clock-latency-ns = <24000>;
   256				opp-microwatt = <1112838>;
   257			};
   258			opp06 {
   259				opp-hz = /bits/ 64 <1728000000>;
   260				opp-level = <6>;
   261				clock-latency-ns = <29000>;
   262				opp-microwatt = <1453271>;
   263			};
   264			opp07 {
   265				opp-hz = /bits/ 64 <1956000000>;
   266				opp-level = <7>;
   267				clock-latency-ns = <31000>;
   268				opp-microwatt = <1776667>;
   269			};
   270			opp08 {
   271				opp-hz = /bits/ 64 <2184000000>;
   272				opp-level = <8>;
   273				clock-latency-ns = <34000>;
   274				opp-microwatt = <2366690>;
   275			};
   276			opp09 {
   277				opp-hz = /bits/ 64 <2388000000>;
   278				opp-level = <9>;
   279				clock-latency-ns = <36000>;
   280				opp-microwatt = <2892193>;
   281			};
   282			opp10 {
   283				opp-hz = /bits/ 64 <2592000000>;
   284				opp-level = <10>;
   285				clock-latency-ns = <51000>;
   286				opp-microwatt = <3475417>;
   287			};
   288			opp11 {
   289				opp-hz = /bits/ 64 <2772000000>;
   290				opp-level = <11>;
   291				clock-latency-ns = <54000>;
   292				opp-microwatt = <3959410>;
   293			};
   294			opp12 {
   295				opp-hz = /bits/ 64 <2988000000>;
   296				opp-level = <12>;
   297				clock-latency-ns = <55000>;
   298				opp-microwatt = <4540620>;
   299			};
   300			/* Not available until CPU deep sleep is implemented */
   301			opp13 {
   302				opp-hz = /bits/ 64 <3096000000>;
   303				opp-level = <13>;
   304				clock-latency-ns = <55000>;
   305				opp-microwatt = <4745031>;
   306				turbo-mode;
   307			};
   308			opp14 {
   309				opp-hz = /bits/ 64 <3144000000>;
   310				opp-level = <14>;
   311				clock-latency-ns = <56000>;
   312				opp-microwatt = <4822390>;
   313				turbo-mode;
   314			};
   315			opp15 {
   316				opp-hz = /bits/ 64 <3204000000>;
   317				opp-level = <15>;
   318				clock-latency-ns = <56000>;
   319				opp-microwatt = <4951324>;
   320				turbo-mode;
   321			};
   322		};
   323	
   324		gpu_opp: opp-table-gpu {
   325			compatible = "operating-points-v2";
   326	
   327			/*
   328			 * NOTE: The voltage and power values are device-specific and
   329			 * must be filled in by the bootloader.
   330			 */
   331			opp00 {
   332				opp-hz = /bits/ 64 <0>;
   333				opp-microvolt = <400000>;
   334				opp-microwatt = <0>;
   335			};
   336			opp01 {
   337				opp-hz = /bits/ 64 <396000000>;
   338				opp-microvolt = <603000>;
   339				opp-microwatt = <3714690>;
   340			};
   341			opp02 {
   342				opp-hz = /bits/ 64 <528000000>;
   343				opp-microvolt = <640000>;
   344				opp-microwatt = <5083260>;
   345			};
   346			opp03 {
   347				opp-hz = /bits/ 64 <720000000>;
   348				opp-microvolt = <690000>;
   349				opp-microwatt = <7429380>;
   350			};
   351			opp04 {
   352				opp-hz = /bits/ 64 <924000000>;
   353				opp-microvolt = <784000>;
   354				opp-microwatt = <11730600>;
   355			};
   356			opp05 {
   357				opp-hz = /bits/ 64 <1128000000>;
   358				opp-microvolt = <862000>;
   359				opp-microwatt = <17009370>;
   360			};
   361			opp06 {
   362				opp-hz = /bits/ 64 <1278000000>;
   363				opp-microvolt = <931000>;
   364				opp-microwatt = <19551000>;
   365			};
   366		};
   367	
   368		timer {
   369			compatible = "arm,armv8-timer";
   370			interrupt-parent = <&aic>;
   371			interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
   372			interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
   373				     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
   374				     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
   375				     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
   376		};
   377	
   378		pmu-e {
   379			compatible = "apple,icestorm-pmu";
   380			interrupt-parent = <&aic>;
   381			interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
   382		};
   383	
   384		pmu-p {
   385			compatible = "apple,firestorm-pmu";
   386			interrupt-parent = <&aic>;
   387			interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
   388		};
   389	
   390		clkref: clock-ref {
   391			compatible = "fixed-clock";
   392			#clock-cells = <0>;
   393			clock-frequency = <24000000>;
   394			clock-output-names = "clkref";
   395		};
   396	
   397		clk_120m: clock-120m {
   398			compatible = "fixed-clock";
   399			#clock-cells = <0>;
   400			clock-frequency = <120000000>;
   401			clock-output-names = "clk_120m";
   402		};
   403	
   404		clk_200m: clock-200m {
   405			compatible = "fixed-clock";
   406			#clock-cells = <0>;
   407			clock-frequency = <200000000>;
   408			clock-output-names = "clk_200m";
   409		};
   410	
   411		/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
   412		clk_disp0: clock-disp0 {
   413			compatible = "fixed-clock";
   414			#clock-cells = <0>;
   415			clock-frequency = <533333328>;
   416			clock-output-names = "clk_disp0";
   417		};
   418	
   419		/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
   420		clk_dispext0: clock-dispext0 {
   421			compatible = "fixed-clock";
   422			#clock-cells = <0>;
   423			clock-frequency = <0>;
   424			clock-output-names = "clk_dispext0";
   425		};
   426	
   427		/*
   428		 * This is a fabulated representation of the input clock
   429		 * to NCO since we don't know the true clock tree.
   430		 */
   431		nco_clkref: clock-ref-nco {
   432			compatible = "fixed-clock";
   433			#clock-cells = <0>;
   434			clock-output-names = "nco_ref";
   435		};
   436	
   437		reserved-memory {
   438			#address-cells = <2>;
   439			#size-cells = <2>;
   440			ranges;
   441	
   442			uat_handoff: uat-handoff {
   443				reg = <0 0 0 0>;
   444				no-map;
   445			};
   446	
   447			uat_pagetables: uat-pagetables {
   448				reg = <0 0 0 0>;
   449				no-map;
   450			};
   451	
   452			uat_ttbs: uat-ttbs {
   453				reg = <0 0 0 0>;
   454				no-map;
   455			};
   456		};
   457	
   458		soc {
   459			compatible = "simple-bus";
   460			#address-cells = <2>;
   461			#size-cells = <2>;
   462	
   463			ranges;
   464			nonposted-mmio;
   465			/* Required to get >32-bit DMA via DARTs */
   466			dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
   467	
   468			gpu: gpu@206400000 {
   469				compatible = "apple,agx-t8103", "apple,agx-g13g";
   470				reg = <0x2 0x6400000 0 0x40000>,
   471					<0x2 0x4000000 0 0x1000000>;
   472				reg-names = "asc", "sgx";
   473				interrupt-parent = <&aic>;
   474				interrupts = <AIC_IRQ 563 IRQ_TYPE_LEVEL_HIGH>,
   475					<AIC_IRQ 564 IRQ_TYPE_LEVEL_HIGH>,
   476					<AIC_IRQ 565 IRQ_TYPE_LEVEL_HIGH>,
   477					<AIC_IRQ 566 IRQ_TYPE_LEVEL_HIGH>,
   478					<AIC_IRQ 579 IRQ_TYPE_LEVEL_HIGH>;
   479				mboxes = <&agx_mbox>;
   480				power-domains = <&ps_gfx>;
   481				memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>;
   482				memory-region-names = "ttbs", "pagetables", "handoff";
   483	
   484				apple,firmware-version = <12 3 0>;
   485				apple,firmware-compat = <12 3 0>;
   486	
   487				operating-points-v2 = <&gpu_opp>;
   488				apple,perf-base-pstate = <1>;
   489				apple,min-sram-microvolt = <850000>;
   490				apple,avg-power-filter-tc-ms = <1000>;
   491				apple,avg-power-ki-only = <7.5>;
   492				apple,avg-power-kp = <4.0>;
   493				apple,avg-power-min-duty-cycle = <40>;
   494				apple,avg-power-target-filter-tc = <125>;
   495				apple,fast-die0-integral-gain = <200.0>;
   496				apple,fast-die0-proportional-gain = <5.0>;
   497				apple,perf-filter-drop-threshold = <0>;
   498				apple,perf-filter-time-constant = <5>;
   499				apple,perf-filter-time-constant2 = <50>;
   500				apple,perf-integral-gain2 = <0.197392>;
   501				apple,perf-integral-min-clamp = <0>;
   502				apple,perf-proportional-gain2 = <6.853981>;
   503				apple,perf-tgt-utilization = <85>;
   504				apple,power-sample-period = <8>;
   505				apple,power-zones = <30000 100 6875>;
   506				apple,ppm-filter-time-constant-ms = <100>;
   507				apple,ppm-ki = <91.5>;
   508				apple,ppm-kp = <6.9>;
   509				apple,pwr-filter-time-constant = <313>;
   510				apple,pwr-integral-gain = <0.0202129>;
   511				apple,pwr-integral-min-clamp = <0>;
   512				apple,pwr-min-duty-cycle = <40>;
   513				apple,pwr-proportional-gain = <5.2831855>;
   514	
   515				apple,core-leak-coef = <1000.0>;
   516				apple,sram-leak-coef = <45.0>;
   517			};
   518	
   519			agx_mbox: mbox@206408000 {
   520				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
   521				reg = <0x2 0x6408000 0x0 0x4000>;
   522				interrupt-parent = <&aic>;
   523				interrupts = <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
   524					<AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
   525					<AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
   526					<AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
   527				interrupt-names = "send-empty", "send-not-empty",
   528					"recv-empty", "recv-not-empty";
   529				#mbox-cells = <0>;
   530			};
   531	
   532			cpufreq_e: performance-controller@210e20000 {
   533				compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
   534				reg = <0x2 0x10e20000 0 0x1000>;
   535				#performance-domain-cells = <0>;
   536			};
   537	
   538			cpufreq_p: performance-controller@211e20000 {
   539				compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
   540				reg = <0x2 0x11e20000 0 0x1000>;
   541				#performance-domain-cells = <0>;
   542			};
   543	
   544			display_dfr: display-pipe@228200000 {
   545				compatible = "apple,t8103-display-pipe", "apple,h7-display-pipe";
   546				reg-names = "be", "fe", "mipi";
   547				reg = <0x2 0x28200000 0x0 0xc000>,
   548					<0x2 0x28400000 0x0 0x4000>,
   549					<0x2 0x28600000 0x0 0x100000>;
   550				power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>, <&ps_mipi_dsi>;
   551				interrupt-parent = <&aic>;
   552				interrupts = <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
   553					<AIC_IRQ 506 IRQ_TYPE_LEVEL_HIGH>;
   554				interrupt-names = "be", "fe";
   555				status = "disabled";
   556				iommus = <&displaydfr_dart 0>;
   557				#address-cells = <1>;
   558				#size-cells = <0>;
   559			};
   560	
   561			displaydfr_dart: iommu@228304000 {
   562				compatible = "apple,t8103-dart";
   563				reg = <0x2 0x28304000 0x0 0x4000>;
   564				interrupt-parent = <&aic>;
   565				interrupts = <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>;
   566				#iommu-cells = <1>;
   567				power-domains = <&ps_dispdfr_fe>;
   568			};
   569	
   570			disp0_dart: iommu@231304000 {
   571				compatible = "apple,t8103-dart";
   572				reg = <0x2 0x31304000 0x0 0x4000>;
   573				#iommu-cells = <1>;
   574				interrupt-parent = <&aic>;
   575				interrupts = <AIC_IRQ 445 IRQ_TYPE_LEVEL_HIGH>;
   576				power-domains = <&ps_disp0_cpu0>;
   577				apple,dma-range = <0x0 0x0 0x0 0xfc000000>;
   578				status = "disabled";
   579			};
   580	
   581			dcp_dart: iommu@23130c000 {
   582				compatible = "apple,t8103-dart";
   583				reg = <0x2 0x3130c000 0x0 0x4000>;
   584				#iommu-cells = <1>;
   585				interrupt-parent = <&aic>;
   586				interrupts = <AIC_IRQ 445 IRQ_TYPE_LEVEL_HIGH>;
   587				apple,dma-range = <0xf 0x00000000 0x0 0xfc000000>;
   588				power-domains = <&ps_disp0_cpu0>;
   589			};
   590	
   591			dcp_mbox: mbox@231c08000 {
   592				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
   593				reg = <0x2 0x31c08000 0x0 0x4000>;
   594				interrupt-parent = <&aic>;
   595				interrupts = <AIC_IRQ 427 IRQ_TYPE_LEVEL_HIGH>,
   596					<AIC_IRQ 428 IRQ_TYPE_LEVEL_HIGH>,
   597					<AIC_IRQ 429 IRQ_TYPE_LEVEL_HIGH>,
   598					<AIC_IRQ 430 IRQ_TYPE_LEVEL_HIGH>;
   599				interrupt-names = "send-empty", "send-not-empty",
   600					"recv-empty", "recv-not-empty";
   601				#mbox-cells = <0>;
   602				power-domains = <&ps_disp0_cpu0>;
   603				resets = <&ps_disp0_cpu0>;
   604			};
   605	
   606			dcp: dcp@231c00000 {
   607				compatible = "apple,t8103-dcp", "apple,dcp";
   608				mboxes = <&dcp_mbox>;
   609				mbox-names = "mbox";
   610				iommus = <&dcp_dart 0>;
   611	
   612				reg-names = "coproc", "disp-0", "disp-1", "disp-2",
   613					"disp-3", "disp-4";
   614				reg = <0x2 0x31c00000 0x0 0x4000>,
   615					<0x2 0x30000000 0x0 0x3e8000>,
   616					<0x2 0x31320000 0x0 0x4000>,
   617					<0x2 0x31344000 0x0 0x4000>,
   618					<0x2 0x31800000 0x0 0x800000>,
   619					<0x2 0x3b3d0000 0x0 0x4000>;
   620				apple,bw-scratch = <&pmgr_dcp 0 5 0x14>;
   621				apple,bw-doorbell = <&pmgr_dcp 1 6>;
   622				power-domains = <&ps_disp0_cpu0>;
   623				resets = <&ps_disp0_cpu0>;
   624				clocks = <&clk_disp0>;
   625				phandle = <&dcp>;
   626	
   627				disp0_piodma: piodma {
   628					iommus = <&disp0_dart 4>;
   629					phandle = <&disp0_piodma>;
   630				};
   631	
 > 632				ports {
   633					#address-cells = <1>;
   634					#size-cells = <0>;
   635					port@0 {
   636						reg = <0>;
   637						dcp_audio: endpoint {
   638							remote-endpoint = <&dpaudio0_dcp>;
   639						};
   640					};
   641				};
   642			};
   643	
 > 644			display: display-subsystem {
   645				compatible = "apple,display-subsystem";
   646				/* disp_dart0 must be 1st since it is locked */
   647				iommus = <&disp0_dart 0>;
   648				/* generate phandle explicitly for use in loader */
   649				phandle = <&display>;
   650			};
   651	
   652			isp_dart0: iommu@22c0e8000 {
   653				compatible = "apple,t8103-dart";
   654				reg = <0x2 0x2c0e8000 0x0 0x4000>;
   655				#iommu-cells = <1>;
   656				interrupt-parent = <&aic>;
   657				interrupts = <AIC_IRQ 251 IRQ_TYPE_LEVEL_HIGH>;
   658				power-domains = <&ps_isp_sys>;
   659	
   660				status = "disabled";
   661			};
   662	
   663			isp_dart1: iommu@22c0f4000 {
   664				compatible = "apple,t8103-dart";
   665				reg = <0x2 0x2c0f4000 0x0 0x4000>;
   666				#iommu-cells = <1>;
   667				interrupt-parent = <&aic>;
   668				interrupts = <AIC_IRQ 251 IRQ_TYPE_LEVEL_HIGH>;
   669				power-domains = <&ps_isp_sys>;
   670	
   671				status = "disabled";
   672			};
   673	
   674			isp_dart2: iommu@22c0fc000 {
   675				compatible = "apple,t8103-dart";
   676				reg = <0x2 0x2c0fc000 0x0 0x4000>;
   677				#iommu-cells = <1>;
   678				interrupt-parent = <&aic>;
   679				interrupts = <AIC_IRQ 251 IRQ_TYPE_LEVEL_HIGH>;
   680				power-domains = <&ps_isp_sys>;
   681	
   682				status = "disabled";
   683			};
   684	
   685			isp: isp@22a000000 {
   686				compatible = "apple,t8103-isp", "apple,isp";
   687				iommus = <&isp_dart0 0>, <&isp_dart1 0>, <&isp_dart2 0>;
   688				reg-names = "coproc", "mbox", "gpio", "mbox2";
   689				reg = <0x2 0x2a000000 0x0 0x2000000>,
   690					<0x2 0x2c104000 0x0 0x100>,
   691					<0x2 0x2c104170 0x0 0x100>,
   692					<0x2 0x2c1043f0 0x0 0x100>;
   693				interrupt-parent = <&aic>;
   694				interrupts = <AIC_IRQ 246 IRQ_TYPE_LEVEL_HIGH>;
   695				power-domains = <&ps_isp_sys>, <&ps_isp_set0>,
   696					<&ps_isp_set1>, <&ps_isp_set2>, <&ps_isp_fe>,
   697					<&ps_isp_set4>, <&ps_isp_set5>, <&ps_isp_set6>,
   698					<&ps_isp_set7>, <&ps_isp_set8>, <&ps_isp_set9>,
   699					<&ps_isp_set10>, <&ps_isp_set11>,
   700					<&ps_isp_set12>;
   701	
   702				apple,dart-vm-size = <0x0 0xa0000000>;
   703	
   704				status = "disabled";
   705			};
   706	
   707			sio_dart: iommu@235004000 {
   708				compatible = "apple,t8103-dart";
   709				reg = <0x2 0x35004000 0x0 0x4000>;
   710				interrupt-parent = <&aic>;
   711				interrupts = <AIC_IRQ 635 IRQ_TYPE_LEVEL_HIGH>;
   712				#iommu-cells = <1>;
   713				power-domains = <&ps_sio_cpu>;
   714			};
   715	
   716			i2c0: i2c@235010000 {
   717				compatible = "apple,t8103-i2c", "apple,i2c";
   718				reg = <0x2 0x35010000 0x0 0x4000>;
   719				clocks = <&clkref>;
   720				interrupt-parent = <&aic>;
   721				interrupts = <AIC_IRQ 627 IRQ_TYPE_LEVEL_HIGH>;
   722				pinctrl-0 = <&i2c0_pins>;
   723				pinctrl-names = "default";
   724				#address-cells = <0x1>;
   725				#size-cells = <0x0>;
   726				power-domains = <&ps_i2c0>;
   727			};
   728	
   729			i2c1: i2c@235014000 {
   730				compatible = "apple,t8103-i2c", "apple,i2c";
   731				reg = <0x2 0x35014000 0x0 0x4000>;
   732				clocks = <&clkref>;
   733				interrupt-parent = <&aic>;
   734				interrupts = <AIC_IRQ 628 IRQ_TYPE_LEVEL_HIGH>;
   735				pinctrl-0 = <&i2c1_pins>;
   736				pinctrl-names = "default";
   737				#address-cells = <0x1>;
   738				#size-cells = <0x0>;
   739				power-domains = <&ps_i2c1>;
   740			};
   741	
   742			i2c2: i2c@235018000 {
   743				compatible = "apple,t8103-i2c", "apple,i2c";
   744				reg = <0x2 0x35018000 0x0 0x4000>;
   745				clocks = <&clkref>;
   746				interrupt-parent = <&aic>;
   747				interrupts = <AIC_IRQ 629 IRQ_TYPE_LEVEL_HIGH>;
   748				pinctrl-0 = <&i2c2_pins>;
   749				pinctrl-names = "default";
   750				#address-cells = <0x1>;
   751				#size-cells = <0x0>;
   752				status = "disabled"; /* not used in all devices */
   753				power-domains = <&ps_i2c2>;
   754			};
   755	
   756			i2c3: i2c@23501c000 {
   757				compatible = "apple,t8103-i2c", "apple,i2c";
   758				reg = <0x2 0x3501c000 0x0 0x4000>;
   759				clocks = <&clkref>;
   760				interrupt-parent = <&aic>;
   761				interrupts = <AIC_IRQ 630 IRQ_TYPE_LEVEL_HIGH>;
   762				pinctrl-0 = <&i2c3_pins>;
   763				pinctrl-names = "default";
   764				#address-cells = <0x1>;
   765				#size-cells = <0x0>;
   766				power-domains = <&ps_i2c3>;
   767			};
   768	
   769			i2c4: i2c@235020000 {
   770				compatible = "apple,t8103-i2c", "apple,i2c";
   771				reg = <0x2 0x35020000 0x0 0x4000>;
   772				clocks = <&clkref>;
   773				interrupt-parent = <&aic>;
   774				interrupts = <AIC_IRQ 631 IRQ_TYPE_LEVEL_HIGH>;
   775				pinctrl-0 = <&i2c4_pins>;
   776				pinctrl-names = "default";
   777				#address-cells = <0x1>;
   778				#size-cells = <0x0>;
   779				power-domains = <&ps_i2c4>;
   780				status = "disabled"; /* only used in J293 */
   781			};
   782	
   783			fpwm1: pwm@235044000 {
   784				compatible = "apple,t8103-fpwm", "apple,s5l-fpwm";
   785				reg = <0x2 0x35044000 0x0 0x4000>;
   786				power-domains = <&ps_fpwm1>;
   787				clocks = <&clkref>;
   788				#pwm-cells = <2>;
   789				status = "disabled";
   790			};
   791	
   792			spi0: spi@235100000 {
   793				compatible = "apple,t8103-spi", "apple,spi";
   794				reg = <0x2 0x35100000 0x0 0x4000>;
   795				interrupt-parent = <&aic>;
   796				interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>;
   797				clocks = <&clk_200m>;
   798				power-domains = <&ps_spi0>;
   799				#address-cells = <1>;
   800				#size-cells = <0>;
   801				status = "disabled"; /* only used in J293 */
   802			};
   803	
   804			spi1: spi@235104000 {
   805				compatible = "apple,t8103-spi", "apple,spi";
   806				reg = <0x2 0x35104000 0x0 0x4000>;
   807				interrupt-parent = <&aic>;
   808				interrupts = <AIC_IRQ 615 IRQ_TYPE_LEVEL_HIGH>;
   809				clocks = <&clk_200m>;
   810				pinctrl-0 = <&spi1_pins>;
   811				pinctrl-names = "default";
   812				power-domains = <&ps_spi1>;
   813				#address-cells = <1>;
   814				#size-cells = <0>;
   815				status = "disabled";
   816			};
   817	
   818			spi3: spi@23510c000 {
   819				compatible = "apple,t8103-spi", "apple,spi";
   820				reg = <0x2 0x3510c000 0x0 0x4000>;
   821				interrupt-parent = <&aic>;
   822				interrupts = <AIC_IRQ 617 IRQ_TYPE_LEVEL_HIGH>;
   823				clocks = <&clk_120m>;
   824				pinctrl-0 = <&spi3_pins>;
   825				pinctrl-names = "default";
   826				power-domains = <&ps_spi3>;
   827				#address-cells = <1>;
   828				#size-cells = <0>;
   829				status = "disabled"; /* only used in J293/J313 */
   830			};
   831	
   832			serial0: serial@235200000 {
   833				compatible = "apple,s5l-uart";
   834				reg = <0x2 0x35200000 0x0 0x1000>;
   835				reg-io-width = <4>;
   836				interrupt-parent = <&aic>;
   837				interrupts = <AIC_IRQ 605 IRQ_TYPE_LEVEL_HIGH>;
   838				/*
   839				 * TODO: figure out the clocking properly, there may
   840				 * be a third selectable clock.
   841				 */
   842				clocks = <&clkref>, <&clkref>;
   843				clock-names = "uart", "clk_uart_baud0";
   844				power-domains = <&ps_uart0>;
   845				status = "disabled";
   846			};
   847	
   848			serial2: serial@235208000 {
   849				compatible = "apple,s5l-uart";
   850				reg = <0x2 0x35208000 0x0 0x1000>;
   851				reg-io-width = <4>;
   852				interrupt-parent = <&aic>;
   853				interrupts = <AIC_IRQ 607 IRQ_TYPE_LEVEL_HIGH>;
   854				clocks = <&clkref>, <&clkref>;
   855				clock-names = "uart", "clk_uart_baud0";
   856				power-domains = <&ps_uart2>;
   857				status = "disabled";
   858			};
   859	
   860			sio_mbox: mbox@236408000 {
   861				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
   862				reg = <0x2 0x36408000 0x0 0x4000>;
   863				interrupt-parent = <&aic>;
   864				interrupts = <AIC_IRQ 640 IRQ_TYPE_LEVEL_HIGH>,
   865					<AIC_IRQ 641 IRQ_TYPE_LEVEL_HIGH>,
   866					<AIC_IRQ 642 IRQ_TYPE_LEVEL_HIGH>,
   867					<AIC_IRQ 643 IRQ_TYPE_LEVEL_HIGH>;
   868				interrupt-names = "send-empty", "send-not-empty",
   869					"recv-empty", "recv-not-empty";
   870				#mbox-cells = <0>;
   871				power-domains = <&ps_sio>;
   872			};
   873	
   874			sio: sio@236400000 {
   875				compatible = "apple,t8103-sio", "apple,sio";
   876				reg = <0x2 0x36400000 0x0 0x8000>;
   877				dma-channels = <128>;
   878				#dma-cells = <1>;
   879				mboxes = <&sio_mbox>;
   880				iommus = <&sio_dart 0>;
   881				power-domains = <&ps_sio_cpu>;
   882				resets = <&ps_sio>; /* TODO: verify reset does something */
   883				status = "disabled";
   884			};
   885	
   886			admac: dma-controller@238200000 {
   887				compatible = "apple,t8103-admac", "apple,admac";
   888				reg = <0x2 0x38200000 0x0 0x34000>;
   889				dma-channels = <24>;
   890				interrupts-extended = <0>,
   891						      <&aic AIC_IRQ 626 IRQ_TYPE_LEVEL_HIGH>,
   892						      <0>,
   893						      <0>;
   894				#dma-cells = <1>;
   895				iommus = <&sio_dart 2>;
   896				power-domains = <&ps_sio_adma>;
   897				resets = <&ps_audio_p>;
   898			};
   899	
   900			dpaudio0: audio-controller@238330000 {
   901				compatible = "apple,t8103-dpaudio", "apple,dpaudio";
   902				reg = <0x2 0x38330000 0x0 0x4000>;
   903				dmas = <&sio 0x64>;
   904				dma-names = "tx";
   905				power-domains = <&ps_dpa0>;
   906				reset-domains = <&ps_dpa0>;
   907				status = "disabled";
   908	
   909				ports {
   910					#address-cells = <1>;
   911					#size-cells = <0>;
   912					port@0 {
   913						reg = <0>;
   914						dpaudio0_dcp: endpoint {
   915							remote-endpoint = <&dcp_audio>;
   916						};
   917					};
   918				};
   919			};
   920	
   921			dpaudio1: audio-controller@238334000 {
   922				compatible = "apple,t8103-dpaudio", "apple,dpaudio";
   923				reg = <0x2 0x38334000 0x0 0x4000>;
   924				dmas = <&sio 0x66>;
   925				dma-names = "tx";
   926				power-domains = <&ps_dpa1>;
   927				reset-domains = <&ps_dpa1>;
   928				status = "disabled";
   929	
   930				ports {
   931					#address-cells = <1>;
   932					#size-cells = <0>;
   933					port@0 {
   934						reg = <0>;
   935						dpaudio1_dcp: endpoint {
   936							remote-endpoint = <&dcpext_audio>;
   937						};
   938					};
   939				};
   940			};
   941	
   942			mca: i2s@238400000 {
   943				compatible = "apple,t8103-mca", "apple,mca";
   944				reg = <0x2 0x38400000 0x0 0x18000>,
   945				      <0x2 0x38300000 0x0 0x30000>;
   946	
   947				interrupt-parent = <&aic>;
   948				interrupts = <AIC_IRQ 619 IRQ_TYPE_LEVEL_HIGH>,
   949					     <AIC_IRQ 620 IRQ_TYPE_LEVEL_HIGH>,
   950					     <AIC_IRQ 621 IRQ_TYPE_LEVEL_HIGH>,
   951					     <AIC_IRQ 622 IRQ_TYPE_LEVEL_HIGH>,
   952					     <AIC_IRQ 623 IRQ_TYPE_LEVEL_HIGH>,
   953					     <AIC_IRQ 624 IRQ_TYPE_LEVEL_HIGH>;
   954	
   955				resets = <&ps_audio_p>;
   956				clocks = <&nco 0>, <&nco 1>, <&nco 2>,
   957					 <&nco 3>, <&nco 4>, <&nco 4>;
   958				power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
   959						<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
   960				dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
   961				       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
   962				       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
   963				       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
   964				       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
   965				       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
   966				dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
   967					"tx1a", "rx1a", "tx1b", "rx1b",
   968					"tx2a", "rx2a", "tx2b", "rx2b",
   969					"tx3a", "rx3a", "tx3b", "rx3b",
   970					"tx4a", "rx4a", "tx4b", "rx4b",
   971					"tx5a", "rx5a", "tx5b", "rx5b";
   972	
   973				#sound-dai-cells = <1>;
   974			};
   975	
   976			nco: clock-controller@23b044000 {
   977				compatible = "apple,t8103-nco", "apple,nco";
   978				reg = <0x2 0x3b044000 0x0 0x14000>;
   979				clocks = <&nco_clkref>;
   980				#clock-cells = <1>;
   981			};
   982	
   983			aic: interrupt-controller@23b100000 {
   984				compatible = "apple,t8103-aic", "apple,aic";
   985				#interrupt-cells = <3>;
   986				interrupt-controller;
   987				reg = <0x2 0x3b100000 0x0 0x8000>;
   988				power-domains = <&ps_aic>;
   989	
   990				affinities {
   991					e-core-pmu-affinity {
   992						apple,fiq-index = <AIC_CPU_PMU_E>;
   993						cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
   994					};
   995	
   996					p-core-pmu-affinity {
   997						apple,fiq-index = <AIC_CPU_PMU_P>;
   998						cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
   999					};
  1000				};
  1001			};
  1002	
  1003			pmgr: power-management@23b700000 {
  1004				compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
  1005				#address-cells = <1>;
  1006				#size-cells = <1>;
  1007				reg = <0x2 0x3b700000 0 0x14000>;
  1008			};
  1009	
  1010			pmgr_dcp: power-management@23b738000 {
  1011				reg = <0x2 0x3b738000 0x0 0x1000>,
  1012					<0x2 0x3bc3c000 0x0 0x1000>;
  1013				reg-names = "dcp-bw-scratch", "dcp-bw-doorbell";
  1014				#apple,bw-scratch-cells = <3>;
  1015				#apple,bw-doorbell-cells = <2>;
  1016			};
  1017	
  1018			pinctrl_ap: pinctrl@23c100000 {
  1019				compatible = "apple,t8103-pinctrl", "apple,pinctrl";
  1020				reg = <0x2 0x3c100000 0x0 0x100000>;
  1021				power-domains = <&ps_gpio>;
  1022	
  1023				gpio-controller;
  1024				#gpio-cells = <2>;
  1025				gpio-ranges = <&pinctrl_ap 0 0 212>;
  1026				apple,npins = <212>;
  1027	
  1028				interrupt-controller;
  1029				#interrupt-cells = <2>;
  1030				interrupt-parent = <&aic>;
  1031				interrupts = <AIC_IRQ 190 IRQ_TYPE_LEVEL_HIGH>,
  1032					     <AIC_IRQ 191 IRQ_TYPE_LEVEL_HIGH>,
  1033					     <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>,
  1034					     <AIC_IRQ 193 IRQ_TYPE_LEVEL_HIGH>,
  1035					     <AIC_IRQ 194 IRQ_TYPE_LEVEL_HIGH>,
  1036					     <AIC_IRQ 195 IRQ_TYPE_LEVEL_HIGH>,
  1037					     <AIC_IRQ 196 IRQ_TYPE_LEVEL_HIGH>;
  1038	
  1039				i2c0_pins: i2c0-pins {
  1040					pinmux = <APPLE_PINMUX(192, 1)>,
  1041						 <APPLE_PINMUX(188, 1)>;
  1042				};
  1043	
  1044				i2c1_pins: i2c1-pins {
  1045					pinmux = <APPLE_PINMUX(201, 1)>,
  1046						 <APPLE_PINMUX(199, 1)>;
  1047				};
  1048	
  1049				i2c2_pins: i2c2-pins {
  1050					pinmux = <APPLE_PINMUX(163, 1)>,
  1051						 <APPLE_PINMUX(162, 1)>;
  1052				};
  1053	
  1054				i2c3_pins: i2c3-pins {
  1055					pinmux = <APPLE_PINMUX(73, 1)>,
  1056						 <APPLE_PINMUX(72, 1)>;
  1057				};
  1058	
  1059				i2c4_pins: i2c4-pins {
  1060					pinmux = <APPLE_PINMUX(135, 1)>,
  1061						 <APPLE_PINMUX(134, 1)>;
  1062				};
  1063	
  1064				spi1_pins: spi1-pins {
  1065					pinmux = <APPLE_PINMUX(42, 1)>,
  1066						<APPLE_PINMUX(43, 1)>,
  1067						<APPLE_PINMUX(44, 1)>,
  1068						<APPLE_PINMUX(45, 1)>;
  1069				};
  1070	
  1071				spi3_pins: spi3-pins {
  1072					pinmux = <APPLE_PINMUX(46, 1)>,
  1073						<APPLE_PINMUX(47, 1)>,
  1074						<APPLE_PINMUX(48, 1)>,
  1075						<APPLE_PINMUX(49, 1)>;
  1076				};
  1077	
  1078				pcie_pins: pcie-pins {
  1079					pinmux = <APPLE_PINMUX(150, 1)>,
  1080						 <APPLE_PINMUX(151, 1)>,
  1081						 <APPLE_PINMUX(32, 1)>;
  1082				};
  1083			};
  1084	
  1085			nub_spmi: spmi@23d0d9300 {
  1086				compatible = "apple,t8103-spmi", "apple,spmi";
  1087				reg = <0x2 0x3d0d9300 0x0 0x100>;
  1088				#address-cells = <2>;
  1089				#size-cells = <0>;
  1090	
  1091				pmu1: pmu@f {
  1092					compatible = "apple,sera-pmu", "apple,spmi-pmu";
  1093					reg = <0xf SPMI_USID>;
  1094					#address-cells = <1>;
  1095					#size-cells = <1>;
  1096	
  1097					rtc_nvmem@d000 {
  1098						compatible = "apple,spmi-pmu-nvmem";
  1099						reg = <0xd000 0x300>;
  1100						#address-cells = <1>;
  1101						#size-cells = <1>;
  1102	
  1103						pm_setting: pm-setting@1 {
  1104							reg = <0x1 0x1>;
  1105						};
  1106	
  1107						rtc_offset: rtc-offset@100 {
  1108							reg = <0x100 0x6>;
  1109						};
  1110					};
  1111	
  1112					legacy_nvmem@9f00 {
  1113						compatible = "apple,spmi-pmu-nvmem";
  1114						reg = <0x9f00 0x20>;
  1115						#address-cells = <1>;
  1116						#size-cells = <1>;
  1117	
  1118						boot_stage: boot-stage@1 {
  1119							reg = <0x1 0x1>;
  1120						};
  1121	
  1122						boot_error_count: boot-error-count@2 {
  1123							reg = <0x2 0x1>;
  1124							bits = <0 4>;
  1125						};
  1126	
  1127						panic_count: panic-count@2 {
  1128							reg = <0x2 0x1>;
  1129							bits = <4 4>;
  1130						};
  1131	
  1132						boot_error_stage: boot-error-stage@3 {
  1133							reg = <0x3 0x1>;
  1134						};
  1135	
  1136						shutdown_flag: shutdown-flag@f {
  1137							reg = <0xf 0x1>;
  1138							bits = <3 1>;
  1139						};
  1140					};
  1141	
  1142					scrpad_nvmem@a000 {
  1143						compatible = "apple,spmi-pmu-nvmem";
  1144						reg = <0xa000 0x1000>;
  1145						#address-cells = <1>;
  1146						#size-cells = <1>;
  1147	
  1148						fault_shadow: fault-shadow@67b {
  1149							reg = <0x67b 0x10>;
  1150						};
  1151	
  1152						socd: socd@b00 {
  1153							reg = <0xb00 0x400>;
  1154						};
  1155					};
  1156	
  1157				};
  1158			};
  1159	
  1160			pinctrl_nub: pinctrl@23d1f0000 {
  1161				compatible = "apple,t8103-pinctrl", "apple,pinctrl";
  1162				reg = <0x2 0x3d1f0000 0x0 0x4000>;
  1163				power-domains = <&ps_nub_gpio>;
  1164	
  1165				gpio-controller;
  1166				#gpio-cells = <2>;
  1167				gpio-ranges = <&pinctrl_nub 0 0 23>;
  1168				apple,npins = <23>;
  1169	
  1170				interrupt-controller;
  1171				#interrupt-cells = <2>;
  1172				interrupt-parent = <&aic>;
  1173				interrupts = <AIC_IRQ 330 IRQ_TYPE_LEVEL_HIGH>,
  1174					     <AIC_IRQ 331 IRQ_TYPE_LEVEL_HIGH>,
  1175					     <AIC_IRQ 332 IRQ_TYPE_LEVEL_HIGH>,
  1176					     <AIC_IRQ 333 IRQ_TYPE_LEVEL_HIGH>,
  1177					     <AIC_IRQ 334 IRQ_TYPE_LEVEL_HIGH>,
  1178					     <AIC_IRQ 335 IRQ_TYPE_LEVEL_HIGH>,
  1179					     <AIC_IRQ 336 IRQ_TYPE_LEVEL_HIGH>;
  1180			};
  1181	
  1182			pmgr_mini: power-management@23d280000 {
  1183				compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
  1184				#address-cells = <1>;
  1185				#size-cells = <1>;
  1186				reg = <0x2 0x3d280000 0 0x4000>;
  1187			};
  1188	
  1189			wdt: watchdog@23d2b0000 {
  1190				compatible = "apple,t8103-wdt", "apple,wdt";
  1191				reg = <0x2 0x3d2b0000 0x0 0x4000>;
  1192				clocks = <&clkref>;
  1193				interrupt-parent = <&aic>;
  1194				interrupts = <AIC_IRQ 338 IRQ_TYPE_LEVEL_HIGH>;
  1195			};
  1196	
  1197			smc_mbox: mbox@23e408000 {
  1198				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
  1199				reg = <0x2 0x3e408000 0x0 0x4000>;
  1200				interrupt-parent = <&aic>;
  1201				interrupts = <AIC_IRQ 400 IRQ_TYPE_LEVEL_HIGH>,
  1202					<AIC_IRQ 401 IRQ_TYPE_LEVEL_HIGH>,
  1203					<AIC_IRQ 402 IRQ_TYPE_LEVEL_HIGH>,
  1204					<AIC_IRQ 403 IRQ_TYPE_LEVEL_HIGH>;
  1205				interrupt-names = "send-empty", "send-not-empty",
  1206					"recv-empty", "recv-not-empty";
  1207				#mbox-cells = <0>;
  1208			};
  1209	
  1210			smc: smc@23e400000 {
  1211				compatible = "apple,t8103-smc", "apple,smc";
  1212				reg = <0x2 0x3e400000 0x0 0x4000>,
  1213					<0x2 0x3fe00000 0x0 0x100000>;
  1214				reg-names = "smc", "sram";
  1215				mboxes = <&smc_mbox>;
  1216	
  1217				smc_gpio: gpio {
  1218					gpio-controller;
  1219					#gpio-cells = <2>;
  1220				};
  1221	
  1222				smc_rtc: rtc {
  1223					nvmem-cells = <&rtc_offset>;
  1224					nvmem-cell-names = "rtc_offset";
  1225				};
  1226	
  1227				smc_reboot: reboot {
  1228					nvmem-cells = <&shutdown_flag>, <&boot_stage>,
  1229						<&boot_error_count>, <&panic_count>, <&pm_setting>;
  1230					nvmem-cell-names = "shutdown_flag", "boot_stage",
  1231						"boot_error_count", "panic_count", "pm_setting";
  1232				};
  1233			};
  1234	
  1235			pinctrl_smc: pinctrl@23e820000 {
  1236				compatible = "apple,t8103-pinctrl", "apple,pinctrl";
  1237				reg = <0x2 0x3e820000 0x0 0x4000>;
  1238	
  1239				gpio-controller;
  1240				#gpio-cells = <2>;
  1241				gpio-ranges = <&pinctrl_smc 0 0 16>;
  1242				apple,npins = <16>;
  1243	
  1244				interrupt-controller;
  1245				#interrupt-cells = <2>;
  1246				interrupt-parent = <&aic>;
  1247				interrupts = <AIC_IRQ 391 IRQ_TYPE_LEVEL_HIGH>,
  1248					     <AIC_IRQ 392 IRQ_TYPE_LEVEL_HIGH>,
  1249					     <AIC_IRQ 393 IRQ_TYPE_LEVEL_HIGH>,
  1250					     <AIC_IRQ 394 IRQ_TYPE_LEVEL_HIGH>,
  1251					     <AIC_IRQ 395 IRQ_TYPE_LEVEL_HIGH>,
  1252					     <AIC_IRQ 396 IRQ_TYPE_LEVEL_HIGH>,
  1253					     <AIC_IRQ 397 IRQ_TYPE_LEVEL_HIGH>;
  1254			};
  1255	
  1256			pinctrl_aop: pinctrl@24a820000 {
  1257				compatible = "apple,t8103-pinctrl", "apple,pinctrl";
  1258				reg = <0x2 0x4a820000 0x0 0x4000>;
  1259	
  1260				gpio-controller;
  1261				#gpio-cells = <2>;
  1262				gpio-ranges = <&pinctrl_aop 0 0 42>;
  1263				apple,npins = <42>;
  1264	
  1265				interrupt-controller;
  1266				#interrupt-cells = <2>;
  1267				interrupt-parent = <&aic>;
  1268				interrupts = <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
  1269					     <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>,
  1270					     <AIC_IRQ 270 IRQ_TYPE_LEVEL_HIGH>,
  1271					     <AIC_IRQ 271 IRQ_TYPE_LEVEL_HIGH>,
  1272					     <AIC_IRQ 272 IRQ_TYPE_LEVEL_HIGH>,
  1273					     <AIC_IRQ 273 IRQ_TYPE_LEVEL_HIGH>,
  1274					     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
  1275			};
  1276	
  1277			dispext0_dart: iommu@271304000 {
  1278				compatible = "apple,t8103-dart";
  1279				reg = <0x2 0x71304000 0x0 0x4000>;
  1280				#iommu-cells = <1>;
  1281				interrupt-parent = <&aic>;
  1282				interrupts = <AIC_IRQ 481 IRQ_TYPE_LEVEL_HIGH>;
  1283				power-domains = <&ps_dispext_cpu0>;
  1284				status = "disabled";
  1285			};
  1286	
  1287			dcpext_dart: iommu@27130c000 {
  1288				compatible = "apple,t8103-dart";
  1289				reg = <0x2 0x7130c000 0x0 0x4000>;
  1290				#iommu-cells = <1>;
  1291				interrupt-parent = <&aic>;
  1292				interrupts = <AIC_IRQ 481 IRQ_TYPE_LEVEL_HIGH>;
  1293				power-domains = <&ps_dispext_cpu0>;
  1294				status = "disabled";
  1295			};
  1296	
  1297			dcpext_mbox: mbox@271c08000 {
  1298				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
  1299				reg = <0x2 0x71c08000 0x0 0x4000>;
  1300				interrupt-parent = <&aic>;
  1301				interrupts = <AIC_IRQ 466 IRQ_TYPE_LEVEL_HIGH>,
  1302				<AIC_IRQ 467 IRQ_TYPE_LEVEL_HIGH>,
  1303				<AIC_IRQ 468 IRQ_TYPE_LEVEL_HIGH>,
  1304				<AIC_IRQ 469 IRQ_TYPE_LEVEL_HIGH>;
  1305				interrupt-names = "send-empty", "send-not-empty",
  1306				"recv-empty", "recv-not-empty";
  1307				#mbox-cells = <0>;
  1308				power-domains = <&ps_dispext_cpu0>;
  1309				resets = <&ps_dispext_cpu0>;
  1310				status = "disabled";
  1311			};
  1312	
  1313			dcpext: dcp@271c00000 {
  1314				compatible = "apple,t8103-dcpext", "apple,dcpext";
  1315				mboxes = <&dcpext_mbox>;
  1316				mbox-names = "mbox";
  1317				iommus = <&dcpext_dart 0>;
  1318				phandle = <&dcpext>;
  1319	
  1320				reg-names = "coproc", "disp-0", "disp-1", "disp-2",
  1321				"disp-3", "disp-4";
  1322				reg = <0x2 0x71c00000 0x0 0x4000>,
  1323				      <0x2 0x70000000 0x0 0x118000>,
  1324				      <0x2 0x71320000 0x0 0x4000>,
  1325				      <0x2 0x71344000 0x0 0x4000>,
  1326				      <0x2 0x71800000 0x0 0x800000>,
  1327				      <0x2 0x3b3d0000 0x0 0x4000>;
  1328				apple,bw-scratch = <&pmgr_dcp 0 5 0x18>;
  1329				apple,bw-doorbell = <&pmgr_dcp 1 6>;
  1330				power-domains = <&ps_dispext_cpu0>;
  1331				resets = <&ps_dispext_cpu0>;
  1332				clocks = <&clk_dispext0>;
  1333				apple,asc-dram-mask = <0xf 0x00000000>;
  1334				status = "disabled";
  1335	
  1336				dispext0_piodma: piodma {
  1337					iommus = <&dispext0_dart 4>;
  1338					phandle = <&dispext0_piodma>;
  1339				};
  1340	
  1341				ports {
  1342					#address-cells = <1>;
  1343					#size-cells = <0>;
  1344					port@0 {
  1345						reg = <0>;
  1346						dcpext_audio: endpoint {
  1347							remote-endpoint = <&dpaudio1_dcp>;
  1348						};
  1349					};
  1350				};
  1351			};
  1352	
  1353			ans_mbox: mbox@277408000 {
  1354				compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
  1355				reg = <0x2 0x77408000 0x0 0x4000>;
  1356				interrupt-parent = <&aic>;
  1357				interrupts = <AIC_IRQ 583 IRQ_TYPE_LEVEL_HIGH>,
  1358					<AIC_IRQ 584 IRQ_TYPE_LEVEL_HIGH>,
  1359					<AIC_IRQ 585 IRQ_TYPE_LEVEL_HIGH>,
  1360					<AIC_IRQ 586 IRQ_TYPE_LEVEL_HIGH>;
  1361				interrupt-names = "send-empty", "send-not-empty",
  1362					"recv-empty", "recv-not-empty";
  1363				#mbox-cells = <0>;
  1364				power-domains = <&ps_ans2>;
  1365			};
  1366	
  1367			sart: iommu@27bc50000 {
  1368				compatible = "apple,t8103-sart";
  1369				reg = <0x2 0x7bc50000 0x0 0x10000>;
  1370				power-domains = <&ps_ans2>;
  1371			};
  1372	
  1373			nvme@27bcc0000 {
  1374				compatible = "apple,t8103-nvme-ans2", "apple,nvme-ans2";
  1375				reg = <0x2 0x7bcc0000 0x0 0x40000>,
  1376					<0x2 0x77400000 0x0 0x4000>;
  1377				reg-names = "nvme", "ans";
  1378				interrupt-parent = <&aic>;
  1379				interrupts = <AIC_IRQ 590 IRQ_TYPE_LEVEL_HIGH>;
  1380				mboxes = <&ans_mbox>;
  1381				apple,sart = <&sart>;
  1382				power-domains = <&ps_ans2>, <&ps_apcie_st>;
  1383				power-domain-names = "ans", "apcie0";
  1384				resets = <&ps_ans2>;
  1385			};
  1386	
  1387			efuse@23d2bc000 {
  1388				compatible = "apple,t8103-efuses", "apple,efuses";
  1389				reg = <0x2 0x3d2bc000 0x0 0x1000>;
  1390				#address-cells = <1>;
  1391				#size-cells = <1>;
  1392				atcphy0_auspll_rodco_bias_adjust: efuse@430,26 {
  1393					reg = <0x430 4>;
  1394					bits = <26 3>;
  1395				};
  1396	
  1397				atcphy0_auspll_rodco_encap: efuse@430,29 {
  1398					reg = <0x430 4>;
  1399					bits = <29 2>;
  1400				};
  1401	
  1402				atcphy0_auspll_dtc_vreg_adjust: efuse@430,31 {
  1403					reg = <0x430 8>;
  1404					bits = <31 3>;
  1405				};
  1406	
  1407				atcphy0_auspll_fracn_dll_start_capcode: efuse@434,2 {
  1408					reg = <0x434 4>;
  1409					bits = <2 2>;
  1410				};
  1411	
  1412				atcphy0_aus_cmn_shm_vreg_trim: efuse@434,4 {
  1413					reg = <0x434 4>;
  1414					bits = <4 5>;
  1415				};
  1416	
  1417				atcphy0_cio3pll_dco_coarsebin0: efuse@434,9 {
  1418					reg = <0x434 4>;
  1419					bits = <9 6>;
  1420				};
  1421	
  1422				atcphy0_cio3pll_dco_coarsebin1: efuse@434,15 {
  1423					reg = <0x434 4>;
  1424					bits = <15 6>;
  1425				};
  1426	
  1427				atcphy0_cio3pll_dll_start_capcode: efuse@434,21 {
  1428					reg = <0x434 4>;
  1429					bits = <21 2>;
  1430				};
  1431	
  1432				atcphy0_cio3pll_dtc_vreg_adjust: efuse@434,23 {
  1433					reg = <0x434 0x4>;
  1434					bits = <23 3>;
  1435				};
  1436	
  1437				atcphy1_auspll_rodco_bias_adjust: efuse@438,4 {
  1438					reg = <0x438 4>;
  1439					bits = <4 3>;
  1440				};
  1441	
  1442				atcphy1_auspll_rodco_encap: efuse@438,7 {
  1443					reg = <0x438 4>;
  1444					bits = <7 2>;
  1445				};
  1446	
  1447				atcphy1_auspll_dtc_vreg_adjust: efuse@438,9 {
  1448					reg = <0x438 4>;
  1449					bits = <9 3>;
  1450				};
  1451	
  1452				atcphy1_auspll_fracn_dll_start_capcode: efuse@438,12 {
  1453					reg = <0x438 4>;
  1454					bits = <12 2>;
  1455				};
  1456	
  1457				atcphy1_aus_cmn_shm_vreg_trim: efuse@438,14 {
  1458					reg = <0x438 4>;
  1459					bits = <14 5>;
  1460				};
  1461	
  1462				atcphy1_cio3pll_dco_coarsebin0: efuse@438,19 {
  1463					reg = <0x438 4>;
  1464					bits = <19 6>;
  1465				};
  1466	
  1467				atcphy1_cio3pll_dco_coarsebin1: efuse@438,25 {
  1468					reg = <0x438 4>;
  1469					bits = <25 6>;
  1470				};
  1471	
  1472				atcphy1_cio3pll_dll_start_capcode: efuse@438,31 {
  1473					reg = <0x438 4>;
  1474					bits = <31 1>;
  1475				};
  1476	
  1477				atcphy1_cio3pll_dll_start_capcode_workaround: efuse@43c,0 {
  1478					reg = <0x43c 0x4>;
  1479					bits = <0 1>;
  1480				};
  1481	
  1482				atcphy1_cio3pll_dtc_vreg_adjust: efuse@43c,1 {
  1483					reg = <0x43c 0x4>;
  1484					bits = <1 3>;
  1485				};
  1486			};
  1487	
  1488			dwc3_0: usb@382280000 {
  1489				compatible = "apple,t8103-dwc3", "apple,dwc3", "snps,dwc3";
  1490				reg = <0x3 0x82280000 0x0 0x100000>;
  1491				interrupt-parent = <&aic>;
  1492				interrupts = <AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
  1493				dr_mode = "otg";
  1494				usb-role-switch;
  1495				role-switch-default-mode = "host";
  1496				iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
  1497				power-domains = <&ps_atc0_usb>;
  1498				resets = <&atcphy0>;
  1499				phys = <&atcphy0 PHY_TYPE_USB2>, <&atcphy0 PHY_TYPE_USB3>;
  1500				phy-names = "usb2-phy", "usb3-phy";
  1501			};
  1502	
  1503			dwc3_0_dart_0: iommu@382f00000 {
  1504				compatible = "apple,t8103-dart";
  1505				reg = <0x3 0x82f00000 0x0 0x4000>;
  1506				interrupt-parent = <&aic>;
  1507				interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
  1508				#iommu-cells = <1>;
  1509				power-domains = <&ps_atc0_usb>;
  1510			};
  1511	
  1512			dwc3_0_dart_1: iommu@382f80000 {
  1513				compatible = "apple,t8103-dart";
  1514				reg = <0x3 0x82f80000 0x0 0x4000>;
  1515				interrupt-parent = <&aic>;
  1516				interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
  1517				#iommu-cells = <1>;
  1518				power-domains = <&ps_atc0_usb>;
  1519			};
  1520	
  1521			atcphy0: phy@383000000 {
  1522				compatible = "apple,t8103-atcphy";
  1523				reg = <0x3 0x83000000 0x0 0x4c000>,
  1524					<0x3 0x83050000 0x0 0x8000>,
  1525					<0x3 0x80000000 0x0 0x4000>,
  1526					<0x3 0x82a90000 0x0 0x4000>,
  1527					<0x3 0x82a84000 0x0 0x4000>;
  1528				reg-names = "core", "lpdptx", "axi2af", "usb2phy",
  1529					"pipehandler";
  1530	
  1531				#phy-cells = <1>;
  1532				#reset-cells = <0>;
  1533	
  1534				nvmem-cells = <&atcphy0_aus_cmn_shm_vreg_trim>,
  1535					<&atcphy0_auspll_rodco_encap>,
  1536					<&atcphy0_auspll_rodco_bias_adjust>,
  1537					<&atcphy0_auspll_fracn_dll_start_capcode>,
  1538					<&atcphy0_auspll_dtc_vreg_adjust>,
  1539					<&atcphy0_cio3pll_dco_coarsebin0>,
  1540					<&atcphy0_cio3pll_dco_coarsebin1>,
  1541					<&atcphy0_cio3pll_dll_start_capcode>,
  1542					<&atcphy0_cio3pll_dtc_vreg_adjust>;
  1543				nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
  1544					"auspll_rodco_encap",
  1545					"auspll_rodco_bias_adjust",
  1546					"auspll_fracn_dll_start_capcode",
  1547					"auspll_dtc_vreg_adjust",
  1548					"cio3pll_dco_coarsebin0",
  1549					"cio3pll_dco_coarsebin1",
  1550					"cio3pll_dll_start_capcode",
  1551					"cio3pll_dtc_vreg_adjust";
  1552	
  1553				orientation-switch;
  1554				mode-switch;
  1555				svid = <0xff01>, <0x8087>;
  1556				power-domains = <&ps_atc0_usb>;
  1557			};
  1558	
  1559			dwc3_1: usb@502280000 {
  1560				compatible = "apple,t8103-dwc3", "apple,dwc3", "snps,dwc3";
  1561				reg = <0x5 0x02280000 0x0 0x100000>;
  1562				interrupt-parent = <&aic>;
  1563				interrupts = <AIC_IRQ 857 IRQ_TYPE_LEVEL_HIGH>;
  1564				dr_mode = "otg";
  1565				usb-role-switch;
  1566				role-switch-default-mode = "host";
  1567				iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
  1568				power-domains = <&ps_atc1_usb>;
  1569				resets = <&atcphy1>;
  1570				phys = <&atcphy1 PHY_TYPE_USB2>, <&atcphy1 PHY_TYPE_USB3>;
  1571				phy-names = "usb2-phy", "usb3-phy";
  1572			};
  1573	
  1574			dwc3_1_dart_0: iommu@502f00000 {
  1575				compatible = "apple,t8103-dart";
  1576				reg = <0x5 0x02f00000 0x0 0x4000>;
  1577				interrupt-parent = <&aic>;
  1578				interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
  1579				#iommu-cells = <1>;
  1580				power-domains = <&ps_atc1_usb>;
  1581			};
  1582	
  1583			dwc3_1_dart_1: iommu@502f80000 {
  1584				compatible = "apple,t8103-dart";
  1585				reg = <0x5 0x02f80000 0x0 0x4000>;
  1586				interrupt-parent = <&aic>;
  1587				interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
  1588				#iommu-cells = <1>;
  1589				power-domains = <&ps_atc1_usb>;
  1590			};
  1591	
  1592			atcphy1: phy@503000000 {
  1593				compatible = "apple,t8103-atcphy";
  1594				reg = <0x5 0x03000000 0x0 0x4c000>,
  1595					<0x5 0x03050000 0x0 0x8000>,
  1596					<0x5 0x0 0x0 0x4000>,
  1597					<0x5 0x02a90000 0x0 0x4000>,
  1598					<0x5 0x02a84000 0x0 0x4000>;
  1599				reg-names = "core", "lpdptx", "axi2af", "usb2phy",
  1600					"pipehandler";
  1601	
  1602				nvmem-cells = <&atcphy1_aus_cmn_shm_vreg_trim>,
  1603					<&atcphy1_auspll_rodco_encap>,
  1604					<&atcphy1_auspll_rodco_bias_adjust>,
  1605					<&atcphy1_auspll_fracn_dll_start_capcode>,
  1606					<&atcphy1_auspll_dtc_vreg_adjust>,
  1607					<&atcphy1_cio3pll_dco_coarsebin0>,
  1608					<&atcphy1_cio3pll_dco_coarsebin1>,
  1609					<&atcphy1_cio3pll_dll_start_capcode>,
  1610					<&atcphy1_cio3pll_dtc_vreg_adjust>,
  1611					<&atcphy1_cio3pll_dll_start_capcode_workaround>;
  1612				nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
  1613					"auspll_rodco_encap",
  1614					"auspll_rodco_bias_adjust",
  1615					"auspll_fracn_dll_start_capcode",
  1616					"auspll_dtc_vreg_adjust",
  1617					"cio3pll_dco_coarsebin0",
  1618					"cio3pll_dco_coarsebin1",
  1619					"cio3pll_dll_start_capcode",
  1620					"cio3pll_dtc_vreg_adjust",
  1621					"cio3pll_dll_start_capcode_workaround";
  1622	
  1623				#phy-cells = <1>;
  1624				#reset-cells = <0>;
  1625	
  1626				orientation-switch;
  1627				mode-switch;
  1628				svid = <0xff01>, <0x8087>;
  1629				power-domains = <&ps_atc1_usb>;
  1630			};
  1631	
  1632			pcie0_dart_0: iommu@681008000 {
  1633				compatible = "apple,t8103-dart";
  1634				reg = <0x6 0x81008000 0x0 0x4000>;
  1635				#iommu-cells = <1>;
  1636				interrupt-parent = <&aic>;
  1637				interrupts = <AIC_IRQ 696 IRQ_TYPE_LEVEL_HIGH>;
  1638				power-domains = <&ps_apcie_gp>;
  1639			};
  1640	
  1641			pcie0_dart_1: iommu@682008000 {
  1642				compatible = "apple,t8103-dart";
  1643				reg = <0x6 0x82008000 0x0 0x4000>;
  1644				#iommu-cells = <1>;
  1645				interrupt-parent = <&aic>;
  1646				interrupts = <AIC_IRQ 699 IRQ_TYPE_LEVEL_HIGH>;
  1647				power-domains = <&ps_apcie_gp>;
  1648				status = "disabled";
  1649			};
  1650	
  1651			pcie0_dart_2: iommu@683008000 {
  1652				compatible = "apple,t8103-dart";
  1653				reg = <0x6 0x83008000 0x0 0x4000>;
  1654				#iommu-cells = <1>;
  1655				interrupt-parent = <&aic>;
  1656				interrupts = <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>;
  1657				power-domains = <&ps_apcie_gp>;
  1658				status = "disabled";
  1659			};
  1660	
  1661			pcie0: pcie@690000000 {
  1662				compatible = "apple,t8103-pcie", "apple,pcie";
  1663				device_type = "pci";
  1664	
  1665				reg = <0x6 0x90000000 0x0 0x1000000>,
  1666				      <0x6 0x80000000 0x0 0x100000>,
  1667				      <0x6 0x81000000 0x0 0x4000>,
  1668				      <0x6 0x82000000 0x0 0x4000>,
  1669				      <0x6 0x83000000 0x0 0x4000>;
  1670				reg-names = "config", "rc", "port0", "port1", "port2";
  1671	
  1672				interrupt-parent = <&aic>;
  1673				interrupts = <AIC_IRQ 695 IRQ_TYPE_LEVEL_HIGH>,
  1674					     <AIC_IRQ 698 IRQ_TYPE_LEVEL_HIGH>,
  1675					     <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>;
  1676	
  1677				msi-controller;
  1678				msi-parent = <&pcie0>;
  1679				msi-ranges = <&aic AIC_IRQ 704 IRQ_TYPE_EDGE_RISING 32>;
  1680	
  1681	
  1682				iommu-map = <0x100 &pcie0_dart_0 1 1>,
  1683					    <0x200 &pcie0_dart_1 1 1>,
  1684					    <0x300 &pcie0_dart_2 1 1>;
  1685				iommu-map-mask = <0xff00>;
  1686	
  1687				bus-range = <0 3>;
  1688				#address-cells = <3>;
  1689				#size-cells = <2>;
  1690				ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
  1691					 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
  1692	
  1693				power-domains = <&ps_apcie_gp>;
  1694				pinctrl-0 = <&pcie_pins>;
  1695				pinctrl-names = "default";
  1696	
  1697				port00: pci@0,0 {
  1698					device_type = "pci";
  1699					reg = <0x0 0x0 0x0 0x0 0x0>;
  1700					reset-gpios = <&pinctrl_ap 152 GPIO_ACTIVE_LOW>;
  1701	
  1702					#address-cells = <3>;
  1703					#size-cells = <2>;
  1704					ranges;
  1705	
  1706					interrupt-controller;
  1707					#interrupt-cells = <1>;
  1708	
  1709					interrupt-map-mask = <0 0 0 7>;
  1710					interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
  1711							<0 0 0 2 &port00 0 0 0 1>,
  1712							<0 0 0 3 &port00 0 0 0 2>,
  1713							<0 0 0 4 &port00 0 0 0 3>;
  1714				};
  1715	
  1716				port01: pci@1,0 {
  1717					device_type = "pci";
  1718					reg = <0x800 0x0 0x0 0x0 0x0>;
  1719					reset-gpios = <&pinctrl_ap 153 GPIO_ACTIVE_LOW>;
  1720	
  1721					#address-cells = <3>;
  1722					#size-cells = <2>;
  1723					ranges;
  1724	
  1725					interrupt-controller;
  1726					#interrupt-cells = <1>;
  1727	
  1728					interrupt-map-mask = <0 0 0 7>;
  1729					interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
  1730							<0 0 0 2 &port01 0 0 0 1>,
  1731							<0 0 0 3 &port01 0 0 0 2>,
  1732							<0 0 0 4 &port01 0 0 0 3>;
  1733					status = "disabled";
  1734				};
  1735	
  1736				port02: pci@2,0 {
  1737					device_type = "pci";
  1738					reg = <0x1000 0x0 0x0 0x0 0x0>;
  1739					reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
  1740	
  1741					#address-cells = <3>;
  1742					#size-cells = <2>;
  1743					ranges;
  1744	
  1745					interrupt-controller;
  1746					#interrupt-cells = <1>;
  1747	
  1748					interrupt-map-mask = <0 0 0 7>;
  1749					interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
  1750							<0 0 0 2 &port02 0 0 0 1>,
  1751							<0 0 0 3 &port02 0 0 0 2>,
  1752							<0 0 0 4 &port02 0 0 0 3>;
  1753					status = "disabled";
  1754				};
  1755			};
  1756		};
  1757	};
  1758	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
