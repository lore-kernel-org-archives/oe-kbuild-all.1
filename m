Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BA4244E84
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 21:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739049973; cv=none; b=HN6Ba9w/Z/2Hw/qs5GK73RzbpMCj9ECYnm2Yl/DUVie/KTlAVN0duqEDL4HKkZz/NmfRfHk0LBVdnFHwfd9WzAEyG/yRLOzav5KtzUpvMzDZXq1m3e9OUkn1/7KxX9c4hrmaEBOr7a8ieOtepwn4QNxDYrso4Rr5CQOx9wT0UA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739049973; c=relaxed/simple;
	bh=L/lbdnu0EpNoS6o+L5qJYNyPQn78Rs/FenGVssjmVXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XABE1Hp3E+qlrbgzLy/fGczYjRcu/Jh8EgHiS3s1u5x+e1llvOQlNv9JfNqig+SanzWyT5OrwdtkoEOX8GRKZPKChcDg4wBaghJPUv8ZbhX5Eeb7YZYZ31lsqnx4K0VFGGuyP3+p1stXTEe1WkYSwGxu2GqSxiGBvaFru38Ib9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+fwsD08; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+fwsD08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739049966; x=1770585966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L/lbdnu0EpNoS6o+L5qJYNyPQn78Rs/FenGVssjmVXc=;
  b=R+fwsD08D6ieDTkfCtNZfRdaakXZ3VOrKymV0pUh1WKLf1fPgWZEm3LY
   l0kkvlA0mLCd/3alClkMaR6VY34+f8RiO+JLLZxOmQfZ17xQ/qfMeYLaW
   pFbjx2Gb2aPTaWae1tFcYfI0y+F2Cj/PUrIs0BroCvQ9gSnise2YRKKrW
   RkQ9A7ChZPAstrugPBVFpxAqcYYzmkTnjx5W2zkkU2gnanZvgEi+0IHDk
   wUomGcGna0kjcqiuSbS9d67Dg0Iid6HYX97HvO7UUpUC/7+hRpUySS3pa
   AxdWwoZjU4F3JKLvepkTBp9wf8azzAYuIbv1KFx2VZw82mHYALT/YPb8F
   Q==;
X-CSE-ConnectionGUID: Dam72Q4fSqOSdYHLEJQvhA==
X-CSE-MsgGUID: YmJc7NiKRdOBhhrKEXhoHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39359689"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="39359689"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 13:26:06 -0800
X-CSE-ConnectionGUID: 50tQsJlJR1e44IKgwA2ZMQ==
X-CSE-MsgGUID: yYdVEOHbSwCDn81v8waj5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="116878527"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Feb 2025 13:26:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgsKv-0010eN-2w;
	Sat, 08 Feb 2025 21:26:01 +0000
Date: Sun, 9 Feb 2025 05:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 211/211]
 arch/arm64/boot/dts/mediatek/mt8196.dtsi:1263.25-1293.5: Warning
 (unique_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate
 unit-address (also used in node /soc/nkp@1046f000)
Message-ID: <202502090505.Wo06qEUh-lkp@intel.com>
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
commit: 3a41185f82d985856c99ad9c706c1434214d62b2 [211/211] CHROMIUM: arm64: dts: mt8196: add nsmpu, ssmpu, nkp, skp node
config: arm64-randconfig-003-20250207 (https://download.01.org/0day-ci/archive/20250209/202502090505.Wo06qEUh-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090505.Wo06qEUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090505.Wo06qEUh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2962.10-2966.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2968.14-2972.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:45.27-52.4: Warning (unit_address_vs_reg): /regulator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2673.35-2679.5: Warning (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format error, expected "1a350100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2681.35-2687.5: Warning (simple_bus_reg): /soc/mailbox@1a360000: simple-bus unit address format error, expected "1a360100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4490.16-4515.5: Warning (simple_bus_reg): /soc/jpeg-decoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4517.16-4543.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4545.16-4553.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4555.32-4959.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1138.37-1163.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:1263.25-1293.5: Warning (unique_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate unit-address (also used in node /soc/nkp@1046f000)
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:1295.24-1322.5: Warning (unique_unit_address_if_enabled): /soc/ssmpu@1056f000: duplicate unit-address (also used in node /soc/skp@1056f000)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:58.8-68.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:74.8-84.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +1263 arch/arm64/boot/dts/mediatek/mt8196.dtsi

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
   600			gpueb_resv_mem: gpueb-reserved-memory@a0000000 {
   601				compatible = "mediatek,gpueb-resv-mem";
   602				reg = <0 0xa0000000 0 0x200000>; /* 2 MB */
   603				no-map;
   604			};
   605	
   606			vcp_resv_mem: vcp-reserved-memory@a0200000 {
   607				compatible = "mediatek,me-vcp-reserved";
   608				reg = <0 0xa0200000 0 0x01e00000>; /* 30MB */
   609				iommu-addresses = <0 0x00000000 1 0x40000000>; /* 1G */
   610				no-map;
   611			};
   612	
   613			mali_protected: mali-protected@a2000000 { /* 16MB */
   614				compatible = "mali-reserved";
   615				reg = <0x0 0xa2000000 0x0 0x1000000>;
   616				no-map;
   617			};
   618	
   619			restricted_region: secure-region@a3000000 {
   620				compatible = "mediatek,dynamic-restricted-region";
   621				reg = <0 0xa3000000 0 0x1bc00000>; /* 444MB */
   622				no-map;
   623			};
   624		};
   625	
   626		timer: timer {
   627			compatible = "arm,armv8-timer";
   628			interrupt-parent = <&gic>;
   629			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
   630					<GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
   631					<GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
   632					<GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
   633			clock-frequency = <13000000>;
   634		};
   635	
   636		psci {
   637			compatible = "arm,psci-1.0";
   638			method = "smc";
   639		};
   640	
   641		ged: ged {
   642			compatible = "mediatek,ged";
   643			gpufreq-supply = <&gpufreq>;
   644		};
   645	
   646		gpu_dcs: gpu-dcs {
   647			compatible = "mediatek,gpu-dcs";
   648		};
   649	
   650		gpu_dvfs_mode: gpu-loading-mode {
   651			compatible = "mediatek,gpu-loading-mode";
   652			dvfs-loading-mode = <0>;
   653			dvfs-workload-mode = <6>;
   654		};
   655	
   656		gpu_mali_opp: opp-table-gpu {
   657			compatible = "operating-points-v2";
   658	
   659			opp00 {
   660				opp-hz = /bits/ 64 <1612000000>;
   661				opp-microvolt = <795000>;
   662			};
   663	
   664			opp01 {
   665				opp-hz = /bits/ 64 <1586000000>;
   666				opp-microvolt = <790000>;
   667			};
   668	
   669			opp02 {
   670				opp-hz = /bits/ 64 <1560000000>;
   671				opp-microvolt = <785000>;
   672			};
   673	
   674			opp03 {
   675				opp-hz = /bits/ 64 <1534000000>;
   676				opp-microvolt = <780000>;
   677			};
   678	
   679			opp04 {
   680				opp-hz = /bits/ 64 <1508000000>;
   681				opp-microvolt = <770000>;
   682			};
   683	
   684			opp05 {
   685				opp-hz = /bits/ 64 <1482000000>;
   686				opp-microvolt = <765000>;
   687			};
   688	
   689			opp06 {
   690				opp-hz = /bits/ 64 <1456000000>;
   691				opp-microvolt = <760000>;
   692			};
   693	
   694			opp07 {
   695				opp-hz = /bits/ 64 <1430000000>;
   696				opp-microvolt = <750000>;
   697			};
   698	
   699			opp08 {
   700				opp-hz = /bits/ 64 <1404000000>;
   701				opp-microvolt = <745000>;
   702			};
   703	
   704			opp09 {
   705				opp-hz = /bits/ 64 <1378000000>;
   706				opp-microvolt = <740000>;
   707			};
   708	
   709			opp10 {
   710				opp-hz = /bits/ 64 <1352000000>;
   711				opp-microvolt = <735000>;
   712			};
   713	
   714			opp11 {
   715				opp-hz = /bits/ 64 <1326000000>;
   716				opp-microvolt = <730000>;
   717			};
   718	
   719			opp12 {
   720				opp-hz = /bits/ 64 <1300000000>;
   721				opp-microvolt = <720000>;
   722			};
   723	
   724			opp13 {
   725				opp-hz = /bits/ 64 <1274000000>;
   726				opp-microvolt = <715000>;
   727			};
   728	
   729			opp14 {
   730				opp-hz = /bits/ 64 <1248000000>;
   731				opp-microvolt = <710000>;
   732			};
   733	
   734			opp15 {
   735				opp-hz = /bits/ 64 <1222000000>;
   736				opp-microvolt = <705000>;
   737			};
   738	
   739			opp16 {
   740				opp-hz = /bits/ 64 <1196000000>;
   741				opp-microvolt = <695000>;
   742			};
   743	
   744			opp17 {
   745				opp-hz = /bits/ 64 <1170000000>;
   746				opp-microvolt = <690000>;
   747			};
   748	
   749			opp18 {
   750				opp-hz = /bits/ 64 <1144000000>;
   751				opp-microvolt = <685000>;
   752			};
   753	
   754			opp19 {
   755				opp-hz = /bits/ 64 <1118000000>;
   756				opp-microvolt = <680000>;
   757			};
   758	
   759			opp20 {
   760				opp-hz = /bits/ 64 <1092000000>;
   761				opp-microvolt = <670000>;
   762			};
   763	
   764			opp21 {
   765				opp-hz = /bits/ 64 <1066000000>;
   766				opp-microvolt = <665000>;
   767			};
   768	
   769			opp22 {
   770				opp-hz = /bits/ 64 <1040000000>;
   771				opp-microvolt = <660000>;
   772			};
   773	
   774			opp23 {
   775				opp-hz = /bits/ 64 <1014000000>;
   776				opp-microvolt = <655000>;
   777			};
   778	
   779			opp24 {
   780				opp-hz = /bits/ 64 <988000000>;
   781				opp-microvolt = <645000>;
   782			};
   783	
   784			opp25 {
   785				opp-hz = /bits/ 64 <962000000>;
   786				opp-microvolt = <640000>;
   787			};
   788	
   789			opp26 {
   790				opp-hz = /bits/ 64 <936000000>;
   791				opp-microvolt = <635000>;
   792			};
   793	
   794			opp27 {
   795				opp-hz = /bits/ 64 <910000000>;
   796				opp-microvolt = <630000>;
   797			};
   798	
   799			opp28 {
   800				opp-hz = /bits/ 64 <884000000>;
   801				opp-microvolt = <620000>;
   802			};
   803	
   804			opp29 {
   805				opp-hz = /bits/ 64 <858000000>;
   806				opp-microvolt = <615000>;
   807			};
   808	
   809			opp30 {
   810				opp-hz = /bits/ 64 <832000000>;
   811				opp-microvolt = <610000>;
   812			};
   813	
   814			opp31 {
   815				opp-hz = /bits/ 64 <806000000>;
   816				opp-microvolt = <605000>;
   817			};
   818	
   819			opp32 {
   820				opp-hz = /bits/ 64 <780000000>;
   821				opp-microvolt = <600000>;
   822			};
   823	
   824			opp33 {
   825				opp-hz = /bits/ 64 <754000000>;
   826				opp-microvolt = <590000>;
   827			};
   828	
   829			opp34 {
   830				opp-hz = /bits/ 64 <728000000>;
   831				opp-microvolt = <585000>;
   832			};
   833	
   834			opp35 {
   835				opp-hz = /bits/ 64 <702000000>;
   836				opp-microvolt = <580000>;
   837			};
   838	
   839			opp36 {
   840				opp-hz = /bits/ 64 <676000000>;
   841				opp-microvolt = <575000>;
   842			};
   843	
   844			opp37 {
   845				opp-hz = /bits/ 64 <650000000>;
   846				opp-microvolt = <560000>;
   847			};
   848	
   849			opp38 {
   850				opp-hz = /bits/ 64 <624000000>;
   851				opp-microvolt = <560000>;
   852			};
   853	
   854			opp39 {
   855				opp-hz = /bits/ 64 <598000000>;
   856				opp-microvolt = <555000>;
   857			};
   858	
   859			opp40 {
   860				opp-hz = /bits/ 64 <572000000>;
   861				opp-microvolt = <550000>;
   862			};
   863	
   864			opp41 {
   865				opp-hz = /bits/ 64 <546000000>;
   866				opp-microvolt = <540000>;
   867			};
   868	
   869			opp42 {
   870				opp-hz = /bits/ 64 <520000000>;
   871				opp-microvolt = <535000>;
   872			};
   873	
   874			opp43 {
   875				opp-hz = /bits/ 64 <494000000>;
   876				opp-microvolt = <530000>;
   877			};
   878	
   879			opp44 {
   880				opp-hz = /bits/ 64 <468000000>;
   881				opp-microvolt = <525000>;
   882			};
   883	
   884			opp45 {
   885				opp-hz = /bits/ 64 <442000000>;
   886				opp-microvolt = <515000>;
   887			};
   888	
   889			opp46 {
   890				opp-hz = /bits/ 64 <416000000>;
   891				opp-microvolt = <510000>;
   892			};
   893	
   894			opp47 {
   895				opp-hz = /bits/ 64 <390000000>;
   896				opp-microvolt = <505000>;
   897			};
   898	
   899			opp48 {
   900				opp-hz = /bits/ 64 <364000000>;
   901				opp-microvolt = <500000>;
   902			};
   903	
   904			opp49 {
   905				opp-hz = /bits/ 64 <338000000>;
   906				opp-microvolt = <490000>;
   907			};
   908		};
   909	
   910		gpu_protected_memory_allocator: protected-memory-allocator {
   911			compatible = "arm,protected-memory-allocator";
   912			memory-region = <&mali_protected>;
   913		};
   914	
   915		gpufreq_wrapper: gpufreq-wrapper {
   916			compatible = "mediatek,gpufreq-wrapper";
   917			gpufreq-version = <2>;
   918			dual-buck = <1>;
   919			gpueb-support;
   920			ghpm-supply = <&ghpm>;
   921		};
   922	
   923		mgm: mgm {
   924			compatible = "arm,physical-memory-group-manager";
   925		};
   926	
   927		soc {
   928			compatible = "simple-bus";
   929			#address-cells = <2>;
   930			#size-cells = <2>;
   931			ranges;
   932			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
   933	
   934			therm_intf: therm-intf@114000 {
   935				compatible = "mediatek,therm_intf";
   936				reg = <0 0x00114000 0 0x400>,
   937				      <0 0x0c2cd450 0 0x400>;
   938				reg-names = "sram", "cputcm";
   939				mediatek,init-ttj-cpu = <95000>;
   940				mediatek,init-ttj-gpu = <95000>;
   941				mediatek,init-ttj-npu = <95000>;
   942			};
   943	
   944			slbc: slbc@117800 {
   945				compatible = "mediatek,mt8196-slbc";
   946				reg = <0 0x00117800 0 0x400>;
   947			};
   948	
   949			qos: qos@11bb00 {
   950				compatible = "mediatek,mt8196-qos";
   951				reg = <0 0x0011bb00 0 0x100>,
   952				      <0 0x0011b9c0 0 0x140>,
   953				      <0 0x0011b920 0 0xa0>;
   954				reg-names = "sram", "share_sram", "share_sram_ext";
   955				mediatek,enable;
   956				scmi-tinysys-supply = <&scmi_tinysys>;
   957			};
   958	
   959			csram_sys: csram-sysram@11bc00 {
   960				reg = <0 0x11bc00 0 0x1400>; /* 5KB */
   961			};
   962	
   963			gpu_qos: gpu-qos@13f800 {
   964				compatible = "mediatek,gpu-qos";
   965				reg = <0 0x13f800 0 0x20>;
   966				qos-mode = <0>;
   967				qos-sysram-support;
   968				qos-value = <0>;
   969			};
   970	
   971			cpu_mcucfg: mcusys-ao-cfg@c000000 {
   972				reg = <0 0xc000000 0 0x10000>; /* 64KB */
   973			};
   974	
   975			cpu_pll: mcusys-pll1u-top@c030000 {
   976				reg = <0 0xc030000 0 0x1000>; /* 4KB */
   977			};
   978	
   979			cm_mgr: cm-mgr@c100000 {
   980				compatible = "mediatek,mt8196-cm-mgr";
   981				reg = <0 0xc100000 0 0x9000>;
   982				reg-names = "cm_mgr_base";
   983				interconnects = <&dvfsrc MT6873_MASTER_MCU_1 &dvfsrc MT6873_SLAVE_DDR_EMI>;
   984				interconnect-names = "cm-perf-bw";
   985				cpuhvfs = <&cpuhvfs>;
   986				required-opps = <&dvfsrc_freq_opp0>,
   987						<&dvfsrc_freq_opp1>,
   988						<&dvfsrc_freq_opp2>,
   989						<&dvfsrc_freq_opp3>,
   990						<&dvfsrc_freq_opp4>,
   991						<&dvfsrc_freq_opp5>,
   992						<&dvfsrc_freq_opp6>,
   993						<&dvfsrc_freq_opp7>,
   994						<&dvfsrc_freq_opp8>,
   995						<&dvfsrc_freq_opp9>;
   996				mediatek,cm-mgr-enable;
   997				mediatek,cm-mgr-arch = "v1p";
   998	
   999				mediatek,cm-mgr-num-array = <7>;
  1000				mediatek,cm-mgr,cp-down  = <100 100 100 100 100 100 100>;
  1001				mediatek,cm-mgr,cp-up = <100 100 100 100 100 100 100>;
  1002				mediatek,cm-mgr,dt-down = <0 0 0 0 0 0 0>;
  1003				mediatek,cm-mgr,dt-up = <0 0 0 0 0 0 0>;
  1004				mediatek,cm-mgr,vp-down = <100 100 100 100 100 100 100>;
  1005				mediatek,cm-mgr,vp-up = <100 100 100 100 100 100 100>;
  1006	
  1007				mediatek,cm-mgr-cpu-opp-to-dram = <3 3 9 9 9 9 9 9
  1008							9 9 9 9 9 9 9 9
  1009							9 9 9 9 9 9 9 9
  1010							9 9 9 9 9 9 9 9>;
  1011				mediatek,cm-perf-mode-enable;
  1012				mediatek,cm-perf-mode-ceiling-opp = <0>;
  1013				mediatek,cm-perf-mode-thd = <5>;
  1014			};
  1015	
  1016			ccipll_pll_ctrl_clk: syscon@c1e0000 {
  1017				/* TODO: Fix compatible in driver */
  1018				compatible = "mediatek,mt8196-ccipll-pll-ctrl", "mediatek,mt8196-ccipll_pll_ctrl", "syscon";
  1019				reg = <0 0xc1e0000 0 0x400>;
  1020				#clock-cells = <1>;
  1021			};
  1022	
  1023			armpll_ll_pll_ctrl_clk: syscon@c1e0400 {
  1024				/* TODO: Fix compatible in driver */
  1025				compatible = "mediatek,mt8196-armpll-ll-pll-ctrl", "mediatek,mt8196-armpll_ll_pll_ctrl", "syscon";
  1026				reg = <0 0xc1e0400 0 0x400>;
  1027				#clock-cells = <1>;
  1028			};
  1029	
  1030			armpll_bl_pll_ctrl_clk: syscon@c1e0800 {
  1031				/* TODO: Fix compatible in driver */
  1032				compatible = "mediatek,mt8196-armpll-bl-pll-ctrl", "mediatek,mt8196-armpll_bl_pll_ctrl", "syscon";
  1033				reg = <0 0xc1e0800 0 0x400>;
  1034				#clock-cells = <1>;
  1035			};
  1036	
  1037			armpll_b_pll_ctrl_clk: syscon@c1e0c00 {
  1038				/* TODO: Fix compatible in driver */
  1039				compatible = "mediatek,mt8196-armpll-b-pll-ctrl", "mediatek,mt8196-armpll_b_pll_ctrl", "syscon";
  1040				reg = <0 0xc1e0c00 0 0x1000>;
  1041				#clock-cells = <1>;
  1042			};
  1043	
  1044			ptppll_pll_ctrl_clk: syscon@c1e4000 {
  1045				/* TODO: Fix compatible in driver */
  1046				compatible = "mediatek,mt8196-ptppll-pll-ctrl", "mediatek,mt8196-ptppll_pll_ctrl", "syscon";
  1047				reg = <0 0xc1e4000 0 0x1000>;
  1048				#clock-cells = <1>;
  1049			};
  1050	
  1051			fdvfs: fdvfs@c220400 {
  1052				compatible = "mediatek,fdvfs";
  1053				reg = <0 0x0c220400 0 0x20>,
  1054					<0 0x0c220420 0 0x4>,
  1055					<0 0x0c2c2034 0 0x4>;
  1056				reg-names = "fdvfs-reg",
  1057					"fdvfs-cci-reg",
  1058					"fdvfs-support";
  1059			};
  1060	
  1061			mcupm: mcupm@c240000 {
  1062				compatible = "mediatek,mt8196-mcupm";
  1063				reg = <0 0x0c240000 0 0x50000>,
  1064				      <0 0x0c2cf600 0 0xa0>,
  1065				      <0 0x0c242004 0 0x4>,
  1066				      <0 0x0c242018 0 0x4>,
  1067				      <0 0x0c242000 0 0x4>,
  1068				      <0 0x0c242010 0 0x4>;
  1069				reg-names = "mcupm_base",
  1070					    "mbox0_base",
  1071					    "mbox0_set",
  1072					    "mbox0_clr",
  1073					    "mbox0_send",
  1074					    "mbox0_recv";
  1075				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,
  1076					     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
  1077					     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
  1078					     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>,
  1079					     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH 0>,
  1080					     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH 0>,
  1081					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH 0>,
  1082					     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH 0>,
  1083					     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH 0>,
  1084					     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH 0>,
  1085					     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH 0>,
  1086					     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH 0>,
  1087					     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH 0>,
  1088					     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH 0>,
  1089					     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH 0>,
  1090					     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH 0>;
  1091				interrupt-names = "mbox0",
  1092						  "mbox1",
  1093						  "mbox2",
  1094						  "mbox3",
  1095						  "mbox4",
  1096						  "mbox5",
  1097						  "mbox6",
  1098						  "mbox7",
  1099						  "mbox8",
  1100						  "mbox9",
  1101						  "mbox10",
  1102						  "mbox11",
  1103						  "mbox12",
  1104						  "mbox13",
  1105						  "mbox14",
  1106						  "mbox15";
  1107				mediatek,mbox-extend = <16>;
  1108			};
  1109	
  1110			performance: performance-controller@c2c0f20 {
  1111				compatible = "mediatek,cpufreq-hw-v1";
  1112				reg = <0 0xc2c0f20 0 0x120>,
  1113				      <0 0xc2c1040 0 0x120>,
  1114				      <0 0xc2c1160 0 0x120>;
  1115				reg-names = "performance-domain0",
  1116					    "performance-domain1",
  1117					    "performance-domain2";
  1118				#performance-domain-cells = <1>;
  1119			};
  1120	
  1121			cpuhvfs: cpuhvfs@c2c2310 {
  1122				compatible = "mediatek,cpufreq-hybrid";
  1123				reg = <0 0x0c2c2310 0 0xc00>,
  1124				      <0 0x0c2c0f10 0 0x1400>,
  1125				      <0 0x0c2c4850 0 0x800>,
  1126				      <0 0x0c2c2e50 0 0xc0>;
  1127				reg-names = "USRAM", "CSRAM", "ESRAM", "FREQ_HW_STATE";
  1128	
  1129				/* pll mcucfg */
  1130				mcucfg-ver = <0>;
  1131				apmixedsys = <&cpu_pll>;
  1132				clk-div-base = <&cpu_mcucfg>;
  1133	
  1134				/* csram sysram base */
  1135				csram-sys-base = <&csram_sys>;
  1136			};
  1137	
  1138			gic: interrupt-controller@c400000 {
  1139				compatible = "arm,gic-v3";
  1140				reg = <0 0xc400000 0 0x40000>, /* distributor */
  1141				      <0 0xc440000 0 0x200000>; /* redistributor */
  1142				#interrupt-cells = <4>;
  1143				#address-cells = <2>;
  1144				#size-cells = <2>;
  1145				#redistributor-regions = <1>;
  1146				interrupt-parent = <&gic>;
  1147				interrupt-controller;
  1148				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
  1149	
  1150				ppi-partitions {
  1151					ppi_cluster0: interrupt-partition-0 {
  1152						affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
  1153					};
  1154	
  1155					ppi_cluster1: interrupt-partition-1 {
  1156						affinity = <&cpu4 &cpu5 &cpu6>;
  1157					};
  1158	
  1159					ppi_cluster2: interrupt-partition-2 {
  1160						affinity = <&cpu7>;
  1161					};
  1162				};
  1163			};
  1164	
  1165			cksys_clk: syscon@10000000 {
  1166				compatible = "mediatek,mt8196-cksys", "syscon";
  1167				reg = <0 0x10000000 0 0x800>;
  1168				hw-voter-regmap = <&hwv>;
  1169				#clock-cells = <1>;
  1170			};
  1171	
  1172			apmixedsys_clk: syscon@10000800 {
  1173				compatible = "mediatek,mt8196-apmixedsys", "syscon";
  1174				reg = <0 0x10000800 0 0x1000>;
  1175				#clock-cells = <1>;
  1176			};
  1177	
  1178			cksys_gp2_clk: syscon@1000c000 {
  1179				compatible = "mediatek,mt8196-cksys-gp2", "syscon";
  1180				reg = <0 0x1000c000 0 0x800>;
  1181				mm-hw-ccf-regmap = <&mm_hwv>;
  1182				#clock-cells = <1>;
  1183			};
  1184	
  1185			apmixedsys_gp2_clk: syscon@1000c800 {
  1186				/* TODO: Fix compatible in driver */
  1187				compatible = "mediatek,mt8196-apmixedsys-gp2", "mediatek,mt8196-apmixedsys_gp2", "syscon";
  1188				reg = <0 0x1000c800 0 0x1000>;
  1189				#clock-cells = <1>;
  1190			};
  1191	
  1192			ifr_bus: syscon@1002c000 {
  1193				/* TODO: Fix compatible in driver */
  1194				compatible = "mediatek,mt8196-ifr-bus", "mediatek,mt8196-ifr_bus", "syscon";
  1195				reg = <0 0x1002c000 0 0x1000>;
  1196			};
  1197	
  1198			pio: pinctrl@1002d000 {
  1199				compatible = "mediatek,mt8196-pinctrl";
  1200				reg = <0 0x1002d000 0 0x1000>,
  1201				      <0 0x12000000 0 0x1000>,
  1202				      <0 0x12020000 0 0x1000>,
  1203				      <0 0x12040000 0 0x1000>,
  1204				      <0 0x12060000 0 0x1000>,
  1205				      <0 0x12820000 0 0x1000>,
  1206				      <0 0x12840000 0 0x1000>,
  1207				      <0 0x12860000 0 0x1000>,
  1208				      <0 0x13000000 0 0x1000>,
  1209				      <0 0x13020000 0 0x1000>,
  1210				      <0 0x13040000 0 0x1000>,
  1211				      <0 0x130f0000 0 0x1000>,
  1212				      <0 0x13110000 0 0x1000>,
  1213				      <0 0x13800000 0 0x1000>,
  1214				      <0 0x13820000 0 0x1000>,
  1215				      <0 0x13860000 0 0x1000>,
  1216				      <0 0x12080000 0 0x1000>,
  1217				      <0 0x12880000 0 0x1000>,
  1218				      <0 0x13080000 0 0x1000>,
  1219				      <0 0x13880000 0 0x1000>,
  1220				      <0 0x1c54a000 0 0x1000>;
  1221				reg-names = "iocfg0",
  1222					    "iocfg_rt",
  1223					    "iocfg_rm1",
  1224					    "iocfg_rm2",
  1225					    "iocfg_rb",
  1226					    "iocfg_bm1",
  1227					    "iocfg_bm2",
  1228					    "iocfg_bm3",
  1229					    "iocfg_lt",
  1230					    "iocfg_lm1",
  1231					    "iocfg_lm2",
  1232					    "iocfg_lb1",
  1233					    "iocfg_lb2",
  1234					    "iocfg_tm1",
  1235					    "iocfg_tm2",
  1236					    "iocfg_tm3",
  1237					    "eint-e",
  1238					    "eint-s",
  1239					    "eint-w",
  1240					    "eint-n",
  1241					    "eint-c";
  1242				gpio-controller;
  1243				#gpio-cells = <2>;
  1244				gpio-ranges = <&pio 0 0 271>;
  1245				interrupt-controller;
  1246				interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH 0>;
  1247				#interrupt-cells = <2>;
  1248			};
  1249	
  1250			memory-controller@10236000 {
  1251				compatible = "mediatek,mt8196-dramc";
  1252				reg = <0 0x10236000 0 0x2000>, /* anaphy base */
  1253				      <0 0x10238000 0 0x2000>;  /* ddrphy base */
  1254			};
  1255	
  1256			devapc_apinfra_dramc: devapc@102f3000 {
  1257				compatible = "mediatek,mt8196-devapc";
  1258				reg = <0 0x102f3000 0 0x1000>;
  1259				vio-idx-num = <61>;
  1260				interrupts = <GIC_SPI 870 IRQ_TYPE_LEVEL_HIGH 0>;
  1261			};
  1262	
> 1263			nsmpu: nsmpu@1046f000 {
  1264				/* TODO: Move some property into platform data */
  1265				compatible = "mediatek,smpu";
  1266				reg = <0 0x1046f000 0 0x1000>;
  1267				interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH 0>;
  1268				name = "nsmpu";
  1269				sr-cnt = <63>;
  1270				aid-cnt = <256>;
  1271				aid-num-per-set = <32>;
  1272				dump = <0xe00 0xe08 0xe0c 0xe10 0xe14 0xe18 0xe1c 0xe20 0xe28
  1273					0xe80 0xe88 0xe8c 0xe90 0xe94 0xe98 0xe9c 0xea0 0xea8>;
  1274				dump-md = <0xe40 0xe48 0xe4c 0xe50 0xe54 0xe58 0xe5c 0xe60 0xe68
  1275					0xec0 0xec8 0xecc 0xed0 0xed4 0xed8 0xedc 0xee0 0xee8>;
  1276				clear = <0xe00 0x1 1>,
  1277					<0xe00 0x0 1>,
  1278					<0xe80 0x1 1>,
  1279					<0xe80 0x0 1>;
  1280				mask = <0xe00 0x2 1>,
  1281					<0xe80 0x2 1>,
  1282					<0xe40 0x2 1>,
  1283					<0xec0 0x2 1>;
  1284				clear-md = <0xe40 0x1 1>,
  1285					   <0xe40 0x0 1>,
  1286					   <0xec0 0x1 1>,
  1287					   <0xec0 0x0 1>;
  1288				vio-info = <0x0 0x2 0x9 0x2>;
  1289				bypass = <0xe1c 0xe9c 0xe28 0xea8>;
  1290				bypass-axi = <0x6 0xff80 0x4000 0x7 0xff01 0x4001>;
  1291				bypass-wce = <0x5 0xf3 0x7 0x16>;
  1292				mediatek,slc-b-mode;
  1293			};
  1294	
> 1295			ssmpu: ssmpu@1056f000{
  1296				/* TODO: Move some property into platform data */
  1297				compatible = "mediatek,smpu";
  1298				reg = <0 0x1056f000 0 0x1000>;
  1299				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH 0>;
  1300				name = "ssmpu";
  1301				dump = <0xe00 0xe08 0xe0c 0xe10 0xe14 0xe18 0xe1c 0xe20 0xe28
  1302					0xe80 0xe88 0xe8c 0xe90 0xe94 0xe98 0xe9c 0xea0 0xea8>;
  1303				dump-md = <0xe40 0xe48 0xe4c 0xe50 0xe54 0xe58 0xe5c 0xe60 0xe68
  1304					   0xec0 0xec8 0xecc 0xed0 0xed4 0xed8 0xedc 0xee0 0xee8>;
  1305				clear = <0xe00 0x1 1>,
  1306					<0xe00 0x0 1>,
  1307					<0xe80 0x1 1>,
  1308					<0xe80 0x0 1>;
  1309				mask = <0xe00 0x2 1>,
  1310				       <0xe80 0x2 1>,
  1311				       <0xe40 0x2 1>,
  1312				       <0xec0 0x2 1>;
  1313				clear-md = <0xe40 0x1 1>,
  1314					   <0xe40 0x0 1>,
  1315					   <0xec0 0x1 1>,
  1316					   <0xec0 0x0 1>;
  1317				vio-info = <0x0 0x2 0x9 0x2>;
  1318				bypass = <0xe1c 0xe9c 0xe28 0xea8>;
  1319				bypass-axi = <0x6 0xff80 0x4000 0x7 0xff01 0x4001>;
  1320				bypass-wce = <0x5 0xf3 0x7 0x16>;
  1321				mediatek,slc-b-mode;
  1322			};
  1323	
  1324			nkp: nkp@1046f000 {
  1325				/* TODO: Move some property into platform data */
  1326				compatible = "mediatek,smpu";
  1327				reg = <0 0x1046f000 0 0x1000>;
  1328				interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH 0>;
  1329				name = "nkp";
  1330				dump = <0xc00 0xc04 0xc10 0xc14>;
  1331				clear = <0x410 0x1 1>,
  1332					<0x410 0x0 1>;
  1333				mask = <0x410 0x2 1>,
  1334				       <0xe40 0x2 1>,
  1335				       <0xec0 0x2 1>;
  1336				clear-md = <0xe40 0x1 1>,
  1337					   <0xe40 0x0 1>,
  1338					   <0xec0 0x1 1>,
  1339					   <0xec0 0x0 1>;
  1340				vio-info = <0x1 0xf 0x3 0xf>;
  1341				mediatek,slc-b-mode;
  1342			};
  1343	
  1344			skp: skp@1056f000 {
  1345				/* TODO: Move some property into platform data */
  1346				compatible = "mediatek,smpu";
  1347				reg = <0 0x1056f000 0 0x1000>;
  1348				interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>;
  1349				name = "skp";
  1350				dump = <0xc00 0xc04 0xc10 0xc14>;
  1351				clear = <0x410 0x1 1>,
  1352					<0x410 0x0 1>;
  1353				mask = <0x410 0x2 1>,
  1354				       <0xe40 0x2 1>,
  1355				       <0xec0 0x2 1>;
  1356				clear-md = <0xe40 0x1 1>,
  1357					   <0xe40 0x0 1>,
  1358					   <0xec0 0x1 1>,
  1359					   <0xec0 0x0 1>;
  1360				vio-info = <0x1 0xf 0x3 0xf>;
  1361				mediatek,slc-b-mode;
  1362			};
  1363	
  1364			devapc_apinfra_emi: devapc@10613000 {
  1365				compatible = "mediatek,mt8196-devapc";
  1366				reg = <0 0x10613000 0 0x1000>;
  1367				vio-idx-num = <149>;
  1368				interrupts = <GIC_SPI 869 IRQ_TYPE_LEVEL_HIGH 0>;
  1369			};
  1370	
  1371			devapc_apinfra_big4: devapc@10693000 {
  1372				compatible = "mediatek,mt8196-devapc";
  1373				reg = <0 0x10693000 0 0x1000>;
  1374				vio-idx-num = <89>;
  1375				interrupts = <GIC_SPI 863 IRQ_TYPE_LEVEL_HIGH 0>;
  1376			};
  1377	
  1378			i2c5: i2c@120a0000 {
  1379				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1380				reg = <0 0x120a0000 0 0x20000>,
  1381				      <0 0x16400000 0 0x10000>;
  1382				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
  1383				clocks = <&imp_iic_wrap_e_clk CLK_IMPE_I2C5_I2C>,
  1384					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1385				clock-names = "main", "dma";
  1386				clock-div = <1>;
  1387				#address-cells = <1>;
  1388				#size-cells = <0>;
  1389	
  1390				status = "disabled";
  1391			};
  1392	
  1393			imp_iic_wrap_e_clk: syscon@120c0000 {
  1394				/* TODO: Fix compatible in driver */
  1395				compatible = "mediatek,mt8196-imp-iic-wrap-e", "mediatek,mt8196-imp_iic_wrap_e", "syscon";
  1396				reg = <0 0x120c0000 0 0x1000>;
  1397				#clock-cells = <1>;
  1398			};
  1399	
  1400			mipi_tx_config0: mipi-tx-config@130b0000 {
  1401				compatible = "mediatek,mt8196-mipi-tx";
  1402				reg = <0 0x130b0000 0 0x1000>;
  1403				clocks = <&clk26m>;
  1404				#clock-cells = <0>;
  1405				#phy-cells = <0>;
  1406				clock-output-names = "mipi_tx0_pll";
  1407			};
  1408	
  1409			i2c0: i2c@13130000 {
  1410				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1411				reg = <0 0x13130000 0 0x20000>,
  1412				      <0 0x16370000 0 0x10000>;
  1413				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
  1414				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C0_I2C>,
  1415					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1416				clock-names = "main", "dma";
  1417				clock-div = <1>;
  1418				#address-cells = <1>;
  1419				#size-cells = <0>;
  1420	
  1421				status = "disabled";
  1422			};
  1423	
  1424			i2c3: i2c@13150000 {
  1425				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1426				reg = <0 0x13150000 0 0x20000>,
  1427				      <0 0x163c0000 0 0x10000>;
  1428				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH 0>;
  1429				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C3_I2C>,
  1430					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1431				clock-names = "main", "dma";
  1432				clock-div = <1>;
  1433				#address-cells = <1>;
  1434				#size-cells = <0>;
  1435	
  1436				status = "disabled";
  1437			};
  1438	
  1439			i2c6: i2c@13170000 {
  1440				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1441				reg = <0 0x13170000 0 0x20000>,
  1442				      <0 0x16410000 0 0x10000>;
  1443				interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
  1444				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C6_I2C>,
  1445					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1446				clock-names = "main", "dma";
  1447				clock-div = <1>;
  1448				#address-cells = <1>;
  1449				#size-cells = <0>;
  1450	
  1451				status = "disabled";
  1452			};
  1453	
  1454			i2c10: i2c@13190000 {
  1455				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1456				reg = <0 0x13190000 0 0x20000>,
  1457				      <0 0x164b0000 0 0x10000>;
  1458				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
  1459				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C10_I2C>,
  1460					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1461				clock-names = "main", "dma";
  1462				clock-div = <1>;
  1463				#address-cells = <1>;
  1464				#size-cells = <0>;
  1465	
  1466				status = "disabled";
  1467			};
  1468	
  1469			imp_iic_wrap_w_clk: syscon@131b0000 {
  1470				/* TODO: Fix compatible in driver */
  1471				compatible = "mediatek,mt8196-imp-iic-wrap-w", "mediatek,mt8196-imp_iic_wrap_w", "syscon";
  1472				reg = <0 0x131b0000 0 0x1000>;
  1473				#clock-cells = <1>;
  1474			};
  1475	
  1476			efuse: efuse@13260000 {
  1477				compatible = "mediatek,mt8196-efuse", "mediatek,efuse";
  1478				reg = <0 0x13260000 0 0x1000>;
  1479				#address-cells = <1>;
  1480				#size-cells = <1>;
  1481	
  1482				lvts_e_data1: data1@334 {
  1483					reg = <0x334 0xc>;
  1484				};
  1485	
  1486				lvts_e_data2: data2@340 {
  1487					reg = <0x340 0x14>;
  1488				};
  1489	
  1490				lvts_e_data3: data3@354 {
  1491					reg = <0x354 0x20>;
  1492				};
  1493	
  1494				lvts_e_data4: data4@388 {
  1495					reg = <0x388 0x20>;
  1496				};
  1497	
  1498				socinfo-data1@40 {
  1499					reg = <0x40 0x4>;
  1500				};
  1501	
  1502				socinfo-data2@4c {
  1503					reg = <0x4c 0x4>;
  1504				};
  1505			};
  1506	
  1507			i2c1: i2c@13930000 {
  1508				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1509				reg = <0 0x13930000 0 0x80000>,
  1510				      <0 0x16380000 0 0x10000>;
  1511				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH 0>;
  1512				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C1_I2C>,
  1513					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1514				clock-names = "main", "dma";
  1515				clock-div = <1>;
  1516				#address-cells = <1>;
  1517				#size-cells = <0>;
  1518	
  1519				status = "disabled";
  1520			};
  1521	
  1522			i2c2: i2c@139b0000 {
  1523				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1524				reg = <0 0x139b0000 0 0x80000>,
  1525				      <0 0x16390000 0 0x30000>;
  1526				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH 0>;
  1527				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C2_I2C>,
  1528					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1529				clock-names = "main", "dma";
  1530				clock-div = <1>;
  1531				#address-cells = <1>;
  1532				#size-cells = <0>;
  1533	
  1534				status = "disabled";
  1535			};
  1536	
  1537			i2c4: i2c@13a30000 {
  1538				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1539				reg = <0 0x13a30000 0 0x80000>,
  1540				      <0 0x163d0000 0 0x30000>;
  1541				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
  1542				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C4_I2C>,
  1543					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1544				clock-names = "main", "dma";
  1545				clock-div = <1>;
  1546				#address-cells = <1>;
  1547				#size-cells = <0>;
  1548	
  1549				status = "disabled";
  1550			};
  1551	
  1552			i2c7: i2c@13ab0000 {
  1553				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1554				reg = <0 0x13ab0000 0 0x80000>,
  1555				      <0 0x16420000 0 0x30000>;
  1556				interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
  1557				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C7_I2C>,
  1558					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1559				clock-names = "main", "dma";
  1560				clock-div = <1>;
  1561				#address-cells = <1>;
  1562				#size-cells = <0>;
  1563	
  1564				status = "disabled";
  1565			};
  1566	
  1567			i2c8: i2c@13b30000 {
  1568				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1569				reg = <0 0x13b30000 0 0x80000>,
  1570				      <0 0x16450000 0 0x30000>;
  1571				interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH 0>;
  1572				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C8_I2C>,
  1573					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1574				clock-names = "main", "dma";
  1575				clock-div = <1>;
  1576				#address-cells = <1>;
  1577				#size-cells = <0>;
  1578	
  1579				status = "disabled";
  1580			};
  1581	
  1582			i2c9: i2c@13bb0000 {
  1583				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1584				reg = <0 0x13bb0000 0 0x80000>,
  1585				      <0 0x16480000 0 0x30000>;
  1586				interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH 0>;
  1587				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C9_I2C>,
  1588					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1589				clock-names = "main", "dma";
  1590				clock-div = <1>;
  1591				#address-cells = <1>;
  1592				#size-cells = <0>;
  1593	
  1594				status = "disabled";
  1595			};
  1596	
  1597			imp_iic_wrap_n_clk: syscon@13c30000 {
  1598				/* TODO: Fix compatible in driver */
  1599				compatible = "mediatek,mt8196-imp-iic-wrap-n", "mediatek,mt8196-imp_iic_wrap_n", "syscon";
  1600				reg = <0 0x13c30000 0 0x1000>;
  1601				hw-voter-regmap = <&hwv>;
  1602				#clock-cells = <1>;
  1603			};
  1604	
  1605			devapc_apinfra_io_intf: devapc@140a0000 {
  1606				compatible = "mediatek,mt8196-devapc";
  1607				reg = <0 0x140a0000 0 0x1000>;
  1608				vio-idx-num = <8>;
  1609				interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH 0>;
  1610			};
  1611	
  1612			devapc_apinfra_mem_intf: devapc@140c0000 {
  1613				compatible = "mediatek,mt8196-devapc";
  1614				reg = <0 0x140c0000 0 0x1000>;
  1615				vio-idx-num = <7>;
  1616				interrupts = <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH 0>;
  1617			};
  1618	
  1619			devapc_apinfra_slb: devapc@140e0000 {
  1620				compatible = "mediatek,mt8196-devapc";
  1621				reg = <0 0x140e0000 0 0x1000>;
  1622				vio-idx-num = <14>;
  1623				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH 0>;
  1624			};
  1625	
  1626			apifrbus_ao_mem_reg_clk: syscon@14126000 {
  1627				/* TODO: Fix compatible in driver */
  1628				compatible = "mediatek,mt8196-apifrbus-ao-mem-reg", "mediatek,mt8196-apifrbus_ao_mem_reg", "syscon";
  1629				reg = <0 0x14126000 0 0x1000>;
  1630				#clock-cells = <1>;
  1631			};
  1632	
  1633			devapc_apinfra_mem: devapc@14130000 {
  1634				compatible = "mediatek,mt8196-devapc";
  1635				reg = <0 0x14130000 0 0x1000>;
  1636				vio-idx-num = <13>;
  1637				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH 0>;
  1638			};
  1639	
  1640			devapc_apinfra_mem_ctrl: devapc@14131000 {
  1641				compatible = "mediatek,mt8196-devapc";
  1642				reg = <0 0x14131000 0 0x1000>;
  1643				vio-idx-num = <23>;
  1644				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH 0>;
  1645			};
  1646	
  1647			infracfg@14136000 {
  1648				compatible = "mediatek,infracfg";
  1649				reg = <0 0x14136000 0 0x1000>;
  1650			};
  1651	
  1652			devapc_apinfra_int: devapc@142f4000 {
  1653				compatible = "mediatek,mt8196-devapc";
  1654				reg = <0 0x142f4000 0 0x1000>;
  1655				vio-idx-num = <26>;
  1656				interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH 0>;
  1657			};
  1658	
  1659			devapc_apinfra_io_ctrl: devapc@14400000 {
  1660				compatible = "mediatek,mt8196-devapc";
  1661				reg = <0 0x14400000 0 0x1000>;
  1662				vio-idx-num = <10>;
  1663				interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH 0>;
  1664			};
  1665	
  1666			devapc_apinfra_io: devapc@14401000 {
  1667				compatible = "mediatek,mt8196-devapc";
  1668				reg = <0 0x14401000 0 0x1000>;
  1669				vio-idx-num = <230>;
  1670				interrupts = <GIC_SPI 867 IRQ_TYPE_LEVEL_HIGH 0>;
  1671			};
  1672	
  1673			lvts: thermal-sensor@14414000 {
  1674				compatible = "mediatek,mt8196-lvts";
  1675				reg = <0 0x14414000 0 0x1000>,
  1676					<0 0x0c230000 0 0x1000>,
  1677					<0 0x19004000 0 0x1000>,
  1678					<0 0x4b400000 0 0x1000>;
  1679				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>,
  1680						<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
  1681						<GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH 0>,
  1682						<GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH 0>;
  1683				#thermal-sensor-cells = <1>;
  1684				nvmem-cells = <&lvts_e_data1 &lvts_e_data2 &lvts_e_data3
  1685						&lvts_e_data4>;
  1686				nvmem-cell-names = "e_data1","e_data2","e_data3","e_data4";
  1687			};
  1688	
  1689			hwv: syscon@14500000 {
  1690				compatible = "mediatek,mt8196-hwv", "syscon";
  1691				reg = <0 0x14500000 0 0x3000>;
  1692			};
  1693	
  1694			devapc_apinfra_mmu: devapc@14800000 {
  1695				compatible = "mediatek,mt8196-devapc";
  1696				reg = <0 0x14800000 0 0x1000>;
  1697				vio-idx-num = <20>;
  1698				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH 0>;
  1699			};
  1700	
  1701			uart0: serial@16000000 {
  1702				compatible = "mediatek,mt6577-uart";
  1703				reg = <0 0x16000000 0 0x1000>;
  1704				interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH 0>;
  1705				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART0_BCLK_UART>;
  1706				clock-names = "baud", "bus";
  1707	
  1708				status = "disabled";
  1709			};
  1710	
  1711			uart1: serial@16010000 {
  1712				compatible = "mediatek,mt6577-uart";
  1713				reg = <0 0x16010000 0 0x1000>;
  1714				interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH 0>;
  1715				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART1_BCLK_UART>;
  1716				clock-names = "baud", "bus";
  1717	
  1718				status = "disabled";
  1719			};
  1720	
  1721			uart2: serial@16020000 {
  1722				compatible = "mediatek,mt6577-uart";
  1723				reg = <0 0x16020000 0 0x1000>;
  1724				interrupts = <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH 0>;
  1725				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART2_BCLK_UART>;
  1726				clock-names = "baud", "bus";
  1727	
  1728				status = "disabled";
  1729			};
  1730	
  1731			uart3: serial@16030000 {
  1732				compatible = "mediatek,mt6985-uart";
  1733				reg = <0 0x16030000 0 0x1000>;
  1734				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH 0>,
  1735					     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH 0>;    /* uart3 wakeup irq */
  1736				clocks = <&clk104m>, <&pericfg_ao_clk CLK_PERAO_UART3_BCLK_UART>;
  1737				clock-names = "baud", "bus";
  1738	
  1739				status = "disabled";
  1740			};
  1741	
  1742			disp_pwm0: disp-pwm0@160b0000 {
  1743				compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
  1744				reg = <0 0x160b0000 0 0x1000>;
  1745				interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
  1746				#pwm-cells = <2>;
  1747				clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
  1748				clock-names = "main";
  1749				status = "disabled";
  1750			};
  1751	
  1752			disp_pwm1: disp-pwm1@160c0000 {
  1753				compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
  1754				reg = <0 0x160c0000 0 0x1000>;
  1755				#pwm-cells = <2>;
  1756				clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
  1757				clock-names = "main";
  1758				status = "disabled";
  1759			};
  1760	
  1761			spi0: spi@16110000 {
  1762				compatible = "mediatek,mt8196-spi";
  1763				reg = <0 0x16110000 0 0x100>;
  1764				interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
  1765				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1766					<&cksys_clk CLK_CK_SPI0_BCLK_SEL>,
  1767					<&pericfg_ao_clk CLK_PERAO_SPI0_BCLK_SPI>;
  1768				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1769				#address-cells = <1>;
  1770				#size-cells = <0>;
  1771				mediatek,pad-select = <0>;
  1772	
  1773				status = "disabled";
  1774			};
  1775	
  1776			spi1: spi@16130000 {
  1777				compatible = "mediatek,mt8196-spi";
  1778				reg = <0 0x16130000 0 0x100>;
  1779				interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
  1780				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1781					<&cksys_clk CLK_CK_SPI1_BCLK_SEL>,
  1782					<&pericfg_ao_clk CLK_PERAO_SPI1_BCLK_SPI>;
  1783				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1784				#address-cells = <1>;
  1785				#size-cells = <0>;
  1786				mediatek,pad-select = <0>;
  1787	
  1788				status = "disabled";
  1789			};
  1790	
  1791			spi2: spi@16150000 {
  1792				compatible = "mediatek,mt8196-spi";
  1793				reg = <0 0x16150000 0 0x100>;
  1794				interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
  1795				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1796					<&cksys_clk CLK_CK_SPI2_BCLK_SEL>,
  1797					<&pericfg_ao_clk CLK_PERAO_SPI2_BCLK_SPI>;
  1798				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1799				#address-cells = <1>;
  1800				#size-cells = <0>;
  1801				mediatek,pad-select = <0>;
  1802	
  1803				status = "disabled";
  1804			};
  1805	
  1806			spi3: spi@16170000 {
  1807				compatible = "mediatek,mt8196-spi";
  1808				reg = <0 0x16170000 0 0x100>;
  1809				interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
  1810				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1811					<&cksys_clk CLK_CK_SPI3_BCLK_SEL>,
  1812					<&pericfg_ao_clk CLK_PERAO_SPI3_BCLK_SPI>;
  1813				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1814				#address-cells = <1>;
  1815				#size-cells = <0>;
  1816				mediatek,pad-select = <0>;
  1817	
  1818				status = "disabled";
  1819			};
  1820	
  1821			spi4: spi@16190000 {
  1822				compatible = "mediatek,mt8196-spi";
  1823				reg = <0 0x16190000 0 0x100>;
  1824				interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
  1825				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1826					<&cksys_clk CLK_CK_SPI4_BCLK_SEL>,
  1827					<&pericfg_ao_clk CLK_PERAO_SPI4_BCLK_SPI>;
  1828				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1829				#address-cells = <1>;
  1830				#size-cells = <0>;
  1831				mediatek,pad-select = <0>;
  1832	
  1833				status = "disabled";
  1834			};
  1835	
  1836			spi5: spi@161b0000 {
  1837				compatible = "mediatek,mt8196-spi";
  1838				reg = <0 0x161b0000 0 0x100>;
  1839				interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>;
  1840				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1841					<&cksys_clk CLK_CK_SPI5_BCLK_SEL>,
  1842					<&pericfg_ao_clk CLK_PERAO_SPI5_BCLK_SPI>;
  1843				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1844				#address-cells = <1>;
  1845				#size-cells = <0>;
  1846				mediatek,pad-select = <0>;
  1847	
  1848				status = "disabled";
  1849			};
  1850	
  1851			spi6: spi@161d0000 {
  1852				compatible = "mediatek,mt8196-spi";
  1853				reg = <0 0x161d0000 0 0x100>;
  1854				interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
  1855				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1856					<&cksys_clk CLK_CK_SPI6_BCLK_SEL>,
  1857					<&pericfg_ao_clk CLK_PERAO_SPI6_BCLK_SPI>;
  1858				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1859				#address-cells = <1>;
  1860				#size-cells = <0>;
  1861				mediatek,pad-select = <1>;
  1862	
  1863				status = "disabled";
  1864			};
  1865	
  1866			spi7: spi@161f0000 {
  1867				compatible = "mediatek,mt8196-spi";
  1868				reg = <0 0x161f0000 0 0x100>;
  1869				interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH 0>;
  1870				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1871					<&cksys_clk CLK_CK_SPI7_BCLK_SEL>,
  1872					<&pericfg_ao_clk CLK_PERAO_SPI7_BCLK_SPI>;
  1873				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1874				#address-cells = <1>;
  1875				#size-cells = <0>;
  1876				mediatek,pad-select = <0>;
  1877	
  1878				status = "disabled";
  1879			};
  1880	
  1881			i2c11: i2c@16200000 {
  1882				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1883				reg = <0 0x16200000 0 0x40000>,
  1884				      <0 0x164c0000 0 0x10000>;
  1885				interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH 0>;
  1886				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C11_I2C>,
  1887					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1888				clock-names = "main", "dma";
  1889				clock-div = <1>;
  1890				#address-cells = <1>;
  1891				#size-cells = <0>;
  1892	
  1893				status = "disabled";
  1894			};
  1895	
  1896			i2c12: i2c@16240000 {
  1897				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1898				reg = <0 0x16240000 0 0x40000>,
  1899				      <0 0x164d0000 0 0x20000>;
  1900				interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH 0>;
  1901				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C12_I2C>,
  1902					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1903				clock-names = "main", "dma";
  1904				clock-div = <1>;
  1905				#address-cells = <1>;
  1906				#size-cells = <0>;
  1907	
  1908				status = "disabled";
  1909			};
  1910	
  1911			i2c13: i2c@16280000 {
  1912				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1913				reg = <0 0x16280000 0 0x40000>,
  1914				      <0 0x164f0000 0 0x10000>;
  1915				interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
  1916				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C13_I2C>,
  1917					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1918				clock-names = "main", "dma";
  1919				clock-div = <1>;
  1920				#address-cells = <1>;
  1921				#size-cells = <0>;
  1922	
  1923				status = "disabled";
  1924			};
  1925	
  1926			i2c14: i2c@162c0000 {
  1927				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1928				reg = <0 0x162c0000 0 0x40000>,
  1929				      <0 0x16500000 0 0x10000>;
  1930				interrupts = <GIC_SPI 900 IRQ_TYPE_LEVEL_HIGH 0>;
  1931				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C14_I2C>,
  1932					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1933				clock-names = "main", "dma";
  1934				clock-div = <1>;
  1935				#address-cells = <1>;
  1936				#size-cells = <0>;
  1937	
  1938				status = "disabled";
  1939			};
  1940	
  1941			imp_iic_wrap_c_clk: syscon@16300000 {
  1942				/* TODO: Fix compatible in driver */
  1943				compatible = "mediatek,mt8196-imp-iic-wrap-c", "mediatek,mt8196-imp_iic_wrap_c", "syscon";
  1944				reg = <0 0x16300000 0 0x1000>;
  1945				#clock-cells = <1>;
  1946			};
  1947	
  1948			mmc1: mmc@16310000 {
  1949				compatible = "mediatek,mt8196-mmc";
  1950				reg = <0 0x16310000 0 0x1000>,
  1951				      <0 0x12a10000 0 0x1000>;
  1952				interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH 0>;
  1953				clocks = <&cksys_clk CLK_CK_MSDC30_1_SEL>,
  1954						<&pericfg_ao_clk CLK_PERAO_MSDC1_AXI_MSDC1>,
  1955						<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_MSDC1>,
  1956						<&pericfg_ao_clk CLK_PERAO_MSDC1_MSDC_SRC_MSDC1>,
  1957						<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_WRAP_MSDC1>;
  1958				clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
  1959	
  1960				status = "disabled";
  1961			};
  1962	
  1963			mmc2: mmc@16320000 {
  1964				compatible = "mediatek,mt8196-mmc";
  1965				reg = <0 0x16320000 0 0x1000>,
  1966				      <0 0x138a0000 0 0x1000>;
  1967				interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>;
  1968				clocks = <&cksys_clk CLK_CK_MSDC30_2_SEL>,
  1969						<&pericfg_ao_clk CLK_PERAO_MSDC2_AXI_MSDC2>,
  1970						<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_MSDC2>,
  1971						<&pericfg_ao_clk CLK_PERAO_MSDC2_MSDC_SRC_MSDC2>,
  1972						<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_WRAP_MSDC2>;
  1973				clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
  1974	
  1975				status = "disabled";
  1976			};
  1977	
  1978			pwm: pwm@16330000 {
  1979				compatible = "mediatek,pwm";
  1980				reg = <0 0x16330000 0 0x1000>;
  1981				interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH 0>;
  1982	
  1983				status = "disabled";
  1984			};
  1985	
  1986			nor_flash: spi@16340000 {
  1987				compatible = "mediatek,mt8196-nor",
  1988					     "mediatek,mt8186-nor";
  1989				reg = <0 0x16340000 0 0x1000>;
  1990				clocks = <&cksys_clk CLK_CK_SFLASH_SEL>,
  1991					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_FLASH_FLASHIF>,
  1992					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_DRAM_FLASHIF>,
  1993					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_AXI_FLASHIF>,
  1994					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_BCLK_FLASHIF>,
  1995					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_27M_FLASHIF>;
  1996				clock-names = "spi", "sf", "axi", "axi_s", "bclk", "27m";
  1997				assigned-clocks = <&cksys_clk CLK_CK_SFLASH_SEL>;
  1998				assigned-clock-parents = <&cksys_clk CLK_CK_UNIVPLL_D6_D8>;
  1999				interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>;
  2000				#address-cells = <1>;
  2001				#size-cells = <0>;
  2002				status = "disabled";
  2003			};
  2004	
  2005			pericfg_ao_clk: syscon@16640000 {
  2006				/* TODO: Fix compatible in driver */
  2007				compatible = "mediatek,mt8196-pericfg-ao", "mediatek,mt8196-pericfg_ao", "syscon";
  2008				reg = <0 0x16640000 0 0x1000>;
  2009				hw-voter-regmap = <&hwv>;
  2010				#clock-cells = <1>;
  2011			};
  2012	
  2013			devapc_peri: devapc@16670000 {
  2014				compatible = "mediatek,mt8196-devapc";
  2015				reg = <0 0x16670000 0 0x1000>;
  2016				vio-idx-num = <204>;
  2017				interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
  2018			};
  2019	
  2020			xhci0: usb@16700000 {
  2021				compatible = "mediatek,mtk-xhci";
  2022				reg = <0 0x16700000 0 0x1000>,
  2023				      <0 0x16703e00 0 0x0100>;
  2024				reg-names = "mac", "ippc";
  2025				interrupts-extended = <&gic GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH 0>,
  2026						      <&pio 273 IRQ_TYPE_LEVEL_LOW>;
  2027				interrupt-names = "host","wakeup";
  2028				phys = <&u2port0 PHY_TYPE_USB2>,
  2029				       <&u3port0 PHY_TYPE_USB3>;
  2030				#address-cells = <2>;
  2031				#size-cells = <2>;
  2032				clocks = <&vlp_cksys_clk CLK_VLP_CK_USB_TOP_SEL>,
  2033					 <&vlp_cksys_clk CLK_VLP_CK_USB_XHCI_SEL>,
  2034					 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
  2035				clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
  2036				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P0>;
  2037				mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 107>;
  2038				wakeup-source;
  2039				status = "disabled";
  2040			};
  2041	
  2042			xhci1: usb1@16710000 {
  2043				compatible = "mediatek,mtk-xhci";
  2044				reg = <0 0x16710000 0 0x1000>,
  2045				      <0 0x16713e00 0 0x0100>;
  2046				reg-names = "mac", "ippc";
  2047				interrupts-extended = <&gic GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH 0>,
  2048						      <&pio 276 IRQ_TYPE_LEVEL_LOW>;
  2049				interrupt-names = "host","wakeup";
  2050				phys = <&u2port1 PHY_TYPE_USB2>;
  2051				clocks = <&cksys_clk CLK_CK_USB_TOP_1P_SEL>,
  2052					 <&cksys_clk CLK_CK_USB_XHCI_1P_SEL>,
  2053					 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
  2054				clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
  2055				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P1>;
  2056				mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 108>;
  2057				wakeup-source;
  2058				status = "disabled";
  2059			};
  2060	
  2061			u2phy0: usb-phy0@16730000 {
  2062				compatible = "mediatek,xsphy";
  2063				ranges = <0x0 0x0 0x16730000 0x700>;
  2064				#address-cells = <1>;
  2065				#size-cells = <1>;
  2066				status = "disabled";
  2067	
  2068				u2port0: usb2-phy0@0 {
  2069					reg = <0x0 0x400>;
  2070					clocks = <&clk26m>;
  2071					clock-names = "ref";
  2072					#phy-cells = <1>;
  2073					mediatek,discth = <10>;
  2074				};
  2075			};
  2076	
  2077			u2phy1: usb-phy1@16740000 {
  2078				compatible = "mediatek,xsphy";
  2079				ranges = <0x0 0x0 0x16740000 0x700>;
  2080				#address-cells = <1>;
  2081				#size-cells = <1>;
  2082				status = "disabled";
  2083	
  2084				u2port1: usb2-phy1@0 {
  2085					reg = <0x0 0x400>;
  2086					clocks = <&clk26m>;
  2087					clock-names = "ref";
  2088					#phy-cells = <1>;
  2089					mediatek,discth = <10>;
  2090				};
  2091			};
  2092	
  2093			u3phy0: usb3-phy0@16773000 {
  2094				compatible = "mediatek,xsphy";
  2095				ranges;
  2096				reg = <0 0x16773000 0 0x200>;
  2097				#address-cells = <2>;
  2098				#size-cells = <2>;
  2099				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
  2100				status = "disabled";
  2101	
  2102				u3port0: usb3-phy0@16773400 {
  2103					reg = <0 0x16773400 0 0x500>;
  2104					clocks = <&clk26m>;
  2105					clock-names = "ref";
  2106					#phy-cells = <1>;
  2107				};
  2108			};
  2109	
  2110			usbwkcfg_ao_clk: syscon@167a0000 {
  2111				compatible = "mediatek,mt8196-usbwkcfg-ao", "syscon";
  2112				reg = <0 0x167a0000 0 0x1000>;
  2113			};
  2114	
  2115			ufshci: ufshci@16810000 {
  2116				compatible = "mediatek,mt8183-ufshci";
  2117				reg = <0 0x16810000 0 0x2a00>;
  2118	
  2119				interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH 0>,
  2120					     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH 0>,
  2121					     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>,
  2122					     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>,
  2123					     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH 0>,
  2124					     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH 0>,
  2125					     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH 0>,
  2126					     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH 0>,
  2127					     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH 0>;
  2128				clocks =
  2129						<&cksys_clk CLK_CK_SEL>,
  2130						<&cksys_clk CLK_CK_MAINPLL_D4_D2>,
  2131						<&cksys_clk CLK_CK_UNIVPLL_D5>,
  2132						<&cksys_clk CLK_CK_AES_UFSFDE_SEL>,
  2133						<&cksys_clk CLK_CK_UNIVPLL_D6>,
  2134						<&cksys_clk CLK_CK_MAINPLL_D4>,
  2135						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_TX_SYM_UFS>,
  2136						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM0_UFS>,
  2137						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM1_UFS>,
  2138						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SYS_UFS>,
  2139						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SAP_UFS>,
  2140						<&ufscfg_ao_clk CLK_UFSAO_PHY_SAP_UFS>,
  2141						<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_UFS_UFS>,
  2142						<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_AES_UFS>;
  2143				clock-names =
  2144						"ufs_sel",
  2145						"ufs_sel_min_src",
  2146						"ufs_sel_max_src",
  2147						"crypt_mux",
  2148						"crypt_lp",
  2149						"crypt_perf",
  2150						"unipro_tx_sym",
  2151						"unipro_rx_sym0",
  2152						"unipro_rx_sym1",
  2153						"unipro_sys",
  2154						"unipro_sap",
  2155						"ufs_phy_sap",
  2156						"ufshci_ufs",
  2157						"ufshci_aes";
  2158				freq-table-hz =
  2159						<273000000 499200000>,
  2160						<0 0>,
  2161						<0 0>,
  2162						<0 0>,
  2163						<0 0>,
  2164						<0 0>,
  2165						<0 0>,
  2166						<0 0>,
  2167						<0 0>,
  2168						<0 0>,
  2169						<0 0>,
  2170						<0 0>,
  2171						<0 0>,
  2172						<0 0>;
  2173				/* for clock scaling bind vcore */
  2174	
  2175				/* 0.65V for clock scale up */
  2176				boost-crypt-vcore-min = <650000>;
  2177				vcc-supply = <&mt6363_vemc>;
  2178				vccq-supply = <&mt6363_vufs12>;
  2179				resets =	<&ufscfgao_rst 1>,
  2180						<&ufscfgao_rst 2>,
  2181						<&ufscfgao_rst 3>;
  2182				reset-names =	"unipro_rst",
  2183						"crypto_rst",
  2184						"hci_rst";
  2185	
  2186				/*
  2187				 * Control mtcmos with rtff flow by ufs driver,
  2188				 * Instead of scpsys by PM flow.
  2189				 */
  2190				mediatek,ufs-rtff-mtcmos;
  2191				mediatek,ufs-boost-crypt;
  2192				mediatek,ufs-pmc-via-fastauto;
  2193			};
  2194	
  2195			ufscfg_ao_sec_clk: syscon@16890000 {
  2196				/* TODO: Fix compatible in driver */
  2197				compatible = "mediatek,mt8196-ufscfg-ao-sec", "mediatek,mt8196-ufscfg_ao_sec", "syscon";
  2198				reg = <0 0x16890000 0 0x1000>;
  2199				#clock-cells = <1>;
  2200			};
  2201	
  2202			ufscfg_ao_clk: syscon@168a0000 {
  2203				/* TODO: Fix compatible in driver */
  2204				compatible = "mediatek,mt8196-ufscfg-ao", "mediatek,mt8196-ufscfg_ao", "syscon";
  2205				reg = <0 0x168a0000 0 0x1000>;
  2206				#clock-cells = <1>;
  2207	
  2208				ufscfgao_rst: reset-controller {
  2209					compatible = "ti,syscon-reset";
  2210					#reset-cells = <1>;
  2211	
  2212					ti,reset-bits = <
  2213						/* ufs mphy/ufschi/crypto/unipro reset */
  2214						/* 0: mphy */
  2215						0x48   8 0x4c   8 0 0
  2216						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2217						/* 1: unipro */
  2218						0x148  0 0x14c  0 0 0
  2219						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2220						/* 2: ufs-crypto */
  2221						0x148  1 0x14c  1 0 0
  2222						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2223						/* 3: ufshci */
  2224						0x148  2 0x14c  2 0 0
  2225						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2226						>;
  2227				};
  2228			};
  2229	
  2230			pciephy0: phy@16900000 {
  2231				compatible = "mediatek,mt8196-pcie-phy";
  2232				reg = <0 0x16900000 0 0x10000>,
  2233				      <0 0x16920000 0 0x10000>;
  2234				reg-names = "sif", "ckm";
  2235	
  2236				clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_MCU_BUS_PCIE>,
  2237					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_PEXTP_REF_PCIE>;
  2238				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY0>;
  2239	
  2240				num-lanes = <1>;
  2241				#phy-cells = <0>;
  2242				status = "disabled";
  2243			};
  2244	
  2245			pcie0: pcie@16910000 {
  2246				compatible = "mediatek,mt8196-pcie";
  2247				device_type = "pci";
  2248				reg = <0 0x16910000 0 0x4000>;
  2249				reg-names = "pcie-mac";
  2250				#address-cells = <3>;
  2251				#size-cells = <2>;
  2252				interrupts = <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH 0>;
  2253				bus-range = <0x00 0xff>;
  2254				linux,pci-domain = <0>;
  2255				pextpcfg = <&pextp0cfg_ao_clk>;
  2256				ranges = <0x82000000 0 0x50000000 0x0 0x50000000 0 0x8000000>;
  2257	
  2258				clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_PL_P_PCIE>,
  2259					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_TL_PCIE>,
  2260					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_REF_PCIE>,
  2261					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AXI_250_PCIE>,
  2262					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AHB_APB_PCIE>,
  2263					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_VLP_AO_P0_LP_PCIE>;
  2264				clock-names = "pl_250m", "tl_26m", "peri_26m",
  2265					      "peri_mem", "bus", "low_power";
  2266				assigned-clocks = <&cksys_clk CLK_CK_TL_SEL>;
  2267				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  2268	
  2269				resets = <&pextp0ao_rst 0>, <&pextp0ao_rst 1>;
  2270				reset-names = "mac", "phy";
  2271				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC0>;
  2272	
  2273				phys = <&pciephy0>;
  2274				phy-names = "pcie-phy";
  2275	
  2276				status = "disabled";
  2277	
  2278				#interrupt-cells = <1>;
  2279				interrupt-map-mask = <0 0 0 7>;
  2280				interrupt-map = <0 0 0 1 &pcie_intc0 0>,
  2281						<0 0 0 2 &pcie_intc0 1>,
  2282						<0 0 0 3 &pcie_intc0 2>,
  2283						<0 0 0 4 &pcie_intc0 3>;
  2284	
  2285				pcie_intc0: interrupt-controller {
  2286					interrupt-controller;
  2287					#address-cells = <0>;
  2288					#interrupt-cells = <1>;
  2289				};
  2290			};
  2291	
  2292			pciephy1: phy@16930000 {
  2293				compatible = "mediatek,mt8196-pcie-phy";
  2294				reg = <0 0x16930000 0 0x10000>,
  2295				      <0 0x16950000 0 0x10000>;
  2296				reg-names = "sif", "ckm";
  2297	
  2298				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_MCU_BUS_PCIE>,
  2299					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_PEXTP_REF_PCIE>;
  2300				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY1>;
  2301	
  2302				num-lanes = <2>;
  2303				#phy-cells = <0>;
  2304	
  2305				status = "disabled";
  2306			};
  2307	
  2308			pcie1: pcie@16940000 {
  2309				compatible = "mediatek,mt8196-pcie";
  2310				device_type = "pci";
  2311				reg = <0 0x16940000 0 0x4000>;
  2312				reg-names = "pcie-mac";
  2313				#address-cells = <3>;
  2314				#size-cells = <2>;
  2315				interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH 0>;
  2316				bus-range = <0x00 0xff>;
  2317				linux,pci-domain = <1>;
  2318				pextpcfg = <&pextp1cfg_ao_clk>;
  2319				ranges = <0x82000000 0 0x58000000 0x0 0x58000000 0 0x18000000>;
  2320	
  2321				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_PL_P_PCIE>,
  2322					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_TL_PCIE>,
  2323					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_REF_PCIE>,
  2324					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AXI_250_PCIE>,
  2325					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AHB_APB_PCIE>,
  2326					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P1_LP_PCIE>;
  2327				clock-names = "pl_250m", "tl_26m", "peri_26m",
  2328					      "peri_mem", "bus", "low_power";
  2329				assigned-clocks = <&cksys_clk CLK_CK_TL_P1_SEL>;
  2330				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  2331	
  2332				resets = <&pextp1ao_rst 0>, <&pextp1ao_rst 1>;
  2333				reset-names = "mac", "phy";
  2334				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC1>;
  2335	
  2336				phys = <&pciephy1>;
  2337				phy-names = "pcie-phy";
  2338	
  2339				status = "disabled";
  2340	
  2341				#interrupt-cells = <1>;
  2342				interrupt-map-mask = <0 0 0 7>;
  2343				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
  2344						<0 0 0 2 &pcie_intc1 1>,
  2345						<0 0 0 3 &pcie_intc1 2>,
  2346						<0 0 0 4 &pcie_intc1 3>;
  2347	
  2348				pcie_intc1: interrupt-controller {
  2349					interrupt-controller;
  2350					#address-cells = <0>;
  2351					#interrupt-cells = <1>;
  2352				};
  2353			};
  2354	
  2355			pciephy2: phy@16960000 {
  2356				compatible = "mediatek,mt8196-pcie-phy";
  2357				reg = <0 0x16960000 0 0x10000>,
  2358				      <0 0x16980000 0 0x10000>;
  2359				reg-names = "sif", "ckm";
  2360	
  2361				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_MCU_BUS_PCIE>,
  2362					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_PEXTP_REF_PCIE>;
  2363				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY2>;
  2364	
  2365				num-lanes = <1>;
  2366				#phy-cells = <0>;
  2367	
  2368				status = "disabled";
  2369			};
  2370	
  2371			pcie2: pcie@16970000 {
  2372				device_type = "pci";
  2373				compatible = "mediatek,mt8196-pcie";
  2374				reg = <0 0x16970000 0 0x4000>;
  2375				reg-names = "pcie-mac";
  2376				#address-cells = <3>;
  2377				#size-cells = <2>;
  2378				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH 0>;
  2379				bus-range = <0x00 0xff>;
  2380				linux,pci-domain = <2>;
  2381				pextpcfg = <&pextp1cfg_ao_clk>;
  2382				ranges = <0x82000000 0 0x70000000 0x0 0x70000000 0 0x8000000>;
  2383	
  2384				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_PL_P_PCIE>,
  2385					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_TL_PCIE>,
  2386					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_REF_PCIE>,
  2387					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AXI_250_PCIE>,
  2388					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AHB_APB_PCIE>,
  2389					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P2_LP_PCIE>;
  2390				clock-names = "pl_250m", "tl_26m", "peri_26m",
  2391					      "peri_mem", "bus", "low_power";
  2392				assigned-clocks = <&cksys_clk CLK_CK_TL_P2_SEL>;
  2393				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  2394	
  2395				resets = <&pextp1ao_rst 2>, <&pextp1ao_rst 3>;
  2396				reset-names = "mac", "phy";
  2397				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC2>;
  2398	
  2399				phys = <&pciephy2>;
  2400				phy-names = "pcie-phy";
  2401	
  2402				status = "disabled";
  2403	
  2404				#interrupt-cells = <1>;
  2405				interrupt-map-mask = <0 0 0 7>;
  2406				interrupt-map = <0 0 0 1 &pcie_intc2 0>,
  2407						<0 0 0 2 &pcie_intc2 1>,
  2408						<0 0 0 3 &pcie_intc2 2>,
  2409						<0 0 0 4 &pcie_intc2 3>;
  2410	
  2411				pcie_intc2: interrupt-controller {
  2412					interrupt-controller;
  2413					#address-cells = <0>;
  2414					#interrupt-cells = <1>;
  2415				};
  2416			};
  2417	
  2418			pextp0cfg_ao_clk: syscon@169b0000 {
  2419				/* TODO: Fix compatible in driver */
  2420				compatible = "mediatek,mt8196-pextp0cfg-ao", "mediatek,mt8196-pextp0cfg_ao", "syscon", "simple-mfd";
  2421				reg = <0 0x169b0000 0 0x1000>;
  2422				#clock-cells = <1>;
  2423	
  2424				pextp0ao_rst: reset-controller {
  2425					compatible = "ti,syscon-reset";
  2426					#reset-cells = <1>;
  2427	
  2428					ti,reset-bits = <
  2429						/* 0: PCIe0 MAC reset */
  2430						0x8  0 0xc  0 0 0
  2431						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2432						/* 1: PCIe0 PHY reset */
  2433						0x8  1 0xc  1 0 0
  2434						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2435						>;
  2436				};
  2437			};
  2438	
  2439			pextp1cfg_ao_clk: syscon@169e0000 {
  2440				/* TODO: Fix compatible in driver */
  2441				compatible = "mediatek,mt8196-pextp1cfg-ao", "mediatek,mt8196-pextp1cfg_ao", "syscon", "simple-mfd";
  2442				reg = <0 0x169e0000 0 0x1000>;
  2443				#clock-cells = <1>;
  2444	
  2445				pextp1ao_rst: reset-controller {
  2446					compatible = "ti,syscon-reset";
  2447					#reset-cells = <1>;
  2448	
  2449					ti,reset-bits = <
  2450						/* 0: PCIe1 MAC reset */
  2451						0x8  0 0xc  0 0 0
  2452						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2453						/* 1: PCIe1 PHY reset */
  2454						0x8  1 0xc  1 0 0
  2455						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2456						/* 2: PCIe2 MAC reset */
  2457						0x8  8 0xc  8 0 0
  2458						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2459						/* 3: PCIe2 PHY reset */
  2460						0x8  9 0xc  9 0 0
  2461						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2462						>;
  2463				};
  2464			};
  2465	
  2466			ssr_top_clk: syscon@18000000 {
  2467				/* TODO: Fix compatible in driver */
  2468				compatible = "mediatek,mt8196-ssr-top", "mediatek,mt8196-ssr_top", "syscon";
  2469				reg = <0 0x18000000 0 0x1000>;
  2470				hw-voter-regmap = <&hwv>;
  2471				#clock-cells = <1>;
  2472			};
  2473	
  2474			devapc_apinfra_ssr: devapc@180f3000 {
  2475				compatible = "mediatek,mt8196-devapc";
  2476				reg = <0 0x180f3000 0 0x1000>;
  2477				vio-idx-num = <39>;
  2478				interrupts = <GIC_SPI 866 IRQ_TYPE_LEVEL_HIGH 0>;
  2479			};
  2480	
  2481			adsp: adsp@1a000000 {
  2482				compatible = "mediatek,mt8196-dsp";
  2483				reg = <0 0x1a000000 0 0x5000>,
  2484				      <0 0x1a210000 0 0x80000>,
  2485				      <0 0x1a345000 0 0x300>,
  2486				      <0 0x1a00f000 0 0x1000>;
  2487				reg-names = "cfg", "sram", "sec", "bus";
  2488				interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH 0>;
  2489				interrupt-names = "wdt";
  2490				power-domains = <&scpsys MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;
  2491				clocks = <&cksys_clk CLK_CK_ADSP_SEL>,
  2492					 <&cksys_clk CLK_CK_TCK_26M_MX9>,
  2493					 <&cksys_clk CLK_CK_ADSPPLL>;
  2494				clock-names = "clk_top_adsp_sel",
  2495					      "clk_top_clk26m",
  2496					      "clk_top_adsppll";
  2497				mbox-names = "rx", "tx";
  2498				mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
  2499				status = "disabled";
  2500			};
  2501	
  2502			devapc_adsp: devapc@1a019000 {
  2503				compatible = "mediatek,mt8196-devapc";
  2504				reg = <0 0x1a019000 0 0x1000>;
  2505				vio-idx-num = <54>;
  2506				interrupts = <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH 0>;
  2507			};
  2508	
  2509			afe_clk: syscon@1a110000 {
  2510				compatible = "mediatek,mt8196-audiosys", "syscon";
  2511				reg = <0 0x1a110000 0 0x1000>;
  2512				#clock-cells = <1>;
  2513				power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
  2514			};
  2515	
  2516			afe: mt8196-afe-pcm@1a110000 {
  2517				compatible = "mediatek,mt8196-sound";
  2518				reg = <0 0x1a110000 0 0x9000>;
  2519				interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
  2520				cksys = <&cksys_clk>;
  2521				vlpcksys = <&vlp_cksys_clk>;
  2522				power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
  2523				clocks = <&afe_clk CLK_AFE_AUDIO_HOPPING_AFE>,
  2524					<&afe_clk CLK_AFE_AUDIO_F26M_AFE>,
  2525					<&afe_clk CLK_AFE_UL0_ADC_AFE>,
  2526					<&afe_clk CLK_AFE_UL0_ADC_HIRES_AFE>,
  2527					<&afe_clk CLK_AFE_UL1_ADC_AFE>,
  2528					<&afe_clk CLK_AFE_UL1_ADC_HIRES_AFE>,
  2529					<&afe_clk CLK_AFE_APLL1_AFE>,
  2530					<&afe_clk CLK_AFE_APLL2_AFE>,
  2531					<&afe_clk CLK_AFE_APLL_TUNER1_AFE>,
  2532					<&afe_clk CLK_AFE_APLL_TUNER2_AFE>,
  2533					<&vlp_cksys_clk CLK_VLP_CK_AUD_INTBUS_SEL>,
  2534					<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN1_SEL>,
  2535					<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN2_SEL>,
  2536					<&vlp_cksys_clk CLK_VLP_CK_AUDIO_H_SEL>,
  2537					<&vlp_cksys_clk CLK_VLP_CK_CLKSQ>,
  2538					<&cksys_clk CLK_CK_MAINPLL_D4_D4>,
  2539					<&cksys_clk CLK_CK_AUD_1_SEL>,
  2540					<&cksys_clk CLK_CK_APLL1>,
  2541					<&cksys_clk CLK_CK_AUD_2_SEL>,
  2542					<&cksys_clk CLK_CK_APLL2>,
  2543					<&cksys_clk CLK_CK_APLL1_D4>,
  2544					<&cksys_clk CLK_CK_APLL2_D4>,
  2545					<&cksys_clk CLK_CK_APLL_I2SIN0_MCK_SEL>,
  2546					<&cksys_clk CLK_CK_APLL_I2SIN1_MCK_SEL>,
  2547					<&cksys_clk CLK_CK_APLL_FMI2S_MCK_SEL>,
  2548					<&cksys_clk CLK_CK_APLL_TDMOUT_MCK_SEL>,
  2549					<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN0>,
  2550					<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN1>,
  2551					<&cksys_clk CLK_CK_APLL12_CK_DIV_FMI2S>,
  2552					<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_M>,
  2553					<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_B>,
  2554					<&cksys_clk CLK_CK_ADSP_SEL>,
  2555					<&cksys_clk CLK_CK_TCK_26M_MX9>;
  2556	
  2557				clock-names = "aud_hopping_clk",
  2558					"aud_f26m_clk",
  2559					"aud_ul0_adc_clk",
  2560					"aud_ul0_adc_hires_clk",
  2561					"aud_ul1_adc_clk",
  2562					"aud_ul1_adc_hires_clk",
  2563					"aud_apll1_clk",
  2564					"aud_apll2_clk",
  2565					"aud_apll_tuner1_clk",
  2566					"aud_apll_tuner2_clk",
  2567					"vlp_mux_audio_int",
  2568					"vlp_mux_aud_eng1",
  2569					"vlp_mux_aud_eng2",
  2570					"vlp_mux_audio_h",
  2571					"vlp_clk26m_clk",
  2572					"ck_mainpll_d4_d4",
  2573					"ck_mux_aud_1",
  2574					"ck_apll1_ck",
  2575					"ck_mux_aud_2",
  2576					"ck_apll2_ck",
  2577					"ck_apll1_d4",
  2578					"ck_apll2_d4",
  2579					"ck_i2sin0_m_sel",
  2580					"ck_i2sin1_m_sel",
  2581					"ck_fmi2s_m_sel",
  2582					"ck_tdmout_m_sel",
  2583					"ck_apll12_div_i2sin0",
  2584					"ck_apll12_div_i2sin1",
  2585					"ck_apll12_div_fmi2s",
  2586					"ck_apll12_div_tdmout_m",
  2587					"ck_apll12_div_tdmout_b",
  2588					"ck_adsp_sel",
  2589					"ck_clk26m_clk";
  2590				pinctrl-names = "aud-clk-mosi-off",
  2591					"aud-clk-mosi-on",
  2592					"aud-dat-mosi-off",
  2593					"aud-dat-mosi-on",
  2594					"aud-dat-mosi-ch34-off",
  2595					"aud-dat-mosi-ch34-on",
  2596					"aud-dat-miso0-off",
  2597					"aud-dat-miso0-on",
  2598					"aud-dat-miso1-off",
  2599					"aud-dat-miso1-on",
  2600					"aud-gpio-i2sin0-off",
  2601					"aud-gpio-i2sin0-on",
  2602					"aud-gpio-i2sout0-off",
  2603					"aud-gpio-i2sout0-on",
  2604					"aud-gpio-i2sin1-off",
  2605					"aud-gpio-i2sin1-on",
  2606					"aud-gpio-i2sout1-off",
  2607					"aud-gpio-i2sout1-on",
  2608					"aud-gpio-i2sin4-off",
  2609					"aud-gpio-i2sin4-on",
  2610					"aud-gpio-i2sout4-off",
  2611					"aud-gpio-i2sout4-on",
  2612					"aud-gpio-i2sin6-off",
  2613					"aud-gpio-i2sin6-on",
  2614					"aud-gpio-i2sout6-off",
  2615					"aud-gpio-i2sout6-on",
  2616					"aud-dat-miso-only-off",
  2617					"aud-dat-miso-only-on",
  2618					"aud-gpio-ap-dmic-off",
  2619					"aud-gpio-ap-dmic-on",
  2620					"aud-gpio-ap-dmic1-off",
  2621					"aud-gpio-ap-dmic1-on",
  2622					"aud-gpio-i2sin3-off",
  2623					"aud-gpio-i2sin3-on",
  2624					"aud-gpio-i2sout3-off",
  2625					"aud-gpio-i2sout3-on";
  2626	
  2627				pinctrl-0 = <&aud_clk_mosi_off>;
  2628				pinctrl-1 = <&aud_clk_mosi_on>;
  2629				pinctrl-2 = <&aud_dat_mosi_off>;
  2630				pinctrl-3 = <&aud_dat_mosi_on>;
  2631				pinctrl-4 = <&aud_dat_mosi_ch34_off>;
  2632				pinctrl-5 = <&aud_dat_mosi_ch34_on>;
  2633				pinctrl-6 = <&aud_dat_miso0_off>;
  2634				pinctrl-7 = <&aud_dat_miso0_on>;
  2635				pinctrl-8 = <&aud_dat_miso1_off>;
  2636				pinctrl-9 = <&aud_dat_miso1_on>;
  2637				pinctrl-10 = <&aud_gpio_i2sin0_off>;
  2638				pinctrl-11 = <&aud_gpio_i2sin0_on>;
  2639				pinctrl-12 = <&aud_gpio_i2sout0_off>;
  2640				pinctrl-13 = <&aud_gpio_i2sout0_on>;
  2641				pinctrl-14 = <&aud_gpio_i2sin1_off>;
  2642				pinctrl-15 = <&aud_gpio_i2sin1_on>;
  2643				pinctrl-16 = <&aud_gpio_i2sout1_off>;
  2644				pinctrl-17 = <&aud_gpio_i2sout1_on>;
  2645				pinctrl-18 = <&aud_gpio_i2sin4_off>;
  2646				pinctrl-19 = <&aud_gpio_i2sin4_on>;
  2647				pinctrl-20 = <&aud_gpio_i2sout4_off>;
  2648				pinctrl-21 = <&aud_gpio_i2sout4_on>;
  2649				pinctrl-22 = <&aud_gpio_i2sin6_off>;
  2650				pinctrl-23 = <&aud_gpio_i2sin6_on>;
  2651				pinctrl-24 = <&aud_gpio_i2sout6_off>;
  2652				pinctrl-25 = <&aud_gpio_i2sout6_on>;
  2653				pinctrl-26 = <&aud_dat_miso_only_off>;
  2654				pinctrl-27 = <&aud_dat_miso_only_on>;
  2655				pinctrl-28 = <&aud_gpio_ap_dmic_off>;
  2656				pinctrl-29 = <&aud_gpio_ap_dmic_on>;
  2657				pinctrl-30 = <&aud_gpio_ap_dmic1_off>;
  2658				pinctrl-31 = <&aud_gpio_ap_dmic1_on>;
  2659				pinctrl-32 = <&aud_gpio_i2sin3_off>;
  2660				pinctrl-33 = <&aud_gpio_i2sin3_on>;
  2661				pinctrl-34 = <&aud_gpio_i2sout3_off>;
  2662				pinctrl-35 = <&aud_gpio_i2sout3_on>;
  2663	
  2664				/* Only for ETDM in/out 4 */
  2665				etdm-out-ch = <2>;
  2666				etdm-in-ch = <2>;
  2667				etdm-out-sync = <0>; /* 0: disable; 1: enable */
  2668				etdm-in-sync = <1>; /* 0: disable; 1: enable */
  2669				etdm-ip-mode = <0>; /* 0: One IP multi-channel 1: Multi-IP 2-channel */
  2670				status = "disabled";
  2671			};
  2672	
  2673			adsp_mailbox0: mailbox@1a350000 {
  2674				compatible = "mediatek,mt8196-adsp-mbox",
  2675					     "mediatek,mt8186-adsp-mbox";
  2676				reg = <0 0x1a350100 0 0x1000>;
  2677				interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH 0>;
  2678				#mbox-cells = <0>;
  2679			};
  2680	
  2681			adsp_mailbox1: mailbox@1a360000 {
  2682				compatible = "mediatek,mt8196-adsp-mbox",
  2683					     "mediatek,mt8186-adsp-mbox";
  2684				reg = <0 0x1a360100 0 0x1000>;
  2685				interrupts = <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH 0>;
  2686				#mbox-cells = <0>;
  2687			};
  2688	
  2689			scpsys: power-controller@1c004000 {
  2690				compatible = "mediatek,mt8196-scpsys-hwv", "syscon";
  2691				reg = <0 0x1c004000 0 0x1000>;
  2692				#power-domain-cells = <1>;
  2693				apifrbus-ao-io-reg-bus = <&ifr_bus>;
  2694				spm = <&scpsys_bus>;
  2695				hw-voter-regmap = <&hwv>;
  2696			};
  2697	
  2698			scpsys_bus: syscon@1c00d000 {
  2699				compatible = "mediatek,mt8196-scpsys-bus", "syscon";
  2700				reg = <0 0x1c00d000 0 0x1000>;
  2701			};
  2702	
  2703			watchdog: watchdog@1c010000 {
  2704				compatible = "mediatek,mt8196-wdt",
  2705						"mediatek,mt6589-wdt",
  2706						"syscon", "simple-mfd";
  2707				reg = <0 0x1c010000 0 0x1000>;
  2708			};
  2709	
  2710			dvfsrc: dvfsrc@1c013000 {
  2711				compatible = "mediatek,mt8196-dvfsrc";
  2712				reg = <0 0x1c013000 0 0x1000>,
  2713					<0 0x1c004000 0 0x1000>;
  2714				reg-names = "dvfsrc", "spm";
  2715				#interconnect-cells = <1>;
  2716	
  2717				dvfsrc_vcore: dvfsrc-vcore {
  2718					regulator-name = "dvfsrc-vcore";
  2719					regulator-min-microvolt = <575000>;
  2720					regulator-max-microvolt = <875000>;
  2721					regulator-always-on;
  2722				};
  2723	
  2724				dvfsrc_freq_opp9: opp9 {
  2725					opp-peak-KBps = <0>;
  2726				};
  2727				dvfsrc_freq_opp8: opp8 {
  2728					opp-peak-KBps = <9800000>;
  2729				};
  2730				dvfsrc_freq_opp7: opp7 {
  2731					opp-peak-KBps = <13200000>;
  2732				};
  2733				dvfsrc_freq_opp6: opp6 {
  2734					opp-peak-KBps = <19700000>;
  2735				};
  2736				dvfsrc_freq_opp5: opp5 {
  2737					opp-peak-KBps = <24900000>;
  2738				};
  2739				dvfsrc_freq_opp4: opp4 {
  2740					opp-peak-KBps = <32400000>;
  2741				};
  2742				dvfsrc_freq_opp3: opp3 {
  2743					opp-peak-KBps = <37600000>;
  2744				};
  2745				dvfsrc_freq_opp2: opp2 {
  2746					opp-peak-KBps = <44300000>;
  2747				};
  2748				dvfsrc_freq_opp1: opp1 {
  2749					opp-peak-KBps = <54500000>;
  2750				};
  2751				dvfsrc_freq_opp0: opp0 {
  2752					opp-peak-KBps = <61400000>;
  2753				};
  2754			};
  2755	
  2756			vlp_cksys_clk: syscon@1c016000 {
  2757				/* TODO: Fix compatible in driver */
  2758				compatible = "mediatek,mt8196-vlp-cksys", "mediatek,mt8196-vlp_cksys", "syscon";
  2759				reg = <0 0x1c016000 0 0x1000>;
  2760				hw-voter-regmap = <&hwv>;
  2761				#clock-cells = <1>;
  2762			};
  2763	
  2764			spmi: spmi@1c01a000 {
  2765				compatible = "mediatek,mt8196-spmi";
  2766				reg = <0 0x1c01a000 0 0x0008ff>,
  2767				      <0 0x1c01c000 0 0x000100>,
  2768				      <0 0x1c018000 0 0x0008ff>,
  2769				      <0 0x1c01c800 0 0x000100>;
  2770				reg-names = "pmif", "spmimst","pmif-p","spmimst-p";
  2771				interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>,
  2772						      <&pio 292 IRQ_TYPE_LEVEL_HIGH>,
  2773						      <&gic GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH 0>,
  2774						      <&gic GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH 0>,
  2775						      <&gic GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH 0>,
  2776						      <&gic GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH 0>;
  2777				interrupt-names = "rcs_irq","rcs_irq_p","pmif_irq","spmi_nack_irq","pmif_p_irq","spmi_p_nack_irq";
  2778				interrupt-controller;
  2779				#interrupt-cells = <1>;
  2780				irq-event-en = <0x0 0x0 0x0 0x0 0x0>;
  2781				spmi-dev-mask = <0x85c0>;
  2782				#address-cells = <2>;
  2783				#size-cells = <0>;
  2784			};
  2785	
  2786			devapc_vlp: devapc@1c032000 {
  2787				compatible = "mediatek,mt8196-devapc";
  2788				reg = <0 0x1c032000 0 0x1000>;
  2789				vio-idx-num = <101>;
  2790				interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
  2791			};
  2792	
  2793			sram@1c350000 {
  2794				compatible = "mmio-sram";
  2795				reg = <0x0 0x1c350000 0x0 0x80>;
  2796	
  2797				#address-cells = <1>;
  2798				#size-cells = <1>;
  2799				ranges = <0 0x0 0x1c350000 0x80>;
  2800	
  2801				scmi_tx_shmem: mailbox-sram@0 {
  2802					compatible = "arm,scmi-shmem";
  2803					reg = <0x0 0x80>;
  2804				};
  2805			};
  2806	
  2807			tinysys_mbox: mailbox@1c351000 {
  2808				compatible = "mediatek,tinysys_mbox";
  2809				reg = <0 0x1c351000 0 0x1000>,
  2810				      <0 0x1c361000 0 0x1000>;
  2811				/* for profiling */
  2812				shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
  2813				interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH 0>,
  2814					     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH 0>;
  2815				#mbox-cells = <1>;
  2816				/* notify spm clr */
  2817				secure-sspm-md2spm-clr = <1>;
  2818			};
  2819	
  2820			sram@1c360000 {
  2821				compatible = "mmio-sram";
  2822				reg = <0x0 0x1c360000 0x0 0x80>;
  2823	
  2824				#address-cells = <1>;
  2825				#size-cells = <1>;
  2826				ranges = <0 0x0 0x1c360000 0x80>;
  2827	
  2828				scmi_rx_shmem: mailbox-sram@0 {
  2829					compatible = "arm,scmi-shmem";
  2830					reg = <0x0 0x80>;
  2831				};
  2832			};
  2833	
  2834			systimer: systimer@1c400000 {
  2835				compatible = "mediatek,mt8196-timer",
  2836					     "mediatek,mt6765-timer";
  2837				reg = <0 0x1c400000 0 0x1000>;
  2838				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH 0>;
  2839				clocks = <&clk13m>;
  2840			};
  2841	
  2842			smi_disp_common: smi-comm@30020000 {
  2843				compatible = "mediatek,mt8196-smi-common";
  2844				reg = <0 0x30020000 0 0x1000>;
  2845				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2846				mediatek,smi = <&disp_ssc0_smi_2x1_sub_comm>;
  2847				mediatek,common-id = <0>;
  2848				mediatek,skip-rpm-cb;
  2849			};
  2850	
  2851			smi_mdp_common: smi-comm@30021000 {
  2852				compatible = "mediatek,mt8196-smi-common";
  2853				reg = <0 0x30021000 0 0x1000>;
  2854				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2855				mediatek,smi = <&mdp_ssc4_smi_2x1_sub_comm>;
  2856				mediatek,common-id = <1>;
  2857				mediatek,skip-rpm-cb;
  2858			};
  2859	
  2860			devapc_mminfra: devapc@30040000 {
  2861				compatible = "mediatek,mt8196-devapc";
  2862				reg = <0 0x30040000 0 0x1000>;
  2863				vio-idx-num = <699>;
  2864				interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
  2865			};
  2866	
  2867			gce0: gce@300c0000 {
  2868				compatible = "mediatek,mt8196-gce";
  2869				reg = <0 0x300c0000 0 0x80000>;
  2870				interrupts = <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH 0>;
  2871				#mbox-cells = <2>;
  2872				iommus = <&mm_smmu 199>;
  2873				mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
  2874				mediatek,gce-events = <CMDQ_SYNC_SECURE_THR_EOF>;
  2875			};
  2876	
  2877			gce1: gce@30140000 {
  2878				compatible = "mediatek,mt8196-gce";
  2879				reg = <0 0x30140000 0 0x80000>;
  2880				interrupts = <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH 0>;
  2881				#mbox-cells = <2>;
  2882				iommus = <&mm_smmu 183>;
  2883			};
  2884	
  2885			mm_smmu: iommu@30800000 {
  2886				compatible = "mediatek,mt8196-mm-smmu", "arm,smmu-v3";
  2887				reg = <0 0x30800000 0 0x1e0000>;
  2888				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>;
  2889				interrupt-names = "combined";
  2890				#iommu-cells = <1>;
  2891			};
  2892	
  2893			disp_ssc0_smi_2x1_sub_comm: smi-comm@30a30000 {
  2894				compatible = "mediatek,mt8196-smi-common";
  2895				reg = <0 0x30a30000 0 0x1000>;
  2896				mediatek,common-id = <3>;
  2897				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2898				mediatek,skip-rpm-cb;
  2899			};
  2900	
  2901			disp_ssc1_smi_2x1_sub_comm: smi-comm@30a31000 {
  2902				compatible = "mediatek,mt8196-smi-common";
  2903				reg = <0 0x30a31000 0 0x1000>;
  2904				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2905				mediatek,common-id = <4>;
  2906				mediatek,skip-rpm-cb;
  2907			};
  2908	
  2909			mdp_ssc4_smi_2x1_sub_comm: smi-comm@30a32000 {
  2910				compatible = "mediatek,mt8196-smi-common";
  2911				reg = <0 0x30a32000 0 0x1000>;
  2912				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2913				mediatek,common-id = <5>;
  2914				mediatek,skip-rpm-cb;
  2915			};
  2916	
  2917			mdp_ssc5_smi_2x1_sub_comm: smi-comm@30a33000 {
  2918				compatible = "mediatek,mt8196-smi-common";
  2919				reg = <0 0x30a33000 0 0x1000>;
  2920				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2921				mediatek,common-id = <6>;
  2922				mediatek,skip-rpm-cb;
  2923			};
  2924	
  2925			vcp: vcp@31800000 {
  2926				compatible = "mediatek,vcp";
  2927				reg = <0 0x31800000 0 0x60000>, /* sram */
  2928				      <0 0x31a04000 0 0xa000>, /* cfg */
  2929				      <0 0x31bd0000 0 0x1000>, /* cfg core */
  2930				      <0 0x31b80000 0 0x50000>, /* mbox base */
  2931				      <0 0x31a70020 0 0x100>, /* mbox init */
  2932				      <0 0x1c00091c 0 0x4>; /* vcp rdy */
  2933				reg-names = "sram",
  2934					    "cfg",
  2935					    "cfg_core",
  2936					    "mbox_base",
  2937					    "mbox_init",
  2938					    "vcp_vlp_ao_rsvd7";
  2939	
  2940				interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>,
  2941					     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>,
  2942					     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH 0>,
  2943					     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>,
  2944					     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH 0>,
  2945					     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
  2946				interrupt-names = "wdt",
  2947						  "mbox0",
  2948						  "mbox1",
  2949						  "mbox2",
  2950						  "mbox3",
  2951						  "mbox4";
  2952	
  2953				power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
  2954				iommus = <&mm_smmu 160>;
  2955				memory-region = <&vcp_resv_mem>;
  2956	
  2957				vcp-mem-tbl = <0 0x1a00000>, /* VCP_RTOS_MEM_ID 26MB */
  2958					      <1 0x30000>, /* VDEC_MEM_ID 192KB */
  2959					      <2 0x12000>, /* VENC_MEM_ID 72KB */
  2960					      <3 0x1000>; /* LOGGER 4KB*/
  2961	
  2962				vcp@0 {
  2963					compatible = "mediatek,vcp-core";
  2964					twohart = <1>;
  2965					sram-offset = <0x0>;
  2966				};
  2967	
  2968				vcp@31000 {
  2969					compatible = "mediatek,mmup-core";
  2970					twohart = <0>;
  2971					sram-offset = <0x031000>;
  2972				};
  2973	
  2974				send_table: mtk-send-table {
  2975					mbox0-0 {
  2976						mbox-id = <0>;
  2977						chan-id = <0>;
  2978						msg-size = <18>;
  2979					};
  2980					mbox1-15 {
  2981						mbox-id = <1>;
  2982						chan-id = <15>;
  2983						msg-size = <8>;
  2984					};
  2985					mbox1-16 {
  2986						mbox-id = <1>;
  2987						chan-id = <16>;
  2988						msg-size = <18>;
  2989					};
  2990					mbox1-9 {
  2991						mbox-id = <1>;
  2992						chan-id = <9>;
  2993						msg-size = <2>;
  2994					};
  2995					mbox2-11 {
  2996						mbox-id = <2>;
  2997						chan-id = <11>;
  2998						msg-size = <18>;
  2999					};
  3000					mbox2-2 {
  3001						mbox-id = <2>;
  3002						chan-id = <2>;
  3003						msg-size = <2>;
  3004					};
  3005					mbox2-3 {
  3006						mbox-id = <2>;
  3007						chan-id = <3>;
  3008						msg-size = <3>;
  3009					};
  3010					mbox2-32 {
  3011						mbox-id = <2>;
  3012						chan-id = <32>;
  3013						msg-size = <2>;
  3014					};
  3015					mbox3-33 {
  3016						mbox-id = <3>;
  3017						chan-id = <33>;
  3018						msg-size = <2>;
  3019					};
  3020					mbox3-13 {
  3021						mbox-id = <3>;
  3022						chan-id = <13>;
  3023						msg-size = <2>;
  3024					};
  3025					mbox3-35 {
  3026						mbox-id = <3>;
  3027						chan-id = <35>;
  3028						msg-size = <2>;
  3029					};
  3030					mbox4-20 {
  3031						mbox-id = <4>;
  3032						chan-id = <20>;
  3033						msg-size = <2>;
  3034					};
  3035					mbox4-21 {
  3036						mbox-id = <4>;
  3037						chan-id = <21>;
  3038						msg-size = <3>;
  3039					};
  3040					mbox4-23 {
  3041						mbox-id = <4>;
  3042						chan-id = <23>;
  3043						msg-size = <2>;
  3044					};
  3045				};
  3046	
  3047				recv_table: mtk-recv-table {
  3048					mbox0-1 {
  3049						mbox-id = <0>;
  3050						chan-id = <1>;
  3051						msg-size = <18>;
  3052						recv-opt = <0>;
  3053					};
  3054					mbox1-15 {
  3055						mbox-id = <1>;
  3056						chan-id = <15>;
  3057						msg-size = <8>;
  3058						recv-opt = <1>;
  3059					};
  3060					mbox1-17 {
  3061						mbox-id = <1>;
  3062						chan-id = <17>;
  3063						msg-size = <18>;
  3064						recv-opt = <0>;
  3065					};
  3066					mbox1-10 {
  3067						mbox-id = <1>;
  3068						chan-id = <10>;
  3069						msg-size = <2>;
  3070						recv-opt = <0>;
  3071					};
  3072					mbox2-12 {
  3073						mbox-id = <2>;
  3074						chan-id = <12>;
  3075						msg-size = <18>;
  3076						recv-opt = <0>;
  3077					};
  3078					mbox2-5 {
  3079						mbox-id = <2>;
  3080						chan-id = <5>;
  3081						msg-size = <1>;
  3082						recv-opt = <0>;
  3083					};
  3084					mbox2-2 {
  3085						mbox-id = <2>;
  3086						chan-id = <2>;
  3087						msg-size = <1>;
  3088						recv-opt = <1>;
  3089					};
  3090					mbox3-34 {
  3091						mbox-id = <3>;
  3092						chan-id = <34>;
  3093						msg-size = <2>;
  3094						recv-opt = <0>;
  3095					};
  3096					mbox3-14 {
  3097						mbox-id = <3>;
  3098						chan-id = <14>;
  3099						msg-size = <2>;
  3100						recv-opt = <0>;
  3101					};
  3102					mbox4-26 {
  3103						mbox-id = <4>;
  3104						chan-id = <26>;
  3105						msg-size = <1>;
  3106						recv-opt = <0>;
  3107					};
  3108					mbox4-20 {
  3109						mbox-id = <4>;
  3110						chan-id = <20>;
  3111						msg-size = <1>;
  3112						recv-opt = <1>;
  3113					};
  3114				};
  3115			};
  3116	
  3117			mminfra_hwv: syscon@31a80000 {
  3118				/* TODO: Fix compatible in driver */
  3119				compatible = "mediatek,mt8196-mminfra-hwv", "mediatek,mt8196-mminfra_hwv", "syscon";
  3120				reg = <0 0x31a80000 0 0x1000>;
  3121			};
  3122	
  3123			devapc_mmup: devapc@31ad5000 {
  3124				compatible = "mediatek,mt8196-devapc";
  3125				reg = <0 0x31ad5000 0 0x1000>;
  3126				vio-idx-num = <71>;
  3127				interrupts = <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH 0>;
  3128			};
  3129	
  3130			mm_hwv: syscon@31b00000 {
  3131				/* TODO: Fix compatible in driver */
  3132				compatible = "mediatek,mt8196-mm-hwv", "mediatek,mt8196-mm_hwv", "syscon";
  3133				reg = <0 0x31b00000 0 0x3000>;
  3134			};
  3135	
  3136			hfrpsys: power-controller@31b50000 {
  3137				compatible = "mediatek,mt8196-hfrpsys-hwv", "syscon";
  3138				reg = <0 0x31b50000 0 0x1000>;
  3139				#power-domain-cells = <1>;
  3140				mmpc = <&hfrpsys>;
  3141				mm-hw-ccf-regmap = <&mm_hwv>;
  3142				mminfra-hwv-regmap = <&mminfra_hwv>;
  3143			};
  3144	
  3145			dispsys_config_clk: syscon@32000000 {
  3146				compatible = "mediatek,mt8196-dispsys0", "syscon";
  3147				reg = <0 0x32000000 0 0x1000>;
  3148				mm-hw-ccf-regmap = <&mm_hwv>;
  3149				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
  3150				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
  3151				#clock-cells = <1>;
  3152	
  3153				async {
  3154					clocks = <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC0_DISP>,
  3155						 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC1_DISP>,
  3156						 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC8_DISP>,
  3157						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC1_DISP>,
  3158						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC2_DISP>,
  3159						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC3_DISP>;
  3160				};
  3161	
  3162				top {
  3163					clocks = <&dispsys_config_clk CLK_MM_CONFIG_DISP>;
  3164				};
  3165			};
  3166	
  3167			disp0_mutex: mutex@32020000 {
  3168				compatible = "mediatek,mt8196-disp-mutex";
  3169				reg = <0 0x32020000 0 0x1000>;
  3170				clocks = <&dispsys_config_clk CLK_MM_DISP_MUTEX0_DISP>;
  3171				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
  3172						      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
  3173			};
  3174	
  3175			disp_ccorr0: disp-ccorr@32090000 {
  3176				compatible = "mediatek,mt8196-disp-ccorr";
  3177				reg = <0 0x32090000 0 0x1000>;
  3178				clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR0_PQ>;
  3179			};
  3180	
  3181			disp_ccorr1: disp-ccorr@320a0000 {
  3182				compatible = "mediatek,mt8196-disp-ccorr";
  3183				reg = <0 0x320a0000 0 0x1000>;
  3184				clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR1_PQ>;
  3185			};
  3186	
  3187			disp_dither0: disp-dither@32110000 {
  3188				compatible = "mediatek,mt8196-disp-dither",
  3189					     "mediatek,mt8183-disp-dither";
  3190				reg = <0 0x32110000 0 0x1000>;
  3191				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
  3192				clocks = <&dispsys_config_clk CLK_MM_DISP_DITHER0_PQ>;
  3193			};
  3194	
  3195			disp_gamma0: disp-gamma@32130000 {
  3196				compatible = "mediatek,mt8196-disp-gamma",
  3197					     "mediatek,mt8195-disp-gamma";
  3198				reg = <0 0x32130000 0 0x1000>;
  3199				clocks = <&dispsys_config_clk CLK_MM_DISP_GAMMA0_PQ>;
  3200			};
  3201	
  3202			disp_tdshp0: disp-tdshp@321e0000 {
  3203				compatible = "mediatek,mt8196-disp-tdshp";
  3204				reg = <0 0x321e0000 0 0x1000>;
  3205				clocks = <&dispsys_config_clk CLK_MM_DISP_TDSHP0_PQ>;
  3206			};
  3207	
  3208			disp_postmask0: postmask@32180000 {
  3209				compatible = "mediatek,mt8196-disp-postmask",
  3210					     "mediatek,mt8192-disp-postmask";
  3211				reg = <0 0x32180000 0 0x1000>;
  3212				clocks = <&dispsys_config_clk CLK_MM_DISP_POSTMASK0_DISP>;
  3213			};
  3214	
  3215			disp_mdp_rsz0: mdp-rsz@321a0000 {
  3216				compatible = "mediatek,mt8196-disp-mdp-rsz";
  3217				reg = <0 0x321a0000 0 0x1000>;
  3218				clocks = <&dispsys_config_clk CLK_MM_MDP_RSZ0_DISP>;
  3219			};
  3220	
  3221			smi_larb32: larb@32240000 {
  3222				compatible = "mediatek,mt8196-smi-larb";
  3223				reg = <0 0x32240000 0 0x1000>;
  3224				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
  3225				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3226					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3227				clock-names = "apb", "smi";
  3228				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3229				mediatek,larb-id = <32>;
  3230				larb-port-real-time-type = <1 1 1 1 0 0 0 0 1 0>;
  3231			};
  3232	
  3233			dispsys1_config_clk: syscon@32400000 {
  3234				compatible = "mediatek,mt8196-dispsys1", "syscon";
  3235				reg = <0 0x32400000 0 0x1000>;
  3236				mm-hw-ccf-regmap = <&mm_hwv>;
  3237				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
  3238				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
  3239				#clock-cells = <1>;
  3240	
  3241				async {
  3242					clocks = <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC21_DISP>,
  3243						 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC22_DISP>,
  3244						 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC23_DISP>;
  3245				};
  3246	
  3247				top {
  3248					clocks = <&dispsys1_config_clk CLK_MM1_DISPSYS1_CONFIG_DISP>;
  3249					clock-names = "dispsys1_config";
  3250				};
  3251			};
  3252	
  3253			disp1_mutex: mutex@32420000 {
  3254				compatible = "mediatek,mt8196-disp-mutex";
  3255				reg = <0 0x32420000 0 0x1000>;
  3256				clocks = <&dispsys1_config_clk CLK_MM1_DISP_MUTEX0_DISP>;
  3257			};
  3258	
  3259			dp_intf0: dp-intf@32430000 {
  3260				compatible = "mediatek,mt8196-dp-intf";
  3261				reg = <0 0x32430000 0 0x1000>;
  3262				interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>;
  3263				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF0>,
  3264					 <&dispsys1_config_clk CLK_MM1_MOD4>,
  3265					 <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
  3266					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D4>,
  3267					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D8>,
  3268					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D16>,
  3269					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL1>,
  3270					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  3271				clock-names = "hf_fmm_ck",
  3272					      "hf_fdp_ck",
  3273					      "mux_dp",
  3274					      "tvdpll_d4",
  3275					      "tvdpll_d8",
  3276					      "tvdpll_d16",
  3277					      "dpi_ck",
  3278					      "dpi_26m";
  3279				num = <0>;
  3280				phys = <&dp_tx>;
  3281				phy-names = "dp_tx";
  3282			};
  3283	
  3284			dp_intf1: dp-intf@32440000 {
  3285				compatible = "mediatek,mt8196-dp-intf";
  3286				reg = <0 0x32440000 0 0x1000>;
  3287				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
  3288				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF1>,
  3289					 <&dispsys1_config_clk CLK_MM1_MOD5>,
  3290					 <&cksys_gp2_clk CLK_CK2_DP1_SEL>,
  3291					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D4>,
  3292					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D8>,
  3293					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D16>,
  3294					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL2>,
  3295					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  3296				clock-names = "hf_fmm_ck",
  3297					      "hf_fdp_ck",
  3298					      "mux_dp",
  3299					      "tvdpll_d4",
  3300					      "tvdpll_d8",
  3301					      "tvdpll_d16",
  3302					      "dpi_ck",
  3303					      "dpi_26m";
  3304				num = <1>;
  3305				no-next-bridge;
  3306				phys = <&dp_tx>;
  3307				phy-names = "dp_tx";
  3308				status = "disabled";
  3309			};
  3310	
  3311			disp_dsc0: disp-dsc0-wrap0@32450000 {
  3312				compatible = "mediatek,mt8196-disp-dsc";
  3313				reg = <0 0x32450000 0 0x1000>;
  3314				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP0>;
  3315			};
  3316	
  3317			disp_dsc1: disp-dsc1-wrap1@32460000 {
  3318				compatible = "mediatek,mt8196-disp-dsc";
  3319				reg = <0 0x32460000 0 0x1000>;
  3320				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP1>;
  3321			};
  3322	
  3323			dsi0: dsi@32490000 {
  3324				compatible = "mediatek,mt8196-dsi";
  3325				reg = <0 0x32490000 0 0x1000>;
  3326				interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH 0>;
  3327				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSI0_DISP>,
  3328					 <&dispsys1_config_clk CLK_MM1_MOD1_DISP>,
  3329					 <&mipi_tx_config0>;
  3330				clock-names = "engine", "digital", "hs";
  3331				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DSI_PHY0>;
  3332				phys = <&mipi_tx_config0>;
  3333				phy-names = "dphy";
  3334				status = "disabled";
  3335			};
  3336	
  3337			disp_dvo0: disp-dvo0@324c0000 {
  3338				compatible = "mediatek,mt8196-edp-dvo";
  3339				reg = <0 0x324c0000 0 0x1000>;
  3340				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
  3341				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DVO0_DISP>,
  3342					 <&cksys_gp2_clk CLK_CK2_DVO_SEL>,
  3343					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL3>,
  3344					 <&dispsys1_config_clk CLK_MM1_MOD6>;
  3345				clock-names = "engine",
  3346					      "pixel",
  3347					      "pll",
  3348					      "hf_fdvo_clk";
  3349				status = "disabled";
  3350			};
  3351	
  3352			smi_larb33: larb@32600000 {
  3353				compatible = "mediatek,mt8196-smi-larb";
  3354				reg = <0 0x32600000 0 0x1000>;
  3355				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
  3356				clocks = <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>,
  3357					 <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>;
  3358				clock-names = "apb", "smi";
  3359				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3360				mediatek,larb-id = <33>;
  3361				larb-port-real-time-type = <0 1 1 1 0 0 0 1 0 0 0 0 0 0 0 1>;
  3362			};
  3363	
  3364			ovlsys_config_clk: syscon@32800000 {
  3365				/* TODO: Fix compatible in driver */
  3366				compatible = "mediatek,mt8196-ovlsys-config", "mediatek,mt8196-ovlsys_config", "syscon";
  3367				reg = <0 0x32800000 0 0x1000>;
  3368				mm-hw-ccf-regmap = <&mm_hwv>;
  3369				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>,
  3370					 <&gce0 8 CMDQ_THR_PRIO_4>, <&gce0 9 CMDQ_THR_PRIO_4>;
  3371				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3372				#clock-cells = <1>;
  3373	
  3374				async {
  3375					clocks = <&ovlsys_config_clk CLK_OVL_DLO5_DISP>,
  3376						 <&ovlsys_config_clk CLK_OVL_DLO6_DISP>;
  3377				};
  3378			};
  3379	
  3380			ovl0_mutex: mutex@32820000 {
  3381				compatible = "mediatek,mt8196-disp-mutex";
  3382				reg = <0 0x32820000 0 0x1000>;
  3383				clocks = <&ovlsys_config_clk CLK_OVL_MUTEX0_DISP>;
  3384				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
  3385						      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
  3386			};
  3387	
  3388			disp_ovl0_exdma2: dma-controller@32850000 {
  3389				compatible = "mediatek,mt8196-exdma";
  3390				reg = <0 0x32850000 0 0x1000>;
  3391				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA2_DISP>;
  3392				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3393				mediatek,larb = <&smi_larb0>;
  3394				iommus = <&mm_smmu 144>;
  3395				#dma-cells = <1>;
  3396			};
  3397	
  3398			disp_ovl0_exdma3: dma-controller@32860000 {
  3399				compatible = "mediatek,mt8196-exdma";
  3400				reg = <0 0x32860000 0 0x1000>;
  3401				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA3_DISP>;
  3402				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3403				mediatek,larb = <&smi_larb1>;
  3404				#dma-cells = <1>;
  3405			};
  3406	
  3407			disp_ovl0_exdma4: dma-controller@32870000 {
  3408				compatible = "mediatek,mt8196-exdma";
  3409				reg = <0 0x32870000 0 0x1000>;
  3410				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA4_DISP>;
  3411				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3412				mediatek,larb = <&smi_larb20>;
  3413				#dma-cells = <1>;
  3414			};
  3415	
  3416			disp_ovl0_exdma5: dma-controller@32880000 {
  3417				compatible = "mediatek,mt8196-exdma";
  3418				reg = <0 0x32880000 0 0x1000>;
  3419				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA5_DISP>;
  3420				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3421				mediatek,larb = <&smi_larb21>;
  3422				#dma-cells = <1>;
  3423			};
  3424	
  3425			disp_ovl0_exdma6: dma-controller@32890000 {
  3426				compatible = "mediatek,mt8196-exdma";
  3427				reg = <0 0x32890000 0 0x1000>;
  3428				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA6_DISP>;
  3429				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3430				mediatek,larb = <&smi_larb1 SMMU_L1_P3_OVL_RDMA6>;
  3431				#dma-cells = <1>;
  3432			};
  3433	
  3434			disp_ovl0_exdma7: dma-controller@328a0000 {
  3435				compatible = "mediatek,mt8196-exdma";
  3436				reg = <0 0x328a0000 0 0x1000>;
  3437				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA7_DISP>;
  3438				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3439				mediatek,larb = <&smi_larb0>;
  3440				#dma-cells = <1>;
  3441			};
  3442	
  3443			disp_ovl0_exdma8: dma-controller@328b0000 {
  3444				compatible = "mediatek,mt8196-exdma";
  3445				reg = <0 0x328b0000 0 0x1000>;
  3446				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA8_DISP>;
  3447				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3448				mediatek,larb = <&smi_larb21>;
  3449				#dma-cells = <1>;
  3450			};
  3451	
  3452			disp_ovl0_exdma9: dma-controller@328c0000 {
  3453				compatible = "mediatek,mt8196-exdma";
  3454				reg = <0 0x328c0000 0 0x1000>;
  3455				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA9_DISP>;
  3456				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3457				mediatek,larb = <&smi_larb20>;
  3458				#dma-cells = <1>;
  3459			};
  3460	
  3461			disp_ovl0_blender0: blender@328d0000 {
  3462				compatible = "mediatek,mt8196-blender";
  3463				reg = <0 0x328d0000 0 0x1000>;
  3464				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER0_DISP>;
  3465			};
  3466	
  3467			disp_ovl0_blender1: blender@328e0000 {
  3468				compatible = "mediatek,mt8196-blender";
  3469				reg = <0 0x328e0000 0 0x1000>;
  3470				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER1_DISP>;
  3471			};
  3472	
  3473			disp_ovl0_blender2: blender@328f0000 {
  3474				compatible = "mediatek,mt8196-blender";
  3475				reg = <0 0x328f0000 0 0x1000>;
  3476				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER2_DISP>;
  3477			};
  3478	
  3479			disp_ovl0_blender3: blender@32900000 {
  3480				compatible = "mediatek,mt8196-blender";
  3481				reg = <0 0x32900000 0 0x1000>;
  3482				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER3_DISP>;
  3483			};
  3484	
  3485			disp_ovl0_blender4: blender@32910000 {
  3486				compatible = "mediatek,mt8196-blender";
  3487				reg = <0 0x32910000 0 0x1000>;
  3488				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER4_DISP>;
  3489			};
  3490	
  3491			disp_ovl0_blender5: blender@32920000 {
  3492				compatible = "mediatek,mt8196-blender";
  3493				reg = <0 0x32920000 0 0x1000>;
  3494				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER5_DISP>;
  3495			};
  3496	
  3497			disp_ovl0_blender6: blender@32930000 {
  3498				compatible = "mediatek,mt8196-blender";
  3499				reg = <0 0x32930000 0 0x1000>;
  3500				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER6_DISP>;
  3501			};
  3502	
  3503			disp_ovl0_blender7: blender@32940000 {
  3504				compatible = "mediatek,mt8196-blender";
  3505				reg = <0 0x32940000 0 0x1000>;
  3506				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER7_DISP>;
  3507			};
  3508	
  3509			disp_ovl0_blender8: blender@32950000 {
  3510				compatible = "mediatek,mt8196-blender";
  3511				reg = <0 0x32950000 0 0x1000>;
  3512				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER8_DISP>;
  3513			};
  3514	
  3515			disp_ovl0_blender9: blender@32960000 {
  3516				compatible = "mediatek,mt8196-blender";
  3517				reg = <0 0x32960000 0 0x1000>;
  3518				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER9_DISP>;
  3519			};
  3520	
  3521			disp_ovl0_outproc0: outproc@32970000 {
  3522				compatible = "mediatek,mt8196-outproc";
  3523				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC0_DISP>;
  3524				interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH 0>;
  3525				reg = <0 0x32970000 0 0x1000>;
  3526				mediatek,gce-events = <CMDQ_EVENT_OVL0_FRAME_DONE_SEL0>;
  3527				mboxes = <&gce0 3 CMDQ_THR_PRIO_4>;
  3528			};
  3529	
  3530			disp_ovl0_outproc1: outproc@32980000 {
  3531				compatible = "mediatek,mt8196-outproc";
  3532				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC1_DISP>;
  3533				interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH 0>;
  3534				reg = <0 0x32980000 0 0x1000>;
  3535			};
  3536	
  3537			disp_ovl0_outproc2: outproc@32990000 {
  3538				compatible = "mediatek,mt8196-outproc";
  3539				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC2_DISP>;
  3540				reg = <0 0x32990000 0 0x1000>;
  3541			};
  3542	
  3543			disp_ovl0_outproc3: outproc@329a0000 {
  3544				compatible = "mediatek,mt8196-outproc";
  3545				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC3_DISP>;
  3546				reg = <0 0x329a0000 0 0x1000>;
  3547			};
  3548	
  3549			disp_ovl0_outproc4: outproc@329b0000 {
  3550				compatible = "mediatek,mt8196-outproc";
  3551				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC4_DISP>;
  3552				reg = <0 0x329b0000 0 0x1000>;
  3553			};
  3554	
  3555			disp_ovl0_outproc5: outproc@329c0000 {
  3556				compatible = "mediatek,mt8196-outproc";
  3557				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC5_DISP>;
  3558				reg = <0 0x329c0000 0 0x1000>;
  3559			};
  3560	
  3561			smi_larb0: larb@32a60000 {
  3562				compatible = "mediatek,mt8196-smi-larb";
  3563				reg = <0 0x32a60000 0 0x1000>;
  3564				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3565				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3566					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3567				clock-names = "apb", "smi";
  3568				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  3569				mediatek,larb-id = <0>;
  3570				larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
  3571			};
  3572	
  3573			smi_larb1: larb@32a70000 {
  3574				compatible = "mediatek,mt8196-smi-larb";
  3575				reg = <0 0x32a70000 0 0x1000>;
  3576				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3577				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3578					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3579				clock-names = "apb", "smi";
  3580				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3581				mediatek,larb-id = <1>;
  3582				larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
  3583			};
  3584	
  3585			smi_larb20: larb@32a80000 {
  3586				compatible = "mediatek,mt8196-smi-larb";
  3587				reg = <0 0x32a80000 0 0x1000>;
  3588				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3589				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3590					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3591				clock-names = "apb", "smi";
  3592				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3593				mediatek,larb-id = <20>;
  3594				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
  3595			};
  3596	
  3597			smi_larb21: larb@32a90000 {
  3598				compatible = "mediatek,mt8196-smi-larb";
  3599				reg = <0 0x32a90000 0 0x1000>;
  3600				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3601				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3602					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3603				clock-names = "apb", "smi";
  3604				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3605				mediatek,larb-id = <21>;
  3606				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
  3607			};
  3608	
  3609			ovlsys1_config_clk: syscon@32c00000 {
  3610				/* TODO: Fix compatible in driver */
  3611				compatible = "mediatek,mt8196-ovlsys1-config", "mediatek,mt8196-ovlsys1_config", "syscon";
  3612				reg = <0 0x32c00000 0 0x1000>;
  3613				mm-hw-ccf-regmap = <&mm_hwv>;
  3614				mboxes = <&gce0 2 CMDQ_THR_PRIO_4>, <&gce0 10 CMDQ_THR_PRIO_4>;
  3615				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3616				#clock-cells = <1>;
  3617	
  3618				async {
  3619					clocks = <&ovlsys1_config_clk CLK_OVL_DLO5_DISP>,
  3620						 <&ovlsys1_config_clk CLK_OVL_DLO6_DISP>;
  3621				};
  3622			};
  3623	
  3624			ovl1_mutex: mutex@32c20000 {
  3625				compatible = "mediatek,mt8196-disp-mutex";
  3626				reg = <0 0x32c20000 0 0x1000>;
  3627				clocks = <&ovlsys1_config_clk CLK_OVL_MUTEX0_DISP>;
  3628				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT2>;
  3629			};
  3630	
  3631			disp_ovl1_exdma2: dma-controller@32c50000 {
  3632				compatible = "mediatek,mt8196-exdma";
  3633				reg = <0 0x32c50000 0 0x1000>;
  3634				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA2_DISP>;
  3635				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3636				mediatek,larb = <&smi_larb34>;
  3637				#dma-cells = <1>;
  3638			};
  3639	
  3640			disp_ovl1_exdma3: dma-controller@32c60000 {
  3641				compatible = "mediatek,mt8196-exdma";
  3642				reg = <0 0x32c60000 0 0x1000>;
  3643				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA3_DISP>;
  3644				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3645				mediatek,larb = <&smi_larb35>;
  3646				#dma-cells = <1>;
  3647			};
  3648	
  3649			disp_ovl1_exdma4: dma-controller@32c70000 {
  3650				compatible = "mediatek,mt8196-exdma";
  3651				reg = <0 0x32c70000 0 0x1000>;
  3652				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA4_DISP>;
  3653				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3654				mediatek,larb = <&smi_larb36>;
  3655				#dma-cells = <1>;
  3656			};
  3657	
  3658			disp_ovl1_exdma5: dma-controller@32c80000 {
  3659				compatible = "mediatek,mt8196-exdma";
  3660				reg = <0 0x32c80000 0 0x1000>;
  3661				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA5_DISP>;
  3662				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3663				mediatek,larb = <&smi_larb37>;
  3664				#dma-cells = <1>;
  3665			};
  3666	
  3667			disp_ovl1_exdma6: dma-controller@32c90000 {
  3668				compatible = "mediatek,mt8196-exdma";
  3669				reg = <0 0x32c90000 0 0x1000>;
  3670				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA6_DISP>;
  3671				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3672				mediatek,larb = <&smi_larb35>;
  3673				#dma-cells = <1>;
  3674			};
  3675	
  3676			disp_ovl1_exdma7: dma-controller@32ca0000 {
  3677				compatible = "mediatek,mt8196-exdma";
  3678				reg = <0 0x32ca0000 0 0x1000>;
  3679				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA7_DISP>;
  3680				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3681				mediatek,larb = <&smi_larb34>;
  3682				#dma-cells = <1>;
  3683			};
  3684	
  3685			disp_ovl1_exdma8: dma-controller@32cb0000 {
  3686				compatible = "mediatek,mt8196-exdma";
  3687				reg = <0 0x32cb0000 0 0x1000>;
  3688				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA8_DISP>;
  3689				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3690				mediatek,larb = <&smi_larb37>;
  3691				#dma-cells = <1>;
  3692			};
  3693	
  3694			disp_ovl1_exdma9: dma-controller@32cc0000 {
  3695				compatible = "mediatek,mt8196-exdma";
  3696				reg = <0 0x32cc0000 0 0x1000>;
  3697				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA9_DISP>;
  3698				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3699				mediatek,larb = <&smi_larb36>;
  3700				#dma-cells = <1>;
  3701			};
  3702	
  3703			disp_ovl1_blender0: blender@32cd0000 {
  3704				compatible = "mediatek,mt8196-blender";
  3705				reg = <0 0x32cd0000 0 0x1000>;
  3706				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER0_DISP>;
  3707			};
  3708	
  3709			disp_ovl1_blender1: blender@32ce0000 {
  3710				compatible = "mediatek,mt8196-blender";
  3711				reg = <0 0x32ce0000 0 0x1000>;
  3712				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER1_DISP>;
  3713			};
  3714	
  3715			disp_ovl1_blender2: blender@32cf0000 {
  3716				compatible = "mediatek,mt8196-blender";
  3717				reg = <0 0x32cf0000 0 0x1000>;
  3718				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER2_DISP>;
  3719			};
  3720	
  3721			disp_ovl1_blender3: blender@32d00000 {
  3722				compatible = "mediatek,mt8196-blender";
  3723				reg = <0 0x32d00000 0 0x1000>;
  3724				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER3_DISP>;
  3725			};
  3726	
  3727			disp_ovl1_blender4: blender@32d10000 {
  3728				compatible = "mediatek,mt8196-blender";
  3729				reg = <0 0x32d10000 0 0x1000>;
  3730				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER4_DISP>;
  3731			};
  3732	
  3733			disp_ovl1_blender5: blender@32d20000 {
  3734				compatible = "mediatek,mt8196-blender";
  3735				reg = <0 0x32d20000 0 0x1000>;
  3736				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER5_DISP>;
  3737			};
  3738	
  3739			disp_ovl1_blender6: blender@32d30000 {
  3740				compatible = "mediatek,mt8196-blender";
  3741				reg = <0 0x32d30000 0 0x1000>;
  3742				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER6_DISP>;
  3743			};
  3744	
  3745			disp_ovl1_blender7: blender@32d40000 {
  3746				compatible = "mediatek,mt8196-blender";
  3747				reg = <0 0x32d40000 0 0x1000>;
  3748				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER7_DISP>;
  3749			};
  3750	
  3751			disp_ovl1_blender8: blender@32d50000 {
  3752				compatible = "mediatek,mt8196-blender";
  3753				reg = <0 0x32d50000 0 0x1000>;
  3754				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER8_DISP>;
  3755			};
  3756	
  3757			disp_ovl1_blender9: blender@32d60000 {
  3758				compatible = "mediatek,mt8196-blender";
  3759				reg = <0 0x32d60000 0 0x1000>;
  3760				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER9_DISP>;
  3761			};
  3762	
  3763			disp_ovl1_outproc0: outproc@32d70000 {
  3764				compatible = "mediatek,mt8196-outproc";
  3765				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC0_DISP>;
  3766				interrupts = <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH 0>;
  3767				reg = <0 0x32d70000 0 0x1000>;
  3768			};
  3769	
  3770			disp_ovl1_outproc1: outproc@32d80000 {
  3771				compatible = "mediatek,mt8196-outproc";
  3772				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC1_DISP>;
  3773				reg = <0 0x32d80000 0 0x1000>;
  3774			};
  3775	
  3776			disp_ovl1_outproc2: outproc@32d90000 {
  3777				compatible = "mediatek,mt8196-outproc";
  3778				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC2_DISP>;
  3779				reg = <0 0x32d90000 0 0x1000>;
  3780			};
  3781	
  3782			disp_ovl1_outproc3: outproc@32da0000 {
  3783				compatible = "mediatek,mt8196-outproc";
  3784				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC3_DISP>;
  3785				reg = <0 0x32da0000 0 0x1000>;
  3786			};
  3787	
  3788			disp_ovl1_outproc4: outproc@32db0000 {
  3789				compatible = "mediatek,mt8196-outproc";
  3790				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC4_DISP>;
  3791				reg = <0 0x32db0000 0 0x1000>;
  3792			};
  3793	
  3794			disp_ovl1_outproc5: outproc@32dc0000 {
  3795				compatible = "mediatek,mt8196-outproc";
  3796				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC5_DISP>;
  3797				reg = <0 0x32dc0000 0 0x1000>;
  3798			};
  3799	
  3800			smi_larb34: larb@32e60000 {
  3801				compatible = "mediatek,mt8196-smi-larb";
  3802				reg = <0 0x32e60000 0 0x1000>;
  3803				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3804				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3805					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3806				clock-names = "apb", "smi";
  3807				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3808				mediatek,larb-id = <34>;
  3809				larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
  3810			};
  3811	
  3812			smi_larb35: larb@32e70000 {
  3813				compatible = "mediatek,mt8196-smi-larb";
  3814				reg = <0 0x32e70000 0 0x1000>;
  3815				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3816				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3817					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3818				clock-names = "apb", "smi";
  3819				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3820				mediatek,larb-id = <35>;
  3821				larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
  3822			};
  3823	
  3824			smi_larb36: larb@32e80000 {
  3825				compatible = "mediatek,mt8196-smi-larb";
  3826				reg = <0 0x32e80000 0 0x1000>;
  3827				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3828				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3829					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3830				clock-names = "apb", "smi";
  3831				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3832				mediatek,larb-id = <36>;
  3833				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
  3834			};
  3835	
  3836			smi_larb37: larb@32e90000 {
  3837				compatible = "mediatek,mt8196-smi-larb";
  3838				reg = <0 0x32e90000 0 0x1000>;
  3839				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3840				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3841					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3842				clock-names = "apb", "smi";
  3843				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  3844				mediatek,larb-id = <37>;
  3845				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
  3846			};
  3847	
  3848			video_codec: video@36000000 {
  3849				compatible = "mediatek,mt8196-vcodec-dec";
  3850				mediatek,vcp = <&vcp>;
  3851				iommus = <&mm_smmu 177>;
  3852				#address-cells = <2>;
  3853				#size-cells = <2>;
  3854				reg = <0 0x36000000 0 0x1000>,
  3855					<0 0x36098000 0 0x1000>;
  3856				ranges = <0 0 0 0x36000000 0 0x26000>;
  3857	
  3858				video-codec@10000 {
  3859					compatible = "mediatek,mtk-vcodec-lat";
  3860					reg = <0 0x10000 0 0x800>;
  3861					interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
  3862					clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>,
  3863						<&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3864						<&vdec_soc_gcon_base_clk CLK_VDE1_LAT_CKEN>,
  3865						<&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
  3866					clock-names = "sel", "vdec", "lat", "top";
  3867					assigned-clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>;
  3868					assigned-clock-parents = <&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
  3869					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3870				};
  3871	
  3872				video-codec@25000 {
  3873					compatible = "mediatek,mtk-vcodec-core";
  3874					reg = <0 0x25000 0 0x1000>;		/* VDEC_CORE_MISC */
  3875					interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH 0>;
  3876					clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>,
  3877						<&vdec_gcon_base_clk CLK_VDE2_LAT_CKEN>,
  3878						<&vdec_gcon_base_clk CLK_VDE2_VDEC_CKEN>,
  3879						<&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
  3880					clock-names = "sel", "vdec", "lat", "top";
  3881					assigned-clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>;
  3882					assigned-clock-parents = <&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
  3883					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
  3884				};
  3885			};
  3886	
  3887			smi_larb5: larb@3600d000 {
  3888				compatible = "mediatek,mt8196-smi-larb";
  3889				reg = <0 0x3600d000 0 0x1000>;
  3890				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3891				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3892					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3893				clock-names = "apb", "smi";
  3894				mediatek,smi = <&smi_disp_common>;
  3895				mediatek,larb-id = <5>;
  3896				larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
  3897			};
  3898	
  3899			smi_larb6: larb@3600e000 {
  3900				compatible = "mediatek,mt8196-smi-larb";
  3901				reg = <0 0x3600e000 0 0x1000>;
  3902				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3903				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3904					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3905				clock-names = "apb", "smi";
  3906				mediatek,smi = <&smi_mdp_common>;
  3907				mediatek,larb-id = <6>;
  3908				larb-port-real-time-type = <1 1 1>;
  3909			};
  3910	
  3911			vdec_soc_gcon_base_clk: syscon@3600f000 {
  3912				/* TODO: Fix compatible in driver */
  3913				compatible = "mediatek,mt8196-vdecsys-soc", "mediatek,mt8196-vdecsys_soc", "syscon";
  3914				reg = <0 0x3600f000 0 0x1000>;
  3915				#clock-cells = <1>;
  3916				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3917			};
  3918	
  3919			smi_larb4: larb@3602e000 {
  3920				compatible = "mediatek,mt8196-smi-larb";
  3921				reg = <0 0x3602e000 0 0x1000>;
  3922				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
  3923				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3924					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3925				clock-names = "apb", "smi";
  3926				mediatek,smi = <&smi_mdp_common>;
  3927				mediatek,larb-id = <4>;
  3928				larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
  3929			};
  3930	
  3931			vdec_gcon_base_clk: syscon@3602f000 {
  3932				compatible = "mediatek,mt8196-vdecsys", "syscon";
  3933				reg = <0 0x3602f000 0 0x1000>;
  3934				#clock-cells = <1>;
  3935				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
  3936			};
  3937	
  3938			venc_gcon_clk: syscon@38000000 {
  3939				compatible = "mediatek,mt8196-vencsys", "syscon";
  3940				reg = <0 0x38000000 0 0x1000>;
  3941				mm-hw-ccf-regmap = <&mm_hwv>;
  3942				#clock-cells = <1>;
  3943				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3944			};
  3945	
  3946			smi_larb7: larb@38010000 {
  3947				compatible = "mediatek,mt8196-smi-larb";
  3948				reg = <0 0x38010000 0 0x1000>;
  3949				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3950				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3951					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3952				clock-names = "apb", "smi";
  3953				mediatek,smi = <&smi_disp_venc_sub_comm0>;
  3954				mediatek,larb-id = <7>;
  3955				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3956			};
  3957	
  3958			venc: video-codec@38020000 {
  3959				compatible = "mediatek,mt8196-vcodec-enc";
  3960				reg = <0 0x38020000 0 0x6000>;
  3961				mediatek,vcp = <&vcp>;
  3962				iommus = <&mm_smmu 176>;
  3963				interrupts = <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH 0>;
  3964				clocks = <&venc_gcon_clk CLK_VEN1_CKE1_VENC>;
  3965				clock-names = "venc_sel";
  3966				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3967			};
  3968	
  3969			smi_disp_venc_sub_comm0: smi-sub-comm@38070000 {
  3970				compatible = "mediatek,mt8196-smi-sub-common";
  3971				reg = <0 0x38070000 0 0x1000>;
  3972				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3973				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3974					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3975				clock-names = "apb", "smi";
  3976				mediatek,smi = <&smi_disp_common>;
  3977				mediatek,common-id = <15>;
  3978			};
  3979	
  3980			smi_larb41: larb@38090000 {
  3981				compatible = "mediatek,mt8196-smi-larb";
  3982				reg = <0 0x38090000 0 0x1000>;
  3983				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3984				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3985					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3986				clock-names = "apb", "smi";
  3987				mediatek,smi = <&smi_disp_venc_sub_comm0>;
  3988				mediatek,larb-id = <41>;
  3989				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3990			};
  3991	
  3992			venc_gcon_core1_clk: syscon@38800000 {
  3993				/* TODO: Fix compatible in driver */
  3994				compatible = "mediatek,mt8196-vencsys-c1", "mediatek,mt8196-vencsys_c1", "syscon";
  3995				reg = <0 0x38800000 0 0x1000>;
  3996				mm-hw-ccf-regmap = <&mm_hwv>;
  3997				#clock-cells = <1>;
  3998				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3999			};
  4000	
  4001			smi_larb8: larb@38810000 {
  4002				compatible = "mediatek,mt8196-smi-larb";
  4003				reg = <0 0x38810000 0 0x1000>;
  4004				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4005				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  4006					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  4007				clock-names = "apb", "smi";
  4008				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  4009				mediatek,larb-id = <8>;
  4010				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  4011			};
  4012	
  4013	
  4014			smi_mdp_venc_sub_comm1: smi-sub-comm@38870000 {
  4015				compatible = "mediatek,mt8196-smi-sub-common";
  4016				reg = <0 0x38870000 0 0x1000>;
  4017				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4018				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  4019					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  4020				clock-names = "apb", "smi";
  4021				mediatek,smi = <&smi_mdp_common>;
  4022				mediatek,common-id = <16>;
  4023			};
  4024	
  4025			smi_larb42: larb@38890000 {
  4026				compatible = "mediatek,mt8196-smi-larb";
  4027				reg = <0 0x38890000 0 0x1000>;
  4028				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4029				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  4030					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  4031				clock-names = "apb", "smi";
  4032				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  4033				mediatek,larb-id = <42>;
  4034				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  4035			};
  4036	
  4037			venc_gcon_core2_clk: syscon@38c00000 {
  4038				/* TODO: Fix compatible in driver */
  4039				compatible = "mediatek,mt8196-vencsys-c2", "mediatek,mt8196-vencsys_c2", "syscon";
  4040				reg = <0 0x38c00000 0 0x1000>;
  4041				mm-hw-ccf-regmap = <&mm_hwv>;
  4042				#clock-cells = <1>;
  4043				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  4044			};
  4045	
  4046			smi_larb24: larb@38c10000 {
  4047				compatible = "mediatek,mt8196-smi-larb";
  4048				reg = <0 0x38c10000 0 0x1000>;
  4049				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  4050				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  4051					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  4052				clock-names = "apb", "smi";
  4053				mediatek,smi = <&smi_mdp_venc_sub_comm2>;
  4054				mediatek,larb-id = <24>;
  4055				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  4056			};
  4057	
  4058			smi_mdp_venc_sub_comm2: smi-sub-comm@38c70000 {
  4059				compatible = "mediatek,mt8196-smi-sub-common";
  4060				reg = <0 0x38c70000 0 0x1000>;
  4061				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  4062				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  4063					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  4064				clock-names = "apb", "smi";
  4065				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  4066				mediatek,common-id = <18>;
  4067			};
  4068	
  4069			smi_larb47: larb@38c90000 {
  4070				compatible = "mediatek,mt8196-smi-larb";
  4071				reg = <0 0x38c90000 0 0x1000>;
  4072				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  4073				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  4074					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  4075				clock-names = "apb", "smi";
  4076				mediatek,smi = <&smi_mdp_venc_sub_comm2>;
  4077				mediatek,larb-id = <47>;
  4078				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  4079			};
  4080	
  4081			cam_main_r1a_clk: syscon@3a000000 {
  4082				/* TODO: Fix compatible in driver */
  4083				compatible = "mediatek,mt8196-cam_main-r1a", "mediatek,mt8196-cam_main_r1a", "syscon";
  4084				reg = <0 0x3a000000 0 0x1000>;
  4085				mm-hw-ccf-regmap = <&mm_hwv>;
  4086				#clock-cells = <1>;
  4087			};
  4088	
  4089			mdpsys_config_clk: syscon@3e000000 {
  4090				compatible = "mediatek,mt8196-mdpsys", "syscon";
  4091				reg = <0 0x3e000000 0 0x1000>;
  4092				#clock-cells = <1>;
  4093				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
  4094			};
  4095	
  4096			smi_larb2: larb@3e030000 {
  4097				compatible = "mediatek,mt8196-smi-larb";
  4098				reg = <0 0x3e030000 0 0x1000>;
  4099				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
  4100				clocks = <&mdpsys_config_clk CLK_MDP_SMI0_SMI>, <&mdpsys_config_clk CLK_MDP_SMI0_SMI>;
  4101				clock-names = "apb", "smi";
  4102				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  4103				mediatek,larb-id = <2>;
  4104				larb-port-real-time-type = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
  4105			};
  4106	
  4107			mdpsys1_config_clk: syscon@3e400000 {
  4108				compatible = "mediatek,mt8196-mdpsys1", "syscon";
  4109				reg = <0 0x3e400000 0 0x1000>;
  4110				#clock-cells = <1>;
  4111				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
  4112			};
  4113	
  4114			smi_larb3: larb@3e430000 {
  4115				compatible = "mediatek,mt8196-smi-larb";
  4116				reg = <0 0x3e430000 0 0x1000>;
  4117				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
  4118				clocks = <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>, <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>;
  4119				clock-names = "apb", "smi";
  4120				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  4121				mediatek,larb-id = <3>;
  4122				larb-port-real-time-type = <2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 1 2>;
  4123			};
  4124	
  4125			disp_vdisp_ao_config_clk: syscon@3e800000 {
  4126				/* TODO: Fix compatible in driver */
  4127				compatible = "mediatek,mt8196-disp-vdisp-ao-config", "mediatek,mt8196-disp_vdisp_ao_config", "syscon";
  4128				reg = <0 0x3e800000 0 0x1000>;
  4129				mm-hw-ccf-regmap = <&mm_hwv>;
  4130				#clock-cells = <1>;
  4131				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4132			};
  4133	
  4134			smi_disp_dram_sub_comm0: smi-sub-comm@3e810000 {
  4135				compatible = "mediatek,mt8196-smi-sub-common";
  4136				reg = <0 0x3e810000 0 0x1000>;
  4137				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4138				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  4139						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  4140				clock-names = "apb", "smi";
  4141				mediatek,smi = <&smi_disp_common>;
  4142				mediatek,common-id = <9>;
  4143			};
  4144	
  4145			smi_disp_dram_sub_comm1: smi-sub-comm@3e820000 {
  4146				compatible = "mediatek,mt8196-smi-sub-common";
  4147				reg = <0 0x3e820000 0 0x1000>;
  4148				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4149				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  4150						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  4151				clock-names = "apb", "smi";
  4152				mediatek,smi = <&smi_disp_common>;
  4153				mediatek,common-id = <10>;
  4154			};
  4155	
  4156			smi_mdp_dram_sub_comm2: smi-sub-comm@3e830000 {
  4157				compatible = "mediatek,mt8196-smi-sub-common";
  4158				reg = <0 0x3e830000 0 0x1000>;
  4159				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4160				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  4161						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  4162				clock-names = "apb", "smi";
  4163				mediatek,smi = <&smi_mdp_common>;
  4164				mediatek,common-id = <11>;
  4165			};
  4166	
  4167			smi_mdp_dram_sub_comm3: smi-sub-comm@3e840000 {
  4168				compatible = "mediatek,mt8196-smi-sub-common";
  4169				reg = <0 0x3e840000 0 0x1000>;
  4170				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4171				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  4172						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  4173				clock-names = "apb", "smi";
  4174				mediatek,smi = <&smi_mdp_common>;
  4175				mediatek,common-id = <12>;
  4176			};
  4177	
  4178			dp_tx: dp-tx@3ec00000 {
  4179				compatible = "mediatek,mt8196-dp-tx";
  4180				reg = <0 0x3ec00000 0 0x5000>,
  4181				      <0 0x128b0000 0 0x1500>,
  4182				      <0 0x1002d600 0 0x4>,
  4183				      <0 0x31b50078 0 0x4>;
  4184				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT>,
  4185						<&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
  4186				power-domain-names = "pd_dp_tx", "pd_dp_phy";
  4187				interrupts = <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH 0>;
  4188				dptx,phy-params = <0x221c1814 0x24241e18 0x0000302a
  4189						   0x0e080400 0x000c0600 0x00000006>;
  4190				#phy-cells = <0>;
  4191				clocks = <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
  4192					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  4193				clock-names = "mux_dp",
  4194					      "ck_26m";
  4195			};
  4196	
  4197			edp_tx: edp-tx@3ec40000 {
  4198				compatible = "mediatek,mt8196-edp-tx";
  4199				reg = <0 0x3ec40000 0 0x4000>,
  4200				      <0 0x130a0000 0 0x1500>,
  4201				      <0 0x31b50074 0 0x4>;
  4202				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT>;
  4203				clocks = <&cksys_gp2_clk CLK_CK2_DVO_SEL>;
  4204				clock-names = "power";
  4205				max-linkrate-mhz = <8100>;
  4206				interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH 0>;
  4207				status = "disabled";
  4208			};
  4209	
  4210			gpu: gpu@48000000 {
  4211				compatible = "mediatek,mali-mt8196", "mediatek,mali";
  4212				reg = <0 0x48000000 0 0x480000>;
  4213				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
  4214					     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
  4215					     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>,
  4216					     <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH 0>,
  4217					     <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>,
  4218					     <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH 0>;
  4219				interrupt-names = "job",
  4220						  "mmu",
  4221						  "gpu",
  4222						  "event",
  4223						  "pwr",
  4224						  "gpueb_mbox1";
  4225				l2-hash-values = <0xb 0xe 0x0>;
  4226				physical-memory-group-manager = <&mgm>;
  4227				protected-memory-allocator = <&gpu_protected_memory_allocator>;
  4228				operating-points-v2 = <&gpu_mali_opp>;
  4229				#cooling-cells = <2>;
  4230				ged-supply = <&ged>;
  4231				system-coherency = <31>;
  4232				sleep-mode-enable;
  4233				firmware-idle-hysteresis-time-us = <0>;
  4234				default-glb-pwroff-timeout-us = <10>;
  4235				autosuspend-delay-ms = <10>;
  4236				adaptive-power-policy = <2>;
  4237				reset-exception-mask = <0x0>;
  4238				iter-trace-enable = <1>;
  4239				gpu-frame-base-optimize = <1>;
  4240	
  4241				pbha {
  4242					propagate-bits = /bits/ 8 <0xf>;
  4243				};
  4244			};
  4245	
  4246			gpufreq: gpufreq@48500000 {
  4247				compatible = "mediatek,gpufreq";
  4248				reg = <0 0x48500000 0 0x1000>,   /* MFG_TOP_CONFIG */
  4249				      <0 0x48600000 0 0x200000>, /* MFG_SMMU */
  4250				      <0 0x48800000 0 0x1000>,   /* MFG_VGPU_BUS_DBG_TRACKER */
  4251				      <0 0x4b190000 0 0x20000>,  /* MFG_GPUEB_BUS_DBG_TRACKER */
  4252				      <0 0x4b800000 0 0x10000>,  /* MFG_RPC */
  4253				      <0 0x4b810000 0 0x400>,    /* MFG_PLL */
  4254				      <0 0x4b810400 0 0x400>,    /* MFG_PLL_SC0 */
  4255				      <0 0x4b810800 0 0x400>,    /* MFG_PLL_SC1 */
  4256				      <0 0x4b840000 0 0x1000>,   /* MFG_HBVC */
  4257				      <0 0x4b860000 0 0x1000>,   /* MFG_VCORE_AO_CFG */
  4258				      <0 0x4b8b0000 0 0x1000>,   /* MFG_VCORE_DEVAPC */
  4259				      <0 0x4b900000 0 0x1000>,   /* MFG_VCORE_BUS_DBG_TRACKER */
  4260				      <0 0x0c000000 0 0x1000>,   /* MCUSYS_PAR_WRAP */
  4261				      <0 0x10000000 0 0x1000>,   /* CKSYS */
  4262				      <0 0x10404000 0 0x1000>,   /* NTH_EMICFG_AO_MEM */
  4263				      <0 0x10416000 0 0x1000>,   /* NTH_EMI_AO_DEBUG_CTRL */
  4264				      <0 0x10425000 0 0x1000>,   /* NTH_EMICFG */
  4265				      <0 0x10469000 0 0x1000>,   /* EMI */
  4266				      <0 0x10504000 0 0x1000>,   /* STH_EMICFG_AO_MEM */
  4267				      <0 0x10516000 0 0x1000>,   /* STH_EMI_AO_DEBUG_CTRL */
  4268				      <0 0x10525000 0 0x1000>,   /* STH_EMICFG */
  4269				      <0 0x10569000 0 0x1000>,   /* SUB_EMI */
  4270				      <0 0x10621000 0 0x1000>,   /* SEMI_MI32_SMI */
  4271				      <0 0x10622000 0 0x1000>,   /* NEMI_MI32_SMI */
  4272				      <0 0x10623000 0 0x1000>,   /* SEMI_MI33_SMI */
  4273				      <0 0x10624000 0 0x1000>,   /* NEMI_MI33_SMI */
  4274				      <0 0x10644000 0 0x1000>,   /* INFRA_AO_DEBUG_CTRL */
  4275				      <0 0x10645000 0 0x1000>,   /* EMI_INFRA_AO_BCRM */
  4276				      <0 0x10646000 0 0x1000>,   /* EMI_INFRA_AO_MEM */
  4277				      <0 0x10648000 0 0x1000>,   /* EMI_INFRA_CFG */
  4278				      <0 0x1c004000 0 0x10000>;  /* SLEEP */
  4279				reg-names = "mfg_top_config",
  4280					    "mfg_smmu",
  4281					    "mfg_vgpu_bus_trk",
  4282					    "mfg_gpueb_bus_trk",
  4283					    "mfg_rpc",
  4284					    "mfg_pll",
  4285					    "mfg_pll_sc0",
  4286					    "mfg_pll_sc1",
  4287					    "mfg_hbvc",
  4288					    "mfg_vcore_ao_cfg",
  4289					    "mfg_vcore_devapc",
  4290					    "mfg_vcore_bus_trk",
  4291					    "mcusys_par_wrap",
  4292					    "cksys",
  4293					    "nth_emicfg_ao_mem",
  4294					    "nth_emi_ao_debug_ctrl",
  4295					    "nth_emicfg",
  4296					    "emi",
  4297					    "sth_emicfg_ao_mem",
  4298					    "sth_emi_ao_debug_ctrl",
  4299					    "sth_emicfg",
  4300					    "sub_emi",
  4301					    "semi_mi32_smi",
  4302					    "nemi_mi32_smi",
  4303					    "semi_mi33_smi",
  4304					    "nemi_mi33_smi",
  4305					    "infra_ao_debug_ctrl",
  4306					    "emi_infra_ao_bcrm",
  4307					    "emi_infra_ao_mem",
  4308					    "emi_infra_cfg",
  4309					    "sleep";
  4310				gpufreq-wrapper-supply = <&gpufreq_wrapper>;
  4311			};
  4312	
  4313			gpupdma: gpupdma@48540000 {
  4314				compatible = "mediatek,gpupdma";
  4315				reg = <0 0x48540000 0 0x2000>,
  4316				      <0 0x4b800704 0 0x4>,
  4317				      <0 0x13f840 0 0x28>;
  4318				ringbuf-page-order = <3>;
  4319				config-mode = <1>;
  4320				hw-semaphore-bit = <1>;
  4321			};
  4322	
  4323			gpu_smmu: iommu@48600000 {
  4324				#iommu-cells = <1>;
  4325				compatible = "mediatek,mt8196-gpu-smmu", "arm,smmu-v3";
  4326				reg = <0 0x48600000 0 0x1e0000>;
  4327				interrupts = <GIC_SPI 616 IRQ_TYPE_LEVEL_HIGH 0>;
  4328				interrupt-names = "combined";
  4329				status = "disabled";
  4330			};
  4331	
  4332			gpueb: gpueb@4b000000 {
  4333				compatible = "mediatek,gpueb";
  4334				reg = <0 0x4b000000 0 0xa0000>,
  4335				      <0 0x4b09fd00 0 0x80>,
  4336				      <0 0x4b140100 0 0x200>,
  4337				      <0 0x4b120000 0 0x100>,
  4338				      <0 0x4b09fd80 0 0x280>,
  4339				      <0 0x4b170008 0 0x4>,  /* arbitrary addr to avoid error msg */
  4340				      <0 0x4b170004 0 0x4>,
  4341				      <0 0x4b170074 0 0x4>,
  4342				      <0 0x4b170000 0 0x4>,
  4343				      <0 0x4b170078 0 0x4>,
  4344				      <0 0x4b800504 0 0x4>;
  4345				reg-names = "gpueb_base",
  4346				            "gpueb_gpr_base",
  4347				            "gpueb_cfgreg_base",
  4348				            "gpueb_intc_base",
  4349				            "mbox0_base",
  4350				            "mbox0_init", /* dummy input for mtk_mbox_probe */
  4351				            "mbox0_set",
  4352				            "mbox0_clr",
  4353				            "mbox0_send",
  4354				            "mbox0_recv",
  4355				            "mfg0_pwr_con";
  4356				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>;
  4357				interrupt-names = "mbox0";
  4358	
  4359				gpueb-support;
  4360				ghpm-support;
  4361				mbox-count = <1>;
  4362				mbox-size = <160>; /* 160 slot * 4 = 640 byte */
  4363				slot-size = <4>;   /* 1 slot = 4 bytes */
  4364				ts-mbox = <0>; /* mbox for timersync */
  4365	
  4366				/* id, mbox, send_size */
  4367				send-table = <0 0 4>,
  4368					     <1 0 8>,
  4369					     <2 0 3>,
  4370					     <3 0 6>,
  4371					     <4 0 9>,
  4372					     <5 0 4>,
  4373					     <6 0 6>,
  4374					     <7 0 6>,
  4375					     <8 0 1>,
  4376					     <9 0 4>,
  4377					     <10 0 4>,
  4378					     <11 0 1>;
  4379				send-name-table = "IPI_ID_FAST_DVFS_EVENT",
  4380						  "IPI_ID_GPUFREQ",
  4381						  "IPI_ID_SLEEP",
  4382						  "IPI_ID_TIMER",
  4383						  "IPI_ID_FHCTL",
  4384						  "IPI_ID_CCF",
  4385						  "IPI_ID_GPUMPU",
  4386						  "IPI_ID_FAST_DVFS",
  4387						  "CH_IPIR_C_MET", /* = IPIS_C_MET on gpueb side */
  4388						  "CH_IPIS_C_MET", /* = IPIR_C_MET on gpueb side */
  4389						  "IPI_ID_BRISKET",
  4390						  "IPI_ID_PPB";
  4391	
  4392				/* id, mbox, recv_size, recv_opt, cb_ctx_opt */
  4393				recv-table = <0 0 4 0 0>,
  4394					     <1 0 8 1 1>,
  4395					     <2 0 1 0 1>,
  4396					     <3 0 1 0 1>,
  4397					     <4 0 1 1 1>,
  4398					     <5 0 4 1 1>,
  4399					     <6 0 1 1 1>,
  4400					     <7 0 6 1 1>,
  4401					     <8 0 4 0 1>,
  4402					     <9 0 1 1 1>,
  4403					     <10 0 4 1 1>,
  4404					     <11 0 1 1 1>;
  4405				recv-name-table = "IPI_ID_FAST_DVFS_EVENT",
  4406						  "IPI_ID_GPUFREQ",
  4407						  "IPI_ID_SLEEP",
  4408						  "IPI_ID_TIMER",
  4409						  "IPI_ID_FHCTL",
  4410						  "IPI_ID_CCF",
  4411						  "IPI_ID_GPUMPU",
  4412						  "IPI_ID_FAST_DVFS",
  4413						  "CH_IPIR_C_MET", /* = IPIS_C_MET on gpueb side */
  4414						  "CH_IPIS_C_MET", /* = IPIR_C_MET on gpueb side */
  4415						  "IPI_ID_BRISKET",
  4416						  "IPI_ID_PPB";
  4417	
  4418				gpueb-mem-table = <0 0x4000>,   /* 16KB */
  4419						  <1 0x180000>; /* 1.5MB */
  4420	
  4421				gpueb-mem-name-table = "MEM_ID_GPUFREQ", /* GPUFREQ */
  4422						       "MEM_ID_LOG";     /* LOGGER */
  4423			};
  4424	
  4425			mfgpll_pll_ctrl_clk: syscon@4b810000 {
  4426				/* TODO: Fix compatible in driver */
  4427				compatible = "mediatek,mt8196-mfgpll-pll-ctrl", "mediatek,mt8196-mfgpll_pll_ctrl", "syscon";
  4428				reg = <0 0x4b810000 0 0x400>;
  4429				#clock-cells = <1>;
  4430			};
  4431	
  4432			mfgpll_sc0_pll_ctrl_clk: syscon@4b810400 {
  4433				/* TODO: Fix compatible in driver */
  4434				compatible = "mediatek,mt8196-mfgpll-sc0-pll-ctrl", "mediatek,mt8196-mfgpll_sc0_pll_ctrl", "syscon";
  4435				reg = <0 0x4b810400 0 0x400>;
  4436				#clock-cells = <1>;
  4437			};
  4438	
  4439			ghpm: ghpm@4b800000 {
  4440				compatible = "mediatek,ghpm";
  4441				reg =
  4442					<0 0x4b800000 0 0x1000>,
  4443					<0 0x4b860000 0 0x1000>,
  4444					<0 0x4b860128 0 0x4>,
  4445					<0 0x1c004ea8 0 0x4>,
  4446					<0 0x1c000070 0 0x4>,
  4447					<0 0x1c000074 0 0x4>,
  4448					<0 0x1c000078 0 0x4>;
  4449				reg-names =
  4450					"mfg_rpc",
  4451					"mfg_vcore_ao_config",
  4452					"mfg_mt8196_e2_id_con",
  4453					"spm_mfg0_pwr_con",
  4454					"clk_cfg_6",
  4455					"clk_cfg_6_set",
  4456					"clk_cfg_6_clr";
  4457	
  4458				gpueb-supply = <&gpueb>;
  4459			};
  4460	
  4461			mfgpll_sc1_pll_ctrl_clk: syscon@4b810800 {
  4462				/* TODO: Fix compatible in driver */
  4463				compatible = "mediatek,mt8196-mfgpll-sc1-pll-ctrl", "mediatek,mt8196-mfgpll_sc1_pll_ctrl", "syscon";
  4464				reg = <0 0x4b810800 0 0x1000>;
  4465				#clock-cells = <1>;
  4466			};
  4467	
  4468			devapc_gpu: devapc@4b890000 {
  4469				compatible = "mediatek,mt8196-devapc";
  4470				reg = <0 0x4b890000 0 0x1000>;
  4471				vio-idx-num = <20>;
  4472				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
  4473			};
  4474	
  4475			devapc_gpu1: devapc@4b8b0000 {
  4476				compatible = "mediatek,mt8196-devapc";
  4477				reg = <0 0x4b8b0000 0 0x1000>;
  4478				vio-idx-num = <26>;
  4479				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
  4480			};
  4481	
  4482			apu_smmu: iommu@4c000000 {
  4483				compatible = "mediatek,mt8196-apu-smmu", "arm,smmu-v3";
  4484				reg = <0 0x4c000000 0 0x1e0000>;
  4485				interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING 0>;
  4486				interrupt-names = "combined";
  4487				#iommu-cells = <1>;
  4488			};
  4489	
  4490			jpeg-decoder {
  4491				compatible = "mediatek,mt8196-jpgdec";
  4492				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  4493				iommus = <&mm_smmu 164>;
  4494				#address-cells = <2>;
  4495				#size-cells = <2>;
  4496				ranges;
  4497	
  4498				jpgdec0: jpeg-decoder@38040000 {
  4499					compatible = "mediatek,mt8196-jpgdec-hw";
  4500					reg = <0 0x38040000 0 0x10000>;
  4501					interrupts = <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
  4502					clocks = <&venc_gcon_clk CLK_VEN1_CKE3_JPGDEC_JPGDEC>;
  4503					clock-names = "jpgdec";
  4504					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  4505				};
  4506	
  4507				jpgdec1: jpeg-decoder@38840000 {
  4508					compatible = "mediatek,mt8196-jpgdec-hw";
  4509					reg = <0 0x38840000 0 0x10000>;
  4510					interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>;
  4511					clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE3_JPGDEC_JPGDEC>;
  4512					clock-names = "jpgdec";
  4513					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4514				};
  4515			};
  4516	
  4517			jpeg-encoder {
  4518				compatible = "mediatek,mt8196-jpgenc";
  4519				power-domains = <&hfrpsys  MT8196_POWER_DOMAIN_VEN0>;
  4520				iommus = <&mm_smmu 165>;
  4521				#address-cells = <2>;
  4522				#size-cells = <2>;
  4523				ranges;
  4524	
  4525				jpgenc0: jpeg-encoder@38030000 {
  4526					compatible = "mediatek,mt8196-jpgenc-hw";
  4527					reg = <0 0x38030000 0 0x10000>;
  4528					interrupts = <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH 0>;
  4529					clocks = <&venc_gcon_clk CLK_VEN1_CKE2_JPGENC_JPGENC>;
  4530					clock-names = "jpgenc";
  4531					power-domains = <&hfrpsys  MT8196_POWER_DOMAIN_VEN0>;
  4532				};
  4533	
  4534				jpgenc1: jpeg-encoder@38830000 {
  4535					compatible = "mediatek,mt8196-jpgenc-hw";
  4536					reg = <0 0x38830000 0 0x10000>;
  4537					interrupts = <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>;
  4538					clocks = <&venc_gcon_clk CLK_VEN1_CKE2_JPGENC>,
  4539						<&venc_gcon_core1_clk  CLK_VEN2_CKE2_JPGENC_JPGENC>;
  4540					clock-names = "jpgenc", "jpgenc_c1";
  4541					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4542				};
  4543			};
  4544	
  4545			sound: sound {
  4546				compatible = "mediatek,mt8196-mt6681-sound";
  4547				mediatek,platform = <&afe>;
  4548				/* audio-routing is added here as a placeholder to complete the
  4549				   probe flow.It should be removed when upstreaming */
  4550				audio-routing = "Headphone Jack", "HPOL",
  4551						"Headphone Jack", "HPOR";
  4552				status = "disabled";
  4553			};
  4554	
  4555			thermal_zones: thermal-zones {
  4556				soc_max: soc_max {
  4557					polling-delay = <0>; /* milliseconds */
  4558					polling-delay-passive = <0>; /* milliseconds */
  4559					thermal-sensors = <&lvts 0>;
  4560	
  4561					trips {
  4562						soc_max_crit: so-max-crit {
  4563							temperature = <118800>;
  4564							hysteresis = <2000>;
  4565							type = "critical";
  4566						};
  4567					};
  4568				};
  4569	
  4570				cpu-6-0-thermal {
  4571					polling-delay = <0>; /* milliseconds */
  4572					polling-delay-passive = <0>; /* milliseconds */
  4573					thermal-sensors = <&lvts 1>;
  4574					trips {
  4575						cpu_medium_core6_0_crit: cpu-medium-core6-0-crit {
  4576							temperature = <118800>;
  4577							hysteresis = <2000>;
  4578							type = "critical";
  4579						};
  4580					};
  4581				};
  4582	
  4583				cpu-6-1-thermal {
  4584					polling-delay = <0>; /* milliseconds */
  4585					polling-delay-passive = <0>; /* milliseconds */
  4586					thermal-sensors = <&lvts 2>;
  4587					trips {
  4588						cpu_medium_core6_1_crit: cpu-medium-core6-1-crit {
  4589							temperature = <118800>;
  4590							hysteresis = <2000>;
  4591							type = "critical";
  4592						};
  4593					};
  4594				};
  4595	
  4596				cpu-dsu2-thermal {
  4597					polling-delay = <0>; /* milliseconds */
  4598					polling-delay-passive = <0>; /* milliseconds */
  4599					thermal-sensors = <&lvts 3>;
  4600					trips {
  4601						cpu_dsu2_crit: cpu-dsu2-crit {
  4602							temperature = <118800>;
  4603							hysteresis = <2000>;
  4604							type = "critical";
  4605						};
  4606					};
  4607				};
  4608	
  4609				cpu-dsu3-thermal {
  4610					polling-delay = <0>; /* milliseconds */
  4611					polling-delay-passive = <0>; /* milliseconds */
  4612					thermal-sensors = <&lvts 4>;
  4613					trips {
  4614						cpu_dsu3_crit: cpu-dsu3-crit {
  4615							temperature = <118800>;
  4616							hysteresis = <2000>;
  4617							type = "critical";
  4618						};
  4619					};
  4620				};
  4621	
  4622				cpu-3-thermal {
  4623					polling-delay = <0>; /* milliseconds */
  4624					polling-delay-passive = <0>; /* milliseconds */
  4625					thermal-sensors = <&lvts 5>;
  4626					trips {
  4627						cpu_little_core3_crit: cpu-little-core3-crit {
  4628							temperature = <118800>;
  4629							hysteresis = <2000>;
  4630							type = "critical";
  4631						};
  4632					};
  4633				};
  4634	
  4635				cpu-0-thermal {
  4636					polling-delay = <0>; /* milliseconds */
  4637					polling-delay-passive = <0>; /* milliseconds */
  4638					thermal-sensors = <&lvts 6>;
  4639					trips {
  4640						cpu_little_core0_crit: cpu-little-core0-crit {
  4641							temperature = <118800>;
  4642							hysteresis = <2000>;
  4643							type = "critical";
  4644						};
  4645					};
  4646				};
  4647	
  4648				cpu-1-thermal {
  4649					polling-delay = <0>; /* milliseconds */
  4650					polling-delay-passive = <0>; /* milliseconds */
  4651					thermal-sensors = <&lvts 7>;
  4652					trips {
  4653						cpu_little_core1_crit: cpu-little-core1-crit {
  4654							temperature = <118800>;
  4655							hysteresis = <2000>;
  4656							type = "critical";
  4657						};
  4658					};
  4659				};
  4660	
  4661				cpu-2-thermal {
  4662					polling-delay = <0>; /* milliseconds */
  4663					polling-delay-passive = <0>; /* milliseconds */
  4664					thermal-sensors = <&lvts 8>;
  4665					trips {
  4666						cpu_little_core2_crit: cpu-little-core2-crit {
  4667							temperature = <118800>;
  4668							hysteresis = <2000>;
  4669							type = "critical";
  4670						};
  4671					};
  4672				};
  4673	
  4674				cpu-4-0-thermal {
  4675					polling-delay = <0>; /* milliseconds */
  4676					polling-delay-passive = <0>; /* milliseconds */
  4677					thermal-sensors = <&lvts 9>;
  4678					trips {
  4679						cpu_medium_core4_0_crit: cpu-medium-core4-0-crit {
  4680							temperature = <118800>;
  4681							hysteresis = <2000>;
  4682							type = "critical";
  4683						};
  4684					};
  4685				};
  4686	
  4687				cpu-4-1-thermal {
  4688					polling-delay = <0>; /* milliseconds */
  4689					polling-delay-passive = <0>; /* milliseconds */
  4690					thermal-sensors = <&lvts 10>;
  4691					trips {
  4692						cpu_medium_core4_1_crit: cpu-medium-core4-1-crit {
  4693							temperature = <118800>;
  4694							hysteresis = <2000>;
  4695							type = "critical";
  4696						};
  4697					};
  4698				};
  4699	
  4700				cpu-5-0-thermal {
  4701					polling-delay = <0>; /* milliseconds */
  4702					polling-delay-passive = <0>; /* milliseconds */
  4703					thermal-sensors = <&lvts 11>;
  4704					trips {
  4705						cpu_medium_core5_0_crit: cpu-medium-core5-0-crit {
  4706							temperature = <118800>;
  4707							hysteresis = <2000>;
  4708							type = "critical";
  4709						};
  4710					};
  4711				};
  4712	
  4713				cpu-5-1-thermal {
  4714					polling-delay = <0>; /* milliseconds */
  4715					polling-delay-passive = <0>; /* milliseconds */
  4716					thermal-sensors = <&lvts 12>;
  4717					trips {
  4718						cpu_medium_core5_1_crit: cpu-medium-core5-1-crit {
  4719							temperature = <118800>;
  4720							hysteresis = <2000>;
  4721							type = "critical";
  4722						};
  4723					};
  4724				};
  4725	
  4726				cpu-dsu0-thermal {
  4727					polling-delay = <0>; /* milliseconds */
  4728					polling-delay-passive = <0>; /* milliseconds */
  4729					thermal-sensors = <&lvts 13>;
  4730					trips {
  4731						cpu_dsu0_crit: cpu-dsu0-crit {
  4732							temperature = <118800>;
  4733							hysteresis = <2000>;
  4734							type = "critical";
  4735						};
  4736					};
  4737				};
  4738	
  4739				cpu-dsu1-thermal {
  4740					polling-delay = <0>; /* milliseconds */
  4741					polling-delay-passive = <0>; /* milliseconds */
  4742					thermal-sensors = <&lvts 14>;
  4743					trips {
  4744						cpu_dsu1_crit: cpu-dsu1-crit {
  4745							temperature = <118800>;
  4746							hysteresis = <2000>;
  4747							type = "critical";
  4748						};
  4749					};
  4750				};
  4751	
  4752				cpu-7-0-thermal {
  4753					polling-delay = <0>; /* milliseconds */
  4754					polling-delay-passive = <0>; /* milliseconds */
  4755					thermal-sensors = <&lvts 15>;
  4756					trips {
  4757						cpu_big_core7_0_crit: cpu-big-core7-0-crit {
  4758							temperature = <118800>;
  4759							hysteresis = <2000>;
  4760							type = "critical";
  4761						};
  4762					};
  4763				};
  4764	
  4765				cpu-7-1-thermal {
  4766					polling-delay = <0>; /* milliseconds */
  4767					polling-delay-passive = <0>; /* milliseconds */
  4768					thermal-sensors = <&lvts 16>;
  4769					trips {
  4770						cpu_big_core7_1_crit: cpu-big-core7-1-crit {
  4771							temperature = <118800>;
  4772							hysteresis = <2000>;
  4773							type = "critical";
  4774						};
  4775					};
  4776				};
  4777	
  4778				apu-a0-thermal {
  4779					polling-delay = <0>; /* milliseconds */
  4780					polling-delay-passive = <0>; /* milliseconds */
  4781					thermal-sensors = <&lvts 17>;
  4782					trips {
  4783						apu_a0_crit: apu-a0-crit {
  4784							temperature = <118800>;
  4785							hysteresis = <2000>;
  4786							type = "critical";
  4787						};
  4788					};
  4789				};
  4790	
  4791				apu-a1-thermal {
  4792					polling-delay = <0>; /* milliseconds */
  4793					polling-delay-passive = <0>; /* milliseconds */
  4794					thermal-sensors = <&lvts 18>;
  4795					trips {
  4796						apu_a1_crit: apu-a1-crit {
  4797							temperature = <118800>;
  4798							hysteresis = <2000>;
  4799							type = "critical";
  4800						};
  4801					};
  4802				};
  4803	
  4804				apu-a2-thermal {
  4805					polling-delay = <0>; /* milliseconds */
  4806					polling-delay-passive = <0>; /* milliseconds */
  4807					thermal-sensors = <&lvts 19>;
  4808					trips {
  4809						apu_a2_crit: apu-a2-crit {
  4810							temperature = <118800>;
  4811							hysteresis = <2000>;
  4812							type = "critical";
  4813						};
  4814					};
  4815				};
  4816	
  4817				apu-a3-thermal {
  4818					polling-delay = <0>; /* milliseconds */
  4819					polling-delay-passive = <0>; /* milliseconds */
  4820					thermal-sensors = <&lvts 20>;
  4821					trips {
  4822						apu_a3_crit: apu-a3-crit {
  4823							temperature = <118800>;
  4824							hysteresis = <2000>;
  4825							type = "critical";
  4826						};
  4827					};
  4828				};
  4829	
  4830				gpu0-thermal {
  4831					polling-delay = <0>; /* milliseconds */
  4832					polling-delay-passive = <0>; /* milliseconds */
  4833					thermal-sensors = <&lvts 21>;
  4834					trips {
  4835						gpu0_crit: gpu0-crit {
  4836							temperature = <118800>;
  4837							hysteresis = <2000>;
  4838							type = "critical";
  4839						};
  4840					};
  4841				};
  4842	
  4843				gpu1-thermal {
  4844					polling-delay = <0>; /* milliseconds */
  4845					polling-delay-passive = <0>; /* milliseconds */
  4846					thermal-sensors = <&lvts 22>;
  4847					trips {
  4848						gpu1_crit: gpu1-crit {
  4849							temperature = <118800>;
  4850							hysteresis = <2000>;
  4851							type = "critical";
  4852						};
  4853					};
  4854				};
  4855	
  4856				soc-top0-thermal {
  4857					polling-delay = <0>; /* milliseconds */
  4858					polling-delay-passive = <0>; /* milliseconds */
  4859					thermal-sensors = <&lvts 23>;
  4860					trips {
  4861						soc_top0_crit: soc-top0-crit {
  4862							temperature = <118800>;
  4863							hysteresis = <2000>;
  4864							type = "critical";
  4865						};
  4866					};
  4867				};
  4868	
  4869				soc-top1-thermal {
  4870					polling-delay = <0>; /* milliseconds */
  4871					polling-delay-passive = <0>; /* milliseconds */
  4872					thermal-sensors = <&lvts 24>;
  4873					trips {
  4874						soc_top1_crit: soc-top1-crit {
  4875							temperature = <118800>;
  4876							hysteresis = <2000>;
  4877							type = "critical";
  4878						};
  4879					};
  4880				};
  4881	
  4882				soc-top2-thermal {
  4883					polling-delay = <0>; /* milliseconds */
  4884					polling-delay-passive = <0>; /* milliseconds */
  4885					thermal-sensors = <&lvts 25>;
  4886					trips {
  4887						soc_top2_crit: soc-top2-crit {
  4888							temperature = <118800>;
  4889							hysteresis = <2000>;
  4890							type = "critical";
  4891						};
  4892					};
  4893				};
  4894	
  4895				soc-top3-thermal {
  4896					polling-delay = <0>; /* milliseconds */
  4897					polling-delay-passive = <0>; /* milliseconds */
  4898					thermal-sensors = <&lvts 26>;
  4899					trips {
  4900						soc_top3_crit: soc-top3-crit {
  4901							temperature = <118800>;
  4902							hysteresis = <2000>;
  4903							type = "critical";
  4904						};
  4905					};
  4906				};
  4907	
  4908				soc-bot0-thermal {
  4909					polling-delay = <0>; /* milliseconds */
  4910					polling-delay-passive = <0>; /* milliseconds */
  4911					thermal-sensors = <&lvts 27>;
  4912					trips {
  4913						soc_bot0_crit: soc-bot0-crit {
  4914							temperature = <118800>;
  4915							hysteresis = <2000>;
  4916							type = "critical";
  4917						};
  4918					};
  4919				};
  4920	
  4921				soc-bot1-thermal {
  4922					polling-delay = <0>; /* milliseconds */
  4923					polling-delay-passive = <0>; /* milliseconds */
  4924					thermal-sensors = <&lvts 28>;
  4925					trips {
  4926						soc_bot1_crit: soc-bot1-crit {
  4927							temperature = <118800>;
  4928							hysteresis = <2000>;
  4929							type = "critical";
  4930						};
  4931					};
  4932				};
  4933	
  4934				soc-bot2-thermal {
  4935					polling-delay = <0>; /* milliseconds */
  4936					polling-delay-passive = <0>; /* milliseconds */
  4937					thermal-sensors = <&lvts 29>;
  4938					trips {
  4939						soc_bot2_crit: soc-bot2-crit {
  4940							temperature = <118800>;
  4941							hysteresis = <2000>;
  4942							type = "critical";
  4943						};
  4944					};
  4945				};
  4946	
  4947				soc-bot3-thermal {
  4948					polling-delay = <0>; /* milliseconds */
  4949					polling-delay-passive = <0>; /* milliseconds */
  4950					thermal-sensors = <&lvts 30>;
  4951					trips {
  4952						soc_bot3_crit: soc-bot3-crit {
  4953							temperature = <118800>;
  4954							hysteresis = <2000>;
  4955							type = "critical";
  4956						};
  4957					};
  4958				};
  4959			};
  4960		};
  4961	};
  4962	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
