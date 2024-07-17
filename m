Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A261E1878
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 02:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721181696; cv=none; b=cbVA6qlwJ5kdglvzhaWc0QwNWVTIdqifvvriINKdnYFwdNjTALN6W1/aVF6aQqcmFP1zJ1MxVaP/WZqFwmL5Jvv+fJeZOKzbZl2rgqsqYVyxc6QSPbgVy+iJs1CYsh1qk1MMPpiYJqiUBCzt/o5rwrW1mClM2X4ROwVxrOHlVN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721181696; c=relaxed/simple;
	bh=01Lfi8P3OMhSUerkFtL6819TpGcYflUsjp2yBgL1S4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N0NO1nL6rS0319EFV4Ob/YMIs6GfU2orvjCaqMgRrfiCTKfXHmhBSU+hcRvjx/oC/c7LGqAcZKv9P1bm57hxCtDODiOrKvRwDAMy5SrL6qdTmdW9+iipQCuo2VaI/uzOP+A3aVoXUrUtiydwKQEeCDFwMGT/nuGWbGGUOoeekYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gepqnxnk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gepqnxnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721181693; x=1752717693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=01Lfi8P3OMhSUerkFtL6819TpGcYflUsjp2yBgL1S4E=;
  b=GepqnxnktVIZqFN5GWUQB+LmJzk/gHCw9o0SVHhjuMDUHnBUcjk20scL
   XOsUGjU4wmh6hQIubNCU1EenhOa1T2H1vPLmmsnI5A5NKVo0mv4VHuxwD
   Ek3v6oC36ZTyaO3xrIBcWc0MZvJdSnM8XQ57AupHl4Aw03+G0CTu2fDaO
   unlR6tgpxmCBmjKzKWsENzoRZOXkazyZYRif7bZL+mX20gA1iiJ3ujE8e
   xECGYQcgYheInEK/NA9Al4nkEkxqXKCOIH45X/lu1m5m2++xgIKW7WZ91
   MSmGpxKfimcuus/80yix93op/bAm7Ky20q8ZxbNGv0ur980WKcKsPO9kc
   Q==;
X-CSE-ConnectionGUID: ZkDdo7w4QACDPQBte6SHHg==
X-CSE-MsgGUID: KSKCSo7nQ/O/RkfMdP9Gsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18851575"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="18851575"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 19:01:33 -0700
X-CSE-ConnectionGUID: 9W2vpAeTTPiO3el0lzUcww==
X-CSE-MsgGUID: EFb/CXFXQV6asuIIVaq9zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="81265448"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jul 2024 19:01:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTtyz-000fs6-2v;
	Wed, 17 Jul 2024 02:01:29 +0000
Date: Wed, 17 Jul 2024 10:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13144/13217]
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: thermal-zones:
 'core-cluster-thermal' does not match any of the regexes:
 '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
Message-ID: <202407170946.F86TZQRU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f40be61af99a67d5580c1448acd9b74c0376389
commit: 8aacd580c62ff3085d8a6f2afdf7c4c7cc8c0f57 [13144/13217] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
config: arm64-randconfig-051-20240716 (https://download.01.org/0day-ci/archive/20240717/202407170946.F86TZQRU-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170946.F86TZQRU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170946.F86TZQRU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: thermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: thermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: thermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: thermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: thermal-zones: 'core-cluster-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: syscon@1e60000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/fsl,layerscape-sfp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,ls1028aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,ls1028a-dspi', 'fsl,ls1021a-v1.0-dspi']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
