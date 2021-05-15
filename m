Content-Type: multipart/mixed; boundary="===============0802049771779541737=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: drivers/gpu/drm/armada/armada_plane.c:124 armada_drm_plane_atomic_check() warn: variable dereferenced before check 'state' (see line 111)
Date: Sat, 15 May 2021 13:34:47 +0300
Message-ID: <202105150754.JlFEHPkM-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0802049771779541737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   25a1298726e97b9d25379986f5d54d9e62ad6e93
commit: dec92020671c48da231189eb06a5f755f492f87f drm: Use the state pointer=
 directly in planes atomic_check
config: arm-randconfig-m031-20210514 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/armada/armada_plane.c:124 armada_drm_plane_atomic_check() w=
arn: variable dereferenced before check 'state' (see line 111)

vim +/state +124 drivers/gpu/drm/armada/armada_plane.c

d40af7b1ae23da Russell King  2018-07-30  108  int armada_drm_plane_atomic_c=
heck(struct drm_plane *plane,
7c11b99a8e58c0 Maxime Ripard 2021-02-19  109  	struct drm_atomic_state *sta=
te)
d40af7b1ae23da Russell King  2018-07-30  110  {
7c11b99a8e58c0 Maxime Ripard 2021-02-19 @111  	struct drm_plane_state *new_=
plane_state =3D drm_atomic_get_new_plane_state(state,
                                                                           =
                                              ^^^^^
Dereferenced inside the function.

7c11b99a8e58c0 Maxime Ripard 2021-02-19  112  										 plane);
ba5c1649465d40 Maxime Ripard 2021-02-19  113  	struct armada_plane_state *s=
t =3D to_armada_plane_state(new_plane_state);
ba5c1649465d40 Maxime Ripard 2021-02-19  114  	struct drm_crtc *crtc =3D ne=
w_plane_state->crtc;
d40af7b1ae23da Russell King  2018-07-30  115  	struct drm_crtc_state *crtc_=
state;
1d1547ec12bc7d Russell King  2019-01-25  116  	bool interlace;
1d1547ec12bc7d Russell King  2019-01-25  117  	int ret;
1d1547ec12bc7d Russell King  2019-01-25  118  =

ba5c1649465d40 Maxime Ripard 2021-02-19  119  	if (!new_plane_state->fb || =
WARN_ON(!new_plane_state->crtc)) {
ba5c1649465d40 Maxime Ripard 2021-02-19  120  		new_plane_state->visible =
=3D false;
1d1547ec12bc7d Russell King  2019-01-25  121  		return 0;
1d1547ec12bc7d Russell King  2019-01-25  122  	}
d40af7b1ae23da Russell King  2018-07-30  123  =

dec92020671c48 Maxime Ripard 2021-02-19 @124  	if (state)
                                                    ^^^^^
Checked too late.

dec92020671c48 Maxime Ripard 2021-02-19  125  		crtc_state =3D drm_atomic_g=
et_existing_crtc_state(state,
ba5c1649465d40 Maxime Ripard 2021-02-19  126  								crtc);
d40af7b1ae23da Russell King  2018-07-30  127  	else
d40af7b1ae23da Russell King  2018-07-30  128  		crtc_state =3D crtc->state;
1d1547ec12bc7d Russell King  2019-01-25  129  =

ba5c1649465d40 Maxime Ripard 2021-02-19  130  	ret =3D drm_atomic_helper_ch=
eck_plane_state(new_plane_state, crtc_state,
ba5c1649465d40 Maxime Ripard 2021-02-19  131  						  0,

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0802049771779541737==--

