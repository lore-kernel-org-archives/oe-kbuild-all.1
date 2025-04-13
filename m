Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389DC4A18
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Apr 2025 23:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744587742; cv=none; b=A6HOCOUczzgEwFHbjhytZvanQB60Jw13FWA2wYhEAjUfotF6OobTblj2FVcU6HbynK9BmR59MBdf+ifk2sXb3fWyn9W0eMbU3zpVkbQG4b/PJb+wBFvmNI+bpzqy+Xl7xaKWKING8G3eZ9dVDfAlOhmkWaop7dx8/ftvBMWpe1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744587742; c=relaxed/simple;
	bh=De8sWY82cUutPSfnHFdzIi9lkcMeW5a5h63vtUXZwz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLXwqMpnXgP8YZ0vvpyYSPt865m44wrbm5ExKUOlUEE+lCXlArFSqLuz38rW5gtxhZEIfWkRXUyCeEgZL7+YnQDkvyHq5ZZEQKPQNKeLM8e/WJLLNZ4jWvxsk4v8WbcPhfXnYo9cDRS8Lz7xCCaPbmdqmsMglse1y1nmxHEkdnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVZ6mj4k; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVZ6mj4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744587740; x=1776123740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=De8sWY82cUutPSfnHFdzIi9lkcMeW5a5h63vtUXZwz8=;
  b=WVZ6mj4kxWKLBFODBMyDATq32Cgn9G4iyW40oZmYHZA5pQFAGBQzorNh
   j+uO71ELlsp0qXiCcoFtZ6/VnMHDMAe2WZINTUwcqPXupq0uhraT89Gow
   X6W77xf2+uafRjC1h6TB8wSZMm/67RL74lXiEUd+roOuYGLSp6Cej7q27
   1mZzpC2Pz52aWuHT06Wqo3PKJ8sQ0LkbwhIBBrjQtz7D8RqvGutiePb+q
   +vguekHXT+cPzlhdLuavSIiGiwmGFk0rgLjqFEqKBr5rLvIra5NOto+mz
   v6xIrKsuVQJDRxoxrQdGy4DlRiqJQfAtDcGkzEOqLN89Sml8hQEE2FnHX
   w==;
X-CSE-ConnectionGUID: ZIUwEt9hS7GD3nQVERNTig==
X-CSE-MsgGUID: 3PoWu1JiS1eB00gq7Rjb5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45756008"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="45756008"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 16:42:18 -0700
X-CSE-ConnectionGUID: YO2kevK3TJ2+SjN5KWUXgA==
X-CSE-MsgGUID: 5rkZCV40RMCFvnh2VAONnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="160623757"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Apr 2025 16:42:15 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u46xo-000Cy6-2d;
	Sun, 13 Apr 2025 23:42:12 +0000
Date: Mon, 14 Apr 2025 07:41:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-next-wip 6649/6651]
 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/adc@1100d000:
 failed to match any schema with compatible: ['mediatek,mt7981-auxadc',
 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc']
Message-ID: <202504140754.fc5H7RlO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-next-wip
head:   c47e22e7e204c4e69cb6eeeb8588809af178bc8c
commit: 9ba55ae5b49f644543d6d8d6bc93917672f0a2b0 [6649/6651] complete mt7981 dts and add GL.iNet MT3000
config: arm64-randconfig-051-20250413 (https://download.01.org/0day-ci/archive/20250414/202504140754.fc5H7RlO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504140754.fc5H7RlO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140754.fc5H7RlO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: adc@1100d000 (mediatek,mt7981-auxadc): clocks: [[3, 48], [3, 49]] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc'] is too long
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	'mediatek,mt8173-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/adc@1100d000: failed to match any schema with compatible: ['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc']
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: pi@1100a000 (mediatek,mt7981-spi-ipm): $nodename:0: 'pi@1100a000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: pcie@11280000 (mediatek,mt7981-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie'] is too long
   	'mediatek,mt7981-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie']
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: wed@15010000 (mediatek,mt7981-wed): 'mediatek,wo-cpuboot', 'mediatek,wo-dlm', 'mediatek,wo-ilm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: wed@15010000 (mediatek,mt7981-wed): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: wed@15010000 (mediatek,mt7981-wed): compatible: ['mediatek,mt7981-wed', 'mediatek,mt7986-wed', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: wed@15010000 (mediatek,mt7981-wed): memory-region: [[10], [11]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: wed@15010000 (mediatek,mt7981-wed): memory-region-names:1: 'wo-ilm' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: ethernet@15100000 (mediatek,mt7981-eth): clock-names:11: 'sgmii2_cdr_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: ethernet@15100000 (mediatek,mt7981-eth): clock-names:12: 'sgmii2_cdr_fb' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: ethernet@15100000 (mediatek,mt7981-eth): mediatek,infracfg: False schema does not allow [[19]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: ethernet@15100000 (mediatek,mt7981-eth): mediatek,wed: [[20]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): leds: 'int-gbe-phy-led0@0', 'int-gbe-phy-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['mediatek,wed-wdma']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/ap2woccif@151a5000: failed to match any schema with compatible: ['mediatek,ap2woccif']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/syscon@151e8000: failed to match any schema with compatible: ['mediatek,mt7986-wo-dlm', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/syscon@151e0000: failed to match any schema with compatible: ['mediatek,mt7986-wo-ilm', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/syscon@15194000: failed to match any schema with compatible: ['mediatek,mt7986-wo-cpuboot', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: syscon@10060000 (mediatek,mt7981-sgmiisys_0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-sgmiisys_0', 'mediatek,mt7986-sgmiisys_0', 'syscon'] is too long
   	'mediatek,mt7981-sgmiisys_0' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: syscon@10070000 (mediatek,mt7981-sgmiisys_1): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_1', 'syscon'] is too long
   	'mediatek,mt7981-sgmiisys_1' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7981-topmisc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: snfi@11005000 (mediatek,mt7986-snand): $nodename:0: 'snfi@11005000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: snfi@11005000 (mediatek,mt7986-snand): clock-names:0: 'nfi_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: snfi@11005000 (mediatek,mt7986-snand): clock-names:1: 'pad_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: snfi@11005000 (mediatek,mt7986-snand): reg: [[0, 285233152, 0, 4096], [0, 285237248, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: mmc@11230000 (mediatek,mt7986-mmc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-mmc', 'mediatek,mt7981-mmc'] is too long
   	'mediatek,mt7623-mmc' was expected
   	'mediatek,mt7986-mmc' is not one of ['mediatek,mt8186-mmc', 'mediatek,mt8188-mmc', 'mediatek,mt8192-mmc', 'mediatek,mt8195-mmc', 'mediatek,mt8365-mmc']
   	'mediatek,mt2701-mmc' was expected
   	'mediatek,mt8183-mmc' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/mmc@11230000: failed to match any schema with compatible: ['mediatek,mt7986-mmc', 'mediatek,mt7981-mmc']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/wed_pcie@10003000: failed to match any schema with compatible: ['mediatek,wed_pcie']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/consys@10000000: failed to match any schema with compatible: ['mediatek,mt7981-consys']
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: usb-phy@11e10000 (mediatek,mt7981): $nodename:0: 'usb-phy@11e10000' does not match '^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: usb-phy@11e10000 (mediatek,mt7981): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt7981' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt7981' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt7981' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/usb-phy@11e10000: failed to match any schema with compatible: ['mediatek,mt7981', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/audio-controller@11210000: failed to match any schema with compatible: ['mediatek,mt79xx-audio']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/ice_debug: failed to match any schema with compatible: ['mediatek,mt7981-ice_debug', 'mediatek,mt2701-ice_debug']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/ice_debug: failed to match any schema with compatible: ['mediatek,mt7981-ice_debug', 'mediatek,mt2701-ice_debug']
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active-high', 'cpu-active-low', 'cpu-active-med' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /trng: failed to match any schema with compatible: ['mediatek,mt7981-rng']
--
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: adc@1100d000 (mediatek,mt7981-auxadc): clocks: [[3, 48], [3, 49]] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc'] is too long
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	'mediatek,mt8173-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/adc@1100d000: failed to match any schema with compatible: ['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc']
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: pi@1100a000 (mediatek,mt7981-spi-ipm): $nodename:0: 'pi@1100a000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: pcie@11280000 (mediatek,mt7981-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie'] is too long
   	'mediatek,mt7981-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie']
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: wed@15010000 (mediatek,mt7981-wed): 'mediatek,wo-cpuboot', 'mediatek,wo-dlm', 'mediatek,wo-ilm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: wed@15010000 (mediatek,mt7981-wed): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: wed@15010000 (mediatek,mt7981-wed): compatible: ['mediatek,mt7981-wed', 'mediatek,mt7986-wed', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: wed@15010000 (mediatek,mt7981-wed): memory-region: [[10], [11]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: wed@15010000 (mediatek,mt7981-wed): memory-region-names:1: 'wo-ilm' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: ethernet@15100000 (mediatek,mt7981-eth): clock-names:11: 'sgmii2_cdr_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: ethernet@15100000 (mediatek,mt7981-eth): clock-names:12: 'sgmii2_cdr_fb' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: ethernet@15100000 (mediatek,mt7981-eth): mediatek,infracfg: False schema does not allow [[19]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: ethernet@15100000 (mediatek,mt7981-eth): mediatek,wed: [[20]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): leds: 'int-gbe-phy-led0@0', 'int-gbe-phy-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['mediatek,wed-wdma']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/ap2woccif@151a5000: failed to match any schema with compatible: ['mediatek,ap2woccif']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/syscon@151e8000: failed to match any schema with compatible: ['mediatek,mt7986-wo-dlm', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/syscon@151e0000: failed to match any schema with compatible: ['mediatek,mt7986-wo-ilm', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/syscon@15194000: failed to match any schema with compatible: ['mediatek,mt7986-wo-cpuboot', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: syscon@10060000 (mediatek,mt7981-sgmiisys_0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-sgmiisys_0', 'mediatek,mt7986-sgmiisys_0', 'syscon'] is too long
   	'mediatek,mt7981-sgmiisys_0' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: syscon@10070000 (mediatek,mt7981-sgmiisys_1): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_1', 'syscon'] is too long
   	'mediatek,mt7981-sgmiisys_1' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7981-topmisc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: snfi@11005000 (mediatek,mt7986-snand): $nodename:0: 'snfi@11005000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: snfi@11005000 (mediatek,mt7986-snand): clock-names:0: 'nfi_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: snfi@11005000 (mediatek,mt7986-snand): clock-names:1: 'pad_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: snfi@11005000 (mediatek,mt7986-snand): reg: [[0, 285233152, 0, 4096], [0, 285237248, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: mmc@11230000 (mediatek,mt7986-mmc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-mmc', 'mediatek,mt7981-mmc'] is too long
   	'mediatek,mt7623-mmc' was expected
   	'mediatek,mt7986-mmc' is not one of ['mediatek,mt8186-mmc', 'mediatek,mt8188-mmc', 'mediatek,mt8192-mmc', 'mediatek,mt8195-mmc', 'mediatek,mt8365-mmc']
   	'mediatek,mt2701-mmc' was expected
   	'mediatek,mt8183-mmc' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/mmc@11230000: failed to match any schema with compatible: ['mediatek,mt7986-mmc', 'mediatek,mt7981-mmc']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/wed_pcie@10003000: failed to match any schema with compatible: ['mediatek,wed_pcie']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/consys@10000000: failed to match any schema with compatible: ['mediatek,mt7981-consys']
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: usb-phy@11e10000 (mediatek,mt7981): $nodename:0: 'usb-phy@11e10000' does not match '^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: usb-phy@11e10000 (mediatek,mt7981): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt7981' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt7981' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt7981' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/usb-phy@11e10000: failed to match any schema with compatible: ['mediatek,mt7981', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/audio-controller@11210000: failed to match any schema with compatible: ['mediatek,mt79xx-audio']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/ice_debug: failed to match any schema with compatible: ['mediatek,mt7981-ice_debug', 'mediatek,mt2701-ice_debug']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/ice_debug: failed to match any schema with compatible: ['mediatek,mt7981-ice_debug', 'mediatek,mt2701-ice_debug']
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active-high', 'cpu-active-low', 'cpu-active-med' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /trng: failed to match any schema with compatible: ['mediatek,mt7981-rng']
--
   arch/arm64/boot/dts/mediatek/mt7981b.dtsi:259.21-271.5: Warning (spi_bus_bridge): /soc/pi@1100a000: node name for SPI buses should be 'spi'
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:88.15-95.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@0: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:88.15-95.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:97.15-105.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:97.15-105.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@1: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /: failed to match any schema with compatible: ['glinet,gl-mt3000', 'mediatek,mt7981']
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /: failed to match any schema with compatible: ['glinet,gl-mt3000', 'mediatek,mt7981']
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: pwm-fan (pwm-fan): pwms: [[2, 0, 40000], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: soc (simple-bus): ice_debug: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: watchdog@1001c000 (mediatek,mt7986-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-wdt', 'mediatek,mt6589-wdt'] is too long
   	'mediatek,mt7986-wdt' is not one of ['mediatek,mt2701-wdt', 'mediatek,mt6582-wdt', 'mediatek,mt6797-wdt', 'mediatek,mt7622-wdt', 'mediatek,mt7623-wdt', 'mediatek,mt7629-wdt', 'mediatek,mt8173-wdt', 'mediatek,mt8365-wdt', 'mediatek,mt8516-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: watchdog@1001c000 (mediatek,mt7986-wdt): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: adc@1100d000 (mediatek,mt7981-auxadc): clocks: [[6, 48], [6, 49]] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc'] is too long
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	'mediatek,mt8173-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/adc@1100d000: failed to match any schema with compatible: ['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc']
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: pi@1100a000 (mediatek,mt7981-spi-ipm): $nodename:0: 'pi@1100a000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: pi@1100a000 (mediatek,mt7981-spi-ipm): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'flash@0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('mediatek,bmt-max-ratio', 'mediatek,bmt-max-reserved-blocks', 'mediatek,nmbm', 'spi-cal-addr', 'spi-cal-addrlen', 'spi-cal-data', 'spi-cal-datalen', 'spi-cal-enable', 'spi-cal-mode', 'spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: flash@0 (spi-nand): spi-cal-data: b'SPINAND' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: pcie@11280000 (mediatek,mt7981-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie'] is too long
   	'mediatek,mt7981-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie']
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: wed@15010000 (mediatek,mt7981-wed): 'mediatek,wo-cpuboot', 'mediatek,wo-dlm', 'mediatek,wo-ilm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: wed@15010000 (mediatek,mt7981-wed): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: wed@15010000 (mediatek,mt7981-wed): compatible: ['mediatek,mt7981-wed', 'mediatek,mt7986-wed', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: wed@15010000 (mediatek,mt7981-wed): memory-region: [[14], [15]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: wed@15010000 (mediatek,mt7981-wed): memory-region-names:1: 'wo-ilm' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: ethernet@15100000 (mediatek,mt7981-eth): mediatek,infracfg: False schema does not allow [[23]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: ethernet@15100000 (mediatek,mt7981-eth): mac@1: Unevaluated properties are not allowed ('mac-address-increment' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: ethernet@15100000 (mediatek,mt7981-eth): mediatek,wed: [[24]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: ethernet@15100000 (mediatek,mt7981-eth): Unevaluated properties are not allowed ('mediatek,wed' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): leds: 'int-gbe-phy-led0@0', 'int-gbe-phy-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['mediatek,wed-wdma']
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/ap2woccif@151a5000: failed to match any schema with compatible: ['mediatek,ap2woccif']
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/syscon@151e8000: failed to match any schema with compatible: ['mediatek,mt7986-wo-dlm', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/syscon@151e0000: failed to match any schema with compatible: ['mediatek,mt7986-wo-ilm', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/syscon@15194000: failed to match any schema with compatible: ['mediatek,mt7986-wo-cpuboot', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: syscon@10060000 (mediatek,mt7981-sgmiisys_0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-sgmiisys_0', 'mediatek,mt7986-sgmiisys_0', 'syscon'] is too long
   	'mediatek,mt7981-sgmiisys_0' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: syscon@10070000 (mediatek,mt7981-sgmiisys_1): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_1', 'syscon'] is too long
   	'mediatek,mt7981-sgmiisys_1' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7981-topmisc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: snfi@11005000 (mediatek,mt7986-snand): $nodename:0: 'snfi@11005000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: snfi@11005000 (mediatek,mt7986-snand): clock-names:0: 'nfi_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: snfi@11005000 (mediatek,mt7986-snand): clock-names:1: 'pad_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: snfi@11005000 (mediatek,mt7986-snand): reg: [[0, 285233152, 0, 4096], [0, 285237248, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: mmc@11230000 (mediatek,mt7986-mmc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-mmc', 'mediatek,mt7981-mmc'] is too long
   	'mediatek,mt7623-mmc' was expected
   	'mediatek,mt7986-mmc' is not one of ['mediatek,mt8186-mmc', 'mediatek,mt8188-mmc', 'mediatek,mt8192-mmc', 'mediatek,mt8195-mmc', 'mediatek,mt8365-mmc']
   	'mediatek,mt2701-mmc' was expected
   	'mediatek,mt8183-mmc' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/mmc@11230000: failed to match any schema with compatible: ['mediatek,mt7986-mmc', 'mediatek,mt7981-mmc']
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/wed_pcie@10003000: failed to match any schema with compatible: ['mediatek,wed_pcie']
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/consys@10000000: failed to match any schema with compatible: ['mediatek,mt7981-consys']
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: usb-phy@11e10000 (mediatek,mt7981): $nodename:0: 'usb-phy@11e10000' does not match '^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: usb-phy@11e10000 (mediatek,mt7981): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt7981' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt7981' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt7981' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/usb-phy@11e10000: failed to match any schema with compatible: ['mediatek,mt7981', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/audio-controller@11210000: failed to match any schema with compatible: ['mediatek,mt79xx-audio']
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/ice_debug: failed to match any schema with compatible: ['mediatek,mt7981-ice_debug', 'mediatek,mt2701-ice_debug']
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /soc/ice_debug: failed to match any schema with compatible: ['mediatek,mt7981-ice_debug', 'mediatek,mt2701-ice_debug']
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active-high', 'cpu-active-low', 'cpu-active-med' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: /trng: failed to match any schema with compatible: ['mediatek,mt7981-rng']
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: gpio-keys (gpio-keys): 'mode', 'reset' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: adc@1100d000 (mediatek,mt7981-auxadc): clocks: [[3, 48], [3, 49]] is too long
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc'] is too long
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
   	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
   	'mediatek,mt2701-auxadc' was expected
   	'mediatek,mt8173-auxadc' was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/adc@1100d000: failed to match any schema with compatible: ['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc']
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: pi@1100a000 (mediatek,mt7981-spi-ipm): $nodename:0: 'pi@1100a000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: pcie@11280000 (mediatek,mt7981-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie'] is too long
   	'mediatek,mt7981-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt7981-pcie', 'mediatek,mt7986-pcie']
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: wed@15010000 (mediatek,mt7981-wed): 'mediatek,wo-cpuboot', 'mediatek,wo-dlm', 'mediatek,wo-ilm' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: wed@15010000 (mediatek,mt7981-wed): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: wed@15010000 (mediatek,mt7981-wed): compatible: ['mediatek,mt7981-wed', 'mediatek,mt7986-wed', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: wed@15010000 (mediatek,mt7981-wed): memory-region: [[10], [11]] is too short
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: wed@15010000 (mediatek,mt7981-wed): memory-region-names:1: 'wo-ilm' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: ethernet@15100000 (mediatek,mt7981-eth): clock-names:11: 'sgmii2_cdr_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: ethernet@15100000 (mediatek,mt7981-eth): clock-names:12: 'sgmii2_cdr_fb' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: ethernet@15100000 (mediatek,mt7981-eth): mediatek,infracfg: False schema does not allow [[19]]
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: ethernet@15100000 (mediatek,mt7981-eth): mediatek,wed: [[20]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): leds: 'int-gbe-phy-led0@0', 'int-gbe-phy-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['mediatek,wed-wdma']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/ap2woccif@151a5000: failed to match any schema with compatible: ['mediatek,ap2woccif']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/syscon@151e8000: failed to match any schema with compatible: ['mediatek,mt7986-wo-dlm', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/syscon@151e0000: failed to match any schema with compatible: ['mediatek,mt7986-wo-ilm', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/syscon@15194000: failed to match any schema with compatible: ['mediatek,mt7986-wo-cpuboot', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: syscon@10060000 (mediatek,mt7981-sgmiisys_0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-sgmiisys_0', 'mediatek,mt7986-sgmiisys_0', 'syscon'] is too long
   	'mediatek,mt7981-sgmiisys_0' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: syscon@10070000 (mediatek,mt7981-sgmiisys_1): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_1', 'syscon'] is too long
   	'mediatek,mt7981-sgmiisys_1' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7981-topmisc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: snfi@11005000 (mediatek,mt7986-snand): $nodename:0: 'snfi@11005000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: snfi@11005000 (mediatek,mt7986-snand): clock-names:0: 'nfi_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: snfi@11005000 (mediatek,mt7986-snand): clock-names:1: 'pad_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: snfi@11005000 (mediatek,mt7986-snand): reg: [[0, 285233152, 0, 4096], [0, 285237248, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:2: 'source_cg' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: mmc@11230000 (mediatek,mt7986-mmc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-mmc', 'mediatek,mt7981-mmc'] is too long
   	'mediatek,mt7623-mmc' was expected
   	'mediatek,mt7986-mmc' is not one of ['mediatek,mt8186-mmc', 'mediatek,mt8188-mmc', 'mediatek,mt8192-mmc', 'mediatek,mt8195-mmc', 'mediatek,mt8365-mmc']
   	'mediatek,mt2701-mmc' was expected
   	'mediatek,mt8183-mmc' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/mmc@11230000: failed to match any schema with compatible: ['mediatek,mt7986-mmc', 'mediatek,mt7981-mmc']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/wed_pcie@10003000: failed to match any schema with compatible: ['mediatek,wed_pcie']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/consys@10000000: failed to match any schema with compatible: ['mediatek,mt7981-consys']
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: usb-phy@11e10000 (mediatek,mt7981): $nodename:0: 'usb-phy@11e10000' does not match '^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: usb-phy@11e10000 (mediatek,mt7981): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7981', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt7981' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt7981' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt7981' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/usb-phy@11e10000: failed to match any schema with compatible: ['mediatek,mt7981', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/audio-controller@11210000: failed to match any schema with compatible: ['mediatek,mt79xx-audio']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/ice_debug: failed to match any schema with compatible: ['mediatek,mt7981-ice_debug', 'mediatek,mt2701-ice_debug']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/ice_debug: failed to match any schema with compatible: ['mediatek,mt7981-ice_debug', 'mediatek,mt2701-ice_debug']
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active-high', 'cpu-active-low', 'cpu-active-med' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /trng: failed to match any schema with compatible: ['mediatek,mt7981-rng']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
