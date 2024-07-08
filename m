Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9699A934
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 02:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720407065; cv=none; b=j3tM3LIyVQgkqHRH8jOmumZGvIZAZO81vKNXwPjBmUz/TCEgStMfIrQffKKXDzVLB7Sue3p1H7et3BOolmIyhkmr+wey5EUxSWFq4bDAShk6M2XDY3Q3GTyFM2vAUOuPq/fHye2+JP0qTaCoOXH0TZRhY62CfXKjeIH+KHlxc+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720407065; c=relaxed/simple;
	bh=8U/KKNUgtZbIRxtxIbvDwEyZnFJGjzjyPQLqFISVrws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCED0dZ0lKx5WqTXOA4tP0E1Xx1/fZiZtn43jG++O3vIJnekKl6nuLpYatqbhuo10n22x+SQSM6xKuTqcZAyotm1GxGMRgsh8DZhx4RicB8WI3qwYl8VKZ9xfv6ULE6UW/pe8LIcUSRtZmIOXjNIjsES9LOfl9Um9V8S1pHoxy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ReSkdX7S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ReSkdX7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720407062; x=1751943062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8U/KKNUgtZbIRxtxIbvDwEyZnFJGjzjyPQLqFISVrws=;
  b=ReSkdX7SxgK2v7VKy+gzpFOefL4LPSzNoR4paY0TZKAX4fPy+/3RjFkS
   SG76rNFOC9F+yNlC4Duwcei4gIg0Obi8dSTJDZsC6N9CQdRJTljA+nLcv
   oAvX3XnUIGR17cARhuGZAb+yJglzLWzhB42liT5QF8vG/pkaI51ONgflt
   6VtNhYIQByZ/YXx69765dx4IebN5apWMWMHv22uuUg5KFEk8Kygvh+wQ7
   1JC6OJkiKJ6As2TbUmpOSgtp0JWUHWoEZd1dqL4QnYnnSOd2LPHEfTEKW
   pBKrpNATTn4JsaQqcwqv5BXMhbAi3T3FDG2E/LMNjWdDb0fZAJ6DyTL6c
   g==;
X-CSE-ConnectionGUID: HWZgB5nOQwCpfr3cia2Qkw==
X-CSE-MsgGUID: cpbUQNXnTdSOZ6/pDx/uKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="21462545"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="21462545"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 19:51:02 -0700
X-CSE-ConnectionGUID: xE7Fd/7QSc231D7jEp8GOw==
X-CSE-MsgGUID: 7FgtrYdLR369FzmA9Nrtxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="47252084"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jul 2024 19:51:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQeSw-000VSv-2L;
	Mon, 08 Jul 2024 02:50:58 +0000
Date: Mon, 8 Jul 2024 10:50:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9671/9748]
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: syscon@1e60000:
 compatible: ['syscon'] is too short
Message-ID: <202407081303.KkcTtwoD-lkp@intel.com>
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
commit: 2428f1f8c8fb6ed020c8d6acac8a30dcc0c99579 [9671/9748] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240708/202407081303.KkcTtwoD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407081303.KkcTtwoD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407081303.KkcTtwoD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/dma-controller@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/dma-controller@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/dma-controller@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/dma-controller@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/dma-controller@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/dma-controller@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/dma-controller@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/dma-controller@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/clock-controller@1300000: failed to match any schema with compatible: ['fsl,ls1028a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/dma-controller@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/dma-controller@8380000: failed to match any schema with compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000000/ethernet@0,6: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/ierb@1f0800000: failed to match any schema with compatible: ['fsl,ls1028a-enetc-ierb']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2800000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2810000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2820000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2830000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2840000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2850000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pwm@2860000: failed to match any schema with compatible: ['fsl,vf610-ftm-pwm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
