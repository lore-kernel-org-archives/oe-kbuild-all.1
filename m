Content-Type: multipart/mixed; boundary="===============1625484274277796040=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [shenki:dev-5.4 250/293] drivers/char/tpm/tpm_tis_i2c.c: linux/module.h is included more than once.
Date: Wed, 19 May 2021 16:39:04 +0800
Message-ID: <20210519083904.GW2687475@shao2-debian>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1625484274277796040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/shenki/linux dev-5.4
head:   43e79c6defc55f9c0e3190aa2c2ed0bd1b704e07
commit: 64ff069ebc777efcc839ad1d07f35951937b3c4b [250/293] tpm: tpm_tis: ad=
d tpm_tis_i2c driver
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)

>> drivers/char/tpm/tpm_tis_i2c.c: linux/module.h is included more than onc=
e.


Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1625484274277796040==--

