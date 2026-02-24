Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84A313635C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 03:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771904041; cv=none; b=DLIORL1xM2EyQ3hTMxSiV8GG6o4IWd0eCSGAkdWbNxkSBef/nR3MsNn5lGnMzJErQH4vMAT4bw3gmZCCv97pDKFeSDnLKKPfXcD7bX7Wn9d37feGBjcUj1aqmvp61OR+lfe1/IyExxXYYmd3QIHeQPDITJDgdL4LnW3ZHvsg0CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771904041; c=relaxed/simple;
	bh=1V5HIo83cL2gqtWVyQHa5ddpMLT9OpDvGqnI/OagdO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnYOU991eDsMD0WVJAQxab//6fZrPX4jtgsPAnrqGAc8iUmyCRs3IKRBkjBNzdPN2e+GLqyqC/r4o6UOykWzvm0DUghw2LQWw7h1mNQW5dNe4TyU/L9h1NDZkXzYZsioNjG4+JskkwvMOaq0OtHMcp0tk7fhH5WtwXuv1fkmfOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8rkcwJ1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8rkcwJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771904040; x=1803440040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1V5HIo83cL2gqtWVyQHa5ddpMLT9OpDvGqnI/OagdO4=;
  b=e8rkcwJ10X3Vo5ks+nGUf1LGeimzVAgO00SPKAGluBr8n7IDSqVBb//p
   IDaG56Iowclw2l3iq2zx3uMDAJHtQa0AGQXWNcK8Ol2y3du1QpHpBlQ/W
   5s3xJuCuLQAxWkxZAzovDSK8h3Bl27vqAy2t8jRWPcgUHYNF2zuOQkuXQ
   SOfBac1oUiT2VdnnBvRSQLh8pzhrjMepAP1Aff21ThCG5Ynh/bgFFSInA
   3m/Dik82vftcm+BuBK5q8ZuF4A7fk7VBfaPkyWK9DUhZ7Lmw/LAgZcXl5
   Y+PuzFrSHBaYMm3hSPZT0EvrzeSHtSNXxQGnKMExkzyNO3vP/Ix0zmN6u
   g==;
X-CSE-ConnectionGUID: fAzNsjFkT0SH37rYZIGr0w==
X-CSE-MsgGUID: ZyYWb76fT+2GaPrC7T9uQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83235110"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="83235110"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 19:34:00 -0800
X-CSE-ConnectionGUID: 2s9oKbjpQ0ubQoXjr4JEEg==
X-CSE-MsgGUID: onq6Fm7ZTvWOBDWvNo0Obw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="220330238"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Feb 2026 19:33:58 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vujBL-000000001Mj-44Lr;
	Tue, 24 Feb 2026 03:33:55 +0000
Date: Tue, 24 Feb 2026 11:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/6] mm/memcontrol, page_counter: Make memory.low
 tier-aware
Message-ID: <202602241138.vaT8Mo2z-lkp@intel.com>
References: <20260223223830.586018-6-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223223830.586018-6-joshua.hahnjy@gmail.com>

Hi Joshua,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-page_counter-Introduce-tiered-memory-awareness-to-page_counter/20260224-073845
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260223223830.586018-6-joshua.hahnjy%40gmail.com
patch subject: [RFC PATCH 5/6] mm/memcontrol, page_counter: Make memory.low tier-aware
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260224/202602241138.vaT8Mo2z-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241138.vaT8Mo2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241138.vaT8Mo2z-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'shrink_one':
>> mm/vmscan.c:4909:24: error: 'tier_aware_memcg_limits' undeclared (first use in this function)
    4909 |         bool toptier = tier_aware_memcg_limits &&
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:4909:24: note: each undeclared identifier is reported only once for each function it appears in
   mm/vmscan.c: In function 'shrink_node_memcgs':
   mm/vmscan.c:6003:41: error: 'tier_aware_memcg_limits' undeclared (first use in this function)
    6003 |                                         tier_aware_memcg_limits && toptier)) {
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~


vim +/tier_aware_memcg_limits +4909 mm/vmscan.c

  4901	
  4902	static int shrink_one(struct lruvec *lruvec, struct scan_control *sc)
  4903	{
  4904		bool success;
  4905		unsigned long scanned = sc->nr_scanned;
  4906		unsigned long reclaimed = sc->nr_reclaimed;
  4907		struct mem_cgroup *memcg = lruvec_memcg(lruvec);
  4908		struct pglist_data *pgdat = lruvec_pgdat(lruvec);
> 4909		bool toptier = tier_aware_memcg_limits &&
  4910			       node_is_toptier(pgdat->node_id);
  4911	
  4912		/* lru_gen_age_node() called mem_cgroup_calculate_protection() */
  4913		if (mem_cgroup_below_min(NULL, memcg))
  4914			return MEMCG_LRU_YOUNG;
  4915	
  4916		if (mem_cgroup_below_low(NULL, memcg, toptier)) {
  4917			/* see the comment on MEMCG_NR_GENS */
  4918			if (READ_ONCE(lruvec->lrugen.seg) != MEMCG_LRU_TAIL)
  4919				return MEMCG_LRU_TAIL;
  4920	
  4921			memcg_memory_event(memcg, MEMCG_LOW);
  4922		}
  4923	
  4924		success = try_to_shrink_lruvec(lruvec, sc);
  4925	
  4926		shrink_slab(sc->gfp_mask, pgdat->node_id, memcg, sc->priority);
  4927	
  4928		if (!sc->proactive)
  4929			vmpressure(sc->gfp_mask, memcg, false, sc->nr_scanned - scanned,
  4930				   sc->nr_reclaimed - reclaimed);
  4931	
  4932		flush_reclaim_state(sc);
  4933	
  4934		if (success && mem_cgroup_online(memcg))
  4935			return MEMCG_LRU_YOUNG;
  4936	
  4937		if (!success && lruvec_is_sizable(lruvec, sc))
  4938			return 0;
  4939	
  4940		/* one retry if offlined or too small */
  4941		return READ_ONCE(lruvec->lrugen.seg) != MEMCG_LRU_TAIL ?
  4942		       MEMCG_LRU_TAIL : MEMCG_LRU_YOUNG;
  4943	}
  4944	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
