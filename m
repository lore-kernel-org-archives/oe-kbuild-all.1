Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35593A8F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 22:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718578203; cv=none; b=nRtn3ETkBcHVeSYS6xJRX1trVrYXkZ8HQKAUjruEnqrrafRI1dHOitc2OtrFIh6raBG8mNX8NEoQVcWlpYzmoXKhxq7cZsOiWVwZ49MMwymFqW8NbuHCluf46Rr8kScq2t4ghi3og67/qyTh1KpGZ0WlI/lxh7KtZ9oaX4fesqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718578203; c=relaxed/simple;
	bh=1Q0XrOE9UKXk2C/M5u7vrvaldkGpy2HaO6fO/L/rtbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/i+71HJxgM/EKoNln1lASUHEatEQNb7oxVUgID7BY/3buj5Zz8f8AZKeTMQiQmT68Mcz+71MldEwjw8TB+DMdsik5/LOItiV+gFu8gSV8tmpK94bEQTLbXODXwKNGkBJNdS2Pnnx0aIfdSm5qK/Vmq7MiW9ZwZdIX4ImMNdIIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUvxOhPm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUvxOhPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718578198; x=1750114198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Q0XrOE9UKXk2C/M5u7vrvaldkGpy2HaO6fO/L/rtbs=;
  b=NUvxOhPmuTEGsgRD8Rs2pm3p/Qmw/QqJdfAUwz5QP75ReIyUkP+CKjUz
   BCUa/XVX+UUrToF1Apgt0JyvbCAGYGuCg3K2b9e1D1jquyrK2m+UvTaXy
   UBD2DoGDi80bztOo8nGD8UsBPrVOQjWTxH3p4GfeH3RnJYLuwUUEqm2qx
   QQps1743z+4lQx5ZpvVg1QiSV/dt8NFVYCYwoxBP7ivdHz7RPcc0hk2M1
   Zm3oL/11xTlPRYAwfj7ee/rgoEwA+qvzExGsBDAHSP4hEq/VPM6oB9tRD
   rCQh4AcKC1xxwtWh1befBEDu4iVIlTVwWmPQnuFqStirwDXiAJiyICZeE
   A==;
X-CSE-ConnectionGUID: nCGHAqzCT1CJ+nYz8rg7MQ==
X-CSE-MsgGUID: lKpukf0rRteiivg1DBh6OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15627627"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="15627627"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 15:49:57 -0700
X-CSE-ConnectionGUID: +ITsA3x1RPqpLsQ7KHiI3A==
X-CSE-MsgGUID: R7UtgamRT/eJORULnZ1FrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="72237053"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2024 15:49:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIyh6-0003Qq-1A;
	Sun, 16 Jun 2024 22:49:52 +0000
Date: Mon, 17 Jun 2024 06:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Chintan Vankar <c-vankar@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 33/39]
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi:1545.34-1554.4: Warning
 (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202406170651.huDwP9SF-lkp@intel.com>
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
commit: 6a7c47051ade9c9ac19435a907db294bb0be7d41 [33/39] arm64: dts: ti: k3-j7200-common-proc-board: Add MCU CPSW CPTS PPS support
config: arm64-randconfig-003-20240616 (https://download.01.org/0day-ci/archive/20240617/202406170651.huDwP9SF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170651.huDwP9SF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170651.huDwP9SF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j7200-main.dtsi:1545.34-1554.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +1545 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi

4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05    14  
d361ed88455feae Lokesh Vutla           2020-09-14    15  &cbass_main {
d361ed88455feae Lokesh Vutla           2020-09-14    16  	msmc_ram: sram@70000000 {
d361ed88455feae Lokesh Vutla           2020-09-14    17  		compatible = "mmio-sram";
d361ed88455feae Lokesh Vutla           2020-09-14    18  		reg = <0x00 0x70000000 0x00 0x100000>;
d361ed88455feae Lokesh Vutla           2020-09-14    19  		#address-cells = <1>;
d361ed88455feae Lokesh Vutla           2020-09-14    20  		#size-cells = <1>;
d361ed88455feae Lokesh Vutla           2020-09-14    21  		ranges = <0x00 0x00 0x70000000 0x100000>;
d361ed88455feae Lokesh Vutla           2020-09-14    22  
d361ed88455feae Lokesh Vutla           2020-09-14    23  		atf-sram@0 {
d361ed88455feae Lokesh Vutla           2020-09-14    24  			reg = <0x00 0x20000>;
d361ed88455feae Lokesh Vutla           2020-09-14    25  		};
d361ed88455feae Lokesh Vutla           2020-09-14    26  	};
d361ed88455feae Lokesh Vutla           2020-09-14    27  
1509295295c03c5 Roger Quadros          2020-09-30    28  	scm_conf: scm-conf@100000 {
1509295295c03c5 Roger Quadros          2020-09-30    29  		compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
1509295295c03c5 Roger Quadros          2020-09-30    30  		reg = <0x00 0x00100000 0x00 0x1c000>;
1509295295c03c5 Roger Quadros          2020-09-30    31  		#address-cells = <1>;
1509295295c03c5 Roger Quadros          2020-09-30    32  		#size-cells = <1>;
1509295295c03c5 Roger Quadros          2020-09-30    33  		ranges = <0x00 0x00 0x00100000 0x1c000>;
1509295295c03c5 Roger Quadros          2020-09-30    34  
4d3984906397581 Kishon Vijay Abraham I 2021-11-26    35  		serdes_ln_ctrl: mux-controller@4080 {
bd55682fa0d8cb1 Andrew Davis           2024-01-24    36  			compatible = "reg-mux";
bd55682fa0d8cb1 Andrew Davis           2024-01-24    37  			reg = <0x4080 0x20>;
1509295295c03c5 Roger Quadros          2020-09-30    38  			#mux-control-cells = <1>;
bd55682fa0d8cb1 Andrew Davis           2024-01-24    39  			mux-reg-masks = <0x0 0x3>, <0x4 0x3>, /* SERDES0 lane0/1 select */
bd55682fa0d8cb1 Andrew Davis           2024-01-24    40  					<0x8 0x3>, <0xc 0x3>; /* SERDES0 lane2/3 select */
1509295295c03c5 Roger Quadros          2020-09-30    41  		};
9a09e6e9cfcf542 Roger Quadros          2020-09-30    42  
d3bac98015da558 Siddharth Vadapalli    2023-03-15    43  		cpsw0_phy_gmii_sel: phy@4044 {
d3bac98015da558 Siddharth Vadapalli    2023-03-15    44  			compatible = "ti,j7200-cpsw5g-phy-gmii-sel";
d3bac98015da558 Siddharth Vadapalli    2023-03-15    45  			ti,qsgmii-main-ports = <1>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15    46  			reg = <0x4044 0x10>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15    47  			#phy-cells = <1>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15    48  		};
d3bac98015da558 Siddharth Vadapalli    2023-03-15    49  
9a09e6e9cfcf542 Roger Quadros          2020-09-30    50  		usb_serdes_mux: mux-controller@4000 {
8e81078c066f616 Andrew Davis           2024-01-24    51  			compatible = "reg-mux";
8e81078c066f616 Andrew Davis           2024-01-24    52  			reg = <0x4000 0x4>;
9a09e6e9cfcf542 Roger Quadros          2020-09-30    53  			#mux-control-cells = <1>;
8e81078c066f616 Andrew Davis           2024-01-24    54  			mux-reg-masks = <0x0 0x8000000>; /* USB0 to SERDES0 lane 1/3 mux */
9a09e6e9cfcf542 Roger Quadros          2020-09-30    55  		};
1509295295c03c5 Roger Quadros          2020-09-30    56  	};
1509295295c03c5 Roger Quadros          2020-09-30    57  
d361ed88455feae Lokesh Vutla           2020-09-14    58  	gic500: interrupt-controller@1800000 {
d361ed88455feae Lokesh Vutla           2020-09-14    59  		compatible = "arm,gic-v3";
d361ed88455feae Lokesh Vutla           2020-09-14    60  		#address-cells = <2>;
d361ed88455feae Lokesh Vutla           2020-09-14    61  		#size-cells = <2>;
d361ed88455feae Lokesh Vutla           2020-09-14    62  		ranges;
d361ed88455feae Lokesh Vutla           2020-09-14    63  		#interrupt-cells = <3>;
d361ed88455feae Lokesh Vutla           2020-09-14    64  		interrupt-controller;
d361ed88455feae Lokesh Vutla           2020-09-14    65  		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
1a307cc299430dd Nishanth Menon         2022-02-15    66  		      <0x00 0x01900000 0x00 0x100000>,	/* GICR */
1a307cc299430dd Nishanth Menon         2022-02-15    67  		      <0x00 0x6f000000 0x00 0x2000>,	/* GICC */
1a307cc299430dd Nishanth Menon         2022-02-15    68  		      <0x00 0x6f010000 0x00 0x1000>,	/* GICH */
1a307cc299430dd Nishanth Menon         2022-02-15    69  		      <0x00 0x6f020000 0x00 0x2000>;	/* GICV */
d361ed88455feae Lokesh Vutla           2020-09-14    70  
d361ed88455feae Lokesh Vutla           2020-09-14    71  		/* vcpumntirq: virtual CPU interface maintenance interrupt */
d361ed88455feae Lokesh Vutla           2020-09-14    72  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
d361ed88455feae Lokesh Vutla           2020-09-14    73  
d361ed88455feae Lokesh Vutla           2020-09-14    74  		gic_its: msi-controller@1820000 {
d361ed88455feae Lokesh Vutla           2020-09-14    75  			compatible = "arm,gic-v3-its";
d361ed88455feae Lokesh Vutla           2020-09-14    76  			reg = <0x00 0x01820000 0x00 0x10000>;
d361ed88455feae Lokesh Vutla           2020-09-14    77  			socionext,synquacer-pre-its = <0x1000000 0x400000>;
d361ed88455feae Lokesh Vutla           2020-09-14    78  			msi-controller;
d361ed88455feae Lokesh Vutla           2020-09-14    79  			#msi-cells = <1>;
d361ed88455feae Lokesh Vutla           2020-09-14    80  		};
d361ed88455feae Lokesh Vutla           2020-09-14    81  	};
d361ed88455feae Lokesh Vutla           2020-09-14    82  
cab12badfc99f93 Nishanth Menon         2021-05-11    83  	main_gpio_intr: interrupt-controller@a00000 {
d361ed88455feae Lokesh Vutla           2020-09-14    84  		compatible = "ti,sci-intr";
cab12badfc99f93 Nishanth Menon         2021-05-11    85  		reg = <0x00 0x00a00000 0x00 0x800>;
d361ed88455feae Lokesh Vutla           2020-09-14    86  		ti,intr-trigger-type = <1>;
d361ed88455feae Lokesh Vutla           2020-09-14    87  		interrupt-controller;
d361ed88455feae Lokesh Vutla           2020-09-14    88  		interrupt-parent = <&gic500>;
d361ed88455feae Lokesh Vutla           2020-09-14    89  		#interrupt-cells = <1>;
d361ed88455feae Lokesh Vutla           2020-09-14    90  		ti,sci = <&dmsc>;
d361ed88455feae Lokesh Vutla           2020-09-14    91  		ti,sci-dev-id = <131>;
d361ed88455feae Lokesh Vutla           2020-09-14    92  		ti,interrupt-ranges = <8 392 56>;
d361ed88455feae Lokesh Vutla           2020-09-14    93  	};
d361ed88455feae Lokesh Vutla           2020-09-14    94  
d361ed88455feae Lokesh Vutla           2020-09-14    95  	main_navss: bus@30000000 {
18965c655c80249 Vignesh Raghavendra    2023-10-05    96  		compatible = "simple-bus";
d361ed88455feae Lokesh Vutla           2020-09-14    97  		#address-cells = <2>;
d361ed88455feae Lokesh Vutla           2020-09-14    98  		#size-cells = <2>;
d361ed88455feae Lokesh Vutla           2020-09-14    99  		ranges = <0x00 0x30000000 0x00 0x30000000 0x00 0x0c400000>;
d361ed88455feae Lokesh Vutla           2020-09-14   100  		ti,sci-dev-id = <199>;
52ae30f55a2a40c Vignesh Raghavendra    2021-05-10   101  		dma-coherent;
52ae30f55a2a40c Vignesh Raghavendra    2021-05-10   102  		dma-ranges;
d361ed88455feae Lokesh Vutla           2020-09-14   103  
cab12badfc99f93 Nishanth Menon         2021-05-11   104  		main_navss_intr: interrupt-controller@310e0000 {
d361ed88455feae Lokesh Vutla           2020-09-14   105  			compatible = "ti,sci-intr";
cab12badfc99f93 Nishanth Menon         2021-05-11   106  			reg = <0x00 0x310e0000 0x00 0x4000>;
d361ed88455feae Lokesh Vutla           2020-09-14   107  			ti,intr-trigger-type = <4>;
d361ed88455feae Lokesh Vutla           2020-09-14   108  			interrupt-controller;
d361ed88455feae Lokesh Vutla           2020-09-14   109  			interrupt-parent = <&gic500>;
d361ed88455feae Lokesh Vutla           2020-09-14   110  			#interrupt-cells = <1>;
d361ed88455feae Lokesh Vutla           2020-09-14   111  			ti,sci = <&dmsc>;
d361ed88455feae Lokesh Vutla           2020-09-14   112  			ti,sci-dev-id = <213>;
d361ed88455feae Lokesh Vutla           2020-09-14   113  			ti,interrupt-ranges = <0 64 64>,
d361ed88455feae Lokesh Vutla           2020-09-14   114  					      <64 448 64>,
d361ed88455feae Lokesh Vutla           2020-09-14   115  					      <128 672 64>;
d361ed88455feae Lokesh Vutla           2020-09-14   116  		};
d361ed88455feae Lokesh Vutla           2020-09-14   117  
d361ed88455feae Lokesh Vutla           2020-09-14   118  		main_udmass_inta: msi-controller@33d00000 {
d361ed88455feae Lokesh Vutla           2020-09-14   119  			compatible = "ti,sci-inta";
d361ed88455feae Lokesh Vutla           2020-09-14   120  			reg = <0x00 0x33d00000 0x00 0x100000>;
d361ed88455feae Lokesh Vutla           2020-09-14   121  			interrupt-controller;
d361ed88455feae Lokesh Vutla           2020-09-14   122  			#interrupt-cells = <0>;
d361ed88455feae Lokesh Vutla           2020-09-14   123  			interrupt-parent = <&main_navss_intr>;
d361ed88455feae Lokesh Vutla           2020-09-14   124  			msi-controller;
d361ed88455feae Lokesh Vutla           2020-09-14   125  			ti,sci = <&dmsc>;
d361ed88455feae Lokesh Vutla           2020-09-14   126  			ti,sci-dev-id = <209>;
d361ed88455feae Lokesh Vutla           2020-09-14   127  			ti,interrupt-ranges = <0 0 256>;
d361ed88455feae Lokesh Vutla           2020-09-14   128  		};
d361ed88455feae Lokesh Vutla           2020-09-14   129  
d361ed88455feae Lokesh Vutla           2020-09-14   130  		secure_proxy_main: mailbox@32c00000 {
d361ed88455feae Lokesh Vutla           2020-09-14   131  			compatible = "ti,am654-secure-proxy";
d361ed88455feae Lokesh Vutla           2020-09-14   132  			#mbox-cells = <1>;
d361ed88455feae Lokesh Vutla           2020-09-14   133  			reg-names = "target_data", "rt", "scfg";
d361ed88455feae Lokesh Vutla           2020-09-14   134  			reg = <0x00 0x32c00000 0x00 0x100000>,
d361ed88455feae Lokesh Vutla           2020-09-14   135  			      <0x00 0x32400000 0x00 0x100000>,
d361ed88455feae Lokesh Vutla           2020-09-14   136  			      <0x00 0x32800000 0x00 0x100000>;
d361ed88455feae Lokesh Vutla           2020-09-14   137  			interrupt-names = "rx_011";
d361ed88455feae Lokesh Vutla           2020-09-14   138  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
d361ed88455feae Lokesh Vutla           2020-09-14   139  		};
463742644e96403 Peter Ujfalusi         2020-09-24   140  
1d7a01c40840d84 Suman Anna             2020-10-26   141  		hwspinlock: spinlock@30e00000 {
1d7a01c40840d84 Suman Anna             2020-10-26   142  			compatible = "ti,am654-hwspinlock";
1d7a01c40840d84 Suman Anna             2020-10-26   143  			reg = <0x00 0x30e00000 0x00 0x1000>;
1d7a01c40840d84 Suman Anna             2020-10-26   144  			#hwlock-cells = <1>;
1d7a01c40840d84 Suman Anna             2020-10-26   145  		};
1d7a01c40840d84 Suman Anna             2020-10-26   146  
d15d1cfbd765b4b Suman Anna             2020-10-26   147  		mailbox0_cluster0: mailbox@31f80000 {
d15d1cfbd765b4b Suman Anna             2020-10-26   148  			compatible = "ti,am654-mailbox";
d15d1cfbd765b4b Suman Anna             2020-10-26   149  			reg = <0x00 0x31f80000 0x00 0x200>;
d15d1cfbd765b4b Suman Anna             2020-10-26   150  			#mbox-cells = <1>;
d15d1cfbd765b4b Suman Anna             2020-10-26   151  			ti,mbox-num-users = <4>;
d15d1cfbd765b4b Suman Anna             2020-10-26   152  			ti,mbox-num-fifos = <16>;
d15d1cfbd765b4b Suman Anna             2020-10-26   153  			interrupt-parent = <&main_navss_intr>;
74f0f58d3122c3e Andrew Davis           2022-10-20   154  			status = "disabled";
d15d1cfbd765b4b Suman Anna             2020-10-26   155  		};
d15d1cfbd765b4b Suman Anna             2020-10-26   156  
d15d1cfbd765b4b Suman Anna             2020-10-26   157  		mailbox0_cluster1: mailbox@31f81000 {
d15d1cfbd765b4b Suman Anna             2020-10-26   158  			compatible = "ti,am654-mailbox";
d15d1cfbd765b4b Suman Anna             2020-10-26   159  			reg = <0x00 0x31f81000 0x00 0x200>;
d15d1cfbd765b4b Suman Anna             2020-10-26   160  			#mbox-cells = <1>;
d15d1cfbd765b4b Suman Anna             2020-10-26   161  			ti,mbox-num-users = <4>;
d15d1cfbd765b4b Suman Anna             2020-10-26   162  			ti,mbox-num-fifos = <16>;
d15d1cfbd765b4b Suman Anna             2020-10-26   163  			interrupt-parent = <&main_navss_intr>;
74f0f58d3122c3e Andrew Davis           2022-10-20   164  			status = "disabled";
d15d1cfbd765b4b Suman Anna             2020-10-26   165  		};
d15d1cfbd765b4b Suman Anna             2020-10-26   166  
d15d1cfbd765b4b Suman Anna             2020-10-26   167  		mailbox0_cluster2: mailbox@31f82000 {
d15d1cfbd765b4b Suman Anna             2020-10-26   168  			compatible = "ti,am654-mailbox";
d15d1cfbd765b4b Suman Anna             2020-10-26   169  			reg = <0x00 0x31f82000 0x00 0x200>;
d15d1cfbd765b4b Suman Anna             2020-10-26   170  			#mbox-cells = <1>;
d15d1cfbd765b4b Suman Anna             2020-10-26   171  			ti,mbox-num-users = <4>;
d15d1cfbd765b4b Suman Anna             2020-10-26   172  			ti,mbox-num-fifos = <16>;
d15d1cfbd765b4b Suman Anna             2020-10-26   173  			interrupt-parent = <&main_navss_intr>;
74f0f58d3122c3e Andrew Davis           2022-10-20   174  			status = "disabled";
d15d1cfbd765b4b Suman Anna             2020-10-26   175  		};
d15d1cfbd765b4b Suman Anna             2020-10-26   176  
d15d1cfbd765b4b Suman Anna             2020-10-26   177  		mailbox0_cluster3: mailbox@31f83000 {
d15d1cfbd765b4b Suman Anna             2020-10-26   178  			compatible = "ti,am654-mailbox";
d15d1cfbd765b4b Suman Anna             2020-10-26   179  			reg = <0x00 0x31f83000 0x00 0x200>;
d15d1cfbd765b4b Suman Anna             2020-10-26   180  			#mbox-cells = <1>;
d15d1cfbd765b4b Suman Anna             2020-10-26   181  			ti,mbox-num-users = <4>;
d15d1cfbd765b4b Suman Anna             2020-10-26   182  			ti,mbox-num-fifos = <16>;
d15d1cfbd765b4b Suman Anna             2020-10-26   183  			interrupt-parent = <&main_navss_intr>;
74f0f58d3122c3e Andrew Davis           2022-10-20   184  			status = "disabled";
d15d1cfbd765b4b Suman Anna             2020-10-26   185  		};
d15d1cfbd765b4b Suman Anna             2020-10-26   186  
d15d1cfbd765b4b Suman Anna             2020-10-26   187  		mailbox0_cluster4: mailbox@31f84000 {
d15d1cfbd765b4b Suman Anna             2020-10-26   188  			compatible = "ti,am654-mailbox";
d15d1cfbd765b4b Suman Anna             2020-10-26   189  			reg = <0x00 0x31f84000 0x00 0x200>;
d15d1cfbd765b4b Suman Anna             2020-10-26   190  			#mbox-cells = <1>;
d15d1cfbd765b4b Suman Anna             2020-10-26   191  			ti,mbox-num-users = <4>;
d15d1cfbd765b4b Suman Anna             2020-10-26   192  			ti,mbox-num-fifos = <16>;
d15d1cfbd765b4b Suman Anna             2020-10-26   193  			interrupt-parent = <&main_navss_intr>;
74f0f58d3122c3e Andrew Davis           2022-10-20   194  			status = "disabled";
d15d1cfbd765b4b Suman Anna             2020-10-26   195  		};
d15d1cfbd765b4b Suman Anna             2020-10-26   196  
d15d1cfbd765b4b Suman Anna             2020-10-26   197  		mailbox0_cluster5: mailbox@31f85000 {
d15d1cfbd765b4b Suman Anna             2020-10-26   198  			compatible = "ti,am654-mailbox";
d15d1cfbd765b4b Suman Anna             2020-10-26   199  			reg = <0x00 0x31f85000 0x00 0x200>;
d15d1cfbd765b4b Suman Anna             2020-10-26   200  			#mbox-cells = <1>;
d15d1cfbd765b4b Suman Anna             2020-10-26   201  			ti,mbox-num-users = <4>;
d15d1cfbd765b4b Suman Anna             2020-10-26   202  			ti,mbox-num-fifos = <16>;
d15d1cfbd765b4b Suman Anna             2020-10-26   203  			interrupt-parent = <&main_navss_intr>;
74f0f58d3122c3e Andrew Davis           2022-10-20   204  			status = "disabled";
d15d1cfbd765b4b Suman Anna             2020-10-26   205  		};
d15d1cfbd765b4b Suman Anna             2020-10-26   206  
d15d1cfbd765b4b Suman Anna             2020-10-26   207  		mailbox0_cluster6: mailbox@31f86000 {
d15d1cfbd765b4b Suman Anna             2020-10-26   208  			compatible = "ti,am654-mailbox";
d15d1cfbd765b4b Suman Anna             2020-10-26   209  			reg = <0x00 0x31f86000 0x00 0x200>;
d15d1cfbd765b4b Suman Anna             2020-10-26   210  			#mbox-cells = <1>;
d15d1cfbd765b4b Suman Anna             2020-10-26   211  			ti,mbox-num-users = <4>;
d15d1cfbd765b4b Suman Anna             2020-10-26   212  			ti,mbox-num-fifos = <16>;
d15d1cfbd765b4b Suman Anna             2020-10-26   213  			interrupt-parent = <&main_navss_intr>;
74f0f58d3122c3e Andrew Davis           2022-10-20   214  			status = "disabled";
d15d1cfbd765b4b Suman Anna             2020-10-26   215  		};
d15d1cfbd765b4b Suman Anna             2020-10-26   216  
d15d1cfbd765b4b Suman Anna             2020-10-26   217  		mailbox0_cluster7: mailbox@31f87000 {
d15d1cfbd765b4b Suman Anna             2020-10-26   218  			compatible = "ti,am654-mailbox";
d15d1cfbd765b4b Suman Anna             2020-10-26   219  			reg = <0x00 0x31f87000 0x00 0x200>;
d15d1cfbd765b4b Suman Anna             2020-10-26   220  			#mbox-cells = <1>;
d15d1cfbd765b4b Suman Anna             2020-10-26   221  			ti,mbox-num-users = <4>;
d15d1cfbd765b4b Suman Anna             2020-10-26   222  			ti,mbox-num-fifos = <16>;
d15d1cfbd765b4b Suman Anna             2020-10-26   223  			interrupt-parent = <&main_navss_intr>;
74f0f58d3122c3e Andrew Davis           2022-10-20   224  			status = "disabled";
d15d1cfbd765b4b Suman Anna             2020-10-26   225  		};
d15d1cfbd765b4b Suman Anna             2020-10-26   226  
d15d1cfbd765b4b Suman Anna             2020-10-26   227  		mailbox0_cluster8: mailbox@31f88000 {
d15d1cfbd765b4b Suman Anna             2020-10-26   228  			compatible = "ti,am654-mailbox";
d15d1cfbd765b4b Suman Anna             2020-10-26   229  			reg = <0x00 0x31f88000 0x00 0x200>;
d15d1cfbd765b4b Suman Anna             2020-10-26   230  			#mbox-cells = <1>;
d15d1cfbd765b4b Suman Anna             2020-10-26   231  			ti,mbox-num-users = <4>;
d15d1cfbd765b4b Suman Anna             2020-10-26   232  			ti,mbox-num-fifos = <16>;
d15d1cfbd765b4b Suman Anna             2020-10-26   233  			interrupt-parent = <&main_navss_intr>;
74f0f58d3122c3e Andrew Davis           2022-10-20   234  			status = "disabled";
d15d1cfbd765b4b Suman Anna             2020-10-26   235  		};
d15d1cfbd765b4b Suman Anna             2020-10-26   236  
d15d1cfbd765b4b Suman Anna             2020-10-26   237  		mailbox0_cluster9: mailbox@31f89000 {
d15d1cfbd765b4b Suman Anna             2020-10-26   238  			compatible = "ti,am654-mailbox";
d15d1cfbd765b4b Suman Anna             2020-10-26   239  			reg = <0x00 0x31f89000 0x00 0x200>;
d15d1cfbd765b4b Suman Anna             2020-10-26   240  			#mbox-cells = <1>;
d15d1cfbd765b4b Suman Anna             2020-10-26   241  			ti,mbox-num-users = <4>;
d15d1cfbd765b4b Suman Anna             2020-10-26   242  			ti,mbox-num-fifos = <16>;
d15d1cfbd765b4b Suman Anna             2020-10-26   243  			interrupt-parent = <&main_navss_intr>;
74f0f58d3122c3e Andrew Davis           2022-10-20   244  			status = "disabled";
d15d1cfbd765b4b Suman Anna             2020-10-26   245  		};
d15d1cfbd765b4b Suman Anna             2020-10-26   246  
d15d1cfbd765b4b Suman Anna             2020-10-26   247  		mailbox0_cluster10: mailbox@31f8a000 {
d15d1cfbd765b4b Suman Anna             2020-10-26   248  			compatible = "ti,am654-mailbox";
d15d1cfbd765b4b Suman Anna             2020-10-26   249  			reg = <0x00 0x31f8a000 0x00 0x200>;
d15d1cfbd765b4b Suman Anna             2020-10-26   250  			#mbox-cells = <1>;
d15d1cfbd765b4b Suman Anna             2020-10-26   251  			ti,mbox-num-users = <4>;
d15d1cfbd765b4b Suman Anna             2020-10-26   252  			ti,mbox-num-fifos = <16>;
d15d1cfbd765b4b Suman Anna             2020-10-26   253  			interrupt-parent = <&main_navss_intr>;
74f0f58d3122c3e Andrew Davis           2022-10-20   254  			status = "disabled";
d15d1cfbd765b4b Suman Anna             2020-10-26   255  		};
d15d1cfbd765b4b Suman Anna             2020-10-26   256  
d15d1cfbd765b4b Suman Anna             2020-10-26   257  		mailbox0_cluster11: mailbox@31f8b000 {
d15d1cfbd765b4b Suman Anna             2020-10-26   258  			compatible = "ti,am654-mailbox";
d15d1cfbd765b4b Suman Anna             2020-10-26   259  			reg = <0x00 0x31f8b000 0x00 0x200>;
d15d1cfbd765b4b Suman Anna             2020-10-26   260  			#mbox-cells = <1>;
d15d1cfbd765b4b Suman Anna             2020-10-26   261  			ti,mbox-num-users = <4>;
d15d1cfbd765b4b Suman Anna             2020-10-26   262  			ti,mbox-num-fifos = <16>;
d15d1cfbd765b4b Suman Anna             2020-10-26   263  			interrupt-parent = <&main_navss_intr>;
74f0f58d3122c3e Andrew Davis           2022-10-20   264  			status = "disabled";
d15d1cfbd765b4b Suman Anna             2020-10-26   265  		};
d15d1cfbd765b4b Suman Anna             2020-10-26   266  
463742644e96403 Peter Ujfalusi         2020-09-24   267  		main_ringacc: ringacc@3c000000 {
463742644e96403 Peter Ujfalusi         2020-09-24   268  			compatible = "ti,am654-navss-ringacc";
463742644e96403 Peter Ujfalusi         2020-09-24   269  			reg = <0x00 0x3c000000 0x00 0x400000>,
463742644e96403 Peter Ujfalusi         2020-09-24   270  			      <0x00 0x38000000 0x00 0x400000>,
463742644e96403 Peter Ujfalusi         2020-09-24   271  			      <0x00 0x31120000 0x00 0x100>,
702110c2be999c1 Vignesh Raghavendra    2023-08-09   272  			      <0x00 0x33000000 0x00 0x40000>,
702110c2be999c1 Vignesh Raghavendra    2023-08-09   273  			      <0x00 0x31080000 0x00 0x40000>;
702110c2be999c1 Vignesh Raghavendra    2023-08-09   274  			reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target", "cfg";
463742644e96403 Peter Ujfalusi         2020-09-24   275  			ti,num-rings = <1024>;
463742644e96403 Peter Ujfalusi         2020-09-24   276  			ti,sci-rm-range-gp-rings = <0x1>; /* GP ring range */
463742644e96403 Peter Ujfalusi         2020-09-24   277  			ti,sci = <&dmsc>;
463742644e96403 Peter Ujfalusi         2020-09-24   278  			ti,sci-dev-id = <211>;
463742644e96403 Peter Ujfalusi         2020-09-24   279  			msi-parent = <&main_udmass_inta>;
463742644e96403 Peter Ujfalusi         2020-09-24   280  		};
463742644e96403 Peter Ujfalusi         2020-09-24   281  
463742644e96403 Peter Ujfalusi         2020-09-24   282  		main_udmap: dma-controller@31150000 {
463742644e96403 Peter Ujfalusi         2020-09-24   283  			compatible = "ti,j721e-navss-main-udmap";
463742644e96403 Peter Ujfalusi         2020-09-24   284  			reg = <0x00 0x31150000 0x00 0x100>,
463742644e96403 Peter Ujfalusi         2020-09-24   285  			      <0x00 0x34000000 0x00 0x100000>,
22a8434daa92a0f Manorit Chawdhry       2023-12-13   286  			      <0x00 0x35000000 0x00 0x100000>,
22a8434daa92a0f Manorit Chawdhry       2023-12-13   287  			      <0x00 0x30b00000 0x00 0x4000>,
22a8434daa92a0f Manorit Chawdhry       2023-12-13   288  			      <0x00 0x30c00000 0x00 0x4000>,
22a8434daa92a0f Manorit Chawdhry       2023-12-13   289  			      <0x00 0x30d00000 0x00 0x4000>;
22a8434daa92a0f Manorit Chawdhry       2023-12-13   290  			reg-names = "gcfg", "rchanrt", "tchanrt",
22a8434daa92a0f Manorit Chawdhry       2023-12-13   291  				    "tchan", "rchan", "rflow";
463742644e96403 Peter Ujfalusi         2020-09-24   292  			msi-parent = <&main_udmass_inta>;
463742644e96403 Peter Ujfalusi         2020-09-24   293  			#dma-cells = <1>;
463742644e96403 Peter Ujfalusi         2020-09-24   294  
463742644e96403 Peter Ujfalusi         2020-09-24   295  			ti,sci = <&dmsc>;
463742644e96403 Peter Ujfalusi         2020-09-24   296  			ti,sci-dev-id = <212>;
463742644e96403 Peter Ujfalusi         2020-09-24   297  			ti,ringacc = <&main_ringacc>;
463742644e96403 Peter Ujfalusi         2020-09-24   298  
463742644e96403 Peter Ujfalusi         2020-09-24   299  			ti,sci-rm-range-tchan = <0x0d>, /* TX_CHAN */
463742644e96403 Peter Ujfalusi         2020-09-24   300  						<0x0f>, /* TX_HCHAN */
463742644e96403 Peter Ujfalusi         2020-09-24   301  						<0x10>; /* TX_UHCHAN */
463742644e96403 Peter Ujfalusi         2020-09-24   302  			ti,sci-rm-range-rchan = <0x0a>, /* RX_CHAN */
463742644e96403 Peter Ujfalusi         2020-09-24   303  						<0x0b>, /* RX_HCHAN */
463742644e96403 Peter Ujfalusi         2020-09-24   304  						<0x0c>; /* RX_UHCHAN */
463742644e96403 Peter Ujfalusi         2020-09-24   305  			ti,sci-rm-range-rflow = <0x00>; /* GP RFLOW */
463742644e96403 Peter Ujfalusi         2020-09-24   306  		};
c5d73d8d49f62bd Grygorii Strashko      2020-09-24   307  
c5d73d8d49f62bd Grygorii Strashko      2020-09-24   308  		cpts@310d0000 {
c5d73d8d49f62bd Grygorii Strashko      2020-09-24   309  			compatible = "ti,j721e-cpts";
c5d73d8d49f62bd Grygorii Strashko      2020-09-24   310  			reg = <0x00 0x310d0000 0x00 0x400>;
c5d73d8d49f62bd Grygorii Strashko      2020-09-24   311  			reg-names = "cpts";
c5d73d8d49f62bd Grygorii Strashko      2020-09-24   312  			clocks = <&k3_clks 201 1>;
c5d73d8d49f62bd Grygorii Strashko      2020-09-24   313  			clock-names = "cpts";
c5d73d8d49f62bd Grygorii Strashko      2020-09-24   314  			interrupts-extended = <&main_navss_intr 391>;
c5d73d8d49f62bd Grygorii Strashko      2020-09-24   315  			interrupt-names = "cpts";
c5d73d8d49f62bd Grygorii Strashko      2020-09-24   316  			ti,cpts-periodic-outputs = <6>;
c5d73d8d49f62bd Grygorii Strashko      2020-09-24   317  			ti,cpts-ext-ts-inputs = <8>;
c5d73d8d49f62bd Grygorii Strashko      2020-09-24   318  		};
d361ed88455feae Lokesh Vutla           2020-09-14   319  	};
d361ed88455feae Lokesh Vutla           2020-09-14   320  
d3bac98015da558 Siddharth Vadapalli    2023-03-15   321  	cpsw0: ethernet@c000000 {
d3bac98015da558 Siddharth Vadapalli    2023-03-15   322  		compatible = "ti,j7200-cpswxg-nuss";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   323  		#address-cells = <2>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   324  		#size-cells = <2>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   325  		reg = <0x00 0xc000000 0x00 0x200000>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   326  		reg-names = "cpsw_nuss";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   327  		ranges = <0x00 0x00 0x00 0xc000000 0x00 0x200000>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   328  		clocks = <&k3_clks 19 33>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   329  		clock-names = "fck";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   330  		power-domains = <&k3_pds 19 TI_SCI_PD_EXCLUSIVE>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   331  
d3bac98015da558 Siddharth Vadapalli    2023-03-15   332  		dmas = <&main_udmap 0xca00>,
d3bac98015da558 Siddharth Vadapalli    2023-03-15   333  		       <&main_udmap 0xca01>,
d3bac98015da558 Siddharth Vadapalli    2023-03-15   334  		       <&main_udmap 0xca02>,
d3bac98015da558 Siddharth Vadapalli    2023-03-15   335  		       <&main_udmap 0xca03>,
d3bac98015da558 Siddharth Vadapalli    2023-03-15   336  		       <&main_udmap 0xca04>,
d3bac98015da558 Siddharth Vadapalli    2023-03-15   337  		       <&main_udmap 0xca05>,
d3bac98015da558 Siddharth Vadapalli    2023-03-15   338  		       <&main_udmap 0xca06>,
d3bac98015da558 Siddharth Vadapalli    2023-03-15   339  		       <&main_udmap 0xca07>,
d3bac98015da558 Siddharth Vadapalli    2023-03-15   340  		       <&main_udmap 0x4a00>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   341  		dma-names = "tx0", "tx1", "tx2", "tx3",
d3bac98015da558 Siddharth Vadapalli    2023-03-15   342  			    "tx4", "tx5", "tx6", "tx7",
d3bac98015da558 Siddharth Vadapalli    2023-03-15   343  			    "rx";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   344  
d3bac98015da558 Siddharth Vadapalli    2023-03-15   345  		status = "disabled";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   346  
d3bac98015da558 Siddharth Vadapalli    2023-03-15   347  		ethernet-ports {
d3bac98015da558 Siddharth Vadapalli    2023-03-15   348  			#address-cells = <1>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   349  			#size-cells = <0>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   350  			cpsw0_port1: port@1 {
d3bac98015da558 Siddharth Vadapalli    2023-03-15   351  				reg = <1>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   352  				ti,mac-only;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   353  				label = "port1";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   354  				status = "disabled";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   355  			};
d3bac98015da558 Siddharth Vadapalli    2023-03-15   356  
d3bac98015da558 Siddharth Vadapalli    2023-03-15   357  			cpsw0_port2: port@2 {
d3bac98015da558 Siddharth Vadapalli    2023-03-15   358  				reg = <2>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   359  				ti,mac-only;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   360  				label = "port2";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   361  				status = "disabled";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   362  			};
d3bac98015da558 Siddharth Vadapalli    2023-03-15   363  
d3bac98015da558 Siddharth Vadapalli    2023-03-15   364  			cpsw0_port3: port@3 {
d3bac98015da558 Siddharth Vadapalli    2023-03-15   365  				reg = <3>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   366  				ti,mac-only;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   367  				label = "port3";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   368  				status = "disabled";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   369  			};
d3bac98015da558 Siddharth Vadapalli    2023-03-15   370  
d3bac98015da558 Siddharth Vadapalli    2023-03-15   371  			cpsw0_port4: port@4 {
d3bac98015da558 Siddharth Vadapalli    2023-03-15   372  				reg = <4>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   373  				ti,mac-only;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   374  				label = "port4";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   375  				status = "disabled";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   376  			};
d3bac98015da558 Siddharth Vadapalli    2023-03-15   377  		};
d3bac98015da558 Siddharth Vadapalli    2023-03-15   378  
d3bac98015da558 Siddharth Vadapalli    2023-03-15   379  		cpsw5g_mdio: mdio@f00 {
d3bac98015da558 Siddharth Vadapalli    2023-03-15   380  			compatible = "ti,cpsw-mdio","ti,davinci_mdio";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   381  			reg = <0x00 0xf00 0x00 0x100>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   382  			#address-cells = <1>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   383  			#size-cells = <0>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   384  			clocks = <&k3_clks 19 33>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   385  			clock-names = "fck";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   386  			bus_freq = <1000000>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   387  			status = "disabled";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   388  		};
d3bac98015da558 Siddharth Vadapalli    2023-03-15   389  
d3bac98015da558 Siddharth Vadapalli    2023-03-15   390  		cpts@3d000 {
d3bac98015da558 Siddharth Vadapalli    2023-03-15   391  			compatible = "ti,j721e-cpts";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   392  			reg = <0x00 0x3d000 0x00 0x400>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   393  			clocks = <&k3_clks 19 16>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   394  			clock-names = "cpts";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   395  			interrupts-extended = <&gic500 GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   396  			interrupt-names = "cpts";
d3bac98015da558 Siddharth Vadapalli    2023-03-15   397  			ti,cpts-ext-ts-inputs = <4>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   398  			ti,cpts-periodic-outputs = <2>;
d3bac98015da558 Siddharth Vadapalli    2023-03-15   399  		};
d3bac98015da558 Siddharth Vadapalli    2023-03-15   400  	};
d3bac98015da558 Siddharth Vadapalli    2023-03-15   401  
03612d384621ffe Udit Kumar             2023-06-11   402  	/* TIMERIO pad input CTRLMMR_TIMER*_CTRL registers */
03612d384621ffe Udit Kumar             2023-06-11   403  	main_timerio_input: pinctrl@104200 {
815675b7a089c9d Thomas Richard         2023-11-28   404  		compatible = "ti,j7200-padconf", "pinctrl-single";
03612d384621ffe Udit Kumar             2023-06-11   405  		reg = <0x0 0x104200 0x0 0x50>;
03612d384621ffe Udit Kumar             2023-06-11   406  		#pinctrl-cells = <1>;
03612d384621ffe Udit Kumar             2023-06-11   407  		pinctrl-single,register-width = <32>;
03612d384621ffe Udit Kumar             2023-06-11   408  		pinctrl-single,function-mask = <0x000001ff>;
03612d384621ffe Udit Kumar             2023-06-11   409  	};
03612d384621ffe Udit Kumar             2023-06-11   410  
03612d384621ffe Udit Kumar             2023-06-11   411  	/* TIMERIO pad output CTCTRLMMR_TIMERIO*_CTRL registers */
03612d384621ffe Udit Kumar             2023-06-11   412  	main_timerio_output: pinctrl@104280 {
815675b7a089c9d Thomas Richard         2023-11-28   413  		compatible = "ti,j7200-padconf", "pinctrl-single";
03612d384621ffe Udit Kumar             2023-06-11   414  		reg = <0x0 0x104280 0x0 0x20>;
03612d384621ffe Udit Kumar             2023-06-11   415  		#pinctrl-cells = <1>;
03612d384621ffe Udit Kumar             2023-06-11   416  		pinctrl-single,register-width = <32>;
03612d384621ffe Udit Kumar             2023-06-11   417  		pinctrl-single,function-mask = <0x0000001f>;
03612d384621ffe Udit Kumar             2023-06-11   418  	};
03612d384621ffe Udit Kumar             2023-06-11   419  
d361ed88455feae Lokesh Vutla           2020-09-14   420  	main_pmx0: pinctrl@11c000 {
815675b7a089c9d Thomas Richard         2023-11-28   421  		compatible = "ti,j7200-padconf", "pinctrl-single";
d361ed88455feae Lokesh Vutla           2020-09-14   422  		/* Proxy 0 addressing */
0d0a0b441346038 Matt Ranostay          2022-09-19   423  		reg = <0x00 0x11c000 0x00 0x10c>;
0d0a0b441346038 Matt Ranostay          2022-09-19   424  		#pinctrl-cells = <1>;
0d0a0b441346038 Matt Ranostay          2022-09-19   425  		pinctrl-single,register-width = <32>;
0d0a0b441346038 Matt Ranostay          2022-09-19   426  		pinctrl-single,function-mask = <0xffffffff>;
0d0a0b441346038 Matt Ranostay          2022-09-19   427  	};
0d0a0b441346038 Matt Ranostay          2022-09-19   428  
0d0a0b441346038 Matt Ranostay          2022-09-19   429  	main_pmx1: pinctrl@11c11c {
815675b7a089c9d Thomas Richard         2023-11-28   430  		compatible = "ti,j7200-padconf", "pinctrl-single";
0d0a0b441346038 Matt Ranostay          2022-09-19   431  		/* Proxy 0 addressing */
0d0a0b441346038 Matt Ranostay          2022-09-19   432  		reg = <0x00 0x11c11c 0x00 0xc>;
d361ed88455feae Lokesh Vutla           2020-09-14   433  		#pinctrl-cells = <1>;
d361ed88455feae Lokesh Vutla           2020-09-14   434  		pinctrl-single,register-width = <32>;
d361ed88455feae Lokesh Vutla           2020-09-14   435  		pinctrl-single,function-mask = <0xffffffff>;
d361ed88455feae Lokesh Vutla           2020-09-14   436  	};
d361ed88455feae Lokesh Vutla           2020-09-14   437  
d361ed88455feae Lokesh Vutla           2020-09-14   438  	main_uart0: serial@2800000 {
d361ed88455feae Lokesh Vutla           2020-09-14   439  		compatible = "ti,j721e-uart", "ti,am654-uart";
d361ed88455feae Lokesh Vutla           2020-09-14   440  		reg = <0x00 0x02800000 0x00 0x100>;
d361ed88455feae Lokesh Vutla           2020-09-14   441  		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
d361ed88455feae Lokesh Vutla           2020-09-14   442  		clock-frequency = <48000000>;
d361ed88455feae Lokesh Vutla           2020-09-14   443  		current-speed = <115200>;
d361ed88455feae Lokesh Vutla           2020-09-14   444  		power-domains = <&k3_pds 146 TI_SCI_PD_EXCLUSIVE>;
d361ed88455feae Lokesh Vutla           2020-09-14   445  		clocks = <&k3_clks 146 2>;
d361ed88455feae Lokesh Vutla           2020-09-14   446  		clock-names = "fclk";
dae322f8a7ef11a Andrew Davis           2022-10-20   447  		status = "disabled";
d361ed88455feae Lokesh Vutla           2020-09-14   448  	};
d361ed88455feae Lokesh Vutla           2020-09-14   449  
d361ed88455feae Lokesh Vutla           2020-09-14   450  	main_uart1: serial@2810000 {
d361ed88455feae Lokesh Vutla           2020-09-14   451  		compatible = "ti,j721e-uart", "ti,am654-uart";
d361ed88455feae Lokesh Vutla           2020-09-14   452  		reg = <0x00 0x02810000 0x00 0x100>;
d361ed88455feae Lokesh Vutla           2020-09-14   453  		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
d361ed88455feae Lokesh Vutla           2020-09-14   454  		clock-frequency = <48000000>;
d361ed88455feae Lokesh Vutla           2020-09-14   455  		current-speed = <115200>;
d361ed88455feae Lokesh Vutla           2020-09-14   456  		power-domains = <&k3_pds 278 TI_SCI_PD_EXCLUSIVE>;
d361ed88455feae Lokesh Vutla           2020-09-14   457  		clocks = <&k3_clks 278 2>;
d361ed88455feae Lokesh Vutla           2020-09-14   458  		clock-names = "fclk";
dae322f8a7ef11a Andrew Davis           2022-10-20   459  		status = "disabled";
d361ed88455feae Lokesh Vutla           2020-09-14   460  	};
d361ed88455feae Lokesh Vutla           2020-09-14   461  
d361ed88455feae Lokesh Vutla           2020-09-14   462  	main_uart2: serial@2820000 {
d361ed88455feae Lokesh Vutla           2020-09-14   463  		compatible = "ti,j721e-uart", "ti,am654-uart";
d361ed88455feae Lokesh Vutla           2020-09-14   464  		reg = <0x00 0x02820000 0x00 0x100>;
d361ed88455feae Lokesh Vutla           2020-09-14   465  		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
d361ed88455feae Lokesh Vutla           2020-09-14   466  		clock-frequency = <48000000>;
d361ed88455feae Lokesh Vutla           2020-09-14   467  		current-speed = <115200>;
d361ed88455feae Lokesh Vutla           2020-09-14   468  		power-domains = <&k3_pds 279 TI_SCI_PD_EXCLUSIVE>;
d361ed88455feae Lokesh Vutla           2020-09-14   469  		clocks = <&k3_clks 279 2>;
d361ed88455feae Lokesh Vutla           2020-09-14   470  		clock-names = "fclk";
dae322f8a7ef11a Andrew Davis           2022-10-20   471  		status = "disabled";
d361ed88455feae Lokesh Vutla           2020-09-14   472  	};
d361ed88455feae Lokesh Vutla           2020-09-14   473  
d361ed88455feae Lokesh Vutla           2020-09-14   474  	main_uart3: serial@2830000 {
d361ed88455feae Lokesh Vutla           2020-09-14   475  		compatible = "ti,j721e-uart", "ti,am654-uart";
d361ed88455feae Lokesh Vutla           2020-09-14   476  		reg = <0x00 0x02830000 0x00 0x100>;
d361ed88455feae Lokesh Vutla           2020-09-14   477  		interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
d361ed88455feae Lokesh Vutla           2020-09-14   478  		clock-frequency = <48000000>;
d361ed88455feae Lokesh Vutla           2020-09-14   479  		current-speed = <115200>;
d361ed88455feae Lokesh Vutla           2020-09-14   480  		power-domains = <&k3_pds 280 TI_SCI_PD_EXCLUSIVE>;
d361ed88455feae Lokesh Vutla           2020-09-14   481  		clocks = <&k3_clks 280 2>;
d361ed88455feae Lokesh Vutla           2020-09-14   482  		clock-names = "fclk";
dae322f8a7ef11a Andrew Davis           2022-10-20   483  		status = "disabled";
d361ed88455feae Lokesh Vutla           2020-09-14   484  	};
d361ed88455feae Lokesh Vutla           2020-09-14   485  
d361ed88455feae Lokesh Vutla           2020-09-14   486  	main_uart4: serial@2840000 {
d361ed88455feae Lokesh Vutla           2020-09-14   487  		compatible = "ti,j721e-uart", "ti,am654-uart";
d361ed88455feae Lokesh Vutla           2020-09-14   488  		reg = <0x00 0x02840000 0x00 0x100>;
d361ed88455feae Lokesh Vutla           2020-09-14   489  		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
d361ed88455feae Lokesh Vutla           2020-09-14   490  		clock-frequency = <48000000>;
d361ed88455feae Lokesh Vutla           2020-09-14   491  		current-speed = <115200>;
d361ed88455feae Lokesh Vutla           2020-09-14   492  		power-domains = <&k3_pds 281 TI_SCI_PD_EXCLUSIVE>;
d361ed88455feae Lokesh Vutla           2020-09-14   493  		clocks = <&k3_clks 281 2>;
d361ed88455feae Lokesh Vutla           2020-09-14   494  		clock-names = "fclk";
dae322f8a7ef11a Andrew Davis           2022-10-20   495  		status = "disabled";
d361ed88455feae Lokesh Vutla           2020-09-14   496  	};
d361ed88455feae Lokesh Vutla           2020-09-14   497  
d361ed88455feae Lokesh Vutla           2020-09-14   498  	main_uart5: serial@2850000 {
d361ed88455feae Lokesh Vutla           2020-09-14   499  		compatible = "ti,j721e-uart", "ti,am654-uart";
d361ed88455feae Lokesh Vutla           2020-09-14   500  		reg = <0x00 0x02850000 0x00 0x100>;
d361ed88455feae Lokesh Vutla           2020-09-14   501  		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
d361ed88455feae Lokesh Vutla           2020-09-14   502  		clock-frequency = <48000000>;
d361ed88455feae Lokesh Vutla           2020-09-14   503  		current-speed = <115200>;
d361ed88455feae Lokesh Vutla           2020-09-14   504  		power-domains = <&k3_pds 282 TI_SCI_PD_EXCLUSIVE>;
d361ed88455feae Lokesh Vutla           2020-09-14   505  		clocks = <&k3_clks 282 2>;
d361ed88455feae Lokesh Vutla           2020-09-14   506  		clock-names = "fclk";
dae322f8a7ef11a Andrew Davis           2022-10-20   507  		status = "disabled";
d361ed88455feae Lokesh Vutla           2020-09-14   508  	};
d361ed88455feae Lokesh Vutla           2020-09-14   509  
d361ed88455feae Lokesh Vutla           2020-09-14   510  	main_uart6: serial@2860000 {
d361ed88455feae Lokesh Vutla           2020-09-14   511  		compatible = "ti,j721e-uart", "ti,am654-uart";
d361ed88455feae Lokesh Vutla           2020-09-14   512  		reg = <0x00 0x02860000 0x00 0x100>;
d361ed88455feae Lokesh Vutla           2020-09-14   513  		interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
d361ed88455feae Lokesh Vutla           2020-09-14   514  		clock-frequency = <48000000>;
d361ed88455feae Lokesh Vutla           2020-09-14   515  		current-speed = <115200>;
d361ed88455feae Lokesh Vutla           2020-09-14   516  		power-domains = <&k3_pds 283 TI_SCI_PD_EXCLUSIVE>;
d361ed88455feae Lokesh Vutla           2020-09-14   517  		clocks = <&k3_clks 283 2>;
d361ed88455feae Lokesh Vutla           2020-09-14   518  		clock-names = "fclk";
dae322f8a7ef11a Andrew Davis           2022-10-20   519  		status = "disabled";
d361ed88455feae Lokesh Vutla           2020-09-14   520  	};
d361ed88455feae Lokesh Vutla           2020-09-14   521  
d361ed88455feae Lokesh Vutla           2020-09-14   522  	main_uart7: serial@2870000 {
d361ed88455feae Lokesh Vutla           2020-09-14   523  		compatible = "ti,j721e-uart", "ti,am654-uart";
d361ed88455feae Lokesh Vutla           2020-09-14   524  		reg = <0x00 0x02870000 0x00 0x100>;
d361ed88455feae Lokesh Vutla           2020-09-14   525  		interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
d361ed88455feae Lokesh Vutla           2020-09-14   526  		clock-frequency = <48000000>;
d361ed88455feae Lokesh Vutla           2020-09-14   527  		current-speed = <115200>;
d361ed88455feae Lokesh Vutla           2020-09-14   528  		power-domains = <&k3_pds 284 TI_SCI_PD_EXCLUSIVE>;
d361ed88455feae Lokesh Vutla           2020-09-14   529  		clocks = <&k3_clks 284 2>;
d361ed88455feae Lokesh Vutla           2020-09-14   530  		clock-names = "fclk";
dae322f8a7ef11a Andrew Davis           2022-10-20   531  		status = "disabled";
d361ed88455feae Lokesh Vutla           2020-09-14   532  	};
d361ed88455feae Lokesh Vutla           2020-09-14   533  
d361ed88455feae Lokesh Vutla           2020-09-14   534  	main_uart8: serial@2880000 {
d361ed88455feae Lokesh Vutla           2020-09-14   535  		compatible = "ti,j721e-uart", "ti,am654-uart";
d361ed88455feae Lokesh Vutla           2020-09-14   536  		reg = <0x00 0x02880000 0x00 0x100>;
d361ed88455feae Lokesh Vutla           2020-09-14   537  		interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
d361ed88455feae Lokesh Vutla           2020-09-14   538  		clock-frequency = <48000000>;
d361ed88455feae Lokesh Vutla           2020-09-14   539  		current-speed = <115200>;
d361ed88455feae Lokesh Vutla           2020-09-14   540  		power-domains = <&k3_pds 285 TI_SCI_PD_EXCLUSIVE>;
d361ed88455feae Lokesh Vutla           2020-09-14   541  		clocks = <&k3_clks 285 2>;
d361ed88455feae Lokesh Vutla           2020-09-14   542  		clock-names = "fclk";
dae322f8a7ef11a Andrew Davis           2022-10-20   543  		status = "disabled";
d361ed88455feae Lokesh Vutla           2020-09-14   544  	};
d361ed88455feae Lokesh Vutla           2020-09-14   545  
d361ed88455feae Lokesh Vutla           2020-09-14   546  	main_uart9: serial@2890000 {
d361ed88455feae Lokesh Vutla           2020-09-14   547  		compatible = "ti,j721e-uart", "ti,am654-uart";
d361ed88455feae Lokesh Vutla           2020-09-14   548  		reg = <0x00 0x02890000 0x00 0x100>;
d361ed88455feae Lokesh Vutla           2020-09-14   549  		interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
d361ed88455feae Lokesh Vutla           2020-09-14   550  		clock-frequency = <48000000>;
d361ed88455feae Lokesh Vutla           2020-09-14   551  		current-speed = <115200>;
d361ed88455feae Lokesh Vutla           2020-09-14   552  		power-domains = <&k3_pds 286 TI_SCI_PD_EXCLUSIVE>;
d361ed88455feae Lokesh Vutla           2020-09-14   553  		clocks = <&k3_clks 286 2>;
d361ed88455feae Lokesh Vutla           2020-09-14   554  		clock-names = "fclk";
dae322f8a7ef11a Andrew Davis           2022-10-20   555  		status = "disabled";
d361ed88455feae Lokesh Vutla           2020-09-14   556  	};
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   557  
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   558  	main_i2c0: i2c@2000000 {
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   559  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   560  		reg = <0x00 0x2000000 0x00 0x100>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   561  		interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   562  		#address-cells = <1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   563  		#size-cells = <0>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   564  		clock-names = "fck";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   565  		clocks = <&k3_clks 187 1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   566  		power-domains = <&k3_pds 187 TI_SCI_PD_SHARED>;
a9ed915cd55c883 Andrew Davis           2022-10-20   567  		status = "disabled";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   568  	};
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   569  
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   570  	main_i2c1: i2c@2010000 {
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   571  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   572  		reg = <0x00 0x2010000 0x00 0x100>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   573  		interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   574  		#address-cells = <1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   575  		#size-cells = <0>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   576  		clock-names = "fck";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   577  		clocks = <&k3_clks 188 1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   578  		power-domains = <&k3_pds 188 TI_SCI_PD_EXCLUSIVE>;
a9ed915cd55c883 Andrew Davis           2022-10-20   579  		status = "disabled";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   580  	};
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   581  
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   582  	main_i2c2: i2c@2020000 {
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   583  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   584  		reg = <0x00 0x2020000 0x00 0x100>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   585  		interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   586  		#address-cells = <1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   587  		#size-cells = <0>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   588  		clock-names = "fck";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   589  		clocks = <&k3_clks 189 1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   590  		power-domains = <&k3_pds 189 TI_SCI_PD_EXCLUSIVE>;
a9ed915cd55c883 Andrew Davis           2022-10-20   591  		status = "disabled";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   592  	};
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   593  
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   594  	main_i2c3: i2c@2030000 {
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   595  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   596  		reg = <0x00 0x2030000 0x00 0x100>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   597  		interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   598  		#address-cells = <1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   599  		#size-cells = <0>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   600  		clock-names = "fck";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   601  		clocks = <&k3_clks 190 1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   602  		power-domains = <&k3_pds 190 TI_SCI_PD_EXCLUSIVE>;
a9ed915cd55c883 Andrew Davis           2022-10-20   603  		status = "disabled";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   604  	};
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   605  
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   606  	main_i2c4: i2c@2040000 {
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   607  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   608  		reg = <0x00 0x2040000 0x00 0x100>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   609  		interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   610  		#address-cells = <1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   611  		#size-cells = <0>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   612  		clock-names = "fck";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   613  		clocks = <&k3_clks 191 1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   614  		power-domains = <&k3_pds 191 TI_SCI_PD_EXCLUSIVE>;
a9ed915cd55c883 Andrew Davis           2022-10-20   615  		status = "disabled";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   616  	};
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   617  
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   618  	main_i2c5: i2c@2050000 {
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   619  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   620  		reg = <0x00 0x2050000 0x00 0x100>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   621  		interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   622  		#address-cells = <1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   623  		#size-cells = <0>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   624  		clock-names = "fck";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   625  		clocks = <&k3_clks 192 1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   626  		power-domains = <&k3_pds 192 TI_SCI_PD_EXCLUSIVE>;
a9ed915cd55c883 Andrew Davis           2022-10-20   627  		status = "disabled";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   628  	};
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   629  
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   630  	main_i2c6: i2c@2060000 {
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   631  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   632  		reg = <0x00 0x2060000 0x00 0x100>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   633  		interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   634  		#address-cells = <1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   635  		#size-cells = <0>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   636  		clock-names = "fck";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   637  		clocks = <&k3_clks 193 1>;
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   638  		power-domains = <&k3_pds 193 TI_SCI_PD_EXCLUSIVE>;
a9ed915cd55c883 Andrew Davis           2022-10-20   639  		status = "disabled";
03bfeb528772d25 Vignesh Raghavendra    2020-09-23   640  	};
7cd03dc78b29040 Faiz Abbas             2020-09-24   641  
7cd03dc78b29040 Faiz Abbas             2020-09-24   642  	main_sdhci0: mmc@4f80000 {
7cd03dc78b29040 Faiz Abbas             2020-09-24   643  		compatible = "ti,j7200-sdhci-8bit", "ti,j721e-sdhci-8bit";
7cd03dc78b29040 Faiz Abbas             2020-09-24   644  		reg = <0x00 0x04f80000 0x00 0x260>, <0x00 0x4f88000 0x00 0x134>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   645  		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   646  		power-domains = <&k3_pds 91 TI_SCI_PD_EXCLUSIVE>;
0cf73209ce2c60c Grygorii Strashko      2021-01-15   647  		clock-names = "clk_ahb", "clk_xin";
0cf73209ce2c60c Grygorii Strashko      2021-01-15   648  		clocks = <&k3_clks 91 0>, <&k3_clks 91 3>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   649  		ti,otap-del-sel-legacy = <0x0>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   650  		ti,otap-del-sel-mmc-hs = <0x0>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   651  		ti,otap-del-sel-ddr52 = <0x6>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   652  		ti,otap-del-sel-hs200 = <0x8>;
9437499086c24ab Aswath Govindraju      2021-03-26   653  		ti,otap-del-sel-hs400 = <0x5>;
9437499086c24ab Aswath Govindraju      2021-03-26   654  		ti,itap-del-sel-legacy = <0x10>;
9437499086c24ab Aswath Govindraju      2021-03-26   655  		ti,itap-del-sel-mmc-hs = <0xa>;
629b4880ebf59ad Bhavya Kapoor          2023-12-01   656  		ti,itap-del-sel-ddr52 = <0x3>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   657  		ti,strobe-sel = <0x77>;
9437499086c24ab Aswath Govindraju      2021-03-26   658  		ti,clkbuf-sel = <0x7>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   659  		ti,trm-icp = <0x8>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   660  		bus-width = <8>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   661  		mmc-ddr-1_8v;
9437499086c24ab Aswath Govindraju      2021-03-26   662  		mmc-hs200-1_8v;
9437499086c24ab Aswath Govindraju      2021-03-26   663  		mmc-hs400-1_8v;
7cd03dc78b29040 Faiz Abbas             2020-09-24   664  		dma-coherent;
013b7dd32c75ad3 Andrew Davis           2023-08-09   665  		status = "disabled";
7cd03dc78b29040 Faiz Abbas             2020-09-24   666  	};
7cd03dc78b29040 Faiz Abbas             2020-09-24   667  
7cd03dc78b29040 Faiz Abbas             2020-09-24   668  	main_sdhci1: mmc@4fb0000 {
7cd03dc78b29040 Faiz Abbas             2020-09-24   669  		compatible = "ti,j7200-sdhci-4bit", "ti,j721e-sdhci-4bit";
7cd03dc78b29040 Faiz Abbas             2020-09-24   670  		reg = <0x00 0x04fb0000 0x00 0x260>, <0x00 0x4fb8000 0x00 0x134>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   671  		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   672  		power-domains = <&k3_pds 92 TI_SCI_PD_EXCLUSIVE>;
0cf73209ce2c60c Grygorii Strashko      2021-01-15   673  		clock-names = "clk_ahb", "clk_xin";
0cf73209ce2c60c Grygorii Strashko      2021-01-15   674  		clocks = <&k3_clks 92 1>, <&k3_clks 92 2>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   675  		ti,otap-del-sel-legacy = <0x0>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   676  		ti,otap-del-sel-sd-hs = <0x0>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   677  		ti,otap-del-sel-sdr12 = <0xf>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   678  		ti,otap-del-sel-sdr25 = <0xf>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   679  		ti,otap-del-sel-sdr50 = <0xc>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   680  		ti,otap-del-sel-sdr104 = <0x5>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   681  		ti,otap-del-sel-ddr50 = <0xc>;
9437499086c24ab Aswath Govindraju      2021-03-26   682  		ti,itap-del-sel-legacy = <0x0>;
9437499086c24ab Aswath Govindraju      2021-03-26   683  		ti,itap-del-sel-sd-hs = <0x0>;
9437499086c24ab Aswath Govindraju      2021-03-26   684  		ti,itap-del-sel-sdr12 = <0x0>;
9437499086c24ab Aswath Govindraju      2021-03-26   685  		ti,itap-del-sel-sdr25 = <0x0>;
9437499086c24ab Aswath Govindraju      2021-03-26   686  		ti,clkbuf-sel = <0x7>;
9437499086c24ab Aswath Govindraju      2021-03-26   687  		ti,trm-icp = <0x8>;
7cd03dc78b29040 Faiz Abbas             2020-09-24   688  		dma-coherent;
013b7dd32c75ad3 Andrew Davis           2023-08-09   689  		status = "disabled";
7cd03dc78b29040 Faiz Abbas             2020-09-24   690  	};
6197d7139d128d3 Roger Quadros          2020-09-30   691  
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   692  	serdes_wiz0: wiz@5060000 {
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   693  		compatible = "ti,j721e-wiz-10g";
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   694  		#address-cells = <1>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   695  		#size-cells = <1>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   696  		power-domains = <&k3_pds 292 TI_SCI_PD_EXCLUSIVE>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   697  		clocks = <&k3_clks 292 11>, <&k3_clks 292 85>, <&serdes_refclk>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   698  		clock-names = "fck", "core_ref_clk", "ext_ref_clk";
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   699  		num-lanes = <4>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   700  		#reset-cells = <1>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   701  		ranges = <0x5060000 0x0 0x5060000 0x10000>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   702  
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   703  		assigned-clocks = <&k3_clks 292 85>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   704  		assigned-clock-parents = <&k3_clks 292 89>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   705  
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   706  		wiz0_pll0_refclk: pll0-refclk {
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   707  			clocks = <&k3_clks 292 85>, <&serdes_refclk>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   708  			clock-output-names = "wiz0_pll0_refclk";
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   709  			#clock-cells = <0>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   710  			assigned-clocks = <&wiz0_pll0_refclk>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   711  			assigned-clock-parents = <&k3_clks 292 85>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   712  		};
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   713  
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   714  		wiz0_pll1_refclk: pll1-refclk {
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   715  			clocks = <&k3_clks 292 85>, <&serdes_refclk>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   716  			clock-output-names = "wiz0_pll1_refclk";
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   717  			#clock-cells = <0>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   718  			assigned-clocks = <&wiz0_pll1_refclk>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   719  			assigned-clock-parents = <&k3_clks 292 85>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   720  		};
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   721  
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   722  		wiz0_refclk_dig: refclk-dig {
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   723  			clocks = <&k3_clks 292 85>, <&serdes_refclk>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   724  			clock-output-names = "wiz0_refclk_dig";
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   725  			#clock-cells = <0>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   726  			assigned-clocks = <&wiz0_refclk_dig>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   727  			assigned-clock-parents = <&k3_clks 292 85>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   728  		};
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   729  
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   730  		wiz0_cmn_refclk_dig_div: cmn-refclk-dig-div {
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   731  			clocks = <&wiz0_refclk_dig>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   732  			#clock-cells = <0>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   733  		};
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   734  
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   735  		serdes0: serdes@5060000 {
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   736  			compatible = "ti,j721e-serdes-10g";
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   737  			reg = <0x05060000 0x00010000>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   738  			reg-names = "torrent_phy";
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   739  			resets = <&serdes_wiz0 0>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   740  			reset-names = "torrent_reset";
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   741  			clocks = <&wiz0_pll0_refclk>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   742  			clock-names = "refclk";
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   743  			#address-cells = <1>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   744  			#size-cells = <0>;
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   745  		};
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   746  	};
4c1b22a953d9f8a Kishon Vijay Abraham I 2021-01-05   747  
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   748  	pcie1_rc: pcie@2910000 {
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   749  		compatible = "ti,j7200-pcie-host", "ti,j721e-pcie-host";
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   750  		reg = <0x00 0x02910000 0x00 0x1000>,
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   751  		      <0x00 0x02917000 0x00 0x400>,
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   752  		      <0x00 0x0d800000 0x00 0x00800000>,
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   753  		      <0x00 0x18000000 0x00 0x00001000>;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   754  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   755  		interrupt-names = "link_state";
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   756  		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   757  		device_type = "pci";
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   758  		ti,syscon-pcie-ctrl = <&scm_conf 0x4074>;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   759  		max-link-speed = <3>;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   760  		num-lanes = <4>;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   761  		power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   762  		clocks = <&k3_clks 240 6>;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   763  		clock-names = "fck";
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   764  		#address-cells = <3>;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   765  		#size-cells = <2>;
8bb8429290c0043 Kishon Vijay Abraham I 2021-09-15   766  		bus-range = <0x0 0xff>;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   767  		cdns,no-bar-match-nbits = <64>;
0d553792726a61c Kishon Vijay Abraham I 2021-09-15   768  		vendor-id = <0x104c>;
0d553792726a61c Kishon Vijay Abraham I 2021-09-15   769  		device-id = <0xb00f>;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   770  		msi-map = <0x0 &gic_its 0x0 0x10000>;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   771  		dma-coherent;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   772  		ranges = <0x01000000 0x0 0x18001000  0x00 0x18001000  0x0 0x0010000>,
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   773  			 <0x02000000 0x0 0x18011000  0x00 0x18011000  0x0 0x7fef000>;
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   774  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
8ba0a7a6180383c Andrew Davis           2024-01-24   775  		status = "disabled";
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   776  	};
3276d9f53cf660f Kishon Vijay Abraham I 2021-01-05   777  
6197d7139d128d3 Roger Quadros          2020-09-30   778  	usbss0: cdns-usb@4104000 {
6197d7139d128d3 Roger Quadros          2020-09-30   779  		compatible = "ti,j721e-usb";
6197d7139d128d3 Roger Quadros          2020-09-30   780  		reg = <0x00 0x4104000 0x00 0x100>;
6197d7139d128d3 Roger Quadros          2020-09-30   781  		dma-coherent;
6197d7139d128d3 Roger Quadros          2020-09-30   782  		power-domains = <&k3_pds 288 TI_SCI_PD_EXCLUSIVE>;
6197d7139d128d3 Roger Quadros          2020-09-30   783  		clocks = <&k3_clks 288 12>, <&k3_clks 288 3>;
6197d7139d128d3 Roger Quadros          2020-09-30   784  		clock-names = "ref", "lpm";
6197d7139d128d3 Roger Quadros          2020-09-30   785  		assigned-clocks = <&k3_clks 288 12>;	/* USB2_REFCLK */
6197d7139d128d3 Roger Quadros          2020-09-30   786  		assigned-clock-parents = <&k3_clks 288 13>; /* HFOSC0 */
6197d7139d128d3 Roger Quadros          2020-09-30   787  		#address-cells = <2>;
6197d7139d128d3 Roger Quadros          2020-09-30   788  		#size-cells = <2>;
6197d7139d128d3 Roger Quadros          2020-09-30   789  		ranges;
6197d7139d128d3 Roger Quadros          2020-09-30   790  
6197d7139d128d3 Roger Quadros          2020-09-30   791  		usb0: usb@6000000 {
6197d7139d128d3 Roger Quadros          2020-09-30   792  			compatible = "cdns,usb3";
6197d7139d128d3 Roger Quadros          2020-09-30   793  			reg = <0x00 0x6000000 0x00 0x10000>,
6197d7139d128d3 Roger Quadros          2020-09-30   794  			      <0x00 0x6010000 0x00 0x10000>,
6197d7139d128d3 Roger Quadros          2020-09-30   795  			      <0x00 0x6020000 0x00 0x10000>;
6197d7139d128d3 Roger Quadros          2020-09-30   796  			reg-names = "otg", "xhci", "dev";
6197d7139d128d3 Roger Quadros          2020-09-30   797  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,	/* irq.0 */
6197d7139d128d3 Roger Quadros          2020-09-30   798  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,	/* irq.6 */
6197d7139d128d3 Roger Quadros          2020-09-30   799  				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;	/* otgirq.0 */
6197d7139d128d3 Roger Quadros          2020-09-30   800  			interrupt-names = "host",
6197d7139d128d3 Roger Quadros          2020-09-30   801  					  "peripheral",
6197d7139d128d3 Roger Quadros          2020-09-30   802  					  "otg";
6197d7139d128d3 Roger Quadros          2020-09-30   803  			maximum-speed = "super-speed";
6197d7139d128d3 Roger Quadros          2020-09-30   804  			dr_mode = "otg";
a2894d85f44ba3f Roger Quadros          2021-05-12   805  			cdns,phyrst-a-enable;
6197d7139d128d3 Roger Quadros          2020-09-30   806  		};
6197d7139d128d3 Roger Quadros          2020-09-30   807  	};
eb6f3655d3ed4ee Suman Anna             2021-01-11   808  
e0b2e6af39ea94a Faiz Abbas             2021-03-26   809  	main_gpio0: gpio@600000 {
e0b2e6af39ea94a Faiz Abbas             2021-03-26   810  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
e0b2e6af39ea94a Faiz Abbas             2021-03-26   811  		reg = <0x00 0x00600000 0x00 0x100>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   812  		gpio-controller;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   813  		#gpio-cells = <2>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   814  		interrupt-parent = <&main_gpio_intr>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   815  		interrupts = <145>, <146>, <147>, <148>,
e0b2e6af39ea94a Faiz Abbas             2021-03-26   816  			     <149>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   817  		interrupt-controller;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   818  		#interrupt-cells = <2>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   819  		ti,ngpio = <69>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   820  		ti,davinci-gpio-unbanked = <0>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   821  		power-domains = <&k3_pds 105 TI_SCI_PD_EXCLUSIVE>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   822  		clocks = <&k3_clks 105 0>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   823  		clock-names = "gpio";
d9fe476d39f6271 Andrew Davis           2023-08-09   824  		status = "disabled";
e0b2e6af39ea94a Faiz Abbas             2021-03-26   825  	};
e0b2e6af39ea94a Faiz Abbas             2021-03-26   826  
e0b2e6af39ea94a Faiz Abbas             2021-03-26   827  	main_gpio2: gpio@610000 {
e0b2e6af39ea94a Faiz Abbas             2021-03-26   828  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
e0b2e6af39ea94a Faiz Abbas             2021-03-26   829  		reg = <0x00 0x00610000 0x00 0x100>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   830  		gpio-controller;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   831  		#gpio-cells = <2>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   832  		interrupt-parent = <&main_gpio_intr>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   833  		interrupts = <154>, <155>, <156>, <157>,
e0b2e6af39ea94a Faiz Abbas             2021-03-26   834  			     <158>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   835  		interrupt-controller;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   836  		#interrupt-cells = <2>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   837  		ti,ngpio = <69>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   838  		ti,davinci-gpio-unbanked = <0>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   839  		power-domains = <&k3_pds 107 TI_SCI_PD_EXCLUSIVE>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   840  		clocks = <&k3_clks 107 0>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   841  		clock-names = "gpio";
d9fe476d39f6271 Andrew Davis           2023-08-09   842  		status = "disabled";
e0b2e6af39ea94a Faiz Abbas             2021-03-26   843  	};
e0b2e6af39ea94a Faiz Abbas             2021-03-26   844  
e0b2e6af39ea94a Faiz Abbas             2021-03-26   845  	main_gpio4: gpio@620000 {
e0b2e6af39ea94a Faiz Abbas             2021-03-26   846  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
e0b2e6af39ea94a Faiz Abbas             2021-03-26   847  		reg = <0x00 0x00620000 0x00 0x100>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   848  		gpio-controller;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   849  		#gpio-cells = <2>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   850  		interrupt-parent = <&main_gpio_intr>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   851  		interrupts = <163>, <164>, <165>, <166>,
e0b2e6af39ea94a Faiz Abbas             2021-03-26   852  			     <167>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   853  		interrupt-controller;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   854  		#interrupt-cells = <2>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   855  		ti,ngpio = <69>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   856  		ti,davinci-gpio-unbanked = <0>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   857  		power-domains = <&k3_pds 109 TI_SCI_PD_EXCLUSIVE>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   858  		clocks = <&k3_clks 109 0>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   859  		clock-names = "gpio";
d9fe476d39f6271 Andrew Davis           2023-08-09   860  		status = "disabled";
e0b2e6af39ea94a Faiz Abbas             2021-03-26   861  	};
e0b2e6af39ea94a Faiz Abbas             2021-03-26   862  
e0b2e6af39ea94a Faiz Abbas             2021-03-26   863  	main_gpio6: gpio@630000 {
e0b2e6af39ea94a Faiz Abbas             2021-03-26   864  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
e0b2e6af39ea94a Faiz Abbas             2021-03-26   865  		reg = <0x00 0x00630000 0x00 0x100>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   866  		gpio-controller;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   867  		#gpio-cells = <2>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   868  		interrupt-parent = <&main_gpio_intr>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   869  		interrupts = <172>, <173>, <174>, <175>,
e0b2e6af39ea94a Faiz Abbas             2021-03-26   870  			     <176>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   871  		interrupt-controller;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   872  		#interrupt-cells = <2>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   873  		ti,ngpio = <69>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   874  		ti,davinci-gpio-unbanked = <0>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   875  		power-domains = <&k3_pds 111 TI_SCI_PD_EXCLUSIVE>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   876  		clocks = <&k3_clks 111 0>;
e0b2e6af39ea94a Faiz Abbas             2021-03-26   877  		clock-names = "gpio";
d9fe476d39f6271 Andrew Davis           2023-08-09   878  		status = "disabled";
e0b2e6af39ea94a Faiz Abbas             2021-03-26   879  	};
e0b2e6af39ea94a Faiz Abbas             2021-03-26   880  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   881  	main_mcan0: can@2701000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   882  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   883  		reg = <0x00 0x02701000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   884  		      <0x00 0x02708000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   885  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   886  		power-domains = <&k3_pds 156 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   887  		clocks = <&k3_clks 156 0>, <&k3_clks 156 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   888  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   889  		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   890  			     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   891  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   892  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   893  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   894  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   895  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   896  	main_mcan1: can@2711000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   897  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   898  		reg = <0x00 0x02711000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   899  		      <0x00 0x02718000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   900  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   901  		power-domains = <&k3_pds 158 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   902  		clocks = <&k3_clks 158 0>, <&k3_clks 158 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   903  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   904  		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   905  			     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   906  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   907  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   908  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   909  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   910  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   911  	main_mcan2: can@2721000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   912  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   913  		reg = <0x00 0x02721000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   914  		      <0x00 0x02728000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   915  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   916  		power-domains = <&k3_pds 160 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   917  		clocks = <&k3_clks 160 0>, <&k3_clks 160 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   918  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   919  		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   920  			     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   921  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   922  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   923  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   924  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   925  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   926  	main_mcan3: can@2731000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   927  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   928  		reg = <0x00 0x02731000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   929  		      <0x00 0x02738000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   930  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   931  		power-domains = <&k3_pds 161 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   932  		clocks = <&k3_clks 161 0>, <&k3_clks 161 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   933  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   934  		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   935  			     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   936  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   937  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   938  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   939  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   940  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   941  	main_mcan4: can@2741000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   942  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   943  		reg = <0x00 0x02741000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   944  		      <0x00 0x02748000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   945  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   946  		power-domains = <&k3_pds 162 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   947  		clocks = <&k3_clks 162 0>, <&k3_clks 162 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   948  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   949  		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   950  			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   951  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   952  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   953  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   954  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   955  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   956  	main_mcan5: can@2751000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   957  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   958  		reg = <0x00 0x02751000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   959  		      <0x00 0x02758000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   960  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   961  		power-domains = <&k3_pds 163 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   962  		clocks = <&k3_clks 163 0>, <&k3_clks 163 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   963  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   964  		interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   965  			     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   966  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   967  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   968  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   969  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   970  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   971  	main_mcan6: can@2761000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   972  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   973  		reg = <0x00 0x02761000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   974  		      <0x00 0x02768000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   975  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   976  		power-domains = <&k3_pds 164 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   977  		clocks = <&k3_clks 164 0>, <&k3_clks 164 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   978  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   979  		interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   980  			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   981  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   982  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   983  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   984  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   985  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   986  	main_mcan7: can@2771000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   987  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   988  		reg = <0x00 0x02771000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   989  		      <0x00 0x02778000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   990  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   991  		power-domains = <&k3_pds 165 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   992  		clocks = <&k3_clks 165 0>, <&k3_clks 165 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   993  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   994  		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   995  			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   996  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   997  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   998  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15   999  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1000  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1001  	main_mcan8: can@2781000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1002  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1003  		reg = <0x00 0x02781000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1004  		      <0x00 0x02788000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1005  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1006  		power-domains = <&k3_pds 166 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1007  		clocks = <&k3_clks 166 0>, <&k3_clks 166 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1008  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1009  		interrupts = <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1010  			     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1011  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1012  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1013  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1014  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1015  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1016  	main_mcan9: can@2791000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1017  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1018  		reg = <0x00 0x02791000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1019  		      <0x00 0x02798000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1020  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1021  		power-domains = <&k3_pds 167 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1022  		clocks = <&k3_clks 167 0>, <&k3_clks 167 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1023  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1024  		interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1025  			     <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1026  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1027  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1028  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1029  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1030  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1031  	main_mcan10: can@27a1000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1032  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1033  		reg = <0x00 0x027a1000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1034  		      <0x00 0x027a8000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1035  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1036  		power-domains = <&k3_pds 168 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1037  		clocks = <&k3_clks 168 0>, <&k3_clks 168 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1038  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1039  		interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1040  			     <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1041  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1042  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1043  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1044  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1045  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1046  	main_mcan11: can@27b1000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1047  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1048  		reg = <0x00 0x027b1000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1049  		      <0x00 0x027b8000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1050  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1051  		power-domains = <&k3_pds 169 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1052  		clocks = <&k3_clks 169 0>, <&k3_clks 169 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1053  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1054  		interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1055  			     <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1056  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1057  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1058  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1059  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1060  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1061  	main_mcan12: can@27c1000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1062  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1063  		reg = <0x00 0x027c1000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1064  		      <0x00 0x027c8000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1065  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1066  		power-domains = <&k3_pds 170 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1067  		clocks = <&k3_clks 170 0>, <&k3_clks 170 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1068  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1069  		interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1070  			     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1071  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1072  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1073  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1074  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1075  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1076  	main_mcan13: can@27d1000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1077  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1078  		reg = <0x00 0x027d1000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1079  		      <0x00 0x027d8000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1080  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1081  		power-domains = <&k3_pds 171 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1082  		clocks = <&k3_clks 171 0>, <&k3_clks 171 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1083  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1084  		interrupts = <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1085  			     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1086  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1087  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1088  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1089  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1090  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1091  	main_mcan14: can@2681000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1092  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1093  		reg = <0x00 0x02681000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1094  		      <0x00 0x02688000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1095  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1096  		power-domains = <&k3_pds 150 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1097  		clocks = <&k3_clks 150 0>, <&k3_clks 150 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1098  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1099  		interrupts = <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1100  			     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1101  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1102  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1103  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1104  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1105  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1106  	main_mcan15: can@2691000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1107  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1108  		reg = <0x00 0x02691000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1109  		      <0x00 0x02698000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1110  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1111  		power-domains = <&k3_pds 151 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1112  		clocks = <&k3_clks 151 0>, <&k3_clks 151 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1113  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1114  		interrupts = <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1115  			     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1116  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1117  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1118  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1119  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1120  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1121  	main_mcan16: can@26a1000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1122  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1123  		reg = <0x00 0x026a1000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1124  		      <0x00 0x026a8000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1125  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1126  		power-domains = <&k3_pds 152 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1127  		clocks = <&k3_clks 152 0>, <&k3_clks 152 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1128  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1129  		interrupts = <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1130  			     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1131  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1132  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1133  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1134  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1135  
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1136  	main_mcan17: can@26b1000 {
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1137  		compatible = "bosch,m_can";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1138  		reg = <0x00 0x026b1000 0x00 0x200>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1139  		      <0x00 0x026b8000 0x00 0x8000>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1140  		reg-names = "m_can", "message_ram";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1141  		power-domains = <&k3_pds 153 TI_SCI_PD_EXCLUSIVE>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1142  		clocks = <&k3_clks 153 0>, <&k3_clks 153 2>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1143  		clock-names = "hclk", "cclk";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1144  		interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>,
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1145  			     <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1146  		interrupt-names = "int0", "int1";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1147  		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1148  		status = "disabled";
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1149  	};
7eb44b9d7a5b230 Bhavya Kapoor          2024-05-15  1150  
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1151  	main_spi0: spi@2100000 {
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1152  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1153  		reg = <0x00 0x02100000 0x00 0x400>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1154  		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1155  		#address-cells = <1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1156  		#size-cells = <0>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1157  		power-domains = <&k3_pds 266 TI_SCI_PD_EXCLUSIVE>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1158  		clocks = <&k3_clks 266 1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1159  		status = "disabled";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1160  	};
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1161  
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1162  	main_spi1: spi@2110000 {
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1163  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1164  		reg = <0x00 0x02110000 0x00 0x400>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1165  		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1166  		#address-cells = <1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1167  		#size-cells = <0>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1168  		power-domains = <&k3_pds 267 TI_SCI_PD_EXCLUSIVE>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1169  		clocks = <&k3_clks 267 1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1170  		status = "disabled";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1171  	};
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1172  
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1173  	main_spi2: spi@2120000 {
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1174  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1175  		reg = <0x00 0x02120000 0x00 0x400>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1176  		interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1177  		#address-cells = <1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1178  		#size-cells = <0>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1179  		power-domains = <&k3_pds 268 TI_SCI_PD_EXCLUSIVE>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1180  		clocks = <&k3_clks 268 1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1181  		status = "disabled";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1182  	};
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1183  
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1184  	main_spi3: spi@2130000 {
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1185  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1186  		reg = <0x00 0x02130000 0x00 0x400>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1187  		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1188  		#address-cells = <1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1189  		#size-cells = <0>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1190  		power-domains = <&k3_pds 269 TI_SCI_PD_EXCLUSIVE>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1191  		clocks = <&k3_clks 269 1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1192  		status = "disabled";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1193  	};
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1194  
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1195  	main_spi4: spi@2140000 {
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1196  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1197  		reg = <0x00 0x02140000 0x00 0x400>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1198  		interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1199  		#address-cells = <1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1200  		#size-cells = <0>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1201  		power-domains = <&k3_pds 270 TI_SCI_PD_EXCLUSIVE>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1202  		clocks = <&k3_clks 270 1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1203  		status = "disabled";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1204  	};
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1205  
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1206  	main_spi5: spi@2150000 {
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1207  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1208  		reg = <0x00 0x02150000 0x00 0x400>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1209  		interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1210  		#address-cells = <1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1211  		#size-cells = <0>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1212  		power-domains = <&k3_pds 271 TI_SCI_PD_EXCLUSIVE>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1213  		clocks = <&k3_clks 271 1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1214  		status = "disabled";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1215  	};
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1216  
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1217  	main_spi6: spi@2160000 {
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1218  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1219  		reg = <0x00 0x02160000 0x00 0x400>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1220  		interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1221  		#address-cells = <1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1222  		#size-cells = <0>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1223  		power-domains = <&k3_pds 272 TI_SCI_PD_EXCLUSIVE>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1224  		clocks = <&k3_clks 272 1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1225  		status = "disabled";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1226  	};
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1227  
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1228  	main_spi7: spi@2170000 {
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1229  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1230  		reg = <0x00 0x02170000 0x00 0x400>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1231  		interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1232  		#address-cells = <1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1233  		#size-cells = <0>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1234  		power-domains = <&k3_pds 273 TI_SCI_PD_EXCLUSIVE>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1235  		clocks = <&k3_clks 273 1>;
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1236  		status = "disabled";
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1237  	};
8f6c475f4ca7a82 Vaishnav Achath        2023-03-21  1238  
6038f1171162faa Gowtham Tammana        2022-08-22  1239  	watchdog0: watchdog@2200000 {
6038f1171162faa Gowtham Tammana        2022-08-22  1240  		compatible = "ti,j7-rti-wdt";
6038f1171162faa Gowtham Tammana        2022-08-22  1241  		reg = <0x0 0x2200000 0x0 0x100>;
6038f1171162faa Gowtham Tammana        2022-08-22  1242  		clocks = <&k3_clks 252 1>;
6038f1171162faa Gowtham Tammana        2022-08-22  1243  		power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;
6038f1171162faa Gowtham Tammana        2022-08-22  1244  		assigned-clocks = <&k3_clks 252 1>;
6038f1171162faa Gowtham Tammana        2022-08-22  1245  		assigned-clock-parents = <&k3_clks 252 5>;
6038f1171162faa Gowtham Tammana        2022-08-22  1246  	};
6038f1171162faa Gowtham Tammana        2022-08-22  1247  
6038f1171162faa Gowtham Tammana        2022-08-22  1248  	watchdog1: watchdog@2210000 {
6038f1171162faa Gowtham Tammana        2022-08-22  1249  		compatible = "ti,j7-rti-wdt";
6038f1171162faa Gowtham Tammana        2022-08-22  1250  		reg = <0x0 0x2210000 0x0 0x100>;
6038f1171162faa Gowtham Tammana        2022-08-22  1251  		clocks = <&k3_clks 253 1>;
6038f1171162faa Gowtham Tammana        2022-08-22  1252  		power-domains = <&k3_pds 253 TI_SCI_PD_EXCLUSIVE>;
6038f1171162faa Gowtham Tammana        2022-08-22  1253  		assigned-clocks = <&k3_clks 253 1>;
6038f1171162faa Gowtham Tammana        2022-08-22  1254  		assigned-clock-parents = <&k3_clks 253 5>;
6038f1171162faa Gowtham Tammana        2022-08-22  1255  	};
6038f1171162faa Gowtham Tammana        2022-08-22  1256  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1257  	main_timer0: timer@2400000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1258  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1259  		reg = <0x00 0x2400000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1260  		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1261  		clocks = <&k3_clks 49 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1262  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1263  		assigned-clocks = <&k3_clks 49 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1264  		assigned-clock-parents = <&k3_clks 49 2>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1265  		power-domains = <&k3_pds 49 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1266  		ti,timer-pwm;
448809ccdc05780 Beleswar Padhi         2024-06-10  1267  		status = "reserved";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1268  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1269  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1270  	main_timer1: timer@2410000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1271  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1272  		reg = <0x00 0x2410000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1273  		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1274  		clocks = <&k3_clks 50 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1275  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1276  		assigned-clocks = <&k3_clks 50 1>, <&k3_clks 313 0>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1277  		assigned-clock-parents = <&k3_clks 50 2>, <&k3_clks 313 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1278  		power-domains = <&k3_pds 50 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1279  		ti,timer-pwm;
448809ccdc05780 Beleswar Padhi         2024-06-10  1280  		status = "reserved";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1281  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1282  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1283  	main_timer2: timer@2420000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1284  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1285  		reg = <0x00 0x2420000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1286  		interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1287  		clocks = <&k3_clks 51 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1288  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1289  		assigned-clocks = <&k3_clks 51 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1290  		assigned-clock-parents = <&k3_clks 51 2>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1291  		power-domains = <&k3_pds 49 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1292  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1293  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1294  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1295  	main_timer3: timer@2430000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1296  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1297  		reg = <0x00 0x2430000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1298  		interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1299  		clocks = <&k3_clks 52 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1300  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1301  		assigned-clocks = <&k3_clks 52 1>, <&k3_clks 314 0>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1302  		assigned-clock-parents = <&k3_clks 52 2>, <&k3_clks 314 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1303  		power-domains = <&k3_pds 52 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1304  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1305  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1306  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1307  	main_timer4: timer@2440000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1308  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1309  		reg = <0x00 0x2440000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1310  		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1311  		clocks = <&k3_clks 53 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1312  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1313  		assigned-clocks = <&k3_clks 53 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1314  		assigned-clock-parents = <&k3_clks 53 2>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1315  		power-domains = <&k3_pds 53 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1316  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1317  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1318  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1319  	main_timer5: timer@2450000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1320  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1321  		reg = <0x00 0x2450000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1322  		interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1323  		clocks = <&k3_clks 54 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1324  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1325  		assigned-clocks = <&k3_clks 54 1>, <&k3_clks 315 0>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1326  		assigned-clock-parents = <&k3_clks 54 2>, <&k3_clks 315 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1327  		power-domains = <&k3_pds 54 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1328  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1329  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1330  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1331  	main_timer6: timer@2460000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1332  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1333  		reg = <0x00 0x2460000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1334  		interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1335  		clocks = <&k3_clks 55 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1336  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1337  		assigned-clocks = <&k3_clks 55 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1338  		assigned-clock-parents = <&k3_clks 55 2>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1339  		power-domains = <&k3_pds 55 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1340  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1341  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1342  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1343  	main_timer7: timer@2470000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1344  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1345  		reg = <0x00 0x2470000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1346  		interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1347  		clocks = <&k3_clks 57 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1348  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1349  		assigned-clocks = <&k3_clks 57 1>, <&k3_clks 316 0>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1350  		assigned-clock-parents = <&k3_clks 57 2>, <&k3_clks 316 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1351  		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1352  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1353  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1354  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1355  	main_timer8: timer@2480000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1356  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1357  		reg = <0x00 0x2480000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1358  		interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1359  		clocks = <&k3_clks 58 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1360  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1361  		assigned-clocks = <&k3_clks 58 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1362  		assigned-clock-parents = <&k3_clks 58 2>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1363  		power-domains = <&k3_pds 58 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1364  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1365  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1366  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1367  	main_timer9: timer@2490000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1368  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1369  		reg = <0x00 0x2490000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1370  		interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1371  		clocks = <&k3_clks 59 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1372  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1373  		assigned-clocks = <&k3_clks 59 1>, <&k3_clks 317 0>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1374  		assigned-clock-parents = <&k3_clks 59 2>, <&k3_clks 317 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1375  		power-domains = <&k3_pds 59 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1376  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1377  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1378  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1379  	main_timer10: timer@24a0000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1380  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1381  		reg = <0x00 0x24a0000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1382  		interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1383  		clocks = <&k3_clks 60 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1384  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1385  		assigned-clocks = <&k3_clks 60 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1386  		assigned-clock-parents = <&k3_clks 60 2>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1387  		power-domains = <&k3_pds 60 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1388  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1389  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1390  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1391  	main_timer11: timer@24b0000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1392  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1393  		reg = <0x00 0x24b0000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1394  		interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1395  		clocks = <&k3_clks 62 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1396  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1397  		assigned-clocks = <&k3_clks 62 1>, <&k3_clks 318 0>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1398  		assigned-clock-parents = <&k3_clks 62 2>, <&k3_clks 318 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1399  		power-domains = <&k3_pds 62 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1400  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1401  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1402  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1403  	main_timer12: timer@24c0000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1404  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1405  		reg = <0x00 0x24c0000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1406  		interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1407  		clocks = <&k3_clks 63 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1408  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1409  		assigned-clocks = <&k3_clks 63 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1410  		assigned-clock-parents = <&k3_clks 63 2>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1411  		power-domains = <&k3_pds 63 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1412  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1413  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1414  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1415  	main_timer13: timer@24d0000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1416  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1417  		reg = <0x00 0x24d0000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1418  		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1419  		clocks = <&k3_clks 64 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1420  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1421  		assigned-clocks = <&k3_clks 64 1>, <&k3_clks 319 0>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1422  		assigned-clock-parents = <&k3_clks 64 2>, <&k3_clks 319 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1423  		power-domains = <&k3_pds 64 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1424  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1425  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1426  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1427  	main_timer14: timer@24e0000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1428  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1429  		reg = <0x00 0x24e0000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1430  		interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1431  		clocks = <&k3_clks 65 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1432  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1433  		assigned-clocks = <&k3_clks 65 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1434  		assigned-clock-parents = <&k3_clks 65 2>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1435  		power-domains = <&k3_pds 65 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1436  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1437  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1438  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1439  	main_timer15: timer@24f0000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1440  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1441  		reg = <0x00 0x24f0000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1442  		interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1443  		clocks = <&k3_clks 66 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1444  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1445  		assigned-clocks = <&k3_clks 66 1>, <&k3_clks 320 0>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1446  		assigned-clock-parents = <&k3_clks 66 2>, <&k3_clks 320 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1447  		power-domains = <&k3_pds 66 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1448  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1449  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1450  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1451  	main_timer16: timer@2500000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1452  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1453  		reg = <0x00 0x2500000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1454  		interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1455  		clocks = <&k3_clks 67 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1456  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1457  		assigned-clocks = <&k3_clks 67 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1458  		assigned-clock-parents = <&k3_clks 67 2>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1459  		power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1460  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1461  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1462  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1463  	main_timer17: timer@2510000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1464  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1465  		reg = <0x00 0x2510000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1466  		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1467  		clocks = <&k3_clks 68 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1468  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1469  		assigned-clocks = <&k3_clks 68 1>, <&k3_clks 321 0>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1470  		assigned-clock-parents = <&k3_clks 68 2>, <&k3_clks 321 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1471  		power-domains = <&k3_pds 68 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1472  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1473  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1474  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1475  	main_timer18: timer@2520000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1476  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1477  		reg = <0x00 0x2520000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1478  		interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1479  		clocks = <&k3_clks 69 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1480  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1481  		assigned-clocks = <&k3_clks 69 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1482  		assigned-clock-parents = <&k3_clks 69 2>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1483  		power-domains = <&k3_pds 69 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1484  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1485  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1486  
c8a28ed4837ce03 Udit Kumar             2023-06-11  1487  	main_timer19: timer@2530000 {
c8a28ed4837ce03 Udit Kumar             2023-06-11  1488  		compatible = "ti,am654-timer";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1489  		reg = <0x00 0x2530000 0x00 0x400>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1490  		interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1491  		clocks = <&k3_clks 70 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1492  		clock-names = "fck";
c8a28ed4837ce03 Udit Kumar             2023-06-11  1493  		assigned-clocks = <&k3_clks 70 1>, <&k3_clks 322 0>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1494  		assigned-clock-parents = <&k3_clks 70 2>, <&k3_clks 322 1>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1495  		power-domains = <&k3_pds 70 TI_SCI_PD_EXCLUSIVE>;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1496  		ti,timer-pwm;
c8a28ed4837ce03 Udit Kumar             2023-06-11  1497  	};
c8a28ed4837ce03 Udit Kumar             2023-06-11  1498  
eb6f3655d3ed4ee Suman Anna             2021-01-11  1499  	main_r5fss0: r5fss@5c00000 {
eb6f3655d3ed4ee Suman Anna             2021-01-11  1500  		compatible = "ti,j7200-r5fss";
51c9d74260c41f4 Suman Anna             2024-06-10  1501  		ti,cluster-mode = <0>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1502  		#address-cells = <1>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1503  		#size-cells = <1>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1504  		ranges = <0x5c00000 0x00 0x5c00000 0x20000>,
eb6f3655d3ed4ee Suman Anna             2021-01-11  1505  			 <0x5d00000 0x00 0x5d00000 0x20000>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1506  		power-domains = <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1507  
eb6f3655d3ed4ee Suman Anna             2021-01-11  1508  		main_r5fss0_core0: r5f@5c00000 {
eb6f3655d3ed4ee Suman Anna             2021-01-11  1509  			compatible = "ti,j7200-r5f";
eb6f3655d3ed4ee Suman Anna             2021-01-11  1510  			reg = <0x5c00000 0x00010000>,
eb6f3655d3ed4ee Suman Anna             2021-01-11  1511  			      <0x5c10000 0x00010000>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1512  			reg-names = "atcm", "btcm";
eb6f3655d3ed4ee Suman Anna             2021-01-11  1513  			ti,sci = <&dmsc>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1514  			ti,sci-dev-id = <245>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1515  			ti,sci-proc-ids = <0x06 0xff>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1516  			resets = <&k3_reset 245 1>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1517  			firmware-name = "j7200-main-r5f0_0-fw";
eb6f3655d3ed4ee Suman Anna             2021-01-11  1518  			ti,atcm-enable = <1>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1519  			ti,btcm-enable = <1>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1520  			ti,loczrama = <1>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1521  		};
eb6f3655d3ed4ee Suman Anna             2021-01-11  1522  
eb6f3655d3ed4ee Suman Anna             2021-01-11  1523  		main_r5fss0_core1: r5f@5d00000 {
eb6f3655d3ed4ee Suman Anna             2021-01-11  1524  			compatible = "ti,j7200-r5f";
eb6f3655d3ed4ee Suman Anna             2021-01-11  1525  			reg = <0x5d00000 0x00008000>,
eb6f3655d3ed4ee Suman Anna             2021-01-11  1526  			      <0x5d10000 0x00008000>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1527  			reg-names = "atcm", "btcm";
eb6f3655d3ed4ee Suman Anna             2021-01-11  1528  			ti,sci = <&dmsc>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1529  			ti,sci-dev-id = <246>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1530  			ti,sci-proc-ids = <0x07 0xff>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1531  			resets = <&k3_reset 246 1>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1532  			firmware-name = "j7200-main-r5f0_1-fw";
eb6f3655d3ed4ee Suman Anna             2021-01-11  1533  			ti,atcm-enable = <1>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1534  			ti,btcm-enable = <1>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1535  			ti,loczrama = <1>;
eb6f3655d3ed4ee Suman Anna             2021-01-11  1536  		};
eb6f3655d3ed4ee Suman Anna             2021-01-11  1537  	};
e3d1f2768853f37 Neha Malcom Francis    2023-05-04  1538  
e3d1f2768853f37 Neha Malcom Francis    2023-05-04  1539  	main_esm: esm@700000 {
e3d1f2768853f37 Neha Malcom Francis    2023-05-04  1540  		compatible = "ti,j721e-esm";
e3d1f2768853f37 Neha Malcom Francis    2023-05-04  1541  		reg = <0x0 0x700000 0x0 0x1000>;
e3d1f2768853f37 Neha Malcom Francis    2023-05-04  1542  		ti,esm-pins = <656>, <657>;
e3d1f2768853f37 Neha Malcom Francis    2023-05-04  1543  	};
579e5f86b175f41 Grygorii Strashko      2024-06-13  1544  
579e5f86b175f41 Grygorii Strashko      2024-06-13 @1545  	timesync_router: pinctrl@a40000 {

:::::: The code at line 1545 was first introduced by commit
:::::: 579e5f86b175f4128175e6339f0a9e2da58f83fe arm64: dts: ti: k3-j7200-main: add timesync_router node

:::::: TO: Grygorii Strashko <grygorii.strashko@ti.com>
:::::: CC: Udit Kumar <u-kumar1@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
