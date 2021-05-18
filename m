Content-Type: multipart/mixed; boundary="===============4901246272733511108=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [kbuild] [intel-linux-intel-lts:5.4/yocto 5/5] drivers/gpu/drm/drm_edid.c:5597 drm_update_tile_info() error: uninitialized symbol 'length'.
Date: Tue, 18 May 2021 11:39:12 +0300
Message-ID: <202105180159.03dJO7O1-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4901246272733511108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel/linux-intel-lts.git  5.4/yocto
head:   8e2b1510d279aecb1f89907553283c79c1b2b226
commit: 8e2b1510d279aecb1f89907553283c79c1b2b226 [5/5] drm/edid: Fix DispID=
 tile parsing for override EDID
config: i386-randconfig-m021-20210517 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/drm_edid.c:5597 drm_update_tile_info() error: uninitialized=
 symbol 'length'.
drivers/gpu/drm/drm_edid.c:5597 drm_update_tile_info() error: uninitialized=
 symbol 'idx'.

Old smatch warnings:
drivers/gpu/drm/drm_edid.c:1485 drm_edid_are_equal() error: we previously a=
ssumed 'edid2' could be null (see line 1478)

vim +/length +5597 drivers/gpu/drm/drm_edid.c

8e2b1510d279ae Ville Syrj=C3=A4l=C3=A4 2020-03-13  5584  void drm_update_ti=
le_info(struct drm_connector *connector,
8e2b1510d279ae Ville Syrj=C3=A4l=C3=A4 2020-03-13  5585  			  const struct =
edid *edid)
40d9b043a89e23 Dave Airlie   2014-10-20  5586  {
8e2b1510d279ae Ville Syrj=C3=A4l=C3=A4 2020-03-13  5587  	const void *displ=
ayid =3D NULL;
8e2b1510d279ae Ville Syrj=C3=A4l=C3=A4 2020-03-13  5588  	int length, idx;
                                                ^^^^^^^^^^^^^^^

40d9b043a89e23 Dave Airlie   2014-10-20  5589  	int ret;
40d9b043a89e23 Dave Airlie   2014-10-20  5590  	connector->has_tile =3D fal=
se;
40d9b043a89e23 Dave Airlie   2014-10-20  5591  	displayid =3D drm_find_disp=
layid_extension(edid);
40d9b043a89e23 Dave Airlie   2014-10-20  5592  	if (!displayid) {
40d9b043a89e23 Dave Airlie   2014-10-20  5593  		/* drop reference to any t=
ile group we had */
40d9b043a89e23 Dave Airlie   2014-10-20  5594  		goto out_drop_ref;
40d9b043a89e23 Dave Airlie   2014-10-20  5595  	}
40d9b043a89e23 Dave Airlie   2014-10-20  5596  =

8e2b1510d279ae Ville Syrj=C3=A4l=C3=A4 2020-03-13 @5597  	ret =3D drm_displ=
ayid_parse_tiled(connector, displayid, length, idx);
                                                                           =
                           ^^^^^^^^^^^
Uninitialized.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =


_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org

--===============4901246272733511108==--

