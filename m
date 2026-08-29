Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DCF632
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996558; cv=none; b=P41pCwhqgzCMvUh0/zWaBf8Z7nkG7JgVzbghd3CEm00WFEinltWoy5FsKWd4C+zuwXVNeQkloLaqP8sV4wMQQNnUhDsPdpJp6cZZLFlvTuvSiR7inM1afqEQPhqnjBTOKrlLWZddscj2aQEEfqgIvn7RD0LbCTaE8CnReK2LpbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996558; c=relaxed/simple;
	bh=gPbWuMSSpUhxFF74ADCEKGChT4Gev0NEPXKUauisxYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bKeGSwA1dWxs6kOE+doTmxo7eYg4fUvNkv6NYNJDdHV9k2Jz4iLfLB+pfhCTecqeq8TSRBg8pPUhT3wQaqu7L8arAhCJ72Ug11LwEt7noCC4qXeydUT2+TvneZcmFUZ6I17WEakrFbc0FWJdOz1rdvCicDyZONYm3zjoW/yFmZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KU/+eIu+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KU/+eIu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787996556; x=1819532556;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gPbWuMSSpUhxFF74ADCEKGChT4Gev0NEPXKUauisxYs=;
  b=KU/+eIu+4wXYt2tItEmBQ4dLygYe9qgrocpF3u7/hX/u/d6dL7p3X0DM
   V2DLBo7UuwQC1M54JeNmaYeZDEc5Bf7NwlNVrxL1qLQI4564h1xSxQxx9
   tdoBgGxtuq1/VQkFstJkZjqgAyWHwzAqRA22k/5W+MRFyWWeLfvjoKYua
   KyLz3msVChMIvsB/bZnv0Uw6oEHKsCLbeWmE/tE0UsgaQ5U1k6Wan2V8G
   kr5px6NdzdNAC1Mom2dmmEyX2OakPzF40DDqg4uaYJ3/vwDAE/H7hBYu6
   /8/Ho/s4NLFEIm6Zxu4nM+uDUeUu3PsxgqEM1tjeF49fZD3G/ebhZPvFr
   w==;
X-CSE-ConnectionGUID: IE3N8fa/RgaVCkzyGfaE9A==
X-CSE-MsgGUID: INUfNwC2S/m89cDtVikxFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88537730"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="88537730"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 02:42:35 -0700
X-CSE-ConnectionGUID: CVo6qOI2SwKttYzWpzA5aA==
X-CSE-MsgGUID: x5A0zNgQRMi9u/CFpMda/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="267048818"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Aug 2026 02:42:34 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0Fa4-00000000CdA-0NaD;
	Sat, 29 Aug 2026 09:42:32 +0000
Date: Sat, 29 Aug 2026 17:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/vramstuff 21/28]
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c:335:9: error: too few arguments to
 function 'ttm_lru_bulk_move_init'
Message-ID: <202608291747.FgRdHIvB-lkp@intel.com>
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
head:   da1cf9de1bba45648450c64323fca70bcf2a65ae
commit: 2fbdb6893cc6ed358f0232bff4eef598a6c5b419 [21/28] drm/ttm: Add order=
ed bulk moves
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/2026082=
9/202608291747.FgRdHIvB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260829/202608291747.FgRdHIvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608291747.FgRdHIvB-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_unreserve_b=
ulk':
>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:335:9: error: too few arguments =
to function 'ttm_lru_bulk_move_init'
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
to function 'ttm_lru_bulk_move_init'
     508 |         ttm_lru_bulk_move_init(&lru_bulk_move);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/tests/ttm_bo_test.c:13:
   include/drm/ttm/ttm_resource.h:443:6: note: declared here
     443 | void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk, bool=
 ordered);
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_multiple_pi=
n_one_unpin':
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:559:9: error: too few arguments =
to function 'ttm_lru_bulk_move_init'
     559 |         ttm_lru_bulk_move_init(&lru_bulk_move);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/tests/ttm_bo_test.c:13:
   include/drm/ttm/ttm_resource.h:443:6: note: declared here
     443 | void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk, bool=
 ordered);
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/ttm_lru_bulk_move_init +335 drivers/gpu/drm/ttm/tests/ttm_bo_test.c

995279d280d1ef5 Karolina Stolarek 2023-11-29  320 =20
995279d280d1ef5 Karolina Stolarek 2023-11-29  321  static void ttm_bo_unres=
erve_bulk(struct kunit *test)
995279d280d1ef5 Karolina Stolarek 2023-11-29  322  {
995279d280d1ef5 Karolina Stolarek 2023-11-29  323  	struct ttm_test_devices=
 *priv =3D test->priv;
995279d280d1ef5 Karolina Stolarek 2023-11-29  324  	struct ttm_lru_bulk_mov=
e lru_bulk_move;
995279d280d1ef5 Karolina Stolarek 2023-11-29  325  	struct ttm_lru_bulk_mov=
e_pos *pos;
995279d280d1ef5 Karolina Stolarek 2023-11-29  326  	struct ttm_buffer_objec=
t *bo1, *bo2;
995279d280d1ef5 Karolina Stolarek 2023-11-29  327  	struct ttm_resource *re=
s1, *res2;
995279d280d1ef5 Karolina Stolarek 2023-11-29  328  	struct ttm_device *ttm_=
dev;
995279d280d1ef5 Karolina Stolarek 2023-11-29  329  	struct ttm_place *place;
588c4c8d58c413b Karolina Stolarek 2024-06-12  330  	struct dma_resv *resv;
07430fa5248964d Karolina Stolarek 2024-06-12  331  	u32 mem_type =3D TTM_PL=
_SYSTEM;
995279d280d1ef5 Karolina Stolarek 2023-11-29  332  	unsigned int bo_priorit=
y =3D 0;
995279d280d1ef5 Karolina Stolarek 2023-11-29  333  	int err;
995279d280d1ef5 Karolina Stolarek 2023-11-29  334 =20
995279d280d1ef5 Karolina Stolarek 2023-11-29 @335  	ttm_lru_bulk_move_init(=
&lru_bulk_move);
995279d280d1ef5 Karolina Stolarek 2023-11-29  336 =20
995279d280d1ef5 Karolina Stolarek 2023-11-29  337  	place =3D ttm_place_kun=
it_init(test, mem_type, 0);
995279d280d1ef5 Karolina Stolarek 2023-11-29  338 =20
995279d280d1ef5 Karolina Stolarek 2023-11-29  339  	ttm_dev =3D kunit_kzall=
oc(test, sizeof(*ttm_dev), GFP_KERNEL);
995279d280d1ef5 Karolina Stolarek 2023-11-29  340  	KUNIT_ASSERT_NOT_NULL(t=
est, ttm_dev);
995279d280d1ef5 Karolina Stolarek 2023-11-29  341 =20
588c4c8d58c413b Karolina Stolarek 2024-06-12  342  	resv =3D kunit_kzalloc(=
test, sizeof(*resv), GFP_KERNEL);
878516a9e62cd22 Qasim Ijaz        2025-03-13  343  	KUNIT_ASSERT_NOT_NULL(t=
est, resv);
588c4c8d58c413b Karolina Stolarek 2024-06-12  344 =20
77e19f8d32979f0 Tvrtko Ursulin    2025-10-20  345  	err =3D ttm_device_kuni=
t_init(priv, ttm_dev, 0);
995279d280d1ef5 Karolina Stolarek 2023-11-29  346  	KUNIT_ASSERT_EQ(test, e=
rr, 0);
995279d280d1ef5 Karolina Stolarek 2023-11-29  347  	priv->ttm_dev =3D ttm_d=
ev;
995279d280d1ef5 Karolina Stolarek 2023-11-29  348 =20
588c4c8d58c413b Karolina Stolarek 2024-06-12  349  	dma_resv_init(resv);
588c4c8d58c413b Karolina Stolarek 2024-06-12  350 =20
588c4c8d58c413b Karolina Stolarek 2024-06-12  351  	bo1 =3D ttm_bo_kunit_in=
it(test, test->priv, BO_SIZE, resv);
588c4c8d58c413b Karolina Stolarek 2024-06-12  352  	bo2 =3D ttm_bo_kunit_in=
it(test, test->priv, BO_SIZE, resv);
995279d280d1ef5 Karolina Stolarek 2023-11-29  353 =20
995279d280d1ef5 Karolina Stolarek 2023-11-29  354  	dma_resv_lock(bo1->base=
.resv, NULL);
995279d280d1ef5 Karolina Stolarek 2023-11-29  355  	ttm_bo_set_bulk_move(bo=
1, &lru_bulk_move);
995279d280d1ef5 Karolina Stolarek 2023-11-29  356  	dma_resv_unlock(bo1->ba=
se.resv);
995279d280d1ef5 Karolina Stolarek 2023-11-29  357 =20
2b624a2c18656ea Maarten Lankhorst 2024-12-04  358  	err =3D ttm_resource_al=
loc(bo1, place, &res1, NULL);
995279d280d1ef5 Karolina Stolarek 2023-11-29  359  	KUNIT_ASSERT_EQ(test, e=
rr, 0);
995279d280d1ef5 Karolina Stolarek 2023-11-29  360  	bo1->resource =3D res1;
995279d280d1ef5 Karolina Stolarek 2023-11-29  361 =20
995279d280d1ef5 Karolina Stolarek 2023-11-29  362  	dma_resv_lock(bo2->base=
.resv, NULL);
995279d280d1ef5 Karolina Stolarek 2023-11-29  363  	ttm_bo_set_bulk_move(bo=
2, &lru_bulk_move);
995279d280d1ef5 Karolina Stolarek 2023-11-29  364  	dma_resv_unlock(bo2->ba=
se.resv);
995279d280d1ef5 Karolina Stolarek 2023-11-29  365 =20
2b624a2c18656ea Maarten Lankhorst 2024-12-04  366  	err =3D ttm_resource_al=
loc(bo2, place, &res2, NULL);
995279d280d1ef5 Karolina Stolarek 2023-11-29  367  	KUNIT_ASSERT_EQ(test, e=
rr, 0);
995279d280d1ef5 Karolina Stolarek 2023-11-29  368  	bo2->resource =3D res2;
995279d280d1ef5 Karolina Stolarek 2023-11-29  369 =20
995279d280d1ef5 Karolina Stolarek 2023-11-29  370  	ttm_bo_reserve(bo1, fal=
se, false, NULL);
995279d280d1ef5 Karolina Stolarek 2023-11-29  371  	ttm_bo_unreserve(bo1);
995279d280d1ef5 Karolina Stolarek 2023-11-29  372 =20
995279d280d1ef5 Karolina Stolarek 2023-11-29  373  	pos =3D &lru_bulk_move.=
pos[mem_type][bo_priority];
995279d280d1ef5 Karolina Stolarek 2023-11-29  374  	KUNIT_ASSERT_PTR_EQ(tes=
t, res1, pos->last);
995279d280d1ef5 Karolina Stolarek 2023-11-29  375 =20
995279d280d1ef5 Karolina Stolarek 2023-11-29  376  	ttm_resource_free(bo1, =
&res1);
995279d280d1ef5 Karolina Stolarek 2023-11-29  377  	ttm_resource_free(bo2, =
&res2);
588c4c8d58c413b Karolina Stolarek 2024-06-12  378 =20
588c4c8d58c413b Karolina Stolarek 2024-06-12  379  	dma_resv_fini(resv);
995279d280d1ef5 Karolina Stolarek 2023-11-29  380  }
995279d280d1ef5 Karolina Stolarek 2023-11-29  381 =20

:::::: The code at line 335 was first introduced by commit
:::::: 995279d280d1ef5cc349b6eafee4dccd720c99bf drm/ttm/tests: Add tests fo=
r ttm_bo functions

:::::: TO: Karolina Stolarek <karolina.stolarek@intel.com>
:::::: CC: Christian K=C3=B6nig <christian.koenig@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
