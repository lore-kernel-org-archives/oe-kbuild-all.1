Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B401F4727
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 04:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752725666; cv=none; b=f32EQS6JlJkOPkQ7mpgbyTh87Ghhv5ufYwC6s+PqZzU7uZxefhpzIWlQu+OPFbeL97u3207UY1fOx3P/ndz9OJJ/LPaW739uVBENDCBkKvSKNXYV+WZaKpo9abwPFJTgmKHnnKthaWrrgPTTPG94TGDEJaO2KrbSJLcaVB9Gr+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752725666; c=relaxed/simple;
	bh=RxnUthJB1fZmgLZtp4BRuUsV4n+KPm5NcHug1xwMdYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=goFEA9+2oSleZY6hAYE29hjTX4WPZ/d8w3yRqq/G3jq67eK3gyYARYR77YGsJR1+7FVl34c5j+0df7TO09JYrS9qmd6ScOO8MWicdHp9BzAyBrO8UiTP2UPT2POxFZdZZK9Q157usKPaSHsdzM/BAxFHWF3y6iMgIrld0cSARyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kbf+sxE3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kbf+sxE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752725665; x=1784261665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RxnUthJB1fZmgLZtp4BRuUsV4n+KPm5NcHug1xwMdYg=;
  b=Kbf+sxE3Xb41+aSea4/6ceV+8yUb9Jp0GTrcvCMRZYaI4d7QT7jTy7kU
   +XmsTJ6MoL4ogVrSFdsDO8bttbtrWHpIucGpSpUn0C31BzDpO0hN8rdT7
   ur4iPMbB0uObjC7WQ1n18v5Kvh8Xdj9LmyXCLCKBWzYod2SVEZ0PiQd4A
   r8Ei62IC2SKtFdmHGaWswjMx2khLSDPB0zMTMdsSa2vIG/kDk9bhjEZLo
   TvBx1VWJvC7QlF3oUxXO2t873BYM/XLMhUdHG85ZxwXyfdxyH0wGixTcq
   /ojpxBPbbFPDQlLYoXZclW/ltCfjZpFjyrmGsrHY9J2/Ujx4Q2F634nip
   A==;
X-CSE-ConnectionGUID: DG00lFQ3SEeg/at5OxLqpQ==
X-CSE-MsgGUID: 5NFIW0WQQbGnLLN+iYxYCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54846400"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="54846400"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 21:14:23 -0700
X-CSE-ConnectionGUID: 3skSSPV2QUyRyTg1FQJIpQ==
X-CSE-MsgGUID: W7DiTYKDQ5atqAk90D2tgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="162219921"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jul 2025 21:14:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucG0g-000D8N-2N;
	Thu, 17 Jul 2025 04:14:18 +0000
Date: Thu, 17 Jul 2025 12:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 include/linux/container_of.h:20:54: error: 'struct amdgpu_bo' has no member
 named 'notifier'
Message-ID: <202507171249.SpXF6eYN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   f10a74ffa7425e7ca6ea807ef838d22f14f8bc3b
commit: 5fea46daeca8ba4ba6148654ffb6b8c6c5d9b71d [1/1] ANDROID: GKI: x86: Enable HMM_MIRROR as DRM hidden
config: i386-randconfig-141-20250717 (https://download.01.org/0day-ci/archive/20250717/202507171249.SpXF6eYN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171249.SpXF6eYN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171249.SpXF6eYN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:22,
                    from include/linux/gfp_types.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/firmware.h:8,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:46:
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_invalidate_gfx':
>> include/linux/container_of.h:20:54: error: 'struct amdgpu_bo' has no member named 'notifier'
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:32: note: in expansion of macro 'container_of'
      70 |         struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
         |                                ^~~~~~~~~~~~
   include/linux/compiler_types.h:498:27: error: expression in static assertion is not an integer
     498 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:32: note: in expansion of macro 'container_of'
      70 |         struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
         |                                ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/firmware.h:5:
>> include/linux/stddef.h:16:33: error: 'struct amdgpu_bo' has no member named 'notifier'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:32: note: in expansion of macro 'container_of'
      70 |         struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:79:9: error: implicit declaration of function 'mmu_interval_set_seq' [-Werror=implicit-function-declaration]
      79 |         mmu_interval_set_seq(mni, cur_seq);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_invalidate_hsa':
>> include/linux/container_of.h:20:54: error: 'struct amdgpu_bo' has no member named 'notifier'
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:107:32: note: in expansion of macro 'container_of'
     107 |         struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
         |                                ^~~~~~~~~~~~
   include/linux/compiler_types.h:498:27: error: expression in static assertion is not an integer
     498 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:107:32: note: in expansion of macro 'container_of'
     107 |         struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
         |                                ^~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct amdgpu_bo' has no member named 'notifier'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:107:32: note: in expansion of macro 'container_of'
     107 |         struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_register':
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:135:21: error: implicit declaration of function 'mmu_interval_notifier_insert'; did you mean 'vma_interval_tree_insert'? [-Werror=implicit-function-declaration]
     135 |                 r = mmu_interval_notifier_insert(&bo->notifier, current->mm,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     vma_interval_tree_insert
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:135:53: error: 'struct amdgpu_bo' has no member named 'notifier'
     135 |                 r = mmu_interval_notifier_insert(&bo->notifier, current->mm,
         |                                                     ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:139:53: error: 'struct amdgpu_bo' has no member named 'notifier'
     139 |                 r = mmu_interval_notifier_insert(&bo->notifier, current->mm, addr,
         |                                                     ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:148:19: error: 'struct amdgpu_bo' has no member named 'notifier'
     148 |                 bo->notifier.mm = NULL;
         |                   ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_unregister':
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:162:16: error: 'struct amdgpu_bo' has no member named 'notifier'
     162 |         if (!bo->notifier.mm)
         |                ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:164:9: error: implicit declaration of function 'mmu_interval_notifier_remove'; did you mean 'vma_interval_tree_remove'? [-Werror=implicit-function-declaration]
     164 |         mmu_interval_notifier_remove(&bo->notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         vma_interval_tree_remove
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:164:41: error: 'struct amdgpu_bo' has no member named 'notifier'
     164 |         mmu_interval_notifier_remove(&bo->notifier);
         |                                         ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:165:11: error: 'struct amdgpu_bo' has no member named 'notifier'
     165 |         bo->notifier.mm = NULL;
         |           ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_range_get_pages':
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:208:43: error: implicit declaration of function 'mmu_interval_read_begin' [-Werror=implicit-function-declaration]
     208 |                 hmm_range->notifier_seq = mmu_interval_read_begin(notifier);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_range_get_pages_done':
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:251:13: error: implicit declaration of function 'mmu_interval_read_retry' [-Werror=implicit-function-declaration]
     251 |         r = mmu_interval_read_retry(hmm_range->notifier,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
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
