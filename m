Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161FA3ACA7A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295268; cv=none; b=FAB9Oq+gLRIi+tC3+pVNc28di7A6IzeSlIrXsn4QxxuC/MjJQT7EHqGDEVFCQXWsr3SrdIoxSsM7DxZPmJScmP6YumVQKyB4F1NEto1YYfUvEIcrNy1qjDNA95eW59lZv2ArL1N9wx8OSkC4czwnb5rHc5Z7rbgNwGndFV+6vIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295268; c=relaxed/simple;
	bh=UzbUBKFC82e272keP7+WCHnA08LEPkzbNuGSGJb0JyA=;
	h=Date:From:Cc:Subject:Message-ID; b=vGR/ZPzys/DDtKdcUgX+/kocdUzn9E8cN9HS3a8IeNXK/bKK0b9cHv3/7hMoEE40FVNMKoOf7VvEdyCvEIipNibxNRsLTJ3piS4L8EGlxRICoRvGJ6QcsOwilroWvkegspmVPJ6B3Cp9t9fzfqhY13URo0KQlZFgWbDrwi6LRic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAwp6Shf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAwp6Shf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784295264; x=1815831264;
  h=date:from:cc:subject:message-id;
  bh=UzbUBKFC82e272keP7+WCHnA08LEPkzbNuGSGJb0JyA=;
  b=HAwp6ShfoPPEgKva0m9QTMxjPdhq9ie87ucTcnLauRcQNrB74y2yw7oM
   lc7Kd+ivhAwnsDUgWk+CVQk+NSY81ZsRGD4TPEj4nednQMyDh/B90eEhW
   fRLlVo23aoUpylOoDrTJC9NRYRihwIECE8gQsXUVAddbnXNN7ajzep7+L
   rjwMM36n3bjtB6gomDWOL8zUxlU2KcZxNbn8ncRpW8fmPzcDo1rAMb4rm
   Es/roIs8fx1+hCKIvqEuJsP9j9Ip1fmXRvC8oOXxnQyPZaiOF4/rc7czJ
   hn2TU9pFbJRhVH5BIRvt/KTXkrUUr36jpSoe2FLeTbRGuWs1b397+MbZL
   Q==;
X-CSE-ConnectionGUID: F4Wvh1MJRICGvXZMJi3fbg==
X-CSE-MsgGUID: qv4n5nukQpm5sGHkODrgIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84088516"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="84088516"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 06:34:23 -0700
X-CSE-ConnectionGUID: xEqzCxpgSk2UZLgzn0beJQ==
X-CSE-MsgGUID: pCRfXZLmTTGfCtbq3lH3Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="252389907"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2026 06:34:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkigw-00000000SlI-0bIr;
	Fri, 17 Jul 2026 13:33:45 +0000
Date: Fri, 17 Jul 2026 21:32:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 1160/1989]
 drivers/gpu/drm/panthor/panthor_gem.c:1498:18: error: too few arguments to
 function 'drm_gem_lru_scan'
Message-ID: <202607172113.t3s6pCJN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   04764d6c56dbf1efec626716b7b36ac121f014e0
commit: 03ad9467e6567c258264a72fd5ef4694e7995149 [1160/1989] Merge tag 'v7.1-rc6' into amd-staging-drm-next
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260717/202607172113.t3s6pCJN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172113.t3s6pCJN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172113.t3s6pCJN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_gem.c: In function 'panthor_gem_shrinker_scan':
   drivers/gpu/drm/panthor/panthor_gem.c:1498:35: error: passing argument 1 of 'drm_gem_lru_scan' from incompatible pointer type [-Wincompatible-pointer-types]
    1498 |         freed += drm_gem_lru_scan(&ptdev->reclaim.unused,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   struct drm_gem_lru *
   In file included from include/drm/drm_gpuvm.h:35,
                    from include/drm/drm_debugfs.h:38,
                    from drivers/gpu/drm/panthor/panthor_gem.c:15:
   include/drm/drm_gem.h:615:37: note: expected 'struct drm_device *' but argument is of type 'struct drm_gem_lru *'
     615 | drm_gem_lru_scan(struct drm_device *dev,
         |                  ~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/panthor/panthor_gem.c:1499:50: error: passing argument 2 of 'drm_gem_lru_scan' makes pointer from integer without a cast [-Wint-conversion]
    1499 |                                   sc->nr_to_scan - freed, &remaining,
         |                                   ~~~~~~~~~~~~~~~^~~~~~~
         |                                                  |
         |                                                  long unsigned int
   include/drm/drm_gem.h:616:38: note: expected 'struct drm_gem_lru *' but argument is of type 'long unsigned int'
     616 |                  struct drm_gem_lru *lru,
         |                  ~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/panthor/panthor_gem.c:1499:59: error: passing argument 3 of 'drm_gem_lru_scan' makes integer from pointer without a cast [-Wint-conversion]
    1499 |                                   sc->nr_to_scan - freed, &remaining,
         |                                                           ^~~~~~~~~~
         |                                                           |
         |                                                           long unsigned int *
   include/drm/drm_gem.h:617:31: note: expected 'unsigned int' but argument is of type 'long unsigned int *'
     617 |                  unsigned int nr_to_scan,
         |                  ~~~~~~~~~~~~~^~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1500:35: error: passing argument 4 of 'drm_gem_lru_scan' from incompatible pointer type [-Wincompatible-pointer-types]
    1500 |                                   panthor_gem_try_evict_no_resv_wait, NULL);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *) {aka _Bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)}
   include/drm/drm_gem.h:618:33: note: expected 'long unsigned int *' but argument is of type 'bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)' {aka '_Bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)'}
     618 |                  unsigned long *remaining,
         |                  ~~~~~~~~~~~~~~~^~~~~~~~~
>> drivers/gpu/drm/panthor/panthor_gem.c:1498:18: error: too few arguments to function 'drm_gem_lru_scan'
    1498 |         freed += drm_gem_lru_scan(&ptdev->reclaim.unused,
         |                  ^~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:615:1: note: declared here
     615 | drm_gem_lru_scan(struct drm_device *dev,
         | ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1504:35: error: passing argument 1 of 'drm_gem_lru_scan' from incompatible pointer type [-Wincompatible-pointer-types]
    1504 |         freed += drm_gem_lru_scan(&ptdev->reclaim.mmapped,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   struct drm_gem_lru *
   include/drm/drm_gem.h:615:37: note: expected 'struct drm_device *' but argument is of type 'struct drm_gem_lru *'
     615 | drm_gem_lru_scan(struct drm_device *dev,
         |                  ~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/panthor/panthor_gem.c:1505:50: error: passing argument 2 of 'drm_gem_lru_scan' makes pointer from integer without a cast [-Wint-conversion]
    1505 |                                   sc->nr_to_scan - freed, &remaining,
         |                                   ~~~~~~~~~~~~~~~^~~~~~~
         |                                                  |
         |                                                  long unsigned int
   include/drm/drm_gem.h:616:38: note: expected 'struct drm_gem_lru *' but argument is of type 'long unsigned int'
     616 |                  struct drm_gem_lru *lru,
         |                  ~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/panthor/panthor_gem.c:1505:59: error: passing argument 3 of 'drm_gem_lru_scan' makes integer from pointer without a cast [-Wint-conversion]
    1505 |                                   sc->nr_to_scan - freed, &remaining,
         |                                                           ^~~~~~~~~~
         |                                                           |
         |                                                           long unsigned int *
   include/drm/drm_gem.h:617:31: note: expected 'unsigned int' but argument is of type 'long unsigned int *'
     617 |                  unsigned int nr_to_scan,
         |                  ~~~~~~~~~~~~~^~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1506:35: error: passing argument 4 of 'drm_gem_lru_scan' from incompatible pointer type [-Wincompatible-pointer-types]
    1506 |                                   panthor_gem_try_evict_no_resv_wait, NULL);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *) {aka _Bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)}
   include/drm/drm_gem.h:618:33: note: expected 'long unsigned int *' but argument is of type 'bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)' {aka '_Bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)'}
     618 |                  unsigned long *remaining,
         |                  ~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1504:18: error: too few arguments to function 'drm_gem_lru_scan'
    1504 |         freed += drm_gem_lru_scan(&ptdev->reclaim.mmapped,
         |                  ^~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:615:1: note: declared here
     615 | drm_gem_lru_scan(struct drm_device *dev,
         | ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1518:35: error: passing argument 1 of 'drm_gem_lru_scan' from incompatible pointer type [-Wincompatible-pointer-types]
    1518 |         freed += drm_gem_lru_scan(&ptdev->reclaim.gpu_mapped_shared,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   struct drm_gem_lru *
   include/drm/drm_gem.h:615:37: note: expected 'struct drm_device *' but argument is of type 'struct drm_gem_lru *'
     615 | drm_gem_lru_scan(struct drm_device *dev,
         |                  ~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/panthor/panthor_gem.c:1519:50: error: passing argument 2 of 'drm_gem_lru_scan' makes pointer from integer without a cast [-Wint-conversion]
    1519 |                                   sc->nr_to_scan - freed, &remaining,
         |                                   ~~~~~~~~~~~~~~~^~~~~~~
         |                                                  |
         |                                                  long unsigned int
   include/drm/drm_gem.h:616:38: note: expected 'struct drm_gem_lru *' but argument is of type 'long unsigned int'
     616 |                  struct drm_gem_lru *lru,
         |                  ~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/panthor/panthor_gem.c:1519:59: error: passing argument 3 of 'drm_gem_lru_scan' makes integer from pointer without a cast [-Wint-conversion]
    1519 |                                   sc->nr_to_scan - freed, &remaining,
         |                                                           ^~~~~~~~~~
         |                                                           |
         |                                                           long unsigned int *
   include/drm/drm_gem.h:617:31: note: expected 'unsigned int' but argument is of type 'long unsigned int *'
     617 |                  unsigned int nr_to_scan,
         |                  ~~~~~~~~~~~~~^~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1520:35: error: passing argument 4 of 'drm_gem_lru_scan' from incompatible pointer type [-Wincompatible-pointer-types]
    1520 |                                   panthor_gem_try_evict, NULL);
         |                                   ^~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *) {aka _Bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)}
   include/drm/drm_gem.h:618:33: note: expected 'long unsigned int *' but argument is of type 'bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)' {aka '_Bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)'}
     618 |                  unsigned long *remaining,
         |                  ~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1518:18: error: too few arguments to function 'drm_gem_lru_scan'
    1518 |         freed += drm_gem_lru_scan(&ptdev->reclaim.gpu_mapped_shared,
         |                  ^~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:615:1: note: declared here
     615 | drm_gem_lru_scan(struct drm_device *dev,
         | ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c: In function 'panthor_gem_shrinker_init':
>> drivers/gpu/drm/panthor/panthor_gem.c:1554:9: error: too many arguments to function 'drm_gem_lru_init'
    1554 |         drm_gem_lru_init(&ptdev->reclaim.unused, &ptdev->reclaim.lock);
         |         ^~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:610:6: note: declared here
     610 | void drm_gem_lru_init(struct drm_gem_lru *lru);
         |      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1555:9: error: too many arguments to function 'drm_gem_lru_init'
    1555 |         drm_gem_lru_init(&ptdev->reclaim.mmapped, &ptdev->reclaim.lock);
         |         ^~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:610:6: note: declared here
     610 | void drm_gem_lru_init(struct drm_gem_lru *lru);
         |      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1556:9: error: too many arguments to function 'drm_gem_lru_init'
    1556 |         drm_gem_lru_init(&ptdev->reclaim.gpu_mapped_shared, &ptdev->reclaim.lock);
         |         ^~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:610:6: note: declared here
     610 | void drm_gem_lru_init(struct drm_gem_lru *lru);
         |      ^~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/panthor/panthor_mmu.c: In function 'panthor_vm_create':
>> drivers/gpu/drm/panthor/panthor_mmu.c:2777:9: error: too many arguments to function 'drm_gem_lru_init'
    2777 |         drm_gem_lru_init(&vm->reclaim.lru, &ptdev->reclaim.lock);
         |         ^~~~~~~~~~~~~~~~
   In file included from include/drm/drm_gpuvm.h:35,
                    from include/drm/drm_debugfs.h:38,
                    from drivers/gpu/drm/panthor/panthor_mmu.c:6:
   include/drm/drm_gem.h:610:6: note: declared here
     610 | void drm_gem_lru_init(struct drm_gem_lru *lru);
         |      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_mmu.c: In function 'panthor_mmu_reclaim_priv_bos':
   drivers/gpu/drm/panthor/panthor_mmu.c:3161:43: error: passing argument 1 of 'drm_gem_lru_scan' from incompatible pointer type [-Wincompatible-pointer-types]
    3161 |                 freed += drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan - freed,
         |                                           ^~~~~~~~~~~~~~~~
         |                                           |
         |                                           struct drm_gem_lru *
   include/drm/drm_gem.h:615:37: note: expected 'struct drm_device *' but argument is of type 'struct drm_gem_lru *'
     615 | drm_gem_lru_scan(struct drm_device *dev,
         |                  ~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/panthor/panthor_mmu.c:3161:72: error: passing argument 2 of 'drm_gem_lru_scan' makes pointer from integer without a cast [-Wint-conversion]
    3161 |                 freed += drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan - freed,
         |                                                             ~~~~~~~~~~~^~~~~~~
         |                                                                        |
         |                                                                        long unsigned int
   include/drm/drm_gem.h:616:38: note: expected 'struct drm_gem_lru *' but argument is of type 'long unsigned int'
     616 |                  struct drm_gem_lru *lru,
         |                  ~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/panthor/panthor_mmu.c:3162:43: error: passing argument 3 of 'drm_gem_lru_scan' makes integer from pointer without a cast [-Wint-conversion]
    3162 |                                           remaining, shrink, NULL);
         |                                           ^~~~~~~~~
         |                                           |
         |                                           long unsigned int *
   include/drm/drm_gem.h:617:31: note: expected 'unsigned int' but argument is of type 'long unsigned int *'
     617 |                  unsigned int nr_to_scan,
         |                  ~~~~~~~~~~~~~^~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_mmu.c:3162:54: error: passing argument 4 of 'drm_gem_lru_scan' from incompatible pointer type [-Wincompatible-pointer-types]
    3162 |                                           remaining, shrink, NULL);
         |                                                      ^~~~~~
         |                                                      |
         |                                                      bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *) {aka _Bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)}
   include/drm/drm_gem.h:618:33: note: expected 'long unsigned int *' but argument is of type 'bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)' {aka '_Bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)'}
     618 |                  unsigned long *remaining,
         |                  ~~~~~~~~~~~~~~~^~~~~~~~~
>> drivers/gpu/drm/panthor/panthor_mmu.c:3161:26: error: too few arguments to function 'drm_gem_lru_scan'
    3161 |                 freed += drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan - freed,
         |                          ^~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:615:1: note: declared here
     615 | drm_gem_lru_scan(struct drm_device *dev,
         | ^~~~~~~~~~~~~~~~


vim +/drm_gem_lru_scan +1498 drivers/gpu/drm/panthor/panthor_gem.c

e06177ec7a3639 Boris Brezillon 2025-12-08  1487  
fb42964e2a76f6 Akash Goel      2026-04-01  1488  static unsigned long
fb42964e2a76f6 Akash Goel      2026-04-01  1489  panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
fb42964e2a76f6 Akash Goel      2026-04-01  1490  {
fb42964e2a76f6 Akash Goel      2026-04-01  1491  	struct panthor_device *ptdev = shrinker->private_data;
fb42964e2a76f6 Akash Goel      2026-04-01  1492  	unsigned long remaining = 0;
fb42964e2a76f6 Akash Goel      2026-04-01  1493  	unsigned long freed = 0;
fb42964e2a76f6 Akash Goel      2026-04-01  1494  
fb42964e2a76f6 Akash Goel      2026-04-01  1495  	if (!can_swap())
fb42964e2a76f6 Akash Goel      2026-04-01  1496  		goto out;
fb42964e2a76f6 Akash Goel      2026-04-01  1497  
fb42964e2a76f6 Akash Goel      2026-04-01 @1498  	freed += drm_gem_lru_scan(&ptdev->reclaim.unused,
fb42964e2a76f6 Akash Goel      2026-04-01  1499  				  sc->nr_to_scan - freed, &remaining,
fb42964e2a76f6 Akash Goel      2026-04-01  1500  				  panthor_gem_try_evict_no_resv_wait, NULL);
fb42964e2a76f6 Akash Goel      2026-04-01  1501  	if (freed >= sc->nr_to_scan)
fb42964e2a76f6 Akash Goel      2026-04-01  1502  		goto out;
fb42964e2a76f6 Akash Goel      2026-04-01  1503  
fb42964e2a76f6 Akash Goel      2026-04-01  1504  	freed += drm_gem_lru_scan(&ptdev->reclaim.mmapped,
fb42964e2a76f6 Akash Goel      2026-04-01  1505  				  sc->nr_to_scan - freed, &remaining,
fb42964e2a76f6 Akash Goel      2026-04-01  1506  				  panthor_gem_try_evict_no_resv_wait, NULL);
fb42964e2a76f6 Akash Goel      2026-04-01  1507  	if (freed >= sc->nr_to_scan)
fb42964e2a76f6 Akash Goel      2026-04-01  1508  		goto out;
fb42964e2a76f6 Akash Goel      2026-04-01  1509  
fb42964e2a76f6 Akash Goel      2026-04-01  1510  	if (!can_block(sc))
fb42964e2a76f6 Akash Goel      2026-04-01  1511  		goto out;
fb42964e2a76f6 Akash Goel      2026-04-01  1512  
fb42964e2a76f6 Akash Goel      2026-04-01  1513  	freed += panthor_mmu_reclaim_priv_bos(ptdev, sc->nr_to_scan - freed,
fb42964e2a76f6 Akash Goel      2026-04-01  1514  					      &remaining, panthor_gem_try_evict);
fb42964e2a76f6 Akash Goel      2026-04-01  1515  	if (freed >= sc->nr_to_scan)
fb42964e2a76f6 Akash Goel      2026-04-01  1516  		goto out;
fb42964e2a76f6 Akash Goel      2026-04-01  1517  
fb42964e2a76f6 Akash Goel      2026-04-01  1518  	freed += drm_gem_lru_scan(&ptdev->reclaim.gpu_mapped_shared,
fb42964e2a76f6 Akash Goel      2026-04-01  1519  				  sc->nr_to_scan - freed, &remaining,
fb42964e2a76f6 Akash Goel      2026-04-01  1520  				  panthor_gem_try_evict, NULL);
fb42964e2a76f6 Akash Goel      2026-04-01  1521  
fb42964e2a76f6 Akash Goel      2026-04-01  1522  out:
fb42964e2a76f6 Akash Goel      2026-04-01  1523  #ifdef CONFIG_DEBUG_FS
fb42964e2a76f6 Akash Goel      2026-04-01  1524  	/* This is racy, but that's okay, because this is just debugfs
fb42964e2a76f6 Akash Goel      2026-04-01  1525  	 * reporting and doesn't need to be accurate.
fb42964e2a76f6 Akash Goel      2026-04-01  1526  	 */
fb42964e2a76f6 Akash Goel      2026-04-01  1527  	ptdev->reclaim.nr_pages_reclaimed_on_last_scan = freed;
fb42964e2a76f6 Akash Goel      2026-04-01  1528  #endif
fb42964e2a76f6 Akash Goel      2026-04-01  1529  
fb42964e2a76f6 Akash Goel      2026-04-01  1530  	/* If there are things to reclaim, try a couple times before giving up. */
fb42964e2a76f6 Akash Goel      2026-04-01  1531  	if (!freed && remaining > 0 &&
fb42964e2a76f6 Akash Goel      2026-04-01  1532  	    atomic_inc_return(&ptdev->reclaim.retry_count) < 2)
fb42964e2a76f6 Akash Goel      2026-04-01  1533  		return 0;
fb42964e2a76f6 Akash Goel      2026-04-01  1534  
fb42964e2a76f6 Akash Goel      2026-04-01  1535  	atomic_set(&ptdev->reclaim.retry_count, 0);
fb42964e2a76f6 Akash Goel      2026-04-01  1536  
fb42964e2a76f6 Akash Goel      2026-04-01  1537  	if (freed)
fb42964e2a76f6 Akash Goel      2026-04-01  1538  		return freed;
fb42964e2a76f6 Akash Goel      2026-04-01  1539  
fb42964e2a76f6 Akash Goel      2026-04-01  1540  	/* There's nothing left to reclaim, or the resources are contended. Give up now. */
fb42964e2a76f6 Akash Goel      2026-04-01  1541  	return SHRINK_STOP;
fb42964e2a76f6 Akash Goel      2026-04-01  1542  }
fb42964e2a76f6 Akash Goel      2026-04-01  1543  
fb42964e2a76f6 Akash Goel      2026-04-01  1544  int panthor_gem_shrinker_init(struct panthor_device *ptdev)
fb42964e2a76f6 Akash Goel      2026-04-01  1545  {
fb42964e2a76f6 Akash Goel      2026-04-01  1546  	struct shrinker *shrinker;
fb42964e2a76f6 Akash Goel      2026-04-01  1547  	int ret;
fb42964e2a76f6 Akash Goel      2026-04-01  1548  
fb42964e2a76f6 Akash Goel      2026-04-01  1549  	ret = drmm_mutex_init(&ptdev->base, &ptdev->reclaim.lock);
fb42964e2a76f6 Akash Goel      2026-04-01  1550  	if (ret)
fb42964e2a76f6 Akash Goel      2026-04-01  1551  		return ret;
fb42964e2a76f6 Akash Goel      2026-04-01  1552  
fb42964e2a76f6 Akash Goel      2026-04-01  1553  	INIT_LIST_HEAD(&ptdev->reclaim.vms);
fb42964e2a76f6 Akash Goel      2026-04-01 @1554  	drm_gem_lru_init(&ptdev->reclaim.unused, &ptdev->reclaim.lock);
fb42964e2a76f6 Akash Goel      2026-04-01  1555  	drm_gem_lru_init(&ptdev->reclaim.mmapped, &ptdev->reclaim.lock);
fb42964e2a76f6 Akash Goel      2026-04-01  1556  	drm_gem_lru_init(&ptdev->reclaim.gpu_mapped_shared, &ptdev->reclaim.lock);
fb42964e2a76f6 Akash Goel      2026-04-01  1557  	ptdev->reclaim.gpu_mapped_count = 0;
fb42964e2a76f6 Akash Goel      2026-04-01  1558  
fb42964e2a76f6 Akash Goel      2026-04-01  1559  	/* Teach lockdep about lock ordering wrt. shrinker: */
fb42964e2a76f6 Akash Goel      2026-04-01  1560  	fs_reclaim_acquire(GFP_KERNEL);
fb42964e2a76f6 Akash Goel      2026-04-01  1561  	might_lock(&ptdev->reclaim.lock);
fb42964e2a76f6 Akash Goel      2026-04-01  1562  	fs_reclaim_release(GFP_KERNEL);
fb42964e2a76f6 Akash Goel      2026-04-01  1563  
fb42964e2a76f6 Akash Goel      2026-04-01  1564  	shrinker = shrinker_alloc(0, "drm-panthor-gem");
fb42964e2a76f6 Akash Goel      2026-04-01  1565  	if (!shrinker)
fb42964e2a76f6 Akash Goel      2026-04-01  1566  		return -ENOMEM;
fb42964e2a76f6 Akash Goel      2026-04-01  1567  
fb42964e2a76f6 Akash Goel      2026-04-01  1568  	shrinker->count_objects = panthor_gem_shrinker_count;
fb42964e2a76f6 Akash Goel      2026-04-01  1569  	shrinker->scan_objects = panthor_gem_shrinker_scan;
fb42964e2a76f6 Akash Goel      2026-04-01  1570  	shrinker->private_data = ptdev;
fb42964e2a76f6 Akash Goel      2026-04-01  1571  	ptdev->reclaim.shrinker = shrinker;
fb42964e2a76f6 Akash Goel      2026-04-01  1572  
fb42964e2a76f6 Akash Goel      2026-04-01  1573  	shrinker_register(shrinker);
e06177ec7a3639 Boris Brezillon 2025-12-08  1574  	return 0;
e06177ec7a3639 Boris Brezillon 2025-12-08  1575  }
e06177ec7a3639 Boris Brezillon 2025-12-08  1576  

:::::: The code at line 1498 was first introduced by commit
:::::: fb42964e2a76f68a5fb581d382b5d2be2d5bda9b drm/panthor: Add a GEM shrinker

:::::: TO: Akash Goel <akash.goel@arm.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
