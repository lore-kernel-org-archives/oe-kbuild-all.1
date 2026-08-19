Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF793CFF6C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 06:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787120441; cv=none; b=FvBk0s0CMsI9DxveC1O+kzmuIs5QR+RU1KPNfTAjqZakBm1hO1ZA2VQw8sjuQGcazbReXeeg4sypJLy/LKB16T8zVV+zknu500wEnozrDBRPZGToIOjgm1KPrMZIBm9de0mwdqhh2YYs36cj8NVpYvn4pZbEtnLD/vRZ4xMOFB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787120441; c=relaxed/simple;
	bh=awWdr4/HBdT9YL310/9jEycvDOWJIwNU23guunU9Ve8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i3TFssbf/7VFBIUpmsWhsGuecbq/Laa+VKkFPOGgxxHVlneCPXTUz3GvHryxJuxvRyUXkg2Gfqy2K7N1nIB8r1MCEWMpsPkC8gCEmgqjVAkQLsigGpSJl41AWY3z7gR1/471Wl5G0Aq2i0KFI7ByXQ9P6UyivWLd4wdbSb0CWHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGlze7Mk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGlze7Mk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787120440; x=1818656440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awWdr4/HBdT9YL310/9jEycvDOWJIwNU23guunU9Ve8=;
  b=nGlze7MkzqBdc79p4UE7VphzMKZDDjR5TeHsUeCjhs+32RjDs+ug0ni7
   IlnnaQXwahe3lC2JXFEmj5vpjtxWXjLGUzadVgY/zv/+zOSS85wusL9lG
   9GvOS8r5/CRssmiUdf29xqKLV9xxB6tzCcUL+hjKq5CgQEuObU+aDbAjn
   HsRXHOicOkmDTs6tLfqP3lKN2a3/ayVCazamcVngk5B7Lyr6vjuM4dFgf
   6Lac+zvvDIn4GUSUKTVbA8IHEneQOAGPy4dKRVh1e6B+MRvSUUkb3Z9qS
   Z1B3CXpEjlJpq187jYc0BXzJqxuGdOMZLa/bP68S9GaEfbORxuyxZV4B6
   Q==;
X-CSE-ConnectionGUID: EkQJzoRuTqWl3bodQXfoew==
X-CSE-MsgGUID: KdFxot5BSrivhwy0fL88VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="110408910"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="110408910"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:20:38 -0700
X-CSE-ConnectionGUID: cTnHNM28R2iZryLNIqBEdA==
X-CSE-MsgGUID: 5iRTqXsRSLmMnQ5ZC4iPdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="261691507"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Aug 2026 23:20:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwZf7-00000000ewA-0ATb;
	Wed, 19 Aug 2026 06:20:33 +0000
Date: Wed, 19 Aug 2026 14:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-cached 62/64] lib/dynamic_debug.c:2146:2:
 error: call to undeclared function 'arena_mas_lock'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202608191428.AxPChBSW-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191428.AxPChBSW-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191428.AxPChBSW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191428.AxPChBSW-lkp@intel.com/

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
   include/linux/maple_tree.h:384:5: note: 'mtree_store_range' declared here
     384 | int mtree_store_range(struct maple_tree *mt, unsigned long first,
         |     ^
   lib/dynamic_debug.c:477:8: error: call to undeclared function 'arena_mtree_store_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     477 |                 rc = arena_mtree_store_range(mt, addr, addr, (void *)name, GFP_KERNEL);
         |                      ^
   lib/dynamic_debug.c:480:8: error: call to undeclared function 'arena_mtree_store_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     480 |                 rc = arena_mtree_store_range(mt, addr, addr, (void *)name, GFP_KERNEL);
         |                      ^
>> lib/dynamic_debug.c:2146:2: error: call to undeclared function 'arena_mas_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2146 |         arena_mas_lock(&mas);
         |         ^
>> lib/dynamic_debug.c:2148:2: error: call to undeclared function 'arena_mas_erase'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2148 |         arena_mas_erase(&mas);
         |         ^
>> lib/dynamic_debug.c:2150:2: error: call to undeclared function 'arena_mas_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2150 |         arena_mas_unlock(&mas);
         |         ^
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
   include/linux/maple_tree.h:394:6: note: '__mt_destroy' declared here
     394 | void __mt_destroy(struct maple_tree *mt);
         |      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


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
