Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5BAAD5E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 00:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328702; cv=none; b=sL0L3cqopDzEOwbWHlk9WHzoE8LA9fzNLE+3Mn2KRY95xUdYh8vBAjli3sJwU0X0830kmRog6yJiqr0qRiGcaGaU3kmPdoOkwqeJ5DIC0x0JaprJ+bj7FkApDNrXXozjIsuzd5fE1Np2/NFUTChrKgOo7FlDUdr7s0iSimCus4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328702; c=relaxed/simple;
	bh=UP8A8yRlq0ga2YWsOQ8im/LFd5Sw9Lp0bNvQNeKAlIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aql6hF9sie5Oh4jZSV1xRgBfPeQ6uzRYk1YxbL/6ZcqvL5RA5FGDUSpHAj/MHLEnJX9l3/EnfodJXLS74viKNSmBMtF5LTJ8RNFUZkDCAlkDsq/sbDwOURdN8UMxx67e5B8nfbaYsY34HOtaXzWyCJYN3jqE36ZQdyIV+4LZwL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sd+qkEqr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sd+qkEqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751328700; x=1782864700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UP8A8yRlq0ga2YWsOQ8im/LFd5Sw9Lp0bNvQNeKAlIo=;
  b=Sd+qkEqr7OyYEEC+eCw6PAeMlMxR1QJ8ejtUFM5Dfkh39T+MyoYhqVJZ
   vBILz8M5jMQG7DbPjS/hOA9arUpb4QWsMIMrJ7tR2l8t3rFWT6WDpgLsu
   ZBa06BAGta2AuswHytM7/YZvVRNN6S9o2gbF6FADtSJHzl0btAf2uns54
   pZCCqvYhhEpDdlCS2xJYmVrkL3DijJW8ey+RW9w7xAXq/56F3JfDEfpUU
   OwpHWh/zHZhs5C0ChkGtVOOAP3G8ORpK72rW4SXqiK/7BFRIhYXKG4FCh
   Q1JL5pKbhiiJtXgJAwvmKJJfOHzSOM6AKxcikwQAwEJQTQXshjY79Jbue
   g==;
X-CSE-ConnectionGUID: Te0zZyZ/Qvee3rKSXfaPlQ==
X-CSE-MsgGUID: 55oYsG6BT1i40Ym9nVfHcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52800871"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="52800871"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 17:11:38 -0700
X-CSE-ConnectionGUID: A6sJm+Z8RVuPDBH+g6c/CQ==
X-CSE-MsgGUID: 6Ul6lWO8TRyWC6FJqsRErQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153898051"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jun 2025 17:11:37 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWOb1-0001MZ-1d;
	Tue, 01 Jul 2025 00:11:35 +0000
Date: Tue, 1 Jul 2025 02:10:37 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] mm/page_alloc.c:3036:6: warning: no
 previous prototype for function '__drain_all_pages'
Message-ID: <202507010222.B7Sw9hp0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2264b0731bcc958f540da580ad93b9f103a8e271
commit: e037ee4a8deaff7c579618c0aba1f066d6d14b11 [2882/2882] mm, page_alloc: disable pcplists during memory offline
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250701/202507010222.B7Sw9hp0-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010222.B7Sw9hp0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010222.B7Sw9hp0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:3036:6: warning: no previous prototype for function '__drain_all_pages' [-Wmissing-prototypes]
    3036 | void __drain_all_pages(struct zone *zone, bool force_all_cpus)
         |      ^
   mm/page_alloc.c:3036:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3036 | void __drain_all_pages(struct zone *zone, bool force_all_cpus)
         | ^
         | static 
   mm/page_alloc.c:3586:15: warning: no previous prototype for function 'should_fail_alloc_page' [-Wmissing-prototypes]
    3586 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^
   mm/page_alloc.c:3586:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3586 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |          ^
         |          static 
   mm/page_alloc.c:6497:20: warning: no previous prototype for function 'memmap_init' [-Wmissing-prototypes]
    6497 | void __init __weak memmap_init(void)
         |                    ^
   mm/page_alloc.c:6497:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6497 | void __init __weak memmap_init(void)
         | ^
         | static 
   mm/page_alloc.c:6535:23: warning: no previous prototype for function 'arch_memmap_init' [-Wmissing-prototypes]
    6535 | void __meminit __weak arch_memmap_init(unsigned long size, int nid,
         |                       ^
   mm/page_alloc.c:6535:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6535 | void __meminit __weak arch_memmap_init(unsigned long size, int nid,
         | ^
         | static 
>> mm/page_alloc.c:6634:6: warning: no previous prototype for function '__zone_set_pageset_high_and_batch' [-Wmissing-prototypes]
    6634 | void __zone_set_pageset_high_and_batch(struct zone *zone, unsigned long high,
         |      ^
   mm/page_alloc.c:6634:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6634 | void __zone_set_pageset_high_and_batch(struct zone *zone, unsigned long high,
         | ^
         | static 
   5 warnings generated.


vim +/__drain_all_pages +3036 mm/page_alloc.c

  3025	
  3026	/*
  3027	 * The implementation of drain_all_pages(), exposing an extra parameter to
  3028	 * drain on all cpus.
  3029	 *
  3030	 * drain_all_pages() is optimized to only execute on cpus where pcplists are
  3031	 * not empty. The check for non-emptiness can however race with a free to
  3032	 * pcplist that has not yet increased the pcp->count from 0 to 1. Callers
  3033	 * that need the guarantee that every CPU has drained can disable the
  3034	 * optimizing racy check.
  3035	 */
> 3036	void __drain_all_pages(struct zone *zone, bool force_all_cpus)
  3037	{
  3038		int cpu;
  3039	
  3040		/*
  3041		 * Allocate in the BSS so we wont require allocation in
  3042		 * direct reclaim path for CONFIG_CPUMASK_OFFSTACK=y
  3043		 */
  3044		static cpumask_t cpus_with_pcps;
  3045	
  3046		/*
  3047		 * Make sure nobody triggers this path before mm_percpu_wq is fully
  3048		 * initialized.
  3049		 */
  3050		if (WARN_ON_ONCE(!mm_percpu_wq))
  3051			return;
  3052	
  3053		/*
  3054		 * Do not drain if one is already in progress unless it's specific to
  3055		 * a zone. Such callers are primarily CMA and memory hotplug and need
  3056		 * the drain to be complete when the call returns.
  3057		 */
  3058		if (unlikely(!mutex_trylock(&pcpu_drain_mutex))) {
  3059			if (!zone)
  3060				return;
  3061			mutex_lock(&pcpu_drain_mutex);
  3062		}
  3063	
  3064		/*
  3065		 * We don't care about racing with CPU hotplug event
  3066		 * as offline notification will cause the notified
  3067		 * cpu to drain that CPU pcps and on_each_cpu_mask
  3068		 * disables preemption as part of its processing
  3069		 */
  3070		for_each_online_cpu(cpu) {
  3071			struct per_cpu_pageset *pcp;
  3072			struct zone *z;
  3073			bool has_pcps = false;
  3074	
  3075			if (force_all_cpus) {
  3076				/*
  3077				 * The pcp.count check is racy, some callers need a
  3078				 * guarantee that no cpu is missed.
  3079				 */
  3080				has_pcps = true;
  3081			} else if (zone) {
  3082				pcp = per_cpu_ptr(zone->pageset, cpu);
  3083				if (pcp->pcp.count)
  3084					has_pcps = true;
  3085			} else {
  3086				for_each_populated_zone(z) {
  3087					pcp = per_cpu_ptr(z->pageset, cpu);
  3088					if (pcp->pcp.count) {
  3089						has_pcps = true;
  3090						break;
  3091					}
  3092				}
  3093			}
  3094	
  3095			if (has_pcps)
  3096				cpumask_set_cpu(cpu, &cpus_with_pcps);
  3097			else
  3098				cpumask_clear_cpu(cpu, &cpus_with_pcps);
  3099		}
  3100	
  3101		for_each_cpu(cpu, &cpus_with_pcps) {
  3102			struct pcpu_drain *drain = per_cpu_ptr(&pcpu_drain, cpu);
  3103	
  3104			drain->zone = zone;
  3105			INIT_WORK(&drain->work, drain_local_pages_wq);
  3106			queue_work_on(cpu, mm_percpu_wq, &drain->work);
  3107		}
  3108		for_each_cpu(cpu, &cpus_with_pcps)
  3109			flush_work(&per_cpu_ptr(&pcpu_drain, cpu)->work);
  3110	
  3111		mutex_unlock(&pcpu_drain_mutex);
  3112	}
  3113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
