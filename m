Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE3AD2E5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 02:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723084477; cv=none; b=V3DDEVBnugi9woBbTv63eWUrAZ/0TCvOUimUwUpNeO9GqUZLE8twnyKQKLMwpoEVw8auI6E/aIPmkamaBcRYI0+9W3PPfslEJTDKgK/jkkB7g3HsxmEAjcC+xnA26pKCcL88rVHbj4xz7O0oXmIWZZMKzGHThb9mC/zC/dvVuTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723084477; c=relaxed/simple;
	bh=Ar9HBjGsVBA3jGqJLM0zPc3wnhkGQuVPqNpP9JzviHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jY3iCQwjA9B1pbrD9yEMJ8UxBom6Tc/gbW6ZhqI80uegqOVSP8crS1rbk1X3cexKqp6+Yi2Ysr7T6AEGeMW6ZdXb8CWTQeK/3Pum37PlDL4GazR+6fp0Y0/aI7YQdVdBV5PF5xB+WTM8/RuR7puDc7KwJhrMgVX/oR+ezwuiEnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mo27BBDK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mo27BBDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723084474; x=1754620474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ar9HBjGsVBA3jGqJLM0zPc3wnhkGQuVPqNpP9JzviHI=;
  b=mo27BBDKuiHAGgvrWygW5sefjWk3yQalGgYGRA/ndlhU8JfRNqzc/ZOx
   9DSIom+DonuQgtOEDY+1tIj+16RMARlEyVQH1FFdWuV83ldu69VgNUj3t
   KJaCLHyylptJ0pbwQBv4ZLJCJV4Am8uNZ7aQWxH5OBpqIvaELGXxJ6p0p
   2Fbj/XRHjKcHAf2HrpswXOmhWuA/mwxsbFhm16KEaWRU8UIo1/Cg7WWgG
   AFlN5zimFM6/8K+hqCBi6OHRbxIj44DQ0zervPoMcNz6KRa+o+pnLFPx+
   47/KM+Ek6vfDcJs4i5Vq4FoaAzihqUjn5oBxr+C080+NgXSZu+As0RFjr
   A==;
X-CSE-ConnectionGUID: 35fOm38xRiWjsFXCHDx/aQ==
X-CSE-MsgGUID: t5chi3TrRwOYcpVx6gxicQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32579735"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="32579735"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 19:34:32 -0700
X-CSE-ConnectionGUID: AvAuPvgFRCyOBBqYnclaSw==
X-CSE-MsgGUID: UWAvyQG2QJWLtQJGr65t/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="61719132"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Aug 2024 19:34:30 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbsyy-0005rw-03;
	Thu, 08 Aug 2024 02:34:28 +0000
Date: Thu, 8 Aug 2024 10:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 3358/3555]
 arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: syscon@1f70000:
 interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1,
 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0,
 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0,...
Message-ID: <202408081025.H4zz2NT4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eec5d86d5bac6b3e972eb9c1898af3c08303c52d
commit: 4e354cce395f64001e054a41769ddaaef2efe3b4 [3358/3555] dt-bindings: soc: fsl: add missed compatible string fsl,ls*-isc
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240808/202408081025.H4zz2NT4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081025.H4zz2NT4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408081025.H4zz2NT4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: thermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls1088aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls1088aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: thermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/memory-controller@2240000/nand@0,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/memory-controller@2240000/board-control@2,0: failed to match any schema with compatible: ['fsl,ls1088ardb-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/memory-controller@2240000/board-control@2,0: failed to match any schema with compatible: ['fsl,ls1088ardb-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts:287.19-336.4: Warning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts:338.16-378.4: Warning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: thermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: gpio@76: 'admin_led_lower' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: admin_led_lower: $nodename:0: 'admin_led_lower' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: flash@0: partitions: Unevaluated properties are not allowed ('partition@5C0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: flash@0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'partitions' were unexpected)
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi:17.19-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: thermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: pcie-ep@3600000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls208xaqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls208xaqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: mdio-mux-emi1@54: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: pcie@3400000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/memory-controller@2240000/cpld@3,0: failed to match any schema with compatible: ['fsl,ls2080aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/memory-controller@2240000/cpld@3,0: failed to match any schema with compatible: ['fsl,ls2080aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: pcie@3400000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: pcie@3500000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /: failed to match any schema with compatible: ['fsl,ls2081a-rdb', 'fsl,ls2081a']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /: failed to match any schema with compatible: ['fsl,ls2081a-rdb', 'fsl,ls2081a']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: pcie@3400000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: pcie@3500000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: pcie@3600000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: pcie@3700000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls208xaqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls208xaqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: mdio-mux-emi1@54: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/memory-controller@2240000/cpld@3,0: failed to match any schema with compatible: ['fsl,ls2080aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/memory-controller@2240000/cpld@3,0: failed to match any schema with compatible: ['fsl,ls2080aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/i2c@2000000/i2c-mux@77/i2c@7/i2c-mux@75/i2c@0/spi@28: failed to match any schema with compatible: ['nxp,sc18is602b']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: can@2180000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: can@2190000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/i2c@2000000/i2c-mux@77/i2c@7/i2c-mux@75/i2c@0/spi@28: failed to match any schema with compatible: ['nxp,sc18is602b']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: can@2180000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: can@2190000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fan-temperature-ctrlr@18: '#cooling-cells', 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/i2c@2000000/i2c-mux@77/i2c@2/regulator@5c: failed to match any schema with compatible: ['lltc,ltc3882']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fan-temperature-ctrlr@18: '#cooling-cells', 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/i2c@2000000/i2c-mux@77/i2c@2/regulator@5c: failed to match any schema with compatible: ['lltc,ltc3882']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,lx2160aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,lx2160aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: pcie@3400000: reg-names:1: 'config' was expected
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: can@2180000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: can@2190000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: pcie@3400000: reg-names:0: 'regs' was expected
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3400000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3400000: interrupts: [[0, 108, 4], [0, 108, 4], [0, 108, 4]] is too long
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,lx2160aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,lx2160aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: pcie@3400000: reg-names:1: 'config' was expected
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi:41.18-55.4: Warning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: hub@1: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: hub@2: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: pcie@3400000: reg-names:0: 'regs' was expected
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,layerscape-scfg.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: hub@1: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: hub@2: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: pcie@3400000: reg-names:0: 'regs' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
