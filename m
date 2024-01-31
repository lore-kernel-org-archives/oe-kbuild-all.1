Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E156E367
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 00:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706661109; cv=none; b=FsgU+yEUN8ARmg8iLY2h3AAS2xiafwH/V0OheIQ0UgDBJWjxpTfJo94EWxAxgh291s3qXrUoxZ/9pTDFLQXGtwE/8RaPB0Oy5fojIcqioBHUzZToSOBhaoVIu8RNBDuIVpuS05+FlmOrNsQ2OaLyzngj9WnlimwJNgk22Y2pI/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706661109; c=relaxed/simple;
	bh=x8/dKbz2heQYKXHab4JCznf6K2uNf0AWMvzCC6Ie0tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ryaPJjt6W83SiJUXbTz9boJ9md49Zl5ytZyRiZsSUunM8PY5HZiiKyiZ+adcOGX9IriqPPEraZuciiCTXtN1E5EJzfqMdm7WHaW3VhSSAMMFWgJ0RqdP4VHak0Nj4+4qqntUz0a2/c85K1DY+/KslKL3wsgRZaqmXhSXWAyVi9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6CTxHuA; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6CTxHuA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706661106; x=1738197106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x8/dKbz2heQYKXHab4JCznf6K2uNf0AWMvzCC6Ie0tQ=;
  b=P6CTxHuA+9o4rUviCczwhAMKauq3AXlYers61SanVZr8UZk/fykh8BbN
   cXcWt66iA92Noh/gmyeGIDR/0BGc3YBvWbKCNXIlih0eDvj093l6S0CUi
   5yy0QK4y/mpwj7XlqdrQm2mhgZa2mNb2uiCmYukHnEIYpTSUBc3Z+i6Vg
   3jFtNHt6m3P71J8fS3nPGmJW0Fl7jbLND2cE4X8fmufLgSyOU/NvEX6n6
   1BrzCX+cc91IWO6ZIxw26fuM2d25SD058xEXUhXE3libh9EYDjRawKI1Q
   G/IgLVpM2Styp0Of165dLR2bUKLVXIrapTRz5HoEJigEbttfUQaua6Cnz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="400588826"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="400588826"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 16:31:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3968059"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Jan 2024 16:31:43 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUyVw-0000yi-1W;
	Wed, 31 Jan 2024 00:31:40 +0000
Date: Wed, 31 Jan 2024 08:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rakie Kim <rakie.kim@sk.com>, Honggyu Kim <honggyu.kim@sk.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>,
	Srinivasulu Thanneeru <sthanneeru.opensrc@micron.com>,
	Ravi Jonnalagadda <ravis.opensrc@micron.com>
Subject: [linux-next:master 2549/2825] mm/mempolicy.c:2438:17: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202401310805.34wFUBp1-lkp@intel.com>
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
commit: 7cc4a5fc08f58817eeb9d8f32b32b495dd47607f [2549/2825] mm/mempolicy: introduce MPOL_WEIGHTED_INTERLEAVE for weighted interleaving
config: loongarch-randconfig-r113-20240129 (https://download.01.org/0day-ci/archive/20240131/202401310805.34wFUBp1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240131/202401310805.34wFUBp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310805.34wFUBp1-lkp@intel.com/

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
>> mm/mempolicy.c:2438:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *__from @@     got unsigned char [noderef] [usertype] __rcu *static [addressable] [toplevel] iw_table @@
   mm/mempolicy.c:2438:17: sparse:     expected void const *__from
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
   mm/mempolicy.c:3403:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *__to @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3403:17: sparse:     expected void *__to
   mm/mempolicy.c:3403:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3403:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *__from @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3403:17: sparse:     expected void const *__from
   mm/mempolicy.c:3403:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3405:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *__s @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3405:17: sparse:     expected void *__s
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
   mm/mempolicy.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'queue_folios_pte_range' - unexpected unlock
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
