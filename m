Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFF4145A1F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194517; cv=none; b=ROfGZCICNgOWw/tyYkuPoBsCFooSCbCNAh4Sr9WUi76FGP0aezo/9rPIJTfSrgsBHSUb/sEOa4jX9T+qINaI1VCoTGUYmx8KU2DkTOHAR5qt4ul0g8J2TyNzMJjyLaeHSqEn+SDfxj4WcifDc6GZtP5tKbwV5wz4UIOQloJ6GWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194517; c=relaxed/simple;
	bh=ps60PKXXo8zJKKImmqM9kOP8NIW5DOJG4mTdUsnUn2Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uxGUQvaG+QfLipFFSa3NWwyRJjvBrTpgkmuichVXDyfoJMjQ2pHFlUAIKFvKPDtHTWgGziCZAuHowTl1ByrmmgSvo8yEzYHZNXgHQSdSxgQRkFgsQJIkroOuCgHOOaGcBOy+KGhRwE6l9Uw116PQyGF9ejv66YPJ8EbLK3dgzo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mb8hgcVd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mb8hgcVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784194516; x=1815730516;
  h=date:from:to:cc:subject:message-id;
  bh=ps60PKXXo8zJKKImmqM9kOP8NIW5DOJG4mTdUsnUn2Y=;
  b=mb8hgcVd8XJFb+Dp+YTkMwxpLQ4q4wF4nodfhorhLwMFR7w7H3j2oHrp
   EHq9CAIPwQp4lyFSR96zkwQLr/9ARvVXeYzm9gs9cTlZfhuG3GbGJez6H
   Rz7leZqV75TFG5LPAXc3dspcBFe5NaV/klZTl6RsTmHqW7JMrVL9WoR3/
   5x6U67YHuGQ9JkKMbDrduw6YjflFLAAPTgv+TNSRBxer3jWCgjSsYkPwm
   Khfs/rSpILuTlcd6KdwOpg0jjdF7luEdRoErhGp4YfC7beP9xpcVFfP3W
   ZBaLJ4RE7g4lsEir5bBvxu5ZjZAGJtIwUVlVUGpINZNmaSO0FrUQg8xLc
   Q==;
X-CSE-ConnectionGUID: 0VEIU0TBQxOk60keguQhvA==
X-CSE-MsgGUID: Pymns1XSTBOZnHCUM6yR8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="110396171"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="110396171"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 02:35:15 -0700
X-CSE-ConnectionGUID: BXP91K4lS8CWc8NJ1FObtQ==
X-CSE-MsgGUID: 10HkG42kRMy+qrrvoPL+Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="255925894"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Jul 2026 02:35:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkIUo-00000000Odi-3bXU;
	Thu, 16 Jul 2026 09:35:10 +0000
Date: Thu, 16 Jul 2026 17:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2026-06 6/6]
 mm/vmscan.c:905:15: warning: no previous prototype for 'shrink_slab'
Message-ID: <202607161757.POma50EB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Peifeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2026-06
head:   7e8c257a4ec10d7fb33263300a521590d71c1fb1
commit: 606b947630cb44c739336184df9ffd7d2cda34f3 [6/6] ANDROID: vendor_hooks: export shrink_slab
config: i386-randconfig-062-20260715 (https://download.01.org/0day-ci/archive/20260716/202607161757.POma50EB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161757.POma50EB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161757.POma50EB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:905:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
     905 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:1357:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1357 |         int err;
         |             ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]


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
