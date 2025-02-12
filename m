Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CC4134A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739366236; cv=none; b=iJiHt8/WP3YnxKfvxIr2e706HKQp2tCiub76/egzUBC2bAYjcEVEiL+wSPKdyGdRn85wX2T163l9nq+9onVVLKKGw+zhPGsCr3K0WdqIgLzP57YXYSt7OJqCr2qYR+/Rx557gQg/RNd6mSCl84S5i0m2iIYUqZ/xCKRgLCbt6Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739366236; c=relaxed/simple;
	bh=r0A4R7zPA3aGk7WVzF7xTDos7KcFwnNyc5VLVHTCTaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kywZKyCL3jr3ybYUalJB9vD8NsrGqbxmfZE82az6HTYRjxdC9V/ULhoIzgG/tga6sW3m4HIy50p9e8z30vXZsvt48UFm5l1telonUQs/N7leVaQz127vcmYRWyl3QShL0qcu7t6G3na8Qli5qchgTzUc+ggUEBJxzevuaCYRQF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iogff1Q8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iogff1Q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739366223; x=1770902223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r0A4R7zPA3aGk7WVzF7xTDos7KcFwnNyc5VLVHTCTaQ=;
  b=iogff1Q8vqzchqVsOAZYYmFHn76TFKCCD9KuVLGjgKeoxzjx7vvXI7iv
   mDW9QHV4+SyNAgbha6wUfBE3+ODcxzc9wHs4h2vQlg6c7CVVMK/UjBqyL
   lq+LkBhO645lKFVj60v+EwHp3+C382UUqurFajY1a1NcOOMCTS5Sv+2zV
   XbLgLMlow9tsz60fcwhiTRYEb7R4JAS+nd9LmnJka8z3YhmFBmOPlK7P/
   7aAdHDv3bGa0yTfkDoQ4Qo6OAkaoahDLaiiAaYdZEUDHvVBT98E7LnkcV
   h2xsHBufhnkzVc6Cf0CAxLjag85vib4aqBy4oV4ORYm7oH8Clku/tXICJ
   w==;
X-CSE-ConnectionGUID: rGTR45vwReaSuAmAMiM7dQ==
X-CSE-MsgGUID: xN1gkcnlS4m+7OHF9Q31AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39943863"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="39943863"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 05:16:55 -0800
X-CSE-ConnectionGUID: uHXKe0R8R1G4iRs9w8kPJw==
X-CSE-MsgGUID: fv91qcsXRTSpl/iUDn4wgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143739680"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2025 05:16:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiCbj-0015dl-2B;
	Wed, 12 Feb 2025 13:16:51 +0000
Date: Wed, 12 Feb 2025 21:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 253/253]
 arch/arm64/boot/dts/mediatek/mt8196.dtsi:2698.28-2703.5: Warning
 (unique_unit_address_if_enabled): /soc/syscon@1a110000: duplicate
 unit-address (also used in node /soc/mt8196-afe-pcm@1a110000)
Message-ID: <202502122152.KSNclLxm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b74e1a5d2d7e4817954aea87d1f1abb0c7d0df5e
commit: a6056e013ef73da63a821613db38a0ed9df8cc0f [253/253] CHROMIUM: arm64: dts: mediatek: mt8196: rauru: Enable Audio
config: arm64-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250212/202502122152.KSNclLxm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502122152.KSNclLxm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502122152.KSNclLxm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4752.38-4759.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4761.8-4766.5: Warning (simple_bus_reg): /soc/mvpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4768.16-4776.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4778.14-4786.5: Warning (simple_bus_reg): /soc/vdisp-ctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4788.12-4796.5: Warning (simple_bus_reg): /soc/vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4798.32-5202.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1151.37-1176.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1276.25-1306.5: Warning (unique_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate unit-address (also used in node /soc/nkp@1046f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1308.24-1335.5: Warning (unique_unit_address_if_enabled): /soc/ssmpu@1056f000: duplicate unit-address (also used in node /soc/skp@1056f000)
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:2698.28-2703.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a110000: duplicate unit-address (also used in node /soc/mt8196-afe-pcm@1a110000)

vim +2698 arch/arm64/boot/dts/mediatek/mt8196.dtsi

3a88be54312101 Xavier Chang   2024-01-08    19  
3a88be54312101 Xavier Chang   2024-01-08    20  / {
3a88be54312101 Xavier Chang   2024-01-08    21  	compatible = "mediatek,mt8196";
3a88be54312101 Xavier Chang   2024-01-08    22  	interrupt-parent = <&gic>;
3a88be54312101 Xavier Chang   2024-01-08    23  	#address-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08    24  	#size-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08    25  
3a88be54312101 Xavier Chang   2024-01-08    26  	aliases {
fe693c3f6e9a12 Nancy Lin      2024-03-23    27  		blender0 = &disp_ovl0_blender0;
fe693c3f6e9a12 Nancy Lin      2024-03-23    28  		blender1 = &disp_ovl0_blender1;
fe693c3f6e9a12 Nancy Lin      2024-03-23    29  		blender2 = &disp_ovl0_blender2;
fe693c3f6e9a12 Nancy Lin      2024-03-23    30  		blender3 = &disp_ovl0_blender3;
fe693c3f6e9a12 Nancy Lin      2024-03-23    31  		blender4 = &disp_ovl0_blender4;
fe693c3f6e9a12 Nancy Lin      2024-03-23    32  		blender5 = &disp_ovl0_blender5;
fe693c3f6e9a12 Nancy Lin      2024-03-23    33  		blender6 = &disp_ovl0_blender6;
fe693c3f6e9a12 Nancy Lin      2024-03-23    34  		blender7 = &disp_ovl0_blender7;
fe693c3f6e9a12 Nancy Lin      2024-03-23    35  		blender8 = &disp_ovl0_blender8;
fe693c3f6e9a12 Nancy Lin      2024-03-23    36  		blender9 = &disp_ovl0_blender9;
fe693c3f6e9a12 Nancy Lin      2024-03-23    37  		blender10 = &disp_ovl1_blender0;
fe693c3f6e9a12 Nancy Lin      2024-03-23    38  		blender11 = &disp_ovl1_blender1;
fe693c3f6e9a12 Nancy Lin      2024-03-23    39  		blender12 = &disp_ovl1_blender2;
fe693c3f6e9a12 Nancy Lin      2024-03-23    40  		blender13 = &disp_ovl1_blender3;
fe693c3f6e9a12 Nancy Lin      2024-03-23    41  		blender14 = &disp_ovl1_blender4;
fe693c3f6e9a12 Nancy Lin      2024-03-23    42  		blender15 = &disp_ovl1_blender5;
fe693c3f6e9a12 Nancy Lin      2024-03-23    43  		blender16 = &disp_ovl1_blender6;
fe693c3f6e9a12 Nancy Lin      2024-03-23    44  		blender17 = &disp_ovl1_blender7;
fe693c3f6e9a12 Nancy Lin      2024-03-23    45  		blender18 = &disp_ovl1_blender8;
fe693c3f6e9a12 Nancy Lin      2024-03-23    46  		blender19 = &disp_ovl1_blender9;
811d357337456b Sunny.Shen     2024-06-24    47  		ccorr0 = &disp_ccorr0;
811d357337456b Sunny.Shen     2024-06-24    48  		ccorr1 = &disp_ccorr1;
811d357337456b Sunny.Shen     2024-06-24    49  		dither0 = &disp_dither0;
3eb254258f2631 Jason-jh Lin   2025-01-16    50  		dp-intf0 = &dp_intf0;
ebbc0e1103cfde Mac Shen       2024-06-27    51  		dp-intf1 = &dp_intf1;
13ecc998839331 Jason-jh Lin   2025-01-17    52  		dsc0 = &disp_dsc0;
13ecc998839331 Jason-jh Lin   2025-01-17    53  		dsc1 = &disp_dsc1;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16    54  		dvo0 = &disp_dvo0;
fe693c3f6e9a12 Nancy Lin      2024-03-23    55  		exdma2 = &disp_ovl0_exdma2;
fe693c3f6e9a12 Nancy Lin      2024-03-23    56  		exdma3 = &disp_ovl0_exdma3;
fe693c3f6e9a12 Nancy Lin      2024-03-23    57  		exdma4 = &disp_ovl0_exdma4;
fe693c3f6e9a12 Nancy Lin      2024-03-23    58  		exdma5 = &disp_ovl0_exdma5;
fe693c3f6e9a12 Nancy Lin      2024-03-23    59  		exdma6 = &disp_ovl0_exdma6;
fe693c3f6e9a12 Nancy Lin      2024-03-23    60  		exdma7 = &disp_ovl0_exdma7;
fe693c3f6e9a12 Nancy Lin      2024-03-23    61  		exdma8 = &disp_ovl0_exdma8;
fe693c3f6e9a12 Nancy Lin      2024-03-23    62  		exdma9 = &disp_ovl0_exdma9;
fe693c3f6e9a12 Nancy Lin      2024-03-23    63  		exdma12 = &disp_ovl1_exdma2;
fe693c3f6e9a12 Nancy Lin      2024-03-23    64  		exdma13 = &disp_ovl1_exdma3;
fe693c3f6e9a12 Nancy Lin      2024-03-23    65  		exdma14 = &disp_ovl1_exdma4;
fe693c3f6e9a12 Nancy Lin      2024-03-23    66  		exdma15 = &disp_ovl1_exdma5;
fe693c3f6e9a12 Nancy Lin      2024-03-23    67  		exdma16 = &disp_ovl1_exdma6;
fe693c3f6e9a12 Nancy Lin      2024-03-23    68  		exdma17 = &disp_ovl1_exdma7;
fe693c3f6e9a12 Nancy Lin      2024-03-23    69  		exdma18 = &disp_ovl1_exdma8;
fe693c3f6e9a12 Nancy Lin      2024-03-23    70  		exdma19 = &disp_ovl1_exdma9;
811d357337456b Sunny.Shen     2024-06-24    71  		gamma0 = &disp_gamma0;
3a88be54312101 Xavier Chang   2024-01-08    72  		i2c0 = &i2c0;
3a88be54312101 Xavier Chang   2024-01-08    73  		i2c1 = &i2c1;
3a88be54312101 Xavier Chang   2024-01-08    74  		i2c2 = &i2c2;
3a88be54312101 Xavier Chang   2024-01-08    75  		i2c3 = &i2c3;
3a88be54312101 Xavier Chang   2024-01-08    76  		i2c4 = &i2c4;
3a88be54312101 Xavier Chang   2024-01-08    77  		i2c5 = &i2c5;
3a88be54312101 Xavier Chang   2024-01-08    78  		i2c6 = &i2c6;
3a88be54312101 Xavier Chang   2024-01-08    79  		i2c7 = &i2c7;
3a88be54312101 Xavier Chang   2024-01-08    80  		i2c8 = &i2c8;
3a88be54312101 Xavier Chang   2024-01-08    81  		i2c9 = &i2c9;
3a88be54312101 Xavier Chang   2024-01-08    82  		i2c10 = &i2c10;
3a88be54312101 Xavier Chang   2024-01-08    83  		i2c11 = &i2c11;
3a88be54312101 Xavier Chang   2024-01-08    84  		i2c12 = &i2c12;
3a88be54312101 Xavier Chang   2024-01-08    85  		i2c13 = &i2c13;
3a88be54312101 Xavier Chang   2024-01-08    86  		i2c14 = &i2c14;
64b149becb1a40 Sunny.Shen     2024-06-24    87  		mdp-rsz0 = &disp_mdp_rsz0;
3a88be54312101 Xavier Chang   2024-01-08    88  		mmc1 = &mmc1;
3a88be54312101 Xavier Chang   2024-01-08    89  		mmc2 = &mmc2;
fe693c3f6e9a12 Nancy Lin      2024-03-23    90  		mutex0 = &disp0_mutex;
fe693c3f6e9a12 Nancy Lin      2024-03-23    91  		mutex1 = &disp1_mutex;
fe693c3f6e9a12 Nancy Lin      2024-03-23    92  		mutex2 = &ovl0_mutex;
fe693c3f6e9a12 Nancy Lin      2024-03-23    93  		mutex3 = &ovl1_mutex;
fe693c3f6e9a12 Nancy Lin      2024-03-23    94  		outproc0 = &disp_ovl0_outproc0;
fe693c3f6e9a12 Nancy Lin      2024-03-23    95  		outproc1 = &disp_ovl0_outproc1;
fe693c3f6e9a12 Nancy Lin      2024-03-23    96  		outproc2 = &disp_ovl0_outproc2;
fe693c3f6e9a12 Nancy Lin      2024-03-23    97  		outproc3 = &disp_ovl0_outproc3;
fe693c3f6e9a12 Nancy Lin      2024-03-23    98  		outproc4 = &disp_ovl0_outproc4;
fe693c3f6e9a12 Nancy Lin      2024-03-23    99  		outproc5 = &disp_ovl0_outproc5;
fe693c3f6e9a12 Nancy Lin      2024-03-23   100  		outproc6 = &disp_ovl1_outproc0;
fe693c3f6e9a12 Nancy Lin      2024-03-23   101  		outproc7 = &disp_ovl1_outproc1;
fe693c3f6e9a12 Nancy Lin      2024-03-23   102  		outproc8 = &disp_ovl1_outproc2;
fe693c3f6e9a12 Nancy Lin      2024-03-23   103  		outproc9 = &disp_ovl1_outproc3;
fe693c3f6e9a12 Nancy Lin      2024-03-23   104  		outproc10 = &disp_ovl1_outproc4;
fe693c3f6e9a12 Nancy Lin      2024-03-23   105  		outproc11 = &disp_ovl1_outproc5;
64b149becb1a40 Sunny.Shen     2024-06-24   106  		postmask0 = &disp_postmask0;
3a88be54312101 Xavier Chang   2024-01-08   107  		serial0 = &uart0;
3a88be54312101 Xavier Chang   2024-01-08   108  		spi0 = &spi0;
3a88be54312101 Xavier Chang   2024-01-08   109  		spi1 = &spi1;
3a88be54312101 Xavier Chang   2024-01-08   110  		spi2 = &spi2;
3a88be54312101 Xavier Chang   2024-01-08   111  		spi3 = &spi3;
3a88be54312101 Xavier Chang   2024-01-08   112  		spi4 = &spi4;
3a88be54312101 Xavier Chang   2024-01-08   113  		spi5 = &spi5;
3a88be54312101 Xavier Chang   2024-01-08   114  		spi6 = &spi6;
3a88be54312101 Xavier Chang   2024-01-08   115  		spi7 = &spi7;
811d357337456b Sunny.Shen     2024-06-24   116  		tdshp0 = &disp_tdshp0;
fe693c3f6e9a12 Nancy Lin      2024-03-23   117  		vdisp-ao = &disp_vdisp_ao_config_clk;
3a88be54312101 Xavier Chang   2024-01-08   118  	};
3a88be54312101 Xavier Chang   2024-01-08   119  
3a88be54312101 Xavier Chang   2024-01-08   120  	cpus {
3a88be54312101 Xavier Chang   2024-01-08   121  		#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08   122  		#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   123  
3a88be54312101 Xavier Chang   2024-01-08   124  		cpu0: cpu@0 {
3a88be54312101 Xavier Chang   2024-01-08   125  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   126  			compatible = "arm,cortex-a720";
3a88be54312101 Xavier Chang   2024-01-08   127  			reg = <0x000>;
3a88be54312101 Xavier Chang   2024-01-08   128  			performance-domains = <&performance 0>;
3a88be54312101 Xavier Chang   2024-01-08   129  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   130  			clock-frequency = <2100000000>;
3a88be54312101 Xavier Chang   2024-01-08   131  			capacity-dmips-mhz = <714>;
3a88be54312101 Xavier Chang   2024-01-08   132  			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
3a88be54312101 Xavier Chang   2024-01-08   133  					   &system_vcore &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   134  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   135  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   136  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   137  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   138  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   139  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   140  			next-level-cache = <&l2_0>;
3a88be54312101 Xavier Chang   2024-01-08   141  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   142  		};
3a88be54312101 Xavier Chang   2024-01-08   143  
3a88be54312101 Xavier Chang   2024-01-08   144  		cpu1: cpu@100 {
3a88be54312101 Xavier Chang   2024-01-08   145  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   146  			compatible = "arm,cortex-a720";
3a88be54312101 Xavier Chang   2024-01-08   147  			reg = <0x100>;
3a88be54312101 Xavier Chang   2024-01-08   148  			performance-domains = <&performance 0>;
3a88be54312101 Xavier Chang   2024-01-08   149  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   150  			clock-frequency = <2100000000>;
3a88be54312101 Xavier Chang   2024-01-08   151  			capacity-dmips-mhz = <714>;
3a88be54312101 Xavier Chang   2024-01-08   152  			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
3a88be54312101 Xavier Chang   2024-01-08   153  					   &system_vcore &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   154  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   155  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   156  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   157  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   158  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   159  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   160  			next-level-cache = <&l2_0>;
3a88be54312101 Xavier Chang   2024-01-08   161  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   162  		};
3a88be54312101 Xavier Chang   2024-01-08   163  
3a88be54312101 Xavier Chang   2024-01-08   164  		cpu2: cpu@200 {
3a88be54312101 Xavier Chang   2024-01-08   165  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   166  			compatible = "arm,cortex-a720";
3a88be54312101 Xavier Chang   2024-01-08   167  			reg = <0x200>;
3a88be54312101 Xavier Chang   2024-01-08   168  			performance-domains = <&performance 0>;
3a88be54312101 Xavier Chang   2024-01-08   169  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   170  			clock-frequency = <2100000000>;
3a88be54312101 Xavier Chang   2024-01-08   171  			capacity-dmips-mhz = <714>;
3a88be54312101 Xavier Chang   2024-01-08   172  			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
3a88be54312101 Xavier Chang   2024-01-08   173  					   &system_vcore &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   174  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   175  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   176  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   177  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   178  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   179  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   180  			next-level-cache = <&l2_0>;
3a88be54312101 Xavier Chang   2024-01-08   181  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   182  		};
3a88be54312101 Xavier Chang   2024-01-08   183  
3a88be54312101 Xavier Chang   2024-01-08   184  		cpu3: cpu@300 {
3a88be54312101 Xavier Chang   2024-01-08   185  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   186  			compatible = "arm,cortex-a720";
3a88be54312101 Xavier Chang   2024-01-08   187  			reg = <0x300>;
3a88be54312101 Xavier Chang   2024-01-08   188  			performance-domains = <&performance 0>;
3a88be54312101 Xavier Chang   2024-01-08   189  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   190  			clock-frequency = <2100000000>;
3a88be54312101 Xavier Chang   2024-01-08   191  			capacity-dmips-mhz = <714>;
3a88be54312101 Xavier Chang   2024-01-08   192  			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l
3a88be54312101 Xavier Chang   2024-01-08   193  					   &system_vcore &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   194  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   195  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   196  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   197  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   198  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   199  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   200  			next-level-cache = <&l2_0>;
3a88be54312101 Xavier Chang   2024-01-08   201  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   202  		};
3a88be54312101 Xavier Chang   2024-01-08   203  
3a88be54312101 Xavier Chang   2024-01-08   204  		cpu4: cpu@400 {
3a88be54312101 Xavier Chang   2024-01-08   205  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   206  			compatible = "arm,cortex-x4";
3a88be54312101 Xavier Chang   2024-01-08   207  			reg = <0x400>;
3a88be54312101 Xavier Chang   2024-01-08   208  			performance-domains = <&performance 1>;
3a88be54312101 Xavier Chang   2024-01-08   209  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   210  			clock-frequency = <2800000000>;
fd00cab3fe36e4 Xavier Chang   2025-01-09   211  			capacity-dmips-mhz = <835>;
3a88be54312101 Xavier Chang   2024-01-08   212  			cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m
3a88be54312101 Xavier Chang   2024-01-08   213  					   &system_vcore &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   214  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   215  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   216  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   217  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   218  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   219  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   220  			next-level-cache = <&l2_1>;
3a88be54312101 Xavier Chang   2024-01-08   221  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   222  		};
3a88be54312101 Xavier Chang   2024-01-08   223  
3a88be54312101 Xavier Chang   2024-01-08   224  		cpu5: cpu@500 {
3a88be54312101 Xavier Chang   2024-01-08   225  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   226  			compatible = "arm,cortex-x4";
3a88be54312101 Xavier Chang   2024-01-08   227  			reg = <0x500>;
3a88be54312101 Xavier Chang   2024-01-08   228  			performance-domains = <&performance 1>;
3a88be54312101 Xavier Chang   2024-01-08   229  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   230  			clock-frequency = <2800000000>;
fd00cab3fe36e4 Xavier Chang   2025-01-09   231  			capacity-dmips-mhz = <835>;
3a88be54312101 Xavier Chang   2024-01-08   232  			cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m
3a88be54312101 Xavier Chang   2024-01-08   233  					   &system_vcore &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   234  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   235  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   236  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   237  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   238  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   239  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   240  			next-level-cache = <&l2_1>;
3a88be54312101 Xavier Chang   2024-01-08   241  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   242  		};
3a88be54312101 Xavier Chang   2024-01-08   243  
3a88be54312101 Xavier Chang   2024-01-08   244  		cpu6: cpu@600 {
3a88be54312101 Xavier Chang   2024-01-08   245  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   246  			compatible = "arm,cortex-x4";
3a88be54312101 Xavier Chang   2024-01-08   247  			reg = <0x600>;
3a88be54312101 Xavier Chang   2024-01-08   248  			performance-domains = <&performance 1>;
3a88be54312101 Xavier Chang   2024-01-08   249  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   250  			clock-frequency = <2800000000>;
fd00cab3fe36e4 Xavier Chang   2025-01-09   251  			capacity-dmips-mhz = <835>;
3a88be54312101 Xavier Chang   2024-01-08   252  			cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m
3a88be54312101 Xavier Chang   2024-01-08   253  					   &system_vcore &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   254  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   255  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   256  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   257  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   258  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   259  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   260  			next-level-cache = <&l2_1>;
3a88be54312101 Xavier Chang   2024-01-08   261  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   262  		};
3a88be54312101 Xavier Chang   2024-01-08   263  
3a88be54312101 Xavier Chang   2024-01-08   264  		cpu7: cpu@700 {
3a88be54312101 Xavier Chang   2024-01-08   265  			device_type = "cpu";
3a88be54312101 Xavier Chang   2024-01-08   266  			compatible = "arm,cortex-x925";
3a88be54312101 Xavier Chang   2024-01-08   267  			reg = <0x700>;
3a88be54312101 Xavier Chang   2024-01-08   268  			performance-domains = <&performance 2>;
3a88be54312101 Xavier Chang   2024-01-08   269  			enable-method = "psci";
3a88be54312101 Xavier Chang   2024-01-08   270  			clock-frequency = <3600000000>;
fd00cab3fe36e4 Xavier Chang   2025-01-09   271  			capacity-dmips-mhz = <1024>;
3a88be54312101 Xavier Chang   2024-01-08   272  			cpu-idle-states = <&cpuoff_b &clusteroff_b &mcusysoff_b
3a88be54312101 Xavier Chang   2024-01-08   273  					   &system_vcore &s2idle>;
3a88be54312101 Xavier Chang   2024-01-08   274  			i-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   275  			i-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   276  			i-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   277  			d-cache-size = <65536>;
3a88be54312101 Xavier Chang   2024-01-08   278  			d-cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   279  			d-cache-sets = <256>;
3a88be54312101 Xavier Chang   2024-01-08   280  			next-level-cache = <&l2_2>;
3a88be54312101 Xavier Chang   2024-01-08   281  			#cooling-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   282  		};
3a88be54312101 Xavier Chang   2024-01-08   283  
3a88be54312101 Xavier Chang   2024-01-08   284  		cpu-map {
3a88be54312101 Xavier Chang   2024-01-08   285  			cluster0 {
3a88be54312101 Xavier Chang   2024-01-08   286  				core0 {
3a88be54312101 Xavier Chang   2024-01-08   287  					cpu = <&cpu0>;
3a88be54312101 Xavier Chang   2024-01-08   288  				};
3a88be54312101 Xavier Chang   2024-01-08   289  				core1 {
3a88be54312101 Xavier Chang   2024-01-08   290  					cpu = <&cpu1>;
3a88be54312101 Xavier Chang   2024-01-08   291  				};
3a88be54312101 Xavier Chang   2024-01-08   292  				core2 {
3a88be54312101 Xavier Chang   2024-01-08   293  					cpu = <&cpu2>;
3a88be54312101 Xavier Chang   2024-01-08   294  				};
3a88be54312101 Xavier Chang   2024-01-08   295  				core3 {
3a88be54312101 Xavier Chang   2024-01-08   296  					cpu = <&cpu3>;
3a88be54312101 Xavier Chang   2024-01-08   297  				};
3a88be54312101 Xavier Chang   2024-01-08   298  			};
3a88be54312101 Xavier Chang   2024-01-08   299  
3a88be54312101 Xavier Chang   2024-01-08   300  			cluster1 {
3a88be54312101 Xavier Chang   2024-01-08   301  				core0 {
3a88be54312101 Xavier Chang   2024-01-08   302  					cpu = <&cpu4>;
3a88be54312101 Xavier Chang   2024-01-08   303  				};
3a88be54312101 Xavier Chang   2024-01-08   304  				core1 {
3a88be54312101 Xavier Chang   2024-01-08   305  					cpu = <&cpu5>;
3a88be54312101 Xavier Chang   2024-01-08   306  				};
3a88be54312101 Xavier Chang   2024-01-08   307  				core2 {
3a88be54312101 Xavier Chang   2024-01-08   308  					cpu = <&cpu6>;
3a88be54312101 Xavier Chang   2024-01-08   309  				};
3a88be54312101 Xavier Chang   2024-01-08   310  			};
3a88be54312101 Xavier Chang   2024-01-08   311  
3a88be54312101 Xavier Chang   2024-01-08   312  			cluster2 {
3a88be54312101 Xavier Chang   2024-01-08   313  				core0 {
3a88be54312101 Xavier Chang   2024-01-08   314  					cpu = <&cpu7>;
3a88be54312101 Xavier Chang   2024-01-08   315  				};
3a88be54312101 Xavier Chang   2024-01-08   316  			};
3a88be54312101 Xavier Chang   2024-01-08   317  		};
3a88be54312101 Xavier Chang   2024-01-08   318  
3a88be54312101 Xavier Chang   2024-01-08   319  		idle-states {
3a88be54312101 Xavier Chang   2024-01-08   320  			entry-method = "arm,psci";
3a88be54312101 Xavier Chang   2024-01-08   321  			cpuoff_l: cpuoff-l {
3a88be54312101 Xavier Chang   2024-01-08   322  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   323  				arm,psci-suspend-param = <0x00010000>;
3a88be54312101 Xavier Chang   2024-01-08   324  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   325  				entry-latency-us = <97>;
3a88be54312101 Xavier Chang   2024-01-08   326  				exit-latency-us = <252>;
3a88be54312101 Xavier Chang   2024-01-08   327  				min-residency-us = <6710>;
3a88be54312101 Xavier Chang   2024-01-08   328  			};
3a88be54312101 Xavier Chang   2024-01-08   329  
3a88be54312101 Xavier Chang   2024-01-08   330  			cpuoff_m: cpuoff-m {
3a88be54312101 Xavier Chang   2024-01-08   331  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   332  				arm,psci-suspend-param = <0x00010000>;
3a88be54312101 Xavier Chang   2024-01-08   333  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   334  				entry-latency-us = <53>;
3a88be54312101 Xavier Chang   2024-01-08   335  				exit-latency-us = <143>;
3a88be54312101 Xavier Chang   2024-01-08   336  				min-residency-us = <2120>;
3a88be54312101 Xavier Chang   2024-01-08   337  			};
3a88be54312101 Xavier Chang   2024-01-08   338  
3a88be54312101 Xavier Chang   2024-01-08   339  			cpuoff_b: cpuoff-b {
3a88be54312101 Xavier Chang   2024-01-08   340  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   341  				arm,psci-suspend-param = <0x00010000>;
3a88be54312101 Xavier Chang   2024-01-08   342  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   343  				entry-latency-us = <40>;
3a88be54312101 Xavier Chang   2024-01-08   344  				exit-latency-us = <107>;
3a88be54312101 Xavier Chang   2024-01-08   345  				min-residency-us = <2580>;
3a88be54312101 Xavier Chang   2024-01-08   346  			};
3a88be54312101 Xavier Chang   2024-01-08   347  
3a88be54312101 Xavier Chang   2024-01-08   348  			clusteroff_l: clusteroff-l {
3a88be54312101 Xavier Chang   2024-01-08   349  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   350  				arm,psci-suspend-param = <0x01010001>;
3a88be54312101 Xavier Chang   2024-01-08   351  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   352  				entry-latency-us = <109>;
3a88be54312101 Xavier Chang   2024-01-08   353  				exit-latency-us = <325>;
3a88be54312101 Xavier Chang   2024-01-08   354  				min-residency-us = <6710>;
3a88be54312101 Xavier Chang   2024-01-08   355  			};
3a88be54312101 Xavier Chang   2024-01-08   356  
3a88be54312101 Xavier Chang   2024-01-08   357  			clusteroff_m: clusteroff-m {
3a88be54312101 Xavier Chang   2024-01-08   358  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   359  				arm,psci-suspend-param = <0x01010001>;
3a88be54312101 Xavier Chang   2024-01-08   360  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   361  				entry-latency-us = <59>;
3a88be54312101 Xavier Chang   2024-01-08   362  				exit-latency-us = <188>;
3a88be54312101 Xavier Chang   2024-01-08   363  				min-residency-us = <2120>;
3a88be54312101 Xavier Chang   2024-01-08   364  			};
3a88be54312101 Xavier Chang   2024-01-08   365  
3a88be54312101 Xavier Chang   2024-01-08   366  			clusteroff_b: clusteroff-b {
3a88be54312101 Xavier Chang   2024-01-08   367  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   368  				arm,psci-suspend-param = <0x01010001>;
3a88be54312101 Xavier Chang   2024-01-08   369  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   370  				entry-latency-us = <43>;
3a88be54312101 Xavier Chang   2024-01-08   371  				exit-latency-us = <138>;
3a88be54312101 Xavier Chang   2024-01-08   372  				min-residency-us = <2580>;
3a88be54312101 Xavier Chang   2024-01-08   373  			};
3a88be54312101 Xavier Chang   2024-01-08   374  
3a88be54312101 Xavier Chang   2024-01-08   375  			mcusysoff_l: mcusysoff-l {
3a88be54312101 Xavier Chang   2024-01-08   376  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   377  				arm,psci-suspend-param = <0x02010007>;
3a88be54312101 Xavier Chang   2024-01-08   378  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   379  				entry-latency-us = <1357>;
3a88be54312101 Xavier Chang   2024-01-08   380  				exit-latency-us = <835>;
3a88be54312101 Xavier Chang   2024-01-08   381  				min-residency-us = <6710>;
3a88be54312101 Xavier Chang   2024-01-08   382  			};
3a88be54312101 Xavier Chang   2024-01-08   383  
3a88be54312101 Xavier Chang   2024-01-08   384  			mcusysoff_m: mcusysoff-m {
3a88be54312101 Xavier Chang   2024-01-08   385  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   386  				arm,psci-suspend-param = <0x02010007>;
3a88be54312101 Xavier Chang   2024-01-08   387  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   388  				entry-latency-us = <1202>;
3a88be54312101 Xavier Chang   2024-01-08   389  				exit-latency-us = <679>;
3a88be54312101 Xavier Chang   2024-01-08   390  				min-residency-us = <2120>;
3a88be54312101 Xavier Chang   2024-01-08   391  			};
3a88be54312101 Xavier Chang   2024-01-08   392  
3a88be54312101 Xavier Chang   2024-01-08   393  			mcusysoff_b: mcusysoff-b {
3a88be54312101 Xavier Chang   2024-01-08   394  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   395  				arm,psci-suspend-param = <0x02010007>;
3a88be54312101 Xavier Chang   2024-01-08   396  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   397  				entry-latency-us = <1143>;
3a88be54312101 Xavier Chang   2024-01-08   398  				exit-latency-us = <611>;
3a88be54312101 Xavier Chang   2024-01-08   399  				min-residency-us = <2580>;
3a88be54312101 Xavier Chang   2024-01-08   400  			};
3a88be54312101 Xavier Chang   2024-01-08   401  
3a88be54312101 Xavier Chang   2024-01-08   402  			system_vcore: system-vcore {
3a88be54312101 Xavier Chang   2024-01-08   403  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   404  				arm,psci-suspend-param = <0x020100ff>;
3a88be54312101 Xavier Chang   2024-01-08   405  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   406  				entry-latency-us = <940>;
3a88be54312101 Xavier Chang   2024-01-08   407  				exit-latency-us = <3500>;
3a88be54312101 Xavier Chang   2024-01-08   408  				min-residency-us = <35200>;
3a88be54312101 Xavier Chang   2024-01-08   409  			};
3a88be54312101 Xavier Chang   2024-01-08   410  
3a88be54312101 Xavier Chang   2024-01-08   411  			s2idle: s2idle {
3a88be54312101 Xavier Chang   2024-01-08   412  				compatible = "arm,idle-state";
3a88be54312101 Xavier Chang   2024-01-08   413  				arm,psci-suspend-param = <0x020180ff>;
3a88be54312101 Xavier Chang   2024-01-08   414  				local-timer-stop;
3a88be54312101 Xavier Chang   2024-01-08   415  				entry-latency-us = <10000>;
3a88be54312101 Xavier Chang   2024-01-08   416  				exit-latency-us = <10000>;
3a88be54312101 Xavier Chang   2024-01-08   417  				min-residency-us = <4294967295>;
3a88be54312101 Xavier Chang   2024-01-08   418  			};
3a88be54312101 Xavier Chang   2024-01-08   419  		};
3a88be54312101 Xavier Chang   2024-01-08   420  
3a88be54312101 Xavier Chang   2024-01-08   421  		l2_0: l2-cache0 {
3a88be54312101 Xavier Chang   2024-01-08   422  			compatible = "cache";
3a88be54312101 Xavier Chang   2024-01-08   423  			cache-level = <2>;
3a88be54312101 Xavier Chang   2024-01-08   424  			cache-size = <524288>;
3a88be54312101 Xavier Chang   2024-01-08   425  			cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   426  			cache-sets = <2048>;
3a88be54312101 Xavier Chang   2024-01-08   427  			next-level-cache = <&l3_0>;
3a88be54312101 Xavier Chang   2024-01-08   428  			cache-unified;
3a88be54312101 Xavier Chang   2024-01-08   429  		};
3a88be54312101 Xavier Chang   2024-01-08   430  
3a88be54312101 Xavier Chang   2024-01-08   431  		l2_1: l2-cache1 {
3a88be54312101 Xavier Chang   2024-01-08   432  			compatible = "cache";
3a88be54312101 Xavier Chang   2024-01-08   433  			cache-level = <2>;
3a88be54312101 Xavier Chang   2024-01-08   434  			cache-size = <1048576>;
3a88be54312101 Xavier Chang   2024-01-08   435  			cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   436  			cache-sets = <4096>;
3a88be54312101 Xavier Chang   2024-01-08   437  			next-level-cache = <&l3_0>;
3a88be54312101 Xavier Chang   2024-01-08   438  			cache-unified;
3a88be54312101 Xavier Chang   2024-01-08   439  		};
3a88be54312101 Xavier Chang   2024-01-08   440  
3a88be54312101 Xavier Chang   2024-01-08   441  		l2_2: l2-cache2 {
3a88be54312101 Xavier Chang   2024-01-08   442  			compatible = "cache";
3a88be54312101 Xavier Chang   2024-01-08   443  			cache-level = <2>;
3a88be54312101 Xavier Chang   2024-01-08   444  			cache-size = <2097152>;
3a88be54312101 Xavier Chang   2024-01-08   445  			cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   446  			cache-sets = <8192>;
3a88be54312101 Xavier Chang   2024-01-08   447  			next-level-cache = <&l3_0>;
3a88be54312101 Xavier Chang   2024-01-08   448  			cache-unified;
3a88be54312101 Xavier Chang   2024-01-08   449  		};
3a88be54312101 Xavier Chang   2024-01-08   450  
3a88be54312101 Xavier Chang   2024-01-08   451  		l3_0: l3-cache {
3a88be54312101 Xavier Chang   2024-01-08   452  			compatible = "cache";
3a88be54312101 Xavier Chang   2024-01-08   453  			cache-level = <3>;
3a88be54312101 Xavier Chang   2024-01-08   454  			cache-size = <12582912>;
3a88be54312101 Xavier Chang   2024-01-08   455  			cache-line-size = <64>;
3a88be54312101 Xavier Chang   2024-01-08   456  			cache-sets = <49152>;
3a88be54312101 Xavier Chang   2024-01-08   457  			cache-unified;
3a88be54312101 Xavier Chang   2024-01-08   458  		};
3a88be54312101 Xavier Chang   2024-01-08   459  	};
3a88be54312101 Xavier Chang   2024-01-08   460  
3a88be54312101 Xavier Chang   2024-01-08   461  	clk_ao: clk-ao {
3a88be54312101 Xavier Chang   2024-01-08   462  		compatible = "simple-bus";
3a88be54312101 Xavier Chang   2024-01-08   463  		#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08   464  		#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   465  	};
3a88be54312101 Xavier Chang   2024-01-08   466  
3a88be54312101 Xavier Chang   2024-01-08   467  	clkitg: clkitg {
3a88be54312101 Xavier Chang   2024-01-08   468  		compatible = "simple-bus";
3a88be54312101 Xavier Chang   2024-01-08   469  		#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08   470  		#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   471  	};
3a88be54312101 Xavier Chang   2024-01-08   472  
3a88be54312101 Xavier Chang   2024-01-08   473  	clocks {
3a88be54312101 Xavier Chang   2024-01-08   474  		clk_null: clk-null {
3a88be54312101 Xavier Chang   2024-01-08   475  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   476  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   477  			clock-frequency = <0>;
3a88be54312101 Xavier Chang   2024-01-08   478  		};
3a88be54312101 Xavier Chang   2024-01-08   479  
3a88be54312101 Xavier Chang   2024-01-08   480  		clk32k: clk32k {
3a88be54312101 Xavier Chang   2024-01-08   481  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   482  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   483  			clock-frequency = <32000>;
3a88be54312101 Xavier Chang   2024-01-08   484  		};
3a88be54312101 Xavier Chang   2024-01-08   485  
3a88be54312101 Xavier Chang   2024-01-08   486  		clk13m: clk13m {
3a88be54312101 Xavier Chang   2024-01-08   487  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   488  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   489  			clock-frequency = <13000000>;
3a88be54312101 Xavier Chang   2024-01-08   490  		};
3a88be54312101 Xavier Chang   2024-01-08   491  
3a88be54312101 Xavier Chang   2024-01-08   492  		clk26m: clk26m {
3a88be54312101 Xavier Chang   2024-01-08   493  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   494  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   495  			clock-frequency = <26000000>;
3a88be54312101 Xavier Chang   2024-01-08   496  		};
3a88be54312101 Xavier Chang   2024-01-08   497  
3a88be54312101 Xavier Chang   2024-01-08   498  		/*
3a88be54312101 Xavier Chang   2024-01-08   499  		 * ulposc: Ultra Low Power Oscillator
3a88be54312101 Xavier Chang   2024-01-08   500  		 * It is used by soc when the 26Mhz clock is turned
3a88be54312101 Xavier Chang   2024-01-08   501  		 * off. It also is used by other modules.
3a88be54312101 Xavier Chang   2024-01-08   502  		 */
3a88be54312101 Xavier Chang   2024-01-08   503  		ulposc: ulposc {
3a88be54312101 Xavier Chang   2024-01-08   504  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   505  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   506  			clock-frequency = <520000000>;
3a88be54312101 Xavier Chang   2024-01-08   507  		};
3a88be54312101 Xavier Chang   2024-01-08   508  
3a88be54312101 Xavier Chang   2024-01-08   509  		/*
3a88be54312101 Xavier Chang   2024-01-08   510  		 * ulposc3: Ultra Low Power Oscillator 3
3a88be54312101 Xavier Chang   2024-01-08   511  		 * It is used by soc when the 26Mhz clock is turned
3a88be54312101 Xavier Chang   2024-01-08   512  		 * off. It also is used by other modules.
3a88be54312101 Xavier Chang   2024-01-08   513  		 */
3a88be54312101 Xavier Chang   2024-01-08   514  		ulposc3: ulposc3 {
3a88be54312101 Xavier Chang   2024-01-08   515  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   516  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   517  			clock-frequency = <26000000>;
3a88be54312101 Xavier Chang   2024-01-08   518  		};
3a88be54312101 Xavier Chang   2024-01-08   519  
3a88be54312101 Xavier Chang   2024-01-08   520  		clk104m: clk104m {
3a88be54312101 Xavier Chang   2024-01-08   521  			compatible = "fixed-clock";
3a88be54312101 Xavier Chang   2024-01-08   522  			#clock-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08   523  			clock-frequency = <104000000>;
3a88be54312101 Xavier Chang   2024-01-08   524  		};
3a88be54312101 Xavier Chang   2024-01-08   525  	};
3a88be54312101 Xavier Chang   2024-01-08   526  
f5e37d37aba390 Gavin Liu      2024-06-11   527  	firmware: firmware {
f5e37d37aba390 Gavin Liu      2024-06-11   528  		mtk-svp-heap {
f5e37d37aba390 Gavin Liu      2024-06-11   529  			compatible = "mediatek,secure-heap";
f5e37d37aba390 Gavin Liu      2024-06-11   530  			memory-region = <&restricted_region>;
f5e37d37aba390 Gavin Liu      2024-06-11   531  		};
f5e37d37aba390 Gavin Liu      2024-06-11   532  
f5e37d37aba390 Gavin Liu      2024-06-11   533  		optee {
f5e37d37aba390 Gavin Liu      2024-06-11   534  			compatible = "linaro,optee-tz";
f5e37d37aba390 Gavin Liu      2024-06-11   535  			method = "smc";
f5e37d37aba390 Gavin Liu      2024-06-11   536  			interrupts-extended = <&gic GIC_SPI 955 IRQ_TYPE_LEVEL_HIGH 0>;
f5e37d37aba390 Gavin Liu      2024-06-11   537  		};
519d40b68a563e Kenji Yu       2024-08-30   538  
519d40b68a563e Kenji Yu       2024-08-30   539  		scmi: scmi {
519d40b68a563e Kenji Yu       2024-08-30   540  			compatible = "arm,scmi";
519d40b68a563e Kenji Yu       2024-08-30   541  			mboxes = <&tinysys_mbox 0>, <&tinysys_mbox 1>;
519d40b68a563e Kenji Yu       2024-08-30   542  			shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
519d40b68a563e Kenji Yu       2024-08-30   543  			mbox-names = "tx", "rx";
519d40b68a563e Kenji Yu       2024-08-30   544  			#address-cells = <1>;
519d40b68a563e Kenji Yu       2024-08-30   545  			#size-cells = <0>;
519d40b68a563e Kenji Yu       2024-08-30   546  
519d40b68a563e Kenji Yu       2024-08-30   547  			scmi_tinysys: protocol@80 {
519d40b68a563e Kenji Yu       2024-08-30   548  				reg = <0x80>;
519d40b68a563e Kenji Yu       2024-08-30   549  				scmi-cm = <9>;
519d40b68a563e Kenji Yu       2024-08-30   550  			};
519d40b68a563e Kenji Yu       2024-08-30   551  		};
f5e37d37aba390 Gavin Liu      2024-06-11   552  	};
f5e37d37aba390 Gavin Liu      2024-06-11   553  
3a88be54312101 Xavier Chang   2024-01-08   554  	memory: memory@80000000 {
3a88be54312101 Xavier Chang   2024-01-08   555  		device_type = "memory";
3a88be54312101 Xavier Chang   2024-01-08   556  		reg = <0 0x80000000 0 0x40000000>;
3a88be54312101 Xavier Chang   2024-01-08   557  	};
3a88be54312101 Xavier Chang   2024-01-08   558  
3a88be54312101 Xavier Chang   2024-01-08   559  	pmu_hunter: pmu-hunter {
3a88be54312101 Xavier Chang   2024-01-08   560  		compatible = "arm,cortex-a720-pmu";
3a88be54312101 Xavier Chang   2024-01-08   561  		interrupt-parent = <&gic>;
3a88be54312101 Xavier Chang   2024-01-08   562  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
3a88be54312101 Xavier Chang   2024-01-08   563  	};
3a88be54312101 Xavier Chang   2024-01-08   564  
3a88be54312101 Xavier Chang   2024-01-08   565  	pmu_hunter_elp: pmu-hunter-elp {
3a88be54312101 Xavier Chang   2024-01-08   566  		compatible = "arm,cortex-x4-pmu";
3a88be54312101 Xavier Chang   2024-01-08   567  		interrupt-parent = <&gic>;
3a88be54312101 Xavier Chang   2024-01-08   568  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
3a88be54312101 Xavier Chang   2024-01-08   569  	};
3a88be54312101 Xavier Chang   2024-01-08   570  
3a88be54312101 Xavier Chang   2024-01-08   571  	pmu_blackhawk: pmu-blackhawk{
3a88be54312101 Xavier Chang   2024-01-08   572  		compatible = "arm,cortex-x925-pmu";
3a88be54312101 Xavier Chang   2024-01-08   573  		interrupt-parent = <&gic>;
3a88be54312101 Xavier Chang   2024-01-08   574  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
3a88be54312101 Xavier Chang   2024-01-08   575  	};
3a88be54312101 Xavier Chang   2024-01-08   576  
3a88be54312101 Xavier Chang   2024-01-08   577  	reserved-memory {
3a88be54312101 Xavier Chang   2024-01-08   578  		#address-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   579  		#size-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   580  		ranges;
57436b1dbadb65 Jjian Zhou     2024-04-01   581  
990c0028a0ae7e Hailong Fan    2024-08-05   582  		adsp_mem_reserved: adsp-mem-region@90000000 {
990c0028a0ae7e Hailong Fan    2024-08-05   583  			compatible = "mediatek,adsp-reserved-memory";
990c0028a0ae7e Hailong Fan    2024-08-05   584  			reg = <0 0x90000000 0 0x600000>;
990c0028a0ae7e Hailong Fan    2024-08-05   585  			no-map;
990c0028a0ae7e Hailong Fan    2024-08-05   586  		};
990c0028a0ae7e Hailong Fan    2024-08-05   587  
990c0028a0ae7e Hailong Fan    2024-08-05   588  		afe_dma_mem_reserved: snd-dma-mem-region@90600000 {
990c0028a0ae7e Hailong Fan    2024-08-05   589  			compatible = "shared-dma-pool";
990c0028a0ae7e Hailong Fan    2024-08-05   590  			reg = <0 0x90600000 0 0x200000>;
990c0028a0ae7e Hailong Fan    2024-08-05   591  			no-map;
990c0028a0ae7e Hailong Fan    2024-08-05   592  		};
990c0028a0ae7e Hailong Fan    2024-08-05   593  
990c0028a0ae7e Hailong Fan    2024-08-05   594  		adsp_dma_mem_reserved: adsp-dma-mem-region@90800000 {
990c0028a0ae7e Hailong Fan    2024-08-05   595  			compatible = "shared-dma-pool";
990c0028a0ae7e Hailong Fan    2024-08-05   596  			reg = <0 0x90800000 0 0x100000>;
990c0028a0ae7e Hailong Fan    2024-08-05   597  			no-map;
990c0028a0ae7e Hailong Fan    2024-08-05   598  		};
990c0028a0ae7e Hailong Fan    2024-08-05   599  
eedd3dc85418be Karl Li        2024-09-27   600  		apu_reserve_memory: apu-reserve-memory@95000000 {
eedd3dc85418be Karl Li        2024-09-27   601  			compatible = "mediatek,apu-resv-mem";
eedd3dc85418be Karl Li        2024-09-27   602  			reg = <0 0x95000000 0 0x1400000>;
eedd3dc85418be Karl Li        2024-09-27   603  			no-map;
eedd3dc85418be Karl Li        2024-09-27   604  		};
eedd3dc85418be Karl Li        2024-09-27   605  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   606  		gpueb_resv_mem: gpueb-reserved-memory@a0000000 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   607  			compatible = "mediatek,gpueb-resv-mem";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   608  			reg = <0 0xa0000000 0 0x200000>; /* 2 MB */
1ac2c128a1d9a6 Andy Hsu       2024-03-29   609  			no-map;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   610  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   611  
57436b1dbadb65 Jjian Zhou     2024-04-01   612  		vcp_resv_mem: vcp-reserved-memory@a0200000 {
57436b1dbadb65 Jjian Zhou     2024-04-01   613  			compatible = "mediatek,me-vcp-reserved";
57436b1dbadb65 Jjian Zhou     2024-04-01   614  			reg = <0 0xa0200000 0 0x01e00000>; /* 30MB */
57436b1dbadb65 Jjian Zhou     2024-04-01   615  			iommu-addresses = <0 0x00000000 1 0x40000000>; /* 1G */
57436b1dbadb65 Jjian Zhou     2024-04-01   616  			no-map;
57436b1dbadb65 Jjian Zhou     2024-04-01   617  		};
f5e37d37aba390 Gavin Liu      2024-06-11   618  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   619  		mali_protected: mali-protected@a2000000 { /* 16MB */
1ac2c128a1d9a6 Andy Hsu       2024-03-29   620  			compatible = "mali-reserved";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   621  			reg = <0x0 0xa2000000 0x0 0x1000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   622  			no-map;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   623  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   624  
f5e37d37aba390 Gavin Liu      2024-06-11   625  		restricted_region: secure-region@a3000000 {
f5e37d37aba390 Gavin Liu      2024-06-11   626  			compatible = "mediatek,dynamic-restricted-region";
f5e37d37aba390 Gavin Liu      2024-06-11   627  			reg = <0 0xa3000000 0 0x1bc00000>; /* 444MB */
f5e37d37aba390 Gavin Liu      2024-06-11   628  			no-map;
f5e37d37aba390 Gavin Liu      2024-06-11   629  		};
eedd3dc85418be Karl Li        2024-09-27   630  
eedd3dc85418be Karl Li        2024-09-27   631  		apu_smmu_reserve_memory0: apu-smmu-reserve-memory0 {
eedd3dc85418be Karl Li        2024-09-27   632  			compatible = "mediatek,apu-smmu-resv-mem";
eedd3dc85418be Karl Li        2024-09-27   633  			iommu-addresses = <&apusys_rv 0x0 0x0 0x0 0x40000000>,
eedd3dc85418be Karl Li        2024-09-27   634  					  <&apusys_rv 0x0 0x4c000000 0x0 0x4000000>,
eedd3dc85418be Karl Li        2024-09-27   635  					  <&apusys_rv 0x0 0x6c000000 0x0 0x4000000>;
eedd3dc85418be Karl Li        2024-09-27   636  		};
3a88be54312101 Xavier Chang   2024-01-08   637  	};
3a88be54312101 Xavier Chang   2024-01-08   638  
3a88be54312101 Xavier Chang   2024-01-08   639  	timer: timer {
3a88be54312101 Xavier Chang   2024-01-08   640  		compatible = "arm,armv8-timer";
3a88be54312101 Xavier Chang   2024-01-08   641  		interrupt-parent = <&gic>;
3a88be54312101 Xavier Chang   2024-01-08   642  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
3a88be54312101 Xavier Chang   2024-01-08   643  				<GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
3a88be54312101 Xavier Chang   2024-01-08   644  				<GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
3a88be54312101 Xavier Chang   2024-01-08   645  				<GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08   646  		clock-frequency = <13000000>;
3a88be54312101 Xavier Chang   2024-01-08   647  	};
3a88be54312101 Xavier Chang   2024-01-08   648  
3a88be54312101 Xavier Chang   2024-01-08   649  	psci {
3a88be54312101 Xavier Chang   2024-01-08   650  		compatible = "arm,psci-1.0";
3a88be54312101 Xavier Chang   2024-01-08   651  		method = "smc";
3a88be54312101 Xavier Chang   2024-01-08   652  	};
3a88be54312101 Xavier Chang   2024-01-08   653  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   654  	ged: ged {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   655  		compatible = "mediatek,ged";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   656  		gpufreq-supply = <&gpufreq>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   657  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   658  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   659  	gpu_dcs: gpu-dcs {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   660  		compatible = "mediatek,gpu-dcs";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   661  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   662  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   663  	gpu_dvfs_mode: gpu-loading-mode {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   664  		compatible = "mediatek,gpu-loading-mode";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   665  		dvfs-loading-mode = <0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   666  		dvfs-workload-mode = <6>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   667  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   668  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   669  	gpu_mali_opp: opp-table-gpu {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   670  		compatible = "operating-points-v2";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   671  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   672  		opp00 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   673  			opp-hz = /bits/ 64 <1612000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   674  			opp-microvolt = <795000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   675  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   676  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   677  		opp01 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   678  			opp-hz = /bits/ 64 <1586000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   679  			opp-microvolt = <790000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   680  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   681  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   682  		opp02 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   683  			opp-hz = /bits/ 64 <1560000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   684  			opp-microvolt = <785000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   685  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   686  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   687  		opp03 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   688  			opp-hz = /bits/ 64 <1534000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   689  			opp-microvolt = <780000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   690  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   691  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   692  		opp04 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   693  			opp-hz = /bits/ 64 <1508000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   694  			opp-microvolt = <770000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   695  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   696  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   697  		opp05 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   698  			opp-hz = /bits/ 64 <1482000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   699  			opp-microvolt = <765000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   700  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   701  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   702  		opp06 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   703  			opp-hz = /bits/ 64 <1456000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   704  			opp-microvolt = <760000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   705  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   706  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   707  		opp07 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   708  			opp-hz = /bits/ 64 <1430000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   709  			opp-microvolt = <750000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   710  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   711  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   712  		opp08 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   713  			opp-hz = /bits/ 64 <1404000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   714  			opp-microvolt = <745000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   715  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   716  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   717  		opp09 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   718  			opp-hz = /bits/ 64 <1378000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   719  			opp-microvolt = <740000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   720  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   721  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   722  		opp10 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   723  			opp-hz = /bits/ 64 <1352000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   724  			opp-microvolt = <735000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   725  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   726  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   727  		opp11 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   728  			opp-hz = /bits/ 64 <1326000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   729  			opp-microvolt = <730000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   730  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   731  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   732  		opp12 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   733  			opp-hz = /bits/ 64 <1300000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   734  			opp-microvolt = <720000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   735  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   736  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   737  		opp13 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   738  			opp-hz = /bits/ 64 <1274000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   739  			opp-microvolt = <715000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   740  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   741  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   742  		opp14 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   743  			opp-hz = /bits/ 64 <1248000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   744  			opp-microvolt = <710000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   745  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   746  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   747  		opp15 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   748  			opp-hz = /bits/ 64 <1222000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   749  			opp-microvolt = <705000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   750  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   751  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   752  		opp16 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   753  			opp-hz = /bits/ 64 <1196000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   754  			opp-microvolt = <695000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   755  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   756  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   757  		opp17 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   758  			opp-hz = /bits/ 64 <1170000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   759  			opp-microvolt = <690000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   760  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   761  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   762  		opp18 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   763  			opp-hz = /bits/ 64 <1144000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   764  			opp-microvolt = <685000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   765  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   766  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   767  		opp19 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   768  			opp-hz = /bits/ 64 <1118000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   769  			opp-microvolt = <680000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   770  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   771  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   772  		opp20 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   773  			opp-hz = /bits/ 64 <1092000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   774  			opp-microvolt = <670000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   775  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   776  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   777  		opp21 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   778  			opp-hz = /bits/ 64 <1066000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   779  			opp-microvolt = <665000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   780  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   781  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   782  		opp22 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   783  			opp-hz = /bits/ 64 <1040000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   784  			opp-microvolt = <660000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   785  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   786  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   787  		opp23 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   788  			opp-hz = /bits/ 64 <1014000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   789  			opp-microvolt = <655000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   790  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   791  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   792  		opp24 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   793  			opp-hz = /bits/ 64 <988000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   794  			opp-microvolt = <645000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   795  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   796  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   797  		opp25 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   798  			opp-hz = /bits/ 64 <962000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   799  			opp-microvolt = <640000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   800  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   801  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   802  		opp26 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   803  			opp-hz = /bits/ 64 <936000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   804  			opp-microvolt = <635000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   805  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   806  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   807  		opp27 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   808  			opp-hz = /bits/ 64 <910000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   809  			opp-microvolt = <630000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   810  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   811  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   812  		opp28 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   813  			opp-hz = /bits/ 64 <884000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   814  			opp-microvolt = <620000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   815  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   816  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   817  		opp29 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   818  			opp-hz = /bits/ 64 <858000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   819  			opp-microvolt = <615000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   820  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   821  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   822  		opp30 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   823  			opp-hz = /bits/ 64 <832000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   824  			opp-microvolt = <610000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   825  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   826  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   827  		opp31 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   828  			opp-hz = /bits/ 64 <806000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   829  			opp-microvolt = <605000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   830  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   831  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   832  		opp32 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   833  			opp-hz = /bits/ 64 <780000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   834  			opp-microvolt = <600000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   835  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   836  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   837  		opp33 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   838  			opp-hz = /bits/ 64 <754000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   839  			opp-microvolt = <590000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   840  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   841  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   842  		opp34 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   843  			opp-hz = /bits/ 64 <728000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   844  			opp-microvolt = <585000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   845  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   846  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   847  		opp35 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   848  			opp-hz = /bits/ 64 <702000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   849  			opp-microvolt = <580000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   850  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   851  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   852  		opp36 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   853  			opp-hz = /bits/ 64 <676000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   854  			opp-microvolt = <575000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   855  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   856  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   857  		opp37 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   858  			opp-hz = /bits/ 64 <650000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   859  			opp-microvolt = <560000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   860  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   861  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   862  		opp38 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   863  			opp-hz = /bits/ 64 <624000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   864  			opp-microvolt = <560000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   865  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   866  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   867  		opp39 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   868  			opp-hz = /bits/ 64 <598000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   869  			opp-microvolt = <555000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   870  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   871  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   872  		opp40 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   873  			opp-hz = /bits/ 64 <572000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   874  			opp-microvolt = <550000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   875  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   876  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   877  		opp41 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   878  			opp-hz = /bits/ 64 <546000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   879  			opp-microvolt = <540000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   880  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   881  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   882  		opp42 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   883  			opp-hz = /bits/ 64 <520000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   884  			opp-microvolt = <535000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   885  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   886  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   887  		opp43 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   888  			opp-hz = /bits/ 64 <494000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   889  			opp-microvolt = <530000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   890  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   891  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   892  		opp44 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   893  			opp-hz = /bits/ 64 <468000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   894  			opp-microvolt = <525000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   895  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   896  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   897  		opp45 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   898  			opp-hz = /bits/ 64 <442000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   899  			opp-microvolt = <515000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   900  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   901  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   902  		opp46 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   903  			opp-hz = /bits/ 64 <416000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   904  			opp-microvolt = <510000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   905  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   906  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   907  		opp47 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   908  			opp-hz = /bits/ 64 <390000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   909  			opp-microvolt = <505000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   910  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   911  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   912  		opp48 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   913  			opp-hz = /bits/ 64 <364000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   914  			opp-microvolt = <500000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   915  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   916  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   917  		opp49 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   918  			opp-hz = /bits/ 64 <338000000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   919  			opp-microvolt = <490000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   920  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   921  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   922  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   923  	gpu_protected_memory_allocator: protected-memory-allocator {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   924  		compatible = "arm,protected-memory-allocator";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   925  		memory-region = <&mali_protected>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   926  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   927  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   928  	gpufreq_wrapper: gpufreq-wrapper {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   929  		compatible = "mediatek,gpufreq-wrapper";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   930  		gpufreq-version = <2>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   931  		dual-buck = <1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   932  		gpueb-support;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   933  		ghpm-supply = <&ghpm>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   934  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   935  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   936  	mgm: mgm {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   937  		compatible = "arm,physical-memory-group-manager";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   938  	};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   939  
3a88be54312101 Xavier Chang   2024-01-08   940  	soc {
3a88be54312101 Xavier Chang   2024-01-08   941  		compatible = "simple-bus";
3a88be54312101 Xavier Chang   2024-01-08   942  		#address-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   943  		#size-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08   944  		ranges;
3a88be54312101 Xavier Chang   2024-01-08   945  		dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
3a88be54312101 Xavier Chang   2024-01-08   946  
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12   947  		therm_intf: therm-intf@114000 {
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12   948  			compatible = "mediatek,therm_intf";
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12   949  			reg = <0 0x00114000 0 0x400>,
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12   950  			      <0 0x0c2cd450 0 0x400>;
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12   951  			reg-names = "sram", "cputcm";
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12   952  			mediatek,init-ttj-cpu = <95000>;
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12   953  			mediatek,init-ttj-gpu = <95000>;
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12   954  			mediatek,init-ttj-npu = <95000>;
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12   955  		};
f8c8dc82e45e6e Zhaoqing Jiu   2024-08-12   956  
35ddc053cc4d97 Haohao Sun     2024-08-30   957  		slbc: slbc@117800 {
35ddc053cc4d97 Haohao Sun     2024-08-30   958  			compatible = "mediatek,mt8196-slbc";
35ddc053cc4d97 Haohao Sun     2024-08-30   959  			reg = <0 0x00117800 0 0x400>;
35ddc053cc4d97 Haohao Sun     2024-08-30   960  		};
35ddc053cc4d97 Haohao Sun     2024-08-30   961  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   962  		qos: qos@11bb00 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   963  			compatible = "mediatek,mt8196-qos";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   964  			reg = <0 0x0011bb00 0 0x100>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29   965  			      <0 0x0011b9c0 0 0x140>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29   966  			      <0 0x0011b920 0 0xa0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   967  			reg-names = "sram", "share_sram", "share_sram_ext";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   968  			mediatek,enable;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   969  			scmi-tinysys-supply = <&scmi_tinysys>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   970  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   971  
3a88be54312101 Xavier Chang   2024-01-08   972  		csram_sys: csram-sysram@11bc00 {
3a88be54312101 Xavier Chang   2024-01-08   973  			reg = <0 0x11bc00 0 0x1400>; /* 5KB */
3a88be54312101 Xavier Chang   2024-01-08   974  		};
3a88be54312101 Xavier Chang   2024-01-08   975  
1ac2c128a1d9a6 Andy Hsu       2024-03-29   976  		gpu_qos: gpu-qos@13f800 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29   977  			compatible = "mediatek,gpu-qos";
1ac2c128a1d9a6 Andy Hsu       2024-03-29   978  			reg = <0 0x13f800 0 0x20>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   979  			qos-mode = <0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   980  			qos-sysram-support;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   981  			qos-value = <0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29   982  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29   983  
3a88be54312101 Xavier Chang   2024-01-08   984  		cpu_mcucfg: mcusys-ao-cfg@c000000 {
3a88be54312101 Xavier Chang   2024-01-08   985  			reg = <0 0xc000000 0 0x10000>; /* 64KB */
3a88be54312101 Xavier Chang   2024-01-08   986  		};
3a88be54312101 Xavier Chang   2024-01-08   987  
3a88be54312101 Xavier Chang   2024-01-08   988  		cpu_pll: mcusys-pll1u-top@c030000 {
3a88be54312101 Xavier Chang   2024-01-08   989  			reg = <0 0xc030000 0 0x1000>; /* 4KB */
3a88be54312101 Xavier Chang   2024-01-08   990  		};
3a88be54312101 Xavier Chang   2024-01-08   991  
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07   992  		cm_mgr: cm-mgr@c100000 {
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07   993  			compatible = "mediatek,mt8196-cm-mgr";
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07   994  			reg = <0 0xc100000 0 0x9000>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07   995  			reg-names = "cm_mgr_base";
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07   996  			interconnects = <&dvfsrc MT6873_MASTER_MCU_1 &dvfsrc MT6873_SLAVE_DDR_EMI>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07   997  			interconnect-names = "cm-perf-bw";
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07   998  			cpuhvfs = <&cpuhvfs>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07   999  			required-opps = <&dvfsrc_freq_opp0>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1000  					<&dvfsrc_freq_opp1>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1001  					<&dvfsrc_freq_opp2>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1002  					<&dvfsrc_freq_opp3>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1003  					<&dvfsrc_freq_opp4>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1004  					<&dvfsrc_freq_opp5>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1005  					<&dvfsrc_freq_opp6>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1006  					<&dvfsrc_freq_opp7>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1007  					<&dvfsrc_freq_opp8>,
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1008  					<&dvfsrc_freq_opp9>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1009  			mediatek,cm-mgr-enable;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1010  			mediatek,cm-mgr-arch = "v1p";
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1011  
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1012  			mediatek,cm-mgr-num-array = <7>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1013  			mediatek,cm-mgr,cp-down  = <100 100 100 100 100 100 100>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1014  			mediatek,cm-mgr,cp-up = <100 100 100 100 100 100 100>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1015  			mediatek,cm-mgr,dt-down = <0 0 0 0 0 0 0>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1016  			mediatek,cm-mgr,dt-up = <0 0 0 0 0 0 0>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1017  			mediatek,cm-mgr,vp-down = <100 100 100 100 100 100 100>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1018  			mediatek,cm-mgr,vp-up = <100 100 100 100 100 100 100>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1019  
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1020  			mediatek,cm-mgr-cpu-opp-to-dram = <3 3 9 9 9 9 9 9
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1021  						9 9 9 9 9 9 9 9
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1022  						9 9 9 9 9 9 9 9
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1023  						9 9 9 9 9 9 9 9>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1024  			mediatek,cm-perf-mode-enable;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1025  			mediatek,cm-perf-mode-ceiling-opp = <0>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1026  			mediatek,cm-perf-mode-thd = <5>;
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1027  		};
1fe62fcb2a55fb Zhaoqing Jiu   2024-11-07  1028  
3a88be54312101 Xavier Chang   2024-01-08  1029  		ccipll_pll_ctrl_clk: syscon@c1e0000 {
3a88be54312101 Xavier Chang   2024-01-08  1030  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1031  			compatible = "mediatek,mt8196-ccipll-pll-ctrl", "mediatek,mt8196-ccipll_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1032  			reg = <0 0xc1e0000 0 0x400>;
3a88be54312101 Xavier Chang   2024-01-08  1033  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1034  		};
3a88be54312101 Xavier Chang   2024-01-08  1035  
3a88be54312101 Xavier Chang   2024-01-08  1036  		armpll_ll_pll_ctrl_clk: syscon@c1e0400 {
3a88be54312101 Xavier Chang   2024-01-08  1037  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1038  			compatible = "mediatek,mt8196-armpll-ll-pll-ctrl", "mediatek,mt8196-armpll_ll_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1039  			reg = <0 0xc1e0400 0 0x400>;
3a88be54312101 Xavier Chang   2024-01-08  1040  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1041  		};
3a88be54312101 Xavier Chang   2024-01-08  1042  
3a88be54312101 Xavier Chang   2024-01-08  1043  		armpll_bl_pll_ctrl_clk: syscon@c1e0800 {
3a88be54312101 Xavier Chang   2024-01-08  1044  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1045  			compatible = "mediatek,mt8196-armpll-bl-pll-ctrl", "mediatek,mt8196-armpll_bl_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1046  			reg = <0 0xc1e0800 0 0x400>;
3a88be54312101 Xavier Chang   2024-01-08  1047  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1048  		};
3a88be54312101 Xavier Chang   2024-01-08  1049  
3a88be54312101 Xavier Chang   2024-01-08  1050  		armpll_b_pll_ctrl_clk: syscon@c1e0c00 {
3a88be54312101 Xavier Chang   2024-01-08  1051  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1052  			compatible = "mediatek,mt8196-armpll-b-pll-ctrl", "mediatek,mt8196-armpll_b_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1053  			reg = <0 0xc1e0c00 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1054  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1055  		};
3a88be54312101 Xavier Chang   2024-01-08  1056  
3a88be54312101 Xavier Chang   2024-01-08  1057  		ptppll_pll_ctrl_clk: syscon@c1e4000 {
3a88be54312101 Xavier Chang   2024-01-08  1058  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1059  			compatible = "mediatek,mt8196-ptppll-pll-ctrl", "mediatek,mt8196-ptppll_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1060  			reg = <0 0xc1e4000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1061  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1062  		};
3a88be54312101 Xavier Chang   2024-01-08  1063  
89dcc6e1084125 Xiufeng Li     2024-06-21  1064  		fdvfs: fdvfs@c220400 {
89dcc6e1084125 Xiufeng Li     2024-06-21  1065  			compatible = "mediatek,fdvfs";
89dcc6e1084125 Xiufeng Li     2024-06-21  1066  			reg = <0 0x0c220400 0 0x20>,
89dcc6e1084125 Xiufeng Li     2024-06-21  1067  				<0 0x0c220420 0 0x4>,
89dcc6e1084125 Xiufeng Li     2024-06-21  1068  				<0 0x0c2c2034 0 0x4>;
89dcc6e1084125 Xiufeng Li     2024-06-21  1069  			reg-names = "fdvfs-reg",
89dcc6e1084125 Xiufeng Li     2024-06-21  1070  				"fdvfs-cci-reg",
89dcc6e1084125 Xiufeng Li     2024-06-21  1071  				"fdvfs-support";
89dcc6e1084125 Xiufeng Li     2024-06-21  1072  		};
89dcc6e1084125 Xiufeng Li     2024-06-21  1073  
af8ef1affaf7bd Michael Tseng  2024-06-20  1074  		mcupm: mcupm@c240000 {
af8ef1affaf7bd Michael Tseng  2024-06-20  1075  			compatible = "mediatek,mt8196-mcupm";
af8ef1affaf7bd Michael Tseng  2024-06-20  1076  			reg = <0 0x0c240000 0 0x50000>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1077  			      <0 0x0c2cf600 0 0xa0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1078  			      <0 0x0c242004 0 0x4>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1079  			      <0 0x0c242018 0 0x4>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1080  			      <0 0x0c242000 0 0x4>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1081  			      <0 0x0c242010 0 0x4>;
af8ef1affaf7bd Michael Tseng  2024-06-20  1082  			reg-names = "mcupm_base",
af8ef1affaf7bd Michael Tseng  2024-06-20  1083  				    "mbox0_base",
af8ef1affaf7bd Michael Tseng  2024-06-20  1084  				    "mbox0_set",
af8ef1affaf7bd Michael Tseng  2024-06-20  1085  				    "mbox0_clr",
af8ef1affaf7bd Michael Tseng  2024-06-20  1086  				    "mbox0_send",
af8ef1affaf7bd Michael Tseng  2024-06-20  1087  				    "mbox0_recv";
af8ef1affaf7bd Michael Tseng  2024-06-20  1088  			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1089  				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1090  				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1091  				     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1092  				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1093  				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1094  				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1095  				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1096  				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1097  				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1098  				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1099  				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1100  				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1101  				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1102  				     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH 0>,
af8ef1affaf7bd Michael Tseng  2024-06-20  1103  				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH 0>;
af8ef1affaf7bd Michael Tseng  2024-06-20  1104  			interrupt-names = "mbox0",
af8ef1affaf7bd Michael Tseng  2024-06-20  1105  					  "mbox1",
af8ef1affaf7bd Michael Tseng  2024-06-20  1106  					  "mbox2",
af8ef1affaf7bd Michael Tseng  2024-06-20  1107  					  "mbox3",
af8ef1affaf7bd Michael Tseng  2024-06-20  1108  					  "mbox4",
af8ef1affaf7bd Michael Tseng  2024-06-20  1109  					  "mbox5",
af8ef1affaf7bd Michael Tseng  2024-06-20  1110  					  "mbox6",
af8ef1affaf7bd Michael Tseng  2024-06-20  1111  					  "mbox7",
af8ef1affaf7bd Michael Tseng  2024-06-20  1112  					  "mbox8",
af8ef1affaf7bd Michael Tseng  2024-06-20  1113  					  "mbox9",
af8ef1affaf7bd Michael Tseng  2024-06-20  1114  					  "mbox10",
af8ef1affaf7bd Michael Tseng  2024-06-20  1115  					  "mbox11",
af8ef1affaf7bd Michael Tseng  2024-06-20  1116  					  "mbox12",
af8ef1affaf7bd Michael Tseng  2024-06-20  1117  					  "mbox13",
af8ef1affaf7bd Michael Tseng  2024-06-20  1118  					  "mbox14",
af8ef1affaf7bd Michael Tseng  2024-06-20  1119  					  "mbox15";
af8ef1affaf7bd Michael Tseng  2024-06-20  1120  			mediatek,mbox-extend = <16>;
af8ef1affaf7bd Michael Tseng  2024-06-20  1121  		};
af8ef1affaf7bd Michael Tseng  2024-06-20  1122  
3a88be54312101 Xavier Chang   2024-01-08  1123  		performance: performance-controller@c2c0f20 {
89dcc6e1084125 Xiufeng Li     2024-06-21  1124  			compatible = "mediatek,cpufreq-hw-v1";
3a88be54312101 Xavier Chang   2024-01-08  1125  			reg = <0 0xc2c0f20 0 0x120>,
3a88be54312101 Xavier Chang   2024-01-08  1126  			      <0 0xc2c1040 0 0x120>,
3a88be54312101 Xavier Chang   2024-01-08  1127  			      <0 0xc2c1160 0 0x120>;
3a88be54312101 Xavier Chang   2024-01-08  1128  			reg-names = "performance-domain0",
3a88be54312101 Xavier Chang   2024-01-08  1129  				    "performance-domain1",
3a88be54312101 Xavier Chang   2024-01-08  1130  				    "performance-domain2";
3a88be54312101 Xavier Chang   2024-01-08  1131  			#performance-domain-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1132  		};
3a88be54312101 Xavier Chang   2024-01-08  1133  
89dcc6e1084125 Xiufeng Li     2024-06-21  1134  		cpuhvfs: cpuhvfs@c2c2310 {
89dcc6e1084125 Xiufeng Li     2024-06-21  1135  			compatible = "mediatek,cpufreq-hybrid";
89dcc6e1084125 Xiufeng Li     2024-06-21  1136  			reg = <0 0x0c2c2310 0 0xc00>,
89dcc6e1084125 Xiufeng Li     2024-06-21  1137  			      <0 0x0c2c0f10 0 0x1400>,
89dcc6e1084125 Xiufeng Li     2024-06-21  1138  			      <0 0x0c2c4850 0 0x800>,
89dcc6e1084125 Xiufeng Li     2024-06-21  1139  			      <0 0x0c2c2e50 0 0xc0>;
89dcc6e1084125 Xiufeng Li     2024-06-21  1140  			reg-names = "USRAM", "CSRAM", "ESRAM", "FREQ_HW_STATE";
89dcc6e1084125 Xiufeng Li     2024-06-21  1141  
89dcc6e1084125 Xiufeng Li     2024-06-21  1142  			/* pll mcucfg */
89dcc6e1084125 Xiufeng Li     2024-06-21  1143  			mcucfg-ver = <0>;
89dcc6e1084125 Xiufeng Li     2024-06-21  1144  			apmixedsys = <&cpu_pll>;
89dcc6e1084125 Xiufeng Li     2024-06-21  1145  			clk-div-base = <&cpu_mcucfg>;
89dcc6e1084125 Xiufeng Li     2024-06-21  1146  
89dcc6e1084125 Xiufeng Li     2024-06-21  1147  			/* csram sysram base */
89dcc6e1084125 Xiufeng Li     2024-06-21  1148  			csram-sys-base = <&csram_sys>;
89dcc6e1084125 Xiufeng Li     2024-06-21  1149  		};
89dcc6e1084125 Xiufeng Li     2024-06-21  1150  
3a88be54312101 Xavier Chang   2024-01-08  1151  		gic: interrupt-controller@c400000 {
3a88be54312101 Xavier Chang   2024-01-08  1152  			compatible = "arm,gic-v3";
3a88be54312101 Xavier Chang   2024-01-08  1153  			reg = <0 0xc400000 0 0x40000>, /* distributor */
3a88be54312101 Xavier Chang   2024-01-08  1154  			      <0 0xc440000 0 0x200000>; /* redistributor */
3a88be54312101 Xavier Chang   2024-01-08  1155  			#interrupt-cells = <4>;
3a88be54312101 Xavier Chang   2024-01-08  1156  			#address-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08  1157  			#size-cells = <2>;
3a88be54312101 Xavier Chang   2024-01-08  1158  			#redistributor-regions = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1159  			interrupt-parent = <&gic>;
3a88be54312101 Xavier Chang   2024-01-08  1160  			interrupt-controller;
3a88be54312101 Xavier Chang   2024-01-08  1161  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1162  
3a88be54312101 Xavier Chang   2024-01-08  1163  			ppi-partitions {
3a88be54312101 Xavier Chang   2024-01-08  1164  				ppi_cluster0: interrupt-partition-0 {
3a88be54312101 Xavier Chang   2024-01-08  1165  					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
3a88be54312101 Xavier Chang   2024-01-08  1166  				};
3a88be54312101 Xavier Chang   2024-01-08  1167  
3a88be54312101 Xavier Chang   2024-01-08  1168  				ppi_cluster1: interrupt-partition-1 {
3a88be54312101 Xavier Chang   2024-01-08  1169  					affinity = <&cpu4 &cpu5 &cpu6>;
3a88be54312101 Xavier Chang   2024-01-08  1170  				};
3a88be54312101 Xavier Chang   2024-01-08  1171  
3a88be54312101 Xavier Chang   2024-01-08  1172  				ppi_cluster2: interrupt-partition-2 {
3a88be54312101 Xavier Chang   2024-01-08  1173  					affinity = <&cpu7>;
3a88be54312101 Xavier Chang   2024-01-08  1174  				};
3a88be54312101 Xavier Chang   2024-01-08  1175  			};
3a88be54312101 Xavier Chang   2024-01-08  1176  		};
3a88be54312101 Xavier Chang   2024-01-08  1177  
3a88be54312101 Xavier Chang   2024-01-08  1178  		cksys_clk: syscon@10000000 {
3a88be54312101 Xavier Chang   2024-01-08  1179  			compatible = "mediatek,mt8196-cksys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1180  			reg = <0 0x10000000 0 0x800>;
3a88be54312101 Xavier Chang   2024-01-08  1181  			hw-voter-regmap = <&hwv>;
3a88be54312101 Xavier Chang   2024-01-08  1182  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1183  		};
3a88be54312101 Xavier Chang   2024-01-08  1184  
3a88be54312101 Xavier Chang   2024-01-08  1185  		apmixedsys_clk: syscon@10000800 {
3a88be54312101 Xavier Chang   2024-01-08  1186  			compatible = "mediatek,mt8196-apmixedsys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1187  			reg = <0 0x10000800 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1188  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1189  		};
3a88be54312101 Xavier Chang   2024-01-08  1190  
3a88be54312101 Xavier Chang   2024-01-08  1191  		cksys_gp2_clk: syscon@1000c000 {
3a88be54312101 Xavier Chang   2024-01-08  1192  			compatible = "mediatek,mt8196-cksys-gp2", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1193  			reg = <0 0x1000c000 0 0x800>;
3a88be54312101 Xavier Chang   2024-01-08  1194  			mm-hw-ccf-regmap = <&mm_hwv>;
3a88be54312101 Xavier Chang   2024-01-08  1195  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1196  		};
3a88be54312101 Xavier Chang   2024-01-08  1197  
3a88be54312101 Xavier Chang   2024-01-08  1198  		apmixedsys_gp2_clk: syscon@1000c800 {
3a88be54312101 Xavier Chang   2024-01-08  1199  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1200  			compatible = "mediatek,mt8196-apmixedsys-gp2", "mediatek,mt8196-apmixedsys_gp2", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1201  			reg = <0 0x1000c800 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1202  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1203  		};
3a88be54312101 Xavier Chang   2024-01-08  1204  
3a88be54312101 Xavier Chang   2024-01-08  1205  		ifr_bus: syscon@1002c000 {
3a88be54312101 Xavier Chang   2024-01-08  1206  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1207  			compatible = "mediatek,mt8196-ifr-bus", "mediatek,mt8196-ifr_bus", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1208  			reg = <0 0x1002c000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1209  		};
3a88be54312101 Xavier Chang   2024-01-08  1210  
22882fd26feeb6 Guodong Liu    2024-01-20  1211  		pio: pinctrl@1002d000 {
22882fd26feeb6 Guodong Liu    2024-01-20  1212  			compatible = "mediatek,mt8196-pinctrl";
22882fd26feeb6 Guodong Liu    2024-01-20  1213  			reg = <0 0x1002d000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1214  			      <0 0x12000000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1215  			      <0 0x12020000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1216  			      <0 0x12040000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1217  			      <0 0x12060000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1218  			      <0 0x12820000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1219  			      <0 0x12840000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1220  			      <0 0x12860000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1221  			      <0 0x13000000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1222  			      <0 0x13020000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1223  			      <0 0x13040000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1224  			      <0 0x130f0000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1225  			      <0 0x13110000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1226  			      <0 0x13800000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1227  			      <0 0x13820000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1228  			      <0 0x13860000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1229  			      <0 0x12080000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1230  			      <0 0x12880000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1231  			      <0 0x13080000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1232  			      <0 0x13880000 0 0x1000>,
22882fd26feeb6 Guodong Liu    2024-01-20  1233  			      <0 0x1c54a000 0 0x1000>;
22882fd26feeb6 Guodong Liu    2024-01-20  1234  			reg-names = "iocfg0",
22882fd26feeb6 Guodong Liu    2024-01-20  1235  				    "iocfg_rt",
22882fd26feeb6 Guodong Liu    2024-01-20  1236  				    "iocfg_rm1",
22882fd26feeb6 Guodong Liu    2024-01-20  1237  				    "iocfg_rm2",
22882fd26feeb6 Guodong Liu    2024-01-20  1238  				    "iocfg_rb",
22882fd26feeb6 Guodong Liu    2024-01-20  1239  				    "iocfg_bm1",
22882fd26feeb6 Guodong Liu    2024-01-20  1240  				    "iocfg_bm2",
22882fd26feeb6 Guodong Liu    2024-01-20  1241  				    "iocfg_bm3",
22882fd26feeb6 Guodong Liu    2024-01-20  1242  				    "iocfg_lt",
22882fd26feeb6 Guodong Liu    2024-01-20  1243  				    "iocfg_lm1",
22882fd26feeb6 Guodong Liu    2024-01-20  1244  				    "iocfg_lm2",
22882fd26feeb6 Guodong Liu    2024-01-20  1245  				    "iocfg_lb1",
22882fd26feeb6 Guodong Liu    2024-01-20  1246  				    "iocfg_lb2",
22882fd26feeb6 Guodong Liu    2024-01-20  1247  				    "iocfg_tm1",
22882fd26feeb6 Guodong Liu    2024-01-20  1248  				    "iocfg_tm2",
22882fd26feeb6 Guodong Liu    2024-01-20  1249  				    "iocfg_tm3",
22882fd26feeb6 Guodong Liu    2024-01-20  1250  				    "eint-e",
22882fd26feeb6 Guodong Liu    2024-01-20  1251  				    "eint-s",
22882fd26feeb6 Guodong Liu    2024-01-20  1252  				    "eint-w",
22882fd26feeb6 Guodong Liu    2024-01-20  1253  				    "eint-n",
22882fd26feeb6 Guodong Liu    2024-01-20  1254  				    "eint-c";
22882fd26feeb6 Guodong Liu    2024-01-20  1255  			gpio-controller;
22882fd26feeb6 Guodong Liu    2024-01-20  1256  			#gpio-cells = <2>;
22882fd26feeb6 Guodong Liu    2024-01-20  1257  			gpio-ranges = <&pio 0 0 271>;
22882fd26feeb6 Guodong Liu    2024-01-20  1258  			interrupt-controller;
22882fd26feeb6 Guodong Liu    2024-01-20  1259  			interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH 0>;
22882fd26feeb6 Guodong Liu    2024-01-20  1260  			#interrupt-cells = <2>;
22882fd26feeb6 Guodong Liu    2024-01-20  1261  		};
22882fd26feeb6 Guodong Liu    2024-01-20  1262  
2905358ad1479d Crystal Guo    2024-07-24  1263  		memory-controller@10236000 {
2905358ad1479d Crystal Guo    2024-07-24  1264  			compatible = "mediatek,mt8196-dramc";
2905358ad1479d Crystal Guo    2024-07-24  1265  			reg = <0 0x10236000 0 0x2000>, /* anaphy base */
2905358ad1479d Crystal Guo    2024-07-24  1266  			      <0 0x10238000 0 0x2000>;  /* ddrphy base */
2905358ad1479d Crystal Guo    2024-07-24  1267  		};
2905358ad1479d Crystal Guo    2024-07-24  1268  
b9408b7224ce87 Runyang Chen   2024-03-26  1269  		devapc_apinfra_dramc: devapc@102f3000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1270  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1271  			reg = <0 0x102f3000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1272  			vio-idx-num = <61>;
b9408b7224ce87 Runyang Chen   2024-03-26  1273  			interrupts = <GIC_SPI 870 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1274  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1275  
3a41185f82d985 Nolan Yang     2024-05-10  1276  		nsmpu: nsmpu@1046f000 {
3a41185f82d985 Nolan Yang     2024-05-10  1277  			/* TODO: Move some property into platform data */
3a41185f82d985 Nolan Yang     2024-05-10  1278  			compatible = "mediatek,smpu";
3a41185f82d985 Nolan Yang     2024-05-10  1279  			reg = <0 0x1046f000 0 0x1000>;
3a41185f82d985 Nolan Yang     2024-05-10  1280  			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH 0>;
3a41185f82d985 Nolan Yang     2024-05-10  1281  			name = "nsmpu";
3a41185f82d985 Nolan Yang     2024-05-10  1282  			sr-cnt = <63>;
3a41185f82d985 Nolan Yang     2024-05-10  1283  			aid-cnt = <256>;
3a41185f82d985 Nolan Yang     2024-05-10  1284  			aid-num-per-set = <32>;
3a41185f82d985 Nolan Yang     2024-05-10  1285  			dump = <0xe00 0xe08 0xe0c 0xe10 0xe14 0xe18 0xe1c 0xe20 0xe28
3a41185f82d985 Nolan Yang     2024-05-10  1286  				0xe80 0xe88 0xe8c 0xe90 0xe94 0xe98 0xe9c 0xea0 0xea8>;
3a41185f82d985 Nolan Yang     2024-05-10  1287  			dump-md = <0xe40 0xe48 0xe4c 0xe50 0xe54 0xe58 0xe5c 0xe60 0xe68
3a41185f82d985 Nolan Yang     2024-05-10  1288  				0xec0 0xec8 0xecc 0xed0 0xed4 0xed8 0xedc 0xee0 0xee8>;
3a41185f82d985 Nolan Yang     2024-05-10  1289  			clear = <0xe00 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1290  				<0xe00 0x0 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1291  				<0xe80 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1292  				<0xe80 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1293  			mask = <0xe00 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1294  				<0xe80 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1295  				<0xe40 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1296  				<0xec0 0x2 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1297  			clear-md = <0xe40 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1298  				   <0xe40 0x0 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1299  				   <0xec0 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1300  				   <0xec0 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1301  			vio-info = <0x0 0x2 0x9 0x2>;
3a41185f82d985 Nolan Yang     2024-05-10  1302  			bypass = <0xe1c 0xe9c 0xe28 0xea8>;
3a41185f82d985 Nolan Yang     2024-05-10  1303  			bypass-axi = <0x6 0xff80 0x4000 0x7 0xff01 0x4001>;
3a41185f82d985 Nolan Yang     2024-05-10  1304  			bypass-wce = <0x5 0xf3 0x7 0x16>;
3a41185f82d985 Nolan Yang     2024-05-10  1305  			mediatek,slc-b-mode;
3a41185f82d985 Nolan Yang     2024-05-10  1306  		};
3a41185f82d985 Nolan Yang     2024-05-10  1307  
3a41185f82d985 Nolan Yang     2024-05-10  1308  		ssmpu: ssmpu@1056f000{
3a41185f82d985 Nolan Yang     2024-05-10  1309  			/* TODO: Move some property into platform data */
3a41185f82d985 Nolan Yang     2024-05-10  1310  			compatible = "mediatek,smpu";
3a41185f82d985 Nolan Yang     2024-05-10  1311  			reg = <0 0x1056f000 0 0x1000>;
3a41185f82d985 Nolan Yang     2024-05-10  1312  			interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH 0>;
3a41185f82d985 Nolan Yang     2024-05-10  1313  			name = "ssmpu";
3a41185f82d985 Nolan Yang     2024-05-10  1314  			dump = <0xe00 0xe08 0xe0c 0xe10 0xe14 0xe18 0xe1c 0xe20 0xe28
3a41185f82d985 Nolan Yang     2024-05-10  1315  				0xe80 0xe88 0xe8c 0xe90 0xe94 0xe98 0xe9c 0xea0 0xea8>;
3a41185f82d985 Nolan Yang     2024-05-10  1316  			dump-md = <0xe40 0xe48 0xe4c 0xe50 0xe54 0xe58 0xe5c 0xe60 0xe68
3a41185f82d985 Nolan Yang     2024-05-10  1317  				   0xec0 0xec8 0xecc 0xed0 0xed4 0xed8 0xedc 0xee0 0xee8>;
3a41185f82d985 Nolan Yang     2024-05-10  1318  			clear = <0xe00 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1319  				<0xe00 0x0 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1320  				<0xe80 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1321  				<0xe80 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1322  			mask = <0xe00 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1323  			       <0xe80 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1324  			       <0xe40 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1325  			       <0xec0 0x2 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1326  			clear-md = <0xe40 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1327  				   <0xe40 0x0 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1328  				   <0xec0 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1329  				   <0xec0 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1330  			vio-info = <0x0 0x2 0x9 0x2>;
3a41185f82d985 Nolan Yang     2024-05-10  1331  			bypass = <0xe1c 0xe9c 0xe28 0xea8>;
3a41185f82d985 Nolan Yang     2024-05-10  1332  			bypass-axi = <0x6 0xff80 0x4000 0x7 0xff01 0x4001>;
3a41185f82d985 Nolan Yang     2024-05-10  1333  			bypass-wce = <0x5 0xf3 0x7 0x16>;
3a41185f82d985 Nolan Yang     2024-05-10  1334  			mediatek,slc-b-mode;
3a41185f82d985 Nolan Yang     2024-05-10  1335  		};
3a41185f82d985 Nolan Yang     2024-05-10  1336  
3a41185f82d985 Nolan Yang     2024-05-10  1337  		nkp: nkp@1046f000 {
3a41185f82d985 Nolan Yang     2024-05-10  1338  			/* TODO: Move some property into platform data */
3a41185f82d985 Nolan Yang     2024-05-10  1339  			compatible = "mediatek,smpu";
3a41185f82d985 Nolan Yang     2024-05-10  1340  			reg = <0 0x1046f000 0 0x1000>;
3a41185f82d985 Nolan Yang     2024-05-10  1341  			interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH 0>;
3a41185f82d985 Nolan Yang     2024-05-10  1342  			name = "nkp";
3a41185f82d985 Nolan Yang     2024-05-10  1343  			dump = <0xc00 0xc04 0xc10 0xc14>;
3a41185f82d985 Nolan Yang     2024-05-10  1344  			clear = <0x410 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1345  				<0x410 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1346  			mask = <0x410 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1347  			       <0xe40 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1348  			       <0xec0 0x2 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1349  			clear-md = <0xe40 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1350  				   <0xe40 0x0 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1351  				   <0xec0 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1352  				   <0xec0 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1353  			vio-info = <0x1 0xf 0x3 0xf>;
3a41185f82d985 Nolan Yang     2024-05-10  1354  			mediatek,slc-b-mode;
3a41185f82d985 Nolan Yang     2024-05-10  1355  		};
3a41185f82d985 Nolan Yang     2024-05-10  1356  
3a41185f82d985 Nolan Yang     2024-05-10  1357  		skp: skp@1056f000 {
3a41185f82d985 Nolan Yang     2024-05-10  1358  			/* TODO: Move some property into platform data */
3a41185f82d985 Nolan Yang     2024-05-10  1359  			compatible = "mediatek,smpu";
3a41185f82d985 Nolan Yang     2024-05-10  1360  			reg = <0 0x1056f000 0 0x1000>;
3a41185f82d985 Nolan Yang     2024-05-10  1361  			interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>;
3a41185f82d985 Nolan Yang     2024-05-10  1362  			name = "skp";
3a41185f82d985 Nolan Yang     2024-05-10  1363  			dump = <0xc00 0xc04 0xc10 0xc14>;
3a41185f82d985 Nolan Yang     2024-05-10  1364  			clear = <0x410 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1365  				<0x410 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1366  			mask = <0x410 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1367  			       <0xe40 0x2 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1368  			       <0xec0 0x2 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1369  			clear-md = <0xe40 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1370  				   <0xe40 0x0 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1371  				   <0xec0 0x1 1>,
3a41185f82d985 Nolan Yang     2024-05-10  1372  				   <0xec0 0x0 1>;
3a41185f82d985 Nolan Yang     2024-05-10  1373  			vio-info = <0x1 0xf 0x3 0xf>;
3a41185f82d985 Nolan Yang     2024-05-10  1374  			mediatek,slc-b-mode;
3a41185f82d985 Nolan Yang     2024-05-10  1375  		};
3a41185f82d985 Nolan Yang     2024-05-10  1376  
b9408b7224ce87 Runyang Chen   2024-03-26  1377  		devapc_apinfra_emi: devapc@10613000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1378  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1379  			reg = <0 0x10613000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1380  			vio-idx-num = <149>;
b9408b7224ce87 Runyang Chen   2024-03-26  1381  			interrupts = <GIC_SPI 869 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1382  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1383  
b9408b7224ce87 Runyang Chen   2024-03-26  1384  		devapc_apinfra_big4: devapc@10693000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1385  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1386  			reg = <0 0x10693000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1387  			vio-idx-num = <89>;
b9408b7224ce87 Runyang Chen   2024-03-26  1388  			interrupts = <GIC_SPI 863 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1389  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1390  
3a88be54312101 Xavier Chang   2024-01-08  1391  		i2c5: i2c@120a0000 {
3a88be54312101 Xavier Chang   2024-01-08  1392  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1393  			reg = <0 0x120a0000 0 0x20000>,
3a88be54312101 Xavier Chang   2024-01-08  1394  			      <0 0x16400000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1395  			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1396  			clocks = <&imp_iic_wrap_e_clk CLK_IMPE_I2C5_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1397  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1398  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1399  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1400  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1401  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1402  
3a88be54312101 Xavier Chang   2024-01-08  1403  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1404  		};
3a88be54312101 Xavier Chang   2024-01-08  1405  
3a88be54312101 Xavier Chang   2024-01-08  1406  		imp_iic_wrap_e_clk: syscon@120c0000 {
3a88be54312101 Xavier Chang   2024-01-08  1407  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1408  			compatible = "mediatek,mt8196-imp-iic-wrap-e", "mediatek,mt8196-imp_iic_wrap_e", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1409  			reg = <0 0x120c0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1410  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1411  		};
3a88be54312101 Xavier Chang   2024-01-08  1412  
9a5b02d04139ce Shuijing Li    2024-07-17  1413  		mipi_tx_config0: mipi-tx-config@130b0000 {
9a5b02d04139ce Shuijing Li    2024-07-17  1414  			compatible = "mediatek,mt8196-mipi-tx";
9a5b02d04139ce Shuijing Li    2024-07-17  1415  			reg = <0 0x130b0000 0 0x1000>;
9a5b02d04139ce Shuijing Li    2024-07-17  1416  			clocks = <&clk26m>;
9a5b02d04139ce Shuijing Li    2024-07-17  1417  			#clock-cells = <0>;
9a5b02d04139ce Shuijing Li    2024-07-17  1418  			#phy-cells = <0>;
9a5b02d04139ce Shuijing Li    2024-07-17  1419  			clock-output-names = "mipi_tx0_pll";
9a5b02d04139ce Shuijing Li    2024-07-17  1420  		};
9a5b02d04139ce Shuijing Li    2024-07-17  1421  
3a88be54312101 Xavier Chang   2024-01-08  1422  		i2c0: i2c@13130000 {
3a88be54312101 Xavier Chang   2024-01-08  1423  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1424  			reg = <0 0x13130000 0 0x20000>,
3a88be54312101 Xavier Chang   2024-01-08  1425  			      <0 0x16370000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1426  			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1427  			clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C0_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1428  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1429  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1430  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1431  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1432  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1433  
3a88be54312101 Xavier Chang   2024-01-08  1434  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1435  		};
3a88be54312101 Xavier Chang   2024-01-08  1436  
3a88be54312101 Xavier Chang   2024-01-08  1437  		i2c3: i2c@13150000 {
3a88be54312101 Xavier Chang   2024-01-08  1438  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1439  			reg = <0 0x13150000 0 0x20000>,
3a88be54312101 Xavier Chang   2024-01-08  1440  			      <0 0x163c0000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1441  			interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1442  			clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C3_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1443  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1444  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1445  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1446  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1447  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1448  
3a88be54312101 Xavier Chang   2024-01-08  1449  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1450  		};
3a88be54312101 Xavier Chang   2024-01-08  1451  
3a88be54312101 Xavier Chang   2024-01-08  1452  		i2c6: i2c@13170000 {
3a88be54312101 Xavier Chang   2024-01-08  1453  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1454  			reg = <0 0x13170000 0 0x20000>,
3a88be54312101 Xavier Chang   2024-01-08  1455  			      <0 0x16410000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1456  			interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1457  			clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C6_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1458  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1459  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1460  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1461  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1462  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1463  
3a88be54312101 Xavier Chang   2024-01-08  1464  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1465  		};
3a88be54312101 Xavier Chang   2024-01-08  1466  
3a88be54312101 Xavier Chang   2024-01-08  1467  		i2c10: i2c@13190000 {
3a88be54312101 Xavier Chang   2024-01-08  1468  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1469  			reg = <0 0x13190000 0 0x20000>,
3a88be54312101 Xavier Chang   2024-01-08  1470  			      <0 0x164b0000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1471  			interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1472  			clocks = <&imp_iic_wrap_w_clk CLK_IMPW_I2C10_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1473  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1474  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1475  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1476  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1477  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1478  
3a88be54312101 Xavier Chang   2024-01-08  1479  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1480  		};
3a88be54312101 Xavier Chang   2024-01-08  1481  
3a88be54312101 Xavier Chang   2024-01-08  1482  		imp_iic_wrap_w_clk: syscon@131b0000 {
3a88be54312101 Xavier Chang   2024-01-08  1483  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1484  			compatible = "mediatek,mt8196-imp-iic-wrap-w", "mediatek,mt8196-imp_iic_wrap_w", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1485  			reg = <0 0x131b0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1486  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1487  		};
3a88be54312101 Xavier Chang   2024-01-08  1488  
576847ca8eb1b0 William-tw Lin 2024-03-01  1489  		efuse: efuse@13260000 {
576847ca8eb1b0 William-tw Lin 2024-03-01  1490  			compatible = "mediatek,mt8196-efuse", "mediatek,efuse";
576847ca8eb1b0 William-tw Lin 2024-03-01  1491  			reg = <0 0x13260000 0 0x1000>;
576847ca8eb1b0 William-tw Lin 2024-03-01  1492  			#address-cells = <1>;
576847ca8eb1b0 William-tw Lin 2024-03-01  1493  			#size-cells = <1>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1494  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1495  			lvts_e_data1: data1@334 {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1496  				reg = <0x334 0xc>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1497  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1498  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1499  			lvts_e_data2: data2@340 {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1500  				reg = <0x340 0x14>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1501  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1502  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1503  			lvts_e_data3: data3@354 {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1504  				reg = <0x354 0x20>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1505  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1506  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1507  			lvts_e_data4: data4@388 {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1508  				reg = <0x388 0x20>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1509  			};
5c77cb151de366 Xavier Chang   2024-08-08  1510  
5c77cb151de366 Xavier Chang   2024-08-08  1511  			socinfo-data1@40 {
5c77cb151de366 Xavier Chang   2024-08-08  1512  				reg = <0x40 0x4>;
5c77cb151de366 Xavier Chang   2024-08-08  1513  			};
5c77cb151de366 Xavier Chang   2024-08-08  1514  
5c77cb151de366 Xavier Chang   2024-08-08  1515  			socinfo-data2@4c {
5c77cb151de366 Xavier Chang   2024-08-08  1516  				reg = <0x4c 0x4>;
5c77cb151de366 Xavier Chang   2024-08-08  1517  			};
576847ca8eb1b0 William-tw Lin 2024-03-01  1518  		};
576847ca8eb1b0 William-tw Lin 2024-03-01  1519  
3a88be54312101 Xavier Chang   2024-01-08  1520  		i2c1: i2c@13930000 {
3a88be54312101 Xavier Chang   2024-01-08  1521  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1522  			reg = <0 0x13930000 0 0x80000>,
3a88be54312101 Xavier Chang   2024-01-08  1523  			      <0 0x16380000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1524  			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1525  			clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C1_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1526  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1527  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1528  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1529  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1530  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1531  
3a88be54312101 Xavier Chang   2024-01-08  1532  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1533  		};
3a88be54312101 Xavier Chang   2024-01-08  1534  
3a88be54312101 Xavier Chang   2024-01-08  1535  		i2c2: i2c@139b0000 {
3a88be54312101 Xavier Chang   2024-01-08  1536  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1537  			reg = <0 0x139b0000 0 0x80000>,
3a88be54312101 Xavier Chang   2024-01-08  1538  			      <0 0x16390000 0 0x30000>;
3a88be54312101 Xavier Chang   2024-01-08  1539  			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1540  			clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C2_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1541  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1542  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1543  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1544  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1545  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1546  
3a88be54312101 Xavier Chang   2024-01-08  1547  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1548  		};
3a88be54312101 Xavier Chang   2024-01-08  1549  
3a88be54312101 Xavier Chang   2024-01-08  1550  		i2c4: i2c@13a30000 {
3a88be54312101 Xavier Chang   2024-01-08  1551  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1552  			reg = <0 0x13a30000 0 0x80000>,
3a88be54312101 Xavier Chang   2024-01-08  1553  			      <0 0x163d0000 0 0x30000>;
3a88be54312101 Xavier Chang   2024-01-08  1554  			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1555  			clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C4_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1556  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1557  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1558  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1559  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1560  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1561  
3a88be54312101 Xavier Chang   2024-01-08  1562  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1563  		};
3a88be54312101 Xavier Chang   2024-01-08  1564  
3a88be54312101 Xavier Chang   2024-01-08  1565  		i2c7: i2c@13ab0000 {
3a88be54312101 Xavier Chang   2024-01-08  1566  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1567  			reg = <0 0x13ab0000 0 0x80000>,
3a88be54312101 Xavier Chang   2024-01-08  1568  			      <0 0x16420000 0 0x30000>;
3a88be54312101 Xavier Chang   2024-01-08  1569  			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1570  			clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C7_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1571  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1572  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1573  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1574  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1575  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1576  
3a88be54312101 Xavier Chang   2024-01-08  1577  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1578  		};
3a88be54312101 Xavier Chang   2024-01-08  1579  
3a88be54312101 Xavier Chang   2024-01-08  1580  		i2c8: i2c@13b30000 {
3a88be54312101 Xavier Chang   2024-01-08  1581  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1582  			reg = <0 0x13b30000 0 0x80000>,
3a88be54312101 Xavier Chang   2024-01-08  1583  			      <0 0x16450000 0 0x30000>;
3a88be54312101 Xavier Chang   2024-01-08  1584  			interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1585  			clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C8_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1586  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1587  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1588  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1589  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1590  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1591  
3a88be54312101 Xavier Chang   2024-01-08  1592  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1593  		};
3a88be54312101 Xavier Chang   2024-01-08  1594  
3a88be54312101 Xavier Chang   2024-01-08  1595  		i2c9: i2c@13bb0000 {
3a88be54312101 Xavier Chang   2024-01-08  1596  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1597  			reg = <0 0x13bb0000 0 0x80000>,
3a88be54312101 Xavier Chang   2024-01-08  1598  			      <0 0x16480000 0 0x30000>;
3a88be54312101 Xavier Chang   2024-01-08  1599  			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1600  			clocks = <&imp_iic_wrap_n_clk CLK_IMPN_I2C9_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1601  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1602  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1603  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1604  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1605  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1606  
3a88be54312101 Xavier Chang   2024-01-08  1607  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1608  		};
3a88be54312101 Xavier Chang   2024-01-08  1609  
3a88be54312101 Xavier Chang   2024-01-08  1610  		imp_iic_wrap_n_clk: syscon@13c30000 {
3a88be54312101 Xavier Chang   2024-01-08  1611  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1612  			compatible = "mediatek,mt8196-imp-iic-wrap-n", "mediatek,mt8196-imp_iic_wrap_n", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1613  			reg = <0 0x13c30000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1614  			hw-voter-regmap = <&hwv>;
3a88be54312101 Xavier Chang   2024-01-08  1615  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1616  		};
3a88be54312101 Xavier Chang   2024-01-08  1617  
b9408b7224ce87 Runyang Chen   2024-03-26  1618  		devapc_apinfra_io_intf: devapc@140a0000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1619  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1620  			reg = <0 0x140a0000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1621  			vio-idx-num = <8>;
b9408b7224ce87 Runyang Chen   2024-03-26  1622  			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1623  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1624  
b9408b7224ce87 Runyang Chen   2024-03-26  1625  		devapc_apinfra_mem_intf: devapc@140c0000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1626  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1627  			reg = <0 0x140c0000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1628  			vio-idx-num = <7>;
b9408b7224ce87 Runyang Chen   2024-03-26  1629  			interrupts = <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1630  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1631  
b9408b7224ce87 Runyang Chen   2024-03-26  1632  		devapc_apinfra_slb: devapc@140e0000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1633  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1634  			reg = <0 0x140e0000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1635  			vio-idx-num = <14>;
b9408b7224ce87 Runyang Chen   2024-03-26  1636  			interrupts = <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1637  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1638  
3a88be54312101 Xavier Chang   2024-01-08  1639  		apifrbus_ao_mem_reg_clk: syscon@14126000 {
3a88be54312101 Xavier Chang   2024-01-08  1640  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1641  			compatible = "mediatek,mt8196-apifrbus-ao-mem-reg", "mediatek,mt8196-apifrbus_ao_mem_reg", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1642  			reg = <0 0x14126000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1643  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1644  		};
3a88be54312101 Xavier Chang   2024-01-08  1645  
b9408b7224ce87 Runyang Chen   2024-03-26  1646  		devapc_apinfra_mem: devapc@14130000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1647  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1648  			reg = <0 0x14130000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1649  			vio-idx-num = <13>;
b9408b7224ce87 Runyang Chen   2024-03-26  1650  			interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1651  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1652  
b9408b7224ce87 Runyang Chen   2024-03-26  1653  		devapc_apinfra_mem_ctrl: devapc@14131000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1654  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1655  			reg = <0 0x14131000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1656  			vio-idx-num = <23>;
b9408b7224ce87 Runyang Chen   2024-03-26  1657  			interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1658  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1659  
b9408b7224ce87 Runyang Chen   2024-03-26  1660  		infracfg@14136000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1661  			compatible = "mediatek,infracfg";
b9408b7224ce87 Runyang Chen   2024-03-26  1662  			reg = <0 0x14136000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1663  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1664  
b9408b7224ce87 Runyang Chen   2024-03-26  1665  		devapc_apinfra_int: devapc@142f4000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1666  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1667  			reg = <0 0x142f4000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1668  			vio-idx-num = <26>;
b9408b7224ce87 Runyang Chen   2024-03-26  1669  			interrupts = <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1670  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1671  
b9408b7224ce87 Runyang Chen   2024-03-26  1672  		devapc_apinfra_io_ctrl: devapc@14400000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1673  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1674  			reg = <0 0x14400000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1675  			vio-idx-num = <10>;
b9408b7224ce87 Runyang Chen   2024-03-26  1676  			interrupts = <GIC_SPI 868 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1677  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1678  
b9408b7224ce87 Runyang Chen   2024-03-26  1679  		devapc_apinfra_io: devapc@14401000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1680  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1681  			reg = <0 0x14401000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1682  			vio-idx-num = <230>;
b9408b7224ce87 Runyang Chen   2024-03-26  1683  			interrupts = <GIC_SPI 867 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1684  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1685  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1686  		lvts: thermal-sensor@14414000 {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1687  			compatible = "mediatek,mt8196-lvts";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1688  			reg = <0 0x14414000 0 0x1000>,
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1689  				<0 0x0c230000 0 0x1000>,
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1690  				<0 0x19004000 0 0x1000>,
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1691  				<0 0x4b400000 0 0x1000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1692  			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>,
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1693  					<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>,
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1694  					<GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH 0>,
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1695  					<GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH 0>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1696  			#thermal-sensor-cells = <1>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1697  			nvmem-cells = <&lvts_e_data1 &lvts_e_data2 &lvts_e_data3
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1698  					&lvts_e_data4>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1699  			nvmem-cell-names = "e_data1","e_data2","e_data3","e_data4";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1700  		};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  1701  
3a88be54312101 Xavier Chang   2024-01-08  1702  		hwv: syscon@14500000 {
3a88be54312101 Xavier Chang   2024-01-08  1703  			compatible = "mediatek,mt8196-hwv", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1704  			reg = <0 0x14500000 0 0x3000>;
3a88be54312101 Xavier Chang   2024-01-08  1705  		};
3a88be54312101 Xavier Chang   2024-01-08  1706  
b9408b7224ce87 Runyang Chen   2024-03-26  1707  		devapc_apinfra_mmu: devapc@14800000 {
b9408b7224ce87 Runyang Chen   2024-03-26  1708  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  1709  			reg = <0 0x14800000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  1710  			vio-idx-num = <20>;
b9408b7224ce87 Runyang Chen   2024-03-26  1711  			interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  1712  		};
b9408b7224ce87 Runyang Chen   2024-03-26  1713  
3a88be54312101 Xavier Chang   2024-01-08  1714  		uart0: serial@16000000 {
3a88be54312101 Xavier Chang   2024-01-08  1715  			compatible = "mediatek,mt6577-uart";
3a88be54312101 Xavier Chang   2024-01-08  1716  			reg = <0 0x16000000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1717  			interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1718  			clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART0_BCLK_UART>;
3a88be54312101 Xavier Chang   2024-01-08  1719  			clock-names = "baud", "bus";
3a88be54312101 Xavier Chang   2024-01-08  1720  
3a88be54312101 Xavier Chang   2024-01-08  1721  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1722  		};
3a88be54312101 Xavier Chang   2024-01-08  1723  
3a88be54312101 Xavier Chang   2024-01-08  1724  		uart1: serial@16010000 {
3a88be54312101 Xavier Chang   2024-01-08  1725  			compatible = "mediatek,mt6577-uart";
3a88be54312101 Xavier Chang   2024-01-08  1726  			reg = <0 0x16010000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1727  			interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1728  			clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART1_BCLK_UART>;
3a88be54312101 Xavier Chang   2024-01-08  1729  			clock-names = "baud", "bus";
3a88be54312101 Xavier Chang   2024-01-08  1730  
3a88be54312101 Xavier Chang   2024-01-08  1731  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1732  		};
3a88be54312101 Xavier Chang   2024-01-08  1733  
3a88be54312101 Xavier Chang   2024-01-08  1734  		uart2: serial@16020000 {
3a88be54312101 Xavier Chang   2024-01-08  1735  			compatible = "mediatek,mt6577-uart";
3a88be54312101 Xavier Chang   2024-01-08  1736  			reg = <0 0x16020000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1737  			interrupts = <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1738  			clocks = <&clk26m>, <&pericfg_ao_clk CLK_PERAO_UART2_BCLK_UART>;
3a88be54312101 Xavier Chang   2024-01-08  1739  			clock-names = "baud", "bus";
3a88be54312101 Xavier Chang   2024-01-08  1740  
3a88be54312101 Xavier Chang   2024-01-08  1741  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1742  		};
3a88be54312101 Xavier Chang   2024-01-08  1743  
3a88be54312101 Xavier Chang   2024-01-08  1744  		uart3: serial@16030000 {
3a88be54312101 Xavier Chang   2024-01-08  1745  			compatible = "mediatek,mt6985-uart";
3a88be54312101 Xavier Chang   2024-01-08  1746  			reg = <0 0x16030000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1747  			interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH 0>,
3a88be54312101 Xavier Chang   2024-01-08  1748  				     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH 0>;    /* uart3 wakeup irq */
3a88be54312101 Xavier Chang   2024-01-08  1749  			clocks = <&clk104m>, <&pericfg_ao_clk CLK_PERAO_UART3_BCLK_UART>;
3a88be54312101 Xavier Chang   2024-01-08  1750  			clock-names = "baud", "bus";
3a88be54312101 Xavier Chang   2024-01-08  1751  
3a88be54312101 Xavier Chang   2024-01-08  1752  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1753  		};
3a88be54312101 Xavier Chang   2024-01-08  1754  
45e3c3db4a7683 Jitao Shi      2024-04-02  1755  		disp_pwm0: disp-pwm0@160b0000 {
45e3c3db4a7683 Jitao Shi      2024-04-02  1756  			compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
45e3c3db4a7683 Jitao Shi      2024-04-02  1757  			reg = <0 0x160b0000 0 0x1000>;
45e3c3db4a7683 Jitao Shi      2024-04-02  1758  			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
45e3c3db4a7683 Jitao Shi      2024-04-02  1759  			#pwm-cells = <2>;
45e3c3db4a7683 Jitao Shi      2024-04-02  1760  			clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
45e3c3db4a7683 Jitao Shi      2024-04-02  1761  			clock-names = "main";
45e3c3db4a7683 Jitao Shi      2024-04-02  1762  			status = "disabled";
45e3c3db4a7683 Jitao Shi      2024-04-02  1763  		};
45e3c3db4a7683 Jitao Shi      2024-04-02  1764  
45e3c3db4a7683 Jitao Shi      2024-04-02  1765  		disp_pwm1: disp-pwm1@160c0000 {
45e3c3db4a7683 Jitao Shi      2024-04-02  1766  			compatible = "mediatek,mt8196-disp-pwm", "mediatek,mt8183-disp-pwm";
45e3c3db4a7683 Jitao Shi      2024-04-02  1767  			reg = <0 0x160c0000 0 0x1000>;
45e3c3db4a7683 Jitao Shi      2024-04-02  1768  			#pwm-cells = <2>;
45e3c3db4a7683 Jitao Shi      2024-04-02  1769  			clocks = <&cksys_clk CLK_CK_DISP_PWM_SEL>;
45e3c3db4a7683 Jitao Shi      2024-04-02  1770  			clock-names = "main";
45e3c3db4a7683 Jitao Shi      2024-04-02  1771  			status = "disabled";
45e3c3db4a7683 Jitao Shi      2024-04-02  1772  		};
45e3c3db4a7683 Jitao Shi      2024-04-02  1773  
3a88be54312101 Xavier Chang   2024-01-08  1774  		spi0: spi@16110000 {
3a88be54312101 Xavier Chang   2024-01-08  1775  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  1776  			reg = <0 0x16110000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  1777  			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1778  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  1779  				<&cksys_clk CLK_CK_SPI0_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  1780  				<&pericfg_ao_clk CLK_PERAO_SPI0_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  1781  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  1782  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1783  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1784  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1785  
3a88be54312101 Xavier Chang   2024-01-08  1786  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1787  		};
3a88be54312101 Xavier Chang   2024-01-08  1788  
3a88be54312101 Xavier Chang   2024-01-08  1789  		spi1: spi@16130000 {
3a88be54312101 Xavier Chang   2024-01-08  1790  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  1791  			reg = <0 0x16130000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  1792  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1793  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  1794  				<&cksys_clk CLK_CK_SPI1_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  1795  				<&pericfg_ao_clk CLK_PERAO_SPI1_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  1796  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  1797  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1798  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1799  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1800  
3a88be54312101 Xavier Chang   2024-01-08  1801  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1802  		};
3a88be54312101 Xavier Chang   2024-01-08  1803  
3a88be54312101 Xavier Chang   2024-01-08  1804  		spi2: spi@16150000 {
3a88be54312101 Xavier Chang   2024-01-08  1805  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  1806  			reg = <0 0x16150000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  1807  			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1808  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  1809  				<&cksys_clk CLK_CK_SPI2_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  1810  				<&pericfg_ao_clk CLK_PERAO_SPI2_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  1811  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  1812  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1813  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1814  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1815  
3a88be54312101 Xavier Chang   2024-01-08  1816  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1817  		};
3a88be54312101 Xavier Chang   2024-01-08  1818  
3a88be54312101 Xavier Chang   2024-01-08  1819  		spi3: spi@16170000 {
3a88be54312101 Xavier Chang   2024-01-08  1820  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  1821  			reg = <0 0x16170000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  1822  			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1823  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  1824  				<&cksys_clk CLK_CK_SPI3_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  1825  				<&pericfg_ao_clk CLK_PERAO_SPI3_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  1826  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  1827  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1828  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1829  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1830  
3a88be54312101 Xavier Chang   2024-01-08  1831  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1832  		};
3a88be54312101 Xavier Chang   2024-01-08  1833  
3a88be54312101 Xavier Chang   2024-01-08  1834  		spi4: spi@16190000 {
3a88be54312101 Xavier Chang   2024-01-08  1835  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  1836  			reg = <0 0x16190000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  1837  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1838  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  1839  				<&cksys_clk CLK_CK_SPI4_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  1840  				<&pericfg_ao_clk CLK_PERAO_SPI4_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  1841  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  1842  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1843  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1844  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1845  
3a88be54312101 Xavier Chang   2024-01-08  1846  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1847  		};
3a88be54312101 Xavier Chang   2024-01-08  1848  
3a88be54312101 Xavier Chang   2024-01-08  1849  		spi5: spi@161b0000 {
3a88be54312101 Xavier Chang   2024-01-08  1850  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  1851  			reg = <0 0x161b0000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  1852  			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1853  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  1854  				<&cksys_clk CLK_CK_SPI5_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  1855  				<&pericfg_ao_clk CLK_PERAO_SPI5_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  1856  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  1857  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1858  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1859  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1860  
3a88be54312101 Xavier Chang   2024-01-08  1861  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1862  		};
3a88be54312101 Xavier Chang   2024-01-08  1863  
3a88be54312101 Xavier Chang   2024-01-08  1864  		spi6: spi@161d0000 {
3a88be54312101 Xavier Chang   2024-01-08  1865  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  1866  			reg = <0 0x161d0000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  1867  			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1868  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  1869  				<&cksys_clk CLK_CK_SPI6_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  1870  				<&pericfg_ao_clk CLK_PERAO_SPI6_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  1871  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  1872  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1873  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1874  			mediatek,pad-select = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1875  
3a88be54312101 Xavier Chang   2024-01-08  1876  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1877  		};
3a88be54312101 Xavier Chang   2024-01-08  1878  
3a88be54312101 Xavier Chang   2024-01-08  1879  		spi7: spi@161f0000 {
3a88be54312101 Xavier Chang   2024-01-08  1880  			compatible = "mediatek,mt8196-spi";
3a88be54312101 Xavier Chang   2024-01-08  1881  			reg = <0 0x161f0000 0 0x100>;
3a88be54312101 Xavier Chang   2024-01-08  1882  			interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1883  			clocks = <&cksys_clk CLK_CK_UNIVPLL_D6_D2>,
3a88be54312101 Xavier Chang   2024-01-08  1884  				<&cksys_clk CLK_CK_SPI7_BCLK_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  1885  				<&pericfg_ao_clk CLK_PERAO_SPI7_BCLK_SPI>;
3a88be54312101 Xavier Chang   2024-01-08  1886  			clock-names = "parent-clk", "sel-clk", "spi-clk";
3a88be54312101 Xavier Chang   2024-01-08  1887  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1888  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1889  			mediatek,pad-select = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1890  
3a88be54312101 Xavier Chang   2024-01-08  1891  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1892  		};
3a88be54312101 Xavier Chang   2024-01-08  1893  
3a88be54312101 Xavier Chang   2024-01-08  1894  		i2c11: i2c@16200000 {
3a88be54312101 Xavier Chang   2024-01-08  1895  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1896  			reg = <0 0x16200000 0 0x40000>,
3a88be54312101 Xavier Chang   2024-01-08  1897  			      <0 0x164c0000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1898  			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1899  			clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C11_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1900  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1901  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1902  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1903  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1904  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1905  
3a88be54312101 Xavier Chang   2024-01-08  1906  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1907  		};
3a88be54312101 Xavier Chang   2024-01-08  1908  
3a88be54312101 Xavier Chang   2024-01-08  1909  		i2c12: i2c@16240000 {
3a88be54312101 Xavier Chang   2024-01-08  1910  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1911  			reg = <0 0x16240000 0 0x40000>,
3a88be54312101 Xavier Chang   2024-01-08  1912  			      <0 0x164d0000 0 0x20000>;
3a88be54312101 Xavier Chang   2024-01-08  1913  			interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1914  			clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C12_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1915  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1916  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1917  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1918  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1919  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1920  
3a88be54312101 Xavier Chang   2024-01-08  1921  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1922  		};
3a88be54312101 Xavier Chang   2024-01-08  1923  
3a88be54312101 Xavier Chang   2024-01-08  1924  		i2c13: i2c@16280000 {
3a88be54312101 Xavier Chang   2024-01-08  1925  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1926  			reg = <0 0x16280000 0 0x40000>,
3a88be54312101 Xavier Chang   2024-01-08  1927  			      <0 0x164f0000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1928  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1929  			clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C13_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1930  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1931  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1932  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1933  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1934  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1935  
3a88be54312101 Xavier Chang   2024-01-08  1936  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1937  		};
3a88be54312101 Xavier Chang   2024-01-08  1938  
3a88be54312101 Xavier Chang   2024-01-08  1939  		i2c14: i2c@162c0000 {
3a88be54312101 Xavier Chang   2024-01-08  1940  			compatible = "mediatek,mt8196-i2c", "mediatek,mt8188-i2c";
3a88be54312101 Xavier Chang   2024-01-08  1941  			reg = <0 0x162c0000 0 0x40000>,
3a88be54312101 Xavier Chang   2024-01-08  1942  			      <0 0x16500000 0 0x10000>;
3a88be54312101 Xavier Chang   2024-01-08  1943  			interrupts = <GIC_SPI 900 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1944  			clocks = <&imp_iic_wrap_c_clk CLK_IMPC_I2C14_I2C>,
3a88be54312101 Xavier Chang   2024-01-08  1945  				 <&pericfg_ao_clk CLK_PERAO_AP_DMA_X32W_BCLK_I2C>;
3a88be54312101 Xavier Chang   2024-01-08  1946  			clock-names = "main", "dma";
3a88be54312101 Xavier Chang   2024-01-08  1947  			clock-div = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1948  			#address-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1949  			#size-cells = <0>;
3a88be54312101 Xavier Chang   2024-01-08  1950  
3a88be54312101 Xavier Chang   2024-01-08  1951  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1952  		};
3a88be54312101 Xavier Chang   2024-01-08  1953  
3a88be54312101 Xavier Chang   2024-01-08  1954  		imp_iic_wrap_c_clk: syscon@16300000 {
3a88be54312101 Xavier Chang   2024-01-08  1955  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  1956  			compatible = "mediatek,mt8196-imp-iic-wrap-c", "mediatek,mt8196-imp_iic_wrap_c", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  1957  			reg = <0 0x16300000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1958  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  1959  		};
3a88be54312101 Xavier Chang   2024-01-08  1960  
3a88be54312101 Xavier Chang   2024-01-08  1961  		mmc1: mmc@16310000 {
3a88be54312101 Xavier Chang   2024-01-08  1962  			compatible = "mediatek,mt8196-mmc";
3a88be54312101 Xavier Chang   2024-01-08  1963  			reg = <0 0x16310000 0 0x1000>,
3a88be54312101 Xavier Chang   2024-01-08  1964  			      <0 0x12a10000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1965  			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1966  			clocks = <&cksys_clk CLK_CK_MSDC30_1_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  1967  					<&pericfg_ao_clk CLK_PERAO_MSDC1_AXI_MSDC1>,
3a88be54312101 Xavier Chang   2024-01-08  1968  					<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_MSDC1>,
3a88be54312101 Xavier Chang   2024-01-08  1969  					<&pericfg_ao_clk CLK_PERAO_MSDC1_MSDC_SRC_MSDC1>,
3a88be54312101 Xavier Chang   2024-01-08  1970  					<&pericfg_ao_clk CLK_PERAO_MSDC1_HCLK_WRAP_MSDC1>;
3a88be54312101 Xavier Chang   2024-01-08  1971  			clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
3a88be54312101 Xavier Chang   2024-01-08  1972  
3a88be54312101 Xavier Chang   2024-01-08  1973  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1974  		};
3a88be54312101 Xavier Chang   2024-01-08  1975  
3a88be54312101 Xavier Chang   2024-01-08  1976  		mmc2: mmc@16320000 {
3a88be54312101 Xavier Chang   2024-01-08  1977  			compatible = "mediatek,mt8196-mmc";
3a88be54312101 Xavier Chang   2024-01-08  1978  			reg = <0 0x16320000 0 0x1000>,
3a88be54312101 Xavier Chang   2024-01-08  1979  			      <0 0x138a0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  1980  			interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  1981  			clocks = <&cksys_clk CLK_CK_MSDC30_2_SEL>,
3a88be54312101 Xavier Chang   2024-01-08  1982  					<&pericfg_ao_clk CLK_PERAO_MSDC2_AXI_MSDC2>,
3a88be54312101 Xavier Chang   2024-01-08  1983  					<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_MSDC2>,
3a88be54312101 Xavier Chang   2024-01-08  1984  					<&pericfg_ao_clk CLK_PERAO_MSDC2_MSDC_SRC_MSDC2>,
3a88be54312101 Xavier Chang   2024-01-08  1985  					<&pericfg_ao_clk CLK_PERAO_MSDC2_HCLK_WRAP_MSDC2>;
3a88be54312101 Xavier Chang   2024-01-08  1986  			clock-names = "source", "axi_cg", "hclk", "source_cg", "ahb_cg";
3a88be54312101 Xavier Chang   2024-01-08  1987  
3a88be54312101 Xavier Chang   2024-01-08  1988  			status = "disabled";
3a88be54312101 Xavier Chang   2024-01-08  1989  		};
3a88be54312101 Xavier Chang   2024-01-08  1990  
b30358af110519 Noah Shen      2024-03-01  1991  		pwm: pwm@16330000 {
b30358af110519 Noah Shen      2024-03-01  1992  			compatible = "mediatek,pwm";
b30358af110519 Noah Shen      2024-03-01  1993  			reg = <0 0x16330000 0 0x1000>;
b30358af110519 Noah Shen      2024-03-01  1994  			interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH 0>;
b30358af110519 Noah Shen      2024-03-01  1995  
b30358af110519 Noah Shen      2024-03-01  1996  			status = "disabled";
b30358af110519 Noah Shen      2024-03-01  1997  		};
b30358af110519 Noah Shen      2024-03-01  1998  
b30358af110519 Noah Shen      2024-03-01  1999  		nor_flash: spi@16340000 {
b30358af110519 Noah Shen      2024-03-01  2000  			compatible = "mediatek,mt8196-nor",
b30358af110519 Noah Shen      2024-03-01  2001  				     "mediatek,mt8186-nor";
b30358af110519 Noah Shen      2024-03-01  2002  			reg = <0 0x16340000 0 0x1000>;
b30358af110519 Noah Shen      2024-03-01  2003  			clocks = <&cksys_clk CLK_CK_SFLASH_SEL>,
b30358af110519 Noah Shen      2024-03-01  2004  				 <&pericfg_ao_clk CLK_PERAO_FLASHIF_FLASH_FLASHIF>,
b30358af110519 Noah Shen      2024-03-01  2005  				 <&pericfg_ao_clk CLK_PERAO_FLASHIF_DRAM_FLASHIF>,
b30358af110519 Noah Shen      2024-03-01  2006  				 <&pericfg_ao_clk CLK_PERAO_FLASHIF_AXI_FLASHIF>,
b30358af110519 Noah Shen      2024-03-01  2007  				 <&pericfg_ao_clk CLK_PERAO_FLASHIF_BCLK_FLASHIF>,
b30358af110519 Noah Shen      2024-03-01  2008  				 <&pericfg_ao_clk CLK_PERAO_FLASHIF_27M_FLASHIF>;
b30358af110519 Noah Shen      2024-03-01  2009  			clock-names = "spi", "sf", "axi", "axi_s", "bclk", "27m";
b30358af110519 Noah Shen      2024-03-01  2010  			assigned-clocks = <&cksys_clk CLK_CK_SFLASH_SEL>;
b30358af110519 Noah Shen      2024-03-01  2011  			assigned-clock-parents = <&cksys_clk CLK_CK_UNIVPLL_D6_D8>;
b30358af110519 Noah Shen      2024-03-01  2012  			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>;
b30358af110519 Noah Shen      2024-03-01  2013  			#address-cells = <1>;
b30358af110519 Noah Shen      2024-03-01  2014  			#size-cells = <0>;
b30358af110519 Noah Shen      2024-03-01  2015  			status = "disabled";
b30358af110519 Noah Shen      2024-03-01  2016  		};
b30358af110519 Noah Shen      2024-03-01  2017  
3a88be54312101 Xavier Chang   2024-01-08  2018  		pericfg_ao_clk: syscon@16640000 {
3a88be54312101 Xavier Chang   2024-01-08  2019  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2020  			compatible = "mediatek,mt8196-pericfg-ao", "mediatek,mt8196-pericfg_ao", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2021  			reg = <0 0x16640000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2022  			hw-voter-regmap = <&hwv>;
3a88be54312101 Xavier Chang   2024-01-08  2023  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2024  		};
3a88be54312101 Xavier Chang   2024-01-08  2025  
b9408b7224ce87 Runyang Chen   2024-03-26  2026  		devapc_peri: devapc@16670000 {
b9408b7224ce87 Runyang Chen   2024-03-26  2027  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  2028  			reg = <0 0x16670000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  2029  			vio-idx-num = <204>;
b9408b7224ce87 Runyang Chen   2024-03-26  2030  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  2031  		};
b9408b7224ce87 Runyang Chen   2024-03-26  2032  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2033  		xhci0: usb@16700000 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2034  			compatible = "mediatek,mtk-xhci";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2035  			reg = <0 0x16700000 0 0x1000>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2036  			      <0 0x16703e00 0 0x0100>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2037  			reg-names = "mac", "ippc";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2038  			interrupts-extended = <&gic GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH 0>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2039  					      <&pio 273 IRQ_TYPE_LEVEL_LOW>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2040  			interrupt-names = "host","wakeup";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2041  			phys = <&u2port0 PHY_TYPE_USB2>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2042  			       <&u3port0 PHY_TYPE_USB3>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2043  			#address-cells = <2>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2044  			#size-cells = <2>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2045  			clocks = <&vlp_cksys_clk CLK_VLP_CK_USB_TOP_SEL>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2046  				 <&vlp_cksys_clk CLK_VLP_CK_USB_XHCI_SEL>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2047  				 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2048  			clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2049  			power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P0>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2050  			mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 107>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2051  			wakeup-source;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2052  			status = "disabled";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2053  		};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2054  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2055  		xhci1: usb1@16710000 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2056  			compatible = "mediatek,mtk-xhci";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2057  			reg = <0 0x16710000 0 0x1000>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2058  			      <0 0x16713e00 0 0x0100>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2059  			reg-names = "mac", "ippc";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2060  			interrupts-extended = <&gic GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH 0>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2061  					      <&pio 276 IRQ_TYPE_LEVEL_LOW>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2062  			interrupt-names = "host","wakeup";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2063  			phys = <&u2port1 PHY_TYPE_USB2>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2064  			clocks = <&cksys_clk CLK_CK_USB_TOP_1P_SEL>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2065  				 <&cksys_clk CLK_CK_USB_XHCI_1P_SEL>,
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2066  				 <&cksys_clk CLK_CK_USB_FMCNT_P1_SEL>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2067  			clock-names = "sys_ck", "xhci_ck", "frmcnt_ck";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2068  			power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_P1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2069  			mediatek,syscon-wakeup = <&usbwkcfg_ao_clk 0x200 108>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2070  			wakeup-source;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2071  			status = "disabled";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2072  		};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2073  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2074  		u2phy0: usb-phy0@16730000 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2075  			compatible = "mediatek,xsphy";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2076  			ranges = <0x0 0x0 0x16730000 0x700>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2077  			#address-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2078  			#size-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2079  			status = "disabled";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2080  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2081  			u2port0: usb2-phy0@0 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2082  				reg = <0x0 0x400>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2083  				clocks = <&clk26m>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2084  				clock-names = "ref";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2085  				#phy-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2086  				mediatek,discth = <10>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2087  			};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2088  		};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2089  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2090  		u2phy1: usb-phy1@16740000 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2091  			compatible = "mediatek,xsphy";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2092  			ranges = <0x0 0x0 0x16740000 0x700>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2093  			#address-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2094  			#size-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2095  			status = "disabled";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2096  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2097  			u2port1: usb2-phy1@0 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2098  				reg = <0x0 0x400>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2099  				clocks = <&clk26m>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2100  				clock-names = "ref";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2101  				#phy-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2102  				mediatek,discth = <10>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2103  			};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2104  		};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2105  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2106  		u3phy0: usb3-phy0@16773000 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2107  			compatible = "mediatek,xsphy";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2108  			ranges;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2109  			reg = <0 0x16773000 0 0x200>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2110  			#address-cells = <2>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2111  			#size-cells = <2>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2112  			power-domains = <&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2113  			status = "disabled";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2114  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2115  			u3port0: usb3-phy0@16773400 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2116  				reg = <0 0x16773400 0 0x500>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2117  				clocks = <&clk26m>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2118  				clock-names = "ref";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2119  				#phy-cells = <1>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2120  			};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2121  		};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2122  
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2123  		usbwkcfg_ao_clk: syscon@167a0000 {
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2124  			compatible = "mediatek,mt8196-usbwkcfg-ao", "syscon";
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2125  			reg = <0 0x167a0000 0 0x1000>;
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2126  		};
1468cdcfa0ac25 Mingjin Ge     2024-03-01  2127  
f957c1861979d1 Noah Shen      2024-03-04  2128  		ufshci: ufshci@16810000 {
f957c1861979d1 Noah Shen      2024-03-04  2129  			compatible = "mediatek,mt8183-ufshci";
f957c1861979d1 Noah Shen      2024-03-04  2130  			reg = <0 0x16810000 0 0x2a00>;
f957c1861979d1 Noah Shen      2024-03-04  2131  
f957c1861979d1 Noah Shen      2024-03-04  2132  			interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2133  				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2134  				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2135  				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2136  				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2137  				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2138  				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2139  				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH 0>,
f957c1861979d1 Noah Shen      2024-03-04  2140  				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH 0>;
f957c1861979d1 Noah Shen      2024-03-04  2141  			clocks =
f957c1861979d1 Noah Shen      2024-03-04  2142  					<&cksys_clk CLK_CK_SEL>,
f957c1861979d1 Noah Shen      2024-03-04  2143  					<&cksys_clk CLK_CK_MAINPLL_D4_D2>,
f957c1861979d1 Noah Shen      2024-03-04  2144  					<&cksys_clk CLK_CK_UNIVPLL_D5>,
f957c1861979d1 Noah Shen      2024-03-04  2145  					<&cksys_clk CLK_CK_AES_UFSFDE_SEL>,
f957c1861979d1 Noah Shen      2024-03-04  2146  					<&cksys_clk CLK_CK_UNIVPLL_D6>,
f957c1861979d1 Noah Shen      2024-03-04  2147  					<&cksys_clk CLK_CK_MAINPLL_D4>,
f957c1861979d1 Noah Shen      2024-03-04  2148  					<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_TX_SYM_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2149  					<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM0_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2150  					<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_RX_SYM1_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2151  					<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SYS_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2152  					<&ufscfg_ao_clk CLK_UFSAO_UNIPRO_SAP_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2153  					<&ufscfg_ao_clk CLK_UFSAO_PHY_SAP_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2154  					<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_UFS_UFS>,
f957c1861979d1 Noah Shen      2024-03-04  2155  					<&ufscfg_ao_clk CLK_UFSAO_UFSHCI_AES_UFS>;
f957c1861979d1 Noah Shen      2024-03-04  2156  			clock-names =
f957c1861979d1 Noah Shen      2024-03-04  2157  					"ufs_sel",
f957c1861979d1 Noah Shen      2024-03-04  2158  					"ufs_sel_min_src",
f957c1861979d1 Noah Shen      2024-03-04  2159  					"ufs_sel_max_src",
f957c1861979d1 Noah Shen      2024-03-04  2160  					"crypt_mux",
f957c1861979d1 Noah Shen      2024-03-04  2161  					"crypt_lp",
f957c1861979d1 Noah Shen      2024-03-04  2162  					"crypt_perf",
f957c1861979d1 Noah Shen      2024-03-04  2163  					"unipro_tx_sym",
f957c1861979d1 Noah Shen      2024-03-04  2164  					"unipro_rx_sym0",
f957c1861979d1 Noah Shen      2024-03-04  2165  					"unipro_rx_sym1",
f957c1861979d1 Noah Shen      2024-03-04  2166  					"unipro_sys",
f957c1861979d1 Noah Shen      2024-03-04  2167  					"unipro_sap",
f957c1861979d1 Noah Shen      2024-03-04  2168  					"ufs_phy_sap",
f957c1861979d1 Noah Shen      2024-03-04  2169  					"ufshci_ufs",
f957c1861979d1 Noah Shen      2024-03-04  2170  					"ufshci_aes";
f957c1861979d1 Noah Shen      2024-03-04  2171  			freq-table-hz =
f957c1861979d1 Noah Shen      2024-03-04  2172  					<273000000 499200000>,
f957c1861979d1 Noah Shen      2024-03-04  2173  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2174  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2175  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2176  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2177  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2178  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2179  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2180  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2181  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2182  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2183  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2184  					<0 0>,
f957c1861979d1 Noah Shen      2024-03-04  2185  					<0 0>;
f957c1861979d1 Noah Shen      2024-03-04  2186  			/* for clock scaling bind vcore */
f957c1861979d1 Noah Shen      2024-03-04  2187  
f957c1861979d1 Noah Shen      2024-03-04  2188  			/* 0.65V for clock scale up */
f957c1861979d1 Noah Shen      2024-03-04  2189  			boost-crypt-vcore-min = <650000>;
f957c1861979d1 Noah Shen      2024-03-04  2190  			vcc-supply = <&mt6363_vemc>;
f957c1861979d1 Noah Shen      2024-03-04  2191  			vccq-supply = <&mt6363_vufs12>;
f957c1861979d1 Noah Shen      2024-03-04  2192  			resets =	<&ufscfgao_rst 1>,
f957c1861979d1 Noah Shen      2024-03-04  2193  					<&ufscfgao_rst 2>,
f957c1861979d1 Noah Shen      2024-03-04  2194  					<&ufscfgao_rst 3>;
f957c1861979d1 Noah Shen      2024-03-04  2195  			reset-names =	"unipro_rst",
f957c1861979d1 Noah Shen      2024-03-04  2196  					"crypto_rst",
f957c1861979d1 Noah Shen      2024-03-04  2197  					"hci_rst";
f957c1861979d1 Noah Shen      2024-03-04  2198  
f957c1861979d1 Noah Shen      2024-03-04  2199  			/*
f957c1861979d1 Noah Shen      2024-03-04  2200  			 * Control mtcmos with rtff flow by ufs driver,
f957c1861979d1 Noah Shen      2024-03-04  2201  			 * Instead of scpsys by PM flow.
f957c1861979d1 Noah Shen      2024-03-04  2202  			 */
f957c1861979d1 Noah Shen      2024-03-04  2203  			mediatek,ufs-rtff-mtcmos;
f957c1861979d1 Noah Shen      2024-03-04  2204  			mediatek,ufs-boost-crypt;
f957c1861979d1 Noah Shen      2024-03-04  2205  			mediatek,ufs-pmc-via-fastauto;
f957c1861979d1 Noah Shen      2024-03-04  2206  		};
f957c1861979d1 Noah Shen      2024-03-04  2207  
3a88be54312101 Xavier Chang   2024-01-08  2208  		ufscfg_ao_sec_clk: syscon@16890000 {
3a88be54312101 Xavier Chang   2024-01-08  2209  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2210  			compatible = "mediatek,mt8196-ufscfg-ao-sec", "mediatek,mt8196-ufscfg_ao_sec", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2211  			reg = <0 0x16890000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2212  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2213  		};
3a88be54312101 Xavier Chang   2024-01-08  2214  
3a88be54312101 Xavier Chang   2024-01-08  2215  		ufscfg_ao_clk: syscon@168a0000 {
3a88be54312101 Xavier Chang   2024-01-08  2216  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2217  			compatible = "mediatek,mt8196-ufscfg-ao", "mediatek,mt8196-ufscfg_ao", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2218  			reg = <0 0x168a0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2219  			#clock-cells = <1>;
f957c1861979d1 Noah Shen      2024-03-04  2220  
f957c1861979d1 Noah Shen      2024-03-04  2221  			ufscfgao_rst: reset-controller {
f957c1861979d1 Noah Shen      2024-03-04  2222  				compatible = "ti,syscon-reset";
f957c1861979d1 Noah Shen      2024-03-04  2223  				#reset-cells = <1>;
f957c1861979d1 Noah Shen      2024-03-04  2224  
f957c1861979d1 Noah Shen      2024-03-04  2225  				ti,reset-bits = <
f957c1861979d1 Noah Shen      2024-03-04  2226  					/* ufs mphy/ufschi/crypto/unipro reset */
f957c1861979d1 Noah Shen      2024-03-04  2227  					/* 0: mphy */
f957c1861979d1 Noah Shen      2024-03-04  2228  					0x48   8 0x4c   8 0 0
f957c1861979d1 Noah Shen      2024-03-04  2229  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
f957c1861979d1 Noah Shen      2024-03-04  2230  					/* 1: unipro */
f957c1861979d1 Noah Shen      2024-03-04  2231  					0x148  0 0x14c  0 0 0
f957c1861979d1 Noah Shen      2024-03-04  2232  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
f957c1861979d1 Noah Shen      2024-03-04  2233  					/* 2: ufs-crypto */
f957c1861979d1 Noah Shen      2024-03-04  2234  					0x148  1 0x14c  1 0 0
f957c1861979d1 Noah Shen      2024-03-04  2235  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
f957c1861979d1 Noah Shen      2024-03-04  2236  					/* 3: ufshci */
f957c1861979d1 Noah Shen      2024-03-04  2237  					0x148  2 0x14c  2 0 0
f957c1861979d1 Noah Shen      2024-03-04  2238  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
f957c1861979d1 Noah Shen      2024-03-04  2239  					>;
f957c1861979d1 Noah Shen      2024-03-04  2240  			};
3a88be54312101 Xavier Chang   2024-01-08  2241  		};
3a88be54312101 Xavier Chang   2024-01-08  2242  
40e0ded60c61ea Jianjun Wang   2024-03-07  2243  		pciephy0: phy@16900000 {
40e0ded60c61ea Jianjun Wang   2024-03-07  2244  			compatible = "mediatek,mt8196-pcie-phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2245  			reg = <0 0x16900000 0 0x10000>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2246  			      <0 0x16920000 0 0x10000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2247  			reg-names = "sif", "ckm";
40e0ded60c61ea Jianjun Wang   2024-03-07  2248  
40e0ded60c61ea Jianjun Wang   2024-03-07  2249  			clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_MCU_BUS_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2250  				 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_PHY_P0_PEXTP_REF_PCIE>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2251  			power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2252  
40e0ded60c61ea Jianjun Wang   2024-03-07  2253  			num-lanes = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2254  			#phy-cells = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2255  			status = "disabled";
40e0ded60c61ea Jianjun Wang   2024-03-07  2256  		};
40e0ded60c61ea Jianjun Wang   2024-03-07  2257  
40e0ded60c61ea Jianjun Wang   2024-03-07  2258  		pcie0: pcie@16910000 {
40e0ded60c61ea Jianjun Wang   2024-03-07  2259  			compatible = "mediatek,mt8196-pcie";
40e0ded60c61ea Jianjun Wang   2024-03-07  2260  			device_type = "pci";
40e0ded60c61ea Jianjun Wang   2024-03-07  2261  			reg = <0 0x16910000 0 0x4000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2262  			reg-names = "pcie-mac";
40e0ded60c61ea Jianjun Wang   2024-03-07  2263  			#address-cells = <3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2264  			#size-cells = <2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2265  			interrupts = <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH 0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2266  			bus-range = <0x00 0xff>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2267  			linux,pci-domain = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2268  			pextpcfg = <&pextp0cfg_ao_clk>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2269  			ranges = <0x82000000 0 0x50000000 0x0 0x50000000 0 0x8000000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2270  
40e0ded60c61ea Jianjun Wang   2024-03-07  2271  			clocks = <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_PL_P_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2272  				 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_TL_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2273  				 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_REF_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2274  				 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AXI_250_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2275  				 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_MAC_P0_AHB_APB_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2276  				 <&pextp0cfg_ao_clk CLK_PEXT_PEXTP_VLP_AO_P0_LP_PCIE>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2277  			clock-names = "pl_250m", "tl_26m", "peri_26m",
40e0ded60c61ea Jianjun Wang   2024-03-07  2278  				      "peri_mem", "bus", "low_power";
40e0ded60c61ea Jianjun Wang   2024-03-07  2279  			assigned-clocks = <&cksys_clk CLK_CK_TL_SEL>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2280  			assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2281  
40e0ded60c61ea Jianjun Wang   2024-03-07  2282  			resets = <&pextp0ao_rst 0>, <&pextp0ao_rst 1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2283  			reset-names = "mac", "phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2284  			power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2285  
40e0ded60c61ea Jianjun Wang   2024-03-07  2286  			phys = <&pciephy0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2287  			phy-names = "pcie-phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2288  
40e0ded60c61ea Jianjun Wang   2024-03-07  2289  			status = "disabled";
40e0ded60c61ea Jianjun Wang   2024-03-07  2290  
40e0ded60c61ea Jianjun Wang   2024-03-07  2291  			#interrupt-cells = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2292  			interrupt-map-mask = <0 0 0 7>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2293  			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2294  					<0 0 0 2 &pcie_intc0 1>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2295  					<0 0 0 3 &pcie_intc0 2>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2296  					<0 0 0 4 &pcie_intc0 3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2297  
40e0ded60c61ea Jianjun Wang   2024-03-07  2298  			pcie_intc0: interrupt-controller {
40e0ded60c61ea Jianjun Wang   2024-03-07  2299  				interrupt-controller;
40e0ded60c61ea Jianjun Wang   2024-03-07  2300  				#address-cells = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2301  				#interrupt-cells = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2302  			};
40e0ded60c61ea Jianjun Wang   2024-03-07  2303  		};
40e0ded60c61ea Jianjun Wang   2024-03-07  2304  
40e0ded60c61ea Jianjun Wang   2024-03-07  2305  		pciephy1: phy@16930000 {
40e0ded60c61ea Jianjun Wang   2024-03-07  2306  			compatible = "mediatek,mt8196-pcie-phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2307  			reg = <0 0x16930000 0 0x10000>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2308  			      <0 0x16950000 0 0x10000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2309  			reg-names = "sif", "ckm";
40e0ded60c61ea Jianjun Wang   2024-03-07  2310  
40e0ded60c61ea Jianjun Wang   2024-03-07  2311  			clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_MCU_BUS_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2312  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P1_PEXTP_REF_PCIE>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2313  			power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2314  
40e0ded60c61ea Jianjun Wang   2024-03-07  2315  			num-lanes = <2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2316  			#phy-cells = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2317  
40e0ded60c61ea Jianjun Wang   2024-03-07  2318  			status = "disabled";
40e0ded60c61ea Jianjun Wang   2024-03-07  2319  		};
40e0ded60c61ea Jianjun Wang   2024-03-07  2320  
40e0ded60c61ea Jianjun Wang   2024-03-07  2321  		pcie1: pcie@16940000 {
40e0ded60c61ea Jianjun Wang   2024-03-07  2322  			compatible = "mediatek,mt8196-pcie";
40e0ded60c61ea Jianjun Wang   2024-03-07  2323  			device_type = "pci";
40e0ded60c61ea Jianjun Wang   2024-03-07  2324  			reg = <0 0x16940000 0 0x4000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2325  			reg-names = "pcie-mac";
40e0ded60c61ea Jianjun Wang   2024-03-07  2326  			#address-cells = <3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2327  			#size-cells = <2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2328  			interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH 0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2329  			bus-range = <0x00 0xff>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2330  			linux,pci-domain = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2331  			pextpcfg = <&pextp1cfg_ao_clk>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2332  			ranges = <0x82000000 0 0x58000000 0x0 0x58000000 0 0x18000000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2333  
40e0ded60c61ea Jianjun Wang   2024-03-07  2334  			clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_PL_P_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2335  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_TL_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2336  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_REF_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2337  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AXI_250_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2338  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P1_AHB_APB_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2339  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P1_LP_PCIE>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2340  			clock-names = "pl_250m", "tl_26m", "peri_26m",
40e0ded60c61ea Jianjun Wang   2024-03-07  2341  				      "peri_mem", "bus", "low_power";
40e0ded60c61ea Jianjun Wang   2024-03-07  2342  			assigned-clocks = <&cksys_clk CLK_CK_TL_P1_SEL>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2343  			assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2344  
40e0ded60c61ea Jianjun Wang   2024-03-07  2345  			resets = <&pextp1ao_rst 0>, <&pextp1ao_rst 1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2346  			reset-names = "mac", "phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2347  			power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2348  
40e0ded60c61ea Jianjun Wang   2024-03-07  2349  			phys = <&pciephy1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2350  			phy-names = "pcie-phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2351  
40e0ded60c61ea Jianjun Wang   2024-03-07  2352  			status = "disabled";
40e0ded60c61ea Jianjun Wang   2024-03-07  2353  
40e0ded60c61ea Jianjun Wang   2024-03-07  2354  			#interrupt-cells = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2355  			interrupt-map-mask = <0 0 0 7>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2356  			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2357  					<0 0 0 2 &pcie_intc1 1>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2358  					<0 0 0 3 &pcie_intc1 2>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2359  					<0 0 0 4 &pcie_intc1 3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2360  
40e0ded60c61ea Jianjun Wang   2024-03-07  2361  			pcie_intc1: interrupt-controller {
40e0ded60c61ea Jianjun Wang   2024-03-07  2362  				interrupt-controller;
40e0ded60c61ea Jianjun Wang   2024-03-07  2363  				#address-cells = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2364  				#interrupt-cells = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2365  			};
40e0ded60c61ea Jianjun Wang   2024-03-07  2366  		};
40e0ded60c61ea Jianjun Wang   2024-03-07  2367  
40e0ded60c61ea Jianjun Wang   2024-03-07  2368  		pciephy2: phy@16960000 {
40e0ded60c61ea Jianjun Wang   2024-03-07  2369  			compatible = "mediatek,mt8196-pcie-phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2370  			reg = <0 0x16960000 0 0x10000>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2371  			      <0 0x16980000 0 0x10000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2372  			reg-names = "sif", "ckm";
40e0ded60c61ea Jianjun Wang   2024-03-07  2373  
40e0ded60c61ea Jianjun Wang   2024-03-07  2374  			clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_MCU_BUS_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2375  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_PHY_P2_PEXTP_REF_PCIE>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2376  			power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_PHY2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2377  
40e0ded60c61ea Jianjun Wang   2024-03-07  2378  			num-lanes = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2379  			#phy-cells = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2380  
40e0ded60c61ea Jianjun Wang   2024-03-07  2381  			status = "disabled";
40e0ded60c61ea Jianjun Wang   2024-03-07  2382  		};
40e0ded60c61ea Jianjun Wang   2024-03-07  2383  
40e0ded60c61ea Jianjun Wang   2024-03-07  2384  		pcie2: pcie@16970000 {
40e0ded60c61ea Jianjun Wang   2024-03-07  2385  			device_type = "pci";
40e0ded60c61ea Jianjun Wang   2024-03-07  2386  			compatible = "mediatek,mt8196-pcie";
40e0ded60c61ea Jianjun Wang   2024-03-07  2387  			reg = <0 0x16970000 0 0x4000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2388  			reg-names = "pcie-mac";
40e0ded60c61ea Jianjun Wang   2024-03-07  2389  			#address-cells = <3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2390  			#size-cells = <2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2391  			interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH 0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2392  			bus-range = <0x00 0xff>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2393  			linux,pci-domain = <2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2394  			pextpcfg = <&pextp1cfg_ao_clk>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2395  			ranges = <0x82000000 0 0x70000000 0x0 0x70000000 0 0x8000000>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2396  
40e0ded60c61ea Jianjun Wang   2024-03-07  2397  			clocks = <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_PL_P_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2398  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_TL_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2399  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_REF_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2400  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AXI_250_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2401  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_MAC_P2_AHB_APB_PCIE>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2402  				 <&pextp1cfg_ao_clk CLK_PEXT1_PEXTP_VLP_AO_P2_LP_PCIE>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2403  			clock-names = "pl_250m", "tl_26m", "peri_26m",
40e0ded60c61ea Jianjun Wang   2024-03-07  2404  				      "peri_mem", "bus", "low_power";
40e0ded60c61ea Jianjun Wang   2024-03-07  2405  			assigned-clocks = <&cksys_clk CLK_CK_TL_P2_SEL>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2406  			assigned-clock-parents = <&cksys_clk CLK_CK_MAINPLL_D4_D4>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2407  
40e0ded60c61ea Jianjun Wang   2024-03-07  2408  			resets = <&pextp1ao_rst 2>, <&pextp1ao_rst 3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2409  			reset-names = "mac", "phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2410  			power-domains = <&scpsys MT8196_POWER_DOMAIN_PEXTP_MAC2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2411  
40e0ded60c61ea Jianjun Wang   2024-03-07  2412  			phys = <&pciephy2>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2413  			phy-names = "pcie-phy";
40e0ded60c61ea Jianjun Wang   2024-03-07  2414  
40e0ded60c61ea Jianjun Wang   2024-03-07  2415  			status = "disabled";
40e0ded60c61ea Jianjun Wang   2024-03-07  2416  
40e0ded60c61ea Jianjun Wang   2024-03-07  2417  			#interrupt-cells = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2418  			interrupt-map-mask = <0 0 0 7>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2419  			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2420  					<0 0 0 2 &pcie_intc2 1>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2421  					<0 0 0 3 &pcie_intc2 2>,
40e0ded60c61ea Jianjun Wang   2024-03-07  2422  					<0 0 0 4 &pcie_intc2 3>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2423  
40e0ded60c61ea Jianjun Wang   2024-03-07  2424  			pcie_intc2: interrupt-controller {
40e0ded60c61ea Jianjun Wang   2024-03-07  2425  				interrupt-controller;
40e0ded60c61ea Jianjun Wang   2024-03-07  2426  				#address-cells = <0>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2427  				#interrupt-cells = <1>;
40e0ded60c61ea Jianjun Wang   2024-03-07  2428  			};
40e0ded60c61ea Jianjun Wang   2024-03-07  2429  		};
40e0ded60c61ea Jianjun Wang   2024-03-07  2430  
3a88be54312101 Xavier Chang   2024-01-08  2431  		pextp0cfg_ao_clk: syscon@169b0000 {
3a88be54312101 Xavier Chang   2024-01-08  2432  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2433  			compatible = "mediatek,mt8196-pextp0cfg-ao", "mediatek,mt8196-pextp0cfg_ao", "syscon", "simple-mfd";
3a88be54312101 Xavier Chang   2024-01-08  2434  			reg = <0 0x169b0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2435  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2436  
3a88be54312101 Xavier Chang   2024-01-08  2437  			pextp0ao_rst: reset-controller {
3a88be54312101 Xavier Chang   2024-01-08  2438  				compatible = "ti,syscon-reset";
3a88be54312101 Xavier Chang   2024-01-08  2439  				#reset-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2440  
3a88be54312101 Xavier Chang   2024-01-08  2441  				ti,reset-bits = <
3a88be54312101 Xavier Chang   2024-01-08  2442  					/* 0: PCIe0 MAC reset */
3a88be54312101 Xavier Chang   2024-01-08  2443  					0x8  0 0xc  0 0 0
3a88be54312101 Xavier Chang   2024-01-08  2444  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
3a88be54312101 Xavier Chang   2024-01-08  2445  					/* 1: PCIe0 PHY reset */
3a88be54312101 Xavier Chang   2024-01-08  2446  					0x8  1 0xc  1 0 0
3a88be54312101 Xavier Chang   2024-01-08  2447  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
3a88be54312101 Xavier Chang   2024-01-08  2448  					>;
3a88be54312101 Xavier Chang   2024-01-08  2449  			};
3a88be54312101 Xavier Chang   2024-01-08  2450  		};
3a88be54312101 Xavier Chang   2024-01-08  2451  
3a88be54312101 Xavier Chang   2024-01-08  2452  		pextp1cfg_ao_clk: syscon@169e0000 {
3a88be54312101 Xavier Chang   2024-01-08  2453  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2454  			compatible = "mediatek,mt8196-pextp1cfg-ao", "mediatek,mt8196-pextp1cfg_ao", "syscon", "simple-mfd";
3a88be54312101 Xavier Chang   2024-01-08  2455  			reg = <0 0x169e0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2456  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2457  
3a88be54312101 Xavier Chang   2024-01-08  2458  			pextp1ao_rst: reset-controller {
3a88be54312101 Xavier Chang   2024-01-08  2459  				compatible = "ti,syscon-reset";
3a88be54312101 Xavier Chang   2024-01-08  2460  				#reset-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2461  
3a88be54312101 Xavier Chang   2024-01-08  2462  				ti,reset-bits = <
3a88be54312101 Xavier Chang   2024-01-08  2463  					/* 0: PCIe1 MAC reset */
3a88be54312101 Xavier Chang   2024-01-08  2464  					0x8  0 0xc  0 0 0
3a88be54312101 Xavier Chang   2024-01-08  2465  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
3a88be54312101 Xavier Chang   2024-01-08  2466  					/* 1: PCIe1 PHY reset */
3a88be54312101 Xavier Chang   2024-01-08  2467  					0x8  1 0xc  1 0 0
3a88be54312101 Xavier Chang   2024-01-08  2468  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
3a88be54312101 Xavier Chang   2024-01-08  2469  					/* 2: PCIe2 MAC reset */
3a88be54312101 Xavier Chang   2024-01-08  2470  					0x8  8 0xc  8 0 0
3a88be54312101 Xavier Chang   2024-01-08  2471  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
3a88be54312101 Xavier Chang   2024-01-08  2472  					/* 3: PCIe2 PHY reset */
3a88be54312101 Xavier Chang   2024-01-08  2473  					0x8  9 0xc  9 0 0
3a88be54312101 Xavier Chang   2024-01-08  2474  					(ASSERT_SET | DEASSERT_SET | STATUS_NONE)
3a88be54312101 Xavier Chang   2024-01-08  2475  					>;
3a88be54312101 Xavier Chang   2024-01-08  2476  			};
3a88be54312101 Xavier Chang   2024-01-08  2477  		};
3a88be54312101 Xavier Chang   2024-01-08  2478  
3a88be54312101 Xavier Chang   2024-01-08  2479  		ssr_top_clk: syscon@18000000 {
3a88be54312101 Xavier Chang   2024-01-08  2480  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2481  			compatible = "mediatek,mt8196-ssr-top", "mediatek,mt8196-ssr_top", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2482  			reg = <0 0x18000000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2483  			hw-voter-regmap = <&hwv>;
3a88be54312101 Xavier Chang   2024-01-08  2484  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2485  		};
3a88be54312101 Xavier Chang   2024-01-08  2486  
b9408b7224ce87 Runyang Chen   2024-03-26  2487  		devapc_apinfra_ssr: devapc@180f3000 {
b9408b7224ce87 Runyang Chen   2024-03-26  2488  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  2489  			reg = <0 0x180f3000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  2490  			vio-idx-num = <39>;
b9408b7224ce87 Runyang Chen   2024-03-26  2491  			interrupts = <GIC_SPI 866 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  2492  		};
b9408b7224ce87 Runyang Chen   2024-03-26  2493  
eedd3dc85418be Karl Li        2024-09-27  2494  		apusys_rv: remoteproc@19001000 {
eedd3dc85418be Karl Li        2024-09-27  2495  			compatible = "mediatek,mt8196-apusys_rv";
eedd3dc85418be Karl Li        2024-09-27  2496  			reg = <0 0x19001000 0 0x1000>;
eedd3dc85418be Karl Li        2024-09-27  2497  			memory-region = <&apu_reserve_memory>, <&apu_smmu_reserve_memory0>;
eedd3dc85418be Karl Li        2024-09-27  2498  			iommus = <&apu_smmu 9>;
eedd3dc85418be Karl Li        2024-09-27  2499  			interrupts = <GIC_SPI 629 IRQ_TYPE_LEVEL_HIGH 0>;
eedd3dc85418be Karl Li        2024-09-27  2500  			interrupt-names = "apu_wdt";
eedd3dc85418be Karl Li        2024-09-27  2501  			mboxes = <&apu_mailbox 0>;
eedd3dc85418be Karl Li        2024-09-27  2502  			mediatek,mbox-spare-reg = <&apu_mailbox>;
eedd3dc85418be Karl Li        2024-09-27  2503  			mediatek,hw-logger = <&apusys_hw_logger>;
eedd3dc85418be Karl Li        2024-09-27  2504  			mediatek,apu-power = <&apu_top_3>;
eedd3dc85418be Karl Li        2024-09-27  2505  
eedd3dc85418be Karl Li        2024-09-27  2506  			apu-ctrl {
eedd3dc85418be Karl Li        2024-09-27  2507  				compatible = "mediatek,apu-ctrl-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2508  				mediatek,rpmsg-name = "apu-ctrl-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2509  			};
eedd3dc85418be Karl Li        2024-09-27  2510  
eedd3dc85418be Karl Li        2024-09-27  2511  			apu_top_rpmsg: apu-top-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2512  				compatible = "mediatek,aputop-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2513  				mediatek,rpmsg-name = "mtk_apu_pwr_ipi_tx";
eedd3dc85418be Karl Li        2024-09-27  2514  				operating-points-v2 = <&apu_opp_table>;
eedd3dc85418be Karl Li        2024-09-27  2515  				#cooling-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  2516  				dynamic-power-coefficient = <1024>;
eedd3dc85418be Karl Li        2024-09-27  2517  			};
eedd3dc85418be Karl Li        2024-09-27  2518  
eedd3dc85418be Karl Li        2024-09-27  2519  			apu-mdw-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2520  				compatible = "mediatek,apu-mdw-rpmsg-v5";
eedd3dc85418be Karl Li        2024-09-27  2521  				mediatek,rpmsg-name = "apu-mdw-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2522  				version = <5>;
eedd3dc85418be Karl Li        2024-09-27  2523  			};
eedd3dc85418be Karl Li        2024-09-27  2524  
eedd3dc85418be Karl Li        2024-09-27  2525  			apu-apummu {
eedd3dc85418be Karl Li        2024-09-27  2526  				compatible = "mediatek,apu-apummu-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2527  				mediatek,rpmsg-name = "apu-apummu-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2528  			};
eedd3dc85418be Karl Li        2024-09-27  2529  
eedd3dc85418be Karl Li        2024-09-27  2530  			apu-apummu-rx {
eedd3dc85418be Karl Li        2024-09-27  2531  				compatible = "mediatek,apu-apummu-rx";
eedd3dc85418be Karl Li        2024-09-27  2532  				mediatek,rpmsg-name = "apu-apummu-rx";
eedd3dc85418be Karl Li        2024-09-27  2533  			};
eedd3dc85418be Karl Li        2024-09-27  2534  
eedd3dc85418be Karl Li        2024-09-27  2535  			apu-edma {
eedd3dc85418be Karl Li        2024-09-27  2536  				compatible = "mediatek,apu-edma-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2537  				mediatek,rpmsg-name = "apu-edma-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2538  			};
eedd3dc85418be Karl Li        2024-09-27  2539  
eedd3dc85418be Karl Li        2024-09-27  2540  			edma-rx {
eedd3dc85418be Karl Li        2024-09-27  2541  				compatible = "mediatek,edma-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2542  				mediatek,rpmsg-name = "edma-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2543  			};
eedd3dc85418be Karl Li        2024-09-27  2544  
eedd3dc85418be Karl Li        2024-09-27  2545  			apu-mnoc {
eedd3dc85418be Karl Li        2024-09-27  2546  				compatible = "mediatek,apu-mnoc-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2547  				mediatek,rpmsg-name = "apu-mnoc-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2548  			};
eedd3dc85418be Karl Li        2024-09-27  2549  
eedd3dc85418be Karl Li        2024-09-27  2550  			mdla-tx-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2551  				compatible = "mediatek,mdla-tx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2552  				mediatek,rpmsg-name = "mdla-tx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2553  			};
eedd3dc85418be Karl Li        2024-09-27  2554  
eedd3dc85418be Karl Li        2024-09-27  2555  			mdla-rx-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2556  				compatible = "mediatek,mdla-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2557  				mediatek,rpmsg-name = "mdla-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2558  			};
eedd3dc85418be Karl Li        2024-09-27  2559  
eedd3dc85418be Karl Li        2024-09-27  2560  			mvpu-tx-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2561  				compatible = "mediatek,mvpu-tx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2562  				mediatek,rpmsg-name = "mvpu-tx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2563  			};
eedd3dc85418be Karl Li        2024-09-27  2564  
eedd3dc85418be Karl Li        2024-09-27  2565  			mvpu-rx-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2566  				compatible = "mediatek,mvpu-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2567  				mediatek,rpmsg-name = "mvpu-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2568  			};
eedd3dc85418be Karl Li        2024-09-27  2569  
eedd3dc85418be Karl Li        2024-09-27  2570  			aps-tx-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2571  				compatible = "mediatek,aps-tx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2572  				mediatek,rpmsg-name = "aps-tx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2573  			};
eedd3dc85418be Karl Li        2024-09-27  2574  
eedd3dc85418be Karl Li        2024-09-27  2575  			aps-rx-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2576  				compatible = "mediatek,aps-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2577  				mediatek,rpmsg-name = "aps-rx-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2578  			};
eedd3dc85418be Karl Li        2024-09-27  2579  
eedd3dc85418be Karl Li        2024-09-27  2580  			sapu-lock-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2581  				compatible = "mediatek,apu-lock-rv-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2582  				mediatek,rpmsg-name = "apu-lock-rv-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2583  			};
eedd3dc85418be Karl Li        2024-09-27  2584  
eedd3dc85418be Karl Li        2024-09-27  2585  			apu-scp-mdw-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2586  				compatible = "mediatek,apu-scp-mdw-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2587  				mediatek,rpmsg-name = "apu-scp-mdw-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2588  			};
eedd3dc85418be Karl Li        2024-09-27  2589  
eedd3dc85418be Karl Li        2024-09-27  2590  			apu-scp-np-recover-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2591  				compatible = "mediatek,apu-scp-np-recover-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2592  				mediatek,rpmsg-name = "apu-scp-np-recover-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2593  			};
eedd3dc85418be Karl Li        2024-09-27  2594  
eedd3dc85418be Karl Li        2024-09-27  2595  			apu-ipi-ut-rpmsg {
eedd3dc85418be Karl Li        2024-09-27  2596  				compatible = "mediatek,apu-ipi-ut-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2597  				mediatek,rpmsg-name = "apu-ipi-ut-rpmsg";
eedd3dc85418be Karl Li        2024-09-27  2598  			};
eedd3dc85418be Karl Li        2024-09-27  2599  		};
eedd3dc85418be Karl Li        2024-09-27  2600  
eedd3dc85418be Karl Li        2024-09-27  2601  		apu_opp_table: opp-table-apu {
eedd3dc85418be Karl Li        2024-09-27  2602  			compatible = "operating-points-v2";
eedd3dc85418be Karl Li        2024-09-27  2603  
eedd3dc85418be Karl Li        2024-09-27  2604  			opp@1800000000 {
eedd3dc85418be Karl Li        2024-09-27  2605  				opp-hz = /bits/ 64 <1800000000>;
eedd3dc85418be Karl Li        2024-09-27  2606  			};
eedd3dc85418be Karl Li        2024-09-27  2607  
eedd3dc85418be Karl Li        2024-09-27  2608  			opp@1600000000 {
eedd3dc85418be Karl Li        2024-09-27  2609  				opp-hz = /bits/ 64 <1600000000>;
eedd3dc85418be Karl Li        2024-09-27  2610  			};
eedd3dc85418be Karl Li        2024-09-27  2611  
eedd3dc85418be Karl Li        2024-09-27  2612  			opp@1450000000 {
eedd3dc85418be Karl Li        2024-09-27  2613  				opp-hz = /bits/ 64 <1450000000>;
eedd3dc85418be Karl Li        2024-09-27  2614  			};
eedd3dc85418be Karl Li        2024-09-27  2615  
eedd3dc85418be Karl Li        2024-09-27  2616  			opp@1300000000 {
eedd3dc85418be Karl Li        2024-09-27  2617  				opp-hz = /bits/ 64 <1300000000>;
eedd3dc85418be Karl Li        2024-09-27  2618  			};
eedd3dc85418be Karl Li        2024-09-27  2619  
eedd3dc85418be Karl Li        2024-09-27  2620  			opp@1115000000 {
eedd3dc85418be Karl Li        2024-09-27  2621  				opp-hz = /bits/ 64 <1115000000>;
eedd3dc85418be Karl Li        2024-09-27  2622  			};
eedd3dc85418be Karl Li        2024-09-27  2623  
eedd3dc85418be Karl Li        2024-09-27  2624  			opp@930000000 {
eedd3dc85418be Karl Li        2024-09-27  2625  				opp-hz = /bits/ 64 <930000000>;
eedd3dc85418be Karl Li        2024-09-27  2626  			};
eedd3dc85418be Karl Li        2024-09-27  2627  
eedd3dc85418be Karl Li        2024-09-27  2628  			opp@730000000 {
eedd3dc85418be Karl Li        2024-09-27  2629  				opp-hz = /bits/ 64 <730000000>;
eedd3dc85418be Karl Li        2024-09-27  2630  			};
eedd3dc85418be Karl Li        2024-09-27  2631  
eedd3dc85418be Karl Li        2024-09-27  2632  			opp@630000000 {
eedd3dc85418be Karl Li        2024-09-27  2633  				opp-hz = /bits/ 64 <630000000>;
eedd3dc85418be Karl Li        2024-09-27  2634  			};
eedd3dc85418be Karl Li        2024-09-27  2635  
eedd3dc85418be Karl Li        2024-09-27  2636  			opp@530000000 {
eedd3dc85418be Karl Li        2024-09-27  2637  				opp-hz = /bits/ 64 <530000000>;
eedd3dc85418be Karl Li        2024-09-27  2638  			};
eedd3dc85418be Karl Li        2024-09-27  2639  
eedd3dc85418be Karl Li        2024-09-27  2640  			opp@457500000 {
eedd3dc85418be Karl Li        2024-09-27  2641  				opp-hz = /bits/ 64 <457500000>;
eedd3dc85418be Karl Li        2024-09-27  2642  			};
eedd3dc85418be Karl Li        2024-09-27  2643  
eedd3dc85418be Karl Li        2024-09-27  2644  			opp@385000000 {
eedd3dc85418be Karl Li        2024-09-27  2645  				opp-hz = /bits/ 64 <385000000>;
eedd3dc85418be Karl Li        2024-09-27  2646  			};
eedd3dc85418be Karl Li        2024-09-27  2647  		};
eedd3dc85418be Karl Li        2024-09-27  2648  
eedd3dc85418be Karl Li        2024-09-27  2649  		apu_top_3: power-controller@19020000 {
eedd3dc85418be Karl Li        2024-09-27  2650  			compatible = "mt8196,apu-top-3";
eedd3dc85418be Karl Li        2024-09-27  2651  			reg = <0 0x19020000 0 0x1000>,
eedd3dc85418be Karl Li        2024-09-27  2652  			      <0 0x190e0000 0 0x4000>,
eedd3dc85418be Karl Li        2024-09-27  2653  			      <0 0x190f0000 0 0x1000>;
eedd3dc85418be Karl Li        2024-09-27  2654  			reg-names = "RCX",
eedd3dc85418be Karl Li        2024-09-27  2655  				    "VCORE",
eedd3dc85418be Karl Li        2024-09-27  2656  				    "RPC";
eedd3dc85418be Karl Li        2024-09-27  2657  			mediatek,mbox-spare-reg = <&apu_mailbox>;
eedd3dc85418be Karl Li        2024-09-27  2658  			memory-region = <&apu_reserve_memory>;
eedd3dc85418be Karl Li        2024-09-27  2659  		};
eedd3dc85418be Karl Li        2024-09-27  2660  
eedd3dc85418be Karl Li        2024-09-27  2661  		apusys_hw_logger: logger@19024000 {
eedd3dc85418be Karl Li        2024-09-27  2662  			compatible = "mediatek,apusys-hw-logger";
eedd3dc85418be Karl Li        2024-09-27  2663  			reg = <0 0x19024000 0 0x1000>;
eedd3dc85418be Karl Li        2024-09-27  2664  			interrupts = <GIC_SPI 632 IRQ_TYPE_EDGE_RISING 0>;
eedd3dc85418be Karl Li        2024-09-27  2665  			iommus = <&apu_smmu 12>;
eedd3dc85418be Karl Li        2024-09-27  2666  			mediatek,mbox-spare-reg = <&apu_mailbox>;
eedd3dc85418be Karl Li        2024-09-27  2667  			mediatek,apu-power = <&apu_top_3>;
eedd3dc85418be Karl Li        2024-09-27  2668  		};
eedd3dc85418be Karl Li        2024-09-27  2669  
990c0028a0ae7e Hailong Fan    2024-08-05  2670  		adsp: adsp@1a000000 {
990c0028a0ae7e Hailong Fan    2024-08-05  2671  			compatible = "mediatek,mt8196-dsp";
990c0028a0ae7e Hailong Fan    2024-08-05  2672  			reg = <0 0x1a000000 0 0x5000>,
990c0028a0ae7e Hailong Fan    2024-08-05  2673  			      <0 0x1a210000 0 0x80000>,
990c0028a0ae7e Hailong Fan    2024-08-05  2674  			      <0 0x1a345000 0 0x300>,
990c0028a0ae7e Hailong Fan    2024-08-05  2675  			      <0 0x1a00f000 0 0x1000>;
990c0028a0ae7e Hailong Fan    2024-08-05  2676  			reg-names = "cfg", "sram", "sec", "bus";
990c0028a0ae7e Hailong Fan    2024-08-05  2677  			interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH 0>;
990c0028a0ae7e Hailong Fan    2024-08-05  2678  			interrupt-names = "wdt";
990c0028a0ae7e Hailong Fan    2024-08-05  2679  			power-domains = <&scpsys MT8196_POWER_DOMAIN_ADSP_TOP_DORMANT>;
990c0028a0ae7e Hailong Fan    2024-08-05  2680  			clocks = <&cksys_clk CLK_CK_ADSP_SEL>,
990c0028a0ae7e Hailong Fan    2024-08-05  2681  				 <&cksys_clk CLK_CK_TCK_26M_MX9>,
990c0028a0ae7e Hailong Fan    2024-08-05  2682  				 <&cksys_clk CLK_CK_ADSPPLL>;
990c0028a0ae7e Hailong Fan    2024-08-05  2683  			clock-names = "clk_top_adsp_sel",
990c0028a0ae7e Hailong Fan    2024-08-05  2684  				      "clk_top_clk26m",
990c0028a0ae7e Hailong Fan    2024-08-05  2685  				      "clk_top_adsppll";
990c0028a0ae7e Hailong Fan    2024-08-05  2686  			mbox-names = "rx", "tx";
990c0028a0ae7e Hailong Fan    2024-08-05  2687  			mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
990c0028a0ae7e Hailong Fan    2024-08-05  2688  			status = "disabled";
990c0028a0ae7e Hailong Fan    2024-08-05  2689  		};
990c0028a0ae7e Hailong Fan    2024-08-05  2690  
b9408b7224ce87 Runyang Chen   2024-03-26  2691  		devapc_adsp: devapc@1a019000 {
b9408b7224ce87 Runyang Chen   2024-03-26  2692  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  2693  			reg = <0 0x1a019000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  2694  			vio-idx-num = <54>;
b9408b7224ce87 Runyang Chen   2024-03-26  2695  			interrupts = <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  2696  		};
b9408b7224ce87 Runyang Chen   2024-03-26  2697  
3a88be54312101 Xavier Chang   2024-01-08 @2698  		afe_clk: syscon@1a110000 {
3a88be54312101 Xavier Chang   2024-01-08  2699  			compatible = "mediatek,mt8196-audiosys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2700  			reg = <0 0x1a110000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2701  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  2702  			power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
3a88be54312101 Xavier Chang   2024-01-08  2703  		};
3a88be54312101 Xavier Chang   2024-01-08  2704  
2f2aff80fd0e0d Darren Ye      2024-04-01  2705  		afe: mt8196-afe-pcm@1a110000 {
2f2aff80fd0e0d Darren Ye      2024-04-01  2706  			compatible = "mediatek,mt8196-sound";
2f2aff80fd0e0d Darren Ye      2024-04-01  2707  			reg = <0 0x1a110000 0 0x9000>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2708  			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2709  			cksys = <&cksys_clk>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2710  			vlpcksys = <&vlp_cksys_clk>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2711  			power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2712  			clocks = <&afe_clk CLK_AFE_AUDIO_HOPPING_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2713  				<&afe_clk CLK_AFE_AUDIO_F26M_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2714  				<&afe_clk CLK_AFE_UL0_ADC_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2715  				<&afe_clk CLK_AFE_UL0_ADC_HIRES_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2716  				<&afe_clk CLK_AFE_UL1_ADC_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2717  				<&afe_clk CLK_AFE_UL1_ADC_HIRES_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2718  				<&afe_clk CLK_AFE_APLL1_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2719  				<&afe_clk CLK_AFE_APLL2_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2720  				<&afe_clk CLK_AFE_APLL_TUNER1_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2721  				<&afe_clk CLK_AFE_APLL_TUNER2_AFE>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2722  				<&vlp_cksys_clk CLK_VLP_CK_AUD_INTBUS_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2723  				<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN1_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2724  				<&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN2_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2725  				<&vlp_cksys_clk CLK_VLP_CK_AUDIO_H_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2726  				<&vlp_cksys_clk CLK_VLP_CK_CLKSQ>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2727  				<&cksys_clk CLK_CK_MAINPLL_D4_D4>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2728  				<&cksys_clk CLK_CK_AUD_1_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2729  				<&cksys_clk CLK_CK_APLL1>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2730  				<&cksys_clk CLK_CK_AUD_2_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2731  				<&cksys_clk CLK_CK_APLL2>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2732  				<&cksys_clk CLK_CK_APLL1_D4>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2733  				<&cksys_clk CLK_CK_APLL2_D4>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2734  				<&cksys_clk CLK_CK_APLL_I2SIN0_MCK_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2735  				<&cksys_clk CLK_CK_APLL_I2SIN1_MCK_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2736  				<&cksys_clk CLK_CK_APLL_FMI2S_MCK_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2737  				<&cksys_clk CLK_CK_APLL_TDMOUT_MCK_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2738  				<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN0>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2739  				<&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN1>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2740  				<&cksys_clk CLK_CK_APLL12_CK_DIV_FMI2S>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2741  				<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_M>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2742  				<&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_B>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2743  				<&cksys_clk CLK_CK_ADSP_SEL>,
2f2aff80fd0e0d Darren Ye      2024-04-01  2744  				<&cksys_clk CLK_CK_TCK_26M_MX9>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2745  
2f2aff80fd0e0d Darren Ye      2024-04-01  2746  			clock-names = "aud_hopping_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  2747  				"aud_f26m_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  2748  				"aud_ul0_adc_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  2749  				"aud_ul0_adc_hires_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  2750  				"aud_ul1_adc_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  2751  				"aud_ul1_adc_hires_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  2752  				"aud_apll1_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  2753  				"aud_apll2_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  2754  				"aud_apll_tuner1_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  2755  				"aud_apll_tuner2_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  2756  				"vlp_mux_audio_int",
2f2aff80fd0e0d Darren Ye      2024-04-01  2757  				"vlp_mux_aud_eng1",
2f2aff80fd0e0d Darren Ye      2024-04-01  2758  				"vlp_mux_aud_eng2",
2f2aff80fd0e0d Darren Ye      2024-04-01  2759  				"vlp_mux_audio_h",
2f2aff80fd0e0d Darren Ye      2024-04-01  2760  				"vlp_clk26m_clk",
2f2aff80fd0e0d Darren Ye      2024-04-01  2761  				"ck_mainpll_d4_d4",
2f2aff80fd0e0d Darren Ye      2024-04-01  2762  				"ck_mux_aud_1",
2f2aff80fd0e0d Darren Ye      2024-04-01  2763  				"ck_apll1_ck",
2f2aff80fd0e0d Darren Ye      2024-04-01  2764  				"ck_mux_aud_2",
2f2aff80fd0e0d Darren Ye      2024-04-01  2765  				"ck_apll2_ck",
2f2aff80fd0e0d Darren Ye      2024-04-01  2766  				"ck_apll1_d4",
2f2aff80fd0e0d Darren Ye      2024-04-01  2767  				"ck_apll2_d4",
2f2aff80fd0e0d Darren Ye      2024-04-01  2768  				"ck_i2sin0_m_sel",
2f2aff80fd0e0d Darren Ye      2024-04-01  2769  				"ck_i2sin1_m_sel",
2f2aff80fd0e0d Darren Ye      2024-04-01  2770  				"ck_fmi2s_m_sel",
2f2aff80fd0e0d Darren Ye      2024-04-01  2771  				"ck_tdmout_m_sel",
2f2aff80fd0e0d Darren Ye      2024-04-01  2772  				"ck_apll12_div_i2sin0",
2f2aff80fd0e0d Darren Ye      2024-04-01  2773  				"ck_apll12_div_i2sin1",
2f2aff80fd0e0d Darren Ye      2024-04-01  2774  				"ck_apll12_div_fmi2s",
2f2aff80fd0e0d Darren Ye      2024-04-01  2775  				"ck_apll12_div_tdmout_m",
2f2aff80fd0e0d Darren Ye      2024-04-01  2776  				"ck_apll12_div_tdmout_b",
2f2aff80fd0e0d Darren Ye      2024-04-01  2777  				"ck_adsp_sel",
2f2aff80fd0e0d Darren Ye      2024-04-01  2778  				"ck_clk26m_clk";
2f2aff80fd0e0d Darren Ye      2024-04-01  2779  			pinctrl-names = "aud-clk-mosi-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2780  				"aud-clk-mosi-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2781  				"aud-dat-mosi-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2782  				"aud-dat-mosi-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2783  				"aud-dat-mosi-ch34-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2784  				"aud-dat-mosi-ch34-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2785  				"aud-dat-miso0-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2786  				"aud-dat-miso0-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2787  				"aud-dat-miso1-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2788  				"aud-dat-miso1-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2789  				"aud-gpio-i2sin0-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2790  				"aud-gpio-i2sin0-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2791  				"aud-gpio-i2sout0-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2792  				"aud-gpio-i2sout0-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2793  				"aud-gpio-i2sin1-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2794  				"aud-gpio-i2sin1-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2795  				"aud-gpio-i2sout1-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2796  				"aud-gpio-i2sout1-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2797  				"aud-gpio-i2sin4-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2798  				"aud-gpio-i2sin4-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2799  				"aud-gpio-i2sout4-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2800  				"aud-gpio-i2sout4-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2801  				"aud-gpio-i2sin6-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2802  				"aud-gpio-i2sin6-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2803  				"aud-gpio-i2sout6-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2804  				"aud-gpio-i2sout6-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2805  				"aud-dat-miso-only-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2806  				"aud-dat-miso-only-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2807  				"aud-gpio-ap-dmic-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2808  				"aud-gpio-ap-dmic-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2809  				"aud-gpio-ap-dmic1-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2810  				"aud-gpio-ap-dmic1-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2811  				"aud-gpio-i2sin3-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2812  				"aud-gpio-i2sin3-on",
2f2aff80fd0e0d Darren Ye      2024-04-01  2813  				"aud-gpio-i2sout3-off",
2f2aff80fd0e0d Darren Ye      2024-04-01  2814  				"aud-gpio-i2sout3-on";
2f2aff80fd0e0d Darren Ye      2024-04-01  2815  
2f2aff80fd0e0d Darren Ye      2024-04-01  2816  			pinctrl-0 = <&aud_clk_mosi_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2817  			pinctrl-1 = <&aud_clk_mosi_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2818  			pinctrl-2 = <&aud_dat_mosi_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2819  			pinctrl-3 = <&aud_dat_mosi_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2820  			pinctrl-4 = <&aud_dat_mosi_ch34_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2821  			pinctrl-5 = <&aud_dat_mosi_ch34_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2822  			pinctrl-6 = <&aud_dat_miso0_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2823  			pinctrl-7 = <&aud_dat_miso0_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2824  			pinctrl-8 = <&aud_dat_miso1_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2825  			pinctrl-9 = <&aud_dat_miso1_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2826  			pinctrl-10 = <&aud_gpio_i2sin0_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2827  			pinctrl-11 = <&aud_gpio_i2sin0_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2828  			pinctrl-12 = <&aud_gpio_i2sout0_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2829  			pinctrl-13 = <&aud_gpio_i2sout0_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2830  			pinctrl-14 = <&aud_gpio_i2sin1_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2831  			pinctrl-15 = <&aud_gpio_i2sin1_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2832  			pinctrl-16 = <&aud_gpio_i2sout1_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2833  			pinctrl-17 = <&aud_gpio_i2sout1_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2834  			pinctrl-18 = <&aud_gpio_i2sin4_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2835  			pinctrl-19 = <&aud_gpio_i2sin4_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2836  			pinctrl-20 = <&aud_gpio_i2sout4_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2837  			pinctrl-21 = <&aud_gpio_i2sout4_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2838  			pinctrl-22 = <&aud_gpio_i2sin6_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2839  			pinctrl-23 = <&aud_gpio_i2sin6_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2840  			pinctrl-24 = <&aud_gpio_i2sout6_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2841  			pinctrl-25 = <&aud_gpio_i2sout6_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2842  			pinctrl-26 = <&aud_dat_miso_only_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2843  			pinctrl-27 = <&aud_dat_miso_only_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2844  			pinctrl-28 = <&aud_gpio_ap_dmic_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2845  			pinctrl-29 = <&aud_gpio_ap_dmic_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2846  			pinctrl-30 = <&aud_gpio_ap_dmic1_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2847  			pinctrl-31 = <&aud_gpio_ap_dmic1_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2848  			pinctrl-32 = <&aud_gpio_i2sin3_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2849  			pinctrl-33 = <&aud_gpio_i2sin3_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2850  			pinctrl-34 = <&aud_gpio_i2sout3_off>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2851  			pinctrl-35 = <&aud_gpio_i2sout3_on>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2852  
2f2aff80fd0e0d Darren Ye      2024-04-01  2853  			/* Only for ETDM in/out 4 */
2f2aff80fd0e0d Darren Ye      2024-04-01  2854  			etdm-out-ch = <2>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2855  			etdm-in-ch = <2>;
2f2aff80fd0e0d Darren Ye      2024-04-01  2856  			etdm-out-sync = <0>; /* 0: disable; 1: enable */
2f2aff80fd0e0d Darren Ye      2024-04-01  2857  			etdm-in-sync = <1>; /* 0: disable; 1: enable */
2f2aff80fd0e0d Darren Ye      2024-04-01  2858  			etdm-ip-mode = <0>; /* 0: One IP multi-channel 1: Multi-IP 2-channel */
2f2aff80fd0e0d Darren Ye      2024-04-01  2859  			status = "disabled";
2f2aff80fd0e0d Darren Ye      2024-04-01  2860  		};
2f2aff80fd0e0d Darren Ye      2024-04-01  2861  
990c0028a0ae7e Hailong Fan    2024-08-05  2862  		adsp_mailbox0: mailbox@1a350000 {
990c0028a0ae7e Hailong Fan    2024-08-05  2863  			compatible = "mediatek,mt8196-adsp-mbox",
990c0028a0ae7e Hailong Fan    2024-08-05  2864  				     "mediatek,mt8186-adsp-mbox";
990c0028a0ae7e Hailong Fan    2024-08-05  2865  			reg = <0 0x1a350100 0 0x1000>;
990c0028a0ae7e Hailong Fan    2024-08-05  2866  			interrupts = <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH 0>;
990c0028a0ae7e Hailong Fan    2024-08-05  2867  			#mbox-cells = <0>;
990c0028a0ae7e Hailong Fan    2024-08-05  2868  		};
990c0028a0ae7e Hailong Fan    2024-08-05  2869  
990c0028a0ae7e Hailong Fan    2024-08-05  2870  		adsp_mailbox1: mailbox@1a360000 {
990c0028a0ae7e Hailong Fan    2024-08-05  2871  			compatible = "mediatek,mt8196-adsp-mbox",
990c0028a0ae7e Hailong Fan    2024-08-05  2872  				     "mediatek,mt8186-adsp-mbox";
990c0028a0ae7e Hailong Fan    2024-08-05  2873  			reg = <0 0x1a360100 0 0x1000>;
990c0028a0ae7e Hailong Fan    2024-08-05  2874  			interrupts = <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH 0>;
990c0028a0ae7e Hailong Fan    2024-08-05  2875  			#mbox-cells = <0>;
990c0028a0ae7e Hailong Fan    2024-08-05  2876  		};
990c0028a0ae7e Hailong Fan    2024-08-05  2877  
3a88be54312101 Xavier Chang   2024-01-08  2878  		scpsys: power-controller@1c004000 {
3a88be54312101 Xavier Chang   2024-01-08  2879  			compatible = "mediatek,mt8196-scpsys-hwv", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2880  			reg = <0 0x1c004000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2881  			#power-domain-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2882  			apifrbus-ao-io-reg-bus = <&ifr_bus>;
3a88be54312101 Xavier Chang   2024-01-08  2883  			spm = <&scpsys_bus>;
3a88be54312101 Xavier Chang   2024-01-08  2884  			hw-voter-regmap = <&hwv>;
3a88be54312101 Xavier Chang   2024-01-08  2885  		};
3a88be54312101 Xavier Chang   2024-01-08  2886  
3a88be54312101 Xavier Chang   2024-01-08  2887  		scpsys_bus: syscon@1c00d000 {
3a88be54312101 Xavier Chang   2024-01-08  2888  			compatible = "mediatek,mt8196-scpsys-bus", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2889  			reg = <0 0x1c00d000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2890  		};
3a88be54312101 Xavier Chang   2024-01-08  2891  
3a88be54312101 Xavier Chang   2024-01-08  2892  		watchdog: watchdog@1c010000 {
3a88be54312101 Xavier Chang   2024-01-08  2893  			compatible = "mediatek,mt8196-wdt",
3a88be54312101 Xavier Chang   2024-01-08  2894  					"mediatek,mt6589-wdt",
3a88be54312101 Xavier Chang   2024-01-08  2895  					"syscon", "simple-mfd";
3a88be54312101 Xavier Chang   2024-01-08  2896  			reg = <0 0x1c010000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2897  		};
3a88be54312101 Xavier Chang   2024-01-08  2898  
a5a854b9d1f4b6 Aming Chan     2024-07-25  2899  		dvfsrc: dvfsrc@1c013000 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  2900  			compatible = "mediatek,mt8196-dvfsrc";
a5a854b9d1f4b6 Aming Chan     2024-07-25  2901  			reg = <0 0x1c013000 0 0x1000>,
a5a854b9d1f4b6 Aming Chan     2024-07-25  2902  				<0 0x1c004000 0 0x1000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2903  			reg-names = "dvfsrc", "spm";
a5a854b9d1f4b6 Aming Chan     2024-07-25  2904  			#interconnect-cells = <1>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2905  
a5a854b9d1f4b6 Aming Chan     2024-07-25  2906  			dvfsrc_vcore: dvfsrc-vcore {
a5a854b9d1f4b6 Aming Chan     2024-07-25  2907  				regulator-name = "dvfsrc-vcore";
a5a854b9d1f4b6 Aming Chan     2024-07-25  2908  				regulator-min-microvolt = <575000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2909  				regulator-max-microvolt = <875000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2910  				regulator-always-on;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2911  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  2912  
a5a854b9d1f4b6 Aming Chan     2024-07-25  2913  			dvfsrc_freq_opp9: opp9 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  2914  				opp-peak-KBps = <0>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2915  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  2916  			dvfsrc_freq_opp8: opp8 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  2917  				opp-peak-KBps = <9800000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2918  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  2919  			dvfsrc_freq_opp7: opp7 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  2920  				opp-peak-KBps = <13200000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2921  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  2922  			dvfsrc_freq_opp6: opp6 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  2923  				opp-peak-KBps = <19700000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2924  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  2925  			dvfsrc_freq_opp5: opp5 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  2926  				opp-peak-KBps = <24900000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2927  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  2928  			dvfsrc_freq_opp4: opp4 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  2929  				opp-peak-KBps = <32400000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2930  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  2931  			dvfsrc_freq_opp3: opp3 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  2932  				opp-peak-KBps = <37600000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2933  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  2934  			dvfsrc_freq_opp2: opp2 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  2935  				opp-peak-KBps = <44300000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2936  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  2937  			dvfsrc_freq_opp1: opp1 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  2938  				opp-peak-KBps = <54500000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2939  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  2940  			dvfsrc_freq_opp0: opp0 {
a5a854b9d1f4b6 Aming Chan     2024-07-25  2941  				opp-peak-KBps = <61400000>;
a5a854b9d1f4b6 Aming Chan     2024-07-25  2942  			};
a5a854b9d1f4b6 Aming Chan     2024-07-25  2943  		};
a5a854b9d1f4b6 Aming Chan     2024-07-25  2944  
3a88be54312101 Xavier Chang   2024-01-08  2945  		vlp_cksys_clk: syscon@1c016000 {
3a88be54312101 Xavier Chang   2024-01-08  2946  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  2947  			compatible = "mediatek,mt8196-vlp-cksys", "mediatek,mt8196-vlp_cksys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  2948  			reg = <0 0x1c016000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  2949  			hw-voter-regmap = <&hwv>;
3a88be54312101 Xavier Chang   2024-01-08  2950  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  2951  		};
3a88be54312101 Xavier Chang   2024-01-08  2952  
20943b200aa83b Xavier Chang   2024-07-02  2953  		spmi: spmi@1c01a000 {
20943b200aa83b Xavier Chang   2024-07-02  2954  			compatible = "mediatek,mt8196-spmi";
20943b200aa83b Xavier Chang   2024-07-02  2955  			reg = <0 0x1c01a000 0 0x0008ff>,
20943b200aa83b Xavier Chang   2024-07-02  2956  			      <0 0x1c01c000 0 0x000100>,
20943b200aa83b Xavier Chang   2024-07-02  2957  			      <0 0x1c018000 0 0x0008ff>,
20943b200aa83b Xavier Chang   2024-07-02  2958  			      <0 0x1c01c800 0 0x000100>;
20943b200aa83b Xavier Chang   2024-07-02  2959  			reg-names = "pmif", "spmimst","pmif-p","spmimst-p";
20943b200aa83b Xavier Chang   2024-07-02  2960  			interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>,
20943b200aa83b Xavier Chang   2024-07-02  2961  					      <&pio 292 IRQ_TYPE_LEVEL_HIGH>,
20943b200aa83b Xavier Chang   2024-07-02  2962  					      <&gic GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH 0>,
20943b200aa83b Xavier Chang   2024-07-02  2963  					      <&gic GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH 0>,
20943b200aa83b Xavier Chang   2024-07-02  2964  					      <&gic GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH 0>,
20943b200aa83b Xavier Chang   2024-07-02  2965  					      <&gic GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH 0>;
20943b200aa83b Xavier Chang   2024-07-02  2966  			interrupt-names = "rcs_irq","rcs_irq_p","pmif_irq","spmi_nack_irq","pmif_p_irq","spmi_p_nack_irq";
20943b200aa83b Xavier Chang   2024-07-02  2967  			interrupt-controller;
20943b200aa83b Xavier Chang   2024-07-02  2968  			#interrupt-cells = <1>;
20943b200aa83b Xavier Chang   2024-07-02  2969  			irq-event-en = <0x0 0x0 0x0 0x0 0x0>;
20943b200aa83b Xavier Chang   2024-07-02  2970  			spmi-dev-mask = <0x85c0>;
20943b200aa83b Xavier Chang   2024-07-02  2971  			#address-cells = <2>;
20943b200aa83b Xavier Chang   2024-07-02  2972  			#size-cells = <0>;
20943b200aa83b Xavier Chang   2024-07-02  2973  		};
20943b200aa83b Xavier Chang   2024-07-02  2974  
b9408b7224ce87 Runyang Chen   2024-03-26  2975  		devapc_vlp: devapc@1c032000 {
b9408b7224ce87 Runyang Chen   2024-03-26  2976  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  2977  			reg = <0 0x1c032000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  2978  			vio-idx-num = <101>;
b9408b7224ce87 Runyang Chen   2024-03-26  2979  			interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  2980  		};
b9408b7224ce87 Runyang Chen   2024-03-26  2981  
519d40b68a563e Kenji Yu       2024-08-30  2982  		sram@1c350000 {
519d40b68a563e Kenji Yu       2024-08-30  2983  			compatible = "mmio-sram";
519d40b68a563e Kenji Yu       2024-08-30  2984  			reg = <0x0 0x1c350000 0x0 0x80>;
519d40b68a563e Kenji Yu       2024-08-30  2985  
519d40b68a563e Kenji Yu       2024-08-30  2986  			#address-cells = <1>;
519d40b68a563e Kenji Yu       2024-08-30  2987  			#size-cells = <1>;
519d40b68a563e Kenji Yu       2024-08-30  2988  			ranges = <0 0x0 0x1c350000 0x80>;
519d40b68a563e Kenji Yu       2024-08-30  2989  
519d40b68a563e Kenji Yu       2024-08-30  2990  			scmi_tx_shmem: mailbox-sram@0 {
519d40b68a563e Kenji Yu       2024-08-30  2991  				compatible = "arm,scmi-shmem";
519d40b68a563e Kenji Yu       2024-08-30  2992  				reg = <0x0 0x80>;
519d40b68a563e Kenji Yu       2024-08-30  2993  			};
519d40b68a563e Kenji Yu       2024-08-30  2994  		};
519d40b68a563e Kenji Yu       2024-08-30  2995  
519d40b68a563e Kenji Yu       2024-08-30  2996  		tinysys_mbox: mailbox@1c351000 {
519d40b68a563e Kenji Yu       2024-08-30  2997  			compatible = "mediatek,tinysys_mbox";
519d40b68a563e Kenji Yu       2024-08-30  2998  			reg = <0 0x1c351000 0 0x1000>,
519d40b68a563e Kenji Yu       2024-08-30  2999  			      <0 0x1c361000 0 0x1000>;
519d40b68a563e Kenji Yu       2024-08-30  3000  			/* for profiling */
519d40b68a563e Kenji Yu       2024-08-30  3001  			shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
519d40b68a563e Kenji Yu       2024-08-30  3002  			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH 0>,
519d40b68a563e Kenji Yu       2024-08-30  3003  				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH 0>;
519d40b68a563e Kenji Yu       2024-08-30  3004  			#mbox-cells = <1>;
519d40b68a563e Kenji Yu       2024-08-30  3005  			/* notify spm clr */
519d40b68a563e Kenji Yu       2024-08-30  3006  			secure-sspm-md2spm-clr = <1>;
519d40b68a563e Kenji Yu       2024-08-30  3007  		};
519d40b68a563e Kenji Yu       2024-08-30  3008  
519d40b68a563e Kenji Yu       2024-08-30  3009  		sram@1c360000 {
519d40b68a563e Kenji Yu       2024-08-30  3010  			compatible = "mmio-sram";
519d40b68a563e Kenji Yu       2024-08-30  3011  			reg = <0x0 0x1c360000 0x0 0x80>;
519d40b68a563e Kenji Yu       2024-08-30  3012  
519d40b68a563e Kenji Yu       2024-08-30  3013  			#address-cells = <1>;
519d40b68a563e Kenji Yu       2024-08-30  3014  			#size-cells = <1>;
519d40b68a563e Kenji Yu       2024-08-30  3015  			ranges = <0 0x0 0x1c360000 0x80>;
519d40b68a563e Kenji Yu       2024-08-30  3016  
519d40b68a563e Kenji Yu       2024-08-30  3017  			scmi_rx_shmem: mailbox-sram@0 {
519d40b68a563e Kenji Yu       2024-08-30  3018  				compatible = "arm,scmi-shmem";
519d40b68a563e Kenji Yu       2024-08-30  3019  				reg = <0x0 0x80>;
519d40b68a563e Kenji Yu       2024-08-30  3020  			};
519d40b68a563e Kenji Yu       2024-08-30  3021  		};
519d40b68a563e Kenji Yu       2024-08-30  3022  
3a88be54312101 Xavier Chang   2024-01-08  3023  		systimer: systimer@1c400000 {
3a88be54312101 Xavier Chang   2024-01-08  3024  			compatible = "mediatek,mt8196-timer",
3a88be54312101 Xavier Chang   2024-01-08  3025  				     "mediatek,mt6765-timer";
3a88be54312101 Xavier Chang   2024-01-08  3026  			reg = <0 0x1c400000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3027  			interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH 0>;
3a88be54312101 Xavier Chang   2024-01-08  3028  			clocks = <&clk13m>;
3a88be54312101 Xavier Chang   2024-01-08  3029  		};
3a88be54312101 Xavier Chang   2024-01-08  3030  
5ea44a544d5f55 Yong Wu        2024-02-04  3031  		smi_disp_common: smi-comm@30020000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3032  			compatible = "mediatek,mt8196-smi-common";
5ea44a544d5f55 Yong Wu        2024-02-04  3033  			reg = <0 0x30020000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3034  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3035  			mediatek,smi = <&disp_ssc0_smi_2x1_sub_comm>;
5ea44a544d5f55 Yong Wu        2024-02-04  3036  			mediatek,common-id = <0>;
5ea44a544d5f55 Yong Wu        2024-02-04  3037  			mediatek,skip-rpm-cb;
5ea44a544d5f55 Yong Wu        2024-02-04  3038  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3039  
5ea44a544d5f55 Yong Wu        2024-02-04  3040  		smi_mdp_common: smi-comm@30021000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3041  			compatible = "mediatek,mt8196-smi-common";
5ea44a544d5f55 Yong Wu        2024-02-04  3042  			reg = <0 0x30021000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3043  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3044  			mediatek,smi = <&mdp_ssc4_smi_2x1_sub_comm>;
5ea44a544d5f55 Yong Wu        2024-02-04  3045  			mediatek,common-id = <1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3046  			mediatek,skip-rpm-cb;
5ea44a544d5f55 Yong Wu        2024-02-04  3047  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3048  
b9408b7224ce87 Runyang Chen   2024-03-26  3049  		devapc_mminfra: devapc@30040000 {
b9408b7224ce87 Runyang Chen   2024-03-26  3050  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  3051  			reg = <0 0x30040000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  3052  			vio-idx-num = <699>;
b9408b7224ce87 Runyang Chen   2024-03-26  3053  			interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  3054  		};
b9408b7224ce87 Runyang Chen   2024-03-26  3055  
620014904e31a2 Xavier Chang   2024-07-02  3056  		gce0: gce@300c0000 {
620014904e31a2 Xavier Chang   2024-07-02  3057  			compatible = "mediatek,mt8196-gce";
620014904e31a2 Xavier Chang   2024-07-02  3058  			reg = <0 0x300c0000 0 0x80000>;
620014904e31a2 Xavier Chang   2024-07-02  3059  			interrupts = <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH 0>;
620014904e31a2 Xavier Chang   2024-07-02  3060  			#mbox-cells = <2>;
620014904e31a2 Xavier Chang   2024-07-02  3061  			iommus = <&mm_smmu 199>;
6918c019ec1fdd Jason-jh Lin   2024-07-12  3062  			mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
6918c019ec1fdd Jason-jh Lin   2024-07-12  3063  			mediatek,gce-events = <CMDQ_SYNC_SECURE_THR_EOF>;
620014904e31a2 Xavier Chang   2024-07-02  3064  		};
620014904e31a2 Xavier Chang   2024-07-02  3065  
620014904e31a2 Xavier Chang   2024-07-02  3066  		gce1: gce@30140000 {
620014904e31a2 Xavier Chang   2024-07-02  3067  			compatible = "mediatek,mt8196-gce";
620014904e31a2 Xavier Chang   2024-07-02  3068  			reg = <0 0x30140000 0 0x80000>;
620014904e31a2 Xavier Chang   2024-07-02  3069  			interrupts = <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH 0>;
620014904e31a2 Xavier Chang   2024-07-02  3070  			#mbox-cells = <2>;
620014904e31a2 Xavier Chang   2024-07-02  3071  			iommus = <&mm_smmu 183>;
620014904e31a2 Xavier Chang   2024-07-02  3072  		};
620014904e31a2 Xavier Chang   2024-07-02  3073  
d64301076e1f02 Yong Wu        2024-02-29  3074  		mm_smmu: iommu@30800000 {
d64301076e1f02 Yong Wu        2024-02-29  3075  			compatible = "mediatek,mt8196-mm-smmu", "arm,smmu-v3";
d64301076e1f02 Yong Wu        2024-02-29  3076  			reg = <0 0x30800000 0 0x1e0000>;
d64301076e1f02 Yong Wu        2024-02-29  3077  			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING 0>;
d64301076e1f02 Yong Wu        2024-02-29  3078  			interrupt-names = "combined";
d64301076e1f02 Yong Wu        2024-02-29  3079  			#iommu-cells = <1>;
d64301076e1f02 Yong Wu        2024-02-29  3080  		};
d64301076e1f02 Yong Wu        2024-02-29  3081  
5ea44a544d5f55 Yong Wu        2024-02-04  3082  		disp_ssc0_smi_2x1_sub_comm: smi-comm@30a30000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3083  			compatible = "mediatek,mt8196-smi-common";
5ea44a544d5f55 Yong Wu        2024-02-04  3084  			reg = <0 0x30a30000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3085  			mediatek,common-id = <3>;
5ea44a544d5f55 Yong Wu        2024-02-04  3086  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3087  			mediatek,skip-rpm-cb;
5ea44a544d5f55 Yong Wu        2024-02-04  3088  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3089  
5ea44a544d5f55 Yong Wu        2024-02-04  3090  		disp_ssc1_smi_2x1_sub_comm: smi-comm@30a31000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3091  			compatible = "mediatek,mt8196-smi-common";
5ea44a544d5f55 Yong Wu        2024-02-04  3092  			reg = <0 0x30a31000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3093  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3094  			mediatek,common-id = <4>;
5ea44a544d5f55 Yong Wu        2024-02-04  3095  			mediatek,skip-rpm-cb;
5ea44a544d5f55 Yong Wu        2024-02-04  3096  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3097  
5ea44a544d5f55 Yong Wu        2024-02-04  3098  		mdp_ssc4_smi_2x1_sub_comm: smi-comm@30a32000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3099  			compatible = "mediatek,mt8196-smi-common";
5ea44a544d5f55 Yong Wu        2024-02-04  3100  			reg = <0 0x30a32000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3101  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3102  			mediatek,common-id = <5>;
5ea44a544d5f55 Yong Wu        2024-02-04  3103  			mediatek,skip-rpm-cb;
5ea44a544d5f55 Yong Wu        2024-02-04  3104  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3105  
5ea44a544d5f55 Yong Wu        2024-02-04  3106  		mdp_ssc5_smi_2x1_sub_comm: smi-comm@30a33000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3107  			compatible = "mediatek,mt8196-smi-common";
5ea44a544d5f55 Yong Wu        2024-02-04  3108  			reg = <0 0x30a33000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3109  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MM_INFRA1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3110  			mediatek,common-id = <6>;
5ea44a544d5f55 Yong Wu        2024-02-04  3111  			mediatek,skip-rpm-cb;
5ea44a544d5f55 Yong Wu        2024-02-04  3112  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3113  
57436b1dbadb65 Jjian Zhou     2024-04-01  3114  		vcp: vcp@31800000 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3115  			compatible = "mediatek,vcp";
57436b1dbadb65 Jjian Zhou     2024-04-01  3116  			reg = <0 0x31800000 0 0x60000>, /* sram */
57436b1dbadb65 Jjian Zhou     2024-04-01  3117  			      <0 0x31a04000 0 0xa000>, /* cfg */
57436b1dbadb65 Jjian Zhou     2024-04-01  3118  			      <0 0x31bd0000 0 0x1000>, /* cfg core */
57436b1dbadb65 Jjian Zhou     2024-04-01  3119  			      <0 0x31b80000 0 0x50000>, /* mbox base */
57436b1dbadb65 Jjian Zhou     2024-04-01  3120  			      <0 0x31a70020 0 0x100>, /* mbox init */
57436b1dbadb65 Jjian Zhou     2024-04-01  3121  			      <0 0x1c00091c 0 0x4>; /* vcp rdy */
57436b1dbadb65 Jjian Zhou     2024-04-01  3122  			reg-names = "sram",
57436b1dbadb65 Jjian Zhou     2024-04-01  3123  				    "cfg",
57436b1dbadb65 Jjian Zhou     2024-04-01  3124  				    "cfg_core",
57436b1dbadb65 Jjian Zhou     2024-04-01  3125  				    "mbox_base",
57436b1dbadb65 Jjian Zhou     2024-04-01  3126  				    "mbox_init",
57436b1dbadb65 Jjian Zhou     2024-04-01  3127  				    "vcp_vlp_ao_rsvd7";
57436b1dbadb65 Jjian Zhou     2024-04-01  3128  
57436b1dbadb65 Jjian Zhou     2024-04-01  3129  			interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>,
57436b1dbadb65 Jjian Zhou     2024-04-01  3130  				     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>,
57436b1dbadb65 Jjian Zhou     2024-04-01  3131  				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH 0>,
57436b1dbadb65 Jjian Zhou     2024-04-01  3132  				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>,
57436b1dbadb65 Jjian Zhou     2024-04-01  3133  				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH 0>,
57436b1dbadb65 Jjian Zhou     2024-04-01  3134  				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3135  			interrupt-names = "wdt",
57436b1dbadb65 Jjian Zhou     2024-04-01  3136  					  "mbox0",
57436b1dbadb65 Jjian Zhou     2024-04-01  3137  					  "mbox1",
57436b1dbadb65 Jjian Zhou     2024-04-01  3138  					  "mbox2",
57436b1dbadb65 Jjian Zhou     2024-04-01  3139  					  "mbox3",
57436b1dbadb65 Jjian Zhou     2024-04-01  3140  					  "mbox4";
57436b1dbadb65 Jjian Zhou     2024-04-01  3141  
57436b1dbadb65 Jjian Zhou     2024-04-01  3142  			power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3143  			iommus = <&mm_smmu 160>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3144  			memory-region = <&vcp_resv_mem>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3145  
57436b1dbadb65 Jjian Zhou     2024-04-01  3146  			vcp-mem-tbl = <0 0x1a00000>, /* VCP_RTOS_MEM_ID 26MB */
57436b1dbadb65 Jjian Zhou     2024-04-01  3147  				      <1 0x30000>, /* VDEC_MEM_ID 192KB */
57436b1dbadb65 Jjian Zhou     2024-04-01  3148  				      <2 0x12000>, /* VENC_MEM_ID 72KB */
57436b1dbadb65 Jjian Zhou     2024-04-01  3149  				      <3 0x1000>; /* LOGGER 4KB*/
57436b1dbadb65 Jjian Zhou     2024-04-01  3150  
57436b1dbadb65 Jjian Zhou     2024-04-01  3151  			vcp@0 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3152  				compatible = "mediatek,vcp-core";
57436b1dbadb65 Jjian Zhou     2024-04-01  3153  				twohart = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3154  				sram-offset = <0x0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3155  			};
57436b1dbadb65 Jjian Zhou     2024-04-01  3156  
57436b1dbadb65 Jjian Zhou     2024-04-01  3157  			vcp@31000 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3158  				compatible = "mediatek,mmup-core";
57436b1dbadb65 Jjian Zhou     2024-04-01  3159  				twohart = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3160  				sram-offset = <0x031000>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3161  			};
57436b1dbadb65 Jjian Zhou     2024-04-01  3162  
57436b1dbadb65 Jjian Zhou     2024-04-01  3163  			send_table: mtk-send-table {
57436b1dbadb65 Jjian Zhou     2024-04-01  3164  				mbox0-0 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3165  					mbox-id = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3166  					chan-id = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3167  					msg-size = <18>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3168  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3169  				mbox1-15 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3170  					mbox-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3171  					chan-id = <15>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3172  					msg-size = <8>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3173  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3174  				mbox1-16 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3175  					mbox-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3176  					chan-id = <16>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3177  					msg-size = <18>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3178  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3179  				mbox1-9 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3180  					mbox-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3181  					chan-id = <9>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3182  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3183  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3184  				mbox2-11 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3185  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3186  					chan-id = <11>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3187  					msg-size = <18>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3188  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3189  				mbox2-2 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3190  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3191  					chan-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3192  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3193  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3194  				mbox2-3 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3195  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3196  					chan-id = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3197  					msg-size = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3198  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3199  				mbox2-32 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3200  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3201  					chan-id = <32>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3202  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3203  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3204  				mbox3-33 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3205  					mbox-id = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3206  					chan-id = <33>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3207  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3208  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3209  				mbox3-13 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3210  					mbox-id = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3211  					chan-id = <13>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3212  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3213  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3214  				mbox3-35 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3215  					mbox-id = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3216  					chan-id = <35>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3217  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3218  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3219  				mbox4-20 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3220  					mbox-id = <4>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3221  					chan-id = <20>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3222  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3223  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3224  				mbox4-21 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3225  					mbox-id = <4>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3226  					chan-id = <21>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3227  					msg-size = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3228  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3229  				mbox4-23 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3230  					mbox-id = <4>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3231  					chan-id = <23>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3232  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3233  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3234  			};
57436b1dbadb65 Jjian Zhou     2024-04-01  3235  
57436b1dbadb65 Jjian Zhou     2024-04-01  3236  			recv_table: mtk-recv-table {
57436b1dbadb65 Jjian Zhou     2024-04-01  3237  				mbox0-1 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3238  					mbox-id = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3239  					chan-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3240  					msg-size = <18>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3241  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3242  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3243  				mbox1-15 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3244  					mbox-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3245  					chan-id = <15>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3246  					msg-size = <8>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3247  					recv-opt = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3248  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3249  				mbox1-17 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3250  					mbox-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3251  					chan-id = <17>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3252  					msg-size = <18>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3253  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3254  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3255  				mbox1-10 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3256  					mbox-id = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3257  					chan-id = <10>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3258  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3259  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3260  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3261  				mbox2-12 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3262  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3263  					chan-id = <12>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3264  					msg-size = <18>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3265  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3266  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3267  				mbox2-5 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3268  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3269  					chan-id = <5>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3270  					msg-size = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3271  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3272  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3273  				mbox2-2 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3274  					mbox-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3275  					chan-id = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3276  					msg-size = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3277  					recv-opt = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3278  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3279  				mbox3-34 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3280  					mbox-id = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3281  					chan-id = <34>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3282  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3283  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3284  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3285  				mbox3-14 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3286  					mbox-id = <3>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3287  					chan-id = <14>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3288  					msg-size = <2>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3289  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3290  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3291  				mbox4-26 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3292  					mbox-id = <4>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3293  					chan-id = <26>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3294  					msg-size = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3295  					recv-opt = <0>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3296  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3297  				mbox4-20 {
57436b1dbadb65 Jjian Zhou     2024-04-01  3298  					mbox-id = <4>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3299  					chan-id = <20>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3300  					msg-size = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3301  					recv-opt = <1>;
57436b1dbadb65 Jjian Zhou     2024-04-01  3302  				};
57436b1dbadb65 Jjian Zhou     2024-04-01  3303  			};
57436b1dbadb65 Jjian Zhou     2024-04-01  3304  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3305  
3a88be54312101 Xavier Chang   2024-01-08  3306  		mminfra_hwv: syscon@31a80000 {
3a88be54312101 Xavier Chang   2024-01-08  3307  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  3308  			compatible = "mediatek,mt8196-mminfra-hwv", "mediatek,mt8196-mminfra_hwv", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3309  			reg = <0 0x31a80000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3310  		};
3a88be54312101 Xavier Chang   2024-01-08  3311  
b9408b7224ce87 Runyang Chen   2024-03-26  3312  		devapc_mmup: devapc@31ad5000 {
b9408b7224ce87 Runyang Chen   2024-03-26  3313  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  3314  			reg = <0 0x31ad5000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  3315  			vio-idx-num = <71>;
b9408b7224ce87 Runyang Chen   2024-03-26  3316  			interrupts = <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  3317  		};
b9408b7224ce87 Runyang Chen   2024-03-26  3318  
3a88be54312101 Xavier Chang   2024-01-08  3319  		mm_hwv: syscon@31b00000 {
3a88be54312101 Xavier Chang   2024-01-08  3320  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  3321  			compatible = "mediatek,mt8196-mm-hwv", "mediatek,mt8196-mm_hwv", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3322  			reg = <0 0x31b00000 0 0x3000>;
3a88be54312101 Xavier Chang   2024-01-08  3323  		};
3a88be54312101 Xavier Chang   2024-01-08  3324  
3a88be54312101 Xavier Chang   2024-01-08  3325  		hfrpsys: power-controller@31b50000 {
3a88be54312101 Xavier Chang   2024-01-08  3326  			compatible = "mediatek,mt8196-hfrpsys-hwv", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3327  			reg = <0 0x31b50000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3328  			#power-domain-cells = <1>;
bda1d16dc49f26 Guangjie Song  2025-01-16  3329  			clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_DISP_VDISP_AO_CONFIG_DISP>,
bda1d16dc49f26 Guangjie Song  2025-01-16  3330  				 <&disp_vdisp_ao_config_clk CLK_MM_V_DISP_DPC_DISP>;
bda1d16dc49f26 Guangjie Song  2025-01-16  3331  			clock-names = "disp_ao_config", "disp_dpc";
3a88be54312101 Xavier Chang   2024-01-08  3332  			mmpc = <&hfrpsys>;
3a88be54312101 Xavier Chang   2024-01-08  3333  			mm-hw-ccf-regmap = <&mm_hwv>;
3a88be54312101 Xavier Chang   2024-01-08  3334  			mminfra-hwv-regmap = <&mminfra_hwv>;
bda1d16dc49f26 Guangjie Song  2025-01-16  3335  			disp-vcore-supply = <&vdisp>;
a2f778a6f2805b Yunfei Dong    2024-12-23  3336  			vde-vcore0-supply = <&vdec_vcore>;
3a88be54312101 Xavier Chang   2024-01-08  3337  		};
3a88be54312101 Xavier Chang   2024-01-08  3338  
3a88be54312101 Xavier Chang   2024-01-08  3339  		dispsys_config_clk: syscon@32000000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3340  			compatible = "mediatek,mt8196-dispsys0", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3341  			reg = <0 0x32000000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3342  			mm-hw-ccf-regmap = <&mm_hwv>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3343  			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3344  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
3a88be54312101 Xavier Chang   2024-01-08  3345  			#clock-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3346  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3347  			async {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3348  				clocks = <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC0_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3349  					 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC1_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3350  					 <&dispsys_config_clk CLK_MM_DISP_DLI_ASYNC8_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3351  					 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC1_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3352  					 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC2_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3353  					 <&dispsys_config_clk CLK_MM_DISP_DLO_ASYNC3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3354  			};
64b149becb1a40 Sunny.Shen     2024-06-24  3355  
64b149becb1a40 Sunny.Shen     2024-06-24  3356  			top {
64b149becb1a40 Sunny.Shen     2024-06-24  3357  				clocks = <&dispsys_config_clk CLK_MM_CONFIG_DISP>;
64b149becb1a40 Sunny.Shen     2024-06-24  3358  			};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3359  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3360  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3361  		disp0_mutex: mutex@32020000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3362  			compatible = "mediatek,mt8196-disp-mutex";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3363  			reg = <0 0x32020000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3364  			clocks = <&dispsys_config_clk CLK_MM_DISP_MUTEX0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3365  			mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3366  					      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
3a88be54312101 Xavier Chang   2024-01-08  3367  		};
3a88be54312101 Xavier Chang   2024-01-08  3368  
811d357337456b Sunny.Shen     2024-06-24  3369  		disp_ccorr0: disp-ccorr@32090000 {
811d357337456b Sunny.Shen     2024-06-24  3370  			compatible = "mediatek,mt8196-disp-ccorr";
811d357337456b Sunny.Shen     2024-06-24  3371  			reg = <0 0x32090000 0 0x1000>;
811d357337456b Sunny.Shen     2024-06-24  3372  			clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR0_PQ>;
811d357337456b Sunny.Shen     2024-06-24  3373  		};
811d357337456b Sunny.Shen     2024-06-24  3374  
811d357337456b Sunny.Shen     2024-06-24  3375  		disp_ccorr1: disp-ccorr@320a0000 {
811d357337456b Sunny.Shen     2024-06-24  3376  			compatible = "mediatek,mt8196-disp-ccorr";
811d357337456b Sunny.Shen     2024-06-24  3377  			reg = <0 0x320a0000 0 0x1000>;
811d357337456b Sunny.Shen     2024-06-24  3378  			clocks = <&dispsys_config_clk CLK_MM_DISP_CCORR1_PQ>;
811d357337456b Sunny.Shen     2024-06-24  3379  		};
811d357337456b Sunny.Shen     2024-06-24  3380  
811d357337456b Sunny.Shen     2024-06-24  3381  		disp_dither0: disp-dither@32110000 {
811d357337456b Sunny.Shen     2024-06-24  3382  			compatible = "mediatek,mt8196-disp-dither",
811d357337456b Sunny.Shen     2024-06-24  3383  				     "mediatek,mt8183-disp-dither";
811d357337456b Sunny.Shen     2024-06-24  3384  			reg = <0 0x32110000 0 0x1000>;
811d357337456b Sunny.Shen     2024-06-24  3385  			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
811d357337456b Sunny.Shen     2024-06-24  3386  			clocks = <&dispsys_config_clk CLK_MM_DISP_DITHER0_PQ>;
811d357337456b Sunny.Shen     2024-06-24  3387  		};
811d357337456b Sunny.Shen     2024-06-24  3388  
811d357337456b Sunny.Shen     2024-06-24  3389  		disp_gamma0: disp-gamma@32130000 {
811d357337456b Sunny.Shen     2024-06-24  3390  			compatible = "mediatek,mt8196-disp-gamma",
811d357337456b Sunny.Shen     2024-06-24  3391  				     "mediatek,mt8195-disp-gamma";
811d357337456b Sunny.Shen     2024-06-24  3392  			reg = <0 0x32130000 0 0x1000>;
811d357337456b Sunny.Shen     2024-06-24  3393  			clocks = <&dispsys_config_clk CLK_MM_DISP_GAMMA0_PQ>;
811d357337456b Sunny.Shen     2024-06-24  3394  		};
811d357337456b Sunny.Shen     2024-06-24  3395  
811d357337456b Sunny.Shen     2024-06-24  3396  		disp_tdshp0: disp-tdshp@321e0000 {
811d357337456b Sunny.Shen     2024-06-24  3397  			compatible = "mediatek,mt8196-disp-tdshp";
811d357337456b Sunny.Shen     2024-06-24  3398  			reg = <0 0x321e0000 0 0x1000>;
811d357337456b Sunny.Shen     2024-06-24  3399  			clocks = <&dispsys_config_clk CLK_MM_DISP_TDSHP0_PQ>;
811d357337456b Sunny.Shen     2024-06-24  3400  		};
811d357337456b Sunny.Shen     2024-06-24  3401  
64b149becb1a40 Sunny.Shen     2024-06-24  3402  		disp_postmask0: postmask@32180000 {
64b149becb1a40 Sunny.Shen     2024-06-24  3403  			compatible = "mediatek,mt8196-disp-postmask",
64b149becb1a40 Sunny.Shen     2024-06-24  3404  				     "mediatek,mt8192-disp-postmask";
64b149becb1a40 Sunny.Shen     2024-06-24  3405  			reg = <0 0x32180000 0 0x1000>;
64b149becb1a40 Sunny.Shen     2024-06-24  3406  			clocks = <&dispsys_config_clk CLK_MM_DISP_POSTMASK0_DISP>;
64b149becb1a40 Sunny.Shen     2024-06-24  3407  		};
64b149becb1a40 Sunny.Shen     2024-06-24  3408  
64b149becb1a40 Sunny.Shen     2024-06-24  3409  		disp_mdp_rsz0: mdp-rsz@321a0000 {
64b149becb1a40 Sunny.Shen     2024-06-24  3410  			compatible = "mediatek,mt8196-disp-mdp-rsz";
64b149becb1a40 Sunny.Shen     2024-06-24  3411  			reg = <0 0x321a0000 0 0x1000>;
64b149becb1a40 Sunny.Shen     2024-06-24  3412  			clocks = <&dispsys_config_clk CLK_MM_MDP_RSZ0_DISP>;
64b149becb1a40 Sunny.Shen     2024-06-24  3413  		};
64b149becb1a40 Sunny.Shen     2024-06-24  3414  
5ea44a544d5f55 Yong Wu        2024-02-04  3415  		smi_larb32: larb@32240000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3416  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  3417  			reg = <0 0x32240000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3418  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS0_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  3419  			clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  3420  				 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  3421  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  3422  			mediatek,smi = <&smi_disp_dram_sub_comm1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3423  			mediatek,larb-id = <32>;
5ea44a544d5f55 Yong Wu        2024-02-04  3424  			larb-port-real-time-type = <1 1 1 1 0 0 0 0 1 0>;
5ea44a544d5f55 Yong Wu        2024-02-04  3425  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3426  
3a88be54312101 Xavier Chang   2024-01-08  3427  		dispsys1_config_clk: syscon@32400000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3428  			compatible = "mediatek,mt8196-dispsys1", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3429  			reg = <0 0x32400000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3430  			mm-hw-ccf-regmap = <&mm_hwv>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3431  			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3432  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
3a88be54312101 Xavier Chang   2024-01-08  3433  			#clock-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3434  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3435  			async {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3436  				clocks = <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC21_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3437  					 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC22_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3438  					 <&dispsys1_config_clk CLK_MM1_DISP_DLI_ASYNC23_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3439  			};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3440  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3441  			top {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3442  				clocks = <&dispsys1_config_clk CLK_MM1_DISPSYS1_CONFIG_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3443  				clock-names = "dispsys1_config";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3444  			};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3445  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3446  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3447  		disp1_mutex: mutex@32420000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3448  			compatible = "mediatek,mt8196-disp-mutex";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3449  			reg = <0 0x32420000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3450  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_MUTEX0_DISP>;
3a88be54312101 Xavier Chang   2024-01-08  3451  		};
3a88be54312101 Xavier Chang   2024-01-08  3452  
3eb254258f2631 Jason-jh Lin   2025-01-16  3453  		dp_intf0: dp-intf@32430000 {
3eb254258f2631 Jason-jh Lin   2025-01-16  3454  			compatible = "mediatek,mt8196-dp-intf";
3eb254258f2631 Jason-jh Lin   2025-01-16  3455  			reg = <0 0x32430000 0 0x1000>;
3eb254258f2631 Jason-jh Lin   2025-01-16  3456  			interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>;
3eb254258f2631 Jason-jh Lin   2025-01-16  3457  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF0>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3458  				 <&dispsys1_config_clk CLK_MM1_MOD4>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3459  				 <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3460  				 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D4>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3461  				 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D8>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3462  				 <&cksys_gp2_clk CLK_CK2_TVDPLL1_D16>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3463  				 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL1>,
3eb254258f2631 Jason-jh Lin   2025-01-16  3464  				 <&cksys_clk CLK_CK_TCK_26M_MX9>;
3eb254258f2631 Jason-jh Lin   2025-01-16  3465  			clock-names = "hf_fmm_ck",
3eb254258f2631 Jason-jh Lin   2025-01-16  3466  				      "hf_fdp_ck",
3eb254258f2631 Jason-jh Lin   2025-01-16  3467  				      "mux_dp",
3eb254258f2631 Jason-jh Lin   2025-01-16  3468  				      "tvdpll_d4",
3eb254258f2631 Jason-jh Lin   2025-01-16  3469  				      "tvdpll_d8",
3eb254258f2631 Jason-jh Lin   2025-01-16  3470  				      "tvdpll_d16",
3eb254258f2631 Jason-jh Lin   2025-01-16  3471  				      "dpi_ck",
3eb254258f2631 Jason-jh Lin   2025-01-16  3472  				      "dpi_26m";
3eb254258f2631 Jason-jh Lin   2025-01-16  3473  			num = <0>;
3eb254258f2631 Jason-jh Lin   2025-01-16  3474  			phys = <&dp_tx>;
3eb254258f2631 Jason-jh Lin   2025-01-16  3475  			phy-names = "dp_tx";
3eb254258f2631 Jason-jh Lin   2025-01-16  3476  		};
3eb254258f2631 Jason-jh Lin   2025-01-16  3477  
ebbc0e1103cfde Mac Shen       2024-06-27  3478  		dp_intf1: dp-intf@32440000 {
ebbc0e1103cfde Mac Shen       2024-06-27  3479  			compatible = "mediatek,mt8196-dp-intf";
ebbc0e1103cfde Mac Shen       2024-06-27  3480  			reg = <0 0x32440000 0 0x1000>;
ebbc0e1103cfde Mac Shen       2024-06-27  3481  			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
ebbc0e1103cfde Mac Shen       2024-06-27  3482  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_DP_INTF1>,
ebbc0e1103cfde Mac Shen       2024-06-27  3483  				 <&dispsys1_config_clk CLK_MM1_MOD5>,
ebbc0e1103cfde Mac Shen       2024-06-27  3484  				 <&cksys_gp2_clk CLK_CK2_DP1_SEL>,
ebbc0e1103cfde Mac Shen       2024-06-27  3485  				 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D4>,
ebbc0e1103cfde Mac Shen       2024-06-27  3486  				 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D8>,
ebbc0e1103cfde Mac Shen       2024-06-27  3487  				 <&cksys_gp2_clk CLK_CK2_TVDPLL2_D16>,
ebbc0e1103cfde Mac Shen       2024-06-27  3488  				 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL2>,
ebbc0e1103cfde Mac Shen       2024-06-27  3489  				 <&cksys_clk CLK_CK_TCK_26M_MX9>;
ebbc0e1103cfde Mac Shen       2024-06-27  3490  			clock-names = "hf_fmm_ck",
ebbc0e1103cfde Mac Shen       2024-06-27  3491  				      "hf_fdp_ck",
ebbc0e1103cfde Mac Shen       2024-06-27  3492  				      "mux_dp",
ebbc0e1103cfde Mac Shen       2024-06-27  3493  				      "tvdpll_d4",
ebbc0e1103cfde Mac Shen       2024-06-27  3494  				      "tvdpll_d8",
ebbc0e1103cfde Mac Shen       2024-06-27  3495  				      "tvdpll_d16",
ebbc0e1103cfde Mac Shen       2024-06-27  3496  				      "dpi_ck",
ebbc0e1103cfde Mac Shen       2024-06-27  3497  				      "dpi_26m";
ebbc0e1103cfde Mac Shen       2024-06-27  3498  			num = <1>;
ebbc0e1103cfde Mac Shen       2024-06-27  3499  			no-next-bridge;
ebbc0e1103cfde Mac Shen       2024-06-27  3500  			phys = <&dp_tx>;
ebbc0e1103cfde Mac Shen       2024-06-27  3501  			phy-names = "dp_tx";
ebbc0e1103cfde Mac Shen       2024-06-27  3502  			status = "disabled";
ebbc0e1103cfde Mac Shen       2024-06-27  3503  		};
ebbc0e1103cfde Mac Shen       2024-06-27  3504  
13ecc998839331 Jason-jh Lin   2025-01-17  3505  		disp_dsc0: disp-dsc0-wrap0@32450000 {
13ecc998839331 Jason-jh Lin   2025-01-17  3506  			compatible = "mediatek,mt8196-disp-dsc";
13ecc998839331 Jason-jh Lin   2025-01-17  3507  			reg = <0 0x32450000 0 0x1000>;
13ecc998839331 Jason-jh Lin   2025-01-17  3508  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP0>;
13ecc998839331 Jason-jh Lin   2025-01-17  3509  		};
13ecc998839331 Jason-jh Lin   2025-01-17  3510  
13ecc998839331 Jason-jh Lin   2025-01-17  3511  		disp_dsc1: disp-dsc1-wrap1@32460000 {
13ecc998839331 Jason-jh Lin   2025-01-17  3512  			compatible = "mediatek,mt8196-disp-dsc";
13ecc998839331 Jason-jh Lin   2025-01-17  3513  			reg = <0 0x32460000 0 0x1000>;
13ecc998839331 Jason-jh Lin   2025-01-17  3514  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSC_WRAP1>;
13ecc998839331 Jason-jh Lin   2025-01-17  3515  		};
13ecc998839331 Jason-jh Lin   2025-01-17  3516  
9a5b02d04139ce Shuijing Li    2024-07-17  3517  		dsi0: dsi@32490000 {
9a5b02d04139ce Shuijing Li    2024-07-17  3518  			compatible = "mediatek,mt8196-dsi";
9a5b02d04139ce Shuijing Li    2024-07-17  3519  			reg = <0 0x32490000 0 0x1000>;
9a5b02d04139ce Shuijing Li    2024-07-17  3520  			interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH 0>;
9a5b02d04139ce Shuijing Li    2024-07-17  3521  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_DSI0_DISP>,
9a5b02d04139ce Shuijing Li    2024-07-17  3522  				 <&dispsys1_config_clk CLK_MM1_MOD1_DISP>,
9a5b02d04139ce Shuijing Li    2024-07-17  3523  				 <&mipi_tx_config0>;
9a5b02d04139ce Shuijing Li    2024-07-17  3524  			clock-names = "engine", "digital", "hs";
9a5b02d04139ce Shuijing Li    2024-07-17  3525  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DSI_PHY0>;
9a5b02d04139ce Shuijing Li    2024-07-17  3526  			phys = <&mipi_tx_config0>;
9a5b02d04139ce Shuijing Li    2024-07-17  3527  			phy-names = "dphy";
9a5b02d04139ce Shuijing Li    2024-07-17  3528  			status = "disabled";
9a5b02d04139ce Shuijing Li    2024-07-17  3529  		};
9a5b02d04139ce Shuijing Li    2024-07-17  3530  
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3531  		disp_dvo0: disp-dvo0@324c0000 {
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3532  			compatible = "mediatek,mt8196-edp-dvo";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3533  			reg = <0 0x324c0000 0 0x1000>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3534  			interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3535  			clocks = <&dispsys1_config_clk CLK_MM1_DISP_DVO0_DISP>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3536  				 <&cksys_gp2_clk CLK_CK2_DVO_SEL>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3537  				 <&apmixedsys_gp2_clk CLK_APMIXED2_TVDPLL3>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3538  				 <&dispsys1_config_clk CLK_MM1_MOD6>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3539  			clock-names = "engine",
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3540  				      "pixel",
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3541  				      "pll",
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3542  				      "hf_fdvo_clk";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3543  			status = "disabled";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3544  		};
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  3545  
5ea44a544d5f55 Yong Wu        2024-02-04  3546  		smi_larb33: larb@32600000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3547  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  3548  			reg = <0 0x32600000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3549  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DIS1_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  3550  			clocks = <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  3551  				 <&dispsys1_config_clk CLK_MM1_SMI_LARB0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  3552  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  3553  			mediatek,smi = <&smi_mdp_dram_sub_comm2>;
5ea44a544d5f55 Yong Wu        2024-02-04  3554  			mediatek,larb-id = <33>;
5ea44a544d5f55 Yong Wu        2024-02-04  3555  			larb-port-real-time-type = <0 1 1 1 0 0 0 1 0 0 0 0 0 0 0 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3556  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3557  
3a88be54312101 Xavier Chang   2024-01-08  3558  		ovlsys_config_clk: syscon@32800000 {
fd00cab3fe36e4 Xavier Chang   2025-01-09  3559  			compatible = "mediatek,mt8196-ovlsys0", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3560  			reg = <0 0x32800000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3561  			mm-hw-ccf-regmap = <&mm_hwv>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3562  			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>, <&gce0 1 CMDQ_THR_PRIO_4>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3563  				 <&gce0 8 CMDQ_THR_PRIO_4>, <&gce0 9 CMDQ_THR_PRIO_4>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3564  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
3a88be54312101 Xavier Chang   2024-01-08  3565  			#clock-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3566  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3567  			async {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3568  				clocks = <&ovlsys_config_clk CLK_OVL_DLO5_DISP>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3569  					 <&ovlsys_config_clk CLK_OVL_DLO6_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3570  			};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3571  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3572  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3573  		ovl0_mutex: mutex@32820000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3574  			compatible = "mediatek,mt8196-disp-mutex";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3575  			reg = <0 0x32820000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3576  			clocks = <&ovlsys_config_clk CLK_OVL_MUTEX0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3577  			mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT0>,
fe693c3f6e9a12 Nancy Lin      2024-03-23  3578  					      <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3579  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3580  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3581  		disp_ovl0_exdma2: dma-controller@32850000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3582  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3583  			reg = <0 0x32850000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3584  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA2_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3585  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3586  			mediatek,larb = <&smi_larb0>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3587  			iommus = <&mm_smmu 144>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3588  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3589  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3590  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3591  		disp_ovl0_exdma3: dma-controller@32860000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3592  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3593  			reg = <0 0x32860000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3594  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3595  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3596  			mediatek,larb = <&smi_larb1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3597  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3598  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3599  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3600  		disp_ovl0_exdma4: dma-controller@32870000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3601  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3602  			reg = <0 0x32870000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3603  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA4_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3604  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3605  			mediatek,larb = <&smi_larb20>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3606  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3607  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3608  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3609  		disp_ovl0_exdma5: dma-controller@32880000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3610  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3611  			reg = <0 0x32880000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3612  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA5_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3613  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3614  			mediatek,larb = <&smi_larb21>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3615  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3616  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3617  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3618  		disp_ovl0_exdma6: dma-controller@32890000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3619  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3620  			reg = <0 0x32890000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3621  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA6_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3622  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3623  			mediatek,larb = <&smi_larb1 SMMU_L1_P3_OVL_RDMA6>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3624  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3625  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3626  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3627  		disp_ovl0_exdma7: dma-controller@328a0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3628  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3629  			reg = <0 0x328a0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3630  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA7_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3631  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3632  			mediatek,larb = <&smi_larb0>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3633  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3634  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3635  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3636  		disp_ovl0_exdma8: dma-controller@328b0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3637  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3638  			reg = <0 0x328b0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3639  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA8_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3640  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3641  			mediatek,larb = <&smi_larb21>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3642  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3643  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3644  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3645  		disp_ovl0_exdma9: dma-controller@328c0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3646  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3647  			reg = <0 0x328c0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3648  			clocks = <&ovlsys_config_clk CLK_OVL_EXDMA9_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3649  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3650  			mediatek,larb = <&smi_larb20>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3651  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3652  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3653  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3654  		disp_ovl0_blender0: blender@328d0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3655  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3656  			reg = <0 0x328d0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3657  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3658  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3659  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3660  		disp_ovl0_blender1: blender@328e0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3661  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3662  			reg = <0 0x328e0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3663  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER1_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3664  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3665  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3666  		disp_ovl0_blender2: blender@328f0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3667  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3668  			reg = <0 0x328f0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3669  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER2_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3670  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3671  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3672  		disp_ovl0_blender3: blender@32900000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3673  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3674  			reg = <0 0x32900000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3675  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3676  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3677  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3678  		disp_ovl0_blender4: blender@32910000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3679  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3680  			reg = <0 0x32910000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3681  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER4_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3682  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3683  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3684  		disp_ovl0_blender5: blender@32920000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3685  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3686  			reg = <0 0x32920000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3687  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER5_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3688  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3689  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3690  		disp_ovl0_blender6: blender@32930000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3691  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3692  			reg = <0 0x32930000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3693  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER6_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3694  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3695  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3696  		disp_ovl0_blender7: blender@32940000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3697  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3698  			reg = <0 0x32940000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3699  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER7_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3700  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3701  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3702  		disp_ovl0_blender8: blender@32950000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3703  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3704  			reg = <0 0x32950000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3705  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER8_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3706  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3707  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3708  		disp_ovl0_blender9: blender@32960000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3709  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3710  			reg = <0 0x32960000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3711  			clocks = <&ovlsys_config_clk CLK_OVL_BLENDER9_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3712  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3713  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3714  		disp_ovl0_outproc0: outproc@32970000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3715  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3716  			clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3717  			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH 0>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3718  			reg = <0 0x32970000 0 0x1000>;
86aeba22de7abd Sunny.Shen     2024-09-11  3719  			mediatek,gce-events = <CMDQ_EVENT_OVL0_FRAME_DONE_SEL0>;
86aeba22de7abd Sunny.Shen     2024-09-11  3720  			mboxes = <&gce0 3 CMDQ_THR_PRIO_4>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3721  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3722  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3723  		disp_ovl0_outproc1: outproc@32980000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3724  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3725  			clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC1_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3726  			interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH 0>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3727  			reg = <0 0x32980000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3728  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3729  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3730  		disp_ovl0_outproc2: outproc@32990000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3731  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3732  			clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC2_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3733  			reg = <0 0x32990000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3734  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3735  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3736  		disp_ovl0_outproc3: outproc@329a0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3737  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3738  			clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3739  			reg = <0 0x329a0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3740  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3741  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3742  		disp_ovl0_outproc4: outproc@329b0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3743  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3744  			clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC4_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3745  			reg = <0 0x329b0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3746  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3747  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3748  		disp_ovl0_outproc5: outproc@329c0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3749  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3750  			clocks = <&ovlsys_config_clk CLK_OVL_OUTPROC5_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3751  			reg = <0 0x329c0000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3752  		};
3a88be54312101 Xavier Chang   2024-01-08  3753  
5ea44a544d5f55 Yong Wu        2024-02-04  3754  		smi_larb0: larb@32a60000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3755  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  3756  			reg = <0 0x32a60000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3757  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  3758  			clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  3759  				 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  3760  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  3761  			mediatek,smi = <&smi_disp_dram_sub_comm0>;
5ea44a544d5f55 Yong Wu        2024-02-04  3762  			mediatek,larb-id = <0>;
5ea44a544d5f55 Yong Wu        2024-02-04  3763  			larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3764  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3765  
5ea44a544d5f55 Yong Wu        2024-02-04  3766  		smi_larb1: larb@32a70000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3767  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  3768  			reg = <0 0x32a70000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3769  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  3770  			clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  3771  				 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  3772  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  3773  			mediatek,smi = <&smi_disp_dram_sub_comm1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3774  			mediatek,larb-id = <1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3775  			larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3776  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3777  
5ea44a544d5f55 Yong Wu        2024-02-04  3778  		smi_larb20: larb@32a80000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3779  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  3780  			reg = <0 0x32a80000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3781  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  3782  			clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  3783  				 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  3784  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  3785  			mediatek,smi = <&smi_mdp_dram_sub_comm2>;
5ea44a544d5f55 Yong Wu        2024-02-04  3786  			mediatek,larb-id = <20>;
5ea44a544d5f55 Yong Wu        2024-02-04  3787  			larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3788  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3789  
5ea44a544d5f55 Yong Wu        2024-02-04  3790  		smi_larb21: larb@32a90000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3791  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  3792  			reg = <0 0x32a90000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3793  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL0_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  3794  			clocks = <&ovlsys_config_clk CLK_OVL_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  3795  				 <&ovlsys_config_clk CLK_OVL_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  3796  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  3797  			mediatek,smi = <&smi_mdp_dram_sub_comm3>;
5ea44a544d5f55 Yong Wu        2024-02-04  3798  			mediatek,larb-id = <21>;
5ea44a544d5f55 Yong Wu        2024-02-04  3799  			larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3800  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3801  
3a88be54312101 Xavier Chang   2024-01-08  3802  		ovlsys1_config_clk: syscon@32c00000 {
fd00cab3fe36e4 Xavier Chang   2025-01-09  3803  			compatible = "mediatek,mt8196-ovlsys1", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  3804  			reg = <0 0x32c00000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  3805  			mm-hw-ccf-regmap = <&mm_hwv>;
4ca26b1cee2c39 Jason-jh Lin   2024-08-27  3806  			mboxes = <&gce0 2 CMDQ_THR_PRIO_4>, <&gce0 10 CMDQ_THR_PRIO_4>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3807  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
3a88be54312101 Xavier Chang   2024-01-08  3808  			#clock-cells = <1>;
5ea44a544d5f55 Yong Wu        2024-02-04  3809  
5ea44a544d5f55 Yong Wu        2024-02-04  3810  			async {
5ea44a544d5f55 Yong Wu        2024-02-04  3811  				clocks = <&ovlsys1_config_clk CLK_OVL_DLO5_DISP>,
5ea44a544d5f55 Yong Wu        2024-02-04  3812  					 <&ovlsys1_config_clk CLK_OVL_DLO6_DISP>;
5ea44a544d5f55 Yong Wu        2024-02-04  3813  			};
5ea44a544d5f55 Yong Wu        2024-02-04  3814  		};
5ea44a544d5f55 Yong Wu        2024-02-04  3815  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3816  		ovl1_mutex: mutex@32c20000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3817  			compatible = "mediatek,mt8196-disp-mutex";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3818  			reg = <0 0x32c20000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3819  			clocks = <&ovlsys1_config_clk CLK_OVL_MUTEX0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3820  			mediatek,gce-events = <CMDQ_EVENT_DISP1_STREAM_DONE_ENG_EVENT2>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3821  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3822  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3823  		disp_ovl1_exdma2: dma-controller@32c50000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3824  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3825  			reg = <0 0x32c50000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3826  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA2_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3827  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3828  			mediatek,larb = <&smi_larb34>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3829  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3830  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3831  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3832  		disp_ovl1_exdma3: dma-controller@32c60000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3833  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3834  			reg = <0 0x32c60000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3835  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3836  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3837  			mediatek,larb = <&smi_larb35>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3838  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3839  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3840  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3841  		disp_ovl1_exdma4: dma-controller@32c70000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3842  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3843  			reg = <0 0x32c70000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3844  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA4_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3845  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3846  			mediatek,larb = <&smi_larb36>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3847  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3848  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3849  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3850  		disp_ovl1_exdma5: dma-controller@32c80000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3851  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3852  			reg = <0 0x32c80000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3853  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA5_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3854  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3855  			mediatek,larb = <&smi_larb37>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3856  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3857  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3858  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3859  		disp_ovl1_exdma6: dma-controller@32c90000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3860  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3861  			reg = <0 0x32c90000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3862  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA6_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3863  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3864  			mediatek,larb = <&smi_larb35>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3865  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3866  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3867  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3868  		disp_ovl1_exdma7: dma-controller@32ca0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3869  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3870  			reg = <0 0x32ca0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3871  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA7_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3872  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3873  			mediatek,larb = <&smi_larb34>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3874  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3875  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3876  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3877  		disp_ovl1_exdma8: dma-controller@32cb0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3878  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3879  			reg = <0 0x32cb0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3880  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA8_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3881  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3882  			mediatek,larb = <&smi_larb37>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3883  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3884  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3885  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3886  		disp_ovl1_exdma9: dma-controller@32cc0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3887  			compatible = "mediatek,mt8196-exdma";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3888  			reg = <0 0x32cc0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3889  			clocks = <&ovlsys1_config_clk CLK_OVL_EXDMA9_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3890  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3891  			mediatek,larb = <&smi_larb36>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3892  			#dma-cells = <1>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3893  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3894  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3895  		disp_ovl1_blender0: blender@32cd0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3896  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3897  			reg = <0 0x32cd0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3898  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3899  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3900  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3901  		disp_ovl1_blender1: blender@32ce0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3902  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3903  			reg = <0 0x32ce0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3904  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER1_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3905  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3906  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3907  		disp_ovl1_blender2: blender@32cf0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3908  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3909  			reg = <0 0x32cf0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3910  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER2_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3911  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3912  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3913  		disp_ovl1_blender3: blender@32d00000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3914  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3915  			reg = <0 0x32d00000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3916  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3917  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3918  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3919  		disp_ovl1_blender4: blender@32d10000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3920  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3921  			reg = <0 0x32d10000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3922  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER4_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3923  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3924  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3925  		disp_ovl1_blender5: blender@32d20000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3926  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3927  			reg = <0 0x32d20000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3928  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER5_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3929  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3930  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3931  		disp_ovl1_blender6: blender@32d30000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3932  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3933  			reg = <0 0x32d30000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3934  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER6_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3935  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3936  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3937  		disp_ovl1_blender7: blender@32d40000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3938  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3939  			reg = <0 0x32d40000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3940  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER7_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3941  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3942  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3943  		disp_ovl1_blender8: blender@32d50000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3944  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3945  			reg = <0 0x32d50000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3946  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER8_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3947  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3948  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3949  		disp_ovl1_blender9: blender@32d60000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3950  			compatible = "mediatek,mt8196-blender";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3951  			reg = <0 0x32d60000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3952  			clocks = <&ovlsys1_config_clk CLK_OVL_BLENDER9_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3953  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3954  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3955  		disp_ovl1_outproc0: outproc@32d70000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3956  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3957  			clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC0_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3958  			interrupts = <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH 0>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3959  			reg = <0 0x32d70000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3960  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3961  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3962  		disp_ovl1_outproc1: outproc@32d80000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3963  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3964  			clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC1_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3965  			reg = <0 0x32d80000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3966  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3967  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3968  		disp_ovl1_outproc2: outproc@32d90000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3969  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3970  			clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC2_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3971  			reg = <0 0x32d90000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3972  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3973  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3974  		disp_ovl1_outproc3: outproc@32da0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3975  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3976  			clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC3_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3977  			reg = <0 0x32da0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3978  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3979  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3980  		disp_ovl1_outproc4: outproc@32db0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3981  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3982  			clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC4_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3983  			reg = <0 0x32db0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3984  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3985  
fe693c3f6e9a12 Nancy Lin      2024-03-23  3986  		disp_ovl1_outproc5: outproc@32dc0000 {
fe693c3f6e9a12 Nancy Lin      2024-03-23  3987  			compatible = "mediatek,mt8196-outproc";
fe693c3f6e9a12 Nancy Lin      2024-03-23  3988  			clocks = <&ovlsys1_config_clk CLK_OVL_OUTPROC5_DISP>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3989  			reg = <0 0x32dc0000 0 0x1000>;
fe693c3f6e9a12 Nancy Lin      2024-03-23  3990  		};
fe693c3f6e9a12 Nancy Lin      2024-03-23  3991  
5ea44a544d5f55 Yong Wu        2024-02-04  3992  		smi_larb34: larb@32e60000 {
5ea44a544d5f55 Yong Wu        2024-02-04  3993  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  3994  			reg = <0 0x32e60000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  3995  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  3996  			clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  3997  				 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  3998  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  3999  			mediatek,smi = <&smi_mdp_dram_sub_comm3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4000  			mediatek,larb-id = <34>;
5ea44a544d5f55 Yong Wu        2024-02-04  4001  			larb-port-real-time-type = <0 0 0 0 1 1 0 0 0 0 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4002  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4003  
5ea44a544d5f55 Yong Wu        2024-02-04  4004  		smi_larb35: larb@32e70000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4005  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4006  			reg = <0 0x32e70000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4007  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  4008  			clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4009  				 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4010  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4011  			mediatek,smi = <&smi_mdp_dram_sub_comm2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4012  			mediatek,larb-id = <35>;
5ea44a544d5f55 Yong Wu        2024-02-04  4013  			larb-port-real-time-type = <0 0 0 0 0 1 0 0 0 0 0 0 1 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4014  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4015  
5ea44a544d5f55 Yong Wu        2024-02-04  4016  		smi_larb36: larb@32e80000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4017  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4018  			reg = <0 0x32e80000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4019  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  4020  			clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4021  				 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4022  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4023  			mediatek,smi = <&smi_disp_dram_sub_comm1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4024  			mediatek,larb-id = <36>;
5ea44a544d5f55 Yong Wu        2024-02-04  4025  			larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4026  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4027  
5ea44a544d5f55 Yong Wu        2024-02-04  4028  		smi_larb37: larb@32e90000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4029  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4030  			reg = <0 0x32e90000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4031  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_OVL1_DORMANT>;
5ea44a544d5f55 Yong Wu        2024-02-04  4032  			clocks = <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4033  				 <&ovlsys1_config_clk CLK_OVL1_SMI_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4034  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4035  			mediatek,smi = <&smi_disp_dram_sub_comm0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4036  			mediatek,larb-id = <37>;
5ea44a544d5f55 Yong Wu        2024-02-04  4037  			larb-port-real-time-type = <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4038  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4039  
f5d71366577c8d Yunfei Dong    2024-07-11  4040  		video_codec: video@36000000 {
f5d71366577c8d Yunfei Dong    2024-07-11  4041  			compatible = "mediatek,mt8196-vcodec-dec";
f5d71366577c8d Yunfei Dong    2024-07-11  4042  			mediatek,vcp = <&vcp>;
f5d71366577c8d Yunfei Dong    2024-07-11  4043  			iommus = <&mm_smmu 177>;
f5d71366577c8d Yunfei Dong    2024-07-11  4044  			#address-cells = <2>;
f5d71366577c8d Yunfei Dong    2024-07-11  4045  			#size-cells = <2>;
f5d71366577c8d Yunfei Dong    2024-07-11  4046  			reg = <0 0x36000000 0 0x1000>,
f5d71366577c8d Yunfei Dong    2024-07-11  4047  				<0 0x36098000 0 0x1000>;
f5d71366577c8d Yunfei Dong    2024-07-11  4048  			ranges = <0 0 0 0x36000000 0 0x26000>;
f5d71366577c8d Yunfei Dong    2024-07-11  4049  
f5d71366577c8d Yunfei Dong    2024-07-11  4050  			video-codec@10000 {
f5d71366577c8d Yunfei Dong    2024-07-11  4051  				compatible = "mediatek,mtk-vcodec-lat";
f5d71366577c8d Yunfei Dong    2024-07-11  4052  				reg = <0 0x10000 0 0x800>;
f5d71366577c8d Yunfei Dong    2024-07-11  4053  				interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
f5d71366577c8d Yunfei Dong    2024-07-11  4054  				clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>,
f5d71366577c8d Yunfei Dong    2024-07-11  4055  					<&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
f5d71366577c8d Yunfei Dong    2024-07-11  4056  					<&vdec_soc_gcon_base_clk CLK_VDE1_LAT_CKEN>,
f5d71366577c8d Yunfei Dong    2024-07-11  4057  					<&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
f5d71366577c8d Yunfei Dong    2024-07-11  4058  				clock-names = "sel", "vdec", "lat", "top";
f5d71366577c8d Yunfei Dong    2024-07-11  4059  				assigned-clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>;
f5d71366577c8d Yunfei Dong    2024-07-11  4060  				assigned-clock-parents = <&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
f5d71366577c8d Yunfei Dong    2024-07-11  4061  				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
f5d71366577c8d Yunfei Dong    2024-07-11  4062  			};
f5d71366577c8d Yunfei Dong    2024-07-11  4063  
f5d71366577c8d Yunfei Dong    2024-07-11  4064  			video-codec@25000 {
f5d71366577c8d Yunfei Dong    2024-07-11  4065  				compatible = "mediatek,mtk-vcodec-core";
f5d71366577c8d Yunfei Dong    2024-07-11  4066  				reg = <0 0x25000 0 0x1000>;		/* VDEC_CORE_MISC */
f5d71366577c8d Yunfei Dong    2024-07-11  4067  				interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH 0>;
f5d71366577c8d Yunfei Dong    2024-07-11  4068  				clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>,
f5d71366577c8d Yunfei Dong    2024-07-11  4069  					<&vdec_gcon_base_clk CLK_VDE2_LAT_CKEN>,
f5d71366577c8d Yunfei Dong    2024-07-11  4070  					<&vdec_gcon_base_clk CLK_VDE2_VDEC_CKEN>,
f5d71366577c8d Yunfei Dong    2024-07-11  4071  					<&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
f5d71366577c8d Yunfei Dong    2024-07-11  4072  				clock-names = "sel", "vdec", "lat", "top";
f5d71366577c8d Yunfei Dong    2024-07-11  4073  				assigned-clocks = <&cksys_gp2_clk CLK_CK2_VDEC_SEL>;
f5d71366577c8d Yunfei Dong    2024-07-11  4074  				assigned-clock-parents = <&cksys_gp2_clk CLK_CK2_MAINPLL2_D4>;
f5d71366577c8d Yunfei Dong    2024-07-11  4075  				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
f5d71366577c8d Yunfei Dong    2024-07-11  4076  			};
f5d71366577c8d Yunfei Dong    2024-07-11  4077  		};
f5d71366577c8d Yunfei Dong    2024-07-11  4078  
5ea44a544d5f55 Yong Wu        2024-02-04  4079  		smi_larb5: larb@3600d000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4080  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4081  			reg = <0 0x3600d000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4082  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4083  			clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
5ea44a544d5f55 Yong Wu        2024-02-04  4084  				 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
5ea44a544d5f55 Yong Wu        2024-02-04  4085  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4086  			mediatek,smi = <&smi_disp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4087  			mediatek,larb-id = <5>;
5ea44a544d5f55 Yong Wu        2024-02-04  4088  			larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4089  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4090  
5ea44a544d5f55 Yong Wu        2024-02-04  4091  		smi_larb6: larb@3600e000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4092  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4093  			reg = <0 0x3600e000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4094  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4095  			clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
5ea44a544d5f55 Yong Wu        2024-02-04  4096  				 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
5ea44a544d5f55 Yong Wu        2024-02-04  4097  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4098  			mediatek,smi = <&smi_mdp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4099  			mediatek,larb-id = <6>;
5ea44a544d5f55 Yong Wu        2024-02-04  4100  			larb-port-real-time-type = <1 1 1>;
3a88be54312101 Xavier Chang   2024-01-08  4101  		};
3a88be54312101 Xavier Chang   2024-01-08  4102  
3a88be54312101 Xavier Chang   2024-01-08  4103  		vdec_soc_gcon_base_clk: syscon@3600f000 {
3a88be54312101 Xavier Chang   2024-01-08  4104  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  4105  			compatible = "mediatek,mt8196-vdecsys-soc", "mediatek,mt8196-vdecsys_soc", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4106  			reg = <0 0x3600f000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4107  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4108  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE0>;
3a88be54312101 Xavier Chang   2024-01-08  4109  		};
3a88be54312101 Xavier Chang   2024-01-08  4110  
5ea44a544d5f55 Yong Wu        2024-02-04  4111  		smi_larb4: larb@3602e000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4112  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4113  			reg = <0 0x3602e000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4114  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4115  			clocks = <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>,
5ea44a544d5f55 Yong Wu        2024-02-04  4116  				 <&vdec_soc_gcon_base_clk CLK_VDE1_VDEC_CKEN>;
5ea44a544d5f55 Yong Wu        2024-02-04  4117  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4118  			mediatek,smi = <&smi_mdp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4119  			mediatek,larb-id = <4>;
5ea44a544d5f55 Yong Wu        2024-02-04  4120  			larb-port-real-time-type = <1 1 1 1 1 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4121  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4122  
3a88be54312101 Xavier Chang   2024-01-08  4123  		vdec_gcon_base_clk: syscon@3602f000 {
3a88be54312101 Xavier Chang   2024-01-08  4124  			compatible = "mediatek,mt8196-vdecsys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4125  			reg = <0 0x3602f000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4126  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4127  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VDE1>;
3a88be54312101 Xavier Chang   2024-01-08  4128  		};
3a88be54312101 Xavier Chang   2024-01-08  4129  
3a88be54312101 Xavier Chang   2024-01-08  4130  		venc_gcon_clk: syscon@38000000 {
3a88be54312101 Xavier Chang   2024-01-08  4131  			compatible = "mediatek,mt8196-vencsys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4132  			reg = <0 0x38000000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4133  			mm-hw-ccf-regmap = <&mm_hwv>;
3a88be54312101 Xavier Chang   2024-01-08  4134  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4135  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
3a88be54312101 Xavier Chang   2024-01-08  4136  		};
3a88be54312101 Xavier Chang   2024-01-08  4137  
5ea44a544d5f55 Yong Wu        2024-02-04  4138  		smi_larb7: larb@38010000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4139  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4140  			reg = <0 0x38010000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4141  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4142  			clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4143  				 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4144  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4145  			mediatek,smi = <&smi_disp_venc_sub_comm0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4146  			mediatek,larb-id = <7>;
5ea44a544d5f55 Yong Wu        2024-02-04  4147  			larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4148  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4149  
9e44a48e129d11 Irui Wang      2024-07-19  4150  		venc: video-codec@38020000 {
9e44a48e129d11 Irui Wang      2024-07-19  4151  			compatible = "mediatek,mt8196-vcodec-enc";
9e44a48e129d11 Irui Wang      2024-07-19  4152  			reg = <0 0x38020000 0 0x6000>;
9e44a48e129d11 Irui Wang      2024-07-19  4153  			mediatek,vcp = <&vcp>;
9e44a48e129d11 Irui Wang      2024-07-19  4154  			iommus = <&mm_smmu 176>;
9e44a48e129d11 Irui Wang      2024-07-19  4155  			interrupts = <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH 0>;
9e44a48e129d11 Irui Wang      2024-07-19  4156  			clocks = <&venc_gcon_clk CLK_VEN1_CKE1_VENC>;
9e44a48e129d11 Irui Wang      2024-07-19  4157  			clock-names = "venc_sel";
9e44a48e129d11 Irui Wang      2024-07-19  4158  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
9e44a48e129d11 Irui Wang      2024-07-19  4159  		};
9e44a48e129d11 Irui Wang      2024-07-19  4160  
5ea44a544d5f55 Yong Wu        2024-02-04  4161  		smi_disp_venc_sub_comm0: smi-sub-comm@38070000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4162  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4163  			reg = <0 0x38070000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4164  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4165  			clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4166  				 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4167  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4168  			mediatek,smi = <&smi_disp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4169  			mediatek,common-id = <15>;
5ea44a544d5f55 Yong Wu        2024-02-04  4170  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4171  
5ea44a544d5f55 Yong Wu        2024-02-04  4172  		smi_larb41: larb@38090000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4173  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4174  			reg = <0 0x38090000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4175  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4176  			clocks = <&venc_gcon_clk CLK_VEN1_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4177  				 <&venc_gcon_clk CLK_VEN1_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4178  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4179  			mediatek,smi = <&smi_disp_venc_sub_comm0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4180  			mediatek,larb-id = <41>;
5ea44a544d5f55 Yong Wu        2024-02-04  4181  			larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4182  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4183  
3a88be54312101 Xavier Chang   2024-01-08  4184  		venc_gcon_core1_clk: syscon@38800000 {
3a88be54312101 Xavier Chang   2024-01-08  4185  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  4186  			compatible = "mediatek,mt8196-vencsys-c1", "mediatek,mt8196-vencsys_c1", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4187  			reg = <0 0x38800000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4188  			mm-hw-ccf-regmap = <&mm_hwv>;
3a88be54312101 Xavier Chang   2024-01-08  4189  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4190  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
3a88be54312101 Xavier Chang   2024-01-08  4191  		};
3a88be54312101 Xavier Chang   2024-01-08  4192  
5ea44a544d5f55 Yong Wu        2024-02-04  4193  		smi_larb8: larb@38810000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4194  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4195  			reg = <0 0x38810000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4196  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4197  			clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4198  				 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4199  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4200  			mediatek,smi = <&smi_mdp_venc_sub_comm1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4201  			mediatek,larb-id = <8>;
5ea44a544d5f55 Yong Wu        2024-02-04  4202  			larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4203  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4204  
5ea44a544d5f55 Yong Wu        2024-02-04  4205  
5ea44a544d5f55 Yong Wu        2024-02-04  4206  		smi_mdp_venc_sub_comm1: smi-sub-comm@38870000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4207  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4208  			reg = <0 0x38870000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4209  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4210  			clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4211  				 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4212  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4213  			mediatek,smi = <&smi_mdp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4214  			mediatek,common-id = <16>;
5ea44a544d5f55 Yong Wu        2024-02-04  4215  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4216  
5ea44a544d5f55 Yong Wu        2024-02-04  4217  		smi_larb42: larb@38890000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4218  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4219  			reg = <0 0x38890000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4220  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4221  			clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4222  				 <&venc_gcon_core1_clk CLK_VEN2_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4223  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4224  			mediatek,smi = <&smi_mdp_venc_sub_comm1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4225  			mediatek,larb-id = <42>;
5ea44a544d5f55 Yong Wu        2024-02-04  4226  			larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4227  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4228  
3a88be54312101 Xavier Chang   2024-01-08  4229  		venc_gcon_core2_clk: syscon@38c00000 {
3a88be54312101 Xavier Chang   2024-01-08  4230  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  4231  			compatible = "mediatek,mt8196-vencsys-c2", "mediatek,mt8196-vencsys_c2", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4232  			reg = <0 0x38c00000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4233  			mm-hw-ccf-regmap = <&mm_hwv>;
3a88be54312101 Xavier Chang   2024-01-08  4234  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4235  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
3a88be54312101 Xavier Chang   2024-01-08  4236  		};
3a88be54312101 Xavier Chang   2024-01-08  4237  
5ea44a544d5f55 Yong Wu        2024-02-04  4238  		smi_larb24: larb@38c10000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4239  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4240  			reg = <0 0x38c10000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4241  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4242  			clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4243  				 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4244  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4245  			mediatek,smi = <&smi_mdp_venc_sub_comm2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4246  			mediatek,larb-id = <24>;
5ea44a544d5f55 Yong Wu        2024-02-04  4247  			larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4248  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4249  
5ea44a544d5f55 Yong Wu        2024-02-04  4250  		smi_mdp_venc_sub_comm2: smi-sub-comm@38c70000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4251  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4252  			reg = <0 0x38c70000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4253  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4254  			clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4255  				 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4256  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4257  			mediatek,smi = <&smi_mdp_venc_sub_comm1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4258  			mediatek,common-id = <18>;
5ea44a544d5f55 Yong Wu        2024-02-04  4259  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4260  
5ea44a544d5f55 Yong Wu        2024-02-04  4261  		smi_larb47: larb@38c90000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4262  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4263  			reg = <0 0x38c90000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4264  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4265  			clocks = <&venc_gcon_core2_clk CLK_VEN_C2_CKE0_LARB_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4266  				 <&venc_gcon_core2_clk CLK_VEN_C2_CKE1_VENC_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4267  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4268  			mediatek,smi = <&smi_mdp_venc_sub_comm2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4269  			mediatek,larb-id = <47>;
5ea44a544d5f55 Yong Wu        2024-02-04  4270  			larb-port-real-time-type = <3 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 1 1 1 3 3 3 3 3 3 3 3 1 1 1 1 3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4271  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4272  
3a88be54312101 Xavier Chang   2024-01-08  4273  		mdpsys_config_clk: syscon@3e000000 {
3a88be54312101 Xavier Chang   2024-01-08  4274  			compatible = "mediatek,mt8196-mdpsys", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4275  			reg = <0 0x3e000000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4276  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4277  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
3a88be54312101 Xavier Chang   2024-01-08  4278  		};
3a88be54312101 Xavier Chang   2024-01-08  4279  
5ea44a544d5f55 Yong Wu        2024-02-04  4280  		smi_larb2: larb@3e030000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4281  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4282  			reg = <0 0x3e030000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4283  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML0_SHUTDOWN>;
5ea44a544d5f55 Yong Wu        2024-02-04  4284  			clocks = <&mdpsys_config_clk CLK_MDP_SMI0_SMI>, <&mdpsys_config_clk CLK_MDP_SMI0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4285  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4286  			mediatek,smi = <&smi_disp_dram_sub_comm0>;
5ea44a544d5f55 Yong Wu        2024-02-04  4287  			mediatek,larb-id = <2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4288  			larb-port-real-time-type = <1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>;
5ea44a544d5f55 Yong Wu        2024-02-04  4289  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4290  
3a88be54312101 Xavier Chang   2024-01-08  4291  		mdpsys1_config_clk: syscon@3e400000 {
3a88be54312101 Xavier Chang   2024-01-08  4292  			compatible = "mediatek,mt8196-mdpsys1", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4293  			reg = <0 0x3e400000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4294  			#clock-cells = <1>;
f45217dfb36e1c Guangjie Song  2024-09-24  4295  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
3a88be54312101 Xavier Chang   2024-01-08  4296  		};
3a88be54312101 Xavier Chang   2024-01-08  4297  
5ea44a544d5f55 Yong Wu        2024-02-04  4298  		smi_larb3: larb@3e430000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4299  			compatible = "mediatek,mt8196-smi-larb";
5ea44a544d5f55 Yong Wu        2024-02-04  4300  			reg = <0 0x3e430000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4301  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_MML1_SHUTDOWN>;
5ea44a544d5f55 Yong Wu        2024-02-04  4302  			clocks = <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>, <&mdpsys1_config_clk CLK_MDP1_SMI0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4303  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4304  			mediatek,smi = <&smi_mdp_dram_sub_comm3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4305  			mediatek,larb-id = <3>;
5ea44a544d5f55 Yong Wu        2024-02-04  4306  			larb-port-real-time-type = <2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 1 2>;
5ea44a544d5f55 Yong Wu        2024-02-04  4307  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4308  
3a88be54312101 Xavier Chang   2024-01-08  4309  		disp_vdisp_ao_config_clk: syscon@3e800000 {
fd00cab3fe36e4 Xavier Chang   2025-01-09  4310  			compatible = "mediatek,mt8196-vdisp-ao", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4311  			reg = <0 0x3e800000 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4312  			mm-hw-ccf-regmap = <&mm_hwv>;
3a88be54312101 Xavier Chang   2024-01-08  4313  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  4314  		};
3a88be54312101 Xavier Chang   2024-01-08  4315  
5ea44a544d5f55 Yong Wu        2024-02-04  4316  		smi_disp_dram_sub_comm0: smi-sub-comm@3e810000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4317  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4318  			reg = <0 0x3e810000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4319  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
5ea44a544d5f55 Yong Wu        2024-02-04  4320  			clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4321  					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4322  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4323  			mediatek,smi = <&smi_disp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4324  			mediatek,common-id = <9>;
5ea44a544d5f55 Yong Wu        2024-02-04  4325  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4326  
5ea44a544d5f55 Yong Wu        2024-02-04  4327  		smi_disp_dram_sub_comm1: smi-sub-comm@3e820000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4328  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4329  			reg = <0 0x3e820000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4330  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
5ea44a544d5f55 Yong Wu        2024-02-04  4331  			clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4332  					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4333  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4334  			mediatek,smi = <&smi_disp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4335  			mediatek,common-id = <10>;
5ea44a544d5f55 Yong Wu        2024-02-04  4336  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4337  
5ea44a544d5f55 Yong Wu        2024-02-04  4338  		smi_mdp_dram_sub_comm2: smi-sub-comm@3e830000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4339  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4340  			reg = <0 0x3e830000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4341  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
5ea44a544d5f55 Yong Wu        2024-02-04  4342  			clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4343  					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4344  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4345  			mediatek,smi = <&smi_mdp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4346  			mediatek,common-id = <11>;
5ea44a544d5f55 Yong Wu        2024-02-04  4347  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4348  
5ea44a544d5f55 Yong Wu        2024-02-04  4349  		smi_mdp_dram_sub_comm3: smi-sub-comm@3e840000 {
5ea44a544d5f55 Yong Wu        2024-02-04  4350  			compatible = "mediatek,mt8196-smi-sub-common";
5ea44a544d5f55 Yong Wu        2024-02-04  4351  			reg = <0 0x3e840000 0 0x1000>;
5ea44a544d5f55 Yong Wu        2024-02-04  4352  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_VCORE>;
5ea44a544d5f55 Yong Wu        2024-02-04  4353  			clocks = <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>,
5ea44a544d5f55 Yong Wu        2024-02-04  4354  					 <&disp_vdisp_ao_config_clk CLK_MM_V_SMI_SUB_SOMM0_SMI>;
5ea44a544d5f55 Yong Wu        2024-02-04  4355  			clock-names = "apb", "smi";
5ea44a544d5f55 Yong Wu        2024-02-04  4356  			mediatek,smi = <&smi_mdp_common>;
5ea44a544d5f55 Yong Wu        2024-02-04  4357  			mediatek,common-id = <12>;
5ea44a544d5f55 Yong Wu        2024-02-04  4358  		};
5ea44a544d5f55 Yong Wu        2024-02-04  4359  
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4360  		dp_tx: dp-tx@3ec00000 {
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4361  			compatible = "mediatek,mt8196-dp-tx";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4362  			reg = <0 0x3ec00000 0 0x5000>,
3eb254258f2631 Jason-jh Lin   2025-01-16  4363  			      <0 0x128b0000 0 0x1500>,
3eb254258f2631 Jason-jh Lin   2025-01-16  4364  			      <0 0x1002d600 0 0x4>,
3eb254258f2631 Jason-jh Lin   2025-01-16  4365  			      <0 0x31b50078 0 0x4>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4366  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_DPTX_DORMANT>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4367  					<&scpsys MT8196_POWER_DOMAIN_SSUSB_DP_PHY_P0>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4368  			power-domain-names = "pd_dp_tx", "pd_dp_phy";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4369  			interrupts = <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH 0>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4370  			dptx,phy-params = <0x221c1814 0x24241e18 0x0000302a
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4371  					   0x0e080400 0x000c0600 0x00000006>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4372  			#phy-cells = <0>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4373  			clocks = <&cksys_gp2_clk CLK_CK2_DP0_SEL>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4374  				 <&cksys_clk CLK_CK_TCK_26M_MX9>;
3eb254258f2631 Jason-jh Lin   2025-01-16  4375  			clock-names = "mux_dp",
3eb254258f2631 Jason-jh Lin   2025-01-16  4376  				      "ck_26m";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4377  		};
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4378  
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4379  		edp_tx: edp-tx@3ec40000 {
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4380  			compatible = "mediatek,mt8196-edp-tx";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4381  			reg = <0 0x3ec40000 0 0x4000>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4382  			      <0 0x130a0000 0 0x1500>,
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4383  			      <0 0x31b50074 0 0x4>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4384  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_DISP_EDPTX_DORMANT>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4385  			clocks = <&cksys_gp2_clk CLK_CK2_DVO_SEL>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4386  			clock-names = "power";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4387  			max-linkrate-mhz = <8100>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4388  			interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH 0>;
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4389  			status = "disabled";
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4390  		};
a8c57d5aa8acdd Jason-jh Lin   2025-01-16  4391  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4392  		gpu: gpu@48000000 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4393  			compatible = "mediatek,mali-mt8196", "mediatek,mali";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4394  			reg = <0 0x48000000 0 0x480000>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4395  			interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4396  				     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4397  				     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4398  				     <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH 0>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4399  				     <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4400  				     <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH 0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4401  			interrupt-names = "job",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4402  					  "mmu",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4403  					  "gpu",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4404  					  "event",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4405  					  "pwr",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4406  					  "gpueb_mbox1";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4407  			l2-hash-values = <0xb 0xe 0x0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4408  			physical-memory-group-manager = <&mgm>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4409  			protected-memory-allocator = <&gpu_protected_memory_allocator>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4410  			operating-points-v2 = <&gpu_mali_opp>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4411  			#cooling-cells = <2>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4412  			ged-supply = <&ged>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4413  			system-coherency = <31>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4414  			sleep-mode-enable;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4415  			firmware-idle-hysteresis-time-us = <0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4416  			default-glb-pwroff-timeout-us = <10>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4417  			autosuspend-delay-ms = <10>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4418  			adaptive-power-policy = <2>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4419  			reset-exception-mask = <0x0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4420  			iter-trace-enable = <1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4421  			gpu-frame-base-optimize = <1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4422  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4423  			pbha {
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4424  				propagate-bits = /bits/ 8 <0xf>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4425  			};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4426  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4427  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4428  		gpufreq: gpufreq@48500000 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4429  			compatible = "mediatek,gpufreq";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4430  			reg = <0 0x48500000 0 0x1000>,   /* MFG_TOP_CONFIG */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4431  			      <0 0x48600000 0 0x200000>, /* MFG_SMMU */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4432  			      <0 0x48800000 0 0x1000>,   /* MFG_VGPU_BUS_DBG_TRACKER */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4433  			      <0 0x4b190000 0 0x20000>,  /* MFG_GPUEB_BUS_DBG_TRACKER */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4434  			      <0 0x4b800000 0 0x10000>,  /* MFG_RPC */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4435  			      <0 0x4b810000 0 0x400>,    /* MFG_PLL */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4436  			      <0 0x4b810400 0 0x400>,    /* MFG_PLL_SC0 */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4437  			      <0 0x4b810800 0 0x400>,    /* MFG_PLL_SC1 */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4438  			      <0 0x4b840000 0 0x1000>,   /* MFG_HBVC */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4439  			      <0 0x4b860000 0 0x1000>,   /* MFG_VCORE_AO_CFG */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4440  			      <0 0x4b8b0000 0 0x1000>,   /* MFG_VCORE_DEVAPC */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4441  			      <0 0x4b900000 0 0x1000>,   /* MFG_VCORE_BUS_DBG_TRACKER */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4442  			      <0 0x0c000000 0 0x1000>,   /* MCUSYS_PAR_WRAP */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4443  			      <0 0x10000000 0 0x1000>,   /* CKSYS */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4444  			      <0 0x10404000 0 0x1000>,   /* NTH_EMICFG_AO_MEM */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4445  			      <0 0x10416000 0 0x1000>,   /* NTH_EMI_AO_DEBUG_CTRL */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4446  			      <0 0x10425000 0 0x1000>,   /* NTH_EMICFG */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4447  			      <0 0x10469000 0 0x1000>,   /* EMI */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4448  			      <0 0x10504000 0 0x1000>,   /* STH_EMICFG_AO_MEM */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4449  			      <0 0x10516000 0 0x1000>,   /* STH_EMI_AO_DEBUG_CTRL */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4450  			      <0 0x10525000 0 0x1000>,   /* STH_EMICFG */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4451  			      <0 0x10569000 0 0x1000>,   /* SUB_EMI */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4452  			      <0 0x10621000 0 0x1000>,   /* SEMI_MI32_SMI */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4453  			      <0 0x10622000 0 0x1000>,   /* NEMI_MI32_SMI */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4454  			      <0 0x10623000 0 0x1000>,   /* SEMI_MI33_SMI */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4455  			      <0 0x10624000 0 0x1000>,   /* NEMI_MI33_SMI */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4456  			      <0 0x10644000 0 0x1000>,   /* INFRA_AO_DEBUG_CTRL */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4457  			      <0 0x10645000 0 0x1000>,   /* EMI_INFRA_AO_BCRM */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4458  			      <0 0x10646000 0 0x1000>,   /* EMI_INFRA_AO_MEM */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4459  			      <0 0x10648000 0 0x1000>,   /* EMI_INFRA_CFG */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4460  			      <0 0x1c004000 0 0x10000>;  /* SLEEP */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4461  			reg-names = "mfg_top_config",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4462  				    "mfg_smmu",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4463  				    "mfg_vgpu_bus_trk",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4464  				    "mfg_gpueb_bus_trk",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4465  				    "mfg_rpc",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4466  				    "mfg_pll",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4467  				    "mfg_pll_sc0",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4468  				    "mfg_pll_sc1",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4469  				    "mfg_hbvc",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4470  				    "mfg_vcore_ao_cfg",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4471  				    "mfg_vcore_devapc",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4472  				    "mfg_vcore_bus_trk",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4473  				    "mcusys_par_wrap",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4474  				    "cksys",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4475  				    "nth_emicfg_ao_mem",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4476  				    "nth_emi_ao_debug_ctrl",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4477  				    "nth_emicfg",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4478  				    "emi",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4479  				    "sth_emicfg_ao_mem",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4480  				    "sth_emi_ao_debug_ctrl",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4481  				    "sth_emicfg",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4482  				    "sub_emi",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4483  				    "semi_mi32_smi",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4484  				    "nemi_mi32_smi",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4485  				    "semi_mi33_smi",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4486  				    "nemi_mi33_smi",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4487  				    "infra_ao_debug_ctrl",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4488  				    "emi_infra_ao_bcrm",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4489  				    "emi_infra_ao_mem",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4490  				    "emi_infra_cfg",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4491  				    "sleep";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4492  			gpufreq-wrapper-supply = <&gpufreq_wrapper>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4493  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4494  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4495  		gpupdma: gpupdma@48540000 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4496  			compatible = "mediatek,gpupdma";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4497  			reg = <0 0x48540000 0 0x2000>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4498  			      <0 0x4b800704 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4499  			      <0 0x13f840 0 0x28>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4500  			ringbuf-page-order = <3>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4501  			config-mode = <1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4502  			hw-semaphore-bit = <1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4503  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4504  
d64301076e1f02 Yong Wu        2024-02-29  4505  		gpu_smmu: iommu@48600000 {
d64301076e1f02 Yong Wu        2024-02-29  4506  			#iommu-cells = <1>;
d64301076e1f02 Yong Wu        2024-02-29  4507  			compatible = "mediatek,mt8196-gpu-smmu", "arm,smmu-v3";
d64301076e1f02 Yong Wu        2024-02-29  4508  			reg = <0 0x48600000 0 0x1e0000>;
d64301076e1f02 Yong Wu        2024-02-29  4509  			interrupts = <GIC_SPI 616 IRQ_TYPE_LEVEL_HIGH 0>;
d64301076e1f02 Yong Wu        2024-02-29  4510  			interrupt-names = "combined";
d64301076e1f02 Yong Wu        2024-02-29  4511  			status = "disabled";
d64301076e1f02 Yong Wu        2024-02-29  4512  		};
d64301076e1f02 Yong Wu        2024-02-29  4513  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4514  		gpueb: gpueb@4b000000 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4515  			compatible = "mediatek,gpueb";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4516  			reg = <0 0x4b000000 0 0xa0000>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4517  			      <0 0x4b09fd00 0 0x80>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4518  			      <0 0x4b140100 0 0x200>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4519  			      <0 0x4b120000 0 0x100>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4520  			      <0 0x4b09fd80 0 0x280>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4521  			      <0 0x4b170008 0 0x4>,  /* arbitrary addr to avoid error msg */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4522  			      <0 0x4b170004 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4523  			      <0 0x4b170074 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4524  			      <0 0x4b170000 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4525  			      <0 0x4b170078 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4526  			      <0 0x4b800504 0 0x4>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4527  			reg-names = "gpueb_base",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4528  			            "gpueb_gpr_base",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4529  			            "gpueb_cfgreg_base",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4530  			            "gpueb_intc_base",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4531  			            "mbox0_base",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4532  			            "mbox0_init", /* dummy input for mtk_mbox_probe */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4533  			            "mbox0_set",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4534  			            "mbox0_clr",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4535  			            "mbox0_send",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4536  			            "mbox0_recv",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4537  			            "mfg0_pwr_con";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4538  			interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4539  			interrupt-names = "mbox0";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4540  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4541  			gpueb-support;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4542  			ghpm-support;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4543  			mbox-count = <1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4544  			mbox-size = <160>; /* 160 slot * 4 = 640 byte */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4545  			slot-size = <4>;   /* 1 slot = 4 bytes */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4546  			ts-mbox = <0>; /* mbox for timersync */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4547  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4548  			/* id, mbox, send_size */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4549  			send-table = <0 0 4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4550  				     <1 0 8>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4551  				     <2 0 3>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4552  				     <3 0 6>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4553  				     <4 0 9>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4554  				     <5 0 4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4555  				     <6 0 6>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4556  				     <7 0 6>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4557  				     <8 0 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4558  				     <9 0 4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4559  				     <10 0 4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4560  				     <11 0 1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4561  			send-name-table = "IPI_ID_FAST_DVFS_EVENT",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4562  					  "IPI_ID_GPUFREQ",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4563  					  "IPI_ID_SLEEP",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4564  					  "IPI_ID_TIMER",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4565  					  "IPI_ID_FHCTL",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4566  					  "IPI_ID_CCF",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4567  					  "IPI_ID_GPUMPU",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4568  					  "IPI_ID_FAST_DVFS",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4569  					  "CH_IPIR_C_MET", /* = IPIS_C_MET on gpueb side */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4570  					  "CH_IPIS_C_MET", /* = IPIR_C_MET on gpueb side */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4571  					  "IPI_ID_BRISKET",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4572  					  "IPI_ID_PPB";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4573  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4574  			/* id, mbox, recv_size, recv_opt, cb_ctx_opt */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4575  			recv-table = <0 0 4 0 0>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4576  				     <1 0 8 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4577  				     <2 0 1 0 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4578  				     <3 0 1 0 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4579  				     <4 0 1 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4580  				     <5 0 4 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4581  				     <6 0 1 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4582  				     <7 0 6 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4583  				     <8 0 4 0 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4584  				     <9 0 1 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4585  				     <10 0 4 1 1>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4586  				     <11 0 1 1 1>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4587  			recv-name-table = "IPI_ID_FAST_DVFS_EVENT",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4588  					  "IPI_ID_GPUFREQ",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4589  					  "IPI_ID_SLEEP",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4590  					  "IPI_ID_TIMER",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4591  					  "IPI_ID_FHCTL",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4592  					  "IPI_ID_CCF",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4593  					  "IPI_ID_GPUMPU",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4594  					  "IPI_ID_FAST_DVFS",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4595  					  "CH_IPIR_C_MET", /* = IPIS_C_MET on gpueb side */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4596  					  "CH_IPIS_C_MET", /* = IPIR_C_MET on gpueb side */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4597  					  "IPI_ID_BRISKET",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4598  					  "IPI_ID_PPB";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4599  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4600  			gpueb-mem-table = <0 0x4000>,   /* 16KB */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4601  					  <1 0x180000>; /* 1.5MB */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4602  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4603  			gpueb-mem-name-table = "MEM_ID_GPUFREQ", /* GPUFREQ */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4604  					       "MEM_ID_LOG";     /* LOGGER */
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4605  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4606  
3a88be54312101 Xavier Chang   2024-01-08  4607  		mfgpll_pll_ctrl_clk: syscon@4b810000 {
3a88be54312101 Xavier Chang   2024-01-08  4608  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  4609  			compatible = "mediatek,mt8196-mfgpll-pll-ctrl", "mediatek,mt8196-mfgpll_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4610  			reg = <0 0x4b810000 0 0x400>;
3a88be54312101 Xavier Chang   2024-01-08  4611  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  4612  		};
3a88be54312101 Xavier Chang   2024-01-08  4613  
3a88be54312101 Xavier Chang   2024-01-08  4614  		mfgpll_sc0_pll_ctrl_clk: syscon@4b810400 {
3a88be54312101 Xavier Chang   2024-01-08  4615  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  4616  			compatible = "mediatek,mt8196-mfgpll-sc0-pll-ctrl", "mediatek,mt8196-mfgpll_sc0_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4617  			reg = <0 0x4b810400 0 0x400>;
3a88be54312101 Xavier Chang   2024-01-08  4618  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  4619  		};
3a88be54312101 Xavier Chang   2024-01-08  4620  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4621  		ghpm: ghpm@4b800000 {
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4622  			compatible = "mediatek,ghpm";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4623  			reg =
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4624  				<0 0x4b800000 0 0x1000>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4625  				<0 0x4b860000 0 0x1000>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4626  				<0 0x4b860128 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4627  				<0 0x1c004ea8 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4628  				<0 0x1c000070 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4629  				<0 0x1c000074 0 0x4>,
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4630  				<0 0x1c000078 0 0x4>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4631  			reg-names =
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4632  				"mfg_rpc",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4633  				"mfg_vcore_ao_config",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4634  				"mfg_mt8196_e2_id_con",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4635  				"spm_mfg0_pwr_con",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4636  				"clk_cfg_6",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4637  				"clk_cfg_6_set",
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4638  				"clk_cfg_6_clr";
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4639  
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4640  			gpueb-supply = <&gpueb>;
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4641  		};
1ac2c128a1d9a6 Andy Hsu       2024-03-29  4642  
3a88be54312101 Xavier Chang   2024-01-08  4643  		mfgpll_sc1_pll_ctrl_clk: syscon@4b810800 {
3a88be54312101 Xavier Chang   2024-01-08  4644  			/* TODO: Fix compatible in driver */
3a88be54312101 Xavier Chang   2024-01-08  4645  			compatible = "mediatek,mt8196-mfgpll-sc1-pll-ctrl", "mediatek,mt8196-mfgpll_sc1_pll_ctrl", "syscon";
3a88be54312101 Xavier Chang   2024-01-08  4646  			reg = <0 0x4b810800 0 0x1000>;
3a88be54312101 Xavier Chang   2024-01-08  4647  			#clock-cells = <1>;
3a88be54312101 Xavier Chang   2024-01-08  4648  		};
d64301076e1f02 Yong Wu        2024-02-29  4649  
b9408b7224ce87 Runyang Chen   2024-03-26  4650  		devapc_gpu: devapc@4b890000 {
b9408b7224ce87 Runyang Chen   2024-03-26  4651  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  4652  			reg = <0 0x4b890000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  4653  			vio-idx-num = <20>;
b9408b7224ce87 Runyang Chen   2024-03-26  4654  			interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  4655  		};
b9408b7224ce87 Runyang Chen   2024-03-26  4656  
b9408b7224ce87 Runyang Chen   2024-03-26  4657  		devapc_gpu1: devapc@4b8b0000 {
b9408b7224ce87 Runyang Chen   2024-03-26  4658  			compatible = "mediatek,mt8196-devapc";
b9408b7224ce87 Runyang Chen   2024-03-26  4659  			reg = <0 0x4b8b0000 0 0x1000>;
b9408b7224ce87 Runyang Chen   2024-03-26  4660  			vio-idx-num = <26>;
b9408b7224ce87 Runyang Chen   2024-03-26  4661  			interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
b9408b7224ce87 Runyang Chen   2024-03-26  4662  		};
b9408b7224ce87 Runyang Chen   2024-03-26  4663  
d64301076e1f02 Yong Wu        2024-02-29  4664  		apu_smmu: iommu@4c000000 {
d64301076e1f02 Yong Wu        2024-02-29  4665  			compatible = "mediatek,mt8196-apu-smmu", "arm,smmu-v3";
d64301076e1f02 Yong Wu        2024-02-29  4666  			reg = <0 0x4c000000 0 0x1e0000>;
d64301076e1f02 Yong Wu        2024-02-29  4667  			interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING 0>;
d64301076e1f02 Yong Wu        2024-02-29  4668  			interrupt-names = "combined";
d64301076e1f02 Yong Wu        2024-02-29  4669  			#iommu-cells = <1>;
eedd3dc85418be Karl Li        2024-09-27  4670  			smmu-mediatek-parents = <&apu_top_3>;
eedd3dc85418be Karl Li        2024-09-27  4671  		};
eedd3dc85418be Karl Li        2024-09-27  4672  
eedd3dc85418be Karl Li        2024-09-27  4673  		apu_mailbox: mailbox@4c200000 {
eedd3dc85418be Karl Li        2024-09-27  4674  			compatible = "mediatek,mt8196-apu-mailbox";
eedd3dc85418be Karl Li        2024-09-27  4675  			reg = <0 0x4c200000 0 0xfffff>;
eedd3dc85418be Karl Li        2024-09-27  4676  			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
eedd3dc85418be Karl Li        2024-09-27  4677  			#mbox-cells = <1>;
eedd3dc85418be Karl Li        2024-09-27  4678  		};
eedd3dc85418be Karl Li        2024-09-27  4679  
eedd3dc85418be Karl Li        2024-09-27  4680  		apusys-apummu {
eedd3dc85418be Karl Li        2024-09-27  4681  			compatible = "mediatek,rv-apummu-mt8196";
eedd3dc85418be Karl Li        2024-09-27  4682  			#address-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  4683  			#size-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  4684  			apu-rv-dev = <&apusys_rv>;
eedd3dc85418be Karl Li        2024-09-27  4685  			iommus = <&apu_smmu 0xd>;
d64301076e1f02 Yong Wu        2024-02-29  4686  		};
2f2aff80fd0e0d Darren Ye      2024-04-01  4687  
e818ec0bd11a22 Kyrie Wu       2024-04-29  4688  		jpeg-decoder {
e818ec0bd11a22 Kyrie Wu       2024-04-29  4689  			compatible = "mediatek,mt8196-jpgdec";
e818ec0bd11a22 Kyrie Wu       2024-04-29  4690  			power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4691  			iommus = <&mm_smmu 164>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4692  			#address-cells = <2>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4693  			#size-cells = <2>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4694  			ranges;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4695  
e818ec0bd11a22 Kyrie Wu       2024-04-29  4696  			jpgdec0: jpeg-decoder@38040000 {
e818ec0bd11a22 Kyrie Wu       2024-04-29  4697  				compatible = "mediatek,mt8196-jpgdec-hw";
e818ec0bd11a22 Kyrie Wu       2024-04-29  4698  				reg = <0 0x38040000 0 0x10000>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4699  				interrupts = <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4700  				clocks = <&venc_gcon_clk CLK_VEN1_CKE3_JPGDEC_JPGDEC>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4701  				clock-names = "jpgdec";
e818ec0bd11a22 Kyrie Wu       2024-04-29  4702  				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN0>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4703  			};
e818ec0bd11a22 Kyrie Wu       2024-04-29  4704  
e818ec0bd11a22 Kyrie Wu       2024-04-29  4705  			jpgdec1: jpeg-decoder@38840000 {
e818ec0bd11a22 Kyrie Wu       2024-04-29  4706  				compatible = "mediatek,mt8196-jpgdec-hw";
e818ec0bd11a22 Kyrie Wu       2024-04-29  4707  				reg = <0 0x38840000 0 0x10000>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4708  				interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4709  				clocks = <&venc_gcon_core1_clk CLK_VEN2_CKE3_JPGDEC_JPGDEC>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4710  				clock-names = "jpgdec";
e818ec0bd11a22 Kyrie Wu       2024-04-29  4711  				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4712  			};
e818ec0bd11a22 Kyrie Wu       2024-04-29  4713  		};
e818ec0bd11a22 Kyrie Wu       2024-04-29  4714  
e818ec0bd11a22 Kyrie Wu       2024-04-29  4715  		jpeg-encoder {
e818ec0bd11a22 Kyrie Wu       2024-04-29  4716  			compatible = "mediatek,mt8196-jpgenc";
e818ec0bd11a22 Kyrie Wu       2024-04-29  4717  			power-domains = <&hfrpsys  MT8196_POWER_DOMAIN_VEN0>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4718  			iommus = <&mm_smmu 165>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4719  			#address-cells = <2>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4720  			#size-cells = <2>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4721  			ranges;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4722  
e818ec0bd11a22 Kyrie Wu       2024-04-29  4723  			jpgenc0: jpeg-encoder@38030000 {
e818ec0bd11a22 Kyrie Wu       2024-04-29  4724  				compatible = "mediatek,mt8196-jpgenc-hw";
e818ec0bd11a22 Kyrie Wu       2024-04-29  4725  				reg = <0 0x38030000 0 0x10000>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4726  				interrupts = <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH 0>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4727  				clocks = <&venc_gcon_clk CLK_VEN1_CKE2_JPGENC_JPGENC>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4728  				clock-names = "jpgenc";
e818ec0bd11a22 Kyrie Wu       2024-04-29  4729  				power-domains = <&hfrpsys  MT8196_POWER_DOMAIN_VEN0>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4730  			};
e818ec0bd11a22 Kyrie Wu       2024-04-29  4731  
e818ec0bd11a22 Kyrie Wu       2024-04-29  4732  			jpgenc1: jpeg-encoder@38830000 {
e818ec0bd11a22 Kyrie Wu       2024-04-29  4733  				compatible = "mediatek,mt8196-jpgenc-hw";
e818ec0bd11a22 Kyrie Wu       2024-04-29  4734  				reg = <0 0x38830000 0 0x10000>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4735  				interrupts = <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4736  				clocks = <&venc_gcon_clk CLK_VEN1_CKE2_JPGENC>,
e818ec0bd11a22 Kyrie Wu       2024-04-29  4737  					<&venc_gcon_core1_clk  CLK_VEN2_CKE2_JPGENC_JPGENC>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4738  				clock-names = "jpgenc", "jpgenc_c1";
e818ec0bd11a22 Kyrie Wu       2024-04-29  4739  				power-domains = <&hfrpsys MT8196_POWER_DOMAIN_VEN1>;
e818ec0bd11a22 Kyrie Wu       2024-04-29  4740  			};
e818ec0bd11a22 Kyrie Wu       2024-04-29  4741  		};
e818ec0bd11a22 Kyrie Wu       2024-04-29  4742  
eedd3dc85418be Karl Li        2024-09-27  4743  		mtk_apu_mem_code: mtk-apu-mem-code {
eedd3dc85418be Karl Li        2024-09-27  4744  			compatible = "mediatek, apu_mem_code";
eedd3dc85418be Karl Li        2024-09-27  4745  			#address-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  4746  			#size-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  4747  			type = <1>;
eedd3dc85418be Karl Li        2024-09-27  4748  			mask = /bits/ 64 <0x00000003ffffffff>;
eedd3dc85418be Karl Li        2024-09-27  4749  			iommus = <&apu_smmu 0xb>;
eedd3dc85418be Karl Li        2024-09-27  4750  		};
eedd3dc85418be Karl Li        2024-09-27  4751  
eedd3dc85418be Karl Li        2024-09-27  4752  		mtk_apu_mem_data: mtk-apu-mem-data {
eedd3dc85418be Karl Li        2024-09-27  4753  			compatible = "mediatek, apu_mem_data";
eedd3dc85418be Karl Li        2024-09-27  4754  			#address-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  4755  			#size-cells = <2>;
eedd3dc85418be Karl Li        2024-09-27  4756  			type = <2>;
eedd3dc85418be Karl Li        2024-09-27  4757  			mask = /bits/ 64 <0x00000003ffffffff>;
eedd3dc85418be Karl Li        2024-09-27  4758  			iommus = <&apu_smmu 0xa>;
eedd3dc85418be Karl Li        2024-09-27  4759  		};
eedd3dc85418be Karl Li        2024-09-27  4760  
eedd3dc85418be Karl Li        2024-09-27  4761  		mvpu {
eedd3dc85418be Karl Li        2024-09-27  4762  			compatible = "mediatek, mt8196-mvpu";
eedd3dc85418be Karl Li        2024-09-27  4763  			core-num = <2>;
eedd3dc85418be Karl Li        2024-09-27  4764  			mask = /bits/ 64 <0x00000003ffffffff>;
eedd3dc85418be Karl Li        2024-09-27  4765  			iommus = <&apu_smmu 0xf>;
eedd3dc85418be Karl Li        2024-09-27  4766  		};
eedd3dc85418be Karl Li        2024-09-27  4767  
2f2aff80fd0e0d Darren Ye      2024-04-01  4768  		sound: sound {
2f2aff80fd0e0d Darren Ye      2024-04-01  4769  			compatible = "mediatek,mt8196-mt6681-sound";
2f2aff80fd0e0d Darren Ye      2024-04-01  4770  			mediatek,platform = <&afe>;
2f2aff80fd0e0d Darren Ye      2024-04-01  4771  			/* audio-routing is added here as a placeholder to complete the
2f2aff80fd0e0d Darren Ye      2024-04-01  4772  			   probe flow.It should be removed when upstreaming */
2f2aff80fd0e0d Darren Ye      2024-04-01  4773  			audio-routing = "Headphone Jack", "HPOL",
2f2aff80fd0e0d Darren Ye      2024-04-01  4774  					"Headphone Jack", "HPOR";
2f2aff80fd0e0d Darren Ye      2024-04-01  4775  			status = "disabled";
2f2aff80fd0e0d Darren Ye      2024-04-01  4776  		};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4777  
d9575ab619e83d Nancy Lin      2024-12-19  4778  		vdisp-ctrl {
d9575ab619e83d Nancy Lin      2024-12-19  4779  			compatible = "mediatek,mt8196-vdisp-ctrl";
d9575ab619e83d Nancy Lin      2024-12-19  4780  			mediatek,hw-ccf = <&mm_hwv>;
d9575ab619e83d Nancy Lin      2024-12-19  4781  			mediatek,vcp = <&vcp>;
d9575ab619e83d Nancy Lin      2024-12-19  4782  
d9575ab619e83d Nancy Lin      2024-12-19  4783  			vdisp: vdisp {
d9575ab619e83d Nancy Lin      2024-12-19  4784  				regulator-name = "vdisp";
d9575ab619e83d Nancy Lin      2024-12-19  4785  			};
d9575ab619e83d Nancy Lin      2024-12-19  4786  		};
d9575ab619e83d Nancy Lin      2024-12-19  4787  
a2f778a6f2805b Yunfei Dong    2024-12-23  4788  		vmm: vmm {
a2f778a6f2805b Yunfei Dong    2024-12-23  4789  			compatible = "mediatek,mt8196-vmm";
a2f778a6f2805b Yunfei Dong    2024-12-23  4790  			mediatek,hw-ccf = <&mm_hwv>;
a2f778a6f2805b Yunfei Dong    2024-12-23  4791  			mediatek,vcp = <&vcp>;
a2f778a6f2805b Yunfei Dong    2024-12-23  4792  
a2f778a6f2805b Yunfei Dong    2024-12-23  4793  			vdec_vcore: vdec-vcore {
a2f778a6f2805b Yunfei Dong    2024-12-23  4794  				regulator-name = "vdec-vcore";
a2f778a6f2805b Yunfei Dong    2024-12-23  4795  			};
a2f778a6f2805b Yunfei Dong    2024-12-23  4796  		};
a2f778a6f2805b Yunfei Dong    2024-12-23  4797  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4798  		thermal_zones: thermal-zones {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4799  			soc_max: soc_max {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4800  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4801  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4802  				thermal-sensors = <&lvts 0>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4803  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4804  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4805  					soc_max_crit: so-max-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4806  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4807  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4808  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4809  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4810  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4811  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4812  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4813  			cpu-6-0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4814  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4815  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4816  				thermal-sensors = <&lvts 1>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4817  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4818  					cpu_medium_core6_0_crit: cpu-medium-core6-0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4819  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4820  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4821  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4822  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4823  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4824  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4825  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4826  			cpu-6-1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4827  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4828  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4829  				thermal-sensors = <&lvts 2>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4830  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4831  					cpu_medium_core6_1_crit: cpu-medium-core6-1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4832  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4833  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4834  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4835  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4836  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4837  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4838  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4839  			cpu-dsu2-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4840  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4841  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4842  				thermal-sensors = <&lvts 3>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4843  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4844  					cpu_dsu2_crit: cpu-dsu2-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4845  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4846  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4847  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4848  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4849  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4850  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4851  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4852  			cpu-dsu3-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4853  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4854  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4855  				thermal-sensors = <&lvts 4>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4856  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4857  					cpu_dsu3_crit: cpu-dsu3-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4858  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4859  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4860  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4861  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4862  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4863  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4864  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4865  			cpu-3-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4866  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4867  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4868  				thermal-sensors = <&lvts 5>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4869  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4870  					cpu_little_core3_crit: cpu-little-core3-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4871  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4872  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4873  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4874  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4875  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4876  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4877  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4878  			cpu-0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4879  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4880  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4881  				thermal-sensors = <&lvts 6>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4882  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4883  					cpu_little_core0_crit: cpu-little-core0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4884  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4885  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4886  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4887  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4888  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4889  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4890  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4891  			cpu-1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4892  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4893  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4894  				thermal-sensors = <&lvts 7>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4895  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4896  					cpu_little_core1_crit: cpu-little-core1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4897  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4898  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4899  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4900  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4901  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4902  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4903  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4904  			cpu-2-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4905  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4906  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4907  				thermal-sensors = <&lvts 8>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4908  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4909  					cpu_little_core2_crit: cpu-little-core2-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4910  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4911  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4912  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4913  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4914  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4915  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4916  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4917  			cpu-4-0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4918  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4919  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4920  				thermal-sensors = <&lvts 9>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4921  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4922  					cpu_medium_core4_0_crit: cpu-medium-core4-0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4923  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4924  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4925  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4926  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4927  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4928  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4929  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4930  			cpu-4-1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4931  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4932  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4933  				thermal-sensors = <&lvts 10>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4934  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4935  					cpu_medium_core4_1_crit: cpu-medium-core4-1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4936  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4937  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4938  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4939  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4940  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4941  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4942  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4943  			cpu-5-0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4944  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4945  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4946  				thermal-sensors = <&lvts 11>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4947  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4948  					cpu_medium_core5_0_crit: cpu-medium-core5-0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4949  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4950  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4951  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4952  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4953  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4954  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4955  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4956  			cpu-5-1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4957  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4958  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4959  				thermal-sensors = <&lvts 12>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4960  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4961  					cpu_medium_core5_1_crit: cpu-medium-core5-1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4962  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4963  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4964  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4965  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4966  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4967  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4968  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4969  			cpu-dsu0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4970  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4971  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4972  				thermal-sensors = <&lvts 13>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4973  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4974  					cpu_dsu0_crit: cpu-dsu0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4975  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4976  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4977  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4978  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4979  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4980  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4981  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4982  			cpu-dsu1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4983  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4984  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4985  				thermal-sensors = <&lvts 14>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4986  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4987  					cpu_dsu1_crit: cpu-dsu1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4988  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4989  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4990  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4991  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4992  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4993  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4994  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4995  			cpu-7-0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4996  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4997  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4998  				thermal-sensors = <&lvts 15>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  4999  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5000  					cpu_big_core7_0_crit: cpu-big-core7-0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5001  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5002  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5003  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5004  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5005  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5006  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5007  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5008  			cpu-7-1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5009  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5010  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5011  				thermal-sensors = <&lvts 16>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5012  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5013  					cpu_big_core7_1_crit: cpu-big-core7-1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5014  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5015  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5016  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5017  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5018  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5019  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5020  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5021  			apu-a0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5022  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5023  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5024  				thermal-sensors = <&lvts 17>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5025  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5026  					apu_a0_crit: apu-a0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5027  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5028  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5029  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5030  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5031  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5032  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5033  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5034  			apu-a1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5035  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5036  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5037  				thermal-sensors = <&lvts 18>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5038  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5039  					apu_a1_crit: apu-a1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5040  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5041  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5042  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5043  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5044  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5045  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5046  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5047  			apu-a2-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5048  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5049  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5050  				thermal-sensors = <&lvts 19>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5051  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5052  					apu_a2_crit: apu-a2-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5053  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5054  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5055  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5056  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5057  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5058  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5059  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5060  			apu-a3-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5061  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5062  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5063  				thermal-sensors = <&lvts 20>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5064  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5065  					apu_a3_crit: apu-a3-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5066  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5067  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5068  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5069  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5070  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5071  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5072  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5073  			gpu0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5074  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5075  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5076  				thermal-sensors = <&lvts 21>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5077  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5078  					gpu0_crit: gpu0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5079  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5080  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5081  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5082  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5083  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5084  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5085  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5086  			gpu1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5087  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5088  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5089  				thermal-sensors = <&lvts 22>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5090  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5091  					gpu1_crit: gpu1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5092  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5093  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5094  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5095  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5096  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5097  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5098  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5099  			soc-top0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5100  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5101  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5102  				thermal-sensors = <&lvts 23>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5103  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5104  					soc_top0_crit: soc-top0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5105  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5106  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5107  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5108  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5109  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5110  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5111  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5112  			soc-top1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5113  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5114  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5115  				thermal-sensors = <&lvts 24>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5116  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5117  					soc_top1_crit: soc-top1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5118  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5119  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5120  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5121  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5122  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5123  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5124  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5125  			soc-top2-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5126  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5127  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5128  				thermal-sensors = <&lvts 25>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5129  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5130  					soc_top2_crit: soc-top2-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5131  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5132  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5133  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5134  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5135  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5136  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5137  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5138  			soc-top3-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5139  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5140  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5141  				thermal-sensors = <&lvts 26>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5142  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5143  					soc_top3_crit: soc-top3-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5144  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5145  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5146  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5147  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5148  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5149  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5150  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5151  			soc-bot0-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5152  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5153  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5154  				thermal-sensors = <&lvts 27>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5155  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5156  					soc_bot0_crit: soc-bot0-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5157  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5158  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5159  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5160  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5161  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5162  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5163  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5164  			soc-bot1-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5165  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5166  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5167  				thermal-sensors = <&lvts 28>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5168  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5169  					soc_bot1_crit: soc-bot1-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5170  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5171  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5172  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5173  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5174  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5175  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5176  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5177  			soc-bot2-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5178  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5179  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5180  				thermal-sensors = <&lvts 29>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5181  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5182  					soc_bot2_crit: soc-bot2-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5183  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5184  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5185  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5186  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5187  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5188  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5189  
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5190  			soc-bot3-thermal {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5191  				polling-delay = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5192  				polling-delay-passive = <0>; /* milliseconds */
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5193  				thermal-sensors = <&lvts 30>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5194  				trips {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5195  					soc_bot3_crit: soc-bot3-crit {
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5196  						temperature = <118800>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5197  						hysteresis = <2000>;
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5198  						type = "critical";
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5199  					};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5200  				};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5201  			};
4f541a49834f56 Zhaoqing Jiu   2024-06-25  5202  		};
2f2aff80fd0e0d Darren Ye      2024-04-01  5203  	};
2f2aff80fd0e0d Darren Ye      2024-04-01  5204  };
2f2aff80fd0e0d Darren Ye      2024-04-01  5205  

:::::: The code at line 2698 was first introduced by commit
:::::: 3a88be543121017097505213a7494def9c514427 CHROMIUM: arm64: dts: mt8196: Add MT8196 EVB dts

:::::: TO: Xavier Chang <xavier.chang@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
