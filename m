Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068E62222CC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 21:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776203234; cv=none; b=g5kLnZyy3U+tN3NuiAUBgSVpnAVnKeOhVZRreSN0upy/czTCh8jug7bSDEC7SFWY4il/6JgnNSUUD+uWvDBsX02NfvbPhq/VwL/kPhHhFoqOZvF/sY5fw42bdeHKZdY4EO3Wefh0BWw/SVID2X/57p4Ygw8KLj3c6k5wf7K/2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776203234; c=relaxed/simple;
	bh=IlCLOpoWAj7uR147O1XbnSIE8Zq/LvyKv/KAvXoJG+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O//e0VW+kHK4yVcC5+r1Iya8x9hL//kUm6WvrEJOM56fFFI0ct4lV3f0fq3QNIFOe4B3mMCuFLf33eEcfZqCJD2aCDxVL+p2gIf9ydDolk+AfN2upnevcsylHsHCYVGDSqFTwRWt5NYyqa4/7BiXv+x/x8mpdJUChIxYQLxjxFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/s6IqvL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/s6IqvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776203232; x=1807739232;
  h=date:from:to:cc:subject:message-id;
  bh=IlCLOpoWAj7uR147O1XbnSIE8Zq/LvyKv/KAvXoJG+Q=;
  b=b/s6IqvL2K8h3hTSNxi0hPfIxfv9RVPXgqLMZXweTB+4jRBL5c5rMd1J
   jmtu1R4fpOutCnW81EwV3uHGwnS4ZoqZau1Ln2E6ic0oQp2Pqc/V41ucY
   JDuCODD1a1JcSYGhDSoPNlEjtk0CYViemoV+zOVsDsfTz42wSFrOXSWlg
   NgS/q7SMmQuFjRZ60L3jvUcTyd8YcA7iZjpPh04YXMaRYtHCzeIOnKjY/
   vfdQaUmCFL2Bhfh/rFrjye5POsrXUiXqWDRgilltWnt6irejfAdpdOPti
   oCqHQR+5GS6Nbtn0Jy2ah5oQmx3gWoDuDsEmCsmD2+x5/tC1e6zMzmzR1
   Q==;
X-CSE-ConnectionGUID: bBn7Vb/JReGsIgRkKlAoSg==
X-CSE-MsgGUID: cL6yp9X7THeWCN8mAfXxpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102632810"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="102632810"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 14:47:11 -0700
X-CSE-ConnectionGUID: BZTkWDMXT8alY5pYYU4VuQ==
X-CSE-MsgGUID: iInizNXrSWKX1xkNVeEV3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225517523"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2026 14:47:10 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wClb9-000000001tF-301J;
	Tue, 14 Apr 2026 21:47:07 +0000
Date: Wed, 15 Apr 2026 05:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 arch/arm64/include/asm/barrier.h:133:27: warning: passing argument 1 of
 '__kasan_check_write' makes pointer from integer without a cast
Message-ID: <202604150549.DOu4QWgj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   2b7679c246f499a8dd5c935684e450d8ffdf829c
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [2/2] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: arm64-randconfig-003-20260415 (https://download.01.org/0day-ci/archive/20260415/202604150549.DOu4QWgj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150549.DOu4QWgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150549.DOu4QWgj-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                       ^~~~~~~~~
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
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
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
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
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
   include/linux/compiler_types.h:548:23: note: in definition of macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
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
                    from include/linux/compiler.h:390,
                    from arch/arm64/include/asm/mmu_context.h:13:
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
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
