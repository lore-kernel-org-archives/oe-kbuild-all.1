Content-Type: multipart/mixed; boundary="===============4906004679533433054=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: arch/arm/include/asm/arch_gicv3.h:44:2: error: implicit declaration of function 'write_sysreg'
Date: Sat, 03 Oct 2020 16:40:51 +0800
Message-ID: <202010031647.4mRtqrlB-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4906004679533433054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peng,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d3d45f8220d60a0b2aaaacf8fb2be4e6ffd9008e
commit: d82bcef5157de1368c08244a846ab968b3e5cb7e soc: imx: select ARM_GIC_V=
3 for i.MX8M
date:   3 months ago
config: arm-randconfig-r002-20201003 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd82bcef5157de1368c08244a846ab968b3e5cb7e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d82bcef5157de1368c08244a846ab968b3e5cb7e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Darm =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/irqchip/arm-gic-v3.h:662,
                    from drivers/irqchip/irq-gic-v3.c:24:
   arch/arm/include/asm/arch_gicv3.h: In function 'write_ICC_PMR_EL1':
>> arch/arm/include/asm/arch_gicv3.h:44:2: error: implicit declaration of f=
unction 'write_sysreg' [-Werror=3Dimplicit-function-declaration]
      44 |  write_sysreg(val, a32);   \
         |  ^~~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:51:1: note: in expansion of macro 'CPU=
IF_MAP'
      51 | CPUIF_MAP(ICC_PMR, ICC_PMR_EL1)
         | ^~~~~~~~~
>> arch/arm/include/asm/arch_gicv3.h:22:20: error: implicit declaration of =
function '__ACCESS_CP15' [-Werror=3Dimplicit-function-declaration]
      22 | #define ICC_PMR    __ACCESS_CP15(c4, 0, c6, 0)
         |                    ^~~~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:51:11: note: in expansion of macro 'IC=
C_PMR'
      51 | CPUIF_MAP(ICC_PMR, ICC_PMR_EL1)
         |           ^~~~~~~
>> arch/arm/include/asm/arch_gicv3.h:22:34: error: 'c4' undeclared (first u=
se in this function)
      22 | #define ICC_PMR    __ACCESS_CP15(c4, 0, c6, 0)
         |                                  ^~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:51:11: note: in expansion of macro 'IC=
C_PMR'
      51 | CPUIF_MAP(ICC_PMR, ICC_PMR_EL1)
         |           ^~~~~~~
   arch/arm/include/asm/arch_gicv3.h:22:34: note: each undeclared identifie=
r is reported only once for each function it appears in
      22 | #define ICC_PMR    __ACCESS_CP15(c4, 0, c6, 0)
         |                                  ^~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:51:11: note: in expansion of macro 'IC=
C_PMR'
      51 | CPUIF_MAP(ICC_PMR, ICC_PMR_EL1)
         |           ^~~~~~~
>> arch/arm/include/asm/arch_gicv3.h:22:41: error: 'c6' undeclared (first u=
se in this function)
      22 | #define ICC_PMR    __ACCESS_CP15(c4, 0, c6, 0)
         |                                         ^~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:51:11: note: in expansion of macro 'IC=
C_PMR'
      51 | CPUIF_MAP(ICC_PMR, ICC_PMR_EL1)
         |           ^~~~~~~
   arch/arm/include/asm/arch_gicv3.h: In function 'read_ICC_PMR_EL1':
>> arch/arm/include/asm/arch_gicv3.h:48:9: error: implicit declaration of f=
unction 'read_sysreg' [-Werror=3Dimplicit-function-declaration]
      48 |  return read_sysreg(a32);   \
         |         ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:51:1: note: in expansion of macro 'CPU=
IF_MAP'
      51 | CPUIF_MAP(ICC_PMR, ICC_PMR_EL1)
         | ^~~~~~~~~
>> arch/arm/include/asm/arch_gicv3.h:22:34: error: 'c4' undeclared (first u=
se in this function)
      22 | #define ICC_PMR    __ACCESS_CP15(c4, 0, c6, 0)
         |                                  ^~
   arch/arm/include/asm/arch_gicv3.h:48:21: note: in definition of macro 'C=
PUIF_MAP'
      48 |  return read_sysreg(a32);   \
         |                     ^~~
   arch/arm/include/asm/arch_gicv3.h:51:11: note: in expansion of macro 'IC=
C_PMR'
      51 | CPUIF_MAP(ICC_PMR, ICC_PMR_EL1)
         |           ^~~~~~~
>> arch/arm/include/asm/arch_gicv3.h:22:41: error: 'c6' undeclared (first u=
se in this function)
      22 | #define ICC_PMR    __ACCESS_CP15(c4, 0, c6, 0)
         |                                         ^~
   arch/arm/include/asm/arch_gicv3.h:48:21: note: in definition of macro 'C=
PUIF_MAP'
      48 |  return read_sysreg(a32);   \
         |                     ^~~
   arch/arm/include/asm/arch_gicv3.h:51:11: note: in expansion of macro 'IC=
C_PMR'
      51 | CPUIF_MAP(ICC_PMR, ICC_PMR_EL1)
         |           ^~~~~~~
   arch/arm/include/asm/arch_gicv3.h: In function 'write_ICC_AP0R0_EL1':
>> arch/arm/include/asm/arch_gicv3.h:29:40: error: 'c12' undeclared (first =
use in this function)
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                        ^~~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:30:21: note: in expansion of macro '__=
ICC_AP0Rx'
      30 | #define ICC_AP0R0   __ICC_AP0Rx(0)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:52:11: note: in expansion of macro 'IC=
C_AP0R0'
      52 | CPUIF_MAP(ICC_AP0R0, ICC_AP0R0_EL1)
         |           ^~~~~~~~~
>> arch/arm/include/asm/arch_gicv3.h:29:48: error: 'c8' undeclared (first u=
se in this function); did you mean 'u8'?
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                                ^~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:30:21: note: in expansion of macro '__=
ICC_AP0Rx'
      30 | #define ICC_AP0R0   __ICC_AP0Rx(0)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:52:11: note: in expansion of macro 'IC=
C_AP0R0'
      52 | CPUIF_MAP(ICC_AP0R0, ICC_AP0R0_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h: In function 'read_ICC_AP0R0_EL1':
>> arch/arm/include/asm/arch_gicv3.h:29:40: error: 'c12' undeclared (first =
use in this function)
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                        ^~~
   arch/arm/include/asm/arch_gicv3.h:48:21: note: in definition of macro 'C=
PUIF_MAP'
      48 |  return read_sysreg(a32);   \
         |                     ^~~
   arch/arm/include/asm/arch_gicv3.h:30:21: note: in expansion of macro '__=
ICC_AP0Rx'
      30 | #define ICC_AP0R0   __ICC_AP0Rx(0)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:52:11: note: in expansion of macro 'IC=
C_AP0R0'
      52 | CPUIF_MAP(ICC_AP0R0, ICC_AP0R0_EL1)
         |           ^~~~~~~~~
>> arch/arm/include/asm/arch_gicv3.h:29:48: error: 'c8' undeclared (first u=
se in this function); did you mean 'u8'?
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                                ^~
   arch/arm/include/asm/arch_gicv3.h:48:21: note: in definition of macro 'C=
PUIF_MAP'
      48 |  return read_sysreg(a32);   \
         |                     ^~~
   arch/arm/include/asm/arch_gicv3.h:30:21: note: in expansion of macro '__=
ICC_AP0Rx'
      30 | #define ICC_AP0R0   __ICC_AP0Rx(0)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:52:11: note: in expansion of macro 'IC=
C_AP0R0'
      52 | CPUIF_MAP(ICC_AP0R0, ICC_AP0R0_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h: In function 'write_ICC_AP0R1_EL1':
>> arch/arm/include/asm/arch_gicv3.h:29:40: error: 'c12' undeclared (first =
use in this function)
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                        ^~~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:31:21: note: in expansion of macro '__=
ICC_AP0Rx'
      31 | #define ICC_AP0R1   __ICC_AP0Rx(1)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:53:11: note: in expansion of macro 'IC=
C_AP0R1'
      53 | CPUIF_MAP(ICC_AP0R1, ICC_AP0R1_EL1)
         |           ^~~~~~~~~
>> arch/arm/include/asm/arch_gicv3.h:29:48: error: 'c8' undeclared (first u=
se in this function); did you mean 'u8'?
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                                ^~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:31:21: note: in expansion of macro '__=
ICC_AP0Rx'
      31 | #define ICC_AP0R1   __ICC_AP0Rx(1)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:53:11: note: in expansion of macro 'IC=
C_AP0R1'
      53 | CPUIF_MAP(ICC_AP0R1, ICC_AP0R1_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h: In function 'read_ICC_AP0R1_EL1':
>> arch/arm/include/asm/arch_gicv3.h:29:40: error: 'c12' undeclared (first =
use in this function)
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                        ^~~
   arch/arm/include/asm/arch_gicv3.h:48:21: note: in definition of macro 'C=
PUIF_MAP'
      48 |  return read_sysreg(a32);   \
         |                     ^~~
   arch/arm/include/asm/arch_gicv3.h:31:21: note: in expansion of macro '__=
ICC_AP0Rx'
      31 | #define ICC_AP0R1   __ICC_AP0Rx(1)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:53:11: note: in expansion of macro 'IC=
C_AP0R1'
      53 | CPUIF_MAP(ICC_AP0R1, ICC_AP0R1_EL1)
         |           ^~~~~~~~~
>> arch/arm/include/asm/arch_gicv3.h:29:48: error: 'c8' undeclared (first u=
se in this function); did you mean 'u8'?
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                                ^~
   arch/arm/include/asm/arch_gicv3.h:48:21: note: in definition of macro 'C=
PUIF_MAP'
      48 |  return read_sysreg(a32);   \
         |                     ^~~
   arch/arm/include/asm/arch_gicv3.h:31:21: note: in expansion of macro '__=
ICC_AP0Rx'
      31 | #define ICC_AP0R1   __ICC_AP0Rx(1)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:53:11: note: in expansion of macro 'IC=
C_AP0R1'
      53 | CPUIF_MAP(ICC_AP0R1, ICC_AP0R1_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h: In function 'write_ICC_AP0R2_EL1':
>> arch/arm/include/asm/arch_gicv3.h:29:40: error: 'c12' undeclared (first =
use in this function)
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                        ^~~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:32:21: note: in expansion of macro '__=
ICC_AP0Rx'
      32 | #define ICC_AP0R2   __ICC_AP0Rx(2)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:54:11: note: in expansion of macro 'IC=
C_AP0R2'
      54 | CPUIF_MAP(ICC_AP0R2, ICC_AP0R2_EL1)
         |           ^~~~~~~~~
>> arch/arm/include/asm/arch_gicv3.h:29:48: error: 'c8' undeclared (first u=
se in this function); did you mean 'u8'?
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                                ^~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:32:21: note: in expansion of macro '__=
ICC_AP0Rx'
      32 | #define ICC_AP0R2   __ICC_AP0Rx(2)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:54:11: note: in expansion of macro 'IC=
C_AP0R2'
      54 | CPUIF_MAP(ICC_AP0R2, ICC_AP0R2_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h: In function 'read_ICC_AP0R2_EL1':
>> arch/arm/include/asm/arch_gicv3.h:29:40: error: 'c12' undeclared (first =
use in this function)
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                        ^~~
   arch/arm/include/asm/arch_gicv3.h:48:21: note: in definition of macro 'C=
PUIF_MAP'
      48 |  return read_sysreg(a32);   \
         |                     ^~~
   arch/arm/include/asm/arch_gicv3.h:32:21: note: in expansion of macro '__=
ICC_AP0Rx'
      32 | #define ICC_AP0R2   __ICC_AP0Rx(2)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:54:11: note: in expansion of macro 'IC=
C_AP0R2'
      54 | CPUIF_MAP(ICC_AP0R2, ICC_AP0R2_EL1)
         |           ^~~~~~~~~
>> arch/arm/include/asm/arch_gicv3.h:29:48: error: 'c8' undeclared (first u=
se in this function); did you mean 'u8'?
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                                ^~
   arch/arm/include/asm/arch_gicv3.h:48:21: note: in definition of macro 'C=
PUIF_MAP'
      48 |  return read_sysreg(a32);   \
         |                     ^~~
   arch/arm/include/asm/arch_gicv3.h:32:21: note: in expansion of macro '__=
ICC_AP0Rx'
      32 | #define ICC_AP0R2   __ICC_AP0Rx(2)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:54:11: note: in expansion of macro 'IC=
C_AP0R2'
      54 | CPUIF_MAP(ICC_AP0R2, ICC_AP0R2_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h: In function 'write_ICC_AP0R3_EL1':
>> arch/arm/include/asm/arch_gicv3.h:29:40: error: 'c12' undeclared (first =
use in this function)
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                        ^~~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:33:21: note: in expansion of macro '__=
ICC_AP0Rx'
      33 | #define ICC_AP0R3   __ICC_AP0Rx(3)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:55:11: note: in expansion of macro 'IC=
C_AP0R3'
      55 | CPUIF_MAP(ICC_AP0R3, ICC_AP0R3_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:29:48: error: 'c8' undeclared (first u=
se in this function); did you mean 'u8'?
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                                ^~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:33:21: note: in expansion of macro '__=
ICC_AP0Rx'
      33 | #define ICC_AP0R3   __ICC_AP0Rx(3)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:55:11: note: in expansion of macro 'IC=
C_AP0R3'
      55 | CPUIF_MAP(ICC_AP0R3, ICC_AP0R3_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h: In function 'read_ICC_AP0R3_EL1':
   arch/arm/include/asm/arch_gicv3.h:29:40: error: 'c12' undeclared (first =
use in this function)
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                        ^~~
   arch/arm/include/asm/arch_gicv3.h:48:21: note: in definition of macro 'C=
PUIF_MAP'
      48 |  return read_sysreg(a32);   \
         |                     ^~~
   arch/arm/include/asm/arch_gicv3.h:33:21: note: in expansion of macro '__=
ICC_AP0Rx'
      33 | #define ICC_AP0R3   __ICC_AP0Rx(3)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:55:11: note: in expansion of macro 'IC=
C_AP0R3'
      55 | CPUIF_MAP(ICC_AP0R3, ICC_AP0R3_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:29:48: error: 'c8' undeclared (first u=
se in this function); did you mean 'u8'?
      29 | #define __ICC_AP0Rx(x)   __ACCESS_CP15(c12, 0, c8, 4 | x)
         |                                                ^~
   arch/arm/include/asm/arch_gicv3.h:48:21: note: in definition of macro 'C=
PUIF_MAP'
      48 |  return read_sysreg(a32);   \
         |                     ^~~
   arch/arm/include/asm/arch_gicv3.h:33:21: note: in expansion of macro '__=
ICC_AP0Rx'
      33 | #define ICC_AP0R3   __ICC_AP0Rx(3)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:55:11: note: in expansion of macro 'IC=
C_AP0R3'
      55 | CPUIF_MAP(ICC_AP0R3, ICC_AP0R3_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h: In function 'write_ICC_AP1R0_EL1':
   arch/arm/include/asm/arch_gicv3.h:35:40: error: 'c12' undeclared (first =
use in this function)
      35 | #define __ICC_AP1Rx(x)   __ACCESS_CP15(c12, 0, c9, x)
         |                                        ^~~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:36:21: note: in expansion of macro '__=
ICC_AP1Rx'
      36 | #define ICC_AP1R0   __ICC_AP1Rx(0)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:56:11: note: in expansion of macro 'IC=
C_AP1R0'
      56 | CPUIF_MAP(ICC_AP1R0, ICC_AP1R0_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:35:48: error: 'c9' undeclared (first u=
se in this function)
      35 | #define __ICC_AP1Rx(x)   __ACCESS_CP15(c12, 0, c9, x)
         |                                                ^~
   arch/arm/include/asm/arch_gicv3.h:44:20: note: in definition of macro 'C=
PUIF_MAP'
      44 |  write_sysreg(val, a32);   \
         |                    ^~~
   arch/arm/include/asm/arch_gicv3.h:36:21: note: in expansion of macro '__=
ICC_AP1Rx'
      36 | #define ICC_AP1R0   __ICC_AP1Rx(0)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:56:11: note: in expansion of macro 'IC=
C_AP1R0'
      56 | CPUIF_MAP(ICC_AP1R0, ICC_AP1R0_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h: In function 'read_ICC_AP1R0_EL1':
   arch/arm/include/asm/arch_gicv3.h:35:40: error: 'c12' undeclared (first =
use in this function)
      35 | #define __ICC_AP1Rx(x)   __ACCESS_CP15(c12, 0, c9, x)
         |                                        ^~~
   arch/arm/include/asm/arch_gicv3.h:48:21: note: in definition of macro 'C=
PUIF_MAP'
      48 |  return read_sysreg(a32);   \
         |                     ^~~
   arch/arm/include/asm/arch_gicv3.h:36:21: note: in expansion of macro '__=
ICC_AP1Rx'
      36 | #define ICC_AP1R0   __ICC_AP1Rx(0)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:56:11: note: in expansion of macro 'IC=
C_AP1R0'
      56 | CPUIF_MAP(ICC_AP1R0, ICC_AP1R0_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:35:48: error: 'c9' undeclared (first u=
se in this function)
      35 | #define __ICC_AP1Rx(x)   __ACCESS_CP15(c12, 0, c9, x)
         |                                                ^~
   arch/arm/include/asm/arch_gicv3.h:48:21: note: in definition of macro 'C=
PUIF_MAP'
      48 |  return read_sysreg(a32);   \
         |                     ^~~
   arch/arm/include/asm/arch_gicv3.h:36:21: note: in expansion of macro '__=
ICC_AP1Rx'
      36 | #define ICC_AP1R0   __ICC_AP1Rx(0)
         |                     ^~~~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h:56:11: note: in expansion of macro 'IC=
C_AP1R0'
      56 | CPUIF_MAP(ICC_AP1R0, ICC_AP1R0_EL1)
         |           ^~~~~~~~~
   arch/arm/include/asm/arch_gicv3.h: In function 'write_ICC_AP1R1_EL1':
   arch/arm/include/asm/arch_gicv3.h:35:40: error: 'c12' undeclared (first =
use in this function)
..

vim +/write_sysreg +44 arch/arm/include/asm/arch_gicv3.h

d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   17  =

d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   18  #define ICC_EOIR1			=
__ACCESS_CP15(c12, 0, c12, 1)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  @19  #define ICC_DIR				_=
_ACCESS_CP15(c12, 0, c11, 1)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   20  #define ICC_IAR1			_=
_ACCESS_CP15(c12, 0, c12, 0)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  @21  #define ICC_SGI1R			=
__ACCESS_CP15_64(0, c12)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  @22  #define ICC_PMR				_=
_ACCESS_CP15(c4, 0, c6, 0)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   23  #define ICC_CTLR			_=
_ACCESS_CP15(c12, 0, c12, 4)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   24  #define ICC_SRE				_=
_ACCESS_CP15(c12, 0, c12, 5)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   25  #define ICC_IGRPEN1	=
		__ACCESS_CP15(c12, 0, c12, 7)
91ef84428a86b75 Daniel Thompson       2016-08-19   26  #define ICC_BPR1			_=
_ACCESS_CP15(c12, 0, c12, 3)
e99da7c6f51b487 Julien Thierry        2019-01-31   27  #define ICC_RPR				_=
_ACCESS_CP15(c12, 0, c11, 3)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   28  =

d6062a6d62c643a Marc Zyngier          2018-03-09  @29  #define __ICC_AP0Rx(=
x)			__ACCESS_CP15(c12, 0, c8, 4 | x)
d6062a6d62c643a Marc Zyngier          2018-03-09   30  #define ICC_AP0R0			=
__ICC_AP0Rx(0)
d6062a6d62c643a Marc Zyngier          2018-03-09   31  #define ICC_AP0R1			=
__ICC_AP0Rx(1)
d6062a6d62c643a Marc Zyngier          2018-03-09   32  #define ICC_AP0R2			=
__ICC_AP0Rx(2)
d6062a6d62c643a Marc Zyngier          2018-03-09   33  #define ICC_AP0R3			=
__ICC_AP0Rx(3)
d6062a6d62c643a Marc Zyngier          2018-03-09   34  =

d6062a6d62c643a Marc Zyngier          2018-03-09  @35  #define __ICC_AP1Rx(=
x)			__ACCESS_CP15(c12, 0, c9, x)
d6062a6d62c643a Marc Zyngier          2018-03-09   36  #define ICC_AP1R0			=
__ICC_AP1Rx(0)
d6062a6d62c643a Marc Zyngier          2018-03-09   37  #define ICC_AP1R1			=
__ICC_AP1Rx(1)
d6062a6d62c643a Marc Zyngier          2018-03-09   38  #define ICC_AP1R2			=
__ICC_AP1Rx(2)
d6062a6d62c643a Marc Zyngier          2018-03-09   39  #define ICC_AP1R3			=
__ICC_AP1Rx(3)
d6062a6d62c643a Marc Zyngier          2018-03-09   40  =

a078bedf17c2e43 Vladimir Murzin       2016-09-12   41  #define CPUIF_MAP(a3=
2, a64)			\
a078bedf17c2e43 Vladimir Murzin       2016-09-12   42  static inline void w=
rite_ ## a64(u32 val)	\
a078bedf17c2e43 Vladimir Murzin       2016-09-12   43  {						\
a078bedf17c2e43 Vladimir Murzin       2016-09-12  @44  	write_sysreg(val, a=
32);			\
a078bedf17c2e43 Vladimir Murzin       2016-09-12   45  }						\
a078bedf17c2e43 Vladimir Murzin       2016-09-12   46  static inline u32 re=
ad_ ## a64(void)		\
a078bedf17c2e43 Vladimir Murzin       2016-09-12   47  {						\
a078bedf17c2e43 Vladimir Murzin       2016-09-12  @48  	return read_sysreg(=
a32); 		\
a078bedf17c2e43 Vladimir Murzin       2016-09-12   49  }						\
a078bedf17c2e43 Vladimir Murzin       2016-09-12   50  =

33625282adaaba9 Marc Zyngier          2018-03-20   51  CPUIF_MAP(ICC_PMR, I=
CC_PMR_EL1)
d6062a6d62c643a Marc Zyngier          2018-03-09   52  CPUIF_MAP(ICC_AP0R0,=
 ICC_AP0R0_EL1)
d6062a6d62c643a Marc Zyngier          2018-03-09   53  CPUIF_MAP(ICC_AP0R1,=
 ICC_AP0R1_EL1)
d6062a6d62c643a Marc Zyngier          2018-03-09   54  CPUIF_MAP(ICC_AP0R2,=
 ICC_AP0R2_EL1)
d6062a6d62c643a Marc Zyngier          2018-03-09   55  CPUIF_MAP(ICC_AP0R3,=
 ICC_AP0R3_EL1)
d6062a6d62c643a Marc Zyngier          2018-03-09   56  CPUIF_MAP(ICC_AP1R0,=
 ICC_AP1R0_EL1)
d6062a6d62c643a Marc Zyngier          2018-03-09   57  CPUIF_MAP(ICC_AP1R1,=
 ICC_AP1R1_EL1)
d6062a6d62c643a Marc Zyngier          2018-03-09   58  CPUIF_MAP(ICC_AP1R2,=
 ICC_AP1R2_EL1)
d6062a6d62c643a Marc Zyngier          2018-03-09   59  CPUIF_MAP(ICC_AP1R3,=
 ICC_AP1R3_EL1)
d6062a6d62c643a Marc Zyngier          2018-03-09   60  =

a078bedf17c2e43 Vladimir Murzin       2016-09-12   61  #define read_gicreg(=
r)                 read_##r()
a078bedf17c2e43 Vladimir Murzin       2016-09-12   62  #define write_gicreg=
(v, r)             write_##r(v)
a078bedf17c2e43 Vladimir Murzin       2016-09-12   63  =

d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   64  /* Low-level accesso=
rs */
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   65  =

d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   66  static inline void g=
ic_write_eoir(u32 irq)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   67  {
4f2546384150e78 Vladimir Murzin       2016-09-12   68  	write_sysreg(irq, I=
CC_EOIR1);
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   69  	isb();
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   70  }
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   71  =

d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   72  static inline void g=
ic_write_dir(u32 val)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   73  {
4f2546384150e78 Vladimir Murzin       2016-09-12   74  	write_sysreg(val, I=
CC_DIR);
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   75  	isb();
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   76  }
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   77  =

d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   78  static inline u32 gi=
c_read_iar(void)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   79  {
4f2546384150e78 Vladimir Murzin       2016-09-12   80  	u32 irqstat =3D rea=
d_sysreg(ICC_IAR1);
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   81  =

8f318526a292c5e Marc Zyngier          2016-02-18   82  	dsb(sy);
4f2546384150e78 Vladimir Murzin       2016-09-12   83  =

d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   84  	return irqstat;
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   85  }
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   86  =

d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   87  static inline void g=
ic_write_ctlr(u32 val)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   88  {
4f2546384150e78 Vladimir Murzin       2016-09-12   89  	write_sysreg(val, I=
CC_CTLR);
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   90  	isb();
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   91  }
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   92  =

eda0d04acc5e317 Shanker Donthineni    2017-10-06   93  static inline u32 gi=
c_read_ctlr(void)
eda0d04acc5e317 Shanker Donthineni    2017-10-06   94  {
eda0d04acc5e317 Shanker Donthineni    2017-10-06   95  	return read_sysreg(=
ICC_CTLR);
eda0d04acc5e317 Shanker Donthineni    2017-10-06   96  }
eda0d04acc5e317 Shanker Donthineni    2017-10-06   97  =

d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   98  static inline void g=
ic_write_grpen1(u32 val)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01   99  {
4f2546384150e78 Vladimir Murzin       2016-09-12  100  	write_sysreg(val, I=
CC_IGRPEN1);
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  101  	isb();
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  102  }
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  103  =

d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  104  static inline void g=
ic_write_sgi1r(u64 val)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  105  {
4f2546384150e78 Vladimir Murzin       2016-09-12  106  	write_sysreg(val, I=
CC_SGI1R);
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  107  }
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  108  =

d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  109  static inline u32 gi=
c_read_sre(void)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  110  {
4f2546384150e78 Vladimir Murzin       2016-09-12  111  	return read_sysreg(=
ICC_SRE);
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  112  }
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  113  =

d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  114  static inline void g=
ic_write_sre(u32 val)
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  115  {
4f2546384150e78 Vladimir Murzin       2016-09-12  116  	write_sysreg(val, I=
CC_SRE);
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  117  	isb();
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  118  }
d5cd50d318f70fc Jean-Philippe Brucker 2015-10-01  119  =

91ef84428a86b75 Daniel Thompson       2016-08-19  120  static inline void g=
ic_write_bpr1(u32 val)
91ef84428a86b75 Daniel Thompson       2016-08-19  121  {
3d9cd95f90b2987 Marc Zyngier          2016-09-23  122  	write_sysreg(val, I=
CC_BPR1);
91ef84428a86b75 Daniel Thompson       2016-08-19  123  }
91ef84428a86b75 Daniel Thompson       2016-08-19  124  =

e99da7c6f51b487 Julien Thierry        2019-01-31  125  static inline u32 gi=
c_read_pmr(void)
e99da7c6f51b487 Julien Thierry        2019-01-31  126  {
e99da7c6f51b487 Julien Thierry        2019-01-31  127  	return read_sysreg(=
ICC_PMR);
e99da7c6f51b487 Julien Thierry        2019-01-31  128  }
e99da7c6f51b487 Julien Thierry        2019-01-31  129  =

e99da7c6f51b487 Julien Thierry        2019-01-31  130  static inline void g=
ic_write_pmr(u32 val)
e99da7c6f51b487 Julien Thierry        2019-01-31  131  {
e99da7c6f51b487 Julien Thierry        2019-01-31  132  	write_sysreg(val, I=
CC_PMR);
e99da7c6f51b487 Julien Thierry        2019-01-31  133  }
e99da7c6f51b487 Julien Thierry        2019-01-31  134  =

e99da7c6f51b487 Julien Thierry        2019-01-31  135  static inline u32 gi=
c_read_rpr(void)
e99da7c6f51b487 Julien Thierry        2019-01-31  136  {
e99da7c6f51b487 Julien Thierry        2019-01-31  137  	return read_sysreg(=
ICC_RPR);
e99da7c6f51b487 Julien Thierry        2019-01-31 @138  }
e99da7c6f51b487 Julien Thierry        2019-01-31  139  =


:::::: The code at line 44 was first introduced by commit
:::::: a078bedf17c2e43819fea54bdfd5793845142e3a ARM: gic-v3: Introduce 32-t=
o-64-bit mappings for GICv3 cpu registers

:::::: TO: Vladimir Murzin <vladimir.murzin@arm.com>
:::::: CC: Christoffer Dall <christoffer.dall@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4906004679533433054==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
X5fyuu6T4WPwfCxFsfMTLneI+JmHAQA=
--===============4906004679533433054==--

