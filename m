Content-Type: multipart/mixed; boundary="===============1734448606984459725=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [kbuild:testing5 5/40] arch/x86/um/sys_call_table_64.c:55:30: error: 'sys_ni_syscall' undeclared here (not in a function); did you mean
Date: Wed, 27 Jan 2021 13:28:56 +0800
Message-ID: <202101271342.BEPBuY4S-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1734448606984459725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbu=
ild.git testing5
head:   4096884562ee16421152cf2a7e2f434f31d52ccd
commit: 70792a782b698370979efc8b229a25c36a81bb01 [5/40] x86: syscall: comme=
nt out syscalls with no entry symbol
config: um-kunit_defconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-k=
build.git/commit/?id=3D70792a782b698370979efc8b229a25c36a81bb01
        git remote add kbuild https://git.kernel.org/pub/scm/linux/kernel/g=
it/masahiroy/linux-kbuild.git
        git fetch --no-tags kbuild testing5
        git checkout 70792a782b698370979efc8b229a25c36a81bb01
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing=
-include-dirs]
   In file included from arch/x86/um/sys_call_table_64.c:43:
>> ./arch/x86/include/generated/asm/syscalls_64.h:1:11: error: expected dec=
laration specifiers or '...' before numeric constant
       1 | __SYSCALL(0, sys_read)
         |           ^
>> ./arch/x86/include/generated/asm/syscalls_64.h:1:14: error: unknown type=
 name 'sys_read'
       1 | __SYSCALL(0, sys_read)
         |              ^~~~~~~~
>> arch/x86/um/sys_call_table_64.c:55:30: error: 'sys_ni_syscall' undeclare=
d here (not in a function); did you mean 'si_syscall'?
      55 |  [0 ... __NR_syscall_max] =3D &sys_ni_syscall,
         |                              ^~~~~~~~~~~~~~
         |                              si_syscall
   In file included from arch/x86/um/sys_call_table_64.c:56:
>> ./arch/x86/include/generated/asm/syscalls_64.h:1:1: error: implicit decl=
aration of function '__SYSCALL'; did you mean 'PT_SYSCALL_NR'? [-Werror=3Di=
mplicit-function-declaration]
       1 | __SYSCALL(0, sys_read)
         | ^~~~~~~~~
         | PT_SYSCALL_NR
>> ./arch/x86/include/generated/asm/syscalls_64.h:1:14: error: 'sys_read' u=
ndeclared here (not in a function)
       1 | __SYSCALL(0, sys_read)
         |              ^~~~~~~~
>> ./arch/x86/include/generated/asm/syscalls_64.h:2:1: error: expected '}' =
before '__SYSCALL'
       2 | __SYSCALL(1, sys_write)
         | ^~~~~~~~~
   arch/x86/um/sys_call_table_64.c:50:63: note: to match this '{'
      50 | const sys_call_ptr_t sys_call_table[] ____cacheline_aligned =3D {
         |                                                               ^
   cc1: some warnings being treated as errors


vim +55 arch/x86/um/sys_call_table_64.c

80f9507886076de0 arch/um/sys-x86_64/syscall_table.c Paolo 'Blaisorblade' Gi=
arrusso 2005-05-01  49  =

b485342bd79af363 arch/x86/um/sys_call_table_64.c    Daniel Borkmann        =
        2015-01-03  50  const sys_call_ptr_t sys_call_table[] ____cacheline=
_aligned =3D {
95906b24fbe4d22e arch/um/sys-x86_64/syscall_table.c Jeff Dike              =
        2008-02-04  51  	/*
45db1c6176c8171d arch/x86/um/sys_call_table_64.c    H. Peter Anvin         =
        2011-12-05  52  	 * Smells like a compiler bug -- it doesn't work
45db1c6176c8171d arch/x86/um/sys_call_table_64.c    H. Peter Anvin         =
        2011-12-05  53  	 * when the & below is removed.
95906b24fbe4d22e arch/um/sys-x86_64/syscall_table.c Jeff Dike              =
        2008-02-04  54  	 */
45db1c6176c8171d arch/x86/um/sys_call_table_64.c    H. Peter Anvin         =
        2011-12-05 @55  	[0 ... __NR_syscall_max] =3D &sys_ni_syscall,
45db1c6176c8171d arch/x86/um/sys_call_table_64.c    H. Peter Anvin         =
        2011-12-05  56  #include <asm/syscalls_64.h>
80f9507886076de0 arch/um/sys-x86_64/syscall_table.c Paolo 'Blaisorblade' Gi=
arrusso 2005-05-01  57  };
f87ea91d988637b3 arch/um/sys-x86_64/syscall_table.c Jeff Dike              =
        2008-02-04  58  =


:::::: The code at line 55 was first introduced by commit
:::::: 45db1c6176c8171d9ae6fa6d82e07d115a5950ca x86, um: Use the same style=
 generated syscall tables as native

:::::: TO: H. Peter Anvin <hpa@linux.intel.com>
:::::: CC: H. Peter Anvin <hpa@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1734448606984459725==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AAA=
--===============1734448606984459725==--

