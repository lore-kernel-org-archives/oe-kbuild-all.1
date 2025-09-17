Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890E2F4A01
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 02:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758075271; cv=none; b=F5vRaAruiOaSyugcAwxUajg6Jnmks0yCXBUh5mH+G3yGtIVsbNUcqDnFXh0h4iGy7s8tWoHzNEYabTh6/uTGox3rkRbyWTWg7ci67vUDlVRQFlo1r8LS5APPTuZZY9NW9oWF7g67LOpVGlD1py9QFd/8W9+AZkwtOck+nesSr1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758075271; c=relaxed/simple;
	bh=DPXGrM93jUV6SVrFExqhODckSTk/R93jOMqgHH4khvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXRwX7hpTgsaTKK9nhHKXMcIHEcvPJZM6EQWtqePVMmIC9vhRLGrFr7Cqao9UDClTRvcYpYDtraS5ryXWO4UagRTpXUomtDDGKDrVNHyhzFjzbuNQqXZo9PjkX36ci5gLkXvyP9UdxKpCZhP4UY1aPQ7fP4wgBnAbHdi6DTG9Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXw/Ovad; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXw/Ovad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758075270; x=1789611270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DPXGrM93jUV6SVrFExqhODckSTk/R93jOMqgHH4khvs=;
  b=FXw/OvadDDDmfFtenOIiJr4wXauzJDw/A2d/PseqABXKMJJCZgqjZypN
   M2ocaQ1kObdVIFP/E7Ywhutn6f6pmGE7V1ayg9cyPqkYRJ4VVrEw2Dy1B
   79iCRFWJDLamt/Lc4hrgr8/qXAohzs70mFatGOfwjGD+lLPPPzzC30YN1
   Jdmxn/kOXgXKKt+85v+3LqG9CBzLLM/oCDdQ4X5CVToU1yNQrDH54G4kE
   HwHsjGb1s5uVCeOAGak+iFNEHqlzcLzvKop8axp2cXViNoZ9VTCh6AW5E
   AGmyM1HqwFD1/LasmA69w82kqGycmB8ZT6Wth44dRJw+MT3ynR2pNMiO8
   w==;
X-CSE-ConnectionGUID: hr9EPUr9Qx6ft1P6/z7xSA==
X-CSE-MsgGUID: VlEtyU2cTqmZrBjfGkjwRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59416534"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="59416534"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 19:14:29 -0700
X-CSE-ConnectionGUID: A5CPId97RdWDLa7M9Ez7Zg==
X-CSE-MsgGUID: AxOnG70gRsCjVbIexh8k3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="206065964"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Sep 2025 19:14:27 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyhgf-0000yl-22;
	Wed, 17 Sep 2025 02:14:25 +0000
Date: Wed, 17 Sep 2025 10:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [linux-next:master 7363/9696]
 arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: flash@0 (atmel,at45db021d):
 Unevaluated properties are not allowed ('spi-cpha', 'spi-cpol' were
 unexpected)
Message-ID: <202509171054.gyDPnYPw-lkp@intel.com>
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
commit: 5ed941c73b7f501e32610ef0e82affa7ec36a71f [7363/9696] ARM: dts: ls1021a: Rename node name nor to flash
config: arm-randconfig-052-20250912 (https://download.01.org/0day-ci/archive/20250917/202509171054.gyDPnYPw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509171054.gyDPnYPw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509171054.gyDPnYPw-lkp@intel.com/

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
