Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D99D7603D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 11:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706699412; cv=none; b=oHKixQ4iGQOQNsJW3+x/Kd3vMpotbK3ATSLWTbvpHMw9E8OgQQGXRpK92OWNDWXP/q2eMGOzIxXkMj+S8o/BjEyRUwQOAfam+TFl2Nnijid1iCIdUrZCcN5lAads8qQep0i+65HeyBlUgt0Ln8UZXFLW56O9bYajUNZl3QD8mzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706699412; c=relaxed/simple;
	bh=pw2WHo9Rys7CGi0vIdywPgvAf1pYrN6eNG4pNI96Uuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JX7YINHazMHtVKbJ8/p/pc9IzjyoOFBxyGpcfm3PpFN6JVT8GSBTU6+veY90LgJkdmveSTLYnRzyfp3uWy8ifxAfedIDCGnibJnC96ht2CgUVpIUhr/BeUiDhAyakZu62JKfZoImF5AyCOIlUmcNwCDuOwjiX5Y4TvK1vQCfIy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Md1v/GAM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Md1v/GAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706699409; x=1738235409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pw2WHo9Rys7CGi0vIdywPgvAf1pYrN6eNG4pNI96Uuo=;
  b=Md1v/GAMMfP4PEseOVxtINnKahZ4ywmC6v2eUbhVag6h1mH8ECmMg8to
   DOR+5B0nz3EBGcknhRTAnPjDAMKKjxVpCLdcuY3v7exfoGjHzndogV8eT
   ZjWQIeBt7lWAkFfN0ZeQ2WrS82BBKBHiW7i1k1ljLaL4/Wk4p/pCfG1Yp
   huSfbUPaKXzu28Yf8aCQ5YQ03t7eclgr5MhunHxksY/F52Hebyl0OgNS0
   RdzdFQWwZzH4Nau+C23N5wlHXNysHrZriSxsWTp3GUkeL1j1ScGcThFlZ
   DehDDMwKDc9+4JxBpZODPr5fkzvDu1+WllpXY3VI8SMPINBLNf7/Kv431
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10205196"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10205196"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 03:10:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4034398"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 31 Jan 2024 03:10:05 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV8Ti-0001Uc-0D;
	Wed, 31 Jan 2024 11:10:02 +0000
Date: Wed, 31 Jan 2024 19:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>, Honggyu Kim <honggyu.kim@sk.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>,
	Srinivasulu Thanneeru <sthanneeru.opensrc@micron.com>,
	Ravi Jonnalagadda <ravis.opensrc@micron.com>
Subject: [gmprice:weighted_interleave-next 3/3] mm/mempolicy.c:2426:17:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202401311847.cQJ7VsI5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux weighted_interleave-next
head:   8b894625fd0b7f702c0aa6e14bb673c59f42effc
commit: 8b894625fd0b7f702c0aa6e14bb673c59f42effc [3/3] mm/mempolicy: introduce MPOL_WEIGHTED_INTERLEAVE for weighted interleaving
config: x86_64-randconfig-121-20240131 (https://download.01.org/0day-ci/archive/20240131/202401311847.cQJ7VsI5-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311847.cQJ7VsI5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311847.cQJ7VsI5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mempolicy.c:158:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:158:15: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:158:15: sparse:     got unsigned char *
   mm/mempolicy.c:1984:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:1984:15: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:1984:15: sparse:     got unsigned char *
>> mm/mempolicy.c:2426:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *weights @@     got void * @@
   mm/mempolicy.c:2426:17: sparse:     expected unsigned char [noderef] [usertype] __rcu *weights
   mm/mempolicy.c:2426:17: sparse:     got void *
   mm/mempolicy.c:2431:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:2431:15: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:2431:15: sparse:     got unsigned char *
>> mm/mempolicy.c:2433:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *weights @@
   mm/mempolicy.c:2433:17: sparse:     expected void const *
   mm/mempolicy.c:2433:17: sparse:     got unsigned char [noderef] [usertype] __rcu *weights
>> mm/mempolicy.c:2433:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *table @@
   mm/mempolicy.c:2433:17: sparse:     expected void const *
   mm/mempolicy.c:2433:17: sparse:     got unsigned char [noderef] [usertype] __rcu *table
>> mm/mempolicy.c:2433:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *weights @@
   mm/mempolicy.c:2433:17: sparse:     expected void const *
   mm/mempolicy.c:2433:17: sparse:     got unsigned char [noderef] [usertype] __rcu *weights
>> mm/mempolicy.c:2433:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *table @@
   mm/mempolicy.c:2433:17: sparse:     expected void const *
   mm/mempolicy.c:2433:17: sparse:     got unsigned char [noderef] [usertype] __rcu *table
>> mm/mempolicy.c:2433:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got unsigned char [noderef] [usertype] __rcu *weights @@
   mm/mempolicy.c:2433:17: sparse:     expected void *p
   mm/mempolicy.c:2433:17: sparse:     got unsigned char [noderef] [usertype] __rcu *weights
>> mm/mempolicy.c:2433:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *q @@     got unsigned char [noderef] [usertype] __rcu *table @@
   mm/mempolicy.c:2433:17: sparse:     expected void const *q
   mm/mempolicy.c:2433:17: sparse:     got unsigned char [noderef] [usertype] __rcu *table
>> mm/mempolicy.c:2489:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *weights @@
   mm/mempolicy.c:2489:15: sparse:     expected void const *objp
   mm/mempolicy.c:2489:15: sparse:     got unsigned char [noderef] [usertype] __rcu *weights
   mm/mempolicy.c:3357:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *new @@     got void * @@
   mm/mempolicy.c:3357:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3357:13: sparse:     got void *
   mm/mempolicy.c:3362:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *old @@     got unsigned char * @@
   mm/mempolicy.c:3362:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3362:13: sparse:     got unsigned char *
   mm/mempolicy.c:3365:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3365:17: sparse:     expected void const *
   mm/mempolicy.c:3365:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3365:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3365:17: sparse:     expected void const *
   mm/mempolicy.c:3365:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3365:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3365:17: sparse:     expected void const *
   mm/mempolicy.c:3365:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3365:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3365:17: sparse:     expected void const *
   mm/mempolicy.c:3365:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3365:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3365:17: sparse:     expected void *p
   mm/mempolicy.c:3365:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3365:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *q @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3365:17: sparse:     expected void const *q
   mm/mempolicy.c:3365:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3370:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3370:15: sparse:     expected void const *objp
   mm/mempolicy.c:3370:15: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3466:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *old @@     got unsigned char * @@
   mm/mempolicy.c:3466:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3466:13: sparse:     got unsigned char *
   mm/mempolicy.c:3471:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3471:15: sparse:     expected void const *objp
   mm/mempolicy.c:3471:15: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:160:31: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:548:17: sparse: sparse: context imbalance in 'queue_folios_pte_range' - unexpected unlock
   mm/mempolicy.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   mm/mempolicy.c:1988:39: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:1998:39: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2400:9: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2401:13: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2402:30: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2408:33: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2412:41: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2419:30: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2438:29: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2439:32: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2440:40: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2453:32: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2456:17: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2456:33: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2457:30: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2459:29: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2460:39: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2461:34: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2465:38: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2468:56: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2472:49: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:3366:12: sparse: sparse: dereference of noderef expression

vim +2426 mm/mempolicy.c

  2371	
  2372	static unsigned long alloc_pages_bulk_array_weighted_interleave(gfp_t gfp,
  2373			struct mempolicy *pol, unsigned long nr_pages,
  2374			struct page **page_array)
  2375	{
  2376		struct task_struct *me = current;
  2377		unsigned long total_allocated = 0;
  2378		unsigned long nr_allocated = 0;
  2379		unsigned long rounds;
  2380		unsigned long node_pages, delta;
  2381		u8 __rcu *table, *weights, weight;
  2382		unsigned int weight_total = 0;
  2383		unsigned long rem_pages = nr_pages;
  2384		nodemask_t nodes;
  2385		int nnodes, node, next_node;
  2386		int resume_node = MAX_NUMNODES - 1;
  2387		u8 resume_weight = 0;
  2388		int prev_node;
  2389		int i;
  2390	
  2391		if (!nr_pages)
  2392			return 0;
  2393	
  2394		nnodes = read_once_policy_nodemask(pol, &nodes);
  2395		if (!nnodes)
  2396			return 0;
  2397	
  2398		/* Continue allocating from most recent node and adjust the nr_pages */
  2399		node = me->il_prev;
  2400		weight = me->il_weight;
  2401		if (weight && node_isset(node, nodes)) {
  2402			node_pages = min(rem_pages, weight);
  2403			nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
  2404							  NULL, page_array);
  2405			page_array += nr_allocated;
  2406			total_allocated += nr_allocated;
  2407			/* if that's all the pages, no need to interleave */
  2408			if (rem_pages < weight) {
  2409				/* stay on current node, adjust il_weight */
  2410				me->il_weight -= rem_pages;
  2411				return total_allocated;
  2412			} else if (rem_pages == weight) {
  2413				/* move to next node / weight */
  2414				me->il_prev = next_node_in(node, nodes);
  2415				me->il_weight = get_il_weight(next_node);
  2416				return total_allocated;
  2417			}
  2418			/* Otherwise we adjust remaining pages, continue from there */
  2419			rem_pages -= weight;
  2420		}
  2421		/* clear active weight in case of an allocation failure */
  2422		me->il_weight = 0;
  2423		prev_node = node;
  2424	
  2425		/* create a local copy of node weights to operate on outside rcu */
> 2426		weights = kzalloc(nr_node_ids, GFP_KERNEL);
  2427		if (!weights)
  2428			return total_allocated;
  2429	
  2430		rcu_read_lock();
  2431		table = rcu_dereference(iw_table);
  2432		if (table)
> 2433			memcpy(weights, table, nr_node_ids);
  2434		rcu_read_unlock();
  2435	
  2436		/* calculate total, detect system default usage */
  2437		for_each_node_mask(node, nodes) {
  2438			if (!weights[node])
  2439				weights[node] = 1;
  2440			weight_total += weights[node];
  2441		}
  2442	
  2443		/*
  2444		 * Calculate rounds/partial rounds to minimize __alloc_pages_bulk calls.
  2445		 * Track which node weighted interleave should resume from.
  2446		 *
  2447		 * if (rounds > 0) and (delta == 0), resume_node will always be
  2448		 * the node following prev_node and its weight.
  2449		 */
  2450		rounds = rem_pages / weight_total;
  2451		delta = rem_pages % weight_total;
  2452		resume_node = next_node_in(prev_node, nodes);
  2453		resume_weight = weights[resume_node];
  2454		for (i = 0; i < nnodes; i++) {
  2455			node = next_node_in(prev_node, nodes);
  2456			weight = weights[node];
  2457			node_pages = weight * rounds;
  2458			/* If a delta exists, add this node's portion of the delta */
  2459			if (delta > weight) {
  2460				node_pages += weight;
  2461				delta -= weight;
  2462			} else if (delta) {
  2463				node_pages += delta;
  2464				/* delta may deplete on a boundary or w/ a remainder */
  2465				if (delta == weight) {
  2466					/* boundary: resume from next node/weight */
  2467					resume_node = next_node_in(node, nodes);
  2468					resume_weight = weights[resume_node];
  2469				} else {
  2470					/* remainder: resume this node w/ remainder */
  2471					resume_node = node;
  2472					resume_weight = weight - delta;
  2473				}
  2474				delta = 0;
  2475			}
  2476			/* node_pages can be 0 if an allocation fails and rounds == 0 */
  2477			if (!node_pages)
  2478				break;
  2479			nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
  2480							  NULL, page_array);
  2481			page_array += nr_allocated;
  2482			total_allocated += nr_allocated;
  2483			if (total_allocated == nr_pages)
  2484				break;
  2485			prev_node = node;
  2486		}
  2487		me->il_prev = resume_node;
  2488		me->il_weight = resume_weight;
> 2489		kfree(weights);
  2490		return total_allocated;
  2491	}
  2492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
