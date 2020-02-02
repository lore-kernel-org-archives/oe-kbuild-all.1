Content-Type: multipart/mixed; boundary="===============7192348593843434981=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [zen-kernel-zen-kernel:5.5/muqss 22/22] kernel/sched/sched.h:1659:9: sparse: this was the original definition
Date: Sun, 02 Feb 2020 22:32:52 +0800
Message-ID: <202002022233.7Rsxv3Gz%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7192348593843434981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 5.5/muqss
head:   bf569053d0fe08b3615793a0105afff3d28f3676
commit: bf569053d0fe08b3615793a0105afff3d28f3676 [22/22] muqss: Re-define W=
F_* wake flags in wait.c
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        git checkout bf569053d0fe08b3615793a0105afff3d28f3676
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   kernel/sched/wait.c:14:9: sparse: sparse: preprocessor token WF_MIGRATED=
 redefined
>> kernel/sched/sched.h:1659:9: sparse: this was the original definition

vim +1659 kernel/sched/sched.h

cca26e8009d193 Kirill Tkhai 2014-08-20  1653  =

b13095f07f2546 Li Zefan     2013-03-05  1654  /*
b13095f07f2546 Li Zefan     2013-03-05  1655   * wake flags
b13095f07f2546 Li Zefan     2013-03-05  1656   */
97fb7a0a8944bd Ingo Molnar  2018-03-03  1657  #define WF_SYNC			0x01		/* Wa=
ker goes to sleep after wakeup */
97fb7a0a8944bd Ingo Molnar  2018-03-03  1658  #define WF_FORK			0x02		/* Ch=
ild wakeup after fork */
97fb7a0a8944bd Ingo Molnar  2018-03-03 @1659  #define WF_MIGRATED		0x4		/* =
Internal use, task got migrated */
b13095f07f2546 Li Zefan     2013-03-05  1660  =


:::::: The code at line 1659 was first introduced by commit
:::::: 97fb7a0a8944bd6d2c5634e1e0fa689a5c40bc22 sched: Clean up and harmoni=
ze the coding style of the scheduler code base

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============7192348593843434981==--

