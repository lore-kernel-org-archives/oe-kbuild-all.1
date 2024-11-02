Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078737F6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 05:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730526321; cv=none; b=AjVR6YLl5jeglf0DAA2gfjnsNzYsc9orJcbznpQrbUlSH/PO7qwOPk9rOd1+w/WZwWAwZyH/UTzVlOpE2LBb1OYXz/agxTCHCF8l+u0obgQZWXAFhx6zCLu4dTODacH699JGcYJ9lVPJWl0VH3QTZDn+Dg6l0ruYRI1Aa5FBRPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730526321; c=relaxed/simple;
	bh=WhbOoM9SSBH6xGjIEnQfpBPsBxCHchwrf7DBrnpNO2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqn2c6kzdEF5IQCxEEWMqo0R1pbbUyY0nkLKkZ32pkH9AlX27i4aMxhzzcbMUIo4y3snVZFyP3KcEduHRjau1fWW54nAbFQdfPvrPNIVPEPPyOyOOuiKKQhoHyYKt91pLfYKYeGXWYekbfSWP1sFKpJ9buqziMmSiMVfYw75OhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoDeNC54; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoDeNC54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730526319; x=1762062319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WhbOoM9SSBH6xGjIEnQfpBPsBxCHchwrf7DBrnpNO2A=;
  b=HoDeNC54a0bR1R/K5VCxewAK3DFXLgbOreeL9UtjkDSnLzU5lzP8JVz7
   atJn2dbL+Q7V8NDk4c1rW2Ov8w/83ok/zA4TkoZ+UzzyXs5zLknOPG+3c
   N5We/++fkU6f4uWljm044SMgfWhEu+Uz4c0JUKL1wahThi3tLW/oi4o+/
   Y0ypDzP1/T9NpLsiolH+bGJ7BRhz1MQx78ez5XKJNLEgQpt41oQyKcbT8
   UkaTexsMUe2n4F+i8/Qat0CUa4q0i5CGofv4lZbtXFnbhfbwJchF/qd/o
   zDfaJm6vcHEoS99ZXTUi217UlRL+Ox+8rwdZsRy7wLB63RApZqawdCd1J
   Q==;
X-CSE-ConnectionGUID: oosqhBB6SeafJjmGEipRFg==
X-CSE-MsgGUID: UqlqwJd0QzGfv5fFMqizXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30060530"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30060530"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 22:45:18 -0700
X-CSE-ConnectionGUID: zRI1ejyuTzG/EgddgLKK0A==
X-CSE-MsgGUID: 3N/SsUikRy+WtpMq6ai1/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="106496613"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Nov 2024 22:45:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t76wl-000iTC-05;
	Sat, 02 Nov 2024 05:45:15 +0000
Date: Sat, 2 Nov 2024 13:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 5/5] maple_tree: add a test checking storing null
Message-ID: <202411021338.ph78FBKg-lkp@intel.com>
References: <20241031231627.14316-6-richard.weiyang@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031231627.14316-6-richard.weiyang@gmail.com>

Hi Wei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.12-rc5 next-20241101]
[cannot apply to akpm-mm/mm-nonmm-unstable]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/maple_tree-print-empty-for-an-empty-tree-on-mt_dump/20241101-071827
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241031231627.14316-6-richard.weiyang%40gmail.com
patch subject: [PATCH v5 5/5] maple_tree: add a test checking storing null
config: m68k-amiga_defconfig (https://download.01.org/0day-ci/archive/20241102/202411021338.ph78FBKg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021338.ph78FBKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021338.ph78FBKg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/test_maple_tree.c: In function 'check_store_null':
   lib/test_maple_tree.c:1456:34: error: implicit declaration of function 'mas_root' [-Werror=implicit-function-declaration]
    1456 |         MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
         |                                  ^~~~~~~~
   lib/test_maple_tree.c:30:13: note: in definition of macro 'MT_BUG_ON'
      30 |         if (__x) {                                                      \
         |             ^~~
>> lib/test_maple_tree.c:1456:34: warning: passing argument 1 of 'xa_is_node' makes pointer from integer without a cast [-Wint-conversion]
    1456 |         MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
         |                                  ^~~~~~~~~~~~~~
         |                                  |
         |                                  int
   lib/test_maple_tree.c:30:13: note: in definition of macro 'MT_BUG_ON'
      30 |         if (__x) {                                                      \
         |             ^~~
   In file included from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/module.h:21,
                    from lib/test_maple_tree.c:11:
   include/linux/xarray.h:1262:43: note: expected 'const void *' but argument is of type 'int'
    1262 | static inline bool xa_is_node(const void *entry)
         |                               ~~~~~~~~~~~~^~~~~
   In file included from include/linux/kernel.h:31,
                    from include/linux/maple_tree.h:11,
                    from lib/test_maple_tree.c:10:
>> lib/test_maple_tree.c:1456:34: warning: passing argument 1 of 'xa_is_node' makes pointer from integer without a cast [-Wint-conversion]
    1456 |         MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
         |                                  ^~~~~~~~~~~~~~
         |                                  |
         |                                  int
   include/linux/printk.h:462:33: note: in definition of macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:563:9: note: in expansion of macro 'printk'
     563 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   lib/test_maple_tree.c:31:17: note: in expansion of macro 'pr_info'
      31 |                 pr_info("BUG at %s:%d (%u)\n",                          \
         |                 ^~~~~~~
   lib/test_maple_tree.c:1456:9: note: in expansion of macro 'MT_BUG_ON'
    1456 |         MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
         |         ^~~~~~~~~
   include/linux/xarray.h:1262:43: note: expected 'const void *' but argument is of type 'int'
    1262 | static inline bool xa_is_node(const void *entry)
         |                               ~~~~~~~~~~~~^~~~~
   lib/test_maple_tree.c:1468:35: warning: passing argument 1 of 'xa_is_node' makes pointer from integer without a cast [-Wint-conversion]
    1468 |         MT_BUG_ON(mt, !xa_is_node(mas_root(&mas)));
         |                                   ^~~~~~~~~~~~~~
         |                                   |
         |                                   int
   lib/test_maple_tree.c:30:13: note: in definition of macro 'MT_BUG_ON'
      30 |         if (__x) {                                                      \
         |             ^~~
   include/linux/xarray.h:1262:43: note: expected 'const void *' but argument is of type 'int'
    1262 | static inline bool xa_is_node(const void *entry)
         |                               ~~~~~~~~~~~~^~~~~
   lib/test_maple_tree.c:1468:35: warning: passing argument 1 of 'xa_is_node' makes pointer from integer without a cast [-Wint-conversion]
    1468 |         MT_BUG_ON(mt, !xa_is_node(mas_root(&mas)));
         |                                   ^~~~~~~~~~~~~~
         |                                   |
         |                                   int
   include/linux/printk.h:462:33: note: in definition of macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:563:9: note: in expansion of macro 'printk'
     563 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   lib/test_maple_tree.c:31:17: note: in expansion of macro 'pr_info'
      31 |                 pr_info("BUG at %s:%d (%u)\n",                          \
         |                 ^~~~~~~
   lib/test_maple_tree.c:1468:9: note: in expansion of macro 'MT_BUG_ON'
    1468 |         MT_BUG_ON(mt, !xa_is_node(mas_root(&mas)));
         |         ^~~~~~~~~
   include/linux/xarray.h:1262:43: note: expected 'const void *' but argument is of type 'int'
    1262 | static inline bool xa_is_node(const void *entry)
         |                               ~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/xa_is_node +1456 lib/test_maple_tree.c

  1389	
  1390	static noinline void __init check_store_null(struct maple_tree *mt)
  1391	{
  1392		MA_STATE(mas, mt, 0, ULONG_MAX);
  1393	
  1394		/*
  1395		 * Store NULL at range [0, ULONG_MAX] to an empty tree should result
  1396		 * in an empty tree
  1397		 */
  1398		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
  1399		mas_lock(&mas);
  1400		mas_store_gfp(&mas, NULL, GFP_KERNEL);
  1401		MT_BUG_ON(mt, !mtree_empty(mt));
  1402		mas_unlock(&mas);
  1403		mtree_destroy(mt);
  1404	
  1405		/*
  1406		 * Store NULL at any range to an empty tree should result in an empty
  1407		 * tree
  1408		 */
  1409		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
  1410		mas_lock(&mas);
  1411		mas_set_range(&mas, 3, 10);
  1412		mas_store_gfp(&mas, NULL, GFP_KERNEL);
  1413		MT_BUG_ON(mt, !mtree_empty(mt));
  1414		mas_unlock(&mas);
  1415		mtree_destroy(mt);
  1416	
  1417		/*
  1418		 * Store NULL at range [0, ULONG_MAX] to a single entry tree should
  1419		 * result in an empty tree
  1420		 */
  1421		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
  1422		mas_lock(&mas);
  1423		mas_set(&mas, 0);
  1424		mas_store_gfp(&mas, &mas, GFP_KERNEL);
  1425		mas_set_range(&mas, 0, ULONG_MAX);
  1426		mas_store_gfp(&mas, NULL, GFP_KERNEL);
  1427		MT_BUG_ON(mt, !mtree_empty(mt));
  1428		mas_unlock(&mas);
  1429		mtree_destroy(mt);
  1430	
  1431		/*
  1432		 * Store NULL at range [0, n] to a single entry tree should
  1433		 * result in an empty tree
  1434		 */
  1435		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
  1436		mas_lock(&mas);
  1437		mas_set(&mas, 0);
  1438		mas_store_gfp(&mas, &mas, GFP_KERNEL);
  1439		mas_set_range(&mas, 0, 5);
  1440		mas_store_gfp(&mas, NULL, GFP_KERNEL);
  1441		MT_BUG_ON(mt, !mtree_empty(mt));
  1442		mas_unlock(&mas);
  1443		mtree_destroy(mt);
  1444	
  1445		/*
  1446		 * Store NULL at range [m, n] where m > 0 to a single entry tree
  1447		 * should still be a single entry tree
  1448		 */
  1449		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
  1450		mas_lock(&mas);
  1451		mas_set(&mas, 0);
  1452		mas_store_gfp(&mas, &mas, GFP_KERNEL);
  1453		mas_set_range(&mas, 2, 5);
  1454		mas_store_gfp(&mas, NULL, GFP_KERNEL);
  1455		MT_BUG_ON(mt, mtree_empty(mt));
> 1456		MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
  1457		mas_unlock(&mas);
  1458		mtree_destroy(mt);
  1459	
  1460		/*
  1461		 * Store NULL at range [0, ULONG_MAX] to a tree with node should
  1462		 * result in an empty tree
  1463		 */
  1464		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
  1465		mas_lock(&mas);
  1466		mas_set_range(&mas, 1, 3);
  1467		mas_store_gfp(&mas, &mas, GFP_KERNEL);
  1468		MT_BUG_ON(mt, !xa_is_node(mas_root(&mas)));
  1469		mas_set_range(&mas, 0, ULONG_MAX);
  1470		mas_store_gfp(&mas, NULL, GFP_KERNEL);
  1471		MT_BUG_ON(mt, !mtree_empty(mt));
  1472		mas_unlock(&mas);
  1473		mtree_destroy(mt);
  1474	}
  1475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
