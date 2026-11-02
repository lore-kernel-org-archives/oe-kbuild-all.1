Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793588316;
	b=z5mSyf1cH8AeIxpHGPTYHAkwb2I0z4NO/LPA0dJGScbQoKExYFJSCEMBxzVSmCvO8hlf
	 YJZKtfoNTxuUQAZHemS31bUzeb2aonaDNPQCxbEGDcmctjpQqidsGtQE/RacJZGsji2lg
	 4ZRqSU0p4HljM4GKF5JizD32ejWSAwohZllrJ0jvITfo2QBpw24GmOKh1dPOOtFNJ8aDd
	 ur7U2VzqVqjiz9Vto+21pfIxZsd/mL4UmSQf+Fp2RPuZx4c8PWSzXd/SN+oKH6sRrYoUx
	 Hf/bH4HW5wb0Fo6S3QeorHnO6dq0aDukfrNrOHJj+/t1SRZsYCpn3fxS4WHgalBbzFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588316;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WHMh7lzpntxIuRwz3Km+LB2OgkUDQBMjufI/RZ52HK0=;
	b=eTAImAsbpZ7PZjqX/S9vi0vnmzIvpdtNBCfkGYjfyVOHTM5AWepUj7edT9odau73GqlB
	 3yla8/VrZ+ybkTGn6nG+fzTNhyATsGa/ltv79smq/bkDGPBv4/sRkq5W4ryzZRtKwTxNk
	 GykF3w2XecaCtU+uoEYXZACaQAKJBwKnKwPBS6ZBqqjj2ugYkrgE7AZx8mOwQ18vH6Ztl
	 xb4G7vnV1Eu7rIreJ2/NXJy+WDjOKre18Y4/X+BaHy3xUaJms3/Syw2D2k1AX6uiEwvIm
	 VnMRGHpBQmXoJNqkuaAEoq2qeAU8wBGJw86YmMDqwZ5MN29gVxSKM9v4Nw2ZOT2Hv4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djXcPimc;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E21606A324
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 02:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E21606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djXcPimc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793588314; x=1825124314;
  h=date:from:to:cc:subject:message-id;
  bh=A301zntJbtJowgDD19Yv8Lt/Wkh3bnWYCxe9/z1cFxk=;
  b=djXcPimcYJoJer8zAdcWVfWRuQp1R8D/sIyZlXpA+qHNEgYvKyc2Ww7i
   hPVLt353Jw6U1fk/r/CwlEhjFLaE1uwmiZRX5cFT2Yfe95nvnCRE4OXSi
   04ERcGYMYkrK0xZKv/Z5v54wIgueDBE7n8dlhH3XOWxMmUuGvLsG+wdZV
   xOIhrnAr/4SDbb77+66INxVYQz5JmgghBDLnZRxNgNxMPndzCfaKQZHrj
   YCK1VDijKOamUoNEt0qoZKNo3RAlCfEQJR+A3tSqr2LUaW9/ta6tv54zl
   b6GRGb9s6NFzyrPPf9KuJJ//rqqDfnxz7f9/TunHZPYnH+0qsWYu/EfMB
   A==;
X-CSE-ConnectionGUID: 3a7acHmUSua0axfE6Ha2Xw==
X-CSE-MsgGUID: 70XE21XdReWBHCPbSjcD+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2263461"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2263461"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 18:58:33 -0800
X-CSE-ConnectionGUID: 20sYDhabQNaRc6SanyW7BA==
X-CSE-MsgGUID: 8OnOc0v3SeaJhjxGeHLv5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="5986943"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Nov 2026 18:58:32 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNiFh-00000000gHq-2hWl;
	Mon, 02 Nov 2026 02:58:29 +0000
Date: Mon, 02 Nov 2026 10:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 5/5]
 arch/arm64/include/asm/barrier.h:137:41: error: invalid type argument of
 unary '*' (have 'int')
Message-ID: <202611021058.BZEvmFrd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   ec466d24ad7b3c4a3d9875354a48e8cd2b4e1ed4
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [5/5] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: arm64-randconfig-1000-20261102 (https://download.01.org/0day-ci/archive/20261102/202611021058.BZEvmFrd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611021058.BZEvmFrd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611021058.BZEvmFrd-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   arch/arm64/include/asm/barrier.h:133:27: warning: passing argument 1 of '__kasan_check_write' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/arm64/include/asm/barrier.h:137:41: error: invalid type argument of unary '*' (have 'int')
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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


vim +137 arch/arm64/include/asm/barrier.h

47933ad41a86a4a Peter Zijlstra     2013-11-06  126  
fd072df850e536b Michael S. Tsirkin 2015-12-27  127  #define __smp_store_release(p, v)					\
47933ad41a86a4a Peter Zijlstra     2013-11-06  128  do {									\
131e135f7fd14b1 Mark Rutland       2019-04-09  129  	typeof(p) __p = (p);						\
10223c5286f7389 Will Deacon        2019-12-19  130  	union { __unqual_scalar_typeof(*p) __val; char __c[1]; } __u =	\
10223c5286f7389 Will Deacon        2019-12-19  131  		{ .__val = (__force __unqual_scalar_typeof(*p)) (v) };	\
47933ad41a86a4a Peter Zijlstra     2013-11-06  132  	compiletime_assert_atomic_type(*p);				\
131e135f7fd14b1 Mark Rutland       2019-04-09  133  	kasan_check_write(__p, sizeof(*p));				\
47933ad41a86a4a Peter Zijlstra     2013-11-06 @134  	switch (sizeof(*p)) {						\
878a84d5a8a18a4 Andre Przywara     2015-04-20  135  	case 1:								\
878a84d5a8a18a4 Andre Przywara     2015-04-20  136  		asm volatile ("stlrb %w1, %0"				\
131e135f7fd14b1 Mark Rutland       2019-04-09 @137  				: "=Q" (*__p)				\
39c8275de81cf7f Mark Rutland       2023-03-14  138  				: "rZ" (*(__u8 *)__u.__c)		\
994870bead4ab19 Mark Rutland       2017-05-03  139  				: "memory");				\
878a84d5a8a18a4 Andre Przywara     2015-04-20  140  		break;							\
878a84d5a8a18a4 Andre Przywara     2015-04-20  141  	case 2:								\
878a84d5a8a18a4 Andre Przywara     2015-04-20  142  		asm volatile ("stlrh %w1, %0"				\
131e135f7fd14b1 Mark Rutland       2019-04-09  143  				: "=Q" (*__p)				\
39c8275de81cf7f Mark Rutland       2023-03-14  144  				: "rZ" (*(__u16 *)__u.__c)		\
994870bead4ab19 Mark Rutland       2017-05-03  145  				: "memory");				\
878a84d5a8a18a4 Andre Przywara     2015-04-20  146  		break;							\
47933ad41a86a4a Peter Zijlstra     2013-11-06  147  	case 4:								\
47933ad41a86a4a Peter Zijlstra     2013-11-06  148  		asm volatile ("stlr %w1, %0"				\
131e135f7fd14b1 Mark Rutland       2019-04-09  149  				: "=Q" (*__p)				\
39c8275de81cf7f Mark Rutland       2023-03-14  150  				: "rZ" (*(__u32 *)__u.__c)		\
994870bead4ab19 Mark Rutland       2017-05-03  151  				: "memory");				\
47933ad41a86a4a Peter Zijlstra     2013-11-06  152  		break;							\
47933ad41a86a4a Peter Zijlstra     2013-11-06  153  	case 8:								\
39c8275de81cf7f Mark Rutland       2023-03-14  154  		asm volatile ("stlr %x1, %0"				\
131e135f7fd14b1 Mark Rutland       2019-04-09  155  				: "=Q" (*__p)				\
39c8275de81cf7f Mark Rutland       2023-03-14  156  				: "rZ" (*(__u64 *)__u.__c)		\
994870bead4ab19 Mark Rutland       2017-05-03  157  				: "memory");				\
47933ad41a86a4a Peter Zijlstra     2013-11-06  158  		break;							\
47933ad41a86a4a Peter Zijlstra     2013-11-06  159  	}								\
47933ad41a86a4a Peter Zijlstra     2013-11-06  160  } while (0)
47933ad41a86a4a Peter Zijlstra     2013-11-06  161  

:::::: The code at line 137 was first introduced by commit
:::::: 131e135f7fd14b1de7a5eb26631076705c18073f arm64: instrument smp_{load_acquire,store_release}

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
