Content-Type: multipart/mixed; boundary="===============5812087968471169846=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [thomash:topic/ttm_branch_v3 6/12] drivers/gpu/drm/ttm/ttm_bo_util.c:195 ttm_bo_move_memcpy() error: uninitialized symbol 'ret'.
Date: Mon, 24 May 2021 12:09:35 +0300
Message-ID: <202105230329.Es09Y8NS-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5812087968471169846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://people.freedesktop.org/~thomash/linux topic/ttm_branch_v3
head:   3c580a2d1a6dfec318b3342719c78f57e19bd132
commit: 7580888150fcf02a7f000227b3c8e7127b1627b8 [6/12] drm/ttm: Add a gene=
ric TTM memcpy move for page-based iomem
config: ia64-randconfig-m031-20210522 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/ttm/ttm_bo_util.c:195 ttm_bo_move_memcpy() error: uninitial=
ized symbol 'ret'.

vim +/ret +195 drivers/gpu/drm/ttm/ttm_bo_util.c

ba4e7d973dd09b Thomas Hellstrom 2009-06-10  145  int ttm_bo_move_memcpy(str=
uct ttm_buffer_object *bo,
3e98d829ad0a59 Roger He         2017-12-08  146  		       struct ttm_operat=
ion_ctx *ctx,
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  147  		       struct ttm_r=
esource *dst_mem)
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  148  {
8af8a109b34fa8 Christian K=C3=B6nig  2020-10-01  149  	struct ttm_device *b=
dev =3D bo->bdev;
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  150  	struct ttm_resource_=
manager *dst_man =3D
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  151  		ttm_manager_type(bo=
->bdev, dst_mem->mem_type);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  152  	struct ttm_tt *ttm =3D bo=
->ttm;
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  153  	struct ttm_resource =
*src_mem =3D &bo->mem;
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  154  	struct ttm_resource_=
manager *src_man =3D
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  155  		ttm_manager_type(bd=
ev, src_mem->mem_type);
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  156  	struct ttm_resource =
src_copy =3D *src_mem;
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  157  	union {
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  158  		struct ttm_kmap_ite=
r_tt tt;
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  159  		struct ttm_kmap_ite=
r_linear_io io;
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  160  	} _dst_iter, _src_it=
er;
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  161  	struct ttm_kmap_iter=
 *dst_iter, *src_iter;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  162  	int ret;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  163  =

7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  164  	if (ttm && ((ttm->pa=
ge_flags & TTM_PAGE_FLAG_SWAPPED) ||
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  165  		    dst_man->use_tt=
)) {
0a667b500703db Dave Airlie      2020-08-25  166  		ret =3D ttm_tt_populate(=
bdev, ttm, ctx);
da95c788ef0c64 Thomas Hellstrom 2013-10-30  167  		if (ret)
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  168  			return ret;
b1e5f172325547 Jerome Glisse    2011-11-02  169  	}
b1e5f172325547 Jerome Glisse    2011-11-02  170  =

7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  171  	dst_iter =3D ttm_kma=
p_iter_linear_io_init(&_dst_iter.io, bdev, dst_mem);
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  172  	if (PTR_ERR(dst_iter=
) =3D=3D -EINVAL && dst_man->use_tt)
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  173  		dst_iter =3D ttm_km=
ap_iter_tt_init(&_dst_iter.tt, bo->ttm);
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  174  	if (IS_ERR(dst_iter))
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  175  		return PTR_ERR(dst_=
iter);
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  176  =

7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  177  	src_iter =3D ttm_kma=
p_iter_linear_io_init(&_src_iter.io, bdev, src_mem);
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  178  	if (PTR_ERR(src_iter=
) =3D=3D -EINVAL && src_man->use_tt)
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  179  		src_iter =3D ttm_km=
ap_iter_tt_init(&_src_iter.tt, bo->ttm);
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  180  	if (IS_ERR(src_iter)=
) {
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  181  		ret =3D PTR_ERR(src=
_iter);
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  182  		goto out_src_iter;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  183  	}
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  184  =

7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  185  	ttm_move_memcpy(bo, =
dst_mem, dst_iter, src_iter);
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  186  	src_copy =3D *src_me=
m;
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  187  	ttm_bo_move_sync_cle=
anup(bo, dst_mem);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  188  =

7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  189  	if (!src_iter->ops->=
maps_tt)
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  190  		ttm_kmap_iter_linea=
r_io_fini(&_src_iter.io, bdev, &src_copy);


"ret" needs to be initialized on the success path.

7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  191  out_src_iter:
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  192  	if (!dst_iter->ops->=
maps_tt)
7580888150fcf0 Thomas Hellstr=C3=B6m 2021-05-20  193  		ttm_kmap_iter_linea=
r_io_fini(&_dst_iter.io, bdev, dst_mem);
da95c788ef0c64 Thomas Hellstrom 2013-10-30  194  =

ba4e7d973dd09b Thomas Hellstrom 2009-06-10 @195  	return ret;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  196  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5812087968471169846==--

