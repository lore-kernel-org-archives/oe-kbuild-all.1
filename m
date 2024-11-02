Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B607F6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 05:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730526982; cv=none; b=Y9BQ+0iwgcBYdyEzuIy9kpTfkv0v8qTR9ZCPWiY+V6Q2GMBMnnq0jn2yG5AUd3PVD4j53a021PrPA/Ss+ferQoWLR6ZAa9Um6uVPF0LMVoQxShXo6xFdYX9OP9laimWFHmY6eQ6SpbQXPX+8Ixhk/j6rD2Xc3c2y01Q3kPCjy1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730526982; c=relaxed/simple;
	bh=P3XNWVwhQztFU8iR+QFhTn0W6cTvC6Q8zvkrtl53jMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdZAJlCsFEyxfvNeLNfQ5Q3ws4PcFnDytUj4or9zG3+OZvlfHxcAwVseuLWmJ/KbOtKDs7788dc9wPQ52AbdKs3R161ZWV9VyRyNsDXarvLs1Lun824f0revg6CQ/ECf0ywWhQ1IFiYTgMJKdV1oeks1w58jEQNi7WSaXYGrD1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0+cDnju; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0+cDnju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730526981; x=1762062981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P3XNWVwhQztFU8iR+QFhTn0W6cTvC6Q8zvkrtl53jMM=;
  b=f0+cDnjuOulM3wyK3T0mnQdTEzajqM3XLQIRt01Wb+glV7Q95MOfAiOL
   Za4a7F6c/AS2pwaqfDU8U/bzmdo4wdQRLCLNyPDu04T4O83DTYFHf0k7C
   YMfQb16cxOL2pWtmhbjJmYSjly/y8JU2w1GqFhmeoFVmZhAgKqy7ycGrC
   jKwL1xHo5PHNPsYjUrUpf5hxxNWJas6/J+cDewNnt/DncOfvo4egWmKEf
   P0zPyVSMsEviYXWsDpnm7YfKVuNBiJok+wj12OqBPEr4G7qcBd3HdVr+W
   tjjldWD1hqdrvk2Fd5LocJ4HCuMlvixXdYruSHNXGAqNXPW9TkaMKdGjM
   g==;
X-CSE-ConnectionGUID: BNWqXbbSQx2slhQuhrHDUg==
X-CSE-MsgGUID: wLo9ktXqRQi9EwFqDnFpZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52857653"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52857653"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 22:56:19 -0700
X-CSE-ConnectionGUID: V/HRJBp3T1edt/xYPRjPRA==
X-CSE-MsgGUID: lwIRn34gQvCs1+7zDlwhQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="83260521"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Nov 2024 22:56:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t777P-000iU5-1v;
	Sat, 02 Nov 2024 05:56:15 +0000
Date: Sat, 2 Nov 2024 13:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 5/5] maple_tree: add a test checking storing null
Message-ID: <202411021343.qtqaL2Km-lkp@intel.com>
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
config: arm64-randconfig-r072-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021343.qtqaL2Km-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021343.qtqaL2Km-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021343.qtqaL2Km-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> lib/test_maple_tree.c:1456:27: error: implicit declaration of function 'mas_root' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
                                    ^
>> lib/test_maple_tree.c:1456:27: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
           MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
                                    ^~~~~~~~~~~~~~
   include/linux/maple_tree.h:625:6: note: expanded from macro 'MT_BUG_ON'
           if (__x) {                                                      \
               ^~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   include/linux/xarray.h:1262:43: note: passing argument to parameter 'entry' here
   static inline bool xa_is_node(const void *entry)
                                             ^
>> lib/test_maple_tree.c:1456:27: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
           MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
                                    ^~~~~~~~~~~~~~
   include/linux/maple_tree.h:625:6: note: expanded from macro 'MT_BUG_ON'
           if (__x) {                                                      \
               ^~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
   include/linux/xarray.h:1262:43: note: passing argument to parameter 'entry' here
   static inline bool xa_is_node(const void *entry)
                                             ^
>> lib/test_maple_tree.c:1456:27: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
           MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
                                    ^~~~~~~~~~~~~~
   include/linux/maple_tree.h:625:6: note: expanded from macro 'MT_BUG_ON'
           if (__x) {                                                      \
               ^~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   include/linux/xarray.h:1262:43: note: passing argument to parameter 'entry' here
   static inline bool xa_is_node(const void *entry)
                                             ^
>> lib/test_maple_tree.c:1456:27: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
           MT_BUG_ON(mt, xa_is_node(mas_root(&mas)));
                                    ^~~~~~~~~~~~~~
   include/linux/maple_tree.h:627:23: note: expanded from macro 'MT_BUG_ON'
                   __func__, __LINE__, __x);                               \
                                       ^~~
   include/linux/printk.h:563:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   include/linux/xarray.h:1262:43: note: passing argument to parameter 'entry' here
   static inline bool xa_is_node(const void *entry)
                                             ^
   lib/test_maple_tree.c:1468:28: error: implicit declaration of function 'mas_root' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           MT_BUG_ON(mt, !xa_is_node(mas_root(&mas)));
                                     ^
   lib/test_maple_tree.c:1468:28: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
           MT_BUG_ON(mt, !xa_is_node(mas_root(&mas)));
                                     ^~~~~~~~~~~~~~
   include/linux/maple_tree.h:625:6: note: expanded from macro 'MT_BUG_ON'
           if (__x) {                                                      \
               ^~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   include/linux/xarray.h:1262:43: note: passing argument to parameter 'entry' here
   static inline bool xa_is_node(const void *entry)
                                             ^
   lib/test_maple_tree.c:1468:28: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
           MT_BUG_ON(mt, !xa_is_node(mas_root(&mas)));
                                     ^~~~~~~~~~~~~~
   include/linux/maple_tree.h:625:6: note: expanded from macro 'MT_BUG_ON'
           if (__x) {                                                      \
               ^~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
   include/linux/xarray.h:1262:43: note: passing argument to parameter 'entry' here
   static inline bool xa_is_node(const void *entry)
                                             ^
   lib/test_maple_tree.c:1468:28: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
           MT_BUG_ON(mt, !xa_is_node(mas_root(&mas)));
                                     ^~~~~~~~~~~~~~
   include/linux/maple_tree.h:625:6: note: expanded from macro 'MT_BUG_ON'
           if (__x) {                                                      \
               ^~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   include/linux/xarray.h:1262:43: note: passing argument to parameter 'entry' here
   static inline bool xa_is_node(const void *entry)
                                             ^
   lib/test_maple_tree.c:1468:28: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
           MT_BUG_ON(mt, !xa_is_node(mas_root(&mas)));
                                     ^~~~~~~~~~~~~~
   include/linux/maple_tree.h:627:23: note: expanded from macro 'MT_BUG_ON'
                   __func__, __LINE__, __x);                               \
                                       ^~~
   include/linux/printk.h:563:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   include/linux/xarray.h:1262:43: note: passing argument to parameter 'entry' here
   static inline bool xa_is_node(const void *entry)
                                             ^
   8 warnings and 2 errors generated.


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
