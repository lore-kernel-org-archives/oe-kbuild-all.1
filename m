Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AF36D1A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Dec 2023 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5SqLakZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703163834; x=1734699834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cdFNOqP6V57gVnBNwUefguBenerUq6+P/LsZoDazDWE=;
  b=K5SqLakZqzjPgMAotkNEHmLnx6qBbG8KlYKp7D0EBIVNtsl0/haNucy1
   xq5WvPCwFsUGyrIo08qLE5EgLqXmnY0OnkiROPuOR5HRHt2GDQQK3GwNM
   obSYy7/Nm+X1H/4dTnQuj971EPFeBlMwM9V97HS2d3FingjiMMkQUiO47
   3h6X0sCdWgtJQjHVNxxTuSmOVzrDfZIscsxaL/BcJIPc3K42w31gB/Ru4
   nJeqPko23DF4+f64vwAes57DatkrR8ka14noODikgU6AsUu1dutIm6VQr
   v2UN3CIZCs0YR7c2pQVpDe1euxoF1hLdBAIs2xPFfZJ8nyQicvatnZjSH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="375458764"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="375458764"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:03:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="949922110"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="949922110"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Dec 2023 05:03:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGIiL-0008Ll-2Z;
	Thu, 21 Dec 2023 13:03:49 +0000
Date: Thu, 21 Dec 2023 21:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 5502/28638] mm/page_alloc.c:137:40:
 sparse: sparse: restricted gfp_t degrades to integer
Message-ID: <202312212040.0tDqJbO8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   5ae6be03f52d1e9ea2b821fd5805681b062ea8ca
commit: b9d3d8f1e991052edb89b0537b8f2e8b2aa941ac [5502/28638] ANDROID: GKI: cma: redirect page allocation to CMA
config: arm-randconfig-r131-20231130 (https://download.01.org/0day-ci/archive/20231221/202312212040.0tDqJbO8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231221/202312212040.0tDqJbO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312212040.0tDqJbO8-lkp@intel.com/

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
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] __percpu *__p1 @@     got void *** @@
   mm/slub.c:2749:21: sparse:     expected void **[noderef] __percpu *__p1
   mm/slub.c:2749:21: sparse:     got void ***
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *__p2 @@     got unsigned long * @@
   mm/slub.c:2749:21: sparse:     expected unsigned long [noderef] __percpu *__p2
   mm/slub.c:2749:21: sparse:     got unsigned long *
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] __percpu *__p1 @@     got void *** @@
   mm/slub.c:2749:21: sparse:     expected void **[noderef] __percpu *__p1
   mm/slub.c:2749:21: sparse:     got void ***
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *__p2 @@     got unsigned long * @@
   mm/slub.c:2749:21: sparse:     expected unsigned long [noderef] __percpu *__p2
   mm/slub.c:2749:21: sparse:     got unsigned long *
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] __percpu *__p1 @@     got void *** @@
   mm/slub.c:2749:21: sparse:     expected void **[noderef] __percpu *__p1
   mm/slub.c:2749:21: sparse:     got void ***
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *__p2 @@     got unsigned long * @@
   mm/slub.c:2749:21: sparse:     expected unsigned long [noderef] __percpu *__p2
   mm/slub.c:2749:21: sparse:     got unsigned long *
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] __percpu *__p1 @@     got void *** @@
   mm/slub.c:2749:21: sparse:     expected void **[noderef] __percpu *__p1
   mm/slub.c:2749:21: sparse:     got void ***
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *__p2 @@     got unsigned long * @@
   mm/slub.c:2749:21: sparse:     expected unsigned long [noderef] __percpu *__p2
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
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] __percpu *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] __percpu *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] __percpu *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] __percpu *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] __percpu *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] __percpu *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] __percpu *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] __percpu *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] __percpu *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] __percpu *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] __percpu *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] __percpu *__p2
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
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] __percpu *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] __percpu *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] __percpu *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] __percpu *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] __percpu *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] __percpu *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] __percpu *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] __percpu *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *__p2 @@     got unsigned long * @@
--
   lib/radix-tree.c:275:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *nodes @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:275:36: sparse:     expected struct xa_node *nodes
   lib/radix-tree.c:275:36: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:293:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] __rcu *parent @@     got struct xa_node *parent @@
   lib/radix-tree.c:293:29: sparse:     expected struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:293:29: sparse:     got struct xa_node *parent
   lib/radix-tree.c:353:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] __rcu *parent @@     got struct xa_node *nodes @@
   lib/radix-tree.c:353:38: sparse:     expected struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:353:38: sparse:     got struct xa_node *nodes
   lib/radix-tree.c:455:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] __rcu *parent @@     got struct xa_node *node @@
   lib/radix-tree.c:455:54: sparse:     expected struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:455:54: sparse:     got struct xa_node *node
   lib/radix-tree.c:567:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *parent @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:567:24: sparse:     expected struct xa_node *parent
   lib/radix-tree.c:567:24: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:681:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *[assigned] child @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:681:31: sparse:     expected struct xa_node *[assigned] child
   lib/radix-tree.c:681:31: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:955:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *node @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:955:22: sparse:     expected struct xa_node *node
   lib/radix-tree.c:955:22: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:1015:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *node @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:1015:22: sparse:     expected struct xa_node *node
   lib/radix-tree.c:1015:22: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:1536:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *[assigned] node @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:1536:38: sparse:     expected struct xa_node *[assigned] node
   lib/radix-tree.c:1536:38: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:1596:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *nodes @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:1596:28: sparse:     expected struct xa_node *nodes
   lib/radix-tree.c:1596:28: sparse:     got struct xa_node [noderef] __rcu *parent
>> lib/radix-tree.c:106:34: sparse: sparse: restricted gfp_t degrades to integer
   lib/radix-tree.c:106:52: sparse: sparse: restricted gfp_t degrades to integer
   lib/radix-tree.c:106:20: sparse: sparse: restricted gfp_t degrades to integer
>> lib/radix-tree.c:106:31: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted gfp_t @@     got unsigned int @@
   lib/radix-tree.c:106:31: sparse:     expected restricted gfp_t
   lib/radix-tree.c:106:31: sparse:     got unsigned int

vim +137 mm/page_alloc.c

ab8fabd46f811d Johannes Weiner        2012-01-10  135  
1b76b02f15c70d Hugh Dickins           2012-05-11  136  int percpu_pagelist_fraction;
dcce284a259373 Benjamin Herrenschmidt 2009-06-18 @137  gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
6471384af2a653 Alexander Potapenko    2019-07-11  138  #ifdef CONFIG_INIT_ON_ALLOC_DEFAULT_ON
6471384af2a653 Alexander Potapenko    2019-07-11  139  DEFINE_STATIC_KEY_TRUE(init_on_alloc);
6471384af2a653 Alexander Potapenko    2019-07-11  140  #else
6471384af2a653 Alexander Potapenko    2019-07-11  141  DEFINE_STATIC_KEY_FALSE(init_on_alloc);
6471384af2a653 Alexander Potapenko    2019-07-11  142  #endif
6471384af2a653 Alexander Potapenko    2019-07-11  143  EXPORT_SYMBOL(init_on_alloc);
6471384af2a653 Alexander Potapenko    2019-07-11  144  

:::::: The code at line 137 was first introduced by commit
:::::: dcce284a259373f9e5570f2e33f79eca84fcf565 mm: Extend gfp masking to the page allocator

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
