Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD38B27056E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 19:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373807; cv=none; b=tKtfdT0nl811KwE4T87MzMefTZrTiVY8LP8wY5RlInAJ9eXQ2ns+inSSS7UkYTosc+X84J+9OiD1TQosLYoD9Zx4Xo2PteRnreQ+GmpRhedywTpEv+ot1sxPkCYQv7UYZpJzYy1orj87WNKaHdx9dooK85RnEJBAnDlDkAFQg9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373807; c=relaxed/simple;
	bh=r6XNekxnfYGGXt6vcn5w+XQ/BJ/A0dYE4hSm6d94JXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HzHu4Qsbzf47r8RUVOjz3YfYTTdnJbp7iDLqSx5FlWEMsCNKkG18x5t4eSVuKCw0rOOlbueYmXp73vmQavBvH77kVbB5wTJ9AWi+8MiKuXvGSm8mNXR+Sfj54N8vqmPEC5rGzGj0Xykd8F5gnQ6GapG64LDkmAvz4/2p6lYwCEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sdd13Oyz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sdd13Oyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748373805; x=1779909805;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r6XNekxnfYGGXt6vcn5w+XQ/BJ/A0dYE4hSm6d94JXs=;
  b=Sdd13OyzUZ3j1I1nG8CAB2xl9JP/lxl9RG9t/2YoEFxpS3wiYggp2Ezp
   CD5D41uoAnLe4vb4nVctDqwTYnB9jEVLt/Kw84RLZgW3ke6NrnDPqYqL3
   UBK14EVz2Ei6RF159PFiwCIOhOJoGaI7POgepDaZ1V5CPNupaB1Lyb4XS
   9K+uui3Vhhb0ehKyc3kkvVVuI4t9kKKbB8QwB6vUuMyyehXU7crlgrWC1
   eY+GcHMrAqdU1BWEtSPtPR/YQCrqAb7R8cGkWcwvXNl8EdBNWCJIYY+V5
   P0nPfeNz/4Sn2HstGsIPnV4fSh5oQSQGr5NZN8U05V+suvvthd/oA05Cd
   A==;
X-CSE-ConnectionGUID: WRfqGD41T02T/RnWeW1YdA==
X-CSE-MsgGUID: aFPNAuhjSFa74GcogjyezQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61435776"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61435776"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 12:23:25 -0700
X-CSE-ConnectionGUID: IEY67+7sRz2Dvpv75le6Eg==
X-CSE-MsgGUID: Sl8N4jsIQpeGluHWYQUFQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="180156213"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 May 2025 12:23:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJztQ-000Ux2-2K;
	Tue, 27 May 2025 19:23:20 +0000
Date: Wed, 28 May 2025 03:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:61: error: no member named
 'notifier' in 'struct amdgpu_bo'
Message-ID: <202505280315.2rqi42ay-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   91fb5777860445a6e581b73185eac7939af816cd
commit: 5fea46daeca8ba4ba6148654ffb6b8c6c5d9b71d [1/1] ANDROID: GKI: x86: Enable HMM_MIRROR as DRM hidden
config: i386-randconfig-r063-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280315.2rqi42ay-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280315.2rqi42ay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280315.2rqi42ay-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:61: error: no member named 'notifier' in 'struct amdgpu_bo'
      70 |         struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:74: note: expanded from macro '__same_type'
     498 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:70:25: error: no member named 'notifier' in 'amdgpu_bo'
      70 |         struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
         |                                ^                                   ~~~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:79:2: error: call to undeclared function 'mmu_interval_set_seq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |         mmu_interval_set_seq(mni, cur_seq);
         |         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:107:61: error: no member named 'notifier' in 'struct amdgpu_bo'
     107 |         struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:74: note: expanded from macro '__same_type'
     498 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:107:25: error: no member named 'notifier' in 'amdgpu_bo'
     107 |         struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
         |                                ^                                   ~~~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:135:7: error: call to undeclared function 'mmu_interval_notifier_insert'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     135 |                 r = mmu_interval_notifier_insert(&bo->notifier, current->mm,
         |                     ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:135:7: note: did you mean 'vma_interval_tree_insert'?
   include/linux/mm.h:3380:6: note: 'vma_interval_tree_insert' declared here
    3380 | void vma_interval_tree_insert(struct vm_area_struct *node,
         |      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:135:41: error: no member named 'notifier' in 'struct amdgpu_bo'
     135 |                 r = mmu_interval_notifier_insert(&bo->notifier, current->mm,
         |                                                   ~~  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:139:41: error: no member named 'notifier' in 'struct amdgpu_bo'
     139 |                 r = mmu_interval_notifier_insert(&bo->notifier, current->mm, addr,
         |                                                   ~~  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:148:7: error: no member named 'notifier' in 'struct amdgpu_bo'
     148 |                 bo->notifier.mm = NULL;
         |                 ~~  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:162:11: error: no member named 'notifier' in 'struct amdgpu_bo'
     162 |         if (!bo->notifier.mm)
         |              ~~  ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:164:2: error: call to undeclared function 'mmu_interval_notifier_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     164 |         mmu_interval_notifier_remove(&bo->notifier);
         |         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:164:2: note: did you mean 'vma_interval_tree_remove'?
   include/linux/mm.h:3385:6: note: 'vma_interval_tree_remove' declared here
    3385 | void vma_interval_tree_remove(struct vm_area_struct *node,
         |      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:164:36: error: no member named 'notifier' in 'struct amdgpu_bo'
     164 |         mmu_interval_notifier_remove(&bo->notifier);
         |                                       ~~  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:165:6: error: no member named 'notifier' in 'struct amdgpu_bo'
     165 |         bo->notifier.mm = NULL;
         |         ~~  ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:208:29: error: call to undeclared function 'mmu_interval_read_begin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     208 |                 hmm_range->notifier_seq = mmu_interval_read_begin(notifier);
         |                                           ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:251:6: error: call to undeclared function 'mmu_interval_read_retry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     251 |         r = mmu_interval_read_retry(hmm_range->notifier,
         |             ^
   15 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +70 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c

c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17   55  
1ed3d2567c800e drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2017-09-05   56  /**
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09   57   * amdgpu_hmm_invalidate_gfx - callback to notify about mm change
1ed3d2567c800e drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2017-09-05   58   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   59   * @mni: the range (mm) is about to update
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   60   * @range: details on the invalidation
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   61   * @cur_seq: Value to pass to mmu_interval_set_seq()
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20   62   *
ad7f0b6334fe3c drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2018-06-05   63   * Block for operations on BOs to finish and mark pages as accessed and
ad7f0b6334fe3c drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2018-06-05   64   * potentially dirty.
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20   65   */
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09   66  static bool amdgpu_hmm_invalidate_gfx(struct mmu_interval_notifier *mni,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   67  				      const struct mmu_notifier_range *range,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   68  				      unsigned long cur_seq)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20   69  {
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  @70  	struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   71  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
7ab7e8a4096d2a drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jack Xiao       2015-04-27   72  	long r;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20   73  
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   74  	if (!mmu_notifier_range_blockable(range))
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   75  		return false;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20   76  
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   77  	mutex_lock(&adev->notifier_lock);
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   78  
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  @79  	mmu_interval_set_seq(mni, cur_seq);
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   80  
0cc848a75b742c drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2021-11-09   81  	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_BOOKKEEP,
7bc80a5462c37e drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2021-11-09   82  				  false, MAX_SCHEDULE_TIMEOUT);
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   83  	mutex_unlock(&adev->notifier_lock);
7ab7e8a4096d2a drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jack Xiao       2015-04-27   84  	if (r <= 0)
7ab7e8a4096d2a drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jack Xiao       2015-04-27   85  		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   86  	return true;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20   87  }
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   88  
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09   89  static const struct mmu_interval_notifier_ops amdgpu_hmm_gfx_ops = {
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09   90  	.invalidate = amdgpu_hmm_invalidate_gfx,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   91  };
0d2b42b0bdba45 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2016-03-18   92  
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2016-03-18   93  /**
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09   94   * amdgpu_hmm_invalidate_hsa - callback to notify about mm change
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2016-03-18   95   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   96   * @mni: the range (mm) is about to update
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   97   * @range: details on the invalidation
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12   98   * @cur_seq: Value to pass to mmu_interval_set_seq()
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2016-03-18   99   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  100   * We temporarily evict the BO attached to this range. This necessitates
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  101   * evicting all user-mode queues of the process.
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2016-03-18  102   */
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09  103  static bool amdgpu_hmm_invalidate_hsa(struct mmu_interval_notifier *mni,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  104  				      const struct mmu_notifier_range *range,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  105  				      unsigned long cur_seq)
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2016-03-18  106  {
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  107  	struct amdgpu_bo *bo = container_of(mni, struct amdgpu_bo, notifier);
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2016-03-18  108  
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  109  	if (!mmu_notifier_range_blockable(range))
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  110  		return false;
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2016-03-18  111  
f95f51a4c3357e drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Felix Kuehling  2021-04-21  112  	amdgpu_amdkfd_evict_userptr(mni, cur_seq, bo->kfd_bo);
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2016-03-18  113  
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  114  	return true;
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2016-03-18  115  }
93065ac753e444 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Michal Hocko    2018-08-21  116  
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09  117  static const struct mmu_interval_notifier_ops amdgpu_hmm_hsa_ops = {
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09  118  	.invalidate = amdgpu_hmm_invalidate_hsa,
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  119  };
ae20f12d2de662 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Christian König 2016-03-18  120  
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  121  /**
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09  122   * amdgpu_hmm_register - register a BO for notifier updates
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  123   *
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  124   * @bo: amdgpu buffer object
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  125   * @addr: userptr addr we should monitor
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  126   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  127   * Registers a mmu_notifier for the given BO at the specified address.
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  128   * Returns 0 on success, -ERRNO if anything goes wrong.
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  129   */
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09  130  int amdgpu_hmm_register(struct amdgpu_bo *bo, unsigned long addr)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  131  {
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  132  	int r;
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  133  
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  134  	if (bo->kfd_bo)
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06 @135  		r = mmu_interval_notifier_insert(&bo->notifier, current->mm,
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  136  						    addr, amdgpu_bo_size(bo),
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09  137  						    &amdgpu_hmm_hsa_ops);
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  138  	else
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  139  		r = mmu_interval_notifier_insert(&bo->notifier, current->mm, addr,
81fa1af31b5d79 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  140  							amdgpu_bo_size(bo),
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09  141  							&amdgpu_hmm_gfx_ops);
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  142  	if (r)
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  143  		/*
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  144  		 * Make sure amdgpu_hmm_unregister() doesn't call
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  145  		 * mmu_interval_notifier_remove() when the notifier isn't properly
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  146  		 * initialized.
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  147  		 */
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  148  		bo->notifier.mm = NULL;
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  149  
22207fd5c80177 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Vitaly Prosyak  2024-03-06  150  	return r;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  151  }
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  152  
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  153  /**
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09  154   * amdgpu_hmm_unregister - unregister a BO for notifier updates
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  155   *
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  156   * @bo: amdgpu buffer object
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  157   *
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  158   * Remove any registration of mmu notifier updates from the buffer object.
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  159   */
d9483ecd327b75 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09  160  void amdgpu_hmm_unregister(struct amdgpu_bo *bo)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  161  {
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  162  	if (!bo->notifier.mm)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  163  		return;
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12 @164  	mmu_interval_notifier_remove(&bo->notifier);
62914a99dee5ac drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Jason Gunthorpe 2019-11-12  165  	bo->notifier.mm = NULL;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Deucher    2015-04-20  166  }
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  167  
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  168  int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
d4cbff464d2932 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09  169  			       uint64_t start, uint64_t npages, bool readonly,
d4cbff464d2932 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09  170  			       void *owner, struct page **pages,
d4cbff464d2932 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Christian König 2022-11-09  171  			       struct hmm_range **phmm_range)
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  172  {
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  173  	struct hmm_range *hmm_range;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  174  	unsigned long end;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  175  	unsigned long timeout;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  176  	unsigned long i;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  177  	unsigned long *pfns;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  178  	int r = 0;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  179  
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  180  	hmm_range = kzalloc(sizeof(*hmm_range), GFP_KERNEL);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  181  	if (unlikely(!hmm_range))
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  182  		return -ENOMEM;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  183  
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  184  	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  185  	if (unlikely(!pfns)) {
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  186  		r = -ENOMEM;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  187  		goto out_free_range;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  188  	}
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  189  
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  190  	hmm_range->notifier = notifier;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  191  	hmm_range->default_flags = HMM_PFN_REQ_FAULT;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  192  	if (!readonly)
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  193  		hmm_range->default_flags |= HMM_PFN_REQ_WRITE;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  194  	hmm_range->hmm_pfns = pfns;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  195  	hmm_range->start = start;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  196  	end = start + npages * PAGE_SIZE;
8c21fc49a8e637 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Alex Sierra     2021-05-06  197  	hmm_range->dev_private_owner = owner;
d8a3c1c80ceb65 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2021-03-30  198  
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  199  	do {
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  200  		hmm_range->end = min(hmm_range->start + MAX_WALK_BYTE, end);
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  201  
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  202  		pr_debug("hmm range: start = 0x%lx, end = 0x%lx",
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  203  			hmm_range->start, hmm_range->end);
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  204  
9095e5544061b1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang     2024-04-30  205  		timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  206  
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  207  retry:
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24 @208  		hmm_range->notifier_seq = mmu_interval_read_begin(notifier);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  209  		r = hmm_range_fault(hmm_range);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  210  		if (unlikely(r)) {
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  211  			if (r == -EBUSY && !time_after(jiffies, timeout))
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  212  				goto retry;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  213  			goto out_free_pfns;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  214  		}
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  215  
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  216  		if (hmm_range->end == end)
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  217  			break;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  218  		hmm_range->hmm_pfns += MAX_WALK_BYTE >> PAGE_SHIFT;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  219  		hmm_range->start = hmm_range->end;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  220  	} while (hmm_range->end < end);
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  221  
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  222  	hmm_range->start = start;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  223  	hmm_range->hmm_pfns = pfns;
c1420a5dd4dd2a drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c James Zhu       2022-11-17  224  
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  225  	/*
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  226  	 * Due to default_flags, all pages are HMM_PFN_VALID or
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  227  	 * hmm_range_fault() fails. FIXME: The pages cannot be touched outside
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  228  	 * the notifier_lock, and mmu_interval_read_retry() must be done first.
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  229  	 */
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  230  	for (i = 0; pages && i < npages; i++)
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  231  		pages[i] = hmm_pfn_to_page(pfns[i]);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  232  
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  233  	*phmm_range = hmm_range;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  234  
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  235  	return 0;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  236  
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  237  out_free_pfns:
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  238  	kvfree(pfns);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  239  out_free_range:
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  240  	kfree(hmm_range);
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  241  
9095e5544061b1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang     2024-04-30  242  	if (r == -EBUSY)
9095e5544061b1 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Philip Yang     2024-04-30  243  		r = -EAGAIN;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  244  	return r;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  245  }
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  246  
f95f51a4c3357e drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Felix Kuehling  2021-04-21  247  bool amdgpu_hmm_range_get_pages_done(struct hmm_range *hmm_range)
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  248  {
f95f51a4c3357e drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c Felix Kuehling  2021-04-21  249  	bool r;
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24  250  
04d8d73dbcbe64 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  Philip Yang     2020-02-24 @251  	r = mmu_interval_read_retry(hmm_range->notifier,

:::::: The code at line 70 was first introduced by commit
:::::: 62914a99dee5ac51253a84e7d4a05c18f0c77535 drm/amdgpu: Use mmu_interval_insert instead of hmm_mirror

:::::: TO: Jason Gunthorpe <jgg@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
