Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7869114D28C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 18:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739557622; cv=none; b=dzYEP+WUupsnXowZ6EtzZ1V2zFv/dwwcuYWxwLYc39m/admOzq6BEpsJMXGtykq9PWMzxuAvLIofou4LGjKhy02Jlm9ZyQFigRWc0fFEJ9wqCKjwqN/KFxE/2X9C/CFJVTXzfpuTOi1hY6+cMfT/jv7MzgoRpiT4RECQS6HjsYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739557622; c=relaxed/simple;
	bh=vvI9f2wnGROlDx2+4CRitGehZVYm48hCZNFvMOxBjz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i6kDP/cx1Yx/Y7SzpGgaRlrTPQSggqC2WrNgTZOS+JeSc43X55stQR1nfyBotNPP9KUF5B+prbueFjQuOsHjtcyBZz3DqRJwDqPiPpNAA3UWfjrwZ3sWD0ijXiQw2uVoOJuHhM/2O9nvOwPhOJKWjrEDkxHjM3EDk9sIW3TFOY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QX2ye59p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QX2ye59p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739557617; x=1771093617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vvI9f2wnGROlDx2+4CRitGehZVYm48hCZNFvMOxBjz4=;
  b=QX2ye59pdVzRjiRbWEwv3munWJOwlYbBL+AFfuIBBISzp2uTxPm5rVFY
   N+MPdezctXsOJCZdaB7rSB7H2GTAJwQCLGUGkyZeomEG6wBu2KghJj1zl
   jmdbxZt7iKVhT91mS7helPx5FaWgNMALKbLNo07Cnwv8zr3/hiI47MwcJ
   ANpiGL8j7EgHNriL7FQZkroskFK6in7NFnibGsEzqUKuzwAhys6p9d8n7
   EelLtJ/hojAgjAbXSsbwDyWjZM3Fau67k1XFQbpXIiSdFNvhe/mkEa6jq
   mI0sEy/sR71ogmDIAYAlLYKKI/yKyukXGCGWNKQkGR92YRyBwVq7lC0RV
   w==;
X-CSE-ConnectionGUID: ZF0hNtk2Tu29AL7nY8jS4Q==
X-CSE-MsgGUID: umvh1CsIT8KAxRWyAevlKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50959954"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="50959954"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 10:26:57 -0800
X-CSE-ConnectionGUID: lCQfZDvwRdGYbXVgEcOQDw==
X-CSE-MsgGUID: bSEwfDpCR0GA+PQL6eMrrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="144381369"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Feb 2025 10:26:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj0Or-001A1r-1c;
	Fri, 14 Feb 2025 18:26:53 +0000
Date: Sat, 15 Feb 2025 02:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 249/249] mm/vmscan.c:997:15:
 warning: no previous prototype for function 'shrink_slab'
Message-ID: <202502150201.sVuPcR8l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d2ae202da688a9a795c238142e01da921b3e4b81
commit: 09ab235661116880b7ea9b4deb705802f2c19ab4 [249/249] ANDROID: vendor_hooks: export shrink_slab
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250215/202502150201.sVuPcR8l-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150201.sVuPcR8l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150201.sVuPcR8l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2030:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:633:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     633 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/vmscan.c:997:15: warning: no previous prototype for function 'shrink_slab' [-Wmissing-prototypes]
     997 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^
   mm/vmscan.c:997:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     997 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         | ^
         | static 
   mm/vmscan.c:2334:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    2334 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2853:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2853 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2854:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2854 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6899:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6899 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   9 warnings generated.


vim +/shrink_slab +997 mm/vmscan.c

   976	
   977	/**
   978	 * shrink_slab - shrink slab caches
   979	 * @gfp_mask: allocation context
   980	 * @nid: node whose slab caches to target
   981	 * @memcg: memory cgroup whose slab caches to target
   982	 * @priority: the reclaim priority
   983	 *
   984	 * Call the shrink functions to age shrinkable caches.
   985	 *
   986	 * @nid is passed along to shrinkers with SHRINKER_NUMA_AWARE set,
   987	 * unaware shrinkers will receive a node id of 0 instead.
   988	 *
   989	 * @memcg specifies the memory cgroup to target. Unaware shrinkers
   990	 * are called only if it is the root cgroup.
   991	 *
   992	 * @priority is sc->priority, we take the number of objects and >> by priority
   993	 * in order to get the scan target.
   994	 *
   995	 * Returns the number of reclaimed slab objects.
   996	 */
 > 997	unsigned long shrink_slab(gfp_t gfp_mask, int nid,
   998					 struct mem_cgroup *memcg,
   999					 int priority)
  1000	{
  1001		unsigned long ret, freed = 0;
  1002		struct shrinker *shrinker;
  1003		bool bypass = false;
  1004	
  1005		trace_android_vh_shrink_slab_bypass(gfp_mask, nid, memcg, priority, &bypass);
  1006		if (bypass)
  1007			return 0;
  1008	
  1009		/*
  1010		 * The root memcg might be allocated even though memcg is disabled
  1011		 * via "cgroup_disable=memory" boot parameter.  This could make
  1012		 * mem_cgroup_is_root() return false, then just run memcg slab
  1013		 * shrink, but skip global shrink.  This may result in premature
  1014		 * oom.
  1015		 */
  1016		if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
  1017			return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
  1018	
  1019		if (!down_read_trylock(&shrinker_rwsem))
  1020			goto out;
  1021	
  1022		list_for_each_entry(shrinker, &shrinker_list, list) {
  1023			struct shrink_control sc = {
  1024				.gfp_mask = gfp_mask,
  1025				.nid = nid,
  1026				.memcg = memcg,
  1027			};
  1028	
  1029			ret = do_shrink_slab(&sc, shrinker, priority);
  1030			if (ret == SHRINK_EMPTY)
  1031				ret = 0;
  1032			freed += ret;
  1033			/*
  1034			 * Bail out if someone want to register a new shrinker to
  1035			 * prevent the registration from being stalled for long periods
  1036			 * by parallel ongoing shrinking.
  1037			 */
  1038			if (rwsem_is_contended(&shrinker_rwsem)) {
  1039				freed = freed ? : 1;
  1040				break;
  1041			}
  1042		}
  1043	
  1044		up_read(&shrinker_rwsem);
  1045	out:
  1046		cond_resched();
  1047		return freed;
  1048	}
  1049	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
