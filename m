Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868306;
	b=WRK/gXsY1KcjNAnrM5xP0FBHP29iYfo4jebWqLVyKPYP0iKx+/C898pXSs1PsusZJXlh
	 zfUYiPk0KFA3YYonLkb9oBN1IDA3D1LzOw8848zq2lbgSagcv740rh6izMcgoKqZ2nGLz
	 OI9SGsvQ0Og5TQKNdrorstGjsM+2c+reaSssnbqtxy1Fbvzvn2erLO/t8CaR43xM+jc2h
	 2IGGWzYPYCJvjHxutsWqKZaNIewSQfwIsgk3gCesGZuC925Z1PVgMQ3puSMB09+lwg4Hx
	 HaOxho05VqpEMqR/1ycKoyNfK68L8kDSttaxCvBFrVaqCecZjILbFLaJVxKzIYdS4kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868306;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SavqtNkjYR30xrfm+QtuXSJbjun5v52dR9RU2t+dHSU=;
	b=yXMnfs1Xh166xkaAqNiIlNs6PRYVe+yE+JCjS/e07oQZNOhq1k4wAuTX/gqiTolKAko1
	 jGBvvdOZnRAwSsL74eKB5R6JEjuG58vm9MrkF3m43ojaYf8vvNnSFMmW0L/zqOQSh0bbv
	 Bnbq2ckFLywoCzQnpsCa2C2hlc2j1ub4oACTScs0r7/JBsLEBcvP7WFIsny+xOhXSW3Yo
	 4VVZILMJEsDmsIFfluqBS1RvaFFMH+RYunRuRp36KmBT5T+sFtP1GLKI8RqzqmxGcgHQY
	 ocuJBhlmXORRX8s5k77UvwEAQSEQnNR4q0iXWSzXjYtGCT+RuIoEgHTpeWukj8rmq0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iyscd2uz;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3DB606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Nov 2026 12:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iyscd2uz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795868305; x=1827404305;
  h=date:from:to:cc:subject:message-id;
  bh=JcGJQQ8garaU/erONfE9mK4NtoxqcExcoCQ3qfd/mLQ=;
  b=iyscd2uzHYnRGui4aq6CZLqNW+mV0Xq7mKFr/FJahANhB/n1dx2LKkjB
   5r7FVAux1zREo3brW20b0jiQVEGaEb3k88hkKFAI50jEUHik61nSTqX6z
   /23ixLsXzujy8QEI45DhFgrzyu4tT6tMW/16vuIuGpsZYyLK8+kXpOqID
   brgM5e0B+rA947tAb6aYZblndqmONO90nU4/Ty1rGJtqGpM+iri4R68KZ
   jcppnY1rbP0LQq+TF+QPoYQkwIB2Lb2FtBIJl4WLwSafXkPdAEVM1ECY3
   sq87t8tgClrUvToW2CZmUTqcaD/gu8kO9b0HFM6fqNU+yrNl9tlZVYut3
   A==;
X-CSE-ConnectionGUID: zhG1IOZuR6GZvsSNxlPahw==
X-CSE-MsgGUID: da+73ra6ThKpc0AhDuATzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11980"; a="4763516"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4763516"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2026 04:18:24 -0800
X-CSE-ConnectionGUID: G9ePvaNsRZikiGxq1naocQ==
X-CSE-MsgGUID: sUrUHaIhRZ2D88x4prgypw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="14233244"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 28 Nov 2026 04:18:24 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xXHNl-000000000bz-0pWl;
	Sat, 28 Nov 2026 12:18:21 +0000
Date: Sat, 28 Nov 2026 13:18:16 +0100
From: kernel test robot <lkp@intel.com>
To: SJ Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 8/115] mm/damon/core.c:2897:6: warning:
 variable 'sz' is used uninitialized whenever 'if' condition is false
Message-ID: <20261128131145.Nl6CvXC3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   48de80bb219cbce999fe877fcf3256d863908567
commit: 6c2c2ebe06271b1f829f6eac8b56baab5ca71b11 [8/115] mm/damon/core: do not update stat for core filter rejecting region
config: powerpc-randconfig-2200-20261128 (https://download.01.org/0day-ci/archive/20261128/20261128131145.Nl6CvXC3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 578b1f2d6a9776b63cbb6b86f4cca6208d429f48)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128131145.Nl6CvXC3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128131145.Nl6CvXC3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.c:2897:6: warning: variable 'sz' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2897 |         if (c->ops.apply_scheme) {
         |             ^~~~~~~~~~~~~~~~~~~
   mm/damon/core.c:2930:23: note: uninitialized use occurs here
    2930 |         damos_update_stat(s, sz, sz_applied, sz_ops_filter_passed);
         |                              ^~
   mm/damon/core.c:2897:2: note: remove the 'if' if its condition is always true
    2897 |         if (c->ops.apply_scheme) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/core.c:2864:18: note: initialize the variable 'sz' to silence this warning
    2864 |         unsigned long sz;
         |                         ^
         |                          = 0
   1 warning generated.


vim +2897 mm/damon/core.c

c7ec7d5f6b3d1f SJ Park      2026-04-27  2859  
e63a30c51f8400 SJ Park      2022-10-26  2860  static void damos_apply_scheme(struct damon_ctx *c, struct damon_target *t,
e63a30c51f8400 SJ Park      2022-10-26  2861  		struct damon_region *r, struct damos *s)
2ea3498980f5e6 SJ Park      2022-10-26  2862  {
2ea3498980f5e6 SJ Park      2022-10-26  2863  	struct damos_quota *quota = &s->quota;
6c2c2ebe06271b SJ Park      2026-11-22  2864  	unsigned long sz;
2ea3498980f5e6 SJ Park      2022-10-26  2865  	struct timespec64 begin, end;
2ea3498980f5e6 SJ Park      2022-10-26  2866  	unsigned long sz_applied = 0;
b5bbe9c08fd151 SJ Park      2025-01-06  2867  	unsigned long sz_ops_filter_passed = 0;
c603c630b509d6 SJ Park      2023-09-13  2868  	/*
c603c630b509d6 SJ Park      2023-09-13  2869  	 * We plan to support multiple context per kdamond, as DAMON sysfs
c603c630b509d6 SJ Park      2023-09-13  2870  	 * implies with 'nr_contexts' file.  Nevertheless, only single context
c603c630b509d6 SJ Park      2023-09-13  2871  	 * per kdamond is supported for now.  So, we can simply use '0' context
c603c630b509d6 SJ Park      2023-09-13  2872  	 * index here.
c603c630b509d6 SJ Park      2023-09-13  2873  	 */
c603c630b509d6 SJ Park      2023-09-13  2874  	unsigned int cidx = 0;
c603c630b509d6 SJ Park      2023-09-13  2875  	struct damos *siter;		/* schemes iterator */
c603c630b509d6 SJ Park      2023-09-13  2876  	unsigned int sidx = 0;
c603c630b509d6 SJ Park      2023-09-13  2877  	struct damon_target *titer;	/* targets iterator */
bcea0202d4656f SJ Park      2026-06-29  2878  	unsigned int tidx = 0, nr_accesses = 0;
c603c630b509d6 SJ Park      2023-09-13  2879  	bool do_trace = false;
c603c630b509d6 SJ Park      2023-09-13  2880  
c603c630b509d6 SJ Park      2023-09-13  2881  	/* get indices for trace_damos_before_apply() */
c603c630b509d6 SJ Park      2023-09-13  2882  	if (trace_damos_before_apply_enabled()) {
c603c630b509d6 SJ Park      2023-09-13  2883  		damon_for_each_scheme(siter, c) {
c603c630b509d6 SJ Park      2023-09-13  2884  			if (siter == s)
c603c630b509d6 SJ Park      2023-09-13  2885  				break;
c603c630b509d6 SJ Park      2023-09-13  2886  			sidx++;
c603c630b509d6 SJ Park      2023-09-13  2887  		}
c603c630b509d6 SJ Park      2023-09-13  2888  		damon_for_each_target(titer, c) {
c603c630b509d6 SJ Park      2023-09-13  2889  			if (titer == t)
c603c630b509d6 SJ Park      2023-09-13  2890  				break;
c603c630b509d6 SJ Park      2023-09-13  2891  			tidx++;
c603c630b509d6 SJ Park      2023-09-13  2892  		}
bcea0202d4656f SJ Park      2026-06-29  2893  		nr_accesses = damon_nr_accesses_mvsum(r, c);
c603c630b509d6 SJ Park      2023-09-13  2894  		do_trace = true;
c603c630b509d6 SJ Park      2023-09-13  2895  	}
2ea3498980f5e6 SJ Park      2022-10-26  2896  
f7d911c39cbbb8 SJ Park      2022-03-22 @2897  	if (c->ops.apply_scheme) {
6c2c2ebe06271b SJ Park      2026-11-22  2898  		if (damos_core_filter_out(c, t, r, s))
6c2c2ebe06271b SJ Park      2026-11-22  2899  			return;
6c2c2ebe06271b SJ Park      2026-11-22  2900  		sz = damon_sz_region(r);
54419bbd0ee3c7 SJ Park      2026-03-09  2901  		if (damos_quota_is_set(quota) &&
54419bbd0ee3c7 SJ Park      2026-03-09  2902  				quota->charged_sz + sz > quota->esz) {
1cd2430300594a SJ Park      2021-11-05  2903  			sz = ALIGN_DOWN(quota->esz - quota->charged_sz,
cc1db8dff8e751 SJ Park      2026-01-17  2904  					c->min_region_sz);
2b8a248d587334 SJ Park      2021-11-05  2905  			if (!sz)
2b8a248d587334 SJ Park      2021-11-05  2906  				goto update_stat;
64a9974ad5c61f SJ Park      2026-11-02  2907  			if (damon_split_region_at(c, t, r, sz))
90c2fa6adfed7a SJ Park      2026-09-01  2908  				goto update_stat;
2b8a248d587334 SJ Park      2021-11-05  2909  		}
4ff3b4a54a3214 Donggeun Yoo 2026-09-21  2910  		sz = damon_sz_region(r);
1cd2430300594a SJ Park      2021-11-05  2911  		ktime_get_coarse_ts64(&begin);
bcea0202d4656f SJ Park      2026-06-29  2912  		trace_damos_before_apply(cidx, sidx, tidx, r, nr_accesses,
c603c630b509d6 SJ Park      2023-09-13  2913  				damon_nr_regions(t), do_trace);
b5bbe9c08fd151 SJ Park      2025-01-06  2914  		sz_applied = c->ops.apply_scheme(c, t, r, s,
b5bbe9c08fd151 SJ Park      2025-01-06  2915  				&sz_ops_filter_passed);
cfc33a7d2daca4 SJ Park      2025-01-06  2916  		damos_walk_call_walk(c, t, r, s, sz_ops_filter_passed);
1cd2430300594a SJ Park      2021-11-05  2917  		ktime_get_coarse_ts64(&end);
1cd2430300594a SJ Park      2021-11-05  2918  		quota->total_charged_ns += timespec64_to_ns(&end) -
1cd2430300594a SJ Park      2021-11-05  2919  			timespec64_to_ns(&begin);
4ee4fb3214a8aa SJ Park      2026-04-27  2920  		damos_charge_quota(quota, sz, sz_applied);
c7ec7d5f6b3d1f SJ Park      2026-04-27  2921  		if (damos_quota_is_full(quota, c->min_region_sz)) {
50585192bc2ef9 SJ Park      2021-11-05  2922  			quota->charge_target_from = t;
5a2d162e22bf33 SJ Park      2026-04-27  2923  			quota->charge_addr_from = r->ar.end;
50585192bc2ef9 SJ Park      2021-11-05  2924  		}
2b8a248d587334 SJ Park      2021-11-05  2925  	}
2f0b548c9f03a7 SJ Park      2021-11-05  2926  	if (s->action != DAMOS_STAT)
1f366e421c8f69 SJ Park      2021-11-05  2927  		r->age = 0;
2b8a248d587334 SJ Park      2021-11-05  2928  
2b8a248d587334 SJ Park      2021-11-05  2929  update_stat:
60fa9355a6c620 SJ Park      2025-01-06  2930  	damos_update_stat(s, sz, sz_applied, sz_ops_filter_passed);
1f366e421c8f69 SJ Park      2021-11-05  2931  }
e63a30c51f8400 SJ Park      2022-10-26  2932  

:::::: The code at line 2897 was first introduced by commit
:::::: f7d911c39cbbb88d625216a0cfd0517a3047c46e mm/damon: rename damon_primitives to damon_operations

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
