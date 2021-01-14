Content-Type: multipart/mixed; boundary="===============1239243844409680175=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: arch/sh/kernel/cpu/sh2a/clock-sh7203.c:29:32: sparse: sparse: incorrect type in argument 1 (different base types)
Date: Thu, 14 Jan 2021 16:36:53 +0800
Message-ID: <202101141633.YXecM55w-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1239243844409680175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Luc,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   65f0d2414b7079556fbbcc070b3d1c9f9587606d
commit: e5fc436f06eef54ef512ea55a9db8eb9f2e76959 sparse: use static inline =
for __chk_{user,io}_ptr()
date:   5 months ago
config: sh-randconfig-s032-20210114 (attached as .config)
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
>> arch/sh/kernel/cpu/sh2a/clock-sh7203.c:29:32: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh2a/clock-sh7203.c:29:32: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/clock-sh7203.c:29:32: sparse:     got unsigned i=
nt
   arch/sh/kernel/cpu/sh2a/clock-sh7203.c:38:20: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh2a/clock-sh7203.c:38:20: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/clock-sh7203.c:38:20: sparse:     got unsigned i=
nt
   arch/sh/kernel/cpu/sh2a/clock-sh7203.c:48:20: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh2a/clock-sh7203.c:48:20: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/clock-sh7203.c:48:20: sparse:     got unsigned i=
nt
--
>> arch/sh/kernel/cpu/sh2a/setup-sh7203.c:348:9: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh2a/setup-sh7203.c:348:9: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/setup-sh7203.c:348:9: sparse:     got unsigned i=
nt
>> arch/sh/kernel/cpu/sh2a/setup-sh7203.c:348:9: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh2a/setup-sh7203.c:348:9: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/setup-sh7203.c:348:9: sparse:     got unsigned i=
nt
   arch/sh/kernel/cpu/sh2a/setup-sh7203.c:351:9: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh2a/setup-sh7203.c:351:9: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/setup-sh7203.c:351:9: sparse:     got unsigned i=
nt
   arch/sh/kernel/cpu/sh2a/setup-sh7203.c:351:9: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected void const volati=
le [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/kernel/cpu/sh2a/setup-sh7203.c:351:9: sparse:     expected void =
const volatile [noderef] __iomem *ptr
   arch/sh/kernel/cpu/sh2a/setup-sh7203.c:351:9: sparse:     got unsigned i=
nt
--
>> arch/sh/boards/mach-rsk/devices-rsk7203.c:131:9: sparse: sparse: incorre=
ct type in argument 1 (different base types) @@     expected void const vol=
atile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/boards/mach-rsk/devices-rsk7203.c:131:9: sparse:     expected vo=
id const volatile [noderef] __iomem *ptr
   arch/sh/boards/mach-rsk/devices-rsk7203.c:131:9: sparse:     got unsigne=
d int
--
   drivers/hid/hidraw.c:389:37: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected int const *__gu_addr @@     g=
ot int [noderef] __user * @@
   drivers/hid/hidraw.c:389:37: sparse:     expected int const *__gu_addr
   drivers/hid/hidraw.c:389:37: sparse:     got int [noderef] __user *
>> drivers/hid/hidraw.c:389:37: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const volatile [noderef] =
__user *ptr @@     got int const *__gu_addr @@
   drivers/hid/hidraw.c:389:37: sparse:     expected void const volatile [n=
oderef] __user *ptr
   drivers/hid/hidraw.c:389:37: sparse:     got int const *__gu_addr
--
   drivers/mtd/ubi/cdev.c:467:23: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected signed int const *__gu_addr=
 @@     got signed int [noderef] [usertype] __user * @@
   drivers/mtd/ubi/cdev.c:467:23: sparse:     expected signed int const *__=
gu_addr
   drivers/mtd/ubi/cdev.c:467:23: sparse:     got signed int [noderef] [use=
rtype] __user *
>> drivers/mtd/ubi/cdev.c:467:23: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got signed int const *__gu_addr @@
   drivers/mtd/ubi/cdev.c:467:23: sparse:     expected void const volatile =
[noderef] __user *ptr
   drivers/mtd/ubi/cdev.c:467:23: sparse:     got signed int const *__gu_ad=
dr
   drivers/mtd/ubi/cdev.c:512:23: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected signed int const *__gu_addr=
 @@     got signed int [noderef] [usertype] __user * @@
   drivers/mtd/ubi/cdev.c:512:23: sparse:     expected signed int const *__=
gu_addr
   drivers/mtd/ubi/cdev.c:512:23: sparse:     got signed int [noderef] [use=
rtype] __user *
   drivers/mtd/ubi/cdev.c:512:23: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got signed int const *__gu_addr @@
   drivers/mtd/ubi/cdev.c:512:23: sparse:     expected void const volatile =
[noderef] __user *ptr
   drivers/mtd/ubi/cdev.c:512:23: sparse:     got signed int const *__gu_ad=
dr
   drivers/mtd/ubi/cdev.c:526:23: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected signed int const *__gu_addr=
 @@     got signed int [noderef] [usertype] __user * @@
   drivers/mtd/ubi/cdev.c:526:23: sparse:     expected signed int const *__=
gu_addr
   drivers/mtd/ubi/cdev.c:526:23: sparse:     got signed int [noderef] [use=
rtype] __user *
   drivers/mtd/ubi/cdev.c:526:23: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got signed int const *__gu_addr @@
   drivers/mtd/ubi/cdev.c:526:23: sparse:     expected void const volatile =
[noderef] __user *ptr
   drivers/mtd/ubi/cdev.c:526:23: sparse:     got signed int const *__gu_ad=
dr
   drivers/mtd/ubi/cdev.c:882:23: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected signed int const *__gu_addr=
 @@     got signed int [noderef] [usertype] __user * @@
   drivers/mtd/ubi/cdev.c:882:23: sparse:     expected signed int const *__=
gu_addr
   drivers/mtd/ubi/cdev.c:882:23: sparse:     got signed int [noderef] [use=
rtype] __user *
   drivers/mtd/ubi/cdev.c:882:23: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got signed int const *__gu_addr @@
   drivers/mtd/ubi/cdev.c:882:23: sparse:     expected void const volatile =
[noderef] __user *ptr
   drivers/mtd/ubi/cdev.c:882:23: sparse:     got signed int const *__gu_ad=
dr
   drivers/mtd/ubi/cdev.c:969:23: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected signed int const *__gu_addr=
 @@     got signed int [noderef] [usertype] __user * @@
   drivers/mtd/ubi/cdev.c:969:23: sparse:     expected signed int const *__=
gu_addr
   drivers/mtd/ubi/cdev.c:969:23: sparse:     got signed int [noderef] [use=
rtype] __user *
   drivers/mtd/ubi/cdev.c:969:23: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got signed int const *__gu_addr @@
   drivers/mtd/ubi/cdev.c:969:23: sparse:     expected void const volatile =
[noderef] __user *ptr
   drivers/mtd/ubi/cdev.c:969:23: sparse:     got signed int const *__gu_ad=
dr
   drivers/mtd/ubi/cdev.c:984:23: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected signed int const *__gu_addr=
 @@     got signed int [noderef] [usertype] __user * @@
   drivers/mtd/ubi/cdev.c:984:23: sparse:     expected signed int const *__=
gu_addr
   drivers/mtd/ubi/cdev.c:984:23: sparse:     got signed int [noderef] [use=
rtype] __user *
   drivers/mtd/ubi/cdev.c:984:23: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got signed int const *__gu_addr @@
   drivers/mtd/ubi/cdev.c:984:23: sparse:     expected void const volatile =
[noderef] __user *ptr
   drivers/mtd/ubi/cdev.c:984:23: sparse:     got signed int const *__gu_ad=
dr
   drivers/mtd/ubi/cdev.c:1061:23: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected signed int const *__gu_add=
r @@     got signed int [noderef] [usertype] __user * @@
   drivers/mtd/ubi/cdev.c:1061:23: sparse:     expected signed int const *_=
_gu_addr
   drivers/mtd/ubi/cdev.c:1061:23: sparse:     got signed int [noderef] [us=
ertype] __user *
   drivers/mtd/ubi/cdev.c:1061:23: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got signed int const *__gu_addr @@
   drivers/mtd/ubi/cdev.c:1061:23: sparse:     expected void const volatile=
 [noderef] __user *ptr
   drivers/mtd/ubi/cdev.c:1061:23: sparse:     got signed int const *__gu_a=
ddr
--
   kernel/bpf/cgroup.c:1439:21: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected int const *__gu_addr @@     g=
ot int [noderef] __user *optlen @@
   kernel/bpf/cgroup.c:1439:21: sparse:     expected int const *__gu_addr
   kernel/bpf/cgroup.c:1439:21: sparse:     got int [noderef] __user *optlen
>> kernel/bpf/cgroup.c:1439:21: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const volatile [noderef] =
__user *ptr @@     got int const *__gu_addr @@
   kernel/bpf/cgroup.c:1439:21: sparse:     expected void const volatile [n=
oderef] __user *ptr
   kernel/bpf/cgroup.c:1439:21: sparse:     got int const *__gu_addr
--
   net/socket.c:1126:29: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int const *__gu_addr @@     got int =
[noderef] __user * @@
   net/socket.c:1126:29: sparse:     expected int const *__gu_addr
   net/socket.c:1126:29: sparse:     got int [noderef] __user *
>> net/socket.c:1126:29: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected void const volatile [noderef] __user =
*ptr @@     got int const *__gu_addr @@
   net/socket.c:1126:29: sparse:     expected void const volatile [noderef]=
 __user *ptr
   net/socket.c:1126:29: sparse:     got int const *__gu_addr
   net/socket.c:227:15: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected int const *__gu_addr @@     got int [=
noderef] __user *ulen @@
   net/socket.c:227:15: sparse:     expected int const *__gu_addr
   net/socket.c:227:15: sparse:     got int [noderef] __user *ulen
   net/socket.c:227:15: sparse: sparse: incorrect type in argument 1 (diffe=
rent address spaces) @@     expected void const volatile [noderef] __user *=
ptr @@     got int const *__gu_addr @@
   net/socket.c:227:15: sparse:     expected void const volatile [noderef] =
__user *ptr
   net/socket.c:227:15: sparse:     got int const *__gu_addr
   net/socket.c:2166:30: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int const *__gu_addr @@     got int =
[noderef] __user *optlen @@
   net/socket.c:2166:30: sparse:     expected int const *__gu_addr
   net/socket.c:2166:30: sparse:     got int [noderef] __user *optlen
   net/socket.c:2166:30: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected void const volatile [noderef] __user =
*ptr @@     got int const *__gu_addr @@
   net/socket.c:2166:30: sparse:     expected void const volatile [noderef]=
 __user *ptr
   net/socket.c:2166:30: sparse:     got int const *__gu_addr
--
   net/core/sock.c:1313:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected int const *__gu_addr @@     got i=
nt [noderef] __user *optlen @@
   net/core/sock.c:1313:13: sparse:     expected int const *__gu_addr
   net/core/sock.c:1313:13: sparse:     got int [noderef] __user *optlen
>> net/core/sock.c:1313:13: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] __us=
er *ptr @@     got int const *__gu_addr @@
   net/core/sock.c:1313:13: sparse:     expected void const volatile [noder=
ef] __user *ptr
   net/core/sock.c:1313:13: sparse:     got int const *__gu_addr
   net/core/sock.c:1997:9: sparse: sparse: context imbalance in 'sk_clone_l=
ock' - wrong count at exit
   net/core/sock.c:2001:6: sparse: sparse: context imbalance in 'sk_free_un=
lock_clone' - unexpected unlock
   net/core/sock.c:3093:6: sparse: sparse: context imbalance in 'lock_sock_=
fast' - different lock contexts for basic block
   net/core/sock.c:3565:13: sparse: sparse: context imbalance in 'proto_seq=
_start' - wrong count at exit
   net/core/sock.c:3577:13: sparse: sparse: context imbalance in 'proto_seq=
_stop' - wrong count at exit
--
   net/llc/af_llc.c:1147:14: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user *optlen @@
   net/llc/af_llc.c:1147:14: sparse:     expected int const *__gu_addr
   net/llc/af_llc.c:1147:14: sparse:     got int [noderef] __user *optlen
>> net/llc/af_llc.c:1147:14: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
   net/llc/af_llc.c:1147:14: sparse:     expected void const volatile [node=
ref] __user *ptr
   net/llc/af_llc.c:1147:14: sparse:     got int const *__gu_addr
--
   net/netlink/af_netlink.c:1734:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int const *__gu_addr @@ =
    got int [noderef] __user *optlen @@
   net/netlink/af_netlink.c:1734:13: sparse:     expected int const *__gu_a=
ddr
   net/netlink/af_netlink.c:1734:13: sparse:     got int [noderef] __user *=
optlen
>> net/netlink/af_netlink.c:1734:13: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got int const *__gu_addr @@
   net/netlink/af_netlink.c:1734:13: sparse:     expected void const volati=
le [noderef] __user *ptr
   net/netlink/af_netlink.c:1734:13: sparse:     got int const *__gu_addr
   net/netlink/af_netlink.c:2535:13: sparse: sparse: context imbalance in '=
netlink_walk_start' - wrong count at exit
   net/netlink/af_netlink.c:2541:13: sparse: sparse: context imbalance in '=
netlink_walk_stop' - unexpected unlock
   net/netlink/af_netlink.c:2591:9: sparse: sparse: context imbalance in 'n=
etlink_seq_start' - wrong count at exit
--
   net/ethtool/ioctl.c:81:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected unsigned int const *__gu_addr @=
@     got unsigned int [noderef] [usertype] __user *[assigned] sizeaddr @@
   net/ethtool/ioctl.c:81:13: sparse:     expected unsigned int const *__gu=
_addr
   net/ethtool/ioctl.c:81:13: sparse:     got unsigned int [noderef] [usert=
ype] __user *[assigned] sizeaddr
>> net/ethtool/ioctl.c:81:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got unsigned int const *__gu_addr @@
   net/ethtool/ioctl.c:81:13: sparse:     expected void const volatile [nod=
eref] __user *ptr
   net/ethtool/ioctl.c:81:13: sparse:     got unsigned int const *__gu_addr
--
   net/x25/af_x25.c:470:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected int const *__gu_addr @@     got i=
nt [noderef] __user *optlen @@
   net/x25/af_x25.c:470:13: sparse:     expected int const *__gu_addr
   net/x25/af_x25.c:470:13: sparse:     got int [noderef] __user *optlen
>> net/x25/af_x25.c:470:13: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] __us=
er *ptr @@     got int const *__gu_addr @@
   net/x25/af_x25.c:470:13: sparse:     expected void const volatile [noder=
ef] __user *ptr
   net/x25/af_x25.c:470:13: sparse:     got int const *__gu_addr
--
   net/netrom/af_netrom.c:359:13: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected int const *__gu_addr @@    =
 got int [noderef] __user *optlen @@
   net/netrom/af_netrom.c:359:13: sparse:     expected int const *__gu_addr
   net/netrom/af_netrom.c:359:13: sparse:     got int [noderef] __user *opt=
len
>> net/netrom/af_netrom.c:359:13: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] __user *ptr @@     got int const *__gu_addr @@
   net/netrom/af_netrom.c:359:13: sparse:     expected void const volatile =
[noderef] __user *ptr
   net/netrom/af_netrom.c:359:13: sparse:     got int const *__gu_addr
--
   net/rose/af_rose.c:438:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *optlen @@
   net/rose/af_rose.c:438:13: sparse:     expected int const *__gu_addr
   net/rose/af_rose.c:438:13: sparse:     got int [noderef] __user *optlen
>> net/rose/af_rose.c:438:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   net/rose/af_rose.c:438:13: sparse:     expected void const volatile [nod=
eref] __user *ptr
   net/rose/af_rose.c:438:13: sparse:     got int const *__gu_addr
--
   net/ax25/af_ax25.c:695:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *optlen @@
   net/ax25/af_ax25.c:695:13: sparse:     expected int const *__gu_addr
   net/ax25/af_ax25.c:695:13: sparse:     got int [noderef] __user *optlen
>> net/ax25/af_ax25.c:695:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   net/ax25/af_ax25.c:695:13: sparse:     expected void const volatile [nod=
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
   net/can/raw.c:659:13: sparse:     expected void const volatile [noderef]=
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
   net/can/j1939/socket.c:748:13: sparse:     expected void const volatile =
[noderef] __user *ptr
   net/can/j1939/socket.c:748:13: sparse:     got int const *__gu_addr
--
   net/bluetooth/hci_sock.c:1941:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int const *__gu_addr @@ =
    got int [noderef] __user *optlen @@
   net/bluetooth/hci_sock.c:1941:13: sparse:     expected int const *__gu_a=
ddr
   net/bluetooth/hci_sock.c:1941:13: sparse:     got int [noderef] __user *=
optlen
>> net/bluetooth/hci_sock.c:1941:13: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got int const *__gu_addr @@
   net/bluetooth/hci_sock.c:1941:13: sparse:     expected void const volati=
le [noderef] __user *ptr
   net/bluetooth/hci_sock.c:1941:13: sparse:     got int const *__gu_addr
--
   net/bluetooth/hci_core.c:2099:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned short const *__=
gu_addr @@     got unsigned short [noderef] [usertype] __user * @@
   net/bluetooth/hci_core.c:2099:13: sparse:     expected unsigned short co=
nst *__gu_addr
   net/bluetooth/hci_core.c:2099:13: sparse:     got unsigned short [nodere=
f] [usertype] __user *
>> net/bluetooth/hci_core.c:2099:13: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got unsigned short const *__gu_addr @@
   net/bluetooth/hci_core.c:2099:13: sparse:     expected void const volati=
le [noderef] __user *ptr
   net/bluetooth/hci_core.c:2099:13: sparse:     got unsigned short const *=
__gu_addr
--
   net/bluetooth/l2cap_sock.c:428:13: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int const *__gu_addr @@=
     got int [noderef] __user *optlen @@
   net/bluetooth/l2cap_sock.c:428:13: sparse:     expected int const *__gu_=
addr
   net/bluetooth/l2cap_sock.c:428:13: sparse:     got int [noderef] __user =
*optlen
>> net/bluetooth/l2cap_sock.c:428:13: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __user *ptr @@     got int const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:428:13: sparse:     expected void const volat=
ile [noderef] __user *ptr
   net/bluetooth/l2cap_sock.c:428:13: sparse:     got int const *__gu_addr
   net/bluetooth/l2cap_sock.c:553:13: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int const *__gu_addr @@=
     got int [noderef] __user *optlen @@
   net/bluetooth/l2cap_sock.c:553:13: sparse:     expected int const *__gu_=
addr
   net/bluetooth/l2cap_sock.c:553:13: sparse:     got int [noderef] __user =
*optlen
   net/bluetooth/l2cap_sock.c:553:13: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __user *ptr @@     got int const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:553:13: sparse:     expected void const volat=
ile [noderef] __user *ptr
   net/bluetooth/l2cap_sock.c:553:13: sparse:     got int const *__gu_addr
--
   net/atm/svc.c:509:13: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int const *__gu_addr @@     got int =
[noderef] __user *optlen @@
   net/atm/svc.c:509:13: sparse:     expected int const *__gu_addr
   net/atm/svc.c:509:13: sparse:     got int [noderef] __user *optlen
>> net/atm/svc.c:509:13: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected void const volatile [noderef] __user =
*ptr @@     got int const *__gu_addr @@
   net/atm/svc.c:509:13: sparse:     expected void const volatile [noderef]=
 __user *ptr
   net/atm/svc.c:509:13: sparse:     got int const *__gu_addr
--
   net/atm/ioctl.c:125:25: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected unsigned short const *__gu_addr @@=
     got unsigned short [noderef] [usertype] __user * @@
   net/atm/ioctl.c:125:25: sparse:     expected unsigned short const *__gu_=
addr
   net/atm/ioctl.c:125:25: sparse:     got unsigned short [noderef] [userty=
pe] __user *
>> net/atm/ioctl.c:125:25: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got unsigned short const *__gu_addr @@
   net/atm/ioctl.c:125:25: sparse:     expected void const volatile [nodere=
f] __user *ptr
   net/atm/ioctl.c:125:25: sparse:     got unsigned short const *__gu_addr
   net/atm/ioctl.c:180:29: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void [noderef] __user *const *__gu=
_addr @@     got void [noderef] __user *[noderef] __user * @@
   net/atm/ioctl.c:180:29: sparse:     expected void [noderef] __user *cons=
t *__gu_addr
   net/atm/ioctl.c:180:29: sparse:     got void [noderef] __user *[noderef]=
 __user *
>> net/atm/ioctl.c:180:29: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got void [noderef] __user *const *__gu_addr @@
   net/atm/ioctl.c:180:29: sparse:     expected void const volatile [nodere=
f] __user *ptr
   net/atm/ioctl.c:180:29: sparse:     got void [noderef] __user *const *__=
gu_addr
   net/atm/ioctl.c:203:29: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void [noderef] __user *const *__gu=
_addr @@     got void [noderef] __user *[noderef] __user * @@
   net/atm/ioctl.c:203:29: sparse:     expected void [noderef] __user *cons=
t *__gu_addr
   net/atm/ioctl.c:203:29: sparse:     got void [noderef] __user *[noderef]=
 __user *
   net/atm/ioctl.c:203:29: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got void [noderef] __user *const *__gu_addr @@
   net/atm/ioctl.c:203:29: sparse:     expected void const volatile [nodere=
f] __user *ptr
   net/atm/ioctl.c:203:29: sparse:     got void [noderef] __user *const *__=
gu_addr
   net/atm/ioctl.c:205:29: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected int const *__gu_addr @@     got in=
t [noderef] __user * @@
   net/atm/ioctl.c:205:29: sparse:     expected int const *__gu_addr
   net/atm/ioctl.c:205:29: sparse:     got int [noderef] __user *
>> net/atm/ioctl.c:205:29: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] __use=
r *ptr @@     got int const *__gu_addr @@
   net/atm/ioctl.c:205:29: sparse:     expected void const volatile [nodere=
f] __user *ptr
   net/atm/ioctl.c:205:29: sparse:     got int const *__gu_addr
--
   net/decnet/af_decnet.c:1540:12: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected int const *__gu_addr @@   =
  got int [noderef] __user *optlen @@
   net/decnet/af_decnet.c:1540:12: sparse:     expected int const *__gu_addr
   net/decnet/af_decnet.c:1540:12: sparse:     got int [noderef] __user *op=
tlen
>> net/decnet/af_decnet.c:1540:12: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void const volatile [nodere=
f] __user *ptr @@     got int const *__gu_addr @@
   net/decnet/af_decnet.c:1540:12: sparse:     expected void const volatile=
 [noderef] __user *ptr
   net/decnet/af_decnet.c:1540:12: sparse:     got int const *__gu_addr
   net/decnet/af_decnet.c:250:22: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected unsigned int hash @@     got res=
tricted __le16 [usertype] sdn_objnamel @@
   net/decnet/af_decnet.c:250:22: sparse:     expected unsigned int hash
   net/decnet/af_decnet.c:250:22: sparse:     got restricted __le16 [userty=
pe] sdn_objnamel
   net/decnet/af_decnet.c: note: in included file:
   include/net/dn.h:192:24: sparse: sparse: incorrect type in assignment (d=
ifferent base types) @@     expected restricted __be16 [usertype] sport @@ =
    got restricted __le16 [usertype] addrloc @@
   include/net/dn.h:192:24: sparse:     expected restricted __be16 [usertyp=
e] sport
   include/net/dn.h:192:24: sparse:     got restricted __le16 [usertype] ad=
drloc
   include/net/dn.h:193:24: sparse: sparse: incorrect type in assignment (d=
ifferent base types) @@     expected restricted __be16 [usertype] dport @@ =
    got restricted __le16 [usertype] addrrem @@
   include/net/dn.h:193:24: sparse:     expected restricted __be16 [usertyp=
e] dport
   include/net/dn.h:193:24: sparse:     got restricted __le16 [usertype] ad=
drrem
   net/decnet/af_decnet.c:2167:9: sparse: sparse: context imbalance in 'dn_=
socket_get_idx' - wrong count at exit
   net/decnet/af_decnet.c:2187:9: sparse: sparse: context imbalance in 'dn_=
socket_seq_next' - unexpected unlock
   net/decnet/af_decnet.c:2196:17: sparse: sparse: context imbalance in 'dn=
_socket_seq_stop' - unexpected unlock
--
   net/phonet/datagram.c:47:29: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected unsigned int const *__gu_addr=
 @@     got unsigned int [noderef] [usertype] __user * @@
   net/phonet/datagram.c:47:29: sparse:     expected unsigned int const *__=
gu_addr
   net/phonet/datagram.c:47:29: sparse:     got unsigned int [noderef] [use=
rtype] __user *
>> net/phonet/datagram.c:47:29: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const volatile [noderef] =
__user *ptr @@     got unsigned int const *__gu_addr @@
   net/phonet/datagram.c:47:29: sparse:     expected void const volatile [n=
oderef] __user *ptr
   net/phonet/datagram.c:47:29: sparse:     got unsigned int const *__gu_ad=
dr
--
   net/phonet/socket.c:367:21: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected unsigned short const *__gu_add=
r @@     got unsigned short [noderef] [usertype] __user * @@
   net/phonet/socket.c:367:21: sparse:     expected unsigned short const *_=
_gu_addr
   net/phonet/socket.c:367:21: sparse:     got unsigned short [noderef] [us=
ertype] __user *
>> net/phonet/socket.c:367:21: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] _=
_user *ptr @@     got unsigned short const *__gu_addr @@
   net/phonet/socket.c:367:21: sparse:     expected void const volatile [no=
deref] __user *ptr
   net/phonet/socket.c:367:21: sparse:     got unsigned short const *__gu_a=
ddr
   net/phonet/socket.c:623:14: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   net/phonet/socket.c:623:14: sparse:    struct sock [noderef] __rcu *
   net/phonet/socket.c:623:14: sparse:    struct sock *
   net/phonet/socket.c:646:17: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   net/phonet/socket.c:646:17: sparse:    struct sock [noderef] __rcu *
   net/phonet/socket.c:646:17: sparse:    struct sock *
   net/phonet/socket.c:662:17: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   net/phonet/socket.c:662:17: sparse:    struct sock [noderef] __rcu *
   net/phonet/socket.c:662:17: sparse:    struct sock *
   net/phonet/socket.c:681:25: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   net/phonet/socket.c:681:25: sparse:    struct sock [noderef] __rcu *
   net/phonet/socket.c:681:25: sparse:    struct sock *
   net/phonet/socket.c:730:21: sparse: sparse: context imbalance in 'pn_res=
_seq_start' - wrong count at exit
   net/phonet/socket.c:745:13: sparse: sparse: context imbalance in 'pn_res=
_seq_stop' - wrong count at exit
--
   net/phonet/pep.c:1047:13: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user *optlen @@
   net/phonet/pep.c:1047:13: sparse:     expected int const *__gu_addr
   net/phonet/pep.c:1047:13: sparse:     got int [noderef] __user *optlen
>> net/phonet/pep.c:1047:13: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
   net/phonet/pep.c:1047:13: sparse:     expected void const volatile [node=
ref] __user *ptr
   net/phonet/pep.c:1047:13: sparse:     got int const *__gu_addr
--
   net/vmw_vsock/af_vsock.c:1612:15: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int const *__gu_addr @@ =
    got int [noderef] __user *optlen @@
   net/vmw_vsock/af_vsock.c:1612:15: sparse:     expected int const *__gu_a=
ddr
   net/vmw_vsock/af_vsock.c:1612:15: sparse:     got int [noderef] __user *=
optlen
>> net/vmw_vsock/af_vsock.c:1612:15: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got int const *__gu_addr @@
   net/vmw_vsock/af_vsock.c:1612:15: sparse:     expected void const volati=
le [noderef] __user *ptr
   net/vmw_vsock/af_vsock.c:1612:15: sparse:     got int const *__gu_addr

vim +29 arch/sh/kernel/cpu/sh2a/clock-sh7203.c

6d01f51086cf6c47 Paul Mundt 2007-11-26  26  =

6d01f51086cf6c47 Paul Mundt 2007-11-26  27  static void master_clk_init(str=
uct clk *clk)
6d01f51086cf6c47 Paul Mundt 2007-11-26  28  {
16b259203c513ed2 Paul Mundt 2010-11-01 @29  	clk->rate *=3D pll1rate[(__raw=
_readw(FREQCR) >> 8) & 0x0003] * pll2_mult;
6d01f51086cf6c47 Paul Mundt 2007-11-26  30  }
6d01f51086cf6c47 Paul Mundt 2007-11-26  31  =


:::::: The code at line 29 was first introduced by commit
:::::: 16b259203c513ed28bd31cc9a981e0d3ad517943 sh: migrate SH_CLK_MD to mo=
de pin API.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1239243844409680175==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICMbo/18AAy5jb25maWcAjDzbcts2sO/9Ck46c6Z9SCLLzm3O+AEkQQkVSdAEKMl+4aiynGii
WD6S3DZ/f3bBGwCCijLT2txd3BaLvWHh33/73SOvp/2P1Wm7Xu12P72vm+fNYXXaPHpP293mf72Q
eymXHg2ZfAfE8fb59b/3x2/eh3df3o3eHtZjb7Y5PG92XrB/ftp+fYW22/3zb7//FvA0YpMyCMo5
zQXjaSnpUt6+OX67ebvDXt5+Xa+9PyZB8Kf35d31u9EbrQkTJSBufzagSdfN7ZfR9WjUIOKwhY+v
b0bqX9tPTNJJix5p3U+JKIlIygmXvBtEQ7A0ZinVUDwVMi8CyXPRQVl+Vy54PgMILPh3b6J4t/OO
m9PrS8cCP+czmpbAAZFkWuuUyZKm85LksA6WMHl7PYZe2iGTjMUUuCaktz16z/sTdtwunAckbtb2
5k3XTkeUpJDc0dgvGDBOkFhi0xo4JXNazmie0ricPDBtpjrGB8zYjYofEuLGLB+GWiD726lrg+uT
tvFqCucIcCKOVeuT6Tdx8SmkESliqbZK41QDnnIhU5LQ2zd/PO+fN3+2BOJezFmmyW/GBVuWyV1B
C02qFkQG07IBtlMqBI2Z71wgKeAcOiaqmEpy6E1RwPggBHEjlyCn3vH17+PP42nzo5PLhNxXDUVG
ckFRnLUTR1Oas0DJuJjyhSn1IU8IS02YYIkJiHge0LCU05ySkKWTDmsM2C5OHzKkfjGJhMmEzfOj
t3+ylmNPOIADMKNzmkrRrF9uf2wORxcLpg9lBq14yAJ9JilHDAtj6uC1QurUUzaZljkVpWQJnDvn
nHtT6JpnOaVJJqHf1DVcg57zuEglye/1oWvkmWYBh1YNI4KseC9Xx+/eCabjrWBqx9PqdPRW6/X+
9fm0ff7asUayYFZCg5IEqo9qA7uRBXMu9IIh1FTyoPBEf0NgmPsScJ2swEdJl7BLUpMfg0K1sUBE
zIRqWouFA9UDFSF1wWVOgvOIEgW8THzFn5oP5vo6vrFZ9Ytjy9hsCv1Q3cI0Qi2CKZwkJdrNXor1
t83j625z8J42q9PrYXNU4Hp4B7a1ZZOcF5k2SEYmtJITmnfQhCbBxPosZ/BDs4qqp2pyHTQiLC9N
TGfUIlH6JA0XLJRTp4bLpd7WSVIPm7FQnMPnoWkFbHwEJ+SB5o6NqAlCOmcB7S0XJByOhOzBQUSj
HtDP+jCl2zRh5njQahSRxODXlAazjLNUooIB78OlISrhQFOvOtF6vhfA75CCLgiI1PfIxpRzzabn
NCb33acfz5AVygjmWh/qmyTQj+AFaHrDC8nDnhnvMI0PoVMP2GzA6M6DIuS9pjfulg9CavP1OUd1
iL8bPh/PQG+zB4r2Sm0izxOSBoZJtskE/DJkhgsWXn3UhtUloFVkbc8JOBIMLH7uFFUxoTIBZVPW
Ft1NpDbzHEU0hTPnNGaVY1IZLtOwgMzNnJ2B8LpcSgIGPSqU09GMWoDHb33CqbVcwQocJNkymBoW
hmbcXE6zXDZJSRxpO6umrwOU+Y8MzUOYy8FjvCxyy7KRcM5gLTU/3SoG1KBP8pw51ccMm90nmoZt
ICXR+dNCFe/w1Ek2p4bklJ0n1ywt8WkY6mdZcRHltmy9nmYTEQiyVc4T6IMbLk4WXI2MY6OsRx3L
ZZvD0/7wY/W83nj0n80z2G8CdiVACw5uTGeuncMq/eYevLZOFw7TdDhPqjEaI2VIqogLvxrSfTgQ
XRmv6pzw1G0UINwiEmI1t9CLmPguWYTezclwt+OO7WEaOVjaOnpw9gZEaJZiJkDhw5nlmrU1sVOS
h+AcGDIupkUUQcioDLpiOgGT4RbghGSKZFEWKWpyRmLQaaFrVvdC0kSZJgymWcSgW4w6DXXBIwYh
s0szKDdJ2TChy4AZLLeDFSA3074DNF1Q8LJ1F1CSYFZ5YNAm47p7iG4S2LY+Alx3xhEEsY9mJ7OJ
JD7wLQYpi8XtuHawlOvmnX6+bLR0BjjEYqoZyxpgWm2EFb68z2By008fr764RU4j+8sd0Fo9jUdX
LnfFJro+M5nx6ONFI328vozs5jKyX3MgWboPsNXVp9GHy8guWuan0afLyD5fRvbrZSLZ1egysotk
Anb0MrKri8g+XNTb6MulvbnVT59uwJW36S4c9uqyYT9estibcjy6cCcuOjOfxhedmU/Xl5F9uEyC
LzvPIMIXkX2+kOyys/r5krO6vGgB1zcX7sFFO3r90ZiZMgvJ5sf+8NMDr2X1dfMDnBZv/4Ipb90r
QvvLo0hQeTv6bzQy09IqLQYGaFk+8JRyMOP57SctzOb5PVq3XLX9bLZt0GCqEWslvK/HPtOsncoH
RuBVQquSpmjiLGSVh7sAXfssNp7GNJDNpBIeUs1RLdKAqMAUTG1mJ4+QQbiI8mbm9pc6is+/pLj6
OHP5Zh3BRxhFdz2Gt7DKkq3W3zbeeuA+AxdVLnImqU9UNqYTng4lpxCJT9wZjooMxMOdP3MMrmaV
HfbrzfG4t/I9muDGTErwYmgaMpI6GII0PoYQisB0HMsoK9yOq0JB2FEM9IhXJkCh89cxVTVXf786
PHrH15eX/eHUsRSGCAoheVIG8Uzz8KZlLnrfrXtTj2X22aV7Vepxvduvvw/tJPSXwYDoUt/dXtf/
9DnFmP+cGBOoYeApTkhwr8/j/KBN9tWLDpv/e908r396x/VqVyVczyKNHcapDmVdXa3Po1XvmCTr
dqRtoYOrWex/vKyeYS1e8G37YuQabZTCkcfHLS4dPHzx+rI5TL1w888WAr3wsP3HiCGnFHSdT4mm
XbICeC0WTAZTnce/7rNNf2q+ux7Yuo7O9KG8GrntGaDGAw4RoK7NVkZ3Iy0+f7i90m8lcwKLCwv9
KjCb3guIquK+3u/OIQ0wRHUMOCkEaZPCFVvee2L6Ntn/vd01vPG4baRgEhCSBe0dEYbch9eXE0ru
6bDfYe64Z9mwRaPQ2zxmx/Vfj25lAGz9sHdY0wea875JvdINn0rtQfg500k+G7aRphJsVL8HTZHs
LTvgvx612XSEGrjSzPt/YYl9a+L9odJ9LIGxSfyn5h9oUX2W2PlggJBwjhnI0IGqVGQrFou7MuML
mpc0gricYZLEkV9oNQx73G1spWJfcxlao2rQKvYLV2rchq8O62/b02aNG/32cfMCfTm9JpXH4lUm
QfNEqvtiAPtU2NCcSiciTewso/JXVLpgyrlmVNoLliRTjKhvKx33oIjEjCScRKkn2VXPyvNC6Sql
NXBOJ6IkaVglLPAyjQoA9NKg00Xpw8hVst/CJWwJstChherVmsKCwN6zLCiru9WmNMDBhlqVlMBn
48anugvGaQJTJcViB8NJMDAORQQOYBFToZJ+NI5URrPrnWPFAZuIQmTggPTgJJDGdOt8XMVYTPCa
KZeUaxIPh9pM/ujpwvYWeBLw+du/V8fNo/e90j4vh/3TdmfceiJRXRNg8Rf9HIWtJdTM5TowXabr
3MB2OuwXp6W93QC3GxPnuuirNLLAbOutZjjqXTmzXzKnFNjGZ0qsuzw/ctLRjIj0Snfzq1oZCBZY
Cl/6FSX9b7N+Pa3+BjuAxUSeSvaeDOPrszRKpBKXKMxY4LpZqEhEkLPMjkBwU2o8BjoaLwygPRyC
UfCGR3sYaCmmJIeziFj35UhFljARuJ1/Ds2LJHMq3CF+6XFncibudMdj3S1QHQomJC2I82aljfcq
Es31bTAOECoGqd+wiwwikTKT6iTCYRW3X9Q/K3bLKWZi3TnjlCdJUdZ5aRBQBhHqEjXn7VVLQmEf
wOgodTBLjEAspqSKPh1dP2ScG2x58Av3PfPDdeSWERhVJQpg3cZVxAQvfGkaTBOSO09OI7KZxPNC
A0YMRTG8xd2i9Ww2xcqkSY5sMYC0gSnBSTenf/eH76BtDG+m3YpgRl2XEXCwl8YxX8IRTCwIBJJG
YL8MM3WfTaU7nweKwjUWQLGODi0Tss5cTSYzLOUTgkVG7UvTCJxnZSBgO5LMEieduDJ3rm2RhvTA
ZxkTZy2OkJrhn5Bc+0r0Dz9n4YTa3+Ucuq2trlEOVaONLhTt59H46s4FKydzN3GZGIiQBobIVN9l
zgvD8sdxYHxo9xsEHDrD48RSAAgAYooIB4+W4w9aXyTz9TCHV7Pp5IFSivP+4LrBx5k2FSRKZO9e
N68bkOP3dXWLFSHX9GXg3w33Vk6lb8qXAkYisGRLwUEWhsRJ4bPcvFbuEajr/XPTyfWr3AYoIscc
RXTXB0p6FzugftQHBr5wLREOxpnpSYJLdLUDHeNWmw1BKAbUYEMAP3WD0rbL8z4wuavnYTNl5g9N
MJjymbN+r8bfufgZ2EazQUR3Fe5MhwGZUXfTc+I4dWxVxmgfCDNwwp0mQPUS67Fjt98O0l5+tylx
7fGjQVSzcQpAQyKiu7P4LGIRLyPirG9uiOoZ3r55edo+7cun1fH0po5nd6vjcfu0XVt5PWwRxD1Z
BxB6yE4Xs8HLgKWhqlnpNY0Wg8KO6OLafaHQ4HMxd9c06wTua5B2BjE/P4eqhuwsiZ9FvxzDaSMb
ggRLlo3IRzkcCuyCVVEjFrb3UYGeAtPgqX8vqRMDXHbCE2qWzWkofHQwsJ5mGiRllg7GlZJA2l0C
CFMALBhSK0gwIXpt4ES1ybmlzxGasDw36zcajABHxs7JWCQpGVqVGhCfazh7ZnboYRPMfOouMW+n
ncWivxj0QPpQo/ZNGwJCkz6cRbQPlEWK5fkzet/HTYgtJtCF6r7yIY3F1SjbYPcpBnSADBBZDkuT
UtGg0AxlGbgupsIUEziC4ysNI8QEbwP8OBLOHY3mtVutOX01pHHCbTBE9Fl9RdWgGMRbvKMIIMri
5rapJKrZYb3hBjcQVk7EECtToSmDqdDs+V0ura9SJKEFgU3Xsj1VZayKBCxLr6GqAMEVrCl/d1n6
hbhX+TvN7b5rX0jUMZJ32hxPjVdZB2U9lIXQ46ouk5bkJFSTrTLEq/X3zcnLV4/bPSZ/Tvv1fqcF
7sRwmvGrDElCsORrbop4rleE5VzQZgiyfDf+4D3Xk32s7kUe27uWTsiyOyqnTh3vk3uQCAjC8jIK
l6ZktphpuBxumhFtc2sYzTQtf08SPeA9O+lWAHTNAh9lThYmwNfjUgRMLIK/rr5cf2k4BYDBuygk
nvcGnC97IIiCTEBA4qD0mcQiYfOyG7FRTLGPgftgaF0G7itbxAWfPo3sDhWwZGKgwr2lyGIisaB5
oG8WMfxplsoiIrEnZGDFXwRvTwY6FTyyX4to4DIwUgPtloiMeVu8hHparc23DA6s2XNVcFqV67uf
3zj2vBVTM82HJaA0dJcPAdJZRK3gobD6SUQ04Hz4snnfZDURNI4G3vsBNqJEFjltL4WqS6rd6+a0
35++9c9813IasFDGWta2gvnyOujB4oIGJA+tmQFmDv8NsSXJ5+7Kc8TJWUFy6dyXwdk3k4qYX+aY
pe7muWA5jY2AJ4gmmES4MqxUrEDq+SRmQl2yWjdDyaExx1ziguQpyKij7zKgYDyb2teSp4WLKKd3
BUxP1ajTEK9pQt9Bhjck9cNDRYL+jas7EJ+cdCQhy41HFtqw8EHjuIgJaGi8IXIfXZ0eb2eWqiJ2
oFau404drrnuEDSqnkB3rMtD0hTjnh9r4T4wCQmaDbYgKp2aBw5EHoCHja929ZscHdus6yKq2zc/
ts/H02GzK7+dtC1oSRMq3OU+LQWqiPMUzkePjoEEps/xMtOdPDf7gwZp4VhbyttHzv1BwDP1wbk4
U1ffzSdOHHQ2FYSBWr1AbxPlr3vggW9fh7c45gsxiMyGUTKMh5E45SnWamCpXlVx16kggOkaCUkq
bqsa8tvP3SLzaMac71jQMf1i3LhVkDNMDwgbiN8jV1ojqwLJXoykjxkvqhDL0TwiLOZWjAK+o+Q8
bkKFniUfcqyyoDYq7XcSMGJ/Q8xCwjJg7d1FFrxdY33X34ft41flFXSlBdt1v7alnWdR3QBPaZwN
PK0CpS+TLHIpNdj5NCQxNw9Hlld9RixPwE7Q6hV9jwPR9vDj39Vh4+32q8fNoWNBtFDL0/PuLUjd
iIXQo/FWDJV/M5r2/LxrVSiPXK3R1amGhs2MYzMa7Ojwrr1OIbaW2V6Gdj+iXo3gNYD7MrPlr3LK
cjYf3IDaa8ttp80gQANedwM2KwGBdEl6Ut5xUc4K/JsK2KJbZgWrO8iohQVLaDwFqb5LNg56MKHX
bNSwxVUPlCR6nrrpT39aH2JkV90jw4ZH+t4hKqJpUKl3qm/IgMy3lUqVA2UcgoQvpfO+DdNAWM6S
YFhsaOQpQ5DbV9MGac0/B91RF4q0x4QHvSdhk1RYXxhMMv2KWQHBV+wQ3b2qomd5VOOc0qKICn/p
oGkWJ9ubpGx1OKlSQu9ldTgamgqoSpJ/wlhWXwGCgyRUpQ4NqmMbIHlUwd0D4z2PqlJzdNugwL1T
vLyvSi9u314NdlAWaf2+S78+6pNhLRNPY6NStb92xZICfvWSPT4ar57hycPq+bhTyXUvXv208ghq
yTwbcFYAiRNg6CurEnBhXb1WfwOAJO9znryPdqvjN2/9bfvSj14U3yNmLvIvGtJAVX6Z8AlNSwcY
2mNWTT3h5Wlv5xCdcrEgrurKhsAHfX+P1/YLkrk6iDX8mW4mlCdU5vfmBFFF+CSdlepdfHl1Fjs+
i705i/18ftyPZ9HX4z5b2ZUDNnYxiLmueFukNTGuX7S3RKmEwG8pHZubhMZT7wYOhpz0oYVksXVo
SGIBuAUgvqCp1I/RGeGt6nVWLy+YG6yBWMxTUa3WWBxvSThHhbxsSmstBYHlwYaV0oB1oZwb15QT
269INJKYan8aSUfgxqt9vx1bB7sm4G5XVCeZZIzDyRtIpyhK5fcNSEYRgLotlrY0YU4LuO80Ur/i
elUlvdk9vcUy59X2efPoQZ+DyRMcD1++RjHRc9oGuHryUb2Nvbcn21GBTA+sMwmm2fh6Nv7w0W4t
hBx/GLBlpYhzkvSYM7VYo48jQ1vS4buUXGLpOUY4N6MvHy0szVVZIWKvxp9rL397/P6WP7/Fev9B
l1+tngeTay3FpG7YIdwuk9urmz5U3t50W/nrXapS9+Crm4MiRPmmlk5JKWJ6drsC19tX7eWguDbE
dVXwAJ8bqp4WaxDjJZqpSU/tKCQNArAieIdgZ5IHSEqRDM0kJ4vStWi9F2B/3zKv/n0P3sFqt9vs
FIe9p0rNtW8Des6A6hJfC8WBdHtoLVWyZO7qyJYCFcd5Cldiu08VQHyTmte1lXLeHtcOocH/GX/G
qsWETMx4GkxZz/hb6Mr/aCv4B/ZlqFGowrDROVLfl0pGe6oiY4rWqRbVIVErjzNUx/9T/RxDgJ14
P6qyQ6fuU2QmP+5YGvHWzWqH+HXHv9mz5VbPNVClR29UNaD59/aUTfBZD1AuYlW3L6Y8Dm0dpgh8
6td/Ym88MtmGWCxBSYg7jG1oJnFBfXf+G0mm9xBkW5FTE9NJLZbkkf47FlFKMyAFINbpYk22AaQk
j+/dqNn/c3ZlTW7jSPqv1OPsQ0/zPh4pkpLoIkWaoCTKL4pqu3rsWF9hl2e9/34zAR44EqyJ7Yi2
rfySiRvIBBKJdvdGIRS3U9ZUSqpL35JpilXaosM+2E4X1NdlvywB4Gm13OWAintDdXazObo2GLBh
ik7CbyWosRhshHunxilZqPx0nWwAiYfHjyCP+CUmY/NpgrIxSeI0opKHpY/SX2f41E75FkvSpSnx
MpR+qU6hL/OQZLnP5nl5YtDxoccyv744nqTZZkXoheO96NqBJKo7FzKgbF8U56a5qe1f5Sz1PRY4
yjEKzJ51y/DUCbuGfr42J9MVLE0cL5M9QypWe6nj+DrFU84y56IOgIUhdaI4c+yOrnYOOiM8+dSh
zqWPTR75oWS3FMyNEuk3jicoFayFnW8Eh2LKAj1igJPxzop9qfbQS5edSF0g96YeLm5DlDBnNub1
V0G/Z4Mn2W4rMVSaQ5DF9VNyLEwcTTZGSRwSmZoYUj8fIyO91B/HwCSDGXBP0mNXstHAytJ1nEBe
CbSCiju5z7+ffj5UeITy6wuP9PPz49MPUOtecJcB+R4+g5r38AEGxKfv+E954Pw/vqbG0jQGjA7E
MRg4VNdGZ+0MDaluDaf59QW0IphgYbX78fyZB8uVr9BOn17azrqXtiViqd/82MrVqswVwo7JWTXr
xOatagDvwtFqVamJD5ahwidqDPIzq1ba0QRxvj5Vx/dfL9ZsVKfuLE1V/Od8Wq7Q9ntcdup5G1rB
0G8HkifaR+DiLsqjYiMLpAFTsRonZNnn+oz3tDVnA/WzFnQQLUWN5U1722YoL1tZLi/SIb6oQsOQ
0gQ+lrddm/WUTinlWtELkXDvmEepoRzTd2EFNb9lXaYTS7xkIJYXLYEZsYwhjYk1O/nsXKAXNo5j
lpmy7ZaAyD+oOh3M4MyS9tJWDOOZyuJn2j07ZXVLn7etPD5V6ytcSGvrQs3bXZ8R9MPee6TIvWpc
KMCdvPq9spyrui4bWSlYMNw26xWn1AViVVFe0d2xJ8ChKXIyPxWPYLKVnSvGxmspoU12KGvFV3TN
TJflZdvvyDQ5uMvIg9SVCf2L6LJcqwJ+EMi7Y3k6nqlmKnYp3RxZU+Yt5a21Jnfud2je70dCbsZC
R/VVWSCcU2znaQtTx8Yu48bSVhb2rMqinTmV8khntBfGxNCe8yPLwcig/b+mqUa74DiBfVMF2tYL
J6nnaUjRlmJBayh3WQ7tZUVypvDZq9XoXjGt6zq/7D4yUTyd4jtGpvY+GV2UQ2E4z+DHpx8f+HFp
9Wf7gCugos5rfqucgLbD444MuMfhutrBxC0po5wqfB81SZOSQs/zU2LMa8QFD/3bPtc/1Dm63ZZk
vser5PSsNQsOmEkRXk/rJtr9xMIwIYQvDLWiW1L1vCpVhCIillHQFp/ew3JPnZIOA2XCioWRH3Nr
Z6Q8NCrpQNt1ilto1TXVXURe7TUqqlhzsF+FjpaEOD0lETbo0Uo5KFQzMdPvM3Ju5nys0qTipUqN
xIPSF+1BTx8vhrR7ift4XUNULtlZiCIoa9WCTkf2rZVxlwU+FdZw5cjzoT8tytJ0ZPB+q03R2QR9
6QObl+oMB1KgFpj0vGCUe5s1qcWcLC9ir0R2K3nUyjz3sxz+l0N/SHUlkzlfxbRpdKKabNpEKpHv
eU9a1DMLKmN4I7w2hXJlDiinUo3zKeOn86UdyHUQuS5QJtwkHG9Elgfff9fJ5q6OqAuGgWplBsu8
vtlMLXPsSxP8VP39mQ08iIxwiDFNHNAtTctGziJWCFfOcXNUGZ8AiCM6ejVFmMdyJU0FQBt+ACZ2
i359fgHz9vk3FAazxI9fqHzBrL4TEzO/rFWe5MvIk1CO6zkVdPjTnpl7PeSB70SmwC7P0jBwKZkC
+r0htatOMMprU2pfHlRiUW7yN/WYd7Vi9m7Wm/z95CuFodRVwZrNwqu4PrQi3N7SRZbFCV1l1nZZ
u5CISvUXOtJM55P/+PLt58vn/314/vLX84cPzx8e/py4/vj29Q88uPwvtWFzyMfcckqdoMcx90qb
pg2lCSSYXymxtIPERu0BIEvZlBdKF0CM6lC8E86PqLyxRY5BzhYzzvTvoeNs3WHgbVM1Q6kNRbFX
t+y8/Ybhj1HDAPoTmhLq/+nD03c+J+iHHjzRZWuaf96+fBQdZ/pWaj95k8raA9QSGQ2gtRT6vOVa
oH+CBbuftRmRYdZapNwRGfIpLV7ZKsaFRH+xAEjCpUej8aVQbE2BddI8/cQqztd4YsTWBn4n9Fc6
I/dsrPjfMIkpTzIhDcbfLlP1IU4+D6gI1aReh+uiOBXUyzh3fl1ccb3bnpKYYPT5s6R1Gjt++8eo
U3UQI+WNPnSRWDexc69ryvpHeM9qtBRUQUg00mtz/lCKSuzb/HE61JSpxscsd5OKRY6nkY/6b+Cs
9CKAjlmRcw7vM6MaOqa6j3gtUSPNw1nuF02hdDZpjic2Y3lS6rK2fNpNF/KmDitbbh3ve0KrV2QN
dRl5Ix0akH9lmWZ5h1mO56RPGsqaP8oKO/xQVAxhd7JKO5RfyZ8/4Va5FGANBKCusYrslGdgJEf5
dd936BAw6g1pUwJUdaOsvObBuR65IUCf261c05T7Gpu+G7jkZXq27tsPY+Hthm4KyWloShhZxg2T
RH1Yp/zKIzB1xxu+woU7xdZIMy/fIBfPD7A+wIKyxKbkqf38py0dPE1JvM6XNjRMhly5J2mWYflS
V4PmeHUTcDce+6lOQqM0+VF72p9P+ewkKSUB/6KTEIDmsj2lTVnIU64y5seep6aB9CJLnYigN3nn
+cxJVKXbQJV5S0dNhEEbytcjFvroho7idrYgQ7Mf6U46p5aNcRxZYrLPTG1e1i35ateczvHe7YmS
Crq2dkggNp8Fxe+W1wE0DHrd8ZQdlKlhKQ8YRJlJz1kQ125oAXwbkNiA1LEBcjAiEUDrUs4Bg7l6
KT8XAb+V5XAicBcPsMGOkxdI6C4BKdq9VmHzJ1X/Vvf3Ed3beiTBc8NfGaE2tBA0XiPjVOwzvrOa
eXN46u/fwSDgqRlqKv8uDsZRu28gPC65PqVst3Fb0HSGUhmKa9ZRO7BCiR/wL8d1DLnLfGDX0wVf
b1b0/VhfC0Ni3R6q/EL7iIka2yURiykrVbRB1mRh4UFHandnLUF8UUcOesCJuoIhqrEp7ns1AvFG
0yxWHqc+//4OK4fZZFnRhTDR6ykJqvEgosBO9IGAqNMrVDsdh0nqWtQu0Ap7esEnqvYgJN/nRTve
1/knqo0/dgzqPgljXcrQVbmXTP1Lslq0+hRDZF+8Us999a49ZVoSuyJ2Qk+vfaC6CafqdVfQZslS
STjRE58hYAkbzTn6PBzCxLdJHnI/TFKzehgITSKK7Ll6mTg5dT0jd8PbZlTfW1DQax0pe6Kcem0S
39Xzg8TQLD2Q01R7uWIePGajLTq40ZiqVJjp3Ig6h5lr3HdTI4ei77s6Nff9JDEz3lWsZbSeKqaI
PnMDxydLRpRA7Y2HQ18eMuWelMgMqHtyMOGrsnt2ddElydB33T/+59O0xbBaLPJHwja/F8wLEvpk
R2Zyr9SMvXKok/ZKZ4dKHqpEruTcss9P/5Z93EAOt5HuGIykUeQLOlOcEBcyFsoJbUCiVZ8M8ctQ
eAWSLu3K6vp2KXSILoXHowa2zJE4oTUBn542VB76ERyVh34GReWhzt1kDqEEE0CcODbApYGkdAIb
4sZEP5r6i6Q78zDn2YW+cSZQdGAl1WqOYgSCWn0+V6JvXLtW2I7Xhjz06IpMMJqGUlbkGNwJBo2S
uphW79glz9T+zoTPQpXvQkfQqdMXvDCr5QTN/gNWHygaTiQHAhHZuuewUncE+eo5spI/07GpI2UO
lZGE0jcUBiIHnO5RIuvy0N7LC92jZya2s8S8mEpuw5sMDB8T16Tv3nrxOI5mridA94vS4WNBh0LU
+YrhfoaOBE14P13og9OlvsBU9snDzanEwOCGDlHRFjosl26sLP4a4lkQz1Vs5Tl9wJLUoSbDmaPu
ktiLqW8RSSxvrk0suhVmpM7blRQ++JHtIbE1724QxpanteYKLkUofMEdhZRWJQnkSqE5JHk1pQlZ
g50XeemGVOg2gRuOplAOpERqCHghWecIxb7lxa6VJ4QEt7MEyiuRMmt2fhCb9EmBjanhc8jOhxIP
HL00oFwEZr5+CB3fpwrVD2kQUm7QM8M5Z64j72svBdFthRVI0zSUVjO+Img/75dKMWsFcTrdOaoP
I4s7A08vYEeahv7i5F7EvislKtEDN1D2kmWEWuJXhsZ1PJeSiUBIC0WI6ukqR2qR6luSc+OYBFJP
8dBYgCEeXQvgu/QtAYACd+uGgeAgMwhA5FkAy6UEDtGjaeFhvuW9vZUjBxuTnqsWnhFvMJ3QVBj6
1vJE9CKvKy1hmxeWYey2E8zhD3zjHW/gb1RnwYR1bJDdyHOpKtuDGe6E9K1imSfx9lSkoJUl9OOQ
mSkf1BjfM7nJXT9OfNTStpMewOw5D7g4b/Id6tBNGL14Szyewyi7a+EA/SqjsgsA7Yw3weLA/UR9
eqyOkUvqDDNHtWsy5ZGHld6pMVEXBPfwLCrxwjMkxOh+kwfEkALFtXc9+pIQBt+ARX2zZpet7I38
iAUlNBMXAJHXCdDVPB3WfHJpvnSrAdC5xg2JOQgBzyXnZA55W52Cc1gKHHgRMUoFQA5T1Hbgv43k
kCNyIiI9jrjE4sCBKKGBNLbkw3fjzXILFp8oH96Piqi1jwM+ncMoCjxLTqJo8/Ia59gqxmanaPLO
JxfqIY9CQidoytPec3dNrqsm6+KUy8bM0uhN5FPUmOogTeyTnbEhb51JMDW8mpho+rpJyIQTS8LJ
dsIJWf11sz0em5RscqBTlo0Eh55PqmUcCrZXWMGzVZwuT2KfGrgIBB5ZVHy7j++2VYx2w1oY8wHG
ItEVEIhjYlwDAFY/MZ0jkDpEHz11eRNTnZAfDqRSZ+9U37uFjyajMulRWdyVeAZamgCsbfd8v+8I
YdWJdef+XnWMRHs/9KhhCUDiREShq75joXbDdsFYHSWgiWz2Ki90oogYE7iuxAnZ3QSEbpTnOttu
d+D1E9c2bYsSkctBFDnbHRqYPCfeVD0ES2hbcmCO3BzfyBIElLGABnaUEPNLN5awGBFfgEkaOIFH
dGdAQj+KieXhnBepePbTyD1CHnkGN3OMRVe6HjnRvKsjd/Pb7tpM+p4GsONAtSWQqT4LZP83Sc4J
7qIpYV0lZvIStOnAISdogDxXP0AxeSLcctwoL2tYHsQNVYQJSYmGE9jOT4k8s/wYRuNohMNXcM/2
oU+MRzYMLKa0ONY0EaUXwYLsekmRuOQYzgoWJ962KQ8cMWW6QoUm5Bx1yjyH6MdIp6ZloPvkZDfk
MTHTDccmD6mh1XQutU5wOrHicDoxdoEeOFRugE7msulCl5B/GVwtcPSMXBM/jn36QEDmSdxtexp5
Upe+5yVxyEEeFIDINKeTpoBAcD7QHbAo1hqmVDJgocoTaR62Kwij4ki9HqWylPITRwuknSnLdLnj
cIVFvqE8EeYItCbAnyPES5DMxMqm7A/lKb8t95nuRVlnt3vD5DczZ3abYTvjcjSXmYbBefCOJb5a
2Cn+7DPHHHj60F4gs2V3v1aM8hWl+Pe48cKDh74mmQd/5ddmN0QbIgl8ySKVIjKgCzb/45WE1hzJ
kvAlxYlr4/uyQe1FeSF2hlQHqNktQ+o4q/sW9y7cSE0+sDM6nnkxbqZoV7UW8qm9ZrdWDn+wQOJa
oHi4ujxhfykIrrYrT9zjFIVI/XNhMJzN+F7y9enl/ccP3/710P14fvn05fnbr5eHw7d/P//4+k3z
FZjldH05JYMtZRdoD1GArzss8uiDK7GhTjKpDWTWtHAt2SYL70B8MzRXHqharWGiBcURKw2EDgFM
UWAkYCngu6rq8VB7o4AcZx0hd3LOI5DiShD7UzhEbkIguNXgj3QOl8GxlcVyOBNi2dA1Ve7SYqGX
Zh5ghfnqOPfL//vX1/c8jqw1zOK+MC4uIS3LhyQNQjJAJMLMj5VXASaaqkpjxoWLncUtl3+WDV4S
O8bVG5kF70qKp1yU8KALdKzzIleBXd6EqTOOesF2RRrGbnOlA4hwkWPnOaMtpMa+WD1zlc8E9dXP
VFdpXv26Q+9C9CliQhHlc7+VKPtzY1Pwk2ujRpAaetYtVIlFK5vJQtmJMxh5VMIRtZkzgcphOdLw
3TG8DzCfKMiVm7v+aLb2RLbEbJA5FP92DvAzYJV2rCJQcnllrgAYavcO3zf0VRpIFNchJQHVWxZ5
Ri4fy8bmS4pwknRNQpqiKxrqMjk5ImNzic4oztm1Mq+ulQZVbwxBTSJzHCCd3KRb4CTwDWFJ6sSE
rCT16LO8BU+pnZsVTQyhA5iO9vkIYbvIeUmThZbv+D1bMsgsjkXVwwdJONXr2eryfQjDwVZvy0m7
TBPurLqk/jFxKJuVY2L5UuWwMtfDtiK1CuJopIDHWwKdR74esBtDx9FYs53v2ogiQKuSawaWom0B
0F3HkTbgTTTfD8f7wGANz3V5deenga02hZuL/smAt/7O1p7RZXWTUVYbelK4juwOInyG1fNwQSN9
53niq5uxmilOJ/fKF1jz4pjLAoX06UszEkcY2WZtycPZzFESbUgWPtCbWU7lGDAy1Yh0JWNbixQw
wSxp8dEcrnXg+FYtY3K/Jjr7tXa92Cd1pLrxQ+t4NXzJOZH7gKs04goQ10IWP3pVORHkDTVj5qD1
DC/QJV6b0HVoZ+UZdu2zJfc6p721Fph2J5vgwLqw6RsVK43qIhNiX+j1/Y2VZq79wpdem2zbYyNu
LIwjjaheS+o3OjJp9cQkuKcmiNl8WbqhHGDBpuSvhsV0AiGnthCtD0CtHPtqLIv7pa2HTI5nsTLg
+6bnrObBxM+N7P+68uAmBN+DkLmI7IDicrBNLisX2icJOXNJPEXoq8u/hPF1aPtzzcZREfmQYkUk
q8PE9B6iQPpFGA0cyV6x8Gg6htS4hsqvYhE98hUmj5zJNRaXTmOfnUI/DGkVTmNLSPfllUm9D7HS
hVZOpy+wS2hx718ZK1anvvNaPvGs0ItdOibByrblCyNxgYYSkx2MIx5dIu67u90b+LIe2j9PKO1Q
YhFrF5kxgKI4oiDTolCxMLF9ppkcOhbasCQKUrqQHLTo+CoXGB2bdcF5QnKscyj2rVBKDnXJbLJg
qW8tVIxn/a+XCthIT1GJabJ6tYiBCh4ntowACGbZKwl0LrScpQ83XRi49I0emSlJQsoJW2WJyMm2
6d7GqaVXgYFnm67w2mRAOhRJPPvzOwy9TMnuLjCJqfczNPCVOY7zpDYB5IWxFV/tQRPS7T4JAiWF
Tk/YnJtJMq/pMoecxBBitopmYZPE0fbYM+1MCasPoasd+0uo0K62pYNwJ8pI4bckmQPS0WBMh+hc
udBfwY387UEi2Y20iMjTdipIJhhmlpFKmZxWtuS1AcnZ3P+gTJM9asMseo5Ag/8os2ALbubiosbm
WAHdqFCR0NKfzLu1M4u+cYKP36rvlNVVT++a8jdu87YAtZiWPMX9XoVXqM+M4bHwlATrtu2mFyYX
4VU/hR6oyLBf0I21+NMLCR9APLEGn8foVbhSNPamLKrsnpf55gPDgovgEM+J/nj6/vHTeyN0TNY3
SnDJ+dV6iSye/Pzx9OX54a9ff/+NMa7MaJT7nZqp+YlN6jPxnuPT+//+/OlfH1/wPZW8MIOrr82a
g0VdZ/z5W2wm+uQNWqXmr3HYWedHHl9JeXmNUq+yuYVYe1afG2In843UY1WY0XiOlbRLDT/Wq31D
X54Ow1FBRSDc6ff5qN22qcgnmsRt8+/P7z89feZ5MM6h8MMsGMop6oNMzfszPSdwtOvIl+E5du5L
uYvzopX1Y3XS08iPZd9TQcsEWMGvm/FNe9YUfAVuMjwMtcrk48IQeeOvwVplQt0f2lNPOy0gQ9mw
uxIpFml1qZyacdq7x/Kmkg5ls6t6szH3lpeeOFi3fdXq4T8lBkiFR7W2M9xsRblm9dB2enYuVXll
rfboh5qnW8/dFSxiKzzuVUsunnSSCG+yXW+0zXCtTsfMJvaxPGFMo6E1ulad264Lc7TUhl5dntpL
q9HaQ0WNjJmOPzrq9GFhkPsEEvtzs6vLLis8Aa2zGoCHNHCATNYw4tdjWdZM41B6/qHK5xcRFHo9
9Mp9PU68zS/8KWXrS9HZ7eOryvsWfR9sufg/1p6kuXGc1/v7Fa45zVR1f6PF66EPsiTbmkiWIslu
py8qd6JOuyax82ynZjK//gGkFoKCkvmq3iHlCAAXUSQBglhijMmsz3IMxR2IKUnh6zygAOBW/g0F
Jc4aTVNgzpNVooD7xyTxcye8UwPdCChsLLDXs8A6VQd56RrHc3VBETrojLaWRli0cIrZ0nvKZU4g
X5gUyZwo27DmRQKLLm3UFEyAc9+JOiCYMsAV/E6voP4kZNN3iWkQad9lieHxnUxNItWAtLksao+c
NP8jvtOboEs72HLudAIVJ5nvd3bFfAWLnTuLSSRGNW7CdLZXEAq8b31h+Q2y2CLJuIOX2BmDIIr1
PWsXrKNY7+Y3P43fGdxvdx4wV31FSnvAYrWZs/Aq/pd86vDqUM9LXMdpYXh/G72XE0pEVOCARBPu
0Dax6RVgI5lk8yJeuQHI33ke+oW/BoZLdmekeFd05ZM7Ao/VM5rUsK4qXQkrll0P938yBjh12c06
cxY+RtLYRPhxO0VXp8uVj+laVbX2v2oJfvBJip5kk2+ghdh7Oc7RkogtE7YdNYSOQM9TlGzXILBg
QHUXmOPSbyKDAgUJ1asWdNa2YY1mvBJVUqApOm+wLpt2Izhbc1rMFj2a6uNAdeQSlhqGOTSpH7fA
+KE5sgybD2MvKMT1n6FVKIBWpzYAj4fckbXBztRgYAIqg3t166rg/dHwBFVPlAbZHl6Nd18ZwaP+
TiajEWOr3+BU4+8WaDNA1aG7Ak5H1DenBvOq6ho7pZq2dnTYQAkNemzrQ11fHuZOvukuFakZ6B9q
ecfyHt41rWFmTPnbBdkvVrUnUOz1nZznnqXpg8kA5fZopo9/q9hVobnroJ5Ih4buaGZSoypZyXuB
1pplMOKizsvyihWNCg8y21yEtjnTv0+FkP4R2v4iMk1/fzoc//zV/G0Am/ogXc4FHlp/xZhgHPcZ
/Nry8d86O9QcpZreD6Jbo8h3CnckYL4A4p2nBhJhsu9U9i3HWpie9Kwu3B46H6fVHTYDkp8Pj4+E
JUhS2KiXftqd2BWi6AQK5ojiNaZ5zfVuVNhIzQJPMCsfRLC57+S9zTdako+64Cab3kocF8S4gM0o
Q+j0WPkEWZvxM7HfDi9XjE58GVzlILeza11efxyeMOD6/en44/A4+BW/xXV/fiyvv/GfQurYApJs
hr6pE2kmpgSd9OS9JEQyc+A7daCShz9g0ZHdeD2MxnFd4P7BPAj5gU9zt4qR3io9ASTkis4Ae5Ez
3ywGpxc0ZaAW7ndrzEHL6nlkKTjtbX3MBavlga+wmR8uMDgXmyRYksAspT4jKhxXfK6n06lkT63b
dbXOZucFGZzGqN7IGw75IF03mUHcreRzIbIhGH/Dlq0hhPPMF0tR+EZLDFoSBKiZZBposvA6azXv
jHhs8i4YGjiNcdi/jMhpFxBS2IN9PMv6wkJg0B48qs7RWYc/7KgknGJFwdc6ArUX7WNF2ALQHqXw
0mCr7XoIx+CP/nrDtLf1ErLktqs4yzvEVfrg+/PpcvpxHazeXsrz5+3g8bUE8VxVFDfZQ98nVY6x
d9SxOneWMudU/Zoxag31Zz1HRAOVW5mY/8E3v7iZf7GM4fQdMmDrKqWhkWLmOW5QK/Q8XnPzrsJW
ubb1Qu9Fn69IgsypW+2vXuaLUnpH0e4chLDMHBduFwcIWE8MYo2422KCNqy9WNgarWEPPnTmiduD
i/Bupou53ThCYQdVJxx+aqlhJ1rgiAUWmdOB38hfEqtbHYneF+EQuWqQ04LTeJMHbd6wANjH5bp/
PBwflTOhvOi5vy/hLHt6Lmn+Bwc2T3NMQqZXoCEJU6yVl3Ue90+nR0wR8HB4PFwxL8DpCI3qLUym
5litfmJNad3v1aO2VKO/Hz4/HM6ltMXj28QgWcTCtwL12C3W2Nrekfbso3YlD92/7O+B7Hhf/osh
IS4X8DwZjtWGP65MsnLRG/iR6OzteP1ZXg6EqTvebMpeJQsEST3YW52M31Ze/zqd/xSD8vZPef40
CJ5fygfRR1d9S6VpOBfx8YT/ZWXV3BWB4zD/xePbQMxAnOGBq46oP5mqK7YC6AasNbhj3txM876m
RE/S8nJ6wqPQhx/YykyLBvr+qGyjfGMWscapivpSq1ocD+fT4YHc31YgvZxIrqKOxzIrFsnSQSdN
ljVs1gGIZJh8mplAFSMVLp6pevNVIxZBGlXphjSMdptZgzuHky5Fj+tli5dX9O8S9V0U1Xhy81oD
t8E81ZUDzQikgbf0PUyfwjacBFq4Ynkpv7/8WV65+3cNU3dlF4QYCw8HlqbgWwR+6GFH+CR7X9Us
vTK5RKjcJcADJgGFoSORugVh6C8d966ib8Xrr7CA1pjJpfNSrkjikp1ez5wXpDgAU6dyAQEBeO6T
HmVo4EH8nmEi1mpkjNpRuFHej4zyjRqDYVW1Q8vUUEosLrwwgiV8tnw8nJN9mXu7pqAThPOYZlWp
EkYU0YoThKu0tpFWqqpIyHKdAU7L59O1fDmf7rkUbQxWlnp5vjx2v0eaRJnqc4uPWgYlCbt1MRcJ
vYPSMQggOx5psxl1NJ/4GqSN6h1G8/jwFSNit4YlEhG7g18zmVEwPoqchr8NLqhi+nG4V7Tychd8
Bk4N4OzkcuPCoWU5qLB86C3WxUrzlfNp/3B/eu4rx+IlF90lvy/OZXm53z+Vg9vTObjtq+QjUqku
+U+066uggxPI29f9E3Stt+8sXlESiDRrnWm5Ozwdjn936mx3LvQp37oblu1yhZsbrX81C5QlF+Eu
uEj9W2bB+bvcFWq/OmsicOB3XP4luQiW8AcfVr+iWGTObEhTLlSYnuuBCtu15W4Rtk1Ny1uM8Otk
GU1Fk+Trkcla11YEaY4W1U6n2SwajdTgNRUYb/CoU0DkR3Gq3PkHJF8nphzZLBbErq2BwSGRBXuR
0wfXMyMqWLwR6zjDIP4GmSRSUXClbANmzfVQ/rvI2DIdUtEqiBNCzyhJLJUk+1oZoqmfsUJUBTrr
6KODmnL5U4NmKmgX2moYzApAPa9qIPFcE8CJ1QGwVLS+eeSYaiBDeLYs+jw0Os+dOhCm5T2eRy7M
Y6H/5GP9eI7Fqvk8x1ZdimAOpZ6a0VcCZhpADZWmXMWL5gubiKw3u8zjbOZvdu4fN6ZBM2xErm2x
oeGiyJkMVaVCBeg43lXgXrdMwPf5YQBuOmSvGwEzG41M3RlTQrXmAcRvOdHOhQ/Hurbu3DHRmGSu
YxvqRMjym6mt+qciYO6M/t9UD0UWLCMHlbhqIno4bxszMyW7K57JLc7yGBEkQ5s3scaaPmNmas8a
PXWOw7DlE85tBBBjg1YNz0WACe9Rg4eJrkOtppagT7MxmWjdnYynhalVwyvLEaG9GwnXhbodNfAx
PM8sip8NZ/R5tqNNz4asdwJsbiLut6PGG3FddEUwNSCaG1CQjGkBLEtzV/fXWz+ME79JbNBjGwTs
lb9CXu0mbFxgeYNOO4FxKYcTetuOoL7bacTNuGkhMdTxHOQGw+pxBxbRi42ezUAg2aAFgLGGaqgZ
ANhquFwAzMYkGI2b2BZNI4mgodXj5Qy4GTt8MgQIHb61s6kCrrZ3WlVIIC2Oeb13eEJQi2KvucV3
6zMmYoyp6XZhttWFDTODujlKhGmZbEKhCmtMM5P2ty42zYwRPyQVxdjMxqwjmcBDtWrUGgmbzKgP
hYRO7SG3h1VIEiO0qlrYS2gV5aE7HLHpKLaLsWnQ71SJ9rt6qf23St3F+XS8Dvzjg5qiHFPI+cAu
Qp+pUylRHf1enuAwoG39U1vd9laRO6zyPTQnwqaUFPl/ls+He1R7lsfLidSVhw5IeSvGFk+i/G9x
hWOGbB75Yyoc4bMu/AgYkbRcN5uqiy1wbimfhtP3xNACkbpef+gF7GGQBijlLxObxnFNMlY82X6b
Vtt1rf/QB0k6OxweKoDQXrpweDwdqctBJUlJwZmaXmjoVthuzQ7Z+tXJEmVtGE8xsFKBkCV1Ob1P
QgrPkqaU7JQm97cE0kizPZN2KibFcq0zPI58bQ1XfelKyS/XDyylvVwAvKwzIgGZ0Sd/bNDnKX0m
YUTxeajdmACEE3EBMZpZaE6iWp5XUA1gawBjqDUxtoZpr1iL+GnnzoagZ+OeEB2AnIzISQieNTls
NBlzu5xA0LGcTAz6JrpcZNMrtOlUPal5SZyjdZoCyYZDGiIEuLw5Zp0Qkf+PVT4VjS2b2isCax6Z
bCwlQEwpMwM2PJz0xXoC3IxNOJDjtSXwRgvN6wgXAfBoNNH5JUAnttkTI0aix6xvoWQxcrCUm6l3
1kBz9/nw+vz8VmmQ6FL3NlF0V/jbpb/W1lwQJaEv8f0YKOmvc3IZ3yGR6gRWvdXpW+VTV/7va3m8
f2su2v5BeznPy35PwrDWa0qN87JO/v67d7hcz4fvr3gHqa7+2ajyTSWa6p5yMm38z/2l/BwCWfkw
CE+nl8Gv0O5vgx9Nvy5Kv+i93mJos+olganmQp3Z/b9spvUdfHd4yNb4+HY+Xe5PLyX0pWbeSm9R
TcL7g0ucaZONUYLGOsii2+kuzYZUBJtHS5NdwIudk1mYg0vZAFoYZRIKnDAIhUsu79JYaiMa8Xlj
GyTkjgSw7EeWxmskHoX+AO+g0axSR+dLOAYY3HrtfhgpMJT7p+tPRdKqoefrIN1fy0F0Oh6uVAhb
+MMh2WMFYKjtgrbxzskHkRa7QtmmFaTaW9nX1+fDw+H6xk64yLJNTiHirXJVolvhoYEen4hfSBR4
vLnfKs9IoHL5TL92BaNzKN+QyOEByI8j+myRz9h5S7nVwp5yRTPf53J/eT2XzyWI468wasyy46NO
VThqVV4B2eQqFY7K0YE57jzrcrWAkUFY7OJsOqEBDWpYjyjRoDXt5E20Y+WHYL0tAjfCvENKB1Wo
rt8jOF6RgySwrsdiXRNtu4ogC15BcMJmmEVjL9v1wdndo8bVI1FzuP4poVaAn7EgFlEqtNXIS0Nr
4aR96ZzGvD9gjRDtruNtUB1CZ1OIq50XG0OQngwu4q6TeNnMpnNDwGbsvj5fmROSZxSe6SWQG9mW
OeXmCGKoDAcQm82sDIixuk7xeazmXlgmlpMYVPcgYfCahsH5Sor4qCYMBRFqlEwt1sww+XhylIh1
DhIok+ZXVPXpYZ+nXEWQpPRC/I/MMS2zJyBPkhoji1XK5anu7bKFOTF0udaBPQA7UddrBVHUl+vY
AVGBvFWc5DBfuNYTB5O8IVLdYU2TZvFECJ8GKb+xbZK6JS822yCzRgyILtUWrO1XuZvZQ5NVECFG
vfxpskrAlxypSkABmGqACY2hBaDhyOYGZZONzKmaCGLrrkM67BJik1He+lE45nMBS5Sav2sbjslt
1Df4RpZlEKGU7i3S0nj/eCyv8paB2XVupjM1C4h4Vk+XN8Zspu5J1c1V5CyJL6QC7mE2KoX2/QBm
m2yMOGXtYEE/jyMfvV/pnVUUufbIGvK7YrXBi3aFgNejQsJZgalPSGhhDdGXRbBG8xyupkojm0R9
onBtrlOcxpbYb9oGbX95Kv/WjjZCmaSHwVBjQNZlKkno/ulw7MwZbs8L1m4YrJvP0nPx0JDLe+Mi
jfNOkAWF6TKti+Zr/6TBZzQlPD7AiflY0hNxgF776SbJicJNnQuYeIG7pm7a51upePcRJGo4qz/A
3+PrE/z/crochOEsM06CGw2LJOadmv9NbeQ8+HK6ggByYC7RR5a6y3kZ7BT0hmM0JJoWBExNHaBG
83YxTQ8N3Qsgsyc8LuJG7+BMg13feRIa9eWCdsTS3pUdB/g8V9VZLUpmTUyvnupkEakoOJcXFOrY
s848McZG1JMPI0p6bufDFWzaZG/yEpDpPtjaRNAWIlMkPdm2Ajcx9ZNgPcpJaJIkAOJZC00rYTSy
bxLatGA2ordh4rlzcy+hPeFyAWlPOisvLzrhaep5MCJn4FViGWOl398SB4TKcQdA364Gaptl5zO3
UvgRjZG7PDGzZza5U+kSVxPo9PfhGc+RuIQfDhdp2M5tBCg4jlh5Kgw8J8UgA36xVVfo3LTUFZsQ
T550gab1VDLO0oXByUDZbkYFrh30RH2GcmSdo6RiGxYrlYQjOzR2uj/BBwPxX9uYz4hGCm3O6aL+
oC7JK8rnF9QR0gWubsyGA0zCj2iwNUy6OGVjcoPsEMncQrEbb5KQWD8pqxmr5MqHu5kxVhPBSwi5
qI3guEMuKwSEU4DnwMdUEVw8qxKoyLw4HRH3C25Mmgn2VbF0x9SEglGqfUFgJ0AFwSrJVHoc0kXO
wywsFnmkV119k55Cwu9eaOilhJLeDu5/Hl6YuB/pLRo50zNzsQjYWBxVypX0lhz69bqbqhPHvSmI
jx3sZ35eJ3APaeBqxMxTN8ryeXXrq3ZK4lFcCYvlV6ZzkiAPWndxuems7gbZ6/eLsBxtX7tOgAVo
5QDdAosoSALgRiviTzp3o+IGg71vsrmlm/nXow+F6xxHeZymxOlYRXqkbRWTBSCTEddIgnVCNn4O
0uBcCaLdNLrFLtLao2AHY6e+l4JMdk5hTddRscrUXCsEhS+tdyp2/TDGC8vU07PF15sd+QBNxeh7
4dLIjZFLwgfKz1eef5zOz2J/fJYqWc7p8z0yZQ45XTfo1m2mnv1rL41pIBzdj8ZzFG3ZehupieTF
Y7MZNA3LcPK+n0gPGak8/jq4nvf3gk92Ax5mOe8AzZRqFJTJUjVvk14FCab11bOC6CjhoaAoR6Gi
IlqmDWGmn0Ebisruo+9utqGDY8ywT6fZEEWOu9rFmq2pwErXms4bLFLf/+Z3sFWnklRE/ETmk2r1
pf6S5NiLFxqcvoG34O1OFxn/2lkQ8wFKsjDAdM6sYhfeCP5f+67mubtBDDsXNJN1eZ94eAJuJVYb
kam2DopOIDbBcS5x0ox1ffJ36DqjTt0aUszRz6eIqdc+uqtj9PWbYM2zOSgIm1Z6l/TECAT8Fvbc
nGyzDbA3V0JLMd8EYR6s0cJz7eSbVI3fusiYEAUSxB8XJE6EEeEadbrV3W7gaM6rlzd5vMiGxYL7
2BJZUIFhAe1q5K2CEV4X03cySRDd/f1PLQwrME93xcc9rajl5nopXx9Ogx8wY9oJU2/QaewW6kQQ
gG2kGR+1wFpX4W2oiChIkCfnXCJKgQUBJPRS9U7+xk/XauPafioSIK6crFgGS2edI8smmTLkTzvA
NZfovq/CfdDdHuezDD7BfbW1n2M6NJVK2fhD+lC7+n/55XA5YWT1z+YvbWtIgLGIsd/F0OZNOAnR
5F8RsddmhGSqXlVoGKsXM+rFkHMrxfVYomtE3ClPI+ntl6qS1jDDXkzvu4zH77wLZwJFSGaqrQDF
9A75zO57tRnNtUA7M+EOrkgSZDFOtWLaU6tpUVsFHdn3LUSkE1pn3ZSp11cjOKseFW/3Ffzo5UZ8
Rzofr0b0r5uaYvYhhcmdcQnBsGd4tN7exMG0SBnYhsJAFCpAVlTz3ddgELnzwNXfVmJAVNikfPSg
hiiNnTxgQ+s2JHdpEIbqQaDGLB2fh4MgdsN1CVhC6Kx5RXdDs94EXDAqMg4BNxTA8G8CNVINIjb5
gihoNusA5zgnc8XFV3KWJcKTNB4t71/PqKppAyU1POpO2fHxCaTH242fwQEX2a/CJf00C4BdrHMk
S0FWoumyMU6pL6I388y/kqAYkrbxwlthFmUZjJn2SwZqCtwGpVzIuBspZ0V+Jo7QOZx/uU9RU6pc
WHiGrxw4+a2hayg0uXFyB6I5CIS6i3yHjL3rdJCVI0UE32vlh4kqt7NoDKu1+vLL75fvh+Pvr5fy
/Hx6KD//LJ9eyvMvzXmtCrrTvq5qgxlm0Zdf0Ezu4fTX8dPb/nn/6em0f3g5HD9d9j9K6ODh4dPh
eC0fcR58+v7y4xc5NW7K87F8Gvzcnx9Koe1sp8j/tMFEBwc4jh72T4d/9tRYDxM440uBVL2OiVsj
ItDfFAdSiZHWpcDjDyVob6n4xmt0f98b42Z94jfCFc7FuD7Euue3l+tpcH86lwM4dMuRV4VRSQ4y
U8LGE5JYJ1w6xOpdBVtduO94LLBLmt24QbJS55GG6BZZkdhXCrBLmpJ4UQ2MJWwEwk7He3vi9HX+
Jkm61ADs1uDGEUMK+6mzZOqt4NQgRaL0Q5GOr4oWXpBhlveiEwCur4C/y+Ek3xcvriJeLkxrGm3C
To/Xm5AHcu8gftioWdVobfIVbLaN7vD1+9Ph/vOf5dvgXkzzR0wG8dYu4frjkrhPEuZ1p5DvugyM
JUy9zOH6v0m3vjUambPOKdB5vf7EG7v7/bV8GPhH0WG8Gf3rcP05cC6X0/1BoLz/q+xIluPWcb+S
mtMcZlK24/hlDj5QaqqlWJu19HZROU6P05Xnpdz2q/f5A4CSGiQhJXNIxU1A3EEsBIG7tztvBGGY
eb1YhpnUhRh4m7o4K4t0ez6VwG2kyGVSn4uuQQMR6ttkJbSioQ045FbeMAPyZ8ZD/ugPIvDnN4wC
v6zxN37Y1MIyBELX0kqyPvfAQmiulPq1EdoDVr2ulE/DeTxMtk/eGGS7af3FwziRq9HQeHf8MTVn
mfI7F2cqFEa+gYFMD31lPhounvfHN7+xKvx0IawRFvsztImdPAU9IEjVjb4I5jaeQZk5TqDJ5vxs
kUT+rp9oVdrvznm2uBS+yxazJJIlsNPJLD8ztVW2OOeJLFmx7Tt7Alx8lt4RnuCfLqQP61iJTooj
9OLzldcNKP58LjDeWH3yCzOhrAEpJih8RtosK+vJdV+8Lk1zRsg4vPyw7kPHo8enLyjrmkQYtsrb
IJnlVaoKJa103G7FOkoEoWEAnB67ecepyjRoWtI13oiBCoXzWI7B/EMBS6+EtrwbGkdCo//nMG5i
tVMz7LNWaa14xAeHZ0g7Tuu5CnVVmvsz77vscq6njZaNsgN4XeCy+KbU58cXdH+w5PRx9qJU8TjS
Az/YFV7Zl0tJ+kh3M3sIgLF/NO7qZgzxX909fX9+/JC/P37bvw5PekxP/Q1dJ11YVmIqkWE8VbCk
YKu+6IKQWGIMBiIfkAQD1jrfolflV0p8pvFCuNx6UBQ6O1VKRDuAqD/TjY5ok4rAiCEJ8yNQVDmw
aVDGIlcb+vPw7fUOtK/X5/e3w5PAdtHNXTqiqBzOGhHQc7XhmnoOR4QZMpz93KDIoFH2nK9hRBPB
AxsFmTnZ6evzOZRTMx4lMbQ5Oj8NSRZYfewJHhevfVrQq96BIxFkmhNUkvpPUGzv7FKS9REHM5Rs
pmLe8LoyTBQVdsuNdMei6m2WabTskDWo2Zb8IvUELNsg7XHqNrDRNp/P/tOFuuoNSbq/QmQ2rpuw
/oI5j1YIxTokjD+GGNYTUNQCO5Mrjd2lLtFwVGpz24j3foMxyz/A8f3Jf0kJOlKiguPh4ck48Nz/
2N//PDw9nGjRXOFw81tleY358Pr6H+wOp4cb/ZXNzcRzCfhjoaqt255kCDMVAy1joP66mezaCYNO
IvzL9HC47PuN6RiqDJIcewcrmDfR9fj4ZuogS5Ncq6qrMDC57fakvNvgsQWQ9DBeNI8E2rvcgBCY
h+W2i6oic9I4cJRU5xPQXDdd2yT8Ei4sqoV9fGBKLt3lbRZMRLfG/KIhcCROseG5dR6Ena85hF3S
tJ39lfOqBwvGwPhy04gABKiD7RfhUwOZknoIRVXrqe1nMIJkSr4Lr2TZxGZFIc+KkQS+PhcyLcVX
4GCzLIpsfh5AdEJpd/DxZaXoyuGW7/DMBgZsS2ZU6slrIKgJNWOpVDPJYyL+pdwTkNQEdCqW8Dc7
LHZ/dxueqbwvI1+p0trIPSRRV/KG6OGqkpwKT8AmBlLw2sM4v37PgvCrV9ZHme8LT8Psgl3CrY4M
stmJxZYUzcp7Adghdn7FMOwtUCS6ukgLS0/ipVgtJ+WAJyWEHxTKr6EAW/xeX9V1ESbAblYapqxS
PMOhqruksN2/CjuAYU4doLhymGvSSu66oJBkYaoqDW3H2nYVRGhe5AMAg69ZfhUIR8F0ykWmXqZm
nliVt8xUukyLwP41kiXrPpBQI5y2MPdZEvI79jDddY3iTzqrW5TRWItZaYfBhx/RgjVWUB7KJTAx
HlKSbkgWuuSpcPCaKl/y/jLfc4dj2Vc1gwhApS+vh6e3n8YJ+3F/fPDv+HBLFOTitEyBdaWjDf+P
SYzbNtHN9eU46F7e8Wq45IJEFhQoeumqylUmO+5MdnbUXA9/7v/9dnjsefuRUO9N+auU54V2Dqkv
kidYTlb8rEXrQ6xDFvA3AgLR3VpV+fX52QUfByxLCQSD/o+iA00FShRVCzh8L8caPYuBmIAAYc9K
T0WoryBEodiHvjqZajj9uhDqXlfk6ZYfK1hHVFQhiJJtbj5QaYIv3S4Cd3xlQR558udrrW4o4OeQ
ImkQuH53GWgdSIc/3A+7c7H/9v5AAd+Tp+Pb6zu+nuaZCzHPK0p+5H7tF44XgWbprs/+PmfeTQzP
5B2fnGTbKW0oo7Nk3Tmr46Ph9Q9hZui3ONNIX6F99UlXyuTddbNcWNZ3/C3U1gY19wugn5jtqXTL
Aow3Xbul6PTF1++3VsQeCbqq8eQ4prSvmN8Dj5UxJzs8GUB/wJBctnnQ1IJwOsMlzzn8tljnlhJF
mlWRYMpmUheYVM4hyKZg+E5YiSlkTGs6s+iEXWnpeblBKIKv2rpfsYrtU1zEwGvuX9VuYrgLW3eA
o+feLyupwpYOo+lqgOiB5iWvXBG9P0aHQ3+0d9RpG5BHg+tP0W8qECpSOGPcOftVOQZkhpUr0s6Y
V67Ozs7ckYy4o+PARL4oBx19VjF2q5zCrD+gyZ2hncxSVQMrWfRYOl8YzjJT30pOhm6AeZFlbe+x
LVu2e1qkINXkNCHpOCHJcTcKzwPfsmWguHkM3RDZYNYmtViM7xBtn4sToXvTE+NjGddoQfgfiueX
478+YICk9xfDNOK7pwfukYtJ6NDrozBO2FIxenm3zKxmgEgaRcvSjaHHdluO4U8ZGy2iZhKICT5I
OuZo1MLv4IxdY3OCLXRxCxPbqFreB+tbYOXA0Bduxo/RBX5u8owLFzDi7++Uwpcdwc6enH6pRXAi
VbEDUu02ceL032hdshRN2FPGXf55fDk84c02DOLx/W3/9x7+2L/df/z4kWc0LIaUx5TFpc9zYds3
MC+f4I/Pa8ChuOdHBfpF2+iN9k7pIcOHx+Bk9PXaQOCAK9bkm+W2tK4tt2lTSh1ztBUsA7nfP4p7
wOTZa5QT6IGe+hqnj+4EZhIVUpdg/+ObAi+d2mmYgiXjpIv8H6tsqTsgwIRMKiJZFmYHc1aDPgm7
1VhSPC5guI4/5h4AZyWc5LXESxnvgX8rXQVFfQo9STT208hE3+/e7j6gMHSPdkRBoUAr5OTalGSj
dPfY0i0xHosOPye+Cmq8ahTa9jBqwVRMhNke202FFcxo3iQmBo65aQtbSVqb2gwoNIBYEHmJWiwM
/rWkGoXIyqKOot06hhX63N4SWKRv6zEZ4emtr9V3hzhve/Wl8nO7KhBCw21TSGSVF6VpnzED2jCj
FjUPXYI8Hss4iy0ovECskTM+UwEVdhkJWzA7aNB1UPBhCVIGYZLKxs4W0yI+7XWnz1Qc2gcb2RTc
dBAU8pHwndyQIP5tmq5eJ6htumPz8AfDyQQiO8wHJdTpMTJWZCR+1f4isBdFwgrIkpK1DtLjp6Gq
Pkmp7ZiLR6XXOsg6IAREQrMW5/U/jNepauZ622+MfvHFCAlm6etclX0WZeZubYEGNR6WUkmb3zQV
wIkL62wG7+hWFkyTRiu/dCKwynOM5oKZR+g75/ZkwII9PcDFKegbnZmkeps3cR+yVEQwIzMbPMmR
QUwNnwirC+CEiDNVySRjgb02VApkWHpZhUe8ZVisxsFPb8J+3T075QBoFByypXN8nkjYwzi52DMc
uoSc2Vt80HKLtcKIsLVbwBg08ZnjD5HNUCeAeKJULWv/ZKhjbBXvEmELJYXt0E+kOGUSxqd59NzH
khBAuohAslgn+UKm0hjNBUFdkwbFTE90LHPeY42H212b/fENJSAUzMPnv/avdw8sDtFNa9VLP80Y
+GsDU2zPsynTGzO7Eox4A0p43ERvZAu0tlJEpq/GdshUqkxGYqbqiNjRdH38BgDTgv8Ky2jiQl8i
laR1qixbGJYZs4tnHLJxIpRRJ8BWe6NVblpBBsUXadTsTvs2qoJ9QKwJJtrkpRTzPYMe7lrrZ/eH
91bBGO//B7lyFCzLRQEA
--===============1239243844409680175==--

