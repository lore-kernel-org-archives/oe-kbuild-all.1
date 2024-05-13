Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D5B50291
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 06:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715580543; cv=none; b=cq31PEOMFyA9y5RW5X+XBRcMS9rjt1uWEY8AJreaej6PYmC18z6GAfU1qBsTpJCvun7myTlOg+woQ4MWIOxT6LP/ROOLbg7EerxjVzISUcY7n3axG2OfvjoRiNlr5sdMVfwRAg+w5sOv07RqyeL1CmYOLiw9/Pz1P/vjtAapBhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715580543; c=relaxed/simple;
	bh=bomBPDE5RnPfvQrrWWpQouJ0SOjTllO9GDjAXNpS4Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JeY+xoialKYf3gs+tDnaq/3pZVMwWA7PVddtdGwEexjPp71C87y9xhvayQEgaaDUF5detn6p9kKAIRM/pAvO6Tnxsrtk7GqloJEgCaWW0mNEQPuaPDtmu7BUyrMFard2F97UuDHwAksqNHMM8MQVZprOhdYbHNZtN3iy58shRaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMM5lOK1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMM5lOK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715580541; x=1747116541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bomBPDE5RnPfvQrrWWpQouJ0SOjTllO9GDjAXNpS4Vo=;
  b=GMM5lOK1V+HYOFn7/aaO02aKy0Rh7ql6cGwQdwW7IuUDKx8ntBp9HKuK
   ENqs8ehsqOcPU/HTwNuXnokFLKCv44k1EhQ0SA+p33iqN3x8DX5bg64Q+
   ZrPySdw0sadd7kC+i3UiNqq5xpKEm00MHb/gOSsHEOAYkx8AnnlCoPoFA
   NHup5hzPH67uTzlyz+ZOPKhIJ+ldRAyg+8flsBppN2WqKALeShqTbAuq1
   hdczPbDMC9kDO2ReT33f+VLscTkUxf+jz8nbH1uZKJdFJfqf8olfE51IL
   I6f/Bsg+/3rvFtjA5bTZ7E7qMJvynRUoia7RgfC+1jDbe71CAiX6+RvIz
   Q==;
X-CSE-ConnectionGUID: jFVPGPyHSxOwbOD0m8CkpQ==
X-CSE-MsgGUID: TkkTX+xISgeTbU01hUb1XQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="34008105"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="34008105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 23:09:01 -0700
X-CSE-ConnectionGUID: Dn/yVI47Sj6MzxgbiExtEg==
X-CSE-MsgGUID: aS81iq/0Tqirr/QSzzPjtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="53452934"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2024 23:09:00 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6Orp-0009an-1i;
	Mon, 13 May 2024 06:08:57 +0000
Date: Mon, 13 May 2024 14:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 29/33] mm/damon/acma.c:206:34: warning: unused
 variable 'goal'
Message-ID: <202405131352.0zBdvE1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   8babfaa14bfc8f45e2c3d093952ab737fd0db1d5
commit: 1465b25a340a8aa09800ddcf3d4aef185ea6c84c [29/33] mm/damon: add the initial part of access/contiguity-aware memory auto-scaling module
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240513/202405131352.0zBdvE1q-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405131352.0zBdvE1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131352.0zBdvE1q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/damon/acma.c: In function 'damon_acma_new_scheme':
   mm/damon/acma.c:146:16: error: too few arguments to function 'damon_new_scheme'
     146 |         return damon_new_scheme(
         |                ^~~~~~~~~~~~~~~~
   In file included from mm/damon/acma.c:19:
   include/linux/damon.h:770:15: note: declared here
     770 | struct damos *damon_new_scheme(struct damos_access_pattern *pattern,
         |               ^~~~~~~~~~~~~~~~
   mm/damon/acma.c: At top level:
   mm/damon/acma.c:169:17: error: unknown type name 'damos_quota_goal_metric'
     169 |                 damos_quota_goal_metric goal_metric)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/acma.c: In function 'damon_acma_new_reclaim_scheme':
   mm/damon/acma.c:193:15: error: implicit declaration of function 'damon_acma_set_scheme_quota'; did you mean 'damon_acma_new_scheme'? [-Werror=implicit-function-declaration]
     193 |         err = damon_acma_set_scheme_quota(scheme, old,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               damon_acma_new_scheme
   mm/damon/acma.c: In function 'damon_acma_apply_parameters':
>> mm/damon/acma.c:206:34: warning: unused variable 'goal' [-Wunused-variable]
     206 |         struct damos_quota_goal *goal;
         |                                  ^~~~
   mm/damon/acma.c: In function 'damon_acma_after_aggregation':
   mm/damon/acma.c:303:22: error: 'DAMOS_LRU_RECLAIM' undeclared (first use in this function); did you mean 'DAMOS_LRU_DEPRIO'?
     303 |                 case DAMOS_LRU_RECLAIM:
         |                      ^~~~~~~~~~~~~~~~~
         |                      DAMOS_LRU_DEPRIO
   mm/damon/acma.c:303:22: note: each undeclared identifier is reported only once for each function it appears in
   mm/damon/acma.c:313:12: error: invalid storage class for function 'damon_acma_after_wmarks_check'
     313 | static int damon_acma_after_wmarks_check(struct damon_ctx *c)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/acma.c:318:19: error: invalid storage class for function 'damon_acma_init'
     318 | static int __init damon_acma_init(void)
         |                   ^~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/cgroup.h:12,
                    from include/linux/memcontrol.h:13,
                    from include/linux/damon.h:11:
   mm/damon/acma.c:335:13: error: initializer element is not constant
     335 | module_init(damon_acma_init);
         |             ^~~~~~~~~~~~~~~
   include/linux/init.h:270:55: note: in definition of macro '____define_initcall'
     270 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:311:41: note: in expansion of macro '__define_initcall'
     311 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:316:24: note: in expansion of macro 'device_initcall'
     316 | #define __initcall(fn) device_initcall(fn)
         |                        ^~~~~~~~~~~~~~~
   include/linux/module.h:88:25: note: in expansion of macro '__initcall'
      88 | #define module_init(x)  __initcall(x);
         |                         ^~~~~~~~~~
   mm/damon/acma.c:335:1: note: in expansion of macro 'module_init'
     335 | module_init(damon_acma_init);
         | ^~~~~~~~~~~
   mm/damon/acma.c:335:1: error: expected declaration or statement at end of input
   mm/damon/acma.c: In function 'damon_acma_new_scheme':
>> mm/damon/acma.c:155:1: warning: control reaches end of non-void function [-Wreturn-type]
     155 | }
         | ^
   mm/damon/acma.c: At top level:
>> mm/damon/acma.c:157:13: warning: 'damon_acma_copy_quota_status' defined but not used [-Wunused-function]
     157 | static void damon_acma_copy_quota_status(struct damos_quota *dst,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/goal +206 mm/damon/acma.c

   140	
   141	static struct damos *damon_acma_new_scheme(
   142			struct damos_access_pattern *pattern, enum damos_action action)
   143	{
   144		struct damos_quota quota = damon_acma_quota;
   145	
   146		return damon_new_scheme(
   147				pattern,
   148				action,
   149				/* work for every second */
   150				1000000,
   151				/* under the quota. */
   152				&quota,
   153				/* (De)activate this according to the watermarks. */
   154				&damon_acma_wmarks);
 > 155	}
   156	
 > 157	static void damon_acma_copy_quota_status(struct damos_quota *dst,
   158			struct damos_quota *src)
   159	{
   160		dst->total_charged_sz = src->total_charged_sz;
   161		dst->total_charged_ns = src->total_charged_ns;
   162		dst->charged_sz = src->charged_sz;
   163		dst->charged_from = src->charged_from;
   164		dst->charge_target_from = src->charge_target_from;
   165		dst->charge_addr_from = src->charge_addr_from;
   166	}
   167	
   168	static int damon_acma_set_scheme_quota(struct damos *scheme, struct damos *old,
   169			damos_quota_goal_metric goal_metric)
   170	{
   171		if (old)
   172			damon_acma_copy_quota_status(&scheme->quota, &old->quota);
   173		goal = damos_new_quota_goal(goal_metric, quota_mem_pressure_us);
   174		if (!goal)
   175			return -ENOMEM;
   176		damos_add_quota_goal(&scheme->quota, goal);
   177		return 0;
   178	}
   179	
   180	/*
   181	 * Reclaim cold pages on entire physical address space
   182	 */
   183	static struct damos *damon_acma_new_reclaim_scheme(struct damos *old)
   184	{
   185		struct damos_access_pattern pattern = damon_acma_stub_pattern;
   186		struct damos *scheme;
   187		int err;
   188	
   189		pattern.max_nr_accesses = 0;
   190		scheme = damon_acma_new_scheme(&pattern, DAMOS_PAGEOUT);
   191		if (!scheme)
   192			return NULL;
   193		err = damon_acma_set_scheme_quota(scheme, old,
   194				DAMOS_QUOTA_SOME_MEM_PSI_US);
   195		if (err) {
   196			damon_destroy_scheme(scheme);
   197			return NULL;
   198		}
   199		return scheme;
   200	}
   201	
   202	static int damon_acma_apply_parameters(void)
   203	{
   204		struct damos *scheme, *reclaim_scheme;
   205		struct damos *old_reclaim_scheme = NULL;
 > 206		struct damos_quota_goal *goal;
   207		int err = 0;
   208	
   209		err = damon_set_attrs(ctx, &damon_acma_mon_attrs);
   210		if (err)
   211			return err;
   212	
   213		damon_for_each_scheme(scheme, ctx)
   214			old_reclaim_scheme = scheme;
   215	
   216		reclaim_scheme = damon_acma_new_reclaim_scheme(old_reclaim_scheme);
   217		if (!reclaim_scheme)
   218			return -ENOMEM;
   219		damon_set_schemes(ctx, &reclaim_scheme, 1);
   220	
   221		return damon_set_region_biggest_system_ram_default(target,
   222						&monitor_region_start,
   223						&monitor_region_end);
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
