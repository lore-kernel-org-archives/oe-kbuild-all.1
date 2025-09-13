Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D0428C87C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 21:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757800072; cv=none; b=iMz47+UQjuWuNFHwgc2kHrSZtEamIdY7vDs5qFXN/PlWRF+1xS15s5DtHC3QTHEbf9PsFsekQ0g0hlpXbSQocoabVzUbWHVosb70M0KDulmLF8rFxEUCI4oili5pYyxy5+24L/4Ll8R0IZfXxWR8rOpfr1a2r3N5rqAiyvEs64M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757800072; c=relaxed/simple;
	bh=QYP4zJ67wj7LRu27BmM8pkW4PoZ1tmcYRZtUgBa1DSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tehb5JXr7HyKp7L0r0DzGwRJfB1c6NqMoPWCsTyIGBYDFelb9fakZVxWEQWbasrhi6gEx7AKlcAMF0Zm5WPRruhtPHsPmF99TcJEY2Fb88QtrDMIotY8zZA3+sVntANBtwRzgLaedRbSwlcIlvTlfj+awdgRG5fOtnGA+0pAQzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Evv9/cNj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Evv9/cNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757800070; x=1789336070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QYP4zJ67wj7LRu27BmM8pkW4PoZ1tmcYRZtUgBa1DSw=;
  b=Evv9/cNjTpQvEE2Q1cS18s0YfHAlHFfktW13/xjrn4aV5F1sTcF76wSD
   g8Se6e7cIMjYq3cx9SZWT8tBtn8BO/XmAxlQMk0hnZtgXjgKyMry/LZX1
   3/94ot6eVYrVSz9JxXN4aOyfVA3kQv247JOxPrC/ePAQF6YdJ31eK6PYT
   31+WreQKkHrUWANB1aJZzq5Hmdik8SAph98CcginB9rpp7yvZvvegnkDL
   LV/UCEL/rF8XHZvgEcwhFewlm3+vT0+hX812Rh+D8BJjM3qkdvUAT4+Qb
   m+aIlNY0MbS2ds3zoNrNL2CeG/rx1yJqPyPM5kSwpj7NU+XCB7e43HQFy
   w==;
X-CSE-ConnectionGUID: uf4YO3mMRuWsv8palPG64A==
X-CSE-MsgGUID: 3CNkbr9gQDy20AvJhSmxrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="63926201"
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="63926201"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 14:47:49 -0700
X-CSE-ConnectionGUID: DNv/bwkeRwibA6g1h8jRng==
X-CSE-MsgGUID: 4JOmq00rRo+tZqg32o4nKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="178298713"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 13 Sep 2025 14:47:49 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxY5s-0001t8-2j;
	Sat, 13 Sep 2025 21:47:42 +0000
Date: Sun, 14 Sep 2025 05:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 20/20]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12288.dtb:
 trackpad@15 (hid-over-i2c): 'vcc-supply' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202509140511.NuXIzGD0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   9666592a44cc1272900debbbfacd9761b05c337a
commit: 9666592a44cc1272900debbbfacd9761b05c337a [20/20] CHROMIUM: arm64: dts: mt8189-skywalker-tarkin: Update touchpad DTS for tarkin
config: arm64-randconfig-051-20250913 (https://download.01.org/0day-ci/archive/20250914/202509140511.NuXIzGD0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509140511.NuXIzGD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509140511.NuXIzGD0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12288.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12288.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12288.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12288.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12288.dtb: trackpad@15 (hid-over-i2c): 'vcc-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12288.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12288.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12288.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: trackpad@15 (hid-over-i2c): 'vcc-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4096.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4096.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4096.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4096.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4096.dtb: trackpad@15 (hid-over-i2c): 'vcc-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4096.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4096.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4096.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4097.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4097.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4097.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4097.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4097.dtb: trackpad@15 (hid-over-i2c): 'vcc-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4097.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4097.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku4097.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8192.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8192.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8192.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8192.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8192.dtb: trackpad@15 (hid-over-i2c): 'vcc-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8192.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8192.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8192.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8193.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8193.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8193.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8193.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8193.dtb: trackpad@15 (hid-over-i2c): 'vcc-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8193.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8193.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8193.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected
--
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/efuse@11f10000: failed to match any schema with compatible: ['mediatek,mt8189-efuse', 'mediatek,efuse']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: trackpad@15 (hid-over-i2c): 'vcc-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/syscon@11f32000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-en', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: gpu@13000000 (mediatek,mt8189-mali): 'power-model@0', 'power-model@1', 'supply-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: gpu@13000000 (mediatek,mt8189-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-mali', 'arm,mali-valhall-jm'] is too short
   	'mediatek,mt8189-mali' is not one of ['amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'rockchip,px30-mali', 'rockchip,rk3568-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8195-mali']
   	'mediatek,mt8189-mali' is not one of ['mediatek,mt8192-mali']
   	'arm,mali-bifrost' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
