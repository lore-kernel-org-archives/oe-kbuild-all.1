Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7A31C4609
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 22:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729548776; cv=none; b=KCC9eULAuLPYW+3YGU9MAqF1TY4e8h5v6tkJ8/fv5mGpenZVsTYZY9K42p1abmpdP5C6Byg7wliOKLB5X1qKU8t80Oy4APTPRwXWAreqg1Spy2jVDwhA6ENznOhVxNclEHtapKfvOTA6IvWBvOSMxEUbcDzmpOczCVcEYQlYLXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729548776; c=relaxed/simple;
	bh=DTxauqUbAnrqGV918OBLOYUmz/yxADJYovhJk1psKnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OeD2suBj1gDnioeI+URa6pcZtW7ZDFwiabcU9qLluMpHpPHKnRHfZXQTNM+XpNORLe2iDXWZVmIQUTnyawhB9iOtQ07rfNeOZxuUE4moxSDIgGfFt+j2VY3iMYo0o1K1g5t4OV/8WffZJK7sl9BHeHBzTWEltUnPXpvRAf29Mzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUblqh7V; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUblqh7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729548775; x=1761084775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DTxauqUbAnrqGV918OBLOYUmz/yxADJYovhJk1psKnw=;
  b=eUblqh7V1ZRNPIszw24e+BqKa6CVDmYNvLO0wW3eUvsl5YjYhHVeT7iN
   5i6fRUbEc0cJB02/GETyZVvQMVjlomUoJLjZpBuyWmVXMXo43BhEztpUz
   1TGQuCoGpaAI05oKmtkg5ljWJwiXE+cWl8P7bW/ewBvywFNEEJ/itoK/+
   4qxyNuoDVsV0e0fGy87meQM731yGqVhuiY9IdMTdpXFll3gaOwd3nh94C
   nelTK31kRW9z7NwdeEsLSQY/tn2Lhy3ZwFM6vKiEi78yhntjxKsJAQm0Z
   +XZ2w3pUVj8Ttj3frfiO4o73H62So1Jgi2O2Knaui68Jr3Pxf+tjuWOJn
   w==;
X-CSE-ConnectionGUID: szyABPPaTO6GLHm7GWVaaA==
X-CSE-MsgGUID: nNoPOGjGQBWrCKjSg203dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46524582"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46524582"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 15:12:54 -0700
X-CSE-ConnectionGUID: sKtwBAGcRM2866i249hysg==
X-CSE-MsgGUID: upn7GMAGRtSNV+gFasEDSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79593437"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Oct 2024 15:12:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t30du-000SgA-0H;
	Mon, 21 Oct 2024 22:12:50 +0000
Date: Tue, 22 Oct 2024 06:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Fabio Estevam <festevam@denx.de>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 4743/5686]
 arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /ldb: failed to match any schema
 with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
Message-ID: <202410220602.WnWrz1yk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
commit: 178edf156657a783c5be19ea01e73ec4c259e6a4 [4743/5686] ARM: dts: imx6q-lxr: Add board support
config: arm-randconfig-053-20241017 (https://download.01.org/0day-ci/archive/20241022/202410220602.WnWrz1yk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410220602.WnWrz1yk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410220602.WnWrz1yk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'phytec,imx6ul-pcl063' was expected
   	'phytec,imx6ull-pcl063' was expected
   	'fsl,imx6ulz' was expected
   	'toradex,verdin-imx8mm' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'fsl,imx6q' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /: failed to match any schema with compatible: ['comvetia,imx6q-lxr', 'phytec,imx6q-pfla02', 'fsl,imx6q']
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: nand-controller@112000: Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: nand-controller@112000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: nand-controller@112000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: nand-controller@112000: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: nand-controller@112000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6q-iomuxc']
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
>> arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /spi/fpga@0: failed to match any schema with compatible: ['altr,fpga-passive-serial']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
