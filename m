Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEBF3815DC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 05:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787117681; cv=none; b=l/y8vu8TC+qZvaigZ9gUfB3TLROWsqg4fPKWWfwzYHPvnebaIrqf9xGqHvBuxTABuUeHmHgOZkFajpwFevNjGU63xa172W4JkyJa+/pR2z4b25EX4Frc44VbK31J8e7MYwIeFAaIaoU+WzrnciXc0k16y1xklYBR21jOmkG93cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787117681; c=relaxed/simple;
	bh=hgTaf8zOLT/C1QZRDcF+CgSn3VQE9Oiy4siX9PBPw1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ukLTbe75BjaxJ6MGYDWccNM+tE8yDmrQGjfPS1aYwtNYGJSU966XGSLZoZi0JNU6HxjWHV5ZXgdjWrQUTWyp6KUI+keE0qkchcdn9YaOp4UDGxY1wuJ/s6/GtLzm4jPdCCXGZYNFjQ/uYHPXBFIypI1FC1aJIWL63uMDKH9MRf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6v8YngE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6v8YngE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787117679; x=1818653679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hgTaf8zOLT/C1QZRDcF+CgSn3VQE9Oiy4siX9PBPw1A=;
  b=Y6v8YngENFpAItj87ImpR+Dv/b7MoElZMxZt6uWCWca15WaW1BaYE4gJ
   Xob31uVNdBqG/52cfyrsuJAZoCQ2dlbo0DhO80ixosa/LMWV4iuWOPVzi
   SKR0c3GxU39YFWmV9NUPllJ5oMKpy6ZRS+RKZcCCLbc7pzWMSaRoGRsd8
   yfvMmfEN8BLfT5zP3V4X8d9bJkO2zcn6xaIICvG+sy1Map0xGxq37vl//
   E/pByjvvyPfrPg8vvbzVFtt3JxrUjrJhfYfJcIcPvz38XxmSrY9drFBSJ
   s4cgctM9MAmoUuCp99hdVLU6FOuBPQgNLYETxOIKOm094Pt8Z3WKW8r/s
   A==;
X-CSE-ConnectionGUID: /dC9R5NASxWdBCPqm7st1w==
X-CSE-MsgGUID: fWAS3Qd5Sdyfgri3zDO6rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87382076"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87382076"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 22:34:39 -0700
X-CSE-ConnectionGUID: WAxT3bgHR5KUkymSDBqvNw==
X-CSE-MsgGUID: hzarOSJJTIOtdteD6/wNQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="265004983"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Aug 2026 22:34:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwYwZ-00000000euS-0Bdv;
	Wed, 19 Aug 2026 05:34:31 +0000
Date: Wed, 19 Aug 2026 13:34:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-cached 62/64] lib/dynamic_debug.c:409:13:
 warning: assignment to 'void *' from 'int' makes pointer from integer without
 a cast
Message-ID: <202608191348.LmT5jL98-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-shrink-cached
head:   917ff2e5a74ae1c252ad3a2c9017bd464f9258f9
commit: 9ddeda37ca2aba5800b9bbc30e16a1db1ce44e5c [62/64] lib/arena_maple_tree: Specialized arena-backed maple tree
config: arc-randconfig-r071-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191348.LmT5jL98-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191348.LmT5jL98-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191348.LmT5jL98-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c:112:20: warning: no previous prototype for 'ddebug_arena_alloc' [-Wmissing-prototypes]
     112 | struct maple_node *ddebug_arena_alloc(void *arena, gfp_t gfp)
         |                    ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_resolve_site':
   lib/dynamic_debug.c:408:9: error: implicit declaration of function 'arena_mas_init' [-Werror=implicit-function-declaration]
     408 |         arena_mas_init(&mas, mt, (unsigned long)dp);
         |         ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:409:15: error: implicit declaration of function 'arena_mas_walk' [-Werror=implicit-function-declaration]
     409 |         val = arena_mas_walk(&mas);
         |               ^~~~~~~~~~~~~~
>> lib/dynamic_debug.c:409:13: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     409 |         val = arena_mas_walk(&mas);
         |             ^
   lib/dynamic_debug.c:415:39: error: implicit declaration of function 'arena_mas_prev' [-Werror=implicit-function-declaration]
     415 |                         while ((val = arena_mas_prev(&mas, 0))) {
         |                                       ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:415:37: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     415 |                         while ((val = arena_mas_prev(&mas, 0))) {
         |                                     ^
   lib/dynamic_debug.c: In function 'ddebug_store_tagged_range':
   lib/dynamic_debug.c:474:22: error: implicit declaration of function 'arena_mtree_store_range'; did you mean 'mtree_store_range'? [-Werror=implicit-function-declaration]
     474 |                 rc = arena_mtree_store_range(mt, first, last, (void *)name, GFP_KERNEL);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
         |                      mtree_store_range
   lib/dynamic_debug.c: In function 'ddebug_resolve_range':
   lib/dynamic_debug.c:2310:21: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2310 |                 val = arena_mas_walk(&mas);
         |                     ^
   lib/dynamic_debug.c:2321:21: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2321 |         while ((val = arena_mas_prev(&mas, 0))) {
         |                     ^
   lib/dynamic_debug.c:2336:23: error: implicit declaration of function 'arena_mas_next' [-Werror=implicit-function-declaration]
    2336 |         while ((val = arena_mas_next(&mas, ULONG_MAX))) {
         |                       ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:2336:21: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2336 |         while ((val = arena_mas_next(&mas, ULONG_MAX))) {
         |                     ^
   lib/dynamic_debug.c: In function 'ddebug_shrinker_scan':
   lib/dynamic_debug.c:2429:17: error: implicit declaration of function 'arena___mt_destroy' [-Werror=implicit-function-declaration]
    2429 |                 arena___mt_destroy(&dd_modules_site_map.mt);
         |                 ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c: At top level:
   lib/dynamic_debug.c:2249:13: warning: 'ddebug_drop_all_cached_prefixes' defined but not used [-Wunused-function]
    2249 | static void ddebug_drop_all_cached_prefixes(const struct _ddebug_info *di)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/maple_tree.h:714:17: note: in expansion of macro 'pr_info'
     714 |                 pr_info("Pass: %u Run:%u\n",                            \
         |                 ^~~~~~~
   lib/maple_tree.c:4937:9: note: in expansion of macro 'MAS_WR_BUG_ON'
    4937 |         MAS_WR_BUG_ON(&wr_mas, mas_is_err(mas));
         |         ^~~~~~~~~~~~~
   lib/maple_tree.c: At top level:
   lib/arena_maple_tree.c:36:33: warning: conflicting types for 'arena_mas_destroy'; have 'void(struct ma_state *)'
      36 | #define mas_destroy             arena_mas_destroy
         |                                 ^~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4985:6: note: in expansion of macro 'mas_destroy'
    4985 | void mas_destroy(struct ma_state *mas)
         |      ^~~~~~~~~~~
   lib/arena_maple_tree.c:36:33: note: previous implicit declaration of 'arena_mas_destroy' with type 'void(struct ma_state *)'
      36 | #define mas_destroy             arena_mas_destroy
         |                                 ^~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3825:9: note: in expansion of macro 'mas_destroy'
    3825 |         mas_destroy(mas);
         |         ^~~~~~~~~~~
   lib/maple_tree.c: In function 'arena_mt_find':
   lib/arena_maple_tree.c:64:33: error: 'arena_maple_tree_tests_run' undeclared (first use in this function); did you mean 'maple_tree_tests_run'?
      64 | #define maple_tree_tests_run    arena_maple_tree_tests_run
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:725:21: note: in expansion of macro 'maple_tree_tests_run'
     725 |         atomic_inc(&maple_tree_tests_run);                              \
         |                     ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:6297:21: note: in expansion of macro 'MT_WARN_ON'
    6297 |                 if (MT_WARN_ON(mt, (*index) && ((*index) <= copy)))
         |                     ^~~~~~~~~~
   lib/arena_maple_tree.c:65:33: error: 'arena_maple_tree_tests_passed' undeclared (first use in this function); did you mean 'maple_tree_tests_passed'?
      65 | #define maple_tree_tests_passed arena_maple_tree_tests_passed
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:483:33: note: in expansion of macro 'maple_tree_tests_passed'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:511:26: note: in expansion of macro 'printk_index_wrap'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/maple_tree.h:730:17: note: in expansion of macro 'pr_info'
     730 |                 pr_info("Pass: %u Run:%u\n",                            \
         |                 ^~~~~~~
   lib/maple_tree.c:6297:21: note: in expansion of macro 'MT_WARN_ON'
    6297 |                 if (MT_WARN_ON(mt, (*index) && ((*index) <= copy)))
         |                     ^~~~~~~~~~
   lib/maple_tree.c: At top level:
   lib/arena_maple_tree.c:67:33: warning: conflicting types for 'arena_mt_dump'; have 'void(const struct maple_tree *, enum mt_dump_format)'
      67 | #define mt_dump                 arena_mt_dump
         |                                 ^~~~~~~~~~~~~
   lib/maple_tree.c:6628:6: note: in expansion of macro 'mt_dump'
    6628 | void mt_dump(const struct maple_tree *mt, enum mt_dump_format format)
         |      ^~~~~~~
   lib/arena_maple_tree.c:67:33: note: previous implicit declaration of 'arena_mt_dump' with type 'void(const struct maple_tree *, enum mt_dump_format)'
      67 | #define mt_dump                 arena_mt_dump
         |                                 ^~~~~~~~~~~~~
   include/linux/maple_tree.h:680:17: note: in expansion of macro 'mt_dump'
     680 |                 mt_dump(__tree, mt_dump_hex);                           \
         |                 ^~~~~~~
   lib/maple_tree.c:181:9: note: in expansion of macro 'MT_BUG_ON'
     181 |         MT_BUG_ON(mt, height > MAPLE_HEIGHT_MAX);
         |         ^~~~~~~~~
   lib/arena_maple_tree.c:69:33: warning: conflicting types for 'arena_mas_dump'; have 'void(const struct ma_state *)'
      69 | #define mas_dump                arena_mas_dump
         |                                 ^~~~~~~~~~~~~~
   lib/maple_tree.c:6960:6: note: in expansion of macro 'mas_dump'
    6960 | void mas_dump(const struct ma_state *mas)
         |      ^~~~~~~~
   lib/arena_maple_tree.c:69:33: note: previous implicit declaration of 'arena_mas_dump' with type 'void(const struct ma_state *)'
      69 | #define mas_dump                arena_mas_dump
         |                                 ^~~~~~~~~~~~~~
   include/linux/maple_tree.h:695:17: note: in expansion of macro 'mas_dump'
     695 |                 mas_dump(__mas);                                        \
         |                 ^~~~~~~~
   lib/maple_tree.c:477:9: note: in expansion of macro 'MAS_BUG_ON'
     477 |         MAS_BUG_ON(mas, p_type == maple_dense);
         |         ^~~~~~~~~~
   lib/arena_maple_tree.c:70:33: warning: conflicting types for 'arena_mas_wr_dump'; have 'void(const struct ma_wr_state *)'
      70 | #define mas_wr_dump             arena_mas_wr_dump
         |                                 ^~~~~~~~~~~~~~~~~
   lib/maple_tree.c:7035:6: note: in expansion of macro 'mas_wr_dump'
    7035 | void mas_wr_dump(const struct ma_wr_state *wr_mas)
         |      ^~~~~~~~~~~
   lib/arena_maple_tree.c:70:33: note: previous implicit declaration of 'arena_mas_wr_dump' with type 'void(const struct ma_wr_state *)'
      70 | #define mas_wr_dump             arena_mas_wr_dump
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:711:17: note: in expansion of macro 'mas_wr_dump'
     711 |                 mas_wr_dump(__wrmas);                                   \
         |                 ^~~~~~~~~~~
   lib/maple_tree.c:4857:17: note: in expansion of macro 'MAS_WR_BUG_ON'
    4857 |                 MAS_WR_BUG_ON(&wr_mas, mas_is_err(mas));
         |                 ^~~~~~~~~~~~~
   lib/arena_maple_tree.c: In function 'kmem_cache_alloc_specialized':
   lib/arena_maple_tree.c:151:24: error: implicit declaration of function 'ddebug_arena_alloc' [-Werror=implicit-function-declaration]
     151 |                 return ddebug_arena_alloc(amt->arena, gfp);
         |                        ^~~~~~~~~~~~~~~~~~
>> lib/arena_maple_tree.c:151:24: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     151 |                 return ddebug_arena_alloc(amt->arena, gfp);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/arena_maple_tree.c: In function 'kmem_cache_alloc_from_sheaf_specialized':
   lib/arena_maple_tree.c:183:32: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     183 |                         return ddebug_arena_alloc(amt->arena, gfp);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +409 lib/dynamic_debug.c

   396	
   397	static void ddebug_resolve_site(struct maple_tree *mt, const struct _ddebug *dp,
   398					const char **mod, const char **file, const char **func)
   399	{
   400		struct ma_state mas;
   401		void *val;
   402	
   403		if (mod)  *mod = NULL;
   404		if (file) *file = NULL;
   405		if (func) *func = NULL;
   406	
   407		rcu_read_lock();
   408		arena_mas_init(&mas, mt, (unsigned long)dp);
 > 409		val = arena_mas_walk(&mas);
   410		if (val) {
   411			if (func && (mas.index & DD_KEY_ALIGN_MASK) == DD_KEY_FUNC_ALIGN)
   412				*func = (const char *)val;
   413	
   414			if (mod || file) {
   415				while ((val = arena_mas_prev(&mas, 0))) {
   416					unsigned long rem = mas.index & DD_KEY_ALIGN_MASK;
   417	
   418					if (file && !*file && rem == DD_KEY_FILE_ALIGN) {
   419						*file = (const char *)val;
   420						if (!mod)
   421							break;
   422					} else if (mod && rem == DD_KEY_MOD_ALIGN) {
   423						*mod = (const char *)val;
   424						break;
   425					}
   426				}
   427			}
   428		}
   429		rcu_read_unlock();
   430	
   431		if (mod && !*mod)   *mod = "unknown";
   432		if (file && !*file) *file = "unknown";
   433		if (func && !*func) *func = "unknown";
   434	}
   435	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
