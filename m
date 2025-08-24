Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFA4749C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 01:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755997926; cv=none; b=WxptIflm0mLGKrWGzbRsmddiIEjaMDsBDp2N2Cx7J9KZS48Fg+628mz4t03RHgi2tdfFZ5bDgV+URABT/D7IwORgZm1pHYmiYW4/Zzp1zC+tSnkbaKK/efVB7Yi0SZxbosV4KYzETf67o0gLyZmZlD56Qtt1c2Uja6Fz3doQYEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755997926; c=relaxed/simple;
	bh=JWhSLRNOUEQZsNdzP4Lup19Ky/zcw2Ja0wcVZawxoFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rKQ6lZLP0dmHxhQ7hQ2HD3P3x6IWH0vw8E9Ui1GYoGSLe6G7f7VICgF5+pBuXh4uKtuYgu0uvoLJUII8/sIicb2znKCBqRKVSM357cJ1MSkNKV9K4SZb2RSN2V8tvnxH7v05V1J+5/a6ehRGrkO0p2swdSbMdumcNJjKbmXDfqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErmztOny; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErmztOny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755997923; x=1787533923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JWhSLRNOUEQZsNdzP4Lup19Ky/zcw2Ja0wcVZawxoFc=;
  b=ErmztOnyD9EVnRVoKLKWothADZlL7m3ql8zNXf3P98ErbFrnNBnOiiMc
   doX/X8AOh8XOdE3R9PkjOo9ZknZIscx8FNY7LCG/kMpuEGKXcvWUNdSZw
   oXp9qw8FjlKyFWRYQzwo5Uq2fk7P2vaXdKxe3EiDts25HG46y9i66KcjV
   zjrdbTYsQsJGD5iQm15Mmoat3R+8dPEFk5noysFqljfiC40xlZoaSV3vH
   g8gQGfsJ6O2/hSyjZtwIvqpeoOAFIKdr4sFjYNVYqUL1yoDOekuW+lG85
   mg28SQE8KMpcYVAZ+hSVrriuUXQAxED9eQzCe8ucTynqId4HwMasyswBJ
   w==;
X-CSE-ConnectionGUID: vxJTvm4WTsadvSU13Df3hQ==
X-CSE-MsgGUID: wQUPpKS9Qdu4kQ82a40X0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58323410"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58323410"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 18:12:02 -0700
X-CSE-ConnectionGUID: svjgS/zQQSOtAQYxI0CfRA==
X-CSE-MsgGUID: J2hbWfeNSg+PiT/OoezB5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="199942639"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 23 Aug 2025 18:12:00 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upzH3-0002BH-2A;
	Sun, 24 Aug 2025 01:11:57 +0000
Date: Sun, 24 Aug 2025 03:11:08 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/2]
 arch/arm64/boot/dts/qcom/sdm630.dtsi:1837.24-1985.5: Warning
 (simple_bus_reg): /soc/camss@ca00020: simple-bus unit address format error,
 expected "c824000"
Message-ID: <202508240350.WpVnennZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   00510ce05bf395fdead13baf52262847776bab0c
commit: dea5289b05f22765c7ffdeab7df99f1d98177cdf [2/2] arm64: dts: qcom: sdm630: correct camss unit address
config: arm64-randconfig-2051-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240350.WpVnennZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240350.WpVnennZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240350.WpVnennZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm630.dtsi:527.6-2241.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sdm630.dtsi:2110.13-2113.8: Warning (unit_address_vs_reg): /soc/remoteproc@15700000/glink-edge/apr/q6core: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1398.32-1415.5: Warning (simple_bus_reg): /soc/dsi-opp-table: missing or empty reg/ranges property
>> arch/arm64/boot/dts/qcom/sdm630.dtsi:1837.24-1985.5: Warning (simple_bus_reg): /soc/camss@ca00020: simple-bus unit address format error, expected "c824000"
   arch/arm64/boot/dts/qcom/pm660.dtsi:173.9-182.4: Warning (avoid_unnecessary_addr_size): /soc/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1634.26-1652.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@c175000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:2094.15-2147.6: Warning (avoid_unnecessary_addr_size): /soc/remoteproc@15700000/glink-edge: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi:90.12-121.4: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:351.33-354.5: Warning (unique_unit_address): /reserved-memory/qhee-code@85800000: duplicate unit-address (also used in node /reserved-memory/removed_region@85800000)
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1475.11-1485.7: Warning (graph_child_address): /soc/mdss@c900000/mdp@c901000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/sdm630.dtsi:527.6-2241.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sdm630.dtsi:2110.13-2113.8: Warning (unit_address_vs_reg): /soc/remoteproc@15700000/glink-edge/apr/q6core: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1398.32-1415.5: Warning (simple_bus_reg): /soc/dsi-opp-table: missing or empty reg/ranges property
>> arch/arm64/boot/dts/qcom/sdm630.dtsi:1837.24-1985.5: Warning (simple_bus_reg): /soc/camss@ca00020: simple-bus unit address format error, expected "c824000"
   arch/arm64/boot/dts/qcom/pm660.dtsi:173.9-182.4: Warning (avoid_unnecessary_addr_size): /soc/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:2094.15-2147.6: Warning (avoid_unnecessary_addr_size): /soc/remoteproc@15700000/glink-edge: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi:90.12-121.4: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:351.33-354.5: Warning (unique_unit_address): /reserved-memory/qhee-code@85800000: duplicate unit-address (also used in node /reserved-memory/removed_region@85800000)
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1475.11-1485.7: Warning (graph_child_address): /soc/mdss@c900000/mdp@c901000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/sdm630.dtsi:527.6-2241.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sdm630.dtsi:2110.13-2113.8: Warning (unit_address_vs_reg): /soc/remoteproc@15700000/glink-edge/apr/q6core: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1398.32-1415.5: Warning (simple_bus_reg): /soc/dsi-opp-table: missing or empty reg/ranges property
>> arch/arm64/boot/dts/qcom/sdm630.dtsi:1837.24-1985.5: Warning (simple_bus_reg): /soc/camss@ca00020: simple-bus unit address format error, expected "c824000"
   arch/arm64/boot/dts/qcom/pm660.dtsi:173.9-182.4: Warning (avoid_unnecessary_addr_size): /soc/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1634.26-1652.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@c175000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:2094.15-2147.6: Warning (avoid_unnecessary_addr_size): /soc/remoteproc@15700000/glink-edge: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi:90.12-121.4: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm630.dtsi:351.33-354.5: Warning (unique_unit_address): /reserved-memory/qhee-code@85800000: duplicate unit-address (also used in node /reserved-memory/removed_region@85800000)
--
   arch/arm64/boot/dts/qcom/sdm630.dtsi:527.6-2241.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sdm630.dtsi:2110.13-2113.8: Warning (unit_address_vs_reg): /soc/remoteproc@15700000/glink-edge/apr/q6core: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sdm630.dtsi:1398.32-1415.5: Warning (simple_bus_reg): /soc/dsi-opp-table: missing or empty reg/ranges property
>> arch/arm64/boot/dts/qcom/sdm630.dtsi:1837.24-1985.5: Warning (simple_bus_reg): /soc/camss@ca00020: simple-bus unit address format error, expected "c824000"
   arch/arm64/boot/dts/qcom/sdm630.dtsi:2094.15-2147.6: Warning (avoid_unnecessary_addr_size): /soc/remoteproc@15700000/glink-edge: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +/c824000 +1837 arch/arm64/boot/dts/qcom/sdm630.dtsi

    16	
    17	/ {
    18		interrupt-parent = <&intc>;
    19	
    20		#address-cells = <2>;
    21		#size-cells = <2>;
    22	
    23		chosen { };
    24	
    25		clocks {
    26			xo_board: xo-board {
    27				compatible = "fixed-clock";
    28				#clock-cells = <0>;
    29				clock-frequency = <19200000>;
    30				clock-output-names = "xo_board";
    31			};
    32	
    33			sleep_clk: sleep-clk {
    34				compatible = "fixed-clock";
    35				#clock-cells = <0>;
    36				clock-frequency = <32764>;
    37				clock-output-names = "sleep_clk";
    38			};
    39		};
    40	
    41		cpus {
    42			#address-cells = <2>;
    43			#size-cells = <0>;
    44	
    45			CPU0: cpu@100 {
    46				device_type = "cpu";
    47				compatible = "arm,cortex-a53";
    48				reg = <0x0 0x100>;
    49				enable-method = "psci";
    50				cpu-idle-states = <&PERF_CPU_SLEEP_0
    51							&PERF_CPU_SLEEP_1
    52							&PERF_CLUSTER_SLEEP_0
    53							&PERF_CLUSTER_SLEEP_1
    54							&PERF_CLUSTER_SLEEP_2>;
    55				capacity-dmips-mhz = <1126>;
    56				#cooling-cells = <2>;
    57				next-level-cache = <&L2_1>;
    58				L2_1: l2-cache {
    59					compatible = "cache";
    60					cache-level = <2>;
    61				};
    62			};
    63	
    64			CPU1: cpu@101 {
    65				device_type = "cpu";
    66				compatible = "arm,cortex-a53";
    67				reg = <0x0 0x101>;
    68				enable-method = "psci";
    69				cpu-idle-states = <&PERF_CPU_SLEEP_0
    70							&PERF_CPU_SLEEP_1
    71							&PERF_CLUSTER_SLEEP_0
    72							&PERF_CLUSTER_SLEEP_1
    73							&PERF_CLUSTER_SLEEP_2>;
    74				capacity-dmips-mhz = <1126>;
    75				#cooling-cells = <2>;
    76				next-level-cache = <&L2_1>;
    77			};
    78	
    79			CPU2: cpu@102 {
    80				device_type = "cpu";
    81				compatible = "arm,cortex-a53";
    82				reg = <0x0 0x102>;
    83				enable-method = "psci";
    84				cpu-idle-states = <&PERF_CPU_SLEEP_0
    85							&PERF_CPU_SLEEP_1
    86							&PERF_CLUSTER_SLEEP_0
    87							&PERF_CLUSTER_SLEEP_1
    88							&PERF_CLUSTER_SLEEP_2>;
    89				capacity-dmips-mhz = <1126>;
    90				#cooling-cells = <2>;
    91				next-level-cache = <&L2_1>;
    92			};
    93	
    94			CPU3: cpu@103 {
    95				device_type = "cpu";
    96				compatible = "arm,cortex-a53";
    97				reg = <0x0 0x103>;
    98				enable-method = "psci";
    99				cpu-idle-states = <&PERF_CPU_SLEEP_0
   100							&PERF_CPU_SLEEP_1
   101							&PERF_CLUSTER_SLEEP_0
   102							&PERF_CLUSTER_SLEEP_1
   103							&PERF_CLUSTER_SLEEP_2>;
   104				capacity-dmips-mhz = <1126>;
   105				#cooling-cells = <2>;
   106				next-level-cache = <&L2_1>;
   107			};
   108	
   109			CPU4: cpu@0 {
   110				device_type = "cpu";
   111				compatible = "arm,cortex-a53";
   112				reg = <0x0 0x0>;
   113				enable-method = "psci";
   114				cpu-idle-states = <&PWR_CPU_SLEEP_0
   115							&PWR_CPU_SLEEP_1
   116							&PWR_CLUSTER_SLEEP_0
   117							&PWR_CLUSTER_SLEEP_1
   118							&PWR_CLUSTER_SLEEP_2>;
   119				capacity-dmips-mhz = <1024>;
   120				#cooling-cells = <2>;
   121				next-level-cache = <&L2_0>;
   122				L2_0: l2-cache {
   123					compatible = "cache";
   124					cache-level = <2>;
   125				};
   126			};
   127	
   128			CPU5: cpu@1 {
   129				device_type = "cpu";
   130				compatible = "arm,cortex-a53";
   131				reg = <0x0 0x1>;
   132				enable-method = "psci";
   133				cpu-idle-states = <&PWR_CPU_SLEEP_0
   134							&PWR_CPU_SLEEP_1
   135							&PWR_CLUSTER_SLEEP_0
   136							&PWR_CLUSTER_SLEEP_1
   137							&PWR_CLUSTER_SLEEP_2>;
   138				capacity-dmips-mhz = <1024>;
   139				#cooling-cells = <2>;
   140				next-level-cache = <&L2_0>;
   141			};
   142	
   143			CPU6: cpu@2 {
   144				device_type = "cpu";
   145				compatible = "arm,cortex-a53";
   146				reg = <0x0 0x2>;
   147				enable-method = "psci";
   148				cpu-idle-states = <&PWR_CPU_SLEEP_0
   149							&PWR_CPU_SLEEP_1
   150							&PWR_CLUSTER_SLEEP_0
   151							&PWR_CLUSTER_SLEEP_1
   152							&PWR_CLUSTER_SLEEP_2>;
   153				capacity-dmips-mhz = <1024>;
   154				#cooling-cells = <2>;
   155				next-level-cache = <&L2_0>;
   156			};
   157	
   158			CPU7: cpu@3 {
   159				device_type = "cpu";
   160				compatible = "arm,cortex-a53";
   161				reg = <0x0 0x3>;
   162				enable-method = "psci";
   163				cpu-idle-states = <&PWR_CPU_SLEEP_0
   164							&PWR_CPU_SLEEP_1
   165							&PWR_CLUSTER_SLEEP_0
   166							&PWR_CLUSTER_SLEEP_1
   167							&PWR_CLUSTER_SLEEP_2>;
   168				capacity-dmips-mhz = <1024>;
   169				#cooling-cells = <2>;
   170				next-level-cache = <&L2_0>;
   171			};
   172	
   173			cpu-map {
   174				cluster0 {
   175					core0 {
   176						cpu = <&CPU4>;
   177					};
   178	
   179					core1 {
   180						cpu = <&CPU5>;
   181					};
   182	
   183					core2 {
   184						cpu = <&CPU6>;
   185					};
   186	
   187					core3 {
   188						cpu = <&CPU7>;
   189					};
   190				};
   191	
   192				cluster1 {
   193					core0 {
   194						cpu = <&CPU0>;
   195					};
   196	
   197					core1 {
   198						cpu = <&CPU1>;
   199					};
   200	
   201					core2 {
   202						cpu = <&CPU2>;
   203					};
   204	
   205					core3 {
   206						cpu = <&CPU3>;
   207					};
   208				};
   209			};
   210	
   211			idle-states {
   212				entry-method = "psci";
   213	
   214				PWR_CPU_SLEEP_0: cpu-sleep-0-0 {
   215					compatible = "arm,idle-state";
   216					idle-state-name = "pwr-retention";
   217					arm,psci-suspend-param = <0x40000002>;
   218					entry-latency-us = <338>;
   219					exit-latency-us = <423>;
   220					min-residency-us = <200>;
   221				};
   222	
   223				PWR_CPU_SLEEP_1: cpu-sleep-0-1 {
   224					compatible = "arm,idle-state";
   225					idle-state-name = "pwr-power-collapse";
   226					arm,psci-suspend-param = <0x40000003>;
   227					entry-latency-us = <515>;
   228					exit-latency-us = <1821>;
   229					min-residency-us = <1000>;
   230					local-timer-stop;
   231				};
   232	
   233				PERF_CPU_SLEEP_0: cpu-sleep-1-0 {
   234					compatible = "arm,idle-state";
   235					idle-state-name = "perf-retention";
   236					arm,psci-suspend-param = <0x40000002>;
   237					entry-latency-us = <154>;
   238					exit-latency-us = <87>;
   239					min-residency-us = <200>;
   240				};
   241	
   242				PERF_CPU_SLEEP_1: cpu-sleep-1-1 {
   243					compatible = "arm,idle-state";
   244					idle-state-name = "perf-power-collapse";
   245					arm,psci-suspend-param = <0x40000003>;
   246					entry-latency-us = <262>;
   247					exit-latency-us = <301>;
   248					min-residency-us = <1000>;
   249					local-timer-stop;
   250				};
   251	
   252				PWR_CLUSTER_SLEEP_0: cluster-sleep-0-0 {
   253					compatible = "arm,idle-state";
   254					idle-state-name = "pwr-cluster-dynamic-retention";
   255					arm,psci-suspend-param = <0x400000F2>;
   256					entry-latency-us = <284>;
   257					exit-latency-us = <384>;
   258					min-residency-us = <9987>;
   259					local-timer-stop;
   260				};
   261	
   262				PWR_CLUSTER_SLEEP_1: cluster-sleep-0-1 {
   263					compatible = "arm,idle-state";
   264					idle-state-name = "pwr-cluster-retention";
   265					arm,psci-suspend-param = <0x400000F3>;
   266					entry-latency-us = <338>;
   267					exit-latency-us = <423>;
   268					min-residency-us = <9987>;
   269					local-timer-stop;
   270				};
   271	
   272				PWR_CLUSTER_SLEEP_2: cluster-sleep-0-2 {
   273					compatible = "arm,idle-state";
   274					idle-state-name = "pwr-cluster-retention";
   275					arm,psci-suspend-param = <0x400000F4>;
   276					entry-latency-us = <515>;
   277					exit-latency-us = <1821>;
   278					min-residency-us = <9987>;
   279					local-timer-stop;
   280				};
   281	
   282				PERF_CLUSTER_SLEEP_0: cluster-sleep-1-0 {
   283					compatible = "arm,idle-state";
   284					idle-state-name = "perf-cluster-dynamic-retention";
   285					arm,psci-suspend-param = <0x400000F2>;
   286					entry-latency-us = <272>;
   287					exit-latency-us = <329>;
   288					min-residency-us = <9987>;
   289					local-timer-stop;
   290				};
   291	
   292				PERF_CLUSTER_SLEEP_1: cluster-sleep-1-1 {
   293					compatible = "arm,idle-state";
   294					idle-state-name = "perf-cluster-retention";
   295					arm,psci-suspend-param = <0x400000F3>;
   296					entry-latency-us = <332>;
   297					exit-latency-us = <368>;
   298					min-residency-us = <9987>;
   299					local-timer-stop;
   300				};
   301	
   302				PERF_CLUSTER_SLEEP_2: cluster-sleep-1-2 {
   303					compatible = "arm,idle-state";
   304					idle-state-name = "perf-cluster-retention";
   305					arm,psci-suspend-param = <0x400000F4>;
   306					entry-latency-us = <545>;
   307					exit-latency-us = <1609>;
   308					min-residency-us = <9987>;
   309					local-timer-stop;
   310				};
   311			};
   312		};
   313	
   314		firmware {
   315			scm {
   316				compatible = "qcom,scm-msm8998", "qcom,scm";
   317			};
   318		};
   319	
   320		memory@80000000 {
   321			device_type = "memory";
   322			/* We expect the bootloader to fill in the reg */
   323			reg = <0x0 0x80000000 0x0 0x0>;
   324		};
   325	
   326		pmu {
   327			compatible = "arm,armv8-pmuv3";
   328			interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_HIGH>;
   329		};
   330	
   331		psci {
   332			compatible = "arm,psci-1.0";
   333			method = "smc";
   334		};
   335	
   336		reserved-memory {
   337			#address-cells = <2>;
   338			#size-cells = <2>;
   339			ranges;
   340	
   341			wlan_msa_guard: wlan-msa-guard@85600000 {
   342				reg = <0x0 0x85600000 0x0 0x100000>;
   343				no-map;
   344			};
   345	
   346			wlan_msa_mem: wlan-msa-mem@85700000 {
   347				reg = <0x0 0x85700000 0x0 0x100000>;
   348				no-map;
   349			};
   350	
   351			qhee_code: qhee-code@85800000 {
   352				reg = <0x0 0x85800000 0x0 0x600000>;
   353				no-map;
   354			};
   355	
   356			rmtfs_mem: memory@85e00000 {
   357				compatible = "qcom,rmtfs-mem";
   358				reg = <0x0 0x85e00000 0x0 0x200000>;
   359				no-map;
   360	
   361				qcom,client-id = <1>;
   362				qcom,vmid = <15>;
   363			};
   364	
   365			smem_region: smem-mem@86000000 {
   366				reg = <0 0x86000000 0 0x200000>;
   367				no-map;
   368			};
   369	
   370			tz_mem: memory@86200000 {
   371				reg = <0x0 0x86200000 0x0 0x3300000>;
   372				no-map;
   373			};
   374	
   375			mpss_region: mpss@8ac00000 {
   376				reg = <0x0 0x8ac00000 0x0 0x7e00000>;
   377				no-map;
   378			};
   379	
   380			adsp_region: adsp@92a00000 {
   381				reg = <0x0 0x92a00000 0x0 0x1e00000>;
   382				no-map;
   383			};
   384	
   385			mba_region: mba@94800000 {
   386				reg = <0x0 0x94800000 0x0 0x200000>;
   387				no-map;
   388			};
   389	
   390			buffer_mem: tzbuffer@94a00000 {
   391				reg = <0x0 0x94a00000 0x0 0x100000>;
   392				no-map;
   393			};
   394	
   395			venus_region: venus@9f800000 {
   396				reg = <0x0 0x9f800000 0x0 0x800000>;
   397				no-map;
   398			};
   399	
   400			adsp_mem: adsp-region@f6000000 {
   401				reg = <0x0 0xf6000000 0x0 0x800000>;
   402				no-map;
   403			};
   404	
   405			qseecom_mem: qseecom-region@f6800000 {
   406				reg = <0x0 0xf6800000 0x0 0x1400000>;
   407				no-map;
   408			};
   409	
   410			zap_shader_region: gpu@fed00000 {
   411				compatible = "shared-dma-pool";
   412				reg = <0x0 0xfed00000 0x0 0xa00000>;
   413				no-map;
   414			};
   415		};
   416	
   417		rpm-glink {
   418			compatible = "qcom,glink-rpm";
   419	
   420			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
   421			qcom,rpm-msg-ram = <&rpm_msg_ram>;
   422			mboxes = <&apcs_glb 0>;
   423	
   424			rpm_requests: rpm-requests {
   425				compatible = "qcom,rpm-sdm660";
   426				qcom,glink-channels = "rpm_requests";
   427	
   428				rpmcc: clock-controller {
   429					compatible = "qcom,rpmcc-sdm660", "qcom,rpmcc";
   430					#clock-cells = <1>;
   431				};
   432	
   433				rpmpd: power-controller {
   434					compatible = "qcom,sdm660-rpmpd";
   435					#power-domain-cells = <1>;
   436					operating-points-v2 = <&rpmpd_opp_table>;
   437	
   438					rpmpd_opp_table: opp-table {
   439						compatible = "operating-points-v2";
   440	
   441						rpmpd_opp_ret: opp1 {
   442							opp-level = <RPM_SMD_LEVEL_RETENTION>;
   443						};
   444	
   445						rpmpd_opp_ret_plus: opp2 {
   446							opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
   447						};
   448	
   449						rpmpd_opp_min_svs: opp3 {
   450							opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
   451						};
   452	
   453						rpmpd_opp_low_svs: opp4 {
   454							opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
   455						};
   456	
   457						rpmpd_opp_svs: opp5 {
   458							opp-level = <RPM_SMD_LEVEL_SVS>;
   459						};
   460	
   461						rpmpd_opp_svs_plus: opp6 {
   462							opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
   463						};
   464	
   465						rpmpd_opp_nom: opp7 {
   466							opp-level = <RPM_SMD_LEVEL_NOM>;
   467						};
   468	
   469						rpmpd_opp_nom_plus: opp8 {
   470							opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
   471						};
   472	
   473						rpmpd_opp_turbo: opp9 {
   474							opp-level = <RPM_SMD_LEVEL_TURBO>;
   475						};
   476					};
   477				};
   478			};
   479		};
   480	
   481		smem: smem {
   482			compatible = "qcom,smem";
   483			memory-region = <&smem_region>;
   484			hwlocks = <&tcsr_mutex 3>;
   485		};
   486	
   487		smp2p-adsp {
   488			compatible = "qcom,smp2p";
   489			qcom,smem = <443>, <429>;
   490			interrupts = <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>;
   491			mboxes = <&apcs_glb 10>;
   492			qcom,local-pid = <0>;
   493			qcom,remote-pid = <2>;
   494	
   495			adsp_smp2p_out: master-kernel {
   496				qcom,entry-name = "master-kernel";
   497				#qcom,smem-state-cells = <1>;
   498			};
   499	
   500			adsp_smp2p_in: slave-kernel {
   501				qcom,entry-name = "slave-kernel";
   502				interrupt-controller;
   503				#interrupt-cells = <2>;
   504			};
   505		};
   506	
   507		smp2p-mpss {
   508			compatible = "qcom,smp2p";
   509			qcom,smem = <435>, <428>;
   510			interrupts = <GIC_SPI 451 IRQ_TYPE_EDGE_RISING>;
   511			mboxes = <&apcs_glb 14>;
   512			qcom,local-pid = <0>;
   513			qcom,remote-pid = <1>;
   514	
   515			modem_smp2p_out: master-kernel {
   516				qcom,entry-name = "master-kernel";
   517				#qcom,smem-state-cells = <1>;
   518			};
   519	
   520			modem_smp2p_in: slave-kernel {
   521				qcom,entry-name = "slave-kernel";
   522				interrupt-controller;
   523				#interrupt-cells = <2>;
   524			};
   525		};
   526	
   527		soc {
   528			#address-cells = <1>;
   529			#size-cells = <1>;
   530			ranges = <0 0 0 0xffffffff>;
   531			compatible = "simple-bus";
   532	
   533			gcc: clock-controller@100000 {
   534				compatible = "qcom,gcc-sdm630";
   535				#clock-cells = <1>;
   536				#reset-cells = <1>;
   537				#power-domain-cells = <1>;
   538				reg = <0x00100000 0x94000>;
   539	
   540				clock-names = "xo", "sleep_clk";
   541				clocks = <&xo_board>,
   542						<&sleep_clk>;
   543			};
   544	
   545			rpm_msg_ram: sram@778000 {
   546				compatible = "qcom,rpm-msg-ram";
   547				reg = <0x00778000 0x7000>;
   548			};
   549	
   550			qfprom: qfprom@780000 {
   551				compatible = "qcom,qfprom";
   552				reg = <0x00780000 0x621c>;
   553				#address-cells = <1>;
   554				#size-cells = <1>;
   555	
   556				qusb2_hstx_trim: hstx-trim@240 {
   557					reg = <0x240 0x1>;
   558					bits = <25 3>;
   559				};
   560	
   561				gpu_speed_bin: gpu-speed-bin@41a0 {
   562					reg = <0x41a0 0x1>;
   563					bits = <21 7>;
   564				};
   565			};
   566	
   567			rng: rng@793000 {
   568				compatible = "qcom,prng-ee";
   569				reg = <0x00793000 0x1000>;
   570				clocks = <&gcc GCC_PRNG_AHB_CLK>;
   571				clock-names = "core";
   572			};
   573	
   574			bimc: interconnect@1008000 {
   575				compatible = "qcom,sdm660-bimc";
   576				reg = <0x01008000 0x78000>;
   577				#interconnect-cells = <1>;
   578				clock-names = "bus", "bus_a";
   579				clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
   580					 <&rpmcc RPM_SMD_BIMC_A_CLK>;
   581			};
   582	
   583			restart@10ac000 {
   584				compatible = "qcom,pshold";
   585				reg = <0x010ac000 0x4>;
   586			};
   587	
   588			cnoc: interconnect@1500000 {
   589				compatible = "qcom,sdm660-cnoc";
   590				reg = <0x01500000 0x10000>;
   591				#interconnect-cells = <1>;
   592				clock-names = "bus", "bus_a";
   593				clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
   594					 <&rpmcc RPM_SMD_CNOC_A_CLK>;
   595			};
   596	
   597			snoc: interconnect@1626000 {
   598				compatible = "qcom,sdm660-snoc";
   599				reg = <0x01626000 0x7090>;
   600				#interconnect-cells = <1>;
   601				clock-names = "bus", "bus_a";
   602				clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
   603					 <&rpmcc RPM_SMD_SNOC_A_CLK>;
   604			};
   605	
   606			anoc2_smmu: iommu@16c0000 {
   607				compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
   608				reg = <0x016c0000 0x40000>;
   609	
   610				assigned-clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
   611				assigned-clock-rates = <1000>;
   612				clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
   613				clock-names = "bus";
   614				#global-interrupts = <2>;
   615				#iommu-cells = <1>;
   616	
   617				interrupts =
   618					<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
   619					<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
   620	
   621					<GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
   622					<GIC_SPI 374 IRQ_TYPE_LEVEL_LOW>,
   623					<GIC_SPI 375 IRQ_TYPE_LEVEL_LOW>,
   624					<GIC_SPI 376 IRQ_TYPE_LEVEL_LOW>,
   625					<GIC_SPI 377 IRQ_TYPE_LEVEL_LOW>,
   626					<GIC_SPI 378 IRQ_TYPE_LEVEL_LOW>,
   627					<GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
   628					<GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
   629					<GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
   630					<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
   631					<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
   632					<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
   633					<GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
   634					<GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
   635					<GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
   636					<GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
   637					<GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
   638					<GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
   639					<GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
   640					<GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
   641					<GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
   642					<GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
   643					<GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
   644					<GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
   645					<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
   646					<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
   647					<GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
   648					<GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
   649					<GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
   650	
   651				status = "disabled";
   652			};
   653	
   654			a2noc: interconnect@1704000 {
   655				compatible = "qcom,sdm660-a2noc";
   656				reg = <0x01704000 0xc100>;
   657				#interconnect-cells = <1>;
   658				clock-names = "bus",
   659					      "bus_a",
   660					      "ipa",
   661					      "ufs_axi",
   662					      "aggre2_ufs_axi",
   663					      "aggre2_usb3_axi",
   664					      "cfg_noc_usb2_axi";
   665				clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>,
   666					 <&rpmcc RPM_SMD_AGGR2_NOC_A_CLK>,
   667					 <&rpmcc RPM_SMD_IPA_CLK>,
   668					 <&gcc GCC_UFS_AXI_CLK>,
   669					 <&gcc GCC_AGGRE2_UFS_AXI_CLK>,
   670					 <&gcc GCC_AGGRE2_USB3_AXI_CLK>,
   671					 <&gcc GCC_CFG_NOC_USB2_AXI_CLK>;
   672			};
   673	
   674			mnoc: interconnect@1745000 {
   675				compatible = "qcom,sdm660-mnoc";
   676				reg = <0x01745000 0xA010>;
   677				#interconnect-cells = <1>;
   678				clock-names = "bus", "bus_a", "iface";
   679				clocks = <&rpmcc RPM_SMD_MMSSNOC_AXI_CLK>,
   680					 <&rpmcc RPM_SMD_MMSSNOC_AXI_CLK_A>,
   681					 <&mmcc AHB_CLK_SRC>;
   682			};
   683	
   684			tsens: thermal-sensor@10ae000 {
   685				compatible = "qcom,sdm630-tsens", "qcom,tsens-v2";
   686				reg = <0x010ae000 0x1000>, /* TM */
   687					  <0x010ad000 0x1000>; /* SROT */
   688				#qcom,sensors = <12>;
   689				interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
   690						 <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
   691				interrupt-names = "uplow", "critical";
   692				#thermal-sensor-cells = <1>;
   693			};
   694	
   695			tcsr_mutex_regs: syscon@1f40000 {
   696				compatible = "syscon";
   697				reg = <0x01f40000 0x40000>;
   698			};
   699	
   700			tlmm: pinctrl@3100000 {
   701				compatible = "qcom,sdm630-pinctrl";
   702				reg = <0x03100000 0x400000>,
   703					  <0x03500000 0x400000>,
   704					  <0x03900000 0x400000>;
   705				reg-names = "south", "center", "north";
   706				interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
   707				gpio-controller;
   708				gpio-ranges = <&tlmm 0 0 114>;
   709				#gpio-cells = <2>;
   710				interrupt-controller;
   711				#interrupt-cells = <2>;
   712	
   713				blsp1_uart1_default: blsp1-uart1-default {
   714					pins = "gpio0", "gpio1", "gpio2", "gpio3";
   715					drive-strength = <2>;
   716					bias-disable;
   717				};
   718	
   719				blsp1_uart1_sleep: blsp1-uart1-sleep {
   720					pins = "gpio0", "gpio1", "gpio2", "gpio3";
   721					drive-strength = <2>;
   722					bias-disable;
   723				};
   724	
   725				blsp1_uart2_default: blsp1-uart2-default {
   726					pins = "gpio4", "gpio5";
   727					drive-strength = <2>;
   728					bias-disable;
   729				};
   730	
   731				blsp2_uart1_default: blsp2-uart1-active {
   732					tx-rts {
   733						pins = "gpio16", "gpio19";
   734						function = "blsp_uart5";
   735						drive-strength = <2>;
   736						bias-disable;
   737					};
   738	
   739					rx {
   740						/*
   741						 * Avoid garbage data while BT module
   742						 * is powered off or not driving signal
   743						 */
   744						pins = "gpio17";
   745						function = "blsp_uart5";
   746						drive-strength = <2>;
   747						bias-pull-up;
   748					};
   749	
   750					cts {
   751						/* Match the pull of the BT module */
   752						pins = "gpio18";
   753						function = "blsp_uart5";
   754						drive-strength = <2>;
   755						bias-pull-down;
   756					};
   757				};
   758	
   759				blsp2_uart1_sleep: blsp2-uart1-sleep {
   760					tx {
   761						pins = "gpio16";
   762						function = "gpio";
   763						drive-strength = <2>;
   764						bias-pull-up;
   765					};
   766	
   767					rx-cts-rts {
   768						pins = "gpio17", "gpio18", "gpio19";
   769						function = "gpio";
   770						drive-strength = <2>;
   771						bias-disable;
   772					};
   773				};
   774	
   775				i2c1_default: i2c1-default {
   776					pins = "gpio2", "gpio3";
   777					function = "blsp_i2c1";
   778					drive-strength = <2>;
   779					bias-disable;
   780				};
   781	
   782				i2c1_sleep: i2c1-sleep {
   783					pins = "gpio2", "gpio3";
   784					function = "blsp_i2c1";
   785					drive-strength = <2>;
   786					bias-pull-up;
   787				};
   788	
   789				i2c2_default: i2c2-default {
   790					pins = "gpio6", "gpio7";
   791					function = "blsp_i2c2";
   792					drive-strength = <2>;
   793					bias-disable;
   794				};
   795	
   796				i2c2_sleep: i2c2-sleep {
   797					pins = "gpio6", "gpio7";
   798					function = "blsp_i2c2";
   799					drive-strength = <2>;
   800					bias-pull-up;
   801				};
   802	
   803				i2c3_default: i2c3-default {
   804					pins = "gpio10", "gpio11";
   805					function = "blsp_i2c3";
   806					drive-strength = <2>;
   807					bias-disable;
   808				};
   809	
   810				i2c3_sleep: i2c3-sleep {
   811					pins = "gpio10", "gpio11";
   812					function = "blsp_i2c3";
   813					drive-strength = <2>;
   814					bias-pull-up;
   815				};
   816	
   817				i2c4_default: i2c4-default {
   818					pins = "gpio14", "gpio15";
   819					function = "blsp_i2c4";
   820					drive-strength = <2>;
   821					bias-disable;
   822				};
   823	
   824				i2c4_sleep: i2c4-sleep {
   825					pins = "gpio14", "gpio15";
   826					function = "blsp_i2c4";
   827					drive-strength = <2>;
   828					bias-pull-up;
   829				};
   830	
   831				i2c5_default: i2c5-default {
   832					pins = "gpio18", "gpio19";
   833					function = "blsp_i2c5";
   834					drive-strength = <2>;
   835					bias-disable;
   836				};
   837	
   838				i2c5_sleep: i2c5-sleep {
   839					pins = "gpio18", "gpio19";
   840					function = "blsp_i2c5";
   841					drive-strength = <2>;
   842					bias-pull-up;
   843				};
   844	
   845				i2c6_default: i2c6-default {
   846					pins = "gpio22", "gpio23";
   847					function = "blsp_i2c6";
   848					drive-strength = <2>;
   849					bias-disable;
   850				};
   851	
   852				i2c6_sleep: i2c6-sleep {
   853					pins = "gpio22", "gpio23";
   854					function = "blsp_i2c6";
   855					drive-strength = <2>;
   856					bias-pull-up;
   857				};
   858	
   859				i2c7_default: i2c7-default {
   860					pins = "gpio26", "gpio27";
   861					function = "blsp_i2c7";
   862					drive-strength = <2>;
   863					bias-disable;
   864				};
   865	
   866				i2c7_sleep: i2c7-sleep {
   867					pins = "gpio26", "gpio27";
   868					function = "blsp_i2c7";
   869					drive-strength = <2>;
   870					bias-pull-up;
   871				};
   872	
   873				i2c8_default: i2c8-default {
   874					pins = "gpio30", "gpio31";
   875					function = "blsp_i2c8";
   876					drive-strength = <2>;
   877					bias-disable;
   878				};
   879	
   880				i2c8_sleep: i2c8-sleep {
   881					pins = "gpio30", "gpio31";
   882					function = "blsp_i2c8";
   883					drive-strength = <2>;
   884					bias-pull-up;
   885				};
   886	
   887				cci0_default: cci0_default {
   888					pinmux {
   889						pins = "gpio36","gpio37";
   890						function = "cci_i2c";
   891					};
   892	
   893					pinconf {
   894						pins = "gpio36","gpio37";
   895						bias-pull-up;
   896						drive-strength = <2>;
   897					};
   898				};
   899	
   900				cci1_default: cci1_default {
   901					pinmux {
   902						pins = "gpio38","gpio39";
   903						function = "cci_i2c";
   904					};
   905	
   906					pinconf {
   907						pins = "gpio38","gpio39";
   908						bias-pull-up;
   909						drive-strength = <2>;
   910					};
   911				};
   912	
   913				sdc1_state_on: sdc1-on {
   914					clk {
   915						pins = "sdc1_clk";
   916						bias-disable;
   917						drive-strength = <16>;
   918					};
   919	
   920					cmd {
   921						pins = "sdc1_cmd";
   922						bias-pull-up;
   923						drive-strength = <10>;
   924					};
   925	
   926					data {
   927						pins = "sdc1_data";
   928						bias-pull-up;
   929						drive-strength = <10>;
   930					};
   931	
   932					rclk {
   933						pins = "sdc1_rclk";
   934						bias-pull-down;
   935					};
   936				};
   937	
   938				sdc1_state_off: sdc1-off {
   939					clk {
   940						pins = "sdc1_clk";
   941						bias-disable;
   942						drive-strength = <2>;
   943					};
   944	
   945					cmd {
   946						pins = "sdc1_cmd";
   947						bias-pull-up;
   948						drive-strength = <2>;
   949					};
   950	
   951					data {
   952						pins = "sdc1_data";
   953						bias-pull-up;
   954						drive-strength = <2>;
   955					};
   956	
   957					rclk {
   958						pins = "sdc1_rclk";
   959						bias-pull-down;
   960					};
   961				};
   962	
   963				sdc2_state_on: sdc2-on {
   964					clk {
   965						pins = "sdc2_clk";
   966						bias-disable;
   967						drive-strength = <16>;
   968					};
   969	
   970					cmd {
   971						pins = "sdc2_cmd";
   972						bias-pull-up;
   973						drive-strength = <10>;
   974					};
   975	
   976					data {
   977						pins = "sdc2_data";
   978						bias-pull-up;
   979						drive-strength = <10>;
   980					};
   981	
   982					sd-cd {
   983						pins = "gpio54";
   984						bias-pull-up;
   985						drive-strength = <2>;
   986					};
   987				};
   988	
   989				sdc2_state_off: sdc2-off {
   990					clk {
   991						pins = "sdc2_clk";
   992						bias-disable;
   993						drive-strength = <2>;
   994					};
   995	
   996					cmd {
   997						pins = "sdc2_cmd";
   998						bias-pull-up;
   999						drive-strength = <2>;
  1000					};
  1001	
  1002					data {
  1003						pins = "sdc2_data";
  1004						bias-pull-up;
  1005						drive-strength = <2>;
  1006					};
  1007	
  1008					sd-cd {
  1009						pins = "gpio54";
  1010						bias-disable;
  1011						drive-strength = <2>;
  1012					};
  1013				};
  1014			};
  1015	
  1016			adreno_gpu: gpu@5000000 {
  1017				compatible = "qcom,adreno-508.0", "qcom,adreno";
  1018				#stream-id-cells = <16>;
  1019	
  1020				reg = <0x05000000 0x40000>;
  1021				reg-names = "kgsl_3d0_reg_memory";
  1022	
  1023				interrupts = <0 300 IRQ_TYPE_LEVEL_HIGH>;
  1024	
  1025				clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
  1026					<&gpucc GPUCC_RBBMTIMER_CLK>,
  1027					<&gcc GCC_BIMC_GFX_CLK>,
  1028					<&gcc GCC_GPU_BIMC_GFX_CLK>,
  1029					<&gpucc GPUCC_RBCPR_CLK>,
  1030					<&gpucc GPUCC_GFX3D_CLK>;
  1031	
  1032				clock-names = "iface",
  1033					"rbbmtimer",
  1034					"mem",
  1035					"mem_iface",
  1036					"rbcpr",
  1037					"core";
  1038	
  1039				power-domains = <&rpmpd SDM660_VDDMX>;
  1040				iommus = <&kgsl_smmu 0>;
  1041	
  1042				nvmem-cells = <&gpu_speed_bin>;
  1043				nvmem-cell-names = "speed_bin";
  1044	
  1045				interconnects = <&bimc MASTER_OXILI &bimc SLAVE_EBI>;
  1046				interconnect-names = "gfx-mem";
  1047	
  1048				operating-points-v2 = <&gpu_sdm630_opp_table>;
  1049	
  1050				status = "disabled";
  1051	
  1052				gpu_sdm630_opp_table: opp-table {
  1053					compatible  = "operating-points-v2";
  1054					opp-775000000 {
  1055						opp-hz = /bits/ 64 <775000000>;
  1056						opp-level = <RPM_SMD_LEVEL_TURBO>;
  1057						opp-peak-kBps = <5412000>;
  1058						opp-supported-hw = <0xA2>;
  1059					};
  1060					opp-647000000 {
  1061						opp-hz = /bits/ 64 <647000000>;
  1062						opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
  1063						opp-peak-kBps = <4068000>;
  1064						opp-supported-hw = <0xFF>;
  1065					};
  1066					opp-588000000 {
  1067						opp-hz = /bits/ 64 <588000000>;
  1068						opp-level = <RPM_SMD_LEVEL_NOM>;
  1069						opp-peak-kBps = <3072000>;
  1070						opp-supported-hw = <0xFF>;
  1071					};
  1072					opp-465000000 {
  1073						opp-hz = /bits/ 64 <465000000>;
  1074						opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
  1075						opp-peak-kBps = <2724000>;
  1076						opp-supported-hw = <0xFF>;
  1077					};
  1078					opp-370000000 {
  1079						opp-hz = /bits/ 64 <370000000>;
  1080						opp-level = <RPM_SMD_LEVEL_SVS>;
  1081						opp-peak-kBps = <2188000>;
  1082						opp-supported-hw = <0xFF>;
  1083					};
  1084					opp-240000000 {
  1085						opp-hz = /bits/ 64 <240000000>;
  1086						opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
  1087						opp-peak-kBps = <1648000>;
  1088						opp-supported-hw = <0xFF>;
  1089					};
  1090					opp-160000000 {
  1091						opp-hz = /bits/ 64 <160000000>;
  1092						opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
  1093						opp-peak-kBps = <1200000>;
  1094						opp-supported-hw = <0xFF>;
  1095					};
  1096				};
  1097			};
  1098	
  1099			kgsl_smmu: iommu@5040000 {
  1100				compatible = "qcom,sdm630-smmu-v2",
  1101					     "qcom,adreno-smmu", "qcom,smmu-v2";
  1102				reg = <0x05040000 0x10000>;
  1103	
  1104				/*
  1105				 * GX GDSC parent is CX. We need to bring up CX for SMMU
  1106				 * but we need both up for Adreno. On the other hand, we
  1107				 * need to manage the GX rpmpd domain in the adreno driver.
  1108				 * Enable CX/GX GDSCs here so that we can manage just the GX
  1109				 * RPM Power Domain in the Adreno driver.
  1110				 */
  1111				power-domains = <&gpucc GPU_GX_GDSC>;
  1112				clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
  1113					 <&gcc GCC_BIMC_GFX_CLK>,
  1114					 <&gcc GCC_GPU_BIMC_GFX_CLK>;
  1115				clock-names = "iface", "mem", "mem_iface";
  1116				#global-interrupts = <2>;
  1117				#iommu-cells = <1>;
  1118	
  1119				interrupts =
  1120					<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
  1121					<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
  1122	
  1123					<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
  1124					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
  1125					<GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
  1126					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
  1127					<GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
  1128					<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
  1129					<GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
  1130					<GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>;
  1131	
  1132				status = "disabled";
  1133			};
  1134	
  1135			gpucc: clock-controller@5065000 {
  1136				compatible = "qcom,gpucc-sdm630";
  1137				#clock-cells = <1>;
  1138				#reset-cells = <1>;
  1139				#power-domain-cells = <1>;
  1140				reg = <0x05065000 0x9038>;
  1141	
  1142				clocks = <&xo_board>,
  1143					 <&gcc GCC_GPU_GPLL0_CLK>,
  1144					 <&gcc GCC_GPU_GPLL0_DIV_CLK>;
  1145				clock-names = "xo",
  1146					      "gcc_gpu_gpll0_clk",
  1147					      "gcc_gpu_gpll0_div_clk";
  1148				status = "disabled";
  1149			};
  1150	
  1151			lpass_smmu: iommu@5100000 {
  1152				compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
  1153				reg = <0x05100000 0x40000>;
  1154				#iommu-cells = <1>;
  1155	
  1156				#global-interrupts = <2>;
  1157				interrupts =
  1158					<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
  1159					<GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
  1160	
  1161					<GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
  1162					<GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
  1163					<GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
  1164					<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
  1165					<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
  1166					<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
  1167					<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
  1168					<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
  1169					<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
  1170					<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
  1171					<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
  1172					<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
  1173					<GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
  1174					<GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
  1175					<GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
  1176					<GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
  1177					<GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
  1178	
  1179				status = "disabled";
  1180			};
  1181	
  1182			spmi_bus: spmi@800f000 {
  1183				compatible = "qcom,spmi-pmic-arb";
  1184				reg =	<0x0800f000 0x1000>,
  1185					<0x08400000 0x1000000>,
  1186					<0x09400000 0x1000000>,
  1187					<0x0a400000 0x220000>,
  1188					<0x0800a000 0x3000>;
  1189				reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
  1190				interrupt-names = "periph_irq";
  1191				interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>;
  1192				qcom,ee = <0>;
  1193				qcom,channel = <0>;
  1194				#address-cells = <2>;
  1195				#size-cells = <0>;
  1196				interrupt-controller;
  1197				#interrupt-cells = <4>;
  1198				cell-index = <0>;
  1199			};
  1200	
  1201			usb3: usb@a8f8800 {
  1202				compatible = "qcom,sdm660-dwc3", "qcom,dwc3";
  1203				reg = <0x0a8f8800 0x400>;
  1204				status = "disabled";
  1205				#address-cells = <1>;
  1206				#size-cells = <1>;
  1207				ranges;
  1208	
  1209				clocks = <&gcc GCC_CFG_NOC_USB3_AXI_CLK>,
  1210					 <&gcc GCC_USB30_MASTER_CLK>,
  1211					 <&gcc GCC_AGGRE2_USB3_AXI_CLK>,
  1212					 <&rpmcc RPM_SMD_AGGR2_NOC_CLK>,
  1213					 <&gcc GCC_USB30_MOCK_UTMI_CLK>,
  1214					 <&gcc GCC_USB30_SLEEP_CLK>;
  1215				clock-names = "cfg_noc", "core", "iface", "bus",
  1216					      "mock_utmi", "sleep";
  1217	
  1218				assigned-clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
  1219						  <&gcc GCC_USB30_MASTER_CLK>,
  1220						  <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
  1221				assigned-clock-rates = <19200000>, <120000000>,
  1222						       <19200000>;
  1223	
  1224				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
  1225					     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
  1226				interrupt-names = "hs_phy_irq", "ss_phy_irq";
  1227	
  1228				power-domains = <&gcc USB_30_GDSC>;
  1229				qcom,select-utmi-as-pipe-clk;
  1230	
  1231				resets = <&gcc GCC_USB_30_BCR>;
  1232	
  1233				usb3_dwc3: usb@a800000 {
  1234					compatible = "snps,dwc3";
  1235					reg = <0x0a800000 0xc8d0>;
  1236					interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
  1237					snps,dis_u2_susphy_quirk;
  1238					snps,dis_enblslpm_quirk;
  1239	
  1240					/*
  1241					 * SDM630 technically supports USB3 but I
  1242					 * haven't seen any devices making use of it.
  1243					 */
  1244					maximum-speed = "high-speed";
  1245					phys = <&qusb2phy>;
  1246					phy-names = "usb2-phy";
  1247					snps,hird-threshold = /bits/ 8 <0>;
  1248				};
  1249			};
  1250	
  1251			qusb2phy: phy@c012000 {
  1252				compatible = "qcom,sdm660-qusb2-phy";
  1253				reg = <0x0c012000 0x180>;
  1254				#phy-cells = <0>;
  1255	
  1256				clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
  1257					 <&gcc GCC_RX0_USB2_CLKREF_CLK>;
  1258				clock-names = "cfg_ahb", "ref";
  1259	
  1260				resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
  1261				nvmem-cells = <&qusb2_hstx_trim>;
  1262				status = "disabled";
  1263			};
  1264	
  1265			sdhc_2: sdhci@c084000 {
  1266				compatible = "qcom,sdm630-sdhci", "qcom,sdhci-msm-v5";
  1267				reg = <0x0c084000 0x1000>;
  1268				reg-names = "hc";
  1269	
  1270				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
  1271						<GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
  1272				interrupt-names = "hc_irq", "pwr_irq";
  1273	
  1274				bus-width = <4>;
  1275				clocks = <&gcc GCC_SDCC2_APPS_CLK>,
  1276						<&gcc GCC_SDCC2_AHB_CLK>,
  1277						<&xo_board>;
  1278				clock-names = "core", "iface", "xo";
  1279	
  1280				interconnects = <&a2noc 3 &a2noc 10>,
  1281						<&gnoc 0 &cnoc 28>;
  1282				operating-points-v2 = <&sdhc2_opp_table>;
  1283	
  1284				pinctrl-names = "default", "sleep";
  1285				pinctrl-0 = <&sdc2_state_on>;
  1286				pinctrl-1 = <&sdc2_state_off>;
  1287				power-domains = <&rpmpd SDM660_VDDCX>;
  1288	
  1289				status = "disabled";
  1290	
  1291				sdhc2_opp_table: opp-table {
  1292					 compatible = "operating-points-v2";
  1293	
  1294					 opp-50000000 {
  1295						opp-hz = /bits/ 64 <50000000>;
  1296						required-opps = <&rpmpd_opp_low_svs>;
  1297						opp-peak-kBps = <200000 140000>;
  1298						opp-avg-kBps = <130718 133320>;
  1299					 };
  1300					 opp-100000000 {
  1301						opp-hz = /bits/ 64 <100000000>;
  1302						required-opps = <&rpmpd_opp_svs>;
  1303						opp-peak-kBps = <250000 160000>;
  1304						opp-avg-kBps = <196078 150000>;
  1305					 };
  1306					 opp-200000000 {
  1307						opp-hz = /bits/ 64 <200000000>;
  1308						required-opps = <&rpmpd_opp_nom>;
  1309						opp-peak-kBps = <4096000 4096000>;
  1310						opp-avg-kBps = <1338562 1338562>;
  1311					 };
  1312				};
  1313			};
  1314	
  1315			sdhc_1: sdhci@c0c4000 {
  1316				compatible = "qcom,sdm630-sdhci", "qcom,sdhci-msm-v5";
  1317				reg = <0x0c0c4000 0x1000>,
  1318				      <0x0c0c5000 0x1000>,
  1319				      <0x0c0c8000 0x8000>;
  1320				reg-names = "hc", "cqhci", "ice";
  1321	
  1322				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
  1323						<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
  1324				interrupt-names = "hc_irq", "pwr_irq";
  1325	
  1326				clocks = <&gcc GCC_SDCC1_APPS_CLK>,
  1327					 <&gcc GCC_SDCC1_AHB_CLK>,
  1328					 <&xo_board>,
  1329					 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
  1330				clock-names = "core", "iface", "xo", "ice";
  1331	
  1332				interconnects = <&a2noc 2 &a2noc 10>,
  1333						<&gnoc 0 &cnoc 27>;
  1334				interconnect-names = "sdhc1-ddr", "cpu-sdhc1";
  1335				operating-points-v2 = <&sdhc1_opp_table>;
  1336				pinctrl-names = "default", "sleep";
  1337				pinctrl-0 = <&sdc1_state_on>;
  1338				pinctrl-1 = <&sdc1_state_off>;
  1339				power-domains = <&rpmpd SDM660_VDDCX>;
  1340	
  1341				bus-width = <8>;
  1342				non-removable;
  1343	
  1344				status = "disabled";
  1345	
  1346				sdhc1_opp_table: opp-table {
  1347					compatible = "operating-points-v2";
  1348	
  1349					opp-50000000 {
  1350						opp-hz = /bits/ 64 <50000000>;
  1351						required-opps = <&rpmpd_opp_low_svs>;
  1352						opp-peak-kBps = <200000 140000>;
  1353						opp-avg-kBps = <130718 133320>;
  1354					};
  1355					opp-100000000 {
  1356						opp-hz = /bits/ 64 <100000000>;
  1357						required-opps = <&rpmpd_opp_svs>;
  1358						opp-peak-kBps = <250000 160000>;
  1359						opp-avg-kBps = <196078 150000>;
  1360					};
  1361					opp-384000000 {
  1362						opp-hz = /bits/ 64 <384000000>;
  1363						required-opps = <&rpmpd_opp_nom>;
  1364						opp-peak-kBps = <4096000 4096000>;
  1365						opp-avg-kBps = <1338562 1338562>;
  1366					};
  1367				};
  1368			};
  1369	
  1370			mmcc: clock-controller@c8c0000 {
  1371				compatible = "qcom,mmcc-sdm630";
  1372				reg = <0x0c8c0000 0x40000>;
  1373				#clock-cells = <1>;
  1374				#reset-cells = <1>;
  1375				#power-domain-cells = <1>;
  1376				clock-names = "xo",
  1377						"sleep_clk",
  1378						"gpll0",
  1379						"gpll0_div",
  1380						"dsi0pll",
  1381						"dsi0pllbyte",
  1382						"dsi1pll",
  1383						"dsi1pllbyte",
  1384						"dp_link_2x_clk_divsel_five",
  1385						"dp_vco_divided_clk_src_mux";
  1386				clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
  1387						<&sleep_clk>,
  1388						<&gcc GCC_MMSS_GPLL0_CLK>,
  1389						<&gcc GCC_MMSS_GPLL0_DIV_CLK>,
  1390						<&dsi0_phy 1>,
  1391						<&dsi0_phy 0>,
  1392						<0>,
  1393						<0>,
  1394						<0>,
  1395						<0>;
  1396			};
  1397	
  1398			dsi_opp_table: dsi-opp-table {
  1399				compatible = "operating-points-v2";
  1400	
  1401				opp-131250000 {
  1402					opp-hz = /bits/ 64 <131250000>;
  1403					required-opps = <&rpmpd_opp_svs>;
  1404				};
  1405	
  1406				opp-210000000 {
  1407					opp-hz = /bits/ 64 <210000000>;
  1408					required-opps = <&rpmpd_opp_svs_plus>;
  1409				};
  1410	
  1411				opp-262500000 {
  1412					opp-hz = /bits/ 64 <262500000>;
  1413					required-opps = <&rpmpd_opp_nom>;
  1414				};
  1415			};
  1416	
  1417			mdss: mdss@c900000 {
  1418				compatible = "qcom,mdss";
  1419				reg = <0x0c900000 0x1000>,
  1420				      <0x0c9b0000 0x1040>;
  1421				reg-names = "mdss_phys", "vbif_phys";
  1422	
  1423				power-domains = <&mmcc MDSS_GDSC>;
  1424	
  1425				clocks = <&mmcc MDSS_AHB_CLK>,
  1426					 <&mmcc MDSS_AXI_CLK>,
  1427					 <&mmcc MDSS_VSYNC_CLK>,
  1428					 <&mmcc MDSS_MDP_CLK>;
  1429				clock-names = "iface",
  1430					      "bus",
  1431					      "vsync",
  1432					      "core";
  1433	
  1434				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
  1435	
  1436				interrupt-controller;
  1437				#interrupt-cells = <1>;
  1438	
  1439				#address-cells = <1>;
  1440				#size-cells = <1>;
  1441				ranges;
  1442				status = "disabled";
  1443	
  1444				mdp: mdp@c901000 {
  1445					compatible = "qcom,mdp5";
  1446					reg = <0x0c901000 0x89000>;
  1447					reg-names = "mdp_phys";
  1448	
  1449					interrupt-parent = <&mdss>;
  1450					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
  1451	
  1452					assigned-clocks = <&mmcc MDSS_MDP_CLK>,
  1453							  <&mmcc MDSS_VSYNC_CLK>;
  1454					assigned-clock-rates = <300000000>,
  1455							       <19200000>;
  1456					clocks = <&mmcc MDSS_AHB_CLK>,
  1457						 <&mmcc MDSS_AXI_CLK>,
  1458						 <&mmcc MDSS_MDP_CLK>,
  1459						 <&mmcc MDSS_VSYNC_CLK>;
  1460					clock-names = "iface",
  1461						      "bus",
  1462						      "core",
  1463						      "vsync";
  1464	
  1465					interconnects = <&mnoc 2 &bimc 5>,
  1466							<&mnoc 3 &bimc 5>,
  1467							<&gnoc 0 &mnoc 17>;
  1468					interconnect-names = "mdp0-mem",
  1469							     "mdp1-mem",
  1470							     "rotator-mem";
  1471					iommus = <&mmss_smmu 0>;
  1472					operating-points-v2 = <&mdp_opp_table>;
  1473					power-domains = <&rpmpd SDM660_VDDCX>;
  1474	
  1475					ports {
  1476						#address-cells = <1>;
  1477						#size-cells = <0>;
  1478	
  1479						port@0 {
  1480							reg = <0>;
  1481							mdp5_intf1_out: endpoint {
  1482								remote-endpoint = <&dsi0_in>;
  1483							};
  1484						};
  1485					};
  1486	
  1487					mdp_opp_table: mdp-opp {
  1488						compatible = "operating-points-v2";
  1489	
  1490						opp-150000000 {
  1491							opp-hz = /bits/ 64 <150000000>;
  1492							opp-peak-kBps = <320000 320000 76800>;
  1493							required-opps = <&rpmpd_opp_low_svs>;
  1494						};
  1495						opp-275000000 {
  1496							opp-hz = /bits/ 64 <275000000>;
  1497							opp-peak-kBps = <6400000 6400000 160000>;
  1498							required-opps = <&rpmpd_opp_svs>;
  1499						};
  1500						opp-300000000 {
  1501							opp-hz = /bits/ 64 <300000000>;
  1502							opp-peak-kBps = <6400000 6400000 190000>;
  1503							required-opps = <&rpmpd_opp_svs_plus>;
  1504						};
  1505						opp-330000000 {
  1506							opp-hz = /bits/ 64 <330000000>;
  1507							opp-peak-kBps = <6400000 6400000 240000>;
  1508							required-opps = <&rpmpd_opp_nom>;
  1509						};
  1510						opp-412500000 {
  1511							opp-hz = /bits/ 64 <412500000>;
  1512							opp-peak-kBps = <6400000 6400000 320000>;
  1513							required-opps = <&rpmpd_opp_turbo>;
  1514						};
  1515					};
  1516				};
  1517	
  1518				dsi0: dsi@c994000 {
  1519					compatible = "qcom,mdss-dsi-ctrl";
  1520					reg = <0x0c994000 0x400>;
  1521					reg-names = "dsi_ctrl";
  1522	
  1523					operating-points-v2 = <&dsi_opp_table>;
  1524					power-domains = <&rpmpd SDM660_VDDCX>;
  1525	
  1526					interrupt-parent = <&mdss>;
  1527					interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
  1528	
  1529					assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
  1530							  <&mmcc PCLK0_CLK_SRC>;
  1531					assigned-clock-parents = <&dsi0_phy 0>,
  1532								 <&dsi0_phy 1>;
  1533	
  1534					clocks = <&mmcc MDSS_MDP_CLK>,
  1535						 <&mmcc MDSS_BYTE0_CLK>,
  1536						 <&mmcc MDSS_BYTE0_INTF_CLK>,
  1537						 <&mmcc MNOC_AHB_CLK>,
  1538						 <&mmcc MDSS_AHB_CLK>,
  1539						 <&mmcc MDSS_AXI_CLK>,
  1540						 <&mmcc MISC_AHB_CLK>,
  1541						 <&mmcc MDSS_PCLK0_CLK>,
  1542						 <&mmcc MDSS_ESC0_CLK>;
  1543					clock-names = "mdp_core",
  1544						      "byte",
  1545						      "byte_intf",
  1546						      "mnoc",
  1547						      "iface",
  1548						      "bus",
  1549						      "core_mmss",
  1550						      "pixel",
  1551						      "core";
  1552	
  1553					phys = <&dsi0_phy>;
  1554					phy-names = "dsi";
  1555	
  1556					ports {
  1557						#address-cells = <1>;
  1558						#size-cells = <0>;
  1559	
  1560						port@0 {
  1561							reg = <0>;
  1562							dsi0_in: endpoint {
  1563								remote-endpoint = <&mdp5_intf1_out>;
  1564							};
  1565						};
  1566	
  1567						port@1 {
  1568							reg = <1>;
  1569							dsi0_out: endpoint {
  1570							};
  1571						};
  1572					};
  1573				};
  1574	
  1575				dsi0_phy: dsi-phy@c994400 {
  1576					compatible = "qcom,dsi-phy-14nm-660";
  1577					reg = <0x0c994400 0x100>,
  1578					      <0x0c994500 0x300>,
  1579					      <0x0c994800 0x188>;
  1580					reg-names = "dsi_phy",
  1581						    "dsi_phy_lane",
  1582						    "dsi_pll";
  1583	
  1584					#clock-cells = <1>;
  1585					#phy-cells = <0>;
  1586	
  1587					clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
  1588					clock-names = "iface", "ref";
  1589				};
  1590			};
  1591	
  1592			blsp1_dma: dma-controller@c144000 {
  1593				compatible = "qcom,bam-v1.7.0";
  1594				reg = <0x0c144000 0x1f000>;
  1595				interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
  1596				clocks = <&gcc GCC_BLSP1_AHB_CLK>;
  1597				clock-names = "bam_clk";
  1598				#dma-cells = <1>;
  1599				qcom,ee = <0>;
  1600				qcom,controlled-remotely;
  1601				num-channels = <18>;
  1602				qcom,num-ees = <4>;
  1603			};
  1604	
  1605			blsp1_uart1: serial@c16f000 {
  1606				compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
  1607				reg = <0x0c16f000 0x200>;
  1608				interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
  1609				clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>,
  1610					 <&gcc GCC_BLSP1_AHB_CLK>;
  1611				clock-names = "core", "iface";
  1612				dmas = <&blsp1_dma 0>, <&blsp1_dma 1>;
  1613				dma-names = "tx", "rx";
  1614				pinctrl-names = "default", "sleep";
  1615				pinctrl-0 = <&blsp1_uart1_default>;
  1616				pinctrl-1 = <&blsp1_uart1_sleep>;
  1617				status = "disabled";
  1618			};
  1619	
  1620			blsp1_uart2: serial@c170000 {
  1621				compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
  1622				reg = <0x0c170000 0x1000>;
  1623				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
  1624				clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
  1625					 <&gcc GCC_BLSP1_AHB_CLK>;
  1626				clock-names = "core", "iface";
  1627				dmas = <&blsp1_dma 2>, <&blsp1_dma 3>;
  1628				dma-names = "tx", "rx";
  1629				pinctrl-names = "default";
  1630				pinctrl-0 = <&blsp1_uart2_default>;
  1631				status = "disabled";
  1632			};
  1633	
  1634			blsp_i2c1: i2c@c175000 {
  1635				compatible = "qcom,i2c-qup-v2.2.1";
  1636				reg = <0x0c175000 0x600>;
  1637				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
  1638	
  1639				clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
  1640						<&gcc GCC_BLSP1_AHB_CLK>;
  1641				clock-names = "core", "iface";
  1642				clock-frequency = <400000>;
  1643				dmas = <&blsp1_dma 4>, <&blsp1_dma 5>;
  1644				dma-names = "tx", "rx";
  1645	
  1646				pinctrl-names = "default", "sleep";
  1647				pinctrl-0 = <&i2c1_default>;
  1648				pinctrl-1 = <&i2c1_sleep>;
  1649				#address-cells = <1>;
  1650				#size-cells = <0>;
  1651				status = "disabled";
  1652			};
  1653	
  1654			blsp_i2c2: i2c@c176000 {
  1655				compatible = "qcom,i2c-qup-v2.2.1";
  1656				reg = <0x0c176000 0x600>;
  1657				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
  1658	
  1659				clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
  1660					 <&gcc GCC_BLSP1_AHB_CLK>;
  1661				clock-names = "core", "iface";
  1662				clock-frequency = <400000>;
  1663				dmas = <&blsp1_dma 6>, <&blsp1_dma 7>;
  1664				dma-names = "tx", "rx";
  1665	
  1666				pinctrl-names = "default", "sleep";
  1667				pinctrl-0 = <&i2c2_default>;
  1668				pinctrl-1 = <&i2c2_sleep>;
  1669				#address-cells = <1>;
  1670				#size-cells = <0>;
  1671				status = "disabled";
  1672			};
  1673	
  1674			blsp_i2c3: i2c@c177000 {
  1675				compatible = "qcom,i2c-qup-v2.2.1";
  1676				reg = <0x0c177000 0x600>;
  1677				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
  1678	
  1679				clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
  1680					 <&gcc GCC_BLSP1_AHB_CLK>;
  1681				clock-names = "core", "iface";
  1682				clock-frequency = <400000>;
  1683				dmas = <&blsp1_dma 8>, <&blsp1_dma 9>;
  1684				dma-names = "tx", "rx";
  1685	
  1686				pinctrl-names = "default", "sleep";
  1687				pinctrl-0 = <&i2c3_default>;
  1688				pinctrl-1 = <&i2c3_sleep>;
  1689				#address-cells = <1>;
  1690				#size-cells = <0>;
  1691				status = "disabled";
  1692			};
  1693	
  1694			blsp_i2c4: i2c@c178000 {
  1695				compatible = "qcom,i2c-qup-v2.2.1";
  1696				reg = <0x0c178000 0x600>;
  1697				interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
  1698	
  1699				clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
  1700					 <&gcc GCC_BLSP1_AHB_CLK>;
  1701				clock-names = "core", "iface";
  1702				clock-frequency = <400000>;
  1703				dmas = <&blsp1_dma 10>, <&blsp1_dma 11>;
  1704				dma-names = "tx", "rx";
  1705	
  1706				pinctrl-names = "default", "sleep";
  1707				pinctrl-0 = <&i2c4_default>;
  1708				pinctrl-1 = <&i2c4_sleep>;
  1709				#address-cells = <1>;
  1710				#size-cells = <0>;
  1711				status = "disabled";
  1712			};
  1713	
  1714			blsp2_dma: dma-controller@c184000 {
  1715				compatible = "qcom,bam-v1.7.0";
  1716				reg = <0x0c184000 0x1f000>;
  1717				interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
  1718				clocks = <&gcc GCC_BLSP2_AHB_CLK>;
  1719				clock-names = "bam_clk";
  1720				#dma-cells = <1>;
  1721				qcom,ee = <0>;
  1722				qcom,controlled-remotely;
  1723				num-channels = <18>;
  1724				qcom,num-ees = <4>;
  1725			};
  1726	
  1727			blsp2_uart1: serial@c1af000 {
  1728				compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
  1729				reg = <0x0c1af000 0x200>;
  1730				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
  1731				clocks = <&gcc GCC_BLSP2_UART1_APPS_CLK>,
  1732					 <&gcc GCC_BLSP2_AHB_CLK>;
  1733				clock-names = "core", "iface";
  1734				dmas = <&blsp2_dma 0>, <&blsp2_dma 1>;
  1735				dma-names = "tx", "rx";
  1736				pinctrl-names = "default", "sleep";
  1737				pinctrl-0 = <&blsp2_uart1_default>;
  1738				pinctrl-1 = <&blsp2_uart1_sleep>;
  1739				status = "disabled";
  1740			};
  1741	
  1742			blsp_i2c5: i2c@c1b5000 {
  1743				compatible = "qcom,i2c-qup-v2.2.1";
  1744				reg = <0x0c1b5000 0x600>;
  1745				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
  1746	
  1747				clocks = <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>,
  1748					 <&gcc GCC_BLSP2_AHB_CLK>;
  1749				clock-names = "core", "iface";
  1750				clock-frequency = <400000>;
  1751				dmas = <&blsp2_dma 4>, <&blsp2_dma 5>;
  1752				dma-names = "tx", "rx";
  1753	
  1754				pinctrl-names = "default", "sleep";
  1755				pinctrl-0 = <&i2c5_default>;
  1756				pinctrl-1 = <&i2c5_sleep>;
  1757				#address-cells = <1>;
  1758				#size-cells = <0>;
  1759				status = "disabled";
  1760			};
  1761	
  1762			blsp_i2c6: i2c@c1b6000 {
  1763				compatible = "qcom,i2c-qup-v2.2.1";
  1764				reg = <0x0c1b6000 0x600>;
  1765				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
  1766	
  1767				clocks = <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>,
  1768					 <&gcc GCC_BLSP2_AHB_CLK>;
  1769				clock-names = "core", "iface";
  1770				clock-frequency = <400000>;
  1771				dmas = <&blsp2_dma 6>, <&blsp2_dma 7>;
  1772				dma-names = "tx", "rx";
  1773	
  1774				pinctrl-names = "default", "sleep";
  1775				pinctrl-0 = <&i2c6_default>;
  1776				pinctrl-1 = <&i2c6_sleep>;
  1777				#address-cells = <1>;
  1778				#size-cells = <0>;
  1779				status = "disabled";
  1780			};
  1781	
  1782			blsp_i2c7: i2c@c1b7000 {
  1783				compatible = "qcom,i2c-qup-v2.2.1";
  1784				reg = <0x0c1b7000 0x600>;
  1785				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
  1786	
  1787				clocks = <&gcc GCC_BLSP2_QUP3_I2C_APPS_CLK>,
  1788					 <&gcc GCC_BLSP2_AHB_CLK>;
  1789				clock-names = "core", "iface";
  1790				clock-frequency = <400000>;
  1791				dmas = <&blsp2_dma 8>, <&blsp2_dma 9>;
  1792				dma-names = "tx", "rx";
  1793	
  1794				pinctrl-names = "default", "sleep";
  1795				pinctrl-0 = <&i2c7_default>;
  1796				pinctrl-1 = <&i2c7_sleep>;
  1797				#address-cells = <1>;
  1798				#size-cells = <0>;
  1799				status = "disabled";
  1800			};
  1801	
  1802			blsp_i2c8: i2c@c1b8000 {
  1803				compatible = "qcom,i2c-qup-v2.2.1";
  1804				reg = <0x0c1b8000 0x600>;
  1805				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
  1806	
  1807				clocks = <&gcc GCC_BLSP2_QUP4_I2C_APPS_CLK>,
  1808					 <&gcc GCC_BLSP2_AHB_CLK>;
  1809				clock-names = "core", "iface";
  1810				clock-frequency = <400000>;
  1811				dmas = <&blsp2_dma 10>, <&blsp2_dma 11>;
  1812				dma-names = "tx", "rx";
  1813	
  1814				pinctrl-names = "default", "sleep";
  1815				pinctrl-0 = <&i2c8_default>;
  1816				pinctrl-1 = <&i2c8_sleep>;
  1817				#address-cells = <1>;
  1818				#size-cells = <0>;
  1819				status = "disabled";
  1820			};
  1821	
  1822			imem@146bf000 {
  1823				compatible = "simple-mfd";
  1824				reg = <0x146bf000 0x1000>;
  1825	
  1826				#address-cells = <1>;
  1827				#size-cells = <1>;
  1828	
  1829				ranges = <0 0x146bf000 0x1000>;
  1830	
  1831				pil-reloc@94c {
  1832					compatible = "qcom,pil-reloc-info";
  1833					reg = <0x94c 0xc8>;
  1834				};
  1835			};
  1836	
> 1837			camss: camss@ca00020 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
