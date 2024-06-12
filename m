Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918CD28DB3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 17:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718213589; cv=none; b=KiLKiR3Mx1LOZC0C/pg9HGMyzb4tedJVJMWxm1/VLZyrZ3AwMP7Nabt1At3HaFiM0FcgnRdP33U1EnyyuVzxBSQENgzjy1GkovuEGDJ3nQpppI3Q4fwRRWwd/byuODmjrTnUFHZIfyHi/Yf69SgFkcvsn+rtVlxdRcvrQbpWL2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718213589; c=relaxed/simple;
	bh=Ncm9R9FLqySrRdNKFpf35i+x5Ohwb45wv0NciUtpJQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hp5+Peuy5PBYmmbsKtDu2ndrKgy4zD5u/YIQKGVBa3wfCn4LMDOOqEZoxmn2cHVzgZW8mDlZPNMx1ejpnR5nB7yxKw2Y5+nY617snwyznnQbowc2Fg0W/j3vEeIP86BHvIxBiXVhnRh5CjOrnInz4EufaX5/YMA6dMOtHI2/Ve4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUrRTi/T; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUrRTi/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718213585; x=1749749585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ncm9R9FLqySrRdNKFpf35i+x5Ohwb45wv0NciUtpJQc=;
  b=BUrRTi/TleiIDVqyel/guhywaR0rix0z0Hu+pe2GbAVJvXfzdOO0B5/J
   8rsswHNrTpEzOIUgw+suwTXHd04DitAzTXn84qDdQysrWdUOPLV7s2qPr
   cti5dQPXEDgoj9VbrWT0ORCuKHDC1XzV3AP+kGDOrVJHgWbUKGtq9YRo0
   6ErMdQlQVpvLvHE6UP4yR06lDVNw1PKT5IqOMTKogy6kiXo/bEaITGRvU
   mE6A0NeOuuqJkCxLJnf2/7NWHSYMjAOHSBD7jbgk2xkXy8EaU91ac7Igm
   EY58PBkyylwFcGDCPv9mHqSFVNH3u/WiwPSpSgnF1D1mva2CVUF6vuG/Z
   Q==;
X-CSE-ConnectionGUID: SBbvV5LNTcmg+2XRqc3Dvg==
X-CSE-MsgGUID: Yps5V/2QTLq09IaNSSMVRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15148230"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="15148230"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 10:33:04 -0700
X-CSE-ConnectionGUID: GGpewNS9RuKf0hiZKamLCQ==
X-CSE-MsgGUID: pCcBohpMTmOor+OS/t2n+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="44255984"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2024 10:33:02 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHRqG-0001m6-1f;
	Wed, 12 Jun 2024 17:33:00 +0000
Date: Thu, 13 Jun 2024 01:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 4878/5129]
 arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb:
 dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma']
 is too long
Message-ID: <202406130139.TV8i316r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   03d44168cbd7fc57d5de56a3730427db758fc7f6
commit: 671bc17fc4d14fed69ee86e1f7c2c972010c49ac [4878/5129] dt-bindings: fsl-qdma: Convert to yaml format
config: arm64-randconfig-051-20240612 (https://download.01.org/0day-ci/archive/20240613/202406130139.TV8i316r-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130139.TV8i316r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130139.TV8i316r-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: pcie-ep@3400000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: pcie-ep@3500000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: audio-controller@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: audio-controller@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: audio-controller@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: audio-controller@f130000: dma-names:1: 'tx' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: pcie-ep@3400000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: pcie-ep@3500000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: audio-controller@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: audio-controller@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: audio-controller@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: audio-controller@f130000: dma-names:1: 'tx' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: pcie-ep@3400000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: pcie-ep@3500000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: audio-controller@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: audio-controller@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: audio-controller@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: audio-controller@f130000: dma-names:1: 'tx' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: pcie-ep@3400000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: pcie-ep@3500000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: audio-controller@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: audio-controller@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: audio-controller@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: audio-controller@f130000: dma-names:1: 'tx' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: pcie-ep@3400000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: pcie-ep@3500000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: audio-controller@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: audio-controller@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: audio-controller@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: audio-controller@f130000: dma-names:1: 'tx' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: pcie-ep@3400000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: pcie-ep@3500000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: audio-controller@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: audio-controller@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: audio-controller@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: audio-controller@f130000: dma-names:1: 'tx' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: pcie-ep@3400000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: pcie-ep@3500000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: audio-controller@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: audio-controller@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: audio-controller@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: audio-controller@f130000: dma-names:1: 'tx' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: pcie-ep@3400000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: pcie-ep@3500000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: audio-controller@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: audio-controller@f100000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: audio-controller@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: audio-controller@f120000: dma-names:1: 'tx' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1028a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: pcie-ep@3400000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: pcie-ep@3500000: compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1028a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: audio-controller@f100000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: audio-controller@f110000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: audio-controller@f120000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: audio-controller@f130000: dma-names:1: 'tx' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/aux_bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/msi-controller1@1571000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/msi-controller2@1572000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/msi-controller3@1573000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3400000: fsl,pcie-scfg:0: [23, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3500000: fsl,pcie-scfg:0: [23, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3600000: fsl,pcie-scfg:0: [23, 2] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000: compatible: ['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/timer@29d0000: failed to match any schema with compatible: ['fsl,ls1043a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/fman@1a00000: failed to match any schema with compatible: ['fsl,fman']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/fman@1a00000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/aux_bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/msi-controller1@1571000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/msi-controller2@1572000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/msi-controller3@1573000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3400000: fsl,pcie-scfg:0: [22, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3500000: fsl,pcie-scfg:0: [22, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3600000: fsl,pcie-scfg:0: [22, 2] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: compatible: ['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/timer@29d0000: failed to match any schema with compatible: ['fsl,ls1043a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/fman@1a00000: failed to match any schema with compatible: ['fsl,fman']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/fman@1a00000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/aux_bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/msi-controller1@1571000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/msi-controller2@1572000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/msi-controller3@1573000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3400000: fsl,pcie-scfg:0: [25, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3500000: fsl,pcie-scfg:0: [25, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3600000: fsl,pcie-scfg:0: [25, 2] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: dma-controller@8380000: compatible: ['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/timer@29d0000: failed to match any schema with compatible: ['fsl,ls1043a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/fman@1a00000: failed to match any schema with compatible: ['fsl,fman']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/fman@1a00000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: pcie_ep@3500000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/pcie_ep@3500000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: pcie@3600000: interrupt-names:0: 'pme' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: pcie@3600000: interrupt-names:1: 'aer' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: pcie_ep@3600000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/pcie_ep@3600000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: dma-controller@8380000: compatible: ['fsl,ls1046a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/timer@29d0000: failed to match any schema with compatible: ['fsl,ls1046a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/fman@1a00000: failed to match any schema with compatible: ['fsl,fman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/fman@1a00000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: pcie_ep@3500000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/pcie_ep@3500000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: pcie@3600000: interrupt-names:0: 'pme' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: pcie@3600000: interrupt-names:1: 'aer' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: pcie_ep@3600000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/pcie_ep@3600000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: dma-controller@8380000: compatible: ['fsl,ls1046a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/timer@29d0000: failed to match any schema with compatible: ['fsl,ls1046a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/fman@1a00000: failed to match any schema with compatible: ['fsl,fman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/fman@1a00000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: pcie_ep@3500000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/pcie_ep@3500000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: pcie@3600000: interrupt-names:0: 'pme' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: pcie@3600000: interrupt-names:1: 'aer' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: pcie_ep@3600000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/pcie_ep@3600000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: dma-controller@8380000: compatible: ['fsl,ls1046a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/timer@29d0000: failed to match any schema with compatible: ['fsl,ls1046a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/fman@1a00000: failed to match any schema with compatible: ['fsl,fman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/fman@1a00000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: pcie_ep@3500000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/pcie_ep@3500000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: pcie@3600000: interrupt-names:0: 'pme' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: pcie@3600000: interrupt-names:1: 'aer' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: pcie_ep@3600000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/pcie_ep@3600000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: dma-controller@8380000: compatible: ['fsl,ls1046a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: dma-controller@8380000: interrupts: [[0, 153, 4], [0, 39, 4], [0, 40, 4], [0, 41, 4], [0, 42, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: dma-controller@8380000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/timer@29d0000: failed to match any schema with compatible: ['fsl,ls1046a-ftm-alarm']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/fman@1a00000: failed to match any schema with compatible: ['fsl,fman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/fman@1a00000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
