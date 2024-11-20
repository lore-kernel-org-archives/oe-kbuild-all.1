Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3701D1581F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 06:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732083123; cv=none; b=V6iAMSQMQRqmUGl3GO0t1HiyXKEK1guh4iaQ7kcOpvhOU4tWqrBmZrZ5unuAyGr98BeRKrL0wtgWoiJK5uF0h6P4gocIwlTVfgYdjkcjXCnae2YJfkLWgQq++ioxgt47NksIpfTV4tIikCilhrL+5x6jlBnr5SSg0vzZ46Ja54U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732083123; c=relaxed/simple;
	bh=FvptQEqCcEOnmceFusvXqExVdb+8MUl22IrcaVZzCmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vC7a/SgY78XBi0V9NFdiFs0ZhJbcChjRNArH6wsaPMXD6nmpodjWBjSlPnAs3sC6sMiKXHNzKPEnynIAokYE69gG0R3uNBKkLz4vH2MZp0dFJtdKytWHbn+OQlVPGlQEhuMpZcWVsqlLMcsqQz4QYEJcMVuzmcuBzr/tB6wSsM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJOQkWjE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJOQkWjE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732083121; x=1763619121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FvptQEqCcEOnmceFusvXqExVdb+8MUl22IrcaVZzCmM=;
  b=eJOQkWjE2tbafnIhDvN2zWNNhvO7OMkoe5JPI6ogV0MXaDni6Z6r4zOS
   dk7XbOSUNGWfSKYvHktrYLlbMsKq9F67COSHU4O2W8G7W6lnv9nnv9s+O
   aUw8k748wNaT6e7yoZs7OhnfOTk+MkfLfqf+Ld6T9w2ogPFNz2pg22IxR
   Om4c2mOHCTtJkyYlwQQ5LEldG1jegjk8YQyqrmO/9onCC4mTLB251AJ4B
   hkkUDEqGksRf3F63dFuL5JZ9uFgsE1IcwCBAb14Se7YZ1BgBgCVo6YxNY
   /3RfOCB267doE4Ul0tefX+07sknQ6zgq5urMxz3VXQUmL9+iT6LBRT7i/
   Q==;
X-CSE-ConnectionGUID: dbEYaSUlSLegmi1y4K5ZPg==
X-CSE-MsgGUID: AaA/doO4RqK6IVuH8Gxmvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43521142"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="43521142"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 22:11:58 -0800
X-CSE-ConnectionGUID: 33aSoukDQRaeZhIuct6A2A==
X-CSE-MsgGUID: jY9ekUdATiORIjc76ie7TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="90625187"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Nov 2024 22:11:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDdwQ-0000WB-0o;
	Wed, 20 Nov 2024 06:11:54 +0000
Date: Wed, 20 Nov 2024 14:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, NanyongSun <sunnanyong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2430/2430] kernel/sched/topology.c:2385:39:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202411201411.gmJgGdOo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   88a9bf0245509a724bfce4cef1d4dc86f0a117a0
commit: edd5e1effd36972e2b1910661daef5e4249fc3fd [2430/2430] sched/fair: Adjust the allowed NUMA imbalance when SD_NUMA spans multiple LLCs
config: x86_64-randconfig-121-20241114 (https://download.01.org/0day-ci/archive/20241120/202411201411.gmJgGdOo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201411.gmJgGdOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201411.gmJgGdOo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/topology.c:2086:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected int flags @@     got restricted gfp_t @@
   kernel/sched/topology.c:2086:32: sparse:     expected int flags
   kernel/sched/topology.c:2086:32: sparse:     got restricted gfp_t
   kernel/sched/topology.c:2094:61: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got int flags @@
   kernel/sched/topology.c:2094:61: sparse:     expected restricted gfp_t [usertype] flags
   kernel/sched/topology.c:2094:61: sparse:     got int flags
   kernel/sched/topology.c:2122:58: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2122:58: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2122:58: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:121:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:121:56: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:121:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:140:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:140:60: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:140:60: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:163:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:163:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:163:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:463:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:463:19: sparse:     expected struct perf_domain *pd
   kernel/sched/topology.c:463:19: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:626:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:626:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:626:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:682:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:682:9: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/topology.c:682:9: sparse:    struct sparsemask *
   kernel/sched/topology.c:724:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:731:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:741:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:746:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:752:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:758:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:920:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:949:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:993:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:995:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1003:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1005:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1075:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1179:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1482:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:2163:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2334:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2355:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
>> kernel/sched/topology.c:2385:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *top_p @@     got struct sched_domain [noderef] __rcu *parent @@
>> kernel/sched/topology.c:2387:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] top @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2388:47: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *top_p @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2354:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2404:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:74:25: sparse: sparse: dereference of noderef expression
   kernel/sched/topology.c:79:25: sparse: sparse: dereference of noderef expression
   kernel/sched/topology.c: note: in included file:
   kernel/sched/sched.h:1792:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1805:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1805:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1792:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1805:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1497:19: sparse: sparse: dereference of noderef expression

vim +2385 kernel/sched/topology.c

  2277	
  2278	
  2279	/*
  2280	 * Build sched domains for a given set of CPUs and attach the sched domains
  2281	 * to the individual CPUs
  2282	 */
  2283	static int
  2284	build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *attr)
  2285	{
  2286		enum s_alloc alloc_state = sa_none;
  2287		struct sched_domain *sd;
  2288		struct s_data d;
  2289		struct rq *rq = NULL;
  2290		int i, ret = -ENOMEM;
  2291		struct sched_domain_topology_level *tl_asym;
  2292		bool has_asym = false;
  2293		bool has_cluster = false;
  2294	
  2295		if (WARN_ON(cpumask_empty(cpu_map)))
  2296			goto error;
  2297	
  2298		alloc_state = __visit_domain_allocation_hell(&d, cpu_map);
  2299		if (alloc_state != sa_rootdomain)
  2300			goto error;
  2301	
  2302		tl_asym = asym_cpu_capacity_level(cpu_map);
  2303	
  2304		/* Set up domains for CPUs specified by the cpu_map: */
  2305		for_each_cpu(i, cpu_map) {
  2306			struct sched_domain_topology_level *tl;
  2307			int dflags = 0;
  2308	
  2309			sd = NULL;
  2310			for_each_sd_topology(tl) {
  2311				if (tl == tl_asym) {
  2312					dflags |= SD_ASYM_CPUCAPACITY;
  2313					has_asym = true;
  2314				}
  2315	
  2316				if (WARN_ON(!topology_span_sane(tl, cpu_map, i)))
  2317					goto error;
  2318	
  2319				sd = build_sched_domain(tl, cpu_map, attr, sd, dflags, i);
  2320	
  2321				has_cluster |= sd->flags & SD_CLUSTER;
  2322	
  2323				if (tl == sched_domain_topology)
  2324					*per_cpu_ptr(d.sd, i) = sd;
  2325				if (tl->flags & SDTL_OVERLAP)
  2326					sd->flags |= SD_OVERLAP;
  2327				if (cpumask_equal(cpu_map, sched_domain_span(sd)))
  2328					break;
  2329			}
  2330		}
  2331	
  2332		/* Build the groups for the domains */
  2333		for_each_cpu(i, cpu_map) {
  2334			for (sd = *per_cpu_ptr(d.sd, i); sd; sd = sd->parent) {
  2335				sd->span_weight = cpumask_weight(sched_domain_span(sd));
  2336				if (sd->flags & SD_OVERLAP) {
  2337					if (build_overlap_sched_groups(sd, i))
  2338						goto error;
  2339				} else {
  2340					if (build_sched_groups(sd, i))
  2341						goto error;
  2342				}
  2343			}
  2344		}
  2345	
  2346		/*
  2347		 * Calculate an allowed NUMA imbalance such that LLCs do not get
  2348		 * imbalanced.
  2349		 */
  2350		for_each_cpu(i, cpu_map) {
  2351			unsigned int imb = 0;
  2352			unsigned int imb_span = 1;
  2353	
  2354			for (sd = *per_cpu_ptr(d.sd, i); sd; sd = sd->parent) {
  2355				struct sched_domain *child = sd->child;
  2356	
  2357				if (!(sd->flags & SD_SHARE_PKG_RESOURCES) && child &&
  2358				    (child->flags & SD_SHARE_PKG_RESOURCES)) {
  2359					struct sched_domain *top, *top_p;
  2360					unsigned int nr_llcs;
  2361	
  2362					/*
  2363					 * For a single LLC per node, allow an
  2364					 * imbalance up to 25% of the node. This is an
  2365					 * arbitrary cutoff based on SMT-2 to balance
  2366					 * between memory bandwidth and avoiding
  2367					 * premature sharing of HT resources and SMT-4
  2368					 * or SMT-8 *may* benefit from a different
  2369					 * cutoff.
  2370					 *
  2371					 * For multiple LLCs, allow an imbalance
  2372					 * until multiple tasks would share an LLC
  2373					 * on one node while LLCs on another node
  2374					 * remain idle.
  2375					 */
  2376					nr_llcs = sd->span_weight / child->span_weight;
  2377					if (nr_llcs == 1)
  2378						imb = sd->span_weight >> 2;
  2379					else
  2380						imb = nr_llcs;
  2381					sd->imb_numa_nr = imb;
  2382	
  2383					/* Set span based on the first NUMA domain. */
  2384					top = sd;
> 2385					top_p = top->parent;
  2386					while (top_p && !(top_p->flags & SD_NUMA)) {
> 2387						top = top->parent;
  2388						top_p = top->parent;
  2389					}
  2390					imb_span = top_p ? top_p->span_weight : sd->span_weight;
  2391				} else {
  2392					int factor = max(1U, (sd->span_weight / imb_span));
  2393	
  2394					sd->imb_numa_nr = imb * factor;
  2395				}
  2396			}
  2397		}
  2398	
  2399		/* Calculate CPU capacity for physical packages and nodes */
  2400		for (i = nr_cpumask_bits-1; i >= 0; i--) {
  2401			if (!cpumask_test_cpu(i, cpu_map))
  2402				continue;
  2403	
  2404			for (sd = *per_cpu_ptr(d.sd, i); sd; sd = sd->parent) {
  2405				claim_allocations(i, sd);
  2406				init_sched_groups_capacity(i, sd);
  2407			}
  2408		}
  2409	
  2410		/*
  2411		 * Allocate shared sd data at last level cache.  Must be done after
  2412		 * domains are built above, but before the data is used in
  2413		 * cpu_attach_domain and descendants below.
  2414		 */
  2415		if (sd_llc_alloc_all(cpu_map, &d))
  2416			goto error;
  2417	
  2418		/* Attach the domains */
  2419		rcu_read_lock();
  2420		for_each_cpu(i, cpu_map) {
  2421			rq = cpu_rq(i);
  2422			sd = *per_cpu_ptr(d.sd, i);
  2423	
  2424			/* Use READ_ONCE()/WRITE_ONCE() to avoid load/store tearing: */
  2425			if (rq->cpu_capacity_orig > READ_ONCE(d.rd->max_cpu_capacity))
  2426				WRITE_ONCE(d.rd->max_cpu_capacity, rq->cpu_capacity_orig);
  2427	
  2428			cpu_attach_domain(sd, d.rd, i);
  2429		}
  2430		rcu_read_unlock();
  2431	
  2432		if (has_asym)
  2433			static_branch_inc_cpuslocked(&sched_asym_cpucapacity);
  2434	
  2435		if (has_cluster)
  2436			static_branch_inc_cpuslocked(&sched_cluster_active);
  2437	
  2438		if (rq && sched_debug_enabled) {
  2439			pr_info("root domain span: %*pbl (max cpu_capacity = %lu)\n",
  2440				cpumask_pr_args(cpu_map), rq->rd->max_cpu_capacity);
  2441		}
  2442	
  2443		ret = 0;
  2444	error:
  2445		__free_domain_allocs(&d, alloc_state, cpu_map);
  2446	
  2447		return ret;
  2448	}
  2449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
