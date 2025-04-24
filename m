Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C2D1F1927
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745525093; cv=none; b=BHYsYyLABrjkMC4vsA4y5OBQR2uj08bmoxqQS5Bp0UPP480bQbHC3MB3OBZ18HdBY/4ciyQnWiIC1V3OpwBGzG1K5ULxs9DudLGr6pAIsba/Ep3NvR0ED0OA3tB62bHpT0Ki7NkrAHMe2gLpxhs8Ws5+R4U92S9ymArVYFkZIg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745525093; c=relaxed/simple;
	bh=1IxjccQcqjQPehcAMugqgpAvlpGCkBZBTOT/c5qr/Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tUi88bcKHRZZ3y0pRhXdlUStUyNYToeGoGHz+wu/wpQirulQ+iK4OWls6XMuXXkisodY3q+qWBQS9MTf2GOMeOQd5RNv8AARCOAFJLryrLp2y7bSlC5aRzyQdCE1OhmtBHUE+p5XWJkNPUgHjr4erK2PWoPTsLy+TkGwBFwarYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huePkESi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huePkESi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745525092; x=1777061092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1IxjccQcqjQPehcAMugqgpAvlpGCkBZBTOT/c5qr/Wc=;
  b=huePkESiTfOjJNCoEMuYwXVypYHcPF+Hqzfu1aFjU/STx51knNMeczNe
   m5u/KKA4zRo6QRremc3v+Gnafw6KibNya64L+517puSQ7A+SXtu0q+TLD
   akFpZjUWebGImtK+JjZh0shlf+HfjeeJolp6iM2lbWD1n47ISzvycGzzR
   qZZ/6yhRBNkC+SpsoURytM09rmkiakAKsMzvi/Oq5PzX4LqW3h+HvwXFE
   alpesA/C7qEmeMfLlrctRGMmGM21KZa3kFJ+Brmt1bkAnL12JpgGQJT8W
   53p0FITtVw84qMb6vAaWAWfBz7ZOiagBQAaFbyWCf+W6xVcbGuKEBTpJ1
   w==;
X-CSE-ConnectionGUID: ci1WT0o8QKWFHL29dFQmMA==
X-CSE-MsgGUID: 0sAQNsdPSACUsx+89D3dgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50842774"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="50842774"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 13:04:49 -0700
X-CSE-ConnectionGUID: FctHoDgAQamGg2yblmZ98A==
X-CSE-MsgGUID: jaO/j8+WTOSrf0vmVDtZ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="132700398"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Apr 2025 13:04:47 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u82oP-0004Wx-18;
	Thu, 24 Apr 2025 20:04:45 +0000
Date: Fri, 25 Apr 2025 04:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 5696/6092]
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb:
 /soc/esdhc@1560000: failed to match any schema with compatible:
 ['fsl,ls1021a-esdhc', 'fsl,esdhc']
Message-ID: <202504250309.ijIGKnsm-lkp@intel.com>
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
commit: 8511c30d71e3c271283ea806f568036717cd9d4d [5696/6092] ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
config: arm-randconfig-051-20250424 (https://download.01.org/0day-ci/archive/20250425/202504250309.ijIGKnsm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250309.ijIGKnsm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250309.ijIGKnsm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): compatible:0: 'fsl,ls1021a-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: watchdog@2ad0000 (fsl,imx21-wdt): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: sai@2b50000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: sai@2b50000 (fsl,vf610-sai): Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: sai@2b60000 (fsl,vf610-sai): dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: ethernet@2d10000 (fsl,etsec2): queue-group@2d10000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: ethernet@2d10000 (fsl,etsec2): queue-group@2d14000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: ethernet@2d10000 (fsl,etsec2): Unevaluated properties are not allowed ('queue-group@2d10000', 'queue-group@2d14000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: ethernet@2d50000 (fsl,etsec2): queue-group@2d50000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtb: ethernet@2d50000 (fsl,etsec2): queue-group@2d54000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
