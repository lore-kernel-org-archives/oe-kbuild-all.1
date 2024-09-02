Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89CA19CC04
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 20:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725308843; cv=none; b=RKyX9NnXXtunxb+Vk3sYIohpNLpTo2S54CHTYNMiRM0nKf71HtfK1WyNHkdpBPbaYLVXzNhRwXPRtzadXjMtAl/9oHtGyoLXuH/PyqOsxZxrlNTQc3WLWLZDfDEaRSd+4ABOuoNtcNg547IYfZUPxh8C8sU4cOHu5MSimUv+0eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725308843; c=relaxed/simple;
	bh=l2Q9vDkx9JGsS3IbCpDsibNF3h+6e5RizT/CcrAYWyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AE0mPX9ZAGmiqTWv90TY6bz990cA29aXg9XgUGxTG4XNJ953+c1HdyN3woEpXNfZjPh2D1kaH+zbs0tLG+oRxhLc+xKvNrJ+Bi1zx/g/SLMnVyYkPlipBxg2WIVdwUPS+B/brO13GXzlcnZmh5QYvyqfORlRpw8l70nU9HQyMjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHQEirBH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHQEirBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725308842; x=1756844842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l2Q9vDkx9JGsS3IbCpDsibNF3h+6e5RizT/CcrAYWyM=;
  b=OHQEirBHxeJa5ocU0mC7+fZaCoL580KsM73u62HNIm/Ds42OanFeOV3T
   cNU7PTBFS0aL4h4g1Gos6uCWTsPR9HRzw2mw++U+Zc0g3rgAnaTuVMfUn
   gW87tMI3rAlsuC5fnq+sRDurm/uwqGFb3w6Y2hsqdG8dbmYjdoOXdTD8o
   OT8LpVLAezaLFijAMTkuvphztGHc/cb6VyKD4Jxcz8YjblUgH6/nMYJWx
   JRm62mRTZ0qVri8qJ1bSzR6aevVDH9OX5tjo6b8XEr4uk6l23gzTc3c+H
   +s9RwDB1K9CKqchQgveKKVBTYWi3p0Sf5iep0XDL5yUVqWYe4rd7I3yAO
   Q==;
X-CSE-ConnectionGUID: /KanwwmTQ2Kp369t4M0crQ==
X-CSE-MsgGUID: gsNcx06ZRLqq0jXh4kEXkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41367478"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="41367478"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 13:27:22 -0700
X-CSE-ConnectionGUID: 2eBs2ygiRAOUkX+vHQiRMA==
X-CSE-MsgGUID: jF4nr/LxQz2tWyPatDuDxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="64879490"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Sep 2024 13:27:19 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slDdt-0005te-1r;
	Mon, 02 Sep 2024 20:27:17 +0000
Date: Tue, 3 Sep 2024 04:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tomasz Maciej Nowak <tmn505@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 6671/8400]
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: wifi@1: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202409030438.8tumAnp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
commit: a50d5dcd28154c1a38aa1d72b1678715aecf5464 [6671/8400] arm64: tegra: Wire up WiFi on Jetson TX1 module
config: arm64-randconfig-054-20240902 (https://download.01.org/0day-ci/archive/20240903/202409030438.8tumAnp1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409030438.8tumAnp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409030438.8tumAnp1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /i2c@7000d000/pmic@3c: failed to match any schema with compatible: ['maxim,max77620']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: external-memory-controller@7001b000: '#cooling-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: wifi@1: compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,bcm4354-fmac'] is too short
   	'brcm,bcm4354-fmac' is not one of ['brcm,bcm4329-fmac', 'pci14e4,43dc', 'pci14e4,4464', 'pci14e4,4488', 'pci14e4,4425', 'pci14e4,4433']
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: wifi@1: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: usb-phy@7d000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: usb-phy@7d004000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
