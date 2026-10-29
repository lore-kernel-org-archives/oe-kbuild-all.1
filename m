Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256950;
	b=DmJkgGb5sfQnK7qJwDK/DXieQMocrhuooPU/aKMkm8AkmOaj7y7Kwt3qdrhZpE/NP87D
	 Q2vwtLMut9Ue3qf3G/0ZeXkVdKgVPeTEJFwgLKjJ064uAlTWQGzmHAJrUb011qaIVgWtY
	 wdB21Apy5FXEMAEGONKrjpYGjedbt1CPikquTKJ1ZnFCh+LQB/H0XHvn6XuTaiOQYu7ce
	 eUb0rlN80Xn3ld4Pu8ds6SWL3cAu1pdWXUJZUW3L/t4Y+HQpdnw/7wX0rtIirfZRSvAeJ
	 OKL0KseXlsWjPkPHzsPwpkLhJunLXpyTES36BeSkUF18rJ+C4ORcsFOmSs5VWMh62iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256950;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+UU1qjMxbR21YMRxgMQwYzKdIVAq90y6z777wF5bcqU=;
	b=Ia6k0qnYWjmaEmqnJlaERoftsSVCeCmZDF6lX9qHqm4ocdlLvmySAvJ5oDNH5YuzZd2L
	 0jDQpjWrKSE9oEbkQejfurq7q2yUaNTsJd7xxdA+wIGvFgjdoZoy0McH7WPgWwjiTfDl8
	 N3kl8BxALna0sUN1Jxv9XhF1jlSzOMBq+UsJkb6eupWGhAYx6DMHflG2zn9VefhGJImKq
	 ZIWQ/Shis8KeI8QiO63oS1gNbuP//GUYZHwAohiNSFmdVUiq5n2EHBfjK5kwwFpMymLEG
	 unn7vmWuyVUHdNJWcNeBE8nnLJFTu94L/58EHYmVV3OkOjHSfbaX46JmnVElQKX+Nig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CdWJhkxC;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEDE606A320
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 06:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DEDE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CdWJhkxC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793256948; x=1824792948;
  h=date:from:to:cc:subject:message-id;
  bh=NR3aTBJx49lCKzdE3LxpE8E3cuSWMkJO7IOv1zh/R7M=;
  b=CdWJhkxCasdTIaRNFaDIHfiOwF1va9HiHBrxsoNvqJJLgIu2kDcw5AmW
   yEnv55EI9AUo25IuWn3UYZBVOF9s7YQphpZcDrx5hOtzGdxa3OhS+2N8j
   UaBYZ84bJl9TnZXQUAmRjkKBCW22txBjvZYMxyljvIiI2rd7oz/jUhBbk
   u1TQHsQKYAtF66Ev57EKSfjnXHeAl505xCb/ksa4sk6g/UaT7SNptzt+b
   nISOUgWkhqleIOs8IijHgoaG4SMNiiAJKTOQPXwVUqLZhT2n+2FOQH6Li
   zLTLYjkkkXw7neZCdyQF4ZxNOdTJt8yRMg9FqheNQh06TDEeHnW8yHuWR
   A==;
X-CSE-ConnectionGUID: mQ5mUe1iQXi4m4YTIk2f6Q==
X-CSE-MsgGUID: om57e88eSV2rhKawdUURxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1867999"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1867999"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 23:55:47 -0700
X-CSE-ConnectionGUID: UOlRmn3pTmmF7kg4xCzZiA==
X-CSE-MsgGUID: vlWajP/ERU+OL1D5rfeIHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5417419"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2026 23:55:46 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMK36-000000005AJ-0aBK;
	Thu, 29 Oct 2026 06:55:44 +0000
Date: Thu, 29 Oct 2026 07:55:43 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 1/1]
 arch/arm64/include/asm/barrier.h:137:13: error: invalid type argument of
 unary '*' (have 'int')
Message-ID: <202610290747.7auZwzFb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   a69319c19fd01d6ddb506d4e39b1e50451bdb352
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [1/1] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: arm64-randconfig-r2202-20261029 (https://download.01.org/0day-ci/archive/20261029/202610290747.7auZwzFb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290747.7auZwzFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290747.7auZwzFb-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/include/asm/barrier.h:132:2: note: in expansion of macro 'compiletime_assert_atomic_type'
     132 |  compiletime_assert_atomic_type(*p);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
      51 |  smp_store_release(&mm->iommu_mm, iommu_mm);
         |  ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:23: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |  smp_store_release(&mm->iommu_mm, iommu_mm);
         |                       ^~
   include/linux/compiler.h:68:3: note: in definition of macro '__trace_if_value'
      68 |  (cond) ?     \
         |   ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:548:3: note: in expansion of macro 'if'
     548 |   if (!(condition))     \
         |   ^~
   include/linux/compiler_types.h:556:2: note: in expansion of macro '__compiletime_assert'
     556 |  __compiletime_assert(condition, msg, prefix, suffix)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:2: note: in expansion of macro 'compiletime_assert'
     571 |  compiletime_assert(__native_word(t),    \
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:21: note: in expansion of macro '__native_word'
     571 |  compiletime_assert(__native_word(t),    \
         |                     ^~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:132:2: note: in expansion of macro 'compiletime_assert_atomic_type'
     132 |  compiletime_assert_atomic_type(*p);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
      51 |  smp_store_release(&mm->iommu_mm, iommu_mm);
         |  ^~~~~~~~~~~~~~~~~
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
   drivers/iommu/iommu-sva.c:51:23: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |  smp_store_release(&mm->iommu_mm, iommu_mm);
         |                       ^~
   arch/arm64/include/asm/barrier.h:133:33: note: in definition of macro '__smp_store_release'
     133 |  kasan_check_write(__p, sizeof(*p));    \
         |                                 ^
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
      51 |  smp_store_release(&mm->iommu_mm, iommu_mm);
         |  ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:133:20: warning: passing argument 1 of '__kasan_check_write' makes pointer from integer without a cast [-Wint-conversion]
     133 |  kasan_check_write(__p, sizeof(*p));    \
         |                    ^~~
         |                    |
         |                    int
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
      51 |  smp_store_release(&mm->iommu_mm, iommu_mm);
         |  ^~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/rwonce.h:26,
                    from arch/arm64/include/asm/rwonce.h:67,
                    from include/linux/compiler.h:390,
                    from arch/arm64/include/asm/mmu_context.h:13,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   include/linux/kasan-checks.h:20:47: note: expected 'const volatile void *' but argument is of type 'int'
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |                          ~~~~~~~~~~~~~~~~~~~~~^
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
   drivers/iommu/iommu-sva.c:51:23: error: 'struct mm_struct' has no member named 'iommu_mm'
      51 |  smp_store_release(&mm->iommu_mm, iommu_mm);
         |                       ^~
   arch/arm64/include/asm/barrier.h:134:18: note: in definition of macro '__smp_store_release'
     134 |  switch (sizeof(*p)) {      \
         |                  ^
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
      51 |  smp_store_release(&mm->iommu_mm, iommu_mm);
         |  ^~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/barrier.h:137:13: error: invalid type argument of unary '*' (have 'int')
     137 |     : "=Q" (*__p)    \
         |             ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
      51 |  smp_store_release(&mm->iommu_mm, iommu_mm);
         |  ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:143:13: error: invalid type argument of unary '*' (have 'int')
     143 |     : "=Q" (*__p)    \
         |             ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
      51 |  smp_store_release(&mm->iommu_mm, iommu_mm);
         |  ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:149:13: error: invalid type argument of unary '*' (have 'int')
     149 |     : "=Q" (*__p)    \
         |             ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
      51 |  smp_store_release(&mm->iommu_mm, iommu_mm);
         |  ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:155:13: error: invalid type argument of unary '*' (have 'int')
     155 |     : "=Q" (*__p)    \
         |             ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
      51 |  smp_store_release(&mm->iommu_mm, iommu_mm);
         |  ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c: At top level:
   drivers/iommu/iommu-sva.c:68:19: error: redefinition of 'iommu_sva_bind_device'
      68 | struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
         |                   ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/iommu-sva.c:8:
   include/linux/iommu.h:1576:1: note: previous definition of 'iommu_sva_bind_device' was here
    1576 | iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:22,
                    from arch/arm64/include/asm/cpufeature.h:26,
                    from arch/arm64/include/asm/processor.h:39,
                    from include/linux/sched.h:13,
                    from arch/arm64/include/asm/mmu_context.h:14,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_bind_device':
   drivers/iommu/iommu-sva.c:114:33: error: 'struct mm_struct' has no member named 'iommu_mm'
     114 |  list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                 ^~
   include/linux/container_of.h:19:26: note: in definition of macro 'container_of'
      19 |  void *__mptr = (void *)(ptr);     \
         |                          ^~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     612 |  list_entry((ptr)->next, type, member)
         |  ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     770 |  for (pos = list_first_entry(head, typeof(*pos), member); \
         |             ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:2: note: in expansion of macro 'list_for_each_entry'
     114 |  list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |  ^~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/processor.h:28,
                    from include/linux/sched.h:13,
                    from arch/arm64/include/asm/mmu_context.h:14,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c:114:33: error: 'struct mm_struct' has no member named 'iommu_mm'
     114 |  list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                 ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
      20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |  ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
      20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                ^~~~~~~~~~~
   include/linux/list.h:601:2: note: in expansion of macro 'container_of'
     601 |  container_of(ptr, type, member)
         |  ^~~~~~~~~~~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     612 |  list_entry((ptr)->next, type, member)
         |  ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     770 |  for (pos = list_first_entry(head, typeof(*pos), member); \
         |             ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:2: note: in expansion of macro 'list_for_each_entry'
     114 |  list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:33: error: 'struct mm_struct' has no member named 'iommu_mm'
     114 |  list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                 ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
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


vim +137 arch/arm64/include/asm/barrier.h

47933ad41a86a4 Peter Zijlstra     2013-11-06  126  
fd072df850e536 Michael S. Tsirkin 2015-12-27  127  #define __smp_store_release(p, v)					\
47933ad41a86a4 Peter Zijlstra     2013-11-06  128  do {									\
131e135f7fd14b Mark Rutland       2019-04-09  129  	typeof(p) __p = (p);						\
10223c5286f738 Will Deacon        2019-12-19  130  	union { __unqual_scalar_typeof(*p) __val; char __c[1]; } __u =	\
10223c5286f738 Will Deacon        2019-12-19  131  		{ .__val = (__force __unqual_scalar_typeof(*p)) (v) };	\
47933ad41a86a4 Peter Zijlstra     2013-11-06  132  	compiletime_assert_atomic_type(*p);				\
131e135f7fd14b Mark Rutland       2019-04-09  133  	kasan_check_write(__p, sizeof(*p));				\
47933ad41a86a4 Peter Zijlstra     2013-11-06  134  	switch (sizeof(*p)) {						\
878a84d5a8a18a Andre Przywara     2015-04-20  135  	case 1:								\
878a84d5a8a18a Andre Przywara     2015-04-20  136  		asm volatile ("stlrb %w1, %0"				\
131e135f7fd14b Mark Rutland       2019-04-09 @137  				: "=Q" (*__p)				\
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

:::::: The code at line 137 was first introduced by commit
:::::: 131e135f7fd14b1de7a5eb26631076705c18073f arm64: instrument smp_{load_acquire,store_release}

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
