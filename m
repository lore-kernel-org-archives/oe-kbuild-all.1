Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81881487F8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 03:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738812509; cv=none; b=ekUnLmEzfu9CKNtB0FYnTLouiNr34enuncNJVZUNqZJMZ2KrEOxpT9ddZqgjJg/7NnpxsdCOM794p3OVQ0a/AMu8OrbsQ4haPADcmPf52fZoWzBv/7yIcEBVYRWBMOojfa+U6yYf34waTpJT2TAvSEVkReKNSKTMtOP8xNotXII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738812509; c=relaxed/simple;
	bh=YdzAkvaSvPsLdvmtbuShKFv/dyoTy1xQh1e+UrO6TrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZDSwyZ/4O4NQ9Tvc9sVHUkH07i9QrJ1PzfX278KxwemtlVj1gXXHLQwQdJKYH/884BlC3pA31s1R+AbhYOHMailpuW6S0d5ggv4n/5C4hBy364C6pu9jOkj21pUsMx4nKMXXrvkJYKePiHisnybOQjeR4yu9BUI61i1oEd0G3h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmmmn0YM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmmmn0YM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738812504; x=1770348504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YdzAkvaSvPsLdvmtbuShKFv/dyoTy1xQh1e+UrO6TrA=;
  b=hmmmn0YMjDgd+yUMSPrvjXj5Rn7arzuaIT+74KHHaJ+5+jiTgyXFtAEo
   LttIhFfhc4yzPnvI7u3HQSsAseTfly37Ci3kJrmmDZJZBPIMkAGU5nqCx
   qrWo2AODScViU7UpY/tbXyeyy8XYd7gYbgecuR2qcVVy1i5QPXysXch1f
   ombEFC1uy+1jESncGeIdl6RVg1HQcZFSfe62gZk5HgY48KomOQNQ7COMm
   +wE7JE8M4pJBhKZ24aRb/LbFe7iDt63S56X40ff1yd+S7TJV4Nc3PW7A7
   wZwLKjukZx9gn0J4AEvSP3UJFZAjHbX3IzkOqyhpeLkaejCrmTuOm+s3N
   Q==;
X-CSE-ConnectionGUID: /gubJBFLScyKfNooNRf1yg==
X-CSE-MsgGUID: enj8ynEwTRuGTHveU3sk8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64756505"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="64756505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 19:28:20 -0800
X-CSE-ConnectionGUID: BmTBvx/HQfWmKM4MmFyIwQ==
X-CSE-MsgGUID: lyegXhKXTA25goLJdPJmMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141965989"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2025 19:28:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfsYq-000wPF-0c;
	Thu, 06 Feb 2025 03:28:16 +0000
Date: Thu, 6 Feb 2025 11:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 arch/arm64/boot/dts/mediatek/mt8196.dtsi:4227.32-4631.5: Warning
 (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
Message-ID: <202502061139.kaSkD1Z2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1fe62fcb2a55fbf67fb3bb11d7398dfbebfa9f71
commit: 4f541a49834f56400f88a01d532fb96849bb0b25 [204/204] CHROMIUM: arm64: dts: mt8196: add thermal_zone information
config: arm64-randconfig-004-20250206 (https://download.01.org/0day-ci/archive/20250206/202502061139.kaSkD1Z2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061139.kaSkD1Z2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061139.kaSkD1Z2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:8.25-76.4: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:65.21-67.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:68.19-70.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:71.21-74.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2747.10-2751.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2753.14-2757.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:45.27-52.4: Warning (unit_address_vs_reg): /regulator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2504.35-2510.5: Warning (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format error, expected "1a350100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2512.35-2518.5: Warning (simple_bus_reg): /soc/mailbox@1a360000: simple-bus unit address format error, expected "1a360100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4217.16-4225.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:4227.32-4631.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1085.37-1110.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:58.8-68.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:74.8-84.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +4227 arch/arm64/boot/dts/mediatek/mt8196.dtsi

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
   526		firmware: firmware {
   527			mtk-svp-heap {
   528				compatible = "mediatek,secure-heap";
   529				memory-region = <&restricted_region>;
   530			};
   531	
   532			optee {
   533				compatible = "linaro,optee-tz";
   534				method = "smc";
   535				interrupts-extended = <&gic GIC_SPI 955 IRQ_TYPE_LEVEL_HIGH 0>;
   536			};
   537	
   538			scmi: scmi {
   539				compatible = "arm,scmi";
   540				mboxes = <&tinysys_mbox 0>, <&tinysys_mbox 1>;
   541				shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
   542				mbox-names = "tx", "rx";
   543				#address-cells = <1>;
   544				#size-cells = <0>;
   545	
   546				scmi_tinysys: protocol@80 {
   547					reg = <0x80>;
   548					scmi-cm = <9>;
   549				};
   550			};
   551		};
   552	
   553		memory: memory@80000000 {
   554			device_type = "memory";
   555			reg = <0 0x80000000 0 0x40000000>;
   556		};
   557	
   558		pmu_hunter: pmu-hunter {
   559			compatible = "arm,cortex-a720-pmu";
   560			interrupt-parent = <&gic>;
   561			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
   562		};
   563	
   564		pmu_hunter_elp: pmu-hunter-elp {
   565			compatible = "arm,cortex-x4-pmu";
   566			interrupt-parent = <&gic>;
   567			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
   568		};
   569	
   570		pmu_blackhawk: pmu-blackhawk{
   571			compatible = "arm,cortex-x925-pmu";
   572			interrupt-parent = <&gic>;
   573			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
   574		};
   575	
   576		reserved-memory {
   577			#address-cells = <2>;
   578			#size-cells = <2>;
   579			ranges;
   580	
   581			adsp_mem_reserved: adsp-mem-region@90000000 {
   582				compatible = "mediatek,adsp-reserved-memory";
   583				reg = <0 0x90000000 0 0x600000>;
   584				no-map;
   585			};
   586	
   587			afe_dma_mem_reserved: snd-dma-mem-region@90600000 {
   588				compatible = "shared-dma-pool";
   589				reg = <0 0x90600000 0 0x200000>;
   590				no-map;
   591			};
   592	
   593			adsp_dma_mem_reserved: adsp-dma-mem-region@90800000 {
   594				compatible = "shared-dma-pool";
   595				reg = <0 0x90800000 0 0x100000>;
   596				no-map;
   597			};
   598	
   599			gpueb_resv_mem: gpueb-reserved-memory@a0000000 {
   600				compatible = "mediatek,gpueb-resv-mem";
   601				reg = <0 0xa0000000 0 0x200000>; /* 2 MB */
   602				no-map;
   603			};
   604	
   605			vcp_resv_mem: vcp-reserved-memory@a0200000 {
   606				compatible = "mediatek,me-vcp-reserved";
   607				reg = <0 0xa0200000 0 0x01e00000>; /* 30MB */
   608				iommu-addresses = <0 0x00000000 1 0x40000000>; /* 1G */
   609				no-map;
   610			};
   611	
   612			mali_protected: mali-protected@a2000000 { /* 16MB */
   613				compatible = "mali-reserved";
   614				reg = <0x0 0xa2000000 0x0 0x1000000>;
   615				no-map;
   616			};
   617	
   618			restricted_region: secure-region@a3000000 {
   619				compatible = "mediatek,dynamic-restricted-region";
   620				reg = <0 0xa3000000 0 0x1bc00000>; /* 444MB */
   621				no-map;
   622			};
   623		};
   624	
   625		timer: timer {
   626			compatible = "arm,armv8-timer";
   627			interrupt-parent = <&gic>;
   628			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
   629					<GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
   630					<GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
   631					<GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
   632			clock-frequency = <13000000>;
   633		};
   634	
   635		psci {
   636			compatible = "arm,psci-1.0";
   637			method = "smc";
   638		};
   639	
   640		ged: ged {
   641			compatible = "mediatek,ged";
   642			gpufreq-supply = <&gpufreq>;
   643		};
   644	
   645		gpu_dcs: gpu-dcs {
   646			compatible = "mediatek,gpu-dcs";
   647		};
   648	
   649		gpu_dvfs_mode: gpu-loading-mode {
   650			compatible = "mediatek,gpu-loading-mode";
   651			dvfs-loading-mode = <0>;
   652			dvfs-workload-mode = <6>;
   653		};
   654	
   655		gpu_mali_opp: opp-table-gpu {
   656			compatible = "operating-points-v2";
   657	
   658			opp00 {
   659				opp-hz = /bits/ 64 <1612000000>;
   660				opp-microvolt = <795000>;
   661			};
   662	
   663			opp01 {
   664				opp-hz = /bits/ 64 <1586000000>;
   665				opp-microvolt = <790000>;
   666			};
   667	
   668			opp02 {
   669				opp-hz = /bits/ 64 <1560000000>;
   670				opp-microvolt = <785000>;
   671			};
   672	
   673			opp03 {
   674				opp-hz = /bits/ 64 <1534000000>;
   675				opp-microvolt = <780000>;
   676			};
   677	
   678			opp04 {
   679				opp-hz = /bits/ 64 <1508000000>;
   680				opp-microvolt = <770000>;
   681			};
   682	
   683			opp05 {
   684				opp-hz = /bits/ 64 <1482000000>;
   685				opp-microvolt = <765000>;
   686			};
   687	
   688			opp06 {
   689				opp-hz = /bits/ 64 <1456000000>;
   690				opp-microvolt = <760000>;
   691			};
   692	
   693			opp07 {
   694				opp-hz = /bits/ 64 <1430000000>;
   695				opp-microvolt = <750000>;
   696			};
   697	
   698			opp08 {
   699				opp-hz = /bits/ 64 <1404000000>;
   700				opp-microvolt = <745000>;
   701			};
   702	
   703			opp09 {
   704				opp-hz = /bits/ 64 <1378000000>;
   705				opp-microvolt = <740000>;
   706			};
   707	
   708			opp10 {
   709				opp-hz = /bits/ 64 <1352000000>;
   710				opp-microvolt = <735000>;
   711			};
   712	
   713			opp11 {
   714				opp-hz = /bits/ 64 <1326000000>;
   715				opp-microvolt = <730000>;
   716			};
   717	
   718			opp12 {
   719				opp-hz = /bits/ 64 <1300000000>;
   720				opp-microvolt = <720000>;
   721			};
   722	
   723			opp13 {
   724				opp-hz = /bits/ 64 <1274000000>;
   725				opp-microvolt = <715000>;
   726			};
   727	
   728			opp14 {
   729				opp-hz = /bits/ 64 <1248000000>;
   730				opp-microvolt = <710000>;
   731			};
   732	
   733			opp15 {
   734				opp-hz = /bits/ 64 <1222000000>;
   735				opp-microvolt = <705000>;
   736			};
   737	
   738			opp16 {
   739				opp-hz = /bits/ 64 <1196000000>;
   740				opp-microvolt = <695000>;
   741			};
   742	
   743			opp17 {
   744				opp-hz = /bits/ 64 <1170000000>;
   745				opp-microvolt = <690000>;
   746			};
   747	
   748			opp18 {
   749				opp-hz = /bits/ 64 <1144000000>;
   750				opp-microvolt = <685000>;
   751			};
   752	
   753			opp19 {
   754				opp-hz = /bits/ 64 <1118000000>;
   755				opp-microvolt = <680000>;
   756			};
   757	
   758			opp20 {
   759				opp-hz = /bits/ 64 <1092000000>;
   760				opp-microvolt = <670000>;
   761			};
   762	
   763			opp21 {
   764				opp-hz = /bits/ 64 <1066000000>;
   765				opp-microvolt = <665000>;
   766			};
   767	
   768			opp22 {
   769				opp-hz = /bits/ 64 <1040000000>;
   770				opp-microvolt = <660000>;
   771			};
   772	
   773			opp23 {
   774				opp-hz = /bits/ 64 <1014000000>;
   775				opp-microvolt = <655000>;
   776			};
   777	
   778			opp24 {
   779				opp-hz = /bits/ 64 <988000000>;
   780				opp-microvolt = <645000>;
   781			};
   782	
   783			opp25 {
   784				opp-hz = /bits/ 64 <962000000>;
   785				opp-microvolt = <640000>;
   786			};
   787	
   788			opp26 {
   789				opp-hz = /bits/ 64 <936000000>;
   790				opp-microvolt = <635000>;
   791			};
   792	
   793			opp27 {
   794				opp-hz = /bits/ 64 <910000000>;
   795				opp-microvolt = <630000>;
   796			};
   797	
   798			opp28 {
   799				opp-hz = /bits/ 64 <884000000>;
   800				opp-microvolt = <620000>;
   801			};
   802	
   803			opp29 {
   804				opp-hz = /bits/ 64 <858000000>;
   805				opp-microvolt = <615000>;
   806			};
   807	
   808			opp30 {
   809				opp-hz = /bits/ 64 <832000000>;
   810				opp-microvolt = <610000>;
   811			};
   812	
   813			opp31 {
   814				opp-hz = /bits/ 64 <806000000>;
   815				opp-microvolt = <605000>;
   816			};
   817	
   818			opp32 {
   819				opp-hz = /bits/ 64 <780000000>;
   820				opp-microvolt = <600000>;
   821			};
   822	
   823			opp33 {
   824				opp-hz = /bits/ 64 <754000000>;
   825				opp-microvolt = <590000>;
   826			};
   827	
   828			opp34 {
   829				opp-hz = /bits/ 64 <728000000>;
   830				opp-microvolt = <585000>;
   831			};
   832	
   833			opp35 {
   834				opp-hz = /bits/ 64 <702000000>;
   835				opp-microvolt = <580000>;
   836			};
   837	
   838			opp36 {
   839				opp-hz = /bits/ 64 <676000000>;
   840				opp-microvolt = <575000>;
   841			};
   842	
   843			opp37 {
   844				opp-hz = /bits/ 64 <650000000>;
   845				opp-microvolt = <560000>;
   846			};
   847	
   848			opp38 {
   849				opp-hz = /bits/ 64 <624000000>;
   850				opp-microvolt = <560000>;
   851			};
   852	
   853			opp39 {
   854				opp-hz = /bits/ 64 <598000000>;
   855				opp-microvolt = <555000>;
   856			};
   857	
   858			opp40 {
   859				opp-hz = /bits/ 64 <572000000>;
   860				opp-microvolt = <550000>;
   861			};
   862	
   863			opp41 {
   864				opp-hz = /bits/ 64 <546000000>;
   865				opp-microvolt = <540000>;
   866			};
   867	
   868			opp42 {
   869				opp-hz = /bits/ 64 <520000000>;
   870				opp-microvolt = <535000>;
   871			};
   872	
   873			opp43 {
   874				opp-hz = /bits/ 64 <494000000>;
   875				opp-microvolt = <530000>;
   876			};
   877	
   878			opp44 {
   879				opp-hz = /bits/ 64 <468000000>;
   880				opp-microvolt = <525000>;
   881			};
   882	
   883			opp45 {
   884				opp-hz = /bits/ 64 <442000000>;
   885				opp-microvolt = <515000>;
   886			};
   887	
   888			opp46 {
   889				opp-hz = /bits/ 64 <416000000>;
   890				opp-microvolt = <510000>;
   891			};
   892	
   893			opp47 {
   894				opp-hz = /bits/ 64 <390000000>;
   895				opp-microvolt = <505000>;
   896			};
   897	
   898			opp48 {
   899				opp-hz = /bits/ 64 <364000000>;
   900				opp-microvolt = <500000>;
   901			};
   902	
   903			opp49 {
   904				opp-hz = /bits/ 64 <338000000>;
   905				opp-microvolt = <490000>;
   906			};
   907		};
   908	
   909		gpu_protected_memory_allocator: protected-memory-allocator {
   910			compatible = "arm,protected-memory-allocator";
   911			memory-region = <&mali_protected>;
   912		};
   913	
   914		gpufreq_wrapper: gpufreq-wrapper {
   915			compatible = "mediatek,gpufreq-wrapper";
   916			gpufreq-version = <2>;
   917			dual-buck = <1>;
   918			gpueb-support;
   919			ghpm-supply = <&ghpm>;
   920		};
   921	
   922		mgm: mgm {
   923			compatible = "arm,physical-memory-group-manager";
   924		};
   925	
   926		soc {
   927			compatible = "simple-bus";
   928			#address-cells = <2>;
   929			#size-cells = <2>;
   930			ranges;
   931			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
   932	
   933			qos: qos@11bb00 {
   934				compatible = "mediatek,mt8196-qos";
   935				reg = <0 0x0011bb00 0 0x100>,
   936				      <0 0x0011b9c0 0 0x140>,
   937				      <0 0x0011b920 0 0xa0>;
   938				reg-names = "sram", "share_sram", "share_sram_ext";
   939				mediatek,enable;
   940				scmi-tinysys-supply = <&scmi_tinysys>;
   941			};
   942	
   943			csram_sys: csram-sysram@11bc00 {
   944				reg = <0 0x11bc00 0 0x1400>; /* 5KB */
   945			};
   946	
   947			gpu_qos: gpu-qos@13f800 {
   948				compatible = "mediatek,gpu-qos";
   949				reg = <0 0x13f800 0 0x20>;
   950				qos-mode = <0>;
   951				qos-sysram-support;
   952				qos-value = <0>;
   953			};
   954	
   955			cpu_mcucfg: mcusys-ao-cfg@c000000 {
   956				reg = <0 0xc000000 0 0x10000>; /* 64KB */
   957			};
   958	
   959			cpu_pll: mcusys-pll1u-top@c030000 {
   960				reg = <0 0xc030000 0 0x1000>; /* 4KB */
   961			};
   962	
   963			ccipll_pll_ctrl_clk: syscon@c1e0000 {
   964				/* TODO: Fix compatible in driver */
   965				compatible = "mediatek,mt8196-ccipll-pll-ctrl", "mediatek,mt8196-ccipll_pll_ctrl", "syscon";
   966				reg = <0 0xc1e0000 0 0x400>;
   967				#clock-cells = <1>;
   968			};
   969	
   970			armpll_ll_pll_ctrl_clk: syscon@c1e0400 {
   971				/* TODO: Fix compatible in driver */
   972				compatible = "mediatek,mt8196-armpll-ll-pll-ctrl", "mediatek,mt8196-armpll_ll_pll_ctrl", "syscon";
   973				reg = <0 0xc1e0400 0 0x400>;
   974				#clock-cells = <1>;
   975			};
   976	
   977			armpll_bl_pll_ctrl_clk: syscon@c1e0800 {
   978				/* TODO: Fix compatible in driver */
   979				compatible = "mediatek,mt8196-armpll-bl-pll-ctrl", "mediatek,mt8196-armpll_bl_pll_ctrl", "syscon";
   980				reg = <0 0xc1e0800 0 0x400>;
   981				#clock-cells = <1>;
   982			};
   983	
   984			armpll_b_pll_ctrl_clk: syscon@c1e0c00 {
   985				/* TODO: Fix compatible in driver */
   986				compatible = "mediatek,mt8196-armpll-b-pll-ctrl", "mediatek,mt8196-armpll_b_pll_ctrl", "syscon";
   987				reg = <0 0xc1e0c00 0 0x1000>;
   988				#clock-cells = <1>;
   989			};
   990	
   991			ptppll_pll_ctrl_clk: syscon@c1e4000 {
   992				/* TODO: Fix compatible in driver */
   993				compatible = "mediatek,mt8196-ptppll-pll-ctrl", "mediatek,mt8196-ptppll_pll_ctrl", "syscon";
   994				reg = <0 0xc1e4000 0 0x1000>;
   995				#clock-cells = <1>;
   996			};
   997	
   998			fdvfs: fdvfs@c220400 {
   999				compatible = "mediatek,fdvfs";
  1000				reg = <0 0x0c220400 0 0x20>,
  1001					<0 0x0c220420 0 0x4>,
  1002					<0 0x0c2c2034 0 0x4>;
  1003				reg-names = "fdvfs-reg",
  1004					"fdvfs-cci-reg",
  1005					"fdvfs-support";
  1006			};
  1007	
  1008			mcupm: mcupm@c240000 {
  1009				compatible = "mediatek,mt8196-mcupm";
  1010				reg = <0 0x0c240000 0 0x50000>,
  1011				      <0 0x0c2cf600 0 0xa0>,
  1012				      <0 0x0c242004 0 0x4>,
  1013				      <0 0x0c242018 0 0x4>,
  1014				      <0 0x0c242000 0 0x4>,
  1015				      <0 0x0c242010 0 0x4>;
  1016				reg-names = "mcupm_base",
  1017					    "mbox0_base",
  1018					    "mbox0_set",
  1019					    "mbox0_clr",
  1020					    "mbox0_send",
  1021					    "mbox0_recv";
  1022				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,
  1023					     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
  1024					     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
  1025					     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>,
  1026					     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH 0>,
  1027					     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH 0>,
  1028					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH 0>,
  1029					     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH 0>,
  1030					     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH 0>,
  1031					     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH 0>,
  1032					     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH 0>,
  1033					     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH 0>,
  1034					     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH 0>,
  1035					     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH 0>,
  1036					     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH 0>,
  1037					     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH 0>;
  1038				interrupt-names = "mbox0",
  1039						  "mbox1",
  1040						  "mbox2",
  1041						  "mbox3",
  1042						  "mbox4",
  1043						  "mbox5",
  1044						  "mbox6",
  1045						  "mbox7",
  1046						  "mbox8",
  1047						  "mbox9",
  1048						  "mbox10",
  1049						  "mbox11",
  1050						  "mbox12",
  1051						  "mbox13",
  1052						  "mbox14",
  1053						  "mbox15";
  1054				mediatek,mbox-extend = <16>;
  1055			};
  1056	
  1057			performance: performance-controller@c2c0f20 {
  1058				compatible = "mediatek,cpufreq-hw-v1";
  1059				reg = <0 0xc2c0f20 0 0x120>,
  1060				      <0 0xc2c1040 0 0x120>,
  1061				      <0 0xc2c1160 0 0x120>;
  1062				reg-names = "performance-domain0",
  1063					    "performance-domain1",
  1064					    "performance-domain2";
  1065				#performance-domain-cells = <1>;
  1066			};
  1067	
  1068			cpuhvfs: cpuhvfs@c2c2310 {
  1069				compatible = "mediatek,cpufreq-hybrid";
  1070				reg = <0 0x0c2c2310 0 0xc00>,
  1071				      <0 0x0c2c0f10 0 0x1400>,
  1072				      <0 0x0c2c4850 0 0x800>,
  1073				      <0 0x0c2c2e50 0 0xc0>;
  1074				reg-names = "USRAM", "CSRAM", "ESRAM", "FREQ_HW_STATE";
  1075	
  1076				/* pll mcucfg */
  1077				mcucfg-ver = <0>;
  1078				apmixedsys = <&cpu_pll>;
  1079				clk-div-base = <&cpu_mcucfg>;
  1080	
  1081				/* csram sysram base */
  1082				csram-sys-base = <&csram_sys>;
  1083			};
  1084	
  1085			gic: interrupt-controller@c400000 {
  1086				compatible = "arm,gic-v3";
  1087				reg = <0 0xc400000 0 0x40000>, /* distributor */
  1088				      <0 0xc440000 0 0x200000>; /* redistributor */
  1089				#interrupt-cells = <4>;
  1090				#address-cells = <2>;
  1091				#size-cells = <2>;
  1092				#redistributor-regions = <1>;
  1093				interrupt-parent = <&gic>;
  1094				interrupt-controller;
  1095				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
  1096	
  1097				ppi-partitions {
  1098					ppi_cluster0: interrupt-partition-0 {
  1099						affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
  1100					};
  1101	
  1102					ppi_cluster1: interrupt-partition-1 {
  1103						affinity = <&cpu4 &cpu5 &cpu6>;
  1104					};
  1105	
  1106					ppi_cluster2: interrupt-partition-2 {
  1107						affinity = <&cpu7>;
  1108					};
  1109				};
  1110			};
  1111	
  1112			cksys_clk: syscon@10000000 {
  1113				compatible = "mediatek,mt8196-cksys", "syscon";
  1114				reg = <0 0x10000000 0 0x800>;
  1115				hw-voter-regmap = <&hwv>;
  1116				#clock-cells = <1>;
  1117			};
  1118	
  1119			apmixedsys_clk: syscon@10000800 {
  1120				compatible = "mediatek,mt8196-apmixedsys", "syscon";
  1121				reg = <0 0x10000800 0 0x1000>;
  1122				#clock-cells = <1>;
  1123			};
  1124	
  1125			cksys_gp2_clk: syscon@1000c000 {
  1126				compatible = "mediatek,mt8196-cksys-gp2", "syscon";
  1127				reg = <0 0x1000c000 0 0x800>;
  1128				mm-hw-ccf-regmap = <&mm_hwv>;
  1129				#clock-cells = <1>;
  1130			};
  1131	
  1132			apmixedsys_gp2_clk: syscon@1000c800 {
  1133				/* TODO: Fix compatible in driver */
  1134				compatible = "mediatek,mt8196-apmixedsys-gp2", "mediatek,mt8196-apmixedsys_gp2", "syscon";
  1135				reg = <0 0x1000c800 0 0x1000>;
  1136				#clock-cells = <1>;
  1137			};
  1138	
  1139			ifr_bus: syscon@1002c000 {
  1140				/* TODO: Fix compatible in driver */
  1141				compatible = "mediatek,mt8196-ifr-bus", "mediatek,mt8196-ifr_bus", "syscon";
  1142				reg = <0 0x1002c000 0 0x1000>;
  1143			};
  1144	
  1145			pio: pinctrl@1002d000 {
  1146				compatible = "mediatek,mt8196-pinctrl";
  1147				reg = <0 0x1002d000 0 0x1000>,
  1148				      <0 0x12000000 0 0x1000>,
  1149				      <0 0x12020000 0 0x1000>,
  1150				      <0 0x12040000 0 0x1000>,
  1151				      <0 0x12060000 0 0x1000>,
  1152				      <0 0x12820000 0 0x1000>,
  1153				      <0 0x12840000 0 0x1000>,
  1154				      <0 0x12860000 0 0x1000>,
  1155				      <0 0x13000000 0 0x1000>,
  1156				      <0 0x13020000 0 0x1000>,
  1157				      <0 0x13040000 0 0x1000>,
  1158				      <0 0x130f0000 0 0x1000>,
  1159				      <0 0x13110000 0 0x1000>,
  1160				      <0 0x13800000 0 0x1000>,
  1161				      <0 0x13820000 0 0x1000>,
  1162				      <0 0x13860000 0 0x1000>,
  1163				      <0 0x12080000 0 0x1000>,
  1164				      <0 0x12880000 0 0x1000>,
  1165				      <0 0x13080000 0 0x1000>,
  1166				      <0 0x13880000 0 0x1000>,
  1167				      <0 0x1c54a000 0 0x1000>;
  1168				reg-names = "iocfg0",
  1169					    "iocfg_rt",
  1170					    "iocfg_rm1",
  1171					    "iocfg_rm2",
  1172					    "iocfg_rb",
  1173					    "iocfg_bm1",
  1174					    "iocfg_bm2",
  1175					    "iocfg_bm3",
  1176					    "iocfg_lt",
  1177					    "iocfg_lm1",
  1178					    "iocfg_lm2",
  1179					    "iocfg_lb1",
  1180					    "iocfg_lb2",
  1181					    "iocfg_tm1",
  1182					    "iocfg_tm2",
  1183					    "iocfg_tm3",
  1184					    "eint-e",
  1185					    "eint-s",
  1186					    "eint-w",
  1187					    "eint-n",
  1188					    "eint-c";
  1189				gpio-controller;
  1190				#gpio-cells = <2>;
  1191				gpio-ranges = <&pio 0 0 271>;
  1192				interrupt-controller;
  1193				interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH 0>;
  1194				#interrupt-cells = <2>;
  1195			};
  1196	
  1197			devapc_apinfra_dramc: devapc@102f3000 {
  1198				compatible = "mediatek,mt8196-devapc";
  1199				reg = <0 0x102f3000 0 0x1000>;
  1200				vio-idx-num = <61>;
  1201				interrupts = <GIC_SPI 870 IRQ_TYPE_LEVEL_HIGH 0>;
  1202			};
  1203	
  1204			devapc_apinfra_emi: devapc@10613000 {
  1205				compatible = "mediatek,mt8196-devapc";
  1206				reg = <0 0x10613000 0 0x1000>;
  1207				vio-idx-num = <149>;
  1208				interrupts = <GIC_SPI 869 IRQ_TYPE_LEVEL_HIGH 0>;
  1209			};
  1210	
  1211			devapc_apinfra_big4: devapc@10693000 {
  1212				compatible = "mediatek,mt8196-devapc";
  1213				reg = <0 0x10693000 0 0x1000>;
  1214				vio-idx-num = <89>;
  1215				interrupts = <GIC_SPI 863 IRQ_TYPE_LEVEL_HIGH 0>;
  1216			};
  1217	
  1218			i2c5: i2c@120a0000 {
  1219				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1220				reg = <0 0x120a0000 0 0x20000>,
  1221				      <0 0x16400000 0 0x10000>;
  1222				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
  1223				clocks = <&imp_iic_wrap_e_clk CLK_IMPE_I2C5_I2C>,
  1224					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1225				clock-names = "main", "dma";
  1226				clock-div = <1>;
  1227				#address-cells = <1>;
  1228				#size-cells = <0>;
  1229	
  1230				status = "disabled";
  1231			};
  1232	
  1233			imp_iic_wrap_e_clk: syscon@120c0000 {
  1234				/* TODO: Fix compatible in driver */
  1235				compatible = "mediatek,mt8196-imp-iic-wrap-e", "mediatek,mt8196-imp_iic_wrap_e", "syscon";
  1236				reg = <0 0x120c0000 0 0x1000>;
  1237				#clock-cells = <1>;
  1238			};
  1239	
  1240			mipi_tx_config0: mipi-tx-config@130b0000 {
  1241				compatible = "mediatek,mt8196-mipi-tx";
  1242				reg = <0 0x130b0000 0 0x1000>;
  1243				clocks = <&clk26m>;
  1244				#clock-cells = <0>;
  1245				#phy-cells = <0>;
  1246				clock-output-names = "mipi_tx0_pll";
  1247			};
  1248	
  1249			i2c0: i2c@13130000 {
  1250				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1251				reg = <0 0x13130000 0 0x20000>,
  1252				      <0 0x16370000 0 0x10000>;
  1253				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
  1254				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C0_I2C>,
  1255					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1256				clock-names = "main", "dma";
  1257				clock-div = <1>;
  1258				#address-cells = <1>;
  1259				#size-cells = <0>;
  1260	
  1261				status = "disabled";
  1262			};
  1263	
  1264			i2c3: i2c@13150000 {
  1265				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1266				reg = <0 0x13150000 0 0x20000>,
  1267				      <0 0x163c0000 0 0x10000>;
  1268				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH 0>;
  1269				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C3_I2C>,
  1270					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1271				clock-names = "main", "dma";
  1272				clock-div = <1>;
  1273				#address-cells = <1>;
  1274				#size-cells = <0>;
  1275	
  1276				status = "disabled";
  1277			};
  1278	
  1279			i2c6: i2c@13170000 {
  1280				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1281				reg = <0 0x13170000 0 0x20000>,
  1282				      <0 0x16410000 0 0x10000>;
  1283				interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
  1284				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C6_I2C>,
  1285					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1286				clock-names = "main", "dma";
  1287				clock-div = <1>;
  1288				#address-cells = <1>;
  1289				#size-cells = <0>;
  1290	
  1291				status = "disabled";
  1292			};
  1293	
  1294			i2c10: i2c@13190000 {
  1295				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1296				reg = <0 0x13190000 0 0x20000>,
  1297				      <0 0x164b0000 0 0x10000>;
  1298				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
  1299				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C10_I2C>,
  1300					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1301				clock-names = "main", "dma";
  1302				clock-div = <1>;
  1303				#address-cells = <1>;
  1304				#size-cells = <0>;
  1305	
  1306				status = "disabled";
  1307			};
  1308	
  1309			imp_iic_wrap_w_clk: syscon@131b0000 {
  1310				/* TODO: Fix compatible in driver */
  1311				compatible = "mediatek,mt8196-imp-iic-wrap-w", "mediatek,mt8196-imp_iic_wrap_w", "syscon";
  1312				reg = <0 0x131b0000 0 0x1000>;
  1313				#clock-cells = <1>;
  1314			};
  1315	
  1316			efuse: efuse@13260000 {
  1317				compatible = "mediatek,mt8196-efuse", "mediatek,efuse";
  1318				reg = <0 0x13260000 0 0x1000>;
  1319				#address-cells = <1>;
  1320				#size-cells = <1>;
  1321	
  1322				lvts_e_data1: data1@334 {
  1323					reg = <0x334 0xc>;
  1324				};
  1325	
  1326				lvts_e_data2: data2@340 {
  1327					reg = <0x340 0x14>;
  1328				};
  1329	
  1330				lvts_e_data3: data3@354 {
  1331					reg = <0x354 0x20>;
  1332				};
  1333	
  1334				lvts_e_data4: data4@388 {
  1335					reg = <0x388 0x20>;
  1336				};
  1337			};
  1338	
  1339			i2c1: i2c@13930000 {
  1340				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1341				reg = <0 0x13930000 0 0x80000>,
  1342				      <0 0x16380000 0 0x10000>;
  1343				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH 0>;
  1344				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C1_I2C>,
  1345					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1346				clock-names = "main", "dma";
  1347				clock-div = <1>;
  1348				#address-cells = <1>;
  1349				#size-cells = <0>;
  1350	
  1351				status = "disabled";
  1352			};
  1353	
  1354			i2c2: i2c@139b0000 {
  1355				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1356				reg = <0 0x139b0000 0 0x80000>,
  1357				      <0 0x16390000 0 0x30000>;
  1358				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH 0>;
  1359				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C2_I2C>,
  1360					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1361				clock-names = "main", "dma";
  1362				clock-div = <1>;
  1363				#address-cells = <1>;
  1364				#size-cells = <0>;
  1365	
  1366				status = "disabled";
  1367			};
  1368	
  1369			i2c4: i2c@13a30000 {
  1370				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1371				reg = <0 0x13a30000 0 0x80000>,
  1372				      <0 0x163d0000 0 0x30000>;
  1373				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
  1374				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C4_I2C>,
  1375					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1376				clock-names = "main", "dma";
  1377				clock-div = <1>;
  1378				#address-cells = <1>;
  1379				#size-cells = <0>;
  1380	
  1381				status = "disabled";
  1382			};
  1383	
  1384			i2c7: i2c@13ab0000 {
  1385				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1386				reg = <0 0x13ab0000 0 0x80000>,
  1387				      <0 0x16420000 0 0x30000>;
  1388				interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
  1389				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C7_I2C>,
  1390					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1391				clock-names = "main", "dma";
  1392				clock-div = <1>;
  1393				#address-cells = <1>;
  1394				#size-cells = <0>;
  1395	
  1396				status = "disabled";
  1397			};
  1398	
  1399			i2c8: i2c@13b30000 {
  1400				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1401				reg = <0 0x13b30000 0 0x80000>,
  1402				      <0 0x16450000 0 0x30000>;
  1403				interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH 0>;
  1404				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C8_I2C>,
  1405					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1406				clock-names = "main", "dma";
  1407				clock-div = <1>;
  1408				#address-cells = <1>;
  1409				#size-cells = <0>;
  1410	
  1411				status = "disabled";
  1412			};
  1413	
  1414			i2c9: i2c@13bb0000 {
  1415				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1416				reg = <0 0x13bb0000 0 0x80000>,
  1417				      <0 0x16480000 0 0x30000>;
  1418				interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH 0>;
  1419				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C9_I2C>,
  1420					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1421				clock-names = "main", "dma";
  1422				clock-div = <1>;
  1423				#address-cells = <1>;
  1424				#size-cells = <0>;
  1425	
  1426				status = "disabled";
  1427			};
  1428	
  1429			imp_iic_wrap_n_clk: syscon@13c30000 {
  1430				/* TODO: Fix compatible in driver */
  1431				compatible = "mediatek,mt8196-imp-iic-wrap-n", "mediatek,mt8196-imp_iic_wrap_n", "syscon";
  1432				reg = <0 0x13c30000 0 0x1000>;
  1433				hw-voter-regmap = <&hwv>;
  1434				#clock-cells = <1>;
  1435			};
  1436	
  1437			devapc_apinfra_io_intf: devapc@140a0000 {
  1438				compatible = "mediatek,mt8196-devapc";
  1439				reg = <0 0x140a0000 0 0x1000>;
  1440				vio-idx-num = <8>;
  1441				interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH 0>;
  1442			};
  1443	
  1444			devapc_apinfra_mem_intf: devapc@140c0000 {
  1445				compatible = "mediatek,mt8196-devapc";
  1446				reg = <0 0x140c0000 0 0x1000>;
  1447				vio-idx-num = <7>;
  1448				interrupts = <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH 0>;
  1449			};
  1450	
  1451			devapc_apinfra_slb: devapc@140e0000 {
  1452				compatible = "mediatek,mt8196-devapc";
  1453				reg = <0 0x140e0000 0 0x1000>;
  1454				vio-idx-num = <14>;
  1455				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH 0>;
  1456			};
  1457	
  1458			apifrbus_ao_mem_reg_clk: syscon@14126000 {
  1459				/* TODO: Fix compatible in driver */
  1460				compatible = "mediatek,mt8196-apifrbus-ao-mem-reg", "mediatek,mt8196-apifrbus_ao_mem_reg", "syscon";
  1461				reg = <0 0x14126000 0 0x1000>;
  1462				#clock-cells = <1>;
  1463			};
  1464	
  1465			devapc_apinfra_mem: devapc@14130000 {
  1466				compatible = "mediatek,mt8196-devapc";
  1467				reg = <0 0x14130000 0 0x1000>;
  1468				vio-idx-num = <13>;
  1469				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH 0>;
  1470			};
  1471	
  1472			devapc_apinfra_mem_ctrl: devapc@14131000 {
  1473				compatible = "mediatek,mt8196-devapc";
  1474				reg = <0 0x14131000 0 0x1000>;
  1475				vio-idx-num = <23>;
  1476				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH 0>;
  1477			};
  1478	
  1479			infracfg@14136000 {
  1480				compatible = "mediatek,infracfg";
  1481				reg = <0 0x14136000 0 0x1000>;
  1482			};
  1483	
  1484			devapc_apinfra_int: devapc@142f4000 {
  1485				compatible = "mediatek,mt8196-devapc";
  1486				reg = <0 0x142f4000 0 0x1000>;
  1487				vio-idx-num = <26>;
  1488				interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH 0>;
  1489			};
  1490	
  1491			devapc_apinfra_io_ctrl: devapc@14400000 {
  1492				compatible = "mediatek,mt8196-devapc";
  1493				reg = <0 0x14400000 0 0x1000>;
  1494				vio-idx-num = <10>;
  1495				interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH 0>;
  1496			};
  1497	
  1498			devapc_apinfra_io: devapc@14401000 {
  1499				compatible = "mediatek,mt8196-devapc";
  1500				reg = <0 0x14401000 0 0x1000>;
  1501				vio-idx-num = <230>;
  1502				interrupts = <GIC_SPI 867 IRQ_TYPE_LEVEL_HIGH 0>;
  1503			};
  1504	
  1505			lvts: thermal-sensor@14414000 {
  1506				compatible = "mediatek,mt8196-lvts";
  1507				reg = <0 0x14414000 0 0x1000>,
  1508					<0 0x0c230000 0 0x1000>,
  1509					<0 0x19004000 0 0x1000>,
  1510					<0 0x4b400000 0 0x1000>;
  1511				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>,
  1512						<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
  1513						<GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH 0>,
  1514						<GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH 0>;
  1515				#thermal-sensor-cells = <1>;
  1516				nvmem-cells = <&lvts_e_data1 &lvts_e_data2 &lvts_e_data3
  1517						&lvts_e_data4>;
  1518				nvmem-cell-names = "e_data1","e_data2","e_data3","e_data4";
  1519			};
  1520	
  1521			hwv: syscon@14500000 {
  1522				compatible = "mediatek,mt8196-hwv", "syscon";
  1523				reg = <0 0x14500000 0 0x3000>;
  1524			};
  1525	
  1526			devapc_apinfra_mmu: devapc@14800000 {
  1527				compatible = "mediatek,mt8196-devapc";
  1528				reg = <0 0x14800000 0 0x1000>;
  1529				vio-idx-num = <20>;
  1530				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH 0>;
  1531			};
  1532	
  1533			uart0: serial@16000000 {
  1534				compatible = "mediatek,mt6577-uart";
  1535				reg = <0 0x16000000 0 0x1000>;
  1536				interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH 0>;
  1537				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART0_BCLK_UART>;
  1538				clock-names = "baud", "bus";
  1539	
  1540				status = "disabled";
  1541			};
  1542	
  1543			uart1: serial@16010000 {
  1544				compatible = "mediatek,mt6577-uart";
  1545				reg = <0 0x16010000 0 0x1000>;
  1546				interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH 0>;
  1547				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART1_BCLK_UART>;
  1548				clock-names = "baud", "bus";
  1549	
  1550				status = "disabled";
  1551			};
  1552	
  1553			uart2: serial@16020000 {
  1554				compatible = "mediatek,mt6577-uart";
  1555				reg = <0 0x16020000 0 0x1000>;
  1556				interrupts = <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH 0>;
  1557				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART2_BCLK_UART>;
  1558				clock-names = "baud", "bus";
  1559	
  1560				status = "disabled";
  1561			};
  1562	
  1563			uart3: serial@16030000 {
  1564				compatible = "mediatek,mt6985-uart";
  1565				reg = <0 0x16030000 0 0x1000>;
  1566				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH 0>,
  1567					     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH 0>;    /* uart3 wakeup irq */
  1568				clocks = <&clk104m>, <&pericfg_ao_clk CLK_PERAO_UART3_BCLK_UART>;
  1569				clock-names = "baud", "bus";
  1570	
  1571				status = "disabled";
  1572			};
  1573	
  1574			disp_pwm0: disp-pwm0@160b0000 {
  1575				compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
  1576				reg = <0 0x160b0000 0 0x1000>;
  1577				interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
  1578				#pwm-cells = <2>;
  1579				clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
  1580				clock-names = "main";
  1581				status = "disabled";
  1582			};
  1583	
  1584			disp_pwm1: disp-pwm1@160c0000 {
  1585				compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
  1586				reg = <0 0x160c0000 0 0x1000>;
  1587				#pwm-cells = <2>;
  1588				clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
  1589				clock-names = "main";
  1590				status = "disabled";
  1591			};
  1592	
  1593			spi0: spi@16110000 {
  1594				compatible = "mediatek,mt8196-spi";
  1595				reg = <0 0x16110000 0 0x100>;
  1596				interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
  1597				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1598					<&cksys_clk CLK_CK_SPI0_BCLK_SEL>,
  1599					<&pericfg_ao_clk CLK_PERAO_SPI0_BCLK_SPI>;
  1600				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1601				#address-cells = <1>;
  1602				#size-cells = <0>;
  1603				mediatek,pad-select = <0>;
  1604	
  1605				status = "disabled";
  1606			};
  1607	
  1608			spi1: spi@16130000 {
  1609				compatible = "mediatek,mt8196-spi";
  1610				reg = <0 0x16130000 0 0x100>;
  1611				interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
  1612				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1613					<&cksys_clk CLK_CK_SPI1_BCLK_SEL>,
  1614					<&pericfg_ao_clk CLK_PERAO_SPI1_BCLK_SPI>;
  1615				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1616				#address-cells = <1>;
  1617				#size-cells = <0>;
  1618				mediatek,pad-select = <0>;
  1619	
  1620				status = "disabled";
  1621			};
  1622	
  1623			spi2: spi@16150000 {
  1624				compatible = "mediatek,mt8196-spi";
  1625				reg = <0 0x16150000 0 0x100>;
  1626				interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
  1627				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1628					<&cksys_clk CLK_CK_SPI2_BCLK_SEL>,
  1629					<&pericfg_ao_clk CLK_PERAO_SPI2_BCLK_SPI>;
  1630				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1631				#address-cells = <1>;
  1632				#size-cells = <0>;
  1633				mediatek,pad-select = <0>;
  1634	
  1635				status = "disabled";
  1636			};
  1637	
  1638			spi3: spi@16170000 {
  1639				compatible = "mediatek,mt8196-spi";
  1640				reg = <0 0x16170000 0 0x100>;
  1641				interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
  1642				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1643					<&cksys_clk CLK_CK_SPI3_BCLK_SEL>,
  1644					<&pericfg_ao_clk CLK_PERAO_SPI3_BCLK_SPI>;
  1645				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1646				#address-cells = <1>;
  1647				#size-cells = <0>;
  1648				mediatek,pad-select = <0>;
  1649	
  1650				status = "disabled";
  1651			};
  1652	
  1653			spi4: spi@16190000 {
  1654				compatible = "mediatek,mt8196-spi";
  1655				reg = <0 0x16190000 0 0x100>;
  1656				interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
  1657				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1658					<&cksys_clk CLK_CK_SPI4_BCLK_SEL>,
  1659					<&pericfg_ao_clk CLK_PERAO_SPI4_BCLK_SPI>;
  1660				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1661				#address-cells = <1>;
  1662				#size-cells = <0>;
  1663				mediatek,pad-select = <0>;
  1664	
  1665				status = "disabled";
  1666			};
  1667	
  1668			spi5: spi@161b0000 {
  1669				compatible = "mediatek,mt8196-spi";
  1670				reg = <0 0x161b0000 0 0x100>;
  1671				interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>;
  1672				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1673					<&cksys_clk CLK_CK_SPI5_BCLK_SEL>,
  1674					<&pericfg_ao_clk CLK_PERAO_SPI5_BCLK_SPI>;
  1675				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1676				#address-cells = <1>;
  1677				#size-cells = <0>;
  1678				mediatek,pad-select = <0>;
  1679	
  1680				status = "disabled";
  1681			};
  1682	
  1683			spi6: spi@161d0000 {
  1684				compatible = "mediatek,mt8196-spi";
  1685				reg = <0 0x161d0000 0 0x100>;
  1686				interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
  1687				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1688					<&cksys_clk CLK_CK_SPI6_BCLK_SEL>,
  1689					<&pericfg_ao_clk CLK_PERAO_SPI6_BCLK_SPI>;
  1690				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1691				#address-cells = <1>;
  1692				#size-cells = <0>;
  1693				mediatek,pad-select = <1>;
  1694	
  1695				status = "disabled";
  1696			};
  1697	
  1698			spi7: spi@161f0000 {
  1699				compatible = "mediatek,mt8196-spi";
  1700				reg = <0 0x161f0000 0 0x100>;
  1701				interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH 0>;
  1702				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1703					<&cksys_clk CLK_CK_SPI7_BCLK_SEL>,
  1704					<&pericfg_ao_clk CLK_PERAO_SPI7_BCLK_SPI>;
  1705				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1706				#address-cells = <1>;
  1707				#size-cells = <0>;
  1708				mediatek,pad-select = <0>;
  1709	
  1710				status = "disabled";
  1711			};
  1712	
  1713			i2c11: i2c@16200000 {
  1714				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1715				reg = <0 0x16200000 0 0x40000>,
  1716				      <0 0x164c0000 0 0x10000>;
  1717				interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH 0>;
  1718				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C11_I2C>,
  1719					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1720				clock-names = "main", "dma";
  1721				clock-div = <1>;
  1722				#address-cells = <1>;
  1723				#size-cells = <0>;
  1724	
  1725				status = "disabled";
  1726			};
  1727	
  1728			i2c12: i2c@16240000 {
  1729				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1730				reg = <0 0x16240000 0 0x40000>,
  1731				      <0 0x164d0000 0 0x20000>;
  1732				interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH 0>;
  1733				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C12_I2C>,
  1734					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1735				clock-names = "main", "dma";
  1736				clock-div = <1>;
  1737				#address-cells = <1>;
  1738				#size-cells = <0>;
  1739	
  1740				status = "disabled";
  1741			};
  1742	
  1743			i2c13: i2c@16280000 {
  1744				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1745				reg = <0 0x16280000 0 0x40000>,
  1746				      <0 0x164f0000 0 0x10000>;
  1747				interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
  1748				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C13_I2C>,
  1749					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1750				clock-names = "main", "dma";
  1751				clock-div = <1>;
  1752				#address-cells = <1>;
  1753				#size-cells = <0>;
  1754	
  1755				status = "disabled";
  1756			};
  1757	
  1758			i2c14: i2c@162c0000 {
  1759				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1760				reg = <0 0x162c0000 0 0x40000>,
  1761				      <0 0x16500000 0 0x10000>;
  1762				interrupts = <GIC_SPI 900 IRQ_TYPE_LEVEL_HIGH 0>;
  1763				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C14_I2C>,
  1764					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1765				clock-names = "main", "dma";
  1766				clock-div = <1>;
  1767				#address-cells = <1>;
  1768				#size-cells = <0>;
  1769	
  1770				status = "disabled";
  1771			};
  1772	
  1773			imp_iic_wrap_c_clk: syscon@16300000 {
  1774				/* TODO: Fix compatible in driver */
  1775				compatible = "mediatek,mt8196-imp-iic-wrap-c", "mediatek,mt8196-imp_iic_wrap_c", "syscon";
  1776				reg = <0 0x16300000 0 0x1000>;
  1777				#clock-cells = <1>;
  1778			};
  1779	
  1780			mmc1: mmc@16310000 {
  1781				compatible = "mediatek,mt8196-mmc";
  1782				reg = <0 0x16310000 0 0x1000>,
  1783				      <0 0x12a10000 0 0x1000>;
  1784				interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH 0>;
  1785				clocks = <&cksys_clk CLK_CK_MSDC30_1_SEL>,
  1786						<&pericfg_ao_clk CLK_PERAO_MSDC1_AXI_MSDC1>,
  1787						<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_MSDC1>,
  1788						<&pericfg_ao_clk CLK_PERAO_MSDC1_MSDC_SRC_MSDC1>,
  1789						<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_WRAP_MSDC1>;
  1790				clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
  1791	
  1792				status = "disabled";
  1793			};
  1794	
  1795			mmc2: mmc@16320000 {
  1796				compatible = "mediatek,mt8196-mmc";
  1797				reg = <0 0x16320000 0 0x1000>,
  1798				      <0 0x138a0000 0 0x1000>;
  1799				interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>;
  1800				clocks = <&cksys_clk CLK_CK_MSDC30_2_SEL>,
  1801						<&pericfg_ao_clk CLK_PERAO_MSDC2_AXI_MSDC2>,
  1802						<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_MSDC2>,
  1803						<&pericfg_ao_clk CLK_PERAO_MSDC2_MSDC_SRC_MSDC2>,
  1804						<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_WRAP_MSDC2>;
  1805				clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
  1806	
  1807				status = "disabled";
  1808			};
  1809	
  1810			pwm: pwm@16330000 {
  1811				compatible = "mediatek,pwm";
  1812				reg = <0 0x16330000 0 0x1000>;
  1813				interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH 0>;
  1814	
  1815				status = "disabled";
  1816			};
  1817	
  1818			nor_flash: spi@16340000 {
  1819				compatible = "mediatek,mt8196-nor",
  1820					     "mediatek,mt8186-nor";
  1821				reg = <0 0x16340000 0 0x1000>;
  1822				clocks = <&cksys_clk CLK_CK_SFLASH_SEL>,
  1823					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_FLASH_FLASHIF>,
  1824					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_DRAM_FLASHIF>,
  1825					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_AXI_FLASHIF>,
  1826					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_BCLK_FLASHIF>,
  1827					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_27M_FLASHIF>;
  1828				clock-names = "spi", "sf", "axi", "axi_s", "bclk", "27m";
  1829				assigned-clocks = <&cksys_clk CLK_CK_SFLASH_SEL>;
  1830				assigned-clock-parents = <&cksys_clk CLK_CK_UNIVPLL_D6_D8>;
  1831				interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>;
  1832				#address-cells = <1>;
  1833				#size-cells = <0>;
  1834				status = "disabled";
  1835			};
  1836	
  1837			pericfg_ao_clk: syscon@16640000 {
  1838				/* TODO: Fix compatible in driver */
  1839				compatible = "mediatek,mt8196-pericfg-ao", "mediatek,mt8196-pericfg_ao", "syscon";
  1840				reg = <0 0x16640000 0 0x1000>;
  1841				hw-voter-regmap = <&hwv>;
  1842				#clock-cells = <1>;
  1843			};
  1844	
  1845			devapc_peri: devapc@16670000 {
  1846				compatible = "mediatek,mt8196-devapc";
  1847				reg = <0 0x16670000 0 0x1000>;
  1848				vio-idx-num = <204>;
  1849				interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
  1850			};
  1851	
  1852			xhci0: usb@16700000 {
  1853				compatible = "mediatek,mtk-xhci";
  1854				reg = <0 0x16700000 0 0x1000>,
  1855				      <0 0x16703e00 0 0x0100>;
  1856				reg-names = "mac", "ippc";
  1857				interrupts-extended = <&gic GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH 0>,
  1858						      <&pio 273 IRQ_TYPE_LEVEL_LOW>;
  1859				interrupt-names = "host","wakeup";
  1860				phys = <&u2port0 PHY_TYPE_USB2>,
  1861				       <&u3port0 PHY_TYPE_USB3>;
  1862				#address-cells = <2>;
  1863				#size-cells = <2>;
  1864				clocks = <&vlp_cksys_clk CLK_VLP_CK_USB_TOP_SEL>,
  1865					 <&vlp_cksys_clk CLK_VLP_CK_USB_XHCI_SEL>,
  1866					 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
  1867				clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
  1868				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P0>;
  1869				mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 107>;
  1870				wakeup-source;
  1871				status = "disabled";
  1872			};
  1873	
  1874			xhci1: usb1@16710000 {
  1875				compatible = "mediatek,mtk-xhci";
  1876				reg = <0 0x16710000 0 0x1000>,
  1877				      <0 0x16713e00 0 0x0100>;
  1878				reg-names = "mac", "ippc";
  1879				interrupts-extended = <&gic GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH 0>,
  1880						      <&pio 276 IRQ_TYPE_LEVEL_LOW>;
  1881				interrupt-names = "host","wakeup";
  1882				phys = <&u2port1 PHY_TYPE_USB2>;
  1883				clocks = <&cksys_clk CLK_CK_USB_TOP_1P_SEL>,
  1884					 <&cksys_clk CLK_CK_USB_XHCI_1P_SEL>,
  1885					 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
  1886				clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
  1887				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P1>;
  1888				mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 108>;
  1889				wakeup-source;
  1890				status = "disabled";
  1891			};
  1892	
  1893			u2phy0: usb-phy0@16730000 {
  1894				compatible = "mediatek,xsphy";
  1895				ranges = <0x0 0x0 0x16730000 0x700>;
  1896				#address-cells = <1>;
  1897				#size-cells = <1>;
  1898				status = "disabled";
  1899	
  1900				u2port0: usb2-phy0@0 {
  1901					reg = <0x0 0x400>;
  1902					clocks = <&clk26m>;
  1903					clock-names = "ref";
  1904					#phy-cells = <1>;
  1905					mediatek,discth = <10>;
  1906				};
  1907			};
  1908	
  1909			u2phy1: usb-phy1@16740000 {
  1910				compatible = "mediatek,xsphy";
  1911				ranges = <0x0 0x0 0x16740000 0x700>;
  1912				#address-cells = <1>;
  1913				#size-cells = <1>;
  1914				status = "disabled";
  1915	
  1916				u2port1: usb2-phy1@0 {
  1917					reg = <0x0 0x400>;
  1918					clocks = <&clk26m>;
  1919					clock-names = "ref";
  1920					#phy-cells = <1>;
  1921					mediatek,discth = <10>;
  1922				};
  1923			};
  1924	
  1925			u3phy0: usb3-phy0@16773000 {
  1926				compatible = "mediatek,xsphy";
  1927				ranges;
  1928				reg = <0 0x16773000 0 0x200>;
  1929				#address-cells = <2>;
  1930				#size-cells = <2>;
  1931				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
  1932				status = "disabled";
  1933	
  1934				u3port0: usb3-phy0@16773400 {
  1935					reg = <0 0x16773400 0 0x500>;
  1936					clocks = <&clk26m>;
  1937					clock-names = "ref";
  1938					#phy-cells = <1>;
  1939				};
  1940			};
  1941	
  1942			usbwkcfg_ao_clk: syscon@167a0000 {
  1943				compatible = "mediatek,mt8196-usbwkcfg-ao", "syscon";
  1944				reg = <0 0x167a0000 0 0x1000>;
  1945			};
  1946	
  1947			ufshci: ufshci@16810000 {
  1948				compatible = "mediatek,mt8183-ufshci";
  1949				reg = <0 0x16810000 0 0x2a00>;
  1950	
  1951				interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH 0>,
  1952					     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH 0>,
  1953					     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>,
  1954					     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>,
  1955					     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH 0>,
  1956					     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH 0>,
  1957					     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH 0>,
  1958					     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH 0>,
  1959					     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH 0>;
  1960				clocks =
  1961						<&cksys_clk CLK_CK_SEL>,
  1962						<&cksys_clk CLK_CK_MAINPLL_D4_D2>,
  1963						<&cksys_clk CLK_CK_UNIVPLL_D5>,
  1964						<&cksys_clk CLK_CK_AES_UFSFDE_SEL>,
  1965						<&cksys_clk CLK_CK_UNIVPLL_D6>,
  1966						<&cksys_clk CLK_CK_MAINPLL_D4>,
  1967						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_TX_SYM_UFS>,
  1968						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM0_UFS>,
  1969						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM1_UFS>,
  1970						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SYS_UFS>,
  1971						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SAP_UFS>,
  1972						<&ufscfg_ao_clk CLK_UFSAO_PHY_SAP_UFS>,
  1973						<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_UFS_UFS>,
  1974						<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_AES_UFS>;
  1975				clock-names =
  1976						"ufs_sel",
  1977						"ufs_sel_min_src",
  1978						"ufs_sel_max_src",
  1979						"crypt_mux",
  1980						"crypt_lp",
  1981						"crypt_perf",
  1982						"unipro_tx_sym",
  1983						"unipro_rx_sym0",
  1984						"unipro_rx_sym1",
  1985						"unipro_sys",
  1986						"unipro_sap",
  1987						"ufs_phy_sap",
  1988						"ufshci_ufs",
  1989						"ufshci_aes";
  1990				freq-table-hz =
  1991						<273000000 499200000>,
  1992						<0 0>,
  1993						<0 0>,
  1994						<0 0>,
  1995						<0 0>,
  1996						<0 0>,
  1997						<0 0>,
  1998						<0 0>,
  1999						<0 0>,
  2000						<0 0>,
  2001						<0 0>,
  2002						<0 0>,
  2003						<0 0>,
  2004						<0 0>;
  2005				/* for clock scaling bind vcore */
  2006	
  2007				/* 0.65V for clock scale up */
  2008				boost-crypt-vcore-min = <650000>;
  2009				vcc-supply = <&mt6363_vemc>;
  2010				vccq-supply = <&mt6363_vufs12>;
  2011				resets =	<&ufscfgao_rst 1>,
  2012						<&ufscfgao_rst 2>,
  2013						<&ufscfgao_rst 3>;
  2014				reset-names =	"unipro_rst",
  2015						"crypto_rst",
  2016						"hci_rst";
  2017	
  2018				/*
  2019				 * Control mtcmos with rtff flow by ufs driver,
  2020				 * Instead of scpsys by PM flow.
  2021				 */
  2022				mediatek,ufs-rtff-mtcmos;
  2023				mediatek,ufs-boost-crypt;
  2024				mediatek,ufs-pmc-via-fastauto;
  2025			};
  2026	
  2027			ufscfg_ao_sec_clk: syscon@16890000 {
  2028				/* TODO: Fix compatible in driver */
  2029				compatible = "mediatek,mt8196-ufscfg-ao-sec", "mediatek,mt8196-ufscfg_ao_sec", "syscon";
  2030				reg = <0 0x16890000 0 0x1000>;
  2031				#clock-cells = <1>;
  2032			};
  2033	
  2034			ufscfg_ao_clk: syscon@168a0000 {
  2035				/* TODO: Fix compatible in driver */
  2036				compatible = "mediatek,mt8196-ufscfg-ao", "mediatek,mt8196-ufscfg_ao", "syscon";
  2037				reg = <0 0x168a0000 0 0x1000>;
  2038				#clock-cells = <1>;
  2039	
  2040				ufscfgao_rst: reset-controller {
  2041					compatible = "ti,syscon-reset";
  2042					#reset-cells = <1>;
  2043	
  2044					ti,reset-bits = <
  2045						/* ufs mphy/ufschi/crypto/unipro reset */
  2046						/* 0: mphy */
  2047						0x48   8 0x4c   8 0 0
  2048						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2049						/* 1: unipro */
  2050						0x148  0 0x14c  0 0 0
  2051						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2052						/* 2: ufs-crypto */
  2053						0x148  1 0x14c  1 0 0
  2054						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2055						/* 3: ufshci */
  2056						0x148  2 0x14c  2 0 0
  2057						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2058						>;
  2059				};
  2060			};
  2061	
  2062			pciephy0: phy@16900000 {
  2063				compatible = "mediatek,mt8196-pcie-phy";
  2064				reg = <0 0x16900000 0 0x10000>,
  2065				      <0 0x16920000 0 0x10000>;
  2066				reg-names = "sif", "ckm";
  2067	
  2068				clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_MCU_BUS_PCIE>,
  2069					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_PEXTP_REF_PCIE>;
  2070				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY0>;
  2071	
  2072				num-lanes = <1>;
  2073				#phy-cells = <0>;
  2074				status = "disabled";
  2075			};
  2076	
  2077			pcie0: pcie@16910000 {
  2078				compatible = "mediatek,mt8196-pcie";
  2079				device_type = "pci";
  2080				reg = <0 0x16910000 0 0x4000>;
  2081				reg-names = "pcie-mac";
  2082				#address-cells = <3>;
  2083				#size-cells = <2>;
  2084				interrupts = <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH 0>;
  2085				bus-range = <0x00 0xff>;
  2086				linux,pci-domain = <0>;
  2087				pextpcfg = <&pextp0cfg_ao_clk>;
  2088				ranges = <0x82000000 0 0x50000000 0x0 0x50000000 0 0x8000000>;
  2089	
  2090				clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_PL_P_PCIE>,
  2091					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_TL_PCIE>,
  2092					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_REF_PCIE>,
  2093					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AXI_250_PCIE>,
  2094					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AHB_APB_PCIE>,
  2095					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_VLP_AO_P0_LP_PCIE>;
  2096				clock-names = "pl_250m", "tl_26m", "peri_26m",
  2097					      "peri_mem", "bus", "low_power";
  2098				assigned-clocks = <&cksys_clk CLK_CK_TL_SEL>;
  2099				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  2100	
  2101				resets = <&pextp0ao_rst 0>, <&pextp0ao_rst 1>;
  2102				reset-names = "mac", "phy";
  2103				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC0>;
  2104	
  2105				phys = <&pciephy0>;
  2106				phy-names = "pcie-phy";
  2107	
  2108				status = "disabled";
  2109	
  2110				#interrupt-cells = <1>;
  2111				interrupt-map-mask = <0 0 0 7>;
  2112				interrupt-map = <0 0 0 1 &pcie_intc0 0>,
  2113						<0 0 0 2 &pcie_intc0 1>,
  2114						<0 0 0 3 &pcie_intc0 2>,
  2115						<0 0 0 4 &pcie_intc0 3>;
  2116	
  2117				pcie_intc0: interrupt-controller {
  2118					interrupt-controller;
  2119					#address-cells = <0>;
  2120					#interrupt-cells = <1>;
  2121				};
  2122			};
  2123	
  2124			pciephy1: phy@16930000 {
  2125				compatible = "mediatek,mt8196-pcie-phy";
  2126				reg = <0 0x16930000 0 0x10000>,
  2127				      <0 0x16950000 0 0x10000>;
  2128				reg-names = "sif", "ckm";
  2129	
  2130				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_MCU_BUS_PCIE>,
  2131					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_PEXTP_REF_PCIE>;
  2132				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY1>;
  2133	
  2134				num-lanes = <2>;
  2135				#phy-cells = <0>;
  2136	
  2137				status = "disabled";
  2138			};
  2139	
  2140			pcie1: pcie@16940000 {
  2141				compatible = "mediatek,mt8196-pcie";
  2142				device_type = "pci";
  2143				reg = <0 0x16940000 0 0x4000>;
  2144				reg-names = "pcie-mac";
  2145				#address-cells = <3>;
  2146				#size-cells = <2>;
  2147				interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH 0>;
  2148				bus-range = <0x00 0xff>;
  2149				linux,pci-domain = <1>;
  2150				pextpcfg = <&pextp1cfg_ao_clk>;
  2151				ranges = <0x82000000 0 0x58000000 0x0 0x58000000 0 0x18000000>;
  2152	
  2153				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_PL_P_PCIE>,
  2154					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_TL_PCIE>,
  2155					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_REF_PCIE>,
  2156					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AXI_250_PCIE>,
  2157					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AHB_APB_PCIE>,
  2158					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P1_LP_PCIE>;
  2159				clock-names = "pl_250m", "tl_26m", "peri_26m",
  2160					      "peri_mem", "bus", "low_power";
  2161				assigned-clocks = <&cksys_clk CLK_CK_TL_P1_SEL>;
  2162				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  2163	
  2164				resets = <&pextp1ao_rst 0>, <&pextp1ao_rst 1>;
  2165				reset-names = "mac", "phy";
  2166				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC1>;
  2167	
  2168				phys = <&pciephy1>;
  2169				phy-names = "pcie-phy";
  2170	
  2171				status = "disabled";
  2172	
  2173				#interrupt-cells = <1>;
  2174				interrupt-map-mask = <0 0 0 7>;
  2175				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
  2176						<0 0 0 2 &pcie_intc1 1>,
  2177						<0 0 0 3 &pcie_intc1 2>,
  2178						<0 0 0 4 &pcie_intc1 3>;
  2179	
  2180				pcie_intc1: interrupt-controller {
  2181					interrupt-controller;
  2182					#address-cells = <0>;
  2183					#interrupt-cells = <1>;
  2184				};
  2185			};
  2186	
  2187			pciephy2: phy@16960000 {
  2188				compatible = "mediatek,mt8196-pcie-phy";
  2189				reg = <0 0x16960000 0 0x10000>,
  2190				      <0 0x16980000 0 0x10000>;
  2191				reg-names = "sif", "ckm";
  2192	
  2193				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_MCU_BUS_PCIE>,
  2194					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_PEXTP_REF_PCIE>;
  2195				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY2>;
  2196	
  2197				num-lanes = <1>;
  2198				#phy-cells = <0>;
  2199	
  2200				status = "disabled";
  2201			};
  2202	
  2203			pcie2: pcie@16970000 {
  2204				device_type = "pci";
  2205				compatible = "mediatek,mt8196-pcie";
  2206				reg = <0 0x16970000 0 0x4000>;
  2207				reg-names = "pcie-mac";
  2208				#address-cells = <3>;
  2209				#size-cells = <2>;
  2210				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH 0>;
  2211				bus-range = <0x00 0xff>;
  2212				linux,pci-domain = <2>;
  2213				pextpcfg = <&pextp1cfg_ao_clk>;
  2214				ranges = <0x82000000 0 0x70000000 0x0 0x70000000 0 0x8000000>;
  2215	
  2216				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_PL_P_PCIE>,
  2217					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_TL_PCIE>,
  2218					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_REF_PCIE>,
  2219					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AXI_250_PCIE>,
  2220					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AHB_APB_PCIE>,
  2221					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P2_LP_PCIE>;
  2222				clock-names = "pl_250m", "tl_26m", "peri_26m",
  2223					      "peri_mem", "bus", "low_power";
  2224				assigned-clocks = <&cksys_clk CLK_CK_TL_P2_SEL>;
  2225				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  2226	
  2227				resets = <&pextp1ao_rst 2>, <&pextp1ao_rst 3>;
  2228				reset-names = "mac", "phy";
  2229				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC2>;
  2230	
  2231				phys = <&pciephy2>;
  2232				phy-names = "pcie-phy";
  2233	
  2234				status = "disabled";
  2235	
  2236				#interrupt-cells = <1>;
  2237				interrupt-map-mask = <0 0 0 7>;
  2238				interrupt-map = <0 0 0 1 &pcie_intc2 0>,
  2239						<0 0 0 2 &pcie_intc2 1>,
  2240						<0 0 0 3 &pcie_intc2 2>,
  2241						<0 0 0 4 &pcie_intc2 3>;
  2242	
  2243				pcie_intc2: interrupt-controller {
  2244					interrupt-controller;
  2245					#address-cells = <0>;
  2246					#interrupt-cells = <1>;
  2247				};
  2248			};
  2249	
  2250			pextp0cfg_ao_clk: syscon@169b0000 {
  2251				/* TODO: Fix compatible in driver */
  2252				compatible = "mediatek,mt8196-pextp0cfg-ao", "mediatek,mt8196-pextp0cfg_ao", "syscon", "simple-mfd";
  2253				reg = <0 0x169b0000 0 0x1000>;
  2254				#clock-cells = <1>;
  2255	
  2256				pextp0ao_rst: reset-controller {
  2257					compatible = "ti,syscon-reset";
  2258					#reset-cells = <1>;
  2259	
  2260					ti,reset-bits = <
  2261						/* 0: PCIe0 MAC reset */
  2262						0x8  0 0xc  0 0 0
  2263						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2264						/* 1: PCIe0 PHY reset */
  2265						0x8  1 0xc  1 0 0
  2266						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2267						>;
  2268				};
  2269			};
  2270	
  2271			pextp1cfg_ao_clk: syscon@169e0000 {
  2272				/* TODO: Fix compatible in driver */
  2273				compatible = "mediatek,mt8196-pextp1cfg-ao", "mediatek,mt8196-pextp1cfg_ao", "syscon", "simple-mfd";
  2274				reg = <0 0x169e0000 0 0x1000>;
  2275				#clock-cells = <1>;
  2276	
  2277				pextp1ao_rst: reset-controller {
  2278					compatible = "ti,syscon-reset";
  2279					#reset-cells = <1>;
  2280	
  2281					ti,reset-bits = <
  2282						/* 0: PCIe1 MAC reset */
  2283						0x8  0 0xc  0 0 0
  2284						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2285						/* 1: PCIe1 PHY reset */
  2286						0x8  1 0xc  1 0 0
  2287						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2288						/* 2: PCIe2 MAC reset */
  2289						0x8  8 0xc  8 0 0
  2290						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2291						/* 3: PCIe2 PHY reset */
  2292						0x8  9 0xc  9 0 0
  2293						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2294						>;
  2295				};
  2296			};
  2297	
  2298			ssr_top_clk: syscon@18000000 {
  2299				/* TODO: Fix compatible in driver */
  2300				compatible = "mediatek,mt8196-ssr-top", "mediatek,mt8196-ssr_top", "syscon";
  2301				reg = <0 0x18000000 0 0x1000>;
  2302				hw-voter-regmap = <&hwv>;
  2303				#clock-cells = <1>;
  2304			};
  2305	
  2306			devapc_apinfra_ssr: devapc@180f3000 {
  2307				compatible = "mediatek,mt8196-devapc";
  2308				reg = <0 0x180f3000 0 0x1000>;
  2309				vio-idx-num = <39>;
  2310				interrupts = <GIC_SPI 866 IRQ_TYPE_LEVEL_HIGH 0>;
  2311			};
  2312	
  2313			adsp: adsp@1a000000 {
  2314				compatible = "mediatek,mt8196-dsp";
  2315				reg = <0 0x1a000000 0 0x5000>,
  2316				      <0 0x1a210000 0 0x80000>,
  2317				      <0 0x1a345000 0 0x300>,
  2318				      <0 0x1a00f000 0 0x1000>;
  2319				reg-names = "cfg", "sram", "sec", "bus";
  2320				interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH 0>;
  2321				interrupt-names = "wdt";
  2322				power-domains = <&scpsys MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;
  2323				clocks = <&cksys_clk CLK_CK_ADSP_SEL>,
  2324					 <&cksys_clk CLK_CK_TCK_26M_MX9>,
  2325					 <&cksys_clk CLK_CK_ADSPPLL>;
  2326				clock-names = "clk_top_adsp_sel",
  2327					      "clk_top_clk26m",
  2328					      "clk_top_adsppll";
  2329				mbox-names = "rx", "tx";
  2330				mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
  2331				status = "disabled";
  2332			};
  2333	
  2334			devapc_adsp: devapc@1a019000 {
  2335				compatible = "mediatek,mt8196-devapc";
  2336				reg = <0 0x1a019000 0 0x1000>;
  2337				vio-idx-num = <54>;
  2338				interrupts = <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH 0>;
  2339			};
  2340	
  2341			afe_clk: syscon@1a110000 {
  2342				compatible = "mediatek,mt8196-audiosys", "syscon";
  2343				reg = <0 0x1a110000 0 0x1000>;
  2344				#clock-cells = <1>;
  2345			};
  2346	
  2347			afe: mt8196-afe-pcm@1a110000 {
  2348				compatible = "mediatek,mt8196-sound";
  2349				reg = <0 0x1a110000 0 0x9000>;
  2350				interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
  2351				cksys = <&cksys_clk>;
  2352				vlpcksys = <&vlp_cksys_clk>;
  2353				power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
  2354				clocks = <&afe_clk CLK_AFE_AUDIO_HOPPING_AFE>,
  2355					<&afe_clk CLK_AFE_AUDIO_F26M_AFE>,
  2356					<&afe_clk CLK_AFE_UL0_ADC_AFE>,
  2357					<&afe_clk CLK_AFE_UL0_ADC_HIRES_AFE>,
  2358					<&afe_clk CLK_AFE_UL1_ADC_AFE>,
  2359					<&afe_clk CLK_AFE_UL1_ADC_HIRES_AFE>,
  2360					<&afe_clk CLK_AFE_APLL1_AFE>,
  2361					<&afe_clk CLK_AFE_APLL2_AFE>,
  2362					<&afe_clk CLK_AFE_APLL_TUNER1_AFE>,
  2363					<&afe_clk CLK_AFE_APLL_TUNER2_AFE>,
  2364					<&vlp_cksys_clk CLK_VLP_CK_AUD_INTBUS_SEL>,
  2365					<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN1_SEL>,
  2366					<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN2_SEL>,
  2367					<&vlp_cksys_clk CLK_VLP_CK_AUDIO_H_SEL>,
  2368					<&vlp_cksys_clk CLK_VLP_CK_CLKSQ>,
  2369					<&cksys_clk CLK_CK_MAINPLL_D4_D4>,
  2370					<&cksys_clk CLK_CK_AUD_1_SEL>,
  2371					<&cksys_clk CLK_CK_APLL1>,
  2372					<&cksys_clk CLK_CK_AUD_2_SEL>,
  2373					<&cksys_clk CLK_CK_APLL2>,
  2374					<&cksys_clk CLK_CK_APLL1_D4>,
  2375					<&cksys_clk CLK_CK_APLL2_D4>,
  2376					<&cksys_clk CLK_CK_APLL_I2SIN0_MCK_SEL>,
  2377					<&cksys_clk CLK_CK_APLL_I2SIN1_MCK_SEL>,
  2378					<&cksys_clk CLK_CK_APLL_FMI2S_MCK_SEL>,
  2379					<&cksys_clk CLK_CK_APLL_TDMOUT_MCK_SEL>,
  2380					<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN0>,
  2381					<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN1>,
  2382					<&cksys_clk CLK_CK_APLL12_CK_DIV_FMI2S>,
  2383					<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_M>,
  2384					<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_B>,
  2385					<&cksys_clk CLK_CK_ADSP_SEL>,
  2386					<&cksys_clk CLK_CK_TCK_26M_MX9>;
  2387	
  2388				clock-names = "aud_hopping_clk",
  2389					"aud_f26m_clk",
  2390					"aud_ul0_adc_clk",
  2391					"aud_ul0_adc_hires_clk",
  2392					"aud_ul1_adc_clk",
  2393					"aud_ul1_adc_hires_clk",
  2394					"aud_apll1_clk",
  2395					"aud_apll2_clk",
  2396					"aud_apll_tuner1_clk",
  2397					"aud_apll_tuner2_clk",
  2398					"vlp_mux_audio_int",
  2399					"vlp_mux_aud_eng1",
  2400					"vlp_mux_aud_eng2",
  2401					"vlp_mux_audio_h",
  2402					"vlp_clk26m_clk",
  2403					"ck_mainpll_d4_d4",
  2404					"ck_mux_aud_1",
  2405					"ck_apll1_ck",
  2406					"ck_mux_aud_2",
  2407					"ck_apll2_ck",
  2408					"ck_apll1_d4",
  2409					"ck_apll2_d4",
  2410					"ck_i2sin0_m_sel",
  2411					"ck_i2sin1_m_sel",
  2412					"ck_fmi2s_m_sel",
  2413					"ck_tdmout_m_sel",
  2414					"ck_apll12_div_i2sin0",
  2415					"ck_apll12_div_i2sin1",
  2416					"ck_apll12_div_fmi2s",
  2417					"ck_apll12_div_tdmout_m",
  2418					"ck_apll12_div_tdmout_b",
  2419					"ck_adsp_sel",
  2420					"ck_clk26m_clk";
  2421				pinctrl-names = "aud-clk-mosi-off",
  2422					"aud-clk-mosi-on",
  2423					"aud-dat-mosi-off",
  2424					"aud-dat-mosi-on",
  2425					"aud-dat-mosi-ch34-off",
  2426					"aud-dat-mosi-ch34-on",
  2427					"aud-dat-miso0-off",
  2428					"aud-dat-miso0-on",
  2429					"aud-dat-miso1-off",
  2430					"aud-dat-miso1-on",
  2431					"aud-gpio-i2sin0-off",
  2432					"aud-gpio-i2sin0-on",
  2433					"aud-gpio-i2sout0-off",
  2434					"aud-gpio-i2sout0-on",
  2435					"aud-gpio-i2sin1-off",
  2436					"aud-gpio-i2sin1-on",
  2437					"aud-gpio-i2sout1-off",
  2438					"aud-gpio-i2sout1-on",
  2439					"aud-gpio-i2sin4-off",
  2440					"aud-gpio-i2sin4-on",
  2441					"aud-gpio-i2sout4-off",
  2442					"aud-gpio-i2sout4-on",
  2443					"aud-gpio-i2sin6-off",
  2444					"aud-gpio-i2sin6-on",
  2445					"aud-gpio-i2sout6-off",
  2446					"aud-gpio-i2sout6-on",
  2447					"aud-dat-miso-only-off",
  2448					"aud-dat-miso-only-on",
  2449					"aud-gpio-ap-dmic-off",
  2450					"aud-gpio-ap-dmic-on",
  2451					"aud-gpio-ap-dmic1-off",
  2452					"aud-gpio-ap-dmic1-on",
  2453					"aud-gpio-i2sin3-off",
  2454					"aud-gpio-i2sin3-on",
  2455					"aud-gpio-i2sout3-off",
  2456					"aud-gpio-i2sout3-on";
  2457	
  2458				pinctrl-0 = <&aud_clk_mosi_off>;
  2459				pinctrl-1 = <&aud_clk_mosi_on>;
  2460				pinctrl-2 = <&aud_dat_mosi_off>;
  2461				pinctrl-3 = <&aud_dat_mosi_on>;
  2462				pinctrl-4 = <&aud_dat_mosi_ch34_off>;
  2463				pinctrl-5 = <&aud_dat_mosi_ch34_on>;
  2464				pinctrl-6 = <&aud_dat_miso0_off>;
  2465				pinctrl-7 = <&aud_dat_miso0_on>;
  2466				pinctrl-8 = <&aud_dat_miso1_off>;
  2467				pinctrl-9 = <&aud_dat_miso1_on>;
  2468				pinctrl-10 = <&aud_gpio_i2sin0_off>;
  2469				pinctrl-11 = <&aud_gpio_i2sin0_on>;
  2470				pinctrl-12 = <&aud_gpio_i2sout0_off>;
  2471				pinctrl-13 = <&aud_gpio_i2sout0_on>;
  2472				pinctrl-14 = <&aud_gpio_i2sin1_off>;
  2473				pinctrl-15 = <&aud_gpio_i2sin1_on>;
  2474				pinctrl-16 = <&aud_gpio_i2sout1_off>;
  2475				pinctrl-17 = <&aud_gpio_i2sout1_on>;
  2476				pinctrl-18 = <&aud_gpio_i2sin4_off>;
  2477				pinctrl-19 = <&aud_gpio_i2sin4_on>;
  2478				pinctrl-20 = <&aud_gpio_i2sout4_off>;
  2479				pinctrl-21 = <&aud_gpio_i2sout4_on>;
  2480				pinctrl-22 = <&aud_gpio_i2sin6_off>;
  2481				pinctrl-23 = <&aud_gpio_i2sin6_on>;
  2482				pinctrl-24 = <&aud_gpio_i2sout6_off>;
  2483				pinctrl-25 = <&aud_gpio_i2sout6_on>;
  2484				pinctrl-26 = <&aud_dat_miso_only_off>;
  2485				pinctrl-27 = <&aud_dat_miso_only_on>;
  2486				pinctrl-28 = <&aud_gpio_ap_dmic_off>;
  2487				pinctrl-29 = <&aud_gpio_ap_dmic_on>;
  2488				pinctrl-30 = <&aud_gpio_ap_dmic1_off>;
  2489				pinctrl-31 = <&aud_gpio_ap_dmic1_on>;
  2490				pinctrl-32 = <&aud_gpio_i2sin3_off>;
  2491				pinctrl-33 = <&aud_gpio_i2sin3_on>;
  2492				pinctrl-34 = <&aud_gpio_i2sout3_off>;
  2493				pinctrl-35 = <&aud_gpio_i2sout3_on>;
  2494	
  2495				/* Only for ETDM in/out 4 */
  2496				etdm-out-ch = <2>;
  2497				etdm-in-ch = <2>;
  2498				etdm-out-sync = <0>; /* 0: disable; 1: enable */
  2499				etdm-in-sync = <1>; /* 0: disable; 1: enable */
  2500				etdm-ip-mode = <0>; /* 0: One IP multi-channel 1: Multi-IP 2-channel */
  2501				status = "disabled";
  2502			};
  2503	
  2504			adsp_mailbox0: mailbox@1a350000 {
  2505				compatible = "mediatek,mt8196-adsp-mbox",
  2506					     "mediatek,mt8186-adsp-mbox";
  2507				reg = <0 0x1a350100 0 0x1000>;
  2508				interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH 0>;
  2509				#mbox-cells = <0>;
  2510			};
  2511	
  2512			adsp_mailbox1: mailbox@1a360000 {
  2513				compatible = "mediatek,mt8196-adsp-mbox",
  2514					     "mediatek,mt8186-adsp-mbox";
  2515				reg = <0 0x1a360100 0 0x1000>;
  2516				interrupts = <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH 0>;
  2517				#mbox-cells = <0>;
  2518			};
  2519	
  2520			scpsys: power-controller@1c004000 {
  2521				compatible = "mediatek,mt8196-scpsys-hwv", "syscon";
  2522				reg = <0 0x1c004000 0 0x1000>;
  2523				#power-domain-cells = <1>;
  2524				apifrbus-ao-io-reg-bus = <&ifr_bus>;
  2525				spm = <&scpsys_bus>;
  2526				hw-voter-regmap = <&hwv>;
  2527			};
  2528	
  2529			scpsys_bus: syscon@1c00d000 {
  2530				compatible = "mediatek,mt8196-scpsys-bus", "syscon";
  2531				reg = <0 0x1c00d000 0 0x1000>;
  2532			};
  2533	
  2534			watchdog: watchdog@1c010000 {
  2535				compatible = "mediatek,mt8196-wdt",
  2536						"mediatek,mt6589-wdt",
  2537						"syscon", "simple-mfd";
  2538				reg = <0 0x1c010000 0 0x1000>;
  2539			};
  2540	
  2541			vlp_cksys_clk: syscon@1c016000 {
  2542				/* TODO: Fix compatible in driver */
  2543				compatible = "mediatek,mt8196-vlp-cksys", "mediatek,mt8196-vlp_cksys", "syscon";
  2544				reg = <0 0x1c016000 0 0x1000>;
  2545				hw-voter-regmap = <&hwv>;
  2546				#clock-cells = <1>;
  2547			};
  2548	
  2549			spmi: spmi@1c01a000 {
  2550				compatible = "mediatek,mt8196-spmi";
  2551				reg = <0 0x1c01a000 0 0x0008ff>,
  2552				      <0 0x1c01c000 0 0x000100>,
  2553				      <0 0x1c018000 0 0x0008ff>,
  2554				      <0 0x1c01c800 0 0x000100>;
  2555				reg-names = "pmif", "spmimst","pmif-p","spmimst-p";
  2556				interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>,
  2557						      <&pio 292 IRQ_TYPE_LEVEL_HIGH>,
  2558						      <&gic GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH 0>,
  2559						      <&gic GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH 0>,
  2560						      <&gic GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH 0>,
  2561						      <&gic GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH 0>;
  2562				interrupt-names = "rcs_irq","rcs_irq_p","pmif_irq","spmi_nack_irq","pmif_p_irq","spmi_p_nack_irq";
  2563				interrupt-controller;
  2564				#interrupt-cells = <1>;
  2565				irq-event-en = <0x0 0x0 0x0 0x0 0x0>;
  2566				spmi-dev-mask = <0x85c0>;
  2567				#address-cells = <2>;
  2568				#size-cells = <0>;
  2569			};
  2570	
  2571			devapc_vlp: devapc@1c032000 {
  2572				compatible = "mediatek,mt8196-devapc";
  2573				reg = <0 0x1c032000 0 0x1000>;
  2574				vio-idx-num = <101>;
  2575				interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
  2576			};
  2577	
  2578			sram@1c350000 {
  2579				compatible = "mmio-sram";
  2580				reg = <0x0 0x1c350000 0x0 0x80>;
  2581	
  2582				#address-cells = <1>;
  2583				#size-cells = <1>;
  2584				ranges = <0 0x0 0x1c350000 0x80>;
  2585	
  2586				scmi_tx_shmem: mailbox-sram@0 {
  2587					compatible = "arm,scmi-shmem";
  2588					reg = <0x0 0x80>;
  2589				};
  2590			};
  2591	
  2592			tinysys_mbox: mailbox@1c351000 {
  2593				compatible = "mediatek,tinysys_mbox";
  2594				reg = <0 0x1c351000 0 0x1000>,
  2595				      <0 0x1c361000 0 0x1000>;
  2596				/* for profiling */
  2597				shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
  2598				interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH 0>,
  2599					     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH 0>;
  2600				#mbox-cells = <1>;
  2601				/* notify spm clr */
  2602				secure-sspm-md2spm-clr = <1>;
  2603			};
  2604	
  2605			sram@1c360000 {
  2606				compatible = "mmio-sram";
  2607				reg = <0x0 0x1c360000 0x0 0x80>;
  2608	
  2609				#address-cells = <1>;
  2610				#size-cells = <1>;
  2611				ranges = <0 0x0 0x1c360000 0x80>;
  2612	
  2613				scmi_rx_shmem: mailbox-sram@0 {
  2614					compatible = "arm,scmi-shmem";
  2615					reg = <0x0 0x80>;
  2616				};
  2617			};
  2618	
  2619			systimer: systimer@1c400000 {
  2620				compatible = "mediatek,mt8196-timer",
  2621					     "mediatek,mt6765-timer";
  2622				reg = <0 0x1c400000 0 0x1000>;
  2623				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH 0>;
  2624				clocks = <&clk13m>;
  2625			};
  2626	
  2627			smi_disp_common: smi-comm@30020000 {
  2628				compatible = "mediatek,mt8196-smi-common";
  2629				reg = <0 0x30020000 0 0x1000>;
  2630				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2631				mediatek,smi = <&disp_ssc0_smi_2x1_sub_comm>;
  2632				mediatek,common-id = <0>;
  2633				mediatek,skip-rpm-cb;
  2634			};
  2635	
  2636			smi_mdp_common: smi-comm@30021000 {
  2637				compatible = "mediatek,mt8196-smi-common";
  2638				reg = <0 0x30021000 0 0x1000>;
  2639				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2640				mediatek,smi = <&mdp_ssc4_smi_2x1_sub_comm>;
  2641				mediatek,common-id = <1>;
  2642				mediatek,skip-rpm-cb;
  2643			};
  2644	
  2645			devapc_mminfra: devapc@30040000 {
  2646				compatible = "mediatek,mt8196-devapc";
  2647				reg = <0 0x30040000 0 0x1000>;
  2648				vio-idx-num = <699>;
  2649				interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
  2650			};
  2651	
  2652			gce0: gce@300c0000 {
  2653				compatible = "mediatek,mt8196-gce";
  2654				reg = <0 0x300c0000 0 0x80000>;
  2655				interrupts = <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH 0>;
  2656				#mbox-cells = <2>;
  2657				iommus = <&mm_smmu 199>;
  2658				mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
  2659				mediatek,gce-events = <CMDQ_SYNC_SECURE_THR_EOF>;
  2660			};
  2661	
  2662			gce1: gce@30140000 {
  2663				compatible = "mediatek,mt8196-gce";
  2664				reg = <0 0x30140000 0 0x80000>;
  2665				interrupts = <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH 0>;
  2666				#mbox-cells = <2>;
  2667				iommus = <&mm_smmu 183>;
  2668			};
  2669	
  2670			mm_smmu: iommu@30800000 {
  2671				compatible = "mediatek,mt8196-mm-smmu", "arm,smmu-v3";
  2672				reg = <0 0x30800000 0 0x1e0000>;
  2673				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>;
  2674				interrupt-names = "combined";
  2675				#iommu-cells = <1>;
  2676			};
  2677	
  2678			disp_ssc0_smi_2x1_sub_comm: smi-comm@30a30000 {
  2679				compatible = "mediatek,mt8196-smi-common";
  2680				reg = <0 0x30a30000 0 0x1000>;
  2681				mediatek,common-id = <3>;
  2682				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2683				mediatek,skip-rpm-cb;
  2684			};
  2685	
  2686			disp_ssc1_smi_2x1_sub_comm: smi-comm@30a31000 {
  2687				compatible = "mediatek,mt8196-smi-common";
  2688				reg = <0 0x30a31000 0 0x1000>;
  2689				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2690				mediatek,common-id = <4>;
  2691				mediatek,skip-rpm-cb;
  2692			};
  2693	
  2694			mdp_ssc4_smi_2x1_sub_comm: smi-comm@30a32000 {
  2695				compatible = "mediatek,mt8196-smi-common";
  2696				reg = <0 0x30a32000 0 0x1000>;
  2697				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2698				mediatek,common-id = <5>;
  2699				mediatek,skip-rpm-cb;
  2700			};
  2701	
  2702			mdp_ssc5_smi_2x1_sub_comm: smi-comm@30a33000 {
  2703				compatible = "mediatek,mt8196-smi-common";
  2704				reg = <0 0x30a33000 0 0x1000>;
  2705				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2706				mediatek,common-id = <6>;
  2707				mediatek,skip-rpm-cb;
  2708			};
  2709	
  2710			vcp: vcp@31800000 {
  2711				compatible = "mediatek,vcp";
  2712				reg = <0 0x31800000 0 0x60000>, /* sram */
  2713				      <0 0x31a04000 0 0xa000>, /* cfg */
  2714				      <0 0x31bd0000 0 0x1000>, /* cfg core */
  2715				      <0 0x31b80000 0 0x50000>, /* mbox base */
  2716				      <0 0x31a70020 0 0x100>, /* mbox init */
  2717				      <0 0x1c00091c 0 0x4>; /* vcp rdy */
  2718				reg-names = "sram",
  2719					    "cfg",
  2720					    "cfg_core",
  2721					    "mbox_base",
  2722					    "mbox_init",
  2723					    "vcp_vlp_ao_rsvd7";
  2724	
  2725				interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>,
  2726					     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>,
  2727					     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH 0>,
  2728					     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>,
  2729					     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH 0>,
  2730					     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
  2731				interrupt-names = "wdt",
  2732						  "mbox0",
  2733						  "mbox1",
  2734						  "mbox2",
  2735						  "mbox3",
  2736						  "mbox4";
  2737	
  2738				power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
  2739				iommus = <&mm_smmu 160>;
  2740				memory-region = <&vcp_resv_mem>;
  2741	
  2742				vcp-mem-tbl = <0 0x1a00000>, /* VCP_RTOS_MEM_ID 26MB */
  2743					      <1 0x30000>, /* VDEC_MEM_ID 192KB */
  2744					      <2 0x12000>, /* VENC_MEM_ID 72KB */
  2745					      <3 0x1000>; /* LOGGER 4KB*/
  2746	
  2747				vcp@0 {
  2748					compatible = "mediatek,vcp-core";
  2749					twohart = <1>;
  2750					sram-offset = <0x0>;
  2751				};
  2752	
  2753				vcp@31000 {
  2754					compatible = "mediatek,mmup-core";
  2755					twohart = <0>;
  2756					sram-offset = <0x031000>;
  2757				};
  2758	
  2759				send_table: mtk-send-table {
  2760					mbox0-0 {
  2761						mbox-id = <0>;
  2762						chan-id = <0>;
  2763						msg-size = <18>;
  2764					};
  2765					mbox1-15 {
  2766						mbox-id = <1>;
  2767						chan-id = <15>;
  2768						msg-size = <8>;
  2769					};
  2770					mbox1-16 {
  2771						mbox-id = <1>;
  2772						chan-id = <16>;
  2773						msg-size = <18>;
  2774					};
  2775					mbox1-9 {
  2776						mbox-id = <1>;
  2777						chan-id = <9>;
  2778						msg-size = <2>;
  2779					};
  2780					mbox2-11 {
  2781						mbox-id = <2>;
  2782						chan-id = <11>;
  2783						msg-size = <18>;
  2784					};
  2785					mbox2-2 {
  2786						mbox-id = <2>;
  2787						chan-id = <2>;
  2788						msg-size = <2>;
  2789					};
  2790					mbox2-3 {
  2791						mbox-id = <2>;
  2792						chan-id = <3>;
  2793						msg-size = <3>;
  2794					};
  2795					mbox2-32 {
  2796						mbox-id = <2>;
  2797						chan-id = <32>;
  2798						msg-size = <2>;
  2799					};
  2800					mbox3-33 {
  2801						mbox-id = <3>;
  2802						chan-id = <33>;
  2803						msg-size = <2>;
  2804					};
  2805					mbox3-13 {
  2806						mbox-id = <3>;
  2807						chan-id = <13>;
  2808						msg-size = <2>;
  2809					};
  2810					mbox3-35 {
  2811						mbox-id = <3>;
  2812						chan-id = <35>;
  2813						msg-size = <2>;
  2814					};
  2815					mbox4-20 {
  2816						mbox-id = <4>;
  2817						chan-id = <20>;
  2818						msg-size = <2>;
  2819					};
  2820					mbox4-21 {
  2821						mbox-id = <4>;
  2822						chan-id = <21>;
  2823						msg-size = <3>;
  2824					};
  2825					mbox4-23 {
  2826						mbox-id = <4>;
  2827						chan-id = <23>;
  2828						msg-size = <2>;
  2829					};
  2830				};
  2831	
  2832				recv_table: mtk-recv-table {
  2833					mbox0-1 {
  2834						mbox-id = <0>;
  2835						chan-id = <1>;
  2836						msg-size = <18>;
  2837						recv-opt = <0>;
  2838					};
  2839					mbox1-15 {
  2840						mbox-id = <1>;
  2841						chan-id = <15>;
  2842						msg-size = <8>;
  2843						recv-opt = <1>;
  2844					};
  2845					mbox1-17 {
  2846						mbox-id = <1>;
  2847						chan-id = <17>;
  2848						msg-size = <18>;
  2849						recv-opt = <0>;
  2850					};
  2851					mbox1-10 {
  2852						mbox-id = <1>;
  2853						chan-id = <10>;
  2854						msg-size = <2>;
  2855						recv-opt = <0>;
  2856					};
  2857					mbox2-12 {
  2858						mbox-id = <2>;
  2859						chan-id = <12>;
  2860						msg-size = <18>;
  2861						recv-opt = <0>;
  2862					};
  2863					mbox2-5 {
  2864						mbox-id = <2>;
  2865						chan-id = <5>;
  2866						msg-size = <1>;
  2867						recv-opt = <0>;
  2868					};
  2869					mbox2-2 {
  2870						mbox-id = <2>;
  2871						chan-id = <2>;
  2872						msg-size = <1>;
  2873						recv-opt = <1>;
  2874					};
  2875					mbox3-34 {
  2876						mbox-id = <3>;
  2877						chan-id = <34>;
  2878						msg-size = <2>;
  2879						recv-opt = <0>;
  2880					};
  2881					mbox3-14 {
  2882						mbox-id = <3>;
  2883						chan-id = <14>;
  2884						msg-size = <2>;
  2885						recv-opt = <0>;
  2886					};
  2887					mbox4-26 {
  2888						mbox-id = <4>;
  2889						chan-id = <26>;
  2890						msg-size = <1>;
  2891						recv-opt = <0>;
  2892					};
  2893					mbox4-20 {
  2894						mbox-id = <4>;
  2895						chan-id = <20>;
  2896						msg-size = <1>;
  2897						recv-opt = <1>;
  2898					};
  2899				};
  2900			};
  2901	
  2902			mminfra_hwv: syscon@31a80000 {
  2903				/* TODO: Fix compatible in driver */
  2904				compatible = "mediatek,mt8196-mminfra-hwv", "mediatek,mt8196-mminfra_hwv", "syscon";
  2905				reg = <0 0x31a80000 0 0x1000>;
  2906			};
  2907	
  2908			devapc_mmup: devapc@31ad5000 {
  2909				compatible = "mediatek,mt8196-devapc";
  2910				reg = <0 0x31ad5000 0 0x1000>;
  2911				vio-idx-num = <71>;
  2912				interrupts = <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH 0>;
  2913			};
  2914	
  2915			mm_hwv: syscon@31b00000 {
  2916				/* TODO: Fix compatible in driver */
  2917				compatible = "mediatek,mt8196-mm-hwv", "mediatek,mt8196-mm_hwv", "syscon";
  2918				reg = <0 0x31b00000 0 0x3000>;
  2919			};
  2920	
  2921			hfrpsys: power-controller@31b50000 {
  2922				compatible = "mediatek,mt8196-hfrpsys-hwv", "syscon";
  2923				reg = <0 0x31b50000 0 0x1000>;
  2924				#power-domain-cells = <1>;
  2925				mmpc = <&hfrpsys>;
  2926				mm-hw-ccf-regmap = <&mm_hwv>;
  2927				mminfra-hwv-regmap = <&mminfra_hwv>;
  2928			};
  2929	
  2930			dispsys_config_clk: syscon@32000000 {
  2931				compatible = "mediatek,mt8196-dispsys0", "syscon";
  2932				reg = <0 0x32000000 0 0x1000>;
  2933				mm-hw-ccf-regmap = <&mm_hwv>;
  2934				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
  2935				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
  2936				#clock-cells = <1>;
  2937	
  2938				async {
  2939					clocks = <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC0_DISP>,
  2940						 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC1_DISP>,
  2941						 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC8_DISP>,
  2942						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC1_DISP>,
  2943						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC2_DISP>,
  2944						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC3_DISP>;
  2945				};
  2946	
  2947				top {
  2948					clocks = <&dispsys_config_clk CLK_MM_CONFIG_DISP>;
  2949				};
  2950			};
  2951	
  2952			disp0_mutex: mutex@32020000 {
  2953				compatible = "mediatek,mt8196-disp-mutex";
  2954				reg = <0 0x32020000 0 0x1000>;
  2955				clocks = <&dispsys_config_clk CLK_MM_DISP_MUTEX0_DISP>;
  2956				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
  2957						      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
  2958			};
  2959	
  2960			disp_ccorr0: disp-ccorr@32090000 {
  2961				compatible = "mediatek,mt8196-disp-ccorr";
  2962				reg = <0 0x32090000 0 0x1000>;
  2963				clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR0_PQ>;
  2964			};
  2965	
  2966			disp_ccorr1: disp-ccorr@320a0000 {
  2967				compatible = "mediatek,mt8196-disp-ccorr";
  2968				reg = <0 0x320a0000 0 0x1000>;
  2969				clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR1_PQ>;
  2970			};
  2971	
  2972			disp_dither0: disp-dither@32110000 {
  2973				compatible = "mediatek,mt8196-disp-dither",
  2974					     "mediatek,mt8183-disp-dither";
  2975				reg = <0 0x32110000 0 0x1000>;
  2976				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
  2977				clocks = <&dispsys_config_clk CLK_MM_DISP_DITHER0_PQ>;
  2978			};
  2979	
  2980			disp_gamma0: disp-gamma@32130000 {
  2981				compatible = "mediatek,mt8196-disp-gamma",
  2982					     "mediatek,mt8195-disp-gamma";
  2983				reg = <0 0x32130000 0 0x1000>;
  2984				clocks = <&dispsys_config_clk CLK_MM_DISP_GAMMA0_PQ>;
  2985			};
  2986	
  2987			disp_tdshp0: disp-tdshp@321e0000 {
  2988				compatible = "mediatek,mt8196-disp-tdshp";
  2989				reg = <0 0x321e0000 0 0x1000>;
  2990				clocks = <&dispsys_config_clk CLK_MM_DISP_TDSHP0_PQ>;
  2991			};
  2992	
  2993			disp_postmask0: postmask@32180000 {
  2994				compatible = "mediatek,mt8196-disp-postmask",
  2995					     "mediatek,mt8192-disp-postmask";
  2996				reg = <0 0x32180000 0 0x1000>;
  2997				clocks = <&dispsys_config_clk CLK_MM_DISP_POSTMASK0_DISP>;
  2998			};
  2999	
  3000			disp_mdp_rsz0: mdp-rsz@321a0000 {
  3001				compatible = "mediatek,mt8196-disp-mdp-rsz";
  3002				reg = <0 0x321a0000 0 0x1000>;
  3003				clocks = <&dispsys_config_clk CLK_MM_MDP_RSZ0_DISP>;
  3004			};
  3005	
  3006			smi_larb32: larb@32240000 {
  3007				compatible = "mediatek,mt8196-smi-larb";
  3008				reg = <0 0x32240000 0 0x1000>;
  3009				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
  3010				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3011					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3012				clock-names = "apb", "smi";
  3013				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3014				mediatek,larb-id = <32>;
  3015				larb-port-real-time-type = <1 1 1 1 0 0 0 0 1 0>;
  3016			};
  3017	
  3018			dispsys1_config_clk: syscon@32400000 {
  3019				compatible = "mediatek,mt8196-dispsys1", "syscon";
  3020				reg = <0 0x32400000 0 0x1000>;
  3021				mm-hw-ccf-regmap = <&mm_hwv>;
  3022				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
  3023				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
  3024				#clock-cells = <1>;
  3025	
  3026				async {
  3027					clocks = <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC21_DISP>,
  3028						 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC22_DISP>,
  3029						 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC23_DISP>;
  3030				};
  3031	
  3032				top {
  3033					clocks = <&dispsys1_config_clk CLK_MM1_DISPSYS1_CONFIG_DISP>;
  3034					clock-names = "dispsys1_config";
  3035				};
  3036			};
  3037	
  3038			disp1_mutex: mutex@32420000 {
  3039				compatible = "mediatek,mt8196-disp-mutex";
  3040				reg = <0 0x32420000 0 0x1000>;
  3041				clocks = <&dispsys1_config_clk CLK_MM1_DISP_MUTEX0_DISP>;
  3042			};
  3043	
  3044			dp_intf0: dp-intf@32430000 {
  3045				compatible = "mediatek,mt8196-dp-intf";
  3046				reg = <0 0x32430000 0 0x1000>;
  3047				interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>;
  3048				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF0>,
  3049					 <&dispsys1_config_clk CLK_MM1_MOD4>,
  3050					 <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
  3051					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D4>,
  3052					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D8>,
  3053					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D16>,
  3054					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL1>,
  3055					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  3056				clock-names = "hf_fmm_ck",
  3057					      "hf_fdp_ck",
  3058					      "mux_dp",
  3059					      "tvdpll_d4",
  3060					      "tvdpll_d8",
  3061					      "tvdpll_d16",
  3062					      "dpi_ck",
  3063					      "dpi_26m";
  3064				num = <0>;
  3065				phys = <&dp_tx>;
  3066				phy-names = "dp_tx";
  3067			};
  3068	
  3069			dp_intf1: dp-intf@32440000 {
  3070				compatible = "mediatek,mt8196-dp-intf";
  3071				reg = <0 0x32440000 0 0x1000>;
  3072				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
  3073				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF1>,
  3074					 <&dispsys1_config_clk CLK_MM1_MOD5>,
  3075					 <&cksys_gp2_clk CLK_CK2_DP1_SEL>,
  3076					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D4>,
  3077					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D8>,
  3078					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D16>,
  3079					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL2>,
  3080					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  3081				clock-names = "hf_fmm_ck",
  3082					      "hf_fdp_ck",
  3083					      "mux_dp",
  3084					      "tvdpll_d4",
  3085					      "tvdpll_d8",
  3086					      "tvdpll_d16",
  3087					      "dpi_ck",
  3088					      "dpi_26m";
  3089				num = <1>;
  3090				no-next-bridge;
  3091				phys = <&dp_tx>;
  3092				phy-names = "dp_tx";
  3093				status = "disabled";
  3094			};
  3095	
  3096			disp_dsc0: disp-dsc0-wrap0@32450000 {
  3097				compatible = "mediatek,mt8196-disp-dsc";
  3098				reg = <0 0x32450000 0 0x1000>;
  3099				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP0>;
  3100			};
  3101	
  3102			disp_dsc1: disp-dsc1-wrap1@32460000 {
  3103				compatible = "mediatek,mt8196-disp-dsc";
  3104				reg = <0 0x32460000 0 0x1000>;
  3105				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP1>;
  3106			};
  3107	
  3108			dsi0: dsi@32490000 {
  3109				compatible = "mediatek,mt8196-dsi";
  3110				reg = <0 0x32490000 0 0x1000>;
  3111				interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH 0>;
  3112				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSI0_DISP>,
  3113					 <&dispsys1_config_clk CLK_MM1_MOD1_DISP>,
  3114					 <&mipi_tx_config0>;
  3115				clock-names = "engine", "digital", "hs";
  3116				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DSI_PHY0>;
  3117				phys = <&mipi_tx_config0>;
  3118				phy-names = "dphy";
  3119				status = "disabled";
  3120			};
  3121	
  3122			disp_dvo0: disp-dvo0@324c0000 {
  3123				compatible = "mediatek,mt8196-edp-dvo";
  3124				reg = <0 0x324c0000 0 0x1000>;
  3125				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
  3126				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DVO0_DISP>,
  3127					 <&cksys_gp2_clk CLK_CK2_DVO_SEL>,
  3128					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL3>,
  3129					 <&dispsys1_config_clk CLK_MM1_MOD6>;
  3130				clock-names = "engine",
  3131					      "pixel",
  3132					      "pll",
  3133					      "hf_fdvo_clk";
  3134				status = "disabled";
  3135			};
  3136	
  3137			smi_larb33: larb@32600000 {
  3138				compatible = "mediatek,mt8196-smi-larb";
  3139				reg = <0 0x32600000 0 0x1000>;
  3140				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
  3141				clocks = <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>,
  3142					 <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>;
  3143				clock-names = "apb", "smi";
  3144				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3145				mediatek,larb-id = <33>;
  3146				larb-port-real-time-type = <0 1 1 1 0 0 0 1 0 0 0 0 0 0 0 1>;
  3147			};
  3148	
  3149			ovlsys_config_clk: syscon@32800000 {
  3150				/* TODO: Fix compatible in driver */
  3151				compatible = "mediatek,mt8196-ovlsys-config", "mediatek,mt8196-ovlsys_config", "syscon";
  3152				reg = <0 0x32800000 0 0x1000>;
  3153				mm-hw-ccf-regmap = <&mm_hwv>;
  3154				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>,
  3155					 <&gce0 8 CMDQ_THR_PRIO_4>, <&gce0 9 CMDQ_THR_PRIO_4>;
  3156				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3157				#clock-cells = <1>;
  3158	
  3159				async {
  3160					clocks = <&ovlsys_config_clk CLK_OVL_DLO5_DISP>,
  3161						 <&ovlsys_config_clk CLK_OVL_DLO6_DISP>;
  3162				};
  3163			};
  3164	
  3165			ovl0_mutex: mutex@32820000 {
  3166				compatible = "mediatek,mt8196-disp-mutex";
  3167				reg = <0 0x32820000 0 0x1000>;
  3168				clocks = <&ovlsys_config_clk CLK_OVL_MUTEX0_DISP>;
  3169				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
  3170						      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
  3171			};
  3172	
  3173			disp_ovl0_exdma2: dma-controller@32850000 {
  3174				compatible = "mediatek,mt8196-exdma";
  3175				reg = <0 0x32850000 0 0x1000>;
  3176				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA2_DISP>;
  3177				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3178				mediatek,larb = <&smi_larb0>;
  3179				iommus = <&mm_smmu 144>;
  3180				#dma-cells = <1>;
  3181			};
  3182	
  3183			disp_ovl0_exdma3: dma-controller@32860000 {
  3184				compatible = "mediatek,mt8196-exdma";
  3185				reg = <0 0x32860000 0 0x1000>;
  3186				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA3_DISP>;
  3187				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3188				mediatek,larb = <&smi_larb1>;
  3189				#dma-cells = <1>;
  3190			};
  3191	
  3192			disp_ovl0_exdma4: dma-controller@32870000 {
  3193				compatible = "mediatek,mt8196-exdma";
  3194				reg = <0 0x32870000 0 0x1000>;
  3195				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA4_DISP>;
  3196				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3197				mediatek,larb = <&smi_larb20>;
  3198				#dma-cells = <1>;
  3199			};
  3200	
  3201			disp_ovl0_exdma5: dma-controller@32880000 {
  3202				compatible = "mediatek,mt8196-exdma";
  3203				reg = <0 0x32880000 0 0x1000>;
  3204				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA5_DISP>;
  3205				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3206				mediatek,larb = <&smi_larb21>;
  3207				#dma-cells = <1>;
  3208			};
  3209	
  3210			disp_ovl0_exdma6: dma-controller@32890000 {
  3211				compatible = "mediatek,mt8196-exdma";
  3212				reg = <0 0x32890000 0 0x1000>;
  3213				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA6_DISP>;
  3214				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3215				mediatek,larb = <&smi_larb1 SMMU_L1_P3_OVL_RDMA6>;
  3216				#dma-cells = <1>;
  3217			};
  3218	
  3219			disp_ovl0_exdma7: dma-controller@328a0000 {
  3220				compatible = "mediatek,mt8196-exdma";
  3221				reg = <0 0x328a0000 0 0x1000>;
  3222				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA7_DISP>;
  3223				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3224				mediatek,larb = <&smi_larb0>;
  3225				#dma-cells = <1>;
  3226			};
  3227	
  3228			disp_ovl0_exdma8: dma-controller@328b0000 {
  3229				compatible = "mediatek,mt8196-exdma";
  3230				reg = <0 0x328b0000 0 0x1000>;
  3231				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA8_DISP>;
  3232				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3233				mediatek,larb = <&smi_larb21>;
  3234				#dma-cells = <1>;
  3235			};
  3236	
  3237			disp_ovl0_exdma9: dma-controller@328c0000 {
  3238				compatible = "mediatek,mt8196-exdma";
  3239				reg = <0 0x328c0000 0 0x1000>;
  3240				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA9_DISP>;
  3241				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3242				mediatek,larb = <&smi_larb20>;
  3243				#dma-cells = <1>;
  3244			};
  3245	
  3246			disp_ovl0_blender0: blender@328d0000 {
  3247				compatible = "mediatek,mt8196-blender";
  3248				reg = <0 0x328d0000 0 0x1000>;
  3249				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER0_DISP>;
  3250			};
  3251	
  3252			disp_ovl0_blender1: blender@328e0000 {
  3253				compatible = "mediatek,mt8196-blender";
  3254				reg = <0 0x328e0000 0 0x1000>;
  3255				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER1_DISP>;
  3256			};
  3257	
  3258			disp_ovl0_blender2: blender@328f0000 {
  3259				compatible = "mediatek,mt8196-blender";
  3260				reg = <0 0x328f0000 0 0x1000>;
  3261				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER2_DISP>;
  3262			};
  3263	
  3264			disp_ovl0_blender3: blender@32900000 {
  3265				compatible = "mediatek,mt8196-blender";
  3266				reg = <0 0x32900000 0 0x1000>;
  3267				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER3_DISP>;
  3268			};
  3269	
  3270			disp_ovl0_blender4: blender@32910000 {
  3271				compatible = "mediatek,mt8196-blender";
  3272				reg = <0 0x32910000 0 0x1000>;
  3273				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER4_DISP>;
  3274			};
  3275	
  3276			disp_ovl0_blender5: blender@32920000 {
  3277				compatible = "mediatek,mt8196-blender";
  3278				reg = <0 0x32920000 0 0x1000>;
  3279				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER5_DISP>;
  3280			};
  3281	
  3282			disp_ovl0_blender6: blender@32930000 {
  3283				compatible = "mediatek,mt8196-blender";
  3284				reg = <0 0x32930000 0 0x1000>;
  3285				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER6_DISP>;
  3286			};
  3287	
  3288			disp_ovl0_blender7: blender@32940000 {
  3289				compatible = "mediatek,mt8196-blender";
  3290				reg = <0 0x32940000 0 0x1000>;
  3291				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER7_DISP>;
  3292			};
  3293	
  3294			disp_ovl0_blender8: blender@32950000 {
  3295				compatible = "mediatek,mt8196-blender";
  3296				reg = <0 0x32950000 0 0x1000>;
  3297				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER8_DISP>;
  3298			};
  3299	
  3300			disp_ovl0_blender9: blender@32960000 {
  3301				compatible = "mediatek,mt8196-blender";
  3302				reg = <0 0x32960000 0 0x1000>;
  3303				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER9_DISP>;
  3304			};
  3305	
  3306			disp_ovl0_outproc0: outproc@32970000 {
  3307				compatible = "mediatek,mt8196-outproc";
  3308				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC0_DISP>;
  3309				interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH 0>;
  3310				reg = <0 0x32970000 0 0x1000>;
  3311				mediatek,gce-events = <CMDQ_EVENT_OVL0_FRAME_DONE_SEL0>;
  3312				mboxes = <&gce0 3 CMDQ_THR_PRIO_4>;
  3313			};
  3314	
  3315			disp_ovl0_outproc1: outproc@32980000 {
  3316				compatible = "mediatek,mt8196-outproc";
  3317				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC1_DISP>;
  3318				interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH 0>;
  3319				reg = <0 0x32980000 0 0x1000>;
  3320			};
  3321	
  3322			disp_ovl0_outproc2: outproc@32990000 {
  3323				compatible = "mediatek,mt8196-outproc";
  3324				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC2_DISP>;
  3325				reg = <0 0x32990000 0 0x1000>;
  3326			};
  3327	
  3328			disp_ovl0_outproc3: outproc@329a0000 {
  3329				compatible = "mediatek,mt8196-outproc";
  3330				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC3_DISP>;
  3331				reg = <0 0x329a0000 0 0x1000>;
  3332			};
  3333	
  3334			disp_ovl0_outproc4: outproc@329b0000 {
  3335				compatible = "mediatek,mt8196-outproc";
  3336				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC4_DISP>;
  3337				reg = <0 0x329b0000 0 0x1000>;
  3338			};
  3339	
  3340			disp_ovl0_outproc5: outproc@329c0000 {
  3341				compatible = "mediatek,mt8196-outproc";
  3342				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC5_DISP>;
  3343				reg = <0 0x329c0000 0 0x1000>;
  3344			};
  3345	
  3346			smi_larb0: larb@32a60000 {
  3347				compatible = "mediatek,mt8196-smi-larb";
  3348				reg = <0 0x32a60000 0 0x1000>;
  3349				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3350				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3351					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3352				clock-names = "apb", "smi";
  3353				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  3354				mediatek,larb-id = <0>;
  3355				larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
  3356			};
  3357	
  3358			smi_larb1: larb@32a70000 {
  3359				compatible = "mediatek,mt8196-smi-larb";
  3360				reg = <0 0x32a70000 0 0x1000>;
  3361				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3362				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3363					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3364				clock-names = "apb", "smi";
  3365				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3366				mediatek,larb-id = <1>;
  3367				larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
  3368			};
  3369	
  3370			smi_larb20: larb@32a80000 {
  3371				compatible = "mediatek,mt8196-smi-larb";
  3372				reg = <0 0x32a80000 0 0x1000>;
  3373				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3374				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3375					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3376				clock-names = "apb", "smi";
  3377				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3378				mediatek,larb-id = <20>;
  3379				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
  3380			};
  3381	
  3382			smi_larb21: larb@32a90000 {
  3383				compatible = "mediatek,mt8196-smi-larb";
  3384				reg = <0 0x32a90000 0 0x1000>;
  3385				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3386				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3387					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3388				clock-names = "apb", "smi";
  3389				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3390				mediatek,larb-id = <21>;
  3391				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
  3392			};
  3393	
  3394			ovlsys1_config_clk: syscon@32c00000 {
  3395				/* TODO: Fix compatible in driver */
  3396				compatible = "mediatek,mt8196-ovlsys1-config", "mediatek,mt8196-ovlsys1_config", "syscon";
  3397				reg = <0 0x32c00000 0 0x1000>;
  3398				mm-hw-ccf-regmap = <&mm_hwv>;
  3399				mboxes = <&gce0 2 CMDQ_THR_PRIO_4>, <&gce0 10 CMDQ_THR_PRIO_4>;
  3400				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3401				#clock-cells = <1>;
  3402	
  3403				async {
  3404					clocks = <&ovlsys1_config_clk CLK_OVL_DLO5_DISP>,
  3405						 <&ovlsys1_config_clk CLK_OVL_DLO6_DISP>;
  3406				};
  3407			};
  3408	
  3409			ovl1_mutex: mutex@32c20000 {
  3410				compatible = "mediatek,mt8196-disp-mutex";
  3411				reg = <0 0x32c20000 0 0x1000>;
  3412				clocks = <&ovlsys1_config_clk CLK_OVL_MUTEX0_DISP>;
  3413				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT2>;
  3414			};
  3415	
  3416			disp_ovl1_exdma2: dma-controller@32c50000 {
  3417				compatible = "mediatek,mt8196-exdma";
  3418				reg = <0 0x32c50000 0 0x1000>;
  3419				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA2_DISP>;
  3420				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3421				mediatek,larb = <&smi_larb34>;
  3422				#dma-cells = <1>;
  3423			};
  3424	
  3425			disp_ovl1_exdma3: dma-controller@32c60000 {
  3426				compatible = "mediatek,mt8196-exdma";
  3427				reg = <0 0x32c60000 0 0x1000>;
  3428				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA3_DISP>;
  3429				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3430				mediatek,larb = <&smi_larb35>;
  3431				#dma-cells = <1>;
  3432			};
  3433	
  3434			disp_ovl1_exdma4: dma-controller@32c70000 {
  3435				compatible = "mediatek,mt8196-exdma";
  3436				reg = <0 0x32c70000 0 0x1000>;
  3437				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA4_DISP>;
  3438				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3439				mediatek,larb = <&smi_larb36>;
  3440				#dma-cells = <1>;
  3441			};
  3442	
  3443			disp_ovl1_exdma5: dma-controller@32c80000 {
  3444				compatible = "mediatek,mt8196-exdma";
  3445				reg = <0 0x32c80000 0 0x1000>;
  3446				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA5_DISP>;
  3447				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3448				mediatek,larb = <&smi_larb37>;
  3449				#dma-cells = <1>;
  3450			};
  3451	
  3452			disp_ovl1_exdma6: dma-controller@32c90000 {
  3453				compatible = "mediatek,mt8196-exdma";
  3454				reg = <0 0x32c90000 0 0x1000>;
  3455				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA6_DISP>;
  3456				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3457				mediatek,larb = <&smi_larb35>;
  3458				#dma-cells = <1>;
  3459			};
  3460	
  3461			disp_ovl1_exdma7: dma-controller@32ca0000 {
  3462				compatible = "mediatek,mt8196-exdma";
  3463				reg = <0 0x32ca0000 0 0x1000>;
  3464				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA7_DISP>;
  3465				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3466				mediatek,larb = <&smi_larb34>;
  3467				#dma-cells = <1>;
  3468			};
  3469	
  3470			disp_ovl1_exdma8: dma-controller@32cb0000 {
  3471				compatible = "mediatek,mt8196-exdma";
  3472				reg = <0 0x32cb0000 0 0x1000>;
  3473				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA8_DISP>;
  3474				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3475				mediatek,larb = <&smi_larb37>;
  3476				#dma-cells = <1>;
  3477			};
  3478	
  3479			disp_ovl1_exdma9: dma-controller@32cc0000 {
  3480				compatible = "mediatek,mt8196-exdma";
  3481				reg = <0 0x32cc0000 0 0x1000>;
  3482				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA9_DISP>;
  3483				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3484				mediatek,larb = <&smi_larb36>;
  3485				#dma-cells = <1>;
  3486			};
  3487	
  3488			disp_ovl1_blender0: blender@32cd0000 {
  3489				compatible = "mediatek,mt8196-blender";
  3490				reg = <0 0x32cd0000 0 0x1000>;
  3491				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER0_DISP>;
  3492			};
  3493	
  3494			disp_ovl1_blender1: blender@32ce0000 {
  3495				compatible = "mediatek,mt8196-blender";
  3496				reg = <0 0x32ce0000 0 0x1000>;
  3497				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER1_DISP>;
  3498			};
  3499	
  3500			disp_ovl1_blender2: blender@32cf0000 {
  3501				compatible = "mediatek,mt8196-blender";
  3502				reg = <0 0x32cf0000 0 0x1000>;
  3503				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER2_DISP>;
  3504			};
  3505	
  3506			disp_ovl1_blender3: blender@32d00000 {
  3507				compatible = "mediatek,mt8196-blender";
  3508				reg = <0 0x32d00000 0 0x1000>;
  3509				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER3_DISP>;
  3510			};
  3511	
  3512			disp_ovl1_blender4: blender@32d10000 {
  3513				compatible = "mediatek,mt8196-blender";
  3514				reg = <0 0x32d10000 0 0x1000>;
  3515				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER4_DISP>;
  3516			};
  3517	
  3518			disp_ovl1_blender5: blender@32d20000 {
  3519				compatible = "mediatek,mt8196-blender";
  3520				reg = <0 0x32d20000 0 0x1000>;
  3521				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER5_DISP>;
  3522			};
  3523	
  3524			disp_ovl1_blender6: blender@32d30000 {
  3525				compatible = "mediatek,mt8196-blender";
  3526				reg = <0 0x32d30000 0 0x1000>;
  3527				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER6_DISP>;
  3528			};
  3529	
  3530			disp_ovl1_blender7: blender@32d40000 {
  3531				compatible = "mediatek,mt8196-blender";
  3532				reg = <0 0x32d40000 0 0x1000>;
  3533				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER7_DISP>;
  3534			};
  3535	
  3536			disp_ovl1_blender8: blender@32d50000 {
  3537				compatible = "mediatek,mt8196-blender";
  3538				reg = <0 0x32d50000 0 0x1000>;
  3539				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER8_DISP>;
  3540			};
  3541	
  3542			disp_ovl1_blender9: blender@32d60000 {
  3543				compatible = "mediatek,mt8196-blender";
  3544				reg = <0 0x32d60000 0 0x1000>;
  3545				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER9_DISP>;
  3546			};
  3547	
  3548			disp_ovl1_outproc0: outproc@32d70000 {
  3549				compatible = "mediatek,mt8196-outproc";
  3550				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC0_DISP>;
  3551				interrupts = <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH 0>;
  3552				reg = <0 0x32d70000 0 0x1000>;
  3553			};
  3554	
  3555			disp_ovl1_outproc1: outproc@32d80000 {
  3556				compatible = "mediatek,mt8196-outproc";
  3557				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC1_DISP>;
  3558				reg = <0 0x32d80000 0 0x1000>;
  3559			};
  3560	
  3561			disp_ovl1_outproc2: outproc@32d90000 {
  3562				compatible = "mediatek,mt8196-outproc";
  3563				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC2_DISP>;
  3564				reg = <0 0x32d90000 0 0x1000>;
  3565			};
  3566	
  3567			disp_ovl1_outproc3: outproc@32da0000 {
  3568				compatible = "mediatek,mt8196-outproc";
  3569				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC3_DISP>;
  3570				reg = <0 0x32da0000 0 0x1000>;
  3571			};
  3572	
  3573			disp_ovl1_outproc4: outproc@32db0000 {
  3574				compatible = "mediatek,mt8196-outproc";
  3575				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC4_DISP>;
  3576				reg = <0 0x32db0000 0 0x1000>;
  3577			};
  3578	
  3579			disp_ovl1_outproc5: outproc@32dc0000 {
  3580				compatible = "mediatek,mt8196-outproc";
  3581				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC5_DISP>;
  3582				reg = <0 0x32dc0000 0 0x1000>;
  3583			};
  3584	
  3585			smi_larb34: larb@32e60000 {
  3586				compatible = "mediatek,mt8196-smi-larb";
  3587				reg = <0 0x32e60000 0 0x1000>;
  3588				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3589				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3590					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3591				clock-names = "apb", "smi";
  3592				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3593				mediatek,larb-id = <34>;
  3594				larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
  3595			};
  3596	
  3597			smi_larb35: larb@32e70000 {
  3598				compatible = "mediatek,mt8196-smi-larb";
  3599				reg = <0 0x32e70000 0 0x1000>;
  3600				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3601				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3602					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3603				clock-names = "apb", "smi";
  3604				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3605				mediatek,larb-id = <35>;
  3606				larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
  3607			};
  3608	
  3609			smi_larb36: larb@32e80000 {
  3610				compatible = "mediatek,mt8196-smi-larb";
  3611				reg = <0 0x32e80000 0 0x1000>;
  3612				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3613				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3614					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3615				clock-names = "apb", "smi";
  3616				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3617				mediatek,larb-id = <36>;
  3618				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
  3619			};
  3620	
  3621			smi_larb37: larb@32e90000 {
  3622				compatible = "mediatek,mt8196-smi-larb";
  3623				reg = <0 0x32e90000 0 0x1000>;
  3624				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3625				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3626					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3627				clock-names = "apb", "smi";
  3628				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  3629				mediatek,larb-id = <37>;
  3630				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
  3631			};
  3632	
  3633			smi_larb5: larb@3600d000 {
  3634				compatible = "mediatek,mt8196-smi-larb";
  3635				reg = <0 0x3600d000 0 0x1000>;
  3636				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3637				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3638					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3639				clock-names = "apb", "smi";
  3640				mediatek,smi = <&smi_disp_common>;
  3641				mediatek,larb-id = <5>;
  3642				larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
  3643			};
  3644	
  3645			smi_larb6: larb@3600e000 {
  3646				compatible = "mediatek,mt8196-smi-larb";
  3647				reg = <0 0x3600e000 0 0x1000>;
  3648				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3649				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3650					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3651				clock-names = "apb", "smi";
  3652				mediatek,smi = <&smi_mdp_common>;
  3653				mediatek,larb-id = <6>;
  3654				larb-port-real-time-type = <1 1 1>;
  3655			};
  3656	
  3657			vdec_soc_gcon_base_clk: syscon@3600f000 {
  3658				/* TODO: Fix compatible in driver */
  3659				compatible = "mediatek,mt8196-vdecsys-soc", "mediatek,mt8196-vdecsys_soc", "syscon";
  3660				reg = <0 0x3600f000 0 0x1000>;
  3661				#clock-cells = <1>;
  3662			};
  3663	
  3664			smi_larb4: larb@3602e000 {
  3665				compatible = "mediatek,mt8196-smi-larb";
  3666				reg = <0 0x3602e000 0 0x1000>;
  3667				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
  3668				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3669					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3670				clock-names = "apb", "smi";
  3671				mediatek,smi = <&smi_mdp_common>;
  3672				mediatek,larb-id = <4>;
  3673				larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
  3674			};
  3675	
  3676			vdec_gcon_base_clk: syscon@3602f000 {
  3677				compatible = "mediatek,mt8196-vdecsys", "syscon";
  3678				reg = <0 0x3602f000 0 0x1000>;
  3679				#clock-cells = <1>;
  3680			};
  3681	
  3682			venc_gcon_clk: syscon@38000000 {
  3683				compatible = "mediatek,mt8196-vencsys", "syscon";
  3684				reg = <0 0x38000000 0 0x1000>;
  3685				mm-hw-ccf-regmap = <&mm_hwv>;
  3686				#clock-cells = <1>;
  3687			};
  3688	
  3689			smi_larb7: larb@38010000 {
  3690				compatible = "mediatek,mt8196-smi-larb";
  3691				reg = <0 0x38010000 0 0x1000>;
  3692				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3693				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3694					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3695				clock-names = "apb", "smi";
  3696				mediatek,smi = <&smi_disp_venc_sub_comm0>;
  3697				mediatek,larb-id = <7>;
  3698				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3699			};
  3700	
  3701			smi_disp_venc_sub_comm0: smi-sub-comm@38070000 {
  3702				compatible = "mediatek,mt8196-smi-sub-common";
  3703				reg = <0 0x38070000 0 0x1000>;
  3704				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3705				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3706					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3707				clock-names = "apb", "smi";
  3708				mediatek,smi = <&smi_disp_common>;
  3709				mediatek,common-id = <15>;
  3710			};
  3711	
  3712			smi_larb41: larb@38090000 {
  3713				compatible = "mediatek,mt8196-smi-larb";
  3714				reg = <0 0x38090000 0 0x1000>;
  3715				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3716				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3717					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3718				clock-names = "apb", "smi";
  3719				mediatek,smi = <&smi_disp_venc_sub_comm0>;
  3720				mediatek,larb-id = <41>;
  3721				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3722			};
  3723	
  3724			venc_gcon_core1_clk: syscon@38800000 {
  3725				/* TODO: Fix compatible in driver */
  3726				compatible = "mediatek,mt8196-vencsys-c1", "mediatek,mt8196-vencsys_c1", "syscon";
  3727				reg = <0 0x38800000 0 0x1000>;
  3728				mm-hw-ccf-regmap = <&mm_hwv>;
  3729				#clock-cells = <1>;
  3730			};
  3731	
  3732			smi_larb8: larb@38810000 {
  3733				compatible = "mediatek,mt8196-smi-larb";
  3734				reg = <0 0x38810000 0 0x1000>;
  3735				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3736				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  3737					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  3738				clock-names = "apb", "smi";
  3739				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  3740				mediatek,larb-id = <8>;
  3741				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3742			};
  3743	
  3744	
  3745			smi_mdp_venc_sub_comm1: smi-sub-comm@38870000 {
  3746				compatible = "mediatek,mt8196-smi-sub-common";
  3747				reg = <0 0x38870000 0 0x1000>;
  3748				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3749				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  3750					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  3751				clock-names = "apb", "smi";
  3752				mediatek,smi = <&smi_mdp_common>;
  3753				mediatek,common-id = <16>;
  3754			};
  3755	
  3756			smi_larb42: larb@38890000 {
  3757				compatible = "mediatek,mt8196-smi-larb";
  3758				reg = <0 0x38890000 0 0x1000>;
  3759				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3760				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  3761					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  3762				clock-names = "apb", "smi";
  3763				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  3764				mediatek,larb-id = <42>;
  3765				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3766			};
  3767	
  3768			venc_gcon_core2_clk: syscon@38c00000 {
  3769				/* TODO: Fix compatible in driver */
  3770				compatible = "mediatek,mt8196-vencsys-c2", "mediatek,mt8196-vencsys_c2", "syscon";
  3771				reg = <0 0x38c00000 0 0x1000>;
  3772				mm-hw-ccf-regmap = <&mm_hwv>;
  3773				#clock-cells = <1>;
  3774			};
  3775	
  3776			smi_larb24: larb@38c10000 {
  3777				compatible = "mediatek,mt8196-smi-larb";
  3778				reg = <0 0x38c10000 0 0x1000>;
  3779				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3780				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  3781					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  3782				clock-names = "apb", "smi";
  3783				mediatek,smi = <&smi_mdp_venc_sub_comm2>;
  3784				mediatek,larb-id = <24>;
  3785				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3786			};
  3787	
  3788			smi_mdp_venc_sub_comm2: smi-sub-comm@38c70000 {
  3789				compatible = "mediatek,mt8196-smi-sub-common";
  3790				reg = <0 0x38c70000 0 0x1000>;
  3791				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3792				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  3793					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  3794				clock-names = "apb", "smi";
  3795				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  3796				mediatek,common-id = <18>;
  3797			};
  3798	
  3799			smi_larb47: larb@38c90000 {
  3800				compatible = "mediatek,mt8196-smi-larb";
  3801				reg = <0 0x38c90000 0 0x1000>;
  3802				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3803				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  3804					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  3805				clock-names = "apb", "smi";
  3806				mediatek,smi = <&smi_mdp_venc_sub_comm2>;
  3807				mediatek,larb-id = <47>;
  3808				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3809			};
  3810	
  3811			cam_main_r1a_clk: syscon@3a000000 {
  3812				/* TODO: Fix compatible in driver */
  3813				compatible = "mediatek,mt8196-cam_main-r1a", "mediatek,mt8196-cam_main_r1a", "syscon";
  3814				reg = <0 0x3a000000 0 0x1000>;
  3815				mm-hw-ccf-regmap = <&mm_hwv>;
  3816				#clock-cells = <1>;
  3817			};
  3818	
  3819			mdpsys_config_clk: syscon@3e000000 {
  3820				compatible = "mediatek,mt8196-mdpsys", "syscon";
  3821				reg = <0 0x3e000000 0 0x1000>;
  3822				#clock-cells = <1>;
  3823			};
  3824	
  3825			smi_larb2: larb@3e030000 {
  3826				compatible = "mediatek,mt8196-smi-larb";
  3827				reg = <0 0x3e030000 0 0x1000>;
  3828				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
  3829				clocks = <&mdpsys_config_clk CLK_MDP_SMI0_SMI>, <&mdpsys_config_clk CLK_MDP_SMI0_SMI>;
  3830				clock-names = "apb", "smi";
  3831				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  3832				mediatek,larb-id = <2>;
  3833				larb-port-real-time-type = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
  3834			};
  3835	
  3836			mdpsys1_config_clk: syscon@3e400000 {
  3837				compatible = "mediatek,mt8196-mdpsys1", "syscon";
  3838				reg = <0 0x3e400000 0 0x1000>;
  3839				#clock-cells = <1>;
  3840			};
  3841	
  3842			smi_larb3: larb@3e430000 {
  3843				compatible = "mediatek,mt8196-smi-larb";
  3844				reg = <0 0x3e430000 0 0x1000>;
  3845				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
  3846				clocks = <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>, <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>;
  3847				clock-names = "apb", "smi";
  3848				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3849				mediatek,larb-id = <3>;
  3850				larb-port-real-time-type = <2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 1 2>;
  3851			};
  3852	
  3853			disp_vdisp_ao_config_clk: syscon@3e800000 {
  3854				/* TODO: Fix compatible in driver */
  3855				compatible = "mediatek,mt8196-disp-vdisp-ao-config", "mediatek,mt8196-disp_vdisp_ao_config", "syscon";
  3856				reg = <0 0x3e800000 0 0x1000>;
  3857				mm-hw-ccf-regmap = <&mm_hwv>;
  3858				#clock-cells = <1>;
  3859			};
  3860	
  3861			smi_disp_dram_sub_comm0: smi-sub-comm@3e810000 {
  3862				compatible = "mediatek,mt8196-smi-sub-common";
  3863				reg = <0 0x3e810000 0 0x1000>;
  3864				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  3865				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3866						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3867				clock-names = "apb", "smi";
  3868				mediatek,smi = <&smi_disp_common>;
  3869				mediatek,common-id = <9>;
  3870			};
  3871	
  3872			smi_disp_dram_sub_comm1: smi-sub-comm@3e820000 {
  3873				compatible = "mediatek,mt8196-smi-sub-common";
  3874				reg = <0 0x3e820000 0 0x1000>;
  3875				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  3876				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3877						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3878				clock-names = "apb", "smi";
  3879				mediatek,smi = <&smi_disp_common>;
  3880				mediatek,common-id = <10>;
  3881			};
  3882	
  3883			smi_mdp_dram_sub_comm2: smi-sub-comm@3e830000 {
  3884				compatible = "mediatek,mt8196-smi-sub-common";
  3885				reg = <0 0x3e830000 0 0x1000>;
  3886				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  3887				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3888						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3889				clock-names = "apb", "smi";
  3890				mediatek,smi = <&smi_mdp_common>;
  3891				mediatek,common-id = <11>;
  3892			};
  3893	
  3894			smi_mdp_dram_sub_comm3: smi-sub-comm@3e840000 {
  3895				compatible = "mediatek,mt8196-smi-sub-common";
  3896				reg = <0 0x3e840000 0 0x1000>;
  3897				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  3898				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3899						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3900				clock-names = "apb", "smi";
  3901				mediatek,smi = <&smi_mdp_common>;
  3902				mediatek,common-id = <12>;
  3903			};
  3904	
  3905			dp_tx: dp-tx@3ec00000 {
  3906				compatible = "mediatek,mt8196-dp-tx";
  3907				reg = <0 0x3ec00000 0 0x5000>,
  3908				      <0 0x128b0000 0 0x1500>,
  3909				      <0 0x1002d600 0 0x4>,
  3910				      <0 0x31b50078 0 0x4>;
  3911				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT>,
  3912						<&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
  3913				power-domain-names = "pd_dp_tx", "pd_dp_phy";
  3914				interrupts = <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH 0>;
  3915				dptx,phy-params = <0x221c1814 0x24241e18 0x0000302a
  3916						   0x0e080400 0x000c0600 0x00000006>;
  3917				#phy-cells = <0>;
  3918				clocks = <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
  3919					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  3920				clock-names = "mux_dp",
  3921					      "ck_26m";
  3922			};
  3923	
  3924			edp_tx: edp-tx@3ec40000 {
  3925				compatible = "mediatek,mt8196-edp-tx";
  3926				reg = <0 0x3ec40000 0 0x4000>,
  3927				      <0 0x130a0000 0 0x1500>,
  3928				      <0 0x31b50074 0 0x4>;
  3929				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT>;
  3930				clocks = <&cksys_gp2_clk CLK_CK2_DVO_SEL>;
  3931				clock-names = "power";
  3932				max-linkrate-mhz = <8100>;
  3933				interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH 0>;
  3934				status = "disabled";
  3935			};
  3936	
  3937			gpu: gpu@48000000 {
  3938				compatible = "mediatek,mali-mt8196", "mediatek,mali";
  3939				reg = <0 0x48000000 0 0x480000>;
  3940				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
  3941					     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
  3942					     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>,
  3943					     <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH 0>,
  3944					     <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>,
  3945					     <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH 0>;
  3946				interrupt-names = "job",
  3947						  "mmu",
  3948						  "gpu",
  3949						  "event",
  3950						  "pwr",
  3951						  "gpueb_mbox1";
  3952				l2-hash-values = <0xb 0xe 0x0>;
  3953				physical-memory-group-manager = <&mgm>;
  3954				protected-memory-allocator = <&gpu_protected_memory_allocator>;
  3955				operating-points-v2 = <&gpu_mali_opp>;
  3956				#cooling-cells = <2>;
  3957				ged-supply = <&ged>;
  3958				system-coherency = <31>;
  3959				sleep-mode-enable;
  3960				firmware-idle-hysteresis-time-us = <0>;
  3961				default-glb-pwroff-timeout-us = <10>;
  3962				autosuspend-delay-ms = <10>;
  3963				adaptive-power-policy = <2>;
  3964				reset-exception-mask = <0x0>;
  3965				iter-trace-enable = <1>;
  3966				gpu-frame-base-optimize = <1>;
  3967	
  3968				pbha {
  3969					propagate-bits = /bits/ 8 <0xf>;
  3970				};
  3971			};
  3972	
  3973			gpufreq: gpufreq@48500000 {
  3974				compatible = "mediatek,gpufreq";
  3975				reg = <0 0x48500000 0 0x1000>,   /* MFG_TOP_CONFIG */
  3976				      <0 0x48600000 0 0x200000>, /* MFG_SMMU */
  3977				      <0 0x48800000 0 0x1000>,   /* MFG_VGPU_BUS_DBG_TRACKER */
  3978				      <0 0x4b190000 0 0x20000>,  /* MFG_GPUEB_BUS_DBG_TRACKER */
  3979				      <0 0x4b800000 0 0x10000>,  /* MFG_RPC */
  3980				      <0 0x4b810000 0 0x400>,    /* MFG_PLL */
  3981				      <0 0x4b810400 0 0x400>,    /* MFG_PLL_SC0 */
  3982				      <0 0x4b810800 0 0x400>,    /* MFG_PLL_SC1 */
  3983				      <0 0x4b840000 0 0x1000>,   /* MFG_HBVC */
  3984				      <0 0x4b860000 0 0x1000>,   /* MFG_VCORE_AO_CFG */
  3985				      <0 0x4b8b0000 0 0x1000>,   /* MFG_VCORE_DEVAPC */
  3986				      <0 0x4b900000 0 0x1000>,   /* MFG_VCORE_BUS_DBG_TRACKER */
  3987				      <0 0x0c000000 0 0x1000>,   /* MCUSYS_PAR_WRAP */
  3988				      <0 0x10000000 0 0x1000>,   /* CKSYS */
  3989				      <0 0x10404000 0 0x1000>,   /* NTH_EMICFG_AO_MEM */
  3990				      <0 0x10416000 0 0x1000>,   /* NTH_EMI_AO_DEBUG_CTRL */
  3991				      <0 0x10425000 0 0x1000>,   /* NTH_EMICFG */
  3992				      <0 0x10469000 0 0x1000>,   /* EMI */
  3993				      <0 0x10504000 0 0x1000>,   /* STH_EMICFG_AO_MEM */
  3994				      <0 0x10516000 0 0x1000>,   /* STH_EMI_AO_DEBUG_CTRL */
  3995				      <0 0x10525000 0 0x1000>,   /* STH_EMICFG */
  3996				      <0 0x10569000 0 0x1000>,   /* SUB_EMI */
  3997				      <0 0x10621000 0 0x1000>,   /* SEMI_MI32_SMI */
  3998				      <0 0x10622000 0 0x1000>,   /* NEMI_MI32_SMI */
  3999				      <0 0x10623000 0 0x1000>,   /* SEMI_MI33_SMI */
  4000				      <0 0x10624000 0 0x1000>,   /* NEMI_MI33_SMI */
  4001				      <0 0x10644000 0 0x1000>,   /* INFRA_AO_DEBUG_CTRL */
  4002				      <0 0x10645000 0 0x1000>,   /* EMI_INFRA_AO_BCRM */
  4003				      <0 0x10646000 0 0x1000>,   /* EMI_INFRA_AO_MEM */
  4004				      <0 0x10648000 0 0x1000>,   /* EMI_INFRA_CFG */
  4005				      <0 0x1c004000 0 0x10000>;  /* SLEEP */
  4006				reg-names = "mfg_top_config",
  4007					    "mfg_smmu",
  4008					    "mfg_vgpu_bus_trk",
  4009					    "mfg_gpueb_bus_trk",
  4010					    "mfg_rpc",
  4011					    "mfg_pll",
  4012					    "mfg_pll_sc0",
  4013					    "mfg_pll_sc1",
  4014					    "mfg_hbvc",
  4015					    "mfg_vcore_ao_cfg",
  4016					    "mfg_vcore_devapc",
  4017					    "mfg_vcore_bus_trk",
  4018					    "mcusys_par_wrap",
  4019					    "cksys",
  4020					    "nth_emicfg_ao_mem",
  4021					    "nth_emi_ao_debug_ctrl",
  4022					    "nth_emicfg",
  4023					    "emi",
  4024					    "sth_emicfg_ao_mem",
  4025					    "sth_emi_ao_debug_ctrl",
  4026					    "sth_emicfg",
  4027					    "sub_emi",
  4028					    "semi_mi32_smi",
  4029					    "nemi_mi32_smi",
  4030					    "semi_mi33_smi",
  4031					    "nemi_mi33_smi",
  4032					    "infra_ao_debug_ctrl",
  4033					    "emi_infra_ao_bcrm",
  4034					    "emi_infra_ao_mem",
  4035					    "emi_infra_cfg",
  4036					    "sleep";
  4037				gpufreq-wrapper-supply = <&gpufreq_wrapper>;
  4038			};
  4039	
  4040			gpupdma: gpupdma@48540000 {
  4041				compatible = "mediatek,gpupdma";
  4042				reg = <0 0x48540000 0 0x2000>,
  4043				      <0 0x4b800704 0 0x4>,
  4044				      <0 0x13f840 0 0x28>;
  4045				ringbuf-page-order = <3>;
  4046				config-mode = <1>;
  4047				hw-semaphore-bit = <1>;
  4048			};
  4049	
  4050			gpu_smmu: iommu@48600000 {
  4051				#iommu-cells = <1>;
  4052				compatible = "mediatek,mt8196-gpu-smmu", "arm,smmu-v3";
  4053				reg = <0 0x48600000 0 0x1e0000>;
  4054				interrupts = <GIC_SPI 616 IRQ_TYPE_LEVEL_HIGH 0>;
  4055				interrupt-names = "combined";
  4056				status = "disabled";
  4057			};
  4058	
  4059			gpueb: gpueb@4b000000 {
  4060				compatible = "mediatek,gpueb";
  4061				reg = <0 0x4b000000 0 0xa0000>,
  4062				      <0 0x4b09fd00 0 0x80>,
  4063				      <0 0x4b140100 0 0x200>,
  4064				      <0 0x4b120000 0 0x100>,
  4065				      <0 0x4b09fd80 0 0x280>,
  4066				      <0 0x4b170008 0 0x4>,  /* arbitrary addr to avoid error msg */
  4067				      <0 0x4b170004 0 0x4>,
  4068				      <0 0x4b170074 0 0x4>,
  4069				      <0 0x4b170000 0 0x4>,
  4070				      <0 0x4b170078 0 0x4>,
  4071				      <0 0x4b800504 0 0x4>;
  4072				reg-names = "gpueb_base",
  4073				            "gpueb_gpr_base",
  4074				            "gpueb_cfgreg_base",
  4075				            "gpueb_intc_base",
  4076				            "mbox0_base",
  4077				            "mbox0_init", /* dummy input for mtk_mbox_probe */
  4078				            "mbox0_set",
  4079				            "mbox0_clr",
  4080				            "mbox0_send",
  4081				            "mbox0_recv",
  4082				            "mfg0_pwr_con";
  4083				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>;
  4084				interrupt-names = "mbox0";
  4085	
  4086				gpueb-support;
  4087				ghpm-support;
  4088				mbox-count = <1>;
  4089				mbox-size = <160>; /* 160 slot * 4 = 640 byte */
  4090				slot-size = <4>;   /* 1 slot = 4 bytes */
  4091				ts-mbox = <0>; /* mbox for timersync */
  4092	
  4093				/* id, mbox, send_size */
  4094				send-table = <0 0 4>,
  4095					     <1 0 8>,
  4096					     <2 0 3>,
  4097					     <3 0 6>,
  4098					     <4 0 9>,
  4099					     <5 0 4>,
  4100					     <6 0 6>,
  4101					     <7 0 6>,
  4102					     <8 0 1>,
  4103					     <9 0 4>,
  4104					     <10 0 4>,
  4105					     <11 0 1>;
  4106				send-name-table = "IPI_ID_FAST_DVFS_EVENT",
  4107						  "IPI_ID_GPUFREQ",
  4108						  "IPI_ID_SLEEP",
  4109						  "IPI_ID_TIMER",
  4110						  "IPI_ID_FHCTL",
  4111						  "IPI_ID_CCF",
  4112						  "IPI_ID_GPUMPU",
  4113						  "IPI_ID_FAST_DVFS",
  4114						  "CH_IPIR_C_MET", /* = IPIS_C_MET on gpueb side */
  4115						  "CH_IPIS_C_MET", /* = IPIR_C_MET on gpueb side */
  4116						  "IPI_ID_BRISKET",
  4117						  "IPI_ID_PPB";
  4118	
  4119				/* id, mbox, recv_size, recv_opt, cb_ctx_opt */
  4120				recv-table = <0 0 4 0 0>,
  4121					     <1 0 8 1 1>,
  4122					     <2 0 1 0 1>,
  4123					     <3 0 1 0 1>,
  4124					     <4 0 1 1 1>,
  4125					     <5 0 4 1 1>,
  4126					     <6 0 1 1 1>,
  4127					     <7 0 6 1 1>,
  4128					     <8 0 4 0 1>,
  4129					     <9 0 1 1 1>,
  4130					     <10 0 4 1 1>,
  4131					     <11 0 1 1 1>;
  4132				recv-name-table = "IPI_ID_FAST_DVFS_EVENT",
  4133						  "IPI_ID_GPUFREQ",
  4134						  "IPI_ID_SLEEP",
  4135						  "IPI_ID_TIMER",
  4136						  "IPI_ID_FHCTL",
  4137						  "IPI_ID_CCF",
  4138						  "IPI_ID_GPUMPU",
  4139						  "IPI_ID_FAST_DVFS",
  4140						  "CH_IPIR_C_MET", /* = IPIS_C_MET on gpueb side */
  4141						  "CH_IPIS_C_MET", /* = IPIR_C_MET on gpueb side */
  4142						  "IPI_ID_BRISKET",
  4143						  "IPI_ID_PPB";
  4144	
  4145				gpueb-mem-table = <0 0x4000>,   /* 16KB */
  4146						  <1 0x180000>; /* 1.5MB */
  4147	
  4148				gpueb-mem-name-table = "MEM_ID_GPUFREQ", /* GPUFREQ */
  4149						       "MEM_ID_LOG";     /* LOGGER */
  4150			};
  4151	
  4152			mfgpll_pll_ctrl_clk: syscon@4b810000 {
  4153				/* TODO: Fix compatible in driver */
  4154				compatible = "mediatek,mt8196-mfgpll-pll-ctrl", "mediatek,mt8196-mfgpll_pll_ctrl", "syscon";
  4155				reg = <0 0x4b810000 0 0x400>;
  4156				#clock-cells = <1>;
  4157			};
  4158	
  4159			mfgpll_sc0_pll_ctrl_clk: syscon@4b810400 {
  4160				/* TODO: Fix compatible in driver */
  4161				compatible = "mediatek,mt8196-mfgpll-sc0-pll-ctrl", "mediatek,mt8196-mfgpll_sc0_pll_ctrl", "syscon";
  4162				reg = <0 0x4b810400 0 0x400>;
  4163				#clock-cells = <1>;
  4164			};
  4165	
  4166			ghpm: ghpm@4b800000 {
  4167				compatible = "mediatek,ghpm";
  4168				reg =
  4169					<0 0x4b800000 0 0x1000>,
  4170					<0 0x4b860000 0 0x1000>,
  4171					<0 0x4b860128 0 0x4>,
  4172					<0 0x1c004ea8 0 0x4>,
  4173					<0 0x1c000070 0 0x4>,
  4174					<0 0x1c000074 0 0x4>,
  4175					<0 0x1c000078 0 0x4>;
  4176				reg-names =
  4177					"mfg_rpc",
  4178					"mfg_vcore_ao_config",
  4179					"mfg_mt8196_e2_id_con",
  4180					"spm_mfg0_pwr_con",
  4181					"clk_cfg_6",
  4182					"clk_cfg_6_set",
  4183					"clk_cfg_6_clr";
  4184	
  4185				gpueb-supply = <&gpueb>;
  4186			};
  4187	
  4188			mfgpll_sc1_pll_ctrl_clk: syscon@4b810800 {
  4189				/* TODO: Fix compatible in driver */
  4190				compatible = "mediatek,mt8196-mfgpll-sc1-pll-ctrl", "mediatek,mt8196-mfgpll_sc1_pll_ctrl", "syscon";
  4191				reg = <0 0x4b810800 0 0x1000>;
  4192				#clock-cells = <1>;
  4193			};
  4194	
  4195			devapc_gpu: devapc@4b890000 {
  4196				compatible = "mediatek,mt8196-devapc";
  4197				reg = <0 0x4b890000 0 0x1000>;
  4198				vio-idx-num = <20>;
  4199				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
  4200			};
  4201	
  4202			devapc_gpu1: devapc@4b8b0000 {
  4203				compatible = "mediatek,mt8196-devapc";
  4204				reg = <0 0x4b8b0000 0 0x1000>;
  4205				vio-idx-num = <26>;
  4206				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
  4207			};
  4208	
  4209			apu_smmu: iommu@4c000000 {
  4210				compatible = "mediatek,mt8196-apu-smmu", "arm,smmu-v3";
  4211				reg = <0 0x4c000000 0 0x1e0000>;
  4212				interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING 0>;
  4213				interrupt-names = "combined";
  4214				#iommu-cells = <1>;
  4215			};
  4216	
  4217			sound: sound {
  4218				compatible = "mediatek,mt8196-mt6681-sound";
  4219				mediatek,platform = <&afe>;
  4220				/* audio-routing is added here as a placeholder to complete the
  4221				   probe flow.It should be removed when upstreaming */
  4222				audio-routing = "Headphone Jack", "HPOL",
  4223						"Headphone Jack", "HPOR";
  4224				status = "disabled";
  4225			};
  4226	
> 4227			thermal_zones: thermal-zones {
  4228				soc_max: soc_max {
  4229					polling-delay = <0>; /* milliseconds */
  4230					polling-delay-passive = <0>; /* milliseconds */
  4231					thermal-sensors = <&lvts 0>;
  4232	
  4233					trips {
  4234						soc_max_crit: so-max-crit {
  4235							temperature = <118800>;
  4236							hysteresis = <2000>;
  4237							type = "critical";
  4238						};
  4239					};
  4240				};
  4241	
  4242				cpu-6-0-thermal {
  4243					polling-delay = <0>; /* milliseconds */
  4244					polling-delay-passive = <0>; /* milliseconds */
  4245					thermal-sensors = <&lvts 1>;
  4246					trips {
  4247						cpu_medium_core6_0_crit: cpu-medium-core6-0-crit {
  4248							temperature = <118800>;
  4249							hysteresis = <2000>;
  4250							type = "critical";
  4251						};
  4252					};
  4253				};
  4254	
  4255				cpu-6-1-thermal {
  4256					polling-delay = <0>; /* milliseconds */
  4257					polling-delay-passive = <0>; /* milliseconds */
  4258					thermal-sensors = <&lvts 2>;
  4259					trips {
  4260						cpu_medium_core6_1_crit: cpu-medium-core6-1-crit {
  4261							temperature = <118800>;
  4262							hysteresis = <2000>;
  4263							type = "critical";
  4264						};
  4265					};
  4266				};
  4267	
  4268				cpu-dsu2-thermal {
  4269					polling-delay = <0>; /* milliseconds */
  4270					polling-delay-passive = <0>; /* milliseconds */
  4271					thermal-sensors = <&lvts 3>;
  4272					trips {
  4273						cpu_dsu2_crit: cpu-dsu2-crit {
  4274							temperature = <118800>;
  4275							hysteresis = <2000>;
  4276							type = "critical";
  4277						};
  4278					};
  4279				};
  4280	
  4281				cpu-dsu3-thermal {
  4282					polling-delay = <0>; /* milliseconds */
  4283					polling-delay-passive = <0>; /* milliseconds */
  4284					thermal-sensors = <&lvts 4>;
  4285					trips {
  4286						cpu_dsu3_crit: cpu-dsu3-crit {
  4287							temperature = <118800>;
  4288							hysteresis = <2000>;
  4289							type = "critical";
  4290						};
  4291					};
  4292				};
  4293	
  4294				cpu-3-thermal {
  4295					polling-delay = <0>; /* milliseconds */
  4296					polling-delay-passive = <0>; /* milliseconds */
  4297					thermal-sensors = <&lvts 5>;
  4298					trips {
  4299						cpu_little_core3_crit: cpu-little-core3-crit {
  4300							temperature = <118800>;
  4301							hysteresis = <2000>;
  4302							type = "critical";
  4303						};
  4304					};
  4305				};
  4306	
  4307				cpu-0-thermal {
  4308					polling-delay = <0>; /* milliseconds */
  4309					polling-delay-passive = <0>; /* milliseconds */
  4310					thermal-sensors = <&lvts 6>;
  4311					trips {
  4312						cpu_little_core0_crit: cpu-little-core0-crit {
  4313							temperature = <118800>;
  4314							hysteresis = <2000>;
  4315							type = "critical";
  4316						};
  4317					};
  4318				};
  4319	
  4320				cpu-1-thermal {
  4321					polling-delay = <0>; /* milliseconds */
  4322					polling-delay-passive = <0>; /* milliseconds */
  4323					thermal-sensors = <&lvts 7>;
  4324					trips {
  4325						cpu_little_core1_crit: cpu-little-core1-crit {
  4326							temperature = <118800>;
  4327							hysteresis = <2000>;
  4328							type = "critical";
  4329						};
  4330					};
  4331				};
  4332	
  4333				cpu-2-thermal {
  4334					polling-delay = <0>; /* milliseconds */
  4335					polling-delay-passive = <0>; /* milliseconds */
  4336					thermal-sensors = <&lvts 8>;
  4337					trips {
  4338						cpu_little_core2_crit: cpu-little-core2-crit {
  4339							temperature = <118800>;
  4340							hysteresis = <2000>;
  4341							type = "critical";
  4342						};
  4343					};
  4344				};
  4345	
  4346				cpu-4-0-thermal {
  4347					polling-delay = <0>; /* milliseconds */
  4348					polling-delay-passive = <0>; /* milliseconds */
  4349					thermal-sensors = <&lvts 9>;
  4350					trips {
  4351						cpu_medium_core4_0_crit: cpu-medium-core4-0-crit {
  4352							temperature = <118800>;
  4353							hysteresis = <2000>;
  4354							type = "critical";
  4355						};
  4356					};
  4357				};
  4358	
  4359				cpu-4-1-thermal {
  4360					polling-delay = <0>; /* milliseconds */
  4361					polling-delay-passive = <0>; /* milliseconds */
  4362					thermal-sensors = <&lvts 10>;
  4363					trips {
  4364						cpu_medium_core4_1_crit: cpu-medium-core4-1-crit {
  4365							temperature = <118800>;
  4366							hysteresis = <2000>;
  4367							type = "critical";
  4368						};
  4369					};
  4370				};
  4371	
  4372				cpu-5-0-thermal {
  4373					polling-delay = <0>; /* milliseconds */
  4374					polling-delay-passive = <0>; /* milliseconds */
  4375					thermal-sensors = <&lvts 11>;
  4376					trips {
  4377						cpu_medium_core5_0_crit: cpu-medium-core5-0-crit {
  4378							temperature = <118800>;
  4379							hysteresis = <2000>;
  4380							type = "critical";
  4381						};
  4382					};
  4383				};
  4384	
  4385				cpu-5-1-thermal {
  4386					polling-delay = <0>; /* milliseconds */
  4387					polling-delay-passive = <0>; /* milliseconds */
  4388					thermal-sensors = <&lvts 12>;
  4389					trips {
  4390						cpu_medium_core5_1_crit: cpu-medium-core5-1-crit {
  4391							temperature = <118800>;
  4392							hysteresis = <2000>;
  4393							type = "critical";
  4394						};
  4395					};
  4396				};
  4397	
  4398				cpu-dsu0-thermal {
  4399					polling-delay = <0>; /* milliseconds */
  4400					polling-delay-passive = <0>; /* milliseconds */
  4401					thermal-sensors = <&lvts 13>;
  4402					trips {
  4403						cpu_dsu0_crit: cpu-dsu0-crit {
  4404							temperature = <118800>;
  4405							hysteresis = <2000>;
  4406							type = "critical";
  4407						};
  4408					};
  4409				};
  4410	
  4411				cpu-dsu1-thermal {
  4412					polling-delay = <0>; /* milliseconds */
  4413					polling-delay-passive = <0>; /* milliseconds */
  4414					thermal-sensors = <&lvts 14>;
  4415					trips {
  4416						cpu_dsu1_crit: cpu-dsu1-crit {
  4417							temperature = <118800>;
  4418							hysteresis = <2000>;
  4419							type = "critical";
  4420						};
  4421					};
  4422				};
  4423	
  4424				cpu-7-0-thermal {
  4425					polling-delay = <0>; /* milliseconds */
  4426					polling-delay-passive = <0>; /* milliseconds */
  4427					thermal-sensors = <&lvts 15>;
  4428					trips {
  4429						cpu_big_core7_0_crit: cpu-big-core7-0-crit {
  4430							temperature = <118800>;
  4431							hysteresis = <2000>;
  4432							type = "critical";
  4433						};
  4434					};
  4435				};
  4436	
  4437				cpu-7-1-thermal {
  4438					polling-delay = <0>; /* milliseconds */
  4439					polling-delay-passive = <0>; /* milliseconds */
  4440					thermal-sensors = <&lvts 16>;
  4441					trips {
  4442						cpu_big_core7_1_crit: cpu-big-core7-1-crit {
  4443							temperature = <118800>;
  4444							hysteresis = <2000>;
  4445							type = "critical";
  4446						};
  4447					};
  4448				};
  4449	
  4450				apu-a0-thermal {
  4451					polling-delay = <0>; /* milliseconds */
  4452					polling-delay-passive = <0>; /* milliseconds */
  4453					thermal-sensors = <&lvts 17>;
  4454					trips {
  4455						apu_a0_crit: apu-a0-crit {
  4456							temperature = <118800>;
  4457							hysteresis = <2000>;
  4458							type = "critical";
  4459						};
  4460					};
  4461				};
  4462	
  4463				apu-a1-thermal {
  4464					polling-delay = <0>; /* milliseconds */
  4465					polling-delay-passive = <0>; /* milliseconds */
  4466					thermal-sensors = <&lvts 18>;
  4467					trips {
  4468						apu_a1_crit: apu-a1-crit {
  4469							temperature = <118800>;
  4470							hysteresis = <2000>;
  4471							type = "critical";
  4472						};
  4473					};
  4474				};
  4475	
  4476				apu-a2-thermal {
  4477					polling-delay = <0>; /* milliseconds */
  4478					polling-delay-passive = <0>; /* milliseconds */
  4479					thermal-sensors = <&lvts 19>;
  4480					trips {
  4481						apu_a2_crit: apu-a2-crit {
  4482							temperature = <118800>;
  4483							hysteresis = <2000>;
  4484							type = "critical";
  4485						};
  4486					};
  4487				};
  4488	
  4489				apu-a3-thermal {
  4490					polling-delay = <0>; /* milliseconds */
  4491					polling-delay-passive = <0>; /* milliseconds */
  4492					thermal-sensors = <&lvts 20>;
  4493					trips {
  4494						apu_a3_crit: apu-a3-crit {
  4495							temperature = <118800>;
  4496							hysteresis = <2000>;
  4497							type = "critical";
  4498						};
  4499					};
  4500				};
  4501	
  4502				gpu0-thermal {
  4503					polling-delay = <0>; /* milliseconds */
  4504					polling-delay-passive = <0>; /* milliseconds */
  4505					thermal-sensors = <&lvts 21>;
  4506					trips {
  4507						gpu0_crit: gpu0-crit {
  4508							temperature = <118800>;
  4509							hysteresis = <2000>;
  4510							type = "critical";
  4511						};
  4512					};
  4513				};
  4514	
  4515				gpu1-thermal {
  4516					polling-delay = <0>; /* milliseconds */
  4517					polling-delay-passive = <0>; /* milliseconds */
  4518					thermal-sensors = <&lvts 22>;
  4519					trips {
  4520						gpu1_crit: gpu1-crit {
  4521							temperature = <118800>;
  4522							hysteresis = <2000>;
  4523							type = "critical";
  4524						};
  4525					};
  4526				};
  4527	
  4528				soc-top0-thermal {
  4529					polling-delay = <0>; /* milliseconds */
  4530					polling-delay-passive = <0>; /* milliseconds */
  4531					thermal-sensors = <&lvts 23>;
  4532					trips {
  4533						soc_top0_crit: soc-top0-crit {
  4534							temperature = <118800>;
  4535							hysteresis = <2000>;
  4536							type = "critical";
  4537						};
  4538					};
  4539				};
  4540	
  4541				soc-top1-thermal {
  4542					polling-delay = <0>; /* milliseconds */
  4543					polling-delay-passive = <0>; /* milliseconds */
  4544					thermal-sensors = <&lvts 24>;
  4545					trips {
  4546						soc_top1_crit: soc-top1-crit {
  4547							temperature = <118800>;
  4548							hysteresis = <2000>;
  4549							type = "critical";
  4550						};
  4551					};
  4552				};
  4553	
  4554				soc-top2-thermal {
  4555					polling-delay = <0>; /* milliseconds */
  4556					polling-delay-passive = <0>; /* milliseconds */
  4557					thermal-sensors = <&lvts 25>;
  4558					trips {
  4559						soc_top2_crit: soc-top2-crit {
  4560							temperature = <118800>;
  4561							hysteresis = <2000>;
  4562							type = "critical";
  4563						};
  4564					};
  4565				};
  4566	
  4567				soc-top3-thermal {
  4568					polling-delay = <0>; /* milliseconds */
  4569					polling-delay-passive = <0>; /* milliseconds */
  4570					thermal-sensors = <&lvts 26>;
  4571					trips {
  4572						soc_top3_crit: soc-top3-crit {
  4573							temperature = <118800>;
  4574							hysteresis = <2000>;
  4575							type = "critical";
  4576						};
  4577					};
  4578				};
  4579	
  4580				soc-bot0-thermal {
  4581					polling-delay = <0>; /* milliseconds */
  4582					polling-delay-passive = <0>; /* milliseconds */
  4583					thermal-sensors = <&lvts 27>;
  4584					trips {
  4585						soc_bot0_crit: soc-bot0-crit {
  4586							temperature = <118800>;
  4587							hysteresis = <2000>;
  4588							type = "critical";
  4589						};
  4590					};
  4591				};
  4592	
  4593				soc-bot1-thermal {
  4594					polling-delay = <0>; /* milliseconds */
  4595					polling-delay-passive = <0>; /* milliseconds */
  4596					thermal-sensors = <&lvts 28>;
  4597					trips {
  4598						soc_bot1_crit: soc-bot1-crit {
  4599							temperature = <118800>;
  4600							hysteresis = <2000>;
  4601							type = "critical";
  4602						};
  4603					};
  4604				};
  4605	
  4606				soc-bot2-thermal {
  4607					polling-delay = <0>; /* milliseconds */
  4608					polling-delay-passive = <0>; /* milliseconds */
  4609					thermal-sensors = <&lvts 29>;
  4610					trips {
  4611						soc_bot2_crit: soc-bot2-crit {
  4612							temperature = <118800>;
  4613							hysteresis = <2000>;
  4614							type = "critical";
  4615						};
  4616					};
  4617				};
  4618	
  4619				soc-bot3-thermal {
  4620					polling-delay = <0>; /* milliseconds */
  4621					polling-delay-passive = <0>; /* milliseconds */
  4622					thermal-sensors = <&lvts 30>;
  4623					trips {
  4624						soc_bot3_crit: soc-bot3-crit {
  4625							temperature = <118800>;
  4626							hysteresis = <2000>;
  4627							type = "critical";
  4628						};
  4629					};
  4630				};
  4631			};
  4632		};
  4633	};
  4634	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
