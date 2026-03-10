Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0780221DAD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 04:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773118662; cv=none; b=jYDaAlLUK8RtZXUCgYl46bPTU3rY1DgcyhNr8gpxmu3CK23NOcxIcIV7Kek68ahPmw1JXwigg5GB5n5maGlLTzNU76E+SGGVm7LjGXDulSaN/I+1u6geKigbQjoOAXsgAUwK6lPTM3ieUap5b2vRckbFkBMDMwwwQPZIne0t6pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773118662; c=relaxed/simple;
	bh=suJOxVFCFjvqycinSe35cHA9rLWB2GFvnwISKtBLzQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uo8ineEoKxHjHgyPLyZHJBzFUU7onHZQmf3AohFOaEh1XyJzmbH0tr9n/8qezTGwCVpcLhB4MPNnf92b7f6zM8AHYHWxyRaTHLzPomKVFvz4HKZLee0wDaNFBiAZ7kG5SmINMZiFEcJwrUFEOOfmFSBXj1NgkVLkZZJ4PJt/IuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEybMdat; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEybMdat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773118660; x=1804654660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=suJOxVFCFjvqycinSe35cHA9rLWB2GFvnwISKtBLzQc=;
  b=GEybMdatZGw2dPOt/iz9l9dlLnDOxQyypxjPfR/iJHbSn8M8zEdlM3T/
   cjodWDDz8F6LP7p8TjEuMQi5Gr2MmWsbE7f582sFukqHe+/XWVqSVn5Vq
   warNl738saGDnyUsVMNbV7t5+3N3W4H9MQ9dAzuu/Xmg+GbVDu4heaPEU
   G978e9vKvvi0jr1JgOKucRD4Lk37SCS8P4c38UFFdVsYXovQoKVNeKTV4
   SGc4yseXBwGwPar10o/On8TJ0JNIc5Ejwx48Ulik49hLnRGO9rkSpzAbd
   ivRgMrz2spjsdEjfh8TrGlHGMsQi3tW8W4y6+gHyVAf5Nj2zTfBA/lVc4
   w==;
X-CSE-ConnectionGUID: lMeGEnArR4+DSQsQFN/40Q==
X-CSE-MsgGUID: 7gwIUcepR9uvJENslVXQSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="77761750"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="77761750"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 21:57:40 -0700
X-CSE-ConnectionGUID: MHk+hxezSfGt1SV/Ax0Bdw==
X-CSE-MsgGUID: +EBYBo5ZQJi/S/Cg73HNwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="222609437"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 09 Mar 2026 21:57:37 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzp9y-0000000030j-3IiY;
	Tue, 10 Mar 2026 04:57:34 +0000
Date: Tue, 10 Mar 2026 05:57:10 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 62/64]
 =?us-ascii?Q?arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd?=
 =?us-ascii?Q?-nand-1pci2lane.dtb:?= /: failed to match any schema with
 compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
Message-ID: <202603100559.02bDNA6P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   027868526273f2766cd140b0fb54609225da2cf9
commit: 7fc15d2dcacb4ea21ce9f226a70c4fa241363519 [62/64] arm64: dts: mediatek: apply mt7987 pcie overlays on buildtime
config: arm64-randconfig-2054-20260307 (https://download.01.org/0day-ci/archive/20260310/202603100559.02bDNA6P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100559.02bDNA6P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100559.02bDNA6P-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: / (bananapi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: / (bananapi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: / (bananapi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
--
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /reserved-memory/wmcpu-reserved@50000000: failed to match any schema with compatible: ['mediatek,wmcpu-reserved']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: soc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/hwver@8000000: failed to match any schema with compatible: ['mediatek,hwver', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/infra_bus_prot@1000310c: failed to match any schema with compatible: ['mediatek,infracfg_ao_bus_hang_prot']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible: ['mediatek,mt7987-pinctrl']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/boottrap@1001f6f0: failed to match any schema with compatible: ['mediatek,boottrap']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/trng@1020f000: failed to match any schema with compatible: ['mediatek,mt7987-rng']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/pwm@10048000: failed to match any schema with compatible: ['mediatek,mt7987-pwm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: pca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: pca9545@70 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: eeprom@50 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: spi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/spi@11007800: failed to match any schema with compatible: ['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: spi@11008800 (mediatek,mt7987-spi-single): compatible: 'oneOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/spi@11008800: failed to match any schema with compatible: ['mediatek,mt7987-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: spi@11009800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], [22, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/wed: failed to match any schema with compatible: ['mediatek,wed']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/wed0@15010000: failed to match any schema with compatible: ['mediatek,wed0']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['mediatek,wed-wdma']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: pcie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: pcie@11290000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/pcie@11290000: failed to match any schema with compatible: ['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: /soc/topmisc@10021000: failed to match any schema with compatible: ['mediatek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
--
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: / (bananapi,bpi-r4-lite): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: / (bananapi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: / (bananapi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
--
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /reserved-memory/wmcpu-reserved@50000000: failed to match any schema with compatible: ['mediatek,wmcpu-reserved']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: soc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/hwver@8000000: failed to match any schema with compatible: ['mediatek,hwver', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/infra_bus_prot@1000310c: failed to match any schema with compatible: ['mediatek,infracfg_ao_bus_hang_prot']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible: ['mediatek,mt7987-pinctrl']
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/boottrap@1001f6f0: failed to match any schema with compatible: ['mediatek,boottrap']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/trng@1020f000: failed to match any schema with compatible: ['mediatek,mt7987-rng']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/pwm@10048000: failed to match any schema with compatible: ['mediatek,mt7987-pwm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: pca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: pca9545@70 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: eeprom@50 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: spi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/spi@11007800: failed to match any schema with compatible: ['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: spi@11008800 (mediatek,mt7987-spi-single): compatible: 'oneOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/spi@11008800: failed to match any schema with compatible: ['mediatek,mt7987-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: spi@11009800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_clk', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [22, 47], [22, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/wed: failed to match any schema with compatible: ['mediatek,wed']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/wed0@15010000: failed to match any schema with compatible: ['mediatek,wed0']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['mediatek,wed-wdma']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: pcie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: pcie@11290000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: /soc/pcie@11290000: failed to match any schema with compatible: ['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: pcie@0,0: 'device_type' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
