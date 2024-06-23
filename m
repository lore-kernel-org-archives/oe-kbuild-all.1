Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7DA64D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 11:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719141778; cv=none; b=qJH1/RdSp6VcQHdiYhC4AgdgdHbqjDLG5x6NlKJTzIzFyjSpD1nRiwvQhn4XJEExvm9c/Eci0HRuMZQCutP/xDdG891+3avt6O5iVkfoDhERfqokNAJ+is+R9KonIuEGwIZC3dRqQpuf2Q0eDsDF236JLmwkbHsL76Nd20fsgAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719141778; c=relaxed/simple;
	bh=CViLET54mcGJVQhZXdIj0Fqe81+urdJbCer12YGT9UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kh/JPYOWZUvws8ramStbnbekCIaGQtVOC1htJn3GiK5L6jYJFT6vpKCcxBp83/z06xhwr6m3MVLnI2cu0cvDpEcVB72E6sfUi5dUR1Jnuc1zQ6pOHGAI5CUyGI4wkj79LfLPEuWKSKzGoo1+j+OTjGPBIsc7Ne1N4rdEKXZIazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzIyy3ls; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzIyy3ls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719141776; x=1750677776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CViLET54mcGJVQhZXdIj0Fqe81+urdJbCer12YGT9UE=;
  b=VzIyy3lsaU71NR9tCm6tWKOLJgw0WNNRcPpVjsLbXfNBuUK3eXxYdNCd
   HMXQG0yWmD7psswRTX1E9aVI/tGxNG6FbXCEgHDdURrov52VRybp8j3wt
   pxorRFIQtPtcUK1d0uhCZudBARFrq/HTMwub/q3DQGn1HCyJ425kh9Bt9
   qgo6/yfwwd7SudnyeUdQYpXyxh9q57zvIrVpV1Fc/uObmtMwgoxAL1GDe
   ZsdmmsCFO6yDRGAbyfP+o6wmhlM0i+LkeQoahjytQxBGvDUeUMyOA3a4h
   AoC78VvnRJrz8W+670LsdQYOuobxq44N8o0HcU4D2Ac/4VH75j348gKA0
   w==;
X-CSE-ConnectionGUID: XVFaKydkT36+gNo9y/I9ng==
X-CSE-MsgGUID: q/mNh+KvT/qFqCRWEDheqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="16091877"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="16091877"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 04:22:55 -0700
X-CSE-ConnectionGUID: nvw89egoQh2lNqKYbHNC0A==
X-CSE-MsgGUID: bsvw2J4rSvS4+QZuaLZPkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="42922968"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jun 2024 04:22:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLLJ5-000ATG-2D;
	Sun, 23 Jun 2024 11:22:51 +0000
Date: Sun, 23 Jun 2024 19:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>, Rahul T R <r-ravikumar@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 2/4]
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts:101.64-104.5: Warning
 (unit_address_vs_reg): /reserved-memory/edgeai-rtos-ipc-memory-region: node
 has a reg or ranges property, but no unit name
Message-ID: <202406231920.dZNvTLh5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y
head:   10e40a5ae075f5d07636fd78ec5bffe9d3faa668
commit: f4e415ebe04e8e2dd852f25610cd604b9f4a5e58 [2/4] arm64: dts: ti: k3-am62a7-sk: Reserve memory for remote cores running edge-ai firmwares
config: arm64-randconfig-001-20240623 (https://download.01.org/0day-ci/archive/20240623/202406231920.dZNvTLh5-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406231920.dZNvTLh5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406231920.dZNvTLh5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dts:101.64-104.5: Warning (unit_address_vs_reg): /reserved-memory/edgeai-rtos-ipc-memory-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dts:112.48-115.5: Warning (unit_address_vs_reg): /reserved-memory/edgeai_shared-memories: node has a reg or ranges property, but no unit name

vim +101 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts

    14	
    15	/ {
    16		compatible = "ti,am62a7-sk", "ti,am62a7";
    17		model = "Texas Instruments AM62A7 SK";
    18	
    19		aliases {
    20			serial0 = &wkup_uart0;
    21			serial2 = &main_uart0;
    22			serial3 = &main_uart1;
    23			mmc0 = &sdhci0;
    24			mmc1 = &sdhci1;
    25			ethernet0 = &cpsw_port1;
    26			spi0 = &ospi0;
    27		};
    28	
    29		chosen {
    30			stdout-path = "serial2:115200n8";
    31		};
    32	
    33		memory@80000000 {
    34			device_type = "memory";
    35			/* 4G RAM */
    36			reg = <0x00000000 0x80000000 0x00000000 0x80000000>,
    37			      <0x00000008 0x80000000 0x00000000 0x80000000>;
    38		};
    39	
    40		reserved-memory {
    41			#address-cells = <2>;
    42			#size-cells = <2>;
    43			ranges;
    44	
    45			/* global cma region */
    46			linux,cma {
    47				compatible = "shared-dma-pool";
    48				reusable;
    49				size = <0x00 0x24000000>;
    50				alloc-ranges = <0x00 0xc0000000 0x00 0x24000000>;
    51				linux,cma-default;
    52			};
    53	
    54			secure_tfa_ddr: tfa@9e780000 {
    55				reg = <0x00 0x9e780000 0x00 0x80000>;
    56				alignment = <0x1000>;
    57				no-map;
    58			};
    59	
    60			secure_ddr: optee@9e800000 {
    61				reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
    62				alignment = <0x1000>;
    63				no-map;
    64			};
    65	
    66			wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
    67				compatible = "shared-dma-pool";
    68				reg = <0x00 0x9c800000 0x00 0x100000>;
    69				no-map;
    70			};
    71	
    72			wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
    73				compatible = "shared-dma-pool";
    74				reg = <0x00 0x9c900000 0x00 0x01e00000>;
    75				no-map;
    76			};
    77			mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
    78				compatible = "shared-dma-pool";
    79				reg = <0x00 0x9b800000 0x00 0x100000>;
    80				no-map;
    81			};
    82	
    83			mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
    84				compatible = "shared-dma-pool";
    85				reg = <0x00 0x9b900000 0x00 0x0f00000>;
    86				no-map;
    87			};
    88	
    89			c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
    90				compatible = "shared-dma-pool";
    91				reg = <0x00 0x99800000 0x00 0x100000>;
    92				no-map;
    93			};
    94	
    95			c7x_0_memory_region: c7x-memory@99900000 {
    96				compatible = "shared-dma-pool";
    97				reg = <0x00 0x99900000 0x00 0x01f00000>;
    98				no-map;
    99			};
   100	
 > 101			edgeai_rtos_ipc_memory_region: edgeai-rtos-ipc-memory-region {
   102				reg = <0x00 0xa0000000 0x00 0x01000000>;
   103				no-map;
   104			};
   105	
   106			edgeai_memory_region: edgeai-dma-memory@a1000000 {
   107				compatible = "shared-dma-pool";
   108				reg = <0x00 0xa1000000 0x00 0x02000000>;
   109				no-map;
   110			};
   111	
 > 112			edgeai_shared_region: edgeai_shared-memories {
   113				compatible = "dma-heap-carveout";
   114				reg = <0x00 0xa3000000 0x00 0x0b000000>;
   115			};
   116	
   117			edgeai_core_heaps: edgeai-core-heap-memory@ae000000 {
   118				compatible = "shared-dma-pool";
   119				reg = <0x00 0xae000000 0x00 0x12000000>;
   120				no-map;
   121			};
   122		};
   123	
   124		vmain_pd: regulator-0 {
   125			/* TPS25750 PD CONTROLLER OUTPUT */
   126			compatible = "regulator-fixed";
   127			regulator-name = "vmain_pd";
   128			regulator-min-microvolt = <5000000>;
   129			regulator-max-microvolt = <5000000>;
   130			regulator-always-on;
   131			regulator-boot-on;
   132		};
   133	
   134		vcc_5v0: regulator-1 {
   135			/* Output of TPS63070 */
   136			compatible = "regulator-fixed";
   137			regulator-name = "vcc_5v0";
   138			regulator-min-microvolt = <5000000>;
   139			regulator-max-microvolt = <5000000>;
   140			vin-supply = <&vmain_pd>;
   141			regulator-always-on;
   142			regulator-boot-on;
   143		};
   144	
   145		vcc_3v3_main: regulator-2 {
   146			/* output of LM5141-Q1 */
   147			compatible = "regulator-fixed";
   148			regulator-name = "vcc_3v3_main";
   149			regulator-min-microvolt = <3300000>;
   150			regulator-max-microvolt = <3300000>;
   151			vin-supply = <&vmain_pd>;
   152			regulator-always-on;
   153			regulator-boot-on;
   154		};
   155	
   156		vdd_mmc1: regulator-3 {
   157			/* TPS22918DBVR */
   158			compatible = "regulator-fixed";
   159			regulator-name = "vdd_mmc1";
   160			regulator-min-microvolt = <3300000>;
   161			regulator-max-microvolt = <3300000>;
   162			regulator-boot-on;
   163			enable-active-high;
   164			gpio = <&exp1 3 GPIO_ACTIVE_HIGH>;
   165		};
   166	
   167		vcc_3v3_sys: regulator-4 {
   168			/* output of TPS222965DSGT */
   169			compatible = "regulator-fixed";
   170			regulator-name = "vcc_3v3_sys";
   171			regulator-min-microvolt = <3300000>;
   172			regulator-max-microvolt = <3300000>;
   173			vin-supply = <&vcc_3v3_main>;
   174			regulator-always-on;
   175			regulator-boot-on;
   176		};
   177	
   178		vddshv_sdio: regulator-5 {
   179			compatible = "regulator-gpio";
   180			regulator-name = "vddshv_sdio";
   181			pinctrl-names = "default";
   182			pinctrl-0 = <&vddshv_sdio_pins_default>;
   183			regulator-min-microvolt = <1800000>;
   184			regulator-max-microvolt = <3300000>;
   185			regulator-boot-on;
   186			vin-supply = <&ldo1>;
   187			gpios = <&main_gpio0 31 GPIO_ACTIVE_HIGH>;
   188			states = <1800000 0x0>,
   189				 <3300000 0x1>;
   190		};
   191	
   192		leds {
   193			compatible = "gpio-leds";
   194			pinctrl-names = "default";
   195			pinctrl-0 = <&usr_led_pins_default>;
   196	
   197			led-0 {
   198				label = "am62a-sk:green:heartbeat";
   199				gpios = <&main_gpio1 49 GPIO_ACTIVE_HIGH>;
   200				linux,default-trigger = "heartbeat";
   201				function = LED_FUNCTION_HEARTBEAT;
   202				default-state = "off";
   203			};
   204		};
   205	
   206		tlv320_mclk: clk-0 {
   207			#clock-cells = <0>;
   208			compatible = "fixed-clock";
   209			clock-frequency = <12288000>;
   210		};
   211	
   212		hdmi0: connector-hdmi {
   213			compatible = "hdmi-connector";
   214			label = "hdmi";
   215			type = "a";
   216	
   217			port {
   218				hdmi_connector_in: endpoint {
   219					remote-endpoint = <&sii9022_out>;
   220				};
   221			};
   222		};
   223	
   224		codec_audio: sound {
   225			compatible = "simple-audio-card";
   226			simple-audio-card,name = "AM62Ax-SKEVM";
   227			simple-audio-card,widgets =
   228				"Headphone",	"Headphone Jack",
   229				"Line",		"Line In",
   230				"Microphone",	"Microphone Jack";
   231			simple-audio-card,routing =
   232				"Headphone Jack",	"HPLOUT",
   233				"Headphone Jack",	"HPROUT",
   234				"LINE1L",		"Line In",
   235				"LINE1R",		"Line In",
   236				"MIC3R",		"Microphone Jack",
   237				"Microphone Jack",	"Mic Bias";
   238			simple-audio-card,format = "dsp_b";
   239			simple-audio-card,bitclock-master = <&sound_master>;
   240			simple-audio-card,frame-master = <&sound_master>;
   241			simple-audio-card,bitclock-inversion;
   242	
   243			simple-audio-card,cpu {
   244				sound-dai = <&mcasp1>;
   245			};
   246	
   247			sound_master: simple-audio-card,codec {
   248				sound-dai = <&tlv320aic3106>;
   249				clocks = <&tlv320_mclk>;
   250			};
   251		};
   252	};
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
