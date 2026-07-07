Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A497188713
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444106; cv=none; b=tNQMrKQxYCJdfXrGAvJhDYEusED4akeh7R/GhR4wB7sGc2SoEKbtapxpJp9xBMwKQUf/9ebqu4PtbgZHAbpWcTt7FHnGx0/kUkf38xnTSZM2h1cSYyIsBHG7c9aktzca/tnnSDCfN1K7pTOwBxi3HX+B7QVM83fuRUOc/YLIigU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444106; c=relaxed/simple;
	bh=vh5FQzOG3AxnmtmprIOK76hBWbpAdVv/14odokKzKqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BgsBI6ObhSs1jFE9TMiJ/RG3Dtp3J1QtZ+5f2zI382/+lXEDp/uYQiYBxFQXqqJXKHOVxPnntlHR9+Faf/6BFJ2LUJCeBG4hqQ9gFjVJIoLdInbH29D+v61qWBSn9JT2SQm4TY248xXEOH8UQZj4m5Q1gYNRF7/W2xp5BjUF2YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kUcjZNwT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUcjZNwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783444105; x=1814980105;
  h=date:from:to:cc:subject:message-id;
  bh=vh5FQzOG3AxnmtmprIOK76hBWbpAdVv/14odokKzKqM=;
  b=kUcjZNwTkIZocX+f0TbUXmZYyV338DcCkNV2qF5KnrIwiH+en+zrbR3i
   Ipf7rmG5SMBl3q9vcGah1xM6AIExhgTKyigvFYcuI0m6B3GqSRXM3gbfF
   RlCQRqfJolRflTtNDr2b2jD8bSkYcjE+LMEbGkqGTxDhNfriVD1wyF3Wk
   e8RGaFN4/re3mMuqfs1pOoWGh2YfjgYGQKTumxHMvvZmy4xF3RfQ8GhrK
   lOtSYQGBqAVTP0TEKGh780r6+tpRXGqg8Hy615DIw2nhO5HfIZHnO93k6
   daoQ3s15oTRMA0xKC8cX2e9HI2mLAkId/RaDllvstt/H4ZGRoLaVXqjqg
   w==;
X-CSE-ConnectionGUID: bHbQYF5dSrORUlG4x4Z0HA==
X-CSE-MsgGUID: n8Q7mvPPQtS0S8m8Q/a2xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84153688"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84153688"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:08:24 -0700
X-CSE-ConnectionGUID: q+2DhnAlTa2lnblDG421sg==
X-CSE-MsgGUID: 9zEQxOE1QTKfavKINVvc2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258354082"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Jul 2026 10:08:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wh9Fc-00000000FVZ-0lpd;
	Tue, 07 Jul 2026 17:07:00 +0000
Date: Wed, 08 Jul 2026 01:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: arch/mips/ralink/mt7621.c:68:13: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202607080050.SEfypmVB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 4ddaf88aadd3bd09c2eb3734c53d2864af6b144e mips: ralink: mt7621: add missing __iomem
date:   6 weeks ago
config: mips-randconfig-r121-20260707 (https://download.01.org/0day-ci/archive/20260708/202607080050.SEfypmVB-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080050.SEfypmVB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4ddaf88aadd3 ("mips: ralink: mt7621: add missing __iomem")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080050.SEfypmVB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/mips/ralink/mt7621.c:68:13: sparse: sparse: cast removes address space '__iomem' of expression
   arch/mips/ralink/mt7621.c: note: in included file (through arch/mips/include/asm/mips-cps.h):
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:186:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:186:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:165:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:165:1: sparse:     got void [noderef] __iomem *
   arch/mips/ralink/mt7621.c: note: in included file (through arch/mips/include/asm/mips-cps.h):
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:100:1: sparse:     got void [noderef] __iomem *
   arch/mips/ralink/mt7621.c: note: in included file (through arch/mips/include/asm/mips-cps.h):
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:237:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:237:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:244:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@

vim +/__iomem +68 arch/mips/ralink/mt7621.c

1df7addb9671ac John Crispin    2016-01-04  63  
cc19db8b312a6c Chuanhong Guo   2022-02-11  64  static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
cc19db8b312a6c Chuanhong Guo   2022-02-11  65  {
4ddaf88aadd3bd Rosen Penev     2026-05-07  66  	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
cc19db8b312a6c Chuanhong Guo   2022-02-11  67  
cc19db8b312a6c Chuanhong Guo   2022-02-11 @68  	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
cc19db8b312a6c Chuanhong Guo   2022-02-11  69  		return true;
cc19db8b312a6c Chuanhong Guo   2022-02-11  70  	__raw_writel(MT7621_MEM_TEST_PATTERN, dm);
cc19db8b312a6c Chuanhong Guo   2022-02-11  71  	if (__raw_readl(dm) != __raw_readl(dm + size))
cc19db8b312a6c Chuanhong Guo   2022-02-11  72  		return false;
5d8965704fe566 Ilya Lipnitskiy 2022-02-28  73  	__raw_writel(~MT7621_MEM_TEST_PATTERN, dm);
cc19db8b312a6c Chuanhong Guo   2022-02-11  74  	return __raw_readl(dm) == __raw_readl(dm + size);
cc19db8b312a6c Chuanhong Guo   2022-02-11  75  }
cc19db8b312a6c Chuanhong Guo   2022-02-11  76  

:::::: The code at line 68 was first introduced by commit
:::::: cc19db8b312a6c75645645f5cc1b45166b109006 MIPS: ralink: mt7621: do memory detection on KSEG1

:::::: TO: Chuanhong Guo <gch981213@gmail.com>
:::::: CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
