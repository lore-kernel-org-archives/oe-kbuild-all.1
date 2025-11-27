Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D875532B982
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 12:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764248201; cv=none; b=RoyHsPYx4tYDTx2BtjKJzt9XDZCiItz3mfVBtQ09qCkvirTcpYLToYmn7iksh0jKU29xsWsH3ZzDDnw6p5BsWwstSpp33tgb0GHmXJjsxlX0LkZ4CcnzplPcOKevZoX3Gora3Epa0yN1qid94Q0Z0EtDdb9s0P7zBgNjY25mg7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764248201; c=relaxed/simple;
	bh=gBD+iaKCm3+JSPpIFO6IQ7LvMNLqL6ZWpdbprFIPX+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LqF/GZyHtRQKtQwNqQl8Wrr6Wnx0S3uy03GcGdCiGlMhH+/s6w9Jp/03VEyMp3oLL0otJ3Zzjh0W69NfEjDomSQbuodx0/WtQONVi9gT9UfVs24ErhF3jqw4BdgC9euWFZjogetAqWFzmS/EszCH97+Ff+PJhgKG1TiBkoGAIKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngqKZEz5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngqKZEz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764248200; x=1795784200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gBD+iaKCm3+JSPpIFO6IQ7LvMNLqL6ZWpdbprFIPX+0=;
  b=ngqKZEz5XtZfh8NzgHJcniKX6oDp//vo+iSLdlunZk4rL0PnyX3mudOD
   R46NPFU2Qy511E1q1mKoJBAzqoEM0/3/LhhlsReldUqmQI5Nh3qx3+1YP
   HSddabRjeRrvTS8mWaJX7g3vIYY7XUr3Y84pzeHEEV84QnaTeNkHAvLef
   28b6z7ghHABS2O4imU3t4gFcNja8tvMSKEsKuTjzbp2KRubp0q37oG9eq
   eg1Cmf6sKqh79lrlmOB3JzLPcZycQMEMTFG2j/H2oa8how1XSbGeL6DBy
   kEC9GAvkJXrK7Lvx1ayWMFKPTL9RxKTvMCtoEDWNTxUYDKHasjyoLHBMl
   A==;
X-CSE-ConnectionGUID: IzbPb8QYRWqCgLP8qvG2PQ==
X-CSE-MsgGUID: VDpcdo5ZTTWvCm9L/pGFbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66333872"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="66333872"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 04:56:39 -0800
X-CSE-ConnectionGUID: 4Q8O59CdRMikz4uAEWTdng==
X-CSE-MsgGUID: pprs+mISQ5WZQwzH95AMwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="197546200"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Nov 2025 04:56:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vObY4-000000004lh-0RP1;
	Thu, 27 Nov 2025 12:56:36 +0000
Date: Thu, 27 Nov 2025 20:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 7/7]
 include/linux/container_of.h:20:28: error: dereferencing pointer to
 incomplete type 'struct iommu_attach_handle'
Message-ID: <202511272028.uefimqq4-lkp@intel.com>
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
head:   ed5138861789485c74044363c936de3705a4879d
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [7/7] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: arm-randconfig-r071-20251127 (https://download.01.org/0day-ci/archive/20251127/202511272028.uefimqq4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511272028.uefimqq4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511272028.uefimqq4-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=m]
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=m]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +20 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  15   *
7376e561fd2e01 Sakari Ailus     2022-10-24  16   * WARNING: any const qualifier of @ptr is lost.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  17   */
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  18  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  19  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6df Rasmus Villemoes 2021-11-08 @20  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  21  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  22  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  23  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  24  

:::::: The code at line 20 was first introduced by commit
:::::: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: switch to static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
