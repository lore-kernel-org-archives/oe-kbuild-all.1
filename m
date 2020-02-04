Content-Type: multipart/mixed; boundary="===============8122304279454690844=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [block:io_uring-5.6 3/11] include/linux/percpu-defs.h:50:34: error: 'PER_CPU_BASE_SECTION' undeclared here (not in a function); did you mean 'PER_CPU_FIRST_SECTION'?
Date: Tue, 04 Feb 2020 17:32:34 +0800
Message-ID: <202002041720.4cxskdsp%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8122304279454690844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it io_uring-5.6
head:   096b4ced7cec1358a43018d5cf171c093a1d1166
commit: 230665a4f25c34d22ba557ab0ad3398531f73113 [3/11] eventfd: track even=
tfd_signal() recursion depth
config: powerpc-defconfig (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 230665a4f25c34d22ba557ab0ad3398531f73113
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/eventfd.h:15:0,
                    from drivers//vhost/vhost.c:13:
>> include/linux/percpu-defs.h:50:34: error: 'PER_CPU_BASE_SECTION' undecla=
red here (not in a function); did you mean 'PER_CPU_FIRST_SECTION'?
     __percpu __attribute__((section(PER_CPU_BASE_SECTION sec))) \
                                     ^
>> include/linux/percpu-defs.h:101:9: note: in expansion of macro '__PCPU_A=
TTRS'
     extern __PCPU_ATTRS(sec) __typeof__(type) name
            ^~~~~~~~~~~~
   include/linux/percpu-defs.h:112:2: note: in expansion of macro 'DECLARE_=
PER_CPU_SECTION'
     DECLARE_PER_CPU_SECTION(type, name, "")
     ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/eventfd.h:44:1: note: in expansion of macro 'DECLARE_PER_C=
PU'
    DECLARE_PER_CPU(int, eventfd_wake_count);
    ^~~~~~~~~~~~~~~
>> include/linux/percpu-defs.h:112:38: error: expected ')' before string co=
nstant
     DECLARE_PER_CPU_SECTION(type, name, "")
                                         ^
   include/linux/percpu-defs.h:50:55: note: in definition of macro '__PCPU_=
ATTRS'
     __percpu __attribute__((section(PER_CPU_BASE_SECTION sec))) \
                                                          ^~~
   include/linux/percpu-defs.h:112:2: note: in expansion of macro 'DECLARE_=
PER_CPU_SECTION'
     DECLARE_PER_CPU_SECTION(type, name, "")
     ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/eventfd.h:44:1: note: in expansion of macro 'DECLARE_PER_C=
PU'
    DECLARE_PER_CPU(int, eventfd_wake_count);
    ^~~~~~~~~~~~~~~
>> include/linux/percpu-defs.h:50:59: error: expected identifier or '(' bef=
ore ')' token
     __percpu __attribute__((section(PER_CPU_BASE_SECTION sec))) \
                                                              ^
>> include/linux/percpu-defs.h:101:9: note: in expansion of macro '__PCPU_A=
TTRS'
     extern __PCPU_ATTRS(sec) __typeof__(type) name
            ^~~~~~~~~~~~
   include/linux/percpu-defs.h:112:2: note: in expansion of macro 'DECLARE_=
PER_CPU_SECTION'
     DECLARE_PER_CPU_SECTION(type, name, "")
     ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/eventfd.h:44:1: note: in expansion of macro 'DECLARE_PER_C=
PU'
    DECLARE_PER_CPU(int, eventfd_wake_count);
    ^~~~~~~~~~~~~~~
   include/linux/eventfd.h: In function 'eventfd_signal_count':
   include/linux/eventfd.h:48:23: error: 'eventfd_wake_count' undeclared (f=
irst use in this function); did you mean 'eventfd_signal_count'?
     return this_cpu_read(eventfd_wake_count);
                          ^
   include/linux/percpu-defs.h:319:9: note: in definition of macro '__pcpu_=
size_call_return'
     typeof(variable) pscr_ret__;     \
            ^~~~~~~~
>> include/linux/eventfd.h:48:9: note: in expansion of macro 'this_cpu_read'
     return this_cpu_read(eventfd_wake_count);
            ^~~~~~~~~~~~~
   include/linux/eventfd.h:48:23: note: each undeclared identifier is repor=
ted only once for each function it appears in
     return this_cpu_read(eventfd_wake_count);
                          ^
   include/linux/percpu-defs.h:319:9: note: in definition of macro '__pcpu_=
size_call_return'
     typeof(variable) pscr_ret__;     \
            ^~~~~~~~
>> include/linux/eventfd.h:48:9: note: in expansion of macro 'this_cpu_read'
     return this_cpu_read(eventfd_wake_count);
            ^~~~~~~~~~~~~
>> include/linux/percpu-defs.h:508:53: error: implicit declaration of funct=
ion 'this_cpu_read_1'; did you mean 'this_cpu_read'? [-Werror=3Dimplicit-fu=
nction-declaration]
    #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_, pcp)
                                                        ^
   include/linux/percpu-defs.h:322:23: note: in definition of macro '__pcpu=
_size_call_return'
     case 1: pscr_ret__ =3D stem##1(variable); break;   \
                          ^~~~
>> include/linux/eventfd.h:48:9: note: in expansion of macro 'this_cpu_read'
     return this_cpu_read(eventfd_wake_count);
            ^~~~~~~~~~~~~
>> include/linux/percpu-defs.h:508:53: error: implicit declaration of funct=
ion 'this_cpu_read_2'; did you mean 'this_cpu_read'? [-Werror=3Dimplicit-fu=
nction-declaration]
    #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_, pcp)
                                                        ^
   include/linux/percpu-defs.h:323:23: note: in definition of macro '__pcpu=
_size_call_return'
     case 2: pscr_ret__ =3D stem##2(variable); break;   \
                          ^~~~
>> include/linux/eventfd.h:48:9: note: in expansion of macro 'this_cpu_read'
     return this_cpu_read(eventfd_wake_count);
            ^~~~~~~~~~~~~
>> include/linux/percpu-defs.h:508:53: error: implicit declaration of funct=
ion 'this_cpu_read_4'; did you mean 'this_cpu_read'? [-Werror=3Dimplicit-fu=
nction-declaration]
    #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_, pcp)
                                                        ^
   include/linux/percpu-defs.h:324:23: note: in definition of macro '__pcpu=
_size_call_return'
     case 4: pscr_ret__ =3D stem##4(variable); break;   \
                          ^~~~
>> include/linux/eventfd.h:48:9: note: in expansion of macro 'this_cpu_read'
     return this_cpu_read(eventfd_wake_count);
            ^~~~~~~~~~~~~
>> include/linux/percpu-defs.h:508:53: error: implicit declaration of funct=
ion 'this_cpu_read_8'; did you mean 'this_cpu_read'? [-Werror=3Dimplicit-fu=
nction-declaration]
    #define this_cpu_read(pcp)  __pcpu_size_call_return(this_cpu_read_, pcp)
                                                        ^
   include/linux/percpu-defs.h:325:23: note: in definition of macro '__pcpu=
_size_call_return'
     case 8: pscr_ret__ =3D stem##8(variable); break;   \
                          ^~~~
>> include/linux/eventfd.h:48:9: note: in expansion of macro 'this_cpu_read'
     return this_cpu_read(eventfd_wake_count);
            ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +50 include/linux/percpu-defs.h

62fde54123fb64 Tejun Heo          2014-06-17   38  =

5028eaa97dd1da David Howells      2009-04-21   39  /*
5028eaa97dd1da David Howells      2009-04-21   40   * Base implementations =
of per-CPU variable declarations and definitions, where
5028eaa97dd1da David Howells      2009-04-21   41   * the section in which =
the variable is to be placed is provided by the
7c756e6e19e71f Tejun Heo          2009-06-24   42   * 'sec' argument.  This=
 may be used to affect the parameters governing the
5028eaa97dd1da David Howells      2009-04-21   43   * variable's storage.
5028eaa97dd1da David Howells      2009-04-21   44   *
5028eaa97dd1da David Howells      2009-04-21   45   * NOTE!  The sections f=
or the DECLARE and for the DEFINE must match, lest
5028eaa97dd1da David Howells      2009-04-21   46   * linkage errors occur =
due the compiler generating the wrong code to access
5028eaa97dd1da David Howells      2009-04-21   47   * that section.
5028eaa97dd1da David Howells      2009-04-21   48   */
7c756e6e19e71f Tejun Heo          2009-06-24   49  #define __PCPU_ATTRS(sec=
)						\
e0fdb0e050eae3 Rusty Russell      2009-10-29  @50  	__percpu __attribute__(=
(section(PER_CPU_BASE_SECTION sec)))	\
7c756e6e19e71f Tejun Heo          2009-06-24   51  	PER_CPU_ATTRIBUTES
7c756e6e19e71f Tejun Heo          2009-06-24   52  =

7c756e6e19e71f Tejun Heo          2009-06-24   53  #define __PCPU_DUMMY_ATT=
RS						\
7c756e6e19e71f Tejun Heo          2009-06-24   54  	__attribute__((section(=
".discard"), unused))
7c756e6e19e71f Tejun Heo          2009-06-24   55  =

7c756e6e19e71f Tejun Heo          2009-06-24   56  /*
7c756e6e19e71f Tejun Heo          2009-06-24   57   * s390 and alpha module=
s require percpu variables to be defined as
7c756e6e19e71f Tejun Heo          2009-06-24   58   * weak to force the com=
piler to generate GOT based external
7c756e6e19e71f Tejun Heo          2009-06-24   59   * references for them. =
 This is necessary because percpu sections
7c756e6e19e71f Tejun Heo          2009-06-24   60   * will be located outsi=
de of the usually addressable area.
7c756e6e19e71f Tejun Heo          2009-06-24   61   *
7c756e6e19e71f Tejun Heo          2009-06-24   62   * This definition puts =
the following two extra restrictions when
7c756e6e19e71f Tejun Heo          2009-06-24   63   * defining percpu varia=
bles.
7c756e6e19e71f Tejun Heo          2009-06-24   64   *
7c756e6e19e71f Tejun Heo          2009-06-24   65   * 1. The symbol must be=
 globally unique, even the static ones.
7c756e6e19e71f Tejun Heo          2009-06-24   66   * 2. Static percpu vari=
ables cannot be defined inside a function.
7c756e6e19e71f Tejun Heo          2009-06-24   67   *
7c756e6e19e71f Tejun Heo          2009-06-24   68   * Archs which need weak=
 percpu definitions should define
7c756e6e19e71f Tejun Heo          2009-06-24   69   * ARCH_NEEDS_WEAK_PER_C=
PU in asm/percpu.h when necessary.
7c756e6e19e71f Tejun Heo          2009-06-24   70   *
7c756e6e19e71f Tejun Heo          2009-06-24   71   * To ensure that the ge=
neric code observes the above two
7c756e6e19e71f Tejun Heo          2009-06-24   72   * restrictions, if CONF=
IG_DEBUG_FORCE_WEAK_PER_CPU is set weak
7c756e6e19e71f Tejun Heo          2009-06-24   73   * definition is used fo=
r all cases.
7c756e6e19e71f Tejun Heo          2009-06-24   74   */
7c756e6e19e71f Tejun Heo          2009-06-24   75  #if defined(ARCH_NEEDS_W=
EAK_PER_CPU) || defined(CONFIG_DEBUG_FORCE_WEAK_PER_CPU)
7c756e6e19e71f Tejun Heo          2009-06-24   76  /*
7c756e6e19e71f Tejun Heo          2009-06-24   77   * __pcpu_scope_* dummy =
variable is used to enforce scope.  It
7c756e6e19e71f Tejun Heo          2009-06-24   78   * receives the static m=
odifier when it's used in front of
7c756e6e19e71f Tejun Heo          2009-06-24   79   * DEFINE_PER_CPU() and =
will trigger build failure if
7c756e6e19e71f Tejun Heo          2009-06-24   80   * DECLARE_PER_CPU() is =
used for the same variable.
7c756e6e19e71f Tejun Heo          2009-06-24   81   *
7c756e6e19e71f Tejun Heo          2009-06-24   82   * __pcpu_unique_* dummy=
 variable is used to enforce symbol uniqueness
7c756e6e19e71f Tejun Heo          2009-06-24   83   * such that hidden weak=
 symbol collision, which will cause unrelated
7c756e6e19e71f Tejun Heo          2009-06-24   84   * variables to share th=
e same address, can be detected during build.
7c756e6e19e71f Tejun Heo          2009-06-24   85   */
7c756e6e19e71f Tejun Heo          2009-06-24   86  #define DECLARE_PER_CPU_=
SECTION(type, name, sec)			\
7c756e6e19e71f Tejun Heo          2009-06-24   87  	extern __PCPU_DUMMY_ATT=
RS char __pcpu_scope_##name;		\
dd17c8f72993f9 Rusty Russell      2009-10-29   88  	extern __PCPU_ATTRS(sec=
) __typeof__(type) name
7c756e6e19e71f Tejun Heo          2009-06-24   89  =

7c756e6e19e71f Tejun Heo          2009-06-24   90  #define DEFINE_PER_CPU_S=
ECTION(type, name, sec)				\
7c756e6e19e71f Tejun Heo          2009-06-24   91  	__PCPU_DUMMY_ATTRS char=
 __pcpu_scope_##name;			\
0f5e4816dbf38c Tejun Heo          2009-10-29   92  	extern __PCPU_DUMMY_ATT=
RS char __pcpu_unique_##name;		\
7c756e6e19e71f Tejun Heo          2009-06-24   93  	__PCPU_DUMMY_ATTRS char=
 __pcpu_unique_##name;			\
b1a0fbfdde65df Tejun Heo          2013-12-04   94  	extern __PCPU_ATTRS(sec=
) __typeof__(type) name;			\
69a60bc75fe735 Alexander Pateenok 2018-10-30   95  	__PCPU_ATTRS(sec) __wea=
k __typeof__(type) name
7c756e6e19e71f Tejun Heo          2009-06-24   96  #else
7c756e6e19e71f Tejun Heo          2009-06-24   97  /*
7c756e6e19e71f Tejun Heo          2009-06-24   98   * Normal declaration an=
d definition macros.
7c756e6e19e71f Tejun Heo          2009-06-24   99   */
7c756e6e19e71f Tejun Heo          2009-06-24  100  #define DECLARE_PER_CPU_=
SECTION(type, name, sec)			\
dd17c8f72993f9 Rusty Russell      2009-10-29 @101  	extern __PCPU_ATTRS(sec=
) __typeof__(type) name
7c756e6e19e71f Tejun Heo          2009-06-24  102  =

7c756e6e19e71f Tejun Heo          2009-06-24  103  #define DEFINE_PER_CPU_S=
ECTION(type, name, sec)				\
69a60bc75fe735 Alexander Pateenok 2018-10-30  104  	__PCPU_ATTRS(sec) __typ=
eof__(type) name
7c756e6e19e71f Tejun Heo          2009-06-24  105  #endif
5028eaa97dd1da David Howells      2009-04-21  106  =

5028eaa97dd1da David Howells      2009-04-21  107  /*
5028eaa97dd1da David Howells      2009-04-21  108   * Variant on the per-CP=
U variable declaration/definition theme used for
5028eaa97dd1da David Howells      2009-04-21  109   * ordinary per-CPU vari=
ables.
5028eaa97dd1da David Howells      2009-04-21  110   */
5028eaa97dd1da David Howells      2009-04-21  111  #define DECLARE_PER_CPU(=
type, name)					\
5028eaa97dd1da David Howells      2009-04-21 @112  	DECLARE_PER_CPU_SECTION=
(type, name, "")
5028eaa97dd1da David Howells      2009-04-21  113  =


:::::: The code at line 50 was first introduced by commit
:::::: e0fdb0e050eae331046385643618f12452aa7e73 percpu: add __percpu for sp=
arse.

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Tejun Heo <tj@kernel.org>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============8122304279454690844==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICHAtOV4AAy5jb25maWcAlFxbc9y4sX7fXzHlfUkqtRvZlmX7nNIDSIIc7JAEDYAzGr+wZHns
qFaWHF2S9b8/3QAvDRAc+aSSzU53E9dG99eNhn795dcVe3q8+3b5eH11eXPzY/X1cHu4v3w8fF59
ub45/O8qk6tamhXPhPkdhMvr26e//vn97r+H++9Xqze/v/n9ZLU53N8eblbp3e2X669P8PH13e0v
v/4C//0ViN++Qzv3/7Pqvzk7/e0G2/jt69XV6m9Fmv599RZbAelU1rkoujTthO6Ac/5jIMGPbsuV
FrI+f3vy5uRklC1ZXYysE9LEmumO6aorpJFTQ4Qh6lLUfMbaMVV3FdsnvGtrUQsjWCk+8mwSFOpD
t5NqM1GSVpSZERXvDEtK3mmpzMQ1a8VZBv3lEv4BIho/tatT2MW+WT0cHp++TyuA3Xa83nZMFV0p
KmHOX7/CxexHKqtGQDeGa7O6fljd3j1iC8PXpUxZOSzJixcxcsdauip2/J1mpSHya7bl3Yarmpdd
8VE0kzjlXHyc6L7wONxRMjLWjOesLU23ltrUrOLnL/52e3d7+Ps4Cr1jpGe911vRpDMC/n9qyone
SC0uuupDy1sep84+SZXUuqt4JdW+Y8awdE1n0WpeioROYWSxFg5HZHJ2nZhK104CO2RlOew9qNHq
4enTw4+Hx8O3ae8LXnMlUqtlei135BAEnK7kW17G+ZUoFDOoAGTXVAYsDUvaKa55Hag0zwrecSlA
sM5KrnxuJism6hitWwuucJb7+VAqLVBykRFtNpcq5Vl/bERdkN1umNK8b3FcfjrvjCdtkWt/mw63
n1d3X4IFD0dkj+922qOAncLx2cB610ZPTLu3aDSMSDddoiTLUqbN0a+PilVSd22TMcMHLTHX3w73
DzFFsX3KmoMqkKZq2a0/ooWo7N6PiwTEBvqQmUgjmuq+ErDt9BtHzduyXPqEaJco1qhWdh2Vts30
6z6bwngcFedVY6Cp2ut3oG9l2daGqX301PVSlOc8TtP+01w+/Ll6hH5XlzCGh8fLx4fV5dXV3dPt
4/Xt12kNt0KZDj7oWJpK6Mtp29iFXWKfHVmJSCNdDYdv600qJgX7Hp1aojOYnkw5GCQQj9kW9CLa
MKqNSIIDULK9/cibCLIuwqampdQiemJ+YilH6wkzE1qWg9GxW6HSdqUjmgs71wGPjhB+dvwCVDQ2
We2E6ec+Cb+G1SjLSfMJp+ZgTjQv0qQU2lDV9Afou8NE1K+IpxEb9y9zit0qOhexWYPlglMQdc7Y
fg4GXOTm/OU7Ssc1rNgF5b+ezoqozQZ8dM7DNl67xdZX/zp8fgKotfpyuHx8uj88WHI/0wjXs2K6
bRpALbqr24p1CQNclXq2t4dHMIqXr94Re7Mg7tNHP89rBEjE86SFkm1DtLhh4IbsCaEuCNxy6h1N
S7DoILLIjrmB/6OfJOWm7y7yiWN0Ol3T0eVMqM7nTCgsB1sOrnInMrOOHis48OTbqEjfbSMyfYyv
sootDzqHA/HRrlb43botuCmT2KcNABpqPVCJcRw9J9wh2MGtSPmMDNK9sQlmxFU+IyZNHhmk9dmx
Uy/TzSjDDCPKBUgRsADYx4nWou6S34gKax0gOAWkSE84bfptzU3wLWxgumkkaD86OSMVj26X3WgL
rmd6NsnsNWhOxsF/peDos8h4FBpxAs9LtOtbGxYoitrwN6ugNS1bwEwEvKsswOxASIDwyqOUHyvm
ESiat3wZ/D71DIJswNtDcISQze64VBUceM/vhWIa/mUJK4PVzTBUSmXG7ZZ3HKOfOkCyIXJ3v8F9
pLxBSfAQjKqqbbtJdbOBUYKHwmGS1fWVctEJVWC/BOoQ6RhOV4WudQYb3SbPyLnD1mFEMmImz9iH
v7u6EjRmI9aWlzksmqINL06XAYJGTEdG1Rp+EfyEM0Gab6Q3OVHUrMyJJtoJUILFupSg184aDz5H
EM0SsmuV5z1YthWaD+tHVgYaSZhSgu7CBkX2lXdeB1rHouB1ZNvVwOPWw7VJJ8jmTR4EyH9AaM7K
HdtrAN/RA446Yr1dHjvbY8wwTaXDfhKWbshEIc7xghwQ5lkWtRZOvaHPboxPrOfv0zLN4f7L3f23
y9urw4r/53AL+I0BJkgRwQEun2CZ38SIHH6ymRENV66NwYeTOemyTZy19wyErBpmICzaxM1lyWL+
C9uiLbMEFlQBdOiRBu3BctFJIvzrFBxBWS32NQliwAyBWdxx63Wb5yV3cAW2T4Itl2phoBbZQeyK
uSTP4+ai9PTeGi7rZrwt8NNE4/dNenY6bHZzf3d1eHi4u4c46/v3u/tHsq/gCRMpN691Z+Un2D8w
ODAiQx/D0saD6ilHnN208VBC7rh6c5x9dpz99jj73XH2+5A9WwWyA0DLGxJHsBLtAEH9W00Moz26
DsF2uinBEDQVBGoGg3u/UcUyTDRV7QKZaClhu7xayxufPKf0gmwmyJpwf5G2iLDohBAqWmWOpI6w
oaoCVRYe5BqH0sCM+gDC51qTkhpqBGx2p9MVzerRH7WyCPT81cnpO9pUJqVKeG+P+3MxV/px3zIt
XxOwgwcwQTNaZ4J5iRHkwFYaWALHjKzT2WkiyMy8fbVrWFWwyqrGoBFgKMRw56/eHxMQ9fnL07jA
YA6HhqYQ8IgctPfWcweA4B0IdykHxSl6xnB4YFm/0uVCgcFL12298XYC84Xnb16+GkmVAGAt/E3e
MZOuM0nzdAacmbVlc7VwZGg4L1mh53w8TACO54zBGq13XBRrX9H8AQ1utZa6oYeZM1Xu5+CK1X36
T7YYkU+XCHaFPUxnc80zugX9sgJ7kAMch+OABpwiFLdzbD8g0S7PgiG3WVJ0L8/evDmZT9gkel8T
eZtMtm3OZX1U2LBGodEzwVDWIuHKoWpEoFokFJP2+QBYO1CzZ9i1rCHylL2LoMc1VaCrFOX1VJ8g
8xGiwrqIWS99UsIaMOtrratdEmvBpSahhcrYjnZauCsamzvX56dUEpPScJ6q0K5eiDRoU6TNlOIL
6OttSNOdMkyHbYbfIiXaqGVo3MvR2d9cPiIYi/t66wbrLTVysmElKH4cytip88oezAXHuWUeutZw
BGKpdjoIAMEi3ApwmoCCJlrmXdm4LzrU5GJPjxerS7Au30i44BCmd7OALad5EXRY+R2mFYlB1tuY
fxJJtfWCk6SCiYYT2VY+oalYOqecnfo00Kwy2NwGAhAb1rmNZSt9+Ha9anbqy/XVNaDs1d13vE51
ubzZd2DLK7m0A05CSOeuYl9bXpdVzHnl4w1VmV2Wyfkuj9VXhNfj7PTrSXVlZF76NUZ+mEGIxTnI
XsPptSkEwAf+h9m+ZhVYwHimDCW2LfPwCZDgf2zrk8DKwz7VYGpUwAB8D9RJD22vQm98ipKVTwA/
p9c+qWxQhg6/gJDDeYFoIj66cnSVU04D9IEyy4aPjKjxSirHTEqWUYN/AW4CbOOwjenh5maV3N9d
fv6EVwL89uv17YHo6XBuAV3kepo4/sZwm5zGBGLv0DCOo8A7SpO0xoQTGCWsoeslvtFGzZorugv2
OApfBjwWRHof7LAKuQWLKZXdlOHu4+gsh5akC+L4sAFTAgLi4KINLuinaN56ZjBNDK+FFs5dbI/A
X6I/RxRVNdIvYLDOzt0x5Z5Js+ACXRDoQ61laIIAfndVewEYxoN2VSO8Ww38DWpQxIJcuy3vXr15
TzqFw8HCeMD3g3ZIXCmp8Eqj8CLhQRoa4f6FDhL7GxdKCo4ZYo+u3sIy+TPCca2NA7Y+I1Fyw2tQ
uwLvnQmK4mt/WO/fnsDeBBiheTunCYgnFE8hTAxx0MiZQyQYNhaXMCXbOhtzORjT5veHfz8dbq9+
rB6uLm+8e0y754oTdzhQULexmkF1flKfsue3xSMbrxjjFxODxHCzgw2RFPD/4yM8xRqA8c9/ghk2
m/+PX2zMP5B1xmFYWXSOVBAPCFdbe/J+fjw2AmiNiKUavZX2c+RRiWE1Fvjj1Bf4ZKbxrZ7mF12M
xemMavglVMPV5/vr/3iZxLE1MLTU0VE6WuTjK2zR0rEVjUGsHqz01p3wHCgmDHrLHTlbw3zF55tD
P8Oxpg0+QLI/4bB6YqDZJQWPmvGY5fSkKl63i00YLmf7YWfVpOOIVlm4FQOqxpkENw/jgowjH9DG
Yqt0ydwKEApdKa86Bwx0Goc1YRxD89YzQLH+2L08OaHrA5RXb06iWgSs1yeLLGjnJLIZ64/nL6fa
QhfXrxVWgZCowV2pusQvIlEIjpRgSehVwUPXmqUYY0Ps5V1+rKVpyrbwg2Ybydo8McaweCfBPbBE
c3V9kVrfznMyCv4twBFnp1PQ3AvmTJQtvUHa8AuaPLE/O8Q6YTIBnK9jNq0qMAtOgjeYBmbG++WZ
bsYn8lIVYwrIcN1lbeWlNHNmSUsFQWjb+FEhGwmnwf3tEOqpDx1zuW16GdzSS9JaZnCaXOXFmJ8E
o4ymHXfP1j2gEBxcsuOY93ELXWJRj20lzGLAjiMicNtRgUQZStjyNxDo93iRPcsuY1AzbnivwTkN
esuSF5gicJkrUOmy5ecnf735fAD8ezh8OXH/8frrR2r1dbZADas7iTh8nKsXgJ5u7AFayh6cDfzQ
uOOZc1UvZwOjL6/tyWNChxt+YWbC9lI5JLqUNFbefJQ1lwos9fl7f7y6TWznMNkluJ5iLBBEOM6E
6CqAwRmvEQWUQg+J9snkVxmiekT5UTTh2OSmH2apWGeYKrCcY6LbLdoxrDjs60PQ+Rsl6UWuy+LN
CLGKEpIzjC0A3g5w756ip/jZfUoNkofTele2gsLKxQ96BRPboAnZRBWoClqbXX+MzN0H5wc7nuci
FZhU6s9OPGyzqSl3NmNXfTzF3HCQ84HzuOH72JVqGEyCOthkDGvGWDt5epg7wrHg1cl79lGXXZnE
vS1tazqtNUJ8aMxVaZOxo7rLPMew4eSvqxP/P5NXsLXd0IY6Jtas91qkbBIMBay2upvZwGpiIA2G
OV3PK9AdJw/t7Ga4gqYcJG5zGmwhJUzl03a7ZA9gUkeYW3ungkl5iNa8ShSM5lt8LxBcoG1ovhCb
6O9jZ6XWhAc++hgbs5ez3Lz3+RQMB61uKSb3eY2KKr7fL78QBi9M4uWwKOtnzB2FQpAt1vtjmdU0
RkuiA3Myrirf3cx16KTS/QwFD9fjl/dX/7p+PFxheeNvnw/fQe/9DKoHLfx6GYdgYjRe5oEOCDij
AToa8kDTfKzkSJ7aDK8o/gCkAuFBwr300Xgo0XHDCBZAkmxM2N7sDsQOZLJvLcBRUdRYppZigXEA
IhDKYP2rEXWX+I8vNorPenPrAauG15LoHMPjEv1gsaXIfGgzEN1iamte3JW3tUXafTZJ1H/wNHz9
gLcrtIBqep1hW1yDek/MwcSim7IRmEMZEegL4MGIfD+U4AXN6wq9Rf/qJpyV4oXu4Ii7+9J+P3rr
78lpGsla0nrXJTAgV5IY8EgdT2TGeIU7v7F1jTKVoVO1NZkGVhCW0r9mnNrHscfotsjSzafH7rPl
9jTem2fa9g+oEH8sMmt8RgUIVfTvJDyMXbUdxCCIO8cAbbZp/SrYWuq0ai7SdRhD7WBphxAM9uVD
K1TYDEIrW2Tq3qQM760iQv1N/U/JyjIj8rHV60EGRmLeHfMS3ZUD4Ibg8bSbSnJDrqjbZw/vMSZT
FP02+EgDtKxDjULEiTAcT9hGzNjx5xfhCcMyPG7rkvGS/vkm8PCGFgrcuX3gE+vIMwQ1RlFoJ4d6
mJgc8rqtd09MNkjmgCJhWPtQN2U2BGo8Fbkg2wusFgJDa32xlhMrEiNTsI4XrJx9AYbLH1kt+7kF
Up7qT+PzSlGCBnzeFExFvib1J0uNUJG3gV40+yFwM2VoSGwrNncPDoEw01JiZATz3oGlIgw8NVoU
s3CmH0DPZoFL6LmvXyUOzsQSGwhcOyNDmI1WkpY5xsIQWugJACZV+8YMsL5I5fa3T5cPh8+rP10s
8P3+7st1n9Sfcmcg1kPsYx1YseEiivklUsd6GtF52Rb4jg/wVpqev/j6j3/4j0Dx9a2TIWvuE8mQ
BzKYeIMLxDHobOJvuIg06izYkDZ8ohSUQD6D8YbRgVGosIyZIglb66srXKCT4ODRGThSnxQoJYtd
RfcybY38xY8dOzpxAgqW+NiOVun4YtcvZJ5JiniE27NR1xWgi2MyWFqz6yoBQUVN3lgA3LV5o3it
cw0mC07XvkpkGRcxSlSD3AaLrhfXU7unXSUgsZaY1sSvr8TXEDrVAozkB7xg9Tn4TiLRRZRYioTu
1fSswvBCCRNX0UEKU0PxvbTvivq0jXXw8RgKxXZJDMW7LrDCKdfhAHHVMGc5T/1f3j9eo9KvzI/v
B5rxxzpjC4aHWgraJoMQp55k4u+ZxcUzElLnz7VRgcF9TsYwJeIyg16wdOITd6kzqT2G93QSizIs
voxru6hhfjahd2xw+JZRCd1dvDt7ZhottAcOiT/Tb5lVzzSki4XVmLoq4TQ9tzm6fW6DN0xVC5vT
S/BcxNcXiyDP3j3TPjkNManh9ifQYO+8z1IzeBiqD36RYE9DDEgzO0i2SUD3zl5Ojx/JMYHvhHT5
WXxz5JdSEOZmn/iJ0IGR5B/iz8y9/sZTOb51hmhReM8i3B+iAFQIXhBdBkzeq2zr+RYsOf4xXvTb
HZg3vvQxZfpf+9WVzEgssFIV+ZsE1sm6oYPBkbuahh5qpwH6LDBtbwu8CTpVQu7IO4/w95SntlvN
/zpcPT1efro52D9esrIPVh7Jpieizivjp3RGlDpnwQ8/I4S/bFw7PWgFuN2/9iUK6NrSqRKNmZHB
w6akFgmaHG+5ehVamoedZHX4dnf/Y1Vd3l5+PXyLJriOXiVN10QVq1sW40wkWytuX741NvLOZqmZ
8RYI/6SEiXWDNxScouuJtYV/YLQQ3mfNJOadOithb9rm/Jxp0xUURFiV2uDNw/At0So3Bfp8nTaG
BVc4FPsHXLDD2Zezi1if3k/Hw4m+wKBN0p7I+Ivmhdvc/iGKcUYTby5Pg48SBHZ0Vj3BaX4sKApo
kRch9KbZrJuYCMb+KOkXbNuAimWZ6kzkWcVoHknWURN1HNbJKg04ctvS+enJ+zNvYMt32+EG9JzY
H1g4mguIcftngbSXqFjlXjf+RJ82h5UycDe00bTkAOuQGnW+uYKFX3gYn/phLPw8cjk2cqNF3sjF
dyUY2o+ffGyCa8uJk7Rx9PzRRmQy9ldJhiSse7fRZ5np+EEduFIYf9jA0aX88FV0tCebx7UiQzrq
WFDdGHxLuA16xCigfwq/9DEEOtr9OZQtFlbjK5dYYmG8ExwOhqsfsH/TIx4r4wN6Xqfrii08lbQo
AEzI3h5JfGwd3TlvijYXxcJKA+Rafc2oW1r2PJO7MOehYwUaGDUAahB++lf6+MwedkF5txB6k6DH
4PWQMbdOrz48/vfu/k+sNpt5O7BXG+49+HQUwOMstsWI16f+WhsNpN6dsaWFX0+Huoyt6kVOX1nj
L7AHhZwcvSXZ9+PkkssSbc1FzhaKJq0IhCsd1vum8SDVyjgbfKwRvFTSRqRL48ecM15gf6M7BIpK
R9yTjveWNfavN/BoYkx4WiIahy/6v4g0ndZmjF87JQFmxqrnQKipG68x+N1l63RORDfeBD0gXTEV
M5VWORv/L5k5WoEYkFftxeJXnWnr2r/Qw2naacTqBvboi+VG+Iko19bWxMskkZvL+EPYnjeNZGkb
OkZKpi2B64bu9kDDSoDFZNYgBHqcxpZSuJn4qmWJVun6xfI54wpSIh7JgAQ9DmR/PG3WLB9hK6HY
7hkJ5MJW49VG/Nxh7/CvxbFnK6NM2iY05z9gmYF//uLq6dP11Qu/9Sp7E6T2RoXanvkKtj3rDwqC
8Tw+KxRyf44D7UCXHdnRM1COI0zY7yNct9vLY6hEc7bMFSVbZgYHgrK0MLMlAVp3pmIbY9l1BtGY
RfVm3/D/4+zZlhu3kX0/X6GnU0nVptaSbFk6VXmASFDCmDcTlETPC8vxKIlrZzwp25Ns/v50A7wA
YAOa3VTNTNTdBEFcGt2Nvkye1ssw8B29aqSuJumDWxNONr/TTb5btenp0vsUGUgAEUmSlc4GtDHq
wYm/pck1MPIAbxJdEcPgK2VdYtZNKUXy4HAr9TQI+OoyBQ6brKRlLCAdbinN5zWQ3EtdLtHXM0oC
oBO/n18n+UYnDU1kixHVCSXWSWejWivmMMf8KnmuBEcLqvJ26fgJ85DUCGgKZEVqBIzmVDCLbfi1
0MqiSDFwiyqpS7q3ragip2sjDjq4FYWksyJZlFI47dfGGBKT2I/iLj3wlsxgB43krLYahd+TD0GY
/gQb5nYIYRmT9wde6eg184unu3PS4UbTQJtqrTXK/PI2e/r65Zfnl/On2ZevaNF7o9ZZg2+u7txH
3x9ffzu/+57QHpvOKjMJ9OAQQzs+nGP6IY/wMiVO9LuCLYIypQKTvrNNY8Dpj+jogPlkcjK2Xx7f
n34PDGmNmVNBwVecmW5fE1Fbc0ql5ecgCUrI3IoCDLEcS7qT3KN1lu1RTliZKP/vOzhZgkJCxRTv
v3Y2sZavFYbm5rDqgbM0D0GSGJRKF2/zMJCOJwyv684IrDg6XDlw+HJAiXLYWBa8OwEc6LAMsT0X
6ewI64lxJdJqAlBmLN+lfNoCyIG0IT8wR90k/rkKTSM9XbTcY02Xl6SbrhU9XeMsrKgpW5njufLN
zUoPFe4GfEbbticE09lbBadv5ZuAVXgGQgNMbpOV96zbViLe0RKYRiE53wYEuW2pP9u3z+PII30h
e4hqGld5Mj+CWEkLeaymk1eli5o6CqR5nuoPdX+3YpdBD/OiKKeOUUoPksxVTAFE9uKYsrxdXy3m
9yQ65lHOyaTlqSWlwM+F7844pa1fzeKGHhdW0mm7y32Re5j2Ki1OJaMvNwXnHD/whmSavB4yhSoO
cP/t/O38/PLbP7s7QcfDp6Nvoy09Xj1+X9PfMOATSa+WnqCsRBEkUJpMuBOVxwGix8sk3Enp3pg6
+Jrf06rPQLCl1dpxFOm91OPhwA+3zy4O0+7SIMTSa5/tSeBfTu/hoZGKZjLDZN1f7Ki8216kifbF
Hc0Re4r7C1MWuaEwE4rk/juIInahHxe6sd+HJ7YU4eY7TTHcRuq5JxlXV7gBIrJIs4LPj29vz78+
P00VWdC0JyZBAKErm/Dvd6SoI5HHvAnSKJOERzTsSJJTEH1Y0lx6eIM80qeeSeCRdvoeACsOEnhT
Og+DVSauAbtv2HOW9yRKDPI53imjp6IIvJvZediVyRUvqlAV8S9JJEF31SBBJqoQL0ISyTInhH5C
IsrwW3JP/ofhS3jsuW4bOiE8hsCB4G57sZFIHvwcU41G6XE/7AlQMPFMFKKJRdL1LSvCgyyS8Ahr
kx7emYS/0D8AddTfivklDpDIk8K6G42otKlxLjGxToGFYCy3OZAqmfIYJHtRlDw/ypNwFvso9RG3
PeYnKFOQ19YenLtc0q/cy8ARqXrqmN4sinSJGiPq/iGqPJKUrbkyndKrRNVoMO8qmtLOHa5TmCvj
qe9ENmi0cZUyWKtLCywPIB9aOyPz9t78obMUW9OL+YzrirOM8FA1Wkee2BUcsi9eZ+/nt3dCdi3v
aqeIhakjVEXZZkUudNzIoNZN2nQQ5i2vMeEsw/ypnvHzCOtbelcx0DmbyqdgJe1dlBHfdBIYEmQa
lHsI7k0DiiEvtuOYArl1IqJkh4rEfCoR9IiX8/nT2+z96+yXM4wRWs0+oTPYLGORIjDcGTsImrDw
+n6v4tlV+JORKO0kAEqrocmdCBx0G5qFR0zQglfEy33rq5eUJ/TAlxfOKx+npa5Nen6HIaSdA00H
2mHEObeyiqvFyo/Kmj36FjKRYl6wUVvm9b4uinQwfNuKMh/3nZrE+Pzn8xORkaXLAWq4sepoAQvk
/ugKJUkbSKQoBzBH3ydgEsRwIJbJMrOaURAqb/aAC6dossnQ+eq7iC/kikLCtqypfYifrvPR2QCy
ohTiMH7vTjqfFvB8UmNbHzxmgwgTJ9KHBuKAx/txjObsvR+gnvaR5Y3gNoK/6IPQIJJ7D08zibrM
P+FuwCHHjGBmG9HGKq1mZ87Hjj19fXl//foZ68uM2aCsT09q+HvuScmDBCrcu3P58q+IBjOmNxOO
GZ/fnn97OT2+nlV3lNleDslR7Sbik8o5q17o7U0GQhLtth56lX7X46czZskH7NkYmDcjW6vdoYjF
PEcOQPeqv4q42OzgWE9PyDBZ/OXTH1+fX9yOYJS9iicmX289ODT19tfz+9Pv3zH98tRJZTX35IIK
tjbu5oiZJVDKKIsEc3+rsK02EmbsIDym07h2ff/p6fH10+yX1+dPv52t3j7wvKZtm2W8ul1saKPg
enG1WRBbSnliVwzOenNjV6wUjigzZjJ4fuoODSpH6kFHHe55WpJSHBxjdVaauX16CEhiB8tBu2Z5
zFIr1resdPOJqDIV0qJKYfWDljy/fvkL1/3nr7AWX8cjLTmpETfddnVamr4dzEszfMJArYPFp59C
UFLxayPR6CLbLSa3pz2tDnHDcC7L7X4YKYzBiitx9PSnI+DHynNDoAnQw6JrptXu2iSxItNpRDpi
leWA+ESjEINKjeOkXDLRx0MKP9gW2GRt5V+u+M7yk9e/W7GIzIHzLMAhF80nJdRYKxL1e3SszVpH
5rASz/QPGiJiATJb5BTNGLC73BesWFMHaFybyTisvVYk6M9Z+zJoJOiiW9dWwgEAap9jEnVXbD9Y
gC71sAXDe2tLVQCYFVsDv3PTDxJ+dxmWR0CX0CxunUpmgELJNGUPxBfpGGxMkT+km4fDusulP/Iy
DSKe7wIeLfWxi4HMDyo7MOUa1JOYOXeiuComFdiQCE89KeGzalEuFw2tkfTEh4xTQmCPTovCihUd
oSpAQIVn/7yeNqvisQukC749rrbUehtGZBubZqMeLO/8oaIK36wDjVpJaw1g9zFj4jITp1S91c3N
cmVsMZwA1NGj+Eh3CNOh4VJC3YbokY6sw/dYmXkGqArEDX6pM3xTvGym0lx+zDglvg2jjnhSSwRE
62qXvXHBbFRHUj2/PVEcjcU3i5umBWGIlg/h3MgecDfTosA2O2YeCXbP8tpTe6gWSTZJTDg2GsnN
ciGvr+YkGsTHtJCHCgt/VEes0kJrAcDvU9qAwspYbtZXC+YxxQmZLjZXV8sAckHL9pLnsqhkWwPR
jSdbZ0+z3c9vb8MkqqObK5pn7LNotbyh7yRiOV+taZSEDeTVBHqp2O84qXWSVsaJK9v2zRxLLDJC
W0oWLh/WoYwcDvmMUhk0Bnbugr666fDTXFkuRcaa1fqWvjTvSDbLqKGvZzoCEdfterMvuaQnpCPj
HDS/a3JbOh9qDMz2dn412RG6KPL5349vM/Hy9v767YsqRfb2O0h7n2bvr48vb9jO7DNma/8EG/z5
D/xfsxTqf/H0dBmmQi5ReKI3E3qJMJSwy2ngvnh5P3+egbww+9/Z6/nz4zu8mZjmIxxgPoEq1IQh
QvH8dE+zEx7tqbIRUZO6KfoBwpJDL6Da6VgAp1MqjIDRZFBMGys0wSjKoes1SyMsHukxbiiSqpbN
d1AcJG2w2bMty1nL6BrH1iFg2eiE7UYq4ulCVMeffnhai0UlqcgKQyCqmIhVMnazLEJkWrLUM7GZ
cFZBJhZHBVUlW5NBp1Wd6Xoxe//7j/PsB1jC//rH7P3xj/M/ZlH8E2y0H41g6F4YMUW2faVhhvfW
QFdNpRJZtaAwxlZOqb4Ju8pfDyWvS9XnRCoXZV/6zsR01QFo3o0EWCNGq1L0FNX9zn5zpkeWgpoQ
kCE6sD3iQv1NPSCZHOBO3xhyiy384/twWZXD28aCzU6//8cekJMqYGStT4XxROAonKocoSqTOp2P
mt12qYkIzDWJ2ebNwkVs+cKBwI7vCzNMpLjlqW3gP7Ur/FO7Lz2eZgoLbWwajwLREzgjb+MZGoYC
aBaFu8dEdBvsABJsLhBsrkME2TH4Bdnx4Mmkr5vHaAqY9ABFFWWey1SF5/D6BY3PQMhQTC3nJ18x
+4EmIJEMNIFdkpX1EtDOMgToAneYuu3a8Z/nizX1VAi/0K06uzZjVV3eBwb2kMh9FFy4oCR5SkCr
Nz9U9HkFzMJzQaZ75pMku7OjWc4380C/En1D4j1QFdHOV9Ncs8HSO0uo/RBHGoKTyJk7DRyqNTvv
yDFzTKAPuWC+6wQ9TjWnIjQ17iG7WUZrYD4Ll48PGJWJWVtxMB8WZtH4+cpH28fyYbD3qJ87VLgG
FcXq2kdhlYPpxrqaQtwK1wPcNWkqxD2cnyJqYelTRQ86EtZO5geBPT93DuQytELjaLm5+XeA4eDn
bm5p9UVRnOLb+SbAEv1Xd1owyi5w7TJbX3lUaX24JcwxI5jYLt+QOyjRnqdSFPBg4asObxzd3VWF
7x3x3hUK920Vs2jyVoCDWi9pH7megmfejwEsSw/MDHqhpNrBulgbsilaj3QG8Ty2rmUQAfrCtsB8
lpiS1/gYxJVqlXZBfeNN1l/P779DJ19+kkkye3l8f/7zPHvG8tK/Pj4Z1VZUE2xvXpErUFZsMQNi
qq6iVayP4fowPDQUnKRVN6SI+JGWORT2vqg8jtLqHcCYovlq4Vm9qhcoc6i2qElRFQpEuri2hxOG
ZBD0YXSe3GF7+vb2/vXLTJW/M4bMuLwCkdYpjmd36176jPG6Tw3l8I6YbaY1Ft05gNA9VGSWnQ1X
ghAkl1bzaRmhFSin7931ogL1xsmr4nyBoB1cOiR5pinU8TTpyCH1nJ5q6YvAMB9FDUfKVJcsv3/g
SrWKUmr5aFRm5fzTsKr2SCMaXcNEBPHlenVLL2pFEGXx6jqEf/AnoFQEcITSq09hQZparmhT1IAP
dQ/xzYKWUEcC2ryp8KJeL+aX8IEOfMhEVNG1M9RaZ5EoJpMGQigcFfSqVQQ5r6Mwgcg/MI+XtiaQ
69vrOW0FVARFGrub1CEAQdfHWBQBsJ7F1SI0O8ic4D1+AvT88ykxmiD2mF7VBva4rWokXrFVGLse
aB5Yx2rt8V0huIeNrAu5F9vAANWVSFKPs34ZYigKeRL5tsin4fKlKH76+vL5b5epTDiJ2rpXXoVA
r8TwGtCrKDBAuEgC8z+RhRx86MjW8//RrellOVT8+vj58y+PT/+a/XP2+fzb49Pf06J12Ep3kz7Z
h1PVtVdc46lNzIRlsbqw1+n0LTAmejNLEwMIZdarCWQ+hVwZdS416PpmZcF0XgpW7y2oUlKsbD7b
SR4x52PirC8HMf3Q2LrcjYlCOyNqe0hskbkn79J9diV3VVpIn6kvxjzCEjZLSSZaAbROsv3FgMic
lXJf1M6r6z1qwFVxFJhmKvBCf541QKrMmUEKXtGrGltG1xv6MzC0o6icLmMUL1n40iRy1Z4Rg5WW
rJEhlogJBe3Pg5DuYMbc8USwkAfPrVmcTVK1GfOs/JCc5ZWkzBdFAVhg4r4czrgO/MEL3diqyfS4
9WQXkkR3cc/e69vkIJ0suPoqiHM+my8317MfkufX8wn+/EjdBSWi4uhqTrfdIUETk07v+uui0GsG
9gACSI4nVXfXYyati7egsVk1ujoQMEayUjfmmZH2Ewji2SErYA1va0oOgnMsBhnQ8H3oIaivz83G
DMQtLdsMFFW2nAdeBi1s5uQb5/MFDV9YXVHfigHmGadzlOkkMHgnbzByYeiuOXejBfA4x0jscf+h
x4G563DCdwef6ZrfqyJUgeg2j/lGBCJ4a+65JIcBcIOrxgZLL+rY+DB4Cnt85naeKHrog+SUjQMF
ZLfoNcDs8BkVyVKoeumqQp5Vc6s+WKl94Gd7VFOmKlN5whWOQX+anNupXdKMVAzkId/xDDMqWVuv
ckPotQf089v76/Mv3/AuWGo/WmbUSrD8cntP5u98pO8Px7o6ltOa8lizsgXq28B2GdmeX51f7jK6
8Zj9RoL1hhq4oqp5Y83DQ7kvyGEzusFiVtY8sjmXAqlKdIkgU7+aDYBMYtmmeT1fzn2Z//qHUhYp
yWBvmQ1SERWkB6v1aM2tPLsRz4Vhl9W/2yJTJUt2WAvG+jjteFCT2WXN12Tso/kaC2XXC8ji9Xw+
9/iHlbgUlwtzXrqJzLPIH3DZvwrYVF6b7tsmsopoOC7CwrojZnXqSxaR0kZeRNAbFzE+p45L034A
oc1KlKEhbb5dr8l6w8bD26pgsbNpttf0XtlGGbJI0nkzb4wbjchaO2q9LA3Gpn63+1NmJYeGFqyN
Bmp3zTPXSWnsTO4NSx0/LXJScm1zyvBtPNOFRJArIGJHcbAGqt4fcvQSx61R0gFpJsnxMsl2Ryu7
Jk3lodH9w0R5JDoV9wfX+X+CdPpIDIK+bDDdLvTtQz23Kq4P0HZOaWYDfmmsmh52TbZ0TXatR6ND
EHUgREJGln2LO9eYxCNYWS+3NhQch6AzDAcRLazTO8NoOLZPBCXcHFLhyyHQP9V54IwvShd0ng84
t2M3rm3aHgjDKTcSEW/5IjcLYurfk+2pofAPAVtOYCn2o5qA5d3Dnp3uyO3FP3a1VsepUpA2L2Wn
pme6rtOlcU4OH0QtD4QckGTHD/P1BX66K4qdXTZ8d7wwpvsDO3FBfpZYL26ahkZtDZ0DL6V5bTms
AAgzPVDLle85c0iPFxc26pKG9Ml1VXvjl/vT9kPb0TI6wMmdKZqdsSXxF3d+DmtsbAvBdGvXV3YG
L/jt4ae+DBdJNr+iN47Y0Ufvh+zCvHd2ckvfPGY+JivvPHnAYFtQMVzmi+AtLC+MdZSlzTXsBcPO
hgClz9kgZe1ynlP1ROAsX1g9T5sbvykBsPIURNs5W4hvEFFlu47dyfX6Zg7P0hcJd/Ljen09ccGk
Wy5c7gHjdXu9vLDX1ZOSZ/TezR4qA4G/5lc7axkmnKX5hXfkrO7eMLJ+DaJ1XrlerhcXxDZM5VRZ
ZS/kwrZzHpvdhcUL/1sVeZE5SUsvHEe5/SGibVRpif+APa+XmyuCN7PGd7LmfHHnvyXQT5ee/G5m
z48g4dhVyzEAPqZVDOPB4s76ZqAny0YYT3SFAHi+E7mdXH0PKhCsVPJTHjiGCSbigvpSMnvB6t9o
iiAXcclziXU5LT5bXDwstPOO+dB9ypY+l8P7NPK22PC81QrBSE6a78y3H9A/O7Ok7fuomJ6HA7bK
Li6AKra+p1pdXV/YZhVHzdaSvtbz5caTbhFRdUHz/mo9X1EGButlObo8kpNYYZ6bikRJlqHBxlL5
1el6cV1LbtZ3NhFYgy6BP7Z7nM/3KonaBKfrwrqVAliy7SS2WVyRVlLrKdsvW8iNz/tOyPnmwoTK
TEYE75FZtJlHG1qb56WIvB5/0N5m7rl/V8jrS6xcFhFsRyuRi4mt1RFlDUGdKaP2xek95DbnKcuH
jDMqXYm2+Fl+85gMKPecUOJw4c0PeVFKu85MfIraJt3R4qzxbM33h9ritxpy4Sn7CUxbAdIK5oSX
nhSA9UUzUXd9Pk7LjqegflvKkgZNE/TIUsQ6GzmplR7tcwh+ttXeqcBlYUHKhGVSU1fBRrMn8TG3
K9JoSHu68S3ggWB5yVKko83Mxrv4M9YIP1vuaNIUpvHi3Deiou23iFiU9CVZEseeBCWiLKllg/J5
V0vJtii3OlHDKNMqWIS3v8Jb+kDRiHrLPHe5fcNtdtB+thX/HsKuvkPjuUtRxHuBbtXeoVc0wIIi
vPbxXKEgSRGh7deP72xPlBl2/2AFYsmTvjPQUa5CzOBn79BJ5OdgMV6G7+mrTZbFflxnwPUTNOv1
7Wa19RLArGL4RAi/vp3iR6y+u9Hfb6Q11sZUdXXyxW7ter2ee18XiYjF/s/pLFJefMxgMevX0vgS
VYpFEF9H67m/g6qF63UYv7q9gN94xjMRDY/d+yYRlelBeltUxoy2ObEHL0mKQST1/Go+j/w0Te3p
VKfbu93qwaAJehvVmm4QrdTV76Co/XMy6K5eilyVRmT+nuQNvOEDAwHGvxXug6/oJOQAXgm1fjwI
tsGhQCHKj6z5/MrjPoo3UrBJReR/eecS68V3h9cOWNmiwr8pHlgaec7hB1aCtitOITDmmNLDMh0g
OJDXHdFZWXqSlJVd9TK0DdOdKrjdAxWlaINUCpjadsyStD1apnvj4YPcdokWe4+N4XlERaymTyRE
3rET98T4ILrkOybd8GMDX9Xpeu6J5h/xtCCPeLQKrT1KLOLhj88MgWhR7mm5+6R1G+PXeBecaRWS
wtXWVS16OflDTAB7M7GDkI1mppnXRBm3fQS2vyshUI7p2EVVoNtZukaBMej00q2EzMgc9majo2GV
QvJYMO+YVswOWbZwgz5PIc3oMRMhaxpee+g/PsSmGm+ilODCc/t2qRNyK/ZgV0jUCRlU+s3Z6Rkz
aP4wzVT6I6bpfDufZ++/91SEqHXyuLxoJyEpqEw3yl9nTEY5nrwyJjWnoyW5w8+2dHL2dHkI/vj2
7g1eF3l5MKs04k/09jJrhShYkmB2ok7rMqQCxP0/Y1fS5DaupO/zK3SaeO/wpkWtrJnoAwRSElzc
moQ2XxjVdrld8apcjio74vnfT2aCEkESCfahuyzkh4VYM4FcUKeG869rECYy8n3KTFIDSgVGve+D
6CMO749vzw/fPrc2L53ubvKjzpm/HR/yiztSlyHHR/SI9NLPFR97e4TVsZz7T5PzPr5scmMy1V6z
N2mwUxXLZRg6m9sDua6yWoi+37hr+AO4MWbz7mAYXywWZhasRjBR4/y5XIVuK4MbMrm/Z7wF3SBa
itUicNuB2KBwEYz0X5KG85nbnqODmY9gYKGv50u3V8AWJN0naQsoymDm1lW5YbL4pBn58IZBR934
NjRSXaXzkzgxSrst6pCNDkgOq9KtpdIORzqrdX6Qe05594Y869H6pCiQS2ZXKq116zoBf9ZFNXMk
1SKx3Zm06ZtL5ErGi3j4WxQuIvBwokAm10sELtrcbQwgjXmUi0Thi8gFUUf+udHjBM8yRrnZakSM
vINi7ija2miknHrZLWibSzzA5d75tWn//oZIVVwq4b4DNABRFElM1XtAIMIvOdNhg5AXUbiV7g0d
u4v13GMgx+p8PgtfIe2I+ktqcZx3mtv5gwFZmWdxglBgKibGnAFg11Ug8TodsjfLQ3Xv3U2qiNYB
Y7vXAJCVxbXHD48BblLBSQXNkTk/T+vNQXM7WdPMKgWhcFOKnkVql7uQVXFfDk/lNIXt39sIEMfJ
MaeO3QLK7YwG9iRrkD7gWX9g3MI2bNApLlMuWLbBXGLRlyF7CJkGU18tB/rja4bchpz67XUenJO5
dyKoFKR46Y46fW2mmE+ZS+6mjCiGFRqhiAtCFmP0aaBReZytVkt8M+mHLXci115kmaqF26HY/uHt
M/mLVb/lk76fIHzgtzRyh+41ewj6WatwuuiodZhk+D+rSmkQIFjCLuqS/YmcqI05znrZBjH0OtTm
BuVcVHWv8B6w0SD2g4Ca9iIZ9Ysp5VhFxYYDHAjhJO1EGg/7r9Fnd41i6zLNIe0YUeHrw9vDJwwv
2LqCbGrDO5nbsB4tcUgakwI8mrMqodu9ykZeAa40mPdxbPEQ+5MT3SbXG2XMQW7kQ6bOd2Fd6ItV
q7FRZBMb56Gz5ao7EiKxXTi4hdP8Y84pydS7ivFniR5K6orb0wpYN3EhirLeH4HhQl6CE43R6ax2
PrklFLwbDSzRTXT71SCs9TzmQsp9z4+s8Vbw+Pb08Dw0Bm16hrwAy456jyGEs+XUmQg1ASMnYbOP
yObVTIx+jxMyWC2XU1EfBSRlTOwcG7/FGx7XLaMNGkwlm9iJKmET4rMouWZKp18EC5CV9UGUuvp9
4aKWMOtUGt8gzjris46zyKmM0umBKuFaGfG7360lehaGjIaAgeVbp6Wx8Un7+u1fWAyk0JQhL3sO
W72mKPzcRGmX6leD6Jp8WYnWGPZLRWOzjwoEEb5YfICy/PiYxA9V2rlcNqmV2irGzuqKkDJjrvVv
iGClqjXnv8yAmkPlgxZos8afGy10DNacZ3CcjRZYMtoyhlwW/CEFZJhxdVKM1UEolaEN/xhUoooJ
LPc6UjsYqqTvceXqgqe7Lw2KQfNrd4iX/fHqTt46YiCt43wcExyzDJPzJIK/zrhXRC5E0i2n1KLq
F3KINq4pCiTr/rAxhru2o71X3KT1prLi7jQBS6DuGvjxuONDVBWpAkYsixLnyzicoiUq3XWm/y2x
xp0JWA23h/EWhjZRL8PkRgHQWbL5OG+pBY6lHXzZIpkvtnRWjsYpePsIAcIyLvXBPtW4Uvjk4Gra
SXTJJN3KMYwy+ifCcHALjpFvAQtGH0uWM06QKK5qOs6Zz7b/2hXA6A4mOHpWo/T4WHVZHJgaO7mP
5b0ZazerIuG/wjUFoLy+43zYeZIL55h3yEta0kcz5coDxqQq3DJUB4T+Ok38i+Ed80w67uxnluYp
/Kjpygz2pbybjM+iQvfS9gDtev3H5PTgvGoDignbQcxXtySR7PJNGwYLW3pjzDESRNvsZr5OqhTT
v76+/xgJJGOKV8Fy7r5JvtFXjJ/yK51x9EP0NFovXQHWGyJaQ/Z7CWQ9990tETnvM0hEryqMRA7U
jBSjmTsKpJMmdb1jJhNCKlUtl3d8dwF9NWekdUO+WzHrGMicX5qGVpTDEDfpw6fRAbc7yNydSHs6
vf96//H4MvkTw4qYPJN/vEBhz78mjy9/Pn7+/Ph58luD+hewbZ++Pn3/Z38eRXGldhkFufF6l+lj
GfV3WixM8C2k5YNbefsjRd8wgVLliOMbM0DpIKKSRWbCZcX/gT3qGzAYgPnNjMbD54fvP/hlF6kc
700PzG2n+Qq62gBOaLdn7qEAVeabXG8PHz/WecUED0SYFnlVgxjHA1R26V+qUqPzH1/hM9oPs6ZJ
d2o1rEx7RcDtVL0e5wLDETHhAt+ZeYQOb/ggDzcI7qEjENY3vHUyWPnmDBdcMG7sCkbg3zs5w6Ib
8RR+DvUnzG5fVJNPz0/G674jHBpkBM4E7Vfu+fPaQtENwBhoVzhCbWFL/kLvUA8/Xt+Gp5IuoJ2v
n/49PGWBVAfLMEQHPvL+ui816gFGE3GCL9JZrNGpGCk/47dUWqQFehqy9AQePn9+Qu0BWIlU2/v/
dHqjUxPGWpCpc8yHrbUKUZnUpfvdBTuGC9J5cp9oJsajODLuzoiKYYuYyHrXCJFF4rrPGdghUsJ1
2ezV8P0/M05CHZvWLV5ItF4EjKtZG+J+Lm4haTBlHmi7GPdR28W436+7GPdVfwczH29PsF6PYe5m
HA9/w2jWt1sXM9YewKw4cdvCjEWAIcxIP1fzsVIquV6NjWhVxEyI9RtEnwt/ISSroAcFP6pajcTP
wfg1I+1Vy3tgUd3r+YrZrpfz9ZK7bTSYXbIMQuZe18LMpmOY9WrKeEJtEf4JsVf7VTB3mUTcPnqT
XsXlX8P8H+TCXwHkLYPZSN+Tsz7OaPiK0XJ2t/BPS4NZs4/GHdzdSJu0XARL/4RAzIxx7tnBzPyd
RJjxb1vMGGWgLsbfZpDlg9V05a+MQIF/jyTMyr+vI+bOv0UCZB6sGRnJAq3GVidh5qNtXq1GZixh
RgJpEeZvfdjILEtlMR87+LRcLf0nbJIyEnkLWI8CRqZfOnLUAcA/F5KU8fBqAcYayai4WYCxRo6t
+pSxjrQAY428W87mY+MFmMXI3kIY//dmGgS1PQjwivctfoVKvQ6n/m9DzF0/jlgfU5BJkX/PR02I
O4bBTQeSVS93tdcjCwIQcyb+QYuQI2V4Lm6umDiVwYKJyWdhZsE4ZnWacQERrg1KK7lYp8HI/Ku0
rtYjx1KVpquRDV5EMpiFUTjKl1frcDaCga8LxzinTMwY7RobMjKvADKfjW6WXOCLK2CfypHdXadF
MLJUCOIfdYL4uw4gXMhJGzL2yWmxZFynXyFHJVbhys8rHnU4GxF5TuF8vZ4zkUEsTMgFyLEwbBAd
GzP7Gxj/lxPEvxYAkqzDJasiYKNWjPkr7cKM+uVJaLmP3I/KaAqUV5Xa9N6juxdvTepGpsIJR8JA
dk9/Pv94+vLz2ye8AfGYp6bbqBZSh8BcMyqZCACBj5E/r2SGxy1SJY02PSMEUH5SgMQHXsnEb21R
+0QyzugRQwqsU2YjIUB0t1wH6cltrkDVnIvZ9Mxrnm5RKz3iXE/T90bibjrn24Dk5cxbA0Hc8/ZK
ZkS7G9m9MBoyp0ZK5CTji4YzEd2jeBu/V8BkB9QVTgyczngpr6S7iUkha8W86iCNe/HBqj+I7GMt
05xzToWY+zgtmGgISA5Dil80QufHhugrJoSumT3nYLFk+OkGsF5zFxYtwDOEBhC6b8JaALN53gDh
wgsI76bejwjvmPu6G52RoVq6+wAlugZpz5M9zrazYMOEikbEURUYQ4lTy0NIGWv32x8Sgc1dwirj
e6iM5JwLWkJ0vZz6ssulXjIiEdHvQ4a/IGq21CuGvUN6FUuPmzMEqMV6dR7BpEuGfyHq/SWEic7v
JcjzOolic15Oh9GJu5mB7/FQL5XkvD0AWWOYtPl8ea51JYXnPEmK+Z1nESRFuGZMyZpqktQzg0SS
MrEndVGtgumScZMKxOWUifhC9RLAs/wNgBGGb4BZwK8v/DT4eM8p1yCWjChi1eLpQASEzBP5DXAX
+A9TAMGGzjC3+pSAkOeZbABAF1r+2XhKgtl67sck6XzpWe9azpchE5aP6H+kZ8+QHs+hh2FIcrnP
xI4xByC2p1Qf80x4O/KUhgvPyQjkeeBnDRCynI5B7u4YEyTc2PJ9ClzcOuDs220QsFmeLVAjh+LZ
v3S67VVxjWrt463bQjCIQNI3smmpvg0Ybb/pJc8VvX739vD969Mn5xuv2LkcGxx3GKLM8mHTJJBq
1644UFjNWxkRoxEB6XVU1LKrEUG1C8hiq8I1HWUnG5wsJv8QPz8/vU7ka/H2CoT317d/YpzCL09/
/Xx7wB7tlPC3MlCO7dvDy+Pkz59fvjy+NQbClk7CdoORmPCpoe0FSMtyrbYXO8n6typTUkuB0Yg6
uaJIdn5L+G+rkqTsxCFqCDIvLlCKGBBUKnbxJlHdLHB0tWW99Ai3svqEtizbb+cGnT/GapfVcQYz
ymW5dq0Rg8/bhaYC2Wg7rAYkboS8JwWUTiriGo21LlyrhNqkjX3FcJS+XhVCHIIpdpIqS+a6cIsR
UtysBWa8bOJyNnU6+wJyvrXFZ0gAYSRBMwGuPJVWmiXCWmJsprEqr8kwdn4QBazDSZygpIXGUUvF
xNLERq+djh9pbHVpe9m9JdUpTLw4Mw7gh0S0ovzjELtoO1ciqky+OMoRR9ulL34GCNS2Hcgtqat1
2SbbE7HTH4bMuxfBwdaXgDkWDJUdKvfhjRRx5B4wkcqEr8PRjXNYuIycDPT7S+kWZIE2j/rHkzUn
8zzKc/fZhmQdrhjzfFy2pYpifjGI0m10REuSLVTCWcD5/sM+AlngwH/PIXI5dMRJvknr3VkvlrZb
b2xJNe/MMPh9iyNdqY9xnf5+1+0SVeoDc4WHU/fqRpgFbKBL+WVcqbRgotnQ16+D3mbWnH/OQ422
yc3Dp38/P/319cfkvyeJjFhfI0CrZSKqqvUG2F6nAM2lBNmQb6usX8CA7gjt1xLJpe0pYXQ9WpyI
ijBk3rh7KEb9pEUBs829Blug43I2XSdu3ZEWtolAFnOLQlazSnmWWeYcxJGhukZqfn99hpPw6f37
88M1gqKLxUPeTRqzDseYUTCroaFaJxn+Joc0q34Pp256mZ9Q0/+2fkqRwo663caly7DFQa5NTEb0
g5SKktlRHdnKXJO959/OAGs6LssYxCNxH6MPH+cAjHTubanku7yzi2ACms+VFvNGacBHov9K2BGc
BGIJnBSZHPSMok/fGjdg52/PA/khs0xj6GeNYbF6xm2d9BoNJBOhrBO86pSSRcZYo5tUyLSbUMV/
XNd7Jx3qwdgandKBbTjDmABpUCibCPvOYadsw94r0bTOfg4Bwr7kNVaRHl0ygVfvcMbkpdOmEr/J
CFRkhSUK1au6zGW97bXnGmYdiduq36iWqjLNRCvBtjGBO6mIVFTaNrZp+v4QU2iR4ZA0sepc6GFf
Y44U+MfaBHzs0Bxu7SgZK2A/RSQ5E+eaPgYEJsX4qaVpogvBhBinxhrbTrLc5csoDr1H0870Uf3v
EVEQhszbM31QxdphEZ2P3N2SSQJilPUQdAhDTsOzIXMacg2Z049C8ol5qgbaRofMLSFSpZgGU0ZZ
Fsmp4swxaB84X3axe5+m3NViFjLPyYa84p77kazPW77qSJSJ8PTYjvQNWHIiLt7spnhGjeBaPE82
xfN0ODSYl3jaSHlaLPc59/oOZHRjwNg1tGQuZssNEH0YLYEftmsRPCLOqoDVHb7R+XmzTTljMDok
oopfqkjk1yicc8HaM2rkGjI88y2/Avgq7vNyF8z6fL49c/KEH/3kvFqsFsw9QnMGs9bRQM7S2ZJf
7IU87/nDtVQYhJ5R0EV6Gs/5zwLqHV8zUZlHInMqMNf/5sARIas21NJH9mcS/fKKXxrHM6vCC9RL
uu1tlMbrTfQvurfsmE3QPBRmsjg51Vuu/+plKdCrZ5JLkl5/Xy06x14he7zM1a7vxZVKZqVw/vcz
2SJzk9DKzBoml4lF/TterNk4kYtuRkiot2IDAiHuhvlBD8l5djkPU9HYfZiY55mKh+nE96IzNJZS
q1mPeqg2fQYBHd6KAxvNqkEcRODZeIxP3fOMZ5yMx2Al/vAiVv2YqQPEXm25AOV04suof+05KKLI
GbWqlr73I3SeOfwE9UDkecVl39zw+bIbHcKsswIjwPDlFhGNlHRbNtJ2kQ8fJ/YqGl6L7FXHeSf8
BGFeAyt+gblextmOcd8MQM4Z1GHvDA+PRbf3I8YxzvfHT+iBAjMMrCcRLxb9ALeUKuWB9xFnEKXT
ppxo6AFwUCQmKvfWT3TOTTURD6U70gr1Zpzcq2zQx7HOi3rrHkACqN0mznoIiy73IO9bDzYmTcGv
S78uEIcr4fk2mR+4F1Ekw04JO657SSMdZMJIoRs7vgJ6x+PJ0HsahLC62kyXzrt6Qt18V3Yywyzc
5VmpKvdmgJA4rXw9HXMRwg0x5nTxDNnpfQMpH6FL+o3dxelGMYo2RN8yT45I3OdJzzNTN69ehXN+
FKE1/iVzf+F78CApPhhLP4lEM/Iwko8qPlVMEDJq+qWk265+d2GcDNfdHtH0YA1/gKOWn2X6pLK9
8+nPdE9WKdjsho1IJPELbLncfa6hZfmRmyHYpbS7vfQyNen4o2Ci+14hzLRGenlIN0lciGjmQ+3u
FlMf/bSP48S7fOjdhvyQeiAJvhp46JdtIiqXp30kl7FZ5N3NzgTEyLe6l5yjh/rh0qMACv4VkGku
tBDSSuWWOZGKceNdPtNoexQZqkUnedcPt5Xs690izlJ0qccVHmuRXLqBmigdvT5JfmIW6M23xCXJ
79p0Z+2WKcyoQAGMMET0XErhZmGQDCcS32eOKHeUDIcbXyBa0bLeTQmhY8Fvr0CFmU7OkrhWHTIM
UtNvVck5McCdDf3kispz+FUpCBQf8guWzO9d6uhmy4mYFxVnQEz0PWxs/HfrPboBMtev/AGAzB4K
Qjxitv0YM4+05ojwnaMnpVj3t0g/K1gGLBUr9vYfxmiQvh3ImDfUe8bpBjF5ST8k2dWLmoOJNWED
qo2b5zYCzIDvLpxscwO+uk1qKu2X3XpB6lR4K5+cKanI+QGDbDch3K7Aak6+lwoZ1EabhgKdWX5D
rwjUeEniBtSlx6MlNG8U3UQMEto9oUniTArF+KkjoRZ96e5FVe9l1CmuW3bvzpxyZhnsvTJGp/jN
I9AwZEf69P7p8fn54dvj6893GpcmVkd3vK8XCKgcpCrdr4p/t+nAcu0+hBpafdordL9euc4LI+Dr
HCQZOFWi6yWGTcbOfbEmL/pOkq3vpGionUSjslqfp1PsXrZtZxzvHqA/HczwdLJRepnnGldmrbmv
IpjWOEwVyEWRY645RpfSt5Vb1cFuFbmRzd1ndBfn86NEQ3Q+zILpvvD2laqKIFidvZgtDDaU5OnS
nOnSvPtRIIjyre1Bne/sXeCwl/O/3TkHxxzpAKoEg9b5EGUoVqvl3doLwsbouNJ0GzpYzjjvm6gq
8vnh/d2lkkcrqe8lx95KSgqTxNJPEZ9Xp8OLmwyOxv+dUBfovEQNq8+P32GPfp+8fptUslKTP3/+
mGySe/LYWUWTl4dfVx9DD8/vr5M/HyffHh8/P37+vwk6BbJL2j8+f598eX2bvLy+PU6evn157e5b
Dc4WUqxkj4aZjWoiMY3iIqHFVrjPYBu3BbaKYydsnKrwGnAUBv9mOFUbVUVRyVjv9mGMBroN+3BI
i2qfj1crEnGI3PyjDcszT1QLG3gvynS8uOa2pYYBkePjEWfQiZvVzBOq7SCGRyeuNfXy8BcGuHI4
EKUTKZKcERqRUQj0zCxV8MrldHRFGcPTUum0XUSMb186tk+M8V5D5EPToaMpjFHgPQbWXS2wW6eR
W2hmYxpGQLll67IqTP44VYxJZUNlHEvRphgd9MEtMpqmHSsmHi5F64t3uWbvWgjh2davM1Ze1pIx
+jQwMlLmuz3i7zLo5NWoRuIOJ01dgBfJEQweMlf9TVMB77U57vhBZ+wx6WAoBbCirngl3fbnJ1GW
yoPAs8/Dy1SxNsfjVp31wbN2VIUKf1vmDQAAF8jNT4b4I3XnmZ9ryPPB39kyOPNb0L4Crhn+MV8y
jghs0GLF+PWgvkdfxTBqcenvIrkXedWLMnVbYsXXX+9Pn0AaTB5+uf1cZnlhWGIZK7cS0HX1/39l
19HcNhKs/4rKp92qDRYVLB18ABFIrJCEwKALSpa4MmstUUVRb9fv17/uGQwwoRvUOzhw+sPk0NPT
4cx+adPufkw5ZiYzL5gxr0j1umAcego+SkSQWMY1Z2LM2ZOGqRNgSDUbrlAisp8WNSKopEKtvk6G
1NaRCZqgaYnzL8M1j2Es0AezKQURvY7iWWIURA5edvZ5cnFNL0dZhp9enjFK8gPgYgQgrN3oA2yg
02tA0TlXTT39ekIvMwEofO96vAS07aSXRUe/uGB8bwx0xoRd0ZkTpaNfceazis5pQw8NZExEe8Al
Y6EpBzGYcE6BBB3jAV4wms8SkPgX16eMAkY/zBe0tx5Bj6uz0yg5O2UMH3WMpehhzXLBy3/7sX35
55fTX8VWUc6mJ90jxfvLIyAIgdXJL4Ok8FdnnUxxa6QU42X39m7kza/SZFUyp72gYwCekS4VNsOd
xIdsb73fPj1RyxpF9bOQkaJ4vh+i65A4iRkLlxj+zuKpl1FX6zBAvZE6R1lN5ZeNJkQSJEdshakW
pguXU60rU5VWEDklWUF0XTiLZD9MaCmGrC26E2esfgcA49ZE5l/4lguDjlrWPoaKGtqHCXJLN5Lm
fp1XazpRaVd/2h8ePn/SAUCs87lvftUlWl/19UUI14VIy7qYPWLSlBi5Wg/pqgHhBh/1Q2Snoxo0
kWy5ttfT2yaGa1La0OMkal0uHL6jl+piTYlTTH3nTacXdyFzkxlAYX5H318HyOrqM6U3oQBBBVzJ
F7uRAwWmYgZMIxP9XYMy7qk0yOUXekdWkPk6veJc8CsMOii8Zq6PClNWF/7ZkbLiKjmdMF4mTAyj
H2eB6BuUAq0AQgsQFEK4lmPOXAPDub8xQGcfAX0Ew3jp6Efj/LRmnB8qyPT2bEJf5hWiAnbpmvH3
qjBRenbK8Fz9qMNEZ3TRNcgFo7qt58L4dlGQMAUek2Yd+lwWABmfXOXi6oq53/QdE8D6u3J2D/S9
bu4e+u6E0SZQW0wYgfR4dCz+gV0nqM4mDGOpTYvJ6Ueaf22KSqR79B/3B+Bmno/Vw09zJhTjsJtM
GJcRGuSCOQJ1yMX4GOC2dXXRRl4aMwpTGvILw9YPkMk5c13tx7y+Of1Se+NzJz2/qo+0HiFMtBMd
wgSg7iFVejk50qjp7TnHavfzobjwmfuAguCMofTEFL0PumCl362zW9NFtphPu5ffMVTOkWnW6S6O
VgwVljJGL7XfnWr437HNh3tq70c+Y5zj9734xRIf9Cqg1eblDe4ITGsDdOq2IF86gTRtIu15s/8I
Qz2hswar4Z28wvpO48WbVScpo4RpcW7IzzCIFxPKA2lFN0RxSasWIyYA3u8YxuPEIjKsqp9z8mIZ
VHV0liAmC2tGJoYZlI0dsEqjptElY5mxiMgoYNDOdrouUJaSepk3M80JUd1fWb8RH8vYYk4gtTTM
Gs1/ikzEdz8biJ0hbzoOfIoa/OKp2agMxrNlowur4lMiyka6fdjv3nZ/H07mP183+98XJ0/vm7eD
oQehXNYcgQ4FzsrQjcCl5nvtzWLGB+YsT4IoZgRX8yWcrxkG2nAa4YvQGtXufW84qFRDeTW5OGu7
WCBdmp/cTJNAkvSBFY8i+L7QFnF9eT4lFyVZnJaHFyfTnLoKxHAjb0yzUZk0XH2ldx4Me7J9OBHE
k+L+aXMQwUsqd1COQbW7uShJXPAiJlBzh+i0LWDu1/Myb2aUcmEeSbhm/yGCxdZ+2BPkRXHzvDts
Xve7B/KAEKG78U5I9jTxscz09fnticyvSKsZEdtvyNH4UpuWaO+xjInQ02gO8EslI1rlLyc+xqo6
eUM50N/Q74Neh3RO9Pxj9wTJ1c48IZQrIoIsv4MMN4/sZy5V+m/Y7+4fH3bP3HckXT6Lr4o/o/1m
8/ZwD5PldrePb7lMjkEFdvtHuuIycGiCePt+/wOqxtadpOvjhRGmnMFabX9sX/5z8uw+6oKSLuz4
6F2R1Me9ptqHZsFQVJGi6CIqQ/q4DFe1zzkXhCXBSAFixsIoq+lHnkUaumGoVAWXbmhKPNwxFhsR
ubC8xV3RCHCZANtCL1snH60JheffsJUSgYnQMUNd5klChFUs5mvY2r7J0HFD9TrOAUM5WV6N2xv0
SIdPYUike2K+VsxnG9BK4yZkJB8MNBunq6v01g59ZsDQ2UECfxfxeHbFymsnV1kqXuGOo7CZLEoY
DMKd2n5/UiGqjJ7VPkURte/R/ZL6bni3YrPHm+f9CxyOz7uX7WG3p7iJMVh/JxGBa+UG+fK4320f
DT91WVDmjF6mgg/oJJ5miyBOySiinqEFjjLHgLQ7UyJQ/Wcv6ZS3hOXJYX//gGoZVOzpmomXJ8bG
NhdTqqRulsOXUcE8iUcVY/3OWl8nMRtZQehkwf+z0KdZTBG7nvGc0qmEBfruH23hLJFzzdihF14S
B14dQvUxXGFFxgwGGrAYXqG9DazqieF4o0toV15dl25ykVfxqvX8xCVVod+UcW3sI0A7ayOK0wfK
uV3wOV/C+UgJ56zw/a9pMNHB+JsFQwHp1Pf8uebepQxj6EmgRMZ7cZ8s4u8yG3IHEa5NMFItJToY
src7XCcRXaKTtW5R7VQ11n4TmfzF9Cmm8zp24iv0FISv7tTQrmTpemRhSLlt8tpj0HrdjI8YM1ck
5Rn6k5TvYSxo6ZU0r7AabSLw+RN62k7r0upblUI3oqfKSM24HcxK7hGwB5dN1lZeBjjxOkNvLRLN
N0LS4S4SMr04FBdG6E4njiiRSBYnsjcM55YT8SW9iuShMPwmVzTe2qyXyC6tnYqYkHlBZh8nobiR
Sq+W/cUxC1BBaW3TtU29BR6kXBe8g6tK9EFN9UFU2a5KAzshlgnigdko2JMEskxuTaDGfFSdG/NM
phlJERRmDYzPqZF1ogxyzNB1V+KtrayGVDSGi9ElahvE1LFCIb1k6QnXpkmSL/UO0cBxFjC6Whpo
BT0rGn8MmIa1hy5aXSHH/cN3U8kzqsQ+T8soJFrCg9/LPP0zWATi3B2OXTXoVX59efnZ2u3+ypOY
0YC6gy/IIWiCSHW/qgddthSK5tWfkVf/mdV0vYBmnK1pBV8YKYsO8qx/ogQYfh6EBepfn599oehx
jjHV4cLx9dP2bXd1dXH9++knfcoP0KaO6IeCrHZ2kIHvoZsnmeS3zfvj7uRvqtmOFzGRcGN6bBNp
i7RLHLj1Ibl75kdvXJQ/Z4FEH/d1YuWKfYbmLDFsRU7ecAtMgjKkVDhvwjIznJ+ZGgB1Wjg/qU1V
Eiw+Yt7MwjqZ6hl0SaK62hwJ0e+2MIvXUns7plk887I69tVXGgOL//CDSQxYX2RcSQk+6leEqbGI
8hJV64hsVcWCEVrE00JxCND74NzaX+E3WvhZ++J0pFbTkYK5E9MvvVQvVf6Wp6BU7lDT4rbxqrkO
VSny2FO863AxMchyYyYq0MMCtG8oWrRJT+iMOoSwa6bvQhQS7c/wrWukaGvW9ul3UtPHzT+5Ox/L
L7nLidxWd2Red1XN+FxRiHNh5YLGLugBaBwbptMwCEJKkWsYkNKbpRjAW4yZdCt0ph3WK34epXEG
C58h5in/4bzgabfZ6nyUeslTy7FCC7TWYDpsXS24z5qRdVTm3EpSccnNLUURI/MExN+LifX7zP5t
7rAi7VyfQ5hSLRkhj4S3lMNEYV+YmXwDwpGj61T1goxsYwfCMyNMEGRUT3M2ir+ghU4LAruZAdXO
wG1oIPck6VWKa3DQom3YMQyGG8NRcnHqBlZ6cALDvhHnmmWl2BKtn7KeWu9AS1yNSCT0hrxqAjZZ
aTjvEr/bmenvpUvl71l+WMyZnT22mPO4uzpXEwbd4iPlEhhjcS0Ph7dMM49l6N20xRIPZvrJT6Ca
An3ocCVZO65IE0yFlSYa7tRApNIi04EuOKiW9dIjgWRFNe4i8PhjntsHEn1RJJXiRr9+ej/8ffVJ
pyhWtwVW15juOu3LGa1MZIKYKL4G6IoxVrNAdMdaoA8V94GKc3ruFohWjrFAH6k4o9RngWidAwv0
kS64pLWQLBCtZGSArs8+kNP1Rwb4mlFgM0HnH6jTFaPSiiC4auLVrGXuX3o2p5wRpY2ijjLEeJUf
x+aaU8Wf2stKEfg+UAh+oijE8dbzU0Qh+FFVCH4RKQQ/VH03HG/M6fHWMAHvEXKTx1ctbdvQk+lw
aEhGz5TAyDFOyRTCD4Gbp5/TBkhWhw3jk6UHlblXx8cKW5dxkhwpbuaFRyFlyNjqKgRc9hPL8sLF
ZE3MMDR69x1rVN2UNzHpdAoRKC0xfBlksZ+T3sjivF3e6r5ZjHchqX6xeXjfbw8/XdcgeCLrxeDv
tkRP5lV3I6F5eelFBK8t8EUJt0TmEtxlSbPvUgobBjwECG0wx+g90kMbFxxYPlyggl0lHsDrMmYe
2RR2lEiLBLxFCH+VQZiFgRDuoohRsGm+Z4l5HBgtZwa+FAXFVd6UnDNRfF3xRTboLkJGdyIq1/uH
7btCN/tJqvTrJ1S4etz9+/Lbz/vn+99+7O4fX7cvv73d/72BfLaPv6ElyhPOkk9y0txs9i+bHyI2
1OYFH06HySO13jbPu/3Pk+3L9rC9/7H9XxUzTE3LLBbuav2bNsszQ4Yw8/0u7AD6+Gz8OkEmlrXH
ouHTdRnS6pgj+JZjLkVt80yOZt+bzPuAAqMbCBarFP7oXlJkvpN7pRl77favZXkpb2H6y4DQhBUC
TSstDVO/WNupkIedVNzaKaUXB5ewqvx8oYumYOnm6sXe3/98PexOHtCHx25/8n3z43WzH+aCBEPn
zgy9PSN54qaHXmAXKBJdaHXjx8VcD9RgEdxP8MJEJrrQMps5GUMaCewvGE7F2ZrcFAXReJSZucmD
Hi2ZbjxxdyR7XZEftkFcedMklI+MTvaz6HRyheFG7FZlTUInUjUpxL/05U4ixD+UuEz1SlPP4dhw
SsRaO4lhNsMwg51DqeL924/tw+//bH6ePIjZ+oTxXn7qb0FqFCtaG6QjB8w9uyvUP0Yvg/H8YQNf
hJOLi1ODk5QKPO+H75uXw/bh/rB5PAlfREMw9uW/28P3E+/tbfewFaTg/nDvLD9fjy2jBlakOVWY
w8nvTT4XebI+PWOMwfoFOYsrK5CbtQbD29jZOTCMggcb6UKNz1QoBD/vHnVLSFWfqU/VMpryhfp1
SX1S02L3rkZT4pOkpD1MdOR8rBIFXfEV84yv9oNwvSwZOaLqdPRaVzeUHpZqTFUNfTu/f/vOda3h
nl5tg6nnE+t3Bc0Zq9UCPnPmbLB92rwd3HJL/0yPKWgkt4sirRpyZiKdb/VqJbZ1uz3TxLsJJ9To
SsrIpIAC69PPQRzRlZG0rr58LrOuWs6OSCwwa38Ozp3mpMEFlSbiDzjpMawzoSdJzcQyDbgYjBqC
kQoNCC6kxYA4I+2l1AYx907dkxsSyRYBAcpzWYC5d3E6IdoIBPrCrehMsERFroHLm+aUmpg6fGbl
6fXEqeeykPWRJ8z29bthUNHvnhVRZUi1FLMtetZMY/LD0qfewvrJni/RNIRYH5Kg5OLEVPfSEG7g
lIZKj8AbI/99VY/MciRfOtUKyM6JHC7C2j7n3h3BOFZeUsGRNnLajc6CkHzF66llIQN7uZNrZDxq
PYCwSlvm5BB16UMPd9EKn1/3m7c34+bV916U4AO+nRO+h7oVvWIMJ/uPaInUQJ6PHg32u6q0QLl/
edw9n2Tvz982e2mFMwSetmd8Fbd+UWYj6zAopzNpH+ZMJKQwh5qksa8nGghYivHCnXL/ijGSRYia
+MWa6HRkzdGU6Wj5PVDdZz4ELhkTMRuHdypncLor3Y/tt/09XGD3u/fD9oVgIJJ42u1iRDpsRxRL
BSTi4KVgcm0eRZEss4sLmHqqYxhYf3x+PyUL+QgzPFSZZp5dNHOazZdOEmrUZysmWQnTiD1UkPE2
2YWvGKW3hXRBfhzXed0hFhQgvTpFOwl/dE8YgNgJn8/Hb11YfiziVvtZdnGxokwLNOwipbsK0rW+
okrx52FSkfasejbKOpXKofKicOXbkaWIknxgLY72UCpiX7SzFZ2fV61TjIoMEJSWomM1dy1v9ge0
sYK74Ztw0PS2fXq5P7zvNycP3zcP/2xfnkxzalSYwCWKUXWrXsZLCrg+krfqwGmceeVa+qeNlOwo
YXcYKXjSBVIqpZ3CGMKGXt4YynWeUPYlRm4KMydEQ2NNn03ZOwGDl/nFuo3KPFU6uwQkCTOGmoWo
3BgnhiDdz8sgpgKO9GZWfmxbYCiSlSwU71DRw0+LlT+Xyg5lGOnz24fJBIeNvvz900sT0d9jtLS4
blrzqzNLcgMJwN8kke0byAQksR9O11fEp5LCcQ8C4pVLj3G+LxFT5r0FqMzrsG8xwjrhC9EM2Ir7
G6mOpcQa3SVT9+/gZUGejncUMFidJpy5D6NaGxqFJIay5Z08rqxUYN2GnfxZT6VyBqaMLhF4MSIb
kazhe8LqDpOH7+XvdnV16aSJU6FwsbF3ee4kemVKpdXzJp06hKrwSjffqf+XYSciU5kRGNrWzu5i
bYFphCkQJiQluUs9kiA0CSl8zqSfuytef0RSWxbeO3WjAuAkF17Smskrryy9tdSt1HaMqsr9WAa1
EgBN49cThl+6BZ5MEhGZjX0H0wO90RlcgtpK+OjA0EKzem7RkABZiFcrW3MYaV4QlG3dXp7DgtY6
BygBBssuMSL6XDDMhNpxlJeoiQ3gJuufDjWVrWWc14mhISqKRPNQLvDzLJE9r3WzMN+Xz2za7lk0
bWn0TXCr6cjNktwoF3+PbQVZYipcoZ8M4Ba1HGH1R4HWCbkIeDODs1iPuRblWa3pt2nvihkp5xT4
q/+urByu/tNPigrNVfOEGIACDTWNB5ye1Ei3hm2UNNXcMpxzQKmPDJJWIswG2bnasyfyG2Qf9oyH
wzeYr5aKqxGpr/vty+Ef4Vjq8Xnz9uQ+hMvY4SLoucFSyGRUSqNfUfKsyoWd0SwBBiPpn3++sIjb
Jg7rr33g0BS6BFVqnBzOtYncRedgJ/I6neZw0LZhWQJS61upfAd/uhjpup4A2ym9aGH7Y/P7Yfvc
cXJvAvog0/eUHx5ZGmPhGGbigSltUE6EJnDaNCyh0sJC7yvcA67MeVDAdoYGwiln7u4FImNAkYA5
AIDzQ03KmlaCzAsYdrj4ASSJM8tcTLapCn3UP0A7hdSz3BKruloQ0R60TVy72cm9TOpuwiXc0ogf
eOuPjoHh8aRbAsHm2/uT8G0fv7wd9u/Pm5eDNuFF3DRk9cvbYSC0xP5hW47b18//nVIo6e7dnnCG
jYknTiHokJtZYOyT+JvoyGHDmFZeZ/2Io+Mlhj2loBKfy6+8JJ5lqTxJHEcvoz1ktkQqV9vtQ3MV
dX/pXvj7zPQFIZTlwlWN0f0YZQKZIQLFUUSr24gIC8uMkfsIcpHHGOOQEfkMpbSc2oSE5NO/Qp95
n6qSZqpgTMh5RAi1Zk6BputVOEpQK8NdGYpC8m9iJQqVkqaybI9E4J2OiNGFeHNsmc2Ceq3pZ16H
wYDUpic3g8DWUbofEXoi7sfdgkdG6UgvidagWWMkDSfdfnCJvi8acOPhIhjC3aoVJ5LFp0LKZSqp
DFPY2f7mls8y+bSH+JN89/r220mye/jn/VVuT/P7l6c3cxlksGHA3pjTprwGHf0XNLDf9LwQ3Hab
AipSw8TUOWQMvugSB92zPK/h0uClOlCURAkIWLBdHVTt+lCpGvB4qTa4L1UbCCysnTfAF9VeRc/t
5S2cOnD2BDktrBkfMakrCOfM47sIt6XtaMYqU3YARiKe+s6CdLaCQa2JKMaedciM3YRhYW1qUmqE
2gLDBv7L2+v2BTUIoGHP74fNfxv4z+bw8Mcff/w6VF9Yk4u8Z4K9dFnnooQlpazGyS4WeWC7RjYX
vEk1dbgK6X20W1OEJzZzF5FZuDvIcilpsN3my8JjImR3VVlWIcM5SYBoD3/0SJDyOJ7AaBzJCztW
vFR0vDtdtigVlg5G+ODDXQwNHb0I/D+mQj9ncQus0bJI717BsUFfwA0TH/xgVkvJzkiTb+SByeyN
/0hG4/H+cH+CHMYDykUJltkOmWcfGUfo1dihL5wOxJw/enmYi8hXKLMsG8ItgrF5ME2yS/VL6L+s
Bt7QdeRZ+g3NLgEBj8eInxGI4KaNBsHzVXD7Yg/Jm/rr5FSnOyOPieEt6UNDOb0zKu0syduOpy8J
bt68i4mpDzwhSvcZsSbUfg4nQyKP+TpU3rzopQSAzF9bAbCVqCEvZGNLiyGPmkxeV8aps9Ir5jRG
XUoj1ZlGBiIRrvro00jojpaBBUG7eTFCiATuNavtS4PffShzGYiyOuhdvbXKlqX6pp9KIUqYNlGk
NwGu2lAxxBvuQ7CjcWxk8Bmn4VpWnX0eWnya5Rv5KQGfnVEHdK0T7d5kx4kbIu0oC8MUVjNc0kRj
Ga9U5S1wPFH3PXWtFae7m/18CROP+GyQQsnB6IaZYvu6cawyT4Si03O3SD3TbBvYql0Mg1PN8fQW
9u22wrlKx4CquJ6C7gPmfO7hMDtHgfK6wXadiogY5/Y8vYEipmE3LkNyQydPi8hJU6vPTqdzcNbq
MEpqGnWNpscSa9DVGa8cZUxaojCL3pkRtQcbeMFv8nN8cxyNoiIzkms4zuwD2ISJrWV4MKSPFW1d
fxx5tCHaEhTRbnmkapCXCAG668tazTgvLRIyQrh2dxUe9eLOgtiQkQu7mA6hj0ycmzTnyH7d/bvZ
vz4wUg40iu70x5cwO3JqMSBIEvXJikMjV1EQFvX866Um9ZyL44G4Qmg5YkgTsaA5oQMaTcGVCjZz
XaA8VAHjYMIROg2TNgo9wVcI0YHpxocB8Q7k6hLj18HccEtMKww9XYt3koFotAonDN5DYS5UfCEr
KxY1/lZSOwYuhqmCG8E00d4R9A/bMheBaS1xg2FzgNdWOHrhnLQrHnplsh4xkEdMUdvedAxyhHqE
XVhuKgScEl47E1IX/9ebtwPeBfBu6+/+Z7O/f9roM/amyTgTvo5bbsVU7TYXiyO2t04Lamx50kvS
SC79ur1B+xpbjlPB6ZMvuu2hMF6nEU+xv7D3As8rthqc8p3D9IFdvAkYB5oi6qLQ96hyxk+cgLBU
eUJUur86+jRRdy+xAEaYffEGOkIX75F5kuP8ZVHGy+nIXi0c0/B0eQW+PGfuogqlWUzxmz324jxc
setAdrN8A5Nvkcwx2OEqn7EwFIAbQNSMw1IBkPo4PF3uVqN0WDJM7FCBaBrbx6xOlY/YPF1JOXlE
iRoZNR5AIx3O6VgKaszEOJaL4mZkxSxSXnoiG496lqwRqOzBYqz7UQ9rjm+IcDjTrHacBTgKR3iX
LqxqmS49xhGPnFDCodlIewQvMzYhhc0qa9QrJyUcMjwVrRXhdjG6OoSyF7OLq0xYANBYedLoGeIY
bsp35v8DMOA53WOkAQA=
--===============8122304279454690844==--

