Content-Type: multipart/mixed; boundary="===============3765370559557800525=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: arch/x86/kernel/apm_32.c:428:43: sparse: sparse: cast truncates bits from constant value (c0000400 becomes 400)
Date: Sun, 10 May 2020 22:03:54 +0800
Message-ID: <202005102246.mLhqhR0Y%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3765370559557800525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e99332e7b4cda6e60f5b5916cf9943a79dbef902
commit: 1651e700664b4597ddf4f8adfe435252a0d11277 x86: Fix bitops.h warning =
with a moved cast
date:   8 weeks ago
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 1651e700664b4597ddf4f8adfe435252a0d11277
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/x86/kernel/apm_32.c:428:43: sparse: sparse: cast truncates bits fro=
m constant value (c0000400 becomes 400)

vim +428 arch/x86/kernel/apm_32.c

c7425314c755d5 arch/x86/kernel/apm_32.c Akinobu Mita   2009-08-09  421  =

c7425314c755d5 arch/x86/kernel/apm_32.c Akinobu Mita   2009-08-09  422  /*
c7425314c755d5 arch/x86/kernel/apm_32.c Akinobu Mita   2009-08-09  423   * =
Set up a segment that references the real mode segment 0x40
c7425314c755d5 arch/x86/kernel/apm_32.c Akinobu Mita   2009-08-09  424   * =
that extends up to the end of page zero (that we have reserved).
c7425314c755d5 arch/x86/kernel/apm_32.c Akinobu Mita   2009-08-09  425   * =
This is for buggy BIOS's that refer to (real mode) segment 0x40
c7425314c755d5 arch/x86/kernel/apm_32.c Akinobu Mita   2009-08-09  426   * =
even though they are called in protected mode.
c7425314c755d5 arch/x86/kernel/apm_32.c Akinobu Mita   2009-08-09  427   */
c7425314c755d5 arch/x86/kernel/apm_32.c Akinobu Mita   2009-08-09 @428  sta=
tic struct desc_struct bad_bios_desc =3D GDT_ENTRY_INIT(0x4092,
c7425314c755d5 arch/x86/kernel/apm_32.c Akinobu Mita   2009-08-09  429  			=
(unsigned long)__va(0x400UL), PAGE_SIZE - 0x400 - 1);
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  430  =


:::::: The code at line 428 was first introduced by commit
:::::: c7425314c755d5f94da7c978205c85a7c6201212 x86: Introduce GDT_ENTRY_IN=
IT(), initialize bad_bios_desc statically

:::::: TO: Akinobu Mita <akinobu.mita@gmail.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3765370559557800525==--

