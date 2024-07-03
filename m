Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD9F17966C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720016880; cv=none; b=EFdD708nxcouqaiwndsPUXSNuT/eoTQwMYQXqQCCex5/UlS2hiBbL/f3gt+Rl71HQzUEdBwTRS96Mwe3f4RF1QMy/bJOXyegSxpLGDSGLENFEytGaaS0yVJ7jXuW2Z1u5/ORb9BEJQXECMowdILzdmTuI0L5u0vkz8WpHNP0n2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720016880; c=relaxed/simple;
	bh=y20MdQaDd7ZUt2zXD9NeiPb9gqRyU+p+EVHjjtNdcgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Goy4OQOUOmBsS9faU44LUNi1IBkup7h8/yUrtLaQ82sIDfILiIU69grS8sS2LwmLTiowRw20NlqFx71fQfOaLqQg7S5dVl0SRmCkvGAsb9fuyZzoaQN1XsZfgMHA9kwYkCucdV1rkBztkgwVYR1kxnd6lzUIxZN2BQdY4d95EmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRMpv8F3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRMpv8F3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720016878; x=1751552878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y20MdQaDd7ZUt2zXD9NeiPb9gqRyU+p+EVHjjtNdcgE=;
  b=hRMpv8F3lTND6dbrp1CTzsjPJ43UJWLemEnzuTsUh+ySbgAqniGVNzGy
   zDw87a0zVE516eU40fdjs/INQn6yGT+NBMWyH0dMKn9XxHOFy5fYWkKkY
   Xm1Ve6fAYkDYntovJxvE5UXoHvPvet829mqqZSr/A7aJX7+NkrXbou4nZ
   A9Fiku+WWlxqgc7TSgztAlg48S1yDpTqXj4NroQQdMWGbTwnMXslXj+LL
   l+Lr0nOW8o77KJlpVJQ2Xp4xi/rdsqPNareNOxqfbc2WtsqM2YBDDjhmX
   VjM5Gw7voztQs1ebDlRJVdmjujbdYe2V3c93FCOMr44/RJCnJaHuOjl9K
   Q==;
X-CSE-ConnectionGUID: IjGsUEtWTwuWFSigoBozNg==
X-CSE-MsgGUID: e7PDRJfRSOuiNNnYkmt6Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28387350"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="28387350"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 07:27:58 -0700
X-CSE-ConnectionGUID: HancOvnISqmA9SJOzeTD7g==
X-CSE-MsgGUID: 3Rks9b0sR+GDZl3mKRgSGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="69459233"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jul 2024 07:27:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sP0xd-000PqA-2s;
	Wed, 03 Jul 2024 14:27:53 +0000
Date: Wed, 3 Jul 2024 22:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 8736/9748]
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: watchdog@2ad0000:
 Unevaluated properties are not allowed ('big-endian' was unexpected)
Message-ID: <202407040022.ChwakxXg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 38397efe228326ab4f7928ee9e0c1f1f752d56a5 [8736/9748] arm64: dts: fsl-ls1043a: remove unused clk-name at watchdog node
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240704/202407040022.ChwakxXg-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407040022.ChwakxXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407040022.ChwakxXg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000: failed to match any schema with compatible: ['fsl,qe', 'simple-bus']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/qeic@80: failed to match any schema with compatible: ['fsl,qe-ic']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/si@700: failed to match any schema with compatible: ['fsl,ls1043-qe-si', 'fsl,t1040-qe-si']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/si@700: failed to match any schema with compatible: ['fsl,ls1043-qe-si', 'fsl,t1040-qe-si']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/siram@1000: failed to match any schema with compatible: ['fsl,ls1043-qe-siram', 'fsl,t1040-qe-siram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/siram@1000: failed to match any schema with compatible: ['fsl,ls1043-qe-siram', 'fsl,t1040-qe-siram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/aux-bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/msi-controller1@1571000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/msi-controller2@1572000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/msi-controller3@1573000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3400000: fsl,pcie-scfg:0: [23, 0] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/qeic@80: failed to match any schema with compatible: ['fsl,qe-ic']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/si@700: failed to match any schema with compatible: ['fsl,ls1043-qe-si', 'fsl,t1040-qe-si']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/si@700: failed to match any schema with compatible: ['fsl,ls1043-qe-si', 'fsl,t1040-qe-si']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/siram@1000: failed to match any schema with compatible: ['fsl,ls1043-qe-siram', 'fsl,t1040-qe-siram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/siram@1000: failed to match any schema with compatible: ['fsl,ls1043-qe-siram', 'fsl,t1040-qe-siram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/aux-bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/msi-controller1@1571000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/msi-controller2@1572000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/msi-controller3@1573000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3400000: fsl,pcie-scfg:0: [22, 0] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000: failed to match any schema with compatible: ['fsl,qe', 'simple-bus']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/qeic@80: failed to match any schema with compatible: ['fsl,qe-ic']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/si@700: failed to match any schema with compatible: ['fsl,ls1043-qe-si', 'fsl,t1040-qe-si']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/si@700: failed to match any schema with compatible: ['fsl,ls1043-qe-si', 'fsl,t1040-qe-si']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/siram@1000: failed to match any schema with compatible: ['fsl,ls1043-qe-siram', 'fsl,t1040-qe-siram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/siram@1000: failed to match any schema with compatible: ['fsl,ls1043-qe-siram', 'fsl,t1040-qe-siram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/aux-bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/msi-controller1@1571000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/msi-controller2@1572000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/msi-controller3@1573000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3400000: fsl,pcie-scfg:0: [25, 0] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
