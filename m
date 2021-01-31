Content-Type: multipart/mixed; boundary="===============2358011124104852255=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/usb/host/fhci-hcd.c:59:16: sparse: sparse: cast to restricted __be16
Date: Sun, 31 Jan 2021 20:38:37 +0800
Message-ID: <202101312026.wrol1G79-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2358011124104852255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6642d600b541b81931fb1ab0c041b0d68f77be7e
commit: 5a35435ef4e6e4bd2aabd6706b146b298a9cffe5 soc: fsl: qe: remove PPC32=
 dependency from CONFIG_QUICC_ENGINE
date:   1 year, 2 months ago
config: powerpc-randconfig-s031-20210131 (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-215-g0fb77bb6-dirty
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


"sparse warnings: (new ones prefixed by >>)"
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
   drivers/usb/host/fhci-hub.c:274:21: sparse:     expected unsigned short =
[usertype] val
   drivers/usb/host/fhci-hub.c:274:21: sparse:     got restricted __le16 [u=
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
   drivers/usb/host/fhci-hub.c:276:21: sparse:     got restricted __le16 [u=
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
   drivers/usb/host/fhci-hub.c:281:21: sparse:     got restricted __le16 [u=
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
   drivers/usb/host/fhci-hub.c:283:21: sparse:     got restricted __le16 [u=
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

vim +59 drivers/usb/host/fhci-hcd.c

236dd4d18f293e Anton Vorontsov           2009-01-10  33  =

236dd4d18f293e Anton Vorontsov           2009-01-10  34  void fhci_start_so=
f_timer(struct fhci_hcd *fhci)
236dd4d18f293e Anton Vorontsov           2009-01-10  35  {
236dd4d18f293e Anton Vorontsov           2009-01-10  36  	fhci_dbg(fhci, "-=
> %s\n", __func__);
236dd4d18f293e Anton Vorontsov           2009-01-10  37  =

236dd4d18f293e Anton Vorontsov           2009-01-10  38  	/* clear frame_n =
*/
236dd4d18f293e Anton Vorontsov           2009-01-10 @39  	out_be16(&fhci->p=
ram->frame_num, 0);
236dd4d18f293e Anton Vorontsov           2009-01-10  40  =

cf61fdb944534f Guilherme Maciel Ferreira 2012-06-23  41  	out_be16(&fhci->r=
egs->usb_ussft, 0);
cf61fdb944534f Guilherme Maciel Ferreira 2012-06-23  42  	setbits8(&fhci->r=
egs->usb_usmod, USB_MODE_SFTE);
236dd4d18f293e Anton Vorontsov           2009-01-10  43  =

236dd4d18f293e Anton Vorontsov           2009-01-10  44  	fhci_dbg(fhci, "<=
- %s\n", __func__);
236dd4d18f293e Anton Vorontsov           2009-01-10  45  }
236dd4d18f293e Anton Vorontsov           2009-01-10  46  =

236dd4d18f293e Anton Vorontsov           2009-01-10  47  void fhci_stop_sof=
_timer(struct fhci_hcd *fhci)
236dd4d18f293e Anton Vorontsov           2009-01-10  48  {
236dd4d18f293e Anton Vorontsov           2009-01-10  49  	fhci_dbg(fhci, "-=
> %s\n", __func__);
236dd4d18f293e Anton Vorontsov           2009-01-10  50  =

cf61fdb944534f Guilherme Maciel Ferreira 2012-06-23  51  	clrbits8(&fhci->r=
egs->usb_usmod, USB_MODE_SFTE);
236dd4d18f293e Anton Vorontsov           2009-01-10  52  	gtm_stop_timer16(=
fhci->timer);
236dd4d18f293e Anton Vorontsov           2009-01-10  53  =

236dd4d18f293e Anton Vorontsov           2009-01-10  54  	fhci_dbg(fhci, "<=
- %s\n", __func__);
236dd4d18f293e Anton Vorontsov           2009-01-10  55  }
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

--===============2358011124104852255==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Az6BTwIA
--===============2358011124104852255==--

