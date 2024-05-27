Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B94C15E5A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 17:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716832121; cv=none; b=HKGjiPVvKyU7dEvYKh7N+juZsH6hgQUDDtN1IEjfwU+q5une6QEbhjIfpF2IOrh1U+kBihLrjKB7M/2NWw1dwUnUpubbAjuBNR3zPv+8c9JX2sH43Zxl71WNhIs+1xxDu2UeI5nV56cyb2sQjrb0KaKdTxUK1mt6IxZ4PTNtzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716832121; c=relaxed/simple;
	bh=bRtjQ0jXBqLx3UQlkn94+Ls8hvnBfz80350JiIjklis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tiSMgrK/gbEq+eWqBqhbBd+OuRiPqSgSCKrc4W2KvMWlCoSYGuWFjJ7lQBYgEOHgE1xveldW+HnjvFiMhf5zV1y1MXFz94iHdnuTjlIQpzm0PHS+EPxf0yAEQnRNSFLAILSsbiN8qF1BunNUY2RcEeOTE4UYToJhqZv6W9f2fug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzOSZTaN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzOSZTaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716832119; x=1748368119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bRtjQ0jXBqLx3UQlkn94+Ls8hvnBfz80350JiIjklis=;
  b=MzOSZTaNQokoJ26K8mC0+DMIAkpwlnFGptcbszTi1b2NIBq32ajzkxTD
   NyjeusglN9dchDJYVMw7YYMrZ4ikaQyCJUKtMEPE6c1yKO9yvu4SA2sHE
   qC4Li+Mqurgk8uyamXs91F9VQxMXGO0YCCLEHQG+mG+hz3jdJt1FkmxP3
   yU0xKLxawTgewjXcwBB8V0Y+F/yChrt1wv2mKpdSN3N+RFP2mSKcijk4r
   Mq4g/pBxKgzTHr11Kf4fQGvm3X+/gD5tK8Ux7qahCK6vxXuThYw1QTm8D
   /FCpSL45F7DKKiKCLnq/J/YTgooGAsAHgFOOk3ennYlFvmPBDCij0d2zY
   Q==;
X-CSE-ConnectionGUID: 46k0CoYRScyKfqiZvYbLmg==
X-CSE-MsgGUID: pv1ijKmRSsGzQGuUCTDLOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="12988652"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="12988652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 10:48:39 -0700
X-CSE-ConnectionGUID: TZB2gSLmSEq6SfPPb+qF5A==
X-CSE-MsgGUID: HteYwbnURvK5MfFUElsw0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="72231308"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 May 2024 10:48:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBeQy-000Ay9-1I;
	Mon, 27 May 2024 17:47:05 +0000
Date: Tue, 28 May 2024 01:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/rfc-v2 6/10] mm/execmem.c:54:38: error:
 'PMD_SIZE' undeclared; did you mean 'PUD_SIZE'?
Message-ID: <202405280120.9EkZNkwZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/rfc-v2
head:   1ed68c458a903b01b26064ff71cc5ac567515aaa
commit: 76352f0fdb291c3691fef5f903ec42d5aced661a [6/10] execmem: add support for cache of large ROX pages
config: arm-randconfig-004-20240527 (https://download.01.org/0day-ci/archive/20240528/202405280120.9EkZNkwZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280120.9EkZNkwZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280120.9EkZNkwZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:15,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/execmem.c:9:
   mm/execmem.c: In function 'execmem_cache_clean':
>> mm/execmem.c:54:38: error: 'PMD_SIZE' undeclared (first use in this function); did you mean 'PUD_SIZE'?
      54 |                 if (IS_ALIGNED(size, PMD_SIZE) && IS_ALIGNED(mas.index, PMD_SIZE)) {
         |                                      ^~~~~~~~
   include/linux/align.h:13:62: note: in definition of macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                                              ^
   mm/execmem.c:54:38: note: each undeclared identifier is reported only once for each function it appears in
      54 |                 if (IS_ALIGNED(size, PMD_SIZE) && IS_ALIGNED(mas.index, PMD_SIZE)) {
         |                                      ^~~~~~~~
   include/linux/align.h:13:62: note: in definition of macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                                              ^
   mm/execmem.c: In function 'execmem_vmalloc':
   mm/execmem.c:88:25: error: 'PMD_SIZE' undeclared (first use in this function); did you mean 'PUD_SIZE'?
      88 |                 align = PMD_SIZE;
         |                         ^~~~~~~~
         |                         PUD_SIZE
   In file included from include/linux/kernel.h:27:
   mm/execmem.c: In function 'execmem_cache_populate':
   mm/execmem.c:228:37: error: 'PMD_SIZE' undeclared (first use in this function); did you mean 'PUD_SIZE'?
     228 |         alloc_size = round_up(size, PMD_SIZE);
         |                                     ^~~~~~~~
   include/linux/math.h:15:46: note: in definition of macro '__round_mask'
      15 | #define __round_mask(x, y) ((__typeof__(x))((y)-1))
         |                                              ^
   mm/execmem.c:228:22: note: in expansion of macro 'round_up'
     228 |         alloc_size = round_up(size, PMD_SIZE);
         |                      ^~~~~~~~
>> mm/execmem.c:244:9: error: implicit declaration of function 'flush_tlb_kernel_range' [-Werror=implicit-function-declaration]
     244 |         flush_tlb_kernel_range(start, end);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> mm/execmem.c:249:40: error: 'PMD_SHIFT' undeclared (first use in this function); did you mean 'PUD_SHIFT'?
     249 |                                        PMD_SHIFT);
         |                                        ^~~~~~~~~
         |                                        PUD_SHIFT
   cc1: some warnings being treated as errors


vim +54 mm/execmem.c

    37	
    38	static void execmem_cache_clean(struct work_struct *work)
    39	{
    40		struct maple_tree *free_areas = &execmem_cache.free_areas;
    41		struct mutex *mutex = &execmem_cache.mutex;
    42		MA_STATE(mas, free_areas, 0, ULONG_MAX);
    43		void *area;
    44	
    45		mutex_lock(mutex);
    46		mas_for_each(&mas, area, ULONG_MAX) {
    47			size_t size;
    48	
    49			if (!xa_is_value(area))
    50				continue;
    51	
    52			size = xa_to_value(area);
    53	
  > 54			if (IS_ALIGNED(size, PMD_SIZE) && IS_ALIGNED(mas.index, PMD_SIZE)) {
    55				void *ptr = (void *)mas.index;
    56	
    57				mas_erase(&mas);
    58				vfree(ptr);
    59			}
    60		}
    61		mutex_unlock(mutex);
    62	}
    63	
    64	static DECLARE_WORK(execmem_cache_clean_work, execmem_cache_clean);
    65	
    66	static void execmem_fill_trapping_insns(void *ptr, size_t size, bool writable)
    67	{
    68		if (execmem_info->fill_trapping_insns)
    69			execmem_info->fill_trapping_insns(ptr, size, writable);
    70		else
    71			memset(ptr, 0, size);
    72	}
    73	
    74	static void *execmem_vmalloc(struct execmem_range *range, size_t size,
    75				     pgprot_t pgprot, unsigned long vm_flags)
    76	{
    77		bool kasan = range->flags & EXECMEM_KASAN_SHADOW;
    78		gfp_t gfp_flags = GFP_KERNEL | __GFP_NOWARN;
    79		unsigned int align = range->alignment;
    80		unsigned long start = range->start;
    81		unsigned long end = range->end;
    82		void *p;
    83	
    84		if (kasan)
    85			vm_flags |= VM_DEFER_KMEMLEAK;
    86	
    87		if (vm_flags & VM_ALLOW_HUGE_VMAP)
    88			align = PMD_SIZE;
    89	
    90		p = __vmalloc_node_range(size, align, start, end, gfp_flags, pgprot,
    91					 vm_flags, NUMA_NO_NODE,
    92					 __builtin_return_address(0));
    93		if (!p && range->fallback_start) {
    94			start = range->fallback_start;
    95			end = range->fallback_end;
    96			p = __vmalloc_node_range(size, align, start, end, gfp_flags,
    97						 pgprot, vm_flags, NUMA_NO_NODE,
    98						 __builtin_return_address(0));
    99		}
   100	
   101		if (!p) {
   102			pr_warn_ratelimited("execmem: unable to allocate memory\n");
   103			return NULL;
   104		}
   105	
   106		if (kasan && (kasan_alloc_module_shadow(p, size, GFP_KERNEL) < 0)) {
   107			vfree(p);
   108			return NULL;
   109		}
   110	
   111		return p;
   112	}
   113	
   114	static int execmem_cache_add(void *ptr, size_t size)
   115	{
   116		struct maple_tree *free_areas = &execmem_cache.free_areas;
   117		struct mutex *mutex = &execmem_cache.mutex;
   118		unsigned long addr = (unsigned long)ptr;
   119		MA_STATE(mas, free_areas, addr - 1, addr + 1);
   120		unsigned long lower, lower_size = 0;
   121		unsigned long upper, upper_size = 0;
   122		unsigned long area_size;
   123		void *area = NULL;
   124		int err;
   125	
   126		lower = addr;
   127		upper = addr + size - 1;
   128	
   129		mutex_lock(mutex);
   130		area = mas_walk(&mas);
   131		if (area && xa_is_value(area) && mas.last == addr - 1) {
   132			lower = mas.index;
   133			lower_size = xa_to_value(area);
   134		}
   135	
   136		area = mas_next(&mas, ULONG_MAX);
   137		if (area && xa_is_value(area) && mas.index == addr + size) {
   138			upper = mas.last;
   139			upper_size = xa_to_value(area);
   140		}
   141	
   142		mas_set_range(&mas, lower, upper);
   143		area_size = lower_size + upper_size + size;
   144		err = mas_store_gfp(&mas, xa_mk_value(area_size), GFP_KERNEL);
   145		mutex_unlock(mutex);
   146		if (err)
   147			return -ENOMEM;
   148	
   149		return 0;
   150	}
   151	
   152	static bool within_range(struct execmem_range *range, struct ma_state *mas,
   153				 size_t size)
   154	{
   155		unsigned long addr = mas->index;
   156	
   157		if (addr >= range->start && addr + size < range->end)
   158			return true;
   159	
   160		if (range->fallback_start &&
   161		    addr >= range->fallback_start && addr + size < range->fallback_end)
   162			return true;
   163	
   164		return false;
   165	}
   166	
   167	static void *__execmem_cache_alloc(struct execmem_range *range, size_t size)
   168	{
   169		struct maple_tree *free_areas = &execmem_cache.free_areas;
   170		struct maple_tree *busy_areas = &execmem_cache.busy_areas;
   171		MA_STATE(mas_free, free_areas, 0, ULONG_MAX);
   172		MA_STATE(mas_busy, busy_areas, 0, ULONG_MAX);
   173		struct mutex *mutex = &execmem_cache.mutex;
   174		unsigned long addr, last, area_size = 0;
   175		void *area, *ptr = NULL;
   176		int err;
   177	
   178		mutex_lock(mutex);
   179		mas_for_each(&mas_free, area, ULONG_MAX) {
   180			area_size = xa_to_value(area);
   181	
   182			if (area_size >= size && within_range(range, &mas_free, size))
   183				break;
   184		}
   185	
   186		if (area_size < size)
   187			goto out_unlock;
   188	
   189		addr = mas_free.index;
   190		last = mas_free.last;
   191	
   192		/* insert allocated size to busy_areas at range [addr, addr + size) */
   193		mas_set_range(&mas_busy, addr, addr + size - 1);
   194		err = mas_store_gfp(&mas_busy, xa_mk_value(size), GFP_KERNEL);
   195		if (err)
   196			goto out_unlock;
   197	
   198		mas_erase(&mas_free);
   199		if (area_size > size) {
   200			/*
   201			 * re-insert remaining free size to free_areas at range
   202			 * [addr + size, last]
   203			 */
   204			mas_set_range(&mas_free, addr + size, last);
   205			size = area_size - size;
   206			err = mas_store_gfp(&mas_free, xa_mk_value(size), GFP_KERNEL);
   207			if (err) {
   208				mas_erase(&mas_busy);
   209				goto out_unlock;
   210			}
   211		}
   212		ptr = (void *)addr;
   213	
   214	out_unlock:
   215		mutex_unlock(mutex);
   216		return ptr;
   217	}
   218	
   219	static int execmem_cache_populate(struct execmem_range *range, size_t size)
   220	{
   221		unsigned long vm_flags = VM_FLUSH_RESET_PERMS | VM_ALLOW_HUGE_VMAP;
   222		unsigned long start, end;
   223		struct vm_struct *vm;
   224		size_t alloc_size;
   225		int err = -ENOMEM;
   226		void *p;
   227	
   228		alloc_size = round_up(size, PMD_SIZE);
   229		p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
   230		if (!p)
   231			return err;
   232	
   233		vm = find_vm_area(p);
   234		if (!vm)
   235			goto err_free_mem;
   236	
   237		/* fill memory with instructions that will trap */
   238		execmem_fill_trapping_insns(p, alloc_size, /* writable = */ true);
   239	
   240		start = (unsigned long)p;
   241		end = start + alloc_size;
   242	
   243		vunmap_range_noflush(start, end);
 > 244		flush_tlb_kernel_range(start, end);
   245	
   246		/* FIXME: handle direct map alias */
   247	
   248		err = vmap_pages_range_noflush(start, end, range->pgprot, vm->pages,
 > 249					       PMD_SHIFT);
   250		if (err)
   251			goto err_free_mem;
   252	
   253		err = execmem_cache_add(p, alloc_size);
   254		if (err)
   255			goto err_free_mem;
   256	
   257		return 0;
   258	
   259	err_free_mem:
   260		vfree(p);
   261		return err;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
