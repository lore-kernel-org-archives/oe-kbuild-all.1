Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB32A92E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 00:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765154320; cv=none; b=pNxrS2j+FlZLCSziU95vBNx+VDIbPJoXRzLsUwzaa10f0sh0B0f1jRzwUopKrWWtaj+A9cdMq7QRaWUHxa/e+AEOjHGgNXlNCitF01UNjUwUK3NEsXuL5s2FlJr9Uunx02MrDOW0HV3p6URF1R7OBYCVz5qEgmrYgAXn1FXWAzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765154320; c=relaxed/simple;
	bh=vCwLHVK9o3SHWrXrUbzoX6LD36v1LALl7OJrtE3NRNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cojv96oyZYIJn9QQ1nJSjpShbI4Z4eyrPxLxdtKrGPhNdcVu0xI2q2MDYXZC+h3jM/jdg0UfnPzVeiEQJ9l8iKcd0RBKh0nNmCoBq5yb8MmXYO9XMIDpt9UYoGCsF3rdS2cX0EfS7JKfb4rwwgDqxzbwNEVK/RuN2n9RrwVFejI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ir/yAPNF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ir/yAPNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765154318; x=1796690318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vCwLHVK9o3SHWrXrUbzoX6LD36v1LALl7OJrtE3NRNA=;
  b=Ir/yAPNF6HWucKNDUOW3y5Ai1KXJa3at9XVem04Fxes+Mw9N7ooZI6Xv
   0qH9LmKKCALMRSs4HHQDOL2tnYRze/1uYNtPm0DQJWhRs5Zuh9U2FP+RX
   vE0IiSY8sBP1tcGAUQcWq9fmHbV0F4MXfjXpSXFbM1th3X+KzWgkK2U1n
   JJd6clMWmhbKjfRI6SF5O0hwauXo/R4Dv5AshqVnzzWkzeKgLRnYwjfvV
   FOZw6NGvuf+ennwcD5o/LPUuLOdA0anTdo2xfojLP3oIyxPAhyE/7J46c
   yxM0hVHA/DejJlcr44l+mxZ4uOQYBftArYSTBlUQ8ZX8bBLfZfuVg/fza
   A==;
X-CSE-ConnectionGUID: 3DNS/3J5SNmcY9uVVh9Taw==
X-CSE-MsgGUID: 6XFNZDPrTCi023c8Hx18rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66992007"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="66992007"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 16:38:38 -0800
X-CSE-ConnectionGUID: eSqWVkwCS3WoAL8HhMXWvw==
X-CSE-MsgGUID: Pw2zzrtfSqeJs8obdzNzmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="196569328"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Dec 2025 16:38:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSPGs-00000000Jjp-3eIT;
	Mon, 08 Dec 2025 00:38:34 +0000
Date: Mon, 8 Dec 2025 08:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7/7]
 drivers/gpu/drm/xe/tests/xe_bo.c:461:17: sparse: sparse: cast truncates bits
 from constant value (800000000 becomes 0)
Message-ID: <202512080855.nVuw3IOc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d0bf55e49c08c429d48fa782a0bb545804ffacb6
commit: a0a3f0a41c8789060f0ed28f79066d97bfc47a8b [7/7] UPSTREAM: drm/xe: Add a xe_bo subtest for shrinking / swapping
config: arm-randconfig-r121-20251208 (https://download.01.org/0day-ci/archive/20251208/202512080855.nVuw3IOc-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080855.nVuw3IOc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080855.nVuw3IOc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_bo.c: note: in included file:
>> drivers/gpu/drm/xe/tests/xe_bo.c:461:17: sparse: sparse: cast truncates bits from constant value (800000000 becomes 0)
   drivers/gpu/drm/xe/tests/xe_bo.c:464:25: sparse: sparse: cast truncates bits from constant value (400000000 becomes 0)

vim +461 drivers/gpu/drm/xe/tests/xe_bo.c

   435	
   436	/*
   437	 * Try to create system bos corresponding to twice the amount
   438	 * of available system memory to test shrinker functionality.
   439	 * If no swap space is available to accommodate the
   440	 * memory overcommit, mark bos purgeable.
   441	 */
   442	static int shrink_test_run_device(struct xe_device *xe)
   443	{
   444		struct kunit *test = kunit_get_current_test();
   445		LIST_HEAD(bos);
   446		struct xe_bo_link *link, *next;
   447		struct sysinfo si;
   448		size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
   449		unsigned int interrupted = 0, successful = 0, count = 0;
   450		struct rnd_state prng;
   451		u64 rand_seed;
   452		bool failed = false;
   453	
   454		rand_seed = get_random_u64();
   455		prandom_seed_state(&prng, rand_seed);
   456		kunit_info(test, "Random seed is 0x%016llx.\n",
   457			   (unsigned long long)rand_seed);
   458	
   459		/* Skip if execution time is expected to be too long. */
   460	
 > 461		limit = SZ_32G;
   462		/* IGFX with flat CCS needs to copy when swapping / shrinking */
   463		if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
   464			limit = SZ_16G;
   465	
   466		si_meminfo(&si);
   467		ram = (size_t)si.freeram * si.mem_unit;
   468		if (ram > limit) {
   469			kunit_skip(test, "Too long expected execution time.\n");
   470			return 0;
   471		}
   472		to_alloc = ram * 2;
   473	
   474		ram_and_swap = ram + get_nr_swap_pages() * PAGE_SIZE;
   475		if (to_alloc > ram_and_swap)
   476			purgeable = to_alloc - ram_and_swap;
   477		purgeable += purgeable / 5;
   478	
   479		kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
   480			   (unsigned long)ram);
   481		for (alloced = 0; alloced < to_alloc; alloced += XE_BO_SHRINK_SIZE) {
   482			struct xe_bo *bo;
   483			unsigned int mem_type;
   484			struct xe_ttm_tt *xe_tt;
   485	
   486			link = kzalloc(sizeof(*link), GFP_KERNEL);
   487			if (!link) {
   488				KUNIT_FAIL(test, "Unexpected link allocation failure\n");
   489				failed = true;
   490				break;
   491			}
   492	
   493			INIT_LIST_HEAD(&link->link);
   494	
   495			/* We can create bos using WC caching here. But it is slower. */
   496			bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
   497					       DRM_XE_GEM_CPU_CACHING_WB,
   498					       XE_BO_FLAG_SYSTEM);
   499			if (IS_ERR(bo)) {
   500				if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
   501				    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
   502					KUNIT_FAIL(test, "Error creating bo: %pe\n", bo);
   503				kfree(link);
   504				failed = true;
   505				break;
   506			}
   507			xe_bo_lock(bo, false);
   508			xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
   509	
   510			/*
   511			 * Allocate purgeable bos first, because if we do it the
   512			 * other way around, they may not be subject to swapping...
   513			 */
   514			if (alloced < purgeable) {
   515				xe_tt->purgeable = true;
   516				bo->ttm.priority = 0;
   517			} else {
   518				int ret = shrink_test_fill_random(bo, &prng, link);
   519	
   520				if (ret) {
   521					xe_bo_unlock(bo);
   522					xe_bo_put(bo);
   523					KUNIT_FAIL(test, "Error filling bo with random data: %pe\n",
   524						   ERR_PTR(ret));
   525					kfree(link);
   526					failed = true;
   527					break;
   528				}
   529			}
   530	
   531			mem_type = bo->ttm.resource->mem_type;
   532			xe_bo_unlock(bo);
   533			link->bo = bo;
   534			list_add_tail(&link->link, &bos);
   535	
   536			if (mem_type != XE_PL_TT) {
   537				KUNIT_FAIL(test, "Bo in incorrect memory type: %u\n",
   538					   bo->ttm.resource->mem_type);
   539				failed = true;
   540			}
   541			cond_resched();
   542			if (signal_pending(current))
   543				break;
   544		}
   545	
   546		/*
   547		 * Read back and destroy bos. Reset the pseudo-random seed to get an
   548		 * identical pseudo-random number sequence for readback.
   549		 */
   550		prandom_seed_state(&prng, rand_seed);
   551		list_for_each_entry_safe(link, next, &bos, link) {
   552			static struct ttm_operation_ctx ctx = {.interruptible = true};
   553			struct xe_bo *bo = link->bo;
   554			struct xe_ttm_tt *xe_tt;
   555			int ret;
   556	
   557			count++;
   558			if (!signal_pending(current) && !failed) {
   559				bool purgeable, intr = false;
   560	
   561				xe_bo_lock(bo, NULL);
   562	
   563				/* xe_tt->purgeable is cleared on validate. */
   564				xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
   565				purgeable = xe_tt->purgeable;
   566				do {
   567					ret = ttm_bo_validate(&bo->ttm, &tt_placement, &ctx);
   568					if (ret == -EINTR)
   569						intr = true;
   570				} while (ret == -EINTR && !signal_pending(current));
   571	
   572				if (!ret && !purgeable)
   573					failed = shrink_test_verify(test, bo, count, &prng, link);
   574	
   575				xe_bo_unlock(bo);
   576				if (ret) {
   577					KUNIT_FAIL(test, "Validation failed: %pe\n",
   578						   ERR_PTR(ret));
   579					failed = true;
   580				} else if (intr) {
   581					interrupted++;
   582				} else {
   583					successful++;
   584				}
   585			}
   586			xe_bo_put(link->bo);
   587			list_del(&link->link);
   588			kfree(link);
   589		}
   590		kunit_info(test, "Readbacks interrupted: %u successful: %u\n",
   591			   interrupted, successful);
   592	
   593		return 0;
   594	}
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
