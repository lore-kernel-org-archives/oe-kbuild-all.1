Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D4437AA9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784360234; cv=none; b=Dle+Sf7LP8w8cWtkZDlvf1WoakLrpz2CiWVPwOYt+NtTKuELDYzr/p1u+gVijlHgYZNn7KVI6+HL4HSIbjyOQljrbROVYR9Vkgv2s/QAjYMMSVKe6NS4PlhTFv6iybKp/58/Wf86goge/hybf2P8PA54Zn8VAm5C5l6RaWYtgps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784360234; c=relaxed/simple;
	bh=VaBGo9oCB91X+XF2UsYmEFMf2Ak9tpWtkOt7VIDOLXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p2TSoivykBJsFM1eK9v4LSGE2kYp730ihExhSLpWzSCGD6cARrGqaNCvWbaFbECuqHBjeq2FpJQOQbwlUbF1GeDBGocL6usjATlUpEsR0ZC5Q+bUrbEut3FgmwJI/hjFbfOh13lJRmFuhERtyYcyD/XKXs2d0hLhdOuaDLX9yTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDeMx5hN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDeMx5hN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784360233; x=1815896233;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VaBGo9oCB91X+XF2UsYmEFMf2Ak9tpWtkOt7VIDOLXg=;
  b=JDeMx5hNMm1fTZUxrpuEkORXJoZgopE19gGwEnbe0o+YkmajYqG+AWxV
   pxGVpY9BCosf8VL6Wxg7FBeDjTZ0JfMq+9ejjrr4LLDXhxaM4GMoqcR+L
   46wmVIN/Z2JnI4lqAo2hS1HHpr28MhyLqbFelUzMgOtRrlEfqUVIWDK7s
   V7Z/GZPag85X5NN3OXK+9CUFYKAvC0EzyZc5knfRL6TshQDLh/vWKSq8e
   zIvxNt4vqCLeNSH8D6MyP18KqKNYIIGcYPvTQaDYZHJYqA2zGph2Db3r+
   EHdcMiZQJySiJqVMaJse11zHm4l18e+/GpM3nDElDbsoWG3mwhQG2LIAA
   A==;
X-CSE-ConnectionGUID: XdxI6Q6cTqevojqUlGip7Q==
X-CSE-MsgGUID: E6Ji0DgmRrqGnuNOg5fbnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="95616153"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="95616153"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 00:37:12 -0700
X-CSE-ConnectionGUID: S0WKJK5AT4es9FUtypItQg==
X-CSE-MsgGUID: 0IJRp027RRqhPLjnkl2MuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="252569547"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jul 2026 00:37:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkzbf-00000000TYZ-2I9v;
	Sat, 18 Jul 2026 07:37:07 +0000
Date: Sat, 18 Jul 2026 15:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/ttm/ttm_bo_util.c:465:28: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202607181523.7dnGxeIP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Julian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: df75430515c33ece3de46562f917acd9792505ad drm: fix dead default for =
DRM_TTM_KUNIT_TEST
date:   4 months ago
config: mips-randconfig-r122-20260718 (https://download.01.org/0day-ci/arch=
ive/20260718/202607181523.7dnGxeIP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260718/202607181523.7dnGxeIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: df75430515c3 ("drm: fix dead default for DRM_TTM_KUNIT_TEST")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181523.7dnGxeIP-lkp@i=
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
 in argument 1 (different address spaces) @@     expected void const volati=
le [noderef] __iomem *addr @@     got void *virtual @@
   drivers/gpu/drm/ttm/ttm_bo_util.c:465:28: sparse:     expected void cons=
t volatile [noderef] __iomem *addr
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
