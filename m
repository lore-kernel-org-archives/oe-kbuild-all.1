Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0112E4257
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 05:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787117677; cv=none; b=D/sDeQdCiPTHIxbrIfD5Q3NXz1TVRjZAqVueG+0pVHJr2UEkPqut4u3cCiP37ubML8i6ExYMY9feExQvZ3WrrVTZb8wIB99z6lVmUcGtE+A0JB1IU2+aQUtIxt909juHBaNjvQCZZmbc7Q/We5GkJ+HAOzp7ByfESDZviYEEeYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787117677; c=relaxed/simple;
	bh=3IPuIlHElkEUx0rkJZ5FnwVXv5MVAFf+auyJNxueZGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pa8P0aQQYnIARRs4CAkkVcJqNLswISejg0bYJjF+LKdjKCDuTYYDeMV8ITszhuLF/96Epw5bTYDPpx7FrvG/UJjNBD7a+vadox/QVrGSnWg6asvob4gBYewLkt7/3b99iVm9VrnuPcHMFHr98AWrsBV5EWMjBiAYQAKQTqgbP1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esrIPn14; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esrIPn14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787117676; x=1818653676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3IPuIlHElkEUx0rkJZ5FnwVXv5MVAFf+auyJNxueZGo=;
  b=esrIPn140KqtksRfXo6CRwoYIW66AK6U9/YVzk8ABxgoVORyxWQ3Vc5U
   v09AmUYUxaITciXTSXsoSaLRpxBVNotuL5KEoR81Ip+EOk1uEhP6jV146
   Y4EMoASSLnJ2RSjDvHTULQYK26TeDsZyxOKKqZloGjrWJlnfUCZvJaJ4S
   zPiTk3rc4FX+YGRkHZF3g2ZYAmkKYhBvFNajr6O0RGPqZYypZw/wWCpmy
   OhX6FSsqh+zn7C8pkYN76LiOdXtocQm8szH9RhFbCUfL0JtDqqsJB6aIM
   WAFhubo6AFK54RAf7qg5zqvcSYWRIgKx/+0QQQUSavGTh+53aFWpl73Dc
   Q==;
X-CSE-ConnectionGUID: 37zD61JFQEK3kFBzZajTLQ==
X-CSE-MsgGUID: h7PqHJs9QT2Iq3YszItbHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87382071"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87382071"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 22:34:35 -0700
X-CSE-ConnectionGUID: XCFOj7VKRhmp3tuhectBLg==
X-CSE-MsgGUID: sXAol5E7TQmskZSX1m9o9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="265004976"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Aug 2026 22:34:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwYwY-00000000euQ-4Awm;
	Wed, 19 Aug 2026 05:34:30 +0000
Date: Wed, 19 Aug 2026 13:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-cached 62/64] lib/arena_maple_tree.c:36:33:
 warning: conflicting types for 'arena_mas_destroy'
Message-ID: <202608191340.3e4wLuSp-lkp@intel.com>
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
config: sparc-randconfig-002-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191340.3e4wLuSp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191340.3e4wLuSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191340.3e4wLuSp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/maple_tree.c: In function 'arena_mas_alloc_cyclic':
   lib/arena_maple_tree.c:30:33: error: implicit declaration of function 'arena_mas_empty_area'; did you mean 'mas_empty_area'? [-Werror=implicit-function-declaration]
    #define mas_empty_area          arena_mas_empty_area
                                    ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3800:8: note: in expansion of macro 'mas_empty_area'
     ret = mas_empty_area(mas, range_lo, range_hi, 1);
           ^~~~~~~~~~~~~~
   lib/arena_maple_tree.c:36:33: error: implicit declaration of function 'arena_mas_destroy'; did you mean 'mas_mat_destroy'? [-Werror=implicit-function-declaration]
    #define mas_destroy             arena_mas_destroy
                                    ^~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3825:2: note: in expansion of macro 'mas_destroy'
     mas_destroy(mas);
     ^~~~~~~~~~~
   lib/maple_tree.c: At top level:
>> lib/arena_maple_tree.c:36:33: warning: conflicting types for 'arena_mas_destroy'
    #define mas_destroy             arena_mas_destroy
                                    ^~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4985:6: note: in expansion of macro 'mas_destroy'
    void mas_destroy(struct ma_state *mas)
         ^~~~~~~~~~~
   lib/arena_maple_tree.c:36:33: note: previous implicit declaration of 'arena_mas_destroy' was here
    #define mas_destroy             arena_mas_destroy
                                    ^~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3825:2: note: in expansion of macro 'mas_destroy'
     mas_destroy(mas);
     ^~~~~~~~~~~
   lib/arena_maple_tree.c: In function 'kmem_cache_alloc_specialized':
   lib/arena_maple_tree.c:151:10: error: implicit declaration of function 'ddebug_arena_alloc'; did you mean 'vm_area_alloc'? [-Werror=implicit-function-declaration]
      return ddebug_arena_alloc(amt->arena, gfp);
             ^~~~~~~~~~~~~~~~~~
             vm_area_alloc
   lib/arena_maple_tree.c:151:10: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
      return ddebug_arena_alloc(amt->arena, gfp);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/arena_maple_tree.c: In function 'kmem_cache_alloc_from_sheaf_specialized':
   lib/arena_maple_tree.c:183:11: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
       return ddebug_arena_alloc(amt->arena, gfp);
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/arena_mas_destroy +36 lib/arena_maple_tree.c

    27	
    28	#define mas_alloc_cyclic        arena_mas_alloc_cyclic
    29	#define mas_walk                arena_mas_walk
    30	#define mas_empty_area          arena_mas_empty_area
    31	#define mas_empty_area_rev      arena_mas_empty_area_rev
    32	#define mas_store               arena_mas_store
    33	#define mas_store_gfp           arena_mas_store_gfp
    34	#define mas_store_prealloc      arena_mas_store_prealloc
    35	#define mas_preallocate         arena_mas_preallocate
  > 36	#define mas_destroy             arena_mas_destroy
    37	#define mas_next                arena_mas_next
    38	#define mas_next_range          arena_mas_next_range
    39	#define mt_next                 arena_mt_next
    40	#define mas_prev                arena_mas_prev
    41	#define mas_prev_range          arena_mas_prev_range
    42	#define mt_prev                 arena_mt_prev
    43	#define mas_pause               arena_mas_pause
    44	#define mas_find                arena_mas_find
    45	#define mas_find_range          arena_mas_find_range
    46	#define mas_find_rev            arena_mas_find_rev
    47	#define mas_find_range_rev      arena_mas_find_range_rev
    48	#define mas_erase               arena_mas_erase
    49	#define mtree_load              arena_mtree_load
    50	#define mtree_store_range       arena_mtree_store_range
    51	#define mtree_store             arena_mtree_store
    52	#define mtree_insert_range      arena_mtree_insert_range
    53	#define mtree_insert            arena_mtree_insert
    54	#define mtree_alloc_range       arena_mtree_alloc_range
    55	#define mtree_alloc_cyclic      arena_mtree_alloc_cyclic
    56	#define mtree_alloc_rrange      arena_mtree_alloc_rrange
    57	#define mtree_erase             arena_mtree_erase
    58	#define __mt_dup                arena___mt_dup
    59	#define mtree_dup               arena_mtree_dup
    60	#define __mt_destroy            arena___mt_destroy
    61	#define mtree_destroy           arena_mtree_destroy
    62	#define mt_find                 arena_mt_find
    63	#define mt_find_after           arena_mt_find_after
    64	#define maple_tree_tests_run    arena_maple_tree_tests_run
    65	#define maple_tree_tests_passed arena_maple_tree_tests_passed
    66	#define mt_cache_shrink         arena_mt_cache_shrink
    67	#define mt_dump                 arena_mt_dump
    68	#define mt_validate             arena_mt_validate
    69	#define mas_dump                arena_mas_dump
    70	#define mas_wr_dump             arena_mas_wr_dump
    71	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
