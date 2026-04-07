Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231D7372B59
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533764; cv=none; b=Q/elVmAToqF0e+Oc1KN1V6fm233wcyYkW3cdxTSwFIivlMwGwHlSIGyrwhdHr5rSAiK6xVxbsNW3RgFVpalxhneEptrOADyWTIhs1BZbJccENoFPUzyuC4Qb3XECMDvDS/B5pbmIgGiL2EY6xBwG55tf1KcBQfviSiAoR+o4IYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533764; c=relaxed/simple;
	bh=aecFTchd3ddWUqfzeEhyR7XABI3jvnpWIxigX/TOUiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eJy0NRpTMk/8SJ/d9W97DxBEfXCPF83bS+uZQtaB9fgKyi8hXR78oG9/gcEsJjiLPRraXfXYE0/OarRpclhBQV075vO3d1UFwDkdlR7y6zoCyfTcHhCE+SDa8ECpNIBKyNrtXUDbJxxQ30nR8LAAGkKBnir+tv/Mm25j80tCL8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPP+VCmi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPP+VCmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533763; x=1807069763;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aecFTchd3ddWUqfzeEhyR7XABI3jvnpWIxigX/TOUiw=;
  b=cPP+VCmiAKSaWja5QJTF7VUZ/l9CkeK07yQZaXuReUg1l2Rv5alCBKA2
   oTfdEIRFWi8uQPBhbohV/fbpBM+HvkwRvXzN+aebnSSEmilVfzWj0fQx0
   EChszGg5khohxGvK1xgFef7qwRZyy9FKCEiW9FiX0m5pc9rU8zfskkbPO
   PPBE6NkJRikxCklP30OiCMd3jT7GrkQ2eTmWqOCab2QGHAn6iHP5a5jlW
   wxkKXxtFPsdalPjMinR41urvDZLWMciuc2ASYZ6i2dQStoeyVIgvCBXs2
   5zQwfv+CfirSEorTJBmQ6U7HE8Zsp2heuUvHTY22ONyl4LAe5ebH1Dpvg
   w==;
X-CSE-ConnectionGUID: bv7hxRoJQW+XbbllqGQffQ==
X-CSE-MsgGUID: YfoBLRlwRce5cQGUlZfXFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76385861"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76385861"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:49:21 -0700
X-CSE-ConnectionGUID: KQ0usTrURIWnXLpFe9Drwg==
X-CSE-MsgGUID: Mmby/2tgQu6mAmc/bx6WMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251191878"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:49:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xRG-0000000001L-0pok;
	Tue, 07 Apr 2026 03:49:18 +0000
Date: Tue, 07 Apr 2026 11:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: [linux-next:master 7115/11535]
 drivers/gpu/drm/ttm/ttm_bo_util.c:465:28: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202604032023.V72xPlQf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   cc13002a9f984d37906e9476f3e532a8cdd126f5
commit: df75430515c33ece3de46562f917acd9792505ad [7115/11535] drm: fix dead=
 default for DRM_TTM_KUNIT_TEST
config: m68k-randconfig-r112-20260403 (https://download.01.org/0day-ci/arch=
ive/20260403/202604032023.V72xPlQf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260403/202604032023.V72xPlQf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604032023.V72xPlQf-lkp@i=
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

ba4e7d973dd09b Thomas Hellstrom 2009-06-10  451 =20
a3185f91d0579b Christian K=C3=B6nig  2022-05-09  452  /**
a3185f91d0579b Christian K=C3=B6nig  2022-05-09  453   * ttm_bo_kunmap
a3185f91d0579b Christian K=C3=B6nig  2022-05-09  454   *
a3185f91d0579b Christian K=C3=B6nig  2022-05-09  455   * @map: Object descr=
ibing the map to unmap.
a3185f91d0579b Christian K=C3=B6nig  2022-05-09  456   *
a3185f91d0579b Christian K=C3=B6nig  2022-05-09  457   * Unmaps a kernel ma=
p set up by ttm_bo_kmap.
a3185f91d0579b Christian K=C3=B6nig  2022-05-09  458   */
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  459  void ttm_bo_kunmap(struct =
ttm_bo_kmap_obj *map)
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  460  {
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  461  	if (!map->virtual)
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  462  		return;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  463  	switch (map->bo_kmap_type=
) {
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  464  	case ttm_bo_map_iomap:
ba4e7d973dd09b Thomas Hellstrom 2009-06-10 @465  		iounmap(map->virtual);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  466  		break;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  467  	case ttm_bo_map_vmap:
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  468  		vunmap(map->virtual);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  469  		break;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  470  	case ttm_bo_map_kmap:
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  471  		kunmap(map->page);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  472  		break;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  473  	case ttm_bo_map_premapped:
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  474  		break;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  475  	default:
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  476  		BUG();
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  477  	}
d3116756a710e3 Christian K=C3=B6nig  2021-04-12  478  	ttm_mem_io_free(map-=
>bo->bdev, map->bo->resource);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  479  	map->virtual =3D NULL;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  480  	map->page =3D NULL;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  481  }
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  482  EXPORT_SYMBOL(ttm_bo_kunma=
p);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  483 =20

:::::: The code at line 465 was first introduced by commit
:::::: ba4e7d973dd09b66912ac4c0856add8b0703a997 drm: Add the TTM GPU memory=
 manager subsystem.

:::::: TO: Thomas Hellstrom <thellstrom@vmware.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
