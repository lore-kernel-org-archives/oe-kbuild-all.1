Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3D8CA73
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 02:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709605953; cv=none; b=cgBVqCosDVpVSK7lQw1i5X2qlm8BX2kPo0jJco9Jm18iIFccKPoOw6fiDKhg3xnnCWSmg8uO9NNYw30A36KsRFR0fV1MsaMdVrQqGYlEmXxmYQMOX/HVUi8d8TUM1Pl194DR96lW1m3Wa/UnXIydeoogv84W7SrOL5qOjN5Jhjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709605953; c=relaxed/simple;
	bh=lKTrfX5HAd2dUycmGNRp6gCjx9vDzRKmY+jKoZcWvuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uv0+ZHV7cAQ3oiGapCp7iBYuxSjz01UxTvUvKEZp43NP0VJZSxSLh5dSokqyMaYNYQDVGRC3kUqM3zbDvEnT94euOorgtCNW9AePHu2fVqF1Uc2TvttdC8K+/GDMFfelNIU+RM7P+CyjtB3u+xY9Lah3wXh9VlEyNTTTL3iIPS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N65rPeLp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N65rPeLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709605952; x=1741141952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lKTrfX5HAd2dUycmGNRp6gCjx9vDzRKmY+jKoZcWvuc=;
  b=N65rPeLpsOEwzm+mZRXBWZTLSJqlA7yjZ5ru/1W/nY7Q1inPQJYShbHP
   Ock3t3X6xRU+5n+Far2G6BCdjJ+SY90Vj4F1JBt4z9tsOtoTA4zzdLWDa
   OnXowAZAr3fQr9TIQW3NtbtQPK/P7gbyDg84LH+QNWUe5YxX8Izq6fdXq
   UVVT6+I3xoO7Oo4e+NIHBzSoOYPb9+bWaQpv3Wt6imHjDLyPnjveiJKlK
   uqjpJul7MjPVY6COWgjRgbeRjKkYvtfvnejDut24R6V0OLBJhNKXSs9UJ
   /Nj4RDIii739pizTXkH+dALfdmqQ1ad5wtgnd4PU3rfgW1Vyh+h023uyU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4256115"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4256115"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 18:32:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9628362"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Mar 2024 18:32:28 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhKbR-0002vF-0k;
	Tue, 05 Mar 2024 02:32:25 +0000
Date: Tue, 5 Mar 2024 10:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: mm/vmscan.c:4356:5: error: implicit declaration of function
 'for_each_mem_cgroup_tree'
Message-ID: <202403051009.Tksvka1t-lkp@intel.com>
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
date:   2 years, 5 months ago
config: x86_64-buildonly-randconfig-002-20240305 (https://download.01.org/0day-ci/archive/20240305/202403051009.Tksvka1t-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051009.Tksvka1t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051009.Tksvka1t-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c:2777:17: warning: variable 'node_lru_pages' set but not used [-Wunused-but-set-variable]
    2777 |                 unsigned long node_lru_pages = 0;
         |                               ^
>> mm/vmscan.c:4356:5: error: implicit declaration of function 'for_each_mem_cgroup_tree' [-Werror,-Wimplicit-function-declaration]
    4356 |                                 for_each_mem_cgroup_tree(iter, memcg) {
         |                                 ^
>> mm/vmscan.c:4356:42: error: expected ';' after expression
    4356 |                                 for_each_mem_cgroup_tree(iter, memcg) {
         |                                                                      ^
         |                                                                      ;
   1 warning and 2 errors generated.
--
>> mm/filemap.c:869:3: error: implicit declaration of function 'mem_cgroup_shrink_pagecache' [-Werror,-Wimplicit-function-declaration]
     869 |                 mem_cgroup_shrink_pagecache(memcg, gfp_mask);
         |                 ^
   mm/filemap.c:869:3: note: did you mean 'mem_cgroup_shrink_node'?
   include/linux/swap.h:364:22: note: 'mem_cgroup_shrink_node' declared here
     364 | extern unsigned long mem_cgroup_shrink_node(struct mem_cgroup *mem,
         |                      ^
   mm/filemap.c:849:14: warning: no previous prototype for function '__add_to_page_cache_locked' [-Wmissing-prototypes]
     849 | noinline int __add_to_page_cache_locked(struct page *page,
         |              ^
   mm/filemap.c:849:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
     849 | noinline int __add_to_page_cache_locked(struct page *page,
         |          ^
         |          static 
   1 warning and 1 error generated.


vim +/for_each_mem_cgroup_tree +4356 mm/vmscan.c

  4308	
  4309		/*
  4310		 * Return early if there's no work to do.
  4311		 * Wake up reclaimers that couldn't scan any zone due to congestion.
  4312		 * There is apparently nothing to do so they do not have to sleep.
  4313		 * This makes sure that no sleeping reclaimer will stay behind.
  4314		 * Allow breaching the limit if the task is on the way out.
  4315		 */
  4316		if (nr_pages == 0 || fatal_signal_pending(current)) {
  4317			wake_up_interruptible(&pagecache_reclaim_wq);
  4318			goto out;
  4319		}
  4320	
  4321		/* But do a few at least */
  4322		nr_pages = max_t(unsigned long, nr_pages, 8*SWAP_CLUSTER_MAX);
  4323	
  4324		current->reclaim_state = &reclaim_state;
  4325	
  4326		/*
  4327		 * Shrink the LRU in 4 passes:
  4328		 * 0 = Reclaim from inactive_list only (fast)
  4329		 * 1 = Reclaim from active list but don't reclaim mapped and dirtied (not that fast)
  4330		 * 2 = Reclaim from active list but don't reclaim mapped (2nd pass)
  4331		 * it may reclaim dirtied if  vm_pagecache_ignore_dirty = 0
  4332		 * 3 = same as pass 2, but it will reclaim some few pages , detail in shrink_all_zones
  4333		 */
  4334		for (; pass <= 3; pass++) {
  4335			for (sc.priority = DEF_PRIORITY; sc.priority >= 0; sc.priority--) {
  4336				unsigned long nr_to_scan = nr_pages - ret;
  4337				int nid;
  4338	
  4339				sc.nr_scanned = 0;
  4340	
  4341				/*
  4342				 * No zone reclaimed because of too many reclaimers. Retry whether
  4343				 * there is still something to do
  4344				 */
  4345				if (!shrink_all_zones(nr_to_scan, pass, &sc))
  4346					goto retry;
  4347	
  4348				ret += sc.nr_reclaimed;
  4349				if (ret >= nr_pages)
  4350					goto out;
  4351	
  4352				reclaim_state.reclaimed_slab = 0;
  4353				for_each_online_node(nid) {
  4354					struct mem_cgroup *iter;
  4355	
> 4356					for_each_mem_cgroup_tree(iter, memcg) {
  4357						shrink_slab(mask, nid, iter, sc.priority);
  4358					}
  4359				}
  4360				ret += reclaim_state.reclaimed_slab;
  4361	
  4362				if (ret >= nr_pages)
  4363					goto out;
  4364	
  4365			}
  4366			if (pass == 1) {
  4367				if (vm_pagecache_ignore_dirty == 1 ||
  4368				    (mask & (__GFP_IO | __GFP_FS)) != (__GFP_IO | __GFP_FS) )
  4369					break;
  4370				else
  4371					sc.may_writepage = 1;
  4372			}
  4373		}
  4374	
  4375	out:
  4376		current->reclaim_state = old_rs;
  4377	
  4378		return sc.nr_reclaimed;
  4379	}
  4380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
