Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89B51922FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317899; cv=none; b=Rieaf+gteOVlSHrgoxpjAVcLo+AIrtyz3WC6sw4P0ELKW7RekSvpvtmyTLY1cmyYa+jiZP1NUHUNvS8iwJ9eAe8dcYZz9QRpy0h/0jJeQirphfwe00N5ycKymZm/TjiqyXNSj3oX1uPkq6MQi20br085c4MYkyNqob4MWy/gWOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317899; c=relaxed/simple;
	bh=gBiFdTzx4LgSdUSPlZl3qjUj87/kr7Om/kf4MGi8Vko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h3/L+TmekkboDNuDTCuekKNkg0hLKxfB9bTPFtJsc8ZCPH19gNbZ0qYmzfYu/lZUYSPG1r8QuaiBBtbYxaaz66FFcL8M01BLnNgdnJmChHXeklkUdfZ7rz6Zq+YJH9B+WStCwGIyF3tIjbpY97FUcyx35j8y+9sN59XRlj1Cj0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1Y+pHaj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1Y+pHaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317894; x=1778853894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gBiFdTzx4LgSdUSPlZl3qjUj87/kr7Om/kf4MGi8Vko=;
  b=G1Y+pHajRwek69Hl4c8T6PU+a6iatnvxE41MnUSolZk6OEUYOGsYEBYS
   meWhe/vTMBdAzxTo52bqUy4SRIPP0Wev+kjd9YCoG2+CCRYEh3vVnb2Ld
   bD+k8G+4JDuXTb2benLKxz5QHtRwYl3Yqmj5e51OhudoclcQBTG4jVzly
   dO+DTz/BjkJzm3YS3wuDV7EmJNnhsaZ7vqmKrMGUXAPwLvMIOKSU9rZOm
   66PlK61bcrpwVgDoN/nAzZbj5LVn7i/QmmWSGP06pWzZtT/ouaMCF4Z5I
   gY57CFVuTadZ9xHWLSyLgMv9nhRF6f05kcKue4oiVX82/G43h7nYFPivR
   g==;
X-CSE-ConnectionGUID: klOZPDALRuqfIhKXUDg6/A==
X-CSE-MsgGUID: fzjnMlEtSaiYrjVZsC8d+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53068813"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="53068813"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:04:53 -0700
X-CSE-ConnectionGUID: a6VqJQfkSvSfIOM3TREWOQ==
X-CSE-MsgGUID: 7R0pfoagQAGPxvCI8Qklyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="142393403"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 May 2025 07:04:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZCa-0000Ex-1I;
	Thu, 15 May 2025 14:04:48 +0000
Date: Thu, 15 May 2025 22:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>
Subject: [linux-next:master 9473/11093]
 arch/arm64/boot/dts/rockchip/rk3562.dtsi:624.26-675.5: Warning
 (simple_bus_reg): /soc/pcie@ff500000: simple-bus unit address format error,
 expected "fe000000"
Message-ID: <202505150745.PQT9TLYX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bdd609656ff5573db9ba1d26496a528bdd297cf2
commit: ceb6ef1ea9002669afc0e1ef258e530d3c05d91a [9473/11093] arm64: dts: rockchip: Add RK3562 evb2 devicetree
config: arm64-randconfig-2052-20250513 (https://download.01.org/0day-ci/archive/20250515/202505150745.PQT9TLYX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150745.PQT9TLYX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150745.PQT9TLYX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3562.dtsi:624.26-675.5: Warning (simple_bus_reg): /soc/pcie@ff500000: simple-bus unit address format error, expected "fe000000"
>> arch/arm64/boot/dts/rockchip/rk3562.dtsi:1115.20-1181.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: /soc/power-management@ff258000/power-controller: failed to match any schema with compatible: ['rockchip,rk3562-power-controller']
   arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: pcie@ff500000 (rockchip,rk3562-pcie): interrupt-names:5: 'dma0' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: pcie@ff500000 (rockchip,rk3562-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3562-pcie', 'rockchip,rk3568-pcie'] is too long
   	'rockchip,rk3568-pcie' was expected

vim +/fe000000 +624 arch/arm64/boot/dts/rockchip/rk3562.dtsi

515fd62224737a Finley Xiao 2025-05-09    14  
515fd62224737a Finley Xiao 2025-05-09    15  / {
515fd62224737a Finley Xiao 2025-05-09    16  	compatible = "rockchip,rk3562";
515fd62224737a Finley Xiao 2025-05-09    17  
515fd62224737a Finley Xiao 2025-05-09    18  	interrupt-parent = <&gic>;
515fd62224737a Finley Xiao 2025-05-09    19  	#address-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09    20  	#size-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09    21  
515fd62224737a Finley Xiao 2025-05-09    22  	aliases {
515fd62224737a Finley Xiao 2025-05-09    23  		gpio0 = &gpio0;
515fd62224737a Finley Xiao 2025-05-09    24  		gpio1 = &gpio1;
515fd62224737a Finley Xiao 2025-05-09    25  		gpio2 = &gpio2;
515fd62224737a Finley Xiao 2025-05-09    26  		gpio3 = &gpio3;
515fd62224737a Finley Xiao 2025-05-09    27  		gpio4 = &gpio4;
515fd62224737a Finley Xiao 2025-05-09    28  	};
515fd62224737a Finley Xiao 2025-05-09    29  
515fd62224737a Finley Xiao 2025-05-09    30  	xin32k: clock-xin32k {
515fd62224737a Finley Xiao 2025-05-09    31  		compatible = "fixed-clock";
515fd62224737a Finley Xiao 2025-05-09    32  		#clock-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09    33  		clock-frequency = <32768>;
515fd62224737a Finley Xiao 2025-05-09    34  		clock-output-names = "xin32k";
515fd62224737a Finley Xiao 2025-05-09    35  	};
515fd62224737a Finley Xiao 2025-05-09    36  
515fd62224737a Finley Xiao 2025-05-09    37  	xin24m: clock-xin24m {
515fd62224737a Finley Xiao 2025-05-09    38  		compatible = "fixed-clock";
515fd62224737a Finley Xiao 2025-05-09    39  		#clock-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09    40  		clock-frequency = <24000000>;
515fd62224737a Finley Xiao 2025-05-09    41  		clock-output-names = "xin24m";
515fd62224737a Finley Xiao 2025-05-09    42  	};
515fd62224737a Finley Xiao 2025-05-09    43  
515fd62224737a Finley Xiao 2025-05-09    44  	cpus {
515fd62224737a Finley Xiao 2025-05-09    45  		#address-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09    46  		#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09    47  
515fd62224737a Finley Xiao 2025-05-09    48  		cpu0: cpu@0 {
515fd62224737a Finley Xiao 2025-05-09    49  			device_type = "cpu";
515fd62224737a Finley Xiao 2025-05-09    50  			compatible = "arm,cortex-a53";
515fd62224737a Finley Xiao 2025-05-09    51  			reg = <0x0 0x0>;
515fd62224737a Finley Xiao 2025-05-09    52  			enable-method = "psci";
515fd62224737a Finley Xiao 2025-05-09    53  			clocks = <&scmi_clk ARMCLK>;
515fd62224737a Finley Xiao 2025-05-09    54  			cpu-idle-states = <&CPU_SLEEP>;
515fd62224737a Finley Xiao 2025-05-09    55  			operating-points-v2 = <&cpu0_opp_table>;
515fd62224737a Finley Xiao 2025-05-09    56  			#cooling-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09    57  			dynamic-power-coefficient = <138>;
515fd62224737a Finley Xiao 2025-05-09    58  		};
515fd62224737a Finley Xiao 2025-05-09    59  
515fd62224737a Finley Xiao 2025-05-09    60  		cpu1: cpu@1 {
515fd62224737a Finley Xiao 2025-05-09    61  			device_type = "cpu";
515fd62224737a Finley Xiao 2025-05-09    62  			compatible = "arm,cortex-a53";
515fd62224737a Finley Xiao 2025-05-09    63  			reg = <0x0 0x1>;
515fd62224737a Finley Xiao 2025-05-09    64  			enable-method = "psci";
515fd62224737a Finley Xiao 2025-05-09    65  			clocks = <&scmi_clk ARMCLK>;
515fd62224737a Finley Xiao 2025-05-09    66  			cpu-idle-states = <&CPU_SLEEP>;
515fd62224737a Finley Xiao 2025-05-09    67  			operating-points-v2 = <&cpu0_opp_table>;
515fd62224737a Finley Xiao 2025-05-09    68  			#cooling-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09    69  			dynamic-power-coefficient = <138>;
515fd62224737a Finley Xiao 2025-05-09    70  		};
515fd62224737a Finley Xiao 2025-05-09    71  
515fd62224737a Finley Xiao 2025-05-09    72  		cpu2: cpu@2 {
515fd62224737a Finley Xiao 2025-05-09    73  			device_type = "cpu";
515fd62224737a Finley Xiao 2025-05-09    74  			compatible = "arm,cortex-a53";
515fd62224737a Finley Xiao 2025-05-09    75  			reg = <0x0 0x2>;
515fd62224737a Finley Xiao 2025-05-09    76  			enable-method = "psci";
515fd62224737a Finley Xiao 2025-05-09    77  			clocks = <&scmi_clk ARMCLK>;
515fd62224737a Finley Xiao 2025-05-09    78  			cpu-idle-states = <&CPU_SLEEP>;
515fd62224737a Finley Xiao 2025-05-09    79  			operating-points-v2 = <&cpu0_opp_table>;
515fd62224737a Finley Xiao 2025-05-09    80  			#cooling-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09    81  			dynamic-power-coefficient = <138>;
515fd62224737a Finley Xiao 2025-05-09    82  		};
515fd62224737a Finley Xiao 2025-05-09    83  
515fd62224737a Finley Xiao 2025-05-09    84  		cpu3: cpu@3 {
515fd62224737a Finley Xiao 2025-05-09    85  			device_type = "cpu";
515fd62224737a Finley Xiao 2025-05-09    86  			compatible = "arm,cortex-a53";
515fd62224737a Finley Xiao 2025-05-09    87  			reg = <0x0 0x3>;
515fd62224737a Finley Xiao 2025-05-09    88  			enable-method = "psci";
515fd62224737a Finley Xiao 2025-05-09    89  			clocks = <&scmi_clk ARMCLK>;
515fd62224737a Finley Xiao 2025-05-09    90  			cpu-idle-states = <&CPU_SLEEP>;
515fd62224737a Finley Xiao 2025-05-09    91  			operating-points-v2 = <&cpu0_opp_table>;
515fd62224737a Finley Xiao 2025-05-09    92  			#cooling-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09    93  			dynamic-power-coefficient = <138>;
515fd62224737a Finley Xiao 2025-05-09    94  		};
515fd62224737a Finley Xiao 2025-05-09    95  
515fd62224737a Finley Xiao 2025-05-09    96  		idle-states {
515fd62224737a Finley Xiao 2025-05-09    97  			entry-method = "psci";
515fd62224737a Finley Xiao 2025-05-09    98  
515fd62224737a Finley Xiao 2025-05-09    99  			CPU_SLEEP: cpu-sleep {
515fd62224737a Finley Xiao 2025-05-09   100  				compatible = "arm,idle-state";
515fd62224737a Finley Xiao 2025-05-09   101  				local-timer-stop;
515fd62224737a Finley Xiao 2025-05-09   102  				arm,psci-suspend-param = <0x0010000>;
515fd62224737a Finley Xiao 2025-05-09   103  				entry-latency-us = <120>;
515fd62224737a Finley Xiao 2025-05-09   104  				exit-latency-us = <250>;
515fd62224737a Finley Xiao 2025-05-09   105  				min-residency-us = <900>;
515fd62224737a Finley Xiao 2025-05-09   106  			};
515fd62224737a Finley Xiao 2025-05-09   107  		};
515fd62224737a Finley Xiao 2025-05-09   108  	};
515fd62224737a Finley Xiao 2025-05-09   109  
515fd62224737a Finley Xiao 2025-05-09   110  	cpu0_opp_table: opp-table-cpu0 {
515fd62224737a Finley Xiao 2025-05-09   111  		compatible = "operating-points-v2";
515fd62224737a Finley Xiao 2025-05-09   112  		opp-shared;
515fd62224737a Finley Xiao 2025-05-09   113  
515fd62224737a Finley Xiao 2025-05-09   114  		opp-408000000 {
515fd62224737a Finley Xiao 2025-05-09   115  			opp-hz = /bits/ 64 <408000000>;
515fd62224737a Finley Xiao 2025-05-09   116  			opp-microvolt = <825000 825000 1150000>;
515fd62224737a Finley Xiao 2025-05-09   117  			clock-latency-ns = <40000>;
515fd62224737a Finley Xiao 2025-05-09   118  			opp-suspend;
515fd62224737a Finley Xiao 2025-05-09   119  		};
515fd62224737a Finley Xiao 2025-05-09   120  		opp-600000000 {
515fd62224737a Finley Xiao 2025-05-09   121  			opp-hz = /bits/ 64 <600000000>;
515fd62224737a Finley Xiao 2025-05-09   122  			opp-microvolt = <825000 825000 1150000>;
515fd62224737a Finley Xiao 2025-05-09   123  			clock-latency-ns = <40000>;
515fd62224737a Finley Xiao 2025-05-09   124  		};
515fd62224737a Finley Xiao 2025-05-09   125  		opp-816000000 {
515fd62224737a Finley Xiao 2025-05-09   126  			opp-hz = /bits/ 64 <816000000>;
515fd62224737a Finley Xiao 2025-05-09   127  			opp-microvolt = <825000 825000 1150000>;
515fd62224737a Finley Xiao 2025-05-09   128  			clock-latency-ns = <40000>;
515fd62224737a Finley Xiao 2025-05-09   129  		};
515fd62224737a Finley Xiao 2025-05-09   130  		opp-1008000000 {
515fd62224737a Finley Xiao 2025-05-09   131  			opp-hz = /bits/ 64 <1008000000>;
515fd62224737a Finley Xiao 2025-05-09   132  			opp-microvolt = <850000 850000 1150000>;
515fd62224737a Finley Xiao 2025-05-09   133  			clock-latency-ns = <40000>;
515fd62224737a Finley Xiao 2025-05-09   134  		};
515fd62224737a Finley Xiao 2025-05-09   135  		opp-1200000000 {
515fd62224737a Finley Xiao 2025-05-09   136  			opp-hz = /bits/ 64 <1200000000>;
515fd62224737a Finley Xiao 2025-05-09   137  			opp-microvolt = <925000 925000 1150000>;
515fd62224737a Finley Xiao 2025-05-09   138  			clock-latency-ns = <40000>;
515fd62224737a Finley Xiao 2025-05-09   139  		};
515fd62224737a Finley Xiao 2025-05-09   140  		opp-1416000000 {
515fd62224737a Finley Xiao 2025-05-09   141  			opp-hz = /bits/ 64 <1416000000>;
515fd62224737a Finley Xiao 2025-05-09   142  			opp-microvolt = <1000000 1000000 1150000>;
515fd62224737a Finley Xiao 2025-05-09   143  			clock-latency-ns = <40000>;
515fd62224737a Finley Xiao 2025-05-09   144  		};
515fd62224737a Finley Xiao 2025-05-09   145  		opp-1608000000 {
515fd62224737a Finley Xiao 2025-05-09   146  			opp-supported-hw = <0xf9 0xffff>;
515fd62224737a Finley Xiao 2025-05-09   147  			opp-hz = /bits/ 64 <1608000000>;
515fd62224737a Finley Xiao 2025-05-09   148  			opp-microvolt = <1037500 1037500 1150000>;
515fd62224737a Finley Xiao 2025-05-09   149  			clock-latency-ns = <40000>;
515fd62224737a Finley Xiao 2025-05-09   150  		};
515fd62224737a Finley Xiao 2025-05-09   151  		opp-1800000000 {
515fd62224737a Finley Xiao 2025-05-09   152  			opp-hz = /bits/ 64 <1800000000>;
515fd62224737a Finley Xiao 2025-05-09   153  			opp-microvolt = <1125000 1125000 1150000>;
515fd62224737a Finley Xiao 2025-05-09   154  			clock-latency-ns = <40000>;
515fd62224737a Finley Xiao 2025-05-09   155  		};
515fd62224737a Finley Xiao 2025-05-09   156  		opp-2016000000 {
515fd62224737a Finley Xiao 2025-05-09   157  			opp-hz = /bits/ 64 <2016000000>;
515fd62224737a Finley Xiao 2025-05-09   158  			opp-microvolt = <1150000 1150000 1150000>;
515fd62224737a Finley Xiao 2025-05-09   159  			clock-latency-ns = <40000>;
515fd62224737a Finley Xiao 2025-05-09   160  		};
515fd62224737a Finley Xiao 2025-05-09   161  
515fd62224737a Finley Xiao 2025-05-09   162  	};
515fd62224737a Finley Xiao 2025-05-09   163  
515fd62224737a Finley Xiao 2025-05-09   164  	gpu_opp_table: opp-table-gpu {
515fd62224737a Finley Xiao 2025-05-09   165  		compatible = "operating-points-v2";
515fd62224737a Finley Xiao 2025-05-09   166  
515fd62224737a Finley Xiao 2025-05-09   167  		opp-300000000 {
515fd62224737a Finley Xiao 2025-05-09   168  			opp-hz = /bits/ 64 <300000000>;
515fd62224737a Finley Xiao 2025-05-09   169  			opp-microvolt = <825000 825000 1000000>;
515fd62224737a Finley Xiao 2025-05-09   170  		};
515fd62224737a Finley Xiao 2025-05-09   171  		opp-400000000 {
515fd62224737a Finley Xiao 2025-05-09   172  			opp-hz = /bits/ 64 <400000000>;
515fd62224737a Finley Xiao 2025-05-09   173  			opp-microvolt = <825000 825000 1000000>;
515fd62224737a Finley Xiao 2025-05-09   174  		};
515fd62224737a Finley Xiao 2025-05-09   175  		opp-500000000 {
515fd62224737a Finley Xiao 2025-05-09   176  			opp-hz = /bits/ 64 <500000000>;
515fd62224737a Finley Xiao 2025-05-09   177  			opp-microvolt = <825000 825000 1000000>;
515fd62224737a Finley Xiao 2025-05-09   178  		};
515fd62224737a Finley Xiao 2025-05-09   179  		opp-600000000 {
515fd62224737a Finley Xiao 2025-05-09   180  			opp-hz = /bits/ 64 <600000000>;
515fd62224737a Finley Xiao 2025-05-09   181  			opp-microvolt = <825000 825000 1000000>;
515fd62224737a Finley Xiao 2025-05-09   182  		};
515fd62224737a Finley Xiao 2025-05-09   183  		opp-700000000 {
515fd62224737a Finley Xiao 2025-05-09   184  			opp-hz = /bits/ 64 <700000000>;
515fd62224737a Finley Xiao 2025-05-09   185  			opp-microvolt = <900000 900000 1000000>;
515fd62224737a Finley Xiao 2025-05-09   186  		};
515fd62224737a Finley Xiao 2025-05-09   187  		opp-800000000 {
515fd62224737a Finley Xiao 2025-05-09   188  			opp-hz = /bits/ 64 <800000000>;
515fd62224737a Finley Xiao 2025-05-09   189  			opp-microvolt = <950000 950000 1000000>;
515fd62224737a Finley Xiao 2025-05-09   190  		};
515fd62224737a Finley Xiao 2025-05-09   191  		opp-900000000 {
515fd62224737a Finley Xiao 2025-05-09   192  			opp-hz = /bits/ 64 <900000000>;
515fd62224737a Finley Xiao 2025-05-09   193  			opp-microvolt = <1000000 1000000 1000000>;
515fd62224737a Finley Xiao 2025-05-09   194  		};
515fd62224737a Finley Xiao 2025-05-09   195  	};
515fd62224737a Finley Xiao 2025-05-09   196  
515fd62224737a Finley Xiao 2025-05-09   197  	arm_pmu: arm-pmu {
515fd62224737a Finley Xiao 2025-05-09   198  		compatible = "arm,cortex-a53-pmu";
515fd62224737a Finley Xiao 2025-05-09   199  		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>,
515fd62224737a Finley Xiao 2025-05-09   200  			     <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
515fd62224737a Finley Xiao 2025-05-09   201  			     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
515fd62224737a Finley Xiao 2025-05-09   202  			     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   203  		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
515fd62224737a Finley Xiao 2025-05-09   204  	};
515fd62224737a Finley Xiao 2025-05-09   205  
515fd62224737a Finley Xiao 2025-05-09   206  	firmware {
515fd62224737a Finley Xiao 2025-05-09   207  		scmi: scmi {
515fd62224737a Finley Xiao 2025-05-09   208  			compatible = "arm,scmi-smc";
515fd62224737a Finley Xiao 2025-05-09   209  			shmem = <&scmi_shmem>;
515fd62224737a Finley Xiao 2025-05-09   210  			arm,smc-id = <0x82000010>;
515fd62224737a Finley Xiao 2025-05-09   211  			#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   212  			#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   213  
515fd62224737a Finley Xiao 2025-05-09   214  			scmi_clk: protocol@14 {
515fd62224737a Finley Xiao 2025-05-09   215  				reg = <0x14>;
515fd62224737a Finley Xiao 2025-05-09   216  				#clock-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   217  			};
515fd62224737a Finley Xiao 2025-05-09   218  		};
515fd62224737a Finley Xiao 2025-05-09   219  	};
515fd62224737a Finley Xiao 2025-05-09   220  
515fd62224737a Finley Xiao 2025-05-09   221  	psci {
515fd62224737a Finley Xiao 2025-05-09   222  		compatible = "arm,psci-1.0";
515fd62224737a Finley Xiao 2025-05-09   223  		method = "smc";
515fd62224737a Finley Xiao 2025-05-09   224  	};
515fd62224737a Finley Xiao 2025-05-09   225  
515fd62224737a Finley Xiao 2025-05-09   226  	reserved-memory {
515fd62224737a Finley Xiao 2025-05-09   227  		#address-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09   228  		#size-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09   229  		ranges;
515fd62224737a Finley Xiao 2025-05-09   230  
515fd62224737a Finley Xiao 2025-05-09   231  		scmi_shmem: shmem@10f000 {
515fd62224737a Finley Xiao 2025-05-09   232  			compatible = "arm,scmi-shmem";
515fd62224737a Finley Xiao 2025-05-09   233  			reg = <0x0 0x0010f000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   234  			no-map;
515fd62224737a Finley Xiao 2025-05-09   235  		};
515fd62224737a Finley Xiao 2025-05-09   236  	};
515fd62224737a Finley Xiao 2025-05-09   237  
515fd62224737a Finley Xiao 2025-05-09   238  	timer {
515fd62224737a Finley Xiao 2025-05-09   239  		compatible = "arm,armv8-timer";
515fd62224737a Finley Xiao 2025-05-09   240  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
515fd62224737a Finley Xiao 2025-05-09   241  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
515fd62224737a Finley Xiao 2025-05-09   242  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
515fd62224737a Finley Xiao 2025-05-09   243  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
515fd62224737a Finley Xiao 2025-05-09   244  	};
515fd62224737a Finley Xiao 2025-05-09   245  
515fd62224737a Finley Xiao 2025-05-09   246  	soc {
515fd62224737a Finley Xiao 2025-05-09   247  		compatible = "simple-bus";
515fd62224737a Finley Xiao 2025-05-09   248  		#address-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09   249  		#size-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09   250  		ranges;
515fd62224737a Finley Xiao 2025-05-09   251  
515fd62224737a Finley Xiao 2025-05-09   252  		gic: interrupt-controller@fe901000 {
515fd62224737a Finley Xiao 2025-05-09   253  			compatible = "arm,gic-400";
515fd62224737a Finley Xiao 2025-05-09   254  			#interrupt-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   255  			#address-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   256  			interrupt-controller;
515fd62224737a Finley Xiao 2025-05-09   257  			reg = <0x0 0xfe901000 0 0x1000>,
515fd62224737a Finley Xiao 2025-05-09   258  			      <0x0 0xfe902000 0 0x2000>,
515fd62224737a Finley Xiao 2025-05-09   259  			      <0x0 0xfe904000 0 0x2000>,
515fd62224737a Finley Xiao 2025-05-09   260  			      <0x0 0xfe906000 0 0x2000>;
515fd62224737a Finley Xiao 2025-05-09   261  			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
515fd62224737a Finley Xiao 2025-05-09   262  		};
515fd62224737a Finley Xiao 2025-05-09   263  
515fd62224737a Finley Xiao 2025-05-09   264  		qos_dma2ddr: qos@fee03800 {
515fd62224737a Finley Xiao 2025-05-09   265  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   266  			reg = <0x0 0xfee03800 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   267  		};
515fd62224737a Finley Xiao 2025-05-09   268  
515fd62224737a Finley Xiao 2025-05-09   269  		qos_mcu: qos@fee10000 {
515fd62224737a Finley Xiao 2025-05-09   270  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   271  			reg = <0x0 0xfee10000 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   272  		};
515fd62224737a Finley Xiao 2025-05-09   273  
515fd62224737a Finley Xiao 2025-05-09   274  		qos_dft_apb: qos@fee10100 {
515fd62224737a Finley Xiao 2025-05-09   275  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   276  			reg = <0x0 0xfee10100 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   277  		};
515fd62224737a Finley Xiao 2025-05-09   278  
515fd62224737a Finley Xiao 2025-05-09   279  		qos_gmac: qos@fee10200 {
515fd62224737a Finley Xiao 2025-05-09   280  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   281  			reg = <0x0 0xfee10200 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   282  		};
515fd62224737a Finley Xiao 2025-05-09   283  
515fd62224737a Finley Xiao 2025-05-09   284  		qos_mac100: qos@fee10300 {
515fd62224737a Finley Xiao 2025-05-09   285  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   286  			reg = <0x0 0xfee10300 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   287  		};
515fd62224737a Finley Xiao 2025-05-09   288  
515fd62224737a Finley Xiao 2025-05-09   289  		qos_dcf: qos@fee10400 {
515fd62224737a Finley Xiao 2025-05-09   290  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   291  			reg = <0x0 0xfee10400 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   292  		};
515fd62224737a Finley Xiao 2025-05-09   293  
515fd62224737a Finley Xiao 2025-05-09   294  		qos_cpu: qos@fee20000 {
515fd62224737a Finley Xiao 2025-05-09   295  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   296  			reg = <0x0 0xfee20000 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   297  		};
515fd62224737a Finley Xiao 2025-05-09   298  
515fd62224737a Finley Xiao 2025-05-09   299  		qos_gpu: qos@fee30000 {
515fd62224737a Finley Xiao 2025-05-09   300  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   301  			reg = <0x0 0xfee30000 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   302  		};
515fd62224737a Finley Xiao 2025-05-09   303  
515fd62224737a Finley Xiao 2025-05-09   304  		qos_npu: qos@fee40000 {
515fd62224737a Finley Xiao 2025-05-09   305  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   306  			reg = <0x0 0xfee40000 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   307  		};
515fd62224737a Finley Xiao 2025-05-09   308  
515fd62224737a Finley Xiao 2025-05-09   309  		qos_rkvdec: qos@fee50000 {
515fd62224737a Finley Xiao 2025-05-09   310  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   311  			reg = <0x0 0xfee50000 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   312  		};
515fd62224737a Finley Xiao 2025-05-09   313  
515fd62224737a Finley Xiao 2025-05-09   314  		qos_vepu: qos@fee60000 {
515fd62224737a Finley Xiao 2025-05-09   315  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   316  			reg = <0x0 0xfee60000 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   317  		};
515fd62224737a Finley Xiao 2025-05-09   318  
515fd62224737a Finley Xiao 2025-05-09   319  		qos_isp: qos@fee70000 {
515fd62224737a Finley Xiao 2025-05-09   320  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   321  			reg = <0x0 0xfee70000 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   322  		};
515fd62224737a Finley Xiao 2025-05-09   323  
515fd62224737a Finley Xiao 2025-05-09   324  		qos_vicap: qos@fee70100 {
515fd62224737a Finley Xiao 2025-05-09   325  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   326  			reg = <0x0 0xfee70100 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   327  		};
515fd62224737a Finley Xiao 2025-05-09   328  
515fd62224737a Finley Xiao 2025-05-09   329  		qos_vop: qos@fee80000 {
515fd62224737a Finley Xiao 2025-05-09   330  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   331  			reg = <0x0 0xfee80000 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   332  		};
515fd62224737a Finley Xiao 2025-05-09   333  
515fd62224737a Finley Xiao 2025-05-09   334  		qos_jpeg: qos@fee90000 {
515fd62224737a Finley Xiao 2025-05-09   335  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   336  			reg = <0x0 0xfee90000 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   337  		};
515fd62224737a Finley Xiao 2025-05-09   338  
515fd62224737a Finley Xiao 2025-05-09   339  		qos_rga_rd: qos@fee90100 {
515fd62224737a Finley Xiao 2025-05-09   340  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   341  			reg = <0x0 0xfee90100 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   342  		};
515fd62224737a Finley Xiao 2025-05-09   343  
515fd62224737a Finley Xiao 2025-05-09   344  		qos_rga_wr: qos@fee90200 {
515fd62224737a Finley Xiao 2025-05-09   345  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   346  			reg = <0x0 0xfee90200 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   347  		};
515fd62224737a Finley Xiao 2025-05-09   348  
515fd62224737a Finley Xiao 2025-05-09   349  		qos_pcie: qos@feea0000 {
515fd62224737a Finley Xiao 2025-05-09   350  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   351  			reg = <0x0 0xfeea0000 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   352  		};
515fd62224737a Finley Xiao 2025-05-09   353  
515fd62224737a Finley Xiao 2025-05-09   354  		qos_usb3: qos@feea0100 {
515fd62224737a Finley Xiao 2025-05-09   355  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   356  			reg = <0x0 0xfeea0100 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   357  		};
515fd62224737a Finley Xiao 2025-05-09   358  
515fd62224737a Finley Xiao 2025-05-09   359  		qos_crypto_apb: qos@feeb0000 {
515fd62224737a Finley Xiao 2025-05-09   360  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   361  			reg = <0x0 0xfeeb0000 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   362  		};
515fd62224737a Finley Xiao 2025-05-09   363  
515fd62224737a Finley Xiao 2025-05-09   364  		qos_crypto: qos@feeb0100 {
515fd62224737a Finley Xiao 2025-05-09   365  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   366  			reg = <0x0 0xfeeb0100 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   367  		};
515fd62224737a Finley Xiao 2025-05-09   368  
515fd62224737a Finley Xiao 2025-05-09   369  		qos_dmac: qos@feeb0200 {
515fd62224737a Finley Xiao 2025-05-09   370  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   371  			reg = <0x0 0xfeeb0200 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   372  		};
515fd62224737a Finley Xiao 2025-05-09   373  
515fd62224737a Finley Xiao 2025-05-09   374  		qos_emmc: qos@feeb0300 {
515fd62224737a Finley Xiao 2025-05-09   375  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   376  			reg = <0x0 0xfeeb0300 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   377  		};
515fd62224737a Finley Xiao 2025-05-09   378  
515fd62224737a Finley Xiao 2025-05-09   379  		qos_fspi: qos@feeb0400 {
515fd62224737a Finley Xiao 2025-05-09   380  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   381  			reg = <0x0 0xfeeb0400 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   382  		};
515fd62224737a Finley Xiao 2025-05-09   383  
515fd62224737a Finley Xiao 2025-05-09   384  		qos_rkdma: qos@feeb0500 {
515fd62224737a Finley Xiao 2025-05-09   385  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   386  			reg = <0x0 0xfeeb0500 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   387  		};
515fd62224737a Finley Xiao 2025-05-09   388  
515fd62224737a Finley Xiao 2025-05-09   389  		qos_sdmmc0: qos@feeb0600 {
515fd62224737a Finley Xiao 2025-05-09   390  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   391  			reg = <0x0 0xfeeb0600 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   392  		};
515fd62224737a Finley Xiao 2025-05-09   393  
515fd62224737a Finley Xiao 2025-05-09   394  		qos_sdmmc1: qos@feeb0700 {
515fd62224737a Finley Xiao 2025-05-09   395  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   396  			reg = <0x0 0xfeeb0700 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   397  		};
515fd62224737a Finley Xiao 2025-05-09   398  
515fd62224737a Finley Xiao 2025-05-09   399  		qos_usb2: qos@feeb0800 {
515fd62224737a Finley Xiao 2025-05-09   400  			compatible = "rockchip,rk3562-qos", "syscon";
515fd62224737a Finley Xiao 2025-05-09   401  			reg = <0x0 0xfeeb0800 0x0 0x20>;
515fd62224737a Finley Xiao 2025-05-09   402  		};
515fd62224737a Finley Xiao 2025-05-09   403  
515fd62224737a Finley Xiao 2025-05-09   404  		pmu_grf: syscon@ff010000 {
515fd62224737a Finley Xiao 2025-05-09   405  			compatible = "rockchip,rk3562-pmu-grf", "syscon", "simple-mfd";
515fd62224737a Finley Xiao 2025-05-09   406  			reg = <0x0 0xff010000 0x0 0x10000>;
515fd62224737a Finley Xiao 2025-05-09   407  
515fd62224737a Finley Xiao 2025-05-09   408  			reboot_mode: reboot-mode {
515fd62224737a Finley Xiao 2025-05-09   409  				compatible = "syscon-reboot-mode";
515fd62224737a Finley Xiao 2025-05-09   410  				offset = <0x220>;
515fd62224737a Finley Xiao 2025-05-09   411  				mode-normal = <BOOT_NORMAL>;
515fd62224737a Finley Xiao 2025-05-09   412  				mode-loader = <BOOT_BL_DOWNLOAD>;
515fd62224737a Finley Xiao 2025-05-09   413  				mode-recovery = <BOOT_RECOVERY>;
515fd62224737a Finley Xiao 2025-05-09   414  				mode-bootloader = <BOOT_FASTBOOT>;
515fd62224737a Finley Xiao 2025-05-09   415  			};
515fd62224737a Finley Xiao 2025-05-09   416  		};
515fd62224737a Finley Xiao 2025-05-09   417  
515fd62224737a Finley Xiao 2025-05-09   418  		sys_grf: syscon@ff030000 {
515fd62224737a Finley Xiao 2025-05-09   419  			compatible = "rockchip,rk3562-sys-grf", "syscon";
515fd62224737a Finley Xiao 2025-05-09   420  			reg = <0x0 0xff030000 0x0 0x10000>;
515fd62224737a Finley Xiao 2025-05-09   421  		};
515fd62224737a Finley Xiao 2025-05-09   422  
515fd62224737a Finley Xiao 2025-05-09   423  		peri_grf: syscon@ff040000 {
515fd62224737a Finley Xiao 2025-05-09   424  			compatible = "rockchip,rk3562-peri-grf", "syscon";
515fd62224737a Finley Xiao 2025-05-09   425  			reg = <0x0 0xff040000 0x0 0x10000>;
515fd62224737a Finley Xiao 2025-05-09   426  		};
515fd62224737a Finley Xiao 2025-05-09   427  
515fd62224737a Finley Xiao 2025-05-09   428  		ioc_grf: syscon@ff060000 {
515fd62224737a Finley Xiao 2025-05-09   429  			compatible = "rockchip,rk3562-ioc-grf", "syscon";
515fd62224737a Finley Xiao 2025-05-09   430  			reg = <0x0 0xff060000 0x0 0x30000>;
515fd62224737a Finley Xiao 2025-05-09   431  		};
515fd62224737a Finley Xiao 2025-05-09   432  
515fd62224737a Finley Xiao 2025-05-09   433  		usbphy_grf: syscon@ff090000 {
515fd62224737a Finley Xiao 2025-05-09   434  			compatible = "rockchip,rk3562-usbphy-grf", "syscon";
515fd62224737a Finley Xiao 2025-05-09   435  			reg = <0x0 0xff090000 0x0 0x8000>;
515fd62224737a Finley Xiao 2025-05-09   436  		};
515fd62224737a Finley Xiao 2025-05-09   437  
515fd62224737a Finley Xiao 2025-05-09   438  		pipephy_grf: syscon@ff098000 {
515fd62224737a Finley Xiao 2025-05-09   439  			compatible = "rockchip,rk3562-pipephy-grf", "syscon";
515fd62224737a Finley Xiao 2025-05-09   440  			reg = <0x0 0xff098000 0x0 0x8000>;
515fd62224737a Finley Xiao 2025-05-09   441  		};
515fd62224737a Finley Xiao 2025-05-09   442  
515fd62224737a Finley Xiao 2025-05-09   443  		cru: clock-controller@ff100000 {
515fd62224737a Finley Xiao 2025-05-09   444  			compatible = "rockchip,rk3562-cru";
515fd62224737a Finley Xiao 2025-05-09   445  			reg = <0x0 0xff100000 0x0 0x40000>;
515fd62224737a Finley Xiao 2025-05-09   446  			#clock-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   447  			#reset-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   448  
515fd62224737a Finley Xiao 2025-05-09   449  			assigned-clocks = <&cru PLL_GPLL>, <&cru PLL_CPLL>,
515fd62224737a Finley Xiao 2025-05-09   450  					  <&cru PLL_HPLL>;
515fd62224737a Finley Xiao 2025-05-09   451  			assigned-clock-rates = <1188000000>, <1000000000>,
515fd62224737a Finley Xiao 2025-05-09   452  					       <983040000>;
515fd62224737a Finley Xiao 2025-05-09   453  		};
515fd62224737a Finley Xiao 2025-05-09   454  
515fd62224737a Finley Xiao 2025-05-09   455  		i2c0: i2c@ff200000 {
515fd62224737a Finley Xiao 2025-05-09   456  			compatible = "rockchip,rk3562-i2c", "rockchip,rk3399-i2c";
515fd62224737a Finley Xiao 2025-05-09   457  			reg = <0x0 0xff200000 0x0 0x1000>;
515fd62224737a Finley Xiao 2025-05-09   458  			clocks = <&cru CLK_PMU0_I2C0>, <&cru PCLK_PMU0_I2C0>;
515fd62224737a Finley Xiao 2025-05-09   459  			clock-names = "i2c", "pclk";
515fd62224737a Finley Xiao 2025-05-09   460  			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   461  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   462  			pinctrl-0 = <&i2c0_xfer>;
515fd62224737a Finley Xiao 2025-05-09   463  			#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   464  			#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   465  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   466  		};
515fd62224737a Finley Xiao 2025-05-09   467  
515fd62224737a Finley Xiao 2025-05-09   468  		uart0: serial@ff210000 {
515fd62224737a Finley Xiao 2025-05-09   469  			compatible = "rockchip,rk3562-uart", "snps,dw-apb-uart";
515fd62224737a Finley Xiao 2025-05-09   470  			reg = <0x0 0xff210000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   471  			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   472  			clocks = <&cru SCLK_PMU1_UART0>, <&cru PCLK_PMU1_UART0>;
515fd62224737a Finley Xiao 2025-05-09   473  			clock-names = "baudclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   474  			reg-shift = <2>;
515fd62224737a Finley Xiao 2025-05-09   475  			reg-io-width = <4>;
515fd62224737a Finley Xiao 2025-05-09   476  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   477  		};
515fd62224737a Finley Xiao 2025-05-09   478  
515fd62224737a Finley Xiao 2025-05-09   479  		spi0: spi@ff220000 {
515fd62224737a Finley Xiao 2025-05-09   480  			compatible = "rockchip,rk3562-spi", "rockchip,rk3066-spi";
515fd62224737a Finley Xiao 2025-05-09   481  			reg = <0x0 0xff220000 0x0 0x1000>;
515fd62224737a Finley Xiao 2025-05-09   482  			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   483  			clocks = <&cru CLK_PMU1_SPI0>, <&cru PCLK_PMU1_SPI0>;
515fd62224737a Finley Xiao 2025-05-09   484  			clock-names = "spiclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   485  			dmas = <&dmac 13>, <&dmac 12>;
515fd62224737a Finley Xiao 2025-05-09   486  			dma-names = "tx", "rx";
515fd62224737a Finley Xiao 2025-05-09   487  			num-cs = <2>;
515fd62224737a Finley Xiao 2025-05-09   488  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   489  			pinctrl-0 = <&spi0m0_csn0 &spi0m0_csn1 &spi0m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   490  			#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   491  			#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   492  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   493  		};
515fd62224737a Finley Xiao 2025-05-09   494  
515fd62224737a Finley Xiao 2025-05-09   495  		pwm0: pwm@ff230000 {
515fd62224737a Finley Xiao 2025-05-09   496  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   497  			reg = <0x0 0xff230000 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   498  			clocks = <&cru CLK_PMU1_PWM0>, <&cru PCLK_PMU1_PWM0>;
515fd62224737a Finley Xiao 2025-05-09   499  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   500  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   501  			pinctrl-0 = <&pwm0m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   502  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   503  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   504  		};
515fd62224737a Finley Xiao 2025-05-09   505  
515fd62224737a Finley Xiao 2025-05-09   506  		pwm1: pwm@ff230010 {
515fd62224737a Finley Xiao 2025-05-09   507  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   508  			reg = <0x0 0xff230010 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   509  			clocks = <&cru CLK_PMU1_PWM0>, <&cru PCLK_PMU1_PWM0>;
515fd62224737a Finley Xiao 2025-05-09   510  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   511  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   512  			pinctrl-0 = <&pwm1m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   513  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   514  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   515  		};
515fd62224737a Finley Xiao 2025-05-09   516  
515fd62224737a Finley Xiao 2025-05-09   517  		pwm2: pwm@ff230020 {
515fd62224737a Finley Xiao 2025-05-09   518  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   519  			reg = <0x0 0xff230020 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   520  			clocks = <&cru CLK_PMU1_PWM0>, <&cru PCLK_PMU1_PWM0>;
515fd62224737a Finley Xiao 2025-05-09   521  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   522  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   523  			pinctrl-0 = <&pwm2m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   524  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   525  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   526  		};
515fd62224737a Finley Xiao 2025-05-09   527  
515fd62224737a Finley Xiao 2025-05-09   528  		pwm3: pwm@ff230030 {
515fd62224737a Finley Xiao 2025-05-09   529  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   530  			reg = <0x0 0xff230030 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   531  			clocks = <&cru CLK_PMU1_PWM0>, <&cru PCLK_PMU1_PWM0>;
515fd62224737a Finley Xiao 2025-05-09   532  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   533  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   534  			pinctrl-0 = <&pwm3m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   535  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   536  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   537  		};
515fd62224737a Finley Xiao 2025-05-09   538  
515fd62224737a Finley Xiao 2025-05-09   539  		pmu: power-management@ff258000 {
515fd62224737a Finley Xiao 2025-05-09   540  			compatible = "rockchip,rk3562-pmu", "syscon", "simple-mfd";
515fd62224737a Finley Xiao 2025-05-09   541  			reg = <0x0 0xff258000 0x0 0x1000>;
515fd62224737a Finley Xiao 2025-05-09   542  
515fd62224737a Finley Xiao 2025-05-09   543  			power: power-controller {
515fd62224737a Finley Xiao 2025-05-09   544  				compatible = "rockchip,rk3562-power-controller";
515fd62224737a Finley Xiao 2025-05-09   545  				#power-domain-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   546  				#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   547  				#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   548  
515fd62224737a Finley Xiao 2025-05-09   549  				power-domain@8 {
515fd62224737a Finley Xiao 2025-05-09   550  					reg = <8>;
515fd62224737a Finley Xiao 2025-05-09   551  					pm_qos = <&qos_gpu>;
515fd62224737a Finley Xiao 2025-05-09   552  					#power-domain-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   553  				};
515fd62224737a Finley Xiao 2025-05-09   554  
515fd62224737a Finley Xiao 2025-05-09   555  				power-domain@7 {
515fd62224737a Finley Xiao 2025-05-09   556  					reg = <7>;
515fd62224737a Finley Xiao 2025-05-09   557  					pm_qos = <&qos_npu>;
515fd62224737a Finley Xiao 2025-05-09   558  					#power-domain-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   559  				};
515fd62224737a Finley Xiao 2025-05-09   560  
515fd62224737a Finley Xiao 2025-05-09   561  				power-domain@11 {
515fd62224737a Finley Xiao 2025-05-09   562  					reg = <11>;
515fd62224737a Finley Xiao 2025-05-09   563  					pm_qos = <&qos_rkvdec>;
515fd62224737a Finley Xiao 2025-05-09   564  					#power-domain-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   565  				};
515fd62224737a Finley Xiao 2025-05-09   566  
515fd62224737a Finley Xiao 2025-05-09   567  				power-domain@12 {
515fd62224737a Finley Xiao 2025-05-09   568  					reg = <12>;
515fd62224737a Finley Xiao 2025-05-09   569  					pm_qos = <&qos_isp>,
515fd62224737a Finley Xiao 2025-05-09   570  						 <&qos_vicap>;
515fd62224737a Finley Xiao 2025-05-09   571  					#power-domain-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   572  					#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   573  					#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   574  
515fd62224737a Finley Xiao 2025-05-09   575  					power-domain@10 {
515fd62224737a Finley Xiao 2025-05-09   576  						reg = <10>;
515fd62224737a Finley Xiao 2025-05-09   577  						pm_qos = <&qos_vepu>;
515fd62224737a Finley Xiao 2025-05-09   578  						#power-domain-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   579  					};
515fd62224737a Finley Xiao 2025-05-09   580  				};
515fd62224737a Finley Xiao 2025-05-09   581  
515fd62224737a Finley Xiao 2025-05-09   582  				power-domain@13 {
515fd62224737a Finley Xiao 2025-05-09   583  					reg = <13>;
515fd62224737a Finley Xiao 2025-05-09   584  					pm_qos = <&qos_vop>;
515fd62224737a Finley Xiao 2025-05-09   585  					#power-domain-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   586  					#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   587  					#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   588  
515fd62224737a Finley Xiao 2025-05-09   589  					power-domain@14 {
515fd62224737a Finley Xiao 2025-05-09   590  						reg = <14>;
515fd62224737a Finley Xiao 2025-05-09   591  						pm_qos = <&qos_rga_rd>,
515fd62224737a Finley Xiao 2025-05-09   592  							 <&qos_rga_wr>,
515fd62224737a Finley Xiao 2025-05-09   593  							 <&qos_jpeg>;
515fd62224737a Finley Xiao 2025-05-09   594  						#power-domain-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   595  					};
515fd62224737a Finley Xiao 2025-05-09   596  				};
515fd62224737a Finley Xiao 2025-05-09   597  
515fd62224737a Finley Xiao 2025-05-09   598  				power-domain@15 {
515fd62224737a Finley Xiao 2025-05-09   599  					reg = <15>;
515fd62224737a Finley Xiao 2025-05-09   600  					pm_qos = <&qos_pcie>,
515fd62224737a Finley Xiao 2025-05-09   601  						 <&qos_usb3>;
515fd62224737a Finley Xiao 2025-05-09   602  					#power-domain-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   603  				};
515fd62224737a Finley Xiao 2025-05-09   604  			};
515fd62224737a Finley Xiao 2025-05-09   605  		};
515fd62224737a Finley Xiao 2025-05-09   606  
515fd62224737a Finley Xiao 2025-05-09   607  		gpu: gpu@ff320000 {
515fd62224737a Finley Xiao 2025-05-09   608  			compatible = "rockchip,rk3562-mali", "arm,mali-bifrost";
515fd62224737a Finley Xiao 2025-05-09   609  			reg = <0x0 0xff320000 0x0 0x4000>;
515fd62224737a Finley Xiao 2025-05-09   610  			clocks = <&cru CLK_GPU>, <&cru CLK_GPU_BRG>,
515fd62224737a Finley Xiao 2025-05-09   611  				 <&cru ACLK_GPU_PRE>;
515fd62224737a Finley Xiao 2025-05-09   612  			clock-names = "clk_gpu", "clk_gpu_brg", "aclk_gpu";
515fd62224737a Finley Xiao 2025-05-09   613  			dynamic-power-coefficient = <820>;
515fd62224737a Finley Xiao 2025-05-09   614  			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
515fd62224737a Finley Xiao 2025-05-09   615  				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
515fd62224737a Finley Xiao 2025-05-09   616  				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   617  			interrupt-names = "job", "mmu", "gpu";
515fd62224737a Finley Xiao 2025-05-09   618  			operating-points-v2 = <&gpu_opp_table>;
515fd62224737a Finley Xiao 2025-05-09   619  			power-domains = <&power 8>;
515fd62224737a Finley Xiao 2025-05-09   620  			#cooling-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09   621  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   622  		};
515fd62224737a Finley Xiao 2025-05-09   623  
515fd62224737a Finley Xiao 2025-05-09  @624  		pcie2x1: pcie@ff500000 {
515fd62224737a Finley Xiao 2025-05-09   625  			compatible = "rockchip,rk3562-pcie", "rockchip,rk3568-pcie";
515fd62224737a Finley Xiao 2025-05-09   626  			bus-range = <0x0 0xff>;
515fd62224737a Finley Xiao 2025-05-09   627  			clocks = <&cru ACLK_PCIE20_MST>, <&cru ACLK_PCIE20_SLV>,
515fd62224737a Finley Xiao 2025-05-09   628  				 <&cru ACLK_PCIE20_DBI>, <&cru PCLK_PCIE20>,
515fd62224737a Finley Xiao 2025-05-09   629  				 <&cru CLK_PCIE20_AUX>;
515fd62224737a Finley Xiao 2025-05-09   630  			clock-names = "aclk_mst", "aclk_slv",
515fd62224737a Finley Xiao 2025-05-09   631  				      "aclk_dbi", "pclk", "aux";
515fd62224737a Finley Xiao 2025-05-09   632  			device_type = "pci";
515fd62224737a Finley Xiao 2025-05-09   633  			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
515fd62224737a Finley Xiao 2025-05-09   634  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
515fd62224737a Finley Xiao 2025-05-09   635  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
515fd62224737a Finley Xiao 2025-05-09   636  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
515fd62224737a Finley Xiao 2025-05-09   637  				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
515fd62224737a Finley Xiao 2025-05-09   638  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   639  			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
515fd62224737a Finley Xiao 2025-05-09   640  			#interrupt-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   641  			interrupt-map-mask = <0 0 0 7>;
515fd62224737a Finley Xiao 2025-05-09   642  			interrupt-map = <0 0 0 1 &pcie2x1_intc 0>,
515fd62224737a Finley Xiao 2025-05-09   643  					<0 0 0 2 &pcie2x1_intc 1>,
515fd62224737a Finley Xiao 2025-05-09   644  					<0 0 0 3 &pcie2x1_intc 2>,
515fd62224737a Finley Xiao 2025-05-09   645  					<0 0 0 4 &pcie2x1_intc 3>;
515fd62224737a Finley Xiao 2025-05-09   646  			linux,pci-domain = <0>;
515fd62224737a Finley Xiao 2025-05-09   647  			max-link-speed = <2>;
515fd62224737a Finley Xiao 2025-05-09   648  			num-ib-windows = <8>;
515fd62224737a Finley Xiao 2025-05-09   649  			num-viewport = <8>;
515fd62224737a Finley Xiao 2025-05-09   650  			num-ob-windows = <2>;
515fd62224737a Finley Xiao 2025-05-09   651  			num-lanes = <1>;
515fd62224737a Finley Xiao 2025-05-09   652  			phys = <&combphy PHY_TYPE_PCIE>;
515fd62224737a Finley Xiao 2025-05-09   653  			phy-names = "pcie-phy";
515fd62224737a Finley Xiao 2025-05-09   654  			power-domains = <&power 15>;
515fd62224737a Finley Xiao 2025-05-09   655  			ranges = <0x01000000 0x0 0xfc100000 0x0 0xfc100000 0x0 0x100000
515fd62224737a Finley Xiao 2025-05-09   656  				  0x02000000 0x0 0xfc200000 0x0 0xfc200000 0x0 0x1e00000
515fd62224737a Finley Xiao 2025-05-09   657  				  0x03000000 0x3 0x00000000 0x3 0x00000000 0x0 0x40000000>;
515fd62224737a Finley Xiao 2025-05-09   658  			reg = <0x0 0xfe000000 0x0 0x400000>,
515fd62224737a Finley Xiao 2025-05-09   659  			      <0x0 0xff500000 0x0 0x10000>,
515fd62224737a Finley Xiao 2025-05-09   660  			      <0x0 0xfc000000 0x0 0x100000>;
515fd62224737a Finley Xiao 2025-05-09   661  			reg-names = "dbi", "apb", "config";
515fd62224737a Finley Xiao 2025-05-09   662  			resets = <&cru SRST_PCIE20_POWERUP>;
515fd62224737a Finley Xiao 2025-05-09   663  			reset-names = "pipe";
515fd62224737a Finley Xiao 2025-05-09   664  			#address-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   665  			#size-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09   666  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   667  
515fd62224737a Finley Xiao 2025-05-09   668  			pcie2x1_intc: legacy-interrupt-controller {
515fd62224737a Finley Xiao 2025-05-09   669  				interrupt-controller;
515fd62224737a Finley Xiao 2025-05-09   670  				#address-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   671  				#interrupt-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   672  				interrupt-parent = <&gic>;
515fd62224737a Finley Xiao 2025-05-09   673  				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   674  			};
515fd62224737a Finley Xiao 2025-05-09   675  		};
515fd62224737a Finley Xiao 2025-05-09   676  
515fd62224737a Finley Xiao 2025-05-09   677  		spi1: spi@ff640000 {
515fd62224737a Finley Xiao 2025-05-09   678  			compatible = "rockchip,rk3066-spi";
515fd62224737a Finley Xiao 2025-05-09   679  			reg = <0x0 0xff640000 0x0 0x1000>;
515fd62224737a Finley Xiao 2025-05-09   680  			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   681  			clocks = <&cru CLK_SPI1>, <&cru PCLK_SPI1>;
515fd62224737a Finley Xiao 2025-05-09   682  			clock-names = "spiclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   683  			dmas = <&dmac 15>, <&dmac 14>;
515fd62224737a Finley Xiao 2025-05-09   684  			dma-names = "tx", "rx";
515fd62224737a Finley Xiao 2025-05-09   685  			num-cs = <2>;
515fd62224737a Finley Xiao 2025-05-09   686  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   687  			pinctrl-0 = <&spi1m0_csn0 &spi1m0_csn1 &spi1m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   688  			#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   689  			#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   690  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   691  		};
515fd62224737a Finley Xiao 2025-05-09   692  
515fd62224737a Finley Xiao 2025-05-09   693  		spi2: spi@ff650000 {
515fd62224737a Finley Xiao 2025-05-09   694  			compatible = "rockchip,rk3066-spi";
515fd62224737a Finley Xiao 2025-05-09   695  			reg = <0x0 0xff650000 0x0 0x1000>;
515fd62224737a Finley Xiao 2025-05-09   696  			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   697  			clocks = <&cru CLK_SPI2>, <&cru PCLK_SPI2>;
515fd62224737a Finley Xiao 2025-05-09   698  			clock-names = "spiclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   699  			dmas = <&dmac 17>, <&dmac 16>;
515fd62224737a Finley Xiao 2025-05-09   700  			dma-names = "tx", "rx";
515fd62224737a Finley Xiao 2025-05-09   701  			num-cs = <2>;
515fd62224737a Finley Xiao 2025-05-09   702  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   703  			pinctrl-0 = <&spi2m0_csn0 &spi2m0_csn1 &spi2m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   704  			#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   705  			#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   706  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   707  		};
515fd62224737a Finley Xiao 2025-05-09   708  
515fd62224737a Finley Xiao 2025-05-09   709  		uart1: serial@ff670000 {
515fd62224737a Finley Xiao 2025-05-09   710  			compatible = "rockchip,rk3562-uart", "snps,dw-apb-uart";
515fd62224737a Finley Xiao 2025-05-09   711  			reg = <0x0 0xff670000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   712  			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   713  			clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
515fd62224737a Finley Xiao 2025-05-09   714  			clock-names = "baudclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   715  			reg-shift = <2>;
515fd62224737a Finley Xiao 2025-05-09   716  			reg-io-width = <4>;
515fd62224737a Finley Xiao 2025-05-09   717  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   718  		};
515fd62224737a Finley Xiao 2025-05-09   719  
515fd62224737a Finley Xiao 2025-05-09   720  		uart2: serial@ff680000 {
515fd62224737a Finley Xiao 2025-05-09   721  			compatible = "rockchip,rk3562-uart", "snps,dw-apb-uart";
515fd62224737a Finley Xiao 2025-05-09   722  			reg = <0x0 0xff680000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   723  			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   724  			clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
515fd62224737a Finley Xiao 2025-05-09   725  			clock-names = "baudclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   726  			reg-shift = <2>;
515fd62224737a Finley Xiao 2025-05-09   727  			reg-io-width = <4>;
515fd62224737a Finley Xiao 2025-05-09   728  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   729  		};
515fd62224737a Finley Xiao 2025-05-09   730  
515fd62224737a Finley Xiao 2025-05-09   731  		uart3: serial@ff690000 {
515fd62224737a Finley Xiao 2025-05-09   732  			compatible = "rockchip,rk3562-uart", "snps,dw-apb-uart";
515fd62224737a Finley Xiao 2025-05-09   733  			reg = <0x0 0xff690000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   734  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   735  			clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
515fd62224737a Finley Xiao 2025-05-09   736  			clock-names = "baudclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   737  			reg-shift = <2>;
515fd62224737a Finley Xiao 2025-05-09   738  			reg-io-width = <4>;
515fd62224737a Finley Xiao 2025-05-09   739  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   740  		};
515fd62224737a Finley Xiao 2025-05-09   741  
515fd62224737a Finley Xiao 2025-05-09   742  		uart4: serial@ff6a0000 {
515fd62224737a Finley Xiao 2025-05-09   743  			compatible = "rockchip,rk3562-uart", "snps,dw-apb-uart";
515fd62224737a Finley Xiao 2025-05-09   744  			reg = <0x0 0xff6a0000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   745  			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   746  			clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
515fd62224737a Finley Xiao 2025-05-09   747  			clock-names = "baudclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   748  			reg-shift = <2>;
515fd62224737a Finley Xiao 2025-05-09   749  			reg-io-width = <4>;
515fd62224737a Finley Xiao 2025-05-09   750  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   751  		};
515fd62224737a Finley Xiao 2025-05-09   752  
515fd62224737a Finley Xiao 2025-05-09   753  		uart5: serial@ff6b0000 {
515fd62224737a Finley Xiao 2025-05-09   754  			compatible = "rockchip,rk3562-uart", "snps,dw-apb-uart";
515fd62224737a Finley Xiao 2025-05-09   755  			reg = <0x0 0xff6b0000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   756  			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   757  			clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
515fd62224737a Finley Xiao 2025-05-09   758  			clock-names = "baudclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   759  			reg-shift = <2>;
515fd62224737a Finley Xiao 2025-05-09   760  			reg-io-width = <4>;
515fd62224737a Finley Xiao 2025-05-09   761  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   762  		};
515fd62224737a Finley Xiao 2025-05-09   763  
515fd62224737a Finley Xiao 2025-05-09   764  		uart6: serial@ff6c0000 {
515fd62224737a Finley Xiao 2025-05-09   765  			compatible = "rockchip,rk3562-uart", "snps,dw-apb-uart";
515fd62224737a Finley Xiao 2025-05-09   766  			reg = <0x0 0xff6c0000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   767  			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   768  			clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
515fd62224737a Finley Xiao 2025-05-09   769  			clock-names = "baudclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   770  			reg-shift = <2>;
515fd62224737a Finley Xiao 2025-05-09   771  			reg-io-width = <4>;
515fd62224737a Finley Xiao 2025-05-09   772  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   773  		};
515fd62224737a Finley Xiao 2025-05-09   774  
515fd62224737a Finley Xiao 2025-05-09   775  		uart7: serial@ff6d0000 {
515fd62224737a Finley Xiao 2025-05-09   776  			compatible = "rockchip,rk3562-uart", "snps,dw-apb-uart";
515fd62224737a Finley Xiao 2025-05-09   777  			reg = <0x0 0xff6d0000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   778  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   779  			clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
515fd62224737a Finley Xiao 2025-05-09   780  			clock-names = "baudclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   781  			reg-shift = <2>;
515fd62224737a Finley Xiao 2025-05-09   782  			reg-io-width = <4>;
515fd62224737a Finley Xiao 2025-05-09   783  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   784  		};
515fd62224737a Finley Xiao 2025-05-09   785  
515fd62224737a Finley Xiao 2025-05-09   786  		uart8: serial@ff6e0000 {
515fd62224737a Finley Xiao 2025-05-09   787  			compatible = "rockchip,rk3562-uart", "snps,dw-apb-uart";
515fd62224737a Finley Xiao 2025-05-09   788  			reg = <0x0 0xff6e0000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   789  			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   790  			clocks = <&cru SCLK_UART8>, <&cru PCLK_UART8>;
515fd62224737a Finley Xiao 2025-05-09   791  			clock-names = "baudclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   792  			reg-shift = <2>;
515fd62224737a Finley Xiao 2025-05-09   793  			reg-io-width = <4>;
515fd62224737a Finley Xiao 2025-05-09   794  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   795  		};
515fd62224737a Finley Xiao 2025-05-09   796  
515fd62224737a Finley Xiao 2025-05-09   797  		uart9: serial@ff6f0000 {
515fd62224737a Finley Xiao 2025-05-09   798  			compatible = "rockchip,rk3562-uart", "snps,dw-apb-uart";
515fd62224737a Finley Xiao 2025-05-09   799  			reg = <0x0 0xff6f0000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   800  			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   801  			clocks = <&cru SCLK_UART9>, <&cru PCLK_UART9>;
515fd62224737a Finley Xiao 2025-05-09   802  			clock-names = "baudclk", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   803  			reg-shift = <2>;
515fd62224737a Finley Xiao 2025-05-09   804  			reg-io-width = <4>;
515fd62224737a Finley Xiao 2025-05-09   805  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   806  		};
515fd62224737a Finley Xiao 2025-05-09   807  
515fd62224737a Finley Xiao 2025-05-09   808  		pwm4: pwm@ff700000 {
515fd62224737a Finley Xiao 2025-05-09   809  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   810  			reg = <0x0 0xff700000 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   811  			clocks = <&cru CLK_PWM1_PERI>, <&cru PCLK_PWM1_PERI>;
515fd62224737a Finley Xiao 2025-05-09   812  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   813  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   814  			pinctrl-0 = <&pwm4m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   815  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   816  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   817  		};
515fd62224737a Finley Xiao 2025-05-09   818  
515fd62224737a Finley Xiao 2025-05-09   819  		pwm5: pwm@ff700010 {
515fd62224737a Finley Xiao 2025-05-09   820  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   821  			reg = <0x0 0xff700010 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   822  			clocks = <&cru CLK_PWM1_PERI>, <&cru PCLK_PWM1_PERI>;
515fd62224737a Finley Xiao 2025-05-09   823  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   824  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   825  			pinctrl-0 = <&pwm5m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   826  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   827  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   828  		};
515fd62224737a Finley Xiao 2025-05-09   829  
515fd62224737a Finley Xiao 2025-05-09   830  		pwm6: pwm@ff700020 {
515fd62224737a Finley Xiao 2025-05-09   831  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   832  			reg = <0x0 0xff700020 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   833  			clocks = <&cru CLK_PWM1_PERI>, <&cru PCLK_PWM1_PERI>;
515fd62224737a Finley Xiao 2025-05-09   834  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   835  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   836  			pinctrl-0 = <&pwm6m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   837  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   838  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   839  		};
515fd62224737a Finley Xiao 2025-05-09   840  
515fd62224737a Finley Xiao 2025-05-09   841  		pwm7: pwm@ff700030 {
515fd62224737a Finley Xiao 2025-05-09   842  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   843  			reg = <0x0 0xff700030 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   844  			clocks = <&cru CLK_PWM1_PERI>, <&cru PCLK_PWM1_PERI>;
515fd62224737a Finley Xiao 2025-05-09   845  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   846  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   847  			pinctrl-0 = <&pwm7m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   848  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   849  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   850  		};
515fd62224737a Finley Xiao 2025-05-09   851  
515fd62224737a Finley Xiao 2025-05-09   852  		pwm8: pwm@ff710000 {
515fd62224737a Finley Xiao 2025-05-09   853  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   854  			reg = <0x0 0xff710000 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   855  			clocks = <&cru CLK_PWM2_PERI>, <&cru PCLK_PWM2_PERI>;
515fd62224737a Finley Xiao 2025-05-09   856  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   857  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   858  			pinctrl-0 = <&pwm8m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   859  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   860  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   861  		};
515fd62224737a Finley Xiao 2025-05-09   862  
515fd62224737a Finley Xiao 2025-05-09   863  		pwm9: pwm@ff710010 {
515fd62224737a Finley Xiao 2025-05-09   864  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   865  			reg = <0x0 0xff710010 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   866  			clocks = <&cru CLK_PWM2_PERI>, <&cru PCLK_PWM2_PERI>;
515fd62224737a Finley Xiao 2025-05-09   867  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   868  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   869  			pinctrl-0 = <&pwm9m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   870  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   871  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   872  		};
515fd62224737a Finley Xiao 2025-05-09   873  
515fd62224737a Finley Xiao 2025-05-09   874  		pwm10: pwm@ff710020 {
515fd62224737a Finley Xiao 2025-05-09   875  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   876  			reg = <0x0 0xff710020 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   877  			clocks = <&cru CLK_PWM2_PERI>, <&cru PCLK_PWM2_PERI>;
515fd62224737a Finley Xiao 2025-05-09   878  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   879  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   880  			pinctrl-0 = <&pwm10m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   881  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   882  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   883  		};
515fd62224737a Finley Xiao 2025-05-09   884  
515fd62224737a Finley Xiao 2025-05-09   885  		pwm11: pwm@ff710030 {
515fd62224737a Finley Xiao 2025-05-09   886  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   887  			reg = <0x0 0xff710030 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   888  			clocks = <&cru CLK_PWM2_PERI>, <&cru PCLK_PWM2_PERI>;
515fd62224737a Finley Xiao 2025-05-09   889  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   890  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   891  			pinctrl-0 = <&pwm11m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   892  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   893  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   894  		};
515fd62224737a Finley Xiao 2025-05-09   895  
515fd62224737a Finley Xiao 2025-05-09   896  		pwm12: pwm@ff720000 {
515fd62224737a Finley Xiao 2025-05-09   897  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   898  			reg = <0x0 0xff720000 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   899  			clocks = <&cru CLK_PWM3_PERI>, <&cru PCLK_PWM3_PERI>;
515fd62224737a Finley Xiao 2025-05-09   900  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   901  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   902  			pinctrl-0 = <&pwm12m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   903  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   904  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   905  		};
515fd62224737a Finley Xiao 2025-05-09   906  
515fd62224737a Finley Xiao 2025-05-09   907  		pwm13: pwm@ff720010 {
515fd62224737a Finley Xiao 2025-05-09   908  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   909  			reg = <0x0 0xff720010 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   910  			clocks = <&cru CLK_PWM3_PERI>, <&cru PCLK_PWM3_PERI>;
515fd62224737a Finley Xiao 2025-05-09   911  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   912  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   913  			pinctrl-0 = <&pwm13m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   914  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   915  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   916  		};
515fd62224737a Finley Xiao 2025-05-09   917  
515fd62224737a Finley Xiao 2025-05-09   918  		pwm14: pwm@ff720020 {
515fd62224737a Finley Xiao 2025-05-09   919  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   920  			reg = <0x0 0xff720020 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   921  			clocks = <&cru CLK_PWM3_PERI>, <&cru PCLK_PWM3_PERI>;
515fd62224737a Finley Xiao 2025-05-09   922  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   923  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   924  			pinctrl-0 = <&pwm14m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   925  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   926  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   927  		};
515fd62224737a Finley Xiao 2025-05-09   928  
515fd62224737a Finley Xiao 2025-05-09   929  		pwm15: pwm@ff720030 {
515fd62224737a Finley Xiao 2025-05-09   930  			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
515fd62224737a Finley Xiao 2025-05-09   931  			reg = <0x0 0xff720030 0x0 0x10>;
515fd62224737a Finley Xiao 2025-05-09   932  			clocks = <&cru CLK_PWM3_PERI>, <&cru PCLK_PWM3_PERI>;
515fd62224737a Finley Xiao 2025-05-09   933  			clock-names = "pwm", "pclk";
515fd62224737a Finley Xiao 2025-05-09   934  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09   935  			pinctrl-0 = <&pwm15m0_pins>;
515fd62224737a Finley Xiao 2025-05-09   936  			#pwm-cells = <3>;
515fd62224737a Finley Xiao 2025-05-09   937  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   938  		};
515fd62224737a Finley Xiao 2025-05-09   939  
515fd62224737a Finley Xiao 2025-05-09   940  		saradc0: adc@ff730000 {
515fd62224737a Finley Xiao 2025-05-09   941  			compatible = "rockchip,rk3562-saradc";
515fd62224737a Finley Xiao 2025-05-09   942  			reg = <0x0 0xff730000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   943  			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   944  			clocks = <&cru CLK_SARADC>, <&cru PCLK_SARADC>;
515fd62224737a Finley Xiao 2025-05-09   945  			clock-names = "saradc", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09   946  			resets = <&cru SRST_P_SARADC>;
515fd62224737a Finley Xiao 2025-05-09   947  			reset-names = "saradc-apb";
515fd62224737a Finley Xiao 2025-05-09   948  			#io-channel-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   949  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   950  		};
515fd62224737a Finley Xiao 2025-05-09   951  
515fd62224737a Finley Xiao 2025-05-09   952  		combphy: phy@ff750000 {
515fd62224737a Finley Xiao 2025-05-09   953  			compatible = "rockchip,rk3562-naneng-combphy";
515fd62224737a Finley Xiao 2025-05-09   954  			reg = <0x0 0xff750000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09   955  			#phy-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   956  			clocks = <&cru CLK_PIPEPHY_REF>, <&cru PCLK_PIPEPHY>,
515fd62224737a Finley Xiao 2025-05-09   957  				 <&cru PCLK_PHP>;
515fd62224737a Finley Xiao 2025-05-09   958  			clock-names = "ref", "apb", "pipe";
515fd62224737a Finley Xiao 2025-05-09   959  			assigned-clocks = <&cru CLK_PIPEPHY_REF>;
515fd62224737a Finley Xiao 2025-05-09   960  			assigned-clock-rates = <100000000>;
515fd62224737a Finley Xiao 2025-05-09   961  			resets = <&cru SRST_PIPEPHY>;
515fd62224737a Finley Xiao 2025-05-09   962  			reset-names = "phy";
515fd62224737a Finley Xiao 2025-05-09   963  			rockchip,pipe-grf = <&peri_grf>;
515fd62224737a Finley Xiao 2025-05-09   964  			rockchip,pipe-phy-grf = <&pipephy_grf>;
515fd62224737a Finley Xiao 2025-05-09   965  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   966  		};
515fd62224737a Finley Xiao 2025-05-09   967  
515fd62224737a Finley Xiao 2025-05-09   968  		sfc: spi@ff860000 {
515fd62224737a Finley Xiao 2025-05-09   969  			compatible = "rockchip,sfc";
515fd62224737a Finley Xiao 2025-05-09   970  			reg = <0x0 0xff860000 0x0 0x10000>;
515fd62224737a Finley Xiao 2025-05-09   971  			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   972  			clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
515fd62224737a Finley Xiao 2025-05-09   973  			clock-names = "clk_sfc", "hclk_sfc";
515fd62224737a Finley Xiao 2025-05-09   974  			#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09   975  			#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09   976  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   977  		};
515fd62224737a Finley Xiao 2025-05-09   978  
515fd62224737a Finley Xiao 2025-05-09   979  		sdhci: mmc@ff870000 {
515fd62224737a Finley Xiao 2025-05-09   980  			compatible = "rockchip,rk3562-dwcmshc", "rockchip,rk3588-dwcmshc";
515fd62224737a Finley Xiao 2025-05-09   981  			reg = <0x0 0xff870000 0x0 0x10000>;
515fd62224737a Finley Xiao 2025-05-09   982  			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09   983  			assigned-clocks = <&cru BCLK_EMMC>, <&cru CCLK_EMMC>;
515fd62224737a Finley Xiao 2025-05-09   984  			assigned-clock-rates = <200000000>, <200000000>;
515fd62224737a Finley Xiao 2025-05-09   985  			clocks = <&cru CCLK_EMMC>, <&cru HCLK_EMMC>,
515fd62224737a Finley Xiao 2025-05-09   986  				 <&cru ACLK_EMMC>, <&cru BCLK_EMMC>,
515fd62224737a Finley Xiao 2025-05-09   987  				 <&cru TMCLK_EMMC>;
515fd62224737a Finley Xiao 2025-05-09   988  			clock-names = "core", "bus", "axi", "block", "timer";
515fd62224737a Finley Xiao 2025-05-09   989  			resets = <&cru SRST_C_EMMC>, <&cru SRST_H_EMMC>,
515fd62224737a Finley Xiao 2025-05-09   990  				 <&cru SRST_A_EMMC>, <&cru SRST_B_EMMC>,
515fd62224737a Finley Xiao 2025-05-09   991  				 <&cru SRST_T_EMMC>;
515fd62224737a Finley Xiao 2025-05-09   992  			reset-names = "core", "bus", "axi", "block", "timer";
515fd62224737a Finley Xiao 2025-05-09   993  			max-frequency = <200000000>;
515fd62224737a Finley Xiao 2025-05-09   994  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09   995  		};
515fd62224737a Finley Xiao 2025-05-09   996  
515fd62224737a Finley Xiao 2025-05-09   997  		sdmmc0: mmc@ff880000 {
515fd62224737a Finley Xiao 2025-05-09   998  			compatible = "rockchip,rk3562-dw-mshc",
515fd62224737a Finley Xiao 2025-05-09   999  				     "rockchip,rk3288-dw-mshc";
515fd62224737a Finley Xiao 2025-05-09  1000  			reg = <0x0 0xff880000 0x0 0x10000>;
515fd62224737a Finley Xiao 2025-05-09  1001  			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1002  			clocks = <&cru HCLK_SDMMC0>, <&cru CCLK_SDMMC0>,
515fd62224737a Finley Xiao 2025-05-09  1003  				 <&cru SCLK_SDMMC0_DRV>, <&cru SCLK_SDMMC0_SAMPLE>;
515fd62224737a Finley Xiao 2025-05-09  1004  			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
515fd62224737a Finley Xiao 2025-05-09  1005  			fifo-depth = <0x100>;
515fd62224737a Finley Xiao 2025-05-09  1006  			max-frequency = <200000000>;
515fd62224737a Finley Xiao 2025-05-09  1007  			resets = <&cru SRST_H_SDMMC0>;
515fd62224737a Finley Xiao 2025-05-09  1008  			reset-names = "reset";
515fd62224737a Finley Xiao 2025-05-09  1009  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09  1010  		};
515fd62224737a Finley Xiao 2025-05-09  1011  
515fd62224737a Finley Xiao 2025-05-09  1012  		sdmmc1: mmc@ff890000 {
515fd62224737a Finley Xiao 2025-05-09  1013  			compatible = "rockchip,rk3562-dw-mshc",
515fd62224737a Finley Xiao 2025-05-09  1014  				     "rockchip,rk3288-dw-mshc";
515fd62224737a Finley Xiao 2025-05-09  1015  			reg = <0x0 0xff890000 0x0 0x10000>;
515fd62224737a Finley Xiao 2025-05-09  1016  			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1017  			clocks = <&cru HCLK_SDMMC1>, <&cru CCLK_SDMMC1>,
515fd62224737a Finley Xiao 2025-05-09  1018  				 <&cru SCLK_SDMMC1_DRV>, <&cru SCLK_SDMMC1_SAMPLE>;
515fd62224737a Finley Xiao 2025-05-09  1019  			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
515fd62224737a Finley Xiao 2025-05-09  1020  			fifo-depth = <0x100>;
515fd62224737a Finley Xiao 2025-05-09  1021  			max-frequency = <200000000>;
515fd62224737a Finley Xiao 2025-05-09  1022  			resets = <&cru SRST_H_SDMMC1>;
515fd62224737a Finley Xiao 2025-05-09  1023  			reset-names = "reset";
515fd62224737a Finley Xiao 2025-05-09  1024  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09  1025  		};
515fd62224737a Finley Xiao 2025-05-09  1026  
515fd62224737a Finley Xiao 2025-05-09  1027  		dmac: dma-controller@ff990000 {
515fd62224737a Finley Xiao 2025-05-09  1028  			compatible = "arm,pl330", "arm,primecell";
515fd62224737a Finley Xiao 2025-05-09  1029  			reg = <0x0 0xff990000 0x0 0x4000>;
515fd62224737a Finley Xiao 2025-05-09  1030  			arm,pl330-periph-burst;
515fd62224737a Finley Xiao 2025-05-09  1031  			clocks = <&cru ACLK_DMAC>;
515fd62224737a Finley Xiao 2025-05-09  1032  			clock-names = "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09  1033  			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
515fd62224737a Finley Xiao 2025-05-09  1034  				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1035  			#dma-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09  1036  		};
515fd62224737a Finley Xiao 2025-05-09  1037  
515fd62224737a Finley Xiao 2025-05-09  1038  		i2c1: i2c@ffa00000 {
515fd62224737a Finley Xiao 2025-05-09  1039  			compatible = "rockchip,rk3562-i2c", "rockchip,rk3399-i2c";
515fd62224737a Finley Xiao 2025-05-09  1040  			reg = <0x0 0xffa00000 0x0 0x1000>;
515fd62224737a Finley Xiao 2025-05-09  1041  			clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
515fd62224737a Finley Xiao 2025-05-09  1042  			clock-names = "i2c", "pclk";
515fd62224737a Finley Xiao 2025-05-09  1043  			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1044  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09  1045  			pinctrl-0 = <&i2c1m0_xfer>;
515fd62224737a Finley Xiao 2025-05-09  1046  			#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09  1047  			#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09  1048  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09  1049  		};
515fd62224737a Finley Xiao 2025-05-09  1050  
515fd62224737a Finley Xiao 2025-05-09  1051  		i2c2: i2c@ffa10000 {
515fd62224737a Finley Xiao 2025-05-09  1052  			compatible = "rockchip,rk3562-i2c", "rockchip,rk3399-i2c";
515fd62224737a Finley Xiao 2025-05-09  1053  			reg = <0x0 0xffa10000 0x0 0x1000>;
515fd62224737a Finley Xiao 2025-05-09  1054  			clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
515fd62224737a Finley Xiao 2025-05-09  1055  			clock-names = "i2c", "pclk";
515fd62224737a Finley Xiao 2025-05-09  1056  			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1057  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09  1058  			pinctrl-0 = <&i2c2m0_xfer>;
515fd62224737a Finley Xiao 2025-05-09  1059  			#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09  1060  			#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09  1061  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09  1062  		};
515fd62224737a Finley Xiao 2025-05-09  1063  
515fd62224737a Finley Xiao 2025-05-09  1064  		i2c3: i2c@ffa20000 {
515fd62224737a Finley Xiao 2025-05-09  1065  			compatible = "rockchip,rk3562-i2c", "rockchip,rk3399-i2c";
515fd62224737a Finley Xiao 2025-05-09  1066  			reg = <0x0 0xffa20000 0x0 0x1000>;
515fd62224737a Finley Xiao 2025-05-09  1067  			clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
515fd62224737a Finley Xiao 2025-05-09  1068  			clock-names = "i2c", "pclk";
515fd62224737a Finley Xiao 2025-05-09  1069  			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1070  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09  1071  			pinctrl-0 = <&i2c3m0_xfer>;
515fd62224737a Finley Xiao 2025-05-09  1072  			#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09  1073  			#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09  1074  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09  1075  		};
515fd62224737a Finley Xiao 2025-05-09  1076  
515fd62224737a Finley Xiao 2025-05-09  1077  		i2c4: i2c@ffa30000 {
515fd62224737a Finley Xiao 2025-05-09  1078  			compatible = "rockchip,rk3562-i2c", "rockchip,rk3399-i2c";
515fd62224737a Finley Xiao 2025-05-09  1079  			reg = <0x0 0xffa30000 0x0 0x1000>;
515fd62224737a Finley Xiao 2025-05-09  1080  			clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
515fd62224737a Finley Xiao 2025-05-09  1081  			clock-names = "i2c", "pclk";
515fd62224737a Finley Xiao 2025-05-09  1082  			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1083  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09  1084  			pinctrl-0 = <&i2c4m0_xfer>;
515fd62224737a Finley Xiao 2025-05-09  1085  			#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09  1086  			#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09  1087  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09  1088  		};
515fd62224737a Finley Xiao 2025-05-09  1089  
515fd62224737a Finley Xiao 2025-05-09  1090  		i2c5: i2c@ffa40000 {
515fd62224737a Finley Xiao 2025-05-09  1091  			compatible = "rockchip,rk3562-i2c", "rockchip,rk3399-i2c";
515fd62224737a Finley Xiao 2025-05-09  1092  			reg = <0x0 0xffa40000 0x0 0x1000>;
515fd62224737a Finley Xiao 2025-05-09  1093  			clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
515fd62224737a Finley Xiao 2025-05-09  1094  			clock-names = "i2c", "pclk";
515fd62224737a Finley Xiao 2025-05-09  1095  			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1096  			pinctrl-names = "default";
515fd62224737a Finley Xiao 2025-05-09  1097  			pinctrl-0 = <&i2c5m0_xfer>;
515fd62224737a Finley Xiao 2025-05-09  1098  			#address-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09  1099  			#size-cells = <0>;
515fd62224737a Finley Xiao 2025-05-09  1100  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09  1101  		};
515fd62224737a Finley Xiao 2025-05-09  1102  
515fd62224737a Finley Xiao 2025-05-09  1103  		saradc1: adc@ffaa0000 {
515fd62224737a Finley Xiao 2025-05-09  1104  			compatible = "rockchip,rk3562-saradc";
515fd62224737a Finley Xiao 2025-05-09  1105  			reg = <0x0 0xffaa0000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09  1106  			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1107  			clocks = <&cru CLK_SARADC_VCCIO156>, <&cru PCLK_SARADC_VCCIO156>;
515fd62224737a Finley Xiao 2025-05-09  1108  			clock-names = "saradc", "apb_pclk";
515fd62224737a Finley Xiao 2025-05-09  1109  			resets = <&cru SRST_P_SARADC_VCCIO156>;
515fd62224737a Finley Xiao 2025-05-09  1110  			reset-names = "saradc-apb";
515fd62224737a Finley Xiao 2025-05-09  1111  			#io-channel-cells = <1>;
515fd62224737a Finley Xiao 2025-05-09  1112  			status = "disabled";
515fd62224737a Finley Xiao 2025-05-09  1113  		};
515fd62224737a Finley Xiao 2025-05-09  1114  
515fd62224737a Finley Xiao 2025-05-09  1115  		pinctrl: pinctrl {
515fd62224737a Finley Xiao 2025-05-09  1116  			compatible = "rockchip,rk3562-pinctrl";
515fd62224737a Finley Xiao 2025-05-09  1117  			rockchip,grf = <&ioc_grf>;
515fd62224737a Finley Xiao 2025-05-09  1118  			#address-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09  1119  			#size-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09  1120  			ranges;
515fd62224737a Finley Xiao 2025-05-09  1121  
515fd62224737a Finley Xiao 2025-05-09  1122  			gpio0: gpio@ff260000 {
515fd62224737a Finley Xiao 2025-05-09  1123  				compatible = "rockchip,gpio-bank";
515fd62224737a Finley Xiao 2025-05-09  1124  				reg = <0x0 0xff260000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09  1125  				clocks = <&cru PCLK_PMU0_GPIO0>, <&cru DBCLK_PMU0_GPIO0>;
515fd62224737a Finley Xiao 2025-05-09  1126  				gpio-controller;
515fd62224737a Finley Xiao 2025-05-09  1127  				gpio-ranges = <&pinctrl 0 0 32>;
515fd62224737a Finley Xiao 2025-05-09  1128  				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1129  				interrupt-controller;
515fd62224737a Finley Xiao 2025-05-09  1130  				#gpio-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09  1131  				#interrupt-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09  1132  			};
515fd62224737a Finley Xiao 2025-05-09  1133  
515fd62224737a Finley Xiao 2025-05-09  1134  			gpio1: gpio@ff620000 {
515fd62224737a Finley Xiao 2025-05-09  1135  				compatible = "rockchip,gpio-bank";
515fd62224737a Finley Xiao 2025-05-09  1136  				reg = <0x0 0xff620000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09  1137  				clocks = <&cru PCLK_PERI_GPIO1>, <&cru DCLK_PERI_GPIO1>;
515fd62224737a Finley Xiao 2025-05-09  1138  				gpio-controller;
515fd62224737a Finley Xiao 2025-05-09  1139  				gpio-ranges = <&pinctrl 0 32 32>;
515fd62224737a Finley Xiao 2025-05-09  1140  				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1141  				interrupt-controller;
515fd62224737a Finley Xiao 2025-05-09  1142  				#gpio-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09  1143  				#interrupt-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09  1144  			};
515fd62224737a Finley Xiao 2025-05-09  1145  
515fd62224737a Finley Xiao 2025-05-09  1146  			gpio2: gpio@ff630000 {
515fd62224737a Finley Xiao 2025-05-09  1147  				compatible = "rockchip,gpio-bank";
515fd62224737a Finley Xiao 2025-05-09  1148  				reg = <0x0 0xff630000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09  1149  				clocks = <&cru PCLK_PERI_GPIO2>, <&cru DCLK_PERI_GPIO2>;
515fd62224737a Finley Xiao 2025-05-09  1150  				gpio-controller;
515fd62224737a Finley Xiao 2025-05-09  1151  				gpio-ranges = <&pinctrl 0 64 32>;
515fd62224737a Finley Xiao 2025-05-09  1152  				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1153  				interrupt-controller;
515fd62224737a Finley Xiao 2025-05-09  1154  				#gpio-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09  1155  				#interrupt-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09  1156  			};
515fd62224737a Finley Xiao 2025-05-09  1157  
515fd62224737a Finley Xiao 2025-05-09  1158  			gpio3: gpio@ffac0000 {
515fd62224737a Finley Xiao 2025-05-09  1159  				compatible = "rockchip,gpio-bank";
515fd62224737a Finley Xiao 2025-05-09  1160  				reg = <0x0 0xffac0000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09  1161  				clocks = <&cru PCLK_GPIO3_VCCIO156>, <&cru DCLK_BUS_GPIO3>;
515fd62224737a Finley Xiao 2025-05-09  1162  				gpio-controller;
515fd62224737a Finley Xiao 2025-05-09  1163  				gpio-ranges = <&pinctrl 0 96 32>;
515fd62224737a Finley Xiao 2025-05-09  1164  				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1165  				interrupt-controller;
515fd62224737a Finley Xiao 2025-05-09  1166  				#gpio-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09  1167  				#interrupt-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09  1168  			};
515fd62224737a Finley Xiao 2025-05-09  1169  
515fd62224737a Finley Xiao 2025-05-09  1170  			gpio4: gpio@ffad0000 {
515fd62224737a Finley Xiao 2025-05-09  1171  				compatible = "rockchip,gpio-bank";
515fd62224737a Finley Xiao 2025-05-09  1172  				reg = <0x0 0xffad0000 0x0 0x100>;
515fd62224737a Finley Xiao 2025-05-09  1173  				clocks = <&cru PCLK_GPIO4_VCCIO156>, <&cru DCLK_BUS_GPIO4>;
515fd62224737a Finley Xiao 2025-05-09  1174  				gpio-controller;
515fd62224737a Finley Xiao 2025-05-09  1175  				gpio-ranges = <&pinctrl 0 128 32>;
515fd62224737a Finley Xiao 2025-05-09  1176  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
515fd62224737a Finley Xiao 2025-05-09  1177  				interrupt-controller;
515fd62224737a Finley Xiao 2025-05-09  1178  				#gpio-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09  1179  				#interrupt-cells = <2>;
515fd62224737a Finley Xiao 2025-05-09  1180  			};
515fd62224737a Finley Xiao 2025-05-09  1181  		};
515fd62224737a Finley Xiao 2025-05-09  1182  	};
515fd62224737a Finley Xiao 2025-05-09  1183  };
515fd62224737a Finley Xiao 2025-05-09  1184  

:::::: The code at line 624 was first introduced by commit
:::::: 515fd62224737a1dc5c1524a24494e73c0c963a0 arm64: dts: rockchip: add core dtsi for RK3562 SoC

:::::: TO: Finley Xiao <finley.xiao@rock-chips.com>
:::::: CC: Heiko Stuebner <heiko@sntech.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
