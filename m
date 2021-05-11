Content-Type: multipart/mixed; boundary="===============2045471124562530916=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all drivers
Date: Tue, 11 May 2021 11:31:03 -0400
Message-ID: <06addbf3-0090-b76f-65cf-e0c10d284c69@canonical.com>
In-Reply-To: <dd0b550e-76a0-bfbc-9d6f-5d867812046d@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2045471124562530916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/05/2021 11:17, Dmitry Osipenko wrote:
> 11.05.2021 16:58, kernel test robot =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hi Dmitry,
>>
>> I love your patch! Perhaps something to improve:
>>
>> [auto build test WARNING on tegra/for-next]
>> [also build test WARNING on v5.13-rc1 next-20210511]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/Enable-=
compile-testing-for-Tegra-memory-drivers/20210511-053910
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git =
for-next
>> config: powerpc-randconfig-r032-20210511 (attached as .config)
>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0f=
ed635fe1701470062495a6ffee1c608f3f1bc)
>> reproduce (this is a W=3D1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # install powerpc cross compiling tool for clang build
>>         # apt-get install binutils-powerpc-linux-gnu
>>         # https://github.com/0day-ci/linux/commit/ecd67b1d49eb33c9821130=
a2b3b896bab395118d
>>         git remote add linux-review https://github.com/0day-ci/linux
>>         git fetch --no-tags linux-review Dmitry-Osipenko/Enable-compile-=
testing-for-Tegra-memory-drivers/20210511-053910
>>         git checkout ecd67b1d49eb33c9821130a2b3b896bab395118d
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Dpowerpc =

>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>    __do_insb
>>    ^
>>    arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do=
_insb'
>>    #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b)=
, (n))
>>                                           ~~~~~~~~~~~~~~~~~~~~~^
>>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>>    In file included from include/linux/interrupt.h:11:
>>    In file included from include/linux/hardirq.h:10:
>>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>>    In file included from include/linux/irq.h:20:
>>    In file included from include/linux/io.h:13:
>>    In file included from arch/powerpc/include/asm/io.h:619:
>>    arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>>    DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>>                    __do_##name al;                                 \
>>                    ^~~~~~~~~~~~~~
>>    <scratch space>:211:1: note: expanded from here
>>    __do_insw
>>    ^
>>    arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do=
_insw'
>>    #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b)=
, (n))
>>                                           ~~~~~~~~~~~~~~~~~~~~~^
>>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>>    In file included from include/linux/interrupt.h:11:
>>    In file included from include/linux/hardirq.h:10:
>>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>>    In file included from include/linux/irq.h:20:
>>    In file included from include/linux/io.h:13:
>>    In file included from arch/powerpc/include/asm/io.h:619:
>>    arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>>    DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>>                    __do_##name al;                                 \
>>                    ^~~~~~~~~~~~~~
>>    <scratch space>:213:1: note: expanded from here
>>    __do_insl
>>    ^
>>    arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do=
_insl'
>>    #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b)=
, (n))
>>                                           ~~~~~~~~~~~~~~~~~~~~~^
>>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>>    In file included from include/linux/interrupt.h:11:
>>    In file included from include/linux/hardirq.h:10:
>>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>>    In file included from include/linux/irq.h:20:
>>    In file included from include/linux/io.h:13:
>>    In file included from arch/powerpc/include/asm/io.h:619:
>>    arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>>    DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned lon=
g c),
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>>                    __do_##name al;                                 \
>>                    ^~~~~~~~~~~~~~
>>    <scratch space>:215:1: note: expanded from here
>>    __do_outsb
>>    ^
>>    arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do=
_outsb'
>>    #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b)=
,(n))
>>                                            ~~~~~~~~~~~~~~~~~~~~~^
>>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>>    In file included from include/linux/interrupt.h:11:
>>    In file included from include/linux/hardirq.h:10:
>>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>>    In file included from include/linux/irq.h:20:
>>    In file included from include/linux/io.h:13:
>>    In file included from arch/powerpc/include/asm/io.h:619:
>>    arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>>    DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned lon=
g c),
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>>                    __do_##name al;                                 \
>>                    ^~~~~~~~~~~~~~
>>    <scratch space>:217:1: note: expanded from here
>>    __do_outsw
>>    ^
>>    arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do=
_outsw'
>>    #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b)=
,(n))
>>                                            ~~~~~~~~~~~~~~~~~~~~~^
>>    In file included from drivers/memory/tegra/tegra30-emc.c:18:
>>    In file included from include/linux/interrupt.h:11:
>>    In file included from include/linux/hardirq.h:10:
>>    In file included from arch/powerpc/include/asm/hardirq.h:6:
>>    In file included from include/linux/irq.h:20:
>>    In file included from include/linux/io.h:13:
>>    In file included from arch/powerpc/include/asm/io.h:619:
>>    arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>>    DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned lon=
g c),
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>>                    __do_##name al;                                 \
>>                    ^~~~~~~~~~~~~~
>>    <scratch space>:219:1: note: expanded from here
>>    __do_outsl
>>    ^
>>    arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do=
_outsl'
>>    #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b)=
,(n))
>>                                            ~~~~~~~~~~~~~~~~~~~~~^
>>>> drivers/memory/tegra/tegra30-emc.c:757:18: warning: implicit conversio=
n from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 184=
46744071562067985 to 2147483665 [-Wconstant-conversion]
>>                    writel_relaxed(EMC_ZQ_CAL_LONG_CMD_DEV0,
>>                    ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
>>    drivers/memory/tegra/tegra30-emc.c:161:36: note: expanded from macro =
'EMC_ZQ_CAL_LONG_CMD_DEV0'
>>            (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
>>                                              ^
>>    arch/powerpc/include/asm/io.h:679:40: note: expanded from macro 'writ=
el_relaxed'
>>    #define writel_relaxed(v, addr) writel(v, addr)
>>                                    ~~~~~~ ^
>>    13 warnings generated.
>> --
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>>                    __do_##name al;                                 \
>>                    ^~~~~~~~~~~~~~
>>    <scratch space>:203:1: note: expanded from here
>>    __do_outl
>>    ^
>>    arch/powerpc/include/asm/io.h:537:62: note: expanded from macro '__do=
_outl'
>>    #define __do_outl(val, port)    writel(val,(PCI_IO_ADDR)_IO_BASE+port=
);
>>                                               ~~~~~~~~~~~~~~~~~~~~~^
>>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>>    In file included from include/linux/io.h:13:
>>    In file included from arch/powerpc/include/asm/io.h:619:
>>    arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>>    DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>>                    __do_##name al;                                 \
>>                    ^~~~~~~~~~~~~~
>>    <scratch space>:217:1: note: expanded from here
>>    __do_insb
>>    ^
>>    arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do=
_insb'
>>    #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b)=
, (n))
>>                                           ~~~~~~~~~~~~~~~~~~~~~^
>>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>>    In file included from include/linux/io.h:13:
>>    In file included from arch/powerpc/include/asm/io.h:619:
>>    arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>>    DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>>                    __do_##name al;                                 \
>>                    ^~~~~~~~~~~~~~
>>    <scratch space>:219:1: note: expanded from here
>>    __do_insw
>>    ^
>>    arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do=
_insw'
>>    #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b)=
, (n))
>>                                           ~~~~~~~~~~~~~~~~~~~~~^
>>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>>    In file included from include/linux/io.h:13:
>>    In file included from arch/powerpc/include/asm/io.h:619:
>>    arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>>    DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>>                    __do_##name al;                                 \
>>                    ^~~~~~~~~~~~~~
>>    <scratch space>:221:1: note: expanded from here
>>    __do_insl
>>    ^
>>    arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do=
_insl'
>>    #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b)=
, (n))
>>                                           ~~~~~~~~~~~~~~~~~~~~~^
>>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>>    In file included from include/linux/io.h:13:
>>    In file included from arch/powerpc/include/asm/io.h:619:
>>    arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>>    DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned lon=
g c),
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>>                    __do_##name al;                                 \
>>                    ^~~~~~~~~~~~~~
>>    <scratch space>:223:1: note: expanded from here
>>    __do_outsb
>>    ^
>>    arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do=
_outsb'
>>    #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b)=
,(n))
>>                                            ~~~~~~~~~~~~~~~~~~~~~^
>>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>>    In file included from include/linux/io.h:13:
>>    In file included from arch/powerpc/include/asm/io.h:619:
>>    arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>>    DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned lon=
g c),
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>>                    __do_##name al;                                 \
>>                    ^~~~~~~~~~~~~~
>>    <scratch space>:225:1: note: expanded from here
>>    __do_outsw
>>    ^
>>    arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do=
_outsw'
>>    #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b)=
,(n))
>>                                            ~~~~~~~~~~~~~~~~~~~~~^
>>    In file included from drivers/memory/tegra/tegra124-emc.c:16:
>>    In file included from include/linux/io.h:13:
>>    In file included from arch/powerpc/include/asm/io.h:619:
>>    arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic]
>>    DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned lon=
g c),
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>>    arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_P=
CI_AC_NORET'
>>                    __do_##name al;                                 \
>>                    ^~~~~~~~~~~~~~
>>    <scratch space>:227:1: note: expanded from here
>>    __do_outsl
>>    ^
>>    arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do=
_outsl'
>>    #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b)=
,(n))
>>                                            ~~~~~~~~~~~~~~~~~~~~~^
>>>> drivers/memory/tegra/tegra124-emc.c:802:26: warning: implicit conversi=
on from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18=
446744071562067985 to 2147483665 [-Wconstant-conversion]
>>                    emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV0, EMC_=
ZQ_CAL);
>>                    ~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~~~~~~~~~
>>    drivers/memory/tegra/tegra124-emc.c:154:36: note: expanded from macro=
 'EMC_ZQ_CAL_LONG_CMD_DEV0'
>>            (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
>>             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
>>    13 warnings generated.
> =

> This doesn't look like a useful warning from clang, it should see that
> the constant value itself isn't truncated, hence it should be a problem
> of clang. Do you think it's okay to ignore this nonsense?

I admit I also do not see the real issue here. The DRAM_DEV_SEL_0 fits
in u32 and there is no other bitwise arithmetic than just OR, so why
clang assumes it can have 32 most signifcant bits toggled on?

+Cc Nathan and Nick,
Maybe you could shed some light here on this warning?

Dmitry,
In general you should not ignore it because:
1. This breaks allyesconfig with clang on powerpc (or it is one of the
stoppers),
2. We might want in some future to build it with clang.


Best regards,
Krzysztof
--===============2045471124562530916==--

