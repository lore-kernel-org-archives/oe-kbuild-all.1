Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59DA85C66
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706630044; cv=none; b=KthWl6AHPMSDahaMhtQu3OR1W6yXT1wZ3H3n1qn3U/bOwsboZBhhn7js+4uxNKOqpi79twCZTocJ+sTXzCQjw0tNzaO/SFTGU+Y2bTADaGklgQy2O1o1z+f2Yiq/PcKrrrDFGL2RI9VJb1XIIFCTcnCt250YUdKdvjNkZUgLdRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706630044; c=relaxed/simple;
	bh=1W0rNTW+cleifCa5iz11YDGQmMrMCY78exwyR46ESJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EPI9SPNOii07z4emLU+un8//z9meERi6Bq/j9Xx5Ts7qslQxtW8JBEELaoExZb3tC3qTnl8ulzT6C17MNFHMiVl4Yn7ee4lUroCghy3g//b665l1EJ3oXOKTzNA0pORhDiAfXVsEqvqZ5IMDCuUWMenZ+jAmGfciyXo2BWO4Qv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gh946eVK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gh946eVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706630043; x=1738166043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1W0rNTW+cleifCa5iz11YDGQmMrMCY78exwyR46ESJ4=;
  b=gh946eVKYYZqgc4D79WFeRntCVX197XsYpL9APcOL2X1dGzqA2wqMVoE
   4JplGg/z5KyHMqWe1bS+hDmGBsQGcnsZGm/6pv8zF5f2MLdwPbsoia+4Q
   9Ym+XHTsL+VDvUVnkg9NiTUBt/0U4cP/+C/h/wOHnkaR/obVXxUd0+Ifb
   Kj4dhDwVV8XrsYDDmGej9tbvfH4ZvSDNS6qeK8Dpbj8NHNruR65InK/M5
   UEolRNf1bSS6VVz1SmP/ehRdJnVpQfKOngjddoMj/TBA0GfTLcaUJWFsz
   mCpsPtzfGQbcNksQtmfnuHyOdHg2iq7OopyUy/0yDgZhf2Ef9q/mAA2wN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10418383"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="10418383"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 07:54:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3716295"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Jan 2024 07:54:00 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUqQu-0000Vg-2I;
	Tue, 30 Jan 2024 15:53:56 +0000
Date: Tue, 30 Jan 2024 23:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rakie Kim <rakie.kim@sk.com>, Honggyu Kim <honggyu.kim@sk.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>,
	Srinivasulu Thanneeru <sthanneeru.opensrc@micron.com>,
	Ravi Jonnalagadda <ravis.opensrc@micron.com>
Subject: [linux-next:master 2330/2827] mm/mempolicy.c:2438:17: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202401302359.PL3jJegi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
commit: bd65105cba132d1306030979916d02291718a31a [2330/2827] mm/mempolicy: introduce MPOL_WEIGHTED_INTERLEAVE for weighted interleaving
config: x86_64-randconfig-122-20240130 (https://download.01.org/0day-ci/archive/20240130/202401302359.PL3jJegi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401302359.PL3jJegi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401302359.PL3jJegi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mempolicy.c:1872:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:1872:23: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:1872:23: sparse:     got unsigned char *
   mm/mempolicy.c:1887:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:1887:23: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:1887:23: sparse:     got unsigned char *
   mm/mempolicy.c:1985:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:1985:15: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:1985:15: sparse:     got unsigned char *
   mm/mempolicy.c:2416:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:2416:31: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:2416:31: sparse:     got unsigned char *
   mm/mempolicy.c:2435:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:2435:15: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:2435:15: sparse:     got unsigned char *
   mm/mempolicy.c:2438:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *static [addressable] [toplevel] iw_table @@
   mm/mempolicy.c:2438:17: sparse:     expected void const *
   mm/mempolicy.c:2438:17: sparse:     got unsigned char [noderef] [usertype] __rcu *static [addressable] [toplevel] iw_table
   mm/mempolicy.c:2438:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *static [addressable] [toplevel] iw_table @@
   mm/mempolicy.c:2438:17: sparse:     expected void const *
   mm/mempolicy.c:2438:17: sparse:     got unsigned char [noderef] [usertype] __rcu *static [addressable] [toplevel] iw_table
>> mm/mempolicy.c:2438:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *q @@     got unsigned char [noderef] [usertype] __rcu *static [addressable] [toplevel] iw_table @@
   mm/mempolicy.c:2438:17: sparse:     expected void const *q
   mm/mempolicy.c:2438:17: sparse:     got unsigned char [noderef] [usertype] __rcu *static [addressable] [toplevel] iw_table
   mm/mempolicy.c:3366:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:3366:15: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:3366:15: sparse:     got unsigned char *
   mm/mempolicy.c:3395:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *new @@     got void * @@
   mm/mempolicy.c:3395:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3395:13: sparse:     got void *
   mm/mempolicy.c:3400:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *old @@     got unsigned char * @@
   mm/mempolicy.c:3400:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3400:13: sparse:     got unsigned char *
   mm/mempolicy.c:3403:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3403:17: sparse:     expected void const *
   mm/mempolicy.c:3403:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3403:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3403:17: sparse:     expected void const *
   mm/mempolicy.c:3403:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3403:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3403:17: sparse:     expected void const *
   mm/mempolicy.c:3403:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3403:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3403:17: sparse:     expected void const *
   mm/mempolicy.c:3403:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3403:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3403:17: sparse:     expected void *p
   mm/mempolicy.c:3403:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3403:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *q @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3403:17: sparse:     expected void const *q
   mm/mempolicy.c:3403:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3405:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3405:17: sparse:     expected void const *
   mm/mempolicy.c:3405:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3405:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3405:17: sparse:     expected void const *
   mm/mempolicy.c:3405:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3405:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3405:17: sparse:     expected void *p
   mm/mempolicy.c:3405:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3410:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3410:15: sparse:     expected void const *objp
   mm/mempolicy.c:3410:15: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3506:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *old @@     got unsigned char * @@
   mm/mempolicy.c:3506:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3506:13: sparse:     got unsigned char *
   mm/mempolicy.c:3511:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3511:15: sparse:     expected void const *objp
   mm/mempolicy.c:3511:15: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:534:17: sparse: sparse: context imbalance in 'queue_folios_pte_range' - unexpected unlock
   mm/mempolicy.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/mempolicy.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   mm/mempolicy.c:1874:39: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:1889:39: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:1988:46: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:1994:39: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:2417:47: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:3367:31: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:3406:12: sparse: sparse: dereference of noderef expression

vim +2438 mm/mempolicy.c

  2366	
  2367	static unsigned long alloc_pages_bulk_array_weighted_interleave(gfp_t gfp,
  2368			struct mempolicy *pol, unsigned long nr_pages,
  2369			struct page **page_array)
  2370	{
  2371		struct task_struct *me = current;
  2372		unsigned long total_allocated = 0;
  2373		unsigned long nr_allocated;
  2374		unsigned long rounds;
  2375		unsigned long node_pages, delta;
  2376		u8 weight, resume_weight;
  2377		u8 __rcu *table;
  2378		u8 *weights;
  2379		unsigned int weight_total = 0;
  2380		unsigned long rem_pages = nr_pages;
  2381		nodemask_t nodes;
  2382		int nnodes, node, resume_node, next_node;
  2383		int prev_node = me->il_prev;
  2384		int i;
  2385	
  2386		if (!nr_pages)
  2387			return 0;
  2388	
  2389		nnodes = read_once_policy_nodemask(pol, &nodes);
  2390		if (!nnodes)
  2391			return 0;
  2392	
  2393		/* Continue allocating from most recent node and adjust the nr_pages */
  2394		if (pol->cur_il_weight) {
  2395			node = next_node_in(prev_node, nodes);
  2396			node_pages = pol->cur_il_weight;
  2397			if (node_pages > rem_pages)
  2398				node_pages = rem_pages;
  2399			nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
  2400							  NULL, page_array);
  2401			page_array += nr_allocated;
  2402			total_allocated += nr_allocated;
  2403			/*
  2404			 * if that's all the pages, no need to interleave, otherwise
  2405			 * we need to set up the next interleave node/weight correctly.
  2406			 */
  2407			if (rem_pages < pol->cur_il_weight) {
  2408				/* stay on current node, adjust cur_il_weight */
  2409				pol->cur_il_weight -= rem_pages;
  2410				return total_allocated;
  2411			} else if (rem_pages == pol->cur_il_weight) {
  2412				/* move to next node / weight */
  2413				me->il_prev = node;
  2414				next_node = next_node_in(node, nodes);
  2415				rcu_read_lock();
  2416				table = rcu_dereference(iw_table);
  2417				weight = table ? table[next_node] : 1;
  2418				/* detect system-default usage */
  2419				pol->cur_il_weight = weight ? weight : 1;
  2420				rcu_read_unlock();
  2421				return total_allocated;
  2422			}
  2423			/* Otherwise we adjust nr_pages down, and continue from there */
  2424			rem_pages -= pol->cur_il_weight;
  2425			pol->cur_il_weight = 0;
  2426			prev_node = node;
  2427		}
  2428	
  2429		/* create a local copy of node weights to operate on outside rcu */
  2430		weights = kmalloc(nr_node_ids, GFP_KERNEL);
  2431		if (!weights)
  2432			return total_allocated;
  2433	
  2434		rcu_read_lock();
  2435		table = rcu_dereference(iw_table);
  2436		/* If table is not registered, use system defaults */
  2437		if (table)
> 2438			memcpy(weights, iw_table, nr_node_ids);
  2439		else
  2440			memset(weights, 1, nr_node_ids);
  2441		rcu_read_unlock();
  2442	
  2443		/* calculate total, detect system default usage */
  2444		for_each_node_mask(node, nodes) {
  2445			/* detect system-default usage */
  2446			if (!weights[node])
  2447				weights[node] = 1;
  2448			weight_total += weights[node];
  2449		}
  2450	
  2451		/*
  2452		 * Now we can continue allocating from 0 instead of an offset
  2453		 * We calculate the number of rounds and any partial rounds so
  2454		 * that we minimize the number of calls to __alloc_pages_bulk
  2455		 * This requires us to track which node we should resume from.
  2456		 *
  2457		 * if (rounds > 0) and (delta == 0), resume_node will always be
  2458		 * the current value of prev_node, which may be NUMA_NO_NODE if
  2459		 * this is the first allocation after a policy is replaced. The
  2460		 * resume weight will be the weight of the next node.
  2461		 *
  2462		 * if (delta > 0) and delta is depleted exactly on a node-weight
  2463		 * boundary, resume node will be the node last allocated from when
  2464		 * delta reached 0.
  2465		 *
  2466		 * if (delta > 0) and delta is not depleted on a node-weight boundary,
  2467		 * resume node will be the node prior to the node last allocated from.
  2468		 *
  2469		 * (rounds == 0) and (delta == 0) is not possible (earlier exit)
  2470		 */
  2471		rounds = rem_pages / weight_total;
  2472		delta = rem_pages % weight_total;
  2473		resume_node = prev_node;
  2474		resume_weight = weights[next_node_in(prev_node, nodes)];
  2475		/* If no delta, we'll resume from current prev_node and first weight */
  2476		for (i = 0; i < nnodes; i++) {
  2477			node = next_node_in(prev_node, nodes);
  2478			weight = weights[node];
  2479			node_pages = weight * rounds;
  2480			/* If a delta exists, add this node's portion of the delta */
  2481			if (delta > weight) {
  2482				node_pages += weight;
  2483				delta -= weight;
  2484				resume_node = node;
  2485			} else if (delta) {
  2486				node_pages += delta;
  2487				if (delta == weight) {
  2488					/* resume from next node with its weight */
  2489					resume_node = node;
  2490					next_node = next_node_in(node, nodes);
  2491					resume_weight = weights[next_node];
  2492				} else {
  2493					/* resume from this node w/ remaining weight */
  2494					resume_node = prev_node;
  2495					resume_weight = weight - (node_pages % weight);
  2496				}
  2497				delta = 0;
  2498			}
  2499			/* node_pages can be 0 if an allocation fails and rounds == 0 */
  2500			if (!node_pages)
  2501				break;
  2502			nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
  2503							  NULL, page_array);
  2504			page_array += nr_allocated;
  2505			total_allocated += nr_allocated;
  2506			if (total_allocated == nr_pages)
  2507				break;
  2508			prev_node = node;
  2509		}
  2510		/* resume allocating from the calculated node and weight */
  2511		me->il_prev = resume_node;
  2512		pol->cur_il_weight = resume_weight;
  2513		kfree(weights);
  2514		return total_allocated;
  2515	}
  2516	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
