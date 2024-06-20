Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2932E171A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718898974; cv=none; b=p0rdszC/L5/inVRNrt14bigO5PgZeapkykPwW0tt28oejkpjecPSJo0IZB0Pp78IV7ezIu4eOswwoIn4+P7ZuLmJvg81LPHuSMWa4lORDl20c+++IeDwEoD8JpkyDFvu6lyFRjUenzmIZ1EYRMxfy61pgXTtTmka6UKQR+ufM1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718898974; c=relaxed/simple;
	bh=e5YBrZB05Qj2ERYZ0i60lsTWPdjDy8z6njnlaTQIits=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+aSW/40MWcyjDcRU1yC1W2+Do9+VNTXKIxhhbfo4ArwemjSJ3JOgJ+UORGjvAPbyYh3+gDjqM2CMEVbKBqAIV9A8Iyncs/F+ua/oS+U9VFFpmBC9XukkPKpmcGDD0pwWUwrcyXjuHlg8ASJgY4Do2K4Zcr80rQ01TUbk6NFWyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Llp0tCfU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Llp0tCfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718898972; x=1750434972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e5YBrZB05Qj2ERYZ0i60lsTWPdjDy8z6njnlaTQIits=;
  b=Llp0tCfUZK58HjL/xXBp4evs2NYXqHmkiH3Awo7sF+ODORQpW1KDZ59Z
   cB+2SuPZ9PcExjh3Gapa6/ZIErvtuRpknWcieGX7hNfPug0fXWeXKHsC1
   dFfm0atz/HZBtRfAR/Wg1JPPSnr6PCOExlJi8xxcoAjCXTr8AnH7F2vWM
   7APpKI+QG4hNNRZaZD2WUKfmo0NQhQ5sDlm4hicdiQVeiC5p9J013DjA3
   +/rVAzkys697Fg87wpkZgA2W+ToTSE3bagPSy9jaV8hia50zlPS7jnAjj
   jtiFXTGwNAMU1+g5p123ErPjs3R1DxJdCUq//KQmGHTN4KiIACx5JsOeV
   w==;
X-CSE-ConnectionGUID: ApPFnqUeTCe85haFCZ8n8Q==
X-CSE-MsgGUID: rd+6HFBnQuiDzYMirTYBPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15723040"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="15723040"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 08:56:11 -0700
X-CSE-ConnectionGUID: a92khhqjTqqMcWIZCdX16Q==
X-CSE-MsgGUID: SZkMEoAESQKu1hesQj0C5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="42747589"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jun 2024 08:56:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKK8s-0007i6-2G;
	Thu, 20 Jun 2024 15:56:06 +0000
Date: Thu, 20 Jun 2024 23:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6447/7105] mm/mempolicy.c:2280:15: error:
 redefinition of 'folio_alloc_mpol_noprof'
Message-ID: <202406202319.pBcCfVar-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2102cb0d050d34d50b9642a3a50861787527e922
commit: f85385e70cb4bbb569298830fdf0a3d8325de36d [6447/7105] mm: add folio_alloc_mpol()
config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/archive/20240620/202406202319.pBcCfVar-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406202319.pBcCfVar-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406202319.pBcCfVar-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                        ^~
   mm/mempolicy.c:2058:35: error: 'struct mempolicy' has no member named 'home_node'
    2058 |                         *nid = pol->home_node;
         |                                   ^~
   mm/mempolicy.c:2063:60: error: 'struct mempolicy' has no member named 'nodes'
    2063 |                     cpuset_nodemask_valid_mems_allowed(&pol->nodes))
         |                                                            ^~
   mm/mempolicy.c:2064:40: error: 'struct mempolicy' has no member named 'nodes'
    2064 |                         nodemask = &pol->nodes;
         |                                        ^~
   mm/mempolicy.c:2065:24: error: 'struct mempolicy' has no member named 'home_node'
    2065 |                 if (pol->home_node != NUMA_NO_NODE)
         |                        ^~
   mm/mempolicy.c:2066:35: error: 'struct mempolicy' has no member named 'home_node'
    2066 |                         *nid = pol->home_node;
         |                                   ^~
   mm/mempolicy.c: At top level:
   mm/mempolicy.c:2172:6: warning: no previous prototype for 'mempolicy_in_oom_domain' [-Wmissing-prototypes]
    2172 | bool mempolicy_in_oom_domain(struct task_struct *tsk,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c: In function 'mempolicy_in_oom_domain':
   mm/mempolicy.c:2182:26: error: 'struct task_struct' has no member named 'mempolicy'; did you mean 'policy'?
    2182 |         mempolicy = tsk->mempolicy;
         |                          ^~~~~~~~~
         |                          policy
   mm/mempolicy.c:2183:35: error: 'struct mempolicy' has no member named 'mode'
    2183 |         if (mempolicy && mempolicy->mode == MPOL_BIND)
         |                                   ^~
   mm/mempolicy.c:2184:49: error: 'struct mempolicy' has no member named 'nodes'
    2184 |                 ret = nodes_intersects(mempolicy->nodes, *mask);
         |                                                 ^~
   include/linux/nodemask.h:211:46: note: in definition of macro 'nodes_intersects'
     211 |                         __nodes_intersects(&(src1), &(src2), MAX_NUMNODES)
         |                                              ^~~~
   mm/mempolicy.c: At top level:
   mm/mempolicy.c:2221:14: error: redefinition of 'alloc_pages_mpol_noprof'
    2221 | struct page *alloc_pages_mpol_noprof(gfp_t gfp, unsigned int order,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/slab.h:16,
                    from include/linux/mempolicy.h:11:
   include/linux/gfp.h:315:28: note: previous definition of 'alloc_pages_mpol_noprof' with type 'struct page *(gfp_t,  unsigned int,  struct mempolicy *, long unsigned int,  int)' {aka 'struct page *(unsigned int,  unsigned int,  struct mempolicy *, long unsigned int,  int)'}
     315 | static inline struct page *alloc_pages_mpol_noprof(gfp_t gfp, unsigned int order,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c: In function 'alloc_pages_mpol_noprof':
   mm/mempolicy.c:2229:16: error: 'struct mempolicy' has no member named 'mode'
    2229 |         if (pol->mode == MPOL_PREFERRED_MANY)
         |                ^~
   mm/mempolicy.c:2245:24: error: 'struct mempolicy' has no member named 'mode'
    2245 |                 if (pol->mode != MPOL_INTERLEAVE &&
         |                        ^~
   mm/mempolicy.c:2246:24: error: 'struct mempolicy' has no member named 'mode'
    2246 |                     pol->mode != MPOL_WEIGHTED_INTERLEAVE &&
         |                        ^~
   In file included from include/linux/build_bug.h:5,
                    from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12:
   mm/mempolicy.c:2267:25: error: 'struct mempolicy' has no member named 'mode'
    2267 |         if (unlikely(pol->mode == MPOL_INTERLEAVE) && page) {
         |                         ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   mm/mempolicy.c:2269:43: error: 'vm_numa_stat_key' undeclared (first use in this function); did you mean 'vma_numab_state'?
    2269 |                 if (static_branch_likely(&vm_numa_stat_key) &&
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/jump_label.h:511:41: note: in expansion of macro 'likely_notrace'
     511 | #define static_branch_likely(x)         likely_notrace(static_key_enabled(&(x)->key))
         |                                         ^~~~~~~~~~~~~~
   include/linux/jump_label.h:511:56: note: in expansion of macro 'static_key_enabled'
     511 | #define static_branch_likely(x)         likely_notrace(static_key_enabled(&(x)->key))
         |                                                        ^~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:2269:21: note: in expansion of macro 'static_branch_likely'
    2269 |                 if (static_branch_likely(&vm_numa_stat_key) &&
         |                     ^~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:2269:43: note: each undeclared identifier is reported only once for each function it appears in
    2269 |                 if (static_branch_likely(&vm_numa_stat_key) &&
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/jump_label.h:511:41: note: in expansion of macro 'likely_notrace'
     511 | #define static_branch_likely(x)         likely_notrace(static_key_enabled(&(x)->key))
         |                                         ^~~~~~~~~~~~~~
   include/linux/jump_label.h:511:56: note: in expansion of macro 'static_key_enabled'
     511 | #define static_branch_likely(x)         likely_notrace(static_key_enabled(&(x)->key))
         |                                                        ^~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:2269:21: note: in expansion of macro 'static_branch_likely'
    2269 |                 if (static_branch_likely(&vm_numa_stat_key) &&
         |                     ^~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:2272:25: error: implicit declaration of function '__count_numa_event'; did you mean '__count_vm_event'? [-Werror=implicit-function-declaration]
    2272 |                         __count_numa_event(page_zone(page), NUMA_INTERLEAVE_HIT);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         __count_vm_event
   mm/mempolicy.c:2272:61: error: 'NUMA_INTERLEAVE_HIT' undeclared (first use in this function)
    2272 |                         __count_numa_event(page_zone(page), NUMA_INTERLEAVE_HIT);
         |                                                             ^~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c: At top level:
>> mm/mempolicy.c:2280:15: error: redefinition of 'folio_alloc_mpol_noprof'
    2280 | struct folio *folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/gfp.h:324:29: note: previous definition of 'folio_alloc_mpol_noprof' with type 'struct folio *(gfp_t,  unsigned int,  struct mempolicy *, long unsigned int,  int)' {aka 'struct folio *(unsigned int,  unsigned int,  struct mempolicy *, long unsigned int,  int)'}
     324 | static inline struct folio *folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/gfp.h:330:9: error: conflicting types for 'folio_alloc_noprof'; have 'struct folio *(gfp_t,  int)' {aka 'struct folio *(unsigned int,  int)'}
     330 |         folio_alloc_noprof(gfp, order)
         |         ^~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:2303:15: note: in expansion of macro 'vma_alloc_folio_noprof'
    2303 | struct folio *vma_alloc_folio_noprof(gfp_t gfp, int order, struct vm_area_struct *vma,
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/gfp.h:320:29: note: previous definition of 'folio_alloc_noprof' with type 'struct folio *(gfp_t,  unsigned int)' {aka 'struct folio *(unsigned int,  unsigned int)'}
     320 | static inline struct folio *folio_alloc_noprof(gfp_t gfp, unsigned int order)
         |                             ^~~~~~~~~~~~~~~~~~
   mm/mempolicy.c: In function 'folio_alloc_noprof':
   mm/mempolicy.c:2310:30: error: 'vma' undeclared (first use in this function)
    2310 |         pol = get_vma_policy(vma, addr, order, &ilx);
         |                              ^~~
   mm/mempolicy.c:2310:35: error: 'addr' undeclared (first use in this function)
    2310 |         pol = get_vma_policy(vma, addr, order, &ilx);
         |                                   ^~~~
   In file included from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/x86/include/asm/current.h:10:
   mm/mempolicy.c: At top level:
   mm/mempolicy.c:2316:15: error: 'vma_alloc_folio_noprof' undeclared here (not in a function); did you mean 'filemap_alloc_folio_noprof'?
    2316 | EXPORT_SYMBOL(vma_alloc_folio_noprof);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:23: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   mm/mempolicy.c:2316:1: note: in expansion of macro 'EXPORT_SYMBOL'
    2316 | EXPORT_SYMBOL(vma_alloc_folio_noprof);
         | ^~~~~~~~~~~~~
   mm/mempolicy.c:2332:14: error: redefinition of 'alloc_pages_noprof'
    2332 | struct page *alloc_pages_noprof(gfp_t gfp, unsigned int order)
         |              ^~~~~~~~~~~~~~~~~~
   include/linux/gfp.h:311:28: note: previous definition of 'alloc_pages_noprof' with type 'struct page *(gfp_t,  unsigned int)' {aka 'struct page *(unsigned int,  unsigned int)'}
     311 | static inline struct page *alloc_pages_noprof(gfp_t gfp_mask, unsigned int order)
         |                            ^~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:2348:15: error: conflicting types for 'folio_alloc_noprof'; have 'struct folio *(gfp_t,  unsigned int)' {aka 'struct folio *(unsigned int,  unsigned int)'}
    2348 | struct folio *folio_alloc_noprof(gfp_t gfp, unsigned int order)
         |               ^~~~~~~~~~~~~~~~~~
   include/linux/gfp.h:330:9: note: previous definition of 'folio_alloc_noprof' with type 'struct folio *(gfp_t,  int)' {aka 'struct folio *(unsigned int,  int)'}
     330 |         folio_alloc_noprof(gfp, order)
         |         ^~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:2303:15: note: in expansion of macro 'vma_alloc_folio_noprof'
    2303 | struct folio *vma_alloc_folio_noprof(gfp_t gfp, int order, struct vm_area_struct *vma,
         |               ^~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c: In function 'alloc_pages_bulk_array_interleave':
   mm/mempolicy.c:2365:33: error: 'struct mempolicy' has no member named 'nodes'
    2365 |         nodes = nodes_weight(pol->nodes);
         |                                 ^~
   include/linux/nodemask.h:238:49: note: in definition of macro 'nodes_weight'
     238 | #define nodes_weight(nodemask) __nodes_weight(&(nodemask), MAX_NUMNODES)
         |                                                 ^~~~~~~~
   mm/mempolicy.c: In function 'alloc_pages_bulk_array_weighted_interleave':
   mm/mempolicy.c:2423:18: error: 'struct task_struct' has no member named 'il_prev'
    2423 |         node = me->il_prev;
         |                  ^~
   mm/mempolicy.c:2424:20: error: 'struct task_struct' has no member named 'il_weight'
    2424 |         weight = me->il_weight;
         |                    ^~
   mm/mempolicy.c:2433:27: error: 'struct task_struct' has no member named 'il_weight'
    2433 |                         me->il_weight -= rem_pages;
         |                           ^~
   mm/mempolicy.c:2440:11: error: 'struct task_struct' has no member named 'il_weight'
    2440 |         me->il_weight = 0;
         |           ^~
   mm/mempolicy.c:2498:11: error: 'struct task_struct' has no member named 'il_prev'
    2498 |         me->il_prev = resume_node;
         |           ^~
   mm/mempolicy.c:2499:11: error: 'struct task_struct' has no member named 'il_weight'
    2499 |         me->il_weight = resume_weight;
         |           ^~
   mm/mempolicy.c: In function 'alloc_pages_bulk_array_preferred_many':
   mm/mempolicy.c:2514:73: error: 'struct mempolicy' has no member named 'nodes'
    2514 |         nr_allocated  = alloc_pages_bulk_noprof(preferred_gfp, nid, &pol->nodes,
         |                                                                         ^~
   mm/mempolicy.c: In function 'alloc_pages_bulk_array_mempolicy_noprof':
   mm/mempolicy.c:2540:16: error: 'struct mempolicy' has no member named 'mode'
    2540 |         if (pol->mode == MPOL_INTERLEAVE)
         |                ^~
   mm/mempolicy.c:2544:16: error: 'struct mempolicy' has no member named 'mode'
    2544 |         if (pol->mode == MPOL_WEIGHTED_INTERLEAVE)
         |                ^~
   mm/mempolicy.c:2548:16: error: 'struct mempolicy' has no member named 'mode'
    2548 |         if (pol->mode == MPOL_PREFERRED_MANY)
         |                ^~
   mm/mempolicy.c: At top level:
   mm/mempolicy.c:2558:5: error: redefinition of 'vma_dup_policy'
    2558 | int vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst)
         |     ^~~~~~~~~~~~~~
   include/linux/mempolicy.h:232:1: note: previous definition of 'vma_dup_policy' with type 'int(struct vm_area_struct *, struct vm_area_struct *)'
     232 | vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst)
         | ^~~~~~~~~~~~~~


vim +/folio_alloc_mpol_noprof +2280 mm/mempolicy.c

  2279	
> 2280	struct folio *folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
  2281			struct mempolicy *pol, pgoff_t ilx, int nid)
  2282	{
  2283		return page_rmappable_folio(alloc_pages_mpol_noprof(gfp | __GFP_COMP,
  2284								order, pol, ilx, nid));
  2285	}
  2286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
