Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF100186E34
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 06:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718604907; cv=none; b=VROJT/yrPYqyhw8yJj5PEt8EtDDK2sZ5YkDklOGNi+cczKMk+doYpih3LqDDYKcPT9eJEeuptfvKykCOsbWPnGrgfChAfxEg6kqe3T8rRl6V3aE+ra4VILaEcU3/qaJznLiW2IXk5ZwkDvabxLuWNJV0+3dVLRICtGbc6VXarag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718604907; c=relaxed/simple;
	bh=YclFHk0T5v7GrzRuN5P+c2vN3P7WxdlhyvrDe3pAyB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZcwrinK3P6W5qdyn8/K059M4JdhZUHqjSlix2ERG03as6tSOf4agzFOt8qu6KN9/zoFxoVqP2s7suYBAgL7jyqN+/PSv7LNlc/PrOEptsiKVn2goxMA0crN2JmSQhV4NmiamRHhPD3z52RnaG8TD9rV8d9ROmlwWcu2Y4MbwRac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izEipFGZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izEipFGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718604900; x=1750140900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YclFHk0T5v7GrzRuN5P+c2vN3P7WxdlhyvrDe3pAyB8=;
  b=izEipFGZiGwCJ6vFgem8M5LSobqK58Km9cuJ+TBAFTplxt5kyN0XF4w5
   GXxEX73JI65k8csT5M/IwAISwB9EnjNcGDP9DAvlIEvuOto4Q3XxEKLWj
   uAKTLioma3+J2LpKwxR46xoSZqNCo7vePhLYBEJ1H91E/RxnBjFkkzWDr
   KmsRg7rPfl0IblwHg8B2jF1qLUNinQibGiYl0B+1GKXp2dJjtA4CUnn/1
   83Svh2/5jUXMbtqAdT2ovHr1onxarP3TyFW2H70kNKVbpEhLsVKja/Gxz
   gvzttk8To2a0mmqAZRt7g3oC2jsjr+M9rjJsoB3FN7pIfx8LYHuhOg8pv
   A==;
X-CSE-ConnectionGUID: x0NTJ7OEShieBcF+7fV/9A==
X-CSE-MsgGUID: o32qf86DQeavlr9dvX9mpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15139254"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15139254"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 23:15:00 -0700
X-CSE-ConnectionGUID: MVZqDihQSoy/OnTqAVuwGA==
X-CSE-MsgGUID: 2rZN6AVNRba2IVKpqkrG/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41200297"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jun 2024 23:14:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ5dn-0003sk-1l;
	Mon, 17 Jun 2024 06:14:55 +0000
Date: Mon, 17 Jun 2024 14:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Chintan Vankar <c-vankar@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 34/39]
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi:1920.34-1929.4: Warning
 (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202406171412.q2lU75Hz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y
head:   eeca5715c9a5b742423bd83ed587fac26268771c
commit: c6955c5d3fe279320fbd5ffe91fbc07c8d2d77ef [34/39] arm64: dts: ti: k3-j721s2-common-proc-board: Add MCU CPSW CPTS PPS support
config: arm64-randconfig-003-20240616 (https://download.01.org/0day-ci/archive/20240617/202406171412.q2lU75Hz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171412.q2lU75Hz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171412.q2lU75Hz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi:1920.34-1929.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +1920 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi

393eee04065d26 Matt Ranostay          2023-03-31    19  
b8545f9d3a5426 Aswath Govindraju      2021-12-07    20  &cbass_main {
b8545f9d3a5426 Aswath Govindraju      2021-12-07    21  	msmc_ram: sram@70000000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07    22  		compatible = "mmio-sram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07    23  		reg = <0x0 0x70000000 0x0 0x400000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07    24  		#address-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07    25  		#size-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07    26  		ranges = <0x0 0x0 0x70000000 0x400000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07    27  
b8545f9d3a5426 Aswath Govindraju      2021-12-07    28  		atf-sram@0 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07    29  			reg = <0x0 0x20000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07    30  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07    31  
b8545f9d3a5426 Aswath Govindraju      2021-12-07    32  		tifs-sram@1f0000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07    33  			reg = <0x1f0000 0x10000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07    34  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07    35  
b8545f9d3a5426 Aswath Govindraju      2021-12-07    36  		l3cache-sram@200000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07    37  			reg = <0x200000 0x200000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07    38  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07    39  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07    40  
20fcf9d691ff6c Aswath Govindraju      2023-03-31    41  	scm_conf: syscon@104000 {
20fcf9d691ff6c Aswath Govindraju      2023-03-31    42  		compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
20fcf9d691ff6c Aswath Govindraju      2023-03-31    43  		reg = <0x00 0x00104000 0x00 0x18000>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31    44  		#address-cells = <1>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31    45  		#size-cells = <1>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31    46  		ranges = <0x00 0x00 0x00104000 0x18000>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31    47  
20fcf9d691ff6c Aswath Govindraju      2023-03-31    48  		usb_serdes_mux: mux-controller@0 {
dded35c0577b72 Andrew Davis           2024-01-24    49  			compatible = "reg-mux";
20fcf9d691ff6c Aswath Govindraju      2023-03-31    50  			reg = <0x0 0x4>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31    51  			#mux-control-cells = <1>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31    52  			mux-reg-masks = <0x0 0x8000000>; /* USB0 to SERDES0 lane 1/3 mux */
20fcf9d691ff6c Aswath Govindraju      2023-03-31    53  		};
393eee04065d26 Matt Ranostay          2023-03-31    54  
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26    55  		phy_gmii_sel_cpsw: phy@34 {
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26    56  			compatible = "ti,am654-phy-gmii-sel";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26    57  			reg = <0x34 0x4>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26    58  			#phy-cells = <1>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26    59  		};
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26    60  
393eee04065d26 Matt Ranostay          2023-03-31    61  		serdes_ln_ctrl: mux-controller@80 {
9194c03a7744c6 Andrew Davis           2024-01-24    62  			compatible = "reg-mux";
393eee04065d26 Matt Ranostay          2023-03-31    63  			reg = <0x80 0x10>;
393eee04065d26 Matt Ranostay          2023-03-31    64  			#mux-control-cells = <1>;
9194c03a7744c6 Andrew Davis           2024-01-24    65  			mux-reg-masks = <0x0 0x3>, <0x4 0x3>, /* SERDES0 lane0/1 select */
9194c03a7744c6 Andrew Davis           2024-01-24    66  					<0x8 0x3>, <0xc 0x3>; /* SERDES0 lane2/3 select */
393eee04065d26 Matt Ranostay          2023-03-31    67  		};
99e7172db1ae01 Sinthu Raja            2023-07-21    68  
99e7172db1ae01 Sinthu Raja            2023-07-21    69  		ehrpwm_tbclk: clock-controller@140 {
99e7172db1ae01 Sinthu Raja            2023-07-21    70  			compatible = "ti,am654-ehrpwm-tbclk";
99e7172db1ae01 Sinthu Raja            2023-07-21    71  			reg = <0x140 0x18>;
99e7172db1ae01 Sinthu Raja            2023-07-21    72  			#clock-cells = <1>;
99e7172db1ae01 Sinthu Raja            2023-07-21    73  		};
e776ac0ef32af5 Rahul T R              2024-05-28    74  
e776ac0ef32af5 Rahul T R              2024-05-28    75  		edp_serdes_mux: mux-controller@310 {
e776ac0ef32af5 Rahul T R              2024-05-28    76  			compatible = "mmio-mux";
e776ac0ef32af5 Rahul T R              2024-05-28    77  			reg = <0x310 0x4>;
e776ac0ef32af5 Rahul T R              2024-05-28    78  			#mux-control-cells = <1>;
e776ac0ef32af5 Rahul T R              2024-05-28    79  			/* EDP0 to SERDES0 lane 0/1 or 2/3 mux */
e776ac0ef32af5 Rahul T R              2024-05-28    80  			mux-reg-masks = <0x310 0x10000000>;
e776ac0ef32af5 Rahul T R              2024-05-28    81  		};
99e7172db1ae01 Sinthu Raja            2023-07-21    82  	};
99e7172db1ae01 Sinthu Raja            2023-07-21    83  
99e7172db1ae01 Sinthu Raja            2023-07-21    84  	main_ehrpwm0: pwm@3000000 {
99e7172db1ae01 Sinthu Raja            2023-07-21    85  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
99e7172db1ae01 Sinthu Raja            2023-07-21    86  		#pwm-cells = <3>;
99e7172db1ae01 Sinthu Raja            2023-07-21    87  		reg = <0x00 0x3000000 0x00 0x100>;
99e7172db1ae01 Sinthu Raja            2023-07-21    88  		power-domains = <&k3_pds 160 TI_SCI_PD_EXCLUSIVE>;
99e7172db1ae01 Sinthu Raja            2023-07-21    89  		clocks = <&ehrpwm_tbclk 0>, <&k3_clks 160 0>;
99e7172db1ae01 Sinthu Raja            2023-07-21    90  		clock-names = "tbclk", "fck";
99e7172db1ae01 Sinthu Raja            2023-07-21    91  		status = "disabled";
99e7172db1ae01 Sinthu Raja            2023-07-21    92  	};
99e7172db1ae01 Sinthu Raja            2023-07-21    93  
99e7172db1ae01 Sinthu Raja            2023-07-21    94  	main_ehrpwm1: pwm@3010000 {
99e7172db1ae01 Sinthu Raja            2023-07-21    95  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
99e7172db1ae01 Sinthu Raja            2023-07-21    96  		#pwm-cells = <3>;
99e7172db1ae01 Sinthu Raja            2023-07-21    97  		reg = <0x00 0x3010000 0x00 0x100>;
99e7172db1ae01 Sinthu Raja            2023-07-21    98  		power-domains = <&k3_pds 161 TI_SCI_PD_EXCLUSIVE>;
99e7172db1ae01 Sinthu Raja            2023-07-21    99  		clocks = <&ehrpwm_tbclk 1>, <&k3_clks 161 0>;
99e7172db1ae01 Sinthu Raja            2023-07-21   100  		clock-names = "tbclk", "fck";
99e7172db1ae01 Sinthu Raja            2023-07-21   101  		status = "disabled";
99e7172db1ae01 Sinthu Raja            2023-07-21   102  	};
99e7172db1ae01 Sinthu Raja            2023-07-21   103  
99e7172db1ae01 Sinthu Raja            2023-07-21   104  	main_ehrpwm2: pwm@3020000 {
99e7172db1ae01 Sinthu Raja            2023-07-21   105  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
99e7172db1ae01 Sinthu Raja            2023-07-21   106  		#pwm-cells = <3>;
99e7172db1ae01 Sinthu Raja            2023-07-21   107  		reg = <0x00 0x3020000 0x00 0x100>;
99e7172db1ae01 Sinthu Raja            2023-07-21   108  		power-domains = <&k3_pds 162 TI_SCI_PD_EXCLUSIVE>;
99e7172db1ae01 Sinthu Raja            2023-07-21   109  		clocks = <&ehrpwm_tbclk 2>, <&k3_clks 162 0>;
99e7172db1ae01 Sinthu Raja            2023-07-21   110  		clock-names = "tbclk", "fck";
99e7172db1ae01 Sinthu Raja            2023-07-21   111  		status = "disabled";
99e7172db1ae01 Sinthu Raja            2023-07-21   112  	};
99e7172db1ae01 Sinthu Raja            2023-07-21   113  
99e7172db1ae01 Sinthu Raja            2023-07-21   114  	main_ehrpwm3: pwm@3030000 {
99e7172db1ae01 Sinthu Raja            2023-07-21   115  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
99e7172db1ae01 Sinthu Raja            2023-07-21   116  		#pwm-cells = <3>;
99e7172db1ae01 Sinthu Raja            2023-07-21   117  		reg = <0x00 0x3030000 0x00 0x100>;
99e7172db1ae01 Sinthu Raja            2023-07-21   118  		power-domains = <&k3_pds 163 TI_SCI_PD_EXCLUSIVE>;
99e7172db1ae01 Sinthu Raja            2023-07-21   119  		clocks = <&ehrpwm_tbclk 3>, <&k3_clks 163 0>;
99e7172db1ae01 Sinthu Raja            2023-07-21   120  		clock-names = "tbclk", "fck";
99e7172db1ae01 Sinthu Raja            2023-07-21   121  		status = "disabled";
99e7172db1ae01 Sinthu Raja            2023-07-21   122  	};
99e7172db1ae01 Sinthu Raja            2023-07-21   123  
99e7172db1ae01 Sinthu Raja            2023-07-21   124  	main_ehrpwm4: pwm@3040000 {
99e7172db1ae01 Sinthu Raja            2023-07-21   125  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
99e7172db1ae01 Sinthu Raja            2023-07-21   126  		#pwm-cells = <3>;
99e7172db1ae01 Sinthu Raja            2023-07-21   127  		reg = <0x00 0x3040000 0x00 0x100>;
99e7172db1ae01 Sinthu Raja            2023-07-21   128  		power-domains = <&k3_pds 164 TI_SCI_PD_EXCLUSIVE>;
99e7172db1ae01 Sinthu Raja            2023-07-21   129  		clocks = <&ehrpwm_tbclk 4>, <&k3_clks 164 0>;
99e7172db1ae01 Sinthu Raja            2023-07-21   130  		clock-names = "tbclk", "fck";
99e7172db1ae01 Sinthu Raja            2023-07-21   131  		status = "disabled";
99e7172db1ae01 Sinthu Raja            2023-07-21   132  	};
99e7172db1ae01 Sinthu Raja            2023-07-21   133  
99e7172db1ae01 Sinthu Raja            2023-07-21   134  	main_ehrpwm5: pwm@3050000 {
99e7172db1ae01 Sinthu Raja            2023-07-21   135  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
99e7172db1ae01 Sinthu Raja            2023-07-21   136  		#pwm-cells = <3>;
99e7172db1ae01 Sinthu Raja            2023-07-21   137  		reg = <0x00 0x3050000 0x00 0x100>;
99e7172db1ae01 Sinthu Raja            2023-07-21   138  		power-domains = <&k3_pds 165 TI_SCI_PD_EXCLUSIVE>;
99e7172db1ae01 Sinthu Raja            2023-07-21   139  		clocks = <&ehrpwm_tbclk 5>, <&k3_clks 165 0>;
99e7172db1ae01 Sinthu Raja            2023-07-21   140  		clock-names = "tbclk", "fck";
99e7172db1ae01 Sinthu Raja            2023-07-21   141  		status = "disabled";
20fcf9d691ff6c Aswath Govindraju      2023-03-31   142  	};
20fcf9d691ff6c Aswath Govindraju      2023-03-31   143  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   144  	gic500: interrupt-controller@1800000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   145  		compatible = "arm,gic-v3";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   146  		#address-cells = <2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   147  		#size-cells = <2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   148  		ranges;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   149  		#interrupt-cells = <3>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   150  		interrupt-controller;
856216b70a41ff Matt Ranostay          2022-06-17   151  		reg = <0x00 0x01800000 0x00 0x100000>, /* GICD */
a966803781fc5e Nishanth Menon         2022-02-15   152  		      <0x00 0x01900000 0x00 0x100000>, /* GICR */
a966803781fc5e Nishanth Menon         2022-02-15   153  		      <0x00 0x6f000000 0x00 0x2000>,   /* GICC */
a966803781fc5e Nishanth Menon         2022-02-15   154  		      <0x00 0x6f010000 0x00 0x1000>,   /* GICH */
a966803781fc5e Nishanth Menon         2022-02-15   155  		      <0x00 0x6f020000 0x00 0x2000>;   /* GICV */
b8545f9d3a5426 Aswath Govindraju      2021-12-07   156  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   157  		/* vcpumntirq: virtual CPU interface maintenance interrupt */
b8545f9d3a5426 Aswath Govindraju      2021-12-07   158  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   159  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   160  		gic_its: msi-controller@1820000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   161  			compatible = "arm,gic-v3-its";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   162  			reg = <0x00 0x01820000 0x00 0x10000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   163  			socionext,synquacer-pre-its = <0x1000000 0x400000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   164  			msi-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   165  			#msi-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   166  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   167  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   168  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   169  	main_gpio_intr: interrupt-controller@a00000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   170  		compatible = "ti,sci-intr";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   171  		reg = <0x00 0x00a00000 0x00 0x800>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   172  		ti,intr-trigger-type = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   173  		interrupt-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   174  		interrupt-parent = <&gic500>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   175  		#interrupt-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   176  		ti,sci = <&sms>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   177  		ti,sci-dev-id = <148>;
b8aa36c22da7d6 Keerthy                2022-09-22   178  		ti,interrupt-ranges = <8 392 56>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   179  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   180  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   181  	main_pmx0: pinctrl@11c000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   182  		compatible = "pinctrl-single";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   183  		/* Proxy 0 addressing */
b8545f9d3a5426 Aswath Govindraju      2021-12-07   184  		reg = <0x0 0x11c000 0x0 0x120>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   185  		#pinctrl-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   186  		pinctrl-single,register-width = <32>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   187  		pinctrl-single,function-mask = <0xffffffff>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   188  	};
027b85ca972f32 Jayesh Choudhary       2022-11-01   189  
1ecc75be7bc522 Nishanth Menon         2023-05-31   190  	/* TIMERIO pad input CTRLMMR_TIMER*_CTRL registers */
1ecc75be7bc522 Nishanth Menon         2023-05-31   191  	main_timerio_input: pinctrl@104200 {
1ecc75be7bc522 Nishanth Menon         2023-05-31   192  		compatible = "pinctrl-single";
1ecc75be7bc522 Nishanth Menon         2023-05-31   193  		reg = <0x00 0x104200 0x00 0x50>;
1ecc75be7bc522 Nishanth Menon         2023-05-31   194  		#pinctrl-cells = <1>;
1ecc75be7bc522 Nishanth Menon         2023-05-31   195  		pinctrl-single,register-width = <32>;
1ecc75be7bc522 Nishanth Menon         2023-05-31   196  		pinctrl-single,function-mask = <0x00000007>;
1ecc75be7bc522 Nishanth Menon         2023-05-31   197  	};
1ecc75be7bc522 Nishanth Menon         2023-05-31   198  
1ecc75be7bc522 Nishanth Menon         2023-05-31   199  	/* TIMERIO pad output CTCTRLMMR_TIMERIO*_CTRL registers */
1ecc75be7bc522 Nishanth Menon         2023-05-31   200  	main_timerio_output: pinctrl@104280 {
1ecc75be7bc522 Nishanth Menon         2023-05-31   201  		compatible = "pinctrl-single";
1ecc75be7bc522 Nishanth Menon         2023-05-31   202  		reg = <0x00 0x104280 0x00 0x20>;
1ecc75be7bc522 Nishanth Menon         2023-05-31   203  		#pinctrl-cells = <1>;
1ecc75be7bc522 Nishanth Menon         2023-05-31   204  		pinctrl-single,register-width = <32>;
1ecc75be7bc522 Nishanth Menon         2023-05-31   205  		pinctrl-single,function-mask = <0x0000001f>;
1ecc75be7bc522 Nishanth Menon         2023-05-31   206  	};
1ecc75be7bc522 Nishanth Menon         2023-05-31   207  
027b85ca972f32 Jayesh Choudhary       2022-11-01   208  	main_crypto: crypto@4e00000 {
027b85ca972f32 Jayesh Choudhary       2022-11-01   209  		compatible = "ti,j721e-sa2ul";
027b85ca972f32 Jayesh Choudhary       2022-11-01   210  		reg = <0x00 0x04e00000 0x00 0x1200>;
027b85ca972f32 Jayesh Choudhary       2022-11-01   211  		power-domains = <&k3_pds 297 TI_SCI_PD_EXCLUSIVE>;
027b85ca972f32 Jayesh Choudhary       2022-11-01   212  		#address-cells = <2>;
027b85ca972f32 Jayesh Choudhary       2022-11-01   213  		#size-cells = <2>;
027b85ca972f32 Jayesh Choudhary       2022-11-01   214  		ranges = <0x00 0x04e00000 0x00 0x04e00000 0x00 0x30000>;
027b85ca972f32 Jayesh Choudhary       2022-11-01   215  
027b85ca972f32 Jayesh Choudhary       2022-11-01   216  		dmas = <&main_udmap 0xca40>, <&main_udmap 0x4a40>,
027b85ca972f32 Jayesh Choudhary       2022-11-01   217  		       <&main_udmap 0x4a41>;
027b85ca972f32 Jayesh Choudhary       2022-11-01   218  		dma-names = "tx", "rx1", "rx2";
027b85ca972f32 Jayesh Choudhary       2022-11-01   219  
027b85ca972f32 Jayesh Choudhary       2022-11-01   220  		rng: rng@4e10000 {
027b85ca972f32 Jayesh Choudhary       2022-11-01   221  			compatible = "inside-secure,safexcel-eip76";
027b85ca972f32 Jayesh Choudhary       2022-11-01   222  			reg = <0x00 0x04e10000 0x00 0x7d>;
027b85ca972f32 Jayesh Choudhary       2022-11-01   223  			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
027b85ca972f32 Jayesh Choudhary       2022-11-01   224  		};
027b85ca972f32 Jayesh Choudhary       2022-11-01   225  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   226  
835d04422f9d4c Nishanth Menon         2023-05-31   227  	main_timer0: timer@2400000 {
835d04422f9d4c Nishanth Menon         2023-05-31   228  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   229  		reg = <0x00 0x2400000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   230  		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   231  		clocks = <&k3_clks 63 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   232  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   233  		assigned-clocks = <&k3_clks 63 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   234  		assigned-clock-parents = <&k3_clks 63 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   235  		power-domains = <&k3_pds 63 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   236  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10   237  		status = "reserved";
835d04422f9d4c Nishanth Menon         2023-05-31   238  	};
835d04422f9d4c Nishanth Menon         2023-05-31   239  
835d04422f9d4c Nishanth Menon         2023-05-31   240  	main_timer1: timer@2410000 {
835d04422f9d4c Nishanth Menon         2023-05-31   241  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   242  		reg = <0x00 0x2410000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   243  		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   244  		clocks = <&k3_clks 64 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   245  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   246  		assigned-clocks = <&k3_clks 64 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   247  		assigned-clock-parents = <&k3_clks 64 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   248  		power-domains = <&k3_pds 64 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   249  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10   250  		status = "reserved";
835d04422f9d4c Nishanth Menon         2023-05-31   251  	};
835d04422f9d4c Nishanth Menon         2023-05-31   252  
835d04422f9d4c Nishanth Menon         2023-05-31   253  	main_timer2: timer@2420000 {
835d04422f9d4c Nishanth Menon         2023-05-31   254  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   255  		reg = <0x00 0x2420000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   256  		interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   257  		clocks = <&k3_clks 65 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   258  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   259  		assigned-clocks = <&k3_clks 65 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   260  		assigned-clock-parents = <&k3_clks 65 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   261  		power-domains = <&k3_pds 65 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   262  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10   263  		status = "reserved";
835d04422f9d4c Nishanth Menon         2023-05-31   264  	};
835d04422f9d4c Nishanth Menon         2023-05-31   265  
835d04422f9d4c Nishanth Menon         2023-05-31   266  	main_timer3: timer@2430000 {
835d04422f9d4c Nishanth Menon         2023-05-31   267  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   268  		reg = <0x00 0x2430000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   269  		interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   270  		clocks = <&k3_clks 66 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   271  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   272  		assigned-clocks = <&k3_clks 66 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   273  		assigned-clock-parents = <&k3_clks 66 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   274  		power-domains = <&k3_pds 66 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   275  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10   276  		status = "reserved";
835d04422f9d4c Nishanth Menon         2023-05-31   277  	};
835d04422f9d4c Nishanth Menon         2023-05-31   278  
835d04422f9d4c Nishanth Menon         2023-05-31   279  	main_timer4: timer@2440000 {
835d04422f9d4c Nishanth Menon         2023-05-31   280  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   281  		reg = <0x00 0x2440000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   282  		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   283  		clocks = <&k3_clks 67 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   284  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   285  		assigned-clocks = <&k3_clks 67 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   286  		assigned-clock-parents = <&k3_clks 67 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   287  		power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   288  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10   289  		status = "reserved";
835d04422f9d4c Nishanth Menon         2023-05-31   290  	};
835d04422f9d4c Nishanth Menon         2023-05-31   291  
835d04422f9d4c Nishanth Menon         2023-05-31   292  	main_timer5: timer@2450000 {
835d04422f9d4c Nishanth Menon         2023-05-31   293  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   294  		reg = <0x00 0x2450000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   295  		interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   296  		clocks = <&k3_clks 68 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   297  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   298  		assigned-clocks = <&k3_clks 68 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   299  		assigned-clock-parents = <&k3_clks 68 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   300  		power-domains = <&k3_pds 68 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   301  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10   302  		status = "reserved";
835d04422f9d4c Nishanth Menon         2023-05-31   303  	};
835d04422f9d4c Nishanth Menon         2023-05-31   304  
835d04422f9d4c Nishanth Menon         2023-05-31   305  	main_timer6: timer@2460000 {
835d04422f9d4c Nishanth Menon         2023-05-31   306  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   307  		reg = <0x00 0x2460000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   308  		interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   309  		clocks = <&k3_clks 69 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   310  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   311  		assigned-clocks = <&k3_clks 69 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   312  		assigned-clock-parents = <&k3_clks 69 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   313  		power-domains = <&k3_pds 69 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   314  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   315  	};
835d04422f9d4c Nishanth Menon         2023-05-31   316  
835d04422f9d4c Nishanth Menon         2023-05-31   317  	main_timer7: timer@2470000 {
835d04422f9d4c Nishanth Menon         2023-05-31   318  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   319  		reg = <0x00 0x2470000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   320  		interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   321  		clocks = <&k3_clks 70 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   322  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   323  		assigned-clocks = <&k3_clks 70 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   324  		assigned-clock-parents = <&k3_clks 70 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   325  		power-domains = <&k3_pds 70 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   326  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   327  	};
835d04422f9d4c Nishanth Menon         2023-05-31   328  
835d04422f9d4c Nishanth Menon         2023-05-31   329  	main_timer8: timer@2480000 {
835d04422f9d4c Nishanth Menon         2023-05-31   330  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   331  		reg = <0x00 0x2480000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   332  		interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   333  		clocks = <&k3_clks 71 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   334  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   335  		assigned-clocks = <&k3_clks 71 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   336  		assigned-clock-parents = <&k3_clks 71 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   337  		power-domains = <&k3_pds 71 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   338  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   339  	};
835d04422f9d4c Nishanth Menon         2023-05-31   340  
835d04422f9d4c Nishanth Menon         2023-05-31   341  	main_timer9: timer@2490000 {
835d04422f9d4c Nishanth Menon         2023-05-31   342  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   343  		reg = <0x00 0x2490000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   344  		interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   345  		clocks = <&k3_clks 72 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   346  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   347  		assigned-clocks = <&k3_clks 72 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   348  		assigned-clock-parents = <&k3_clks 72 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   349  		power-domains = <&k3_pds 72 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   350  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   351  	};
835d04422f9d4c Nishanth Menon         2023-05-31   352  
835d04422f9d4c Nishanth Menon         2023-05-31   353  	main_timer10: timer@24a0000 {
835d04422f9d4c Nishanth Menon         2023-05-31   354  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   355  		reg = <0x00 0x24a0000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   356  		interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   357  		clocks = <&k3_clks 73 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   358  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   359  		assigned-clocks = <&k3_clks 73 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   360  		assigned-clock-parents = <&k3_clks 73 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   361  		power-domains = <&k3_pds 73 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   362  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   363  	};
835d04422f9d4c Nishanth Menon         2023-05-31   364  
835d04422f9d4c Nishanth Menon         2023-05-31   365  	main_timer11: timer@24b0000 {
835d04422f9d4c Nishanth Menon         2023-05-31   366  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   367  		reg = <0x00 0x24b0000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   368  		interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   369  		clocks = <&k3_clks 74 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   370  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   371  		assigned-clocks = <&k3_clks 74 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   372  		assigned-clock-parents = <&k3_clks 74 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   373  		power-domains = <&k3_pds 74 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   374  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   375  	};
835d04422f9d4c Nishanth Menon         2023-05-31   376  
835d04422f9d4c Nishanth Menon         2023-05-31   377  	main_timer12: timer@24c0000 {
835d04422f9d4c Nishanth Menon         2023-05-31   378  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   379  		reg = <0x00 0x24c0000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   380  		interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   381  		clocks = <&k3_clks 75 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   382  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   383  		assigned-clocks = <&k3_clks 75 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   384  		assigned-clock-parents = <&k3_clks 75 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   385  		power-domains = <&k3_pds 75 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   386  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   387  	};
835d04422f9d4c Nishanth Menon         2023-05-31   388  
835d04422f9d4c Nishanth Menon         2023-05-31   389  	main_timer13: timer@24d0000 {
835d04422f9d4c Nishanth Menon         2023-05-31   390  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   391  		reg = <0x00 0x24d0000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   392  		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   393  		clocks = <&k3_clks 76 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   394  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   395  		assigned-clocks = <&k3_clks 76 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   396  		assigned-clock-parents = <&k3_clks 76 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   397  		power-domains = <&k3_pds 76 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   398  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   399  	};
835d04422f9d4c Nishanth Menon         2023-05-31   400  
835d04422f9d4c Nishanth Menon         2023-05-31   401  	main_timer14: timer@24e0000 {
835d04422f9d4c Nishanth Menon         2023-05-31   402  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   403  		reg = <0x00 0x24e0000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   404  		interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   405  		clocks = <&k3_clks 77 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   406  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   407  		assigned-clocks = <&k3_clks 77 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   408  		assigned-clock-parents = <&k3_clks 77 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   409  		power-domains = <&k3_pds 77 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   410  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   411  	};
835d04422f9d4c Nishanth Menon         2023-05-31   412  
835d04422f9d4c Nishanth Menon         2023-05-31   413  	main_timer15: timer@24f0000 {
835d04422f9d4c Nishanth Menon         2023-05-31   414  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   415  		reg = <0x00 0x24f0000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   416  		interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   417  		clocks = <&k3_clks 78 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   418  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   419  		assigned-clocks = <&k3_clks 78 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   420  		assigned-clock-parents = <&k3_clks 78 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   421  		power-domains = <&k3_pds 78 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   422  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   423  	};
835d04422f9d4c Nishanth Menon         2023-05-31   424  
835d04422f9d4c Nishanth Menon         2023-05-31   425  	main_timer16: timer@2500000 {
835d04422f9d4c Nishanth Menon         2023-05-31   426  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   427  		reg = <0x00 0x2500000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   428  		interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   429  		clocks = <&k3_clks 79 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   430  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   431  		assigned-clocks = <&k3_clks 79 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   432  		assigned-clock-parents = <&k3_clks 79 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   433  		power-domains = <&k3_pds 79 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   434  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   435  	};
835d04422f9d4c Nishanth Menon         2023-05-31   436  
835d04422f9d4c Nishanth Menon         2023-05-31   437  	main_timer17: timer@2510000 {
835d04422f9d4c Nishanth Menon         2023-05-31   438  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   439  		reg = <0x00 0x2510000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   440  		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   441  		clocks = <&k3_clks 80 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   442  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   443  		assigned-clocks = <&k3_clks 80 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   444  		assigned-clock-parents = <&k3_clks 80 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   445  		power-domains = <&k3_pds 80 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   446  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   447  	};
835d04422f9d4c Nishanth Menon         2023-05-31   448  
835d04422f9d4c Nishanth Menon         2023-05-31   449  	main_timer18: timer@2520000 {
835d04422f9d4c Nishanth Menon         2023-05-31   450  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   451  		reg = <0x00 0x2520000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   452  		interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   453  		clocks = <&k3_clks 81 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   454  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   455  		assigned-clocks = <&k3_clks 81 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   456  		assigned-clock-parents = <&k3_clks 81 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   457  		power-domains = <&k3_pds 81 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   458  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   459  	};
835d04422f9d4c Nishanth Menon         2023-05-31   460  
835d04422f9d4c Nishanth Menon         2023-05-31   461  	main_timer19: timer@2530000 {
835d04422f9d4c Nishanth Menon         2023-05-31   462  		compatible = "ti,am654-timer";
835d04422f9d4c Nishanth Menon         2023-05-31   463  		reg = <0x00 0x2530000 0x00 0x400>;
835d04422f9d4c Nishanth Menon         2023-05-31   464  		interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
835d04422f9d4c Nishanth Menon         2023-05-31   465  		clocks = <&k3_clks 82 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   466  		clock-names = "fck";
835d04422f9d4c Nishanth Menon         2023-05-31   467  		assigned-clocks = <&k3_clks 82 1>;
835d04422f9d4c Nishanth Menon         2023-05-31   468  		assigned-clock-parents = <&k3_clks 82 2>;
835d04422f9d4c Nishanth Menon         2023-05-31   469  		power-domains = <&k3_pds 82 TI_SCI_PD_EXCLUSIVE>;
835d04422f9d4c Nishanth Menon         2023-05-31   470  		ti,timer-pwm;
835d04422f9d4c Nishanth Menon         2023-05-31   471  	};
835d04422f9d4c Nishanth Menon         2023-05-31   472  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   473  	main_uart0: serial@2800000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   474  		compatible = "ti,j721e-uart", "ti,am654-uart";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   475  		reg = <0x00 0x02800000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   476  		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   477  		current-speed = <115200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   478  		clocks = <&k3_clks 146 3>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   479  		clock-names = "fclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   480  		power-domains = <&k3_pds 146 TI_SCI_PD_EXCLUSIVE>;
0e63f35a9c6acf Andrew Davis           2022-10-20   481  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   482  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   483  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   484  	main_uart1: serial@2810000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   485  		compatible = "ti,j721e-uart", "ti,am654-uart";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   486  		reg = <0x00 0x02810000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   487  		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   488  		current-speed = <115200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   489  		clocks = <&k3_clks 350 3>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   490  		clock-names = "fclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   491  		power-domains = <&k3_pds 350 TI_SCI_PD_EXCLUSIVE>;
0e63f35a9c6acf Andrew Davis           2022-10-20   492  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   493  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   494  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   495  	main_uart2: serial@2820000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   496  		compatible = "ti,j721e-uart", "ti,am654-uart";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   497  		reg = <0x00 0x02820000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   498  		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   499  		current-speed = <115200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   500  		clocks = <&k3_clks 351 3>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   501  		clock-names = "fclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   502  		power-domains = <&k3_pds 351 TI_SCI_PD_EXCLUSIVE>;
0e63f35a9c6acf Andrew Davis           2022-10-20   503  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   504  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   505  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   506  	main_uart3: serial@2830000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   507  		compatible = "ti,j721e-uart", "ti,am654-uart";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   508  		reg = <0x00 0x02830000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   509  		interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   510  		current-speed = <115200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   511  		clocks = <&k3_clks 352 3>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   512  		clock-names = "fclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   513  		power-domains = <&k3_pds 352 TI_SCI_PD_EXCLUSIVE>;
0e63f35a9c6acf Andrew Davis           2022-10-20   514  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   515  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   516  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   517  	main_uart4: serial@2840000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   518  		compatible = "ti,j721e-uart", "ti,am654-uart";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   519  		reg = <0x00 0x02840000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   520  		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   521  		current-speed = <115200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   522  		clocks = <&k3_clks 353 3>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   523  		clock-names = "fclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   524  		power-domains = <&k3_pds 353 TI_SCI_PD_EXCLUSIVE>;
0e63f35a9c6acf Andrew Davis           2022-10-20   525  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   526  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   527  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   528  	main_uart5: serial@2850000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   529  		compatible = "ti,j721e-uart", "ti,am654-uart";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   530  		reg = <0x00 0x02850000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   531  		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   532  		current-speed = <115200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   533  		clocks = <&k3_clks 354 3>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   534  		clock-names = "fclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   535  		power-domains = <&k3_pds 354 TI_SCI_PD_EXCLUSIVE>;
0e63f35a9c6acf Andrew Davis           2022-10-20   536  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   537  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   538  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   539  	main_uart6: serial@2860000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   540  		compatible = "ti,j721e-uart", "ti,am654-uart";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   541  		reg = <0x00 0x02860000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   542  		interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   543  		current-speed = <115200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   544  		clocks = <&k3_clks 355 3>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   545  		clock-names = "fclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   546  		power-domains = <&k3_pds 355 TI_SCI_PD_EXCLUSIVE>;
0e63f35a9c6acf Andrew Davis           2022-10-20   547  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   548  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   549  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   550  	main_uart7: serial@2870000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   551  		compatible = "ti,j721e-uart", "ti,am654-uart";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   552  		reg = <0x00 0x02870000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   553  		interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   554  		current-speed = <115200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   555  		clocks = <&k3_clks 356 3>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   556  		clock-names = "fclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   557  		power-domains = <&k3_pds 356 TI_SCI_PD_EXCLUSIVE>;
0e63f35a9c6acf Andrew Davis           2022-10-20   558  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   559  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   560  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   561  	main_uart8: serial@2880000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   562  		compatible = "ti,j721e-uart", "ti,am654-uart";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   563  		reg = <0x00 0x02880000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   564  		interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   565  		current-speed = <115200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   566  		clocks = <&k3_clks 357 3>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   567  		clock-names = "fclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   568  		power-domains = <&k3_pds 357 TI_SCI_PD_EXCLUSIVE>;
0e63f35a9c6acf Andrew Davis           2022-10-20   569  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   570  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   571  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   572  	main_uart9: serial@2890000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   573  		compatible = "ti,j721e-uart", "ti,am654-uart";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   574  		reg = <0x00 0x02890000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   575  		interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   576  		current-speed = <115200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   577  		clocks = <&k3_clks 358 3>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   578  		clock-names = "fclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   579  		power-domains = <&k3_pds 358 TI_SCI_PD_EXCLUSIVE>;
0e63f35a9c6acf Andrew Davis           2022-10-20   580  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   581  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   582  
54b0f2a00d927c Randolph Sapp          2024-04-23   583  	gpu: gpu@4e20000000 {
54b0f2a00d927c Randolph Sapp          2024-04-23   584  		compatible = "ti,j721s2-pvr", "img,pvr-bxs64";
54b0f2a00d927c Randolph Sapp          2024-04-23   585  		reg = <0x4e 0x20000000 0x00 0x80000>;
54b0f2a00d927c Randolph Sapp          2024-04-23   586  		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
ea8a869e24ac3a Randolph Sapp          2024-04-29   587  		power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
ea8a869e24ac3a Randolph Sapp          2024-04-29   588  				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
ea8a869e24ac3a Randolph Sapp          2024-04-29   589  		power-domain-names = "firmware", "dust";
54b0f2a00d927c Randolph Sapp          2024-04-23   590  		clocks = <&k3_clks 130 1>;
ea8a869e24ac3a Randolph Sapp          2024-04-29   591  		assigned-clocks = <&k3_clks 130 1>;
ea8a869e24ac3a Randolph Sapp          2024-04-29   592  		assigned-clock-rates = <800000000>;
ea8a869e24ac3a Randolph Sapp          2024-04-29   593  		clock-names = "core";
54b0f2a00d927c Randolph Sapp          2024-04-23   594  	};
54b0f2a00d927c Randolph Sapp          2024-04-23   595  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   596  	main_gpio0: gpio@600000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   597  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   598  		reg = <0x00 0x00600000 0x00 0x100>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   599  		gpio-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   600  		#gpio-cells = <2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   601  		interrupt-parent = <&main_gpio_intr>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   602  		interrupts = <145>, <146>, <147>, <148>, <149>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   603  		interrupt-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   604  		#interrupt-cells = <2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   605  		ti,ngpio = <66>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   606  		ti,davinci-gpio-unbanked = <0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   607  		power-domains = <&k3_pds 111 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   608  		clocks = <&k3_clks 111 0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   609  		clock-names = "gpio";
578bf4d09ef5d6 Andrew Davis           2023-08-09   610  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   611  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   612  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   613  	main_gpio2: gpio@610000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   614  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   615  		reg = <0x00 0x00610000 0x00 0x100>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   616  		gpio-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   617  		#gpio-cells = <2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   618  		interrupt-parent = <&main_gpio_intr>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   619  		interrupts = <154>, <155>, <156>, <157>, <158>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   620  		interrupt-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   621  		#interrupt-cells = <2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   622  		ti,ngpio = <66>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   623  		ti,davinci-gpio-unbanked = <0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   624  		power-domains = <&k3_pds 112 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   625  		clocks = <&k3_clks 112 0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   626  		clock-names = "gpio";
578bf4d09ef5d6 Andrew Davis           2023-08-09   627  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   628  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   629  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   630  	main_gpio4: gpio@620000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   631  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   632  		reg = <0x00 0x00620000 0x00 0x100>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   633  		gpio-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   634  		#gpio-cells = <2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   635  		interrupt-parent = <&main_gpio_intr>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   636  		interrupts = <163>, <164>, <165>, <166>, <167>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   637  		interrupt-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   638  		#interrupt-cells = <2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   639  		ti,ngpio = <66>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   640  		ti,davinci-gpio-unbanked = <0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   641  		power-domains = <&k3_pds 113 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   642  		clocks = <&k3_clks 113 0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   643  		clock-names = "gpio";
578bf4d09ef5d6 Andrew Davis           2023-08-09   644  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   645  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   646  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   647  	main_gpio6: gpio@630000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   648  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   649  		reg = <0x00 0x00630000 0x00 0x100>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   650  		gpio-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   651  		#gpio-cells = <2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   652  		interrupt-parent = <&main_gpio_intr>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   653  		interrupts = <172>, <173>, <174>, <175>, <176>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   654  		interrupt-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   655  		#interrupt-cells = <2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   656  		ti,ngpio = <66>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   657  		ti,davinci-gpio-unbanked = <0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   658  		power-domains = <&k3_pds 114 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   659  		clocks = <&k3_clks 114 0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   660  		clock-names = "gpio";
578bf4d09ef5d6 Andrew Davis           2023-08-09   661  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   662  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   663  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   664  	main_i2c0: i2c@2000000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   665  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   666  		reg = <0x00 0x02000000 0x00 0x100>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   667  		interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   668  		#address-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   669  		#size-cells = <0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   670  		clocks = <&k3_clks 214 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   671  		clock-names = "fck";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   672  		power-domains = <&k3_pds 214 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   673  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   674  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   675  	main_i2c1: i2c@2010000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   676  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   677  		reg = <0x00 0x02010000 0x00 0x100>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   678  		interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   679  		#address-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   680  		#size-cells = <0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   681  		clocks = <&k3_clks 215 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   682  		clock-names = "fck";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   683  		power-domains = <&k3_pds 215 TI_SCI_PD_EXCLUSIVE>;
0aef5131380628 Andrew Davis           2022-10-20   684  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   685  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   686  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   687  	main_i2c2: i2c@2020000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   688  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   689  		reg = <0x00 0x02020000 0x00 0x100>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   690  		interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   691  		#address-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   692  		#size-cells = <0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   693  		clocks = <&k3_clks 216 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   694  		clock-names = "fck";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   695  		power-domains = <&k3_pds 216 TI_SCI_PD_EXCLUSIVE>;
0aef5131380628 Andrew Davis           2022-10-20   696  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   697  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   698  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   699  	main_i2c3: i2c@2030000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   700  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   701  		reg = <0x00 0x02030000 0x00 0x100>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   702  		interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   703  		#address-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   704  		#size-cells = <0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   705  		clocks = <&k3_clks 217 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   706  		clock-names = "fck";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   707  		power-domains = <&k3_pds 217 TI_SCI_PD_EXCLUSIVE>;
0aef5131380628 Andrew Davis           2022-10-20   708  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   709  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   710  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   711  	main_i2c4: i2c@2040000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   712  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   713  		reg = <0x00 0x02040000 0x00 0x100>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   714  		interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   715  		#address-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   716  		#size-cells = <0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   717  		clocks = <&k3_clks 218 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   718  		clock-names = "fck";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   719  		power-domains = <&k3_pds 218 TI_SCI_PD_EXCLUSIVE>;
0aef5131380628 Andrew Davis           2022-10-20   720  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   721  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   722  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   723  	main_i2c5: i2c@2050000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   724  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   725  		reg = <0x00 0x02050000 0x00 0x100>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   726  		interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   727  		#address-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   728  		#size-cells = <0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   729  		clocks = <&k3_clks 219 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   730  		clock-names = "fck";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   731  		power-domains = <&k3_pds 219 TI_SCI_PD_EXCLUSIVE>;
0aef5131380628 Andrew Davis           2022-10-20   732  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   733  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   734  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   735  	main_i2c6: i2c@2060000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   736  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   737  		reg = <0x00 0x02060000 0x00 0x100>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   738  		interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   739  		#address-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   740  		#size-cells = <0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   741  		clocks = <&k3_clks 220 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   742  		clock-names = "fck";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   743  		power-domains = <&k3_pds 220 TI_SCI_PD_EXCLUSIVE>;
0aef5131380628 Andrew Davis           2022-10-20   744  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   745  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   746  
3bc8f90f5429fe Darren Etheridge       2024-03-08   747  	vpu: video-codec@4210000 {
3bc8f90f5429fe Darren Etheridge       2024-03-08   748  		compatible = "ti,j721s2-wave521c", "cnm,wave521c";
3bc8f90f5429fe Darren Etheridge       2024-03-08   749  		reg = <0x00 0x4210000 0x00 0x10000>;
3bc8f90f5429fe Darren Etheridge       2024-03-08   750  		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
3bc8f90f5429fe Darren Etheridge       2024-03-08   751  		clocks = <&k3_clks 179 2>;
3bc8f90f5429fe Darren Etheridge       2024-03-08   752  		power-domains = <&k3_pds 179 TI_SCI_PD_EXCLUSIVE>;
5b0a1aef35118e Brandon Brnich         2024-06-12   753  		sram = <&main_navss_sram>;
5b0a1aef35118e Brandon Brnich         2024-06-12   754  		sram-size = <0x10000>;
3bc8f90f5429fe Darren Etheridge       2024-03-08   755  	};
3bc8f90f5429fe Darren Etheridge       2024-03-08   756  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   757  	main_sdhci0: mmc@4f80000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   758  		compatible = "ti,j721e-sdhci-8bit";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   759  		reg = <0x00 0x04f80000 0x00 0x1000>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07   760  		      <0x00 0x04f88000 0x00 0x400>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   761  		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   762  		power-domains = <&k3_pds 98 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   763  		clocks = <&k3_clks 98 7>, <&k3_clks 98 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   764  		clock-names = "clk_ahb", "clk_xin";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   765  		assigned-clocks = <&k3_clks 98 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   766  		assigned-clock-parents = <&k3_clks 98 2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   767  		bus-width = <8>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   768  		ti,otap-del-sel-legacy = <0x0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   769  		ti,otap-del-sel-mmc-hs = <0x0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   770  		ti,otap-del-sel-ddr52 = <0x6>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   771  		ti,otap-del-sel-hs200 = <0x8>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   772  		ti,otap-del-sel-hs400 = <0x5>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   773  		ti,itap-del-sel-legacy = <0x10>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   774  		ti,itap-del-sel-mmc-hs = <0xa>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   775  		ti,strobe-sel = <0x77>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   776  		ti,clkbuf-sel = <0x7>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   777  		ti,trm-icp = <0x8>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   778  		mmc-ddr-1_8v;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   779  		mmc-hs200-1_8v;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   780  		mmc-hs400-1_8v;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   781  		dma-coherent;
5f715be31638b6 Andrew Davis           2023-08-09   782  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   783  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   784  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   785  	main_sdhci1: mmc@4fb0000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   786  		compatible = "ti,j721e-sdhci-4bit";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   787  		reg = <0x00 0x04fb0000 0x00 0x1000>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07   788  		      <0x00 0x04fb8000 0x00 0x400>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   789  		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   790  		power-domains = <&k3_pds 99 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   791  		clocks = <&k3_clks 99 8>, <&k3_clks 99 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   792  		clock-names = "clk_ahb", "clk_xin";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   793  		assigned-clocks = <&k3_clks 99 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   794  		assigned-clock-parents = <&k3_clks 99 2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   795  		bus-width = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   796  		ti,otap-del-sel-legacy = <0x0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   797  		ti,otap-del-sel-sd-hs = <0x0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   798  		ti,otap-del-sel-sdr12 = <0xf>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   799  		ti,otap-del-sel-sdr25 = <0xf>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   800  		ti,otap-del-sel-sdr50 = <0xc>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   801  		ti,otap-del-sel-sdr104 = <0x5>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   802  		ti,otap-del-sel-ddr50 = <0xc>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   803  		ti,itap-del-sel-legacy = <0x0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   804  		ti,itap-del-sel-sd-hs = <0x0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   805  		ti,itap-del-sel-sdr12 = <0x0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   806  		ti,itap-del-sel-sdr25 = <0x0>;
0a09fa97c37f4c Bhavya Kapoor          2023-12-01   807  		ti,itap-del-sel-ddr50 = <0x2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   808  		ti,clkbuf-sel = <0x7>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   809  		ti,trm-icp = <0x8>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   810  		dma-coherent;
5f715be31638b6 Andrew Davis           2023-08-09   811  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   812  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   813  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   814  	main_navss: bus@30000000 {
18965c655c8024 Vignesh Raghavendra    2023-10-05   815  		compatible = "simple-bus";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   816  		#address-cells = <2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   817  		#size-cells = <2>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   818  		ranges = <0x00 0x30000000 0x00 0x30000000 0x00 0x0c400000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   819  		ti,sci-dev-id = <224>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   820  		dma-coherent;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   821  		dma-ranges;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   822  
5b0a1aef35118e Brandon Brnich         2024-06-12   823  		main_navss_sram: navss-sram@30000000{
5b0a1aef35118e Brandon Brnich         2024-06-12   824  			compatible = "mmio-sram";
5b0a1aef35118e Brandon Brnich         2024-06-12   825  			reg = <0x00 0x30000000 0x00 0x10000>;
5b0a1aef35118e Brandon Brnich         2024-06-12   826  			#address-cells = <1>;
5b0a1aef35118e Brandon Brnich         2024-06-12   827  			#size-cells = <1>;
5b0a1aef35118e Brandon Brnich         2024-06-12   828  			ranges = <0x0 0x00 0x30000000 0x10000>;
5b0a1aef35118e Brandon Brnich         2024-06-12   829  		};
5b0a1aef35118e Brandon Brnich         2024-06-12   830  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   831  		main_navss_intr: interrupt-controller@310e0000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   832  			compatible = "ti,sci-intr";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   833  			reg = <0x00 0x310e0000 0x00 0x4000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   834  			ti,intr-trigger-type = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   835  			interrupt-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   836  			interrupt-parent = <&gic500>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   837  			#interrupt-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   838  			ti,sci = <&sms>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   839  			ti,sci-dev-id = <227>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   840  			ti,interrupt-ranges = <0 64 64>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07   841  					      <64 448 64>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07   842  					      <128 672 64>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   843  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   844  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   845  		main_udmass_inta: msi-controller@33d00000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   846  			compatible = "ti,sci-inta";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   847  			reg = <0x00 0x33d00000 0x00 0x100000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   848  			interrupt-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   849  			#interrupt-cells = <0>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   850  			interrupt-parent = <&main_navss_intr>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   851  			msi-controller;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   852  			ti,sci = <&sms>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   853  			ti,sci-dev-id = <265>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   854  			ti,interrupt-ranges = <0 0 256>;
8fd53804087485 Vaishnav Achath        2023-10-10   855  			ti,unmapped-event-sources = <&main_bcdma_csi>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   856  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   857  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   858  		secure_proxy_main: mailbox@32c00000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   859  			compatible = "ti,am654-secure-proxy";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   860  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   861  			reg-names = "target_data", "rt", "scfg";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   862  			reg = <0x00 0x32c00000 0x00 0x100000>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07   863  			      <0x00 0x32400000 0x00 0x100000>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07   864  			      <0x00 0x32800000 0x00 0x100000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   865  			interrupt-names = "rx_011";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   866  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   867  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   868  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   869  		hwspinlock: spinlock@30e00000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   870  			compatible = "ti,am654-hwspinlock";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   871  			reg = <0x00 0x30e00000 0x00 0x1000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   872  			#hwlock-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   873  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   874  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   875  		mailbox0_cluster0: mailbox@31f80000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   876  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   877  			reg = <0x00 0x31f80000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   878  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   879  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   880  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   881  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20   882  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   883  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   884  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   885  		mailbox0_cluster1: mailbox@31f81000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   886  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   887  			reg = <0x00 0x31f81000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   888  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   889  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   890  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   891  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20   892  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   893  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   894  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   895  		mailbox0_cluster2: mailbox@31f82000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   896  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   897  			reg = <0x00 0x31f82000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   898  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   899  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   900  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   901  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20   902  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   903  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   904  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   905  		mailbox0_cluster3: mailbox@31f83000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   906  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   907  			reg = <0x00 0x31f83000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   908  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   909  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   910  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   911  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20   912  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   913  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   914  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   915  		mailbox0_cluster4: mailbox@31f84000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   916  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   917  			reg = <0x00 0x31f84000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   918  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   919  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   920  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   921  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20   922  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   923  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   924  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   925  		mailbox0_cluster5: mailbox@31f85000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   926  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   927  			reg = <0x00 0x31f85000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   928  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   929  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   930  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   931  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20   932  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   933  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   934  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   935  		mailbox0_cluster6: mailbox@31f86000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   936  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   937  			reg = <0x00 0x31f86000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   938  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   939  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   940  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   941  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20   942  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   943  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   944  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   945  		mailbox0_cluster7: mailbox@31f87000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   946  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   947  			reg = <0x00 0x31f87000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   948  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   949  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   950  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   951  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20   952  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   953  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   954  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   955  		mailbox0_cluster8: mailbox@31f88000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   956  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   957  			reg = <0x00 0x31f88000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   958  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   959  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   960  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   961  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20   962  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   963  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   964  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   965  		mailbox0_cluster9: mailbox@31f89000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   966  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   967  			reg = <0x00 0x31f89000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   968  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   969  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   970  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   971  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20   972  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   973  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   974  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   975  		mailbox0_cluster10: mailbox@31f8a000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   976  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   977  			reg = <0x00 0x31f8a000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   978  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   979  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   980  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   981  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20   982  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   983  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   984  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   985  		mailbox0_cluster11: mailbox@31f8b000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   986  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   987  			reg = <0x00 0x31f8b000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   988  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   989  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   990  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   991  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20   992  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   993  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07   994  
b8545f9d3a5426 Aswath Govindraju      2021-12-07   995  		mailbox1_cluster0: mailbox@31f90000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07   996  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07   997  			reg = <0x00 0x31f90000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   998  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07   999  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1000  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1001  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20  1002  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1003  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1004  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1005  		mailbox1_cluster1: mailbox@31f91000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1006  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1007  			reg = <0x00 0x31f91000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1008  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1009  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1010  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1011  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20  1012  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1013  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1014  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1015  		mailbox1_cluster2: mailbox@31f92000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1016  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1017  			reg = <0x00 0x31f92000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1018  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1019  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1020  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1021  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20  1022  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1023  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1024  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1025  		mailbox1_cluster3: mailbox@31f93000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1026  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1027  			reg = <0x00 0x31f93000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1028  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1029  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1030  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1031  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20  1032  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1033  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1034  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1035  		mailbox1_cluster4: mailbox@31f94000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1036  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1037  			reg = <0x00 0x31f94000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1038  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1039  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1040  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1041  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20  1042  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1043  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1044  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1045  		mailbox1_cluster5: mailbox@31f95000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1046  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1047  			reg = <0x00 0x31f95000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1048  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1049  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1050  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1051  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20  1052  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1053  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1054  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1055  		mailbox1_cluster6: mailbox@31f96000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1056  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1057  			reg = <0x00 0x31f96000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1058  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1059  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1060  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1061  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20  1062  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1063  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1064  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1065  		mailbox1_cluster7: mailbox@31f97000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1066  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1067  			reg = <0x00 0x31f97000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1068  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1069  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1070  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1071  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20  1072  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1073  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1074  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1075  		mailbox1_cluster8: mailbox@31f98000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1076  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1077  			reg = <0x00 0x31f98000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1078  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1079  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1080  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1081  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20  1082  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1083  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1084  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1085  		mailbox1_cluster9: mailbox@31f99000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1086  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1087  			reg = <0x00 0x31f99000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1088  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1089  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1090  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1091  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20  1092  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1093  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1094  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1095  		mailbox1_cluster10: mailbox@31f9a000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1096  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1097  			reg = <0x00 0x31f9a000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1098  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1099  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1100  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1101  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20  1102  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1103  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1104  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1105  		mailbox1_cluster11: mailbox@31f9b000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1106  			compatible = "ti,am654-mailbox";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1107  			reg = <0x00 0x31f9b000 0x00 0x200>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1108  			#mbox-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1109  			ti,mbox-num-users = <4>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1110  			ti,mbox-num-fifos = <16>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1111  			interrupt-parent = <&main_navss_intr>;
3fb0402f65959e Andrew Davis           2022-10-20  1112  			status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1113  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1114  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1115  		main_ringacc: ringacc@3c000000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1116  			compatible = "ti,am654-navss-ringacc";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1117  			reg = <0x0 0x3c000000 0x0 0x400000>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1118  			      <0x0 0x38000000 0x0 0x400000>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1119  			      <0x0 0x31120000 0x0 0x100>,
702110c2be999c Vignesh Raghavendra    2023-08-09  1120  			      <0x0 0x33000000 0x0 0x40000>,
702110c2be999c Vignesh Raghavendra    2023-08-09  1121  			      <0x0 0x31080000 0x0 0x40000>;
702110c2be999c Vignesh Raghavendra    2023-08-09  1122  			reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target", "cfg";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1123  			ti,num-rings = <1024>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1124  			ti,sci-rm-range-gp-rings = <0x1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1125  			ti,sci = <&sms>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1126  			ti,sci-dev-id = <259>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1127  			msi-parent = <&main_udmass_inta>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1128  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1129  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1130  		main_udmap: dma-controller@31150000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1131  			compatible = "ti,j721e-navss-main-udmap";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1132  			reg = <0x0 0x31150000 0x0 0x100>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1133  			      <0x0 0x34000000 0x0 0x80000>,
22a8434daa92a0 Manorit Chawdhry       2023-12-13  1134  			      <0x0 0x35000000 0x0 0x200000>,
22a8434daa92a0 Manorit Chawdhry       2023-12-13  1135  			      <0x0 0x30b00000 0x0 0x20000>,
22a8434daa92a0 Manorit Chawdhry       2023-12-13  1136  			      <0x0 0x30c00000 0x0 0x8000>,
22a8434daa92a0 Manorit Chawdhry       2023-12-13  1137  			      <0x0 0x30d00000 0x0 0x4000>;
22a8434daa92a0 Manorit Chawdhry       2023-12-13  1138  			reg-names = "gcfg", "rchanrt", "tchanrt",
22a8434daa92a0 Manorit Chawdhry       2023-12-13  1139  				    "tchan", "rchan", "rflow";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1140  			msi-parent = <&main_udmass_inta>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1141  			#dma-cells = <1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1142  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1143  			ti,sci = <&sms>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1144  			ti,sci-dev-id = <263>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1145  			ti,ringacc = <&main_ringacc>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1146  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1147  			ti,sci-rm-range-tchan = <0x0d>, /* TX_CHAN */
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1148  						<0x0f>, /* TX_HCHAN */
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1149  						<0x10>; /* TX_UHCHAN */
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1150  			ti,sci-rm-range-rchan = <0x0a>, /* RX_CHAN */
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1151  						<0x0b>, /* RX_HCHAN */
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1152  						<0x0c>; /* RX_UHCHAN */
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1153  			ti,sci-rm-range-rflow = <0x00>; /* GP RFLOW */
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1154  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1155  
8fd53804087485 Vaishnav Achath        2023-10-10  1156  		main_bcdma_csi: dma-controller@311a0000 {
8fd53804087485 Vaishnav Achath        2023-10-10  1157  			compatible = "ti,j721s2-dmss-bcdma-csi";
8fd53804087485 Vaishnav Achath        2023-10-10  1158  			reg = <0x00 0x311a0000 0x00 0x100>,
8fd53804087485 Vaishnav Achath        2023-10-10  1159  			      <0x00 0x35d00000 0x00 0x20000>,
8fd53804087485 Vaishnav Achath        2023-10-10  1160  			      <0x00 0x35c00000 0x00 0x10000>,
8fd53804087485 Vaishnav Achath        2023-10-10  1161  			      <0x00 0x35e00000 0x00 0x80000>;
8fd53804087485 Vaishnav Achath        2023-10-10  1162  			reg-names = "gcfg", "rchanrt", "tchanrt", "ringrt";
8fd53804087485 Vaishnav Achath        2023-10-10  1163  			msi-parent = <&main_udmass_inta>;
8fd53804087485 Vaishnav Achath        2023-10-10  1164  			#dma-cells = <3>;
8fd53804087485 Vaishnav Achath        2023-10-10  1165  			ti,sci = <&sms>;
8fd53804087485 Vaishnav Achath        2023-10-10  1166  			ti,sci-dev-id = <225>;
8fd53804087485 Vaishnav Achath        2023-10-10  1167  			ti,sci-rm-range-rchan = <0x21>;
8fd53804087485 Vaishnav Achath        2023-10-10  1168  			ti,sci-rm-range-tchan = <0x22>;
8fd53804087485 Vaishnav Achath        2023-10-10  1169  		};
8fd53804087485 Vaishnav Achath        2023-10-10  1170  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1171  		cpts@310d0000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1172  			compatible = "ti,j721e-cpts";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1173  			reg = <0x0 0x310d0000 0x0 0x400>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1174  			reg-names = "cpts";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1175  			clocks = <&k3_clks 226 5>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1176  			clock-names = "cpts";
1f36d0e8be3ae7 Neha Malcom Francis    2023-06-05  1177  			assigned-clocks = <&k3_clks 226 5>; /* NAVSS0_CPTS_0_RCLK */
1f36d0e8be3ae7 Neha Malcom Francis    2023-06-05  1178  			assigned-clock-parents = <&k3_clks 226 7>; /* MAIN_0_HSDIVOUT6_CLK */
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1179  			interrupts-extended = <&main_navss_intr 391>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1180  			interrupt-names = "cpts";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1181  			ti,cpts-periodic-outputs = <6>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1182  			ti,cpts-ext-ts-inputs = <8>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1183  		};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1184  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1185  
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1186  	main_cpsw: ethernet@c200000 {
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1187  		compatible = "ti,j721e-cpsw-nuss";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1188  		reg = <0x00 0xc200000 0x00 0x200000>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1189  		reg-names = "cpsw_nuss";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1190  		ranges = <0x0 0x0 0x0 0xc200000 0x0 0x200000>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1191  		#address-cells = <2>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1192  		#size-cells = <2>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1193  		dma-coherent;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1194  		clocks = <&k3_clks 28 28>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1195  		clock-names = "fck";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1196  		power-domains = <&k3_pds 28 TI_SCI_PD_EXCLUSIVE>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1197  
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1198  		dmas = <&main_udmap 0xc640>,
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1199  		       <&main_udmap 0xc641>,
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1200  		       <&main_udmap 0xc642>,
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1201  		       <&main_udmap 0xc643>,
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1202  		       <&main_udmap 0xc644>,
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1203  		       <&main_udmap 0xc645>,
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1204  		       <&main_udmap 0xc646>,
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1205  		       <&main_udmap 0xc647>,
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1206  		       <&main_udmap 0x4640>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1207  		dma-names = "tx0", "tx1", "tx2", "tx3",
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1208  			    "tx4", "tx5", "tx6", "tx7",
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1209  			    "rx";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1210  
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1211  		status = "disabled";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1212  
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1213  		ethernet-ports {
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1214  			#address-cells = <1>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1215  			#size-cells = <0>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1216  
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1217  			main_cpsw_port1: port@1 {
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1218  				reg = <1>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1219  				ti,mac-only;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1220  				label = "port1";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1221  				phys = <&phy_gmii_sel_cpsw 1>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1222  				status = "disabled";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1223  			};
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1224  		};
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1225  
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1226  		main_cpsw_mdio: mdio@f00 {
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1227  			compatible = "ti,cpsw-mdio","ti,davinci_mdio";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1228  			reg = <0x00 0xf00 0x00 0x100>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1229  			#address-cells = <1>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1230  			#size-cells = <0>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1231  			clocks = <&k3_clks 28 28>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1232  			clock-names = "fck";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1233  			bus_freq = <1000000>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1234  			status = "disabled";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1235  		};
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1236  
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1237  		cpts@3d000 {
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1238  			compatible = "ti,am65-cpts";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1239  			reg = <0x00 0x3d000 0x00 0x400>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1240  			clocks = <&k3_clks 28 3>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1241  			clock-names = "cpts";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1242  			interrupts-extended = <&gic500 GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1243  			interrupt-names = "cpts";
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1244  			ti,cpts-ext-ts-inputs = <4>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1245  			ti,cpts-periodic-outputs = <2>;
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1246  		};
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1247  	};
d6ffe1b4b8c1cd Kishon Vijay Abraham I 2023-07-26  1248  
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1249  	usbss0: cdns-usb@4104000 {
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1250  		compatible = "ti,j721e-usb";
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1251  		reg = <0x00 0x04104000 0x00 0x100>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1252  		clocks = <&k3_clks 360 16>, <&k3_clks 360 15>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1253  		clock-names = "ref", "lpm";
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1254  		assigned-clocks = <&k3_clks 360 16>; /* USB2_REFCLK */
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1255  		assigned-clock-parents = <&k3_clks 360 17>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1256  		power-domains = <&k3_pds 360 TI_SCI_PD_EXCLUSIVE>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1257  		#address-cells = <2>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1258  		#size-cells = <2>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1259  		ranges;
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1260  		dma-coherent;
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1261  
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1262  		status = "disabled"; /* Needs pinmux */
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1263  
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1264  		usb0: usb@6000000 {
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1265  			compatible = "cdns,usb3";
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1266  			reg = <0x00 0x06000000 0x00 0x10000>,
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1267  			      <0x00 0x06010000 0x00 0x10000>,
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1268  			      <0x00 0x06020000 0x00 0x10000>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1269  			reg-names = "otg", "xhci", "dev";
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1270  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1271  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1272  				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1273  			interrupt-names = "host", "peripheral", "otg";
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1274  			maximum-speed = "super-speed";
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1275  			dr_mode = "otg";
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1276  		};
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1277  	};
20fcf9d691ff6c Aswath Govindraju      2023-03-31  1278  
59873df5be9493 Vaishnav Achath        2024-02-15  1279  	ti_csi2rx0: ticsi2rx@4500000 {
59873df5be9493 Vaishnav Achath        2024-02-15  1280  		compatible = "ti,j721e-csi2rx-shim";
59873df5be9493 Vaishnav Achath        2024-02-15  1281  		reg = <0x00 0x04500000 0x00 0x1000>;
59873df5be9493 Vaishnav Achath        2024-02-15  1282  		ranges;
59873df5be9493 Vaishnav Achath        2024-02-15  1283  		#address-cells = <2>;
59873df5be9493 Vaishnav Achath        2024-02-15  1284  		#size-cells = <2>;
59873df5be9493 Vaishnav Achath        2024-02-15  1285  		dmas = <&main_bcdma_csi 0 0x4940 0>;
59873df5be9493 Vaishnav Achath        2024-02-15  1286  		dma-names = "rx0";
59873df5be9493 Vaishnav Achath        2024-02-15  1287  		power-domains = <&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
59873df5be9493 Vaishnav Achath        2024-02-15  1288  		status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1289  
59873df5be9493 Vaishnav Achath        2024-02-15  1290  		cdns_csi2rx0: csi-bridge@4504000 {
59873df5be9493 Vaishnav Achath        2024-02-15  1291  			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
59873df5be9493 Vaishnav Achath        2024-02-15  1292  			reg = <0x00 0x04504000 0x00 0x1000>;
59873df5be9493 Vaishnav Achath        2024-02-15  1293  			clocks = <&k3_clks 38 3>, <&k3_clks 38 1>, <&k3_clks 38 3>,
59873df5be9493 Vaishnav Achath        2024-02-15  1294  				<&k3_clks 38 3>, <&k3_clks 38 4>, <&k3_clks 38 4>;
59873df5be9493 Vaishnav Achath        2024-02-15  1295  			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
59873df5be9493 Vaishnav Achath        2024-02-15  1296  				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
59873df5be9493 Vaishnav Achath        2024-02-15  1297  			phys = <&dphy0>;
59873df5be9493 Vaishnav Achath        2024-02-15  1298  			phy-names = "dphy";
59873df5be9493 Vaishnav Achath        2024-02-15  1299  
59873df5be9493 Vaishnav Achath        2024-02-15  1300  			ports {
59873df5be9493 Vaishnav Achath        2024-02-15  1301  				#address-cells = <1>;
59873df5be9493 Vaishnav Achath        2024-02-15  1302  				#size-cells = <0>;
59873df5be9493 Vaishnav Achath        2024-02-15  1303  
59873df5be9493 Vaishnav Achath        2024-02-15  1304  				csi0_port0: port@0 {
59873df5be9493 Vaishnav Achath        2024-02-15  1305  					reg = <0>;
59873df5be9493 Vaishnav Achath        2024-02-15  1306  					status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1307  				};
59873df5be9493 Vaishnav Achath        2024-02-15  1308  
59873df5be9493 Vaishnav Achath        2024-02-15  1309  				csi0_port1: port@1 {
59873df5be9493 Vaishnav Achath        2024-02-15  1310  					reg = <1>;
59873df5be9493 Vaishnav Achath        2024-02-15  1311  					status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1312  				};
59873df5be9493 Vaishnav Achath        2024-02-15  1313  
59873df5be9493 Vaishnav Achath        2024-02-15  1314  				csi0_port2: port@2 {
59873df5be9493 Vaishnav Achath        2024-02-15  1315  					reg = <2>;
59873df5be9493 Vaishnav Achath        2024-02-15  1316  					status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1317  				};
59873df5be9493 Vaishnav Achath        2024-02-15  1318  
59873df5be9493 Vaishnav Achath        2024-02-15  1319  				csi0_port3: port@3 {
59873df5be9493 Vaishnav Achath        2024-02-15  1320  					reg = <3>;
59873df5be9493 Vaishnav Achath        2024-02-15  1321  					status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1322  				};
59873df5be9493 Vaishnav Achath        2024-02-15  1323  
59873df5be9493 Vaishnav Achath        2024-02-15  1324  				csi0_port4: port@4 {
59873df5be9493 Vaishnav Achath        2024-02-15  1325  					reg = <4>;
59873df5be9493 Vaishnav Achath        2024-02-15  1326  					status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1327  				};
59873df5be9493 Vaishnav Achath        2024-02-15  1328  			};
59873df5be9493 Vaishnav Achath        2024-02-15  1329  		};
59873df5be9493 Vaishnav Achath        2024-02-15  1330  	};
59873df5be9493 Vaishnav Achath        2024-02-15  1331  
59873df5be9493 Vaishnav Achath        2024-02-15  1332  	ti_csi2rx1: ticsi2rx@4510000 {
59873df5be9493 Vaishnav Achath        2024-02-15  1333  		compatible = "ti,j721e-csi2rx-shim";
59873df5be9493 Vaishnav Achath        2024-02-15  1334  		reg = <0x00 0x04510000 0x00 0x1000>;
59873df5be9493 Vaishnav Achath        2024-02-15  1335  		ranges;
59873df5be9493 Vaishnav Achath        2024-02-15  1336  		#address-cells = <2>;
59873df5be9493 Vaishnav Achath        2024-02-15  1337  		#size-cells = <2>;
59873df5be9493 Vaishnav Achath        2024-02-15  1338  		dmas = <&main_bcdma_csi 0 0x4960 0>;
59873df5be9493 Vaishnav Achath        2024-02-15  1339  		dma-names = "rx0";
59873df5be9493 Vaishnav Achath        2024-02-15  1340  		power-domains = <&k3_pds 39 TI_SCI_PD_EXCLUSIVE>;
59873df5be9493 Vaishnav Achath        2024-02-15  1341  		status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1342  
59873df5be9493 Vaishnav Achath        2024-02-15  1343  		cdns_csi2rx1: csi-bridge@4514000 {
59873df5be9493 Vaishnav Achath        2024-02-15  1344  			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
59873df5be9493 Vaishnav Achath        2024-02-15  1345  			reg = <0x00 0x04514000 0x00 0x1000>;
59873df5be9493 Vaishnav Achath        2024-02-15  1346  			clocks = <&k3_clks 39 3>, <&k3_clks 39 1>, <&k3_clks 39 3>,
59873df5be9493 Vaishnav Achath        2024-02-15  1347  				<&k3_clks 39 3>, <&k3_clks 39 4>, <&k3_clks 39 4>;
59873df5be9493 Vaishnav Achath        2024-02-15  1348  			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
59873df5be9493 Vaishnav Achath        2024-02-15  1349  				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
59873df5be9493 Vaishnav Achath        2024-02-15  1350  			phys = <&dphy1>;
59873df5be9493 Vaishnav Achath        2024-02-15  1351  			phy-names = "dphy";
59873df5be9493 Vaishnav Achath        2024-02-15  1352  
59873df5be9493 Vaishnav Achath        2024-02-15  1353  			ports {
59873df5be9493 Vaishnav Achath        2024-02-15  1354  				#address-cells = <1>;
59873df5be9493 Vaishnav Achath        2024-02-15  1355  				#size-cells = <0>;
59873df5be9493 Vaishnav Achath        2024-02-15  1356  
59873df5be9493 Vaishnav Achath        2024-02-15  1357  				csi1_port0: port@0 {
59873df5be9493 Vaishnav Achath        2024-02-15  1358  					reg = <0>;
59873df5be9493 Vaishnav Achath        2024-02-15  1359  					status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1360  				};
59873df5be9493 Vaishnav Achath        2024-02-15  1361  
59873df5be9493 Vaishnav Achath        2024-02-15  1362  				csi1_port1: port@1 {
59873df5be9493 Vaishnav Achath        2024-02-15  1363  					reg = <1>;
59873df5be9493 Vaishnav Achath        2024-02-15  1364  					status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1365  				};
59873df5be9493 Vaishnav Achath        2024-02-15  1366  
59873df5be9493 Vaishnav Achath        2024-02-15  1367  				csi1_port2: port@2 {
59873df5be9493 Vaishnav Achath        2024-02-15  1368  					reg = <2>;
59873df5be9493 Vaishnav Achath        2024-02-15  1369  					status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1370  				};
59873df5be9493 Vaishnav Achath        2024-02-15  1371  
59873df5be9493 Vaishnav Achath        2024-02-15  1372  				csi1_port3: port@3 {
59873df5be9493 Vaishnav Achath        2024-02-15  1373  					reg = <3>;
59873df5be9493 Vaishnav Achath        2024-02-15  1374  					status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1375  				};
59873df5be9493 Vaishnav Achath        2024-02-15  1376  
59873df5be9493 Vaishnav Achath        2024-02-15  1377  				csi1_port4: port@4 {
59873df5be9493 Vaishnav Achath        2024-02-15  1378  					reg = <4>;
59873df5be9493 Vaishnav Achath        2024-02-15  1379  					status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1380  				};
59873df5be9493 Vaishnav Achath        2024-02-15  1381  			};
59873df5be9493 Vaishnav Achath        2024-02-15  1382  		};
59873df5be9493 Vaishnav Achath        2024-02-15  1383  	};
59873df5be9493 Vaishnav Achath        2024-02-15  1384  
59873df5be9493 Vaishnav Achath        2024-02-15  1385  	dphy0: phy@4580000 {
59873df5be9493 Vaishnav Achath        2024-02-15  1386  		compatible = "cdns,dphy-rx";
59873df5be9493 Vaishnav Achath        2024-02-15  1387  		reg = <0x00 0x04580000 0x00 0x1100>;
59873df5be9493 Vaishnav Achath        2024-02-15  1388  		#phy-cells = <0>;
59873df5be9493 Vaishnav Achath        2024-02-15  1389  		power-domains = <&k3_pds 152 TI_SCI_PD_EXCLUSIVE>;
59873df5be9493 Vaishnav Achath        2024-02-15  1390  		status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1391  	};
59873df5be9493 Vaishnav Achath        2024-02-15  1392  
59873df5be9493 Vaishnav Achath        2024-02-15  1393  	dphy1: phy@4590000 {
59873df5be9493 Vaishnav Achath        2024-02-15  1394  		compatible = "cdns,dphy-rx";
59873df5be9493 Vaishnav Achath        2024-02-15  1395  		reg = <0x00 0x04590000 0x00 0x1100>;
59873df5be9493 Vaishnav Achath        2024-02-15  1396  		#phy-cells = <0>;
59873df5be9493 Vaishnav Achath        2024-02-15  1397  		power-domains = <&k3_pds 153 TI_SCI_PD_EXCLUSIVE>;
59873df5be9493 Vaishnav Achath        2024-02-15  1398  		status = "disabled";
59873df5be9493 Vaishnav Achath        2024-02-15  1399  	};
59873df5be9493 Vaishnav Achath        2024-02-15  1400  
393eee04065d26 Matt Ranostay          2023-03-31  1401  	serdes_wiz0: wiz@5060000 {
393eee04065d26 Matt Ranostay          2023-03-31  1402  		compatible = "ti,j721s2-wiz-10g";
393eee04065d26 Matt Ranostay          2023-03-31  1403  		#address-cells = <1>;
393eee04065d26 Matt Ranostay          2023-03-31  1404  		#size-cells = <1>;
393eee04065d26 Matt Ranostay          2023-03-31  1405  		power-domains = <&k3_pds 365 TI_SCI_PD_EXCLUSIVE>;
393eee04065d26 Matt Ranostay          2023-03-31  1406  		clocks = <&k3_clks 365 0>, <&k3_clks 365 3>, <&serdes_refclk>;
393eee04065d26 Matt Ranostay          2023-03-31  1407  		clock-names = "fck", "core_ref_clk", "ext_ref_clk";
393eee04065d26 Matt Ranostay          2023-03-31  1408  		num-lanes = <4>;
393eee04065d26 Matt Ranostay          2023-03-31  1409  		#reset-cells = <1>;
393eee04065d26 Matt Ranostay          2023-03-31  1410  		#clock-cells = <1>;
e776ac0ef32af5 Rahul T R              2024-05-28  1411  		ranges = <0x5060000 0x0 0x5060000 0x10000>,
e776ac0ef32af5 Rahul T R              2024-05-28  1412  			 <0xa030a00 0x0 0xa030a00 0x40>; /* DPTX PHY */
393eee04065d26 Matt Ranostay          2023-03-31  1413  
393eee04065d26 Matt Ranostay          2023-03-31  1414  		assigned-clocks = <&k3_clks 365 3>;
393eee04065d26 Matt Ranostay          2023-03-31  1415  		assigned-clock-parents = <&k3_clks 365 7>;
393eee04065d26 Matt Ranostay          2023-03-31  1416  
393eee04065d26 Matt Ranostay          2023-03-31  1417  		serdes0: serdes@5060000 {
e776ac0ef32af5 Rahul T R              2024-05-28  1418  			/*
e776ac0ef32af5 Rahul T R              2024-05-28  1419  			 * Note: we also map DPTX PHY registers as the Torrent
e776ac0ef32af5 Rahul T R              2024-05-28  1420  			 * needs to manage those.
e776ac0ef32af5 Rahul T R              2024-05-28  1421  			 */
393eee04065d26 Matt Ranostay          2023-03-31  1422  			compatible = "ti,j721e-serdes-10g";
e776ac0ef32af5 Rahul T R              2024-05-28  1423  			reg = <0x05060000 0x00010000>,
e776ac0ef32af5 Rahul T R              2024-05-28  1424  			      <0xa030a00 0x40>; /* DPTX PHY */
e776ac0ef32af5 Rahul T R              2024-05-28  1425  			reg-names = "torrent_phy", "dptx_phy";
393eee04065d26 Matt Ranostay          2023-03-31  1426  			resets = <&serdes_wiz0 0>;
393eee04065d26 Matt Ranostay          2023-03-31  1427  			reset-names = "torrent_reset";
393eee04065d26 Matt Ranostay          2023-03-31  1428  			clocks = <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
393eee04065d26 Matt Ranostay          2023-03-31  1429  				 <&serdes_wiz0 TI_WIZ_PHY_EN_REFCLK>;
393eee04065d26 Matt Ranostay          2023-03-31  1430  			clock-names = "refclk", "phy_en_refclk";
393eee04065d26 Matt Ranostay          2023-03-31  1431  			assigned-clocks = <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
393eee04065d26 Matt Ranostay          2023-03-31  1432  					  <&serdes_wiz0 TI_WIZ_PLL1_REFCLK>,
393eee04065d26 Matt Ranostay          2023-03-31  1433  					  <&serdes_wiz0 TI_WIZ_REFCLK_DIG>;
393eee04065d26 Matt Ranostay          2023-03-31  1434  			assigned-clock-parents = <&k3_clks 365 3>,
393eee04065d26 Matt Ranostay          2023-03-31  1435  						 <&k3_clks 365 3>,
393eee04065d26 Matt Ranostay          2023-03-31  1436  						 <&k3_clks 365 3>;
393eee04065d26 Matt Ranostay          2023-03-31  1437  			#address-cells = <1>;
393eee04065d26 Matt Ranostay          2023-03-31  1438  			#size-cells = <0>;
393eee04065d26 Matt Ranostay          2023-03-31  1439  			#clock-cells = <1>;
393eee04065d26 Matt Ranostay          2023-03-31  1440  
393eee04065d26 Matt Ranostay          2023-03-31  1441  			status = "disabled"; /* Needs lane config */
e776ac0ef32af5 Rahul T R              2024-05-28  1442  
e776ac0ef32af5 Rahul T R              2024-05-28  1443  			torrent_phy_dp: phy@2 {
e776ac0ef32af5 Rahul T R              2024-05-28  1444  				reg = <2>;
e776ac0ef32af5 Rahul T R              2024-05-28  1445  				resets = <&serdes_wiz0 3>;
e776ac0ef32af5 Rahul T R              2024-05-28  1446  				cdns,phy-type = <PHY_TYPE_DP>;
e776ac0ef32af5 Rahul T R              2024-05-28  1447  				cdns,num-lanes = <2>;
e776ac0ef32af5 Rahul T R              2024-05-28  1448  				cdns,max-bit-rate = <5400>;
e776ac0ef32af5 Rahul T R              2024-05-28  1449  				#phy-cells = <0>;
e776ac0ef32af5 Rahul T R              2024-05-28  1450  			};
393eee04065d26 Matt Ranostay          2023-03-31  1451  		};
393eee04065d26 Matt Ranostay          2023-03-31  1452  	};
393eee04065d26 Matt Ranostay          2023-03-31  1453  
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1454  	pcie1_rc: pcie@2910000 {
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1455  		compatible = "ti,j7200-pcie-host", "ti,j721e-pcie-host";
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1456  		reg = <0x00 0x02910000 0x00 0x1000>,
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1457  		      <0x00 0x02917000 0x00 0x400>,
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1458  		      <0x00 0x0d800000 0x00 0x800000>,
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1459  		      <0x00 0x18000000 0x00 0x1000>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1460  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1461  		interrupt-names = "link_state";
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1462  		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1463  		device_type = "pci";
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1464  		ti,syscon-pcie-ctrl = <&scm_conf 0x074>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1465  		max-link-speed = <3>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1466  		num-lanes = <4>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1467  		power-domains = <&k3_pds 276 TI_SCI_PD_EXCLUSIVE>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1468  		clocks = <&k3_clks 276 41>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1469  		clock-names = "fck";
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1470  		#address-cells = <3>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1471  		#size-cells = <2>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1472  		bus-range = <0x0 0xff>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1473  		vendor-id = <0x104c>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1474  		device-id = <0xb013>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1475  		msi-map = <0x0 &gic_its 0x0 0x10000>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1476  		dma-coherent;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1477  		ranges = <0x01000000 0x0 0x18001000  0x00 0x18001000  0x0 0x0010000>,
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1478  			 <0x02000000 0x0 0x18011000  0x00 0x18011000  0x0 0x7fef000>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1479  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1480  		#interrupt-cells = <1>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1481  		interrupt-map-mask = <0 0 0 7>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1482  		interrupt-map = <0 0 0 1 &pcie1_intc 0>, /* INT A */
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1483  				<0 0 0 2 &pcie1_intc 0>, /* INT B */
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1484  				<0 0 0 3 &pcie1_intc 0>, /* INT C */
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1485  				<0 0 0 4 &pcie1_intc 0>; /* INT D */
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1486  
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1487  		status = "disabled"; /* Needs gpio and serdes info */
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1488  
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1489  		pcie1_intc: interrupt-controller {
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1490  			interrupt-controller;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1491  			#interrupt-cells = <1>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1492  			interrupt-parent = <&gic500>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1493  			interrupts = <GIC_SPI 324 IRQ_TYPE_EDGE_RISING>;
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1494  		};
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1495  	};
b6f18aa80f4eee Aswath Govindraju      2023-03-31  1496  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1497  	main_mcan0: can@2701000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1498  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1499  		reg = <0x00 0x02701000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1500  		      <0x00 0x02708000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1501  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1502  		power-domains = <&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1503  		clocks = <&k3_clks 182 0>, <&k3_clks 182 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1504  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1505  		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1506  			     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1507  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1508  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1509  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1510  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1511  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1512  	main_mcan1: can@2711000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1513  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1514  		reg = <0x00 0x02711000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1515  		      <0x00 0x02718000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1516  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1517  		power-domains = <&k3_pds 183 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1518  		clocks = <&k3_clks 183 0>, <&k3_clks 183 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1519  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1520  		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1521  			     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1522  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1523  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1524  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1525  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1526  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1527  	main_mcan2: can@2721000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1528  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1529  		reg = <0x00 0x02721000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1530  		      <0x00 0x02728000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1531  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1532  		power-domains = <&k3_pds 184 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1533  		clocks = <&k3_clks 184 0>, <&k3_clks 184 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1534  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1535  		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1536  			     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1537  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1538  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1539  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1540  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1541  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1542  	main_mcan3: can@2731000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1543  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1544  		reg = <0x00 0x02731000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1545  		      <0x00 0x02738000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1546  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1547  		power-domains = <&k3_pds 185 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1548  		clocks = <&k3_clks 185 0>, <&k3_clks 185 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1549  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1550  		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1551  			     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1552  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1553  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1554  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1555  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1556  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1557  	main_mcan4: can@2741000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1558  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1559  		reg = <0x00 0x02741000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1560  		      <0x00 0x02748000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1561  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1562  		power-domains = <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1563  		clocks = <&k3_clks 186 0>, <&k3_clks 186 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1564  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1565  		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1566  			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1567  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1568  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1569  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1570  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1571  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1572  	main_mcan5: can@2751000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1573  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1574  		reg = <0x00 0x02751000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1575  		      <0x00 0x02758000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1576  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1577  		power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1578  		clocks = <&k3_clks 187 0>, <&k3_clks 187 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1579  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1580  		interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1581  			     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1582  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1583  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1584  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1585  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1586  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1587  	main_mcan6: can@2761000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1588  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1589  		reg = <0x00 0x02761000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1590  		      <0x00 0x02768000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1591  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1592  		power-domains = <&k3_pds 188 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1593  		clocks = <&k3_clks 188 0>, <&k3_clks 188 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1594  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1595  		interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1596  			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1597  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1598  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1599  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1600  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1601  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1602  	main_mcan7: can@2771000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1603  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1604  		reg = <0x00 0x02771000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1605  		      <0x00 0x02778000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1606  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1607  		power-domains = <&k3_pds 189 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1608  		clocks = <&k3_clks 189 0>, <&k3_clks 189 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1609  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1610  		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1611  			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1612  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1613  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1614  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1615  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1616  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1617  	main_mcan8: can@2781000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1618  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1619  		reg = <0x00 0x02781000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1620  		      <0x00 0x02788000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1621  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1622  		power-domains = <&k3_pds 190 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1623  		clocks = <&k3_clks 190 0>, <&k3_clks 190 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1624  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1625  		interrupts = <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1626  			     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1627  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1628  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1629  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1630  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1631  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1632  	main_mcan9: can@2791000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1633  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1634  		reg = <0x00 0x02791000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1635  		      <0x00 0x02798000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1636  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1637  		power-domains = <&k3_pds 191 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1638  		clocks = <&k3_clks 191 0>, <&k3_clks 191 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1639  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1640  		interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1641  			     <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1642  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1643  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1644  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1645  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1646  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1647  	main_mcan10: can@27a1000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1648  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1649  		reg = <0x00 0x027a1000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1650  		      <0x00 0x027a8000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1651  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1652  		power-domains = <&k3_pds 192 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1653  		clocks = <&k3_clks 192 0>, <&k3_clks 192 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1654  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1655  		interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1656  			     <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1657  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1658  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1659  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1660  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1661  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1662  	main_mcan11: can@27b1000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1663  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1664  		reg = <0x00 0x027b1000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1665  		      <0x00 0x027b8000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1666  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1667  		power-domains = <&k3_pds 193 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1668  		clocks = <&k3_clks 193 0>, <&k3_clks 193 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1669  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1670  		interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1671  			     <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1672  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1673  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1674  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1675  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1676  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1677  	main_mcan12: can@27c1000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1678  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1679  		reg = <0x00 0x027c1000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1680  		      <0x00 0x027c8000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1681  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1682  		power-domains = <&k3_pds 194 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1683  		clocks = <&k3_clks 194 0>, <&k3_clks 194 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1684  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1685  		interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1686  			     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1687  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1688  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1689  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1690  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1691  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1692  	main_mcan13: can@27d1000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1693  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1694  		reg = <0x00 0x027d1000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1695  		      <0x00 0x027d8000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1696  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1697  		power-domains = <&k3_pds 195 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1698  		clocks = <&k3_clks 195 0>, <&k3_clks 195 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1699  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1700  		interrupts = <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1701  			     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1702  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1703  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1704  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1705  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1706  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1707  	main_mcan14: can@2681000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1708  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1709  		reg = <0x00 0x02681000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1710  		      <0x00 0x02688000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1711  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1712  		power-domains = <&k3_pds 197 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1713  		clocks = <&k3_clks 197 0>, <&k3_clks 197 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1714  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1715  		interrupts = <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1716  			     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1717  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1718  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1719  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1720  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1721  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1722  	main_mcan15: can@2691000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1723  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1724  		reg = <0x00 0x02691000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1725  		      <0x00 0x02698000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1726  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1727  		power-domains = <&k3_pds 199 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1728  		clocks = <&k3_clks 199 0>, <&k3_clks 199 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1729  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1730  		interrupts = <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1731  			     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1732  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1733  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1734  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1735  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1736  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1737  	main_mcan16: can@26a1000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1738  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1739  		reg = <0x00 0x026a1000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1740  		      <0x00 0x026a8000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1741  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1742  		power-domains = <&k3_pds 201 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1743  		clocks = <&k3_clks 201 0>, <&k3_clks 201 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1744  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1745  		interrupts = <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1746  			     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1747  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1748  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1749  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1750  	};
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1751  
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1752  	main_mcan17: can@26b1000 {
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1753  		compatible = "bosch,m_can";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1754  		reg = <0x00 0x026b1000 0x00 0x200>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1755  		      <0x00 0x026b8000 0x00 0x8000>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1756  		reg-names = "m_can", "message_ram";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1757  		power-domains = <&k3_pds 206 TI_SCI_PD_EXCLUSIVE>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1758  		clocks = <&k3_clks 206 0>, <&k3_clks 206 1>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1759  		clock-names = "hclk", "cclk";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1760  		interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>,
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1761  			     <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>;
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1762  		interrupt-names = "int0", "int1";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1763  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
06639b8ae0e9be Andrew Davis           2022-10-20  1764  		status = "disabled";
b8545f9d3a5426 Aswath Govindraju      2021-12-07  1765  	};
04d7cb647b8527 Vaishnav Achath        2023-03-21  1766  
04d7cb647b8527 Vaishnav Achath        2023-03-21  1767  	main_spi0: spi@2100000 {
04d7cb647b8527 Vaishnav Achath        2023-03-21  1768  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1769  		reg = <0x00 0x02100000 0x00 0x400>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1770  		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1771  		#address-cells = <1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1772  		#size-cells = <0>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1773  		power-domains = <&k3_pds 339 TI_SCI_PD_EXCLUSIVE>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1774  		clocks = <&k3_clks 339 1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1775  		status = "disabled";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1776  	};
04d7cb647b8527 Vaishnav Achath        2023-03-21  1777  
04d7cb647b8527 Vaishnav Achath        2023-03-21  1778  	main_spi1: spi@2110000 {
04d7cb647b8527 Vaishnav Achath        2023-03-21  1779  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1780  		reg = <0x00 0x02110000 0x00 0x400>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1781  		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1782  		#address-cells = <1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1783  		#size-cells = <0>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1784  		power-domains = <&k3_pds 340 TI_SCI_PD_EXCLUSIVE>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1785  		clocks = <&k3_clks 340 1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1786  		status = "disabled";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1787  	};
04d7cb647b8527 Vaishnav Achath        2023-03-21  1788  
04d7cb647b8527 Vaishnav Achath        2023-03-21  1789  	main_spi2: spi@2120000 {
04d7cb647b8527 Vaishnav Achath        2023-03-21  1790  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1791  		reg = <0x00 0x02120000 0x00 0x400>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1792  		interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1793  		#address-cells = <1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1794  		#size-cells = <0>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1795  		power-domains = <&k3_pds 341 TI_SCI_PD_EXCLUSIVE>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1796  		clocks = <&k3_clks 341 1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1797  		status = "disabled";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1798  	};
04d7cb647b8527 Vaishnav Achath        2023-03-21  1799  
04d7cb647b8527 Vaishnav Achath        2023-03-21  1800  	main_spi3: spi@2130000 {
04d7cb647b8527 Vaishnav Achath        2023-03-21  1801  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1802  		reg = <0x00 0x02130000 0x00 0x400>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1803  		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1804  		#address-cells = <1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1805  		#size-cells = <0>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1806  		power-domains = <&k3_pds 342 TI_SCI_PD_EXCLUSIVE>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1807  		clocks = <&k3_clks 342 1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1808  		status = "disabled";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1809  	};
04d7cb647b8527 Vaishnav Achath        2023-03-21  1810  
04d7cb647b8527 Vaishnav Achath        2023-03-21  1811  	main_spi4: spi@2140000 {
04d7cb647b8527 Vaishnav Achath        2023-03-21  1812  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1813  		reg = <0x00 0x02140000 0x00 0x400>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1814  		interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1815  		#address-cells = <1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1816  		#size-cells = <0>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1817  		power-domains = <&k3_pds 343 TI_SCI_PD_EXCLUSIVE>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1818  		clocks = <&k3_clks 343 1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1819  		status = "disabled";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1820  	};
04d7cb647b8527 Vaishnav Achath        2023-03-21  1821  
04d7cb647b8527 Vaishnav Achath        2023-03-21  1822  	main_spi5: spi@2150000 {
04d7cb647b8527 Vaishnav Achath        2023-03-21  1823  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1824  		reg = <0x00 0x02150000 0x00 0x400>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1825  		interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1826  		#address-cells = <1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1827  		#size-cells = <0>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1828  		power-domains = <&k3_pds 344 TI_SCI_PD_EXCLUSIVE>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1829  		clocks = <&k3_clks 344 1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1830  		status = "disabled";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1831  	};
04d7cb647b8527 Vaishnav Achath        2023-03-21  1832  
04d7cb647b8527 Vaishnav Achath        2023-03-21  1833  	main_spi6: spi@2160000 {
04d7cb647b8527 Vaishnav Achath        2023-03-21  1834  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1835  		reg = <0x00 0x02160000 0x00 0x400>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1836  		interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1837  		#address-cells = <1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1838  		#size-cells = <0>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1839  		power-domains = <&k3_pds 345 TI_SCI_PD_EXCLUSIVE>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1840  		clocks = <&k3_clks 345 1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1841  		status = "disabled";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1842  	};
04d7cb647b8527 Vaishnav Achath        2023-03-21  1843  
04d7cb647b8527 Vaishnav Achath        2023-03-21  1844  	main_spi7: spi@2170000 {
04d7cb647b8527 Vaishnav Achath        2023-03-21  1845  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1846  		reg = <0x00 0x02170000 0x00 0x400>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1847  		interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1848  		#address-cells = <1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1849  		#size-cells = <0>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1850  		power-domains = <&k3_pds 346 TI_SCI_PD_EXCLUSIVE>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1851  		clocks = <&k3_clks 346 1>;
04d7cb647b8527 Vaishnav Achath        2023-03-21  1852  		status = "disabled";
04d7cb647b8527 Vaishnav Achath        2023-03-21  1853  	};
a1f62d114c8ce6 Jayesh Choudhary       2023-08-03  1854  
e776ac0ef32af5 Rahul T R              2024-05-28  1855  	mhdp: dp-bridge@a000000 {
e776ac0ef32af5 Rahul T R              2024-05-28  1856  		compatible = "ti,j721e-mhdp8546";
e776ac0ef32af5 Rahul T R              2024-05-28  1857  		/*
e776ac0ef32af5 Rahul T R              2024-05-28  1858  		 * Note: we do not map DPTX PHY area, as that is handled by
e776ac0ef32af5 Rahul T R              2024-05-28  1859  		 * the PHY driver.
e776ac0ef32af5 Rahul T R              2024-05-28  1860  		 */
e776ac0ef32af5 Rahul T R              2024-05-28  1861  		reg = <0x0 0xa000000 0x0 0x30a00>, /* DSS_EDP0_V2A_CORE_VP_REGS_APB */
e776ac0ef32af5 Rahul T R              2024-05-28  1862  		      <0x0 0x4f40000 0x0 0x20>;    /* DSS_EDP0_INTG_CFG_VP */
e776ac0ef32af5 Rahul T R              2024-05-28  1863  		reg-names = "mhdptx", "j721e-intg";
e776ac0ef32af5 Rahul T R              2024-05-28  1864  
e776ac0ef32af5 Rahul T R              2024-05-28  1865  		clocks = <&k3_clks 156 19>;
e776ac0ef32af5 Rahul T R              2024-05-28  1866  
e776ac0ef32af5 Rahul T R              2024-05-28  1867  		phys = <&torrent_phy_dp>;
e776ac0ef32af5 Rahul T R              2024-05-28  1868  		phy-names = "dpphy";
e776ac0ef32af5 Rahul T R              2024-05-28  1869  
e776ac0ef32af5 Rahul T R              2024-05-28  1870  		interrupt-parent = <&gic500>;
e776ac0ef32af5 Rahul T R              2024-05-28  1871  		interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>;
e776ac0ef32af5 Rahul T R              2024-05-28  1872  
e776ac0ef32af5 Rahul T R              2024-05-28  1873  		power-domains = <&k3_pds 156 TI_SCI_PD_EXCLUSIVE>;
e776ac0ef32af5 Rahul T R              2024-05-28  1874  
e776ac0ef32af5 Rahul T R              2024-05-28  1875  		status = "disabled";
e776ac0ef32af5 Rahul T R              2024-05-28  1876  
e776ac0ef32af5 Rahul T R              2024-05-28  1877  		dp0_ports: ports {
e776ac0ef32af5 Rahul T R              2024-05-28  1878  			#address-cells = <1>;
e776ac0ef32af5 Rahul T R              2024-05-28  1879  			#size-cells = <0>;
e776ac0ef32af5 Rahul T R              2024-05-28  1880  		};
e776ac0ef32af5 Rahul T R              2024-05-28  1881  	};
e776ac0ef32af5 Rahul T R              2024-05-28  1882  
f1ef903db08100 Rahul T R              2024-05-28  1883  	dphy_tx0: phy@4480000 {
f1ef903db08100 Rahul T R              2024-05-28  1884  		compatible = "ti,j721e-dphy";
f1ef903db08100 Rahul T R              2024-05-28  1885  		reg = <0x0 0x04480000 0x0 0x1000>;
f1ef903db08100 Rahul T R              2024-05-28  1886  		clocks = <&k3_clks 363 8>, <&k3_clks 363 14>;
f1ef903db08100 Rahul T R              2024-05-28  1887  		clock-names = "psm", "pll_ref";
f1ef903db08100 Rahul T R              2024-05-28  1888  		#phy-cells = <0>;
f1ef903db08100 Rahul T R              2024-05-28  1889  		power-domains = <&k3_pds 363 TI_SCI_PD_EXCLUSIVE>;
f1ef903db08100 Rahul T R              2024-05-28  1890  		assigned-clocks = <&k3_clks 363 14>;
f1ef903db08100 Rahul T R              2024-05-28  1891  		assigned-clock-parents = <&k3_clks 363 15>;
f1ef903db08100 Rahul T R              2024-05-28  1892  		assigned-clock-rates = <19200000>;
f1ef903db08100 Rahul T R              2024-05-28  1893  		status = "disabled";
f1ef903db08100 Rahul T R              2024-05-28  1894  	};
f1ef903db08100 Rahul T R              2024-05-28  1895  
f1ef903db08100 Rahul T R              2024-05-28  1896  	dsi0: dsi@4800000 {
f1ef903db08100 Rahul T R              2024-05-28  1897  		compatible = "ti,j721e-dsi";
f1ef903db08100 Rahul T R              2024-05-28  1898  		reg = <0x0 0x04800000 0x0 0x100000>, <0x0 0x04710000 0x0 0x100>;
f1ef903db08100 Rahul T R              2024-05-28  1899  		clocks = <&k3_clks 154 4>, <&k3_clks 154 1>;
f1ef903db08100 Rahul T R              2024-05-28  1900  		clock-names = "dsi_p_clk", "dsi_sys_clk";
f1ef903db08100 Rahul T R              2024-05-28  1901  		power-domains = <&k3_pds 154 TI_SCI_PD_EXCLUSIVE>;
f1ef903db08100 Rahul T R              2024-05-28  1902  		interrupt-parent = <&gic500>;
f1ef903db08100 Rahul T R              2024-05-28  1903  		interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
f1ef903db08100 Rahul T R              2024-05-28  1904  		phys = <&dphy_tx0>;
f1ef903db08100 Rahul T R              2024-05-28  1905  		phy-names = "dphy";
f1ef903db08100 Rahul T R              2024-05-28  1906  		status = "disabled";
f1ef903db08100 Rahul T R              2024-05-28  1907  
f1ef903db08100 Rahul T R              2024-05-28  1908  		dsi0_ports: ports {
f1ef903db08100 Rahul T R              2024-05-28  1909  			#address-cells = <1>;
f1ef903db08100 Rahul T R              2024-05-28  1910  			#size-cells = <0>;
f1ef903db08100 Rahul T R              2024-05-28  1911  			port@0 {
f1ef903db08100 Rahul T R              2024-05-28  1912  				reg = <0>;
f1ef903db08100 Rahul T R              2024-05-28  1913  			};
f1ef903db08100 Rahul T R              2024-05-28  1914  			port@1 {
f1ef903db08100 Rahul T R              2024-05-28  1915  				reg = <1>;
f1ef903db08100 Rahul T R              2024-05-28  1916  			};
f1ef903db08100 Rahul T R              2024-05-28  1917  		};
f1ef903db08100 Rahul T R              2024-05-28  1918  	};
f1ef903db08100 Rahul T R              2024-05-28  1919  
dd27f551c9ec0c Siddharth Vadapalli    2024-06-13 @1920  	timesync_router: pinctrl@a40000 {

:::::: The code at line 1920 was first introduced by commit
:::::: dd27f551c9ec0ccd8f8b7898a75811ec5bed8911 arm64: dts: ti: k3-j721s2-main: Add timesync_router node

:::::: TO: Siddharth Vadapalli <s-vadapalli@ti.com>
:::::: CC: Udit Kumar <u-kumar1@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
