Content-Type: multipart/mixed; boundary="===============1889176267680024665=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [sashal-linux-stable:queue-5.4 210/316] drivers/usb/dwc2/core_intr.c:707:9: error: no member named 'bus_suspended' in 'struct dwc2_hsotg'
Date: Sun, 09 May 2021 07:36:39 +0800
Message-ID: <202105090735.Q2Qrns3k-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1889176267680024665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git queue-5.4
head:   1cbc6d07a3275557994ab89c244b3dff503005fe
commit: b081425be02251b4fb1f9909e02c45d20c06e2af [210/316] usb: dwc2: Fix h=
ibernation between host and device modes.
config: powerpc-randconfig-r022-20210509 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 131285=
2040b3190a6cb7d7c1f61fe95a5e930d8d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stab=
le.git/commit/?id=3Db081425be02251b4fb1f9909e02c45d20c06e2af
        git remote add sashal-linux-stable https://git.kernel.org/pub/scm/l=
inux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-linux-stable queue-5.4
        git checkout b081425be02251b4fb1f9909e02c45d20c06e2af
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   __do_insb
   ^
   arch/powerpc/include/asm/io.h:542:56: note: expanded from macro '__do_in=
sb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/usb/dwc2/core_intr.c:45:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:9:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:605:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:602:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:127:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do_in=
sw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/usb/dwc2/core_intr.c:45:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:9:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:605:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:602:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:129:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:544:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/usb/dwc2/core_intr.c:45:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:9:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:605:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:602:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:131:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/usb/dwc2/core_intr.c:45:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:9:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:605:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:602:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:133:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/usb/dwc2/core_intr.c:45:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:9:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:605:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:602:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:135:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:547:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/usb/dwc2/core_intr.c:707:9: error: no member named 'bus_suspende=
d' in 'struct dwc2_hsotg'
           hsotg->bus_suspended =3D 0;
           ~~~~~  ^
   12 warnings and 1 error generated.


vim +707 drivers/usb/dwc2/core_intr.c

   659	=

   660	/**
   661	 * dwc_handle_gpwrdn_disc_det() - Handles the gpwrdn disconnect dete=
ct.
   662	 * Exits hibernation without restoring registers.
   663	 *
   664	 * @hsotg: Programming view of DWC_otg controller
   665	 * @gpwrdn: GPWRDN register
   666	 */
   667	static inline void dwc_handle_gpwrdn_disc_det(struct dwc2_hsotg *hso=
tg,
   668						      u32 gpwrdn)
   669	{
   670		u32 gpwrdn_tmp;
   671	=

   672		/* Switch-on voltage to the core */
   673		gpwrdn_tmp =3D dwc2_readl(hsotg, GPWRDN);
   674		gpwrdn_tmp &=3D ~GPWRDN_PWRDNSWTCH;
   675		dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
   676		udelay(5);
   677	=

   678		/* Reset core */
   679		gpwrdn_tmp =3D dwc2_readl(hsotg, GPWRDN);
   680		gpwrdn_tmp &=3D ~GPWRDN_PWRDNRSTN;
   681		dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
   682		udelay(5);
   683	=

   684		/* Disable Power Down Clamp */
   685		gpwrdn_tmp =3D dwc2_readl(hsotg, GPWRDN);
   686		gpwrdn_tmp &=3D ~GPWRDN_PWRDNCLMP;
   687		dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
   688		udelay(5);
   689	=

   690		/* Deassert reset core */
   691		gpwrdn_tmp =3D dwc2_readl(hsotg, GPWRDN);
   692		gpwrdn_tmp |=3D GPWRDN_PWRDNRSTN;
   693		dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
   694		udelay(5);
   695	=

   696		/* Disable PMU interrupt */
   697		gpwrdn_tmp =3D dwc2_readl(hsotg, GPWRDN);
   698		gpwrdn_tmp &=3D ~GPWRDN_PMUINTSEL;
   699		dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
   700	=

   701		/* De-assert Wakeup Logic */
   702		gpwrdn_tmp =3D dwc2_readl(hsotg, GPWRDN);
   703		gpwrdn_tmp &=3D ~GPWRDN_PMUACTV;
   704		dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
   705	=

   706		hsotg->hibernated =3D 0;
 > 707		hsotg->bus_suspended =3D 0;
   708	=

   709		if (gpwrdn & GPWRDN_IDSTS) {
   710			hsotg->op_state =3D OTG_STATE_B_PERIPHERAL;
   711			dwc2_core_init(hsotg, false);
   712			dwc2_enable_global_interrupts(hsotg);
   713			dwc2_hsotg_core_init_disconnected(hsotg, false);
   714			dwc2_hsotg_core_connect(hsotg);
   715		} else {
   716			hsotg->op_state =3D OTG_STATE_A_HOST;
   717	=

   718			/* Initialize the Core for Host mode */
   719			dwc2_core_init(hsotg, false);
   720			dwc2_enable_global_interrupts(hsotg);
   721			dwc2_hcd_start(hsotg);
   722		}
   723	}
   724	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1889176267680024665==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1889176267680024665==--

