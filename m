Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB130CDB3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 03:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756350919; cv=none; b=TdRnN7Jdh8nJAuJYMe5jVeJQVgc+Y5c235CB3LG13zC5gZQbnegTNm5om7aTJD0eSC3RyzdVP3DoHUZGXz8xy8ZodSvgklqbwtBysW+54O1mO68xGFIBYNMKkzTZ6rVb8WtqrIvG2a5PRgKOwxhJK+BYg+svdQI5nweCUUCwDNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756350919; c=relaxed/simple;
	bh=V9fK2viCxuRwYRtfJAcYP2bEPMsZ9rI1j1m/rT8Hfsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s5To76U657GN4HPQslgG+8j/tcLcOjFM2eP01qj0suW9TOTVR/PmReDJgVyyfjjZygWa3CbWy0dSoMw+TqU+6xcGfzg4EP+i94/6kP19VXY8QdPzkPEOHYHcJUn43hO7u+Myjs88WijCzn5CEew9iccxfKLT4/ZpWrhCj+913L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0KyLQ5u; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0KyLQ5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756350917; x=1787886917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V9fK2viCxuRwYRtfJAcYP2bEPMsZ9rI1j1m/rT8Hfsw=;
  b=a0KyLQ5usyobsEpT2Ju68740nxxturetTwd+SbqmnXuFCdxt62NBdZyl
   G7MeiQDsbkBeHayvhXzHDMALaGwkagA0yrrqZkT1Mvdtkk/Ytwns5tX4n
   cMKhLbLSGqqITYxH6lwTjpKNkp/Z2ue0WtBLkVtviXz8w6w3ne2zmh0xv
   FZjKEU/xsnh8NMkDwWrQSutLBZ884wyU1i4eGHv8Pc1OGCq9ENP4TxDtx
   p8iH0SwQvkQ1fRRAGATafrx9WmJn/q8F14LLRFS3fPsZDXm3MkfZHGWE5
   QakU5kblIhk+Lz1Ctl426JD0+TmF9Iv80q+hfm/pEw2EBZlNl82YbI0r+
   w==;
X-CSE-ConnectionGUID: VPHDxWcjSbm5BulLM8o3VQ==
X-CSE-MsgGUID: I7mKZIYjR3OS00lHCMuM7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="61246616"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="61246616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 20:15:14 -0700
X-CSE-ConnectionGUID: F15rJr7tSAqavFxDS466DQ==
X-CSE-MsgGUID: Zi7GVnEyRDmNfB4kcIDgIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170808496"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Aug 2025 20:15:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urT6U-000TOl-2J;
	Thu, 28 Aug 2025 03:15:10 +0000
Date: Thu, 28 Aug 2025 11:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 2/2]
 arch/arm64/include/asm/barrier.h:133:27: warning: passing argument 1 of
 '__kasan_check_write' makes pointer from integer without a cast
Message-ID: <202508281121.bwVWr5oM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   2442fc90e70394733767fa570c5d47b1f5e0ca25
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [2/2] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: arm64-randconfig-r133-20250827 (https://download.01.org/0day-ci/archive/20250828/202508281121.bwVWr5oM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250828/202508281121.bwVWr5oM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508281121.bwVWr5oM-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:548:17: note: in expansion of macro 'if'
     548 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:556:9: note: in expansion of macro '__compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:9: note: in expansion of macro 'compiletime_assert'
     571 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:28: note: in expansion of macro '__native_word'
     571 |         compiletime_assert(__native_word(t),                            \
         |                            ^~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:132:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     132 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:30: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |                              ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:548:17: note: in expansion of macro 'if'
     548 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:556:9: note: in expansion of macro '__compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:9: note: in expansion of macro 'compiletime_assert'
     571 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:28: note: in expansion of macro '__native_word'
     571 |         compiletime_assert(__native_word(t),                            \
         |                            ^~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:132:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     132 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:30: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |                              ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:548:17: note: in expansion of macro 'if'
     548 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:556:9: note: in expansion of macro '__compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:9: note: in expansion of macro 'compiletime_assert'
     571 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:28: note: in expansion of macro '__native_word'
     571 |         compiletime_assert(__native_word(t),                            \
         |                            ^~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:132:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     132 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:30: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |                              ^~
   arch/arm64/include/asm/barrier.h:133:40: note: in definition of macro '__smp_store_release'
     133 |         kasan_check_write(__p, sizeof(*p));                             \
         |                                        ^
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/barrier.h:133:27: warning: passing argument 1 of '__kasan_check_write' makes pointer from integer without a cast [-Wint-conversion]
     133 |         kasan_check_write(__p, sizeof(*p));                             \
         |                           ^~~
         |                           |
         |                           int
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/rwonce.h:26,
                    from arch/arm64/include/asm/rwonce.h:67,
                    from include/linux/compiler.h:390:
   include/linux/kasan-checks.h:20:47: note: expected 'const volatile void *' but argument is of type 'int'
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |                          ~~~~~~~~~~~~~~~~~~~~~^
   drivers/iommu/iommu-sva.c:51:30: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |                              ^~
   arch/arm64/include/asm/barrier.h:134:25: note: in definition of macro '__smp_store_release'
     134 |         switch (sizeof(*p)) {                                           \
         |                         ^
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:137:41: error: invalid type argument of unary '*' (have 'int')
     137 |                                 : "=Q" (*__p)                           \
         |                                         ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:143:41: error: invalid type argument of unary '*' (have 'int')
     143 |                                 : "=Q" (*__p)                           \
         |                                         ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:149:41: error: invalid type argument of unary '*' (have 'int')
     149 |                                 : "=Q" (*__p)                           \
         |                                         ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:9: note: in expansion of macro 'smp_store_release'
      51 |         smp_store_release(&mm->iommu_mm, iommu_mm);
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:155:41: error: invalid type argument of unary '*' (have 'int')
     155 |                                 : "=Q" (*__p)                           \
         |                                         ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
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
   In file included from include/linux/kernel.h:22,
                    from arch/arm64/include/asm/cpufeature.h:26,
                    from arch/arm64/include/asm/processor.h:39:
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_bind_device':
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
   In file included from arch/arm64/include/asm/processor.h:28:
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +/__kasan_check_write +133 arch/arm64/include/asm/barrier.h

47933ad41a86a4 Peter Zijlstra     2013-11-06  126  
fd072df850e536 Michael S. Tsirkin 2015-12-27  127  #define __smp_store_release(p, v)					\
47933ad41a86a4 Peter Zijlstra     2013-11-06  128  do {									\
131e135f7fd14b Mark Rutland       2019-04-09  129  	typeof(p) __p = (p);						\
10223c5286f738 Will Deacon        2019-12-19  130  	union { __unqual_scalar_typeof(*p) __val; char __c[1]; } __u =	\
10223c5286f738 Will Deacon        2019-12-19  131  		{ .__val = (__force __unqual_scalar_typeof(*p)) (v) };	\
47933ad41a86a4 Peter Zijlstra     2013-11-06  132  	compiletime_assert_atomic_type(*p);				\
131e135f7fd14b Mark Rutland       2019-04-09 @133  	kasan_check_write(__p, sizeof(*p));				\
47933ad41a86a4 Peter Zijlstra     2013-11-06  134  	switch (sizeof(*p)) {						\
878a84d5a8a18a Andre Przywara     2015-04-20  135  	case 1:								\
878a84d5a8a18a Andre Przywara     2015-04-20  136  		asm volatile ("stlrb %w1, %0"				\
131e135f7fd14b Mark Rutland       2019-04-09  137  				: "=Q" (*__p)				\
39c8275de81cf7 Mark Rutland       2023-03-14  138  				: "rZ" (*(__u8 *)__u.__c)		\
994870bead4ab1 Mark Rutland       2017-05-03  139  				: "memory");				\
878a84d5a8a18a Andre Przywara     2015-04-20  140  		break;							\
878a84d5a8a18a Andre Przywara     2015-04-20  141  	case 2:								\
878a84d5a8a18a Andre Przywara     2015-04-20  142  		asm volatile ("stlrh %w1, %0"				\
131e135f7fd14b Mark Rutland       2019-04-09  143  				: "=Q" (*__p)				\
39c8275de81cf7 Mark Rutland       2023-03-14  144  				: "rZ" (*(__u16 *)__u.__c)		\
994870bead4ab1 Mark Rutland       2017-05-03  145  				: "memory");				\
878a84d5a8a18a Andre Przywara     2015-04-20  146  		break;							\
47933ad41a86a4 Peter Zijlstra     2013-11-06  147  	case 4:								\
47933ad41a86a4 Peter Zijlstra     2013-11-06  148  		asm volatile ("stlr %w1, %0"				\
131e135f7fd14b Mark Rutland       2019-04-09  149  				: "=Q" (*__p)				\
39c8275de81cf7 Mark Rutland       2023-03-14  150  				: "rZ" (*(__u32 *)__u.__c)		\
994870bead4ab1 Mark Rutland       2017-05-03  151  				: "memory");				\
47933ad41a86a4 Peter Zijlstra     2013-11-06  152  		break;							\
47933ad41a86a4 Peter Zijlstra     2013-11-06  153  	case 8:								\
39c8275de81cf7 Mark Rutland       2023-03-14  154  		asm volatile ("stlr %x1, %0"				\
131e135f7fd14b Mark Rutland       2019-04-09  155  				: "=Q" (*__p)				\
39c8275de81cf7 Mark Rutland       2023-03-14  156  				: "rZ" (*(__u64 *)__u.__c)		\
994870bead4ab1 Mark Rutland       2017-05-03  157  				: "memory");				\
47933ad41a86a4 Peter Zijlstra     2013-11-06  158  		break;							\
47933ad41a86a4 Peter Zijlstra     2013-11-06  159  	}								\
47933ad41a86a4 Peter Zijlstra     2013-11-06  160  } while (0)
47933ad41a86a4 Peter Zijlstra     2013-11-06  161  

:::::: The code at line 133 was first introduced by commit
:::::: 131e135f7fd14b1de7a5eb26631076705c18073f arm64: instrument smp_{load_acquire,store_release}

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
