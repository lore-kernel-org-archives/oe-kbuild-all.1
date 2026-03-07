Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6A92586C2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772877733; cv=none; b=TtSniVHt9vMSPaxKU0JBwL8YbhvGB70HxKGRJAE3u45kbn+i6S3Ac0ANcdZqgLITbXLXN7dMV/QLoDNnTkt02yz4d5TSr1DTubv+e1HWzKVjIebAIgJgeYKX76u/Sl54evuP70OPc+iwkAktYEbGhqhpOvpr2zhqS0UrrVl+B3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772877733; c=relaxed/simple;
	bh=CJ9e7dbXk/81kv3ad1gqWdTJlLyjQ+rI4aszzcCKjU4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GXyzgY7oc0rYRd/5FgQ5EG3OvBQaK6JXVNcxGoTowVHaEFlMwEHpxoUNftjacZNDJb5FSJqPit+A1i6JbPdXGCGQUKlkKlhbJlYeDQ4r6qom/SeKpevcrnP8okQGW98AypkgAi0BzZFZm55Ped7QSnTbXOvVoDdwRskuQZscBIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4pSIex7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4pSIex7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772877730; x=1804413730;
  h=date:from:to:cc:subject:message-id;
  bh=CJ9e7dbXk/81kv3ad1gqWdTJlLyjQ+rI4aszzcCKjU4=;
  b=A4pSIex7ngA9t6/sRa/SuZ1oCx8tVbFFOhF5fssnggb+4bVyKs5qrlp1
   IzDEVu1pSdakk80mnTsjkxOCdJU7i+kHZdu+NNIHYcOOvSZe9BxJ3agkM
   Mgtw3AdxvENdAaWxQL9tKqngMw0N105SCl2zqdzjBHP10m/RUl8B9/rB0
   ue/jGu6gZk2Yu0AGv5raXsXz0arZOaHc0Z49nfuZUhozsjf2r5vf5/3H0
   cMOtgHiz1ZhoQaE5NK2kNMlmhCtI1x1QN2HD1EIJsmt+YV811zQC3K/Qo
   7b8XRVpo30RybSNrB1/WT9bIt0pyMuHa4422Xa4Vukyu8jk6lw3XrWq+e
   w==;
X-CSE-ConnectionGUID: jgFIqiYMSf2eBLw9ROCWDw==
X-CSE-MsgGUID: 1ULoF+WdQpiO8b4DKkPD+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73851289"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73851289"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 02:02:09 -0800
X-CSE-ConnectionGUID: A0ZJEu/yTLyirdHTwMZ+5w==
X-CSE-MsgGUID: 3fxq3N/bTEuzuBvFjPhP4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="223365445"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2026 02:02:08 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyoU1-000000002SR-31nQ;
	Sat, 07 Mar 2026 10:02:05 +0000
Date: Sat, 07 Mar 2026 11:01:34 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb:
 ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are
 not allowed ('mac-address', 'max-frame-size', 'mdio', 'phy-addr',
 'phy-handle', 'reg', 'reset-names', 'resets', 'r...
Message-ID: <202603071037.DncbBORu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   d26d295a9b9d087b32e5ce205def4cff199dcb5b
commit: f672fcd8e6c411144a06dd07252f24805f229834 [3/3] dt-bindings: net: altr,socfpga-stmmac: Constrain interrupts
config: arm-randconfig-2051-20260226 (https://download.01.org/0day-ci/archive/20260307/202603071037.DncbBORu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071037.DncbBORu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071037.DncbBORu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('mac-address', 'max-frame-size', 'mdio', 'phy-addr', 'phy-handle', 'reg', 'reset-names', 'resets', 'rx-fifo-depth', 'snps,axi-config', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('mac-address', 'max-frame-size', 'mdio', 'phy-addr', 'phy-handle', 'reg', 'reset-names', 'resets', 'rx-fifo-depth', 'snps,axi-config', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
