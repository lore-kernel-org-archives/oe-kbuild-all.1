Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116712AE97
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430651; cv=none; b=pJcUdJuB5Bdloto9vIhbcEvg4hB1G0KVkjCdqeKCctDJlN5jZJIpLTM1tmahmhpNaeFOWP0iBe/bewbAgNoaYKmn844bh6d8d5zTd6aCLy+up6NtlE37tOix0rx4cfL5VG26qaqQvEwZ4qHFxRJit6xJM64iDQTYdbmxuPWo50g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430651; c=relaxed/simple;
	bh=gisbRo8vCrhVO5fa1SzC5aAqKiIM1ur+bwje90b9m2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksk26Vtwi+OaDiRkSk6mvaRiX9nsyGCRXGocIrLlUvhJDajAupANa62urevnDc7DMai6EYllCDITtObTaSE5qOpoa4CVXKMyzxqm64+PsktSo2WHa8YEWJOlkb00M8ICEBdys81HUs1Zxq0deSaqmwVlpI/7UZiCR+rdGIEntU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H94Tp6tq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H94Tp6tq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736430649; x=1767966649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gisbRo8vCrhVO5fa1SzC5aAqKiIM1ur+bwje90b9m2U=;
  b=H94Tp6tqcnsnIo3gvRP02d6lJ5J/Xk9IC1ilY7uDaayeSVx5iVPTPsxm
   bMxuHDQ5FByh/6IFd0fV8+8+r2rFBWmBlpY3C9KvBFKgj6Asg/lJFKeeC
   SZjyn+JouV8IyqTncNRnb4QSNaW7r3cMC+Dhzw7oRjwixHarZrFBOf2QT
   bJ6ivEJ7coGJ3mvXZ9r+yyvutbTN21Q4T9WirQwmJgyhIzLgvt3/h4DcI
   mSJLNiuHwl1iDHvejXFySB/teGdhGDChEAGs+scvoCRA4e5BoCXhFmsEB
   O9/FPJmMVmheuXn62R2GjqGWpSPfvbvHaMXfSMFeJ1FDpktSOB+FDDYyk
   w==;
X-CSE-ConnectionGUID: hH/Clh0NR+ysKNK7WzoUoQ==
X-CSE-MsgGUID: 6UQMo3ULRiCOl0jpup9Rig==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40635750"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40635750"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 05:50:48 -0800
X-CSE-ConnectionGUID: 1itKIYzxSZ+DfMFh5MwhsA==
X-CSE-MsgGUID: rd6p1qmfTiCuKk/PNv0mcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140731223"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 05:50:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVsvs-000Hcd-1B;
	Thu, 09 Jan 2025 13:50:44 +0000
Date: Thu, 9 Jan 2025 21:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 6531/7509]
 arch/arm64/boot/dts/qcom/ipq5424.dtsi:292.22-343.5: Warning
 (simple_bus_reg): /soc@0/usb2@1e00000: simple-bus unit address format error,
 expected "1ef8800"
Message-ID: <202501092105.IOz0AGGv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
commit: 113d52bdc820da14dc0694bb5c57b3cda7ceea30 [6531/7509] arm64: dts: qcom: ipq5424: Add USB controller and phy nodes
config: arm64-randconfig-001-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092105.IOz0AGGv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092105.IOz0AGGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092105.IOz0AGGv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq5424.dtsi:292.22-343.5: Warning (simple_bus_reg): /soc@0/usb2@1e00000: simple-bus unit address format error, expected "1ef8800"
>> arch/arm64/boot/dts/qcom/ipq5424.dtsi:383.22-436.5: Warning (simple_bus_reg): /soc@0/usb3@8a00000: simple-bus unit address format error, expected "8af8800"

vim +/1ef8800 +292 arch/arm64/boot/dts/qcom/ipq5424.dtsi

    13	
    14	/ {
    15		#address-cells = <2>;
    16		#size-cells = <2>;
    17		interrupt-parent = <&intc>;
    18	
    19		clocks {
    20			sleep_clk: sleep-clk {
    21				compatible = "fixed-clock";
    22				#clock-cells = <0>;
    23			};
    24	
    25			xo_board: xo-board-clk {
    26				compatible = "fixed-clock";
    27				#clock-cells = <0>;
    28			};
    29		};
    30	
    31		cpus: cpus {
    32			#address-cells = <1>;
    33			#size-cells = <0>;
    34	
    35			cpu0: cpu@0 {
    36				device_type = "cpu";
    37				compatible = "arm,cortex-a55";
    38				reg = <0x0>;
    39				enable-method = "psci";
    40				next-level-cache = <&l2_0>;
    41				l2_0: l2-cache {
    42					compatible = "cache";
    43					cache-level = <2>;
    44					cache-unified;
    45					next-level-cache = <&l3_0>;
    46	
    47					l3_0: l3-cache {
    48						compatible = "cache";
    49						cache-level = <3>;
    50						cache-unified;
    51					};
    52				};
    53			};
    54	
    55			cpu1: cpu@100 {
    56				device_type = "cpu";
    57				compatible = "arm,cortex-a55";
    58				enable-method = "psci";
    59				reg = <0x100>;
    60				next-level-cache = <&l2_100>;
    61	
    62				l2_100: l2-cache {
    63					compatible = "cache";
    64					cache-level = <2>;
    65					cache-unified;
    66					next-level-cache = <&l3_0>;
    67				};
    68			};
    69	
    70			cpu2: cpu@200 {
    71				device_type = "cpu";
    72				compatible = "arm,cortex-a55";
    73				enable-method = "psci";
    74				reg = <0x200>;
    75				next-level-cache = <&l2_200>;
    76	
    77				l2_200: l2-cache {
    78					compatible = "cache";
    79					cache-level = <2>;
    80					cache-unified;
    81					next-level-cache = <&l3_0>;
    82				};
    83			};
    84	
    85			cpu3: cpu@300 {
    86				device_type = "cpu";
    87				compatible = "arm,cortex-a55";
    88				enable-method = "psci";
    89				reg = <0x300>;
    90				next-level-cache = <&l2_300>;
    91	
    92				l2_300: l2-cache {
    93					compatible = "cache";
    94					cache-level = <2>;
    95					cache-unified;
    96					next-level-cache = <&l3_0>;
    97				};
    98			};
    99		};
   100	
   101		memory@80000000 {
   102			device_type = "memory";
   103			/* We expect the bootloader to fill in the size */
   104			reg = <0x0 0x80000000 0x0 0x0>;
   105		};
   106	
   107		pmu-a55 {
   108			compatible = "arm,cortex-a55-pmu";
   109			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
   110		};
   111	
   112		pmu-dsu {
   113			compatible = "arm,dsu-pmu";
   114			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
   115			cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
   116		};
   117	
   118		psci {
   119			compatible = "arm,psci-1.0";
   120			method = "smc";
   121		};
   122	
   123		reserved-memory {
   124			#address-cells = <2>;
   125			#size-cells = <2>;
   126			ranges;
   127	
   128			tz@8a600000 {
   129				reg = <0x0 0x8a600000 0x0 0x200000>;
   130				no-map;
   131			};
   132	
   133			smem@8a800000 {
   134				compatible = "qcom,smem";
   135				reg = <0x0 0x8a800000 0x0 0x32000>;
   136				no-map;
   137	
   138				hwlocks = <&tcsr_mutex 3>;
   139			};
   140		};
   141	
   142		soc@0 {
   143			compatible = "simple-bus";
   144			#address-cells = <2>;
   145			#size-cells = <2>;
   146			ranges = <0 0 0 0 0x10 0>;
   147	
   148			rng: rng@4c3000 {
   149				compatible = "qcom,ipq5424-trng", "qcom,trng";
   150				reg = <0 0x004c3000 0 0x1000>;
   151				clocks = <&gcc GCC_PRNG_AHB_CLK>;
   152				clock-names = "core";
   153			};
   154	
   155			system-cache-controller@800000 {
   156				compatible = "qcom,ipq5424-llcc";
   157				reg = <0 0x00800000 0 0x200000>;
   158				reg-names = "llcc0_base";
   159				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
   160			};
   161	
   162			tlmm: pinctrl@1000000 {
   163				compatible = "qcom,ipq5424-tlmm";
   164				reg = <0 0x01000000 0 0x300000>;
   165				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
   166				gpio-controller;
   167				#gpio-cells = <2>;
   168				gpio-ranges = <&tlmm 0 0 50>;
   169				interrupt-controller;
   170				#interrupt-cells = <2>;
   171	
   172				uart1_pins: uart1-state {
   173					pins = "gpio43", "gpio44";
   174					function = "uart1";
   175					drive-strength = <8>;
   176					bias-pull-up;
   177				};
   178			};
   179	
   180			gcc: clock-controller@1800000 {
   181				compatible = "qcom,ipq5424-gcc";
   182				reg = <0 0x01800000 0 0x40000>;
   183				clocks = <&xo_board>,
   184					 <&sleep_clk>,
   185					 <0>,
   186					 <0>,
   187					 <0>,
   188					 <0>,
   189					 <0>;
   190				#clock-cells = <1>;
   191				#reset-cells = <1>;
   192				#interconnect-cells = <1>;
   193			};
   194	
   195			tcsr_mutex: hwlock@1905000 {
   196				compatible = "qcom,tcsr-mutex";
   197				reg = <0 0x01905000 0 0x20000>;
   198				#hwlock-cells = <1>;
   199			};
   200	
   201			qupv3: geniqup@1ac0000 {
   202				compatible = "qcom,geni-se-qup";
   203				reg = <0 0x01ac0000 0 0x2000>;
   204				ranges;
   205				clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
   206					 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
   207				clock-names = "m-ahb", "s-ahb";
   208				#address-cells = <2>;
   209				#size-cells = <2>;
   210	
   211				uart1: serial@1a84000 {
   212					compatible = "qcom,geni-debug-uart";
   213					reg = <0 0x01a84000 0 0x4000>;
   214					clocks = <&gcc GCC_QUPV3_UART1_CLK>;
   215					clock-names = "se";
   216					interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
   217				};
   218	
   219				spi0: spi@1a90000 {
   220					compatible = "qcom,geni-spi";
   221					reg = <0 0x01a90000 0 0x4000>;
   222					clocks = <&gcc GCC_QUPV3_SPI0_CLK>;
   223					clock-names = "se";
   224					interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>;
   225					#address-cells = <1>;
   226					#size-cells = <0>;
   227					status = "disabled";
   228				};
   229	
   230				spi1: spi@1a94000 {
   231					compatible = "qcom,geni-spi";
   232					reg = <0 0x01a94000 0 0x4000>;
   233					clocks = <&gcc GCC_QUPV3_SPI1_CLK>;
   234					clock-names = "se";
   235					interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
   236					#address-cells = <1>;
   237					#size-cells = <0>;
   238					status = "disabled";
   239				};
   240			};
   241	
   242			sdhc: mmc@7804000 {
   243				compatible = "qcom,ipq5424-sdhci", "qcom,sdhci-msm-v5";
   244				reg = <0 0x07804000 0 0x1000>, <0 0x07805000 0 0x1000>;
   245				reg-names = "hc", "cqhci";
   246	
   247				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
   248					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
   249				interrupt-names = "hc_irq", "pwr_irq";
   250	
   251				clocks = <&gcc GCC_SDCC1_AHB_CLK>,
   252					 <&gcc GCC_SDCC1_APPS_CLK>,
   253					 <&xo_board>;
   254				clock-names = "iface", "core", "xo";
   255	
   256				status = "disabled";
   257			};
   258	
   259			intc: interrupt-controller@f200000 {
   260				compatible = "arm,gic-v3";
   261				reg = <0 0xf200000 0 0x10000>, /* GICD */
   262				      <0 0xf240000 0 0x80000>; /* GICR * 4 regions */
   263				#interrupt-cells = <0x3>;
   264				interrupt-controller;
   265				#redistributor-regions = <1>;
   266				redistributor-stride = <0x0 0x20000>;
   267				interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
   268				mbi-ranges = <672 128>;
   269				msi-controller;
   270			};
   271	
   272			watchdog@f410000 {
   273				compatible = "qcom,apss-wdt-ipq5424", "qcom,kpss-wdt";
   274				reg = <0 0x0f410000 0 0x1000>;
   275				interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
   276				clocks = <&sleep_clk>;
   277			};
   278	
   279			qusb_phy_1: phy@71000 {
   280				compatible = "qcom,ipq5424-qusb2-phy";
   281				reg = <0 0x00071000 0 0x180>;
   282				#phy-cells = <0>;
   283	
   284				clocks = <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
   285					<&xo_board>;
   286				clock-names = "cfg_ahb", "ref";
   287	
   288				resets = <&gcc GCC_QUSB2_1_PHY_BCR>;
   289				status = "disabled";
   290			};
   291	
 > 292			usb2: usb2@1e00000 {
   293				compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
   294				reg = <0 0x01ef8800 0 0x400>;
   295				#address-cells = <2>;
   296				#size-cells = <2>;
   297				ranges;
   298	
   299				clocks = <&gcc GCC_USB1_MASTER_CLK>,
   300					 <&gcc GCC_USB1_SLEEP_CLK>,
   301					 <&gcc GCC_USB1_MOCK_UTMI_CLK>,
   302					 <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
   303					 <&gcc GCC_CNOC_USB_CLK>;
   304	
   305				clock-names = "core",
   306					      "sleep",
   307					      "mock_utmi",
   308					      "iface",
   309					      "cfg_noc";
   310	
   311				assigned-clocks = <&gcc GCC_USB1_MASTER_CLK>,
   312						  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
   313				assigned-clock-rates = <200000000>,
   314						       <24000000>;
   315	
   316				interrupts-extended = <&intc GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
   317						      <&intc GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
   318						      <&intc GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
   319						      <&intc GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
   320				interrupt-names = "pwr_event",
   321						  "qusb2_phy",
   322						  "dm_hs_phy_irq",
   323						  "dp_hs_phy_irq";
   324	
   325				resets = <&gcc GCC_USB1_BCR>;
   326				qcom,select-utmi-as-pipe-clk;
   327				status = "disabled";
   328	
   329				dwc_1: usb@1e00000 {
   330					compatible = "snps,dwc3";
   331					reg = <0 0x01e00000 0 0xe000>;
   332					clocks = <&gcc GCC_USB1_MOCK_UTMI_CLK>;
   333					clock-names = "ref";
   334					interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>;
   335					phys = <&qusb_phy_1>;
   336					phy-names = "usb2-phy";
   337					tx-fifo-resize;
   338					snps,is-utmi-l1-suspend;
   339					snps,hird-threshold = /bits/ 8 <0x0>;
   340					snps,dis_u2_susphy_quirk;
   341					snps,dis_u3_susphy_quirk;
   342				};
   343			};
   344	
   345			qusb_phy_0: phy@7b000 {
   346				compatible = "qcom,ipq5424-qusb2-phy";
   347				reg = <0 0x0007b000 0 0x180>;
   348				#phy-cells = <0>;
   349	
   350				clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
   351					<&xo_board>;
   352				clock-names = "cfg_ahb", "ref";
   353	
   354				resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
   355				status = "disabled";
   356			};
   357	
   358			ssphy_0: phy@7d000 {
   359				compatible = "qcom,ipq5424-qmp-usb3-phy";
   360				reg = <0 0x0007d000 0 0xa00>;
   361				#phy-cells = <0>;
   362	
   363				clocks = <&gcc GCC_USB0_AUX_CLK>,
   364					 <&xo_board>,
   365					 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
   366					 <&gcc GCC_USB0_PIPE_CLK>;
   367				clock-names = "aux",
   368					      "ref",
   369					      "cfg_ahb",
   370					      "pipe";
   371	
   372				resets = <&gcc GCC_USB0_PHY_BCR>,
   373					 <&gcc GCC_USB3PHY_0_PHY_BCR>;
   374				reset-names = "phy",
   375					      "phy_phy";
   376	
   377				#clock-cells = <0>;
   378				clock-output-names = "usb0_pipe_clk";
   379	
   380				status = "disabled";
   381			};
   382	
 > 383			usb3: usb3@8a00000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
