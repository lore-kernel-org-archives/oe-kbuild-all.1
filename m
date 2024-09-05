Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6152199245
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 08:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725524174; cv=none; b=B+tpIP5vcv7fL8et7413vM5wh9DOI4esiap+1CDFgSAYkaXorP6MD2Y0CLLV2dNVP9FzncvcL95N/yr0TUK62FDKd2RhsUS9148jZAZ1rDcAT0rcvUlGyOst3kQ19LbVE7v8olr3CjSiz0ky6hKylQvYKiPWShbvbbt/WHlVKnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725524174; c=relaxed/simple;
	bh=PHBv8T/BXyU/onGkMZKzoV+ArWPgFDbQadMR2yFw6Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AonSrQffP30lqlqMW1GU/Lnr4cE6WWaI3Ep/GUEgXnR+8DnEd4D/Z+sR9iUETdzhk10fj5qCZYPbq+EGdUFm3UpAv/HvcYEiTM0TOGpUU/ujrg6+ED36rL8ueiUxyBfWtJKcz9L3gPLvRgaMX7wVflAqaJEh/zzcLvOBeL+EdVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VGLw9fZq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGLw9fZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725524173; x=1757060173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PHBv8T/BXyU/onGkMZKzoV+ArWPgFDbQadMR2yFw6Wk=;
  b=VGLw9fZqqVpGhOUkk7yTF+6aHml83QdTU2busSX4pkwfJ8yHxDwRbxNQ
   wzpmhNHKodz97M2Ddk+Tk6E3kUzkupaSfyVqZplrZZ87Gk+v0h4Ik858s
   Wxsh7iaF9flAae5ar6J7nZH4+VrTglJN5X4A2ao6BiwlDBKOV2MNtdveA
   IBZQ/SHsMDZ3pvcuqg6Zb8gC64Z+oFMeq96+8X5Jn3SiuPlMmkM9v/wEu
   xicgUVM73BMS5hm9PBbyzZqUBI6OUWGINCEZl9bVxxn+CX57nynZgQWwf
   DirmDI5ImIaRDqtosh9220m8NTB4F1gSKVVkwQWp38xphEwUUOQgl4RZI
   A==;
X-CSE-ConnectionGUID: aNURL1cySHKknemX8JcG/w==
X-CSE-MsgGUID: HdLoequ1Rdmue8WrRHxSOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24383365"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="24383365"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 01:16:13 -0700
X-CSE-ConnectionGUID: RpSDSLW5QCi8kCh4H+SZug==
X-CSE-MsgGUID: zvBdt5SUTUGovdL4y2jMuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="65242340"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Sep 2024 01:16:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm7ey-00096U-0X;
	Thu, 05 Sep 2024 08:16:08 +0000
Date: Thu, 5 Sep 2024 16:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>, Marek Vasut <marex@denx.de>
Subject: [linux-next:master 5654/9291]
 arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: ads7846@0:
 interrupts: [[9], [25], [8]] is too long
Message-ID: <202409051648.f2zrWdet-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fdadd93817f124fd0ea6ef251d4a1068b7feceba
commit: 45d6486d2a5ad4310c1379071fc39d02d6784cbe [5654/9291] dt-bindings: input: touchscreen: convert ads7846.txt to yaml
config: arm-randconfig-052-20240902 (https://download.01.org/0day-ci/archive/20240905/202409051648.f2zrWdet-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051648.f2zrWdet-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051648.f2zrWdet-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /aitc-interrupt-controller@10040000: failed to match any schema with compatible: ['fsl,imx27-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: osc26m: compatible:0: 'fixed-clock' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: osc26m: compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10000000/dma@10001000: failed to match any schema with compatible: ['fsl,imx27-dma']
>> arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: ads7846@0: interrupts: [[9], [25], [8]] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml#
>> arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: ads7846@0: Unevaluated properties are not allowed ('interrupts', 'spi-cpol' were unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10000000/i2c@10012000/codec@1a: failed to match any schema with compatible: ['ti,tlv320aic23']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: nand-controller@d8000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: nand-controller@d8000000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
