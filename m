Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF34E32695E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 04:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768625863; cv=none; b=iy7ZAoz7XwaBqvrrYhClJI3vT2fRqWrPD/8rpnfRxfuGJBgOuBacIX7IVMuD6FfHTLvTUXJebB+IvqDevEZbml6vRJvYxXoFbKZv3zTqNxyiQHv3Y6izIAZ/CAk8WKFBScMxJMck/RC0ibUN9PKIkU0hYaKKBWo2UiVmcAXR+HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768625863; c=relaxed/simple;
	bh=F2AB+++Ez3GfaWLJ7mVidWOnHJMR8zxbBKFVnb606M4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l4InQFMFAzHpzh8WoAK2laYPiIdH491aiqJK5i5oOtOz7t+/gvKp2DFvS0jLoZnFENJkNzw1fe6VuzwyWzc2GhNwfyuddDFS1/nnToVe9j8lFBCiS1osqf/oxneMigfGWWPrkVImmMnCyJG3EAbhbBFpqrkgYRvk6UCDYkxFLdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnoKe+UL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnoKe+UL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768625863; x=1800161863;
  h=date:from:to:cc:subject:message-id;
  bh=F2AB+++Ez3GfaWLJ7mVidWOnHJMR8zxbBKFVnb606M4=;
  b=dnoKe+UL38y5DBOHwdpljuFR4pfQBNlnr9VBDKhoUwqY4Ne1r46nytQx
   czGvKV9aStSuzAwNNpzjSOpoDV3ZkF6NspfN7sbeNylex2s/cMfQOxz9D
   9QbpEKlngQhDUGDpNYErE7XR50Yv5wMnpM6ZZMlKWZ7J6bItXAS9Wztlc
   GzoAZwG+/2VW23c27HODZHY+lC0MmwdqYXC+6yqzIKHspyp3aNW9X9ZKl
   SVM9H1tDef1Y76w2e2i0eHdJm7HdQ+tQwuNV6mBvzbB2YSORhc+3IRN+G
   1+8HRHWa2LBF6SuuUQqoCQBPjZLh39+BTZbw9C5ymxJ/at6J5iFmALqeI
   w==;
X-CSE-ConnectionGUID: P7CVplcURxanuqyvHDGEgA==
X-CSE-MsgGUID: F46g1dgNTluTugDqSMpJOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73565842"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="73565842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 20:57:43 -0800
X-CSE-ConnectionGUID: 1vLZb6GvRBO0nffd6pU1JQ==
X-CSE-MsgGUID: 5wK66ENJSFOYt35xF6EJhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205021342"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2026 20:57:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgyNV-00000000LZg-3N9l;
	Sat, 17 Jan 2026 04:57:37 +0000
Date: Sat, 17 Jan 2026 12:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:compound_head 2/15] include/linux/sched/mm.h:316:20:
 warning: conflicting types for 'might_alloc'; have 'void(gfp_t)' {aka
 'void(unsigned int)'}
Message-ID: <202601171217.SY9PW6eY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git compound_head
head:   b85ab3c6f9b0b85159a92143639da1947695d8da
commit: 44d8c0bdca357faa441b6a75b316a399a31b2bd1 [2/15] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20260117/202601171217.SY9PW6eY-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171217.SY9PW6eY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171217.SY9PW6eY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:18,
                    from arch/sparc/include/asm/openprom.h:15,
                    from arch/sparc/include/asm/oplib_32.h:12,
                    from arch/sparc/include/asm/oplib.h:7,
                    from arch/sparc/include/asm/pgtable_32.h:32,
                    from arch/sparc/include/asm/pgtable.h:7,
                    from include/linux/pgtable.h:6,
                    from include/linux/mmzone.h:24,
                    from include/linux/gfp.h:7,
                    from include/linux/sched/mm.h:9,
                    from kernel/sched/sched.h:14,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/xarray.h: In function 'xa_store_bh':
>> include/linux/xarray.h:594:9: error: implicit declaration of function 'might_alloc'; did you mean 'might_lock'? [-Wimplicit-function-declaration]
     594 |         might_alloc(gfp);
         |         ^~~~~~~~~~~
         |         might_lock
   In file included from arch/sparc/include/asm/page_32.h:133,
                    from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/string_32.h:13,
                    from arch/sparc/include/asm/string.h:7,
                    from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/sparc/include/asm/smp_32.h:15,
                    from arch/sparc/include/asm/smp.h:7,
                    from arch/sparc/include/asm/switch_to_32.h:5,
                    from arch/sparc/include/asm/switch_to.h:7,
                    from arch/sparc/include/asm/ptrace.h:120,
                    from arch/sparc/include/asm/thread_info_32.h:19,
                    from arch/sparc/include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:60,
                    from arch/sparc/include/asm/current.h:15,
                    from include/linux/sched.h:12,
                    from include/linux/sched/affinity.h:1,
                    from kernel/sched/sched.h:8:
   arch/sparc/include/asm/pgtable_32.h: In function 'pmd_page':
   include/asm-generic/memory_model.h:18:34: error: 'mem_map' undeclared (first use in this function); did you mean 'memcmp'?
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:74:21: note: in expansion of macro '__pfn_to_page'
      74 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sparc/include/asm/pgtable_32.h:118:16: note: in expansion of macro 'pfn_to_page'
     118 |         return pfn_to_page(pmd_pfn(pmd));
         |                ^~~~~~~~~~~
   include/asm-generic/memory_model.h:18:34: note: each undeclared identifier is reported only once for each function it appears in
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:74:21: note: in expansion of macro '__pfn_to_page'
      74 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sparc/include/asm/pgtable_32.h:118:16: note: in expansion of macro 'pfn_to_page'
     118 |         return pfn_to_page(pmd_pfn(pmd));
         |                ^~~~~~~~~~~
   include/linux/sched/mm.h: At top level:
>> include/linux/sched/mm.h:316:20: warning: conflicting types for 'might_alloc'; have 'void(gfp_t)' {aka 'void(unsigned int)'}
     316 | static inline void might_alloc(gfp_t gfp_mask)
         |                    ^~~~~~~~~~~
   include/linux/sched/mm.h:316:20: error: static declaration of 'might_alloc' follows non-static declaration
   include/linux/xarray.h:594:9: note: previous implicit declaration of 'might_alloc' with type 'void(gfp_t)' {aka 'void(unsigned int)'}
     594 |         might_alloc(gfp);
         |         ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +316 include/linux/sched/mm.h

4034247a0d6ab28 NeilBrown     2022-01-14  307  
95d6c701f4ca7c4 Simona Vetter 2020-12-14  308  /**
95d6c701f4ca7c4 Simona Vetter 2020-12-14  309   * might_alloc - Mark possible allocation sites
95d6c701f4ca7c4 Simona Vetter 2020-12-14  310   * @gfp_mask: gfp_t flags that would be used to allocate
95d6c701f4ca7c4 Simona Vetter 2020-12-14  311   *
95d6c701f4ca7c4 Simona Vetter 2020-12-14  312   * Similar to might_sleep() and other annotations, this can be used in functions
95d6c701f4ca7c4 Simona Vetter 2020-12-14  313   * that might allocate, but often don't. Compiles to nothing without
95d6c701f4ca7c4 Simona Vetter 2020-12-14  314   * CONFIG_LOCKDEP. Includes a conditional might_sleep() if @gfp allows blocking.
95d6c701f4ca7c4 Simona Vetter 2020-12-14  315   */
95d6c701f4ca7c4 Simona Vetter 2020-12-14 @316  static inline void might_alloc(gfp_t gfp_mask)
95d6c701f4ca7c4 Simona Vetter 2020-12-14  317  {
95d6c701f4ca7c4 Simona Vetter 2020-12-14  318  	fs_reclaim_acquire(gfp_mask);
95d6c701f4ca7c4 Simona Vetter 2020-12-14  319  	fs_reclaim_release(gfp_mask);
95d6c701f4ca7c4 Simona Vetter 2020-12-14  320  
95d6c701f4ca7c4 Simona Vetter 2020-12-14  321  	might_sleep_if(gfpflags_allow_blocking(gfp_mask));
95d6c701f4ca7c4 Simona Vetter 2020-12-14  322  }
95d6c701f4ca7c4 Simona Vetter 2020-12-14  323  

:::::: The code at line 316 was first introduced by commit
:::::: 95d6c701f4ca7c44dc148d664f604541266a2333 mm: extract might_alloc() debug check

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
