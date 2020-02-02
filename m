Content-Type: multipart/mixed; boundary="===============0507241576720799179=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [rppt:pg_table/v0.0 18/18] arch/x86/mm/pti.c:62:17: sparse: sparse: symbol 'pti_pgt' was not declared. Should it be static?
Date: Sun, 02 Feb 2020 15:53:00 +0800
Message-ID: <202002021505.A0z7h8Wr%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0507241576720799179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git pg_t=
able/v0.0
head:   fd150c5a9ef6e3e43818825c69a46de2b427dedf
commit: fd150c5a9ef6e3e43818825c69a46de2b427dedf [18/18] pti: use ASI for p=
age table cloning
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        git checkout fd150c5a9ef6e3e43818825c69a46de2b427dedf
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/x86/mm/pti.c:62:17: sparse: sparse: symbol 'pti_pgt' was not declar=
ed. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============0507241576720799179==--

