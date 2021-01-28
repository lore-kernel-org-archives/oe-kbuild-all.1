Content-Type: multipart/mixed; boundary="===============5832597725166850666=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [tip:locking/core 1/3] include/linux/syscalls.h:238:18: error: conflicting types for 'sys_futex'
Date: Thu, 28 Jan 2021 10:29:58 +0800
Message-ID: <202101281034.2yevf7Rg-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5832597725166850666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking=
/core
head:   59ea5f1508e15cecddd8e2ca828f7962ea37adab
commit: 3018a08401300005536817507dd14c2a7c4ffa69 [1/3] futex: Change utime =
parameter to be 'const ... *'
config: nios2-3c120_defconfig (attached as .config)
compiler: nios2-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commi=
t/?id=3D3018a08401300005536817507dd14c2a7c4ffa69
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/=
tip/tip.git
        git fetch --no-tags tip locking/core
        git checkout 3018a08401300005536817507dd14c2a7c4ffa69
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dnios2 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/futex.c:37:
>> include/linux/syscalls.h:238:18: error: conflicting types for 'sys_futex'
     238 |  asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
         |                  ^~~
   include/linux/syscalls.h:224:2: note: in expansion of macro '__SYSCALL_D=
EFINEx'
     224 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DE=
FINEx'
     218 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, _=
_VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/futex.c:3792:1: note: in expansion of macro 'SYSCALL_DEFINE6'
    3792 | SYSCALL_DEFINE6(futex, u32 __user *, uaddr, int, op, u32, val,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:585:17: note: previous declaration of 'sys_fute=
x' was here
     585 | asmlinkage long sys_futex(u32 __user *uaddr, int op, u32 val,
         |                 ^~~~~~~~~
>> include/linux/syscalls.h:238:18: error: conflicting types for 'sys_futex=
_time32'
     238 |  asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
         |                  ^~~
   include/linux/syscalls.h:224:2: note: in expansion of macro '__SYSCALL_D=
EFINEx'
     224 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:218:36: note: in expansion of macro 'SYSCALL_DE=
FINEx'
     218 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, _=
_VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/futex.c:3988:1: note: in expansion of macro 'SYSCALL_DEFINE6'
    3988 | SYSCALL_DEFINE6(futex_time32, u32 __user *, uaddr, int, op, u32,=
 val,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:588:17: note: previous declaration of 'sys_fute=
x_time32' was here
     588 | asmlinkage long sys_futex_time32(u32 __user *uaddr, int op, u32 =
val,
         |                 ^~~~~~~~~~~~~~~~


vim +/sys_futex +238 include/linux/syscalls.h

bed1ffca022cc876 Frederic Weisbecker 2009-03-13  212  =

6c5979631b4b03c9 Heiko Carstens      2009-02-11  213  #define SYSCALL_DEFIN=
E1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
6c5979631b4b03c9 Heiko Carstens      2009-02-11  214  #define SYSCALL_DEFIN=
E2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
6c5979631b4b03c9 Heiko Carstens      2009-02-11  215  #define SYSCALL_DEFIN=
E3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
6c5979631b4b03c9 Heiko Carstens      2009-02-11  216  #define SYSCALL_DEFIN=
E4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
6c5979631b4b03c9 Heiko Carstens      2009-02-11  217  #define SYSCALL_DEFIN=
E5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
6c5979631b4b03c9 Heiko Carstens      2009-02-11 @218  #define SYSCALL_DEFIN=
E6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
1a94bc34768e463a Heiko Carstens      2009-01-14  219  =

609320c8a22715b7 Yonghong Song       2017-09-07  220  #define SYSCALL_DEFIN=
E_MAXARGS	6
609320c8a22715b7 Yonghong Song       2017-09-07  221  =

bed1ffca022cc876 Frederic Weisbecker 2009-03-13  222  #define SYSCALL_DEFIN=
Ex(x, sname, ...)				\
99e621f796d7f034 Al Viro             2013-03-05  223  	SYSCALL_METADATA(sna=
me, x, __VA_ARGS__)			\
bed1ffca022cc876 Frederic Weisbecker 2009-03-13  224  	__SYSCALL_DEFINEx(x,=
 sname, __VA_ARGS__)
bed1ffca022cc876 Frederic Weisbecker 2009-03-13  225  =

2cf0966683430b64 Al Viro             2013-01-21  226  #define __PROTECT(...=
) asmlinkage_protect(__VA_ARGS__)
1bd21c6c21e84899 Dominik Brodowski   2018-04-05  227  =

e145242ea0df6b7d Dominik Brodowski   2018-04-09  228  /*
e145242ea0df6b7d Dominik Brodowski   2018-04-09  229   * The asmlinkage stu=
b is aliased to a function named __se_sys_*() which
e145242ea0df6b7d Dominik Brodowski   2018-04-09  230   * sign-extends 32-bi=
t ints to longs whenever needed. The actual work is
e145242ea0df6b7d Dominik Brodowski   2018-04-09  231   * done within __do_s=
ys_*().
e145242ea0df6b7d Dominik Brodowski   2018-04-09  232   */
1bd21c6c21e84899 Dominik Brodowski   2018-04-05  233  #ifndef __SYSCALL_DEF=
INEx
bed1ffca022cc876 Frederic Weisbecker 2009-03-13  234  #define __SYSCALL_DEF=
INEx(x, name, ...)					\
bee20031772af3de Arnd Bergmann       2018-06-19  235  	__diag_push();						=
	\
bee20031772af3de Arnd Bergmann       2018-06-19  236  	__diag_ignore(GCC, 8=
, "-Wattribute-alias",			\
bee20031772af3de Arnd Bergmann       2018-06-19  237  		      "Type aliasin=
g is used to sanitize syscall arguments");\
83460ec8dcac1414 Andi Kleen          2013-11-12 @238  	asmlinkage long sys#=
#name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
e145242ea0df6b7d Dominik Brodowski   2018-04-09  239  		__attribute__((alia=
s(__stringify(__se_sys##name))));	\
c9a211951c7c79cf Howard McLauchlan   2018-03-21  240  	ALLOW_ERROR_INJECTIO=
N(sys##name, ERRNO);			\
e145242ea0df6b7d Dominik Brodowski   2018-04-09  241  	static inline long _=
_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
e145242ea0df6b7d Dominik Brodowski   2018-04-09  242  	asmlinkage long __se=
_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
e145242ea0df6b7d Dominik Brodowski   2018-04-09  243  	asmlinkage long __se=
_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
1a94bc34768e463a Heiko Carstens      2009-01-14  244  	{								\
e145242ea0df6b7d Dominik Brodowski   2018-04-09  245  		long ret =3D __do_s=
ys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
07fe6e00f6cca6fe Al Viro             2013-01-21  246  		__MAP(x,__SC_TEST,_=
_VA_ARGS__);				\
2cf0966683430b64 Al Viro             2013-01-21  247  		__PROTECT(x, ret,__=
MAP(x,__SC_ARGS,__VA_ARGS__));	\
2cf0966683430b64 Al Viro             2013-01-21  248  		return ret;						\
1a94bc34768e463a Heiko Carstens      2009-01-14  249  	}								\
bee20031772af3de Arnd Bergmann       2018-06-19  250  	__diag_pop();							\
e145242ea0df6b7d Dominik Brodowski   2018-04-09  251  	static inline long _=
_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
1bd21c6c21e84899 Dominik Brodowski   2018-04-05  252  #endif /* __SYSCALL_D=
EFINEx */
1a94bc34768e463a Heiko Carstens      2009-01-14  253  =


:::::: The code at line 238 was first introduced by commit
:::::: 83460ec8dcac14142e7860a01fa59c267ac4657c syscalls.h: use gcc alias i=
nstead of assembler aliases for syscalls

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5832597725166850666==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5832597725166850666==--

