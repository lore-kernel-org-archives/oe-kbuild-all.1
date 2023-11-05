Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31C62CA7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bi3Z6znB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699177481; x=1730713481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/qUIO17jD0+G6JtmXWmjTM8u4xLjBvwoqw18kMAaO8=;
  b=bi3Z6znBpextPFc8lkn1d2H48YAPBcgspcXLieUknoiq2w6x8Qr88ZwE
   aEANGooflwxneee4qvD3k1I/7tA+GcN8PQRRi3t7/RGertlI21DEiP+Ji
   OSiG7jULfWLZtTLk4ORAprjkzSoysCMSuH5c0U/YSBEpVkEl0E2pFfsgQ
   +fk08iyWzYsE7TIx+fxHq/KqeLpiqfxbFTnnwkAwFhKr2rVMTNlJjRiLE
   RYabiskZxIyVuheMxy6t/NMY4AsH/EOH4qhIavgI9Sgu+E21vpl6kFKLu
   GL2WMJxOEBV5nlef6d0k+KYuEax0FmJ08P75fQoOa+iL8cehOJBQ/5EmT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="392003158"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="392003158"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 01:44:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="827930582"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="827930582"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Nov 2023 01:44:39 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzZgL-0005I0-2Z;
	Sun, 05 Nov 2023 09:44:37 +0000
Date: Sun, 5 Nov 2023 17:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-lts 3/6] mm/vmscan.c:905:15: warning:
 no previous prototype for function 'shrink_slab'
Message-ID: <202311051730.FFMImIkj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-lts
head:   61cfd264993d07540f60a5c53d77a14c818e54a9
commit: 606b947630cb44c739336184df9ffd7d2cda34f3 [3/6] ANDROID: vendor_hooks: export shrink_slab
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231105/202311051730.FFMImIkj-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051730.FFMImIkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051730.FFMImIkj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:905:15: warning: no previous prototype for function 'shrink_slab' [-Wmissing-prototypes]
   unsigned long shrink_slab(gfp_t gfp_mask, int nid,
                 ^
   mm/vmscan.c:905:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long shrink_slab(gfp_t gfp_mask, int nid,
   ^
   static 
   mm/vmscan.c:1357:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
           int err;
               ^
   2 warnings generated.


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
