Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B50935979
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 23:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770850835; cv=none; b=V2E99mzPvm+yrM8RS8WnjL/HCsnjsin0K+jRgXbggOXuowH1UP2TWVs+0ZtBINoZrlYwvah2JhdUxjhqjUDEH3a9DAGC5OsQg35nrv6yQdPKMJCwlGIllTrK4/HkC10IqEWtBoDptygFTZ9zbbeb0zo/rVltCZdY1OzDUI1GOjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770850835; c=relaxed/simple;
	bh=g3UmgeJ7pRIP+ltNPJyycVNzzaEKsXvtU/rO1Qy2zo8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qecbFTEpt3fTHLV1a1tt6maT7jhxt9aZmDlbvZHn2gVUf5Ru+smMwl3jkCI6egNxNR3W3GOc6LQ2s1vaw0urbqLH9d9TQz2paShyWXAeSfc/QF7ZLkDq1pl5OjncZ600Tc5F9W0X5sHLYmLd0CTUU8dxjrdt0dfAAaoFpF/EBFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/1Myotb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/1Myotb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770850832; x=1802386832;
  h=date:from:to:cc:subject:message-id;
  bh=g3UmgeJ7pRIP+ltNPJyycVNzzaEKsXvtU/rO1Qy2zo8=;
  b=K/1MyotbW7EFJ6cqA+l6t67OPLjFZBMtCK5C+Aqp9jpDD89P/ol0Bua9
   OmRYTLT0rzXOhRZW6WB0L5Kqf3omEOKPciG1Fns42Ni1JCkPOb067ZEvc
   MlnlbFPLYG95f5Oc1HWYiE9tVezgyYv6kUbqVVTGilM/DE1fnyCZF2/h3
   PIB20xrYWSpcovU+znJLEiBsAa5liG0hBBgP6NShsosCvOvnMhzaDYfhB
   3DzRAxeGw5TMYpUHLBoQJHm+4QD7ji9j/nBF+/eQX8bW2QQhvkAbJVAO2
   RdKQSLhkLvIV6z9Cg74CU2hopXuOSPW/H2Zn1t71XQIFRCqYa7djvJqOd
   Q==;
X-CSE-ConnectionGUID: tWLFp2s5TYGh7aP2E3d9lw==
X-CSE-MsgGUID: aK4KDInGR0OM0rraLGQnsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="82647479"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="82647479"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 15:00:32 -0800
X-CSE-ConnectionGUID: 6Rsib2csTZ+y2nV6b/ykEg==
X-CSE-MsgGUID: 82Wwy1XeQmyZ6qxSXj5Y4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216644794"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Feb 2026 15:00:30 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqJC8-000000001Bp-1pPw;
	Wed, 11 Feb 2026 23:00:28 +0000
Date: Thu, 12 Feb 2026 00:00:11 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 12089/12577]
 arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: emi@80000000
 (fsl,emi): $nodename:0: 'emi@80000000' does not match
 '^((spba|emi)-bus|bus)(@[0-9a-f]+)?$'
Message-ID: <202602112338.NPpkQRWQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9152bc8cebcb14dc16b03ec81f2377ee8ce12268
commit: 55d43aab478db869f57281e947020605f9ff6b16 [12089/12577] dt-bindings: soc: imx: add fsl,aips and fsl,emi compatible strings
config: arm-randconfig-2051-20260210 (https://download.01.org/0day-ci/archive/20260211/202602112338.NPpkQRWQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602112338.NPpkQRWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602112338.NPpkQRWQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: /avic-interrupt-controller@68000000: failed to match any schema with compatible: ['fsl,imx35-avic', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: i2c@43f80000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: /soc/bus@43f00000/i2c@43f80000/codec@1a: failed to match any schema with compatible: ['ti,tlv320aic23']
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: i2c@43f84000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: i2c@43f98000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: emi@80000000 (fsl,emi): $nodename:0: 'emi@80000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: emi@80000000 (fsl,emi): $nodename:0: 'emi@80000000' does not match '^((spba|emi)-bus|bus)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/fsl,spba-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: /soc/emi@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx35-nand', 'fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: /soc/emi@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx35-nand', 'fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: nand-controller@bb000000 (fsl,imx35-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): usb-phy@0:reg:0: [0] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): usb-phy@1:reg:0: [1] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): #size-cells: 0 is not one of [1, 2]
--
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: /avic-interrupt-controller@68000000: failed to match any schema with compatible: ['fsl,imx35-avic', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: /avic-interrupt-controller@68000000: failed to match any schema with compatible: ['fsl,imx35-avic', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: i2c@43f80000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: i2c@43f84000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: i2c@43f98000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: emi@80000000 (fsl,emi): $nodename:0: 'emi@80000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: emi@80000000 (fsl,emi): $nodename:0: 'emi@80000000' does not match '^((spba|emi)-bus|bus)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/fsl,spba-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: /soc/emi@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx35-nand', 'fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: /soc/emi@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx35-nand', 'fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): usb-phy@0:reg:0: [0] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): usb-phy@1:reg:0: [1] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): #size-cells: 0 is not one of [1, 2]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
