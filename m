Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C2222F76C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750185258; cv=none; b=Yry7D7Atn3LNrILNbgaNe9gj56Hb7mphqkM/ukOh+PJqr2aQMCiu1qc44rlVGX7WOqdjc1gFiI5HUP8e2cEOEztx0+EvxRYssTJvhNqQSxW8IVR2UvRfLL0RvISzYCCWtHomSE8EnTEUfXipA+9/RtwwSH22zWBvjCBiww9+7UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750185258; c=relaxed/simple;
	bh=usiIIORzoha/u8WxQCGSH41ezMXd3ZD6iAZRNaIyiis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fJFCbRgF46EHsO7O0rgqIztKtrjCqlu6gWP5cacOWvHsbcCy0L9f0QJCJOUMfO1XojMI87/BsaoEjM4HX9fU6NiRLSj++opQHgOgwS7DY0O/zH87W+n6RVxnCHWRHGP9YDlDIQ0tjUx0Q98UuU/52yWPAEpyMb8eiZqQdLUaqgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q17JoNdH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q17JoNdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750185256; x=1781721256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=usiIIORzoha/u8WxQCGSH41ezMXd3ZD6iAZRNaIyiis=;
  b=Q17JoNdHXyP/Asuyt7sZtebZXpastrTwNdy8aB4WCood1cXWHu/vevLb
   L0kLuqMCk5na9ZmFOuIb5M8CvSysD45qEF9WjY/0JhWjwt4Pm8DMo5w/j
   MvJmqMfAkkNYVey69u6UDnKHl0IIj8Ps1+4h1W/NYEfha4QjayNrnfRbC
   v18/d5NToxp+dqPAvvFySKBeXZVWNDppqlco/4ROyKIvFLbzBn84Z1zk/
   s452vE6hZqXzz/daSZu8x6xbFMlRD0s2Eff/hSONpXm20AoBFHXonVN8q
   R0eLm+pfMcKg/DZ1AVUf3Res9Ulo3jWAt9sTzEIEufx4xrSseJuzprlIv
   w==;
X-CSE-ConnectionGUID: I7IZXaocT4qwhxM0eP/lfg==
X-CSE-MsgGUID: lWU5SZDARvGLt/JWrZUlIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52242817"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52242817"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 11:34:16 -0700
X-CSE-ConnectionGUID: IadD8vgOQrCEov6if7KUyA==
X-CSE-MsgGUID: /RLdSF5iQkSzmXDfDL14Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="149430658"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jun 2025 11:34:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRb8N-000Hzi-38;
	Tue, 17 Jun 2025 18:34:11 +0000
Date: Wed, 18 Jun 2025 02:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2972/2972] mm/page_alloc.c:3036:6: sparse:
 sparse: symbol '__drain_all_pages' was not declared. Should it be static?
Message-ID: <202506180245.7SnAHLlR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   cc1aeac9c11885a0ae2fb835e9b054205d753c94
commit: e037ee4a8deaff7c579618c0aba1f066d6d14b11 [2972/2972] mm, page_alloc: disable pcplists during memory offline
config: x86_64-randconfig-123-20250617 (https://download.01.org/0day-ci/archive/20250618/202506180245.7SnAHLlR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180245.7SnAHLlR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180245.7SnAHLlR-lkp@intel.com/

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
