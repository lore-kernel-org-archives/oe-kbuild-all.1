Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005896A8D2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496011; cv=none; b=JuOFZCDwsmphbu+hxAkIQJ7aOu5nhshVyinDLtXbmyiVAGF21QyOp//OPabPEzoxMIxXDDuVr2M9Ftin4Bz6OvPid5xIlDUutvihVHqYapqgCsHkTdDEjzsvG6SLrIBacln11Uxldd2hKCSW7AgWo18fokkH1CZ4pDTDB5TqoAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496011; c=relaxed/simple;
	bh=eg1kXzZTx6tb+M+E5AZrrIP5S/m0dPU0HvL03RL2qd8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=blzWKXBm8U4hY16utHfu1LZNzuPWfCcuVKGynxM/6VF9BErGk/q27FxxW+cdQHvV27u2gFE469rRFCc0FkgVMR9mG406zfaFwCQ9uqPj259H3mYWYemvbF+wQdYpUZFfh+D0Hu2hnRqgY/n9PQBoq/CX0AaybATGMXPmoAiMrhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amnCvmB+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amnCvmB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771496010; x=1803032010;
  h=date:from:to:cc:subject:message-id;
  bh=eg1kXzZTx6tb+M+E5AZrrIP5S/m0dPU0HvL03RL2qd8=;
  b=amnCvmB+zrFDVRw7+HEL9MZMkgtJdn6zspuBI8ydnLVN/vHL4/z4Bika
   LLqthcvyDtjJYKOob0mlF2iDqEUn0QRpxRH68RTg36Hv2ACqzedxLpA6R
   x9N31OujhXEU9MIjuBvHhzrmwAKvAdQV3htzzkyjLxIJibTcomgbQZ8hv
   2A6uzAhVBCQEFUBtfri41b/CQ6wa6Rc2951H8HwsX9EP8UnTyaqzZ9dRS
   oaIKhbD8fX4B99NmPJ4fI0osdZRmFpp2bCV4aRf3bbaDWfJHDyrq9IkNJ
   e0zBsTnxejRlq7SeXJTRMimBHFKRM/VA4ju1Ak0J2J3FsWCrVLsA+Xnop
   g==;
X-CSE-ConnectionGUID: YY9eMgrpR82nJR9bFTefGw==
X-CSE-MsgGUID: QxvYU59sR7a1I/43mDi0ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72754123"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72754123"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 02:13:30 -0800
X-CSE-ConnectionGUID: HmVm/7uyRFq6E/AkppEnmg==
X-CSE-MsgGUID: RhnewatiRAKBIXfLiFB0wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="243143636"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2026 02:13:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vt12D-00000001372-48Ma;
	Thu, 19 Feb 2026 10:13:26 +0000
Date: Thu, 19 Feb 2026 18:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 13/13]
 include/linux/stddef.h:16:33: error: 'struct amdgpu_bo' has no member named
 'notifier'
Message-ID: <202602191811.fPYcIOEn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   94d880d4e809b7e441776f67a3aaf87274241573
commit: feb0be0c1302a55148a66cfd506047ea0c425836 [13/13] Revert "ANDROID: suppress GKI configs for 32-bit builds" am: 8b9a794068
config: i386-randconfig-r112-20260219 (https://download.01.org/0day-ci/archive/20260219/202602191811.fPYcIOEn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602191811.fPYcIOEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602191811.fPYcIOEn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:22,
                    from include/linux/gfp_types.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/firmware.h:8,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:46:
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_invalidate_gfx':
   include/linux/container_of.h:20:54: error: 'struct amdgpu_bo' has no member named 'notifier'
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
   include/linux/compiler_types.h:477:27: error: expression in static assertion is not an integer
     477 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:79:9: error: implicit declaration of function 'mmu_interval_set_seq' [-Wimplicit-function-declaration]
      79 |         mmu_interval_set_seq(mni, cur_seq);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_invalidate_hsa':
   include/linux/container_of.h:20:54: error: 'struct amdgpu_bo' has no member named 'notifier'
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
   include/linux/compiler_types.h:477:27: error: expression in static assertion is not an integer
     477 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:135:21: error: implicit declaration of function 'mmu_interval_notifier_insert'; did you mean 'vma_interval_tree_insert'? [-Wimplicit-function-declaration]
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:164:9: error: implicit declaration of function 'mmu_interval_notifier_remove'; did you mean 'vma_interval_tree_remove'? [-Wimplicit-function-declaration]
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:208:43: error: implicit declaration of function 'mmu_interval_read_begin' [-Wimplicit-function-declaration]
     208 |                 hmm_range->notifier_seq = mmu_interval_read_begin(notifier);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c: In function 'amdgpu_hmm_range_get_pages_done':
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:251:13: error: implicit declaration of function 'mmu_interval_read_retry' [-Wimplicit-function-declaration]
     251 |         r = mmu_interval_read_retry(hmm_range->notifier,
         |             ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
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
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=y] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +16 include/linux/stddef.h

6e218287432472 Richard Knutsson 2006-09-30  14  
^1da177e4c3f41 Linus Torvalds   2005-04-16  15  #undef offsetof
14e83077d55ff4 Rasmus Villemoes 2022-03-23 @16  #define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
3876488444e712 Denys Vlasenko   2015-03-09  17  

:::::: The code at line 16 was first introduced by commit
:::::: 14e83077d55ff4b88fe39f5e98fb8230c2ccb4fb include: drop pointless __compiler_offsetof indirection

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
