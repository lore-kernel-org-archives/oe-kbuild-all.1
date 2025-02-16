Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBDB290F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 05:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739684369; cv=none; b=SE+GjnxNVdhETA5dmwW7n9OkWQxWU76fwzFeic/7GAnEr81lsQAX8tL56JErDIkhh5EZ2B/6l0kar6fk3D8tYhc9cUE5uUhKNIuuDuaQehK+Av3VIAQlUy1VQ5CWkmutnuh86TBNer0rZ+NWMax3/wMGZ6ODlhZbe1bA8DTlM1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739684369; c=relaxed/simple;
	bh=IwOdTigDLkhhy+2M3StP/2Gpl7ERb1Mu0m8oSNrntgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XhlDLC14mEXVPXTV3GQWCIzaoLzqOkBbELjCSBNZqXi8H5QV8gXhXmTxvkNtUKm9hUviluenoSR77wZaIqmGagsFDE0PbzR48LgG1vgK6TwRUxCVUnyGTU3vTvy1ebycTB0UHQk22UBiDAxgA6berI/tN4QGoVDqUuOPuEWH/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emu9FlKU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emu9FlKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739684367; x=1771220367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IwOdTigDLkhhy+2M3StP/2Gpl7ERb1Mu0m8oSNrntgY=;
  b=emu9FlKU+y4y8ncqcMx7o406n3tByuSdBaG+Pni/cnwoCIPk4H+hDRnr
   i2YWx+ulGKMP3g/3ZnZnusI+PbEyQTMpzgupnlJeCvC5J2DIpP9EbZK6/
   /R9WleGURg2svlDJl3RF/V4RiUCjO0ZztRL8C6wU5OAIPYkPqGx6apJO/
   NixwTsVwn4TtJ+vU1VR8y+s4eO6TgfA01UHGhBkWn2fWupV4cHD7NzF5z
   YkCqqh9D2XB1GidxdpWJMpdQeJroKz/auPOus6CWJJg1V9Src7Ga2FWWY
   quz0a3HWD6EXwFz0T7tdFTfIVLRsRuoQgaUn6mgT96qpWc/MPg10Yjj7m
   Q==;
X-CSE-ConnectionGUID: BOCtzpLBQIWVVWWw52SaCw==
X-CSE-MsgGUID: +zkmBNyeSOKFe6BB4v+ZSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="43225256"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="43225256"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 21:39:26 -0800
X-CSE-ConnectionGUID: sA3nh0MXQNyXGF1gtZaQ2w==
X-CSE-MsgGUID: bBV5xc33T5qhBY8QxoQ7Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150989411"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Feb 2025 21:39:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjXNC-001Bcx-1N;
	Sun, 16 Feb 2025 05:39:22 +0000
Date: Sun, 16 Feb 2025 13:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2740/2740] mm/page_alloc.c:3036:6: warning: no
 previous prototype for '__drain_all_pages'
Message-ID: <202502161355.thfOP2mL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vlastimil,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e804018e3930644594e31fd711068f5d48ae05af
commit: e037ee4a8deaff7c579618c0aba1f066d6d14b11 [2740/2740] mm, page_alloc: disable pcplists during memory offline
config: x86_64-buildonly-randconfig-002-20250216 (https://download.01.org/0day-ci/archive/20250216/202502161355.thfOP2mL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502161355.thfOP2mL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502161355.thfOP2mL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:3036:6: warning: no previous prototype for '__drain_all_pages' [-Wmissing-prototypes]
    3036 | void __drain_all_pages(struct zone *zone, bool force_all_cpus)
         |      ^~~~~~~~~~~~~~~~~
   mm/page_alloc.c:3586:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
    3586 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:6497:20: warning: no previous prototype for 'memmap_init' [-Wmissing-prototypes]
    6497 | void __init __weak memmap_init(void)
         |                    ^~~~~~~~~~~
   mm/page_alloc.c:6535:23: warning: no previous prototype for 'arch_memmap_init' [-Wmissing-prototypes]
    6535 | void __meminit __weak arch_memmap_init(unsigned long size, int nid,
         |                       ^~~~~~~~~~~~~~~~
>> mm/page_alloc.c:6634:6: warning: no previous prototype for '__zone_set_pageset_high_and_batch' [-Wmissing-prototypes]
    6634 | void __zone_set_pageset_high_and_batch(struct zone *zone, unsigned long high,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'mem_init_print_info':
   mm/page_alloc.c:7911:27: warning: comparison between two arrays [-Warray-compare]
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7915:9: note: in expansion of macro 'adj_init_size'
    7915 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:27: note: use '&__init_begin[0] <= &_sinittext[0]' to compare the addresses
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7915:9: note: in expansion of macro 'adj_init_size'
    7915 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:41: warning: comparison between two arrays [-Warray-compare]
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7915:9: note: in expansion of macro 'adj_init_size'
    7915 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:41: note: use '&_sinittext[0] < &__init_end[0]' to compare the addresses
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7915:9: note: in expansion of macro 'adj_init_size'
    7915 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:27: warning: comparison between two arrays [-Warray-compare]
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7917:9: note: in expansion of macro 'adj_init_size'
    7917 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7917:9: note: in expansion of macro 'adj_init_size'
    7917 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:41: warning: comparison between two arrays [-Warray-compare]
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7917:9: note: in expansion of macro 'adj_init_size'
    7917 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7917:9: note: in expansion of macro 'adj_init_size'
    7917 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:27: warning: comparison between two arrays [-Warray-compare]
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7918:9: note: in expansion of macro 'adj_init_size'
    7918 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7918:9: note: in expansion of macro 'adj_init_size'
    7918 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:41: warning: comparison between two arrays [-Warray-compare]
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7918:9: note: in expansion of macro 'adj_init_size'
    7918 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7918:9: note: in expansion of macro 'adj_init_size'
    7918 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:27: warning: comparison between two arrays [-Warray-compare]
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7919:9: note: in expansion of macro 'adj_init_size'
    7919 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7919:9: note: in expansion of macro 'adj_init_size'
    7919 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:41: warning: comparison between two arrays [-Warray-compare]
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7919:9: note: in expansion of macro 'adj_init_size'
    7919 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:41: note: use '&__start_rodata[0] < &_etext[0]' to compare the addresses
    7911 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7919:9: note: in expansion of macro 'adj_init_size'
    7919 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7911:27: warning: comparison between two arrays [-Warray-compare]


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
