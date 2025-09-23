Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA311B4257
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 19:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758657184; cv=none; b=VehbSP2446evDsr4YaVwzPr0g95BpJls2q5vKo3bReKorbodE75FJlyu1v1xEiUkzyV4pwDBU/PH4GaH37BA5uFx7hO0M6zMjGQLk4d0mcLPFWYUKCazl+pwq7escCXkBAJmYgu5p3mdNHDN2F61Ek58BdOPt48dPTwbg6tOOns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758657184; c=relaxed/simple;
	bh=RC0XE34YIJIRPCdG2U8DxatC5VdczEWr483PDKI8YEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n2Z/4VabjhB3jhcBLKicSpY0D5HRe/VLzHbgVK6tGwPGHes9K9XFU2A0uUhs+9Rd7Tok7hoet2JwNUdrdtbz+GOo68Vj7wQ0tQWC9c8++L5XNPrS9elgGp3t0M60fopNS0F1ApDyJcoWiv+wGAcZFFYzE5zB7xjSQ3JDeOhzYuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeWlVi7j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeWlVi7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758657182; x=1790193182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RC0XE34YIJIRPCdG2U8DxatC5VdczEWr483PDKI8YEw=;
  b=MeWlVi7jkzKOylmYghXtLvp/7KmQykw33Ebdq9MI9Y3qQn71+W3hBqsq
   PpAxCGsAUd5zhpAPcDySUeUMHrjegdav/UuXToNu98pKcuj5l4sWoadTi
   cJ3K+8/XboLyGKujRUNKyBNRVkHvrxB3xyeYO+9ekJ4BYCAOxnXiWXtIZ
   2e9Gd9JEf1ChMWU0gjZ0A34QmfAV5hf1q70POYA2kILyhyTmzGxOjUZie
   zbvC5VG8DvDHDL3hYbkoFCYr+T/HukfXSPU/PoIvKNEorsrXufbu9s5+G
   MHFlCqa5t/gB8YZoAtsffHOpbwb465BHjTIju5X0MHTk2gdns5M8mzYPw
   A==;
X-CSE-ConnectionGUID: 7Yc2Bm3mTnqSqaFo5J9IzQ==
X-CSE-MsgGUID: vzjhsu/pS3W4FVUXE86OVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64587652"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="64587652"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 12:53:00 -0700
X-CSE-ConnectionGUID: BfWH7azbSISLE6Uwf/jrvw==
X-CSE-MsgGUID: bCXVGK99Qo6gkrdNbO26Ww==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2025 12:52:55 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1942-0003U9-17;
	Tue, 23 Sep 2025 19:52:46 +0000
Date: Wed, 24 Sep 2025 03:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 452/452] mm/page_alloc.c:137:40:
 sparse: sparse: restricted gfp_t degrades to integer
Message-ID: <202509240356.wWjtSU0c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   7ca4e1afe288a5ac42351e2b9bb4b5425ac28c06
commit: b9d3d8f1e991052edb89b0537b8f2e8b2aa941ac [452/452] ANDROID: GKI: cma: redirect page allocation to CMA
config: arm-randconfig-r112-20250923 (https://download.01.org/0day-ci/archive/20250924/202509240356.wWjtSU0c-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240356.wWjtSU0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240356.wWjtSU0c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/main.c:1167:28: sparse: sparse: restricted gfp_t degrades to integer
>> init/main.c:1167:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted gfp_t extern [addressable] [toplevel] [usertype] gfp_allowed_mask @@     got unsigned int @@
   init/main.c:1167:26: sparse:     expected restricted gfp_t extern [addressable] [toplevel] [usertype] gfp_allowed_mask
   init/main.c:1167:26: sparse:     got unsigned int
--
   mm/page_alloc.c:106:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
>> mm/page_alloc.c:137:40: sparse: sparse: restricted gfp_t degrades to integer
>> mm/page_alloc.c:137:40: sparse: sparse: restricted gfp_t degrades to integer
>> mm/page_alloc.c:137:40: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t [addressable] [toplevel] [usertype] gfp_allowed_mask @@     got unsigned int @@
   mm/page_alloc.c:137:40: sparse:     expected restricted gfp_t [addressable] [toplevel] [usertype] gfp_allowed_mask
   mm/page_alloc.c:137:40: sparse:     got unsigned int
   mm/page_alloc.c:2741:29: sparse: sparse: Using plain integer as NULL pointer
   mm/page_alloc.c:3252:51: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected int cma @@     got restricted gfp_t @@
   mm/page_alloc.c:3252:51: sparse:     expected int cma
   mm/page_alloc.c:3252:51: sparse:     got restricted gfp_t
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:325:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:325:27: sparse: sparse: restricted gfp_t degrades to integer
--
>> mm/slub.c:1698:13: sparse: sparse: restricted gfp_t degrades to integer
>> mm/slub.c:1698:13: sparse: sparse: restricted gfp_t degrades to integer
>> mm/slub.c:1698:13: sparse: sparse: restricted gfp_t degrades to integer
   mm/slub.c:1699:46: sparse: sparse: restricted gfp_t degrades to integer
   mm/slub.c:1699:46: sparse: sparse: restricted gfp_t degrades to integer
   mm/slub.c:1699:38: sparse: sparse: restricted gfp_t degrades to integer
>> mm/slub.c:1699:44: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t [usertype] invalid_mask @@     got unsigned int @@
   mm/slub.c:1699:44: sparse:     expected restricted gfp_t [usertype] invalid_mask
   mm/slub.c:1699:44: sparse:     got unsigned int
   mm/slub.c:1700:27: sparse: sparse: restricted gfp_t degrades to integer
   mm/slub.c:1700:27: sparse: sparse: restricted gfp_t degrades to integer
>> mm/slub.c:1700:23: sparse: sparse: invalid assignment: &=
   mm/slub.c:1700:23: sparse:    left side has type restricted gfp_t
   mm/slub.c:1700:23: sparse:    right side has type unsigned int
   mm/slub.c:2158:28: sparse: sparse: context imbalance in 'deactivate_slab' - unexpected unlock
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2749:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2749:21: sparse:     got void ***
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2749:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2749:21: sparse:     got unsigned long *
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2749:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2749:21: sparse:     got void ***
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2749:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2749:21: sparse:     got unsigned long *
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2749:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2749:21: sparse:     got void ***
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2749:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2749:21: sparse:     got unsigned long *
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2749:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2749:21: sparse:     got void ***
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2749:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2749:21: sparse:     got unsigned long *
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2856:47: sparse: sparse: context imbalance in '__slab_free' - unexpected unlock
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@

vim +137 mm/page_alloc.c

ab8fabd46f811d5 Johannes Weiner        2012-01-10  135  
1b76b02f15c70d5 Hugh Dickins           2012-05-11  136  int percpu_pagelist_fraction;
dcce284a259373f Benjamin Herrenschmidt 2009-06-18 @137  gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
6471384af2a6530 Alexander Potapenko    2019-07-11  138  #ifdef CONFIG_INIT_ON_ALLOC_DEFAULT_ON
6471384af2a6530 Alexander Potapenko    2019-07-11  139  DEFINE_STATIC_KEY_TRUE(init_on_alloc);
6471384af2a6530 Alexander Potapenko    2019-07-11  140  #else
6471384af2a6530 Alexander Potapenko    2019-07-11  141  DEFINE_STATIC_KEY_FALSE(init_on_alloc);
6471384af2a6530 Alexander Potapenko    2019-07-11  142  #endif
6471384af2a6530 Alexander Potapenko    2019-07-11  143  EXPORT_SYMBOL(init_on_alloc);
6471384af2a6530 Alexander Potapenko    2019-07-11  144  

:::::: The code at line 137 was first introduced by commit
:::::: dcce284a259373f9e5570f2e33f79eca84fcf565 mm: Extend gfp masking to the page allocator

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
