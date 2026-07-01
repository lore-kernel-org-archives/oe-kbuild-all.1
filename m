Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7824A3403
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 17:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927079; cv=none; b=rvqSTXUavMiaMqabCbGiUm3NDgTKJwvjBgz4zh1Qog57CXKYK8yHCEEuDTqrQ/+2ILkancImWHXaiPPQLQlGFVp6gFOnMx68VIspJ8qK2Gz+j4y9iPRg8oD+ruoUSwgXdhBkwKaf6JgDvS/jm6AiuXg6nKAa5iPe5Vajw/PkaWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927079; c=relaxed/simple;
	bh=0u2D52R8Gg4KzJCMIKTOGTYGMubURAzcoUZAdt4G34k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rDLk6GaqeOlSPgOjMpBb6+f3b8+3BFocCzy9sG/5PGgWFETN3BvsK+zfS5b8JZMcNPITFXZzOc+ygbNAKkwASFjIw+4bIOBfE6cAxZcNuKiNzV7PpDKtyw2SMMTfjKRvhymzFtnkamLZyhpphlZAeYNtSap+EsrByvNhFLRRYPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHHGYVmW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHHGYVmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782927075; x=1814463075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0u2D52R8Gg4KzJCMIKTOGTYGMubURAzcoUZAdt4G34k=;
  b=YHHGYVmW6eKy5RMn27exvgFcIbmh/2Dxgn0RucPVtOINMPelMYNeAt+i
   IeyU4J5bgziJJWwcR90JbCGJiBLd72OMexlLGIOp3p4uHjhQCLMnCXf1w
   kjzxOG/mUUWuAVl9SMD3ql+fCkEt8YbNHOXGntui8g2etv7dZXwZo+xl+
   0/naOfwWOJlX5MhUIF0srXsSBmjMfu+CD47zPGNs+NYblQUqcFU2lFOLC
   /uFbEqubRez/ChZR9l+nmQeiQawkLU/VZqdcYIAe6dHYFOunNyvLeF0fE
   gTgA5rIjS+UOFJOlZDit1A8JhVw4193gu7bnTyaMjt7k5y6a06iQ7pde9
   Q==;
X-CSE-ConnectionGUID: jHh0eCXXRMqJtIdUXqZU5A==
X-CSE-MsgGUID: ZSlkQiHPSt6XPI7PhUS2jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83542926"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83542926"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 10:31:14 -0700
X-CSE-ConnectionGUID: AVy7EQo0QU6TRD64OYhfOA==
X-CSE-MsgGUID: KEi+nLFvRx++dD+aLO/YTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="250909505"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 01 Jul 2026 10:31:14 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weymF-000000000qL-2P5Z;
	Wed, 01 Jul 2026 17:31:11 +0000
Date: Wed, 01 Jul 2026 19:30:14 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 67/160]
 =?us-ascii?Q?arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd?=
 =?us-ascii?Q?-nand-1pci2lane.dtb:?= /: failed to match any schema with
 compatible: ['bananapi,bpi-r4-lite', 'mediatek,mt7987a']
Message-ID: <202607011903.BftHlQZF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: 2ca5383eca3ddacee7d804a620e218046915e5bf [67/160] arm64: dts: mediatek: apply mt7987 pcie overlays on buildtime
config: arm64-randconfig-2051-20260630 (https://download.01.org/0day-ci/archive/20260701/202607011903.BftHlQZF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011903.BftHlQZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011903.BftHlQZF-lkp@intel.com/

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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: trng@1020f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: trng@1020f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' does not match '^rng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2lane.dtb: trng@1020f000 (mediatek,mt7987-rng): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,mt7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,mt7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
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
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: trng@1020f000 (mediatek,mt7987-rng): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: trng@1020f000 (mediatek,mt7987-rng): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: trng@1020f000 (mediatek,mt7987-rng): $nodename:0: 'trng@1020f000' does not match '^rng(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1lane.dtb: trng@1020f000 (mediatek,mt7987-rng): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7987-rng'] is too short
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7623-rng', 'mediatek,mt7981-rng']
   	'mediatek,mt7987-rng' is not one of ['mediatek,mt7622-rng', 'mediatek,mt7629-rng', 'mediatek,mt7986-rng', 'mediatek,mt8365-rng', 'mediatek,mt8516-rng']
   	from schema $id: http://devicetree.org/schemas/rng/mtk-rng.yaml
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
