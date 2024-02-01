Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8194347A76
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 23:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706829770; cv=none; b=uUQqwdx0/ulFicERibPix4VK49j4fiP5JfcaH8jiwmwlm+mqrRp7puL4LMCtVVFV0TKATW2H3A/4V/XpeaLDwOUtF5g9ZBuNifr+nk7M9v1yqyXbXvaCxASGdglOCz+ZqBeg9Y3wKjTer57QBtWyW+2jf5/DI3oO/796vu7rgF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706829770; c=relaxed/simple;
	bh=uGT4Fs5j3Sub0T5VTwa9quKG+DSXUC+tzuM5QSAs7B0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ovstcfvkoHGQui0DwBeBbOqpETz9nSeOFcQ7zk1VVlqoknOZpBF9wWyWRcvPEodyo0lS+iv0SqD7qBchKbpUhqsRVJ4Vw/ZvsoLvo6uNAM4ivMVsyYvfXFvkcSf47m7YntJBj9bVTRFht7biPFwKJCeKgSUoCmzJu51Q2o4J+0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsA6RjEs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsA6RjEs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706829768; x=1738365768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uGT4Fs5j3Sub0T5VTwa9quKG+DSXUC+tzuM5QSAs7B0=;
  b=gsA6RjEsA0Yfsaz6MwMGjxYHnqv+ok06hGncFqzi0xLlLopOMuuRbwss
   +wsF08BJSSZTJyrsdu/9bZ5LtyxK6wUy2V/qKB+bhbURr/KWMwHHZdV7/
   mJ9GPfEP6f9fj6tPnnGiKijTBtxmu/yOOR90Tgm+LiC/mSm86+7aEv5MU
   97/kQTAK8A6K9N1aG7u4fn8B5x1WPG2mFsx1H0oz2bO3zb6HzYuWb1cuy
   SHThmdSPDB5gfxGTBh193hW4xnsaKxB/PNLm8dy9+Me+JjdtUgqAwoBLa
   bxM/+KX57KJM0S9eXgI/FcVwtVJJ9Lbjo0w8rFVwhCrjrVvor4FESLoQ0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11133422"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="11133422"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 15:22:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="859268169"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="859268169"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2024 15:22:44 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVgOH-0003Kk-2p;
	Thu, 01 Feb 2024 23:22:41 +0000
Date: Fri, 2 Feb 2024 07:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rakie Kim <rakie.kim@sk.com>, Honggyu Kim <honggyu.kim@sk.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>,
	Srinivasulu Thanneeru <sthanneeru.opensrc@micron.com>,
	Ravi Jonnalagadda <ravis.opensrc@micron.com>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [linux-next:master 2950/3381] mm/mempolicy.c:2429:17: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202402020709.T2xuCcCe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   51b70ff55ed88edd19b080a524063446bcc34b62
commit: 147371fd14993ae64ef2f612eb15f37fcef12d83 [2950/3381] mm/mempolicy: introduce MPOL_WEIGHTED_INTERLEAVE for weighted interleaving
config: loongarch-randconfig-r123-20240201 (https://download.01.org/0day-ci/archive/20240202/202402020709.T2xuCcCe-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240202/202402020709.T2xuCcCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402020709.T2xuCcCe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mempolicy.c:158:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:158:15: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:158:15: sparse:     got unsigned char *
   mm/mempolicy.c:1980:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:1980:15: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:1980:15: sparse:     got unsigned char *
   mm/mempolicy.c:2422:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *weights @@     got void * @@
   mm/mempolicy.c:2422:17: sparse:     expected unsigned char [noderef] [usertype] __rcu *weights
   mm/mempolicy.c:2422:17: sparse:     got void *
   mm/mempolicy.c:2427:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:2427:15: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:2427:15: sparse:     got unsigned char *
>> mm/mempolicy.c:2429:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *__to @@     got unsigned char [noderef] [usertype] __rcu *weights @@
   mm/mempolicy.c:2429:17: sparse:     expected void *__to
   mm/mempolicy.c:2429:17: sparse:     got unsigned char [noderef] [usertype] __rcu *weights
>> mm/mempolicy.c:2429:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *__from @@     got unsigned char [noderef] [usertype] __rcu *table @@
   mm/mempolicy.c:2429:17: sparse:     expected void const *__from
   mm/mempolicy.c:2429:17: sparse:     got unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:2485:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *weights @@
   mm/mempolicy.c:2485:15: sparse:     expected void const *objp
   mm/mempolicy.c:2485:15: sparse:     got unsigned char [noderef] [usertype] __rcu *weights
   mm/mempolicy.c:3353:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *new @@     got void * @@
   mm/mempolicy.c:3353:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3353:13: sparse:     got void *
   mm/mempolicy.c:3358:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *old @@     got unsigned char * @@
   mm/mempolicy.c:3358:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3358:13: sparse:     got unsigned char *
   mm/mempolicy.c:3361:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *__to @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3361:17: sparse:     expected void *__to
   mm/mempolicy.c:3361:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3361:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *__from @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3361:17: sparse:     expected void const *__from
   mm/mempolicy.c:3361:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3366:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3366:15: sparse:     expected void const *objp
   mm/mempolicy.c:3366:15: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3462:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *old @@     got unsigned char * @@
   mm/mempolicy.c:3462:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3462:13: sparse:     got unsigned char *
   mm/mempolicy.c:3467:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3467:15: sparse:     expected void const *objp
   mm/mempolicy.c:3467:15: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c: note: in included file (through include/linux/mmzone.h, include/linux/mempolicy.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   mm/mempolicy.c:160:31: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:548:17: sparse: sparse: context imbalance in 'queue_folios_pte_range' - unexpected unlock
   mm/mempolicy.c:1984:39: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:1994:39: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2396:9: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2397:13: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2398:30: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2404:33: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2408:41: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2415:30: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2434:29: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2435:32: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2436:40: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2449:32: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2452:17: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2452:33: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2453:30: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2455:29: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2456:39: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2457:34: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2461:38: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2464:56: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2468:49: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:3362:12: sparse: sparse: dereference of noderef expression

vim +2429 mm/mempolicy.c

  2367	
  2368	static unsigned long alloc_pages_bulk_array_weighted_interleave(gfp_t gfp,
  2369			struct mempolicy *pol, unsigned long nr_pages,
  2370			struct page **page_array)
  2371	{
  2372		struct task_struct *me = current;
  2373		unsigned long total_allocated = 0;
  2374		unsigned long nr_allocated = 0;
  2375		unsigned long rounds;
  2376		unsigned long node_pages, delta;
  2377		u8 __rcu *table, *weights, weight;
  2378		unsigned int weight_total = 0;
  2379		unsigned long rem_pages = nr_pages;
  2380		nodemask_t nodes;
  2381		int nnodes, node, next_node;
  2382		int resume_node = MAX_NUMNODES - 1;
  2383		u8 resume_weight = 0;
  2384		int prev_node;
  2385		int i;
  2386	
  2387		if (!nr_pages)
  2388			return 0;
  2389	
  2390		nnodes = read_once_policy_nodemask(pol, &nodes);
  2391		if (!nnodes)
  2392			return 0;
  2393	
  2394		/* Continue allocating from most recent node and adjust the nr_pages */
  2395		node = me->il_prev;
  2396		weight = me->il_weight;
  2397		if (weight && node_isset(node, nodes)) {
  2398			node_pages = min(rem_pages, weight);
  2399			nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
  2400							  NULL, page_array);
  2401			page_array += nr_allocated;
  2402			total_allocated += nr_allocated;
  2403			/* if that's all the pages, no need to interleave */
  2404			if (rem_pages < weight) {
  2405				/* stay on current node, adjust il_weight */
  2406				me->il_weight -= rem_pages;
  2407				return total_allocated;
  2408			} else if (rem_pages == weight) {
  2409				/* move to next node / weight */
  2410				me->il_prev = next_node_in(node, nodes);
  2411				me->il_weight = get_il_weight(next_node);
  2412				return total_allocated;
  2413			}
  2414			/* Otherwise we adjust remaining pages, continue from there */
  2415			rem_pages -= weight;
  2416		}
  2417		/* clear active weight in case of an allocation failure */
  2418		me->il_weight = 0;
  2419		prev_node = node;
  2420	
  2421		/* create a local copy of node weights to operate on outside rcu */
  2422		weights = kzalloc(nr_node_ids, GFP_KERNEL);
  2423		if (!weights)
  2424			return total_allocated;
  2425	
  2426		rcu_read_lock();
  2427		table = rcu_dereference(iw_table);
  2428		if (table)
> 2429			memcpy(weights, table, nr_node_ids);
  2430		rcu_read_unlock();
  2431	
  2432		/* calculate total, detect system default usage */
  2433		for_each_node_mask(node, nodes) {
  2434			if (!weights[node])
  2435				weights[node] = 1;
  2436			weight_total += weights[node];
  2437		}
  2438	
  2439		/*
  2440		 * Calculate rounds/partial rounds to minimize __alloc_pages_bulk calls.
  2441		 * Track which node weighted interleave should resume from.
  2442		 *
  2443		 * if (rounds > 0) and (delta == 0), resume_node will always be
  2444		 * the node following prev_node and its weight.
  2445		 */
  2446		rounds = rem_pages / weight_total;
  2447		delta = rem_pages % weight_total;
  2448		resume_node = next_node_in(prev_node, nodes);
  2449		resume_weight = weights[resume_node];
  2450		for (i = 0; i < nnodes; i++) {
  2451			node = next_node_in(prev_node, nodes);
  2452			weight = weights[node];
  2453			node_pages = weight * rounds;
  2454			/* If a delta exists, add this node's portion of the delta */
  2455			if (delta > weight) {
  2456				node_pages += weight;
  2457				delta -= weight;
  2458			} else if (delta) {
  2459				node_pages += delta;
  2460				/* delta may deplete on a boundary or w/ a remainder */
  2461				if (delta == weight) {
  2462					/* boundary: resume from next node/weight */
  2463					resume_node = next_node_in(node, nodes);
  2464					resume_weight = weights[resume_node];
  2465				} else {
  2466					/* remainder: resume this node w/ remainder */
  2467					resume_node = node;
  2468					resume_weight = weight - delta;
  2469				}
  2470				delta = 0;
  2471			}
  2472			/* node_pages can be 0 if an allocation fails and rounds == 0 */
  2473			if (!node_pages)
  2474				break;
  2475			nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
  2476							  NULL, page_array);
  2477			page_array += nr_allocated;
  2478			total_allocated += nr_allocated;
  2479			if (total_allocated == nr_pages)
  2480				break;
  2481			prev_node = node;
  2482		}
  2483		me->il_prev = resume_node;
  2484		me->il_weight = resume_weight;
  2485		kfree(weights);
  2486		return total_allocated;
  2487	}
  2488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
