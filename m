Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAA917B50B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741256986; cv=none; b=PjcSczieCQaEoecA9enCJZLx6/oy75WvWiK6bLyVSg/HUcNy8ZF+W0/Sn8JzHM80KN0d1fuoz0i0JsbBYV94j3nbIt11141BBRvo1Yojn/ulEMiawqw8Ybc1dzGRQNE8yPMO0sXLKulk5qBZOFkl0XrACz7hyeWM2iCn65QPyHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741256986; c=relaxed/simple;
	bh=DmzZEOuK+PfyLQ7cxbfQZOT3+ZVdvP9xFnyA0+O5IzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFXy6E/DsvBErRvCd9YG2U60GYuA4ClBWasf2iHNL0L9X+VGFidUU9E0Ln1BarC3huqlTzmRWRv2vxN8UZ4N2gNi+t62n/4UU7YpfO/02GQgd5dKVOH1FEGwnYBhgnQq10AVLdeyaKCGgTfgsPgI3b9Xmz85njOzf05qI8HpZyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGGycr9V; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGGycr9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741256985; x=1772792985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DmzZEOuK+PfyLQ7cxbfQZOT3+ZVdvP9xFnyA0+O5IzE=;
  b=TGGycr9VJk5w+fby4awXOjBrOUWQBYUZHPGkNsiJqrCTLQllAGgGB++y
   SqIx+IWbEJm6hBmuPH0avorie7nIZAk+DRCgWCxm49dksc+/1vIeYg8Bj
   qKI/6YrDY9pm0E+mx4TFEhQcbRcgXyirqtsGvyGpnmnD7UY3IpO+xH9Zm
   kzA/Jn/uSf/F9Iphw2EQPBDRoM94gP0YB4vZtaGlGnLyPHG7x6rbsm4Sg
   bPsujJARKaaDL21I3HOcctByBT/q0qUKXk2qveTXS1/Hn3+85YDb6qR/7
   5sFW8H4PaTuLmIuxpPgvaH9QC9kf6tu3W5iJhXl3/B3fz7CBOdJApv1uo
   Q==;
X-CSE-ConnectionGUID: UYRDbcbwTlyx7/7iVkWJmw==
X-CSE-MsgGUID: 6v7O9aTLQMChut1bFPwO3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45914028"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="45914028"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 02:29:44 -0800
X-CSE-ConnectionGUID: eKW4zs9mTuSx0q4Oq3/3fA==
X-CSE-MsgGUID: TyyTD8xLQHOe7BqA70P7wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124189655"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2025 02:29:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq8Ty-000Mu8-0w;
	Thu, 06 Mar 2025 10:29:39 +0000
Date: Thu, 6 Mar 2025 18:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 8164/8790]
 arch/arm64/boot/dts/rockchip/rk3528.dtsi:267.20-333.5: Warning
 (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
Message-ID: <202503061806.8jrVexin-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7ec162622e66a4ff886f8f28712ea1b13069e1aa
commit: a31fad19ae39ea27b5068e3b02bcbf30a905339b [8164/8790] arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528
config: arm64-randconfig-051-20250305 (https://download.01.org/0day-ci/archive/20250306/202503061806.8jrVexin-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061806.8jrVexin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061806.8jrVexin-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:113.6-334.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528.dtsi:267.20-333.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/pinctrl: failed to match any schema with compatible: ['rockchip,rk3528-pinctrl']

vim +267 arch/arm64/boot/dts/rockchip/rk3528.dtsi

    12	
    13	/ {
    14		compatible = "rockchip,rk3528";
    15	
    16		interrupt-parent = <&gic>;
    17		#address-cells = <2>;
    18		#size-cells = <2>;
    19	
    20		aliases {
    21			gpio0 = &gpio0;
    22			gpio1 = &gpio1;
    23			gpio2 = &gpio2;
    24			gpio3 = &gpio3;
    25			gpio4 = &gpio4;
    26			serial0 = &uart0;
    27			serial1 = &uart1;
    28			serial2 = &uart2;
    29			serial3 = &uart3;
    30			serial4 = &uart4;
    31			serial5 = &uart5;
    32			serial6 = &uart6;
    33			serial7 = &uart7;
    34		};
    35	
    36		cpus {
    37			#address-cells = <1>;
    38			#size-cells = <0>;
    39	
    40			cpu-map {
    41				cluster0 {
    42					core0 {
    43						cpu = <&cpu0>;
    44					};
    45					core1 {
    46						cpu = <&cpu1>;
    47					};
    48					core2 {
    49						cpu = <&cpu2>;
    50					};
    51					core3 {
    52						cpu = <&cpu3>;
    53					};
    54				};
    55			};
    56	
    57			cpu0: cpu@0 {
    58				compatible = "arm,cortex-a53";
    59				reg = <0x0>;
    60				device_type = "cpu";
    61				enable-method = "psci";
    62			};
    63	
    64			cpu1: cpu@1 {
    65				compatible = "arm,cortex-a53";
    66				reg = <0x1>;
    67				device_type = "cpu";
    68				enable-method = "psci";
    69			};
    70	
    71			cpu2: cpu@2 {
    72				compatible = "arm,cortex-a53";
    73				reg = <0x2>;
    74				device_type = "cpu";
    75				enable-method = "psci";
    76			};
    77	
    78			cpu3: cpu@3 {
    79				compatible = "arm,cortex-a53";
    80				reg = <0x3>;
    81				device_type = "cpu";
    82				enable-method = "psci";
    83			};
    84		};
    85	
    86		psci {
    87			compatible = "arm,psci-1.0", "arm,psci-0.2";
    88			method = "smc";
    89		};
    90	
    91		timer {
    92			compatible = "arm,armv8-timer";
    93			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
    94				     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
    95				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
    96				     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
    97		};
    98	
    99		xin24m: clock-xin24m {
   100			compatible = "fixed-clock";
   101			clock-frequency = <24000000>;
   102			clock-output-names = "xin24m";
   103			#clock-cells = <0>;
   104		};
   105	
   106		gmac0_clk: clock-gmac50m {
   107			compatible = "fixed-clock";
   108			clock-frequency = <50000000>;
   109			clock-output-names = "gmac0";
   110			#clock-cells = <0>;
   111		};
   112	
 > 113		soc {
   114			compatible = "simple-bus";
   115			ranges = <0x0 0xfe000000 0x0 0xfe000000 0x0 0x2000000>;
   116			#address-cells = <2>;
   117			#size-cells = <2>;
   118	
   119			gic: interrupt-controller@fed01000 {
   120				compatible = "arm,gic-400";
   121				reg = <0x0 0xfed01000 0 0x1000>,
   122				      <0x0 0xfed02000 0 0x2000>,
   123				      <0x0 0xfed04000 0 0x2000>,
   124				      <0x0 0xfed06000 0 0x2000>;
   125				interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
   126							 IRQ_TYPE_LEVEL_LOW)>;
   127				interrupt-controller;
   128				#address-cells = <0>;
   129				#interrupt-cells = <3>;
   130			};
   131	
   132			cru: clock-controller@ff4a0000 {
   133				compatible = "rockchip,rk3528-cru";
   134				reg = <0x0 0xff4a0000 0x0 0x30000>;
   135				assigned-clocks =
   136					<&cru XIN_OSC0_DIV>, <&cru PLL_GPLL>,
   137					<&cru PLL_PPLL>, <&cru PLL_CPLL>,
   138					<&cru ARMCLK>, <&cru CLK_MATRIX_250M_SRC>,
   139					<&cru CLK_MATRIX_500M_SRC>,
   140					<&cru CLK_MATRIX_50M_SRC>,
   141					<&cru CLK_MATRIX_100M_SRC>,
   142					<&cru CLK_MATRIX_150M_SRC>,
   143					<&cru CLK_MATRIX_200M_SRC>,
   144					<&cru CLK_MATRIX_300M_SRC>,
   145					<&cru CLK_MATRIX_339M_SRC>,
   146					<&cru CLK_MATRIX_400M_SRC>,
   147					<&cru CLK_MATRIX_600M_SRC>,
   148					<&cru CLK_PPLL_50M_MATRIX>,
   149					<&cru CLK_PPLL_100M_MATRIX>,
   150					<&cru CLK_PPLL_125M_MATRIX>,
   151					<&cru ACLK_BUS_VOPGL_ROOT>;
   152				assigned-clock-rates =
   153					<32768>, <1188000000>,
   154					<1000000000>, <996000000>,
   155					<408000000>, <250000000>,
   156					<500000000>,
   157					<50000000>,
   158					<100000000>,
   159					<150000000>,
   160					<200000000>,
   161					<300000000>,
   162					<340000000>,
   163					<400000000>,
   164					<600000000>,
   165					<50000000>,
   166					<100000000>,
   167					<125000000>,
   168					<500000000>;
   169				clocks = <&xin24m>, <&gmac0_clk>;
   170				clock-names = "xin24m", "gmac0";
   171				#clock-cells = <1>;
   172				#reset-cells = <1>;
   173			};
   174	
   175			ioc_grf: syscon@ff540000 {
   176				compatible = "rockchip,rk3528-ioc-grf", "syscon";
   177				reg = <0x0 0xff540000 0x0 0x40000>;
   178			};
   179	
   180			uart0: serial@ff9f0000 {
   181				compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
   182				reg = <0x0 0xff9f0000 0x0 0x100>;
   183				clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
   184				clock-names = "baudclk", "apb_pclk";
   185				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
   186				reg-io-width = <4>;
   187				reg-shift = <2>;
   188				status = "disabled";
   189			};
   190	
   191			uart1: serial@ff9f8000 {
   192				compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
   193				reg = <0x0 0xff9f8000 0x0 0x100>;
   194				clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
   195				clock-names = "baudclk", "apb_pclk";
   196				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
   197				reg-io-width = <4>;
   198				reg-shift = <2>;
   199				status = "disabled";
   200			};
   201	
   202			uart2: serial@ffa00000 {
   203				compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
   204				reg = <0x0 0xffa00000 0x0 0x100>;
   205				clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
   206				clock-names = "baudclk", "apb_pclk";
   207				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
   208				reg-io-width = <4>;
   209				reg-shift = <2>;
   210				status = "disabled";
   211			};
   212	
   213			uart3: serial@ffa08000 {
   214				compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
   215				clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
   216				clock-names = "baudclk", "apb_pclk";
   217				reg = <0x0 0xffa08000 0x0 0x100>;
   218				reg-io-width = <4>;
   219				reg-shift = <2>;
   220				status = "disabled";
   221			};
   222	
   223			uart4: serial@ffa10000 {
   224				compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
   225				reg = <0x0 0xffa10000 0x0 0x100>;
   226				clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
   227				clock-names = "baudclk", "apb_pclk";
   228				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
   229				reg-io-width = <4>;
   230				reg-shift = <2>;
   231				status = "disabled";
   232			};
   233	
   234			uart5: serial@ffa18000 {
   235				compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
   236				reg = <0x0 0xffa18000 0x0 0x100>;
   237				clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
   238				clock-names = "baudclk", "apb_pclk";
   239				interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
   240				reg-io-width = <4>;
   241				reg-shift = <2>;
   242				status = "disabled";
   243			};
   244	
   245			uart6: serial@ffa20000 {
   246				compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
   247				reg = <0x0 0xffa20000 0x0 0x100>;
   248				clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
   249				clock-names = "baudclk", "apb_pclk";
   250				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
   251				reg-io-width = <4>;
   252				reg-shift = <2>;
   253				status = "disabled";
   254			};
   255	
   256			uart7: serial@ffa28000 {
   257				compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
   258				reg = <0x0 0xffa28000 0x0 0x100>;
   259				clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
   260				clock-names = "baudclk", "apb_pclk";
   261				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
   262				reg-io-width = <4>;
   263				reg-shift = <2>;
   264				status = "disabled";
   265			};
   266	
 > 267			pinctrl: pinctrl {
   268				compatible = "rockchip,rk3528-pinctrl";
   269				rockchip,grf = <&ioc_grf>;
   270				#address-cells = <2>;
   271				#size-cells = <2>;
   272				ranges;
   273	
   274				gpio0: gpio@ff610000 {
   275					compatible = "rockchip,gpio-bank";
   276					reg = <0x0 0xff610000 0x0 0x200>;
   277					clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
   278					interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
   279					gpio-controller;
   280					#gpio-cells = <2>;
   281					gpio-ranges = <&pinctrl 0 0 32>;
   282					interrupt-controller;
   283					#interrupt-cells = <2>;
   284				};
   285	
   286				gpio1: gpio@ffaf0000 {
   287					compatible = "rockchip,gpio-bank";
   288					reg = <0x0 0xffaf0000 0x0 0x200>;
   289					clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
   290					interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
   291					gpio-controller;
   292					#gpio-cells = <2>;
   293					gpio-ranges = <&pinctrl 0 32 32>;
   294					interrupt-controller;
   295					#interrupt-cells = <2>;
   296				};
   297	
   298				gpio2: gpio@ffb00000 {
   299					compatible = "rockchip,gpio-bank";
   300					reg = <0x0 0xffb00000 0x0 0x200>;
   301					clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
   302					interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
   303					gpio-controller;
   304					#gpio-cells = <2>;
   305					gpio-ranges = <&pinctrl 0 64 32>;
   306					interrupt-controller;
   307					#interrupt-cells = <2>;
   308				};
   309	
   310				gpio3: gpio@ffb10000 {
   311					compatible = "rockchip,gpio-bank";
   312					reg = <0x0 0xffb10000 0x0 0x200>;
   313					clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
   314					interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
   315					gpio-controller;
   316					#gpio-cells = <2>;
   317					gpio-ranges = <&pinctrl 0 96 32>;
   318					interrupt-controller;
   319					#interrupt-cells = <2>;
   320				};
   321	
   322				gpio4: gpio@ffb20000 {
   323					compatible = "rockchip,gpio-bank";
   324					reg = <0x0 0xffb20000 0x0 0x200>;
   325					clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
   326					interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
   327					gpio-controller;
   328					#gpio-cells = <2>;
   329					gpio-ranges = <&pinctrl 0 128 32>;
   330					interrupt-controller;
   331					#interrupt-cells = <2>;
   332				};
   333			};
   334		};
   335	};
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
