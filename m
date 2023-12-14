Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C762D3E479
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2WU6V44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702551703; x=1734087703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ww0WnfBytmnbi/hhuXlo4KHRICoOT5JGI4gpmAcOWsk=;
  b=C2WU6V44H5YAk4EqSdQc0Ba9pyyZvuMUPj/W36a73GgnO1OoczoMnW+M
   dxiN6+iPaR3fYpQBFr+U5FcfvRa4n/RON4VZpc+JgRgKxRxcd0xIRJKaF
   3AW1n/IhOuEd34VQDsbKiNhnBR6FoOP7S8WkUjKlNADDEWRAvEb/0CBej
   DEkWQQTCJoCI8hL1BDj//stw9KLmn0zAsYQ4Q+sIq2LZ0BrZUrzHDkxYe
   KCFvFXWk59MCbz+8znAXzd2aQ3A5sc5xcvuHm4okORovsKU7t+0Wa04QI
   /p7ZH8414q9BQCColNXOjpiQsgWarprtmc+eqQqllGoCiDRKgJHS55/Bd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="459425512"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="459425512"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 03:01:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="918020206"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="918020206"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Dec 2023 03:01:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDjTD-000LxV-0a;
	Thu, 14 Dec 2023 11:01:35 +0000
Date: Thu, 14 Dec 2023 19:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 19/276] mm/vmscan.c:905:15: error: no
 previous prototype for 'shrink_slab'
Message-ID: <202312141835.MIj0tKok-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   5feaf92b247cfa3dd98eefa2915dfb3b305ac2d2
commit: 8c19c1e07e377ecbdfab11afa8faca6d9f12a41d [19/276] ANDROID: vendor_hooks: export shrink_slab
config: x86_64-sof-customedconfig-atom-defconfig (https://download.01.org/0day-ci/archive/20231214/202312141835.MIj0tKok-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141835.MIj0tKok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141835.MIj0tKok-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:905:15: error: no previous prototype for 'shrink_slab' [-Werror=missing-prototypes]
     905 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:1357:13: error: variable 'err' set but not used [-Werror=unused-but-set-variable]
    1357 |         int err;
         |             ^~~
   cc1: all warnings being treated as errors


vim +/shrink_slab +905 mm/vmscan.c

   884	
   885	/**
   886	 * shrink_slab - shrink slab caches
   887	 * @gfp_mask: allocation context
   888	 * @nid: node whose slab caches to target
   889	 * @memcg: memory cgroup whose slab caches to target
   890	 * @priority: the reclaim priority
   891	 *
   892	 * Call the shrink functions to age shrinkable caches.
   893	 *
   894	 * @nid is passed along to shrinkers with SHRINKER_NUMA_AWARE set,
   895	 * unaware shrinkers will receive a node id of 0 instead.
   896	 *
   897	 * @memcg specifies the memory cgroup to target. Unaware shrinkers
   898	 * are called only if it is the root cgroup.
   899	 *
   900	 * @priority is sc->priority, we take the number of objects and >> by priority
   901	 * in order to get the scan target.
   902	 *
   903	 * Returns the number of reclaimed slab objects.
   904	 */
 > 905	unsigned long shrink_slab(gfp_t gfp_mask, int nid,
   906					 struct mem_cgroup *memcg,
   907					 int priority)
   908	{
   909		unsigned long ret, freed = 0;
   910		struct shrinker *shrinker;
   911	
   912		/*
   913		 * The root memcg might be allocated even though memcg is disabled
   914		 * via "cgroup_disable=memory" boot parameter.  This could make
   915		 * mem_cgroup_is_root() return false, then just run memcg slab
   916		 * shrink, but skip global shrink.  This may result in premature
   917		 * oom.
   918		 */
   919		if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
   920			return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
   921	
   922		if (!down_read_trylock(&shrinker_rwsem))
   923			goto out;
   924	
   925		list_for_each_entry(shrinker, &shrinker_list, list) {
   926			struct shrink_control sc = {
   927				.gfp_mask = gfp_mask,
   928				.nid = nid,
   929				.memcg = memcg,
   930			};
   931	
   932			ret = do_shrink_slab(&sc, shrinker, priority);
   933			if (ret == SHRINK_EMPTY)
   934				ret = 0;
   935			freed += ret;
   936			/*
   937			 * Bail out if someone want to register a new shrinker to
   938			 * prevent the registration from being stalled for long periods
   939			 * by parallel ongoing shrinking.
   940			 */
   941			if (rwsem_is_contended(&shrinker_rwsem)) {
   942				freed = freed ? : 1;
   943				break;
   944			}
   945		}
   946	
   947		up_read(&shrinker_rwsem);
   948	out:
   949		cond_resched();
   950		return freed;
   951	}
   952	EXPORT_SYMBOL_GPL(shrink_slab);
   953	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
