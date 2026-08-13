Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E440B108
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 18:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786645803; cv=none; b=SIJZ/uQthFFuQGT7AyFeriTW0iyJh+KDJBp45nlbPoECSzFigzyUBi70GbbFK1HbG9gyKFnE4gMd0u1IQHRAZUusQb7z1q90AE6y2hV8jNgVhI72zcgAkocXBhPRwEbeeks34DDuHsugoSORlAwVRGxZdNQw4cv7bkpueIwZ4JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786645803; c=relaxed/simple;
	bh=8/vE4KJQMyjgQ1PAGVbi1D8PypuGDRm9Yq2a71f+IB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NFM3bpw7kzkSUVAG/aJ86Y8UOBL30Jkl2EiIRIUTXE3UjYAyuI+wihqO5UneLRLAzSJymw0VBNfVXPWBlzSAe1Piv5IJn4DBOCbDExo8ncmxYfus6kv2eaBNO2ZTNE6d9PQLcRrcyVD3iI6r8X9d+lWsj5kjyTVaZDJfkTs0KXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zsqs3Wrl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zsqs3Wrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786645801; x=1818181801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8/vE4KJQMyjgQ1PAGVbi1D8PypuGDRm9Yq2a71f+IB4=;
  b=Zsqs3WrlqwlmyGMu+bUyoTHc0YCo7IiR4d9IS7m785Sle3vzIHvrkMZh
   HUXJ5Dxde2QQdcUni/b3XcsSXiqMr+U5QSzHQ1S46k6wtEUEhSSMlRivK
   P53G0m+LKwUvDoVmruSqzUbhTzW43nHbPeChakv1GNoG9ifzhgr+vbU58
   +4EUZkk2Dh3CbzN96fsrDaOPaayq9QMFY46ZtBoUZh7SWt4C9fZ+iiiDc
   YOzTW/z+re1rsCD+9qPYDin8mhPr59+F51La2IIuVuN6LsfIER9bfh0v6
   BPXOgN0pZ5WiK2wyfvtxOfWBPwuypJEoc5Sw3BZ27JYPIdlCyWzJfmV1P
   w==;
X-CSE-ConnectionGUID: kZYJ1DoRStC/q1sze52F7w==
X-CSE-MsgGUID: 6zg5NWZZTra9Q1gOMvik0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87152756"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87152756"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:30:01 -0700
X-CSE-ConnectionGUID: iTpIlL37TIqHF1H0iv+1vA==
X-CSE-MsgGUID: SWXBxCXVRte2uYIoshY+7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="267507809"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Aug 2026 11:29:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuaBh-00000000WC2-0B0T;
	Thu, 13 Aug 2026 18:29:57 +0000
Date: Fri, 14 Aug 2026 02:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:m-4 110/145] lib/arena_maple_tree.c:64:33: error:
 'arena_maple_tree_tests_run' undeclared; did you mean 'maple_tree_tests_run'?
Message-ID: <202608140206.9VMjdSys-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git m-4
head:   0036927f87d51d733bf100cae4e407fa21a2c3a6
commit: 6ab05087d190c22ba7552a134f62250c9539131c [110/145] lib/arena_maple_tree: Specialized arena-backed maple tree
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260814/202608140206.9VMjdSys-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140206.9VMjdSys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140206.9VMjdSys-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/maple_tree.c: In function 'mt_set_height':
>> lib/arena_maple_tree.c:64:33: error: 'arena_maple_tree_tests_run' undeclared (first use in this function); did you mean 'maple_tree_tests_run'?
      64 | #define maple_tree_tests_run    arena_maple_tree_tests_run
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:676:21: note: in expansion of macro 'maple_tree_tests_run'
     676 |         atomic_inc(&maple_tree_tests_run);                              \
         |                     ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:181:9: note: in expansion of macro 'MT_BUG_ON'
     181 |         MT_BUG_ON(mt, height > MAPLE_HEIGHT_MAX);
         |         ^~~~~~~~~
   lib/arena_maple_tree.c:64:33: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/maple_tree.h:676:21: note: in expansion of macro 'maple_tree_tests_run'
     676 |         atomic_inc(&maple_tree_tests_run);                              \
         |                     ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:181:9: note: in expansion of macro 'MT_BUG_ON'
     181 |         MT_BUG_ON(mt, height > MAPLE_HEIGHT_MAX);
         |         ^~~~~~~~~
>> lib/arena_maple_tree.c:67:33: error: implicit declaration of function 'arena_mt_dump' [-Wimplicit-function-declaration]
      67 | #define mt_dump                 arena_mt_dump
         |                                 ^~~~~~~~~~~~~
   include/linux/maple_tree.h:680:17: note: in expansion of macro 'mt_dump'
     680 |                 mt_dump(__tree, mt_dump_hex);                           \
         |                 ^~~~~~~
   lib/maple_tree.c:181:9: note: in expansion of macro 'MT_BUG_ON'
     181 |         MT_BUG_ON(mt, height > MAPLE_HEIGHT_MAX);
         |         ^~~~~~~~~
>> lib/arena_maple_tree.c:65:33: error: 'arena_maple_tree_tests_passed' undeclared (first use in this function); did you mean 'maple_tree_tests_passed'?
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
   include/linux/maple_tree.h:681:17: note: in expansion of macro 'pr_info'
     681 |                 pr_info("Pass: %u Run:%u\n",                            \
         |                 ^~~~~~~
   lib/maple_tree.c:181:9: note: in expansion of macro 'MT_BUG_ON'
     181 |         MT_BUG_ON(mt, height > MAPLE_HEIGHT_MAX);
         |         ^~~~~~~~~
   lib/maple_tree.c: In function 'mas_set_parent':
>> lib/arena_maple_tree.c:64:33: error: 'arena_maple_tree_tests_run' undeclared (first use in this function); did you mean 'maple_tree_tests_run'?
      64 | #define maple_tree_tests_run    arena_maple_tree_tests_run
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:691:21: note: in expansion of macro 'maple_tree_tests_run'
     691 |         atomic_inc(&maple_tree_tests_run);                              \
         |                     ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:477:9: note: in expansion of macro 'MAS_BUG_ON'
     477 |         MAS_BUG_ON(mas, p_type == maple_dense);
         |         ^~~~~~~~~~
>> lib/arena_maple_tree.c:69:33: error: implicit declaration of function 'arena_mas_dump'; did you mean 'arena_mas_nomem'? [-Wimplicit-function-declaration]
      69 | #define mas_dump                arena_mas_dump
         |                                 ^~~~~~~~~~~~~~
   include/linux/maple_tree.h:695:17: note: in expansion of macro 'mas_dump'
     695 |                 mas_dump(__mas);                                        \
         |                 ^~~~~~~~
   lib/maple_tree.c:477:9: note: in expansion of macro 'MAS_BUG_ON'
     477 |         MAS_BUG_ON(mas, p_type == maple_dense);
         |         ^~~~~~~~~~
>> lib/arena_maple_tree.c:65:33: error: 'arena_maple_tree_tests_passed' undeclared (first use in this function); did you mean 'maple_tree_tests_passed'?
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
   include/linux/maple_tree.h:697:17: note: in expansion of macro 'pr_info'
     697 |                 pr_info("Pass: %u Run:%u\n",                            \
         |                 ^~~~~~~
   lib/maple_tree.c:477:9: note: in expansion of macro 'MAS_BUG_ON'
     477 |         MAS_BUG_ON(mas, p_type == maple_dense);
         |         ^~~~~~~~~~
   lib/maple_tree.c: In function 'mas_max_gap':
>> lib/arena_maple_tree.c:64:33: error: 'arena_maple_tree_tests_run' undeclared (first use in this function); did you mean 'maple_tree_tests_run'?
      64 | #define maple_tree_tests_run    arena_maple_tree_tests_run
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:691:21: note: in expansion of macro 'maple_tree_tests_run'
     691 |         atomic_inc(&maple_tree_tests_run);                              \
         |                     ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1442:9: note: in expansion of macro 'MAS_BUG_ON'
    1442 |         MAS_BUG_ON(mas, mt != maple_arange_64);
         |         ^~~~~~~~~~
>> lib/arena_maple_tree.c:65:33: error: 'arena_maple_tree_tests_passed' undeclared (first use in this function); did you mean 'maple_tree_tests_passed'?
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
   include/linux/maple_tree.h:697:17: note: in expansion of macro 'pr_info'
     697 |                 pr_info("Pass: %u Run:%u\n",                            \
         |                 ^~~~~~~
   lib/maple_tree.c:1442:9: note: in expansion of macro 'MAS_BUG_ON'
    1442 |         MAS_BUG_ON(mas, mt != maple_arange_64);
         |         ^~~~~~~~~~
   lib/maple_tree.c: In function 'mas_parent_gap':
>> lib/arena_maple_tree.c:64:33: error: 'arena_maple_tree_tests_run' undeclared (first use in this function); did you mean 'maple_tree_tests_run'?
      64 | #define maple_tree_tests_run    arena_maple_tree_tests_run
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:691:21: note: in expansion of macro 'maple_tree_tests_run'
     691 |         atomic_inc(&maple_tree_tests_run);                              \
         |                     ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1473:9: note: in expansion of macro 'MAS_BUG_ON'
    1473 |         MAS_BUG_ON(mas, pmt != maple_arange_64);
         |         ^~~~~~~~~~
>> lib/arena_maple_tree.c:65:33: error: 'arena_maple_tree_tests_passed' undeclared (first use in this function); did you mean 'maple_tree_tests_passed'?
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
   include/linux/maple_tree.h:697:17: note: in expansion of macro 'pr_info'
     697 |                 pr_info("Pass: %u Run:%u\n",                            \
         |                 ^~~~~~~
   lib/maple_tree.c:1473:9: note: in expansion of macro 'MAS_BUG_ON'
    1473 |         MAS_BUG_ON(mas, pmt != maple_arange_64);
         |         ^~~~~~~~~~
   lib/maple_tree.c: In function 'mas_topiary_replace':
>> lib/arena_maple_tree.c:64:33: error: 'arena_maple_tree_tests_run' undeclared (first use in this function); did you mean 'maple_tree_tests_run'?
      64 | #define maple_tree_tests_run    arena_maple_tree_tests_run
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:742:21: note: in expansion of macro 'maple_tree_tests_run'
     742 |         atomic_inc(&maple_tree_tests_run);                              \
         |                     ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1845:21: note: in expansion of macro 'MAS_WARN_ON'
    1845 |                 if (MAS_WARN_ON(mas, n == 0))
         |                     ^~~~~~~~~~~
>> lib/arena_maple_tree.c:65:33: error: 'arena_maple_tree_tests_passed' undeclared (first use in this function); did you mean 'maple_tree_tests_passed'?
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
   include/linux/maple_tree.h:748:17: note: in expansion of macro 'pr_info'
     748 |                 pr_info("Pass: %u Run:%u\n",                            \
         |                 ^~~~~~~
   lib/maple_tree.c:1845:21: note: in expansion of macro 'MAS_WARN_ON'
    1845 |                 if (MAS_WARN_ON(mas, n == 0))
         |                     ^~~~~~~~~~~
   lib/maple_tree.c: In function 'mas_wr_store_entry':
>> lib/arena_maple_tree.c:64:33: error: 'arena_maple_tree_tests_run' undeclared (first use in this function); did you mean 'maple_tree_tests_run'?
      64 | #define maple_tree_tests_run    arena_maple_tree_tests_run
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:676:21: note: in expansion of macro 'maple_tree_tests_run'
     676 |         atomic_inc(&maple_tree_tests_run);                              \
         |                     ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3549:17: note: in expansion of macro 'MT_BUG_ON'
    3549 |                 MT_BUG_ON(mas->tree, 1);
         |                 ^~~~~~~~~
>> lib/arena_maple_tree.c:65:33: error: 'arena_maple_tree_tests_passed' undeclared (first use in this function); did you mean 'maple_tree_tests_passed'?
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
   include/linux/maple_tree.h:681:17: note: in expansion of macro 'pr_info'
     681 |                 pr_info("Pass: %u Run:%u\n",                            \
         |                 ^~~~~~~
   lib/maple_tree.c:3549:17: note: in expansion of macro 'MT_BUG_ON'
    3549 |                 MT_BUG_ON(mas->tree, 1);
         |                 ^~~~~~~~~
   lib/maple_tree.c: In function 'arena_mas_store':
>> lib/arena_maple_tree.c:64:33: error: 'arena_maple_tree_tests_run' undeclared (first use in this function); did you mean 'maple_tree_tests_run'?
      64 | #define maple_tree_tests_run    arena_maple_tree_tests_run
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:742:21: note: in expansion of macro 'maple_tree_tests_run'
     742 |         atomic_inc(&maple_tree_tests_run);                              \
         |                     ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4836:13: note: in expansion of macro 'MAS_WARN_ON'
    4836 |         if (MAS_WARN_ON(mas, mas->index > mas->last))
         |             ^~~~~~~~~~~
>> lib/arena_maple_tree.c:65:33: error: 'arena_maple_tree_tests_passed' undeclared (first use in this function); did you mean 'maple_tree_tests_passed'?
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
   include/linux/maple_tree.h:748:17: note: in expansion of macro 'pr_info'
     748 |                 pr_info("Pass: %u Run:%u\n",                            \
         |                 ^~~~~~~
   lib/maple_tree.c:4836:13: note: in expansion of macro 'MAS_WARN_ON'
    4836 |         if (MAS_WARN_ON(mas, mas->index > mas->last))
         |             ^~~~~~~~~~~
>> lib/arena_maple_tree.c:70:33: error: implicit declaration of function 'arena_mas_wr_dump'; did you mean 'arena_mas_nomem'? [-Wimplicit-function-declaration]
      70 | #define mas_wr_dump             arena_mas_wr_dump
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:711:17: note: in expansion of macro 'mas_wr_dump'
     711 |                 mas_wr_dump(__wrmas);                                   \
         |                 ^~~~~~~~~~~
   lib/maple_tree.c:4857:17: note: in expansion of macro 'MAS_WR_BUG_ON'
    4857 |                 MAS_WR_BUG_ON(&wr_mas, mas_is_err(mas));
         |                 ^~~~~~~~~~~~~
   lib/maple_tree.c: In function 'arena_mas_store_prealloc':
>> lib/arena_maple_tree.c:64:33: error: 'arena_maple_tree_tests_run' undeclared (first use in this function); did you mean 'maple_tree_tests_run'?
      64 | #define maple_tree_tests_run    arena_maple_tree_tests_run
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:707:21: note: in expansion of macro 'maple_tree_tests_run'
     707 |         atomic_inc(&maple_tree_tests_run);                              \
         |                     ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4937:9: note: in expansion of macro 'MAS_WR_BUG_ON'
    4937 |         MAS_WR_BUG_ON(&wr_mas, mas_is_err(mas));
         |         ^~~~~~~~~~~~~
>> lib/arena_maple_tree.c:65:33: error: 'arena_maple_tree_tests_passed' undeclared (first use in this function); did you mean 'maple_tree_tests_passed'?
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
   include/linux/maple_tree.h:714:17: note: in expansion of macro 'pr_info'
     714 |                 pr_info("Pass: %u Run:%u\n",                            \
         |                 ^~~~~~~
   lib/maple_tree.c:4937:9: note: in expansion of macro 'MAS_WR_BUG_ON'
    4937 |         MAS_WR_BUG_ON(&wr_mas, mas_is_err(mas));
         |         ^~~~~~~~~~~~~
   lib/maple_tree.c: In function 'arena_mt_find':
>> lib/arena_maple_tree.c:64:33: error: 'arena_maple_tree_tests_run' undeclared (first use in this function); did you mean 'maple_tree_tests_run'?
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


vim +64 lib/arena_maple_tree.c

    27	
    28	#define mas_alloc_cyclic        arena_mas_alloc_cyclic
    29	#define mas_walk                arena_mas_walk
    30	#define mas_empty_area          arena_mas_empty_area
    31	#define mas_empty_area_rev      arena_mas_empty_area_rev
    32	#define mas_store               arena_mas_store
    33	#define mas_store_gfp           arena_mas_store_gfp
    34	#define mas_store_prealloc      arena_mas_store_prealloc
    35	#define mas_preallocate         arena_mas_preallocate
    36	#define mas_destroy             arena_mas_destroy
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
  > 64	#define maple_tree_tests_run    arena_maple_tree_tests_run
  > 65	#define maple_tree_tests_passed arena_maple_tree_tests_passed
    66	#define mt_cache_shrink         arena_mt_cache_shrink
  > 67	#define mt_dump                 arena_mt_dump
    68	#define mt_validate             arena_mt_validate
  > 69	#define mas_dump                arena_mas_dump
  > 70	#define mas_wr_dump             arena_mas_wr_dump
    71	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
