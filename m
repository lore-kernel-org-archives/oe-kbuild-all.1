Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304CA3D388
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 02:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720492143; cv=none; b=q2BSFrU/0XgdTIEs6dL6ZiC+a0UN9MylDof0zbdZVW1jwrK7k0orah3EdD7Ny++RqM98fj1lWZKrUVAlmg8XLPq4fnJdkI4ufy90JZmWu3eBXJBT5Y5fUWXLxcbABJ02V928ZD38d4Q+L5p9gjHulvib5CyiWekO8Q/zJQLHR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720492143; c=relaxed/simple;
	bh=zEX2x2erOcshEdmBpwrOhy52cR42vvtzW0uihO2nTyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YT23lz2hg2jLfCuHhfy7mgmghk5Whuvxbo6H0pXHmQkJuLX39QDcXbpmpNPAXus4bYmqmFfdYNxbVLJXBY4D33cXytgb5yF41p81MaZxLG+8KXzDja0MfI4ojIBQIwku8ALSjDGfYkRdRw1STLeVkhWk3mPHLR/k7awqKGSaXj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dD5SHSpI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dD5SHSpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720492141; x=1752028141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zEX2x2erOcshEdmBpwrOhy52cR42vvtzW0uihO2nTyo=;
  b=dD5SHSpIpJ0z0t2jsh+FIVOMjY+BPAEd9E190zsVl67axyxP5TnNiWC8
   WF7fTPIpnDMUtTnPwxwVL+fPOgEaCh0eklRYsf4HLzBkOdPl4Sz0F/nJM
   sIeLYqOYYj4QjAN3wIE9bxkEyweXM/vywGb7H5OlV71bFD0FLTI/lPUPj
   DZ42AqFmIW0yTj17iYXzpZ75B5VIJMu4G3HAfACYqobdkN4ENSXzF3BK4
   3zQ2FniZ8UY1S7TZUGI/svPfJrp1E0N4N88gAXZ44ptNWlBryIqibUyw0
   JdKHfbG0v+heBLzSi6Vq5POSa5TFZWaBVIBZvpzTsCjrEXAKw4wfXSs00
   Q==;
X-CSE-ConnectionGUID: zGY7TyXORi2Js1gM03W0Lw==
X-CSE-MsgGUID: mWiqEt6uQeqmTXTyohzC2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28390432"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="28390432"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 19:28:58 -0700
X-CSE-ConnectionGUID: y4Y+Hz9hTUyV7TG3ImUXJw==
X-CSE-MsgGUID: Ty5Fq8H0RbaFW4JxeSVs0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="52883716"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jul 2024 19:28:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR0b8-000WFa-0c;
	Tue, 09 Jul 2024 02:28:54 +0000
Date: Tue, 9 Jul 2024 10:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9709/9748]
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb:
 dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma']
 is too long
Message-ID: <202407091224.6asFI157-lkp@intel.com>
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
commit: 1398b62bb3324e9f6cc7d410147fdea8f22bc6b1 [9709/9748] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240709/202407091224.6asFI157-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091224.6asFI157-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091224.6asFI157-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1028a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: dma-controller@8380000: interrupts: [[0, 43, 4], [0, 251, 4], [0, 252, 4], [0, 253, 4], [0, 254, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: dma-controller@8380000: interrupt-names: ['qdma-error', 'qdma-queue0', 'qdma-queue1', 'qdma-queue2', 'qdma-queue3'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: dma-controller@8380000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000000/ethernet@0,0: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000000/ethernet@0,1: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000000/ethernet@0,2: failed to match any schema with compatible: ['pci1957,e100', 'fsl,enetc']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/pcie@1f0000000/mdio@0,3: failed to match any schema with compatible: ['pci1957,ee01', 'fsl,enetc-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
