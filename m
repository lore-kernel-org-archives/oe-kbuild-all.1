Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABB73DDDD0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 23:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331863; cv=none; b=r2z1iOa26hUgJzcUChV73jkAPuwSojrsbMj9tb9K4duXOBtoSBZqcK4Ezr/eY021+3NtAnAPXlsDbxOdoIMtkFOXUxha/0P/o/QEKKcaUVEybL8dokscRP9mlrMrLT8D+LuC4SgRIwXn1P46wLo9RquXwjFCu9oVKgsf77EhhSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331863; c=relaxed/simple;
	bh=h0rVatRu42K1yHYX/ZAB0H1ot2NdUycYvD53PlXl7Os=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V+o15D/qVNGrtt3FilM73mvWSfq5mjuK0n1mxL4TikYFk58h7U1mq9eYiFqHam5JTr5S6EFbK0QfbKqVd4G8iKLIGWNBGG4q/2UCR8j3nUUcHAkRPO51H2pgcOLo3odpRqgxyCl66tlXXKceFMYGCYJ7tPojNUeFfuTaXQEXqXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F12Y7mDE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F12Y7mDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784331859; x=1815867859;
  h=date:from:to:cc:subject:message-id;
  bh=h0rVatRu42K1yHYX/ZAB0H1ot2NdUycYvD53PlXl7Os=;
  b=F12Y7mDEhrEaUdiWOp1/gb+d/ys0x6YQf8r/fnm7XieXycJ8A1mtPrjJ
   uq2xXbz/FFwWWNgTV4mQib08Pk+nt6L5/Tv/Zq7Nonf4mAQrGgKqM6ASc
   rYBkejhZEaSbyCB+ec1KK2XJt8x/iQcG1B+LEi+dijtYA8lBS4l2nhCWg
   ZN5RUl7JqdYCfLFL8sETmXpXVqsoXsV2ZNfobDF1m7oPWiidM1WPVTK7s
   WED7X2qjSfRDZZ6Gub0/h2qj9W+wCCtLqQmnHyckxPLi/hW3DP99b9FJ8
   JuDxNP6mWus/upaBcOC1VKwWKTNIRb5tsyvq2oNPdZuq+5etG46a5JJTX
   A==;
X-CSE-ConnectionGUID: 5YiiLwgvR8qw0ICz0IVhLQ==
X-CSE-MsgGUID: hlim1leWRmuD1rpBcRvKxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="96141548"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="96141548"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 16:44:18 -0700
X-CSE-ConnectionGUID: n1BWoOvGT8O4OSROY/qEeg==
X-CSE-MsgGUID: swxkAw+iQUSXyrV26O9OKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="254281546"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jul 2026 16:44:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wksDs-00000000TFe-1HRf;
	Fri, 17 Jul 2026 23:44:07 +0000
Date: Sat, 18 Jul 2026 07:43:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 net/xfrm/xfrm_state.c:3320:17: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202607180715.2ivHmzKC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   3e53bdbe8bc90023e80d8bdf7a6ab8bf5d13fcc0
commit: f2bc8231fd43a02f9d97252b3435869727054d60 [2/2] xfrm: check all hash buckets for leftover states during netns deletion
config: x86_64-randconfig-r122-20260718 (https://download.01.org/0day-ci/archive/20260718/202607180715.2ivHmzKC-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180715.2ivHmzKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f2bc8231fd43 ("xfrm: check all hash buckets for leftover states during netns deletion")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180715.2ivHmzKC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/xfrm/xfrm_state.c:1737:9: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:1744:17: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:1744:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:1751:17: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:1751:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:1871:17: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:1871:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:1874:17: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:1874:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:2605:25: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:2605:25: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3270:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *state_bydst @@     got struct hlist_head * @@
   net/xfrm/xfrm_state.c:3270:31: sparse:     expected struct hlist_head [noderef] __rcu *state_bydst
   net/xfrm/xfrm_state.c:3270:31: sparse:     got struct hlist_head *
   net/xfrm/xfrm_state.c:3273:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *state_bysrc @@     got struct hlist_head * @@
   net/xfrm/xfrm_state.c:3273:31: sparse:     expected struct hlist_head [noderef] __rcu *state_bysrc
   net/xfrm/xfrm_state.c:3273:31: sparse:     got struct hlist_head *
   net/xfrm/xfrm_state.c:3276:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *state_byspi @@     got struct hlist_head * @@
   net/xfrm/xfrm_state.c:3276:31: sparse:     expected struct hlist_head [noderef] __rcu *state_byspi
   net/xfrm/xfrm_state.c:3276:31: sparse:     got struct hlist_head *
   net/xfrm/xfrm_state.c:3279:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *state_byseq @@     got struct hlist_head * @@
   net/xfrm/xfrm_state.c:3279:31: sparse:     expected struct hlist_head [noderef] __rcu *state_byseq
   net/xfrm/xfrm_state.c:3279:31: sparse:     got struct hlist_head *
   net/xfrm/xfrm_state.c:3297:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_byseq @@
   net/xfrm/xfrm_state.c:3297:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3297:33: sparse:     got struct hlist_head [noderef] __rcu *state_byseq
   net/xfrm/xfrm_state.c:3299:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_byspi @@
   net/xfrm/xfrm_state.c:3299:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3299:33: sparse:     got struct hlist_head [noderef] __rcu *state_byspi
   net/xfrm/xfrm_state.c:3301:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_bysrc @@
   net/xfrm/xfrm_state.c:3301:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3301:33: sparse:     got struct hlist_head [noderef] __rcu *state_bysrc
   net/xfrm/xfrm_state.c:3303:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_bydst @@
   net/xfrm/xfrm_state.c:3303:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3303:33: sparse:     got struct hlist_head [noderef] __rcu *state_bydst
>> net/xfrm/xfrm_state.c:3320:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:3320:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_state.c:3320:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3321:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:3321:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_state.c:3321:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3322:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:3322:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_state.c:3322:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3323:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:3323:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_state.c:3323:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3327:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_byseq @@
   net/xfrm/xfrm_state.c:3327:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3327:33: sparse:     got struct hlist_head [noderef] __rcu *state_byseq
   net/xfrm/xfrm_state.c:3328:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_byspi @@
   net/xfrm/xfrm_state.c:3328:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3328:33: sparse:     got struct hlist_head [noderef] __rcu *state_byspi
   net/xfrm/xfrm_state.c:3329:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_bysrc @@
   net/xfrm/xfrm_state.c:3329:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3329:33: sparse:     got struct hlist_head [noderef] __rcu *state_bysrc
   net/xfrm/xfrm_state.c:3330:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_bydst @@
   net/xfrm/xfrm_state.c:3330:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3330:33: sparse:     got struct hlist_head [noderef] __rcu *state_bydst
   net/xfrm/xfrm_state.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'xfrm_register_type' - unexpected unlock
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'xfrm_unregister_type' - unexpected unlock
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'xfrm_get_type' - unexpected unlock
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'xfrm_register_type_offload' - unexpected unlock
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'xfrm_unregister_type_offload' - unexpected unlock
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'xfrm_set_type_offload' - unexpected unlock
   net/xfrm/xfrm_state.c:934:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:976:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:1655:9: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:1778:9: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:1814:9: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:2094:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:2113:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:2315:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c: note: in included file:
   include/net/xfrm.h:1971:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/net/xfrm.h:1971:16: sparse:    struct sock [noderef] __rcu *
   include/net/xfrm.h:1971:16: sparse:    struct sock *

vim +3320 net/xfrm/xfrm_state.c

  3307	
  3308	void xfrm_state_fini(struct net *net)
  3309	{
  3310		unsigned int sz;
  3311		int i;
  3312	
  3313		flush_work(&net->xfrm.state_hash_work);
  3314		xfrm_state_flush(net, 0, false);
  3315		flush_work(&xfrm_state_gc_work);
  3316	
  3317		WARN_ON(!list_empty(&net->xfrm.state_all));
  3318	
  3319		for (i = 0; i <= net->xfrm.state_hmask; i++) {
> 3320			WARN_ON(!hlist_empty(net->xfrm.state_byseq + i));
  3321			WARN_ON(!hlist_empty(net->xfrm.state_byspi + i));
  3322			WARN_ON(!hlist_empty(net->xfrm.state_bysrc + i));
  3323			WARN_ON(!hlist_empty(net->xfrm.state_bydst + i));
  3324		}
  3325	
  3326		sz = (net->xfrm.state_hmask + 1) * sizeof(struct hlist_head);
  3327		xfrm_hash_free(net->xfrm.state_byseq, sz);
  3328		xfrm_hash_free(net->xfrm.state_byspi, sz);
  3329		xfrm_hash_free(net->xfrm.state_bysrc, sz);
  3330		xfrm_hash_free(net->xfrm.state_bydst, sz);
  3331		free_percpu(net->xfrm.state_cache_input);
  3332	}
  3333	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
