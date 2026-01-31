Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F76D28E0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 20:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769890230; cv=none; b=G9hGBVhp3qlVRlT0LfnTspoZGEiQR//uXYJK+bNJRg8UTh7gxj1Z+yC67EQR9gshRKCvs8ePWMP8X1fLnvGnhDs51JfjQma0feIMpOQiC9wVergWU44c/LFbNDLJyEtkk5Og0bXUN1S8YplRD2OjrdXWzF5S9LRcrAB182EuTaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769890230; c=relaxed/simple;
	bh=z4rj4NDnMcf635tZ9sx6IurUJWDBD+96PT5JU/LKsZ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RuF8iWPW7NpXTvYXJ3CKXeTVWyMSU6e2E8OWSE/UO8+7tTnjj55xqwIEF/2BJty1+ms7NGyQouaMtTZl++kfZoJNUF8Miqff26fAbUX5QWRgqdkx7mQMzh3xf4O/yCLggLTK9UsxCvxvfzYElZgudbsEM25aqveOqGoq8Mq0Pi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNZk/9y7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNZk/9y7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769890229; x=1801426229;
  h=date:from:to:cc:subject:message-id;
  bh=z4rj4NDnMcf635tZ9sx6IurUJWDBD+96PT5JU/LKsZ0=;
  b=lNZk/9y7FqyEYUVQ95nTA9nEdz3D/AexBZWPANVtBkw9p19YNJTuSLku
   3vsygMwZ8RaIFoBruLcgaLM4Y3IDaYQXqhGvEmQsvbS0qM0shqu5WopQz
   jiHZMhjTp1OZCSArsbs7IwIt59PKvrGwYo4UHUf2Kkpt0W1V2VQzQEbV1
   24R4BtDgaGwT6J/EMAjFPya7Crn5tCRP6MoZVvn6AESz3rLTiI8bb5oe/
   1OuAOhk0a6pIWqgpeeRMRUkVtVeU27aTeB9KdEzNc6Pj9Mc++9jo7Qgt9
   878/vtGaYXi9bFje/7U3iUiExP1uxjrKf1BfzKUZVoJ1o6B8X0Areu4c+
   A==;
X-CSE-ConnectionGUID: GcTHPrvUS3qidQRUGolOWw==
X-CSE-MsgGUID: 37JbvftsQ7WVTuFDNQ15wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="82217771"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="82217771"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 12:10:29 -0800
X-CSE-ConnectionGUID: cbBexdE1S4ux5XHpQ+Murw==
X-CSE-MsgGUID: 5QtdQN21RO+F5mGKvhYi4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="208381102"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Jan 2026 12:10:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmHIX-00000000eMK-0gar;
	Sat, 31 Jan 2026 20:10:25 +0000
Date: Sun, 01 Feb 2026 04:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 drivers/iommu/iommu-priv.h:18:19: error: dereferencing pointer to incomplete
 type 'struct dev_iommu'
Message-ID: <202602010426.7Ok4kegU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c375448ca4c34cb24d61fefcdd04e293397f87e1
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [2/2] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: arm-randconfig-003-20260201 (https://download.01.org/0day-ci/archive/20260201/202602010426.7Ok4kegU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010426.7Ok4kegU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010426.7Ok4kegU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-sva.c:10:
   drivers/iommu/iommu-priv.h: In function 'dev_iommu_ops':
>> drivers/iommu/iommu-priv.h:18:19: error: dereferencing pointer to incomplete type 'struct dev_iommu'
     return dev->iommu->iommu_dev->ops;
                      ^~
   drivers/iommu/iommu-priv.h: In function 'iommu_fwspec_ops':
   drivers/iommu/iommu-priv.h:27:46: error: 'struct iommu_fwspec' has no member named 'iommu_fwnode'
     return iommu_ops_from_fwnode(fwspec ? fwspec->iommu_fwnode : NULL);
                                                 ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_alloc_mm_data':
   drivers/iommu/iommu-sva.c:27:17: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     iommu_mm = mm->iommu_mm;
                    ^~~~~~~~
                    mm_mt
>> drivers/iommu/iommu-sva.c:30:15: error: dereferencing pointer to incomplete type 'struct iommu_mm_data'
      if (iommu_mm->pasid >= dev->iommu->max_pasids)
                  ^~
   In file included from include/linux/percpu.h:5,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from arch/arm/include/asm/mmu_context.h:15,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c:35:28: error: invalid application of 'sizeof' to incomplete type 'struct iommu_mm_data'
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
                               ^~~~~~
   include/linux/alloc_tag.h:239:9: note: in definition of macro 'alloc_hooks_tag'
     typeof(_do_alloc) _res;      \
            ^~~~~~~~~
   include/linux/slab.h:1041:25: note: in expansion of macro 'alloc_hooks'
    #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
                            ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:35:13: note: in expansion of macro 'kzalloc'
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
                ^~~~~~~
   drivers/iommu/iommu-sva.c:35:28: error: invalid application of 'sizeof' to incomplete type 'struct iommu_mm_data'
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
                               ^~~~~~
   include/linux/alloc_tag.h:243:10: note: in definition of macro 'alloc_hooks_tag'
      _res = _do_alloc;     \
             ^~~~~~~~~
   include/linux/slab.h:1041:25: note: in expansion of macro 'alloc_hooks'
    #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
                            ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:35:13: note: in expansion of macro 'kzalloc'
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
                ^~~~~~~
   drivers/iommu/iommu-sva.c:35:28: error: invalid application of 'sizeof' to incomplete type 'struct iommu_mm_data'
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
                               ^~~~~~
   include/linux/alloc_tag.h:246:10: note: in definition of macro 'alloc_hooks_tag'
      _res = _do_alloc;     \
             ^~~~~~~~~
   include/linux/slab.h:1041:25: note: in expansion of macro 'alloc_hooks'
    #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
                            ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:35:13: note: in expansion of macro 'kzalloc'
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
                ^~~~~~~
   drivers/iommu/iommu-sva.c:35:11: warning: assignment to 'struct iommu_mm_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     iommu_mm = kzalloc(sizeof(struct iommu_mm_data), GFP_KERNEL);
              ^
   In file included from <command-line>:
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=m]
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
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=m]
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
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +18 drivers/iommu/iommu-priv.h

addb665924f39f0 Nicolin Chen 2023-07-17   9  
92766e1b953d6e4 Yi Liu       2023-08-18  10  static inline const struct iommu_ops *dev_iommu_ops(struct device *dev)
92766e1b953d6e4 Yi Liu       2023-08-18  11  {
92766e1b953d6e4 Yi Liu       2023-08-18  12  	/*
92766e1b953d6e4 Yi Liu       2023-08-18  13  	 * Assume that valid ops must be installed if iommu_probe_device()
92766e1b953d6e4 Yi Liu       2023-08-18  14  	 * has succeeded. The device ops are essentially for internal use
92766e1b953d6e4 Yi Liu       2023-08-18  15  	 * within the IOMMU subsystem itself, so we should be able to trust
92766e1b953d6e4 Yi Liu       2023-08-18  16  	 * ourselves not to misuse the helper.
92766e1b953d6e4 Yi Liu       2023-08-18  17  	 */
92766e1b953d6e4 Yi Liu       2023-08-18 @18  	return dev->iommu->iommu_dev->ops;
92766e1b953d6e4 Yi Liu       2023-08-18  19  }
92766e1b953d6e4 Yi Liu       2023-08-18  20  

:::::: The code at line 18 was first introduced by commit
:::::: 92766e1b953d6e419684b39f55dab574287dd144 iommu: Move dev_iommu_ops() to private header

:::::: TO: Yi Liu <yi.l.liu@intel.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
