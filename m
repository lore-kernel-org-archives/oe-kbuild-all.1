Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233E9200BA7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267794; cv=none; b=PUs+/DpZFuC1nyzbqbkJnhm2w4N6Xg+tlCxdx+5YHaGyuahgeBSJ+PtZ7FTbIjytOBBDweU21c5FiQd8ZDvZGiZBmCOyz3E3fGdmQEJOCeHLjIJomPIP9/kB5JTnciikW2Q8EALFY9k+I1jIE1PSEtrNx6ZZ2FDpm4nUXIIoWAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267794; c=relaxed/simple;
	bh=K9Q0Hr7vpbsdb4WKXUhNj7vGIT6fvnT7WF+4vNfIaYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZRththDAx9EPNFVO4tLQ29CgHLpKhqyeDhVXAVDwicroAgwx9Ljq/2I5kymcdnnWRE4rsn5M1l3w7Hvrnb7f1hEDQui8pq3WGQTg6Ul5LaIhxZPh3NoyGXrz5LS+NORGi41hS9ZHeAGgqgFVUNc3+bXaQk9MT7uWB1CTXoUMOGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyLW5DJ8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyLW5DJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729267791; x=1760803791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K9Q0Hr7vpbsdb4WKXUhNj7vGIT6fvnT7WF+4vNfIaYM=;
  b=cyLW5DJ8mrp4uyHV+6hiO7iktWb75XBFbvUujiZrxME14CDEqoBDQZ9d
   KnAENquMDKyKb7/KtQ7Z8y4flWOjFSXRn683YoSeG2ZtYKL59abrWNPlp
   rfvLMCYrYSwGiKGsIQHTyohzGjkO1VpSRkSfIScSOADkB893fzs6SWPKR
   CnPf8bNeOn57Uo84N5EcmALbOMjvV7acMtmbc0Mi6ZNVKparXMqe1nJqC
   p0EjV/VWde937IUnA4TGKRlg+WBwjL0fDCMLtswaU5jerKnDSaol3r+ux
   zUrLN+l0wrZnet2mQwCY9M5MXpA8QnQyf/dwxfD1laWlDxZe1YiLZeSOs
   A==;
X-CSE-ConnectionGUID: /4mlSVVSR6WxPuSPpSnGiw==
X-CSE-MsgGUID: 69eN58JJS3Goh3dfoWdsBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39351127"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39351127"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 09:09:51 -0700
X-CSE-ConnectionGUID: 8Bfj3rXsR/yTrOoDm7nheg==
X-CSE-MsgGUID: M4CrnwB3Toi0djoznFiEvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="109730075"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2024 09:09:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1pXu-000O0J-0N;
	Fri, 18 Oct 2024 16:09:46 +0000
Date: Sat, 19 Oct 2024 00:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Ranostay <mranostay@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Achal Verma <a-verma1@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 1/69]
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1048.25-1088.4: Warning
 (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address
 (also used in node /bus@100000/pcie-ep@2900000)
Message-ID: <202410190038.jk8WZ0k0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: b8ef2e6c5f6071e7bda38c6508c93bb62a959ac6 [1/69] arm64: dts: ti: k3-j784s4: Add initial PCIe/SerDes support for J784S4
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241019/202410190038.jk8WZ0k0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190038.jk8WZ0k0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190038.jk8WZ0k0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1048.25-1088.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1111.25-1151.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)
--
>> arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1048.25-1088.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:1111.25-1151.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)

vim +1048 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi

    19	
    20	&cbass_main {
    21		msmc_ram: sram@70000000 {
    22			compatible = "mmio-sram";
    23			reg = <0x00 0x70000000 0x00 0x800000>;
    24			#address-cells = <1>;
    25			#size-cells = <1>;
    26			ranges = <0x00 0x00 0x70000000 0x800000>;
    27	
    28			atf-sram@0 {
    29				reg = <0x00 0x20000>;
    30			};
    31	
    32			tifs-sram@1f0000 {
    33				reg = <0x1f0000 0x10000>;
    34			};
    35	
    36			l3cache-sram@200000 {
    37				reg = <0x200000 0x200000>;
    38			};
    39		};
    40	
    41		scm_conf: syscon@100000 {
    42			compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
    43			reg = <0x00 0x00100000 0x00 0x1c000>;
    44			#address-cells = <1>;
    45			#size-cells = <1>;
    46			ranges = <0x00 0x00 0x00100000 0x1c000>;
    47	
    48			cpsw1_phy_gmii_sel: phy@4034 {
    49				compatible = "ti,am654-phy-gmii-sel";
    50				reg = <0x4034 0x4>;
    51				#phy-cells = <1>;
    52			};
    53	
    54			serdes_ln_ctrl: mux-controller@4080 {
    55				compatible = "mmio-mux";
    56				reg = <0x00004080 0x30>;
    57				#mux-control-cells = <1>;
    58				mux-reg-masks = <0x4080 0x3>, <0x4084 0x3>, /* SERDES0 lane0/1 select */
    59						<0x4088 0x3>, <0x408c 0x3>, /* SERDES0 lane2/3 select */
    60						<0x4090 0x3>, <0x4094 0x3>, /* SERDES1 lane0/1 select */
    61						<0x4098 0x3>, <0x409c 0x3>, /* SERDES1 lane2/3 select */
    62						<0x40a0 0x3>, <0x40a4 0x3>, /* SERDES2 lane0/1 select */
    63						<0x40a8 0x3>, <0x40ac 0x3>; /* SERDES2 lane2/3 select */
    64			};
    65		};
    66	
    67		gic500: interrupt-controller@1800000 {
    68			compatible = "arm,gic-v3";
    69			#address-cells = <2>;
    70			#size-cells = <2>;
    71			ranges;
    72			#interrupt-cells = <3>;
    73			interrupt-controller;
    74			reg = <0x00 0x01800000 0x00 0x200000>, /* GICD */
    75			      <0x00 0x01900000 0x00 0x100000>, /* GICR */
    76			      <0x00 0x6f000000 0x00 0x2000>,   /* GICC */
    77			      <0x00 0x6f010000 0x00 0x1000>,   /* GICH */
    78			      <0x00 0x6f020000 0x00 0x2000>;   /* GICV */
    79	
    80			/* vcpumntirq: virtual CPU interface maintenance interrupt */
    81			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
    82	
    83			gic_its: msi-controller@1820000 {
    84				compatible = "arm,gic-v3-its";
    85				reg = <0x00 0x01820000 0x00 0x10000>;
    86				socionext,synquacer-pre-its = <0x1000000 0x400000>;
    87				msi-controller;
    88				#msi-cells = <1>;
    89			};
    90		};
    91	
    92		main_gpio_intr: interrupt-controller@a00000 {
    93			compatible = "ti,sci-intr";
    94			reg = <0x00 0x00a00000 0x00 0x800>;
    95			ti,intr-trigger-type = <1>;
    96			interrupt-controller;
    97			interrupt-parent = <&gic500>;
    98			#interrupt-cells = <1>;
    99			ti,sci = <&sms>;
   100			ti,sci-dev-id = <10>;
   101			ti,interrupt-ranges = <8 360 56>;
   102		};
   103	
   104		main_pmx0: pinctrl@11c000 {
   105			compatible = "pinctrl-single";
   106			/* Proxy 0 addressing */
   107			reg = <0x00 0x11c000 0x00 0x120>;
   108			#pinctrl-cells = <1>;
   109			pinctrl-single,register-width = <32>;
   110			pinctrl-single,function-mask = <0xffffffff>;
   111		};
   112	
   113		main_crypto: crypto@4e00000 {
   114			compatible = "ti,j721e-sa2ul";
   115			reg = <0x00 0x4e00000 0x00 0x1200>;
   116			power-domains = <&k3_pds 369 TI_SCI_PD_EXCLUSIVE>;
   117			#address-cells = <2>;
   118			#size-cells = <2>;
   119			ranges = <0x00 0x04e00000 0x00 0x04e00000 0x00 0x30000>;
   120	
   121			dmas = <&main_udmap 0xca40>, <&main_udmap 0x4a40>,
   122					<&main_udmap 0x4a41>;
   123			dma-names = "tx", "rx1", "rx2";
   124	
   125			rng: rng@4e10000 {
   126				compatible = "inside-secure,safexcel-eip76";
   127				reg = <0x00 0x4e10000 0x00 0x7d>;
   128				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
   129			};
   130		};
   131	
   132		main_uart0: serial@2800000 {
   133			compatible = "ti,j721e-uart", "ti,am654-uart";
   134			reg = <0x00 0x02800000 0x00 0x200>;
   135			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
   136			current-speed = <115200>;
   137			clocks = <&k3_clks 146 0>;
   138			clock-names = "fclk";
   139			power-domains = <&k3_pds 146 TI_SCI_PD_EXCLUSIVE>;
   140			status = "disabled";
   141		};
   142	
   143		main_uart1: serial@2810000 {
   144			compatible = "ti,j721e-uart", "ti,am654-uart";
   145			reg = <0x00 0x02810000 0x00 0x200>;
   146			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
   147			current-speed = <115200>;
   148			clocks = <&k3_clks 388 0>;
   149			clock-names = "fclk";
   150			power-domains = <&k3_pds 388 TI_SCI_PD_EXCLUSIVE>;
   151			status = "disabled";
   152		};
   153	
   154		main_uart2: serial@2820000 {
   155			compatible = "ti,j721e-uart", "ti,am654-uart";
   156			reg = <0x00 0x02820000 0x00 0x200>;
   157			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
   158			current-speed = <115200>;
   159			clocks = <&k3_clks 389 0>;
   160			clock-names = "fclk";
   161			power-domains = <&k3_pds 389 TI_SCI_PD_EXCLUSIVE>;
   162			status = "disabled";
   163		};
   164	
   165		main_uart3: serial@2830000 {
   166			compatible = "ti,j721e-uart", "ti,am654-uart";
   167			reg = <0x00 0x02830000 0x00 0x200>;
   168			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
   169			current-speed = <115200>;
   170			clocks = <&k3_clks 390 0>;
   171			clock-names = "fclk";
   172			power-domains = <&k3_pds 390 TI_SCI_PD_EXCLUSIVE>;
   173			status = "disabled";
   174		};
   175	
   176		main_uart4: serial@2840000 {
   177			compatible = "ti,j721e-uart", "ti,am654-uart";
   178			reg = <0x00 0x02840000 0x00 0x200>;
   179			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
   180			current-speed = <115200>;
   181			clocks = <&k3_clks 391 0>;
   182			clock-names = "fclk";
   183			power-domains = <&k3_pds 391 TI_SCI_PD_EXCLUSIVE>;
   184			status = "disabled";
   185		};
   186	
   187		main_uart5: serial@2850000 {
   188			compatible = "ti,j721e-uart", "ti,am654-uart";
   189			reg = <0x00 0x02850000 0x00 0x200>;
   190			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
   191			current-speed = <115200>;
   192			clocks = <&k3_clks 392 0>;
   193			clock-names = "fclk";
   194			power-domains = <&k3_pds 392 TI_SCI_PD_EXCLUSIVE>;
   195			status = "disabled";
   196		};
   197	
   198		main_uart6: serial@2860000 {
   199			compatible = "ti,j721e-uart", "ti,am654-uart";
   200			reg = <0x00 0x02860000 0x00 0x200>;
   201			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
   202			current-speed = <115200>;
   203			clocks = <&k3_clks 393 0>;
   204			clock-names = "fclk";
   205			power-domains = <&k3_pds 393 TI_SCI_PD_EXCLUSIVE>;
   206			status = "disabled";
   207		};
   208	
   209		main_uart7: serial@2870000 {
   210			compatible = "ti,j721e-uart", "ti,am654-uart";
   211			reg = <0x00 0x02870000 0x00 0x200>;
   212			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
   213			current-speed = <115200>;
   214			clocks = <&k3_clks 394 0>;
   215			clock-names = "fclk";
   216			power-domains = <&k3_pds 394 TI_SCI_PD_EXCLUSIVE>;
   217			status = "disabled";
   218		};
   219	
   220		main_uart8: serial@2880000 {
   221			compatible = "ti,j721e-uart", "ti,am654-uart";
   222			reg = <0x00 0x02880000 0x00 0x200>;
   223			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
   224			current-speed = <115200>;
   225			clocks = <&k3_clks 395 0>;
   226			clock-names = "fclk";
   227			power-domains = <&k3_pds 395 TI_SCI_PD_EXCLUSIVE>;
   228			status = "disabled";
   229		};
   230	
   231		main_uart9: serial@2890000 {
   232			compatible = "ti,j721e-uart", "ti,am654-uart";
   233			reg = <0x00 0x02890000 0x00 0x200>;
   234			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
   235			current-speed = <115200>;
   236			clocks = <&k3_clks 396 0>;
   237			clock-names = "fclk";
   238			power-domains = <&k3_pds 396 TI_SCI_PD_EXCLUSIVE>;
   239			status = "disabled";
   240		};
   241	
   242		gpu: gpu@4e20000000 {
   243			compatible = "ti,j721s2-pvr", "img,pvr-bxs64";
   244			reg = <0x4e 0x20000000 0x00 0x80000>;
   245			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
   246			power-domains = <&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
   247			clocks = <&k3_clks 181 1>;
   248		};
   249	
   250		main_gpio0: gpio@600000 {
   251			compatible = "ti,j721e-gpio", "ti,keystone-gpio";
   252			reg = <0x00 0x00600000 0x00 0x100>;
   253			gpio-controller;
   254			#gpio-cells = <2>;
   255			interrupt-parent = <&main_gpio_intr>;
   256			interrupts = <145>, <146>, <147>, <148>, <149>;
   257			interrupt-controller;
   258			#interrupt-cells = <2>;
   259			ti,ngpio = <66>;
   260			ti,davinci-gpio-unbanked = <0>;
   261			power-domains = <&k3_pds 163 TI_SCI_PD_EXCLUSIVE>;
   262			clocks = <&k3_clks 163 0>;
   263			clock-names = "gpio";
   264			status = "disabled";
   265		};
   266	
   267		main_gpio2: gpio@610000 {
   268			compatible = "ti,j721e-gpio", "ti,keystone-gpio";
   269			reg = <0x00 0x00610000 0x00 0x100>;
   270			gpio-controller;
   271			#gpio-cells = <2>;
   272			interrupt-parent = <&main_gpio_intr>;
   273			interrupts = <154>, <155>, <156>, <157>, <158>;
   274			interrupt-controller;
   275			#interrupt-cells = <2>;
   276			ti,ngpio = <66>;
   277			ti,davinci-gpio-unbanked = <0>;
   278			power-domains = <&k3_pds 164 TI_SCI_PD_EXCLUSIVE>;
   279			clocks = <&k3_clks 164 0>;
   280			clock-names = "gpio";
   281			status = "disabled";
   282		};
   283	
   284		main_gpio4: gpio@620000 {
   285			compatible = "ti,j721e-gpio", "ti,keystone-gpio";
   286			reg = <0x00 0x00620000 0x00 0x100>;
   287			gpio-controller;
   288			#gpio-cells = <2>;
   289			interrupt-parent = <&main_gpio_intr>;
   290			interrupts = <163>, <164>, <165>, <166>, <167>;
   291			interrupt-controller;
   292			#interrupt-cells = <2>;
   293			ti,ngpio = <66>;
   294			ti,davinci-gpio-unbanked = <0>;
   295			power-domains = <&k3_pds 165 TI_SCI_PD_EXCLUSIVE>;
   296			clocks = <&k3_clks 165 0>;
   297			clock-names = "gpio";
   298			status = "disabled";
   299		};
   300	
   301		main_gpio6: gpio@630000 {
   302			compatible = "ti,j721e-gpio", "ti,keystone-gpio";
   303			reg = <0x00 0x00630000 0x00 0x100>;
   304			gpio-controller;
   305			#gpio-cells = <2>;
   306			interrupt-parent = <&main_gpio_intr>;
   307			interrupts = <172>, <173>, <174>, <175>, <176>;
   308			interrupt-controller;
   309			#interrupt-cells = <2>;
   310			ti,ngpio = <66>;
   311			ti,davinci-gpio-unbanked = <0>;
   312			power-domains = <&k3_pds 166 TI_SCI_PD_EXCLUSIVE>;
   313			clocks = <&k3_clks 166 0>;
   314			clock-names = "gpio";
   315			status = "disabled";
   316		};
   317	
   318		main_i2c0: i2c@2000000 {
   319			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
   320			reg = <0x00 0x02000000 0x00 0x100>;
   321			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
   322			#address-cells = <1>;
   323			#size-cells = <0>;
   324			clocks = <&k3_clks 270 2>;
   325			clock-names = "fck";
   326			power-domains = <&k3_pds 270 TI_SCI_PD_EXCLUSIVE>;
   327			status = "disabled";
   328		};
   329	
   330		main_i2c1: i2c@2010000 {
   331			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
   332			reg = <0x00 0x02010000 0x00 0x100>;
   333			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
   334			#address-cells = <1>;
   335			#size-cells = <0>;
   336			clocks = <&k3_clks 271 2>;
   337			clock-names = "fck";
   338			power-domains = <&k3_pds 271 TI_SCI_PD_EXCLUSIVE>;
   339			status = "disabled";
   340		};
   341	
   342		main_i2c2: i2c@2020000 {
   343			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
   344			reg = <0x00 0x02020000 0x00 0x100>;
   345			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
   346			#address-cells = <1>;
   347			#size-cells = <0>;
   348			clocks = <&k3_clks 272 2>;
   349			clock-names = "fck";
   350			power-domains = <&k3_pds 272 TI_SCI_PD_EXCLUSIVE>;
   351			status = "disabled";
   352		};
   353	
   354		main_i2c3: i2c@2030000 {
   355			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
   356			reg = <0x00 0x02030000 0x00 0x100>;
   357			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
   358			#address-cells = <1>;
   359			#size-cells = <0>;
   360			clocks = <&k3_clks 273 2>;
   361			clock-names = "fck";
   362			power-domains = <&k3_pds 273 TI_SCI_PD_EXCLUSIVE>;
   363			status = "disabled";
   364		};
   365	
   366		main_i2c4: i2c@2040000 {
   367			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
   368			reg = <0x00 0x02040000 0x00 0x100>;
   369			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
   370			#address-cells = <1>;
   371			#size-cells = <0>;
   372			clocks = <&k3_clks 274 2>;
   373			clock-names = "fck";
   374			power-domains = <&k3_pds 274 TI_SCI_PD_EXCLUSIVE>;
   375			status = "disabled";
   376		};
   377	
   378		main_i2c5: i2c@2050000 {
   379			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
   380			reg = <0x00 0x02050000 0x00 0x100>;
   381			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
   382			#address-cells = <1>;
   383			#size-cells = <0>;
   384			clocks = <&k3_clks 275 2>;
   385			clock-names = "fck";
   386			power-domains = <&k3_pds 275 TI_SCI_PD_EXCLUSIVE>;
   387			status = "disabled";
   388		};
   389	
   390		main_i2c6: i2c@2060000 {
   391			compatible = "ti,j721e-i2c", "ti,omap4-i2c";
   392			reg = <0x00 0x02060000 0x00 0x100>;
   393			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
   394			#address-cells = <1>;
   395			#size-cells = <0>;
   396			clocks = <&k3_clks 276 2>;
   397			clock-names = "fck";
   398			power-domains = <&k3_pds 276 TI_SCI_PD_EXCLUSIVE>;
   399			status = "disabled";
   400		};
   401	
   402	    vpu0: video-codec@4210000 {
   403			compatible = "cnm,cm521c-vpu";
   404			reg = <0x00 0x4210000 0x00 0x10000>;
   405			interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
   406			clocks = <&k3_clks 241 2>;
   407			clock-names = "vcodec";
   408			power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
   409			sram=<&msmc_ram>;
   410		};
   411	
   412	    vpu1: video-codec@4220000 {
   413			compatible = "cnm,cm521c-vpu";
   414			reg = <0x00 0x4220000 0x00 0x10000>;
   415			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
   416			clocks = <&k3_clks 242 2>;
   417			clock-names = "vcodec";
   418			power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
   419			sram=<&msmc_ram>;
   420		};
   421	
   422		main_sdhci0: mmc@4f80000 {
   423			compatible = "ti,j721e-sdhci-8bit";
   424			reg = <0x00 0x04f80000 0x00 0x1000>,
   425			      <0x00 0x04f88000 0x00 0x400>;
   426			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
   427			power-domains = <&k3_pds 140 TI_SCI_PD_EXCLUSIVE>;
   428			clocks = <&k3_clks 140 1>, <&k3_clks 140 2>;
   429			clock-names =  "clk_ahb", "clk_xin";
   430			assigned-clocks = <&k3_clks 140 2>;
   431			assigned-clock-parents = <&k3_clks 140 3>;
   432			bus-width = <8>;
   433			ti,otap-del-sel-legacy = <0x0>;
   434			ti,otap-del-sel-mmc-hs = <0x0>;
   435			ti,otap-del-sel-ddr52 = <0x6>;
   436			ti,otap-del-sel-hs200 = <0x8>;
   437			ti,otap-del-sel-hs400 = <0x5>;
   438			ti,itap-del-sel-legacy = <0x10>;
   439			ti,itap-del-sel-mmc-hs = <0xa>;
   440			ti,strobe-sel = <0x77>;
   441			ti,clkbuf-sel = <0x7>;
   442			ti,trm-icp = <0x8>;
   443			mmc-ddr-1_8v;
   444			mmc-hs200-1_8v;
   445			mmc-hs400-1_8v;
   446			dma-coherent;
   447			no-1-8-v;
   448			status = "disabled";
   449		};
   450	
   451		main_sdhci1: mmc@4fb0000 {
   452			compatible = "ti,j721e-sdhci-4bit";
   453			reg = <0x00 0x04fb0000 0x00 0x1000>,
   454			      <0x00 0x04fb8000 0x00 0x400>;
   455			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
   456			power-domains = <&k3_pds 141 TI_SCI_PD_EXCLUSIVE>;
   457			clocks = <&k3_clks 141 3>, <&k3_clks 141 4>;
   458			clock-names =  "clk_ahb", "clk_xin";
   459			assigned-clocks = <&k3_clks 141 4>;
   460			assigned-clock-parents = <&k3_clks 141 5>;
   461			bus-width = <4>;
   462			ti,otap-del-sel-legacy = <0x0>;
   463			ti,otap-del-sel-sd-hs = <0x0>;
   464			ti,otap-del-sel-sdr12 = <0xf>;
   465			ti,otap-del-sel-sdr25 = <0xf>;
   466			ti,otap-del-sel-sdr50 = <0xc>;
   467			ti,otap-del-sel-sdr104 = <0x5>;
   468			ti,otap-del-sel-ddr50 = <0xc>;
   469			ti,itap-del-sel-legacy = <0x0>;
   470			ti,itap-del-sel-sd-hs = <0x0>;
   471			ti,itap-del-sel-sdr12 = <0x0>;
   472			ti,itap-del-sel-sdr25 = <0x0>;
   473			ti,clkbuf-sel = <0x7>;
   474			ti,trm-icp = <0x8>;
   475			dma-coherent;
   476			sdhci-caps-mask = <0x00000003 0x00000000>;
   477			no-1-8-v;
   478			status = "disabled";
   479		};
   480	
   481		serdes_wiz0: wiz@5060000 {
   482			compatible = "ti,j784s4-wiz-10g";
   483			#address-cells = <1>;
   484			#size-cells = <1>;
   485			power-domains = <&k3_pds 404 TI_SCI_PD_EXCLUSIVE>;
   486			clocks = <&k3_clks 404 2>, <&k3_clks 404 6>, <&serdes_refclk>, <&k3_clks 404 5>;
   487			clock-names = "fck", "core_ref_clk", "ext_ref_clk", "core_ref1_clk";
   488			assigned-clocks = <&k3_clks 404 6>;
   489			assigned-clock-parents = <&k3_clks 404 10>;
   490			num-lanes = <4>;
   491			#reset-cells = <1>;
   492			#clock-cells = <1>;
   493			ranges = <0x5060000 0x00 0x5060000 0x10000>;
   494	
   495			status = "disabled";
   496	
   497			serdes0: serdes@5060000 {
   498				compatible = "ti,j721e-serdes-10g";
   499				reg = <0x05060000 0x010000>;
   500				reg-names = "torrent_phy";
   501				resets = <&serdes_wiz0 0>;
   502				reset-names = "torrent_reset";
   503				clocks = <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
   504					 <&serdes_wiz0 TI_WIZ_PHY_EN_REFCLK>;
   505				clock-names = "refclk", "phy_en_refclk";
   506				assigned-clocks = <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
   507						  <&serdes_wiz0 TI_WIZ_PLL1_REFCLK>,
   508						  <&serdes_wiz0 TI_WIZ_REFCLK_DIG>;
   509				assigned-clock-parents = <&k3_clks 404 6>,
   510							 <&k3_clks 404 6>,
   511							 <&k3_clks 404 6>;
   512				#address-cells = <1>;
   513				#size-cells = <0>;
   514				#clock-cells = <1>;
   515	
   516				status = "disabled";
   517			};
   518		};
   519	
   520		serdes_wiz1: wiz@5070000 {
   521			compatible = "ti,j784s4-wiz-10g";
   522			#address-cells = <1>;
   523			#size-cells = <1>;
   524			power-domains = <&k3_pds 405 TI_SCI_PD_EXCLUSIVE>;
   525			clocks = <&k3_clks 405 2>, <&k3_clks 405 6>, <&serdes_refclk>, <&k3_clks 405 5>;
   526			clock-names = "fck", "core_ref_clk", "ext_ref_clk", "core_ref1_clk";
   527			assigned-clocks = <&k3_clks 405 6>;
   528			assigned-clock-parents = <&k3_clks 405 10>;
   529			num-lanes = <4>;
   530			#reset-cells = <1>;
   531			#clock-cells = <1>;
   532			ranges = <0x05070000 0x00 0x05070000 0x10000>;
   533	
   534			status = "disabled";
   535	
   536			serdes1: serdes@5070000 {
   537				compatible = "ti,j721e-serdes-10g";
   538				reg = <0x05070000 0x010000>;
   539				reg-names = "torrent_phy";
   540				resets = <&serdes_wiz1 0>;
   541				reset-names = "torrent_reset";
   542				clocks = <&serdes_wiz1 TI_WIZ_PLL0_REFCLK>,
   543					 <&serdes_wiz1 TI_WIZ_PHY_EN_REFCLK>;
   544				clock-names = "refclk", "phy_en_refclk";
   545				assigned-clocks = <&serdes_wiz1 TI_WIZ_PLL0_REFCLK>,
   546						  <&serdes_wiz1 TI_WIZ_PLL1_REFCLK>,
   547						  <&serdes_wiz1 TI_WIZ_REFCLK_DIG>;
   548				assigned-clock-parents = <&k3_clks 405 6>,
   549							 <&k3_clks 405 6>,
   550							 <&k3_clks 405 6>;
   551				#address-cells = <1>;
   552				#size-cells = <0>;
   553				#clock-cells = <1>;
   554	
   555				status = "disabled";
   556			};
   557		};
   558	
   559		serdes_wiz2: wiz@5020000 {
   560			compatible = "ti,j784s4-wiz-10g";
   561			#address-cells = <1>;
   562			#size-cells = <1>;
   563			power-domains = <&k3_pds 406 TI_SCI_PD_EXCLUSIVE>;
   564			clocks = <&k3_clks 406 2>, <&k3_clks 406 6>, <&serdes_refclk>, <&k3_clks 406 5>;
   565			clock-names = "fck", "core_ref_clk", "ext_ref_clk", "core_ref1_clk";
   566			assigned-clocks = <&k3_clks 406 6>;
   567			assigned-clock-parents = <&k3_clks 406 10>;
   568			num-lanes = <4>;
   569			#reset-cells = <1>;
   570			#clock-cells = <1>;
   571			ranges = <0x05020000 0x00 0x05020000 0x10000>;
   572	
   573			status = "disabled";
   574	
   575			serdes2: serdes@5020000 {
   576				compatible = "ti,j721e-serdes-10g";
   577				reg = <0x05020000 0x010000>;
   578				reg-names = "torrent_phy";
   579				resets = <&serdes_wiz2 0>;
   580				reset-names = "torrent_reset";
   581				clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
   582					 <&serdes_wiz2 TI_WIZ_PHY_EN_REFCLK>;
   583				clock-names = "refclk", "phy_en_refclk";
   584				assigned-clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
   585						  <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
   586						  <&serdes_wiz2 TI_WIZ_REFCLK_DIG>;
   587				assigned-clock-parents = <&k3_clks 406 6>,
   588							 <&k3_clks 406 6>,
   589							 <&k3_clks 406 6>;
   590				#address-cells = <1>;
   591				#size-cells = <0>;
   592				#clock-cells = <1>;
   593	
   594				status = "disabled";
   595			};
   596		};
   597	
   598		serdes_wiz4: wiz@5050000 {
   599			compatible = "ti,j784s4-wiz-10g";
   600			#address-cells = <1>;
   601			#size-cells = <1>;
   602			power-domains = <&k3_pds 407 TI_SCI_PD_EXCLUSIVE>;
   603			clocks = <&k3_clks 407 2>, <&k3_clks 407 6>, <&serdes_refclk>, <&k3_clks 407 5>;
   604			clock-names = "fck", "core_ref_clk", "ext_ref_clk", "core_ref1_clk";
   605			assigned-clocks = <&k3_clks 407 6>;
   606			assigned-clock-parents = <&k3_clks 407 10>;
   607			num-lanes = <4>;
   608			#reset-cells = <1>;
   609			#clock-cells = <1>;
   610			ranges = <0x05050000 0x00 0x05050000 0x10000>,
   611				 <0xa030a00 0x00 0xa030a00 0x40>; /* DPTX PHY */
   612	
   613			status = "disabled";
   614	
   615			serdes4: serdes@5050000 {
   616				/*
   617				 * Note: we also map DPTX PHY registers as the Torrent
   618				 * needs to manage those.
   619				 */
   620				compatible = "ti,j721e-serdes-10g";
   621				reg = <0x05050000 0x010000>,
   622				      <0x0a030a00 0x40>; /* DPTX PHY */
   623				reg-names = "torrent_phy";
   624				resets = <&serdes_wiz4 0>;
   625				reset-names = "torrent_reset";
   626				clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
   627					 <&serdes_wiz4 TI_WIZ_PHY_EN_REFCLK>;
   628				clock-names = "refclk", "phy_en_refclk";
   629				assigned-clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
   630						  <&serdes_wiz4 TI_WIZ_PLL1_REFCLK>,
   631						  <&serdes_wiz4 TI_WIZ_REFCLK_DIG>;
   632				assigned-clock-parents = <&k3_clks 407 6>,
   633							 <&k3_clks 407 6>,
   634							 <&k3_clks 407 6>;
   635				#address-cells = <1>;
   636				#size-cells = <0>;
   637				#clock-cells = <1>;
   638	
   639				status = "disabled";
   640			};
   641		};
   642	
   643		main_navss: bus@30000000 {
   644			compatible = "simple-bus";
   645			#address-cells = <2>;
   646			#size-cells = <2>;
   647			ranges = <0x00 0x30000000 0x00 0x30000000 0x00 0x0c400000>;
   648			ti,sci-dev-id = <280>;
   649			dma-coherent;
   650			dma-ranges;
   651	
   652			main_navss_intr: interrupt-controller@310e0000 {
   653				compatible = "ti,sci-intr";
   654				reg = <0x00 0x310e0000 0x00 0x4000>;
   655				ti,intr-trigger-type = <4>;
   656				interrupt-controller;
   657				interrupt-parent = <&gic500>;
   658				#interrupt-cells = <1>;
   659				ti,sci = <&sms>;
   660				ti,sci-dev-id = <283>;
   661				ti,interrupt-ranges = <0 64 64>,
   662						      <64 448 64>,
   663						      <128 672 64>;
   664			};
   665	
   666			main_udmass_inta: msi-controller@33d00000 {
   667				compatible = "ti,sci-inta";
   668				reg = <0x00 0x33d00000 0x00 0x100000>;
   669				interrupt-controller;
   670				#interrupt-cells = <0>;
   671				interrupt-parent = <&main_navss_intr>;
   672				msi-controller;
   673				ti,sci = <&sms>;
   674				ti,sci-dev-id = <321>;
   675				ti,interrupt-ranges = <0 0 256>;
   676			};
   677	
   678			secure_proxy_main: mailbox@32c00000 {
   679				compatible = "ti,am654-secure-proxy";
   680				#mbox-cells = <1>;
   681				reg-names = "target_data", "rt", "scfg";
   682				reg = <0x00 0x32c00000 0x00 0x100000>,
   683				      <0x00 0x32400000 0x00 0x100000>,
   684				      <0x00 0x32800000 0x00 0x100000>;
   685				interrupt-names = "rx_011";
   686				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
   687			};
   688	
   689			hwspinlock: hwlock@30e00000 {
   690				compatible = "ti,am654-hwspinlock";
   691				reg = <0x00 0x30e00000 0x00 0x1000>;
   692				#hwlock-cells = <1>;
   693			};
   694	
   695			mailbox0_cluster0: mailbox@31f80000 {
   696				compatible = "ti,am654-mailbox";
   697				reg = <0x00 0x31f80000 0x00 0x200>;
   698				#mbox-cells = <1>;
   699				ti,mbox-num-users = <4>;
   700				ti,mbox-num-fifos = <16>;
   701				interrupt-parent = <&main_navss_intr>;
   702				status = "disabled";
   703			};
   704	
   705			mailbox0_cluster1: mailbox@31f81000 {
   706				compatible = "ti,am654-mailbox";
   707				reg = <0x00 0x31f81000 0x00 0x200>;
   708				#mbox-cells = <1>;
   709				ti,mbox-num-users = <4>;
   710				ti,mbox-num-fifos = <16>;
   711				interrupt-parent = <&main_navss_intr>;
   712				status = "disabled";
   713			};
   714	
   715			mailbox0_cluster2: mailbox@31f82000 {
   716				compatible = "ti,am654-mailbox";
   717				reg = <0x00 0x31f82000 0x00 0x200>;
   718				#mbox-cells = <1>;
   719				ti,mbox-num-users = <4>;
   720				ti,mbox-num-fifos = <16>;
   721				interrupt-parent = <&main_navss_intr>;
   722				status = "disabled";
   723			};
   724	
   725			mailbox0_cluster3: mailbox@31f83000 {
   726				compatible = "ti,am654-mailbox";
   727				reg = <0x00 0x31f83000 0x00 0x200>;
   728				#mbox-cells = <1>;
   729				ti,mbox-num-users = <4>;
   730				ti,mbox-num-fifos = <16>;
   731				interrupt-parent = <&main_navss_intr>;
   732				status = "disabled";
   733			};
   734	
   735			mailbox0_cluster4: mailbox@31f84000 {
   736				compatible = "ti,am654-mailbox";
   737				reg = <0x00 0x31f84000 0x00 0x200>;
   738				#mbox-cells = <1>;
   739				ti,mbox-num-users = <4>;
   740				ti,mbox-num-fifos = <16>;
   741				interrupt-parent = <&main_navss_intr>;
   742				status = "disabled";
   743			};
   744	
   745			mailbox0_cluster5: mailbox@31f85000 {
   746				compatible = "ti,am654-mailbox";
   747				reg = <0x00 0x31f85000 0x00 0x200>;
   748				#mbox-cells = <1>;
   749				ti,mbox-num-users = <4>;
   750				ti,mbox-num-fifos = <16>;
   751				interrupt-parent = <&main_navss_intr>;
   752				status = "disabled";
   753			};
   754	
   755			mailbox0_cluster6: mailbox@31f86000 {
   756				compatible = "ti,am654-mailbox";
   757				reg = <0x00 0x31f86000 0x00 0x200>;
   758				#mbox-cells = <1>;
   759				ti,mbox-num-users = <4>;
   760				ti,mbox-num-fifos = <16>;
   761				interrupt-parent = <&main_navss_intr>;
   762				status = "disabled";
   763			};
   764	
   765			mailbox0_cluster7: mailbox@31f87000 {
   766				compatible = "ti,am654-mailbox";
   767				reg = <0x00 0x31f87000 0x00 0x200>;
   768				#mbox-cells = <1>;
   769				ti,mbox-num-users = <4>;
   770				ti,mbox-num-fifos = <16>;
   771				interrupt-parent = <&main_navss_intr>;
   772				status = "disabled";
   773			};
   774	
   775			mailbox0_cluster8: mailbox@31f88000 {
   776				compatible = "ti,am654-mailbox";
   777				reg = <0x00 0x31f88000 0x00 0x200>;
   778				#mbox-cells = <1>;
   779				ti,mbox-num-users = <4>;
   780				ti,mbox-num-fifos = <16>;
   781				interrupt-parent = <&main_navss_intr>;
   782				status = "disabled";
   783			};
   784	
   785			mailbox0_cluster9: mailbox@31f89000 {
   786				compatible = "ti,am654-mailbox";
   787				reg = <0x00 0x31f89000 0x00 0x200>;
   788				#mbox-cells = <1>;
   789				ti,mbox-num-users = <4>;
   790				ti,mbox-num-fifos = <16>;
   791				interrupt-parent = <&main_navss_intr>;
   792				status = "disabled";
   793			};
   794	
   795			mailbox0_cluster10: mailbox@31f8a000 {
   796				compatible = "ti,am654-mailbox";
   797				reg = <0x00 0x31f8a000 0x00 0x200>;
   798				#mbox-cells = <1>;
   799				ti,mbox-num-users = <4>;
   800				ti,mbox-num-fifos = <16>;
   801				interrupt-parent = <&main_navss_intr>;
   802				status = "disabled";
   803			};
   804	
   805			mailbox0_cluster11: mailbox@31f8b000 {
   806				compatible = "ti,am654-mailbox";
   807				reg = <0x00 0x31f8b000 0x00 0x200>;
   808				#mbox-cells = <1>;
   809				ti,mbox-num-users = <4>;
   810				ti,mbox-num-fifos = <16>;
   811				interrupt-parent = <&main_navss_intr>;
   812				status = "disabled";
   813			};
   814	
   815			mailbox1_cluster0: mailbox@31f90000 {
   816				compatible = "ti,am654-mailbox";
   817				reg = <0x00 0x31f90000 0x00 0x200>;
   818				#mbox-cells = <1>;
   819				ti,mbox-num-users = <4>;
   820				ti,mbox-num-fifos = <16>;
   821				interrupt-parent = <&main_navss_intr>;
   822				status = "disabled";
   823			};
   824	
   825			mailbox1_cluster1: mailbox@31f91000 {
   826				compatible = "ti,am654-mailbox";
   827				reg = <0x00 0x31f91000 0x00 0x200>;
   828				#mbox-cells = <1>;
   829				ti,mbox-num-users = <4>;
   830				ti,mbox-num-fifos = <16>;
   831				interrupt-parent = <&main_navss_intr>;
   832				status = "disabled";
   833			};
   834	
   835			mailbox1_cluster2: mailbox@31f92000 {
   836				compatible = "ti,am654-mailbox";
   837				reg = <0x00 0x31f92000 0x00 0x200>;
   838				#mbox-cells = <1>;
   839				ti,mbox-num-users = <4>;
   840				ti,mbox-num-fifos = <16>;
   841				interrupt-parent = <&main_navss_intr>;
   842				status = "disabled";
   843			};
   844	
   845			mailbox1_cluster3: mailbox@31f93000 {
   846				compatible = "ti,am654-mailbox";
   847				reg = <0x00 0x31f93000 0x00 0x200>;
   848				#mbox-cells = <1>;
   849				ti,mbox-num-users = <4>;
   850				ti,mbox-num-fifos = <16>;
   851				interrupt-parent = <&main_navss_intr>;
   852				status = "disabled";
   853			};
   854	
   855			mailbox1_cluster4: mailbox@31f94000 {
   856				compatible = "ti,am654-mailbox";
   857				reg = <0x00 0x31f94000 0x00 0x200>;
   858				#mbox-cells = <1>;
   859				ti,mbox-num-users = <4>;
   860				ti,mbox-num-fifos = <16>;
   861				interrupt-parent = <&main_navss_intr>;
   862				status = "disabled";
   863			};
   864	
   865			mailbox1_cluster5: mailbox@31f95000 {
   866				compatible = "ti,am654-mailbox";
   867				reg = <0x00 0x31f95000 0x00 0x200>;
   868				#mbox-cells = <1>;
   869				ti,mbox-num-users = <4>;
   870				ti,mbox-num-fifos = <16>;
   871				interrupt-parent = <&main_navss_intr>;
   872				status = "disabled";
   873			};
   874	
   875			mailbox1_cluster6: mailbox@31f96000 {
   876				compatible = "ti,am654-mailbox";
   877				reg = <0x00 0x31f96000 0x00 0x200>;
   878				#mbox-cells = <1>;
   879				ti,mbox-num-users = <4>;
   880				ti,mbox-num-fifos = <16>;
   881				interrupt-parent = <&main_navss_intr>;
   882				status = "disabled";
   883			};
   884	
   885			mailbox1_cluster7: mailbox@31f97000 {
   886				compatible = "ti,am654-mailbox";
   887				reg = <0x00 0x31f97000 0x00 0x200>;
   888				#mbox-cells = <1>;
   889				ti,mbox-num-users = <4>;
   890				ti,mbox-num-fifos = <16>;
   891				interrupt-parent = <&main_navss_intr>;
   892				status = "disabled";
   893			};
   894	
   895			mailbox1_cluster8: mailbox@31f98000 {
   896				compatible = "ti,am654-mailbox";
   897				reg = <0x00 0x31f98000 0x00 0x200>;
   898				#mbox-cells = <1>;
   899				ti,mbox-num-users = <4>;
   900				ti,mbox-num-fifos = <16>;
   901				interrupt-parent = <&main_navss_intr>;
   902				status = "disabled";
   903			};
   904	
   905			mailbox1_cluster9: mailbox@31f99000 {
   906				compatible = "ti,am654-mailbox";
   907				reg = <0x00 0x31f99000 0x00 0x200>;
   908				#mbox-cells = <1>;
   909				ti,mbox-num-users = <4>;
   910				ti,mbox-num-fifos = <16>;
   911				interrupt-parent = <&main_navss_intr>;
   912				status = "disabled";
   913			};
   914	
   915			mailbox1_cluster10: mailbox@31f9a000 {
   916				compatible = "ti,am654-mailbox";
   917				reg = <0x00 0x31f9a000 0x00 0x200>;
   918				#mbox-cells = <1>;
   919				ti,mbox-num-users = <4>;
   920				ti,mbox-num-fifos = <16>;
   921				interrupt-parent = <&main_navss_intr>;
   922				status = "disabled";
   923			};
   924	
   925			mailbox1_cluster11: mailbox@31f9b000 {
   926				compatible = "ti,am654-mailbox";
   927				reg = <0x00 0x31f9b000 0x00 0x200>;
   928				#mbox-cells = <1>;
   929				ti,mbox-num-users = <4>;
   930				ti,mbox-num-fifos = <16>;
   931				interrupt-parent = <&main_navss_intr>;
   932				status = "disabled";
   933			};
   934	
   935			main_ringacc: ringacc@3c000000 {
   936				compatible = "ti,am654-navss-ringacc";
   937				reg = <0x00 0x3c000000 0x00 0x400000>,
   938				      <0x00 0x38000000 0x00 0x400000>,
   939				      <0x00 0x31120000 0x00 0x100>,
   940				      <0x00 0x33000000 0x00 0x40000>;
   941				reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target";
   942				ti,num-rings = <1024>;
   943				ti,sci-rm-range-gp-rings = <0x1>;
   944				ti,sci = <&sms>;
   945				ti,sci-dev-id = <315>;
   946				msi-parent = <&main_udmass_inta>;
   947			};
   948	
   949			main_udmap: dma-controller@31150000 {
   950				compatible = "ti,j721e-navss-main-udmap";
   951				reg = <0x00 0x31150000 0x00 0x100>,
   952				      <0x00 0x34000000 0x00 0x80000>,
   953				      <0x00 0x35000000 0x00 0x200000>;
   954				reg-names = "gcfg", "rchanrt", "tchanrt";
   955				msi-parent = <&main_udmass_inta>;
   956				#dma-cells = <1>;
   957	
   958				ti,sci = <&sms>;
   959				ti,sci-dev-id = <319>;
   960				ti,ringacc = <&main_ringacc>;
   961	
   962				ti,sci-rm-range-tchan = <0x0d>, /* TX_CHAN */
   963							<0x0f>, /* TX_HCHAN */
   964							<0x10>; /* TX_UHCHAN */
   965				ti,sci-rm-range-rchan = <0x0a>, /* RX_CHAN */
   966							<0x0b>, /* RX_HCHAN */
   967							<0x0c>; /* RX_UHCHAN */
   968				ti,sci-rm-range-rflow = <0x00>; /* GP RFLOW */
   969			};
   970	
   971			cpts@310d0000 {
   972				compatible = "ti,j721e-cpts";
   973				reg = <0x00 0x310d0000 0x00 0x400>;
   974				reg-names = "cpts";
   975				clocks = <&k3_clks 282 0>;
   976				clock-names = "cpts";
   977				assigned-clocks = <&k3_clks 62 3>; /* CPTS_RFT_CLK */
   978				assigned-clock-parents = <&k3_clks 62 5>; /* MAIN_0_HSDIV6_CLK */
   979				interrupts-extended = <&main_navss_intr 391>;
   980				interrupt-names = "cpts";
   981				ti,cpts-periodic-outputs = <6>;
   982				ti,cpts-ext-ts-inputs = <8>;
   983			};
   984		};
   985	
   986		main_cpsw1: ethernet@c200000 {
   987			compatible = "ti,j721e-cpsw-nuss";
   988			reg = <0x00 0xc200000 0x00 0x200000>;
   989			reg-names = "cpsw_nuss";
   990			ranges = <0x00 0x00 0x00 0xc200000 0x00 0x200000>;
   991			#address-cells = <2>;
   992			#size-cells = <2>;
   993			dma-coherent;
   994			clocks = <&k3_clks 62 0>;
   995			clock-names = "fck";
   996			power-domains = <&k3_pds 62 TI_SCI_PD_EXCLUSIVE>;
   997	
   998			dmas = <&main_udmap 0xc640>,
   999			       <&main_udmap 0xc641>,
  1000			       <&main_udmap 0xc642>,
  1001			       <&main_udmap 0xc643>,
  1002			       <&main_udmap 0xc644>,
  1003			       <&main_udmap 0xc645>,
  1004			       <&main_udmap 0xc646>,
  1005			       <&main_udmap 0xc647>,
  1006			       <&main_udmap 0x4640>;
  1007			dma-names = "tx0", "tx1", "tx2", "tx3",
  1008				    "tx4", "tx5", "tx6", "tx7",
  1009				    "rx";
  1010	
  1011			status = "disabled";
  1012	
  1013			ethernet-ports {
  1014				#address-cells = <1>;
  1015				#size-cells = <0>;
  1016	
  1017				main_cpsw1_port1: port@1 {
  1018					reg = <1>;
  1019					label = "port1";
  1020					phys = <&cpsw1_phy_gmii_sel 1>;
  1021					ti,mac-only;
  1022					status = "disabled";
  1023				};
  1024			};
  1025	
  1026			main_cpsw1_mdio: mdio@f00 {
  1027				compatible = "ti,cpsw-mdio", "ti,davinci_mdio";
  1028				reg = <0x00 0xf00 0x00 0x100>;
  1029				#address-cells = <1>;
  1030				#size-cells = <0>;
  1031				clocks = <&k3_clks 62 0>;
  1032				clock-names = "fck";
  1033				bus_freq = <1000000>;
  1034			};
  1035	
  1036			cpts@3d000 {
  1037				compatible = "ti,am65-cpts";
  1038				reg = <0x00 0x3d000 0x00 0x400>;
  1039				clocks = <&k3_clks 62 3>;
  1040				clock-names = "cpts";
  1041				interrupts-extended = <&gic500 GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
  1042				interrupt-names = "cpts";
  1043				ti,cpts-ext-ts-inputs = <4>;
  1044				ti,cpts-periodic-outputs = <2>;
  1045			};
  1046		};
  1047	
> 1048		pcie0_rc: pcie@2900000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
