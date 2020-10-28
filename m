Content-Type: multipart/mixed; boundary="===============2776218998075177445=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: arch/sh/kernel/cpu/sh2a/setup-sh7201.c:414:9: sparse: sparse: incorrect type in argument 1 (different base types)
Date: Thu, 29 Oct 2020 06:11:30 +0800
Message-ID: <202010290623.AdkYeaxA-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2776218998075177445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Luc,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ed8780e3f2ecc82645342d070c6b4e530532e680
commit: e5fc436f06eef54ef512ea55a9db8eb9f2e76959 sparse: use static inline =
for __chk_{user,io}_ptr()
date:   9 weeks ago
config: sh-randconfig-s031-20201028 (attached as .config)
compiler: sh4-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-56-gc09e8239-dirty
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
>> arch/sh/kernel/cpu/sh2a/setup-sh7201.c:414:9: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
>> arch/sh/kernel/cpu/sh2a/setup-sh7201.c:414:9: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/setup-sh7201.c:414:9: sparse:     got unsigned i=
nt
>> arch/sh/kernel/cpu/sh2a/setup-sh7201.c:414:9: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
>> arch/sh/kernel/cpu/sh2a/setup-sh7201.c:414:9: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/setup-sh7201.c:414:9: sparse:     got unsigned i=
nt
--
>> arch/sh/kernel/cpu/sh2a/clock-sh7201.c:27:26: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
>> arch/sh/kernel/cpu/sh2a/clock-sh7201.c:27:26: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/clock-sh7201.c:27:26: sparse:     got unsigned i=
nt
   arch/sh/kernel/cpu/sh2a/clock-sh7201.c:36:20: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh2a/clock-sh7201.c:36:20: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/clock-sh7201.c:36:20: sparse:     got unsigned i=
nt
   arch/sh/kernel/cpu/sh2a/clock-sh7201.c:46:20: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh2a/clock-sh7201.c:46:20: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/clock-sh7201.c:46:20: sparse:     got unsigned i=
nt
   arch/sh/kernel/cpu/sh2a/clock-sh7201.c:56:21: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh2a/clock-sh7201.c:56:21: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/clock-sh7201.c:56:21: sparse:     got unsigned i=
nt
--
   fs/f2fs/file.c:48:54: sparse: sparse: cast from restricted vm_fault_t
   fs/f2fs/file.c:1975:13: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected int const *__gu_addr @@     got in=
t [noderef] __user * @@
   fs/f2fs/file.c:1975:13: sparse:     expected int const *__gu_addr
   fs/f2fs/file.c:1975:13: sparse:     got int [noderef] __user *
>> fs/f2fs/file.c:1975:13: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got int const *__gu_addr @@
>> fs/f2fs/file.c:1975:13: sparse:     expected void const volatile [nodere=
f] __user *ptr
   fs/f2fs/file.c:1975:13: sparse:     got int const *__gu_addr
   fs/f2fs/file.c:2229:13: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected unsigned int const *__gu_addr @@  =
   got unsigned int [noderef] [usertype] __user * @@
   fs/f2fs/file.c:2229:13: sparse:     expected unsigned int const *__gu_ad=
dr
   fs/f2fs/file.c:2229:13: sparse:     got unsigned int [noderef] [usertype=
] __user *
>> fs/f2fs/file.c:2229:13: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got unsigned int const *__gu_addr @@
   fs/f2fs/file.c:2229:13: sparse:     expected void const volatile [nodere=
f] __user *ptr
   fs/f2fs/file.c:2229:13: sparse:     got unsigned int const *__gu_addr
   fs/f2fs/file.c:2466:13: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected unsigned int const *__gu_addr @@  =
   got unsigned int [noderef] [usertype] __user * @@
   fs/f2fs/file.c:2466:13: sparse:     expected unsigned int const *__gu_ad=
dr
   fs/f2fs/file.c:2466:13: sparse:     got unsigned int [noderef] [usertype=
] __user *
   fs/f2fs/file.c:2466:13: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got unsigned int const *__gu_addr @@
   fs/f2fs/file.c:2466:13: sparse:     expected void const volatile [nodere=
f] __user *ptr
   fs/f2fs/file.c:2466:13: sparse:     got unsigned int const *__gu_addr
   fs/f2fs/file.c:3226:13: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected unsigned int const *__gu_addr @@  =
   got unsigned int [noderef] [usertype] __user * @@
   fs/f2fs/file.c:3226:13: sparse:     expected unsigned int const *__gu_ad=
dr
   fs/f2fs/file.c:3226:13: sparse:     got unsigned int [noderef] [usertype=
] __user *
   fs/f2fs/file.c:3226:13: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got unsigned int const *__gu_addr @@
   fs/f2fs/file.c:3226:13: sparse:     expected void const volatile [nodere=
f] __user *ptr
   fs/f2fs/file.c:3226:13: sparse:     got unsigned int const *__gu_addr
   fs/f2fs/file.c:3379:36: sparse: sparse: incorrect type in argument 1 (di=
fferent base types) @@     expected unsigned short const [usertype] *pwcs @=
@     got restricted __le16 * @@
   fs/f2fs/file.c:3379:36: sparse:     expected unsigned short const [usert=
ype] *pwcs
   fs/f2fs/file.c:3379:36: sparse:     got restricted __le16 *
   fs/f2fs/file.c:3415:28: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected unsigned short [usertype] *pwcs @@     =
got restricted __le16 * @@
   fs/f2fs/file.c:3415:28: sparse:     expected unsigned short [usertype] *=
pwcs
   fs/f2fs/file.c:3415:28: sparse:     got restricted __le16 *
--
   fs/jfs/jfs_debug.c:36:13: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected char const *__gu_addr @@     got=
 char const [noderef] __user *buffer @@
   fs/jfs/jfs_debug.c:36:13: sparse:     expected char const *__gu_addr
   fs/jfs/jfs_debug.c:36:13: sparse:     got char const [noderef] __user *b=
uffer
>> fs/jfs/jfs_debug.c:36:13: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got char const *__gu_addr @@
>> fs/jfs/jfs_debug.c:36:13: sparse:     expected void const volatile [node=
ref] __user *ptr
   fs/jfs/jfs_debug.c:36:13: sparse:     got char const *__gu_addr
--
   fs/nilfs2/ioctl.c:138:13: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user * @@
   fs/nilfs2/ioctl.c:138:13: sparse:     expected int const *__gu_addr
   fs/nilfs2/ioctl.c:138:13: sparse:     got int [noderef] __user *
>> fs/nilfs2/ioctl.c:138:13: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
>> fs/nilfs2/ioctl.c:138:13: sparse:     expected void const volatile [node=
ref] __user *ptr
   fs/nilfs2/ioctl.c:138:13: sparse:     got int const *__gu_addr
--
   block/bsg.c:336:13: sparse: sparse: incorrect type in initializer (diffe=
rent address spaces) @@     expected int const *__gu_addr @@     got int [n=
oderef] __user *uarg @@
   block/bsg.c:336:13: sparse:     expected int const *__gu_addr
   block/bsg.c:336:13: sparse:     got int [noderef] __user *uarg
>> block/bsg.c:336:13: sparse: sparse: incorrect type in argument 1 (differ=
ent address spaces) @@     expected void const volatile [noderef] __user *p=
tr @@     got int const *__gu_addr @@
>> block/bsg.c:336:13: sparse:     expected void const volatile [noderef] _=
_user *ptr
   block/bsg.c:336:13: sparse:     got int const *__gu_addr
--
   drivers/net/ppp/ppp_generic.c:925:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:925:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:925:21: sparse:     got int [noderef] __us=
er *p
>> drivers/net/ppp/ppp_generic.c:925:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
>> drivers/net/ppp/ppp_generic.c:925:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:925:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:939:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:939:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:939:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:939:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:939:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:939:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:954:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:954:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:954:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:954:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:954:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:954:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:651:29: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:651:29: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:651:29: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:651:29: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:651:29: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:651:29: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:681:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:681:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:681:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:681:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:681:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:681:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:688:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:688:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:688:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:688:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:688:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:688:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:726:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:726:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:726:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:726:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:726:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:726:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:755:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:755:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:755:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:755:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:755:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:755:21: sparse:     got int const *__gu_ad=
dr
   drivers/net/ppp/ppp_generic.c:823:21: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected int const *__gu_addr=
 @@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_generic.c:823:21: sparse:     expected int const *__=
gu_addr
   drivers/net/ppp/ppp_generic.c:823:21: sparse:     got int [noderef] __us=
er *p
   drivers/net/ppp/ppp_generic.c:823:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_generic.c:823:21: sparse:     expected void const vo=
latile [noderef] __user *ptr
   drivers/net/ppp/ppp_generic.c:823:21: sparse:     got int const *__gu_ad=
dr
--
   drivers/net/ppp/pppoe.c:765:21: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected int const *__gu_addr @@   =
  got int [noderef] __user * @@
   drivers/net/ppp/pppoe.c:765:21: sparse:     expected int const *__gu_addr
   drivers/net/ppp/pppoe.c:765:21: sparse:     got int [noderef] __user *
>> drivers/net/ppp/pppoe.c:765:21: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got int const *__gu_addr @@
>> drivers/net/ppp/pppoe.c:765:21: sparse:     expected void const volatile=
 [noderef] __user *ptr
   drivers/net/ppp/pppoe.c:765:21: sparse:     got int const *__gu_addr
   drivers/net/ppp/pppoe.c:778:21: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected int const *__gu_addr @@   =
  got int [noderef] __user * @@
   drivers/net/ppp/pppoe.c:778:21: sparse:     expected int const *__gu_addr
   drivers/net/ppp/pppoe.c:778:21: sparse:     got int [noderef] __user *
   drivers/net/ppp/pppoe.c:778:21: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/pppoe.c:778:21: sparse:     expected void const volatile=
 [noderef] __user *ptr
   drivers/net/ppp/pppoe.c:778:21: sparse:     got int const *__gu_addr
--
   drivers/scsi/scsi_ioctl.c:48:21: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const *__gu_=
addr @@     got unsigned int [noderef] __user * @@
   drivers/scsi/scsi_ioctl.c:48:21: sparse:     expected unsigned int const=
 *__gu_addr
   drivers/scsi/scsi_ioctl.c:48:21: sparse:     got unsigned int [noderef] =
__user *
>> drivers/scsi/scsi_ioctl.c:48:21: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __user *ptr @@     got unsigned int const *__gu_addr @@
>> drivers/scsi/scsi_ioctl.c:48:21: sparse:     expected void const volatil=
e [noderef] __user *ptr
   drivers/scsi/scsi_ioctl.c:48:21: sparse:     got unsigned int const *__g=
u_addr
--
   drivers/scsi/scsi_error.c:2341:17: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int const *__gu_addr @@=
     got int [noderef] __user *arg @@
   drivers/scsi/scsi_error.c:2341:17: sparse:     expected int const *__gu_=
addr
   drivers/scsi/scsi_error.c:2341:17: sparse:     got int [noderef] __user =
*arg
>> drivers/scsi/scsi_error.c:2341:17: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __user *ptr @@     got int const *__gu_addr @@
>> drivers/scsi/scsi_error.c:2341:17: sparse:     expected void const volat=
ile [noderef] __user *ptr
   drivers/scsi/scsi_error.c:2341:17: sparse:     got int const *__gu_addr
--
   drivers/scsi/sg.c:415:21: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user * @@
   drivers/scsi/sg.c:415:21: sparse:     expected int const *__gu_addr
   drivers/scsi/sg.c:415:21: sparse:     got int [noderef] __user *
>> drivers/scsi/sg.c:415:21: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
>> drivers/scsi/sg.c:415:21: sparse:     expected void const volatile [node=
ref] __user *ptr
   drivers/scsi/sg.c:415:21: sparse:     got int const *__gu_addr
   drivers/scsi/sg.c:419:32: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user * @@
   drivers/scsi/sg.c:419:32: sparse:     expected int const *__gu_addr
   drivers/scsi/sg.c:419:32: sparse:     got int [noderef] __user *
   drivers/scsi/sg.c:419:32: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
   drivers/scsi/sg.c:419:32: sparse:     expected void const volatile [node=
ref] __user *ptr
   drivers/scsi/sg.c:419:32: sparse:     got int const *__gu_addr
   drivers/scsi/sg.c:425:32: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected signed int const *__gu_addr @@  =
   got signed int [noderef] __user * @@
   drivers/scsi/sg.c:425:32: sparse:     expected signed int const *__gu_ad=
dr
   drivers/scsi/sg.c:425:32: sparse:     got signed int [noderef] __user *
>> drivers/scsi/sg.c:425:32: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got signed int const *__gu_addr @@
   drivers/scsi/sg.c:425:32: sparse:     expected void const volatile [node=
ref] __user *ptr
   drivers/scsi/sg.c:425:32: sparse:     got signed int const *__gu_addr
   drivers/scsi/sg.c:431:32: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user * @@
   drivers/scsi/sg.c:431:32: sparse:     expected int const *__gu_addr
   drivers/scsi/sg.c:431:32: sparse:     got int [noderef] __user *
   drivers/scsi/sg.c:431:32: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
   drivers/scsi/sg.c:431:32: sparse:     expected void const volatile [node=
ref] __user *ptr
   drivers/scsi/sg.c:431:32: sparse:     got int const *__gu_addr
   drivers/scsi/sg.c:638:13: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected char const *__gu_addr @@     got=
 char const [noderef] __user *[assigned] buf @@
   drivers/scsi/sg.c:638:13: sparse:     expected char const *__gu_addr
   drivers/scsi/sg.c:638:13: sparse:     got char const [noderef] __user *[=
assigned] buf
>> drivers/scsi/sg.c:638:13: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got char const *__gu_addr @@
   drivers/scsi/sg.c:638:13: sparse:     expected void const volatile [node=
ref] __user *ptr
   drivers/scsi/sg.c:638:13: sparse:     got char const *__gu_addr
   drivers/scsi/sg.c:955:26: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user *ip @@
   drivers/scsi/sg.c:955:26: sparse:     expected int const *__gu_addr
   drivers/scsi/sg.c:955:26: sparse:     got int [noderef] __user *ip
   drivers/scsi/sg.c:955:26: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
   drivers/scsi/sg.c:955:26: sparse:     expected void const volatile [node=
ref] __user *ptr
   drivers/scsi/sg.c:955:26: sparse:     got int const *__gu_addr
   drivers/scsi/sg.c:998:26: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user *ip @@
   drivers/scsi/sg.c:998:26: sparse:     expected int const *__gu_addr
   drivers/scsi/sg.c:998:26: sparse:     got int [noderef] __user *ip
   drivers/scsi/sg.c:998:26: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
   drivers/scsi/sg.c:998:26: sparse:     expected void const volatile [node=
ref] __user *ptr
   drivers/scsi/sg.c:998:26: sparse:     got int const *__gu_addr
   drivers/scsi/sg.c:1026:26: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *ip @@
   drivers/scsi/sg.c:1026:26: sparse:     expected int const *__gu_addr
   drivers/scsi/sg.c:1026:26: sparse:     got int [noderef] __user *ip
   drivers/scsi/sg.c:1026:26: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   drivers/scsi/sg.c:1026:26: sparse:     expected void const volatile [nod=
eref] __user *ptr
   drivers/scsi/sg.c:1026:26: sparse:     got int const *__gu_addr
   drivers/scsi/sg.c:1051:26: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *ip @@
   drivers/scsi/sg.c:1051:26: sparse:     expected int const *__gu_addr
   drivers/scsi/sg.c:1051:26: sparse:     got int [noderef] __user *ip
   drivers/scsi/sg.c:1051:26: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   drivers/scsi/sg.c:1051:26: sparse:     expected void const volatile [nod=
eref] __user *ptr
   drivers/scsi/sg.c:1051:26: sparse:     got int const *__gu_addr
   drivers/scsi/sg.c:1059:26: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *ip @@
   drivers/scsi/sg.c:1059:26: sparse:     expected int const *__gu_addr
   drivers/scsi/sg.c:1059:26: sparse:     got int [noderef] __user *ip
   drivers/scsi/sg.c:1059:26: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   drivers/scsi/sg.c:1059:26: sparse:     expected void const volatile [nod=
eref] __user *ptr
   drivers/scsi/sg.c:1059:26: sparse:     got int const *__gu_addr
   drivers/scsi/sg.c:1067:26: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *ip @@
   drivers/scsi/sg.c:1067:26: sparse:     expected int const *__gu_addr
   drivers/scsi/sg.c:1067:26: sparse:     got int [noderef] __user *ip
   drivers/scsi/sg.c:1067:26: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   drivers/scsi/sg.c:1067:26: sparse:     expected void const volatile [nod=
eref] __user *ptr
   drivers/scsi/sg.c:1067:26: sparse:     got int const *__gu_addr
   drivers/scsi/sg.c:1111:26: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *ip @@
   drivers/scsi/sg.c:1111:26: sparse:     expected int const *__gu_addr
   drivers/scsi/sg.c:1111:26: sparse:     got int [noderef] __user *ip
   drivers/scsi/sg.c:1111:26: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   drivers/scsi/sg.c:1111:26: sparse:     expected void const volatile [nod=
eref] __user *ptr
   drivers/scsi/sg.c:1111:26: sparse:     got int const *__gu_addr
--
   net/ax25/af_ax25.c:695:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *optlen @@
   net/ax25/af_ax25.c:695:13: sparse:     expected int const *__gu_addr
   net/ax25/af_ax25.c:695:13: sparse:     got int [noderef] __user *optlen
>> net/ax25/af_ax25.c:695:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
>> net/ax25/af_ax25.c:695:13: sparse:     expected void const volatile [nod=
eref] __user *ptr
   net/ax25/af_ax25.c:695:13: sparse:     got int const *__gu_addr
   net/ax25/af_ax25.c:1742:21: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected long const *__gu_addr @@     g=
ot long [noderef] __user * @@
   net/ax25/af_ax25.c:1742:21: sparse:     expected long const *__gu_addr
   net/ax25/af_ax25.c:1742:21: sparse:     got long [noderef] __user *
>> net/ax25/af_ax25.c:1742:21: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] _=
_user *ptr @@     got long const *__gu_addr @@
   net/ax25/af_ax25.c:1742:21: sparse:     expected void const volatile [no=
deref] __user *ptr
   net/ax25/af_ax25.c:1742:21: sparse:     got long const *__gu_addr
--
   net/can/raw.c:659:13: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int const *__gu_addr @@     got int =
[noderef] __user *optlen @@
   net/can/raw.c:659:13: sparse:     expected int const *__gu_addr
   net/can/raw.c:659:13: sparse:     got int [noderef] __user *optlen
>> net/can/raw.c:659:13: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected void const volatile [noderef] __user =
*ptr @@     got int const *__gu_addr @@
>> net/can/raw.c:659:13: sparse:     expected void const volatile [noderef]=
 __user *ptr
   net/can/raw.c:659:13: sparse:     got int const *__gu_addr
--
   net/can/j1939/socket.c:748:13: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected int const *__gu_addr @@    =
 got int [noderef] __user *optlen @@
   net/can/j1939/socket.c:748:13: sparse:     expected int const *__gu_addr
   net/can/j1939/socket.c:748:13: sparse:     got int [noderef] __user *opt=
len
>> net/can/j1939/socket.c:748:13: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got int const *__gu_addr @@
>> net/can/j1939/socket.c:748:13: sparse:     expected void const volatile =
[noderef] __user *ptr
   net/can/j1939/socket.c:748:13: sparse:     got int const *__gu_addr
--
   net/rose/af_rose.c:438:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *optlen @@
   net/rose/af_rose.c:438:13: sparse:     expected int const *__gu_addr
   net/rose/af_rose.c:438:13: sparse:     got int [noderef] __user *optlen
>> net/rose/af_rose.c:438:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
>> net/rose/af_rose.c:438:13: sparse:     expected void const volatile [nod=
eref] __user *ptr
   net/rose/af_rose.c:438:13: sparse:     got int const *__gu_addr
--
   drivers/staging/greybus/fw-management.c:493:21: sparse: sparse: incorrec=
t type in initializer (different address spaces) @@     expected unsigned i=
nt const *__gu_addr @@     got unsigned int [noderef] __user * @@
   drivers/staging/greybus/fw-management.c:493:21: sparse:     expected uns=
igned int const *__gu_addr
   drivers/staging/greybus/fw-management.c:493:21: sparse:     got unsigned=
 int [noderef] __user *
>> drivers/staging/greybus/fw-management.c:493:21: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected void const =
volatile [noderef] __user *ptr @@     got unsigned int const *__gu_addr @@
>> drivers/staging/greybus/fw-management.c:493:21: sparse:     expected voi=
d const volatile [noderef] __user *ptr
   drivers/staging/greybus/fw-management.c:493:21: sparse:     got unsigned=
 int const *__gu_addr
--
   drivers/vhost/vdpa.c:361:13: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected unsigned int const *__gu_addr=
 @@     got unsigned int [noderef] [usertype] __user * @@
   drivers/vhost/vdpa.c:361:13: sparse:     expected unsigned int const *__=
gu_addr
   drivers/vhost/vdpa.c:361:13: sparse:     got unsigned int [noderef] [use=
rtype] __user *
>> drivers/vhost/vdpa.c:361:13: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const volatile [noderef] =
__user *ptr @@     got unsigned int const *__gu_addr @@
>> drivers/vhost/vdpa.c:361:13: sparse:     expected void const volatile [n=
oderef] __user *ptr
   drivers/vhost/vdpa.c:361:13: sparse:     got unsigned int const *__gu_ad=
dr
--
   drivers/vhost/vhost.c:1571:13: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected unsigned int const *__gu_ad=
dr @@     got unsigned int [noderef] [usertype] __user *idxp @@
   drivers/vhost/vhost.c:1571:13: sparse:     expected unsigned int const *=
__gu_addr
   drivers/vhost/vhost.c:1571:13: sparse:     got unsigned int [noderef] [u=
sertype] __user *idxp
>> drivers/vhost/vhost.c:1571:13: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got unsigned int const *__gu_addr @@
>> drivers/vhost/vhost.c:1571:13: sparse:     expected void const volatile =
[noderef] __user *ptr
   drivers/vhost/vhost.c:1571:13: sparse:     got unsigned int const *__gu_=
addr
   drivers/vhost/vhost.c:1771:21: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected int const *__gu_addr @@    =
 got int [noderef] __user * @@
   drivers/vhost/vhost.c:1771:21: sparse:     expected int const *__gu_addr
   drivers/vhost/vhost.c:1771:21: sparse:     got int [noderef] __user *
>> drivers/vhost/vhost.c:1771:21: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got int const *__gu_addr @@
   drivers/vhost/vhost.c:1771:21: sparse:     expected void const volatile =
[noderef] __user *ptr
   drivers/vhost/vhost.c:1771:21: sparse:     got int const *__gu_addr

vim +414 arch/sh/kernel/cpu/sh2a/setup-sh7201.c

da107c6ef919b3 Magnus Damm 2009-04-30  410  =

da107c6ef919b3 Magnus Damm 2009-04-30  411  void __init plat_early_device_s=
etup(void)
da107c6ef919b3 Magnus Damm 2009-04-30  412  {
da107c6ef919b3 Magnus Damm 2009-04-30  413  	/* enable MTU2 clock */
da107c6ef919b3 Magnus Damm 2009-04-30 @414  	__raw_writeb(__raw_readb(STBCR=
3) & ~0x20, STBCR3);

:::::: The code at line 414 was first introduced by commit
:::::: da107c6ef919b3afd9c9b405a4f71e03b5725b04 sh: sh2a MTU2 platform data

:::::: TO: Magnus Damm <damm@igel.co.jp>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2776218998075177445==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
4Jk6MmwBAA==
--===============2776218998075177445==--

