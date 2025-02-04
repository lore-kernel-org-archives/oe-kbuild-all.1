Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1555114B094
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 03:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738639692; cv=none; b=G1DSDTtvi4wIBcqR2DMQnPhQCokeLq1hNYnOigJCLKrguDGtwF887btvNZPpg96oXNzUMElOvFX/BCZrh8OsRCyv5RkMWplVviu/mu/PJnEoOl/vwcf4cByo5rpz6UqSx5L8wq9AWulPzYbl6aePS99skOWl2KeR6i0aMcvRZLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738639692; c=relaxed/simple;
	bh=wxKW+I3LzUr440d7/FVHTkYLl9ze4mfdvTDNZ1LpGJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+dMyanM0d7VFWbG0J9C66h2t9Ya3KReg9XE/D0iRBPWDo9cMYIb44AzVXy1ZGu41YZ1F8XHci2/nCmaevpG6ryPsCT7+Pp6c/01j8JtTTNDYYbjBeluukcxtRf7lMwElgkEJtakDix88HGrV2GAJlQhuZiBLG6f6tjP4UDvFcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4a2pQI5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4a2pQI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738639687; x=1770175687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wxKW+I3LzUr440d7/FVHTkYLl9ze4mfdvTDNZ1LpGJM=;
  b=Q4a2pQI5IyzAwBG/qC+vy1E7kDCI3/2/uVhqsPVmi6jZuR8hu7nrQrGC
   yibwwTRK94rh2Z7JDoL7JljLyqpzIMNbMsXjdt3QgIxlRbixVb5ltxDV5
   ZFDrnmVKlPsFvwl5aDK7HnlkK6fgANaLPQCUaFbQQaXiT36sdxAbj79m2
   z3/mtw+TvJ8OvsJOAABQIOsN7KWbeXSHFG0YfvIiePbu6c5HeYSx5cmiJ
   5N+4DR9H66dX1cVP/PiMg/PbDI70bsWmcBokDfsB6GlvnGJNy+TOGTDDa
   whbd6DyblNHIJUahtS+Jiu7W3/OMg4sTw09MLR/SMWrdGL53rvLnHNGmI
   g==;
X-CSE-ConnectionGUID: Irmr4sDgQSyZtVB4uNMEtQ==
X-CSE-MsgGUID: Srx+9GGXRu2NQTqZpzINgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39305650"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="39305650"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 19:28:06 -0800
X-CSE-ConnectionGUID: UqXZsjZ7T/mz4y3RU+8+SA==
X-CSE-MsgGUID: BIoNFG6ITJipHjXMrHMp5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133716524"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2025 19:28:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf9bW-000rul-1d;
	Tue, 04 Feb 2025 03:28:02 +0000
Date: Tue, 4 Feb 2025 11:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 169/169]
 arch/arm64/boot/dts/mediatek/mt8196.dtsi:3436.16-3444.5: Warning
 (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
Message-ID: <202502041103.jBOHVAMS-lkp@intel.com>
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
commit: 2f2aff80fd0e0d01257aa3520f7b259d5bd3d507 [169/169] CHROMIUM: arm64: dts: mediatek: mt8196: config audio driver and codec node
config: arm64-randconfig-004-20250204 (https://download.01.org/0day-ci/archive/20250204/202502041103.jBOHVAMS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041103.jBOHVAMS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041103.jBOHVAMS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt6363.dtsi:139.40-141.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/pmic@4/mt6363-efuse/mt6363_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:72.40-74.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/second_pmic@5/mt6373-efuse/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:8.25-76.4: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:65.21-67.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:68.19-70.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:71.21-74.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2194.10-2198.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2200.14-2204.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:45.27-52.4: Warning (unit_address_vs_reg): /regulator@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:3436.16-3444.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:642.37-667.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:58.8-68.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:74.8-84.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +3436 arch/arm64/boot/dts/mediatek/mt8196.dtsi

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
   554			vcp_resv_mem: vcp-reserved-memory@a0200000 {
   555				compatible = "mediatek,me-vcp-reserved";
   556				reg = <0 0xa0200000 0 0x01e00000>; /* 30MB */
   557				iommu-addresses = <0 0x00000000 1 0x40000000>; /* 1G */
   558				no-map;
   559			};
   560		};
   561	
   562		timer: timer {
   563			compatible = "arm,armv8-timer";
   564			interrupt-parent = <&gic>;
   565			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
   566					<GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
   567					<GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
   568					<GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
   569			clock-frequency = <13000000>;
   570		};
   571	
   572		psci {
   573			compatible = "arm,psci-1.0";
   574			method = "smc";
   575		};
   576	
   577		soc {
   578			compatible = "simple-bus";
   579			#address-cells = <2>;
   580			#size-cells = <2>;
   581			ranges;
   582			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
   583	
   584			csram_sys: csram-sysram@11bc00 {
   585				reg = <0 0x11bc00 0 0x1400>; /* 5KB */
   586			};
   587	
   588			cpu_mcucfg: mcusys-ao-cfg@c000000 {
   589				reg = <0 0xc000000 0 0x10000>; /* 64KB */
   590			};
   591	
   592			cpu_pll: mcusys-pll1u-top@c030000 {
   593				reg = <0 0xc030000 0 0x1000>; /* 4KB */
   594			};
   595	
   596			ccipll_pll_ctrl_clk: syscon@c1e0000 {
   597				/* TODO: Fix compatible in driver */
   598				compatible = "mediatek,mt8196-ccipll-pll-ctrl", "mediatek,mt8196-ccipll_pll_ctrl", "syscon";
   599				reg = <0 0xc1e0000 0 0x400>;
   600				#clock-cells = <1>;
   601			};
   602	
   603			armpll_ll_pll_ctrl_clk: syscon@c1e0400 {
   604				/* TODO: Fix compatible in driver */
   605				compatible = "mediatek,mt8196-armpll-ll-pll-ctrl", "mediatek,mt8196-armpll_ll_pll_ctrl", "syscon";
   606				reg = <0 0xc1e0400 0 0x400>;
   607				#clock-cells = <1>;
   608			};
   609	
   610			armpll_bl_pll_ctrl_clk: syscon@c1e0800 {
   611				/* TODO: Fix compatible in driver */
   612				compatible = "mediatek,mt8196-armpll-bl-pll-ctrl", "mediatek,mt8196-armpll_bl_pll_ctrl", "syscon";
   613				reg = <0 0xc1e0800 0 0x400>;
   614				#clock-cells = <1>;
   615			};
   616	
   617			armpll_b_pll_ctrl_clk: syscon@c1e0c00 {
   618				/* TODO: Fix compatible in driver */
   619				compatible = "mediatek,mt8196-armpll-b-pll-ctrl", "mediatek,mt8196-armpll_b_pll_ctrl", "syscon";
   620				reg = <0 0xc1e0c00 0 0x1000>;
   621				#clock-cells = <1>;
   622			};
   623	
   624			ptppll_pll_ctrl_clk: syscon@c1e4000 {
   625				/* TODO: Fix compatible in driver */
   626				compatible = "mediatek,mt8196-ptppll-pll-ctrl", "mediatek,mt8196-ptppll_pll_ctrl", "syscon";
   627				reg = <0 0xc1e4000 0 0x1000>;
   628				#clock-cells = <1>;
   629			};
   630	
   631			performance: performance-controller@c2c0f20 {
   632				compatible = "mediatek,cpufreq-hw";
   633				reg = <0 0xc2c0f20 0 0x120>,
   634				      <0 0xc2c1040 0 0x120>,
   635				      <0 0xc2c1160 0 0x120>;
   636				reg-names = "performance-domain0",
   637					    "performance-domain1",
   638					    "performance-domain2";
   639				#performance-domain-cells = <1>;
   640			};
   641	
   642			gic: interrupt-controller@c400000 {
   643				compatible = "arm,gic-v3";
   644				reg = <0 0xc400000 0 0x40000>, /* distributor */
   645				      <0 0xc440000 0 0x200000>; /* redistributor */
   646				#interrupt-cells = <4>;
   647				#address-cells = <2>;
   648				#size-cells = <2>;
   649				#redistributor-regions = <1>;
   650				interrupt-parent = <&gic>;
   651				interrupt-controller;
   652				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
   653	
   654				ppi-partitions {
   655					ppi_cluster0: interrupt-partition-0 {
   656						affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
   657					};
   658	
   659					ppi_cluster1: interrupt-partition-1 {
   660						affinity = <&cpu4 &cpu5 &cpu6>;
   661					};
   662	
   663					ppi_cluster2: interrupt-partition-2 {
   664						affinity = <&cpu7>;
   665					};
   666				};
   667			};
   668	
   669			cksys_clk: syscon@10000000 {
   670				compatible = "mediatek,mt8196-cksys", "syscon";
   671				reg = <0 0x10000000 0 0x800>;
   672				hw-voter-regmap = <&hwv>;
   673				#clock-cells = <1>;
   674			};
   675	
   676			apmixedsys_clk: syscon@10000800 {
   677				compatible = "mediatek,mt8196-apmixedsys", "syscon";
   678				reg = <0 0x10000800 0 0x1000>;
   679				#clock-cells = <1>;
   680			};
   681	
   682			cksys_gp2_clk: syscon@1000c000 {
   683				compatible = "mediatek,mt8196-cksys-gp2", "syscon";
   684				reg = <0 0x1000c000 0 0x800>;
   685				mm-hw-ccf-regmap = <&mm_hwv>;
   686				#clock-cells = <1>;
   687			};
   688	
   689			apmixedsys_gp2_clk: syscon@1000c800 {
   690				/* TODO: Fix compatible in driver */
   691				compatible = "mediatek,mt8196-apmixedsys-gp2", "mediatek,mt8196-apmixedsys_gp2", "syscon";
   692				reg = <0 0x1000c800 0 0x1000>;
   693				#clock-cells = <1>;
   694			};
   695	
   696			ifr_bus: syscon@1002c000 {
   697				/* TODO: Fix compatible in driver */
   698				compatible = "mediatek,mt8196-ifr-bus", "mediatek,mt8196-ifr_bus", "syscon";
   699				reg = <0 0x1002c000 0 0x1000>;
   700			};
   701	
   702			pio: pinctrl@1002d000 {
   703				compatible = "mediatek,mt8196-pinctrl";
   704				reg = <0 0x1002d000 0 0x1000>,
   705				      <0 0x12000000 0 0x1000>,
   706				      <0 0x12020000 0 0x1000>,
   707				      <0 0x12040000 0 0x1000>,
   708				      <0 0x12060000 0 0x1000>,
   709				      <0 0x12820000 0 0x1000>,
   710				      <0 0x12840000 0 0x1000>,
   711				      <0 0x12860000 0 0x1000>,
   712				      <0 0x13000000 0 0x1000>,
   713				      <0 0x13020000 0 0x1000>,
   714				      <0 0x13040000 0 0x1000>,
   715				      <0 0x130f0000 0 0x1000>,
   716				      <0 0x13110000 0 0x1000>,
   717				      <0 0x13800000 0 0x1000>,
   718				      <0 0x13820000 0 0x1000>,
   719				      <0 0x13860000 0 0x1000>,
   720				      <0 0x12080000 0 0x1000>,
   721				      <0 0x12880000 0 0x1000>,
   722				      <0 0x13080000 0 0x1000>,
   723				      <0 0x13880000 0 0x1000>,
   724				      <0 0x1c54a000 0 0x1000>;
   725				reg-names = "iocfg0",
   726					    "iocfg_rt",
   727					    "iocfg_rm1",
   728					    "iocfg_rm2",
   729					    "iocfg_rb",
   730					    "iocfg_bm1",
   731					    "iocfg_bm2",
   732					    "iocfg_bm3",
   733					    "iocfg_lt",
   734					    "iocfg_lm1",
   735					    "iocfg_lm2",
   736					    "iocfg_lb1",
   737					    "iocfg_lb2",
   738					    "iocfg_tm1",
   739					    "iocfg_tm2",
   740					    "iocfg_tm3",
   741					    "eint-e",
   742					    "eint-s",
   743					    "eint-w",
   744					    "eint-n",
   745					    "eint-c";
   746				gpio-controller;
   747				#gpio-cells = <2>;
   748				gpio-ranges = <&pio 0 0 271>;
   749				interrupt-controller;
   750				interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH 0>;
   751				#interrupt-cells = <2>;
   752			};
   753	
   754			devapc_apinfra_dramc: devapc@102f3000 {
   755				compatible = "mediatek,mt8196-devapc";
   756				reg = <0 0x102f3000 0 0x1000>;
   757				vio-idx-num = <61>;
   758				interrupts = <GIC_SPI 870 IRQ_TYPE_LEVEL_HIGH 0>;
   759			};
   760	
   761			devapc_apinfra_emi: devapc@10613000 {
   762				compatible = "mediatek,mt8196-devapc";
   763				reg = <0 0x10613000 0 0x1000>;
   764				vio-idx-num = <149>;
   765				interrupts = <GIC_SPI 869 IRQ_TYPE_LEVEL_HIGH 0>;
   766			};
   767	
   768			devapc_apinfra_big4: devapc@10693000 {
   769				compatible = "mediatek,mt8196-devapc";
   770				reg = <0 0x10693000 0 0x1000>;
   771				vio-idx-num = <89>;
   772				interrupts = <GIC_SPI 863 IRQ_TYPE_LEVEL_HIGH 0>;
   773			};
   774	
   775			i2c5: i2c@120a0000 {
   776				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   777				reg = <0 0x120a0000 0 0x20000>,
   778				      <0 0x16400000 0 0x10000>;
   779				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
   780				clocks = <&imp_iic_wrap_e_clk CLK_IMPE_I2C5_I2C>,
   781					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   782				clock-names = "main", "dma";
   783				clock-div = <1>;
   784				#address-cells = <1>;
   785				#size-cells = <0>;
   786	
   787				status = "disabled";
   788			};
   789	
   790			imp_iic_wrap_e_clk: syscon@120c0000 {
   791				/* TODO: Fix compatible in driver */
   792				compatible = "mediatek,mt8196-imp-iic-wrap-e", "mediatek,mt8196-imp_iic_wrap_e", "syscon";
   793				reg = <0 0x120c0000 0 0x1000>;
   794				#clock-cells = <1>;
   795			};
   796	
   797			mipi_tx_config0: mipi-tx-config@130b0000 {
   798				compatible = "mediatek,mt8196-mipi-tx";
   799				reg = <0 0x130b0000 0 0x1000>;
   800				clocks = <&clk26m>;
   801				#clock-cells = <0>;
   802				#phy-cells = <0>;
   803				clock-output-names = "mipi_tx0_pll";
   804			};
   805	
   806			i2c0: i2c@13130000 {
   807				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   808				reg = <0 0x13130000 0 0x20000>,
   809				      <0 0x16370000 0 0x10000>;
   810				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
   811				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C0_I2C>,
   812					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   813				clock-names = "main", "dma";
   814				clock-div = <1>;
   815				#address-cells = <1>;
   816				#size-cells = <0>;
   817	
   818				status = "disabled";
   819			};
   820	
   821			i2c3: i2c@13150000 {
   822				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   823				reg = <0 0x13150000 0 0x20000>,
   824				      <0 0x163c0000 0 0x10000>;
   825				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH 0>;
   826				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C3_I2C>,
   827					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   828				clock-names = "main", "dma";
   829				clock-div = <1>;
   830				#address-cells = <1>;
   831				#size-cells = <0>;
   832	
   833				status = "disabled";
   834			};
   835	
   836			i2c6: i2c@13170000 {
   837				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   838				reg = <0 0x13170000 0 0x20000>,
   839				      <0 0x16410000 0 0x10000>;
   840				interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
   841				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C6_I2C>,
   842					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   843				clock-names = "main", "dma";
   844				clock-div = <1>;
   845				#address-cells = <1>;
   846				#size-cells = <0>;
   847	
   848				status = "disabled";
   849			};
   850	
   851			i2c10: i2c@13190000 {
   852				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   853				reg = <0 0x13190000 0 0x20000>,
   854				      <0 0x164b0000 0 0x10000>;
   855				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
   856				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C10_I2C>,
   857					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   858				clock-names = "main", "dma";
   859				clock-div = <1>;
   860				#address-cells = <1>;
   861				#size-cells = <0>;
   862	
   863				status = "disabled";
   864			};
   865	
   866			imp_iic_wrap_w_clk: syscon@131b0000 {
   867				/* TODO: Fix compatible in driver */
   868				compatible = "mediatek,mt8196-imp-iic-wrap-w", "mediatek,mt8196-imp_iic_wrap_w", "syscon";
   869				reg = <0 0x131b0000 0 0x1000>;
   870				#clock-cells = <1>;
   871			};
   872	
   873			efuse: efuse@13260000 {
   874				compatible = "mediatek,mt8196-efuse", "mediatek,efuse";
   875				reg = <0 0x13260000 0 0x1000>;
   876				#address-cells = <1>;
   877				#size-cells = <1>;
   878			};
   879	
   880			i2c1: i2c@13930000 {
   881				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   882				reg = <0 0x13930000 0 0x80000>,
   883				      <0 0x16380000 0 0x10000>;
   884				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH 0>;
   885				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C1_I2C>,
   886					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   887				clock-names = "main", "dma";
   888				clock-div = <1>;
   889				#address-cells = <1>;
   890				#size-cells = <0>;
   891	
   892				status = "disabled";
   893			};
   894	
   895			i2c2: i2c@139b0000 {
   896				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   897				reg = <0 0x139b0000 0 0x80000>,
   898				      <0 0x16390000 0 0x30000>;
   899				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH 0>;
   900				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C2_I2C>,
   901					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   902				clock-names = "main", "dma";
   903				clock-div = <1>;
   904				#address-cells = <1>;
   905				#size-cells = <0>;
   906	
   907				status = "disabled";
   908			};
   909	
   910			i2c4: i2c@13a30000 {
   911				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   912				reg = <0 0x13a30000 0 0x80000>,
   913				      <0 0x163d0000 0 0x30000>;
   914				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
   915				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C4_I2C>,
   916					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   917				clock-names = "main", "dma";
   918				clock-div = <1>;
   919				#address-cells = <1>;
   920				#size-cells = <0>;
   921	
   922				status = "disabled";
   923			};
   924	
   925			i2c7: i2c@13ab0000 {
   926				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   927				reg = <0 0x13ab0000 0 0x80000>,
   928				      <0 0x16420000 0 0x30000>;
   929				interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
   930				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C7_I2C>,
   931					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   932				clock-names = "main", "dma";
   933				clock-div = <1>;
   934				#address-cells = <1>;
   935				#size-cells = <0>;
   936	
   937				status = "disabled";
   938			};
   939	
   940			i2c8: i2c@13b30000 {
   941				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   942				reg = <0 0x13b30000 0 0x80000>,
   943				      <0 0x16450000 0 0x30000>;
   944				interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH 0>;
   945				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C8_I2C>,
   946					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   947				clock-names = "main", "dma";
   948				clock-div = <1>;
   949				#address-cells = <1>;
   950				#size-cells = <0>;
   951	
   952				status = "disabled";
   953			};
   954	
   955			i2c9: i2c@13bb0000 {
   956				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
   957				reg = <0 0x13bb0000 0 0x80000>,
   958				      <0 0x16480000 0 0x30000>;
   959				interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH 0>;
   960				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C9_I2C>,
   961					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
   962				clock-names = "main", "dma";
   963				clock-div = <1>;
   964				#address-cells = <1>;
   965				#size-cells = <0>;
   966	
   967				status = "disabled";
   968			};
   969	
   970			imp_iic_wrap_n_clk: syscon@13c30000 {
   971				/* TODO: Fix compatible in driver */
   972				compatible = "mediatek,mt8196-imp-iic-wrap-n", "mediatek,mt8196-imp_iic_wrap_n", "syscon";
   973				reg = <0 0x13c30000 0 0x1000>;
   974				hw-voter-regmap = <&hwv>;
   975				#clock-cells = <1>;
   976			};
   977	
   978			devapc_apinfra_io_intf: devapc@140a0000 {
   979				compatible = "mediatek,mt8196-devapc";
   980				reg = <0 0x140a0000 0 0x1000>;
   981				vio-idx-num = <8>;
   982				interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH 0>;
   983			};
   984	
   985			devapc_apinfra_mem_intf: devapc@140c0000 {
   986				compatible = "mediatek,mt8196-devapc";
   987				reg = <0 0x140c0000 0 0x1000>;
   988				vio-idx-num = <7>;
   989				interrupts = <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH 0>;
   990			};
   991	
   992			devapc_apinfra_slb: devapc@140e0000 {
   993				compatible = "mediatek,mt8196-devapc";
   994				reg = <0 0x140e0000 0 0x1000>;
   995				vio-idx-num = <14>;
   996				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH 0>;
   997			};
   998	
   999			apifrbus_ao_mem_reg_clk: syscon@14126000 {
  1000				/* TODO: Fix compatible in driver */
  1001				compatible = "mediatek,mt8196-apifrbus-ao-mem-reg", "mediatek,mt8196-apifrbus_ao_mem_reg", "syscon";
  1002				reg = <0 0x14126000 0 0x1000>;
  1003				#clock-cells = <1>;
  1004			};
  1005	
  1006			devapc_apinfra_mem: devapc@14130000 {
  1007				compatible = "mediatek,mt8196-devapc";
  1008				reg = <0 0x14130000 0 0x1000>;
  1009				vio-idx-num = <13>;
  1010				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH 0>;
  1011			};
  1012	
  1013			devapc_apinfra_mem_ctrl: devapc@14131000 {
  1014				compatible = "mediatek,mt8196-devapc";
  1015				reg = <0 0x14131000 0 0x1000>;
  1016				vio-idx-num = <23>;
  1017				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH 0>;
  1018			};
  1019	
  1020			infracfg@14136000 {
  1021				compatible = "mediatek,infracfg";
  1022				reg = <0 0x14136000 0 0x1000>;
  1023			};
  1024	
  1025			devapc_apinfra_int: devapc@142f4000 {
  1026				compatible = "mediatek,mt8196-devapc";
  1027				reg = <0 0x142f4000 0 0x1000>;
  1028				vio-idx-num = <26>;
  1029				interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH 0>;
  1030			};
  1031	
  1032			devapc_apinfra_io_ctrl: devapc@14400000 {
  1033				compatible = "mediatek,mt8196-devapc";
  1034				reg = <0 0x14400000 0 0x1000>;
  1035				vio-idx-num = <10>;
  1036				interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH 0>;
  1037			};
  1038	
  1039			devapc_apinfra_io: devapc@14401000 {
  1040				compatible = "mediatek,mt8196-devapc";
  1041				reg = <0 0x14401000 0 0x1000>;
  1042				vio-idx-num = <230>;
  1043				interrupts = <GIC_SPI 867 IRQ_TYPE_LEVEL_HIGH 0>;
  1044			};
  1045	
  1046			hwv: syscon@14500000 {
  1047				compatible = "mediatek,mt8196-hwv", "syscon";
  1048				reg = <0 0x14500000 0 0x3000>;
  1049			};
  1050	
  1051			devapc_apinfra_mmu: devapc@14800000 {
  1052				compatible = "mediatek,mt8196-devapc";
  1053				reg = <0 0x14800000 0 0x1000>;
  1054				vio-idx-num = <20>;
  1055				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH 0>;
  1056			};
  1057	
  1058			uart0: serial@16000000 {
  1059				compatible = "mediatek,mt6577-uart";
  1060				reg = <0 0x16000000 0 0x1000>;
  1061				interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH 0>;
  1062				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART0_BCLK_UART>;
  1063				clock-names = "baud", "bus";
  1064	
  1065				status = "disabled";
  1066			};
  1067	
  1068			uart1: serial@16010000 {
  1069				compatible = "mediatek,mt6577-uart";
  1070				reg = <0 0x16010000 0 0x1000>;
  1071				interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH 0>;
  1072				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART1_BCLK_UART>;
  1073				clock-names = "baud", "bus";
  1074	
  1075				status = "disabled";
  1076			};
  1077	
  1078			uart2: serial@16020000 {
  1079				compatible = "mediatek,mt6577-uart";
  1080				reg = <0 0x16020000 0 0x1000>;
  1081				interrupts = <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH 0>;
  1082				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART2_BCLK_UART>;
  1083				clock-names = "baud", "bus";
  1084	
  1085				status = "disabled";
  1086			};
  1087	
  1088			uart3: serial@16030000 {
  1089				compatible = "mediatek,mt6985-uart";
  1090				reg = <0 0x16030000 0 0x1000>;
  1091				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH 0>,
  1092					     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH 0>;    /* uart3 wakeup irq */
  1093				clocks = <&clk104m>, <&pericfg_ao_clk CLK_PERAO_UART3_BCLK_UART>;
  1094				clock-names = "baud", "bus";
  1095	
  1096				status = "disabled";
  1097			};
  1098	
  1099			disp_pwm0: disp-pwm0@160b0000 {
  1100				compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
  1101				reg = <0 0x160b0000 0 0x1000>;
  1102				interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
  1103				#pwm-cells = <2>;
  1104				clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
  1105				clock-names = "main";
  1106				status = "disabled";
  1107			};
  1108	
  1109			disp_pwm1: disp-pwm1@160c0000 {
  1110				compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
  1111				reg = <0 0x160c0000 0 0x1000>;
  1112				#pwm-cells = <2>;
  1113				clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
  1114				clock-names = "main";
  1115				status = "disabled";
  1116			};
  1117	
  1118			spi0: spi@16110000 {
  1119				compatible = "mediatek,mt8196-spi";
  1120				reg = <0 0x16110000 0 0x100>;
  1121				interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
  1122				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1123					<&cksys_clk CLK_CK_SPI0_BCLK_SEL>,
  1124					<&pericfg_ao_clk CLK_PERAO_SPI0_BCLK_SPI>;
  1125				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1126				#address-cells = <1>;
  1127				#size-cells = <0>;
  1128				mediatek,pad-select = <0>;
  1129	
  1130				status = "disabled";
  1131			};
  1132	
  1133			spi1: spi@16130000 {
  1134				compatible = "mediatek,mt8196-spi";
  1135				reg = <0 0x16130000 0 0x100>;
  1136				interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
  1137				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1138					<&cksys_clk CLK_CK_SPI1_BCLK_SEL>,
  1139					<&pericfg_ao_clk CLK_PERAO_SPI1_BCLK_SPI>;
  1140				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1141				#address-cells = <1>;
  1142				#size-cells = <0>;
  1143				mediatek,pad-select = <0>;
  1144	
  1145				status = "disabled";
  1146			};
  1147	
  1148			spi2: spi@16150000 {
  1149				compatible = "mediatek,mt8196-spi";
  1150				reg = <0 0x16150000 0 0x100>;
  1151				interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
  1152				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1153					<&cksys_clk CLK_CK_SPI2_BCLK_SEL>,
  1154					<&pericfg_ao_clk CLK_PERAO_SPI2_BCLK_SPI>;
  1155				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1156				#address-cells = <1>;
  1157				#size-cells = <0>;
  1158				mediatek,pad-select = <0>;
  1159	
  1160				status = "disabled";
  1161			};
  1162	
  1163			spi3: spi@16170000 {
  1164				compatible = "mediatek,mt8196-spi";
  1165				reg = <0 0x16170000 0 0x100>;
  1166				interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
  1167				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1168					<&cksys_clk CLK_CK_SPI3_BCLK_SEL>,
  1169					<&pericfg_ao_clk CLK_PERAO_SPI3_BCLK_SPI>;
  1170				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1171				#address-cells = <1>;
  1172				#size-cells = <0>;
  1173				mediatek,pad-select = <0>;
  1174	
  1175				status = "disabled";
  1176			};
  1177	
  1178			spi4: spi@16190000 {
  1179				compatible = "mediatek,mt8196-spi";
  1180				reg = <0 0x16190000 0 0x100>;
  1181				interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
  1182				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1183					<&cksys_clk CLK_CK_SPI4_BCLK_SEL>,
  1184					<&pericfg_ao_clk CLK_PERAO_SPI4_BCLK_SPI>;
  1185				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1186				#address-cells = <1>;
  1187				#size-cells = <0>;
  1188				mediatek,pad-select = <0>;
  1189	
  1190				status = "disabled";
  1191			};
  1192	
  1193			spi5: spi@161b0000 {
  1194				compatible = "mediatek,mt8196-spi";
  1195				reg = <0 0x161b0000 0 0x100>;
  1196				interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>;
  1197				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1198					<&cksys_clk CLK_CK_SPI5_BCLK_SEL>,
  1199					<&pericfg_ao_clk CLK_PERAO_SPI5_BCLK_SPI>;
  1200				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1201				#address-cells = <1>;
  1202				#size-cells = <0>;
  1203				mediatek,pad-select = <0>;
  1204	
  1205				status = "disabled";
  1206			};
  1207	
  1208			spi6: spi@161d0000 {
  1209				compatible = "mediatek,mt8196-spi";
  1210				reg = <0 0x161d0000 0 0x100>;
  1211				interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
  1212				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1213					<&cksys_clk CLK_CK_SPI6_BCLK_SEL>,
  1214					<&pericfg_ao_clk CLK_PERAO_SPI6_BCLK_SPI>;
  1215				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1216				#address-cells = <1>;
  1217				#size-cells = <0>;
  1218				mediatek,pad-select = <1>;
  1219	
  1220				status = "disabled";
  1221			};
  1222	
  1223			spi7: spi@161f0000 {
  1224				compatible = "mediatek,mt8196-spi";
  1225				reg = <0 0x161f0000 0 0x100>;
  1226				interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH 0>;
  1227				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1228					<&cksys_clk CLK_CK_SPI7_BCLK_SEL>,
  1229					<&pericfg_ao_clk CLK_PERAO_SPI7_BCLK_SPI>;
  1230				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1231				#address-cells = <1>;
  1232				#size-cells = <0>;
  1233				mediatek,pad-select = <0>;
  1234	
  1235				status = "disabled";
  1236			};
  1237	
  1238			i2c11: i2c@16200000 {
  1239				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1240				reg = <0 0x16200000 0 0x40000>,
  1241				      <0 0x164c0000 0 0x10000>;
  1242				interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH 0>;
  1243				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C11_I2C>,
  1244					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1245				clock-names = "main", "dma";
  1246				clock-div = <1>;
  1247				#address-cells = <1>;
  1248				#size-cells = <0>;
  1249	
  1250				status = "disabled";
  1251			};
  1252	
  1253			i2c12: i2c@16240000 {
  1254				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1255				reg = <0 0x16240000 0 0x40000>,
  1256				      <0 0x164d0000 0 0x20000>;
  1257				interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH 0>;
  1258				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C12_I2C>,
  1259					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1260				clock-names = "main", "dma";
  1261				clock-div = <1>;
  1262				#address-cells = <1>;
  1263				#size-cells = <0>;
  1264	
  1265				status = "disabled";
  1266			};
  1267	
  1268			i2c13: i2c@16280000 {
  1269				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1270				reg = <0 0x16280000 0 0x40000>,
  1271				      <0 0x164f0000 0 0x10000>;
  1272				interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
  1273				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C13_I2C>,
  1274					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1275				clock-names = "main", "dma";
  1276				clock-div = <1>;
  1277				#address-cells = <1>;
  1278				#size-cells = <0>;
  1279	
  1280				status = "disabled";
  1281			};
  1282	
  1283			i2c14: i2c@162c0000 {
  1284				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1285				reg = <0 0x162c0000 0 0x40000>,
  1286				      <0 0x16500000 0 0x10000>;
  1287				interrupts = <GIC_SPI 900 IRQ_TYPE_LEVEL_HIGH 0>;
  1288				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C14_I2C>,
  1289					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1290				clock-names = "main", "dma";
  1291				clock-div = <1>;
  1292				#address-cells = <1>;
  1293				#size-cells = <0>;
  1294	
  1295				status = "disabled";
  1296			};
  1297	
  1298			imp_iic_wrap_c_clk: syscon@16300000 {
  1299				/* TODO: Fix compatible in driver */
  1300				compatible = "mediatek,mt8196-imp-iic-wrap-c", "mediatek,mt8196-imp_iic_wrap_c", "syscon";
  1301				reg = <0 0x16300000 0 0x1000>;
  1302				#clock-cells = <1>;
  1303			};
  1304	
  1305			mmc1: mmc@16310000 {
  1306				compatible = "mediatek,mt8196-mmc";
  1307				reg = <0 0x16310000 0 0x1000>,
  1308				      <0 0x12a10000 0 0x1000>;
  1309				interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH 0>;
  1310				clocks = <&cksys_clk CLK_CK_MSDC30_1_SEL>,
  1311						<&pericfg_ao_clk CLK_PERAO_MSDC1_AXI_MSDC1>,
  1312						<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_MSDC1>,
  1313						<&pericfg_ao_clk CLK_PERAO_MSDC1_MSDC_SRC_MSDC1>,
  1314						<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_WRAP_MSDC1>;
  1315				clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
  1316	
  1317				status = "disabled";
  1318			};
  1319	
  1320			mmc2: mmc@16320000 {
  1321				compatible = "mediatek,mt8196-mmc";
  1322				reg = <0 0x16320000 0 0x1000>,
  1323				      <0 0x138a0000 0 0x1000>;
  1324				interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>;
  1325				clocks = <&cksys_clk CLK_CK_MSDC30_2_SEL>,
  1326						<&pericfg_ao_clk CLK_PERAO_MSDC2_AXI_MSDC2>,
  1327						<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_MSDC2>,
  1328						<&pericfg_ao_clk CLK_PERAO_MSDC2_MSDC_SRC_MSDC2>,
  1329						<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_WRAP_MSDC2>;
  1330				clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
  1331	
  1332				status = "disabled";
  1333			};
  1334	
  1335			pwm: pwm@16330000 {
  1336				compatible = "mediatek,pwm";
  1337				reg = <0 0x16330000 0 0x1000>;
  1338				interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH 0>;
  1339	
  1340				status = "disabled";
  1341			};
  1342	
  1343			nor_flash: spi@16340000 {
  1344				compatible = "mediatek,mt8196-nor",
  1345					     "mediatek,mt8186-nor";
  1346				reg = <0 0x16340000 0 0x1000>;
  1347				clocks = <&cksys_clk CLK_CK_SFLASH_SEL>,
  1348					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_FLASH_FLASHIF>,
  1349					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_DRAM_FLASHIF>,
  1350					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_AXI_FLASHIF>,
  1351					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_BCLK_FLASHIF>,
  1352					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_27M_FLASHIF>;
  1353				clock-names = "spi", "sf", "axi", "axi_s", "bclk", "27m";
  1354				assigned-clocks = <&cksys_clk CLK_CK_SFLASH_SEL>;
  1355				assigned-clock-parents = <&cksys_clk CLK_CK_UNIVPLL_D6_D8>;
  1356				interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>;
  1357				#address-cells = <1>;
  1358				#size-cells = <0>;
  1359				status = "disabled";
  1360			};
  1361	
  1362			pericfg_ao_clk: syscon@16640000 {
  1363				/* TODO: Fix compatible in driver */
  1364				compatible = "mediatek,mt8196-pericfg-ao", "mediatek,mt8196-pericfg_ao", "syscon";
  1365				reg = <0 0x16640000 0 0x1000>;
  1366				hw-voter-regmap = <&hwv>;
  1367				#clock-cells = <1>;
  1368			};
  1369	
  1370			devapc_peri: devapc@16670000 {
  1371				compatible = "mediatek,mt8196-devapc";
  1372				reg = <0 0x16670000 0 0x1000>;
  1373				vio-idx-num = <204>;
  1374				interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
  1375			};
  1376	
  1377			xhci0: usb@16700000 {
  1378				compatible = "mediatek,mtk-xhci";
  1379				reg = <0 0x16700000 0 0x1000>,
  1380				      <0 0x16703e00 0 0x0100>;
  1381				reg-names = "mac", "ippc";
  1382				interrupts-extended = <&gic GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH 0>,
  1383						      <&pio 273 IRQ_TYPE_LEVEL_LOW>;
  1384				interrupt-names = "host","wakeup";
  1385				phys = <&u2port0 PHY_TYPE_USB2>,
  1386				       <&u3port0 PHY_TYPE_USB3>;
  1387				#address-cells = <2>;
  1388				#size-cells = <2>;
  1389				clocks = <&vlp_cksys_clk CLK_VLP_CK_USB_TOP_SEL>,
  1390					 <&vlp_cksys_clk CLK_VLP_CK_USB_XHCI_SEL>,
  1391					 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
  1392				clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
  1393				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P0>;
  1394				mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 107>;
  1395				wakeup-source;
  1396				status = "disabled";
  1397			};
  1398	
  1399			xhci1: usb1@16710000 {
  1400				compatible = "mediatek,mtk-xhci";
  1401				reg = <0 0x16710000 0 0x1000>,
  1402				      <0 0x16713e00 0 0x0100>;
  1403				reg-names = "mac", "ippc";
  1404				interrupts-extended = <&gic GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH 0>,
  1405						      <&pio 276 IRQ_TYPE_LEVEL_LOW>;
  1406				interrupt-names = "host","wakeup";
  1407				phys = <&u2port1 PHY_TYPE_USB2>;
  1408				clocks = <&cksys_clk CLK_CK_USB_TOP_1P_SEL>,
  1409					 <&cksys_clk CLK_CK_USB_XHCI_1P_SEL>,
  1410					 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
  1411				clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
  1412				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P1>;
  1413				mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 108>;
  1414				wakeup-source;
  1415				status = "disabled";
  1416			};
  1417	
  1418			u2phy0: usb-phy0@16730000 {
  1419				compatible = "mediatek,xsphy";
  1420				ranges = <0x0 0x0 0x16730000 0x700>;
  1421				#address-cells = <1>;
  1422				#size-cells = <1>;
  1423				status = "disabled";
  1424	
  1425				u2port0: usb2-phy0@0 {
  1426					reg = <0x0 0x400>;
  1427					clocks = <&clk26m>;
  1428					clock-names = "ref";
  1429					#phy-cells = <1>;
  1430					mediatek,discth = <10>;
  1431				};
  1432			};
  1433	
  1434			u2phy1: usb-phy1@16740000 {
  1435				compatible = "mediatek,xsphy";
  1436				ranges = <0x0 0x0 0x16740000 0x700>;
  1437				#address-cells = <1>;
  1438				#size-cells = <1>;
  1439				status = "disabled";
  1440	
  1441				u2port1: usb2-phy1@0 {
  1442					reg = <0x0 0x400>;
  1443					clocks = <&clk26m>;
  1444					clock-names = "ref";
  1445					#phy-cells = <1>;
  1446					mediatek,discth = <10>;
  1447				};
  1448			};
  1449	
  1450			u3phy0: usb3-phy0@16773000 {
  1451				compatible = "mediatek,xsphy";
  1452				ranges;
  1453				reg = <0 0x16773000 0 0x200>;
  1454				#address-cells = <2>;
  1455				#size-cells = <2>;
  1456				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
  1457				status = "disabled";
  1458	
  1459				u3port0: usb3-phy0@16773400 {
  1460					reg = <0 0x16773400 0 0x500>;
  1461					clocks = <&clk26m>;
  1462					clock-names = "ref";
  1463					#phy-cells = <1>;
  1464				};
  1465			};
  1466	
  1467			usbwkcfg_ao_clk: syscon@167a0000 {
  1468				compatible = "mediatek,mt8196-usbwkcfg-ao", "syscon";
  1469				reg = <0 0x167a0000 0 0x1000>;
  1470			};
  1471	
  1472			ufshci: ufshci@16810000 {
  1473				compatible = "mediatek,mt8183-ufshci";
  1474				reg = <0 0x16810000 0 0x2a00>;
  1475	
  1476				interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH 0>,
  1477					     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH 0>,
  1478					     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>,
  1479					     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>,
  1480					     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH 0>,
  1481					     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH 0>,
  1482					     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH 0>,
  1483					     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH 0>,
  1484					     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH 0>;
  1485				clocks =
  1486						<&cksys_clk CLK_CK_SEL>,
  1487						<&cksys_clk CLK_CK_MAINPLL_D4_D2>,
  1488						<&cksys_clk CLK_CK_UNIVPLL_D5>,
  1489						<&cksys_clk CLK_CK_AES_UFSFDE_SEL>,
  1490						<&cksys_clk CLK_CK_UNIVPLL_D6>,
  1491						<&cksys_clk CLK_CK_MAINPLL_D4>,
  1492						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_TX_SYM_UFS>,
  1493						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM0_UFS>,
  1494						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM1_UFS>,
  1495						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SYS_UFS>,
  1496						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SAP_UFS>,
  1497						<&ufscfg_ao_clk CLK_UFSAO_PHY_SAP_UFS>,
  1498						<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_UFS_UFS>,
  1499						<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_AES_UFS>;
  1500				clock-names =
  1501						"ufs_sel",
  1502						"ufs_sel_min_src",
  1503						"ufs_sel_max_src",
  1504						"crypt_mux",
  1505						"crypt_lp",
  1506						"crypt_perf",
  1507						"unipro_tx_sym",
  1508						"unipro_rx_sym0",
  1509						"unipro_rx_sym1",
  1510						"unipro_sys",
  1511						"unipro_sap",
  1512						"ufs_phy_sap",
  1513						"ufshci_ufs",
  1514						"ufshci_aes";
  1515				freq-table-hz =
  1516						<273000000 499200000>,
  1517						<0 0>,
  1518						<0 0>,
  1519						<0 0>,
  1520						<0 0>,
  1521						<0 0>,
  1522						<0 0>,
  1523						<0 0>,
  1524						<0 0>,
  1525						<0 0>,
  1526						<0 0>,
  1527						<0 0>,
  1528						<0 0>,
  1529						<0 0>;
  1530				/* for clock scaling bind vcore */
  1531	
  1532				/* 0.65V for clock scale up */
  1533				boost-crypt-vcore-min = <650000>;
  1534				vcc-supply = <&mt6363_vemc>;
  1535				vccq-supply = <&mt6363_vufs12>;
  1536				resets =	<&ufscfgao_rst 1>,
  1537						<&ufscfgao_rst 2>,
  1538						<&ufscfgao_rst 3>;
  1539				reset-names =	"unipro_rst",
  1540						"crypto_rst",
  1541						"hci_rst";
  1542	
  1543				/*
  1544				 * Control mtcmos with rtff flow by ufs driver,
  1545				 * Instead of scpsys by PM flow.
  1546				 */
  1547				mediatek,ufs-rtff-mtcmos;
  1548				mediatek,ufs-boost-crypt;
  1549				mediatek,ufs-pmc-via-fastauto;
  1550			};
  1551	
  1552			ufscfg_ao_sec_clk: syscon@16890000 {
  1553				/* TODO: Fix compatible in driver */
  1554				compatible = "mediatek,mt8196-ufscfg-ao-sec", "mediatek,mt8196-ufscfg_ao_sec", "syscon";
  1555				reg = <0 0x16890000 0 0x1000>;
  1556				#clock-cells = <1>;
  1557			};
  1558	
  1559			ufscfg_ao_clk: syscon@168a0000 {
  1560				/* TODO: Fix compatible in driver */
  1561				compatible = "mediatek,mt8196-ufscfg-ao", "mediatek,mt8196-ufscfg_ao", "syscon";
  1562				reg = <0 0x168a0000 0 0x1000>;
  1563				#clock-cells = <1>;
  1564	
  1565				ufscfgao_rst: reset-controller {
  1566					compatible = "ti,syscon-reset";
  1567					#reset-cells = <1>;
  1568	
  1569					ti,reset-bits = <
  1570						/* ufs mphy/ufschi/crypto/unipro reset */
  1571						/* 0: mphy */
  1572						0x48   8 0x4c   8 0 0
  1573						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1574						/* 1: unipro */
  1575						0x148  0 0x14c  0 0 0
  1576						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1577						/* 2: ufs-crypto */
  1578						0x148  1 0x14c  1 0 0
  1579						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1580						/* 3: ufshci */
  1581						0x148  2 0x14c  2 0 0
  1582						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1583						>;
  1584				};
  1585			};
  1586	
  1587			pciephy0: phy@16900000 {
  1588				compatible = "mediatek,mt8196-pcie-phy";
  1589				reg = <0 0x16900000 0 0x10000>,
  1590				      <0 0x16920000 0 0x10000>;
  1591				reg-names = "sif", "ckm";
  1592	
  1593				clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_MCU_BUS_PCIE>,
  1594					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_PEXTP_REF_PCIE>;
  1595				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY0>;
  1596	
  1597				num-lanes = <1>;
  1598				#phy-cells = <0>;
  1599				status = "disabled";
  1600			};
  1601	
  1602			pcie0: pcie@16910000 {
  1603				compatible = "mediatek,mt8196-pcie";
  1604				device_type = "pci";
  1605				reg = <0 0x16910000 0 0x4000>;
  1606				reg-names = "pcie-mac";
  1607				#address-cells = <3>;
  1608				#size-cells = <2>;
  1609				interrupts = <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH 0>;
  1610				bus-range = <0x00 0xff>;
  1611				linux,pci-domain = <0>;
  1612				pextpcfg = <&pextp0cfg_ao_clk>;
  1613				ranges = <0x82000000 0 0x50000000 0x0 0x50000000 0 0x8000000>;
  1614	
  1615				clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_PL_P_PCIE>,
  1616					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_TL_PCIE>,
  1617					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_REF_PCIE>,
  1618					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AXI_250_PCIE>,
  1619					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AHB_APB_PCIE>,
  1620					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_VLP_AO_P0_LP_PCIE>;
  1621				clock-names = "pl_250m", "tl_26m", "peri_26m",
  1622					      "peri_mem", "bus", "low_power";
  1623				assigned-clocks = <&cksys_clk CLK_CK_TL_SEL>;
  1624				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  1625	
  1626				resets = <&pextp0ao_rst 0>, <&pextp0ao_rst 1>;
  1627				reset-names = "mac", "phy";
  1628				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC0>;
  1629	
  1630				phys = <&pciephy0>;
  1631				phy-names = "pcie-phy";
  1632	
  1633				status = "disabled";
  1634	
  1635				#interrupt-cells = <1>;
  1636				interrupt-map-mask = <0 0 0 7>;
  1637				interrupt-map = <0 0 0 1 &pcie_intc0 0>,
  1638						<0 0 0 2 &pcie_intc0 1>,
  1639						<0 0 0 3 &pcie_intc0 2>,
  1640						<0 0 0 4 &pcie_intc0 3>;
  1641	
  1642				pcie_intc0: interrupt-controller {
  1643					interrupt-controller;
  1644					#address-cells = <0>;
  1645					#interrupt-cells = <1>;
  1646				};
  1647			};
  1648	
  1649			pciephy1: phy@16930000 {
  1650				compatible = "mediatek,mt8196-pcie-phy";
  1651				reg = <0 0x16930000 0 0x10000>,
  1652				      <0 0x16950000 0 0x10000>;
  1653				reg-names = "sif", "ckm";
  1654	
  1655				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_MCU_BUS_PCIE>,
  1656					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_PEXTP_REF_PCIE>;
  1657				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY1>;
  1658	
  1659				num-lanes = <2>;
  1660				#phy-cells = <0>;
  1661	
  1662				status = "disabled";
  1663			};
  1664	
  1665			pcie1: pcie@16940000 {
  1666				compatible = "mediatek,mt8196-pcie";
  1667				device_type = "pci";
  1668				reg = <0 0x16940000 0 0x4000>;
  1669				reg-names = "pcie-mac";
  1670				#address-cells = <3>;
  1671				#size-cells = <2>;
  1672				interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH 0>;
  1673				bus-range = <0x00 0xff>;
  1674				linux,pci-domain = <1>;
  1675				pextpcfg = <&pextp1cfg_ao_clk>;
  1676				ranges = <0x82000000 0 0x58000000 0x0 0x58000000 0 0x18000000>;
  1677	
  1678				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_PL_P_PCIE>,
  1679					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_TL_PCIE>,
  1680					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_REF_PCIE>,
  1681					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AXI_250_PCIE>,
  1682					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AHB_APB_PCIE>,
  1683					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P1_LP_PCIE>;
  1684				clock-names = "pl_250m", "tl_26m", "peri_26m",
  1685					      "peri_mem", "bus", "low_power";
  1686				assigned-clocks = <&cksys_clk CLK_CK_TL_P1_SEL>;
  1687				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  1688	
  1689				resets = <&pextp1ao_rst 0>, <&pextp1ao_rst 1>;
  1690				reset-names = "mac", "phy";
  1691				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC1>;
  1692	
  1693				phys = <&pciephy1>;
  1694				phy-names = "pcie-phy";
  1695	
  1696				status = "disabled";
  1697	
  1698				#interrupt-cells = <1>;
  1699				interrupt-map-mask = <0 0 0 7>;
  1700				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
  1701						<0 0 0 2 &pcie_intc1 1>,
  1702						<0 0 0 3 &pcie_intc1 2>,
  1703						<0 0 0 4 &pcie_intc1 3>;
  1704	
  1705				pcie_intc1: interrupt-controller {
  1706					interrupt-controller;
  1707					#address-cells = <0>;
  1708					#interrupt-cells = <1>;
  1709				};
  1710			};
  1711	
  1712			pciephy2: phy@16960000 {
  1713				compatible = "mediatek,mt8196-pcie-phy";
  1714				reg = <0 0x16960000 0 0x10000>,
  1715				      <0 0x16980000 0 0x10000>;
  1716				reg-names = "sif", "ckm";
  1717	
  1718				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_MCU_BUS_PCIE>,
  1719					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_PEXTP_REF_PCIE>;
  1720				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY2>;
  1721	
  1722				num-lanes = <1>;
  1723				#phy-cells = <0>;
  1724	
  1725				status = "disabled";
  1726			};
  1727	
  1728			pcie2: pcie@16970000 {
  1729				device_type = "pci";
  1730				compatible = "mediatek,mt8196-pcie";
  1731				reg = <0 0x16970000 0 0x4000>;
  1732				reg-names = "pcie-mac";
  1733				#address-cells = <3>;
  1734				#size-cells = <2>;
  1735				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH 0>;
  1736				bus-range = <0x00 0xff>;
  1737				linux,pci-domain = <2>;
  1738				pextpcfg = <&pextp1cfg_ao_clk>;
  1739				ranges = <0x82000000 0 0x70000000 0x0 0x70000000 0 0x8000000>;
  1740	
  1741				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_PL_P_PCIE>,
  1742					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_TL_PCIE>,
  1743					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_REF_PCIE>,
  1744					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AXI_250_PCIE>,
  1745					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AHB_APB_PCIE>,
  1746					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P2_LP_PCIE>;
  1747				clock-names = "pl_250m", "tl_26m", "peri_26m",
  1748					      "peri_mem", "bus", "low_power";
  1749				assigned-clocks = <&cksys_clk CLK_CK_TL_P2_SEL>;
  1750				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  1751	
  1752				resets = <&pextp1ao_rst 2>, <&pextp1ao_rst 3>;
  1753				reset-names = "mac", "phy";
  1754				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC2>;
  1755	
  1756				phys = <&pciephy2>;
  1757				phy-names = "pcie-phy";
  1758	
  1759				status = "disabled";
  1760	
  1761				#interrupt-cells = <1>;
  1762				interrupt-map-mask = <0 0 0 7>;
  1763				interrupt-map = <0 0 0 1 &pcie_intc2 0>,
  1764						<0 0 0 2 &pcie_intc2 1>,
  1765						<0 0 0 3 &pcie_intc2 2>,
  1766						<0 0 0 4 &pcie_intc2 3>;
  1767	
  1768				pcie_intc2: interrupt-controller {
  1769					interrupt-controller;
  1770					#address-cells = <0>;
  1771					#interrupt-cells = <1>;
  1772				};
  1773			};
  1774	
  1775			pextp0cfg_ao_clk: syscon@169b0000 {
  1776				/* TODO: Fix compatible in driver */
  1777				compatible = "mediatek,mt8196-pextp0cfg-ao", "mediatek,mt8196-pextp0cfg_ao", "syscon", "simple-mfd";
  1778				reg = <0 0x169b0000 0 0x1000>;
  1779				#clock-cells = <1>;
  1780	
  1781				pextp0ao_rst: reset-controller {
  1782					compatible = "ti,syscon-reset";
  1783					#reset-cells = <1>;
  1784	
  1785					ti,reset-bits = <
  1786						/* 0: PCIe0 MAC reset */
  1787						0x8  0 0xc  0 0 0
  1788						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1789						/* 1: PCIe0 PHY reset */
  1790						0x8  1 0xc  1 0 0
  1791						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1792						>;
  1793				};
  1794			};
  1795	
  1796			pextp1cfg_ao_clk: syscon@169e0000 {
  1797				/* TODO: Fix compatible in driver */
  1798				compatible = "mediatek,mt8196-pextp1cfg-ao", "mediatek,mt8196-pextp1cfg_ao", "syscon", "simple-mfd";
  1799				reg = <0 0x169e0000 0 0x1000>;
  1800				#clock-cells = <1>;
  1801	
  1802				pextp1ao_rst: reset-controller {
  1803					compatible = "ti,syscon-reset";
  1804					#reset-cells = <1>;
  1805	
  1806					ti,reset-bits = <
  1807						/* 0: PCIe1 MAC reset */
  1808						0x8  0 0xc  0 0 0
  1809						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1810						/* 1: PCIe1 PHY reset */
  1811						0x8  1 0xc  1 0 0
  1812						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1813						/* 2: PCIe2 MAC reset */
  1814						0x8  8 0xc  8 0 0
  1815						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1816						/* 3: PCIe2 PHY reset */
  1817						0x8  9 0xc  9 0 0
  1818						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  1819						>;
  1820				};
  1821			};
  1822	
  1823			ssr_top_clk: syscon@18000000 {
  1824				/* TODO: Fix compatible in driver */
  1825				compatible = "mediatek,mt8196-ssr-top", "mediatek,mt8196-ssr_top", "syscon";
  1826				reg = <0 0x18000000 0 0x1000>;
  1827				hw-voter-regmap = <&hwv>;
  1828				#clock-cells = <1>;
  1829			};
  1830	
  1831			devapc_apinfra_ssr: devapc@180f3000 {
  1832				compatible = "mediatek,mt8196-devapc";
  1833				reg = <0 0x180f3000 0 0x1000>;
  1834				vio-idx-num = <39>;
  1835				interrupts = <GIC_SPI 866 IRQ_TYPE_LEVEL_HIGH 0>;
  1836			};
  1837	
  1838			devapc_adsp: devapc@1a019000 {
  1839				compatible = "mediatek,mt8196-devapc";
  1840				reg = <0 0x1a019000 0 0x1000>;
  1841				vio-idx-num = <54>;
  1842				interrupts = <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH 0>;
  1843			};
  1844	
  1845			afe_clk: syscon@1a110000 {
  1846				compatible = "mediatek,mt8196-audiosys", "syscon";
  1847				reg = <0 0x1a110000 0 0x1000>;
  1848				#clock-cells = <1>;
  1849			};
  1850	
  1851			afe: mt8196-afe-pcm@1a110000 {
  1852				compatible = "mediatek,mt8196-sound";
  1853				reg = <0 0x1a110000 0 0x9000>;
  1854				interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
  1855				cksys = <&cksys_clk>;
  1856				vlpcksys = <&vlp_cksys_clk>;
  1857				power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
  1858				clocks = <&afe_clk CLK_AFE_AUDIO_HOPPING_AFE>,
  1859					<&afe_clk CLK_AFE_AUDIO_F26M_AFE>,
  1860					<&afe_clk CLK_AFE_UL0_ADC_AFE>,
  1861					<&afe_clk CLK_AFE_UL0_ADC_HIRES_AFE>,
  1862					<&afe_clk CLK_AFE_UL1_ADC_AFE>,
  1863					<&afe_clk CLK_AFE_UL1_ADC_HIRES_AFE>,
  1864					<&afe_clk CLK_AFE_APLL1_AFE>,
  1865					<&afe_clk CLK_AFE_APLL2_AFE>,
  1866					<&afe_clk CLK_AFE_APLL_TUNER1_AFE>,
  1867					<&afe_clk CLK_AFE_APLL_TUNER2_AFE>,
  1868					<&vlp_cksys_clk CLK_VLP_CK_AUD_INTBUS_SEL>,
  1869					<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN1_SEL>,
  1870					<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN2_SEL>,
  1871					<&vlp_cksys_clk CLK_VLP_CK_AUDIO_H_SEL>,
  1872					<&vlp_cksys_clk CLK_VLP_CK_CLKSQ>,
  1873					<&cksys_clk CLK_CK_MAINPLL_D4_D4>,
  1874					<&cksys_clk CLK_CK_AUD_1_SEL>,
  1875					<&cksys_clk CLK_CK_APLL1>,
  1876					<&cksys_clk CLK_CK_AUD_2_SEL>,
  1877					<&cksys_clk CLK_CK_APLL2>,
  1878					<&cksys_clk CLK_CK_APLL1_D4>,
  1879					<&cksys_clk CLK_CK_APLL2_D4>,
  1880					<&cksys_clk CLK_CK_APLL_I2SIN0_MCK_SEL>,
  1881					<&cksys_clk CLK_CK_APLL_I2SIN1_MCK_SEL>,
  1882					<&cksys_clk CLK_CK_APLL_FMI2S_MCK_SEL>,
  1883					<&cksys_clk CLK_CK_APLL_TDMOUT_MCK_SEL>,
  1884					<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN0>,
  1885					<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN1>,
  1886					<&cksys_clk CLK_CK_APLL12_CK_DIV_FMI2S>,
  1887					<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_M>,
  1888					<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_B>,
  1889					<&cksys_clk CLK_CK_ADSP_SEL>,
  1890					<&cksys_clk CLK_CK_TCK_26M_MX9>;
  1891	
  1892				clock-names = "aud_hopping_clk",
  1893					"aud_f26m_clk",
  1894					"aud_ul0_adc_clk",
  1895					"aud_ul0_adc_hires_clk",
  1896					"aud_ul1_adc_clk",
  1897					"aud_ul1_adc_hires_clk",
  1898					"aud_apll1_clk",
  1899					"aud_apll2_clk",
  1900					"aud_apll_tuner1_clk",
  1901					"aud_apll_tuner2_clk",
  1902					"vlp_mux_audio_int",
  1903					"vlp_mux_aud_eng1",
  1904					"vlp_mux_aud_eng2",
  1905					"vlp_mux_audio_h",
  1906					"vlp_clk26m_clk",
  1907					"ck_mainpll_d4_d4",
  1908					"ck_mux_aud_1",
  1909					"ck_apll1_ck",
  1910					"ck_mux_aud_2",
  1911					"ck_apll2_ck",
  1912					"ck_apll1_d4",
  1913					"ck_apll2_d4",
  1914					"ck_i2sin0_m_sel",
  1915					"ck_i2sin1_m_sel",
  1916					"ck_fmi2s_m_sel",
  1917					"ck_tdmout_m_sel",
  1918					"ck_apll12_div_i2sin0",
  1919					"ck_apll12_div_i2sin1",
  1920					"ck_apll12_div_fmi2s",
  1921					"ck_apll12_div_tdmout_m",
  1922					"ck_apll12_div_tdmout_b",
  1923					"ck_adsp_sel",
  1924					"ck_clk26m_clk";
  1925				pinctrl-names = "aud-clk-mosi-off",
  1926					"aud-clk-mosi-on",
  1927					"aud-dat-mosi-off",
  1928					"aud-dat-mosi-on",
  1929					"aud-dat-mosi-ch34-off",
  1930					"aud-dat-mosi-ch34-on",
  1931					"aud-dat-miso0-off",
  1932					"aud-dat-miso0-on",
  1933					"aud-dat-miso1-off",
  1934					"aud-dat-miso1-on",
  1935					"aud-gpio-i2sin0-off",
  1936					"aud-gpio-i2sin0-on",
  1937					"aud-gpio-i2sout0-off",
  1938					"aud-gpio-i2sout0-on",
  1939					"aud-gpio-i2sin1-off",
  1940					"aud-gpio-i2sin1-on",
  1941					"aud-gpio-i2sout1-off",
  1942					"aud-gpio-i2sout1-on",
  1943					"aud-gpio-i2sin4-off",
  1944					"aud-gpio-i2sin4-on",
  1945					"aud-gpio-i2sout4-off",
  1946					"aud-gpio-i2sout4-on",
  1947					"aud-gpio-i2sin6-off",
  1948					"aud-gpio-i2sin6-on",
  1949					"aud-gpio-i2sout6-off",
  1950					"aud-gpio-i2sout6-on",
  1951					"aud-dat-miso-only-off",
  1952					"aud-dat-miso-only-on",
  1953					"aud-gpio-ap-dmic-off",
  1954					"aud-gpio-ap-dmic-on",
  1955					"aud-gpio-ap-dmic1-off",
  1956					"aud-gpio-ap-dmic1-on",
  1957					"aud-gpio-i2sin3-off",
  1958					"aud-gpio-i2sin3-on",
  1959					"aud-gpio-i2sout3-off",
  1960					"aud-gpio-i2sout3-on";
  1961	
  1962				pinctrl-0 = <&aud_clk_mosi_off>;
  1963				pinctrl-1 = <&aud_clk_mosi_on>;
  1964				pinctrl-2 = <&aud_dat_mosi_off>;
  1965				pinctrl-3 = <&aud_dat_mosi_on>;
  1966				pinctrl-4 = <&aud_dat_mosi_ch34_off>;
  1967				pinctrl-5 = <&aud_dat_mosi_ch34_on>;
  1968				pinctrl-6 = <&aud_dat_miso0_off>;
  1969				pinctrl-7 = <&aud_dat_miso0_on>;
  1970				pinctrl-8 = <&aud_dat_miso1_off>;
  1971				pinctrl-9 = <&aud_dat_miso1_on>;
  1972				pinctrl-10 = <&aud_gpio_i2sin0_off>;
  1973				pinctrl-11 = <&aud_gpio_i2sin0_on>;
  1974				pinctrl-12 = <&aud_gpio_i2sout0_off>;
  1975				pinctrl-13 = <&aud_gpio_i2sout0_on>;
  1976				pinctrl-14 = <&aud_gpio_i2sin1_off>;
  1977				pinctrl-15 = <&aud_gpio_i2sin1_on>;
  1978				pinctrl-16 = <&aud_gpio_i2sout1_off>;
  1979				pinctrl-17 = <&aud_gpio_i2sout1_on>;
  1980				pinctrl-18 = <&aud_gpio_i2sin4_off>;
  1981				pinctrl-19 = <&aud_gpio_i2sin4_on>;
  1982				pinctrl-20 = <&aud_gpio_i2sout4_off>;
  1983				pinctrl-21 = <&aud_gpio_i2sout4_on>;
  1984				pinctrl-22 = <&aud_gpio_i2sin6_off>;
  1985				pinctrl-23 = <&aud_gpio_i2sin6_on>;
  1986				pinctrl-24 = <&aud_gpio_i2sout6_off>;
  1987				pinctrl-25 = <&aud_gpio_i2sout6_on>;
  1988				pinctrl-26 = <&aud_dat_miso_only_off>;
  1989				pinctrl-27 = <&aud_dat_miso_only_on>;
  1990				pinctrl-28 = <&aud_gpio_ap_dmic_off>;
  1991				pinctrl-29 = <&aud_gpio_ap_dmic_on>;
  1992				pinctrl-30 = <&aud_gpio_ap_dmic1_off>;
  1993				pinctrl-31 = <&aud_gpio_ap_dmic1_on>;
  1994				pinctrl-32 = <&aud_gpio_i2sin3_off>;
  1995				pinctrl-33 = <&aud_gpio_i2sin3_on>;
  1996				pinctrl-34 = <&aud_gpio_i2sout3_off>;
  1997				pinctrl-35 = <&aud_gpio_i2sout3_on>;
  1998	
  1999				/* Only for ETDM in/out 4 */
  2000				etdm-out-ch = <2>;
  2001				etdm-in-ch = <2>;
  2002				etdm-out-sync = <0>; /* 0: disable; 1: enable */
  2003				etdm-in-sync = <1>; /* 0: disable; 1: enable */
  2004				etdm-ip-mode = <0>; /* 0: One IP multi-channel 1: Multi-IP 2-channel */
  2005				status = "disabled";
  2006			};
  2007	
  2008			scpsys: power-controller@1c004000 {
  2009				compatible = "mediatek,mt8196-scpsys-hwv", "syscon";
  2010				reg = <0 0x1c004000 0 0x1000>;
  2011				#power-domain-cells = <1>;
  2012				apifrbus-ao-io-reg-bus = <&ifr_bus>;
  2013				spm = <&scpsys_bus>;
  2014				hw-voter-regmap = <&hwv>;
  2015			};
  2016	
  2017			scpsys_bus: syscon@1c00d000 {
  2018				compatible = "mediatek,mt8196-scpsys-bus", "syscon";
  2019				reg = <0 0x1c00d000 0 0x1000>;
  2020			};
  2021	
  2022			watchdog: watchdog@1c010000 {
  2023				compatible = "mediatek,mt8196-wdt",
  2024						"mediatek,mt6589-wdt",
  2025						"syscon", "simple-mfd";
  2026				reg = <0 0x1c010000 0 0x1000>;
  2027			};
  2028	
  2029			vlp_cksys_clk: syscon@1c016000 {
  2030				/* TODO: Fix compatible in driver */
  2031				compatible = "mediatek,mt8196-vlp-cksys", "mediatek,mt8196-vlp_cksys", "syscon";
  2032				reg = <0 0x1c016000 0 0x1000>;
  2033				hw-voter-regmap = <&hwv>;
  2034				#clock-cells = <1>;
  2035			};
  2036	
  2037			spmi: spmi@1c01a000 {
  2038				compatible = "mediatek,mt8196-spmi";
  2039				reg = <0 0x1c01a000 0 0x0008ff>,
  2040				      <0 0x1c01c000 0 0x000100>,
  2041				      <0 0x1c018000 0 0x0008ff>,
  2042				      <0 0x1c01c800 0 0x000100>;
  2043				reg-names = "pmif", "spmimst","pmif-p","spmimst-p";
  2044				interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>,
  2045						      <&pio 292 IRQ_TYPE_LEVEL_HIGH>,
  2046						      <&gic GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH 0>,
  2047						      <&gic GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH 0>,
  2048						      <&gic GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH 0>,
  2049						      <&gic GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH 0>;
  2050				interrupt-names = "rcs_irq","rcs_irq_p","pmif_irq","spmi_nack_irq","pmif_p_irq","spmi_p_nack_irq";
  2051				interrupt-controller;
  2052				#interrupt-cells = <1>;
  2053				irq-event-en = <0x0 0x0 0x0 0x0 0x0>;
  2054				spmi-dev-mask = <0x85c0>;
  2055				#address-cells = <2>;
  2056				#size-cells = <0>;
  2057			};
  2058	
  2059			devapc_vlp: devapc@1c032000 {
  2060				compatible = "mediatek,mt8196-devapc";
  2061				reg = <0 0x1c032000 0 0x1000>;
  2062				vio-idx-num = <101>;
  2063				interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
  2064			};
  2065	
  2066			systimer: systimer@1c400000 {
  2067				compatible = "mediatek,mt8196-timer",
  2068					     "mediatek,mt6765-timer";
  2069				reg = <0 0x1c400000 0 0x1000>;
  2070				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH 0>;
  2071				clocks = <&clk13m>;
  2072			};
  2073	
  2074			smi_disp_common: smi-comm@30020000 {
  2075				compatible = "mediatek,mt8196-smi-common";
  2076				reg = <0 0x30020000 0 0x1000>;
  2077				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2078				mediatek,smi = <&disp_ssc0_smi_2x1_sub_comm>;
  2079				mediatek,common-id = <0>;
  2080				mediatek,skip-rpm-cb;
  2081			};
  2082	
  2083			smi_mdp_common: smi-comm@30021000 {
  2084				compatible = "mediatek,mt8196-smi-common";
  2085				reg = <0 0x30021000 0 0x1000>;
  2086				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2087				mediatek,smi = <&mdp_ssc4_smi_2x1_sub_comm>;
  2088				mediatek,common-id = <1>;
  2089				mediatek,skip-rpm-cb;
  2090			};
  2091	
  2092			devapc_mminfra: devapc@30040000 {
  2093				compatible = "mediatek,mt8196-devapc";
  2094				reg = <0 0x30040000 0 0x1000>;
  2095				vio-idx-num = <699>;
  2096				interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
  2097			};
  2098	
  2099			gce0: gce@300c0000 {
  2100				compatible = "mediatek,mt8196-gce";
  2101				reg = <0 0x300c0000 0 0x80000>;
  2102				interrupts = <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH 0>;
  2103				#mbox-cells = <2>;
  2104				iommus = <&mm_smmu 199>;
  2105				mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
  2106				mediatek,gce-events = <CMDQ_SYNC_SECURE_THR_EOF>;
  2107			};
  2108	
  2109			gce1: gce@30140000 {
  2110				compatible = "mediatek,mt8196-gce";
  2111				reg = <0 0x30140000 0 0x80000>;
  2112				interrupts = <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH 0>;
  2113				#mbox-cells = <2>;
  2114				iommus = <&mm_smmu 183>;
  2115			};
  2116	
  2117			mm_smmu: iommu@30800000 {
  2118				compatible = "mediatek,mt8196-mm-smmu", "arm,smmu-v3";
  2119				reg = <0 0x30800000 0 0x1e0000>;
  2120				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>;
  2121				interrupt-names = "combined";
  2122				#iommu-cells = <1>;
  2123			};
  2124	
  2125			disp_ssc0_smi_2x1_sub_comm: smi-comm@30a30000 {
  2126				compatible = "mediatek,mt8196-smi-common";
  2127				reg = <0 0x30a30000 0 0x1000>;
  2128				mediatek,common-id = <3>;
  2129				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2130				mediatek,skip-rpm-cb;
  2131			};
  2132	
  2133			disp_ssc1_smi_2x1_sub_comm: smi-comm@30a31000 {
  2134				compatible = "mediatek,mt8196-smi-common";
  2135				reg = <0 0x30a31000 0 0x1000>;
  2136				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2137				mediatek,common-id = <4>;
  2138				mediatek,skip-rpm-cb;
  2139			};
  2140	
  2141			mdp_ssc4_smi_2x1_sub_comm: smi-comm@30a32000 {
  2142				compatible = "mediatek,mt8196-smi-common";
  2143				reg = <0 0x30a32000 0 0x1000>;
  2144				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2145				mediatek,common-id = <5>;
  2146				mediatek,skip-rpm-cb;
  2147			};
  2148	
  2149			mdp_ssc5_smi_2x1_sub_comm: smi-comm@30a33000 {
  2150				compatible = "mediatek,mt8196-smi-common";
  2151				reg = <0 0x30a33000 0 0x1000>;
  2152				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2153				mediatek,common-id = <6>;
  2154				mediatek,skip-rpm-cb;
  2155			};
  2156	
  2157			vcp: vcp@31800000 {
  2158				compatible = "mediatek,vcp";
  2159				reg = <0 0x31800000 0 0x60000>, /* sram */
  2160				      <0 0x31a04000 0 0xa000>, /* cfg */
  2161				      <0 0x31bd0000 0 0x1000>, /* cfg core */
  2162				      <0 0x31b80000 0 0x50000>, /* mbox base */
  2163				      <0 0x31a70020 0 0x100>, /* mbox init */
  2164				      <0 0x1c00091c 0 0x4>; /* vcp rdy */
  2165				reg-names = "sram",
  2166					    "cfg",
  2167					    "cfg_core",
  2168					    "mbox_base",
  2169					    "mbox_init",
  2170					    "vcp_vlp_ao_rsvd7";
  2171	
  2172				interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>,
  2173					     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>,
  2174					     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH 0>,
  2175					     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>,
  2176					     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH 0>,
  2177					     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
  2178				interrupt-names = "wdt",
  2179						  "mbox0",
  2180						  "mbox1",
  2181						  "mbox2",
  2182						  "mbox3",
  2183						  "mbox4";
  2184	
  2185				power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
  2186				iommus = <&mm_smmu 160>;
  2187				memory-region = <&vcp_resv_mem>;
  2188	
  2189				vcp-mem-tbl = <0 0x1a00000>, /* VCP_RTOS_MEM_ID 26MB */
  2190					      <1 0x30000>, /* VDEC_MEM_ID 192KB */
  2191					      <2 0x12000>, /* VENC_MEM_ID 72KB */
  2192					      <3 0x1000>; /* LOGGER 4KB*/
  2193	
  2194				vcp@0 {
  2195					compatible = "mediatek,vcp-core";
  2196					twohart = <1>;
  2197					sram-offset = <0x0>;
  2198				};
  2199	
  2200				vcp@31000 {
  2201					compatible = "mediatek,mmup-core";
  2202					twohart = <0>;
  2203					sram-offset = <0x031000>;
  2204				};
  2205	
  2206				send_table: mtk-send-table {
  2207					mbox0-0 {
  2208						mbox-id = <0>;
  2209						chan-id = <0>;
  2210						msg-size = <18>;
  2211					};
  2212					mbox1-15 {
  2213						mbox-id = <1>;
  2214						chan-id = <15>;
  2215						msg-size = <8>;
  2216					};
  2217					mbox1-16 {
  2218						mbox-id = <1>;
  2219						chan-id = <16>;
  2220						msg-size = <18>;
  2221					};
  2222					mbox1-9 {
  2223						mbox-id = <1>;
  2224						chan-id = <9>;
  2225						msg-size = <2>;
  2226					};
  2227					mbox2-11 {
  2228						mbox-id = <2>;
  2229						chan-id = <11>;
  2230						msg-size = <18>;
  2231					};
  2232					mbox2-2 {
  2233						mbox-id = <2>;
  2234						chan-id = <2>;
  2235						msg-size = <2>;
  2236					};
  2237					mbox2-3 {
  2238						mbox-id = <2>;
  2239						chan-id = <3>;
  2240						msg-size = <3>;
  2241					};
  2242					mbox2-32 {
  2243						mbox-id = <2>;
  2244						chan-id = <32>;
  2245						msg-size = <2>;
  2246					};
  2247					mbox3-33 {
  2248						mbox-id = <3>;
  2249						chan-id = <33>;
  2250						msg-size = <2>;
  2251					};
  2252					mbox3-13 {
  2253						mbox-id = <3>;
  2254						chan-id = <13>;
  2255						msg-size = <2>;
  2256					};
  2257					mbox3-35 {
  2258						mbox-id = <3>;
  2259						chan-id = <35>;
  2260						msg-size = <2>;
  2261					};
  2262					mbox4-20 {
  2263						mbox-id = <4>;
  2264						chan-id = <20>;
  2265						msg-size = <2>;
  2266					};
  2267					mbox4-21 {
  2268						mbox-id = <4>;
  2269						chan-id = <21>;
  2270						msg-size = <3>;
  2271					};
  2272					mbox4-23 {
  2273						mbox-id = <4>;
  2274						chan-id = <23>;
  2275						msg-size = <2>;
  2276					};
  2277				};
  2278	
  2279				recv_table: mtk-recv-table {
  2280					mbox0-1 {
  2281						mbox-id = <0>;
  2282						chan-id = <1>;
  2283						msg-size = <18>;
  2284						recv-opt = <0>;
  2285					};
  2286					mbox1-15 {
  2287						mbox-id = <1>;
  2288						chan-id = <15>;
  2289						msg-size = <8>;
  2290						recv-opt = <1>;
  2291					};
  2292					mbox1-17 {
  2293						mbox-id = <1>;
  2294						chan-id = <17>;
  2295						msg-size = <18>;
  2296						recv-opt = <0>;
  2297					};
  2298					mbox1-10 {
  2299						mbox-id = <1>;
  2300						chan-id = <10>;
  2301						msg-size = <2>;
  2302						recv-opt = <0>;
  2303					};
  2304					mbox2-12 {
  2305						mbox-id = <2>;
  2306						chan-id = <12>;
  2307						msg-size = <18>;
  2308						recv-opt = <0>;
  2309					};
  2310					mbox2-5 {
  2311						mbox-id = <2>;
  2312						chan-id = <5>;
  2313						msg-size = <1>;
  2314						recv-opt = <0>;
  2315					};
  2316					mbox2-2 {
  2317						mbox-id = <2>;
  2318						chan-id = <2>;
  2319						msg-size = <1>;
  2320						recv-opt = <1>;
  2321					};
  2322					mbox3-34 {
  2323						mbox-id = <3>;
  2324						chan-id = <34>;
  2325						msg-size = <2>;
  2326						recv-opt = <0>;
  2327					};
  2328					mbox3-14 {
  2329						mbox-id = <3>;
  2330						chan-id = <14>;
  2331						msg-size = <2>;
  2332						recv-opt = <0>;
  2333					};
  2334					mbox4-26 {
  2335						mbox-id = <4>;
  2336						chan-id = <26>;
  2337						msg-size = <1>;
  2338						recv-opt = <0>;
  2339					};
  2340					mbox4-20 {
  2341						mbox-id = <4>;
  2342						chan-id = <20>;
  2343						msg-size = <1>;
  2344						recv-opt = <1>;
  2345					};
  2346				};
  2347			};
  2348	
  2349			mminfra_hwv: syscon@31a80000 {
  2350				/* TODO: Fix compatible in driver */
  2351				compatible = "mediatek,mt8196-mminfra-hwv", "mediatek,mt8196-mminfra_hwv", "syscon";
  2352				reg = <0 0x31a80000 0 0x1000>;
  2353			};
  2354	
  2355			devapc_mmup: devapc@31ad5000 {
  2356				compatible = "mediatek,mt8196-devapc";
  2357				reg = <0 0x31ad5000 0 0x1000>;
  2358				vio-idx-num = <71>;
  2359				interrupts = <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH 0>;
  2360			};
  2361	
  2362			mm_hwv: syscon@31b00000 {
  2363				/* TODO: Fix compatible in driver */
  2364				compatible = "mediatek,mt8196-mm-hwv", "mediatek,mt8196-mm_hwv", "syscon";
  2365				reg = <0 0x31b00000 0 0x3000>;
  2366			};
  2367	
  2368			hfrpsys: power-controller@31b50000 {
  2369				compatible = "mediatek,mt8196-hfrpsys-hwv", "syscon";
  2370				reg = <0 0x31b50000 0 0x1000>;
  2371				#power-domain-cells = <1>;
  2372				mmpc = <&hfrpsys>;
  2373				mm-hw-ccf-regmap = <&mm_hwv>;
  2374				mminfra-hwv-regmap = <&mminfra_hwv>;
  2375			};
  2376	
  2377			dispsys_config_clk: syscon@32000000 {
  2378				compatible = "mediatek,mt8196-dispsys0", "syscon";
  2379				reg = <0 0x32000000 0 0x1000>;
  2380				mm-hw-ccf-regmap = <&mm_hwv>;
  2381				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
  2382				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
  2383				#clock-cells = <1>;
  2384	
  2385				async {
  2386					clocks = <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC0_DISP>,
  2387						 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC1_DISP>,
  2388						 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC8_DISP>,
  2389						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC1_DISP>,
  2390						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC2_DISP>,
  2391						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC3_DISP>;
  2392				};
  2393	
  2394				top {
  2395					clocks = <&dispsys_config_clk CLK_MM_CONFIG_DISP>;
  2396				};
  2397			};
  2398	
  2399			disp0_mutex: mutex@32020000 {
  2400				compatible = "mediatek,mt8196-disp-mutex";
  2401				reg = <0 0x32020000 0 0x1000>;
  2402				clocks = <&dispsys_config_clk CLK_MM_DISP_MUTEX0_DISP>;
  2403				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
  2404						      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
  2405			};
  2406	
  2407			disp_ccorr0: disp-ccorr@32090000 {
  2408				compatible = "mediatek,mt8196-disp-ccorr";
  2409				reg = <0 0x32090000 0 0x1000>;
  2410				clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR0_PQ>;
  2411			};
  2412	
  2413			disp_ccorr1: disp-ccorr@320a0000 {
  2414				compatible = "mediatek,mt8196-disp-ccorr";
  2415				reg = <0 0x320a0000 0 0x1000>;
  2416				clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR1_PQ>;
  2417			};
  2418	
  2419			disp_dither0: disp-dither@32110000 {
  2420				compatible = "mediatek,mt8196-disp-dither",
  2421					     "mediatek,mt8183-disp-dither";
  2422				reg = <0 0x32110000 0 0x1000>;
  2423				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
  2424				clocks = <&dispsys_config_clk CLK_MM_DISP_DITHER0_PQ>;
  2425			};
  2426	
  2427			disp_gamma0: disp-gamma@32130000 {
  2428				compatible = "mediatek,mt8196-disp-gamma",
  2429					     "mediatek,mt8195-disp-gamma";
  2430				reg = <0 0x32130000 0 0x1000>;
  2431				clocks = <&dispsys_config_clk CLK_MM_DISP_GAMMA0_PQ>;
  2432			};
  2433	
  2434			disp_tdshp0: disp-tdshp@321e0000 {
  2435				compatible = "mediatek,mt8196-disp-tdshp";
  2436				reg = <0 0x321e0000 0 0x1000>;
  2437				clocks = <&dispsys_config_clk CLK_MM_DISP_TDSHP0_PQ>;
  2438			};
  2439	
  2440			disp_postmask0: postmask@32180000 {
  2441				compatible = "mediatek,mt8196-disp-postmask",
  2442					     "mediatek,mt8192-disp-postmask";
  2443				reg = <0 0x32180000 0 0x1000>;
  2444				clocks = <&dispsys_config_clk CLK_MM_DISP_POSTMASK0_DISP>;
  2445			};
  2446	
  2447			disp_mdp_rsz0: mdp-rsz@321a0000 {
  2448				compatible = "mediatek,mt8196-disp-mdp-rsz";
  2449				reg = <0 0x321a0000 0 0x1000>;
  2450				clocks = <&dispsys_config_clk CLK_MM_MDP_RSZ0_DISP>;
  2451			};
  2452	
  2453			smi_larb32: larb@32240000 {
  2454				compatible = "mediatek,mt8196-smi-larb";
  2455				reg = <0 0x32240000 0 0x1000>;
  2456				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
  2457				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  2458					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  2459				clock-names = "apb", "smi";
  2460				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  2461				mediatek,larb-id = <32>;
  2462				larb-port-real-time-type = <1 1 1 1 0 0 0 0 1 0>;
  2463			};
  2464	
  2465			dispsys1_config_clk: syscon@32400000 {
  2466				compatible = "mediatek,mt8196-dispsys1", "syscon";
  2467				reg = <0 0x32400000 0 0x1000>;
  2468				mm-hw-ccf-regmap = <&mm_hwv>;
  2469				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
  2470				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
  2471				#clock-cells = <1>;
  2472	
  2473				async {
  2474					clocks = <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC21_DISP>,
  2475						 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC22_DISP>,
  2476						 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC23_DISP>;
  2477				};
  2478	
  2479				top {
  2480					clocks = <&dispsys1_config_clk CLK_MM1_DISPSYS1_CONFIG_DISP>;
  2481					clock-names = "dispsys1_config";
  2482				};
  2483			};
  2484	
  2485			disp1_mutex: mutex@32420000 {
  2486				compatible = "mediatek,mt8196-disp-mutex";
  2487				reg = <0 0x32420000 0 0x1000>;
  2488				clocks = <&dispsys1_config_clk CLK_MM1_DISP_MUTEX0_DISP>;
  2489			};
  2490	
  2491			dp_intf0: dp-intf@32430000 {
  2492				compatible = "mediatek,mt8196-dp-intf";
  2493				reg = <0 0x32430000 0 0x1000>;
  2494				interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>;
  2495				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF0>,
  2496					 <&dispsys1_config_clk CLK_MM1_MOD4>,
  2497					 <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
  2498					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D4>,
  2499					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D8>,
  2500					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D16>,
  2501					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL1>,
  2502					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  2503				clock-names = "hf_fmm_ck",
  2504					      "hf_fdp_ck",
  2505					      "mux_dp",
  2506					      "tvdpll_d4",
  2507					      "tvdpll_d8",
  2508					      "tvdpll_d16",
  2509					      "dpi_ck",
  2510					      "dpi_26m";
  2511				num = <0>;
  2512				phys = <&dp_tx>;
  2513				phy-names = "dp_tx";
  2514			};
  2515	
  2516			dp_intf1: dp-intf@32440000 {
  2517				compatible = "mediatek,mt8196-dp-intf";
  2518				reg = <0 0x32440000 0 0x1000>;
  2519				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
  2520				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF1>,
  2521					 <&dispsys1_config_clk CLK_MM1_MOD5>,
  2522					 <&cksys_gp2_clk CLK_CK2_DP1_SEL>,
  2523					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D4>,
  2524					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D8>,
  2525					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D16>,
  2526					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL2>,
  2527					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  2528				clock-names = "hf_fmm_ck",
  2529					      "hf_fdp_ck",
  2530					      "mux_dp",
  2531					      "tvdpll_d4",
  2532					      "tvdpll_d8",
  2533					      "tvdpll_d16",
  2534					      "dpi_ck",
  2535					      "dpi_26m";
  2536				num = <1>;
  2537				no-next-bridge;
  2538				phys = <&dp_tx>;
  2539				phy-names = "dp_tx";
  2540				status = "disabled";
  2541			};
  2542	
  2543			disp_dsc0: disp-dsc0-wrap0@32450000 {
  2544				compatible = "mediatek,mt8196-disp-dsc";
  2545				reg = <0 0x32450000 0 0x1000>;
  2546				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP0>;
  2547			};
  2548	
  2549			disp_dsc1: disp-dsc1-wrap1@32460000 {
  2550				compatible = "mediatek,mt8196-disp-dsc";
  2551				reg = <0 0x32460000 0 0x1000>;
  2552				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP1>;
  2553			};
  2554	
  2555			dsi0: dsi@32490000 {
  2556				compatible = "mediatek,mt8196-dsi";
  2557				reg = <0 0x32490000 0 0x1000>;
  2558				interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH 0>;
  2559				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSI0_DISP>,
  2560					 <&dispsys1_config_clk CLK_MM1_MOD1_DISP>,
  2561					 <&mipi_tx_config0>;
  2562				clock-names = "engine", "digital", "hs";
  2563				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DSI_PHY0>;
  2564				phys = <&mipi_tx_config0>;
  2565				phy-names = "dphy";
  2566				status = "disabled";
  2567			};
  2568	
  2569			disp_dvo0: disp-dvo0@324c0000 {
  2570				compatible = "mediatek,mt8196-edp-dvo";
  2571				reg = <0 0x324c0000 0 0x1000>;
  2572				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
  2573				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DVO0_DISP>,
  2574					 <&cksys_gp2_clk CLK_CK2_DVO_SEL>,
  2575					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL3>,
  2576					 <&dispsys1_config_clk CLK_MM1_MOD6>;
  2577				clock-names = "engine",
  2578					      "pixel",
  2579					      "pll",
  2580					      "hf_fdvo_clk";
  2581				status = "disabled";
  2582			};
  2583	
  2584			smi_larb33: larb@32600000 {
  2585				compatible = "mediatek,mt8196-smi-larb";
  2586				reg = <0 0x32600000 0 0x1000>;
  2587				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
  2588				clocks = <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>,
  2589					 <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>;
  2590				clock-names = "apb", "smi";
  2591				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  2592				mediatek,larb-id = <33>;
  2593				larb-port-real-time-type = <0 1 1 1 0 0 0 1 0 0 0 0 0 0 0 1>;
  2594			};
  2595	
  2596			ovlsys_config_clk: syscon@32800000 {
  2597				/* TODO: Fix compatible in driver */
  2598				compatible = "mediatek,mt8196-ovlsys-config", "mediatek,mt8196-ovlsys_config", "syscon";
  2599				reg = <0 0x32800000 0 0x1000>;
  2600				mm-hw-ccf-regmap = <&mm_hwv>;
  2601				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>,
  2602					 <&gce0 8 CMDQ_THR_PRIO_4>, <&gce0 9 CMDQ_THR_PRIO_4>;
  2603				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2604				#clock-cells = <1>;
  2605	
  2606				async {
  2607					clocks = <&ovlsys_config_clk CLK_OVL_DLO5_DISP>,
  2608						 <&ovlsys_config_clk CLK_OVL_DLO6_DISP>;
  2609				};
  2610			};
  2611	
  2612			ovl0_mutex: mutex@32820000 {
  2613				compatible = "mediatek,mt8196-disp-mutex";
  2614				reg = <0 0x32820000 0 0x1000>;
  2615				clocks = <&ovlsys_config_clk CLK_OVL_MUTEX0_DISP>;
  2616				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
  2617						      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
  2618			};
  2619	
  2620			disp_ovl0_exdma2: dma-controller@32850000 {
  2621				compatible = "mediatek,mt8196-exdma";
  2622				reg = <0 0x32850000 0 0x1000>;
  2623				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA2_DISP>;
  2624				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2625				mediatek,larb = <&smi_larb0>;
  2626				iommus = <&mm_smmu 144>;
  2627				#dma-cells = <1>;
  2628			};
  2629	
  2630			disp_ovl0_exdma3: dma-controller@32860000 {
  2631				compatible = "mediatek,mt8196-exdma";
  2632				reg = <0 0x32860000 0 0x1000>;
  2633				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA3_DISP>;
  2634				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2635				mediatek,larb = <&smi_larb1>;
  2636				#dma-cells = <1>;
  2637			};
  2638	
  2639			disp_ovl0_exdma4: dma-controller@32870000 {
  2640				compatible = "mediatek,mt8196-exdma";
  2641				reg = <0 0x32870000 0 0x1000>;
  2642				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA4_DISP>;
  2643				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2644				mediatek,larb = <&smi_larb20>;
  2645				#dma-cells = <1>;
  2646			};
  2647	
  2648			disp_ovl0_exdma5: dma-controller@32880000 {
  2649				compatible = "mediatek,mt8196-exdma";
  2650				reg = <0 0x32880000 0 0x1000>;
  2651				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA5_DISP>;
  2652				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2653				mediatek,larb = <&smi_larb21>;
  2654				#dma-cells = <1>;
  2655			};
  2656	
  2657			disp_ovl0_exdma6: dma-controller@32890000 {
  2658				compatible = "mediatek,mt8196-exdma";
  2659				reg = <0 0x32890000 0 0x1000>;
  2660				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA6_DISP>;
  2661				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2662				mediatek,larb = <&smi_larb1 SMMU_L1_P3_OVL_RDMA6>;
  2663				#dma-cells = <1>;
  2664			};
  2665	
  2666			disp_ovl0_exdma7: dma-controller@328a0000 {
  2667				compatible = "mediatek,mt8196-exdma";
  2668				reg = <0 0x328a0000 0 0x1000>;
  2669				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA7_DISP>;
  2670				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2671				mediatek,larb = <&smi_larb0>;
  2672				#dma-cells = <1>;
  2673			};
  2674	
  2675			disp_ovl0_exdma8: dma-controller@328b0000 {
  2676				compatible = "mediatek,mt8196-exdma";
  2677				reg = <0 0x328b0000 0 0x1000>;
  2678				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA8_DISP>;
  2679				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2680				mediatek,larb = <&smi_larb21>;
  2681				#dma-cells = <1>;
  2682			};
  2683	
  2684			disp_ovl0_exdma9: dma-controller@328c0000 {
  2685				compatible = "mediatek,mt8196-exdma";
  2686				reg = <0 0x328c0000 0 0x1000>;
  2687				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA9_DISP>;
  2688				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2689				mediatek,larb = <&smi_larb20>;
  2690				#dma-cells = <1>;
  2691			};
  2692	
  2693			disp_ovl0_blender0: blender@328d0000 {
  2694				compatible = "mediatek,mt8196-blender";
  2695				reg = <0 0x328d0000 0 0x1000>;
  2696				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER0_DISP>;
  2697			};
  2698	
  2699			disp_ovl0_blender1: blender@328e0000 {
  2700				compatible = "mediatek,mt8196-blender";
  2701				reg = <0 0x328e0000 0 0x1000>;
  2702				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER1_DISP>;
  2703			};
  2704	
  2705			disp_ovl0_blender2: blender@328f0000 {
  2706				compatible = "mediatek,mt8196-blender";
  2707				reg = <0 0x328f0000 0 0x1000>;
  2708				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER2_DISP>;
  2709			};
  2710	
  2711			disp_ovl0_blender3: blender@32900000 {
  2712				compatible = "mediatek,mt8196-blender";
  2713				reg = <0 0x32900000 0 0x1000>;
  2714				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER3_DISP>;
  2715			};
  2716	
  2717			disp_ovl0_blender4: blender@32910000 {
  2718				compatible = "mediatek,mt8196-blender";
  2719				reg = <0 0x32910000 0 0x1000>;
  2720				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER4_DISP>;
  2721			};
  2722	
  2723			disp_ovl0_blender5: blender@32920000 {
  2724				compatible = "mediatek,mt8196-blender";
  2725				reg = <0 0x32920000 0 0x1000>;
  2726				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER5_DISP>;
  2727			};
  2728	
  2729			disp_ovl0_blender6: blender@32930000 {
  2730				compatible = "mediatek,mt8196-blender";
  2731				reg = <0 0x32930000 0 0x1000>;
  2732				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER6_DISP>;
  2733			};
  2734	
  2735			disp_ovl0_blender7: blender@32940000 {
  2736				compatible = "mediatek,mt8196-blender";
  2737				reg = <0 0x32940000 0 0x1000>;
  2738				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER7_DISP>;
  2739			};
  2740	
  2741			disp_ovl0_blender8: blender@32950000 {
  2742				compatible = "mediatek,mt8196-blender";
  2743				reg = <0 0x32950000 0 0x1000>;
  2744				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER8_DISP>;
  2745			};
  2746	
  2747			disp_ovl0_blender9: blender@32960000 {
  2748				compatible = "mediatek,mt8196-blender";
  2749				reg = <0 0x32960000 0 0x1000>;
  2750				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER9_DISP>;
  2751			};
  2752	
  2753			disp_ovl0_outproc0: outproc@32970000 {
  2754				compatible = "mediatek,mt8196-outproc";
  2755				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC0_DISP>;
  2756				interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH 0>;
  2757				reg = <0 0x32970000 0 0x1000>;
  2758				mediatek,gce-events = <CMDQ_EVENT_OVL0_FRAME_DONE_SEL0>;
  2759				mboxes = <&gce0 3 CMDQ_THR_PRIO_4>;
  2760			};
  2761	
  2762			disp_ovl0_outproc1: outproc@32980000 {
  2763				compatible = "mediatek,mt8196-outproc";
  2764				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC1_DISP>;
  2765				interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH 0>;
  2766				reg = <0 0x32980000 0 0x1000>;
  2767			};
  2768	
  2769			disp_ovl0_outproc2: outproc@32990000 {
  2770				compatible = "mediatek,mt8196-outproc";
  2771				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC2_DISP>;
  2772				reg = <0 0x32990000 0 0x1000>;
  2773			};
  2774	
  2775			disp_ovl0_outproc3: outproc@329a0000 {
  2776				compatible = "mediatek,mt8196-outproc";
  2777				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC3_DISP>;
  2778				reg = <0 0x329a0000 0 0x1000>;
  2779			};
  2780	
  2781			disp_ovl0_outproc4: outproc@329b0000 {
  2782				compatible = "mediatek,mt8196-outproc";
  2783				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC4_DISP>;
  2784				reg = <0 0x329b0000 0 0x1000>;
  2785			};
  2786	
  2787			disp_ovl0_outproc5: outproc@329c0000 {
  2788				compatible = "mediatek,mt8196-outproc";
  2789				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC5_DISP>;
  2790				reg = <0 0x329c0000 0 0x1000>;
  2791			};
  2792	
  2793			smi_larb0: larb@32a60000 {
  2794				compatible = "mediatek,mt8196-smi-larb";
  2795				reg = <0 0x32a60000 0 0x1000>;
  2796				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2797				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  2798					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  2799				clock-names = "apb", "smi";
  2800				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  2801				mediatek,larb-id = <0>;
  2802				larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
  2803			};
  2804	
  2805			smi_larb1: larb@32a70000 {
  2806				compatible = "mediatek,mt8196-smi-larb";
  2807				reg = <0 0x32a70000 0 0x1000>;
  2808				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2809				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  2810					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  2811				clock-names = "apb", "smi";
  2812				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  2813				mediatek,larb-id = <1>;
  2814				larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
  2815			};
  2816	
  2817			smi_larb20: larb@32a80000 {
  2818				compatible = "mediatek,mt8196-smi-larb";
  2819				reg = <0 0x32a80000 0 0x1000>;
  2820				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2821				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  2822					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  2823				clock-names = "apb", "smi";
  2824				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  2825				mediatek,larb-id = <20>;
  2826				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
  2827			};
  2828	
  2829			smi_larb21: larb@32a90000 {
  2830				compatible = "mediatek,mt8196-smi-larb";
  2831				reg = <0 0x32a90000 0 0x1000>;
  2832				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  2833				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  2834					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  2835				clock-names = "apb", "smi";
  2836				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  2837				mediatek,larb-id = <21>;
  2838				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
  2839			};
  2840	
  2841			ovlsys1_config_clk: syscon@32c00000 {
  2842				/* TODO: Fix compatible in driver */
  2843				compatible = "mediatek,mt8196-ovlsys1-config", "mediatek,mt8196-ovlsys1_config", "syscon";
  2844				reg = <0 0x32c00000 0 0x1000>;
  2845				mm-hw-ccf-regmap = <&mm_hwv>;
  2846				mboxes = <&gce0 2 CMDQ_THR_PRIO_4>, <&gce0 10 CMDQ_THR_PRIO_4>;
  2847				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2848				#clock-cells = <1>;
  2849	
  2850				async {
  2851					clocks = <&ovlsys1_config_clk CLK_OVL_DLO5_DISP>,
  2852						 <&ovlsys1_config_clk CLK_OVL_DLO6_DISP>;
  2853				};
  2854			};
  2855	
  2856			ovl1_mutex: mutex@32c20000 {
  2857				compatible = "mediatek,mt8196-disp-mutex";
  2858				reg = <0 0x32c20000 0 0x1000>;
  2859				clocks = <&ovlsys1_config_clk CLK_OVL_MUTEX0_DISP>;
  2860				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT2>;
  2861			};
  2862	
  2863			disp_ovl1_exdma2: dma-controller@32c50000 {
  2864				compatible = "mediatek,mt8196-exdma";
  2865				reg = <0 0x32c50000 0 0x1000>;
  2866				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA2_DISP>;
  2867				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2868				mediatek,larb = <&smi_larb34>;
  2869				#dma-cells = <1>;
  2870			};
  2871	
  2872			disp_ovl1_exdma3: dma-controller@32c60000 {
  2873				compatible = "mediatek,mt8196-exdma";
  2874				reg = <0 0x32c60000 0 0x1000>;
  2875				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA3_DISP>;
  2876				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2877				mediatek,larb = <&smi_larb35>;
  2878				#dma-cells = <1>;
  2879			};
  2880	
  2881			disp_ovl1_exdma4: dma-controller@32c70000 {
  2882				compatible = "mediatek,mt8196-exdma";
  2883				reg = <0 0x32c70000 0 0x1000>;
  2884				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA4_DISP>;
  2885				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2886				mediatek,larb = <&smi_larb36>;
  2887				#dma-cells = <1>;
  2888			};
  2889	
  2890			disp_ovl1_exdma5: dma-controller@32c80000 {
  2891				compatible = "mediatek,mt8196-exdma";
  2892				reg = <0 0x32c80000 0 0x1000>;
  2893				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA5_DISP>;
  2894				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2895				mediatek,larb = <&smi_larb37>;
  2896				#dma-cells = <1>;
  2897			};
  2898	
  2899			disp_ovl1_exdma6: dma-controller@32c90000 {
  2900				compatible = "mediatek,mt8196-exdma";
  2901				reg = <0 0x32c90000 0 0x1000>;
  2902				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA6_DISP>;
  2903				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2904				mediatek,larb = <&smi_larb35>;
  2905				#dma-cells = <1>;
  2906			};
  2907	
  2908			disp_ovl1_exdma7: dma-controller@32ca0000 {
  2909				compatible = "mediatek,mt8196-exdma";
  2910				reg = <0 0x32ca0000 0 0x1000>;
  2911				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA7_DISP>;
  2912				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2913				mediatek,larb = <&smi_larb34>;
  2914				#dma-cells = <1>;
  2915			};
  2916	
  2917			disp_ovl1_exdma8: dma-controller@32cb0000 {
  2918				compatible = "mediatek,mt8196-exdma";
  2919				reg = <0 0x32cb0000 0 0x1000>;
  2920				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA8_DISP>;
  2921				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2922				mediatek,larb = <&smi_larb37>;
  2923				#dma-cells = <1>;
  2924			};
  2925	
  2926			disp_ovl1_exdma9: dma-controller@32cc0000 {
  2927				compatible = "mediatek,mt8196-exdma";
  2928				reg = <0 0x32cc0000 0 0x1000>;
  2929				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA9_DISP>;
  2930				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  2931				mediatek,larb = <&smi_larb36>;
  2932				#dma-cells = <1>;
  2933			};
  2934	
  2935			disp_ovl1_blender0: blender@32cd0000 {
  2936				compatible = "mediatek,mt8196-blender";
  2937				reg = <0 0x32cd0000 0 0x1000>;
  2938				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER0_DISP>;
  2939			};
  2940	
  2941			disp_ovl1_blender1: blender@32ce0000 {
  2942				compatible = "mediatek,mt8196-blender";
  2943				reg = <0 0x32ce0000 0 0x1000>;
  2944				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER1_DISP>;
  2945			};
  2946	
  2947			disp_ovl1_blender2: blender@32cf0000 {
  2948				compatible = "mediatek,mt8196-blender";
  2949				reg = <0 0x32cf0000 0 0x1000>;
  2950				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER2_DISP>;
  2951			};
  2952	
  2953			disp_ovl1_blender3: blender@32d00000 {
  2954				compatible = "mediatek,mt8196-blender";
  2955				reg = <0 0x32d00000 0 0x1000>;
  2956				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER3_DISP>;
  2957			};
  2958	
  2959			disp_ovl1_blender4: blender@32d10000 {
  2960				compatible = "mediatek,mt8196-blender";
  2961				reg = <0 0x32d10000 0 0x1000>;
  2962				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER4_DISP>;
  2963			};
  2964	
  2965			disp_ovl1_blender5: blender@32d20000 {
  2966				compatible = "mediatek,mt8196-blender";
  2967				reg = <0 0x32d20000 0 0x1000>;
  2968				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER5_DISP>;
  2969			};
  2970	
  2971			disp_ovl1_blender6: blender@32d30000 {
  2972				compatible = "mediatek,mt8196-blender";
  2973				reg = <0 0x32d30000 0 0x1000>;
  2974				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER6_DISP>;
  2975			};
  2976	
  2977			disp_ovl1_blender7: blender@32d40000 {
  2978				compatible = "mediatek,mt8196-blender";
  2979				reg = <0 0x32d40000 0 0x1000>;
  2980				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER7_DISP>;
  2981			};
  2982	
  2983			disp_ovl1_blender8: blender@32d50000 {
  2984				compatible = "mediatek,mt8196-blender";
  2985				reg = <0 0x32d50000 0 0x1000>;
  2986				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER8_DISP>;
  2987			};
  2988	
  2989			disp_ovl1_blender9: blender@32d60000 {
  2990				compatible = "mediatek,mt8196-blender";
  2991				reg = <0 0x32d60000 0 0x1000>;
  2992				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER9_DISP>;
  2993			};
  2994	
  2995			disp_ovl1_outproc0: outproc@32d70000 {
  2996				compatible = "mediatek,mt8196-outproc";
  2997				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC0_DISP>;
  2998				interrupts = <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH 0>;
  2999				reg = <0 0x32d70000 0 0x1000>;
  3000			};
  3001	
  3002			disp_ovl1_outproc1: outproc@32d80000 {
  3003				compatible = "mediatek,mt8196-outproc";
  3004				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC1_DISP>;
  3005				reg = <0 0x32d80000 0 0x1000>;
  3006			};
  3007	
  3008			disp_ovl1_outproc2: outproc@32d90000 {
  3009				compatible = "mediatek,mt8196-outproc";
  3010				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC2_DISP>;
  3011				reg = <0 0x32d90000 0 0x1000>;
  3012			};
  3013	
  3014			disp_ovl1_outproc3: outproc@32da0000 {
  3015				compatible = "mediatek,mt8196-outproc";
  3016				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC3_DISP>;
  3017				reg = <0 0x32da0000 0 0x1000>;
  3018			};
  3019	
  3020			disp_ovl1_outproc4: outproc@32db0000 {
  3021				compatible = "mediatek,mt8196-outproc";
  3022				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC4_DISP>;
  3023				reg = <0 0x32db0000 0 0x1000>;
  3024			};
  3025	
  3026			disp_ovl1_outproc5: outproc@32dc0000 {
  3027				compatible = "mediatek,mt8196-outproc";
  3028				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC5_DISP>;
  3029				reg = <0 0x32dc0000 0 0x1000>;
  3030			};
  3031	
  3032			smi_larb34: larb@32e60000 {
  3033				compatible = "mediatek,mt8196-smi-larb";
  3034				reg = <0 0x32e60000 0 0x1000>;
  3035				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3036				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3037					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3038				clock-names = "apb", "smi";
  3039				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3040				mediatek,larb-id = <34>;
  3041				larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
  3042			};
  3043	
  3044			smi_larb35: larb@32e70000 {
  3045				compatible = "mediatek,mt8196-smi-larb";
  3046				reg = <0 0x32e70000 0 0x1000>;
  3047				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3048				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3049					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3050				clock-names = "apb", "smi";
  3051				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3052				mediatek,larb-id = <35>;
  3053				larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
  3054			};
  3055	
  3056			smi_larb36: larb@32e80000 {
  3057				compatible = "mediatek,mt8196-smi-larb";
  3058				reg = <0 0x32e80000 0 0x1000>;
  3059				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3060				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3061					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3062				clock-names = "apb", "smi";
  3063				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3064				mediatek,larb-id = <36>;
  3065				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
  3066			};
  3067	
  3068			smi_larb37: larb@32e90000 {
  3069				compatible = "mediatek,mt8196-smi-larb";
  3070				reg = <0 0x32e90000 0 0x1000>;
  3071				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3072				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3073					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3074				clock-names = "apb", "smi";
  3075				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  3076				mediatek,larb-id = <37>;
  3077				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
  3078			};
  3079	
  3080			smi_larb5: larb@3600d000 {
  3081				compatible = "mediatek,mt8196-smi-larb";
  3082				reg = <0 0x3600d000 0 0x1000>;
  3083				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3084				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3085					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3086				clock-names = "apb", "smi";
  3087				mediatek,smi = <&smi_disp_common>;
  3088				mediatek,larb-id = <5>;
  3089				larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
  3090			};
  3091	
  3092			smi_larb6: larb@3600e000 {
  3093				compatible = "mediatek,mt8196-smi-larb";
  3094				reg = <0 0x3600e000 0 0x1000>;
  3095				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3096				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3097					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3098				clock-names = "apb", "smi";
  3099				mediatek,smi = <&smi_mdp_common>;
  3100				mediatek,larb-id = <6>;
  3101				larb-port-real-time-type = <1 1 1>;
  3102			};
  3103	
  3104			vdec_soc_gcon_base_clk: syscon@3600f000 {
  3105				/* TODO: Fix compatible in driver */
  3106				compatible = "mediatek,mt8196-vdecsys-soc", "mediatek,mt8196-vdecsys_soc", "syscon";
  3107				reg = <0 0x3600f000 0 0x1000>;
  3108				#clock-cells = <1>;
  3109			};
  3110	
  3111			smi_larb4: larb@3602e000 {
  3112				compatible = "mediatek,mt8196-smi-larb";
  3113				reg = <0 0x3602e000 0 0x1000>;
  3114				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
  3115				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3116					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3117				clock-names = "apb", "smi";
  3118				mediatek,smi = <&smi_mdp_common>;
  3119				mediatek,larb-id = <4>;
  3120				larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
  3121			};
  3122	
  3123			vdec_gcon_base_clk: syscon@3602f000 {
  3124				compatible = "mediatek,mt8196-vdecsys", "syscon";
  3125				reg = <0 0x3602f000 0 0x1000>;
  3126				#clock-cells = <1>;
  3127			};
  3128	
  3129			venc_gcon_clk: syscon@38000000 {
  3130				compatible = "mediatek,mt8196-vencsys", "syscon";
  3131				reg = <0 0x38000000 0 0x1000>;
  3132				mm-hw-ccf-regmap = <&mm_hwv>;
  3133				#clock-cells = <1>;
  3134			};
  3135	
  3136			smi_larb7: larb@38010000 {
  3137				compatible = "mediatek,mt8196-smi-larb";
  3138				reg = <0 0x38010000 0 0x1000>;
  3139				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3140				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3141					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3142				clock-names = "apb", "smi";
  3143				mediatek,smi = <&smi_disp_venc_sub_comm0>;
  3144				mediatek,larb-id = <7>;
  3145				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3146			};
  3147	
  3148			smi_disp_venc_sub_comm0: smi-sub-comm@38070000 {
  3149				compatible = "mediatek,mt8196-smi-sub-common";
  3150				reg = <0 0x38070000 0 0x1000>;
  3151				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3152				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3153					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3154				clock-names = "apb", "smi";
  3155				mediatek,smi = <&smi_disp_common>;
  3156				mediatek,common-id = <15>;
  3157			};
  3158	
  3159			smi_larb41: larb@38090000 {
  3160				compatible = "mediatek,mt8196-smi-larb";
  3161				reg = <0 0x38090000 0 0x1000>;
  3162				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3163				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3164					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3165				clock-names = "apb", "smi";
  3166				mediatek,smi = <&smi_disp_venc_sub_comm0>;
  3167				mediatek,larb-id = <41>;
  3168				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3169			};
  3170	
  3171			venc_gcon_core1_clk: syscon@38800000 {
  3172				/* TODO: Fix compatible in driver */
  3173				compatible = "mediatek,mt8196-vencsys-c1", "mediatek,mt8196-vencsys_c1", "syscon";
  3174				reg = <0 0x38800000 0 0x1000>;
  3175				mm-hw-ccf-regmap = <&mm_hwv>;
  3176				#clock-cells = <1>;
  3177			};
  3178	
  3179			smi_larb8: larb@38810000 {
  3180				compatible = "mediatek,mt8196-smi-larb";
  3181				reg = <0 0x38810000 0 0x1000>;
  3182				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3183				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  3184					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  3185				clock-names = "apb", "smi";
  3186				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  3187				mediatek,larb-id = <8>;
  3188				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3189			};
  3190	
  3191	
  3192			smi_mdp_venc_sub_comm1: smi-sub-comm@38870000 {
  3193				compatible = "mediatek,mt8196-smi-sub-common";
  3194				reg = <0 0x38870000 0 0x1000>;
  3195				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3196				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  3197					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  3198				clock-names = "apb", "smi";
  3199				mediatek,smi = <&smi_mdp_common>;
  3200				mediatek,common-id = <16>;
  3201			};
  3202	
  3203			smi_larb42: larb@38890000 {
  3204				compatible = "mediatek,mt8196-smi-larb";
  3205				reg = <0 0x38890000 0 0x1000>;
  3206				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3207				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  3208					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  3209				clock-names = "apb", "smi";
  3210				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  3211				mediatek,larb-id = <42>;
  3212				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3213			};
  3214	
  3215			venc_gcon_core2_clk: syscon@38c00000 {
  3216				/* TODO: Fix compatible in driver */
  3217				compatible = "mediatek,mt8196-vencsys-c2", "mediatek,mt8196-vencsys_c2", "syscon";
  3218				reg = <0 0x38c00000 0 0x1000>;
  3219				mm-hw-ccf-regmap = <&mm_hwv>;
  3220				#clock-cells = <1>;
  3221			};
  3222	
  3223			smi_larb24: larb@38c10000 {
  3224				compatible = "mediatek,mt8196-smi-larb";
  3225				reg = <0 0x38c10000 0 0x1000>;
  3226				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3227				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  3228					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  3229				clock-names = "apb", "smi";
  3230				mediatek,smi = <&smi_mdp_venc_sub_comm2>;
  3231				mediatek,larb-id = <24>;
  3232				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3233			};
  3234	
  3235			smi_mdp_venc_sub_comm2: smi-sub-comm@38c70000 {
  3236				compatible = "mediatek,mt8196-smi-sub-common";
  3237				reg = <0 0x38c70000 0 0x1000>;
  3238				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3239				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  3240					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  3241				clock-names = "apb", "smi";
  3242				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  3243				mediatek,common-id = <18>;
  3244			};
  3245	
  3246			smi_larb47: larb@38c90000 {
  3247				compatible = "mediatek,mt8196-smi-larb";
  3248				reg = <0 0x38c90000 0 0x1000>;
  3249				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3250				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  3251					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  3252				clock-names = "apb", "smi";
  3253				mediatek,smi = <&smi_mdp_venc_sub_comm2>;
  3254				mediatek,larb-id = <47>;
  3255				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3256			};
  3257	
  3258			cam_main_r1a_clk: syscon@3a000000 {
  3259				/* TODO: Fix compatible in driver */
  3260				compatible = "mediatek,mt8196-cam_main-r1a", "mediatek,mt8196-cam_main_r1a", "syscon";
  3261				reg = <0 0x3a000000 0 0x1000>;
  3262				mm-hw-ccf-regmap = <&mm_hwv>;
  3263				#clock-cells = <1>;
  3264			};
  3265	
  3266			mdpsys_config_clk: syscon@3e000000 {
  3267				compatible = "mediatek,mt8196-mdpsys", "syscon";
  3268				reg = <0 0x3e000000 0 0x1000>;
  3269				#clock-cells = <1>;
  3270			};
  3271	
  3272			smi_larb2: larb@3e030000 {
  3273				compatible = "mediatek,mt8196-smi-larb";
  3274				reg = <0 0x3e030000 0 0x1000>;
  3275				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
  3276				clocks = <&mdpsys_config_clk CLK_MDP_SMI0_SMI>, <&mdpsys_config_clk CLK_MDP_SMI0_SMI>;
  3277				clock-names = "apb", "smi";
  3278				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  3279				mediatek,larb-id = <2>;
  3280				larb-port-real-time-type = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
  3281			};
  3282	
  3283			mdpsys1_config_clk: syscon@3e400000 {
  3284				compatible = "mediatek,mt8196-mdpsys1", "syscon";
  3285				reg = <0 0x3e400000 0 0x1000>;
  3286				#clock-cells = <1>;
  3287			};
  3288	
  3289			smi_larb3: larb@3e430000 {
  3290				compatible = "mediatek,mt8196-smi-larb";
  3291				reg = <0 0x3e430000 0 0x1000>;
  3292				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
  3293				clocks = <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>, <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>;
  3294				clock-names = "apb", "smi";
  3295				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3296				mediatek,larb-id = <3>;
  3297				larb-port-real-time-type = <2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 1 2>;
  3298			};
  3299	
  3300			disp_vdisp_ao_config_clk: syscon@3e800000 {
  3301				/* TODO: Fix compatible in driver */
  3302				compatible = "mediatek,mt8196-disp-vdisp-ao-config", "mediatek,mt8196-disp_vdisp_ao_config", "syscon";
  3303				reg = <0 0x3e800000 0 0x1000>;
  3304				mm-hw-ccf-regmap = <&mm_hwv>;
  3305				#clock-cells = <1>;
  3306			};
  3307	
  3308			smi_disp_dram_sub_comm0: smi-sub-comm@3e810000 {
  3309				compatible = "mediatek,mt8196-smi-sub-common";
  3310				reg = <0 0x3e810000 0 0x1000>;
  3311				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  3312				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3313						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3314				clock-names = "apb", "smi";
  3315				mediatek,smi = <&smi_disp_common>;
  3316				mediatek,common-id = <9>;
  3317			};
  3318	
  3319			smi_disp_dram_sub_comm1: smi-sub-comm@3e820000 {
  3320				compatible = "mediatek,mt8196-smi-sub-common";
  3321				reg = <0 0x3e820000 0 0x1000>;
  3322				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  3323				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3324						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3325				clock-names = "apb", "smi";
  3326				mediatek,smi = <&smi_disp_common>;
  3327				mediatek,common-id = <10>;
  3328			};
  3329	
  3330			smi_mdp_dram_sub_comm2: smi-sub-comm@3e830000 {
  3331				compatible = "mediatek,mt8196-smi-sub-common";
  3332				reg = <0 0x3e830000 0 0x1000>;
  3333				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  3334				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3335						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3336				clock-names = "apb", "smi";
  3337				mediatek,smi = <&smi_mdp_common>;
  3338				mediatek,common-id = <11>;
  3339			};
  3340	
  3341			smi_mdp_dram_sub_comm3: smi-sub-comm@3e840000 {
  3342				compatible = "mediatek,mt8196-smi-sub-common";
  3343				reg = <0 0x3e840000 0 0x1000>;
  3344				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  3345				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3346						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3347				clock-names = "apb", "smi";
  3348				mediatek,smi = <&smi_mdp_common>;
  3349				mediatek,common-id = <12>;
  3350			};
  3351	
  3352			dp_tx: dp-tx@3ec00000 {
  3353				compatible = "mediatek,mt8196-dp-tx";
  3354				reg = <0 0x3ec00000 0 0x5000>,
  3355				      <0 0x128b0000 0 0x1500>,
  3356				      <0 0x1002d600 0 0x4>,
  3357				      <0 0x31b50078 0 0x4>;
  3358				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT>,
  3359						<&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
  3360				power-domain-names = "pd_dp_tx", "pd_dp_phy";
  3361				interrupts = <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH 0>;
  3362				dptx,phy-params = <0x221c1814 0x24241e18 0x0000302a
  3363						   0x0e080400 0x000c0600 0x00000006>;
  3364				#phy-cells = <0>;
  3365				clocks = <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
  3366					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  3367				clock-names = "mux_dp",
  3368					      "ck_26m";
  3369			};
  3370	
  3371			edp_tx: edp-tx@3ec40000 {
  3372				compatible = "mediatek,mt8196-edp-tx";
  3373				reg = <0 0x3ec40000 0 0x4000>,
  3374				      <0 0x130a0000 0 0x1500>,
  3375				      <0 0x31b50074 0 0x4>;
  3376				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT>;
  3377				clocks = <&cksys_gp2_clk CLK_CK2_DVO_SEL>;
  3378				clock-names = "power";
  3379				max-linkrate-mhz = <8100>;
  3380				interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH 0>;
  3381				status = "disabled";
  3382			};
  3383	
  3384			gpu_smmu: iommu@48600000 {
  3385				#iommu-cells = <1>;
  3386				compatible = "mediatek,mt8196-gpu-smmu", "arm,smmu-v3";
  3387				reg = <0 0x48600000 0 0x1e0000>;
  3388				interrupts = <GIC_SPI 616 IRQ_TYPE_LEVEL_HIGH 0>;
  3389				interrupt-names = "combined";
  3390				status = "disabled";
  3391			};
  3392	
  3393			mfgpll_pll_ctrl_clk: syscon@4b810000 {
  3394				/* TODO: Fix compatible in driver */
  3395				compatible = "mediatek,mt8196-mfgpll-pll-ctrl", "mediatek,mt8196-mfgpll_pll_ctrl", "syscon";
  3396				reg = <0 0x4b810000 0 0x400>;
  3397				#clock-cells = <1>;
  3398			};
  3399	
  3400			mfgpll_sc0_pll_ctrl_clk: syscon@4b810400 {
  3401				/* TODO: Fix compatible in driver */
  3402				compatible = "mediatek,mt8196-mfgpll-sc0-pll-ctrl", "mediatek,mt8196-mfgpll_sc0_pll_ctrl", "syscon";
  3403				reg = <0 0x4b810400 0 0x400>;
  3404				#clock-cells = <1>;
  3405			};
  3406	
  3407			mfgpll_sc1_pll_ctrl_clk: syscon@4b810800 {
  3408				/* TODO: Fix compatible in driver */
  3409				compatible = "mediatek,mt8196-mfgpll-sc1-pll-ctrl", "mediatek,mt8196-mfgpll_sc1_pll_ctrl", "syscon";
  3410				reg = <0 0x4b810800 0 0x1000>;
  3411				#clock-cells = <1>;
  3412			};
  3413	
  3414			devapc_gpu: devapc@4b890000 {
  3415				compatible = "mediatek,mt8196-devapc";
  3416				reg = <0 0x4b890000 0 0x1000>;
  3417				vio-idx-num = <20>;
  3418				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
  3419			};
  3420	
  3421			devapc_gpu1: devapc@4b8b0000 {
  3422				compatible = "mediatek,mt8196-devapc";
  3423				reg = <0 0x4b8b0000 0 0x1000>;
  3424				vio-idx-num = <26>;
  3425				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
  3426			};
  3427	
  3428			apu_smmu: iommu@4c000000 {
  3429				compatible = "mediatek,mt8196-apu-smmu", "arm,smmu-v3";
  3430				reg = <0 0x4c000000 0 0x1e0000>;
  3431				interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING 0>;
  3432				interrupt-names = "combined";
  3433				#iommu-cells = <1>;
  3434			};
  3435	
> 3436			sound: sound {
  3437				compatible = "mediatek,mt8196-mt6681-sound";
  3438				mediatek,platform = <&afe>;
  3439				/* audio-routing is added here as a placeholder to complete the
  3440				   probe flow.It should be removed when upstreaming */
  3441				audio-routing = "Headphone Jack", "HPOL",
  3442						"Headphone Jack", "HPOR";
  3443				status = "disabled";
  3444			};
  3445		};
  3446	};
  3447	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
