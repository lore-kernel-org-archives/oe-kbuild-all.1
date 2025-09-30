Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095CB1E3DE5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 02:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200865; cv=none; b=gzlKahr1PN64tdTYQ73Z3CriQwvN+/nnlQOe67fDT00QG5LqspxMEMqfxB/Hcv7EStcVglAf+A1VQQOwGF/nbGt8v77og2vu0HSD9Wr0KEQ3rBr1J3vcslZczCUlue3rwRlqvjMcZ7ekRWQdR9UtaXO64OCjHyVNE1TK4ik+AZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200865; c=relaxed/simple;
	bh=UJVvFcVXWzDcROclA6G4ThYH70QVnLn9BBqy/g17HoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0/gDzNthQpcw6l2e243xjwLk77+ALJNodXk6LId+zFdBGgKiFd9g3/bUexwSLB4ws5UzK+Av0ESRuKGMJj4Xr3RgEv7KuuS3n8FnAbiZMeC+od2IXQcrFLkaa82yDOJJ7mxuV/TSgvpGIeW7OX2JAhBLtWF5L2VrBvAqjYIMSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYVMoxzW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYVMoxzW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759200864; x=1790736864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UJVvFcVXWzDcROclA6G4ThYH70QVnLn9BBqy/g17HoE=;
  b=HYVMoxzWn66J5VGE7njQYrxj3ZzrdfTVsEaU7EI9IZNnrr5qeJTGeoLY
   9rIn4BD6M10u3jSqgHZQIimJsH/pUyUGFMRp3VoMdzqdKLbh/QVkMLZtD
   3X0N3gA6YlpQ0IVlnWkT7FGGXvkuDSBF5LKFBNEYPEvmdNGDqoYc7bwHx
   kcegwfnb+jlkazOMSQr1ibzbJ3DSAPHA5Re3OH6mzY2sU0rxK9EPS422m
   xTXMSaq2iPGVZo9HDzU6G1FC/1MSTyO/KmbFvTfO/e1y8K2qTs6iHgX+1
   hPco9RRSDnZqvfnnh683TbjHIY7MNtlrdxQxorfmjya7pt1G4yoG/PWWS
   w==;
X-CSE-ConnectionGUID: 7EZvewnQQOmzfDooW0lMHA==
X-CSE-MsgGUID: 8ysILGtrTlqWD+gBOSoNMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72066680"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="72066680"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 19:54:23 -0700
X-CSE-ConnectionGUID: X8J51+g7TYa6qDErs74iYw==
X-CSE-MsgGUID: bp/fZSICSKaLVyrkDYaJ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="182420489"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 29 Sep 2025 19:54:23 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v3QVP-0000000067N-2kjZ;
	Tue, 30 Sep 2025 02:54:19 +0000
Date: Tue, 30 Sep 2025 04:53:41 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-r4pro 94/96]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb:
 /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema
 with compatible: ['mediatek,eth-mux']
Message-ID: <202509300425.kXVofp8Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.17-r4pro
head:   36b4e168b26818fc2a5e17881f5400a64c5050e6
commit: f47abaaab2ccfb6c67bf467cb582d6e0928da777 [94/96] dts64: r4pro: try to get wan phy working, but still crash when i activate eth1
config: arm64-randconfig-2051-20250930 (https://download.01.org/0day-ci/archive/20250930/202509300425.kXVofp8Z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2d6ce5148cf144ab800116e1f75a5d007e82cf58)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509300425.kXVofp8Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509300425.kXVofp8Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy24_led0@0', 'an8831x_phy24_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy28_led0@0', 'an8831x_phy28_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
