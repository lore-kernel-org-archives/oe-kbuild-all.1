Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEAE33FE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734793440; cv=none; b=XVHs08adiJ3lmDjXUl4dL4xveKY+TC9fw+gzviTmIkfboLSWRHvqQY4YLNKODpRCTHVThZ8BB5acN/RNaHouruKz/1O5jPQgaV6EU+sCrL/LNkhrGVoA7Z1IZwYXuKvWMwIEz3hTKwH+EynLv3ykYoV+gqt1AFJzPAqgl6/lGMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734793440; c=relaxed/simple;
	bh=6r3O9aWRECkbAKuWcPd8CnkEH0AXEtR1PRd6ZLoq30A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RbTTV3iim+ufRLeddHC2us4btz7PnrleQQhkFMaj9iuTMDVq64kdV+YKfNqy7C8b+0/LHn+/Di6jv8ApnZdtZjrwa+ZY2Uj7mmCjMwCLMmsDUQzj3EkX/vI+LdVYkn32MwGNpz6ppfm9ktLXzrh8NgOCJIfaffReHQbDCFOteg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZh6QXLQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZh6QXLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734793438; x=1766329438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6r3O9aWRECkbAKuWcPd8CnkEH0AXEtR1PRd6ZLoq30A=;
  b=mZh6QXLQF9nbxhBcTKobZqVrx5K6cg9wMWLNaoPiZEphr9Y4UZ4BZrKc
   40rZO1KhZ2lTFI2kDLBFm367rEP1vor56zpgswf8eSoQDFPR9oEBCpIMK
   Hgn/F0VwIaK/BfDXO+nERTkySiYqzyjXZS+O58qahJr623SG/jqFAjnNo
   rbUzLgF1j+lQs88ANvya7uJoSyNisRaRB0qbwOVhxwHEIhfVVvQTIC0bD
   xEnz2VSGQ+hxmqq13syKknrITSwxCOO5zN/+ISR9JYPbeHArtcO0UKOP6
   wVGEmU6JeH7nod8X3Ov8/SIJuMeZk8zBIuBKyjYCTJiaoj3b9g7tc3vzV
   w==;
X-CSE-ConnectionGUID: Qkpmbe7xRni4es7e8nH/BA==
X-CSE-MsgGUID: uIUiWKTATPehMTcMHt1iWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="52849691"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="52849691"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 07:03:57 -0800
X-CSE-ConnectionGUID: T2IRGRxQT3ye80LA6744/A==
X-CSE-MsgGUID: vfRs8HNIS7KIUmGVgFPZiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="98559280"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2024 07:03:49 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP119-0002F5-2H;
	Sat, 21 Dec 2024 15:03:47 +0000
Date: Sat, 21 Dec 2024 23:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 2791/5236]
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pmic: '#address-cells',
 '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202412212322.JTFpRD7X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: beb06b727194f68b0a4b5183e50c88265ce185af [2791/5236] arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC sub-node names
config: arm64-randconfig-051-20241220 (https://download.01.org/0day-ci/archive/20241221/202412212322.JTFpRD7X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412212322.JTFpRD7X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412212322.JTFpRD7X-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1114.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   marvell,wakeup-pin: size (2) error for type uint32
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: power-controller@10001000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: power-controller@10003000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pinctrl@1000b000: 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pmic: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: thermal@1100b000: Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: btmrvl@2: marvell,wakeup-gap-ms: b'\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1114.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   marvell,wakeup-pin: size (2) error for type uint32
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: power-controller@10001000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: power-controller@10003000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pinctrl@1000b000: 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pmic: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: thermal@1100b000: Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: btmrvl@2: marvell,wakeup-gap-ms: b'\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1114.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   marvell,wakeup-pin: size (2) error for type uint32
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: power-controller@10001000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: power-controller@10003000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pinctrl@1000b000: 'aud_i2s2', 'gpio-line-names', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'mmc3', 'mmc3default', 'nor', 'rt5650_irq', 'spi1', 'trackpad_irq', 'usb', 'xxx' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pmic: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/vpu@10020000: failed to match any schema with compatible: ['mediatek,mt8173-vpu']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: intpol-controller@10200620: $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11008000/da9211@68: failed to match any schema with compatible: ['dlg,da9211']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: thermal@1100b000: Unevaluated properties are not allowed ('bank0-supply', 'bank1-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/i2c@11010000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8173-afe-pcm']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: btmrvl@2: marvell,wakeup-gap-ms: b'\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
