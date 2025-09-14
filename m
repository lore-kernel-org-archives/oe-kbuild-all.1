Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB872522B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 06:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757829640; cv=none; b=aSAmCM/w/RVdql5EU8zhmGVGfTyFCxZj3WNNJA/3caE6CuJWIJKMhVJHA+y01YzIWB65Y0e5xNtKB851F7ZFuQgPrafN5JAFytG0QB3y995AXryU1BOlTDMDUCmPgYPAftwnPy6puSaY/Cyi9utFz9vQ6GCHIc5zPfFV0Ups43E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757829640; c=relaxed/simple;
	bh=iI578K9EXtgnXcwY3ayKFjbSAv74vQwac96+AcfV9y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qoJrLMTMXaX2sCdMXFkM+aJH6kRYHatAtuZ6ODtsIkgtr/O6nbuEoe7NzbHOA/qryTzAljZZwowTwtvd4228o13YNJtuhWbZBBc9/nSUhyc3tP9Fazu7vZwfTLgDK5aJj6tNZMdyyN/TWFfXa26PhVbZwvs876obZode0G2Mdfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P24tj1zv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P24tj1zv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757829639; x=1789365639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iI578K9EXtgnXcwY3ayKFjbSAv74vQwac96+AcfV9y4=;
  b=P24tj1zv8bKgW9w0QFAobQtNZrluEsXJORfNOeGFFvQwC6yWA9tpN7da
   NV6x0XmUyziCoY1AvF/1DBMxy+MOlzC69mCWT9FF6C2ZFRuVhKtBMQ9ot
   ETBYZ7CnSsa0/t0VateUmG2rtu9kFhFE5sU469CWab6uKAUEPhzoS9vPF
   zI47/Y90FUptPVqfRxv59KSkwifRH4d1ShWnkWGSmUxSm1vccpZ5QJXGX
   BDOY/ms+Yjp5PWKMuiAPQUHpCSIxSYwfMmgo2jgpVKQILln8xoqEx93Dn
   uXbREL7A0Z56Ugt9f+8Elndhgv0O3FiW/jrT2eRruLv1lyJNXhRYT0OK5
   Q==;
X-CSE-ConnectionGUID: mvbSawiKTZCpVrjXp5WtLw==
X-CSE-MsgGUID: BX4y4QOPSZeI3aqkVvE7GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="60222120"
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="60222120"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 23:00:38 -0700
X-CSE-ConnectionGUID: 25uFyIjHQZK8/JjEtVlBiQ==
X-CSE-MsgGUID: 0/Ual7V0TtiCdiCF2NCJYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="178351018"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 13 Sep 2025 23:00:36 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxfmr-00029E-1J;
	Sun, 14 Sep 2025 06:00:33 +0000
Date: Sun, 14 Sep 2025 13:59:57 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [linux-next:master 7654/8719]
 arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: flash@0 (atmel,at45db021d):
 Unevaluated properties are not allowed ('spi-cpha', 'spi-cpol' were
 unexpected)
Message-ID: <202509141353.QYkxZMMj-lkp@intel.com>
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
commit: 5ed941c73b7f501e32610ef0e82affa7ec36a71f [7654/8719] ARM: dts: ls1021a: Rename node name nor to flash
config: arm-randconfig-052-20250912 (https://download.01.org/0day-ci/archive/20250914/202509141353.QYkxZMMj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509141353.QYkxZMMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509141353.QYkxZMMj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): compatible: ['mdio-mux-mmioreg'] is too short
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: flash@0 (atmel,at45db021d): Unevaluated properties are not allowed ('spi-cpha', 'spi-cpol' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/atmel,dataflash.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
