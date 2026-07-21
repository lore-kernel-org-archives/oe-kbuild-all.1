Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7485530148B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623874; cv=none; b=BhJrZrZJykcjAz8X1D8GLswpw5UXlWnjJQV9ER4V1G7rZ14aRnEFUiFyJX8Ei9e2HuRj0GGwWLuRA4ScnSCAHshBSbqWzET9shAIBZrWk+lMM5H8epkzY1+8oaQ16LxB+jOBePLc62CFHrGEpV+QCaAxk5Ts90Tyme+81eJwm8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623874; c=relaxed/simple;
	bh=40z41dBqYE24DwxRa+7A2yB4ETvrp0lD9SwCjH0o19k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JcRwYHl8ta783XrqV7PG5kIcZD4W3QPTnwmJ5baT9kYEW2cAJ24YBA0SswH+fhXzpUBJdSNGVSKDUHowkWm1nOAhIz270bFpasV2q0k+WEXC48aXs4qtoDuc8v9wddW7M88vZlkgmbCY6CW9f8sPAH4DqIlG6l4+OmEK3sxtW5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKjS6Rmg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKjS6Rmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784623872; x=1816159872;
  h=date:from:to:cc:subject:message-id;
  bh=40z41dBqYE24DwxRa+7A2yB4ETvrp0lD9SwCjH0o19k=;
  b=XKjS6Rmg5ibw55DdcSzOMhZ9Xq7tF7qW5PaI9PR/l/FRZqtmA4rlZ9Dm
   uml2+XTFhUlBdM8T1BgQXmXgLABcXa4rYwrq9IpVEChNV7BEc2fGS9Oub
   2wI1Hmv4Hu+FzrnnKk3Nwh5F9QETlA3mUWLMEji2kRoP4yF+/lbMTwwAC
   K37KfQrop9E2Uh89DmLFIv9JFg2r6HhgqXdFkH4SGo2ZOEaDs3b29/nCj
   aCk+orCtEAO0U/bbwS61aMYa7aDVG4arYM4Nriq5ezqGPKkElHGCUBFH7
   3W2b6yHLs9KUOs0mDamXm5q17LfZ2kOcs3XuQd31hW84m4qE1UUCTPFDv
   g==;
X-CSE-ConnectionGUID: AmedtfJcSQiUzylG0VRBXA==
X-CSE-MsgGUID: tc6SAkNiRiORBVIHhWHo/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89038862"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="89038862"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 01:51:11 -0700
X-CSE-ConnectionGUID: K59ftmFYSfO9c2hIPHu6nA==
X-CSE-MsgGUID: Z04Tv8FrQ8Ke6wf9H3Folw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="255065084"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2026 01:51:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wm6BX-00000000XRE-2EKC;
	Tue, 21 Jul 2026 08:50:59 +0000
Date: Tue, 21 Jul 2026 16:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:generic-set-memory/v0.1 5/14]
 include/linux/pgtable.h:2374:24: error: 'PMD_SIZE' undeclared; did you mean
 'P4D_SIZE'?
Message-ID: <202607211613.7PSekFP4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git generic-set-memory/v0.1
head:   638eb4b634f16c38ed87203f47ffed3cd5b1a67c
commit: cb2eab77f64c1ad09dce2ac836357cf03966fb20 [5/14] x86/mm/pat: use a generic helper for the large page size
config: m68k-randconfig-r073-20260721 (https://download.01.org/0day-ci/archive/20260721/202607211613.7PSekFP4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260721/202607211613.7PSekFP4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607211613.7PSekFP4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:31,
                    from include/linux/cpuset.h:17,
                    from kernel/sched/sched.h:33,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/pgtable.h: In function 'pgtable_level_size':
>> include/linux/pgtable.h:2374:24: error: 'PMD_SIZE' undeclared (first use in this function); did you mean 'P4D_SIZE'?
    2374 |                 return PMD_SIZE;
         |                        ^~~~~~~~
         |                        P4D_SIZE
   include/linux/pgtable.h:2374:24: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/asm-generic/pgtable-nopud.h:7,
                    from arch/m68k/include/asm/pgtable_no.h:5,
                    from arch/m68k/include/asm/pgtable.h:8,
                    from include/linux/pgtable.h:6:
>> include/asm-generic/pgtable-nop4d.h:11:33: error: 'PGDIR_SHIFT' undeclared (first use in this function); did you mean 'P4D_SHIFT'?
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopud.h:20:33: note: in expansion of macro 'PUD_SHIFT'
      20 | #define PUD_SIZE        (1UL << PUD_SHIFT)
         |                                 ^~~~~~~~~
   include/linux/pgtable.h:2376:24: note: in expansion of macro 'PUD_SIZE'
    2376 |                 return PUD_SIZE;
         |                        ^~~~~~~~
>> include/linux/pgtable.h:2380:24: error: 'PGDIR_SIZE' undeclared (first use in this function); did you mean 'P4D_SIZE'?
    2380 |                 return PGDIR_SIZE;
         |                        ^~~~~~~~~~
         |                        P4D_SIZE
   make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +2374 include/linux/pgtable.h

  2366	
  2367	/* Size of the memory mapped by a single leaf entry at @level */
  2368	static inline unsigned long pgtable_level_size(enum pgtable_level level)
  2369	{
  2370		switch (level) {
  2371		case PGTABLE_LEVEL_PTE:
  2372			return PAGE_SIZE;
  2373		case PGTABLE_LEVEL_PMD:
> 2374			return PMD_SIZE;
  2375		case PGTABLE_LEVEL_PUD:
  2376			return PUD_SIZE;
  2377		case PGTABLE_LEVEL_P4D:
  2378			return P4D_SIZE;
  2379		default:
> 2380			return PGDIR_SIZE;
  2381		}
  2382	}
  2383	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
