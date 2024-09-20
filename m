Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D737B17C21C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726844880; cv=none; b=kB3lF5hbGSV67TJMadbGiwUbgwLLknbyMEFeiDWBPvv2zmfDtBI/gypDpCTN+FFHN3aMQAtxaIETUOPFXda6VtkXi6FaceCr8mrDsZqrpzg8fYVtI370YPiM2i2VU5ATyO/z1NQGwMvj5Y3o7Kn44bEg1+VNNAGoH6Vct7aIV2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726844880; c=relaxed/simple;
	bh=rAjD4pWgj9d1EhshlEput+1r54GIXt6GXGqlisBsw/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dopneY2KIUFAux7+wAyYiNYQmQvXtDdvbhlD+YHq6dTO4NaCjoJCib1HxIzUBcMtzUacX0MIsXYbqJAUgj/IqOBDnBzRTgipFnX3vFk6AcfcVJXVx2+m8JOV9x1S6E29fK/iYjMDzjQVpkxnnFWluFi0fPHnpHyqf5Wypamof0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmHXrZfk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmHXrZfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726844879; x=1758380879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rAjD4pWgj9d1EhshlEput+1r54GIXt6GXGqlisBsw/E=;
  b=JmHXrZfk8TAf+8JkES9ELAbzxGCVWg5g7wk05IXrSDR5NO6E91K7SEMb
   SxjEkL46wqpdwYeZGx2iBvCithANORIFHgoQ9HCufDtFiKbZHtTXtKtF0
   /9ONnjdNNMIJmJEqYqqSeGK9GbSSKYlp83Nj6JId7MT0E0sk/IgZLZrm0
   S/4YqZqtPy5HP9z2D5te/06LwVjq/60tRaTNS1DBZ3TeQy3OYp++thof+
   unwtLwEO9NyLM1XFEsKmHFXZdcb1QbJl4Ir8KuOwiySyMHkOHEHmMpu7b
   VV7rMP8NIuf1jW2bcJ7C4HmkNZof35c0y8Rfpmlrf7CU6s8eyUPXmT5uQ
   w==;
X-CSE-ConnectionGUID: PtGKFQbfRpWFPD4f52HPRw==
X-CSE-MsgGUID: QOAoJPIJQwuixwNSXR+l0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="28750812"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="28750812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 08:07:57 -0700
X-CSE-ConnectionGUID: eHnjh3LhR+O/w5r56bbMRA==
X-CSE-MsgGUID: bmCvKJOPQcymfkP5HIhqug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70469485"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Sep 2024 08:07:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srfEf-000EZJ-2V;
	Fri, 20 Sep 2024 15:07:53 +0000
Date: Fri, 20 Sep 2024 23:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [linux-next:master 10737/12481]
 drivers/gpu/drm/xe/tests/xe_bo.c:456:17: sparse: sparse: cast truncates bits
 from constant value (800000000 becomes 0)
Message-ID: <202409202208.UBP1iDim-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   62f92d634458a1e308bb699986b9147a6d670457
commit: 5a90b60db5e6765367d9bb2c03f66b14d72946d2 [10737/12481] drm/xe: Add a xe_bo subtest for shrinking / swapping
config: i386-randconfig-061-20240920 (https://download.01.org/0day-ci/archive/20240920/202409202208.UBP1iDim-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409202208.UBP1iDim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409202208.UBP1iDim-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_bo.c: note: in included file:
   drivers/gpu/drm/xe/xe_bo.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/gpu/drm/xe/xe_bo.c: note: in included file:
>> drivers/gpu/drm/xe/tests/xe_bo.c:456:17: sparse: sparse: cast truncates bits from constant value (800000000 becomes 0)
   drivers/gpu/drm/xe/tests/xe_bo.c:459:25: sparse: sparse: cast truncates bits from constant value (400000000 becomes 0)
   drivers/gpu/drm/xe/xe_bo.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +456 drivers/gpu/drm/xe/tests/xe_bo.c

   430	
   431	/*
   432	 * Try to create system bos corresponding to twice the amount
   433	 * of available system memory to test shrinker functionality.
   434	 * If no swap space is available to accommodate the
   435	 * memory overcommit, mark bos purgeable.
   436	 */
   437	static int shrink_test_run_device(struct xe_device *xe)
   438	{
   439		struct kunit *test = kunit_get_current_test();
   440		LIST_HEAD(bos);
   441		struct xe_bo_link *link, *next;
   442		struct sysinfo si;
   443		size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
   444		unsigned int interrupted = 0, successful = 0, count = 0;
   445		struct rnd_state prng;
   446		u64 rand_seed;
   447		bool failed = false;
   448	
   449		rand_seed = get_random_u64();
   450		prandom_seed_state(&prng, rand_seed);
   451		kunit_info(test, "Random seed is 0x%016llx.\n",
   452			   (unsigned long long)rand_seed);
   453	
   454		/* Skip if execution time is expected to be too long. */
   455	
 > 456		limit = SZ_32G;
   457		/* IGFX with flat CCS needs to copy when swapping / shrinking */
   458		if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
   459			limit = SZ_16G;
   460	
   461		si_meminfo(&si);
   462		ram = (size_t)si.freeram * si.mem_unit;
   463		if (ram > limit) {
   464			kunit_skip(test, "Too long expected execution time.\n");
   465			return 0;
   466		}
   467		to_alloc = ram * 2;
   468	
   469		ram_and_swap = ram + get_nr_swap_pages() * PAGE_SIZE;
   470		if (to_alloc > ram_and_swap)
   471			purgeable = to_alloc - ram_and_swap;
   472		purgeable += purgeable / 5;
   473	
   474		kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
   475			   (unsigned long)ram);
   476		for (alloced = 0; alloced < to_alloc; alloced += XE_BO_SHRINK_SIZE) {
   477			struct xe_bo *bo;
   478			unsigned int mem_type;
   479			struct xe_ttm_tt *xe_tt;
   480	
   481			link = kzalloc(sizeof(*link), GFP_KERNEL);
   482			if (!link) {
   483				KUNIT_FAIL(test, "Unexpected link allocation failure\n");
   484				failed = true;
   485				break;
   486			}
   487	
   488			INIT_LIST_HEAD(&link->link);
   489	
   490			/* We can create bos using WC caching here. But it is slower. */
   491			bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
   492					       DRM_XE_GEM_CPU_CACHING_WB,
   493					       XE_BO_FLAG_SYSTEM);
   494			if (IS_ERR(bo)) {
   495				if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
   496				    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
   497					KUNIT_FAIL(test, "Error creating bo: %pe\n", bo);
   498				kfree(link);
   499				failed = true;
   500				break;
   501			}
   502			xe_bo_lock(bo, false);
   503			xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
   504	
   505			/*
   506			 * Allocate purgeable bos first, because if we do it the
   507			 * other way around, they may not be subject to swapping...
   508			 */
   509			if (alloced < purgeable) {
   510				xe_tt->purgeable = true;
   511				bo->ttm.priority = 0;
   512			} else {
   513				int ret = shrink_test_fill_random(bo, &prng, link);
   514	
   515				if (ret) {
   516					xe_bo_unlock(bo);
   517					xe_bo_put(bo);
   518					KUNIT_FAIL(test, "Error filling bo with random data: %pe\n",
   519						   ERR_PTR(ret));
   520					kfree(link);
   521					failed = true;
   522					break;
   523				}
   524			}
   525	
   526			mem_type = bo->ttm.resource->mem_type;
   527			xe_bo_unlock(bo);
   528			link->bo = bo;
   529			list_add_tail(&link->link, &bos);
   530	
   531			if (mem_type != XE_PL_TT) {
   532				KUNIT_FAIL(test, "Bo in incorrect memory type: %u\n",
   533					   bo->ttm.resource->mem_type);
   534				failed = true;
   535			}
   536			cond_resched();
   537			if (signal_pending(current))
   538				break;
   539		}
   540	
   541		/*
   542		 * Read back and destroy bos. Reset the pseudo-random seed to get an
   543		 * identical pseudo-random number sequence for readback.
   544		 */
   545		prandom_seed_state(&prng, rand_seed);
   546		list_for_each_entry_safe(link, next, &bos, link) {
   547			static struct ttm_operation_ctx ctx = {.interruptible = true};
   548			struct xe_bo *bo = link->bo;
   549			struct xe_ttm_tt *xe_tt;
   550			int ret;
   551	
   552			count++;
   553			if (!signal_pending(current) && !failed) {
   554				bool purgeable, intr = false;
   555	
   556				xe_bo_lock(bo, NULL);
   557	
   558				/* xe_tt->purgeable is cleared on validate. */
   559				xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
   560				purgeable = xe_tt->purgeable;
   561				do {
   562					ret = ttm_bo_validate(&bo->ttm, &tt_placement, &ctx);
   563					if (ret == -EINTR)
   564						intr = true;
   565				} while (ret == -EINTR && !signal_pending(current));
   566	
   567				if (!ret && !purgeable)
   568					failed = shrink_test_verify(test, bo, count, &prng, link);
   569	
   570				xe_bo_unlock(bo);
   571				if (ret) {
   572					KUNIT_FAIL(test, "Validation failed: %pe\n",
   573						   ERR_PTR(ret));
   574					failed = true;
   575				} else if (intr) {
   576					interrupted++;
   577				} else {
   578					successful++;
   579				}
   580			}
   581			xe_bo_put(link->bo);
   582			list_del(&link->link);
   583			kfree(link);
   584		}
   585		kunit_info(test, "Readbacks interrupted: %u successful: %u\n",
   586			   interrupted, successful);
   587	
   588		return 0;
   589	}
   590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
