Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1260CCA6F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 18:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739126252; cv=none; b=rn1z8jFs9LOmM8zElHl/I/ZjHLUVnfeOX3mDaZcpg2E22uyZuStgh1FeAZs4Hr3DYY2Bvw5WaDsl0km6QftFrYU2KXM6KD69sphqkoSMCornX43DWmzD2pgNWgg5544t8lZ1SWjZbJU1yDjvnWRwAnrbe1QgyQhasMavHCVCmHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739126252; c=relaxed/simple;
	bh=x0fovhZg7PP1i9GQjRtFEg8qpZHbtRp8TxJePKWKn6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFlSiKGVYNw+hdtOPwHSbrrmCuMbLKrWwWAnCz5DeR7wR46hCFIcFTkbpiE0hSkkUieiqLYeaSJ12Ra486DmYF1fxSG5URwRpMkcg774vEDhA4lRTbH0cGUL7LApTnyiGcYB5Wp/AtDgbXo4uH7uPM33Se2ZbhNugeSKAYxaH8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JG3fW/P/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JG3fW/P/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739126245; x=1770662245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x0fovhZg7PP1i9GQjRtFEg8qpZHbtRp8TxJePKWKn6E=;
  b=JG3fW/P/estGK93QRtU8BDtlVEyzic5iXpPPBxH+QAobxsBdbHaurTdc
   7LwBKKMV9JGmvBXxLf4JYxRHZYLZytonUQNJneas67xgr0nrf9pWWahnm
   skeDtMsYZuop+HQMb7Mhc50a79wxCIxy934GUE0fenQRBkCFYjzikps/l
   a6xJzhTkJaQwQX48qaArAxILnzkoZRIhlvMsu4josbEKLbAg/nNLJtHi5
   BVXSEKB0RbBXHIVzV+KDWmMFFoexeCDnC3ymfqLunazkG6vBrTpMvkgMW
   /0wKsNl8IVExOkkEUyprRbuFLoJnKNvdToHP9opecXOCUcIFio8D4ZDmi
   g==;
X-CSE-ConnectionGUID: /k0nsXL7Sma3pLWKRMM0UA==
X-CSE-MsgGUID: +Kpqf3jQRPmt1C6b4W8Bag==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43472448"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="43472448"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 10:37:24 -0800
X-CSE-ConnectionGUID: J9LuoKmhT1Kab+69n1Z8vg==
X-CSE-MsgGUID: StgR6svvTS2VCduZqsP/og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="111922798"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Feb 2025 10:37:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thCBD-0011mx-36;
	Sun, 09 Feb 2025 18:37:19 +0000
Date: Mon, 10 Feb 2025 02:36:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 211/211]
 arch/arm64/boot/dts/mediatek/mt8196.dtsi:4796.12-4804.5: Warning
 (simple_bus_reg): /soc/vmm: missing or empty reg/ranges property
Message-ID: <202502100251.14c0D8Vb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   fd00cab3fe36e486cd2aaf166b98a6a5b943a097
commit: a2f778a6f2805b30558fa42b25940fa5be91ae45 [211/211] CHROMIUM: arm64: dts: mt8196: add vmm device node
config: arm64-randconfig-003-20250207 (https://download.01.org/0day-ci/archive/20250210/202502100251.14c0D8Vb-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100251.14c0D8Vb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100251.14c0D8Vb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2862.35-2868.5: Warning (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format error, expected "1a350100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2870.35-2876.5: Warning (simple_bus_reg): /soc/mailbox@1a360000: simple-bus unit address format error, expected "1a360100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4688.17-4694.5: Warning (simple_bus_reg): /soc/apusys-apummu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4696.16-4721.5: Warning (simple_bus_reg): /soc/jpeg-decoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4723.16-4749.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4751.38-4758.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4760.38-4767.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4769.8-4774.5: Warning (simple_bus_reg): /soc/mvpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4776.16-4784.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4786.14-4794.5: Warning (simple_bus_reg): /soc/vdisp-ctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:4796.12-4804.5: Warning (simple_bus_reg): /soc/vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4806.32-5210.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1151.37-1176.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1276.25-1306.5: Warning (unique_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate unit-address (also used in node /soc/nkp@1046f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1308.24-1335.5: Warning (unique_unit_address_if_enabled): /soc/ssmpu@1056f000: duplicate unit-address (also used in node /soc/skp@1056f000)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:58.8-68.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:74.8-84.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +4796 arch/arm64/boot/dts/mediatek/mt8196.dtsi

    19	
    20	/ {
    21		compatible = "mediatek,mt8196";
    22		interrupt-parent = <&gic>;
    23		#address-cells = <2>;
    24		#size-cells = <2>;
    25	
    26		aliases {
    27			blender0 = &disp_ovl0_blender0;
    28			blender1 = &disp_ovl0_blender1;
    29			blender2 = &disp_ovl0_blender2;
    30			blender3 = &disp_ovl0_blender3;
    31			blender4 = &disp_ovl0_blender4;
    32			blender5 = &disp_ovl0_blender5;
    33			blender6 = &disp_ovl0_blender6;
    34			blender7 = &disp_ovl0_blender7;
    35			blender8 = &disp_ovl0_blender8;
    36			blender9 = &disp_ovl0_blender9;
    37			blender10 = &disp_ovl1_blender0;
    38			blender11 = &disp_ovl1_blender1;
    39			blender12 = &disp_ovl1_blender2;
    40			blender13 = &disp_ovl1_blender3;
    41			blender14 = &disp_ovl1_blender4;
    42			blender15 = &disp_ovl1_blender5;
    43			blender16 = &disp_ovl1_blender6;
    44			blender17 = &disp_ovl1_blender7;
    45			blender18 = &disp_ovl1_blender8;
    46			blender19 = &disp_ovl1_blender9;
    47			ccorr0 = &disp_ccorr0;
    48			ccorr1 = &disp_ccorr1;
    49			dither0 = &disp_dither0;
    50			dp-intf0 = &dp_intf0;
    51			dp-intf1 = &dp_intf1;
    52			dsc0 = &disp_dsc0;
    53			dsc1 = &disp_dsc1;
    54			dvo0 = &disp_dvo0;
    55			exdma2 = &disp_ovl0_exdma2;
    56			exdma3 = &disp_ovl0_exdma3;
    57			exdma4 = &disp_ovl0_exdma4;
    58			exdma5 = &disp_ovl0_exdma5;
    59			exdma6 = &disp_ovl0_exdma6;
    60			exdma7 = &disp_ovl0_exdma7;
    61			exdma8 = &disp_ovl0_exdma8;
    62			exdma9 = &disp_ovl0_exdma9;
    63			exdma12 = &disp_ovl1_exdma2;
    64			exdma13 = &disp_ovl1_exdma3;
    65			exdma14 = &disp_ovl1_exdma4;
    66			exdma15 = &disp_ovl1_exdma5;
    67			exdma16 = &disp_ovl1_exdma6;
    68			exdma17 = &disp_ovl1_exdma7;
    69			exdma18 = &disp_ovl1_exdma8;
    70			exdma19 = &disp_ovl1_exdma9;
    71			gamma0 = &disp_gamma0;
    72			i2c0 = &i2c0;
    73			i2c1 = &i2c1;
    74			i2c2 = &i2c2;
    75			i2c3 = &i2c3;
    76			i2c4 = &i2c4;
    77			i2c5 = &i2c5;
    78			i2c6 = &i2c6;
    79			i2c7 = &i2c7;
    80			i2c8 = &i2c8;
    81			i2c9 = &i2c9;
    82			i2c10 = &i2c10;
    83			i2c11 = &i2c11;
    84			i2c12 = &i2c12;
    85			i2c13 = &i2c13;
    86			i2c14 = &i2c14;
    87			mdp-rsz0 = &disp_mdp_rsz0;
    88			mmc1 = &mmc1;
    89			mmc2 = &mmc2;
    90			mutex0 = &disp0_mutex;
    91			mutex1 = &disp1_mutex;
    92			mutex2 = &ovl0_mutex;
    93			mutex3 = &ovl1_mutex;
    94			outproc0 = &disp_ovl0_outproc0;
    95			outproc1 = &disp_ovl0_outproc1;
    96			outproc2 = &disp_ovl0_outproc2;
    97			outproc3 = &disp_ovl0_outproc3;
    98			outproc4 = &disp_ovl0_outproc4;
    99			outproc5 = &disp_ovl0_outproc5;
   100			outproc6 = &disp_ovl1_outproc0;
   101			outproc7 = &disp_ovl1_outproc1;
   102			outproc8 = &disp_ovl1_outproc2;
   103			outproc9 = &disp_ovl1_outproc3;
   104			outproc10 = &disp_ovl1_outproc4;
   105			outproc11 = &disp_ovl1_outproc5;
   106			postmask0 = &disp_postmask0;
   107			serial0 = &uart0;
   108			spi0 = &spi0;
   109			spi1 = &spi1;
   110			spi2 = &spi2;
   111			spi3 = &spi3;
   112			spi4 = &spi4;
   113			spi5 = &spi5;
   114			spi6 = &spi6;
   115			spi7 = &spi7;
   116			tdshp0 = &disp_tdshp0;
   117			vdisp-ao = &disp_vdisp_ao_config_clk;
   118		};
   119	
   120		cpus {
   121			#address-cells = <1>;
   122			#size-cells = <0>;
   123	
   124			cpu0: cpu@0 {
   125				device_type = "cpu";
   126				compatible = "arm,cortex-a720";
   127				reg = <0x000>;
   128				performance-domains = <&performance 0>;
   129				enable-method = "psci";
   130				clock-frequency = <2100000000>;
   131				capacity-dmips-mhz = <714>;
   132				cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
   133						   &system_vcore &s2idle>;
   134				i-cache-size = <65536>;
   135				i-cache-line-size = <64>;
   136				i-cache-sets = <256>;
   137				d-cache-size = <65536>;
   138				d-cache-line-size = <64>;
   139				d-cache-sets = <256>;
   140				next-level-cache = <&l2_0>;
   141				#cooling-cells = <2>;
   142			};
   143	
   144			cpu1: cpu@100 {
   145				device_type = "cpu";
   146				compatible = "arm,cortex-a720";
   147				reg = <0x100>;
   148				performance-domains = <&performance 0>;
   149				enable-method = "psci";
   150				clock-frequency = <2100000000>;
   151				capacity-dmips-mhz = <714>;
   152				cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
   153						   &system_vcore &s2idle>;
   154				i-cache-size = <65536>;
   155				i-cache-line-size = <64>;
   156				i-cache-sets = <256>;
   157				d-cache-size = <65536>;
   158				d-cache-line-size = <64>;
   159				d-cache-sets = <256>;
   160				next-level-cache = <&l2_0>;
   161				#cooling-cells = <2>;
   162			};
   163	
   164			cpu2: cpu@200 {
   165				device_type = "cpu";
   166				compatible = "arm,cortex-a720";
   167				reg = <0x200>;
   168				performance-domains = <&performance 0>;
   169				enable-method = "psci";
   170				clock-frequency = <2100000000>;
   171				capacity-dmips-mhz = <714>;
   172				cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
   173						   &system_vcore &s2idle>;
   174				i-cache-size = <65536>;
   175				i-cache-line-size = <64>;
   176				i-cache-sets = <256>;
   177				d-cache-size = <65536>;
   178				d-cache-line-size = <64>;
   179				d-cache-sets = <256>;
   180				next-level-cache = <&l2_0>;
   181				#cooling-cells = <2>;
   182			};
   183	
   184			cpu3: cpu@300 {
   185				device_type = "cpu";
   186				compatible = "arm,cortex-a720";
   187				reg = <0x300>;
   188				performance-domains = <&performance 0>;
   189				enable-method = "psci";
   190				clock-frequency = <2100000000>;
   191				capacity-dmips-mhz = <714>;
   192				cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
   193						   &system_vcore &s2idle>;
   194				i-cache-size = <65536>;
   195				i-cache-line-size = <64>;
   196				i-cache-sets = <256>;
   197				d-cache-size = <65536>;
   198				d-cache-line-size = <64>;
   199				d-cache-sets = <256>;
   200				next-level-cache = <&l2_0>;
   201				#cooling-cells = <2>;
   202			};
   203	
   204			cpu4: cpu@400 {
   205				device_type = "cpu";
   206				compatible = "arm,cortex-x4";
   207				reg = <0x400>;
   208				performance-domains = <&performance 1>;
   209				enable-method = "psci";
   210				clock-frequency = <2800000000>;
   211				capacity-dmips-mhz = <1024>;
   212				cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m
   213						   &system_vcore &s2idle>;
   214				i-cache-size = <65536>;
   215				i-cache-line-size = <64>;
   216				i-cache-sets = <256>;
   217				d-cache-size = <65536>;
   218				d-cache-line-size = <64>;
   219				d-cache-sets = <256>;
   220				next-level-cache = <&l2_1>;
   221				#cooling-cells = <2>;
   222			};
   223	
   224			cpu5: cpu@500 {
   225				device_type = "cpu";
   226				compatible = "arm,cortex-x4";
   227				reg = <0x500>;
   228				performance-domains = <&performance 1>;
   229				enable-method = "psci";
   230				clock-frequency = <2800000000>;
   231				capacity-dmips-mhz = <1024>;
   232				cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m
   233						   &system_vcore &s2idle>;
   234				i-cache-size = <65536>;
   235				i-cache-line-size = <64>;
   236				i-cache-sets = <256>;
   237				d-cache-size = <65536>;
   238				d-cache-line-size = <64>;
   239				d-cache-sets = <256>;
   240				next-level-cache = <&l2_1>;
   241				#cooling-cells = <2>;
   242			};
   243	
   244			cpu6: cpu@600 {
   245				device_type = "cpu";
   246				compatible = "arm,cortex-x4";
   247				reg = <0x600>;
   248				performance-domains = <&performance 1>;
   249				enable-method = "psci";
   250				clock-frequency = <2800000000>;
   251				capacity-dmips-mhz = <1024>;
   252				cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m
   253						   &system_vcore &s2idle>;
   254				i-cache-size = <65536>;
   255				i-cache-line-size = <64>;
   256				i-cache-sets = <256>;
   257				d-cache-size = <65536>;
   258				d-cache-line-size = <64>;
   259				d-cache-sets = <256>;
   260				next-level-cache = <&l2_1>;
   261				#cooling-cells = <2>;
   262			};
   263	
   264			cpu7: cpu@700 {
   265				device_type = "cpu";
   266				compatible = "arm,cortex-x925";
   267				reg = <0x700>;
   268				performance-domains = <&performance 2>;
   269				enable-method = "psci";
   270				clock-frequency = <3600000000>;
   271				capacity-dmips-mhz = <937>;
   272				cpu-idle-states = <&cpuoff_b &clusteroff_b &mcusysoff_b
   273						   &system_vcore &s2idle>;
   274				i-cache-size = <65536>;
   275				i-cache-line-size = <64>;
   276				i-cache-sets = <256>;
   277				d-cache-size = <65536>;
   278				d-cache-line-size = <64>;
   279				d-cache-sets = <256>;
   280				next-level-cache = <&l2_2>;
   281				#cooling-cells = <2>;
   282			};
   283	
   284			cpu-map {
   285				cluster0 {
   286					core0 {
   287						cpu = <&cpu0>;
   288					};
   289					core1 {
   290						cpu = <&cpu1>;
   291					};
   292					core2 {
   293						cpu = <&cpu2>;
   294					};
   295					core3 {
   296						cpu = <&cpu3>;
   297					};
   298				};
   299	
   300				cluster1 {
   301					core0 {
   302						cpu = <&cpu4>;
   303					};
   304					core1 {
   305						cpu = <&cpu5>;
   306					};
   307					core2 {
   308						cpu = <&cpu6>;
   309					};
   310				};
   311	
   312				cluster2 {
   313					core0 {
   314						cpu = <&cpu7>;
   315					};
   316				};
   317			};
   318	
   319			idle-states {
   320				entry-method = "arm,psci";
   321				cpuoff_l: cpuoff-l {
   322					compatible = "arm,idle-state";
   323					arm,psci-suspend-param = <0x00010000>;
   324					local-timer-stop;
   325					entry-latency-us = <97>;
   326					exit-latency-us = <252>;
   327					min-residency-us = <6710>;
   328				};
   329	
   330				cpuoff_m: cpuoff-m {
   331					compatible = "arm,idle-state";
   332					arm,psci-suspend-param = <0x00010000>;
   333					local-timer-stop;
   334					entry-latency-us = <53>;
   335					exit-latency-us = <143>;
   336					min-residency-us = <2120>;
   337				};
   338	
   339				cpuoff_b: cpuoff-b {
   340					compatible = "arm,idle-state";
   341					arm,psci-suspend-param = <0x00010000>;
   342					local-timer-stop;
   343					entry-latency-us = <40>;
   344					exit-latency-us = <107>;
   345					min-residency-us = <2580>;
   346				};
   347	
   348				clusteroff_l: clusteroff-l {
   349					compatible = "arm,idle-state";
   350					arm,psci-suspend-param = <0x01010001>;
   351					local-timer-stop;
   352					entry-latency-us = <109>;
   353					exit-latency-us = <325>;
   354					min-residency-us = <6710>;
   355				};
   356	
   357				clusteroff_m: clusteroff-m {
   358					compatible = "arm,idle-state";
   359					arm,psci-suspend-param = <0x01010001>;
   360					local-timer-stop;
   361					entry-latency-us = <59>;
   362					exit-latency-us = <188>;
   363					min-residency-us = <2120>;
   364				};
   365	
   366				clusteroff_b: clusteroff-b {
   367					compatible = "arm,idle-state";
   368					arm,psci-suspend-param = <0x01010001>;
   369					local-timer-stop;
   370					entry-latency-us = <43>;
   371					exit-latency-us = <138>;
   372					min-residency-us = <2580>;
   373				};
   374	
   375				mcusysoff_l: mcusysoff-l {
   376					compatible = "arm,idle-state";
   377					arm,psci-suspend-param = <0x02010007>;
   378					local-timer-stop;
   379					entry-latency-us = <1357>;
   380					exit-latency-us = <835>;
   381					min-residency-us = <6710>;
   382				};
   383	
   384				mcusysoff_m: mcusysoff-m {
   385					compatible = "arm,idle-state";
   386					arm,psci-suspend-param = <0x02010007>;
   387					local-timer-stop;
   388					entry-latency-us = <1202>;
   389					exit-latency-us = <679>;
   390					min-residency-us = <2120>;
   391				};
   392	
   393				mcusysoff_b: mcusysoff-b {
   394					compatible = "arm,idle-state";
   395					arm,psci-suspend-param = <0x02010007>;
   396					local-timer-stop;
   397					entry-latency-us = <1143>;
   398					exit-latency-us = <611>;
   399					min-residency-us = <2580>;
   400				};
   401	
   402				system_vcore: system-vcore {
   403					compatible = "arm,idle-state";
   404					arm,psci-suspend-param = <0x020100ff>;
   405					local-timer-stop;
   406					entry-latency-us = <940>;
   407					exit-latency-us = <3500>;
   408					min-residency-us = <35200>;
   409				};
   410	
   411				s2idle: s2idle {
   412					compatible = "arm,idle-state";
   413					arm,psci-suspend-param = <0x020180ff>;
   414					local-timer-stop;
   415					entry-latency-us = <10000>;
   416					exit-latency-us = <10000>;
   417					min-residency-us = <4294967295>;
   418				};
   419			};
   420	
   421			l2_0: l2-cache0 {
   422				compatible = "cache";
   423				cache-level = <2>;
   424				cache-size = <524288>;
   425				cache-line-size = <64>;
   426				cache-sets = <2048>;
   427				next-level-cache = <&l3_0>;
   428				cache-unified;
   429			};
   430	
   431			l2_1: l2-cache1 {
   432				compatible = "cache";
   433				cache-level = <2>;
   434				cache-size = <1048576>;
   435				cache-line-size = <64>;
   436				cache-sets = <4096>;
   437				next-level-cache = <&l3_0>;
   438				cache-unified;
   439			};
   440	
   441			l2_2: l2-cache2 {
   442				compatible = "cache";
   443				cache-level = <2>;
   444				cache-size = <2097152>;
   445				cache-line-size = <64>;
   446				cache-sets = <8192>;
   447				next-level-cache = <&l3_0>;
   448				cache-unified;
   449			};
   450	
   451			l3_0: l3-cache {
   452				compatible = "cache";
   453				cache-level = <3>;
   454				cache-size = <12582912>;
   455				cache-line-size = <64>;
   456				cache-sets = <49152>;
   457				cache-unified;
   458			};
   459		};
   460	
   461		clk_ao: clk-ao {
   462			compatible = "simple-bus";
   463			#address-cells = <1>;
   464			#size-cells = <0>;
   465		};
   466	
   467		clkitg: clkitg {
   468			compatible = "simple-bus";
   469			#address-cells = <1>;
   470			#size-cells = <0>;
   471		};
   472	
   473		clocks {
   474			clk_null: clk-null {
   475				compatible = "fixed-clock";
   476				#clock-cells = <0>;
   477				clock-frequency = <0>;
   478			};
   479	
   480			clk32k: clk32k {
   481				compatible = "fixed-clock";
   482				#clock-cells = <0>;
   483				clock-frequency = <32000>;
   484			};
   485	
   486			clk13m: clk13m {
   487				compatible = "fixed-clock";
   488				#clock-cells = <0>;
   489				clock-frequency = <13000000>;
   490			};
   491	
   492			clk26m: clk26m {
   493				compatible = "fixed-clock";
   494				#clock-cells = <0>;
   495				clock-frequency = <26000000>;
   496			};
   497	
   498			/*
   499			 * ulposc: Ultra Low Power Oscillator
   500			 * It is used by soc when the 26Mhz clock is turned
   501			 * off. It also is used by other modules.
   502			 */
   503			ulposc: ulposc {
   504				compatible = "fixed-clock";
   505				#clock-cells = <0>;
   506				clock-frequency = <520000000>;
   507			};
   508	
   509			/*
   510			 * ulposc3: Ultra Low Power Oscillator 3
   511			 * It is used by soc when the 26Mhz clock is turned
   512			 * off. It also is used by other modules.
   513			 */
   514			ulposc3: ulposc3 {
   515				compatible = "fixed-clock";
   516				#clock-cells = <0>;
   517				clock-frequency = <26000000>;
   518			};
   519	
   520			clk104m: clk104m {
   521				compatible = "fixed-clock";
   522				#clock-cells = <0>;
   523				clock-frequency = <104000000>;
   524			};
   525		};
   526	
   527		firmware: firmware {
   528			mtk-svp-heap {
   529				compatible = "mediatek,secure-heap";
   530				memory-region = <&restricted_region>;
   531			};
   532	
   533			optee {
   534				compatible = "linaro,optee-tz";
   535				method = "smc";
   536				interrupts-extended = <&gic GIC_SPI 955 IRQ_TYPE_LEVEL_HIGH 0>;
   537			};
   538	
   539			scmi: scmi {
   540				compatible = "arm,scmi";
   541				mboxes = <&tinysys_mbox 0>, <&tinysys_mbox 1>;
   542				shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
   543				mbox-names = "tx", "rx";
   544				#address-cells = <1>;
   545				#size-cells = <0>;
   546	
   547				scmi_tinysys: protocol@80 {
   548					reg = <0x80>;
   549					scmi-cm = <9>;
   550				};
   551			};
   552		};
   553	
   554		memory: memory@80000000 {
   555			device_type = "memory";
   556			reg = <0 0x80000000 0 0x40000000>;
   557		};
   558	
   559		pmu_hunter: pmu-hunter {
   560			compatible = "arm,cortex-a720-pmu";
   561			interrupt-parent = <&gic>;
   562			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
   563		};
   564	
   565		pmu_hunter_elp: pmu-hunter-elp {
   566			compatible = "arm,cortex-x4-pmu";
   567			interrupt-parent = <&gic>;
   568			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
   569		};
   570	
   571		pmu_blackhawk: pmu-blackhawk{
   572			compatible = "arm,cortex-x925-pmu";
   573			interrupt-parent = <&gic>;
   574			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
   575		};
   576	
   577		reserved-memory {
   578			#address-cells = <2>;
   579			#size-cells = <2>;
   580			ranges;
   581	
   582			adsp_mem_reserved: adsp-mem-region@90000000 {
   583				compatible = "mediatek,adsp-reserved-memory";
   584				reg = <0 0x90000000 0 0x600000>;
   585				no-map;
   586			};
   587	
   588			afe_dma_mem_reserved: snd-dma-mem-region@90600000 {
   589				compatible = "shared-dma-pool";
   590				reg = <0 0x90600000 0 0x200000>;
   591				no-map;
   592			};
   593	
   594			adsp_dma_mem_reserved: adsp-dma-mem-region@90800000 {
   595				compatible = "shared-dma-pool";
   596				reg = <0 0x90800000 0 0x100000>;
   597				no-map;
   598			};
   599	
   600			apu_reserve_memory: apu-reserve-memory@95000000 {
   601				compatible = "mediatek,apu-resv-mem";
   602				reg = <0 0x95000000 0 0x1400000>;
   603				no-map;
   604			};
   605	
   606			gpueb_resv_mem: gpueb-reserved-memory@a0000000 {
   607				compatible = "mediatek,gpueb-resv-mem";
   608				reg = <0 0xa0000000 0 0x200000>; /* 2 MB */
   609				no-map;
   610			};
   611	
   612			vcp_resv_mem: vcp-reserved-memory@a0200000 {
   613				compatible = "mediatek,me-vcp-reserved";
   614				reg = <0 0xa0200000 0 0x01e00000>; /* 30MB */
   615				iommu-addresses = <0 0x00000000 1 0x40000000>; /* 1G */
   616				no-map;
   617			};
   618	
   619			mali_protected: mali-protected@a2000000 { /* 16MB */
   620				compatible = "mali-reserved";
   621				reg = <0x0 0xa2000000 0x0 0x1000000>;
   622				no-map;
   623			};
   624	
   625			restricted_region: secure-region@a3000000 {
   626				compatible = "mediatek,dynamic-restricted-region";
   627				reg = <0 0xa3000000 0 0x1bc00000>; /* 444MB */
   628				no-map;
   629			};
   630	
   631			apu_smmu_reserve_memory0: apu-smmu-reserve-memory0 {
   632				compatible = "mediatek,apu-smmu-resv-mem";
   633				iommu-addresses = <&apusys_rv 0x0 0x0 0x0 0x40000000>,
   634						  <&apusys_rv 0x0 0x4c000000 0x0 0x4000000>,
   635						  <&apusys_rv 0x0 0x6c000000 0x0 0x4000000>;
   636			};
   637		};
   638	
   639		timer: timer {
   640			compatible = "arm,armv8-timer";
   641			interrupt-parent = <&gic>;
   642			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
   643					<GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
   644					<GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
   645					<GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
   646			clock-frequency = <13000000>;
   647		};
   648	
   649		psci {
   650			compatible = "arm,psci-1.0";
   651			method = "smc";
   652		};
   653	
   654		ged: ged {
   655			compatible = "mediatek,ged";
   656			gpufreq-supply = <&gpufreq>;
   657		};
   658	
   659		gpu_dcs: gpu-dcs {
   660			compatible = "mediatek,gpu-dcs";
   661		};
   662	
   663		gpu_dvfs_mode: gpu-loading-mode {
   664			compatible = "mediatek,gpu-loading-mode";
   665			dvfs-loading-mode = <0>;
   666			dvfs-workload-mode = <6>;
   667		};
   668	
   669		gpu_mali_opp: opp-table-gpu {
   670			compatible = "operating-points-v2";
   671	
   672			opp00 {
   673				opp-hz = /bits/ 64 <1612000000>;
   674				opp-microvolt = <795000>;
   675			};
   676	
   677			opp01 {
   678				opp-hz = /bits/ 64 <1586000000>;
   679				opp-microvolt = <790000>;
   680			};
   681	
   682			opp02 {
   683				opp-hz = /bits/ 64 <1560000000>;
   684				opp-microvolt = <785000>;
   685			};
   686	
   687			opp03 {
   688				opp-hz = /bits/ 64 <1534000000>;
   689				opp-microvolt = <780000>;
   690			};
   691	
   692			opp04 {
   693				opp-hz = /bits/ 64 <1508000000>;
   694				opp-microvolt = <770000>;
   695			};
   696	
   697			opp05 {
   698				opp-hz = /bits/ 64 <1482000000>;
   699				opp-microvolt = <765000>;
   700			};
   701	
   702			opp06 {
   703				opp-hz = /bits/ 64 <1456000000>;
   704				opp-microvolt = <760000>;
   705			};
   706	
   707			opp07 {
   708				opp-hz = /bits/ 64 <1430000000>;
   709				opp-microvolt = <750000>;
   710			};
   711	
   712			opp08 {
   713				opp-hz = /bits/ 64 <1404000000>;
   714				opp-microvolt = <745000>;
   715			};
   716	
   717			opp09 {
   718				opp-hz = /bits/ 64 <1378000000>;
   719				opp-microvolt = <740000>;
   720			};
   721	
   722			opp10 {
   723				opp-hz = /bits/ 64 <1352000000>;
   724				opp-microvolt = <735000>;
   725			};
   726	
   727			opp11 {
   728				opp-hz = /bits/ 64 <1326000000>;
   729				opp-microvolt = <730000>;
   730			};
   731	
   732			opp12 {
   733				opp-hz = /bits/ 64 <1300000000>;
   734				opp-microvolt = <720000>;
   735			};
   736	
   737			opp13 {
   738				opp-hz = /bits/ 64 <1274000000>;
   739				opp-microvolt = <715000>;
   740			};
   741	
   742			opp14 {
   743				opp-hz = /bits/ 64 <1248000000>;
   744				opp-microvolt = <710000>;
   745			};
   746	
   747			opp15 {
   748				opp-hz = /bits/ 64 <1222000000>;
   749				opp-microvolt = <705000>;
   750			};
   751	
   752			opp16 {
   753				opp-hz = /bits/ 64 <1196000000>;
   754				opp-microvolt = <695000>;
   755			};
   756	
   757			opp17 {
   758				opp-hz = /bits/ 64 <1170000000>;
   759				opp-microvolt = <690000>;
   760			};
   761	
   762			opp18 {
   763				opp-hz = /bits/ 64 <1144000000>;
   764				opp-microvolt = <685000>;
   765			};
   766	
   767			opp19 {
   768				opp-hz = /bits/ 64 <1118000000>;
   769				opp-microvolt = <680000>;
   770			};
   771	
   772			opp20 {
   773				opp-hz = /bits/ 64 <1092000000>;
   774				opp-microvolt = <670000>;
   775			};
   776	
   777			opp21 {
   778				opp-hz = /bits/ 64 <1066000000>;
   779				opp-microvolt = <665000>;
   780			};
   781	
   782			opp22 {
   783				opp-hz = /bits/ 64 <1040000000>;
   784				opp-microvolt = <660000>;
   785			};
   786	
   787			opp23 {
   788				opp-hz = /bits/ 64 <1014000000>;
   789				opp-microvolt = <655000>;
   790			};
   791	
   792			opp24 {
   793				opp-hz = /bits/ 64 <988000000>;
   794				opp-microvolt = <645000>;
   795			};
   796	
   797			opp25 {
   798				opp-hz = /bits/ 64 <962000000>;
   799				opp-microvolt = <640000>;
   800			};
   801	
   802			opp26 {
   803				opp-hz = /bits/ 64 <936000000>;
   804				opp-microvolt = <635000>;
   805			};
   806	
   807			opp27 {
   808				opp-hz = /bits/ 64 <910000000>;
   809				opp-microvolt = <630000>;
   810			};
   811	
   812			opp28 {
   813				opp-hz = /bits/ 64 <884000000>;
   814				opp-microvolt = <620000>;
   815			};
   816	
   817			opp29 {
   818				opp-hz = /bits/ 64 <858000000>;
   819				opp-microvolt = <615000>;
   820			};
   821	
   822			opp30 {
   823				opp-hz = /bits/ 64 <832000000>;
   824				opp-microvolt = <610000>;
   825			};
   826	
   827			opp31 {
   828				opp-hz = /bits/ 64 <806000000>;
   829				opp-microvolt = <605000>;
   830			};
   831	
   832			opp32 {
   833				opp-hz = /bits/ 64 <780000000>;
   834				opp-microvolt = <600000>;
   835			};
   836	
   837			opp33 {
   838				opp-hz = /bits/ 64 <754000000>;
   839				opp-microvolt = <590000>;
   840			};
   841	
   842			opp34 {
   843				opp-hz = /bits/ 64 <728000000>;
   844				opp-microvolt = <585000>;
   845			};
   846	
   847			opp35 {
   848				opp-hz = /bits/ 64 <702000000>;
   849				opp-microvolt = <580000>;
   850			};
   851	
   852			opp36 {
   853				opp-hz = /bits/ 64 <676000000>;
   854				opp-microvolt = <575000>;
   855			};
   856	
   857			opp37 {
   858				opp-hz = /bits/ 64 <650000000>;
   859				opp-microvolt = <560000>;
   860			};
   861	
   862			opp38 {
   863				opp-hz = /bits/ 64 <624000000>;
   864				opp-microvolt = <560000>;
   865			};
   866	
   867			opp39 {
   868				opp-hz = /bits/ 64 <598000000>;
   869				opp-microvolt = <555000>;
   870			};
   871	
   872			opp40 {
   873				opp-hz = /bits/ 64 <572000000>;
   874				opp-microvolt = <550000>;
   875			};
   876	
   877			opp41 {
   878				opp-hz = /bits/ 64 <546000000>;
   879				opp-microvolt = <540000>;
   880			};
   881	
   882			opp42 {
   883				opp-hz = /bits/ 64 <520000000>;
   884				opp-microvolt = <535000>;
   885			};
   886	
   887			opp43 {
   888				opp-hz = /bits/ 64 <494000000>;
   889				opp-microvolt = <530000>;
   890			};
   891	
   892			opp44 {
   893				opp-hz = /bits/ 64 <468000000>;
   894				opp-microvolt = <525000>;
   895			};
   896	
   897			opp45 {
   898				opp-hz = /bits/ 64 <442000000>;
   899				opp-microvolt = <515000>;
   900			};
   901	
   902			opp46 {
   903				opp-hz = /bits/ 64 <416000000>;
   904				opp-microvolt = <510000>;
   905			};
   906	
   907			opp47 {
   908				opp-hz = /bits/ 64 <390000000>;
   909				opp-microvolt = <505000>;
   910			};
   911	
   912			opp48 {
   913				opp-hz = /bits/ 64 <364000000>;
   914				opp-microvolt = <500000>;
   915			};
   916	
   917			opp49 {
   918				opp-hz = /bits/ 64 <338000000>;
   919				opp-microvolt = <490000>;
   920			};
   921		};
   922	
   923		gpu_protected_memory_allocator: protected-memory-allocator {
   924			compatible = "arm,protected-memory-allocator";
   925			memory-region = <&mali_protected>;
   926		};
   927	
   928		gpufreq_wrapper: gpufreq-wrapper {
   929			compatible = "mediatek,gpufreq-wrapper";
   930			gpufreq-version = <2>;
   931			dual-buck = <1>;
   932			gpueb-support;
   933			ghpm-supply = <&ghpm>;
   934		};
   935	
   936		mgm: mgm {
   937			compatible = "arm,physical-memory-group-manager";
   938		};
   939	
   940		soc {
   941			compatible = "simple-bus";
   942			#address-cells = <2>;
   943			#size-cells = <2>;
   944			ranges;
   945			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
   946	
   947			therm_intf: therm-intf@114000 {
   948				compatible = "mediatek,therm_intf";
   949				reg = <0 0x00114000 0 0x400>,
   950				      <0 0x0c2cd450 0 0x400>;
   951				reg-names = "sram", "cputcm";
   952				mediatek,init-ttj-cpu = <95000>;
   953				mediatek,init-ttj-gpu = <95000>;
   954				mediatek,init-ttj-npu = <95000>;
   955			};
   956	
   957			slbc: slbc@117800 {
   958				compatible = "mediatek,mt8196-slbc";
   959				reg = <0 0x00117800 0 0x400>;
   960			};
   961	
   962			qos: qos@11bb00 {
   963				compatible = "mediatek,mt8196-qos";
   964				reg = <0 0x0011bb00 0 0x100>,
   965				      <0 0x0011b9c0 0 0x140>,
   966				      <0 0x0011b920 0 0xa0>;
   967				reg-names = "sram", "share_sram", "share_sram_ext";
   968				mediatek,enable;
   969				scmi-tinysys-supply = <&scmi_tinysys>;
   970			};
   971	
   972			csram_sys: csram-sysram@11bc00 {
   973				reg = <0 0x11bc00 0 0x1400>; /* 5KB */
   974			};
   975	
   976			gpu_qos: gpu-qos@13f800 {
   977				compatible = "mediatek,gpu-qos";
   978				reg = <0 0x13f800 0 0x20>;
   979				qos-mode = <0>;
   980				qos-sysram-support;
   981				qos-value = <0>;
   982			};
   983	
   984			cpu_mcucfg: mcusys-ao-cfg@c000000 {
   985				reg = <0 0xc000000 0 0x10000>; /* 64KB */
   986			};
   987	
   988			cpu_pll: mcusys-pll1u-top@c030000 {
   989				reg = <0 0xc030000 0 0x1000>; /* 4KB */
   990			};
   991	
   992			cm_mgr: cm-mgr@c100000 {
   993				compatible = "mediatek,mt8196-cm-mgr";
   994				reg = <0 0xc100000 0 0x9000>;
   995				reg-names = "cm_mgr_base";
   996				interconnects = <&dvfsrc MT6873_MASTER_MCU_1 &dvfsrc MT6873_SLAVE_DDR_EMI>;
   997				interconnect-names = "cm-perf-bw";
   998				cpuhvfs = <&cpuhvfs>;
   999				required-opps = <&dvfsrc_freq_opp0>,
  1000						<&dvfsrc_freq_opp1>,
  1001						<&dvfsrc_freq_opp2>,
  1002						<&dvfsrc_freq_opp3>,
  1003						<&dvfsrc_freq_opp4>,
  1004						<&dvfsrc_freq_opp5>,
  1005						<&dvfsrc_freq_opp6>,
  1006						<&dvfsrc_freq_opp7>,
  1007						<&dvfsrc_freq_opp8>,
  1008						<&dvfsrc_freq_opp9>;
  1009				mediatek,cm-mgr-enable;
  1010				mediatek,cm-mgr-arch = "v1p";
  1011	
  1012				mediatek,cm-mgr-num-array = <7>;
  1013				mediatek,cm-mgr,cp-down  = <100 100 100 100 100 100 100>;
  1014				mediatek,cm-mgr,cp-up = <100 100 100 100 100 100 100>;
  1015				mediatek,cm-mgr,dt-down = <0 0 0 0 0 0 0>;
  1016				mediatek,cm-mgr,dt-up = <0 0 0 0 0 0 0>;
  1017				mediatek,cm-mgr,vp-down = <100 100 100 100 100 100 100>;
  1018				mediatek,cm-mgr,vp-up = <100 100 100 100 100 100 100>;
  1019	
  1020				mediatek,cm-mgr-cpu-opp-to-dram = <3 3 9 9 9 9 9 9
  1021							9 9 9 9 9 9 9 9
  1022							9 9 9 9 9 9 9 9
  1023							9 9 9 9 9 9 9 9>;
  1024				mediatek,cm-perf-mode-enable;
  1025				mediatek,cm-perf-mode-ceiling-opp = <0>;
  1026				mediatek,cm-perf-mode-thd = <5>;
  1027			};
  1028	
  1029			ccipll_pll_ctrl_clk: syscon@c1e0000 {
  1030				/* TODO: Fix compatible in driver */
  1031				compatible = "mediatek,mt8196-ccipll-pll-ctrl", "mediatek,mt8196-ccipll_pll_ctrl", "syscon";
  1032				reg = <0 0xc1e0000 0 0x400>;
  1033				#clock-cells = <1>;
  1034			};
  1035	
  1036			armpll_ll_pll_ctrl_clk: syscon@c1e0400 {
  1037				/* TODO: Fix compatible in driver */
  1038				compatible = "mediatek,mt8196-armpll-ll-pll-ctrl", "mediatek,mt8196-armpll_ll_pll_ctrl", "syscon";
  1039				reg = <0 0xc1e0400 0 0x400>;
  1040				#clock-cells = <1>;
  1041			};
  1042	
  1043			armpll_bl_pll_ctrl_clk: syscon@c1e0800 {
  1044				/* TODO: Fix compatible in driver */
  1045				compatible = "mediatek,mt8196-armpll-bl-pll-ctrl", "mediatek,mt8196-armpll_bl_pll_ctrl", "syscon";
  1046				reg = <0 0xc1e0800 0 0x400>;
  1047				#clock-cells = <1>;
  1048			};
  1049	
  1050			armpll_b_pll_ctrl_clk: syscon@c1e0c00 {
  1051				/* TODO: Fix compatible in driver */
  1052				compatible = "mediatek,mt8196-armpll-b-pll-ctrl", "mediatek,mt8196-armpll_b_pll_ctrl", "syscon";
  1053				reg = <0 0xc1e0c00 0 0x1000>;
  1054				#clock-cells = <1>;
  1055			};
  1056	
  1057			ptppll_pll_ctrl_clk: syscon@c1e4000 {
  1058				/* TODO: Fix compatible in driver */
  1059				compatible = "mediatek,mt8196-ptppll-pll-ctrl", "mediatek,mt8196-ptppll_pll_ctrl", "syscon";
  1060				reg = <0 0xc1e4000 0 0x1000>;
  1061				#clock-cells = <1>;
  1062			};
  1063	
  1064			fdvfs: fdvfs@c220400 {
  1065				compatible = "mediatek,fdvfs";
  1066				reg = <0 0x0c220400 0 0x20>,
  1067					<0 0x0c220420 0 0x4>,
  1068					<0 0x0c2c2034 0 0x4>;
  1069				reg-names = "fdvfs-reg",
  1070					"fdvfs-cci-reg",
  1071					"fdvfs-support";
  1072			};
  1073	
  1074			mcupm: mcupm@c240000 {
  1075				compatible = "mediatek,mt8196-mcupm";
  1076				reg = <0 0x0c240000 0 0x50000>,
  1077				      <0 0x0c2cf600 0 0xa0>,
  1078				      <0 0x0c242004 0 0x4>,
  1079				      <0 0x0c242018 0 0x4>,
  1080				      <0 0x0c242000 0 0x4>,
  1081				      <0 0x0c242010 0 0x4>;
  1082				reg-names = "mcupm_base",
  1083					    "mbox0_base",
  1084					    "mbox0_set",
  1085					    "mbox0_clr",
  1086					    "mbox0_send",
  1087					    "mbox0_recv";
  1088				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,
  1089					     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
  1090					     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
  1091					     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>,
  1092					     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH 0>,
  1093					     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH 0>,
  1094					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH 0>,
  1095					     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH 0>,
  1096					     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH 0>,
  1097					     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH 0>,
  1098					     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH 0>,
  1099					     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH 0>,
  1100					     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH 0>,
  1101					     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH 0>,
  1102					     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH 0>,
  1103					     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH 0>;
  1104				interrupt-names = "mbox0",
  1105						  "mbox1",
  1106						  "mbox2",
  1107						  "mbox3",
  1108						  "mbox4",
  1109						  "mbox5",
  1110						  "mbox6",
  1111						  "mbox7",
  1112						  "mbox8",
  1113						  "mbox9",
  1114						  "mbox10",
  1115						  "mbox11",
  1116						  "mbox12",
  1117						  "mbox13",
  1118						  "mbox14",
  1119						  "mbox15";
  1120				mediatek,mbox-extend = <16>;
  1121			};
  1122	
  1123			performance: performance-controller@c2c0f20 {
  1124				compatible = "mediatek,cpufreq-hw-v1";
  1125				reg = <0 0xc2c0f20 0 0x120>,
  1126				      <0 0xc2c1040 0 0x120>,
  1127				      <0 0xc2c1160 0 0x120>;
  1128				reg-names = "performance-domain0",
  1129					    "performance-domain1",
  1130					    "performance-domain2";
  1131				#performance-domain-cells = <1>;
  1132			};
  1133	
  1134			cpuhvfs: cpuhvfs@c2c2310 {
  1135				compatible = "mediatek,cpufreq-hybrid";
  1136				reg = <0 0x0c2c2310 0 0xc00>,
  1137				      <0 0x0c2c0f10 0 0x1400>,
  1138				      <0 0x0c2c4850 0 0x800>,
  1139				      <0 0x0c2c2e50 0 0xc0>;
  1140				reg-names = "USRAM", "CSRAM", "ESRAM", "FREQ_HW_STATE";
  1141	
  1142				/* pll mcucfg */
  1143				mcucfg-ver = <0>;
  1144				apmixedsys = <&cpu_pll>;
  1145				clk-div-base = <&cpu_mcucfg>;
  1146	
  1147				/* csram sysram base */
  1148				csram-sys-base = <&csram_sys>;
  1149			};
  1150	
  1151			gic: interrupt-controller@c400000 {
  1152				compatible = "arm,gic-v3";
  1153				reg = <0 0xc400000 0 0x40000>, /* distributor */
  1154				      <0 0xc440000 0 0x200000>; /* redistributor */
  1155				#interrupt-cells = <4>;
  1156				#address-cells = <2>;
  1157				#size-cells = <2>;
  1158				#redistributor-regions = <1>;
  1159				interrupt-parent = <&gic>;
  1160				interrupt-controller;
  1161				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
  1162	
  1163				ppi-partitions {
  1164					ppi_cluster0: interrupt-partition-0 {
  1165						affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
  1166					};
  1167	
  1168					ppi_cluster1: interrupt-partition-1 {
  1169						affinity = <&cpu4 &cpu5 &cpu6>;
  1170					};
  1171	
  1172					ppi_cluster2: interrupt-partition-2 {
  1173						affinity = <&cpu7>;
  1174					};
  1175				};
  1176			};
  1177	
  1178			cksys_clk: syscon@10000000 {
  1179				compatible = "mediatek,mt8196-cksys", "syscon";
  1180				reg = <0 0x10000000 0 0x800>;
  1181				hw-voter-regmap = <&hwv>;
  1182				#clock-cells = <1>;
  1183			};
  1184	
  1185			apmixedsys_clk: syscon@10000800 {
  1186				compatible = "mediatek,mt8196-apmixedsys", "syscon";
  1187				reg = <0 0x10000800 0 0x1000>;
  1188				#clock-cells = <1>;
  1189			};
  1190	
  1191			cksys_gp2_clk: syscon@1000c000 {
  1192				compatible = "mediatek,mt8196-cksys-gp2", "syscon";
  1193				reg = <0 0x1000c000 0 0x800>;
  1194				mm-hw-ccf-regmap = <&mm_hwv>;
  1195				#clock-cells = <1>;
  1196			};
  1197	
  1198			apmixedsys_gp2_clk: syscon@1000c800 {
  1199				/* TODO: Fix compatible in driver */
  1200				compatible = "mediatek,mt8196-apmixedsys-gp2", "mediatek,mt8196-apmixedsys_gp2", "syscon";
  1201				reg = <0 0x1000c800 0 0x1000>;
  1202				#clock-cells = <1>;
  1203			};
  1204	
  1205			ifr_bus: syscon@1002c000 {
  1206				/* TODO: Fix compatible in driver */
  1207				compatible = "mediatek,mt8196-ifr-bus", "mediatek,mt8196-ifr_bus", "syscon";
  1208				reg = <0 0x1002c000 0 0x1000>;
  1209			};
  1210	
  1211			pio: pinctrl@1002d000 {
  1212				compatible = "mediatek,mt8196-pinctrl";
  1213				reg = <0 0x1002d000 0 0x1000>,
  1214				      <0 0x12000000 0 0x1000>,
  1215				      <0 0x12020000 0 0x1000>,
  1216				      <0 0x12040000 0 0x1000>,
  1217				      <0 0x12060000 0 0x1000>,
  1218				      <0 0x12820000 0 0x1000>,
  1219				      <0 0x12840000 0 0x1000>,
  1220				      <0 0x12860000 0 0x1000>,
  1221				      <0 0x13000000 0 0x1000>,
  1222				      <0 0x13020000 0 0x1000>,
  1223				      <0 0x13040000 0 0x1000>,
  1224				      <0 0x130f0000 0 0x1000>,
  1225				      <0 0x13110000 0 0x1000>,
  1226				      <0 0x13800000 0 0x1000>,
  1227				      <0 0x13820000 0 0x1000>,
  1228				      <0 0x13860000 0 0x1000>,
  1229				      <0 0x12080000 0 0x1000>,
  1230				      <0 0x12880000 0 0x1000>,
  1231				      <0 0x13080000 0 0x1000>,
  1232				      <0 0x13880000 0 0x1000>,
  1233				      <0 0x1c54a000 0 0x1000>;
  1234				reg-names = "iocfg0",
  1235					    "iocfg_rt",
  1236					    "iocfg_rm1",
  1237					    "iocfg_rm2",
  1238					    "iocfg_rb",
  1239					    "iocfg_bm1",
  1240					    "iocfg_bm2",
  1241					    "iocfg_bm3",
  1242					    "iocfg_lt",
  1243					    "iocfg_lm1",
  1244					    "iocfg_lm2",
  1245					    "iocfg_lb1",
  1246					    "iocfg_lb2",
  1247					    "iocfg_tm1",
  1248					    "iocfg_tm2",
  1249					    "iocfg_tm3",
  1250					    "eint-e",
  1251					    "eint-s",
  1252					    "eint-w",
  1253					    "eint-n",
  1254					    "eint-c";
  1255				gpio-controller;
  1256				#gpio-cells = <2>;
  1257				gpio-ranges = <&pio 0 0 271>;
  1258				interrupt-controller;
  1259				interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH 0>;
  1260				#interrupt-cells = <2>;
  1261			};
  1262	
  1263			memory-controller@10236000 {
  1264				compatible = "mediatek,mt8196-dramc";
  1265				reg = <0 0x10236000 0 0x2000>, /* anaphy base */
  1266				      <0 0x10238000 0 0x2000>;  /* ddrphy base */
  1267			};
  1268	
  1269			devapc_apinfra_dramc: devapc@102f3000 {
  1270				compatible = "mediatek,mt8196-devapc";
  1271				reg = <0 0x102f3000 0 0x1000>;
  1272				vio-idx-num = <61>;
  1273				interrupts = <GIC_SPI 870 IRQ_TYPE_LEVEL_HIGH 0>;
  1274			};
  1275	
  1276			nsmpu: nsmpu@1046f000 {
  1277				/* TODO: Move some property into platform data */
  1278				compatible = "mediatek,smpu";
  1279				reg = <0 0x1046f000 0 0x1000>;
  1280				interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH 0>;
  1281				name = "nsmpu";
  1282				sr-cnt = <63>;
  1283				aid-cnt = <256>;
  1284				aid-num-per-set = <32>;
  1285				dump = <0xe00 0xe08 0xe0c 0xe10 0xe14 0xe18 0xe1c 0xe20 0xe28
  1286					0xe80 0xe88 0xe8c 0xe90 0xe94 0xe98 0xe9c 0xea0 0xea8>;
  1287				dump-md = <0xe40 0xe48 0xe4c 0xe50 0xe54 0xe58 0xe5c 0xe60 0xe68
  1288					0xec0 0xec8 0xecc 0xed0 0xed4 0xed8 0xedc 0xee0 0xee8>;
  1289				clear = <0xe00 0x1 1>,
  1290					<0xe00 0x0 1>,
  1291					<0xe80 0x1 1>,
  1292					<0xe80 0x0 1>;
  1293				mask = <0xe00 0x2 1>,
  1294					<0xe80 0x2 1>,
  1295					<0xe40 0x2 1>,
  1296					<0xec0 0x2 1>;
  1297				clear-md = <0xe40 0x1 1>,
  1298					   <0xe40 0x0 1>,
  1299					   <0xec0 0x1 1>,
  1300					   <0xec0 0x0 1>;
  1301				vio-info = <0x0 0x2 0x9 0x2>;
  1302				bypass = <0xe1c 0xe9c 0xe28 0xea8>;
  1303				bypass-axi = <0x6 0xff80 0x4000 0x7 0xff01 0x4001>;
  1304				bypass-wce = <0x5 0xf3 0x7 0x16>;
  1305				mediatek,slc-b-mode;
  1306			};
  1307	
  1308			ssmpu: ssmpu@1056f000{
  1309				/* TODO: Move some property into platform data */
  1310				compatible = "mediatek,smpu";
  1311				reg = <0 0x1056f000 0 0x1000>;
  1312				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH 0>;
  1313				name = "ssmpu";
  1314				dump = <0xe00 0xe08 0xe0c 0xe10 0xe14 0xe18 0xe1c 0xe20 0xe28
  1315					0xe80 0xe88 0xe8c 0xe90 0xe94 0xe98 0xe9c 0xea0 0xea8>;
  1316				dump-md = <0xe40 0xe48 0xe4c 0xe50 0xe54 0xe58 0xe5c 0xe60 0xe68
  1317					   0xec0 0xec8 0xecc 0xed0 0xed4 0xed8 0xedc 0xee0 0xee8>;
  1318				clear = <0xe00 0x1 1>,
  1319					<0xe00 0x0 1>,
  1320					<0xe80 0x1 1>,
  1321					<0xe80 0x0 1>;
  1322				mask = <0xe00 0x2 1>,
  1323				       <0xe80 0x2 1>,
  1324				       <0xe40 0x2 1>,
  1325				       <0xec0 0x2 1>;
  1326				clear-md = <0xe40 0x1 1>,
  1327					   <0xe40 0x0 1>,
  1328					   <0xec0 0x1 1>,
  1329					   <0xec0 0x0 1>;
  1330				vio-info = <0x0 0x2 0x9 0x2>;
  1331				bypass = <0xe1c 0xe9c 0xe28 0xea8>;
  1332				bypass-axi = <0x6 0xff80 0x4000 0x7 0xff01 0x4001>;
  1333				bypass-wce = <0x5 0xf3 0x7 0x16>;
  1334				mediatek,slc-b-mode;
  1335			};
  1336	
  1337			nkp: nkp@1046f000 {
  1338				/* TODO: Move some property into platform data */
  1339				compatible = "mediatek,smpu";
  1340				reg = <0 0x1046f000 0 0x1000>;
  1341				interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH 0>;
  1342				name = "nkp";
  1343				dump = <0xc00 0xc04 0xc10 0xc14>;
  1344				clear = <0x410 0x1 1>,
  1345					<0x410 0x0 1>;
  1346				mask = <0x410 0x2 1>,
  1347				       <0xe40 0x2 1>,
  1348				       <0xec0 0x2 1>;
  1349				clear-md = <0xe40 0x1 1>,
  1350					   <0xe40 0x0 1>,
  1351					   <0xec0 0x1 1>,
  1352					   <0xec0 0x0 1>;
  1353				vio-info = <0x1 0xf 0x3 0xf>;
  1354				mediatek,slc-b-mode;
  1355			};
  1356	
  1357			skp: skp@1056f000 {
  1358				/* TODO: Move some property into platform data */
  1359				compatible = "mediatek,smpu";
  1360				reg = <0 0x1056f000 0 0x1000>;
  1361				interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>;
  1362				name = "skp";
  1363				dump = <0xc00 0xc04 0xc10 0xc14>;
  1364				clear = <0x410 0x1 1>,
  1365					<0x410 0x0 1>;
  1366				mask = <0x410 0x2 1>,
  1367				       <0xe40 0x2 1>,
  1368				       <0xec0 0x2 1>;
  1369				clear-md = <0xe40 0x1 1>,
  1370					   <0xe40 0x0 1>,
  1371					   <0xec0 0x1 1>,
  1372					   <0xec0 0x0 1>;
  1373				vio-info = <0x1 0xf 0x3 0xf>;
  1374				mediatek,slc-b-mode;
  1375			};
  1376	
  1377			devapc_apinfra_emi: devapc@10613000 {
  1378				compatible = "mediatek,mt8196-devapc";
  1379				reg = <0 0x10613000 0 0x1000>;
  1380				vio-idx-num = <149>;
  1381				interrupts = <GIC_SPI 869 IRQ_TYPE_LEVEL_HIGH 0>;
  1382			};
  1383	
  1384			devapc_apinfra_big4: devapc@10693000 {
  1385				compatible = "mediatek,mt8196-devapc";
  1386				reg = <0 0x10693000 0 0x1000>;
  1387				vio-idx-num = <89>;
  1388				interrupts = <GIC_SPI 863 IRQ_TYPE_LEVEL_HIGH 0>;
  1389			};
  1390	
  1391			i2c5: i2c@120a0000 {
  1392				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1393				reg = <0 0x120a0000 0 0x20000>,
  1394				      <0 0x16400000 0 0x10000>;
  1395				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
  1396				clocks = <&imp_iic_wrap_e_clk CLK_IMPE_I2C5_I2C>,
  1397					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1398				clock-names = "main", "dma";
  1399				clock-div = <1>;
  1400				#address-cells = <1>;
  1401				#size-cells = <0>;
  1402	
  1403				status = "disabled";
  1404			};
  1405	
  1406			imp_iic_wrap_e_clk: syscon@120c0000 {
  1407				/* TODO: Fix compatible in driver */
  1408				compatible = "mediatek,mt8196-imp-iic-wrap-e", "mediatek,mt8196-imp_iic_wrap_e", "syscon";
  1409				reg = <0 0x120c0000 0 0x1000>;
  1410				#clock-cells = <1>;
  1411			};
  1412	
  1413			mipi_tx_config0: mipi-tx-config@130b0000 {
  1414				compatible = "mediatek,mt8196-mipi-tx";
  1415				reg = <0 0x130b0000 0 0x1000>;
  1416				clocks = <&clk26m>;
  1417				#clock-cells = <0>;
  1418				#phy-cells = <0>;
  1419				clock-output-names = "mipi_tx0_pll";
  1420			};
  1421	
  1422			i2c0: i2c@13130000 {
  1423				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1424				reg = <0 0x13130000 0 0x20000>,
  1425				      <0 0x16370000 0 0x10000>;
  1426				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
  1427				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C0_I2C>,
  1428					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1429				clock-names = "main", "dma";
  1430				clock-div = <1>;
  1431				#address-cells = <1>;
  1432				#size-cells = <0>;
  1433	
  1434				status = "disabled";
  1435			};
  1436	
  1437			i2c3: i2c@13150000 {
  1438				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1439				reg = <0 0x13150000 0 0x20000>,
  1440				      <0 0x163c0000 0 0x10000>;
  1441				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH 0>;
  1442				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C3_I2C>,
  1443					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1444				clock-names = "main", "dma";
  1445				clock-div = <1>;
  1446				#address-cells = <1>;
  1447				#size-cells = <0>;
  1448	
  1449				status = "disabled";
  1450			};
  1451	
  1452			i2c6: i2c@13170000 {
  1453				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1454				reg = <0 0x13170000 0 0x20000>,
  1455				      <0 0x16410000 0 0x10000>;
  1456				interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
  1457				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C6_I2C>,
  1458					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1459				clock-names = "main", "dma";
  1460				clock-div = <1>;
  1461				#address-cells = <1>;
  1462				#size-cells = <0>;
  1463	
  1464				status = "disabled";
  1465			};
  1466	
  1467			i2c10: i2c@13190000 {
  1468				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1469				reg = <0 0x13190000 0 0x20000>,
  1470				      <0 0x164b0000 0 0x10000>;
  1471				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
  1472				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C10_I2C>,
  1473					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1474				clock-names = "main", "dma";
  1475				clock-div = <1>;
  1476				#address-cells = <1>;
  1477				#size-cells = <0>;
  1478	
  1479				status = "disabled";
  1480			};
  1481	
  1482			imp_iic_wrap_w_clk: syscon@131b0000 {
  1483				/* TODO: Fix compatible in driver */
  1484				compatible = "mediatek,mt8196-imp-iic-wrap-w", "mediatek,mt8196-imp_iic_wrap_w", "syscon";
  1485				reg = <0 0x131b0000 0 0x1000>;
  1486				#clock-cells = <1>;
  1487			};
  1488	
  1489			efuse: efuse@13260000 {
  1490				compatible = "mediatek,mt8196-efuse", "mediatek,efuse";
  1491				reg = <0 0x13260000 0 0x1000>;
  1492				#address-cells = <1>;
  1493				#size-cells = <1>;
  1494	
  1495				lvts_e_data1: data1@334 {
  1496					reg = <0x334 0xc>;
  1497				};
  1498	
  1499				lvts_e_data2: data2@340 {
  1500					reg = <0x340 0x14>;
  1501				};
  1502	
  1503				lvts_e_data3: data3@354 {
  1504					reg = <0x354 0x20>;
  1505				};
  1506	
  1507				lvts_e_data4: data4@388 {
  1508					reg = <0x388 0x20>;
  1509				};
  1510	
  1511				socinfo-data1@40 {
  1512					reg = <0x40 0x4>;
  1513				};
  1514	
  1515				socinfo-data2@4c {
  1516					reg = <0x4c 0x4>;
  1517				};
  1518			};
  1519	
  1520			i2c1: i2c@13930000 {
  1521				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1522				reg = <0 0x13930000 0 0x80000>,
  1523				      <0 0x16380000 0 0x10000>;
  1524				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH 0>;
  1525				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C1_I2C>,
  1526					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1527				clock-names = "main", "dma";
  1528				clock-div = <1>;
  1529				#address-cells = <1>;
  1530				#size-cells = <0>;
  1531	
  1532				status = "disabled";
  1533			};
  1534	
  1535			i2c2: i2c@139b0000 {
  1536				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1537				reg = <0 0x139b0000 0 0x80000>,
  1538				      <0 0x16390000 0 0x30000>;
  1539				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH 0>;
  1540				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C2_I2C>,
  1541					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1542				clock-names = "main", "dma";
  1543				clock-div = <1>;
  1544				#address-cells = <1>;
  1545				#size-cells = <0>;
  1546	
  1547				status = "disabled";
  1548			};
  1549	
  1550			i2c4: i2c@13a30000 {
  1551				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1552				reg = <0 0x13a30000 0 0x80000>,
  1553				      <0 0x163d0000 0 0x30000>;
  1554				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
  1555				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C4_I2C>,
  1556					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1557				clock-names = "main", "dma";
  1558				clock-div = <1>;
  1559				#address-cells = <1>;
  1560				#size-cells = <0>;
  1561	
  1562				status = "disabled";
  1563			};
  1564	
  1565			i2c7: i2c@13ab0000 {
  1566				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1567				reg = <0 0x13ab0000 0 0x80000>,
  1568				      <0 0x16420000 0 0x30000>;
  1569				interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
  1570				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C7_I2C>,
  1571					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1572				clock-names = "main", "dma";
  1573				clock-div = <1>;
  1574				#address-cells = <1>;
  1575				#size-cells = <0>;
  1576	
  1577				status = "disabled";
  1578			};
  1579	
  1580			i2c8: i2c@13b30000 {
  1581				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1582				reg = <0 0x13b30000 0 0x80000>,
  1583				      <0 0x16450000 0 0x30000>;
  1584				interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH 0>;
  1585				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C8_I2C>,
  1586					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1587				clock-names = "main", "dma";
  1588				clock-div = <1>;
  1589				#address-cells = <1>;
  1590				#size-cells = <0>;
  1591	
  1592				status = "disabled";
  1593			};
  1594	
  1595			i2c9: i2c@13bb0000 {
  1596				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1597				reg = <0 0x13bb0000 0 0x80000>,
  1598				      <0 0x16480000 0 0x30000>;
  1599				interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH 0>;
  1600				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C9_I2C>,
  1601					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1602				clock-names = "main", "dma";
  1603				clock-div = <1>;
  1604				#address-cells = <1>;
  1605				#size-cells = <0>;
  1606	
  1607				status = "disabled";
  1608			};
  1609	
  1610			imp_iic_wrap_n_clk: syscon@13c30000 {
  1611				/* TODO: Fix compatible in driver */
  1612				compatible = "mediatek,mt8196-imp-iic-wrap-n", "mediatek,mt8196-imp_iic_wrap_n", "syscon";
  1613				reg = <0 0x13c30000 0 0x1000>;
  1614				hw-voter-regmap = <&hwv>;
  1615				#clock-cells = <1>;
  1616			};
  1617	
  1618			devapc_apinfra_io_intf: devapc@140a0000 {
  1619				compatible = "mediatek,mt8196-devapc";
  1620				reg = <0 0x140a0000 0 0x1000>;
  1621				vio-idx-num = <8>;
  1622				interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH 0>;
  1623			};
  1624	
  1625			devapc_apinfra_mem_intf: devapc@140c0000 {
  1626				compatible = "mediatek,mt8196-devapc";
  1627				reg = <0 0x140c0000 0 0x1000>;
  1628				vio-idx-num = <7>;
  1629				interrupts = <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH 0>;
  1630			};
  1631	
  1632			devapc_apinfra_slb: devapc@140e0000 {
  1633				compatible = "mediatek,mt8196-devapc";
  1634				reg = <0 0x140e0000 0 0x1000>;
  1635				vio-idx-num = <14>;
  1636				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH 0>;
  1637			};
  1638	
  1639			apifrbus_ao_mem_reg_clk: syscon@14126000 {
  1640				/* TODO: Fix compatible in driver */
  1641				compatible = "mediatek,mt8196-apifrbus-ao-mem-reg", "mediatek,mt8196-apifrbus_ao_mem_reg", "syscon";
  1642				reg = <0 0x14126000 0 0x1000>;
  1643				#clock-cells = <1>;
  1644			};
  1645	
  1646			devapc_apinfra_mem: devapc@14130000 {
  1647				compatible = "mediatek,mt8196-devapc";
  1648				reg = <0 0x14130000 0 0x1000>;
  1649				vio-idx-num = <13>;
  1650				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH 0>;
  1651			};
  1652	
  1653			devapc_apinfra_mem_ctrl: devapc@14131000 {
  1654				compatible = "mediatek,mt8196-devapc";
  1655				reg = <0 0x14131000 0 0x1000>;
  1656				vio-idx-num = <23>;
  1657				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH 0>;
  1658			};
  1659	
  1660			infracfg@14136000 {
  1661				compatible = "mediatek,infracfg";
  1662				reg = <0 0x14136000 0 0x1000>;
  1663			};
  1664	
  1665			devapc_apinfra_int: devapc@142f4000 {
  1666				compatible = "mediatek,mt8196-devapc";
  1667				reg = <0 0x142f4000 0 0x1000>;
  1668				vio-idx-num = <26>;
  1669				interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH 0>;
  1670			};
  1671	
  1672			devapc_apinfra_io_ctrl: devapc@14400000 {
  1673				compatible = "mediatek,mt8196-devapc";
  1674				reg = <0 0x14400000 0 0x1000>;
  1675				vio-idx-num = <10>;
  1676				interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH 0>;
  1677			};
  1678	
  1679			devapc_apinfra_io: devapc@14401000 {
  1680				compatible = "mediatek,mt8196-devapc";
  1681				reg = <0 0x14401000 0 0x1000>;
  1682				vio-idx-num = <230>;
  1683				interrupts = <GIC_SPI 867 IRQ_TYPE_LEVEL_HIGH 0>;
  1684			};
  1685	
  1686			lvts: thermal-sensor@14414000 {
  1687				compatible = "mediatek,mt8196-lvts";
  1688				reg = <0 0x14414000 0 0x1000>,
  1689					<0 0x0c230000 0 0x1000>,
  1690					<0 0x19004000 0 0x1000>,
  1691					<0 0x4b400000 0 0x1000>;
  1692				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>,
  1693						<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
  1694						<GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH 0>,
  1695						<GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH 0>;
  1696				#thermal-sensor-cells = <1>;
  1697				nvmem-cells = <&lvts_e_data1 &lvts_e_data2 &lvts_e_data3
  1698						&lvts_e_data4>;
  1699				nvmem-cell-names = "e_data1","e_data2","e_data3","e_data4";
  1700			};
  1701	
  1702			hwv: syscon@14500000 {
  1703				compatible = "mediatek,mt8196-hwv", "syscon";
  1704				reg = <0 0x14500000 0 0x3000>;
  1705			};
  1706	
  1707			devapc_apinfra_mmu: devapc@14800000 {
  1708				compatible = "mediatek,mt8196-devapc";
  1709				reg = <0 0x14800000 0 0x1000>;
  1710				vio-idx-num = <20>;
  1711				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH 0>;
  1712			};
  1713	
  1714			uart0: serial@16000000 {
  1715				compatible = "mediatek,mt6577-uart";
  1716				reg = <0 0x16000000 0 0x1000>;
  1717				interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH 0>;
  1718				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART0_BCLK_UART>;
  1719				clock-names = "baud", "bus";
  1720	
  1721				status = "disabled";
  1722			};
  1723	
  1724			uart1: serial@16010000 {
  1725				compatible = "mediatek,mt6577-uart";
  1726				reg = <0 0x16010000 0 0x1000>;
  1727				interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH 0>;
  1728				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART1_BCLK_UART>;
  1729				clock-names = "baud", "bus";
  1730	
  1731				status = "disabled";
  1732			};
  1733	
  1734			uart2: serial@16020000 {
  1735				compatible = "mediatek,mt6577-uart";
  1736				reg = <0 0x16020000 0 0x1000>;
  1737				interrupts = <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH 0>;
  1738				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART2_BCLK_UART>;
  1739				clock-names = "baud", "bus";
  1740	
  1741				status = "disabled";
  1742			};
  1743	
  1744			uart3: serial@16030000 {
  1745				compatible = "mediatek,mt6985-uart";
  1746				reg = <0 0x16030000 0 0x1000>;
  1747				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH 0>,
  1748					     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH 0>;    /* uart3 wakeup irq */
  1749				clocks = <&clk104m>, <&pericfg_ao_clk CLK_PERAO_UART3_BCLK_UART>;
  1750				clock-names = "baud", "bus";
  1751	
  1752				status = "disabled";
  1753			};
  1754	
  1755			disp_pwm0: disp-pwm0@160b0000 {
  1756				compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
  1757				reg = <0 0x160b0000 0 0x1000>;
  1758				interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
  1759				#pwm-cells = <2>;
  1760				clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
  1761				clock-names = "main";
  1762				status = "disabled";
  1763			};
  1764	
  1765			disp_pwm1: disp-pwm1@160c0000 {
  1766				compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
  1767				reg = <0 0x160c0000 0 0x1000>;
  1768				#pwm-cells = <2>;
  1769				clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
  1770				clock-names = "main";
  1771				status = "disabled";
  1772			};
  1773	
  1774			spi0: spi@16110000 {
  1775				compatible = "mediatek,mt8196-spi";
  1776				reg = <0 0x16110000 0 0x100>;
  1777				interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
  1778				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1779					<&cksys_clk CLK_CK_SPI0_BCLK_SEL>,
  1780					<&pericfg_ao_clk CLK_PERAO_SPI0_BCLK_SPI>;
  1781				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1782				#address-cells = <1>;
  1783				#size-cells = <0>;
  1784				mediatek,pad-select = <0>;
  1785	
  1786				status = "disabled";
  1787			};
  1788	
  1789			spi1: spi@16130000 {
  1790				compatible = "mediatek,mt8196-spi";
  1791				reg = <0 0x16130000 0 0x100>;
  1792				interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
  1793				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1794					<&cksys_clk CLK_CK_SPI1_BCLK_SEL>,
  1795					<&pericfg_ao_clk CLK_PERAO_SPI1_BCLK_SPI>;
  1796				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1797				#address-cells = <1>;
  1798				#size-cells = <0>;
  1799				mediatek,pad-select = <0>;
  1800	
  1801				status = "disabled";
  1802			};
  1803	
  1804			spi2: spi@16150000 {
  1805				compatible = "mediatek,mt8196-spi";
  1806				reg = <0 0x16150000 0 0x100>;
  1807				interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
  1808				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1809					<&cksys_clk CLK_CK_SPI2_BCLK_SEL>,
  1810					<&pericfg_ao_clk CLK_PERAO_SPI2_BCLK_SPI>;
  1811				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1812				#address-cells = <1>;
  1813				#size-cells = <0>;
  1814				mediatek,pad-select = <0>;
  1815	
  1816				status = "disabled";
  1817			};
  1818	
  1819			spi3: spi@16170000 {
  1820				compatible = "mediatek,mt8196-spi";
  1821				reg = <0 0x16170000 0 0x100>;
  1822				interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
  1823				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1824					<&cksys_clk CLK_CK_SPI3_BCLK_SEL>,
  1825					<&pericfg_ao_clk CLK_PERAO_SPI3_BCLK_SPI>;
  1826				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1827				#address-cells = <1>;
  1828				#size-cells = <0>;
  1829				mediatek,pad-select = <0>;
  1830	
  1831				status = "disabled";
  1832			};
  1833	
  1834			spi4: spi@16190000 {
  1835				compatible = "mediatek,mt8196-spi";
  1836				reg = <0 0x16190000 0 0x100>;
  1837				interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
  1838				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1839					<&cksys_clk CLK_CK_SPI4_BCLK_SEL>,
  1840					<&pericfg_ao_clk CLK_PERAO_SPI4_BCLK_SPI>;
  1841				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1842				#address-cells = <1>;
  1843				#size-cells = <0>;
  1844				mediatek,pad-select = <0>;
  1845	
  1846				status = "disabled";
  1847			};
  1848	
  1849			spi5: spi@161b0000 {
  1850				compatible = "mediatek,mt8196-spi";
  1851				reg = <0 0x161b0000 0 0x100>;
  1852				interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>;
  1853				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1854					<&cksys_clk CLK_CK_SPI5_BCLK_SEL>,
  1855					<&pericfg_ao_clk CLK_PERAO_SPI5_BCLK_SPI>;
  1856				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1857				#address-cells = <1>;
  1858				#size-cells = <0>;
  1859				mediatek,pad-select = <0>;
  1860	
  1861				status = "disabled";
  1862			};
  1863	
  1864			spi6: spi@161d0000 {
  1865				compatible = "mediatek,mt8196-spi";
  1866				reg = <0 0x161d0000 0 0x100>;
  1867				interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
  1868				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1869					<&cksys_clk CLK_CK_SPI6_BCLK_SEL>,
  1870					<&pericfg_ao_clk CLK_PERAO_SPI6_BCLK_SPI>;
  1871				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1872				#address-cells = <1>;
  1873				#size-cells = <0>;
  1874				mediatek,pad-select = <1>;
  1875	
  1876				status = "disabled";
  1877			};
  1878	
  1879			spi7: spi@161f0000 {
  1880				compatible = "mediatek,mt8196-spi";
  1881				reg = <0 0x161f0000 0 0x100>;
  1882				interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH 0>;
  1883				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1884					<&cksys_clk CLK_CK_SPI7_BCLK_SEL>,
  1885					<&pericfg_ao_clk CLK_PERAO_SPI7_BCLK_SPI>;
  1886				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1887				#address-cells = <1>;
  1888				#size-cells = <0>;
  1889				mediatek,pad-select = <0>;
  1890	
  1891				status = "disabled";
  1892			};
  1893	
  1894			i2c11: i2c@16200000 {
  1895				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1896				reg = <0 0x16200000 0 0x40000>,
  1897				      <0 0x164c0000 0 0x10000>;
  1898				interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH 0>;
  1899				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C11_I2C>,
  1900					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1901				clock-names = "main", "dma";
  1902				clock-div = <1>;
  1903				#address-cells = <1>;
  1904				#size-cells = <0>;
  1905	
  1906				status = "disabled";
  1907			};
  1908	
  1909			i2c12: i2c@16240000 {
  1910				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1911				reg = <0 0x16240000 0 0x40000>,
  1912				      <0 0x164d0000 0 0x20000>;
  1913				interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH 0>;
  1914				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C12_I2C>,
  1915					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1916				clock-names = "main", "dma";
  1917				clock-div = <1>;
  1918				#address-cells = <1>;
  1919				#size-cells = <0>;
  1920	
  1921				status = "disabled";
  1922			};
  1923	
  1924			i2c13: i2c@16280000 {
  1925				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1926				reg = <0 0x16280000 0 0x40000>,
  1927				      <0 0x164f0000 0 0x10000>;
  1928				interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
  1929				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C13_I2C>,
  1930					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1931				clock-names = "main", "dma";
  1932				clock-div = <1>;
  1933				#address-cells = <1>;
  1934				#size-cells = <0>;
  1935	
  1936				status = "disabled";
  1937			};
  1938	
  1939			i2c14: i2c@162c0000 {
  1940				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1941				reg = <0 0x162c0000 0 0x40000>,
  1942				      <0 0x16500000 0 0x10000>;
  1943				interrupts = <GIC_SPI 900 IRQ_TYPE_LEVEL_HIGH 0>;
  1944				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C14_I2C>,
  1945					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1946				clock-names = "main", "dma";
  1947				clock-div = <1>;
  1948				#address-cells = <1>;
  1949				#size-cells = <0>;
  1950	
  1951				status = "disabled";
  1952			};
  1953	
  1954			imp_iic_wrap_c_clk: syscon@16300000 {
  1955				/* TODO: Fix compatible in driver */
  1956				compatible = "mediatek,mt8196-imp-iic-wrap-c", "mediatek,mt8196-imp_iic_wrap_c", "syscon";
  1957				reg = <0 0x16300000 0 0x1000>;
  1958				#clock-cells = <1>;
  1959			};
  1960	
  1961			mmc1: mmc@16310000 {
  1962				compatible = "mediatek,mt8196-mmc";
  1963				reg = <0 0x16310000 0 0x1000>,
  1964				      <0 0x12a10000 0 0x1000>;
  1965				interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH 0>;
  1966				clocks = <&cksys_clk CLK_CK_MSDC30_1_SEL>,
  1967						<&pericfg_ao_clk CLK_PERAO_MSDC1_AXI_MSDC1>,
  1968						<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_MSDC1>,
  1969						<&pericfg_ao_clk CLK_PERAO_MSDC1_MSDC_SRC_MSDC1>,
  1970						<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_WRAP_MSDC1>;
  1971				clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
  1972	
  1973				status = "disabled";
  1974			};
  1975	
  1976			mmc2: mmc@16320000 {
  1977				compatible = "mediatek,mt8196-mmc";
  1978				reg = <0 0x16320000 0 0x1000>,
  1979				      <0 0x138a0000 0 0x1000>;
  1980				interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>;
  1981				clocks = <&cksys_clk CLK_CK_MSDC30_2_SEL>,
  1982						<&pericfg_ao_clk CLK_PERAO_MSDC2_AXI_MSDC2>,
  1983						<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_MSDC2>,
  1984						<&pericfg_ao_clk CLK_PERAO_MSDC2_MSDC_SRC_MSDC2>,
  1985						<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_WRAP_MSDC2>;
  1986				clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
  1987	
  1988				status = "disabled";
  1989			};
  1990	
  1991			pwm: pwm@16330000 {
  1992				compatible = "mediatek,pwm";
  1993				reg = <0 0x16330000 0 0x1000>;
  1994				interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH 0>;
  1995	
  1996				status = "disabled";
  1997			};
  1998	
  1999			nor_flash: spi@16340000 {
  2000				compatible = "mediatek,mt8196-nor",
  2001					     "mediatek,mt8186-nor";
  2002				reg = <0 0x16340000 0 0x1000>;
  2003				clocks = <&cksys_clk CLK_CK_SFLASH_SEL>,
  2004					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_FLASH_FLASHIF>,
  2005					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_DRAM_FLASHIF>,
  2006					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_AXI_FLASHIF>,
  2007					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_BCLK_FLASHIF>,
  2008					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_27M_FLASHIF>;
  2009				clock-names = "spi", "sf", "axi", "axi_s", "bclk", "27m";
  2010				assigned-clocks = <&cksys_clk CLK_CK_SFLASH_SEL>;
  2011				assigned-clock-parents = <&cksys_clk CLK_CK_UNIVPLL_D6_D8>;
  2012				interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>;
  2013				#address-cells = <1>;
  2014				#size-cells = <0>;
  2015				status = "disabled";
  2016			};
  2017	
  2018			pericfg_ao_clk: syscon@16640000 {
  2019				/* TODO: Fix compatible in driver */
  2020				compatible = "mediatek,mt8196-pericfg-ao", "mediatek,mt8196-pericfg_ao", "syscon";
  2021				reg = <0 0x16640000 0 0x1000>;
  2022				hw-voter-regmap = <&hwv>;
  2023				#clock-cells = <1>;
  2024			};
  2025	
  2026			devapc_peri: devapc@16670000 {
  2027				compatible = "mediatek,mt8196-devapc";
  2028				reg = <0 0x16670000 0 0x1000>;
  2029				vio-idx-num = <204>;
  2030				interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
  2031			};
  2032	
  2033			xhci0: usb@16700000 {
  2034				compatible = "mediatek,mtk-xhci";
  2035				reg = <0 0x16700000 0 0x1000>,
  2036				      <0 0x16703e00 0 0x0100>;
  2037				reg-names = "mac", "ippc";
  2038				interrupts-extended = <&gic GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH 0>,
  2039						      <&pio 273 IRQ_TYPE_LEVEL_LOW>;
  2040				interrupt-names = "host","wakeup";
  2041				phys = <&u2port0 PHY_TYPE_USB2>,
  2042				       <&u3port0 PHY_TYPE_USB3>;
  2043				#address-cells = <2>;
  2044				#size-cells = <2>;
  2045				clocks = <&vlp_cksys_clk CLK_VLP_CK_USB_TOP_SEL>,
  2046					 <&vlp_cksys_clk CLK_VLP_CK_USB_XHCI_SEL>,
  2047					 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
  2048				clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
  2049				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P0>;
  2050				mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 107>;
  2051				wakeup-source;
  2052				status = "disabled";
  2053			};
  2054	
  2055			xhci1: usb1@16710000 {
  2056				compatible = "mediatek,mtk-xhci";
  2057				reg = <0 0x16710000 0 0x1000>,
  2058				      <0 0x16713e00 0 0x0100>;
  2059				reg-names = "mac", "ippc";
  2060				interrupts-extended = <&gic GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH 0>,
  2061						      <&pio 276 IRQ_TYPE_LEVEL_LOW>;
  2062				interrupt-names = "host","wakeup";
  2063				phys = <&u2port1 PHY_TYPE_USB2>;
  2064				clocks = <&cksys_clk CLK_CK_USB_TOP_1P_SEL>,
  2065					 <&cksys_clk CLK_CK_USB_XHCI_1P_SEL>,
  2066					 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
  2067				clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
  2068				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P1>;
  2069				mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 108>;
  2070				wakeup-source;
  2071				status = "disabled";
  2072			};
  2073	
  2074			u2phy0: usb-phy0@16730000 {
  2075				compatible = "mediatek,xsphy";
  2076				ranges = <0x0 0x0 0x16730000 0x700>;
  2077				#address-cells = <1>;
  2078				#size-cells = <1>;
  2079				status = "disabled";
  2080	
  2081				u2port0: usb2-phy0@0 {
  2082					reg = <0x0 0x400>;
  2083					clocks = <&clk26m>;
  2084					clock-names = "ref";
  2085					#phy-cells = <1>;
  2086					mediatek,discth = <10>;
  2087				};
  2088			};
  2089	
  2090			u2phy1: usb-phy1@16740000 {
  2091				compatible = "mediatek,xsphy";
  2092				ranges = <0x0 0x0 0x16740000 0x700>;
  2093				#address-cells = <1>;
  2094				#size-cells = <1>;
  2095				status = "disabled";
  2096	
  2097				u2port1: usb2-phy1@0 {
  2098					reg = <0x0 0x400>;
  2099					clocks = <&clk26m>;
  2100					clock-names = "ref";
  2101					#phy-cells = <1>;
  2102					mediatek,discth = <10>;
  2103				};
  2104			};
  2105	
  2106			u3phy0: usb3-phy0@16773000 {
  2107				compatible = "mediatek,xsphy";
  2108				ranges;
  2109				reg = <0 0x16773000 0 0x200>;
  2110				#address-cells = <2>;
  2111				#size-cells = <2>;
  2112				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
  2113				status = "disabled";
  2114	
  2115				u3port0: usb3-phy0@16773400 {
  2116					reg = <0 0x16773400 0 0x500>;
  2117					clocks = <&clk26m>;
  2118					clock-names = "ref";
  2119					#phy-cells = <1>;
  2120				};
  2121			};
  2122	
  2123			usbwkcfg_ao_clk: syscon@167a0000 {
  2124				compatible = "mediatek,mt8196-usbwkcfg-ao", "syscon";
  2125				reg = <0 0x167a0000 0 0x1000>;
  2126			};
  2127	
  2128			ufshci: ufshci@16810000 {
  2129				compatible = "mediatek,mt8183-ufshci";
  2130				reg = <0 0x16810000 0 0x2a00>;
  2131	
  2132				interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH 0>,
  2133					     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH 0>,
  2134					     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>,
  2135					     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>,
  2136					     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH 0>,
  2137					     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH 0>,
  2138					     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH 0>,
  2139					     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH 0>,
  2140					     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH 0>;
  2141				clocks =
  2142						<&cksys_clk CLK_CK_SEL>,
  2143						<&cksys_clk CLK_CK_MAINPLL_D4_D2>,
  2144						<&cksys_clk CLK_CK_UNIVPLL_D5>,
  2145						<&cksys_clk CLK_CK_AES_UFSFDE_SEL>,
  2146						<&cksys_clk CLK_CK_UNIVPLL_D6>,
  2147						<&cksys_clk CLK_CK_MAINPLL_D4>,
  2148						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_TX_SYM_UFS>,
  2149						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM0_UFS>,
  2150						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM1_UFS>,
  2151						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SYS_UFS>,
  2152						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SAP_UFS>,
  2153						<&ufscfg_ao_clk CLK_UFSAO_PHY_SAP_UFS>,
  2154						<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_UFS_UFS>,
  2155						<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_AES_UFS>;
  2156				clock-names =
  2157						"ufs_sel",
  2158						"ufs_sel_min_src",
  2159						"ufs_sel_max_src",
  2160						"crypt_mux",
  2161						"crypt_lp",
  2162						"crypt_perf",
  2163						"unipro_tx_sym",
  2164						"unipro_rx_sym0",
  2165						"unipro_rx_sym1",
  2166						"unipro_sys",
  2167						"unipro_sap",
  2168						"ufs_phy_sap",
  2169						"ufshci_ufs",
  2170						"ufshci_aes";
  2171				freq-table-hz =
  2172						<273000000 499200000>,
  2173						<0 0>,
  2174						<0 0>,
  2175						<0 0>,
  2176						<0 0>,
  2177						<0 0>,
  2178						<0 0>,
  2179						<0 0>,
  2180						<0 0>,
  2181						<0 0>,
  2182						<0 0>,
  2183						<0 0>,
  2184						<0 0>,
  2185						<0 0>;
  2186				/* for clock scaling bind vcore */
  2187	
  2188				/* 0.65V for clock scale up */
  2189				boost-crypt-vcore-min = <650000>;
  2190				vcc-supply = <&mt6363_vemc>;
  2191				vccq-supply = <&mt6363_vufs12>;
  2192				resets =	<&ufscfgao_rst 1>,
  2193						<&ufscfgao_rst 2>,
  2194						<&ufscfgao_rst 3>;
  2195				reset-names =	"unipro_rst",
  2196						"crypto_rst",
  2197						"hci_rst";
  2198	
  2199				/*
  2200				 * Control mtcmos with rtff flow by ufs driver,
  2201				 * Instead of scpsys by PM flow.
  2202				 */
  2203				mediatek,ufs-rtff-mtcmos;
  2204				mediatek,ufs-boost-crypt;
  2205				mediatek,ufs-pmc-via-fastauto;
  2206			};
  2207	
  2208			ufscfg_ao_sec_clk: syscon@16890000 {
  2209				/* TODO: Fix compatible in driver */
  2210				compatible = "mediatek,mt8196-ufscfg-ao-sec", "mediatek,mt8196-ufscfg_ao_sec", "syscon";
  2211				reg = <0 0x16890000 0 0x1000>;
  2212				#clock-cells = <1>;
  2213			};
  2214	
  2215			ufscfg_ao_clk: syscon@168a0000 {
  2216				/* TODO: Fix compatible in driver */
  2217				compatible = "mediatek,mt8196-ufscfg-ao", "mediatek,mt8196-ufscfg_ao", "syscon";
  2218				reg = <0 0x168a0000 0 0x1000>;
  2219				#clock-cells = <1>;
  2220	
  2221				ufscfgao_rst: reset-controller {
  2222					compatible = "ti,syscon-reset";
  2223					#reset-cells = <1>;
  2224	
  2225					ti,reset-bits = <
  2226						/* ufs mphy/ufschi/crypto/unipro reset */
  2227						/* 0: mphy */
  2228						0x48   8 0x4c   8 0 0
  2229						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2230						/* 1: unipro */
  2231						0x148  0 0x14c  0 0 0
  2232						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2233						/* 2: ufs-crypto */
  2234						0x148  1 0x14c  1 0 0
  2235						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2236						/* 3: ufshci */
  2237						0x148  2 0x14c  2 0 0
  2238						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2239						>;
  2240				};
  2241			};
  2242	
  2243			pciephy0: phy@16900000 {
  2244				compatible = "mediatek,mt8196-pcie-phy";
  2245				reg = <0 0x16900000 0 0x10000>,
  2246				      <0 0x16920000 0 0x10000>;
  2247				reg-names = "sif", "ckm";
  2248	
  2249				clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_MCU_BUS_PCIE>,
  2250					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_PEXTP_REF_PCIE>;
  2251				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY0>;
  2252	
  2253				num-lanes = <1>;
  2254				#phy-cells = <0>;
  2255				status = "disabled";
  2256			};
  2257	
  2258			pcie0: pcie@16910000 {
  2259				compatible = "mediatek,mt8196-pcie";
  2260				device_type = "pci";
  2261				reg = <0 0x16910000 0 0x4000>;
  2262				reg-names = "pcie-mac";
  2263				#address-cells = <3>;
  2264				#size-cells = <2>;
  2265				interrupts = <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH 0>;
  2266				bus-range = <0x00 0xff>;
  2267				linux,pci-domain = <0>;
  2268				pextpcfg = <&pextp0cfg_ao_clk>;
  2269				ranges = <0x82000000 0 0x50000000 0x0 0x50000000 0 0x8000000>;
  2270	
  2271				clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_PL_P_PCIE>,
  2272					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_TL_PCIE>,
  2273					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_REF_PCIE>,
  2274					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AXI_250_PCIE>,
  2275					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AHB_APB_PCIE>,
  2276					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_VLP_AO_P0_LP_PCIE>;
  2277				clock-names = "pl_250m", "tl_26m", "peri_26m",
  2278					      "peri_mem", "bus", "low_power";
  2279				assigned-clocks = <&cksys_clk CLK_CK_TL_SEL>;
  2280				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  2281	
  2282				resets = <&pextp0ao_rst 0>, <&pextp0ao_rst 1>;
  2283				reset-names = "mac", "phy";
  2284				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC0>;
  2285	
  2286				phys = <&pciephy0>;
  2287				phy-names = "pcie-phy";
  2288	
  2289				status = "disabled";
  2290	
  2291				#interrupt-cells = <1>;
  2292				interrupt-map-mask = <0 0 0 7>;
  2293				interrupt-map = <0 0 0 1 &pcie_intc0 0>,
  2294						<0 0 0 2 &pcie_intc0 1>,
  2295						<0 0 0 3 &pcie_intc0 2>,
  2296						<0 0 0 4 &pcie_intc0 3>;
  2297	
  2298				pcie_intc0: interrupt-controller {
  2299					interrupt-controller;
  2300					#address-cells = <0>;
  2301					#interrupt-cells = <1>;
  2302				};
  2303			};
  2304	
  2305			pciephy1: phy@16930000 {
  2306				compatible = "mediatek,mt8196-pcie-phy";
  2307				reg = <0 0x16930000 0 0x10000>,
  2308				      <0 0x16950000 0 0x10000>;
  2309				reg-names = "sif", "ckm";
  2310	
  2311				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_MCU_BUS_PCIE>,
  2312					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_PEXTP_REF_PCIE>;
  2313				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY1>;
  2314	
  2315				num-lanes = <2>;
  2316				#phy-cells = <0>;
  2317	
  2318				status = "disabled";
  2319			};
  2320	
  2321			pcie1: pcie@16940000 {
  2322				compatible = "mediatek,mt8196-pcie";
  2323				device_type = "pci";
  2324				reg = <0 0x16940000 0 0x4000>;
  2325				reg-names = "pcie-mac";
  2326				#address-cells = <3>;
  2327				#size-cells = <2>;
  2328				interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH 0>;
  2329				bus-range = <0x00 0xff>;
  2330				linux,pci-domain = <1>;
  2331				pextpcfg = <&pextp1cfg_ao_clk>;
  2332				ranges = <0x82000000 0 0x58000000 0x0 0x58000000 0 0x18000000>;
  2333	
  2334				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_PL_P_PCIE>,
  2335					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_TL_PCIE>,
  2336					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_REF_PCIE>,
  2337					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AXI_250_PCIE>,
  2338					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AHB_APB_PCIE>,
  2339					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P1_LP_PCIE>;
  2340				clock-names = "pl_250m", "tl_26m", "peri_26m",
  2341					      "peri_mem", "bus", "low_power";
  2342				assigned-clocks = <&cksys_clk CLK_CK_TL_P1_SEL>;
  2343				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  2344	
  2345				resets = <&pextp1ao_rst 0>, <&pextp1ao_rst 1>;
  2346				reset-names = "mac", "phy";
  2347				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC1>;
  2348	
  2349				phys = <&pciephy1>;
  2350				phy-names = "pcie-phy";
  2351	
  2352				status = "disabled";
  2353	
  2354				#interrupt-cells = <1>;
  2355				interrupt-map-mask = <0 0 0 7>;
  2356				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
  2357						<0 0 0 2 &pcie_intc1 1>,
  2358						<0 0 0 3 &pcie_intc1 2>,
  2359						<0 0 0 4 &pcie_intc1 3>;
  2360	
  2361				pcie_intc1: interrupt-controller {
  2362					interrupt-controller;
  2363					#address-cells = <0>;
  2364					#interrupt-cells = <1>;
  2365				};
  2366			};
  2367	
  2368			pciephy2: phy@16960000 {
  2369				compatible = "mediatek,mt8196-pcie-phy";
  2370				reg = <0 0x16960000 0 0x10000>,
  2371				      <0 0x16980000 0 0x10000>;
  2372				reg-names = "sif", "ckm";
  2373	
  2374				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_MCU_BUS_PCIE>,
  2375					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_PEXTP_REF_PCIE>;
  2376				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY2>;
  2377	
  2378				num-lanes = <1>;
  2379				#phy-cells = <0>;
  2380	
  2381				status = "disabled";
  2382			};
  2383	
  2384			pcie2: pcie@16970000 {
  2385				device_type = "pci";
  2386				compatible = "mediatek,mt8196-pcie";
  2387				reg = <0 0x16970000 0 0x4000>;
  2388				reg-names = "pcie-mac";
  2389				#address-cells = <3>;
  2390				#size-cells = <2>;
  2391				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH 0>;
  2392				bus-range = <0x00 0xff>;
  2393				linux,pci-domain = <2>;
  2394				pextpcfg = <&pextp1cfg_ao_clk>;
  2395				ranges = <0x82000000 0 0x70000000 0x0 0x70000000 0 0x8000000>;
  2396	
  2397				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_PL_P_PCIE>,
  2398					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_TL_PCIE>,
  2399					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_REF_PCIE>,
  2400					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AXI_250_PCIE>,
  2401					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AHB_APB_PCIE>,
  2402					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P2_LP_PCIE>;
  2403				clock-names = "pl_250m", "tl_26m", "peri_26m",
  2404					      "peri_mem", "bus", "low_power";
  2405				assigned-clocks = <&cksys_clk CLK_CK_TL_P2_SEL>;
  2406				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  2407	
  2408				resets = <&pextp1ao_rst 2>, <&pextp1ao_rst 3>;
  2409				reset-names = "mac", "phy";
  2410				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC2>;
  2411	
  2412				phys = <&pciephy2>;
  2413				phy-names = "pcie-phy";
  2414	
  2415				status = "disabled";
  2416	
  2417				#interrupt-cells = <1>;
  2418				interrupt-map-mask = <0 0 0 7>;
  2419				interrupt-map = <0 0 0 1 &pcie_intc2 0>,
  2420						<0 0 0 2 &pcie_intc2 1>,
  2421						<0 0 0 3 &pcie_intc2 2>,
  2422						<0 0 0 4 &pcie_intc2 3>;
  2423	
  2424				pcie_intc2: interrupt-controller {
  2425					interrupt-controller;
  2426					#address-cells = <0>;
  2427					#interrupt-cells = <1>;
  2428				};
  2429			};
  2430	
  2431			pextp0cfg_ao_clk: syscon@169b0000 {
  2432				/* TODO: Fix compatible in driver */
  2433				compatible = "mediatek,mt8196-pextp0cfg-ao", "mediatek,mt8196-pextp0cfg_ao", "syscon", "simple-mfd";
  2434				reg = <0 0x169b0000 0 0x1000>;
  2435				#clock-cells = <1>;
  2436	
  2437				pextp0ao_rst: reset-controller {
  2438					compatible = "ti,syscon-reset";
  2439					#reset-cells = <1>;
  2440	
  2441					ti,reset-bits = <
  2442						/* 0: PCIe0 MAC reset */
  2443						0x8  0 0xc  0 0 0
  2444						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2445						/* 1: PCIe0 PHY reset */
  2446						0x8  1 0xc  1 0 0
  2447						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2448						>;
  2449				};
  2450			};
  2451	
  2452			pextp1cfg_ao_clk: syscon@169e0000 {
  2453				/* TODO: Fix compatible in driver */
  2454				compatible = "mediatek,mt8196-pextp1cfg-ao", "mediatek,mt8196-pextp1cfg_ao", "syscon", "simple-mfd";
  2455				reg = <0 0x169e0000 0 0x1000>;
  2456				#clock-cells = <1>;
  2457	
  2458				pextp1ao_rst: reset-controller {
  2459					compatible = "ti,syscon-reset";
  2460					#reset-cells = <1>;
  2461	
  2462					ti,reset-bits = <
  2463						/* 0: PCIe1 MAC reset */
  2464						0x8  0 0xc  0 0 0
  2465						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2466						/* 1: PCIe1 PHY reset */
  2467						0x8  1 0xc  1 0 0
  2468						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2469						/* 2: PCIe2 MAC reset */
  2470						0x8  8 0xc  8 0 0
  2471						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2472						/* 3: PCIe2 PHY reset */
  2473						0x8  9 0xc  9 0 0
  2474						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2475						>;
  2476				};
  2477			};
  2478	
  2479			ssr_top_clk: syscon@18000000 {
  2480				/* TODO: Fix compatible in driver */
  2481				compatible = "mediatek,mt8196-ssr-top", "mediatek,mt8196-ssr_top", "syscon";
  2482				reg = <0 0x18000000 0 0x1000>;
  2483				hw-voter-regmap = <&hwv>;
  2484				#clock-cells = <1>;
  2485			};
  2486	
  2487			devapc_apinfra_ssr: devapc@180f3000 {
  2488				compatible = "mediatek,mt8196-devapc";
  2489				reg = <0 0x180f3000 0 0x1000>;
  2490				vio-idx-num = <39>;
  2491				interrupts = <GIC_SPI 866 IRQ_TYPE_LEVEL_HIGH 0>;
  2492			};
  2493	
  2494			apusys_rv: remoteproc@19001000 {
  2495				compatible = "mediatek,mt8196-apusys_rv";
  2496				reg = <0 0x19001000 0 0x1000>;
  2497				memory-region = <&apu_reserve_memory>, <&apu_smmu_reserve_memory0>;
  2498				iommus = <&apu_smmu 9>;
  2499				interrupts = <GIC_SPI 629 IRQ_TYPE_LEVEL_HIGH 0>;
  2500				interrupt-names = "apu_wdt";
  2501				mboxes = <&apu_mailbox 0>;
  2502				mediatek,mbox-spare-reg = <&apu_mailbox>;
  2503				mediatek,hw-logger = <&apusys_hw_logger>;
  2504				mediatek,apu-power = <&apu_top_3>;
  2505	
  2506				apu-ctrl {
  2507					compatible = "mediatek,apu-ctrl-rpmsg";
  2508					mediatek,rpmsg-name = "apu-ctrl-rpmsg";
  2509				};
  2510	
  2511				apu_top_rpmsg: apu-top-rpmsg {
  2512					compatible = "mediatek,aputop-rpmsg";
  2513					mediatek,rpmsg-name = "mtk_apu_pwr_ipi_tx";
  2514					operating-points-v2 = <&apu_opp_table>;
  2515					#cooling-cells = <2>;
  2516					dynamic-power-coefficient = <1024>;
  2517				};
  2518	
  2519				apu-mdw-rpmsg {
  2520					compatible = "mediatek,apu-mdw-rpmsg-v5";
  2521					mediatek,rpmsg-name = "apu-mdw-rpmsg";
  2522					version = <5>;
  2523				};
  2524	
  2525				apu-apummu {
  2526					compatible = "mediatek,apu-apummu-rpmsg";
  2527					mediatek,rpmsg-name = "apu-apummu-rpmsg";
  2528				};
  2529	
  2530				apu-apummu-rx {
  2531					compatible = "mediatek,apu-apummu-rx";
  2532					mediatek,rpmsg-name = "apu-apummu-rx";
  2533				};
  2534	
  2535				apu-edma {
  2536					compatible = "mediatek,apu-edma-rpmsg";
  2537					mediatek,rpmsg-name = "apu-edma-rpmsg";
  2538				};
  2539	
  2540				edma-rx {
  2541					compatible = "mediatek,edma-rx-rpmsg";
  2542					mediatek,rpmsg-name = "edma-rx-rpmsg";
  2543				};
  2544	
  2545				apu-mnoc {
  2546					compatible = "mediatek,apu-mnoc-rpmsg";
  2547					mediatek,rpmsg-name = "apu-mnoc-rpmsg";
  2548				};
  2549	
  2550				mdla-tx-rpmsg {
  2551					compatible = "mediatek,mdla-tx-rpmsg";
  2552					mediatek,rpmsg-name = "mdla-tx-rpmsg";
  2553				};
  2554	
  2555				mdla-rx-rpmsg {
  2556					compatible = "mediatek,mdla-rx-rpmsg";
  2557					mediatek,rpmsg-name = "mdla-rx-rpmsg";
  2558				};
  2559	
  2560				mvpu-tx-rpmsg {
  2561					compatible = "mediatek,mvpu-tx-rpmsg";
  2562					mediatek,rpmsg-name = "mvpu-tx-rpmsg";
  2563				};
  2564	
  2565				mvpu-rx-rpmsg {
  2566					compatible = "mediatek,mvpu-rx-rpmsg";
  2567					mediatek,rpmsg-name = "mvpu-rx-rpmsg";
  2568				};
  2569	
  2570				aps-tx-rpmsg {
  2571					compatible = "mediatek,aps-tx-rpmsg";
  2572					mediatek,rpmsg-name = "aps-tx-rpmsg";
  2573				};
  2574	
  2575				aps-rx-rpmsg {
  2576					compatible = "mediatek,aps-rx-rpmsg";
  2577					mediatek,rpmsg-name = "aps-rx-rpmsg";
  2578				};
  2579	
  2580				sapu-lock-rpmsg {
  2581					compatible = "mediatek,apu-lock-rv-rpmsg";
  2582					mediatek,rpmsg-name = "apu-lock-rv-rpmsg";
  2583				};
  2584	
  2585				apu-scp-mdw-rpmsg {
  2586					compatible = "mediatek,apu-scp-mdw-rpmsg";
  2587					mediatek,rpmsg-name = "apu-scp-mdw-rpmsg";
  2588				};
  2589	
  2590				apu-scp-np-recover-rpmsg {
  2591					compatible = "mediatek,apu-scp-np-recover-rpmsg";
  2592					mediatek,rpmsg-name = "apu-scp-np-recover-rpmsg";
  2593				};
  2594	
  2595				apu-ipi-ut-rpmsg {
  2596					compatible = "mediatek,apu-ipi-ut-rpmsg";
  2597					mediatek,rpmsg-name = "apu-ipi-ut-rpmsg";
  2598				};
  2599			};
  2600	
  2601			apu_opp_table: opp-table-apu {
  2602				compatible = "operating-points-v2";
  2603	
  2604				opp@1800000000 {
  2605					opp-hz = /bits/ 64 <1800000000>;
  2606				};
  2607	
  2608				opp@1600000000 {
  2609					opp-hz = /bits/ 64 <1600000000>;
  2610				};
  2611	
  2612				opp@1450000000 {
  2613					opp-hz = /bits/ 64 <1450000000>;
  2614				};
  2615	
  2616				opp@1300000000 {
  2617					opp-hz = /bits/ 64 <1300000000>;
  2618				};
  2619	
  2620				opp@1115000000 {
  2621					opp-hz = /bits/ 64 <1115000000>;
  2622				};
  2623	
  2624				opp@930000000 {
  2625					opp-hz = /bits/ 64 <930000000>;
  2626				};
  2627	
  2628				opp@730000000 {
  2629					opp-hz = /bits/ 64 <730000000>;
  2630				};
  2631	
  2632				opp@630000000 {
  2633					opp-hz = /bits/ 64 <630000000>;
  2634				};
  2635	
  2636				opp@530000000 {
  2637					opp-hz = /bits/ 64 <530000000>;
  2638				};
  2639	
  2640				opp@457500000 {
  2641					opp-hz = /bits/ 64 <457500000>;
  2642				};
  2643	
  2644				opp@385000000 {
  2645					opp-hz = /bits/ 64 <385000000>;
  2646				};
  2647			};
  2648	
  2649			apu_top_3: power-controller@19020000 {
  2650				compatible = "mt8196,apu-top-3";
  2651				reg = <0 0x19020000 0 0x1000>,
  2652				      <0 0x190e0000 0 0x4000>,
  2653				      <0 0x190f0000 0 0x1000>;
  2654				reg-names = "RCX",
  2655					    "VCORE",
  2656					    "RPC";
  2657				mediatek,mbox-spare-reg = <&apu_mailbox>;
  2658				memory-region = <&apu_reserve_memory>;
  2659			};
  2660	
  2661			apusys_hw_logger: logger@19024000 {
  2662				compatible = "mediatek,apusys-hw-logger";
  2663				reg = <0 0x19024000 0 0x1000>;
  2664				interrupts = <GIC_SPI 632 IRQ_TYPE_EDGE_RISING 0>;
  2665				iommus = <&apu_smmu 12>;
  2666				mediatek,mbox-spare-reg = <&apu_mailbox>;
  2667				mediatek,apu-power = <&apu_top_3>;
  2668			};
  2669	
  2670			adsp: adsp@1a000000 {
  2671				compatible = "mediatek,mt8196-dsp";
  2672				reg = <0 0x1a000000 0 0x5000>,
  2673				      <0 0x1a210000 0 0x80000>,
  2674				      <0 0x1a345000 0 0x300>,
  2675				      <0 0x1a00f000 0 0x1000>;
  2676				reg-names = "cfg", "sram", "sec", "bus";
  2677				interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH 0>;
  2678				interrupt-names = "wdt";
  2679				power-domains = <&scpsys MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;
  2680				clocks = <&cksys_clk CLK_CK_ADSP_SEL>,
  2681					 <&cksys_clk CLK_CK_TCK_26M_MX9>,
  2682					 <&cksys_clk CLK_CK_ADSPPLL>;
  2683				clock-names = "clk_top_adsp_sel",
  2684					      "clk_top_clk26m",
  2685					      "clk_top_adsppll";
  2686				mbox-names = "rx", "tx";
  2687				mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
  2688				status = "disabled";
  2689			};
  2690	
  2691			devapc_adsp: devapc@1a019000 {
  2692				compatible = "mediatek,mt8196-devapc";
  2693				reg = <0 0x1a019000 0 0x1000>;
  2694				vio-idx-num = <54>;
  2695				interrupts = <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH 0>;
  2696			};
  2697	
  2698			afe_clk: syscon@1a110000 {
  2699				compatible = "mediatek,mt8196-audiosys", "syscon";
  2700				reg = <0 0x1a110000 0 0x1000>;
  2701				#clock-cells = <1>;
  2702				power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
  2703			};
  2704	
  2705			afe: mt8196-afe-pcm@1a110000 {
  2706				compatible = "mediatek,mt8196-sound";
  2707				reg = <0 0x1a110000 0 0x9000>;
  2708				interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
  2709				cksys = <&cksys_clk>;
  2710				vlpcksys = <&vlp_cksys_clk>;
  2711				power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
  2712				clocks = <&afe_clk CLK_AFE_AUDIO_HOPPING_AFE>,
  2713					<&afe_clk CLK_AFE_AUDIO_F26M_AFE>,
  2714					<&afe_clk CLK_AFE_UL0_ADC_AFE>,
  2715					<&afe_clk CLK_AFE_UL0_ADC_HIRES_AFE>,
  2716					<&afe_clk CLK_AFE_UL1_ADC_AFE>,
  2717					<&afe_clk CLK_AFE_UL1_ADC_HIRES_AFE>,
  2718					<&afe_clk CLK_AFE_APLL1_AFE>,
  2719					<&afe_clk CLK_AFE_APLL2_AFE>,
  2720					<&afe_clk CLK_AFE_APLL_TUNER1_AFE>,
  2721					<&afe_clk CLK_AFE_APLL_TUNER2_AFE>,
  2722					<&vlp_cksys_clk CLK_VLP_CK_AUD_INTBUS_SEL>,
  2723					<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN1_SEL>,
  2724					<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN2_SEL>,
  2725					<&vlp_cksys_clk CLK_VLP_CK_AUDIO_H_SEL>,
  2726					<&vlp_cksys_clk CLK_VLP_CK_CLKSQ>,
  2727					<&cksys_clk CLK_CK_MAINPLL_D4_D4>,
  2728					<&cksys_clk CLK_CK_AUD_1_SEL>,
  2729					<&cksys_clk CLK_CK_APLL1>,
  2730					<&cksys_clk CLK_CK_AUD_2_SEL>,
  2731					<&cksys_clk CLK_CK_APLL2>,
  2732					<&cksys_clk CLK_CK_APLL1_D4>,
  2733					<&cksys_clk CLK_CK_APLL2_D4>,
  2734					<&cksys_clk CLK_CK_APLL_I2SIN0_MCK_SEL>,
  2735					<&cksys_clk CLK_CK_APLL_I2SIN1_MCK_SEL>,
  2736					<&cksys_clk CLK_CK_APLL_FMI2S_MCK_SEL>,
  2737					<&cksys_clk CLK_CK_APLL_TDMOUT_MCK_SEL>,
  2738					<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN0>,
  2739					<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN1>,
  2740					<&cksys_clk CLK_CK_APLL12_CK_DIV_FMI2S>,
  2741					<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_M>,
  2742					<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_B>,
  2743					<&cksys_clk CLK_CK_ADSP_SEL>,
  2744					<&cksys_clk CLK_CK_TCK_26M_MX9>;
  2745	
  2746				clock-names = "aud_hopping_clk",
  2747					"aud_f26m_clk",
  2748					"aud_ul0_adc_clk",
  2749					"aud_ul0_adc_hires_clk",
  2750					"aud_ul1_adc_clk",
  2751					"aud_ul1_adc_hires_clk",
  2752					"aud_apll1_clk",
  2753					"aud_apll2_clk",
  2754					"aud_apll_tuner1_clk",
  2755					"aud_apll_tuner2_clk",
  2756					"vlp_mux_audio_int",
  2757					"vlp_mux_aud_eng1",
  2758					"vlp_mux_aud_eng2",
  2759					"vlp_mux_audio_h",
  2760					"vlp_clk26m_clk",
  2761					"ck_mainpll_d4_d4",
  2762					"ck_mux_aud_1",
  2763					"ck_apll1_ck",
  2764					"ck_mux_aud_2",
  2765					"ck_apll2_ck",
  2766					"ck_apll1_d4",
  2767					"ck_apll2_d4",
  2768					"ck_i2sin0_m_sel",
  2769					"ck_i2sin1_m_sel",
  2770					"ck_fmi2s_m_sel",
  2771					"ck_tdmout_m_sel",
  2772					"ck_apll12_div_i2sin0",
  2773					"ck_apll12_div_i2sin1",
  2774					"ck_apll12_div_fmi2s",
  2775					"ck_apll12_div_tdmout_m",
  2776					"ck_apll12_div_tdmout_b",
  2777					"ck_adsp_sel",
  2778					"ck_clk26m_clk";
  2779				pinctrl-names = "aud-clk-mosi-off",
  2780					"aud-clk-mosi-on",
  2781					"aud-dat-mosi-off",
  2782					"aud-dat-mosi-on",
  2783					"aud-dat-mosi-ch34-off",
  2784					"aud-dat-mosi-ch34-on",
  2785					"aud-dat-miso0-off",
  2786					"aud-dat-miso0-on",
  2787					"aud-dat-miso1-off",
  2788					"aud-dat-miso1-on",
  2789					"aud-gpio-i2sin0-off",
  2790					"aud-gpio-i2sin0-on",
  2791					"aud-gpio-i2sout0-off",
  2792					"aud-gpio-i2sout0-on",
  2793					"aud-gpio-i2sin1-off",
  2794					"aud-gpio-i2sin1-on",
  2795					"aud-gpio-i2sout1-off",
  2796					"aud-gpio-i2sout1-on",
  2797					"aud-gpio-i2sin4-off",
  2798					"aud-gpio-i2sin4-on",
  2799					"aud-gpio-i2sout4-off",
  2800					"aud-gpio-i2sout4-on",
  2801					"aud-gpio-i2sin6-off",
  2802					"aud-gpio-i2sin6-on",
  2803					"aud-gpio-i2sout6-off",
  2804					"aud-gpio-i2sout6-on",
  2805					"aud-dat-miso-only-off",
  2806					"aud-dat-miso-only-on",
  2807					"aud-gpio-ap-dmic-off",
  2808					"aud-gpio-ap-dmic-on",
  2809					"aud-gpio-ap-dmic1-off",
  2810					"aud-gpio-ap-dmic1-on",
  2811					"aud-gpio-i2sin3-off",
  2812					"aud-gpio-i2sin3-on",
  2813					"aud-gpio-i2sout3-off",
  2814					"aud-gpio-i2sout3-on";
  2815	
  2816				pinctrl-0 = <&aud_clk_mosi_off>;
  2817				pinctrl-1 = <&aud_clk_mosi_on>;
  2818				pinctrl-2 = <&aud_dat_mosi_off>;
  2819				pinctrl-3 = <&aud_dat_mosi_on>;
  2820				pinctrl-4 = <&aud_dat_mosi_ch34_off>;
  2821				pinctrl-5 = <&aud_dat_mosi_ch34_on>;
  2822				pinctrl-6 = <&aud_dat_miso0_off>;
  2823				pinctrl-7 = <&aud_dat_miso0_on>;
  2824				pinctrl-8 = <&aud_dat_miso1_off>;
  2825				pinctrl-9 = <&aud_dat_miso1_on>;
  2826				pinctrl-10 = <&aud_gpio_i2sin0_off>;
  2827				pinctrl-11 = <&aud_gpio_i2sin0_on>;
  2828				pinctrl-12 = <&aud_gpio_i2sout0_off>;
  2829				pinctrl-13 = <&aud_gpio_i2sout0_on>;
  2830				pinctrl-14 = <&aud_gpio_i2sin1_off>;
  2831				pinctrl-15 = <&aud_gpio_i2sin1_on>;
  2832				pinctrl-16 = <&aud_gpio_i2sout1_off>;
  2833				pinctrl-17 = <&aud_gpio_i2sout1_on>;
  2834				pinctrl-18 = <&aud_gpio_i2sin4_off>;
  2835				pinctrl-19 = <&aud_gpio_i2sin4_on>;
  2836				pinctrl-20 = <&aud_gpio_i2sout4_off>;
  2837				pinctrl-21 = <&aud_gpio_i2sout4_on>;
  2838				pinctrl-22 = <&aud_gpio_i2sin6_off>;
  2839				pinctrl-23 = <&aud_gpio_i2sin6_on>;
  2840				pinctrl-24 = <&aud_gpio_i2sout6_off>;
  2841				pinctrl-25 = <&aud_gpio_i2sout6_on>;
  2842				pinctrl-26 = <&aud_dat_miso_only_off>;
  2843				pinctrl-27 = <&aud_dat_miso_only_on>;
  2844				pinctrl-28 = <&aud_gpio_ap_dmic_off>;
  2845				pinctrl-29 = <&aud_gpio_ap_dmic_on>;
  2846				pinctrl-30 = <&aud_gpio_ap_dmic1_off>;
  2847				pinctrl-31 = <&aud_gpio_ap_dmic1_on>;
  2848				pinctrl-32 = <&aud_gpio_i2sin3_off>;
  2849				pinctrl-33 = <&aud_gpio_i2sin3_on>;
  2850				pinctrl-34 = <&aud_gpio_i2sout3_off>;
  2851				pinctrl-35 = <&aud_gpio_i2sout3_on>;
  2852	
  2853				/* Only for ETDM in/out 4 */
  2854				etdm-out-ch = <2>;
  2855				etdm-in-ch = <2>;
  2856				etdm-out-sync = <0>; /* 0: disable; 1: enable */
  2857				etdm-in-sync = <1>; /* 0: disable; 1: enable */
  2858				etdm-ip-mode = <0>; /* 0: One IP multi-channel 1: Multi-IP 2-channel */
  2859				status = "disabled";
  2860			};
  2861	
  2862			adsp_mailbox0: mailbox@1a350000 {
  2863				compatible = "mediatek,mt8196-adsp-mbox",
  2864					     "mediatek,mt8186-adsp-mbox";
  2865				reg = <0 0x1a350100 0 0x1000>;
  2866				interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH 0>;
  2867				#mbox-cells = <0>;
  2868			};
  2869	
  2870			adsp_mailbox1: mailbox@1a360000 {
  2871				compatible = "mediatek,mt8196-adsp-mbox",
  2872					     "mediatek,mt8186-adsp-mbox";
  2873				reg = <0 0x1a360100 0 0x1000>;
  2874				interrupts = <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH 0>;
  2875				#mbox-cells = <0>;
  2876			};
  2877	
  2878			scpsys: power-controller@1c004000 {
  2879				compatible = "mediatek,mt8196-scpsys-hwv", "syscon";
  2880				reg = <0 0x1c004000 0 0x1000>;
  2881				#power-domain-cells = <1>;
  2882				apifrbus-ao-io-reg-bus = <&ifr_bus>;
  2883				spm = <&scpsys_bus>;
  2884				hw-voter-regmap = <&hwv>;
  2885			};
  2886	
  2887			scpsys_bus: syscon@1c00d000 {
  2888				compatible = "mediatek,mt8196-scpsys-bus", "syscon";
  2889				reg = <0 0x1c00d000 0 0x1000>;
  2890			};
  2891	
  2892			watchdog: watchdog@1c010000 {
  2893				compatible = "mediatek,mt8196-wdt",
  2894						"mediatek,mt6589-wdt",
  2895						"syscon", "simple-mfd";
  2896				reg = <0 0x1c010000 0 0x1000>;
  2897			};
  2898	
  2899			dvfsrc: dvfsrc@1c013000 {
  2900				compatible = "mediatek,mt8196-dvfsrc";
  2901				reg = <0 0x1c013000 0 0x1000>,
  2902					<0 0x1c004000 0 0x1000>;
  2903				reg-names = "dvfsrc", "spm";
  2904				#interconnect-cells = <1>;
  2905	
  2906				dvfsrc_vcore: dvfsrc-vcore {
  2907					regulator-name = "dvfsrc-vcore";
  2908					regulator-min-microvolt = <575000>;
  2909					regulator-max-microvolt = <875000>;
  2910					regulator-always-on;
  2911				};
  2912	
  2913				dvfsrc_freq_opp9: opp9 {
  2914					opp-peak-KBps = <0>;
  2915				};
  2916				dvfsrc_freq_opp8: opp8 {
  2917					opp-peak-KBps = <9800000>;
  2918				};
  2919				dvfsrc_freq_opp7: opp7 {
  2920					opp-peak-KBps = <13200000>;
  2921				};
  2922				dvfsrc_freq_opp6: opp6 {
  2923					opp-peak-KBps = <19700000>;
  2924				};
  2925				dvfsrc_freq_opp5: opp5 {
  2926					opp-peak-KBps = <24900000>;
  2927				};
  2928				dvfsrc_freq_opp4: opp4 {
  2929					opp-peak-KBps = <32400000>;
  2930				};
  2931				dvfsrc_freq_opp3: opp3 {
  2932					opp-peak-KBps = <37600000>;
  2933				};
  2934				dvfsrc_freq_opp2: opp2 {
  2935					opp-peak-KBps = <44300000>;
  2936				};
  2937				dvfsrc_freq_opp1: opp1 {
  2938					opp-peak-KBps = <54500000>;
  2939				};
  2940				dvfsrc_freq_opp0: opp0 {
  2941					opp-peak-KBps = <61400000>;
  2942				};
  2943			};
  2944	
  2945			vlp_cksys_clk: syscon@1c016000 {
  2946				/* TODO: Fix compatible in driver */
  2947				compatible = "mediatek,mt8196-vlp-cksys", "mediatek,mt8196-vlp_cksys", "syscon";
  2948				reg = <0 0x1c016000 0 0x1000>;
  2949				hw-voter-regmap = <&hwv>;
  2950				#clock-cells = <1>;
  2951			};
  2952	
  2953			spmi: spmi@1c01a000 {
  2954				compatible = "mediatek,mt8196-spmi";
  2955				reg = <0 0x1c01a000 0 0x0008ff>,
  2956				      <0 0x1c01c000 0 0x000100>,
  2957				      <0 0x1c018000 0 0x0008ff>,
  2958				      <0 0x1c01c800 0 0x000100>;
  2959				reg-names = "pmif", "spmimst","pmif-p","spmimst-p";
  2960				interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>,
  2961						      <&pio 292 IRQ_TYPE_LEVEL_HIGH>,
  2962						      <&gic GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH 0>,
  2963						      <&gic GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH 0>,
  2964						      <&gic GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH 0>,
  2965						      <&gic GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH 0>;
  2966				interrupt-names = "rcs_irq","rcs_irq_p","pmif_irq","spmi_nack_irq","pmif_p_irq","spmi_p_nack_irq";
  2967				interrupt-controller;
  2968				#interrupt-cells = <1>;
  2969				irq-event-en = <0x0 0x0 0x0 0x0 0x0>;
  2970				spmi-dev-mask = <0x85c0>;
  2971				#address-cells = <2>;
  2972				#size-cells = <0>;
  2973			};
  2974	
  2975			devapc_vlp: devapc@1c032000 {
  2976				compatible = "mediatek,mt8196-devapc";
  2977				reg = <0 0x1c032000 0 0x1000>;
  2978				vio-idx-num = <101>;
  2979				interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
  2980			};
  2981	
  2982			sram@1c350000 {
  2983				compatible = "mmio-sram";
  2984				reg = <0x0 0x1c350000 0x0 0x80>;
  2985	
  2986				#address-cells = <1>;
  2987				#size-cells = <1>;
  2988				ranges = <0 0x0 0x1c350000 0x80>;
  2989	
  2990				scmi_tx_shmem: mailbox-sram@0 {
  2991					compatible = "arm,scmi-shmem";
  2992					reg = <0x0 0x80>;
  2993				};
  2994			};
  2995	
  2996			tinysys_mbox: mailbox@1c351000 {
  2997				compatible = "mediatek,tinysys_mbox";
  2998				reg = <0 0x1c351000 0 0x1000>,
  2999				      <0 0x1c361000 0 0x1000>;
  3000				/* for profiling */
  3001				shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
  3002				interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH 0>,
  3003					     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH 0>;
  3004				#mbox-cells = <1>;
  3005				/* notify spm clr */
  3006				secure-sspm-md2spm-clr = <1>;
  3007			};
  3008	
  3009			sram@1c360000 {
  3010				compatible = "mmio-sram";
  3011				reg = <0x0 0x1c360000 0x0 0x80>;
  3012	
  3013				#address-cells = <1>;
  3014				#size-cells = <1>;
  3015				ranges = <0 0x0 0x1c360000 0x80>;
  3016	
  3017				scmi_rx_shmem: mailbox-sram@0 {
  3018					compatible = "arm,scmi-shmem";
  3019					reg = <0x0 0x80>;
  3020				};
  3021			};
  3022	
  3023			systimer: systimer@1c400000 {
  3024				compatible = "mediatek,mt8196-timer",
  3025					     "mediatek,mt6765-timer";
  3026				reg = <0 0x1c400000 0 0x1000>;
  3027				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH 0>;
  3028				clocks = <&clk13m>;
  3029			};
  3030	
  3031			smi_disp_common: smi-comm@30020000 {
  3032				compatible = "mediatek,mt8196-smi-common";
  3033				reg = <0 0x30020000 0 0x1000>;
  3034				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  3035				mediatek,smi = <&disp_ssc0_smi_2x1_sub_comm>;
  3036				mediatek,common-id = <0>;
  3037				mediatek,skip-rpm-cb;
  3038			};
  3039	
  3040			smi_mdp_common: smi-comm@30021000 {
  3041				compatible = "mediatek,mt8196-smi-common";
  3042				reg = <0 0x30021000 0 0x1000>;
  3043				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  3044				mediatek,smi = <&mdp_ssc4_smi_2x1_sub_comm>;
  3045				mediatek,common-id = <1>;
  3046				mediatek,skip-rpm-cb;
  3047			};
  3048	
  3049			devapc_mminfra: devapc@30040000 {
  3050				compatible = "mediatek,mt8196-devapc";
  3051				reg = <0 0x30040000 0 0x1000>;
  3052				vio-idx-num = <699>;
  3053				interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
  3054			};
  3055	
  3056			gce0: gce@300c0000 {
  3057				compatible = "mediatek,mt8196-gce";
  3058				reg = <0 0x300c0000 0 0x80000>;
  3059				interrupts = <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH 0>;
  3060				#mbox-cells = <2>;
  3061				iommus = <&mm_smmu 199>;
  3062				mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
  3063				mediatek,gce-events = <CMDQ_SYNC_SECURE_THR_EOF>;
  3064			};
  3065	
  3066			gce1: gce@30140000 {
  3067				compatible = "mediatek,mt8196-gce";
  3068				reg = <0 0x30140000 0 0x80000>;
  3069				interrupts = <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH 0>;
  3070				#mbox-cells = <2>;
  3071				iommus = <&mm_smmu 183>;
  3072			};
  3073	
  3074			mm_smmu: iommu@30800000 {
  3075				compatible = "mediatek,mt8196-mm-smmu", "arm,smmu-v3";
  3076				reg = <0 0x30800000 0 0x1e0000>;
  3077				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>;
  3078				interrupt-names = "combined";
  3079				#iommu-cells = <1>;
  3080			};
  3081	
  3082			disp_ssc0_smi_2x1_sub_comm: smi-comm@30a30000 {
  3083				compatible = "mediatek,mt8196-smi-common";
  3084				reg = <0 0x30a30000 0 0x1000>;
  3085				mediatek,common-id = <3>;
  3086				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  3087				mediatek,skip-rpm-cb;
  3088			};
  3089	
  3090			disp_ssc1_smi_2x1_sub_comm: smi-comm@30a31000 {
  3091				compatible = "mediatek,mt8196-smi-common";
  3092				reg = <0 0x30a31000 0 0x1000>;
  3093				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  3094				mediatek,common-id = <4>;
  3095				mediatek,skip-rpm-cb;
  3096			};
  3097	
  3098			mdp_ssc4_smi_2x1_sub_comm: smi-comm@30a32000 {
  3099				compatible = "mediatek,mt8196-smi-common";
  3100				reg = <0 0x30a32000 0 0x1000>;
  3101				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  3102				mediatek,common-id = <5>;
  3103				mediatek,skip-rpm-cb;
  3104			};
  3105	
  3106			mdp_ssc5_smi_2x1_sub_comm: smi-comm@30a33000 {
  3107				compatible = "mediatek,mt8196-smi-common";
  3108				reg = <0 0x30a33000 0 0x1000>;
  3109				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  3110				mediatek,common-id = <6>;
  3111				mediatek,skip-rpm-cb;
  3112			};
  3113	
  3114			vcp: vcp@31800000 {
  3115				compatible = "mediatek,vcp";
  3116				reg = <0 0x31800000 0 0x60000>, /* sram */
  3117				      <0 0x31a04000 0 0xa000>, /* cfg */
  3118				      <0 0x31bd0000 0 0x1000>, /* cfg core */
  3119				      <0 0x31b80000 0 0x50000>, /* mbox base */
  3120				      <0 0x31a70020 0 0x100>, /* mbox init */
  3121				      <0 0x1c00091c 0 0x4>; /* vcp rdy */
  3122				reg-names = "sram",
  3123					    "cfg",
  3124					    "cfg_core",
  3125					    "mbox_base",
  3126					    "mbox_init",
  3127					    "vcp_vlp_ao_rsvd7";
  3128	
  3129				interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>,
  3130					     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>,
  3131					     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH 0>,
  3132					     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>,
  3133					     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH 0>,
  3134					     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
  3135				interrupt-names = "wdt",
  3136						  "mbox0",
  3137						  "mbox1",
  3138						  "mbox2",
  3139						  "mbox3",
  3140						  "mbox4";
  3141	
  3142				power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
  3143				iommus = <&mm_smmu 160>;
  3144				memory-region = <&vcp_resv_mem>;
  3145	
  3146				vcp-mem-tbl = <0 0x1a00000>, /* VCP_RTOS_MEM_ID 26MB */
  3147					      <1 0x30000>, /* VDEC_MEM_ID 192KB */
  3148					      <2 0x12000>, /* VENC_MEM_ID 72KB */
  3149					      <3 0x1000>; /* LOGGER 4KB*/
  3150	
  3151				vcp@0 {
  3152					compatible = "mediatek,vcp-core";
  3153					twohart = <1>;
  3154					sram-offset = <0x0>;
  3155				};
  3156	
  3157				vcp@31000 {
  3158					compatible = "mediatek,mmup-core";
  3159					twohart = <0>;
  3160					sram-offset = <0x031000>;
  3161				};
  3162	
  3163				send_table: mtk-send-table {
  3164					mbox0-0 {
  3165						mbox-id = <0>;
  3166						chan-id = <0>;
  3167						msg-size = <18>;
  3168					};
  3169					mbox1-15 {
  3170						mbox-id = <1>;
  3171						chan-id = <15>;
  3172						msg-size = <8>;
  3173					};
  3174					mbox1-16 {
  3175						mbox-id = <1>;
  3176						chan-id = <16>;
  3177						msg-size = <18>;
  3178					};
  3179					mbox1-9 {
  3180						mbox-id = <1>;
  3181						chan-id = <9>;
  3182						msg-size = <2>;
  3183					};
  3184					mbox2-11 {
  3185						mbox-id = <2>;
  3186						chan-id = <11>;
  3187						msg-size = <18>;
  3188					};
  3189					mbox2-2 {
  3190						mbox-id = <2>;
  3191						chan-id = <2>;
  3192						msg-size = <2>;
  3193					};
  3194					mbox2-3 {
  3195						mbox-id = <2>;
  3196						chan-id = <3>;
  3197						msg-size = <3>;
  3198					};
  3199					mbox2-32 {
  3200						mbox-id = <2>;
  3201						chan-id = <32>;
  3202						msg-size = <2>;
  3203					};
  3204					mbox3-33 {
  3205						mbox-id = <3>;
  3206						chan-id = <33>;
  3207						msg-size = <2>;
  3208					};
  3209					mbox3-13 {
  3210						mbox-id = <3>;
  3211						chan-id = <13>;
  3212						msg-size = <2>;
  3213					};
  3214					mbox3-35 {
  3215						mbox-id = <3>;
  3216						chan-id = <35>;
  3217						msg-size = <2>;
  3218					};
  3219					mbox4-20 {
  3220						mbox-id = <4>;
  3221						chan-id = <20>;
  3222						msg-size = <2>;
  3223					};
  3224					mbox4-21 {
  3225						mbox-id = <4>;
  3226						chan-id = <21>;
  3227						msg-size = <3>;
  3228					};
  3229					mbox4-23 {
  3230						mbox-id = <4>;
  3231						chan-id = <23>;
  3232						msg-size = <2>;
  3233					};
  3234				};
  3235	
  3236				recv_table: mtk-recv-table {
  3237					mbox0-1 {
  3238						mbox-id = <0>;
  3239						chan-id = <1>;
  3240						msg-size = <18>;
  3241						recv-opt = <0>;
  3242					};
  3243					mbox1-15 {
  3244						mbox-id = <1>;
  3245						chan-id = <15>;
  3246						msg-size = <8>;
  3247						recv-opt = <1>;
  3248					};
  3249					mbox1-17 {
  3250						mbox-id = <1>;
  3251						chan-id = <17>;
  3252						msg-size = <18>;
  3253						recv-opt = <0>;
  3254					};
  3255					mbox1-10 {
  3256						mbox-id = <1>;
  3257						chan-id = <10>;
  3258						msg-size = <2>;
  3259						recv-opt = <0>;
  3260					};
  3261					mbox2-12 {
  3262						mbox-id = <2>;
  3263						chan-id = <12>;
  3264						msg-size = <18>;
  3265						recv-opt = <0>;
  3266					};
  3267					mbox2-5 {
  3268						mbox-id = <2>;
  3269						chan-id = <5>;
  3270						msg-size = <1>;
  3271						recv-opt = <0>;
  3272					};
  3273					mbox2-2 {
  3274						mbox-id = <2>;
  3275						chan-id = <2>;
  3276						msg-size = <1>;
  3277						recv-opt = <1>;
  3278					};
  3279					mbox3-34 {
  3280						mbox-id = <3>;
  3281						chan-id = <34>;
  3282						msg-size = <2>;
  3283						recv-opt = <0>;
  3284					};
  3285					mbox3-14 {
  3286						mbox-id = <3>;
  3287						chan-id = <14>;
  3288						msg-size = <2>;
  3289						recv-opt = <0>;
  3290					};
  3291					mbox4-26 {
  3292						mbox-id = <4>;
  3293						chan-id = <26>;
  3294						msg-size = <1>;
  3295						recv-opt = <0>;
  3296					};
  3297					mbox4-20 {
  3298						mbox-id = <4>;
  3299						chan-id = <20>;
  3300						msg-size = <1>;
  3301						recv-opt = <1>;
  3302					};
  3303				};
  3304			};
  3305	
  3306			mminfra_hwv: syscon@31a80000 {
  3307				/* TODO: Fix compatible in driver */
  3308				compatible = "mediatek,mt8196-mminfra-hwv", "mediatek,mt8196-mminfra_hwv", "syscon";
  3309				reg = <0 0x31a80000 0 0x1000>;
  3310			};
  3311	
  3312			devapc_mmup: devapc@31ad5000 {
  3313				compatible = "mediatek,mt8196-devapc";
  3314				reg = <0 0x31ad5000 0 0x1000>;
  3315				vio-idx-num = <71>;
  3316				interrupts = <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH 0>;
  3317			};
  3318	
  3319			mm_hwv: syscon@31b00000 {
  3320				/* TODO: Fix compatible in driver */
  3321				compatible = "mediatek,mt8196-mm-hwv", "mediatek,mt8196-mm_hwv", "syscon";
  3322				reg = <0 0x31b00000 0 0x3000>;
  3323			};
  3324	
  3325			hfrpsys: power-controller@31b50000 {
  3326				compatible = "mediatek,mt8196-hfrpsys-hwv", "syscon";
  3327				reg = <0 0x31b50000 0 0x1000>;
  3328				#power-domain-cells = <1>;
  3329				mmpc = <&hfrpsys>;
  3330				mm-hw-ccf-regmap = <&mm_hwv>;
  3331				mminfra-hwv-regmap = <&mminfra_hwv>;
  3332				vde-vcore0-supply = <&vdec_vcore>;
  3333			};
  3334	
  3335			dispsys_config_clk: syscon@32000000 {
  3336				compatible = "mediatek,mt8196-dispsys0", "syscon";
  3337				reg = <0 0x32000000 0 0x1000>;
  3338				mm-hw-ccf-regmap = <&mm_hwv>;
  3339				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
  3340				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
  3341				#clock-cells = <1>;
  3342	
  3343				async {
  3344					clocks = <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC0_DISP>,
  3345						 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC1_DISP>,
  3346						 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC8_DISP>,
  3347						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC1_DISP>,
  3348						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC2_DISP>,
  3349						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC3_DISP>;
  3350				};
  3351	
  3352				top {
  3353					clocks = <&dispsys_config_clk CLK_MM_CONFIG_DISP>;
  3354				};
  3355			};
  3356	
  3357			disp0_mutex: mutex@32020000 {
  3358				compatible = "mediatek,mt8196-disp-mutex";
  3359				reg = <0 0x32020000 0 0x1000>;
  3360				clocks = <&dispsys_config_clk CLK_MM_DISP_MUTEX0_DISP>;
  3361				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
  3362						      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
  3363			};
  3364	
  3365			disp_ccorr0: disp-ccorr@32090000 {
  3366				compatible = "mediatek,mt8196-disp-ccorr";
  3367				reg = <0 0x32090000 0 0x1000>;
  3368				clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR0_PQ>;
  3369			};
  3370	
  3371			disp_ccorr1: disp-ccorr@320a0000 {
  3372				compatible = "mediatek,mt8196-disp-ccorr";
  3373				reg = <0 0x320a0000 0 0x1000>;
  3374				clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR1_PQ>;
  3375			};
  3376	
  3377			disp_dither0: disp-dither@32110000 {
  3378				compatible = "mediatek,mt8196-disp-dither",
  3379					     "mediatek,mt8183-disp-dither";
  3380				reg = <0 0x32110000 0 0x1000>;
  3381				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
  3382				clocks = <&dispsys_config_clk CLK_MM_DISP_DITHER0_PQ>;
  3383			};
  3384	
  3385			disp_gamma0: disp-gamma@32130000 {
  3386				compatible = "mediatek,mt8196-disp-gamma",
  3387					     "mediatek,mt8195-disp-gamma";
  3388				reg = <0 0x32130000 0 0x1000>;
  3389				clocks = <&dispsys_config_clk CLK_MM_DISP_GAMMA0_PQ>;
  3390			};
  3391	
  3392			disp_tdshp0: disp-tdshp@321e0000 {
  3393				compatible = "mediatek,mt8196-disp-tdshp";
  3394				reg = <0 0x321e0000 0 0x1000>;
  3395				clocks = <&dispsys_config_clk CLK_MM_DISP_TDSHP0_PQ>;
  3396			};
  3397	
  3398			disp_postmask0: postmask@32180000 {
  3399				compatible = "mediatek,mt8196-disp-postmask",
  3400					     "mediatek,mt8192-disp-postmask";
  3401				reg = <0 0x32180000 0 0x1000>;
  3402				clocks = <&dispsys_config_clk CLK_MM_DISP_POSTMASK0_DISP>;
  3403			};
  3404	
  3405			disp_mdp_rsz0: mdp-rsz@321a0000 {
  3406				compatible = "mediatek,mt8196-disp-mdp-rsz";
  3407				reg = <0 0x321a0000 0 0x1000>;
  3408				clocks = <&dispsys_config_clk CLK_MM_MDP_RSZ0_DISP>;
  3409			};
  3410	
  3411			smi_larb32: larb@32240000 {
  3412				compatible = "mediatek,mt8196-smi-larb";
  3413				reg = <0 0x32240000 0 0x1000>;
  3414				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
  3415				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3416					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3417				clock-names = "apb", "smi";
  3418				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3419				mediatek,larb-id = <32>;
  3420				larb-port-real-time-type = <1 1 1 1 0 0 0 0 1 0>;
  3421			};
  3422	
  3423			dispsys1_config_clk: syscon@32400000 {
  3424				compatible = "mediatek,mt8196-dispsys1", "syscon";
  3425				reg = <0 0x32400000 0 0x1000>;
  3426				mm-hw-ccf-regmap = <&mm_hwv>;
  3427				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
  3428				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
  3429				#clock-cells = <1>;
  3430	
  3431				async {
  3432					clocks = <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC21_DISP>,
  3433						 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC22_DISP>,
  3434						 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC23_DISP>;
  3435				};
  3436	
  3437				top {
  3438					clocks = <&dispsys1_config_clk CLK_MM1_DISPSYS1_CONFIG_DISP>;
  3439					clock-names = "dispsys1_config";
  3440				};
  3441			};
  3442	
  3443			disp1_mutex: mutex@32420000 {
  3444				compatible = "mediatek,mt8196-disp-mutex";
  3445				reg = <0 0x32420000 0 0x1000>;
  3446				clocks = <&dispsys1_config_clk CLK_MM1_DISP_MUTEX0_DISP>;
  3447			};
  3448	
  3449			dp_intf0: dp-intf@32430000 {
  3450				compatible = "mediatek,mt8196-dp-intf";
  3451				reg = <0 0x32430000 0 0x1000>;
  3452				interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>;
  3453				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF0>,
  3454					 <&dispsys1_config_clk CLK_MM1_MOD4>,
  3455					 <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
  3456					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D4>,
  3457					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D8>,
  3458					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D16>,
  3459					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL1>,
  3460					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  3461				clock-names = "hf_fmm_ck",
  3462					      "hf_fdp_ck",
  3463					      "mux_dp",
  3464					      "tvdpll_d4",
  3465					      "tvdpll_d8",
  3466					      "tvdpll_d16",
  3467					      "dpi_ck",
  3468					      "dpi_26m";
  3469				num = <0>;
  3470				phys = <&dp_tx>;
  3471				phy-names = "dp_tx";
  3472			};
  3473	
  3474			dp_intf1: dp-intf@32440000 {
  3475				compatible = "mediatek,mt8196-dp-intf";
  3476				reg = <0 0x32440000 0 0x1000>;
  3477				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
  3478				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF1>,
  3479					 <&dispsys1_config_clk CLK_MM1_MOD5>,
  3480					 <&cksys_gp2_clk CLK_CK2_DP1_SEL>,
  3481					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D4>,
  3482					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D8>,
  3483					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D16>,
  3484					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL2>,
  3485					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  3486				clock-names = "hf_fmm_ck",
  3487					      "hf_fdp_ck",
  3488					      "mux_dp",
  3489					      "tvdpll_d4",
  3490					      "tvdpll_d8",
  3491					      "tvdpll_d16",
  3492					      "dpi_ck",
  3493					      "dpi_26m";
  3494				num = <1>;
  3495				no-next-bridge;
  3496				phys = <&dp_tx>;
  3497				phy-names = "dp_tx";
  3498				status = "disabled";
  3499			};
  3500	
  3501			disp_dsc0: disp-dsc0-wrap0@32450000 {
  3502				compatible = "mediatek,mt8196-disp-dsc";
  3503				reg = <0 0x32450000 0 0x1000>;
  3504				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP0>;
  3505			};
  3506	
  3507			disp_dsc1: disp-dsc1-wrap1@32460000 {
  3508				compatible = "mediatek,mt8196-disp-dsc";
  3509				reg = <0 0x32460000 0 0x1000>;
  3510				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP1>;
  3511			};
  3512	
  3513			dsi0: dsi@32490000 {
  3514				compatible = "mediatek,mt8196-dsi";
  3515				reg = <0 0x32490000 0 0x1000>;
  3516				interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH 0>;
  3517				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSI0_DISP>,
  3518					 <&dispsys1_config_clk CLK_MM1_MOD1_DISP>,
  3519					 <&mipi_tx_config0>;
  3520				clock-names = "engine", "digital", "hs";
  3521				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DSI_PHY0>;
  3522				phys = <&mipi_tx_config0>;
  3523				phy-names = "dphy";
  3524				status = "disabled";
  3525			};
  3526	
  3527			disp_dvo0: disp-dvo0@324c0000 {
  3528				compatible = "mediatek,mt8196-edp-dvo";
  3529				reg = <0 0x324c0000 0 0x1000>;
  3530				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
  3531				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DVO0_DISP>,
  3532					 <&cksys_gp2_clk CLK_CK2_DVO_SEL>,
  3533					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL3>,
  3534					 <&dispsys1_config_clk CLK_MM1_MOD6>;
  3535				clock-names = "engine",
  3536					      "pixel",
  3537					      "pll",
  3538					      "hf_fdvo_clk";
  3539				status = "disabled";
  3540			};
  3541	
  3542			smi_larb33: larb@32600000 {
  3543				compatible = "mediatek,mt8196-smi-larb";
  3544				reg = <0 0x32600000 0 0x1000>;
  3545				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
  3546				clocks = <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>,
  3547					 <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>;
  3548				clock-names = "apb", "smi";
  3549				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3550				mediatek,larb-id = <33>;
  3551				larb-port-real-time-type = <0 1 1 1 0 0 0 1 0 0 0 0 0 0 0 1>;
  3552			};
  3553	
  3554			ovlsys_config_clk: syscon@32800000 {
  3555				/* TODO: Fix compatible in driver */
  3556				compatible = "mediatek,mt8196-ovlsys-config", "mediatek,mt8196-ovlsys_config", "syscon";
  3557				reg = <0 0x32800000 0 0x1000>;
  3558				mm-hw-ccf-regmap = <&mm_hwv>;
  3559				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>,
  3560					 <&gce0 8 CMDQ_THR_PRIO_4>, <&gce0 9 CMDQ_THR_PRIO_4>;
  3561				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3562				#clock-cells = <1>;
  3563	
  3564				async {
  3565					clocks = <&ovlsys_config_clk CLK_OVL_DLO5_DISP>,
  3566						 <&ovlsys_config_clk CLK_OVL_DLO6_DISP>;
  3567				};
  3568			};
  3569	
  3570			ovl0_mutex: mutex@32820000 {
  3571				compatible = "mediatek,mt8196-disp-mutex";
  3572				reg = <0 0x32820000 0 0x1000>;
  3573				clocks = <&ovlsys_config_clk CLK_OVL_MUTEX0_DISP>;
  3574				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
  3575						      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
  3576			};
  3577	
  3578			disp_ovl0_exdma2: dma-controller@32850000 {
  3579				compatible = "mediatek,mt8196-exdma";
  3580				reg = <0 0x32850000 0 0x1000>;
  3581				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA2_DISP>;
  3582				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3583				mediatek,larb = <&smi_larb0>;
  3584				iommus = <&mm_smmu 144>;
  3585				#dma-cells = <1>;
  3586			};
  3587	
  3588			disp_ovl0_exdma3: dma-controller@32860000 {
  3589				compatible = "mediatek,mt8196-exdma";
  3590				reg = <0 0x32860000 0 0x1000>;
  3591				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA3_DISP>;
  3592				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3593				mediatek,larb = <&smi_larb1>;
  3594				#dma-cells = <1>;
  3595			};
  3596	
  3597			disp_ovl0_exdma4: dma-controller@32870000 {
  3598				compatible = "mediatek,mt8196-exdma";
  3599				reg = <0 0x32870000 0 0x1000>;
  3600				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA4_DISP>;
  3601				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3602				mediatek,larb = <&smi_larb20>;
  3603				#dma-cells = <1>;
  3604			};
  3605	
  3606			disp_ovl0_exdma5: dma-controller@32880000 {
  3607				compatible = "mediatek,mt8196-exdma";
  3608				reg = <0 0x32880000 0 0x1000>;
  3609				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA5_DISP>;
  3610				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3611				mediatek,larb = <&smi_larb21>;
  3612				#dma-cells = <1>;
  3613			};
  3614	
  3615			disp_ovl0_exdma6: dma-controller@32890000 {
  3616				compatible = "mediatek,mt8196-exdma";
  3617				reg = <0 0x32890000 0 0x1000>;
  3618				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA6_DISP>;
  3619				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3620				mediatek,larb = <&smi_larb1 SMMU_L1_P3_OVL_RDMA6>;
  3621				#dma-cells = <1>;
  3622			};
  3623	
  3624			disp_ovl0_exdma7: dma-controller@328a0000 {
  3625				compatible = "mediatek,mt8196-exdma";
  3626				reg = <0 0x328a0000 0 0x1000>;
  3627				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA7_DISP>;
  3628				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3629				mediatek,larb = <&smi_larb0>;
  3630				#dma-cells = <1>;
  3631			};
  3632	
  3633			disp_ovl0_exdma8: dma-controller@328b0000 {
  3634				compatible = "mediatek,mt8196-exdma";
  3635				reg = <0 0x328b0000 0 0x1000>;
  3636				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA8_DISP>;
  3637				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3638				mediatek,larb = <&smi_larb21>;
  3639				#dma-cells = <1>;
  3640			};
  3641	
  3642			disp_ovl0_exdma9: dma-controller@328c0000 {
  3643				compatible = "mediatek,mt8196-exdma";
  3644				reg = <0 0x328c0000 0 0x1000>;
  3645				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA9_DISP>;
  3646				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3647				mediatek,larb = <&smi_larb20>;
  3648				#dma-cells = <1>;
  3649			};
  3650	
  3651			disp_ovl0_blender0: blender@328d0000 {
  3652				compatible = "mediatek,mt8196-blender";
  3653				reg = <0 0x328d0000 0 0x1000>;
  3654				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER0_DISP>;
  3655			};
  3656	
  3657			disp_ovl0_blender1: blender@328e0000 {
  3658				compatible = "mediatek,mt8196-blender";
  3659				reg = <0 0x328e0000 0 0x1000>;
  3660				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER1_DISP>;
  3661			};
  3662	
  3663			disp_ovl0_blender2: blender@328f0000 {
  3664				compatible = "mediatek,mt8196-blender";
  3665				reg = <0 0x328f0000 0 0x1000>;
  3666				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER2_DISP>;
  3667			};
  3668	
  3669			disp_ovl0_blender3: blender@32900000 {
  3670				compatible = "mediatek,mt8196-blender";
  3671				reg = <0 0x32900000 0 0x1000>;
  3672				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER3_DISP>;
  3673			};
  3674	
  3675			disp_ovl0_blender4: blender@32910000 {
  3676				compatible = "mediatek,mt8196-blender";
  3677				reg = <0 0x32910000 0 0x1000>;
  3678				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER4_DISP>;
  3679			};
  3680	
  3681			disp_ovl0_blender5: blender@32920000 {
  3682				compatible = "mediatek,mt8196-blender";
  3683				reg = <0 0x32920000 0 0x1000>;
  3684				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER5_DISP>;
  3685			};
  3686	
  3687			disp_ovl0_blender6: blender@32930000 {
  3688				compatible = "mediatek,mt8196-blender";
  3689				reg = <0 0x32930000 0 0x1000>;
  3690				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER6_DISP>;
  3691			};
  3692	
  3693			disp_ovl0_blender7: blender@32940000 {
  3694				compatible = "mediatek,mt8196-blender";
  3695				reg = <0 0x32940000 0 0x1000>;
  3696				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER7_DISP>;
  3697			};
  3698	
  3699			disp_ovl0_blender8: blender@32950000 {
  3700				compatible = "mediatek,mt8196-blender";
  3701				reg = <0 0x32950000 0 0x1000>;
  3702				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER8_DISP>;
  3703			};
  3704	
  3705			disp_ovl0_blender9: blender@32960000 {
  3706				compatible = "mediatek,mt8196-blender";
  3707				reg = <0 0x32960000 0 0x1000>;
  3708				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER9_DISP>;
  3709			};
  3710	
  3711			disp_ovl0_outproc0: outproc@32970000 {
  3712				compatible = "mediatek,mt8196-outproc";
  3713				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC0_DISP>;
  3714				interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH 0>;
  3715				reg = <0 0x32970000 0 0x1000>;
  3716				mediatek,gce-events = <CMDQ_EVENT_OVL0_FRAME_DONE_SEL0>;
  3717				mboxes = <&gce0 3 CMDQ_THR_PRIO_4>;
  3718			};
  3719	
  3720			disp_ovl0_outproc1: outproc@32980000 {
  3721				compatible = "mediatek,mt8196-outproc";
  3722				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC1_DISP>;
  3723				interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH 0>;
  3724				reg = <0 0x32980000 0 0x1000>;
  3725			};
  3726	
  3727			disp_ovl0_outproc2: outproc@32990000 {
  3728				compatible = "mediatek,mt8196-outproc";
  3729				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC2_DISP>;
  3730				reg = <0 0x32990000 0 0x1000>;
  3731			};
  3732	
  3733			disp_ovl0_outproc3: outproc@329a0000 {
  3734				compatible = "mediatek,mt8196-outproc";
  3735				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC3_DISP>;
  3736				reg = <0 0x329a0000 0 0x1000>;
  3737			};
  3738	
  3739			disp_ovl0_outproc4: outproc@329b0000 {
  3740				compatible = "mediatek,mt8196-outproc";
  3741				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC4_DISP>;
  3742				reg = <0 0x329b0000 0 0x1000>;
  3743			};
  3744	
  3745			disp_ovl0_outproc5: outproc@329c0000 {
  3746				compatible = "mediatek,mt8196-outproc";
  3747				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC5_DISP>;
  3748				reg = <0 0x329c0000 0 0x1000>;
  3749			};
  3750	
  3751			smi_larb0: larb@32a60000 {
  3752				compatible = "mediatek,mt8196-smi-larb";
  3753				reg = <0 0x32a60000 0 0x1000>;
  3754				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3755				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3756					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3757				clock-names = "apb", "smi";
  3758				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  3759				mediatek,larb-id = <0>;
  3760				larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
  3761			};
  3762	
  3763			smi_larb1: larb@32a70000 {
  3764				compatible = "mediatek,mt8196-smi-larb";
  3765				reg = <0 0x32a70000 0 0x1000>;
  3766				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3767				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3768					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3769				clock-names = "apb", "smi";
  3770				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3771				mediatek,larb-id = <1>;
  3772				larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
  3773			};
  3774	
  3775			smi_larb20: larb@32a80000 {
  3776				compatible = "mediatek,mt8196-smi-larb";
  3777				reg = <0 0x32a80000 0 0x1000>;
  3778				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3779				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3780					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3781				clock-names = "apb", "smi";
  3782				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3783				mediatek,larb-id = <20>;
  3784				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
  3785			};
  3786	
  3787			smi_larb21: larb@32a90000 {
  3788				compatible = "mediatek,mt8196-smi-larb";
  3789				reg = <0 0x32a90000 0 0x1000>;
  3790				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3791				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3792					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3793				clock-names = "apb", "smi";
  3794				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3795				mediatek,larb-id = <21>;
  3796				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
  3797			};
  3798	
  3799			ovlsys1_config_clk: syscon@32c00000 {
  3800				/* TODO: Fix compatible in driver */
  3801				compatible = "mediatek,mt8196-ovlsys1-config", "mediatek,mt8196-ovlsys1_config", "syscon";
  3802				reg = <0 0x32c00000 0 0x1000>;
  3803				mm-hw-ccf-regmap = <&mm_hwv>;
  3804				mboxes = <&gce0 2 CMDQ_THR_PRIO_4>, <&gce0 10 CMDQ_THR_PRIO_4>;
  3805				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3806				#clock-cells = <1>;
  3807	
  3808				async {
  3809					clocks = <&ovlsys1_config_clk CLK_OVL_DLO5_DISP>,
  3810						 <&ovlsys1_config_clk CLK_OVL_DLO6_DISP>;
  3811				};
  3812			};
  3813	
  3814			ovl1_mutex: mutex@32c20000 {
  3815				compatible = "mediatek,mt8196-disp-mutex";
  3816				reg = <0 0x32c20000 0 0x1000>;
  3817				clocks = <&ovlsys1_config_clk CLK_OVL_MUTEX0_DISP>;
  3818				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT2>;
  3819			};
  3820	
  3821			disp_ovl1_exdma2: dma-controller@32c50000 {
  3822				compatible = "mediatek,mt8196-exdma";
  3823				reg = <0 0x32c50000 0 0x1000>;
  3824				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA2_DISP>;
  3825				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3826				mediatek,larb = <&smi_larb34>;
  3827				#dma-cells = <1>;
  3828			};
  3829	
  3830			disp_ovl1_exdma3: dma-controller@32c60000 {
  3831				compatible = "mediatek,mt8196-exdma";
  3832				reg = <0 0x32c60000 0 0x1000>;
  3833				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA3_DISP>;
  3834				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3835				mediatek,larb = <&smi_larb35>;
  3836				#dma-cells = <1>;
  3837			};
  3838	
  3839			disp_ovl1_exdma4: dma-controller@32c70000 {
  3840				compatible = "mediatek,mt8196-exdma";
  3841				reg = <0 0x32c70000 0 0x1000>;
  3842				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA4_DISP>;
  3843				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3844				mediatek,larb = <&smi_larb36>;
  3845				#dma-cells = <1>;
  3846			};
  3847	
  3848			disp_ovl1_exdma5: dma-controller@32c80000 {
  3849				compatible = "mediatek,mt8196-exdma";
  3850				reg = <0 0x32c80000 0 0x1000>;
  3851				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA5_DISP>;
  3852				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3853				mediatek,larb = <&smi_larb37>;
  3854				#dma-cells = <1>;
  3855			};
  3856	
  3857			disp_ovl1_exdma6: dma-controller@32c90000 {
  3858				compatible = "mediatek,mt8196-exdma";
  3859				reg = <0 0x32c90000 0 0x1000>;
  3860				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA6_DISP>;
  3861				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3862				mediatek,larb = <&smi_larb35>;
  3863				#dma-cells = <1>;
  3864			};
  3865	
  3866			disp_ovl1_exdma7: dma-controller@32ca0000 {
  3867				compatible = "mediatek,mt8196-exdma";
  3868				reg = <0 0x32ca0000 0 0x1000>;
  3869				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA7_DISP>;
  3870				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3871				mediatek,larb = <&smi_larb34>;
  3872				#dma-cells = <1>;
  3873			};
  3874	
  3875			disp_ovl1_exdma8: dma-controller@32cb0000 {
  3876				compatible = "mediatek,mt8196-exdma";
  3877				reg = <0 0x32cb0000 0 0x1000>;
  3878				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA8_DISP>;
  3879				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3880				mediatek,larb = <&smi_larb37>;
  3881				#dma-cells = <1>;
  3882			};
  3883	
  3884			disp_ovl1_exdma9: dma-controller@32cc0000 {
  3885				compatible = "mediatek,mt8196-exdma";
  3886				reg = <0 0x32cc0000 0 0x1000>;
  3887				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA9_DISP>;
  3888				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3889				mediatek,larb = <&smi_larb36>;
  3890				#dma-cells = <1>;
  3891			};
  3892	
  3893			disp_ovl1_blender0: blender@32cd0000 {
  3894				compatible = "mediatek,mt8196-blender";
  3895				reg = <0 0x32cd0000 0 0x1000>;
  3896				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER0_DISP>;
  3897			};
  3898	
  3899			disp_ovl1_blender1: blender@32ce0000 {
  3900				compatible = "mediatek,mt8196-blender";
  3901				reg = <0 0x32ce0000 0 0x1000>;
  3902				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER1_DISP>;
  3903			};
  3904	
  3905			disp_ovl1_blender2: blender@32cf0000 {
  3906				compatible = "mediatek,mt8196-blender";
  3907				reg = <0 0x32cf0000 0 0x1000>;
  3908				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER2_DISP>;
  3909			};
  3910	
  3911			disp_ovl1_blender3: blender@32d00000 {
  3912				compatible = "mediatek,mt8196-blender";
  3913				reg = <0 0x32d00000 0 0x1000>;
  3914				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER3_DISP>;
  3915			};
  3916	
  3917			disp_ovl1_blender4: blender@32d10000 {
  3918				compatible = "mediatek,mt8196-blender";
  3919				reg = <0 0x32d10000 0 0x1000>;
  3920				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER4_DISP>;
  3921			};
  3922	
  3923			disp_ovl1_blender5: blender@32d20000 {
  3924				compatible = "mediatek,mt8196-blender";
  3925				reg = <0 0x32d20000 0 0x1000>;
  3926				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER5_DISP>;
  3927			};
  3928	
  3929			disp_ovl1_blender6: blender@32d30000 {
  3930				compatible = "mediatek,mt8196-blender";
  3931				reg = <0 0x32d30000 0 0x1000>;
  3932				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER6_DISP>;
  3933			};
  3934	
  3935			disp_ovl1_blender7: blender@32d40000 {
  3936				compatible = "mediatek,mt8196-blender";
  3937				reg = <0 0x32d40000 0 0x1000>;
  3938				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER7_DISP>;
  3939			};
  3940	
  3941			disp_ovl1_blender8: blender@32d50000 {
  3942				compatible = "mediatek,mt8196-blender";
  3943				reg = <0 0x32d50000 0 0x1000>;
  3944				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER8_DISP>;
  3945			};
  3946	
  3947			disp_ovl1_blender9: blender@32d60000 {
  3948				compatible = "mediatek,mt8196-blender";
  3949				reg = <0 0x32d60000 0 0x1000>;
  3950				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER9_DISP>;
  3951			};
  3952	
  3953			disp_ovl1_outproc0: outproc@32d70000 {
  3954				compatible = "mediatek,mt8196-outproc";
  3955				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC0_DISP>;
  3956				interrupts = <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH 0>;
  3957				reg = <0 0x32d70000 0 0x1000>;
  3958			};
  3959	
  3960			disp_ovl1_outproc1: outproc@32d80000 {
  3961				compatible = "mediatek,mt8196-outproc";
  3962				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC1_DISP>;
  3963				reg = <0 0x32d80000 0 0x1000>;
  3964			};
  3965	
  3966			disp_ovl1_outproc2: outproc@32d90000 {
  3967				compatible = "mediatek,mt8196-outproc";
  3968				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC2_DISP>;
  3969				reg = <0 0x32d90000 0 0x1000>;
  3970			};
  3971	
  3972			disp_ovl1_outproc3: outproc@32da0000 {
  3973				compatible = "mediatek,mt8196-outproc";
  3974				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC3_DISP>;
  3975				reg = <0 0x32da0000 0 0x1000>;
  3976			};
  3977	
  3978			disp_ovl1_outproc4: outproc@32db0000 {
  3979				compatible = "mediatek,mt8196-outproc";
  3980				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC4_DISP>;
  3981				reg = <0 0x32db0000 0 0x1000>;
  3982			};
  3983	
  3984			disp_ovl1_outproc5: outproc@32dc0000 {
  3985				compatible = "mediatek,mt8196-outproc";
  3986				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC5_DISP>;
  3987				reg = <0 0x32dc0000 0 0x1000>;
  3988			};
  3989	
  3990			smi_larb34: larb@32e60000 {
  3991				compatible = "mediatek,mt8196-smi-larb";
  3992				reg = <0 0x32e60000 0 0x1000>;
  3993				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3994				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3995					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3996				clock-names = "apb", "smi";
  3997				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3998				mediatek,larb-id = <34>;
  3999				larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
  4000			};
  4001	
  4002			smi_larb35: larb@32e70000 {
  4003				compatible = "mediatek,mt8196-smi-larb";
  4004				reg = <0 0x32e70000 0 0x1000>;
  4005				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  4006				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  4007					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  4008				clock-names = "apb", "smi";
  4009				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  4010				mediatek,larb-id = <35>;
  4011				larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
  4012			};
  4013	
  4014			smi_larb36: larb@32e80000 {
  4015				compatible = "mediatek,mt8196-smi-larb";
  4016				reg = <0 0x32e80000 0 0x1000>;
  4017				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  4018				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  4019					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  4020				clock-names = "apb", "smi";
  4021				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  4022				mediatek,larb-id = <36>;
  4023				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
  4024			};
  4025	
  4026			smi_larb37: larb@32e90000 {
  4027				compatible = "mediatek,mt8196-smi-larb";
  4028				reg = <0 0x32e90000 0 0x1000>;
  4029				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  4030				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  4031					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  4032				clock-names = "apb", "smi";
  4033				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  4034				mediatek,larb-id = <37>;
  4035				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
  4036			};
  4037	
  4038			video_codec: video@36000000 {
  4039				compatible = "mediatek,mt8196-vcodec-dec";
  4040				mediatek,vcp = <&vcp>;
  4041				iommus = <&mm_smmu 177>;
  4042				#address-cells = <2>;
  4043				#size-cells = <2>;
  4044				reg = <0 0x36000000 0 0x1000>,
  4045					<0 0x36098000 0 0x1000>;
  4046				ranges = <0 0 0 0x36000000 0 0x26000>;
  4047	
  4048				video-codec@10000 {
  4049					compatible = "mediatek,mtk-vcodec-lat";
  4050					reg = <0 0x10000 0 0x800>;
  4051					interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
  4052					clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>,
  4053						<&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  4054						<&vdec_soc_gcon_base_clk CLK_VDE1_LAT_CKEN>,
  4055						<&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
  4056					clock-names = "sel", "vdec", "lat", "top";
  4057					assigned-clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>;
  4058					assigned-clock-parents = <&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
  4059					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  4060				};
  4061	
  4062				video-codec@25000 {
  4063					compatible = "mediatek,mtk-vcodec-core";
  4064					reg = <0 0x25000 0 0x1000>;		/* VDEC_CORE_MISC */
  4065					interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH 0>;
  4066					clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>,
  4067						<&vdec_gcon_base_clk CLK_VDE2_LAT_CKEN>,
  4068						<&vdec_gcon_base_clk CLK_VDE2_VDEC_CKEN>,
  4069						<&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
  4070					clock-names = "sel", "vdec", "lat", "top";
  4071					assigned-clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>;
  4072					assigned-clock-parents = <&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
  4073					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
  4074				};
  4075			};
  4076	
  4077			smi_larb5: larb@3600d000 {
  4078				compatible = "mediatek,mt8196-smi-larb";
  4079				reg = <0 0x3600d000 0 0x1000>;
  4080				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  4081				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  4082					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  4083				clock-names = "apb", "smi";
  4084				mediatek,smi = <&smi_disp_common>;
  4085				mediatek,larb-id = <5>;
  4086				larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
  4087			};
  4088	
  4089			smi_larb6: larb@3600e000 {
  4090				compatible = "mediatek,mt8196-smi-larb";
  4091				reg = <0 0x3600e000 0 0x1000>;
  4092				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  4093				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  4094					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  4095				clock-names = "apb", "smi";
  4096				mediatek,smi = <&smi_mdp_common>;
  4097				mediatek,larb-id = <6>;
  4098				larb-port-real-time-type = <1 1 1>;
  4099			};
  4100	
  4101			vdec_soc_gcon_base_clk: syscon@3600f000 {
  4102				/* TODO: Fix compatible in driver */
  4103				compatible = "mediatek,mt8196-vdecsys-soc", "mediatek,mt8196-vdecsys_soc", "syscon";
  4104				reg = <0 0x3600f000 0 0x1000>;
  4105				#clock-cells = <1>;
  4106				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  4107			};
  4108	
  4109			smi_larb4: larb@3602e000 {
  4110				compatible = "mediatek,mt8196-smi-larb";
  4111				reg = <0 0x3602e000 0 0x1000>;
  4112				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
  4113				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  4114					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  4115				clock-names = "apb", "smi";
  4116				mediatek,smi = <&smi_mdp_common>;
  4117				mediatek,larb-id = <4>;
  4118				larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
  4119			};
  4120	
  4121			vdec_gcon_base_clk: syscon@3602f000 {
  4122				compatible = "mediatek,mt8196-vdecsys", "syscon";
  4123				reg = <0 0x3602f000 0 0x1000>;
  4124				#clock-cells = <1>;
  4125				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
  4126			};
  4127	
  4128			venc_gcon_clk: syscon@38000000 {
  4129				compatible = "mediatek,mt8196-vencsys", "syscon";
  4130				reg = <0 0x38000000 0 0x1000>;
  4131				mm-hw-ccf-regmap = <&mm_hwv>;
  4132				#clock-cells = <1>;
  4133				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  4134			};
  4135	
  4136			smi_larb7: larb@38010000 {
  4137				compatible = "mediatek,mt8196-smi-larb";
  4138				reg = <0 0x38010000 0 0x1000>;
  4139				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  4140				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  4141					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  4142				clock-names = "apb", "smi";
  4143				mediatek,smi = <&smi_disp_venc_sub_comm0>;
  4144				mediatek,larb-id = <7>;
  4145				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  4146			};
  4147	
  4148			venc: video-codec@38020000 {
  4149				compatible = "mediatek,mt8196-vcodec-enc";
  4150				reg = <0 0x38020000 0 0x6000>;
  4151				mediatek,vcp = <&vcp>;
  4152				iommus = <&mm_smmu 176>;
  4153				interrupts = <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH 0>;
  4154				clocks = <&venc_gcon_clk CLK_VEN1_CKE1_VENC>;
  4155				clock-names = "venc_sel";
  4156				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  4157			};
  4158	
  4159			smi_disp_venc_sub_comm0: smi-sub-comm@38070000 {
  4160				compatible = "mediatek,mt8196-smi-sub-common";
  4161				reg = <0 0x38070000 0 0x1000>;
  4162				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  4163				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  4164					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  4165				clock-names = "apb", "smi";
  4166				mediatek,smi = <&smi_disp_common>;
  4167				mediatek,common-id = <15>;
  4168			};
  4169	
  4170			smi_larb41: larb@38090000 {
  4171				compatible = "mediatek,mt8196-smi-larb";
  4172				reg = <0 0x38090000 0 0x1000>;
  4173				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  4174				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  4175					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  4176				clock-names = "apb", "smi";
  4177				mediatek,smi = <&smi_disp_venc_sub_comm0>;
  4178				mediatek,larb-id = <41>;
  4179				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  4180			};
  4181	
  4182			venc_gcon_core1_clk: syscon@38800000 {
  4183				/* TODO: Fix compatible in driver */
  4184				compatible = "mediatek,mt8196-vencsys-c1", "mediatek,mt8196-vencsys_c1", "syscon";
  4185				reg = <0 0x38800000 0 0x1000>;
  4186				mm-hw-ccf-regmap = <&mm_hwv>;
  4187				#clock-cells = <1>;
  4188				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4189			};
  4190	
  4191			smi_larb8: larb@38810000 {
  4192				compatible = "mediatek,mt8196-smi-larb";
  4193				reg = <0 0x38810000 0 0x1000>;
  4194				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4195				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  4196					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  4197				clock-names = "apb", "smi";
  4198				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  4199				mediatek,larb-id = <8>;
  4200				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  4201			};
  4202	
  4203	
  4204			smi_mdp_venc_sub_comm1: smi-sub-comm@38870000 {
  4205				compatible = "mediatek,mt8196-smi-sub-common";
  4206				reg = <0 0x38870000 0 0x1000>;
  4207				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4208				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  4209					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  4210				clock-names = "apb", "smi";
  4211				mediatek,smi = <&smi_mdp_common>;
  4212				mediatek,common-id = <16>;
  4213			};
  4214	
  4215			smi_larb42: larb@38890000 {
  4216				compatible = "mediatek,mt8196-smi-larb";
  4217				reg = <0 0x38890000 0 0x1000>;
  4218				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4219				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  4220					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  4221				clock-names = "apb", "smi";
  4222				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  4223				mediatek,larb-id = <42>;
  4224				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  4225			};
  4226	
  4227			venc_gcon_core2_clk: syscon@38c00000 {
  4228				/* TODO: Fix compatible in driver */
  4229				compatible = "mediatek,mt8196-vencsys-c2", "mediatek,mt8196-vencsys_c2", "syscon";
  4230				reg = <0 0x38c00000 0 0x1000>;
  4231				mm-hw-ccf-regmap = <&mm_hwv>;
  4232				#clock-cells = <1>;
  4233				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  4234			};
  4235	
  4236			smi_larb24: larb@38c10000 {
  4237				compatible = "mediatek,mt8196-smi-larb";
  4238				reg = <0 0x38c10000 0 0x1000>;
  4239				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  4240				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  4241					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  4242				clock-names = "apb", "smi";
  4243				mediatek,smi = <&smi_mdp_venc_sub_comm2>;
  4244				mediatek,larb-id = <24>;
  4245				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  4246			};
  4247	
  4248			smi_mdp_venc_sub_comm2: smi-sub-comm@38c70000 {
  4249				compatible = "mediatek,mt8196-smi-sub-common";
  4250				reg = <0 0x38c70000 0 0x1000>;
  4251				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  4252				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  4253					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  4254				clock-names = "apb", "smi";
  4255				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  4256				mediatek,common-id = <18>;
  4257			};
  4258	
  4259			smi_larb47: larb@38c90000 {
  4260				compatible = "mediatek,mt8196-smi-larb";
  4261				reg = <0 0x38c90000 0 0x1000>;
  4262				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  4263				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  4264					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  4265				clock-names = "apb", "smi";
  4266				mediatek,smi = <&smi_mdp_venc_sub_comm2>;
  4267				mediatek,larb-id = <47>;
  4268				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  4269			};
  4270	
  4271			cam_main_r1a_clk: syscon@3a000000 {
  4272				/* TODO: Fix compatible in driver */
  4273				compatible = "mediatek,mt8196-cam_main-r1a", "mediatek,mt8196-cam_main_r1a", "syscon";
  4274				reg = <0 0x3a000000 0 0x1000>;
  4275				mm-hw-ccf-regmap = <&mm_hwv>;
  4276				#clock-cells = <1>;
  4277			};
  4278	
  4279			mdpsys_config_clk: syscon@3e000000 {
  4280				compatible = "mediatek,mt8196-mdpsys", "syscon";
  4281				reg = <0 0x3e000000 0 0x1000>;
  4282				#clock-cells = <1>;
  4283				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
  4284			};
  4285	
  4286			smi_larb2: larb@3e030000 {
  4287				compatible = "mediatek,mt8196-smi-larb";
  4288				reg = <0 0x3e030000 0 0x1000>;
  4289				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
  4290				clocks = <&mdpsys_config_clk CLK_MDP_SMI0_SMI>, <&mdpsys_config_clk CLK_MDP_SMI0_SMI>;
  4291				clock-names = "apb", "smi";
  4292				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  4293				mediatek,larb-id = <2>;
  4294				larb-port-real-time-type = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
  4295			};
  4296	
  4297			mdpsys1_config_clk: syscon@3e400000 {
  4298				compatible = "mediatek,mt8196-mdpsys1", "syscon";
  4299				reg = <0 0x3e400000 0 0x1000>;
  4300				#clock-cells = <1>;
  4301				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
  4302			};
  4303	
  4304			smi_larb3: larb@3e430000 {
  4305				compatible = "mediatek,mt8196-smi-larb";
  4306				reg = <0 0x3e430000 0 0x1000>;
  4307				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
  4308				clocks = <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>, <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>;
  4309				clock-names = "apb", "smi";
  4310				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  4311				mediatek,larb-id = <3>;
  4312				larb-port-real-time-type = <2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 1 2>;
  4313			};
  4314	
  4315			disp_vdisp_ao_config_clk: syscon@3e800000 {
  4316				/* TODO: Fix compatible in driver */
  4317				compatible = "mediatek,mt8196-disp-vdisp-ao-config", "mediatek,mt8196-disp_vdisp_ao_config", "syscon";
  4318				reg = <0 0x3e800000 0 0x1000>;
  4319				mm-hw-ccf-regmap = <&mm_hwv>;
  4320				#clock-cells = <1>;
  4321				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4322			};
  4323	
  4324			smi_disp_dram_sub_comm0: smi-sub-comm@3e810000 {
  4325				compatible = "mediatek,mt8196-smi-sub-common";
  4326				reg = <0 0x3e810000 0 0x1000>;
  4327				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4328				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  4329						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  4330				clock-names = "apb", "smi";
  4331				mediatek,smi = <&smi_disp_common>;
  4332				mediatek,common-id = <9>;
  4333			};
  4334	
  4335			smi_disp_dram_sub_comm1: smi-sub-comm@3e820000 {
  4336				compatible = "mediatek,mt8196-smi-sub-common";
  4337				reg = <0 0x3e820000 0 0x1000>;
  4338				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4339				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  4340						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  4341				clock-names = "apb", "smi";
  4342				mediatek,smi = <&smi_disp_common>;
  4343				mediatek,common-id = <10>;
  4344			};
  4345	
  4346			smi_mdp_dram_sub_comm2: smi-sub-comm@3e830000 {
  4347				compatible = "mediatek,mt8196-smi-sub-common";
  4348				reg = <0 0x3e830000 0 0x1000>;
  4349				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4350				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  4351						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  4352				clock-names = "apb", "smi";
  4353				mediatek,smi = <&smi_mdp_common>;
  4354				mediatek,common-id = <11>;
  4355			};
  4356	
  4357			smi_mdp_dram_sub_comm3: smi-sub-comm@3e840000 {
  4358				compatible = "mediatek,mt8196-smi-sub-common";
  4359				reg = <0 0x3e840000 0 0x1000>;
  4360				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4361				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  4362						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  4363				clock-names = "apb", "smi";
  4364				mediatek,smi = <&smi_mdp_common>;
  4365				mediatek,common-id = <12>;
  4366			};
  4367	
  4368			dp_tx: dp-tx@3ec00000 {
  4369				compatible = "mediatek,mt8196-dp-tx";
  4370				reg = <0 0x3ec00000 0 0x5000>,
  4371				      <0 0x128b0000 0 0x1500>,
  4372				      <0 0x1002d600 0 0x4>,
  4373				      <0 0x31b50078 0 0x4>;
  4374				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT>,
  4375						<&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
  4376				power-domain-names = "pd_dp_tx", "pd_dp_phy";
  4377				interrupts = <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH 0>;
  4378				dptx,phy-params = <0x221c1814 0x24241e18 0x0000302a
  4379						   0x0e080400 0x000c0600 0x00000006>;
  4380				#phy-cells = <0>;
  4381				clocks = <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
  4382					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  4383				clock-names = "mux_dp",
  4384					      "ck_26m";
  4385			};
  4386	
  4387			edp_tx: edp-tx@3ec40000 {
  4388				compatible = "mediatek,mt8196-edp-tx";
  4389				reg = <0 0x3ec40000 0 0x4000>,
  4390				      <0 0x130a0000 0 0x1500>,
  4391				      <0 0x31b50074 0 0x4>;
  4392				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT>;
  4393				clocks = <&cksys_gp2_clk CLK_CK2_DVO_SEL>;
  4394				clock-names = "power";
  4395				max-linkrate-mhz = <8100>;
  4396				interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH 0>;
  4397				status = "disabled";
  4398			};
  4399	
  4400			gpu: gpu@48000000 {
  4401				compatible = "mediatek,mali-mt8196", "mediatek,mali";
  4402				reg = <0 0x48000000 0 0x480000>;
  4403				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
  4404					     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
  4405					     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>,
  4406					     <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH 0>,
  4407					     <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>,
  4408					     <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH 0>;
  4409				interrupt-names = "job",
  4410						  "mmu",
  4411						  "gpu",
  4412						  "event",
  4413						  "pwr",
  4414						  "gpueb_mbox1";
  4415				l2-hash-values = <0xb 0xe 0x0>;
  4416				physical-memory-group-manager = <&mgm>;
  4417				protected-memory-allocator = <&gpu_protected_memory_allocator>;
  4418				operating-points-v2 = <&gpu_mali_opp>;
  4419				#cooling-cells = <2>;
  4420				ged-supply = <&ged>;
  4421				system-coherency = <31>;
  4422				sleep-mode-enable;
  4423				firmware-idle-hysteresis-time-us = <0>;
  4424				default-glb-pwroff-timeout-us = <10>;
  4425				autosuspend-delay-ms = <10>;
  4426				adaptive-power-policy = <2>;
  4427				reset-exception-mask = <0x0>;
  4428				iter-trace-enable = <1>;
  4429				gpu-frame-base-optimize = <1>;
  4430	
  4431				pbha {
  4432					propagate-bits = /bits/ 8 <0xf>;
  4433				};
  4434			};
  4435	
  4436			gpufreq: gpufreq@48500000 {
  4437				compatible = "mediatek,gpufreq";
  4438				reg = <0 0x48500000 0 0x1000>,   /* MFG_TOP_CONFIG */
  4439				      <0 0x48600000 0 0x200000>, /* MFG_SMMU */
  4440				      <0 0x48800000 0 0x1000>,   /* MFG_VGPU_BUS_DBG_TRACKER */
  4441				      <0 0x4b190000 0 0x20000>,  /* MFG_GPUEB_BUS_DBG_TRACKER */
  4442				      <0 0x4b800000 0 0x10000>,  /* MFG_RPC */
  4443				      <0 0x4b810000 0 0x400>,    /* MFG_PLL */
  4444				      <0 0x4b810400 0 0x400>,    /* MFG_PLL_SC0 */
  4445				      <0 0x4b810800 0 0x400>,    /* MFG_PLL_SC1 */
  4446				      <0 0x4b840000 0 0x1000>,   /* MFG_HBVC */
  4447				      <0 0x4b860000 0 0x1000>,   /* MFG_VCORE_AO_CFG */
  4448				      <0 0x4b8b0000 0 0x1000>,   /* MFG_VCORE_DEVAPC */
  4449				      <0 0x4b900000 0 0x1000>,   /* MFG_VCORE_BUS_DBG_TRACKER */
  4450				      <0 0x0c000000 0 0x1000>,   /* MCUSYS_PAR_WRAP */
  4451				      <0 0x10000000 0 0x1000>,   /* CKSYS */
  4452				      <0 0x10404000 0 0x1000>,   /* NTH_EMICFG_AO_MEM */
  4453				      <0 0x10416000 0 0x1000>,   /* NTH_EMI_AO_DEBUG_CTRL */
  4454				      <0 0x10425000 0 0x1000>,   /* NTH_EMICFG */
  4455				      <0 0x10469000 0 0x1000>,   /* EMI */
  4456				      <0 0x10504000 0 0x1000>,   /* STH_EMICFG_AO_MEM */
  4457				      <0 0x10516000 0 0x1000>,   /* STH_EMI_AO_DEBUG_CTRL */
  4458				      <0 0x10525000 0 0x1000>,   /* STH_EMICFG */
  4459				      <0 0x10569000 0 0x1000>,   /* SUB_EMI */
  4460				      <0 0x10621000 0 0x1000>,   /* SEMI_MI32_SMI */
  4461				      <0 0x10622000 0 0x1000>,   /* NEMI_MI32_SMI */
  4462				      <0 0x10623000 0 0x1000>,   /* SEMI_MI33_SMI */
  4463				      <0 0x10624000 0 0x1000>,   /* NEMI_MI33_SMI */
  4464				      <0 0x10644000 0 0x1000>,   /* INFRA_AO_DEBUG_CTRL */
  4465				      <0 0x10645000 0 0x1000>,   /* EMI_INFRA_AO_BCRM */
  4466				      <0 0x10646000 0 0x1000>,   /* EMI_INFRA_AO_MEM */
  4467				      <0 0x10648000 0 0x1000>,   /* EMI_INFRA_CFG */
  4468				      <0 0x1c004000 0 0x10000>;  /* SLEEP */
  4469				reg-names = "mfg_top_config",
  4470					    "mfg_smmu",
  4471					    "mfg_vgpu_bus_trk",
  4472					    "mfg_gpueb_bus_trk",
  4473					    "mfg_rpc",
  4474					    "mfg_pll",
  4475					    "mfg_pll_sc0",
  4476					    "mfg_pll_sc1",
  4477					    "mfg_hbvc",
  4478					    "mfg_vcore_ao_cfg",
  4479					    "mfg_vcore_devapc",
  4480					    "mfg_vcore_bus_trk",
  4481					    "mcusys_par_wrap",
  4482					    "cksys",
  4483					    "nth_emicfg_ao_mem",
  4484					    "nth_emi_ao_debug_ctrl",
  4485					    "nth_emicfg",
  4486					    "emi",
  4487					    "sth_emicfg_ao_mem",
  4488					    "sth_emi_ao_debug_ctrl",
  4489					    "sth_emicfg",
  4490					    "sub_emi",
  4491					    "semi_mi32_smi",
  4492					    "nemi_mi32_smi",
  4493					    "semi_mi33_smi",
  4494					    "nemi_mi33_smi",
  4495					    "infra_ao_debug_ctrl",
  4496					    "emi_infra_ao_bcrm",
  4497					    "emi_infra_ao_mem",
  4498					    "emi_infra_cfg",
  4499					    "sleep";
  4500				gpufreq-wrapper-supply = <&gpufreq_wrapper>;
  4501			};
  4502	
  4503			gpupdma: gpupdma@48540000 {
  4504				compatible = "mediatek,gpupdma";
  4505				reg = <0 0x48540000 0 0x2000>,
  4506				      <0 0x4b800704 0 0x4>,
  4507				      <0 0x13f840 0 0x28>;
  4508				ringbuf-page-order = <3>;
  4509				config-mode = <1>;
  4510				hw-semaphore-bit = <1>;
  4511			};
  4512	
  4513			gpu_smmu: iommu@48600000 {
  4514				#iommu-cells = <1>;
  4515				compatible = "mediatek,mt8196-gpu-smmu", "arm,smmu-v3";
  4516				reg = <0 0x48600000 0 0x1e0000>;
  4517				interrupts = <GIC_SPI 616 IRQ_TYPE_LEVEL_HIGH 0>;
  4518				interrupt-names = "combined";
  4519				status = "disabled";
  4520			};
  4521	
  4522			gpueb: gpueb@4b000000 {
  4523				compatible = "mediatek,gpueb";
  4524				reg = <0 0x4b000000 0 0xa0000>,
  4525				      <0 0x4b09fd00 0 0x80>,
  4526				      <0 0x4b140100 0 0x200>,
  4527				      <0 0x4b120000 0 0x100>,
  4528				      <0 0x4b09fd80 0 0x280>,
  4529				      <0 0x4b170008 0 0x4>,  /* arbitrary addr to avoid error msg */
  4530				      <0 0x4b170004 0 0x4>,
  4531				      <0 0x4b170074 0 0x4>,
  4532				      <0 0x4b170000 0 0x4>,
  4533				      <0 0x4b170078 0 0x4>,
  4534				      <0 0x4b800504 0 0x4>;
  4535				reg-names = "gpueb_base",
  4536				            "gpueb_gpr_base",
  4537				            "gpueb_cfgreg_base",
  4538				            "gpueb_intc_base",
  4539				            "mbox0_base",
  4540				            "mbox0_init", /* dummy input for mtk_mbox_probe */
  4541				            "mbox0_set",
  4542				            "mbox0_clr",
  4543				            "mbox0_send",
  4544				            "mbox0_recv",
  4545				            "mfg0_pwr_con";
  4546				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>;
  4547				interrupt-names = "mbox0";
  4548	
  4549				gpueb-support;
  4550				ghpm-support;
  4551				mbox-count = <1>;
  4552				mbox-size = <160>; /* 160 slot * 4 = 640 byte */
  4553				slot-size = <4>;   /* 1 slot = 4 bytes */
  4554				ts-mbox = <0>; /* mbox for timersync */
  4555	
  4556				/* id, mbox, send_size */
  4557				send-table = <0 0 4>,
  4558					     <1 0 8>,
  4559					     <2 0 3>,
  4560					     <3 0 6>,
  4561					     <4 0 9>,
  4562					     <5 0 4>,
  4563					     <6 0 6>,
  4564					     <7 0 6>,
  4565					     <8 0 1>,
  4566					     <9 0 4>,
  4567					     <10 0 4>,
  4568					     <11 0 1>;
  4569				send-name-table = "IPI_ID_FAST_DVFS_EVENT",
  4570						  "IPI_ID_GPUFREQ",
  4571						  "IPI_ID_SLEEP",
  4572						  "IPI_ID_TIMER",
  4573						  "IPI_ID_FHCTL",
  4574						  "IPI_ID_CCF",
  4575						  "IPI_ID_GPUMPU",
  4576						  "IPI_ID_FAST_DVFS",
  4577						  "CH_IPIR_C_MET", /* = IPIS_C_MET on gpueb side */
  4578						  "CH_IPIS_C_MET", /* = IPIR_C_MET on gpueb side */
  4579						  "IPI_ID_BRISKET",
  4580						  "IPI_ID_PPB";
  4581	
  4582				/* id, mbox, recv_size, recv_opt, cb_ctx_opt */
  4583				recv-table = <0 0 4 0 0>,
  4584					     <1 0 8 1 1>,
  4585					     <2 0 1 0 1>,
  4586					     <3 0 1 0 1>,
  4587					     <4 0 1 1 1>,
  4588					     <5 0 4 1 1>,
  4589					     <6 0 1 1 1>,
  4590					     <7 0 6 1 1>,
  4591					     <8 0 4 0 1>,
  4592					     <9 0 1 1 1>,
  4593					     <10 0 4 1 1>,
  4594					     <11 0 1 1 1>;
  4595				recv-name-table = "IPI_ID_FAST_DVFS_EVENT",
  4596						  "IPI_ID_GPUFREQ",
  4597						  "IPI_ID_SLEEP",
  4598						  "IPI_ID_TIMER",
  4599						  "IPI_ID_FHCTL",
  4600						  "IPI_ID_CCF",
  4601						  "IPI_ID_GPUMPU",
  4602						  "IPI_ID_FAST_DVFS",
  4603						  "CH_IPIR_C_MET", /* = IPIS_C_MET on gpueb side */
  4604						  "CH_IPIS_C_MET", /* = IPIR_C_MET on gpueb side */
  4605						  "IPI_ID_BRISKET",
  4606						  "IPI_ID_PPB";
  4607	
  4608				gpueb-mem-table = <0 0x4000>,   /* 16KB */
  4609						  <1 0x180000>; /* 1.5MB */
  4610	
  4611				gpueb-mem-name-table = "MEM_ID_GPUFREQ", /* GPUFREQ */
  4612						       "MEM_ID_LOG";     /* LOGGER */
  4613			};
  4614	
  4615			mfgpll_pll_ctrl_clk: syscon@4b810000 {
  4616				/* TODO: Fix compatible in driver */
  4617				compatible = "mediatek,mt8196-mfgpll-pll-ctrl", "mediatek,mt8196-mfgpll_pll_ctrl", "syscon";
  4618				reg = <0 0x4b810000 0 0x400>;
  4619				#clock-cells = <1>;
  4620			};
  4621	
  4622			mfgpll_sc0_pll_ctrl_clk: syscon@4b810400 {
  4623				/* TODO: Fix compatible in driver */
  4624				compatible = "mediatek,mt8196-mfgpll-sc0-pll-ctrl", "mediatek,mt8196-mfgpll_sc0_pll_ctrl", "syscon";
  4625				reg = <0 0x4b810400 0 0x400>;
  4626				#clock-cells = <1>;
  4627			};
  4628	
  4629			ghpm: ghpm@4b800000 {
  4630				compatible = "mediatek,ghpm";
  4631				reg =
  4632					<0 0x4b800000 0 0x1000>,
  4633					<0 0x4b860000 0 0x1000>,
  4634					<0 0x4b860128 0 0x4>,
  4635					<0 0x1c004ea8 0 0x4>,
  4636					<0 0x1c000070 0 0x4>,
  4637					<0 0x1c000074 0 0x4>,
  4638					<0 0x1c000078 0 0x4>;
  4639				reg-names =
  4640					"mfg_rpc",
  4641					"mfg_vcore_ao_config",
  4642					"mfg_mt8196_e2_id_con",
  4643					"spm_mfg0_pwr_con",
  4644					"clk_cfg_6",
  4645					"clk_cfg_6_set",
  4646					"clk_cfg_6_clr";
  4647	
  4648				gpueb-supply = <&gpueb>;
  4649			};
  4650	
  4651			mfgpll_sc1_pll_ctrl_clk: syscon@4b810800 {
  4652				/* TODO: Fix compatible in driver */
  4653				compatible = "mediatek,mt8196-mfgpll-sc1-pll-ctrl", "mediatek,mt8196-mfgpll_sc1_pll_ctrl", "syscon";
  4654				reg = <0 0x4b810800 0 0x1000>;
  4655				#clock-cells = <1>;
  4656			};
  4657	
  4658			devapc_gpu: devapc@4b890000 {
  4659				compatible = "mediatek,mt8196-devapc";
  4660				reg = <0 0x4b890000 0 0x1000>;
  4661				vio-idx-num = <20>;
  4662				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
  4663			};
  4664	
  4665			devapc_gpu1: devapc@4b8b0000 {
  4666				compatible = "mediatek,mt8196-devapc";
  4667				reg = <0 0x4b8b0000 0 0x1000>;
  4668				vio-idx-num = <26>;
  4669				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
  4670			};
  4671	
  4672			apu_smmu: iommu@4c000000 {
  4673				compatible = "mediatek,mt8196-apu-smmu", "arm,smmu-v3";
  4674				reg = <0 0x4c000000 0 0x1e0000>;
  4675				interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING 0>;
  4676				interrupt-names = "combined";
  4677				#iommu-cells = <1>;
  4678				smmu-mediatek-parents = <&apu_top_3>;
  4679			};
  4680	
  4681			apu_mailbox: mailbox@4c200000 {
  4682				compatible = "mediatek,mt8196-apu-mailbox";
  4683				reg = <0 0x4c200000 0 0xfffff>;
  4684				interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
  4685				#mbox-cells = <1>;
  4686			};
  4687	
  4688			apusys-apummu {
  4689				compatible = "mediatek,rv-apummu-mt8196";
  4690				#address-cells = <2>;
  4691				#size-cells = <2>;
  4692				apu-rv-dev = <&apusys_rv>;
  4693				iommus = <&apu_smmu 0xd>;
  4694			};
  4695	
  4696			jpeg-decoder {
  4697				compatible = "mediatek,mt8196-jpgdec";
  4698				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  4699				iommus = <&mm_smmu 164>;
  4700				#address-cells = <2>;
  4701				#size-cells = <2>;
  4702				ranges;
  4703	
  4704				jpgdec0: jpeg-decoder@38040000 {
  4705					compatible = "mediatek,mt8196-jpgdec-hw";
  4706					reg = <0 0x38040000 0 0x10000>;
  4707					interrupts = <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
  4708					clocks = <&venc_gcon_clk CLK_VEN1_CKE3_JPGDEC_JPGDEC>;
  4709					clock-names = "jpgdec";
  4710					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  4711				};
  4712	
  4713				jpgdec1: jpeg-decoder@38840000 {
  4714					compatible = "mediatek,mt8196-jpgdec-hw";
  4715					reg = <0 0x38840000 0 0x10000>;
  4716					interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>;
  4717					clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE3_JPGDEC_JPGDEC>;
  4718					clock-names = "jpgdec";
  4719					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4720				};
  4721			};
  4722	
  4723			jpeg-encoder {
  4724				compatible = "mediatek,mt8196-jpgenc";
  4725				power-domains = <&hfrpsys  MT8196_POWER_DOMAIN_VEN0>;
  4726				iommus = <&mm_smmu 165>;
  4727				#address-cells = <2>;
  4728				#size-cells = <2>;
  4729				ranges;
  4730	
  4731				jpgenc0: jpeg-encoder@38030000 {
  4732					compatible = "mediatek,mt8196-jpgenc-hw";
  4733					reg = <0 0x38030000 0 0x10000>;
  4734					interrupts = <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH 0>;
  4735					clocks = <&venc_gcon_clk CLK_VEN1_CKE2_JPGENC_JPGENC>;
  4736					clock-names = "jpgenc";
  4737					power-domains = <&hfrpsys  MT8196_POWER_DOMAIN_VEN0>;
  4738				};
  4739	
  4740				jpgenc1: jpeg-encoder@38830000 {
  4741					compatible = "mediatek,mt8196-jpgenc-hw";
  4742					reg = <0 0x38830000 0 0x10000>;
  4743					interrupts = <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>;
  4744					clocks = <&venc_gcon_clk CLK_VEN1_CKE2_JPGENC>,
  4745						<&venc_gcon_core1_clk  CLK_VEN2_CKE2_JPGENC_JPGENC>;
  4746					clock-names = "jpgenc", "jpgenc_c1";
  4747					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4748				};
  4749			};
  4750	
  4751			mtk_apu_mem_code: mtk-apu-mem-code {
  4752				compatible = "mediatek, apu_mem_code";
  4753				#address-cells = <2>;
  4754				#size-cells = <2>;
  4755				type = <1>;
  4756				mask = /bits/ 64 <0x00000003ffffffff>;
  4757				iommus = <&apu_smmu 0xb>;
  4758			};
  4759	
  4760			mtk_apu_mem_data: mtk-apu-mem-data {
  4761				compatible = "mediatek, apu_mem_data";
  4762				#address-cells = <2>;
  4763				#size-cells = <2>;
  4764				type = <2>;
  4765				mask = /bits/ 64 <0x00000003ffffffff>;
  4766				iommus = <&apu_smmu 0xa>;
  4767			};
  4768	
  4769			mvpu {
  4770				compatible = "mediatek, mt8196-mvpu";
  4771				core-num = <2>;
  4772				mask = /bits/ 64 <0x00000003ffffffff>;
  4773				iommus = <&apu_smmu 0xf>;
  4774			};
  4775	
  4776			sound: sound {
  4777				compatible = "mediatek,mt8196-mt6681-sound";
  4778				mediatek,platform = <&afe>;
  4779				/* audio-routing is added here as a placeholder to complete the
  4780				   probe flow.It should be removed when upstreaming */
  4781				audio-routing = "Headphone Jack", "HPOL",
  4782						"Headphone Jack", "HPOR";
  4783				status = "disabled";
  4784			};
  4785	
  4786			vdisp-ctrl {
  4787				compatible = "mediatek,mt8196-vdisp-ctrl";
  4788				mediatek,hw-ccf = <&mm_hwv>;
  4789				mediatek,vcp = <&vcp>;
  4790	
  4791				vdisp: vdisp {
  4792					regulator-name = "vdisp";
  4793				};
  4794			};
  4795	
> 4796			vmm: vmm {
  4797				compatible = "mediatek,mt8196-vmm";
  4798				mediatek,hw-ccf = <&mm_hwv>;
  4799				mediatek,vcp = <&vcp>;
  4800	
  4801				vdec_vcore: vdec-vcore {
  4802					regulator-name = "vdec-vcore";
  4803				};
  4804			};
  4805	
  4806			thermal_zones: thermal-zones {
  4807				soc_max: soc_max {
  4808					polling-delay = <0>; /* milliseconds */
  4809					polling-delay-passive = <0>; /* milliseconds */
  4810					thermal-sensors = <&lvts 0>;
  4811	
  4812					trips {
  4813						soc_max_crit: so-max-crit {
  4814							temperature = <118800>;
  4815							hysteresis = <2000>;
  4816							type = "critical";
  4817						};
  4818					};
  4819				};
  4820	
  4821				cpu-6-0-thermal {
  4822					polling-delay = <0>; /* milliseconds */
  4823					polling-delay-passive = <0>; /* milliseconds */
  4824					thermal-sensors = <&lvts 1>;
  4825					trips {
  4826						cpu_medium_core6_0_crit: cpu-medium-core6-0-crit {
  4827							temperature = <118800>;
  4828							hysteresis = <2000>;
  4829							type = "critical";
  4830						};
  4831					};
  4832				};
  4833	
  4834				cpu-6-1-thermal {
  4835					polling-delay = <0>; /* milliseconds */
  4836					polling-delay-passive = <0>; /* milliseconds */
  4837					thermal-sensors = <&lvts 2>;
  4838					trips {
  4839						cpu_medium_core6_1_crit: cpu-medium-core6-1-crit {
  4840							temperature = <118800>;
  4841							hysteresis = <2000>;
  4842							type = "critical";
  4843						};
  4844					};
  4845				};
  4846	
  4847				cpu-dsu2-thermal {
  4848					polling-delay = <0>; /* milliseconds */
  4849					polling-delay-passive = <0>; /* milliseconds */
  4850					thermal-sensors = <&lvts 3>;
  4851					trips {
  4852						cpu_dsu2_crit: cpu-dsu2-crit {
  4853							temperature = <118800>;
  4854							hysteresis = <2000>;
  4855							type = "critical";
  4856						};
  4857					};
  4858				};
  4859	
  4860				cpu-dsu3-thermal {
  4861					polling-delay = <0>; /* milliseconds */
  4862					polling-delay-passive = <0>; /* milliseconds */
  4863					thermal-sensors = <&lvts 4>;
  4864					trips {
  4865						cpu_dsu3_crit: cpu-dsu3-crit {
  4866							temperature = <118800>;
  4867							hysteresis = <2000>;
  4868							type = "critical";
  4869						};
  4870					};
  4871				};
  4872	
  4873				cpu-3-thermal {
  4874					polling-delay = <0>; /* milliseconds */
  4875					polling-delay-passive = <0>; /* milliseconds */
  4876					thermal-sensors = <&lvts 5>;
  4877					trips {
  4878						cpu_little_core3_crit: cpu-little-core3-crit {
  4879							temperature = <118800>;
  4880							hysteresis = <2000>;
  4881							type = "critical";
  4882						};
  4883					};
  4884				};
  4885	
  4886				cpu-0-thermal {
  4887					polling-delay = <0>; /* milliseconds */
  4888					polling-delay-passive = <0>; /* milliseconds */
  4889					thermal-sensors = <&lvts 6>;
  4890					trips {
  4891						cpu_little_core0_crit: cpu-little-core0-crit {
  4892							temperature = <118800>;
  4893							hysteresis = <2000>;
  4894							type = "critical";
  4895						};
  4896					};
  4897				};
  4898	
  4899				cpu-1-thermal {
  4900					polling-delay = <0>; /* milliseconds */
  4901					polling-delay-passive = <0>; /* milliseconds */
  4902					thermal-sensors = <&lvts 7>;
  4903					trips {
  4904						cpu_little_core1_crit: cpu-little-core1-crit {
  4905							temperature = <118800>;
  4906							hysteresis = <2000>;
  4907							type = "critical";
  4908						};
  4909					};
  4910				};
  4911	
  4912				cpu-2-thermal {
  4913					polling-delay = <0>; /* milliseconds */
  4914					polling-delay-passive = <0>; /* milliseconds */
  4915					thermal-sensors = <&lvts 8>;
  4916					trips {
  4917						cpu_little_core2_crit: cpu-little-core2-crit {
  4918							temperature = <118800>;
  4919							hysteresis = <2000>;
  4920							type = "critical";
  4921						};
  4922					};
  4923				};
  4924	
  4925				cpu-4-0-thermal {
  4926					polling-delay = <0>; /* milliseconds */
  4927					polling-delay-passive = <0>; /* milliseconds */
  4928					thermal-sensors = <&lvts 9>;
  4929					trips {
  4930						cpu_medium_core4_0_crit: cpu-medium-core4-0-crit {
  4931							temperature = <118800>;
  4932							hysteresis = <2000>;
  4933							type = "critical";
  4934						};
  4935					};
  4936				};
  4937	
  4938				cpu-4-1-thermal {
  4939					polling-delay = <0>; /* milliseconds */
  4940					polling-delay-passive = <0>; /* milliseconds */
  4941					thermal-sensors = <&lvts 10>;
  4942					trips {
  4943						cpu_medium_core4_1_crit: cpu-medium-core4-1-crit {
  4944							temperature = <118800>;
  4945							hysteresis = <2000>;
  4946							type = "critical";
  4947						};
  4948					};
  4949				};
  4950	
  4951				cpu-5-0-thermal {
  4952					polling-delay = <0>; /* milliseconds */
  4953					polling-delay-passive = <0>; /* milliseconds */
  4954					thermal-sensors = <&lvts 11>;
  4955					trips {
  4956						cpu_medium_core5_0_crit: cpu-medium-core5-0-crit {
  4957							temperature = <118800>;
  4958							hysteresis = <2000>;
  4959							type = "critical";
  4960						};
  4961					};
  4962				};
  4963	
  4964				cpu-5-1-thermal {
  4965					polling-delay = <0>; /* milliseconds */
  4966					polling-delay-passive = <0>; /* milliseconds */
  4967					thermal-sensors = <&lvts 12>;
  4968					trips {
  4969						cpu_medium_core5_1_crit: cpu-medium-core5-1-crit {
  4970							temperature = <118800>;
  4971							hysteresis = <2000>;
  4972							type = "critical";
  4973						};
  4974					};
  4975				};
  4976	
  4977				cpu-dsu0-thermal {
  4978					polling-delay = <0>; /* milliseconds */
  4979					polling-delay-passive = <0>; /* milliseconds */
  4980					thermal-sensors = <&lvts 13>;
  4981					trips {
  4982						cpu_dsu0_crit: cpu-dsu0-crit {
  4983							temperature = <118800>;
  4984							hysteresis = <2000>;
  4985							type = "critical";
  4986						};
  4987					};
  4988				};
  4989	
  4990				cpu-dsu1-thermal {
  4991					polling-delay = <0>; /* milliseconds */
  4992					polling-delay-passive = <0>; /* milliseconds */
  4993					thermal-sensors = <&lvts 14>;
  4994					trips {
  4995						cpu_dsu1_crit: cpu-dsu1-crit {
  4996							temperature = <118800>;
  4997							hysteresis = <2000>;
  4998							type = "critical";
  4999						};
  5000					};
  5001				};
  5002	
  5003				cpu-7-0-thermal {
  5004					polling-delay = <0>; /* milliseconds */
  5005					polling-delay-passive = <0>; /* milliseconds */
  5006					thermal-sensors = <&lvts 15>;
  5007					trips {
  5008						cpu_big_core7_0_crit: cpu-big-core7-0-crit {
  5009							temperature = <118800>;
  5010							hysteresis = <2000>;
  5011							type = "critical";
  5012						};
  5013					};
  5014				};
  5015	
  5016				cpu-7-1-thermal {
  5017					polling-delay = <0>; /* milliseconds */
  5018					polling-delay-passive = <0>; /* milliseconds */
  5019					thermal-sensors = <&lvts 16>;
  5020					trips {
  5021						cpu_big_core7_1_crit: cpu-big-core7-1-crit {
  5022							temperature = <118800>;
  5023							hysteresis = <2000>;
  5024							type = "critical";
  5025						};
  5026					};
  5027				};
  5028	
  5029				apu-a0-thermal {
  5030					polling-delay = <0>; /* milliseconds */
  5031					polling-delay-passive = <0>; /* milliseconds */
  5032					thermal-sensors = <&lvts 17>;
  5033					trips {
  5034						apu_a0_crit: apu-a0-crit {
  5035							temperature = <118800>;
  5036							hysteresis = <2000>;
  5037							type = "critical";
  5038						};
  5039					};
  5040				};
  5041	
  5042				apu-a1-thermal {
  5043					polling-delay = <0>; /* milliseconds */
  5044					polling-delay-passive = <0>; /* milliseconds */
  5045					thermal-sensors = <&lvts 18>;
  5046					trips {
  5047						apu_a1_crit: apu-a1-crit {
  5048							temperature = <118800>;
  5049							hysteresis = <2000>;
  5050							type = "critical";
  5051						};
  5052					};
  5053				};
  5054	
  5055				apu-a2-thermal {
  5056					polling-delay = <0>; /* milliseconds */
  5057					polling-delay-passive = <0>; /* milliseconds */
  5058					thermal-sensors = <&lvts 19>;
  5059					trips {
  5060						apu_a2_crit: apu-a2-crit {
  5061							temperature = <118800>;
  5062							hysteresis = <2000>;
  5063							type = "critical";
  5064						};
  5065					};
  5066				};
  5067	
  5068				apu-a3-thermal {
  5069					polling-delay = <0>; /* milliseconds */
  5070					polling-delay-passive = <0>; /* milliseconds */
  5071					thermal-sensors = <&lvts 20>;
  5072					trips {
  5073						apu_a3_crit: apu-a3-crit {
  5074							temperature = <118800>;
  5075							hysteresis = <2000>;
  5076							type = "critical";
  5077						};
  5078					};
  5079				};
  5080	
  5081				gpu0-thermal {
  5082					polling-delay = <0>; /* milliseconds */
  5083					polling-delay-passive = <0>; /* milliseconds */
  5084					thermal-sensors = <&lvts 21>;
  5085					trips {
  5086						gpu0_crit: gpu0-crit {
  5087							temperature = <118800>;
  5088							hysteresis = <2000>;
  5089							type = "critical";
  5090						};
  5091					};
  5092				};
  5093	
  5094				gpu1-thermal {
  5095					polling-delay = <0>; /* milliseconds */
  5096					polling-delay-passive = <0>; /* milliseconds */
  5097					thermal-sensors = <&lvts 22>;
  5098					trips {
  5099						gpu1_crit: gpu1-crit {
  5100							temperature = <118800>;
  5101							hysteresis = <2000>;
  5102							type = "critical";
  5103						};
  5104					};
  5105				};
  5106	
  5107				soc-top0-thermal {
  5108					polling-delay = <0>; /* milliseconds */
  5109					polling-delay-passive = <0>; /* milliseconds */
  5110					thermal-sensors = <&lvts 23>;
  5111					trips {
  5112						soc_top0_crit: soc-top0-crit {
  5113							temperature = <118800>;
  5114							hysteresis = <2000>;
  5115							type = "critical";
  5116						};
  5117					};
  5118				};
  5119	
  5120				soc-top1-thermal {
  5121					polling-delay = <0>; /* milliseconds */
  5122					polling-delay-passive = <0>; /* milliseconds */
  5123					thermal-sensors = <&lvts 24>;
  5124					trips {
  5125						soc_top1_crit: soc-top1-crit {
  5126							temperature = <118800>;
  5127							hysteresis = <2000>;
  5128							type = "critical";
  5129						};
  5130					};
  5131				};
  5132	
  5133				soc-top2-thermal {
  5134					polling-delay = <0>; /* milliseconds */
  5135					polling-delay-passive = <0>; /* milliseconds */
  5136					thermal-sensors = <&lvts 25>;
  5137					trips {
  5138						soc_top2_crit: soc-top2-crit {
  5139							temperature = <118800>;
  5140							hysteresis = <2000>;
  5141							type = "critical";
  5142						};
  5143					};
  5144				};
  5145	
  5146				soc-top3-thermal {
  5147					polling-delay = <0>; /* milliseconds */
  5148					polling-delay-passive = <0>; /* milliseconds */
  5149					thermal-sensors = <&lvts 26>;
  5150					trips {
  5151						soc_top3_crit: soc-top3-crit {
  5152							temperature = <118800>;
  5153							hysteresis = <2000>;
  5154							type = "critical";
  5155						};
  5156					};
  5157				};
  5158	
  5159				soc-bot0-thermal {
  5160					polling-delay = <0>; /* milliseconds */
  5161					polling-delay-passive = <0>; /* milliseconds */
  5162					thermal-sensors = <&lvts 27>;
  5163					trips {
  5164						soc_bot0_crit: soc-bot0-crit {
  5165							temperature = <118800>;
  5166							hysteresis = <2000>;
  5167							type = "critical";
  5168						};
  5169					};
  5170				};
  5171	
  5172				soc-bot1-thermal {
  5173					polling-delay = <0>; /* milliseconds */
  5174					polling-delay-passive = <0>; /* milliseconds */
  5175					thermal-sensors = <&lvts 28>;
  5176					trips {
  5177						soc_bot1_crit: soc-bot1-crit {
  5178							temperature = <118800>;
  5179							hysteresis = <2000>;
  5180							type = "critical";
  5181						};
  5182					};
  5183				};
  5184	
  5185				soc-bot2-thermal {
  5186					polling-delay = <0>; /* milliseconds */
  5187					polling-delay-passive = <0>; /* milliseconds */
  5188					thermal-sensors = <&lvts 29>;
  5189					trips {
  5190						soc_bot2_crit: soc-bot2-crit {
  5191							temperature = <118800>;
  5192							hysteresis = <2000>;
  5193							type = "critical";
  5194						};
  5195					};
  5196				};
  5197	
  5198				soc-bot3-thermal {
  5199					polling-delay = <0>; /* milliseconds */
  5200					polling-delay-passive = <0>; /* milliseconds */
  5201					thermal-sensors = <&lvts 30>;
  5202					trips {
  5203						soc_bot3_crit: soc-bot3-crit {
  5204							temperature = <118800>;
  5205							hysteresis = <2000>;
  5206							type = "critical";
  5207						};
  5208					};
  5209				};
  5210			};
  5211		};
  5212	};
  5213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
