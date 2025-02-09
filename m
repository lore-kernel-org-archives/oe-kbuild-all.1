Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF76416ABC6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 15:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739114464; cv=none; b=iCUMMf2y9pZHPyrwu7mDC19tO4nOa3fXlFWOkMpXkjKyWK9CT3e+1m+9E+ULlUONdw0G2Crt9TV0HTWpaNcUuBM/I73SwueacVWQSHB/CGfEs7Dsl9EQvtqsmiz5vYTLMAn0D9subeqvVwVLemClAYBXP4VHcvIRSpqM838Szk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739114464; c=relaxed/simple;
	bh=BNgySQuDj9EHxqdkr0u1NvuKzfbgPdbfXVO8kK+Jbfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hKD+FDXMmmlGLAc6dE7LQF0q2k9fYS1rvRwqPwq6T7GcENZSTgjwmHyIikZHOAESIcXBx21SrqhRAvmYUr9UDsPQv+roa6F304qahxr/TZh0fAk+ziE6UUBiWywgLKZEPrKmFYNHOeRRvPoVd17xrA63CQ4rEEJ5wWGX2ntp0aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFgykS+R; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFgykS+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739114462; x=1770650462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BNgySQuDj9EHxqdkr0u1NvuKzfbgPdbfXVO8kK+Jbfo=;
  b=MFgykS+RLIQ1PB7m8oyEuXNl748/Kqn+d45jLu5IcGSrbjmHXokYBCum
   mMcA2dgmZzY9ECebIbseylUSiEVeCeolRYy/mRGA/RskH1L5JCrmJ2/kF
   9TOst8aTFF6w5kIMb7lMFnKXDV6yscD/moyobtG1e0NEQsAwayBJ3KrYq
   Xf1icBYpTGrVzhG49VLjX+4PJuADvsiEhhB2Z3823Ia9qcgOFtkUFGp1l
   Ry9RBAbhj0DjgMwpjkbzItMt8W14uMGPV+eR8MTIt5JbQTxIdRgNF/+iU
   jUY7whQy3Ta23Q2519OjbyZQPnqmyHnvgIqmTj42ceEtgBuIVm+pkEmIR
   w==;
X-CSE-ConnectionGUID: KiAvOflPRkCR3wczU48xRw==
X-CSE-MsgGUID: nRRYBoctSpCSFWGPzS26oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="49937326"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="49937326"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 07:21:01 -0800
X-CSE-ConnectionGUID: qgw3sGbrSROHNqLCLOUwFA==
X-CSE-MsgGUID: +KTrOhGvSv+1HR/KezcP6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="111809933"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2025 07:21:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th97C-0011b5-0f;
	Sun, 09 Feb 2025 15:20:58 +0000
Date: Sun, 9 Feb 2025 23:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rsslro 110/110]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000:
 pinctrl-names:0: 'default' was expected
Message-ID: <202502092342.TCdqiYvv-lkp@intel.com>
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
config: arm64-randconfig-051-20250209 (https://download.01.org/0day-ci/archive/20250209/202502092342.TCdqiYvv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502092342.TCdqiYvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502092342.TCdqiYvv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11200000: clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11200000: clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11200000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11200000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/audio-controller@11210000: failed to match any schema with compatible: ['mediatek,mt79xx-audio']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: pinctrl-names:1: 'state_uhs' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: pinctrl-names:2: 'state_eint' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: pinctrl-names: ['emmc-default', 'emmc-state_uhs', 'sdcard-default', 'sdcard-state_uhs'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: 'vmmc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: 'vqmmc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: mmc@11230000: Unevaluated properties are not allowed ('pinctrl-3', 'pinctrl-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@0: failed to match any schema with compatible: ['mediatek,mmc-slot']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: card@0: 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@0/card@0/block: failed to match any schema with compatible: ['block-device']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@0/card@0/block/partitions/block-partition-env/nvmem-layout: failed to match any schema with compatible: ['u-boot,env-layout']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@1: failed to match any schema with compatible: ['mediatek,mmc-slot']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: card@0: 'block' does not match any of the regexes: '^partitions(-boot[12]|-gp[14])?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-card.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/mmc@11230000/slot@1/card@0/block: failed to match any schema with compatible: ['block-device']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
