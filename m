Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72711A5B96
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 05:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755925484; cv=none; b=Na8jC3W2A4hYSxOaHOq+Fzp+cxrKreVC76MoEpusMYlUQ1XPqtfaBmYCMk1Cq75I/iT18qpHiRIgw0My2izfFRKzkHUCNFUmfp59QPT3RHOQjs7FERcEdskFKpYOzgHPsl4vA4nMaI0xrK9kKqxFTVtIBT/9Q5dioXuPPIaGZQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755925484; c=relaxed/simple;
	bh=kutzNiNmylxBdfsixJIyPMnE9uUMR5uQBQoJZZV9I+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=reNXRzwyp1NwjR5AmXEo+QBuZmL2ZmIGmyUQqxMJO/vUQCqGid0A5xA6BI8HBxjHQa8/7A4ev0Gt2q6/kFSo5hyGC/AKGbFrmKk/qzMg/H/MB8+QsrVTMiAMuRBIftKrUrTv0SSjXPS8skFU0YUYuqtQFsmLpoRQLK605eNZHKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIjuUz/4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIjuUz/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755925481; x=1787461481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kutzNiNmylxBdfsixJIyPMnE9uUMR5uQBQoJZZV9I+I=;
  b=lIjuUz/4eWjC5EUnIa50eeffrhWo45CCLwdpcUcHBKGFqv8gpAZFkVhX
   S7K2zYfMgjXrs4Oxjv+2VO/ezf92k8aMsqGArKDQzHjswqR+hHmk1aYFw
   hneoBSac1RiP9bD9kIgzr5LU6yDhxAqGRJwBxkX7Nxl31QjR14PvRcuKU
   Ec6SWGS+18EfldmvSxPCdnZ76SFMMLdyldUNwCG6LjG4nZpkXyOzvHkd+
   zAKqUglRMbeipzpy5MoIw/oWlRAymxEzkimo/wECay2MRnfOmu9db3Bu9
   41nUW4ZPSGmOJKI2QC+1LvU+B/SRgfajhggnGwemdm6lm0O/UPeRcG5nz
   g==;
X-CSE-ConnectionGUID: F7UvENPjQk6yZlvnJUnVjQ==
X-CSE-MsgGUID: k9b/Cx+GTmygfpAuyImdJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58153884"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58153884"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 22:04:38 -0700
X-CSE-ConnectionGUID: B8TcRrvhTBGol1hqE27t9Q==
X-CSE-MsgGUID: ADWVg7urRUqV6y753wmcxA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2025 22:04:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upgQc-000M5x-1M;
	Sat, 23 Aug 2025 05:04:34 +0000
Date: Sat, 23 Aug 2025 13:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 443/443]
 arch/arm64/boot/dts/mediatek/mt8189.dtsi:1186.27-1198.5: Warning
 (unit_address_vs_reg): /soc/xs-phy@11b10000: node has a unit name, but no
 reg or ranges property
Message-ID: <202508231317.jGonNZv6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   12cacc6855c36b7b2ce4a8f020b4a40a6433357b
commit: 94efcb592c94bb844f1f7d3b0600ab955addd4f4 [443/443] CHROMIUM: arm64: dts: mt8189: Add mt8189 dts evaluation board and Makefile
config: arm64-randconfig-001-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231317.jGonNZv6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231317.jGonNZv6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231317.jGonNZv6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:1186.27-1198.5: Warning (unit_address_vs_reg): /soc/xs-phy@11b10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:1390.27-1402.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e90000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:1404.27-1416.5: Warning (unit_address_vs_reg): /soc/xs-phy@11ef0000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:1511.18-1517.6: Warning (unit_address_vs_reg): /soc/gpu@13000000/power-model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1518.18-1521.6: Warning (unit_address_vs_reg): /soc/gpu@13000000/power-model@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt6359.dtsi:305.19-308.6: Warning (unit_address_vs_reg): /soc/pwrap@1cc04000/pmic/rtc/fginit: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6359.dtsi:310.17-313.6: Warning (unit_address_vs_reg): /soc/pwrap@1cc04000/pmic/rtc/fgsoc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6359.dtsi:315.19-318.6: Warning (unit_address_vs_reg): /soc/pwrap@1cc04000/pmic/rtc/ext32k: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:2556.30-2560.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:2562.23-2566.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:2568.35-2572.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc-max-crit@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:430.46-437.5: Warning (simple_bus_reg): /soc/performance-controller@108d68: simple-bus unit address format error, expected "108d78"
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:685.16-688.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:1186.27-1198.5: Warning (simple_bus_reg): /soc/xs-phy@11b10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:1368.27-1388.5: Warning (simple_bus_reg): /soc/xs-phy@11e80000: simple-bus unit address format error, expected "11e83000"
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:1390.27-1402.5: Warning (simple_bus_reg): /soc/xs-phy@11e90000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:1404.27-1416.5: Warning (simple_bus_reg): /soc/xs-phy@11ef0000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:1524.32-1622.5: Warning (simple_bus_reg): /soc/opp-table-gpu: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:2548.32-2856.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:2858.10-2861.5: Warning (simple_bus_reg): /soc/emiisu: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:439.37-459.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:461.29-465.5: Warning (unique_unit_address_if_enabled): /soc/syscon@d01a000: duplicate unit-address (also used in node /soc/soc-dbg-error-flag@d01a000)

vim +1186 arch/arm64/boot/dts/mediatek/mt8189.dtsi

    16	
    17	/ {
    18		compatible = "mediatek,mt8189";
    19		interrupt-parent = <&gic>;
    20		#address-cells = <2>;
    21		#size-cells = <2>;
    22	
    23		aliases {
    24			dvo0 = &disp_dvo0;
    25			dvo1 = &disp_dvo1;
    26			dsc0 = &disp_dsc_wrap0;
    27			gce0 = &gce;
    28			gce1 = &gce_m;
    29			i2c0 = &i2c0;
    30			i2c1 = &i2c1;
    31			i2c2 = &i2c2;
    32			i2c3 = &i2c3;
    33			i2c4 = &i2c4;
    34			i2c5 = &i2c5;
    35			i2c6 = &i2c6;
    36			i2c7 = &i2c7;
    37			i2c8 = &i2c8;
    38			mmc0 = &mmc0;
    39			mmc1 = &mmc1;
    40			mutex0 = &disp_mutex0;
    41			ovl0 = &disp_ovl0_4l;
    42			ovl1 = &disp_ovl1_4l;
    43			rdma0 = &disp_rdma0;
    44			rdma1 = &disp_rdma1;
    45			serial0 = &uart0;
    46		};
    47	
    48		clk32k: oscillator-clk32k {
    49			compatible = "fixed-clock";
    50			#clock-cells = <0>;
    51			clock-frequency = <32000>;
    52			clock-output-names = "clk32k";
    53		};
    54	
    55		clk13m: oscillator-clk13m {
    56			compatible = "fixed-factor-clock";
    57			#clock-cells = <0>;
    58			clocks = <&clk26m>;
    59			clock-mult = <1>;
    60			clock-div = <2>;
    61			clock-output-names = "clk13m";
    62		};
    63	
    64		clk26m: oscillator-clk26m {
    65			compatible = "fixed-clock";
    66			#clock-cells = <0>;
    67			clock-frequency = <26000000>;
    68			clock-output-names = "clk26m";
    69		};
    70	
    71		clk104m: oscillator-clk104m {
    72			compatible = "fixed-factor-clock";
    73			#clock-cells = <0>;
    74			clocks = <&clk26m>;
    75			clock-mult = <4>;
    76			clock-div = <1>;
    77			clock-output-names = "clk104m";
    78		};
    79	
    80		ulposc: oscillator-ulposc {
    81			compatible = "fixed-clock";
    82			#clock-cells = <0>;
    83			clock-frequency = <520000000>;
    84			clock-output-names = "ulposc";
    85		};
    86	
    87		ulposc3: oscillator-ulposc3 {
    88			compatible = "fixed-clock";
    89			#clock-cells = <0>;
    90			clock-frequency = <26000000>;
    91			clock-output-names = "ulposc3";
    92		};
    93	
    94		cpus {
    95			#address-cells = <1>;
    96			#size-cells = <0>;
    97	
    98			cpu0: cpu@0 {
    99				device_type = "cpu";
   100				compatible = "arm,cortex-a55";
   101				reg = <0x000>;
   102				enable-method = "psci";
   103				clock-frequency = <2000000000>;
   104				capacity-dmips-mhz = <358>;
   105				cpu-idle-states = <&cpu_off_l>, <&cpu_s2idle>;
   106				i-cache-size = <32768>;
   107				i-cache-line-size = <64>;
   108				i-cache-sets = <128>;
   109				d-cache-size = <32768>;
   110				d-cache-line-size = <64>;
   111				d-cache-sets = <128>;
   112				next-level-cache = <&l2_0>;
   113				performance-domains = <&performance 0>;
   114				#cooling-cells = <2>;
   115			};
   116	
   117			cpu1: cpu@100 {
   118				device_type = "cpu";
   119				compatible = "arm,cortex-a55";
   120				reg = <0x100>;
   121				enable-method = "psci";
   122				clock-frequency = <2000000000>;
   123				capacity-dmips-mhz = <358>;
   124				cpu-idle-states = <&cpu_off_l>, <&cpu_s2idle>;
   125				i-cache-size = <32768>;
   126				i-cache-line-size = <64>;
   127				i-cache-sets = <128>;
   128				d-cache-size = <32768>;
   129				d-cache-line-size = <64>;
   130				d-cache-sets = <128>;
   131				next-level-cache = <&l2_0>;
   132				performance-domains = <&performance 0>;
   133				#cooling-cells = <2>;
   134			};
   135	
   136			cpu2: cpu@200 {
   137				device_type = "cpu";
   138				compatible = "arm,cortex-a55";
   139				reg = <0x200>;
   140				enable-method = "psci";
   141				clock-frequency = <2000000000>;
   142				capacity-dmips-mhz = <358>;
   143				cpu-idle-states = <&cpu_off_l>, <&cpu_s2idle>;
   144				i-cache-size = <32768>;
   145				i-cache-line-size = <64>;
   146				i-cache-sets = <128>;
   147				d-cache-size = <32768>;
   148				d-cache-line-size = <64>;
   149				d-cache-sets = <128>;
   150				next-level-cache = <&l2_0>;
   151				performance-domains = <&performance 0>;
   152				#cooling-cells = <2>;
   153			};
   154	
   155			cpu3: cpu@300 {
   156				device_type = "cpu";
   157				compatible = "arm,cortex-a55";
   158				reg = <0x300>;
   159				enable-method = "psci";
   160				clock-frequency = <2000000000>;
   161				capacity-dmips-mhz = <358>;
   162				cpu-idle-states = <&cpu_off_l>, <&cpu_s2idle>;
   163				i-cache-size = <32768>;
   164				i-cache-line-size = <64>;
   165				i-cache-sets = <128>;
   166				d-cache-size = <32768>;
   167				d-cache-line-size = <64>;
   168				d-cache-sets = <128>;
   169				next-level-cache = <&l2_0>;
   170				performance-domains = <&performance 0>;
   171				#cooling-cells = <2>;
   172			};
   173	
   174			cpu4: cpu@400 {
   175				device_type = "cpu";
   176				compatible = "arm,cortex-a55";
   177				reg = <0x400>;
   178				enable-method = "psci";
   179				clock-frequency = <2000000000>;
   180				capacity-dmips-mhz = <358>;
   181				cpu-idle-states = <&cpu_off_l>, <&cpu_s2idle>;
   182				i-cache-size = <32768>;
   183				i-cache-line-size = <64>;
   184				i-cache-sets = <128>;
   185				d-cache-size = <32768>;
   186				d-cache-line-size = <64>;
   187				d-cache-sets = <128>;
   188				next-level-cache = <&l2_0>;
   189				performance-domains = <&performance 0>;
   190				#cooling-cells = <2>;
   191			};
   192	
   193			cpu5: cpu@500 {
   194				device_type = "cpu";
   195				compatible = "arm,cortex-a55";
   196				reg = <0x500>;
   197				enable-method = "psci";
   198				clock-frequency = <2000000000>;
   199				capacity-dmips-mhz = <358>;
   200				cpu-idle-states = <&cpu_off_l>, <&cpu_s2idle>;
   201				i-cache-size = <32768>;
   202				i-cache-line-size = <64>;
   203				i-cache-sets = <128>;
   204				d-cache-size = <32768>;
   205				d-cache-line-size = <64>;
   206				d-cache-sets = <128>;
   207				next-level-cache = <&l2_0>;
   208				performance-domains = <&performance 0>;
   209				#cooling-cells = <2>;
   210			};
   211	
   212			cpu6: cpu@600 {
   213				device_type = "cpu";
   214				compatible = "arm,cortex-a78";
   215				reg = <0x600>;
   216				enable-method = "psci";
   217				clock-frequency = <3000000000>;
   218				capacity-dmips-mhz = <1024>;
   219				cpu-idle-states = <&cpu_off_b>, <&cpu_s2idle>;
   220				i-cache-size = <65536>;
   221				i-cache-line-size = <64>;
   222				i-cache-sets = <256>;
   223				d-cache-size = <65536>;
   224				d-cache-line-size = <64>;
   225				d-cache-sets = <256>;
   226				next-level-cache = <&l2_1>;
   227				performance-domains = <&performance 1>;
   228				#cooling-cells = <2>;
   229			};
   230	
   231			cpu7: cpu@700 {
   232				device_type = "cpu";
   233				compatible = "arm,cortex-a78";
   234				reg = <0x700>;
   235				enable-method = "psci";
   236				clock-frequency = <3000000000>;
   237				capacity-dmips-mhz = <1024>;
   238				cpu-idle-states = <&cpu_off_b>, <&cpu_s2idle>;
   239				i-cache-size = <65536>;
   240				i-cache-line-size = <64>;
   241				i-cache-sets = <256>;
   242				d-cache-size = <65536>;
   243				d-cache-line-size = <64>;
   244				d-cache-sets = <256>;
   245				next-level-cache = <&l2_1>;
   246				performance-domains = <&performance 1>;
   247				#cooling-cells = <2>;
   248			};
   249	
   250			cpu-map {
   251				cluster0 {
   252					core0 {
   253						cpu = <&cpu0>;
   254					};
   255					core1 {
   256						cpu = <&cpu1>;
   257					};
   258					core2 {
   259						cpu = <&cpu2>;
   260					};
   261					core3 {
   262						cpu = <&cpu3>;
   263					};
   264					core4 {
   265						cpu = <&cpu4>;
   266					};
   267					core5 {
   268						cpu = <&cpu5>;
   269					};
   270					core6 {
   271						cpu = <&cpu6>;
   272					};
   273					core7 {
   274						cpu = <&cpu7>;
   275					};
   276				};
   277			};
   278	
   279			idle-states {
   280				entry-method = "psci";
   281	
   282				cpu_off_l: cpu-off-l {
   283					compatible = "arm,idle-state";
   284					arm,psci-suspend-param = <0x00010000>;
   285					local-timer-stop;
   286					entry-latency-us = <25>;
   287					exit-latency-us = <57>;
   288					min-residency-us = <5700>;
   289				};
   290	
   291				cpu_off_b: cpu-off-b {
   292					compatible = "arm,idle-state";
   293					arm,psci-suspend-param = <0x00010000>;
   294					local-timer-stop;
   295					entry-latency-us = <35>;
   296					exit-latency-us = <82>;
   297					min-residency-us = <1890>;
   298				};
   299	
   300				cpu_s2idle: cpu-s2idle {
   301					compatible = "arm,idle-state";
   302					arm,psci-suspend-param = <0x020180ff>;
   303					local-timer-stop;
   304					entry-latency-us = <10000>;
   305					exit-latency-us = <10000>;
   306					min-residency-us = <4294967295>;
   307				};
   308			};
   309	
   310			l2_0: l2-cache0 {
   311				compatible = "cache";
   312				cache-level = <2>;
   313				cache-size = <131072>;
   314				cache-line-size = <64>;
   315				cache-sets = <512>;
   316				next-level-cache = <&l3_0>;
   317				cache-unified;
   318			};
   319	
   320			l2_1: l2-cache1 {
   321				compatible = "cache";
   322				cache-level = <2>;
   323				cache-size = <262144>;
   324				cache-line-size = <64>;
   325				cache-sets = <512>;
   326				next-level-cache = <&l3_0>;
   327				cache-unified;
   328			};
   329	
   330			l3_0: l3-cache {
   331				compatible = "cache";
   332				cache-level = <3>;
   333				cache-size = <1048576>;
   334				cache-line-size = <64>;
   335				cache-sets = <2048>;
   336				cache-unified;
   337			};
   338		};
   339	
   340		firmware: firmware {
   341			scmi: scmi {
   342				compatible = "arm,scmi";
   343				mboxes = <&tinysys_mbox 0>, <&tinysys_mbox 1>;
   344				shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
   345				mbox-names = "tx", "rx";
   346				#address-cells = <1>;
   347				#size-cells = <0>;
   348	
   349				scmi_tinysys: protocol@80 {
   350					reg = <0x80>;
   351					mediatek,scmi-mminfra = <5>;
   352				};
   353			};
   354		};
   355	
   356		memory: memory@40000000 {
   357			device_type = "memory";
   358			/* This memory size is filled in by the bootloader */
   359			reg = <0 0x40000000 0 0>;
   360		};
   361	
   362		pmu-a55 {
   363			compatible = "arm,cortex-a55-pmu";
   364			interrupt-parent = <&gic>;
   365			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
   366		};
   367	
   368		pmu-a78 {
   369			compatible = "arm,cortex-a78-pmu";
   370			interrupt-parent = <&gic>;
   371			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
   372		};
   373	
   374		psci {
   375			compatible = "arm,psci-1.0";
   376			method = "smc";
   377		};
   378	
   379		reserved-memory {
   380			/*TODO: add reserved memory node here*/
   381			#address-cells = <2>;
   382			#size-cells = <2>;
   383			ranges;
   384	
   385			afe_dma_mem_reserved: snd-dma-mem-region@60000000 {
   386				compatible = "shared-dma-pool";
   387				reg = <0 0x60000000 0 0x300000>;
   388				no-map;
   389			};
   390		};
   391	
   392		timer: timer {
   393			compatible = "arm,armv8-timer";
   394			interrupt-parent = <&gic>;
   395			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
   396				     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
   397				     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
   398				     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
   399		};
   400	
   401		wl_info: wl-info@c2bf090 {
   402			compatible = "mediatek,wl-info";
   403			wl-support = <0>;
   404			reg = <0 0x0c2bf090 0 0x10>, /*tcm sram base*/
   405				<0 0x0c2c2f10 0 0x1520>; /*tcm wl-base sram*/
   406			reg-names = "wl_sram_base", "wl_tbl_base";
   407		};
   408	
   409		soc {
   410			compatible = "simple-bus";
   411			#address-cells = <2>;
   412			#size-cells = <2>;
   413			ranges;
   414			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
   415	
   416			cpuhvfs: cpuhvfs@100a00 {
   417				compatible = "mediatek,cpufreq-hybrid";
   418				reg = <0 0x00100a00 0 0xc00>,
   419				      <0 0x00108d68 0 0x1400>,
   420				      <0 0x0010a168 0 0x1800>,
   421				      <0 0x00103640 0 0xc0>;
   422				reg-names = "USRAM", "CSRAM", "ESRAM", "FREQ_HW_STATE";
   423	
   424				/* pll mcucfg */
   425				mcucfg-ver = <0>;
   426				pll-con = <0x208>, <0x218>, <0x228>;
   427				clk-div = <0xa2a0>, <0xa2a4>, <0xa2e0>;
   428			};
   429	
   430			performance: performance-controller@108d68 {
   431				compatible = "mediatek,cpufreq-hw";
   432				reg = <0 0x00108d78 0 0x120>,
   433				      <0 0x00108e98 0 0x120>;
   434				reg-names = "performance-domain0",
   435					    "performance-domain1";
   436				#performance-domain-cells = <1>;
   437			};
   438	
   439			gic: interrupt-controller@c000000 {
   440				compatible = "arm,gic-v3";
   441				#interrupt-cells = <4>;
   442				#address-cells = <2>;
   443				#size-cells = <2>;
   444				interrupt-parent = <&gic>;
   445				interrupt-controller;
   446				reg = <0 0xc000000 0 0x40000>, /* distributor */
   447				      <0 0xc040000 0 0x200000>; /* redistributor */
   448				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
   449	
   450				ppi-partitions {
   451					ppi_cluster0: interrupt-partition-0 {
   452						affinity = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
   453					};
   454	
   455					ppi_cluster1: interrupt-partition-1 {
   456						affinity = <&cpu6 &cpu7>;
   457					};
   458				};
   459			};
   460	
   461			dbgao_clk: syscon@d01a000 {
   462				compatible = "mediatek,mt8189-dbg-ao", "syscon";
   463				reg = <0 0xd01a000 0 0x1000>;
   464				#clock-cells = <1>;
   465			};
   466	
   467			soc_dbg_error_flag: soc-dbg-error-flag@d01a000 {
   468				compatible = "mediatek, soc-dbg-error-flag";
   469				reg = <0 0x0d01a000 0 0x1000>;
   470				interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
   471				interrupt-names = "dbg-error-flag";
   472				/* error flag mask description */
   473				mcu2sub-emi-m1-parity-mask = <0x1>;
   474				mcu2sub-emi-m0-parity-mask = <0x2>;
   475				mcu2emi-m1-parity-mask = <0x4>;
   476				mcu2emi-m0-parity-mask = <0x8>;
   477				mcu2infra-reg-parity-mask = <0x10>;
   478				infra-l3-cache2mcu-parity-mask = <0x20>;
   479				emi-parity-cen-mask = <0x40>;
   480				emi-parity-sub-cen-mask = <0x80>;
   481				emi-parity-chan1-mask = <0x100>;
   482				emi-parity-chan2-mask = <0x200>;
   483				emi-parity-chan3-mask = <0x400>;
   484				emi-parity-chan4-mask = <0x800>;
   485				dramc-error-flag-ch-a-mask = <0x1000>;
   486				dramc-error-flag-ch-b-mask = <0x2000>;
   487				dramc-error-flag-ch-c-mask = <0x4000>;
   488				dramc-error-flag-ch-d-mask = <0x8000>;
   489				ap-tracker-timeout-mask = <0x10000>;
   490				infra-tracker-timeout-mask = <0x20000>;
   491				infra-lastbus-timeout-mask = <0x1000000>;
   492				peri-lastbus-timeout-mask = <0x2000000>;
   493				dram-md32-wdt-event-ch-a-mask = <0x8000000>;
   494				dram-md32-wdt-event-ch-b-mask = <0x10000000>;
   495				dram-md32-wdt-event-ch-c-mask = <0x20000000>;
   496			};
   497	
   498			dem_clk: syscon@d0a0000 {
   499				compatible = "mediatek,mt8189-dem", "syscon";
   500				reg = <0 0xd0a0000 0 0x1000>;
   501				#clock-cells = <1>;
   502			};
   503	
   504			topckgen_clk: syscon@10000000 {
   505				compatible = "mediatek,mt8189-topckgen", "syscon";
   506				reg = <0 0x10000000 0 0x1000>;
   507				#clock-cells = <1>;
   508			};
   509	
   510			infracfg_ao_clk: syscon@10001000 {
   511				compatible = "mediatek,mt8189-infra-ao", "syscon";
   512				reg = <0 0x10001000 0 0x1000>;
   513				#clock-cells = <1>;
   514			};
   515	
   516			pio: pinctrl@10005000 {
   517				compatible = "mediatek,mt8189-pinctrl";
   518				reg = <0 0x10005000 0 0x1000>,
   519				      <0 0x11b50000 0 0x1000>,
   520				      <0 0x11c50000 0 0x1000>,
   521				      <0 0x11c60000 0 0x1000>,
   522				      <0 0x11d20000 0 0x1000>,
   523				      <0 0x11d30000 0 0x1000>,
   524				      <0 0x11d40000 0 0x1000>,
   525				      <0 0x11e20000 0 0x1000>,
   526				      <0 0x11e30000 0 0x1000>,
   527				      <0 0x11f20000 0 0x1000>,
   528				      <0 0x11ce0000 0 0x1000>,
   529				      <0 0x11de0000 0 0x1000>,
   530				      <0 0x11e60000 0 0x1000>,
   531				      <0 0x1c01e000 0 0x1000>,
   532				      <0 0x11f00000 0 0x1000>;
   533				reg-names = "gpio_base",
   534					    "iocfg_lm_base",
   535					    "iocfg_rb0_base",
   536					    "iocfg_rb1_base",
   537					    "iocfg_bm0_base",
   538					    "iocfg_bm1_base",
   539					    "iocfg_bm2_base",
   540					    "iocfg_lt0_base",
   541					    "iocfg_lt1_base",
   542					    "iocfg_rt_base",
   543					    "eint-e",
   544					    "eint-s",
   545					    "eint-w",
   546					    "eint-c",
   547					    "eint-n";
   548				gpio-controller;
   549				#gpio-cells = <2>;
   550				gpio-ranges = <&pio 0 0 182>;
   551				interrupt-controller;
   552				interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
   553				#interrupt-cells = <2>;
   554			};
   555	
   556			apmixedsys_clk: syscon@1000c000 {
   557				compatible = "mediatek,mt8189-apmixedsys", "syscon";
   558				reg = <0 0x1000c000 0 0x1000>;
   559				#clock-cells = <1>;
   560			};
   561	
   562			devapc_infra: devapc@10207000 {
   563				compatible = "mediatek,mt8189-devapc";
   564				reg = <0 0x10207000 0 0x1000>,
   565				      <0 0x10030000 0 0x1000>; /* infra ao/pd */
   566				vio-idx-num = <105>;
   567				interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;/* infra irq */
   568			};
   569	
   570			emicen: emicen@10219000 {
   571				compatible = "mediatek,mt8189-emicen";
   572				reg = <0 0x10219000 0 0x1000>;
   573				mediatek,emi-reg = <&emichn>;
   574			};
   575	
   576			emichn: emichn@10235000 {
   577				compatible = "mediatek,common-emichn";
   578				reg = <0 0x10235000 0 0x1000>,
   579					<0 0x10245000 0 0x1000>;
   580			};
   581	
   582			emicfg_ao_mem_clk: syscon@10270000 {
   583				compatible = "mediatek,mt8189-emicfg-ao-mem", "syscon";
   584				reg = <0 0x10270000 0 0x1000>;
   585			};
   586	
   587			devapc_infra1: devapc@10274000 {
   588				compatible = "mediatek,mt8189-devapc";
   589				reg = <0 0x10274000 0 0x1000>,
   590				      <0 0x10034000 0 0x1000>; /* infra1 ao/pd */
   591				vio-idx-num = <132>;
   592				interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;/* infra irq */
   593			};
   594	
   595			lvts: lvts@10315000 {
   596				compatible = "mediatek,mt8189-lvts";
   597				reg = <0 0x10315000 0 0x1000>,
   598				      <0 0x10316000 0 0x1000>;
   599				interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH 0>,
   600					     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH 0>;
   601				#thermal-sensor-cells = <1>;
   602				nvmem-cells = <&lvts_e_data1>, <&lvts_e_data2>;
   603				nvmem-cell-names = "e_data1", "e_data2";
   604			};
   605	
   606			infra_iommu_m4: iommu@10330000 {
   607				compatible = "mediatek,mt8189-iommu-infra";
   608				reg = <0 0x10330000 0 0x1000>;
   609				interrupts = <GIC_SPI 553 IRQ_TYPE_LEVEL_HIGH 0>;
   610				#iommu-cells = <1>;
   611			};
   612	
   613			infra_iommu_m7: iommu@1033a000 {
   614				compatible = "mediatek,mt8189-iommu-infra";
   615				reg = <0 0x1033a000 0 0x1000>;
   616				interrupts = <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH 0>;
   617				#iommu-cells = <1>;
   618			};
   619	
   620			uart0: serial@11001000 {
   621				compatible = "mediatek,mt8189-uart", "mediatek,mt6577-uart";
   622				reg = <0 0x11001000 0 0x1000>;
   623				interrupts = <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH 0>;
   624				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART0>;
   625				clock-names = "baud", "bus";
   626				status = "disabled";
   627			};
   628	
   629			afe: mt8189-afe-pcm@11050000 {
   630				compatible = "mediatek,mt8189-afe-pcm";
   631				reg = <0 0x11050000 0 0x10000>;
   632				interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH 0>;
   633				power-domains = <&scpsys MT8189_POWER_DOMAIN_AUDIO>;
   634				memory-region = <&afe_dma_mem_reserved>;
   635				clocks = <&topckgen_clk CLK_TOP_AUD_INTBUS_SEL>,
   636					 <&topckgen_clk CLK_TOP_AUD_ENGEN1_SEL>,
   637					 <&topckgen_clk CLK_TOP_AUD_ENGEN2_SEL>,
   638					 <&topckgen_clk CLK_TOP_AUDIO_H_SEL>,
   639					 <&apmixedsys_clk CLK_APMIXED_APLL1>,
   640					 <&apmixedsys_clk CLK_APMIXED_APLL2>,
   641					 <&topckgen_clk CLK_TOP_APLL1_D4>,
   642					 <&topckgen_clk CLK_TOP_APLL2_D4>,
   643					 <&topckgen_clk CLK_TOP_APLL12_CK_DIV_I2SIN0>,
   644					 <&topckgen_clk CLK_TOP_APLL12_CK_DIV_I2SIN1>,
   645					 <&topckgen_clk CLK_TOP_APLL12_CK_DIV_FMI2S>,
   646					 <&topckgen_clk CLK_TOP_APLL12_CK_DIV_TDMOUT_M>,
   647					 <&topckgen_clk CLK_TOP_APLL12_CK_DIV_TDMOUT_B>,
   648					 <&topckgen_clk CLK_TOP_AUD_1_SEL>,
   649					 <&topckgen_clk CLK_TOP_AUD_2_SEL>,
   650					 <&topckgen_clk CLK_TOP_APLL_I2SIN0_MCK_SEL>,
   651					 <&topckgen_clk CLK_TOP_APLL_I2SIN1_MCK_SEL>,
   652					 <&topckgen_clk CLK_TOP_APLL_FMI2S_MCK_SEL>,
   653					 <&topckgen_clk CLK_TOP_APLL_TDMOUT_MCK_SEL>,
   654					 <&clk26m>,
   655					 <&pericfg_ao_clk CLK_PERAO_AUDIO0>,
   656					 <&pericfg_ao_clk CLK_PERAO_AUDIO1>,
   657					 <&pericfg_ao_clk CLK_PERAO_AUDIO2>;
   658				clock-names = "top_aud_intbus",
   659					      "top_aud_eng1",
   660					      "top_aud_eng2",
   661					      "top_aud_h",
   662					      "apll1",
   663					      "apll2",
   664					      "apll1_d4",
   665					      "apll2_d4",
   666					      "apll12_div_i2sin0",
   667					      "apll12_div_i2sin1",
   668					      "apll12_div_fmi2s",
   669					      "apll12_div_tdmout_m",
   670					      "apll12_div_tdmout_b",
   671					      "top_apll1",
   672					      "top_apll2",
   673					      "top_i2sin0",
   674					      "top_i2sin1",
   675					      "top_fmi2s",
   676					      "top_dptx",
   677					      "clk26m",
   678					      "aud_slv_ck_peri",
   679					      "aud_mst_ck_peri",
   680					      "aud_intbus_ck_peri";
   681				mediatek,apmixedsys = <&apmixedsys_clk>;
   682				status = "disabled";
   683			};
   684	
   685			sound: sound {
   686				mediatek,platform = <&afe>;
   687				status = "disabled";
   688			};
   689	
   690			disp_pwm0: pwm@1100e000 {
   691				compatible = "mediatek,mt8189-disp-pwm", "mediatek,mt8183-disp-pwm";
   692				reg = <0 0x1100e000 0 0x1000>;
   693				clocks = <&pericfg_ao_clk CLK_PERAO_DISP_PWM0>,
   694					 <&topckgen_clk CLK_TOP_DISP_PWM_SEL>,
   695					 <&topckgen_clk CLK_TOP_OSC_D4>;
   696				clock-names = "main", "mm", "pwm_src";
   697				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
   698				#pwm-cells = <2>;
   699				status = "disabled";
   700			};
   701	
   702			spi0: spi@11010800 {
   703				compatible = "mediatek,mt8189-spi";
   704				reg = <0 0x11010800 0 0x100>;
   705				interrupts = <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH 0>;
   706				clocks = <&topckgen_clk CLK_TOP_UNIVPLL_D6_D2>,
   707					 <&topckgen_clk CLK_TOP_SPI0_SEL>,
   708					 <&pericfg_ao_clk CLK_PERAO_SPI0_B>,
   709					 <&pericfg_ao_clk CLK_PERAO_SPI0_H>;
   710				clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
   711				#address-cells = <1>;
   712				#size-cells = <0>;
   713				mediatek,pad-select = <0>;
   714				status = "disabled";
   715			};
   716	
   717			spi1: spi@11011800 {
   718				compatible = "mediatek,mt8189-spi";
   719				reg = <0 0x11011800 0 0x100>;
   720				interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>;
   721				clocks = <&topckgen_clk CLK_TOP_UNIVPLL_D6_D2>,
   722					 <&topckgen_clk CLK_TOP_SPI1_SEL>,
   723					 <&pericfg_ao_clk CLK_PERAO_SPI1_B>,
   724					 <&pericfg_ao_clk CLK_PERAO_SPI1_H>;
   725				clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
   726				#address-cells = <1>;
   727				#size-cells = <0>;
   728				mediatek,pad-select = <0>;
   729				status = "disabled";
   730			};
   731	
   732			spi2: spi@11012800 {
   733				compatible = "mediatek,mt8189-spi";
   734				reg = <0 0x11012800 0 0x100>;
   735				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
   736				clocks = <&topckgen_clk CLK_TOP_UNIVPLL_D6_D2>,
   737					 <&topckgen_clk CLK_TOP_SPI2_SEL>,
   738					 <&pericfg_ao_clk CLK_PERAO_SPI2_B>,
   739					 <&pericfg_ao_clk CLK_PERAO_SPI2_H>;
   740				clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
   741				#address-cells = <1>;
   742				#size-cells = <0>;
   743				mediatek,pad-select = <0>;
   744				status = "disabled";
   745			};
   746	
   747			spi3: spi@11013800 {
   748				compatible = "mediatek,mt8189-spi";
   749				reg = <0 0x11013800 0 0x100>;
   750				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
   751				clocks = <&topckgen_clk CLK_TOP_UNIVPLL_D6_D2>,
   752					 <&topckgen_clk CLK_TOP_SPI3_SEL>,
   753					 <&pericfg_ao_clk CLK_PERAO_SPI3_B>,
   754					 <&pericfg_ao_clk CLK_PERAO_SPI3_H>;
   755				clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
   756				#address-cells = <1>;
   757				#size-cells = <0>;
   758				mediatek,pad-select = <0>;
   759				status = "disabled";
   760			};
   761	
   762			spi4: spi@11014800 {
   763				compatible = "mediatek,mt8189-spi";
   764				reg = <0 0x11014800 0 0x100>;
   765				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
   766				clocks = <&topckgen_clk CLK_TOP_UNIVPLL_D6_D2>,
   767					 <&topckgen_clk CLK_TOP_SPI4_SEL>,
   768					 <&pericfg_ao_clk CLK_PERAO_SPI4_B>,
   769					 <&pericfg_ao_clk CLK_PERAO_SPI4_H>;
   770				clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
   771				#address-cells = <1>;
   772				#size-cells = <0>;
   773				mediatek,pad-select = <0>;
   774				status = "disabled";
   775			};
   776	
   777			spi5: spi@11015800 {
   778				compatible = "mediatek,mt8189-spi";
   779				reg = <0 0x11015800 0 0x100>;
   780				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
   781				clocks = <&topckgen_clk CLK_TOP_UNIVPLL_D6_D2>,
   782					 <&topckgen_clk CLK_TOP_SPI5_SEL>,
   783					 <&pericfg_ao_clk CLK_PERAO_SPI5_B>,
   784					 <&pericfg_ao_clk CLK_PERAO_SPI5_H>;
   785				clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
   786				#address-cells = <1>;
   787				#size-cells = <0>;
   788				mediatek,pad-select = <0>;
   789				status = "disabled";
   790			};
   791	
   792			nor_flash: spi@11018000 {
   793				compatible = "mediatek,mt8189-nor","mediatek,mt8186-nor";
   794				reg = <0 0x11018000 0 0x1000>;
   795				clocks = <&topckgen_clk CLK_TOP_SFLASH_SEL>,
   796					 <&pericfg_ao_clk CLK_PERAO_SFLASH>,
   797					 <&pericfg_ao_clk CLK_PERAO_SFLASH_F>,
   798					 <&pericfg_ao_clk CLK_PERAO_SFLASH_H>,
   799					 <&pericfg_ao_clk CLK_PERAO_SFLASH_P>;
   800				clock-names = "spi", "sf", "axi_f", "axi_h", "axi_p";
   801				assigned-clocks = <&topckgen_clk CLK_TOP_SFLASH_SEL>;
   802				assigned-clock-parents = <&topckgen_clk CLK_TOP_UNIVPLL_D6_D8>;
   803				interrupts = <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH 0>;
   804				#address-cells = <1>;
   805				#size-cells = <0>;
   806				status = "disabled";
   807			};
   808	
   809			auxadc: adc@11019000 {
   810				compatible = "mediatek,mt8189-auxadc", "mediatek,mt8173-auxadc";
   811				reg = <0 0x11019000 0 0x1000>;
   812				clocks = <&pericfg_ao_clk CLK_PERAO_AUXADC_26M>;
   813				clock-names = "main";
   814				#io-channel-cells = <1>;
   815				status = "disabled";
   816			};
   817	
   818			devapc_peri: devapc@11020000 {
   819				compatible = "mediatek,mt8189-devapc";
   820				reg = <0 0x11020000 0 0x1000>,
   821				      <0 0x1103c000 0 0x1000>; /* peri ao/pd */
   822				vio-idx-num = <62>;
   823				interrupts = <GIC_SPI 96 IRQ_TYPE_EDGE_RISING 0>; /* peri irq */
   824			};
   825	
   826			pericfg_ao_clk: syscon@11036000 {
   827				compatible = "mediatek,mt8189-peri-ao", "syscon", "simple-mfd";
   828				reg = <0 0x11036000 0 0x1000>;
   829				#clock-cells = <1>;
   830				usb_rst: reset-controller {
   831					compatible = "ti,syscon-reset";
   832					#reset-cells = <1>;
   833					reset-duration-us = <100>;
   834					ti,reset-bits = <
   835						/* xhci mac reset */
   836						/* 22: xhci */
   837						0x0  22 0x0  22 0 0
   838						(ASSERT_SET|ASSERT_CLEAR|STATUS_NONE)
   839					>;
   840				};
   841			};
   842	
   843			afe_clk: syscon@11050000 {
   844				compatible = "mediatek,mt8189-audiosys", "syscon";
   845				reg = <0 0x11050000 0 0x1000>;
   846				#clock-cells = <1>;
   847			};
   848	
   849			xhci0: usb@11200000 {
   850				compatible = "mediatek,mt8189-xhci", "mediatek,mtk-xhci";
   851				reg = <0 0x11200000 0 0x1000>,
   852				      <0 0x11203e00 0 0x0100>;
   853				reg-names = "mac", "ippc";
   854				interrupts-extended = <&gic GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH 0>,
   855						      <&pio 207 IRQ_TYPE_LEVEL_HIGH>;
   856				interrupt-names = "host","wakeup";
   857				phys = <&u2port0 PHY_TYPE_USB2>,
   858				       <&u3port0 PHY_TYPE_USB3>;
   859				clocks = <&pericfg_ao_clk CLK_PERAO_SSUSB0_SYS>,
   860					 <&pericfg_ao_clk CLK_PERAO_SSUSB0_REF>,
   861					 <&pericfg_ao_clk CLK_PERAO_SSUSB0_H>,
   862					 <&pericfg_ao_clk CLK_PERAO_SSUSB0_F>,
   863					 <&pericfg_ao_clk CLK_PERAO_SSUSB0_XHCI>,
   864					 <&pericfg_ao_clk CLK_PERAO_SSUSB0_FRMCNT>;
   865				clock-names = "sys_ck", "ref_ck", "mcu_ck",
   866					      "dma_ck", "xhci_ck", "frmcnt_ck";
   867				#address-cells = <1>;
   868				#size-cells = <0>;
   869				resets = <&usb_rst 0>;
   870				reset-names = "usbrst0";
   871				wakeup-source;
   872				mediatek,syscon-wakeup = <&pericfg_ao_clk 0x214 110>;
   873				status = "disabled";
   874			};
   875	
   876			xhci1: usb@11210000 {
   877				compatible = "mediatek,mt8189-xhci", "mediatek,mtk-xhci";
   878				reg = <0 0x11210000 0 0x1000>,
   879				      <0 0x11213e00 0 0x0100>;
   880				reg-names = "mac", "ippc";
   881				interrupts-extended = <&gic GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH 0>,
   882						      <&pio 203 IRQ_TYPE_LEVEL_HIGH>;
   883				interrupt-names = "host","wakeup";
   884				phys = <&u2port1 PHY_TYPE_USB2>;
   885				clocks = <&pericfg_ao_clk CLK_PERAO_SSUSB1_SYS>,
   886					 <&pericfg_ao_clk CLK_PERAO_SSUSB1_REF>,
   887					 <&pericfg_ao_clk CLK_PERAO_SSUSB1_H>,
   888					 <&pericfg_ao_clk CLK_PERAO_SSUSB1_F>,
   889					 <&pericfg_ao_clk CLK_PERAO_SSUSB1_XHCI>,
   890					 <&pericfg_ao_clk CLK_PERAO_SSUSB1_FRMCNT>;
   891				clock-names = "sys_ck", "ref_ck","mcu_ck",
   892					      "dma_ck", "xhci_ck", "frmcnt_ck";
   893				power-domains = <&scpsys MT8189_POWER_DOMAIN_SSUSB>;
   894				#address-cells = <1>;
   895				#size-cells = <0>;
   896				wakeup-source;
   897				mediatek,syscon-wakeup = <&pericfg_ao_clk 0x21c 110>;
   898				status = "disabled";
   899			};
   900	
   901			xhci2: usb@11220000 {
   902				compatible = "mediatek,mt8189-xhci", "mediatek,mtk-xhci";
   903				reg = <0 0x11220000 0 0x1000>,
   904				      <0 0x11223e00 0 0x0100>;
   905				reg-names = "mac", "ippc";
   906				interrupts-extended = <&gic GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH 0>,
   907						      <&pio 193 IRQ_TYPE_LEVEL_HIGH>;
   908				interrupt-names = "host","wakeup";
   909				phys = <&u2port2 PHY_TYPE_USB2>;
   910				clocks = <&pericfg_ao_clk CLK_PERAO_SSUSB2_SYS>,
   911					 <&pericfg_ao_clk CLK_PERAO_SSUSB2_REF>,
   912					 <&pericfg_ao_clk CLK_PERAO_SSUSB2_H>,
   913					 <&pericfg_ao_clk CLK_PERAO_SSUSB2_F>,
   914					 <&pericfg_ao_clk CLK_PERAO_SSUSB2_XHCI>,
   915					 <&pericfg_ao_clk CLK_PERAO_SSUSB2_FRMCNT>;
   916				clock-names = "sys_ck", "ref_ck","mcu_ck",
   917					      "dma_ck", "xhci_ck", "frmcnt_ck";
   918				power-domains = <&scpsys MT8189_POWER_DOMAIN_SSUSB>;
   919				#address-cells = <1>;
   920				#size-cells = <0>;
   921				wakeup-source;
   922				mediatek,syscon-wakeup = <&pericfg_ao_clk 0x27c 110>;
   923				status = "disabled";
   924			};
   925	
   926			mmc0: mmc@11230000 {
   927				compatible = "mediatek,mt8189-mmc";
   928				reg = <0 0x11230000 0 0x10000>,
   929				      <0 0x11e70000 0 0x1000>;
   930				interrupts = <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH 0>;
   931				clocks = <&topckgen_clk CLK_TOP_MSDC50_0_SEL>,
   932					 <&pericfg_ao_clk CLK_PERAO_MSDC0_H>,
   933					 <&pericfg_ao_clk CLK_PERAO_MSDC0>,
   934					 <&topckgen_clk CLK_TOP_MSDC50_0_HCLK_SEL>,
   935					 <&pericfg_ao_clk CLK_PERAO_MSDC0_SLV_H>,
   936					 <&pericfg_ao_clk CLK_PERAO_MSDC0_MST_F>,
   937					 <&topckgen_clk CLK_TOP_MSDC50_0_SEL>;
   938				clock-names = "source", "hclk", "source_cg", "bus_clk",
   939					      "pclk_cg", "axi_cg", "crypto";
   940				status = "disabled";
   941			};
   942	
   943			mmc1: mmc@11240000 {
   944				compatible = "mediatek,mt8189-mmc";
   945				reg = <0 0x11240000 0 0x1000>,
   946				      <0 0x11d80000 0 0x1000>;
   947				interrupts = <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH 0>;
   948				clocks = <&topckgen_clk CLK_TOP_MSDC30_1_SEL>,
   949					 <&pericfg_ao_clk CLK_PERAO_MSDC1_H>,
   950					 <&pericfg_ao_clk CLK_PERAO_MSDC1>,
   951					 <&topckgen_clk CLK_TOP_MSDC30_1_HCLK_SEL>,
   952					 <&pericfg_ao_clk CLK_PERAO_MSDC1_SLV_H>,
   953					 <&pericfg_ao_clk CLK_PERAO_MSDC1_MST_F>;
   954				clock-names = "source", "hclk", "source_cg", "bus_clk",
   955					      "pclk_cg", "axi_cg";
   956				status = "disabled";
   957			};
   958	
   959			xhci3: usb@11260000 {
   960				compatible = "mediatek,mt8189-xhci", "mediatek,mtk-xhci";
   961				reg = <0 0x11260000 0 0x2e00>,
   962				      <0 0x11263e00 0 0x0100>;
   963				reg-names = "mac", "ippc";
   964				interrupts-extended = <&gic GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH 0>,
   965						      <&pio 188 IRQ_TYPE_LEVEL_HIGH>;
   966				interrupt-names = "host","wakeup";
   967				phys = <&u2port3 PHY_TYPE_USB2>,
   968				       <&u3port3 PHY_TYPE_USB3>;
   969				clocks = <&pericfg_ao_clk CLK_PERAO_SSUSB3_SYS>,
   970					 <&pericfg_ao_clk CLK_PERAO_SSUSB3_REF>,
   971					 <&pericfg_ao_clk CLK_PERAO_SSUSB3_H>,
   972					 <&pericfg_ao_clk CLK_PERAO_SSUSB3_F>,
   973					 <&pericfg_ao_clk CLK_PERAO_SSUSB3_XHCI>,
   974					 <&pericfg_ao_clk CLK_PERAO_SSUSB3_FRMCNT>;
   975				clock-names = "sys_ck", "ref_ck", "mcu_ck",
   976					      "dma_ck", "xhci_ck", "frmcnt_ck";
   977				power-domains = <&scpsys MT8189_POWER_DOMAIN_SSUSB>;
   978				#address-cells = <1>;
   979				#size-cells = <0>;
   980				wakeup-source;
   981				mediatek,syscon-wakeup = <&pericfg_ao_clk 0x284 110>;
   982				status = "disabled";
   983			};
   984	
   985			xhci4: usb@11270000 {
   986				compatible = "mediatek,mt8189-xhci", "mediatek,mtk-xhci";
   987				reg = <0 0x11270000 0 0x1000>,
   988				      <0 0x11273e00 0 0x0100>;
   989				reg-names = "mac", "ippc";
   990				interrupts-extended = <&gic GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH 0>,
   991						      <&pio 184 IRQ_TYPE_LEVEL_HIGH>;
   992				interrupt-names = "host","wakeup";
   993				phys = <&u2port4 PHY_TYPE_USB2>;
   994				clocks = <&pericfg_ao_clk CLK_PERAO_SSUSB4_SYS>,
   995					 <&pericfg_ao_clk CLK_PERAO_SSUSB4_REF>,
   996					 <&pericfg_ao_clk CLK_PERAO_SSUSB4_H>,
   997					 <&pericfg_ao_clk CLK_PERAO_SSUSB4_F>,
   998					 <&pericfg_ao_clk CLK_PERAO_SSUSB4_XHCI>,
   999					 <&pericfg_ao_clk CLK_PERAO_SSUSB4_FRMCNT>;
  1000				clock-names = "sys_ck", "ref_ck", "mcu_ck",
  1001					      "dma_ck", "xhci_ck", "frmcnt_ck";
  1002				#address-cells = <1>;
  1003				#size-cells = <0>;
  1004				wakeup-source;
  1005				mediatek,syscon-wakeup = <&pericfg_ao_clk 0x28c 110>;
  1006				status = "disabled";
  1007			};
  1008	
  1009			ufshci: ufshci@112b0000 {
  1010				compatible = "mediatek,mt8183-ufshci";
  1011				reg = <0 0x112b0000 0 0x2300>;
  1012				interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH 0>;
  1013	
  1014				clocks = <&topckgen_clk CLK_TOP_U_SEL>,
  1015					 <&clk26m>,
  1016					 <&topckgen_clk CLK_TOP_MSDCPLL_D2>,
  1017					 <&topckgen_clk CLK_TOP_AES_UFSFDE_SEL>,
  1018					 <&topckgen_clk CLK_TOP_U_MBIST_SEL>,
  1019					 <&ufscfg_ao_reg_clk CLK_UFSCFG_AO_REG_UNIPRO_TX_SYM>,
  1020					 <&ufscfg_ao_reg_clk CLK_UFSCFG_AO_REG_UNIPRO_RX_SYM0>,
  1021					 <&ufscfg_ao_reg_clk CLK_UFSCFG_AO_REG_UNIPRO_RX_SYM1>,
  1022					 <&ufscfg_ao_reg_clk CLK_UFSCFG_AO_REG_UNIPRO_SYS>,
  1023					 <&ufscfg_ao_reg_clk CLK_UFSCFG_AO_REG_U_SAP_CFG>,
  1024					 <&ufscfg_ao_reg_clk CLK_UFSCFG_AO_REG_U_PHY_TOP_AHB_S_BUS>,
  1025					 <&ufscfg_pdn_reg_clk CLK_UFSCFG_REG_UFSHCI_UFS>,
  1026					 <&ufscfg_pdn_reg_clk CLK_UFSCFG_REG_UFSHCI_AES>,
  1027					 <&ufscfg_pdn_reg_clk CLK_UFSCFG_REG_UFSHCI_U_AHB>,
  1028					 <&ufscfg_pdn_reg_clk CLK_UFSCFG_REG_UFSHCI_U_AXI>;
  1029	
  1030				clock-names = "ufs_sel",
  1031					      "ufs_sel_min_src",
  1032					      "ufs_sel_max_src",
  1033					      "ufs_fde",
  1034					      "ufs_mbist",
  1035					      "unipro_tx_sym",
  1036					      "unipro_rx_sym0",
  1037					      "unipro_rx_sym1",
  1038					      "unipro_sys",
  1039					      "unipro_phy_sap",
  1040					      "phy_top_ahb_s_bus",
  1041					      "ufshci_ufs",
  1042					      "ufshci_aes",
  1043					      "ufshci_ufs_ahb",
  1044					      "ufshci_aes_axi";
  1045	
  1046				freq-table-hz = <26000000 208000000>,
  1047						<0 0>,
  1048						<0 0>,
  1049						<0 0>,
  1050						<0 0>,
  1051						<0 0>,
  1052						<0 0>,
  1053						<0 0>,
  1054						<0 0>,
  1055						<0 0>,
  1056						<0 0>,
  1057						<0 0>,
  1058						<0 0>,
  1059						<0 0>,
  1060						<0 0>;
  1061	
  1062				vcc-supply = <&mt6359_vemc_1_ldo_reg>;
  1063				vccq-supply = <&mt6359_vio18_ldo_reg>;
  1064				vccq2-supply = <&mt6359_vufs_ldo_reg>;
  1065	
  1066				resets = <&ufscfgpdn_rst 0>,
  1067					 <&ufscfgpdn_rst 1>,
  1068					 <&ufscfgpdn_rst 2>;
  1069	
  1070				reset-names = "unipro_rst",
  1071					      "crypto_rst",
  1072					      "hci_rst";
  1073	
  1074				mediatek,ufs-disable-mcq;
  1075				mediatek,ufs-rtff-mtcmos;
  1076				mediatek,ufs-broken-vcc;
  1077	
  1078				status = "disabled";
  1079			};
  1080	
  1081			ufscfg_ao_reg_clk: syscon@112b8000 {
  1082				compatible = "mediatek,mt8189-ufscfg-ao", "syscon", "simple-mfd";
  1083				reg = <0 0x112b8000 0 0x1000>;
  1084				#clock-cells = <1>;
  1085	
  1086				ufscfgao_rst: reset-controller {
  1087					compatible = "ti,syscon-reset";
  1088					#reset-cells = <1>;
  1089	
  1090					ti,reset-bits = <
  1091						/* ufs mphy reset */
  1092						/* 8: mphy */
  1093						0x48  8 0x4c  8 0 0
  1094						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1095					>;
  1096				};
  1097			};
  1098	
  1099			ufscfg_pdn_reg_clk: syscon@112bb000 {
  1100				compatible = "mediatek,mt8189-ufscfg-pdn", "syscon", "simple-mfd";
  1101				reg = <0 0x112bb000 0 0x1000>;
  1102				#clock-cells = <1>;
  1103	
  1104				ufscfgpdn_rst: reset-controller {
  1105					compatible = "ti,syscon-reset";
  1106					#reset-cells = <1>;
  1107	
  1108					ti,reset-bits = <
  1109						/* ufs ufschi/crypto/unipro reset */
  1110						/* 0: unipro */
  1111						0x48  0 0x4c  0 0 0
  1112						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1113						/* 1: ufs-crypto */
  1114						0x48  1 0x4c  1 0 0
  1115						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1116						/* 2: ufshci */
  1117						0x48  2 0x4c  2 0 0
  1118						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1119					>;
  1120				};
  1121			};
  1122	
  1123			pcie: pcie@112f0000 {
  1124				compatible = "mediatek,mt8189-pcie",
  1125					     "mediatek,mt8192-pcie";
  1126				reg = <0 0x112f0000 0 0x4000>;
  1127				device_type = "pci";
  1128				reg-names = "pcie-mac";
  1129				linux,pci-domain = <0>;
  1130				#address-cells = <3>;
  1131				#size-cells = <2>;
  1132				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH 0>;
  1133				bus-range = <0x00 0xff>;
  1134				ranges = <0x82000000 0 0x30000000
  1135					  0x0 0x30000000 0 0x04000000>;
  1136	
  1137				clocks = <&pericfg_ao_clk CLK_PERAO_AXI>,
  1138					 <&pericfg_ao_clk CLK_PERAO_AHB_APB>,
  1139					 <&pericfg_ao_clk CLK_PERAO_TL>,
  1140					 <&pericfg_ao_clk CLK_PERAO_REF>,
  1141					 <&topckgen_clk CLK_TOP_F26M_CK_EN>;
  1142	
  1143				phys = <&pcieport PHY_TYPE_PCIE>;
  1144				phy-names = "pcie-phy";
  1145				power-domains = <&scpsys MT8189_POWER_DOMAIN_PCIE>;
  1146	
  1147				#interrupt-cells = <1>;
  1148				interrupt-map-mask = <0 0 0 7>;
  1149				interrupt-map = <0 0 0 1 &pcie_intc 0>,
  1150						<0 0 0 2 &pcie_intc 1>,
  1151						<0 0 0 3 &pcie_intc 2>,
  1152						<0 0 0 4 &pcie_intc 3>;
  1153	
  1154				status = "disabled";
  1155	
  1156				pcie_intc: interrupt-controller {
  1157					interrupt-controller;
  1158					#address-cells = <0>;
  1159					#interrupt-cells = <1>;
  1160				};
  1161			};
  1162	
  1163			u3phy3: t-phy@11b00000 {
  1164				compatible = "mediatek,mt8189-tphy",
  1165					     "mediatek,generic-tphy-v2";
  1166				reg = <0 0x11b00000 0 0x700>;
  1167				#address-cells = <2>;
  1168				#size-cells = <2>;
  1169				ranges;
  1170	
  1171				u2port3: usb-phy@11b00000 {
  1172					reg = <0 0x11b00000 0 0x700>;
  1173					clocks = <&topckgen_clk CLK_TOP_USB2_PHY_RF_P3_EN>;
  1174					clock-names = "ref";
  1175					#phy-cells = <1>;
  1176				};
  1177	
  1178				u3port3: usb-phy@11b00700 {
  1179					reg = <0 0x11b00700 0 0x700>;
  1180					clocks = <&topckgen_clk CLK_TOP_USB2_PHY_RF_P3_EN>;
  1181					clock-names = "ref";
  1182					#phy-cells = <1>;
  1183				};
  1184			};
  1185	
> 1186			u2phy4: xs-phy@11b10000 {
  1187				compatible = "mediatek,mt8189-xsphy", "mediatek,xsphy";
  1188				#address-cells = <2>;
  1189				#size-cells = <2>;
  1190				ranges;
  1191	
  1192				u2port4: usb-phy@11b10000 {
  1193					reg = <0 0x11b10000 0 0x700>;
  1194					clocks = <&topckgen_clk CLK_TOP_USB2_PHY_RF_P4_EN>;
  1195					clock-names = "ref";
  1196					#phy-cells = <1>;
  1197				};
  1198			};
  1199	
  1200			i2c2: i2c@11b20000 {
  1201				compatible = "mediatek,mt8188-i2c";
  1202				reg = <0 0x11b20000 0 0x1000>,
  1203				      <0 0x11300400 0 0x80>;
  1204				interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH 0>;
  1205				clocks = <&imp_iic_wrap_ws_clk CLK_IMPWS_I2C2>,
  1206					 <&pericfg_ao_clk CLK_PERAO_DMA_B>;
  1207				clock-names = "main", "dma";
  1208				clock-div = <1>;
  1209				#address-cells = <1>;
  1210				#size-cells = <0>;
  1211				status = "disabled";
  1212			};
  1213	
  1214			imp_iic_wrap_ws_clk: syscon@11b21000 {
  1215				compatible = "mediatek,mt8189-iic-wrap-ws", "syscon";
  1216				reg = <0 0x11b21000 0 0x1000>;
  1217				#clock-cells = <1>;
  1218			};
  1219	
  1220			mipi_tx_config0: mipi-tx-config@11b40000 {
  1221				compatible = "mediatek,mt8189-mipi-tx";
  1222				reg = <0 0x11b40000 0 0x1000>;
  1223				clocks = <&clk26m>;
  1224				#clock-cells = <0>;
  1225				#phy-cells = <0>;
  1226				clock-output-names = "mipi_tx0_pll";
  1227				dispsys-sel-offset = <0x170 0x174>;
  1228				status = "disabled";
  1229			};
  1230	
  1231			dp_tx: dp-tx@11b60000  {
  1232				compatible = "mediatek,mt8189-dp-tx";
  1233				reg = <0 0x11b60000 0 0x5000>,
  1234				      <0 0x11c10000 0 0x1500>,
  1235				      <0 0x10011018 0 0x4>,
  1236				      <0 0x1c001e80 0 0x4>;
  1237				power-domains = <&scpsys MT8189_POWER_DOMAIN_DP_TX>,
  1238						<&scpsys MT8189_POWER_DOMAIN_SSUSB>;
  1239				power-domain-names = "pd_dp_tx", "pd_dp_phy";
  1240				interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH 0>;
  1241				#phy-cells = <0>;
  1242				clocks = <&topckgen_clk CLK_TOP_DP_SEL>,
  1243					 <&clk26m>;
  1244				clock-names = "mux_dp", "ck_26m";
  1245			};
  1246	
  1247			edp_tx: edp-tx@11b70000 {
  1248				compatible = "mediatek,mt8189-edp-tx";
  1249				reg = <0 0x11b70000 0 0x14000>,
  1250				      <0 0x11e10000 0 0x1500>;
  1251				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH 0>;
  1252				power-domains = <&scpsys MT8189_POWER_DOMAIN_EDP_TX_DORMANT>;
  1253				clocks = <&topckgen_clk CLK_TOP_EDP_SEL>;
  1254				clock-names = "power";
  1255			};
  1256	
  1257			i2c0: i2c@11c20000 {
  1258				compatible = "mediatek,mt8188-i2c";
  1259				reg = <0 0x11c20000 0 0x1000>,
  1260				      <0 0x11300200 0 0x80>;
  1261				interrupts = <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH 0>;
  1262				clocks = <&imp_iic_wrap_e_clk CLK_IMPE_I2C0>,
  1263					 <&pericfg_ao_clk CLK_PERAO_DMA_B>;
  1264				clock-names = "main", "dma";
  1265				clock-div = <1>;
  1266				#address-cells = <1>;
  1267				#size-cells = <0>;
  1268				status = "disabled";
  1269			};
  1270	
  1271			i2c1: i2c@11c21000 {
  1272				compatible = "mediatek,mt8188-i2c";
  1273				reg = <0 0x11c21000 0 0x1000>,
  1274				      <0 0x11300300 0 0x80>;
  1275				interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>;
  1276				clocks = <&imp_iic_wrap_e_clk CLK_IMPE_I2C1>,
  1277					 <&pericfg_ao_clk CLK_PERAO_DMA_B>;
  1278				clock-names = "main", "dma";
  1279				clock-div = <1>;
  1280				#address-cells = <1>;
  1281				#size-cells = <0>;
  1282				status = "disabled";
  1283			};
  1284	
  1285			imp_iic_wrap_e_clk: syscon@11c22000 {
  1286				compatible = "mediatek,mt8189-iic-wrap-e", "syscon";
  1287				reg = <0 0x11c22000 0 0x1000>;
  1288				#clock-cells = <1>;
  1289			};
  1290	
  1291			i2c3: i2c@11d70000 {
  1292				compatible = "mediatek,mt8188-i2c";
  1293				#address-cells = <1>;
  1294				#size-cells = <0>;
  1295				reg = <0 0x11d70000 0 0x1000>,
  1296				      <0 0x11300500 0 0x80>;
  1297				interrupts = <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH 0>;
  1298				clocks = <&imp_iic_wrap_s_clk CLK_IMPS_I2C3>,
  1299					 <&pericfg_ao_clk CLK_PERAO_DMA_B>;
  1300				clock-names = "main", "dma";
  1301				clock-div = <1>;
  1302				status = "disabled";
  1303			};
  1304	
  1305			i2c4: i2c@11d71000 {
  1306				compatible = "mediatek,mt8188-i2c";
  1307				reg = <0 0x11d71000 0 0x1000>,
  1308				      <0 0x11300600 0 0x80>;
  1309				interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH 0>;
  1310				clocks = <&imp_iic_wrap_s_clk CLK_IMPS_I2C4>,
  1311					 <&pericfg_ao_clk CLK_PERAO_DMA_B>;
  1312				clock-names = "main", "dma";
  1313				clock-div = <1>;
  1314				#address-cells = <1>;
  1315				#size-cells = <0>;
  1316				status = "disabled";
  1317			};
  1318	
  1319			i2c5: i2c@11d72000 {
  1320				compatible = "mediatek,mt8188-i2c";
  1321				#address-cells = <1>;
  1322				#size-cells = <0>;
  1323				reg = <0 0x11d72000 0 0x1000>,
  1324				      <0 0x11300700 0 0x80>;
  1325				interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
  1326				clocks = <&imp_iic_wrap_s_clk CLK_IMPS_I2C5>,
  1327					 <&pericfg_ao_clk CLK_PERAO_DMA_B>;
  1328				clock-names = "main", "dma";
  1329				clock-div = <1>;
  1330				status = "disabled";
  1331			};
  1332	
  1333			i2c6: i2c@11d73000 {
  1334				compatible = "mediatek,mt8188-i2c";
  1335				#address-cells = <1>;
  1336				#size-cells = <0>;
  1337				reg = <0 0x11d73000 0 0x1000>,
  1338				      <0 0x11300800 0 0x80>;
  1339				interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH 0>;
  1340				clocks = <&imp_iic_wrap_s_clk CLK_IMPS_I2C6>,
  1341					 <&pericfg_ao_clk CLK_PERAO_DMA_B>;
  1342				clock-names = "main", "dma";
  1343				clock-div = <1>;
  1344				status = "disabled";
  1345			};
  1346	
  1347			imp_iic_wrap_s_clk: syscon@11d74000 {
  1348				compatible = "mediatek,mt8189-iic-wrap-s", "syscon";
  1349				reg = <0 0x11d74000 0 0x1000>;
  1350				#clock-cells = <1>;
  1351			};
  1352	
  1353			pciephy: t-phy@11e50700 {
  1354				compatible = "mediatek,mt8189-tphy",
  1355					     "mediatek,generic-tphy-v2";
  1356				#address-cells = <1>;
  1357				#size-cells = <1>;
  1358				ranges = <0x0 0x0 0x11e50700 0x700>;
  1359				power-domains = <&scpsys MT8189_POWER_DOMAIN_PCIE_PHY>;
  1360				status = "disabled";
  1361	
  1362				pcieport: pcie-phy@0 {
  1363					reg = <0 0x700>;
  1364					#phy-cells = <1>;
  1365				};
  1366			};
  1367	
> 1368			u3phy0: xs-phy@11e80000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
