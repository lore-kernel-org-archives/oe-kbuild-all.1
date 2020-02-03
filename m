Content-Type: multipart/mixed; boundary="===============2987799642566061469=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [android-common:android-4.19 1/4] drivers/staging/android/ion/ion.c:666:5: sparse: sparse: symbol 'ion_module_init' was not declared. Should it be static?
Date: Mon, 03 Feb 2020 12:10:41 +0800
Message-ID: <202002030842.R9yGZKhF%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2987799642566061469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android-4.19
head:   983e2cdf34d065dd89e93bd096a76994b29aebcd
commit: f64a8b79c0e85440319136ed928f22ed37481742 [1/4] ANDROID: staging: an=
droid: ion: enable modularizing the ion driver
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        git checkout f64a8b79c0e85440319136ed928f22ed37481742
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/staging/android/ion/ion.c:666:5: sparse: sparse: symbol 'ion_mod=
ule_init' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============2987799642566061469==--

