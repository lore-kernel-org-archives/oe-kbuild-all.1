Content-Type: multipart/mixed; boundary="===============3082011121197606871=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [omap:serdev-ngsm-pending-v5.7 20/29] drivers/gnss/motmdm.c:71:5: sparse: sparse: symbol 'motmdm_gnss_send_command' was not declared. Should it be static?
Date: Sun, 10 May 2020 23:36:57 +0800
Message-ID: <202005102338.fOZzLJuj%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3082011121197606871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.g=
it serdev-ngsm-pending-v5.7
head:   4eda51fea6be98ca5a4023a988b102bf3629b295
commit: ae348e86a0abccb615c8875a95d63f10268f1c4f [20/29] gnss: motmdm: Add =
support for Motorola Mapphone MDM6600 modem
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout ae348e86a0abccb615c8875a95d63f10268f1c4f
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gnss/motmdm.c:71:5: sparse: sparse: symbol 'motmdm_gnss_send_com=
mand' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3082011121197606871==--

