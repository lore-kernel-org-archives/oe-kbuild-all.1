Content-Type: multipart/mixed; boundary="===============1456543786318862676=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lkundrak-linux-mmp:lr/ene-ec-v3 2/2] drivers/mfd/ene-kb3930.c:34:15: sparse: sparse: symbol 'global_kb3930' was not declared. Should it be static?
Date: Sat, 16 May 2020 21:25:05 +0800
Message-ID: <202005162131.A7k8dY81%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1456543786318862676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/lkundrak/linux-mmp.gi=
t lr/ene-ec-v3
head:   84f417afc0f8966e64edbf420c0e7c47b9c451ed
commit: 84f417afc0f8966e64edbf420c0e7c47b9c451ed [2/2] mfd: ene-kb3930: Add=
 driver for ENE KB3930 Embedded Controller
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout 84f417afc0f8966e64edbf420c0e7c47b9c451ed
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/mfd/ene-kb3930.c:34:15: sparse: sparse: symbol 'global_kb3930' w=
as not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1456543786318862676==--

