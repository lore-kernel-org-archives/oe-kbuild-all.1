Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CD72E06ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741532; cv=none; b=IS+5DSiqvuImKmcQy+UoNnopJeHM8Vi1Rac1K+QqPid/JTUIFUrCcpRCIZn3W2ka2U3uBO/udujCbPPIcwZipjUOGTEJj0ymRDddHsJWqNSHM+H8wcuv7ugoAQwihi6kZko4ZakuixJYXKV8vhnVe/+oh+p0pHEox9WLeZGdaqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741532; c=relaxed/simple;
	bh=1uek7R5PKHntWAyUa1OWCvCzx629MZdBHjmdLnVzlU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hpa4F4zNkclpUL4OEPb34JAHvqLg427iTEdHZ0ZQZJVXtNgvu1GTY/8SToRSR3YVV9iP7EUGyv36ItDKCfVa5LsfTcLAIFExo07DRg14VsxeZVvQ2hrEE/jrDZcv+PEjBFFyXxx1WWwRc6GPqUzggrhyVWknavHclmAjct0u00s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmbsH+l0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmbsH+l0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770741531; x=1802277531;
  h=date:from:to:cc:subject:message-id;
  bh=1uek7R5PKHntWAyUa1OWCvCzx629MZdBHjmdLnVzlU0=;
  b=LmbsH+l0oOafxpDYFLpIIbYmktGb19ulLP2oI3cjUIj6jvOgsarwcCF+
   HlnYKOmV5cb9V2T12M3VrznqSKvr7bRVQUG3YxQk3eDHNAFS0uEyh5rwc
   gR9+mmXXMzHl+uBS8C1BD8lFNkQXx6h1CpPRtjuZHaiKHcfdqK+2DGUei
   Ua+0TXxTCQBAobFS4OyBkschwR3xgjT0mgVjLZfzYiYLXFvXysVNZmNN9
   SLxUSmvaoQ4412B/2YvDMJO/emuP6BFFafsMkUgJcH79wueJyfgzAW5wg
   LUgUwFh3AfOxvq3QjA4tDxwTI5TpYXS//40HaRSsnIXKihz4YNaJYYtw7
   Q==;
X-CSE-ConnectionGUID: IvPDptE2TICX8AV3UW515g==
X-CSE-MsgGUID: ukDS7IGBQpCq6Ppu58hwZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75722036"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75722036"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 08:38:50 -0800
X-CSE-ConnectionGUID: 1h195WPtRrmNJKrVAgj8Pg==
X-CSE-MsgGUID: xpuxqQ/5TfWekIcU7v6pMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211074099"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Feb 2026 08:38:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpqlC-00000000pCi-0g1h;
	Tue, 10 Feb 2026 16:38:46 +0000
Date: Wed, 11 Feb 2026 00:37:59 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 19/19] kernel/sched/fair.c:824:42:
 error: 'cfs_rq' undeclared
Message-ID: <202602110042.tePKUn5q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   2457c33520be9ef61c83b8d2308a46f290273ffe
commit: 2457c33520be9ef61c83b8d2308a46f290273ffe [19/19] sched/fair: Revert 6d71a9c61604 ("sched/fair: Fix EEVDF entity placement bug causing scheduling lag")
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260211/202602110042.tePKUn5q-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110042.tePKUn5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110042.tePKUn5q-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'entity_lag':
>> kernel/sched/fair.c:824:42: error: 'cfs_rq' undeclared (first use in this function)
     824 |         u64 max_slice = cfs_rq_max_slice(cfs_rq) + TICK_NSEC;
         |                                          ^~~~~~
   kernel/sched/fair.c:824:42: note: each undeclared identifier is reported only once for each function it appears in


vim +/cfs_rq +824 kernel/sched/fair.c

b72757d8b39995 Peter Zijlstra 2025-04-22  807  
86bfbb7ce4f67a Peter Zijlstra 2023-05-31  808  /*
86bfbb7ce4f67a Peter Zijlstra 2023-05-31  809   * lag_i = S - s_i = w_i * (V - v_i)
147f3efaa24182 Peter Zijlstra 2023-05-31  810   *
147f3efaa24182 Peter Zijlstra 2023-05-31  811   * However, since V is approximated by the weighted average of all entities it
147f3efaa24182 Peter Zijlstra 2023-05-31  812   * is possible -- by addition/removal/reweight to the tree -- to move V around
147f3efaa24182 Peter Zijlstra 2023-05-31  813   * and end up with a larger lag than we started with.
147f3efaa24182 Peter Zijlstra 2023-05-31  814   *
147f3efaa24182 Peter Zijlstra 2023-05-31  815   * Limit this to either double the slice length with a minimum of TICK_NSEC
147f3efaa24182 Peter Zijlstra 2023-05-31  816   * since that is the timing granularity.
147f3efaa24182 Peter Zijlstra 2023-05-31  817   *
147f3efaa24182 Peter Zijlstra 2023-05-31  818   * EEVDF gives the following limit for a steady state system:
147f3efaa24182 Peter Zijlstra 2023-05-31  819   *
147f3efaa24182 Peter Zijlstra 2023-05-31  820   *   -r_max < lag < max(r_max, q)
86bfbb7ce4f67a Peter Zijlstra 2023-05-31  821   */
2457c33520be9e Peter Zijlstra 2026-01-26  822  static s64 entity_lag(u64 avruntime, struct sched_entity *se)
86bfbb7ce4f67a Peter Zijlstra 2023-05-31  823  {
b72757d8b39995 Peter Zijlstra 2025-04-22 @824  	u64 max_slice = cfs_rq_max_slice(cfs_rq) + TICK_NSEC;
1560d1f6eb6b39 Xuewen Yan     2024-04-22  825  	s64 vlag, limit;
1560d1f6eb6b39 Xuewen Yan     2024-04-22  826  
2457c33520be9e Peter Zijlstra 2026-01-26  827  	vlag = avruntime - se->vruntime;
b72757d8b39995 Peter Zijlstra 2025-04-22  828  	limit = calc_delta_fair(max_slice, se);
6d71a9c6160479 Peter Zijlstra 2025-01-09  829  
2457c33520be9e Peter Zijlstra 2026-01-26  830  	return clamp(vlag, -limit, limit);
2457c33520be9e Peter Zijlstra 2026-01-26  831  }
2457c33520be9e Peter Zijlstra 2026-01-26  832  

:::::: The code at line 824 was first introduced by commit
:::::: b72757d8b39995a91663eec1a0b86ff663eaa80a sched/fair: Fix lag clamp

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
