Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D21A4B26F0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447891; cv=none; b=VNZf5rlnLiP3WoIrig6NoRSndWOoW3FvR33KRAGmJH/HaOOrlng/iTHc9vsgSy4DK2TqfHlnFYcHVhd0UM6C8VRIoQzGKFaG0yJqQQoBR/n21GbymCuqK5vfem0oVFKtj8OX1zN8A9ldfs2+8/wpXziZugBEbkKvwKPH6StbJ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447891; c=relaxed/simple;
	bh=LSxNkI6toiMIYM0hdbxthkWZiKjZ8Vr0Fqed+6VjuYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uWYwHBzrDEQMZg5Vo/5HGeluS9phD7NAFr4f2niwKKWpKqIZtee3Ag1NKkARDItRIT8pa+QqFyU35OHVIwFVjIcsk7Uf9UdlXIOrvz0UJowR01VVQuXTm8qxiE8bZsj4MLYDYjkZx+EgdUK3HsiS7HpqM7ISs1slZrZVAl6PdXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRs/wbxq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRs/wbxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788447889; x=1819983889;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LSxNkI6toiMIYM0hdbxthkWZiKjZ8Vr0Fqed+6VjuYQ=;
  b=IRs/wbxqDR7Lo1aIWz0TQZQLWI0JaDzTA4ltK5LHuVdscaeIZEiR9bBr
   Xp0E/pZn13sznmNz9M1NyUNugz92YZol3bRsGga4VmOV+us6F2pImm+y6
   hy4r52n+Xj7ugZ6o8DGYEHSDOoQI5vmTdI9L1uzHXHgTGHNIloTaX27bz
   5A9+LPIwvJUyDrUWidnCW6hlVm5HzMeGSDLfgw3P0aU1QswNJtHAfVWBa
   uywTqx9Dm+yIp787cK13wYljn/cj3PZVohUfFFeZzd5l3WtLHOyQVsGXQ
   FeRdIXxmFIP/cLwTknjgq9S6jQWIPtd+d8kZ4ni/CtVVIaVg3rqgIaSNn
   A==;
X-CSE-ConnectionGUID: VPiKBeaXRACz4sPCty3cEg==
X-CSE-MsgGUID: 8Qlb6gtkTr2IPtWPIbS6Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88074629"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88074629"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:04:49 -0700
X-CSE-ConnectionGUID: GbKMIrjUSwSQ3mHnzZygng==
X-CSE-MsgGUID: nlMkkMsERneljCG/QP+mHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="271721853"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Sep 2026 08:04:47 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x28zc-000000004wg-3SyV;
	Thu, 03 Sep 2026 15:04:44 +0000
Date: Thu, 03 Sep 2026 23:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/vramstuff 21/29]
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c:335:9: error: too few arguments to
 function 'ttm_lru_bulk_move_init'; expected 2, have 1
Message-ID: <202609032256.R8nf3R3t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 7.2/vramstuff
head:   13a8e2000329a36f994acf2fd31d307d27fa9189
commit: 2fbdb6893cc6ed358f0232bff4eef598a6c5b419 [21/29] drm/ttm: Add order=
ed bulk moves
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260903=
/202609032256.R8nf3R3t-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260903/202609032256.R8nf3R3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609032256.R8nf3R3t-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_unreserve_b=
ulk':
>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:335:9: error: too few arguments =
to function 'ttm_lru_bulk_move_init'; expected 2, have 1
     335 |         ttm_lru_bulk_move_init(&lru_bulk_move);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/tests/ttm_bo_test.c:13:
   include/drm/ttm/ttm_resource.h:443:6: note: declared here
     443 | void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk, bool=
 ordered);
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_pin_unpin_r=
esource':
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:508:9: error: too few arguments =
to function 'ttm_lru_bulk_move_init'; expected 2, have 1
     508 |         ttm_lru_bulk_move_init(&lru_bulk_move);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_resource.h:443:6: note: declared here
     443 | void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk, bool=
 ordered);
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_multiple_pi=
n_one_unpin':
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:559:9: error: too few arguments =
to function 'ttm_lru_bulk_move_init'; expected 2, have 1
     559 |         ttm_lru_bulk_move_init(&lru_bulk_move);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/drm/ttm/ttm_resource.h:443:6: note: declared here
     443 | void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk, bool=
 ordered);
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/ttm_lru_bulk_move_init +335 drivers/gpu/drm/ttm/tests/ttm_bo_test.c

995279d280d1ef Karolina Stolarek 2023-11-29  320 =20
995279d280d1ef Karolina Stolarek 2023-11-29  321  static void ttm_bo_unrese=
rve_bulk(struct kunit *test)
995279d280d1ef Karolina Stolarek 2023-11-29  322  {
995279d280d1ef Karolina Stolarek 2023-11-29  323  	struct ttm_test_devices =
*priv =3D test->priv;
995279d280d1ef Karolina Stolarek 2023-11-29  324  	struct ttm_lru_bulk_move=
 lru_bulk_move;
995279d280d1ef Karolina Stolarek 2023-11-29  325  	struct ttm_lru_bulk_move=
_pos *pos;
995279d280d1ef Karolina Stolarek 2023-11-29  326  	struct ttm_buffer_object=
 *bo1, *bo2;
995279d280d1ef Karolina Stolarek 2023-11-29  327  	struct ttm_resource *res=
1, *res2;
995279d280d1ef Karolina Stolarek 2023-11-29  328  	struct ttm_device *ttm_d=
ev;
995279d280d1ef Karolina Stolarek 2023-11-29  329  	struct ttm_place *place;
588c4c8d58c413 Karolina Stolarek 2024-06-12  330  	struct dma_resv *resv;
07430fa5248964 Karolina Stolarek 2024-06-12  331  	u32 mem_type =3D TTM_PL_=
SYSTEM;
995279d280d1ef Karolina Stolarek 2023-11-29  332  	unsigned int bo_priority=
 =3D 0;
995279d280d1ef Karolina Stolarek 2023-11-29  333  	int err;
995279d280d1ef Karolina Stolarek 2023-11-29  334 =20
995279d280d1ef Karolina Stolarek 2023-11-29 @335  	ttm_lru_bulk_move_init(&=
lru_bulk_move);
995279d280d1ef Karolina Stolarek 2023-11-29  336 =20
995279d280d1ef Karolina Stolarek 2023-11-29  337  	place =3D ttm_place_kuni=
t_init(test, mem_type, 0);
995279d280d1ef Karolina Stolarek 2023-11-29  338 =20
995279d280d1ef Karolina Stolarek 2023-11-29  339  	ttm_dev =3D kunit_kzallo=
c(test, sizeof(*ttm_dev), GFP_KERNEL);
995279d280d1ef Karolina Stolarek 2023-11-29  340  	KUNIT_ASSERT_NOT_NULL(te=
st, ttm_dev);
995279d280d1ef Karolina Stolarek 2023-11-29  341 =20
588c4c8d58c413 Karolina Stolarek 2024-06-12  342  	resv =3D kunit_kzalloc(t=
est, sizeof(*resv), GFP_KERNEL);
878516a9e62cd2 Qasim Ijaz        2025-03-13  343  	KUNIT_ASSERT_NOT_NULL(te=
st, resv);
588c4c8d58c413 Karolina Stolarek 2024-06-12  344 =20
77e19f8d32979f Tvrtko Ursulin    2025-10-20  345  	err =3D ttm_device_kunit=
_init(priv, ttm_dev, 0);
995279d280d1ef Karolina Stolarek 2023-11-29  346  	KUNIT_ASSERT_EQ(test, er=
r, 0);
995279d280d1ef Karolina Stolarek 2023-11-29  347  	priv->ttm_dev =3D ttm_de=
v;
995279d280d1ef Karolina Stolarek 2023-11-29  348 =20
588c4c8d58c413 Karolina Stolarek 2024-06-12  349  	dma_resv_init(resv);
588c4c8d58c413 Karolina Stolarek 2024-06-12  350 =20
588c4c8d58c413 Karolina Stolarek 2024-06-12  351  	bo1 =3D ttm_bo_kunit_ini=
t(test, test->priv, BO_SIZE, resv);
588c4c8d58c413 Karolina Stolarek 2024-06-12  352  	bo2 =3D ttm_bo_kunit_ini=
t(test, test->priv, BO_SIZE, resv);
995279d280d1ef Karolina Stolarek 2023-11-29  353 =20
995279d280d1ef Karolina Stolarek 2023-11-29  354  	dma_resv_lock(bo1->base.=
resv, NULL);
995279d280d1ef Karolina Stolarek 2023-11-29  355  	ttm_bo_set_bulk_move(bo1=
, &lru_bulk_move);
995279d280d1ef Karolina Stolarek 2023-11-29  356  	dma_resv_unlock(bo1->bas=
e.resv);
995279d280d1ef Karolina Stolarek 2023-11-29  357 =20
2b624a2c18656e Maarten Lankhorst 2024-12-04  358  	err =3D ttm_resource_all=
oc(bo1, place, &res1, NULL);
995279d280d1ef Karolina Stolarek 2023-11-29  359  	KUNIT_ASSERT_EQ(test, er=
r, 0);
995279d280d1ef Karolina Stolarek 2023-11-29  360  	bo1->resource =3D res1;
995279d280d1ef Karolina Stolarek 2023-11-29  361 =20
995279d280d1ef Karolina Stolarek 2023-11-29  362  	dma_resv_lock(bo2->base.=
resv, NULL);
995279d280d1ef Karolina Stolarek 2023-11-29  363  	ttm_bo_set_bulk_move(bo2=
, &lru_bulk_move);
995279d280d1ef Karolina Stolarek 2023-11-29  364  	dma_resv_unlock(bo2->bas=
e.resv);
995279d280d1ef Karolina Stolarek 2023-11-29  365 =20
2b624a2c18656e Maarten Lankhorst 2024-12-04  366  	err =3D ttm_resource_all=
oc(bo2, place, &res2, NULL);
995279d280d1ef Karolina Stolarek 2023-11-29  367  	KUNIT_ASSERT_EQ(test, er=
r, 0);
995279d280d1ef Karolina Stolarek 2023-11-29  368  	bo2->resource =3D res2;
995279d280d1ef Karolina Stolarek 2023-11-29  369 =20
995279d280d1ef Karolina Stolarek 2023-11-29  370  	ttm_bo_reserve(bo1, fals=
e, false, NULL);
995279d280d1ef Karolina Stolarek 2023-11-29  371  	ttm_bo_unreserve(bo1);
995279d280d1ef Karolina Stolarek 2023-11-29  372 =20
995279d280d1ef Karolina Stolarek 2023-11-29  373  	pos =3D &lru_bulk_move.p=
os[mem_type][bo_priority];
995279d280d1ef Karolina Stolarek 2023-11-29  374  	KUNIT_ASSERT_PTR_EQ(test=
, res1, pos->last);
995279d280d1ef Karolina Stolarek 2023-11-29  375 =20
995279d280d1ef Karolina Stolarek 2023-11-29  376  	ttm_resource_free(bo1, &=
res1);
995279d280d1ef Karolina Stolarek 2023-11-29  377  	ttm_resource_free(bo2, &=
res2);
588c4c8d58c413 Karolina Stolarek 2024-06-12  378 =20
588c4c8d58c413 Karolina Stolarek 2024-06-12  379  	dma_resv_fini(resv);
995279d280d1ef Karolina Stolarek 2023-11-29  380  }
995279d280d1ef Karolina Stolarek 2023-11-29  381 =20

:::::: The code at line 335 was first introduced by commit
:::::: 995279d280d1ef5cc349b6eafee4dccd720c99bf drm/ttm/tests: Add tests fo=
r ttm_bo functions

:::::: TO: Karolina Stolarek <karolina.stolarek@intel.com>
:::::: CC: Christian K=C3=B6nig <christian.koenig@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
