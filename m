Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1B3449B21
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787133662; cv=none; b=rVH6E42HE4FlAL+ZbxTWFE19ThKmBRwZTQRLI2zWZEyQrBQTWE489g2i6h+xGjVbX9em6usTE0bDvq+ypgG5EjvIsqHzZ2LugN0OQX34d8QbhZ+yrS+xvwAOM44ZqfKyDsgbRshDg3U/xcd9ofh2QMtDOKcQ+HD5sbN+FkJ9d1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787133662; c=relaxed/simple;
	bh=VadMSQjFvG2utyG6oM4LV2vJvNpiRpFEu2VZwACeQgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UxzbEcsVGEZXWEPnVXB1+bjzIYxZs1zFRCgQsetPzhry2xGuutFyZGT8HfH6tVy1ZJlQ2fupJVbIfOADhe8dyyuTXItLGuOY4i2aC9Nus9Wf+OTu0G9H63t/rIamvZBX0NAj+zbbCcRGQVPuTe28Pf4WN7QvEzqzP3dOnY3RnzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXxZXfyL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXxZXfyL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787133661; x=1818669661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VadMSQjFvG2utyG6oM4LV2vJvNpiRpFEu2VZwACeQgA=;
  b=SXxZXfyLMq37PVjIjP03DWeG/SsWXdyCtxRCrm/cGHZX2kLRRVgXxAOd
   XHhBS9BmB2bbWRjSQzClmpfBUsAtW0MHyO60FYuiEMwZq81jGEkx5dRpf
   HGhsNrUSoyB+3uImmAvLoyRW41o5/IbR5WJ1TljMMMTWlAgdyZQNgkJIX
   /HNz4QbEotyK/CbG/VUSLz97q+5G4Cx/J87daOcQER16dR975A/F4XNKl
   /pLrT7zJ5UYaSQ+yTPC87pQqwPbCV/tKT7rPDeGFjg9q0PLu2J/3J5WxD
   StA/FDA1Ris0Q7sPo2A6w7rJ/kbNxwgMhp+l21y3xLF3HrevDGycO0LLF
   w==;
X-CSE-ConnectionGUID: TzM2MqxMRQ+fNRlbGE02qw==
X-CSE-MsgGUID: Hs4l2nDdTxeQyFufiQi5lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87515890"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87515890"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 03:01:00 -0700
X-CSE-ConnectionGUID: BWwnHARhQbaC2HXbh4i26w==
X-CSE-MsgGUID: H+agqiXOQkm4XnKKWZVwOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269003679"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Aug 2026 03:00:53 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwd6I-00000000f1e-2mWq;
	Wed, 19 Aug 2026 10:00:50 +0000
Date: Wed, 19 Aug 2026 18:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-cached 63/64] lib/dynamic_debug.c:2630:9:
 error: implicit declaration of function 'arena_maple_tree_init'; did you mean
 'maple_tree_init'?
Message-ID: <202608191706.bd8xvLkO-lkp@intel.com>
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
commit: 4acac60938dcd93e79ded0a1601cd5804d915061 [63/64] lib/arena_maple_tree: Fix initialization, alignment, and reclaim bugs
config: sh-randconfig-r133-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191706.bd8xvLkO-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191706.bd8xvLkO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191706.bd8xvLkO-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c:112:20: warning: no previous prototype for 'ddebug_arena_alloc' [-Wmissing-prototypes]
     112 | struct maple_node *ddebug_arena_alloc(void *arena, gfp_t gfp)
         |                    ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_resolve_site':
   lib/dynamic_debug.c:408:9: error: implicit declaration of function 'arena_mas_init' [-Wimplicit-function-declaration]
     408 |         arena_mas_init(&mas, mt, (unsigned long)dp);
         |         ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:409:15: error: implicit declaration of function 'arena_mas_walk' [-Wimplicit-function-declaration]
     409 |         val = arena_mas_walk(&mas);
         |               ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:409:13: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     409 |         val = arena_mas_walk(&mas);
         |             ^
   lib/dynamic_debug.c:415:39: error: implicit declaration of function 'arena_mas_prev' [-Wimplicit-function-declaration]
     415 |                         while ((val = arena_mas_prev(&mas, 0))) {
         |                                       ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:415:37: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     415 |                         while ((val = arena_mas_prev(&mas, 0))) {
         |                                     ^
   lib/dynamic_debug.c: In function 'ddebug_store_tagged_range':
   lib/dynamic_debug.c:474:22: error: implicit declaration of function 'arena_mtree_store_range'; did you mean 'mtree_store_range'? [-Wimplicit-function-declaration]
     474 |                 rc = arena_mtree_store_range(mt, first, last, (void *)name, GFP_KERNEL);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
         |                      mtree_store_range
   lib/dynamic_debug.c: In function 'ddebug_resolve_range':
   lib/dynamic_debug.c:2310:21: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2310 |                 val = arena_mas_walk(&mas);
         |                     ^
   lib/dynamic_debug.c:2321:21: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2321 |         while ((val = arena_mas_prev(&mas, 0))) {
         |                     ^
   lib/dynamic_debug.c:2336:23: error: implicit declaration of function 'arena_mas_next' [-Wimplicit-function-declaration]
    2336 |         while ((val = arena_mas_next(&mas, ULONG_MAX))) {
         |                       ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:2336:21: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2336 |         while ((val = arena_mas_next(&mas, ULONG_MAX))) {
         |                     ^
   lib/dynamic_debug.c: In function 'ddebug_shrinker_scan':
   lib/dynamic_debug.c:2429:17: error: implicit declaration of function 'arena___mt_destroy' [-Wimplicit-function-declaration]
    2429 |                 arena___mt_destroy(&dd_modules_site_map.mt);
         |                 ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c: In function 'dynamic_debug_init':
>> lib/dynamic_debug.c:2630:9: error: implicit declaration of function 'arena_maple_tree_init'; did you mean 'maple_tree_init'? [-Wimplicit-function-declaration]
    2630 |         arena_maple_tree_init();
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         maple_tree_init
   lib/dynamic_debug.c: At top level:
   lib/dynamic_debug.c:2249:13: warning: 'ddebug_drop_all_cached_prefixes' defined but not used [-Wunused-function]
    2249 | static void ddebug_drop_all_cached_prefixes(const struct _ddebug_info *di)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2630 lib/dynamic_debug.c

  2612	
  2613	static int __init dynamic_debug_init(void)
  2614	{
  2615		struct _ddebug *iter, *iter_mod_start;
  2616		int ret, i, mod_sites, mod_ct;
  2617		const char *modname;
  2618		char *cmdline;
  2619	
  2620		struct _ddebug_info di = {
  2621			.descs.start = __start___dyndbg_descs,
  2622			.sites.start = __start___dyndbg_sites,
  2623			.maps.start  = __start___dyndbg_class_maps,
  2624			.users.start = __start___dyndbg_class_users,
  2625			.descs.len = __stop___dyndbg_descs - __start___dyndbg_descs,
  2626			.sites.len = __stop___dyndbg_sites - __start___dyndbg_sites,
  2627			.maps.len  = __stop___dyndbg_class_maps - __start___dyndbg_class_maps,
  2628			.users.len = __stop___dyndbg_class_users - __start___dyndbg_class_users,
  2629		};
> 2630		arena_maple_tree_init();
  2631	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
