Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73581EC2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 00:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755044087; cv=none; b=pndJr4kRrUnb4bJsn0GdzcLGIzRdpABZ1TR88le8+jyPQD/yLkvQLLQjSJa0aI+aqF1sk1ZYhyxj5QDdVefjas5hqXiSVMWRbDbl6KbPqmXJv9xaevAaZRFbyq0IkhBGn78Fgup3nwYsZ9I23Y9KhwSQNHSTc9gXunuKD3zQXMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755044087; c=relaxed/simple;
	bh=fARbX1T8eLJZmwTUEnFX5SM92kagR4HZc5w1YsWn8r0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lSRXQCbMw5koZrGSwjebJo9lKdMeFnzDe5JQSmH22u3z2C9S4kgEgOsL8Y9IBTM4rxMlcXfTW3Axi3MChe+6JcrF1Oe0m3/r0z6noZkb/cSeEKVR59kRbjEYkWc/UzxlHhd5do+557IdCNF2paadHuLwpnHMyrQELngVAJTXFQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uo3MGgj3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uo3MGgj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755044085; x=1786580085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fARbX1T8eLJZmwTUEnFX5SM92kagR4HZc5w1YsWn8r0=;
  b=Uo3MGgj3yVf8F8UadU09aaTJxL6HtGXFH90cUrNdUDhpvg8Yi6qIAHlT
   2LiE9Es8gNRFdPsb3LmcfAu6p7Oe1zYF0ARJsrcv+qRUO/4xbkV8PYwVt
   nu+5Pq0Z2abE31EMVrLlNGFgAl7M59z2m7kLhCf0tG1jDnPWRsMOAk+Fs
   ta9TL7Hel2rOuc07qIPyXRe5JfrVfZ3F1p2LtEht/cz4vVN3y8hsDmjIm
   AEl0hNGHaXN45N5cxdpIvbBcvf22QaOND7n+a8sW1mi/+PmNL+fx841tG
   VfNvIfTePYIYcKwtZkA+kOEjkx6S1R6hKhxg6NeJ2zeNbKcDBsEaDUZvM
   w==;
X-CSE-ConnectionGUID: LFY/Z4MbTTeAWMQ90KvJcA==
X-CSE-MsgGUID: EX+CegOQRHKm7nqTK6kdlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68703153"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="68703153"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 17:14:43 -0700
X-CSE-ConnectionGUID: xjmXri6oRvWWgPEbcFRXFw==
X-CSE-MsgGUID: MFAEvoYuTt+bzofX88OV+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="165512746"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 12 Aug 2025 17:14:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulz8J-0009P2-1h;
	Wed, 13 Aug 2025 00:14:33 +0000
Date: Wed, 13 Aug 2025 08:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3] mm/vmscan.c:3178:26: error:
 implicit declaration of function 'sc_swappiness'; did you mean
 'si_swapinfo'?
Message-ID: <202508130846.FHB2EKAL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ea3d9795af950549909e57bfd2efc6250bb69503
commit: ea3d9795af950549909e57bfd2efc6250bb69503 [3/3] BACKPORT: mm: add swappiness= arg to memory.reclaim
config: i386-buildonly-randconfig-003-20250813 (https://download.01.org/0day-ci/archive/20250813/202508130846.FHB2EKAL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130846.FHB2EKAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508130846.FHB2EKAL-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c:1066:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
    1066 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
   mm/vmscan.c:2663:15: warning: no previous prototype for 'shrink_inactive_list' [-Wmissing-prototypes]
    2663 | unsigned long shrink_inactive_list(unsigned long nr_to_scan,
         |               ^~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c: In function 'get_scan_count':
>> mm/vmscan.c:3178:26: error: implicit declaration of function 'sc_swappiness'; did you mean 'si_swapinfo'? [-Werror=implicit-function-declaration]
    3178 |         int swappiness = sc_swappiness(sc, memcg);
         |                          ^~~~~~~~~~~~~
         |                          si_swapinfo
   cc1: some warnings being treated as errors


vim +3178 mm/vmscan.c

  3164	
  3165	/*
  3166	 * Determine how aggressively the anon and file LRU lists should be
  3167	 * scanned.
  3168	 *
  3169	 * nr[0] = anon inactive folios to scan; nr[1] = anon active folios to scan
  3170	 * nr[2] = file inactive folios to scan; nr[3] = file active folios to scan
  3171	 */
  3172	static void get_scan_count(struct lruvec *lruvec, struct scan_control *sc,
  3173				   unsigned long *nr)
  3174	{
  3175		struct pglist_data *pgdat = lruvec_pgdat(lruvec);
  3176		struct mem_cgroup *memcg = lruvec_memcg(lruvec);
  3177		unsigned long anon_cost, file_cost, total_cost;
> 3178		int swappiness = sc_swappiness(sc, memcg);
  3179		u64 fraction[ANON_AND_FILE];
  3180		u64 denominator = 0;	/* gcc */
  3181		enum scan_balance scan_balance;
  3182		unsigned long ap, fp;
  3183		enum lru_list lru;
  3184		bool balance_anon_file_reclaim = false;
  3185	
  3186		/* If we have no swap space, do not bother scanning anon folios. */
  3187		if (!sc->may_swap || !can_reclaim_anon_pages(memcg, pgdat->node_id, sc)) {
  3188			scan_balance = SCAN_FILE;
  3189			goto out;
  3190		}
  3191	
  3192	
  3193		trace_android_vh_tune_swappiness(&swappiness);
  3194		/*
  3195		 * Global reclaim will swap to prevent OOM even with no
  3196		 * swappiness, but memcg users want to use this knob to
  3197		 * disable swapping for individual groups completely when
  3198		 * using the memory controller's swap limit feature would be
  3199		 * too expensive.
  3200		 */
  3201		if (cgroup_reclaim(sc) && !swappiness) {
  3202			scan_balance = SCAN_FILE;
  3203			goto out;
  3204		}
  3205	
  3206		/*
  3207		 * Do not apply any pressure balancing cleverness when the
  3208		 * system is close to OOM, scan both anon and file equally
  3209		 * (unless the swappiness setting disagrees with swapping).
  3210		 */
  3211		if (!sc->priority && swappiness) {
  3212			scan_balance = SCAN_EQUAL;
  3213			goto out;
  3214		}
  3215	
  3216		/*
  3217		 * If the system is almost out of file pages, force-scan anon.
  3218		 */
  3219		if (sc->file_is_tiny) {
  3220			scan_balance = SCAN_ANON;
  3221			goto out;
  3222		}
  3223	
  3224		trace_android_rvh_set_balance_anon_file_reclaim(&balance_anon_file_reclaim);
  3225	
  3226		/*
  3227		 * If there is enough inactive page cache, we do not reclaim
  3228		 * anything from the anonymous working right now. But when balancing
  3229		 * anon and page cache files for reclaim, allow swapping of anon pages
  3230		 * even if there are a number of inactive file cache pages.
  3231		 */
  3232		if (!balance_anon_file_reclaim && sc->cache_trim_mode) {
  3233			scan_balance = SCAN_FILE;
  3234			goto out;
  3235		}
  3236	
  3237		scan_balance = SCAN_FRACT;
  3238		/*
  3239		 * Calculate the pressure balance between anon and file pages.
  3240		 *
  3241		 * The amount of pressure we put on each LRU is inversely
  3242		 * proportional to the cost of reclaiming each list, as
  3243		 * determined by the share of pages that are refaulting, times
  3244		 * the relative IO cost of bringing back a swapped out
  3245		 * anonymous page vs reloading a filesystem page (swappiness).
  3246		 *
  3247		 * Although we limit that influence to ensure no list gets
  3248		 * left behind completely: at least a third of the pressure is
  3249		 * applied, before swappiness.
  3250		 *
  3251		 * With swappiness at 100, anon and file have equal IO cost.
  3252		 */
  3253		total_cost = sc->anon_cost + sc->file_cost;
  3254		anon_cost = total_cost + sc->anon_cost;
  3255		file_cost = total_cost + sc->file_cost;
  3256		total_cost = anon_cost + file_cost;
  3257	
  3258		ap = swappiness * (total_cost + 1);
  3259		ap /= anon_cost + 1;
  3260	
  3261		fp = (MAX_SWAPPINESS - swappiness) * (total_cost + 1);
  3262		fp /= file_cost + 1;
  3263	
  3264		fraction[0] = ap;
  3265		fraction[1] = fp;
  3266		denominator = ap + fp;
  3267	out:
  3268		trace_android_vh_tune_scan_type(&scan_balance);
  3269		for_each_evictable_lru(lru) {
  3270			int file = is_file_lru(lru);
  3271			unsigned long lruvec_size;
  3272			unsigned long low, min;
  3273			unsigned long scan;
  3274	
  3275			lruvec_size = lruvec_lru_size(lruvec, lru, sc->reclaim_idx);
  3276			mem_cgroup_protection(sc->target_mem_cgroup, memcg,
  3277					      &min, &low);
  3278	
  3279			if (min || low) {
  3280				/*
  3281				 * Scale a cgroup's reclaim pressure by proportioning
  3282				 * its current usage to its memory.low or memory.min
  3283				 * setting.
  3284				 *
  3285				 * This is important, as otherwise scanning aggression
  3286				 * becomes extremely binary -- from nothing as we
  3287				 * approach the memory protection threshold, to totally
  3288				 * nominal as we exceed it.  This results in requiring
  3289				 * setting extremely liberal protection thresholds. It
  3290				 * also means we simply get no protection at all if we
  3291				 * set it too low, which is not ideal.
  3292				 *
  3293				 * If there is any protection in place, we reduce scan
  3294				 * pressure by how much of the total memory used is
  3295				 * within protection thresholds.
  3296				 *
  3297				 * There is one special case: in the first reclaim pass,
  3298				 * we skip over all groups that are within their low
  3299				 * protection. If that fails to reclaim enough pages to
  3300				 * satisfy the reclaim goal, we come back and override
  3301				 * the best-effort low protection. However, we still
  3302				 * ideally want to honor how well-behaved groups are in
  3303				 * that case instead of simply punishing them all
  3304				 * equally. As such, we reclaim them based on how much
  3305				 * memory they are using, reducing the scan pressure
  3306				 * again by how much of the total memory used is under
  3307				 * hard protection.
  3308				 */
  3309				unsigned long cgroup_size = mem_cgroup_size(memcg);
  3310				unsigned long protection;
  3311	
  3312				/* memory.low scaling, make sure we retry before OOM */
  3313				if (!sc->memcg_low_reclaim && low > min) {
  3314					protection = low;
  3315					sc->memcg_low_skipped = 1;
  3316				} else {
  3317					protection = min;
  3318				}
  3319	
  3320				/* Avoid TOCTOU with earlier protection check */
  3321				cgroup_size = max(cgroup_size, protection);
  3322	
  3323				scan = lruvec_size - lruvec_size * protection /
  3324					(cgroup_size + 1);
  3325	
  3326				/*
  3327				 * Minimally target SWAP_CLUSTER_MAX pages to keep
  3328				 * reclaim moving forwards, avoiding decrementing
  3329				 * sc->priority further than desirable.
  3330				 */
  3331				scan = max(scan, SWAP_CLUSTER_MAX);
  3332			} else {
  3333				scan = lruvec_size;
  3334			}
  3335	
  3336			scan >>= sc->priority;
  3337	
  3338			/*
  3339			 * If the cgroup's already been deleted, make sure to
  3340			 * scrape out the remaining cache.
  3341			 */
  3342			if (!scan && !mem_cgroup_online(memcg))
  3343				scan = min(lruvec_size, SWAP_CLUSTER_MAX);
  3344	
  3345			switch (scan_balance) {
  3346			case SCAN_EQUAL:
  3347				/* Scan lists relative to size */
  3348				break;
  3349			case SCAN_FRACT:
  3350				/*
  3351				 * Scan types proportional to swappiness and
  3352				 * their relative recent reclaim efficiency.
  3353				 * Make sure we don't miss the last page on
  3354				 * the offlined memory cgroups because of a
  3355				 * round-off error.
  3356				 */
  3357				scan = mem_cgroup_online(memcg) ?
  3358				       div64_u64(scan * fraction[file], denominator) :
  3359				       DIV64_U64_ROUND_UP(scan * fraction[file],
  3360							  denominator);
  3361				break;
  3362			case SCAN_FILE:
  3363			case SCAN_ANON:
  3364				/* Scan one type exclusively */
  3365				if ((scan_balance == SCAN_FILE) != file)
  3366					scan = 0;
  3367				break;
  3368			default:
  3369				/* Look ma, no brain */
  3370				BUG();
  3371			}
  3372	
  3373			nr[lru] = scan;
  3374		}
  3375	}
  3376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
