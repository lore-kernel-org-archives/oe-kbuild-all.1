Content-Type: multipart/mixed; boundary="===============1239180742664116084=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/usb/misc/sisusbvga/sisusb.c:780:37: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Fri, 02 Oct 2020 00:56:40 +0800
Message-ID: <202010020025.jrP5zOlk-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1239180742664116084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   60e720931556fc1034d0981460164dcf02697679
commit: e5fc436f06eef54ef512ea55a9db8eb9f2e76959 sparse: use static inline =
for __chk_{user,io}_ptr()
date:   5 weeks ago
config: sh-randconfig-s031-20200930 (attached as .config)
compiler: sh4-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-201-g24bdaac6-dirty
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

	echo
	echo "sparse warnings: (new ones prefixed by >>)"
	echo
   drivers/usb/misc/sisusbvga/sisusb.c:542:9: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected unsigned short heade=
r @@     got restricted __le16 [usertype] @@
   drivers/usb/misc/sisusbvga/sisusb.c:542:9: sparse:     expected unsigned=
 short header
   drivers/usb/misc/sisusbvga/sisusb.c:542:9: sparse:     got restricted __=
le16 [usertype]
   drivers/usb/misc/sisusbvga/sisusb.c:542:9: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected unsigned int [userty=
pe] address @@     got restricted __le32 [usertype] @@
   drivers/usb/misc/sisusbvga/sisusb.c:542:9: sparse:     expected unsigned=
 int [usertype] address
   drivers/usb/misc/sisusbvga/sisusb.c:542:9: sparse:     got restricted __=
le32 [usertype]
   drivers/usb/misc/sisusbvga/sisusb.c:542:9: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected unsigned int [userty=
pe] data @@     got restricted __le32 [usertype] @@
   drivers/usb/misc/sisusbvga/sisusb.c:542:9: sparse:     expected unsigned=
 int [usertype] data
   drivers/usb/misc/sisusbvga/sisusb.c:542:9: sparse:     got restricted __=
le32 [usertype]
   drivers/usb/misc/sisusbvga/sisusb.c:578:9: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected unsigned short heade=
r @@     got restricted __le16 [usertype] @@
   drivers/usb/misc/sisusbvga/sisusb.c:578:9: sparse:     expected unsigned=
 short header
   drivers/usb/misc/sisusbvga/sisusb.c:578:9: sparse:     got restricted __=
le16 [usertype]
   drivers/usb/misc/sisusbvga/sisusb.c:578:9: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected unsigned int [userty=
pe] address @@     got restricted __le32 [usertype] @@
   drivers/usb/misc/sisusbvga/sisusb.c:578:9: sparse:     expected unsigned=
 int [usertype] address
   drivers/usb/misc/sisusbvga/sisusb.c:578:9: sparse:     got restricted __=
le32 [usertype]
   drivers/usb/misc/sisusbvga/sisusb.c:578:9: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected unsigned int [userty=
pe] data @@     got restricted __le32 [usertype] @@
   drivers/usb/misc/sisusbvga/sisusb.c:578:9: sparse:     expected unsigned=
 int [usertype] data
   drivers/usb/misc/sisusbvga/sisusb.c:578:9: sparse:     got restricted __=
le32 [usertype]
   drivers/usb/misc/sisusbvga/sisusb.c:780:37: sparse: sparse: incorrect ty=
pe in initializer (different address spaces) @@     expected unsigned char =
const *__gu_addr @@     got unsigned char [noderef] [usertype] __user * @@
   drivers/usb/misc/sisusbvga/sisusb.c:780:37: sparse:     expected unsigne=
d char const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:780:37: sparse:     got unsigned cha=
r [noderef] [usertype] __user *
>> drivers/usb/misc/sisusbvga/sisusb.c:780:37: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const vola=
tile [noderef] __user *ptr @@     got unsigned char const *__gu_addr @@
>> drivers/usb/misc/sisusbvga/sisusb.c:780:37: sparse:     expected void co=
nst volatile [noderef] __user *ptr
   drivers/usb/misc/sisusbvga/sisusb.c:780:37: sparse:     got unsigned cha=
r const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:795:37: sparse: sparse: incorrect ty=
pe in initializer (different address spaces) @@     expected unsigned short=
 const *__gu_addr @@     got unsigned short [noderef] [usertype] __user * @@
   drivers/usb/misc/sisusbvga/sisusb.c:795:37: sparse:     expected unsigne=
d short const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:795:37: sparse:     got unsigned sho=
rt [noderef] [usertype] __user *
>> drivers/usb/misc/sisusbvga/sisusb.c:795:37: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const vola=
tile [noderef] __user *ptr @@     got unsigned short const *__gu_addr @@
   drivers/usb/misc/sisusbvga/sisusb.c:795:37: sparse:     expected void co=
nst volatile [noderef] __user *ptr
   drivers/usb/misc/sisusbvga/sisusb.c:795:37: sparse:     got unsigned sho=
rt const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:842:37: sparse: sparse: incorrect ty=
pe in initializer (different address spaces) @@     expected unsigned int c=
onst *__gu_addr @@     got unsigned int [noderef] [usertype] __user * @@
   drivers/usb/misc/sisusbvga/sisusb.c:842:37: sparse:     expected unsigne=
d int const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:842:37: sparse:     got unsigned int=
 [noderef] [usertype] __user *
>> drivers/usb/misc/sisusbvga/sisusb.c:842:37: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void const vola=
tile [noderef] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/usb/misc/sisusbvga/sisusb.c:842:37: sparse:     expected void co=
nst volatile [noderef] __user *ptr
   drivers/usb/misc/sisusbvga/sisusb.c:842:37: sparse:     got unsigned int=
 const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:2653:29: sparse: sparse: incorrect t=
ype in initializer (different address spaces) @@     expected unsigned char=
 const *__gu_addr @@     got unsigned char [noderef] [usertype] __user * @@
   drivers/usb/misc/sisusbvga/sisusb.c:2653:29: sparse:     expected unsign=
ed char const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:2653:29: sparse:     got unsigned ch=
ar [noderef] [usertype] __user *
   drivers/usb/misc/sisusbvga/sisusb.c:2653:29: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __user *ptr @@     got unsigned char const *__gu_addr @@
   drivers/usb/misc/sisusbvga/sisusb.c:2653:29: sparse:     expected void c=
onst volatile [noderef] __user *ptr
   drivers/usb/misc/sisusbvga/sisusb.c:2653:29: sparse:     got unsigned ch=
ar const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:2664:29: sparse: sparse: incorrect t=
ype in initializer (different address spaces) @@     expected unsigned shor=
t const *__gu_addr @@     got unsigned short [noderef] [usertype] __user * =
@@
   drivers/usb/misc/sisusbvga/sisusb.c:2664:29: sparse:     expected unsign=
ed short const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:2664:29: sparse:     got unsigned sh=
ort [noderef] [usertype] __user *
   drivers/usb/misc/sisusbvga/sisusb.c:2664:29: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __user *ptr @@     got unsigned short const *__gu_addr @@
   drivers/usb/misc/sisusbvga/sisusb.c:2664:29: sparse:     expected void c=
onst volatile [noderef] __user *ptr
   drivers/usb/misc/sisusbvga/sisusb.c:2664:29: sparse:     got unsigned sh=
ort const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:2675:29: sparse: sparse: incorrect t=
ype in initializer (different address spaces) @@     expected unsigned int =
const *__gu_addr @@     got unsigned int [noderef] [usertype] __user * @@
   drivers/usb/misc/sisusbvga/sisusb.c:2675:29: sparse:     expected unsign=
ed int const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:2675:29: sparse:     got unsigned in=
t [noderef] [usertype] __user *
   drivers/usb/misc/sisusbvga/sisusb.c:2675:29: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/usb/misc/sisusbvga/sisusb.c:2675:29: sparse:     expected void c=
onst volatile [noderef] __user *ptr
   drivers/usb/misc/sisusbvga/sisusb.c:2675:29: sparse:     got unsigned in=
t const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:2740:21: sparse: sparse: incorrect t=
ype in initializer (different address spaces) @@     expected unsigned int =
const *__gu_addr @@     got unsigned int [noderef] [usertype] __user * @@
   drivers/usb/misc/sisusbvga/sisusb.c:2740:21: sparse:     expected unsign=
ed int const *__gu_addr
   drivers/usb/misc/sisusbvga/sisusb.c:2740:21: sparse:     got unsigned in=
t [noderef] [usertype] __user *
   drivers/usb/misc/sisusbvga/sisusb.c:2740:21: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/usb/misc/sisusbvga/sisusb.c:2740:21: sparse:     expected void c=
onst volatile [noderef] __user *ptr
   drivers/usb/misc/sisusbvga/sisusb.c:2740:21: sparse:     got unsigned in=
t const *__gu_addr
--
   drivers/watchdog/pcwd_usb.c:375:37: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@     expected char const *__gu_addr =
@@     got char const [noderef] __user * @@
   drivers/watchdog/pcwd_usb.c:375:37: sparse:     expected char const *__g=
u_addr
   drivers/watchdog/pcwd_usb.c:375:37: sparse:     got char const [noderef]=
 __user *
>> drivers/watchdog/pcwd_usb.c:375:37: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void const volatile [no=
deref] __user *ptr @@     got char const *__gu_addr @@
>> drivers/watchdog/pcwd_usb.c:375:37: sparse:     expected void const vola=
tile [noderef] __user *ptr
   drivers/watchdog/pcwd_usb.c:375:37: sparse:     got char const *__gu_addr
   drivers/watchdog/pcwd_usb.c:423:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@     expected int const *__gu_addr @=
@     got int [noderef] __user *p @@
   drivers/watchdog/pcwd_usb.c:423:21: sparse:     expected int const *__gu=
_addr
   drivers/watchdog/pcwd_usb.c:423:21: sparse:     got int [noderef] __user=
 *p
>> drivers/watchdog/pcwd_usb.c:423:21: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void const volatile [no=
deref] __user *ptr @@     got int const *__gu_addr @@
   drivers/watchdog/pcwd_usb.c:423:21: sparse:     expected void const vola=
tile [noderef] __user *ptr
   drivers/watchdog/pcwd_usb.c:423:21: sparse:     got int const *__gu_addr
   drivers/watchdog/pcwd_usb.c:447:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@     expected int const *__gu_addr @=
@     got int [noderef] __user *p @@
   drivers/watchdog/pcwd_usb.c:447:21: sparse:     expected int const *__gu=
_addr
   drivers/watchdog/pcwd_usb.c:447:21: sparse:     got int [noderef] __user=
 *p
   drivers/watchdog/pcwd_usb.c:447:21: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void const volatile [no=
deref] __user *ptr @@     got int const *__gu_addr @@
   drivers/watchdog/pcwd_usb.c:447:21: sparse:     expected void const vola=
tile [noderef] __user *ptr
   drivers/watchdog/pcwd_usb.c:447:21: sparse:     got int const *__gu_addr
--
   drivers/media/rc/lirc_dev.c:378:23: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@     expected unsigned int const *__=
gu_addr @@     got unsigned int [noderef] [usertype] __user *argp @@
   drivers/media/rc/lirc_dev.c:378:23: sparse:     expected unsigned int co=
nst *__gu_addr
   drivers/media/rc/lirc_dev.c:378:23: sparse:     got unsigned int [nodere=
f] [usertype] __user *argp
>> drivers/media/rc/lirc_dev.c:378:23: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void const volatile [no=
deref] __user *ptr @@     got unsigned int const *__gu_addr @@
>> drivers/media/rc/lirc_dev.c:378:23: sparse:     expected void const vola=
tile [noderef] __user *ptr
   drivers/media/rc/lirc_dev.c:378:23: sparse:     got unsigned int const *=
__gu_addr
--
   drivers/usb/image/mdc800.c:806:20: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected char const *__gu_addr @=
@     got char const [noderef] __user * @@
   drivers/usb/image/mdc800.c:806:20: sparse:     expected char const *__gu=
_addr
   drivers/usb/image/mdc800.c:806:20: sparse:     got char const [noderef] =
__user *
>> drivers/usb/image/mdc800.c:806:20: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __user *ptr @@     got char const *__gu_addr @@
>> drivers/usb/image/mdc800.c:806:20: sparse:     expected void const volat=
ile [noderef] __user *ptr
   drivers/usb/image/mdc800.c:806:20: sparse:     got char const *__gu_addr
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
>> sound/core/oss/pcm_oss.c:2592:21: sparse:     expected void const volati=
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
   fs/cifs/dfs_cache.c:195:14: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected char const *__gu_addr @@     g=
ot char const [noderef] __user *buffer @@
   fs/cifs/dfs_cache.c:195:14: sparse:     expected char const *__gu_addr
   fs/cifs/dfs_cache.c:195:14: sparse:     got char const [noderef] __user =
*buffer
>> fs/cifs/dfs_cache.c:195:14: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] _=
_user *ptr @@     got char const *__gu_addr @@
>> fs/cifs/dfs_cache.c:195:14: sparse:     expected void const volatile [no=
deref] __user *ptr
   fs/cifs/dfs_cache.c:195:14: sparse:     got char const *__gu_addr
--
   net/tls/tls_main.c:341:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *optlen @@
   net/tls/tls_main.c:341:13: sparse:     expected int const *__gu_addr
   net/tls/tls_main.c:341:13: sparse:     got int [noderef] __user *optlen
>> net/tls/tls_main.c:341:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
>> net/tls/tls_main.c:341:13: sparse:     expected void const volatile [nod=
eref] __user *ptr
   net/tls/tls_main.c:341:13: sparse:     got int const *__gu_addr
--
   net/ipv6/ip6mr.c:1837:13: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user *optlen @@
   net/ipv6/ip6mr.c:1837:13: sparse:     expected int const *__gu_addr
   net/ipv6/ip6mr.c:1837:13: sparse:     got int [noderef] __user *optlen
>> net/ipv6/ip6mr.c:1837:13: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
>> net/ipv6/ip6mr.c:1837:13: sparse:     expected void const volatile [node=
ref] __user *ptr
   net/ipv6/ip6mr.c:1837:13: sparse:     got int const *__gu_addr
   net/ipv6/ip6mr.c:405:13: sparse: sparse: context imbalance in 'ip6mr_vif=
_seq_start' - different lock contexts for basic block
   net/ipv6/ip6mr.c: note: in included file (through include/linux/mroute6.=
h):
   include/linux/mroute_base.h:427:31: sparse: sparse: context imbalance in=
 'mr_mfc_seq_stop' - unexpected unlock
--
   net/dccp/proto.c:535:52: sparse: sparse: incorrect type in argument 2 (d=
ifferent base types) @@     expected restricted __be32 const [usertype] ser=
vice @@     got int [addressable] val @@
   net/dccp/proto.c:535:52: sparse:     expected restricted __be32 const [u=
sertype] service
   net/dccp/proto.c:535:52: sparse:     got int [addressable] val
   net/dccp/proto.c:620:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected int const *__gu_addr @@     got i=
nt [noderef] __user *optlen @@
   net/dccp/proto.c:620:13: sparse:     expected int const *__gu_addr
   net/dccp/proto.c:620:13: sparse:     got int [noderef] __user *optlen
>> net/dccp/proto.c:620:13: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] __us=
er *ptr @@     got int const *__gu_addr @@
>> net/dccp/proto.c:620:13: sparse:     expected void const volatile [noder=
ef] __user *ptr
   net/dccp/proto.c:620:13: sparse:     got int const *__gu_addr
   net/dccp/proto.c:718:57: sparse: sparse: incorrect type in argument 2 (d=
ifferent base types) @@     expected restricted __be32 [usertype] param @@ =
    got int cmsg_type @@
   net/dccp/proto.c:718:57: sparse:     expected restricted __be32 [usertyp=
e] param
   net/dccp/proto.c:718:57: sparse:     got int cmsg_type
--
   fs/ocfs2/ioctl.c:860:21: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected int const *__gu_addr @@     got i=
nt [noderef] __user * @@
   fs/ocfs2/ioctl.c:860:21: sparse:     expected int const *__gu_addr
   fs/ocfs2/ioctl.c:860:21: sparse:     got int [noderef] __user *
>> fs/ocfs2/ioctl.c:860:21: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] __us=
er *ptr @@     got int const *__gu_addr @@
>> fs/ocfs2/ioctl.c:860:21: sparse:     expected void const volatile [noder=
ef] __user *ptr
   fs/ocfs2/ioctl.c:860:21: sparse:     got int const *__gu_addr
   fs/ocfs2/ioctl.c:882:21: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected int const *__gu_addr @@     got i=
nt [noderef] __user * @@
   fs/ocfs2/ioctl.c:882:21: sparse:     expected int const *__gu_addr
   fs/ocfs2/ioctl.c:882:21: sparse:     got int [noderef] __user *
   fs/ocfs2/ioctl.c:882:21: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] __us=
er *ptr @@     got int const *__gu_addr @@
   fs/ocfs2/ioctl.c:882:21: sparse:     expected void const volatile [noder=
ef] __user *ptr
   fs/ocfs2/ioctl.c:882:21: sparse:     got int const *__gu_addr
--
   net/x25/af_x25.c:470:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected int const *__gu_addr @@     got i=
nt [noderef] __user *optlen @@
   net/x25/af_x25.c:470:13: sparse:     expected int const *__gu_addr
   net/x25/af_x25.c:470:13: sparse:     got int [noderef] __user *optlen
>> net/x25/af_x25.c:470:13: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] __us=
er *ptr @@     got int const *__gu_addr @@
>> net/x25/af_x25.c:470:13: sparse:     expected void const volatile [noder=
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
>> net/netrom/af_netrom.c:359:13: sparse:     expected void const volatile =
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
>> net/rose/af_rose.c:438:13: sparse:     expected void const volatile [nod=
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
   net/rxrpc/af_rxrpc.c:697:13: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected int const *__gu_addr @@     g=
ot int [noderef] __user *_optlen @@
   net/rxrpc/af_rxrpc.c:697:13: sparse:     expected int const *__gu_addr
   net/rxrpc/af_rxrpc.c:697:13: sparse:     got int [noderef] __user *_optl=
en
>> net/rxrpc/af_rxrpc.c:697:13: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const volatile [noderef] =
__user *ptr @@     got int const *__gu_addr @@
>> net/rxrpc/af_rxrpc.c:697:13: sparse:     expected void const volatile [n=
oderef] __user *ptr
   net/rxrpc/af_rxrpc.c:697:13: sparse:     got int const *__gu_addr
--
   net/l2tp/l2tp_ppp.c:1376:13: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected int const *__gu_addr @@     g=
ot int [noderef] __user *optlen @@
   net/l2tp/l2tp_ppp.c:1376:13: sparse:     expected int const *__gu_addr
   net/l2tp/l2tp_ppp.c:1376:13: sparse:     got int [noderef] __user *optlen
>> net/l2tp/l2tp_ppp.c:1376:13: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const volatile [noderef] =
__user *ptr @@     got int const *__gu_addr @@
>> net/l2tp/l2tp_ppp.c:1376:13: sparse:     expected void const volatile [n=
oderef] __user *ptr
   net/l2tp/l2tp_ppp.c:1376:13: sparse:     got int const *__gu_addr
--
   net/sctp/socket.c:7814:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *optlen @@
   net/sctp/socket.c:7814:13: sparse:     expected int const *__gu_addr
   net/sctp/socket.c:7814:13: sparse:     got int [noderef] __user *optlen
>> net/sctp/socket.c:7814:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
>> net/sctp/socket.c:7814:13: sparse:     expected void const volatile [nod=
eref] __user *ptr
   net/sctp/socket.c:7814:13: sparse:     got int const *__gu_addr
   net/sctp/socket.c:8210:20: sparse: sparse: context imbalance in 'sctp_ge=
t_port_local' - unexpected unlock
--
   drivers/block/rbd.c:699:13: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected int const *__gu_addr @@     go=
t int [noderef] __user * @@
   drivers/block/rbd.c:699:13: sparse:     expected int const *__gu_addr
   drivers/block/rbd.c:699:13: sparse:     got int [noderef] __user *
>> drivers/block/rbd.c:699:13: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] _=
_user *ptr @@     got int const *__gu_addr @@
>> drivers/block/rbd.c:699:13: sparse:     expected void const volatile [no=
deref] __user *ptr
   drivers/block/rbd.c:699:13: sparse:     got int const *__gu_addr
--
   drivers/net/tap.c:53:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected int const *__gu_addr @@     got i=
nt [noderef] __user *sp @@
   drivers/net/tap.c:53:13: sparse:     expected int const *__gu_addr
   drivers/net/tap.c:53:13: sparse:     got int [noderef] __user *sp
>> drivers/net/tap.c:53:13: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] __us=
er *ptr @@     got int const *__gu_addr @@
>> drivers/net/tap.c:53:13: sparse:     expected void const volatile [noder=
ef] __user *ptr
   drivers/net/tap.c:53:13: sparse:     got int const *__gu_addr
   drivers/net/tap.c:991:21: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected short const *__gu_addr @@     go=
t short [noderef] __user * @@
   drivers/net/tap.c:991:21: sparse:     expected short const *__gu_addr
   drivers/net/tap.c:991:21: sparse:     got short [noderef] __user *
>> drivers/net/tap.c:991:21: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got short const *__gu_addr @@
   drivers/net/tap.c:991:21: sparse:     expected void const volatile [node=
ref] __user *ptr
   drivers/net/tap.c:991:21: sparse:     got short const *__gu_addr
   drivers/net/tap.c:1020:21: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected short const *__gu_addr @@     g=
ot short [noderef] __user * @@
   drivers/net/tap.c:1020:21: sparse:     expected short const *__gu_addr
   drivers/net/tap.c:1020:21: sparse:     got short [noderef] __user *
   drivers/net/tap.c:1020:21: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got short const *__gu_addr @@
   drivers/net/tap.c:1020:21: sparse:     expected void const volatile [nod=
eref] __user *ptr
   drivers/net/tap.c:1020:21: sparse:     got short const *__gu_addr
   drivers/net/tap.c:1033:21: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *sp @@
   drivers/net/tap.c:1033:21: sparse:     expected int const *__gu_addr
   drivers/net/tap.c:1033:21: sparse:     got int [noderef] __user *sp
   drivers/net/tap.c:1033:21: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   drivers/net/tap.c:1033:21: sparse:     expected void const volatile [nod=
eref] __user *ptr
   drivers/net/tap.c:1033:21: sparse:     got int const *__gu_addr
   drivers/net/tap.c:1048:21: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *sp @@
   drivers/net/tap.c:1048:21: sparse:     expected int const *__gu_addr
   drivers/net/tap.c:1048:21: sparse:     got int [noderef] __user *sp
   drivers/net/tap.c:1048:21: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   drivers/net/tap.c:1048:21: sparse:     expected void const volatile [nod=
eref] __user *ptr
   drivers/net/tap.c:1048:21: sparse:     got int const *__gu_addr
   drivers/net/tap.c:1063:21: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user *sp @@
   drivers/net/tap.c:1063:21: sparse:     expected int const *__gu_addr
   drivers/net/tap.c:1063:21: sparse:     got int [noderef] __user *sp
   drivers/net/tap.c:1063:21: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   drivers/net/tap.c:1063:21: sparse:     expected void const volatile [nod=
eref] __user *ptr
   drivers/net/tap.c:1063:21: sparse:     got int const *__gu_addr
--
   drivers/net/tun.c:330:13: sparse: sparse: incorrect type in initializer =
(different address spaces) @@     expected int const *__gu_addr @@     got =
int [noderef] __user *argp @@
   drivers/net/tun.c:330:13: sparse:     expected int const *__gu_addr
   drivers/net/tun.c:330:13: sparse:     got int [noderef] __user *argp
>> drivers/net/tun.c:330:13: sparse: sparse: incorrect type in argument 1 (=
different address spaces) @@     expected void const volatile [noderef] __u=
ser *ptr @@     got int const *__gu_addr @@
>> drivers/net/tun.c:330:13: sparse:     expected void const volatile [node=
ref] __user *ptr
   drivers/net/tun.c:330:13: sparse:     got int const *__gu_addr
   drivers/net/tun.c:3227:21: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int const *__gu_addr @@     got=
 int [noderef] __user * @@
   drivers/net/tun.c:3227:21: sparse:     expected int const *__gu_addr
   drivers/net/tun.c:3227:21: sparse:     got int [noderef] __user *
   drivers/net/tun.c:3227:21: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] __=
user *ptr @@     got int const *__gu_addr @@
   drivers/net/tun.c:3227:21: sparse:     expected void const volatile [nod=
eref] __user *ptr
   drivers/net/tun.c:3227:21: sparse:     got int const *__gu_addr
--
   drivers/net/hamradio/6pack.c:710:21: sparse: sparse: incorrect type in i=
nitializer (different address spaces) @@     expected int const *__gu_addr =
@@     got int [noderef] __user * @@
   drivers/net/hamradio/6pack.c:710:21: sparse:     expected int const *__g=
u_addr
   drivers/net/hamradio/6pack.c:710:21: sparse:     got int [noderef] __use=
r *
>> drivers/net/hamradio/6pack.c:710:21: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const volatile [n=
oderef] __user *ptr @@     got int const *__gu_addr @@
>> drivers/net/hamradio/6pack.c:710:21: sparse:     expected void const vol=
atile [noderef] __user *ptr
   drivers/net/hamradio/6pack.c:710:21: sparse:     got int const *__gu_addr
--
   drivers/net/ppp/ppp_async.c:420:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@     expected int const *__gu_addr @=
@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_async.c:420:21: sparse:     expected int const *__gu=
_addr
   drivers/net/ppp/ppp_async.c:420:21: sparse:     got int [noderef] __user=
 *p
>> drivers/net/ppp/ppp_async.c:420:21: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void const volatile [no=
deref] __user *ptr @@     got int const *__gu_addr @@
>> drivers/net/ppp/ppp_async.c:420:21: sparse:     expected void const vola=
tile [noderef] __user *ptr
   drivers/net/ppp/ppp_async.c:420:21: sparse:     got int const *__gu_addr
   drivers/net/ppp/ppp_async.c:435:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@     expected unsigned int const *__=
gu_addr @@     got unsigned int [noderef] [usertype] __user * @@
   drivers/net/ppp/ppp_async.c:435:21: sparse:     expected unsigned int co=
nst *__gu_addr
   drivers/net/ppp/ppp_async.c:435:21: sparse:     got unsigned int [nodere=
f] [usertype] __user *
>> drivers/net/ppp/ppp_async.c:435:21: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void const volatile [no=
deref] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/net/ppp/ppp_async.c:435:21: sparse:     expected void const vola=
tile [noderef] __user *ptr
   drivers/net/ppp/ppp_async.c:435:21: sparse:     got unsigned int const *=
__gu_addr
   drivers/net/ppp/ppp_async.c:446:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@     expected unsigned int const *__=
gu_addr @@     got unsigned int [noderef] [usertype] __user * @@
   drivers/net/ppp/ppp_async.c:446:21: sparse:     expected unsigned int co=
nst *__gu_addr
   drivers/net/ppp/ppp_async.c:446:21: sparse:     got unsigned int [nodere=
f] [usertype] __user *
   drivers/net/ppp/ppp_async.c:446:21: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void const volatile [no=
deref] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/net/ppp/ppp_async.c:446:21: sparse:     expected void const vola=
tile [noderef] __user *ptr
   drivers/net/ppp/ppp_async.c:446:21: sparse:     got unsigned int const *=
__gu_addr
   drivers/net/ppp/ppp_async.c:471:21: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@     expected int const *__gu_addr @=
@     got int [noderef] __user *p @@
   drivers/net/ppp/ppp_async.c:471:21: sparse:     expected int const *__gu=
_addr
   drivers/net/ppp/ppp_async.c:471:21: sparse:     got int [noderef] __user=
 *p
   drivers/net/ppp/ppp_async.c:471:21: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void const volatile [no=
deref] __user *ptr @@     got int const *__gu_addr @@
   drivers/net/ppp/ppp_async.c:471:21: sparse:     expected void const vola=
tile [noderef] __user *ptr
   drivers/net/ppp/ppp_async.c:471:21: sparse:     got int const *__gu_addr
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
   drivers/usb/core/devio.c:313:17: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] *p @=
@     got restricted __le16 * @@
   drivers/usb/core/devio.c:313:17: sparse:     expected unsigned short [us=
ertype] *p
   drivers/usb/core/devio.c:313:17: sparse:     got restricted __le16 *
   drivers/usb/core/devio.c:314:17: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] *p @=
@     got restricted __le16 * @@
   drivers/usb/core/devio.c:314:17: sparse:     expected unsigned short [us=
ertype] *p
   drivers/usb/core/devio.c:314:17: sparse:     got restricted __le16 *
   drivers/usb/core/devio.c:315:17: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] *p @=
@     got restricted __le16 * @@
   drivers/usb/core/devio.c:315:17: sparse:     expected unsigned short [us=
ertype] *p
   drivers/usb/core/devio.c:315:17: sparse:     got restricted __le16 *
   drivers/usb/core/devio.c:316:17: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] *p @=
@     got restricted __le16 * @@
   drivers/usb/core/devio.c:316:17: sparse:     expected unsigned short [us=
ertype] *p
   drivers/usb/core/devio.c:316:17: sparse:     got restricted __le16 *
   drivers/usb/core/devio.c:937:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const *__gu_=
addr @@     got unsigned int [noderef] __user * @@
   drivers/usb/core/devio.c:937:13: sparse:     expected unsigned int const=
 *__gu_addr
   drivers/usb/core/devio.c:937:13: sparse:     got unsigned int [noderef] =
__user *
>> drivers/usb/core/devio.c:937:13: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __user *ptr @@     got unsigned int const *__gu_addr @@
>> drivers/usb/core/devio.c:937:13: sparse:     expected void const volatil=
e [noderef] __user *ptr
   drivers/usb/core/devio.c:937:13: sparse:     got unsigned int const *__g=
u_addr
   drivers/usb/core/devio.c:938:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const *__gu_=
addr @@     got unsigned int [noderef] __user * @@
   drivers/usb/core/devio.c:938:13: sparse:     expected unsigned int const=
 *__gu_addr
   drivers/usb/core/devio.c:938:13: sparse:     got unsigned int [noderef] =
__user *
   drivers/usb/core/devio.c:938:13: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/usb/core/devio.c:938:13: sparse:     expected void const volatil=
e [noderef] __user *ptr
   drivers/usb/core/devio.c:938:13: sparse:     got unsigned int const *__g=
u_addr
   drivers/usb/core/devio.c:953:21: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const *__gu=
_addr @@     got unsigned char [noderef] __user * @@
   drivers/usb/core/devio.c:953:21: sparse:     expected unsigned char cons=
t *__gu_addr
   drivers/usb/core/devio.c:953:21: sparse:     got unsigned char [noderef]=
 __user *
>> drivers/usb/core/devio.c:953:21: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __user *ptr @@     got unsigned char const *__gu_addr @@
   drivers/usb/core/devio.c:953:21: sparse:     expected void const volatil=
e [noderef] __user *ptr
   drivers/usb/core/devio.c:953:21: sparse:     got unsigned char const *__=
gu_addr
   drivers/usb/core/devio.c:1290:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const *__gu=
_addr @@     got unsigned int [noderef] __user * @@
   drivers/usb/core/devio.c:1290:13: sparse:     expected unsigned int cons=
t *__gu_addr
   drivers/usb/core/devio.c:1290:13: sparse:     got unsigned int [noderef]=
 __user *
   drivers/usb/core/devio.c:1290:13: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/usb/core/devio.c:1290:13: sparse:     expected void const volati=
le [noderef] __user *ptr
   drivers/usb/core/devio.c:1290:13: sparse:     got unsigned int const *__=
gu_addr
   drivers/usb/core/devio.c:1309:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const *__gu=
_addr @@     got unsigned int [noderef] __user * @@
   drivers/usb/core/devio.c:1309:13: sparse:     expected unsigned int cons=
t *__gu_addr
   drivers/usb/core/devio.c:1309:13: sparse:     got unsigned int [noderef]=
 __user *
   drivers/usb/core/devio.c:1309:13: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/usb/core/devio.c:1309:13: sparse:     expected void const volati=
le [noderef] __user *ptr
   drivers/usb/core/devio.c:1309:13: sparse:     got unsigned int const *__=
gu_addr
   drivers/usb/core/devio.c:1441:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int const *__gu_addr @@ =
    got int [noderef] __user * @@
   drivers/usb/core/devio.c:1441:13: sparse:     expected int const *__gu_a=
ddr
   drivers/usb/core/devio.c:1441:13: sparse:     got int [noderef] __user *
>> drivers/usb/core/devio.c:1441:13: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got int const *__gu_addr @@
   drivers/usb/core/devio.c:1441:13: sparse:     expected void const volati=
le [noderef] __user *ptr
   drivers/usb/core/devio.c:1441:13: sparse:     got int const *__gu_addr
   drivers/usb/core/devio.c:2189:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const *__gu=
_addr @@     got unsigned int [noderef] __user * @@
   drivers/usb/core/devio.c:2189:13: sparse:     expected unsigned int cons=
t *__gu_addr
   drivers/usb/core/devio.c:2189:13: sparse:     got unsigned int [noderef]=
 __user *
   drivers/usb/core/devio.c:2189:13: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/usb/core/devio.c:2189:13: sparse:     expected void const volati=
le [noderef] __user *ptr
   drivers/usb/core/devio.c:2189:13: sparse:     got unsigned int const *__=
gu_addr
   drivers/usb/core/devio.c:2199:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const *__gu=
_addr @@     got unsigned int [noderef] __user * @@
   drivers/usb/core/devio.c:2199:13: sparse:     expected unsigned int cons=
t *__gu_addr
   drivers/usb/core/devio.c:2199:13: sparse:     got unsigned int [noderef]=
 __user *
   drivers/usb/core/devio.c:2199:13: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/usb/core/devio.c:2199:13: sparse:     expected void const volati=
le [noderef] __user *ptr
   drivers/usb/core/devio.c:2199:13: sparse:     got unsigned int const *__=
gu_addr
   drivers/usb/core/devio.c:2315:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const *__gu=
_addr @@     got unsigned int [noderef] __user * @@
   drivers/usb/core/devio.c:2315:13: sparse:     expected unsigned int cons=
t *__gu_addr
   drivers/usb/core/devio.c:2315:13: sparse:     got unsigned int [noderef]=
 __user *
   drivers/usb/core/devio.c:2315:13: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/usb/core/devio.c:2315:13: sparse:     expected void const volati=
le [noderef] __user *ptr
   drivers/usb/core/devio.c:2315:13: sparse:     got unsigned int const *__=
gu_addr
   drivers/usb/core/devio.c:2328:13: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const *__gu=
_addr @@     got unsigned int [noderef] __user * @@
   drivers/usb/core/devio.c:2328:13: sparse:     expected unsigned int cons=
t *__gu_addr
   drivers/usb/core/devio.c:2328:13: sparse:     got unsigned int [noderef]=
 __user *
   drivers/usb/core/devio.c:2328:13: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __user *ptr @@     got unsigned int const *__gu_addr @@
   drivers/usb/core/devio.c:2328:13: sparse:     expected void const volati=
le [noderef] __user *ptr
   drivers/usb/core/devio.c:2328:13: sparse:     got unsigned int const *__=
gu_addr

vim +780 drivers/usb/misc/sisusbvga/sisusb.c

^1da177e4c3f415 Linus Torvalds       2005-04-16  743  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  744  /* The xxx_bulk routi=
nes copy a buffer of variable size. They treat the
^1da177e4c3f415 Linus Torvalds       2005-04-16  745   * buffer as chars, t=
herefore lsb/msb has to be corrected if using the
^1da177e4c3f415 Linus Torvalds       2005-04-16  746   * byte/word/long/etc=
 routines for speed-up
^1da177e4c3f415 Linus Torvalds       2005-04-16  747   *
^1da177e4c3f415 Linus Torvalds       2005-04-16  748   * If data is from us=
erland, set "userbuffer" (and clear "kernbuffer"),
^1da177e4c3f415 Linus Torvalds       2005-04-16  749   * if data is in kern=
el space, set "kernbuffer" (and clear "userbuffer");
^1da177e4c3f415 Linus Torvalds       2005-04-16  750   * if neither "kernbu=
ffer" nor "userbuffer" are given, it is assumed
^1da177e4c3f415 Linus Torvalds       2005-04-16  751   * that the data alre=
ady is in the transfer buffer "sisusb->obuf[index]".
^1da177e4c3f415 Linus Torvalds       2005-04-16  752   */
^1da177e4c3f415 Linus Torvalds       2005-04-16  753  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  754  static int sisusb_wri=
te_mem_bulk(struct sisusb_usb_data *sisusb, u32 addr,
06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  755  		char *kernbuffer, i=
nt length, const char __user *userbuffer,
06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  756  		int index, ssize_t =
*bytes_written)
^1da177e4c3f415 Linus Torvalds       2005-04-16  757  {
^1da177e4c3f415 Linus Torvalds       2005-04-16  758  	struct sisusb_packet=
 packet;
^1da177e4c3f415 Linus Torvalds       2005-04-16  759  	int  ret =3D 0;
f996c49d4fa4e8e Peter Senna Tschudin 2016-01-15  760  	static int msgcount;
^1da177e4c3f415 Linus Torvalds       2005-04-16  761  	u8   swap8, fromkern=
 =3D kernbuffer ? 1 : 0;
^1da177e4c3f415 Linus Torvalds       2005-04-16  762  	u16  swap16;
^1da177e4c3f415 Linus Torvalds       2005-04-16  763  	u32  swap32, flag =
=3D (length >> 28) & 1;
2b53a19284f5371 Changming Liu        2020-07-11  764  	u8 buf[4];
^1da177e4c3f415 Linus Torvalds       2005-04-16  765  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  766  	/* if neither kernbu=
ffer not userbuffer are given, assume
^1da177e4c3f415 Linus Torvalds       2005-04-16  767  	 * data in obuf
^1da177e4c3f415 Linus Torvalds       2005-04-16  768  	 */
^1da177e4c3f415 Linus Torvalds       2005-04-16  769  	if (!fromkern && !us=
erbuffer)
^1da177e4c3f415 Linus Torvalds       2005-04-16  770  		kernbuffer =3D sisu=
sb->obuf[index];
^1da177e4c3f415 Linus Torvalds       2005-04-16  771  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  772  	(*bytes_written =3D =
0);
^1da177e4c3f415 Linus Torvalds       2005-04-16  773  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  774  	length &=3D 0x00ffff=
ff;
^1da177e4c3f415 Linus Torvalds       2005-04-16  775  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  776  	while (length) {
^1da177e4c3f415 Linus Torvalds       2005-04-16  777  		switch (length) {
^1da177e4c3f415 Linus Torvalds       2005-04-16  778  		case 1:
^1da177e4c3f415 Linus Torvalds       2005-04-16  779  			if (userbuffer) {
^1da177e4c3f415 Linus Torvalds       2005-04-16 @780  				if (get_user(swap=
8, (u8 __user *)userbuffer))
^1da177e4c3f415 Linus Torvalds       2005-04-16  781  					return -EFAULT;
^1da177e4c3f415 Linus Torvalds       2005-04-16  782  			} else
^1da177e4c3f415 Linus Torvalds       2005-04-16  783  				swap8 =3D kernbuf=
fer[0];
^1da177e4c3f415 Linus Torvalds       2005-04-16  784  =

06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  785  			ret =3D sisusb_wri=
te_memio_byte(sisusb, SISUSB_TYPE_MEM,
^1da177e4c3f415 Linus Torvalds       2005-04-16  786  					addr, swap8);
^1da177e4c3f415 Linus Torvalds       2005-04-16  787  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  788  			if (!ret)
^1da177e4c3f415 Linus Torvalds       2005-04-16  789  				(*bytes_written)+=
+;
^1da177e4c3f415 Linus Torvalds       2005-04-16  790  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  791  			return ret;
^1da177e4c3f415 Linus Torvalds       2005-04-16  792  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  793  		case 2:
^1da177e4c3f415 Linus Torvalds       2005-04-16  794  			if (userbuffer) {
^1da177e4c3f415 Linus Torvalds       2005-04-16 @795  				if (get_user(swap=
16, (u16 __user *)userbuffer))
^1da177e4c3f415 Linus Torvalds       2005-04-16  796  					return -EFAULT;
^1da177e4c3f415 Linus Torvalds       2005-04-16  797  			} else
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  798  				swap16 =3D *((u16=
 *)kernbuffer);
^1da177e4c3f415 Linus Torvalds       2005-04-16  799  =

06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  800  			ret =3D sisusb_wri=
te_memio_word(sisusb, SISUSB_TYPE_MEM,
06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  801  					addr, swap16);
^1da177e4c3f415 Linus Torvalds       2005-04-16  802  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  803  			if (!ret)
^1da177e4c3f415 Linus Torvalds       2005-04-16  804  				(*bytes_written) =
+=3D 2;
^1da177e4c3f415 Linus Torvalds       2005-04-16  805  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  806  			return ret;
^1da177e4c3f415 Linus Torvalds       2005-04-16  807  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  808  		case 3:
^1da177e4c3f415 Linus Torvalds       2005-04-16  809  			if (userbuffer) {
^1da177e4c3f415 Linus Torvalds       2005-04-16  810  				if (copy_from_use=
r(&buf, userbuffer, 3))
^1da177e4c3f415 Linus Torvalds       2005-04-16  811  					return -EFAULT;
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  812  #ifdef __BIG_ENDIAN
^1da177e4c3f415 Linus Torvalds       2005-04-16  813  				swap32 =3D (buf[0=
] << 16) |
^1da177e4c3f415 Linus Torvalds       2005-04-16  814  					 (buf[1] <<  8) |
^1da177e4c3f415 Linus Torvalds       2005-04-16  815  					 buf[2];
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  816  #else
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  817  				swap32 =3D (buf[2=
] << 16) |
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  818  					 (buf[1] <<  8) |
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  819  					 buf[0];
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  820  #endif
^1da177e4c3f415 Linus Torvalds       2005-04-16  821  			} else
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  822  #ifdef __BIG_ENDIAN
^1da177e4c3f415 Linus Torvalds       2005-04-16  823  				swap32 =3D (kernb=
uffer[0] << 16) |
^1da177e4c3f415 Linus Torvalds       2005-04-16  824  					 (kernbuffer[1] =
<<  8) |
^1da177e4c3f415 Linus Torvalds       2005-04-16  825  					 kernbuffer[2];
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  826  #else
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  827  				swap32 =3D (kernb=
uffer[2] << 16) |
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  828  					 (kernbuffer[1] =
<<  8) |
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  829  					 kernbuffer[0];
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  830  #endif
^1da177e4c3f415 Linus Torvalds       2005-04-16  831  =

06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  832  			ret =3D sisusb_wri=
te_memio_24bit(sisusb, SISUSB_TYPE_MEM,
06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  833  					addr, swap32);
^1da177e4c3f415 Linus Torvalds       2005-04-16  834  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  835  			if (!ret)
^1da177e4c3f415 Linus Torvalds       2005-04-16  836  				(*bytes_written) =
+=3D 3;
^1da177e4c3f415 Linus Torvalds       2005-04-16  837  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  838  			return ret;
^1da177e4c3f415 Linus Torvalds       2005-04-16  839  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  840  		case 4:
^1da177e4c3f415 Linus Torvalds       2005-04-16  841  			if (userbuffer) {
^1da177e4c3f415 Linus Torvalds       2005-04-16 @842  				if (get_user(swap=
32, (u32 __user *)userbuffer))
^1da177e4c3f415 Linus Torvalds       2005-04-16  843  					return -EFAULT;
^1da177e4c3f415 Linus Torvalds       2005-04-16  844  			} else
1bbb4f2035d94d8 Thomas Winischhofer  2005-08-29  845  				swap32 =3D *((u32=
 *)kernbuffer);
^1da177e4c3f415 Linus Torvalds       2005-04-16  846  =

06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  847  			ret =3D sisusb_wri=
te_memio_long(sisusb, SISUSB_TYPE_MEM,
06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  848  					addr, swap32);
^1da177e4c3f415 Linus Torvalds       2005-04-16  849  			if (!ret)
^1da177e4c3f415 Linus Torvalds       2005-04-16  850  				(*bytes_written) =
+=3D 4;
^1da177e4c3f415 Linus Torvalds       2005-04-16  851  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  852  			return ret;
^1da177e4c3f415 Linus Torvalds       2005-04-16  853  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  854  		default:
^1da177e4c3f415 Linus Torvalds       2005-04-16  855  			if ((length & ~3) =
> 0x10000) {
^1da177e4c3f415 Linus Torvalds       2005-04-16  856  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  857  				packet.header  =
=3D 0x001f;
^1da177e4c3f415 Linus Torvalds       2005-04-16  858  				packet.address =
=3D 0x000001d4;
^1da177e4c3f415 Linus Torvalds       2005-04-16  859  				packet.data    =
=3D addr;
^1da177e4c3f415 Linus Torvalds       2005-04-16  860  				ret =3D sisusb_se=
nd_bridge_packet(sisusb, 10,
^1da177e4c3f415 Linus Torvalds       2005-04-16  861  						&packet, 0);
^1da177e4c3f415 Linus Torvalds       2005-04-16  862  				packet.header  =
=3D 0x001f;
^1da177e4c3f415 Linus Torvalds       2005-04-16  863  				packet.address =
=3D 0x000001d0;
^1da177e4c3f415 Linus Torvalds       2005-04-16  864  				packet.data    =
=3D (length & ~3);
^1da177e4c3f415 Linus Torvalds       2005-04-16  865  				ret |=3D sisusb_s=
end_bridge_packet(sisusb, 10,
^1da177e4c3f415 Linus Torvalds       2005-04-16  866  						&packet, 0);
^1da177e4c3f415 Linus Torvalds       2005-04-16  867  				packet.header  =
=3D 0x001f;
^1da177e4c3f415 Linus Torvalds       2005-04-16  868  				packet.address =
=3D 0x000001c0;
^1da177e4c3f415 Linus Torvalds       2005-04-16  869  				packet.data    =
=3D flag | 0x16;
^1da177e4c3f415 Linus Torvalds       2005-04-16  870  				ret |=3D sisusb_s=
end_bridge_packet(sisusb, 10,
^1da177e4c3f415 Linus Torvalds       2005-04-16  871  						&packet, 0);
^1da177e4c3f415 Linus Torvalds       2005-04-16  872  				if (userbuffer) {
^1da177e4c3f415 Linus Torvalds       2005-04-16  873  					ret |=3D sisusb_=
send_bulk_msg(sisusb,
^1da177e4c3f415 Linus Torvalds       2005-04-16  874  							SISUSB_EP_GFX_=
LBULK_OUT,
^1da177e4c3f415 Linus Torvalds       2005-04-16  875  							(length & ~3),
^1da177e4c3f415 Linus Torvalds       2005-04-16  876  							NULL, userbuff=
er, 0,
^1da177e4c3f415 Linus Torvalds       2005-04-16  877  							bytes_written,=
 0, 1);
^1da177e4c3f415 Linus Torvalds       2005-04-16  878  					userbuffer +=3D =
(*bytes_written);
^1da177e4c3f415 Linus Torvalds       2005-04-16  879  				} else if (fromke=
rn) {
^1da177e4c3f415 Linus Torvalds       2005-04-16  880  					ret |=3D sisusb_=
send_bulk_msg(sisusb,
^1da177e4c3f415 Linus Torvalds       2005-04-16  881  							SISUSB_EP_GFX_=
LBULK_OUT,
^1da177e4c3f415 Linus Torvalds       2005-04-16  882  							(length & ~3),
^1da177e4c3f415 Linus Torvalds       2005-04-16  883  							kernbuffer, NU=
LL, 0,
^1da177e4c3f415 Linus Torvalds       2005-04-16  884  							bytes_written,=
 0, 1);
^1da177e4c3f415 Linus Torvalds       2005-04-16  885  					kernbuffer +=3D =
(*bytes_written);
^1da177e4c3f415 Linus Torvalds       2005-04-16  886  				} else {
^1da177e4c3f415 Linus Torvalds       2005-04-16  887  					ret |=3D sisusb_=
send_bulk_msg(sisusb,
^1da177e4c3f415 Linus Torvalds       2005-04-16  888  							SISUSB_EP_GFX_=
LBULK_OUT,
^1da177e4c3f415 Linus Torvalds       2005-04-16  889  							(length & ~3),
^1da177e4c3f415 Linus Torvalds       2005-04-16  890  							NULL, NULL, in=
dex,
^1da177e4c3f415 Linus Torvalds       2005-04-16  891  							bytes_written,=
 0, 1);
^1da177e4c3f415 Linus Torvalds       2005-04-16  892  					kernbuffer +=3D =
((*bytes_written) &
^1da177e4c3f415 Linus Torvalds       2005-04-16  893  							(sisusb->obufs=
ize-1));
^1da177e4c3f415 Linus Torvalds       2005-04-16  894  				}
^1da177e4c3f415 Linus Torvalds       2005-04-16  895  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  896  			} else {
^1da177e4c3f415 Linus Torvalds       2005-04-16  897  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  898  				packet.header  =
=3D 0x001f;
^1da177e4c3f415 Linus Torvalds       2005-04-16  899  				packet.address =
=3D 0x00000194;
^1da177e4c3f415 Linus Torvalds       2005-04-16  900  				packet.data    =
=3D addr;
^1da177e4c3f415 Linus Torvalds       2005-04-16  901  				ret =3D sisusb_se=
nd_bridge_packet(sisusb, 10,
^1da177e4c3f415 Linus Torvalds       2005-04-16  902  						&packet, 0);
^1da177e4c3f415 Linus Torvalds       2005-04-16  903  				packet.header  =
=3D 0x001f;
^1da177e4c3f415 Linus Torvalds       2005-04-16  904  				packet.address =
=3D 0x00000190;
^1da177e4c3f415 Linus Torvalds       2005-04-16  905  				packet.data    =
=3D (length & ~3);
^1da177e4c3f415 Linus Torvalds       2005-04-16  906  				ret |=3D sisusb_s=
end_bridge_packet(sisusb, 10,
^1da177e4c3f415 Linus Torvalds       2005-04-16  907  						&packet, 0);
^1da177e4c3f415 Linus Torvalds       2005-04-16  908  				if (sisusb->flagb=
0 !=3D 0x16) {
^1da177e4c3f415 Linus Torvalds       2005-04-16  909  					packet.header  =
=3D 0x001f;
^1da177e4c3f415 Linus Torvalds       2005-04-16  910  					packet.address =
=3D 0x00000180;
^1da177e4c3f415 Linus Torvalds       2005-04-16  911  					packet.data    =
=3D flag | 0x16;
f74a039c7e0bf6b Peter Senna Tschudin 2016-01-15  912  					ret |=3D sisusb_=
send_bridge_packet(sisusb,
f74a039c7e0bf6b Peter Senna Tschudin 2016-01-15  913  							10, &packet, 0=
);
^1da177e4c3f415 Linus Torvalds       2005-04-16  914  					sisusb->flagb0 =
=3D 0x16;
^1da177e4c3f415 Linus Torvalds       2005-04-16  915  				}
^1da177e4c3f415 Linus Torvalds       2005-04-16  916  				if (userbuffer) {
^1da177e4c3f415 Linus Torvalds       2005-04-16  917  					ret |=3D sisusb_=
send_bulk_msg(sisusb,
^1da177e4c3f415 Linus Torvalds       2005-04-16  918  							SISUSB_EP_GFX_=
BULK_OUT,
^1da177e4c3f415 Linus Torvalds       2005-04-16  919  							(length & ~3),
^1da177e4c3f415 Linus Torvalds       2005-04-16  920  							NULL, userbuff=
er, 0,
^1da177e4c3f415 Linus Torvalds       2005-04-16  921  							bytes_written,=
 0, 1);
^1da177e4c3f415 Linus Torvalds       2005-04-16  922  					userbuffer +=3D =
(*bytes_written);
^1da177e4c3f415 Linus Torvalds       2005-04-16  923  				} else if (fromke=
rn) {
^1da177e4c3f415 Linus Torvalds       2005-04-16  924  					ret |=3D sisusb_=
send_bulk_msg(sisusb,
^1da177e4c3f415 Linus Torvalds       2005-04-16  925  							SISUSB_EP_GFX_=
BULK_OUT,
^1da177e4c3f415 Linus Torvalds       2005-04-16  926  							(length & ~3),
^1da177e4c3f415 Linus Torvalds       2005-04-16  927  							kernbuffer, NU=
LL, 0,
^1da177e4c3f415 Linus Torvalds       2005-04-16  928  							bytes_written,=
 0, 1);
^1da177e4c3f415 Linus Torvalds       2005-04-16  929  					kernbuffer +=3D =
(*bytes_written);
^1da177e4c3f415 Linus Torvalds       2005-04-16  930  				} else {
^1da177e4c3f415 Linus Torvalds       2005-04-16  931  					ret |=3D sisusb_=
send_bulk_msg(sisusb,
^1da177e4c3f415 Linus Torvalds       2005-04-16  932  							SISUSB_EP_GFX_=
BULK_OUT,
^1da177e4c3f415 Linus Torvalds       2005-04-16  933  							(length & ~3),
^1da177e4c3f415 Linus Torvalds       2005-04-16  934  							NULL, NULL, in=
dex,
^1da177e4c3f415 Linus Torvalds       2005-04-16  935  							bytes_written,=
 0, 1);
^1da177e4c3f415 Linus Torvalds       2005-04-16  936  					kernbuffer +=3D =
((*bytes_written) &
^1da177e4c3f415 Linus Torvalds       2005-04-16  937  							(sisusb->obufs=
ize-1));
^1da177e4c3f415 Linus Torvalds       2005-04-16  938  				}
^1da177e4c3f415 Linus Torvalds       2005-04-16  939  			}
^1da177e4c3f415 Linus Torvalds       2005-04-16  940  			if (ret) {
^1da177e4c3f415 Linus Torvalds       2005-04-16  941  				msgcount++;
^1da177e4c3f415 Linus Torvalds       2005-04-16  942  				if (msgcount < 50=
0)
06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  943  					dev_err(&sisusb-=
>sisusb_dev->dev,
06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  944  							"Wrote %zd of =
%d bytes, error %d\n",
06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  945  							*bytes_written=
, length,
06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  946  							ret);
^1da177e4c3f415 Linus Torvalds       2005-04-16  947  				else if (msgcount=
 =3D=3D 500)
06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  948  					dev_err(&sisusb-=
>sisusb_dev->dev,
06e21efa2d344b5 Peter Senna Tschudin 2016-01-15  949  							"Too many erro=
rs, logging stopped\n");
^1da177e4c3f415 Linus Torvalds       2005-04-16  950  			}
^1da177e4c3f415 Linus Torvalds       2005-04-16  951  			addr +=3D (*bytes_=
written);
^1da177e4c3f415 Linus Torvalds       2005-04-16  952  			length -=3D (*byte=
s_written);
^1da177e4c3f415 Linus Torvalds       2005-04-16  953  		}
^1da177e4c3f415 Linus Torvalds       2005-04-16  954  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  955  		if (ret)
^1da177e4c3f415 Linus Torvalds       2005-04-16  956  			break;
^1da177e4c3f415 Linus Torvalds       2005-04-16  957  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  958  	}
^1da177e4c3f415 Linus Torvalds       2005-04-16  959  =

^1da177e4c3f415 Linus Torvalds       2005-04-16  960  	return ret ? -EIO : =
0;
^1da177e4c3f415 Linus Torvalds       2005-04-16  961  }
^1da177e4c3f415 Linus Torvalds       2005-04-16  962  =


:::::: The code at line 780 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1239180742664116084==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1239180742664116084==--

