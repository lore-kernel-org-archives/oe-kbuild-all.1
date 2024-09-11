Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6995419EEB4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 15:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726068185; cv=none; b=KWqPcmR27DffqHATCcRIWJr7pvVjptWd3N+Pg+zsMeujwg42q+lR/5fUNk7yGo4wUmwjCSIXyk7d7o+kf6MGHtltmJ6FE83+rCfm+898PVxCFiYB5xYNF3Nhw6jpTCsIJPpcHToErb9do7cGsY51CEQ+cG5oPJ2eHP7rFqBibzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726068185; c=relaxed/simple;
	bh=QszzWUdZupSDgmdEI7d36Dg+Ea9TqoSacBEVere3Z/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLcBAG8aA8/DFEaNfrgppFEZITdyr5Xp0qVwDR9BuOONy14Zcovpm7n1/OLrIT3JaN8ItXXRrCb22XorfntvYxRMScE3sFTVOz4S3xi8M3JfwoEbkNFNilG2HhigGL5cEVwpu5GSu1M264+s1tXYIygkk/CovUwOXtuYeIFd3Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtsAoDsa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtsAoDsa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726068182; x=1757604182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QszzWUdZupSDgmdEI7d36Dg+Ea9TqoSacBEVere3Z/U=;
  b=WtsAoDsaUW3QToViiDi+1LaGik9taTdLNtJRnplSXD/VeCjVUPYeGRan
   WiOmDr8bHwdQ4DlA+ELvNauZ670Am8GvKUy/4n2BZsZnQe53zgnONix+8
   sybFIOpGGToxpGNoGuAoiU1jZpTFPgUBhK+G35/iU4zsMigEwVvv/l6Vv
   LLz7MkjjPLvvAZDwnHthPch3XqUIC6LyJY7u1n9swoqIdzZf/A7wp+8NJ
   uH8Xbf1/E4qHmqOZqne6EONX3QAxXTGVfIzqTOdA5ThDVX2dGDiAMCODm
   Q0BgUpddJd6ns8tJD6BnrO0fzthiR+WiOz/CxOlqtXPu5nc/xVXiqqQrz
   A==;
X-CSE-ConnectionGUID: LffJO0kYTF+7yyujjfk32g==
X-CSE-MsgGUID: qazUMCuCSS2JWoSRi8dpjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25010680"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="25010680"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:23:01 -0700
X-CSE-ConnectionGUID: RuPjo87BQOqJgQRR6VqC4A==
X-CSE-MsgGUID: ybrvDQcZRhSq46Hnlhy+MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67409719"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Sep 2024 08:23:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soPBK-0003lH-0s;
	Wed, 11 Sep 2024 15:22:58 +0000
Date: Wed, 11 Sep 2024 23:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, NanyongSun <sunnanyong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 16407/30000] kernel/sched/topology.c:2385:39:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202409112326.lXc9OUWp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e23f76121de26a57b9f398c8b1ce5405a88acd8a
commit: edd5e1effd36972e2b1910661daef5e4249fc3fd [16407/30000] sched/fair: Adjust the allowed NUMA imbalance when SD_NUMA spans multiple LLCs
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240911/202409112326.lXc9OUWp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409112326.lXc9OUWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409112326.lXc9OUWp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   kernel/sched/topology.c:724:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:724:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:724:50: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:731:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:731:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:731:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:741:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:741:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:741:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:746:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:746:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:746:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:752:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:752:33: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:752:33: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:758:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:758:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:758:13: sparse:     got struct sched_domain [noderef] __rcu *sd
   kernel/sched/topology.c:920:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:920:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:920:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:949:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:949:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:949:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:993:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:993:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:993:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:995:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:995:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:995:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1003:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1003:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1003:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1005:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1005:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1005:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1075:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1075:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1075:62: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1179:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1179:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1179:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1482:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1482:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1482:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:2163:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2163:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2163:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2334:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2334:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2334:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2355:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:2355:56: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:2355:56: sparse:     got struct sched_domain [noderef] __rcu *child
>> kernel/sched/topology.c:2385:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *top_p @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2385:39: sparse:     expected struct sched_domain *top_p
   kernel/sched/topology.c:2385:39: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/topology.c:2387:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] top @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2387:45: sparse:     expected struct sched_domain *[assigned] top
   kernel/sched/topology.c:2387:45: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2388:47: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *top_p @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2388:47: sparse:     expected struct sched_domain *top_p
   kernel/sched/topology.c:2388:47: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2354:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2354:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2354:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2404:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2404:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2404:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:74:25: sparse: sparse: dereference of noderef expression
   kernel/sched/topology.c:79:25: sparse: sparse: dereference of noderef expression
   kernel/sched/topology.c: note: in included file:
   kernel/sched/sched.h:1792:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1792:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/sched.h:1792:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/sched.h:1805:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1805:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/sched.h:1805:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/sched.h:1805:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1805:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/sched.h:1805:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/sched.h:1792:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1792:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/sched.h:1792:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/sched.h:1805:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/sched.h:1805:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/sched.h:1805:9: sparse:     got struct sched_domain [noderef] __rcu *parent
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
