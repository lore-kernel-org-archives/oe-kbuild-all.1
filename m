Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49144CB35
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 21:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717967977; cv=none; b=GfY6ckk0ZC9iqYFghDAzwsC5Qmw255l03WDA2Z7a0JcQKh2/kj+dbPi1LIe30fHIUYkf5VvNWSnJ2fdjb9dNbce1dbY7EjdHXmYQ409T1yBrvh9grLDg8+k4fzqA1kBb46l/P5q4I3M+fwwTp5tsxhHhDwPOmpyodPluwL/wgc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717967977; c=relaxed/simple;
	bh=o6CQgC7ZI0Xfu9XYdVhmy4o1SOWSylxeY8uHDWvsRWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eMPUQxeDnaIuHrh4Jm/dhle4JK5RmW3nTUU1psEjdrix7pctG3LuTx1rJxmdif9o8cBBKH3Dl/qkSdqCdLhrPPcnwSMAxDGC6YDluoPQGp3aQqEJAYg9uFSqnF+kEX9zUdUs/K19B2duoFsEvfHtFhANPS3IEqtQYa+g+OEn+Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GT/caNhT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GT/caNhT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717967973; x=1749503973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o6CQgC7ZI0Xfu9XYdVhmy4o1SOWSylxeY8uHDWvsRWk=;
  b=GT/caNhTFCW8N5md2bmWsfpmTGdBb97TwrAUW4c5RveItvY4nO1CMPy/
   8gIFoeZzdzGjfq0CgnpVffqMng7RI3oXeEMkNMAFKCIq3ZRAHs66ftGGi
   rTO3HQwLxAHNA8EcG5sd5S6H39ukmU3uoWOg+ZUe6QZW0vU7k9zFrqmpP
   QMeZxB0Izn8aCDe6mqy6z/YcLy0+ZDZboI+ucVxgqIIAqCKJ8uxDrEJsN
   ZWpO9T7ZeMIx5FgPjQIKSWv79CmJlRJVztQSeN62juG3Gwvw+yOem74e5
   16OEIhpA7R0swmYdesaMVOsdmGa+gF28/epHZkK06L8lzdnpCH43oV1pk
   A==;
X-CSE-ConnectionGUID: v8+pUNrDSECbrpb53vdsAg==
X-CSE-MsgGUID: nst/h8HVQkKshVkGDW1LWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14756014"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="14756014"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:19:32 -0700
X-CSE-ConnectionGUID: Tok9VXezSZKWIDkujZl+nQ==
X-CSE-MsgGUID: bjhGpUqwQ8ygBdBLlSHH1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="43304908"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jun 2024 14:19:30 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGPwm-0001bd-0D;
	Sun, 09 Jun 2024 21:19:28 +0000
Date: Mon, 10 Jun 2024 05:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul T R <r-ravikumar@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 48/55]
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1873.21-1889.4: Warning
 (simple_bus_reg): /bus@100000/dsi@48000000: simple-bus unit address format
 error, expected "4800000"
Message-ID: <202406100531.cZgZ4JwG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   2cceab3b4473f10ed67af5ba77fdcbcff77d48d9
commit: bfeee37402c99b05fe14ca100c15e6c4d2e58129 [48/55] arm64: dts: ti: k3-j721e-main: Add DSI and DPHY-TX
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240610/202406100531.cZgZ4JwG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100531.cZgZ4JwG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100531.cZgZ4JwG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1873.21-1889.4: Warning (simple_bus_reg): /bus@100000/dsi@48000000: simple-bus unit address format error, expected "4800000"

vim +/4800000 +1873 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi

    26	
    27	&cbass_main {
    28		msmc_ram: sram@70000000 {
    29			compatible = "mmio-sram";
    30			reg = <0x0 0x70000000 0x0 0x800000>;
    31			#address-cells = <1>;
    32			#size-cells = <1>;
    33			ranges = <0x0 0x0 0x70000000 0x800000>;
    34	
    35			atf-sram@0 {
    36				reg = <0x0 0x20000>;
    37			};
    38		};
    39	
    40		scm_conf: scm-conf@100000 {
    41			compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
    42			reg = <0 0x00100000 0 0x1c000>; /* excludes pinctrl region */
    43			#address-cells = <1>;
    44			#size-cells = <1>;
    45			ranges = <0x0 0x0 0x00100000 0x1c000>;
    46	
    47			serdes_ln_ctrl: mux-controller@4080 {
    48				compatible = "reg-mux";
    49				reg = <0x4080 0x50>;
    50				#mux-control-cells = <1>;
    51				mux-reg-masks = <0x0 0x3>, <0x4 0x3>, /* SERDES0 lane0/1 select */
    52						<0x10 0x3>, <0x14 0x3>, /* SERDES1 lane0/1 select */
    53						<0x20 0x3>, <0x24 0x3>, /* SERDES2 lane0/1 select */
    54						<0x30 0x3>, <0x34 0x3>, /* SERDES3 lane0/1 select */
    55						<0x40 0x3>, <0x44 0x3>, /* SERDES4 lane0/1 select */
    56						<0x48 0x3>, <0x4c 0x3>; /* SERDES4 lane2/3 select */
    57				idle-states = <J721E_SERDES0_LANE0_PCIE0_LANE0>, <J721E_SERDES0_LANE1_PCIE0_LANE1>,
    58					      <J721E_SERDES1_LANE0_PCIE1_LANE0>, <J721E_SERDES1_LANE1_PCIE1_LANE1>,
    59					      <J721E_SERDES2_LANE0_PCIE2_LANE0>, <J721E_SERDES2_LANE1_PCIE2_LANE1>,
    60					      <MUX_IDLE_AS_IS>, <J721E_SERDES3_LANE1_USB3_0>,
    61					      <J721E_SERDES4_LANE0_EDP_LANE0>, <J721E_SERDES4_LANE1_EDP_LANE1>,
    62					      <J721E_SERDES4_LANE2_EDP_LANE2>, <J721E_SERDES4_LANE3_EDP_LANE3>;
    63			};
    64	
    65			cpsw0_phy_gmii_sel: phy@4044 {
    66				compatible = "ti,j721e-cpsw9g-phy-gmii-sel";
    67				ti,qsgmii-main-ports = <2>, <2>;
    68				reg = <0x4044 0x20>;
    69				#phy-cells = <1>;
    70			};
    71	
    72			usb_serdes_mux: mux-controller@4000 {
    73				compatible = "reg-mux";
    74				reg = <0x4000 0x20>;
    75				#mux-control-cells = <1>;
    76				mux-reg-masks = <0x0 0x8000000>, /* USB0 to SERDES0/3 mux */
    77						<0x10 0x8000000>; /* USB1 to SERDES1/2 mux */
    78			};
    79	
    80			ehrpwm_tbclk: clock-controller@4140 {
    81				compatible = "ti,am654-ehrpwm-tbclk";
    82				reg = <0x4140 0x18>;
    83				#clock-cells = <1>;
    84			};
    85		};
    86	
    87		main_ehrpwm0: pwm@3000000 {
    88			compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
    89			#pwm-cells = <3>;
    90			reg = <0x00 0x3000000 0x00 0x100>;
    91			power-domains = <&k3_pds 83 TI_SCI_PD_EXCLUSIVE>;
    92			clocks = <&ehrpwm_tbclk 0>, <&k3_clks 83 0>;
    93			clock-names = "tbclk", "fck";
    94			status = "disabled";
    95		};
    96	
    97		main_ehrpwm1: pwm@3010000 {
    98			compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
    99			#pwm-cells = <3>;
   100			reg = <0x00 0x3010000 0x00 0x100>;
   101			power-domains = <&k3_pds 84 TI_SCI_PD_EXCLUSIVE>;
   102			clocks = <&ehrpwm_tbclk 1>, <&k3_clks 84 0>;
   103			clock-names = "tbclk", "fck";
   104			status = "disabled";
   105		};
   106	
   107		main_ehrpwm2: pwm@3020000 {
   108			compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
   109			#pwm-cells = <3>;
   110			reg = <0x00 0x3020000 0x00 0x100>;
   111			power-domains = <&k3_pds 85 TI_SCI_PD_EXCLUSIVE>;
   112			clocks = <&ehrpwm_tbclk 2>, <&k3_clks 85 0>;
   113			clock-names = "tbclk", "fck";
   114			status = "disabled";
   115		};
   116	
   117		main_ehrpwm3: pwm@3030000 {
   118			compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
   119			#pwm-cells = <3>;
   120			reg = <0x00 0x3030000 0x00 0x100>;
   121			power-domains = <&k3_pds 86 TI_SCI_PD_EXCLUSIVE>;
   122			clocks = <&ehrpwm_tbclk 3>, <&k3_clks 86 0>;
   123			clock-names = "tbclk", "fck";
   124			status = "disabled";
   125		};
   126	
   127		main_ehrpwm4: pwm@3040000 {
   128			compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
   129			#pwm-cells = <3>;
   130			reg = <0x00 0x3040000 0x00 0x100>;
   131			power-domains = <&k3_pds 87 TI_SCI_PD_EXCLUSIVE>;
   132			clocks = <&ehrpwm_tbclk 4>, <&k3_clks 87 0>;
   133			clock-names = "tbclk", "fck";
   134			status = "disabled";
   135		};
   136	
   137		main_ehrpwm5: pwm@3050000 {
   138			compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
   139			#pwm-cells = <3>;
   140			reg = <0x00 0x3050000 0x00 0x100>;
   141			power-domains = <&k3_pds 88 TI_SCI_PD_EXCLUSIVE>;
   142			clocks = <&ehrpwm_tbclk 5>, <&k3_clks 88 0>;
   143			clock-names = "tbclk", "fck";
   144			status = "disabled";
   145		};
   146	
   147		gic500: interrupt-controller@1800000 {
   148			compatible = "arm,gic-v3";
   149			#address-cells = <2>;
   150			#size-cells = <2>;
   151			ranges;
   152			#interrupt-cells = <3>;
   153			interrupt-controller;
   154			reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
   155			      <0x00 0x01900000 0x00 0x100000>,	/* GICR */
   156			      <0x00 0x6f000000 0x00 0x2000>,	/* GICC */
   157			      <0x00 0x6f010000 0x00 0x1000>,	/* GICH */
   158			      <0x00 0x6f020000 0x00 0x2000>;	/* GICV */
   159	
   160			/* vcpumntirq: virtual CPU interface maintenance interrupt */
   161			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
   162	
   163			gic_its: msi-controller@1820000 {
   164				compatible = "arm,gic-v3-its";
   165				reg = <0x00 0x01820000 0x00 0x10000>;
   166				socionext,synquacer-pre-its = <0x1000000 0x400000>;
   167				msi-controller;
   168				#msi-cells = <1>;
   169			};
   170		};
   171	
   172		main_gpio_intr: interrupt-controller@a00000 {
   173			compatible = "ti,sci-intr";
   174			reg = <0x00 0x00a00000 0x00 0x800>;
   175			ti,intr-trigger-type = <1>;
   176			interrupt-controller;
   177			interrupt-parent = <&gic500>;
   178			#interrupt-cells = <1>;
   179			ti,sci = <&dmsc>;
   180			ti,sci-dev-id = <131>;
   181			ti,interrupt-ranges = <8 392 56>;
   182		};
   183	
   184		main_navss: bus@30000000 {
   185			compatible = "simple-bus";
   186			#address-cells = <2>;
   187			#size-cells = <2>;
   188			ranges = <0x00 0x30000000 0x00 0x30000000 0x00 0x0c400000>;
   189			dma-coherent;
   190			dma-ranges;
   191	
   192			ti,sci-dev-id = <199>;
   193	
   194			main_navss_intr: interrupt-controller@310e0000 {
   195				compatible = "ti,sci-intr";
   196				reg = <0x0 0x310e0000 0x0 0x4000>;
   197				ti,intr-trigger-type = <4>;
   198				interrupt-controller;
   199				interrupt-parent = <&gic500>;
   200				#interrupt-cells = <1>;
   201				ti,sci = <&dmsc>;
   202				ti,sci-dev-id = <213>;
   203				ti,interrupt-ranges = <0 64 64>,
   204						      <64 448 64>,
   205						      <128 672 64>;
   206			};
   207	
   208			main_udmass_inta: interrupt-controller@33d00000 {
   209				compatible = "ti,sci-inta";
   210				reg = <0x0 0x33d00000 0x0 0x100000>;
   211				interrupt-controller;
   212				interrupt-parent = <&main_navss_intr>;
   213				msi-controller;
   214				#interrupt-cells = <0>;
   215				ti,sci = <&dmsc>;
   216				ti,sci-dev-id = <209>;
   217				ti,interrupt-ranges = <0 0 256>;
   218			};
   219	
   220			secure_proxy_main: mailbox@32c00000 {
   221				compatible = "ti,am654-secure-proxy";
   222				#mbox-cells = <1>;
   223				reg-names = "target_data", "rt", "scfg";
   224				reg = <0x00 0x32c00000 0x00 0x100000>,
   225				      <0x00 0x32400000 0x00 0x100000>,
   226				      <0x00 0x32800000 0x00 0x100000>;
   227				interrupt-names = "rx_011";
   228				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
   229			};
   230	
   231			smmu0: iommu@36600000 {
   232				compatible = "arm,smmu-v3";
   233				reg = <0x0 0x36600000 0x0 0x100000>;
   234				interrupt-parent = <&gic500>;
   235				interrupts = <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
   236					     <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>;
   237				interrupt-names = "eventq", "gerror";
   238				#iommu-cells = <1>;
   239			};
   240	
   241			hwspinlock: spinlock@30e00000 {
   242				compatible = "ti,am654-hwspinlock";
   243				reg = <0x00 0x30e00000 0x00 0x1000>;
   244				#hwlock-cells = <1>;
   245			};
   246	
   247			mailbox0_cluster0: mailbox@31f80000 {
   248				compatible = "ti,am654-mailbox";
   249				reg = <0x00 0x31f80000 0x00 0x200>;
   250				#mbox-cells = <1>;
   251				ti,mbox-num-users = <4>;
   252				ti,mbox-num-fifos = <16>;
   253				interrupt-parent = <&main_navss_intr>;
   254				status = "disabled";
   255			};
   256	
   257			mailbox0_cluster1: mailbox@31f81000 {
   258				compatible = "ti,am654-mailbox";
   259				reg = <0x00 0x31f81000 0x00 0x200>;
   260				#mbox-cells = <1>;
   261				ti,mbox-num-users = <4>;
   262				ti,mbox-num-fifos = <16>;
   263				interrupt-parent = <&main_navss_intr>;
   264				status = "disabled";
   265			};
   266	
   267			mailbox0_cluster2: mailbox@31f82000 {
   268				compatible = "ti,am654-mailbox";
   269				reg = <0x00 0x31f82000 0x00 0x200>;
   270				#mbox-cells = <1>;
   271				ti,mbox-num-users = <4>;
   272				ti,mbox-num-fifos = <16>;
   273				interrupt-parent = <&main_navss_intr>;
   274				status = "disabled";
   275			};
   276	
   277			mailbox0_cluster3: mailbox@31f83000 {
   278				compatible = "ti,am654-mailbox";
   279				reg = <0x00 0x31f83000 0x00 0x200>;
   280				#mbox-cells = <1>;
   281				ti,mbox-num-users = <4>;
   282				ti,mbox-num-fifos = <16>;
   283				interrupt-parent = <&main_navss_intr>;
   284				status = "disabled";
   285			};
   286	
   287			mailbox0_cluster4: mailbox@31f84000 {
   288				compatible = "ti,am654-mailbox";
   289				reg = <0x00 0x31f84000 0x00 0x200>;
   290				#mbox-cells = <1>;
   291				ti,mbox-num-users = <4>;
   292				ti,mbox-num-fifos = <16>;
   293				interrupt-parent = <&main_navss_intr>;
   294				status = "disabled";
   295			};
   296	
   297			mailbox0_cluster5: mailbox@31f85000 {
   298				compatible = "ti,am654-mailbox";
   299				reg = <0x00 0x31f85000 0x00 0x200>;
   300				#mbox-cells = <1>;
   301				ti,mbox-num-users = <4>;
   302				ti,mbox-num-fifos = <16>;
   303				interrupt-parent = <&main_navss_intr>;
   304				status = "disabled";
   305			};
   306	
   307			mailbox0_cluster6: mailbox@31f86000 {
   308				compatible = "ti,am654-mailbox";
   309				reg = <0x00 0x31f86000 0x00 0x200>;
   310				#mbox-cells = <1>;
   311				ti,mbox-num-users = <4>;
   312				ti,mbox-num-fifos = <16>;
   313				interrupt-parent = <&main_navss_intr>;
   314				status = "disabled";
   315			};
   316	
   317			mailbox0_cluster7: mailbox@31f87000 {
   318				compatible = "ti,am654-mailbox";
   319				reg = <0x00 0x31f87000 0x00 0x200>;
   320				#mbox-cells = <1>;
   321				ti,mbox-num-users = <4>;
   322				ti,mbox-num-fifos = <16>;
   323				interrupt-parent = <&main_navss_intr>;
   324				status = "disabled";
   325			};
   326	
   327			mailbox0_cluster8: mailbox@31f88000 {
   328				compatible = "ti,am654-mailbox";
   329				reg = <0x00 0x31f88000 0x00 0x200>;
   330				#mbox-cells = <1>;
   331				ti,mbox-num-users = <4>;
   332				ti,mbox-num-fifos = <16>;
   333				interrupt-parent = <&main_navss_intr>;
   334				status = "disabled";
   335			};
   336	
   337			mailbox0_cluster9: mailbox@31f89000 {
   338				compatible = "ti,am654-mailbox";
   339				reg = <0x00 0x31f89000 0x00 0x200>;
   340				#mbox-cells = <1>;
   341				ti,mbox-num-users = <4>;
   342				ti,mbox-num-fifos = <16>;
   343				interrupt-parent = <&main_navss_intr>;
   344				status = "disabled";
   345			};
   346	
   347			mailbox0_cluster10: mailbox@31f8a000 {
   348				compatible = "ti,am654-mailbox";
   349				reg = <0x00 0x31f8a000 0x00 0x200>;
   350				#mbox-cells = <1>;
   351				ti,mbox-num-users = <4>;
   352				ti,mbox-num-fifos = <16>;
   353				interrupt-parent = <&main_navss_intr>;
   354				status = "disabled";
   355			};
   356	
   357			mailbox0_cluster11: mailbox@31f8b000 {
   358				compatible = "ti,am654-mailbox";
   359				reg = <0x00 0x31f8b000 0x00 0x200>;
   360				#mbox-cells = <1>;
   361				ti,mbox-num-users = <4>;
   362				ti,mbox-num-fifos = <16>;
   363				interrupt-parent = <&main_navss_intr>;
   364				status = "disabled";
   365			};
   366	
   367			main_ringacc: ringacc@3c000000 {
   368				compatible = "ti,am654-navss-ringacc";
   369				reg = <0x0 0x3c000000 0x0 0x400000>,
   370				      <0x0 0x38000000 0x0 0x400000>,
   371				      <0x0 0x31120000 0x0 0x100>,
   372				      <0x0 0x33000000 0x0 0x40000>,
   373				      <0x0 0x31080000 0x0 0x40000>;
   374				reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target", "cfg";
   375				ti,num-rings = <1024>;
   376				ti,sci-rm-range-gp-rings = <0x1>; /* GP ring range */
   377				ti,sci = <&dmsc>;
   378				ti,sci-dev-id = <211>;
   379				msi-parent = <&main_udmass_inta>;
   380			};
   381	
   382			main_udmap: dma-controller@31150000 {
   383				compatible = "ti,j721e-navss-main-udmap";
   384				reg = <0x0 0x31150000 0x0 0x100>,
   385				      <0x0 0x34000000 0x0 0x100000>,
   386				      <0x0 0x35000000 0x0 0x100000>,
   387				      <0x0 0x30b00000 0x0 0x20000>,
   388				      <0x0 0x30c00000 0x0 0x10000>,
   389				      <0x0 0x30d00000 0x0 0x8000>;
   390				reg-names = "gcfg", "rchanrt", "tchanrt",
   391					    "tchan", "rchan", "rflow";
   392				msi-parent = <&main_udmass_inta>;
   393				#dma-cells = <1>;
   394	
   395				ti,sci = <&dmsc>;
   396				ti,sci-dev-id = <212>;
   397				ti,ringacc = <&main_ringacc>;
   398	
   399				ti,sci-rm-range-tchan = <0x0d>, /* TX_CHAN */
   400							<0x0f>, /* TX_HCHAN */
   401							<0x10>; /* TX_UHCHAN */
   402				ti,sci-rm-range-rchan = <0x0a>, /* RX_CHAN */
   403							<0x0b>, /* RX_HCHAN */
   404							<0x0c>; /* RX_UHCHAN */
   405				ti,sci-rm-range-rflow = <0x00>; /* GP RFLOW */
   406			};
   407	
   408			cpts@310d0000 {
   409				compatible = "ti,j721e-cpts";
   410				reg = <0x0 0x310d0000 0x0 0x400>;
   411				reg-names = "cpts";
   412				clocks = <&k3_clks 201 1>;
   413				clock-names = "cpts";
   414				interrupts-extended = <&main_navss_intr 391>;
   415				interrupt-names = "cpts";
   416				ti,cpts-periodic-outputs = <6>;
   417				ti,cpts-ext-ts-inputs = <8>;
   418			};
   419		};
   420	
   421		cpsw0: ethernet@c000000 {
   422			compatible = "ti,j721e-cpswxg-nuss";
   423			#address-cells = <2>;
   424			#size-cells = <2>;
   425			reg = <0x0 0xc000000 0x0 0x200000>;
   426			reg-names = "cpsw_nuss";
   427			ranges = <0x0 0x0 0x0 0x0c000000 0x0 0x200000>;
   428			clocks = <&k3_clks 19 89>;
   429			clock-names = "fck";
   430			power-domains = <&k3_pds 19 TI_SCI_PD_EXCLUSIVE>;
   431	
   432			dmas = <&main_udmap 0xca00>,
   433			       <&main_udmap 0xca01>,
   434			       <&main_udmap 0xca02>,
   435			       <&main_udmap 0xca03>,
   436			       <&main_udmap 0xca04>,
   437			       <&main_udmap 0xca05>,
   438			       <&main_udmap 0xca06>,
   439			       <&main_udmap 0xca07>,
   440			       <&main_udmap 0x4a00>;
   441			dma-names = "tx0", "tx1", "tx2", "tx3",
   442				    "tx4", "tx5", "tx6", "tx7",
   443				    "rx";
   444	
   445			status = "disabled";
   446	
   447			ethernet-ports {
   448				#address-cells = <1>;
   449				#size-cells = <0>;
   450				cpsw0_port1: port@1 {
   451					reg = <1>;
   452					ti,mac-only;
   453					label = "port1";
   454					status = "disabled";
   455				};
   456	
   457				cpsw0_port2: port@2 {
   458					reg = <2>;
   459					ti,mac-only;
   460					label = "port2";
   461					status = "disabled";
   462				};
   463	
   464				cpsw0_port3: port@3 {
   465					reg = <3>;
   466					ti,mac-only;
   467					label = "port3";
   468					status = "disabled";
   469				};
   470	
   471				cpsw0_port4: port@4 {
   472					reg = <4>;
   473					ti,mac-only;
   474					label = "port4";
   475					status = "disabled";
   476				};
   477	
   478				cpsw0_port5: port@5 {
   479					reg = <5>;
   480					ti,mac-only;
   481					label = "port5";
   482					status = "disabled";
   483				};
   484	
   485				cpsw0_port6: port@6 {
   486					reg = <6>;
   487					ti,mac-only;
   488					label = "port6";
   489					status = "disabled";
   490				};
   491	
   492				cpsw0_port7: port@7 {
   493					reg = <7>;
   494					ti,mac-only;
   495					label = "port7";
   496					status = "disabled";
   497				};
   498	
   499				cpsw0_port8: port@8 {
   500					reg = <8>;
   501					ti,mac-only;
   502					label = "port8";
   503					status = "disabled";
   504				};
   505			};
   506	
   507			cpsw9g_mdio: mdio@f00 {
   508				compatible = "ti,cpsw-mdio","ti,davinci_mdio";
   509				reg = <0x0 0xf00 0x0 0x100>;
   510				#address-cells = <1>;
   511				#size-cells = <0>;
   512				clocks = <&k3_clks 19 89>;
   513				clock-names = "fck";
   514				bus_freq = <1000000>;
   515				status = "disabled";
   516			};
   517	
   518			cpts@3d000 {
   519				compatible = "ti,j721e-cpts";
   520				reg = <0x0 0x3d000 0x0 0x400>;
   521				clocks = <&k3_clks 19 16>;
   522				clock-names = "cpts";
   523				interrupts-extended = <&gic500 GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
   524				interrupt-names = "cpts";
   525				ti,cpts-ext-ts-inputs = <4>;
   526				ti,cpts-periodic-outputs = <2>;
   527			};
   528		};
   529	
   530		main_crypto: crypto@4e00000 {
   531			compatible = "ti,j721e-sa2ul";
   532			reg = <0x0 0x4e00000 0x0 0x1200>;
   533			power-domains = <&k3_pds 264 TI_SCI_PD_EXCLUSIVE>;
   534			#address-cells = <2>;
   535			#size-cells = <2>;
   536			ranges = <0x0 0x04e00000 0x00 0x04e00000 0x0 0x30000>;
   537	
   538			dmas = <&main_udmap 0xc000>, <&main_udmap 0x4000>,
   539					<&main_udmap 0x4001>;
   540			dma-names = "tx", "rx1", "rx2";
   541	
   542			rng: rng@4e10000 {
   543				compatible = "inside-secure,safexcel-eip76";
   544				reg = <0x0 0x4e10000 0x0 0x7d>;
   545				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
   546			};
   547		};
   548	
   549		main_pmx0: pinctrl@11c000 {
   550			compatible = "pinctrl-single";
   551			/* Proxy 0 addressing */
   552			reg = <0x0 0x11c000 0x0 0x2b4>;
   553			#pinctrl-cells = <1>;
   554			pinctrl-single,register-width = <32>;
   555			pinctrl-single,function-mask = <0xffffffff>;
   556		};
   557	
   558		/* TIMERIO pad input CTRLMMR_TIMER*_CTRL registers */
   559		main_timerio_input: pinctrl@104200 {
   560			compatible = "pinctrl-single";
   561			reg = <0x00 0x104200 0x00 0x50>;
   562			#pinctrl-cells = <1>;
   563			pinctrl-single,register-width = <32>;
   564			pinctrl-single,function-mask = <0x00000007>;
   565		};
   566	
   567		/* TIMERIO pad output CTCTRLMMR_TIMERIO*_CTRL registers */
   568		main_timerio_output: pinctrl@104280 {
   569			compatible = "pinctrl-single";
   570			reg = <0x00 0x104280 0x00 0x20>;
   571			#pinctrl-cells = <1>;
   572			pinctrl-single,register-width = <32>;
   573			pinctrl-single,function-mask = <0x0000001f>;
   574		};
   575	
   576		ti_csi2rx0: ticsi2rx@4500000 {
   577			compatible = "ti,j721e-csi2rx-shim";
   578			reg = <0x0 0x4500000 0x0 0x1000>;
   579			ranges;
   580			#address-cells = <2>;
   581			#size-cells = <2>;
   582			dmas = <&main_udmap 0x4940>;
   583			dma-names = "rx0";
   584			power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
   585			status = "disabled";
   586	
   587			cdns_csi2rx0: csi-bridge@4504000 {
   588				compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
   589				reg = <0x0 0x4504000 0x0 0x1000>;
   590				clocks = <&k3_clks 26 2>, <&k3_clks 26 0>, <&k3_clks 26 2>,
   591					<&k3_clks 26 2>, <&k3_clks 26 3>, <&k3_clks 26 3>;
   592				clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
   593					"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
   594				phys = <&dphy0>;
   595				phy-names = "dphy";
   596	
   597				ports {
   598					#address-cells = <1>;
   599					#size-cells = <0>;
   600	
   601					csi0_port0: port@0 {
   602						reg = <0>;
   603						status = "disabled";
   604					};
   605	
   606					csi0_port1: port@1 {
   607						reg = <1>;
   608						status = "disabled";
   609					};
   610	
   611					csi0_port2: port@2 {
   612						reg = <2>;
   613						status = "disabled";
   614					};
   615	
   616					csi0_port3: port@3 {
   617						reg = <3>;
   618						status = "disabled";
   619					};
   620	
   621					csi0_port4: port@4 {
   622						reg = <4>;
   623						status = "disabled";
   624					};
   625				};
   626			};
   627		};
   628	
   629		ti_csi2rx1: ticsi2rx@4510000 {
   630			compatible = "ti,j721e-csi2rx-shim";
   631			reg = <0x0 0x4510000 0x0 0x1000>;
   632			ranges;
   633			#address-cells = <2>;
   634			#size-cells = <2>;
   635			dmas = <&main_udmap 0x4960>;
   636			dma-names = "rx0";
   637			power-domains = <&k3_pds 27 TI_SCI_PD_EXCLUSIVE>;
   638			status = "disabled";
   639	
   640			cdns_csi2rx1: csi-bridge@4514000 {
   641				compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
   642				reg = <0x0 0x4514000 0x0 0x1000>;
   643				clocks = <&k3_clks 27 2>, <&k3_clks 27 0>, <&k3_clks 27 2>,
   644					 <&k3_clks 27 2>, <&k3_clks 27 3>, <&k3_clks 27 3>;
   645				clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
   646					      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
   647				phys = <&dphy1>;
   648				phy-names = "dphy";
   649	
   650				ports {
   651					#address-cells = <1>;
   652					#size-cells = <0>;
   653	
   654					csi1_port0: port@0 {
   655						reg = <0>;
   656						status = "disabled";
   657					};
   658	
   659					csi1_port1: port@1 {
   660						reg = <1>;
   661						status = "disabled";
   662					};
   663	
   664					csi1_port2: port@2 {
   665						reg = <2>;
   666						status = "disabled";
   667					};
   668	
   669					csi1_port3: port@3 {
   670						reg = <3>;
   671						status = "disabled";
   672					};
   673	
   674					csi1_port4: port@4 {
   675						reg = <4>;
   676						status = "disabled";
   677					};
   678				};
   679			};
   680		};
   681	
   682		dphy0: phy@4580000 {
   683			compatible = "cdns,dphy-rx";
   684			reg = <0x0 0x4580000 0x0 0x1100>;
   685			#phy-cells = <0>;
   686			power-domains = <&k3_pds 147 TI_SCI_PD_EXCLUSIVE>;
   687			status = "disabled";
   688		};
   689	
   690		dphy1: phy@4590000 {
   691			compatible = "cdns,dphy-rx";
   692			reg = <0x0 0x4590000 0x0 0x1100>;
   693			#phy-cells = <0>;
   694			power-domains = <&k3_pds 148 TI_SCI_PD_EXCLUSIVE>;
   695			status = "disabled";
   696		};
   697	
   698		serdes_wiz0: wiz@5000000 {
   699			compatible = "ti,j721e-wiz-16g";
   700			#address-cells = <1>;
   701			#size-cells = <1>;
   702			power-domains = <&k3_pds 292 TI_SCI_PD_EXCLUSIVE>;
   703			clocks = <&k3_clks 292 5>, <&k3_clks 292 11>, <&cmn_refclk>;
   704			clock-names = "fck", "core_ref_clk", "ext_ref_clk";
   705			assigned-clocks = <&k3_clks 292 11>, <&k3_clks 292 0>;
   706			assigned-clock-parents = <&k3_clks 292 15>, <&k3_clks 292 4>;
   707			num-lanes = <2>;
   708			#reset-cells = <1>;
   709			ranges = <0x5000000 0x0 0x5000000 0x10000>;
   710	
   711			wiz0_pll0_refclk: pll0-refclk {
   712				clocks = <&k3_clks 292 11>, <&cmn_refclk>;
   713				#clock-cells = <0>;
   714				assigned-clocks = <&wiz0_pll0_refclk>;
   715				assigned-clock-parents = <&k3_clks 292 11>;
   716			};
   717	
   718			wiz0_pll1_refclk: pll1-refclk {
   719				clocks = <&k3_clks 292 0>, <&cmn_refclk1>;
   720				#clock-cells = <0>;
   721				assigned-clocks = <&wiz0_pll1_refclk>;
   722				assigned-clock-parents = <&k3_clks 292 0>;
   723			};
   724	
   725			wiz0_refclk_dig: refclk-dig {
   726				clocks = <&k3_clks 292 11>, <&k3_clks 292 0>, <&cmn_refclk>, <&cmn_refclk1>;
   727				#clock-cells = <0>;
   728				assigned-clocks = <&wiz0_refclk_dig>;
   729				assigned-clock-parents = <&k3_clks 292 11>;
   730			};
   731	
   732			wiz0_cmn_refclk_dig_div: cmn-refclk-dig-div {
   733				clocks = <&wiz0_refclk_dig>;
   734				#clock-cells = <0>;
   735			};
   736	
   737			wiz0_cmn_refclk1_dig_div: cmn-refclk1-dig-div {
   738				clocks = <&wiz0_pll1_refclk>;
   739				#clock-cells = <0>;
   740			};
   741	
   742			serdes0: serdes@5000000 {
   743				compatible = "ti,sierra-phy-t0";
   744				reg-names = "serdes";
   745				reg = <0x5000000 0x10000>;
   746				#address-cells = <1>;
   747				#size-cells = <0>;
   748				#clock-cells = <1>;
   749				resets = <&serdes_wiz0 0>;
   750				reset-names = "sierra_reset";
   751				clocks = <&wiz0_cmn_refclk_dig_div>, <&wiz0_cmn_refclk1_dig_div>,
   752					 <&wiz0_pll0_refclk>, <&wiz0_pll1_refclk>;
   753				clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div",
   754					      "pll0_refclk", "pll1_refclk";
   755			};
   756		};
   757	
   758		serdes_wiz1: wiz@5010000 {
   759			compatible = "ti,j721e-wiz-16g";
   760			#address-cells = <1>;
   761			#size-cells = <1>;
   762			power-domains = <&k3_pds 293 TI_SCI_PD_EXCLUSIVE>;
   763			clocks = <&k3_clks 293 5>, <&k3_clks 293 13>, <&cmn_refclk>;
   764			clock-names = "fck", "core_ref_clk", "ext_ref_clk";
   765			assigned-clocks = <&k3_clks 293 13>, <&k3_clks 293 0>;
   766			assigned-clock-parents = <&k3_clks 293 17>, <&k3_clks 293 4>;
   767			num-lanes = <2>;
   768			#reset-cells = <1>;
   769			ranges = <0x5010000 0x0 0x5010000 0x10000>;
   770	
   771			wiz1_pll0_refclk: pll0-refclk {
   772				clocks = <&k3_clks 293 13>, <&cmn_refclk>;
   773				#clock-cells = <0>;
   774				assigned-clocks = <&wiz1_pll0_refclk>;
   775				assigned-clock-parents = <&k3_clks 293 13>;
   776			};
   777	
   778			wiz1_pll1_refclk: pll1-refclk {
   779				clocks = <&k3_clks 293 0>, <&cmn_refclk1>;
   780				#clock-cells = <0>;
   781				assigned-clocks = <&wiz1_pll1_refclk>;
   782				assigned-clock-parents = <&k3_clks 293 0>;
   783			};
   784	
   785			wiz1_refclk_dig: refclk-dig {
   786				clocks = <&k3_clks 293 13>, <&k3_clks 293 0>, <&cmn_refclk>, <&cmn_refclk1>;
   787				#clock-cells = <0>;
   788				assigned-clocks = <&wiz1_refclk_dig>;
   789				assigned-clock-parents = <&k3_clks 293 13>;
   790			};
   791	
   792			wiz1_cmn_refclk_dig_div: cmn-refclk-dig-div {
   793				clocks = <&wiz1_refclk_dig>;
   794				#clock-cells = <0>;
   795			};
   796	
   797			wiz1_cmn_refclk1_dig_div: cmn-refclk1-dig-div {
   798				clocks = <&wiz1_pll1_refclk>;
   799				#clock-cells = <0>;
   800			};
   801	
   802			serdes1: serdes@5010000 {
   803				compatible = "ti,sierra-phy-t0";
   804				reg-names = "serdes";
   805				reg = <0x5010000 0x10000>;
   806				#address-cells = <1>;
   807				#size-cells = <0>;
   808				#clock-cells = <1>;
   809				resets = <&serdes_wiz1 0>;
   810				reset-names = "sierra_reset";
   811				clocks = <&wiz1_cmn_refclk_dig_div>, <&wiz1_cmn_refclk1_dig_div>,
   812					 <&wiz1_pll0_refclk>, <&wiz1_pll1_refclk>;
   813				clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div",
   814					      "pll0_refclk", "pll1_refclk";
   815			};
   816		};
   817	
   818		serdes_wiz2: wiz@5020000 {
   819			compatible = "ti,j721e-wiz-16g";
   820			#address-cells = <1>;
   821			#size-cells = <1>;
   822			power-domains = <&k3_pds 294 TI_SCI_PD_EXCLUSIVE>;
   823			clocks = <&k3_clks 294 5>, <&k3_clks 294 11>, <&cmn_refclk>;
   824			clock-names = "fck", "core_ref_clk", "ext_ref_clk";
   825			assigned-clocks = <&k3_clks 294 11>, <&k3_clks 294 0>;
   826			assigned-clock-parents = <&k3_clks 294 15>, <&k3_clks 294 4>;
   827			num-lanes = <2>;
   828			#reset-cells = <1>;
   829			ranges = <0x5020000 0x0 0x5020000 0x10000>;
   830	
   831			wiz2_pll0_refclk: pll0-refclk {
   832				clocks = <&k3_clks 294 11>, <&cmn_refclk>;
   833				#clock-cells = <0>;
   834				assigned-clocks = <&wiz2_pll0_refclk>;
   835				assigned-clock-parents = <&k3_clks 294 11>;
   836			};
   837	
   838			wiz2_pll1_refclk: pll1-refclk {
   839				clocks = <&k3_clks 294 0>, <&cmn_refclk1>;
   840				#clock-cells = <0>;
   841				assigned-clocks = <&wiz2_pll1_refclk>;
   842				assigned-clock-parents = <&k3_clks 294 0>;
   843			};
   844	
   845			wiz2_refclk_dig: refclk-dig {
   846				clocks = <&k3_clks 294 11>, <&k3_clks 294 0>, <&cmn_refclk>, <&cmn_refclk1>;
   847				#clock-cells = <0>;
   848				assigned-clocks = <&wiz2_refclk_dig>;
   849				assigned-clock-parents = <&k3_clks 294 11>;
   850			};
   851	
   852			wiz2_cmn_refclk_dig_div: cmn-refclk-dig-div {
   853				clocks = <&wiz2_refclk_dig>;
   854				#clock-cells = <0>;
   855			};
   856	
   857			wiz2_cmn_refclk1_dig_div: cmn-refclk1-dig-div {
   858				clocks = <&wiz2_pll1_refclk>;
   859				#clock-cells = <0>;
   860			};
   861	
   862			serdes2: serdes@5020000 {
   863				compatible = "ti,sierra-phy-t0";
   864				reg-names = "serdes";
   865				reg = <0x5020000 0x10000>;
   866				#address-cells = <1>;
   867				#size-cells = <0>;
   868				#clock-cells = <1>;
   869				resets = <&serdes_wiz2 0>;
   870				reset-names = "sierra_reset";
   871				clocks = <&wiz2_cmn_refclk_dig_div>, <&wiz2_cmn_refclk1_dig_div>,
   872					 <&wiz2_pll0_refclk>, <&wiz2_pll1_refclk>;
   873				clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div",
   874					      "pll0_refclk", "pll1_refclk";
   875			};
   876		};
   877	
   878		serdes_wiz3: wiz@5030000 {
   879			compatible = "ti,j721e-wiz-16g";
   880			#address-cells = <1>;
   881			#size-cells = <1>;
   882			power-domains = <&k3_pds 295 TI_SCI_PD_EXCLUSIVE>;
   883			clocks = <&k3_clks 295 5>, <&k3_clks 295 9>, <&cmn_refclk>;
   884			clock-names = "fck", "core_ref_clk", "ext_ref_clk";
   885			assigned-clocks = <&k3_clks 295 9>, <&k3_clks 295 0>;
   886			assigned-clock-parents = <&k3_clks 295 13>, <&k3_clks 295 4>;
   887			num-lanes = <2>;
   888			#reset-cells = <1>;
   889			ranges = <0x5030000 0x0 0x5030000 0x10000>;
   890	
   891			wiz3_pll0_refclk: pll0-refclk {
   892				clocks = <&k3_clks 295 9>, <&cmn_refclk>;
   893				#clock-cells = <0>;
   894				assigned-clocks = <&wiz3_pll0_refclk>;
   895				assigned-clock-parents = <&k3_clks 295 9>;
   896			};
   897	
   898			wiz3_pll1_refclk: pll1-refclk {
   899				clocks = <&k3_clks 295 0>, <&cmn_refclk1>;
   900				#clock-cells = <0>;
   901				assigned-clocks = <&wiz3_pll1_refclk>;
   902				assigned-clock-parents = <&k3_clks 295 0>;
   903			};
   904	
   905			wiz3_refclk_dig: refclk-dig {
   906				clocks = <&k3_clks 295 9>, <&k3_clks 295 0>, <&cmn_refclk>, <&cmn_refclk1>;
   907				#clock-cells = <0>;
   908				assigned-clocks = <&wiz3_refclk_dig>;
   909				assigned-clock-parents = <&k3_clks 295 9>;
   910			};
   911	
   912			wiz3_cmn_refclk_dig_div: cmn-refclk-dig-div {
   913				clocks = <&wiz3_refclk_dig>;
   914				#clock-cells = <0>;
   915			};
   916	
   917			wiz3_cmn_refclk1_dig_div: cmn-refclk1-dig-div {
   918				clocks = <&wiz3_pll1_refclk>;
   919				#clock-cells = <0>;
   920			};
   921	
   922			serdes3: serdes@5030000 {
   923				compatible = "ti,sierra-phy-t0";
   924				reg-names = "serdes";
   925				reg = <0x5030000 0x10000>;
   926				#address-cells = <1>;
   927				#size-cells = <0>;
   928				#clock-cells = <1>;
   929				resets = <&serdes_wiz3 0>;
   930				reset-names = "sierra_reset";
   931				clocks = <&wiz3_cmn_refclk_dig_div>, <&wiz3_cmn_refclk1_dig_div>,
   932					 <&wiz3_pll0_refclk>, <&wiz3_pll1_refclk>;
   933				clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div",
   934					      "pll0_refclk", "pll1_refclk";
   935			};
   936		};
   937	
   938		pcie0_rc: pcie@2900000 {
   939			compatible = "ti,j721e-pcie-host";
   940			reg = <0x00 0x02900000 0x00 0x1000>,
   941			      <0x00 0x02907000 0x00 0x400>,
   942			      <0x00 0x0d000000 0x00 0x00800000>,
   943			      <0x00 0x10000000 0x00 0x00001000>;
   944			reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
   945			interrupt-names = "link_state";
   946			interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
   947			device_type = "pci";
   948			ti,syscon-pcie-ctrl = <&scm_conf 0x4070>;
   949			max-link-speed = <3>;
   950			num-lanes = <2>;
   951			power-domains = <&k3_pds 239 TI_SCI_PD_EXCLUSIVE>;
   952			clocks = <&k3_clks 239 1>;
   953			clock-names = "fck";
   954			#address-cells = <3>;
   955			#size-cells = <2>;
   956			bus-range = <0x0 0xff>;
   957			vendor-id = <0x104c>;
   958			device-id = <0xb00d>;
   959			msi-map = <0x0 &gic_its 0x0 0x10000>;
   960			dma-coherent;
   961			ranges = <0x01000000 0x0 0x10001000 0x0 0x10001000 0x0 0x0010000>,
   962				 <0x02000000 0x0 0x10011000 0x0 0x10011000 0x0 0x7fef000>;
   963			dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
   964			status = "disabled";
   965		};
   966	
   967		pcie1_rc: pcie@2910000 {
   968			compatible = "ti,j721e-pcie-host";
   969			reg = <0x00 0x02910000 0x00 0x1000>,
   970			      <0x00 0x02917000 0x00 0x400>,
   971			      <0x00 0x0d800000 0x00 0x00800000>,
   972			      <0x00 0x18000000 0x00 0x00001000>;
   973			reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
   974			interrupt-names = "link_state";
   975			interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
   976			device_type = "pci";
   977			ti,syscon-pcie-ctrl = <&scm_conf 0x4074>;
   978			max-link-speed = <3>;
   979			num-lanes = <2>;
   980			power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
   981			clocks = <&k3_clks 240 1>;
   982			clock-names = "fck";
   983			#address-cells = <3>;
   984			#size-cells = <2>;
   985			bus-range = <0x0 0xff>;
   986			vendor-id = <0x104c>;
   987			device-id = <0xb00d>;
   988			msi-map = <0x0 &gic_its 0x10000 0x10000>;
   989			dma-coherent;
   990			ranges = <0x01000000 0x0 0x18001000 0x0 0x18001000 0x0 0x0010000>,
   991				 <0x02000000 0x0 0x18011000 0x0 0x18011000 0x0 0x7fef000>;
   992			dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
   993			status = "disabled";
   994		};
   995	
   996		pcie2_rc: pcie@2920000 {
   997			compatible = "ti,j721e-pcie-host";
   998			reg = <0x00 0x02920000 0x00 0x1000>,
   999			      <0x00 0x02927000 0x00 0x400>,
  1000			      <0x00 0x0e000000 0x00 0x00800000>,
  1001			      <0x44 0x00000000 0x00 0x00001000>;
  1002			reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
  1003			interrupt-names = "link_state";
  1004			interrupts = <GIC_SPI 342 IRQ_TYPE_EDGE_RISING>;
  1005			device_type = "pci";
  1006			ti,syscon-pcie-ctrl = <&scm_conf 0x4078>;
  1007			max-link-speed = <3>;
  1008			num-lanes = <2>;
  1009			power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
  1010			clocks = <&k3_clks 241 1>;
  1011			clock-names = "fck";
  1012			#address-cells = <3>;
  1013			#size-cells = <2>;
  1014			bus-range = <0x0 0xff>;
  1015			vendor-id = <0x104c>;
  1016			device-id = <0xb00d>;
  1017			msi-map = <0x0 &gic_its 0x20000 0x10000>;
  1018			dma-coherent;
  1019			ranges = <0x01000000 0x0 0x00001000 0x44 0x00001000 0x0 0x0010000>,
  1020				 <0x02000000 0x0 0x00011000 0x44 0x00011000 0x0 0x7fef000>;
  1021			dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
  1022			status = "disabled";
  1023		};
  1024	
  1025		pcie3_rc: pcie@2930000 {
  1026			compatible = "ti,j721e-pcie-host";
  1027			reg = <0x00 0x02930000 0x00 0x1000>,
  1028			      <0x00 0x02937000 0x00 0x400>,
  1029			      <0x00 0x0e800000 0x00 0x00800000>,
  1030			      <0x44 0x10000000 0x00 0x00001000>;
  1031			reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
  1032			interrupt-names = "link_state";
  1033			interrupts = <GIC_SPI 354 IRQ_TYPE_EDGE_RISING>;
  1034			device_type = "pci";
  1035			ti,syscon-pcie-ctrl = <&scm_conf 0x407c>;
  1036			max-link-speed = <3>;
  1037			num-lanes = <2>;
  1038			power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
  1039			clocks = <&k3_clks 242 1>;
  1040			clock-names = "fck";
  1041			#address-cells = <3>;
  1042			#size-cells = <2>;
  1043			bus-range = <0x0 0xff>;
  1044			vendor-id = <0x104c>;
  1045			device-id = <0xb00d>;
  1046			msi-map = <0x0 &gic_its 0x30000 0x10000>;
  1047			dma-coherent;
  1048			ranges = <0x01000000 0x0 0x00001000 0x44 0x10001000 0x0 0x0010000>,
  1049				 <0x02000000 0x0 0x00011000 0x44 0x10011000 0x0 0x7fef000>;
  1050			dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
  1051			status = "disabled";
  1052		};
  1053	
  1054		serdes_wiz4: wiz@5050000 {
  1055			compatible = "ti,am64-wiz-10g";
  1056			#address-cells = <1>;
  1057			#size-cells = <1>;
  1058			power-domains = <&k3_pds 297 TI_SCI_PD_EXCLUSIVE>;
  1059			clocks = <&k3_clks 297 1>, <&k3_clks 297 9>, <&cmn_refclk>;
  1060			clock-names = "fck", "core_ref_clk", "ext_ref_clk";
  1061			assigned-clocks = <&k3_clks 297 9>;
  1062			assigned-clock-parents = <&k3_clks 297 10>;
  1063			assigned-clock-rates = <19200000>;
  1064			num-lanes = <4>;
  1065			#reset-cells = <1>;
  1066			#clock-cells = <1>;
  1067			ranges = <0x05050000 0x00 0x05050000 0x010000>,
  1068				<0x0a030a00 0x00 0x0a030a00 0x40>;
  1069	
  1070			serdes4: serdes@5050000 {
  1071				/*
  1072				 * Note: we also map DPTX PHY registers as the Torrent
  1073				 * needs to manage those.
  1074				 */
  1075				compatible = "ti,j721e-serdes-10g";
  1076				reg = <0x05050000 0x010000>,
  1077				      <0x0a030a00 0x40>; /* DPTX PHY */
  1078				reg-names = "torrent_phy", "dptx_phy";
  1079	
  1080				resets = <&serdes_wiz4 0>;
  1081				reset-names = "torrent_reset";
  1082				clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>;
  1083				clock-names = "refclk";
  1084				assigned-clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
  1085						  <&serdes_wiz4 TI_WIZ_PLL1_REFCLK>,
  1086						  <&serdes_wiz4 TI_WIZ_REFCLK_DIG>;
  1087				assigned-clock-parents = <&k3_clks 297 9>,
  1088							 <&k3_clks 297 9>,
  1089							 <&k3_clks 297 9>;
  1090				#address-cells = <1>;
  1091				#size-cells = <0>;
  1092			};
  1093		};
  1094	
  1095		main_timer0: timer@2400000 {
  1096			compatible = "ti,am654-timer";
  1097			reg = <0x00 0x2400000 0x00 0x400>;
  1098			interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
  1099			clocks = <&k3_clks 49 1>;
  1100			clock-names = "fck";
  1101			assigned-clocks = <&k3_clks 49 1>;
  1102			assigned-clock-parents = <&k3_clks 49 2>;
  1103			power-domains = <&k3_pds 49 TI_SCI_PD_EXCLUSIVE>;
  1104			ti,timer-pwm;
  1105		};
  1106	
  1107		main_timer1: timer@2410000 {
  1108			compatible = "ti,am654-timer";
  1109			reg = <0x00 0x2410000 0x00 0x400>;
  1110			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
  1111			clocks = <&k3_clks 50 1>;
  1112			clock-names = "fck";
  1113			assigned-clocks = <&k3_clks 50 1>, <&k3_clks 327 0>;
  1114			assigned-clock-parents = <&k3_clks 50 2>, <&k3_clks 327 1>;
  1115			power-domains = <&k3_pds 50 TI_SCI_PD_EXCLUSIVE>;
  1116			ti,timer-pwm;
  1117		};
  1118	
  1119		main_timer2: timer@2420000 {
  1120			compatible = "ti,am654-timer";
  1121			reg = <0x00 0x2420000 0x00 0x400>;
  1122			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
  1123			clocks = <&k3_clks 51 1>;
  1124			clock-names = "fck";
  1125			assigned-clocks = <&k3_clks 51 1>;
  1126			assigned-clock-parents = <&k3_clks 51 2>;
  1127			power-domains = <&k3_pds 51 TI_SCI_PD_EXCLUSIVE>;
  1128			ti,timer-pwm;
  1129		};
  1130	
  1131		main_timer3: timer@2430000 {
  1132			compatible = "ti,am654-timer";
  1133			reg = <0x00 0x2430000 0x00 0x400>;
  1134			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
  1135			clocks = <&k3_clks 52 1>;
  1136			clock-names = "fck";
  1137			assigned-clocks = <&k3_clks 52 1>, <&k3_clks 328 0>;
  1138			assigned-clock-parents = <&k3_clks 52 2>, <&k3_clks 328 1>;
  1139			power-domains = <&k3_pds 52 TI_SCI_PD_EXCLUSIVE>;
  1140			ti,timer-pwm;
  1141		};
  1142	
  1143		main_timer4: timer@2440000 {
  1144			compatible = "ti,am654-timer";
  1145			reg = <0x00 0x2440000 0x00 0x400>;
  1146			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
  1147			clocks = <&k3_clks 53 1>;
  1148			clock-names = "fck";
  1149			assigned-clocks = <&k3_clks 53 1>;
  1150			assigned-clock-parents = <&k3_clks 53 2>;
  1151			power-domains = <&k3_pds 53 TI_SCI_PD_EXCLUSIVE>;
  1152			ti,timer-pwm;
  1153		};
  1154	
  1155		main_timer5: timer@2450000 {
  1156			compatible = "ti,am654-timer";
  1157			reg = <0x00 0x2450000 0x00 0x400>;
  1158			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
  1159			clocks = <&k3_clks 54 1>;
  1160			clock-names = "fck";
  1161			assigned-clocks = <&k3_clks 54 1>, <&k3_clks 329 0>;
  1162			assigned-clock-parents = <&k3_clks 54 2>, <&k3_clks 329 1>;
  1163			power-domains = <&k3_pds 54 TI_SCI_PD_EXCLUSIVE>;
  1164			ti,timer-pwm;
  1165		};
  1166	
  1167		main_timer6: timer@2460000 {
  1168			compatible = "ti,am654-timer";
  1169			reg = <0x00 0x2460000 0x00 0x400>;
  1170			interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
  1171			clocks = <&k3_clks 55 1>;
  1172			clock-names = "fck";
  1173			assigned-clocks = <&k3_clks 55 1>;
  1174			assigned-clock-parents = <&k3_clks 55 2>;
  1175			power-domains = <&k3_pds 55 TI_SCI_PD_EXCLUSIVE>;
  1176			ti,timer-pwm;
  1177		};
  1178	
  1179		main_timer7: timer@2470000 {
  1180			compatible = "ti,am654-timer";
  1181			reg = <0x00 0x2470000 0x00 0x400>;
  1182			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
  1183			clocks = <&k3_clks 57 1>;
  1184			clock-names = "fck";
  1185			assigned-clocks = <&k3_clks 57 1>, <&k3_clks 330 0>;
  1186			assigned-clock-parents = <&k3_clks 57 2>, <&k3_clks 330 1>;
  1187			power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
  1188			ti,timer-pwm;
  1189		};
  1190	
  1191		main_timer8: timer@2480000 {
  1192			compatible = "ti,am654-timer";
  1193			reg = <0x00 0x2480000 0x00 0x400>;
  1194			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
  1195			clocks = <&k3_clks 58 1>;
  1196			clock-names = "fck";
  1197			assigned-clocks = <&k3_clks 58 1>;
  1198			assigned-clock-parents = <&k3_clks 58 2>;
  1199			power-domains = <&k3_pds 58 TI_SCI_PD_EXCLUSIVE>;
  1200			ti,timer-pwm;
  1201		};
  1202	
  1203		main_timer9: timer@2490000 {
  1204			compatible = "ti,am654-timer";
  1205			reg = <0x00 0x2490000 0x00 0x400>;
  1206			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
  1207			clocks = <&k3_clks 59 1>;
  1208			clock-names = "fck";
  1209			assigned-clocks = <&k3_clks 59 1>, <&k3_clks 331 0>;
  1210			assigned-clock-parents = <&k3_clks 59 2>, <&k3_clks 331 1>;
  1211			power-domains = <&k3_pds 59 TI_SCI_PD_EXCLUSIVE>;
  1212			ti,timer-pwm;
  1213		};
  1214	
  1215		main_timer10: timer@24a0000 {
  1216			compatible = "ti,am654-timer";
  1217			reg = <0x00 0x24a0000 0x00 0x400>;
  1218			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
  1219			clocks = <&k3_clks 60 1>;
  1220			clock-names = "fck";
  1221			assigned-clocks = <&k3_clks 60 1>;
  1222			assigned-clock-parents = <&k3_clks 60 2>;
  1223			power-domains = <&k3_pds 60 TI_SCI_PD_EXCLUSIVE>;
  1224			ti,timer-pwm;
  1225		};
  1226	
  1227		main_timer11: timer@24b0000 {
  1228			compatible = "ti,am654-timer";
  1229			reg = <0x00 0x24b0000 0x00 0x400>;
  1230			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
  1231			clocks = <&k3_clks 62 1>;
  1232			clock-names = "fck";
  1233			assigned-clocks = <&k3_clks 62 1>, <&k3_clks 332 0>;
  1234			assigned-clock-parents = <&k3_clks 62 2>, <&k3_clks 332 1>;
  1235			power-domains = <&k3_pds 62 TI_SCI_PD_EXCLUSIVE>;
  1236			ti,timer-pwm;
  1237		};
  1238	
  1239		main_timer12: timer@24c0000 {
  1240			compatible = "ti,am654-timer";
  1241			reg = <0x00 0x24c0000 0x00 0x400>;
  1242			interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>;
  1243			clocks = <&k3_clks 63 1>;
  1244			clock-names = "fck";
  1245			assigned-clocks = <&k3_clks 63 1>;
  1246			assigned-clock-parents = <&k3_clks 63 2>;
  1247			power-domains = <&k3_pds 63 TI_SCI_PD_EXCLUSIVE>;
  1248			ti,timer-pwm;
  1249		};
  1250	
  1251		main_timer13: timer@24d0000 {
  1252			compatible = "ti,am654-timer";
  1253			reg = <0x00 0x24d0000 0x00 0x400>;
  1254			interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>;
  1255			clocks = <&k3_clks 64 1>;
  1256			clock-names = "fck";
  1257			assigned-clocks = <&k3_clks 64 1>, <&k3_clks 333 0>;
  1258			assigned-clock-parents = <&k3_clks 64 2>, <&k3_clks 333 1>;
  1259			power-domains = <&k3_pds 64 TI_SCI_PD_EXCLUSIVE>;
  1260			ti,timer-pwm;
  1261		};
  1262	
  1263		main_timer14: timer@24e0000 {
  1264			compatible = "ti,am654-timer";
  1265			reg = <0x00 0x24e0000 0x00 0x400>;
  1266			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
  1267			clocks = <&k3_clks 65 1>;
  1268			clock-names = "fck";
  1269			assigned-clocks = <&k3_clks 65 1>;
  1270			assigned-clock-parents = <&k3_clks 65 2>;
  1271			power-domains = <&k3_pds 65 TI_SCI_PD_EXCLUSIVE>;
  1272			ti,timer-pwm;
  1273		};
  1274	
  1275		main_timer15: timer@24f0000 {
  1276			compatible = "ti,am654-timer";
  1277			reg = <0x00 0x24f0000 0x00 0x400>;
  1278			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
  1279			clocks = <&k3_clks 66 1>;
  1280			clock-names = "fck";
  1281			assigned-clocks = <&k3_clks 66 1>, <&k3_clks 334 0>;
  1282			assigned-clock-parents = <&k3_clks 66 2>, <&k3_clks 334 1>;
  1283			power-domains = <&k3_pds 66 TI_SCI_PD_EXCLUSIVE>;
  1284			ti,timer-pwm;
  1285		};
  1286	
  1287		main_timer16: timer@2500000 {
  1288			compatible = "ti,am654-timer";
  1289			reg = <0x00 0x2500000 0x00 0x400>;
  1290			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
  1291			clocks = <&k3_clks 67 1>;
  1292			clock-names = "fck";
  1293			assigned-clocks = <&k3_clks 67 1>;
  1294			assigned-clock-parents = <&k3_clks 67 2>;
  1295			power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
  1296			ti,timer-pwm;
  1297		};
  1298	
  1299		main_timer17: timer@2510000 {
  1300			compatible = "ti,am654-timer";
  1301			reg = <0x00 0x2510000 0x00 0x400>;
  1302			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
  1303			clocks = <&k3_clks 68 1>;
  1304			clock-names = "fck";
  1305			assigned-clocks = <&k3_clks 68 1>, <&k3_clks 335 0>;
  1306			assigned-clock-parents = <&k3_clks 68 2>, <&k3_clks 335 1>;
  1307			power-domains = <&k3_pds 68 TI_SCI_PD_EXCLUSIVE>;
  1308			ti,timer-pwm;
  1309		};
  1310	
  1311		main_timer18: timer@2520000 {
  1312			compatible = "ti,am654-timer";
  1313			reg = <0x00 0x2520000 0x00 0x400>;
  1314			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
  1315			clocks = <&k3_clks 69 1>;
  1316			clock-names = "fck";
  1317			assigned-clocks = <&k3_clks 69 1>;
  1318			assigned-clock-parents = <&k3_clks 69 2>;
  1319			power-domains = <&k3_pds 69 TI_SCI_PD_EXCLUSIVE>;
  1320			ti,timer-pwm;
  1321		};
  1322	
  1323		main_timer19: timer@2530000 {
  1324			compatible = "ti,am654-timer";
  1325			reg = <0x00 0x2530000 0x00 0x400>;
  1326			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
  1327			clocks = <&k3_clks 70 1>;
  1328			clock-names = "fck";
  1329			assigned-clocks = <&k3_clks 70 1>, <&k3_clks 336 0>;
  1330			assigned-clock-parents = <&k3_clks 70 2>, <&k3_clks 336 1>;
  1331			power-domains = <&k3_pds 70 TI_SCI_PD_EXCLUSIVE>;
  1332			ti,timer-pwm;
  1333		};
  1334	
  1335		main_uart0: serial@2800000 {
  1336			compatible = "ti,j721e-uart", "ti,am654-uart";
  1337			reg = <0x00 0x02800000 0x00 0x100>;
  1338			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
  1339			clock-frequency = <48000000>;
  1340			current-speed = <115200>;
  1341			power-domains = <&k3_pds 146 TI_SCI_PD_EXCLUSIVE>;
  1342			clocks = <&k3_clks 146 0>;
  1343			clock-names = "fclk";
  1344			status = "disabled";
  1345		};
  1346	
  1347		main_uart1: serial@2810000 {
  1348			compatible = "ti,j721e-uart", "ti,am654-uart";
  1349			reg = <0x00 0x02810000 0x00 0x100>;
  1350			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
  1351			clock-frequency = <48000000>;
  1352			current-speed = <115200>;
  1353			power-domains = <&k3_pds 278 TI_SCI_PD_EXCLUSIVE>;
  1354			clocks = <&k3_clks 278 0>;
  1355			clock-names = "fclk";
  1356			status = "disabled";
  1357		};
  1358	
  1359		main_uart2: serial@2820000 {
  1360			compatible = "ti,j721e-uart", "ti,am654-uart";
  1361			reg = <0x00 0x02820000 0x00 0x100>;
  1362			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
  1363			clock-frequency = <48000000>;
  1364			current-speed = <115200>;
  1365			power-domains = <&k3_pds 279 TI_SCI_PD_EXCLUSIVE>;
  1366			clocks = <&k3_clks 279 0>;
  1367			clock-names = "fclk";
  1368			status = "disabled";
  1369		};
  1370	
  1371		main_uart3: serial@2830000 {
  1372			compatible = "ti,j721e-uart", "ti,am654-uart";
  1373			reg = <0x00 0x02830000 0x00 0x100>;
  1374			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
  1375			clock-frequency = <48000000>;
  1376			current-speed = <115200>;
  1377			power-domains = <&k3_pds 280 TI_SCI_PD_EXCLUSIVE>;
  1378			clocks = <&k3_clks 280 0>;
  1379			clock-names = "fclk";
  1380			status = "disabled";
  1381		};
  1382	
  1383		main_uart4: serial@2840000 {
  1384			compatible = "ti,j721e-uart", "ti,am654-uart";
  1385			reg = <0x00 0x02840000 0x00 0x100>;
  1386			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
  1387			clock-frequency = <48000000>;
  1388			current-speed = <115200>;
  1389			power-domains = <&k3_pds 281 TI_SCI_PD_EXCLUSIVE>;
  1390			clocks = <&k3_clks 281 0>;
  1391			clock-names = "fclk";
  1392			status = "disabled";
  1393		};
  1394	
  1395		main_uart5: serial@2850000 {
  1396			compatible = "ti,j721e-uart", "ti,am654-uart";
  1397			reg = <0x00 0x02850000 0x00 0x100>;
  1398			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
  1399			clock-frequency = <48000000>;
  1400			current-speed = <115200>;
  1401			power-domains = <&k3_pds 282 TI_SCI_PD_EXCLUSIVE>;
  1402			clocks = <&k3_clks 282 0>;
  1403			clock-names = "fclk";
  1404			status = "disabled";
  1405		};
  1406	
  1407		main_uart6: serial@2860000 {
  1408			compatible = "ti,j721e-uart", "ti,am654-uart";
  1409			reg = <0x00 0x02860000 0x00 0x100>;
  1410			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
  1411			clock-frequency = <48000000>;
  1412			current-speed = <115200>;
  1413			power-domains = <&k3_pds 283 TI_SCI_PD_EXCLUSIVE>;
  1414			clocks = <&k3_clks 283 0>;
  1415			clock-names = "fclk";
  1416			status = "disabled";
  1417		};
  1418	
  1419		main_uart7: serial@2870000 {
  1420			compatible = "ti,j721e-uart", "ti,am654-uart";
  1421			reg = <0x00 0x02870000 0x00 0x100>;
  1422			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
  1423			clock-frequency = <48000000>;
  1424			current-speed = <115200>;
  1425			power-domains = <&k3_pds 284 TI_SCI_PD_EXCLUSIVE>;
  1426			clocks = <&k3_clks 284 0>;
  1427			clock-names = "fclk";
  1428			status = "disabled";
  1429		};
  1430	
  1431		main_uart8: serial@2880000 {
  1432			compatible = "ti,j721e-uart", "ti,am654-uart";
  1433			reg = <0x00 0x02880000 0x00 0x100>;
  1434			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
  1435			clock-frequency = <48000000>;
  1436			current-speed = <115200>;
  1437			power-domains = <&k3_pds 285 TI_SCI_PD_EXCLUSIVE>;
  1438			clocks = <&k3_clks 285 0>;
  1439			clock-names = "fclk";
  1440			status = "disabled";
  1441		};
  1442	
  1443		main_uart9: serial@2890000 {
  1444			compatible = "ti,j721e-uart", "ti,am654-uart";
  1445			reg = <0x00 0x02890000 0x00 0x100>;
  1446			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
  1447			clock-frequency = <48000000>;
  1448			current-speed = <115200>;
  1449			power-domains = <&k3_pds 286 TI_SCI_PD_EXCLUSIVE>;
  1450			clocks = <&k3_clks 286 0>;
  1451			clock-names = "fclk";
  1452			status = "disabled";
  1453		};
  1454	
  1455		main_gpio0: gpio@600000 {
  1456			compatible = "ti,j721e-gpio", "ti,keystone-gpio";
  1457			reg = <0x0 0x00600000 0x0 0x100>;
  1458			gpio-controller;
  1459			#gpio-cells = <2>;
  1460			interrupt-parent = <&main_gpio_intr>;
  1461			interrupts = <256>, <257>, <258>, <259>,
  1462				     <260>, <261>, <262>, <263>;
  1463			interrupt-controller;
  1464			#interrupt-cells = <2>;
  1465			ti,ngpio = <128>;
  1466			ti,davinci-gpio-unbanked = <0>;
  1467			power-domains = <&k3_pds 105 TI_SCI_PD_EXCLUSIVE>;
  1468			clocks = <&k3_clks 105 0>;
  1469			clock-names = "gpio";
  1470			status = "disabled";
  1471		};
  1472	
  1473		main_gpio1: gpio@601000 {
  1474			compatible = "ti,j721e-gpio", "ti,keystone-gpio";
  1475			reg = <0x0 0x00601000 0x0 0x100>;
  1476			gpio-controller;
  1477			#gpio-cells = <2>;
  1478			interrupt-parent = <&main_gpio_intr>;
  1479			interrupts = <288>, <289>, <290>;
  1480			interrupt-controller;
  1481			#interrupt-cells = <2>;
  1482			ti,ngpio = <36>;
  1483			ti,davinci-gpio-unbanked = <0>;
  1484			power-domains = <&k3_pds 106 TI_SCI_PD_EXCLUSIVE>;
  1485			clocks = <&k3_clks 106 0>;
  1486			clock-names = "gpio";
  1487			status = "disabled";
  1488		};
  1489	
  1490		main_gpio2: gpio@610000 {
  1491			compatible = "ti,j721e-gpio", "ti,keystone-gpio";
  1492			reg = <0x0 0x00610000 0x0 0x100>;
  1493			gpio-controller;
  1494			#gpio-cells = <2>;
  1495			interrupt-parent = <&main_gpio_intr>;
  1496			interrupts = <264>, <265>, <266>, <267>,
  1497				     <268>, <269>, <270>, <271>;
  1498			interrupt-controller;
  1499			#interrupt-cells = <2>;
  1500			ti,ngpio = <128>;
  1501			ti,davinci-gpio-unbanked = <0>;
  1502			power-domains = <&k3_pds 107 TI_SCI_PD_EXCLUSIVE>;
  1503			clocks = <&k3_clks 107 0>;
  1504			clock-names = "gpio";
  1505			status = "disabled";
  1506		};
  1507	
  1508		main_gpio3: gpio@611000 {
  1509			compatible = "ti,j721e-gpio", "ti,keystone-gpio";
  1510			reg = <0x0 0x00611000 0x0 0x100>;
  1511			gpio-controller;
  1512			#gpio-cells = <2>;
  1513			interrupt-parent = <&main_gpio_intr>;
  1514			interrupts = <292>, <293>, <294>;
  1515			interrupt-controller;
  1516			#interrupt-cells = <2>;
  1517			ti,ngpio = <36>;
  1518			ti,davinci-gpio-unbanked = <0>;
  1519			power-domains = <&k3_pds 108 TI_SCI_PD_EXCLUSIVE>;
  1520			clocks = <&k3_clks 108 0>;
  1521			clock-names = "gpio";
  1522			status = "disabled";
  1523		};
  1524	
  1525		main_gpio4: gpio@620000 {
  1526			compatible = "ti,j721e-gpio", "ti,keystone-gpio";
  1527			reg = <0x0 0x00620000 0x0 0x100>;
  1528			gpio-controller;
  1529			#gpio-cells = <2>;
  1530			interrupt-parent = <&main_gpio_intr>;
  1531			interrupts = <272>, <273>, <274>, <275>,
  1532				     <276>, <277>, <278>, <279>;
  1533			interrupt-controller;
  1534			#interrupt-cells = <2>;
  1535			ti,ngpio = <128>;
  1536			ti,davinci-gpio-unbanked = <0>;
  1537			power-domains = <&k3_pds 109 TI_SCI_PD_EXCLUSIVE>;
  1538			clocks = <&k3_clks 109 0>;
  1539			clock-names = "gpio";
  1540			status = "disabled";
  1541		};
  1542	
  1543		main_gpio5: gpio@621000 {
  1544			compatible = "ti,j721e-gpio", "ti,keystone-gpio";
  1545			reg = <0x0 0x00621000 0x0 0x100>;
  1546			gpio-controller;
  1547			#gpio-cells = <2>;
  1548			interrupt-parent = <&main_gpio_intr>;
  1549			interrupts = <296>, <297>, <298>;
  1550			interrupt-controller;
  1551			#interrupt-cells = <2>;
  1552			ti,ngpio = <36>;
  1553			ti,davinci-gpio-unbanked = <0>;
  1554			power-domains = <&k3_pds 110 TI_SCI_PD_EXCLUSIVE>;
  1555			clocks = <&k3_clks 110 0>;
  1556			clock-names = "gpio";
  1557			status = "disabled";
  1558		};
  1559	
  1560		main_gpio6: gpio@630000 {
  1561			compatible = "ti,j721e-gpio", "ti,keystone-gpio";
  1562			reg = <0x0 0x00630000 0x0 0x100>;
  1563			gpio-controller;
  1564			#gpio-cells = <2>;
  1565			interrupt-parent = <&main_gpio_intr>;
  1566			interrupts = <280>, <281>, <282>, <283>,
  1567				     <284>, <285>, <286>, <287>;
  1568			interrupt-controller;
  1569			#interrupt-cells = <2>;
  1570			ti,ngpio = <128>;
  1571			ti,davinci-gpio-unbanked = <0>;
  1572			power-domains = <&k3_pds 111 TI_SCI_PD_EXCLUSIVE>;
  1573			clocks = <&k3_clks 111 0>;
  1574			clock-names = "gpio";
  1575			status = "disabled";
  1576		};
  1577	
  1578		main_gpio7: gpio@631000 {
  1579			compatible = "ti,j721e-gpio", "ti,keystone-gpio";
  1580			reg = <0x0 0x00631000 0x0 0x100>;
  1581			gpio-controller;
  1582			#gpio-cells = <2>;
  1583			interrupt-parent = <&main_gpio_intr>;
  1584			interrupts = <300>, <301>, <302>;
  1585			interrupt-controller;
  1586			#interrupt-cells = <2>;
  1587			ti,ngpio = <36>;
  1588			ti,davinci-gpio-unbanked = <0>;
  1589			power-domains = <&k3_pds 112 TI_SCI_PD_EXCLUSIVE>;
  1590			clocks = <&k3_clks 112 0>;
  1591			clock-names = "gpio";
  1592			status = "disabled";
  1593		};
  1594	
  1595		main_sdhci0: mmc@4f80000 {
  1596			compatible = "ti,j721e-sdhci-8bit";
  1597			reg = <0x0 0x4f80000 0x0 0x1000>, <0x0 0x4f88000 0x0 0x400>;
  1598			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
  1599			power-domains = <&k3_pds 91 TI_SCI_PD_EXCLUSIVE>;
  1600			clock-names = "clk_ahb", "clk_xin";
  1601			clocks = <&k3_clks 91 0>, <&k3_clks 91 1>;
  1602			assigned-clocks = <&k3_clks 91 1>;
  1603			assigned-clock-parents = <&k3_clks 91 2>;
  1604			bus-width = <8>;
  1605			mmc-hs200-1_8v;
  1606			mmc-ddr-1_8v;
  1607			ti,otap-del-sel-legacy = <0x0>;
  1608			ti,otap-del-sel-mmc-hs = <0x0>;
  1609			ti,otap-del-sel-ddr52 = <0x5>;
  1610			ti,otap-del-sel-hs200 = <0x6>;
  1611			ti,otap-del-sel-hs400 = <0x0>;
  1612			ti,itap-del-sel-legacy = <0x10>;
  1613			ti,itap-del-sel-mmc-hs = <0xa>;
  1614			ti,itap-del-sel-ddr52 = <0x3>;
  1615			ti,trm-icp = <0x8>;
  1616			dma-coherent;
  1617			status = "disabled";
  1618		};
  1619	
  1620		main_sdhci1: mmc@4fb0000 {
  1621			compatible = "ti,j721e-sdhci-4bit";
  1622			reg = <0x0 0x04fb0000 0x0 0x1000>, <0x0 0x4fb8000 0x0 0x400>;
  1623			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
  1624			power-domains = <&k3_pds 92 TI_SCI_PD_EXCLUSIVE>;
  1625			clock-names = "clk_ahb", "clk_xin";
  1626			clocks = <&k3_clks 92 5>, <&k3_clks 92 0>;
  1627			assigned-clocks = <&k3_clks 92 0>;
  1628			assigned-clock-parents = <&k3_clks 92 1>;
  1629			ti,otap-del-sel-legacy = <0x0>;
  1630			ti,otap-del-sel-sd-hs = <0x0>;
  1631			ti,otap-del-sel-sdr12 = <0xf>;
  1632			ti,otap-del-sel-sdr25 = <0xf>;
  1633			ti,otap-del-sel-sdr50 = <0xc>;
  1634			ti,otap-del-sel-ddr50 = <0xc>;
  1635			ti,otap-del-sel-sdr104 = <0x5>;
  1636			ti,itap-del-sel-legacy = <0x0>;
  1637			ti,itap-del-sel-sd-hs = <0x0>;
  1638			ti,itap-del-sel-sdr12 = <0x0>;
  1639			ti,itap-del-sel-sdr25 = <0x0>;
  1640			ti,itap-del-sel-ddr50 = <0x2>;
  1641			ti,trm-icp = <0x8>;
  1642			ti,clkbuf-sel = <0x7>;
  1643			dma-coherent;
  1644			sdhci-caps-mask = <0x2 0x0>;
  1645			status = "disabled";
  1646		};
  1647	
  1648		main_sdhci2: mmc@4f98000 {
  1649			compatible = "ti,j721e-sdhci-4bit";
  1650			reg = <0x0 0x4f98000 0x0 0x1000>, <0x0 0x4f90000 0x0 0x400>;
  1651			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
  1652			power-domains = <&k3_pds 93 TI_SCI_PD_EXCLUSIVE>;
  1653			clock-names = "clk_ahb", "clk_xin";
  1654			clocks = <&k3_clks 93 5>, <&k3_clks 93 0>;
  1655			assigned-clocks = <&k3_clks 93 0>;
  1656			assigned-clock-parents = <&k3_clks 93 1>;
  1657			ti,otap-del-sel-legacy = <0x0>;
  1658			ti,otap-del-sel-sd-hs = <0x0>;
  1659			ti,otap-del-sel-sdr12 = <0xf>;
  1660			ti,otap-del-sel-sdr25 = <0xf>;
  1661			ti,otap-del-sel-sdr50 = <0xc>;
  1662			ti,otap-del-sel-ddr50 = <0xc>;
  1663			ti,otap-del-sel-sdr104 = <0x5>;
  1664			ti,itap-del-sel-legacy = <0x0>;
  1665			ti,itap-del-sel-sd-hs = <0x0>;
  1666			ti,itap-del-sel-sdr12 = <0x0>;
  1667			ti,itap-del-sel-sdr25 = <0x0>;
  1668			ti,itap-del-sel-ddr50 = <0x2>;
  1669			ti,trm-icp = <0x8>;
  1670			ti,clkbuf-sel = <0x7>;
  1671			dma-coherent;
  1672			sdhci-caps-mask = <0x2 0x0>;
  1673			status = "disabled";
  1674		};
  1675	
  1676		usbss0: cdns-usb@4104000 {
  1677			compatible = "ti,j721e-usb";
  1678			reg = <0x00 0x4104000 0x00 0x100>;
  1679			dma-coherent;
  1680			power-domains = <&k3_pds 288 TI_SCI_PD_EXCLUSIVE>;
  1681			clocks = <&k3_clks 288 15>, <&k3_clks 288 3>;
  1682			clock-names = "ref", "lpm";
  1683			assigned-clocks = <&k3_clks 288 15>;	/* USB2_REFCLK */
  1684			assigned-clock-parents = <&k3_clks 288 16>; /* HFOSC0 */
  1685			#address-cells = <2>;
  1686			#size-cells = <2>;
  1687			ranges;
  1688	
  1689			usb0: usb@6000000 {
  1690				compatible = "cdns,usb3";
  1691				reg = <0x00 0x6000000 0x00 0x10000>,
  1692				      <0x00 0x6010000 0x00 0x10000>,
  1693				      <0x00 0x6020000 0x00 0x10000>;
  1694				reg-names = "otg", "xhci", "dev";
  1695				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,	/* irq.0 */
  1696					     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,	/* irq.6 */
  1697					     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;	/* otgirq.0 */
  1698				interrupt-names = "host",
  1699						  "peripheral",
  1700						  "otg";
  1701				maximum-speed = "super-speed";
  1702				dr_mode = "otg";
  1703			};
  1704		};
  1705	
  1706		usbss1: cdns-usb@4114000 {
  1707			compatible = "ti,j721e-usb";
  1708			reg = <0x00 0x4114000 0x00 0x100>;
  1709			dma-coherent;
  1710			power-domains = <&k3_pds 289 TI_SCI_PD_EXCLUSIVE>;
  1711			clocks = <&k3_clks 289 15>, <&k3_clks 289 3>;
  1712			clock-names = "ref", "lpm";
  1713			assigned-clocks = <&k3_clks 289 15>;	/* USB2_REFCLK */
  1714			assigned-clock-parents = <&k3_clks 289 16>; /* HFOSC0 */
  1715			#address-cells = <2>;
  1716			#size-cells = <2>;
  1717			ranges;
  1718	
  1719			usb1: usb@6400000 {
  1720				compatible = "cdns,usb3";
  1721				reg = <0x00 0x6400000 0x00 0x10000>,
  1722				      <0x00 0x6410000 0x00 0x10000>,
  1723				      <0x00 0x6420000 0x00 0x10000>;
  1724				reg-names = "otg", "xhci", "dev";
  1725				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,	/* irq.0 */
  1726					     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,	/* irq.6 */
  1727					     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;	/* otgirq.0 */
  1728				interrupt-names = "host",
  1729						  "peripheral",
  1730						  "otg";
  1731				maximum-speed = "super-speed";
  1732				dr_mode = "otg";
  1733			};
  1734		};
  1735	
  1736		main_i2c0: i2c@2000000 {
  1737			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
  1738			reg = <0x0 0x2000000 0x0 0x100>;
  1739			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
  1740			#address-cells = <1>;
  1741			#size-cells = <0>;
  1742			clock-names = "fck";
  1743			clocks = <&k3_clks 187 0>;
  1744			power-domains = <&k3_pds 187 TI_SCI_PD_SHARED>;
  1745			status = "disabled";
  1746		};
  1747	
  1748		main_i2c1: i2c@2010000 {
  1749			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
  1750			reg = <0x0 0x2010000 0x0 0x100>;
  1751			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
  1752			#address-cells = <1>;
  1753			#size-cells = <0>;
  1754			clock-names = "fck";
  1755			clocks = <&k3_clks 188 0>;
  1756			power-domains = <&k3_pds 188 TI_SCI_PD_EXCLUSIVE>;
  1757			status = "disabled";
  1758		};
  1759	
  1760		main_i2c2: i2c@2020000 {
  1761			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
  1762			reg = <0x0 0x2020000 0x0 0x100>;
  1763			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
  1764			#address-cells = <1>;
  1765			#size-cells = <0>;
  1766			clock-names = "fck";
  1767			clocks = <&k3_clks 189 0>;
  1768			power-domains = <&k3_pds 189 TI_SCI_PD_EXCLUSIVE>;
  1769			status = "disabled";
  1770		};
  1771	
  1772		main_i2c3: i2c@2030000 {
  1773			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
  1774			reg = <0x0 0x2030000 0x0 0x100>;
  1775			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
  1776			#address-cells = <1>;
  1777			#size-cells = <0>;
  1778			clock-names = "fck";
  1779			clocks = <&k3_clks 190 0>;
  1780			power-domains = <&k3_pds 190 TI_SCI_PD_EXCLUSIVE>;
  1781			status = "disabled";
  1782		};
  1783	
  1784		main_i2c4: i2c@2040000 {
  1785			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
  1786			reg = <0x0 0x2040000 0x0 0x100>;
  1787			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
  1788			#address-cells = <1>;
  1789			#size-cells = <0>;
  1790			clock-names = "fck";
  1791			clocks = <&k3_clks 191 0>;
  1792			power-domains = <&k3_pds 191 TI_SCI_PD_EXCLUSIVE>;
  1793			status = "disabled";
  1794		};
  1795	
  1796		main_i2c5: i2c@2050000 {
  1797			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
  1798			reg = <0x0 0x2050000 0x0 0x100>;
  1799			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
  1800			#address-cells = <1>;
  1801			#size-cells = <0>;
  1802			clock-names = "fck";
  1803			clocks = <&k3_clks 192 0>;
  1804			power-domains = <&k3_pds 192 TI_SCI_PD_EXCLUSIVE>;
  1805			status = "disabled";
  1806		};
  1807	
  1808		main_i2c6: i2c@2060000 {
  1809			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
  1810			reg = <0x0 0x2060000 0x0 0x100>;
  1811			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
  1812			#address-cells = <1>;
  1813			#size-cells = <0>;
  1814			clock-names = "fck";
  1815			clocks = <&k3_clks 193 0>;
  1816			power-domains = <&k3_pds 193 TI_SCI_PD_EXCLUSIVE>;
  1817			status = "disabled";
  1818		};
  1819	
  1820		ufs_wrapper: ufs-wrapper@4e80000 {
  1821			compatible = "ti,j721e-ufs";
  1822			reg = <0x0 0x4e80000 0x0 0x100>;
  1823			power-domains = <&k3_pds 277 TI_SCI_PD_EXCLUSIVE>;
  1824			clocks = <&k3_clks 277 1>;
  1825			assigned-clocks = <&k3_clks 277 1>;
  1826			assigned-clock-parents = <&k3_clks 277 4>;
  1827			ranges;
  1828			#address-cells = <2>;
  1829			#size-cells = <2>;
  1830	
  1831			ufs@4e84000 {
  1832				compatible = "cdns,ufshc-m31-16nm", "jedec,ufs-2.0";
  1833				reg = <0x0 0x4e84000 0x0 0x10000>;
  1834				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
  1835				freq-table-hz = <250000000 250000000>, <19200000 19200000>, <19200000 19200000>;
  1836				clocks = <&k3_clks 277 0>, <&k3_clks 277 1>, <&k3_clks 277 1>;
  1837				clock-names = "core_clk", "phy_clk", "ref_clk";
  1838				dma-coherent;
  1839			};
  1840		};
  1841	
  1842		mhdp: dp-bridge@a000000 {
  1843			compatible = "ti,j721e-mhdp8546";
  1844			/*
  1845			 * Note: we do not map DPTX PHY area, as that is handled by
  1846			 * the PHY driver.
  1847			 */
  1848			reg = <0x00 0x0a000000 0x00 0x030a00>, /* DSS_EDP0_V2A_CORE_VP_REGS_APB */
  1849			      <0x00 0x04f40000 0x00 0x20>;    /* DSS_EDP0_INTG_CFG_VP */
  1850			reg-names = "mhdptx", "j721e-intg";
  1851	
  1852			clocks = <&k3_clks 151 36>;
  1853	
  1854			interrupt-parent = <&gic500>;
  1855			interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>;
  1856	
  1857			power-domains = <&k3_pds 151 TI_SCI_PD_EXCLUSIVE>;
  1858	
  1859			dp0_ports: ports {
  1860				#address-cells = <1>;
  1861				#size-cells = <0>;
  1862	
  1863				port@0 {
  1864				    reg = <0>;
  1865				};
  1866	
  1867				port@4 {
  1868				    reg = <4>;
  1869				};
  1870			};
  1871		};
  1872	
> 1873		dsi0: dsi@48000000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
