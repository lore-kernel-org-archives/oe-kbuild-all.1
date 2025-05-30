Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED96258A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748623722; cv=none; b=TQ1a8ZVhT/xkNUQOUxbM/oNztH/LD3sv9keGVxqjDcS/sBR/sV9p60yLbM+4EBTRu52qEEt9GDfZBI1niE32CA1I1AHzvj4fPgMSaMlCvn3eTWNVW923eLSwYB2tLjUb1QLrrlR6ei4BwswfZuL8z3HDh6PBTfO0YrosXzNXKso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748623722; c=relaxed/simple;
	bh=I+gVi8XKQxw/kLWOYbE8khcONLy0cFkC9mX7Jp2YqZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bi++4JwrvrbmgPEvj4SkkQrCbTSp5J48iiDejpB9YNQpnxeF2XXGWPHhhsHkOy4Ybhy4sTRW8mr+UK30gIzVlPoDKqcEsMWAxB2Oif5kNDyNM1Ttkpq1jaKBup1HBzAN8nkdWyJLm++9hfU5zFOPGwPuro1V5cNgY78PzXx+j/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQP/49yH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQP/49yH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748623720; x=1780159720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+gVi8XKQxw/kLWOYbE8khcONLy0cFkC9mX7Jp2YqZM=;
  b=VQP/49yHF3oD4JxMQuytaZOgKBbpsg7m2ezcStvaBhHoXSjliFhdG9xg
   VPZGYnvMHiY+rojg/iGvDkXNlHr5PwgjtvZ5BYUv5Ey/9Lxy/U9C+qT+H
   P53CC/QWXnMfFXXxdL1Fo0BAZfy0Nmu5tw3jlFB0YeJdpK2VqC1sWDxsu
   bIv80iYfGIRIuwEE6pG8dUjzi1RsFyrVWbH9cRD+W4mMCPuT8n9kFKZYt
   Wq49DmGHzv212dVAw2ZvEEnzxM0wirasXVy5KTtfXI6z5BQ2/y7HUw0mT
   ZVerC1QARS72CXs/hwVO2e8ldzIXhUirLS3QeHRG0zMcgWjaWtV1Z5G9N
   Q==;
X-CSE-ConnectionGUID: JqNQs3ARTsyMDvpkO115rA==
X-CSE-MsgGUID: 72eCpJyWQ1mZ8vx1zQwepw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68146883"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68146883"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 09:48:39 -0700
X-CSE-ConnectionGUID: uLJ2j/iVTNmNYc93zFxA2A==
X-CSE-MsgGUID: CND+FUCET/irFkgMR67jVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174802924"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 09:48:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL2uI-000XoS-3B;
	Fri, 30 May 2025 16:48:34 +0000
Date: Sat, 31 May 2025 00:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator
 (mediatek,mt6397-regulator): buck_vpca15: Unevaluated properties are not
 allowed ('regulator-compatible' was unexpected)
Message-ID: <202505310042.pJ66nGWB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   e8191d4b0877b5e3025a126ac1d08756a322d055
commit: 1b4ec561b47d806eb0752a73837c2248bf622c06 [2/2] regulator: dt-bindings: mediatek,mt6397-regulator: convert to YAML
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250531/202505310042.pJ66nGWB-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310042.pJ66nGWB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310042.pJ66nGWB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1137.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: power-controller@10001000 (mediatek,mt8173-infracfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: power-controller@10003000 (mediatek,mt8173-pericfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vcore: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vgpu: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vdrm: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vio18: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vcama: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmc: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmch: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vemc3v3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp2: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp4: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp5: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp6: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vibr: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vtcxo: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_va28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vio28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vusb: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/pmic/mt6397rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: intpol-controller@10200620 (mediatek,mt8173-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/mmc@11260000/btmrvl@2: failed to match any schema with compatible: ['marvell,sd8897-bt']
--
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1137.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: power-controller@10001000 (mediatek,mt8173-infracfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: power-controller@10003000 (mediatek,mt8173-pericfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vcore: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vgpu: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vdrm: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vio18: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vcama: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmc: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmch: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vemc3v3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp2: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp4: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp5: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp6: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vibr: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vtcxo: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_va28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vio28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vusb: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic/mt6397rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: intpol-controller@10200620 (mediatek,mt8173-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1137.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: power-controller@10001000 (mediatek,mt8173-infracfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: power-controller@10003000 (mediatek,mt8173-pericfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vcore: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vgpu: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vdrm: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vio18: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vcama: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmc: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmch: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vemc3v3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp2: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp4: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp5: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp6: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vibr: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vtcxo: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_va28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vio28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vusb: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic/mt6397rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: intpol-controller@10200620 (mediatek,mt8173-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
--
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: power-controller@10003000 (mediatek,mt8173-pericfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'spi0', 'usb_iddig_pull_down', 'usb_iddig_pull_up', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pwrap@1000d000 (mediatek,mt8173-pwrap): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vcore: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vgpu: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vdrm: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vio18: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vcama: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmc: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmch: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vemc3v3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp2: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp4: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp5: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp6: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vibr: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vtcxo: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_va28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vio28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vusb: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: intpol-controller@10200620 (mediatek,mt8173-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
