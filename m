Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8699D1DBB3A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 00:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769474206; cv=none; b=osZM+9rLN3ayyy6H9fUUVvX/AOG4uKH3UNnWkU9xqG8Um+RIWcG41RS3PatFEe0EPmjK++3RKd84nkXkD7+TtGGejTLK7yp5wite7M3p9S+RgWlVLu06gQUspSw3IiQPr2EcZNL9zOcugPGGGlgwkcRuAhLFxIUKPS6cxgs4edI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769474206; c=relaxed/simple;
	bh=mHe7ffqbLu1x+50pI+gHQWEA9Gsy9n5aESUvBDTZIFM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sxpo95mffOebJdHc4k0uEPRdS86nxfqvJjDGdTDA7ODyr31N4C5QBIcUhbwY9kqJ6qzX6E6TT3Uspe0LFJXWwH87m52iACqGKr6csrNsfK4CrOXaz7wngeS8BhSJiLhVKZQztYKL90djjqCZ8rQQqE2rV7NmX3o+mapRWcxjYO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFWBifr5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFWBifr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769474204; x=1801010204;
  h=date:from:to:cc:subject:message-id;
  bh=mHe7ffqbLu1x+50pI+gHQWEA9Gsy9n5aESUvBDTZIFM=;
  b=jFWBifr51SY5EXVjcXStN8a+V0EpdlqipiIHSDBgtMV6+YFXdCGd0hOu
   0uCZvPrZPzGI7vJgs+cMpIhi+SW6FIw1Ua9hsW/fyWr9v0H0uQVsuofJ3
   UrydQzxtFN3Xs4U6dI6qUH8oKrai5tSlQfg/z1+NPk+j4oZa1b3n/z8/g
   jvaiVQROWTuBS2mflh7obktsGHrWT7TRoVAMXyThahbKO/MSON7SY1IvZ
   eIRUyQFewuDypujZV/ZmasyTFrJ/9WfHBaGotJDzMV21+6RCgyCQbT0GZ
   VChmfTJNoJndLJyduFtbPygsre90HTJrsiuqAmIgfWtC3Ow8sLIWtY//M
   g==;
X-CSE-ConnectionGUID: Xjd9oKVRSHaaYKmMDiSDxA==
X-CSE-MsgGUID: Q62A8i49TTKJaifPsZCRXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82028037"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82028037"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 16:36:41 -0800
X-CSE-ConnectionGUID: w4DQ1H3TS6C30Xwc7ckvKg==
X-CSE-MsgGUID: cwyLD+X9T/WycIprKZfqwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207701754"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jan 2026 16:36:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkX4Q-00000000Xo2-0eKN;
	Tue, 27 Jan 2026 00:36:38 +0000
Date: Tue, 27 Jan 2026 08:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/platforms/microwatt/smp.c:79:24: sparse:
 sparse: cast removes address space '__iomem' of expression
Message-ID: <202601270858.uYxcZR9p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fcb70a56f4d81450114034b2c61f48ce7444a0e2
commit: aca95fb6bb572a77f39d42d83ab72a965026577d powerpc/microwatt: Add SMP support
date:   11 months ago
config: powerpc64-randconfig-r123-20260126 (https://download.01.org/0day-ci/archive/20260127/202601270858.uYxcZR9p-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270858.uYxcZR9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270858.uYxcZR9p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
