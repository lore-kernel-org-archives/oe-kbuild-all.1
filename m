Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AEE4B5C1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 05:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730523743; cv=none; b=s6ULHDr3XW7O7yRXbMeVTHmQEaEAe7wD7dDlAC+PvVXj76XDzudsY+6DzT+yoqdpSIa4SULzqJJRivAbOblAePwdahKvcgE0j/iNVxc1PwmOoiKdG5hYMObYf9SmTSTtsBv4irYhqDx0RrkE5VwMluo+orFJDyIMftpoSM8iwEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730523743; c=relaxed/simple;
	bh=JC/Kq/rxLGJG8aclxrPStdmznoa9UIo4R5yubctWrBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQ/mCY0a5taEx+AiN5GW0a2Am3ynBpUz5Mmm9ELBJnrMopATnWdAANydyAJ7jvuLFJmsuHl7KF2khpdA8SqgfUmn+zoFbLfQvhpKcRZJ3326cXJIqW2SvPt77+DMtpusDT68x4IkMYj8CLROh0Ssyrzd1jmXGj/10gts/ALYqBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VE24zbz4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VE24zbz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730523740; x=1762059740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JC/Kq/rxLGJG8aclxrPStdmznoa9UIo4R5yubctWrBg=;
  b=VE24zbz4RCuOMkgXAW2XfBmD5ZWPuksKpLjGCjQ8EmajbV21XEy9Bx+s
   UFXuQkrIZrhqXHRWa1KmHH06kn9GpLzobleNAlD+A84KoIJQNJN09NMdG
   JHMlcexwHtBAeOxvl+WagFLbsOzOJ5D/2eRZjxrTqnyK4pPxbtUkVjxkl
   2qddAO0y2HFAKVxfOcomMYJX1PMZsnO/VFvhxOV7bpjJiUFDlBw35iF3m
   4EAiUMyBYR4gOxJiyMPmQhVtV0czT+zvpzZzSAGd4gkkEjytvO30/qGHQ
   n+l1L5ShLsYhi+4Grzd7SuKeZiXXW5c7gDjpkt/xImSST7jXOYRBbRXWm
   w==;
X-CSE-ConnectionGUID: FWYZC/+tSgqnW3qDgaPjnA==
X-CSE-MsgGUID: +eqNe+f/S6OUyFGU0+zALw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="55684079"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="55684079"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 22:02:17 -0700
X-CSE-ConnectionGUID: Va2B0+KtTCS3zd2ozIs8Hw==
X-CSE-MsgGUID: VOvstdEGT5WIU67l+DkhKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="82680848"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2024 22:02:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t76H7-000iRN-3C;
	Sat, 02 Nov 2024 05:02:13 +0000
Date: Sat, 2 Nov 2024 13:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 5/5] maple_tree: add a test checking storing null
Message-ID: <202411021212.6YBlFaZ5-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.12-rc5 next-20241101]
[cannot apply to akpm-mm/mm-nonmm-unstable]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/maple_tree-print-empty-for-an-empty-tree-on-mt_dump/20241101-071827
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241031231627.14316-6-richard.weiyang%40gmail.com
patch subject: [PATCH v5 5/5] maple_tree: add a test checking storing null
config: arm-randconfig-002-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021212.6YBlFaZ5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021212.6YBlFaZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021212.6YBlFaZ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_maple_tree.c:10:
   lib/test_maple_tree.c: In function 'check_store_null':
>> lib/test_maple_tree.c:1456:34: error: implicit declaration of function 'mas_root' [-Wimplicit-function-declaration]
    1456 |         MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
         |                                  ^~~~~~~~
   include/linux/maple_tree.h:625:13: note: in definition of macro 'MT_BUG_ON'
     625 |         if (__x) {                                                      \
         |             ^~~
>> lib/test_maple_tree.c:1456:34: error: passing argument 1 of 'xa_is_node' makes pointer from integer without a cast [-Wint-conversion]
    1456 |         MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
         |                                  ^~~~~~~~~~~~~~
         |                                  |
         |                                  int
   include/linux/maple_tree.h:625:13: note: in definition of macro 'MT_BUG_ON'
     625 |         if (__x) {                                                      \
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
                    from include/linux/maple_tree.h:11:
>> lib/test_maple_tree.c:1456:34: error: passing argument 1 of 'xa_is_node' makes pointer from integer without a cast [-Wint-conversion]
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
   include/linux/maple_tree.h:626:17: note: in expansion of macro 'pr_info'
     626 |                 pr_info("BUG at %s:%d (%u)\n",                          \
         |                 ^~~~~~~
   lib/test_maple_tree.c:1456:9: note: in expansion of macro 'MT_BUG_ON'
    1456 |         MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
         |         ^~~~~~~~~
   include/linux/xarray.h:1262:43: note: expected 'const void *' but argument is of type 'int'
    1262 | static inline bool xa_is_node(const void *entry)
         |                               ~~~~~~~~~~~~^~~~~
   lib/test_maple_tree.c:1468:35: error: passing argument 1 of 'xa_is_node' makes pointer from integer without a cast [-Wint-conversion]
    1468 |         MT_BUG_ON(mt, !xa_is_node(mas_root(&mas)));
         |                                   ^~~~~~~~~~~~~~
         |                                   |
         |                                   int
   include/linux/maple_tree.h:625:13: note: in definition of macro 'MT_BUG_ON'
     625 |         if (__x) {                                                      \
         |             ^~~
   include/linux/xarray.h:1262:43: note: expected 'const void *' but argument is of type 'int'
    1262 | static inline bool xa_is_node(const void *entry)
         |                               ~~~~~~~~~~~~^~~~~
   lib/test_maple_tree.c:1468:35: error: passing argument 1 of 'xa_is_node' makes pointer from integer without a cast [-Wint-conversion]
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
   include/linux/maple_tree.h:626:17: note: in expansion of macro 'pr_info'
     626 |                 pr_info("BUG at %s:%d (%u)\n",                          \
         |                 ^~~~~~~
   lib/test_maple_tree.c:1468:9: note: in expansion of macro 'MT_BUG_ON'
    1468 |         MT_BUG_ON(mt, !xa_is_node(mas_root(&mas)));
         |         ^~~~~~~~~
   include/linux/xarray.h:1262:43: note: expected 'const void *' but argument is of type 'int'
    1262 | static inline bool xa_is_node(const void *entry)
         |                               ~~~~~~~~~~~~^~~~~


vim +/mas_root +1456 lib/test_maple_tree.c

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
