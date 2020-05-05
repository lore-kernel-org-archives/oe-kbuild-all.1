Content-Type: multipart/mixed; boundary="===============5605848249260544411=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [arnd-playground:randconfig-20200504 201/355] arch/powerpc/include/asm/compat.h:44:2: error: unknown type name 'old_time32_t'
Date: Tue, 05 May 2020 17:43:24 +0800
Message-ID: <202005051711.Ovy4qBSb%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5605848249260544411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 randconfig-20200504
head:   5867adb94a59773ef2e3262b70538803fe896906
commit: a568550c861bca7a658220e2fff7c80678bdd036 [201/355] temp: hide time3=
2_t completely
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout a568550c861bca7a658220e2fff7c80678bdd036
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/compat.h:22,
                    from arch/powerpc/kernel/asm-offsets.c:14:
>> arch/powerpc/include/asm/compat.h:44:2: error: unknown type name 'old_ti=
me32_t'
      44 |  old_time32_t st_atime;
         |  ^~~~~~~~~~~~
   arch/powerpc/include/asm/compat.h:46:2: error: unknown type name 'old_ti=
me32_t'
      46 |  old_time32_t st_mtime;
         |  ^~~~~~~~~~~~
   arch/powerpc/include/asm/compat.h:48:2: error: unknown type name 'old_ti=
me32_t'
      48 |  old_time32_t st_ctime;
         |  ^~~~~~~~~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:30:
   arch/powerpc/kernel/asm-offsets.c: In function 'main':
>> include/linux/compiler_types.h:129:35: error: invalid use of undefined t=
ype 'struct old_timeval32'
     129 | #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
       6 |  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val=
))
         |                                                              ^~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_of=
fsetof'
      17 | #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kbuild.h:11:14: note: in expansion of macro 'offsetof'
      11 |  DEFINE(sym, offsetof(struct str, mem))
         |              ^~~~~~~~
   arch/powerpc/kernel/asm-offsets.c:422:2: note: in expansion of macro 'OF=
FSET'
     422 |  OFFSET(TVAL32_TV_SEC, old_timeval32, tv_sec);
         |  ^~~~~~
>> include/linux/compiler_types.h:129:35: error: invalid use of undefined t=
ype 'struct old_timeval32'
     129 | #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
       6 |  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val=
))
         |                                                              ^~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_of=
fsetof'
      17 | #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kbuild.h:11:14: note: in expansion of macro 'offsetof'
      11 |  DEFINE(sym, offsetof(struct str, mem))
         |              ^~~~~~~~
   arch/powerpc/kernel/asm-offsets.c:423:2: note: in expansion of macro 'OF=
FSET'
     423 |  OFFSET(TVAL32_TV_USEC, old_timeval32, tv_usec);
         |  ^~~~~~
>> include/linux/compiler_types.h:129:35: error: invalid use of undefined t=
ype 'struct old_timespec32'
     129 | #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
       6 |  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val=
))
         |                                                              ^~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_of=
fsetof'
      17 | #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kbuild.h:11:14: note: in expansion of macro 'offsetof'
      11 |  DEFINE(sym, offsetof(struct str, mem))
         |              ^~~~~~~~
   arch/powerpc/kernel/asm-offsets.c:424:2: note: in expansion of macro 'OF=
FSET'
     424 |  OFFSET(TSPC32_TV_SEC, old_timespec32, tv_sec);
         |  ^~~~~~
>> include/linux/compiler_types.h:129:35: error: invalid use of undefined t=
ype 'struct old_timespec32'
     129 | #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
       6 |  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val=
))
         |                                                              ^~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_of=
fsetof'
      17 | #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~~
   include/linux/kbuild.h:11:14: note: in expansion of macro 'offsetof'
      11 |  DEFINE(sym, offsetof(struct str, mem))
         |              ^~~~~~~~
   arch/powerpc/kernel/asm-offsets.c:425:2: note: in expansion of macro 'OF=
FSET'
     425 |  OFFSET(TSPC32_TV_NSEC, old_timespec32, tv_nsec);
         |  ^~~~~~
   make[2]: *** [scripts/Makefile.build:106: arch/powerpc/kernel/asm-offset=
s.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1121: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:180: sub-make] Error 2

vim +/old_time32_t +44 arch/powerpc/include/asm/compat.h

^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  32  =

^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  33  struct compat_stat {
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  34  	compat_dev_t	st_dev;
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  35  	compat_ino_t	st_ino;
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  36  	compat_mode_t	st_mode;
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  37  	compat_nlink_t	st_nlink;
202e5979af4d91 include/asm-ppc64/compat.h        Stephen Rothwell 2005-09-0=
6  38  	__compat_uid32_t	st_uid;
202e5979af4d91 include/asm-ppc64/compat.h        Stephen Rothwell 2005-09-0=
6  39  	__compat_gid32_t	st_gid;
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  40  	compat_dev_t	st_rdev;
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  41  	compat_off_t	st_size;
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  42  	compat_off_t	st_blksize;
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  43  	compat_off_t	st_blocks;
9afc5eee65ca7d arch/powerpc/include/asm/compat.h Arnd Bergmann    2018-07-1=
3 @44  	old_time32_t	st_atime;
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  45  	u32		st_atime_nsec;
9afc5eee65ca7d arch/powerpc/include/asm/compat.h Arnd Bergmann    2018-07-1=
3  46  	old_time32_t	st_mtime;
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  47  	u32		st_mtime_nsec;
9afc5eee65ca7d arch/powerpc/include/asm/compat.h Arnd Bergmann    2018-07-1=
3  48  	old_time32_t	st_ctime;
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  49  	u32		st_ctime_nsec;
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  50  	u32		__unused4[2];
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  51  };
^1da177e4c3f41 include/asm-ppc64/compat.h        Linus Torvalds   2005-04-1=
6  52  =


:::::: The code at line 44 was first introduced by commit
:::::: 9afc5eee65ca7d717a99d6fe8f4adfe32a40940a y2038: globally rename comp=
at_time to old_time32

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5605848249260544411==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5605848249260544411==--

