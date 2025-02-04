Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C7A199934
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738665050; cv=none; b=A6/JVOOk4o1vJyTDBnsfURA2OeINpwd8mxBEA8tMI/H4NA2Hw70G1McCgdDLsj9uGOzBl1MsVZ0GZvpIg6WyE2ltM+nXzhyhvHKH5aQgMMvFlp6vBpFtx1/0mlMZz0+Xl4KoL3L9R1ttrRrKo67GlBHJq7f9LmMh2NYQA8IzLkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738665050; c=relaxed/simple;
	bh=XVAvBwg4yyeqcJ12Z+9lt8fZTqpZLSYm9rgSw4ILN3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dwkRY/QZ+rewM8GwlhXPngOQvVdxTiIj1yetdN2L5+qqGebf8XvbhZyAUE+2AzT/Bi1bj3PPyBGHeHUCJqZNzVfYP1w1IX+6LCTbpqj8yHWtf587EvMz1DlPhLO++hpZtatKqhTUjwBrba3s8smtyt8uDi9pUzY5zwUyrqS3VSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4lwFiFT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4lwFiFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738665048; x=1770201048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XVAvBwg4yyeqcJ12Z+9lt8fZTqpZLSYm9rgSw4ILN3s=;
  b=k4lwFiFTYA7w7iNvXULXG8eHzrnSabj1YW6dyXT8cRiBehgEtQd8Snk5
   PQQqbuGM8eTkEFB9Zmh2xrC66gW/uF4xEiNdWAwhn2OaGQ2PmgvnwTwZP
   36Pyfeyu/lqXgc1zz77e1vOLmxOCwDWcGGJwlB70CG6YIf61WMEUGmF2J
   TKK8jFLGWOJj19QAYrbJ/cNw+3xc2QgG8qOnIBM31zPGd6ObPd+O96NlK
   kReONjysW3mu2m0MRHpWkx0GB0f0gwQlSWB6V3gy3vl7GAUe8exiGg8JW
   8c70mIO6rx9ZM3x0qh4+jWgRRbRsrubER+OL4FhEymnlj0qmkUSGkm4FZ
   Q==;
X-CSE-ConnectionGUID: GmZiuijySOe1dxPhn5JUdw==
X-CSE-MsgGUID: Z64yHbVASTiKHnmGPIwYaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39289943"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39289943"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 02:30:47 -0800
X-CSE-ConnectionGUID: Zvim9mKbRcGFRBj/mq+QfQ==
X-CSE-MsgGUID: vM7BycBxR0G3+RPztHhzPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="110544214"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Feb 2025 02:30:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfGCa-000sL4-0r;
	Tue, 04 Feb 2025 10:30:44 +0000
Date: Tue, 4 Feb 2025 18:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 35/35]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb:
 /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema
 with compatible: ['mediatek,me-vcp-reserved']
Message-ID: <202502041851.85oDAyLB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   214a5686718f4ddf23fe02a3df2a4b37b05d1ed4
commit: 57436b1dbadb65c2038d5d2958e0ec9beca0c4f9 [35/35] CHROMIUM: arm64: dts: mt8196: add device node for VCP
config: arm64-randconfig-051-20250203 (https://download.01.org/0day-ci/archive/20250204/202502041851.85oDAyLB-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041851.85oDAyLB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041851.85oDAyLB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clk-ao: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clk-ao: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: $nodename:0: 'clkitg' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: clkitg: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
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
--
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@30800000: compatible:0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@30800000: compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vcp@31800000: failed to match any schema with compatible: ['mediatek,vcp']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vcp@31800000/vcp@0: failed to match any schema with compatible: ['mediatek,vcp-core']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32000000: failed to match any schema with compatible: ['mediatek,mt8196-mmsys0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32240000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32400000: failed to match any schema with compatible: ['mediatek,mt8196-mmsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32600000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
