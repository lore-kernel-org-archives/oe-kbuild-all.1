Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D705B167DB7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741446675; cv=none; b=sVUyAuGjjKbTsVpBmDqM0VRVS0REZL8IqiGxqw9uHmVUNotv0zXXych8tLg5Sgc5by+Mm5BIu3G8dmsnnfbIy0fjLRYTqrhgUv/22gqkYCwnm3ni9Bhrb5S7DnoD1S4FAhsByhkTJzDUWHktF9yeV0eNKjLbuWdPRHhpurZYtMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741446675; c=relaxed/simple;
	bh=4Wx2jeQvaWXg3NBS+LdWL+pS5MRB0VD1kkNQNQaFuYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FWiVIJn+8kcCkL8vjBdp5QHYb1fGs/lIAxeGaE+yg0WNcisBYuOCzCw8rZ/MtohevyX0EIYO/yI77+rmqnOzI5eHJnA8LHBPz8IaN/wkHjwkMuCNYAopezWsibmmy/7cHm+YDXP1T4QjpNTcBMgKTFpcxlxCHhSMhFbMg4Vp/YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLkLH1gG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLkLH1gG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741446674; x=1772982674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Wx2jeQvaWXg3NBS+LdWL+pS5MRB0VD1kkNQNQaFuYk=;
  b=FLkLH1gGTDggtnoIKhHlOTOL76HjvV6TGIA0XxaVltXlZ21s4WVwFAS+
   crhcJpBdaQT/O3Nv7MDivuVvZ4wsZa6OCzHn2Vabmm2hg7J3DuXt6Biri
   b4pZmkO9Or8DXMUmVaQpXoq2t42sURfEFzYLJJKUzyuW9nvQ0ktbbzUHI
   RnHnzKeKn3X7xF/jpmqJcnnXtvyqdZ7/ziaiqVVSIRazHfj2zOqS5upRA
   ziXqQsUyofozlfMWfGSEVKgWBFqZzdwISR0i+tYkQ+xC07XS2gcqrib0e
   xyOyKef6Kv+c63POK1Oodq2CmQlKCYWGZ3HiCF5uVJ/9RItjd7BHPl7bi
   A==;
X-CSE-ConnectionGUID: LIkFdIWHS8ed86KZ1KAjzw==
X-CSE-MsgGUID: 8tGqlyY5SgSkox8EzQiziA==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42681857"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="42681857"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 07:11:13 -0800
X-CSE-ConnectionGUID: MMiyfYU0QnqZJsRNa+uqog==
X-CSE-MsgGUID: gppOa1ldQ2anS6a83MVl2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="124653625"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 08 Mar 2025 07:11:11 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqvpV-0001zY-39;
	Sat, 08 Mar 2025 15:11:09 +0000
Date: Sat, 8 Mar 2025 23:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2790/2790] mm/page_alloc.c:3036:6: sparse:
 sparse: symbol '__drain_all_pages' was not declared. Should it be static?
Message-ID: <202503082314.gTnzWY6P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2e32af659ca005096d96fb7e433bd96744b02844
commit: e037ee4a8deaff7c579618c0aba1f066d6d14b11 [2790/2790] mm, page_alloc: disable pcplists during memory offline
config: arm64-randconfig-r131-20250308 (https://download.01.org/0day-ci/archive/20250308/202503082314.gTnzWY6P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250308/202503082314.gTnzWY6P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503082314.gTnzWY6P-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_alloc.c:3036:6: sparse: sparse: symbol '__drain_all_pages' was not declared. Should it be static?
>> mm/page_alloc.c:6634:6: sparse: sparse: symbol '__zone_set_pageset_high_and_batch' was not declared. Should it be static?
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:327:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:327:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:327:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:327:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:327:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:327:27: sparse: sparse: restricted gfp_t degrades to integer

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
