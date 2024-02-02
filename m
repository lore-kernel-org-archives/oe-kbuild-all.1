Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4417467A15
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 23:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706915143; cv=none; b=u8XiyoAASRgaYsSuGBX6xgQfCOllmEZBsgflKCL/z/4Q1grcGbuuPjgd3ec2+loXgwtQxC9NC3X33oxFNB/QcY5PiD3ZrGrhMOlveHTv2dih+J5hicpKBIbzAILN63zsfrQuXRCFVUbUT78KQAZWK6YuuB2D7Kr+YSAWCUcfjKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706915143; c=relaxed/simple;
	bh=907Cjcx17hJdMDAtyiOwkCb1yo7RB4G44MF7DN7qiKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NR4aOP8mTdSLP2cSTEEtFpIE+Gb3dG9rRHiqN52JETF/+c3Zv28sXAuouVidqUHYouNq29GUXCaNTMm0tV4BQE8lHofKsxSrhZZi3KWlooKid7EI6PXOFYJJtzT1mZu6eJq5Msi0cPHgcC82rL9P2UgtnKiBBCzDe6lsxkCQBBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ho+VMEAN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ho+VMEAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706915141; x=1738451141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=907Cjcx17hJdMDAtyiOwkCb1yo7RB4G44MF7DN7qiKI=;
  b=Ho+VMEANxQo9nclhaZE5G2+Y5rKxfL1U+JCqsO3zz3H+6bEfYLaHr/Rg
   fTvSthdnXsDaz4e2mTUrGFG6obBhaxPak/OYkpzz+wcCDUxndWIwuFSj/
   GULfGoiivO8aLBx+SE7QvSu2o0Y+8ErK6dh1bdpaCdVMBQNjULVxHgr6K
   vmYoMdAQNSuzYszQg49tZtw5NCk9dGqDqZp1pB98h+TV/RX35rRx7vq3V
   necazrFfVjEb855nb+379m1/X1i0cNxYZEO43Zq1Zu5SRIo5fByHFOfgm
   cI1mqqXDAnKMO6Svxq1bUs+0hP1gteXa+0mJnOp3UfdFuqEJ6QukDf+mI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10910546"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="10910546"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 15:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="470982"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Feb 2024 15:05:37 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW2bD-0004MY-2M;
	Fri, 02 Feb 2024 23:05:31 +0000
Date: Sat, 3 Feb 2024 07:05:26 +0800
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
Subject: [linux-next:master 2939/3789] mm/mempolicy.c:2429:17: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202402030631.6mCz0axA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   076d56d74f17e625b3d63cf4743b3d7d02180379
commit: 147371fd14993ae64ef2f612eb15f37fcef12d83 [2939/3789] mm/mempolicy: introduce MPOL_WEIGHTED_INTERLEAVE for weighted interleaving
config: x86_64-randconfig-r123-20240201 (https://download.01.org/0day-ci/archive/20240203/202402030631.6mCz0axA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030631.6mCz0axA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030631.6mCz0axA-lkp@intel.com/

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
   mm/mempolicy.c:2429:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *weights @@
   mm/mempolicy.c:2429:17: sparse:     expected void const *
   mm/mempolicy.c:2429:17: sparse:     got unsigned char [noderef] [usertype] __rcu *weights
   mm/mempolicy.c:2429:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *table @@
   mm/mempolicy.c:2429:17: sparse:     expected void const *
   mm/mempolicy.c:2429:17: sparse:     got unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:2429:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *weights @@
   mm/mempolicy.c:2429:17: sparse:     expected void const *
   mm/mempolicy.c:2429:17: sparse:     got unsigned char [noderef] [usertype] __rcu *weights
   mm/mempolicy.c:2429:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *table @@
   mm/mempolicy.c:2429:17: sparse:     expected void const *
   mm/mempolicy.c:2429:17: sparse:     got unsigned char [noderef] [usertype] __rcu *table
>> mm/mempolicy.c:2429:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned char [noderef] [usertype] __rcu *weights @@
   mm/mempolicy.c:2429:17: sparse:     expected void *
   mm/mempolicy.c:2429:17: sparse:     got unsigned char [noderef] [usertype] __rcu *weights
   mm/mempolicy.c:2429:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *table @@
   mm/mempolicy.c:2429:17: sparse:     expected void const *
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
   mm/mempolicy.c:3361:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3361:17: sparse:     expected void const *
   mm/mempolicy.c:3361:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3361:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3361:17: sparse:     expected void const *
   mm/mempolicy.c:3361:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3361:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3361:17: sparse:     expected void const *
   mm/mempolicy.c:3361:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3361:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3361:17: sparse:     expected void const *
   mm/mempolicy.c:3361:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3361:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3361:17: sparse:     expected void *
   mm/mempolicy.c:3361:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3361:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3361:17: sparse:     expected void const *
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
   mm/mempolicy.c:160:31: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'queue_folios_pte_range' - unexpected unlock
   mm/mempolicy.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/mempolicy.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
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
