Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3851135950
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 04:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748664994; cv=none; b=uSDwHIbxxB7NiOP79lU7vRUL/jfS6fCq96dqofIk9P4Ho16MJUg0Bu/xOumE73trkhbabGhjfDVNWaNrE7be2cpFjCvHzf44J3/xMaE3cygj7VWRwV8+pdWF7CO4xKuKs4J1TxRJGEOTaq8p5QcIefiFkRiP9DWqVN/8nh02cyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748664994; c=relaxed/simple;
	bh=Fm9CbI8LUJogTeTjJyYQ0PaOaJrPf0yttyPOl/mLv+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+Uvw2po4qXwRDGqc4PtdPxHvk9k59nbgzbANQBE1hF2GUCIkLt2n+m86A4byGYzrglBvbhADzrlqKR1SA/eTg6h5nejS9p8o44bp/WyIjk/IRYhGETjI6p+0Pral56Ndw+NgSkBjP5f23yk6IjGCVJ1hO1iP/9hN7B8jXUwxVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfUZeKxt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfUZeKxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748664992; x=1780200992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fm9CbI8LUJogTeTjJyYQ0PaOaJrPf0yttyPOl/mLv+Y=;
  b=bfUZeKxt/LZmI/J7WdASIxDWoKgHQQLCk8E7D9DZYir9ybS/VQ0HIemI
   Ut26N7paCXaxh5+slQIV24RprJoL4WuCIhUxB74cyQ3M901LuQ93xGo1W
   XXCL+4xrrEScCoOTzraX7yUgmzlBoDL2FyM+qFEyTGmZDDVrE0ZpbMVeP
   aMrcahgjqRNfFmZBwDA0BrfcMf20yg2kk1dCem8w8vp84bA1yY1/mwAEm
   NpYzSEVFYQ/ZoLwjK7jMXxEPas30wn7enSVbpvpU2xpOotOcQnDxQ4uLu
   vAD/rT+W72lf20q81h2D2OKSfIt+96noajoRbaSgOm+a++Ae6TC6sZ5Fj
   Q==;
X-CSE-ConnectionGUID: +Ymlzit3T7ms57Gn9hP56A==
X-CSE-MsgGUID: 3Ik86BzFT2mN3z2d7r5jsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61431127"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="61431127"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 21:16:31 -0700
X-CSE-ConnectionGUID: myQGbj45SIafc6ta60JbKg==
X-CSE-MsgGUID: Z/5wbBeJSmC3NVYcZi021w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="167234429"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2025 21:16:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLDe0-000YBW-0m;
	Sat, 31 May 2025 04:16:28 +0000
Date: Sat, 31 May 2025 12:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator
 (mediatek,mt6397-regulator): ldo_vgp5: Unevaluated properties are not
 allowed ('regulator-compatible' was unexpected)
Message-ID: <202505311201.tNSTdvJy-lkp@intel.com>
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
config: arm64-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250531/202505311201.tNSTdvJy-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311201.tNSTdvJy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505311201.tNSTdvJy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vemc3v3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp2: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp4: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp5: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp6: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vibr: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vtcxo: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_va28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vio28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vusb: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/pwrap@1000d000/pmic/mt6397rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: intpol-controller@10200620 (mediatek,mt8173-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: power-controller@10003000 (mediatek,mt8173-pericfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vcore: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vgpu: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vdrm: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vio18: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vcama: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmc: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmch: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vemc3v3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp2: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp4: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp5: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp6: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vibr: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vtcxo: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_va28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vio28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vusb: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/pwrap@1000d000/pmic/mt6397rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: intpol-controller@10200620 (mediatek,mt8173-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
--
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: power-controller@10001000 (mediatek,mt8173-infracfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: power-controller@10003000 (mediatek,mt8173-pericfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic/mt6397clock: failed to match any schema with compatible: ['mediatek,mt6397-clk']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vcore: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vgpu: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vdrm: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vio18: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vcama: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmc: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmch: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vemc3v3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp2: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp4: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp5: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp6: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vibr: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vtcxo: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_va28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vio28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vusb: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/pwrap@1000d000/pmic/mt6397rtc: failed to match any schema with compatible: ['mediatek,mt6397-rtc']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: intpol-controller@10200620 (mediatek,mt8173-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: thermal@1100b000 (mediatek,mt8173-thermal): Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: power-controller@10001000 (mediatek,mt8173-infracfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: power-controller@10003000 (mediatek,mt8173-pericfg): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'spi0', 'usb_iddig_pull_down', 'usb_iddig_pull_up', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pwrap@1000d000 (mediatek,mt8173-pwrap): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vpca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vsramca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vcore: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vgpu: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vdrm: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): buck_vio18: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vcama: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmc: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vmch: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vemc3v3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp2: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp4: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp5: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vgp6: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vibr: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vtcxo: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_va28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vio28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: mt6397regulator (mediatek,mt6397-regulator): ldo_vusb: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: intpol-controller@10200620 (mediatek,mt8173-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
