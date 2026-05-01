Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C572387582
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777632962; cv=none; b=VxKNjr7fdv1h+YLc1CsuLHdlbzR7u/0Ig5tHVkLNG48oHqKDJI1l+OLjrTzsGv0sJaPnnrGsk55mvF6UISotfdZ9TxkEJnBV5qk60yqbJ8/BDmwfH1XJbu1vrdKsbSCrQ8B8O7Z7p6lduSpthOjHRt6+UX72W1nxpphklVwehXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777632962; c=relaxed/simple;
	bh=B9k2W1qnkspUZ8629bLo3NyhJcXoi3Rhb1p2KXB5fCw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V3JdDztXc+2SFAT9oGuHQx6QjTYU4nHwiF75hApqJVcK7ncEKMA6feMC40lMxZANRoY/lXIDe068OuPy8Ak3+JnZSt5cWltEVzOmbO+JBVS0ohVHT/hYLC7Pziv974bGhI6HN1O1CC94+1DWZWwYsxAGK2OWSrinvwORJ1iCcQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrqYGyBr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrqYGyBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777632961; x=1809168961;
  h=date:from:to:cc:subject:message-id;
  bh=B9k2W1qnkspUZ8629bLo3NyhJcXoi3Rhb1p2KXB5fCw=;
  b=jrqYGyBrWOtkOIIP/EWGtwVfmdchyDqwznzbvhck+7hb+HO8H04IDYx4
   CG0Xk+V0Vp7nTGkqUjg/V0s9DeU6Zd/tK2xlkN9onRUROyWT2F+doRDiF
   2NIMFm2eV0fyr2tC9McfAaBdmMjHPlFgibUFIxEbQKLTLu9ND6SRLsDlr
   nRj/Eqx4vv+byjdnVuTv0B50FnCCeQNvjsw7hqpimbTTTgzoD4jI8Bs39
   CyH1KI6yzi9tbhIrxDfyKWGxR8KCJbGD4pi9oPZY89f/sq/9Owp7StsVO
   s9vLbJVvvrg9+T+TywqVjKRQqgtNk2qnnJI+rCgq7ofmHcMxwnaJqzIeb
   w==;
X-CSE-ConnectionGUID: 3vIe7//ATI2GtWtyFb/XVA==
X-CSE-MsgGUID: NbLSM0SNRWiZQYQH5EMNAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="96012004"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="96012004"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 03:56:01 -0700
X-CSE-ConnectionGUID: lZiLYv9GSrO5MuIeNeUxOQ==
X-CSE-MsgGUID: U44ytumAR3Wv5faYDqEXow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="233794452"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 May 2026 03:55:59 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIlXH-000000000Tn-1bNi;
	Fri, 01 May 2026 10:55:55 +0000
Date: Fri, 01 May 2026 18:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Ballasi <tballasi@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/vmscan.c:6585:66: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202605011838.0NbkvDxs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26fd6bff2c050196005312d1d306889220952a99
commit: 874a0a566ede40f3d6062cae8fe1022e616edd1a mm: vmscan: add cgroup IDs to vmscan tracepoints
date:   4 weeks ago
config: m68k-randconfig-r113-20260501 (https://download.01.org/0day-ci/archive/20260501/202605011838.0NbkvDxs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011838.0NbkvDxs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 874a0a566ede ("mm: vmscan: add cgroup IDs to vmscan tracepoints")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011838.0NbkvDxs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/vmscan.c:6585:66: sparse: sparse: Using plain integer as NULL pointer
   mm/vmscan.c:6589:58: sparse: sparse: Using plain integer as NULL pointer

vim +6585 mm/vmscan.c

  6551	
  6552	unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
  6553					gfp_t gfp_mask, nodemask_t *nodemask)
  6554	{
  6555		unsigned long nr_reclaimed;
  6556		struct scan_control sc = {
  6557			.nr_to_reclaim = SWAP_CLUSTER_MAX,
  6558			.gfp_mask = current_gfp_context(gfp_mask),
  6559			.reclaim_idx = gfp_zone(gfp_mask),
  6560			.order = order,
  6561			.nodemask = nodemask,
  6562			.priority = DEF_PRIORITY,
  6563			.may_writepage = 1,
  6564			.may_unmap = 1,
  6565			.may_swap = 1,
  6566		};
  6567	
  6568		/*
  6569		 * scan_control uses s8 fields for order, priority, and reclaim_idx.
  6570		 * Confirm they are large enough for max values.
  6571		 */
  6572		BUILD_BUG_ON(MAX_PAGE_ORDER >= S8_MAX);
  6573		BUILD_BUG_ON(DEF_PRIORITY > S8_MAX);
  6574		BUILD_BUG_ON(MAX_NR_ZONES > S8_MAX);
  6575	
  6576		/*
  6577		 * Do not enter reclaim if fatal signal was delivered while throttled.
  6578		 * 1 is returned so that the page allocator does not OOM kill at this
  6579		 * point.
  6580		 */
  6581		if (throttle_direct_reclaim(sc.gfp_mask, zonelist, nodemask))
  6582			return 1;
  6583	
  6584		set_task_reclaim_state(current, &sc.reclaim_state);
> 6585		trace_mm_vmscan_direct_reclaim_begin(sc.gfp_mask, order, 0);
  6586	
  6587		nr_reclaimed = do_try_to_free_pages(zonelist, &sc);
  6588	
  6589		trace_mm_vmscan_direct_reclaim_end(nr_reclaimed, 0);
  6590		set_task_reclaim_state(current, NULL);
  6591	
  6592		return nr_reclaimed;
  6593	}
  6594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
