Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F5A241CB5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739034034; cv=none; b=CzT4wDKSZGT4FIpsVJtTuVlHCnLMzcRDhEyaBTXqk9ZyObfGVpdZLTm0QRAg1c+xRIxxFuM5uZc6IXdn04FAJ2Dxu2TePkClHjcCHPat14CMaJMJyjijgXw0nqGC4cWXxPunlMCYA0OIOZBS/GGnKQpPm91gU8TMZkZS5RXQjgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739034034; c=relaxed/simple;
	bh=XEVs0kyKIrvyfGxcOUAIsvZ7Koy1pD1EAR+bHY+MYGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UpPi5FxKUfbs39RjrVzY3l3G5yHByPzw+F0Gn0vUW81K9E2vj1JAJiKPPMqsByzyoclecjRvf4xvoc9CutVMNUx1SEbr2ajWBN8faBAJX9C8dYVXjgdw95CiPNtOP3OskE5rL7yyT4Y/jZVg/LY0ECHotatKrtQCPA6jE/rBKDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyJSay5j; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyJSay5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739034033; x=1770570033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XEVs0kyKIrvyfGxcOUAIsvZ7Koy1pD1EAR+bHY+MYGc=;
  b=DyJSay5jyNT5DxMJGB7YcKAZVXjj5yesJqLe/7vwIe404rZLep7dfUvu
   cVbB+aOyK75yjW3fwqcy2nFBzpnVS1h09Il38iS0BgBKy8LNs+mwdV0Sn
   wDkqwrvRKEe7MJoveG1HwVl+G//7+JIdX5tfHU7FqnBA/AA21lPiQwEHY
   TuTpa51JbyOvNFuWncJWLoFnn8hHNqGygYYqwYbfYvlnwbAMVI964is8n
   q97zt2HSxMNNFzPUZcFUcw5XJIJQiFBewfvycG3kjVhWw8ZF/UNNCmpW/
   5VCY1LmpqJx75ah+7BLReWILyTJuvZDG3YV2CfEemjdD7dfKq4F3OX0E1
   Q==;
X-CSE-ConnectionGUID: 3CjY8YWVRB60aL0hOF2KpA==
X-CSE-MsgGUID: EU0wwsf0SHKHKQm8zD1c3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39775621"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39775621"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 09:00:31 -0800
X-CSE-ConnectionGUID: 2Hc9NBLHS5ybMAPIhMfvuA==
X-CSE-MsgGUID: q1kJhOeKRDepCQlRsGDRsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116403742"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 09:00:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgoBv-0010OF-2m;
	Sat, 08 Feb 2025 17:00:27 +0000
Date: Sun, 9 Feb 2025 00:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 211/211]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: vmm: 'ranges' is a
 required property
Message-ID: <202502090019.b9eJhwJs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   fd00cab3fe36e486cd2aaf166b98a6a5b943a097
commit: a2f778a6f2805b30558fa42b25940fa5be91ae45 [211/211] CHROMIUM: arm64: dts: mt8196: add vmm device node
config: arm64-randconfig-051-20250207 (https://download.01.org/0day-ci/archive/20250209/202502090019.b9eJhwJs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090019.b9eJhwJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090019.b9eJhwJs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: mvpu: 'ranges' is a required property
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mtk-apu-mem-data: compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mvpu: compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-mt6681-sound']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vdisp-ctrl: failed to match any schema with compatible: ['mediatek,mt8196-vdisp-ctrl']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vmm: failed to match any schema with compatible: ['mediatek,mt8196-vmm']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
