Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C5C10A1A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 05:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717910816; cv=none; b=SLCIfIPA2fgPM0A338vui/pFRogV3PLkduwfIiXl9SAw2IELogFpEF1BxhCZeXR01dHY5y/1RE3m7qPRBGkeQflpRSkcjpF2XLcT8jcCHi20uz0OSNJaaO7OurLfE3iEyDAb+dQS400XXZ7aa+i6oYvcC3mZEAy+WO7XOuQ2Cks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717910816; c=relaxed/simple;
	bh=DWCuicjxfHybhQTjYwcSHgLyOspuzJPvCUN0v34aIMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LUKTaLF6eQ+36jq0zMbGNhgbk3YKfwCej2ymumPNGql34vX2/6B1WvhICCi/h76lA2hr5QPQWONLM58Zz9M/XVDdFMncMBhU9/7Kw5P0hOOurgTPx0KIoH1VKjNx2Slx1zF2WiCUlY9eWPi40lcVpt6EuZ5MRWVK6fUVEfI/MGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuapjt3B; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuapjt3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717910813; x=1749446813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWCuicjxfHybhQTjYwcSHgLyOspuzJPvCUN0v34aIMM=;
  b=fuapjt3BuvOoiHMSQjX0CI+xIQIkMg5HkQ+zDwOZZSlR1e6HNJuSGYAl
   M1+cEznAngMkZYm5mEkAnxtlSolUe8uUpyYufp/wwYtRPtrENYXNqZkik
   q6EJ5LGS0qR7EV2U4iV7vHmNIwMdm2MOwv4N5EYUCmwVto7Crwn2me/+E
   dxjJkjSoPrM24MA2tpOzI9EMRo4EOulkS8xwMzF0EmL0p/YaQFxj/MFDS
   PZggnA2PsFH4lmhCi4ikyBRZIqcrbYits4QhGa2/qQxOz/Td/tF8Zqp6c
   hbtwgSvfsT9IlJxP5x3fZHKM5PplelJzDrqgp+/C5HXT5v+l0qJhfwF0J
   Q==;
X-CSE-ConnectionGUID: coM/hdKvQs2cGlsBGQ97uA==
X-CSE-MsgGUID: ebkuiOYWT0u2KIvZBl94xQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14549272"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14549272"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 22:26:53 -0700
X-CSE-ConnectionGUID: TpNVNToTTaGpczgcjS3g8w==
X-CSE-MsgGUID: iXl/H2oNTpqn8NwOj7XaBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="69901030"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jun 2024 22:26:51 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGB4r-0000sT-2f;
	Sun, 09 Jun 2024 05:26:49 +0000
Date: Sun, 9 Jun 2024 13:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amlogic:v6.11/arm64-dt 9/18]
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning
 (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name,
 but no reg or ranges property
Message-ID: <202406091304.dbqFfDJL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v6.11/arm64-dt
head:   e822ce43968daf9da4368617d2c948c22ccf93f9
commit: cf42ea27fd7f087b43da27b709267211e7e0e8c4 [9/18] arm64: dts: amlogic: move ao_pinctrl into aobus
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406091304.dbqFfDJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406091304.dbqFfDJL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2217.23-2257.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2217.23-2257.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2217.23-2257.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2217.23-2257.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2217.23-2257.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +1754 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi

    15	
    16	/ {
    17		interrupt-parent = <&gic>;
    18		#address-cells = <2>;
    19		#size-cells = <2>;
    20	
    21		aliases {
    22			mmc0 = &sd_emmc_b; /* SD card */
    23			mmc1 = &sd_emmc_c; /* eMMC */
    24			mmc2 = &sd_emmc_a; /* SDIO */
    25		};
    26	
    27		chosen {
    28			#address-cells = <2>;
    29			#size-cells = <2>;
    30			ranges;
    31	
    32			simplefb_cvbs: framebuffer-cvbs {
    33				compatible = "amlogic,simple-framebuffer",
    34					     "simple-framebuffer";
    35				amlogic,pipeline = "vpu-cvbs";
    36				clocks = <&clkc CLKID_HDMI>,
    37					 <&clkc CLKID_HTX_PCLK>,
    38					 <&clkc CLKID_VPU_INTR>;
    39				status = "disabled";
    40			};
    41	
    42			simplefb_hdmi: framebuffer-hdmi {
    43				compatible = "amlogic,simple-framebuffer",
    44					    "simple-framebuffer";
    45				amlogic,pipeline = "vpu-hdmi";
    46				clocks = <&clkc CLKID_HDMI>,
    47					 <&clkc CLKID_HTX_PCLK>,
    48					 <&clkc CLKID_VPU_INTR>;
    49				status = "disabled";
    50			};
    51		};
    52	
    53		efuse: efuse {
    54			compatible = "amlogic,meson-gxbb-efuse";
    55			clocks = <&clkc CLKID_EFUSE>;
    56			#address-cells = <1>;
    57			#size-cells = <1>;
    58			read-only;
    59			secure-monitor = <&sm>;
    60		};
    61	
    62		gpu_opp_table: opp-table-gpu {
    63			compatible = "operating-points-v2";
    64	
    65			opp-124999998 {
    66				opp-hz = /bits/ 64 <124999998>;
    67				opp-microvolt = <800000>;
    68			};
    69			opp-249999996 {
    70				opp-hz = /bits/ 64 <249999996>;
    71				opp-microvolt = <800000>;
    72			};
    73			opp-285714281 {
    74				opp-hz = /bits/ 64 <285714281>;
    75				opp-microvolt = <800000>;
    76			};
    77			opp-399999994 {
    78				opp-hz = /bits/ 64 <399999994>;
    79				opp-microvolt = <800000>;
    80			};
    81			opp-499999992 {
    82				opp-hz = /bits/ 64 <499999992>;
    83				opp-microvolt = <800000>;
    84			};
    85			opp-666666656 {
    86				opp-hz = /bits/ 64 <666666656>;
    87				opp-microvolt = <800000>;
    88			};
    89			opp-799999987 {
    90				opp-hz = /bits/ 64 <799999987>;
    91				opp-microvolt = <800000>;
    92			};
    93		};
    94	
    95		psci {
    96			compatible = "arm,psci-1.0";
    97			method = "smc";
    98		};
    99	
   100		reserved-memory {
   101			#address-cells = <2>;
   102			#size-cells = <2>;
   103			ranges;
   104	
   105			/* 3 MiB reserved for ARM Trusted Firmware (BL31) */
   106			secmon_reserved: secmon@5000000 {
   107				reg = <0x0 0x05000000 0x0 0x300000>;
   108				no-map;
   109			};
   110	
   111			/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
   112			secmon_reserved_bl32: secmon@5300000 {
   113				reg = <0x0 0x05300000 0x0 0x2000000>;
   114				no-map;
   115			};
   116	
   117			linux,cma {
   118				compatible = "shared-dma-pool";
   119				reusable;
   120				size = <0x0 0x10000000>;
   121				alignment = <0x0 0x400000>;
   122				linux,cma-default;
   123			};
   124		};
   125	
   126		sm: secure-monitor {
   127			compatible = "amlogic,meson-gxbb-sm";
   128		};
   129	
   130		soc {
   131			compatible = "simple-bus";
   132			#address-cells = <2>;
   133			#size-cells = <2>;
   134			ranges;
   135	
   136			pcie: pcie@fc000000 {
   137				compatible = "amlogic,g12a-pcie", "snps,dw-pcie";
   138				reg = <0x0 0xfc000000 0x0 0x400000>,
   139				      <0x0 0xff648000 0x0 0x2000>,
   140				      <0x0 0xfc400000 0x0 0x200000>;
   141				reg-names = "elbi", "cfg", "config";
   142				interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
   143				#interrupt-cells = <1>;
   144				interrupt-map-mask = <0 0 0 0>;
   145				interrupt-map = <0 0 0 0 &gic GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
   146				bus-range = <0x0 0xff>;
   147				#address-cells = <3>;
   148				#size-cells = <2>;
   149				device_type = "pci";
   150				ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000>,
   151					 <0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
   152	
   153				clocks = <&clkc CLKID_PCIE_PHY
   154					  &clkc CLKID_PCIE_COMB
   155					  &clkc CLKID_PCIE_PLL>;
   156				clock-names = "general",
   157					      "pclk",
   158					      "port";
   159				resets = <&reset RESET_PCIE_CTRL_A>,
   160					 <&reset RESET_PCIE_APB>;
   161				reset-names = "port",
   162					      "apb";
   163				num-lanes = <1>;
   164				phys = <&usb3_pcie_phy PHY_TYPE_PCIE>;
   165				phy-names = "pcie";
   166				status = "disabled";
   167			};
   168	
   169			ethmac: ethernet@ff3f0000 {
   170				compatible = "amlogic,meson-g12a-dwmac",
   171					     "snps,dwmac-3.70a",
   172					     "snps,dwmac";
   173				reg = <0x0 0xff3f0000 0x0 0x10000>,
   174				      <0x0 0xff634540 0x0 0x8>;
   175				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
   176				interrupt-names = "macirq";
   177				clocks = <&clkc CLKID_ETH>,
   178					 <&clkc CLKID_FCLK_DIV2>,
   179					 <&clkc CLKID_MPLL2>,
   180					 <&clkc CLKID_FCLK_DIV2>;
   181				clock-names = "stmmaceth", "clkin0", "clkin1",
   182					      "timing-adjustment";
   183				rx-fifo-depth = <4096>;
   184				tx-fifo-depth = <2048>;
   185				status = "disabled";
   186	
   187				mdio0: mdio {
   188					#address-cells = <1>;
   189					#size-cells = <0>;
   190					compatible = "snps,dwmac-mdio";
   191				};
   192			};
   193	
   194			apb: bus@ff600000 {
   195				compatible = "simple-bus";
   196				reg = <0x0 0xff600000 0x0 0x200000>;
   197				#address-cells = <2>;
   198				#size-cells = <2>;
   199				ranges = <0x0 0x0 0x0 0xff600000 0x0 0x200000>;
   200	
   201				hdmi_tx: hdmi-tx@0 {
   202					compatible = "amlogic,meson-g12a-dw-hdmi";
   203					reg = <0x0 0x0 0x0 0x10000>;
   204					interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
   205					resets = <&reset RESET_HDMITX_CAPB3>,
   206						 <&reset RESET_HDMITX_PHY>,
   207						 <&reset RESET_HDMITX>;
   208					reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
   209					clocks = <&clkc CLKID_HDMI>,
   210						 <&clkc CLKID_HTX_PCLK>,
   211						 <&clkc CLKID_VPU_INTR>;
   212					clock-names = "isfr", "iahb", "venci";
   213					#address-cells = <1>;
   214					#size-cells = <0>;
   215					#sound-dai-cells = <0>;
   216					status = "disabled";
   217	
   218					/* VPU VENC Input */
   219					hdmi_tx_venc_port: port@0 {
   220						reg = <0>;
   221	
   222						hdmi_tx_in: endpoint {
   223							remote-endpoint = <&hdmi_tx_out>;
   224						};
   225					};
   226	
   227					/* TMDS Output */
   228					hdmi_tx_tmds_port: port@1 {
   229						reg = <1>;
   230					};
   231				};
   232	
   233				apb_efuse: bus@30000 {
   234					compatible = "simple-bus";
   235					reg = <0x0 0x30000 0x0 0x2000>;
   236					#address-cells = <2>;
   237					#size-cells = <2>;
   238					ranges = <0x0 0x0 0x0 0x30000 0x0 0x2000>;
   239	
   240					hwrng: rng@218 {
   241						compatible = "amlogic,meson-rng";
   242						reg = <0x0 0x218 0x0 0x4>;
   243						clocks = <&clkc CLKID_RNG0>;
   244						clock-names = "core";
   245					};
   246				};
   247	
   248				acodec: audio-controller@32000 {
   249					compatible = "amlogic,t9015";
   250					reg = <0x0 0x32000 0x0 0x14>;
   251					#sound-dai-cells = <0>;
   252					sound-name-prefix = "ACODEC";
   253					clocks = <&clkc CLKID_AUDIO_CODEC>;
   254					clock-names = "pclk";
   255					resets = <&reset RESET_AUDIO_CODEC>;
   256					status = "disabled";
   257				};
   258	
   259				periphs: bus@34400 {
   260					compatible = "simple-bus";
   261					reg = <0x0 0x34400 0x0 0x400>;
   262					#address-cells = <2>;
   263					#size-cells = <2>;
   264					ranges = <0x0 0x0 0x0 0x34400 0x0 0x400>;
   265	
   266					periphs_pinctrl: pinctrl@40 {
   267						compatible = "amlogic,meson-g12a-periphs-pinctrl";
   268						#address-cells = <2>;
   269						#size-cells = <2>;
   270						ranges;
   271	
   272						gpio: bank@40 {
   273							reg = <0x0 0x40  0x0 0x4c>,
   274							      <0x0 0xe8  0x0 0x18>,
   275							      <0x0 0x120 0x0 0x18>,
   276							      <0x0 0x2c0 0x0 0x40>,
   277							      <0x0 0x340 0x0 0x1c>;
   278							reg-names = "gpio",
   279								    "pull",
   280								    "pull-enable",
   281								    "mux",
   282								    "ds";
   283							gpio-controller;
   284							#gpio-cells = <2>;
   285							gpio-ranges = <&periphs_pinctrl 0 0 86>;
   286						};
   287	
   288						cec_ao_a_h_pins: cec_ao_a_h {
   289							mux {
   290								groups = "cec_ao_a_h";
   291								function = "cec_ao_a_h";
   292								bias-disable;
   293							};
   294						};
   295	
   296						cec_ao_b_h_pins: cec_ao_b_h {
   297							mux {
   298								groups = "cec_ao_b_h";
   299								function = "cec_ao_b_h";
   300								bias-disable;
   301							};
   302						};
   303	
   304						emmc_ctrl_pins: emmc-ctrl {
   305							mux-0 {
   306								groups = "emmc_cmd";
   307								function = "emmc";
   308								bias-pull-up;
   309								drive-strength-microamp = <4000>;
   310							};
   311	
   312							mux-1 {
   313								groups = "emmc_clk";
   314								function = "emmc";
   315								bias-disable;
   316								drive-strength-microamp = <4000>;
   317							};
   318						};
   319	
   320						emmc_data_4b_pins: emmc-data-4b {
   321							mux-0 {
   322								groups = "emmc_nand_d0",
   323									 "emmc_nand_d1",
   324									 "emmc_nand_d2",
   325									 "emmc_nand_d3";
   326								function = "emmc";
   327								bias-pull-up;
   328								drive-strength-microamp = <4000>;
   329							};
   330						};
   331	
   332						emmc_data_8b_pins: emmc-data-8b {
   333							mux-0 {
   334								groups = "emmc_nand_d0",
   335									 "emmc_nand_d1",
   336									 "emmc_nand_d2",
   337									 "emmc_nand_d3",
   338									 "emmc_nand_d4",
   339									 "emmc_nand_d5",
   340									 "emmc_nand_d6",
   341									 "emmc_nand_d7";
   342								function = "emmc";
   343								bias-pull-up;
   344								drive-strength-microamp = <4000>;
   345							};
   346						};
   347	
   348						emmc_ds_pins: emmc-ds {
   349							mux {
   350								groups = "emmc_nand_ds";
   351								function = "emmc";
   352								bias-pull-down;
   353								drive-strength-microamp = <4000>;
   354							};
   355						};
   356	
   357						emmc_clk_gate_pins: emmc_clk_gate {
   358							mux {
   359								groups = "BOOT_8";
   360								function = "gpio_periphs";
   361								bias-pull-down;
   362								drive-strength-microamp = <4000>;
   363							};
   364						};
   365	
   366						hdmitx_ddc_pins: hdmitx_ddc {
   367							mux {
   368								groups = "hdmitx_sda",
   369									 "hdmitx_sck";
   370								function = "hdmitx";
   371								bias-disable;
   372								drive-strength-microamp = <4000>;
   373							};
   374						};
   375	
   376						hdmitx_hpd_pins: hdmitx_hpd {
   377							mux {
   378								groups = "hdmitx_hpd_in";
   379								function = "hdmitx";
   380								bias-disable;
   381							};
   382						};
   383	
   384	
   385						i2c0_sda_c_pins: i2c0-sda-c {
   386							mux {
   387								groups = "i2c0_sda_c";
   388								function = "i2c0";
   389								bias-disable;
   390								drive-strength-microamp = <3000>;
   391	
   392							};
   393						};
   394	
   395						i2c0_sck_c_pins: i2c0-sck-c {
   396							mux {
   397								groups = "i2c0_sck_c";
   398								function = "i2c0";
   399								bias-disable;
   400								drive-strength-microamp = <3000>;
   401							};
   402						};
   403	
   404						i2c0_sda_z0_pins: i2c0-sda-z0 {
   405							mux {
   406								groups = "i2c0_sda_z0";
   407								function = "i2c0";
   408								bias-disable;
   409								drive-strength-microamp = <3000>;
   410							};
   411						};
   412	
   413						i2c0_sck_z1_pins: i2c0-sck-z1 {
   414							mux {
   415								groups = "i2c0_sck_z1";
   416								function = "i2c0";
   417								bias-disable;
   418								drive-strength-microamp = <3000>;
   419							};
   420						};
   421	
   422						i2c0_sda_z7_pins: i2c0-sda-z7 {
   423							mux {
   424								groups = "i2c0_sda_z7";
   425								function = "i2c0";
   426								bias-disable;
   427								drive-strength-microamp = <3000>;
   428							};
   429						};
   430	
   431						i2c0_sda_z8_pins: i2c0-sda-z8 {
   432							mux {
   433								groups = "i2c0_sda_z8";
   434								function = "i2c0";
   435								bias-disable;
   436								drive-strength-microamp = <3000>;
   437							};
   438						};
   439	
   440						i2c1_sda_x_pins: i2c1-sda-x {
   441							mux {
   442								groups = "i2c1_sda_x";
   443								function = "i2c1";
   444								bias-disable;
   445								drive-strength-microamp = <3000>;
   446							};
   447						};
   448	
   449						i2c1_sck_x_pins: i2c1-sck-x {
   450							mux {
   451								groups = "i2c1_sck_x";
   452								function = "i2c1";
   453								bias-disable;
   454								drive-strength-microamp = <3000>;
   455							};
   456						};
   457	
   458						i2c1_sda_h2_pins: i2c1-sda-h2 {
   459							mux {
   460								groups = "i2c1_sda_h2";
   461								function = "i2c1";
   462								bias-disable;
   463								drive-strength-microamp = <3000>;
   464							};
   465						};
   466	
   467						i2c1_sck_h3_pins: i2c1-sck-h3 {
   468							mux {
   469								groups = "i2c1_sck_h3";
   470								function = "i2c1";
   471								bias-disable;
   472								drive-strength-microamp = <3000>;
   473							};
   474						};
   475	
   476						i2c1_sda_h6_pins: i2c1-sda-h6 {
   477							mux {
   478								groups = "i2c1_sda_h6";
   479								function = "i2c1";
   480								bias-disable;
   481								drive-strength-microamp = <3000>;
   482							};
   483						};
   484	
   485						i2c1_sck_h7_pins: i2c1-sck-h7 {
   486							mux {
   487								groups = "i2c1_sck_h7";
   488								function = "i2c1";
   489								bias-disable;
   490								drive-strength-microamp = <3000>;
   491							};
   492						};
   493	
   494						i2c2_sda_x_pins: i2c2-sda-x {
   495							mux {
   496								groups = "i2c2_sda_x";
   497								function = "i2c2";
   498								bias-disable;
   499								drive-strength-microamp = <3000>;
   500							};
   501						};
   502	
   503						i2c2_sck_x_pins: i2c2-sck-x {
   504							mux {
   505								groups = "i2c2_sck_x";
   506								function = "i2c2";
   507								bias-disable;
   508								drive-strength-microamp = <3000>;
   509							};
   510						};
   511	
   512						i2c2_sda_z_pins: i2c2-sda-z {
   513							mux {
   514								groups = "i2c2_sda_z";
   515								function = "i2c2";
   516								bias-disable;
   517								drive-strength-microamp = <3000>;
   518							};
   519						};
   520	
   521						i2c2_sck_z_pins: i2c2-sck-z {
   522							mux {
   523								groups = "i2c2_sck_z";
   524								function = "i2c2";
   525								bias-disable;
   526								drive-strength-microamp = <3000>;
   527							};
   528						};
   529	
   530						i2c3_sda_h_pins: i2c3-sda-h {
   531							mux {
   532								groups = "i2c3_sda_h";
   533								function = "i2c3";
   534								bias-disable;
   535								drive-strength-microamp = <3000>;
   536							};
   537						};
   538	
   539						i2c3_sck_h_pins: i2c3-sck-h {
   540							mux {
   541								groups = "i2c3_sck_h";
   542								function = "i2c3";
   543								bias-disable;
   544								drive-strength-microamp = <3000>;
   545							};
   546						};
   547	
   548						i2c3_sda_a_pins: i2c3-sda-a {
   549							mux {
   550								groups = "i2c3_sda_a";
   551								function = "i2c3";
   552								bias-disable;
   553								drive-strength-microamp = <3000>;
   554							};
   555						};
   556	
   557						i2c3_sck_a_pins: i2c3-sck-a {
   558							mux {
   559								groups = "i2c3_sck_a";
   560								function = "i2c3";
   561								bias-disable;
   562								drive-strength-microamp = <3000>;
   563							};
   564						};
   565	
   566						mclk0_a_pins: mclk0-a {
   567							mux {
   568								groups = "mclk0_a";
   569								function = "mclk0";
   570								bias-disable;
   571								drive-strength-microamp = <3000>;
   572							};
   573						};
   574	
   575						mclk1_a_pins: mclk1-a {
   576							mux {
   577								groups = "mclk1_a";
   578								function = "mclk1";
   579								bias-disable;
   580								drive-strength-microamp = <3000>;
   581							};
   582						};
   583	
   584						mclk1_x_pins: mclk1-x {
   585							mux {
   586								groups = "mclk1_x";
   587								function = "mclk1";
   588								bias-disable;
   589								drive-strength-microamp = <3000>;
   590							};
   591						};
   592	
   593						mclk1_z_pins: mclk1-z {
   594							mux {
   595								groups = "mclk1_z";
   596								function = "mclk1";
   597								bias-disable;
   598								drive-strength-microamp = <3000>;
   599							};
   600						};
   601	
   602						nor_pins: nor {
   603							mux {
   604								groups = "nor_d",
   605								       "nor_q",
   606								       "nor_c",
   607								       "nor_cs";
   608								function = "nor";
   609								bias-disable;
   610							};
   611						};
   612	
   613						pdm_din0_a_pins: pdm-din0-a {
   614							mux {
   615								groups = "pdm_din0_a";
   616								function = "pdm";
   617								bias-disable;
   618							};
   619						};
   620	
   621						pdm_din0_c_pins: pdm-din0-c {
   622							mux {
   623								groups = "pdm_din0_c";
   624								function = "pdm";
   625								bias-disable;
   626							};
   627						};
   628	
   629						pdm_din0_x_pins: pdm-din0-x {
   630							mux {
   631								groups = "pdm_din0_x";
   632								function = "pdm";
   633								bias-disable;
   634							};
   635						};
   636	
   637						pdm_din0_z_pins: pdm-din0-z {
   638							mux {
   639								groups = "pdm_din0_z";
   640								function = "pdm";
   641								bias-disable;
   642							};
   643						};
   644	
   645						pdm_din1_a_pins: pdm-din1-a {
   646							mux {
   647								groups = "pdm_din1_a";
   648								function = "pdm";
   649								bias-disable;
   650							};
   651						};
   652	
   653						pdm_din1_c_pins: pdm-din1-c {
   654							mux {
   655								groups = "pdm_din1_c";
   656								function = "pdm";
   657								bias-disable;
   658							};
   659						};
   660	
   661						pdm_din1_x_pins: pdm-din1-x {
   662							mux {
   663								groups = "pdm_din1_x";
   664								function = "pdm";
   665								bias-disable;
   666							};
   667						};
   668	
   669						pdm_din1_z_pins: pdm-din1-z {
   670							mux {
   671								groups = "pdm_din1_z";
   672								function = "pdm";
   673								bias-disable;
   674							};
   675						};
   676	
   677						pdm_din2_a_pins: pdm-din2-a {
   678							mux {
   679								groups = "pdm_din2_a";
   680								function = "pdm";
   681								bias-disable;
   682							};
   683						};
   684	
   685						pdm_din2_c_pins: pdm-din2-c {
   686							mux {
   687								groups = "pdm_din2_c";
   688								function = "pdm";
   689								bias-disable;
   690							};
   691						};
   692	
   693						pdm_din2_x_pins: pdm-din2-x {
   694							mux {
   695								groups = "pdm_din2_x";
   696								function = "pdm";
   697								bias-disable;
   698							};
   699						};
   700	
   701						pdm_din2_z_pins: pdm-din2-z {
   702							mux {
   703								groups = "pdm_din2_z";
   704								function = "pdm";
   705								bias-disable;
   706							};
   707						};
   708	
   709						pdm_din3_a_pins: pdm-din3-a {
   710							mux {
   711								groups = "pdm_din3_a";
   712								function = "pdm";
   713								bias-disable;
   714							};
   715						};
   716	
   717						pdm_din3_c_pins: pdm-din3-c {
   718							mux {
   719								groups = "pdm_din3_c";
   720								function = "pdm";
   721								bias-disable;
   722							};
   723						};
   724	
   725						pdm_din3_x_pins: pdm-din3-x {
   726							mux {
   727								groups = "pdm_din3_x";
   728								function = "pdm";
   729								bias-disable;
   730							};
   731						};
   732	
   733						pdm_din3_z_pins: pdm-din3-z {
   734							mux {
   735								groups = "pdm_din3_z";
   736								function = "pdm";
   737								bias-disable;
   738							};
   739						};
   740	
   741						pdm_dclk_a_pins: pdm-dclk-a {
   742							mux {
   743								groups = "pdm_dclk_a";
   744								function = "pdm";
   745								bias-disable;
   746								drive-strength-microamp = <500>;
   747							};
   748						};
   749	
   750						pdm_dclk_c_pins: pdm-dclk-c {
   751							mux {
   752								groups = "pdm_dclk_c";
   753								function = "pdm";
   754								bias-disable;
   755								drive-strength-microamp = <500>;
   756							};
   757						};
   758	
   759						pdm_dclk_x_pins: pdm-dclk-x {
   760							mux {
   761								groups = "pdm_dclk_x";
   762								function = "pdm";
   763								bias-disable;
   764								drive-strength-microamp = <500>;
   765							};
   766						};
   767	
   768						pdm_dclk_z_pins: pdm-dclk-z {
   769							mux {
   770								groups = "pdm_dclk_z";
   771								function = "pdm";
   772								bias-disable;
   773								drive-strength-microamp = <500>;
   774							};
   775						};
   776	
   777						pwm_a_pins: pwm-a {
   778							mux {
   779								groups = "pwm_a";
   780								function = "pwm_a";
   781								bias-disable;
   782							};
   783						};
   784	
   785						pwm_b_x7_pins: pwm-b-x7 {
   786							mux {
   787								groups = "pwm_b_x7";
   788								function = "pwm_b";
   789								bias-disable;
   790							};
   791						};
   792	
   793						pwm_b_x19_pins: pwm-b-x19 {
   794							mux {
   795								groups = "pwm_b_x19";
   796								function = "pwm_b";
   797								bias-disable;
   798							};
   799						};
   800	
   801						pwm_c_c_pins: pwm-c-c {
   802							mux {
   803								groups = "pwm_c_c";
   804								function = "pwm_c";
   805								bias-disable;
   806							};
   807						};
   808	
   809						pwm_c_x5_pins: pwm-c-x5 {
   810							mux {
   811								groups = "pwm_c_x5";
   812								function = "pwm_c";
   813								bias-disable;
   814							};
   815						};
   816	
   817						pwm_c_x8_pins: pwm-c-x8 {
   818							mux {
   819								groups = "pwm_c_x8";
   820								function = "pwm_c";
   821								bias-disable;
   822							};
   823						};
   824	
   825						pwm_d_x3_pins: pwm-d-x3 {
   826							mux {
   827								groups = "pwm_d_x3";
   828								function = "pwm_d";
   829								bias-disable;
   830							};
   831						};
   832	
   833						pwm_d_x6_pins: pwm-d-x6 {
   834							mux {
   835								groups = "pwm_d_x6";
   836								function = "pwm_d";
   837								bias-disable;
   838							};
   839						};
   840	
   841						pwm_e_pins: pwm-e {
   842							mux {
   843								groups = "pwm_e";
   844								function = "pwm_e";
   845								bias-disable;
   846							};
   847						};
   848	
   849						pwm_f_z_pins: pwm-f-z {
   850							mux {
   851								groups = "pwm_f_z";
   852								function = "pwm_f";
   853								bias-disable;
   854							};
   855						};
   856	
   857						pwm_f_a_pins: pwm-f-a {
   858							mux {
   859								groups = "pwm_f_a";
   860								function = "pwm_f";
   861								bias-disable;
   862							};
   863						};
   864	
   865						pwm_f_x_pins: pwm-f-x {
   866							mux {
   867								groups = "pwm_f_x";
   868								function = "pwm_f";
   869								bias-disable;
   870							};
   871						};
   872	
   873						pwm_f_h_pins: pwm-f-h {
   874							mux {
   875								groups = "pwm_f_h";
   876								function = "pwm_f";
   877								bias-disable;
   878							};
   879						};
   880	
   881						sdcard_c_pins: sdcard_c {
   882							mux-0 {
   883								groups = "sdcard_d0_c",
   884									 "sdcard_d1_c",
   885									 "sdcard_d2_c",
   886									 "sdcard_d3_c",
   887									 "sdcard_cmd_c";
   888								function = "sdcard";
   889								bias-pull-up;
   890								drive-strength-microamp = <4000>;
   891							};
   892	
   893							mux-1 {
   894								groups = "sdcard_clk_c";
   895								function = "sdcard";
   896								bias-disable;
   897								drive-strength-microamp = <4000>;
   898							};
   899						};
   900	
   901						sdcard_clk_gate_c_pins: sdcard_clk_gate_c {
   902							mux {
   903								groups = "GPIOC_4";
   904								function = "gpio_periphs";
   905								bias-pull-down;
   906								drive-strength-microamp = <4000>;
   907							};
   908						};
   909	
   910						sdcard_z_pins: sdcard_z {
   911							mux-0 {
   912								groups = "sdcard_d0_z",
   913									 "sdcard_d1_z",
   914									 "sdcard_d2_z",
   915									 "sdcard_d3_z",
   916									 "sdcard_cmd_z";
   917								function = "sdcard";
   918								bias-pull-up;
   919								drive-strength-microamp = <4000>;
   920							};
   921	
   922							mux-1 {
   923								groups = "sdcard_clk_z";
   924								function = "sdcard";
   925								bias-disable;
   926								drive-strength-microamp = <4000>;
   927							};
   928						};
   929	
   930						sdcard_clk_gate_z_pins: sdcard_clk_gate_z {
   931							mux {
   932								groups = "GPIOZ_6";
   933								function = "gpio_periphs";
   934								bias-pull-down;
   935								drive-strength-microamp = <4000>;
   936							};
   937						};
   938	
   939						sdio_pins: sdio {
   940							mux {
   941								groups = "sdio_d0",
   942									 "sdio_d1",
   943									 "sdio_d2",
   944									 "sdio_d3",
   945									 "sdio_clk",
   946									 "sdio_cmd";
   947								function = "sdio";
   948								bias-disable;
   949								drive-strength-microamp = <4000>;
   950							};
   951						};
   952	
   953						sdio_clk_gate_pins: sdio_clk_gate {
   954							mux {
   955								groups = "GPIOX_4";
   956								function = "gpio_periphs";
   957								bias-pull-down;
   958								drive-strength-microamp = <4000>;
   959							};
   960						};
   961	
   962						spdif_in_a10_pins: spdif-in-a10 {
   963							mux {
   964								groups = "spdif_in_a10";
   965								function = "spdif_in";
   966								bias-disable;
   967							};
   968						};
   969	
   970						spdif_in_a12_pins: spdif-in-a12 {
   971							mux {
   972								groups = "spdif_in_a12";
   973								function = "spdif_in";
   974								bias-disable;
   975							};
   976						};
   977	
   978						spdif_in_h_pins: spdif-in-h {
   979							mux {
   980								groups = "spdif_in_h";
   981								function = "spdif_in";
   982								bias-disable;
   983							};
   984						};
   985	
   986						spdif_out_h_pins: spdif-out-h {
   987							mux {
   988								groups = "spdif_out_h";
   989								function = "spdif_out";
   990								drive-strength-microamp = <500>;
   991								bias-disable;
   992							};
   993						};
   994	
   995						spdif_out_a11_pins: spdif-out-a11 {
   996							mux {
   997								groups = "spdif_out_a11";
   998								function = "spdif_out";
   999								drive-strength-microamp = <500>;
  1000								bias-disable;
  1001							};
  1002						};
  1003	
  1004						spdif_out_a13_pins: spdif-out-a13 {
  1005							mux {
  1006								groups = "spdif_out_a13";
  1007								function = "spdif_out";
  1008								drive-strength-microamp = <500>;
  1009								bias-disable;
  1010							};
  1011						};
  1012	
  1013						spicc0_x_pins: spicc0-x {
  1014							mux {
  1015								groups = "spi0_mosi_x",
  1016								       "spi0_miso_x",
  1017								       "spi0_clk_x";
  1018								function = "spi0";
  1019								drive-strength-microamp = <4000>;
  1020								bias-disable;
  1021							};
  1022						};
  1023	
  1024						spicc0_ss0_x_pins: spicc0-ss0-x {
  1025							mux {
  1026								groups = "spi0_ss0_x";
  1027								function = "spi0";
  1028								drive-strength-microamp = <4000>;
  1029								bias-disable;
  1030							};
  1031						};
  1032	
  1033						spicc0_c_pins: spicc0-c {
  1034							mux {
  1035								groups = "spi0_mosi_c",
  1036								       "spi0_miso_c",
  1037								       "spi0_ss0_c",
  1038								       "spi0_clk_c";
  1039								function = "spi0";
  1040								drive-strength-microamp = <4000>;
  1041								bias-disable;
  1042							};
  1043						};
  1044	
  1045						spicc1_pins: spicc1 {
  1046							mux {
  1047								groups = "spi1_mosi",
  1048								       "spi1_miso",
  1049								       "spi1_clk";
  1050								function = "spi1";
  1051								drive-strength-microamp = <4000>;
  1052							};
  1053						};
  1054	
  1055						spicc1_ss0_pins: spicc1-ss0 {
  1056							mux {
  1057								groups = "spi1_ss0";
  1058								function = "spi1";
  1059								drive-strength-microamp = <4000>;
  1060								bias-disable;
  1061							};
  1062						};
  1063	
  1064						tdm_a_din0_pins: tdm-a-din0 {
  1065							mux {
  1066								groups = "tdm_a_din0";
  1067								function = "tdm_a";
  1068								bias-disable;
  1069							};
  1070						};
  1071	
  1072	
  1073						tdm_a_din1_pins: tdm-a-din1 {
  1074							mux {
  1075								groups = "tdm_a_din1";
  1076								function = "tdm_a";
  1077								bias-disable;
  1078							};
  1079						};
  1080	
  1081						tdm_a_dout0_pins: tdm-a-dout0 {
  1082							mux {
  1083								groups = "tdm_a_dout0";
  1084								function = "tdm_a";
  1085								bias-disable;
  1086								drive-strength-microamp = <3000>;
  1087							};
  1088						};
  1089	
  1090						tdm_a_dout1_pins: tdm-a-dout1 {
  1091							mux {
  1092								groups = "tdm_a_dout1";
  1093								function = "tdm_a";
  1094								bias-disable;
  1095								drive-strength-microamp = <3000>;
  1096							};
  1097						};
  1098	
  1099						tdm_a_fs_pins: tdm-a-fs {
  1100							mux {
  1101								groups = "tdm_a_fs";
  1102								function = "tdm_a";
  1103								bias-disable;
  1104								drive-strength-microamp = <3000>;
  1105							};
  1106						};
  1107	
  1108						tdm_a_sclk_pins: tdm-a-sclk {
  1109							mux {
  1110								groups = "tdm_a_sclk";
  1111								function = "tdm_a";
  1112								bias-disable;
  1113								drive-strength-microamp = <3000>;
  1114							};
  1115						};
  1116	
  1117						tdm_a_slv_fs_pins: tdm-a-slv-fs {
  1118							mux {
  1119								groups = "tdm_a_slv_fs";
  1120								function = "tdm_a";
  1121								bias-disable;
  1122							};
  1123						};
  1124	
  1125	
  1126						tdm_a_slv_sclk_pins: tdm-a-slv-sclk {
  1127							mux {
  1128								groups = "tdm_a_slv_sclk";
  1129								function = "tdm_a";
  1130								bias-disable;
  1131							};
  1132						};
  1133	
  1134						tdm_b_din0_pins: tdm-b-din0 {
  1135							mux {
  1136								groups = "tdm_b_din0";
  1137								function = "tdm_b";
  1138								bias-disable;
  1139							};
  1140						};
  1141	
  1142						tdm_b_din1_pins: tdm-b-din1 {
  1143							mux {
  1144								groups = "tdm_b_din1";
  1145								function = "tdm_b";
  1146								bias-disable;
  1147							};
  1148						};
  1149	
  1150						tdm_b_din2_pins: tdm-b-din2 {
  1151							mux {
  1152								groups = "tdm_b_din2";
  1153								function = "tdm_b";
  1154								bias-disable;
  1155							};
  1156						};
  1157	
  1158						tdm_b_din3_a_pins: tdm-b-din3-a {
  1159							mux {
  1160								groups = "tdm_b_din3_a";
  1161								function = "tdm_b";
  1162								bias-disable;
  1163							};
  1164						};
  1165	
  1166						tdm_b_din3_h_pins: tdm-b-din3-h {
  1167							mux {
  1168								groups = "tdm_b_din3_h";
  1169								function = "tdm_b";
  1170								bias-disable;
  1171							};
  1172						};
  1173	
  1174						tdm_b_dout0_pins: tdm-b-dout0 {
  1175							mux {
  1176								groups = "tdm_b_dout0";
  1177								function = "tdm_b";
  1178								bias-disable;
  1179								drive-strength-microamp = <3000>;
  1180							};
  1181						};
  1182	
  1183						tdm_b_dout1_pins: tdm-b-dout1 {
  1184							mux {
  1185								groups = "tdm_b_dout1";
  1186								function = "tdm_b";
  1187								bias-disable;
  1188								drive-strength-microamp = <3000>;
  1189							};
  1190						};
  1191	
  1192						tdm_b_dout2_pins: tdm-b-dout2 {
  1193							mux {
  1194								groups = "tdm_b_dout2";
  1195								function = "tdm_b";
  1196								bias-disable;
  1197								drive-strength-microamp = <3000>;
  1198							};
  1199						};
  1200	
  1201						tdm_b_dout3_a_pins: tdm-b-dout3-a {
  1202							mux {
  1203								groups = "tdm_b_dout3_a";
  1204								function = "tdm_b";
  1205								bias-disable;
  1206								drive-strength-microamp = <3000>;
  1207							};
  1208						};
  1209	
  1210						tdm_b_dout3_h_pins: tdm-b-dout3-h {
  1211							mux {
  1212								groups = "tdm_b_dout3_h";
  1213								function = "tdm_b";
  1214								bias-disable;
  1215								drive-strength-microamp = <3000>;
  1216							};
  1217						};
  1218	
  1219						tdm_b_fs_pins: tdm-b-fs {
  1220							mux {
  1221								groups = "tdm_b_fs";
  1222								function = "tdm_b";
  1223								bias-disable;
  1224								drive-strength-microamp = <3000>;
  1225							};
  1226						};
  1227	
  1228						tdm_b_sclk_pins: tdm-b-sclk {
  1229							mux {
  1230								groups = "tdm_b_sclk";
  1231								function = "tdm_b";
  1232								bias-disable;
  1233								drive-strength-microamp = <3000>;
  1234							};
  1235						};
  1236	
  1237						tdm_b_slv_fs_pins: tdm-b-slv-fs {
  1238							mux {
  1239								groups = "tdm_b_slv_fs";
  1240								function = "tdm_b";
  1241								bias-disable;
  1242							};
  1243						};
  1244	
  1245						tdm_b_slv_sclk_pins: tdm-b-slv-sclk {
  1246							mux {
  1247								groups = "tdm_b_slv_sclk";
  1248								function = "tdm_b";
  1249								bias-disable;
  1250							};
  1251						};
  1252	
  1253						tdm_c_din0_a_pins: tdm-c-din0-a {
  1254							mux {
  1255								groups = "tdm_c_din0_a";
  1256								function = "tdm_c";
  1257								bias-disable;
  1258							};
  1259						};
  1260	
  1261						tdm_c_din0_z_pins: tdm-c-din0-z {
  1262							mux {
  1263								groups = "tdm_c_din0_z";
  1264								function = "tdm_c";
  1265								bias-disable;
  1266							};
  1267						};
  1268	
  1269						tdm_c_din1_a_pins: tdm-c-din1-a {
  1270							mux {
  1271								groups = "tdm_c_din1_a";
  1272								function = "tdm_c";
  1273								bias-disable;
  1274							};
  1275						};
  1276	
  1277						tdm_c_din1_z_pins: tdm-c-din1-z {
  1278							mux {
  1279								groups = "tdm_c_din1_z";
  1280								function = "tdm_c";
  1281								bias-disable;
  1282							};
  1283						};
  1284	
  1285						tdm_c_din2_a_pins: tdm-c-din2-a {
  1286							mux {
  1287								groups = "tdm_c_din2_a";
  1288								function = "tdm_c";
  1289								bias-disable;
  1290							};
  1291						};
  1292	
  1293						eth_leds_pins: eth-leds {
  1294							mux {
  1295								groups = "eth_link_led",
  1296									 "eth_act_led";
  1297								function = "eth";
  1298								bias-disable;
  1299							};
  1300						};
  1301	
  1302						eth_pins: eth {
  1303							mux {
  1304								groups = "eth_mdio",
  1305									 "eth_mdc",
  1306									 "eth_rgmii_rx_clk",
  1307									 "eth_rx_dv",
  1308									 "eth_rxd0",
  1309									 "eth_rxd1",
  1310									 "eth_txen",
  1311									 "eth_txd0",
  1312									 "eth_txd1";
  1313								function = "eth";
  1314								drive-strength-microamp = <4000>;
  1315								bias-disable;
  1316							};
  1317						};
  1318	
  1319						eth_rgmii_pins: eth-rgmii {
  1320							mux {
  1321								groups = "eth_rxd2_rgmii",
  1322									 "eth_rxd3_rgmii",
  1323									 "eth_rgmii_tx_clk",
  1324									 "eth_txd2_rgmii",
  1325									 "eth_txd3_rgmii";
  1326								function = "eth";
  1327								drive-strength-microamp = <4000>;
  1328								bias-disable;
  1329							};
  1330						};
  1331	
  1332						tdm_c_din2_z_pins: tdm-c-din2-z {
  1333							mux {
  1334								groups = "tdm_c_din2_z";
  1335								function = "tdm_c";
  1336								bias-disable;
  1337							};
  1338						};
  1339	
  1340						tdm_c_din3_a_pins: tdm-c-din3-a {
  1341							mux {
  1342								groups = "tdm_c_din3_a";
  1343								function = "tdm_c";
  1344								bias-disable;
  1345							};
  1346						};
  1347	
  1348						tdm_c_din3_z_pins: tdm-c-din3-z {
  1349							mux {
  1350								groups = "tdm_c_din3_z";
  1351								function = "tdm_c";
  1352								bias-disable;
  1353							};
  1354						};
  1355	
  1356						tdm_c_dout0_a_pins: tdm-c-dout0-a {
  1357							mux {
  1358								groups = "tdm_c_dout0_a";
  1359								function = "tdm_c";
  1360								bias-disable;
  1361								drive-strength-microamp = <3000>;
  1362							};
  1363						};
  1364	
  1365						tdm_c_dout0_z_pins: tdm-c-dout0-z {
  1366							mux {
  1367								groups = "tdm_c_dout0_z";
  1368								function = "tdm_c";
  1369								bias-disable;
  1370								drive-strength-microamp = <3000>;
  1371							};
  1372						};
  1373	
  1374						tdm_c_dout1_a_pins: tdm-c-dout1-a {
  1375							mux {
  1376								groups = "tdm_c_dout1_a";
  1377								function = "tdm_c";
  1378								bias-disable;
  1379								drive-strength-microamp = <3000>;
  1380							};
  1381						};
  1382	
  1383						tdm_c_dout1_z_pins: tdm-c-dout1-z {
  1384							mux {
  1385								groups = "tdm_c_dout1_z";
  1386								function = "tdm_c";
  1387								bias-disable;
  1388								drive-strength-microamp = <3000>;
  1389							};
  1390						};
  1391	
  1392						tdm_c_dout2_a_pins: tdm-c-dout2-a {
  1393							mux {
  1394								groups = "tdm_c_dout2_a";
  1395								function = "tdm_c";
  1396								bias-disable;
  1397								drive-strength-microamp = <3000>;
  1398							};
  1399						};
  1400	
  1401						tdm_c_dout2_z_pins: tdm-c-dout2-z {
  1402							mux {
  1403								groups = "tdm_c_dout2_z";
  1404								function = "tdm_c";
  1405								bias-disable;
  1406								drive-strength-microamp = <3000>;
  1407							};
  1408						};
  1409	
  1410						tdm_c_dout3_a_pins: tdm-c-dout3-a {
  1411							mux {
  1412								groups = "tdm_c_dout3_a";
  1413								function = "tdm_c";
  1414								bias-disable;
  1415								drive-strength-microamp = <3000>;
  1416							};
  1417						};
  1418	
  1419						tdm_c_dout3_z_pins: tdm-c-dout3-z {
  1420							mux {
  1421								groups = "tdm_c_dout3_z";
  1422								function = "tdm_c";
  1423								bias-disable;
  1424								drive-strength-microamp = <3000>;
  1425							};
  1426						};
  1427	
  1428						tdm_c_fs_a_pins: tdm-c-fs-a {
  1429							mux {
  1430								groups = "tdm_c_fs_a";
  1431								function = "tdm_c";
  1432								bias-disable;
  1433								drive-strength-microamp = <3000>;
  1434							};
  1435						};
  1436	
  1437						tdm_c_fs_z_pins: tdm-c-fs-z {
  1438							mux {
  1439								groups = "tdm_c_fs_z";
  1440								function = "tdm_c";
  1441								bias-disable;
  1442								drive-strength-microamp = <3000>;
  1443							};
  1444						};
  1445	
  1446						tdm_c_sclk_a_pins: tdm-c-sclk-a {
  1447							mux {
  1448								groups = "tdm_c_sclk_a";
  1449								function = "tdm_c";
  1450								bias-disable;
  1451								drive-strength-microamp = <3000>;
  1452							};
  1453						};
  1454	
  1455						tdm_c_sclk_z_pins: tdm-c-sclk-z {
  1456							mux {
  1457								groups = "tdm_c_sclk_z";
  1458								function = "tdm_c";
  1459								bias-disable;
  1460								drive-strength-microamp = <3000>;
  1461							};
  1462						};
  1463	
  1464						tdm_c_slv_fs_a_pins: tdm-c-slv-fs-a {
  1465							mux {
  1466								groups = "tdm_c_slv_fs_a";
  1467								function = "tdm_c";
  1468								bias-disable;
  1469							};
  1470						};
  1471	
  1472						tdm_c_slv_fs_z_pins: tdm-c-slv-fs-z {
  1473							mux {
  1474								groups = "tdm_c_slv_fs_z";
  1475								function = "tdm_c";
  1476								bias-disable;
  1477							};
  1478						};
  1479	
  1480						tdm_c_slv_sclk_a_pins: tdm-c-slv-sclk-a {
  1481							mux {
  1482								groups = "tdm_c_slv_sclk_a";
  1483								function = "tdm_c";
  1484								bias-disable;
  1485							};
  1486						};
  1487	
  1488						tdm_c_slv_sclk_z_pins: tdm-c-slv-sclk-z {
  1489							mux {
  1490								groups = "tdm_c_slv_sclk_z";
  1491								function = "tdm_c";
  1492								bias-disable;
  1493							};
  1494						};
  1495	
  1496						uart_a_pins: uart-a {
  1497							mux {
  1498								groups = "uart_a_tx",
  1499									 "uart_a_rx";
  1500								function = "uart_a";
  1501								bias-disable;
  1502							};
  1503						};
  1504	
  1505						uart_a_cts_rts_pins: uart-a-cts-rts {
  1506							mux {
  1507								groups = "uart_a_cts",
  1508									 "uart_a_rts";
  1509								function = "uart_a";
  1510								bias-disable;
  1511							};
  1512						};
  1513	
  1514						uart_b_pins: uart-b {
  1515							mux {
  1516								groups = "uart_b_tx",
  1517									 "uart_b_rx";
  1518								function = "uart_b";
  1519								bias-disable;
  1520							};
  1521						};
  1522	
  1523						uart_c_pins: uart-c {
  1524							mux {
  1525								groups = "uart_c_tx",
  1526									 "uart_c_rx";
  1527								function = "uart_c";
  1528								bias-disable;
  1529							};
  1530						};
  1531	
  1532						uart_c_cts_rts_pins: uart-c-cts-rts {
  1533							mux {
  1534								groups = "uart_c_cts",
  1535									 "uart_c_rts";
  1536								function = "uart_c";
  1537								bias-disable;
  1538							};
  1539						};
  1540					};
  1541				};
  1542	
  1543				cpu_temp: temperature-sensor@34800 {
  1544					compatible = "amlogic,g12a-cpu-thermal",
  1545						     "amlogic,g12a-thermal";
  1546					reg = <0x0 0x34800 0x0 0x50>;
  1547					interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
  1548					clocks = <&clkc CLKID_TS>;
  1549					#thermal-sensor-cells = <0>;
  1550					amlogic,ao-secure = <&sec_AO>;
  1551				};
  1552	
  1553				ddr_temp: temperature-sensor@34c00 {
  1554					compatible = "amlogic,g12a-ddr-thermal",
  1555						     "amlogic,g12a-thermal";
  1556					reg = <0x0 0x34c00 0x0 0x50>;
  1557					interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
  1558					clocks = <&clkc CLKID_TS>;
  1559					#thermal-sensor-cells = <0>;
  1560					amlogic,ao-secure = <&sec_AO>;
  1561				};
  1562	
  1563				usb2_phy0: phy@36000 {
  1564					compatible = "amlogic,g12a-usb2-phy";
  1565					reg = <0x0 0x36000 0x0 0x2000>;
  1566					clocks = <&xtal>;
  1567					clock-names = "xtal";
  1568					resets = <&reset RESET_USB_PHY20>;
  1569					reset-names = "phy";
  1570					#phy-cells = <0>;
  1571				};
  1572	
  1573				dmc: bus@38000 {
  1574					compatible = "simple-bus";
  1575					#address-cells = <2>;
  1576					#size-cells = <2>;
  1577					ranges = <0x0 0x0 0x0 0x38000 0x0 0x2000>;
  1578	
  1579					canvas: video-lut@48 {
  1580						compatible = "amlogic,canvas";
  1581						reg = <0x0 0x48 0x0 0x14>;
  1582					};
  1583	
  1584					pmu: pmu@80 {
  1585						reg = <0x0 0x80 0x0 0x40>,
  1586						      <0x0 0xc00 0x0 0x40>;
  1587						interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
  1588					};
  1589				};
  1590	
  1591				usb2_phy1: phy@3a000 {
  1592					compatible = "amlogic,g12a-usb2-phy";
  1593					reg = <0x0 0x3a000 0x0 0x2000>;
  1594					clocks = <&xtal>;
  1595					clock-names = "xtal";
  1596					resets = <&reset RESET_USB_PHY21>;
  1597					reset-names = "phy";
  1598					#phy-cells = <0>;
  1599				};
  1600	
  1601				hiu: bus@3c000 {
  1602					compatible = "simple-bus";
  1603					reg = <0x0 0x3c000 0x0 0x1400>;
  1604					#address-cells = <2>;
  1605					#size-cells = <2>;
  1606					ranges = <0x0 0x0 0x0 0x3c000 0x0 0x1400>;
  1607	
  1608					hhi: system-controller@0 {
  1609						compatible = "amlogic,meson-gx-hhi-sysctrl",
  1610							     "simple-mfd", "syscon";
  1611						reg = <0 0 0 0x400>;
  1612	
  1613						clkc: clock-controller {
  1614							compatible = "amlogic,g12a-clkc";
  1615							#clock-cells = <1>;
  1616							clocks = <&xtal>;
  1617							clock-names = "xtal";
  1618						};
  1619	
  1620						pwrc: power-controller {
  1621							compatible = "amlogic,meson-g12a-pwrc";
  1622							#power-domain-cells = <1>;
  1623							amlogic,ao-sysctrl = <&rti>;
  1624							resets = <&reset RESET_VIU>,
  1625								 <&reset RESET_VENC>,
  1626								 <&reset RESET_VCBUS>,
  1627								 <&reset RESET_BT656>,
  1628								 <&reset RESET_RDMA>,
  1629								 <&reset RESET_VENCI>,
  1630								 <&reset RESET_VENCP>,
  1631								 <&reset RESET_VDAC>,
  1632								 <&reset RESET_VDI6>,
  1633								 <&reset RESET_VENCL>,
  1634								 <&reset RESET_VID_LOCK>;
  1635							reset-names = "viu", "venc", "vcbus", "bt656",
  1636								      "rdma", "venci", "vencp", "vdac",
  1637								      "vdi6", "vencl", "vid_lock";
  1638							clocks = <&clkc CLKID_VPU>,
  1639								 <&clkc CLKID_VAPB>;
  1640							clock-names = "vpu", "vapb";
  1641							/*
  1642							 * VPU clocking is provided by two identical clock paths
  1643							 * VPU_0 and VPU_1 muxed to a single clock by a glitch
  1644							 * free mux to safely change frequency while running.
  1645							 * Same for VAPB but with a final gate after the glitch free mux.
  1646							 */
  1647							assigned-clocks = <&clkc CLKID_VPU_0_SEL>,
  1648									  <&clkc CLKID_VPU_0>,
  1649									  <&clkc CLKID_VPU>, /* Glitch free mux */
  1650									  <&clkc CLKID_VAPB_0_SEL>,
  1651									  <&clkc CLKID_VAPB_0>,
  1652									  <&clkc CLKID_VAPB_SEL>; /* Glitch free mux */
  1653							assigned-clock-parents = <&clkc CLKID_FCLK_DIV3>,
  1654										 <0>, /* Do Nothing */
  1655										 <&clkc CLKID_VPU_0>,
  1656										 <&clkc CLKID_FCLK_DIV4>,
  1657										 <0>, /* Do Nothing */
  1658										 <&clkc CLKID_VAPB_0>;
  1659							assigned-clock-rates = <0>, /* Do Nothing */
  1660									       <666666666>,
  1661									       <0>, /* Do Nothing */
  1662									       <0>, /* Do Nothing */
  1663									       <250000000>,
  1664									       <0>; /* Do Nothing */
  1665						};
  1666	
  1667						mipi_analog_dphy: phy {
  1668							compatible = "amlogic,g12a-mipi-dphy-analog";
  1669							#phy-cells = <0>;
  1670							status = "disabled";
  1671						};
  1672					};
  1673				};
  1674	
  1675				mipi_dphy: phy@44000 {
  1676					compatible = "amlogic,axg-mipi-dphy";
  1677					reg = <0x0 0x44000 0x0 0x2000>;
  1678					clocks = <&clkc CLKID_MIPI_DSI_PHY>;
  1679					clock-names = "pclk";
  1680					resets = <&reset RESET_MIPI_DSI_PHY>;
  1681					reset-names = "phy";
  1682					phys = <&mipi_analog_dphy>;
  1683					phy-names = "analog";
  1684					#phy-cells = <0>;
  1685					status = "disabled";
  1686				};
  1687	
  1688				usb3_pcie_phy: phy@46000 {
  1689					compatible = "amlogic,g12a-usb3-pcie-phy";
  1690					reg = <0x0 0x46000 0x0 0x2000>;
  1691					clocks = <&clkc CLKID_PCIE_PLL>;
  1692					clock-names = "ref_clk";
  1693					resets = <&reset RESET_PCIE_PHY>;
  1694					reset-names = "phy";
  1695					assigned-clocks = <&clkc CLKID_PCIE_PLL>;
  1696					assigned-clock-rates = <100000000>;
  1697					#phy-cells = <1>;
  1698				};
  1699	
  1700				eth_phy: mdio-multiplexer@4c000 {
  1701					compatible = "amlogic,g12a-mdio-mux";
  1702					reg = <0x0 0x4c000 0x0 0xa4>;
  1703					clocks = <&clkc CLKID_ETH_PHY>,
  1704						 <&xtal>,
  1705						 <&clkc CLKID_MPLL_50M>;
  1706					clock-names = "pclk", "clkin0", "clkin1";
  1707					mdio-parent-bus = <&mdio0>;
  1708					#address-cells = <1>;
  1709					#size-cells = <0>;
  1710	
  1711					ext_mdio: mdio@0 {
  1712						reg = <0>;
  1713						#address-cells = <1>;
  1714						#size-cells = <0>;
  1715					};
  1716	
  1717					int_mdio: mdio@1 {
  1718						reg = <1>;
  1719						#address-cells = <1>;
  1720						#size-cells = <0>;
  1721	
  1722						internal_ephy: ethernet-phy@8 {
  1723							compatible = "ethernet-phy-id0180.3301",
  1724								     "ethernet-phy-ieee802.3-c22";
  1725							interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
  1726							reg = <8>;
  1727							max-speed = <100>;
  1728						};
  1729					};
  1730				};
  1731			};
  1732	
  1733			aobus: bus@ff800000 {
  1734				compatible = "simple-bus";
  1735				reg = <0x0 0xff800000 0x0 0x100000>;
  1736				#address-cells = <2>;
  1737				#size-cells = <2>;
  1738				ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
  1739	
  1740				rti: sys-ctrl@0 {
  1741					compatible = "amlogic,meson-gx-ao-sysctrl",
  1742						     "simple-mfd", "syscon";
  1743					reg = <0x0 0x0 0x0 0x100>;
  1744	
  1745					clkc_AO: clock-controller {
  1746						compatible = "amlogic,meson-g12a-aoclkc";
  1747						#clock-cells = <1>;
  1748						#reset-cells = <1>;
  1749						clocks = <&xtal>, <&clkc CLKID_CLK81>;
  1750						clock-names = "xtal", "mpeg-clk";
  1751					};
  1752				};
  1753	
> 1754				ao_pinctrl: pinctrl@14 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
