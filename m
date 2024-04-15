Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D311BF2A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 11:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713181027; cv=none; b=qotJmebqkHt3BV8UZrEsbtOCiOVpTxrNXWU3PpWOG+buIpwDhX3TuAnG4lMGYVl/xwgk3dHsFEkpR5wVzrQNOzHaBE8jLnKHkqPC27EL8WxRKYCqf+h4p5TH093x/G3tfAWeMl7HRAc2CHmyGwelfzTVpAH+aSPD3KvYSbjsHHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713181027; c=relaxed/simple;
	bh=c/Duq5K6xFDlY3OOPxGx5NADYwVTEFuhqeQqY6ZIA/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TA2xlpGOZho6UvLTwkiVyGqpxHjge3C/eoLNYKCiFnynA6RGab7EjuIIcj+IAuzfloyql2SlT7KF+A09c/cW7MxC1f/UHQZUNIZIfKKYOmuNXuv4Dc10ixr0rFg7PklchJMtkvlwUsMSmX/2n1DoRo7MuqOxyTbpncTPv6f5tIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHLsMS3A; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHLsMS3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713181025; x=1744717025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/Duq5K6xFDlY3OOPxGx5NADYwVTEFuhqeQqY6ZIA/w=;
  b=QHLsMS3AagUnwzDzTz6edOu43M/REvBo/Q9hnl/3gg99TWR+WKIQV5Hw
   kdhake6y0E2PvaG6xO3zEC92zZnz0fCghATuHMVLWmIeqHi86XFaOAfr1
   /8bnjhJdodkVNcx1Ms9YyAUBVrJ+WncIgN3jZKjbEqyqdbFKt03TKM4lj
   lcOGaAeZO0jvw6qs/+/y8ICAKqqp13FJuVGYJnzppEa6CKGNyz6M40XQC
   PJ/OF2hckGP07LXLyjR5lW54bUOLKb/owEMLInYdXAxiXm0q96sHOG26d
   5vGca9HJAiPllnhEzxbb9vOI5UiP2wIjFZvwa3b6WazqcaLRBFgckTLOI
   A==;
X-CSE-ConnectionGUID: kk0OaYH1RyWD/B7H2kw3fw==
X-CSE-MsgGUID: fSJPYaLnScqvxxMJwlTsvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8424488"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8424488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 04:37:04 -0700
X-CSE-ConnectionGUID: 3+bnLhNkRtOnrvXI0lDNjg==
X-CSE-MsgGUID: mO92cPhSQYScC9w1IvQxwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="52838855"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Apr 2024 04:37:01 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwKdu-00049Q-2U;
	Mon, 15 Apr 2024 11:36:58 +0000
Date: Mon, 15 Apr 2024 19:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5555/6466] mm/workingset.c:473:35: warning:
 variable 'distance' is uninitialized when used here
Message-ID: <202404151913.muyuTgfn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c4c1ee7e260d136fea1d11049b198c97b26b45db
commit: d1511fc99145d13ec8552983b706292ec8c16d35 [5555/6466] emm: mm/workingset: apply workingset estimation hooks
config: arm64-randconfig-003-20240415 (https://download.01.org/0day-ci/archive/20240415/202404151913.muyuTgfn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404151913.muyuTgfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404151913.muyuTgfn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/workingset.c:8:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2176:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/workingset.c:9:
   include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/workingset.c:509:56: warning: shift count >= width of type [-Wshift-count-overflow]
     509 |                         set_mask_bits(&folio->flags, 0, (refs - workingset) << LRU_REFS_PGOFF);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:347:50: note: expanded from macro 'set_mask_bits'
     347 |         const typeof(*(ptr)) mask__ = (mask), bits__ = (bits);  \
         |                                                         ^~~~
   mm/workingset.c:512:38: warning: shift count >= width of type [-Wshift-count-overflow]
     512 |                         set_mask_bits(&folio->flags, 0, 1 << LRU_REFS_PGOFF);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:347:50: note: expanded from macro 'set_mask_bits'
     347 |         const typeof(*(ptr)) mask__ = (mask), bits__ = (bits);  \
         |                                                         ^~~~
>> mm/workingset.c:473:35: warning: variable 'distance' is uninitialized when used here [-Wuninitialized]
     473 |         workingset_refault_track(lruvec, distance);
         |                                          ^~~~~~~~
   mm/workingset.c:458:14: note: initialize the variable 'distance' to silence this warning
     458 |         int distance;
         |                     ^
         |                      = 0
   10 warnings generated.


vim +/distance +473 mm/workingset.c

   444	
   445	static void lru_gen_refault(struct folio *folio, void *shadow)
   446	{
   447		int memcgid;
   448		bool recent;
   449		bool workingset;
   450		unsigned long token;
   451		int hist, tier, refs;
   452		struct lruvec *lruvec;
   453		struct mem_cgroup *memcg;
   454		struct pglist_data *pgdat;
   455		struct lru_gen_folio *lrugen;
   456		int type = folio_is_file_lru(folio);
   457		int delta = folio_nr_pages(folio);
   458		int distance;
   459		unsigned long refault_distance, protect_tier;
   460	
   461		unpack_shadow(shadow, &memcgid, &pgdat, &token, &workingset);
   462		memcg = try_get_flush_memcg(memcgid);
   463		if (!memcg)
   464			return;
   465	
   466		lruvec = mem_cgroup_lruvec(memcg, pgdat);
   467		if (lruvec != folio_lruvec(folio))
   468			goto unlock;
   469	
   470		mod_lruvec_state(lruvec, WORKINGSET_REFAULT_BASE + type, delta);
   471		refault_distance = lru_distance(lruvec, type, token,
   472					LRU_GEN_EVICTION_BITS, lru_gen_bucket_order);
 > 473		workingset_refault_track(lruvec, distance);
   474		/* Check if the gen the page was evicted from still exist */
   475		recent = lru_gen_test_recent(lruvec, type, refault_distance);
   476		/* Check if the distance indicates a refault */
   477		distance = lru_gen_test_refault(lruvec, type, refault_distance,
   478						mem_cgroup_get_nr_swap_pages(memcg));
   479		if (!recent && distance == DISTANCE_NONE)
   480			goto unlock;
   481	
   482		/* see the comment in folio_lru_refs() */
   483		token >>= LRU_GEN_EVICTION_BITS;
   484		refs = (token & (BIT(LRU_REFS_WIDTH) - 1)) + workingset;
   485		tier = lru_tier_from_refs(refs);
   486	
   487		/*
   488		 * Count the following two cases as stalls:
   489		 * 1. For pages accessed through page tables, hotter pages pushed out
   490		 *    hot pages which refaulted immediately.
   491		 * 2. For pages accessed multiple times through file descriptors,
   492		 *    they would have been protected by sort_folio().
   493		 */
   494		if (lru_gen_in_fault() || refs >= BIT(LRU_REFS_WIDTH) - 1) {
   495			if (distance <= DISTANCE_SHORT) {
   496				/* Set ref bits and workingset (increase refs by one) */
   497				if (!lru_gen_in_fault())
   498					folio_set_active(folio);
   499				else
   500					set_mask_bits(&folio->flags, 0,
   501						min_t(unsigned long, refs, BIT(LRU_REFS_WIDTH) - 1)
   502						<< LRU_REFS_PGOFF);
   503				folio_set_workingset(folio);
   504			} else if (recent || distance <= DISTANCE_MID) {
   505				/*
   506				 * Beyound PID protection range, no point increasing refs
   507				 * for highest tier, but we can activate file page.
   508				 */
   509				set_mask_bits(&folio->flags, 0, (refs - workingset) << LRU_REFS_PGOFF);
   510				folio_set_workingset(folio);
   511			} else {
   512				set_mask_bits(&folio->flags, 0, 1 << LRU_REFS_PGOFF);
   513			}
   514			mod_lruvec_state(lruvec, WORKINGSET_RESTORE_BASE + type, delta);
   515		}
   516	
   517		lrugen = &lruvec->lrugen;
   518		hist = lru_hist_of_min_seq(lruvec, type);
   519		protect_tier = tier;
   520	
   521		/*
   522		 * Don't over-protect clean cache page (!tier page), if the page wasn't access
   523		 * for a while (refault distance > LRU / MAX_NR_GENS), there is no help keeping
   524		 * it in memory, bias higher tier instead.
   525		 */
   526		if (distance <= DISTANCE_SHORT && !tier) {
   527			/* The folio is referenced one more time in the shadow gen */
   528			folio_set_workingset(folio);
   529			protect_tier = lru_tier_from_refs(1);
   530			mod_lruvec_state(lruvec, WORKINGSET_ACTIVATE_BASE + type, delta);
   531		}
   532	
   533		if (protect_tier == tier && recent) {
   534			atomic_long_add(delta, &lrugen->refaulted[hist][type][tier]);
   535		} else {
   536			atomic_long_add(delta, &lrugen->avg_total[type][protect_tier]);
   537			atomic_long_add(delta, &lrugen->avg_refaulted[type][protect_tier]);
   538		}
   539	unlock:
   540		mem_cgroup_put(memcg);
   541	}
   542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
