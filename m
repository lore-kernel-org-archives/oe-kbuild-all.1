Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7C4145355
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765693725; cv=none; b=EvleDdYPISPWVCD8ZNVxZJgrxxP7ySG18VfV0axyO5q8z7dDq+vD/pGRItLmxMYs4Kk5Koh5S4o0HWhEslDZ6U58/Ke9taA7S2vLJEXZHswyQr8Q+cH+zcDqntIacSLvJGz43T50WpIXlfx6QOiCXCVOEVJKY3fc/OrqgGSQRDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765693725; c=relaxed/simple;
	bh=O+sMEOXrkM/0L8+46rJni061dbikU34jQoCI+8zqx6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tXA9v5pN/QMr4vjn8H866iRN/j72mYo7fUcGLUm1yaqsOd6JFeh+CMQDaDRTw78so0L177q5KiSnOpquD62QLxJszaFPhJIqj8Rla5+TxX+Ki7Xz4whZuuf/82sAauOoLVA/IEqm67oujjJ8okfcUl6pG/5o1sTxjY1CneDZHcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ks91NzLP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ks91NzLP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765693723; x=1797229723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+sMEOXrkM/0L8+46rJni061dbikU34jQoCI+8zqx6I=;
  b=Ks91NzLPBilWkPBTCYNRIC8220DHP7a7BqoI7EkyU4m8YA94TMbmc1Cj
   ZtL1sHnwYn5ehMuebPRKQ9ps3e/79fvY+6kjaPHhZDc143Tdi+zhjDBnY
   WpvifkgxzlzGwjcObvlB3ojgrbxowDutE8taGrIBNCEHp2sgt53jCdNyM
   y4Qq4AgHHsRZz3tYw0TY7hqSywA5390Acdr66CWCZh2NU5MtLwaL8w5Km
   cEuMVxLWdxkEsRIeMZtTvnK7YfVAyKtEdSnzTPEE13KwQxNe0tJTCOuIk
   AfHG+Gv2eywzLDvJVrh6LtliMdh9v64Z70SraJtl/07wiHlpAGxMN5BDF
   A==;
X-CSE-ConnectionGUID: /hnfuSgBTD+nw94lXbxKLw==
X-CSE-MsgGUID: CrlfkrTFRM+HfyEld6h4fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85226166"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="85226166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 22:28:43 -0800
X-CSE-ConnectionGUID: PWEgqlOIQAa7G41QGTfDsA==
X-CSE-MsgGUID: nuF37vWmTsuBkGA+J+s8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197509500"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2025 22:28:42 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUfax-000000002IW-08aQ;
	Sun, 14 Dec 2025 06:28:39 +0000
Date: Sun, 14 Dec 2025 07:28:04 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40] mm/vmscan.c:997:15:
 warning: no previous prototype for 'shrink_slab'
Message-ID: <202512140735.mFuS8dbH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: 09ab235661116880b7ea9b4deb705802f2c19ab4 [40/40] ANDROID: vendor_hooks: export shrink_slab
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251214/202512140735.mFuS8dbH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140735.mFuS8dbH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140735.mFuS8dbH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:997:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
     997 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~


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
