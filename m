Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32086313E17
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765874178; cv=none; b=jdNpnjE/8eMxQOyEhDfxLruzcqvmLAf0OYbJvb/Yq9YCbU3ZSggWArRIm5HwBysPriDUMQHNcjDgwFk/7tCNqDW15PD4/CMgTmxJVEkajtF8FlAewr9aGPmyMdz2B4UIvWzHtbzDap7pjPznhqF8kb30WjB0PNSRYYBHtSMh5ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765874178; c=relaxed/simple;
	bh=87PaCicSd6xn0SwIwB/BgWv9yXXvUyiAhTz/vW0oCho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aKbWcuTpMgJwymPQQJkMIxIVj3YxHbFDrK7vXuuAXcI4sMr/OAmNOzphc12eD4UYSddT0rqAKdmMeNxMdIKxHS2tWowQOU9Vy6RM/aLlTEsBHLiJJNKiPuN1AGOn3IlNbIVs5ZZO+lYJcK3n3KFp/me1HQKwQFRawuuFbAsnmxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnAX/hOX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnAX/hOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765874169; x=1797410169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=87PaCicSd6xn0SwIwB/BgWv9yXXvUyiAhTz/vW0oCho=;
  b=AnAX/hOXrFQX0YkrvFYYKLwg6Hd8VKFaF8u+/IVlM7KnYJTHG4fIaS2G
   LYO2DW/mYWsbpwT4qowJqXdrD1uVKQb54thO9qIR4ZSRDi1ZhNbbcczng
   vqKjXvkCd4XJhFolHTZp3ZULow7frHj91HTKQW3x3ne8SRp1subHMQVm6
   XBEsQYaEhlLIjggOy8C6JVrh1bfqa2+du+O/TEzKAWn42e98gVSk8Ok1D
   +4PDtvP+r1lcoP6NnUawwB6LBO8B1P1YKmraLSHwjbqEqlW7ubSpy03I2
   hCQIeac3/C0VsW9ut/O3LAyfP/h2FdQo1yriJHk/lX+uqBARqf8GBmMo1
   Q==;
X-CSE-ConnectionGUID: uZlYyA7AQ1uCerHpYn8dow==
X-CSE-MsgGUID: jJ6uuk15TSeE7AdIthaIwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67541748"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67541748"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 00:36:00 -0800
X-CSE-ConnectionGUID: v+bdCzEcTq6b9Uf1iiMIxQ==
X-CSE-MsgGUID: jzeAhNRiT2iGQMYlKsPcPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202871373"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 16 Dec 2025 00:35:58 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVQXE-000000001N0-0p5I;
	Tue, 16 Dec 2025 08:35:56 +0000
Date: Tue, 16 Dec 2025 16:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 9/9] drivers/iommu/iommu-sva.c:35:18:
 warning: assignment to 'struct iommu_mm_data *' from 'int' makes pointer
 from integer without a cast
Message-ID: <202512161650.SOyKtXjN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Isaac,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   84781c9aae0b28354d6f3d870d42b30f0443151d
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [9/9] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: arm-randconfig-r071-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161650.SOyKtXjN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161650.SOyKtXjN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161650.SOyKtXjN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-sva.c:10:
   drivers/iommu/iommu-priv.h: In function 'dev_iommu_ops':
   drivers/iommu/iommu-priv.h:18:26: error: invalid use of undefined type 'struct dev_iommu'
      18 |         return dev->iommu->iommu_dev->ops;
         |                          ^~
   drivers/iommu/iommu-priv.h: In function 'iommu_fwspec_ops':
   drivers/iommu/iommu-priv.h:27:53: error: 'struct iommu_fwspec' has no member named 'iommu_fwnode'
      27 |         return iommu_ops_from_fwnode(fwspec ? fwspec->iommu_fwnode : NULL);
         |                                                     ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_alloc_mm_data':
   drivers/iommu/iommu-sva.c:27:22: error: 'struct mm_struct' has no member named 'iommu_mm'
      27 |         iommu_mm = mm->iommu_mm;
         |                      ^~
   drivers/iommu/iommu-sva.c:30:29: error: invalid use of undefined type 'struct iommu_mm_data'
      30 |                 if (iommu_mm->pasid >= dev->iommu->max_pasids)
         |                             ^~
   drivers/iommu/iommu-sva.c:30:50: error: invalid use of undefined type 'struct dev_iommu'
      30 |                 if (iommu_mm->pasid >= dev->iommu->max_pasids)
         |                                                  ^~
   In file included from include/linux/percpu.h:5,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from arch/arm/include/asm/mmu_context.h:15,
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
>> drivers/iommu/iommu-sva.c:35:18: warning: assignment to 'struct iommu_mm_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      35 |         iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
         |                  ^
   drivers/iommu/iommu-sva.c:44:17: error: invalid use of undefined type 'struct iommu_mm_data'
      44 |         iommu_mm->pasid = pasid;
         |                 ^~
   drivers/iommu/iommu-sva.c:45:33: error: invalid use of undefined type 'struct iommu_mm_data'
      45 |         INIT_LIST_HEAD(&iommu_mm->sva_domains);
         |                                 ^~
   In file included from <command-line>:
   drivers/iommu/iommu-sva.c:51:30: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |                              ^~
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:197:9: note: in expansion of macro 'WRITE_ONCE'
     197 |         WRITE_ONCE(*p, v);                                              \
         |         ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:30: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |                              ^~
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:197:9: note: in expansion of macro 'WRITE_ONCE'
     197 |         WRITE_ONCE(*p, v);                                              \
         |         ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:30: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |                              ^~
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:197:9: note: in expansion of macro 'WRITE_ONCE'
     197 |         WRITE_ONCE(*p, v);                                              \
         |         ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:30: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |                              ^~
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:197:9: note: in expansion of macro 'WRITE_ONCE'
--
         |                   ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/iommu-sva.c:8:
   include/linux/iommu.h:1576:1: note: previous definition of 'iommu_sva_bind_device' with type 'struct iommu_sva *(struct device *, struct mm_struct *)'
    1576 | iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_bind_device':
   drivers/iommu/iommu-sva.c:90:64: error: invalid use of undefined type 'struct iommu_mm_data'
      90 |         attach_handle = iommu_attach_handle_get(group, iommu_mm->pasid, IOMMU_DOMAIN_SVA);
         |                                                                ^~
   In file included from include/linux/bitfield.h:10,
                    from arch/arm/include/asm/ptrace.h:13,
                    from arch/arm/include/asm/processor.h:14,
                    from include/linux/sched.h:13,
                    from arch/arm/include/asm/mmu_context.h:14:
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
   include/linux/compiler_types.h:503:27: error: expression in static assertion is not an integer
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
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26:
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
>> drivers/iommu/iommu-sva.c:107:16: warning: assignment to 'struct iommu_sva *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     107 |         handle = kzalloc(sizeof(*handle), GFP_KERNEL);
         |                ^
   In file included from include/linux/list.h:5,
                    from arch/arm/include/asm/traps.h:6,
                    from arch/arm/include/asm/thread_info.h:43,
                    from include/linux/thread_info.h:60,
                    from include/linux/sched.h:14:
   drivers/iommu/iommu-sva.c:114:40: error: 'struct mm_struct' has no member named 'iommu_mm'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                        ^~
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
   drivers/iommu/iommu-sva.c:114:40: error: 'struct mm_struct' has no member named 'iommu_mm'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                        ^~
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
   drivers/iommu/iommu-sva.c:114:40: error: 'struct mm_struct' has no member named 'iommu_mm'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                        ^~
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
   include/linux/compiler_types.h:503:27: error: expression in static assertion is not an integer
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
   drivers/iommu/iommu-sva.c:114:40: error: 'struct mm_struct' has no member named 'iommu_mm'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                        ^~
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
   drivers/iommu/iommu-sva.c:135:36: error: 'struct mm_struct' has no member named 'iommu_mm'
     135 |         list_add(&domain->next, &mm->iommu_mm->sva_domains);
         |                                    ^~
   drivers/iommu/iommu-sva.c:138:29: error: invalid use of undefined type 'struct iommu_sva'
     138 |         refcount_set(&handle->users, 1);
         |                             ^~
   drivers/iommu/iommu-sva.c:140:15: error: invalid use of undefined type 'struct iommu_sva'
     140 |         handle->dev = dev;
         |               ^~
   drivers/iommu/iommu-sva.c: At top level:
   drivers/iommu/iommu-sva.c:161:6: error: redefinition of 'iommu_sva_unbind_device'
     161 | void iommu_sva_unbind_device(struct iommu_sva *handle)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iommu.h:1581:20: note: previous definition of 'iommu_sva_unbind_device' with type 'void(struct iommu_sva *)'
    1581 | static inline void iommu_sva_unbind_device(struct iommu_sva *handle)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_unbind_device':
   drivers/iommu/iommu-sva.c:163:45: error: invalid use of undefined type 'struct iommu_sva'
     163 |         struct iommu_domain *domain = handle->handle.domain;
         |                                             ^~
   drivers/iommu/iommu-sva.c:164:52: error: 'struct mm_struct' has no member named 'iommu_mm'
     164 |         struct iommu_mm_data *iommu_mm = domain->mm->iommu_mm;
         |                                                    ^~
   drivers/iommu/iommu-sva.c:165:36: error: invalid use of undefined type 'struct iommu_sva'
     165 |         struct device *dev = handle->dev;
         |                                    ^~
   drivers/iommu/iommu-sva.c:168:43: error: invalid use of undefined type 'struct iommu_sva'
     168 |         if (!refcount_dec_and_test(&handle->users)) {
         |                                           ^~
   drivers/iommu/iommu-sva.c:173:56: error: invalid use of undefined type 'struct iommu_mm_data'
     173 |         iommu_detach_device_pasid(domain, dev, iommu_mm->pasid);
         |                                                        ^~
   drivers/iommu/iommu-sva.c: At top level:
   drivers/iommu/iommu-sva.c:183:5: error: redefinition of 'iommu_sva_get_pasid'
     183 | u32 iommu_sva_get_pasid(struct iommu_sva *handle)
         |     ^~~~~~~~~~~~~~~~~~~
   include/linux/iommu.h:1585:19: note: previous definition of 'iommu_sva_get_pasid' with type 'u32(struct iommu_sva *)' {aka 'unsigned int(struct iommu_sva *)'}
    1585 | static inline u32 iommu_sva_get_pasid(struct iommu_sva *handle)
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_get_pasid':
   drivers/iommu/iommu-sva.c:185:45: error: invalid use of undefined type 'struct iommu_sva'
     185 |         struct iommu_domain *domain = handle->handle.domain;
         |                                             ^~
   drivers/iommu/iommu-sva.c: At top level:
   drivers/iommu/iommu-sva.c:191:6: error: redefinition of 'mm_pasid_drop'
     191 | void mm_pasid_drop(struct mm_struct *mm)
         |      ^~~~~~~~~~~~~
   include/linux/iommu.h:1597:20: note: previous definition of 'mm_pasid_drop' with type 'void(struct mm_struct *)'
    1597 | static inline void mm_pasid_drop(struct mm_struct *mm) {}
         |                    ^~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c: In function 'mm_pasid_drop':
   drivers/iommu/iommu-sva.c:193:44: error: 'struct mm_struct' has no member named 'iommu_mm'
     193 |         struct iommu_mm_data *iommu_mm = mm->iommu_mm;
         |                                            ^~
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
>> drivers/iommu/iommu-priv.h:19:1: warning: control reaches end of non-void function [-Wreturn-type]
      19 | }
         | ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +35 drivers/iommu/iommu-sva.c

cfc78dfd9b36dc drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   11  
cfc78dfd9b36dc drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   12  static DEFINE_MUTEX(iommu_sva_lock);
b5c29fba72a6c9 drivers/iommu/iommu-sva.c     Lu Baolu              2024-05-28   13  static struct iommu_domain *iommu_sva_domain_alloc(struct device *dev,
b5c29fba72a6c9 drivers/iommu/iommu-sva.c     Lu Baolu              2024-05-28   14  						   struct mm_struct *mm);
cfc78dfd9b36dc drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   15  
4e14176ab13fb6 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2023-03-22   16  /* Allocate a PASID for the mm within range (inclusive) */
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   17  static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct device *dev)
cfc78dfd9b36dc drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   18  {
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   19  	struct iommu_mm_data *iommu_mm;
2dcebc7ddce7ff drivers/iommu/iommu-sva.c     Jacob Pan             2023-08-09   20  	ioasid_t pasid;
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   21  
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   22  	lockdep_assert_held(&iommu_sva_lock);
cfc78dfd9b36dc drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   23  
23e5d9ec2bab53 drivers/iommu/iommu-sva.c     Kirill A. Shutemov    2023-03-12   24  	if (!arch_pgtable_dma_compat(mm))
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   25  		return ERR_PTR(-EBUSY);
23e5d9ec2bab53 drivers/iommu/iommu-sva.c     Kirill A. Shutemov    2023-03-12   26  
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   27  	iommu_mm = mm->iommu_mm;
701fac40384f07 drivers/iommu/iommu-sva-lib.c Fenghua Yu            2022-02-07   28  	/* Is a PASID already associated with this mm? */
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   29  	if (iommu_mm) {
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   30  		if (iommu_mm->pasid >= dev->iommu->max_pasids)
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   31  			return ERR_PTR(-EOVERFLOW);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   32  		return iommu_mm;
701fac40384f07 drivers/iommu/iommu-sva-lib.c Fenghua Yu            2022-02-07   33  	}
701fac40384f07 drivers/iommu/iommu-sva-lib.c Fenghua Yu            2022-02-07   34  
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  @35  	iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   36  	if (!iommu_mm)
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   37  		return ERR_PTR(-ENOMEM);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   38  
2dcebc7ddce7ff drivers/iommu/iommu-sva.c     Jacob Pan             2023-08-09   39  	pasid = iommu_alloc_global_pasid(dev);
2dcebc7ddce7ff drivers/iommu/iommu-sva.c     Jacob Pan             2023-08-09   40  	if (pasid == IOMMU_PASID_INVALID) {
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   41  		kfree(iommu_mm);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   42  		return ERR_PTR(-ENOSPC);
2dcebc7ddce7ff drivers/iommu/iommu-sva.c     Jacob Pan             2023-08-09   43  	}
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   44  	iommu_mm->pasid = pasid;
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   45  	INIT_LIST_HEAD(&iommu_mm->sva_domains);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   46  	/*
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   47  	 * Make sure the write to mm->iommu_mm is not reordered in front of
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   48  	 * initialization to iommu_mm fields. If it does, readers may see a
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   49  	 * valid iommu_mm with uninitialized values.
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   50  	 */
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   51  	smp_store_release(&mm->iommu_mm, iommu_mm);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   52  	return iommu_mm;
cfc78dfd9b36dc drivers/iommu/iommu-sva-lib.c Jean-Philippe Brucker 2020-11-06   53  }
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   54  
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   55  /**
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   56   * iommu_sva_bind_device() - Bind a process address space to a device
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   57   * @dev: the device
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   58   * @mm: the mm to bind, caller must hold a reference to mm_users
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   59   *
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   60   * Create a bond between device and address space, allowing the device to
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   61   * access the mm using the PASID returned by iommu_sva_get_pasid(). If a
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   62   * bond already exists between @device and @mm, an additional internal
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   63   * reference is taken. Caller must call iommu_sva_unbind_device()
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   64   * to release each reference.
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   65   *
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   66   * On error, returns an ERR_PTR value.
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   67   */
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   68  struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   69  {
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   70  	struct iommu_group *group = dev->iommu_group;
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   71  	struct iommu_attach_handle *attach_handle;
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   72  	struct iommu_mm_data *iommu_mm;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   73  	struct iommu_domain *domain;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   74  	struct iommu_sva *handle;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   75  	int ret;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   76  
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   77  	if (!group)
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   78  		return ERR_PTR(-ENODEV);
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   79  
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   80  	mutex_lock(&iommu_sva_lock);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   81  
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   82  	/* Allocate mm->pasid if necessary. */
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   83  	iommu_mm = iommu_alloc_mm_data(mm, dev);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   84  	if (IS_ERR(iommu_mm)) {
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   85  		ret = PTR_ERR(iommu_mm);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   86  		goto out_unlock;
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27   87  	}
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31   88  
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   89  	/* A bond already exists, just take a reference`. */
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   90  	attach_handle = iommu_attach_handle_get(group, iommu_mm->pasid, IOMMU_DOMAIN_SVA);
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   91  	if (!IS_ERR(attach_handle)) {
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   92  		handle = container_of(attach_handle, struct iommu_sva, handle);
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   93  		if (attach_handle->domain->mm != mm) {
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   94  			ret = -EBUSY;
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   95  			goto out_unlock;
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02   96  		}
65d4418c5002ec drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22   97  		refcount_inc(&handle->users);
65d4418c5002ec drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22   98  		mutex_unlock(&iommu_sva_lock);
65d4418c5002ec drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22   99  		return handle;
65d4418c5002ec drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22  100  	}
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  101  
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  102  	if (PTR_ERR(attach_handle) != -ENOENT) {
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  103  		ret = PTR_ERR(attach_handle);
3e7f57d1ef3f5f drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  104  		goto out_unlock;
65d4418c5002ec drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22  105  	}
65d4418c5002ec drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-02-22  106  
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31 @107  	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  108  	if (!handle) {
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  109  		ret = -ENOMEM;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  110  		goto out_unlock;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  111  	}
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  112  
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  113  	/* Search for an existing domain. */
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  114  	list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
14678219cf4093 drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  115  		ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
14678219cf4093 drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  116  						&handle->handle);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  117  		if (!ret) {
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  118  			domain->users++;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  119  			goto out;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  120  		}
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  121  	}
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  122  
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  123  	/* Allocate a new domain and set it on device pasid. */
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  124  	domain = iommu_sva_domain_alloc(dev, mm);
80af5a45202422 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-04-18  125  	if (IS_ERR(domain)) {
80af5a45202422 drivers/iommu/iommu-sva.c     Jason Gunthorpe       2024-04-18  126  		ret = PTR_ERR(domain);
9991a82a381746 drivers/iommu/iommu-sva.c     Harshit Mogalapalli   2023-12-13  127  		goto out_free_handle;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  128  	}
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  129  
14678219cf4093 drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  130  	ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
14678219cf4093 drivers/iommu/iommu-sva.c     Lu Baolu              2024-07-02  131  					&handle->handle);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  132  	if (ret)
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  133  		goto out_free_domain;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  134  	domain->users = 1;
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  135  	list_add(&domain->next, &mm->iommu_mm->sva_domains);
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  136  
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  137  out:
6384c56c99d98c drivers/iommu/iommu-sva.c     Zhangfei Gao          2024-02-27  138  	refcount_set(&handle->users, 1);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  139  	mutex_unlock(&iommu_sva_lock);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  140  	handle->dev = dev;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  141  	return handle;
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  142  
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  143  out_free_domain:
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  144  	iommu_domain_free(domain);
9991a82a381746 drivers/iommu/iommu-sva.c     Harshit Mogalapalli   2023-12-13  145  out_free_handle:
092edaddb66037 drivers/iommu/iommu-sva.c     Tina Zhang            2023-10-27  146  	kfree(handle);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  147  out_unlock:
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  148  	mutex_unlock(&iommu_sva_lock);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  149  	return ERR_PTR(ret);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  150  }
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  151  EXPORT_SYMBOL_GPL(iommu_sva_bind_device);
be51b1d6bbff48 drivers/iommu/iommu-sva-lib.c Lu Baolu              2022-10-31  152  

:::::: The code at line 35 was first introduced by commit
:::::: 092edaddb660376648acb97678570ed5d8299768 iommu: Support mm PASID 1:n with sva domains

:::::: TO: Tina Zhang <tina.zhang@intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
