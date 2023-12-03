Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D9375
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2hI+ryt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585169; x=1733121169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EriKYhtq3TpLCS+rrxOyypBQ3RFGHM7XbNecginLYZ0=;
  b=O2hI+rytaXgO7F/vQmhxqaLQHd1Hbpr4wfwrlZ5ayhU+cJGxbCyhrM+6
   JegQmtCIQnw37zYSC33DSzoddn6QBEFFqiryZBtXAwMD2x2A2gjf7HuLO
   TeleKOl+qiPaAW/10d2Wi8pNBXzXV8SK2LEPvtuk4Ft08hxtWczpnLNn3
   ATPkjxHhvE+f8m6nRS0bwW2jr06l0abytho6wYfXzsQ9qbrgyNdqlCjJw
   w0hUp8W1D44dKl7kvTTVugYEXKznsK2R/FkNqcPQaXBbsh4wvv5vb0X3F
   A426F3Re6zPjv3Mx5fXByxC12nrwVFEt8bujL5mhm/GjAq7iFFkR7xnU0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180402"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180402"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="914081643"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="914081643"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 22:32:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006LP-1E;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 5502/28619] mm/page_alloc.c:137:40:
 sparse: sparse: restricted gfp_t degrades to integer
Message-ID: <202312031228.BT39a5BB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   b7ba0d931efd5d4229257d103e47f5319e8ee80c
commit: b9d3d8f1e991052edb89b0537b8f2e8b2aa941ac [5502/28619] ANDROID: GKI: cma: redirect page allocation to CMA
config: arm-randconfig-r131-20231130 (https://download.01.org/0day-ci/archive/20231203/202312031228.BT39a5BB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031228.BT39a5BB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312031228.BT39a5BB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/main.c:1167:28: sparse: sparse: restricted gfp_t degrades to integer
>> init/main.c:1167:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted gfp_t extern [addressable] [toplevel] [usertype] gfp_allowed_mask @@     got unsigned int @@
   init/main.c:1167:26: sparse:     expected restricted gfp_t extern [addressable] [toplevel] [usertype] gfp_allowed_mask
   init/main.c:1167:26: sparse:     got unsigned int
--
   mm/page_alloc.c:106:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
   mm/page_alloc.c:107:1: sparse: sparse: symbol '__pcpu_scope_pcpu_drain' was not declared. Should it be static?
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
>> mm/slub.c:1700:23: sparse:    left side has type restricted gfp_t
>> mm/slub.c:1700:23: sparse:    right side has type unsigned int
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
   mm/slub.c:2749:21: sparse: sparse: self-comparison always evaluates to false
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
   mm/slub.c:2992:21: sparse: sparse: self-comparison always evaluates to false
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
--
   lib/radix-tree.c:275:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *nodes @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:275:36: sparse:     expected struct xa_node *nodes
   lib/radix-tree.c:275:36: sparse:     got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:293:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] <asn:4> *parent @@     got struct xa_node *parent @@
   lib/radix-tree.c:293:29: sparse:     expected struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:293:29: sparse:     got struct xa_node *parent
   lib/radix-tree.c:353:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] <asn:4> *parent @@     got struct xa_node *nodes @@
   lib/radix-tree.c:353:38: sparse:     expected struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:353:38: sparse:     got struct xa_node *nodes
   lib/radix-tree.c:455:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] <asn:4> *parent @@     got struct xa_node *node @@
   lib/radix-tree.c:455:54: sparse:     expected struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:455:54: sparse:     got struct xa_node *node
   lib/radix-tree.c:567:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *parent @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:567:24: sparse:     expected struct xa_node *parent
   lib/radix-tree.c:567:24: sparse:     got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:681:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *[assigned] child @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:681:31: sparse:     expected struct xa_node *[assigned] child
   lib/radix-tree.c:681:31: sparse:     got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:955:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *node @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:955:22: sparse:     expected struct xa_node *node
   lib/radix-tree.c:955:22: sparse:     got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:1015:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *node @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:1015:22: sparse:     expected struct xa_node *node
   lib/radix-tree.c:1015:22: sparse:     got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:1536:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *[assigned] node @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:1536:38: sparse:     expected struct xa_node *[assigned] node
   lib/radix-tree.c:1536:38: sparse:     got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:1596:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *nodes @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:1596:28: sparse:     expected struct xa_node *nodes
   lib/radix-tree.c:1596:28: sparse:     got struct xa_node [noderef] <asn:4> *parent
>> lib/radix-tree.c:106:34: sparse: sparse: restricted gfp_t degrades to integer
   lib/radix-tree.c:106:52: sparse: sparse: restricted gfp_t degrades to integer
   lib/radix-tree.c:106:20: sparse: sparse: restricted gfp_t degrades to integer
>> lib/radix-tree.c:106:31: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted gfp_t @@     got unsigned int @@
   lib/radix-tree.c:106:31: sparse:     expected restricted gfp_t
   lib/radix-tree.c:106:31: sparse:     got unsigned int

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
