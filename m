Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068611E493C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 22:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742595610; cv=none; b=YxEB0erMe2hloRSke/yXQOS5CFBu5W0tJL8K+DZOOG7s3mcQzZUlrVUuroyjJkBy9ABlVItTRkwBWQy1kK6Fg7F5MU51RHsiGSLjwsFSYht5iEd/7QNs5RhRGaS49Zq3NXbQTzkXfufBIMAI9J0UNDlExHmXJo4R+COZEpF71Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742595610; c=relaxed/simple;
	bh=z/TC1luTJ6cqiPxOEXQbzyF0tBtyglZPzTH6LpqZb4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tgBByoU0F3cieWrklju8O9kEAEdTjSgmQWvHUAvMC+4DRLSehZXXdyx9OfhCmQ+9XCIstA2i/Uq277vgs7xHfoYY3jiYSBjDpaCbcVueGOXnz7/9vQDer2f/FZ5broFaYnrc0L/MPS/L7g2TSloKjWn+MZNsyiUvOidgj9lwvu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpAaN3XH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpAaN3XH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742595607; x=1774131607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/TC1luTJ6cqiPxOEXQbzyF0tBtyglZPzTH6LpqZb4o=;
  b=gpAaN3XHbKoofRaEavDltwF4Rtw+1TbA+gWobXUIOD4Uq6P70JxWkJgI
   k+Qy5VwXTcdzla5LMltk++UUhoXfmQK7vBMUw+O2dcAyjJrRPTmbEh9ds
   NXWbZW0hWHlcGiWjR7UBInbt5ZksmF6fATMevzUP9sDgPvNFJhpSFxkrq
   rcdygBMFlZ9gtBhojAZC9l+7zjHtXrWCgfhM7CJUmmvgMgVZ9eSFSO5ni
   QlqlrFBEErU/8YjDmP9/ZG//HG8/YNOeIRdNt4X7kc7i2SJ/vwKJzkUsl
   7bEp8qNNZ9A1jMbTnSdwO/DtGDvRo3ZYza8tWKMToEONG31CVMyl2Gyh/
   g==;
X-CSE-ConnectionGUID: xfTgfPHjSb+07+EfNd3mgQ==
X-CSE-MsgGUID: G6RxZVvsQCasmBFzUByv1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="66337047"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="66337047"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 15:20:04 -0700
X-CSE-ConnectionGUID: zIIBHS8ATpmlPN1e4WEJ4g==
X-CSE-MsgGUID: C+qfJubITUmMnAN44aXlNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="123225482"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Mar 2025 15:20:03 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvkiZ-0001jC-08;
	Fri, 21 Mar 2025 22:19:56 +0000
Date: Sat, 22 Mar 2025 06:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: Fabio Estevam <festevam@denx.de>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 9098/13068]
 arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: nand-controller@b8000000:
 #size-cells: 0 was expected
Message-ID: <202503220608.oRZM5XD3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9388ec571cb1adba59d1cded2300eeb11827679c
commit: a1ea2f97e7ddf982bf5c81cf25a7525f8e6f31f6 [9098/13068] ARM: dts: imx31: Use nand-controller as node name
config: arm-randconfig-052-20250312 (https://download.01.org/0day-ci/archive/20250322/202503220608.oRZM5XD3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220608.oRZM5XD3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220608.oRZM5XD3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: /interrupt-controller@68000000: failed to match any schema with compatible: ['fsl,imx31-avic', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: /interrupt-controller@68000000: failed to match any schema with compatible: ['fsl,imx31-avic', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: efuse@5001c000: compatible: ['fsl,imx31-iim', 'fsl,imx27-iim'] is too long
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-iim.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: emi@b8000000: $nodename:0: 'emi@b8000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: nand-controller@b8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: nand-controller@b8000000: compatible:0: 'fsl,imx27-nand' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: nand-controller@b8000000: compatible: ['fsl,imx31-nand', 'fsl,imx27-nand'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
>> arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: nand-controller@b8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: /soc/emi@b8000000/nand-controller@b8000000: failed to match any schema with compatible: ['fsl,imx31-nand', 'fsl,imx27-nand']
--
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: /interrupt-controller@68000000: failed to match any schema with compatible: ['fsl,imx31-avic', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: /interrupt-controller@68000000: failed to match any schema with compatible: ['fsl,imx31-avic', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: /soc/spba-bus@50000000/spi@50010000/pmic@0: failed to match any schema with compatible: ['fsl,mc13783']
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: efuse@5001c000: compatible: ['fsl,imx31-iim', 'fsl,imx27-iim'] is too long
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-iim.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: emi@b8000000: $nodename:0: 'emi@b8000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000: compatible:0: 'fsl,imx27-nand' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000: compatible: ['fsl,imx31-nand', 'fsl,imx27-nand'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'compatible', 'dma-names', 'dmas', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
>> arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: /soc/emi@b8000000/nand-controller@b8000000: failed to match any schema with compatible: ['fsl,imx31-nand', 'fsl,imx27-nand']
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
