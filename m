Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE39236896D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 19:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564277; cv=none; b=iLrJr0xd4pxROcTXAMkIEjFLVY4sozVQrRBSXEWB80gUDJ6C2XZj7MeBV+51gy25iNCRSmU8raiQWlyIhhjL2PXDsNHF+H/Rhiemuv9CtOXf6dhqSaZhEi5kbSDsoTL16m/RX8SXcs7fRKGSAwFqXwesE17x2CsPKLa5/VYgiIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564277; c=relaxed/simple;
	bh=QUtwZBHcfEZror8EEsDqnVlxqMtnjZN9rersKoIVRWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=agGce16lyrJzVP9T7JtC2bpEB9SRXBFOc2MLHSu4TAzYIhgI7fyexf9f2Ny0zPrzm4zf0bTsXPtfu2mQi1vm+6mUWseZz6P8jdzD3ij1oGbbX+fcNtjII/3D0AtFp13Hs6YosbLmOHPBeMGGhyM4lp9Dl6h6mjSlVklM7vRol0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQV8HFYl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQV8HFYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786564275; x=1818100275;
  h=date:from:to:cc:subject:message-id;
  bh=QUtwZBHcfEZror8EEsDqnVlxqMtnjZN9rersKoIVRWg=;
  b=mQV8HFYlyIi7O+o8OKWYmd4zqFnbWffb03XWdErsskdXDZxzRon5LMSx
   YR35LOdz3hTVOaYlwTE75uZ/RRJ461X4rVIU6xqoq9qyvX+FJESIo5Li6
   A+9qDEKmEd2GppSFn9PSxhxWiALCR6bAJvkyBk6+n0JWb4ez9KoqJhPFq
   y8B1VCn4Cq3MnXkyDeOwKO4/R5ggNcaF0eae0UO0Hs70ijDIBW73a44H9
   dp1pcOITS/CIoemtMW0ZoTy8GI8UKPld7SIJFPadqGR9b79IW3z96HrCx
   z1/b+IwMKI1KwhzubbgzQwt+taWIXDcE44rgaKE27C0MXUBqOe4+fB0Uj
   g==;
X-CSE-ConnectionGUID: 5wmh5PO+TOG3uiOjq0luZA==
X-CSE-MsgGUID: OpHZuF99RjS12JC7k8Ic/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="109919182"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="109919182"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:51:14 -0700
X-CSE-ConnectionGUID: MDZTtvHCSQyi9LfYWnA7dg==
X-CSE-MsgGUID: O3X+5bmtT0KOQvt4mNDs9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263271004"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Aug 2026 12:51:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuEyk-00000000RW2-2gJF;
	Wed, 12 Aug 2026 19:51:10 +0000
Date: Thu, 13 Aug 2026 03:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 1/1]
 drivers/iommu/iommu-sva.c:35:11: warning: assignment to 'struct iommu_mm_data
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202608130313.bEbwlew2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   10f6d538c651ab6dd44bb8679c8e2d6522f13a68
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [1/1] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: arm-randconfig-003-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130313.bEbwlew2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130313.bEbwlew2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130313.bEbwlew2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-sva.c:10:
   drivers/iommu/iommu-priv.h: In function 'dev_iommu_ops':
   drivers/iommu/iommu-priv.h:18:19: error: dereferencing pointer to incomplete type 'struct dev_iommu'
     return dev->iommu->iommu_dev->ops;
                      ^~
   drivers/iommu/iommu-priv.h: In function 'iommu_fwspec_ops':
   drivers/iommu/iommu-priv.h:27:46: error: 'struct iommu_fwspec' has no member named 'iommu_fwnode'
     return iommu_ops_from_fwnode(fwspec ? fwspec->iommu_fwnode : NULL);
                                                 ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_alloc_mm_data':
   drivers/iommu/iommu-sva.c:27:17: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     iommu_mm = mm->iommu_mm;
                    ^~~~~~~~
                    mm_mt
   drivers/iommu/iommu-sva.c:30:15: error: dereferencing pointer to incomplete type 'struct iommu_mm_data'
      if (iommu_mm->pasid >= dev->iommu->max_pasids)
                  ^~
   In file included from include/linux/percpu.h:5,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from arch/arm/include/asm/mmu_context.h:15,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c:35:28: error: invalid application of 'sizeof' to incomplete type 'struct iommu_mm_data'
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
                               ^~~~~~
   include/linux/alloc_tag.h:239:9: note: in definition of macro 'alloc_hooks_tag'
     typeof(_do_alloc) _res;      \
            ^~~~~~~~~
   include/linux/slab.h:1041:25: note: in expansion of macro 'alloc_hooks'
    #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
                            ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:35:13: note: in expansion of macro 'kzalloc'
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
                ^~~~~~~
   drivers/iommu/iommu-sva.c:35:28: error: invalid application of 'sizeof' to incomplete type 'struct iommu_mm_data'
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
                               ^~~~~~
   include/linux/alloc_tag.h:243:10: note: in definition of macro 'alloc_hooks_tag'
      _res = _do_alloc;     \
             ^~~~~~~~~
   include/linux/slab.h:1041:25: note: in expansion of macro 'alloc_hooks'
    #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
                            ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:35:13: note: in expansion of macro 'kzalloc'
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
                ^~~~~~~
   drivers/iommu/iommu-sva.c:35:28: error: invalid application of 'sizeof' to incomplete type 'struct iommu_mm_data'
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
                               ^~~~~~
   include/linux/alloc_tag.h:246:10: note: in definition of macro 'alloc_hooks_tag'
      _res = _do_alloc;     \
             ^~~~~~~~~
   include/linux/slab.h:1041:25: note: in expansion of macro 'alloc_hooks'
    #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
                            ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:35:13: note: in expansion of macro 'kzalloc'
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
                ^~~~~~~
>> drivers/iommu/iommu-sva.c:35:11: warning: assignment to 'struct iommu_mm_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
              ^
   In file included from <command-line>:
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     smp_store_release(&mm->iommu_mm, iommu_mm);
                            ^~~~~~~~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:197:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(*p, v);      \
     ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     smp_store_release(&mm->iommu_mm, iommu_mm);
                            ^~~~~~~~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:197:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(*p, v);      \
     ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     smp_store_release(&mm->iommu_mm, iommu_mm);
                            ^~~~~~~~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:197:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(*p, v);      \
     ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     smp_store_release(&mm->iommu_mm, iommu_mm);
                            ^~~~~~~~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:197:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(*p, v);      \
     ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
--
     *(volatile typeof(x) *)&(x) = (val);    \
                       ^
   include/asm-generic/barrier.h:197:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(*p, v);      \
     ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     smp_store_release(&mm->iommu_mm, iommu_mm);
                            ^~~~~~~~
   include/asm-generic/rwonce.h:55:27: note: in definition of macro '__WRITE_ONCE'
     *(volatile typeof(x) *)&(x) = (val);    \
                              ^
   include/asm-generic/barrier.h:197:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(*p, v);      \
     ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c: At top level:
   drivers/iommu/iommu-sva.c:68:19: error: redefinition of 'iommu_sva_bind_device'
    struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
                      ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/iommu-sva.c:8:
   include/linux/iommu.h:1576:1: note: previous definition of 'iommu_sva_bind_device' was here
    iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitfield.h:10,
                    from arch/arm/include/asm/ptrace.h:13,
                    from arch/arm/include/asm/processor.h:14,
                    from include/linux/sched.h:13,
                    from arch/arm/include/asm/mmu_context.h:14,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_bind_device':
   include/linux/container_of.h:20:28: error: dereferencing pointer to incomplete type 'struct iommu_attach_handle'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                               ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:92:12: note: in expansion of macro 'container_of'
      handle = container_of(attach_handle, struct iommu_sva, handle);
               ^~~~~~~~~~~~
   include/linux/container_of.h:20:47: error: dereferencing pointer to incomplete type 'struct iommu_sva'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                                                  ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:92:12: note: in expansion of macro 'container_of'
      handle = container_of(attach_handle, struct iommu_sva, handle);
               ^~~~~~~~~~~~
   include/linux/compiler_types.h:503:27: error: expression in static assertion is not an integer
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:92:12: note: in expansion of macro 'container_of'
      handle = container_of(attach_handle, struct iommu_sva, handle);
               ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:390,
                    from arch/arm/include/asm/mmu_context.h:13,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   include/linux/stddef.h:16:32: error: invalid use of undefined type 'struct iommu_sva'
    #define offsetof(TYPE, MEMBER) __builtin_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:21: note: in expansion of macro 'offsetof'
     ((type *)(__mptr - offsetof(type, member))); })
                        ^~~~~~~~
   drivers/iommu/iommu-sva.c:92:12: note: in expansion of macro 'container_of'
      handle = container_of(attach_handle, struct iommu_sva, handle);
               ^~~~~~~~~~~~
>> drivers/iommu/iommu-sva.c:107:9: warning: assignment to 'struct iommu_sva *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     handle = kzalloc(sizeof(*handle), GFP_KERNEL);
            ^
   In file included from include/linux/list.h:5,
                    from arch/arm/include/asm/traps.h:6,
                    from arch/arm/include/asm/thread_info.h:43,
                    from include/linux/thread_info.h:60,
                    from include/linux/sched.h:14,
                    from arch/arm/include/asm/mmu_context.h:14,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c:114:35: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
                                      ^~~~~~~~
   include/linux/container_of.h:19:26: note: in definition of macro 'container_of'
     void *__mptr = (void *)(ptr);     \
                             ^~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     list_entry((ptr)->next, type, member)
     ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     for (pos = list_first_entry(head, typeof(*pos), member); \
                ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
     ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitfield.h:10,
                    from arch/arm/include/asm/ptrace.h:13,
                    from arch/arm/include/asm/processor.h:14,
                    from include/linux/sched.h:13,
                    from arch/arm/include/asm/mmu_context.h:14,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c:114:35: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
                                      ^~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   include/linux/list.h:601:2: note: in expansion of macro 'container_of'
     container_of(ptr, type, member)
     ^~~~~~~~~~~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     list_entry((ptr)->next, type, member)
     ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     for (pos = list_first_entry(head, typeof(*pos), member); \
                ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
     ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:35: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
                                      ^~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:21:9: note: in expansion of macro '__same_type'
            __same_type(*(ptr), void),   \
            ^~~~~~~~~~~
   include/linux/list.h:601:2: note: in expansion of macro 'container_of'
     container_of(ptr, type, member)
     ^~~~~~~~~~~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     list_entry((ptr)->next, type, member)
     ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     for (pos = list_first_entry(head, typeof(*pos), member); \
                ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
     ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:503:27: error: expression in static assertion is not an integer
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   include/linux/list.h:601:2: note: in expansion of macro 'container_of'
     container_of(ptr, type, member)
     ^~~~~~~~~~~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     list_entry((ptr)->next, type, member)
     ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     for (pos = list_first_entry(head, typeof(*pos), member); \

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +35 drivers/iommu/iommu-sva.c

cfc78dfd9b36dcd drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   11  
cfc78dfd9b36dcd drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   12  static DEFINE_MUTEX(iommu_sva_lock);
b5c29fba72a6c95 drivers/iommu/iommu-sva.c     Lu Baolu              2024-05-28   13  static struct iommu_domain *iommu_sva_domain_alloc(struct device *dev,
b5c29fba72a6c95 drivers/iommu/iommu-sva.c     Lu Baolu              2024-05-28   14  						   struct mm_struct *mm);
cfc78dfd9b36dcd drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   15  
4e14176ab13fb69 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2023-03-22   16  /* Allocate a PASID for the mm within range (inclusive) */
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   17  static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct device *dev)
cfc78dfd9b36dcd drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   18  {
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   19  	struct iommu_mm_data *iommu_mm;
2dcebc7ddce7ffd drivers/iommu/iommu-sva.c     Jacob Pan             2023-08-09   20  	ioasid_t pasid;
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   21  
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   22  	lockdep_assert_held(&iommu_sva_lock);
cfc78dfd9b36dcd drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   23  
23e5d9ec2bab53c drivers/iommu/iommu-sva.c     Kirill A. Shutemov    2023-03-12   24  	if (!arch_pgtable_dma_compat(mm))
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   25  		return ERR_PTR(-EBUSY);
23e5d9ec2bab53c drivers/iommu/iommu-sva.c     Kirill A. Shutemov    2023-03-12   26  
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   27  	iommu_mm = mm->iommu_mm;
701fac40384f071 drivers/iommu/iommu-sva-lib.c Fenghua Yu            2022-02-07   28  	/* Is a PASID already associated with this mm? */
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   29  	if (iommu_mm) {
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   30  		if (iommu_mm->pasid >= dev->iommu->max_pasids)
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   31  			return ERR_PTR(-EOVERFLOW);
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   32  		return iommu_mm;
701fac40384f071 drivers/iommu/iommu-sva-lib.c Fenghua Yu            2022-02-07   33  	}
701fac40384f071 drivers/iommu/iommu-sva-lib.c Fenghua Yu            2022-02-07   34  
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  @35  	iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   36  	if (!iommu_mm)
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   37  		return ERR_PTR(-ENOMEM);
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   38  
2dcebc7ddce7ffd drivers/iommu/iommu-sva.c     Jacob Pan             2023-08-09   39  	pasid = iommu_alloc_global_pasid(dev);
2dcebc7ddce7ffd drivers/iommu/iommu-sva.c     Jacob Pan             2023-08-09   40  	if (pasid == IOMMU_PASID_INVALID) {
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   41  		kfree(iommu_mm);
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   42  		return ERR_PTR(-ENOSPC);
2dcebc7ddce7ffd drivers/iommu/iommu-sva.c     Jacob Pan             2023-08-09   43  	}
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   44  	iommu_mm->pasid = pasid;
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   45  	INIT_LIST_HEAD(&iommu_mm->sva_domains);
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   46  	/*
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   47  	 * Make sure the write to mm->iommu_mm is not reordered in front of
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   48  	 * initialization to iommu_mm fields. If it does, readers may see a
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   49  	 * valid iommu_mm with uninitialized values.
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   50  	 */
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   51  	smp_store_release(&mm->iommu_mm, iommu_mm);
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   52  	return iommu_mm;
cfc78dfd9b36dcd drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   53  }
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   54  
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   55  /**
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   56   * iommu_sva_bind_device() - Bind a process address space to a device
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   57   * @dev: the device
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   58   * @mm: the mm to bind, caller must hold a reference to mm_users
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   59   *
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   60   * Create a bond between device and address space, allowing the device to
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   61   * access the mm using the PASID returned by iommu_sva_get_pasid(). If a
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   62   * bond already exists between @device and @mm, an additional internal
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   63   * reference is taken. Caller must call iommu_sva_unbind_device()
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   64   * to release each reference.
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   65   *
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   66   * On error, returns an ERR_PTR value.
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   67   */
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   68  struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   69  {
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   70  	struct iommu_group *group = dev->iommu_group;
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   71  	struct iommu_attach_handle *attach_handle;
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   72  	struct iommu_mm_data *iommu_mm;
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   73  	struct iommu_domain *domain;
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   74  	struct iommu_sva *handle;
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   75  	int ret;
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   76  
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   77  	if (!group)
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   78  		return ERR_PTR(-ENODEV);
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   79  
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   80  	mutex_lock(&iommu_sva_lock);
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   81  
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   82  	/* Allocate mm->pasid if necessary. */
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   83  	iommu_mm = iommu_alloc_mm_data(mm, dev);
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   84  	if (IS_ERR(iommu_mm)) {
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   85  		ret = PTR_ERR(iommu_mm);
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   86  		goto out_unlock;
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   87  	}
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   88  
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   89  	/* A bond already exists, just take a reference`. */
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   90  	attach_handle = iommu_attach_handle_get(group, iommu_mm->pasid, IOMMU_DOMAIN_SVA);
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   91  	if (!IS_ERR(attach_handle)) {
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   92  		handle = container_of(attach_handle, struct iommu_sva, handle);
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   93  		if (attach_handle->domain->mm != mm) {
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   94  			ret = -EBUSY;
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   95  			goto out_unlock;
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   96  		}
65d4418c5002ec5 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22   97  		refcount_inc(&handle->users);
65d4418c5002ec5 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22   98  		mutex_unlock(&iommu_sva_lock);
65d4418c5002ec5 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22   99  		return handle;
65d4418c5002ec5 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22  100  	}
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  101  
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  102  	if (PTR_ERR(attach_handle) != -ENOENT) {
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  103  		ret = PTR_ERR(attach_handle);
3e7f57d1ef3f5fb drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  104  		goto out_unlock;
65d4418c5002ec5 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22  105  	}
65d4418c5002ec5 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22  106  
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31 @107  	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  108  	if (!handle) {
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  109  		ret = -ENOMEM;
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  110  		goto out_unlock;
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  111  	}
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  112  
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  113  	/* Search for an existing domain. */
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  114  	list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
14678219cf4093e drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  115  		ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
14678219cf4093e drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  116  						&handle->handle);
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  117  		if (!ret) {
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  118  			domain->users++;
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  119  			goto out;
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  120  		}
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  121  	}
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  122  
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  123  	/* Allocate a new domain and set it on device pasid. */
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  124  	domain = iommu_sva_domain_alloc(dev, mm);
80af5a45202422d drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-04-18  125  	if (IS_ERR(domain)) {
80af5a45202422d drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-04-18  126  		ret = PTR_ERR(domain);
9991a82a3817467 drivers/iommu/iommu-sva.c     Harshit Mogalapalli   2023-12-13  127  		goto out_free_handle;
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  128  	}
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  129  
14678219cf4093e drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  130  	ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
14678219cf4093e drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  131  					&handle->handle);
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  132  	if (ret)
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  133  		goto out_free_domain;
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  134  	domain->users = 1;
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  135  	list_add(&domain->next, &mm->iommu_mm->sva_domains);
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  136  
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  137  out:
6384c56c99d98c8 drivers/iommu/iommu-sva.c     Zhangfei Gao          2024-02-27  138  	refcount_set(&handle->users, 1);
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  139  	mutex_unlock(&iommu_sva_lock);
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  140  	handle->dev = dev;
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  141  	return handle;
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  142  
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  143  out_free_domain:
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  144  	iommu_domain_free(domain);
9991a82a3817467 drivers/iommu/iommu-sva.c     Harshit Mogalapalli   2023-12-13  145  out_free_handle:
092edaddb660376 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  146  	kfree(handle);
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  147  out_unlock:
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  148  	mutex_unlock(&iommu_sva_lock);
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  149  	return ERR_PTR(ret);
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  150  }
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  151  EXPORT_SYMBOL_GPL(iommu_sva_bind_device);
be51b1d6bbff48c drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  152  

:::::: The code at line 35 was first introduced by commit
:::::: 092edaddb660376648acb97678570ed5d8299768 iommu: Support mm PASID 1:n with sva domains

:::::: TO: Tina Zhang <tina.zhang@intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
