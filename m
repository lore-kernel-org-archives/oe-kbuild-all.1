Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6988E19C54E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 03:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753067907; cv=none; b=l7TCh9vQnjtoGGENRl8lnmEjL7fDp1MvAH8Ek6lkQ9dDn7Qy/rbmPdNXASp45T8Cj8x6hqNtF7MijbzhCljVd+sexjZLJiQtFkt3Xtm5AGaEU4yNGUPkLdcStG+dFe4sI8KyHaFuGNoGO8lgGt7Nbn4Q9r490qaJC+LAqJUElhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753067907; c=relaxed/simple;
	bh=h8oaHQ3ddAO1zOz+q6HzcBITY2GwAMN8E26MClecSB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQRIfKXctr3p7UyylRh4USjWn0bVt0bDcVaoOasgxIz72p0wa3ZvvOywKM+lOKMGHz9thcKMSdUVSc3N+ltEp3iHYePn3weDArzrkWJM43HdAcTYcLeMA/tAFsvwnuSWqhluwQ8RCzR99P7nvW6BJXPJj47HSSchX5jlIJ84NRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQK1waCK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQK1waCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753067904; x=1784603904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h8oaHQ3ddAO1zOz+q6HzcBITY2GwAMN8E26MClecSB0=;
  b=iQK1waCKi1rNyuNggvtlaKH7vnGw5nCY+al4H8tN5D2WgsvyLSlhCo8H
   61GATclAYaIfeHcm9VdT3IHQ3SuHCXzR+WqNnD+xhcQnjm/V2FZ6Aax7b
   zUxbbv2eo0P2R736kytrF1sqawmMGMsglUC1O9f61NW2yvI+tVytvpVEJ
   8dLqLadYFZDZOntR8XY0M7/9/9FtXtPgPZR9SI8/HWfndQda6XfNNzUTA
   NS2Po67qT4huxDWFIFBn9j/eHoC/pwUCVomRGggrGImg6ThljqZ45aROU
   Az4vtqCqkSRuwummS3ODkDt+mMoCxMTrkpADTveLaHrIVy+xEtg0qh4bT
   A==;
X-CSE-ConnectionGUID: db+9YYaLQHeBle9twgTAhQ==
X-CSE-MsgGUID: 3FDSOsSLSxCu7e4qcyIvVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="77811274"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="77811274"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 20:18:24 -0700
X-CSE-ConnectionGUID: Ys5Q1oOsSvy/EDaIkjQ+Eg==
X-CSE-MsgGUID: tmW498W/SrSPdYCA8vAo3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="195798389"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jul 2025 20:18:23 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udh2i-000GRD-22;
	Mon, 21 Jul 2025 03:18:20 +0000
Date: Mon, 21 Jul 2025 11:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-dualmmc 78/79]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000
 (mediatek,mt7988-mmc): pinctrl-names:0: 'default' was expected
Message-ID: <202507211131.tZVB1kV6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-dualmmc
head:   61605f260a207bbe9994a325ea9b2d33e29d62de
commit: efaf90e306d125cd0af3f603e1532b0607cc9178 [78/79] dts64: change mmc node and pinctrl
config: arm64-randconfig-051-20250721 (https://download.01.org/0day-ci/archive/20250721/202507211131.tZVB1kV6-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211131.tZVB1kV6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211131.tZVB1kV6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv2:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000 (linux,ubi): Unevaluated properties are not allowed ('volumes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/spi@11007000/flash@0/partitions/partition@200000/volumes/ubi-volume-ubootenv/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/spi@11007000/flash@0/partitions/partition@200000/volumes/ubi-volume-ubootenv2/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000 (mediatek,mt7988-mmc): pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000 (mediatek,mt7988-mmc): pinctrl-names:1: 'state_uhs' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000 (mediatek,mt7988-mmc): pinctrl-names:2: 'state_eint' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000 (mediatek,mt7988-mmc): pinctrl-names: ['emmc-default', 'emmc-state_uhs', 'sdcard-default', 'sdcard-state_uhs'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000 (mediatek,mt7988-mmc): 'vmmc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000 (mediatek,mt7988-mmc): 'vqmmc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000 (mediatek,mt7988-mmc): Unevaluated properties are not allowed ('pinctrl-3', 'pinctrl-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@0: failed to match any schema with compatible: ['mediatek,mmc-slot']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: card@0 (mmc-card): 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@0/card@0/block: failed to match any schema with compatible: ['block-device']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@0/card@0/block/partitions/block-partition-env/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@1: failed to match any schema with compatible: ['mediatek,mmc-slot']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: card@0 (mmc-card): 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@1/card@0/block: failed to match any schema with compatible: ['block-device']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@1/card@0/block/partitions/block-partition-env/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: gpio-keys (gpio-keys): 'wps' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv2:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: partition@200000 (linux,ubi): Unevaluated properties are not allowed ('volumes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/spi@11007000/flash@0/partitions/partition@200000/volumes/ubi-volume-ubootenv/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/spi@11007000/flash@0/partitions/partition@200000/volumes/ubi-volume-ubootenv2/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-redundant-bool-layout']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: mmc@11230000 (mediatek,mt7988-mmc): pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: mmc@11230000 (mediatek,mt7988-mmc): pinctrl-names:1: 'state_uhs' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: mmc@11230000 (mediatek,mt7988-mmc): pinctrl-names:2: 'state_eint' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: mmc@11230000 (mediatek,mt7988-mmc): pinctrl-names: ['emmc-default', 'emmc-state_uhs', 'sdcard-default', 'sdcard-state_uhs'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: mmc@11230000 (mediatek,mt7988-mmc): 'vmmc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: mmc@11230000 (mediatek,mt7988-mmc): 'vqmmc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: mmc@11230000 (mediatek,mt7988-mmc): Unevaluated properties are not allowed ('pinctrl-3', 'pinctrl-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/mmc@11230000/slot@0: failed to match any schema with compatible: ['mediatek,mmc-slot']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: card@0 (mmc-card): 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/mmc@11230000/slot@0/card@0/block: failed to match any schema with compatible: ['block-device']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/mmc@11230000/slot@0/card@0/block/partitions/block-partition-env/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/mmc@11230000/slot@1: failed to match any schema with compatible: ['mediatek,mmc-slot']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: card@0 (mmc-card): 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/mmc@11230000/slot@1/card@0/block: failed to match any schema with compatible: ['block-device']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/mmc@11230000/slot@1/card@0/block/partitions/block-partition-env/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: gpio-keys (gpio-keys): 'wps' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
