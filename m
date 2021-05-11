Content-Type: multipart/mixed; boundary="===============6861303684698616968=="
MIME-Version: 1.0
From: Dmitry Osipenko <digetx@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all drivers
Date: Tue, 11 May 2021 18:17:08 +0300
Message-ID: <dd0b550e-76a0-bfbc-9d6f-5d867812046d@gmail.com>
In-Reply-To: <202105112125.VctfC6sX-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6861303684698616968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

11.05.2021 16:58, kernel test robot =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi Dmitry,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on tegra/for-next]
> [also build test WARNING on v5.13-rc1 next-20210511]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/Enable-c=
ompile-testing-for-Tegra-memory-drivers/20210511-053910
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git f=
or-next
> config: powerpc-randconfig-r032-20210511 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0fe=
d635fe1701470062495a6ffee1c608f3f1bc)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         # https://github.com/0day-ci/linux/commit/ecd67b1d49eb33c9821130a=
2b3b896bab395118d
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Dmitry-Osipenko/Enable-compile-t=
esting-for-Tegra-memory-drivers/20210511-053910
>         git checkout ecd67b1d49eb33c9821130a2b3b896bab395118d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Dpowerpc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    __do_insb
>    ^
>    arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do_=
insb'
>    #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b),=
 (n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer a=
rithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmet=
ic]
>    DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PC=
I_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:211:1: note: expanded from here
>    __do_insw
>    ^
>    arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_=
insw'
>    #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b),=
 (n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer a=
rithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmet=
ic]
>    DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PC=
I_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:213:1: note: expanded from here
>    __do_insl
>    ^
>    arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_=
insl'
>    #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b),=
 (n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer a=
rithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmet=
ic]
>    DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long=
 c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PC=
I_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:215:1: note: expanded from here
>    __do_outsb
>    ^
>    arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_=
outsb'
>    #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),=
(n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer a=
rithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmet=
ic]
>    DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long=
 c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PC=
I_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:217:1: note: expanded from here
>    __do_outsw
>    ^
>    arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_=
outsw'
>    #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),=
(n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:10:
>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer a=
rithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmet=
ic]
>    DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long=
 c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PC=
I_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:219:1: note: expanded from here
>    __do_outsl
>    ^
>    arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_=
outsl'
>    #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),=
(n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>>> drivers/memory/tegra/tegra30-emc.c:757:18: warning: implicit conversion=
 from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 1844=
6744071562067985 to 2147483665 [-Wconstant-conversion]
>                    writel_relaxed(EMC_ZQ_CAL_LONG_CMD_DEV0,
>                    ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/memory/tegra/tegra30-emc.c:161:36: note: expanded from macro '=
EMC_ZQ_CAL_LONG_CMD_DEV0'
>            (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
>                                              ^
>    arch/powerpc/include/asm/io.h:679:40: note: expanded from macro 'write=
l_relaxed'
>    #define writel_relaxed(v, addr) writel(v, addr)
>                                    ~~~~~~ ^
>    13 warnings generated.
> --
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PC=
I_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:203:1: note: expanded from here
>    __do_outl
>    ^
>    arch/powerpc/include/asm/io.h:537:62: note: expanded from macro '__do_=
outl'
>    #define __do_outl(val, port)    writel(val,(PCI_IO_ADDR)_IO_BASE+port);
>                                               ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer a=
rithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmet=
ic]
>    DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PC=
I_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:217:1: note: expanded from here
>    __do_insb
>    ^
>    arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do_=
insb'
>    #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b),=
 (n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer a=
rithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmet=
ic]
>    DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PC=
I_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:219:1: note: expanded from here
>    __do_insw
>    ^
>    arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_=
insw'
>    #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b),=
 (n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer a=
rithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmet=
ic]
>    DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PC=
I_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:221:1: note: expanded from here
>    __do_insl
>    ^
>    arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_=
insl'
>    #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b),=
 (n))
>                                           ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer a=
rithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmet=
ic]
>    DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long=
 c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PC=
I_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:223:1: note: expanded from here
>    __do_outsb
>    ^
>    arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_=
outsb'
>    #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),=
(n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer a=
rithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmet=
ic]
>    DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long=
 c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PC=
I_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:225:1: note: expanded from here
>    __do_outsw
>    ^
>    arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_=
outsw'
>    #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),=
(n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>    In file included from include/linux/io.h:13:
>    In file included from arch/powerpc/include/asm/io.h:619:
>    arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer a=
rithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmet=
ic]
>    DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long=
 c),
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PC=
I_AC_NORET'
>                    __do_##name al;                                 \
>                    ^~~~~~~~~~~~~~
>    <scratch space>:227:1: note: expanded from here
>    __do_outsl
>    ^
>    arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_=
outsl'
>    #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),=
(n))
>                                            ~~~~~~~~~~~~~~~~~~~~~^
>>> drivers/memory/tegra/tegra124-emc.c:802:26: warning: implicit conversio=
n from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 184=
46744071562067985 to 2147483665 [-Wconstant-conversion]
>                    emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV0, EMC_Z=
Q_CAL);
>                    ~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/memory/tegra/tegra124-emc.c:154:36: note: expanded from macro =
'EMC_ZQ_CAL_LONG_CMD_DEV0'
>            (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
>             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
>    13 warnings generated.

This doesn't look like a useful warning from clang, it should see that
the constant value itself isn't truncated, hence it should be a problem
of clang. Do you think it's okay to ignore this nonsense?
--===============6861303684698616968==--

