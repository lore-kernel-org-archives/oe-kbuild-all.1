Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6598F409637
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787127296; cv=none; b=qMw+tPevyiaCCQ2NzTUw618kgidoqL04UWXiJSW6V1eRSLugiY7TvsGBCUD16Xh/C9wb/No9p08uJIOQ0gSX0+qgec+n0/NOQNFpwZd8BXfPR21II+tns3M3v03p9eCDUvnyWQJrWQyerP72rA8lhjuvVr08p20I80zf1qOjdFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787127296; c=relaxed/simple;
	bh=whv+fximHhNFa/Ulbn8NqrrsFGv4jjpGrtLDzOGWMgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MFWeGRsHQvl3AypE4wKsr1YQdCai5PExAqXlU1vBQdHS0ycZTBRLrTys0FLemM+jp0yIM7savyuA7C5NdhS0UDodTZGMK2xNZaEWQP+HnUDnLCa5Ta/0ZbJ4N9qgaIltkZnrE39TjJrjT2T+gDA+GS7AI85DO0rI8EDwjNn5Uxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Whk+sKNY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Whk+sKNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787127286; x=1818663286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=whv+fximHhNFa/Ulbn8NqrrsFGv4jjpGrtLDzOGWMgY=;
  b=Whk+sKNYPtTvugAYDfDPICgX9vIHo/cw7Z2xktCToVB+X/MhSZ0nzR4S
   0aPKszEzIaXGGSR8JZcTUu/gsmn45gc8UEHC/pPHn4iY4WxB19TP19cmY
   lllmqpD+ZKU/hntEM+uP5vY7jcq8jFey8C3m9C/jf6Jg1rCdaai+5dSeb
   Kd+9QyzYhxh3HRxfWJx2M0Fbyjqz5Rzi28O2H8x014dVGR2mXF0pziFYd
   6LXpwvp4btMjd1M7piXTZw5rpYB4b11aPxFHswH5OBNI1mYK49YYeJ6y6
   hgbcJylPf8aEeNs56LOtL9e0lOBEC9AKZRAiWVS8OYs4dsVqEILDIhjl7
   g==;
X-CSE-ConnectionGUID: dTLC2hOpSridmc3JqBkdhg==
X-CSE-MsgGUID: E0o5+DuqQAaW/jKaQ/ru0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98792706"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="98792706"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 01:12:46 -0700
X-CSE-ConnectionGUID: CJTT3uksRvOmEl+vwPRlkA==
X-CSE-MsgGUID: lRNhwp6uS/SVPkGYamuXLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="266090280"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Aug 2026 01:12:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwbPe-00000000ezG-2iQg;
	Wed, 19 Aug 2026 08:12:42 +0000
Date: Wed, 19 Aug 2026 16:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-cached 63/64] lib/dynamic_debug.c:2630:2:
 error: call to undeclared function 'arena_maple_tree_init'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202608191615.NDHZSwWL-lkp@intel.com>
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
config: arm64-randconfig-002-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191615.NDHZSwWL-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191615.NDHZSwWL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191615.NDHZSwWL-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c:112:20: warning: no previous prototype for function 'ddebug_arena_alloc' [-Wmissing-prototypes]
     112 | struct maple_node *ddebug_arena_alloc(void *arena, gfp_t gfp)
         |                    ^
   lib/dynamic_debug.c:112:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     112 | struct maple_node *ddebug_arena_alloc(void *arena, gfp_t gfp)
         | ^
         | static 
   lib/dynamic_debug.c:408:2: error: call to undeclared function 'arena_mas_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     408 |         arena_mas_init(&mas, mt, (unsigned long)dp);
         |         ^
   lib/dynamic_debug.c:409:8: error: call to undeclared function 'arena_mas_walk'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     409 |         val = arena_mas_walk(&mas);
         |               ^
   lib/dynamic_debug.c:409:6: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     409 |         val = arena_mas_walk(&mas);
         |             ^ ~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:415:18: error: call to undeclared function 'arena_mas_prev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     415 |                         while ((val = arena_mas_prev(&mas, 0))) {
         |                                       ^
   lib/dynamic_debug.c:415:16: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     415 |                         while ((val = arena_mas_prev(&mas, 0))) {
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:474:8: error: call to undeclared function 'arena_mtree_store_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     474 |                 rc = arena_mtree_store_range(mt, first, last, (void *)name, GFP_KERNEL);
         |                      ^
   lib/dynamic_debug.c:474:8: note: did you mean 'mtree_store_range'?
   include/linux/maple_tree.h:381:5: note: 'mtree_store_range' declared here
     381 | int mtree_store_range(struct maple_tree *mt, unsigned long first,
         |     ^
   lib/dynamic_debug.c:477:8: error: call to undeclared function 'arena_mtree_store_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     477 |                 rc = arena_mtree_store_range(mt, addr, addr, (void *)name, GFP_KERNEL);
         |                      ^
   lib/dynamic_debug.c:480:8: error: call to undeclared function 'arena_mtree_store_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     480 |                 rc = arena_mtree_store_range(mt, addr, addr, (void *)name, GFP_KERNEL);
         |                      ^
   lib/dynamic_debug.c:2306:2: error: call to undeclared function 'arena_mas_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2306 |         arena_mas_init(&mas, mt, addr);
         |         ^
   lib/dynamic_debug.c:2310:9: error: call to undeclared function 'arena_mas_walk'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2310 |                 val = arena_mas_walk(&mas);
         |                       ^
   lib/dynamic_debug.c:2310:7: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
    2310 |                 val = arena_mas_walk(&mas);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:2321:16: error: call to undeclared function 'arena_mas_prev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2321 |         while ((val = arena_mas_prev(&mas, 0))) {
         |                       ^
   lib/dynamic_debug.c:2321:14: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
    2321 |         while ((val = arena_mas_prev(&mas, 0))) {
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:2336:16: error: call to undeclared function 'arena_mas_next'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2336 |         while ((val = arena_mas_next(&mas, ULONG_MAX))) {
         |                       ^
   lib/dynamic_debug.c:2336:14: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
    2336 |         while ((val = arena_mas_next(&mas, ULONG_MAX))) {
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:2429:3: error: call to undeclared function 'arena___mt_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2429 |                 arena___mt_destroy(&dd_modules_site_map.mt);
         |                 ^
   lib/dynamic_debug.c:2429:3: note: did you mean '__mt_destroy'?
   include/linux/maple_tree.h:391:6: note: '__mt_destroy' declared here
     391 | void __mt_destroy(struct maple_tree *mt);
         |      ^
   lib/dynamic_debug.c:2437:3: error: call to undeclared function 'arena___mt_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2437 |                 arena___mt_destroy(&dd_builtin_site_map.mt);
         |                 ^
>> lib/dynamic_debug.c:2630:2: error: call to undeclared function 'arena_maple_tree_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2630 |         arena_maple_tree_init();
         |         ^
   lib/dynamic_debug.c:2630:2: note: did you mean 'maple_tree_init'?
   include/linux/maple_tree.h:576:6: note: 'maple_tree_init' declared here
     576 | void maple_tree_init(void);
         |      ^
   1 warning and 18 errors generated.


vim +/arena_maple_tree_init +2630 lib/dynamic_debug.c

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
