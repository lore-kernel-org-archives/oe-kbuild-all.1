Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48812E3389
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958258; cv=none; b=jJs9i1GaDhzS7imndkCOos9NDqxs1/G6dMI/85oVqGBeGOyKiI1ts3aBbTskIAD5BoJAKPTp5t4UQGkd2tad5eret4bq07KgzAfonOTIDTAmGjUkci776FfxUBT5brBe4T9dyl9RDE6Qu4Hy6wIXI2OVT5Fzi8MlLcCuu4OeEJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958258; c=relaxed/simple;
	bh=NKMZc/oKQ5iSxpxuWhSeP9D5XQcufT68hH8+9p09bBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KoysxUsiBwGcvKJ7AMM4IEEAACMY1Iia+n2zGQhdfTKCIeeeKAzviLyGbz1UC8WXY24pLzfuOlSn/1IGxyGYRUNQ3yk5pGZsaP9rGUsMcHYc5VnFriQRnG3cGhn/D128+J5D7xkvRzgormVk9EAUe8XZsc9QnK7ReNeZcASV8a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsyvUe2K; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsyvUe2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741958257; x=1773494257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NKMZc/oKQ5iSxpxuWhSeP9D5XQcufT68hH8+9p09bBM=;
  b=MsyvUe2KRd060YmazVIuam5q2N2w7xeiFY9Xze/KOcmDxkbcrRTM71dQ
   eygIMjXdoMSlqacJq8coS+A++b0m4KXwI+ajGrku3Ata5aotL+johL/6G
   oCyLvmfgo4fVtpUTLTCxyVRTK2j9+2+Je4Dni/cbp06GOx/PY992Or8wG
   1p50d9NagD4OmnAvlJ46+VSYJ/xEjeQQ743xHJMoV1f5xUOhQFR+PX/6t
   JhQ70mE8QjPdU9mJ6/5Mb84SRrUO6QzmBlPx2kCJSbKhlFEFhBDSRY8Df
   WxYl42TwKsYUxUBLu4ypUrxI6auY9tbnzaF/ZOhtHZ2p7i048Doz5Ex+b
   w==;
X-CSE-ConnectionGUID: 2NtL1CLESpeKSQCt+Zh67A==
X-CSE-MsgGUID: Rt4LU7ZORSeK2JqBMEDHVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="68475766"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="68475766"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 06:17:36 -0700
X-CSE-ConnectionGUID: GfueaQZrRm2ChpTFSasoZw==
X-CSE-MsgGUID: qDbvHsN3TKuo21HYMnXQgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="144463737"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Mar 2025 06:17:35 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt4uq-000ATi-2F;
	Fri, 14 Mar 2025 13:17:32 +0000
Date: Fri, 14 Mar 2025 21:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/1]
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtb:
 /soc/pwrap@1000d000/mt6397/clocks: failed to match any schema with
 compatible: ['mediatek,mt6397-clk']
Message-ID: <202503142154.XzOkN4Q8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   5c68dbf977c4aebedda2aeb928d2e519b38c10ba
commit: 66edee0acd72a79606fc8a1fb89166dda54be744 [1/1] arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC sub-node names
config: arm64-randconfig-052-20250310 (https://download.01.org/0day-ci/archive/20250314/202503142154.XzOkN4Q8-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503142154.XzOkN4Q8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503142154.XzOkN4Q8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/syscfg_pctl_a@10005000: failed to match any schema with compatible: ['mediatek,mt8173-pctl-a-syscfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pinctrl@1000b000: 'aud_i2s2', 'bl_fixed_pins', 'bt_wake_pins', 'disp_pwm0_pins', 'gpio-line-names', 'gpio_keys_pins', 'hdmi_mux_pins', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'panel_backlight_en_pins', 'panel_fixed_pins', 'ps8640_fixed_pins', 'ps8640_pins', 'rt5650_irq', 'sdio_fixed_3v3_pins', 'spi1', 'trackpad_irq', 'usb', 'wifi_wake_pins', 'xxx' do not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8173-wdt', 'mediatek,mt6589-wdt']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8173-wdt', 'mediatek,mt6589-wdt']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt8173-pwrap']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/mt6397: failed to match any schema with compatible: ['mediatek,mt6397']
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/mt6397/clocks: failed to match any schema with compatible: ['mediatek,mt6397-clk']
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/mt6397/regulators: failed to match any schema with compatible: ['mediatek,mt6397-regulator']
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/mt6397/rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: syscfg_pctl_pmic@c000: reg: [[0, 49152], [0, 264]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/mt6397/syscfg_pctl_pmic@c000: failed to match any schema with compatible: ['mediatek,mt6397-pctl-pmic-syscfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/i2c@11007000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5650']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: tpm@20: 'powered-while-suspended' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
--
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/syscfg_pctl_a@10005000: failed to match any schema with compatible: ['mediatek,mt8173-pctl-a-syscfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pinctrl@1000b000: 'aud_i2s2', 'bl_fixed_pins', 'bt_wake_pins', 'disp_pwm0_pins', 'gpio-line-names', 'gpio_keys_pins', 'hdmi_mux_pins', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'panel_backlight_en_pins', 'panel_fixed_pins', 'ps8640_fixed_pins', 'ps8640_pins', 'rt5650_irq', 'sdio_fixed_3v3_pins', 'spi1', 'trackpad_irq', 'usb', 'wifi_wake_pins', 'xxx' do not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8173-wdt', 'mediatek,mt6589-wdt']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8173-wdt', 'mediatek,mt6589-wdt']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt8173-pwrap']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/mt6397: failed to match any schema with compatible: ['mediatek,mt6397']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/mt6397/clocks: failed to match any schema with compatible: ['mediatek,mt6397-clk']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/mt6397/regulators: failed to match any schema with compatible: ['mediatek,mt6397-regulator']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/mt6397/rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: syscfg_pctl_pmic@c000: reg: [[0, 49152], [0, 264]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/mt6397/syscfg_pctl_pmic@c000: failed to match any schema with compatible: ['mediatek,mt6397-pctl-pmic-syscfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11007000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5650']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: tpm@20: 'powered-while-suspended' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
--
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/syscfg_pctl_a@10005000: failed to match any schema with compatible: ['mediatek,mt8173-pctl-a-syscfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pinctrl@1000b000: 'aud_i2s2', 'bl_fixed_pins', 'bt_wake_pins', 'disp_pwm0_pins', 'gpio-line-names', 'gpio_keys_pins', 'hdmi_mux_pins', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'panel_backlight_en_pins', 'panel_fixed_pins', 'ps8640_fixed_pins', 'ps8640_pins', 'rt5650_irq', 'sdio_fixed_3v3_pins', 'spi1', 'trackpad_irq', 'usb', 'wifi_wake_pins', 'xxx' do not match any of the regexes: '-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8173-wdt', 'mediatek,mt6589-wdt']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/watchdog@10007000: failed to match any schema with compatible: ['mediatek,mt8173-wdt', 'mediatek,mt6589-wdt']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt8173-timer', 'mediatek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000: failed to match any schema with compatible: ['mediatek,mt8173-pwrap']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/mt6397: failed to match any schema with compatible: ['mediatek,mt6397']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/mt6397/clocks: failed to match any schema with compatible: ['mediatek,mt6397-clk']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/mt6397/regulators: failed to match any schema with compatible: ['mediatek,mt6397-regulator']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/mt6397/rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: syscfg_pctl_pmic@c000: reg: [[0, 49152], [0, 264]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/mt6397/syscfg_pctl_pmic@c000: failed to match any schema with compatible: ['mediatek,mt6397-pctl-pmic-syscfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/intpol-controller@10200620: failed to match any schema with compatible: ['mediatek,mt8173-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11007000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5650']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: tpm@20: 'powered-while-suspended' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
