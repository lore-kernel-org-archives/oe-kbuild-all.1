Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBCE23F417
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 17:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741368214; cv=none; b=uuu6H1t7po/4AhzPL/SAAOieL0RWQC8kyLcmFLHQd+ywzWhtNJxPdr0CvGraRtqzjwAU9lAzy4tOs9iFkcFWO8tL02VHbG50hP4PDAmdr0sAwZJK+iDtQINl4Y8n+LQnIrGAyemGhRTWEkQu0zkElzV7Qkydgc5lZNrWs+XWnlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741368214; c=relaxed/simple;
	bh=Bz7B3UX9wUOxi5a0mbgZ1L/KwGKbw/HsKFAfcL84Egw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qzCoAe6LASomj5WeBTIXdoubOKAkR5xJIn71b+9G8GIgZ6/Y9w23a7tWlsr2n98esHQmirlD7ZcQwTUhByQkyr+6A+mamynBjNXmMKRf51+5aYZvpie/5AFZLePH7W1pcL4Fzxn5LYwECIdfEsP49koVH9KPNHsZBdFbrIlRbHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZIlWDuV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZIlWDuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741368213; x=1772904213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bz7B3UX9wUOxi5a0mbgZ1L/KwGKbw/HsKFAfcL84Egw=;
  b=AZIlWDuVWbBd/K2ZPv1zPwZVmL5XZiCIovmHXjNtusfpw4ga5weDykB+
   Wdq3s10FeJiXKSnLTAtEZmANYoF4mbZfq4P+bPnapRFy+Zu3FxTfnbZ2b
   L/vIec1ZBgzi2MOco8CHNHy50jmAE+/oGU0szDJrovwKTLBch0ZFjV0u7
   CLsCEMt/osWcAyMjPlkoXX77kc6uaLG7040QV1VZ2LEXr6AK2pCKBby0n
   EcYywW4BsGOokAacZpngvVmM+2/FjKaXP8Hx0mv5KWIV1zR4IglpKnXPO
   cA3PFqN7oRtRieS2CHPsRS3OqZUWD6JOVDs+wiBJr9lzg2ewktIc6pQjh
   w==;
X-CSE-ConnectionGUID: 7jPAA8iwR5iGKUmysFlrJQ==
X-CSE-MsgGUID: pcqlaxJpSbWOm7mFarw7rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59828397"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="59828397"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:23:31 -0800
X-CSE-ConnectionGUID: vQx723pvSPSjcMOigqGs+g==
X-CSE-MsgGUID: Zav6ZIbtS/qpR7PCZT2oMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150331590"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Mar 2025 09:23:29 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqbPz-0000qp-0Y;
	Fri, 07 Mar 2025 17:23:27 +0000
Date: Sat, 8 Mar 2025 01:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: Fabio Estevam <festevam@denx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [linux-next:master 7648/9212]
 arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand@b8000000: Unevaluated
 properties are not allowed ('#address-cells', '#size-cells', 'clocks',
 'dma-names', 'dmas', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt'
 were unexpected)
Message-ID: <202503080116.F8e92Z9Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   565351ae7e0cee80e9b5ed84452a5b13644ffc4d
commit: 87b726bc79f109d8ef57e8bc32f05d4f24b7d297 [7648/9212] dt-bindings: mtd: mxc-nand: Document fsl,imx31-nand
config: arm-randconfig-051-20250305 (https://download.01.org/0day-ci/archive/20250308/202503080116.F8e92Z9Z-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080116.F8e92Z9Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080116.F8e92Z9Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: /interrupt-controller@68000000: failed to match any schema with compatible: ['fsl,imx31-avic', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: /soc/spba-bus@50000000/spi@50010000/pmic@0: failed to match any schema with compatible: ['fsl,mc13783']
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: efuse@5001c000: compatible: ['fsl,imx31-iim', 'fsl,imx27-iim'] is too long
   	from schema $id: http://devicetree.org/schemas/nvmem/imx-iim.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: emi@b8000000: $nodename:0: 'emi@b8000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand@b8000000: $nodename:0: 'nand@b8000000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand@b8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
>> arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand@b8000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'dma-names', 'dmas', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
