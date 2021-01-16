Content-Type: multipart/mixed; boundary="===============1041677817130359770=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: arch/sh/include/asm/mmu_context.h:151:9: sparse: sparse: incorrect type in argument 1 (different base types)
Date: Sun, 17 Jan 2021 03:29:26 +0800
Message-ID: <202101170317.WDtLz130-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1041677817130359770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1d94330a437a573cfdf848f6743b1ed169242c8a
commit: e5fc436f06eef54ef512ea55a9db8eb9f2e76959 sparse: use static inline =
for __chk_{user,io}_ptr()
date:   5 months ago
config: sh-randconfig-s032-20210117 (attached as .config)
compiler: sh4-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De5fc436f06eef54ef512ea55a9db8eb9f2e76959
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e5fc436f06eef54ef512ea55a9db8eb9f2e76959
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dsh =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   arch/sh/kernel/setup.c: note: in included file:
>> arch/sh/include/asm/mmu_context.h:151:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/asm/mmu_context.h:151:9: sparse:     expected void const=
 volatile [noderef] __iomem *ptr
   arch/sh/include/asm/mmu_context.h:151:9: sparse:     got unsigned int
--
   arch/sh/kernel/traps_32.c:493:51: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void const [noderef] __us=
er *from @@     got unsigned short [usertype] * @@
   arch/sh/kernel/traps_32.c:493:51: sparse:     expected void const [noder=
ef] __user *from
   arch/sh/kernel/traps_32.c:493:51: sparse:     got unsigned short [userty=
pe] *
>> arch/sh/kernel/traps_32.c:617:9: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __user *ptr @@     got unsigned short const *__gu_addr @@
   arch/sh/kernel/traps_32.c:617:9: sparse:     expected void const volatil=
e [noderef] __user *ptr
   arch/sh/kernel/traps_32.c:617:9: sparse:     got unsigned short const *_=
_gu_addr
   arch/sh/kernel/traps_32.c:702:9: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __user *ptr @@     got unsigned short const *__gu_addr @@
   arch/sh/kernel/traps_32.c:702:9: sparse:     expected void const volatil=
e [noderef] __user *ptr
   arch/sh/kernel/traps_32.c:702:9: sparse:     got unsigned short const *_=
_gu_addr
   arch/sh/kernel/traps_32.c:704:17: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got unsigned short const *__gu_addr @@
   arch/sh/kernel/traps_32.c:704:17: sparse:     expected void const volati=
le [noderef] __user *ptr
   arch/sh/kernel/traps_32.c:704:17: sparse:     got unsigned short const *=
__gu_addr
--
>> arch/sh/kernel/ftrace.c:50:9: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const volatile [noderef]=
 __iomem *ptr @@     got unsigned char * @@
   arch/sh/kernel/ftrace.c:50:9: sparse:     expected void const volatile [=
noderef] __iomem *ptr
   arch/sh/kernel/ftrace.c:50:9: sparse:     got unsigned char *
   arch/sh/kernel/ftrace.c:57:9: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const volatile [noderef]=
 __iomem *ptr @@     got unsigned char * @@
   arch/sh/kernel/ftrace.c:57:9: sparse:     expected void const volatile [=
noderef] __iomem *ptr
   arch/sh/kernel/ftrace.c:57:9: sparse:     got unsigned char *
--
>> arch/sh/mm/cache-sh3.c:50:32: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected void const volatile [noderef] __i=
omem *ptr @@     got unsigned long [assigned] addr @@
   arch/sh/mm/cache-sh3.c:50:32: sparse:     expected void const volatile [=
noderef] __iomem *ptr
   arch/sh/mm/cache-sh3.c:50:32: sparse:     got unsigned long [assigned] a=
ddr
   arch/sh/mm/cache-sh3.c:55:33: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected void const volatile [noderef] __i=
omem *ptr @@     got unsigned long [assigned] addr @@
   arch/sh/mm/cache-sh3.c:55:33: sparse:     expected void const volatile [=
noderef] __iomem *ptr
   arch/sh/mm/cache-sh3.c:55:33: sparse:     got unsigned long [assigned] a=
ddr
   arch/sh/mm/cache-sh3.c:86:17: sparse: sparse: incorrect type in argument=
 1 (different base types) @@     expected void const volatile [noderef] __i=
omem *ptr @@     got unsigned long [assigned] addr @@
   arch/sh/mm/cache-sh3.c:86:17: sparse:     expected void const volatile [=
noderef] __iomem *ptr
   arch/sh/mm/cache-sh3.c:86:17: sparse:     got unsigned long [assigned] a=
ddr
--
>> arch/sh/kernel/cpu/sh3/probe.c:30:18: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected void const volatile [node=
ref] __iomem *ptr @@     got unsigned long [assigned] addr0 @@
   arch/sh/kernel/cpu/sh3/probe.c:30:18: sparse:     expected void const vo=
latile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/probe.c:30:18: sparse:     got unsigned long [ass=
igned] addr0
   arch/sh/kernel/cpu/sh3/probe.c:31:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected void const volatile [noder=
ef] __iomem *ptr @@     got unsigned long [assigned] addr0 @@
   arch/sh/kernel/cpu/sh3/probe.c:31:9: sparse:     expected void const vol=
atile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/probe.c:31:9: sparse:     got unsigned long [assi=
gned] addr0
>> arch/sh/kernel/cpu/sh3/probe.c:32:18: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected void const volatile [node=
ref] __iomem *ptr @@     got unsigned long [assigned] addr1 @@
   arch/sh/kernel/cpu/sh3/probe.c:32:18: sparse:     expected void const vo=
latile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/probe.c:32:18: sparse:     got unsigned long [ass=
igned] addr1
   arch/sh/kernel/cpu/sh3/probe.c:33:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected void const volatile [noder=
ef] __iomem *ptr @@     got unsigned long [assigned] addr1 @@
   arch/sh/kernel/cpu/sh3/probe.c:33:9: sparse:     expected void const vol=
atile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/probe.c:33:9: sparse:     got unsigned long [assi=
gned] addr1
   arch/sh/kernel/cpu/sh3/probe.c:36:17: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected void const volatile [node=
ref] __iomem *ptr @@     got unsigned long [assigned] addr0 @@
   arch/sh/kernel/cpu/sh3/probe.c:36:17: sparse:     expected void const vo=
latile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/probe.c:36:17: sparse:     got unsigned long [ass=
igned] addr0
   arch/sh/kernel/cpu/sh3/probe.c:38:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected void const volatile [noder=
ef] __iomem *ptr @@     got unsigned long [assigned] addr0 @@
   arch/sh/kernel/cpu/sh3/probe.c:38:9: sparse:     expected void const vol=
atile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/probe.c:38:9: sparse:     got unsigned long [assi=
gned] addr0
   arch/sh/kernel/cpu/sh3/probe.c:39:17: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected void const volatile [node=
ref] __iomem *ptr @@     got unsigned long [assigned] addr1 @@
   arch/sh/kernel/cpu/sh3/probe.c:39:17: sparse:     expected void const vo=
latile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/probe.c:39:17: sparse:     got unsigned long [ass=
igned] addr1
   arch/sh/kernel/cpu/sh3/probe.c:41:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected void const volatile [noder=
ef] __iomem *ptr @@     got unsigned long [assigned] addr1 @@
   arch/sh/kernel/cpu/sh3/probe.c:41:9: sparse:     expected void const vol=
atile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/probe.c:41:9: sparse:     got unsigned long [assi=
gned] addr1
   arch/sh/kernel/cpu/sh3/probe.c:42:17: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected void const volatile [node=
ref] __iomem *ptr @@     got unsigned long [assigned] addr0 @@
   arch/sh/kernel/cpu/sh3/probe.c:42:17: sparse:     expected void const vo=
latile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/probe.c:42:17: sparse:     got unsigned long [ass=
igned] addr0
   arch/sh/kernel/cpu/sh3/probe.c:45:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected void const volatile [noder=
ef] __iomem *ptr @@     got unsigned long [assigned] addr0 @@
   arch/sh/kernel/cpu/sh3/probe.c:45:9: sparse:     expected void const vol=
atile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/probe.c:45:9: sparse:     got unsigned long [assi=
gned] addr0
   arch/sh/kernel/cpu/sh3/probe.c:46:9: sparse: sparse: incorrect type in a=
rgument 1 (different base types) @@     expected void const volatile [noder=
ef] __iomem *ptr @@     got unsigned long [assigned] addr1 @@
   arch/sh/kernel/cpu/sh3/probe.c:46:9: sparse:     expected void const vol=
atile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/probe.c:46:9: sparse:     got unsigned long [assi=
gned] addr1
--
>> arch/sh/kernel/cpu/sh3/setup-sh3.c:59:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected void const volatile [=
noderef] __iomem *ptr @@     got unsigned long @@
   arch/sh/kernel/cpu/sh3/setup-sh3.c:59:17: sparse:     expected void cons=
t volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/setup-sh3.c:59:17: sparse:     got unsigned long
>> arch/sh/kernel/cpu/sh3/setup-sh3.c:59:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected void const volatile [=
noderef] __iomem *ptr @@     got unsigned long @@
   arch/sh/kernel/cpu/sh3/setup-sh3.c:59:17: sparse:     expected void cons=
t volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/setup-sh3.c:59:17: sparse:     got unsigned long
--
>> arch/sh/kernel/cpu/sh3/clock-sh7710.c:26:31: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/clock-sh7710.c:26:31: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/clock-sh7710.c:26:31: sparse:     got unsigned int
   arch/sh/kernel/cpu/sh3/clock-sh7710.c:35:20: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/clock-sh7710.c:35:20: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/clock-sh7710.c:35:20: sparse:     got unsigned int
   arch/sh/kernel/cpu/sh3/clock-sh7710.c:45:20: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/clock-sh7710.c:45:20: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/clock-sh7710.c:45:20: sparse:     got unsigned int
   arch/sh/kernel/cpu/sh3/clock-sh7710.c:55:20: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/clock-sh7710.c:55:20: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/clock-sh7710.c:55:20: sparse:     got unsigned int
--
>> arch/sh/kernel/cpu/sh3/serial-sh7710.c:13:17: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:13:17: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:13:17: sparse:     got unsigned i=
nt
>> arch/sh/kernel/cpu/sh3/serial-sh7710.c:13:17: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:13:17: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:13:17: sparse:     got unsigned i=
nt
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:14:17: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:14:17: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:14:17: sparse:     got unsigned i=
nt
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:14:17: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:14:17: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:14:17: sparse:     got unsigned i=
nt
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:16:17: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:16:17: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:16:17: sparse:     got unsigned i=
nt
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:16:17: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:16:17: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh3/serial-sh7710.c:16:17: sparse:     got unsigned i=
nt
--
>> arch/sh/kernel/cpu/irq/ipr.c:35:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected void const volatile [noderef=
] __iomem *ptr @@     got unsigned long addr @@
   arch/sh/kernel/cpu/irq/ipr.c:35:9: sparse:     expected void const volat=
ile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/irq/ipr.c:35:9: sparse:     got unsigned long addr
>> arch/sh/kernel/cpu/irq/ipr.c:35:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected void const volatile [noderef=
] __iomem *ptr @@     got unsigned long addr @@
   arch/sh/kernel/cpu/irq/ipr.c:35:9: sparse:     expected void const volat=
ile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/irq/ipr.c:35:9: sparse:     got unsigned long addr
   arch/sh/kernel/cpu/irq/ipr.c:36:15: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected void const volatile [nodere=
f] __iomem *ptr @@     got unsigned long addr @@
   arch/sh/kernel/cpu/irq/ipr.c:36:15: sparse:     expected void const vola=
tile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/irq/ipr.c:36:15: sparse:     got unsigned long addr
   arch/sh/kernel/cpu/irq/ipr.c:44:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected void const volatile [noderef=
] __iomem *ptr @@     got unsigned long addr @@
   arch/sh/kernel/cpu/irq/ipr.c:44:9: sparse:     expected void const volat=
ile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/irq/ipr.c:44:9: sparse:     got unsigned long addr
   arch/sh/kernel/cpu/irq/ipr.c:44:9: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected void const volatile [noderef=
] __iomem *ptr @@     got unsigned long addr @@
   arch/sh/kernel/cpu/irq/ipr.c:44:9: sparse:     expected void const volat=
ile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/irq/ipr.c:44:9: sparse:     got unsigned long addr
--
   arch/sh/math-emu/math.c: note: in included file:
   include/math-emu/single.h:50:5: sparse: sparse: undefined preprocessor i=
dentifier '__LITTLE_ENDIAN'
   arch/sh/math-emu/math.c: note: in included file:
   include/math-emu/double.h:59:5: sparse: sparse: undefined preprocessor i=
dentifier '__LITTLE_ENDIAN'
   arch/sh/math-emu/math.c:54:9: sparse: sparse: preprocessor token WRITE r=
edefined
   arch/sh/math-emu/math.c: note: in included file:
   include/linux/kernel.h:41:9: sparse: this was the original definition
   arch/sh/math-emu/math.c:55:9: sparse: sparse: preprocessor token READ re=
defined
   include/linux/kernel.h:40:9: sparse: this was the original definition
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:122:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:129:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:129:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:129:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:129:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:145:9: sparse: sparse: asm output is not an lval=
ue
   arch/sh/math-emu/math.c:145:9: sparse: sparse: asm output is not an lval=
ue
>> arch/sh/math-emu/math.c:160:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got unsigned long const *__gu_addr @@
   arch/sh/math-emu/math.c:160:17: sparse:     expected void const volatile=
 [noderef] __user *ptr
   arch/sh/math-emu/math.c:160:17: sparse:     got unsigned long const *__g=
u_addr
   arch/sh/math-emu/math.c:162:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got unsigned long const *__gu_addr @@
   arch/sh/math-emu/math.c:162:17: sparse:     expected void const volatile=
 [noderef] __user *ptr
   arch/sh/math-emu/math.c:162:17: sparse:     got unsigned long const *__g=
u_addr
   arch/sh/math-emu/math.c:164:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got unsigned long const *__gu_addr @@
   arch/sh/math-emu/math.c:164:17: sparse:     expected void const volatile=
 [noderef] __user *ptr
   arch/sh/math-emu/math.c:164:17: sparse:     got unsigned long const *__g=
u_addr
   arch/sh/math-emu/math.c:176:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got unsigned long const *__gu_addr @@
   arch/sh/math-emu/math.c:176:17: sparse:     expected void const volatile=
 [noderef] __user *ptr
   arch/sh/math-emu/math.c:176:17: sparse:     got unsigned long const *__g=
u_addr
   arch/sh/math-emu/math.c:178:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got unsigned long const *__gu_addr @@
   arch/sh/math-emu/math.c:178:17: sparse:     expected void const volatile=
 [noderef] __user *ptr
   arch/sh/math-emu/math.c:178:17: sparse:     got unsigned long const *__g=
u_addr
   arch/sh/math-emu/math.c:180:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got unsigned long const *__gu_addr @@
   arch/sh/math-emu/math.c:180:17: sparse:     expected void const volatile=
 [noderef] __user *ptr
   arch/sh/math-emu/math.c:180:17: sparse:     got unsigned long const *__g=
u_addr
   arch/sh/math-emu/math.c:192:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got unsigned long const *__gu_addr @@
   arch/sh/math-emu/math.c:192:17: sparse:     expected void const volatile=
 [noderef] __user *ptr
   arch/sh/math-emu/math.c:192:17: sparse:     got unsigned long const *__g=
u_addr
   arch/sh/math-emu/math.c:194:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got unsigned long const *__gu_addr @@
   arch/sh/math-emu/math.c:194:17: sparse:     expected void const volatile=
 [noderef] __user *ptr
   arch/sh/math-emu/math.c:194:17: sparse:     got unsigned long const *__g=
u_addr
   arch/sh/math-emu/math.c:197:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got unsigned long const *__gu_addr @@
   arch/sh/math-emu/math.c:197:17: sparse:     expected void const volatile=
 [noderef] __user *ptr
   arch/sh/math-emu/math.c:197:17: sparse:     got unsigned long const *__g=
u_addr
   arch/sh/math-emu/math.c:210:17: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected unsigned long [noderef] __=
user *__pu_addr @@     got unsigned long * @@
   arch/sh/math-emu/math.c:210:17: sparse:     expected unsigned long [node=
ref] __user *__pu_addr
   arch/sh/math-emu/math.c:210:17: sparse:     got unsigned long *
   arch/sh/math-emu/math.c:212:17: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected unsigned long [noderef] __=
user *__pu_addr @@     got unsigned long * @@
   arch/sh/math-emu/math.c:212:17: sparse:     expected unsigned long [node=
ref] __user *__pu_addr
   arch/sh/math-emu/math.c:212:17: sparse:     got unsigned long *
   arch/sh/math-emu/math.c:214:17: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected unsigned long [noderef] __=
user *__pu_addr @@     got unsigned long * @@
   arch/sh/math-emu/math.c:214:17: sparse:     expected unsigned long [node=
ref] __user *__pu_addr
   arch/sh/math-emu/math.c:214:17: sparse:     got unsigned long *
   arch/sh/math-emu/math.c:226:17: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected unsigned long [noderef] __=
user *__pu_addr @@     got unsigned long * @@
   arch/sh/math-emu/math.c:226:17: sparse:     expected unsigned long [node=
ref] __user *__pu_addr
   arch/sh/math-emu/math.c:226:17: sparse:     got unsigned long *
   arch/sh/math-emu/math.c:228:17: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected unsigned long [noderef] __=
user *__pu_addr @@     got unsigned long * @@
   arch/sh/math-emu/math.c:228:17: sparse:     expected unsigned long [node=
ref] __user *__pu_addr
   arch/sh/math-emu/math.c:228:17: sparse:     got unsigned long *
   arch/sh/math-emu/math.c:230:17: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected unsigned long [noderef] __=
user *__pu_addr @@     got unsigned long * @@
   arch/sh/math-emu/math.c:230:17: sparse:     expected unsigned long [node=
ref] __user *__pu_addr
   arch/sh/math-emu/math.c:230:17: sparse:     got unsigned long *
   arch/sh/math-emu/math.c:243:17: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected unsigned long [noderef] __=
user *__pu_addr @@     got unsigned long * @@
   arch/sh/math-emu/math.c:243:17: sparse:     expected unsigned long [node=
ref] __user *__pu_addr
   arch/sh/math-emu/math.c:243:17: sparse:     got unsigned long *
   arch/sh/math-emu/math.c:245:17: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected unsigned long [noderef] __=
user *__pu_addr @@     got unsigned long * @@
   arch/sh/math-emu/math.c:245:17: sparse:     expected unsigned long [node=
ref] __user *__pu_addr
   arch/sh/math-emu/math.c:245:17: sparse:     got unsigned long *
   arch/sh/math-emu/math.c:248:17: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected unsigned long [noderef] __=
user *__pu_addr @@     got unsigned long * @@
   arch/sh/math-emu/math.c:248:17: sparse:     expected unsigned long [node=
ref] __user *__pu_addr
   arch/sh/math-emu/math.c:248:17: sparse:     got unsigned long *
   arch/sh/math-emu/math.c:448:17: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected unsigned long [noderef] __=
user *__pu_addr @@     got unsigned long * @@
   arch/sh/math-emu/math.c:448:17: sparse:     expected unsigned long [node=
ref] __user *__pu_addr
   arch/sh/math-emu/math.c:448:17: sparse:     got unsigned long *
   arch/sh/math-emu/math.c:452:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got unsigned long const *__gu_addr @@
   arch/sh/math-emu/math.c:452:17: sparse:     expected void const volatile=
 [noderef] __user *ptr
   arch/sh/math-emu/math.c:452:17: sparse:     got unsigned long const *__g=
u_addr
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (1)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (1)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (1)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (1)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:122:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:129:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:129:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:129:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:129:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:145:9: sparse: sparse: generating address of non=
-lvalue (11)
   arch/sh/math-emu/math.c:145:9: sparse: sparse: generating address of non=
-lvalue (11)
--
   arch/sh/boards/mach-se/770x/setup.c: note: in included file (through inc=
lude/linux/scatterlist.h, include/linux/dma-mapping.h, include/linux/skbuff=
.h, ...):
   arch/sh/include/asm/io.h:184:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected unsigned char volatile [use=
rtype] *__addr @@     got void [noderef] __iomem * @@
   arch/sh/include/asm/io.h:184:1: sparse:     expected unsigned char volat=
ile [usertype] *__addr
   arch/sh/include/asm/io.h:184:1: sparse:     got void [noderef] __iomem *
   arch/sh/include/asm/io.h:184:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected unsigned char volatile [use=
rtype] *__addr @@     got void [noderef] __iomem * @@
   arch/sh/include/asm/io.h:184:1: sparse:     expected unsigned char volat=
ile [usertype] *__addr
   arch/sh/include/asm/io.h:184:1: sparse:     got void [noderef] __iomem *
   arch/sh/include/asm/io.h:184:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected unsigned char volatile [use=
rtype] *__addr @@     got void [noderef] __iomem * @@
   arch/sh/include/asm/io.h:184:1: sparse:     expected unsigned char volat=
ile [usertype] *__addr
   arch/sh/include/asm/io.h:184:1: sparse:     got void [noderef] __iomem *
   arch/sh/include/asm/io.h:184:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected unsigned char volatile [use=
rtype] *__addr @@     got void [noderef] __iomem * @@
   arch/sh/include/asm/io.h:184:1: sparse:     expected unsigned char volat=
ile [usertype] *__addr
   arch/sh/include/asm/io.h:184:1: sparse:     got void [noderef] __iomem *
   arch/sh/include/asm/io.h:184:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected unsigned char volatile [use=
rtype] *__addr @@     got void [noderef] __iomem * @@
   arch/sh/include/asm/io.h:184:1: sparse:     expected unsigned char volat=
ile [usertype] *__addr
   arch/sh/include/asm/io.h:184:1: sparse:     got void [noderef] __iomem *
   arch/sh/boards/mach-se/770x/setup.c: note: in included file:
>> arch/sh/include/mach-se/mach/mrshpc.h:9:14: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected void const volatile=
 [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:9:14: sparse:     expected void co=
nst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:9:14: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:12:14: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:12:14: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:12:14: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:13:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:13:17: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:13:17: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:15:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:15:17: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:15:17: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:23:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected void const volatile=
 [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:23:9: sparse:     expected void co=
nst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:23:9: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:24:13: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:24:13: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:24:13: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:26:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:26:17: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:26:17: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:29:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:29:17: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:29:17: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:32:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected void const volatile=
 [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:32:9: sparse:     expected void co=
nst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:32:9: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:33:14: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:33:14: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:33:14: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:35:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:35:17: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:35:17: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:38:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:38:17: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:38:17: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:41:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected void const volatile=
 [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:41:9: sparse:     expected void co=
nst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:41:9: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:42:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected void const volatile=
 [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:42:9: sparse:     expected void co=
nst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:42:9: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:43:14: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:43:14: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:43:14: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:44:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:44:17: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:44:17: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:46:17: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected void const volatil=
e [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:46:17: sparse:     expected void c=
onst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:46:17: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:48:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected void const volatile=
 [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:48:9: sparse:     expected void co=
nst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:48:9: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:49:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected void const volatile=
 [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:49:9: sparse:     expected void co=
nst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:49:9: sparse:     got unsigned int
   arch/sh/include/mach-se/mach/mrshpc.h:50:9: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected void const volatile=
 [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/mach-se/mach/mrshpc.h:50:9: sparse:     expected void co=
nst volatile [noderef] __iomem *ptr
   arch/sh/include/mach-se/mach/mrshpc.h:50:9: sparse:     got unsigned int
--
>> arch/sh/boards/mach-se/770x/irq.c:100:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/boards/mach-se/770x/irq.c:100:9: sparse:     expected void const=
 volatile [noderef] __iomem *ptr
   arch/sh/boards/mach-se/770x/irq.c:100:9: sparse:     got unsigned int
   arch/sh/boards/mach-se/770x/irq.c:101:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/boards/mach-se/770x/irq.c:101:9: sparse:     expected void const=
 volatile [noderef] __iomem *ptr
   arch/sh/boards/mach-se/770x/irq.c:101:9: sparse:     got unsigned int
   arch/sh/boards/mach-se/770x/irq.c:102:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/boards/mach-se/770x/irq.c:102:9: sparse:     expected void const=
 volatile [noderef] __iomem *ptr
   arch/sh/boards/mach-se/770x/irq.c:102:9: sparse:     got unsigned int
   arch/sh/boards/mach-se/770x/irq.c:103:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/boards/mach-se/770x/irq.c:103:9: sparse:     expected void const=
 volatile [noderef] __iomem *ptr
   arch/sh/boards/mach-se/770x/irq.c:103:9: sparse:     got unsigned int
   arch/sh/boards/mach-se/770x/irq.c:104:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/boards/mach-se/770x/irq.c:104:9: sparse:     expected void const=
 volatile [noderef] __iomem *ptr
   arch/sh/boards/mach-se/770x/irq.c:104:9: sparse:     got unsigned int
   arch/sh/boards/mach-se/770x/irq.c:105:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/boards/mach-se/770x/irq.c:105:9: sparse:     expected void const=
 volatile [noderef] __iomem *ptr
   arch/sh/boards/mach-se/770x/irq.c:105:9: sparse:     got unsigned int
   arch/sh/boards/mach-se/770x/irq.c:106:9: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/boards/mach-se/770x/irq.c:106:9: sparse:     expected void const=
 volatile [noderef] __iomem *ptr
   arch/sh/boards/mach-se/770x/irq.c:106:9: sparse:     got unsigned int
--
   fs/binfmt_flat.c:402:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected unsigned long const *__gu_addr @@ =
    got unsigned long [noderef] __user *[assigned] ptr @@
   fs/binfmt_flat.c:402:9: sparse:     expected unsigned long const *__gu_a=
ddr
   fs/binfmt_flat.c:402:9: sparse:     got unsigned long [noderef] __user *=
[assigned] ptr
>> fs/binfmt_flat.c:402:9: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got unsigned long const *__gu_addr @@
   fs/binfmt_flat.c:402:9: sparse:     expected void const volatile [nodere=
f] __user *ptr
   fs/binfmt_flat.c:402:9: sparse:     got unsigned long const *__gu_addr
   fs/binfmt_flat.c:775:29: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected unsigned int const *__gu_addr @@ =
    got unsigned int [noderef] [usertype] __user *[assigned] rp @@
   fs/binfmt_flat.c:775:29: sparse:     expected unsigned int const *__gu_a=
ddr
   fs/binfmt_flat.c:775:29: sparse:     got unsigned int [noderef] [usertyp=
e] __user *[assigned] rp
   fs/binfmt_flat.c:775:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] __us=
er *ptr @@     got unsigned int const *__gu_addr @@
   fs/binfmt_flat.c:775:29: sparse:     expected void const volatile [noder=
ef] __user *ptr
   fs/binfmt_flat.c:775:29: sparse:     got unsigned int const *__gu_addr
   fs/binfmt_flat.c:812:29: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected restricted __be32 const *__gu_add=
r @@     got restricted __be32 [noderef] [usertype] __user * @@
   fs/binfmt_flat.c:812:29: sparse:     expected restricted __be32 const *_=
_gu_addr
   fs/binfmt_flat.c:812:29: sparse:     got restricted __be32 [noderef] [us=
ertype] __user *
   fs/binfmt_flat.c:812:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] __us=
er *ptr @@     got restricted __be32 const *__gu_addr @@
   fs/binfmt_flat.c:812:29: sparse:     expected void const volatile [noder=
ef] __user *ptr
   fs/binfmt_flat.c:812:29: sparse:     got restricted __be32 const *__gu_a=
ddr
   fs/binfmt_flat.c:855:29: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected restricted __be32 const *__gu_add=
r @@     got restricted __be32 [noderef] [usertype] __user * @@
   fs/binfmt_flat.c:855:29: sparse:     expected restricted __be32 const *_=
_gu_addr
   fs/binfmt_flat.c:855:29: sparse:     got restricted __be32 [noderef] [us=
ertype] __user *
   fs/binfmt_flat.c:855:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] __us=
er *ptr @@     got restricted __be32 const *__gu_addr @@
   fs/binfmt_flat.c:855:29: sparse:     expected void const volatile [noder=
ef] __user *ptr
   fs/binfmt_flat.c:855:29: sparse:     got restricted __be32 const *__gu_a=
ddr
   fs/binfmt_flat.c:865:13: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void *addr @@     got void [nodere=
f] __user *__cl_addr @@
   fs/binfmt_flat.c:865:13: sparse:     expected void *addr
   fs/binfmt_flat.c:865:13: sparse:     got void [noderef] __user *__cl_addr
--
   sound/core/hwdep.c:265:29: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user * @@
   sound/core/hwdep.c:265:29: sparse:     expected int const *__gu_addr
   sound/core/hwdep.c:265:29: sparse:     got int [noderef] __user *
>> sound/core/hwdep.c:265:29: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   sound/core/hwdep.c:265:29: sparse:     expected void const volatile [nod=
eref] __user *ptr
   sound/core/hwdep.c:265:29: sparse:     got int const *__gu_addr
   sound/core/hwdep.c:294:29: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected unsigned int const *__gu_addr @=
@     got unsigned int [noderef] __user * @@
   sound/core/hwdep.c:294:29: sparse:     expected unsigned int const *__gu=
_addr
   sound/core/hwdep.c:294:29: sparse:     got unsigned int [noderef] __user=
 *
>> sound/core/hwdep.c:294:29: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got unsigned int const *__gu_addr @@
   sound/core/hwdep.c:294:29: sparse:     expected void const volatile [nod=
eref] __user *ptr
   sound/core/hwdep.c:294:29: sparse:     got unsigned int const *__gu_addr
--
   sound/core/timer.c:2045:13: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected int const *__gu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/timer.c:2045:13: sparse:     expected int const *__gu_addr
   sound/core/timer.c:2045:13: sparse:     got int [noderef] __user *p
>> sound/core/timer.c:2045:13: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] _=
_user *ptr @@     got int const *__gu_addr @@
   sound/core/timer.c:2045:13: sparse:     expected void const volatile [no=
deref] __user *ptr
   sound/core/timer.c:2045:13: sparse:     got int const *__gu_addr
   sound/core/timer.c:790:25: sparse: sparse: context imbalance in 'snd_tim=
er_process_callbacks' - unexpected unlock
--
   sound/core/oss/pcm_oss.c:2592:21: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int const *__gu_addr @@ =
    got int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2592:21: sparse:     expected int const *__gu_a=
ddr
   sound/core/oss/pcm_oss.c:2592:21: sparse:     got int [noderef] __user *p
>> sound/core/oss/pcm_oss.c:2592:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got int const *__gu_addr @@
   sound/core/oss/pcm_oss.c:2592:21: sparse:     expected void const volati=
le [noderef] __user *ptr
   sound/core/oss/pcm_oss.c:2592:21: sparse:     got int const *__gu_addr
   sound/core/oss/pcm_oss.c:2603:21: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int const *__gu_addr @@ =
    got int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2603:21: sparse:     expected int const *__gu_a=
ddr
   sound/core/oss/pcm_oss.c:2603:21: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2603:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got int const *__gu_addr @@
   sound/core/oss/pcm_oss.c:2603:21: sparse:     expected void const volati=
le [noderef] __user *ptr
   sound/core/oss/pcm_oss.c:2603:21: sparse:     got int const *__gu_addr
   sound/core/oss/pcm_oss.c:2615:21: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int const *__gu_addr @@ =
    got int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2615:21: sparse:     expected int const *__gu_a=
ddr
   sound/core/oss/pcm_oss.c:2615:21: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2615:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got int const *__gu_addr @@
   sound/core/oss/pcm_oss.c:2615:21: sparse:     expected void const volati=
le [noderef] __user *ptr
   sound/core/oss/pcm_oss.c:2615:21: sparse:     got int const *__gu_addr
   sound/core/oss/pcm_oss.c:2627:21: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int const *__gu_addr @@ =
    got int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2627:21: sparse:     expected int const *__gu_a=
ddr
   sound/core/oss/pcm_oss.c:2627:21: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2627:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got int const *__gu_addr @@
   sound/core/oss/pcm_oss.c:2627:21: sparse:     expected void const volati=
le [noderef] __user *ptr
   sound/core/oss/pcm_oss.c:2627:21: sparse:     got int const *__gu_addr
   sound/core/oss/pcm_oss.c:2644:21: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int const *__gu_addr @@ =
    got int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2644:21: sparse:     expected int const *__gu_a=
ddr
   sound/core/oss/pcm_oss.c:2644:21: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2644:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got int const *__gu_addr @@
   sound/core/oss/pcm_oss.c:2644:21: sparse:     expected void const volati=
le [noderef] __user *ptr
   sound/core/oss/pcm_oss.c:2644:21: sparse:     got int const *__gu_addr
   sound/core/oss/pcm_oss.c:2651:21: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int const *__gu_addr @@ =
    got int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2651:21: sparse:     expected int const *__gu_a=
ddr
   sound/core/oss/pcm_oss.c:2651:21: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2651:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got int const *__gu_addr @@
   sound/core/oss/pcm_oss.c:2651:21: sparse:     expected void const volati=
le [noderef] __user *ptr
   sound/core/oss/pcm_oss.c:2651:21: sparse:     got int const *__gu_addr
   sound/core/oss/pcm_oss.c:2678:21: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int const *__gu_addr @@ =
    got int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2678:21: sparse:     expected int const *__gu_a=
ddr
   sound/core/oss/pcm_oss.c:2678:21: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2678:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got int const *__gu_addr @@
   sound/core/oss/pcm_oss.c:2678:21: sparse:     expected void const volati=
le [noderef] __user *ptr
   sound/core/oss/pcm_oss.c:2678:21: sparse:     got int const *__gu_addr
--
   sound/sh/sh_dac_audio.c:167:51: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void volatile [noderef] __i=
omem *dst @@     got char * @@
   sound/sh/sh_dac_audio.c:167:51: sparse:     expected void volatile [node=
ref] __iomem *dst
   sound/sh/sh_dac_audio.c:167:51: sparse:     got char *
   sound/sh/sh_dac_audio.c:186:39: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void volatile [noderef] __i=
omem * @@     got char * @@
   sound/sh/sh_dac_audio.c:186:39: sparse:     expected void volatile [node=
ref] __iomem *
   sound/sh/sh_dac_audio.c:186:39: sparse:     got char *
   sound/sh/sh_dac_audio.c:204:37: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void volatile [noderef] __i=
omem * @@     got char * @@
   sound/sh/sh_dac_audio.c:204:37: sparse:     expected void volatile [node=
ref] __iomem *
   sound/sh/sh_dac_audio.c:204:37: sparse:     got char *
   sound/sh/sh_dac_audio.c: note: in included file:
>> arch/sh/include/cpu-sh3/cpu/dac.h:38:21: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/cpu-sh3/cpu/dac.h:38:21: sparse:     expected void const=
 volatile [noderef] __iomem *ptr
   arch/sh/include/cpu-sh3/cpu/dac.h:38:21: sparse:     got unsigned int
   arch/sh/include/cpu-sh3/cpu/dac.h:39:14: sparse: sparse: incorrect type =
in argument 1 (different base types) @@     expected void const volatile [n=
oderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/include/cpu-sh3/cpu/dac.h:39:14: sparse:     expected void const=
 volatile [noderef] __iomem *ptr
   arch/sh/include/cpu-sh3/cpu/dac.h:39:14: sparse:     got unsigned int
--
   sound/core/seq/oss/seq_oss_timer.c:224:21: sparse: sparse: incorrect typ=
e in initializer (different address spaces) @@     expected int const *__gu=
_addr @@     got int [noderef] __user *arg @@
   sound/core/seq/oss/seq_oss_timer.c:224:21: sparse:     expected int cons=
t *__gu_addr
   sound/core/seq/oss/seq_oss_timer.c:224:21: sparse:     got int [noderef]=
 __user *arg
>> sound/core/seq/oss/seq_oss_timer.c:224:21: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void const volat=
ile [noderef] __user *ptr @@     got int const *__gu_addr @@
   sound/core/seq/oss/seq_oss_timer.c:224:21: sparse:     expected void con=
st volatile [noderef] __user *ptr
   sound/core/seq/oss/seq_oss_timer.c:224:21: sparse:     got int const *__=
gu_addr
   sound/core/seq/oss/seq_oss_timer.c:243:21: sparse: sparse: incorrect typ=
e in initializer (different address spaces) @@     expected int const *__gu=
_addr @@     got int [noderef] __user *arg @@
   sound/core/seq/oss/seq_oss_timer.c:243:21: sparse:     expected int cons=
t *__gu_addr
   sound/core/seq/oss/seq_oss_timer.c:243:21: sparse:     got int [noderef]=
 __user *arg
   sound/core/seq/oss/seq_oss_timer.c:243:21: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void const volat=
ile [noderef] __user *ptr @@     got int const *__gu_addr @@
   sound/core/seq/oss/seq_oss_timer.c:243:21: sparse:     expected void con=
st volatile [noderef] __user *ptr
   sound/core/seq/oss/seq_oss_timer.c:243:21: sparse:     got int const *__=
gu_addr
   sound/core/seq/oss/seq_oss_timer.c:247:21: sparse: sparse: incorrect typ=
e in initializer (different address spaces) @@     expected int const *__gu=
_addr @@     got int [noderef] __user *arg @@
   sound/core/seq/oss/seq_oss_timer.c:247:21: sparse:     expected int cons=
t *__gu_addr
   sound/core/seq/oss/seq_oss_timer.c:247:21: sparse:     got int [noderef]=
 __user *arg
   sound/core/seq/oss/seq_oss_timer.c:247:21: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void const volat=
ile [noderef] __user *ptr @@     got int const *__gu_addr @@
   sound/core/seq/oss/seq_oss_timer.c:247:21: sparse:     expected void con=
st volatile [noderef] __user *ptr
   sound/core/seq/oss/seq_oss_timer.c:247:21: sparse:     got int const *__=
gu_addr
--
   sound/core/seq/oss/seq_oss_ioctl.c:97:21: sparse: sparse: incorrect type=
 in initializer (different address spaces) @@     expected int const *__gu_=
addr @@     got int [noderef] __user *p @@
   sound/core/seq/oss/seq_oss_ioctl.c:97:21: sparse:     expected int const=
 *__gu_addr
   sound/core/seq/oss/seq_oss_ioctl.c:97:21: sparse:     got int [noderef] =
__user *p
>> sound/core/seq/oss/seq_oss_ioctl.c:97:21: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void const volati=
le [noderef] __user *ptr @@     got int const *__gu_addr @@
   sound/core/seq/oss/seq_oss_ioctl.c:97:21: sparse:     expected void cons=
t volatile [noderef] __user *ptr
   sound/core/seq/oss/seq_oss_ioctl.c:97:21: sparse:     got int const *__g=
u_addr
   sound/core/seq/oss/seq_oss_ioctl.c:115:21: sparse: sparse: incorrect typ=
e in initializer (different address spaces) @@     expected int const *__gu=
_addr @@     got int [noderef] __user *p @@
   sound/core/seq/oss/seq_oss_ioctl.c:115:21: sparse:     expected int cons=
t *__gu_addr
   sound/core/seq/oss/seq_oss_ioctl.c:115:21: sparse:     got int [noderef]=
 __user *p
   sound/core/seq/oss/seq_oss_ioctl.c:115:21: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void const volat=
ile [noderef] __user *ptr @@     got int const *__gu_addr @@
   sound/core/seq/oss/seq_oss_ioctl.c:115:21: sparse:     expected void con=
st volatile [noderef] __user *ptr
   sound/core/seq/oss/seq_oss_ioctl.c:115:21: sparse:     got int const *__=
gu_addr
   sound/core/seq/oss/seq_oss_ioctl.c:126:21: sparse: sparse: incorrect typ=
e in initializer (different address spaces) @@     expected int const *__gu=
_addr @@     got int [noderef] __user *p @@
   sound/core/seq/oss/seq_oss_ioctl.c:126:21: sparse:     expected int cons=
t *__gu_addr
   sound/core/seq/oss/seq_oss_ioctl.c:126:21: sparse:     got int [noderef]=
 __user *p
   sound/core/seq/oss/seq_oss_ioctl.c:126:21: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void const volat=
ile [noderef] __user *ptr @@     got int const *__gu_addr @@
   sound/core/seq/oss/seq_oss_ioctl.c:126:21: sparse:     expected void con=
st volatile [noderef] __user *ptr
   sound/core/seq/oss/seq_oss_ioctl.c:126:21: sparse:     got int const *__=
gu_addr
   sound/core/seq/oss/seq_oss_ioctl.c:132:21: sparse: sparse: incorrect typ=
e in initializer (different address spaces) @@     expected int const *__gu=
_addr @@     got int [noderef] __user *p @@
   sound/core/seq/oss/seq_oss_ioctl.c:132:21: sparse:     expected int cons=
t *__gu_addr
   sound/core/seq/oss/seq_oss_ioctl.c:132:21: sparse:     got int [noderef]=
 __user *p
   sound/core/seq/oss/seq_oss_ioctl.c:132:21: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void const volat=
ile [noderef] __user *ptr @@     got int const *__gu_addr @@
   sound/core/seq/oss/seq_oss_ioctl.c:132:21: sparse:     expected void con=
st volatile [noderef] __user *ptr
   sound/core/seq/oss/seq_oss_ioctl.c:132:21: sparse:     got int const *__=
gu_addr
   sound/core/seq/oss/seq_oss_ioctl.c:150:21: sparse: sparse: incorrect typ=
e in initializer (different address spaces) @@     expected int const *__gu=
_addr @@     got int [noderef] __user *p @@
   sound/core/seq/oss/seq_oss_ioctl.c:150:21: sparse:     expected int cons=
t *__gu_addr
   sound/core/seq/oss/seq_oss_ioctl.c:150:21: sparse:     got int [noderef]=
 __user *p
   sound/core/seq/oss/seq_oss_ioctl.c:150:21: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void const volat=
ile [noderef] __user *ptr @@     got int const *__gu_addr @@
   sound/core/seq/oss/seq_oss_ioctl.c:150:21: sparse:     expected void con=
st volatile [noderef] __user *ptr
   sound/core/seq/oss/seq_oss_ioctl.c:150:21: sparse:     got int const *__=
gu_addr
   sound/core/seq/oss/seq_oss_ioctl.c:162:21: sparse: sparse: incorrect typ=
e in initializer (different address spaces) @@     expected int const *__gu=
_addr @@     got int [noderef] __user *p @@
   sound/core/seq/oss/seq_oss_ioctl.c:162:21: sparse:     expected int cons=
t *__gu_addr
   sound/core/seq/oss/seq_oss_ioctl.c:162:21: sparse:     got int [noderef]=
 __user *p
   sound/core/seq/oss/seq_oss_ioctl.c:162:21: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void const volat=
ile [noderef] __user *ptr @@     got int const *__gu_addr @@
   sound/core/seq/oss/seq_oss_ioctl.c:162:21: sparse:     expected void con=
st volatile [noderef] __user *ptr
   sound/core/seq/oss/seq_oss_ioctl.c:162:21: sparse:     got int const *__=
gu_addr

vim +151 arch/sh/include/asm/mmu_context.h

^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  139  =

^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  140  #if defined(CONFIG_CPU_SH3) || defined(CONFIG_CPU_SH4)
^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  141  /*
^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  142   * If this processor has an MMU, we need methods to turn it off/on =
..
^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  143   * paging_init() will also have to be updated for the processor in
^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  144   * question.
^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  145   */
^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  146  static inline void enable_mmu(void)
^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  147  {
aec5e0e1c179fac4 include/asm-sh/mmu_context.h      Paul Mundt     2006-12-2=
5  148  	unsigned int cpu =3D smp_processor_id();
aec5e0e1c179fac4 include/asm-sh/mmu_context.h      Paul Mundt     2006-12-2=
5  149  =

^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  150  	/* Enable MMU */
9d56dd3b083a3bec arch/sh/include/asm/mmu_context.h Paul Mundt     2010-01-2=
6 @151  	__raw_writel(MMU_CONTROL_INIT, MMUCR);
298476220d1f793c include/asm-sh/mmu_context.h      Paul Mundt     2006-09-2=
7  152  	ctrl_barrier();
^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  153  =

aec5e0e1c179fac4 include/asm-sh/mmu_context.h      Paul Mundt     2006-12-2=
5  154  	if (asid_cache(cpu) =3D=3D NO_CONTEXT)
aec5e0e1c179fac4 include/asm-sh/mmu_context.h      Paul Mundt     2006-12-2=
5  155  		asid_cache(cpu) =3D MMU_CONTEXT_FIRST_VERSION;
^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  156  =

aec5e0e1c179fac4 include/asm-sh/mmu_context.h      Paul Mundt     2006-12-2=
5  157  	set_asid(asid_cache(cpu) & MMU_CONTEXT_ASID_MASK);
^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  158  }
^1da177e4c3f4152 include/asm-sh/mmu_context.h      Linus Torvalds 2005-04-1=
6  159  =


:::::: The code at line 151 was first introduced by commit
:::::: 9d56dd3b083a3bec56e9da35ce07baca81030b03 sh: Mass ctrl_in/outX to __=
raw_read/writeX conversion.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1041677817130359770==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AAA=
--===============1041677817130359770==--

