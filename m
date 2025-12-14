Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09549E55A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 05:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765689276; cv=none; b=syBzZcJagzjsD0tdRGcWz8lpTKhl87Vay82xfeAx8p2ceTkV4Aq/xfHlMX1bnlnBiNdG4XREl4c51qrHZnrKyLmMU2oXaA/lBosWF0O0tQqpyle0lIC7xmGU0Fsxa+KrmnIfMNMtBBkZAouzcn3dFQUfT4ONJfwBnlR2/kwfMBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765689276; c=relaxed/simple;
	bh=a12l9oEz/8LIMXohLYZzSvzMLDb2EEU59sM9ZXCH/1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPJtEYgnVXWoGfTxOd/QGCyDfGl9ue9YqhLTRqQq7F253BrA2QnNm5+xlibKUS0m7gqh3+RNKuCouxLJHYH2uXdEpbvXbC/TL/DCLnDHi110hG44AJkn7kFqleAWoQOvsc6cos3+JMLKomCm2GpN63XL9Oc+89I9tCwpvCyRwWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3l5xQHM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3l5xQHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765689274; x=1797225274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a12l9oEz/8LIMXohLYZzSvzMLDb2EEU59sM9ZXCH/1k=;
  b=P3l5xQHM90VC4WwUB9hMnkFgrEyEsjYVX5CG7cnqMMzPwGs3CUleBBJb
   3P1CgZ547IrVMA7vKQ2J7h33fSUrZNB5bInenioldq7NFSDuugqJLgK6q
   Y5dPcbAB+ig5lETvifh6alvU+6NIwET568jh04tlcEO7VRNUhIxM8QT++
   0LRpfQxvg2Co8w2sEMYTThkjff9+gmfuOcMHu6K9eblN2IFnRsDleVqQ0
   noghq4mvxs9aooKqo2b8obRosg5QxkSvUWKZbtmOlT6A/CWk6cS5v2x8V
   5XEJyVEsxbIe5vdXum4LRCeRlJ3CJkg3q0NQrgfYTGjeVJrqXC/bu8E4B
   A==;
X-CSE-ConnectionGUID: 4lLGoHtjTPauknNcUy4Xgw==
X-CSE-MsgGUID: S4SUQIvIS2C/g+6YBJzQHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67593146"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67593146"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 21:14:32 -0800
X-CSE-ConnectionGUID: QFxKQJjrSKaeEe9V8JRrYA==
X-CSE-MsgGUID: 9KXQSGtERUGXNSm+XvIM3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="228507762"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Dec 2025 21:14:30 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUeRA-000000008bn-0acK;
	Sun, 14 Dec 2025 05:14:28 +0000
Date: Sun, 14 Dec 2025 13:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/platforms/microwatt/smp.c:79:24: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202512141354.zefMnJb2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0dfb36b2dcb666f116ba314e631bd3bc632c44d1
commit: aca95fb6bb572a77f39d42d83ab72a965026577d powerpc/microwatt: Add SMP support
date:   10 months ago
config: powerpc64-randconfig-r134-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141354.zefMnJb2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141354.zefMnJb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141354.zefMnJb2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/math-emu/fctiw.c:8:
   include/math-emu/double.h:59:21: warning: '__BIG_ENDIAN' is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^
>> arch/powerpc/math-emu/fctiw.c:14:2: warning: variable '_fex' set but not used [-Wunused-but-set-variable]
      14 |         FP_DECL_EX;
         |         ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
      94 | #define FP_DECL_EX int _fex = 0
         |                        ^
   2 warnings generated.
--
   In file included from arch/powerpc/math-emu/fsel.c:8:
   include/math-emu/double.h:59:21: warning: '__BIG_ENDIAN' is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^
>> arch/powerpc/math-emu/fsel.c:14:2: warning: variable '_fex' set but not used [-Wunused-but-set-variable]
      14 |         FP_DECL_EX;
         |         ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
      94 | #define FP_DECL_EX int _fex = 0
         |                        ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE
   Depends on [n]: PPC_RADIX_MMU [=n]
   Selected by [y]:
   - PPC_POWERNV [=y] && PPC64 [=y] && PPC_BOOK3S [=y]
   - PPC_PSERIES [=y] && PPC64 [=y] && PPC_BOOK3S [=y]

sparse warnings: (new ones prefixed by >>)
   arch/powerpc/math-emu/lfs.c: note: in included file:
   include/math-emu/double.h:59:21: sparse: sparse: undefined preprocessor identifier '__BIG_ENDIAN'
   arch/powerpc/math-emu/lfs.c: note: in included file:
   include/math-emu/single.h:50:21: sparse: sparse: undefined preprocessor identifier '__BIG_ENDIAN'
>> arch/powerpc/math-emu/lfs.c:23:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *ea @@
   arch/powerpc/math-emu/lfs.c:23:32: sparse:     expected void const [noderef] __user *from
   arch/powerpc/math-emu/lfs.c:23:32: sparse:     got void *ea
--
   arch/powerpc/math-emu/lfd.c: note: in included file:
   include/math-emu/double.h:59:21: sparse: sparse: undefined preprocessor identifier '__BIG_ENDIAN'
>> arch/powerpc/math-emu/lfd.c:12:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *ea @@
   arch/powerpc/math-emu/lfd.c:12:33: sparse:     expected void const [noderef] __user *from
   arch/powerpc/math-emu/lfd.c:12:33: sparse:     got void *ea
   arch/powerpc/math-emu/lfd.c:10:1: sparse: sparse: symbol 'lfd' was not declared. Should it be static?
--
>> arch/powerpc/math-emu/stfiwx.c:13:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *ea @@
   arch/powerpc/math-emu/stfiwx.c:13:26: sparse:     expected void [noderef] __user *to
   arch/powerpc/math-emu/stfiwx.c:13:26: sparse:     got void *ea
--
>> arch/powerpc/math-emu/stfd.c:17:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *ea @@
   arch/powerpc/math-emu/stfd.c:17:26: sparse:     expected void [noderef] __user *to
   arch/powerpc/math-emu/stfd.c:17:26: sparse:     got void *ea
--
   arch/powerpc/math-emu/stfs.c: note: in included file:
   include/math-emu/double.h:59:21: sparse: sparse: undefined preprocessor identifier '__BIG_ENDIAN'
   arch/powerpc/math-emu/stfs.c: note: in included file:
   include/math-emu/single.h:50:21: sparse: sparse: undefined preprocessor identifier '__BIG_ENDIAN'
>> arch/powerpc/math-emu/stfs.c:38:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *ea @@
   arch/powerpc/math-emu/stfs.c:38:34: sparse:     expected void [noderef] __user *to
   arch/powerpc/math-emu/stfs.c:38:34: sparse:     got void *ea
--
>> arch/powerpc/platforms/microwatt/smp.c:79:24: sparse: sparse: cast removes address space '__iomem' of expression
>> arch/powerpc/platforms/microwatt/smp.c:79:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   arch/powerpc/platforms/microwatt/smp.c:79:24: sparse:     expected void [noderef] __iomem *addr
   arch/powerpc/platforms/microwatt/smp.c:79:24: sparse:     got void *

vim +/__iomem +79 arch/powerpc/platforms/microwatt/smp.c

    42	
    43	void __init microwatt_init_smp(void)
    44	{
    45		volatile unsigned char __iomem *syscon;
    46		int ncpus;
    47		int timeout;
    48	
    49		syscon = early_ioremap(SYSCON_BASE, SYSCON_LENGTH);
    50		if (syscon == NULL) {
    51			pr_err("Failed to map SYSCON\n");
    52			return;
    53		}
    54		ncpus = (readl(syscon + SYSCON_CPU_CTRL) >> 8) & 0xff;
    55		if (ncpus < 2)
    56			goto out;
    57	
    58		smp_ops = &microwatt_smp_ops;
    59	
    60		/*
    61		 * Write two instructions at location 0:
    62		 * mfspr r3, PIR
    63		 * b __secondary_hold
    64		 */
    65		*(unsigned int *)KERNELBASE = PPC_RAW_MFSPR(3, SPRN_PIR);
    66		*(unsigned int *)(KERNELBASE+4) = PPC_RAW_BRANCH(&__secondary_hold - (char *)(KERNELBASE+4));
    67	
    68		/* enable the other CPUs, they start at location 0 */
    69		writel((1ul << ncpus) - 1, syscon + SYSCON_CPU_CTRL);
    70	
    71		timeout = 10000;
    72		while (!__secondary_hold_acknowledge) {
    73			if (--timeout == 0)
    74				break;
    75			barrier();
    76		}
    77	
    78	 out:
  > 79		early_iounmap((void *)syscon, SYSCON_LENGTH);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
