Content-Type: multipart/mixed; boundary="===============8647360500877112951=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [drm-drm-misc:drm-misc-next 2/3] drivers/gpu/drm/panfrost/panfrost_drv.c:662:12: sparse: sparse: symbol 'default_supplies' was not declared. Should it be static?
Date: Thu, 27 Feb 2020 09:40:58 +0800
Message-ID: <202002270919.HDU1EgMa%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8647360500877112951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   506629c868d0b1d641fc3afa491ddbd85fa1bdc3
commit: 3e1399bccf5163c59f41298b4faf768e199f4322 [2/3] drm/panfrost: Add su=
pport for multiple regulators
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout 3e1399bccf5163c59f41298b4faf768e199f4322
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/panfrost/panfrost_drv.c:662:12: sparse: sparse: symbol '=
default_supplies' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8647360500877112951==--

