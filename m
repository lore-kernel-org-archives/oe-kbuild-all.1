Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EE74CDDD6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 11:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545916; cv=none; b=DHyLSkTnktc8NFv6ZQr9TWvQNz1GEY+3MnZyU8irfYyV3qhDWceL4VTOPhIV39VuPvVsBx4Ko9Fx5xBh/ihE5eANd/g2h0Gl5G3sD6O5Y+4z2e3Jj5zTwRj7Ca2N/I4Ltr+o0Tr+HO1bWVz5DvxRt9k/nThG4uhNWlBwlIoKA5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545916; c=relaxed/simple;
	bh=GbR7b4Cth5NTWILJYXf25X2bCiYEyMDGU7dmylQLwdg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OHGELsd5mOHtdEZRIxvuRQ0MmB4h9jAQ8GmGgqEGPSSuQtt40MwyueV71hHQZiS1tp9D+rZlt4LvYDtE4T+uJHC9G+X3yZfIZ/GaNuwT5GXNDTMo2a1PoedbeCWgOsCHTzzLgbV6gtbvVp89n7zAREmw2bDRa6fEeurxvG2WSfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiRsnmdl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiRsnmdl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791545905; x=1823081905;
  h=date:from:to:cc:subject:message-id;
  bh=GbR7b4Cth5NTWILJYXf25X2bCiYEyMDGU7dmylQLwdg=;
  b=CiRsnmdl3Brqos2hdzbFXjEWIkuhVqRM06/uXftc5oKIMXlIOVX96ckY
   SKkdwOCFMBc98LkFE4EaddbfBS8L/ASaTha//LTpfCOj4Xhwa1uu7UjK7
   1i2ofPdAuLyrfEJ/AcdS2UrQlDgE6OrPqryAOj7ChT/rLACc8UKsnM0Bu
   v5/NGzkSvhbg44s/DSG+KloGZQJtghfkPho+YWk8k7jlDpebwJjRWym0/
   JcJVy47mtEAiJVKtY14hjGre10Pv0aewl2oIQ9wZmPQp/psWedOfW81Wc
   DpdnTcGNzYF5cMB4rxqkWsyyDboTlzpAy3qH6WcAYzNbD1ZEMiGvuq98p
   A==;
X-CSE-ConnectionGUID: XD4eI72uRo+AI/Ck23HKdQ==
X-CSE-MsgGUID: 36zQA71wQ6Wv95VuzaxAXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="223484"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="223484"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:38:17 -0700
X-CSE-ConnectionGUID: uaDnHPzHQg68RFYipKL8pQ==
X-CSE-MsgGUID: T0ZjT5PmS12ag1gdls+oEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="652974"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Oct 2026 04:38:16 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF8vV-000000005ho-3JD7;
	Fri, 09 Oct 2026 11:38:13 +0000
Date: Fri, 09 Oct 2026 19:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2] mm/vmscan.c:5285:45:
 error: use of undeclared identifier 'root_mem_cgroup'; did you mean
 'parent_mem_cgroup'?
Message-ID: <202610091903.HLycfleE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c7ad8c94d6193bff72b385b1cf3fb753de09f780
commit: aa438a63587f2d9dc1888265365ff3de338ba16f [0/2] ANDROID: mm: mglru: invoke root shrinker before memcg-specific ones
config: x86_64-buildonly-randconfig-1003-20261009 (https://download.01.org/0day-ci/archive/20261009/202610091903.HLycfleE-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091903.HLycfleE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091903.HLycfleE-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c:4695:6: warning: no previous prototype for function 'isolate_folio' [-Wmissing-prototypes]
    4695 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         |      ^
   mm/vmscan.c:4695:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4695 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         | ^
         | static 
>> mm/vmscan.c:5285:45: error: use of undeclared identifier 'root_mem_cgroup'; did you mean 'parent_mem_cgroup'?
    5285 |                 shrink_slab(sc->gfp_mask, pgdat->node_id, root_mem_cgroup,
         |                                                           ^~~~~~~~~~~~~~~
         |                                                           parent_mem_cgroup
   include/linux/memcontrol.h:1278:34: note: 'parent_mem_cgroup' declared here
    1278 | static inline struct mem_cgroup *parent_mem_cgroup(struct mem_cgroup *memcg)
         |                                  ^
>> mm/vmscan.c:5285:45: error: incompatible pointer types passing 'struct mem_cgroup *(struct mem_cgroup *)' to parameter of type 'struct mem_cgroup *' [-Wincompatible-pointer-types]
    5285 |                 shrink_slab(sc->gfp_mask, pgdat->node_id, root_mem_cgroup,
         |                                                           ^~~~~~~~~~~~~~~
   mm/internal.h:1432:71: note: passing argument to parameter 'memcg' here
    1432 | unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
         |                                                                       ^
   1 warning and 2 errors generated.


vim +5285 mm/vmscan.c

  5255	
  5256	static void lru_gen_shrink_node(struct pglist_data *pgdat, struct scan_control *sc)
  5257	{
  5258		struct blk_plug plug;
  5259		unsigned long reclaimed = sc->nr_reclaimed;
  5260	
  5261		VM_WARN_ON_ONCE(!root_reclaim(sc));
  5262	
  5263		/*
  5264		 * Unmapped clean folios are already prioritized. Scanning for more of
  5265		 * them is likely futile and can cause high reclaim latency when there
  5266		 * is a large number of memcgs.
  5267		 */
  5268		if (!sc->may_writepage || !sc->may_unmap)
  5269			goto done;
  5270	
  5271		lru_add_drain();
  5272	
  5273		blk_start_plug(&plug);
  5274	
  5275		set_mm_walk(pgdat, sc->proactive);
  5276	
  5277		set_initial_priority(pgdat, sc);
  5278	
  5279		if (current_is_kswapd())
  5280			sc->nr_reclaimed = 0;
  5281	
  5282		if (mem_cgroup_disabled()) {
  5283			shrink_one(&pgdat->__lruvec, sc);
  5284		} else {
> 5285			shrink_slab(sc->gfp_mask, pgdat->node_id, root_mem_cgroup,
  5286				    sc->priority);
  5287			if (sc->nr_reclaimed < sc->nr_to_reclaim)
  5288				shrink_many(pgdat, sc);
  5289		}
  5290		if (current_is_kswapd())
  5291			sc->nr_reclaimed += reclaimed;
  5292	
  5293		clear_mm_walk();
  5294	
  5295		blk_finish_plug(&plug);
  5296	done:
  5297		if (sc->nr_reclaimed > reclaimed)
  5298			pgdat->kswapd_failures = 0;
  5299	}
  5300	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
