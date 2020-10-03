Content-Type: multipart/mixed; boundary="===============5171810586094176401=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/usb/host/fhci-hcd.c:59:16: sparse: sparse: cast to restricted __be16
Date: Sun, 04 Oct 2020 01:32:19 +0800
Message-ID: <202010040114.SHKbAwWn-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5171810586094176401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rasmus,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d3d45f8220d60a0b2aaaacf8fb2be4e6ffd9008e
commit: 5a35435ef4e6e4bd2aabd6706b146b298a9cffe5 soc: fsl: qe: remove PPC32=
 dependency from CONFIG_QUICC_ENGINE
date:   10 months ago
config: powerpc-randconfig-s031-20201004 (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-201-g24bdaac6-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5a35435ef4e6e4bd2aabd6706b146b298a9cffe5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5a35435ef4e6e4bd2aabd6706b146b298a9cffe5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

	echo
	echo "sparse warnings: (new ones prefixed by >>)"
	echo
   drivers/usb/host/fhci-hcd.c:39:23: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short volatile [nod=
eref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn:=
2> * @@
   drivers/usb/host/fhci-hcd.c:39:23: sparse:     expected unsigned short v=
olatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:39:23: sparse:     got restricted __be16 [no=
deref] <asn:2> *
   drivers/usb/host/fhci-hcd.c:41:23: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short volatile [nod=
eref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn:=
2> * @@
   drivers/usb/host/fhci-hcd.c:41:23: sparse:     expected unsigned short v=
olatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:41:23: sparse:     got restricted __be16 [no=
deref] <asn:2> *
   drivers/usb/host/fhci-hcd.c:59:16: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short const volatil=
e [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef]=
 <asn:2> * @@
   drivers/usb/host/fhci-hcd.c:59:16: sparse:     expected unsigned short c=
onst volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:59:16: sparse:     got restricted __be16 [no=
deref] <asn:2> *
>> drivers/usb/host/fhci-hcd.c:59:16: sparse: sparse: cast to restricted __=
be16
   drivers/usb/host/fhci-hcd.c:89:36: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short volatile [nod=
eref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn:=
2> * @@
   drivers/usb/host/fhci-hcd.c:89:36: sparse:     expected unsigned short v=
olatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:89:36: sparse:     got restricted __be16 [no=
deref] <asn:2> *
   drivers/usb/host/fhci-hcd.c:90:36: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short volatile [nod=
eref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn:=
2> * @@
   drivers/usb/host/fhci-hcd.c:90:36: sparse:     expected unsigned short v=
olatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:90:36: sparse:     got restricted __be16 [no=
deref] <asn:2> *
   drivers/usb/host/fhci-hcd.c:110:36: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short volatile [no=
deref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn=
:2> * @@
   drivers/usb/host/fhci-hcd.c:110:36: sparse:     expected unsigned short =
volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:110:36: sparse:     got restricted __be16 [n=
oderef] <asn:2> *
   drivers/usb/host/fhci-hcd.c:120:28: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short volatile [no=
deref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn=
:2> * @@
   drivers/usb/host/fhci-hcd.c:120:28: sparse:     expected unsigned short =
volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:120:28: sparse:     got restricted __be16 [n=
oderef] <asn:2> *
   drivers/usb/host/fhci-hcd.c:121:28: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short volatile [no=
deref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn=
:2> * @@
   drivers/usb/host/fhci-hcd.c:121:28: sparse:     expected unsigned short =
volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:121:28: sparse:     got restricted __be16 [n=
oderef] <asn:2> *
   drivers/usb/host/fhci-hcd.c:275:23: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short volatile [no=
deref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn=
:2> * @@
   drivers/usb/host/fhci-hcd.c:275:23: sparse:     expected unsigned short =
volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:275:23: sparse:     got restricted __be16 [n=
oderef] <asn:2> *
   drivers/usb/host/fhci-hcd.c:278:23: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned int volatile [node=
ref] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef] <asn:2=
> * @@
   drivers/usb/host/fhci-hcd.c:278:23: sparse:     expected unsigned int vo=
latile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:278:23: sparse:     got restricted __be32 [n=
oderef] <asn:2> *
   drivers/usb/host/fhci-hcd.c:289:28: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short volatile [no=
deref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn=
:2> * @@
   drivers/usb/host/fhci-hcd.c:289:28: sparse:     expected unsigned short =
volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:289:28: sparse:     got restricted __be16 [n=
oderef] <asn:2> *
   drivers/usb/host/fhci-hcd.c:292:28: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short volatile [no=
deref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn=
:2> * @@
   drivers/usb/host/fhci-hcd.c:292:28: sparse:     expected unsigned short =
volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:292:28: sparse:     got restricted __be16 [n=
oderef] <asn:2> *
   drivers/usb/host/fhci-hcd.c:744:23: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short volatile [no=
deref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn=
:2> * @@
   drivers/usb/host/fhci-hcd.c:744:23: sparse:     expected unsigned short =
volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:744:23: sparse:     got restricted __be16 [n=
oderef] <asn:2> *
   drivers/usb/host/fhci-hcd.c:745:23: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short volatile [no=
deref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn=
:2> * @@
   drivers/usb/host/fhci-hcd.c:745:23: sparse:     expected unsigned short =
volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hcd.c:745:23: sparse:     got restricted __be16 [n=
oderef] <asn:2> *
   drivers/usb/host/fhci-hcd.c: note: in included file:
   drivers/usb/host/fhci.h:448:29: sparse: sparse: incorrect type in argume=
nt 1 (different base types) @@     expected unsigned short const volatile [=
noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <a=
sn:2> * @@
   drivers/usb/host/fhci.h:448:29: sparse:     expected unsigned short cons=
t volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci.h:448:29: sparse:     got restricted __be16 [noder=
ef] <asn:2> *
--
   drivers/usb/host/fhci-hub.c:96:28: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned short volatile [nod=
eref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn:=
2> * @@
   drivers/usb/host/fhci-hub.c:96:28: sparse:     expected unsigned short v=
olatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hub.c:96:28: sparse:     got restricted __be16 [no=
deref] <asn:2> *
>> drivers/usb/host/fhci-hub.c:101:42: sparse: sparse: invalid assignment: =
&=3D
>> drivers/usb/host/fhci-hub.c:101:42: sparse:    left side has type restri=
cted __le16
>> drivers/usb/host/fhci-hub.c:101:42: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:102:42: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/host/fhci-hub.c:102:42: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:102:42: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:122:42: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/host/fhci-hub.c:122:42: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:122:42: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:123:42: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/host/fhci-hub.c:123:42: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:123:42: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:161:29: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short const volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef=
] <asn:2> * @@
   drivers/usb/host/fhci-hub.c:161:29: sparse:     expected unsigned short =
const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hub.c:161:29: sparse:     got restricted __be16 [n=
oderef] <asn:2> *
   drivers/usb/host/fhci-hub.c:162:23: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short volatile [no=
deref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn=
:2> * @@
   drivers/usb/host/fhci-hub.c:162:23: sparse:     expected unsigned short =
volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hub.c:162:23: sparse:     got restricted __be16 [n=
oderef] <asn:2> *
   drivers/usb/host/fhci-hub.c:167:23: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short volatile [no=
deref] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <asn=
:2> * @@
   drivers/usb/host/fhci-hub.c:167:23: sparse:     expected unsigned short =
volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-hub.c:167:23: sparse:     got restricted __be16 [n=
oderef] <asn:2> *
>> drivers/usb/host/fhci-hub.c:187:34: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/usb/host/fhci-hub.c:230:59: sparse: sparse: invalid assignment: =
&=3D
   drivers/usb/host/fhci-hub.c:230:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:230:59: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:235:59: sparse: sparse: invalid assignment: =
&=3D
   drivers/usb/host/fhci-hub.c:235:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:235:59: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:239:59: sparse: sparse: invalid assignment: =
&=3D
   drivers/usb/host/fhci-hub.c:239:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:239:59: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:244:59: sparse: sparse: invalid assignment: =
&=3D
   drivers/usb/host/fhci-hub.c:244:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:244:59: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:248:59: sparse: sparse: invalid assignment: =
&=3D
   drivers/usb/host/fhci-hub.c:248:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:248:59: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:253:59: sparse: sparse: invalid assignment: =
&=3D
   drivers/usb/host/fhci-hub.c:253:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:253:59: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:257:59: sparse: sparse: invalid assignment: =
&=3D
   drivers/usb/host/fhci-hub.c:257:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:257:59: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:261:59: sparse: sparse: invalid assignment: =
&=3D
   drivers/usb/host/fhci-hub.c:261:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:261:59: sparse:    right side has type int
>> drivers/usb/host/fhci-hub.c:274:21: sparse: sparse: cast from restricted=
 __le16
>> drivers/usb/host/fhci-hub.c:274:21: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short [usertype] v=
al @@     got restricted __le16 [usertype] wHubStatus @@
>> drivers/usb/host/fhci-hub.c:274:21: sparse:     expected unsigned short =
[usertype] val
>> drivers/usb/host/fhci-hub.c:274:21: sparse:     got restricted __le16 [u=
sertype] wHubStatus
>> drivers/usb/host/fhci-hub.c:274:21: sparse: sparse: cast from restricted=
 __le16
>> drivers/usb/host/fhci-hub.c:274:21: sparse: sparse: cast from restricted=
 __le16
   drivers/usb/host/fhci-hub.c:276:21: sparse: sparse: cast from restricted=
 __le16
>> drivers/usb/host/fhci-hub.c:276:21: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short [usertype] v=
al @@     got restricted __le16 [usertype] wHubChange @@
   drivers/usb/host/fhci-hub.c:276:21: sparse:     expected unsigned short =
[usertype] val
>> drivers/usb/host/fhci-hub.c:276:21: sparse:     got restricted __le16 [u=
sertype] wHubChange
   drivers/usb/host/fhci-hub.c:276:21: sparse: sparse: cast from restricted=
 __le16
   drivers/usb/host/fhci-hub.c:276:21: sparse: sparse: cast from restricted=
 __le16
   drivers/usb/host/fhci-hub.c:281:21: sparse: sparse: cast from restricted=
 __le16
>> drivers/usb/host/fhci-hub.c:281:21: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short [usertype] v=
al @@     got restricted __le16 [usertype] wPortStatus @@
   drivers/usb/host/fhci-hub.c:281:21: sparse:     expected unsigned short =
[usertype] val
>> drivers/usb/host/fhci-hub.c:281:21: sparse:     got restricted __le16 [u=
sertype] wPortStatus
   drivers/usb/host/fhci-hub.c:281:21: sparse: sparse: cast from restricted=
 __le16
   drivers/usb/host/fhci-hub.c:281:21: sparse: sparse: cast from restricted=
 __le16
   drivers/usb/host/fhci-hub.c:283:21: sparse: sparse: cast from restricted=
 __le16
>> drivers/usb/host/fhci-hub.c:283:21: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned short [usertype] v=
al @@     got restricted __le16 [usertype] wPortChange @@
   drivers/usb/host/fhci-hub.c:283:21: sparse:     expected unsigned short =
[usertype] val
>> drivers/usb/host/fhci-hub.c:283:21: sparse:     got restricted __le16 [u=
sertype] wPortChange
   drivers/usb/host/fhci-hub.c:283:21: sparse: sparse: cast from restricted=
 __le16
   drivers/usb/host/fhci-hub.c:283:21: sparse: sparse: cast from restricted=
 __le16
   drivers/usb/host/fhci-hub.c:299:59: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/host/fhci-hub.c:299:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:299:59: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:304:59: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/host/fhci-hub.c:304:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:304:59: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:309:59: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/host/fhci-hub.c:309:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:309:59: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:312:59: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/host/fhci-hub.c:312:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:312:59: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:314:59: sparse: sparse: invalid assignment: =
&=3D
   drivers/usb/host/fhci-hub.c:314:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:314:59: sparse:    right side has type int
   drivers/usb/host/fhci-hub.c:318:59: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/host/fhci-hub.c:318:59: sparse:    left side has type restri=
cted __le16
   drivers/usb/host/fhci-hub.c:318:59: sparse:    right side has type int
--
   drivers/usb/host/fhci-sched.c:146:28: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned short volatile [=
noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <a=
sn:2> * @@
   drivers/usb/host/fhci-sched.c:146:28: sparse:     expected unsigned shor=
t volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-sched.c:146:28: sparse:     got restricted __be16 =
[noderef] <asn:2> *
   drivers/usb/host/fhci-sched.c:340:37: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned short const vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/host/fhci-sched.c:340:37: sparse:     expected unsigned shor=
t const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-sched.c:340:37: sparse:     got restricted __be16 =
[noderef] <asn:2> *
   drivers/usb/host/fhci-sched.c:348:53: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned short const vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/host/fhci-sched.c:348:53: sparse:     expected unsigned shor=
t const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-sched.c:348:53: sparse:     got restricted __be16 =
[noderef] <asn:2> *
>> drivers/usb/host/fhci-sched.c:404:34: sparse: sparse: restricted __le16 =
degrades to integer
   drivers/usb/host/fhci-sched.c:405:35: sparse: sparse: restricted __le16 =
degrades to integer
   drivers/usb/host/fhci-sched.c:406:41: sparse: sparse: restricted __le16 =
degrades to integer
   drivers/usb/host/fhci-sched.c:412:36: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned short volatile [=
noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <a=
sn:2> * @@
   drivers/usb/host/fhci-sched.c:412:36: sparse:     expected unsigned shor=
t volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-sched.c:412:36: sparse:     got restricted __be16 =
[noderef] <asn:2> *
   drivers/usb/host/fhci-sched.c:438:28: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned short volatile [=
noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <a=
sn:2> * @@
   drivers/usb/host/fhci-sched.c:438:28: sparse:     expected unsigned shor=
t volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-sched.c:438:28: sparse:     got restricted __be16 =
[noderef] <asn:2> *
>> drivers/usb/host/fhci-sched.c:440:42: sparse: sparse: invalid assignment=
: &=3D
>> drivers/usb/host/fhci-sched.c:440:42: sparse:    left side has type rest=
ricted __le16
>> drivers/usb/host/fhci-sched.c:440:42: sparse:    right side has type int
   drivers/usb/host/fhci-sched.c:441:42: sparse: sparse: invalid assignment=
: |=3D
   drivers/usb/host/fhci-sched.c:441:42: sparse:    left side has type rest=
ricted __le16
   drivers/usb/host/fhci-sched.c:441:42: sparse:    right side has type int
   drivers/usb/host/fhci-sched.c:472:50: sparse: sparse: invalid assignment=
: |=3D
   drivers/usb/host/fhci-sched.c:472:50: sparse:    left side has type rest=
ricted __le16
   drivers/usb/host/fhci-sched.c:472:50: sparse:    right side has type int
   drivers/usb/host/fhci-sched.c:475:50: sparse: sparse: invalid assignment=
: |=3D
   drivers/usb/host/fhci-sched.c:475:50: sparse:    left side has type rest=
ricted __le16
   drivers/usb/host/fhci-sched.c:475:50: sparse:    right side has type int
   drivers/usb/host/fhci-sched.c:490:50: sparse: sparse: invalid assignment=
: &=3D
   drivers/usb/host/fhci-sched.c:490:50: sparse:    left side has type rest=
ricted __le16
   drivers/usb/host/fhci-sched.c:490:50: sparse:    right side has type int
   drivers/usb/host/fhci-sched.c:492:50: sparse: sparse: invalid assignment=
: |=3D
   drivers/usb/host/fhci-sched.c:492:50: sparse:    left side has type rest=
ricted __le16
   drivers/usb/host/fhci-sched.c:492:50: sparse:    right side has type int
   drivers/usb/host/fhci-sched.c:494:50: sparse: sparse: invalid assignment=
: |=3D
   drivers/usb/host/fhci-sched.c:494:50: sparse:    left side has type rest=
ricted __le16
   drivers/usb/host/fhci-sched.c:494:50: sparse:    right side has type int
   drivers/usb/host/fhci-sched.c:553:37: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned short const vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/host/fhci-sched.c:553:37: sparse:     expected unsigned shor=
t const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-sched.c:553:37: sparse:     got restricted __be16 =
[noderef] <asn:2> *
   drivers/usb/host/fhci-sched.c:554:37: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned short const vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/host/fhci-sched.c:554:37: sparse:     expected unsigned shor=
t const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-sched.c:554:37: sparse:     got restricted __be16 =
[noderef] <asn:2> *
   drivers/usb/host/fhci-sched.c:557:28: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned short volatile [=
noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <a=
sn:2> * @@
   drivers/usb/host/fhci-sched.c:557:28: sparse:     expected unsigned shor=
t volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-sched.c:557:28: sparse:     got restricted __be16 =
[noderef] <asn:2> *
   drivers/usb/host/fhci-sched.c:571:44: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned short volatile [=
noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <a=
sn:2> * @@
   drivers/usb/host/fhci-sched.c:571:44: sparse:     expected unsigned shor=
t volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-sched.c:571:44: sparse:     got restricted __be16 =
[noderef] <asn:2> *
   drivers/usb/host/fhci-sched.c:609:44: sparse: sparse: incorrect type in =
argument 1 (different base types) @@     expected unsigned short volatile [=
noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <a=
sn:2> * @@
   drivers/usb/host/fhci-sched.c:609:44: sparse:     expected unsigned shor=
t volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci-sched.c:609:44: sparse:     got restricted __be16 =
[noderef] <asn:2> *
   drivers/usb/host/fhci-sched.c: note: in included file:
   drivers/usb/host/fhci.h:448:29: sparse: sparse: incorrect type in argume=
nt 1 (different base types) @@     expected unsigned short const volatile [=
noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <a=
sn:2> * @@
   drivers/usb/host/fhci.h:448:29: sparse:     expected unsigned short cons=
t volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci.h:448:29: sparse:     got restricted __be16 [noder=
ef] <asn:2> *
   drivers/usb/host/fhci.h:448:29: sparse: sparse: incorrect type in argume=
nt 1 (different base types) @@     expected unsigned short const volatile [=
noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef] <a=
sn:2> * @@
   drivers/usb/host/fhci.h:448:29: sparse:     expected unsigned short cons=
t volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/host/fhci.h:448:29: sparse:     got restricted __be16 [noder=
ef] <asn:2> *
--
>> drivers/usb/gadget/udc/fsl_qe_udc.c:67:33: sparse: sparse: incorrect typ=
e in initializer (different base types) @@     expected restricted __le16 [=
usertype] wMaxPacketSize @@     got int @@
>> drivers/usb/gadget/udc/fsl_qe_udc.c:67:33: sparse:     expected restrict=
ed __le16 [usertype] wMaxPacketSize
>> drivers/usb/gadget/udc/fsl_qe_udc.c:67:33: sparse:     got int
   drivers/usb/gadget/udc/fsl_qe_udc.c:148:52: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short cons=
t volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 =
[noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:148:52: sparse:     expected unsigne=
d short const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:148:52: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:155:42: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:155:42: sparse:     expected unsigne=
d short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:155:42: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:165:52: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short cons=
t volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 =
[noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:165:52: sparse:     expected unsigne=
d short const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:165:52: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:172:42: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:172:42: sparse:     expected unsigne=
d short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:172:42: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:193:17: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:193:17: sparse:     expected unsigne=
d short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:193:17: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:193:17: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short cons=
t volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 =
[noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:193:17: sparse:     expected unsigne=
d short const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:193:17: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:197:17: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:197:17: sparse:     expected unsigne=
d short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:197:17: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:197:17: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short cons=
t volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 =
[noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:197:17: sparse:     expected unsigne=
d short const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:197:17: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:210:17: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:210:17: sparse:     expected unsigne=
d short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:210:17: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:210:17: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short cons=
t volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 =
[noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:210:17: sparse:     expected unsigne=
d short const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:210:17: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:214:30: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:214:30: sparse:     expected unsigne=
d short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:214:30: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:216:17: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:216:17: sparse:     expected unsigne=
d short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:216:17: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:216:17: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short cons=
t volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 =
[noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:216:17: sparse:     expected unsigne=
d short const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:216:17: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:302:27: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef=
] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:302:27: sparse:     expected unsigne=
d int volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:302:27: sparse:     got restricted _=
_be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:317:51: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short cons=
t volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 =
[noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:317:51: sparse:     expected unsigne=
d short const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:317:51: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:334:42: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:334:42: sparse:     expected unsigne=
d short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:334:42: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:387:27: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef=
] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:387:27: sparse:     expected unsigne=
d int volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:387:27: sparse:     got restricted _=
_be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:391:19: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef=
] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:391:19: sparse:     expected unsigne=
d int volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:391:19: sparse:     got restricted _=
_be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:396:27: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef=
] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:396:27: sparse:     expected unsigne=
d int volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:396:27: sparse:     got restricted _=
_be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:400:19: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef=
] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:400:19: sparse:     expected unsigne=
d int volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:400:19: sparse:     got restricted _=
_be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:456:27: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef=
] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:456:27: sparse:     expected unsigne=
d int volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:456:27: sparse:     got restricted _=
_be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:461:19: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef=
] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:461:19: sparse:     expected unsigne=
d int volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:461:19: sparse:     got restricted _=
_be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:506:42: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:506:42: sparse:     expected unsigne=
d short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:506:42: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:770:25: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short cons=
t volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 =
[noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:770:25: sparse:     expected unsigne=
d short const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:770:25: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:771:30: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned short vola=
tile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noder=
ef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:771:30: sparse:     expected unsigne=
d short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:771:30: sparse:     got restricted _=
_be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:836:68: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int const =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [n=
oderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:836:68: sparse:     expected unsigne=
d int const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:836:68: sparse:     got restricted _=
_be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:964:68: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int const =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [n=
oderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:964:68: sparse:     expected unsigne=
d int const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:964:68: sparse:     got restricted _=
_be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:1074:33: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned short con=
st volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16=
 [noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:1074:33: sparse:     expected unsign=
ed short const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:1074:33: sparse:     got restricted =
__be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:1075:22: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned short vol=
atile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [node=
ref] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:1075:22: sparse:     expected unsign=
ed short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:1075:22: sparse:     got restricted =
__be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:1089:27: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int volat=
ile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [nodere=
f] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:1089:27: sparse:     expected unsign=
ed int volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:1089:27: sparse:     got restricted =
__be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:1114:30: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned short vol=
atile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [node=
ref] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:1114:30: sparse:     expected unsign=
ed short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:1114:30: sparse:     got restricted =
__be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:1124:30: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned short vol=
atile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [node=
ref] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:1124:30: sparse:     expected unsign=
ed short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:1124:30: sparse:     got restricted =
__be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:1367:27: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int volat=
ile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [nodere=
f] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:1367:27: sparse:     expected unsign=
ed int volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:1367:27: sparse:     got restricted =
__be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:1431:27: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int volat=
ile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [nodere=
f] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:1431:27: sparse:     expected unsign=
ed int volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:1431:27: sparse:     got restricted =
__be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:1490:60: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int const=
 volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [=
noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:1490:60: sparse:     expected unsign=
ed int const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:1490:60: sparse:     got restricted =
__be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:2287:22: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned short vol=
atile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [node=
ref] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:2287:22: sparse:     expected unsign=
ed short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:2287:22: sparse:     got restricted =
__be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:2288:22: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned short vol=
atile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [node=
ref] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:2288:22: sparse:     expected unsign=
ed short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:2288:22: sparse:     got restricted =
__be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:1960:56: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned short con=
st volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16=
 [noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:1960:56: sparse:     expected unsign=
ed short const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:1960:56: sparse:     got restricted =
__be16 [noderef] <asn:2> *
>> drivers/usb/gadget/udc/fsl_qe_udc.c:1978:30: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected unsigned short [us=
ertype] @@     got restricted __le16 [usertype] @@
>> drivers/usb/gadget/udc/fsl_qe_udc.c:1978:30: sparse:     expected unsign=
ed short [usertype]
>> drivers/usb/gadget/udc/fsl_qe_udc.c:1978:30: sparse:     got restricted =
__le16 [usertype]
   drivers/usb/gadget/udc/fsl_qe_udc.c:2174:62: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int const=
 volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [=
noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:2174:62: sparse:     expected unsign=
ed int const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:2174:62: sparse:     got restricted =
__be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:2199:62: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned int const=
 volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [=
noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:2199:62: sparse:     expected unsign=
ed int const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:2199:62: sparse:     got restricted =
__be32 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:2220:31: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned short con=
st volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16=
 [noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:2220:31: sparse:     expected unsign=
ed short const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:2220:31: sparse:     got restricted =
__be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:2221:29: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned short con=
st volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16=
 [noderef] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:2221:29: sparse:     expected unsign=
ed short const volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:2221:29: sparse:     got restricted =
__be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:2223:22: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned short vol=
atile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [node=
ref] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:2223:22: sparse:     expected unsign=
ed short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:2223:22: sparse:     got restricted =
__be16 [noderef] <asn:2> *
>> drivers/usb/gadget/udc/fsl_qe_udc.c:2343:16: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected unsigned int [user=
type] offset @@     got restricted __be32 const [usertype] @@
>> drivers/usb/gadget/udc/fsl_qe_udc.c:2343:16: sparse:     expected unsign=
ed int [usertype] offset
>> drivers/usb/gadget/udc/fsl_qe_udc.c:2343:16: sparse:     got restricted =
__be32 const [usertype]
   drivers/usb/gadget/udc/fsl_qe_udc.c:2390:19: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned short vol=
atile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [node=
ref] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:2390:19: sparse:     expected unsign=
ed short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:2390:19: sparse:     got restricted =
__be16 [noderef] <asn:2> *
   drivers/usb/gadget/udc/fsl_qe_udc.c:2392:19: sparse: sparse: incorrect t=
ype in argument 1 (different base types) @@     expected unsigned short vol=
atile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [node=
ref] <asn:2> * @@
   drivers/usb/gadget/udc/fsl_qe_udc.c:2392:19: sparse:     expected unsign=
ed short volatile [noderef] [usertype] <asn:2> *addr
   drivers/usb/gadget/udc/fsl_qe_udc.c:2392:19: sparse:     got restricted =
__be16 [noderef] <asn:2> *
>> drivers/usb/gadget/udc/fsl_qe_udc.c:837:33: sparse: sparse: non size-pre=
serving integer to pointer cast
   drivers/usb/gadget/udc/fsl_qe_udc.c:965:33: sparse: sparse: non size-pre=
serving integer to pointer cast
   drivers/usb/gadget/udc/fsl_qe_udc.c:1491:25: sparse: sparse: non size-pr=
eserving integer to pointer cast
>> drivers/usb/gadget/udc/fsl_qe_udc.c:2071:28: sparse: sparse: context imb=
alance in 'setup_received_handle' - unexpected unlock

vim +59 drivers/usb/host/fhci-hcd.c

236dd4d18f293e Anton Vorontsov           2009-01-10  56  =

236dd4d18f293e Anton Vorontsov           2009-01-10  57  u16 fhci_get_sof_t=
imer_count(struct fhci_usb *usb)
236dd4d18f293e Anton Vorontsov           2009-01-10  58  {
cf61fdb944534f Guilherme Maciel Ferreira 2012-06-23 @59  	return be16_to_cp=
u(in_be16(&usb->fhci->regs->usb_ussft) / 12);
236dd4d18f293e Anton Vorontsov           2009-01-10  60  }
236dd4d18f293e Anton Vorontsov           2009-01-10  61  =


:::::: The code at line 59 was first introduced by commit
:::::: cf61fdb944534ffa84a824bb8c31a3826cdc169d USB: FHCI: Reusing QUICC En=
gine USB Controller registers from immap_qe.h

:::::: TO: Guilherme Maciel Ferreira <guilherme.maciel.ferreira@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5171810586094176401==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
ZHNm5Y2It9ELbk3Y9ugb5yp7hv4fK5o3t37EAQA=
--===============5171810586094176401==--

