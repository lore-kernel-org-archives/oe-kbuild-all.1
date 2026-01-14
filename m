Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42AA335573
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 18:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768415175; cv=none; b=ZurSTvDf3YUvCE7feJAGrxWRLSM8oPSRUloHKl7m0gGqChwHMIH5LKN66x919101l7LY/FXCm2aYLzmFkASH2CkUreltsYUC9vqNvTalbnQvZSCoCt17Ur8BXX5QhoSRX1nkxoiBskHc97dN70ta8blvaKM1s1WWt4lJW3mZiQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768415175; c=relaxed/simple;
	bh=jqAa9fsNalJiAuG54FZImGkcI/GRFYVDkAbHSJO/cwI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CrUA6/43fkc23c6stKOlh8K0fcsECLF095vzSLP33j9OoAy23j/eI21oDCNsd3aYdhWDe+ZBUNWLpXHDhc/gz7SAZItvravJaLLtmS2VX+hsnRg4jC9iMWETrZSPdRMEz6yYXabDkruD8BPOwj+8iHdHEWL3sS4qKXSBEolbcw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVhvMF4J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVhvMF4J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768415173; x=1799951173;
  h=date:from:to:cc:subject:message-id;
  bh=jqAa9fsNalJiAuG54FZImGkcI/GRFYVDkAbHSJO/cwI=;
  b=hVhvMF4Jk6ZGXnCaiLTwOiYsjA62fjpnuntXaeHWwqxaYC9SJoy2fFSb
   GBI9jtE5pZQ9xWHb6/I73u8QBCXxUpmmWJ4b/Xvd9DSmJNMLOVDw6jCYR
   nd798LXGEbnNwsA59qo+IRN6eQB0gOwB5xd89hzdgCnjs4+Sg57SWTz6c
   yuZdyhxR2yVodzPfaRisumqc8Iy3V1fb1zMHA/TqNrjc0Ru1Y64bq39s9
   4uPdmciZc27blW1MHHhlHjA9jVVY6Mnb4SyFeiojb0nMiZun6aRZ9OAzZ
   QFSjk1B0gC3gMDHOdV4RWNTeNzkhy0IQzUxfk5DVKtBHN9QDlXW++2nQf
   Q==;
X-CSE-ConnectionGUID: V0FDPPvQTPOpctCGBCfr/Q==
X-CSE-MsgGUID: P4cFA3zUSJqfqELw8jeYuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69774411"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69774411"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 10:26:13 -0800
X-CSE-ConnectionGUID: 5y23KWrCTzql11EDwO3Nxw==
X-CSE-MsgGUID: 0j0be6WSQcucxefxcUh+nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="203965786"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jan 2026 10:26:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg5ZI-00000000GpA-3A1S;
	Wed, 14 Jan 2026 18:26:08 +0000
Date: Thu, 15 Jan 2026 02:26:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 19/19]
 drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202601150244.kWzI9YRo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   9f03fb7d9fa1cb50683fa639e6ccbdc94628f8e6
commit: 9f03fb7d9fa1cb50683fa639e6ccbdc94628f8e6 [19/19] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: x86_64-randconfig-r134-20260114 (https://download.01.org/0day-ci/archive/20260115/202601150244.kWzI9YRo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150244.kWzI9YRo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150244.kWzI9YRo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse:     got unsigned int [usertype] *
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse:     got unsigned int [usertype] *
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse:     got unsigned int [usertype] *
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:262:1: sparse:     got unsigned int [usertype] *
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse:     got unsigned int [usertype] *
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse:     got unsigned int [usertype] *
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse:     got unsigned int [usertype] *
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/isdn/hardware/mISDN/mISDNinfineon.c:263:1: sparse:     got unsigned int [usertype] *

vim +262 drivers/isdn/hardware/mISDN/mISDNinfineon.c

cae86d4a4e56eed Karsten Keil 2009-07-22  257  
cae86d4a4e56eed Karsten Keil 2009-07-22  258  IOFUNC_IO(ISAC, inf_hw, isac.a.io)
cae86d4a4e56eed Karsten Keil 2009-07-22  259  IOFUNC_IO(IPAC, inf_hw, hscx.a.io)
cae86d4a4e56eed Karsten Keil 2009-07-22  260  IOFUNC_IND(ISAC, inf_hw, isac.a.io)
cae86d4a4e56eed Karsten Keil 2009-07-22  261  IOFUNC_IND(IPAC, inf_hw, hscx.a.io)
cae86d4a4e56eed Karsten Keil 2009-07-22 @262  IOFUNC_MEMIO(ISAC, inf_hw, u32, isac.a.p)
cae86d4a4e56eed Karsten Keil 2009-07-22  263  IOFUNC_MEMIO(IPAC, inf_hw, u32, hscx.a.p)
cae86d4a4e56eed Karsten Keil 2009-07-22  264  

:::::: The code at line 262 was first introduced by commit
:::::: cae86d4a4e56eeda1afdea38f230d222edda7dd5 mISDN: Add driver for Infineon ISDN chipset family

:::::: TO: Karsten Keil <keil@b1-systems.de>
:::::: CC: Karsten Keil <keil@b1-systems.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
