Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3FB214209
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 11:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842736; cv=none; b=iXsJGtkTQweTasxbjP18SyHCapJ6MrWiWqj1aMcRYjwouI3kxgwKGR+JTOoSFx3m+Kj5q1x0VQR79h2cJJcIYHuXVmh+OsmIqWel/SzZluWozGWigfm3sXIdo3dHeAG8hGy+2+0wBMbI3yom7aMPnHrEfhLRAu4Y9BVggrvSK98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842736; c=relaxed/simple;
	bh=B4HG+d/JXvnoF0+Z6N/G7rmFS00QwfzACzjM8xI6CRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jwGRyxbwiLQIoWMVq7dFHqdIIc0SfjQ5wWPHXjlqBqcHthvT45ixWPfR2eU1XlwSFOJneJcmkdgPF/URQhj1z5qapTaev3P/fha+rq0jGSFR/6+GWLgnnldTaJQ2aRCoevc4LdMQq8HCCuxGE4YueNplMKg3BnpYhpcx47BfP/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8NtOdyh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8NtOdyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738842734; x=1770378734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B4HG+d/JXvnoF0+Z6N/G7rmFS00QwfzACzjM8xI6CRk=;
  b=V8NtOdyhBtKxil5xiJRvk9xtxacGDYc4wbqHM+gmkZ3JP1TvpLDpfy6p
   CWJTH2pVLBB/+jwf4hVmjLwCdx6B+SHsGFVr/ljXKp1cWDBvKNrVeyvn0
   41I0J3/RU/4v+adaQ5L9AQXpFxrZQztDRFSYaxH8+TifR8TmzKw/CtofE
   QdtGsT5pT8IAmTl+oYPt47NWrZMz9UzkDDoVyVH/O4Sv+tsiB0b/uC8iZ
   umNoqVuSIh0FwuSIPxbOTu4yvVB1lgFWXjtq+ae0mmIaREGXGAOHUpDTR
   1JFmGkjo1h+zMHyIDAKEtW/Thza7Sh8fENAo6c5O32nVokPJ64wBjn2Kx
   w==;
X-CSE-ConnectionGUID: FJrTI9KfRZSFjGipiNZibg==
X-CSE-MsgGUID: IYc4yN3FTNusP7EMf84ifw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39555215"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39555215"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 03:52:13 -0800
X-CSE-ConnectionGUID: U3ml9Q7wS5aw65V9RTPJ1w==
X-CSE-MsgGUID: r5oazt8STIOF4kRxxM0Rrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="116172958"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Feb 2025 03:52:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg0QT-000wpD-1F;
	Thu, 06 Feb 2025 11:52:09 +0000
Date: Thu, 6 Feb 2025 19:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mcupm@c240000: failed to
 match any schema with compatible: ['mediatek,mt8196-mcupm']
Message-ID: <202502061912.a1fXvypR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1fe62fcb2a55fbf67fb3bb11d7398dfbebfa9f71
commit: af8ef1affaf7bd9978e0f1e27c0eb17ace6f93f8 [204/204] CHROMIUM: arm64: dts: mt8196: Add MCUPM device node
config: arm64-randconfig-051-20250206 (https://download.01.org/0day-ci/archive/20250206/202502061912.a1fXvypR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061912.a1fXvypR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061912.a1fXvypR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e4000: failed to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-ctrl', 'mediatek,mt8196-ptppll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e4000: failed to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-ctrl', 'mediatek,mt8196-ptppll_pll_ctrl', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mcupm@c240000: failed to match any schema with compatible: ['mediatek,mt8196-mcupm']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: performance-controller@c2c0f20: reg: [[0, 204214048, 0, 288], [0, 204214336, 0, 288], [0, 204214624, 0, 288]] is too long
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: performance-controller@c2c0f20: 'reg-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8196-cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@10000800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8196-cksys-gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1000c800: failed to match any schema with compatible: ['mediatek,mt8196-apmixedsys-gp2', 'mediatek,mt8196-apmixedsys_gp2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1002c000: failed to match any schema with compatible: ['mediatek,mt8196-ifr-bus', 'mediatek,mt8196-ifr_bus', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
