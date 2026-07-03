Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BA133EC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 16:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095009; cv=none; b=qPm9yreAnax0uzPt96pg+94aVPcCLdLKNXb4mtNy/wSXM0fkbNI+TcAALCKGOdek9ZFT8pm3vlWCnu1TRAASihg3031i7a0zXWqQfzFUKy01FZbJziDcb4+vg1OB2ak3LeRUQqbd7kIRhQKkGB2CYECTMdVzGdSFRY262dCqqy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095009; c=relaxed/simple;
	bh=GpRMgDpN4I0QoVqKocop8Ne3BfV8AL7OvUD1mKBqu5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b/TkkQOxuJfEFrFOu2yMk3L+pRLryP4Ca177sZPdYgfCqqNSQcU9zfOCB5M50Un16VC6+FpzK5BH8zbCRfv0wJsOcdKFoeDV3tB8DwS9fWuScckEWfuZiDpu+mb+5iCoaVHaLIAB7HvXDWuL/dRYm6fw4yimraAODcxKL9rrI/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFWAYjYX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFWAYjYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783095007; x=1814631007;
  h=date:from:to:cc:subject:message-id;
  bh=GpRMgDpN4I0QoVqKocop8Ne3BfV8AL7OvUD1mKBqu5Q=;
  b=bFWAYjYXfZrlMeRWGM94UgbB2+asckjo+JxDkzC+CzNmar6f6Mpsa65Q
   VG/LglaO77BSDdQfmf2qOg05Fa0erOjsNkiRvVJ9f292lIhzO/PvbyWMo
   sGIz1pRmswAhR9G18XKCiteAVEz3lysx+10tAw12ZCpCW09SNn6NZyC6Q
   yPPTAuDk9eJDTMKSULj6EQvL0DCOpB+4OmIaxPkVt3s68bQ1Ehmj35OFv
   g6KGpYBE5r0Q4do4Z6ypqHsVhaKyTkHVy2mdqhKCn9M4p0yX/XIFqUu+q
   lDi9IZNte3y7RUyHvfRir6GJzD5/rAlmtL36OefL9PEem3n37StMA1Onu
   w==;
X-CSE-ConnectionGUID: hEHiq0GuTbyCOjHPU67C1w==
X-CSE-MsgGUID: njzd/xoUQXmfKgtiH8ZAog==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87675507"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="87675507"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 09:10:07 -0700
X-CSE-ConnectionGUID: JW757Ef8SNCnKPNr10zxPg==
X-CSE-MsgGUID: MR5jwlJtTcKVYVO5KbCm2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="252675913"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 03 Jul 2026 09:10:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfgSk-00000000CKd-2Kpd;
	Fri, 03 Jul 2026 16:09:59 +0000
Date: Sat, 04 Jul 2026 00:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 drivers/iommu/iommu-priv.h:18:19: error: dereferencing pointer to incomplete
 type 'struct dev_iommu'
Message-ID: <202607032352.RnUqF9Kg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   732214c26ef1c70d01d0897b033e20952de6ab4b
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [1/1] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: arm-randconfig-r061-20260703 (https://download.01.org/0day-ci/archive/20260703/202607032352.RnUqF9Kg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607032352.RnUqF9Kg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607032352.RnUqF9Kg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-sva.c:10:
   drivers/iommu/iommu-priv.h: In function 'dev_iommu_ops':
>> drivers/iommu/iommu-priv.h:18:19: error: dereferencing pointer to incomplete type 'struct dev_iommu'
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
>> drivers/iommu/iommu-sva.c:30:15: error: dereferencing pointer to incomplete type 'struct iommu_mm_data'
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
   drivers/iommu/iommu-sva.c:35:11: warning: assignment to 'struct iommu_mm_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
--
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
   include/asm-generic/rwonce.h:60:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:197:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(*p, v);      \
     ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:390,
                    from arch/arm/include/asm/mmu_context.h:13,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     smp_store_release(&mm->iommu_mm, iommu_mm);
                            ^~~~~~~~
   include/asm-generic/rwonce.h:55:20: note: in definition of macro '__WRITE_ONCE'
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
>> include/linux/container_of.h:20:28: error: dereferencing pointer to incomplete type 'struct iommu_attach_handle'
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
>> include/linux/container_of.h:20:47: error: dereferencing pointer to incomplete type 'struct iommu_sva'
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
   drivers/iommu/iommu-sva.c:107:9: warning: assignment to 'struct iommu_sva *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]


vim +18 drivers/iommu/iommu-priv.h

addb665924f39f Nicolin Chen 2023-07-17   9  
92766e1b953d6e Yi Liu       2023-08-18  10  static inline const struct iommu_ops *dev_iommu_ops(struct device *dev)
92766e1b953d6e Yi Liu       2023-08-18  11  {
92766e1b953d6e Yi Liu       2023-08-18  12  	/*
92766e1b953d6e Yi Liu       2023-08-18  13  	 * Assume that valid ops must be installed if iommu_probe_device()
92766e1b953d6e Yi Liu       2023-08-18  14  	 * has succeeded. The device ops are essentially for internal use
92766e1b953d6e Yi Liu       2023-08-18  15  	 * within the IOMMU subsystem itself, so we should be able to trust
92766e1b953d6e Yi Liu       2023-08-18  16  	 * ourselves not to misuse the helper.
92766e1b953d6e Yi Liu       2023-08-18  17  	 */
92766e1b953d6e Yi Liu       2023-08-18 @18  	return dev->iommu->iommu_dev->ops;
92766e1b953d6e Yi Liu       2023-08-18  19  }
92766e1b953d6e Yi Liu       2023-08-18  20  

:::::: The code at line 18 was first introduced by commit
:::::: 92766e1b953d6e419684b39f55dab574287dd144 iommu: Move dev_iommu_ops() to private header

:::::: TO: Yi Liu <yi.l.liu@intel.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
