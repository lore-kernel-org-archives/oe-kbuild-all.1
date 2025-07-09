Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C9821D59B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 16:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752079136; cv=none; b=Agw8e+nUAFCFIhCroviGUaLiKLfchhopDMrKPU1ocYM9kzWNKHqk21Zp09oJK482UjCZzmlwNWwKG5yDoc8M6Jxd3ga8qlobiIDb46uKpt4jXSj6K5n0NRwOqjluYM2Zqae+4xhsWqxkCrAe8PM45NdgLXyVxWEPxsOgzP9MJZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752079136; c=relaxed/simple;
	bh=c0Yoaq1u5GTcsKPfkwIQ20vU05+byQhVkohxOp5Z+v4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JQZT7AvAXpwl8Cxu55NtU79fD2oWxSN3rSb4Ma6YMTO1asDo/TyGxJ+SCLvbCoW5KA25TAsN6FIRg8iwyzfgtVxXRnuCulJDqvBwpREawqVxBqkPu1tlRURkv8FRhVC6OAwRqCZt9z0AOpwLPO0ztKE8XD4vNHpVVToL6OWyc3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EX919we9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EX919we9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752079133; x=1783615133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c0Yoaq1u5GTcsKPfkwIQ20vU05+byQhVkohxOp5Z+v4=;
  b=EX919we90Lrja5xHWerrpASTlqcvuP+OXRqt9dYgEQp5wLpbnDUnFrf/
   7P3WuzgLrwmfdz7mBMOZ3PraSifAMpuejAEsYtXLVIDC+g8LpKCEmSKyT
   XXPrEqJbG1yDAiuRaADmrcrNh8zAxttcyP857pKTr4PHjbhDnN1P/F5D6
   8Wobu5HCxKIbjf79cOJJexZsgM6Xk8Qa/1jIRdsKW7KlQK//dCzXJwXj1
   DDuM0+UXv8mGHedKjJTaZDHFOb3Myt5kcj8yqbPiYWLUgLYnsPxSm9lZi
   Hqs/SmQC4Dt5D57vmo1i0Gg7azRlBGIZIy7dy11v8JWLrNygnBWz/MFjD
   g==;
X-CSE-ConnectionGUID: uN8EOVH8QvuVPZL3s2t3CQ==
X-CSE-MsgGUID: 9kHJup9CQUuZ0UysNja1Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54441005"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54441005"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 09:38:53 -0700
X-CSE-ConnectionGUID: 3nwmWzyZQGaCn7yc+7jUCA==
X-CSE-MsgGUID: FUckeRRVT0GCaqi+OJhpFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155236466"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2025 09:38:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZXon-0003lV-1B;
	Wed, 09 Jul 2025 16:38:49 +0000
Date: Thu, 10 Jul 2025 00:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 11/16] drivers/pci/p2pdma.c:984:31: error:
 invalid use of undefined type 'struct pci_Dev'
Message-ID: <202507100004.PiQyOHKM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   76398694a39d0be3b1e8a107e4dd025cfd1448fd
commit: 07f78ef067ca643ea92cf0c95e25cd3c40420b03 [11/16] PCI/P2PDMA: Move to higher level PCI device pointer calculation
config: arm64-randconfig-004-20250709 (https://download.01.org/0day-ci/archive/20250710/202507100004.PiQyOHKM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100004.PiQyOHKM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507100004.PiQyOHKM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pci/p2pdma.c:977:28: warning: 'struct pci_Dev' declared inside parameter list will not be visible outside of this definition or declaration
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^~~~~~~
   In file included from include/linux/radix-tree.h:18,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/dma-mapping.h:5,
                    from include/linux/dma-map-ops.h:9,
                    from drivers/pci/p2pdma.c:13:
   drivers/pci/p2pdma.c: In function 'pci_p2pdma_map_type':
>> drivers/pci/p2pdma.c:984:31: error: invalid use of undefined type 'struct pci_Dev'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/rcupdate.h:532:10: note: in definition of macro '__rcu_dereference_check'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |          ^
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:984:11: note: in expansion of macro 'rcu_dereference'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
>> drivers/pci/p2pdma.c:984:31: error: invalid use of undefined type 'struct pci_Dev'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/rcupdate.h:532:31: note: in definition of macro '__rcu_dereference_check'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                               ^
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:984:11: note: in expansion of macro 'rcu_dereference'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
   In file included from <command-line>:
>> drivers/pci/p2pdma.c:984:31: error: invalid use of undefined type 'struct pci_Dev'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
     548 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:532:43: note: in expansion of macro 'READ_ONCE'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                           ^~~~~~~~~
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     680 |  __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:984:11: note: in expansion of macro 'rcu_dereference'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
>> drivers/pci/p2pdma.c:984:31: error: invalid use of undefined type 'struct pci_Dev'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
     548 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:532:43: note: in expansion of macro 'READ_ONCE'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                           ^~~~~~~~~
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     680 |  __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:984:11: note: in expansion of macro 'rcu_dereference'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
>> drivers/pci/p2pdma.c:984:31: error: invalid use of undefined type 'struct pci_Dev'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
     548 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:532:43: note: in expansion of macro 'READ_ONCE'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                           ^~~~~~~~~
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     680 |  __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:984:11: note: in expansion of macro 'rcu_dereference'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
>> drivers/pci/p2pdma.c:984:31: error: invalid use of undefined type 'struct pci_Dev'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
     548 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:532:43: note: in expansion of macro 'READ_ONCE'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                           ^~~~~~~~~
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     680 |  __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:984:11: note: in expansion of macro 'rcu_dereference'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
>> drivers/pci/p2pdma.c:984:31: error: invalid use of undefined type 'struct pci_Dev'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
     548 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:532:43: note: in expansion of macro 'READ_ONCE'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                           ^~~~~~~~~
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     680 |  __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:984:11: note: in expansion of macro 'rcu_dereference'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
>> drivers/pci/p2pdma.c:984:31: error: invalid use of undefined type 'struct pci_Dev'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/compiler_types.h:518:13: note: in definition of macro '__unqual_scalar_typeof'
     518 |   _Generic((x),      \
         |             ^
   include/asm-generic/rwonce.h:50:2: note: in expansion of macro '__READ_ONCE'
      50 |  __READ_ONCE(x);       \
         |  ^~~~~~~~~~~
   include/linux/rcupdate.h:532:43: note: in expansion of macro 'READ_ONCE'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                           ^~~~~~~~~
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     680 |  __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:984:11: note: in expansion of macro 'rcu_dereference'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/rwonce.h:67,
                    from include/linux/compiler.h:390,
                    from include/linux/ctype.h:5,
                    from drivers/pci/p2pdma.c:12:
>> drivers/pci/p2pdma.c:984:31: error: invalid use of undefined type 'struct pci_Dev'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                        ^
   include/linux/rcupdate.h:532:43: note: in expansion of macro 'READ_ONCE'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                           ^~~~~~~~~
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     680 |  __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:984:11: note: in expansion of macro 'rcu_dereference'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
   In file included from include/linux/radix-tree.h:18,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/dma-mapping.h:5,
                    from include/linux/dma-map-ops.h:9,
                    from drivers/pci/p2pdma.c:13:
>> drivers/pci/p2pdma.c:984:31: error: invalid use of undefined type 'struct pci_Dev'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/rcupdate.h:535:12: note: in definition of macro '__rcu_dereference_check'
     535 |  ((typeof(*p) __force __kernel *)(local)); \
         |            ^
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:984:11: note: in expansion of macro 'rcu_dereference'
     984 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
>> drivers/pci/p2pdma.c:992:33: error: passing argument 1 of 'calc_map_type_and_dist' from incompatible pointer type [-Werror=incompatible-pointer-types]
     992 |   return calc_map_type_and_dist(pdev, client, &dist, true);
         |                                 ^~~~
         |                                 |
         |                                 struct pci_Dev *
   drivers/pci/p2pdma.c:584:40: note: expected 'struct pci_dev *' but argument is of type 'struct pci_Dev *'
     584 | calc_map_type_and_dist(struct pci_dev *provider, struct pci_dev *client,
         |                        ~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/pci/p2pdma.c: In function '__pci_p2pdma_update_state':
   drivers/pci/p2pdma.c:1002:18: error: 'client' redeclared as different kind of symbol
    1002 |  struct pci_dev *client;
         |                  ^~~~~~
   drivers/pci/p2pdma.c:998:27: note: previous definition of 'client' was here
     998 |           struct pci_dev *client, struct page *page)
         |           ~~~~~~~~~~~~~~~~^~~~~~
>> drivers/pci/p2pdma.c:1010:35: error: passing argument 1 of 'pci_p2pdma_map_type' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1010 |  state->map = pci_p2pdma_map_type(pdev, client);
         |                                   ^~~~
         |                                   |
         |                                   struct pci_dev *
   drivers/pci/p2pdma.c:977:37: note: expected 'struct pci_Dev *' but argument is of type 'struct pci_dev *'
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                     ~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +984 drivers/pci/p2pdma.c

977196b8c5b20b9 Logan Gunthorpe   2018-10-04   975  
129a3ed0a8932bd Leon Romanovsky   2025-07-07   976  static enum pci_p2pdma_map_type
07f78ef067ca643 Leon Romanovsky   2025-07-07  @977  pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
5d52e1abcd47957 Logan Gunthorpe   2019-08-12   978  {
ae21f835a5bda0e Eric Dumazet      2021-07-01   979  	enum pci_p2pdma_map_type type = PCI_P2PDMA_MAP_NOT_SUPPORTED;
ae21f835a5bda0e Eric Dumazet      2021-07-01   980  	struct pci_p2pdma *p2pdma;
719c98658058f4a Logan Gunthorpe   2022-07-08   981  	int dist;
7e2faa1710c4087 Logan Gunthorpe   2021-06-10   982  
ae21f835a5bda0e Eric Dumazet      2021-07-01   983  	rcu_read_lock();
129a3ed0a8932bd Leon Romanovsky   2025-07-07  @984  	p2pdma = rcu_dereference(pdev->p2pdma);
ae21f835a5bda0e Eric Dumazet      2021-07-01   985  
ae21f835a5bda0e Eric Dumazet      2021-07-01   986  	if (p2pdma)
ae21f835a5bda0e Eric Dumazet      2021-07-01   987  		type = xa_to_value(xa_load(&p2pdma->map_types,
5d52e1abcd47957 Logan Gunthorpe   2019-08-12   988  					   map_types_idx(client)));
ae21f835a5bda0e Eric Dumazet      2021-07-01   989  	rcu_read_unlock();
719c98658058f4a Logan Gunthorpe   2022-07-08   990  
719c98658058f4a Logan Gunthorpe   2022-07-08   991  	if (type == PCI_P2PDMA_MAP_UNKNOWN)
129a3ed0a8932bd Leon Romanovsky   2025-07-07  @992  		return calc_map_type_and_dist(pdev, client, &dist, true);
719c98658058f4a Logan Gunthorpe   2022-07-08   993  
ae21f835a5bda0e Eric Dumazet      2021-07-01   994  	return type;
5d52e1abcd47957 Logan Gunthorpe   2019-08-12   995  }
5d52e1abcd47957 Logan Gunthorpe   2019-08-12   996  
a25e7962db0d798 Christoph Hellwig 2025-05-05   997  void __pci_p2pdma_update_state(struct pci_p2pdma_map_state *state,
07f78ef067ca643 Leon Romanovsky   2025-07-07   998  			       struct pci_dev *client, struct page *page)
5e180ff326b43bd Logan Gunthorpe   2022-07-08   999  {
129a3ed0a8932bd Leon Romanovsky   2025-07-07  1000  	struct pci_p2pdma_pagemap *p2p_pgmap = to_p2p_pgmap(page_pgmap(page));
07f78ef067ca643 Leon Romanovsky   2025-07-07  1001  	struct pci_dev *pdev = to_pci_dev(p2p_pgmap->mem.owner);
07f78ef067ca643 Leon Romanovsky   2025-07-07  1002  	struct pci_dev *client;
07f78ef067ca643 Leon Romanovsky   2025-07-07  1003  
07f78ef067ca643 Leon Romanovsky   2025-07-07  1004  	if (!pdev->p2pdma) {
07f78ef067ca643 Leon Romanovsky   2025-07-07  1005  		state->map = PCI_P2PDMA_MAP_NOT_SUPPORTED;
07f78ef067ca643 Leon Romanovsky   2025-07-07  1006  		return;
07f78ef067ca643 Leon Romanovsky   2025-07-07  1007  	}
129a3ed0a8932bd Leon Romanovsky   2025-07-07  1008  
129a3ed0a8932bd Leon Romanovsky   2025-07-07  1009  	state->mem = &p2p_pgmap->mem;
07f78ef067ca643 Leon Romanovsky   2025-07-07 @1010  	state->map = pci_p2pdma_map_type(pdev, client);
5e180ff326b43bd Logan Gunthorpe   2022-07-08  1011  }
5e180ff326b43bd Logan Gunthorpe   2022-07-08  1012  

:::::: The code at line 984 was first introduced by commit
:::::: 129a3ed0a8932bd3f53853e87d2c0d3b50516d34 PCI/P2PDMA: Split out the information about the providing device from pgmap

:::::: TO: Leon Romanovsky <leonro@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
