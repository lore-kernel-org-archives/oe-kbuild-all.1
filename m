Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD357219313
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755940064; cv=none; b=f4sFPdOUkPm5miaC2uRvs/OJxXcICqwrMggLV4RcsO4kvEjYk92JCSsTDFQf4y8Q3FK7skY2iSZKR91cXsAbGOfFtjm1c6WmGO3H0LgP4/WXRfkSOAq7Ak56mdvYUv2Swcr6J0kD7wcG5a4ujBuSHAXcwydrt+JNV68ZBnWs7Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755940064; c=relaxed/simple;
	bh=T1FhUwuQ3KhOJXp7s0pAn/eWEqwU+DUUrGwvTPF4Rnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sr8reirHsLW0FWB6GuukpyV032AYOzGLpEzPRaP0d5a1OIw0yBu5lRs+4V5h3geYHum8v7r7k95DkQgiocYHLXyHqsHSxnToEVtMwW//fyIhVmOnCyP543lLiPfeoJLw5toE6Zp1R3O28lYcRvvB5l1o6daSxZ3+sGFB9ySVJqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+/XGcct; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+/XGcct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755940062; x=1787476062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T1FhUwuQ3KhOJXp7s0pAn/eWEqwU+DUUrGwvTPF4Rnc=;
  b=Y+/XGcct9eQgCsmEC+mNiVDo4Gs5h7niTQ8Efce/vZPAdNxV2Hg6vQtD
   nfvC4kbVC+PCz919zuyD5PbyXO1n51gWF6daYV/Z9eVayFGGUfFzn/rxE
   ehx/bgPy7bPef8edHxJ1YRufPKmkW2zfmQYRIwr/22BN0WeXCQkU5V88d
   D8XUquRzTuC/EBvHQo2Abh1DdU1+5SW2akMq2j0jBGHFl96GKS6Hh5ThF
   YwuGOA/k6Wde46a+rn/VsxsatZWlvkuAq3rsnlfRx7hNNq7f/kHiwx5ni
   YnyDFEmfE+uHaVKhEht7Oahe3THfW64B9Gk5FC/DIkEfnD6f0gHiZcs5g
   w==;
X-CSE-ConnectionGUID: PVN2lk+EReG9TtNb8ClUHw==
X-CSE-MsgGUID: gt8nS3k2Qz6lMPPSVA+PUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61876393"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61876393"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 02:07:41 -0700
X-CSE-ConnectionGUID: RMI2++oyQsGAdeFHOeyz6Q==
X-CSE-MsgGUID: n2rMyaLQSjOnrafP2vFIeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="192547508"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Aug 2025 02:07:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upkDp-000MDl-26;
	Sat, 23 Aug 2025 09:07:37 +0000
Date: Sat, 23 Aug 2025 17:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 443/443]
 arch/arm64/boot/dts/mediatek/mt8189-evb.dts:902.23-931.4: Warning
 (unit_address_vs_reg): /soc/pinctrl@10005000/mmc0@0: node has a unit name,
 but no reg or ranges property
Message-ID: <202508231638.QoJQ53uj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   12cacc6855c36b7b2ce4a8f020b4a40a6433357b
commit: e301c33f8c751a47c4c3488ee8df07bcca477290 [443/443] CHROMIUM: arm64: dts: mt8189-evb: Initial DTS for mt8189-evb
config: arm64-randconfig-001-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231638.QoJQ53uj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231638.QoJQ53uj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231638.QoJQ53uj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dts:902.23-931.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/mmc0@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dts:955.23-971.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/mmc1@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1186.27-1198.5: Warning (unit_address_vs_reg): /soc/xs-phy@11b10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1390.27-1402.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e90000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1404.27-1416.5: Warning (unit_address_vs_reg): /soc/xs-phy@11ef0000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1511.18-1517.6: Warning (unit_address_vs_reg): /soc/gpu@13000000/power-model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1518.18-1521.6: Warning (unit_address_vs_reg): /soc/gpu@13000000/power-model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt6359.dtsi:305.19-308.6: Warning (unit_address_vs_reg): /soc/pwrap@1cc04000/pmic/rtc/fginit: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6359.dtsi:310.17-313.6: Warning (unit_address_vs_reg): /soc/pwrap@1cc04000/pmic/rtc/fgsoc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt6359.dtsi:315.19-318.6: Warning (unit_address_vs_reg): /soc/pwrap@1cc04000/pmic/rtc/ext32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:2556.30-2560.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:2562.23-2566.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:2568.35-2572.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc-max-crit@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dts:21.27-28.4: Warning (unit_address_vs_reg): /regulator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189-evb.dts:30.27-37.4: Warning (unit_address_vs_reg): /regulator@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189-evb.dts:39.27-46.4: Warning (unit_address_vs_reg): /regulator@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189-evb.dts:48.27-55.4: Warning (unit_address_vs_reg): /regulator@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189-evb.dts:57.27-64.4: Warning (unit_address_vs_reg): /regulator@4: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:430.46-437.5: Warning (simple_bus_reg): /soc/performance-controller@108d68: simple-bus unit address format error, expected "108d78"
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:685.16-688.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1186.27-1198.5: Warning (simple_bus_reg): /soc/xs-phy@11b10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1368.27-1388.5: Warning (simple_bus_reg): /soc/xs-phy@11e80000: simple-bus unit address format error, expected "11e83000"
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1390.27-1402.5: Warning (simple_bus_reg): /soc/xs-phy@11e90000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1404.27-1416.5: Warning (simple_bus_reg): /soc/xs-phy@11ef0000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:1524.32-1622.5: Warning (simple_bus_reg): /soc/opp-table-gpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:2548.32-2856.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:2858.10-2861.5: Warning (simple_bus_reg): /soc/emiisu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:439.37-459.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8189.dtsi:461.29-465.5: Warning (unique_unit_address_if_enabled): /soc/syscon@d01a000: duplicate unit-address (also used in node /soc/soc-dbg-error-flag@d01a000)
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:629.32-683.5: Warning (unique_unit_address_if_enabled): /soc/mt8189-afe-pcm@11050000: duplicate unit-address (also used in node /soc/syscon@11050000)

vim +902 arch/arm64/boot/dts/mediatek/mt8189-evb.dts

   465	
   466	&pio {
   467		edp_tx_hpd_pins: edp-tx-hpd-pins{
   468			pins-hpd {
   469				pinmux = <PINMUX_GPIO28__FUNC_EDP_TX_HPD>;
   470				bias-pull-up;
   471			};
   472		};
   473	
   474		panel_fixed_pins: panel-fixed-pins {
   475			pins1 {
   476				pinmux = <PINMUX_GPIO29__FUNC_GPIO29>,
   477					 <PINMUX_GPIO108__FUNC_GPIO108>,
   478					 <PINMUX_GPIO109__FUNC_GPIO109>,
   479					 <PINMUX_GPIO110__FUNC_GPIO110>;
   480				bias-pull-up;
   481			};
   482		};
   483	
   484		i2c0_pins: i2c0-default {
   485			pins-bus {
   486				pinmux = <PINMUX_GPIO52__FUNC_SDA0>,
   487					 <PINMUX_GPIO51__FUNC_SCL0>;
   488				bias-disable;
   489			};
   490		};
   491	
   492		i2c1_pins: i2c1-default {
   493			pins-bus {
   494				pinmux = <PINMUX_GPIO54__FUNC_SDA1>,
   495					 <PINMUX_GPIO53__FUNC_SCL1>;
   496				bias-disable;
   497			};
   498		};
   499	
   500		i2c2_pins: i2c2-default {
   501			pins-bus {
   502				pinmux = <PINMUX_GPIO56__FUNC_SDA2>,
   503					 <PINMUX_GPIO55__FUNC_SCL2>;
   504				bias-disable;
   505			};
   506		};
   507	
   508		i2c3_pins: i2c3-default {
   509			pins-bus {
   510				pinmux = <PINMUX_GPIO58__FUNC_SDA3>,
   511					 <PINMUX_GPIO57__FUNC_SCL3>;
   512				bias-disable;
   513			};
   514		};
   515	
   516		i2c4_pins: i2c4-default {
   517			pins-bus {
   518				pinmux = <PINMUX_GPIO60__FUNC_SDA4>,
   519					 <PINMUX_GPIO59__FUNC_SCL4>;
   520				bias-disable;
   521			};
   522		};
   523		i2c5_pins: i2c5-default {
   524			pins-bus {
   525				pinmux = <PINMUX_GPIO62__FUNC_SDA5>,
   526					 <PINMUX_GPIO61__FUNC_SCL5>;
   527				bias-disable;
   528			};
   529		};
   530	
   531		i2c6_pins: i2c6-default {
   532			pins-bus {
   533				pinmux = <PINMUX_GPIO64__FUNC_SDA6>,
   534					 <PINMUX_GPIO63__FUNC_SCL6>;
   535				bias-disable;
   536			};
   537		};
   538	
   539		i2c7_pins: i2c7-default {
   540			pins-bus {
   541				pinmux = <PINMUX_GPIO66__FUNC_SDA7>,
   542					 <PINMUX_GPIO65__FUNC_SCL7>;
   543				bias-disable;
   544			};
   545		};
   546	
   547		i2c8_pins: i2c8-default {
   548			pins-bus {
   549				pinmux = <PINMUX_GPIO68__FUNC_SDA8>,
   550					 <PINMUX_GPIO67__FUNC_SCL8>;
   551				bias-disable;
   552			};
   553		};
   554	
   555		spi0_pins: spi0-default {
   556			pins-cmd-dat {
   557				pinmux = <PINMUX_GPIO69__FUNC_SPIM0_CSB>,
   558					 <PINMUX_GPIO70__FUNC_SPIM0_CLK>,
   559					 <PINMUX_GPIO71__FUNC_SPIM0_MO>,
   560					 <PINMUX_GPIO72__FUNC_SPIM0_MI>;
   561			};
   562		};
   563	
   564		spi1_pins: spi1-default {
   565			pins-cmd-dat {
   566				pinmux = <PINMUX_GPIO73__FUNC_SPIM1_CSB>,
   567					 <PINMUX_GPIO74__FUNC_SPIM1_CLK>,
   568					 <PINMUX_GPIO75__FUNC_SPIM1_MO>,
   569					 <PINMUX_GPIO76__FUNC_SPIM1_MI>;
   570			};
   571		};
   572	
   573		spi2_pins: spi2-default {
   574			pins-cmd-dat {
   575				pinmux = <PINMUX_GPIO77__FUNC_SPIM2_CSB>,
   576					 <PINMUX_GPIO78__FUNC_SPIM2_CLK>,
   577					 <PINMUX_GPIO79__FUNC_SPIM2_MO>,
   578					 <PINMUX_GPIO80__FUNC_SPIM2_MI>;
   579			};
   580		};
   581	
   582		spi3_pins: spi3-default {
   583			pins-cmd-dat {
   584				pinmux = <PINMUX_GPIO0__FUNC_SPIM3_A_CSB>,
   585					 <PINMUX_GPIO1__FUNC_SPIM3_A_CLK>,
   586					 <PINMUX_GPIO2__FUNC_SPIM3_A_MO>,
   587					 <PINMUX_GPIO3__FUNC_SPIM3_A_MI>;
   588			};
   589		};
   590	
   591		spi4_pins: spi4-default {
   592			pins-cmd-dat {
   593				pinmux = <PINMUX_GPIO4__FUNC_SPIM4_A_CSB>,
   594					 <PINMUX_GPIO5__FUNC_SPIM4_A_CLK>,
   595					 <PINMUX_GPIO6__FUNC_SPIM4_A_MO>,
   596					 <PINMUX_GPIO7__FUNC_SPIM4_A_MI>;
   597			};
   598		};
   599	
   600		spi5_pins: spi5-default {
   601			pins-cmd-dat {
   602				pinmux = <PINMUX_GPIO8__FUNC_SPIM5_A_CSB>,
   603					 <PINMUX_GPIO9__FUNC_SPIM5_A_CLK>,
   604					 <PINMUX_GPIO10__FUNC_SPIM5_A_MO>,
   605					 <PINMUX_GPIO11__FUNC_SPIM5_A_MI>;
   606			};
   607		};
   608	
   609		pcie_pins_default: pcie-default {
   610			pins-cmd-dat {
   611				pinmux = <PINMUX_GPIO48__FUNC_WAKEN>,
   612					 <PINMUX_GPIO49__FUNC_PERSTN>,
   613					 <PINMUX_GPIO50__FUNC_CLKREQN>;
   614			};
   615		};
   616	
   617		nor_pins: nor-pins {
   618			pins-ck-io {
   619				pinmux = <PINMUX_GPIO150__FUNC_SPINOR_CK>,
   620					 <PINMUX_GPIO152__FUNC_SPINOR_IO0>,
   621					 <PINMUX_GPIO153__FUNC_SPINOR_IO1>;
   622				drive-strength = <8>;
   623				bias-pull-down;
   624			};
   625	
   626			pins-cs {
   627				pinmux = <PINMUX_GPIO151__FUNC_SPINOR_CS>;
   628				drive-strength = <8>;
   629				bias-pull-up;
   630			};
   631		};
   632	
   633		dptx_pin: dptx-default-pins {
   634			pins-cmd-dat {
   635				pinmux = <PINMUX_GPIO27__FUNC_DP_TX_HPD>;
   636			};
   637		};
   638		audio_spk_en_pins: audio_spk_en_pins {
   639			pins-spk-en {
   640				pinmux = <PINMUX_GPIO5__FUNC_GPIO5>;
   641				output-low;
   642			};
   643		};
   644	
   645		audio_codec_pins: audio-codec-pins {
   646			pins-hp-int-odl {
   647				pinmux = <PINMUX_GPIO4__FUNC_GPIO4>;
   648				input-enable;
   649				bias-disable;
   650			};
   651		};
   652	
   653		aud_gpio_i2sin0_off: aud-gpio-i2sin0-off {
   654			pins-cmd1-dat {
   655				pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
   656				input-enable;
   657				bias-pull-down;
   658			};
   659		};
   660	
   661		aud_gpio_i2sin0_on: aud-gpio-i2sin0-on {
   662			pins-cmd1-dat {
   663				pinmux = <PINMUX_GPIO106__FUNC_I2SIN0_DI>;
   664				input-schmitt-enable;
   665				bias-disable;
   666			};
   667		};
   668	
   669		aud_gpio_i2sout0_off: aud-gpio-i2sout0-off {
   670			pins-cmd1-dat {
   671				pinmux = <PINMUX_GPIO107__FUNC_GPIO107>;
   672				input-enable;
   673				bias-pull-down;
   674			};
   675	
   676			pins-cmd2-dat {
   677				pinmux = <PINMUX_GPIO108__FUNC_GPIO108>;
   678				input-enable;
   679				bias-pull-down;
   680			};
   681	
   682			pins-cmd3-dat {
   683				pinmux = <PINMUX_GPIO109__FUNC_GPIO109>;
   684				input-enable;
   685				bias-pull-down;
   686			};
   687	
   688			pins-cmd4-dat {
   689				pinmux = <PINMUX_GPIO110__FUNC_GPIO110>;
   690				input-enable;
   691				bias-pull-down;
   692			};
   693		};
   694	
   695		aud_gpio_i2sout0_on: aud-gpio-i2sout0-on {
   696			pins-cmd1-dat {
   697				pinmux = <PINMUX_GPIO107__FUNC_I2SOUT0_MCK>;
   698				input-schmitt-enable;
   699				bias-disable;
   700			};
   701	
   702			pins-cmd2-dat {
   703				pinmux = <PINMUX_GPIO108__FUNC_I2SOUT0_BCK>;
   704				input-schmitt-enable;
   705				bias-disable;
   706			};
   707	
   708			pins-cmd3-dat {
   709				pinmux = <PINMUX_GPIO109__FUNC_I2SOUT0_LRCK>;
   710				input-schmitt-enable;
   711				bias-disable;
   712			};
   713	
   714			pins-cmd4-dat {
   715				pinmux = <PINMUX_GPIO110__FUNC_I2SOUT0_DO>;
   716				input-schmitt-enable;
   717				bias-disable;
   718			};
   719		};
   720	
   721		aud_gpio_i2sin1_off: aud-gpio-i2sin1-off {
   722			pins-cmd1-dat {
   723				pinmux = <PINMUX_GPIO130__FUNC_GPIO130>;
   724				input-enable;
   725				bias-pull-down;
   726			};
   727		};
   728	
   729		aud_gpio_i2sin1_on: aud-gpio-i2sin1-on {
   730			pins-cmd1-dat {
   731				pinmux = <PINMUX_GPIO130__FUNC_I2SIN1_DI>;
   732				input-schmitt-enable;
   733				bias-disable;
   734			};
   735		};
   736	
   737		aud_gpio_i2sout1_off: aud-gpio-i2sout1-off {
   738			pins-cmd1-dat {
   739				pinmux = <PINMUX_GPIO111__FUNC_GPIO111>;
   740				input-enable;
   741				bias-pull-down;
   742			};
   743	
   744			pins-cmd2-dat {
   745				pinmux = <PINMUX_GPIO112__FUNC_GPIO112>;
   746				input-enable;
   747				bias-pull-down;
   748			};
   749	
   750			pins-cmd3-dat {
   751				pinmux = <PINMUX_GPIO113__FUNC_GPIO113>;
   752				input-enable;
   753				bias-pull-down;
   754			};
   755	
   756			pins-cmd4-dat {
   757				pinmux = <PINMUX_GPIO114__FUNC_GPIO114>;
   758				input-enable;
   759				bias-pull-down;
   760			};
   761		};
   762	
   763		aud_gpio_i2sout1_on: aud-gpio-i2sout1-on {
   764			pins-cmd1-dat {
   765				pinmux = <PINMUX_GPIO111__FUNC_I2SOUT1_MCK>;
   766				input-schmitt-enable;
   767				bias-disable;
   768			};
   769	
   770			pins-cmd2-dat {
   771				pinmux = <PINMUX_GPIO112__FUNC_I2SOUT1_BCK>;
   772				input-schmitt-enable;
   773				bias-disable;
   774			};
   775	
   776			pins-cmd3-dat {
   777				pinmux = <PINMUX_GPIO113__FUNC_I2SOUT1_LRCK>;
   778				input-schmitt-enable;
   779				bias-disable;
   780			};
   781	
   782			pins-cmd4-dat {
   783				pinmux = <PINMUX_GPIO114__FUNC_I2SOUT1_DO>;
   784				input-schmitt-enable;
   785				bias-disable;
   786			};
   787		};
   788	
   789		aud_gpio_ap_dmic_off: aud-gpio-ap-dmic-off {
   790			pins-cmd1-dat {
   791				pinmux = <PINMUX_GPIO119__FUNC_GPIO119>;
   792				input-enable;
   793				bias-pull-down;
   794			};
   795			pins-cmd2-dat {
   796				pinmux = <PINMUX_GPIO120__FUNC_GPIO120>;
   797				input-enable;
   798				bias-pull-down;
   799			};
   800		};
   801		aud_gpio_ap_dmic_on: aud-gpio-ap-dmic-on {
   802			pins-cmd1-dat {
   803				pinmux = <PINMUX_GPIO119__FUNC_DMIC0_CLK>;
   804				input-schmitt-enable;
   805				bias-disable;
   806			};
   807			pins-cmd2-dat {
   808				pinmux = <PINMUX_GPIO120__FUNC_DMIC0_DAT0>;
   809				input-schmitt-enable;
   810				bias-disable;
   811			};
   812		};
   813		aud_gpio_ap_dmic1_off: aud-gpio-ap-dmic1-off {
   814			pins-cmd1-dat {
   815				pinmux = <PINMUX_GPIO122__FUNC_GPIO122>;
   816				input-enable;
   817				bias-pull-down;
   818			};
   819			pins-cmd2-dat {
   820				pinmux = <PINMUX_GPIO123__FUNC_GPIO123>;
   821				input-enable;
   822				bias-pull-down;
   823			};
   824		};
   825		aud_gpio_ap_dmic1_on: aud-gpio-ap-dmic1-on {
   826			pins-cmd1-dat {
   827				pinmux = <PINMUX_GPIO122__FUNC_DMIC1_CLK>;
   828				input-schmitt-enable;
   829				bias-disable;
   830			};
   831			pins-cmd2-dat {
   832				pinmux = <PINMUX_GPIO123__FUNC_DMIC1_DAT0>;
   833				input-schmitt-enable;
   834				bias-disable;
   835			};
   836		};
   837	
   838		aud_gpio_pcm_off: aud-gpio-pcm-off {
   839			pins-cmd1-dat {
   840				pinmux = <PINMUX_GPIO115__FUNC_GPIO115>;
   841				input-enable;
   842				bias-pull-down;
   843			};
   844			pins-cmd2-dat {
   845				pinmux = <PINMUX_GPIO116__FUNC_GPIO116>;
   846				input-enable;
   847				bias-pull-down;
   848			};
   849			pins-cmd3-dat {
   850				pinmux = <PINMUX_GPIO118__FUNC_GPIO118>;
   851				input-enable;
   852				bias-pull-down;
   853			};
   854		};
   855	
   856		aud_gpio_pcm_on: aud-gpio-pcm-on {
   857			pins-cmd1-dat {
   858				pinmux = <PINMUX_GPIO115__FUNC_PCM0_CLK>;
   859				input-schmitt-enable;
   860				bias-disable;
   861			};
   862			pins-cmd2-dat {
   863				pinmux = <PINMUX_GPIO116__FUNC_PCM0_SYNC>;
   864				input-schmitt-enable;
   865				bias-disable;
   866			};
   867			pins-cmd3-dat {
   868				pinmux = <PINMUX_GPIO118__FUNC_PCM0_DO>;
   869				input-schmitt-enable;
   870				bias-disable;
   871			};
   872		};
   873		/* AUDIO GPIO standardization end */
   874	
   875		mmc0_pins_default: mmc0default {
   876			pins-cmd-dat {
   877				pinmux = <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
   878					 <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
   879					 <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
   880					 <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
   881					 <PINMUX_GPIO161__FUNC_MSDC0_CMD>,
   882					 <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
   883					 <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
   884					 <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
   885					 <PINMUX_GPIO166__FUNC_MSDC0_DAT0>;
   886				input-enable;
   887				drive-strength = <MTK_DRIVE_6mA>;
   888				bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
   889			};
   890			pins-clk {
   891				pinmux = <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
   892				drive-strength = <MTK_DRIVE_6mA>;
   893				bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
   894			};
   895			pins-rst {
   896				pinmux = <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
   897				drive-strength = <MTK_DRIVE_6mA>;
   898				bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
   899			};
   900		};
   901	
 > 902		mmc0_pins_uhs: mmc0@0{
   903			pins-cmd-dat {
   904				pinmux = <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
   905					 <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
   906					 <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
   907					 <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
   908					 <PINMUX_GPIO161__FUNC_MSDC0_CMD>,
   909					 <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
   910					 <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
   911					 <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
   912					 <PINMUX_GPIO166__FUNC_MSDC0_DAT0>;
   913				input-enable;
   914				drive-strength = <MTK_DRIVE_8mA>;
   915				bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
   916			};
   917			pins-clk {
   918				pinmux = <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
   919				drive-strength = <MTK_DRIVE_8mA>;
   920				bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
   921			};
   922			pins-ds {
   923				pinmux = <PINMUX_GPIO167__FUNC_MSDC0_DSL>;
   924				drive-strength = <MTK_DRIVE_8mA>;
   925				bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
   926			};
   927			pins-rst {
   928				pinmux = <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
   929				bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
   930			};
   931		};
   932	
   933		mmc1_pins_default: mmc1default {
   934			pins-cmd-dat {
   935				pinmux = <PINMUX_GPIO168__FUNC_MSDC1_CMD>,
   936					 <PINMUX_GPIO170__FUNC_MSDC1_DAT0>,
   937					 <PINMUX_GPIO171__FUNC_MSDC1_DAT1>,
   938					 <PINMUX_GPIO172__FUNC_MSDC1_DAT2>,
   939					 <PINMUX_GPIO173__FUNC_MSDC1_DAT3>;
   940				input-enable;
   941				drive-strength = <MTK_DRIVE_8mA>;
   942				bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
   943			};
   944			pins-clk {
   945				pinmux = <PINMUX_GPIO169__FUNC_MSDC1_CLK>;
   946				drive-strength = <MTK_DRIVE_8mA>;
   947				bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
   948			};
   949			pins-insert {
   950				pinmux = <PINMUX_GPIO2__FUNC_GPIO2>;
   951				bias-pull-up;
   952			};
   953		};
   954	
 > 955		mmc1_pins_uhs: mmc1@0{
   956			pins-cmd-dat {
   957				pinmux = <PINMUX_GPIO168__FUNC_MSDC1_CMD>,
   958					 <PINMUX_GPIO170__FUNC_MSDC1_DAT0>,
   959					 <PINMUX_GPIO171__FUNC_MSDC1_DAT1>,
   960					 <PINMUX_GPIO172__FUNC_MSDC1_DAT2>,
   961					 <PINMUX_GPIO173__FUNC_MSDC1_DAT3>;
   962				input-enable;
   963				drive-strength = <MTK_DRIVE_8mA>;
   964				bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
   965			};
   966			pins-clk {
   967				pinmux = <PINMUX_GPIO169__FUNC_MSDC1_CLK>;
   968				drive-strength = <MTK_DRIVE_8mA>;
   969				bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
   970			};
   971		};
   972	};
   973	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
