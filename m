Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216F8219303
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Apr 2026 01:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776907468; cv=none; b=E1VfSBYNgBVSEgcTjnHOCzOvfJoxEWZP+EZNZLDQSr3wa7UEHZO6rx9NHnt1S0Ze2wMMNy4QkieRwnYRsYp/oN0QYcBn0R/K6IY0uVoJcaau1sD3KM78R6J3ALnoBiQYpUYw4Ad4HFWSyt1Tpn+naqFVl6v9UEPL5POweUDnfEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776907468; c=relaxed/simple;
	bh=Qg8kfdC2YqlvvfcQ5UUCKXs6TIBRYVP83K+x329AGgQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FTk0mlXO9oC3TxnjMOmEKwwUhrSbcZYhXDQa8BUUoND9zCiP0nQd4GHzeCeDfAwcar5TxFV8iVeE3griyVm353+I13KjqsMSNQmrDkhrtJ5h5/YMIbtzUsF9Wgec+lpHcHs0Gv7RjG8FmmRuXwpXchFU9+LOBE+A2r7tg5KKJ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6rUuJoG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6rUuJoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776907466; x=1808443466;
  h=date:from:to:cc:subject:message-id;
  bh=Qg8kfdC2YqlvvfcQ5UUCKXs6TIBRYVP83K+x329AGgQ=;
  b=T6rUuJoGLptNxdHxx3hrhPAGJoUlWlaY3oUZKVtNWgASNlwjn1XcC5ED
   YeS1w5eSmdlG8W49bnHBPbhJnwB7bL2Ly5NgcP26lizFY4JE01ZhSHx6U
   0v3eF7xzFcE0Ng/PhlA+1aiA8VQB8JWPYHUhvtF/gT2ifUpdm94jhEdCP
   0ok2WIITGU/9S81SNi7qqsDxt2doi/uEZC26LZGz+ULTrUs5+N1s7pJ91
   Vqm0RhBYcwERw2FB5GNcGLoyQbf09EjOVBFPcz2+zp6SXLEkjhb+QOmLl
   d5W314kEYvHpGA46qllEBuI5JLm0T2BuWjSIWPTmtyoqlnLcV8Xbtsle7
   g==;
X-CSE-ConnectionGUID: 1MHu1YDjTUW6J3lJXljhTA==
X-CSE-MsgGUID: bFY6dtmPRXqetnXnudb9zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="95283525"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="95283525"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 18:24:25 -0700
X-CSE-ConnectionGUID: 2I7ToBE4R9eNSaudlFfqSw==
X-CSE-MsgGUID: Go2hTYKYQkyo6RJhX95m0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="231460920"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Apr 2026 18:24:23 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFink-000000001JB-3BMi;
	Thu, 23 Apr 2026 01:24:20 +0000
Date: Thu, 23 Apr 2026 09:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 102/102]
 drivers/iommu/iommu-sva.c:38:13: error: invalid application of 'sizeof' to an
 incomplete type 'typeof(struct iommu_mm_data)' (aka 'struct iommu_mm_data')
Message-ID: <202604230922.csU7IS2D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   2cf4004c82d9d85577ef14a90726cf55b5931f6a
commit: 00b31fa2fc0f10171920d7fb6aa4ebfc36eebbfe [102/102] Merge 8934827db540 ("Merge tag 'kmalloc_obj-treewide-v7.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux") into android-mainline
config: i386-randconfig-r052-20260423 (https://download.01.org/0day-ci/archive/20260423/202604230922.csU7IS2D-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230922.csU7IS2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604230922.csU7IS2D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-sva.c:9:
   include/linux/iommu.h:1627:17: error: incomplete definition of type 'struct iommu_mm_data'
    1627 |         return iommu_mm->pasid;
         |                ~~~~~~~~^
   include/linux/mm_types.h:1122:8: note: forward declaration of 'struct iommu_mm_data'
    1122 | struct iommu_mm_data;
         |        ^
   In file included from drivers/iommu/iommu-sva.c:11:
   drivers/iommu/iommu-priv.h:19:19: error: incomplete definition of type 'struct dev_iommu'
      19 |         return dev->iommu->iommu_dev->ops;
         |                ~~~~~~~~~~^
   include/linux/device.h:47:8: note: forward declaration of 'struct dev_iommu'
      47 | struct dev_iommu;
         |        ^
   In file included from drivers/iommu/iommu-sva.c:11:
   drivers/iommu/iommu-priv.h:28:48: error: no member named 'iommu_fwnode' in 'struct iommu_fwspec'
      28 |         return iommu_ops_from_fwnode(fwspec ? fwspec->iommu_fwnode : NULL);
         |                                               ~~~~~~  ^
   drivers/iommu/iommu-sva.c:33:15: error: incomplete definition of type 'struct iommu_mm_data'
      33 |                 if (iommu_mm->pasid >= dev->iommu->max_pasids)
         |                     ~~~~~~~~^
   include/linux/mm_types.h:1122:8: note: forward declaration of 'struct iommu_mm_data'
    1122 | struct iommu_mm_data;
         |        ^
   drivers/iommu/iommu-sva.c:33:36: error: incomplete definition of type 'struct dev_iommu'
      33 |                 if (iommu_mm->pasid >= dev->iommu->max_pasids)
         |                                        ~~~~~~~~~~^
   include/linux/device.h:47:8: note: forward declaration of 'struct dev_iommu'
      47 | struct dev_iommu;
         |        ^
>> drivers/iommu/iommu-sva.c:38:13: error: invalid application of 'sizeof' to an incomplete type 'typeof(struct iommu_mm_data)' (aka 'struct iommu_mm_data')
      38 |         iommu_mm = kzalloc_obj(struct iommu_mm_data, GFP_KERNEL);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1056:2: note: expanded from macro 'kzalloc_obj'
    1056 |         __alloc_objs(kzalloc, GFP, typeof(P), 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:985:37: note: expanded from macro '__alloc_objs'
     985 |         const size_t __obj_size = size_mul(sizeof(TYPE), COUNT);        \
         |                                            ^     ~~~~~~
   include/linux/mm_types.h:1122:8: note: forward declaration of 'struct iommu_mm_data'
    1122 | struct iommu_mm_data;
         |        ^
   drivers/iommu/iommu-sva.c:47:10: error: incomplete definition of type 'struct iommu_mm_data'
      47 |         iommu_mm->pasid = pasid;
         |         ~~~~~~~~^
   include/linux/mm_types.h:1122:8: note: forward declaration of 'struct iommu_mm_data'
    1122 | struct iommu_mm_data;
         |        ^
   drivers/iommu/iommu-sva.c:48:10: error: incomplete definition of type 'struct iommu_mm_data'
      48 |         iommu_mm->mm = mm;
         |         ~~~~~~~~^
   include/linux/mm_types.h:1122:8: note: forward declaration of 'struct iommu_mm_data'
    1122 | struct iommu_mm_data;
         |        ^
   drivers/iommu/iommu-sva.c:49:26: error: incomplete definition of type 'struct iommu_mm_data'
      49 |         INIT_LIST_HEAD(&iommu_mm->sva_domains);
         |                         ~~~~~~~~^
   include/linux/mm_types.h:1122:8: note: forward declaration of 'struct iommu_mm_data'
    1122 | struct iommu_mm_data;
         |        ^
   drivers/iommu/iommu-sva.c:94:57: error: incomplete definition of type 'struct iommu_mm_data'
      94 |         attach_handle = iommu_attach_handle_get(group, iommu_mm->pasid, IOMMU_DOMAIN_SVA);
         |                                                        ~~~~~~~~^
   include/linux/mm_types.h:1122:8: note: forward declaration of 'struct iommu_mm_data'
    1122 | struct iommu_mm_data;
         |        ^
   drivers/iommu/iommu-sva.c:96:12: error: incomplete definition of type 'struct iommu_sva'
      96 |                 handle = container_of(attach_handle, struct iommu_sva, handle);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:21:47: note: expanded from macro 'container_of'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
      22 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:74: note: expanded from macro '__same_type'
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/iommu.h:43:8: note: forward declaration of 'struct iommu_sva'
      43 | struct iommu_sva;
         |        ^
   drivers/iommu/iommu-sva.c:96:12: error: offsetof of incomplete type 'struct iommu_sva'
      96 |                 handle = container_of(attach_handle, struct iommu_sva, handle);
         |                          ^                           ~~~~~~
   include/linux/container_of.h:24:21: note: expanded from macro 'container_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^        ~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   include/linux/iommu.h:43:8: note: forward declaration of 'struct iommu_sva'
      43 | struct iommu_sva;
         |        ^
   drivers/iommu/iommu-sva.c:97:20: error: incomplete definition of type 'struct iommu_attach_handle'
      97 |                 if (attach_handle->domain->mm != mm) {
         |                     ~~~~~~~~~~~~~^
   include/linux/iommu.h:137:9: note: forward declaration of 'struct iommu_attach_handle'
     137 |         struct iommu_attach_handle *attach_handle;
         |                ^
   drivers/iommu/iommu-sva.c:101:23: error: incomplete definition of type 'struct iommu_sva'
     101 |                 refcount_inc(&handle->users);
         |                               ~~~~~~^
   include/linux/iommu.h:43:8: note: forward declaration of 'struct iommu_sva'
      43 | struct iommu_sva;
         |        ^
>> drivers/iommu/iommu-sva.c:111:11: error: invalid application of 'sizeof' to an incomplete type 'typeof (*handle)' (aka 'struct iommu_sva')
     111 |         handle = kzalloc_obj(*handle, GFP_KERNEL);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1056:2: note: expanded from macro 'kzalloc_obj'
    1056 |         __alloc_objs(kzalloc, GFP, typeof(P), 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:985:37: note: expanded from macro '__alloc_objs'
     985 |         const size_t __obj_size = size_mul(sizeof(TYPE), COUNT);        \
         |                                            ^     ~~~~~~
   include/linux/iommu.h:43:8: note: forward declaration of 'struct iommu_sva'
      43 | struct iommu_sva;
         |        ^
   drivers/iommu/iommu-sva.c:118:43: error: incomplete definition of type 'struct iommu_mm_data'
     118 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                      ~~~~~~~~~~~~^
   include/linux/list.h:782:30: note: expanded from macro 'list_for_each_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^~~~
   include/linux/list.h:620:14: note: expanded from macro 'list_first_entry'
     620 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:609:15: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:20:26: note: expanded from macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/mm_types.h:1122:8: note: forward declaration of 'struct iommu_mm_data'
    1122 | struct iommu_mm_data;
         |        ^
   drivers/iommu/iommu-sva.c:118:43: error: incomplete definition of type 'struct iommu_mm_data'
     118 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                      ~~~~~~~~~~~~^
   include/linux/list.h:782:30: note: expanded from macro 'list_for_each_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^~~~
   include/linux/list.h:620:14: note: expanded from macro 'list_first_entry'
     620 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:609:15: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:617:63: note: expanded from macro '__same_type'
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/mm_types.h:1122:8: note: forward declaration of 'struct iommu_mm_data'
    1122 | struct iommu_mm_data;
         |        ^
   drivers/iommu/iommu-sva.c:118:43: error: incomplete definition of type 'struct iommu_mm_data'
     118 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                      ~~~~~~~~~~~~^
   include/linux/list.h:782:30: note: expanded from macro 'list_for_each_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^~~~
   include/linux/list.h:620:14: note: expanded from macro 'list_first_entry'
     620 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:609:15: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:617:63: note: expanded from macro '__same_type'
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/mm_types.h:1122:8: note: forward declaration of 'struct iommu_mm_data'
    1122 | struct iommu_mm_data;
         |        ^
   drivers/iommu/iommu-sva.c:118:43: error: incomplete definition of type 'struct iommu_mm_data'
     118 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                      ~~~~~~~~~~~~^
   include/linux/list.h:783:32: note: expanded from macro 'list_for_each_entry'
     783 |              !list_entry_is_head(pos, head, member);                    \
         |                                       ^~~~
   include/linux/list.h:773:30: note: expanded from macro 'list_entry_is_head'
     773 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   include/linux/mm_types.h:1122:8: note: forward declaration of 'struct iommu_mm_data'
    1122 | struct iommu_mm_data;
         |        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y] && (ARM64 || X86 [=y])
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +38 drivers/iommu/iommu-sva.c

cfc78dfd9b36dc drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   12  
cfc78dfd9b36dc drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   13  static DEFINE_MUTEX(iommu_sva_lock);
e37d5a2d60a338 drivers/iommu/iommu-sva.c     Lu Baolu              2025-10-22   14  static bool iommu_sva_present;
e37d5a2d60a338 drivers/iommu/iommu-sva.c     Lu Baolu              2025-10-22   15  static LIST_HEAD(iommu_sva_mms);
b5c29fba72a6c9 drivers/iommu/iommu-sva.c     Lu Baolu              2024-05-28   16  static struct iommu_domain *iommu_sva_domain_alloc(struct device *dev,
b5c29fba72a6c9 drivers/iommu/iommu-sva.c     Lu Baolu              2024-05-28   17  						   struct mm_struct *mm);
cfc78dfd9b36dc drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   18  
4e14176ab13fb6 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2023-03-22   19  /* Allocate a PASID for the mm within range (inclusive) */
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   20  static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct device *dev)
cfc78dfd9b36dc drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   21  {
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   22  	struct iommu_mm_data *iommu_mm;
2dcebc7ddce7ff drivers/iommu/iommu-sva.c     Jacob Pan             2023-08-09   23  	ioasid_t pasid;
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   24  
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   25  	lockdep_assert_held(&iommu_sva_lock);
cfc78dfd9b36dc drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   26  
23e5d9ec2bab53 drivers/iommu/iommu-sva.c     Kiryl Shutsemau       2023-03-12   27  	if (!arch_pgtable_dma_compat(mm))
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   28  		return ERR_PTR(-EBUSY);
23e5d9ec2bab53 drivers/iommu/iommu-sva.c     Kiryl Shutsemau       2023-03-12   29  
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   30  	iommu_mm = mm->iommu_mm;
701fac40384f07 drivers/iommu/iommu-sva-lib.c Fenghua Yu            2022-02-07   31  	/* Is a PASID already associated with this mm? */
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   32  	if (iommu_mm) {
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  @33  		if (iommu_mm->pasid >= dev->iommu->max_pasids)
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   34  			return ERR_PTR(-EOVERFLOW);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   35  		return iommu_mm;
701fac40384f07 drivers/iommu/iommu-sva-lib.c Fenghua Yu            2022-02-07   36  	}
701fac40384f07 drivers/iommu/iommu-sva-lib.c Fenghua Yu            2022-02-07   37  
69050f8d6d075d drivers/iommu/iommu-sva.c     Kees Cook             2026-02-20  @38  	iommu_mm = kzalloc_obj(struct iommu_mm_data, GFP_KERNEL);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   39  	if (!iommu_mm)
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   40  		return ERR_PTR(-ENOMEM);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   41  
2dcebc7ddce7ff drivers/iommu/iommu-sva.c     Jacob Pan             2023-08-09   42  	pasid = iommu_alloc_global_pasid(dev);
2dcebc7ddce7ff drivers/iommu/iommu-sva.c     Jacob Pan             2023-08-09   43  	if (pasid == IOMMU_PASID_INVALID) {
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   44  		kfree(iommu_mm);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   45  		return ERR_PTR(-ENOSPC);
2dcebc7ddce7ff drivers/iommu/iommu-sva.c     Jacob Pan             2023-08-09   46  	}
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   47  	iommu_mm->pasid = pasid;
e37d5a2d60a338 drivers/iommu/iommu-sva.c     Lu Baolu              2025-10-22   48  	iommu_mm->mm = mm;
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   49  	INIT_LIST_HEAD(&iommu_mm->sva_domains);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   50  	/*
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   51  	 * Make sure the write to mm->iommu_mm is not reordered in front of
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   52  	 * initialization to iommu_mm fields. If it does, readers may see a
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   53  	 * valid iommu_mm with uninitialized values.
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   54  	 */
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   55  	smp_store_release(&mm->iommu_mm, iommu_mm);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   56  	return iommu_mm;
cfc78dfd9b36dc drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   57  }
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   58  
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   59  /**
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   60   * iommu_sva_bind_device() - Bind a process address space to a device
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   61   * @dev: the device
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   62   * @mm: the mm to bind, caller must hold a reference to mm_users
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   63   *
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   64   * Create a bond between device and address space, allowing the device to
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   65   * access the mm using the PASID returned by iommu_sva_get_pasid(). If a
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   66   * bond already exists between @device and @mm, an additional internal
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   67   * reference is taken. Caller must call iommu_sva_unbind_device()
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   68   * to release each reference.
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   69   *
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   70   * On error, returns an ERR_PTR value.
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   71   */
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   72  struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   73  {
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   74  	struct iommu_group *group = dev->iommu_group;
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   75  	struct iommu_attach_handle *attach_handle;
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   76  	struct iommu_mm_data *iommu_mm;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   77  	struct iommu_domain *domain;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   78  	struct iommu_sva *handle;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   79  	int ret;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   80  
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   81  	if (!group)
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   82  		return ERR_PTR(-ENODEV);
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   83  
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   84  	mutex_lock(&iommu_sva_lock);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   85  
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   86  	/* Allocate mm->pasid if necessary. */
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   87  	iommu_mm = iommu_alloc_mm_data(mm, dev);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   88  	if (IS_ERR(iommu_mm)) {
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   89  		ret = PTR_ERR(iommu_mm);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   90  		goto out_unlock;
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   91  	}
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   92  
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   93  	/* A bond already exists, just take a reference`. */
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   94  	attach_handle = iommu_attach_handle_get(group, iommu_mm->pasid, IOMMU_DOMAIN_SVA);
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   95  	if (!IS_ERR(attach_handle)) {
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   96  		handle = container_of(attach_handle, struct iommu_sva, handle);
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   97  		if (attach_handle->domain->mm != mm) {
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   98  			ret = -EBUSY;
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   99  			goto out_unlock;
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  100  		}
65d4418c5002ec drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22 @101  		refcount_inc(&handle->users);
65d4418c5002ec drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22  102  		mutex_unlock(&iommu_sva_lock);
65d4418c5002ec drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22  103  		return handle;
65d4418c5002ec drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22  104  	}
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  105  
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  106  	if (PTR_ERR(attach_handle) != -ENOENT) {
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  107  		ret = PTR_ERR(attach_handle);
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  108  		goto out_unlock;
65d4418c5002ec drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22  109  	}
65d4418c5002ec drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22  110  
69050f8d6d075d drivers/iommu/iommu-sva.c     Kees Cook             2026-02-20 @111  	handle = kzalloc_obj(*handle, GFP_KERNEL);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  112  	if (!handle) {
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  113  		ret = -ENOMEM;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  114  		goto out_unlock;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  115  	}
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  116  
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  117  	/* Search for an existing domain. */
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  118  	list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
14678219cf4093 drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  119  		ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
14678219cf4093 drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  120  						&handle->handle);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  121  		if (!ret) {
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  122  			domain->users++;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  123  			goto out;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  124  		}
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  125  	}
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  126  
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  127  	/* Allocate a new domain and set it on device pasid. */
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  128  	domain = iommu_sva_domain_alloc(dev, mm);
80af5a45202422 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-04-18  129  	if (IS_ERR(domain)) {
80af5a45202422 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-04-18  130  		ret = PTR_ERR(domain);
9991a82a381746 drivers/iommu/iommu-sva.c     Harshit Mogalapalli   2023-12-13  131  		goto out_free_handle;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  132  	}
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  133  
14678219cf4093 drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  134  	ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
14678219cf4093 drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  135  					&handle->handle);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  136  	if (ret)
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  137  		goto out_free_domain;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  138  	domain->users = 1;
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  139  
e37d5a2d60a338 drivers/iommu/iommu-sva.c     Lu Baolu              2025-10-22  140  	if (list_empty(&iommu_mm->sva_domains)) {
e37d5a2d60a338 drivers/iommu/iommu-sva.c     Lu Baolu              2025-10-22  141  		if (list_empty(&iommu_sva_mms))
e37d5a2d60a338 drivers/iommu/iommu-sva.c     Lu Baolu              2025-10-22  142  			iommu_sva_present = true;
e37d5a2d60a338 drivers/iommu/iommu-sva.c     Lu Baolu              2025-10-22  143  		list_add(&iommu_mm->mm_list_elm, &iommu_sva_mms);
e37d5a2d60a338 drivers/iommu/iommu-sva.c     Lu Baolu              2025-10-22  144  	}
e37d5a2d60a338 drivers/iommu/iommu-sva.c     Lu Baolu              2025-10-22  145  	list_add(&domain->next, &iommu_mm->sva_domains);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  146  out:
6384c56c99d98c drivers/iommu/iommu-sva.c     Zhangfei Gao          2024-02-27  147  	refcount_set(&handle->users, 1);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  148  	mutex_unlock(&iommu_sva_lock);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  149  	handle->dev = dev;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  150  	return handle;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  151  
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  152  out_free_domain:
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  153  	iommu_domain_free(domain);
9991a82a381746 drivers/iommu/iommu-sva.c     Harshit Mogalapalli   2023-12-13  154  out_free_handle:
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  155  	kfree(handle);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  156  out_unlock:
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  157  	mutex_unlock(&iommu_sva_lock);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  158  	return ERR_PTR(ret);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  159  }
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  160  EXPORT_SYMBOL_GPL(iommu_sva_bind_device);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  161  

:::::: The code at line 38 was first introduced by commit
:::::: 69050f8d6d075dc01af7a5f2f550a8067510366f treewide: Replace kmalloc with kmalloc_obj for non-scalar types

:::::: TO: Kees Cook <kees@kernel.org>
:::::: CC: Kees Cook <kees@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
