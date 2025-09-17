Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BCC21CC64
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758115890; cv=none; b=EjcdXNu9YRBIDJ3d7bexAjK/c4M5qt0Y6ua8jRbRPF3J+IQqakuRf26wGLV186a7TV5bQ55DsYFMgr/WNL9kEaLehArbK9IOoFnyfvqIA9JyG+WRwF0L2NqjzjSMafBgsRuKUIpBZ02fHnDO137tmSe3cDebvFPh1wkY3QTucaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758115890; c=relaxed/simple;
	bh=1aVzza3GZtP0sYlC+oJnEEhc/m0KGWL8mioB3TXrYNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LvwjuOWndX+O5KjzVZViJRPCzhZX0wPkcLmmZaWJRvRajfTY9WupqIAMfCoHtkQNUFSOOddmGljvG/XLoIXvKP6FmmcO2QC9X/vdLDXYlRJLJRjGd8acBNKJN7/FsmHM4LOmYiBy5uQNj/kwOlkbK1dKBF60lnMmxUdOhNHLwGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFjc9i08; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFjc9i08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758115888; x=1789651888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1aVzza3GZtP0sYlC+oJnEEhc/m0KGWL8mioB3TXrYNM=;
  b=MFjc9i08XsoQMXuS9aUhs17f4skyozuoNBzImsFkgL1ObfyBRWCq2jGP
   MtSoFneTO/Qov2bhHT0JEvRmlu5vDSZnX2C2q/EP6uA+Nle+w2t7a7ZVk
   s5XEtHHU3aXQtFSYtk5B3HmMrKAJIfCkJY4F/D6CChyt4vRHpsunMW5Cb
   E8+miNmqIxvOh1oqupaEy5pAgr0BexiHJlev6kslvrifzScydNqVY2Srz
   8pFdOfn8woxlHT8DHJcwvkdFLca7r3Eqt6V3suX59hNp+HLgbWod83rmi
   OlUZ07xq0rCSehKEFvUhC1KlRtRKhvyju7wGUKSfHp5Ine6RJmzjr+HeZ
   g==;
X-CSE-ConnectionGUID: 1aEvbysXRh2Ch1kG7ciwhw==
X-CSE-MsgGUID: o1QPoFRtTQGZM7Uk8LEXrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="77862475"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="77862475"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 06:31:28 -0700
X-CSE-ConnectionGUID: 3O+hNXkYRi26MCBUhNXojA==
X-CSE-MsgGUID: UI8QLb7jSrCKobFfbC6Xtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="174847732"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2025 06:31:26 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uysFo-00023z-0R;
	Wed, 17 Sep 2025 13:31:24 +0000
Date: Wed, 17 Sep 2025 21:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [linux-next:master 7364/9696]
 arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000
 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed
 ('#address-cells', '#size-cells', 'bank-width', 'compatible',
 'device-width', 'mdio-mux@54', 'ranges', 'reg' were unex...
Message-ID: <202509172111.19w9SzSR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   05af764719214d6568adb55c8749dec295228da8
commit: 6067121fbe1ac30c525da6069e0865e91db50541 [7364/9696] ARM: dts: ls1021a: Rename 'mdio-mux-emi1' to 'mdio-mux@54'
config: arm-randconfig-052-20250912 (https://download.01.org/0day-ci/archive/20250917/202509172111.19w9SzSR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509172111.19w9SzSR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509172111.19w9SzSR-lkp@intel.com/

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
