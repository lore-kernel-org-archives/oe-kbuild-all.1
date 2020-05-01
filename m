Content-Type: multipart/mixed; boundary="===============7379469985000288042=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 1/1] drm/mm: optimize rb_hole_addr rbtree search
Date: Sat, 02 May 2020 05:29:37 +0800
Message-ID: <202005020555.d14nlN9q%lkp@intel.com>
In-Reply-To: <20200430095839.6474-1-nirmoy.das@amd.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7379469985000288042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Nirmoy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-exynos/exynos-drm-next tegra-drm/drm/tegra/=
for-next drm-tip/drm-tip linus/master v5.7-rc3 next-20200501]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Nirmoy-Das/drm-mm-optimize=
-rb_hole_addr-rbtree-search/20200501-165835
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/drm_mm.c:248:6: sparse: sparse: symbol 'insert_hole_addr=
' was not declared. Should it be static?
   drivers/gpu/drm/drm_mm.c:401:24: sparse: sparse: Using plain integer as =
NULL pointer
   drivers/gpu/drm/drm_mm.c:441:24: sparse: sparse: Using plain integer as =
NULL pointer

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7379469985000288042==--

