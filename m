Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000B83FC7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 07:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756451854; cv=none; b=ezPXYwQ+oIlosGANtnPLKdiNEhmlx9WaWbQXs8CMY7dT4t8qK9kKM0R9mEYFFbaArylUYQN6OlEV72LtD+clXvjboD6pf/jtfPTZhi2aoJF/nX1M9PR/kZAVyEzTLMh1TjbNp1eZyyxg8be8J5OOvkTnYX0UeYANqJFIPKEykmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756451854; c=relaxed/simple;
	bh=fdYcLd+vJw6A5Z7c5mMxck0B/8IbbdFZ/zGwkHHxH3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b/CRGi9/lpufAPtApluXf0cWToD5CWKqQ1Z0fgmQvTLYtefFklTNjBEpKIars+gUfdeMrMQDyulps1lLp/yp5yXFQIwujweYTXHRx3D4tajhmfxKwh8Qhlk/IwLSEOKf4SGdfaKWbth7LqlGsuU5W4xoriVfFcJvQ2Qr/TqBHFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEtDD+iA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEtDD+iA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756451853; x=1787987853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fdYcLd+vJw6A5Z7c5mMxck0B/8IbbdFZ/zGwkHHxH3U=;
  b=YEtDD+iArTMgWRRonxFuLdpm0KoanNInALn6bK951n+3X8aptqHwsIqH
   OeVPfmFxVHo7leDCHCO7YJr7d+DUU1T5SB4xAlP5T3H79H2JbOG07Vwha
   z3fqe9HvTxjkUQd+naUcwVFaWS0nUxqix4B8euw3SVeCQeJF+al8gDdiV
   6Zg0NYIrfm4oZFgK/+eEu37cOZoXLQXohJy3OR6YVc1twnFJm1P/qzR0v
   wUQw62lhavfRd8MxwpvTC4YFJGQOKJDJQGLrIW912odJ4AO2Sp1BsreV9
   FhBDRsckwGxndZ6U0lzTewcVG5sppC1nlyQGm2ApJ5Bux5cW0zaiYZeO2
   g==;
X-CSE-ConnectionGUID: 01kZcIkpSRmpKz4KFWnqVQ==
X-CSE-MsgGUID: pLvf3VaMRR+vJnv1cWa7Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81326134"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81326134"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 00:17:32 -0700
X-CSE-ConnectionGUID: dfpmYu5qQ6SnxOLzbOHALA==
X-CSE-MsgGUID: dBidPlTfTuyNwpitt/Ol+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="169572018"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Aug 2025 00:17:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urtMW-000UU9-2E;
	Fri, 29 Aug 2025 07:17:28 +0000
Date: Fri, 29 Aug 2025 15:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 458/458]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin.dtsi:389.32-418.4:
 Warning (unit_address_vs_reg): /soc/pinctrl@10005000/mmc0-uhs-pins@0: node
 has a unit name, but no reg or ranges property
Message-ID: <202508291515.1Ng0MfRb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6b067f14e24721933f530c91360725b04b45cdbc
commit: 1e0464a7957616a4eab6c6ae2639669628f18953 [458/458] CHROMIUM: arm64: dts: mt8189-skywalker-tarkin: Initial DTS for tarkin
config: arm64-randconfig-001-20250829 (https://download.01.org/0day-ci/archive/20250829/202508291515.1Ng0MfRb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250829/202508291515.1Ng0MfRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508291515.1Ng0MfRb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin.dtsi:389.32-418.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/mmc0-uhs-pins@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1186.27-1198.5: Warning (unit_address_vs_reg): /soc/xs-phy@11b10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1390.27-1402.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e90000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1404.27-1416.5: Warning (unit_address_vs_reg): /soc/xs-phy@11ef0000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1511.18-1517.6: Warning (unit_address_vs_reg): /soc/gpu@13000000/power-model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1518.18-1521.6: Warning (unit_address_vs_reg): /soc/gpu@13000000/power-model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt6359.dtsi:305.19-308.6: Warning (unit_address_vs_reg): /soc/pwrap@1cc04000/pmic/rtc/fginit: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6359.dtsi:310.17-313.6: Warning (unit_address_vs_reg): /soc/pwrap@1cc04000/pmic/rtc/fgsoc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6359.dtsi:315.19-318.6: Warning (unit_address_vs_reg): /soc/pwrap@1cc04000/pmic/rtc/ext32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:2566.30-2570.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:2572.23-2576.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property

vim +389 arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin.dtsi

   167	
   168	&pio{
   169		/* 182 lines */
   170		gpio-line-names =
   171			"",				/* 0 */
   172			"",
   173			"AP_SCP_GPIO02",
   174			"AP_SCP_GPIO03",
   175			"HP_INT_ODL",
   176			"",
   177			"",
   178			"USB3_HUB_RST_L",
   179			"",
   180			"",
   181			"",				/* 10 */
   182			"",
   183			"TP",
   184			"EDP_BL_EN_1V8",
   185			"TCHSCR_REPORT_DISABLE",
   186			"TCHSCR_INT_1V8_ODL",
   187			"AP_FLASH_WP_L",
   188			"EC_AP_DPOC_EN_ODL",
   189			"",
   190			"",
   191			"",				/* 20 */
   192			"",
   193			"",
   194			"",
   195			"",
   196			"EN_PP3300_EDP_X",
   197			"",
   198			"EC_AP_DP_HPD_L",
   199			"EDP_HPD_1V8",
   200			"BL_PWM_1V8",
   201			"CODEC_PWR_SOC_EN",		/* 30 */
   202			"UART_AP_TX_GSC_DBG_RX",
   203			"UART_GSC_DBG_TX_AP_RX",
   204			"AP_UART1_TXD",
   205			"AP_UART1_RXD",
   206			"AP_UART2_TXD",
   207			"AP_UART2_RXD",
   208			"AP_UART3_TXD",
   209			"AP_UART3_RXD",
   210			"AP_JTAG_TMS",
   211			"AP_JTAG_TCK",			/* 40 */
   212			"AP_JTAG_TDI",
   213			"AP_JTAG_TDO",
   214			"AP_JTAG_TRST_L",
   215			"AP_KPCOL0",
   216			"TP",
   217			"TP",
   218			"TP",
   219			"PCIE_WLAN_WAKE_OBFF_1V8_ODL",
   220			"PCIE_WLAN_RST_1V8_L",
   221			"PCIE_WLAN_CLKREQ_1V8_ODL",	/* 50 */
   222			"",
   223			"",
   224			"TP",
   225			"TP",
   226			"AP_I2C_AUD_SCL_1V8",
   227			"AP_I2C_AUD_SDA_1V8",
   228			"AP_I2C_TPM_SCL_1V8",
   229			"AP_I2C_TPM_SDA_1V8",
   230			"AP_I2C_TCHSCR_SCL_1V8",
   231			"AP_I2C_TCHSCR_SDA_1V8",	/* 60 */
   232			"",
   233			"",
   234			"AP_I2C_HDMI_SCL_1V8",
   235			"AP_I2C_HDMI_SDA_1V8",
   236			"AP_I2C_TCHPAD_SCL_1V8",
   237			"AP_I2C_TCHPAD_SDA_1V8",
   238			"TP",
   239			"TP",
   240			"SPI_AP_CS_EC_L",
   241			"SPI_AP_CLK_EC",		/* 70 */
   242			"SPI_AP_DO_EC_DI",
   243			"SPI_AP_DI_EC_DO",
   244			"TP",
   245			"TP",
   246			"TP",
   247			"TP",
   248			"",
   249			"",
   250			"",
   251			"",				/* 80 */
   252			"",
   253			"",
   254			"",
   255			"",
   256			"",
   257			"",
   258			"",
   259			"PWRAP_SPI_CS_L",
   260			"PWRAP_SPI_CK",
   261			"PWRAP_SPI_MOSI",		/* 90 */
   262			"PWRAP_SPI_MISO",
   263			"SRCLKENA0",
   264			"SRCLKENA1",
   265			"SCP_VREQ_VAO",
   266			"AP_RTC_CLK32K",
   267			"AP_PMIC_WDTRST_L",
   268			"AUD_CLK_MOSI (Strap)",
   269			"AUD_SYNC_MOSI (Strap)",
   270			"AUD_DAT_MOSI0 (Strap)",
   271			"AUD_DAT_MOSI1 (Strap)",	/* 100 */
   272			"AUD_DAT_MISO0 (Strap)",
   273			"AUD_DAT_MISO1 (Strap)",
   274			"TP",
   275			"TP",
   276			"TP",
   277			"I2S_HP_DI",
   278			"I2S_HP_MCK",
   279			"I2S_HP_BCK",
   280			"I2S_HP_LRCK",
   281			"I2S_HP_DO",			/* 110 */
   282			"",
   283			"",
   284			"",
   285			"",
   286			"PCM_HDMI_CLK",
   287			"PCM_HDMI_SYNC",
   288			"TP",
   289			"PCM_HDMI_DO",
   290			"DMIC0_CLK",
   291			"DMIC0_DATA",			/* 120 */
   292			"",
   293			"",
   294			"",
   295			"",
   296			"TCHPAD_INT_ODL",
   297			"TCHSCR_RST_1V8_L",
   298			"AP_HDMI_RST_ODL",
   299			"HDMI_AP_INT_ODL",
   300			"TP",
   301			"",				/* 130 */
   302			"AP_XHCI_INIT_DONE",
   303			"EC_AP_INT_ODL",
   304			"TP",
   305			"TP",
   306			"EN_HDMI_PWR",
   307			"",
   308			"AP_EC_WARM_RST_REQ",
   309			"GSC_AP_INT_ODL",
   310			"HDMI_HPD_1V8_ODL",
   311			"AP_SUSPEND_L ",		/* 140 */
   312			"EC_AP_RSVD0_ODL",
   313			"EC_AP_RSVD1_ODL",
   314			"MT6319B_INT",
   315			"",
   316			"BT_KILL_1V8_L",
   317			"WIFI_KILL_1V8_L",
   318			"",
   319			"",
   320			"",
   321			"SPI_AP_CLK_BIOS",		/* 150 */
   322			"SPI_AP_CS_BIOS_L",
   323			"SPI_AP_DO_BIOS_DI",
   324			"SPI_AP_DI_BIOS_DO",
   325			"TP",
   326			"TP",
   327			"EMMC_DATA7",
   328			"EMMC_DATA6",
   329			"EMMC_DATA5",
   330			"EMMC_DATA4",
   331			"EMMC_RST_L",			/* 160 */
   332			"EMMC_CMD",
   333			"EMMC_CLK",
   334			"EMMC_DATA3",
   335			"EMMC_DATA2",
   336			"EMMC_DATA1",
   337			"EMMC_DATA0",
   338			"EMMC_STRB",
   339			"",
   340			"",
   341			"",				/* 170 */
   342			"",
   343			"",
   344			"",
   345			"",
   346			"",
   347			"",
   348			"",
   349			"",
   350			"",
   351			"SPMI_SCL",			/* 180 */
   352			"SPMI_SDA",
   353			"EMI_RESET_N";
   354	
   355		touch_pin_report: pin-report-pins {
   356			pins-touch-en {
   357				pinmux = <PINMUX_GPIO14__FUNC_GPIO14>;
   358				output-low;
   359			};
   360		};
   361	
   362		mmc0_pins_default: mmc0-default-pins {
   363			pins-cmd-dat {
   364				pinmux = <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
   365					 <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
   366					 <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
   367					 <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
   368					 <PINMUX_GPIO161__FUNC_MSDC0_CMD>,
   369					 <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
   370					 <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
   371					 <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
   372					 <PINMUX_GPIO166__FUNC_MSDC0_DAT0>;
   373				input-enable;
   374				drive-strength = <6>;
   375				bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
   376			};
   377			pins-clk {
   378				pinmux = <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
   379				drive-strength = <6>;
   380				bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
   381			};
   382			pins-rst {
   383				pinmux = <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
   384				drive-strength = <6>;
   385				bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
   386			};
   387		};
   388	
 > 389		mmc0_pins_uhs: mmc0-uhs-pins@0{
   390			pins-cmd-dat {
   391				pinmux = <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
   392					 <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
   393					 <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
   394					 <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
   395					 <PINMUX_GPIO161__FUNC_MSDC0_CMD>,
   396					 <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
   397					 <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
   398					 <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
   399					 <PINMUX_GPIO166__FUNC_MSDC0_DAT0>;
   400				input-enable;
   401				drive-strength = <8>;
   402				bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
   403			};
   404			pins-clk {
   405				pinmux = <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
   406				drive-strength = <8>;
   407				bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
   408			};
   409			pins-ds {
   410				pinmux = <PINMUX_GPIO167__FUNC_MSDC0_DSL>;
   411				drive-strength = <8>;
   412				bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
   413			};
   414			pins-rst {
   415				pinmux = <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
   416				bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
   417			};
   418		};
   419	};
   420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
