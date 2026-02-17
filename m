Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25E133993
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 07:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313670; cv=none; b=Tqy8VQpPY7Gv2Oo1+UqF3RFW/Ye//vNFPBDmTAOqyR82i3UAjK1A24rBJDD+avEVGcfb/lVJQfVPaJBdys2VnqRKo1Z/3jfwlX5bc1o3tRMN5ATF6PpUmgqg5mJvbfGX2Ndblp4ZblNWa6kCfxjfwNrIiMr0bYMcIoF72J6AsdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313670; c=relaxed/simple;
	bh=3Ze8WFYqRkiy3Uexn4QMudNunUswB1mcmaDjvVwK+4A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e9pONiBlBEBeVR2AN3zW5yGMMe8SpaRkSEydBEvab2grAeW4ZYl6p9Lgf7TqtqKx2uDASX7mB3F1GW/48cGLVAgEUZXLZVoT/YIN3EzNtu4PzN3K3mj8hQv+h9J3qyOtMM9utYXOCRfoo2tvKDuAfv5obxrgPcnlgW0Cu4qJHxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaCo6Hkt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaCo6Hkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771313669; x=1802849669;
  h=date:from:to:cc:subject:message-id;
  bh=3Ze8WFYqRkiy3Uexn4QMudNunUswB1mcmaDjvVwK+4A=;
  b=RaCo6HktFUbdT1E4VKWoyRVkf/jo1NmDY2pvJhbJrNJEEXgNyShlm/f4
   J5FWa1eoeWjf7WF536KpDIWHg87zJh23rZrYeiuPb23eNj6eMSCUjS2Cq
   MqZ+nVFk7uDfUPlHMZCmYWbzXChgFA1xIGbjUrZUm9sItxSfAHy2HNByF
   1Rbn1bCgIMiHpJN8zL5Z7T155SYT9GKJguqAmZU5iJCBRyCrN7hr2Yj2I
   YCvJ1OjZfXEVLPNSwsy7+Wp9vvxAHPohpLwPqRnOTri3dWBjMUfxNwfoa
   GlRlQSXzZoCBh6C6HDGpR1OYDSsO/G84wdFGpn/z/n6/XHC5Zc8HYAKFZ
   w==;
X-CSE-ConnectionGUID: Tt2QPKyyTFa+KDux42BjSg==
X-CSE-MsgGUID: 8fCmhgskRueyTH7gQIKE8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="97840036"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="97840036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 23:34:28 -0800
X-CSE-ConnectionGUID: yhESnr5wQh26Np0zyEyrSQ==
X-CSE-MsgGUID: nuxbf3i6Q3efJEkM3n2GDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="212299824"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Feb 2026 23:34:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsFbE-000000010j4-2MVO;
	Tue, 17 Feb 2026 07:34:24 +0000
Date: Tue, 17 Feb 2026 15:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 130/142] samples/damon/mtier.c:78:30:
 warning: unused variable 'region'
Message-ID: <202602171530.NsLdPVOF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   53a936b437ade97f957569534f1460d23883b94f
commit: 52639cde20a9887c5df4acc55fb51a4f48a1644d [130/142] samples/damon/mtier: replace damon_add_region() with damon_set_regions()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171530.NsLdPVOF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171530.NsLdPVOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171530.NsLdPVOF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   samples/damon/mtier.c: In function 'damon_sample_mtier_build_ctx':
>> samples/damon/mtier.c:78:30: warning: unused variable 'region' [-Wunused-variable]
      78 |         struct damon_region *region;
         |                              ^~~~~~


vim +/region +78 samples/damon/mtier.c

749cc6533b6621 Yunjeong Mun  2025-07-08   72  
82a08bde3cf7bb SeongJae Park 2025-04-20   73  static struct damon_ctx *damon_sample_mtier_build_ctx(bool promote)
82a08bde3cf7bb SeongJae Park 2025-04-20   74  {
82a08bde3cf7bb SeongJae Park 2025-04-20   75  	struct damon_ctx *ctx;
82a08bde3cf7bb SeongJae Park 2025-04-20   76  	struct damon_attrs attrs;
82a08bde3cf7bb SeongJae Park 2025-04-20   77  	struct damon_target *target;
82a08bde3cf7bb SeongJae Park 2025-04-20  @78  	struct damon_region *region;
82a08bde3cf7bb SeongJae Park 2025-04-20   79  	struct damos *scheme;
82a08bde3cf7bb SeongJae Park 2025-04-20   80  	struct damos_quota_goal *quota_goal;
82a08bde3cf7bb SeongJae Park 2025-04-20   81  	struct damos_filter *filter;
749cc6533b6621 Yunjeong Mun  2025-07-08   82  	struct region_range addr;
52639cde20a988 SeongJae Park 2026-02-15   83  	struct damon_addr_range range;
749cc6533b6621 Yunjeong Mun  2025-07-08   84  	int ret;
82a08bde3cf7bb SeongJae Park 2025-04-20   85  
82a08bde3cf7bb SeongJae Park 2025-04-20   86  	ctx = damon_new_ctx();
82a08bde3cf7bb SeongJae Park 2025-04-20   87  	if (!ctx)
82a08bde3cf7bb SeongJae Park 2025-04-20   88  		return NULL;
82a08bde3cf7bb SeongJae Park 2025-04-20   89  	attrs = (struct damon_attrs) {
82a08bde3cf7bb SeongJae Park 2025-04-20   90  		.sample_interval = 5 * USEC_PER_MSEC,
82a08bde3cf7bb SeongJae Park 2025-04-20   91  		.aggr_interval = 100 * USEC_PER_MSEC,
82a08bde3cf7bb SeongJae Park 2025-04-20   92  		.ops_update_interval = 60 * USEC_PER_MSEC * MSEC_PER_SEC,
82a08bde3cf7bb SeongJae Park 2025-04-20   93  		.min_nr_regions = 10,
82a08bde3cf7bb SeongJae Park 2025-04-20   94  		.max_nr_regions = 1000,
82a08bde3cf7bb SeongJae Park 2025-04-20   95  	};
82a08bde3cf7bb SeongJae Park 2025-04-20   96  
82a08bde3cf7bb SeongJae Park 2025-04-20   97  	/*
82a08bde3cf7bb SeongJae Park 2025-04-20   98  	 * auto-tune sampling and aggregation interval aiming 4% DAMON-observed
82a08bde3cf7bb SeongJae Park 2025-04-20   99  	 * accesses ratio, keeping sampling interval in [5ms, 10s] range.
82a08bde3cf7bb SeongJae Park 2025-04-20  100  	 */
82a08bde3cf7bb SeongJae Park 2025-04-20  101  	attrs.intervals_goal = (struct damon_intervals_goal) {
82a08bde3cf7bb SeongJae Park 2025-04-20  102  		.access_bp = 400, .aggrs = 3,
82a08bde3cf7bb SeongJae Park 2025-04-20  103  		.min_sample_us = 5000, .max_sample_us = 10000000,
82a08bde3cf7bb SeongJae Park 2025-04-20  104  	};
82a08bde3cf7bb SeongJae Park 2025-04-20  105  	if (damon_set_attrs(ctx, &attrs))
82a08bde3cf7bb SeongJae Park 2025-04-20  106  		goto free_out;
82a08bde3cf7bb SeongJae Park 2025-04-20  107  	if (damon_select_ops(ctx, DAMON_OPS_PADDR))
82a08bde3cf7bb SeongJae Park 2025-04-20  108  		goto free_out;
82a08bde3cf7bb SeongJae Park 2025-04-20  109  
82a08bde3cf7bb SeongJae Park 2025-04-20  110  	target = damon_new_target();
82a08bde3cf7bb SeongJae Park 2025-04-20  111  	if (!target)
82a08bde3cf7bb SeongJae Park 2025-04-20  112  		goto free_out;
82a08bde3cf7bb SeongJae Park 2025-04-20  113  	damon_add_target(ctx, target);
749cc6533b6621 Yunjeong Mun  2025-07-08  114  
749cc6533b6621 Yunjeong Mun  2025-07-08  115  	if (detect_node_addresses) {
749cc6533b6621 Yunjeong Mun  2025-07-08  116  		ret = promote ? nid_to_phys(1, &addr) : nid_to_phys(0, &addr);
749cc6533b6621 Yunjeong Mun  2025-07-08  117  		if (ret)
749cc6533b6621 Yunjeong Mun  2025-07-08  118  			goto free_out;
749cc6533b6621 Yunjeong Mun  2025-07-08  119  	} else {
749cc6533b6621 Yunjeong Mun  2025-07-08  120  		addr.start = promote ? node1_start_addr : node0_start_addr;
749cc6533b6621 Yunjeong Mun  2025-07-08  121  		addr.end = promote ? node1_end_addr : node0_end_addr;
749cc6533b6621 Yunjeong Mun  2025-07-08  122  	}
749cc6533b6621 Yunjeong Mun  2025-07-08  123  
52639cde20a988 SeongJae Park 2026-02-15  124  	range.start = addr.start;
52639cde20a988 SeongJae Park 2026-02-15  125  	range.end = addr.end;
52639cde20a988 SeongJae Park 2026-02-15  126  
52639cde20a988 SeongJae Park 2026-02-15  127  	ret = damon_set_regions(target, &range, 1, DAMON_MIN_REGION_SZ);
52639cde20a988 SeongJae Park 2026-02-15  128  	if (ret)
82a08bde3cf7bb SeongJae Park 2025-04-20  129  		goto free_out;
82a08bde3cf7bb SeongJae Park 2025-04-20  130  
82a08bde3cf7bb SeongJae Park 2025-04-20  131  	scheme = damon_new_scheme(
82a08bde3cf7bb SeongJae Park 2025-04-20  132  			/* access pattern */
82a08bde3cf7bb SeongJae Park 2025-04-20  133  			&(struct damos_access_pattern) {
82a08bde3cf7bb SeongJae Park 2025-04-20  134  				.min_sz_region = PAGE_SIZE,
82a08bde3cf7bb SeongJae Park 2025-04-20  135  				.max_sz_region = ULONG_MAX,
82a08bde3cf7bb SeongJae Park 2025-04-20  136  				.min_nr_accesses = promote ? 1 : 0,
82a08bde3cf7bb SeongJae Park 2025-04-20  137  				.max_nr_accesses = promote ? UINT_MAX : 0,
82a08bde3cf7bb SeongJae Park 2025-04-20  138  				.min_age_region = 0,
82a08bde3cf7bb SeongJae Park 2025-04-20  139  				.max_age_region = UINT_MAX},
82a08bde3cf7bb SeongJae Park 2025-04-20  140  			/* action */
82a08bde3cf7bb SeongJae Park 2025-04-20  141  			promote ? DAMOS_MIGRATE_HOT : DAMOS_MIGRATE_COLD,
82a08bde3cf7bb SeongJae Park 2025-04-20  142  			1000000,	/* apply interval (1s) */
82a08bde3cf7bb SeongJae Park 2025-04-20  143  			&(struct damos_quota){
82a08bde3cf7bb SeongJae Park 2025-04-20  144  				/* 200 MiB per sec by most */
82a08bde3cf7bb SeongJae Park 2025-04-20  145  				.reset_interval = 1000,
82a08bde3cf7bb SeongJae Park 2025-04-20  146  				.sz = 200 * 1024 * 1024,
82a08bde3cf7bb SeongJae Park 2025-04-20  147  				/* ignore size of region when prioritizing */
82a08bde3cf7bb SeongJae Park 2025-04-20  148  				.weight_sz = 0,
82a08bde3cf7bb SeongJae Park 2025-04-20  149  				.weight_nr_accesses = 100,
82a08bde3cf7bb SeongJae Park 2025-04-20  150  				.weight_age = 100,
82a08bde3cf7bb SeongJae Park 2025-04-20  151  			},
82a08bde3cf7bb SeongJae Park 2025-04-20  152  			&(struct damos_watermarks){},
82a08bde3cf7bb SeongJae Park 2025-04-20  153  			promote ? 0 : 1);	/* migrate target node id */
82a08bde3cf7bb SeongJae Park 2025-04-20  154  	if (!scheme)
82a08bde3cf7bb SeongJae Park 2025-04-20  155  		goto free_out;
82a08bde3cf7bb SeongJae Park 2025-04-20  156  	damon_set_schemes(ctx, &scheme, 1);
82a08bde3cf7bb SeongJae Park 2025-04-20  157  	quota_goal = damos_new_quota_goal(
82a08bde3cf7bb SeongJae Park 2025-04-20  158  			promote ? DAMOS_QUOTA_NODE_MEM_USED_BP :
82a08bde3cf7bb SeongJae Park 2025-04-20  159  			DAMOS_QUOTA_NODE_MEM_FREE_BP,
c5e67d40a10234 Yunjeong Mun  2025-06-27  160  			promote ? node0_mem_used_bp : node0_mem_free_bp);
82a08bde3cf7bb SeongJae Park 2025-04-20  161  	if (!quota_goal)
82a08bde3cf7bb SeongJae Park 2025-04-20  162  		goto free_out;
82a08bde3cf7bb SeongJae Park 2025-04-20  163  	quota_goal->nid = 0;
82a08bde3cf7bb SeongJae Park 2025-04-20  164  	damos_add_quota_goal(&scheme->quota, quota_goal);
82a08bde3cf7bb SeongJae Park 2025-04-20  165  	filter = damos_new_filter(DAMOS_FILTER_TYPE_YOUNG, true, promote);
82a08bde3cf7bb SeongJae Park 2025-04-20  166  	if (!filter)
82a08bde3cf7bb SeongJae Park 2025-04-20  167  		goto free_out;
82a08bde3cf7bb SeongJae Park 2025-04-20  168  	damos_add_filter(scheme, filter);
82a08bde3cf7bb SeongJae Park 2025-04-20  169  	return ctx;
82a08bde3cf7bb SeongJae Park 2025-04-20  170  free_out:
82a08bde3cf7bb SeongJae Park 2025-04-20  171  	damon_destroy_ctx(ctx);
82a08bde3cf7bb SeongJae Park 2025-04-20  172  	return NULL;
82a08bde3cf7bb SeongJae Park 2025-04-20  173  }
82a08bde3cf7bb SeongJae Park 2025-04-20  174  

:::::: The code at line 78 was first introduced by commit
:::::: 82a08bde3cf7bbbe90de57baa181bebf676582c7 samples/damon: implement a DAMON module for memory tiering

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
