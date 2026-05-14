Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDAF13959D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773324; cv=none; b=eZnzf9mamqvz+xxhSO36BoTv0cLQsZf3OpB7AKIZPmNkArkEHeqYCdfTa5Is2KQhnVpatGlNlIwOtXdGLNMhEDrxHxjBIWOcdhS7BQgcA/za65dhnlgC12dIXsIoq7QRnQXMuB/a6WHgVZi1N0CBnqbU2rGHOT2mmpd7ZJE2l0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773324; c=relaxed/simple;
	bh=5KDgTdstj2Y2eqolrNmRC5dFcYpvfCVUKJUlN4mdwio=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HAzg8JUKIiN5GnLYD0P7Oy+dFds4D/bP5ukwQHkcGQVpT4LCpoc/lT9lPm/MXtoMd5I+NGM39iS5NLDgnxNhAqPaqfiWHDJ5ZaAx3b0wmx27kKIDiR9D/ygFAlZ5gH/AERlKSqdbFk0PD3hDVkkNH2Vx2ogf5CuHKW7dUl1dq7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6xg5PDK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6xg5PDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778773321; x=1810309321;
  h=date:from:to:cc:subject:message-id;
  bh=5KDgTdstj2Y2eqolrNmRC5dFcYpvfCVUKJUlN4mdwio=;
  b=j6xg5PDKurQVly3dDWOs0nJO2/opyqFMR1KxQm7z/kZYvs7oOVPt3b7D
   hIWEA9hHhXDsQcdkJDwmbDVfe1R7jxOERCfMdX4pmze/EIZDIqAUYs6cR
   OOZVEMwQ5yl42x1qJGNNLY/SeAWCRz3eQPCwaFOEH9XLK7lIMRjfxQqHP
   Rw8q7/t5n74O0pENCM4dKCHDznuN+EItXz8axD0tO1UvfOyy85o9lNPEN
   uWK2Dp7ITH50SApc3Mferv/5/O5mXwXgklNDjjPmxXsIj+1brYZKFdV5z
   ZBdThH8X7VhU2eiTXGm4tRVk0C9rJ0cTtzZUqr1RTFIIR4m+7x7iXJ+xx
   A==;
X-CSE-ConnectionGUID: 4r98p+ZEQP2fmZFS8Z4L/A==
X-CSE-MsgGUID: piupuoTJRGaOaOJC5I7RFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="102390663"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="102390663"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 08:42:01 -0700
X-CSE-ConnectionGUID: 8xH9VJCWQ1aLC+jhnPUenw==
X-CSE-MsgGUID: 7PEsBO1SQoChkcjMD9C6VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="242414116"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2026 08:41:59 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNYCC-000000006hL-0ned;
	Thu, 14 May 2026 15:41:56 +0000
Date: Thu, 14 May 2026 23:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 include/linux/compiler_types.h:503:27: error: expression in static assertion
 is not an integer
Message-ID: <202605142327.OhqMYeDW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   6eda36f7fde778febe54c3cfa182dcc5f01c92fc
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [1/1] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: x86_64-randconfig-006-20260514 (https://download.01.org/0day-ci/archive/20260514/202605142327.OhqMYeDW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142327.OhqMYeDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605142327.OhqMYeDW-lkp@intel.com/

All errors (new ones prefixed by >>):

      18 |         return dev->iommu->iommu_dev->ops;
         |                          ^~
   drivers/iommu/iommu-priv.h: In function 'iommu_fwspec_ops':
   drivers/iommu/iommu-priv.h:27:53: error: 'struct iommu_fwspec' has no member named 'iommu_fwnode'
      27 |         return iommu_ops_from_fwnode(fwspec ? fwspec->iommu_fwnode : NULL);
         |                                                     ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_alloc_mm_data':
   drivers/iommu/iommu-sva.c:30:29: error: invalid use of undefined type 'struct iommu_mm_data'
      30 |                 if (iommu_mm->pasid >= dev->iommu->max_pasids)
         |                             ^~
   drivers/iommu/iommu-sva.c:30:50: error: invalid use of undefined type 'struct dev_iommu'
      30 |                 if (iommu_mm->pasid >= dev->iommu->max_pasids)
         |                                                  ^~
   In file included from include/linux/percpu.h:5,
                    from arch/x86/include/asm/msr.h:16,
                    from arch/x86/include/asm/tsc.h:11,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from arch/x86/include/asm/mmu_context.h:6,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c:35:35: error: invalid application of 'sizeof' to incomplete type 'struct iommu_mm_data'
      35 |         iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
         |                                   ^~~~~~
   include/linux/alloc_tag.h:239:16: note: in definition of macro 'alloc_hooks_tag'
     239 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:1041:49: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:35:20: note: in expansion of macro 'kzalloc'
      35 |         iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
         |                    ^~~~~~~
   drivers/iommu/iommu-sva.c:35:35: error: invalid application of 'sizeof' to incomplete type 'struct iommu_mm_data'
      35 |         iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
         |                                   ^~~~~~
   include/linux/alloc_tag.h:243:24: note: in definition of macro 'alloc_hooks_tag'
     243 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1041:49: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:35:20: note: in expansion of macro 'kzalloc'
      35 |         iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
         |                    ^~~~~~~
   drivers/iommu/iommu-sva.c:35:35: error: invalid application of 'sizeof' to incomplete type 'struct iommu_mm_data'
      35 |         iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
         |                                   ^~~~~~
   include/linux/alloc_tag.h:246:24: note: in definition of macro 'alloc_hooks_tag'
     246 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1041:49: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:35:20: note: in expansion of macro 'kzalloc'
      35 |         iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
         |                    ^~~~~~~
   drivers/iommu/iommu-sva.c:35:18: error: assignment to 'struct iommu_mm_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      35 |         iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
         |                  ^
   drivers/iommu/iommu-sva.c:44:17: error: invalid use of undefined type 'struct iommu_mm_data'
      44 |         iommu_mm->pasid = pasid;
         |                 ^~
   drivers/iommu/iommu-sva.c:45:33: error: invalid use of undefined type 'struct iommu_mm_data'
      45 |         INIT_LIST_HEAD(&iommu_mm->sva_domains);
         |                                 ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_bind_device':
   drivers/iommu/iommu-sva.c:90:64: error: invalid use of undefined type 'struct iommu_mm_data'
      90 |         attach_handle = iommu_attach_handle_get(group, iommu_mm->pasid, IOMMU_DOMAIN_SVA);
         |                                                                ^~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:103,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from arch/x86/include/asm/mmu_context.h:5:
   include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct iommu_sva'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:92:26: note: in expansion of macro 'container_of'
      92 |                 handle = container_of(attach_handle, struct iommu_sva, handle);
         |                          ^~~~~~~~~~~~
>> include/linux/compiler_types.h:503:27: error: expression in static assertion is not an integer
     503 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:92:26: note: in expansion of macro 'container_of'
      92 |                 handle = container_of(attach_handle, struct iommu_sva, handle);
         |                          ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/atomic.h:5:
   include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct iommu_sva'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/iommu/iommu-sva.c:92:26: note: in expansion of macro 'container_of'
      92 |                 handle = container_of(attach_handle, struct iommu_sva, handle);
         |                          ^~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:93:34: error: invalid use of undefined type 'struct iommu_attach_handle'
      93 |                 if (attach_handle->domain->mm != mm) {
         |                                  ^~
   drivers/iommu/iommu-sva.c:97:37: error: invalid use of undefined type 'struct iommu_sva'
      97 |                 refcount_inc(&handle->users);
         |                                     ^~
   drivers/iommu/iommu-sva.c:107:32: error: invalid application of 'sizeof' to incomplete type 'struct iommu_sva'
     107 |         handle = kzalloc(sizeof(*handle), GFP_KERNEL);
         |                                ^
   include/linux/alloc_tag.h:239:16: note: in definition of macro 'alloc_hooks_tag'
     239 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:1041:49: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:107:18: note: in expansion of macro 'kzalloc'
     107 |         handle = kzalloc(sizeof(*handle), GFP_KERNEL);
         |                  ^~~~~~~
   drivers/iommu/iommu-sva.c:107:32: error: invalid application of 'sizeof' to incomplete type 'struct iommu_sva'
     107 |         handle = kzalloc(sizeof(*handle), GFP_KERNEL);
         |                                ^
   include/linux/alloc_tag.h:243:24: note: in definition of macro 'alloc_hooks_tag'
     243 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1041:49: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:107:18: note: in expansion of macro 'kzalloc'
     107 |         handle = kzalloc(sizeof(*handle), GFP_KERNEL);
         |                  ^~~~~~~
   drivers/iommu/iommu-sva.c:107:32: error: invalid application of 'sizeof' to incomplete type 'struct iommu_sva'
     107 |         handle = kzalloc(sizeof(*handle), GFP_KERNEL);
         |                                ^
   include/linux/alloc_tag.h:246:24: note: in definition of macro 'alloc_hooks_tag'
     246 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1041:49: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:107:18: note: in expansion of macro 'kzalloc'
     107 |         handle = kzalloc(sizeof(*handle), GFP_KERNEL);
         |                  ^~~~~~~
   drivers/iommu/iommu-sva.c:107:16: error: assignment to 'struct iommu_sva *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     107 |         handle = kzalloc(sizeof(*handle), GFP_KERNEL);
         |                ^
   In file included from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:11,
                    from arch/x86/include/asm/tlbbatch.h:5,
                    from include/linux/mm_types_task.h:17,
                    from include/linux/mm_types.h:5:
   drivers/iommu/iommu-sva.c:114:50: error: invalid use of undefined type 'struct iommu_mm_data'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                                  ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:9: note: in expansion of macro 'list_for_each_entry'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:50: error: invalid use of undefined type 'struct iommu_mm_data'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                                  ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:9: note: in expansion of macro 'list_for_each_entry'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:50: error: invalid use of undefined type 'struct iommu_mm_data'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                                  ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:9: note: in expansion of macro 'list_for_each_entry'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_types.h:503:27: error: expression in static assertion is not an integer
     503 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:9: note: in expansion of macro 'list_for_each_entry'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/random.h:8,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:17:
   drivers/iommu/iommu-sva.c:114:50: error: invalid use of undefined type 'struct iommu_mm_data'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                                  ^~
   include/linux/list.h:761:37: note: in definition of macro 'list_entry_is_head'
     761 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   drivers/iommu/iommu-sva.c:114:9: note: in expansion of macro 'list_for_each_entry'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:115:70: error: invalid use of undefined type 'struct iommu_mm_data'
     115 |                 ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
         |                                                                      ^~
   drivers/iommu/iommu-sva.c:116:56: error: invalid use of undefined type 'struct iommu_sva'
     116 |                                                 &handle->handle);
         |                                                        ^~
   drivers/iommu/iommu-sva.c:130:62: error: invalid use of undefined type 'struct iommu_mm_data'
     130 |         ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
         |                                                              ^~
   drivers/iommu/iommu-sva.c:131:48: error: invalid use of undefined type 'struct iommu_sva'
     131 |                                         &handle->handle);
         |                                                ^~
   drivers/iommu/iommu-sva.c:135:46: error: invalid use of undefined type 'struct iommu_mm_data'
     135 |         list_add(&domain->next, &mm->iommu_mm->sva_domains);
         |                                              ^~
   drivers/iommu/iommu-sva.c:138:29: error: invalid use of undefined type 'struct iommu_sva'
     138 |         refcount_set(&handle->users, 1);
         |                             ^~
   drivers/iommu/iommu-sva.c:140:15: error: invalid use of undefined type 'struct iommu_sva'
     140 |         handle->dev = dev;
         |               ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_unbind_device':
   drivers/iommu/iommu-sva.c:163:45: error: invalid use of undefined type 'struct iommu_sva'
     163 |         struct iommu_domain *domain = handle->handle.domain;
         |                                             ^~
   drivers/iommu/iommu-sva.c:165:36: error: invalid use of undefined type 'struct iommu_sva'
     165 |         struct device *dev = handle->dev;
         |                                    ^~
   drivers/iommu/iommu-sva.c:168:43: error: invalid use of undefined type 'struct iommu_sva'
     168 |         if (!refcount_dec_and_test(&handle->users)) {
         |                                           ^~
   drivers/iommu/iommu-sva.c:173:56: error: invalid use of undefined type 'struct iommu_mm_data'
     173 |         iommu_detach_device_pasid(domain, dev, iommu_mm->pasid);
         |                                                        ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_get_pasid':
   drivers/iommu/iommu-sva.c:185:45: error: invalid use of undefined type 'struct iommu_sva'
     185 |         struct iommu_domain *domain = handle->handle.domain;
         |                                             ^~
   drivers/iommu/iommu-sva.c: In function 'mm_pasid_drop':
   drivers/iommu/iommu-sva.c:198:41: error: invalid use of undefined type 'struct iommu_mm_data'
     198 |         iommu_free_global_pasid(iommu_mm->pasid);
         |                                         ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_handle_iopf':
   drivers/iommu/iommu-sva.c:275:66: error: invalid use of undefined type 'struct iommu_attach_handle'
     275 |                                              group->attach_handle->domain->mm);
         |                                                                  ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_iopf_handler':
   drivers/iommu/iommu-sva.c:287:36: error: 'struct iommu_fault_param' has no member named 'queue'
     287 |         if (!queue_work(fault_param->queue->wq, &group->work))
         |                                    ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_domain_alloc':
   drivers/iommu/iommu-sva.c:299:17: error: 'const struct iommu_ops' has no member named 'domain_alloc_sva'
     299 |         if (!ops->domain_alloc_sva)
         |                 ^~
   drivers/iommu/iommu-sva.c:302:21: error: 'const struct iommu_ops' has no member named 'domain_alloc_sva'
     302 |         domain = ops->domain_alloc_sva(dev, mm);
         |                     ^~
   drivers/iommu/iommu-priv.h: In function 'dev_iommu_ops':
   drivers/iommu/iommu-priv.h:19:1: warning: control reaches end of non-void function [-Wreturn-type]
      19 | }
         | ^
   include/linux/iommu.h: In function 'mm_get_enqcmd_pasid':
   include/linux/iommu.h:1567:1: warning: control reaches end of non-void function [-Wreturn-type]
    1567 | }

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +503 include/linux/compiler_types.h

eb111869301e15b Rasmus Villemoes 2019-09-13  501  
d15155824c50148 Will Deacon      2017-10-24  502  /* Are two types/vars the same type (ignoring qualifiers)? */
d15155824c50148 Will Deacon      2017-10-24 @503  #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
d15155824c50148 Will Deacon      2017-10-24  504  

:::::: The code at line 503 was first introduced by commit
:::::: d15155824c5014803d91b829736d249c500bdda6 linux/compiler.h: Split into compiler.h and compiler_types.h

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
