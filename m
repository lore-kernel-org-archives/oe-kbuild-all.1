Content-Type: multipart/mixed; boundary="===============2223591723388814377=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] powerpc/features: Remove CPU_FTR_NODSISRALIGN
Date: Tue, 13 Oct 2020 04:10:45 +0800
Message-ID: <202010130404.VtUO3i24-lkp@intel.com>
In-Reply-To: <0346768708b69bdbfec82f6e5b0364962b9b6932.1602489812.git.christophe.leroy@csgroup.eu>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2223591723388814377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christophe,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.9 next-20201012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-f=
eatures-Remove-CPU_FTR_NODSISRALIGN/20201012-160453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
config: powerpc-randconfig-r024-20201012 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9fd60382753ab51a10fb3d11e=
a7423491e32122e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-features-=
Remove-CPU_FTR_NODSISRALIGN/20201012-160453
        git checkout 9fd60382753ab51a10fb3d11ea7423491e32122e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on SMP && (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOO=
KE
   Selected by
   - PM_SLEEP_SMP && SMP && (ARCH_SUSPEND_POSSIBLE || ARCH_HIBERNATION_POSS=
IBLE && PM_SLEEP
   In file included from arch/powerpc/include/asm/synch.h:6,
   from arch/powerpc/include/asm/bitops.h:43,
   from include/linux/bitops.h:29,
   from include/linux/kernel.h:12,
   from include/asm-generic/bug.h:20,
   from arch/powerpc/include/asm/bug.h:109,
   from include/linux/bug.h:5,
   from include/linux/page-flags.h:10,
   from kernel/bounds.c:10:
>> arch/powerpc/include/asm/cputable.h:411:47: error: 'CPU_FTR_NODSISRALIGN=
' undeclared here (not in a function)
   411 | #define CPU_FTRS_GENERIC_32 (CPU_FTR_COMMON | CPU_FTR_NODSISRALIGN)
   | ^~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/cputable.h:523:6: note: in expansion of macro '=
CPU_FTRS_GENERIC_32'
   523 | CPU_FTRS_GENERIC_32 |
   | ^~~~~~~~~~~~~~~~~~~
   Makefile arch block certs crypto drivers fs include init ipc kernel lib =
mm net scripts security sound source usr virt [scripts/Makefile.build:117: =
kernel/bounds.s] Error 1
   Target '__build' not remade because of errors.
   Makefile arch block certs crypto drivers fs include init ipc kernel lib =
mm net scripts security sound source usr virt [Makefile:1202: prepare0] Err=
or 2
   Target 'prepare' not remade because of errors.
   make: Makefile arch block certs crypto drivers fs include init ipc kerne=
l lib mm net scripts security sound source usr virt [Makefile:185: __sub-ma=
ke] Error 2
   make: Target 'prepare' not remade because of errors.

vim +/CPU_FTR_NODSISRALIGN +411 arch/powerpc/include/asm/cputable.h

10b35d9978ac35 include/asm-powerpc/cputable.h      Kumar Gala             2=
005-09-23  296  =

c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  297  #define CPU_FTRS_603	(CPU_FTR_COMMON | CPU_FTR_MAYBE_CAN_DO=
ZE | \
385e89d5b20f5a arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
018-11-28  298  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_PPC_LE | CPU_FTR_NOEXE=
CUTE)
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  299  #define CPU_FTRS_604	(CPU_FTR_COMMON | CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  300  #define CPU_FTRS_740_NOTAU	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  301  	    CPU_FTR_MAYBE_CAN_DOZE | CPU_FTR_L2CR | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  302  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  303  #define CPU_FTRS_740	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  304  	    CPU_FTR_MAYBE_CAN_DOZE | CPU_FTR_L2CR | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  305  	    CPU_FTR_TAU | CPU_FTR_MAYBE_CAN_NAP | \
fab5db97e44f76 include/asm-powerpc/cputable.h      Paul Mackerras         2=
006-06-07  306  	    CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  307  #define CPU_FTRS_750	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  308  	    CPU_FTR_MAYBE_CAN_DOZE | CPU_FTR_L2CR | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  309  	    CPU_FTR_TAU | CPU_FTR_MAYBE_CAN_NAP | \
fab5db97e44f76 include/asm-powerpc/cputable.h      Paul Mackerras         2=
006-06-07  310  	    CPU_FTR_PPC_LE)
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  311  #define CPU_FTRS_750CL	(CPU_FTRS_750)
b6f41cc8304ce0 include/asm-powerpc/cputable.h      Josh Boyer             2=
007-07-03  312  #define CPU_FTRS_750FX1	(CPU_FTRS_750 | CPU_FTR_DUAL_PLL_75=
0FX | CPU_FTR_NO_DPM)
b6f41cc8304ce0 include/asm-powerpc/cputable.h      Josh Boyer             2=
007-07-03  313  #define CPU_FTRS_750FX2	(CPU_FTRS_750 | CPU_FTR_NO_DPM)
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  314  #define CPU_FTRS_750FX	(CPU_FTRS_750 | CPU_FTR_DUAL_PLL_750=
FX)
b6f41cc8304ce0 include/asm-powerpc/cputable.h      Josh Boyer             2=
007-07-03  315  #define CPU_FTRS_750GX	(CPU_FTRS_750FX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  316  #define CPU_FTRS_7400_NOTAU	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  317  	    CPU_FTR_MAYBE_CAN_DOZE | CPU_FTR_L2CR | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  318  	    CPU_FTR_ALTIVEC_COMP | \
fab5db97e44f76 include/asm-powerpc/cputable.h      Paul Mackerras         2=
006-06-07  319  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  320  #define CPU_FTRS_7400	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  321  	    CPU_FTR_MAYBE_CAN_DOZE | CPU_FTR_L2CR | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  322  	    CPU_FTR_TAU | CPU_FTR_ALTIVEC_COMP | \
fab5db97e44f76 include/asm-powerpc/cputable.h      Paul Mackerras         2=
006-06-07  323  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  324  #define CPU_FTRS_7450_20	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  325  	    CPU_FTR_L2CR | CPU_FTR_ALTIVEC_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  326  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2=
007-11-10  327  	    CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE | CPU_FTR_NEED_=
PAIRED_STWCX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  328  #define CPU_FTRS_7450_21	(CPU_FTR_COMMON | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2=
006-03-23  329  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC=
_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  330  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2=
006-03-23  331  	    CPU_FTR_NAP_DISABLE_L2_PR | CPU_FTR_L3_DISABLE_NAP | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2=
007-11-10  332  	    CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE | CPU_FTR_NEED_=
PAIRED_STWCX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  333  #define CPU_FTRS_7450_23	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  334  	    CPU_FTR_NEED_PAIRED_STWCX | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2=
006-03-23  335  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC=
_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  336  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | \
fab5db97e44f76 include/asm-powerpc/cputable.h      Paul Mackerras         2=
006-06-07  337  	    CPU_FTR_NAP_DISABLE_L2_PR | CPU_FTR_NEED_COHERENT | CP=
U_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  338  #define CPU_FTRS_7455_1	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  339  	    CPU_FTR_NEED_PAIRED_STWCX | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2=
006-03-23  340  	    CPU_FTR_L2CR | CPU_FTR_ALTIVEC_COMP | CPU_FTR_L3CR | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  341  	    CPU_FTR_SPEC7450 | CPU_FTR_NEED_COHERENT | CPU_FTR_PPC=
_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  342  #define CPU_FTRS_7455_20	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  343  	    CPU_FTR_NEED_PAIRED_STWCX | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2=
006-03-23  344  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC=
_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  345  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2=
006-03-23  346  	    CPU_FTR_NAP_DISABLE_L2_PR | CPU_FTR_L3_DISABLE_NAP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  347  	    CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  348  #define CPU_FTRS_7455	(CPU_FTR_COMMON | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2=
006-03-23  349  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC=
_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  350  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | CPU_FTR_NAP_DISABLE_=
L2_PR | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2=
007-11-10  351  	    CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE | CPU_FTR_NEED_=
PAIRED_STWCX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  352  #define CPU_FTRS_7447_10	(CPU_FTR_COMMON | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2=
006-03-23  353  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC=
_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  354  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | CPU_FTR_NAP_DISABLE_=
L2_PR | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2=
007-11-10  355  	    CPU_FTR_NEED_COHERENT | CPU_FTR_NO_BTIC | CPU_FTR_PPC_=
LE | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2=
007-11-10  356  	    CPU_FTR_NEED_PAIRED_STWCX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  357  #define CPU_FTRS_7447	(CPU_FTR_COMMON | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2=
006-03-23  358  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC=
_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  359  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | CPU_FTR_NAP_DISABLE_=
L2_PR | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2=
007-11-10  360  	    CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE | CPU_FTR_NEED_=
PAIRED_STWCX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  361  #define CPU_FTRS_7447A	(CPU_FTR_COMMON | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2=
006-03-23  362  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC=
_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  363  	    CPU_FTR_SPEC7450 | CPU_FTR_NAP_DISABLE_L2_PR | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2=
007-11-10  364  	    CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE | CPU_FTR_NEED_=
PAIRED_STWCX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  365  #define CPU_FTRS_7448	(CPU_FTR_COMMON | \
3d372548b4af1a include/asm-powerpc/cputable.h      James.Yang             2=
007-05-02  366  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC=
_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  367  	    CPU_FTR_SPEC7450 | CPU_FTR_NAP_DISABLE_L2_PR | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2=
007-11-10  368  	    CPU_FTR_PPC_LE | CPU_FTR_NEED_PAIRED_STWCX)
385e89d5b20f5a arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
018-11-28  369  #define CPU_FTRS_82XX	(CPU_FTR_COMMON | CPU_FTR_MAYBE_CAN_D=
OZE | CPU_FTR_NOEXECUTE)
11af1192b75307 include/asm-powerpc/cputable.h      Scott Wood             2=
007-09-14  370  #define CPU_FTRS_G2_LE	(CPU_FTR_COMMON | CPU_FTR_MAYBE_CAN_=
DOZE | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  371  	    CPU_FTR_MAYBE_CAN_NAP)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  372  #define CPU_FTRS_E300	(CPU_FTR_MAYBE_CAN_DOZE | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  373  	    CPU_FTR_MAYBE_CAN_NAP | \
385e89d5b20f5a arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
018-11-28  374  	    CPU_FTR_COMMON  | CPU_FTR_NOEXECUTE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2=
007-06-13  375  #define CPU_FTRS_E300C2	(CPU_FTR_MAYBE_CAN_DOZE | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  376  	    CPU_FTR_MAYBE_CAN_NAP | \
385e89d5b20f5a arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
018-11-28  377  	    CPU_FTR_COMMON | CPU_FTR_FPU_UNAVAILABLE  | CPU_FTR_NO=
EXECUTE)
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  378  #define CPU_FTRS_CLASSIC32	(CPU_FTR_COMMON)
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  379  #define CPU_FTRS_8XX	(CPU_FTR_NOEXECUTE)
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
020-10-12  380  #define CPU_FTRS_40X	(CPU_FTR_NOEXECUTE)
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
020-10-12  381  #define CPU_FTRS_44X	(CPU_FTR_NOEXECUTE)
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
020-10-12  382  #define CPU_FTRS_440x6	(CPU_FTR_NOEXECUTE | \
6d2170be456129 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  383  	    CPU_FTR_INDEXED_DCR)
e7f75ad01d5902 arch/powerpc/include/asm/cputable.h Dave Kleikamp          2=
010-03-05  384  #define CPU_FTRS_47X	(CPU_FTRS_440x6)
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  385  #define CPU_FTRS_E200	(CPU_FTR_SPE_COMP | \
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
020-10-12  386  	    CPU_FTR_COHERENT_ICACHE | \
e0291f1decd6e8 arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
019-08-26  387  	    CPU_FTR_NOEXECUTE | \
52b066fa4e9cbf arch/powerpc/include/asm/cputable.h Scott Wood             2=
011-12-20  388  	    CPU_FTR_DEBUG_LVL_EXC)
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  389  #define CPU_FTRS_E500	(CPU_FTR_MAYBE_CAN_DOZE | \
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
020-10-12  390  	    CPU_FTR_SPE_COMP | CPU_FTR_MAYBE_CAN_NAP | \
8309ce7280536b arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-12  391  	    CPU_FTR_NOEXECUTE)
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  392  #define CPU_FTRS_E500_2	(CPU_FTR_MAYBE_CAN_DOZE | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2=
008-12-18  393  	    CPU_FTR_SPE_COMP | CPU_FTR_MAYBE_CAN_NAP | \
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
020-10-12  394  	    CPU_FTR_NOEXECUTE)
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
020-10-12  395  #define CPU_FTRS_E500MC	( \
dd0efb3f11cc0a arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  396  	    CPU_FTR_LWSYNC | CPU_FTR_NOEXECUTE | \
73196cd364a2d9 arch/powerpc/include/asm/cputable.h Scott Wood             2=
011-12-20  397  	    CPU_FTR_DBELL | CPU_FTR_DEBUG_LVL_EXC | CPU_FTR_EMB_HV)
d52459ca304743 arch/powerpc/include/asm/cputable.h Scott Wood             2=
013-07-23  398  /*
d52459ca304743 arch/powerpc/include/asm/cputable.h Scott Wood             2=
013-07-23  399   * e5500/e6500 erratum A-006958 is a timebase bug that can =
use the
d52459ca304743 arch/powerpc/include/asm/cputable.h Scott Wood             2=
013-07-23  400   * same workaround as CPU_FTR_CELL_TB_BUG.
d52459ca304743 arch/powerpc/include/asm/cputable.h Scott Wood             2=
013-07-23  401   */
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
020-10-12  402  #define CPU_FTRS_E5500	( \
dd0efb3f11cc0a arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  403  	    CPU_FTR_LWSYNC | CPU_FTR_NOEXECUTE | \
d36b4c4f3cc6ca arch/powerpc/include/asm/cputable.h Kumar Gala             2=
011-04-06  404  	    CPU_FTR_DBELL | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
d52459ca304743 arch/powerpc/include/asm/cputable.h Scott Wood             2=
013-07-23  405  	    CPU_FTR_DEBUG_LVL_EXC | CPU_FTR_EMB_HV | CPU_FTR_CELL_=
TB_BUG)
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2=
020-10-12  406  #define CPU_FTRS_E6500	( \
dd0efb3f11cc0a arch/powerpc/include/asm/cputable.h Paul Mackerras         2=
018-03-20  407  	    CPU_FTR_LWSYNC | CPU_FTR_NOEXECUTE | \
10241842fbe900 arch/powerpc/include/asm/cputable.h Kumar Gala             2=
011-11-06  408  	    CPU_FTR_DBELL | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
d52459ca304743 arch/powerpc/include/asm/cputable.h Scott Wood             2=
013-07-23  409  	    CPU_FTR_DEBUG_LVL_EXC | CPU_FTR_EMB_HV | CPU_FTR_ALTIV=
EC_COMP | \
e16c8765533a15 arch/powerpc/include/asm/cputable.h Andy Fleming           2=
011-12-08  410  	    CPU_FTR_CELL_TB_BUG | CPU_FTR_SMT)
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2=
006-03-23 @411  #define CPU_FTRS_GENERIC_32	(CPU_FTR_COMMON | CPU_FTR_NODSI=
SRALIGN)
0b8e2e131094d1 include/asm-powerpc/cputable.h      Michael Ellerman       2=
006-11-23  412  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2223591723388814377==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2223591723388814377==--

