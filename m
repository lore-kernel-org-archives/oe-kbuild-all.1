Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467601DF973
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 16:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739117651; cv=none; b=skEtObTWbYondKGaHIFLhKE84fTR5vHQadvaiz7TpG5yy6jKAsJrZfItwBlyc3xSNb/hw9UxttgAXgVJJvBJHFGQ0fTh+xcnTfPWqFKWc9tlN4z+10RUwwHCpVgx4DCriK0R/4tAt8f/Wqe038Uma0jlapBCzRx2FnRZhDsQL+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739117651; c=relaxed/simple;
	bh=UXlmCg1pqQ3pX2ppD94ehT6ABO4k5BwPVSL5+vMWQOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nBtgazQAahSK7doFO/r63++Rb8ArBAV3xrzxjCUCFEC5shRsVu8WmeYL6T/Syr20t8qILDtwWiMDBCVCDKRNJB3LAEVcH2qgBg3RTNj+2Nk4Bj7Axz23XdWQPMnRCpjAlIuUWIgXdK5P+Q7O5GUl/9LJ8ZtAAO7GiCB1LxiFpII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWvqM6pf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWvqM6pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739117649; x=1770653649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UXlmCg1pqQ3pX2ppD94ehT6ABO4k5BwPVSL5+vMWQOw=;
  b=NWvqM6pfLhTvCGo8kVNPxy9H0JDztXtKjq1SGwK2P69lXiqpj6Vw6VK8
   6hmUcsDt82DxyRN5MN8/gMnj9Pm+1pmFWBvo1+NpnZPcV3yeqGJ0zM6HU
   Wz503lRZd/Nnvmuo83Bb9DKevpZpbpgXJqZp0MJGvmsem1gZuMRDPagQc
   Zz8j5ToU//X6J234MIHXPL7+OUiT2e7XXk1041lM4u6GJGFSCnz/apppV
   yWvli4SCkgacK8PZXdHiwH+T1X5xfj1A06JN8wS4JGZ1ApQYvLfXrrHnh
   +gptISWnNyiSMw+nbxgTPl+WwQqgJmsdN9mYnZGIbduL6EiILluA/MJrC
   A==;
X-CSE-ConnectionGUID: 0CZDzGyOTXa/iJ4zY3MV1g==
X-CSE-MsgGUID: 6u09I1AxStOcd86GxCQAuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="57235993"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="57235993"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 08:14:08 -0800
X-CSE-ConnectionGUID: RysUWHh6RhyGkv0lj9bBeQ==
X-CSE-MsgGUID: IalT7e6iTxCmDfxFfXrf6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="112482636"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2025 08:14:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th9wb-0011fT-1Y;
	Sun, 09 Feb 2025 16:14:05 +0000
Date: Mon, 10 Feb 2025 00:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rsslro 110/110]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000:
 pinctrl-names:1: 'state_uhs' was expected
Message-ID: <202502100003.uHh1yIyp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-rsslro
head:   cb6612a57bbcc77b70a9fc1c521c14c48303714d
commit: cb6612a57bbcc77b70a9fc1c521c14c48303714d [110/110] msdc: multi-slot support
config: arm64-randconfig-052-20250209 (https://download.01.org/0day-ci/archive/20250210/202502100003.uHh1yIyp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100003.uHh1yIyp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100003.uHh1yIyp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11200000: clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11200000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11200000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/audio-controller@11210000: failed to match any schema with compatible: ['mediatek,mt79xx-audio']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: pinctrl-names:1: 'state_uhs' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: pinctrl-names:2: 'state_eint' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: pinctrl-names: ['emmc-default', 'emmc-state_uhs', 'sdcard-default', 'sdcard-state_uhs'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: 'vmmc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: 'vqmmc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: Unevaluated properties are not allowed ('pinctrl-3', 'pinctrl-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@0: failed to match any schema with compatible: ['mediatek,mmc-slot']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: card@0: 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@0/card@0/block: failed to match any schema with compatible: ['block-device']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@0/card@0/block/partitions/block-partition-env/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@1: failed to match any schema with compatible: ['mediatek,mmc-slot']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: card@0: 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@1/card@0/block: failed to match any schema with compatible: ['block-device']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@1/card@0/block/partitions/block-partition-env/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pcie@11280000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7988-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
