Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208E533C53D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 14:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775573858; cv=none; b=bLDy9TULip5vBLhdYdCu9wMtlRUTq5LLrzh0bNcZFM6jvM0ngH9pWK/o1V0FYEsNFiE4MFaJ3bEj3A7qaC6LL2YtMe7TE7g/IAptXVFM9K092XpkESigm8KTXFgCvValqDaCcADJIa1Sr3zZe4A+4bm+EmaYAgCD4vIFMb48ELs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775573858; c=relaxed/simple;
	bh=T/5B5sF9EwfcxwgoI0s4XUQSAE1pHdiyRBY8H6VQjKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=b9yDYWmTr8VVSyLIpIZtUK2FVltmVBrGMFw05hKPhbPtDOfspjCnayk/bBaSDIFU1kvjIeniNAo4mvYuBMh6dzbi+QAtXr95QyZF5xkKsVSILmg+IULgskFhBmLPZKc3rOSRrDaCWnNqcaI/nSf7bnaujCSEyaeiI//My1WTe3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlIfPhJj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlIfPhJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775573856; x=1807109856;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T/5B5sF9EwfcxwgoI0s4XUQSAE1pHdiyRBY8H6VQjKM=;
  b=ZlIfPhJjCLnkKWAF772BLMcZyUcx+KxuNwrMbdYpanSrZnGWhkeGLbxV
   U8hucPn/5HqIHPvwlDBkgOFy/+c7OI3pl8jF04+VMrlIMCN3NNehd/jKJ
   zXF7XL6DsuNq1kVa1ef99t4lBsf2xp+1pY5/Jq4jnixTv8fYQEXPWTfkh
   j+Dkwfrk/4CHf4jbDiJUhLOeFiTRxG06OCpGdBnmLu6rsNsE1Yks8uQI4
   XhPPjT0RKpxv8yFTMVQknvHBa8lrg8JQH3GqYWuFUiKB1XgsTQy59FQIq
   ho3TixEJeAbKlRaVm07TOCQ/mIGuMWMoZbmcMW1e3zxNPzqig4oFjcDre
   A==;
X-CSE-ConnectionGUID: qONdfxV6S22P56PsUln0eg==
X-CSE-MsgGUID: 1OsQTz8WRZucssL6lJltBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="99165678"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="99165678"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 07:57:35 -0700
X-CSE-ConnectionGUID: coEEOWAKRNOxIDMM+EgkvQ==
X-CSE-MsgGUID: nFfg4gePTqSgyZvU7tgvMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="233157239"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Apr 2026 07:57:34 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA7rv-000000000iB-0fYQ;
	Tue, 07 Apr 2026 14:57:31 +0000
Date: Tue, 07 Apr 2026 22:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: xinhui pan <xinhui.pan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/ttm/ttm_range_manager.c:144: warning:
 expecting prototype for ttm_range_man_init(). Prototype was for
 ttm_range_man_init_nocheck() instead
Message-ID: <202604072236.QoHpJGwO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi xinhui,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bfe62a454542cfad3379f6ef5680b125f41e20f4
commit: 617d5b34f22c66fe9fc9f150be27f5de1b87ca15 drm/ttm: Try to check if n=
ew ttm man out of bounds during compile
date:   4 years, 7 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260407=
/202604072236.QoHpJGwO-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260407/202604072236.QoHpJGwO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 617d5b34f22c ("drm/ttm: Try to check if new ttm man out of bounds =
during compile")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604072236.QoHpJGwO-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_range_manager.c:144: warning: expecting prototyp=
e for ttm_range_man_init(). Prototype was for ttm_range_man_init_nocheck() =
instead
>> drivers/gpu/drm/ttm/ttm_range_manager.c:178: warning: expecting prototyp=
e for ttm_range_man_fini(). Prototype was for ttm_range_man_fini_nocheck() =
instead


vim +144 drivers/gpu/drm/ttm/ttm_range_manager.c

98399abd52b234 drivers/gpu/drm/ttm/ttm_bo_manager.c    Dave Airlie      202=
0-08-04  129 =20
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  130  /**
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  131   * ttm_range_man_init
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  132   *
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  133   * @bdev: ttm device
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  134   * @type: memory manager type
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  135   * @use_tt: if the memory manager uses tt
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  136   * @p_size: size of area to be managed in pages.
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  137   *
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  138   * Initialise a generic range manager for the selected m=
emory type.
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  139   * The range manager is installed for this device in the=
 type slot.
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  140   */
617d5b34f22c66 drivers/gpu/drm/ttm/ttm_range_manager.c xinhui pan       202=
1-09-13  141  int ttm_range_man_init_nocheck(struct ttm_device *bdev,
9c3006a4cc1b16 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2020-09-11  142  		       unsigned type, bool use_tt,
d961db75ce86a8 drivers/gpu/drm/ttm/ttm_bo_manager.c    Ben Skeggs       201=
0-08-05  143  		       unsigned long p_size)
d961db75ce86a8 drivers/gpu/drm/ttm/ttm_bo_manager.c    Ben Skeggs       201=
0-08-05 @144  {
9de59bc201496f drivers/gpu/drm/ttm/ttm_range_manager.c Dave Airlie      202=
0-08-04  145  	struct ttm_resource_manager *man;
d7a67cb16238ab drivers/gpu/drm/ttm/ttm_bo_manager.c    Thomas Hellstrom 201=
0-10-29  146  	struct ttm_range_manager *rman;
d961db75ce86a8 drivers/gpu/drm/ttm/ttm_bo_manager.c    Ben Skeggs       201=
0-08-05  147 =20
d7a67cb16238ab drivers/gpu/drm/ttm/ttm_bo_manager.c    Thomas Hellstrom 201=
0-10-29  148  	rman =3D kzalloc(sizeof(*rman), GFP_KERNEL);
d7a67cb16238ab drivers/gpu/drm/ttm/ttm_bo_manager.c    Thomas Hellstrom 201=
0-10-29  149  	if (!rman)
d961db75ce86a8 drivers/gpu/drm/ttm/ttm_bo_manager.c    Ben Skeggs       201=
0-08-05  150  		return -ENOMEM;
d961db75ce86a8 drivers/gpu/drm/ttm/ttm_bo_manager.c    Ben Skeggs       201=
0-08-05  151 =20
3a1fc38edac75d drivers/gpu/drm/ttm/ttm_bo_manager.c    Dave Airlie      202=
0-08-04  152  	man =3D &rman->manager;
3a1fc38edac75d drivers/gpu/drm/ttm/ttm_bo_manager.c    Dave Airlie      202=
0-08-04  153  	man->use_tt =3D use_tt;
3a1fc38edac75d drivers/gpu/drm/ttm/ttm_bo_manager.c    Dave Airlie      202=
0-08-04  154 =20
80938c28ee67ba drivers/gpu/drm/ttm/ttm_range_manager.c Dave Airlie      202=
0-08-04  155  	man->func =3D &ttm_range_manager_func;
37205891d84f92 drivers/gpu/drm/ttm/ttm_bo_manager.c    Dave Airlie      202=
0-08-04  156 =20
9de59bc201496f drivers/gpu/drm/ttm/ttm_range_manager.c Dave Airlie      202=
0-08-04  157  	ttm_resource_manager_init(man, p_size);
37205891d84f92 drivers/gpu/drm/ttm/ttm_bo_manager.c    Dave Airlie      202=
0-08-04  158 =20
77ef8bbc87be7a drivers/gpu/drm/ttm/ttm_bo_manager.c    David Herrmann   201=
3-07-01  159  	drm_mm_init(&rman->mm, 0, p_size);
d7a67cb16238ab drivers/gpu/drm/ttm/ttm_bo_manager.c    Thomas Hellstrom 201=
0-10-29  160  	spin_lock_init(&rman->lock);
d961db75ce86a8 drivers/gpu/drm/ttm/ttm_bo_manager.c    Ben Skeggs       201=
0-08-05  161 =20
3a1fc38edac75d drivers/gpu/drm/ttm/ttm_bo_manager.c    Dave Airlie      202=
0-08-04  162  	ttm_set_driver_manager(bdev, type, &rman->manager);
9de59bc201496f drivers/gpu/drm/ttm/ttm_range_manager.c Dave Airlie      202=
0-08-04  163  	ttm_resource_manager_set_used(man, true);
3c90424bd7df15 drivers/gpu/drm/ttm/ttm_bo_manager.c    Dave Airlie      202=
0-08-04  164  	return 0;
3c90424bd7df15 drivers/gpu/drm/ttm/ttm_bo_manager.c    Dave Airlie      202=
0-08-04  165  }
617d5b34f22c66 drivers/gpu/drm/ttm/ttm_range_manager.c xinhui pan       202=
1-09-13  166  EXPORT_SYMBOL(ttm_range_man_init_nocheck);
3c90424bd7df15 drivers/gpu/drm/ttm/ttm_bo_manager.c    Dave Airlie      202=
0-08-04  167 =20
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  168  /**
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  169   * ttm_range_man_fini
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  170   *
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  171   * @bdev: ttm device
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  172   * @type: memory manager type
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  173   *
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  174   * Remove the generic range manager from a slot and tear=
 it down.
3eb7d96e941503 drivers/gpu/drm/ttm/ttm_range_manager.c Christian K=C3=B6nig=
  2021-04-17  175   */
617d5b34f22c66 drivers/gpu/drm/ttm/ttm_range_manager.c xinhui pan       202=
1-09-13  176  int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
37205891d84f92 drivers/gpu/drm/ttm/ttm_bo_manager.c    Dave Airlie      202=
0-08-04  177  		       unsigned type)
56ee8b1c71ffb5 drivers/gpu/drm/ttm/ttm_bo_manager.c    Dave Airlie      202=
0-08-04 @178  {

:::::: The code at line 144 was first introduced by commit
:::::: d961db75ce86a84f1f04e91ad1014653ed7d9f46 drm/ttm: restructure to all=
ow driver to plug in alternate memory manager

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
