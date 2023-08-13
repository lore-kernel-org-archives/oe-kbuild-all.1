Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F621187C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Aug 2023 08:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691914657; x=1723450657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N+NYKXgoGtYpKVa6Pel2VDEzPydZz5wg0QUt+24ceGM=;
  b=f4VCbNtxqQS+jARVqtmWYda2uG2E7fyt0Hhn3Tgx74xE1n/Yo38VIVP9
   Js9r9165lcIFCHNAlV+cjoR3XsQ6o0TqQKtnu7pwHgxU2AlYH1FGpQz+F
   bThTSIXXvBLwyHtzySSQ3rZ81b9K0VhKzg0d/q7vhfX+LxUKK9UW6GlJ7
   vi2pVFk+HV3C+mpe2T/NNjEdD6A++tK+daeq8RWVNw6xh5Ko8ZPn6XyG0
   GLoiaBWT54goUoQ8Cfw7ElibQQ3GeuPqJv4+X5IxLettuTtjaTlGLXnIF
   gDNeHHErZTpWOmaqhlVtKVqpOmSNqWDr1qkhCTZ+3s+tCd8hmntjOSHKf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="370778594"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="370778594"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 01:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="803111011"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="803111011"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Aug 2023 01:17:34 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qV6I1-00091c-2M;
	Sun, 13 Aug 2023 08:17:33 +0000
Date: Sun, 13 Aug 2023 16:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [akpm-mm:mm-stable 219/240] mm/memory.c:5410:41: error: implicit
 declaration of function 'vma_is_tcp'; did you mean 'vma_is_dax'?
Message-ID: <202308131610.jF4ncWp6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
head:   5fb2ea3111f4ecc6dc4891ce5b00f0217aae9a04
commit: 4aaa60dad4d1c96151dec51098aed866bb6e867d [219/240] mm: allow per-VMA locks on file-backed VMAs
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230813/202308131610.jF4ncWp6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308131610.jF4ncWp6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308131610.jF4ncWp6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/kernel_stat.h:5,
                    from mm/memory.c:42:
   mm/memory.c: In function 'lock_vma_under_rcu':
>> mm/memory.c:5410:41: error: implicit declaration of function 'vma_is_tcp'; did you mean 'vma_is_dax'? [-Werror=implicit-function-declaration]
    5410 |         if (unlikely(!vma->anon_vma && !vma_is_tcp(vma)))
         |                                         ^~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   cc1: some warnings being treated as errors


vim +5410 mm/memory.c

c2508ec5a58db6 Linus Torvalds     2023-06-15  5382  
50ee3253720614 Suren Baghdasaryan 2023-02-27  5383  #ifdef CONFIG_PER_VMA_LOCK
50ee3253720614 Suren Baghdasaryan 2023-02-27  5384  /*
50ee3253720614 Suren Baghdasaryan 2023-02-27  5385   * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
50ee3253720614 Suren Baghdasaryan 2023-02-27  5386   * stable and not isolated. If the VMA is not found or is being modified the
50ee3253720614 Suren Baghdasaryan 2023-02-27  5387   * function returns NULL.
50ee3253720614 Suren Baghdasaryan 2023-02-27  5388   */
50ee3253720614 Suren Baghdasaryan 2023-02-27  5389  struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
50ee3253720614 Suren Baghdasaryan 2023-02-27  5390  					  unsigned long address)
50ee3253720614 Suren Baghdasaryan 2023-02-27  5391  {
50ee3253720614 Suren Baghdasaryan 2023-02-27  5392  	MA_STATE(mas, &mm->mm_mt, address, address);
50ee3253720614 Suren Baghdasaryan 2023-02-27  5393  	struct vm_area_struct *vma;
50ee3253720614 Suren Baghdasaryan 2023-02-27  5394  
50ee3253720614 Suren Baghdasaryan 2023-02-27  5395  	rcu_read_lock();
50ee3253720614 Suren Baghdasaryan 2023-02-27  5396  retry:
50ee3253720614 Suren Baghdasaryan 2023-02-27  5397  	vma = mas_walk(&mas);
50ee3253720614 Suren Baghdasaryan 2023-02-27  5398  	if (!vma)
50ee3253720614 Suren Baghdasaryan 2023-02-27  5399  		goto inval;
50ee3253720614 Suren Baghdasaryan 2023-02-27  5400  
50ee3253720614 Suren Baghdasaryan 2023-02-27  5401  	if (!vma_start_read(vma))
50ee3253720614 Suren Baghdasaryan 2023-02-27  5402  		goto inval;
50ee3253720614 Suren Baghdasaryan 2023-02-27  5403  
657b5146955eba Jann Horn          2023-07-26  5404  	/*
657b5146955eba Jann Horn          2023-07-26  5405  	 * find_mergeable_anon_vma uses adjacent vmas which are not locked.
657b5146955eba Jann Horn          2023-07-26  5406  	 * This check must happen after vma_start_read(); otherwise, a
657b5146955eba Jann Horn          2023-07-26  5407  	 * concurrent mremap() with MREMAP_DONTUNMAP could dissociate the VMA
657b5146955eba Jann Horn          2023-07-26  5408  	 * from its anon_vma.
657b5146955eba Jann Horn          2023-07-26  5409  	 */
657b5146955eba Jann Horn          2023-07-26 @5410  	if (unlikely(!vma->anon_vma && !vma_is_tcp(vma)))
657b5146955eba Jann Horn          2023-07-26  5411  		goto inval_end_read;
657b5146955eba Jann Horn          2023-07-26  5412  
444eeb17437a0e Suren Baghdasaryan 2023-02-27  5413  	/*
444eeb17437a0e Suren Baghdasaryan 2023-02-27  5414  	 * Due to the possibility of userfault handler dropping mmap_lock, avoid
444eeb17437a0e Suren Baghdasaryan 2023-02-27  5415  	 * it for now and fall back to page fault handling under mmap_lock.
444eeb17437a0e Suren Baghdasaryan 2023-02-27  5416  	 */
657b5146955eba Jann Horn          2023-07-26  5417  	if (userfaultfd_armed(vma))
657b5146955eba Jann Horn          2023-07-26  5418  		goto inval_end_read;
444eeb17437a0e Suren Baghdasaryan 2023-02-27  5419  
50ee3253720614 Suren Baghdasaryan 2023-02-27  5420  	/* Check since vm_start/vm_end might change before we lock the VMA */
657b5146955eba Jann Horn          2023-07-26  5421  	if (unlikely(address < vma->vm_start || address >= vma->vm_end))
657b5146955eba Jann Horn          2023-07-26  5422  		goto inval_end_read;
50ee3253720614 Suren Baghdasaryan 2023-02-27  5423  
50ee3253720614 Suren Baghdasaryan 2023-02-27  5424  	/* Check if the VMA got isolated after we found it */
50ee3253720614 Suren Baghdasaryan 2023-02-27  5425  	if (vma->detached) {
50ee3253720614 Suren Baghdasaryan 2023-02-27  5426  		vma_end_read(vma);
52f238653e452e Suren Baghdasaryan 2023-02-27  5427  		count_vm_vma_lock_event(VMA_LOCK_MISS);
50ee3253720614 Suren Baghdasaryan 2023-02-27  5428  		/* The area was replaced with another one */
50ee3253720614 Suren Baghdasaryan 2023-02-27  5429  		goto retry;
50ee3253720614 Suren Baghdasaryan 2023-02-27  5430  	}
50ee3253720614 Suren Baghdasaryan 2023-02-27  5431  
50ee3253720614 Suren Baghdasaryan 2023-02-27  5432  	rcu_read_unlock();
50ee3253720614 Suren Baghdasaryan 2023-02-27  5433  	return vma;
657b5146955eba Jann Horn          2023-07-26  5434  
657b5146955eba Jann Horn          2023-07-26  5435  inval_end_read:
657b5146955eba Jann Horn          2023-07-26  5436  	vma_end_read(vma);
50ee3253720614 Suren Baghdasaryan 2023-02-27  5437  inval:
50ee3253720614 Suren Baghdasaryan 2023-02-27  5438  	rcu_read_unlock();
52f238653e452e Suren Baghdasaryan 2023-02-27  5439  	count_vm_vma_lock_event(VMA_LOCK_ABORT);
50ee3253720614 Suren Baghdasaryan 2023-02-27  5440  	return NULL;
50ee3253720614 Suren Baghdasaryan 2023-02-27  5441  }
50ee3253720614 Suren Baghdasaryan 2023-02-27  5442  #endif /* CONFIG_PER_VMA_LOCK */
50ee3253720614 Suren Baghdasaryan 2023-02-27  5443  

:::::: The code at line 5410 was first introduced by commit
:::::: 657b5146955eba331e01b9a6ae89ce2e716ba306 mm: lock_vma_under_rcu() must check vma->anon_vma under vma lock

:::::: TO: Jann Horn <jannh@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
