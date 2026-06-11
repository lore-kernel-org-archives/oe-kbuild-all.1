Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565543F929B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190773; cv=none; b=txCHM/nT6hg3r9x2zm0vV2z47o2LhOw/OoSdoqtBzBHt2LAHyBoscLg51QuK6S9KdlGqXm0g10dM7b5qPRs6vcbtdOBbCGeUsf411EkdvApZcWBBGIhmdnsOwe+W0rpFQKGpOHUIT0ANnh8SqfQdCKq54kMXUunUa+p04PxFEYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190773; c=relaxed/simple;
	bh=dEWPmep1hs+9bwxMDz6cLW7MzpYzoJCqSGOHccCVn4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KEj9sY/4TeZ9eOMHbZWPd9bmESJHOomgBd91+r+qX7GFLo1MagOumNOGUOmNLSsYf25wGFfdeR5qPRJgxtQ1hsLggIrgRC11UG4/X6y2Ke6MieLVMMqTxyW56xNMzvtRluLXd+foTRByy9xPJ2YAQTVZmf1mO8NpHxG05jH4qcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ba5eKQTP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ba5eKQTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781190772; x=1812726772;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dEWPmep1hs+9bwxMDz6cLW7MzpYzoJCqSGOHccCVn4g=;
  b=ba5eKQTPisPDYZFsz9smbH0F3q+9EUF2bdS7kEn0xQmU02s67pK4lT+P
   5c1BY65WGxhTKQILRsHDrKCb5c+WrWz5FpTpL8V5nUkGFNAWo1j6z8X32
   BxVPmZ1MYeJ/S1QZZddS8pKNHXd1T+T4q96IMNsmjt+sDUraMDw3mGnNc
   ARAziRx5Ymz4T7pT3IDrZKLjIDRUdueNCqQM4Ezo8ZSwAcEMs86JRoasE
   FuArqCZXAldUiPuc1B6WDUI8r0whgIoLme8MOmDe8E8Csi1qBvDslQbru
   AHFPl/xVbZR7cUkvULEt+aBpKFXXI2SYl4dmvUk/RoZl+6Fjn+EYQnsZo
   A==;
X-CSE-ConnectionGUID: szy0Y+4/TKm2DpPpEEaqUw==
X-CSE-MsgGUID: q3tf82WzQCm7X46T7DQMUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81141435"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="81141435"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:12:52 -0700
X-CSE-ConnectionGUID: qo6Mn62TRHW9oZVHY/ga5w==
X-CSE-MsgGUID: Yy9XihLZQcGx3VvyfOZl3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="248385302"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2026 08:12:50 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXh5L-00000000NIZ-2RGm;
	Thu, 11 Jun 2026 15:12:47 +0000
Date: Thu, 11 Jun 2026 23:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:139:9:
 sparse: sparse: cast removes address space '__rcu' of expression
Message-ID: <202606112339.NhNq32KS-lkp@intel.com>
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
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: df75430515c33ece3de46562f917acd9792505ad drm: fix dead default for =
DRM_TTM_KUNIT_TEST
date:   3 months ago
config: parisc-randconfig-r113-20260611 (https://download.01.org/0day-ci/ar=
chive/20260611/202606112339.NhNq32KS-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260611/202606112339.NhNq32KS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: df75430515c3 ("drm: fix dead default for DRM_TTM_KUNIT_TEST")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112339.NhNq32KS-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:139:9: sparse: sparse: =
cast removes address space '__rcu' of expression
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:139:9: sparse: sparse: =
cast removes address space '__rcu' of expression

vim +/__rcu +139 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c

8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  100 =20
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  101  KUNIT_ARRAY_PARAM(ttm_bo_=
types, ttm_bo_type_cases,
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  102  		  ttm_bo_validate_case_=
desc);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  103 =20
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  104  static void ttm_bo_init_r=
eserved_sys_man(struct kunit *test)
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  105  {
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  106  	const struct ttm_bo_vali=
date_test_case *params =3D test->param_value;
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  107  	struct ttm_test_devices =
*priv =3D test->priv;
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  108  	enum ttm_bo_type bo_type=
 =3D params->bo_type;
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  109  	u32 size =3D ALIGN(BO_SI=
ZE, PAGE_SIZE);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  110  	struct ttm_operation_ctx=
 ctx =3D { };
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  111  	struct ttm_placement *pl=
acement;
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  112  	struct ttm_buffer_object=
 *bo;
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  113  	struct ttm_place *place;
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  114  	int err;
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  115 =20
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  116  	bo =3D kunit_kzalloc(tes=
t, sizeof(*bo), GFP_KERNEL);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  117  	KUNIT_ASSERT_NOT_NULL(te=
st, bo);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  118 =20
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  119  	place =3D ttm_place_kuni=
t_init(test, TTM_PL_SYSTEM, 0);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  120  	placement =3D ttm_placem=
ent_kunit_init(test, place, 1);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  121 =20
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  122  	drm_gem_private_object_i=
nit(priv->drm, &bo->base, size);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  123 =20
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  124  	err =3D ttm_bo_init_rese=
rved(priv->ttm_dev, bo, bo_type, placement,
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  125  				   PAGE_SIZE, &ctx, N=
ULL, NULL,
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  126  				   &dummy_ttm_bo_dest=
roy);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  127  	dma_resv_unlock(bo->base=
.resv);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  128 =20
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  129  	KUNIT_EXPECT_EQ(test, er=
r, 0);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  130  	KUNIT_EXPECT_EQ(test, kr=
ef_read(&bo->kref), 1);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  131  	KUNIT_EXPECT_PTR_EQ(test=
, bo->bdev, priv->ttm_dev);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  132  	KUNIT_EXPECT_EQ(test, bo=
->type, bo_type);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  133  	KUNIT_EXPECT_EQ(test, bo=
->page_alignment, PAGE_SIZE);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  134  	KUNIT_EXPECT_PTR_EQ(test=
, bo->destroy, &dummy_ttm_bo_destroy);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  135  	KUNIT_EXPECT_EQ(test, bo=
->pin_count, 0);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  136  	KUNIT_EXPECT_NULL(test, =
bo->bulk_move);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  137  	KUNIT_EXPECT_NOT_NULL(te=
st, bo->ttm);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  138  	KUNIT_EXPECT_FALSE(test,=
 ttm_tt_is_populated(bo->ttm));
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12 @139  	KUNIT_EXPECT_NOT_NULL(te=
st, (void *)bo->base.resv->fences);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  140  	KUNIT_EXPECT_EQ(test, ct=
x.bytes_moved, size);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  141 =20
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  142  	if (bo_type !=3D ttm_bo_=
type_kernel)
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  143  		KUNIT_EXPECT_TRUE(test,
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  144  				  drm_mm_node_allocat=
ed(&bo->base.vma_node.vm_node));
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  145 =20
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  146  	ttm_resource_free(bo, &b=
o->resource);
ed7a4397f55bfa Christian K=C3=B6nig   2025-06-13  147  	ttm_bo_fini(bo);
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  148  }
8bd1ff5ddc7bcc Karolina Stolarek 2024-06-12  149 =20

:::::: The code at line 139 was first introduced by commit
:::::: 8bd1ff5ddc7bccabf5be7cf540b9af8d5f968866 drm/ttm/tests: Test simple =
BO creation and validation

:::::: TO: Karolina Stolarek <karolina.stolarek@intel.com>
:::::: CC: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
