Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A22DF13B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780331688; cv=none; b=bTmCH2aF7Izj/zyJ4SytoBAJiZN0T5nxtvGIcH4VGfgAy2eqhSEuQcUfXcOeaq31+aA/1EhRMevAfD3cOEN0NQNf9lH6BoWxQdDBmX7EGQebDpM2CuvZLZJ/AoCRIg74x2mtaMf86JHzlVCDQh9Iniyomuy/NhqYM4bC5apwyCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780331688; c=relaxed/simple;
	bh=2H1DY9K3cwezU2kGbNUZ/1sCCWUbpdwrcvsfR1A4PTE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gYjANtwWxWpJvwzeSuENslz6eyT/+7Qhm2Vl0Q/iYvChf64CGuqh/uQjJ07xw3BUOYiGK6Cs2Ej25eC5o68YrAL8z1rrq9oKOftRaARB3Yd2x0KeN1yK/iVsgpRe99aWuuHhoIhOf2s6fYApa9z+XKLP+H8fFdX+Y3IsLqFWim4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baGKUH2m; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baGKUH2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780331688; x=1811867688;
  h=date:from:to:cc:subject:message-id;
  bh=2H1DY9K3cwezU2kGbNUZ/1sCCWUbpdwrcvsfR1A4PTE=;
  b=baGKUH2mCKjjBZ7Y5rTUo6Zj4vA0Tns6pH/3vexCh1YIMmU5F9PvT8q2
   0rjya/wqkp8hV+j9dZKQpPzHyzcKwkOfBkYWeoUyYp1Na6D4Heu/5+dZa
   pZEWHG8QH1pCh4y8EeE36v5JWluwFCw0b1iJFTWoxICyFbPjWTXFyU8DI
   6jk/iNxrtdkFvAINVMRUEAvGXB4/chVfOkkjlm+AHvLO2n4W7L5bJ/b2v
   k8oxB48LsEpk6Z/hoNelygJa0UUIGzgUOKh4y4HLX/ig77Ny8409fY4j3
   TSRZqentD+L+HCEgfrM+sA2lY2SRVQ6u5Yp3DjS/gH4AGtdZHSKFLRdS6
   A==;
X-CSE-ConnectionGUID: Vm4NUpQLQR686Ehq9Rb0LQ==
X-CSE-MsgGUID: Xnrz//RJQuSCBpSMqOy2Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106543560"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="106543560"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 09:34:46 -0700
X-CSE-ConnectionGUID: pDOr7+UYSOWGM0VbsdpfOQ==
X-CSE-MsgGUID: odw9bFdXS/GyOwGgzeuMrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="242573666"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Jun 2026 09:34:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU5b6-00000000AoX-21Xf;
	Mon, 01 Jun 2026 16:34:40 +0000
Date: Tue, 02 Jun 2026 00:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Ballasi <tballasi@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/vmscan.c:6585:66: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202606020025.ZBQ7ncEa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: 874a0a566ede40f3d6062cae8fe1022e616edd1a mm: vmscan: add cgroup IDs to vmscan tracepoints
date:   8 weeks ago
config: alpha-randconfig-r122-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020025.ZBQ7ncEa-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020025.ZBQ7ncEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 874a0a566ede ("mm: vmscan: add cgroup IDs to vmscan tracepoints")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020025.ZBQ7ncEa-lkp@intel.com/

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
