Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB6716E880
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724077610; cv=none; b=e+liQ8+PCOTJLzBMsXeYE7OX673t3b/pqwX8A0gLYnYaiqZjlBhVEspxeXmIDwgw1hXGfAYj/nqEx8+TS4kuRZhtIjObFu63J2V1N7Zvj4p3vi2CGFm8WOhfY/jKW/vTkWHdf8SWTqe0hHaiWFfUP0i4Rn0G0RlGKsw45mTLws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724077610; c=relaxed/simple;
	bh=NI5xdmS8V1aYefVOUAC8UAskIH0ap2lyV2qc7dQe/gk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BKg18E64Fdu4WARNvUYuFiNl1/qGl89ZJHH4tuHFwNFFubZRAJ5s4yOPV09zlW0lVRdFXpga9y0kCWjpmyFhIAj/3RU7sZl64G0ytZcOposajg4K5o/m06Vv5hOjlkfFQYGqrM9yKKqXVreRz7VBQa9xIlGLD1Yt9U+nlOUUTJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I88Y7+HG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I88Y7+HG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724077608; x=1755613608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NI5xdmS8V1aYefVOUAC8UAskIH0ap2lyV2qc7dQe/gk=;
  b=I88Y7+HGX3V+Wewsf43CdIZPbX+aWAVycQ7ZSX1xa4q1Zv8angPOH74J
   jtuVdSBAThUEvXYzXegaQxSItl8izi6Iy1/oTd3vfbaESLp88kjARok3B
   iQCYrx+sRIquWvcsUqHbkkCAQiPyar/VMtUc86NtOsDIzMyciisyd48Wf
   jU8c9wvDOcLHllipkY6wSFDelnUrGwBCVDZ3FDyyLJlS6S+t4FZC8Wnnt
   I3JqLMpUqCjstq08uL3oRLum9o5U/pODrkhtRae9+pY4pmaQ1Cebweyse
   2IGhByjlf8MDEbhrEjjvOjDUa0P0zLUQBbYa8zbFNivVy2DgSylq1FEmU
   g==;
X-CSE-ConnectionGUID: 0qHsZaMOQ3K9ajthAOFlVw==
X-CSE-MsgGUID: zey7yl21ShW2ABHzAKYd9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21873501"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="21873501"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 07:26:47 -0700
X-CSE-ConnectionGUID: vAdTpRkERPmHlnK1GK0zAA==
X-CSE-MsgGUID: nQgDHCc/SbyhTf+U1G8Jlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="65349943"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Aug 2024 07:26:46 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg3LH-00093m-1e;
	Mon, 19 Aug 2024 14:26:43 +0000
Date: Mon, 19 Aug 2024 22:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4491/5342]
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: board-control@2,0:
 'mdio-mux-emi1@54' does not match any of the regexes:
 '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
Message-ID: <202408192224.sWpHRsFA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   469f1bad3c1c6e268059f78c0eec7e9552b3894c
commit: bead0f11ea00e2e557f0c52a55cd77ebd96d9daf [4491/5342] dt-bindings: board: convert fsl-board.txt to yaml
config: arm64-randconfig-054-20240819 (https://download.01.org/0day-ci/archive/20240819/202408192224.sWpHRsFA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408192224.sWpHRsFA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408192224.sWpHRsFA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: thermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/memory-controller@1530000/nand@1,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: board-control@2,0: 'mdio-mux-emi1@54' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: mdio-mux-emi1@54: mdio@20:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: mdio-mux-emi1@54: mdio@40:reg:0:0: 64 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: mdio-mux-emi1@54: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: mdio-mux-emi1@54: mdio@80:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: mdio-mux-emi1@54: mdio@a0:reg:0:0: 160 is greater than the maximum of 31
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts:240.16-329.4: Warning (unit_address_vs_reg): /soc/memory-controller@1530000/board-control@2,0/mdio-mux-emi1: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: thermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/memory-controller@1530000/nand@1,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: board-control@2,0: 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: mdio-mux-emi1: mdio@1:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: mdio-mux-emi1: mdio@2:reg:0:0: 64 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: mdio-mux-emi1: mdio@3:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: mdio-mux-emi1: mdio@5:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: mmc@1560000: Unevaluated properties are not allowed ('big-endian' was unexpected)
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: board-control@3,0: 'mdio-mux-emi1@54' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: mdio-mux-emi1@54: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: pcie@3400000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: pcie@3500000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: pcie@3600000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: pcie@3700000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: board-control@3,0: 'mdio-mux-emi1@54' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: mdio-mux-emi1@54: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
