Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB21AD5A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 16:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364100; cv=none; b=mS67GqdWJdk7SgE2Lr82Imuzo6Ph5jJYMABQtytM+a5XDquAJxUP/fwZnFlAT8b+BqX+PR9p8M57IR7CqgIrXowSVYclQBSqN1BDFeH/cp1UPsPLqFJMql2lpiClezuwzsyputFDpZA+BTagMeFB8Rfud0rTiqTDcx31wSEyJ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364100; c=relaxed/simple;
	bh=qOYu0TNe2QZtHKj54kOdyzuCkSgrhuqJOTTyTMG40ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNGEodzy0z0wQixug2CVR/jG2XVaFJC2cSUGShdFgJbmfPe5CWPrR8ywvw/vkvRX+g3gMaWOKz9dUgy9+e0mL5Ccq71mVvhjHhnkEeOw1QJLOeQn3YyTcVVCyLp2gNzUkyVvDqLLMOpolMp3x++NF5TpeTdI8+pkrlft7QKL7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRTvBo84; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRTvBo84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748364098; x=1779900098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qOYu0TNe2QZtHKj54kOdyzuCkSgrhuqJOTTyTMG40ok=;
  b=iRTvBo84aGbspbg2dABdSSG/JAlNhdplieEmjHuYVejzeO8GsmaaxxEQ
   mE5/I/3ov5yan8UGtsdPdiK5Nnpj9pG2BrQVmxq6VxuvtWdi32+E44RDe
   52M18Z4SRZQ1OPAL+6JqwHTNzuDsB+EP/48TsV32toTFZ1L7GbGWhPNTd
   TAnkPxBqt2L1NpF7/Xr+oR0hlsI77dHZEEOjKVigIr/cHfVgIXdNdeF1G
   3RqVzD2HTdKMWXnKqEpyt2Ht2jhflMjc9qWI+GUgYVbiNykt4NS0YN9ii
   bTUvepXWoXnHXZuRBdhJZji10b1vq4lcYOwsYhPLZp5amXbjuanBeX62q
   A==;
X-CSE-ConnectionGUID: eu679xGSTfC4l7/xAZ/Xbg==
X-CSE-MsgGUID: Vy/kNg/8SUul1jDtdy6Cpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="75753527"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="75753527"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:41:37 -0700
X-CSE-ConnectionGUID: KFd7J5B8Q6uvH2RJME9FtA==
X-CSE-MsgGUID: l33Bcp+jSROHh0mS/m3vuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="148028417"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 May 2025 09:41:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJxMs-000TLw-2S;
	Tue, 27 May 2025 16:41:34 +0000
Date: Wed, 28 May 2025 00:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2024-11 2/2] mm/vmscan.c:905:15:
 warning: no previous prototype for 'shrink_slab'
Message-ID: <202505280043.zPr7XVyC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peifeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2024-11
head:   16f76b9f892d885b7c23c5127263bc7eb1d01e24
commit: 606b947630cb44c739336184df9ffd7d2cda34f3 [2/2] ANDROID: vendor_hooks: export shrink_slab
config: i386-randconfig-053-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280043.zPr7XVyC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280043.zPr7XVyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280043.zPr7XVyC-lkp@intel.com/

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
