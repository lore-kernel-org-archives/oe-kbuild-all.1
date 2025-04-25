Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FDF1DC9AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 17:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745600923; cv=none; b=s+8gTEi9OyuvNDZoXOs/JBJEBqf27UHAmtbee4ctOq0l3+L5FmtWnqF6iT70DORAiKktRO92vpfOS6Byg5eOjDZQjqFlAxHra8DeBot3maGusdU4wXqmWARRRFeQplKSAzpKK6wJBZ5pXFdt8vRRRIhP0dmIrj2nqBkKRPsVFsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745600923; c=relaxed/simple;
	bh=6DTY4CY+bH8HAntddKTFA83YrQ1YgFJbzXu9/pH4fjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NwrQdoyCc1XOBlxQkj5UpDG7uFqhJWd4btcKtNLYDbSHe8iZ9/Kp5s18hg2YbrK0k5o5d9/zC+1B3B8aCpV4I4+VdoPAA3LUaT7AzwrTyGYjlN9+9FKpxZ0rCL34GyDqdUlCJ5C/aVwq0z0pp6p/b4mzWAVdM1JvI68gpQ8h2P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4gzt1aX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4gzt1aX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745600919; x=1777136919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6DTY4CY+bH8HAntddKTFA83YrQ1YgFJbzXu9/pH4fjM=;
  b=W4gzt1aX5ymwNKutxOKCtBRIJwMssTzTJ1bFFYx6rIcsaARW7ITrgKVl
   W1yGLJcyHJ9VD11t7ivAuizldk9ZwYhf4XXQJb8ROQ70dmeiNJlnsnLFU
   3SFqKNK3ZuDDzh4BFYbxMZP2qTQ+9mRbeXUPUHaEVILgdL4ZLA+CtPD22
   zDX3lBee0bxit3h2anl6uPOqNSlB8uHlqXSEYBTde7gB2EonixOzO2uJR
   f7kWAR0F4WtpXPT3SWjYNd4sCWW2xrfaNwr+J/+a4dZPSpLDKi33Z6oYZ
   0EV8rM1bB4s/QfRlc15Cgrhs+czRQCHemSeAsiduczFe+EcMphOsmeE0E
   A==;
X-CSE-ConnectionGUID: yDhGDzPbTF+CtKtp0rdkzA==
X-CSE-MsgGUID: ro7Bmk9ZSL6u/x2bvyw+fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="34885679"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="34885679"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 10:08:39 -0700
X-CSE-ConnectionGUID: dxR0JT2FS4CNam6iYjTAmg==
X-CSE-MsgGUID: RwqawZZ3RKqta8NMmPTNwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133481208"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Apr 2025 10:08:38 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8MXS-0005Nb-2B;
	Fri, 25 Apr 2025 17:08:34 +0000
Date: Sat, 26 Apr 2025 01:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 5698/6092]
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb:
 /soc/esdhc@1560000: failed to match any schema with compatible:
 ['fsl,ls1021a-esdhc', 'fsl,esdhc']
Message-ID: <202504260133.0z8cLH5H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   393d0c54cae31317deaa9043320c5fd9454deabc
commit: 43db162d0cf659034be36bb4c0062c350b77fda8 [5698/6092] ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
config: arm-randconfig-051-20250424 (https://download.01.org/0day-ci/archive/20250426/202504260133.0z8cLH5H-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504260133.0z8cLH5H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504260133.0z8cLH5H-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): compatible:0: 'fsl,ls1021a-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: touchscreen@38 (edt,edt-ft5406): compatible: ['edt,edt-ft5406', 'edt,edt-ft5x06'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: /soc/i2c@2180000/touchscreen@38: failed to match any schema with compatible: ['edt,edt-ft5406', 'edt,edt-ft5x06']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: sai@2b50000 (fsl,vf610-sai): Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: sai@2b60000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: ethernet@2d10000 (fsl,etsec2): queue-group@2d10000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: ethernet@2d10000 (fsl,etsec2): queue-group@2d14000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: ethernet@2d10000 (fsl,etsec2): Unevaluated properties are not allowed ('queue-group@2d10000', 'queue-group@2d14000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: ethernet@2d50000 (fsl,etsec2): queue-group@2d50000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: ethernet@2d50000 (fsl,etsec2): queue-group@2d54000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
