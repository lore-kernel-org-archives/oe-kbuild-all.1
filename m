Content-Type: multipart/mixed; boundary="===============3626907539335612539=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [plbossart-sound:sdw/master_device-rebase 45/152] drivers/soundwire/intel.c:1221:26: sparse: sparse: symbol 'intel_sdw_driver' was not declared. Should it be static?
Date: Wed, 26 Feb 2020 05:41:54 +0800
Message-ID: <202002260556.YBOqNfNq%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3626907539335612539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/plbossart/sound sdw/master_device-rebase
head:   427a51426536fa3594fc8c0b0ad2b0f847625de5
commit: ecf498d451234e318421c55e1174538d2b6e1f3f [45/152] soundwire: intel:=
 transition to sdw_master_device/driver support
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout ecf498d451234e318421c55e1174538d2b6e1f3f
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/soundwire/intel.c:1221:26: sparse: sparse: symbol 'intel_sdw_dri=
ver' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3626907539335612539==--

