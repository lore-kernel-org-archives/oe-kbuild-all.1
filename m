Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47C01F91F6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781446049; cv=none; b=lazNw2nP+8yNPI1hvfZGhtrQkmz7/7d740dkKxLyvcfZFto4LQ3xpIEZD7Aob5H10BXQugBzuMvaKC1WqOPvsImcgrKizwUr7MAfIPOUGVc7PV2FyLCFfjbv3qo4Yd7cAxh1fh0j3c2/AFKdXPDzMflArMlpp3/XjQISDKUuR8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781446049; c=relaxed/simple;
	bh=6z3i6W2OMZX8xM34L4H4pm8fFt8I37oUjOHsmq4RUZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nTnk/IhhPqQe//z9p/x5QwNwEKmLoGaWX6CovRWTjnGf8jKnMd2vCyYfFsN3v449Wvop4xPEmrTOjAsgaJ9Bfyg+AJQrZb8T8FzNuiqyWGrWeniDci1Fk62eFtJv2iGP+369eW63yszuAD+Ci42Dh2rgL/bICym/4BR5PtNJ2D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKBy4rEn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKBy4rEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781446046; x=1812982046;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6z3i6W2OMZX8xM34L4H4pm8fFt8I37oUjOHsmq4RUZM=;
  b=lKBy4rEnatYnwST8tCgHgFL8rOpa17Qod+FzodRlqZ/FAMMiChTBOrb/
   D4m+8okvIfh5AiKG7L2yeEXZbD8e7gfB+JDJS0/4id9jJTLkVN57jOHbp
   lyOsKYGeRh9/VqWKTAccT3oN+FblSC2jFDv9mZCt7XJcFzFAHYWvWqkfl
   vivBxaeJ09ampDVoBSu16QBDTeIf50x1O1kV8Si6XknSg6l5L5WRJA7qU
   w8Q91ouMbSFZx7wi7GmW25+h99Dqr0dF70cNrlew9DivAGpM8sougjhA2
   xvLXRPxllHeH5QUuIQmWOr1i0SS/bFCWabDfcFbocMfeMxY5FAwJZU9Fq
   Q==;
X-CSE-ConnectionGUID: y0HN5gfdSg6Q5R6WvxU0zQ==
X-CSE-MsgGUID: bwSkQR9GRHuz7vf1ul2YAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82241901"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="82241901"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 07:07:25 -0700
X-CSE-ConnectionGUID: Sxf+V4f7TOKVph6xAYHrMw==
X-CSE-MsgGUID: 3SRfTxVMQkKB9tDFdjc8Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="251177101"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Jun 2026 07:07:23 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYlUe-00000000Qs4-0ZnG;
	Sun, 14 Jun 2026 14:07:20 +0000
Date: Sun, 14 Jun 2026 22:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/ttm/ttm_bo_util.c:465:28: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202606142104.yLTxoIoB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e21ee273e6fa3879aec9a27251cfce98156e07c4
commit: df75430515c33ece3de46562f917acd9792505ad drm: fix dead default for =
DRM_TTM_KUNIT_TEST
date:   3 months ago
config: nios2-randconfig-r131-20260614 (https://download.01.org/0day-ci/arc=
hive/20260614/202606142104.yLTxoIoB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260614/202606142104.yLTxoIoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: df75430515c3 ("drm: fix dead default for DRM_TTM_KUNIT_TEST")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606142104.yLTxoIoB-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/ttm/ttm_bo_util.c:329:38: sparse: sparse: incorrect type=
 in assignment (different address spaces) @@     expected void *virtual @@ =
    got void [noderef] __iomem * @@
   drivers/gpu/drm/ttm/ttm_bo_util.c:329:38: sparse:     expected void *vir=
tual
   drivers/gpu/drm/ttm/ttm_bo_util.c:329:38: sparse:     got void [noderef]=
 __iomem *
   drivers/gpu/drm/ttm/ttm_bo_util.c:335:38: sparse: sparse: incorrect type=
 in assignment (different address spaces) @@     expected void *virtual @@ =
    got void [noderef] __iomem * @@
   drivers/gpu/drm/ttm/ttm_bo_util.c:335:38: sparse:     expected void *vir=
tual
   drivers/gpu/drm/ttm/ttm_bo_util.c:335:38: sparse:     got void [noderef]=
 __iomem *
>> drivers/gpu/drm/ttm/ttm_bo_util.c:465:28: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void [noderef] __=
iomem *addr @@     got void *virtual @@
   drivers/gpu/drm/ttm/ttm_bo_util.c:465:28: sparse:     expected void [nod=
eref] __iomem *addr
   drivers/gpu/drm/ttm/ttm_bo_util.c:465:28: sparse:     got void *virtual

vim +465 drivers/gpu/drm/ttm/ttm_bo_util.c

ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  451 =20
a3185f91d0579b6 Christian K=C3=B6nig  2022-05-09  452  /**
a3185f91d0579b6 Christian K=C3=B6nig  2022-05-09  453   * ttm_bo_kunmap
a3185f91d0579b6 Christian K=C3=B6nig  2022-05-09  454   *
a3185f91d0579b6 Christian K=C3=B6nig  2022-05-09  455   * @map: Object desc=
ribing the map to unmap.
a3185f91d0579b6 Christian K=C3=B6nig  2022-05-09  456   *
a3185f91d0579b6 Christian K=C3=B6nig  2022-05-09  457   * Unmaps a kernel m=
ap set up by ttm_bo_kmap.
a3185f91d0579b6 Christian K=C3=B6nig  2022-05-09  458   */
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  459  void ttm_bo_kunmap(struct=
 ttm_bo_kmap_obj *map)
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  460  {
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  461  	if (!map->virtual)
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  462  		return;
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  463  	switch (map->bo_kmap_typ=
e) {
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  464  	case ttm_bo_map_iomap:
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10 @465  		iounmap(map->virtual);
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  466  		break;
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  467  	case ttm_bo_map_vmap:
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  468  		vunmap(map->virtual);
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  469  		break;
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  470  	case ttm_bo_map_kmap:
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  471  		kunmap(map->page);
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  472  		break;
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  473  	case ttm_bo_map_premappe=
d:
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  474  		break;
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  475  	default:
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  476  		BUG();
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  477  	}
d3116756a710e3c Christian K=C3=B6nig  2021-04-12  478  	ttm_mem_io_free(map=
->bo->bdev, map->bo->resource);
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  479  	map->virtual =3D NULL;
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  480  	map->page =3D NULL;
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  481  }
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  482  EXPORT_SYMBOL(ttm_bo_kunm=
ap);
ba4e7d973dd09b6 Thomas Hellstrom 2009-06-10  483 =20

:::::: The code at line 465 was first introduced by commit
:::::: ba4e7d973dd09b66912ac4c0856add8b0703a997 drm: Add the TTM GPU memory=
 manager subsystem.

:::::: TO: Thomas Hellstrom <thellstrom@vmware.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
