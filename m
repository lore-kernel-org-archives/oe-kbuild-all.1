Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EC4DDAB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 00:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762044909; cv=none; b=hXXPLm0eyULMFQHcVKGepb2U6CSz2kBJu0e8pNzep/wyl7LSdUwmCKHJi841sByvKgtJ+zEqPcBOov3ZQ+9u/cal4iIugkF336MfcdR/sFKmTtHVDiLoitZXotyP01RZSWiOSFZwxsbUsE60BkO4Fz4mGFfjnuEppp1Vc/uOOQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762044909; c=relaxed/simple;
	bh=kndo/ZN6X8iJEQZJJ+wTv0qqFi3AiZPclkVLrVIssxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qL30BT0NEPWxh9dPhExGmMioDZ3xXbzlqPGr2f/e7aHG7i1dIO0Y7i1Rptu+Q+1qCWzPw4NqL8Xhli8Ng4T8JmeOL+IiT4MgvcgIGEgxKL/5T0Br0tcBkqwjlxbVX1qufxA86ELZ8YpkjFen/Mgu9r5omfKRcWS/Cqk7h3jvfDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPkomcxa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPkomcxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762044907; x=1793580907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kndo/ZN6X8iJEQZJJ+wTv0qqFi3AiZPclkVLrVIssxI=;
  b=iPkomcxaniAgQf22YUrzk6Fet4zdJOfINl4G8ly0c1s2hhWCW+JREXLO
   c97YMJlynQZl81FyGt7zOqCzSFrJDsmJdG+redK6JiUdGGEeFF4VDZao/
   RqYV6C1N7yDnyqOWhUM/OUbgsjT0KDBVxhzj3+aJOqTN2C2pKXOEQUqk/
   7go+pBsB6PuLKDulUtdjthFOgDUemvxEjazjBwKtApaK6jKrq5OwuYiNa
   5HXjFQlP6T1Hx/dAY4f33ZcIicS3/KnSCsfT7/ARJie7td23ku6a9ADkD
   8V5CRDXsEIFfh5yS7GMJIiLOFWKUC1TVOQT5u1GxCKqrwpbvRFmN/HMMw
   w==;
X-CSE-ConnectionGUID: DxqN69DjTC2ExfxWY4hiFg==
X-CSE-MsgGUID: pUJd2EhoRtWHVEmuzl02Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="89628919"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="89628919"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 17:55:04 -0700
X-CSE-ConnectionGUID: R94b+dFzT4u7/zuIYcPSWA==
X-CSE-MsgGUID: niWJDRrtSXWLaJL4SKz5SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="186428326"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2025 17:55:03 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFMN3-000Oqm-0e;
	Sun, 02 Nov 2025 00:55:01 +0000
Date: Sun, 2 Nov 2025 08:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 include/linux/compiler_types.h:503:27: error: expression in static assertion
 is not an integer
Message-ID: <202511020842.Lji2igvJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   466c2e8b05b669749f758252b2db9ecc17dd1f29
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [1/1] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: arm64-randconfig-r132-20251102 (https://download.01.org/0day-ci/archive/20251102/202511020842.Lji2igvJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020842.Lji2igvJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020842.Lji2igvJ-lkp@intel.com/

All errors (new ones prefixed by >>):

                             ~~~~~~~~~~~~~~~~~~~~~^
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from arch/arm64/include/asm/cache.h:40,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/arm64/include/asm/processor.h:29,
                    from include/linux/sched.h:13,
                    from arch/arm64/include/asm/mmu_context.h:14,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     smp_store_release(&mm->iommu_mm, iommu_mm);
                            ^~~~~~~~
   arch/arm64/include/asm/barrier.h:134:18: note: in definition of macro '__smp_store_release'
     switch (sizeof(*p)) {      \
                     ^
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:137:13: error: invalid type argument of unary '*' (have 'int')
        : "=Q" (*__p)    \
                ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:143:13: error: invalid type argument of unary '*' (have 'int')
        : "=Q" (*__p)    \
                ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:149:13: error: invalid type argument of unary '*' (have 'int')
        : "=Q" (*__p)    \
                ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:155:13: error: invalid type argument of unary '*' (have 'int')
        : "=Q" (*__p)    \
                ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
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
   In file included from arch/arm64/include/asm/processor.h:28,
                    from include/linux/sched.h:13,
                    from arch/arm64/include/asm/mmu_context.h:14,
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
>> include/linux/compiler_types.h:503:27: error: expression in static assertion is not an integer
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
                    from arch/arm64/include/asm/rwonce.h:67,
                    from include/linux/compiler.h:390,
                    from arch/arm64/include/asm/mmu_context.h:13,
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
   In file included from include/linux/kernel.h:22,
                    from arch/arm64/include/asm/cpufeature.h:26,
                    from arch/arm64/include/asm/processor.h:39,
                    from include/linux/sched.h:13,
                    from arch/arm64/include/asm/mmu_context.h:14,
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
   In file included from arch/arm64/include/asm/processor.h:28,
                    from include/linux/sched.h:13,
                    from arch/arm64/include/asm/mmu_context.h:14,
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
>> include/linux/compiler_types.h:503:27: error: expression in static assertion is not an integer
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
                ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
     ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/random.h:8,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:17,
                    from arch/arm64/include/asm/cpufeature.h:27,
                    from arch/arm64/include/asm/processor.h:39,
                    from include/linux/sched.h:13,
                    from arch/arm64/include/asm/mmu_context.h:14,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c:114:35: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
                                      ^~~~~~~~
   include/linux/list.h:761:30: note: in definition of macro 'list_entry_is_head'
     list_is_head(&pos->member, (head))
                                 ^~~~
   drivers/iommu/iommu-sva.c:114:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
     ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:135:31: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     list_add(&domain->next, &mm->iommu_mm->sva_domains);
                                  ^~~~~~~~
                                  mm_mt
   drivers/iommu/iommu-sva.c: At top level:
   drivers/iommu/iommu-sva.c:161:6: error: redefinition of 'iommu_sva_unbind_device'
    void iommu_sva_unbind_device(struct iommu_sva *handle)
         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/iommu-sva.c:8:
   include/linux/iommu.h:1581:20: note: previous definition of 'iommu_sva_unbind_device' was here
    static inline void iommu_sva_unbind_device(struct iommu_sva *handle)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_unbind_device':
   drivers/iommu/iommu-sva.c:164:47: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     struct iommu_mm_data *iommu_mm = domain->mm->iommu_mm;
                                                  ^~~~~~~~
                                                  mm_mt
   drivers/iommu/iommu-sva.c: At top level:
   drivers/iommu/iommu-sva.c:183:5: error: redefinition of 'iommu_sva_get_pasid'
    u32 iommu_sva_get_pasid(struct iommu_sva *handle)
        ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/iommu-sva.c:8:
   include/linux/iommu.h:1585:19: note: previous definition of 'iommu_sva_get_pasid' was here
    static inline u32 iommu_sva_get_pasid(struct iommu_sva *handle)
                      ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:191:6: error: redefinition of 'mm_pasid_drop'
    void mm_pasid_drop(struct mm_struct *mm)
         ^~~~~~~~~~~~~
   In file included from drivers/iommu/iommu-sva.c:8:
   include/linux/iommu.h:1597:20: note: previous definition of 'mm_pasid_drop' was here
    static inline void mm_pasid_drop(struct mm_struct *mm) {}
                       ^~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c: In function 'mm_pasid_drop':
   drivers/iommu/iommu-sva.c:193:39: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     struct iommu_mm_data *iommu_mm = mm->iommu_mm;
                                          ^~~~~~~~
                                          mm_mt
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_iopf_handler':
   drivers/iommu/iommu-sva.c:287:29: error: 'struct iommu_fault_param' has no member named 'queue'
     if (!queue_work(fault_param->queue->wq, &group->work))
                                ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_domain_alloc':
   drivers/iommu/iommu-sva.c:299:10: error: 'const struct iommu_ops' has no member named 'domain_alloc_sva'
     if (!ops->domain_alloc_sva)
             ^~
   drivers/iommu/iommu-sva.c:302:14: error: 'const struct iommu_ops' has no member named 'domain_alloc_sva'
     domain = ops->domain_alloc_sva(dev, mm);
                 ^~
   In file included from drivers/iommu/iommu-sva.c:10:
   drivers/iommu/iommu-priv.h: In function 'dev_iommu_ops':
   drivers/iommu/iommu-priv.h:19:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +503 include/linux/compiler_types.h

eb111869301e15 Rasmus Villemoes 2019-09-13  501  
d15155824c5014 Will Deacon      2017-10-24  502  /* Are two types/vars the same type (ignoring qualifiers)? */
d15155824c5014 Will Deacon      2017-10-24 @503  #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
d15155824c5014 Will Deacon      2017-10-24  504  

:::::: The code at line 503 was first introduced by commit
:::::: d15155824c5014803d91b829736d249c500bdda6 linux/compiler.h: Split into compiler.h and compiler_types.h

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
