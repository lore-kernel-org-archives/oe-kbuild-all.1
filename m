Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439C036BCE8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 03:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198359; cv=none; b=adXRQ3d8bU3U4LUlg/pUo6YTcM9lEssV+pXY8zWt5Qobxn2qfWLDPtxlMWhL2DKbTS8pSN4H+lybsniXC1xbrb15xJdRDm4Xci9KerVDDQ2stahDiIOT4qXdVqOQt4mYFJvFoUByuM2MDrz6RvKLubVzobWZMef97ce5LPhL3v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198359; c=relaxed/simple;
	bh=S71sJ3LUeExjY0Dxdh86/HevnJLUJ0ORw3BI+2Nqy9g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a5vBkUa8npRKTiXVTlF4X7HvoGkJ2hIRTrIgEy+cUM4EnUVO9/Xa2ixnEK0UjdR8bvAQqh7dDv7lITvOXZZ1QdBYTsCJRYWAZq6qz9INntPGL5Ngy8PzcVbX9mp2u4IffQDYRmA77mC3+MjK6jc4RFSuwPvf53e+OCVMeMaiG/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvcxaIFg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvcxaIFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773198357; x=1804734357;
  h=date:from:to:cc:subject:message-id;
  bh=S71sJ3LUeExjY0Dxdh86/HevnJLUJ0ORw3BI+2Nqy9g=;
  b=FvcxaIFgKclTUHGQ1L5y+1pSPO7mGwOzjsR37jgyA0z0zhq/5ccQ+4qf
   hqDYAuGIhj5hjtqE3VZiQIxM9bgrTMShuFm31cxVzgdU3et5Y7bVRZ1x3
   Mqb2huUIauPfDC3A6wlEZK88qNLz6NcgseqTt5yP0z/mTs2d9nTEFLAi6
   SQKnthvzbN2X4e6eGRujUHTLXkRd/ZAycsXT6oPjVNA+QX0Zkqv46hf3m
   uRLOd19NvT4UQAg6fCdktDv+Ckr8TZ5YLo4gIsRXkigGeWGaBoB+IBDH6
   rhvdAQ5ZgijKNcz7uYnObdEi6Lj8FYY0qQR8dq2W9JlbwVXDJ+S43htCT
   w==;
X-CSE-ConnectionGUID: QwUUcHfwQH+ADhqQ/t7PUQ==
X-CSE-MsgGUID: GZ2k51f5RIyVFEExMsBAyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74232186"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74232186"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 20:05:56 -0700
X-CSE-ConnectionGUID: yEp7pFO9Q9uzsb++W9qraQ==
X-CSE-MsgGUID: sXYFYXDJQcGFXohBmateqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217030574"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Mar 2026 20:05:54 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w09tP-000000000d7-3Rtg;
	Wed, 11 Mar 2026 03:05:51 +0000
Date: Wed, 11 Mar 2026 11:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 14/14]
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c:562:34: warning: result of
 comparison of constant 17592186040320 with expression of type
 'resource_size_t' (aka 'unsigned int') is always false
Message-ID: <202603111009.uMQCvMNh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0104b0412b0a41935ece11bfd31b3b309c734cd7
commit: b1ac27dd8a57803034f8361d820e3f2580714031 [14/14] ANDROID: ABI: refresh, CRC fixups and allowed breaks
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260311/202603111009.uMQCvMNh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111009.uMQCvMNh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111009.uMQCvMNh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gem/i915_gem_shmem.c:14:
   In file included from drivers/gpu/drm/i915/i915_drv.h:46:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:19:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h:9:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:12:
   In file included from drivers/gpu/drm/i915/intel_device_info.h:36:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:12:
   In file included from include/drm/drm_gem.h:38:
   include/linux/dma-buf.h:547:2: error: static assertion failed due to requirement '__alignof(struct dma_buf::(unnamed at include/linux/dma-buf.h:547:2)) <= __alignof(struct dma_buf::(unnamed at include/linux/dma-buf.h:547:2))': include/linux/dma-buf.h:547: u64 __kabi_reserved_backport1 is not aligned the same as atomic64_t nr_task_refs
     547 |         ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:189:2: note: expanded from macro 'ANDROID_BACKPORT_USE'
     189 |         _ANDROID_KABI_REPLACE(ANDROID_BACKPORT_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:3: note: expanded from macro '_ANDROID_KABI_REPLACE'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:66:4: note: expanded from macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      66 |                         __alignof__(struct { _new; }) <=                \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      67 |                                 __alignof__(struct { _orig; }),         \
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:547:2: note: expression evaluates to '8 <= 4'
     547 |         ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:189:2: note: expanded from macro 'ANDROID_BACKPORT_USE'
     189 |         _ANDROID_KABI_REPLACE(ANDROID_BACKPORT_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:3: note: expanded from macro '_ANDROID_KABI_REPLACE'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:66:34: note: expanded from macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      66 |                         __alignof__(struct { _new; }) <=                \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
      67 |                                 __alignof__(struct { _orig; }),         \
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:562:34: warning: result of comparison of constant 17592186040320 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     562 |         if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
         |                                    ~~~~ ^ ~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +562 drivers/gpu/drm/i915/gem/i915_gem_shmem.c

8475355f7a2645a Chris Wilson    2019-05-28  541  
da1184cd41d4c6b Matthew Auld    2019-10-18  542  static int __create_shmem(struct drm_i915_private *i915,
8475355f7a2645a Chris Wilson    2019-05-28  543  			  struct drm_gem_object *obj,
da1184cd41d4c6b Matthew Auld    2019-10-18  544  			  resource_size_t size)
8475355f7a2645a Chris Wilson    2019-05-28  545  {
8475355f7a2645a Chris Wilson    2019-05-28  546  	unsigned long flags = VM_NORESERVE;
8475355f7a2645a Chris Wilson    2019-05-28  547  	struct file *filp;
8475355f7a2645a Chris Wilson    2019-05-28  548  
8475355f7a2645a Chris Wilson    2019-05-28  549  	drm_gem_private_object_init(&i915->drm, obj, size);
8475355f7a2645a Chris Wilson    2019-05-28  550  
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  551  	/* XXX: The __shmem_file_setup() function returns -EINVAL if size is
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  552  	 * greater than MAX_LFS_FILESIZE.
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  553  	 * To handle the same error as other code that returns -E2BIG when
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  554  	 * the size is too large, we add a code that returns -E2BIG when the
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  555  	 * size is larger than the size that can be handled.
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  556  	 * If BITS_PER_LONG is 32, size > MAX_LFS_FILESIZE is always false,
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  557  	 * so we only needs to check when BITS_PER_LONG is 64.
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  558  	 * If BITS_PER_LONG is 32, E2BIG checks are processed when
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  559  	 * i915_gem_object_size_2big() is called before init_object() callback
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  560  	 * is called.
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  561  	 */
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28 @562  	if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  563  		return -E2BIG;
662c04e2b8c6fe8 Gwan-gyeong Mun 2022-12-28  564  
8475355f7a2645a Chris Wilson    2019-05-28  565  	if (i915->mm.gemfs)
8475355f7a2645a Chris Wilson    2019-05-28  566  		filp = shmem_file_setup_with_mnt(i915->mm.gemfs, "i915", size,
8475355f7a2645a Chris Wilson    2019-05-28  567  						 flags);
8475355f7a2645a Chris Wilson    2019-05-28  568  	else
8475355f7a2645a Chris Wilson    2019-05-28  569  		filp = shmem_file_setup("i915", size, flags);
8475355f7a2645a Chris Wilson    2019-05-28  570  	if (IS_ERR(filp))
8475355f7a2645a Chris Wilson    2019-05-28  571  		return PTR_ERR(filp);
8475355f7a2645a Chris Wilson    2019-05-28  572  
8475355f7a2645a Chris Wilson    2019-05-28  573  	obj->filp = filp;
8475355f7a2645a Chris Wilson    2019-05-28  574  	return 0;
8475355f7a2645a Chris Wilson    2019-05-28  575  }
8475355f7a2645a Chris Wilson    2019-05-28  576  

:::::: The code at line 562 was first introduced by commit
:::::: 662c04e2b8c6fe8eb2f2b88c62e25c8241d0f793 drm/i915: Check if the size is too big while creating shmem file

:::::: TO: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
