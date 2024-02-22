Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7355199AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 23:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708646057; cv=none; b=AizGNHWWgkdTfImuW7AQ38vK/UAr9PX38AvZsGHCkUaC4tMD07vZdBoa0Vb9J9JRRW3z6mrWe8hAHJ78JONVG9ciN4UL4v62f4K3IRL7mRf1kvDnQyOEJNFkW6uvXqegcTv/ey5zduM/SMM44F9zk/xeVIJdtZSfPOVozYdxHrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708646057; c=relaxed/simple;
	bh=kI8KGm7PKoKHiyMVtYnxyJ3GOa7bw7fxwpwLJMZfjKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mnqT34aHk+CitY0QAIk79xw6Zbw21X0TlvRk7jiJldrBqHIyzEivElPkq68ZZ+CptGVax6sgn67+MTgPzHGAxXqN2j4ZFGr9aoMMrE5+f8J0CBmLIOz9zmxi+NcKt6qrZn27UVkEAiqflzDSzkfSuOHpHY4AnmPN2CDBRfz5bvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7QsBswg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7QsBswg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708646055; x=1740182055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kI8KGm7PKoKHiyMVtYnxyJ3GOa7bw7fxwpwLJMZfjKw=;
  b=i7QsBswgIuKafnky0D7q+9ALc+9PrWnCr7TeV9nuhVT75gz7Vsn8W4QG
   hA7Mq2BJqp7Uo6/sXcXLkl7SX7foa1NBus0WjdOc8RC+hwrKnDvxc9T0o
   pjNTf/+o/W/pVTQdM+AuCpyWpBoAg+SyYAQtcYvzYELxo9VUukki86m+O
   LieKLdfElbsoKe/vwA7TrB+MMwZ8H+bmR1VZxk2fNpiqIksRQKFsafx8q
   1R7/yeVxQdCdXOHiXZ4Fc4C+SkUVSfLCCST/+2jrRZ282WN2D1+cEIpox
   Vu8lamBDqNR4AOGvnhGhykzl3ADJaLsf+e0vv9M4ioyRpa+KIvypnE/jd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="25386544"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="25386544"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 15:52:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10259529"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Feb 2024 15:52:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdIrl-0006o0-0Z;
	Thu, 22 Feb 2024 23:52:37 +0000
Date: Fri, 23 Feb 2024 07:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: mm/memcontrol.c:3528:15: warning: no previous prototype for function
 'mem_cgroup_pagecache_get_reclaim_pages'
Message-ID: <202402230751.6Mr6df7B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 06d37efeef4689ee10a610bbe91d85de62b88d6c mm: pagecache limit per cgroup support
date:   2 years, 4 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240223/202402230751.6Mr6df7B-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230751.6Mr6df7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230751.6Mr6df7B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memcontrol.c:3414:73: warning: variable 'pre_used' set but not used [-Wunused-but-set-variable]
    3414 |         unsigned long pages_used, pages_max, pages_reclaimed, goal_pages_used, pre_used;
         |                                                                                ^
>> mm/memcontrol.c:3528:15: warning: no previous prototype for function 'mem_cgroup_pagecache_get_reclaim_pages' [-Wmissing-prototypes]
    3528 | unsigned long mem_cgroup_pagecache_get_reclaim_pages(struct mem_cgroup *memcg)
         |               ^
   mm/memcontrol.c:3528:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3528 | unsigned long mem_cgroup_pagecache_get_reclaim_pages(struct mem_cgroup *memcg)
         | ^
         | static 
   mm/memcontrol.c:3551:21: warning: unused variable 'pre' [-Wunused-variable]
    3551 |         unsigned long max, pre, pages_max;
         |                            ^~~
   mm/memcontrol.c:3566:6: warning: unused variable 'err' [-Wunused-variable]
    3566 |         int err, ret = 0;
         |             ^~~
   mm/memcontrol.c:3572:30: warning: variable 'max' is uninitialized when used here [-Wuninitialized]
    3572 |         xchg(&memcg->pagecache.max, max);
         |                                     ^~~
   include/asm-generic/atomic-instrumented.h:1648:22: note: expanded from macro 'xchg'
    1648 |         arch_xchg(__ai_ptr, __VA_ARGS__);                               \
         |                             ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:45: note: expanded from macro 'arch_xchg'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                                   ^
   arch/x86/include/asm/cmpxchg.h:44:39: note: expanded from macro '__xchg_op'
      44 |                 __typeof__ (*(ptr)) __ret = (arg);                      \
         |                                              ^~~
   mm/memcontrol.c:3565:19: note: initialize the variable 'max' to silence this warning
    3565 |         unsigned long max, pages_reclaimed;
         |                          ^
         |                           = 0
   5 warnings generated.


vim +/mem_cgroup_pagecache_get_reclaim_pages +3528 mm/memcontrol.c

  3410	
  3411	unsigned int vm_pagecache_limit_retry_times;
  3412	void mem_cgroup_shrink_pagecache(struct mem_cgroup *memcg, gfp_t gfp_mask)
  3413	{
> 3414		unsigned long pages_used, pages_max, pages_reclaimed, goal_pages_used, pre_used;
  3415		unsigned int retry_times = 0;
  3416		unsigned int limit_retry_times;
  3417	
  3418		if (!memcg || mem_cgroup_is_root(memcg))
  3419			return;
  3420	
  3421		pages_max = READ_ONCE(memcg->pagecache.max);
  3422		if (pages_max == PAGE_COUNTER_MAX || vm_pagecache_limit_global)
  3423			return;
  3424	
  3425		if (gfp_mask & __GFP_ATOMIC)
  3426			return;
  3427	
  3428		if (unlikely(should_force_charge()))
  3429			return;
  3430	
  3431		if (unlikely(current->flags & PF_MEMALLOC))
  3432			return;
  3433	
  3434		if (unlikely(task_in_memcg_oom(current)))
  3435			return;
  3436	
  3437		if (!gfpflags_allow_blocking(gfp_mask))
  3438			return;
  3439	
  3440		pages_used = page_counter_read(&memcg->pagecache);
  3441		limit_retry_times = READ_ONCE(vm_pagecache_limit_retry_times);
  3442		goal_pages_used = (100 - READ_ONCE(memcg->pagecache_reclaim_ratio)) * pages_max / 100;
  3443		goal_pages_used = max_t(unsigned long, MIN_PAGECACHE_PAGES, goal_pages_used);
  3444	
  3445		if (pages_used > pages_max) {
  3446			memcg_memory_event(memcg, MEMCG_PAGECACHE_MAX);
  3447			while (pages_used > goal_pages_used) {
  3448				if (fatal_signal_pending(current))
  3449					break;
  3450	
  3451				pre_used = pages_used;
  3452				pages_reclaimed = shrink_page_cache_memcg(gfp_mask, memcg, pages_used - goal_pages_used);
  3453	
  3454				if (limit_retry_times == 0)
  3455					goto next_shrink;
  3456	
  3457				if (pages_reclaimed == 0) {
  3458					congestion_wait(BLK_RW_ASYNC, HZ/10);
  3459					retry_times++;
  3460				} else
  3461					retry_times = 0;
  3462	
  3463				if (retry_times > limit_retry_times) {
  3464					memcg_memory_event(memcg, MEMCG_PAGECACHE_OOM);
  3465					mem_cgroup_out_of_memory(memcg, GFP_KERNEL, 0);
  3466					break;
  3467				}
  3468	
  3469	next_shrink:
  3470				pages_used = page_counter_read(&memcg->pagecache);
  3471				cond_resched();
  3472			}
  3473		}
  3474	}
  3475	
  3476	static u64 pagecache_reclaim_ratio_read(struct cgroup_subsys_state *css,
  3477						struct cftype *cft)
  3478	{
  3479		struct mem_cgroup *memcg = mem_cgroup_from_css(css);
  3480	
  3481		return memcg->pagecache_reclaim_ratio;
  3482	}
  3483	
  3484	static ssize_t pagecache_reclaim_ratio_write(struct kernfs_open_file *of,
  3485					char *buf, size_t nbytes, loff_t off)
  3486	{
  3487		struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
  3488		u64 reclaim_ratio;
  3489		int ret;
  3490		unsigned long nr_pages;
  3491	
  3492		buf = strstrip(buf);
  3493		if (!buf)
  3494			return -EINVAL;
  3495	
  3496		ret = kstrtou64(buf, 0, &reclaim_ratio);
  3497		if (ret)
  3498			return ret;
  3499	
  3500		if ((reclaim_ratio > 0) && (reclaim_ratio < 100)) {
  3501			memcg->pagecache_reclaim_ratio = reclaim_ratio;
  3502			return nbytes;
  3503		} else if (reclaim_ratio == 100) {
  3504			nr_pages = page_counter_read(&memcg->pagecache);
  3505			shrink_page_cache_memcg(GFP_KERNEL, memcg, nr_pages);
  3506			return nbytes;
  3507		}
  3508	
  3509		return -EINVAL;
  3510	}
  3511	
  3512	static u64 pagecache_current_read(struct cgroup_subsys_state *css,
  3513					struct cftype *cft)
  3514	{
  3515		struct mem_cgroup *memcg = mem_cgroup_from_css(css);
  3516	
  3517		return (u64)page_counter_read(&memcg->pagecache) * PAGE_SIZE;
  3518	}
  3519	
  3520	static u64 memory_pagecache_max_read(struct cgroup_subsys_state *css,
  3521					struct cftype *cft)
  3522	{
  3523		struct mem_cgroup *memcg = mem_cgroup_from_css(css);
  3524	
  3525		return memcg->pagecache_max_ratio;
  3526	}
  3527	
> 3528	unsigned long mem_cgroup_pagecache_get_reclaim_pages(struct mem_cgroup *memcg)
  3529	{
  3530		unsigned long goal_pages_used, pages_used, pages_max;
  3531	
  3532		if ((!memcg) || (mem_cgroup_is_root(memcg)))
  3533			return 0;
  3534	
  3535		pages_max = READ_ONCE(memcg->pagecache.max);
  3536		if (pages_max == PAGE_COUNTER_MAX)
  3537			return 0;
  3538	
  3539		goal_pages_used = (100 - READ_ONCE(memcg->pagecache_reclaim_ratio)) * pages_max / 100;
  3540		goal_pages_used = max_t(unsigned long, MIN_PAGECACHE_PAGES, goal_pages_used);
  3541		pages_used = page_counter_read(&memcg->pagecache);
  3542	
  3543		return pages_used > pages_max ? pages_used - goal_pages_used : 0;
  3544	}
  3545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
