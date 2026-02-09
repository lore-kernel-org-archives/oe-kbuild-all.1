Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE662D8767
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 17:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770658552; cv=none; b=HdTq/A0ihDWj+gd3mW+wo8+43cQwTAfDHORFMVvgLRr9b3z95nm6fVlZXGfGBIz/L54nvimX/mFt8mOlsiFtwFpcEOHTssYAtdoDetjJY1FZh/vOPm+CvnnkjWGONGOnpkIzIhPYRjWsEjMtx5yzvtawxeEq4j9fyp7vWUJQniE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770658552; c=relaxed/simple;
	bh=EVNEOsSqCrglGTokDOgirFkgBDnfB+3J7NuJI5kojPQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uAbcMk0jyViG7G/rkkwiDKUiO+HOXDzuHXwaaP1TQ7juzJ4bNNFMRW8oMvZykyiCFRO20PdpZyv2T/6mM2WypwiK9glPpPxkbMOSzq5RH8NEUPYi0aAUMU7kR6vHtfeijAf+uEq+gnW62kXZFwtVHp/EXgVzvQHGvwIKFZVPKS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQopX/dX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQopX/dX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770658552; x=1802194552;
  h=date:from:to:cc:subject:message-id;
  bh=EVNEOsSqCrglGTokDOgirFkgBDnfB+3J7NuJI5kojPQ=;
  b=GQopX/dXQSt35ZQnR2/+tqGsqbxcqijcmJ2pebdy0KdNv50HaZshAC24
   PrvBa2MWH29g7tTTgvJVnypBQWUXXD7Yzx7Xe0/VnB6aikxtAgj0hmH2g
   y7rIyE4Ch2cl8SnDbzev+zZvRq1JHtvWkyFRYk2b7CDPqsfiMmCRS1a9M
   XjBAH2YESddDfHQg5o6dB25yEGHfe7OdJ1zMCweDThKlsZvvgJZu6Mw7c
   XAGgn5MRASsuGO1TBOG9yawQ/KL7+qKgpU0Nba4fRHLjx2e7evbx8gYXX
   JQV98i2SZJ1XuiRyoTIi+GBu6yuUpawUrJwuNY99zHSn6h06GKCH6UCce
   A==;
X-CSE-ConnectionGUID: YXjmxyVOSD+QXpCr7akJbg==
X-CSE-MsgGUID: yKn1Tt0mS/+jGkyeDEYr2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74375231"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="74375231"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 09:35:52 -0800
X-CSE-ConnectionGUID: YYhaM0E+R1eca07cuVAvOQ==
X-CSE-MsgGUID: VholjdQtRYitHuyMDsoK8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216622490"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Feb 2026 09:35:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpVAp-00000000oB9-3NW6;
	Mon, 09 Feb 2026 17:35:47 +0000
Date: Tue, 10 Feb 2026 01:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 112/124] mm/damon/core.c:1862:25: error: 'c'
 undeclared
Message-ID: <202602100155.sDqMXews-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   a8c204a2a82057d70dd8944476dd043dc52561ed
commit: 7fdffc23ed84ea44a9f15f71d15b00a94f326acd [112/124] mm/damon/core: unify damon_warn_fix_nr_accesses_corruption() with damon_verify_reset_aggregated()
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260210/202602100155.sDqMXews-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100155.sDqMXews-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100155.sDqMXews-lkp@intel.com/

Note: the sj/damon/next HEAD a8c204a2a82057d70dd8944476dd043dc52561ed builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/cgroup.h:12,
                    from include/linux/memcontrol.h:13,
                    from include/linux/damon.h:11,
                    from mm/damon/core.c:10:
   mm/damon/core.c: In function 'damon_warn_fix_nr_accesses_corruption':
>> mm/damon/core.c:1862:25: error: 'c' undeclared (first use in this function)
    1862 |                         c->passed_sample_intervals,
         |                         ^
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:555:9: note: in expansion of macro 'printk'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   mm/damon/core.c:1861:9: note: in expansion of macro 'pr_err'
    1861 |         pr_err("passed_sis %lu next_aggregation_sis %lu\n",
         |         ^~~~~~
   mm/damon/core.c:1862:25: note: each undeclared identifier is reported only once for each function it appears in
    1862 |                         c->passed_sample_intervals,
         |                         ^
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:555:9: note: in expansion of macro 'printk'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   mm/damon/core.c:1861:9: note: in expansion of macro 'pr_err'
    1861 |         pr_err("passed_sis %lu next_aggregation_sis %lu\n",
         |         ^~~~~~


vim +/c +1862 mm/damon/core.c

89796f03081328 SeongJae Park 2025-12-02  1844  
591c4c78be0636 SeongJae Park 2025-05-12  1845  /*
591c4c78be0636 SeongJae Park 2025-05-12  1846   * Warn and fix corrupted ->nr_accesses[_bp] for investigations and preventing
591c4c78be0636 SeongJae Park 2025-05-12  1847   * the problem being propagated.
591c4c78be0636 SeongJae Park 2025-05-12  1848   */
591c4c78be0636 SeongJae Park 2025-05-12  1849  static void damon_warn_fix_nr_accesses_corruption(struct damon_region *r)
591c4c78be0636 SeongJae Park 2025-05-12  1850  {
591c4c78be0636 SeongJae Park 2025-05-12  1851  	if (r->nr_accesses_bp == r->nr_accesses * 10000)
591c4c78be0636 SeongJae Park 2025-05-12  1852  		return;
7fdffc23ed84ea SeongJae Park 2026-02-04  1853  #ifndef CONFIG_DAMON_HARDENED
591c4c78be0636 SeongJae Park 2025-05-12  1854  	WARN_ONCE(true, "invalid nr_accesses_bp at reset: %u %u\n",
591c4c78be0636 SeongJae Park 2025-05-12  1855  			r->nr_accesses_bp, r->nr_accesses);
591c4c78be0636 SeongJae Park 2025-05-12  1856  	r->nr_accesses_bp = r->nr_accesses * 10000;
7fdffc23ed84ea SeongJae Park 2026-02-04  1857  #else
5b9f4fef2cb618 SeongJae Park 2026-01-03  1858  	pr_err("reset time invalid region found!\n");
5b9f4fef2cb618 SeongJae Park 2026-01-03  1859  	pr_err("nr_accesses_bp %u last_nr_acceses %u\n",
5b9f4fef2cb618 SeongJae Park 2026-01-03  1860  			r->nr_accesses_bp, r->last_nr_accesses);
5b9f4fef2cb618 SeongJae Park 2026-01-03  1861  	pr_err("passed_sis %lu next_aggregation_sis %lu\n",
5b9f4fef2cb618 SeongJae Park 2026-01-03 @1862  			c->passed_sample_intervals,
5b9f4fef2cb618 SeongJae Park 2026-01-03  1863  			c->next_aggregation_sis);
5b9f4fef2cb618 SeongJae Park 2026-01-03  1864  	BUG();
5b9f4fef2cb618 SeongJae Park 2026-01-03  1865  #endif
7fdffc23ed84ea SeongJae Park 2026-02-04  1866  }
5b9f4fef2cb618 SeongJae Park 2026-01-03  1867  

:::::: The code at line 1862 was first introduced by commit
:::::: 5b9f4fef2cb618ee597b3345dee579340e8d5d43 mm/damon/core: add damon_reset_aggregated() hardening

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: SeongJae Park <sj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
