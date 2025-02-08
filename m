Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB391B0434
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739021826; cv=none; b=Z1IwU/q4Qo2la1xT9dX4690gKH9dmHbX30vZrYvqM3IWADolArQItpq6SjBRbR4ypicjvVTZ0Wbhv88sZJpLOqsHyuu3wMqfVSDTQMeD6tzxOwugK9fcv0AVTLF3XEzlcYY1JSSP3jur5wzxyTgwWSXwxgK5qfOi0gT28bgRwoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739021826; c=relaxed/simple;
	bh=330FV4EZbld+6530UvDt+yXyxlFhmhfPW26pOoKG+Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fYaL7Tx62pbidRCvtSy8GHx6IIo2ngxR7JfywCoFVxCpImBVkox0bOr0DnnQWOeQoY48U202M0nlVyL9UQ47ivqTXLtOBFlCLr6R/ixoaM1C6Y6XT3sN3M1czVmS+qiWa7uLDzn9GFHYZVkwkNkkcTuSq/q2GfV4zeGSy++buDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2IWdP6p; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2IWdP6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739021820; x=1770557820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=330FV4EZbld+6530UvDt+yXyxlFhmhfPW26pOoKG+Qc=;
  b=a2IWdP6pyR/3bd9SfKTXbw7hU1oeNdxqIvM+6pCahnpXN8vP49GD0010
   Kt7KvlH5YIyK4DBHToccEeQhXiGeIxvUvBVPMZdZw+dEKlrDoAHTckHdH
   N/u+BBgFI4Obpu7BvycQpELWE8V0RtJHlgmy0KysGuVHoSLV2rIDr0z+a
   ZY42xhctF5wbDcjMc62HFPYdT222QDVIdViUMxsK21p1f/cWPAsAuNes5
   234f6u5uW6SegMJFx4+AkFFM839uXyhKcrKiZxHSp72BSd2CSI8xS8yJl
   shnt8VpmMuFGO5GyMtTnQ9W+SNU+7lAFapvqnQIjNff2KqE1I6c6lnsjy
   Q==;
X-CSE-ConnectionGUID: 6C8e7eQWSFeOafkx9i2U3w==
X-CSE-MsgGUID: /mbxPZnaSJSNoodArCpbXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="49893840"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="49893840"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 05:36:59 -0800
X-CSE-ConnectionGUID: +p11WBCDTWmInXTLpnrLKw==
X-CSE-MsgGUID: wetKrcoGRd2IlaeuDKogHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="142641588"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Feb 2025 05:36:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgl0x-001001-11;
	Sat, 08 Feb 2025 13:36:55 +0000
Date: Sat, 8 Feb 2025 21:36:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 211/211]
 arch/arm64/boot/dts/mediatek/mt8196.dtsi:4389.16-4414.5: Warning
 (simple_bus_reg): /soc/jpeg-decoder: missing or empty reg/ranges property
Message-ID: <202502082103.IqRgauh0-lkp@intel.com>
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
commit: e818ec0bd11a22b46209da46ccd1a11941177a90 [211/211] CHROMIUM: arm64: dts: mt8196: add jpegdec and jpegenc nodes
config: arm64-randconfig-003-20250207 (https://download.01.org/0day-ci/archive/20250208/202502082103.IqRgauh0-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082103.IqRgauh0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082103.IqRgauh0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt6373.dtsi:72.40-74.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/second_pmic@5/mt6373-efuse/mt6373_e_data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:8.25-76.4: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:65.21-67.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/fg_init: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:68.19-70.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/fg_soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6685.dtsi:71.21-74.6: Warning (unit_address_vs_reg): /soc/spmi@1c01a000/mt6685_mfd/mt6685_rtc/ext_32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2861.10-2865.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2867.14-2871.6: Warning (unit_address_vs_reg): /soc/vcp@31800000/vcp@31000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:45.27-52.4: Warning (unit_address_vs_reg): /regulator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2572.35-2578.5: Warning (simple_bus_reg): /soc/mailbox@1a350000: simple-bus unit address format error, expected "1a350100"
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2580.35-2586.5: Warning (simple_bus_reg): /soc/mailbox@1a360000: simple-bus unit address format error, expected "1a360100"
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:4389.16-4414.5: Warning (simple_bus_reg): /soc/jpeg-decoder: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:4416.16-4442.5: Warning (simple_bus_reg): /soc/jpeg-encoder: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4444.16-4452.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4454.32-4858.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1138.37-1163.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:58.8-68.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-evb.dts:74.8-84.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +4389 arch/arm64/boot/dts/mediatek/mt8196.dtsi

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
  1263			devapc_apinfra_emi: devapc@10613000 {
  1264				compatible = "mediatek,mt8196-devapc";
  1265				reg = <0 0x10613000 0 0x1000>;
  1266				vio-idx-num = <149>;
  1267				interrupts = <GIC_SPI 869 IRQ_TYPE_LEVEL_HIGH 0>;
  1268			};
  1269	
  1270			devapc_apinfra_big4: devapc@10693000 {
  1271				compatible = "mediatek,mt8196-devapc";
  1272				reg = <0 0x10693000 0 0x1000>;
  1273				vio-idx-num = <89>;
  1274				interrupts = <GIC_SPI 863 IRQ_TYPE_LEVEL_HIGH 0>;
  1275			};
  1276	
  1277			i2c5: i2c@120a0000 {
  1278				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1279				reg = <0 0x120a0000 0 0x20000>,
  1280				      <0 0x16400000 0 0x10000>;
  1281				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
  1282				clocks = <&imp_iic_wrap_e_clk CLK_IMPE_I2C5_I2C>,
  1283					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1284				clock-names = "main", "dma";
  1285				clock-div = <1>;
  1286				#address-cells = <1>;
  1287				#size-cells = <0>;
  1288	
  1289				status = "disabled";
  1290			};
  1291	
  1292			imp_iic_wrap_e_clk: syscon@120c0000 {
  1293				/* TODO: Fix compatible in driver */
  1294				compatible = "mediatek,mt8196-imp-iic-wrap-e", "mediatek,mt8196-imp_iic_wrap_e", "syscon";
  1295				reg = <0 0x120c0000 0 0x1000>;
  1296				#clock-cells = <1>;
  1297			};
  1298	
  1299			mipi_tx_config0: mipi-tx-config@130b0000 {
  1300				compatible = "mediatek,mt8196-mipi-tx";
  1301				reg = <0 0x130b0000 0 0x1000>;
  1302				clocks = <&clk26m>;
  1303				#clock-cells = <0>;
  1304				#phy-cells = <0>;
  1305				clock-output-names = "mipi_tx0_pll";
  1306			};
  1307	
  1308			i2c0: i2c@13130000 {
  1309				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1310				reg = <0 0x13130000 0 0x20000>,
  1311				      <0 0x16370000 0 0x10000>;
  1312				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
  1313				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C0_I2C>,
  1314					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1315				clock-names = "main", "dma";
  1316				clock-div = <1>;
  1317				#address-cells = <1>;
  1318				#size-cells = <0>;
  1319	
  1320				status = "disabled";
  1321			};
  1322	
  1323			i2c3: i2c@13150000 {
  1324				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1325				reg = <0 0x13150000 0 0x20000>,
  1326				      <0 0x163c0000 0 0x10000>;
  1327				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH 0>;
  1328				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C3_I2C>,
  1329					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1330				clock-names = "main", "dma";
  1331				clock-div = <1>;
  1332				#address-cells = <1>;
  1333				#size-cells = <0>;
  1334	
  1335				status = "disabled";
  1336			};
  1337	
  1338			i2c6: i2c@13170000 {
  1339				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1340				reg = <0 0x13170000 0 0x20000>,
  1341				      <0 0x16410000 0 0x10000>;
  1342				interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
  1343				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C6_I2C>,
  1344					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1345				clock-names = "main", "dma";
  1346				clock-div = <1>;
  1347				#address-cells = <1>;
  1348				#size-cells = <0>;
  1349	
  1350				status = "disabled";
  1351			};
  1352	
  1353			i2c10: i2c@13190000 {
  1354				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1355				reg = <0 0x13190000 0 0x20000>,
  1356				      <0 0x164b0000 0 0x10000>;
  1357				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
  1358				clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C10_I2C>,
  1359					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1360				clock-names = "main", "dma";
  1361				clock-div = <1>;
  1362				#address-cells = <1>;
  1363				#size-cells = <0>;
  1364	
  1365				status = "disabled";
  1366			};
  1367	
  1368			imp_iic_wrap_w_clk: syscon@131b0000 {
  1369				/* TODO: Fix compatible in driver */
  1370				compatible = "mediatek,mt8196-imp-iic-wrap-w", "mediatek,mt8196-imp_iic_wrap_w", "syscon";
  1371				reg = <0 0x131b0000 0 0x1000>;
  1372				#clock-cells = <1>;
  1373			};
  1374	
  1375			efuse: efuse@13260000 {
  1376				compatible = "mediatek,mt8196-efuse", "mediatek,efuse";
  1377				reg = <0 0x13260000 0 0x1000>;
  1378				#address-cells = <1>;
  1379				#size-cells = <1>;
  1380	
  1381				lvts_e_data1: data1@334 {
  1382					reg = <0x334 0xc>;
  1383				};
  1384	
  1385				lvts_e_data2: data2@340 {
  1386					reg = <0x340 0x14>;
  1387				};
  1388	
  1389				lvts_e_data3: data3@354 {
  1390					reg = <0x354 0x20>;
  1391				};
  1392	
  1393				lvts_e_data4: data4@388 {
  1394					reg = <0x388 0x20>;
  1395				};
  1396	
  1397				socinfo-data1@40 {
  1398					reg = <0x40 0x4>;
  1399				};
  1400	
  1401				socinfo-data2@4c {
  1402					reg = <0x4c 0x4>;
  1403				};
  1404			};
  1405	
  1406			i2c1: i2c@13930000 {
  1407				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1408				reg = <0 0x13930000 0 0x80000>,
  1409				      <0 0x16380000 0 0x10000>;
  1410				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH 0>;
  1411				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C1_I2C>,
  1412					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1413				clock-names = "main", "dma";
  1414				clock-div = <1>;
  1415				#address-cells = <1>;
  1416				#size-cells = <0>;
  1417	
  1418				status = "disabled";
  1419			};
  1420	
  1421			i2c2: i2c@139b0000 {
  1422				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1423				reg = <0 0x139b0000 0 0x80000>,
  1424				      <0 0x16390000 0 0x30000>;
  1425				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH 0>;
  1426				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C2_I2C>,
  1427					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1428				clock-names = "main", "dma";
  1429				clock-div = <1>;
  1430				#address-cells = <1>;
  1431				#size-cells = <0>;
  1432	
  1433				status = "disabled";
  1434			};
  1435	
  1436			i2c4: i2c@13a30000 {
  1437				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1438				reg = <0 0x13a30000 0 0x80000>,
  1439				      <0 0x163d0000 0 0x30000>;
  1440				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
  1441				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C4_I2C>,
  1442					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1443				clock-names = "main", "dma";
  1444				clock-div = <1>;
  1445				#address-cells = <1>;
  1446				#size-cells = <0>;
  1447	
  1448				status = "disabled";
  1449			};
  1450	
  1451			i2c7: i2c@13ab0000 {
  1452				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1453				reg = <0 0x13ab0000 0 0x80000>,
  1454				      <0 0x16420000 0 0x30000>;
  1455				interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
  1456				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C7_I2C>,
  1457					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1458				clock-names = "main", "dma";
  1459				clock-div = <1>;
  1460				#address-cells = <1>;
  1461				#size-cells = <0>;
  1462	
  1463				status = "disabled";
  1464			};
  1465	
  1466			i2c8: i2c@13b30000 {
  1467				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1468				reg = <0 0x13b30000 0 0x80000>,
  1469				      <0 0x16450000 0 0x30000>;
  1470				interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH 0>;
  1471				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C8_I2C>,
  1472					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1473				clock-names = "main", "dma";
  1474				clock-div = <1>;
  1475				#address-cells = <1>;
  1476				#size-cells = <0>;
  1477	
  1478				status = "disabled";
  1479			};
  1480	
  1481			i2c9: i2c@13bb0000 {
  1482				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1483				reg = <0 0x13bb0000 0 0x80000>,
  1484				      <0 0x16480000 0 0x30000>;
  1485				interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH 0>;
  1486				clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C9_I2C>,
  1487					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1488				clock-names = "main", "dma";
  1489				clock-div = <1>;
  1490				#address-cells = <1>;
  1491				#size-cells = <0>;
  1492	
  1493				status = "disabled";
  1494			};
  1495	
  1496			imp_iic_wrap_n_clk: syscon@13c30000 {
  1497				/* TODO: Fix compatible in driver */
  1498				compatible = "mediatek,mt8196-imp-iic-wrap-n", "mediatek,mt8196-imp_iic_wrap_n", "syscon";
  1499				reg = <0 0x13c30000 0 0x1000>;
  1500				hw-voter-regmap = <&hwv>;
  1501				#clock-cells = <1>;
  1502			};
  1503	
  1504			devapc_apinfra_io_intf: devapc@140a0000 {
  1505				compatible = "mediatek,mt8196-devapc";
  1506				reg = <0 0x140a0000 0 0x1000>;
  1507				vio-idx-num = <8>;
  1508				interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH 0>;
  1509			};
  1510	
  1511			devapc_apinfra_mem_intf: devapc@140c0000 {
  1512				compatible = "mediatek,mt8196-devapc";
  1513				reg = <0 0x140c0000 0 0x1000>;
  1514				vio-idx-num = <7>;
  1515				interrupts = <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH 0>;
  1516			};
  1517	
  1518			devapc_apinfra_slb: devapc@140e0000 {
  1519				compatible = "mediatek,mt8196-devapc";
  1520				reg = <0 0x140e0000 0 0x1000>;
  1521				vio-idx-num = <14>;
  1522				interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH 0>;
  1523			};
  1524	
  1525			apifrbus_ao_mem_reg_clk: syscon@14126000 {
  1526				/* TODO: Fix compatible in driver */
  1527				compatible = "mediatek,mt8196-apifrbus-ao-mem-reg", "mediatek,mt8196-apifrbus_ao_mem_reg", "syscon";
  1528				reg = <0 0x14126000 0 0x1000>;
  1529				#clock-cells = <1>;
  1530			};
  1531	
  1532			devapc_apinfra_mem: devapc@14130000 {
  1533				compatible = "mediatek,mt8196-devapc";
  1534				reg = <0 0x14130000 0 0x1000>;
  1535				vio-idx-num = <13>;
  1536				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH 0>;
  1537			};
  1538	
  1539			devapc_apinfra_mem_ctrl: devapc@14131000 {
  1540				compatible = "mediatek,mt8196-devapc";
  1541				reg = <0 0x14131000 0 0x1000>;
  1542				vio-idx-num = <23>;
  1543				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH 0>;
  1544			};
  1545	
  1546			infracfg@14136000 {
  1547				compatible = "mediatek,infracfg";
  1548				reg = <0 0x14136000 0 0x1000>;
  1549			};
  1550	
  1551			devapc_apinfra_int: devapc@142f4000 {
  1552				compatible = "mediatek,mt8196-devapc";
  1553				reg = <0 0x142f4000 0 0x1000>;
  1554				vio-idx-num = <26>;
  1555				interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH 0>;
  1556			};
  1557	
  1558			devapc_apinfra_io_ctrl: devapc@14400000 {
  1559				compatible = "mediatek,mt8196-devapc";
  1560				reg = <0 0x14400000 0 0x1000>;
  1561				vio-idx-num = <10>;
  1562				interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH 0>;
  1563			};
  1564	
  1565			devapc_apinfra_io: devapc@14401000 {
  1566				compatible = "mediatek,mt8196-devapc";
  1567				reg = <0 0x14401000 0 0x1000>;
  1568				vio-idx-num = <230>;
  1569				interrupts = <GIC_SPI 867 IRQ_TYPE_LEVEL_HIGH 0>;
  1570			};
  1571	
  1572			lvts: thermal-sensor@14414000 {
  1573				compatible = "mediatek,mt8196-lvts";
  1574				reg = <0 0x14414000 0 0x1000>,
  1575					<0 0x0c230000 0 0x1000>,
  1576					<0 0x19004000 0 0x1000>,
  1577					<0 0x4b400000 0 0x1000>;
  1578				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>,
  1579						<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
  1580						<GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH 0>,
  1581						<GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH 0>;
  1582				#thermal-sensor-cells = <1>;
  1583				nvmem-cells = <&lvts_e_data1 &lvts_e_data2 &lvts_e_data3
  1584						&lvts_e_data4>;
  1585				nvmem-cell-names = "e_data1","e_data2","e_data3","e_data4";
  1586			};
  1587	
  1588			hwv: syscon@14500000 {
  1589				compatible = "mediatek,mt8196-hwv", "syscon";
  1590				reg = <0 0x14500000 0 0x3000>;
  1591			};
  1592	
  1593			devapc_apinfra_mmu: devapc@14800000 {
  1594				compatible = "mediatek,mt8196-devapc";
  1595				reg = <0 0x14800000 0 0x1000>;
  1596				vio-idx-num = <20>;
  1597				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH 0>;
  1598			};
  1599	
  1600			uart0: serial@16000000 {
  1601				compatible = "mediatek,mt6577-uart";
  1602				reg = <0 0x16000000 0 0x1000>;
  1603				interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH 0>;
  1604				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART0_BCLK_UART>;
  1605				clock-names = "baud", "bus";
  1606	
  1607				status = "disabled";
  1608			};
  1609	
  1610			uart1: serial@16010000 {
  1611				compatible = "mediatek,mt6577-uart";
  1612				reg = <0 0x16010000 0 0x1000>;
  1613				interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH 0>;
  1614				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART1_BCLK_UART>;
  1615				clock-names = "baud", "bus";
  1616	
  1617				status = "disabled";
  1618			};
  1619	
  1620			uart2: serial@16020000 {
  1621				compatible = "mediatek,mt6577-uart";
  1622				reg = <0 0x16020000 0 0x1000>;
  1623				interrupts = <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH 0>;
  1624				clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART2_BCLK_UART>;
  1625				clock-names = "baud", "bus";
  1626	
  1627				status = "disabled";
  1628			};
  1629	
  1630			uart3: serial@16030000 {
  1631				compatible = "mediatek,mt6985-uart";
  1632				reg = <0 0x16030000 0 0x1000>;
  1633				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH 0>,
  1634					     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH 0>;    /* uart3 wakeup irq */
  1635				clocks = <&clk104m>, <&pericfg_ao_clk CLK_PERAO_UART3_BCLK_UART>;
  1636				clock-names = "baud", "bus";
  1637	
  1638				status = "disabled";
  1639			};
  1640	
  1641			disp_pwm0: disp-pwm0@160b0000 {
  1642				compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
  1643				reg = <0 0x160b0000 0 0x1000>;
  1644				interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
  1645				#pwm-cells = <2>;
  1646				clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
  1647				clock-names = "main";
  1648				status = "disabled";
  1649			};
  1650	
  1651			disp_pwm1: disp-pwm1@160c0000 {
  1652				compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
  1653				reg = <0 0x160c0000 0 0x1000>;
  1654				#pwm-cells = <2>;
  1655				clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
  1656				clock-names = "main";
  1657				status = "disabled";
  1658			};
  1659	
  1660			spi0: spi@16110000 {
  1661				compatible = "mediatek,mt8196-spi";
  1662				reg = <0 0x16110000 0 0x100>;
  1663				interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
  1664				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1665					<&cksys_clk CLK_CK_SPI0_BCLK_SEL>,
  1666					<&pericfg_ao_clk CLK_PERAO_SPI0_BCLK_SPI>;
  1667				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1668				#address-cells = <1>;
  1669				#size-cells = <0>;
  1670				mediatek,pad-select = <0>;
  1671	
  1672				status = "disabled";
  1673			};
  1674	
  1675			spi1: spi@16130000 {
  1676				compatible = "mediatek,mt8196-spi";
  1677				reg = <0 0x16130000 0 0x100>;
  1678				interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
  1679				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1680					<&cksys_clk CLK_CK_SPI1_BCLK_SEL>,
  1681					<&pericfg_ao_clk CLK_PERAO_SPI1_BCLK_SPI>;
  1682				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1683				#address-cells = <1>;
  1684				#size-cells = <0>;
  1685				mediatek,pad-select = <0>;
  1686	
  1687				status = "disabled";
  1688			};
  1689	
  1690			spi2: spi@16150000 {
  1691				compatible = "mediatek,mt8196-spi";
  1692				reg = <0 0x16150000 0 0x100>;
  1693				interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
  1694				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1695					<&cksys_clk CLK_CK_SPI2_BCLK_SEL>,
  1696					<&pericfg_ao_clk CLK_PERAO_SPI2_BCLK_SPI>;
  1697				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1698				#address-cells = <1>;
  1699				#size-cells = <0>;
  1700				mediatek,pad-select = <0>;
  1701	
  1702				status = "disabled";
  1703			};
  1704	
  1705			spi3: spi@16170000 {
  1706				compatible = "mediatek,mt8196-spi";
  1707				reg = <0 0x16170000 0 0x100>;
  1708				interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
  1709				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1710					<&cksys_clk CLK_CK_SPI3_BCLK_SEL>,
  1711					<&pericfg_ao_clk CLK_PERAO_SPI3_BCLK_SPI>;
  1712				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1713				#address-cells = <1>;
  1714				#size-cells = <0>;
  1715				mediatek,pad-select = <0>;
  1716	
  1717				status = "disabled";
  1718			};
  1719	
  1720			spi4: spi@16190000 {
  1721				compatible = "mediatek,mt8196-spi";
  1722				reg = <0 0x16190000 0 0x100>;
  1723				interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
  1724				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1725					<&cksys_clk CLK_CK_SPI4_BCLK_SEL>,
  1726					<&pericfg_ao_clk CLK_PERAO_SPI4_BCLK_SPI>;
  1727				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1728				#address-cells = <1>;
  1729				#size-cells = <0>;
  1730				mediatek,pad-select = <0>;
  1731	
  1732				status = "disabled";
  1733			};
  1734	
  1735			spi5: spi@161b0000 {
  1736				compatible = "mediatek,mt8196-spi";
  1737				reg = <0 0x161b0000 0 0x100>;
  1738				interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>;
  1739				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1740					<&cksys_clk CLK_CK_SPI5_BCLK_SEL>,
  1741					<&pericfg_ao_clk CLK_PERAO_SPI5_BCLK_SPI>;
  1742				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1743				#address-cells = <1>;
  1744				#size-cells = <0>;
  1745				mediatek,pad-select = <0>;
  1746	
  1747				status = "disabled";
  1748			};
  1749	
  1750			spi6: spi@161d0000 {
  1751				compatible = "mediatek,mt8196-spi";
  1752				reg = <0 0x161d0000 0 0x100>;
  1753				interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
  1754				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1755					<&cksys_clk CLK_CK_SPI6_BCLK_SEL>,
  1756					<&pericfg_ao_clk CLK_PERAO_SPI6_BCLK_SPI>;
  1757				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1758				#address-cells = <1>;
  1759				#size-cells = <0>;
  1760				mediatek,pad-select = <1>;
  1761	
  1762				status = "disabled";
  1763			};
  1764	
  1765			spi7: spi@161f0000 {
  1766				compatible = "mediatek,mt8196-spi";
  1767				reg = <0 0x161f0000 0 0x100>;
  1768				interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH 0>;
  1769				clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
  1770					<&cksys_clk CLK_CK_SPI7_BCLK_SEL>,
  1771					<&pericfg_ao_clk CLK_PERAO_SPI7_BCLK_SPI>;
  1772				clock-names = "parent-clk", "sel-clk", "spi-clk";
  1773				#address-cells = <1>;
  1774				#size-cells = <0>;
  1775				mediatek,pad-select = <0>;
  1776	
  1777				status = "disabled";
  1778			};
  1779	
  1780			i2c11: i2c@16200000 {
  1781				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1782				reg = <0 0x16200000 0 0x40000>,
  1783				      <0 0x164c0000 0 0x10000>;
  1784				interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH 0>;
  1785				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C11_I2C>,
  1786					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1787				clock-names = "main", "dma";
  1788				clock-div = <1>;
  1789				#address-cells = <1>;
  1790				#size-cells = <0>;
  1791	
  1792				status = "disabled";
  1793			};
  1794	
  1795			i2c12: i2c@16240000 {
  1796				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1797				reg = <0 0x16240000 0 0x40000>,
  1798				      <0 0x164d0000 0 0x20000>;
  1799				interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH 0>;
  1800				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C12_I2C>,
  1801					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1802				clock-names = "main", "dma";
  1803				clock-div = <1>;
  1804				#address-cells = <1>;
  1805				#size-cells = <0>;
  1806	
  1807				status = "disabled";
  1808			};
  1809	
  1810			i2c13: i2c@16280000 {
  1811				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1812				reg = <0 0x16280000 0 0x40000>,
  1813				      <0 0x164f0000 0 0x10000>;
  1814				interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
  1815				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C13_I2C>,
  1816					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1817				clock-names = "main", "dma";
  1818				clock-div = <1>;
  1819				#address-cells = <1>;
  1820				#size-cells = <0>;
  1821	
  1822				status = "disabled";
  1823			};
  1824	
  1825			i2c14: i2c@162c0000 {
  1826				compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
  1827				reg = <0 0x162c0000 0 0x40000>,
  1828				      <0 0x16500000 0 0x10000>;
  1829				interrupts = <GIC_SPI 900 IRQ_TYPE_LEVEL_HIGH 0>;
  1830				clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C14_I2C>,
  1831					 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
  1832				clock-names = "main", "dma";
  1833				clock-div = <1>;
  1834				#address-cells = <1>;
  1835				#size-cells = <0>;
  1836	
  1837				status = "disabled";
  1838			};
  1839	
  1840			imp_iic_wrap_c_clk: syscon@16300000 {
  1841				/* TODO: Fix compatible in driver */
  1842				compatible = "mediatek,mt8196-imp-iic-wrap-c", "mediatek,mt8196-imp_iic_wrap_c", "syscon";
  1843				reg = <0 0x16300000 0 0x1000>;
  1844				#clock-cells = <1>;
  1845			};
  1846	
  1847			mmc1: mmc@16310000 {
  1848				compatible = "mediatek,mt8196-mmc";
  1849				reg = <0 0x16310000 0 0x1000>,
  1850				      <0 0x12a10000 0 0x1000>;
  1851				interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH 0>;
  1852				clocks = <&cksys_clk CLK_CK_MSDC30_1_SEL>,
  1853						<&pericfg_ao_clk CLK_PERAO_MSDC1_AXI_MSDC1>,
  1854						<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_MSDC1>,
  1855						<&pericfg_ao_clk CLK_PERAO_MSDC1_MSDC_SRC_MSDC1>,
  1856						<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_WRAP_MSDC1>;
  1857				clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
  1858	
  1859				status = "disabled";
  1860			};
  1861	
  1862			mmc2: mmc@16320000 {
  1863				compatible = "mediatek,mt8196-mmc";
  1864				reg = <0 0x16320000 0 0x1000>,
  1865				      <0 0x138a0000 0 0x1000>;
  1866				interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>;
  1867				clocks = <&cksys_clk CLK_CK_MSDC30_2_SEL>,
  1868						<&pericfg_ao_clk CLK_PERAO_MSDC2_AXI_MSDC2>,
  1869						<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_MSDC2>,
  1870						<&pericfg_ao_clk CLK_PERAO_MSDC2_MSDC_SRC_MSDC2>,
  1871						<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_WRAP_MSDC2>;
  1872				clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
  1873	
  1874				status = "disabled";
  1875			};
  1876	
  1877			pwm: pwm@16330000 {
  1878				compatible = "mediatek,pwm";
  1879				reg = <0 0x16330000 0 0x1000>;
  1880				interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH 0>;
  1881	
  1882				status = "disabled";
  1883			};
  1884	
  1885			nor_flash: spi@16340000 {
  1886				compatible = "mediatek,mt8196-nor",
  1887					     "mediatek,mt8186-nor";
  1888				reg = <0 0x16340000 0 0x1000>;
  1889				clocks = <&cksys_clk CLK_CK_SFLASH_SEL>,
  1890					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_FLASH_FLASHIF>,
  1891					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_DRAM_FLASHIF>,
  1892					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_AXI_FLASHIF>,
  1893					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_BCLK_FLASHIF>,
  1894					 <&pericfg_ao_clk CLK_PERAO_FLASHIF_27M_FLASHIF>;
  1895				clock-names = "spi", "sf", "axi", "axi_s", "bclk", "27m";
  1896				assigned-clocks = <&cksys_clk CLK_CK_SFLASH_SEL>;
  1897				assigned-clock-parents = <&cksys_clk CLK_CK_UNIVPLL_D6_D8>;
  1898				interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>;
  1899				#address-cells = <1>;
  1900				#size-cells = <0>;
  1901				status = "disabled";
  1902			};
  1903	
  1904			pericfg_ao_clk: syscon@16640000 {
  1905				/* TODO: Fix compatible in driver */
  1906				compatible = "mediatek,mt8196-pericfg-ao", "mediatek,mt8196-pericfg_ao", "syscon";
  1907				reg = <0 0x16640000 0 0x1000>;
  1908				hw-voter-regmap = <&hwv>;
  1909				#clock-cells = <1>;
  1910			};
  1911	
  1912			devapc_peri: devapc@16670000 {
  1913				compatible = "mediatek,mt8196-devapc";
  1914				reg = <0 0x16670000 0 0x1000>;
  1915				vio-idx-num = <204>;
  1916				interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
  1917			};
  1918	
  1919			xhci0: usb@16700000 {
  1920				compatible = "mediatek,mtk-xhci";
  1921				reg = <0 0x16700000 0 0x1000>,
  1922				      <0 0x16703e00 0 0x0100>;
  1923				reg-names = "mac", "ippc";
  1924				interrupts-extended = <&gic GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH 0>,
  1925						      <&pio 273 IRQ_TYPE_LEVEL_LOW>;
  1926				interrupt-names = "host","wakeup";
  1927				phys = <&u2port0 PHY_TYPE_USB2>,
  1928				       <&u3port0 PHY_TYPE_USB3>;
  1929				#address-cells = <2>;
  1930				#size-cells = <2>;
  1931				clocks = <&vlp_cksys_clk CLK_VLP_CK_USB_TOP_SEL>,
  1932					 <&vlp_cksys_clk CLK_VLP_CK_USB_XHCI_SEL>,
  1933					 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
  1934				clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
  1935				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P0>;
  1936				mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 107>;
  1937				wakeup-source;
  1938				status = "disabled";
  1939			};
  1940	
  1941			xhci1: usb1@16710000 {
  1942				compatible = "mediatek,mtk-xhci";
  1943				reg = <0 0x16710000 0 0x1000>,
  1944				      <0 0x16713e00 0 0x0100>;
  1945				reg-names = "mac", "ippc";
  1946				interrupts-extended = <&gic GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH 0>,
  1947						      <&pio 276 IRQ_TYPE_LEVEL_LOW>;
  1948				interrupt-names = "host","wakeup";
  1949				phys = <&u2port1 PHY_TYPE_USB2>;
  1950				clocks = <&cksys_clk CLK_CK_USB_TOP_1P_SEL>,
  1951					 <&cksys_clk CLK_CK_USB_XHCI_1P_SEL>,
  1952					 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
  1953				clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
  1954				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P1>;
  1955				mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 108>;
  1956				wakeup-source;
  1957				status = "disabled";
  1958			};
  1959	
  1960			u2phy0: usb-phy0@16730000 {
  1961				compatible = "mediatek,xsphy";
  1962				ranges = <0x0 0x0 0x16730000 0x700>;
  1963				#address-cells = <1>;
  1964				#size-cells = <1>;
  1965				status = "disabled";
  1966	
  1967				u2port0: usb2-phy0@0 {
  1968					reg = <0x0 0x400>;
  1969					clocks = <&clk26m>;
  1970					clock-names = "ref";
  1971					#phy-cells = <1>;
  1972					mediatek,discth = <10>;
  1973				};
  1974			};
  1975	
  1976			u2phy1: usb-phy1@16740000 {
  1977				compatible = "mediatek,xsphy";
  1978				ranges = <0x0 0x0 0x16740000 0x700>;
  1979				#address-cells = <1>;
  1980				#size-cells = <1>;
  1981				status = "disabled";
  1982	
  1983				u2port1: usb2-phy1@0 {
  1984					reg = <0x0 0x400>;
  1985					clocks = <&clk26m>;
  1986					clock-names = "ref";
  1987					#phy-cells = <1>;
  1988					mediatek,discth = <10>;
  1989				};
  1990			};
  1991	
  1992			u3phy0: usb3-phy0@16773000 {
  1993				compatible = "mediatek,xsphy";
  1994				ranges;
  1995				reg = <0 0x16773000 0 0x200>;
  1996				#address-cells = <2>;
  1997				#size-cells = <2>;
  1998				power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
  1999				status = "disabled";
  2000	
  2001				u3port0: usb3-phy0@16773400 {
  2002					reg = <0 0x16773400 0 0x500>;
  2003					clocks = <&clk26m>;
  2004					clock-names = "ref";
  2005					#phy-cells = <1>;
  2006				};
  2007			};
  2008	
  2009			usbwkcfg_ao_clk: syscon@167a0000 {
  2010				compatible = "mediatek,mt8196-usbwkcfg-ao", "syscon";
  2011				reg = <0 0x167a0000 0 0x1000>;
  2012			};
  2013	
  2014			ufshci: ufshci@16810000 {
  2015				compatible = "mediatek,mt8183-ufshci";
  2016				reg = <0 0x16810000 0 0x2a00>;
  2017	
  2018				interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH 0>,
  2019					     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH 0>,
  2020					     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>,
  2021					     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>,
  2022					     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH 0>,
  2023					     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH 0>,
  2024					     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH 0>,
  2025					     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH 0>,
  2026					     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH 0>;
  2027				clocks =
  2028						<&cksys_clk CLK_CK_SEL>,
  2029						<&cksys_clk CLK_CK_MAINPLL_D4_D2>,
  2030						<&cksys_clk CLK_CK_UNIVPLL_D5>,
  2031						<&cksys_clk CLK_CK_AES_UFSFDE_SEL>,
  2032						<&cksys_clk CLK_CK_UNIVPLL_D6>,
  2033						<&cksys_clk CLK_CK_MAINPLL_D4>,
  2034						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_TX_SYM_UFS>,
  2035						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM0_UFS>,
  2036						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM1_UFS>,
  2037						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SYS_UFS>,
  2038						<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SAP_UFS>,
  2039						<&ufscfg_ao_clk CLK_UFSAO_PHY_SAP_UFS>,
  2040						<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_UFS_UFS>,
  2041						<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_AES_UFS>;
  2042				clock-names =
  2043						"ufs_sel",
  2044						"ufs_sel_min_src",
  2045						"ufs_sel_max_src",
  2046						"crypt_mux",
  2047						"crypt_lp",
  2048						"crypt_perf",
  2049						"unipro_tx_sym",
  2050						"unipro_rx_sym0",
  2051						"unipro_rx_sym1",
  2052						"unipro_sys",
  2053						"unipro_sap",
  2054						"ufs_phy_sap",
  2055						"ufshci_ufs",
  2056						"ufshci_aes";
  2057				freq-table-hz =
  2058						<273000000 499200000>,
  2059						<0 0>,
  2060						<0 0>,
  2061						<0 0>,
  2062						<0 0>,
  2063						<0 0>,
  2064						<0 0>,
  2065						<0 0>,
  2066						<0 0>,
  2067						<0 0>,
  2068						<0 0>,
  2069						<0 0>,
  2070						<0 0>,
  2071						<0 0>;
  2072				/* for clock scaling bind vcore */
  2073	
  2074				/* 0.65V for clock scale up */
  2075				boost-crypt-vcore-min = <650000>;
  2076				vcc-supply = <&mt6363_vemc>;
  2077				vccq-supply = <&mt6363_vufs12>;
  2078				resets =	<&ufscfgao_rst 1>,
  2079						<&ufscfgao_rst 2>,
  2080						<&ufscfgao_rst 3>;
  2081				reset-names =	"unipro_rst",
  2082						"crypto_rst",
  2083						"hci_rst";
  2084	
  2085				/*
  2086				 * Control mtcmos with rtff flow by ufs driver,
  2087				 * Instead of scpsys by PM flow.
  2088				 */
  2089				mediatek,ufs-rtff-mtcmos;
  2090				mediatek,ufs-boost-crypt;
  2091				mediatek,ufs-pmc-via-fastauto;
  2092			};
  2093	
  2094			ufscfg_ao_sec_clk: syscon@16890000 {
  2095				/* TODO: Fix compatible in driver */
  2096				compatible = "mediatek,mt8196-ufscfg-ao-sec", "mediatek,mt8196-ufscfg_ao_sec", "syscon";
  2097				reg = <0 0x16890000 0 0x1000>;
  2098				#clock-cells = <1>;
  2099			};
  2100	
  2101			ufscfg_ao_clk: syscon@168a0000 {
  2102				/* TODO: Fix compatible in driver */
  2103				compatible = "mediatek,mt8196-ufscfg-ao", "mediatek,mt8196-ufscfg_ao", "syscon";
  2104				reg = <0 0x168a0000 0 0x1000>;
  2105				#clock-cells = <1>;
  2106	
  2107				ufscfgao_rst: reset-controller {
  2108					compatible = "ti,syscon-reset";
  2109					#reset-cells = <1>;
  2110	
  2111					ti,reset-bits = <
  2112						/* ufs mphy/ufschi/crypto/unipro reset */
  2113						/* 0: mphy */
  2114						0x48   8 0x4c   8 0 0
  2115						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2116						/* 1: unipro */
  2117						0x148  0 0x14c  0 0 0
  2118						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2119						/* 2: ufs-crypto */
  2120						0x148  1 0x14c  1 0 0
  2121						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2122						/* 3: ufshci */
  2123						0x148  2 0x14c  2 0 0
  2124						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2125						>;
  2126				};
  2127			};
  2128	
  2129			pciephy0: phy@16900000 {
  2130				compatible = "mediatek,mt8196-pcie-phy";
  2131				reg = <0 0x16900000 0 0x10000>,
  2132				      <0 0x16920000 0 0x10000>;
  2133				reg-names = "sif", "ckm";
  2134	
  2135				clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_MCU_BUS_PCIE>,
  2136					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_PEXTP_REF_PCIE>;
  2137				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY0>;
  2138	
  2139				num-lanes = <1>;
  2140				#phy-cells = <0>;
  2141				status = "disabled";
  2142			};
  2143	
  2144			pcie0: pcie@16910000 {
  2145				compatible = "mediatek,mt8196-pcie";
  2146				device_type = "pci";
  2147				reg = <0 0x16910000 0 0x4000>;
  2148				reg-names = "pcie-mac";
  2149				#address-cells = <3>;
  2150				#size-cells = <2>;
  2151				interrupts = <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH 0>;
  2152				bus-range = <0x00 0xff>;
  2153				linux,pci-domain = <0>;
  2154				pextpcfg = <&pextp0cfg_ao_clk>;
  2155				ranges = <0x82000000 0 0x50000000 0x0 0x50000000 0 0x8000000>;
  2156	
  2157				clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_PL_P_PCIE>,
  2158					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_TL_PCIE>,
  2159					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_REF_PCIE>,
  2160					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AXI_250_PCIE>,
  2161					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AHB_APB_PCIE>,
  2162					 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_VLP_AO_P0_LP_PCIE>;
  2163				clock-names = "pl_250m", "tl_26m", "peri_26m",
  2164					      "peri_mem", "bus", "low_power";
  2165				assigned-clocks = <&cksys_clk CLK_CK_TL_SEL>;
  2166				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  2167	
  2168				resets = <&pextp0ao_rst 0>, <&pextp0ao_rst 1>;
  2169				reset-names = "mac", "phy";
  2170				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC0>;
  2171	
  2172				phys = <&pciephy0>;
  2173				phy-names = "pcie-phy";
  2174	
  2175				status = "disabled";
  2176	
  2177				#interrupt-cells = <1>;
  2178				interrupt-map-mask = <0 0 0 7>;
  2179				interrupt-map = <0 0 0 1 &pcie_intc0 0>,
  2180						<0 0 0 2 &pcie_intc0 1>,
  2181						<0 0 0 3 &pcie_intc0 2>,
  2182						<0 0 0 4 &pcie_intc0 3>;
  2183	
  2184				pcie_intc0: interrupt-controller {
  2185					interrupt-controller;
  2186					#address-cells = <0>;
  2187					#interrupt-cells = <1>;
  2188				};
  2189			};
  2190	
  2191			pciephy1: phy@16930000 {
  2192				compatible = "mediatek,mt8196-pcie-phy";
  2193				reg = <0 0x16930000 0 0x10000>,
  2194				      <0 0x16950000 0 0x10000>;
  2195				reg-names = "sif", "ckm";
  2196	
  2197				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_MCU_BUS_PCIE>,
  2198					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_PEXTP_REF_PCIE>;
  2199				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY1>;
  2200	
  2201				num-lanes = <2>;
  2202				#phy-cells = <0>;
  2203	
  2204				status = "disabled";
  2205			};
  2206	
  2207			pcie1: pcie@16940000 {
  2208				compatible = "mediatek,mt8196-pcie";
  2209				device_type = "pci";
  2210				reg = <0 0x16940000 0 0x4000>;
  2211				reg-names = "pcie-mac";
  2212				#address-cells = <3>;
  2213				#size-cells = <2>;
  2214				interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH 0>;
  2215				bus-range = <0x00 0xff>;
  2216				linux,pci-domain = <1>;
  2217				pextpcfg = <&pextp1cfg_ao_clk>;
  2218				ranges = <0x82000000 0 0x58000000 0x0 0x58000000 0 0x18000000>;
  2219	
  2220				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_PL_P_PCIE>,
  2221					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_TL_PCIE>,
  2222					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_REF_PCIE>,
  2223					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AXI_250_PCIE>,
  2224					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AHB_APB_PCIE>,
  2225					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P1_LP_PCIE>;
  2226				clock-names = "pl_250m", "tl_26m", "peri_26m",
  2227					      "peri_mem", "bus", "low_power";
  2228				assigned-clocks = <&cksys_clk CLK_CK_TL_P1_SEL>;
  2229				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  2230	
  2231				resets = <&pextp1ao_rst 0>, <&pextp1ao_rst 1>;
  2232				reset-names = "mac", "phy";
  2233				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC1>;
  2234	
  2235				phys = <&pciephy1>;
  2236				phy-names = "pcie-phy";
  2237	
  2238				status = "disabled";
  2239	
  2240				#interrupt-cells = <1>;
  2241				interrupt-map-mask = <0 0 0 7>;
  2242				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
  2243						<0 0 0 2 &pcie_intc1 1>,
  2244						<0 0 0 3 &pcie_intc1 2>,
  2245						<0 0 0 4 &pcie_intc1 3>;
  2246	
  2247				pcie_intc1: interrupt-controller {
  2248					interrupt-controller;
  2249					#address-cells = <0>;
  2250					#interrupt-cells = <1>;
  2251				};
  2252			};
  2253	
  2254			pciephy2: phy@16960000 {
  2255				compatible = "mediatek,mt8196-pcie-phy";
  2256				reg = <0 0x16960000 0 0x10000>,
  2257				      <0 0x16980000 0 0x10000>;
  2258				reg-names = "sif", "ckm";
  2259	
  2260				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_MCU_BUS_PCIE>,
  2261					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_PEXTP_REF_PCIE>;
  2262				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY2>;
  2263	
  2264				num-lanes = <1>;
  2265				#phy-cells = <0>;
  2266	
  2267				status = "disabled";
  2268			};
  2269	
  2270			pcie2: pcie@16970000 {
  2271				device_type = "pci";
  2272				compatible = "mediatek,mt8196-pcie";
  2273				reg = <0 0x16970000 0 0x4000>;
  2274				reg-names = "pcie-mac";
  2275				#address-cells = <3>;
  2276				#size-cells = <2>;
  2277				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH 0>;
  2278				bus-range = <0x00 0xff>;
  2279				linux,pci-domain = <2>;
  2280				pextpcfg = <&pextp1cfg_ao_clk>;
  2281				ranges = <0x82000000 0 0x70000000 0x0 0x70000000 0 0x8000000>;
  2282	
  2283				clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_PL_P_PCIE>,
  2284					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_TL_PCIE>,
  2285					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_REF_PCIE>,
  2286					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AXI_250_PCIE>,
  2287					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AHB_APB_PCIE>,
  2288					 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P2_LP_PCIE>;
  2289				clock-names = "pl_250m", "tl_26m", "peri_26m",
  2290					      "peri_mem", "bus", "low_power";
  2291				assigned-clocks = <&cksys_clk CLK_CK_TL_P2_SEL>;
  2292				assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
  2293	
  2294				resets = <&pextp1ao_rst 2>, <&pextp1ao_rst 3>;
  2295				reset-names = "mac", "phy";
  2296				power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC2>;
  2297	
  2298				phys = <&pciephy2>;
  2299				phy-names = "pcie-phy";
  2300	
  2301				status = "disabled";
  2302	
  2303				#interrupt-cells = <1>;
  2304				interrupt-map-mask = <0 0 0 7>;
  2305				interrupt-map = <0 0 0 1 &pcie_intc2 0>,
  2306						<0 0 0 2 &pcie_intc2 1>,
  2307						<0 0 0 3 &pcie_intc2 2>,
  2308						<0 0 0 4 &pcie_intc2 3>;
  2309	
  2310				pcie_intc2: interrupt-controller {
  2311					interrupt-controller;
  2312					#address-cells = <0>;
  2313					#interrupt-cells = <1>;
  2314				};
  2315			};
  2316	
  2317			pextp0cfg_ao_clk: syscon@169b0000 {
  2318				/* TODO: Fix compatible in driver */
  2319				compatible = "mediatek,mt8196-pextp0cfg-ao", "mediatek,mt8196-pextp0cfg_ao", "syscon", "simple-mfd";
  2320				reg = <0 0x169b0000 0 0x1000>;
  2321				#clock-cells = <1>;
  2322	
  2323				pextp0ao_rst: reset-controller {
  2324					compatible = "ti,syscon-reset";
  2325					#reset-cells = <1>;
  2326	
  2327					ti,reset-bits = <
  2328						/* 0: PCIe0 MAC reset */
  2329						0x8  0 0xc  0 0 0
  2330						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2331						/* 1: PCIe0 PHY reset */
  2332						0x8  1 0xc  1 0 0
  2333						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2334						>;
  2335				};
  2336			};
  2337	
  2338			pextp1cfg_ao_clk: syscon@169e0000 {
  2339				/* TODO: Fix compatible in driver */
  2340				compatible = "mediatek,mt8196-pextp1cfg-ao", "mediatek,mt8196-pextp1cfg_ao", "syscon", "simple-mfd";
  2341				reg = <0 0x169e0000 0 0x1000>;
  2342				#clock-cells = <1>;
  2343	
  2344				pextp1ao_rst: reset-controller {
  2345					compatible = "ti,syscon-reset";
  2346					#reset-cells = <1>;
  2347	
  2348					ti,reset-bits = <
  2349						/* 0: PCIe1 MAC reset */
  2350						0x8  0 0xc  0 0 0
  2351						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2352						/* 1: PCIe1 PHY reset */
  2353						0x8  1 0xc  1 0 0
  2354						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2355						/* 2: PCIe2 MAC reset */
  2356						0x8  8 0xc  8 0 0
  2357						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2358						/* 3: PCIe2 PHY reset */
  2359						0x8  9 0xc  9 0 0
  2360						(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
  2361						>;
  2362				};
  2363			};
  2364	
  2365			ssr_top_clk: syscon@18000000 {
  2366				/* TODO: Fix compatible in driver */
  2367				compatible = "mediatek,mt8196-ssr-top", "mediatek,mt8196-ssr_top", "syscon";
  2368				reg = <0 0x18000000 0 0x1000>;
  2369				hw-voter-regmap = <&hwv>;
  2370				#clock-cells = <1>;
  2371			};
  2372	
  2373			devapc_apinfra_ssr: devapc@180f3000 {
  2374				compatible = "mediatek,mt8196-devapc";
  2375				reg = <0 0x180f3000 0 0x1000>;
  2376				vio-idx-num = <39>;
  2377				interrupts = <GIC_SPI 866 IRQ_TYPE_LEVEL_HIGH 0>;
  2378			};
  2379	
  2380			adsp: adsp@1a000000 {
  2381				compatible = "mediatek,mt8196-dsp";
  2382				reg = <0 0x1a000000 0 0x5000>,
  2383				      <0 0x1a210000 0 0x80000>,
  2384				      <0 0x1a345000 0 0x300>,
  2385				      <0 0x1a00f000 0 0x1000>;
  2386				reg-names = "cfg", "sram", "sec", "bus";
  2387				interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH 0>;
  2388				interrupt-names = "wdt";
  2389				power-domains = <&scpsys MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;
  2390				clocks = <&cksys_clk CLK_CK_ADSP_SEL>,
  2391					 <&cksys_clk CLK_CK_TCK_26M_MX9>,
  2392					 <&cksys_clk CLK_CK_ADSPPLL>;
  2393				clock-names = "clk_top_adsp_sel",
  2394					      "clk_top_clk26m",
  2395					      "clk_top_adsppll";
  2396				mbox-names = "rx", "tx";
  2397				mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
  2398				status = "disabled";
  2399			};
  2400	
  2401			devapc_adsp: devapc@1a019000 {
  2402				compatible = "mediatek,mt8196-devapc";
  2403				reg = <0 0x1a019000 0 0x1000>;
  2404				vio-idx-num = <54>;
  2405				interrupts = <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH 0>;
  2406			};
  2407	
  2408			afe_clk: syscon@1a110000 {
  2409				compatible = "mediatek,mt8196-audiosys", "syscon";
  2410				reg = <0 0x1a110000 0 0x1000>;
  2411				#clock-cells = <1>;
  2412				power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
  2413			};
  2414	
  2415			afe: mt8196-afe-pcm@1a110000 {
  2416				compatible = "mediatek,mt8196-sound";
  2417				reg = <0 0x1a110000 0 0x9000>;
  2418				interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
  2419				cksys = <&cksys_clk>;
  2420				vlpcksys = <&vlp_cksys_clk>;
  2421				power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
  2422				clocks = <&afe_clk CLK_AFE_AUDIO_HOPPING_AFE>,
  2423					<&afe_clk CLK_AFE_AUDIO_F26M_AFE>,
  2424					<&afe_clk CLK_AFE_UL0_ADC_AFE>,
  2425					<&afe_clk CLK_AFE_UL0_ADC_HIRES_AFE>,
  2426					<&afe_clk CLK_AFE_UL1_ADC_AFE>,
  2427					<&afe_clk CLK_AFE_UL1_ADC_HIRES_AFE>,
  2428					<&afe_clk CLK_AFE_APLL1_AFE>,
  2429					<&afe_clk CLK_AFE_APLL2_AFE>,
  2430					<&afe_clk CLK_AFE_APLL_TUNER1_AFE>,
  2431					<&afe_clk CLK_AFE_APLL_TUNER2_AFE>,
  2432					<&vlp_cksys_clk CLK_VLP_CK_AUD_INTBUS_SEL>,
  2433					<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN1_SEL>,
  2434					<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN2_SEL>,
  2435					<&vlp_cksys_clk CLK_VLP_CK_AUDIO_H_SEL>,
  2436					<&vlp_cksys_clk CLK_VLP_CK_CLKSQ>,
  2437					<&cksys_clk CLK_CK_MAINPLL_D4_D4>,
  2438					<&cksys_clk CLK_CK_AUD_1_SEL>,
  2439					<&cksys_clk CLK_CK_APLL1>,
  2440					<&cksys_clk CLK_CK_AUD_2_SEL>,
  2441					<&cksys_clk CLK_CK_APLL2>,
  2442					<&cksys_clk CLK_CK_APLL1_D4>,
  2443					<&cksys_clk CLK_CK_APLL2_D4>,
  2444					<&cksys_clk CLK_CK_APLL_I2SIN0_MCK_SEL>,
  2445					<&cksys_clk CLK_CK_APLL_I2SIN1_MCK_SEL>,
  2446					<&cksys_clk CLK_CK_APLL_FMI2S_MCK_SEL>,
  2447					<&cksys_clk CLK_CK_APLL_TDMOUT_MCK_SEL>,
  2448					<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN0>,
  2449					<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN1>,
  2450					<&cksys_clk CLK_CK_APLL12_CK_DIV_FMI2S>,
  2451					<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_M>,
  2452					<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_B>,
  2453					<&cksys_clk CLK_CK_ADSP_SEL>,
  2454					<&cksys_clk CLK_CK_TCK_26M_MX9>;
  2455	
  2456				clock-names = "aud_hopping_clk",
  2457					"aud_f26m_clk",
  2458					"aud_ul0_adc_clk",
  2459					"aud_ul0_adc_hires_clk",
  2460					"aud_ul1_adc_clk",
  2461					"aud_ul1_adc_hires_clk",
  2462					"aud_apll1_clk",
  2463					"aud_apll2_clk",
  2464					"aud_apll_tuner1_clk",
  2465					"aud_apll_tuner2_clk",
  2466					"vlp_mux_audio_int",
  2467					"vlp_mux_aud_eng1",
  2468					"vlp_mux_aud_eng2",
  2469					"vlp_mux_audio_h",
  2470					"vlp_clk26m_clk",
  2471					"ck_mainpll_d4_d4",
  2472					"ck_mux_aud_1",
  2473					"ck_apll1_ck",
  2474					"ck_mux_aud_2",
  2475					"ck_apll2_ck",
  2476					"ck_apll1_d4",
  2477					"ck_apll2_d4",
  2478					"ck_i2sin0_m_sel",
  2479					"ck_i2sin1_m_sel",
  2480					"ck_fmi2s_m_sel",
  2481					"ck_tdmout_m_sel",
  2482					"ck_apll12_div_i2sin0",
  2483					"ck_apll12_div_i2sin1",
  2484					"ck_apll12_div_fmi2s",
  2485					"ck_apll12_div_tdmout_m",
  2486					"ck_apll12_div_tdmout_b",
  2487					"ck_adsp_sel",
  2488					"ck_clk26m_clk";
  2489				pinctrl-names = "aud-clk-mosi-off",
  2490					"aud-clk-mosi-on",
  2491					"aud-dat-mosi-off",
  2492					"aud-dat-mosi-on",
  2493					"aud-dat-mosi-ch34-off",
  2494					"aud-dat-mosi-ch34-on",
  2495					"aud-dat-miso0-off",
  2496					"aud-dat-miso0-on",
  2497					"aud-dat-miso1-off",
  2498					"aud-dat-miso1-on",
  2499					"aud-gpio-i2sin0-off",
  2500					"aud-gpio-i2sin0-on",
  2501					"aud-gpio-i2sout0-off",
  2502					"aud-gpio-i2sout0-on",
  2503					"aud-gpio-i2sin1-off",
  2504					"aud-gpio-i2sin1-on",
  2505					"aud-gpio-i2sout1-off",
  2506					"aud-gpio-i2sout1-on",
  2507					"aud-gpio-i2sin4-off",
  2508					"aud-gpio-i2sin4-on",
  2509					"aud-gpio-i2sout4-off",
  2510					"aud-gpio-i2sout4-on",
  2511					"aud-gpio-i2sin6-off",
  2512					"aud-gpio-i2sin6-on",
  2513					"aud-gpio-i2sout6-off",
  2514					"aud-gpio-i2sout6-on",
  2515					"aud-dat-miso-only-off",
  2516					"aud-dat-miso-only-on",
  2517					"aud-gpio-ap-dmic-off",
  2518					"aud-gpio-ap-dmic-on",
  2519					"aud-gpio-ap-dmic1-off",
  2520					"aud-gpio-ap-dmic1-on",
  2521					"aud-gpio-i2sin3-off",
  2522					"aud-gpio-i2sin3-on",
  2523					"aud-gpio-i2sout3-off",
  2524					"aud-gpio-i2sout3-on";
  2525	
  2526				pinctrl-0 = <&aud_clk_mosi_off>;
  2527				pinctrl-1 = <&aud_clk_mosi_on>;
  2528				pinctrl-2 = <&aud_dat_mosi_off>;
  2529				pinctrl-3 = <&aud_dat_mosi_on>;
  2530				pinctrl-4 = <&aud_dat_mosi_ch34_off>;
  2531				pinctrl-5 = <&aud_dat_mosi_ch34_on>;
  2532				pinctrl-6 = <&aud_dat_miso0_off>;
  2533				pinctrl-7 = <&aud_dat_miso0_on>;
  2534				pinctrl-8 = <&aud_dat_miso1_off>;
  2535				pinctrl-9 = <&aud_dat_miso1_on>;
  2536				pinctrl-10 = <&aud_gpio_i2sin0_off>;
  2537				pinctrl-11 = <&aud_gpio_i2sin0_on>;
  2538				pinctrl-12 = <&aud_gpio_i2sout0_off>;
  2539				pinctrl-13 = <&aud_gpio_i2sout0_on>;
  2540				pinctrl-14 = <&aud_gpio_i2sin1_off>;
  2541				pinctrl-15 = <&aud_gpio_i2sin1_on>;
  2542				pinctrl-16 = <&aud_gpio_i2sout1_off>;
  2543				pinctrl-17 = <&aud_gpio_i2sout1_on>;
  2544				pinctrl-18 = <&aud_gpio_i2sin4_off>;
  2545				pinctrl-19 = <&aud_gpio_i2sin4_on>;
  2546				pinctrl-20 = <&aud_gpio_i2sout4_off>;
  2547				pinctrl-21 = <&aud_gpio_i2sout4_on>;
  2548				pinctrl-22 = <&aud_gpio_i2sin6_off>;
  2549				pinctrl-23 = <&aud_gpio_i2sin6_on>;
  2550				pinctrl-24 = <&aud_gpio_i2sout6_off>;
  2551				pinctrl-25 = <&aud_gpio_i2sout6_on>;
  2552				pinctrl-26 = <&aud_dat_miso_only_off>;
  2553				pinctrl-27 = <&aud_dat_miso_only_on>;
  2554				pinctrl-28 = <&aud_gpio_ap_dmic_off>;
  2555				pinctrl-29 = <&aud_gpio_ap_dmic_on>;
  2556				pinctrl-30 = <&aud_gpio_ap_dmic1_off>;
  2557				pinctrl-31 = <&aud_gpio_ap_dmic1_on>;
  2558				pinctrl-32 = <&aud_gpio_i2sin3_off>;
  2559				pinctrl-33 = <&aud_gpio_i2sin3_on>;
  2560				pinctrl-34 = <&aud_gpio_i2sout3_off>;
  2561				pinctrl-35 = <&aud_gpio_i2sout3_on>;
  2562	
  2563				/* Only for ETDM in/out 4 */
  2564				etdm-out-ch = <2>;
  2565				etdm-in-ch = <2>;
  2566				etdm-out-sync = <0>; /* 0: disable; 1: enable */
  2567				etdm-in-sync = <1>; /* 0: disable; 1: enable */
  2568				etdm-ip-mode = <0>; /* 0: One IP multi-channel 1: Multi-IP 2-channel */
  2569				status = "disabled";
  2570			};
  2571	
  2572			adsp_mailbox0: mailbox@1a350000 {
  2573				compatible = "mediatek,mt8196-adsp-mbox",
  2574					     "mediatek,mt8186-adsp-mbox";
  2575				reg = <0 0x1a350100 0 0x1000>;
  2576				interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH 0>;
  2577				#mbox-cells = <0>;
  2578			};
  2579	
  2580			adsp_mailbox1: mailbox@1a360000 {
  2581				compatible = "mediatek,mt8196-adsp-mbox",
  2582					     "mediatek,mt8186-adsp-mbox";
  2583				reg = <0 0x1a360100 0 0x1000>;
  2584				interrupts = <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH 0>;
  2585				#mbox-cells = <0>;
  2586			};
  2587	
  2588			scpsys: power-controller@1c004000 {
  2589				compatible = "mediatek,mt8196-scpsys-hwv", "syscon";
  2590				reg = <0 0x1c004000 0 0x1000>;
  2591				#power-domain-cells = <1>;
  2592				apifrbus-ao-io-reg-bus = <&ifr_bus>;
  2593				spm = <&scpsys_bus>;
  2594				hw-voter-regmap = <&hwv>;
  2595			};
  2596	
  2597			scpsys_bus: syscon@1c00d000 {
  2598				compatible = "mediatek,mt8196-scpsys-bus", "syscon";
  2599				reg = <0 0x1c00d000 0 0x1000>;
  2600			};
  2601	
  2602			watchdog: watchdog@1c010000 {
  2603				compatible = "mediatek,mt8196-wdt",
  2604						"mediatek,mt6589-wdt",
  2605						"syscon", "simple-mfd";
  2606				reg = <0 0x1c010000 0 0x1000>;
  2607			};
  2608	
  2609			dvfsrc: dvfsrc@1c013000 {
  2610				compatible = "mediatek,mt8196-dvfsrc";
  2611				reg = <0 0x1c013000 0 0x1000>,
  2612					<0 0x1c004000 0 0x1000>;
  2613				reg-names = "dvfsrc", "spm";
  2614				#interconnect-cells = <1>;
  2615	
  2616				dvfsrc_vcore: dvfsrc-vcore {
  2617					regulator-name = "dvfsrc-vcore";
  2618					regulator-min-microvolt = <575000>;
  2619					regulator-max-microvolt = <875000>;
  2620					regulator-always-on;
  2621				};
  2622	
  2623				dvfsrc_freq_opp9: opp9 {
  2624					opp-peak-KBps = <0>;
  2625				};
  2626				dvfsrc_freq_opp8: opp8 {
  2627					opp-peak-KBps = <9800000>;
  2628				};
  2629				dvfsrc_freq_opp7: opp7 {
  2630					opp-peak-KBps = <13200000>;
  2631				};
  2632				dvfsrc_freq_opp6: opp6 {
  2633					opp-peak-KBps = <19700000>;
  2634				};
  2635				dvfsrc_freq_opp5: opp5 {
  2636					opp-peak-KBps = <24900000>;
  2637				};
  2638				dvfsrc_freq_opp4: opp4 {
  2639					opp-peak-KBps = <32400000>;
  2640				};
  2641				dvfsrc_freq_opp3: opp3 {
  2642					opp-peak-KBps = <37600000>;
  2643				};
  2644				dvfsrc_freq_opp2: opp2 {
  2645					opp-peak-KBps = <44300000>;
  2646				};
  2647				dvfsrc_freq_opp1: opp1 {
  2648					opp-peak-KBps = <54500000>;
  2649				};
  2650				dvfsrc_freq_opp0: opp0 {
  2651					opp-peak-KBps = <61400000>;
  2652				};
  2653			};
  2654	
  2655			vlp_cksys_clk: syscon@1c016000 {
  2656				/* TODO: Fix compatible in driver */
  2657				compatible = "mediatek,mt8196-vlp-cksys", "mediatek,mt8196-vlp_cksys", "syscon";
  2658				reg = <0 0x1c016000 0 0x1000>;
  2659				hw-voter-regmap = <&hwv>;
  2660				#clock-cells = <1>;
  2661			};
  2662	
  2663			spmi: spmi@1c01a000 {
  2664				compatible = "mediatek,mt8196-spmi";
  2665				reg = <0 0x1c01a000 0 0x0008ff>,
  2666				      <0 0x1c01c000 0 0x000100>,
  2667				      <0 0x1c018000 0 0x0008ff>,
  2668				      <0 0x1c01c800 0 0x000100>;
  2669				reg-names = "pmif", "spmimst","pmif-p","spmimst-p";
  2670				interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>,
  2671						      <&pio 292 IRQ_TYPE_LEVEL_HIGH>,
  2672						      <&gic GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH 0>,
  2673						      <&gic GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH 0>,
  2674						      <&gic GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH 0>,
  2675						      <&gic GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH 0>;
  2676				interrupt-names = "rcs_irq","rcs_irq_p","pmif_irq","spmi_nack_irq","pmif_p_irq","spmi_p_nack_irq";
  2677				interrupt-controller;
  2678				#interrupt-cells = <1>;
  2679				irq-event-en = <0x0 0x0 0x0 0x0 0x0>;
  2680				spmi-dev-mask = <0x85c0>;
  2681				#address-cells = <2>;
  2682				#size-cells = <0>;
  2683			};
  2684	
  2685			devapc_vlp: devapc@1c032000 {
  2686				compatible = "mediatek,mt8196-devapc";
  2687				reg = <0 0x1c032000 0 0x1000>;
  2688				vio-idx-num = <101>;
  2689				interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
  2690			};
  2691	
  2692			sram@1c350000 {
  2693				compatible = "mmio-sram";
  2694				reg = <0x0 0x1c350000 0x0 0x80>;
  2695	
  2696				#address-cells = <1>;
  2697				#size-cells = <1>;
  2698				ranges = <0 0x0 0x1c350000 0x80>;
  2699	
  2700				scmi_tx_shmem: mailbox-sram@0 {
  2701					compatible = "arm,scmi-shmem";
  2702					reg = <0x0 0x80>;
  2703				};
  2704			};
  2705	
  2706			tinysys_mbox: mailbox@1c351000 {
  2707				compatible = "mediatek,tinysys_mbox";
  2708				reg = <0 0x1c351000 0 0x1000>,
  2709				      <0 0x1c361000 0 0x1000>;
  2710				/* for profiling */
  2711				shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
  2712				interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH 0>,
  2713					     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH 0>;
  2714				#mbox-cells = <1>;
  2715				/* notify spm clr */
  2716				secure-sspm-md2spm-clr = <1>;
  2717			};
  2718	
  2719			sram@1c360000 {
  2720				compatible = "mmio-sram";
  2721				reg = <0x0 0x1c360000 0x0 0x80>;
  2722	
  2723				#address-cells = <1>;
  2724				#size-cells = <1>;
  2725				ranges = <0 0x0 0x1c360000 0x80>;
  2726	
  2727				scmi_rx_shmem: mailbox-sram@0 {
  2728					compatible = "arm,scmi-shmem";
  2729					reg = <0x0 0x80>;
  2730				};
  2731			};
  2732	
  2733			systimer: systimer@1c400000 {
  2734				compatible = "mediatek,mt8196-timer",
  2735					     "mediatek,mt6765-timer";
  2736				reg = <0 0x1c400000 0 0x1000>;
  2737				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH 0>;
  2738				clocks = <&clk13m>;
  2739			};
  2740	
  2741			smi_disp_common: smi-comm@30020000 {
  2742				compatible = "mediatek,mt8196-smi-common";
  2743				reg = <0 0x30020000 0 0x1000>;
  2744				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2745				mediatek,smi = <&disp_ssc0_smi_2x1_sub_comm>;
  2746				mediatek,common-id = <0>;
  2747				mediatek,skip-rpm-cb;
  2748			};
  2749	
  2750			smi_mdp_common: smi-comm@30021000 {
  2751				compatible = "mediatek,mt8196-smi-common";
  2752				reg = <0 0x30021000 0 0x1000>;
  2753				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2754				mediatek,smi = <&mdp_ssc4_smi_2x1_sub_comm>;
  2755				mediatek,common-id = <1>;
  2756				mediatek,skip-rpm-cb;
  2757			};
  2758	
  2759			devapc_mminfra: devapc@30040000 {
  2760				compatible = "mediatek,mt8196-devapc";
  2761				reg = <0 0x30040000 0 0x1000>;
  2762				vio-idx-num = <699>;
  2763				interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
  2764			};
  2765	
  2766			gce0: gce@300c0000 {
  2767				compatible = "mediatek,mt8196-gce";
  2768				reg = <0 0x300c0000 0 0x80000>;
  2769				interrupts = <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH 0>;
  2770				#mbox-cells = <2>;
  2771				iommus = <&mm_smmu 199>;
  2772				mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
  2773				mediatek,gce-events = <CMDQ_SYNC_SECURE_THR_EOF>;
  2774			};
  2775	
  2776			gce1: gce@30140000 {
  2777				compatible = "mediatek,mt8196-gce";
  2778				reg = <0 0x30140000 0 0x80000>;
  2779				interrupts = <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH 0>;
  2780				#mbox-cells = <2>;
  2781				iommus = <&mm_smmu 183>;
  2782			};
  2783	
  2784			mm_smmu: iommu@30800000 {
  2785				compatible = "mediatek,mt8196-mm-smmu", "arm,smmu-v3";
  2786				reg = <0 0x30800000 0 0x1e0000>;
  2787				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>;
  2788				interrupt-names = "combined";
  2789				#iommu-cells = <1>;
  2790			};
  2791	
  2792			disp_ssc0_smi_2x1_sub_comm: smi-comm@30a30000 {
  2793				compatible = "mediatek,mt8196-smi-common";
  2794				reg = <0 0x30a30000 0 0x1000>;
  2795				mediatek,common-id = <3>;
  2796				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2797				mediatek,skip-rpm-cb;
  2798			};
  2799	
  2800			disp_ssc1_smi_2x1_sub_comm: smi-comm@30a31000 {
  2801				compatible = "mediatek,mt8196-smi-common";
  2802				reg = <0 0x30a31000 0 0x1000>;
  2803				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2804				mediatek,common-id = <4>;
  2805				mediatek,skip-rpm-cb;
  2806			};
  2807	
  2808			mdp_ssc4_smi_2x1_sub_comm: smi-comm@30a32000 {
  2809				compatible = "mediatek,mt8196-smi-common";
  2810				reg = <0 0x30a32000 0 0x1000>;
  2811				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2812				mediatek,common-id = <5>;
  2813				mediatek,skip-rpm-cb;
  2814			};
  2815	
  2816			mdp_ssc5_smi_2x1_sub_comm: smi-comm@30a33000 {
  2817				compatible = "mediatek,mt8196-smi-common";
  2818				reg = <0 0x30a33000 0 0x1000>;
  2819				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
  2820				mediatek,common-id = <6>;
  2821				mediatek,skip-rpm-cb;
  2822			};
  2823	
  2824			vcp: vcp@31800000 {
  2825				compatible = "mediatek,vcp";
  2826				reg = <0 0x31800000 0 0x60000>, /* sram */
  2827				      <0 0x31a04000 0 0xa000>, /* cfg */
  2828				      <0 0x31bd0000 0 0x1000>, /* cfg core */
  2829				      <0 0x31b80000 0 0x50000>, /* mbox base */
  2830				      <0 0x31a70020 0 0x100>, /* mbox init */
  2831				      <0 0x1c00091c 0 0x4>; /* vcp rdy */
  2832				reg-names = "sram",
  2833					    "cfg",
  2834					    "cfg_core",
  2835					    "mbox_base",
  2836					    "mbox_init",
  2837					    "vcp_vlp_ao_rsvd7";
  2838	
  2839				interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>,
  2840					     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>,
  2841					     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH 0>,
  2842					     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>,
  2843					     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH 0>,
  2844					     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
  2845				interrupt-names = "wdt",
  2846						  "mbox0",
  2847						  "mbox1",
  2848						  "mbox2",
  2849						  "mbox3",
  2850						  "mbox4";
  2851	
  2852				power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
  2853				iommus = <&mm_smmu 160>;
  2854				memory-region = <&vcp_resv_mem>;
  2855	
  2856				vcp-mem-tbl = <0 0x1a00000>, /* VCP_RTOS_MEM_ID 26MB */
  2857					      <1 0x30000>, /* VDEC_MEM_ID 192KB */
  2858					      <2 0x12000>, /* VENC_MEM_ID 72KB */
  2859					      <3 0x1000>; /* LOGGER 4KB*/
  2860	
  2861				vcp@0 {
  2862					compatible = "mediatek,vcp-core";
  2863					twohart = <1>;
  2864					sram-offset = <0x0>;
  2865				};
  2866	
  2867				vcp@31000 {
  2868					compatible = "mediatek,mmup-core";
  2869					twohart = <0>;
  2870					sram-offset = <0x031000>;
  2871				};
  2872	
  2873				send_table: mtk-send-table {
  2874					mbox0-0 {
  2875						mbox-id = <0>;
  2876						chan-id = <0>;
  2877						msg-size = <18>;
  2878					};
  2879					mbox1-15 {
  2880						mbox-id = <1>;
  2881						chan-id = <15>;
  2882						msg-size = <8>;
  2883					};
  2884					mbox1-16 {
  2885						mbox-id = <1>;
  2886						chan-id = <16>;
  2887						msg-size = <18>;
  2888					};
  2889					mbox1-9 {
  2890						mbox-id = <1>;
  2891						chan-id = <9>;
  2892						msg-size = <2>;
  2893					};
  2894					mbox2-11 {
  2895						mbox-id = <2>;
  2896						chan-id = <11>;
  2897						msg-size = <18>;
  2898					};
  2899					mbox2-2 {
  2900						mbox-id = <2>;
  2901						chan-id = <2>;
  2902						msg-size = <2>;
  2903					};
  2904					mbox2-3 {
  2905						mbox-id = <2>;
  2906						chan-id = <3>;
  2907						msg-size = <3>;
  2908					};
  2909					mbox2-32 {
  2910						mbox-id = <2>;
  2911						chan-id = <32>;
  2912						msg-size = <2>;
  2913					};
  2914					mbox3-33 {
  2915						mbox-id = <3>;
  2916						chan-id = <33>;
  2917						msg-size = <2>;
  2918					};
  2919					mbox3-13 {
  2920						mbox-id = <3>;
  2921						chan-id = <13>;
  2922						msg-size = <2>;
  2923					};
  2924					mbox3-35 {
  2925						mbox-id = <3>;
  2926						chan-id = <35>;
  2927						msg-size = <2>;
  2928					};
  2929					mbox4-20 {
  2930						mbox-id = <4>;
  2931						chan-id = <20>;
  2932						msg-size = <2>;
  2933					};
  2934					mbox4-21 {
  2935						mbox-id = <4>;
  2936						chan-id = <21>;
  2937						msg-size = <3>;
  2938					};
  2939					mbox4-23 {
  2940						mbox-id = <4>;
  2941						chan-id = <23>;
  2942						msg-size = <2>;
  2943					};
  2944				};
  2945	
  2946				recv_table: mtk-recv-table {
  2947					mbox0-1 {
  2948						mbox-id = <0>;
  2949						chan-id = <1>;
  2950						msg-size = <18>;
  2951						recv-opt = <0>;
  2952					};
  2953					mbox1-15 {
  2954						mbox-id = <1>;
  2955						chan-id = <15>;
  2956						msg-size = <8>;
  2957						recv-opt = <1>;
  2958					};
  2959					mbox1-17 {
  2960						mbox-id = <1>;
  2961						chan-id = <17>;
  2962						msg-size = <18>;
  2963						recv-opt = <0>;
  2964					};
  2965					mbox1-10 {
  2966						mbox-id = <1>;
  2967						chan-id = <10>;
  2968						msg-size = <2>;
  2969						recv-opt = <0>;
  2970					};
  2971					mbox2-12 {
  2972						mbox-id = <2>;
  2973						chan-id = <12>;
  2974						msg-size = <18>;
  2975						recv-opt = <0>;
  2976					};
  2977					mbox2-5 {
  2978						mbox-id = <2>;
  2979						chan-id = <5>;
  2980						msg-size = <1>;
  2981						recv-opt = <0>;
  2982					};
  2983					mbox2-2 {
  2984						mbox-id = <2>;
  2985						chan-id = <2>;
  2986						msg-size = <1>;
  2987						recv-opt = <1>;
  2988					};
  2989					mbox3-34 {
  2990						mbox-id = <3>;
  2991						chan-id = <34>;
  2992						msg-size = <2>;
  2993						recv-opt = <0>;
  2994					};
  2995					mbox3-14 {
  2996						mbox-id = <3>;
  2997						chan-id = <14>;
  2998						msg-size = <2>;
  2999						recv-opt = <0>;
  3000					};
  3001					mbox4-26 {
  3002						mbox-id = <4>;
  3003						chan-id = <26>;
  3004						msg-size = <1>;
  3005						recv-opt = <0>;
  3006					};
  3007					mbox4-20 {
  3008						mbox-id = <4>;
  3009						chan-id = <20>;
  3010						msg-size = <1>;
  3011						recv-opt = <1>;
  3012					};
  3013				};
  3014			};
  3015	
  3016			mminfra_hwv: syscon@31a80000 {
  3017				/* TODO: Fix compatible in driver */
  3018				compatible = "mediatek,mt8196-mminfra-hwv", "mediatek,mt8196-mminfra_hwv", "syscon";
  3019				reg = <0 0x31a80000 0 0x1000>;
  3020			};
  3021	
  3022			devapc_mmup: devapc@31ad5000 {
  3023				compatible = "mediatek,mt8196-devapc";
  3024				reg = <0 0x31ad5000 0 0x1000>;
  3025				vio-idx-num = <71>;
  3026				interrupts = <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH 0>;
  3027			};
  3028	
  3029			mm_hwv: syscon@31b00000 {
  3030				/* TODO: Fix compatible in driver */
  3031				compatible = "mediatek,mt8196-mm-hwv", "mediatek,mt8196-mm_hwv", "syscon";
  3032				reg = <0 0x31b00000 0 0x3000>;
  3033			};
  3034	
  3035			hfrpsys: power-controller@31b50000 {
  3036				compatible = "mediatek,mt8196-hfrpsys-hwv", "syscon";
  3037				reg = <0 0x31b50000 0 0x1000>;
  3038				#power-domain-cells = <1>;
  3039				mmpc = <&hfrpsys>;
  3040				mm-hw-ccf-regmap = <&mm_hwv>;
  3041				mminfra-hwv-regmap = <&mminfra_hwv>;
  3042			};
  3043	
  3044			dispsys_config_clk: syscon@32000000 {
  3045				compatible = "mediatek,mt8196-dispsys0", "syscon";
  3046				reg = <0 0x32000000 0 0x1000>;
  3047				mm-hw-ccf-regmap = <&mm_hwv>;
  3048				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
  3049				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
  3050				#clock-cells = <1>;
  3051	
  3052				async {
  3053					clocks = <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC0_DISP>,
  3054						 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC1_DISP>,
  3055						 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC8_DISP>,
  3056						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC1_DISP>,
  3057						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC2_DISP>,
  3058						 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC3_DISP>;
  3059				};
  3060	
  3061				top {
  3062					clocks = <&dispsys_config_clk CLK_MM_CONFIG_DISP>;
  3063				};
  3064			};
  3065	
  3066			disp0_mutex: mutex@32020000 {
  3067				compatible = "mediatek,mt8196-disp-mutex";
  3068				reg = <0 0x32020000 0 0x1000>;
  3069				clocks = <&dispsys_config_clk CLK_MM_DISP_MUTEX0_DISP>;
  3070				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
  3071						      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
  3072			};
  3073	
  3074			disp_ccorr0: disp-ccorr@32090000 {
  3075				compatible = "mediatek,mt8196-disp-ccorr";
  3076				reg = <0 0x32090000 0 0x1000>;
  3077				clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR0_PQ>;
  3078			};
  3079	
  3080			disp_ccorr1: disp-ccorr@320a0000 {
  3081				compatible = "mediatek,mt8196-disp-ccorr";
  3082				reg = <0 0x320a0000 0 0x1000>;
  3083				clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR1_PQ>;
  3084			};
  3085	
  3086			disp_dither0: disp-dither@32110000 {
  3087				compatible = "mediatek,mt8196-disp-dither",
  3088					     "mediatek,mt8183-disp-dither";
  3089				reg = <0 0x32110000 0 0x1000>;
  3090				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
  3091				clocks = <&dispsys_config_clk CLK_MM_DISP_DITHER0_PQ>;
  3092			};
  3093	
  3094			disp_gamma0: disp-gamma@32130000 {
  3095				compatible = "mediatek,mt8196-disp-gamma",
  3096					     "mediatek,mt8195-disp-gamma";
  3097				reg = <0 0x32130000 0 0x1000>;
  3098				clocks = <&dispsys_config_clk CLK_MM_DISP_GAMMA0_PQ>;
  3099			};
  3100	
  3101			disp_tdshp0: disp-tdshp@321e0000 {
  3102				compatible = "mediatek,mt8196-disp-tdshp";
  3103				reg = <0 0x321e0000 0 0x1000>;
  3104				clocks = <&dispsys_config_clk CLK_MM_DISP_TDSHP0_PQ>;
  3105			};
  3106	
  3107			disp_postmask0: postmask@32180000 {
  3108				compatible = "mediatek,mt8196-disp-postmask",
  3109					     "mediatek,mt8192-disp-postmask";
  3110				reg = <0 0x32180000 0 0x1000>;
  3111				clocks = <&dispsys_config_clk CLK_MM_DISP_POSTMASK0_DISP>;
  3112			};
  3113	
  3114			disp_mdp_rsz0: mdp-rsz@321a0000 {
  3115				compatible = "mediatek,mt8196-disp-mdp-rsz";
  3116				reg = <0 0x321a0000 0 0x1000>;
  3117				clocks = <&dispsys_config_clk CLK_MM_MDP_RSZ0_DISP>;
  3118			};
  3119	
  3120			smi_larb32: larb@32240000 {
  3121				compatible = "mediatek,mt8196-smi-larb";
  3122				reg = <0 0x32240000 0 0x1000>;
  3123				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
  3124				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  3125					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  3126				clock-names = "apb", "smi";
  3127				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3128				mediatek,larb-id = <32>;
  3129				larb-port-real-time-type = <1 1 1 1 0 0 0 0 1 0>;
  3130			};
  3131	
  3132			dispsys1_config_clk: syscon@32400000 {
  3133				compatible = "mediatek,mt8196-dispsys1", "syscon";
  3134				reg = <0 0x32400000 0 0x1000>;
  3135				mm-hw-ccf-regmap = <&mm_hwv>;
  3136				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
  3137				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
  3138				#clock-cells = <1>;
  3139	
  3140				async {
  3141					clocks = <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC21_DISP>,
  3142						 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC22_DISP>,
  3143						 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC23_DISP>;
  3144				};
  3145	
  3146				top {
  3147					clocks = <&dispsys1_config_clk CLK_MM1_DISPSYS1_CONFIG_DISP>;
  3148					clock-names = "dispsys1_config";
  3149				};
  3150			};
  3151	
  3152			disp1_mutex: mutex@32420000 {
  3153				compatible = "mediatek,mt8196-disp-mutex";
  3154				reg = <0 0x32420000 0 0x1000>;
  3155				clocks = <&dispsys1_config_clk CLK_MM1_DISP_MUTEX0_DISP>;
  3156			};
  3157	
  3158			dp_intf0: dp-intf@32430000 {
  3159				compatible = "mediatek,mt8196-dp-intf";
  3160				reg = <0 0x32430000 0 0x1000>;
  3161				interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>;
  3162				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF0>,
  3163					 <&dispsys1_config_clk CLK_MM1_MOD4>,
  3164					 <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
  3165					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D4>,
  3166					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D8>,
  3167					 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D16>,
  3168					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL1>,
  3169					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  3170				clock-names = "hf_fmm_ck",
  3171					      "hf_fdp_ck",
  3172					      "mux_dp",
  3173					      "tvdpll_d4",
  3174					      "tvdpll_d8",
  3175					      "tvdpll_d16",
  3176					      "dpi_ck",
  3177					      "dpi_26m";
  3178				num = <0>;
  3179				phys = <&dp_tx>;
  3180				phy-names = "dp_tx";
  3181			};
  3182	
  3183			dp_intf1: dp-intf@32440000 {
  3184				compatible = "mediatek,mt8196-dp-intf";
  3185				reg = <0 0x32440000 0 0x1000>;
  3186				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
  3187				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF1>,
  3188					 <&dispsys1_config_clk CLK_MM1_MOD5>,
  3189					 <&cksys_gp2_clk CLK_CK2_DP1_SEL>,
  3190					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D4>,
  3191					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D8>,
  3192					 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D16>,
  3193					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL2>,
  3194					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  3195				clock-names = "hf_fmm_ck",
  3196					      "hf_fdp_ck",
  3197					      "mux_dp",
  3198					      "tvdpll_d4",
  3199					      "tvdpll_d8",
  3200					      "tvdpll_d16",
  3201					      "dpi_ck",
  3202					      "dpi_26m";
  3203				num = <1>;
  3204				no-next-bridge;
  3205				phys = <&dp_tx>;
  3206				phy-names = "dp_tx";
  3207				status = "disabled";
  3208			};
  3209	
  3210			disp_dsc0: disp-dsc0-wrap0@32450000 {
  3211				compatible = "mediatek,mt8196-disp-dsc";
  3212				reg = <0 0x32450000 0 0x1000>;
  3213				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP0>;
  3214			};
  3215	
  3216			disp_dsc1: disp-dsc1-wrap1@32460000 {
  3217				compatible = "mediatek,mt8196-disp-dsc";
  3218				reg = <0 0x32460000 0 0x1000>;
  3219				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP1>;
  3220			};
  3221	
  3222			dsi0: dsi@32490000 {
  3223				compatible = "mediatek,mt8196-dsi";
  3224				reg = <0 0x32490000 0 0x1000>;
  3225				interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH 0>;
  3226				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSI0_DISP>,
  3227					 <&dispsys1_config_clk CLK_MM1_MOD1_DISP>,
  3228					 <&mipi_tx_config0>;
  3229				clock-names = "engine", "digital", "hs";
  3230				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DSI_PHY0>;
  3231				phys = <&mipi_tx_config0>;
  3232				phy-names = "dphy";
  3233				status = "disabled";
  3234			};
  3235	
  3236			disp_dvo0: disp-dvo0@324c0000 {
  3237				compatible = "mediatek,mt8196-edp-dvo";
  3238				reg = <0 0x324c0000 0 0x1000>;
  3239				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
  3240				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DVO0_DISP>,
  3241					 <&cksys_gp2_clk CLK_CK2_DVO_SEL>,
  3242					 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL3>,
  3243					 <&dispsys1_config_clk CLK_MM1_MOD6>;
  3244				clock-names = "engine",
  3245					      "pixel",
  3246					      "pll",
  3247					      "hf_fdvo_clk";
  3248				status = "disabled";
  3249			};
  3250	
  3251			smi_larb33: larb@32600000 {
  3252				compatible = "mediatek,mt8196-smi-larb";
  3253				reg = <0 0x32600000 0 0x1000>;
  3254				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
  3255				clocks = <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>,
  3256					 <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>;
  3257				clock-names = "apb", "smi";
  3258				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3259				mediatek,larb-id = <33>;
  3260				larb-port-real-time-type = <0 1 1 1 0 0 0 1 0 0 0 0 0 0 0 1>;
  3261			};
  3262	
  3263			ovlsys_config_clk: syscon@32800000 {
  3264				/* TODO: Fix compatible in driver */
  3265				compatible = "mediatek,mt8196-ovlsys-config", "mediatek,mt8196-ovlsys_config", "syscon";
  3266				reg = <0 0x32800000 0 0x1000>;
  3267				mm-hw-ccf-regmap = <&mm_hwv>;
  3268				mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>,
  3269					 <&gce0 8 CMDQ_THR_PRIO_4>, <&gce0 9 CMDQ_THR_PRIO_4>;
  3270				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3271				#clock-cells = <1>;
  3272	
  3273				async {
  3274					clocks = <&ovlsys_config_clk CLK_OVL_DLO5_DISP>,
  3275						 <&ovlsys_config_clk CLK_OVL_DLO6_DISP>;
  3276				};
  3277			};
  3278	
  3279			ovl0_mutex: mutex@32820000 {
  3280				compatible = "mediatek,mt8196-disp-mutex";
  3281				reg = <0 0x32820000 0 0x1000>;
  3282				clocks = <&ovlsys_config_clk CLK_OVL_MUTEX0_DISP>;
  3283				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
  3284						      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
  3285			};
  3286	
  3287			disp_ovl0_exdma2: dma-controller@32850000 {
  3288				compatible = "mediatek,mt8196-exdma";
  3289				reg = <0 0x32850000 0 0x1000>;
  3290				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA2_DISP>;
  3291				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3292				mediatek,larb = <&smi_larb0>;
  3293				iommus = <&mm_smmu 144>;
  3294				#dma-cells = <1>;
  3295			};
  3296	
  3297			disp_ovl0_exdma3: dma-controller@32860000 {
  3298				compatible = "mediatek,mt8196-exdma";
  3299				reg = <0 0x32860000 0 0x1000>;
  3300				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA3_DISP>;
  3301				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3302				mediatek,larb = <&smi_larb1>;
  3303				#dma-cells = <1>;
  3304			};
  3305	
  3306			disp_ovl0_exdma4: dma-controller@32870000 {
  3307				compatible = "mediatek,mt8196-exdma";
  3308				reg = <0 0x32870000 0 0x1000>;
  3309				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA4_DISP>;
  3310				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3311				mediatek,larb = <&smi_larb20>;
  3312				#dma-cells = <1>;
  3313			};
  3314	
  3315			disp_ovl0_exdma5: dma-controller@32880000 {
  3316				compatible = "mediatek,mt8196-exdma";
  3317				reg = <0 0x32880000 0 0x1000>;
  3318				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA5_DISP>;
  3319				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3320				mediatek,larb = <&smi_larb21>;
  3321				#dma-cells = <1>;
  3322			};
  3323	
  3324			disp_ovl0_exdma6: dma-controller@32890000 {
  3325				compatible = "mediatek,mt8196-exdma";
  3326				reg = <0 0x32890000 0 0x1000>;
  3327				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA6_DISP>;
  3328				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3329				mediatek,larb = <&smi_larb1 SMMU_L1_P3_OVL_RDMA6>;
  3330				#dma-cells = <1>;
  3331			};
  3332	
  3333			disp_ovl0_exdma7: dma-controller@328a0000 {
  3334				compatible = "mediatek,mt8196-exdma";
  3335				reg = <0 0x328a0000 0 0x1000>;
  3336				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA7_DISP>;
  3337				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3338				mediatek,larb = <&smi_larb0>;
  3339				#dma-cells = <1>;
  3340			};
  3341	
  3342			disp_ovl0_exdma8: dma-controller@328b0000 {
  3343				compatible = "mediatek,mt8196-exdma";
  3344				reg = <0 0x328b0000 0 0x1000>;
  3345				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA8_DISP>;
  3346				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3347				mediatek,larb = <&smi_larb21>;
  3348				#dma-cells = <1>;
  3349			};
  3350	
  3351			disp_ovl0_exdma9: dma-controller@328c0000 {
  3352				compatible = "mediatek,mt8196-exdma";
  3353				reg = <0 0x328c0000 0 0x1000>;
  3354				clocks = <&ovlsys_config_clk CLK_OVL_EXDMA9_DISP>;
  3355				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3356				mediatek,larb = <&smi_larb20>;
  3357				#dma-cells = <1>;
  3358			};
  3359	
  3360			disp_ovl0_blender0: blender@328d0000 {
  3361				compatible = "mediatek,mt8196-blender";
  3362				reg = <0 0x328d0000 0 0x1000>;
  3363				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER0_DISP>;
  3364			};
  3365	
  3366			disp_ovl0_blender1: blender@328e0000 {
  3367				compatible = "mediatek,mt8196-blender";
  3368				reg = <0 0x328e0000 0 0x1000>;
  3369				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER1_DISP>;
  3370			};
  3371	
  3372			disp_ovl0_blender2: blender@328f0000 {
  3373				compatible = "mediatek,mt8196-blender";
  3374				reg = <0 0x328f0000 0 0x1000>;
  3375				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER2_DISP>;
  3376			};
  3377	
  3378			disp_ovl0_blender3: blender@32900000 {
  3379				compatible = "mediatek,mt8196-blender";
  3380				reg = <0 0x32900000 0 0x1000>;
  3381				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER3_DISP>;
  3382			};
  3383	
  3384			disp_ovl0_blender4: blender@32910000 {
  3385				compatible = "mediatek,mt8196-blender";
  3386				reg = <0 0x32910000 0 0x1000>;
  3387				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER4_DISP>;
  3388			};
  3389	
  3390			disp_ovl0_blender5: blender@32920000 {
  3391				compatible = "mediatek,mt8196-blender";
  3392				reg = <0 0x32920000 0 0x1000>;
  3393				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER5_DISP>;
  3394			};
  3395	
  3396			disp_ovl0_blender6: blender@32930000 {
  3397				compatible = "mediatek,mt8196-blender";
  3398				reg = <0 0x32930000 0 0x1000>;
  3399				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER6_DISP>;
  3400			};
  3401	
  3402			disp_ovl0_blender7: blender@32940000 {
  3403				compatible = "mediatek,mt8196-blender";
  3404				reg = <0 0x32940000 0 0x1000>;
  3405				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER7_DISP>;
  3406			};
  3407	
  3408			disp_ovl0_blender8: blender@32950000 {
  3409				compatible = "mediatek,mt8196-blender";
  3410				reg = <0 0x32950000 0 0x1000>;
  3411				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER8_DISP>;
  3412			};
  3413	
  3414			disp_ovl0_blender9: blender@32960000 {
  3415				compatible = "mediatek,mt8196-blender";
  3416				reg = <0 0x32960000 0 0x1000>;
  3417				clocks = <&ovlsys_config_clk CLK_OVL_BLENDER9_DISP>;
  3418			};
  3419	
  3420			disp_ovl0_outproc0: outproc@32970000 {
  3421				compatible = "mediatek,mt8196-outproc";
  3422				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC0_DISP>;
  3423				interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH 0>;
  3424				reg = <0 0x32970000 0 0x1000>;
  3425				mediatek,gce-events = <CMDQ_EVENT_OVL0_FRAME_DONE_SEL0>;
  3426				mboxes = <&gce0 3 CMDQ_THR_PRIO_4>;
  3427			};
  3428	
  3429			disp_ovl0_outproc1: outproc@32980000 {
  3430				compatible = "mediatek,mt8196-outproc";
  3431				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC1_DISP>;
  3432				interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH 0>;
  3433				reg = <0 0x32980000 0 0x1000>;
  3434			};
  3435	
  3436			disp_ovl0_outproc2: outproc@32990000 {
  3437				compatible = "mediatek,mt8196-outproc";
  3438				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC2_DISP>;
  3439				reg = <0 0x32990000 0 0x1000>;
  3440			};
  3441	
  3442			disp_ovl0_outproc3: outproc@329a0000 {
  3443				compatible = "mediatek,mt8196-outproc";
  3444				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC3_DISP>;
  3445				reg = <0 0x329a0000 0 0x1000>;
  3446			};
  3447	
  3448			disp_ovl0_outproc4: outproc@329b0000 {
  3449				compatible = "mediatek,mt8196-outproc";
  3450				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC4_DISP>;
  3451				reg = <0 0x329b0000 0 0x1000>;
  3452			};
  3453	
  3454			disp_ovl0_outproc5: outproc@329c0000 {
  3455				compatible = "mediatek,mt8196-outproc";
  3456				clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC5_DISP>;
  3457				reg = <0 0x329c0000 0 0x1000>;
  3458			};
  3459	
  3460			smi_larb0: larb@32a60000 {
  3461				compatible = "mediatek,mt8196-smi-larb";
  3462				reg = <0 0x32a60000 0 0x1000>;
  3463				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3464				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3465					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3466				clock-names = "apb", "smi";
  3467				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  3468				mediatek,larb-id = <0>;
  3469				larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
  3470			};
  3471	
  3472			smi_larb1: larb@32a70000 {
  3473				compatible = "mediatek,mt8196-smi-larb";
  3474				reg = <0 0x32a70000 0 0x1000>;
  3475				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3476				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3477					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3478				clock-names = "apb", "smi";
  3479				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3480				mediatek,larb-id = <1>;
  3481				larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
  3482			};
  3483	
  3484			smi_larb20: larb@32a80000 {
  3485				compatible = "mediatek,mt8196-smi-larb";
  3486				reg = <0 0x32a80000 0 0x1000>;
  3487				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3488				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3489					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3490				clock-names = "apb", "smi";
  3491				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3492				mediatek,larb-id = <20>;
  3493				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
  3494			};
  3495	
  3496			smi_larb21: larb@32a90000 {
  3497				compatible = "mediatek,mt8196-smi-larb";
  3498				reg = <0 0x32a90000 0 0x1000>;
  3499				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
  3500				clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
  3501					 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
  3502				clock-names = "apb", "smi";
  3503				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3504				mediatek,larb-id = <21>;
  3505				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
  3506			};
  3507	
  3508			ovlsys1_config_clk: syscon@32c00000 {
  3509				/* TODO: Fix compatible in driver */
  3510				compatible = "mediatek,mt8196-ovlsys1-config", "mediatek,mt8196-ovlsys1_config", "syscon";
  3511				reg = <0 0x32c00000 0 0x1000>;
  3512				mm-hw-ccf-regmap = <&mm_hwv>;
  3513				mboxes = <&gce0 2 CMDQ_THR_PRIO_4>, <&gce0 10 CMDQ_THR_PRIO_4>;
  3514				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3515				#clock-cells = <1>;
  3516	
  3517				async {
  3518					clocks = <&ovlsys1_config_clk CLK_OVL_DLO5_DISP>,
  3519						 <&ovlsys1_config_clk CLK_OVL_DLO6_DISP>;
  3520				};
  3521			};
  3522	
  3523			ovl1_mutex: mutex@32c20000 {
  3524				compatible = "mediatek,mt8196-disp-mutex";
  3525				reg = <0 0x32c20000 0 0x1000>;
  3526				clocks = <&ovlsys1_config_clk CLK_OVL_MUTEX0_DISP>;
  3527				mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT2>;
  3528			};
  3529	
  3530			disp_ovl1_exdma2: dma-controller@32c50000 {
  3531				compatible = "mediatek,mt8196-exdma";
  3532				reg = <0 0x32c50000 0 0x1000>;
  3533				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA2_DISP>;
  3534				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3535				mediatek,larb = <&smi_larb34>;
  3536				#dma-cells = <1>;
  3537			};
  3538	
  3539			disp_ovl1_exdma3: dma-controller@32c60000 {
  3540				compatible = "mediatek,mt8196-exdma";
  3541				reg = <0 0x32c60000 0 0x1000>;
  3542				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA3_DISP>;
  3543				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3544				mediatek,larb = <&smi_larb35>;
  3545				#dma-cells = <1>;
  3546			};
  3547	
  3548			disp_ovl1_exdma4: dma-controller@32c70000 {
  3549				compatible = "mediatek,mt8196-exdma";
  3550				reg = <0 0x32c70000 0 0x1000>;
  3551				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA4_DISP>;
  3552				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3553				mediatek,larb = <&smi_larb36>;
  3554				#dma-cells = <1>;
  3555			};
  3556	
  3557			disp_ovl1_exdma5: dma-controller@32c80000 {
  3558				compatible = "mediatek,mt8196-exdma";
  3559				reg = <0 0x32c80000 0 0x1000>;
  3560				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA5_DISP>;
  3561				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3562				mediatek,larb = <&smi_larb37>;
  3563				#dma-cells = <1>;
  3564			};
  3565	
  3566			disp_ovl1_exdma6: dma-controller@32c90000 {
  3567				compatible = "mediatek,mt8196-exdma";
  3568				reg = <0 0x32c90000 0 0x1000>;
  3569				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA6_DISP>;
  3570				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3571				mediatek,larb = <&smi_larb35>;
  3572				#dma-cells = <1>;
  3573			};
  3574	
  3575			disp_ovl1_exdma7: dma-controller@32ca0000 {
  3576				compatible = "mediatek,mt8196-exdma";
  3577				reg = <0 0x32ca0000 0 0x1000>;
  3578				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA7_DISP>;
  3579				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3580				mediatek,larb = <&smi_larb34>;
  3581				#dma-cells = <1>;
  3582			};
  3583	
  3584			disp_ovl1_exdma8: dma-controller@32cb0000 {
  3585				compatible = "mediatek,mt8196-exdma";
  3586				reg = <0 0x32cb0000 0 0x1000>;
  3587				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA8_DISP>;
  3588				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3589				mediatek,larb = <&smi_larb37>;
  3590				#dma-cells = <1>;
  3591			};
  3592	
  3593			disp_ovl1_exdma9: dma-controller@32cc0000 {
  3594				compatible = "mediatek,mt8196-exdma";
  3595				reg = <0 0x32cc0000 0 0x1000>;
  3596				clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA9_DISP>;
  3597				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3598				mediatek,larb = <&smi_larb36>;
  3599				#dma-cells = <1>;
  3600			};
  3601	
  3602			disp_ovl1_blender0: blender@32cd0000 {
  3603				compatible = "mediatek,mt8196-blender";
  3604				reg = <0 0x32cd0000 0 0x1000>;
  3605				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER0_DISP>;
  3606			};
  3607	
  3608			disp_ovl1_blender1: blender@32ce0000 {
  3609				compatible = "mediatek,mt8196-blender";
  3610				reg = <0 0x32ce0000 0 0x1000>;
  3611				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER1_DISP>;
  3612			};
  3613	
  3614			disp_ovl1_blender2: blender@32cf0000 {
  3615				compatible = "mediatek,mt8196-blender";
  3616				reg = <0 0x32cf0000 0 0x1000>;
  3617				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER2_DISP>;
  3618			};
  3619	
  3620			disp_ovl1_blender3: blender@32d00000 {
  3621				compatible = "mediatek,mt8196-blender";
  3622				reg = <0 0x32d00000 0 0x1000>;
  3623				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER3_DISP>;
  3624			};
  3625	
  3626			disp_ovl1_blender4: blender@32d10000 {
  3627				compatible = "mediatek,mt8196-blender";
  3628				reg = <0 0x32d10000 0 0x1000>;
  3629				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER4_DISP>;
  3630			};
  3631	
  3632			disp_ovl1_blender5: blender@32d20000 {
  3633				compatible = "mediatek,mt8196-blender";
  3634				reg = <0 0x32d20000 0 0x1000>;
  3635				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER5_DISP>;
  3636			};
  3637	
  3638			disp_ovl1_blender6: blender@32d30000 {
  3639				compatible = "mediatek,mt8196-blender";
  3640				reg = <0 0x32d30000 0 0x1000>;
  3641				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER6_DISP>;
  3642			};
  3643	
  3644			disp_ovl1_blender7: blender@32d40000 {
  3645				compatible = "mediatek,mt8196-blender";
  3646				reg = <0 0x32d40000 0 0x1000>;
  3647				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER7_DISP>;
  3648			};
  3649	
  3650			disp_ovl1_blender8: blender@32d50000 {
  3651				compatible = "mediatek,mt8196-blender";
  3652				reg = <0 0x32d50000 0 0x1000>;
  3653				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER8_DISP>;
  3654			};
  3655	
  3656			disp_ovl1_blender9: blender@32d60000 {
  3657				compatible = "mediatek,mt8196-blender";
  3658				reg = <0 0x32d60000 0 0x1000>;
  3659				clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER9_DISP>;
  3660			};
  3661	
  3662			disp_ovl1_outproc0: outproc@32d70000 {
  3663				compatible = "mediatek,mt8196-outproc";
  3664				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC0_DISP>;
  3665				interrupts = <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH 0>;
  3666				reg = <0 0x32d70000 0 0x1000>;
  3667			};
  3668	
  3669			disp_ovl1_outproc1: outproc@32d80000 {
  3670				compatible = "mediatek,mt8196-outproc";
  3671				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC1_DISP>;
  3672				reg = <0 0x32d80000 0 0x1000>;
  3673			};
  3674	
  3675			disp_ovl1_outproc2: outproc@32d90000 {
  3676				compatible = "mediatek,mt8196-outproc";
  3677				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC2_DISP>;
  3678				reg = <0 0x32d90000 0 0x1000>;
  3679			};
  3680	
  3681			disp_ovl1_outproc3: outproc@32da0000 {
  3682				compatible = "mediatek,mt8196-outproc";
  3683				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC3_DISP>;
  3684				reg = <0 0x32da0000 0 0x1000>;
  3685			};
  3686	
  3687			disp_ovl1_outproc4: outproc@32db0000 {
  3688				compatible = "mediatek,mt8196-outproc";
  3689				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC4_DISP>;
  3690				reg = <0 0x32db0000 0 0x1000>;
  3691			};
  3692	
  3693			disp_ovl1_outproc5: outproc@32dc0000 {
  3694				compatible = "mediatek,mt8196-outproc";
  3695				clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC5_DISP>;
  3696				reg = <0 0x32dc0000 0 0x1000>;
  3697			};
  3698	
  3699			smi_larb34: larb@32e60000 {
  3700				compatible = "mediatek,mt8196-smi-larb";
  3701				reg = <0 0x32e60000 0 0x1000>;
  3702				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3703				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3704					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3705				clock-names = "apb", "smi";
  3706				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  3707				mediatek,larb-id = <34>;
  3708				larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
  3709			};
  3710	
  3711			smi_larb35: larb@32e70000 {
  3712				compatible = "mediatek,mt8196-smi-larb";
  3713				reg = <0 0x32e70000 0 0x1000>;
  3714				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3715				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3716					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3717				clock-names = "apb", "smi";
  3718				mediatek,smi = <&smi_mdp_dram_sub_comm2>;
  3719				mediatek,larb-id = <35>;
  3720				larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
  3721			};
  3722	
  3723			smi_larb36: larb@32e80000 {
  3724				compatible = "mediatek,mt8196-smi-larb";
  3725				reg = <0 0x32e80000 0 0x1000>;
  3726				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3727				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3728					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3729				clock-names = "apb", "smi";
  3730				mediatek,smi = <&smi_disp_dram_sub_comm1>;
  3731				mediatek,larb-id = <36>;
  3732				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
  3733			};
  3734	
  3735			smi_larb37: larb@32e90000 {
  3736				compatible = "mediatek,mt8196-smi-larb";
  3737				reg = <0 0x32e90000 0 0x1000>;
  3738				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
  3739				clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
  3740					 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
  3741				clock-names = "apb", "smi";
  3742				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  3743				mediatek,larb-id = <37>;
  3744				larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
  3745			};
  3746	
  3747			video_codec: video@36000000 {
  3748				compatible = "mediatek,mt8196-vcodec-dec";
  3749				mediatek,vcp = <&vcp>;
  3750				iommus = <&mm_smmu 177>;
  3751				#address-cells = <2>;
  3752				#size-cells = <2>;
  3753				reg = <0 0x36000000 0 0x1000>,
  3754					<0 0x36098000 0 0x1000>;
  3755				ranges = <0 0 0 0x36000000 0 0x26000>;
  3756	
  3757				video-codec@10000 {
  3758					compatible = "mediatek,mtk-vcodec-lat";
  3759					reg = <0 0x10000 0 0x800>;
  3760					interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
  3761					clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>,
  3762						<&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3763						<&vdec_soc_gcon_base_clk CLK_VDE1_LAT_CKEN>,
  3764						<&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
  3765					clock-names = "sel", "vdec", "lat", "top";
  3766					assigned-clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>;
  3767					assigned-clock-parents = <&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
  3768					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3769				};
  3770	
  3771				video-codec@25000 {
  3772					compatible = "mediatek,mtk-vcodec-core";
  3773					reg = <0 0x25000 0 0x1000>;		/* VDEC_CORE_MISC */
  3774					interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH 0>;
  3775					clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>,
  3776						<&vdec_gcon_base_clk CLK_VDE2_LAT_CKEN>,
  3777						<&vdec_gcon_base_clk CLK_VDE2_VDEC_CKEN>,
  3778						<&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
  3779					clock-names = "sel", "vdec", "lat", "top";
  3780					assigned-clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>;
  3781					assigned-clock-parents = <&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
  3782					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
  3783				};
  3784			};
  3785	
  3786			smi_larb5: larb@3600d000 {
  3787				compatible = "mediatek,mt8196-smi-larb";
  3788				reg = <0 0x3600d000 0 0x1000>;
  3789				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3790				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3791					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3792				clock-names = "apb", "smi";
  3793				mediatek,smi = <&smi_disp_common>;
  3794				mediatek,larb-id = <5>;
  3795				larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
  3796			};
  3797	
  3798			smi_larb6: larb@3600e000 {
  3799				compatible = "mediatek,mt8196-smi-larb";
  3800				reg = <0 0x3600e000 0 0x1000>;
  3801				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3802				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3803					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3804				clock-names = "apb", "smi";
  3805				mediatek,smi = <&smi_mdp_common>;
  3806				mediatek,larb-id = <6>;
  3807				larb-port-real-time-type = <1 1 1>;
  3808			};
  3809	
  3810			vdec_soc_gcon_base_clk: syscon@3600f000 {
  3811				/* TODO: Fix compatible in driver */
  3812				compatible = "mediatek,mt8196-vdecsys-soc", "mediatek,mt8196-vdecsys_soc", "syscon";
  3813				reg = <0 0x3600f000 0 0x1000>;
  3814				#clock-cells = <1>;
  3815				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
  3816			};
  3817	
  3818			smi_larb4: larb@3602e000 {
  3819				compatible = "mediatek,mt8196-smi-larb";
  3820				reg = <0 0x3602e000 0 0x1000>;
  3821				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
  3822				clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
  3823					 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
  3824				clock-names = "apb", "smi";
  3825				mediatek,smi = <&smi_mdp_common>;
  3826				mediatek,larb-id = <4>;
  3827				larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
  3828			};
  3829	
  3830			vdec_gcon_base_clk: syscon@3602f000 {
  3831				compatible = "mediatek,mt8196-vdecsys", "syscon";
  3832				reg = <0 0x3602f000 0 0x1000>;
  3833				#clock-cells = <1>;
  3834				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
  3835			};
  3836	
  3837			venc_gcon_clk: syscon@38000000 {
  3838				compatible = "mediatek,mt8196-vencsys", "syscon";
  3839				reg = <0 0x38000000 0 0x1000>;
  3840				mm-hw-ccf-regmap = <&mm_hwv>;
  3841				#clock-cells = <1>;
  3842				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3843			};
  3844	
  3845			smi_larb7: larb@38010000 {
  3846				compatible = "mediatek,mt8196-smi-larb";
  3847				reg = <0 0x38010000 0 0x1000>;
  3848				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3849				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3850					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3851				clock-names = "apb", "smi";
  3852				mediatek,smi = <&smi_disp_venc_sub_comm0>;
  3853				mediatek,larb-id = <7>;
  3854				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3855			};
  3856	
  3857			venc: video-codec@38020000 {
  3858				compatible = "mediatek,mt8196-vcodec-enc";
  3859				reg = <0 0x38020000 0 0x6000>;
  3860				mediatek,vcp = <&vcp>;
  3861				iommus = <&mm_smmu 176>;
  3862				interrupts = <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH 0>;
  3863				clocks = <&venc_gcon_clk CLK_VEN1_CKE1_VENC>;
  3864				clock-names = "venc_sel";
  3865				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3866			};
  3867	
  3868			smi_disp_venc_sub_comm0: smi-sub-comm@38070000 {
  3869				compatible = "mediatek,mt8196-smi-sub-common";
  3870				reg = <0 0x38070000 0 0x1000>;
  3871				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3872				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3873					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3874				clock-names = "apb", "smi";
  3875				mediatek,smi = <&smi_disp_common>;
  3876				mediatek,common-id = <15>;
  3877			};
  3878	
  3879			smi_larb41: larb@38090000 {
  3880				compatible = "mediatek,mt8196-smi-larb";
  3881				reg = <0 0x38090000 0 0x1000>;
  3882				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  3883				clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
  3884					 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
  3885				clock-names = "apb", "smi";
  3886				mediatek,smi = <&smi_disp_venc_sub_comm0>;
  3887				mediatek,larb-id = <41>;
  3888				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3889			};
  3890	
  3891			venc_gcon_core1_clk: syscon@38800000 {
  3892				/* TODO: Fix compatible in driver */
  3893				compatible = "mediatek,mt8196-vencsys-c1", "mediatek,mt8196-vencsys_c1", "syscon";
  3894				reg = <0 0x38800000 0 0x1000>;
  3895				mm-hw-ccf-regmap = <&mm_hwv>;
  3896				#clock-cells = <1>;
  3897				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3898			};
  3899	
  3900			smi_larb8: larb@38810000 {
  3901				compatible = "mediatek,mt8196-smi-larb";
  3902				reg = <0 0x38810000 0 0x1000>;
  3903				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3904				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  3905					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  3906				clock-names = "apb", "smi";
  3907				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  3908				mediatek,larb-id = <8>;
  3909				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3910			};
  3911	
  3912	
  3913			smi_mdp_venc_sub_comm1: smi-sub-comm@38870000 {
  3914				compatible = "mediatek,mt8196-smi-sub-common";
  3915				reg = <0 0x38870000 0 0x1000>;
  3916				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3917				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  3918					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  3919				clock-names = "apb", "smi";
  3920				mediatek,smi = <&smi_mdp_common>;
  3921				mediatek,common-id = <16>;
  3922			};
  3923	
  3924			smi_larb42: larb@38890000 {
  3925				compatible = "mediatek,mt8196-smi-larb";
  3926				reg = <0 0x38890000 0 0x1000>;
  3927				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  3928				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
  3929					 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
  3930				clock-names = "apb", "smi";
  3931				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  3932				mediatek,larb-id = <42>;
  3933				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3934			};
  3935	
  3936			venc_gcon_core2_clk: syscon@38c00000 {
  3937				/* TODO: Fix compatible in driver */
  3938				compatible = "mediatek,mt8196-vencsys-c2", "mediatek,mt8196-vencsys_c2", "syscon";
  3939				reg = <0 0x38c00000 0 0x1000>;
  3940				mm-hw-ccf-regmap = <&mm_hwv>;
  3941				#clock-cells = <1>;
  3942				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3943			};
  3944	
  3945			smi_larb24: larb@38c10000 {
  3946				compatible = "mediatek,mt8196-smi-larb";
  3947				reg = <0 0x38c10000 0 0x1000>;
  3948				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3949				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  3950					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  3951				clock-names = "apb", "smi";
  3952				mediatek,smi = <&smi_mdp_venc_sub_comm2>;
  3953				mediatek,larb-id = <24>;
  3954				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3955			};
  3956	
  3957			smi_mdp_venc_sub_comm2: smi-sub-comm@38c70000 {
  3958				compatible = "mediatek,mt8196-smi-sub-common";
  3959				reg = <0 0x38c70000 0 0x1000>;
  3960				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3961				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  3962					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  3963				clock-names = "apb", "smi";
  3964				mediatek,smi = <&smi_mdp_venc_sub_comm1>;
  3965				mediatek,common-id = <18>;
  3966			};
  3967	
  3968			smi_larb47: larb@38c90000 {
  3969				compatible = "mediatek,mt8196-smi-larb";
  3970				reg = <0 0x38c90000 0 0x1000>;
  3971				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
  3972				clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
  3973					 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
  3974				clock-names = "apb", "smi";
  3975				mediatek,smi = <&smi_mdp_venc_sub_comm2>;
  3976				mediatek,larb-id = <47>;
  3977				larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
  3978			};
  3979	
  3980			cam_main_r1a_clk: syscon@3a000000 {
  3981				/* TODO: Fix compatible in driver */
  3982				compatible = "mediatek,mt8196-cam_main-r1a", "mediatek,mt8196-cam_main_r1a", "syscon";
  3983				reg = <0 0x3a000000 0 0x1000>;
  3984				mm-hw-ccf-regmap = <&mm_hwv>;
  3985				#clock-cells = <1>;
  3986			};
  3987	
  3988			mdpsys_config_clk: syscon@3e000000 {
  3989				compatible = "mediatek,mt8196-mdpsys", "syscon";
  3990				reg = <0 0x3e000000 0 0x1000>;
  3991				#clock-cells = <1>;
  3992				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
  3993			};
  3994	
  3995			smi_larb2: larb@3e030000 {
  3996				compatible = "mediatek,mt8196-smi-larb";
  3997				reg = <0 0x3e030000 0 0x1000>;
  3998				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
  3999				clocks = <&mdpsys_config_clk CLK_MDP_SMI0_SMI>, <&mdpsys_config_clk CLK_MDP_SMI0_SMI>;
  4000				clock-names = "apb", "smi";
  4001				mediatek,smi = <&smi_disp_dram_sub_comm0>;
  4002				mediatek,larb-id = <2>;
  4003				larb-port-real-time-type = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
  4004			};
  4005	
  4006			mdpsys1_config_clk: syscon@3e400000 {
  4007				compatible = "mediatek,mt8196-mdpsys1", "syscon";
  4008				reg = <0 0x3e400000 0 0x1000>;
  4009				#clock-cells = <1>;
  4010				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
  4011			};
  4012	
  4013			smi_larb3: larb@3e430000 {
  4014				compatible = "mediatek,mt8196-smi-larb";
  4015				reg = <0 0x3e430000 0 0x1000>;
  4016				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
  4017				clocks = <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>, <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>;
  4018				clock-names = "apb", "smi";
  4019				mediatek,smi = <&smi_mdp_dram_sub_comm3>;
  4020				mediatek,larb-id = <3>;
  4021				larb-port-real-time-type = <2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 1 2>;
  4022			};
  4023	
  4024			disp_vdisp_ao_config_clk: syscon@3e800000 {
  4025				/* TODO: Fix compatible in driver */
  4026				compatible = "mediatek,mt8196-disp-vdisp-ao-config", "mediatek,mt8196-disp_vdisp_ao_config", "syscon";
  4027				reg = <0 0x3e800000 0 0x1000>;
  4028				mm-hw-ccf-regmap = <&mm_hwv>;
  4029				#clock-cells = <1>;
  4030				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4031			};
  4032	
  4033			smi_disp_dram_sub_comm0: smi-sub-comm@3e810000 {
  4034				compatible = "mediatek,mt8196-smi-sub-common";
  4035				reg = <0 0x3e810000 0 0x1000>;
  4036				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4037				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  4038						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  4039				clock-names = "apb", "smi";
  4040				mediatek,smi = <&smi_disp_common>;
  4041				mediatek,common-id = <9>;
  4042			};
  4043	
  4044			smi_disp_dram_sub_comm1: smi-sub-comm@3e820000 {
  4045				compatible = "mediatek,mt8196-smi-sub-common";
  4046				reg = <0 0x3e820000 0 0x1000>;
  4047				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4048				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  4049						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  4050				clock-names = "apb", "smi";
  4051				mediatek,smi = <&smi_disp_common>;
  4052				mediatek,common-id = <10>;
  4053			};
  4054	
  4055			smi_mdp_dram_sub_comm2: smi-sub-comm@3e830000 {
  4056				compatible = "mediatek,mt8196-smi-sub-common";
  4057				reg = <0 0x3e830000 0 0x1000>;
  4058				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4059				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  4060						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  4061				clock-names = "apb", "smi";
  4062				mediatek,smi = <&smi_mdp_common>;
  4063				mediatek,common-id = <11>;
  4064			};
  4065	
  4066			smi_mdp_dram_sub_comm3: smi-sub-comm@3e840000 {
  4067				compatible = "mediatek,mt8196-smi-sub-common";
  4068				reg = <0 0x3e840000 0 0x1000>;
  4069				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
  4070				clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
  4071						 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
  4072				clock-names = "apb", "smi";
  4073				mediatek,smi = <&smi_mdp_common>;
  4074				mediatek,common-id = <12>;
  4075			};
  4076	
  4077			dp_tx: dp-tx@3ec00000 {
  4078				compatible = "mediatek,mt8196-dp-tx";
  4079				reg = <0 0x3ec00000 0 0x5000>,
  4080				      <0 0x128b0000 0 0x1500>,
  4081				      <0 0x1002d600 0 0x4>,
  4082				      <0 0x31b50078 0 0x4>;
  4083				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT>,
  4084						<&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
  4085				power-domain-names = "pd_dp_tx", "pd_dp_phy";
  4086				interrupts = <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH 0>;
  4087				dptx,phy-params = <0x221c1814 0x24241e18 0x0000302a
  4088						   0x0e080400 0x000c0600 0x00000006>;
  4089				#phy-cells = <0>;
  4090				clocks = <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
  4091					 <&cksys_clk CLK_CK_TCK_26M_MX9>;
  4092				clock-names = "mux_dp",
  4093					      "ck_26m";
  4094			};
  4095	
  4096			edp_tx: edp-tx@3ec40000 {
  4097				compatible = "mediatek,mt8196-edp-tx";
  4098				reg = <0 0x3ec40000 0 0x4000>,
  4099				      <0 0x130a0000 0 0x1500>,
  4100				      <0 0x31b50074 0 0x4>;
  4101				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT>;
  4102				clocks = <&cksys_gp2_clk CLK_CK2_DVO_SEL>;
  4103				clock-names = "power";
  4104				max-linkrate-mhz = <8100>;
  4105				interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH 0>;
  4106				status = "disabled";
  4107			};
  4108	
  4109			gpu: gpu@48000000 {
  4110				compatible = "mediatek,mali-mt8196", "mediatek,mali";
  4111				reg = <0 0x48000000 0 0x480000>;
  4112				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
  4113					     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
  4114					     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>,
  4115					     <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH 0>,
  4116					     <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>,
  4117					     <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH 0>;
  4118				interrupt-names = "job",
  4119						  "mmu",
  4120						  "gpu",
  4121						  "event",
  4122						  "pwr",
  4123						  "gpueb_mbox1";
  4124				l2-hash-values = <0xb 0xe 0x0>;
  4125				physical-memory-group-manager = <&mgm>;
  4126				protected-memory-allocator = <&gpu_protected_memory_allocator>;
  4127				operating-points-v2 = <&gpu_mali_opp>;
  4128				#cooling-cells = <2>;
  4129				ged-supply = <&ged>;
  4130				system-coherency = <31>;
  4131				sleep-mode-enable;
  4132				firmware-idle-hysteresis-time-us = <0>;
  4133				default-glb-pwroff-timeout-us = <10>;
  4134				autosuspend-delay-ms = <10>;
  4135				adaptive-power-policy = <2>;
  4136				reset-exception-mask = <0x0>;
  4137				iter-trace-enable = <1>;
  4138				gpu-frame-base-optimize = <1>;
  4139	
  4140				pbha {
  4141					propagate-bits = /bits/ 8 <0xf>;
  4142				};
  4143			};
  4144	
  4145			gpufreq: gpufreq@48500000 {
  4146				compatible = "mediatek,gpufreq";
  4147				reg = <0 0x48500000 0 0x1000>,   /* MFG_TOP_CONFIG */
  4148				      <0 0x48600000 0 0x200000>, /* MFG_SMMU */
  4149				      <0 0x48800000 0 0x1000>,   /* MFG_VGPU_BUS_DBG_TRACKER */
  4150				      <0 0x4b190000 0 0x20000>,  /* MFG_GPUEB_BUS_DBG_TRACKER */
  4151				      <0 0x4b800000 0 0x10000>,  /* MFG_RPC */
  4152				      <0 0x4b810000 0 0x400>,    /* MFG_PLL */
  4153				      <0 0x4b810400 0 0x400>,    /* MFG_PLL_SC0 */
  4154				      <0 0x4b810800 0 0x400>,    /* MFG_PLL_SC1 */
  4155				      <0 0x4b840000 0 0x1000>,   /* MFG_HBVC */
  4156				      <0 0x4b860000 0 0x1000>,   /* MFG_VCORE_AO_CFG */
  4157				      <0 0x4b8b0000 0 0x1000>,   /* MFG_VCORE_DEVAPC */
  4158				      <0 0x4b900000 0 0x1000>,   /* MFG_VCORE_BUS_DBG_TRACKER */
  4159				      <0 0x0c000000 0 0x1000>,   /* MCUSYS_PAR_WRAP */
  4160				      <0 0x10000000 0 0x1000>,   /* CKSYS */
  4161				      <0 0x10404000 0 0x1000>,   /* NTH_EMICFG_AO_MEM */
  4162				      <0 0x10416000 0 0x1000>,   /* NTH_EMI_AO_DEBUG_CTRL */
  4163				      <0 0x10425000 0 0x1000>,   /* NTH_EMICFG */
  4164				      <0 0x10469000 0 0x1000>,   /* EMI */
  4165				      <0 0x10504000 0 0x1000>,   /* STH_EMICFG_AO_MEM */
  4166				      <0 0x10516000 0 0x1000>,   /* STH_EMI_AO_DEBUG_CTRL */
  4167				      <0 0x10525000 0 0x1000>,   /* STH_EMICFG */
  4168				      <0 0x10569000 0 0x1000>,   /* SUB_EMI */
  4169				      <0 0x10621000 0 0x1000>,   /* SEMI_MI32_SMI */
  4170				      <0 0x10622000 0 0x1000>,   /* NEMI_MI32_SMI */
  4171				      <0 0x10623000 0 0x1000>,   /* SEMI_MI33_SMI */
  4172				      <0 0x10624000 0 0x1000>,   /* NEMI_MI33_SMI */
  4173				      <0 0x10644000 0 0x1000>,   /* INFRA_AO_DEBUG_CTRL */
  4174				      <0 0x10645000 0 0x1000>,   /* EMI_INFRA_AO_BCRM */
  4175				      <0 0x10646000 0 0x1000>,   /* EMI_INFRA_AO_MEM */
  4176				      <0 0x10648000 0 0x1000>,   /* EMI_INFRA_CFG */
  4177				      <0 0x1c004000 0 0x10000>;  /* SLEEP */
  4178				reg-names = "mfg_top_config",
  4179					    "mfg_smmu",
  4180					    "mfg_vgpu_bus_trk",
  4181					    "mfg_gpueb_bus_trk",
  4182					    "mfg_rpc",
  4183					    "mfg_pll",
  4184					    "mfg_pll_sc0",
  4185					    "mfg_pll_sc1",
  4186					    "mfg_hbvc",
  4187					    "mfg_vcore_ao_cfg",
  4188					    "mfg_vcore_devapc",
  4189					    "mfg_vcore_bus_trk",
  4190					    "mcusys_par_wrap",
  4191					    "cksys",
  4192					    "nth_emicfg_ao_mem",
  4193					    "nth_emi_ao_debug_ctrl",
  4194					    "nth_emicfg",
  4195					    "emi",
  4196					    "sth_emicfg_ao_mem",
  4197					    "sth_emi_ao_debug_ctrl",
  4198					    "sth_emicfg",
  4199					    "sub_emi",
  4200					    "semi_mi32_smi",
  4201					    "nemi_mi32_smi",
  4202					    "semi_mi33_smi",
  4203					    "nemi_mi33_smi",
  4204					    "infra_ao_debug_ctrl",
  4205					    "emi_infra_ao_bcrm",
  4206					    "emi_infra_ao_mem",
  4207					    "emi_infra_cfg",
  4208					    "sleep";
  4209				gpufreq-wrapper-supply = <&gpufreq_wrapper>;
  4210			};
  4211	
  4212			gpupdma: gpupdma@48540000 {
  4213				compatible = "mediatek,gpupdma";
  4214				reg = <0 0x48540000 0 0x2000>,
  4215				      <0 0x4b800704 0 0x4>,
  4216				      <0 0x13f840 0 0x28>;
  4217				ringbuf-page-order = <3>;
  4218				config-mode = <1>;
  4219				hw-semaphore-bit = <1>;
  4220			};
  4221	
  4222			gpu_smmu: iommu@48600000 {
  4223				#iommu-cells = <1>;
  4224				compatible = "mediatek,mt8196-gpu-smmu", "arm,smmu-v3";
  4225				reg = <0 0x48600000 0 0x1e0000>;
  4226				interrupts = <GIC_SPI 616 IRQ_TYPE_LEVEL_HIGH 0>;
  4227				interrupt-names = "combined";
  4228				status = "disabled";
  4229			};
  4230	
  4231			gpueb: gpueb@4b000000 {
  4232				compatible = "mediatek,gpueb";
  4233				reg = <0 0x4b000000 0 0xa0000>,
  4234				      <0 0x4b09fd00 0 0x80>,
  4235				      <0 0x4b140100 0 0x200>,
  4236				      <0 0x4b120000 0 0x100>,
  4237				      <0 0x4b09fd80 0 0x280>,
  4238				      <0 0x4b170008 0 0x4>,  /* arbitrary addr to avoid error msg */
  4239				      <0 0x4b170004 0 0x4>,
  4240				      <0 0x4b170074 0 0x4>,
  4241				      <0 0x4b170000 0 0x4>,
  4242				      <0 0x4b170078 0 0x4>,
  4243				      <0 0x4b800504 0 0x4>;
  4244				reg-names = "gpueb_base",
  4245				            "gpueb_gpr_base",
  4246				            "gpueb_cfgreg_base",
  4247				            "gpueb_intc_base",
  4248				            "mbox0_base",
  4249				            "mbox0_init", /* dummy input for mtk_mbox_probe */
  4250				            "mbox0_set",
  4251				            "mbox0_clr",
  4252				            "mbox0_send",
  4253				            "mbox0_recv",
  4254				            "mfg0_pwr_con";
  4255				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>;
  4256				interrupt-names = "mbox0";
  4257	
  4258				gpueb-support;
  4259				ghpm-support;
  4260				mbox-count = <1>;
  4261				mbox-size = <160>; /* 160 slot * 4 = 640 byte */
  4262				slot-size = <4>;   /* 1 slot = 4 bytes */
  4263				ts-mbox = <0>; /* mbox for timersync */
  4264	
  4265				/* id, mbox, send_size */
  4266				send-table = <0 0 4>,
  4267					     <1 0 8>,
  4268					     <2 0 3>,
  4269					     <3 0 6>,
  4270					     <4 0 9>,
  4271					     <5 0 4>,
  4272					     <6 0 6>,
  4273					     <7 0 6>,
  4274					     <8 0 1>,
  4275					     <9 0 4>,
  4276					     <10 0 4>,
  4277					     <11 0 1>;
  4278				send-name-table = "IPI_ID_FAST_DVFS_EVENT",
  4279						  "IPI_ID_GPUFREQ",
  4280						  "IPI_ID_SLEEP",
  4281						  "IPI_ID_TIMER",
  4282						  "IPI_ID_FHCTL",
  4283						  "IPI_ID_CCF",
  4284						  "IPI_ID_GPUMPU",
  4285						  "IPI_ID_FAST_DVFS",
  4286						  "CH_IPIR_C_MET", /* = IPIS_C_MET on gpueb side */
  4287						  "CH_IPIS_C_MET", /* = IPIR_C_MET on gpueb side */
  4288						  "IPI_ID_BRISKET",
  4289						  "IPI_ID_PPB";
  4290	
  4291				/* id, mbox, recv_size, recv_opt, cb_ctx_opt */
  4292				recv-table = <0 0 4 0 0>,
  4293					     <1 0 8 1 1>,
  4294					     <2 0 1 0 1>,
  4295					     <3 0 1 0 1>,
  4296					     <4 0 1 1 1>,
  4297					     <5 0 4 1 1>,
  4298					     <6 0 1 1 1>,
  4299					     <7 0 6 1 1>,
  4300					     <8 0 4 0 1>,
  4301					     <9 0 1 1 1>,
  4302					     <10 0 4 1 1>,
  4303					     <11 0 1 1 1>;
  4304				recv-name-table = "IPI_ID_FAST_DVFS_EVENT",
  4305						  "IPI_ID_GPUFREQ",
  4306						  "IPI_ID_SLEEP",
  4307						  "IPI_ID_TIMER",
  4308						  "IPI_ID_FHCTL",
  4309						  "IPI_ID_CCF",
  4310						  "IPI_ID_GPUMPU",
  4311						  "IPI_ID_FAST_DVFS",
  4312						  "CH_IPIR_C_MET", /* = IPIS_C_MET on gpueb side */
  4313						  "CH_IPIS_C_MET", /* = IPIR_C_MET on gpueb side */
  4314						  "IPI_ID_BRISKET",
  4315						  "IPI_ID_PPB";
  4316	
  4317				gpueb-mem-table = <0 0x4000>,   /* 16KB */
  4318						  <1 0x180000>; /* 1.5MB */
  4319	
  4320				gpueb-mem-name-table = "MEM_ID_GPUFREQ", /* GPUFREQ */
  4321						       "MEM_ID_LOG";     /* LOGGER */
  4322			};
  4323	
  4324			mfgpll_pll_ctrl_clk: syscon@4b810000 {
  4325				/* TODO: Fix compatible in driver */
  4326				compatible = "mediatek,mt8196-mfgpll-pll-ctrl", "mediatek,mt8196-mfgpll_pll_ctrl", "syscon";
  4327				reg = <0 0x4b810000 0 0x400>;
  4328				#clock-cells = <1>;
  4329			};
  4330	
  4331			mfgpll_sc0_pll_ctrl_clk: syscon@4b810400 {
  4332				/* TODO: Fix compatible in driver */
  4333				compatible = "mediatek,mt8196-mfgpll-sc0-pll-ctrl", "mediatek,mt8196-mfgpll_sc0_pll_ctrl", "syscon";
  4334				reg = <0 0x4b810400 0 0x400>;
  4335				#clock-cells = <1>;
  4336			};
  4337	
  4338			ghpm: ghpm@4b800000 {
  4339				compatible = "mediatek,ghpm";
  4340				reg =
  4341					<0 0x4b800000 0 0x1000>,
  4342					<0 0x4b860000 0 0x1000>,
  4343					<0 0x4b860128 0 0x4>,
  4344					<0 0x1c004ea8 0 0x4>,
  4345					<0 0x1c000070 0 0x4>,
  4346					<0 0x1c000074 0 0x4>,
  4347					<0 0x1c000078 0 0x4>;
  4348				reg-names =
  4349					"mfg_rpc",
  4350					"mfg_vcore_ao_config",
  4351					"mfg_mt8196_e2_id_con",
  4352					"spm_mfg0_pwr_con",
  4353					"clk_cfg_6",
  4354					"clk_cfg_6_set",
  4355					"clk_cfg_6_clr";
  4356	
  4357				gpueb-supply = <&gpueb>;
  4358			};
  4359	
  4360			mfgpll_sc1_pll_ctrl_clk: syscon@4b810800 {
  4361				/* TODO: Fix compatible in driver */
  4362				compatible = "mediatek,mt8196-mfgpll-sc1-pll-ctrl", "mediatek,mt8196-mfgpll_sc1_pll_ctrl", "syscon";
  4363				reg = <0 0x4b810800 0 0x1000>;
  4364				#clock-cells = <1>;
  4365			};
  4366	
  4367			devapc_gpu: devapc@4b890000 {
  4368				compatible = "mediatek,mt8196-devapc";
  4369				reg = <0 0x4b890000 0 0x1000>;
  4370				vio-idx-num = <20>;
  4371				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
  4372			};
  4373	
  4374			devapc_gpu1: devapc@4b8b0000 {
  4375				compatible = "mediatek,mt8196-devapc";
  4376				reg = <0 0x4b8b0000 0 0x1000>;
  4377				vio-idx-num = <26>;
  4378				interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
  4379			};
  4380	
  4381			apu_smmu: iommu@4c000000 {
  4382				compatible = "mediatek,mt8196-apu-smmu", "arm,smmu-v3";
  4383				reg = <0 0x4c000000 0 0x1e0000>;
  4384				interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING 0>;
  4385				interrupt-names = "combined";
  4386				#iommu-cells = <1>;
  4387			};
  4388	
> 4389			jpeg-decoder {
  4390				compatible = "mediatek,mt8196-jpgdec";
  4391				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  4392				iommus = <&mm_smmu 164>;
  4393				#address-cells = <2>;
  4394				#size-cells = <2>;
  4395				ranges;
  4396	
  4397				jpgdec0: jpeg-decoder@38040000 {
  4398					compatible = "mediatek,mt8196-jpgdec-hw";
  4399					reg = <0 0x38040000 0 0x10000>;
  4400					interrupts = <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
  4401					clocks = <&venc_gcon_clk CLK_VEN1_CKE3_JPGDEC_JPGDEC>;
  4402					clock-names = "jpgdec";
  4403					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
  4404				};
  4405	
  4406				jpgdec1: jpeg-decoder@38840000 {
  4407					compatible = "mediatek,mt8196-jpgdec-hw";
  4408					reg = <0 0x38840000 0 0x10000>;
  4409					interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>;
  4410					clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE3_JPGDEC_JPGDEC>;
  4411					clock-names = "jpgdec";
  4412					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4413				};
  4414			};
  4415	
> 4416			jpeg-encoder {
  4417				compatible = "mediatek,mt8196-jpgenc";
  4418				power-domains = <&hfrpsys  MT8196_POWER_DOMAIN_VEN0>;
  4419				iommus = <&mm_smmu 165>;
  4420				#address-cells = <2>;
  4421				#size-cells = <2>;
  4422				ranges;
  4423	
  4424				jpgenc0: jpeg-encoder@38030000 {
  4425					compatible = "mediatek,mt8196-jpgenc-hw";
  4426					reg = <0 0x38030000 0 0x10000>;
  4427					interrupts = <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH 0>;
  4428					clocks = <&venc_gcon_clk CLK_VEN1_CKE2_JPGENC_JPGENC>;
  4429					clock-names = "jpgenc";
  4430					power-domains = <&hfrpsys  MT8196_POWER_DOMAIN_VEN0>;
  4431				};
  4432	
  4433				jpgenc1: jpeg-encoder@38830000 {
  4434					compatible = "mediatek,mt8196-jpgenc-hw";
  4435					reg = <0 0x38830000 0 0x10000>;
  4436					interrupts = <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>;
  4437					clocks = <&venc_gcon_clk CLK_VEN1_CKE2_JPGENC>,
  4438						<&venc_gcon_core1_clk  CLK_VEN2_CKE2_JPGENC_JPGENC>;
  4439					clock-names = "jpgenc", "jpgenc_c1";
  4440					power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
  4441				};
  4442			};
  4443	
  4444			sound: sound {
  4445				compatible = "mediatek,mt8196-mt6681-sound";
  4446				mediatek,platform = <&afe>;
  4447				/* audio-routing is added here as a placeholder to complete the
  4448				   probe flow.It should be removed when upstreaming */
  4449				audio-routing = "Headphone Jack", "HPOL",
  4450						"Headphone Jack", "HPOR";
  4451				status = "disabled";
  4452			};
  4453	
  4454			thermal_zones: thermal-zones {
  4455				soc_max: soc_max {
  4456					polling-delay = <0>; /* milliseconds */
  4457					polling-delay-passive = <0>; /* milliseconds */
  4458					thermal-sensors = <&lvts 0>;
  4459	
  4460					trips {
  4461						soc_max_crit: so-max-crit {
  4462							temperature = <118800>;
  4463							hysteresis = <2000>;
  4464							type = "critical";
  4465						};
  4466					};
  4467				};
  4468	
  4469				cpu-6-0-thermal {
  4470					polling-delay = <0>; /* milliseconds */
  4471					polling-delay-passive = <0>; /* milliseconds */
  4472					thermal-sensors = <&lvts 1>;
  4473					trips {
  4474						cpu_medium_core6_0_crit: cpu-medium-core6-0-crit {
  4475							temperature = <118800>;
  4476							hysteresis = <2000>;
  4477							type = "critical";
  4478						};
  4479					};
  4480				};
  4481	
  4482				cpu-6-1-thermal {
  4483					polling-delay = <0>; /* milliseconds */
  4484					polling-delay-passive = <0>; /* milliseconds */
  4485					thermal-sensors = <&lvts 2>;
  4486					trips {
  4487						cpu_medium_core6_1_crit: cpu-medium-core6-1-crit {
  4488							temperature = <118800>;
  4489							hysteresis = <2000>;
  4490							type = "critical";
  4491						};
  4492					};
  4493				};
  4494	
  4495				cpu-dsu2-thermal {
  4496					polling-delay = <0>; /* milliseconds */
  4497					polling-delay-passive = <0>; /* milliseconds */
  4498					thermal-sensors = <&lvts 3>;
  4499					trips {
  4500						cpu_dsu2_crit: cpu-dsu2-crit {
  4501							temperature = <118800>;
  4502							hysteresis = <2000>;
  4503							type = "critical";
  4504						};
  4505					};
  4506				};
  4507	
  4508				cpu-dsu3-thermal {
  4509					polling-delay = <0>; /* milliseconds */
  4510					polling-delay-passive = <0>; /* milliseconds */
  4511					thermal-sensors = <&lvts 4>;
  4512					trips {
  4513						cpu_dsu3_crit: cpu-dsu3-crit {
  4514							temperature = <118800>;
  4515							hysteresis = <2000>;
  4516							type = "critical";
  4517						};
  4518					};
  4519				};
  4520	
  4521				cpu-3-thermal {
  4522					polling-delay = <0>; /* milliseconds */
  4523					polling-delay-passive = <0>; /* milliseconds */
  4524					thermal-sensors = <&lvts 5>;
  4525					trips {
  4526						cpu_little_core3_crit: cpu-little-core3-crit {
  4527							temperature = <118800>;
  4528							hysteresis = <2000>;
  4529							type = "critical";
  4530						};
  4531					};
  4532				};
  4533	
  4534				cpu-0-thermal {
  4535					polling-delay = <0>; /* milliseconds */
  4536					polling-delay-passive = <0>; /* milliseconds */
  4537					thermal-sensors = <&lvts 6>;
  4538					trips {
  4539						cpu_little_core0_crit: cpu-little-core0-crit {
  4540							temperature = <118800>;
  4541							hysteresis = <2000>;
  4542							type = "critical";
  4543						};
  4544					};
  4545				};
  4546	
  4547				cpu-1-thermal {
  4548					polling-delay = <0>; /* milliseconds */
  4549					polling-delay-passive = <0>; /* milliseconds */
  4550					thermal-sensors = <&lvts 7>;
  4551					trips {
  4552						cpu_little_core1_crit: cpu-little-core1-crit {
  4553							temperature = <118800>;
  4554							hysteresis = <2000>;
  4555							type = "critical";
  4556						};
  4557					};
  4558				};
  4559	
  4560				cpu-2-thermal {
  4561					polling-delay = <0>; /* milliseconds */
  4562					polling-delay-passive = <0>; /* milliseconds */
  4563					thermal-sensors = <&lvts 8>;
  4564					trips {
  4565						cpu_little_core2_crit: cpu-little-core2-crit {
  4566							temperature = <118800>;
  4567							hysteresis = <2000>;
  4568							type = "critical";
  4569						};
  4570					};
  4571				};
  4572	
  4573				cpu-4-0-thermal {
  4574					polling-delay = <0>; /* milliseconds */
  4575					polling-delay-passive = <0>; /* milliseconds */
  4576					thermal-sensors = <&lvts 9>;
  4577					trips {
  4578						cpu_medium_core4_0_crit: cpu-medium-core4-0-crit {
  4579							temperature = <118800>;
  4580							hysteresis = <2000>;
  4581							type = "critical";
  4582						};
  4583					};
  4584				};
  4585	
  4586				cpu-4-1-thermal {
  4587					polling-delay = <0>; /* milliseconds */
  4588					polling-delay-passive = <0>; /* milliseconds */
  4589					thermal-sensors = <&lvts 10>;
  4590					trips {
  4591						cpu_medium_core4_1_crit: cpu-medium-core4-1-crit {
  4592							temperature = <118800>;
  4593							hysteresis = <2000>;
  4594							type = "critical";
  4595						};
  4596					};
  4597				};
  4598	
  4599				cpu-5-0-thermal {
  4600					polling-delay = <0>; /* milliseconds */
  4601					polling-delay-passive = <0>; /* milliseconds */
  4602					thermal-sensors = <&lvts 11>;
  4603					trips {
  4604						cpu_medium_core5_0_crit: cpu-medium-core5-0-crit {
  4605							temperature = <118800>;
  4606							hysteresis = <2000>;
  4607							type = "critical";
  4608						};
  4609					};
  4610				};
  4611	
  4612				cpu-5-1-thermal {
  4613					polling-delay = <0>; /* milliseconds */
  4614					polling-delay-passive = <0>; /* milliseconds */
  4615					thermal-sensors = <&lvts 12>;
  4616					trips {
  4617						cpu_medium_core5_1_crit: cpu-medium-core5-1-crit {
  4618							temperature = <118800>;
  4619							hysteresis = <2000>;
  4620							type = "critical";
  4621						};
  4622					};
  4623				};
  4624	
  4625				cpu-dsu0-thermal {
  4626					polling-delay = <0>; /* milliseconds */
  4627					polling-delay-passive = <0>; /* milliseconds */
  4628					thermal-sensors = <&lvts 13>;
  4629					trips {
  4630						cpu_dsu0_crit: cpu-dsu0-crit {
  4631							temperature = <118800>;
  4632							hysteresis = <2000>;
  4633							type = "critical";
  4634						};
  4635					};
  4636				};
  4637	
  4638				cpu-dsu1-thermal {
  4639					polling-delay = <0>; /* milliseconds */
  4640					polling-delay-passive = <0>; /* milliseconds */
  4641					thermal-sensors = <&lvts 14>;
  4642					trips {
  4643						cpu_dsu1_crit: cpu-dsu1-crit {
  4644							temperature = <118800>;
  4645							hysteresis = <2000>;
  4646							type = "critical";
  4647						};
  4648					};
  4649				};
  4650	
  4651				cpu-7-0-thermal {
  4652					polling-delay = <0>; /* milliseconds */
  4653					polling-delay-passive = <0>; /* milliseconds */
  4654					thermal-sensors = <&lvts 15>;
  4655					trips {
  4656						cpu_big_core7_0_crit: cpu-big-core7-0-crit {
  4657							temperature = <118800>;
  4658							hysteresis = <2000>;
  4659							type = "critical";
  4660						};
  4661					};
  4662				};
  4663	
  4664				cpu-7-1-thermal {
  4665					polling-delay = <0>; /* milliseconds */
  4666					polling-delay-passive = <0>; /* milliseconds */
  4667					thermal-sensors = <&lvts 16>;
  4668					trips {
  4669						cpu_big_core7_1_crit: cpu-big-core7-1-crit {
  4670							temperature = <118800>;
  4671							hysteresis = <2000>;
  4672							type = "critical";
  4673						};
  4674					};
  4675				};
  4676	
  4677				apu-a0-thermal {
  4678					polling-delay = <0>; /* milliseconds */
  4679					polling-delay-passive = <0>; /* milliseconds */
  4680					thermal-sensors = <&lvts 17>;
  4681					trips {
  4682						apu_a0_crit: apu-a0-crit {
  4683							temperature = <118800>;
  4684							hysteresis = <2000>;
  4685							type = "critical";
  4686						};
  4687					};
  4688				};
  4689	
  4690				apu-a1-thermal {
  4691					polling-delay = <0>; /* milliseconds */
  4692					polling-delay-passive = <0>; /* milliseconds */
  4693					thermal-sensors = <&lvts 18>;
  4694					trips {
  4695						apu_a1_crit: apu-a1-crit {
  4696							temperature = <118800>;
  4697							hysteresis = <2000>;
  4698							type = "critical";
  4699						};
  4700					};
  4701				};
  4702	
  4703				apu-a2-thermal {
  4704					polling-delay = <0>; /* milliseconds */
  4705					polling-delay-passive = <0>; /* milliseconds */
  4706					thermal-sensors = <&lvts 19>;
  4707					trips {
  4708						apu_a2_crit: apu-a2-crit {
  4709							temperature = <118800>;
  4710							hysteresis = <2000>;
  4711							type = "critical";
  4712						};
  4713					};
  4714				};
  4715	
  4716				apu-a3-thermal {
  4717					polling-delay = <0>; /* milliseconds */
  4718					polling-delay-passive = <0>; /* milliseconds */
  4719					thermal-sensors = <&lvts 20>;
  4720					trips {
  4721						apu_a3_crit: apu-a3-crit {
  4722							temperature = <118800>;
  4723							hysteresis = <2000>;
  4724							type = "critical";
  4725						};
  4726					};
  4727				};
  4728	
  4729				gpu0-thermal {
  4730					polling-delay = <0>; /* milliseconds */
  4731					polling-delay-passive = <0>; /* milliseconds */
  4732					thermal-sensors = <&lvts 21>;
  4733					trips {
  4734						gpu0_crit: gpu0-crit {
  4735							temperature = <118800>;
  4736							hysteresis = <2000>;
  4737							type = "critical";
  4738						};
  4739					};
  4740				};
  4741	
  4742				gpu1-thermal {
  4743					polling-delay = <0>; /* milliseconds */
  4744					polling-delay-passive = <0>; /* milliseconds */
  4745					thermal-sensors = <&lvts 22>;
  4746					trips {
  4747						gpu1_crit: gpu1-crit {
  4748							temperature = <118800>;
  4749							hysteresis = <2000>;
  4750							type = "critical";
  4751						};
  4752					};
  4753				};
  4754	
  4755				soc-top0-thermal {
  4756					polling-delay = <0>; /* milliseconds */
  4757					polling-delay-passive = <0>; /* milliseconds */
  4758					thermal-sensors = <&lvts 23>;
  4759					trips {
  4760						soc_top0_crit: soc-top0-crit {
  4761							temperature = <118800>;
  4762							hysteresis = <2000>;
  4763							type = "critical";
  4764						};
  4765					};
  4766				};
  4767	
  4768				soc-top1-thermal {
  4769					polling-delay = <0>; /* milliseconds */
  4770					polling-delay-passive = <0>; /* milliseconds */
  4771					thermal-sensors = <&lvts 24>;
  4772					trips {
  4773						soc_top1_crit: soc-top1-crit {
  4774							temperature = <118800>;
  4775							hysteresis = <2000>;
  4776							type = "critical";
  4777						};
  4778					};
  4779				};
  4780	
  4781				soc-top2-thermal {
  4782					polling-delay = <0>; /* milliseconds */
  4783					polling-delay-passive = <0>; /* milliseconds */
  4784					thermal-sensors = <&lvts 25>;
  4785					trips {
  4786						soc_top2_crit: soc-top2-crit {
  4787							temperature = <118800>;
  4788							hysteresis = <2000>;
  4789							type = "critical";
  4790						};
  4791					};
  4792				};
  4793	
  4794				soc-top3-thermal {
  4795					polling-delay = <0>; /* milliseconds */
  4796					polling-delay-passive = <0>; /* milliseconds */
  4797					thermal-sensors = <&lvts 26>;
  4798					trips {
  4799						soc_top3_crit: soc-top3-crit {
  4800							temperature = <118800>;
  4801							hysteresis = <2000>;
  4802							type = "critical";
  4803						};
  4804					};
  4805				};
  4806	
  4807				soc-bot0-thermal {
  4808					polling-delay = <0>; /* milliseconds */
  4809					polling-delay-passive = <0>; /* milliseconds */
  4810					thermal-sensors = <&lvts 27>;
  4811					trips {
  4812						soc_bot0_crit: soc-bot0-crit {
  4813							temperature = <118800>;
  4814							hysteresis = <2000>;
  4815							type = "critical";
  4816						};
  4817					};
  4818				};
  4819	
  4820				soc-bot1-thermal {
  4821					polling-delay = <0>; /* milliseconds */
  4822					polling-delay-passive = <0>; /* milliseconds */
  4823					thermal-sensors = <&lvts 28>;
  4824					trips {
  4825						soc_bot1_crit: soc-bot1-crit {
  4826							temperature = <118800>;
  4827							hysteresis = <2000>;
  4828							type = "critical";
  4829						};
  4830					};
  4831				};
  4832	
  4833				soc-bot2-thermal {
  4834					polling-delay = <0>; /* milliseconds */
  4835					polling-delay-passive = <0>; /* milliseconds */
  4836					thermal-sensors = <&lvts 29>;
  4837					trips {
  4838						soc_bot2_crit: soc-bot2-crit {
  4839							temperature = <118800>;
  4840							hysteresis = <2000>;
  4841							type = "critical";
  4842						};
  4843					};
  4844				};
  4845	
  4846				soc-bot3-thermal {
  4847					polling-delay = <0>; /* milliseconds */
  4848					polling-delay-passive = <0>; /* milliseconds */
  4849					thermal-sensors = <&lvts 30>;
  4850					trips {
  4851						soc_bot3_crit: soc-bot3-crit {
  4852							temperature = <118800>;
  4853							hysteresis = <2000>;
  4854							type = "critical";
  4855						};
  4856					};
  4857				};
  4858			};
  4859		};
  4860	};
  4861	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
