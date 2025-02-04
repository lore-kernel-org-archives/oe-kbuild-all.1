Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F21204C21
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738653275; cv=none; b=iQRlQWqAGPLEHEDAn/G4g36R5M8OaxLJBjITqWbdRvQZgBbOGr+6sleD/1HqJhO4gyuoijmgq1Ql4rE8+Dvt1hB63P0ogeKO/t4SPHeh7uklYPPcJwtkTxuMFN3cyAjt2Zg+RR6I/TpCFvUP8+FshM+GkFPrlaeA8714YSCzpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738653275; c=relaxed/simple;
	bh=a9k+h11JUqKqjm1VF6o2R8SR0qDtYYIHWgFSfbe1plI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/0jHFQa2TqAwkctrY6bgRKcHcOA8ZnzlOxkqYXD/bVsW/L/QAQId6SjfqBwiz+uBqK7HlNNrbK5330vm37dvpdpRNWHQynXsgGodPtl81P7ExRh/PwuHTL/1rp+GMwxEQOhLQ9f/qJgAMhf6czNPJEWO7BfgdIs70XdeSrjAxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbFcYS8o; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbFcYS8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738653271; x=1770189271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a9k+h11JUqKqjm1VF6o2R8SR0qDtYYIHWgFSfbe1plI=;
  b=dbFcYS8oi6qZDI/iReL58hi18JdXm8R7sqpruomV8krOMh9zt1VF6umS
   6AL3we6m1q8bk6P7iX38HCVvLvVP+/rGpBoGqtGUJ/2XzzwASp/lNPGwE
   uXSscT6QqLo15P+knhUu+O724I1GExxAj/R6u5iVIIIPnBeeLKxRQHlkQ
   WnP4gMLcsfxZvM0vHcMOkY0DXERSI03ppq0wl132sAu6YdimJBICzHNXJ
   22JVdcRqPmUYS6CatjaC6DxNx4ZpIDn5trLr+C0BqqI/VCU+hWgYynUnD
   u+KwsPnaxQHqsLzVIvjHt/fPrGznv6A11Qj+K5pyDEt8wzMagQueurDza
   Q==;
X-CSE-ConnectionGUID: oFOnVVeuQL2e7JqyMPGeJw==
X-CSE-MsgGUID: WjBmN2OTSHGDEaUZF4NXVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39321470"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="39321470"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 23:14:28 -0800
X-CSE-ConnectionGUID: DqkGlTqITx2avglIp9QhWw==
X-CSE-MsgGUID: mwNrJ2iNRsiMSCMAUhhw2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="115529299"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2025 23:14:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfD8a-000s8D-1J;
	Tue, 04 Feb 2025 07:14:24 +0000
Date: Tue, 4 Feb 2025 15:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 169/169]
 arch/arm64/boot/dts/mediatek/mt8196.dtsi:2047.35-2053.5: Warning
 (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format
 error, expected "1a350100"
Message-ID: <202502041519.9T02yDWs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   214a5686718f4ddf23fe02a3df2a4b37b05d1ed4
commit: 990c0028a0ae7e53185e8a333c0405bc9b5febcc [169/169] CHROMIUM: arm64: dts: mediatek: mt8196: Add DSP device node
config: arm64-randconfig-004-20250204 (https://download.01.org/0day-ci/archive/20250204/202502041519.9T02yDWs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041519.9T02yDWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041519.9T02yDWs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt6363.dtsi:139.40-141.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@4/mt6363-efuse/mt6363_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:72.40-74.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/second_pmic@5/mt6373-efuse/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:8.25-76.4: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:65.21-67.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:68.19-70.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:71.21-74.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2249.10-2253.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2255.14-2259.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:45.27-52.4: Warning (unit_address_vs_reg): /regulator@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:2047.35-2053.5: Warning (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format error, expected "1a350100"
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:2055.35-2061.5: Warning (simple_bus_reg): /soc/mailbox@1a360000: simple-bus unit address format error, expected "1a360100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:3491.16-3499.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:660.37-685.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:58.8-68.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:74.8-84.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +/1a350100 +2047 arch/arm64/boot/dts/mediatek/mt8196.dtsi

    18	
    19	/ {
    20		compatible = "mediatek,mt8196";
    21		interrupt-parent = <&gic>;
    22		#address-cells = <2>;
    23		#size-cells = <2>;
    24	
    25		aliases {
    26			blender0 = &disp_ovl0_blender0;
    27			blender1 = &disp_ovl0_blender1;
    28			blender2 = &disp_ovl0_blender2;
    29			blender3 = &disp_ovl0_blender3;
    30			blender4 = &disp_ovl0_blender4;
    31			blender5 = &disp_ovl0_blender5;
    32			blender6 = &disp_ovl0_blender6;
    33			blender7 = &disp_ovl0_blender7;
    34			blender8 = &disp_ovl0_blender8;
    35			blender9 = &disp_ovl0_blender9;
    36			blender10 = &disp_ovl1_blender0;
    37			blender11 = &disp_ovl1_blender1;
    38			blender12 = &disp_ovl1_blender2;
    39			blender13 = &disp_ovl1_blender3;
    40			blender14 = &disp_ovl1_blender4;
    41			blender15 = &disp_ovl1_blender5;
    42			blender16 = &disp_ovl1_blender6;
    43			blender17 = &disp_ovl1_blender7;
    44			blender18 = &disp_ovl1_blender8;
    45			blender19 = &disp_ovl1_blender9;
    46			ccorr0 = &disp_ccorr0;
    47			ccorr1 = &disp_ccorr1;
    48			dither0 = &disp_dither0;
    49			dp-intf0 = &dp_intf0;
    50			dp-intf1 = &dp_intf1;
    51			dsc0 = &disp_dsc0;
    52			dsc1 = &disp_dsc1;
    53			dvo0 = &disp_dvo0;
    54			exdma2 = &disp_ovl0_exdma2;
    55			exdma3 = &disp_ovl0_exdma3;
    56			exdma4 = &disp_ovl0_exdma4;
    57			exdma5 = &disp_ovl0_exdma5;
    58			exdma6 = &disp_ovl0_exdma6;
    59			exdma7 = &disp_ovl0_exdma7;
    60			exdma8 = &disp_ovl0_exdma8;
    61			exdma9 = &disp_ovl0_exdma9;
    62			exdma12 = &disp_ovl1_exdma2;
    63			exdma13 = &disp_ovl1_exdma3;
    64			exdma14 = &disp_ovl1_exdma4;
    65			exdma15 = &disp_ovl1_exdma5;
    66			exdma16 = &disp_ovl1_exdma6;
    67			exdma17 = &disp_ovl1_exdma7;
    68			exdma18 = &disp_ovl1_exdma8;
    69			exdma19 = &disp_ovl1_exdma9;
    70			gamma0 = &disp_gamma0;
    71			i2c0 = &i2c0;
    72			i2c1 = &i2c1;
    73			i2c2 = &i2c2;
    74			i2c3 = &i2c3;
    75			i2c4 = &i2c4;
    76			i2c5 = &i2c5;
    77			i2c6 = &i2c6;
    78			i2c7 = &i2c7;
    79			i2c8 = &i2c8;
    80			i2c9 = &i2c9;
    81			i2c10 = &i2c10;
    82			i2c11 = &i2c11;
    83			i2c12 = &i2c12;
    84			i2c13 = &i2c13;
    85			i2c14 = &i2c14;
    86			mdp-rsz0 = &disp_mdp_rsz0;
    87			mmc1 = &mmc1;
    88			mmc2 = &mmc2;
    89			mutex0 = &disp0_mutex;
    90			mutex1 = &disp1_mutex;
    91			mutex2 = &ovl0_mutex;
    92			mutex3 = &ovl1_mutex;
    93			outproc0 = &disp_ovl0_outproc0;
    94			outproc1 = &disp_ovl0_outproc1;
    95			outproc2 = &disp_ovl0_outproc2;
    96			outproc3 = &disp_ovl0_outproc3;
    97			outproc4 = &disp_ovl0_outproc4;
    98			outproc5 = &disp_ovl0_outproc5;
    99			outproc6 = &disp_ovl1_outproc0;
   100			outproc7 = &disp_ovl1_outproc1;
   101			outproc8 = &disp_ovl1_outproc2;
   102			outproc9 = &disp_ovl1_outproc3;
   103			outproc10 = &disp_ovl1_outproc4;
   104			outproc11 = &disp_ovl1_outproc5;
   105			postmask0 = &disp_postmask0;
   106			serial0 = &uart0;
   107			spi0 = &spi0;
   108			spi1 = &spi1;
   109			spi2 = &spi2;
   110			spi3 = &spi3;
   111			spi4 = &spi4;
   112			spi5 = &spi5;
   113			spi6 = &spi6;
   114			spi7 = &spi7;
   115			tdshp0 = &disp_tdshp0;
   116			vdisp-ao = &disp_vdisp_ao_config_clk;
   117		};
   118	
   119		cpus {
   120			#address-cells = <1>;
   121			#size-cells = <0>;
   122	
   123			cpu0: cpu@0 {
   124				device_type = "cpu";
   125				compatible = "arm,cortex-a720";
   126				reg = <0x000>;
   127				performance-domains = <&performance 0>;
   128				enable-method = "psci";
   129				clock-frequency = <2100000000>;
   130				capacity-dmips-mhz = <714>;
   131				cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
   132						   &system_vcore &s2idle>;
   133				i-cache-size = <65536>;
   134				i-cache-line-size = <64>;
   135				i-cache-sets = <256>;
   136				d-cache-size = <65536>;
   137				d-cache-line-size = <64>;
   138				d-cache-sets = <256>;
   139				next-level-cache = <&l2_0>;
   140				#cooling-cells = <2>;
   141			};
   142	
   143			cpu1: cpu@100 {
   144				device_type = "cpu";
   145				compatible = "arm,cortex-a720";
   146				reg = <0x100>;
   147				performance-domains = <&performance 0>;
   148				enable-method = "psci";
   149				clock-frequency = <2100000000>;
   150				capacity-dmips-mhz = <714>;
   151				cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
   152						   &system_vcore &s2idle>;
   153				i-cache-size = <65536>;
   154				i-cache-line-size = <64>;
   155				i-cache-sets = <256>;
   156				d-cache-size = <65536>;
   157				d-cache-line-size = <64>;
   158				d-cache-sets = <256>;
   159				next-level-cache = <&l2_0>;
   160				#cooling-cells = <2>;
   161			};
   162	
   163			cpu2: cpu@200 {
   164				device_type = "cpu";
   165				compatible = "arm,cortex-a720";
   166				reg = <0x200>;
   167				performance-domains = <&performance 0>;
   168				enable-method = "psci";
   169				clock-frequency = <2100000000>;
   170				capacity-dmips-mhz = <714>;
   171				cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
   172						   &system_vcore &s2idle>;
   173				i-cache-size = <65536>;
   174				i-cache-line-size = <64>;
   175				i-cache-sets = <256>;
   176				d-cache-size = <65536>;
   177				d-cache-line-size = <64>;
   178				d-cache-sets = <256>;
   179				next-level-cache = <&l2_0>;
   180				#cooling-cells = <2>;
   181			};
   182	
   183			cpu3: cpu@300 {
   184				device_type = "cpu";
   185				compatible = "arm,cortex-a720";
   186				reg = <0x300>;
   187				performance-domains = <&performance 0>;
   188				enable-method = "psci";
   189				clock-frequency = <2100000000>;
   190				capacity-dmips-mhz = <714>;
   191				cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
   192						   &system_vcore &s2idle>;
   193				i-cache-size = <65536>;
   194				i-cache-line-size = <64>;
   195				i-cache-sets = <256>;
   196				d-cache-size = <65536>;
   197				d-cache-line-size = <64>;
   198				d-cache-sets = <256>;
   199				next-level-cache = <&l2_0>;
   200				#cooling-cells = <2>;
   201			};
   202	
   203			cpu4: cpu@400 {
   204				device_type = "cpu";
   205				compatible = "arm,cortex-x4";
   206				reg = <0x400>;
   207				performance-domains = <&performance 1>;
   208				enable-method = "psci";
   209				clock-frequency = <2800000000>;
   210				capacity-dmips-mhz = <1024>;
   211				cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m
   212						   &system_vcore &s2idle>;
   213				i-cache-size = <65536>;
   214				i-cache-line-size = <64>;
   215				i-cache-sets = <256>;
   216				d-cache-size = <65536>;
   217				d-cache-line-size = <64>;
   218				d-cache-sets = <256>;
   219				next-level-cache = <&l2_1>;
   220				#cooling-cells = <2>;
   221			};
   222	
   223			cpu5: cpu@500 {
   224				device_type = "cpu";
   225				compatible = "arm,cortex-x4";
   226				reg = <0x500>;
   227				performance-domains = <&performance 1>;
   228				enable-method = "psci";
   229				clock-frequency = <2800000000>;
   230				capacity-dmips-mhz = <1024>;
   231				cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m
   232						   &system_vcore &s2idle>;
   233				i-cache-size = <65536>;
   234				i-cache-line-size = <64>;
   235				i-cache-sets = <256>;
   236				d-cache-size = <65536>;
   237				d-cache-line-size = <64>;
   238				d-cache-sets = <256>;
   239				next-level-cache = <&l2_1>;
   240				#cooling-cells = <2>;
   241			};
   242	
   243			cpu6: cpu@600 {
   244				device_type = "cpu";
   245				compatible = "arm,cortex-x4";
   246				reg = <0x600>;
   247				performance-domains = <&performance 1>;
   248				enable-method = "psci";
   249				clock-frequency = <2800000000>;
   250				capacity-dmips-mhz = <1024>;
   251				cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m
   252						   &system_vcore &s2idle>;
   253				i-cache-size = <65536>;
   254				i-cache-line-size = <64>;
   255				i-cache-sets = <256>;
   256				d-cache-size = <65536>;
   257				d-cache-line-size = <64>;
   258				d-cache-sets = <256>;
   259				next-level-cache = <&l2_1>;
   260				#cooling-cells = <2>;
   261			};
   262	
   263			cpu7: cpu@700 {
   264				device_type = "cpu";
   265				compatible = "arm,cortex-x925";
   266				reg = <0x700>;
   267				performance-domains = <&performance 2>;
   268				enable-method = "psci";
   269				clock-frequency = <3600000000>;
   270				capacity-dmips-mhz = <937>;
   271				cpu-idle-states = <&cpuoff_b &clusteroff_b &mcusysoff_b
   272						   &system_vcore &s2idle>;
   273				i-cache-size = <65536>;
   274				i-cache-line-size = <64>;
   275				i-cache-sets = <256>;
   276				d-cache-size = <65536>;
   277				d-cache-line-size = <64>;
   278				d-cache-sets = <256>;
   279				next-level-cache = <&l2_2>;
   280				#cooling-cells = <2>;
   281			};
   282	
   283			cpu-map {
   284				cluster0 {
   285					core0 {
   286						cpu = <&cpu0>;
   287					};
   288					core1 {
   289						cpu = <&cpu1>;
   290					};
   291					core2 {
   292						cpu = <&cpu2>;
   293					};
   294					core3 {
   295						cpu = <&cpu3>;
   296					};
   297				};
   298	
   299				cluster1 {
   300					core0 {
   301						cpu = <&cpu4>;
   302					};
   303					core1 {
   304						cpu = <&cpu5>;
   305					};
   306					core2 {
   307						cpu = <&cpu6>;
   308					};
   309				};
   310	
   311				cluster2 {
   312					core0 {
   313						cpu = <&cpu7>;
   314					};
   315				};
   316			};
   317	
   318			idle-states {
   319				entry-method = "arm,psci";
   320				cpuoff_l: cpuoff-l {
   321					compatible = "arm,idle-state";
   322					arm,psci-suspend-param = <0x00010000>;
   323					local-timer-stop;
   324					entry-latency-us = <97>;
   325					exit-latency-us = <252>;
   326					min-residency-us = <6710>;
   327				};
   328	
   329				cpuoff_m: cpuoff-m {
   330					compatible = "arm,idle-state";
   331					arm,psci-suspend-param = <0x00010000>;
   332					local-timer-stop;
   333					entry-latency-us = <53>;
   334					exit-latency-us = <143>;
   335					min-residency-us = <2120>;
   336				};
   337	
   338				cpuoff_b: cpuoff-b {
   339					compatible = "arm,idle-state";
   340					arm,psci-suspend-param = <0x00010000>;
   341					local-timer-stop;
   342					entry-latency-us = <40>;
   343					exit-latency-us = <107>;
   344					min-residency-us = <2580>;
   345				};
   346	
   347				clusteroff_l: clusteroff-l {
   348					compatible = "arm,idle-state";
   349					arm,psci-suspend-param = <0x01010001>;
   350					local-timer-stop;
   351					entry-latency-us = <109>;
   352					exit-latency-us = <325>;
   353					min-residency-us = <6710>;
   354				};
   355	
   356				clusteroff_m: clusteroff-m {
   357					compatible = "arm,idle-state";
   358					arm,psci-suspend-param = <0x01010001>;
   359					local-timer-stop;
   360					entry-latency-us = <59>;
   361					exit-latency-us = <188>;
   362					min-residency-us = <2120>;
   363				};
   364	
   365				clusteroff_b: clusteroff-b {
   366					compatible = "arm,idle-state";
   367					arm,psci-suspend-param = <0x01010001>;
   368					local-timer-stop;
   369					entry-latency-us = <43>;
   370					exit-latency-us = <138>;
   371					min-residency-us = <2580>;
   372				};
   373	
   374				mcusysoff_l: mcusysoff-l {
   375					compatible = "arm,idle-state";
   376					arm,psci-suspend-param = <0x02010007>;
   377					local-timer-stop;
   378					entry-latency-us = <1357>;
   379					exit-latency-us = <835>;
   380					min-residency-us = <6710>;
   381				};
   382	
   383				mcusysoff_m: mcusysoff-m {
   384					compatible = "arm,idle-state";
   385					arm,psci-suspend-param = <0x02010007>;
   386					local-timer-stop;
   387					entry-latency-us = <1202>;
   388					exit-latency-us = <679>;
   389					min-residency-us = <2120>;
   390				};
   391	
   392				mcusysoff_b: mcusysoff-b {
   393					compatible = "arm,idle-state";
   394					arm,psci-suspend-param = <0x02010007>;
   395					local-timer-stop;
   396					entry-latency-us = <1143>;
   397					exit-latency-us = <611>;
   398					min-residency-us = <2580>;
   399				};
   400	
   401				system_vcore: system-vcore {
   402					compatible = "arm,idle-state";
   403					arm,psci-suspend-param = <0x020100ff>;
   404					local-timer-stop;
   405					entry-latency-us = <940>;
   406					exit-latency-us = <3500>;
   407					min-residency-us = <35200>;
   408				};
   409	
   410				s2idle: s2idle {
   411					compatible = "arm,idle-state";
   412					arm,psci-suspend-param = <0x020180ff>;
   413					local-timer-stop;
   414					entry-latency-us = <10000>;
   415					exit-latency-us = <10000>;
   416					min-residency-us = <4294967295>;
   417				};
   418			};
   419	
   420			l2_0: l2-cache0 {
   421				compatible = "cache";
   422				cache-level = <2>;
   423				cache-size = <524288>;
   424				cache-line-size = <64>;
   425				cache-sets = <2048>;
   426				next-level-cache = <&l3_0>;
   427				cache-unified;
   428			};
   429	
   430			l2_1: l2-cache1 {
   431				compatible = "cache";
   432				cache-level = <2>;
   433				cache-size = <1048576>;
   434				cache-line-size = <64>;
   435				cache-sets = <4096>;
   436				next-level-cache = <&l3_0>;
   437				cache-unified;
   438			};
   439	
   440			l2_2: l2-cache2 {
   441				compatible = "cache";
   442				cache-level = <2>;
   443				cache-size = <2097152>;
   444				cache-line-size = <64>;
   445				cache-sets = <8192>;
   446				next-level-cache = <&l3_0>;
   447				cache-unified;
   448			};
   449	
   450			l3_0: l3-cache {
   451				compatible = "cache";
   452				cache-level = <3>;
   453				cache-size = <12582912>;
   454				cache-line-size = <64>;
   455				cache-sets = <49152>;
   456				cache-unified;
   457			};
   458		};
   459	
   460		clk_ao: clk-ao {
   461			compatible = "simple-bus";
   462			#address-cells = <1>;
   463			#size-cells = <0>;
   464		};
   465	
   466		clkitg: clkitg {
   467			compatible = "simple-bus";
   468			#address-cells = <1>;
   469			#size-cells = <0>;
   470		};
   471	
   472		clocks {
   473			clk_null: clk-null {
   474				compatible = "fixed-clock";
   475				#clock-cells = <0>;
   476				clock-frequency = <0>;
   477			};
   478	
   479			clk32k: clk32k {
   480				compatible = "fixed-clock";
   481				#clock-cells = <0>;
   482				clock-frequency = <32000>;
   483			};
   484	
   485			clk13m: clk13m {
   486				compatible = "fixed-clock";
   487				#clock-cells = <0>;
   488				clock-frequency = <13000000>;
   489			};
   490	
   491			clk26m: clk26m {
   492				compatible = "fixed-clock";
   493				#clock-cells = <0>;
   494				clock-frequency = <26000000>;
   495			};
   496	
   497			/*
   498			 * ulposc: Ultra Low Power Oscillator
   499			 * It is used by soc when the 26Mhz clock is turned
   500			 * off. It also is used by other modules.
   501			 */
   502			ulposc: ulposc {
   503				compatible = "fixed-clock";
   504				#clock-cells = <0>;
   505				clock-frequency = <520000000>;
   506			};
   507	
   508			/*
   509			 * ulposc3: Ultra Low Power Oscillator 3
   510			 * It is used by soc when the 26Mhz clock is turned
   511			 * off. It also is used by other modules.
   512			 */
   513			ulposc3: ulposc3 {
   514				compatible = "fixed-clock";
   515				#clock-cells = <0>;
   516				clock-frequency = <26000000>;
   517			};
   518	
   519			clk104m: clk104m {
   520				compatible = "fixed-clock";
   521				#clock-cells = <0>;
   522				clock-frequency = <104000000>;
   523			};
   524		};
   525	
   526		memory: memory@80000000 {
   527			device_type = "memory";
   528			reg = <0 0x80000000 0 0x40000000>;
   529		};
   530	
   531		pmu_hunter: pmu-hunter {
   532			compatible = "arm,cortex-a720-pmu";
   533			interrupt-parent = <&gic>;
   534			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
   535		};
   536	
   537		pmu_hunter_elp: pmu-hunter-elp {
   538			compatible = "arm,cortex-x4-pmu";
   539			interrupt-parent = <&gic>;
   540			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
   541		};
   542	
   543		pmu_blackhawk: pmu-blackhawk{
   544			compatible = "arm,cortex-x925-pmu";
   545			interrupt-parent = <&gic>;
   546			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
   547		};
   548	
   549		reserved-memory {
   550			#address-cells = <2>;
   551			#size-cells = <2>;
   552			ranges;
   553	
   554			adsp_mem_reserved: adsp-mem-region@90000000 {
   555				compatible = "mediatek,adsp-reserved-memory";
   556				reg = <0 0x90000000 0 0x600000>;
   557				no-map;
   558			};
   559	
   560			afe_dma_mem_reserved: snd-dma-mem-region@90600000 {
   561				compatible = "shared-dma-pool";
   562				reg = <0 0x90600000 0 0x200000>;
   563				no-map;
   564			};
   565	
   566			adsp_dma_mem_reserved: adsp-dma-mem-region@90800000 {
   567				compatible = "shared-dma-pool";
   568				reg = <0 0x90800000 0 0x100000>;
   569				no-map;
   570			};
   571	
   572			vcp_resv_mem: vcp-reserved-memory@a0200000 {
   573				compatible = "mediatek,me-vcp-reserved";
   574				reg = <0 0xa0200000 0 0x01e00000>; /* 30MB */
   575				iommu-addresses = <0 0x00000000 1 0x40000000>; /* 1G */
   576				no-map;
   577			};
   578		};
   579	
   580		timer: timer {
   581			compatible = "arm,armv8-timer";
   582			interrupt-parent = <&gic>;
   583			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
   584					<GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
   585					<GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
   586					<GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
   587			clock-frequency = <13000000>;
   588		};
   589	
   590		psci {
   591			compatible = "arm,psci-1.0";
   592			method = "smc";
   593		};
   594	
   595		soc {
   596			compatible = "simple-bus";
   597			#address-cells = <2>;
   598			#size-cells = <2>;
   599			ranges;
   600			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
   601	
   602			csram_sys: csram-sysram@11bc00 {
   603				reg = <0 0x11bc00 0 0x1400>; /* 5KB */
   604			};
   605	
   606			cpu_mcucfg: mcusys-ao-cfg@c000000 {
   607				reg = <0 0xc000000 0 0x10000>; /* 64KB */
   608			};
   609	
   610			cpu_pll: mcusys-pll1u-top@c030000 {
   611				reg = <0 0xc030000 0 0x1000>; /* 4KB */
   612			};
   613	
   614			ccipll_pll_ctrl_clk: syscon@c1e0000 {
   615				/* TODO: Fix compatible in driver */
   616				compatible = "mediatek,mt8196-ccipll-pll-ctrl", "mediatek,mt8196-ccipll_pll_ctrl", "syscon";
   617				reg = <0 0xc1e0000 0 0x400>;
   618				#clock-cells = <1>;
   619			};
   620	
   621			armpll_ll_pll_ctrl_clk: syscon@c1e0400 {
   622				/* TODO: Fix compatible in driver */
   623				compatible = "mediatek,mt8196-armpll-ll-pll-ctrl", "mediatek,mt8196-armpll_ll_pll_ctrl", "syscon";
   624				reg = <0 0xc1e0400 0 0x400>;
   625				#clock-cells = <1>;
   626			};
   627	
   628			armpll_bl_pll_ctrl_clk: syscon@c1e0800 {
   629				/* TODO: Fix compatible in driver */
   630				compatible = "mediatek,mt8196-armpll-bl-pll-ctrl", "mediatek,mt8196-armpll_bl_pll_ctrl", "syscon";
   631				reg = <0 0xc1e0800 0 0x400>;
   632				#clock-cells = <1>;
   633			};
   634	
   635			armpll_b_pll_ctrl_clk: syscon@c1e0c00 {
   636				/* TODO: Fix compatible in driver */
   637				compatible = "mediatek,mt8196-armpll-b-pll-ctrl", "mediatek,mt8196-armpll_b_pll_ctrl", "syscon";
   638				reg = <0 0xc1e0c00 0 0x1000>;
   639				#clock-cells = <1>;
   640			};
   641	
   642			ptppll_pll_ctrl_clk: syscon@c1e4000 {
   643				/* TODO: Fix compatible in driver */
   644				compatible = "mediatek,mt8196-ptppll-pll-ctrl", "mediatek,mt8196-ptppll_pll_ctrl", "syscon";
   645				reg = <0 0xc1e4000 0 0x1000>;
   646				#clock-cells = <1>;
   647			};
   648	
   649			performance: performance-controller@c2c0f20 {
   650				compatible = "mediatek,cpufreq-hw";
   651				reg = <0 0xc2c0f20 0 0x120>,
   652				      <0 0xc2c1040 0 0x120>,
   653				      <0 0xc2c1160 0 0x120>;
   654				reg-names = "performance-domain0",
   655					    "performance-domain1",
   656					    "performance-domain2";
   657				#performance-domain-cells = <1>;
   658			};
   659	
   660			gic: interrupt-controller@c400000 {
   661				compatible = "arm,gic-v3";
   662				reg = <0 0xc400000 0 0x40000>, /* distributor */
   663				      <0 0xc440000 0 0x200000>; /* redistributor */
   664				#interrupt-cells = <4>;
   665				#address-cells = <2>;
   666				#size-cells = <2>;
   667				#redistributor-regions = <1>;
   668				interrupt-parent = <&gic>;
   669				interrupt-controller;
   670				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
   671	
   672				ppi-partitions {
   673					ppi_cluster0: interrupt-partition-0 {
   674						affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
   675					};
   676	
   677					ppi_cluster1: interrupt-partition-1 {
   678						affinity = <&cpu4 &cpu5 &cpu6>;
   679					};
   680	
   681					ppi_cluster2: interrupt-partition-2 {
   682						affinity = <&cpu7>;
   683					};
   684				};
   685			};
   686	
   687			cksys_clk: syscon@10000000 {
   688				compatible = "mediatek,mt8196-cksys", "syscon";
   689				reg = <0 0x10000000 0 0x800>;
   690				hw-voter-regmap = <&hwv>;
   691				#clock-cells = <1>;
   692			};
   693	
   694			apmixedsys_clk: syscon@10000800 {
   695				compatible = "mediatek,mt8196-apmixedsys", "syscon";
   696				reg = <0 0x10000800 0 0x1000>;
   697				#clock-cells = <1>;
   698			};
   699	
   700			cksys_gp2_clk: syscon@1000c000 {
   701				compatible = "mediatek,mt8196-cksys-gp2", "syscon";
   702				reg = <0 0x1000c000 0 0x800>;
   703				mm-hw-ccf-regmap = <&mm_hwv>;
   704				#clock-cells = <1>;
   705			};
   706	
   707			apmixedsys_gp2_clk: syscon@1000c800 {
   708				/* TODO: Fix compatible in driver */
   709				compatible = "mediatek,mt8196-apmixedsys-gp2", "mediatek,mt8196-apmixedsys_gp2", "syscon";
   710				reg = <0 0x1000c800 0 0x1000>;
   711				#clock-cells = <1>;
   712			};
   713	
   714			ifr_bus: syscon@1002c000 {
   715				/* TODO: Fix compatible in driver */
   716				compatible = "mediatek,mt8196-ifr-bus", "mediatek,mt8196-ifr_bus", "syscon";
   717				reg = <0 0x1002c000 0 0x1000>;
   718			};
   719	
   720			pio: pinctrl@1002d000 {
   721				compatible = "mediatek,mt8196-pinctrl";
   722				reg = <0 0x1002d000 0 0x1000>,
   723				      <0 0x12000000 0 0x1000>,
   724				      <0 0x12020000 0 0x1000>,
   725				      <0 0x12040000 0 0x1000>,
   726				      <0 0x12060000 0 0x1000>,
   727				      <0 0x12820000 0 0x1000>,
   728				      <0 0x12840000 0 0x1000>,
   729				      <0 0x12860000 0 0x1000>,
   730				      <0 0x13000000 0 0x1000>,
   731				      <0 0x13020000 0 0x1000>,
   732				      <0 0x13040000 0 0x1000>,
   733				      <0 0x130f0000 0 0x1000>,
   734				      <0 0x13110000 0 0x1000>,
   735				      <0 0x13800000 0 0x1000>,
   736				      <0 0x13820000 0 0x1000>,
   737				      <0 0x13860000 0 0x1000>,
   738				      <0 0x12080000 0 0x1000>,
   739				      <0 0x12880000 0 0x1000>,
   740				      <0 0x13080000 0 0x1000>,
   741				      <0 0x13880000 0 0x1000>,
   742				      <0 0x1c54a000 0 0x1000>;
   743				reg-names = "iocfg0",
   744					    "iocfg_rt",
   745					    "iocfg_rm1",
   746					    "iocfg_rm2",
   747					    "iocfg_rb",
   748					    "iocfg_bm1",
   749					    "iocfg_bm2",
   750					    "iocfg_bm3",
   751					    "iocfg_lt",
   752					    "iocfg_lm1",
   753					    "iocfg_lm2",
   754					    "iocfg_lb1",
   755					    "iocfg_lb2",
   756					    "iocfg_tm1",
   757					    "iocfg_tm2",
   758					    "iocfg_tm3",
   759					    "eint-e",
   760					    "eint-s",
   761					    "eint-w",
   762					    "eint-n",
   763					    "eint-c";
   764				gpio-controller;
   765				#gpio-cells = <2>;
   766				gpio-ranges = <&pio 0 0 271>;
   767				interrupt-controller;
   768				interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH 0>;
   769				#interrupt-cells = <2>;
   770			};
   771	
   772			devapc_apinfra_dramc: devapc@102f3000 {
   773				compatible = "mediatek,mt8196-devapc";
   774				reg = <0 0x102f3000 0 0x1000>;
   775				vio-idx-num = <61>;
   776				interrupts = <GIC_SPI 870 IRQ_TYPE_LEVEL_HIGH 0>;
   777			};
   778	
   779			devapc_apinfra_emi: devapc@10613000 {
   780				compatible = "mediatek,mt8196-devapc";
   781				reg = <0 0x10613000 0 0x1000>;
   782				vio-idx-num = <149>;
   783				interrupts = <GIC_SPI 869 IRQ_TYPE_LEVEL_HIGH 0>;
   784			};
   785	
   786			devapc_apinfra_big4: devapc@10693000 {
   787				compatible = "mediatek,mt8196-devapc";
   788				reg = <0 0x10693000 0 0x1000>;
   789				vio-idx-num = <89>;
   790				interrupts = <GIC_SPI 863 IRQ_TYPE_LEVEL_HIGH 0>;
   791			};
   792	
   793			i2c5: i2c@120a0000 {
   794				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   795				reg = <0 0x120a0000 0 0x20000>,
   796				      <0 0x16400000 0 0x10000>;
   797				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
   798				clocks = <&imp_iic_wrap_e_clk CLK_IMPE_I2C5_I2C>,
   799					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   800				clock-names = "main", "dma";
   801				clock-div = <1>;
   802				#address-cells = <1>;
   803				#size-cells = <0>;
   804	
   805				status = "disabled";
   806			};
   807	
   808			imp_iic_wrap_e_clk: syscon@120c0000 {
   809				/* TODO: Fix compatible in driver */
   810				compatible = "mediatek,mt8196-imp-iic-wrap-e", "mediatek,mt8196-imp_iic_wrap_e", "syscon";
   811				reg = <0 0x120c0000 0 0x1000>;
   812				#clock-cells = <1>;
   813			};
   814	
   815			mipi_tx_config0: mipi-tx-config@130b0000 {
   816				compatible = "mediatek,mt8196-mipi-tx";
   817				reg = <0 0x130b0000 0 0x1000>;
   818				clocks = <&clk26m>;
   819				#clock-cells = <0>;
   820				#phy-cells = <0>;
   821				clock-output-names = "mipi_tx0_pll";
   822			};
   823	
   824			i2c0: i2c@13130000 {
   825				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   826				reg = <0 0x13130000 0 0x20000>,
   827				      <0 0x16370000 0 0x10000>;
   828				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
   829				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C0_I2C>,
   830					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   831				clock-names = "main", "dma";
   832				clock-div = <1>;
   833				#address-cells = <1>;
   834				#size-cells = <0>;
   835	
   836				status = "disabled";
   837			};
   838	
   839			i2c3: i2c@13150000 {
   840				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   841				reg = <0 0x13150000 0 0x20000>,
   842				      <0 0x163c0000 0 0x10000>;
   843				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH 0>;
   844				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C3_I2C>,
   845					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   846				clock-names = "main", "dma";
   847				clock-div = <1>;
   848				#address-cells = <1>;
   849				#size-cells = <0>;
   850	
   851				status = "disabled";
   852			};
   853	
   854			i2c6: i2c@13170000 {
   855				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   856				reg = <0 0x13170000 0 0x20000>,
   857				      <0 0x16410000 0 0x10000>;
   858				interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
   859				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C6_I2C>,
   860					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   861				clock-names = "main", "dma";
   862				clock-div = <1>;
   863				#address-cells = <1>;
   864				#size-cells = <0>;
   865	
   866				status = "disabled";
   867			};
   868	
   869			i2c10: i2c@13190000 {
   870				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   871				reg = <0 0x13190000 0 0x20000>,
   872				      <0 0x164b0000 0 0x10000>;
   873				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
   874				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C10_I2C>,
   875					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   876				clock-names = "main", "dma";
   877				clock-div = <1>;
   878				#address-cells = <1>;
   879				#size-cells = <0>;
   880	
   881				status = "disabled";
   882			};
   883	
   884			imp_iic_wrap_w_clk: syscon@131b0000 {
   885				/* TODO: Fix compatible in driver */
   886				compatible = "mediatek,mt8196-imp-iic-wrap-w", "mediatek,mt8196-imp_iic_wrap_w", "syscon";
   887				reg = <0 0x131b0000 0 0x1000>;
   888				#clock-cells = <1>;
   889			};
   890	
   891			efuse: efuse@13260000 {
   892				compatible = "mediatek,mt8196-efuse", "mediatek,efuse";
   893				reg = <0 0x13260000 0 0x1000>;
   894				#address-cells = <1>;
   895				#size-cells = <1>;
   896			};
   897	
   898			i2c1: i2c@13930000 {
   899				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   900				reg = <0 0x13930000 0 0x80000>,
   901				      <0 0x16380000 0 0x10000>;
   902				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH 0>;
   903				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C1_I2C>,
   904					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   905				clock-names = "main", "dma";
   906				clock-div = <1>;
   907				#address-cells = <1>;
   908				#size-cells = <0>;
   909	
   910				status = "disabled";
   911			};
   912	
   913			i2c2: i2c@139b0000 {
   914				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   915				reg = <0 0x139b0000 0 0x80000>,
   916				      <0 0x16390000 0 0x30000>;
   917				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH 0>;
   918				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C2_I2C>,
   919					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   920				clock-names = "main", "dma";
   921				clock-div = <1>;
   922				#address-cells = <1>;
   923				#size-cells = <0>;
   924	
   925				status = "disabled";
   926			};
   927	
   928			i2c4: i2c@13a30000 {
   929				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   930				reg = <0 0x13a30000 0 0x80000>,
   931				      <0 0x163d0000 0 0x30000>;
   932				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
   933				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C4_I2C>,
   934					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   935				clock-names = "main", "dma";
   936				clock-div = <1>;
   937				#address-cells = <1>;
   938				#size-cells = <0>;
   939	
   940				status = "disabled";
   941			};
   942	
   943			i2c7: i2c@13ab0000 {
   944				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   945				reg = <0 0x13ab0000 0 0x80000>,
   946				      <0 0x16420000 0 0x30000>;
   947				interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
   948				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C7_I2C>,
   949					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   950				clock-names = "main", "dma";
   951				clock-div = <1>;
   952				#address-cells = <1>;
   953				#size-cells = <0>;
   954	
   955				status = "disabled";
   956			};
   957	
   958			i2c8: i2c@13b30000 {
   959				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   960				reg = <0 0x13b30000 0 0x80000>,
   961				      <0 0x16450000 0 0x30000>;
   962				interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH 0>;
   963				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C8_I2C>,
   964					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   965				clock-names = "main", "dma";
   966				clock-div = <1>;
   967				#address-cells = <1>;
   968				#size-cells = <0>;
   969	
   970				status = "disabled";
   971			};
   972	
   973			i2c9: i2c@13bb0000 {
   974				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   975				reg = <0 0x13bb0000 0 0x80000>,
   976				      <0 0x16480000 0 0x30000>;
   977				interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH 0>;
   978				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C9_I2C>,
   979					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   980				clock-names = "main", "dma";
   981				clock-div = <1>;
   982				#address-cells = <1>;
   983				#size-cells = <0>;
   984	
   985				status = "disabled";
   986			};
   987	
   988			imp_iic_wrap_n_clk: syscon@13c30000 {
   989				/* TODO: Fix compatible in driver */
   990				compatible = "mediatek,mt8196-imp-iic-wrap-n", "mediatek,mt8196-imp_iic_wrap_n", "syscon";
   991				reg = <0 0x13c30000 0 0x1000>;
   992				hw-voter-regmap = <&hwv>;
   993				#clock-cells = <1>;
   994			};
   995	
   996			devapc_apinfra_io_intf: devapc@140a0000 {
   997				compatible = "mediatek,mt8196-devapc";
   998				reg = <0 0x140a0000 0 0x1000>;
   999				vio-idx-num = <8>;
  1000				interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH 0>;
  1001			};
  1002	
  1003			devapc_apinfra_mem_intf: devapc@140c0000 {
  1004				compatible = "mediatek,mt8196-devapc";
  1005				reg = <0 0x140c0000 0 0x1000>;
  1006				vio-idx-num = <7>;
  1007				interrupts = <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH 0>;
  1008			};
  1009	
  1010			devapc_apinfra_slb: devapc@140e0000 {
  1011				compatible = "mediatek,mt8196-devapc";
  1012				reg = <0 0x140e0000 0 0x1000>;
  1013				vio-idx-num = <14>;
  1014				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH 0>;
  1015			};
  1016	
  1017			apifrbus_ao_mem_reg_clk: syscon@14126000 {
  1018				/* TODO: Fix compatible in driver */
  1019				compatible = "mediatek,mt8196-apifrbus-ao-mem-reg", "mediatek,mt8196-apifrbus_ao_mem_reg", "syscon";
  1020				reg = <0 0x14126000 0 0x1000>;
  1021				#clock-cells = <1>;
  1022			};
  1023	
  1024			devapc_apinfra_mem: devapc@14130000 {
  1025				compatible = "mediatek,mt8196-devapc";
  1026				reg = <0 0x14130000 0 0x1000>;
  1027				vio-idx-num = <13>;
  1028				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH 0>;
  1029			};
  1030	
  1031			devapc_apinfra_mem_ctrl: devapc@14131000 {
  1032				compatible = "mediatek,mt8196-devapc";
  1033				reg = <0 0x14131000 0 0x1000>;
  1034				vio-idx-num = <23>;
  1035				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH 0>;
  1036			};
  1037	
  1038			infracfg@14136000 {
  1039				compatible = "mediatek,infracfg";
  1040				reg = <0 0x14136000 0 0x1000>;
  1041			};
  1042	
  1043			devapc_apinfra_int: devapc@142f4000 {
  1044				compatible = "mediatek,mt8196-devapc";
  1045				reg = <0 0x142f4000 0 0x1000>;
  1046				vio-idx-num = <26>;
  1047				interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH 0>;
  1048			};
  1049	
  1050			devapc_apinfra_io_ctrl: devapc@14400000 {
  1051				compatible = "mediatek,mt8196-devapc";
  1052				reg = <0 0x14400000 0 0x1000>;
  1053				vio-idx-num = <10>;
  1054				interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH 0>;
  1055			};
  1056	
  1057			devapc_apinfra_io: devapc@14401000 {
  1058				compatible = "mediatek,mt8196-devapc";
  1059				reg = <0 0x14401000 0 0x1000>;
  1060				vio-idx-num = <230>;
  1061				interrupts = <GIC_SPI 867 IRQ_TYPE_LEVEL_HIGH 0>;
  1062			};
  1063	
  1064			hwv: syscon@14500000 {
  1065				compatible = "mediatek,mt8196-hwv", "syscon";
  1066				reg = <0 0x14500000 0 0x3000>;
  1067			};
  1068	
  1069			devapc_apinfra_mmu: devapc@14800000 {
  1070				compatible = "mediatek,mt8196-devapc";
  1071				reg = <0 0x14800000 0 0x1000>;
  1072				vio-idx-num = <20>;
  1073				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH 0>;
  1074			};
  1075	
  1076			uart0: serial@16000000 {
  1077				compatible = "mediatek,mt6577-uart";
  1078				reg = <0 0x16000000 0 0x1000>;
  1079				interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH 0>;
  1080				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART0_BCLK_UART>;
  1081				clock-names = "baud", "bus";
  1082	
  1083				status = "disabled";
  1084			};
  1085	
  1086			uart1: serial@16010000 {
  1087				compatible = "mediatek,mt6577-uart";
  1088				reg = <0 0x16010000 0 0x1000>;
  1089				interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH 0>;
  1090				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART1_BCLK_UART>;
  1091				clock-names = "baud", "bus";
  1092	
  1093				status = "disabled";
  1094			};
  1095	
  1096			uart2: serial@16020000 {
  1097				compatible = "mediatek,mt6577-uart";
  1098				reg = <0 0x16020000 0 0x1000>;
  1099				interrupts = <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH 0>;
  1100				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART2_BCLK_UART>;
  1101				clock-names = "baud", "bus";
  1102	
  1103				status = "disabled";
  1104			};
  1105	
  1106			uart3: serial@16030000 {
  1107				compatible = "mediatek,mt6985-uart";
  1108				reg = <0 0x16030000 0 0x1000>;
  1109				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH 0>,
  1110					     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH 0>;    /* uart3 wakeup irq */
  1111				clocks = <&clk104m>, <&pericfg_ao_clk CLK_PERAO_UART3_BCLK_UART>;
  1112				clock-names = "baud", "bus";
  1113	
  1114				status = "disabled";
  1115			};
  1116	
  1117			disp_pwm0: disp-pwm0@160b0000 {
  1118				compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
  1119				reg = <0 0x160b0000 0 0x1000>;
  1120				interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
  1121				#pwm-cells = <2>;
  1122				clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
  1123				clock-names = "main";
  1124				status = "disabled";
  1125			};
  1126	
  1127			disp_pwm1: disp-pwm1@160c0000 {
  1128				compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
  1129				reg = <0 0x160c0000 0 0x1000>;
  1130				#pwm-cells = <2>;
  1131				clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
  1132				clock-names = "main";
  1133				status = "disabled";
  1134			};
  1135	
  1136			spi0: spi@16110000 {
  1137				compatible = "mediatek,mt8196-spi";
  1138				reg = <0 0x16110000 0 0x100>;
  1139				interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
  1140				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1141					<&cksys_clk CLK_CK_SPI0_BCLK_SEL>,
  1142					<&pericfg_ao_clk CLK_PERAO_SPI0_BCLK_SPI>;
  1143				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1144				#address-cells = <1>;
  1145				#size-cells = <0>;
  1146				mediatek,pad-select = <0>;
  1147	
  1148				status = "disabled";
  1149			};
  1150	
  1151			spi1: spi@16130000 {
  1152				compatible = "mediatek,mt8196-spi";
  1153				reg = <0 0x16130000 0 0x100>;
  1154				interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
  1155				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1156					<&cksys_clk CLK_CK_SPI1_BCLK_SEL>,
  1157					<&pericfg_ao_clk CLK_PERAO_SPI1_BCLK_SPI>;
  1158				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1159				#address-cells = <1>;
  1160				#size-cells = <0>;
  1161				mediatek,pad-select = <0>;
  1162	
  1163				status = "disabled";
  1164			};
  1165	
  1166			spi2: spi@16150000 {
  1167				compatible = "mediatek,mt8196-spi";
  1168				reg = <0 0x16150000 0 0x100>;
  1169				interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
  1170				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1171					<&cksys_clk CLK_CK_SPI2_BCLK_SEL>,
  1172					<&pericfg_ao_clk CLK_PERAO_SPI2_BCLK_SPI>;
  1173				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1174				#address-cells = <1>;
  1175				#size-cells = <0>;
  1176				mediatek,pad-select = <0>;
  1177	
  1178				status = "disabled";
  1179			};
  1180	
  1181			spi3: spi@16170000 {
  1182				compatible = "mediatek,mt8196-spi";
  1183				reg = <0 0x16170000 0 0x100>;
  1184				interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
  1185				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1186					<&cksys_clk CLK_CK_SPI3_BCLK_SEL>,
  1187					<&pericfg_ao_clk CLK_PERAO_SPI3_BCLK_SPI>;
  1188				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1189				#address-cells = <1>;
  1190				#size-cells = <0>;
  1191				mediatek,pad-select = <0>;
  1192	
  1193				status = "disabled";
  1194			};
  1195	
  1196			spi4: spi@16190000 {
  1197				compatible = "mediatek,mt8196-spi";
  1198				reg = <0 0x16190000 0 0x100>;
  1199				interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
  1200				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1201					<&cksys_clk CLK_CK_SPI4_BCLK_SEL>,
  1202					<&pericfg_ao_clk CLK_PERAO_SPI4_BCLK_SPI>;
  1203				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1204				#address-cells = <1>;
  1205				#size-cells = <0>;
  1206				mediatek,pad-select = <0>;
  1207	
  1208				status = "disabled";
  1209			};
  1210	
  1211			spi5: spi@161b0000 {
  1212				compatible = "mediatek,mt8196-spi";
  1213				reg = <0 0x161b0000 0 0x100>;
  1214				interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>;
  1215				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1216					<&cksys_clk CLK_CK_SPI5_BCLK_SEL>,
  1217					<&pericfg_ao_clk CLK_PERAO_SPI5_BCLK_SPI>;
  1218				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1219				#address-cells = <1>;
  1220				#size-cells = <0>;
  1221				mediatek,pad-select = <0>;
  1222	
  1223				status = "disabled";
  1224			};
  1225	
  1226			spi6: spi@161d0000 {
  1227				compatible = "mediatek,mt8196-spi";
  1228				reg = <0 0x161d0000 0 0x100>;
  1229				interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
  1230				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1231					<&cksys_clk CLK_CK_SPI6_BCLK_SEL>,
  1232					<&pericfg_ao_clk CLK_PERAO_SPI6_BCLK_SPI>;
  1233				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1234				#address-cells = <1>;
  1235				#size-cells = <0>;
  1236				mediatek,pad-select = <1>;
  1237	
  1238				status = "disabled";
  1239			};
  1240	
  1241			spi7: spi@161f0000 {
  1242				compatible = "mediatek,mt8196-spi";
  1243				reg = <0 0x161f0000 0 0x100>;
  1244				interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH 0>;
  1245				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1246					<&cksys_clk CLK_CK_SPI7_BCLK_SEL>,
  1247					<&pericfg_ao_clk CLK_PERAO_SPI7_BCLK_SPI>;
  1248				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1249				#address-cells = <1>;
  1250				#size-cells = <0>;
  1251				mediatek,pad-select = <0>;
  1252	
  1253				status = "disabled";
  1254			};
  1255	
  1256			i2c11: i2c@16200000 {
  1257				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1258				reg = <0 0x16200000 0 0x40000>,
  1259				      <0 0x164c0000 0 0x10000>;
  1260				interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH 0>;
  1261				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C11_I2C>,
  1262					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1263				clock-names = "main", "dma";
  1264				clock-div = <1>;
  1265				#address-cells = <1>;
  1266				#size-cells = <0>;
  1267	
  1268				status = "disabled";
  1269			};
  1270	
  1271			i2c12: i2c@16240000 {
  1272				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1273				reg = <0 0x16240000 0 0x40000>,
  1274				      <0 0x164d0000 0 0x20000>;
  1275				interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH 0>;
  1276				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C12_I2C>,
  1277					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1278				clock-names = "main", "dma";
  1279				clock-div = <1>;
  1280				#address-cells = <1>;
  1281				#size-cells = <0>;
  1282	
  1283				status = "disabled";
  1284			};
  1285	
  1286			i2c13: i2c@16280000 {
  1287				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1288				reg = <0 0x16280000 0 0x40000>,
  1289				      <0 0x164f0000 0 0x10000>;
  1290				interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
  1291				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C13_I2C>,
  1292					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1293				clock-names = "main", "dma";
  1294				clock-div = <1>;
  1295				#address-cells = <1>;
  1296				#size-cells = <0>;
  1297	
  1298				status = "disabled";
  1299			};
  1300	
  1301			i2c14: i2c@162c0000 {
  1302				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1303				reg = <0 0x162c0000 0 0x40000>,
  1304				      <0 0x16500000 0 0x10000>;
  1305				interrupts = <GIC_SPI 900 IRQ_TYPE_LEVEL_HIGH 0>;
  1306				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C14_I2C>,
  1307					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1308				clock-names = "main", "dma";
  1309				clock-div = <1>;
  1310				#address-cells = <1>;
  1311				#size-cells = <0>;
  1312	
  1313				status = "disabled";
  1314			};
  1315	
  1316			imp_iic_wrap_c_clk: syscon@16300000 {
  1317				/* TODO: Fix compatible in driver */
  1318				compatible = "mediatek,mt8196-imp-iic-wrap-c", "mediatek,mt8196-imp_iic_wrap_c", "syscon";
  1319				reg = <0 0x16300000 0 0x1000>;
  1320				#clock-cells = <1>;
  1321			};
  1322	
  1323			mmc1: mmc@16310000 {
  1324				compatible = "mediatek,mt8196-mmc";
  1325				reg = <0 0x16310000 0 0x1000>,
  1326				      <0 0x12a10000 0 0x1000>;
  1327				interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH 0>;
  1328				clocks = <&cksys_clk CLK_CK_MSDC30_1_SEL>,
  1329						<&pericfg_ao_clk CLK_PERAO_MSDC1_AXI_MSDC1>,
  1330						<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_MSDC1>,
  1331						<&pericfg_ao_clk CLK_PERAO_MSDC1_MSDC_SRC_MSDC1>,
  1332						<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_WRAP_MSDC1>;
  1333				clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
  1334	
  1335				status = "disabled";
  1336			};
  1337	
  1338			mmc2: mmc@16320000 {
  1339				compatible = "mediatek,mt8196-mmc";
  1340				reg = <0 0x16320000 0 0x1000>,
  1341				      <0 0x138a0000 0 0x1000>;
  1342				interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>;
  1343				clocks = <&cksys_clk CLK_CK_MSDC30_2_SEL>,
  1344						<&pericfg_ao_clk CLK_PERAO_MSDC2_AXI_MSDC2>,
  1345						<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_MSDC2>,
  1346						<&pericfg_ao_clk CLK_PERAO_MSDC2_MSDC_SRC_MSDC2>,
  1347						<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_WRAP_MSDC2>;
  1348				clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
  1349	
  1350				status = "disabled";
  1351			};
  1352	
  1353			pwm: pwm@16330000 {
  1354				compatible = "mediatek,pwm";
  1355				reg = <0 0x16330000 0 0x1000>;
  1356				interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH 0>;
  1357	
  1358				status = "disabled";
  1359			};
  1360	
  1361			nor_flash: spi@16340000 {
  1362				compatible = "mediatek,mt8196-nor",
  1363					     "mediatek,mt8186-nor";
  1364				reg = <0 0x16340000 0 0x1000>;
  1365				clocks = <&cksys_clk CLK_CK_SFLASH_SEL>,
  1366					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_FLASH_FLASHIF>,
  1367					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_DRAM_FLASHIF>,
  1368					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_AXI_FLASHIF>,
  1369					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_BCLK_FLASHIF>,
  1370					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_27M_FLASHIF>;
  1371				clock-names = "spi", "sf", "axi", "axi_s", "bclk", "27m";
  1372				assigned-clocks = <&cksys_clk CLK_CK_SFLASH_SEL>;
  1373				assigned-clock-parents = <&cksys_clk CLK_CK_UNIVPLL_D6_D8>;
  1374				interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>;
  1375				#address-cells = <1>;
  1376				#size-cells = <0>;
  1377				status = "disabled";
  1378			};
  1379	
  1380			pericfg_ao_clk: syscon@16640000 {
  1381				/* TODO: Fix compatible in driver */
  1382				compatible = "mediatek,mt8196-pericfg-ao", "mediatek,mt8196-pericfg_ao", "syscon";
  1383				reg = <0 0x16640000 0 0x1000>;
  1384				hw-voter-regmap = <&hwv>;
  1385				#clock-cells = <1>;
  1386			};
  1387	
  1388			devapc_peri: devapc@16670000 {
  1389				compatible = "mediatek,mt8196-devapc";
  1390				reg = <0 0x16670000 0 0x1000>;
  1391				vio-idx-num = <204>;
  1392				interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
  1393			};
  1394	
  1395			xhci0: usb@16700000 {
  1396				compatible = "mediatek,mtk-xhci";
  1397				reg = <0 0x16700000 0 0x1000>,
  1398				      <0 0x16703e00 0 0x0100>;
  1399				reg-names = "mac", "ippc";
  1400				interrupts-extended = <&gic GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH 0>,
  1401						      <&pio 273 IRQ_TYPE_LEVEL_LOW>;
  1402				interrupt-names = "host","wakeup";
  1403				phys = <&u2port0 PHY_TYPE_USB2>,
  1404				       <&u3port0 PHY_TYPE_USB3>;
  1405				#address-cells = <2>;
  1406				#size-cells = <2>;
  1407				clocks = <&vlp_cksys_clk CLK_VLP_CK_USB_TOP_SEL>,
  1408					 <&vlp_cksys_clk CLK_VLP_CK_USB_XHCI_SEL>,
  1409					 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
  1410				clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
  1411				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P0>;
  1412				mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 107>;
  1413				wakeup-source;
  1414				status = "disabled";
  1415			};
  1416	
  1417			xhci1: usb1@16710000 {
  1418				compatible = "mediatek,mtk-xhci";
  1419				reg = <0 0x16710000 0 0x1000>,
  1420				      <0 0x16713e00 0 0x0100>;
  1421				reg-names = "mac", "ippc";
  1422				interrupts-extended = <&gic GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH 0>,
  1423						      <&pio 276 IRQ_TYPE_LEVEL_LOW>;
  1424				interrupt-names = "host","wakeup";
  1425				phys = <&u2port1 PHY_TYPE_USB2>;
  1426				clocks = <&cksys_clk CLK_CK_USB_TOP_1P_SEL>,
  1427					 <&cksys_clk CLK_CK_USB_XHCI_1P_SEL>,
  1428					 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
  1429				clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
  1430				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P1>;
  1431				mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 108>;
  1432				wakeup-source;
  1433				status = "disabled";
  1434			};
  1435	
  1436			u2phy0: usb-phy0@16730000 {
  1437				compatible = "mediatek,xsphy";
  1438				ranges = <0x0 0x0 0x16730000 0x700>;
  1439				#address-cells = <1>;
  1440				#size-cells = <1>;
  1441				status = "disabled";
  1442	
  1443				u2port0: usb2-phy0@0 {
  1444					reg = <0x0 0x400>;
  1445					clocks = <&clk26m>;
  1446					clock-names = "ref";
  1447					#phy-cells = <1>;
  1448					mediatek,discth = <10>;
  1449				};
  1450			};
  1451	
  1452			u2phy1: usb-phy1@16740000 {
  1453				compatible = "mediatek,xsphy";
  1454				ranges = <0x0 0x0 0x16740000 0x700>;
  1455				#address-cells = <1>;
  1456				#size-cells = <1>;
  1457				status = "disabled";
  1458	
  1459				u2port1: usb2-phy1@0 {
  1460					reg = <0x0 0x400>;
  1461					clocks = <&clk26m>;
  1462					clock-names = "ref";
  1463					#phy-cells = <1>;
  1464					mediatek,discth = <10>;
  1465				};
  1466			};
  1467	
  1468			u3phy0: usb3-phy0@16773000 {
  1469				compatible = "mediatek,xsphy";
  1470				ranges;
  1471				reg = <0 0x16773000 0 0x200>;
  1472				#address-cells = <2>;
  1473				#size-cells = <2>;
  1474				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
  1475				status = "disabled";
  1476	
  1477				u3port0: usb3-phy0@16773400 {
  1478					reg = <0 0x16773400 0 0x500>;
  1479					clocks = <&clk26m>;
  1480					clock-names = "ref";
  1481					#phy-cells = <1>;
  1482				};
  1483			};
  1484	
  1485			usbwkcfg_ao_clk: syscon@167a0000 {
  1486				compatible = "mediatek,mt8196-usbwkcfg-ao", "syscon";
  1487				reg = <0 0x167a0000 0 0x1000>;
  1488			};
  1489	
  1490			ufshci: ufshci@16810000 {
  1491				compatible = "mediatek,mt8183-ufshci";
  1492				reg = <0 0x16810000 0 0x2a00>;
  1493	
  1494				interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH 0>,
  1495					     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH 0>,
  1496					     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>,
  1497					     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>,
  1498					     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH 0>,
  1499					     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH 0>,
  1500					     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH 0>,
  1501					     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH 0>,
  1502					     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH 0>;
  1503				clocks =
  1504						<&cksys_clk CLK_CK_SEL>,
  1505						<&cksys_clk CLK_CK_MAINPLL_D4_D2>,
  1506						<&cksys_clk CLK_CK_UNIVPLL_D5>,
  1507						<&cksys_clk CLK_CK_AES_UFSFDE_SEL>,
  1508						<&cksys_clk CLK_CK_UNIVPLL_D6>,
  1509						<&cksys_clk CLK_CK_MAINPLL_D4>,
  1510						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_TX_SYM_UFS>,
  1511						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM0_UFS>,
  1512						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM1_UFS>,
  1513						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SYS_UFS>,
  1514						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SAP_UFS>,
  1515						<&ufscfg_ao_clk CLK_UFSAO_PHY_SAP_UFS>,
  1516						<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_UFS_UFS>,
  1517						<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_AES_UFS>;
  1518				clock-names =
  1519						"ufs_sel",
  1520						"ufs_sel_min_src",
  1521						"ufs_sel_max_src",
  1522						"crypt_mux",
  1523						"crypt_lp",
  1524						"crypt_perf",
  1525						"unipro_tx_sym",
  1526						"unipro_rx_sym0",
  1527						"unipro_rx_sym1",
  1528						"unipro_sys",
  1529						"unipro_sap",
  1530						"ufs_phy_sap",
  1531						"ufshci_ufs",
  1532						"ufshci_aes";
  1533				freq-table-hz =
  1534						<273000000 499200000>,
  1535						<0 0>,
  1536						<0 0>,
  1537						<0 0>,
  1538						<0 0>,
  1539						<0 0>,
  1540						<0 0>,
  1541						<0 0>,
  1542						<0 0>,
  1543						<0 0>,
  1544						<0 0>,
  1545						<0 0>,
  1546						<0 0>,
  1547						<0 0>;
  1548				/* for clock scaling bind vcore */
  1549	
  1550				/* 0.65V for clock scale up */
  1551				boost-crypt-vcore-min = <650000>;
  1552				vcc-supply = <&mt6363_vemc>;
  1553				vccq-supply = <&mt6363_vufs12>;
  1554				resets =	<&ufscfgao_rst 1>,
  1555						<&ufscfgao_rst 2>,
  1556						<&ufscfgao_rst 3>;
  1557				reset-names =	"unipro_rst",
  1558						"crypto_rst",
  1559						"hci_rst";
  1560	
  1561				/*
  1562				 * Control mtcmos with rtff flow by ufs driver,
  1563				 * Instead of scpsys by PM flow.
  1564				 */
  1565				mediatek,ufs-rtff-mtcmos;
  1566				mediatek,ufs-boost-crypt;
  1567				mediatek,ufs-pmc-via-fastauto;
  1568			};
  1569	
  1570			ufscfg_ao_sec_clk: syscon@16890000 {
  1571				/* TODO: Fix compatible in driver */
  1572				compatible = "mediatek,mt8196-ufscfg-ao-sec", "mediatek,mt8196-ufscfg_ao_sec", "syscon";
  1573				reg = <0 0x16890000 0 0x1000>;
  1574				#clock-cells = <1>;
  1575			};
  1576	
  1577			ufscfg_ao_clk: syscon@168a0000 {
  1578				/* TODO: Fix compatible in driver */
  1579				compatible = "mediatek,mt8196-ufscfg-ao", "mediatek,mt8196-ufscfg_ao", "syscon";
  1580				reg = <0 0x168a0000 0 0x1000>;
  1581				#clock-cells = <1>;
  1582	
  1583				ufscfgao_rst: reset-controller {
  1584					compatible = "ti,syscon-reset";
  1585					#reset-cells = <1>;
  1586	
  1587					ti,reset-bits = <
  1588						/* ufs mphy/ufschi/crypto/unipro reset */
  1589						/* 0: mphy */
  1590						0x48   8 0x4c   8 0 0
  1591						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1592						/* 1: unipro */
  1593						0x148  0 0x14c  0 0 0
  1594						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1595						/* 2: ufs-crypto */
  1596						0x148  1 0x14c  1 0 0
  1597						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1598						/* 3: ufshci */
  1599						0x148  2 0x14c  2 0 0
  1600						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1601						>;
  1602				};
  1603			};
  1604	
  1605			pciephy0: phy@16900000 {
  1606				compatible = "mediatek,mt8196-pcie-phy";
  1607				reg = <0 0x16900000 0 0x10000>,
  1608				      <0 0x16920000 0 0x10000>;
  1609				reg-names = "sif", "ckm";
  1610	
  1611				clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_MCU_BUS_PCIE>,
  1612					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_PEXTP_REF_PCIE>;
  1613				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY0>;
  1614	
  1615				num-lanes = <1>;
  1616				#phy-cells = <0>;
  1617				status = "disabled";
  1618			};
  1619	
  1620			pcie0: pcie@16910000 {
  1621				compatible = "mediatek,mt8196-pcie";
  1622				device_type = "pci";
  1623				reg = <0 0x16910000 0 0x4000>;
  1624				reg-names = "pcie-mac";
  1625				#address-cells = <3>;
  1626				#size-cells = <2>;
  1627				interrupts = <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH 0>;
  1628				bus-range = <0x00 0xff>;
  1629				linux,pci-domain = <0>;
  1630				pextpcfg = <&pextp0cfg_ao_clk>;
  1631				ranges = <0x82000000 0 0x50000000 0x0 0x50000000 0 0x8000000>;
  1632	
  1633				clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_PL_P_PCIE>,
  1634					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_TL_PCIE>,
  1635					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_REF_PCIE>,
  1636					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AXI_250_PCIE>,
  1637					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AHB_APB_PCIE>,
  1638					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_VLP_AO_P0_LP_PCIE>;
  1639				clock-names = "pl_250m", "tl_26m", "peri_26m",
  1640					      "peri_mem", "bus", "low_power";
  1641				assigned-clocks = <&cksys_clk CLK_CK_TL_SEL>;
  1642				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  1643	
  1644				resets = <&pextp0ao_rst 0>, <&pextp0ao_rst 1>;
  1645				reset-names = "mac", "phy";
  1646				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC0>;
  1647	
  1648				phys = <&pciephy0>;
  1649				phy-names = "pcie-phy";
  1650	
  1651				status = "disabled";
  1652	
  1653				#interrupt-cells = <1>;
  1654				interrupt-map-mask = <0 0 0 7>;
  1655				interrupt-map = <0 0 0 1 &pcie_intc0 0>,
  1656						<0 0 0 2 &pcie_intc0 1>,
  1657						<0 0 0 3 &pcie_intc0 2>,
  1658						<0 0 0 4 &pcie_intc0 3>;
  1659	
  1660				pcie_intc0: interrupt-controller {
  1661					interrupt-controller;
  1662					#address-cells = <0>;
  1663					#interrupt-cells = <1>;
  1664				};
  1665			};
  1666	
  1667			pciephy1: phy@16930000 {
  1668				compatible = "mediatek,mt8196-pcie-phy";
  1669				reg = <0 0x16930000 0 0x10000>,
  1670				      <0 0x16950000 0 0x10000>;
  1671				reg-names = "sif", "ckm";
  1672	
  1673				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_MCU_BUS_PCIE>,
  1674					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_PEXTP_REF_PCIE>;
  1675				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY1>;
  1676	
  1677				num-lanes = <2>;
  1678				#phy-cells = <0>;
  1679	
  1680				status = "disabled";
  1681			};
  1682	
  1683			pcie1: pcie@16940000 {
  1684				compatible = "mediatek,mt8196-pcie";
  1685				device_type = "pci";
  1686				reg = <0 0x16940000 0 0x4000>;
  1687				reg-names = "pcie-mac";
  1688				#address-cells = <3>;
  1689				#size-cells = <2>;
  1690				interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH 0>;
  1691				bus-range = <0x00 0xff>;
  1692				linux,pci-domain = <1>;
  1693				pextpcfg = <&pextp1cfg_ao_clk>;
  1694				ranges = <0x82000000 0 0x58000000 0x0 0x58000000 0 0x18000000>;
  1695	
  1696				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_PL_P_PCIE>,
  1697					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_TL_PCIE>,
  1698					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_REF_PCIE>,
  1699					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AXI_250_PCIE>,
  1700					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AHB_APB_PCIE>,
  1701					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P1_LP_PCIE>;
  1702				clock-names = "pl_250m", "tl_26m", "peri_26m",
  1703					      "peri_mem", "bus", "low_power";
  1704				assigned-clocks = <&cksys_clk CLK_CK_TL_P1_SEL>;
  1705				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  1706	
  1707				resets = <&pextp1ao_rst 0>, <&pextp1ao_rst 1>;
  1708				reset-names = "mac", "phy";
  1709				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC1>;
  1710	
  1711				phys = <&pciephy1>;
  1712				phy-names = "pcie-phy";
  1713	
  1714				status = "disabled";
  1715	
  1716				#interrupt-cells = <1>;
  1717				interrupt-map-mask = <0 0 0 7>;
  1718				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
  1719						<0 0 0 2 &pcie_intc1 1>,
  1720						<0 0 0 3 &pcie_intc1 2>,
  1721						<0 0 0 4 &pcie_intc1 3>;
  1722	
  1723				pcie_intc1: interrupt-controller {
  1724					interrupt-controller;
  1725					#address-cells = <0>;
  1726					#interrupt-cells = <1>;
  1727				};
  1728			};
  1729	
  1730			pciephy2: phy@16960000 {
  1731				compatible = "mediatek,mt8196-pcie-phy";
  1732				reg = <0 0x16960000 0 0x10000>,
  1733				      <0 0x16980000 0 0x10000>;
  1734				reg-names = "sif", "ckm";
  1735	
  1736				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_MCU_BUS_PCIE>,
  1737					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_PEXTP_REF_PCIE>;
  1738				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY2>;
  1739	
  1740				num-lanes = <1>;
  1741				#phy-cells = <0>;
  1742	
  1743				status = "disabled";
  1744			};
  1745	
  1746			pcie2: pcie@16970000 {
  1747				device_type = "pci";
  1748				compatible = "mediatek,mt8196-pcie";
  1749				reg = <0 0x16970000 0 0x4000>;
  1750				reg-names = "pcie-mac";
  1751				#address-cells = <3>;
  1752				#size-cells = <2>;
  1753				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH 0>;
  1754				bus-range = <0x00 0xff>;
  1755				linux,pci-domain = <2>;
  1756				pextpcfg = <&pextp1cfg_ao_clk>;
  1757				ranges = <0x82000000 0 0x70000000 0x0 0x70000000 0 0x8000000>;
  1758	
  1759				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_PL_P_PCIE>,
  1760					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_TL_PCIE>,
  1761					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_REF_PCIE>,
  1762					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AXI_250_PCIE>,
  1763					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AHB_APB_PCIE>,
  1764					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P2_LP_PCIE>;
  1765				clock-names = "pl_250m", "tl_26m", "peri_26m",
  1766					      "peri_mem", "bus", "low_power";
  1767				assigned-clocks = <&cksys_clk CLK_CK_TL_P2_SEL>;
  1768				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  1769	
  1770				resets = <&pextp1ao_rst 2>, <&pextp1ao_rst 3>;
  1771				reset-names = "mac", "phy";
  1772				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC2>;
  1773	
  1774				phys = <&pciephy2>;
  1775				phy-names = "pcie-phy";
  1776	
  1777				status = "disabled";
  1778	
  1779				#interrupt-cells = <1>;
  1780				interrupt-map-mask = <0 0 0 7>;
  1781				interrupt-map = <0 0 0 1 &pcie_intc2 0>,
  1782						<0 0 0 2 &pcie_intc2 1>,
  1783						<0 0 0 3 &pcie_intc2 2>,
  1784						<0 0 0 4 &pcie_intc2 3>;
  1785	
  1786				pcie_intc2: interrupt-controller {
  1787					interrupt-controller;
  1788					#address-cells = <0>;
  1789					#interrupt-cells = <1>;
  1790				};
  1791			};
  1792	
  1793			pextp0cfg_ao_clk: syscon@169b0000 {
  1794				/* TODO: Fix compatible in driver */
  1795				compatible = "mediatek,mt8196-pextp0cfg-ao", "mediatek,mt8196-pextp0cfg_ao", "syscon", "simple-mfd";
  1796				reg = <0 0x169b0000 0 0x1000>;
  1797				#clock-cells = <1>;
  1798	
  1799				pextp0ao_rst: reset-controller {
  1800					compatible = "ti,syscon-reset";
  1801					#reset-cells = <1>;
  1802	
  1803					ti,reset-bits = <
  1804						/* 0: PCIe0 MAC reset */
  1805						0x8  0 0xc  0 0 0
  1806						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1807						/* 1: PCIe0 PHY reset */
  1808						0x8  1 0xc  1 0 0
  1809						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1810						>;
  1811				};
  1812			};
  1813	
  1814			pextp1cfg_ao_clk: syscon@169e0000 {
  1815				/* TODO: Fix compatible in driver */
  1816				compatible = "mediatek,mt8196-pextp1cfg-ao", "mediatek,mt8196-pextp1cfg_ao", "syscon", "simple-mfd";
  1817				reg = <0 0x169e0000 0 0x1000>;
  1818				#clock-cells = <1>;
  1819	
  1820				pextp1ao_rst: reset-controller {
  1821					compatible = "ti,syscon-reset";
  1822					#reset-cells = <1>;
  1823	
  1824					ti,reset-bits = <
  1825						/* 0: PCIe1 MAC reset */
  1826						0x8  0 0xc  0 0 0
  1827						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1828						/* 1: PCIe1 PHY reset */
  1829						0x8  1 0xc  1 0 0
  1830						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1831						/* 2: PCIe2 MAC reset */
  1832						0x8  8 0xc  8 0 0
  1833						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1834						/* 3: PCIe2 PHY reset */
  1835						0x8  9 0xc  9 0 0
  1836						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1837						>;
  1838				};
  1839			};
  1840	
  1841			ssr_top_clk: syscon@18000000 {
  1842				/* TODO: Fix compatible in driver */
  1843				compatible = "mediatek,mt8196-ssr-top", "mediatek,mt8196-ssr_top", "syscon";
  1844				reg = <0 0x18000000 0 0x1000>;
  1845				hw-voter-regmap = <&hwv>;
  1846				#clock-cells = <1>;
  1847			};
  1848	
  1849			devapc_apinfra_ssr: devapc@180f3000 {
  1850				compatible = "mediatek,mt8196-devapc";
  1851				reg = <0 0x180f3000 0 0x1000>;
  1852				vio-idx-num = <39>;
  1853				interrupts = <GIC_SPI 866 IRQ_TYPE_LEVEL_HIGH 0>;
  1854			};
  1855	
  1856			adsp: adsp@1a000000 {
  1857				compatible = "mediatek,mt8196-dsp";
  1858				reg = <0 0x1a000000 0 0x5000>,
  1859				      <0 0x1a210000 0 0x80000>,
  1860				      <0 0x1a345000 0 0x300>,
  1861				      <0 0x1a00f000 0 0x1000>;
  1862				reg-names = "cfg", "sram", "sec", "bus";
  1863				interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH 0>;
  1864				interrupt-names = "wdt";
  1865				power-domains = <&scpsys MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;
  1866				clocks = <&cksys_clk CLK_CK_ADSP_SEL>,
  1867					 <&cksys_clk CLK_CK_TCK_26M_MX9>,
  1868					 <&cksys_clk CLK_CK_ADSPPLL>;
  1869				clock-names = "clk_top_adsp_sel",
  1870					      "clk_top_clk26m",
  1871					      "clk_top_adsppll";
  1872				mbox-names = "rx", "tx";
  1873				mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
  1874				status = "disabled";
  1875			};
  1876	
  1877			devapc_adsp: devapc@1a019000 {
  1878				compatible = "mediatek,mt8196-devapc";
  1879				reg = <0 0x1a019000 0 0x1000>;
  1880				vio-idx-num = <54>;
  1881				interrupts = <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH 0>;
  1882			};
  1883	
  1884			afe_clk: syscon@1a110000 {
  1885				compatible = "mediatek,mt8196-audiosys", "syscon";
  1886				reg = <0 0x1a110000 0 0x1000>;
  1887				#clock-cells = <1>;
  1888			};
  1889	
  1890			afe: mt8196-afe-pcm@1a110000 {
  1891				compatible = "mediatek,mt8196-sound";
  1892				reg = <0 0x1a110000 0 0x9000>;
  1893				interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
  1894				cksys = <&cksys_clk>;
  1895				vlpcksys = <&vlp_cksys_clk>;
  1896				power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
  1897				clocks = <&afe_clk CLK_AFE_AUDIO_HOPPING_AFE>,
  1898					<&afe_clk CLK_AFE_AUDIO_F26M_AFE>,
  1899					<&afe_clk CLK_AFE_UL0_ADC_AFE>,
  1900					<&afe_clk CLK_AFE_UL0_ADC_HIRES_AFE>,
  1901					<&afe_clk CLK_AFE_UL1_ADC_AFE>,
  1902					<&afe_clk CLK_AFE_UL1_ADC_HIRES_AFE>,
  1903					<&afe_clk CLK_AFE_APLL1_AFE>,
  1904					<&afe_clk CLK_AFE_APLL2_AFE>,
  1905					<&afe_clk CLK_AFE_APLL_TUNER1_AFE>,
  1906					<&afe_clk CLK_AFE_APLL_TUNER2_AFE>,
  1907					<&vlp_cksys_clk CLK_VLP_CK_AUD_INTBUS_SEL>,
  1908					<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN1_SEL>,
  1909					<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN2_SEL>,
  1910					<&vlp_cksys_clk CLK_VLP_CK_AUDIO_H_SEL>,
  1911					<&vlp_cksys_clk CLK_VLP_CK_CLKSQ>,
  1912					<&cksys_clk CLK_CK_MAINPLL_D4_D4>,
  1913					<&cksys_clk CLK_CK_AUD_1_SEL>,
  1914					<&cksys_clk CLK_CK_APLL1>,
  1915					<&cksys_clk CLK_CK_AUD_2_SEL>,
  1916					<&cksys_clk CLK_CK_APLL2>,
  1917					<&cksys_clk CLK_CK_APLL1_D4>,
  1918					<&cksys_clk CLK_CK_APLL2_D4>,
  1919					<&cksys_clk CLK_CK_APLL_I2SIN0_MCK_SEL>,
  1920					<&cksys_clk CLK_CK_APLL_I2SIN1_MCK_SEL>,
  1921					<&cksys_clk CLK_CK_APLL_FMI2S_MCK_SEL>,
  1922					<&cksys_clk CLK_CK_APLL_TDMOUT_MCK_SEL>,
  1923					<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN0>,
  1924					<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN1>,
  1925					<&cksys_clk CLK_CK_APLL12_CK_DIV_FMI2S>,
  1926					<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_M>,
  1927					<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_B>,
  1928					<&cksys_clk CLK_CK_ADSP_SEL>,
  1929					<&cksys_clk CLK_CK_TCK_26M_MX9>;
  1930	
  1931				clock-names = "aud_hopping_clk",
  1932					"aud_f26m_clk",
  1933					"aud_ul0_adc_clk",
  1934					"aud_ul0_adc_hires_clk",
  1935					"aud_ul1_adc_clk",
  1936					"aud_ul1_adc_hires_clk",
  1937					"aud_apll1_clk",
  1938					"aud_apll2_clk",
  1939					"aud_apll_tuner1_clk",
  1940					"aud_apll_tuner2_clk",
  1941					"vlp_mux_audio_int",
  1942					"vlp_mux_aud_eng1",
  1943					"vlp_mux_aud_eng2",
  1944					"vlp_mux_audio_h",
  1945					"vlp_clk26m_clk",
  1946					"ck_mainpll_d4_d4",
  1947					"ck_mux_aud_1",
  1948					"ck_apll1_ck",
  1949					"ck_mux_aud_2",
  1950					"ck_apll2_ck",
  1951					"ck_apll1_d4",
  1952					"ck_apll2_d4",
  1953					"ck_i2sin0_m_sel",
  1954					"ck_i2sin1_m_sel",
  1955					"ck_fmi2s_m_sel",
  1956					"ck_tdmout_m_sel",
  1957					"ck_apll12_div_i2sin0",
  1958					"ck_apll12_div_i2sin1",
  1959					"ck_apll12_div_fmi2s",
  1960					"ck_apll12_div_tdmout_m",
  1961					"ck_apll12_div_tdmout_b",
  1962					"ck_adsp_sel",
  1963					"ck_clk26m_clk";
  1964				pinctrl-names = "aud-clk-mosi-off",
  1965					"aud-clk-mosi-on",
  1966					"aud-dat-mosi-off",
  1967					"aud-dat-mosi-on",
  1968					"aud-dat-mosi-ch34-off",
  1969					"aud-dat-mosi-ch34-on",
  1970					"aud-dat-miso0-off",
  1971					"aud-dat-miso0-on",
  1972					"aud-dat-miso1-off",
  1973					"aud-dat-miso1-on",
  1974					"aud-gpio-i2sin0-off",
  1975					"aud-gpio-i2sin0-on",
  1976					"aud-gpio-i2sout0-off",
  1977					"aud-gpio-i2sout0-on",
  1978					"aud-gpio-i2sin1-off",
  1979					"aud-gpio-i2sin1-on",
  1980					"aud-gpio-i2sout1-off",
  1981					"aud-gpio-i2sout1-on",
  1982					"aud-gpio-i2sin4-off",
  1983					"aud-gpio-i2sin4-on",
  1984					"aud-gpio-i2sout4-off",
  1985					"aud-gpio-i2sout4-on",
  1986					"aud-gpio-i2sin6-off",
  1987					"aud-gpio-i2sin6-on",
  1988					"aud-gpio-i2sout6-off",
  1989					"aud-gpio-i2sout6-on",
  1990					"aud-dat-miso-only-off",
  1991					"aud-dat-miso-only-on",
  1992					"aud-gpio-ap-dmic-off",
  1993					"aud-gpio-ap-dmic-on",
  1994					"aud-gpio-ap-dmic1-off",
  1995					"aud-gpio-ap-dmic1-on",
  1996					"aud-gpio-i2sin3-off",
  1997					"aud-gpio-i2sin3-on",
  1998					"aud-gpio-i2sout3-off",
  1999					"aud-gpio-i2sout3-on";
  2000	
  2001				pinctrl-0 = <&aud_clk_mosi_off>;
  2002				pinctrl-1 = <&aud_clk_mosi_on>;
  2003				pinctrl-2 = <&aud_dat_mosi_off>;
  2004				pinctrl-3 = <&aud_dat_mosi_on>;
  2005				pinctrl-4 = <&aud_dat_mosi_ch34_off>;
  2006				pinctrl-5 = <&aud_dat_mosi_ch34_on>;
  2007				pinctrl-6 = <&aud_dat_miso0_off>;
  2008				pinctrl-7 = <&aud_dat_miso0_on>;
  2009				pinctrl-8 = <&aud_dat_miso1_off>;
  2010				pinctrl-9 = <&aud_dat_miso1_on>;
  2011				pinctrl-10 = <&aud_gpio_i2sin0_off>;
  2012				pinctrl-11 = <&aud_gpio_i2sin0_on>;
  2013				pinctrl-12 = <&aud_gpio_i2sout0_off>;
  2014				pinctrl-13 = <&aud_gpio_i2sout0_on>;
  2015				pinctrl-14 = <&aud_gpio_i2sin1_off>;
  2016				pinctrl-15 = <&aud_gpio_i2sin1_on>;
  2017				pinctrl-16 = <&aud_gpio_i2sout1_off>;
  2018				pinctrl-17 = <&aud_gpio_i2sout1_on>;
  2019				pinctrl-18 = <&aud_gpio_i2sin4_off>;
  2020				pinctrl-19 = <&aud_gpio_i2sin4_on>;
  2021				pinctrl-20 = <&aud_gpio_i2sout4_off>;
  2022				pinctrl-21 = <&aud_gpio_i2sout4_on>;
  2023				pinctrl-22 = <&aud_gpio_i2sin6_off>;
  2024				pinctrl-23 = <&aud_gpio_i2sin6_on>;
  2025				pinctrl-24 = <&aud_gpio_i2sout6_off>;
  2026				pinctrl-25 = <&aud_gpio_i2sout6_on>;
  2027				pinctrl-26 = <&aud_dat_miso_only_off>;
  2028				pinctrl-27 = <&aud_dat_miso_only_on>;
  2029				pinctrl-28 = <&aud_gpio_ap_dmic_off>;
  2030				pinctrl-29 = <&aud_gpio_ap_dmic_on>;
  2031				pinctrl-30 = <&aud_gpio_ap_dmic1_off>;
  2032				pinctrl-31 = <&aud_gpio_ap_dmic1_on>;
  2033				pinctrl-32 = <&aud_gpio_i2sin3_off>;
  2034				pinctrl-33 = <&aud_gpio_i2sin3_on>;
  2035				pinctrl-34 = <&aud_gpio_i2sout3_off>;
  2036				pinctrl-35 = <&aud_gpio_i2sout3_on>;
  2037	
  2038				/* Only for ETDM in/out 4 */
  2039				etdm-out-ch = <2>;
  2040				etdm-in-ch = <2>;
  2041				etdm-out-sync = <0>; /* 0: disable; 1: enable */
  2042				etdm-in-sync = <1>; /* 0: disable; 1: enable */
  2043				etdm-ip-mode = <0>; /* 0: One IP multi-channel 1: Multi-IP 2-channel */
  2044				status = "disabled";
  2045			};
  2046	
> 2047			adsp_mailbox0: mailbox@1a350000 {
  2048				compatible = "mediatek,mt8196-adsp-mbox",
  2049					     "mediatek,mt8186-adsp-mbox";
  2050				reg = <0 0x1a350100 0 0x1000>;
  2051				interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH 0>;
  2052				#mbox-cells = <0>;
  2053			};
  2054	
> 2055			adsp_mailbox1: mailbox@1a360000 {
  2056				compatible = "mediatek,mt8196-adsp-mbox",
  2057					     "mediatek,mt8186-adsp-mbox";
  2058				reg = <0 0x1a360100 0 0x1000>;
  2059				interrupts = <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH 0>;
  2060				#mbox-cells = <0>;
  2061			};
  2062	
  2063			scpsys: power-controller@1c004000 {
  2064				compatible = "mediatek,mt8196-scpsys-hwv", "syscon";
  2065				reg = <0 0x1c004000 0 0x1000>;
  2066				#power-domain-cells = <1>;
  2067				apifrbus-ao-io-reg-bus = <&ifr_bus>;
  2068				spm = <&scpsys_bus>;
  2069				hw-voter-regmap = <&hwv>;
  2070			};
  2071	
  2072			scpsys_bus: syscon@1c00d000 {
  2073				compatible = "mediatek,mt8196-scpsys-bus", "syscon";
  2074				reg = <0 0x1c00d000 0 0x1000>;
  2075			};
  2076	
  2077			watchdog: watchdog@1c010000 {
  2078				compatible = "mediatek,mt8196-wdt",
  2079						"mediatek,mt6589-wdt",
  2080						"syscon", "simple-mfd";
  2081				reg = <0 0x1c010000 0 0x1000>;
  2082			};
  2083	
  2084			vlp_cksys_clk: syscon@1c016000 {
  2085				/* TODO: Fix compatible in driver */
  2086				compatible = "mediatek,mt8196-vlp-cksys", "mediatek,mt8196-vlp_cksys", "syscon";
  2087				reg = <0 0x1c016000 0 0x1000>;
  2088				hw-voter-regmap = <&hwv>;
  2089				#clock-cells = <1>;
  2090			};
  2091	
  2092			spmi: spmi@1c01a000 {
  2093				compatible = "mediatek,mt8196-spmi";
  2094				reg = <0 0x1c01a000 0 0x0008ff>,
  2095				      <0 0x1c01c000 0 0x000100>,
  2096				      <0 0x1c018000 0 0x0008ff>,
  2097				      <0 0x1c01c800 0 0x000100>;
  2098				reg-names = "pmif", "spmimst","pmif-p","spmimst-p";
  2099				interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>,
  2100						      <&pio 292 IRQ_TYPE_LEVEL_HIGH>,
  2101						      <&gic GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH 0>,
  2102						      <&gic GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH 0>,
  2103						      <&gic GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH 0>,
  2104						      <&gic GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH 0>;
  2105				interrupt-names = "rcs_irq","rcs_irq_p","pmif_irq","spmi_nack_irq","pmif_p_irq","spmi_p_nack_irq";
  2106				interrupt-controller;
  2107				#interrupt-cells = <1>;
  2108				irq-event-en = <0x0 0x0 0x0 0x0 0x0>;
  2109				spmi-dev-mask = <0x85c0>;
  2110				#address-cells = <2>;
  2111				#size-cells = <0>;
  2112			};
  2113	
  2114			devapc_vlp: devapc@1c032000 {
  2115				compatible = "mediatek,mt8196-devapc";
  2116				reg = <0 0x1c032000 0 0x1000>;
  2117				vio-idx-num = <101>;
  2118				interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
  2119			};
  2120	
  2121			systimer: systimer@1c400000 {
  2122				compatible = "mediatek,mt8196-timer",
  2123					     "mediatek,mt6765-timer";
  2124				reg = <0 0x1c400000 0 0x1000>;
  2125				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH 0>;
  2126				clocks = <&clk13m>;
  2127			};
  2128	
  2129			smi_disp_common: smi-comm@30020000 {
  2130				compatible = "mediatek,mt8196-smi-common";
  2131				reg = <0 0x30020000 0 0x1000>;
  2132				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2133				mediatek,smi = <&disp_ssc0_smi_2x1_sub_comm>;
  2134				mediatek,common-id = <0>;
  2135				mediatek,skip-rpm-cb;
  2136			};
  2137	
  2138			smi_mdp_common: smi-comm@30021000 {
  2139				compatible = "mediatek,mt8196-smi-common";
  2140				reg = <0 0x30021000 0 0x1000>;
  2141				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2142				mediatek,smi = <&mdp_ssc4_smi_2x1_sub_comm>;
  2143				mediatek,common-id = <1>;
  2144				mediatek,skip-rpm-cb;
  2145			};
  2146	
  2147			devapc_mminfra: devapc@30040000 {
  2148				compatible = "mediatek,mt8196-devapc";
  2149				reg = <0 0x30040000 0 0x1000>;
  2150				vio-idx-num = <699>;
  2151				interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
  2152			};
  2153	
  2154			gce0: gce@300c0000 {
  2155				compatible = "mediatek,mt8196-gce";
  2156				reg = <0 0x300c0000 0 0x80000>;
  2157				interrupts = <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH 0>;
  2158				#mbox-cells = <2>;
  2159				iommus = <&mm_smmu 199>;
  2160				mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
  2161				mediatek,gce-events = <CMDQ_SYNC_SECURE_THR_EOF>;
  2162			};
  2163	
  2164			gce1: gce@30140000 {
  2165				compatible = "mediatek,mt8196-gce";
  2166				reg = <0 0x30140000 0 0x80000>;
  2167				interrupts = <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH 0>;
  2168				#mbox-cells = <2>;
  2169				iommus = <&mm_smmu 183>;
  2170			};
  2171	
  2172			mm_smmu: iommu@30800000 {
  2173				compatible = "mediatek,mt8196-mm-smmu", "arm,smmu-v3";
  2174				reg = <0 0x30800000 0 0x1e0000>;
  2175				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>;
  2176				interrupt-names = "combined";
  2177				#iommu-cells = <1>;
  2178			};
  2179	
  2180			disp_ssc0_smi_2x1_sub_comm: smi-comm@30a30000 {
  2181				compatible = "mediatek,mt8196-smi-common";
  2182				reg = <0 0x30a30000 0 0x1000>;
  2183				mediatek,common-id = <3>;
  2184				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2185				mediatek,skip-rpm-cb;
  2186			};
  2187	
  2188			disp_ssc1_smi_2x1_sub_comm: smi-comm@30a31000 {
  2189				compatible = "mediatek,mt8196-smi-common";
  2190				reg = <0 0x30a31000 0 0x1000>;
  2191				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2192				mediatek,common-id = <4>;
  2193				mediatek,skip-rpm-cb;
  2194			};
  2195	
  2196			mdp_ssc4_smi_2x1_sub_comm: smi-comm@30a32000 {
  2197				compatible = "mediatek,mt8196-smi-common";
  2198				reg = <0 0x30a32000 0 0x1000>;
  2199				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2200				mediatek,common-id = <5>;
  2201				mediatek,skip-rpm-cb;
  2202			};
  2203	
  2204			mdp_ssc5_smi_2x1_sub_comm: smi-comm@30a33000 {
  2205				compatible = "mediatek,mt8196-smi-common";
  2206				reg = <0 0x30a33000 0 0x1000>;
  2207				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2208				mediatek,common-id = <6>;
  2209				mediatek,skip-rpm-cb;
  2210			};
  2211	
  2212			vcp: vcp@31800000 {
  2213				compatible = "mediatek,vcp";
  2214				reg = <0 0x31800000 0 0x60000>, /* sram */
  2215				      <0 0x31a04000 0 0xa000>, /* cfg */
  2216				      <0 0x31bd0000 0 0x1000>, /* cfg core */
  2217				      <0 0x31b80000 0 0x50000>, /* mbox base */
  2218				      <0 0x31a70020 0 0x100>, /* mbox init */
  2219				      <0 0x1c00091c 0 0x4>; /* vcp rdy */
  2220				reg-names = "sram",
  2221					    "cfg",
  2222					    "cfg_core",
  2223					    "mbox_base",
  2224					    "mbox_init",
  2225					    "vcp_vlp_ao_rsvd7";
  2226	
  2227				interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>,
  2228					     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>,
  2229					     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH 0>,
  2230					     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>,
  2231					     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH 0>,
  2232					     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
  2233				interrupt-names = "wdt",
  2234						  "mbox0",
  2235						  "mbox1",
  2236						  "mbox2",
  2237						  "mbox3",
  2238						  "mbox4";
  2239	
  2240				power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
  2241				iommus = <&mm_smmu 160>;
  2242				memory-region = <&vcp_resv_mem>;
  2243	
  2244				vcp-mem-tbl = <0 0x1a00000>, /* VCP_RTOS_MEM_ID 26MB */
  2245					      <1 0x30000>, /* VDEC_MEM_ID 192KB */
  2246					      <2 0x12000>, /* VENC_MEM_ID 72KB */
  2247					      <3 0x1000>; /* LOGGER 4KB*/
  2248	
  2249				vcp@0 {
  2250					compatible = "mediatek,vcp-core";
  2251					twohart = <1>;
  2252					sram-offset = <0x0>;
  2253				};
  2254	
  2255				vcp@31000 {
  2256					compatible = "mediatek,mmup-core";
  2257					twohart = <0>;
  2258					sram-offset = <0x031000>;
  2259				};
  2260	
  2261				send_table: mtk-send-table {
  2262					mbox0-0 {
  2263						mbox-id = <0>;
  2264						chan-id = <0>;
  2265						msg-size = <18>;
  2266					};
  2267					mbox1-15 {
  2268						mbox-id = <1>;
  2269						chan-id = <15>;
  2270						msg-size = <8>;
  2271					};
  2272					mbox1-16 {
  2273						mbox-id = <1>;
  2274						chan-id = <16>;
  2275						msg-size = <18>;
  2276					};
  2277					mbox1-9 {
  2278						mbox-id = <1>;
  2279						chan-id = <9>;
  2280						msg-size = <2>;
  2281					};
  2282					mbox2-11 {
  2283						mbox-id = <2>;
  2284						chan-id = <11>;
  2285						msg-size = <18>;
  2286					};
  2287					mbox2-2 {
  2288						mbox-id = <2>;
  2289						chan-id = <2>;
  2290						msg-size = <2>;
  2291					};
  2292					mbox2-3 {
  2293						mbox-id = <2>;
  2294						chan-id = <3>;
  2295						msg-size = <3>;
  2296					};
  2297					mbox2-32 {
  2298						mbox-id = <2>;
  2299						chan-id = <32>;
  2300						msg-size = <2>;
  2301					};
  2302					mbox3-33 {
  2303						mbox-id = <3>;
  2304						chan-id = <33>;
  2305						msg-size = <2>;
  2306					};
  2307					mbox3-13 {
  2308						mbox-id = <3>;
  2309						chan-id = <13>;
  2310						msg-size = <2>;
  2311					};
  2312					mbox3-35 {
  2313						mbox-id = <3>;
  2314						chan-id = <35>;
  2315						msg-size = <2>;
  2316					};
  2317					mbox4-20 {
  2318						mbox-id = <4>;
  2319						chan-id = <20>;
  2320						msg-size = <2>;
  2321					};
  2322					mbox4-21 {
  2323						mbox-id = <4>;
  2324						chan-id = <21>;
  2325						msg-size = <3>;
  2326					};
  2327					mbox4-23 {
  2328						mbox-id = <4>;
  2329						chan-id = <23>;
  2330						msg-size = <2>;
  2331					};
  2332				};
  2333	
  2334				recv_table: mtk-recv-table {
  2335					mbox0-1 {
  2336						mbox-id = <0>;
  2337						chan-id = <1>;
  2338						msg-size = <18>;
  2339						recv-opt = <0>;
  2340					};
  2341					mbox1-15 {
  2342						mbox-id = <1>;
  2343						chan-id = <15>;
  2344						msg-size = <8>;
  2345						recv-opt = <1>;
  2346					};
  2347					mbox1-17 {
  2348						mbox-id = <1>;
  2349						chan-id = <17>;
  2350						msg-size = <18>;
  2351						recv-opt = <0>;
  2352					};
  2353					mbox1-10 {
  2354						mbox-id = <1>;
  2355						chan-id = <10>;
  2356						msg-size = <2>;
  2357						recv-opt = <0>;
  2358					};
  2359					mbox2-12 {
  2360						mbox-id = <2>;
  2361						chan-id = <12>;
  2362						msg-size = <18>;
  2363						recv-opt = <0>;
  2364					};
  2365					mbox2-5 {
  2366						mbox-id = <2>;
  2367						chan-id = <5>;
  2368						msg-size = <1>;
  2369						recv-opt = <0>;
  2370					};
  2371					mbox2-2 {
  2372						mbox-id = <2>;
  2373						chan-id = <2>;
  2374						msg-size = <1>;
  2375						recv-opt = <1>;
  2376					};
  2377					mbox3-34 {
  2378						mbox-id = <3>;
  2379						chan-id = <34>;
  2380						msg-size = <2>;
  2381						recv-opt = <0>;
  2382					};
  2383					mbox3-14 {
  2384						mbox-id = <3>;
  2385						chan-id = <14>;
  2386						msg-size = <2>;
  2387						recv-opt = <0>;
  2388					};
  2389					mbox4-26 {
  2390						mbox-id = <4>;
  2391						chan-id = <26>;
  2392						msg-size = <1>;
  2393						recv-opt = <0>;
  2394					};
  2395					mbox4-20 {
  2396						mbox-id = <4>;
  2397						chan-id = <20>;
  2398						msg-size = <1>;
  2399						recv-opt = <1>;
  2400					};
  2401				};
  2402			};
  2403	
  2404			mminfra_hwv: syscon@31a80000 {
  2405				/* TODO: Fix compatible in driver */
  2406				compatible = "mediatek,mt8196-mminfra-hwv", "mediatek,mt8196-mminfra_hwv", "syscon";
  2407				reg = <0 0x31a80000 0 0x1000>;
  2408			};
  2409	
  2410			devapc_mmup: devapc@31ad5000 {
  2411				compatible = "mediatek,mt8196-devapc";
  2412				reg = <0 0x31ad5000 0 0x1000>;
  2413				vio-idx-num = <71>;
  2414				interrupts = <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH 0>;
  2415			};
  2416	
  2417			mm_hwv: syscon@31b00000 {
  2418				/* TODO: Fix compatible in driver */
  2419				compatible = "mediatek,mt8196-mm-hwv", "mediatek,mt8196-mm_hwv", "syscon";
  2420				reg = <0 0x31b00000 0 0x3000>;
  2421			};
  2422	
  2423			hfrpsys: power-controller@31b50000 {
  2424				compatible = "mediatek,mt8196-hfrpsys-hwv", "syscon";
  2425				reg = <0 0x31b50000 0 0x1000>;
  2426				#power-domain-cells = <1>;
  2427				mmpc = <&hfrpsys>;
  2428				mm-hw-ccf-regmap = <&mm_hwv>;
  2429				mminfra-hwv-regmap = <&mminfra_hwv>;
  2430			};
  2431	
  2432			dispsys_config_clk: syscon@32000000 {
  2433				compatible = "mediatek,mt8196-dispsys0", "syscon";
  2434				reg = <0 0x32000000 0 0x1000>;
  2435				mm-hw-ccf-regmap = <&mm_hwv>;
  2436				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
  2437				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
  2438				#clock-cells = <1>;
  2439	
  2440				async {
  2441					clocks = <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC0_DISP>,
  2442						 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC1_DISP>,
  2443						 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC8_DISP>,
  2444						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC1_DISP>,
  2445						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC2_DISP>,
  2446						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC3_DISP>;
  2447				};
  2448	
  2449				top {
  2450					clocks = <&dispsys_config_clk CLK_MM_CONFIG_DISP>;
  2451				};
  2452			};
  2453	
  2454			disp0_mutex: mutex@32020000 {
  2455				compatible = "mediatek,mt8196-disp-mutex";
  2456				reg = <0 0x32020000 0 0x1000>;
  2457				clocks = <&dispsys_config_clk CLK_MM_DISP_MUTEX0_DISP>;
  2458				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
  2459						      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
  2460			};
  2461	
  2462			disp_ccorr0: disp-ccorr@32090000 {
  2463				compatible = "mediatek,mt8196-disp-ccorr";
  2464				reg = <0 0x32090000 0 0x1000>;
  2465				clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR0_PQ>;
  2466			};
  2467	
  2468			disp_ccorr1: disp-ccorr@320a0000 {
  2469				compatible = "mediatek,mt8196-disp-ccorr";
  2470				reg = <0 0x320a0000 0 0x1000>;
  2471				clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR1_PQ>;
  2472			};
  2473	
  2474			disp_dither0: disp-dither@32110000 {
  2475				compatible = "mediatek,mt8196-disp-dither",
  2476					     "mediatek,mt8183-disp-dither";
  2477				reg = <0 0x32110000 0 0x1000>;
  2478				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
  2479				clocks = <&dispsys_config_clk CLK_MM_DISP_DITHER0_PQ>;
  2480			};
  2481	
  2482			disp_gamma0: disp-gamma@32130000 {
  2483				compatible = "mediatek,mt8196-disp-gamma",
  2484					     "mediatek,mt8195-disp-gamma";
  2485				reg = <0 0x32130000 0 0x1000>;
  2486				clocks = <&dispsys_config_clk CLK_MM_DISP_GAMMA0_PQ>;
  2487			};
  2488	
  2489			disp_tdshp0: disp-tdshp@321e0000 {
  2490				compatible = "mediatek,mt8196-disp-tdshp";
  2491				reg = <0 0x321e0000 0 0x1000>;
  2492				clocks = <&dispsys_config_clk CLK_MM_DISP_TDSHP0_PQ>;
  2493			};
  2494	
  2495			disp_postmask0: postmask@32180000 {
  2496				compatible = "mediatek,mt8196-disp-postmask",
  2497					     "mediatek,mt8192-disp-postmask";
  2498				reg = <0 0x32180000 0 0x1000>;
  2499				clocks = <&dispsys_config_clk CLK_MM_DISP_POSTMASK0_DISP>;
  2500			};
  2501	
  2502			disp_mdp_rsz0: mdp-rsz@321a0000 {
  2503				compatible = "mediatek,mt8196-disp-mdp-rsz";
  2504				reg = <0 0x321a0000 0 0x1000>;
  2505				clocks = <&dispsys_config_clk CLK_MM_MDP_RSZ0_DISP>;
  2506			};
  2507	
  2508			smi_larb32: larb@32240000 {
  2509				compatible = "mediatek,mt8196-smi-larb";
  2510				reg = <0 0x32240000 0 0x1000>;
  2511				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
  2512				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  2513					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  2514				clock-names = "apb", "smi";
  2515				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  2516				mediatek,larb-id = <32>;
  2517				larb-port-real-time-type = <1 1 1 1 0 0 0 0 1 0>;
  2518			};
  2519	
  2520			dispsys1_config_clk: syscon@32400000 {
  2521				compatible = "mediatek,mt8196-dispsys1", "syscon";
  2522				reg = <0 0x32400000 0 0x1000>;
  2523				mm-hw-ccf-regmap = <&mm_hwv>;
  2524				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
  2525				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
  2526				#clock-cells = <1>;
  2527	
  2528				async {
  2529					clocks = <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC21_DISP>,
  2530						 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC22_DISP>,
  2531						 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC23_DISP>;
  2532				};
  2533	
  2534				top {
  2535					clocks = <&dispsys1_config_clk CLK_MM1_DISPSYS1_CONFIG_DISP>;
  2536					clock-names = "dispsys1_config";
  2537				};
  2538			};
  2539	
  2540			disp1_mutex: mutex@32420000 {
  2541				compatible = "mediatek,mt8196-disp-mutex";
  2542				reg = <0 0x32420000 0 0x1000>;
  2543				clocks = <&dispsys1_config_clk CLK_MM1_DISP_MUTEX0_DISP>;
  2544			};
  2545	
  2546			dp_intf0: dp-intf@32430000 {
  2547				compatible = "mediatek,mt8196-dp-intf";
  2548				reg = <0 0x32430000 0 0x1000>;
  2549				interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>;
  2550				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF0>,
  2551					 <&dispsys1_config_clk CLK_MM1_MOD4>,
  2552					 <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
  2553					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D4>,
  2554					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D8>,
  2555					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D16>,
  2556					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL1>,
  2557					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  2558				clock-names = "hf_fmm_ck",
  2559					      "hf_fdp_ck",
  2560					      "mux_dp",
  2561					      "tvdpll_d4",
  2562					      "tvdpll_d8",
  2563					      "tvdpll_d16",
  2564					      "dpi_ck",
  2565					      "dpi_26m";
  2566				num = <0>;
  2567				phys = <&dp_tx>;
  2568				phy-names = "dp_tx";
  2569			};
  2570	
  2571			dp_intf1: dp-intf@32440000 {
  2572				compatible = "mediatek,mt8196-dp-intf";
  2573				reg = <0 0x32440000 0 0x1000>;
  2574				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
  2575				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF1>,
  2576					 <&dispsys1_config_clk CLK_MM1_MOD5>,
  2577					 <&cksys_gp2_clk CLK_CK2_DP1_SEL>,
  2578					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D4>,
  2579					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D8>,
  2580					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D16>,
  2581					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL2>,
  2582					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  2583				clock-names = "hf_fmm_ck",
  2584					      "hf_fdp_ck",
  2585					      "mux_dp",
  2586					      "tvdpll_d4",
  2587					      "tvdpll_d8",
  2588					      "tvdpll_d16",
  2589					      "dpi_ck",
  2590					      "dpi_26m";
  2591				num = <1>;
  2592				no-next-bridge;
  2593				phys = <&dp_tx>;
  2594				phy-names = "dp_tx";
  2595				status = "disabled";
  2596			};
  2597	
  2598			disp_dsc0: disp-dsc0-wrap0@32450000 {
  2599				compatible = "mediatek,mt8196-disp-dsc";
  2600				reg = <0 0x32450000 0 0x1000>;
  2601				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP0>;
  2602			};
  2603	
  2604			disp_dsc1: disp-dsc1-wrap1@32460000 {
  2605				compatible = "mediatek,mt8196-disp-dsc";
  2606				reg = <0 0x32460000 0 0x1000>;
  2607				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP1>;
  2608			};
  2609	
  2610			dsi0: dsi@32490000 {
  2611				compatible = "mediatek,mt8196-dsi";
  2612				reg = <0 0x32490000 0 0x1000>;
  2613				interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH 0>;
  2614				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSI0_DISP>,
  2615					 <&dispsys1_config_clk CLK_MM1_MOD1_DISP>,
  2616					 <&mipi_tx_config0>;
  2617				clock-names = "engine", "digital", "hs";
  2618				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DSI_PHY0>;
  2619				phys = <&mipi_tx_config0>;
  2620				phy-names = "dphy";
  2621				status = "disabled";
  2622			};
  2623	
  2624			disp_dvo0: disp-dvo0@324c0000 {
  2625				compatible = "mediatek,mt8196-edp-dvo";
  2626				reg = <0 0x324c0000 0 0x1000>;
  2627				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
  2628				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DVO0_DISP>,
  2629					 <&cksys_gp2_clk CLK_CK2_DVO_SEL>,
  2630					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL3>,
  2631					 <&dispsys1_config_clk CLK_MM1_MOD6>;
  2632				clock-names = "engine",
  2633					      "pixel",
  2634					      "pll",
  2635					      "hf_fdvo_clk";
  2636				status = "disabled";
  2637			};
  2638	
  2639			smi_larb33: larb@32600000 {
  2640				compatible = "mediatek,mt8196-smi-larb";
  2641				reg = <0 0x32600000 0 0x1000>;
  2642				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
  2643				clocks = <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>,
  2644					 <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>;
  2645				clock-names = "apb", "smi";
  2646				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  2647				mediatek,larb-id = <33>;
  2648				larb-port-real-time-type = <0 1 1 1 0 0 0 1 0 0 0 0 0 0 0 1>;
  2649			};
  2650	
  2651			ovlsys_config_clk: syscon@32800000 {
  2652				/* TODO: Fix compatible in driver */
  2653				compatible = "mediatek,mt8196-ovlsys-config", "mediatek,mt8196-ovlsys_config", "syscon";
  2654				reg = <0 0x32800000 0 0x1000>;
  2655				mm-hw-ccf-regmap = <&mm_hwv>;
  2656				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>,
  2657					 <&gce0 8 CMDQ_THR_PRIO_4>, <&gce0 9 CMDQ_THR_PRIO_4>;
  2658				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2659				#clock-cells = <1>;
  2660	
  2661				async {
  2662					clocks = <&ovlsys_config_clk CLK_OVL_DLO5_DISP>,
  2663						 <&ovlsys_config_clk CLK_OVL_DLO6_DISP>;
  2664				};
  2665			};
  2666	
  2667			ovl0_mutex: mutex@32820000 {
  2668				compatible = "mediatek,mt8196-disp-mutex";
  2669				reg = <0 0x32820000 0 0x1000>;
  2670				clocks = <&ovlsys_config_clk CLK_OVL_MUTEX0_DISP>;
  2671				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
  2672						      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
  2673			};
  2674	
  2675			disp_ovl0_exdma2: dma-controller@32850000 {
  2676				compatible = "mediatek,mt8196-exdma";
  2677				reg = <0 0x32850000 0 0x1000>;
  2678				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA2_DISP>;
  2679				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2680				mediatek,larb = <&smi_larb0>;
  2681				iommus = <&mm_smmu 144>;
  2682				#dma-cells = <1>;
  2683			};
  2684	
  2685			disp_ovl0_exdma3: dma-controller@32860000 {
  2686				compatible = "mediatek,mt8196-exdma";
  2687				reg = <0 0x32860000 0 0x1000>;
  2688				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA3_DISP>;
  2689				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2690				mediatek,larb = <&smi_larb1>;
  2691				#dma-cells = <1>;
  2692			};
  2693	
  2694			disp_ovl0_exdma4: dma-controller@32870000 {
  2695				compatible = "mediatek,mt8196-exdma";
  2696				reg = <0 0x32870000 0 0x1000>;
  2697				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA4_DISP>;
  2698				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2699				mediatek,larb = <&smi_larb20>;
  2700				#dma-cells = <1>;
  2701			};
  2702	
  2703			disp_ovl0_exdma5: dma-controller@32880000 {
  2704				compatible = "mediatek,mt8196-exdma";
  2705				reg = <0 0x32880000 0 0x1000>;
  2706				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA5_DISP>;
  2707				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2708				mediatek,larb = <&smi_larb21>;
  2709				#dma-cells = <1>;
  2710			};
  2711	
  2712			disp_ovl0_exdma6: dma-controller@32890000 {
  2713				compatible = "mediatek,mt8196-exdma";
  2714				reg = <0 0x32890000 0 0x1000>;
  2715				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA6_DISP>;
  2716				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2717				mediatek,larb = <&smi_larb1 SMMU_L1_P3_OVL_RDMA6>;
  2718				#dma-cells = <1>;
  2719			};
  2720	
  2721			disp_ovl0_exdma7: dma-controller@328a0000 {
  2722				compatible = "mediatek,mt8196-exdma";
  2723				reg = <0 0x328a0000 0 0x1000>;
  2724				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA7_DISP>;
  2725				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2726				mediatek,larb = <&smi_larb0>;
  2727				#dma-cells = <1>;
  2728			};
  2729	
  2730			disp_ovl0_exdma8: dma-controller@328b0000 {
  2731				compatible = "mediatek,mt8196-exdma";
  2732				reg = <0 0x328b0000 0 0x1000>;
  2733				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA8_DISP>;
  2734				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2735				mediatek,larb = <&smi_larb21>;
  2736				#dma-cells = <1>;
  2737			};
  2738	
  2739			disp_ovl0_exdma9: dma-controller@328c0000 {
  2740				compatible = "mediatek,mt8196-exdma";
  2741				reg = <0 0x328c0000 0 0x1000>;
  2742				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA9_DISP>;
  2743				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2744				mediatek,larb = <&smi_larb20>;
  2745				#dma-cells = <1>;
  2746			};
  2747	
  2748			disp_ovl0_blender0: blender@328d0000 {
  2749				compatible = "mediatek,mt8196-blender";
  2750				reg = <0 0x328d0000 0 0x1000>;
  2751				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER0_DISP>;
  2752			};
  2753	
  2754			disp_ovl0_blender1: blender@328e0000 {
  2755				compatible = "mediatek,mt8196-blender";
  2756				reg = <0 0x328e0000 0 0x1000>;
  2757				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER1_DISP>;
  2758			};
  2759	
  2760			disp_ovl0_blender2: blender@328f0000 {
  2761				compatible = "mediatek,mt8196-blender";
  2762				reg = <0 0x328f0000 0 0x1000>;
  2763				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER2_DISP>;
  2764			};
  2765	
  2766			disp_ovl0_blender3: blender@32900000 {
  2767				compatible = "mediatek,mt8196-blender";
  2768				reg = <0 0x32900000 0 0x1000>;
  2769				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER3_DISP>;
  2770			};
  2771	
  2772			disp_ovl0_blender4: blender@32910000 {
  2773				compatible = "mediatek,mt8196-blender";
  2774				reg = <0 0x32910000 0 0x1000>;
  2775				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER4_DISP>;
  2776			};
  2777	
  2778			disp_ovl0_blender5: blender@32920000 {
  2779				compatible = "mediatek,mt8196-blender";
  2780				reg = <0 0x32920000 0 0x1000>;
  2781				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER5_DISP>;
  2782			};
  2783	
  2784			disp_ovl0_blender6: blender@32930000 {
  2785				compatible = "mediatek,mt8196-blender";
  2786				reg = <0 0x32930000 0 0x1000>;
  2787				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER6_DISP>;
  2788			};
  2789	
  2790			disp_ovl0_blender7: blender@32940000 {
  2791				compatible = "mediatek,mt8196-blender";
  2792				reg = <0 0x32940000 0 0x1000>;
  2793				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER7_DISP>;
  2794			};
  2795	
  2796			disp_ovl0_blender8: blender@32950000 {
  2797				compatible = "mediatek,mt8196-blender";
  2798				reg = <0 0x32950000 0 0x1000>;
  2799				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER8_DISP>;
  2800			};
  2801	
  2802			disp_ovl0_blender9: blender@32960000 {
  2803				compatible = "mediatek,mt8196-blender";
  2804				reg = <0 0x32960000 0 0x1000>;
  2805				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER9_DISP>;
  2806			};
  2807	
  2808			disp_ovl0_outproc0: outproc@32970000 {
  2809				compatible = "mediatek,mt8196-outproc";
  2810				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC0_DISP>;
  2811				interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH 0>;
  2812				reg = <0 0x32970000 0 0x1000>;
  2813				mediatek,gce-events = <CMDQ_EVENT_OVL0_FRAME_DONE_SEL0>;
  2814				mboxes = <&gce0 3 CMDQ_THR_PRIO_4>;
  2815			};
  2816	
  2817			disp_ovl0_outproc1: outproc@32980000 {
  2818				compatible = "mediatek,mt8196-outproc";
  2819				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC1_DISP>;
  2820				interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH 0>;
  2821				reg = <0 0x32980000 0 0x1000>;
  2822			};
  2823	
  2824			disp_ovl0_outproc2: outproc@32990000 {
  2825				compatible = "mediatek,mt8196-outproc";
  2826				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC2_DISP>;
  2827				reg = <0 0x32990000 0 0x1000>;
  2828			};
  2829	
  2830			disp_ovl0_outproc3: outproc@329a0000 {
  2831				compatible = "mediatek,mt8196-outproc";
  2832				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC3_DISP>;
  2833				reg = <0 0x329a0000 0 0x1000>;
  2834			};
  2835	
  2836			disp_ovl0_outproc4: outproc@329b0000 {
  2837				compatible = "mediatek,mt8196-outproc";
  2838				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC4_DISP>;
  2839				reg = <0 0x329b0000 0 0x1000>;
  2840			};
  2841	
  2842			disp_ovl0_outproc5: outproc@329c0000 {
  2843				compatible = "mediatek,mt8196-outproc";
  2844				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC5_DISP>;
  2845				reg = <0 0x329c0000 0 0x1000>;
  2846			};
  2847	
  2848			smi_larb0: larb@32a60000 {
  2849				compatible = "mediatek,mt8196-smi-larb";
  2850				reg = <0 0x32a60000 0 0x1000>;
  2851				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2852				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  2853					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  2854				clock-names = "apb", "smi";
  2855				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  2856				mediatek,larb-id = <0>;
  2857				larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
  2858			};
  2859	
  2860			smi_larb1: larb@32a70000 {
  2861				compatible = "mediatek,mt8196-smi-larb";
  2862				reg = <0 0x32a70000 0 0x1000>;
  2863				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2864				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  2865					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  2866				clock-names = "apb", "smi";
  2867				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  2868				mediatek,larb-id = <1>;
  2869				larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
  2870			};
  2871	
  2872			smi_larb20: larb@32a80000 {
  2873				compatible = "mediatek,mt8196-smi-larb";
  2874				reg = <0 0x32a80000 0 0x1000>;
  2875				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2876				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  2877					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  2878				clock-names = "apb", "smi";
  2879				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  2880				mediatek,larb-id = <20>;
  2881				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
  2882			};
  2883	
  2884			smi_larb21: larb@32a90000 {
  2885				compatible = "mediatek,mt8196-smi-larb";
  2886				reg = <0 0x32a90000 0 0x1000>;
  2887				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2888				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  2889					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  2890				clock-names = "apb", "smi";
  2891				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  2892				mediatek,larb-id = <21>;
  2893				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
  2894			};
  2895	
  2896			ovlsys1_config_clk: syscon@32c00000 {
  2897				/* TODO: Fix compatible in driver */
  2898				compatible = "mediatek,mt8196-ovlsys1-config", "mediatek,mt8196-ovlsys1_config", "syscon";
  2899				reg = <0 0x32c00000 0 0x1000>;
  2900				mm-hw-ccf-regmap = <&mm_hwv>;
  2901				mboxes = <&gce0 2 CMDQ_THR_PRIO_4>, <&gce0 10 CMDQ_THR_PRIO_4>;
  2902				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2903				#clock-cells = <1>;
  2904	
  2905				async {
  2906					clocks = <&ovlsys1_config_clk CLK_OVL_DLO5_DISP>,
  2907						 <&ovlsys1_config_clk CLK_OVL_DLO6_DISP>;
  2908				};
  2909			};
  2910	
  2911			ovl1_mutex: mutex@32c20000 {
  2912				compatible = "mediatek,mt8196-disp-mutex";
  2913				reg = <0 0x32c20000 0 0x1000>;
  2914				clocks = <&ovlsys1_config_clk CLK_OVL_MUTEX0_DISP>;
  2915				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT2>;
  2916			};
  2917	
  2918			disp_ovl1_exdma2: dma-controller@32c50000 {
  2919				compatible = "mediatek,mt8196-exdma";
  2920				reg = <0 0x32c50000 0 0x1000>;
  2921				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA2_DISP>;
  2922				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2923				mediatek,larb = <&smi_larb34>;
  2924				#dma-cells = <1>;
  2925			};
  2926	
  2927			disp_ovl1_exdma3: dma-controller@32c60000 {
  2928				compatible = "mediatek,mt8196-exdma";
  2929				reg = <0 0x32c60000 0 0x1000>;
  2930				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA3_DISP>;
  2931				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2932				mediatek,larb = <&smi_larb35>;
  2933				#dma-cells = <1>;
  2934			};
  2935	
  2936			disp_ovl1_exdma4: dma-controller@32c70000 {
  2937				compatible = "mediatek,mt8196-exdma";
  2938				reg = <0 0x32c70000 0 0x1000>;
  2939				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA4_DISP>;
  2940				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2941				mediatek,larb = <&smi_larb36>;
  2942				#dma-cells = <1>;
  2943			};
  2944	
  2945			disp_ovl1_exdma5: dma-controller@32c80000 {
  2946				compatible = "mediatek,mt8196-exdma";
  2947				reg = <0 0x32c80000 0 0x1000>;
  2948				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA5_DISP>;
  2949				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2950				mediatek,larb = <&smi_larb37>;
  2951				#dma-cells = <1>;
  2952			};
  2953	
  2954			disp_ovl1_exdma6: dma-controller@32c90000 {
  2955				compatible = "mediatek,mt8196-exdma";
  2956				reg = <0 0x32c90000 0 0x1000>;
  2957				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA6_DISP>;
  2958				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2959				mediatek,larb = <&smi_larb35>;
  2960				#dma-cells = <1>;
  2961			};
  2962	
  2963			disp_ovl1_exdma7: dma-controller@32ca0000 {
  2964				compatible = "mediatek,mt8196-exdma";
  2965				reg = <0 0x32ca0000 0 0x1000>;
  2966				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA7_DISP>;
  2967				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2968				mediatek,larb = <&smi_larb34>;
  2969				#dma-cells = <1>;
  2970			};
  2971	
  2972			disp_ovl1_exdma8: dma-controller@32cb0000 {
  2973				compatible = "mediatek,mt8196-exdma";
  2974				reg = <0 0x32cb0000 0 0x1000>;
  2975				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA8_DISP>;
  2976				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2977				mediatek,larb = <&smi_larb37>;
  2978				#dma-cells = <1>;
  2979			};
  2980	
  2981			disp_ovl1_exdma9: dma-controller@32cc0000 {
  2982				compatible = "mediatek,mt8196-exdma";
  2983				reg = <0 0x32cc0000 0 0x1000>;
  2984				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA9_DISP>;
  2985				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2986				mediatek,larb = <&smi_larb36>;
  2987				#dma-cells = <1>;
  2988			};
  2989	
  2990			disp_ovl1_blender0: blender@32cd0000 {
  2991				compatible = "mediatek,mt8196-blender";
  2992				reg = <0 0x32cd0000 0 0x1000>;
  2993				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER0_DISP>;
  2994			};
  2995	
  2996			disp_ovl1_blender1: blender@32ce0000 {
  2997				compatible = "mediatek,mt8196-blender";
  2998				reg = <0 0x32ce0000 0 0x1000>;
  2999				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER1_DISP>;
  3000			};
  3001	
  3002			disp_ovl1_blender2: blender@32cf0000 {
  3003				compatible = "mediatek,mt8196-blender";
  3004				reg = <0 0x32cf0000 0 0x1000>;
  3005				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER2_DISP>;
  3006			};
  3007	
  3008			disp_ovl1_blender3: blender@32d00000 {
  3009				compatible = "mediatek,mt8196-blender";
  3010				reg = <0 0x32d00000 0 0x1000>;
  3011				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER3_DISP>;
  3012			};
  3013	
  3014			disp_ovl1_blender4: blender@32d10000 {
  3015				compatible = "mediatek,mt8196-blender";
  3016				reg = <0 0x32d10000 0 0x1000>;
  3017				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER4_DISP>;
  3018			};
  3019	
  3020			disp_ovl1_blender5: blender@32d20000 {
  3021				compatible = "mediatek,mt8196-blender";
  3022				reg = <0 0x32d20000 0 0x1000>;
  3023				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER5_DISP>;
  3024			};
  3025	
  3026			disp_ovl1_blender6: blender@32d30000 {
  3027				compatible = "mediatek,mt8196-blender";
  3028				reg = <0 0x32d30000 0 0x1000>;
  3029				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER6_DISP>;
  3030			};
  3031	
  3032			disp_ovl1_blender7: blender@32d40000 {
  3033				compatible = "mediatek,mt8196-blender";
  3034				reg = <0 0x32d40000 0 0x1000>;
  3035				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER7_DISP>;
  3036			};
  3037	
  3038			disp_ovl1_blender8: blender@32d50000 {
  3039				compatible = "mediatek,mt8196-blender";
  3040				reg = <0 0x32d50000 0 0x1000>;
  3041				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER8_DISP>;
  3042			};
  3043	
  3044			disp_ovl1_blender9: blender@32d60000 {
  3045				compatible = "mediatek,mt8196-blender";
  3046				reg = <0 0x32d60000 0 0x1000>;
  3047				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER9_DISP>;
  3048			};
  3049	
  3050			disp_ovl1_outproc0: outproc@32d70000 {
  3051				compatible = "mediatek,mt8196-outproc";
  3052				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC0_DISP>;
  3053				interrupts = <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH 0>;
  3054				reg = <0 0x32d70000 0 0x1000>;
  3055			};
  3056	
  3057			disp_ovl1_outproc1: outproc@32d80000 {
  3058				compatible = "mediatek,mt8196-outproc";
  3059				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC1_DISP>;
  3060				reg = <0 0x32d80000 0 0x1000>;
  3061			};
  3062	
  3063			disp_ovl1_outproc2: outproc@32d90000 {
  3064				compatible = "mediatek,mt8196-outproc";
  3065				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC2_DISP>;
  3066				reg = <0 0x32d90000 0 0x1000>;
  3067			};
  3068	
  3069			disp_ovl1_outproc3: outproc@32da0000 {
  3070				compatible = "mediatek,mt8196-outproc";
  3071				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC3_DISP>;
  3072				reg = <0 0x32da0000 0 0x1000>;
  3073			};
  3074	
  3075			disp_ovl1_outproc4: outproc@32db0000 {
  3076				compatible = "mediatek,mt8196-outproc";
  3077				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC4_DISP>;
  3078				reg = <0 0x32db0000 0 0x1000>;
  3079			};
  3080	
  3081			disp_ovl1_outproc5: outproc@32dc0000 {
  3082				compatible = "mediatek,mt8196-outproc";
  3083				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC5_DISP>;
  3084				reg = <0 0x32dc0000 0 0x1000>;
  3085			};
  3086	
  3087			smi_larb34: larb@32e60000 {
  3088				compatible = "mediatek,mt8196-smi-larb";
  3089				reg = <0 0x32e60000 0 0x1000>;
  3090				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3091				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3092					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3093				clock-names = "apb", "smi";
  3094				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3095				mediatek,larb-id = <34>;
  3096				larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
  3097			};
  3098	
  3099			smi_larb35: larb@32e70000 {
  3100				compatible = "mediatek,mt8196-smi-larb";
  3101				reg = <0 0x32e70000 0 0x1000>;
  3102				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3103				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3104					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3105				clock-names = "apb", "smi";
  3106				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3107				mediatek,larb-id = <35>;
  3108				larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
  3109			};
  3110	
  3111			smi_larb36: larb@32e80000 {
  3112				compatible = "mediatek,mt8196-smi-larb";
  3113				reg = <0 0x32e80000 0 0x1000>;
  3114				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3115				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3116					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3117				clock-names = "apb", "smi";
  3118				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3119				mediatek,larb-id = <36>;
  3120				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
  3121			};
  3122	
  3123			smi_larb37: larb@32e90000 {
  3124				compatible = "mediatek,mt8196-smi-larb";
  3125				reg = <0 0x32e90000 0 0x1000>;
  3126				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3127				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3128					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3129				clock-names = "apb", "smi";
  3130				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  3131				mediatek,larb-id = <37>;
  3132				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
  3133			};
  3134	
  3135			smi_larb5: larb@3600d000 {
  3136				compatible = "mediatek,mt8196-smi-larb";
  3137				reg = <0 0x3600d000 0 0x1000>;
  3138				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3139				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3140					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3141				clock-names = "apb", "smi";
  3142				mediatek,smi = <&smi_disp_common>;
  3143				mediatek,larb-id = <5>;
  3144				larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
  3145			};
  3146	
  3147			smi_larb6: larb@3600e000 {
  3148				compatible = "mediatek,mt8196-smi-larb";
  3149				reg = <0 0x3600e000 0 0x1000>;
  3150				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3151				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3152					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3153				clock-names = "apb", "smi";
  3154				mediatek,smi = <&smi_mdp_common>;
  3155				mediatek,larb-id = <6>;
  3156				larb-port-real-time-type = <1 1 1>;
  3157			};
  3158	
  3159			vdec_soc_gcon_base_clk: syscon@3600f000 {
  3160				/* TODO: Fix compatible in driver */
  3161				compatible = "mediatek,mt8196-vdecsys-soc", "mediatek,mt8196-vdecsys_soc", "syscon";
  3162				reg = <0 0x3600f000 0 0x1000>;
  3163				#clock-cells = <1>;
  3164			};
  3165	
  3166			smi_larb4: larb@3602e000 {
  3167				compatible = "mediatek,mt8196-smi-larb";
  3168				reg = <0 0x3602e000 0 0x1000>;
  3169				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
  3170				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3171					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3172				clock-names = "apb", "smi";
  3173				mediatek,smi = <&smi_mdp_common>;
  3174				mediatek,larb-id = <4>;
  3175				larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
  3176			};
  3177	
  3178			vdec_gcon_base_clk: syscon@3602f000 {
  3179				compatible = "mediatek,mt8196-vdecsys", "syscon";
  3180				reg = <0 0x3602f000 0 0x1000>;
  3181				#clock-cells = <1>;
  3182			};
  3183	
  3184			venc_gcon_clk: syscon@38000000 {
  3185				compatible = "mediatek,mt8196-vencsys", "syscon";
  3186				reg = <0 0x38000000 0 0x1000>;
  3187				mm-hw-ccf-regmap = <&mm_hwv>;
  3188				#clock-cells = <1>;
  3189			};
  3190	
  3191			smi_larb7: larb@38010000 {
  3192				compatible = "mediatek,mt8196-smi-larb";
  3193				reg = <0 0x38010000 0 0x1000>;
  3194				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3195				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3196					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3197				clock-names = "apb", "smi";
  3198				mediatek,smi = <&smi_disp_venc_sub_comm0>;
  3199				mediatek,larb-id = <7>;
  3200				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3201			};
  3202	
  3203			smi_disp_venc_sub_comm0: smi-sub-comm@38070000 {
  3204				compatible = "mediatek,mt8196-smi-sub-common";
  3205				reg = <0 0x38070000 0 0x1000>;
  3206				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3207				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3208					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3209				clock-names = "apb", "smi";
  3210				mediatek,smi = <&smi_disp_common>;
  3211				mediatek,common-id = <15>;
  3212			};
  3213	
  3214			smi_larb41: larb@38090000 {
  3215				compatible = "mediatek,mt8196-smi-larb";
  3216				reg = <0 0x38090000 0 0x1000>;
  3217				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3218				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3219					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3220				clock-names = "apb", "smi";
  3221				mediatek,smi = <&smi_disp_venc_sub_comm0>;
  3222				mediatek,larb-id = <41>;
  3223				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3224			};
  3225	
  3226			venc_gcon_core1_clk: syscon@38800000 {
  3227				/* TODO: Fix compatible in driver */
  3228				compatible = "mediatek,mt8196-vencsys-c1", "mediatek,mt8196-vencsys_c1", "syscon";
  3229				reg = <0 0x38800000 0 0x1000>;
  3230				mm-hw-ccf-regmap = <&mm_hwv>;
  3231				#clock-cells = <1>;
  3232			};
  3233	
  3234			smi_larb8: larb@38810000 {
  3235				compatible = "mediatek,mt8196-smi-larb";
  3236				reg = <0 0x38810000 0 0x1000>;
  3237				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3238				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  3239					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  3240				clock-names = "apb", "smi";
  3241				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  3242				mediatek,larb-id = <8>;
  3243				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3244			};
  3245	
  3246	
  3247			smi_mdp_venc_sub_comm1: smi-sub-comm@38870000 {
  3248				compatible = "mediatek,mt8196-smi-sub-common";
  3249				reg = <0 0x38870000 0 0x1000>;
  3250				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3251				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  3252					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  3253				clock-names = "apb", "smi";
  3254				mediatek,smi = <&smi_mdp_common>;
  3255				mediatek,common-id = <16>;
  3256			};
  3257	
  3258			smi_larb42: larb@38890000 {
  3259				compatible = "mediatek,mt8196-smi-larb";
  3260				reg = <0 0x38890000 0 0x1000>;
  3261				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3262				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  3263					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  3264				clock-names = "apb", "smi";
  3265				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  3266				mediatek,larb-id = <42>;
  3267				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3268			};
  3269	
  3270			venc_gcon_core2_clk: syscon@38c00000 {
  3271				/* TODO: Fix compatible in driver */
  3272				compatible = "mediatek,mt8196-vencsys-c2", "mediatek,mt8196-vencsys_c2", "syscon";
  3273				reg = <0 0x38c00000 0 0x1000>;
  3274				mm-hw-ccf-regmap = <&mm_hwv>;
  3275				#clock-cells = <1>;
  3276			};
  3277	
  3278			smi_larb24: larb@38c10000 {
  3279				compatible = "mediatek,mt8196-smi-larb";
  3280				reg = <0 0x38c10000 0 0x1000>;
  3281				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3282				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  3283					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  3284				clock-names = "apb", "smi";
  3285				mediatek,smi = <&smi_mdp_venc_sub_comm2>;
  3286				mediatek,larb-id = <24>;
  3287				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3288			};
  3289	
  3290			smi_mdp_venc_sub_comm2: smi-sub-comm@38c70000 {
  3291				compatible = "mediatek,mt8196-smi-sub-common";
  3292				reg = <0 0x38c70000 0 0x1000>;
  3293				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3294				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  3295					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  3296				clock-names = "apb", "smi";
  3297				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  3298				mediatek,common-id = <18>;
  3299			};
  3300	
  3301			smi_larb47: larb@38c90000 {
  3302				compatible = "mediatek,mt8196-smi-larb";
  3303				reg = <0 0x38c90000 0 0x1000>;
  3304				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3305				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  3306					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  3307				clock-names = "apb", "smi";
  3308				mediatek,smi = <&smi_mdp_venc_sub_comm2>;
  3309				mediatek,larb-id = <47>;
  3310				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3311			};
  3312	
  3313			cam_main_r1a_clk: syscon@3a000000 {
  3314				/* TODO: Fix compatible in driver */
  3315				compatible = "mediatek,mt8196-cam_main-r1a", "mediatek,mt8196-cam_main_r1a", "syscon";
  3316				reg = <0 0x3a000000 0 0x1000>;
  3317				mm-hw-ccf-regmap = <&mm_hwv>;
  3318				#clock-cells = <1>;
  3319			};
  3320	
  3321			mdpsys_config_clk: syscon@3e000000 {
  3322				compatible = "mediatek,mt8196-mdpsys", "syscon";
  3323				reg = <0 0x3e000000 0 0x1000>;
  3324				#clock-cells = <1>;
  3325			};
  3326	
  3327			smi_larb2: larb@3e030000 {
  3328				compatible = "mediatek,mt8196-smi-larb";
  3329				reg = <0 0x3e030000 0 0x1000>;
  3330				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
  3331				clocks = <&mdpsys_config_clk CLK_MDP_SMI0_SMI>, <&mdpsys_config_clk CLK_MDP_SMI0_SMI>;
  3332				clock-names = "apb", "smi";
  3333				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  3334				mediatek,larb-id = <2>;
  3335				larb-port-real-time-type = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
  3336			};
  3337	
  3338			mdpsys1_config_clk: syscon@3e400000 {
  3339				compatible = "mediatek,mt8196-mdpsys1", "syscon";
  3340				reg = <0 0x3e400000 0 0x1000>;
  3341				#clock-cells = <1>;
  3342			};
  3343	
  3344			smi_larb3: larb@3e430000 {
  3345				compatible = "mediatek,mt8196-smi-larb";
  3346				reg = <0 0x3e430000 0 0x1000>;
  3347				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
  3348				clocks = <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>, <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>;
  3349				clock-names = "apb", "smi";
  3350				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3351				mediatek,larb-id = <3>;
  3352				larb-port-real-time-type = <2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 1 2>;
  3353			};
  3354	
  3355			disp_vdisp_ao_config_clk: syscon@3e800000 {
  3356				/* TODO: Fix compatible in driver */
  3357				compatible = "mediatek,mt8196-disp-vdisp-ao-config", "mediatek,mt8196-disp_vdisp_ao_config", "syscon";
  3358				reg = <0 0x3e800000 0 0x1000>;
  3359				mm-hw-ccf-regmap = <&mm_hwv>;
  3360				#clock-cells = <1>;
  3361			};
  3362	
  3363			smi_disp_dram_sub_comm0: smi-sub-comm@3e810000 {
  3364				compatible = "mediatek,mt8196-smi-sub-common";
  3365				reg = <0 0x3e810000 0 0x1000>;
  3366				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  3367				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3368						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3369				clock-names = "apb", "smi";
  3370				mediatek,smi = <&smi_disp_common>;
  3371				mediatek,common-id = <9>;
  3372			};
  3373	
  3374			smi_disp_dram_sub_comm1: smi-sub-comm@3e820000 {
  3375				compatible = "mediatek,mt8196-smi-sub-common";
  3376				reg = <0 0x3e820000 0 0x1000>;
  3377				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  3378				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3379						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3380				clock-names = "apb", "smi";
  3381				mediatek,smi = <&smi_disp_common>;
  3382				mediatek,common-id = <10>;
  3383			};
  3384	
  3385			smi_mdp_dram_sub_comm2: smi-sub-comm@3e830000 {
  3386				compatible = "mediatek,mt8196-smi-sub-common";
  3387				reg = <0 0x3e830000 0 0x1000>;
  3388				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  3389				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3390						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3391				clock-names = "apb", "smi";
  3392				mediatek,smi = <&smi_mdp_common>;
  3393				mediatek,common-id = <11>;
  3394			};
  3395	
  3396			smi_mdp_dram_sub_comm3: smi-sub-comm@3e840000 {
  3397				compatible = "mediatek,mt8196-smi-sub-common";
  3398				reg = <0 0x3e840000 0 0x1000>;
  3399				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  3400				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3401						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3402				clock-names = "apb", "smi";
  3403				mediatek,smi = <&smi_mdp_common>;
  3404				mediatek,common-id = <12>;
  3405			};
  3406	
  3407			dp_tx: dp-tx@3ec00000 {
  3408				compatible = "mediatek,mt8196-dp-tx";
  3409				reg = <0 0x3ec00000 0 0x5000>,
  3410				      <0 0x128b0000 0 0x1500>,
  3411				      <0 0x1002d600 0 0x4>,
  3412				      <0 0x31b50078 0 0x4>;
  3413				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT>,
  3414						<&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
  3415				power-domain-names = "pd_dp_tx", "pd_dp_phy";
  3416				interrupts = <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH 0>;
  3417				dptx,phy-params = <0x221c1814 0x24241e18 0x0000302a
  3418						   0x0e080400 0x000c0600 0x00000006>;
  3419				#phy-cells = <0>;
  3420				clocks = <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
  3421					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  3422				clock-names = "mux_dp",
  3423					      "ck_26m";
  3424			};
  3425	
  3426			edp_tx: edp-tx@3ec40000 {
  3427				compatible = "mediatek,mt8196-edp-tx";
  3428				reg = <0 0x3ec40000 0 0x4000>,
  3429				      <0 0x130a0000 0 0x1500>,
  3430				      <0 0x31b50074 0 0x4>;
  3431				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT>;
  3432				clocks = <&cksys_gp2_clk CLK_CK2_DVO_SEL>;
  3433				clock-names = "power";
  3434				max-linkrate-mhz = <8100>;
  3435				interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH 0>;
  3436				status = "disabled";
  3437			};
  3438	
  3439			gpu_smmu: iommu@48600000 {
  3440				#iommu-cells = <1>;
  3441				compatible = "mediatek,mt8196-gpu-smmu", "arm,smmu-v3";
  3442				reg = <0 0x48600000 0 0x1e0000>;
  3443				interrupts = <GIC_SPI 616 IRQ_TYPE_LEVEL_HIGH 0>;
  3444				interrupt-names = "combined";
  3445				status = "disabled";
  3446			};
  3447	
  3448			mfgpll_pll_ctrl_clk: syscon@4b810000 {
  3449				/* TODO: Fix compatible in driver */
  3450				compatible = "mediatek,mt8196-mfgpll-pll-ctrl", "mediatek,mt8196-mfgpll_pll_ctrl", "syscon";
  3451				reg = <0 0x4b810000 0 0x400>;
  3452				#clock-cells = <1>;
  3453			};
  3454	
  3455			mfgpll_sc0_pll_ctrl_clk: syscon@4b810400 {
  3456				/* TODO: Fix compatible in driver */
  3457				compatible = "mediatek,mt8196-mfgpll-sc0-pll-ctrl", "mediatek,mt8196-mfgpll_sc0_pll_ctrl", "syscon";
  3458				reg = <0 0x4b810400 0 0x400>;
  3459				#clock-cells = <1>;
  3460			};
  3461	
  3462			mfgpll_sc1_pll_ctrl_clk: syscon@4b810800 {
  3463				/* TODO: Fix compatible in driver */
  3464				compatible = "mediatek,mt8196-mfgpll-sc1-pll-ctrl", "mediatek,mt8196-mfgpll_sc1_pll_ctrl", "syscon";
  3465				reg = <0 0x4b810800 0 0x1000>;
  3466				#clock-cells = <1>;
  3467			};
  3468	
  3469			devapc_gpu: devapc@4b890000 {
  3470				compatible = "mediatek,mt8196-devapc";
  3471				reg = <0 0x4b890000 0 0x1000>;
  3472				vio-idx-num = <20>;
  3473				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
  3474			};
  3475	
  3476			devapc_gpu1: devapc@4b8b0000 {
  3477				compatible = "mediatek,mt8196-devapc";
  3478				reg = <0 0x4b8b0000 0 0x1000>;
  3479				vio-idx-num = <26>;
  3480				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
  3481			};
  3482	
  3483			apu_smmu: iommu@4c000000 {
  3484				compatible = "mediatek,mt8196-apu-smmu", "arm,smmu-v3";
  3485				reg = <0 0x4c000000 0 0x1e0000>;
  3486				interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING 0>;
  3487				interrupt-names = "combined";
  3488				#iommu-cells = <1>;
  3489			};
  3490	
  3491			sound: sound {
  3492				compatible = "mediatek,mt8196-mt6681-sound";
  3493				mediatek,platform = <&afe>;
  3494				/* audio-routing is added here as a placeholder to complete the
  3495				   probe flow.It should be removed when upstreaming */
  3496				audio-routing = "Headphone Jack", "HPOL",
  3497						"Headphone Jack", "HPOR";
  3498				status = "disabled";
  3499			};
  3500		};
  3501	};
  3502	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
