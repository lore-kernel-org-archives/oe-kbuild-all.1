Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978953D9FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Sep 2026 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080461; cv=none; b=Y5KTouxgSDH6yOmS+tGjnX7X1RAM+ax/fjorvfi5fXiO0w/J7iVX7Lh0zTaci5rRZ67sSwFPHbUzc2zltwqHK1MM2aEzjlZFqkUTflOsuXrPMePLsq5S06n2fLPzpPXkOSFDmy/mkB2+FDOtDSw9P/lILa4v6SliD5J+BxVG+y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080461; c=relaxed/simple;
	bh=TNMzHrsVWS+pZWsOr+l0+PcwxqtYPgeJnbcgf228mnk=;
	h=Date:From:Cc:Subject:Message-ID; b=gcQuASP7gs0L4h4eDiah+/EHZcS4X45wp0s6hnKfF7Drx77hW3DMoX+dMYD7gvR1AR8y+274kJ5ebGME1brNlnaHQtSIbw6u00jhgXvqwk3wBVa0tHsHHydbWq+OPtNIfY7R+q7r4Olsbnry9KCedD+fqXMHLq5O67UscD77A4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPOnQ8AL; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPOnQ8AL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790080458; x=1821616458;
  h=date:from:cc:subject:message-id;
  bh=TNMzHrsVWS+pZWsOr+l0+PcwxqtYPgeJnbcgf228mnk=;
  b=GPOnQ8ALZc76UVKS0sjBS5zghFjc+a1YfyAtSbSb9QKlPxhbNDnAl9Ej
   Bu5nZ3T916ug5t00MbgodgTUdrD0hvGMTyG5AoBsPgMUGEheE3fEKSnJh
   radNqq7W7lwI03ducmBZD5M3Icw+cu/IUY/ZRPYFV0xAbc3qT0KDztsSj
   0PRxC7VjKZ0eeGWrzisaqxn05SRiZ0AHvjQoybjPQxqj3uI6SFczQcHNH
   apR48FsKVvhgUrztlMnyTXxhCRlfBarVshR3jnKuJ3h1unslMKxWQN1nd
   7asYCN+IB4HHRtkXvM3cbpqOGodVY4EEdSRHuWhlGvesfD19rv+Wqg0w+
   g==;
X-CSE-ConnectionGUID: mDr2Yjw1RoaKDKpkNQ54vw==
X-CSE-MsgGUID: gPSBx2f8SuOx18E4dSyVvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1185802"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1185802"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:34:17 -0700
X-CSE-ConnectionGUID: 5VxiSMu7QMSFimNyv0XiNg==
X-CSE-MsgGUID: OdEu8MQ5SIqnuDGd2OhgZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277899554"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2026 05:34:15 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8zhN-00000000FUU-03lO;
	Tue, 22 Sep 2026 12:34:13 +0000
Date: Tue, 22 Sep 2026 20:33:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 1160/3178]
 drivers/gpu/drm/panthor/panthor_gem.c:1554:9: error: too many arguments to
 function 'drm_gem_lru_init'; expected 1, have 2
Message-ID: <202609222039.4UmWq3Ec-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alex,

FYI, the error/warning still remains.

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   e0e9c2257911b291ef5345635a9e6dfef5b2b424
commit: 03ad9467e6567c258264a72fd5ef4694e7995149 [1160/3178] Merge tag 'v7.1-rc6' into amd-staging-drm-next
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260922/202609222039.4UmWq3Ec-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609222039.4UmWq3Ec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609222039.4UmWq3Ec-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_gem.c:1500:35: error: passing argument 4 of 'drm_gem_lru_scan' from incompatible pointer type [-Wincompatible-pointer-types]
    1500 |                                   panthor_gem_try_evict_no_resv_wait, NULL);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *) {aka _Bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)}
   include/drm/drm_gem.h:618:33: note: expected 'long unsigned int *' but argument is of type 'bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)' {aka '_Bool (*)(struct drm_gem_object *, struct ww_acquire_ctx *)'}
     618 |                  unsigned long *remaining,
         |                  ~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1389:13: note: 'panthor_gem_try_evict_no_resv_wait' declared here
    1389 | static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *obj,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1498:18: error: too few arguments to function 'drm_gem_lru_scan'; expected 6, have 5
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
   drivers/gpu/drm/panthor/panthor_gem.c:1389:13: note: 'panthor_gem_try_evict_no_resv_wait' declared here
    1389 | static bool panthor_gem_try_evict_no_resv_wait(struct drm_gem_object *obj,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1504:18: error: too few arguments to function 'drm_gem_lru_scan'; expected 6, have 5
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
   drivers/gpu/drm/panthor/panthor_gem.c:1476:13: note: 'panthor_gem_try_evict' declared here
    1476 | static bool panthor_gem_try_evict(struct drm_gem_object *obj,
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1518:18: error: too few arguments to function 'drm_gem_lru_scan'; expected 6, have 5
    1518 |         freed += drm_gem_lru_scan(&ptdev->reclaim.gpu_mapped_shared,
         |                  ^~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:615:1: note: declared here
     615 | drm_gem_lru_scan(struct drm_device *dev,
         | ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c: In function 'panthor_gem_shrinker_init':
>> drivers/gpu/drm/panthor/panthor_gem.c:1554:9: error: too many arguments to function 'drm_gem_lru_init'; expected 1, have 2
    1554 |         drm_gem_lru_init(&ptdev->reclaim.unused, &ptdev->reclaim.lock);
         |         ^~~~~~~~~~~~~~~~                         ~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:610:6: note: declared here
     610 | void drm_gem_lru_init(struct drm_gem_lru *lru);
         |      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1555:9: error: too many arguments to function 'drm_gem_lru_init'; expected 1, have 2
    1555 |         drm_gem_lru_init(&ptdev->reclaim.mmapped, &ptdev->reclaim.lock);
         |         ^~~~~~~~~~~~~~~~                          ~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:610:6: note: declared here
     610 | void drm_gem_lru_init(struct drm_gem_lru *lru);
         |      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gem.c:1556:9: error: too many arguments to function 'drm_gem_lru_init'; expected 1, have 2
    1556 |         drm_gem_lru_init(&ptdev->reclaim.gpu_mapped_shared, &ptdev->reclaim.lock);
         |         ^~~~~~~~~~~~~~~~                                    ~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_gem.h:610:6: note: declared here
     610 | void drm_gem_lru_init(struct drm_gem_lru *lru);
         |      ^~~~~~~~~~~~~~~~


vim +/drm_gem_lru_init +1554 drivers/gpu/drm/panthor/panthor_gem.c

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

:::::: The code at line 1554 was first introduced by commit
:::::: fb42964e2a76f68a5fb581d382b5d2be2d5bda9b drm/panthor: Add a GEM shrinker

:::::: TO: Akash Goel <akash.goel@arm.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
