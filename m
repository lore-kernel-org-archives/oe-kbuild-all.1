Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA592581
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 16:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727022724; cv=none; b=LDRF5sUwqS/s8McSwykgNj4FSOoLn85HOp3Np/6WJqAgYOw9IuBPXdWa9rNxZpzbWo5hWyPkwfPJd69EuQEanh4yVTYkxPmNNcqlU37WsyMEgOCTxJovuy0Z9Y9OQE7d1iO3YedJJ1MJQogtEjGBCyTIsBKNFsbE6LoQluU16kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727022724; c=relaxed/simple;
	bh=pwhFA5pVOjAAazGELVB3xgPG7K8yb3QZs6HXH+geBpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FI+MDMD1LbkUAoDZPY1dvt8j0MB8pW7NkOokVeLHRtMdOEBb7kVb54B8kqfqs69EfbPdU5hNsX5ycaUrrlK5Kn17ldwXxSKXpNMSLDuSghFhyjDh/pTDsqSkP3BDCB56Zszll7UAOg5Pt0w+wsns8uhySYxzKd/XM3A2hgiNxG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7Dhznxw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7Dhznxw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727022722; x=1758558722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pwhFA5pVOjAAazGELVB3xgPG7K8yb3QZs6HXH+geBpw=;
  b=a7Dhznxw67XCjQc5gaQ+qR2JBBTfY8XHE9209izg0lbOHWwxQp1aMxKA
   zRl9CJFFfQS3RL85cHaPHFXSnxQz6lWt2VrptTNdKYcHdyEwMA1Bt1rTN
   zvG1v+IerrWfxqex4M+H9FWfrZBAA92MANE1VYH/s1zXGwcqXq/PAEL39
   umCMdwz1ocnz4geCm/EHOSuYhcXa3w+LXfJWGrX1jO7IbFI041ar3xz1m
   OUvd4kZYL99KrD0/fqlJpcoaA1WfZzLhsud/4vcUdYh92rrUwNMCg7tdX
   ha4i1ANE0lJ4SDLgEn9kr8N4TgA1kn00Dd8pYK18U0wWWlSEXHmguOZhs
   A==;
X-CSE-ConnectionGUID: eEXitb0HQVS00HbGAbw14w==
X-CSE-MsgGUID: BfK5Hr17Q3iHuJkg4KUsuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26089931"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="26089931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 09:32:01 -0700
X-CSE-ConnectionGUID: XWmhOv2kTruvzZGqckXngw==
X-CSE-MsgGUID: Fkb0BKe0TbKIvLibWDRWKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="70870411"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Sep 2024 09:32:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssPV7-000GUU-2O;
	Sun, 22 Sep 2024 16:31:57 +0000
Date: Mon, 23 Sep 2024 00:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: kaiyang2@cs.cmu.edu
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/4] use memory.low local node protection for local
 node reclaim
Message-ID: <202409230026.mq4sC7is-lkp@intel.com>
References: <20240920221202.1734227-4-kaiyang2@cs.cmu.edu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920221202.1734227-4-kaiyang2@cs.cmu.edu>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master next-20240920]
[cannot apply to tip/sched/core v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kaiyang2-cs-cmu-edu/Add-get_cgroup_local_usage-for-estimating-the-top-tier-memory-usage/20240921-061404
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240920221202.1734227-4-kaiyang2%40cs.cmu.edu
patch subject: [RFC PATCH 3/4] use memory.low local node protection for local node reclaim
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240923/202409230026.mq4sC7is-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230026.mq4sC7is-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230026.mq4sC7is-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'get_scan_count':
>> mm/vmscan.c:2503:47: error: implicit declaration of function 'get_cgroup_local_usage' [-Werror=implicit-function-declaration]
    2503 |                                 cgroup_size = get_cgroup_local_usage(memcg, true);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/get_cgroup_local_usage +2503 mm/vmscan.c

  2360	
  2361	/*
  2362	 * Determine how aggressively the anon and file LRU lists should be
  2363	 * scanned.
  2364	 *
  2365	 * nr[0] = anon inactive folios to scan; nr[1] = anon active folios to scan
  2366	 * nr[2] = file inactive folios to scan; nr[3] = file active folios to scan
  2367	 */
  2368	static void get_scan_count(struct lruvec *lruvec, struct scan_control *sc,
  2369				   unsigned long *nr)
  2370	{
  2371		struct pglist_data *pgdat = lruvec_pgdat(lruvec);
  2372		struct mem_cgroup *memcg = lruvec_memcg(lruvec);
  2373		unsigned long anon_cost, file_cost, total_cost;
  2374		int swappiness = sc_swappiness(sc, memcg);
  2375		u64 fraction[ANON_AND_FILE];
  2376		u64 denominator = 0;	/* gcc */
  2377		enum scan_balance scan_balance;
  2378		unsigned long ap, fp;
  2379		enum lru_list lru;
  2380		int is_local = (pgdat->node_id == 0) && root_reclaim(sc);
  2381	
  2382		/* If we have no swap space, do not bother scanning anon folios. */
  2383		if (!sc->may_swap || !can_reclaim_anon_pages(memcg, pgdat->node_id, sc)) {
  2384			scan_balance = SCAN_FILE;
  2385			goto out;
  2386		}
  2387	
  2388		/*
  2389		 * Global reclaim will swap to prevent OOM even with no
  2390		 * swappiness, but memcg users want to use this knob to
  2391		 * disable swapping for individual groups completely when
  2392		 * using the memory controller's swap limit feature would be
  2393		 * too expensive.
  2394		 */
  2395		if (cgroup_reclaim(sc) && !swappiness) {
  2396			scan_balance = SCAN_FILE;
  2397			goto out;
  2398		}
  2399	
  2400		/*
  2401		 * Do not apply any pressure balancing cleverness when the
  2402		 * system is close to OOM, scan both anon and file equally
  2403		 * (unless the swappiness setting disagrees with swapping).
  2404		 */
  2405		if (!sc->priority && swappiness) {
  2406			scan_balance = SCAN_EQUAL;
  2407			goto out;
  2408		}
  2409	
  2410		/*
  2411		 * If the system is almost out of file pages, force-scan anon.
  2412		 */
  2413		if (sc->file_is_tiny) {
  2414			scan_balance = SCAN_ANON;
  2415			goto out;
  2416		}
  2417	
  2418		/*
  2419		 * If there is enough inactive page cache, we do not reclaim
  2420		 * anything from the anonymous working right now.
  2421		 */
  2422		if (sc->cache_trim_mode) {
  2423			scan_balance = SCAN_FILE;
  2424			goto out;
  2425		}
  2426	
  2427		scan_balance = SCAN_FRACT;
  2428		/*
  2429		 * Calculate the pressure balance between anon and file pages.
  2430		 *
  2431		 * The amount of pressure we put on each LRU is inversely
  2432		 * proportional to the cost of reclaiming each list, as
  2433		 * determined by the share of pages that are refaulting, times
  2434		 * the relative IO cost of bringing back a swapped out
  2435		 * anonymous page vs reloading a filesystem page (swappiness).
  2436		 *
  2437		 * Although we limit that influence to ensure no list gets
  2438		 * left behind completely: at least a third of the pressure is
  2439		 * applied, before swappiness.
  2440		 *
  2441		 * With swappiness at 100, anon and file have equal IO cost.
  2442		 */
  2443		total_cost = sc->anon_cost + sc->file_cost;
  2444		anon_cost = total_cost + sc->anon_cost;
  2445		file_cost = total_cost + sc->file_cost;
  2446		total_cost = anon_cost + file_cost;
  2447	
  2448		ap = swappiness * (total_cost + 1);
  2449		ap /= anon_cost + 1;
  2450	
  2451		fp = (MAX_SWAPPINESS - swappiness) * (total_cost + 1);
  2452		fp /= file_cost + 1;
  2453	
  2454		fraction[0] = ap;
  2455		fraction[1] = fp;
  2456		denominator = ap + fp;
  2457	out:
  2458		for_each_evictable_lru(lru) {
  2459			bool file = is_file_lru(lru);
  2460			unsigned long lruvec_size;
  2461			unsigned long low, min, locallow;
  2462			unsigned long scan;
  2463	
  2464			lruvec_size = lruvec_lru_size(lruvec, lru, sc->reclaim_idx);
  2465			mem_cgroup_protection(sc->target_mem_cgroup, memcg,
  2466					      &min, &low, &locallow);
  2467			if (is_local)
  2468				low = locallow;
  2469	
  2470			if (min || low) {
  2471				/*
  2472				 * Scale a cgroup's reclaim pressure by proportioning
  2473				 * its current usage to its memory.low or memory.min
  2474				 * setting.
  2475				 *
  2476				 * This is important, as otherwise scanning aggression
  2477				 * becomes extremely binary -- from nothing as we
  2478				 * approach the memory protection threshold, to totally
  2479				 * nominal as we exceed it.  This results in requiring
  2480				 * setting extremely liberal protection thresholds. It
  2481				 * also means we simply get no protection at all if we
  2482				 * set it too low, which is not ideal.
  2483				 *
  2484				 * If there is any protection in place, we reduce scan
  2485				 * pressure by how much of the total memory used is
  2486				 * within protection thresholds.
  2487				 *
  2488				 * There is one special case: in the first reclaim pass,
  2489				 * we skip over all groups that are within their low
  2490				 * protection. If that fails to reclaim enough pages to
  2491				 * satisfy the reclaim goal, we come back and override
  2492				 * the best-effort low protection. However, we still
  2493				 * ideally want to honor how well-behaved groups are in
  2494				 * that case instead of simply punishing them all
  2495				 * equally. As such, we reclaim them based on how much
  2496				 * memory they are using, reducing the scan pressure
  2497				 * again by how much of the total memory used is under
  2498				 * hard protection.
  2499				 */
  2500				unsigned long cgroup_size;
  2501	
  2502				if (is_local)
> 2503					cgroup_size = get_cgroup_local_usage(memcg, true);
  2504				else
  2505					cgroup_size = mem_cgroup_size(memcg);
  2506				unsigned long protection;
  2507	
  2508				/* memory.low scaling, make sure we retry before OOM */
  2509				if (!sc->memcg_low_reclaim && low > min) {
  2510					protection = low;
  2511					sc->memcg_low_skipped = 1;
  2512				} else {
  2513					protection = min;
  2514				}
  2515	
  2516				/* Avoid TOCTOU with earlier protection check */
  2517				cgroup_size = max(cgroup_size, protection);
  2518	
  2519				scan = lruvec_size - lruvec_size * protection /
  2520					(cgroup_size + 1);
  2521	
  2522				/*
  2523				 * Minimally target SWAP_CLUSTER_MAX pages to keep
  2524				 * reclaim moving forwards, avoiding decrementing
  2525				 * sc->priority further than desirable.
  2526				 */
  2527				scan = max(scan, SWAP_CLUSTER_MAX);
  2528			} else {
  2529				scan = lruvec_size;
  2530			}
  2531	
  2532			scan >>= sc->priority;
  2533	
  2534			/*
  2535			 * If the cgroup's already been deleted, make sure to
  2536			 * scrape out the remaining cache.
  2537			 */
  2538			if (!scan && !mem_cgroup_online(memcg))
  2539				scan = min(lruvec_size, SWAP_CLUSTER_MAX);
  2540	
  2541			switch (scan_balance) {
  2542			case SCAN_EQUAL:
  2543				/* Scan lists relative to size */
  2544				break;
  2545			case SCAN_FRACT:
  2546				/*
  2547				 * Scan types proportional to swappiness and
  2548				 * their relative recent reclaim efficiency.
  2549				 * Make sure we don't miss the last page on
  2550				 * the offlined memory cgroups because of a
  2551				 * round-off error.
  2552				 */
  2553				scan = mem_cgroup_online(memcg) ?
  2554				       div64_u64(scan * fraction[file], denominator) :
  2555				       DIV64_U64_ROUND_UP(scan * fraction[file],
  2556							  denominator);
  2557				break;
  2558			case SCAN_FILE:
  2559			case SCAN_ANON:
  2560				/* Scan one type exclusively */
  2561				if ((scan_balance == SCAN_FILE) != file)
  2562					scan = 0;
  2563				break;
  2564			default:
  2565				/* Look ma, no brain */
  2566				BUG();
  2567			}
  2568	
  2569			nr[lru] = scan;
  2570		}
  2571	}
  2572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
