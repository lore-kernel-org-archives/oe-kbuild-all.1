Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873BC227B95
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 23:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757891365; cv=none; b=j9M8Nauxi0wln9sSOA2PQxeHphkGHKMr8cNDaFZ96OG1RDZsMgzMTVKMONb8mJTz9qCj/CjVDOqEkKKwTtrOHYlGcBcmrNZ5P4FRANaL5IidfMkAP5eDWfYciUk4//xmL9atr0d5pBBJgtSRI2u8eyzhvCgJ0ZmXAb8Wpl2jbeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757891365; c=relaxed/simple;
	bh=jmm9oNqOEB/vZbMX958Bm4hanXLsuwHP6eKD47h5un8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K1gTjZnPCgBif4uCX78Y2OkS7cp2pcRg/shYPgj5bzPsJityitBmk0bpjW8Xor7wG2pouBzuKKGE5vBdqU4InP3OWf+xM7wc9XwRCbwyNjMpzm+fJnZu5JG2oDwEeX1JUzfENFod19ltB0LC4/RIkq18inihB0Bm+aSklieU5GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnG3X6u8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnG3X6u8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757891363; x=1789427363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jmm9oNqOEB/vZbMX958Bm4hanXLsuwHP6eKD47h5un8=;
  b=fnG3X6u8aOw88NfLT+W8F4llKm5j9siPuFmdk7diICndOYkDy3mO7lHK
   +Pw35DhuwG+zZa57iuuy6N//a/ATQmJgxaJ1h7ClRjbBFeqcd3ylvmbmH
   aV/5MFaOTnjPxmkDV0HkDnobb02WWFsr5zYK0uAaeyT/26TYZThQ6yO3D
   aUXEdHdQkhbzuMR9g+M5DuNGN3qlVecDiyh2xYDbtVouRB8WQOpgIGt/t
   ci+JOBE94m98LtQ3pvPveNTve+tZzHAhyI1N02UTULfbx0eh+LccTRMz0
   j4tYooHZifgKsMUQItYE6S031WB8H/p/NSxnM5fV1ryCqGDT9Ce6cdeoC
   A==;
X-CSE-ConnectionGUID: sYEY++GWSwO6BUjvC6OzSA==
X-CSE-MsgGUID: FHKMKxGHTeeM4ZytFJeLew==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="77597320"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="77597320"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 16:09:21 -0700
X-CSE-ConnectionGUID: EZ/UGdqkTgygyBx7uWdhGw==
X-CSE-MsgGUID: Z0vcSEsiTB+Eufj7TlPdMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="174912174"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Sep 2025 16:09:20 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxvqP-0002n6-0y;
	Sun, 14 Sep 2025 23:09:17 +0000
Date: Mon, 15 Sep 2025 07:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [linux-next:master 7655/8719]
 arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000
 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed
 ('#address-cells', '#size-cells', 'bank-width', 'compatible',
 'device-width', 'mdio-mux@54', 'ranges', 'reg' were unex...
Message-ID: <202509150626.eA3caXAW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
commit: 6067121fbe1ac30c525da6069e0865e91db50541 [7655/8719] ARM: dts: ls1021a: Rename 'mdio-mux-emi1' to 'mdio-mux@54'
config: arm-randconfig-052-20250912 (https://download.01.org/0day-ci/archive/20250915/202509150626.eA3caXAW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509150626.eA3caXAW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509150626.eA3caXAW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   		'fsl,p1022ds-fpga' was expected
   		'simple-mfd' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'simple-mfd' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'simple-mfd' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['simple-mfd'] is too short
   		'simple-mfd' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'simple-mfd' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'simple-mfd' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'mdio-mux@54', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: flash@0 (atmel,at45db021d): Unevaluated properties are not allowed ('spi-cpha', 'spi-cpol' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflash.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
