Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B6648B360
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910671; cv=none; b=c88/9ZJCtyALZJgRJpT+ooooEn0W/OmaWfgEk0YUhsHUouUYX5bXbhsFGcZlK99rmfBTBNpNZFZaG3sLM6HTeLYrf2oMd27tRNHiaRhf29DwW4xgJIvvyEfsEqRCC3xAbEoU0NLFxKi4Fs6B0EqHz0HPtPLuHiz2Jdp2tG2ALJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910671; c=relaxed/simple;
	bh=U7bHs1WPiIT/ATI7jFTETiA6lh0e4Do3q+nai9Vtxps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t3nc273uBrx9N/en/F1lY0N0RvbB0PC6ow6JfPBLdZcs6Me1sWrmZo826/6fUqAUwaaGm5gBLwhQ1kbiXQ4gYqIfkkv8wngsb7LkH0JTQlvKfVnK3DdZn31HJZ2/cmRp3bcjYAsyC0UryHkbHLG6NzMrxPcQiAAGhtsGcPzWEpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jO+aTlFG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jO+aTlFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782910669; x=1814446669;
  h=date:from:to:cc:subject:message-id;
  bh=U7bHs1WPiIT/ATI7jFTETiA6lh0e4Do3q+nai9Vtxps=;
  b=jO+aTlFGuXSZVH9K+ph3a4Fz7IOWFUYsm+G8ftUmmJeAb95qBmEzNNzK
   E7uihAX2G/7SNm/+TlLXiAW5pMXFTr7ak26XalHOLFXrvl8S4YD/cDT9B
   hHFy6AhU8cjsBOQH1Sj+UElzjlfSUgw2I0qPxhZVud8C4AFmTBxwjy0g2
   pEWaDCBHld4wH9Piw100Z6X9Z3gRxQwyUrDAompVY0se+L1SRqZhmCZJ2
   gnnevPVdI7y0w0L47ruXR2kQNs2O7RBBLURwAta6cbmvyJHgEEhVUvoTM
   FrhKoXq2pflY58OmRlk3BrKbxLlgzPE7ZUIdMgYvOW6xhLDCHPb1LvUac
   A==;
X-CSE-ConnectionGUID: /9MW3pFrQRSEEnkLyW70jA==
X-CSE-MsgGUID: L0TjLMJSQXeWrwdR8wQXmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="86188031"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="86188031"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:57:48 -0700
X-CSE-ConnectionGUID: RUyBYFS2TuGYyLFVl37PDg==
X-CSE-MsgGUID: yOaRJvYfRpWGYT/e0r0epQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="275774768"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2026 05:57:46 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weuVb-000000000mh-44rE;
	Wed, 01 Jul 2026 12:57:43 +0000
Date: Wed, 01 Jul 2026 14:57:24 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 66/160]
 arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /:
 failed to match any schema with compatible: ['bananapi,bpi-r4-lite',
 'mediatek,mt7987a']
Message-ID: <202607011431.hnpiHc8f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: 010b82dfd8362f9e5b41df353638b717e6e84adb [66/160] arm64: dts: build overlays for bpi-r4-lite emmc/sd + nand/nor
config: arm64-randconfig-2051-20260630 (https://download.01.org/0day-ci/archive/20260701/202607011431.hnpiHc8f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011431.hnpiHc8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011431.hnpiHc8f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: / (bananapi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: / (bananapi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: / (bananapi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
--
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /reserved-memory/wmcpu-reserved@50000000: failed to match any schema with compatible: ['mediatek,wmcpu-reserved']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: soc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/hwver@8000000: failed to match any schema with compatible: ['mediatek,hwver', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/infra_bus_prot@1000310c: failed to match any schema with compatible: ['mediatek,infracfg_ao_bus_hang_prot']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible: ['mediatek,mt7987-pinctrl']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/boottrap@1001f6f0: failed to match any schema with compatible: ['mediatek,boottrap']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: trng@1020f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: trng@1020f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' does not match '^rng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: trng@1020f000 (mediatek,mt7987-rng): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,mt7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,mt7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/pwm@10048000: failed to match any schema with compatible: ['mediatek,mt7987-pwm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: pca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: pca9545@70 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: eeprom@50 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: spi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/spi@11007800: failed to match any schema with compatible: ['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: spi@11008800 (mediatek,mt7987-spi-single): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-spi-single', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/spi@11008800: failed to match any schema with compatible: ['mediatek,mt7987-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: spi@11009800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
--
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: mmc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], [22, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/wed: failed to match any schema with compatible: ['mediatek,wed']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/wed0@15010000: failed to match any schema with compatible: ['mediatek,wed0']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['mediatek,wed-wdma']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: pcie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: pcie@11290000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/pcie@11290000: failed to match any schema with compatible: ['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nand.dtb: /soc/topmisc@10021000: failed to match any schema with compatible: ['mediatek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
--
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: / (bananapi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: / (bananapi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: / (bananapi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
--
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /reserved-memory/wmcpu-reserved@50000000: failed to match any schema with compatible: ['mediatek,wmcpu-reserved']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: soc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/hwver@8000000: failed to match any schema with compatible: ['mediatek,hwver', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/infra_bus_prot@1000310c: failed to match any schema with compatible: ['mediatek,infracfg_ao_bus_hang_prot']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible: ['mediatek,mt7987-pinctrl']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/boottrap@1001f6f0: failed to match any schema with compatible: ['mediatek,boottrap']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: trng@1020f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: trng@1020f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' does not match '^rng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: trng@1020f000 (mediatek,mt7987-rng): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,mt7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,mt7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/pwm@10048000: failed to match any schema with compatible: ['mediatek,mt7987-pwm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: pca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: pca9545@70 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: eeprom@50 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: spi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/spi@11007800: failed to match any schema with compatible: ['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: spi@11008800 (mediatek,mt7987-spi-single): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-spi-single', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/spi@11008800: failed to match any schema with compatible: ['mediatek,mt7987-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: spi@11009800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
--
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: mmc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], [22, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/wed: failed to match any schema with compatible: ['mediatek,wed']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/wed0@15010000: failed to match any schema with compatible: ['mediatek,wed0']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['mediatek,wed-wdma']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: pcie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: pcie@11290000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/pcie@11290000: failed to match any schema with compatible: ['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-emmc-nor.dtb: /soc/topmisc@10021000: failed to match any schema with compatible: ['mediatek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
--
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: / (bananapi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: / (bananapi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: / (bananapi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
--
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /reserved-memory/wmcpu-reserved@50000000: failed to match any schema with compatible: ['mediatek,wmcpu-reserved']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: soc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/hwver@8000000: failed to match any schema with compatible: ['mediatek,hwver', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/infra_bus_prot@1000310c: failed to match any schema with compatible: ['mediatek,infracfg_ao_bus_hang_prot']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible: ['mediatek,mt7987-pinctrl']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/boottrap@1001f6f0: failed to match any schema with compatible: ['mediatek,boottrap']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: trng@1020f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: trng@1020f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' does not match '^rng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: trng@1020f000 (mediatek,mt7987-rng): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,mt7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,mt7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/pwm@10048000: failed to match any schema with compatible: ['mediatek,mt7987-pwm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: pca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: pca9545@70 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: eeprom@50 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: spi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/spi@11007800: failed to match any schema with compatible: ['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: spi@11008800 (mediatek,mt7987-spi-single): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-spi-single', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/spi@11008800: failed to match any schema with compatible: ['mediatek,mt7987-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: spi@11009800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
--
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: mmc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], [22, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/wed: failed to match any schema with compatible: ['mediatek,wed']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/wed0@15010000: failed to match any schema with compatible: ['mediatek,wed0']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['mediatek,wed-wdma']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: pcie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: pcie@11290000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/pcie@11290000: failed to match any schema with compatible: ['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand.dtb: /soc/topmisc@10021000: failed to match any schema with compatible: ['mediatek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
--
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: / (bananapi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: / (bananapi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: / (bananapi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
--
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /reserved-memory/wmcpu-reserved@50000000: failed to match any schema with compatible: ['mediatek,wmcpu-reserved']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: soc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/hwver@8000000: failed to match any schema with compatible: ['mediatek,hwver', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/infra_bus_prot@1000310c: failed to match any schema with compatible: ['mediatek,infracfg_ao_bus_hang_prot']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible: ['mediatek,mt7987-pinctrl']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/boottrap@1001f6f0: failed to match any schema with compatible: ['mediatek,boottrap']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: trng@1020f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: trng@1020f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' does not match '^rng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: trng@1020f000 (mediatek,mt7987-rng): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,mt7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,mt7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/pwm@10048000: failed to match any schema with compatible: ['mediatek,mt7987-pwm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: pca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: pca9545@70 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: eeprom@50 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: spi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/spi@11007800: failed to match any schema with compatible: ['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: spi@11008800 (mediatek,mt7987-spi-single): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-spi-single', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/spi@11008800: failed to match any schema with compatible: ['mediatek,mt7987-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: spi@11009800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
--
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: mmc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], [22, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/wed: failed to match any schema with compatible: ['mediatek,wed']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/wed0@15010000: failed to match any schema with compatible: ['mediatek,wed0']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['mediatek,wed-wdma']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: pcie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: pcie@11290000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/pcie@11290000: failed to match any schema with compatible: ['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nor.dtb: /soc/topmisc@10021000: failed to match any schema with compatible: ['mediatek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
