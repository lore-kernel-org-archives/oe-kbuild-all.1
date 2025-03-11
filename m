Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99428263887
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 18:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716636; cv=none; b=t5VSFq3s/GRHhOslUtPSXu6RDVXLN4QAxx0CkthwVOzY8TXjO9tGNf0Ou7vX7eIpwoV9urQk7Ycyh5wDwa3IstzDLkDGrco8yHnIg/clP91zTy5oiFrDxaD5X5mJKnn+f6V5PYhqcNESX2PPQGmXxJnYjnwlJTYHlrydYc554Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716636; c=relaxed/simple;
	bh=n2gyZg1aKp45T1EE+bMtT+IOtYAsDxzCHhOg0MybcaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hhjB2VfrdAAOPFm2UYKvgzf5YkwraRu1DpmwQ7YQkPkW4I4a0Z4hBFDWdEm4VSJEt7x0UUPSbC4ei+Y5SDTEXNzLmmV1xvfU7cOfyhVAZXWaMFqMsmdDSONEAsPT2K9cs92dUBPpaPtB8N54ciiWnL0lziPd1c6lmUYsNOoyZI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUEDmuB/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUEDmuB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741716635; x=1773252635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n2gyZg1aKp45T1EE+bMtT+IOtYAsDxzCHhOg0MybcaA=;
  b=DUEDmuB/Ml72rAZdBA9BVQ4DWu57YSCOIHh7+UcgJXF2FbCKMyqusLTt
   06i7+wV6d98sW1iUYKHTSaq/p8bTRz7V3WWxsMm0ROL0Rv3LxCru84LbC
   xLjF71ujYbm24H6ePE8gxlbrw3hNPDeULHRC35jyk9HXdUx8rXKY9ue8p
   6M9AvSdi8GE2+cDHfLsZpd53Dd4OY5MYjKm5TuPY93MbBOZ2Sl9BLcXAe
   50N1z2F8rmxzW1JbyAP5WPB+Jph4od9tekyOd659hN5gxFQ6WlpliYerk
   qRJfI0zwYgjtSP3bqhyrgt0a62vQxNop28EQWCHhn2zNRafKBtdXEE+qk
   w==;
X-CSE-ConnectionGUID: PWOADNgkSlCXtCgNxm+jWg==
X-CSE-MsgGUID: em8b4RTjQ7eVqSAbMXqb2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42954821"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="42954821"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 11:10:34 -0700
X-CSE-ConnectionGUID: sYNEJ0WpSg+WwKvIM6mPbg==
X-CSE-MsgGUID: tskyWO/jQ4yo+1XX6elJSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="151341806"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2025 11:10:32 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts43e-0007iG-21;
	Tue, 11 Mar 2025 18:10:28 +0000
Date: Wed, 12 Mar 2025 02:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/1]
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtb:
 /soc/pwrap@1000d000/mt6397/clocks: failed to match any schema with
 compatible: ['mediatek,mt6397-clk']
Message-ID: <202503120214.Se9quMMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   3e7a6629f398fbc9d78216def76bbf6b860ff58f
commit: 66edee0acd72a79606fc8a1fb89166dda54be744 [1/1] arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC sub-node names
config: arm64-randconfig-052-20250310 (https://download.01.org/0day-ci/archive/20250312/202503120214.Se9quMMp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120214.Se9quMMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120214.Se9quMMp-lkp@intel.com/

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
