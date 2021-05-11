Content-Type: multipart/mixed; boundary="===============4321092079376838103=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all drivers
Date: Tue, 11 May 2021 21:58:05 +0800
Message-ID: <202105112125.VctfC6sX-lkp@intel.com>
In-Reply-To: <20210510213729.7095-3-digetx@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4321092079376838103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on v5.13-rc1 next-20210511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/Enable-com=
pile-testing-for-Tegra-memory-drivers/20210511-053910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for=
-next
config: powerpc-randconfig-r032-20210511 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0fed6=
35fe1701470062495a6ffee1c608f3f1bc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/0day-ci/linux/commit/ecd67b1d49eb33c9821130a2b=
3b896bab395118d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dmitry-Osipenko/Enable-compile-tes=
ting-for-Tegra-memory-drivers/20210511-053910
        git checkout ecd67b1d49eb33c9821130a2b3b896bab395118d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   __do_insb
   ^
   arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do_in=
sb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/memory/tegra/tegra30-emc.c:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:211:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_in=
sw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/memory/tegra/tegra30-emc.c:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:213:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/memory/tegra/tegra30-emc.c:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:215:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/memory/tegra/tegra30-emc.c:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:217:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/memory/tegra/tegra30-emc.c:18:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:219:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/memory/tegra/tegra30-emc.c:757:18: warning: implicit conversion =
from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446=
744071562067985 to 2147483665 [-Wconstant-conversion]
                   writel_relaxed(EMC_ZQ_CAL_LONG_CMD_DEV0,
                   ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra30-emc.c:161:36: note: expanded from macro 'EM=
C_ZQ_CAL_LONG_CMD_DEV0'
           (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
                                             ^
   arch/powerpc/include/asm/io.h:679:40: note: expanded from macro 'writel_=
relaxed'
   #define writel_relaxed(v, addr) writel(v, addr)
                                   ~~~~~~ ^
   13 warnings generated.
--
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:203:1: note: expanded from here
   __do_outl
   ^
   arch/powerpc/include/asm/io.h:537:62: note: expanded from macro '__do_ou=
tl'
   #define __do_outl(val, port)    writel(val,(PCI_IO_ADDR)_IO_BASE+port);
                                              ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/memory/tegra/tegra124-emc.c:16:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:217:1: note: expanded from here
   __do_insb
   ^
   arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do_in=
sb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/memory/tegra/tegra124-emc.c:16:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:219:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_in=
sw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/memory/tegra/tegra124-emc.c:16:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:221:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/memory/tegra/tegra124-emc.c:16:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:223:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/memory/tegra/tegra124-emc.c:16:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:225:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/memory/tegra/tegra124-emc.c:16:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:227:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/memory/tegra/tegra124-emc.c:802:26: warning: implicit conversion=
 from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 1844=
6744071562067985 to 2147483665 [-Wconstant-conversion]
                   emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV0, EMC_ZQ_=
CAL);
                   ~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra124-emc.c:154:36: note: expanded from macro 'E=
MC_ZQ_CAL_LONG_CMD_DEV0'
           (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   13 warnings generated.


vim +757 drivers/memory/tegra/tegra30-emc.c

e34212c75a6899 Dmitry Osipenko 2019-08-12  507  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  508  static int emc_prepare_timi=
ng_change(struct tegra_emc *emc, unsigned long rate)
e34212c75a6899 Dmitry Osipenko 2019-08-12  509  {
e34212c75a6899 Dmitry Osipenko 2019-08-12  510  	struct emc_timing *timing =
=3D emc_find_timing(emc, rate);
e34212c75a6899 Dmitry Osipenko 2019-08-12  511  	enum emc_dll_change dll_ch=
ange;
e34212c75a6899 Dmitry Osipenko 2019-08-12  512  	enum emc_dram_type dram_ty=
pe;
e34212c75a6899 Dmitry Osipenko 2019-08-12  513  	bool schmitt_to_vref =3D f=
alse;
e34212c75a6899 Dmitry Osipenko 2019-08-12  514  	unsigned int pre_wait =3D =
0;
e34212c75a6899 Dmitry Osipenko 2019-08-12  515  	bool qrst_used =3D false;
e34212c75a6899 Dmitry Osipenko 2019-08-12  516  	unsigned int dram_num;
e34212c75a6899 Dmitry Osipenko 2019-08-12  517  	unsigned int i;
e34212c75a6899 Dmitry Osipenko 2019-08-12  518  	u32 fbio_cfg5;
e34212c75a6899 Dmitry Osipenko 2019-08-12  519  	u32 emc_dbg;
e34212c75a6899 Dmitry Osipenko 2019-08-12  520  	u32 val;
e34212c75a6899 Dmitry Osipenko 2019-08-12  521  	int err;
e34212c75a6899 Dmitry Osipenko 2019-08-12  522  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  523  	if (!timing || emc->bad_st=
ate)
e34212c75a6899 Dmitry Osipenko 2019-08-12  524  		return -EINVAL;
e34212c75a6899 Dmitry Osipenko 2019-08-12  525  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  526  	dev_dbg(emc->dev, "%s: usi=
ng timing rate %lu for requested rate %lu\n",
e34212c75a6899 Dmitry Osipenko 2019-08-12  527  		__func__, timing->rate, r=
ate);
e34212c75a6899 Dmitry Osipenko 2019-08-12  528  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  529  	emc->bad_state =3D true;
e34212c75a6899 Dmitry Osipenko 2019-08-12  530  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  531  	err =3D emc_prepare_mc_clk=
_cfg(emc, rate);
e34212c75a6899 Dmitry Osipenko 2019-08-12  532  	if (err) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  533  		dev_err(emc->dev, "mc clo=
ck preparation failed: %d\n", err);
e34212c75a6899 Dmitry Osipenko 2019-08-12  534  		return err;
e34212c75a6899 Dmitry Osipenko 2019-08-12  535  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  536  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  537  	emc->vref_cal_toggle =3D f=
alse;
e34212c75a6899 Dmitry Osipenko 2019-08-12  538  	emc->mc_override =3D mc_re=
adl(emc->mc, MC_EMEM_ARB_OVERRIDE);
e34212c75a6899 Dmitry Osipenko 2019-08-12  539  	emc->emc_cfg =3D readl_rel=
axed(emc->regs + EMC_CFG);
e34212c75a6899 Dmitry Osipenko 2019-08-12  540  	emc_dbg =3D readl_relaxed(=
emc->regs + EMC_DBG);
e34212c75a6899 Dmitry Osipenko 2019-08-12  541  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  542  	if (emc->dll_on =3D=3D !!(=
timing->emc_mode_1 & 0x1))
e34212c75a6899 Dmitry Osipenko 2019-08-12  543  		dll_change =3D DLL_CHANGE=
_NONE;
e34212c75a6899 Dmitry Osipenko 2019-08-12  544  	else if (timing->emc_mode_=
1 & 0x1)
e34212c75a6899 Dmitry Osipenko 2019-08-12  545  		dll_change =3D DLL_CHANGE=
_ON;
e34212c75a6899 Dmitry Osipenko 2019-08-12  546  	else
e34212c75a6899 Dmitry Osipenko 2019-08-12  547  		dll_change =3D DLL_CHANGE=
_OFF;
e34212c75a6899 Dmitry Osipenko 2019-08-12  548  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  549  	emc->dll_on =3D !!(timing-=
>emc_mode_1 & 0x1);
e34212c75a6899 Dmitry Osipenko 2019-08-12  550  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  551  	if (timing->data[80] && !r=
eadl_relaxed(emc->regs + EMC_ZCAL_INTERVAL))
e34212c75a6899 Dmitry Osipenko 2019-08-12  552  		emc->zcal_long =3D true;
e34212c75a6899 Dmitry Osipenko 2019-08-12  553  	else
e34212c75a6899 Dmitry Osipenko 2019-08-12  554  		emc->zcal_long =3D false;
e34212c75a6899 Dmitry Osipenko 2019-08-12  555  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  556  	fbio_cfg5 =3D readl_relaxe=
d(emc->regs + EMC_FBIO_CFG5);
e34212c75a6899 Dmitry Osipenko 2019-08-12  557  	dram_type =3D fbio_cfg5 & =
EMC_FBIO_CFG5_DRAM_TYPE_MASK;
e34212c75a6899 Dmitry Osipenko 2019-08-12  558  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  559  	dram_num =3D tegra_mc_get_=
emem_device_count(emc->mc);
e34212c75a6899 Dmitry Osipenko 2019-08-12  560  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  561  	/* disable dynamic self-re=
fresh */
e34212c75a6899 Dmitry Osipenko 2019-08-12  562  	if (emc->emc_cfg & EMC_CFG=
_DYN_SREF_ENABLE) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  563  		emc->emc_cfg &=3D ~EMC_CF=
G_DYN_SREF_ENABLE;
e34212c75a6899 Dmitry Osipenko 2019-08-12  564  		writel_relaxed(emc->emc_c=
fg, emc->regs + EMC_CFG);
e34212c75a6899 Dmitry Osipenko 2019-08-12  565  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  566  		pre_wait =3D 5;
e34212c75a6899 Dmitry Osipenko 2019-08-12  567  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  568  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  569  	/* update MC arbiter setti=
ngs */
e34212c75a6899 Dmitry Osipenko 2019-08-12  570  	val =3D mc_readl(emc->mc, =
MC_EMEM_ARB_OUTSTANDING_REQ);
e34212c75a6899 Dmitry Osipenko 2019-08-12  571  	if (!(val & MC_EMEM_ARB_OU=
TSTANDING_REQ_HOLDOFF_OVERRIDE) ||
e34212c75a6899 Dmitry Osipenko 2019-08-12  572  	    ((val & MC_EMEM_ARB_OU=
TSTANDING_REQ_MAX_MASK) > 0x50)) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  573  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  574  		val =3D MC_EMEM_ARB_OUTST=
ANDING_REQ_LIMIT_ENABLE |
e34212c75a6899 Dmitry Osipenko 2019-08-12  575  		      MC_EMEM_ARB_OUTSTAN=
DING_REQ_HOLDOFF_OVERRIDE | 0x50;
e34212c75a6899 Dmitry Osipenko 2019-08-12  576  		mc_writel(emc->mc, val, M=
C_EMEM_ARB_OUTSTANDING_REQ);
e34212c75a6899 Dmitry Osipenko 2019-08-12  577  		mc_writel(emc->mc, MC_TIM=
ING_UPDATE, MC_TIMING_CONTROL);
e34212c75a6899 Dmitry Osipenko 2019-08-12  578  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  579  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  580  	if (emc->mc_override & MC_=
EMEM_ARB_OVERRIDE_EACK_MASK)
e34212c75a6899 Dmitry Osipenko 2019-08-12  581  		mc_writel(emc->mc,
e34212c75a6899 Dmitry Osipenko 2019-08-12  582  			  emc->mc_override & ~MC=
_EMEM_ARB_OVERRIDE_EACK_MASK,
e34212c75a6899 Dmitry Osipenko 2019-08-12  583  			  MC_EMEM_ARB_OVERRIDE);
e34212c75a6899 Dmitry Osipenko 2019-08-12  584  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  585  	/* check DQ/DQS VREF delay=
 */
e34212c75a6899 Dmitry Osipenko 2019-08-12  586  	if (emc_dqs_preset(emc, ti=
ming, &schmitt_to_vref)) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  587  		if (pre_wait < 3)
e34212c75a6899 Dmitry Osipenko 2019-08-12  588  			pre_wait =3D 3;
e34212c75a6899 Dmitry Osipenko 2019-08-12  589  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  590  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  591  	if (pre_wait) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  592  		err =3D emc_seq_update_ti=
ming(emc);
e34212c75a6899 Dmitry Osipenko 2019-08-12  593  		if (err)
e34212c75a6899 Dmitry Osipenko 2019-08-12  594  			return err;
e34212c75a6899 Dmitry Osipenko 2019-08-12  595  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  596  		udelay(pre_wait);
e34212c75a6899 Dmitry Osipenko 2019-08-12  597  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  598  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  599  	/* disable auto-calibratio=
n if VREF mode is switching */
e34212c75a6899 Dmitry Osipenko 2019-08-12  600  	if (timing->emc_auto_cal_i=
nterval) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  601  		val =3D readl_relaxed(emc=
->regs + EMC_XM2COMPPADCTRL);
e34212c75a6899 Dmitry Osipenko 2019-08-12  602  		val ^=3D timing->data[74];
e34212c75a6899 Dmitry Osipenko 2019-08-12  603  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  604  		if (val & EMC_XM2COMPPADC=
TRL_VREF_CAL_ENABLE) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  605  			writel_relaxed(0, emc->r=
egs + EMC_AUTO_CAL_INTERVAL);
e34212c75a6899 Dmitry Osipenko 2019-08-12  606  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  607  			err =3D readl_relaxed_po=
ll_timeout_atomic(
e34212c75a6899 Dmitry Osipenko 2019-08-12  608  				emc->regs + EMC_AUTO_CA=
L_STATUS, val,
e34212c75a6899 Dmitry Osipenko 2019-08-12  609  				!(val & EMC_AUTO_CAL_ST=
ATUS_ACTIVE), 1, 300);
e34212c75a6899 Dmitry Osipenko 2019-08-12  610  			if (err) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  611  				dev_err(emc->dev,
5e5eca6644873d Dmitry Osipenko 2019-12-20  612  					"auto-cal finish timeo=
ut: %d\n", err);
e34212c75a6899 Dmitry Osipenko 2019-08-12  613  				return err;
e34212c75a6899 Dmitry Osipenko 2019-08-12  614  			}
e34212c75a6899 Dmitry Osipenko 2019-08-12  615  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  616  			emc->vref_cal_toggle =3D=
 true;
e34212c75a6899 Dmitry Osipenko 2019-08-12  617  		}
e34212c75a6899 Dmitry Osipenko 2019-08-12  618  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  619  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  620  	/* program shadow register=
s */
e34212c75a6899 Dmitry Osipenko 2019-08-12  621  	for (i =3D 0; i < ARRAY_SI=
ZE(timing->data); i++) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  622  		/* EMC_XM2CLKPADCTRL shou=
ld be programmed separately */
e34212c75a6899 Dmitry Osipenko 2019-08-12  623  		if (i !=3D 73)
e34212c75a6899 Dmitry Osipenko 2019-08-12  624  			writel_relaxed(timing->d=
ata[i],
e34212c75a6899 Dmitry Osipenko 2019-08-12  625  				       emc->regs + emc_=
timing_registers[i]);
e34212c75a6899 Dmitry Osipenko 2019-08-12  626  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  627  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  628  	err =3D tegra_mc_write_eme=
m_configuration(emc->mc, timing->rate);
e34212c75a6899 Dmitry Osipenko 2019-08-12  629  	if (err)
e34212c75a6899 Dmitry Osipenko 2019-08-12  630  		return err;
e34212c75a6899 Dmitry Osipenko 2019-08-12  631  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  632  	/* DDR3: predict MRS long =
wait count */
e34212c75a6899 Dmitry Osipenko 2019-08-12  633  	if (dram_type =3D=3D DRAM_=
TYPE_DDR3 && dll_change =3D=3D DLL_CHANGE_ON) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  634  		u32 cnt =3D 512;
e34212c75a6899 Dmitry Osipenko 2019-08-12  635  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  636  		if (emc->zcal_long)
e34212c75a6899 Dmitry Osipenko 2019-08-12  637  			cnt -=3D dram_num * 256;
e34212c75a6899 Dmitry Osipenko 2019-08-12  638  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  639  		val =3D timing->data[82] =
& EMC_MRS_WAIT_CNT_SHORT_WAIT_MASK;
e34212c75a6899 Dmitry Osipenko 2019-08-12  640  		if (cnt < val)
e34212c75a6899 Dmitry Osipenko 2019-08-12  641  			cnt =3D val;
e34212c75a6899 Dmitry Osipenko 2019-08-12  642  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  643  		val =3D timing->data[82] =
& ~EMC_MRS_WAIT_CNT_LONG_WAIT_MASK;
e34212c75a6899 Dmitry Osipenko 2019-08-12  644  		val |=3D (cnt << EMC_MRS_=
WAIT_CNT_LONG_WAIT_SHIFT) &
e34212c75a6899 Dmitry Osipenko 2019-08-12  645  			EMC_MRS_WAIT_CNT_LONG_WA=
IT_MASK;
e34212c75a6899 Dmitry Osipenko 2019-08-12  646  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  647  		writel_relaxed(val, emc->=
regs + EMC_MRS_WAIT_CNT);
e34212c75a6899 Dmitry Osipenko 2019-08-12  648  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  649  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  650  	/* this read also complete=
s the writes */
e34212c75a6899 Dmitry Osipenko 2019-08-12  651  	val =3D readl_relaxed(emc-=
>regs + EMC_SEL_DPD_CTRL);
e34212c75a6899 Dmitry Osipenko 2019-08-12  652  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  653  	if (!(val & EMC_SEL_DPD_CT=
RL_QUSE_DPD_ENABLE) && schmitt_to_vref) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  654  		u32 cur_mode, new_mode;
e34212c75a6899 Dmitry Osipenko 2019-08-12  655  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  656  		cur_mode =3D fbio_cfg5 & =
EMC_CFG5_QUSE_MODE_MASK;
e34212c75a6899 Dmitry Osipenko 2019-08-12  657  		cur_mode >>=3D EMC_CFG5_Q=
USE_MODE_SHIFT;
e34212c75a6899 Dmitry Osipenko 2019-08-12  658  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  659  		new_mode =3D timing->data=
[39] & EMC_CFG5_QUSE_MODE_MASK;
e34212c75a6899 Dmitry Osipenko 2019-08-12  660  		new_mode >>=3D EMC_CFG5_Q=
USE_MODE_SHIFT;
e34212c75a6899 Dmitry Osipenko 2019-08-12  661  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  662  		if ((cur_mode !=3D EMC_CF=
G5_QUSE_MODE_PULSE_INTERN &&
e34212c75a6899 Dmitry Osipenko 2019-08-12  663  		     cur_mode !=3D EMC_CF=
G5_QUSE_MODE_INTERNAL_LPBK) ||
e34212c75a6899 Dmitry Osipenko 2019-08-12  664  		    (new_mode !=3D EMC_CF=
G5_QUSE_MODE_PULSE_INTERN &&
e34212c75a6899 Dmitry Osipenko 2019-08-12  665  		     new_mode !=3D EMC_CF=
G5_QUSE_MODE_INTERNAL_LPBK))
e34212c75a6899 Dmitry Osipenko 2019-08-12  666  			qrst_used =3D true;
e34212c75a6899 Dmitry Osipenko 2019-08-12  667  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  668  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  669  	/* flow control marker 1 */
e34212c75a6899 Dmitry Osipenko 2019-08-12  670  	writel_relaxed(0x1, emc->r=
egs + EMC_STALL_THEN_EXE_BEFORE_CLKCHANGE);
e34212c75a6899 Dmitry Osipenko 2019-08-12  671  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  672  	/* enable periodic reset */
e34212c75a6899 Dmitry Osipenko 2019-08-12  673  	if (qrst_used) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  674  		writel_relaxed(emc_dbg | =
EMC_DBG_WRITE_MUX_ACTIVE,
e34212c75a6899 Dmitry Osipenko 2019-08-12  675  			       emc->regs + EMC_D=
BG);
e34212c75a6899 Dmitry Osipenko 2019-08-12  676  		writel_relaxed(emc->emc_c=
fg | EMC_CFG_PERIODIC_QRST,
e34212c75a6899 Dmitry Osipenko 2019-08-12  677  			       emc->regs + EMC_C=
FG);
e34212c75a6899 Dmitry Osipenko 2019-08-12  678  		writel_relaxed(emc_dbg, e=
mc->regs + EMC_DBG);
e34212c75a6899 Dmitry Osipenko 2019-08-12  679  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  680  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  681  	/* disable auto-refresh to=
 save time after clock change */
e34212c75a6899 Dmitry Osipenko 2019-08-12  682  	writel_relaxed(EMC_REFCTRL=
_DISABLE_ALL(dram_num),
e34212c75a6899 Dmitry Osipenko 2019-08-12  683  		       emc->regs + EMC_RE=
FCTRL);
e34212c75a6899 Dmitry Osipenko 2019-08-12  684  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  685  	/* turn off DLL and enter =
self-refresh on DDR3 */
e34212c75a6899 Dmitry Osipenko 2019-08-12  686  	if (dram_type =3D=3D DRAM_=
TYPE_DDR3) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  687  		if (dll_change =3D=3D DLL=
_CHANGE_OFF)
e34212c75a6899 Dmitry Osipenko 2019-08-12  688  			writel_relaxed(timing->e=
mc_mode_1,
e34212c75a6899 Dmitry Osipenko 2019-08-12  689  				       emc->regs + EMC_=
EMRS);
e34212c75a6899 Dmitry Osipenko 2019-08-12  690  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  691  		writel_relaxed(DRAM_BROAD=
CAST(dram_num) |
e34212c75a6899 Dmitry Osipenko 2019-08-12  692  			       EMC_SELF_REF_CMD_=
ENABLED,
e34212c75a6899 Dmitry Osipenko 2019-08-12  693  			       emc->regs + EMC_S=
ELF_REF);
e34212c75a6899 Dmitry Osipenko 2019-08-12  694  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  695  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  696  	/* flow control marker 2 */
e34212c75a6899 Dmitry Osipenko 2019-08-12  697  	writel_relaxed(0x1, emc->r=
egs + EMC_STALL_THEN_EXE_AFTER_CLKCHANGE);
e34212c75a6899 Dmitry Osipenko 2019-08-12  698  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  699  	/* enable write-active MUX=
, update unshadowed pad control */
e34212c75a6899 Dmitry Osipenko 2019-08-12  700  	writel_relaxed(emc_dbg | E=
MC_DBG_WRITE_MUX_ACTIVE, emc->regs + EMC_DBG);
e34212c75a6899 Dmitry Osipenko 2019-08-12  701  	writel_relaxed(timing->dat=
a[73], emc->regs + EMC_XM2CLKPADCTRL);
e34212c75a6899 Dmitry Osipenko 2019-08-12  702  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  703  	/* restore periodic QRST a=
nd disable write-active MUX */
e34212c75a6899 Dmitry Osipenko 2019-08-12  704  	val =3D !!(emc->emc_cfg & =
EMC_CFG_PERIODIC_QRST);
e34212c75a6899 Dmitry Osipenko 2019-08-12  705  	if (qrst_used || timing->e=
mc_cfg_periodic_qrst !=3D val) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  706  		if (timing->emc_cfg_perio=
dic_qrst)
e34212c75a6899 Dmitry Osipenko 2019-08-12  707  			emc->emc_cfg |=3D EMC_CF=
G_PERIODIC_QRST;
e34212c75a6899 Dmitry Osipenko 2019-08-12  708  		else
e34212c75a6899 Dmitry Osipenko 2019-08-12  709  			emc->emc_cfg &=3D ~EMC_C=
FG_PERIODIC_QRST;
e34212c75a6899 Dmitry Osipenko 2019-08-12  710  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  711  		writel_relaxed(emc->emc_c=
fg, emc->regs + EMC_CFG);
e34212c75a6899 Dmitry Osipenko 2019-08-12  712  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  713  	writel_relaxed(emc_dbg, em=
c->regs + EMC_DBG);
e34212c75a6899 Dmitry Osipenko 2019-08-12  714  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  715  	/* exit self-refresh on DD=
R3 */
e34212c75a6899 Dmitry Osipenko 2019-08-12  716  	if (dram_type =3D=3D DRAM_=
TYPE_DDR3)
e34212c75a6899 Dmitry Osipenko 2019-08-12  717  		writel_relaxed(DRAM_BROAD=
CAST(dram_num),
e34212c75a6899 Dmitry Osipenko 2019-08-12  718  			       emc->regs + EMC_S=
ELF_REF);
e34212c75a6899 Dmitry Osipenko 2019-08-12  719  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  720  	/* set DRAM-mode registers=
 */
e34212c75a6899 Dmitry Osipenko 2019-08-12  721  	if (dram_type =3D=3D DRAM_=
TYPE_DDR3) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  722  		if (timing->emc_mode_1 !=
=3D emc->emc_mode_1)
e34212c75a6899 Dmitry Osipenko 2019-08-12  723  			writel_relaxed(timing->e=
mc_mode_1,
e34212c75a6899 Dmitry Osipenko 2019-08-12  724  				       emc->regs + EMC_=
EMRS);
e34212c75a6899 Dmitry Osipenko 2019-08-12  725  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  726  		if (timing->emc_mode_2 !=
=3D emc->emc_mode_2)
e34212c75a6899 Dmitry Osipenko 2019-08-12  727  			writel_relaxed(timing->e=
mc_mode_2,
e34212c75a6899 Dmitry Osipenko 2019-08-12  728  				       emc->regs + EMC_=
EMRS);
e34212c75a6899 Dmitry Osipenko 2019-08-12  729  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  730  		if (timing->emc_mode_rese=
t !=3D emc->emc_mode_reset ||
e34212c75a6899 Dmitry Osipenko 2019-08-12  731  		    dll_change =3D=3D DLL=
_CHANGE_ON) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  732  			val =3D timing->emc_mode=
_reset;
e34212c75a6899 Dmitry Osipenko 2019-08-12  733  			if (dll_change =3D=3D DL=
L_CHANGE_ON) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  734  				val |=3D EMC_MODE_SET_D=
LL_RESET;
e34212c75a6899 Dmitry Osipenko 2019-08-12  735  				val |=3D EMC_MODE_SET_L=
ONG_CNT;
e34212c75a6899 Dmitry Osipenko 2019-08-12  736  			} else {
e34212c75a6899 Dmitry Osipenko 2019-08-12  737  				val &=3D ~EMC_MODE_SET_=
DLL_RESET;
e34212c75a6899 Dmitry Osipenko 2019-08-12  738  			}
e34212c75a6899 Dmitry Osipenko 2019-08-12  739  			writel_relaxed(val, emc-=
>regs + EMC_MRS);
e34212c75a6899 Dmitry Osipenko 2019-08-12  740  		}
e34212c75a6899 Dmitry Osipenko 2019-08-12  741  	} else {
e34212c75a6899 Dmitry Osipenko 2019-08-12  742  		if (timing->emc_mode_2 !=
=3D emc->emc_mode_2)
e34212c75a6899 Dmitry Osipenko 2019-08-12  743  			writel_relaxed(timing->e=
mc_mode_2,
e34212c75a6899 Dmitry Osipenko 2019-08-12  744  				       emc->regs + EMC_=
MRW);
e34212c75a6899 Dmitry Osipenko 2019-08-12  745  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  746  		if (timing->emc_mode_1 !=
=3D emc->emc_mode_1)
e34212c75a6899 Dmitry Osipenko 2019-08-12  747  			writel_relaxed(timing->e=
mc_mode_1,
e34212c75a6899 Dmitry Osipenko 2019-08-12  748  				       emc->regs + EMC_=
MRW);
e34212c75a6899 Dmitry Osipenko 2019-08-12  749  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  750  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  751  	emc->emc_mode_1 =3D timing=
->emc_mode_1;
e34212c75a6899 Dmitry Osipenko 2019-08-12  752  	emc->emc_mode_2 =3D timing=
->emc_mode_2;
e34212c75a6899 Dmitry Osipenko 2019-08-12  753  	emc->emc_mode_reset =3D ti=
ming->emc_mode_reset;
e34212c75a6899 Dmitry Osipenko 2019-08-12  754  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  755  	/* issue ZCAL command if t=
urning ZCAL on */
e34212c75a6899 Dmitry Osipenko 2019-08-12  756  	if (emc->zcal_long) {
e34212c75a6899 Dmitry Osipenko 2019-08-12 @757  		writel_relaxed(EMC_ZQ_CAL=
_LONG_CMD_DEV0,
e34212c75a6899 Dmitry Osipenko 2019-08-12  758  			       emc->regs + EMC_Z=
Q_CAL);
e34212c75a6899 Dmitry Osipenko 2019-08-12  759  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  760  		if (dram_num > 1)
e34212c75a6899 Dmitry Osipenko 2019-08-12  761  			writel_relaxed(EMC_ZQ_CA=
L_LONG_CMD_DEV1,
e34212c75a6899 Dmitry Osipenko 2019-08-12  762  				       emc->regs + EMC_=
ZQ_CAL);
e34212c75a6899 Dmitry Osipenko 2019-08-12  763  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  764  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  765  	/* flow control marker 3 */
e34212c75a6899 Dmitry Osipenko 2019-08-12  766  	writel_relaxed(0x1, emc->r=
egs + EMC_UNSTALL_RW_AFTER_CLKCHANGE);
e34212c75a6899 Dmitry Osipenko 2019-08-12  767  =

0f8bb9da5aee80 Dmitry Osipenko 2019-12-20  768  	/*
0f8bb9da5aee80 Dmitry Osipenko 2019-12-20  769  	 * Read and discard an arb=
itrary MC register (Note: EMC registers
0f8bb9da5aee80 Dmitry Osipenko 2019-12-20  770  	 * can't be used) to ensur=
e the register writes are completed.
0f8bb9da5aee80 Dmitry Osipenko 2019-12-20  771  	 */
0f8bb9da5aee80 Dmitry Osipenko 2019-12-20  772  	mc_readl(emc->mc, MC_EMEM_=
ARB_OVERRIDE);
0f8bb9da5aee80 Dmitry Osipenko 2019-12-20  773  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  774  	return 0;
e34212c75a6899 Dmitry Osipenko 2019-08-12  775  }
e34212c75a6899 Dmitry Osipenko 2019-08-12  776  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4321092079376838103==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
U/H+PwlSjWNK3QEA
--===============4321092079376838103==--

