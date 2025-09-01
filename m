Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B077B32F74F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 19:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755005; cv=none; b=Muxiw22YQOSk0XFKzpbSrVasJAPnnbCkwOtLG3bCzW84/2vo4V7T00vmjYIbifD0HTpDsW7THRrviHQ2OBvCY6UKbHUNPMmVQ6/TWKy6Ixd2RoTlHJVW24VX9C+1pnLyod/KvHmaHiZXfIXPqT2cBDwWOIPwVDWtBTHLUi9HTtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755005; c=relaxed/simple;
	bh=LGnofsoxvyAmV46N8479ptssSQvF1YD2WehOJrIvZBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=msgdRetsNwIlgPutVgKEiGmC4+JJqsoy32NPiQLnyJUxHadpercU+6OCjHWceAl6UOR3vziVnOzHTRzIhRjbo2yFcT+mtlmo4TSw12v4rsbot0MolKlAprC13szNVTg5m/Xx1M0OhZt3jQjIeVQGvKlRQ7/vrbqP8V+EleLFmMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuUkndGz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuUkndGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756755003; x=1788291003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LGnofsoxvyAmV46N8479ptssSQvF1YD2WehOJrIvZBs=;
  b=cuUkndGz0Obc8qVGp2V49wKKs/Cl0+l0ZfyErjFofIetB3u0k71BLg6r
   ZY4NGXYed6E+4AygTuLTarUW2/N83RY5EKxpeYrSjOBAKzNjzQrm612FN
   yyJSlK8msYqldae5ZNkFqE9oiYw+5gzYn2823vdvBmDLhyZRnaPkpbvZr
   y3/mhv0RkVhcF0SFI96yU79pKW5cXN9XiH08RFHbLcyDsYX4p/Kc5+me/
   d3BUY8xswqywWQVqv86AY/E2xx1pgckBLULm3wje3mFAZ1y4r0CeD9OSj
   lOB/CXBMtN1md41B63z51tC0fUjTI9kvJLKX7ledZQmrCa6KIAOEwH+A7
   Q==;
X-CSE-ConnectionGUID: swSxr8XOSayoiV/Ig0Na1A==
X-CSE-MsgGUID: BXL9RejeSMmAjz0VnjgEzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="46596979"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="46596979"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 12:30:02 -0700
X-CSE-ConnectionGUID: ML16hXOTTx++R14V73xnSg==
X-CSE-MsgGUID: 0L+Lz7c8QCueSMXcrRZf8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171059748"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Sep 2025 12:30:01 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utAE2-0000y7-2m;
	Mon, 01 Sep 2025 19:29:58 +0000
Date: Tue, 2 Sep 2025 03:29:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1]
 drivers/iommu/iommu-priv.h:27:53: error: 'struct iommu_fwspec' has no member
 named 'iommu_fwnode'
Message-ID: <202509020352.VFHqEmY2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   49a559b9a6890943c3e83620879f1c577d80303c
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [1/1] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: arm-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509020352.VFHqEmY2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020352.VFHqEmY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020352.VFHqEmY2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-sva.c:10:
   drivers/iommu/iommu-priv.h: In function 'dev_iommu_ops':
   drivers/iommu/iommu-priv.h:18:26: error: invalid use of undefined type 'struct dev_iommu'
      18 |         return dev->iommu->iommu_dev->ops;
         |                          ^~
   drivers/iommu/iommu-priv.h: In function 'iommu_fwspec_ops':
>> drivers/iommu/iommu-priv.h:27:53: error: 'struct iommu_fwspec' has no member named 'iommu_fwnode'
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
>> drivers/iommu/iommu-sva.c:35:18: error: assignment to 'struct iommu_mm_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:197:9: note: in expansion of macro 'WRITE_ONCE'
     197 |         WRITE_ONCE(*p, v);                                              \
         |         ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:390,
                    from arch/arm/include/asm/mmu_context.h:13:
   drivers/iommu/iommu-sva.c:51:30: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |                              ^~
   include/asm-generic/rwonce.h:55:27: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                           ^
   include/asm-generic/barrier.h:197:9: note: in expansion of macro 'WRITE_ONCE'
     197 |         WRITE_ONCE(*p, v);                                              \
         |         ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:30: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |                              ^~
   include/asm-generic/rwonce.h:55:34: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                  ^
   include/asm-generic/barrier.h:197:9: note: in expansion of macro 'WRITE_ONCE'
     197 |         WRITE_ONCE(*p, v);                                              \
         |         ^~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c: At top level:
   drivers/iommu/iommu-sva.c:68:19: error: redefinition of 'iommu_sva_bind_device'
      68 | struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
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
>> drivers/iommu/iommu-sva.c:107:16: error: assignment to 'struct iommu_sva *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +27 drivers/iommu/iommu-priv.h

3f7c320916282c Robin Murphy 2024-07-02  24  
3e36c15fc1cce6 Robin Murphy 2024-07-02  25  static inline const struct iommu_ops *iommu_fwspec_ops(struct iommu_fwspec *fwspec)
3e36c15fc1cce6 Robin Murphy 2024-07-02  26  {
3e36c15fc1cce6 Robin Murphy 2024-07-02 @27  	return iommu_ops_from_fwnode(fwspec ? fwspec->iommu_fwnode : NULL);
3e36c15fc1cce6 Robin Murphy 2024-07-02  28  }
3e36c15fc1cce6 Robin Murphy 2024-07-02  29  

:::::: The code at line 27 was first introduced by commit
:::::: 3e36c15fc1cce65cccc93ed16f86d8ff9d2f9992 iommu: Remove iommu_fwspec ops

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
