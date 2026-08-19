Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9893CD8CC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 06:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787119819; cv=none; b=deTZUtPkroNNWXywdv13r0ubcEKg3NC85nrgJsFVgNR3TRMGvmShrH/xKmQtXyeMFkP16rc5wzbUEX0apcidAIvFsdOGcyfMoc4H4S4TlJxi7+N5yMaYK0iWIar6jpX7RpFlrWpoKAsYZKjtY6aRSXKZ8PG2wVYb24FLlafl7nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787119819; c=relaxed/simple;
	bh=cwq42NAna8FvbgrNiaLseTTIJelbPFyhCHkLJ3EuUpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kCkt8wf/DwrMzjBVLeQ/tOuNeO6JgFxxhCcKIzGkBZVKBid/Kee3/mnRK7/JUmt3SDieyIjSoeP/Bi2fGECuIMqOfCYDV73AxozHBYVGqrgivTelluGLYdYcWFo/Cdm6INyqGoSF/ezu5ACyyLarOjJVSYu57WhHP1ysDq6iPnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P288Us6N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P288Us6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787119817; x=1818655817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cwq42NAna8FvbgrNiaLseTTIJelbPFyhCHkLJ3EuUpw=;
  b=P288Us6NaaGFIsZym9OShz1KdsPDqAOTGBqin/34CKPD3lzdghZc2231
   7K5EOVVlVuCugRM6X7MX28AbfN8kb5t2FJfhqfPZlc1vjnTlS80IbG/Hg
   2AcOzFW0ZN5dWLdClTncwwPRxvu0YBUuDu5MfszfyWSt23RZWLihj1+xs
   FEC7Kg6ebpcvCBszZ1UAMHJ5OaQQJBkPH+H2DJgfvI8MiNf1+ggqgw8r8
   qiH4g8LS9Rkv+6Uu/bfhSx8wICZdjoRD/IFRCNJ3Tf0uHillgxXqTSUTd
   GqUREumycfTvf+IHWFdY/PHaS1a27A73wcoij6UQDoCGvS/4Q/HQ6oUqh
   A==;
X-CSE-ConnectionGUID: ir5a3fXlQ4KWKUq/RcHtow==
X-CSE-MsgGUID: MQ7AIsTJRvajhJmBOAAwrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87538587"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87538587"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:09:37 -0700
X-CSE-ConnectionGUID: Vk6RvpSRTXO7d+piMm7Zgg==
X-CSE-MsgGUID: VCwAfeCCQGia23uLEDRt6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269719917"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Aug 2026 23:09:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwZUS-00000000evm-2lmB;
	Wed, 19 Aug 2026 06:09:32 +0000
Date: Wed, 19 Aug 2026 14:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-cached 62/64] lib/dynamic_debug.c:2146:9:
 error: implicit declaration of function 'arena_mas_lock'
Message-ID: <202608191355.jAUUOfC5-lkp@intel.com>
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
config: csky-randconfig-002-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191355.jAUUOfC5-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191355.jAUUOfC5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191355.jAUUOfC5-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   lib/dynamic_debug.c:409:13: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   lib/dynamic_debug.c: In function 'ddebug_module_sites_clear':
>> lib/dynamic_debug.c:2146:9: error: implicit declaration of function 'arena_mas_lock' [-Werror=implicit-function-declaration]
    2146 |         arena_mas_lock(&mas);
         |         ^~~~~~~~~~~~~~
>> lib/dynamic_debug.c:2148:9: error: implicit declaration of function 'arena_mas_erase' [-Werror=implicit-function-declaration]
    2148 |         arena_mas_erase(&mas);
         |         ^~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:2150:9: error: implicit declaration of function 'arena_mas_unlock' [-Werror=implicit-function-declaration]
    2150 |         arena_mas_unlock(&mas);
         |         ^~~~~~~~~~~~~~~~
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
   cc1: some warnings being treated as errors


vim +/arena_mas_lock +2146 lib/dynamic_debug.c

  2131	
  2132	/*
  2133	 * Called in response to a module being unloaded.  Removes
  2134	 * any ddebug_table's which point at the module.
  2135	 */
  2136	static void ddebug_module_sites_clear(struct ddebug_table *dt)
  2137	{
  2138		unsigned long start = (unsigned long) dt->info.descs.start;
  2139		unsigned long end = (unsigned long) &dt->info.descs.start[dt->info.descs.len - 1];
  2140	
  2141		MA_STATE(mas, &dd_modules_site_map.mt, start - DD_KEY_MOD_OFFSET, end);
  2142	
  2143		v2pr_info("clearing %3d debugs of removed module %s\n",
  2144			  dt->info.descs.len, dt->info.mod_name);
  2145	
> 2146		arena_mas_lock(&mas);
  2147		current_ddebug_write_tree = &dd_modules_site_map.mt;
> 2148		arena_mas_erase(&mas);
  2149		current_ddebug_write_tree = NULL;
> 2150		arena_mas_unlock(&mas);
  2151	
  2152		if (dt->compressed_sites) {
  2153			vfree(dt->compressed_sites);
  2154			dt->compressed_sites = NULL;
  2155		}
  2156	}
  2157	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
