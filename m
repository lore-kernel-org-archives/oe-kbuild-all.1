Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B05A23A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 05:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718689601; cv=none; b=IVeOC85EQ/urXXvxWXfdW/qf9EPLZIQnQcqwrYIktKwc6PkEqEEjvaWRKPujVMjLNa13ULzG8xT0bv+CtnfxkhjN5WEjDkncsWA0Iq1Wo9U6kHMwkFGvIkqT0VV2cXfGXpQ1Ig7AIcCFvhDHzs9C7dy6eY1uCabtQWS6iTFVgn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718689601; c=relaxed/simple;
	bh=pebFRORx5mjzsFeC/CmqnHMq0tPMjflNtjz2lFE8qGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OiFx8cRFLUQiIkHbSxN/nq4prAaK7iIvgaP8Z2CS6ZU1+vIEaBvPltZi7JuPODzkhgrKuZNHCwMVXQ91nHUGc8NIY5S5b6LFoWqMqbcf5BCM3kHiBPJRKuSU+XV6UbhXhtuBGHuWagTebCl79zdxGIOcM5YBKjWuYDxSpRnt4mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hO1PTyOh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO1PTyOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718689598; x=1750225598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pebFRORx5mjzsFeC/CmqnHMq0tPMjflNtjz2lFE8qGA=;
  b=hO1PTyOhC5mEciF/IBcGEaXwv+s4Y36xTsJiOqcftrHbM1KAmNzoVdrc
   +GMYgSjTdfXRTyViF5gkuXhE4P084seE41DezFsXAIia8yyC0PinN1XtA
   i37RLYm6exORk0WlVl0HSTmP46JSEJhLv8ttsRqMob60YEmHk2YcimhCd
   di1NpYmZAcjTF3WG905GkPhpzey9VnmTwNwiHnyRrU94YiU7tAQHD+hzZ
   +5Zs2+z0p8srVHyjgB0koxz578D2uJngtJUem6VyvHrIfYrcOm2RCMmsL
   hB97KcOtRhJ0pHcDuyelCwIQ9DqXhjEaC7uB0zz2So6YGEJ9TP72xpvDm
   g==;
X-CSE-ConnectionGUID: doERhZyXThqeKJ/rtEe0Yg==
X-CSE-MsgGUID: RhXH4d5UR/yOA5STu3Hrcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19403393"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="19403393"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 22:46:37 -0700
X-CSE-ConnectionGUID: BWIE68TrS1iaI55NXvZiPw==
X-CSE-MsgGUID: 1y+1RMp6RFyio27gt4HiRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="45966312"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2024 22:46:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJRfs-0005FF-2t;
	Tue, 18 Jun 2024 05:46:32 +0000
Date: Tue, 18 Jun 2024 13:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 4/4]
 arch/arm64/boot/dts/mediatek/mt8186.dtsi:1076.22-1088.5: Warning
 (avoid_unnecessary_addr_size): /soc/i2c@11008000: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202406181304.bFPuvQCV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   1e6542f4b8fb7e03cb09a0f0913645b0bd6182ce
commit: 1e6542f4b8fb7e03cb09a0f0913645b0bd6182ce [4/4] CHROMIUM: arm64: dts: mt8186: Update SKU settings for Veluza
config: arm64-randconfig-051-20240618 (https://download.01.org/0day-ci/archive/20240618/202406181304.bFPuvQCV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406181304.bFPuvQCV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406181304.bFPuvQCV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2184.30-2188.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2190.23-2194.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2196.35-2200.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:81.37-86.4: Warning (unit_address_vs_reg): /fixedregulator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:88.34-93.4: Warning (unit_address_vs_reg): /fixedregulator@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1006.35-1011.5: Warning (simple_bus_reg): /soc/mailbox@10686000: simple-bus unit address format error, expected "10686100"
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1013.35-1018.5: Warning (simple_bus_reg): /soc/mailbox@10687000: simple-bus unit address format error, expected "10687100"
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1907.23-1929.5: Warning (simple_bus_reg): /soc/venc@17000000: simple-bus unit address format error, expected "17020000"
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2053.30-2174.5: Warning (simple_bus_reg): /soc/opp-table-3: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2176.32-2293.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186.dtsi:1076.22-1088.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@11008000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8186-corsola-it6505.dtsi:43.28-118.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@1100f000/it6505dptx@5c: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1201.23-1211.5: Warning (unique_unit_address): /soc/lvts@1100b000: duplicate unit-address (also used in node /soc/svs@1100b000)
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1885.38-1889.5: Warning (unique_unit_address): /soc/clock-controller@17000000: duplicate unit-address (also used in node /soc/venc@17000000)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-it6505.dtsi:89.11-98.7: Warning (graph_child_address): /soc/i2c@1100f000/it6505dptx@5c/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8186-corsola-it6505.dtsi:106.11-115.7: Warning (graph_child_address): /soc/i2c@1100f000/it6505dptx@5c/switches/switch@1/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +1076 arch/arm64/boot/dts/mediatek/mt8186.dtsi

edd56b094be9fd Allen-KH Cheng      2022-08-26    17  
edd56b094be9fd Allen-KH Cheng      2022-08-26    18  / {
edd56b094be9fd Allen-KH Cheng      2022-08-26    19  	compatible = "mediatek,mt8186";
edd56b094be9fd Allen-KH Cheng      2022-08-26    20  	interrupt-parent = <&gic>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    21  	#address-cells = <2>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    22  	#size-cells = <2>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    23  
ff7be36d43490a Allen-kh Cheng      2022-05-11    24  	aliases {
ff7be36d43490a Allen-kh Cheng      2022-05-11    25  		rdma1 = &rdma1;
ff7be36d43490a Allen-kh Cheng      2022-05-11    26  	};
ff7be36d43490a Allen-kh Cheng      2022-05-11    27  
edd56b094be9fd Allen-KH Cheng      2022-08-26    28  	cpus {
edd56b094be9fd Allen-KH Cheng      2022-08-26    29  		#address-cells = <1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    30  		#size-cells = <0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    31  
edd56b094be9fd Allen-KH Cheng      2022-08-26    32  		cpu-map {
edd56b094be9fd Allen-KH Cheng      2022-08-26    33  			cluster0 {
edd56b094be9fd Allen-KH Cheng      2022-08-26    34  				core0 {
edd56b094be9fd Allen-KH Cheng      2022-08-26    35  					cpu = <&cpu0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    36  				};
edd56b094be9fd Allen-KH Cheng      2022-08-26    37  
edd56b094be9fd Allen-KH Cheng      2022-08-26    38  				core1 {
edd56b094be9fd Allen-KH Cheng      2022-08-26    39  					cpu = <&cpu1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    40  				};
edd56b094be9fd Allen-KH Cheng      2022-08-26    41  
edd56b094be9fd Allen-KH Cheng      2022-08-26    42  				core2 {
edd56b094be9fd Allen-KH Cheng      2022-08-26    43  					cpu = <&cpu2>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    44  				};
edd56b094be9fd Allen-KH Cheng      2022-08-26    45  
edd56b094be9fd Allen-KH Cheng      2022-08-26    46  				core3 {
edd56b094be9fd Allen-KH Cheng      2022-08-26    47  					cpu = <&cpu3>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    48  				};
edd56b094be9fd Allen-KH Cheng      2022-08-26    49  
edd56b094be9fd Allen-KH Cheng      2022-08-26    50  				core4 {
edd56b094be9fd Allen-KH Cheng      2022-08-26    51  					cpu = <&cpu4>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    52  				};
edd56b094be9fd Allen-KH Cheng      2022-08-26    53  
edd56b094be9fd Allen-KH Cheng      2022-08-26    54  				core5 {
edd56b094be9fd Allen-KH Cheng      2022-08-26    55  					cpu = <&cpu5>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    56  				};
edd56b094be9fd Allen-KH Cheng      2022-08-26    57  
365920684b6896 Linux Patches Robot 2023-02-21    58  				core6 {
edd56b094be9fd Allen-KH Cheng      2022-08-26    59  					cpu = <&cpu6>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    60  				};
edd56b094be9fd Allen-KH Cheng      2022-08-26    61  
365920684b6896 Linux Patches Robot 2023-02-21    62  				core7 {
edd56b094be9fd Allen-KH Cheng      2022-08-26    63  					cpu = <&cpu7>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    64  				};
edd56b094be9fd Allen-KH Cheng      2022-08-26    65  			};
edd56b094be9fd Allen-KH Cheng      2022-08-26    66  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26    67  
edd56b094be9fd Allen-KH Cheng      2022-08-26    68  		cpu0: cpu@0 {
edd56b094be9fd Allen-KH Cheng      2022-08-26    69  			device_type = "cpu";
edd56b094be9fd Allen-KH Cheng      2022-08-26    70  			compatible = "arm,cortex-a55";
edd56b094be9fd Allen-KH Cheng      2022-08-26    71  			reg = <0x000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    72  			enable-method = "psci";
edd56b094be9fd Allen-KH Cheng      2022-08-26    73  			clock-frequency = <2000000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19    74  			clocks = <&mcusys CLK_MCU_ARMPLL_LL_SEL>,
507cae21d7d58d Allen-kh Cheng      2022-07-19    75  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
507cae21d7d58d Allen-kh Cheng      2022-07-19    76  			clock-names = "cpu", "intermediate";
507cae21d7d58d Allen-kh Cheng      2022-07-19    77  			operating-points-v2 = <&cluster0_opp>;
507cae21d7d58d Allen-kh Cheng      2022-07-19    78  			dynamic-power-coefficient = <84>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    79  			capacity-dmips-mhz = <382>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    80  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    81  			next-level-cache = <&l2_0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    82  			#cooling-cells = <2>;
507cae21d7d58d Allen-kh Cheng      2022-07-19    83  			mediatek,cci = <&cci>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    84  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26    85  
edd56b094be9fd Allen-KH Cheng      2022-08-26    86  		cpu1: cpu@100 {
edd56b094be9fd Allen-KH Cheng      2022-08-26    87  			device_type = "cpu";
edd56b094be9fd Allen-KH Cheng      2022-08-26    88  			compatible = "arm,cortex-a55";
edd56b094be9fd Allen-KH Cheng      2022-08-26    89  			reg = <0x100>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    90  			enable-method = "psci";
edd56b094be9fd Allen-KH Cheng      2022-08-26    91  			clock-frequency = <2000000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19    92  			clocks = <&mcusys CLK_MCU_ARMPLL_LL_SEL>,
507cae21d7d58d Allen-kh Cheng      2022-07-19    93  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
507cae21d7d58d Allen-kh Cheng      2022-07-19    94  			clock-names = "cpu", "intermediate";
507cae21d7d58d Allen-kh Cheng      2022-07-19    95  			operating-points-v2 = <&cluster0_opp>;
507cae21d7d58d Allen-kh Cheng      2022-07-19    96  			dynamic-power-coefficient = <84>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    97  			capacity-dmips-mhz = <382>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    98  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
edd56b094be9fd Allen-KH Cheng      2022-08-26    99  			next-level-cache = <&l2_0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   100  			#cooling-cells = <2>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   101  			mediatek,cci = <&cci>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   102  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   103  
edd56b094be9fd Allen-KH Cheng      2022-08-26   104  		cpu2: cpu@200 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   105  			device_type = "cpu";
edd56b094be9fd Allen-KH Cheng      2022-08-26   106  			compatible = "arm,cortex-a55";
edd56b094be9fd Allen-KH Cheng      2022-08-26   107  			reg = <0x200>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   108  			enable-method = "psci";
edd56b094be9fd Allen-KH Cheng      2022-08-26   109  			clock-frequency = <2000000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   110  			clocks = <&mcusys CLK_MCU_ARMPLL_LL_SEL>,
507cae21d7d58d Allen-kh Cheng      2022-07-19   111  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   112  			clock-names = "cpu", "intermediate";
507cae21d7d58d Allen-kh Cheng      2022-07-19   113  			operating-points-v2 = <&cluster0_opp>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   114  			dynamic-power-coefficient = <84>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   115  			capacity-dmips-mhz = <382>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   116  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   117  			next-level-cache = <&l2_0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   118  			#cooling-cells = <2>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   119  			mediatek,cci = <&cci>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   120  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   121  
edd56b094be9fd Allen-KH Cheng      2022-08-26   122  		cpu3: cpu@300 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   123  			device_type = "cpu";
edd56b094be9fd Allen-KH Cheng      2022-08-26   124  			compatible = "arm,cortex-a55";
edd56b094be9fd Allen-KH Cheng      2022-08-26   125  			reg = <0x300>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   126  			enable-method = "psci";
edd56b094be9fd Allen-KH Cheng      2022-08-26   127  			clock-frequency = <2000000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   128  			clocks = <&mcusys CLK_MCU_ARMPLL_LL_SEL>,
507cae21d7d58d Allen-kh Cheng      2022-07-19   129  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   130  			clock-names = "cpu", "intermediate";
507cae21d7d58d Allen-kh Cheng      2022-07-19   131  			operating-points-v2 = <&cluster0_opp>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   132  			dynamic-power-coefficient = <84>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   133  			capacity-dmips-mhz = <382>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   134  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   135  			next-level-cache = <&l2_0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   136  			#cooling-cells = <2>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   137  			mediatek,cci = <&cci>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   138  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   139  
edd56b094be9fd Allen-KH Cheng      2022-08-26   140  		cpu4: cpu@400 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   141  			device_type = "cpu";
edd56b094be9fd Allen-KH Cheng      2022-08-26   142  			compatible = "arm,cortex-a55";
edd56b094be9fd Allen-KH Cheng      2022-08-26   143  			reg = <0x400>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   144  			enable-method = "psci";
edd56b094be9fd Allen-KH Cheng      2022-08-26   145  			clock-frequency = <2000000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   146  			clocks = <&mcusys CLK_MCU_ARMPLL_LL_SEL>,
507cae21d7d58d Allen-kh Cheng      2022-07-19   147  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   148  			clock-names = "cpu", "intermediate";
507cae21d7d58d Allen-kh Cheng      2022-07-19   149  			operating-points-v2 = <&cluster0_opp>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   150  			dynamic-power-coefficient = <84>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   151  			capacity-dmips-mhz = <382>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   152  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   153  			next-level-cache = <&l2_0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   154  			#cooling-cells = <2>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   155  			mediatek,cci = <&cci>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   156  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   157  
edd56b094be9fd Allen-KH Cheng      2022-08-26   158  		cpu5: cpu@500 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   159  			device_type = "cpu";
edd56b094be9fd Allen-KH Cheng      2022-08-26   160  			compatible = "arm,cortex-a55";
edd56b094be9fd Allen-KH Cheng      2022-08-26   161  			reg = <0x500>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   162  			enable-method = "psci";
edd56b094be9fd Allen-KH Cheng      2022-08-26   163  			clock-frequency = <2000000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   164  			clocks = <&mcusys CLK_MCU_ARMPLL_LL_SEL>,
507cae21d7d58d Allen-kh Cheng      2022-07-19   165  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   166  			clock-names = "cpu", "intermediate";
507cae21d7d58d Allen-kh Cheng      2022-07-19   167  			operating-points-v2 = <&cluster0_opp>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   168  			dynamic-power-coefficient = <84>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   169  			capacity-dmips-mhz = <382>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   170  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   171  			next-level-cache = <&l2_0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   172  			#cooling-cells = <2>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   173  			mediatek,cci = <&cci>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   174  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   175  
edd56b094be9fd Allen-KH Cheng      2022-08-26   176  		cpu6: cpu@600 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   177  			device_type = "cpu";
edd56b094be9fd Allen-KH Cheng      2022-08-26   178  			compatible = "arm,cortex-a76";
edd56b094be9fd Allen-KH Cheng      2022-08-26   179  			reg = <0x600>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   180  			enable-method = "psci";
edd56b094be9fd Allen-KH Cheng      2022-08-26   181  			clock-frequency = <2050000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   182  			clocks = <&mcusys CLK_MCU_ARMPLL_BL_SEL>,
507cae21d7d58d Allen-kh Cheng      2022-07-19   183  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   184  			clock-names = "cpu", "intermediate";
507cae21d7d58d Allen-kh Cheng      2022-07-19   185  			operating-points-v2 = <&cluster1_opp>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   186  			dynamic-power-coefficient = <335>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   187  			capacity-dmips-mhz = <1024>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   188  			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   189  			next-level-cache = <&l2_1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   190  			#cooling-cells = <2>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   191  			mediatek,cci = <&cci>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   192  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   193  
edd56b094be9fd Allen-KH Cheng      2022-08-26   194  		cpu7: cpu@700 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   195  			device_type = "cpu";
edd56b094be9fd Allen-KH Cheng      2022-08-26   196  			compatible = "arm,cortex-a76";
edd56b094be9fd Allen-KH Cheng      2022-08-26   197  			reg = <0x700>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   198  			enable-method = "psci";
edd56b094be9fd Allen-KH Cheng      2022-08-26   199  			clock-frequency = <2050000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   200  			clocks = <&mcusys CLK_MCU_ARMPLL_BL_SEL>,
507cae21d7d58d Allen-kh Cheng      2022-07-19   201  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   202  			clock-names = "cpu", "intermediate";
507cae21d7d58d Allen-kh Cheng      2022-07-19   203  			operating-points-v2 = <&cluster1_opp>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   204  			dynamic-power-coefficient = <335>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   205  			capacity-dmips-mhz = <1024>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   206  			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   207  			next-level-cache = <&l2_1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   208  			#cooling-cells = <2>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   209  			mediatek,cci = <&cci>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   210  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   211  
edd56b094be9fd Allen-KH Cheng      2022-08-26   212  		idle-states {
edd56b094be9fd Allen-KH Cheng      2022-08-26   213  			entry-method = "psci";
edd56b094be9fd Allen-KH Cheng      2022-08-26   214  
edd56b094be9fd Allen-KH Cheng      2022-08-26   215  			cpu_off_l: cpu-off-l {
edd56b094be9fd Allen-KH Cheng      2022-08-26   216  				compatible = "arm,idle-state";
edd56b094be9fd Allen-KH Cheng      2022-08-26   217  				arm,psci-suspend-param = <0x00010001>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   218  				local-timer-stop;
edd56b094be9fd Allen-KH Cheng      2022-08-26   219  				entry-latency-us = <50>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   220  				exit-latency-us = <100>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   221  				min-residency-us = <1600>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   222  			};
edd56b094be9fd Allen-KH Cheng      2022-08-26   223  
edd56b094be9fd Allen-KH Cheng      2022-08-26   224  			cpu_off_b: cpu-off-b {
edd56b094be9fd Allen-KH Cheng      2022-08-26   225  				compatible = "arm,idle-state";
edd56b094be9fd Allen-KH Cheng      2022-08-26   226  				arm,psci-suspend-param = <0x00010001>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   227  				local-timer-stop;
edd56b094be9fd Allen-KH Cheng      2022-08-26   228  				entry-latency-us = <50>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   229  				exit-latency-us = <100>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   230  				min-residency-us = <1400>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   231  			};
edd56b094be9fd Allen-KH Cheng      2022-08-26   232  
edd56b094be9fd Allen-KH Cheng      2022-08-26   233  			cluster_off_l: cluster-off-l {
edd56b094be9fd Allen-KH Cheng      2022-08-26   234  				compatible = "arm,idle-state";
edd56b094be9fd Allen-KH Cheng      2022-08-26   235  				arm,psci-suspend-param = <0x01010001>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   236  				local-timer-stop;
edd56b094be9fd Allen-KH Cheng      2022-08-26   237  				entry-latency-us = <100>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   238  				exit-latency-us = <250>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   239  				min-residency-us = <2100>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   240  			};
edd56b094be9fd Allen-KH Cheng      2022-08-26   241  
edd56b094be9fd Allen-KH Cheng      2022-08-26   242  			cluster_off_b: cluster-off-b {
edd56b094be9fd Allen-KH Cheng      2022-08-26   243  				compatible = "arm,idle-state";
edd56b094be9fd Allen-KH Cheng      2022-08-26   244  				arm,psci-suspend-param = <0x01010001>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   245  				local-timer-stop;
edd56b094be9fd Allen-KH Cheng      2022-08-26   246  				entry-latency-us = <100>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   247  				exit-latency-us = <250>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   248  				min-residency-us = <1900>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   249  			};
edd56b094be9fd Allen-KH Cheng      2022-08-26   250  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   251  
edd56b094be9fd Allen-KH Cheng      2022-08-26   252  		l2_0: l2-cache0 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   253  			compatible = "cache";
edd56b094be9fd Allen-KH Cheng      2022-08-26   254  			next-level-cache = <&l3_0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   255  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   256  
edd56b094be9fd Allen-KH Cheng      2022-08-26   257  		l2_1: l2-cache1 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   258  			compatible = "cache";
edd56b094be9fd Allen-KH Cheng      2022-08-26   259  			next-level-cache = <&l3_0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   260  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   261  
edd56b094be9fd Allen-KH Cheng      2022-08-26   262  		l3_0: l3-cache {
edd56b094be9fd Allen-KH Cheng      2022-08-26   263  			compatible = "cache";
edd56b094be9fd Allen-KH Cheng      2022-08-26   264  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   265  	};
edd56b094be9fd Allen-KH Cheng      2022-08-26   266  
507cae21d7d58d Allen-kh Cheng      2022-07-19   267  	cluster0_opp: opp-table-0 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   268  		compatible = "operating-points-v2";
507cae21d7d58d Allen-kh Cheng      2022-07-19   269  		opp-shared;
507cae21d7d58d Allen-kh Cheng      2022-07-19   270  
507cae21d7d58d Allen-kh Cheng      2022-07-19   271  		opp0_00: opp-500000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   272  			opp-hz = /bits/ 64 <500000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   273  			opp-microvolt = <600000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   274  			opp-level = <15>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   275  			required-opps = <&opp2_00>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   276  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   277  
507cae21d7d58d Allen-kh Cheng      2022-07-19   278  		opp0_01: opp-774000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   279  			opp-hz = /bits/ 64 <774000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   280  			opp-microvolt = <675000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   281  			opp-level = <14>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   282  			required-opps = <&opp2_01>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   283  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   284  
507cae21d7d58d Allen-kh Cheng      2022-07-19   285  		opp0_02: opp-875000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   286  			opp-hz = /bits/ 64 <875000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   287  			opp-microvolt = <700000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   288  			opp-level = <13>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   289  			required-opps = <&opp2_02>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   290  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   291  
507cae21d7d58d Allen-kh Cheng      2022-07-19   292  		opp0_03: opp-975000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   293  			opp-hz = /bits/ 64 <975000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   294  			opp-microvolt = <725000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   295  			opp-level = <12>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   296  			required-opps = <&opp2_03>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   297  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   298  
507cae21d7d58d Allen-kh Cheng      2022-07-19   299  		opp0_04: opp-1075000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   300  			opp-hz = /bits/ 64 <1075000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   301  			opp-microvolt = <750000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   302  			opp-level = <11>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   303  			required-opps = <&opp2_04>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   304  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   305  
507cae21d7d58d Allen-kh Cheng      2022-07-19   306  		opp0_05: opp-1175000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   307  			opp-hz = /bits/ 64 <1175000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   308  			opp-microvolt = <775000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   309  			opp-level = <10>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   310  			required-opps = <&opp2_05>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   311  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   312  
507cae21d7d58d Allen-kh Cheng      2022-07-19   313  		opp0_06: opp-1275000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   314  			opp-hz = /bits/ 64 <1275000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   315  			opp-microvolt = <800000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   316  			opp-level = <9>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   317  			required-opps = <&opp2_06>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   318  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   319  
507cae21d7d58d Allen-kh Cheng      2022-07-19   320  		opp0_07: opp-1375000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   321  			opp-hz = /bits/ 64 <1375000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   322  			opp-microvolt = <825000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   323  			opp-level = <8>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   324  			required-opps = <&opp2_07>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   325  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   326  
507cae21d7d58d Allen-kh Cheng      2022-07-19   327  		opp0_08: opp-1500000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   328  			opp-hz = /bits/ 64 <1500000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   329  			opp-microvolt = <856250>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   330  			opp-level = <7>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   331  			required-opps = <&opp2_08>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   332  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   333  
507cae21d7d58d Allen-kh Cheng      2022-07-19   334  		opp0_09: opp-1618000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   335  			opp-hz = /bits/ 64 <1618000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   336  			opp-microvolt = <875000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   337  			opp-level = <6>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   338  			required-opps = <&opp2_09>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   339  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   340  
507cae21d7d58d Allen-kh Cheng      2022-07-19   341  		opp0_10: opp-1666000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   342  			opp-hz = /bits/ 64 <1666000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   343  			opp-microvolt = <900000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   344  			opp-level = <5>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   345  			required-opps = <&opp2_10>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   346  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   347  
507cae21d7d58d Allen-kh Cheng      2022-07-19   348  		opp0_11: opp-1733000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   349  			opp-hz = /bits/ 64 <1733000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   350  			opp-microvolt = <925000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   351  			opp-level = <4>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   352  			required-opps = <&opp2_11>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   353  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   354  
507cae21d7d58d Allen-kh Cheng      2022-07-19   355  		opp0_12: opp-1800000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   356  			opp-hz = /bits/ 64 <1800000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   357  			opp-microvolt = <950000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   358  			opp-level = <3>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   359  			required-opps = <&opp2_12>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   360  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   361  
507cae21d7d58d Allen-kh Cheng      2022-07-19   362  		opp0_13: opp-1866000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   363  			opp-hz = /bits/ 64 <1866000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   364  			opp-microvolt = <981250>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   365  			opp-level = <2>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   366  			required-opps = <&opp2_13>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   367  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   368  
507cae21d7d58d Allen-kh Cheng      2022-07-19   369  		opp0_14: opp-1933000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   370  			opp-hz = /bits/ 64 <1933000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   371  			opp-microvolt = <1006250>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   372  			opp-level = <1>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   373  			required-opps = <&opp2_14>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   374  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   375  
507cae21d7d58d Allen-kh Cheng      2022-07-19   376  		opp0_15: opp-2000000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   377  			opp-hz = /bits/ 64 <2000000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   378  			opp-microvolt = <1031250>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   379  			opp-level = <0>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   380  			required-opps = <&opp2_15>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   381  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   382  	};
507cae21d7d58d Allen-kh Cheng      2022-07-19   383  
507cae21d7d58d Allen-kh Cheng      2022-07-19   384  	cluster1_opp: opp-table-1 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   385  		compatible = "operating-points-v2";
507cae21d7d58d Allen-kh Cheng      2022-07-19   386  		opp-shared;
507cae21d7d58d Allen-kh Cheng      2022-07-19   387  
507cae21d7d58d Allen-kh Cheng      2022-07-19   388  		opp1_00: opp-774000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   389  			opp-hz = /bits/ 64 <774000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   390  			opp-microvolt = <675000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   391  			opp-level = <15>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   392  			required-opps = <&opp2_00>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   393  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   394  
507cae21d7d58d Allen-kh Cheng      2022-07-19   395  		opp1_01: opp-835000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   396  			opp-hz = /bits/ 64 <835000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   397  			opp-microvolt = <693750>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   398  			opp-level = <14>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   399  			required-opps = <&opp2_01>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   400  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   401  
507cae21d7d58d Allen-kh Cheng      2022-07-19   402  		opp1_02: opp-919000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   403  			opp-hz = /bits/ 64 <919000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   404  			opp-microvolt = <718750>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   405  			opp-level = <13>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   406  			required-opps = <&opp2_02>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   407  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   408  
507cae21d7d58d Allen-kh Cheng      2022-07-19   409  		opp1_03: opp-1002000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   410  			opp-hz = /bits/ 64 <1002000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   411  			opp-microvolt = <743750>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   412  			opp-level = <12>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   413  			required-opps = <&opp2_03>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   414  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   415  
507cae21d7d58d Allen-kh Cheng      2022-07-19   416  		opp1_04: opp-1085000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   417  			opp-hz = /bits/ 64 <1085000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   418  			opp-microvolt = <775000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   419  			opp-level = <11>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   420  			required-opps = <&opp2_04>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   421  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   422  
507cae21d7d58d Allen-kh Cheng      2022-07-19   423  		opp1_05: opp-1169000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   424  			opp-hz = /bits/ 64 <1169000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   425  			opp-microvolt = <800000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   426  			opp-level = <10>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   427  			required-opps = <&opp2_05>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   428  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   429  
507cae21d7d58d Allen-kh Cheng      2022-07-19   430  		opp1_06: opp-1308000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   431  			opp-hz = /bits/ 64 <1308000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   432  			opp-microvolt = <843750>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   433  			opp-level = <9>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   434  			required-opps = <&opp2_06>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   435  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   436  
507cae21d7d58d Allen-kh Cheng      2022-07-19   437  		opp1_07: opp-1419000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   438  			opp-hz = /bits/ 64 <1419000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   439  			opp-microvolt = <875000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   440  			opp-level = <8>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   441  			required-opps = <&opp2_07>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   442  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   443  
507cae21d7d58d Allen-kh Cheng      2022-07-19   444  		opp1_08: opp-1530000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   445  			opp-hz = /bits/ 64 <1530000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   446  			opp-microvolt = <912500>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   447  			opp-level = <7>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   448  			required-opps = <&opp2_08>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   449  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   450  
507cae21d7d58d Allen-kh Cheng      2022-07-19   451  		opp1_09: opp-1670000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   452  			opp-hz = /bits/ 64 <1670000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   453  			opp-microvolt = <956250>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   454  			opp-level = <6>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   455  			required-opps = <&opp2_09>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   456  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   457  
507cae21d7d58d Allen-kh Cheng      2022-07-19   458  		opp1_10: opp-1733000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   459  			opp-hz = /bits/ 64 <1733000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   460  			opp-microvolt = <981250>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   461  			opp-level = <5>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   462  			required-opps = <&opp2_10>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   463  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   464  
507cae21d7d58d Allen-kh Cheng      2022-07-19   465  		opp1_11: opp-1796000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   466  			opp-hz = /bits/ 64 <1796000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   467  			opp-microvolt = <1012500>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   468  			opp-level = <4>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   469  			required-opps = <&opp2_11>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   470  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   471  
507cae21d7d58d Allen-kh Cheng      2022-07-19   472  		opp1_12: opp-1860000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   473  			opp-hz = /bits/ 64 <1860000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   474  			opp-microvolt = <1037500>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   475  			opp-level = <3>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   476  			required-opps = <&opp2_12>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   477  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   478  
507cae21d7d58d Allen-kh Cheng      2022-07-19   479  		opp1_13: opp-1923000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   480  			opp-hz = /bits/ 64 <1923000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   481  			opp-microvolt = <1062500>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   482  			opp-level = <2>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   483  			required-opps = <&opp2_13>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   484  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   485  
507cae21d7d58d Allen-kh Cheng      2022-07-19   486  		opp1_14: opp-1986000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   487  			opp-hz = /bits/ 64 <1986000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   488  			opp-microvolt = <1093750>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   489  			opp-level = <1>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   490  			required-opps = <&opp2_14>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   491  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   492  
507cae21d7d58d Allen-kh Cheng      2022-07-19   493  		opp1_15: opp-2050000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   494  			opp-hz = /bits/ 64 <2050000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   495  			opp-microvolt = <1118750>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   496  			opp-level = <0>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   497  			required-opps = <&opp2_15>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   498  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   499  	};
507cae21d7d58d Allen-kh Cheng      2022-07-19   500  
507cae21d7d58d Allen-kh Cheng      2022-07-19   501  	cci_opp: opp-table-2 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   502  		compatible = "operating-points-v2";
507cae21d7d58d Allen-kh Cheng      2022-07-19   503  		opp-shared;
507cae21d7d58d Allen-kh Cheng      2022-07-19   504  
e0ed0a6059d621 Mark Tseng          2023-09-14   505  		opp2_00: opp-1050000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   506  			opp-hz = /bits/ 64 <1050000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   507  			opp-microvolt = <843750>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   508  			opp-level = <15>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   509  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   510  
e0ed0a6059d621 Mark Tseng          2023-09-14   511  		opp2_01: opp-1073000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   512  			opp-hz = /bits/ 64 <1073000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   513  			opp-microvolt = <850000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   514  			opp-level = <14>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   515  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   516  
e0ed0a6059d621 Mark Tseng          2023-09-14   517  		opp2_02: opp-1096000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   518  			opp-hz = /bits/ 64 <1096000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   519  			opp-microvolt = <856250>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   520  			opp-level = <13>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   521  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   522  
e0ed0a6059d621 Mark Tseng          2023-09-14   523  		opp2_03: opp-1120000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   524  			opp-hz = /bits/ 64 <1120000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   525  			opp-microvolt = <862500>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   526  			opp-level = <12>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   527  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   528  
e0ed0a6059d621 Mark Tseng          2023-09-14   529  		opp2_04: opp-1143000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   530  			opp-hz = /bits/ 64 <1143000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   531  			opp-microvolt = <881250>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   532  			opp-level = <11>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   533  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   534  
e0ed0a6059d621 Mark Tseng          2023-09-14   535  		opp2_05: opp-1166000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   536  			opp-hz = /bits/ 64 <1166000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   537  			opp-microvolt = <893750>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   538  			opp-level = <10>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   539  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   540  
e0ed0a6059d621 Mark Tseng          2023-09-14   541  		opp2_06: opp-1190000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   542  			opp-hz = /bits/ 64 <1190000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   543  			opp-microvolt = <906250>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   544  			opp-level = <9>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   545  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   546  
e0ed0a6059d621 Mark Tseng          2023-09-14   547  		opp2_07: opp-1213000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   548  			opp-hz = /bits/ 64 <1213000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   549  			opp-microvolt = <918750>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   550  			opp-level = <8>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   551  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   552  
e0ed0a6059d621 Mark Tseng          2023-09-14   553  		opp2_08: opp-1236000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   554  			opp-hz = /bits/ 64 <1236000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   555  			opp-microvolt = <937500>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   556  			opp-level = <7>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   557  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   558  
e0ed0a6059d621 Mark Tseng          2023-09-14   559  		opp2_09: opp-1260000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   560  			opp-hz = /bits/ 64 <1260000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   561  			opp-microvolt = <950000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   562  			opp-level = <6>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   563  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   564  
e0ed0a6059d621 Mark Tseng          2023-09-14   565  		opp2_10: opp-1283000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   566  			opp-hz = /bits/ 64 <1283000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   567  			opp-microvolt = <962500>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   568  			opp-level = <5>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   569  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   570  
e0ed0a6059d621 Mark Tseng          2023-09-14   571  		opp2_11: opp-1306000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   572  			opp-hz = /bits/ 64 <1306000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   573  			opp-microvolt = <975000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   574  			opp-level = <4>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   575  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   576  
e0ed0a6059d621 Mark Tseng          2023-09-14   577  		opp2_12: opp-1330000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   578  			opp-hz = /bits/ 64 <1330000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   579  			opp-microvolt = <993750>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   580  			opp-level = <3>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   581  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   582  
e0ed0a6059d621 Mark Tseng          2023-09-14   583  		opp2_13: opp-1353000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   584  			opp-hz = /bits/ 64 <1353000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   585  			opp-microvolt = <1006250>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   586  			opp-level = <2>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   587  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   588  
e0ed0a6059d621 Mark Tseng          2023-09-14   589  		opp2_14: opp-1376000000 {
e0ed0a6059d621 Mark Tseng          2023-09-14   590  			opp-hz = /bits/ 64 <1376000000>;
e0ed0a6059d621 Mark Tseng          2023-09-14   591  			opp-microvolt = <1018750>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   592  			opp-level = <1>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   593  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   594  
507cae21d7d58d Allen-kh Cheng      2022-07-19   595  		opp2_15: opp-1400000000 {
507cae21d7d58d Allen-kh Cheng      2022-07-19   596  			opp-hz = /bits/ 64 <1400000000>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   597  			opp-microvolt = <1031250>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   598  			opp-level = <0>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   599  		};
507cae21d7d58d Allen-kh Cheng      2022-07-19   600  	};
507cae21d7d58d Allen-kh Cheng      2022-07-19   601  
5ddedccfea86e0 Linux Patches Robot 2023-02-22   602  	clk13m: fixed-factor-clock-13m {
5ddedccfea86e0 Linux Patches Robot 2023-02-22   603  		compatible = "fixed-factor-clock";
edd56b094be9fd Allen-KH Cheng      2022-08-26   604  		#clock-cells = <0>;
5ddedccfea86e0 Linux Patches Robot 2023-02-22   605  		clocks = <&clk26m>;
5ddedccfea86e0 Linux Patches Robot 2023-02-22   606  		clock-div = <2>;
5ddedccfea86e0 Linux Patches Robot 2023-02-22   607  		clock-mult = <1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   608  		clock-output-names = "clk13m";
edd56b094be9fd Allen-KH Cheng      2022-08-26   609  	};
edd56b094be9fd Allen-KH Cheng      2022-08-26   610  
edd56b094be9fd Allen-KH Cheng      2022-08-26   611  	clk26m: oscillator-26m {
edd56b094be9fd Allen-KH Cheng      2022-08-26   612  		compatible = "fixed-clock";
edd56b094be9fd Allen-KH Cheng      2022-08-26   613  		#clock-cells = <0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   614  		clock-frequency = <26000000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   615  		clock-output-names = "clk26m";
edd56b094be9fd Allen-KH Cheng      2022-08-26   616  	};
edd56b094be9fd Allen-KH Cheng      2022-08-26   617  
edd56b094be9fd Allen-KH Cheng      2022-08-26   618  	clk32k: oscillator-32k {
edd56b094be9fd Allen-KH Cheng      2022-08-26   619  		compatible = "fixed-clock";
edd56b094be9fd Allen-KH Cheng      2022-08-26   620  		#clock-cells = <0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   621  		clock-frequency = <32768>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   622  		clock-output-names = "clk32k";
edd56b094be9fd Allen-KH Cheng      2022-08-26   623  	};
edd56b094be9fd Allen-KH Cheng      2022-08-26   624  
edd56b094be9fd Allen-KH Cheng      2022-08-26   625  	pmu-a55 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   626  		compatible = "arm,cortex-a55-pmu";
edd56b094be9fd Allen-KH Cheng      2022-08-26   627  		interrupt-parent = <&gic>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   628  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   629  	};
edd56b094be9fd Allen-KH Cheng      2022-08-26   630  
edd56b094be9fd Allen-KH Cheng      2022-08-26   631  	pmu-a76 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   632  		compatible = "arm,cortex-a76-pmu";
edd56b094be9fd Allen-KH Cheng      2022-08-26   633  		interrupt-parent = <&gic>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   634  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   635  	};
edd56b094be9fd Allen-KH Cheng      2022-08-26   636  
edd56b094be9fd Allen-KH Cheng      2022-08-26   637  	psci {
edd56b094be9fd Allen-KH Cheng      2022-08-26   638  		compatible = "arm,psci-1.0";
edd56b094be9fd Allen-KH Cheng      2022-08-26   639  		method = "smc";
edd56b094be9fd Allen-KH Cheng      2022-08-26   640  	};
edd56b094be9fd Allen-KH Cheng      2022-08-26   641  
edd56b094be9fd Allen-KH Cheng      2022-08-26   642  	timer {
edd56b094be9fd Allen-KH Cheng      2022-08-26   643  		compatible = "arm,armv8-timer";
edd56b094be9fd Allen-KH Cheng      2022-08-26   644  		interrupt-parent = <&gic>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   645  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   646  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   647  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   648  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   649  	};
edd56b094be9fd Allen-KH Cheng      2022-08-26   650  
507cae21d7d58d Allen-kh Cheng      2022-07-19   651  	cci: cci {
507cae21d7d58d Allen-kh Cheng      2022-07-19   652  		compatible = "mediatek,mt8186-cci";
507cae21d7d58d Allen-kh Cheng      2022-07-19   653  		clocks = <&mcusys CLK_MCU_ARMPLL_BUS_SEL>,
507cae21d7d58d Allen-kh Cheng      2022-07-19   654  			 <&apmixedsys CLK_APMIXED_MAINPLL>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   655  		clock-names = "cci", "intermediate";
507cae21d7d58d Allen-kh Cheng      2022-07-19   656  		operating-points-v2 = <&cci_opp>;
507cae21d7d58d Allen-kh Cheng      2022-07-19   657  	};
507cae21d7d58d Allen-kh Cheng      2022-07-19   658  
edd56b094be9fd Allen-KH Cheng      2022-08-26   659  	soc {
edd56b094be9fd Allen-KH Cheng      2022-08-26   660  		#address-cells = <2>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   661  		#size-cells = <2>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   662  		compatible = "simple-bus";
edd56b094be9fd Allen-KH Cheng      2022-08-26   663  		ranges;
edd56b094be9fd Allen-KH Cheng      2022-08-26   664  
edd56b094be9fd Allen-KH Cheng      2022-08-26   665  		gic: interrupt-controller@c000000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   666  			compatible = "arm,gic-v3";
edd56b094be9fd Allen-KH Cheng      2022-08-26   667  			#interrupt-cells = <4>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   668  			#redistributor-regions = <1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   669  			interrupt-parent = <&gic>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   670  			interrupt-controller;
edd56b094be9fd Allen-KH Cheng      2022-08-26   671  			reg = <0 0x0c000000 0 0x40000>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   672  			      <0 0x0c040000 0 0x200000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   673  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   674  
edd56b094be9fd Allen-KH Cheng      2022-08-26   675  			ppi-partitions {
edd56b094be9fd Allen-KH Cheng      2022-08-26   676  				ppi_cluster0: interrupt-partition-0 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   677  					affinity = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   678  				};
edd56b094be9fd Allen-KH Cheng      2022-08-26   679  
edd56b094be9fd Allen-KH Cheng      2022-08-26   680  				ppi_cluster1: interrupt-partition-1 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   681  					affinity = <&cpu6 &cpu7>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   682  				};
edd56b094be9fd Allen-KH Cheng      2022-08-26   683  			};
edd56b094be9fd Allen-KH Cheng      2022-08-26   684  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   685  
edd56b094be9fd Allen-KH Cheng      2022-08-26   686  		mcusys: syscon@c53a000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   687  			compatible = "mediatek,mt8186-mcusys", "syscon";
edd56b094be9fd Allen-KH Cheng      2022-08-26   688  			reg = <0 0xc53a000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   689  			#clock-cells = <1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   690  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   691  
edd56b094be9fd Allen-KH Cheng      2022-08-26   692  		topckgen: syscon@10000000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   693  			compatible = "mediatek,mt8186-topckgen", "syscon";
edd56b094be9fd Allen-KH Cheng      2022-08-26   694  			reg = <0 0x10000000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   695  			#clock-cells = <1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   696  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   697  
edd56b094be9fd Allen-KH Cheng      2022-08-26   698  		infracfg_ao: syscon@10001000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   699  			compatible = "mediatek,mt8186-infracfg_ao", "syscon";
edd56b094be9fd Allen-KH Cheng      2022-08-26   700  			reg = <0 0x10001000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   701  			#clock-cells = <1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   702  			#reset-cells = <1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   703  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   704  
edd56b094be9fd Allen-KH Cheng      2022-08-26   705  		pericfg: syscon@10003000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   706  			compatible = "mediatek,mt8186-pericfg", "syscon";
edd56b094be9fd Allen-KH Cheng      2022-08-26   707  			reg = <0 0x10003000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   708  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   709  
edd56b094be9fd Allen-KH Cheng      2022-08-26   710  		pio: pinctrl@10005000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   711  			compatible = "mediatek,mt8186-pinctrl";
edd56b094be9fd Allen-KH Cheng      2022-08-26   712  			reg = <0 0x10005000 0 0x1000>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   713  			      <0 0x10002000 0 0x0200>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   714  			      <0 0x10002200 0 0x0200>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   715  			      <0 0x10002400 0 0x0200>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   716  			      <0 0x10002600 0 0x0200>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   717  			      <0 0x10002a00 0 0x0200>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   718  			      <0 0x10002c00 0 0x0200>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   719  			      <0 0x1000b000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   720  			reg-names = "iocfg0", "iocfg_lt", "iocfg_lm", "iocfg_lb",
edd56b094be9fd Allen-KH Cheng      2022-08-26   721  				    "iocfg_bl", "iocfg_rb", "iocfg_rt", "eint";
edd56b094be9fd Allen-KH Cheng      2022-08-26   722  			gpio-controller;
edd56b094be9fd Allen-KH Cheng      2022-08-26   723  			#gpio-cells = <2>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   724  			gpio-ranges = <&pio 0 0 185>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   725  			interrupt-controller;
edd56b094be9fd Allen-KH Cheng      2022-08-26   726  			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH 0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   727  			#interrupt-cells = <2>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   728  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   729  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   730  		scpsys: syscon@10006000 {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   731  			compatible = "mediatek,mt8186-scpsys", "syscon", "simple-mfd";
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   732  			reg = <0 0x10006000 0 0x1000>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   733  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   734  			/* System Power Manager */
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   735  			spm: power-controller {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   736  				compatible = "mediatek,mt8186-power-controller";
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   737  				#address-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   738  				#size-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   739  				#power-domain-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   740  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   741  				/* power domain of the SoC */
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   742  				mfg0: power-domain@MT8186_POWER_DOMAIN_MFG0 {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   743  					reg = <MT8186_POWER_DOMAIN_MFG0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   744  					clocks = <&topckgen CLK_TOP_MFG>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   745  					clock-names = "mfg00";
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   746  					#address-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   747  					#size-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   748  					#power-domain-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   749  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   750  					power-domain@MT8186_POWER_DOMAIN_MFG1 {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   751  						reg = <MT8186_POWER_DOMAIN_MFG1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   752  						mediatek,infracfg = <&infracfg_ao>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   753  						#address-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   754  						#size-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   755  						#power-domain-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   756  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   757  						power-domain@MT8186_POWER_DOMAIN_MFG2 {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   758  							reg = <MT8186_POWER_DOMAIN_MFG2>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   759  							#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   760  						};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   761  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   762  						power-domain@MT8186_POWER_DOMAIN_MFG3 {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   763  							reg = <MT8186_POWER_DOMAIN_MFG3>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   764  							#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   765  						};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   766  					};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   767  				};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   768  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   769  				power-domain@MT8186_POWER_DOMAIN_CSIRX_TOP {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   770  					reg = <MT8186_POWER_DOMAIN_CSIRX_TOP>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   771  					clocks = <&topckgen CLK_TOP_SENINF>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   772  						 <&topckgen CLK_TOP_SENINF1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   773  					clock-names = "csirx_top0", "csirx_top1";
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   774  					#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   775  				};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   776  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   777  				power-domain@MT8186_POWER_DOMAIN_SSUSB {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   778  					reg = <MT8186_POWER_DOMAIN_SSUSB>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   779  					#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   780  				};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   781  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   782  				power-domain@MT8186_POWER_DOMAIN_SSUSB_P1 {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   783  					reg = <MT8186_POWER_DOMAIN_SSUSB_P1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   784  					#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   785  				};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   786  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   787  				power-domain@MT8186_POWER_DOMAIN_ADSP_AO {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   788  					reg = <MT8186_POWER_DOMAIN_ADSP_AO>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   789  					clocks = <&topckgen CLK_TOP_AUDIODSP>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   790  						 <&topckgen CLK_TOP_ADSP_BUS>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   791  					clock-names = "adsp_ao0", "adsp_ao1";
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   792  					#address-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   793  					#size-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   794  					#power-domain-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   795  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   796  					power-domain@MT8186_POWER_DOMAIN_ADSP_INFRA {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   797  						reg = <MT8186_POWER_DOMAIN_ADSP_INFRA>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   798  						#address-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   799  						#size-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   800  						#power-domain-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   801  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   802  						power-domain@MT8186_POWER_DOMAIN_ADSP_TOP {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   803  							reg = <MT8186_POWER_DOMAIN_ADSP_TOP>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   804  							mediatek,infracfg = <&infracfg_ao>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   805  							#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   806  						};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   807  					};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   808  				};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   809  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   810  				power-domain@MT8186_POWER_DOMAIN_CONN_ON {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   811  					reg = <MT8186_POWER_DOMAIN_CONN_ON>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   812  					mediatek,infracfg = <&infracfg_ao>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   813  					#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   814  				};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   815  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   816  				power-domain@MT8186_POWER_DOMAIN_DIS {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   817  					reg = <MT8186_POWER_DOMAIN_DIS>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   818  					clocks = <&topckgen CLK_TOP_DISP>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   819  						 <&topckgen CLK_TOP_MDP>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   820  						 <&mmsys CLK_MM_SMI_INFRA>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   821  						 <&mmsys CLK_MM_SMI_COMMON>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   822  						 <&mmsys CLK_MM_SMI_GALS>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   823  						 <&mmsys CLK_MM_SMI_IOMMU>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   824  					clock-names = "dis0", "dis1", "dis-0", "dis-1",
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   825  						     "dis-2", "dis-3";
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   826  					mediatek,infracfg = <&infracfg_ao>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   827  					#address-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   828  					#size-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   829  					#power-domain-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   830  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   831  					power-domain@MT8186_POWER_DOMAIN_VDEC {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   832  						reg = <MT8186_POWER_DOMAIN_VDEC>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   833  						clocks = <&topckgen CLK_TOP_VDEC>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   834  							 <&vdecsys CLK_VDEC_LARB1_CKEN>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   835  						clock-names = "vdec0", "vdec-0";
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   836  						mediatek,infracfg = <&infracfg_ao>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   837  						#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   838  					};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   839  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   840  					power-domain@MT8186_POWER_DOMAIN_CAM {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   841  						reg = <MT8186_POWER_DOMAIN_CAM>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   842  						clocks = <&topckgen CLK_TOP_CAM>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   843  							 <&topckgen CLK_TOP_SENINF>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   844  							 <&topckgen CLK_TOP_SENINF1>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   845  							 <&topckgen CLK_TOP_SENINF2>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   846  							 <&topckgen CLK_TOP_SENINF3>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   847  							 <&topckgen CLK_TOP_CAMTM>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   848  							 <&camsys CLK_CAM2MM_GALS>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   849  						clock-names = "cam0", "cam1", "cam2", "cam3",
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   850  							     "cam4", "cam5", "cam-0";
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   851  						mediatek,infracfg = <&infracfg_ao>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   852  						#address-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   853  						#size-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   854  						#power-domain-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   855  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   856  						power-domain@MT8186_POWER_DOMAIN_CAM_RAWB {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   857  							reg = <MT8186_POWER_DOMAIN_CAM_RAWB>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   858  							#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   859  						};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   860  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   861  						power-domain@MT8186_POWER_DOMAIN_CAM_RAWA {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   862  							reg = <MT8186_POWER_DOMAIN_CAM_RAWA>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   863  							#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   864  						};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   865  					};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   866  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   867  					power-domain@MT8186_POWER_DOMAIN_IMG {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   868  						reg = <MT8186_POWER_DOMAIN_IMG>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   869  						clocks = <&topckgen CLK_TOP_IMG1>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   870  							 <&imgsys1 CLK_IMG1_GALS_IMG1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   871  						clock-names = "img0", "img-0";
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   872  						mediatek,infracfg = <&infracfg_ao>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   873  						#address-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   874  						#size-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   875  						#power-domain-cells = <1>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   876  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   877  						power-domain@MT8186_POWER_DOMAIN_IMG2 {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   878  							reg = <MT8186_POWER_DOMAIN_IMG2>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   879  							#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   880  						};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   881  					};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   882  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   883  					power-domain@MT8186_POWER_DOMAIN_IPE {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   884  						reg = <MT8186_POWER_DOMAIN_IPE>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   885  						clocks = <&topckgen CLK_TOP_IPE>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   886  							 <&ipesys CLK_IPE_LARB19>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   887  							 <&ipesys CLK_IPE_LARB20>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   888  							 <&ipesys CLK_IPE_SMI_SUBCOM>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   889  							 <&ipesys CLK_IPE_GALS_IPE>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   890  						clock-names = "ipe0", "ipe-0", "ipe-1", "ipe-2",
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   891  							     "ipe-3";
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   892  						mediatek,infracfg = <&infracfg_ao>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   893  						#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   894  					};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   895  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   896  					power-domain@MT8186_POWER_DOMAIN_VENC {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   897  						reg = <MT8186_POWER_DOMAIN_VENC>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   898  						clocks = <&topckgen CLK_TOP_VENC>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   899  							 <&vencsys CLK_VENC_CKE1_VENC>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   900  						clock-names = "venc0", "venc-0";
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   901  						mediatek,infracfg = <&infracfg_ao>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   902  						#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   903  					};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   904  
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   905  					power-domain@MT8186_POWER_DOMAIN_WPE {
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   906  						reg = <MT8186_POWER_DOMAIN_WPE>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   907  						clocks = <&topckgen CLK_TOP_WPE>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   908  							 <&wpesys CLK_WPE_SMI_LARB8_CK_EN>,
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   909  							 <&wpesys CLK_WPE_SMI_LARB8_PCLK_EN>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   910  						clock-names = "wpe0", "wpe-0", "wpe-1";
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   911  						mediatek,infracfg = <&infracfg_ao>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   912  						#power-domain-cells = <0>;
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   913  					};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   914  				};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   915  			};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   916  		};
0cc922857dd3c7 Allen-kh Cheng      2022-08-15   917  
edd56b094be9fd Allen-KH Cheng      2022-08-26   918  		watchdog: watchdog@10007000 {
4f66ac053488e5 Linux Patches Robot 2023-02-22   919  			compatible = "mediatek,mt8186-wdt";
edd56b094be9fd Allen-KH Cheng      2022-08-26   920  			mediatek,disable-extrst;
edd56b094be9fd Allen-KH Cheng      2022-08-26   921  			reg = <0 0x10007000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   922  			#reset-cells = <1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   923  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   924  
edd56b094be9fd Allen-KH Cheng      2022-08-26   925  		apmixedsys: syscon@1000c000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   926  			compatible = "mediatek,mt8186-apmixedsys", "syscon";
edd56b094be9fd Allen-KH Cheng      2022-08-26   927  			reg = <0 0x1000c000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   928  			#clock-cells = <1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   929  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   930  
edd56b094be9fd Allen-KH Cheng      2022-08-26   931  		pwrap: pwrap@1000d000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   932  			compatible = "mediatek,mt8186-pwrap", "syscon";
edd56b094be9fd Allen-KH Cheng      2022-08-26   933  			reg = <0 0x1000d000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   934  			reg-names = "pwrap";
edd56b094be9fd Allen-KH Cheng      2022-08-26   935  			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH 0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   936  			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   937  				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   938  			clock-names = "spi", "wrap";
edd56b094be9fd Allen-KH Cheng      2022-08-26   939  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   940  
a895884c262a54 Allen-KH Cheng      2022-10-13   941  		spmi: spmi@10015000 {
a895884c262a54 Allen-KH Cheng      2022-10-13   942  			compatible = "mediatek,mt8195-spmi";
a895884c262a54 Allen-KH Cheng      2022-10-13   943  			reg = <0 0x10015000 0 0x000e00>,
a895884c262a54 Allen-KH Cheng      2022-10-13   944  			      <0 0x1001B000 0 0x000100>;
a895884c262a54 Allen-KH Cheng      2022-10-13   945  			reg-names = "pmif", "spmimst";
a895884c262a54 Allen-KH Cheng      2022-10-13   946  			interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH 0>,
a895884c262a54 Allen-KH Cheng      2022-10-13   947  				     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH 0>;
a895884c262a54 Allen-KH Cheng      2022-10-13   948  			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
a895884c262a54 Allen-KH Cheng      2022-10-13   949  				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>,
a895884c262a54 Allen-KH Cheng      2022-10-13   950  				 <&topckgen CLK_TOP_SPMI_MST>;
a895884c262a54 Allen-KH Cheng      2022-10-13   951  			clock-names = "pmif_sys_ck",
a895884c262a54 Allen-KH Cheng      2022-10-13   952  				      "pmif_tmr_ck",
a895884c262a54 Allen-KH Cheng      2022-10-13   953  				      "spmimst_clk_mux";
a895884c262a54 Allen-KH Cheng      2022-10-13   954  			assigned-clocks = <&topckgen CLK_TOP_SPMI_MST>;
a895884c262a54 Allen-KH Cheng      2022-10-13   955  			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
a895884c262a54 Allen-KH Cheng      2022-10-13   956  			status = "disabled";
a895884c262a54 Allen-KH Cheng      2022-10-13   957  		};
a895884c262a54 Allen-KH Cheng      2022-10-13   958  
edd56b094be9fd Allen-KH Cheng      2022-08-26   959  		systimer: timer@10017000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   960  			compatible = "mediatek,mt8186-timer",
edd56b094be9fd Allen-KH Cheng      2022-08-26   961  				     "mediatek,mt6765-timer";
edd56b094be9fd Allen-KH Cheng      2022-08-26   962  			reg = <0 0x10017000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   963  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH 0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   964  			clocks = <&clk13m>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   965  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   966  
ff7be36d43490a Allen-kh Cheng      2022-05-11   967  		gce: mailbox@1022c000 {
edf94ff03f75b6 Yongqiang Niu       2022-09-27   968  			compatible = "mediatek,mt8186-gce";
ff7be36d43490a Allen-kh Cheng      2022-05-11   969  			reg = <0 0X1022c000 0 0x4000>;
ff7be36d43490a Allen-kh Cheng      2022-05-11   970  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
ff7be36d43490a Allen-kh Cheng      2022-05-11   971  			#mbox-cells = <2>;
ff7be36d43490a Allen-kh Cheng      2022-05-11   972  			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
ff7be36d43490a Allen-kh Cheng      2022-05-11   973  			clock-names = "gce";
ff7be36d43490a Allen-kh Cheng      2022-05-11   974  		};
ff7be36d43490a Allen-kh Cheng      2022-05-11   975  
edd56b094be9fd Allen-KH Cheng      2022-08-26   976  		scp: scp@10500000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26   977  			compatible = "mediatek,mt8186-scp";
edd56b094be9fd Allen-KH Cheng      2022-08-26   978  			reg = <0 0x10500000 0 0x40000>,
edd56b094be9fd Allen-KH Cheng      2022-08-26   979  			      <0 0x105c0000 0 0x19080>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   980  			reg-names = "sram", "cfg";
edd56b094be9fd Allen-KH Cheng      2022-08-26   981  			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26   982  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26   983  
1d968ae195fa2c Allen-kh Cheng      2022-05-12   984  		adsp: adsp@10680000 {
1d968ae195fa2c Allen-kh Cheng      2022-05-12   985  			compatible = "mediatek,mt8186-dsp";
1d968ae195fa2c Allen-kh Cheng      2022-05-12   986  			reg = <0 0x10680000 0 0x2000>,
1d968ae195fa2c Allen-kh Cheng      2022-05-12   987  			      <0 0x10800000 0 0x100000>,
1d968ae195fa2c Allen-kh Cheng      2022-05-12   988  			      <0 0x1068b000 0 0x100>,
1d968ae195fa2c Allen-kh Cheng      2022-05-12   989  			      <0 0x1068f000 0 0x1000>;
1d968ae195fa2c Allen-kh Cheng      2022-05-12   990  			reg-names = "cfg", "sram", "sec", "bus";
1d968ae195fa2c Allen-kh Cheng      2022-05-12   991  			interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH 0>;
1d968ae195fa2c Allen-kh Cheng      2022-05-12   992  			interrupt-names = "wdt";
1d968ae195fa2c Allen-kh Cheng      2022-05-12   993  			clocks = <&topckgen CLK_TOP_AUDIODSP>,
1d968ae195fa2c Allen-kh Cheng      2022-05-12   994  				 <&topckgen CLK_TOP_ADSP_BUS>;
1d968ae195fa2c Allen-kh Cheng      2022-05-12   995  			clock-names = "audiodsp",
1d968ae195fa2c Allen-kh Cheng      2022-05-12   996  				      "adsp_bus";
ed31bfb2a6fc22 Tinghan Shen        2022-11-03   997  			assigned-clocks = <&topckgen CLK_TOP_AUDIODSP>,
ed31bfb2a6fc22 Tinghan Shen        2022-11-03   998  					  <&topckgen CLK_TOP_ADSP_BUS>;
ed31bfb2a6fc22 Tinghan Shen        2022-11-03   999  			assigned-clock-parents = <&clk26m>, <&topckgen CLK_TOP_MAINPLL_D2_D2>;
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1000  			power-domains = <&spm MT8186_POWER_DOMAIN_ADSP_TOP>;
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1001  			mbox-names = "rx", "tx";
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1002  			mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1003  			status = "disabled";
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1004  		};
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1005  
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1006  		adsp_mailbox0: mailbox@10686000 {
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1007  			compatible = "mediatek,mt8186-adsp-mbox";
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1008  			#mbox-cells = <0>;
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1009  			reg = <0 0x10686100 0 0x1000>;
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1010  			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>;
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1011  		};
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1012  
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1013  		adsp_mailbox1: mailbox@10687000 {
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1014  			compatible = "mediatek,mt8186-adsp-mbox";
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1015  			#mbox-cells = <0>;
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1016  			reg = <0 0x10687100 0 0x1000>;
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1017  			interrupts = <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH 0>;
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1018  		};
1d968ae195fa2c Allen-kh Cheng      2022-05-12  1019  
edd56b094be9fd Allen-KH Cheng      2022-08-26  1020  		nor_flash: spi@11000000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26  1021  			compatible = "mediatek,mt8186-nor";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1022  			reg = <0 0x11000000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1023  			clocks = <&topckgen CLK_TOP_SPINOR>,
edd56b094be9fd Allen-KH Cheng      2022-08-26  1024  				 <&infracfg_ao CLK_INFRA_AO_SPINOR>,
edd56b094be9fd Allen-KH Cheng      2022-08-26  1025  				 <&infracfg_ao CLK_INFRA_AO_FLASHIF_133M>,
edd56b094be9fd Allen-KH Cheng      2022-08-26  1026  				 <&infracfg_ao CLK_INFRA_AO_FLASHIF_66M>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1027  			clock-names = "spi", "sf", "axi", "axi_s";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1028  			assigned-clocks = <&topckgen CLK_TOP_SPINOR>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1029  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D3_D8>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1030  			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH 0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1031  			status = "disabled";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1032  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26  1033  
edd56b094be9fd Allen-KH Cheng      2022-08-26  1034  		auxadc: adc@11001000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26  1035  			compatible = "mediatek,mt8186-auxadc", "mediatek,mt8173-auxadc";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1036  			reg = <0 0x11001000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1037  			#io-channel-cells = <1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1038  			clocks = <&infracfg_ao CLK_INFRA_AO_AUXADC>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1039  			clock-names = "main";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1040  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26  1041  
edd56b094be9fd Allen-KH Cheng      2022-08-26  1042  		uart0: serial@11002000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26  1043  			compatible = "mediatek,mt8186-uart",
edd56b094be9fd Allen-KH Cheng      2022-08-26  1044  				     "mediatek,mt6577-uart";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1045  			reg = <0 0x11002000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1046  			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1047  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1048  			clock-names = "baud", "bus";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1049  			status = "disabled";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1050  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26  1051  
edd56b094be9fd Allen-KH Cheng      2022-08-26  1052  		uart1: serial@11003000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26  1053  			compatible = "mediatek,mt8186-uart",
edd56b094be9fd Allen-KH Cheng      2022-08-26  1054  				     "mediatek,mt6577-uart";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1055  			reg = <0 0x11003000 0 0x1000>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1056  			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1057  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1058  			clock-names = "baud", "bus";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1059  			status = "disabled";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1060  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26  1061  
edd56b094be9fd Allen-KH Cheng      2022-08-26  1062  		i2c0: i2c@11007000 {
edd56b094be9fd Allen-KH Cheng      2022-08-26  1063  			compatible = "mediatek,mt8186-i2c";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1064  			reg = <0 0x11007000 0 0x1000>,
edd56b094be9fd Allen-KH Cheng      2022-08-26  1065  			      <0 0x10200100 0 0x100>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1066  			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH 0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1067  			clocks = <&imp_iic_wrap CLK_IMP_IIC_WRAP_AP_CLOCK_I2C0>,
edd56b094be9fd Allen-KH Cheng      2022-08-26  1068  				 <&infracfg_ao CLK_INFRA_AO_AP_DMA>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1069  			clock-names = "main", "dma";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1070  			clock-div = <1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1071  			#address-cells = <1>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1072  			#size-cells = <0>;
edd56b094be9fd Allen-KH Cheng      2022-08-26  1073  			status = "disabled";
edd56b094be9fd Allen-KH Cheng      2022-08-26  1074  		};
edd56b094be9fd Allen-KH Cheng      2022-08-26  1075  
edd56b094be9fd Allen-KH Cheng      2022-08-26 @1076  		i2c1: i2c@11008000 {

:::::: The code at line 1076 was first introduced by commit
:::::: edd56b094be9fd3898d84fed56c6933b4d87f664 FROMGIT: arm64: dts: Add MediaTek MT8186 dts and evaluation board and Makefile

:::::: TO: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
