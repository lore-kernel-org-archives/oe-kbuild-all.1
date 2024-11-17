Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EF9DDA9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 03:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731815327; cv=none; b=s6dvNJ0JfCLeig6d3yO0HE6K61Qgeim5rWUmSShCXMw1pI7OOfpzyGBosgPni+lEX0VxKW2h4pwrz+QLB05hOLaLs2Q+oRdejhD97RE4cezs/qbYVu/EwHVukFMokTdShMmr6nxP2akyztDI11HoxeeM2/9L/hJMumnefMaXKC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731815327; c=relaxed/simple;
	bh=FnHZPRLhtvg4f6HdN7oKZKLyjwwL1SaDhhFuNJo0LKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGbpTVKsbgMwWVtqoi/KXCqvZs+CEd8CoqPcgjNOfmf6HlmTpDGRfEtZO0SvjbKmc3Q2MpiEgiVhK6I7mXCFT/XODAj0MTp1GX4E/rwJ1/tCKURxKn0eZDokgNZ60x+IeV5KSBqDvIU3TQZbwgN8SST0I0eKdpOVzVwnwYLP98M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCrVcM3l; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCrVcM3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731815326; x=1763351326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FnHZPRLhtvg4f6HdN7oKZKLyjwwL1SaDhhFuNJo0LKY=;
  b=GCrVcM3l2gvrbAF5CzJIiDaGhN3NFRSkLfRCRjuZwPHws3YsWZS0JE0S
   CZ73Dl1WPuuk26DaudIkLQNSy7CpWIOTPnH4m0x95SxMHrH5ezGYD1Tt3
   Xx4JMk9P6Z4tkkfq+MoCHvK8nQncb14aj/UQgOxSUqXNExuFp68Yhp+uP
   cl0uk3OBjrR08z0Mdv50fkfWv1MOEVJvf6wvhT60xvXyWzEggFxy6GMHm
   JsFf1YjE9poFDE//mhQxpQxqBOriIt6w3SLnHnPwm1LaSU2zR+FtLenL0
   VUJR2SuPM/l68bGq220Vz+YHoIq6smFI2/8KlP/Bvjc/GdZ1PxFViKEJn
   A==;
X-CSE-ConnectionGUID: 8Z5B2RwSQ4WIFX1GFw0cWw==
X-CSE-MsgGUID: 0eC4RWP+RAiRbA2czNxPsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="35466399"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="35466399"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 19:48:46 -0800
X-CSE-ConnectionGUID: 8SWtVWLJRIehCfqzWs3fCA==
X-CSE-MsgGUID: ZXqw1N2JR7W5Sdhk+CrYnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88906966"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2024 19:48:44 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCWHC-0001N9-04;
	Sun, 17 Nov 2024 03:48:42 +0000
Date: Sun, 17 Nov 2024 11:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 13294/24209]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb:
 gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names',
 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202411171104.zOjQ049J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   e2b6daceb83c9b9ae90fca4b78fc265484ded662
commit: be652afcb2616a85686517a492bf7fd49ecf9007 [13294/24209] CHROMIUM: arm64: dts: mt8186: Add corsola-steelix and rusty board
config: arm64-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241117/202411171104.zOjQ049J-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171104.zOjQ049J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171104.zOjQ049J-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: gpu@13040000: sram-supply: False schema does not allow [[127]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: dpi@1400a000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: clock-controller@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: gpu@13040000: sram-supply: False schema does not allow [[127]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: dpi@1400a000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: clock-controller@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
