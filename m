Content-Type: multipart/mixed; boundary="===============5287107574496230579=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [thomash:topic/ttm_branch_v3 8/14] drivers/gpu/drm/ttm/ttm_bo.c:582 ttm_bo_evict_swapout_allowable() warn: variable dereferenced before check 'locked' (see line 570)
Date: Thu, 20 May 2021 21:20:34 +0300
Message-ID: <202105210244.9tjkgs8x-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5287107574496230579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://people.freedesktop.org/~thomash/linux topic/ttm_branch_v3
head:   ed0bde777934916c30fbecb2b351f549eb3a0d0f
commit: dd4d9fc44dbd04b20f2f3a8d7d2512cf271ebe8a [8/14] drm/ttm, drm/amdgpu=
: Allow the driver some control over swapping
config: x86_64-randconfig-m001-20210520 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:582 ttm_bo_evict_swapout_allowable() warn: var=
iable dereferenced before check 'locked' (see line 570)

Old smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:687 ttm_mem_evict_first() warn: inconsistent r=
eturns '&bdev->lru_lock'.

vim +/locked +582 drivers/gpu/drm/ttm/ttm_bo.c

d5769ba315d8ff Roger He         2017-12-21  559  static bool ttm_bo_evict_s=
wapout_allowable(struct ttm_buffer_object *bo,
dd4d9fc44dbd04 Thomas Hellstr=C3=B6m 2021-05-17  560  					   struct ttm_op=
eration_ctx *ctx,
dd4d9fc44dbd04 Thomas Hellstr=C3=B6m 2021-05-17  561  					   const struct =
ttm_place *place,
dd4d9fc44dbd04 Thomas Hellstr=C3=B6m 2021-05-17  562  					   bool *locked,=
 bool *busy)
d5769ba315d8ff Roger He         2017-12-21  563  {
d5769ba315d8ff Roger He         2017-12-21  564  	bool ret =3D false;
d5769ba315d8ff Roger He         2017-12-21  565  =

e532a135d7044b Gerd Hoffmann    2019-08-05  566  	if (bo->base.resv =3D=3D =
ctx->resv) {
52791eeec1d9f4 Christian K=C3=B6nig  2019-08-11  567  		dma_resv_assert_hel=
d(bo->base.resv);
c44dfe4de05391 Christian K=C3=B6nig  2020-11-02  568  		if (ctx->allow_res_=
evict)
d5769ba315d8ff Roger He         2017-12-21  569  			ret =3D true;
d367bd2a5e2b12 Christian K=C3=B6nig  2019-05-22 @570  		*locked =3D false;
d367bd2a5e2b12 Christian K=C3=B6nig  2019-05-22  571  		if (busy)
d367bd2a5e2b12 Christian K=C3=B6nig  2019-05-22  572  			*busy =3D false;
d5769ba315d8ff Roger He         2017-12-21  573  	} else {
52791eeec1d9f4 Christian K=C3=B6nig  2019-08-11  574  		ret =3D dma_resv_tr=
ylock(bo->base.resv);
d367bd2a5e2b12 Christian K=C3=B6nig  2019-05-22  575  		*locked =3D ret;
d367bd2a5e2b12 Christian K=C3=B6nig  2019-05-22  576  		if (busy)
d367bd2a5e2b12 Christian K=C3=B6nig  2019-05-22  577  			*busy =3D !ret;
d5769ba315d8ff Roger He         2017-12-21  578  	}
d5769ba315d8ff Roger He         2017-12-21  579  =

dd4d9fc44dbd04 Thomas Hellstr=C3=B6m 2021-05-17  580  	if (ret && place && =
!bo->bdev->funcs->eviction_valuable(bo, place)) {
dd4d9fc44dbd04 Thomas Hellstr=C3=B6m 2021-05-17  581  		ret =3D false;
dd4d9fc44dbd04 Thomas Hellstr=C3=B6m 2021-05-17 @582  		if (locked)

It should be "if (*locked)"

dd4d9fc44dbd04 Thomas Hellstr=C3=B6m 2021-05-17  583  			dma_resv_unlock(bo=
->base.resv);
dd4d9fc44dbd04 Thomas Hellstr=C3=B6m 2021-05-17  584  	}
dd4d9fc44dbd04 Thomas Hellstr=C3=B6m 2021-05-17  585  =

d5769ba315d8ff Roger He         2017-12-21  586  	return ret;
d5769ba315d8ff Roger He         2017-12-21  587  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5287107574496230579==--

