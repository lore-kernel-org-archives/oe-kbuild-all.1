Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4668DF42
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 22:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750370814; cv=none; b=n/NByw7YxTYXUKNRczsS/mDF+sbYhyMDmVHBJyklHkEVv+wlhLPirFALNqlba1xDR+kIRKm6QzNgw+d7X46uGJzXIQDDoylXSDtx0PbiZkwUADeHH/RKonzjjX4WE0STwszy/8JyUCkGv1HCB8tSd6AyZRlxFpsGAVGA4W0cT4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750370814; c=relaxed/simple;
	bh=TQjaiMMRSN5Q72CoYXKCZR+SdcdsJiGjfIOuR5ome04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQlmin5M6x5hfRPvXsQzMSF3hJpAw9sU03AzFQmkLY0pNdqpiYXIZg+Mj7lOiJcL9F8CsgFyLYeOAlt4Q0VldXVbk5v94GPtTwf3aJ8Y6YhQ82vUd+z0G+v3qwFfk3hq5VIB/L5oap4x5SsYAvws7VlcQVX6Tg4539ihuJVOwHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SF+HSnXi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SF+HSnXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750370812; x=1781906812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TQjaiMMRSN5Q72CoYXKCZR+SdcdsJiGjfIOuR5ome04=;
  b=SF+HSnXiKYy71CYueyF8wuLu8a30d8GyOzA8o+fFTG35yBdC8Ozwx7nV
   InIfylQ8Dw/vVFlG5JrRZciSLm42B3i7jOodDs29H7Kyx3BVD3dd0wzvB
   vAZqqa8ypnGPC1dCP1lLh0yFLTKpHTOk63Uz3ateodAbm96qDI7EfWs0R
   80Bw2qK8vR9qhoY7hy5ER+h9+jnXVmCoc9kSl/X7zEq2vaKUF8MGucfXf
   sBwmvHu0jOGb/YGEaulH0ajSgCMUpjgxmcHCnecBr7C/g9reeVqOYm+9H
   FaT792Bs9zoQtNhFWMY3Y5z06ieF2zvM9gcYf/IwtOihZkq+HURF1xaZ7
   Q==;
X-CSE-ConnectionGUID: B+4RlJxcT8GIHf+CpRTeLg==
X-CSE-MsgGUID: 5105yBuSQta6BxtC04hJwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52508767"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="52508767"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 15:06:51 -0700
X-CSE-ConnectionGUID: gixodcfgTsaB8bZ2GEMz8w==
X-CSE-MsgGUID: czKXD0ryRw2czaQAVzNZPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="187967508"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jun 2025 15:06:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSNPD-000L86-12;
	Thu, 19 Jun 2025 22:06:47 +0000
Date: Fri, 20 Jun 2025 06:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zhijian <lizhijian@fujitsu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE
 accounting
Message-ID: <202506200524.r3rTtqLQ-lkp@intel.com>
References: <20250619075245.3272384-1-lizhijian@fujitsu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619075245.3272384-1-lizhijian@fujitsu.com>

Hi Li,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Zhijian/mm-memory-tiering-Fix-PGPROMOTE_CANDIDATE-accounting/20250619-155351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250619075245.3272384-1-lizhijian%40fujitsu.com
patch subject: [PATCH RFC] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE accounting
config: x86_64-buildonly-randconfig-005-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200524.r3rTtqLQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200524.r3rTtqLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200524.r3rTtqLQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'should_numa_migrate_memory':
>> kernel/sched/fair.c:1945:17: error: expected ',' or ';' before 'pgdat'
    1945 |                 pgdat = NODE_DATA(dst_nid);
         |                 ^~~~~


vim +1945 kernel/sched/fair.c

c959924b0dc53b Ying Huang        2022-07-13  1921  
8c9ae56dc73b5a Kefeng Wang       2023-09-21  1922  bool should_numa_migrate_memory(struct task_struct *p, struct folio *folio,
10f39042711ba2 Rik van Riel      2014-01-27  1923  				int src_nid, int dst_cpu)
10f39042711ba2 Rik van Riel      2014-01-27  1924  {
cb361d8cdef699 Jann Horn         2019-07-16  1925  	struct numa_group *ng = deref_curr_numa_group(p);
10f39042711ba2 Rik van Riel      2014-01-27  1926  	int dst_nid = cpu_to_node(dst_cpu);
10f39042711ba2 Rik van Riel      2014-01-27  1927  	int last_cpupid, this_cpupid;
10f39042711ba2 Rik van Riel      2014-01-27  1928  
3fb43636876d98 Byungchul Park    2024-02-19  1929  	/*
3fb43636876d98 Byungchul Park    2024-02-19  1930  	 * Cannot migrate to memoryless nodes.
3fb43636876d98 Byungchul Park    2024-02-19  1931  	 */
3fb43636876d98 Byungchul Park    2024-02-19  1932  	if (!node_state(dst_nid, N_MEMORY))
3fb43636876d98 Byungchul Park    2024-02-19  1933  		return false;
3fb43636876d98 Byungchul Park    2024-02-19  1934  
33024536bafd91 Ying Huang        2022-07-13  1935  	/*
33024536bafd91 Ying Huang        2022-07-13  1936  	 * The pages in slow memory node should be migrated according
33024536bafd91 Ying Huang        2022-07-13  1937  	 * to hot/cold instead of private/shared.
33024536bafd91 Ying Huang        2022-07-13  1938  	 */
2a28713a67fd28 Zi Yan            2024-07-24  1939  	if (folio_use_access_time(folio)) {
33024536bafd91 Ying Huang        2022-07-13  1940  		struct pglist_data *pgdat;
c959924b0dc53b Ying Huang        2022-07-13  1941  		unsigned long rate_limit;
c959924b0dc53b Ying Huang        2022-07-13  1942  		unsigned int latency, th, def_th;
675e22ff5b390e Li Zhijian        2025-06-19  1943  		long nr = folio_nr_pages(folio)
33024536bafd91 Ying Huang        2022-07-13  1944  
33024536bafd91 Ying Huang        2022-07-13 @1945  		pgdat = NODE_DATA(dst_nid);
c959924b0dc53b Ying Huang        2022-07-13  1946  		if (pgdat_free_space_enough(pgdat)) {
c959924b0dc53b Ying Huang        2022-07-13  1947  			/* workload changed, reset hot threshold */
c959924b0dc53b Ying Huang        2022-07-13  1948  			pgdat->nbp_threshold = 0;
675e22ff5b390e Li Zhijian        2025-06-19  1949  			mod_node_page_state(pgdat, PGPROMOTE_CANDIDATE, nr);
33024536bafd91 Ying Huang        2022-07-13  1950  			return true;
c959924b0dc53b Ying Huang        2022-07-13  1951  		}
33024536bafd91 Ying Huang        2022-07-13  1952  
c959924b0dc53b Ying Huang        2022-07-13  1953  		def_th = sysctl_numa_balancing_hot_threshold;
c959924b0dc53b Ying Huang        2022-07-13  1954  		rate_limit = sysctl_numa_balancing_promote_rate_limit << \
c959924b0dc53b Ying Huang        2022-07-13  1955  			(20 - PAGE_SHIFT);
c959924b0dc53b Ying Huang        2022-07-13  1956  		numa_promotion_adjust_threshold(pgdat, rate_limit, def_th);
c959924b0dc53b Ying Huang        2022-07-13  1957  
c959924b0dc53b Ying Huang        2022-07-13  1958  		th = pgdat->nbp_threshold ? : def_th;
8c9ae56dc73b5a Kefeng Wang       2023-09-21  1959  		latency = numa_hint_fault_latency(folio);
33024536bafd91 Ying Huang        2022-07-13  1960  		if (latency >= th)
33024536bafd91 Ying Huang        2022-07-13  1961  			return false;
33024536bafd91 Ying Huang        2022-07-13  1962  
675e22ff5b390e Li Zhijian        2025-06-19  1963  		return !numa_promotion_rate_limit(pgdat, rate_limit, nr);
33024536bafd91 Ying Huang        2022-07-13  1964  	}
33024536bafd91 Ying Huang        2022-07-13  1965  
10f39042711ba2 Rik van Riel      2014-01-27  1966  	this_cpupid = cpu_pid_to_cpupid(dst_cpu, current->pid);
1b143cc77f2074 Kefeng Wang       2023-10-18  1967  	last_cpupid = folio_xchg_last_cpupid(folio, this_cpupid);
37355bdc5a1298 Mel Gorman        2018-10-01  1968  
33024536bafd91 Ying Huang        2022-07-13  1969  	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
33024536bafd91 Ying Huang        2022-07-13  1970  	    !node_is_toptier(src_nid) && !cpupid_valid(last_cpupid))
33024536bafd91 Ying Huang        2022-07-13  1971  		return false;
33024536bafd91 Ying Huang        2022-07-13  1972  
37355bdc5a1298 Mel Gorman        2018-10-01  1973  	/*
37355bdc5a1298 Mel Gorman        2018-10-01  1974  	 * Allow first faults or private faults to migrate immediately early in
37355bdc5a1298 Mel Gorman        2018-10-01  1975  	 * the lifetime of a task. The magic number 4 is based on waiting for
37355bdc5a1298 Mel Gorman        2018-10-01  1976  	 * two full passes of the "multi-stage node selection" test that is
37355bdc5a1298 Mel Gorman        2018-10-01  1977  	 * executed below.
37355bdc5a1298 Mel Gorman        2018-10-01  1978  	 */
98fa15f34cb379 Anshuman Khandual 2019-03-05  1979  	if ((p->numa_preferred_nid == NUMA_NO_NODE || p->numa_scan_seq <= 4) &&
37355bdc5a1298 Mel Gorman        2018-10-01  1980  	    (cpupid_pid_unset(last_cpupid) || cpupid_match_pid(p, last_cpupid)))
37355bdc5a1298 Mel Gorman        2018-10-01  1981  		return true;
10f39042711ba2 Rik van Riel      2014-01-27  1982  
10f39042711ba2 Rik van Riel      2014-01-27  1983  	/*
10f39042711ba2 Rik van Riel      2014-01-27  1984  	 * Multi-stage node selection is used in conjunction with a periodic
10f39042711ba2 Rik van Riel      2014-01-27  1985  	 * migration fault to build a temporal task<->page relation. By using
10f39042711ba2 Rik van Riel      2014-01-27  1986  	 * a two-stage filter we remove short/unlikely relations.
10f39042711ba2 Rik van Riel      2014-01-27  1987  	 *
10f39042711ba2 Rik van Riel      2014-01-27  1988  	 * Using P(p) ~ n_p / n_t as per frequentist probability, we can equate
10f39042711ba2 Rik van Riel      2014-01-27  1989  	 * a task's usage of a particular page (n_p) per total usage of this
10f39042711ba2 Rik van Riel      2014-01-27  1990  	 * page (n_t) (in a given time-span) to a probability.
10f39042711ba2 Rik van Riel      2014-01-27  1991  	 *
10f39042711ba2 Rik van Riel      2014-01-27  1992  	 * Our periodic faults will sample this probability and getting the
10f39042711ba2 Rik van Riel      2014-01-27  1993  	 * same result twice in a row, given these samples are fully
10f39042711ba2 Rik van Riel      2014-01-27  1994  	 * independent, is then given by P(n)^2, provided our sample period
10f39042711ba2 Rik van Riel      2014-01-27  1995  	 * is sufficiently short compared to the usage pattern.
10f39042711ba2 Rik van Riel      2014-01-27  1996  	 *
10f39042711ba2 Rik van Riel      2014-01-27  1997  	 * This quadric squishes small probabilities, making it less likely we
10f39042711ba2 Rik van Riel      2014-01-27  1998  	 * act on an unlikely task<->page relation.
10f39042711ba2 Rik van Riel      2014-01-27  1999  	 */
10f39042711ba2 Rik van Riel      2014-01-27  2000  	if (!cpupid_pid_unset(last_cpupid) &&
10f39042711ba2 Rik van Riel      2014-01-27  2001  				cpupid_to_nid(last_cpupid) != dst_nid)
10f39042711ba2 Rik van Riel      2014-01-27  2002  		return false;
10f39042711ba2 Rik van Riel      2014-01-27  2003  
10f39042711ba2 Rik van Riel      2014-01-27  2004  	/* Always allow migrate on private faults */
10f39042711ba2 Rik van Riel      2014-01-27  2005  	if (cpupid_match_pid(p, last_cpupid))
10f39042711ba2 Rik van Riel      2014-01-27  2006  		return true;
10f39042711ba2 Rik van Riel      2014-01-27  2007  
10f39042711ba2 Rik van Riel      2014-01-27  2008  	/* A shared fault, but p->numa_group has not been set up yet. */
10f39042711ba2 Rik van Riel      2014-01-27  2009  	if (!ng)
10f39042711ba2 Rik van Riel      2014-01-27  2010  		return true;
10f39042711ba2 Rik van Riel      2014-01-27  2011  
10f39042711ba2 Rik van Riel      2014-01-27  2012  	/*
4142c3ebb685bb Rik van Riel      2016-01-25  2013  	 * Destination node is much more heavily used than the source
4142c3ebb685bb Rik van Riel      2016-01-25  2014  	 * node? Allow migration.
10f39042711ba2 Rik van Riel      2014-01-27  2015  	 */
4142c3ebb685bb Rik van Riel      2016-01-25  2016  	if (group_faults_cpu(ng, dst_nid) > group_faults_cpu(ng, src_nid) *
4142c3ebb685bb Rik van Riel      2016-01-25  2017  					ACTIVE_NODE_FRACTION)
10f39042711ba2 Rik van Riel      2014-01-27  2018  		return true;
10f39042711ba2 Rik van Riel      2014-01-27  2019  
10f39042711ba2 Rik van Riel      2014-01-27  2020  	/*
4142c3ebb685bb Rik van Riel      2016-01-25  2021  	 * Distribute memory according to CPU & memory use on each node,
4142c3ebb685bb Rik van Riel      2016-01-25  2022  	 * with 3/4 hysteresis to avoid unnecessary memory migrations:
4142c3ebb685bb Rik van Riel      2016-01-25  2023  	 *
4142c3ebb685bb Rik van Riel      2016-01-25  2024  	 * faults_cpu(dst)   3   faults_cpu(src)
4142c3ebb685bb Rik van Riel      2016-01-25  2025  	 * --------------- * - > ---------------
4142c3ebb685bb Rik van Riel      2016-01-25  2026  	 * faults_mem(dst)   4   faults_mem(src)
10f39042711ba2 Rik van Riel      2014-01-27  2027  	 */
4142c3ebb685bb Rik van Riel      2016-01-25  2028  	return group_faults_cpu(ng, dst_nid) * group_faults(p, src_nid) * 3 >
4142c3ebb685bb Rik van Riel      2016-01-25  2029  	       group_faults_cpu(ng, src_nid) * group_faults(p, dst_nid) * 4;
10f39042711ba2 Rik van Riel      2014-01-27  2030  }
10f39042711ba2 Rik van Riel      2014-01-27  2031  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
