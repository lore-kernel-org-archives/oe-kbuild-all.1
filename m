Content-Type: multipart/mixed; boundary="===============6801780860560384880=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/usb/host/fhci-hcd.c:59:16: sparse: sparse: cast to restricted __be16
Date: Sun, 25 Oct 2020 01:09:05 +0800
Message-ID: <202010250157.qnrFo8l0-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6801780860560384880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f11901ed723d1351843771c3a84b03a253bbf8b2
commit: 5a35435ef4e6e4bd2aabd6706b146b298a9cffe5 soc: fsl: qe: remove PPC32=
 dependency from CONFIG_QUICC_ENGINE
date:   11 months ago
config: powerpc64-randconfig-s031-20201024 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-17-g2d3af347-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5a35435ef4e6e4bd2aabd6706b146b298a9cffe5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5a35435ef4e6e4bd2aabd6706b146b298a9cffe5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dpowerpc64 =


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

--===============6801780860560384880==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICI/Lk18AAy5jb25maWcAjDzbcuM2su/5CtXkZbe2kpU9tjPZU34AQZDCiiRoAJQsv7AUjzJx
xWN7ZTmZ+fvTDd4AEJS1dXaP1d1oAI2+A5wff/hxRt4Oz1+3h4f77ePj99mX3dNuvz3sPs9+f3jc
/d8sFrNC6BmLuf4ZiLOHp7dv/355/nu3f7mfXf58+fP8p/392Wy52z/tHmf0+en3hy9vwODh+emH
H3+A//sRgF9fgNf+P7N23E+PyOWnL/f3s3+klP5z9uvPH3+eAy0VRcLTmtKaqxow1987EPyoV0wq
LorrX+cf5/OeNiNF2qPmFosFUTVReZ0KLQZGFoIXGS/YCLUmsqhzsolYXRW84JqTjN+x2CGMuSJR
xk4hFoXSsqJaSDVAubyp10IuB0hU8SzWPGc1u9WGtxJSD3i9kIzEsOhEwP/UmigcbAScmjN7nL3u
Dm8vgxgjKZasqEVRq7y0poZV1qxY1USmdcZzrq8/nuMxdevNSw6za6b07OF19vR8QMbd6ExQknXi
/vAhBK5JZUvcbKxWJNMW/YKsWL1ksmBZnd5xa3lBYMwSUmW6XgilC5Kz6w//eHp+2v3zw7ButSal
vd4BsVErXtIgrhSK39b5TcUqFtgslUKpOme5kJuaaE3oYlhTpVjGo+E3qcBGhp9mh0TSRYOAVYCE
Mo98gJqDBK2Yvb799vr99bD7OhxkygomOTVKoxZibZmFh6kztmJZGE8XtkQREouc8CIEqxecSVz8
ZswrVxwpJxFBtomQlMWtEvMiHbCqJFKxMEfDjUVVmqDp/DjbPX2ePf/uickfZGxoNZJ3h6agqkuQ
UqFVAJkLVVdlTDTrzkQ/fN3tX0PHojldgnUxELx97nd1CbxEzKlZcwsuBGJ4nLGgIhp0QAMXPF3U
kimzK+lIYbQwS60lY3mpgWsRnq4jWImsKjSRm8DULc2ws24QFTBmBEZ/0IqMltW/9fb1z9kBljjb
wnJfD9vD62x7f//89nR4ePriCREG1IQavo1u9Atdcak9dF0QzVchc0V1Macf5hWpGBYrKAObBgod
lAz6VaWJVmG5Ke7C27M4YcdGMpJWMzXWpE6ygB7kCj8gFIAuWbJWDoWGYT4Ilz/mAzvKMnTtuShc
TMHALBVLaZRxpV1cQgpRmegwAoKjIcn12ZWNiYTwORgQmHBGNteXELR7QZqpBY3wbIMSdSXVn/Cy
+cNyLstehsIxOL5cgKsBmwkGMQxLCbhMnujr8/lwDrzQS4hVCfNozj42B6ju/9h9foNkZvb7bnt4
2+9eDbhddADbh5JUiqq0XE5JUtaYEpMDFGINTb2f9RL+nxVPs2XLzUoyzO96LblmEaHLEUbRhZ2U
JITL2sUMCUCi6ogU8ZrHehG0AjBJa2wobjboksdqtBIZ52QETECT74wchmU0mJitOA07sZYCNMi3
Zm8ZTCajGaMyCc4GwSbASQm67GmIJo5nh3wEghi4ldASFowuSwFqhV4cckAr3zTSM8lSd5p2zgKn
EDNwDBRiUUjG0hiVoxUgK5PdSeukzW+SAzclKojBVg4mYy/LAkAEgHN7JQDL7nISWkBc3945g7M7
4f2+cGRMawFxIof8GPMBcy5C5qSgwdzLo1bwh5ddQVoZY05MRczMsdQM81mMD7abO5EMMwad+b/B
BVNmohu4WzhkS+KlpVW+o84hW+WQIVqmrVKmc3DP9ZCaeOfdIgLCSBZgkBmzhzSpa5MWBKM3ujI7
ShvXVuTczswtVxMRyMKSyk6ZkkqzW+8nGLW161LY9IqnBckSS/vM8myASbxsgFo0zq3fF+EiFNpF
XUkvnpN4xWHNrdTCARuYR0RKyGYDTJc4bJNbPqqD1E7q2EONjNDwMAFxNKEe5Zt4+KZosXdr6gEs
Mod11TgMfbZyzE6xm8CKYRSLY9uTG0NAS6r7nHZQEXo2v7C5mFjVlurlbv/78/7r9ul+N2N/7Z4g
WyEQxSjmK5BXWsmJx7yNdSeysVK5vOHSBb2Q1qqsihonbGkIwppA2JiJbbRYrRINpe7SMaeMRBPc
XTIRhUtGGA9TSojQbeUZ5AZEGLgwcaolGKjI/UUM+AWRMRQZcXi+RZUkUHObnADUAYppCBVBqxYJ
z5z6yXglE2Gc43F7ApZOlPRqrBPl/vl+9/r6vIdy4uXleX9o8vh+CCZyy4+qvvr2LZwXWyTzs0mS
T5dHxn9ycS3mYv7NFurFRZgBO5/PA6P7uq60EuKLb98svwgz5zkmo2CWiyl4/fF8QBUCdXjBpFFm
AlHcFvxYlN24VayEzQfLmgjXXsScFM7UNtnH88juK8CiPH+S5wTSqgKCN9fgWcjt9dkvxwigNj87
CxN05vQeI4fO4VdILMPU9eVZXzVA8UGXRk1rVZWl29UyYBiRZCRVYzwW65AGjRHdyS7WDEpk7UjP
CjdEZptxLCRF2yfA8ubsU5//NxmZyLkGw4W0rjZ2ZQfxRgxk0/pdWicxdZWmiqO0Pru6vJx7vR4z
drwBx9c18YFHTDbZCUZ5xaOMeSSqUiWoTQCNS4ipbIvkEXzEx4hVNT7X+B/jfqbIKnBAEVMuW4jD
7XjJ0kkcJ1Rdn4dx8THcCnBDhZY2vVHT53LHgFnDgXBMxSDVdteBuFxxz7wVRw0Gne4aF+Xj9oDR
LOQFFeh814wKuiCu1EXQhbXzpyW30mNCCVi97dpYeTG/DHJeCJ0IEYpBS56Riln1VE4gWbEcxJpk
RaXtaW4xftyaxgpkc70WCohPgQlEpK7mc1eW82+Q6eWlrXWw8rR0ftqJI/60KgUe5QCpmZS//BKC
Xp5ZYirzT/OzTxazJeQRacXsTgMrSQnlBJEEd2V1oWbJfve/t93T/ffZ6/32sWk8DfUI+F+Izzeu
zIeOTmB0x5h/ftzNPu8f/trt+1sOGIBgf4Zxy8+aoRlgQWzG3fZumKc7IoESnDqupAUMUcjXZDv1
e37B65lXe6XYZ4QcK9SBvKvPjAYMtHf1+eU8rKl39cf5JAr4hIL04u76bO754IXExqCt13oB2W+V
dUXbkOE7GFPBBObwqBZrvK5BHc4hiDM/Q2eFcTJt4x/Mr8xGXnpEI+Gvle+oIaxpIGmpLW3PMpaS
rAsw9QqsllluDtzTxdL4Y8+hmhSx7Un13q+9G2rBF71dgIXrEbGpgH2g6c9jyK/vRMEE5KoSg/qg
yXmMl2WY5IXE26Kt5gLMLEmtCeTQkJh+sC9qmtgVzgNDGqgYxXwjUHx0itxLVZE6zgl4Dd55gejt
1dJ3L/a29K6EOaRjklGNwcRJGrELZGteorI6i2hgxYhJdW6v2F6HWRj5/BcWTZ/9WzuIfNgRiU33
QxTW8WdijaqEjRBzDkHM9fwbWKD5z5DugMqIJFFMe+MsDIy798a1N3GQvkl/oI0KjCwXG8Whru0J
5h6BNn2Q8UZ6uM20l6Ensj6vBqdf4bXryDes8L6wLli41d9gV9jbO4Jv7gCbHL1Go6WbUfnUFVvb
/f0fD4fdPbZ+f/q8e4F1Q0U81j8qsaagTjdQNLWd3+OywP3Clk0WFlC8/1Z5WUPdydzukgbJUDi0
DWTYLEsmrnbNfCxJOOVY2VQFyDQtsEVJqZNQGc9WKWaudjUv6ggvX72Fc9gdlguwVv9WdOlnkQ1U
Mh1GNFC8yE68HpzBJ1VBjVeH3EFA+VH8l1G3tWfInNbXcDtrOC6gdh2n5gqEieG79a+BNg64Tc2T
TddbdQlM4YbmVY+uhVVe5yJu78v9/WIWXRPI7k3h1Eq/9WkOnWI3Hsj0atwsfIBjR6rlGVe5f15m
yY7+2FgshVOIoUy2EcjpxrbyaITcXJ/QvLylCz9orhlZYgONYSON0JuKS5/NmoDucRPp8F64e2oQ
WGwbF2owD6dGm4KbkWb/qJMMX2RYxXjz+MNFmwtUz5Is9JQNBS4tfeMI3lQ6Ahdxu8uSUZ5wK90D
VJWBPaAFgjWbhmSAP7tF7SuatwHauRTq9dcMN52rcXd93Do41newWgBmNBXlpstLdObroxlfrKDG
Bgdn3xFlApMMWOwa6hELIfAJCU/b3GEEJ57Bt/2JxgJR0N7Sm9gKAaoNZHJ9G5CO0uAFtEtjqYKH
DGhDzwkDYq1Fm2z0PLC7YTdF1TiyULH66bftKwS9P5uc52X//PuDX8ogWbuUY8swZG1AqbsriK5h
eGSmPq5DGoyPQyAuUnr94cu//uU+6MFXWg2N/bbCAba7orOXx7cvD24RMlDWdEPNIWaoxZtgeLao
IclGGcJ/Jajde9So8M2TrGBd5izOb6e+E+G7PYP953hbYscyc3mgchT73DNlp54xoDYhzwQJJ8ot
VVUco+jiyzEOStL+2ZZbOY0oeXoMjaeFfZdjNNhbWtc5V6p5x9FenNZQiWF7KTi0KsDPgZFv8khM
XPKAJeYd3RIvakIFYOs0zZuJDMK9fX0eoSHaPyFI3TSNeM97IEpRxcHp3rhNiOFaHpwBZlwuCu9m
I5UGgc4zsuEiV7NUgvLbytEhsUgLtWs6PDheoXXmP4AZYbFyCIrU7Kat+UwglpNk6yicXlsC4cJY
KA09M3LIqPBF2jQBE+UdgamPSP9wrtzuDw9ogjP9/WXnOBVYveYmPewqq5B2qFiogdRqLSXcAQ8N
Fm9Ge3X5jVs7tjBMC+w2TgtuH0Q0DwDF8IbE2QXQcdG0RvAuG88lbGgD3XITBW89O3yU3DjKkdzU
3TGM3nUMT++cBfYBRhVWzw4fwhrFUSV4W3RRo9yjbygTDakHrWVuPWocHoMYCbBvu/u3w/a3x515
kjwz140Hq5qKeJHkGnMZ69yyxC2vWiJFJbfftLVgcElOaY9jMUcOymBqQWa1+e7r8/77LN8+bb/s
vgarv7YnZG0YAJBqxqabVOejUgovi02q0NCM8AmBOjW1HZoR8pKxsh9rpcdlBklRqQ1HyFLVdd8w
aptZEXo+2wpaQJNWhVItD5bzVHqvK0xODBlQVFmm3FywQQXF3bc/SxXqA3WPgE3emXM06FheX8x/
7V+hmcdsJd6pQ/K9dG5jKdQchbmsC78lcp+49PC7MtzwuosqKwu9M2Hd7Q51NxWwWDCD0KOiblTt
Rouu+mzurtoy2uocxt1FMVauS7dyyEF9OFbBtjXhRdbKK3dASCgj89LRXnWKT6PAUy9yIpdHM1rN
mtKEOFnktPoPZ2S/Z1xG2ClkRVcHGxsqdoe/n/d/QuYZalWDti1ZqH8BfufW8UK3YO65B4k5sS/P
M2f38PPYgzNEaxF6rHSbSGsi/IV1P+ZmHpRkqbBnNMBKBR21wZn2cNI0PdxRqorqUmQ8GFUNRWOG
gZHYD1Ka01Ci1Mxa9h3X4diwgRRqz+ZWbQo/PBHfxqV5Psfs+tECeuS80Y/hVq1s3lJREuxZAbpv
mELwcup9ji2ACLND1iu6x7XE5g6aqfLmNLxaGuI+g/SJIH2OhGIO8wZDMwKZbuxgyqL0f9fxgpbe
/AiOhNDhTxpaAklkGI+HxUteBpbdoFKJL1vyyrKXBlHrqijs7k9Pb53xBiOBWHK7umnoVpq7oCoO
s0xENQIM07ungWgSPALEQAnhag9CxtbHmwW2am0DjcL7azSYIHCsrrWmZQiMe2/B7mYkWRtE+Gy7
SeCAoEoVIZPDCeHP4bLA8mgdKrJbRj2UVmH4GuZaC+E8BO6RC/jr2CoWSrsKPGA2URZ6O9oTrFhK
VHBosTo2Dh/buTdqPSorA8AVK0QAvGFkEZydZ5DBCh5ykD1NTJttj2Qcp6HziJwUp0tm4DiCatDh
zYEdpTAifIeiCL2p7NChs+9wZo/HFxiH9bjfYBQuHTu8PL64Tn7XH/7evUJa8Pz5g3tceXzpdSZ6
J7m6sl3t6qqNEPi5RRLCmI/rPETzBhmDZR2T2Dflq2nHdDX2TFfTrulq7Jtw9pyX/h643exthk56
sKsxFFk4XtpAlP3CrIPUV85DcoQWMRRKpgzRm5J5yH4uK04BGGLHxOm4UaCDTPHxAvZEYERCc5jT
eMXSqzpbN9O8QwZ5cOiCF2SLX2/iVQMmym4oK3XZhv5k42DMkHKxMT0lyEjy0snegcK/suhBtqdv
P6rd7zBRhgr0sNuPPry1U4GWA8zl9+dGNPAX+L1laAEJyTnUI5ByhLDtQPNd1TG8+dLyGEEmnHg5
JhAqCW0hQS9RmJLIYp+Yz3j6754Gtg0CeEK6f1QiyNX74M2eq/aO30aNlcPGYgtPTeDwW6ZEeQse
0M1j7HDmZ9O1LxzfEdegjROrMfeBo9Voc7MrIEIEkwObxMkebYSiugxjIHfKuGYTKyI5KWIyKZ9E
T62oJ1l8PP84OZ7LoM3bJJEEF441ycQKQYEiLlRdTB2xKiblXZa6nFybIhOdP5cqnPs7p56MZT+Y
v3fUnfEtWFYGa9WxnaZZBRWQK5+CjH4PZ+mCR8tDYE4UOBBJ4qALgboElOd24y1/HC5GI2/7GtC4
zlvT3Hud3T9//e3hafd59vUZG55WC88e6rsAG4XiPoJWTPtzHrb7L7vDa9iFw5DmRVXzovidPXW0
Viw6yrNb7KlsgXxwccc5n7rUxSncsANmPiw6kWnmft8YJBHhJDZEe4qIXEUPMCmYdrp6QZqkCYZH
SbqAenTJhTA2f6K8sGfUXG0dZSpZ807uRK7HbXegg7nfm9k82Tlx2hM1FCqJXI2v3zur/Lo93P9x
xAFo/Gce4li6WXGAyPloMICno09BQ0RZpfT76t8SQ/LDiunT7KiKItrod/2kRe49E5qiMv/AyHtU
R49oIBtp8dEB7pfl04SYwbwzOWSJ5mBOZKjolGk3BIwWx/Hq+Hj8JKkT7LFlnxCuB9rjZ+mXp0ES
SYp02no7qtWJSpad6+MTZqxI9eKd+YycTpsQar13mJ3i+1tKU606nywFqIqkLZiOTepVPEdJ18XE
TX2AePLyIES71O/6tptKeF/Gj2na2HLapJKRLH+PIaPg3U7dMhYcJ9OKiXumEK327lkmaEwj6VSW
MtwdGEiaoPXOtJgpnTZj9bH58r/7GuVYh2Fo2rRJrPPbfDt4fnnlQZuPrWpejuh7TGOCQWRrTPYl
CGLN55l88p7EIvGNd4IM5wnf93hEgX1Y2PE9lrOUkBbYNCFBGATwHdiH8ZOII2tq2b4rH6DjSTj9
asnM586+UqyU97Nrz9qTrNTkP8DRYKFMax+bnrfvZTCYHPbbp1f8yAlfLB6e758fZ4/P28+z37aP
26d7vEUOfM7XMGyaDeHrDZuiikt//Q2CeMHaxjWI4Iwk/A+r2CS+qxr2+9o9wBnS0WaglOP51jIc
DxpsNqGGODCjY26JOMJMrEKduXaiKKO+lBAmfWC88CFqBMnHNCz2QcVNV1oboanFtNxArXvN+mSN
yY+MyZsxvIjZrauO25eXx4d74yZnf+weX8xYT1RF4tZN7ej/HOnoDg2NmCWSmCb1hdMhaQLWGK5N
V2QMj/Gtlw/EtmjT4/WbpUg61XmSDL+5GJEMBNi9wZYXvoK1LyBbVNvycoF+jw5EBxheTjZ0GgJY
fd/O8RF9f91jCijwuEU68anmsZNpj+6vq9MObzikq4lDugodkgscxH01Ojz/2uvKFpq7c4Nqi9fw
EweLglX86mLEuMGhPk6gRKmnZ12EnlY5FLib5t/xmuDv+gILYR12EK0nEEqOOU5w6hsheBpT2FBX
sp/Q1zgXL8l6xLXpLPmcRj2WCTdtExdl+P37cV0O+qGrztXGjD7tDidYAhAWpn9Vp5JE+FmukHby
+R6jiaY8j1P33+UZHVxX7XcA89qCDg84mm3gnQalPH6dvlj7f86upLmRHFf/FZ0muiOmprRYtnzo
A5WLxFJuTqYW1yXDXVZ1O9rtqrBd09P//gFkLgQTVM6bQy0CwCW5giDxocmqRrH5UG9h5RZsg3tL
6+vS+LtuH7784Xh+tNkzFbCzdzKwVbaA3jbg7xoxLPL1pyBjgW+0RHv9rx8C6XtSvIof5sTIqa3g
MWK8KVwgS1t+rAaXSrZHgSncea9ThuwTEFkQ5Qh/12kEiVFT9CSog/K+sIFxNZG+GxJVSn7UQWKf
MloKwoXKIHU4iaDOakhLi5x7f4OsdTm/Xl3RLAwNhoU7cRpbTJc3/ubQMGz2YUHTk4OfJkSVtdam
VOswk5nJ2/gZ4rRVrrUBSUyKA7RMvZrOZ+TBe0+tN4eS6zVLIj3Y995m9bIza9Yz88CEaxBb/YUf
c9pRIuHMSqf50kokCgJeVWxhTvDnteskPxYi45ejKIrwk5asoqanwbZ/ZXD34/zjDAvGx+bRP4Fu
baTrYG25obbEbbV2O0eTY+Wxf2i2qFx7jyYXJQsK17K1rY2pQzm4+NFkFXPgYD2XyamK7hIuq2rt
Nc01TeO5pm/4UXU5fSVGPn3j+cZQ+U2VWgD+tV0QunRlOSSmd1iLIV3t1jwj2Oa7aEi+45oWURnZ
to3vDO9yA4udx7rV5MGMzG08JBbSNd8ZcuLZ1bv2GsLDmd35+eHt7elrcw6kcyZIXJsdkszJyPMt
yK8Cc9hkkuplx3M4a0Ri3s+rZe8X8wtFl+pALfEd9XpIjhONUD4oIhjcoAyboGDf9lgZO4+jNF3r
7Q6gJvIizbhYoPBdX5rRI+3ngGFgeemFmUJA1xwx7y2FE9YvoR3NOFr7Xw/Tftdn0UPiSdjTs4Al
p/RRip2RBaTu4TJtYYlo9EVPclTAHS+XTiwvouygjtLpjHaTHTgHHHjPAOM+x8lTxgDmOmtepNDs
0iJxnq8jpd4o4p+haTi9eBcefYZR5Apqq7wXMLVpBOfJGZFIFniIQ7P8JakscHHIG2bjSIkyno3D
khi4J2gN5oQuWvc1RXZd0+0PAU8/sbdqGgq1KiORNm6jv1Cfnsn7+e3dOcLo2u6qTZR5Wjgs86KG
LpXOIXGQp8OwHYh67TGF87HetBrP0S9/nN8n5cPj07fOfmxd9AujhPW6GvyGOZkKxPdkUeihxmVu
ba2lcQ4xoD+nf82Xk5em3o/nfz99aeG+qLvnTno8qa8L/iHHuriLEJ6Dzs97BK1D2I845PAJLIFt
eGKSQh+ytWjYUcGpzfeCIB9d/OZuWNoAmPCD2j6QsLZduZCwcQQ+zW4Xt21DA2ESmqLCrnkt4cOg
wMPJkPq5BESVBB49Grm+KWp4GrxQO5M5Pdnerw2r2PWLvYIjum0UloRSxrjIkQ5riXVVsW7WkE0W
FTTfDB1Eg4F5q2WZiwiGu5Vh4RS+5YfrGp9f8dVJIhvgY1110EROzswp0yB7Pf84v3/79v77hXmE
FQvkutorHui35atQ8jcbRmAvPDdjTfognU8X7AQz/ELMpifagkCNoVYu8bDVjuN2AWl54HVg5FW7
S1UH9rDqLSCZr/m6lS+GzaC00VRbyuDurmdo7KU6yT2rVyfot5eVp50H0QIS7wIWIM7ZcBoyOv+V
e3IRcJQIPkTvzIN4gwfi2WCAdYyX8/nxbfL+bfLrGVoPX4Q9otP3JBWBFuiXlpaCl/3tPe6pATTr
64C343+Tn81yYaL3rLqdI95Jexc2v52J0xBlVuyrAZXiRuJeelu4v3tcArIj35pQDV4d5Ja1OXYr
oOQ0+SAq8EGONepbCvrkwMLVQn/3GbV8BDuylW72mok+34nRuraRleBuGZCb0bnWkGrvbEcBmJ+D
gZKdH14n8dP5GXHP//zzx0t7/fcTpPi5mV/248EYcYMLt2wg1XLOPz0P6iJbLiyDWkeqySrSkyEn
twBkzAefZwngUkPzQsqwBE1lCkCwPWhA5yNoA58KlPFUQC3iY5ktaWkNsSuwU/L+q1ZvcyqUaDBr
yTCWMbc9td5BxOTZ0Dyn1FD1YOANCVRtGMCJe87QwURSGwsmFjLJDwOssqDRs1ulxqfQNFjUllOX
QQ8iJPdHE6ZLUeIgjAEQI3wYYnAbeusjkIXnqZnmKQrlSZh1UV1gro9M62LdKICzIbABx5CH0HI7
t8reU67+9Gq/pnkIN5wCFJdz7kLIgfOWK1wIOF6xH9pAyqLUYDVB2pdvL++v354xkhCj1WDecQV/
zzxYuyigwSsbLAl/Yxs06EEdwvPb028vx4fXs66Ofgqmukc0dgbhkY4VIOiih1Rb+WxpRSIYSaR6
MtEsJ6c6hT2BgPNcqr5pyIfHM0asAO7Zauw366WQXXAgwiiz8R1tKlfTlsV8n81qk9I+IRIRj0Ez
/gEdUBE/nLqhFr08fv/29EI/GfFONTSxO6Rbem1o7OWPloOVq9PlrZp0pXXlv/319P7ld37E27Pz
2FhPqihwM/Vn0ecQiDKkH5MGkrssQkGz2DVV/PDl4fVx8uvr0+Nv9iZ+H2WVZbHTP+uc3OsYGsy/
nDN8GW4lhylg0qITLLcxNYlytZVrcvtVikI6J4EemvbpS7NpTHIXjGhv4AfNS/H+cwi5RggMC9sZ
TrVVWlBbYEurU3SW5G93K/T0Si7EJNRlxrJMj6I06LLh4IPip9c//8KZjW/87HdZ8VHD5ZETQEvS
gDkhxnPrmQahui3N+rw+lUZMdZuGZcMWbqL42G3SS/LgeM0Qdr+oOxkgEiritbVoVNZJTAPp8TyH
avWQtkiU8uDZtzuTRenxrjYCOK2bbGqDec6tAWl9l6t6t8dgs+6hXucg1H0WtPlohF8mGyt+iw6U
puWsU060IV5U5nejKFLacTYgpal9OGrT2nFIEUtcbWF06KET26MAWbFepltIYooVOZxyHRx5fx4g
6OCuwgr/ZC5qU5kHTJynTca6dacVWfHgp275oSWlx7L7/vD65poiKwSivdEoeJ5SbKRA2zCPrDzm
qNCiiG5ziWWcyzQcmcYv+zCjdSJZaLBqHTaJh/cbyCMubZ4l92QrGTSDboc9/HeSGg9QHduqwvfG
z+askTz8TbYqLGmd7GASOZ/lgLDFFTloVfTyCn7XJacGS1e0jEPMizOKKBKaRqW1k1T3Tl54ADuB
2eEewvA3lxKDkVOK9GOZpx/j54c32IB/f/o+3L31AImlW/SnKIwC37xHAYxq0c53khIy03dODUC+
JzlO5rXIdrWOY1nPaHc43PlF7hXlYvlyxtDmDC2rogR2miFHpHBiDId02CXFkLqvZOLME5E6hNwh
iLVqHf/aoKr+7jLghQ/fv+OlSUPURi4t9fAFY1o5fWrgeVuAO2e8I+IxWZstYgPPzPPakAErGjHA
FkkiK9K7zcA+0132y9wZyo1Azp3cbQE0mBlcQVo5+/CMBN2v9QERwkt3fKLeDi3N7vVjLWyCzJ6f
v35AbfZBe59DnpeuirDENFguuYdtyFTJYKgU2wEJ/rg0ROeu8grDOKAB0wZabLhRqTGNkTubr+zs
9HI3NzuQOVE+vf3xIX/5EODH+gwZmDLMg41l51ob109QGFIrsklPrX656lt3vOHskjKhI5mVgwUG
VjzkedpTJ4uCAI8kWwFKhO2l5RGgIHlm+h61oFu2nXhNL8zNivvw10fYnh7gmPM80bX8aiZzfwak
7akzhAOlSCRTTcMYjm/NzMI4YMiBiAdNphnpSXLWy45PrdEdGecLBoJl82wOw4N2SJ/evjAfin8p
yWflO4j1jSHVLs+CrSzY9D3b7EsXAYUvJAp1eLLpJdH1utKxnNvZkxSQavIP8+8cDqXp5E+DtMlu
t1qMtvQdYltZ+2kzY8Yzpg2xX3OmW+Rs7+EYRNBdQztGVU7CLYNWiCcDTyAS4CIkLkJ12xk0iKgs
a5evPxFCeJ+JVJIKdE1v04i+D7+J+xwG2orgkHdADch+LmcYeBFBaGjDJVGZTZwEDFDYBQwErYq6
BfsINX1j3FKhOpK90eiTOQ+XLIbaQydJhidOq9XN7TVXIKzs3FvRlo3RMO1LwgZk3M6pxR3P9kmC
P/jrykYo9kSGEqX0uDW0KdF4phRuZbJYzE8nVvjzYGd2ctk7YdAGAgkozRcFwnLNf0PXDiN8dVpd
5Ps+IQhLfLOxq4Lw4LlCRRsVHrgjT2j3JjqgulfCA4LbvLYa68axNijVaWh2zg5pNLQzI3WwT3dt
eUg9eEiY6hKAqxbYHulTMaTFYg1bBX2jiXT3OpSkCZxMjJMNS9QjiOeUJBqZzfEUAHR/bi0qZ3th
Zrdut4kOryfh1KDyUqEj7yI5TOd24KNwOV+e6rCwYzpZRGp6Cfdpek9X2GIrsso+qFQyTp1IWJp0
czpZRyzojtvFXF1NLRqoBUmu9mWES6J+ZmP32LaoZcI9gBNFqG5X07lwUGZVMr+dThdMCsOakxiI
bRtVwFt6giG2Muvt7OaGC3zYCugq3dovRLZpcL1YWufJUM2uV8S4rJxVoG1g20jvGt7a2R3GEauo
IbhjWSnyEqw4FBgul19w5q7PuEHsj0DPSId3KYYOi9DcOlE3RBNZzS64YaTidL26WTLVbQRuF8Hp
epAfnALr1e22iNRpwIui2XR6ZU8Np8adCW59M5sOlh5D9V0lWtxaKLVPuzB+um2q838e3iby5e39
9cefOlz62+8Pr3BY6b3Yn+HwMnmEqfn0Hf9rH/YqtA+wB8v/IV9uvtMJLPDll8AjedGF2pAv73Dy
ANUKtMbX8/PDO8bjc3v6kBcU6f9gr1EmsF7ZRidp/Q4vZGyNimDLzWo9dEUCXeWcZdoh3ZB7ZbZj
+N6GbcVaZKIWkm1vsnR201bH3rIRrsyPJrjw+eHtDLnAwffbF91J2ob48enxjH/+9fr2ru0B6DT+
8enl67fJt5cJKj1aFbcWaKDVpxh28TR3ykK0D2qLQSLs+oUTjkRHmAGWEvYlFlI2ofu7FhTWpacW
/CvkThGKkp3kn09adQguBbIBPhTjfiRGiZR5QO2ZyNEGcuatILYimlmA0I6pj7/++O3r03/sdu0U
yf5AOqyOvhOI465XA2nnztwgW2nJ0DS/cVzCTKlNyNVBgXkc69DMQ05zNcIkgQXnej7zVn4QmgZ5
IgquQWVmGImcLU8LhpGGN1dciiANr68YelXKOKH+Ky1rW1SL6+uLA+UTLAxlfnkwFVKyjzDb769W
s5s50y7Vaj5bcPXSnEtZZmp1czVbDvMswmA+hQbFAHVczh0/i/wBmPRZ4HDccSbuji9lKojTc8tI
VvNgNl1ypaskuJ1GtMUHvZWC0sMlPkgBOZ8856sufbC6DqZTzihJx2M7kTCqVmutG8whHXIrza1p
UAqJS1BVWmsdStFfNLqvpmRDjFNN9y0dul5NhSbvf38/T36CPfSPf07eH76f/zkJwg+gOfw8nO6K
9HuwLQ3VHytLs7l3jV1ay87Y0YKt832dWjz4wgANpiJjb/G0QJJvNk7IME1X+KBd39fyrVO1Ksab
02OqkFwfwaGlI9OSpP5b83yVVEKxeSI9kWslhrmaJPxT1k5A6yQq5RwajExZWJVuDc7O5zv5JvlR
P+n1lxxuWe2CmwydUkZ3YzzSNyFITABc7gNQqNDPARrw8P7B0F9P77+D/MsH2NQmL6CR/Ps8eQJV
7PXrwxeie+pMxJZ9u9nxmL1Tk4PoQGuNxLu8lHd822B+Eo4dM9iVvOXhUx2dkzUUdHBzmcyv3DbC
z2NvOnk7RQdyy6LXx3salNb8xvE+oNkH91ZMqAFNvxPfkHuUhuOoOQ21matDTSeKoslscXs1+Sl+
ej0f4c/PHP5VLMsIX8NzH9ew6ixX5IL8Yt5Wi6IrID5Ral53eOAeG98Yy3TRtDfZdPIs9PkVavMC
y4nudDxwPxQi9IqXVUUe8xp8FyICsDxZeFmHk4+DKtyBt15tPDiFUAcVeeuOK3zuYhi17GrdtDo/
3vd8HYFeH3TP6DjonswPPntiYy30IRVkSerR6UQZZCz6IsJUNOOKTvH0woBAri+QSQOd4Z7zLG6U
+Xk4WYz/iVfks/A8d0YmrHF44+3ly7C6uZkv514Bka6FUiLM/XlsYZ397GtnLIPfGvXnwXycT6d8
r+u8/SwYivlQnwqf3t5fn379gcd7ZR5uCiuoLrnibp/z/pdJOjMPOkKSixwcwIcog0aqF0FOrgcP
eVlFvC5b3RfbPPd5pTb5iVAU7ZvU9uMNST9liPk11s5gE9E1L6pmC/bUYSdKRIAXhAHxPVaJDHJf
iI8+aRXRaBgiiHwWvsYCVKmxj0jFZ8fnumcRTRh+rmazmfcGosB570UjaPOEBT6rpOALLAOejsMi
d1aNxDezEh6iCBm+IZ/MfI041pt70NuofqQpdbZeraac6dhKbEJR0EG9vuLRINZBipuO5xCSnfjG
CHyjo5KbPFt4M+NnlbpXVZR6wUYhoQ+Tof/gwMDIW4nYm5k+zeAFP+Ed5D7lWdsoUdQ3riHVFT8+
OjbfLB2b75+ezWJp2jWDoxKplzuFmSSIWZuRYbaJUtCyuwWTV7P4fdjKOIxc3GxQGxJv+ME2lXsM
D5M5f6eo9lkoMh/kf5tflO5d81I0H6179Nl972EodVYgskgGq3NqYsuP5YRhi9F5igzMWCV1cQeH
DI+TLvJPGwNd5hHZBwH0k2e13EiRxcID8d7WbJPnG1qtjQ+5oE2y3YtjJNk5IVfz5enEs9ZkFYKf
CMIyMiz1UzrSATN2yUPy1JXzaCZyw9v0gX7gj4Hy5EsCDE8hyPFld+WrGTB8aTw37nE6m3qAqzf8
uvzJB/ndtnkqykNEEXPSw/XV4nTy7svpwTtC1W7D11zt7kc28hRqIbKcTNs0OV3VEa+uAm85OJTb
XHW8yI65V9V2fWRQ0tG4U6vVFb8vIms5g2x5A89OfYakJ9fJjy80d5chaJabKxZUwE2pYBFnp2N6
T30S8fds6umrOBJJNlJcJqqmsH6xNyT+dKdWi9V8RH1BILJSUoVUzT0j7XBiIQFpdmWe5Sl19I1H
9qKMfpOENTn6/63+qwW1lmfRfDfe89lBhpLsyNpzN4z4Fyt9wnxHagzy+cgya8Jmw5dsZOY8lQDl
HUYf2+D3EXoaxXLkEFREmRLwP3YY3iX5RhIN4S4RC98Fwl3iVTchz1OU1T72HfsS067IHm+IKW7K
XSBuYBvxO/3faaAbZxfruGU6OjLKkHx7eT29GpkSGPeiiohutJotbj32C2RVOT9fytXs+nasMBgO
QrE9VyKiVsmylEhBLaN3BbgfuvsHkzKK7vgs8wTOy/CHXl14THUKEROwP0eGppIJxfVRwe18uuAu
pkgqeo0g1a3H1xpYs9uRDlWpImMgKmTg891G2dvZzHN2QubV2JKq8gC9dk68AURVetcgn1elqIKO
d90+owtHUdynkfDcb8Dw8DylDBB4zGNUy6QnbFNXifssL+AQSY4Ox6A+JZtRXbOKtnvqcWsoI6lo
ClkHBagZGMhVee52KsfkO8zzQJd9+FmXW+lxjUUu6GvQrSy2k5XtUX7OKDKtodTHpW/AdQKLMUuD
eT5mZ948KMPlEcN1svk3MuIk/ctoI5Mk0B8+mTgM+REDipPnIQpqrA0GF29r2t4nklf7i8QTU6Yo
eLriD7x7tW4w7AYma2QFouK/Fpk7OIN5tHFkFxj4e8/77yG/rJLVzPM2sefzqi3yUQNdeXZp5MMf
n80A2VvlOc8CTxZbfrE5Oot1C9hUH1kgbhTvDbGp2TQ5Hg0TBj8vgBcBd+nT3WimqR0Az2ZZNjmG
29puGFZ7GPawSiXJ4QQvrYVnnJZSpSzKs51pfxDkmIho7m3TUtBQ0YTXaTAc036lYTNsGA2bXnnk
P9+HtuJis7R9OMqy7nnJ8SkVpwleWT6f394m69dvD4+/Prw8Em/sbtDhbaycX02n6fB5YHMpMZqh
lZ/vZjA9oa3bp+uiE7HkN1B9hdmABvGWARWyG9CB4msf0rpwXvI3jzy//3j3vsZxsMb0TweVzNDi
GN1mEuJzYzgIL+p4iRiG0ihuu1SwIZm0SCqqUp52xru0c9F+xrbvHi6Q/myS5XsV+a4/jcin/J6P
B27Y0cFU2SEayDKr3XzujSbBLrpvn/T1poKGBosYvx1YAsVyueL9QxwhTvHvRardmq/CXTWbenYN
InMzKjOfXY/IhA0wb3m9Wl6WTHY7j0dJJ4LuheMSeuhFI1lVgbi+mvEvEm2h1dVspCvMYB35tnS1
mPPLAJFZjMjAgnSzWN6OCAW8xtALFOVszl9udDJZdKw8F8qdDMI+oylupDhV5UdxFPy9fS+1z0b7
P4cVgb9WsbpsAfNipDuqdF5X+T7YAmVE8phcTRcjY/xUjdY8EAWc+EaqlVaglKSSjdjWL3D98qR/
1oUiXiMdsRaJD/qhE1nfs66t/8fZlzU5jvMI/hU/TXTHfr2twzo8G/0gS7LNSl0lykfWi8Nd6a7O
mDxqMrNmuvfXD0Hq4AHKvftQlZkAeAoEARIERjyc67CfTYO3wAy1pOlIikZoMKmYcas8GZhI0vum
1YJ2Tkie+oc/d7kxmrwAlcASEF7qTw4qmOWISWqWMwgaA3si2tQp6EGyj6bUUKnF1BMo832nRsCM
7iLnzVvbXqdlsIqWeqvpfdIkZoswMZbAk4LgQE+nU4KU1CWuOpDxw2qRInW07QHGuCdD0lTLBQgn
4bnN0JydAg1zRdM2zyUHBQkIrr9N3nZEdkaT8XHclHEov8+SsUkWxdFKOSEwsJbpVQlTS/2t63iu
PokKBRgi5xK9N1fo9mz3I6eUtHhL673nOq4/g/Ss44Tri7rKzyStYt+yKSr093HalVvXxc4cVMKu
o43+RNAkUB4umfil4VqI0dgil8q0WbJyfHyf0cksxrVCBsugxfUWmW6XlA3dEcvNlkyZ5+h5lkKy
TYrEws4C14shC8kp9bW7WBm92X8iHcVO8WSqbV1nxNKHHclyOcijjCMF8UQ0bbRxGtL7KMTVF6X5
ffXlH8zlXbfxXC+6NZ9FYhEteVHjiGMC9wrH2JGftJoEVq5mup7rxrbCTMkLZr5QWVLXxY4GFKK8
2CT0XJJmaa3H2IZQMlKewn1x7tDUTwphlZ+IZcLKu8j1bB1hqqYRdxD7GhmzSbvg5IR4G/z3FsI1
2Brivx/R6zCFDOI7+X5wgkFbO81F8Y2ajlkXR6eTnRGOzDBwrcuBnzHWZVNT7XgWZRrXj2KL+Oe/
k86zbQ9snFxmWL4eQ3uOc5oR44LCymoCfWshtuW5s2zilBR5klnFBqH/YI+mnev5nqX+rtyoYfkU
7L5Fb/0UmlMcBkvL7DQ0DJzIIi+/5F3oeZYv84VfKVt3vrog65acD5vgVv/aelf2aoBvq458psEJ
8yLoTRRC5TTQHDZoV+e6YrYOirUhmXLlyk8NZaiuMPU4rioxe8umQAuydZm4gWMc9fgnh01A16ne
Cv3QaHk+sKmETKYzR1eneOUF42j0OgC9iuBirZsz9MRCPTfHduyNSlAm8TJwzAa2jYc5Sg5IiOvB
Nl4tQ/KEzHLIyGY5cZzI+DTMECVMPELk0C7HvIPGUzLaQB4YTmf25+7UfcIOuIbjxWPelkmX6zNz
n2un1gKclq6z0oFtvhWJafvvYeK7vf0bJKfGY3zbqPf4vUUizg2mwnPGTU9rTKpOBX4Fgkrvyn44
sNWqbpKiZDv8P+lFkzL5EPqM50pMsRuJ4kA2O3vwsZzYysCgPeZs1NZd0t7Dg8Y6w1hSaNhiLc10
XWyQZ9RPYBAYp8LH5AgH44KElGziUvtcpGWi68gKwrLb9JVnObPUIXQf+22dGPOWtQcPJKbgS+Nw
naPDYB4d2dAtBDFgBpWVs2kHx1CuLpLbkphGFgfiQ+UoWq61GjaOb0J01YLDvawPXaHTu64B8XSI
7xiQpdHxDXp/1qOC4dB/d3l74PGbya/1Qn8Gq/YbiQemUfA/zyR2lp4OZP+rgcIEuElacZSvQlMi
jv4UKNvrtQNBAW8TzC9S4Pq7+VNDz0iN/QMRBMNAEH7JKNCmaD3NGoGKA3sZvtfma5uUeT8r45gG
2LmiQRAjAxsJiqVZEziSu86di9a4YcqIZlz294EYF0yhTZDrNHFD9efl7fIV8psbYZi6TtEQDphx
s6/IaRWfm+5eWsYilI4VyNYos5R+84JQ5YKkgDTbIkh7ix9YV/WX2ubred5S/K6Sx8dmCnaFH+E1
bA3kTdKwXfZwXt/DaanlupSHj8OzmxUZj/+y72oIuD6NOssPIm7fWAmD3GkR3vqYq2+PlycznGI/
Mzz0YCrLwh4Re7KeKAFZS02b84jUQ6Rifd0NlBu42seS+slEqXjbaWlLCXMgIZRgHzIiP8nbioyp
Wu4MSX9bYtiW8Q4p85EEHVB+6vIqs1yyyYQJbXI2PwdLTiJlkmhhm78MD6GhdLvz4tjiUyfIIFB5
/3bdYI7q9eUXqIZBOJfwWBDIo+q+KhiN7g6lUqhmsASUPrNe6yfL+urRlGyI5TFxT/F5FkvTtDpZ
XJsGCjckNLLcU/VE/X7wqUu2VpdalfQWWb//sO3nZoWtxVVUoNsGP47t0fAUp2hutcGpSAWRbG6R
puCDyXM4kC1hdrb+QncMWqxIHo0pyrRr9TxuPQrifyg3ZhKcl2KyUt8aGQg8g6oOEzccIWvpRYPx
Y9PYvCh2h/S8z9a4W1X/FDydeaNOmGLJFKMqK9AEbwy97t35hDfUJpGf9O2OTI+pMtnragRBYCxQ
HLTdYMKL3qEuM0pcbLh9I4pnF0RyFt59Ewz8hzgc8gDATjtMf8r+NXgHZTCnI1Q/LhNQk4wp2KM3
2vSpJSRjWFLlFgtPJqz2h7pDTSWg0jzeAHRg/YYLtNO92S3a+f6XRg72p2O0eJH5QVVw2dIv7hUW
HyA82CsC7sMMD1mSDO1KUvD7aW/3kLitwSw5hQSSR4z5ZYSzDzNrTN8oeUAwo/zyHoIvK6YgQ4gg
+BibA3LHSinORgxY7k9D2+WPp4/H70/Xv9jYoB88rDrWGSYU10KN5jnS80qOFdVXqomXCSoaVHoN
iKJLl76DRY8aKJo0WQVLFyssUH/NFSYViC+zQ22+VYFZrtIbjZXFKW2KDJW7s1OoVtXn+AH90tLv
4TJ/ZIzk6dvr2+PHn8/v2ucotvWadOo4ANikGwyYyPysVTw2NtoekEdm4oI+QN2CdY7B/3x9/7iR
WE40S9zAx+JtjtjQ13uqxYjjwDKLglD/KP3rf0vtRLnQ4hAlwBVAIMjbUgVV/ITb04D8aRVj4r0K
p4QZhavAAIa+o3cWXn2E6GE2Qx7k6AM9oGlrRTj8/f5xfV78Dsl9+nwPPz2zr/D09+L6/Pv14eH6
sPi1p/qFqZgQQ/Bn/XukINYsjhZiDVCyrXjCLHW30JBYlH2NxJbRXK9JiWLIcKb44AJnkzDzv08J
LB/S8O+6Ls9EfRQG4Lu81JarvKAbTbTW3L1MY480QWJQia9ZijgdEmx80SDi1v7FtooXposx1K9i
0VweLt8/sJx0fE5IDa4ze13kTxHdlcENEdMLOP+xjLGt13W32X/5cq6ZQq/X0CU1PTOTFleegIBU
97o/DR9a/fGnEHP9uCSeVMe0oUSXOKh00VZKt1/bJCMwlfYlANQH4zXZEQLnWp/wTiQgHm+QrPXH
EdKg9KhqxJc+YgqZhhmkT3skaShHFTyp/JYXKLQpMWeMnewCz/5QtARxqEiJltNjAj89QoBfWVBA
FaAyYEp9oyYxZXaU/elD1TVAYbAPwPpmkRSZrMq0IPBO9o6r2Xp7PZIf0uA9HEiQlSNhdSk4du0b
ZFy7fLy+mbtf17COv379Dx2R8zzei/4FEPiOV3l3rNs7/q4LhkG7pITERpD4G4L2shXExMEDzxDG
ZASv9f1/y3GKzMbGIeoqzZDYrkdAquB9I+fiJZVQvkx60Gs2e1asP1KSmmC/4U0IhHQIBsujbxs/
lev7lVA/8rBbupEArrkUr7ARU2KCfMCWaeP51ImxkpTNeoFtRCPByQ1kd7wR3pWbE1ajuOmaqbFO
80KOaT92ExT+xISndBkVfmBBxDbEyrEhPKzb+ec94dfzeyzUOywHJZl6D2AbL+0g6QHbaUqmagau
N1DUG22zHoqQ9rMegEAwiUXz4Bs8vacbqtZlhiXmUO6Z7kzWi0gx83z5/p2pQLwJYzPi5SDCsJan
UWTo4kdHygk9N3HMZEEqQXZMGtzZlKPhUNQ22E0HPxzXMVodFxpyfKjQtf3cq8V3xRFbKGLe1nFI
Za8PMe9JmQSZx9ikXu91HKkN8nuaqh4LHGymflZmuMzOmz662GAw2b/aqPJy6PWv70ygml+zf7ti
9KSHAxPav02SVfjppJhbSA1tn0bOfg7GlJ4+Wz20T1uhtsJtVzQmR4+G+2+9wq4hqRf3fCNpINpU
iYWxyW5MIY/kl2hNiJtwDfgpqb6cOzV4KEeYSraKLxp/tcQSYfTYOPJPRqVCUNorNSWwim/ToAti
a6v9ww1jamkYrFS3QIEwH2ZoaPCW0GobPek04Gql5IpAvtEYCd74dmq31p3tPW3PP+QMSZzPLna2
MpDkgkY+VhMzmKW+13sCSsmxsa6ChYB0tS+FYPWPXad3e+yB3lE58jm6cNpraGzuL//92FsT5YXZ
vupEsUJCveZPp2pssU0kGfWWatwVFRfjJ/4ykXvEBPZEoe6XE5xuFUMJGZQ8WPp0UVI4sHqEFQSR
10qlfgGnSr6xEQyDcgIbItZmQkbxlLeQoRof7USqhsJXa8H4UqHwrIVjB3/hpxRHl6xK4VoG79u7
7fvntMUsD5XKOntM17xROIodvFtRbOlvnKu+rirOjdS5UpmsZyZJXwR3t3NyQDVcjoM0dqpZNYFn
lHyJSF0HOgZ+5YlbUYqiS71V4NnaL7vQ9v5RJuubuNHPUdux4gSo3ki2Upvz3NBqPpWeGsVBLq0S
R4kG6b5pinscKlRrczZ6LM9Jho0ySwShst31ymeSped10jHJhPlHDH6nQ/GB6YRrHEiFfWOAjbZ4
3nYORZroG0ceS8HBxBb4k6l5TqjsEEOhJO3i1TLA/BsHElhMobTKZHjsYJWK5YeylUKC7xEDSZFv
mWFwwDSTgYSuqTlaARyrE8HEOHimpvVnLzqdTthoepT1iZJOt8s+z80mPGLCZlPTJAcvVpVvAMr0
9c0+L87bZL/NsQ7DC5UIj3WlkXhmPzjGk7WxATP4w5aJGldrmPeB/5BmB5LBmdWsvD0FLlYpoQ10
dKZOvsIcHytsV0YHCtCpvcjkIVXmTk1xVjIRReeHgWvCs7zjR/B8VpdhEGJ1cs9zrPuMoZZugKut
Cg0aBUum8AJkjICI5JMUCcFUfgfrEi3X/jKa7ZF4MIF2afjYnHPF3rREpVLbBY7lzf3QTNsxsYVd
lg0E+5S6jiNxuJZxkv95PhDlZYoA9kfhOzWukHBIEnk6EG+1PqNgFi1dRb9QMJhP5ERQwntTaRtU
EIENEdoQKwvCx9tYeUs002KSdazns2kUOQVaK0OEngUR2ZtD0w6OFExrcpA6aRqF6PxxXze0re7U
YFeiAz6jIZ59ErJCerMlhYu8JioHLAnuIH3ATPlNFPhRQM3BDE9QLDVvOmYj7buky9E8Pj3Vtgjc
mJZm7QzhObTEat4yJQBTEyQ88qH7+8jKxOzILnR95DsSOJpT1+qA+pQuPaxvbJdsXQ+NzjflWKxy
JV3XiOBiCFldAhFZEfrzBAWNyj+Jggl2hFMB4bl4X5aeh8wvR1h6v/RCZHoFAmkc9qjQCZG6OMZd
YYPlqHBOrAHFCplFSC+KLleO8BHhxRFLZBI4IkDGyhGWxn03WmFF0sYXUtgYa5eGAf78fCycVxvP
XZep1ZQYv0IZ+ijzlBG+70kEc7KRoTGOLaMYg8YYf5TyS1QJGuD9jbGnoRMam2MGxVi5XKENM/vV
X1oQS/RDCdTcNFVdKg6ACFU8JEZ82jHbBukkIFYOusFXTVrafXR7QQUH1Sts42hKzaO0L6DHKpF3
cm+WFdbMRmg2OVYYnEDSzcYSh2akqmizZyp4Q5u5zYS0fuDhK4ahYiecXzOkbWiw1N926ES0CGO2
8d1YGh6zLvDYUYpwjvAoGRKNH7tzU9uLSoQrGcZzogCdDSF04hsV+8vlEhdlcahe4Yw8csqZeJ7b
cJhOvmTWHsLPDBP4YYRI232arRwH6QkgPAzxpWC9QODw2BBVAeiuc1GpwhCz2hXD+39ZCqbznNR7
oc1UnjMVa+mg0pmhPNeZF9CMJjx6aP7NsQ8lTZdR6WJSkHYdjTDdgJZliG3OTBF0vTiLXUTCJxmN
Yg9DsE7G2OZLqsRzEG4AuJx7QoL7HlZRl0aolOx2ZYo+eB8JysZ1UC2PY7DjIIUAGS2DKwnsZTja
97IJXGQvOpAkjMME69uhiz1/nvOOsR9FPpa5XKaI3cxsGBArFzVhOMqzPfiRaOYmjhOgK1FgYPla
PVYk0oJJNzzLqUITauHLByQ//UTb4Hu1GpyrxxyTLt1lteSfPECMJ7EjoqqPyX29x9+QjFTiOQR3
Pz/nFUS6wq65R3KIusfdl1jFvzlIfdxpwzhQOF4+vv758Ppt0bxdPx6fr68/Phbb1/+6vr28atdz
Qz1Nm/fNnLf1wV6hEQxzmvB60431IWPqjVdpatVbyJmikwaMle7Pt2fK92+OzK/6hRD+PtrEDM+m
TUzvlYJ2JTvOdWM46zTrBJMCsrVgdfK4BFit08z3L7hnmk4KUkau40IAGrlyEvqOk9M1wJFiwrdA
L8SY9y63lCghMJk3tDPcpP/y++X9+jBxUXp5e5DOueB1c4qsuawTzsnDLbetmrFnjGaqCJMYEGe7
ppSslaeXdK38Af3h+YMl0mmyJ7ylAZqRWi+OoFWoeHKkHRGvU0jwbtQCYI1ItAcJe1HqEa98xhFB
0WwjHN/3S80yLyF4squ0rCxYzUNK4HR/1ekJzB8/Xr6CQ+bwuNo4ES03meYXD5DhvkmDUj+Szw8H
mKfeXJb8uq0JAg+P/MmLJZ0XR85MLiIg4sFo4ClhWmNOCBPNrkjl8ICA4DEeHfWuiMOzVRC55REL
Y8wr5Dc62iDFLY/ydgngo/ej0oKAWi+i+IyDTyNqu4xY+ch/BMYYULbdJ6CktPIvwm+0TghQvs6C
4v22ogelHDC4l8KADvHLwhGNK+U92haMn6OLCruB5/Oduv7ppH2yHmh+sx0JmTbJhy+Pj1kk5yah
JMUUMECyipjknuoqGgaTH98AQHmNA61xJ7O0rDNZCgFCbAQqTMRycjBggABDx2BufoEVRLgB3hNE
UTizMAXBzIcQBDFuv08EK/uX5gTxcpYgXqGxzEasF+grcbifM4CxBuxC3yAc1CF9Pg+kgdTxWrwH
iQB0CbUu8/J0jA2khDAdoeoOxSsdPdVkIL9s02DCKVDvdXsXO/jZCcdWQRdaIpACnuapLa07R5Nl
FOqB6jiiDBxX7woHWuPgAsHdfcxY1jMLom8hkvUpcByt9WTtuxNwrKYH17ZU4dAKsyGtA9UcZQCm
xC1M9C1HOIbqI4HLa0tA+r7KAo0ZxZmJe4VOrcCtresEajhDfpOLx4mdouKpbXJ4jHmrTWj1anmE
e65tYcJIDOdXCRGE9r2jr3pmmoAgDnG7cyRYodMgobW9boCa2wTDMFEs38EOxobJ+QMm2Stifog5
pvMlFDkWrhf5c+usKP1AX++Tl6869M/lyfoxD6c4CAyerNNdlWxRb36u8Ohu1BIQ0wy4yuFh/h98
sGXgOtrMA8x1dJjuYzFCsaurHrnUd0zdT3mCYV0HTGALNza2v9QELw/1mEVubCqYA44pUbZe9/al
Jj/7xzk9aLCXR+6Rn2Xb1Pqx8BCaT7V7h3h9hsFgUGzICeLO1EWn3MZOBBAPYi+CeNB9KXvbTDQQ
i4o2EN1IokK6w7SZbYw+JFZoet0IrwDUIVztmcjAqolDTOtWaVTLR8Jlgb+K8S4kFfuBbzQSEd+R
5tsfbCysuM0PVSLRrJcJg9lDElbw8o3+CxviHxBZAnsrRB4qqzUSy0xskirwA9SxaCJSFSspWiW3
APCKBe4QoO5oExmhxcqXlXIFFXqRizIQKAiRpWWOm/+43A3O8gHFznuzuLoVSDixtcyXZzRhFGID
A7uD7c543fxObDlfN6eR/SBUlKLvayjZftVQ6maiIzHpLNH0BqQRsVGhiNAnOSpNvMJ7mDYuU7Nw
HDNSlCiNCkaOZKxibAO2vu+USCa7Batgs/9iyTsuER3i2AktMpojY9yu1KhQrxyJ5lhi40eMIQlp
d1WciAZbZLZ1WmwDPdO6hBU7+3wNrBVHvZ9SkLG3nF/IcBvshr6H1zDYCDcGC2SeH85PtbAEPMuk
DubFP2hJdzW1kbn+/OybaryC01R2CSdUdFSTUV+eTwhdj1QwSxsHCHURGUTa29VThQCp6o5siKYZ
2Q1wyDjI30GIKADTQe/z9eHxsvj6+obkoxOl0qSEY8mpsIJl+ktRM5vlYCOAIG0dU/jsFG0C7+4s
SJq1EmpSmEXX2ET0SNy+E1R11bWQnAyzWg4ky3ku06lhATosCw+D6baAwCTZYSb8g6ARunFJKp7k
sdqiPpzZYW1sHQAr8cx9gBKJaWXa5MQ6lDSQ1/I3N1QrgsQocITL+2HrgQgARXMeDIFZfZRCUiq1
lX2Rjw9u+tfnwErmTQH/CJAwQeO/4/X3r5dnLFEkEIs5S4uEYp0Eii2FME7ParEyCB176lXaHZxw
JvXqtogtqfXGBs/rvMKfU08kKUQovEXTkAT3KJhosi6ltu1nosq7urRnqxU0EKauseTLm6g+5XA/
++kWVeE5TrBOca+Eie6OtZna89j2RHVFUvx980RUJu2tAZbtKmJG0q2aqmPs3JqF+hC4eLI/hcaS
q0ijOd+qidm5nsUCVYgif4avJSr3FlPR3OaOJ9FUK9YrDz9W08luzSdln/iER4fQiG5xHvwXWNJt
61Q3h8ip8JNFnQq/tNCpbs4WUFlSKKlUbnB76j+vbnceaOxpsEci//Yn7O4c9xa/MyLX9W92CkSw
RZ+XqPZVU8zk4BZUXejeEo5dbcsCJtPsGy1QNEZ1iAP/1hI8pI7v3ZrNA5N4eKyxieZEWp7DNSW3
JOiX1J/Z0ZojzgD99so2IfuQvrR+uJypm33wY76eGwv1PPWwhe/yycvl6fXbojvwkAjI/i861xxa
hse7Jyh2GaOZwbPiB0KJJT6roOFcG8Jpe1kiQRVEX399ePz2+HF5utnnZO/ElrXbz/jJ87WUpLyW
zNaArHGBWuTpmiFAk83KQd0CZALZM2CEV/c0zxH4PgzlY/YR/iV0nMiEpzkzChH6PHXD2ASDnuWa
4PJUuK5LNyam7QovPp32Job9ZPa3Cf+Sub56rwiYrgPcep9t0cSWE0kmhzSkJRVttQe1obWXer2j
SQMUenM63nqCDsQJFbcdknL8L+CHny4KD/48z4F56cUIf9HXPz54sMGH6x+PL9eHxdvl4fHVVhX/
1KSlDZ4ABtC7JL1rNzNmFzhBIcbZ0NllMQZ26p2UqGlWzQWe6hccf/2HE7AmSjYdEFGgb8FKx5/g
zxHBB9L7ixKCwTpHKL6GMLXZZyjL9FdwRBsiYsqPThnXAUplO2Etj+adbP4LO5osI8t+PhHMbJtl
G89oWBld4wJX1M0sT8J/m2t/l7T4Xivh7ZvSXZ5XOENwOZFAYqvKvuOXycqiGorWuzwJIsublr5/
SRJFToinZxwq2YSxxaVJUIh7XIMvuutfl/cFeXn/ePvxzKNCAmH812JT9ob14ifaLbj35c9ybKH/
t4LaAQ/f+aRkGrzir6/Pz3BRKAq/fodrQ4k5xerrDmO00R7e55RmBmdbQlRb7Qhlvd944nzj2YTz
IxcEzhZw3VC0RJkURZ1OKF3oqjKckqRiTJp1B3ndTBgunREvbnGycXn5+vj0dHn7e4o6/PHjhf38
F6N8eX+FXx69r+yv74//Wvzx9vrywb7OuxJ5eDiIW7M1zeNe07zQjGSFMum6hPuGjZHg8pevrw+8
0Yfr8FvfPA+3+coj0v55ffrOfkDk4zHGafIDJP5U6vvbKxP7Y8Hnx780R/LhG3P/hBkZ3GVJtLSo
xiPFKl7iYqWnyJNw6VqsFYnE4oImKEra+EuL9Oo3FOr7FkNtIGBGO27DTASF7+EHDX1Hi4PvOQlJ
PR83e3vtNEtcfzk3bccyjqK5zgCBj58w9CeWjRfRssH3g14Brqv787rbnDUyzgltRkeOMVmDicIw
UH2UONHh8eH6OlMuyQ6RG+N7kKBYd7HlDGbEB7hVPuItTwUF/o46WvphnZWYhnqIwnCOBnYCLdE2
SjE3+92hCdzlTQqLY+VIETmW06Ge4ujFDr6pDQSrleXlm0QwN6NAMDsXh+bka4/4JWYBCXRRBBTK
bpFruTYaratAkzNSG9eX2Zpn+YFTxHNrkTN1NDcDguJWHb7Fw1WisDjJ9hR3cTzPcjsae445Senl
+fp26TcTu4FRH7xwVpQDQTC3eOtDaPMUHgiCcDU3T/UhiizHLCPBrU5G4ezHgiZu1LCab+JAw9Cb
W3Rltypdy3ntSNG57tzKZhQH51Ydh/lWaOv4TpP6c4NpPwXLyjV4pmDMIl35cNjm6fL+p8Q/0gp8
fGZKx39dQUMddRN9V2wyNq2+O7fBCprY1J+5ivOraIspsN/fmH4D7m6WtmD/igJvhxhoWbvgyp1Z
FAw8eAeurWShKD6+f70yHfHl+gqZQVQlzFyGkT8rc8vAiyzX34LAeCoihcH9/9ATxcgbYnZ8SKml
41RltdtXUxaf9Mf7x+vz4/+9whGG0JP1O0FOD/kjGvVll4xlmqPLU8TZDxpGwthDPUAMKjmUsNlW
5FqxqziOLEhuNrrWUXA06gAtUZWd55wsfQOc7Odk4Hxb2wzrhaiXr0rk+tbuf+5cx7K3y2Qn484I
JQqUuAMqbmnFlaeCFZRjJpnYyHAf6LHpckljOQGugoXFLL+9N3lCfn0vYzep47gWfuE4zzalHIv5
gCGNe3gDOZ+sZ7xtpgdZcGUctzRkRS2T1e2TleNYeYESzw0sD4UkMtKtXNSvUCZqmR6CuHWMn9R3
XPWIEePN0s1cNplLyyxx/JoNVwk2jUknWWy9XxfZYb3YDEb8sI1xn5n3DyZAL28Pi5/eLx9M3D9+
XH+e7H1Z0sNxBO3WTrzC3Bh7bB9WQyt0cFYOls1rxOrH8wwYMmvkLwyqnbXDapEFDYfFcUZ9ly8S
bKhfeV6P/7X4uL6xXfUDciuqg5bqytrTnVr7IFpTL8u0DhJ18fG+VHG8jIybDgE2d32G+4VaP4ZU
ATMPlq5rTDYHe9hi5K12vmt05UvBPpqP20MTHleC+aiDnbtEI5oN39dTo8EMvOJYjjfGYquZRgWH
zDGVyYmwYzqot+rwXR0nDo2vHXv6Bc8hp+5JjgHFKXthkbmK4J9Q4pP5WK88y6seUTgJcbfTiQ+0
TgtghDOHddIY9+orqaNsG9QGw5aWMUBIQpHovRATynWQkbe7xU//ZNXRhqknulAA2MkYqBfpnRFA
TysNXOprQLa4tSVchEslHvc0jqXWdHXqQsfkMbbEUO/ZYSX5gcEAGVnDjJb4AZtMgR8p9hQRUFha
7tGNNnyyXiFD6MeLHy3y2z24orUtozy17AE+qjSKD5Z5bPts9c/IoEs318D8+lS/nxVADwWClaOe
qnM5rV3l8hvL88ZwVhR3r+BFWGeotE77/cTKyyAsYn0RiTn2UE7zNMEiZGE0LKOko6zN6vXt489F
8nx9e/x6efn17vXtenlZdNPa+jXlu1zWHWY2dMbEnmO5YgN83Qauh+ZiHLCuPuvrtPQDfUMvtlnn
++pjbQmOn49IBCEWz1Pg2ac02Q0Wu2PTU5J9HHie7G05Qc9svmaLwc2OXpQ355onCoRm8xJPrWXl
4Scb/VKN5/ZLLoA9x7T+eR9UjeLfbndM5skU3jLhCszSt3t/SHUvXl+e/u5V01+bolAbYABst2Qj
ZpsHupFyFH+bK8z8PB3y4A1HNYs/Xt+ELqXPMhP5/up0/8nGT9V65wUGmwLUrowwdINGgRuRxvTB
E6mlY3Nz4VhdOAigJhvgoMDX1xqNt4U5BgCfMDOG19Otmdasi1Umj8Iw+Mvo/MkLnMC2TrhR5hkq
AnfbMfa+Xd3uqY8fkAmxnNadh70D4KXzIq/y8ZhGXPMSxsVvf1y+Xhc/5VXgeJ77M57TVttrnNVK
k7vN6MLSvb4+vUOWP8Zf16fX74uX63/bV3K2L8t7tpegB1o2q4xXsn27fP/z8auco3CsOdnibysP
2wQyOGNTJKeNYX+cS9IQpr8pEXsAnjVMup2GjNL4xwAyHm28RJWMEU3zYgMuKGrLdyXtUySrcFGG
tV/SDhwc66Le3p/bfEP1Pm7WkLQ+L+GNCUEj1gIVpN8+M5M5Q27t+5GmsjsUwLpOmyZI5472llGi
8G1enukOnHMwLE13PKj3eO/dX94sXo3LbWXEIsk309sstllPQknhhthrm4GgOjX8xG8Vn9SOKcjA
yD5m66bQQtpSuVfpy8lguak2yXI5ksQE40+km06bs6TMlLTME+ws50WVwCm5Q+FT9crM9dht0nZW
X4kkbRY/CVeD9LUZXAx+Zn+8/PH47cfbBRxJJEEiqj2zYvJU/rNa+r3z/fvT5e9F/vLt8eV6q50s
NQbMYOddliJJGu/ytsoLhkeF0mzDchtVvT/kyV6uvwdBFpQkvT+n3WnGV24gFq9tAhTM/ud5oX/z
cXRZaowxoCFJDc+crC3nba4vcCaOdIbYZ1jQRj6vtNOJy22y9XCbnGFT0rJd7fw51zvapkkL8fx2
WUkQTHHIqAr+fCr0ptd1ukPfOsG4SNtBpkN95TQJ+/ajGd5/6+bycn16V9mKE7LdhFWVt5QJWvU2
YyKBrlqlkiARlyGWngqSTU7uk2p73twzTc9bZsQLE9/JkM6fSUG6/A5+rOLYTVGSqqoLto01TrT6
kiYYyaeMnIuONVbmjnp2P9HckWqbEdoUyf35LnNWUaZG0Z4o64KU+elcpBn8Wu1PxOKtJxVpCYVU
K7tz3UEwhxVq2EzkNIN/ruN2XhBH58DvKNZn9n8Cz07S8+Fwcp2N4y8rzQofaduENuu8be+ZLtDV
e8ZNaZvnuF+5XOo+I3vGqGUYuSuLoYJR6/fzGHWd3vE5+bRzgqgC3f52kWpdn9s1+5QZGqhA4sOk
pHvGZDTM3DCzTMpElPu7BD3AwWhD/5NzUiMwo3RxktwaEc3JXX1e+sfDxsWfXkq0TFFrzsVnxhet
S09oCGeDmjp+dIiyo+ZJbpIt/c4t8luVkq6Fd05n2kWRHLJ4IunafXF/rjo/CFbR+fj5tE3kfVGT
Q3L5dUuybY7VOWIUUTap/Ou3x4dvV02qiYe9rK9JdYrik6YF8UzumFK8L9dcuc4Sy7kb6JtMDp7z
Kq0z9Eku3ytgX9yRBiJmZ80JAips8/M6DpyDf94c9WZBIWu6yl+i79LFTIDmdG5oHMqB0rmqSeDL
kFhLBiNQZOVYHE0GvOfb9MhuRyrIRJmGPhuy68ipRTm+pjuyTkR4pig0BKaGR08CgYyJpE2zdI3e
MwStwoB9JjTK06DNgktR4GrcOCJ8Y6FKZcAusBk22I7dA3tzwuBqkyXVlvOuSg7EbmslbdpssZho
3N4oXW/vm99YqGDzO0pL8qrjJtT58560d9p+Apm+26TKuCO08IF5uzxfF7//+OMPZgFk+mOeDTOe
ywxy1kz1MBh/038vg+S+DrYZt9SQ7rIKMlm7ZX/z4NaHnCKv96EL7N+GFEWbpyYirZt71lhiIEiZ
bPM1UywUDL2neF2AQOsChFzXNE7Wq7rNybZiMiIjCWa1Di2CW7hcKVOC2SadZ2c5gg8QM5GkpHTf
wEsAiK+ZqxUg2jCQMrreSlXJQdeD/nek2qKf/s/L24N4dmPG6YYJ5Uovys8M25S45xcUvGfaiGc7
3GQENf40B4p2YRCgMfo3cHTElMWk0j8IKWmHv0PccHHv4tY2Q+6B/fC2IKQ6PAWgWmPUzXgIHbxU
dSCMKbQiAmgNnTtR2GM0TDQjD9joWnKwDIlEapI1zmaWbMtQ0WDgK7ULC39mLD0F2k+DysiJCl+5
u3dRRx2BU1ic/X1OdX4A4JAhtbAEAhjILGMHnLzaFA7A7skAnhyUsHIjSI3DOIGTNM0LFUGo/vdZ
SWE/wOQ8XcAbec2EFVFbubtvVTnjZ5uTNhYAiX7gY+J4vfuHus7q2lVhHdNQfFX8MMUur1RZlbR3
yt9NqZZhNnMpNh5FKAgo280Sts0e0FwMCk26p11d6t+ttL2750ia7jcWbthnhS5y1mzLPnVL23t/
mBERSxCvscxB165LfaRw6eNZHjXzb28xwAFH4V4zMgYd6R66vVqDKgF8B1hfvv7H0+O3Pz8W/7aA
9dOHYzQi8ICVzEOgQIQakkqsD5jhmeEEHReUpdSE71cvhtIjiE4YJYLWBNZDhKsYOc7ahDGis02o
z2ldno9FnmHIMbjS+AkmXJI1cYxaABqNfEM2ocwMy9LIkShnyoyFviX2iEaF3a9KJE0cBJbRNaBg
trcawWKRYVPFw0XO9sVIGTD18hB4TlRg8YgmonUWuupakVpv01Na4acnE1UfyRRdWjcW0NAdpppQ
yJY5fVLuOI3rc6q5wozfWv3rzI+rzvC8VB6WhDI0IZMkLfad5ym+iMb91VQ3rfeV6UGxY/q/ISp2
RFov7I8pi3bX5tW228l9Zvg2OaLzv9+h1gXUOMkMcYX8/foVLqqhgHFBCPTJEg6otHZhL9zzIzRL
K0na7k/qUDjoLCeW59BG8xsfgQQ7VuBYKmfh45A9M0wKbeby4o5Ues3rvKsb1glL1WuyXeeV0cl0
B6eGOoywv3Rg3dKEtHqrab3Xwi0raGbEJEWBWa+8MHeE1dph4+0IrKy1E8ip6DhSvN7VO8GYZVtX
cApr7UheUvvc5IWcH05A8lRVHwQUPwrmuC93uW2c27xck1bj/+1G3hkBsquLLr9TGuUQe8e3XRj7
xjdhHZlj4Lv7XG13n8JJWqoCj0nR1Y1e9YHkR34mbZ2H7X1ru8sFNIGQCWpLpNMAn5J1q3FFdyTV
LjF4/i6vKDNtO0sEFSApUp7E3tKdQs3MLEBVfbB/Z5gqEBszLM/msqz3FNPSBEEBqp86wDK53zCV
yJBGbS6Y21YXSdsaEmpptdUVk625toTLfdERzhkqvOqI3mzFVHfcDgVs3WrhiCQcUwMgXVpRy/wu
AYUEUqpjdjabrwqzEwW6S4r76mQUY1JKM+5kLFvT/DQ71SRq0xKm3JnzzIgz2ydr6zRNtDlm0lCs
VgXGbwc0oCJL+XNmXQrzICEQT0kDd3liCCEGzAvKNrocP5jhNGZ4Knk0pfG9t3BblFCCq2+8yjJp
u0/1vTXsFV+mZGblMHFCczSLHcfu2EI2BtvtWmbIlUxLsi7hPagK54b6etm9t/mSW4JrCQmnpV9S
sYSUdWffUE6EMa2lS9AszJPcowFmF+Zf7jOmSNSGkBMJCs+7Pe5LzLWEQk+mO7yIQ3SgIUkarqfx
2DnEkIoNqnX1xCI86dioXvfoI6M2ONYPB/aaVqf4rCjFBoTSgNSdepeSMxx5Fnl/PjutKTXIpwQU
IUZUGNsa4ABjq0L3RUPOSq5kUb6qtLjsPERRm+7Ou4Sed2mmYOTZ3Ys8cZbZTaqKicY0P1f5sTeX
xxAo6mtOmPUpDIpSfe97cQZ7gqDp6DiVEnlV72Ldbc/HHRN5hVaDQbUuuIlEO51l1cmlfHa3ecuT
8RmfhAcf2TPBWDH9jilo9795Mlp8romVX98/wMNlcAjMdH2ff6UwOjmO8THOJ2AZAVUGw+HZepui
oW1HCumYQyme99Vaytanvec6uwZrmdDGdcOTXlqh2bC5ZhXMtWAZ1wA/N016rjfMcrhRwUAoZwtE
8NZ2KLXxwVSDcVbEx4iMgMNsccr4EnV9z/zItIhddwbM5lxbvW0MjrKryCwE5GpuxQGqZIgcgDx4
F9j0Msf2+VHTp8v7O3b7wtdAirllcoHREtDw9Bk/ZrYCXTnaxRXb1v59IQIk1ky5zBcP1+/grrp4
fVnQlJLF7z8+FuviDuTNmWaL58vfw/vCy9P76+L36+Llen24Pvwf1spVqWl3ffrO/bSfIWL348sf
r+oS7On0fvfg2c860IA9rCheSgVJl2ySNY7cMCUnrUscSWimpBWXcez3pMNRNMtanrEaHQ9gLZkF
ZbJP+7Khu9ommAeypEj2WYL3o67yQbNHm7hL2hK7FJJphthYbA5TyxTmFZuNdegFjt7QPjF9LYHP
yfPl2+PLNzNiJJfiWRrrk85NGv0Dk8aIOi6gB0TIaiR6BlYNPcdz4Ebiq93joLOal5V3m6/2rE0x
sKAWSW6fLh9sgTwvtk8/rovi8vf1bXy8y+UC+0zPrw9XKRgBX/CkZt+4uNenPTuimR17lKd2BiBK
Z7aXh2/Xj1+zH5enX9jOeeUtL96u//nj8e0qVApBMqha4C7Plv/1Bd4hPRh6BtRvv8IcSbqWaQjs
Q1Oag3m0wQyVYRuMQo0/eqAplUcEZKpt60IRt7zzxikgZ1xKI89gZzCw1Kubsar/Ye1ZlhvHkbzP
Vyjm1BOxvcOHSFGHPlAkJbFMiDRByXJdGG5ZU6Uo2/LackzVfP0iAZDEIynPbOylyspMgHgkEgkg
H7rahdaZkTw0xp6BvFAHxem2Ua8SxXd3NDN0ziJblQ1cYpiNHHva5HwqF3NyP0vCMRZJ7nlqc2Mc
U357YezETZob92S8C3CdKQ0rrSHMmf622K3GxE5hzB/jCqbo7vJFbWb44q0q7+K6zkvsGMhLZ+aK
zNY0a8Tmu8z3zbbOTH6Ba3xurKVA7xnd3vx49pWPwR6zIeQLfMuDunqBuzf3f8o0avaHHzg+jpmG
ztSYbwiszAaUB+Ywe5Ws45LeZNZoxw1BubX6/uv9dGBHQC5qcHat1soFxUaGgt0nWb7Tv83Tr++0
008Tr3elPNKYILESF/e97be1XLsIuMrBcaS9emdXsRkgt0c39xVq88U1OiYUWnqXN1o6W6JmL72r
aXbLFisCRALBkISddsoEDxfKY6NuY9RkHkrKuRWin4dZFZFWx88y2ofH9i3A0XSt5uHuQS2EZk3Y
EZKW6svSgK/MYnWelGs5RtrnJX3RLNEU1ozibkFTvbK4SMpaBzX5krQmXbKYaTkUGWjHc61o08LB
24Wv20QDdEvXaNZDjkrXecgYwSok9cqRszhv1u1aT4zOOyCNIMeLkUbRZUhGaJMnCMRMVsI06F/0
cjr8wE4HfaHthsZLUIohDyHKhoRWdWmzaY8VKOy7nx6q+1bwWSQU6dQXrs5tWj/aI9g6mBsRaDrE
1cmAuxC4QRhq5PcJ3KZArW6AtvxyHXv6BJJFDTvBBrbL9R1I2M1qcO5iFLbU5MXsB3kOjje+4wXz
2ACzA2PoexEGDUwoN3FwMKCHAX0bGE4RynCup9njcJF5DWUdjq+SeD6WWIATjGRBFh+F1MFTsyUM
qGdGluAgGPGWHvBXGgr4kaDGEh8FqAF8h41Cc8h53wN7zCTc6rpNFY7kleQEMnsrmACgl/WcyLRe
6YGBOcOa+QuHqPlSNa5LvchBZqDxgzmmKwpGEXkBrVJNEkO6tLFiTZEEcy0IiajNTmTYM3Twc3zM
+pzm4yQ59d1l4bvzK0MvaTwkFP2w4PlNxp9Pp5cfv7kirH29WnA8K/PxAn6UyAX75LfhPUMLriyG
HrQ7bMvkWDM5t+hysa/VMwEHggukPRU86fZYrghoePN2+vbNFmXyKtaUqN0NbZMT7GsSWzLJadxe
4ITsoIDtQRoNadKRRqwzpkstMvUmRsMjttEaPlE96DRMnDT5Lm/uR3t4TcT1nZOX7MPF9On1Asfk
98lFDPrANZvj5R+npwt433KvzMlvMDeXhzd21P4bPjX8eERzzZxS7x7PgzeCrOKN+sCv4TZZ0z3g
4EXBTgd7gNbHUCYJ7ysRema+ACc/zDAiZ/9umOa0UeZ7gHH+ZkJCu/o10eITV+tmh+xUjh36mQHd
CqTupK5QkmY9kgiMrc+pQonSKBWVSZ0SvCZAtPUeV+Q4kua4WZRSf16VOXbfrpDQuhrpZU7Rh9Ys
jZn63pTwPkSTeqsc9zjKelWrm6TVPBoAwHaQaRi5kY2xVDcArhOmXN/jr82AZ7imXOMbAeDHb6IA
u9kxbdOSkQwzOXVuPprKDWXyTbOEzy7HG8VJmMaNHUB6vJbPUYW22zzj8RDMsYB4/HBgtBoMD6TQ
aOSQ0JXr9NSRFvUkeiifDhUvFsHXDDV5H0iy8utc75GA7yMta3cH5wm/bXhKTftlHdMmTPxtazzp
i0o6w1zeFIJwhnx9fU+iIPRtBFNVwrl6Ta0gjBTOKmIejSFmNqKmQeLrIQU7VE4L13MwdwidwrtS
2sMdYDqiPSNBk45LfJUso8BDhoYjHGzQOMYfxYwijEzH3bhN3SbCLKc7gsWt793YVdr5cbtv8czR
SIEh2a7VCJmJ+epIUnYcmzvYlWdHsSS+i7WoZmvFxeGBGr1OpdejGnWYjLADKB4CtS+888fSJw4k
UeRcW/U0ZUsy6pQdiL2syyFVvIFLJuw7Va7SQ5xnW35Zy5UdT1HWFhh2ZCeofZzCVp7rYWsOBmGe
IKJAYETNf5gPN1dbm5AS4Somcjw1CKUC1zxbVXiArBAQXVHQLmOS609BOsFn8jGM8LhXCsnMi64J
BKCYRij3ASr6vDAq/r2pHpahx/Dj7jVebG7cWRNjEncaNdjQA9zHRDeDB3NUBlESeiP5UAYxNI1G
Ml30vFUFyViKJ0kC3HdN2FkZvAdO77xArJ3YNyI4dpiv95tbUllqxfnld3Zeus7rg729VSuSGM0U
gw37CxV4cM+w36O6CN3sMHW/L9mE/hzVH+qZ79ix/ODQTkU6CbSjTOEeTK4sWH9ha2N22l0uaPuW
jzUo89lmpflYA0w6jfFbyE1W6F8WRjbdAatoIPE5oatUNUVJ79p4nwO1NjNLWjBVHbUBAFOSAp79
Yt3Hnzs6rQHekhXBz/cDDVIxawo0w0gPL6HqlzpC/LqXYTOziwAAcqVeyvRuQdaPevJ0gmRjWsQ1
er9J2mbfjjSZxEags36e2jrOU6X2xXZp5x3jtS9z1VKK3nGo2t+tLI6NqED1Iddwu07j8z1LbPfD
Y6yErdPpdBYp6wxyCzmR+bvl5zfnpz+LDIRhfZcTGMQkz+H5WflM44Y3quip4hqq7OMU9WAR26YW
3zPAdcnHLtDB4ka+Jeywr/nXCiyPItDh/vrXYSQh9B34IS4Ktm7wwVZJMB1CwXfm+eq3h5+ScABs
NWPQvGyTfKkDKilD8/pWR6QQdK5HDEwDj3fZSL5kSPyX1UmJntP415IcE9iA2mTNSBJdKFdv8Qz3
kE5xGXqaxADh1SJJJRW0OiwytBXJNlsLWOlPbQN0PCCGpFlAzj3djFpi8k21RZN9ynYQrHEE5k5E
w7ANcA9v5/fzPy6T9a/X49vvu8m3j+P7RbNxlgv2M9Luq6s6u9ce2CWgzaiiMdEmXuWqnwGTwlma
m7/NHaqHiptKLmbyr1l7s/jDc6bRFTJ2blUpHWUFCWKS0+TKzEuqnMYtkkxVYqukmI0kAlIoPOxs
r+JDq8MAVo9cAzhSk1eoYLSSSM2z0YMJO7dPke7EpCrYmOSl5zjQ8/FmC8oq8fwQCK1v9PjQR/GM
UTUzOhXsIS1L48TBtOkezY4IxEULUrYhXO0LL2yzXEyxFgLxCDycOvbUpI0XqXGpFLCLthcQV/iF
4wO8vhkK1h9QOwQhvhdjkkUSLIsAYbQYBHpeul5rsxXg8rwuW2Qwc26n4Tk3iYVKQqYArFQx1q3P
KgnV+E7dZ9Jb11sgXdowXNPGnotGYtGJyrHyZOR11KBxQ8yCfSAq4kWVSMa3JQLTuq+LDJLG7hVu
ZwQkx7rAEFv02acbUnCnu/WRkjTwMDfrvt5cEYI6LvKCQDfC6SeK/XMXN8k6LW2JzrExVOw6PsJo
AzrQT4EIAeohjtCFGDf16HCPLZSBwHP8K3Oi0HmfNNjHk1/YdIGDSQiFAA/p09MVMC+h5yBrVeBm
e/WZXsexDQUbLo6bu6jsGrD4PV1PBuf+3J2NJMAyya6PVkeEcfWAvSJRe6IQn7adYP9r60rbN9G1
oGyXV/FsuzTUSIMi9672padClAf2q8mSrjfYDgZnKvTraeM7aJzZDn+/4Wdb10EX0YppWusqza9N
N9PM91d6lieVEF/oHn+7KOM6HY3eJem+1L55XjdJbjKID7AxfDdNqoT7v/Etf7zFPZE9EQKT2mqR
wJDxQkSUsgaPZy67IvjBz+QW3/TCwMMsYVQCdFIBgz/RKQQzxxYw/f6IrYQN321SdHsTOHJtJdZN
Gng269MQ0bGJ5sYvgdzif1TfT5t5dG1n3vAKwgDR+Bg83dqDIcBLI7izhqT5Cr34kUQ7chNpSQ6H
jdkW4LBbIx/imzjFX/i7lSH+L9CHekQOXpOBuOyxtUYaa5doBv+MM1ZfULlVZUehubdFe8iQRrcG
VDRzR0sxpcmxU3XnjD/fL9KFSM/jGh8Ox6fj2/n5eOkevrvo7DpGUL88PJ2/8XQPMpnJ4fzCqrPK
XqNTa+rQf55+fzy9HQ8XnshVr1N2Lk6bmW/GINS/91ltorqH14cDI3s5HK90pP/oDFfeGWI2Df9Q
7O4/r1dG5oWG9clg6K+Xy/fj+0kbvlEa4Xp4vPzz/PaDd/rXv45v/zXJn1+Pj/zDidqLvqnBXAa1
kvX/mzVIBrkwhmElj2/ffk04MwAb5Yn6gWwWqStbAmTEO4WjxqoSViPH9/MTGAx+yl6fUfZ+7wjf
d20UQd2CIVfO6/Hhx8cr1PMOTlzvr8fj4bv61REK4zqp7cLx8KLv50N70FNuG+vv5fHtfHrUF48A
DVxYNFm7SgnTGbG9bUXbZbWK4QZXu5Tc5PSe0irGTJFIqUt3+N0mRooTFbfJbHoeZmusQJoTNVkn
gDp2UGFbiku5Gzoby0bbXeZBh+sSswLtKLRwWR3QikXZI0rME2TAlhUYR9oVVtKrzADX8Z0NVByz
zN7w+N2p7kbUIc0wbR18LH5o37S7a8NDU7xW093GJtAnTXpBvv84XrDMJwama8U+L+CNDUIKL9UA
m3lWpPARw5xyTcApAD5PIXQEzjRsKx9TuLlnN/f9WsT4M8b2DmfFjOlCTTtirXZbrLAHWrZc2l0G
sfzYKUPrRuWONHBVFukypyMxke5olW9M9xOxUz2dDz8m9PzxdtAjEHf7Eobv12WcF4tS06W7IAIt
WeNaRvdkuijxBw9Zp2VpJ9F5SchWsXUU3AObwukw4chJ9fDtyK1+J9R+BPiMVP+OzGDTfac+Pp8v
x9e38wF5kc8gVg1YHaqbFlJC1PT6/P4NqaQiVIvEywH8ZQt7c+dI/vy74g6LGx62bVgNFgED2LWL
VxZUM9Kb2e9VEHLwLq97717GHi+Pd0ztUN7YBaJMJr/RX++X4/OkfJkk30+vf4Od73D6B5uD1NjM
npkWxsD0nGCciKFFOdhKH0eL2VgRX/Xt/PB4OD+PlUPxQoPaV39fvh2P74cHxji357f81qikW93b
PEksC4PbrA8/0ylUn1QoLNn/m+zH2mrhOPL24+GJdWC0hyh+mGNwDOwmeH96Or38tCoaZHG+2be7
ZIsyEVa414r+LQZRxAukNtst6+wWs5DeN8lgLJb9vDBdqwvygXhwCnKmbibtlxj1zJMUSxrPp+rz
vYTr0YYkkMR739fPpAMGDE/Hv9MbRJolq2YT4AcJSVA30Xzmx1ZjKAkC9Q1HgjtHYkXDYtJLjUGZ
q8gcXnS3y6WqpwywNtEeLxQEOPKVG/CKxKQXEN7A7g3kesXSoYHpM9hnxZ9LipaxSPnnKcRd6kk8
lYTeWSGQJXioET/r9seVfeGrxswSYCqsCxK7qP3sgiRscs1A5CpUD/6dxl6kp6iI/ZE325TEdeqg
mT04Rs3MCADVFuxmT9O58VNvyM0++XLjOnrqbZL4no/rKITEs2kQmHqngg1Dzec4jqaqhx0DzIPA
bc0wJBKO1zkP9MzQZJ9MHdTSmmFCcZvUn8luIiOxO4AWceCggu7/cOcx3Ad4c+0FgkFCJ2zzZZxk
PDNNUaDh4RndfK5pYPG+8pw9iDWMnCGjCJCamNnssqKswLiiyZIGDfCw3s9UM9miSbzpTGsyB6FW
pxyjWwUyYej6aFAMhpmH+nMMSSp/6mHXlJt4OzMe2IUUZfItNpPydXOYcplPylQ4ZqJEDbyUJE7k
YqPIkZRxvibmAUqY7B8be2kIDx5V2ugzeAhwq8USv1uGrmNOmdxz91Yn/9M7NJ4pdZJp+YlBANYZ
TWIZa0GvUykh9bbXJ7ZdW+paDxWb7vfjMw8qIaw9VeZvCjZf1VpGWVRFYBaq2674rcugJKGRypd5
fGuKB6bkzhzUjB4+mNeQsoeuKl+TqbSiI1Js9zUyvVq7s5LZRWHhenrsLFzhRklk01VHCidQ54Id
XsXYUNl5oVzTqitnV2ojtd2tMSrEcXIk/6Llnz5PHgQf4IIscELtLi/w1Slkv6fy4nOABHMfkzgM
E6pm4/B7Hhp7YVVCCgEVQqdT1cqChJ6vvscz8RKohiXwO1JzQjNhM52pHkUNt9YJgplCJNZkGhs5
qq4MUX+V/vjx/PxLasKqOsrHnsc3EYmOURazKviLyCd0/J+P48vhV3/Z+y9wgk5TKtOCK0d9fgB+
uJzf/p6eII34nx8yC6px5B+hE34Y3x/ej78XjIydrIrz+XXyG/sOpDrv2vGutEOt+z8tOeTJuNpD
jUO//Xo7vx/Or0d5aaqw54Ks3FCTKPDb1NSW+5h6ruPgakq19Z1AVVMEAF1Iq/u6bH24p8JR4JRj
opuV3xlcGHxld0wImOPD0+W7Ilc76NtlUj9cjhNyfjlddJG7zKaGnwecW5yx2yWJxHOYoF9SkGrj
RNM+nk+Pp8svZX4GcUA830Xzt68bVc6v04Q1Vk0C0FBPXcbitz4r62arktCc7QvaFg4QD1furEaL
Bc0WyQWCDzwfH94/3o7PR7Y1frBB0Dq1ILlkM6Rjy31Jo5mWX0hCDG2b7ENNK8o3O2C+UDIfOnGS
2QpKwpTiu9aVLoiQBTyHhrWU4vRL2lJfnZM43e4Zk6jivmCy11HOpXGV0rkRLojD5iHOeYu1O0NP
voBQd5aE+J6rOukBQDPEYrqZ6j/JfodOoP8OA22EV5UXV6xDsePgl779JkoLb+64mIOoTsKDzwyz
AzDXw53FvtDY9dC3+bqqnUBjZPkNKxJNUxsmV8WOLeNpgtkHszU+nTpGJCcBwzLSbMrY9fXVU1Zg
VYOdwyrWFc8BpL7aXNfHfTkBNcXHhR3BfN/FWAIehHY59bQjnATpa6lJqD91NfnHQTNsuLvRbdhs
CafZoRCAIky1BMxMdyZmoGngY8OzpYEbeVqchV2yKUwTGAPpY2JylxF+mtDq4rAZNmS7InTVVfSV
zSGbKS0knC4AhNX9w7eX40UcdBHRcBPNZ6oSCL8D9bczn+snPHnbQeLVeFo7hmTiBusFIYkfeHpe
PSn5eI18i70ys2uSBNHUtxeUROjM0yFrIh36ULj5fI0OmRjMj6fL6fXp+NO4n+Sa/xYX2loZuRMd
nk4v1pQoYh7Bc4IuHs3kd3jufnlkmuuLEvsUmrGuefgZ/JKNh0Gut1WDoxt4MYX3TxzNQzkoqL7B
eLM0Te/1fGGb1Qm5kgs89UYuBRN3ZXpB559qhwKm8zuqZwEAAt0FvamKURVopEFoY1lndO2gINXc
tZb6SM2itNDC347vsGEjC3BROaFDFCPlBak8/SgNv03FN2WH3pFn83Xl4JKaHVhc17rTU9Fs0eKS
nNAgRDOMAcKfGXzStF3iIQRqiPdgqk73uvKcUEF/rWKmGYQWwFyy1gAP+tALGIUgq8xGyqk6/zw9
g/YI/vaPp3dh6IPov1wlGEuRWORpXENmhazdYTsVWbimn/4SLI1QTxNaL9Wop3Q/DzRpxtDKgtgV
gV84e3uIrnbs/9cyR0ir4/MrHExRxifFfu6Ernr85xB1rTekchztCoJD8GANDRNPqEbDEXLL7gQW
0rJeW2q0RxL2kzE5Glexgei/ivMrAES81CZLdHCVb1ZVuVmZNTdliV0V8yJZvdQr4YGX5GP6oDGQ
zDST6DQ5NcAd+yHkt3bdxoDg6bxsMOsRwPKIhL5eDQ/UFwU6sLkrzJoZqC0yO+FdXt9ODt9Pr3Y2
FYaBNPHqoaRdqpG4wGe8jtvO1bPbL80K+/oqiJytOQhyY222QYBHkH6LyENYQziopEGzkDLZlTXc
kL0ui0IP8CZwkKGdR6Szulyt7yf04893/no69LdLuqubAg3AluRVzkT9WotesUhIe1NuYh5DGcjQ
5QDFZVwBVgM2vRqB2gIVQ3OmMMQ6DlgmJ/uI3OqhjEWL91mBtxvQ1T5uvWhDeDzn0Xb3VNDDsaYz
NqyQ78dVtS43WUtSEob6FAO+TLKihGvTOh3JCAVU3A5DhJ0e+bxCoTIooGRaK954HdMwEDsoajdG
Omv01GBqxjqonfAS2xirOr5BlBUuyZ/FjQ7mT3uNTOFiJCmBarbYLcpNWpcjCYh6k8ZOTYmVex8e
Q8z4aQslmSi0zcBCxw45tr6bXN4eDnzfNuUHbTSbGfYTfOQbcHIeY7eBBlLQ49ZwQIPc8ypYWm7r
JONv2GWBx6NTyPrQjJ8RLiH0P2Z1JmJQ6FlAO9iom0lPsGpw27Oe4H8rO7LluHHc+3yFK0+7Vckk
bjuHH/JASVS30rqiw932i8pxOknXJLbLx87Mfv0CoCjxANuzUzXlNADxJgiQONqOC/47oWF5G6Ld
VK3tHzPBmbhy+p7On8rpXq1emldRyhCtboY5s0UIRWZt1hUxFDUUy0aTxuc123uiU8aZYXySsgmq
W6vr8FMnoBpKPk0ekqg8bY51h4FYmXEDDbig/HduhXDu8OnZCBlJNN/g5FD0a6pzuZ2tJwyF1TeU
Ai0XdLbl+7OFMT8IdIxUMLWudhT1FWHfhimrDEaBvwbDHFaD86ywDnMEKE4cd03urr4G/l3KmN9l
rKeVVuRsOyT1brNHQ3Bi0pYScC5Q0gcpHzTjWjR8PEjAZVVhc3O57RYDm8sDMCdD6hoXnVANVZth
/nluEWqaVsZ9o8KzzphTv8BTjAo6pFVDTeELPLUq9UoM1eUEUiDYui8zlV/CmMBPUbKwf7nfQiVF
FIt4ZdpKSoy7CRjTsGgCAmlspYWdMGjxidE7uX1glDlsRdc1bHXWWPgVGCPCVPHJafEnfmw/seOK
UGdoiLATXYZB4I1yt7qe2QIBIJ/7quOdrLahhWVRsIkZEFGVFOxDxzm1PhpxjaxFxhtvINVGNHxG
2q3uNFP1Mm0XTjdH0IDW0+igkeScWlPF05cOZKgWtoHchMD4uW2N9j1x3geya07EOCetXwx1BHn4
mvc/MKnM1kWdu9Q1hF+NE5Y2AnHCpbsifeKmL0FwhS16MTBxlCzqcKBYhRctjBbPdefqZDqcg5qT
chulzHJ/ctMFfclzV0vMDLEs1JxdLqhgKqnDUNVs8Vku9ZIyNdEyQYukCxdvnLsDaFDNRe3mdzYp
cAxYZpG2ZdXB8Fh3fgrEimaE8cKcpyL4CfGDuT/0E70ZyPicjk+0Z7PUJ8yiNxLiloX+hsp1WZUC
do00javTohvOrXtbBeLOIiog7oz5xIyXaXtqbQwFs0ApHXK2P20fyHw+xjBiF1kFM5WLC6eoGYqp
p7MGpI0hYfPVc5Qi3whQOtIqzyvDhcggzcrETq9k4EpcYLSA2c4YlFtYHjQ2zxEWEga5qq3lMrpS
Xv8ww/GlrXMkj4CJ9zngFZxR1bIRhY/SK8XYFQpRRZ9wkNwEqnoSkQa3nj21EzR4bhgkZqsM707q
qup28gpU0NfJeULy3yz+6W3XVmfv3r2xT/Uqz6RxKXiZYcq2+XefpHoR6Rr5WtSLRNW+TkX3uuz4
FiiHJeuWoIVv+DV8PlEbX+u4VTEoKjXGhDs9ec/hswpdW1ro2ov9w+2HD2/PXh2/4Aj7LjUuo8vO
k0YIFD5ECN04cdu1ZM4Ph7oKedg9fb09+sYNE0l+Zs8JsLZVSYLhBZ7JZgiI44I5dDPLoY9Q8SrL
k0YaSSjWsinNqvQFx/izK2p7OAjwjACmaEgu5XQ4WaTJEDdS2EEF8M88+voqyB8mY/FgXDLaHBcg
5RTcIoIjYlM1a5PKmG2H++Lv84Xz23qWV5CASkPI04+/bPJ2I3gNXpEPgWixGPewDDj3qXYTawji
8SBRwfTgIGZHZiTCBSBzJHI6ysVtWjZkNQ5iQGVm8gBxwv2JI2ENZOyk4W77sjEjE6jfw7JtzREc
oSH2OKK3ddNRCgVjPcl6ZU3uCHBOghHKiWBxZn2eaVnZDrqGYIxJuIHTj/QgycQwtMn7OoYvwvjQ
xiGkG/VvgvnNUsJ50hc1TPIFG7mPyKYmub0tokGd/V7Rh1YfEeD65SqsEmHLQM4WFH4XxVyf2Y6J
EiSkpg0Y25/V/NlSmrF34ceUxdA8LebNkLfTgTPAgcMXOJO8N5+YbYxprWJhPpiWnw5mEcRYVlIO
7tlmfrDDODk4ni85RKznhE1ycqAOLiaQQxIcr3fvgpizYJVnJ3yuBJuINQt0ygnNydnpWahdpuUS
YkDUwqU2fAg293jxfFOA5tgulwL48lUd8+AFDz7hwYFuvOXB73jwex58Fmh3oCnHgbYcextjXWUf
Bo6rTsjeLgpDVoOgK0q3JAp6LfMu42xuZwLQSfum8suMm0p0mZlrd8JcNFmem+9zGrMUMrdD+04Y
UFL5DKWaIosxsy93mE8UZZ91gc6zDe36Zp21K7c9KEoz1SS59cwFP8NpucsM17VJPoKGsmoKkWeX
oiOvmjGANne5UA0b673dugtX/i2766d7NC3xInzjOWnKxheo/37uMc2wIziADNSCQgbTjGRNVi4t
+SkaP+cMPBq8k0t0XfP1jrp+GTHMhwAektVQQdU0CtbX+g4WA0y39MTfNVngNYG79fWQ7Lm5wtdO
UKwSWUqVpwsVcBKAYjt+iEd0AAUKWZ6PQUxmuzCPCtldWwsulHdaNXSjpF4iDaESL5xjKqKAVbSS
eW2aCbJoTIq2+vji9cOX/c3rp4fdPeZNf/Vj9/Nudz+pkFp9nIfddBXK2+LjC3R2+Xr7583Lv69+
Xb38eXv19W5/8/Lh6tsOGr7/+hIzUX3HZfjyy923F2plrnf3N7ufRz+u7r/uyNhrXqG/zRlcj/Y3
ezSs3//3anSx0WsfHy2gU/Ea9ktp7aNlDIph3i8z2DywAkFrlGJNPWcv6DLMdafm1U5+51CkwH9s
gvkBjW+rRoe7OnmaudtUV76tGnUHasrnuHeQ3aqrkPu/7x5vj65v73dHt/dHavLmcVLE0L2lqDO3
jBG88OFSJCzQJ23XcVavzKXmIPxPVlYEegPokzZWdPAJxhL6+bl1w4MtEaHGr+vapwagXwIoewwp
nCdiyZQ7wm0NRqECC9T+EHNPiiiX7nvdSLVMjxcfVNo1G1H2OQ/kWkJ/2FjGY5/7biXtTBAjJnBQ
jdgpioe6Fnr68nN//eqP3d9H17SGv99f3f3421u6jRUpXMESf/3IOGZgLGGTODGYx273zblcvH17
bLlqKGObp8cfaDp8ffW4+3okb6jBGNruz/3jjyPx8HB7vSdUcvV45fUgjgt/phhYvIKDVyze1FV+
4fqFTHtwmWESpvAgt/Kzme9+6vRKACM714MfkX8isvsHv7mRP5JxGvmwzl/fMbMopf12N0Jz+ybR
RlZMdTXXrq39oKc3qrzYNIG7KD2QCch7Xc+9Q+pmt+08Xqurhx+h4SqE364VB9xyPThXlNrMfffw
6NfQxCcLZk4Q7FeyZdlrlIu1XPijquD+pEHh3fGbxEz2oVcuW76xZh3GlZwyMG5tA3Soa94aTJNk
sI7JjJHTSDTDKJJjM0G5ATb9Vmfw4u07Dnyy8KnblThmmo5gt+0eBVcNgO2Q+hP4xAcWDAyf7qJq
ybSpWzbHZ3wOr5FiU7+1feOUQLG/+2FZFk2sx18lAFMRjhxw2UcZtzFFE7PBkfVarDZpxi5ehfBu
VvViFYUEddI/J2KB6oz+yGP4gOX8vwy0P2MJMwwp/eUY0UpcigMnaSvyVjDLTJ8E3FKTMpAoQOOb
GlS1A3UW/obspD923aZiJ2OEz8OqVs3trzt09bCE9GnI0tx+ARmPgMvKg3045SSS/PL0UJ8BvTqw
9y7bbkp41VzdfL39dVQ+/fqyu9cO+lyjMUv1ENecAJo00dLJ9mNiWN6vMBznJAx3liLCA37KMI21
RFt3U9E0ZMiBE/Q1gm/ChDWEeU48JZqGtS5wqVgNAisnOy9Hefm5/3J/BQrU/e3T4/6GOWPzLGL5
D8GBp7CI8Wgz0kUFaVic2oRctimPKDwgRDMJlgfbMpOxaI7xIFyfvCAoZ5fy4/EhkkPVH5A6547O
wunhLgeOu9XGX+XyfFhlaTm8P3u7Zeq28IcXH5LCIXxqR6ZfbYZGlElVjLjD34uucGOFeVilanAN
VXjs/JvTQOD0mdiPGenTtCKVWxXTjCsijuH4f6ZDRV4ts3hYbn0F0MF7z1HtRVFIvFyjC7nuopYs
su6jfKRp+yhI1tUFT7N9++ZsiCXea2Uxmuwqe92ZoF7H7Qc0czpHLJbhUuiyuS/f66x6M1YxH4zZ
8I10uoejb+h4sf9+o1zPrn/srv/Y33w3DYrVm7p5p9k4hlYuKTCXeI1mMjyxtjL5B83Q3YmyUjQX
yuAr1f3Ig9wTMz2+G2ojL5+GDBEo8HBQNUY0ZfTJskzpogykS0x6YMyVdoICwbOM8T6zIXcbK/yy
QZLLMoDF+Lx9l5mvk3HVJJbPTpMVcij7IrJyDKkrYZH7ZWIWE23PPa30GHYJHJoWyMpGBRS+qhMP
WdcP9lcnjmgCAPZ63iWBzSGjC15nNwhOmdJFs4Elf6BwmKMQls9D4pyWsfE6BYzbVzVjQ5NydUvF
V41RmFEgx6GE6LgbIzSRPvwSzwwQDGwx8VIdew4UpEamZIRyJYNoyNcIMiFTDIE5+u0lgt3fw9YM
rjXCyEWs9mkzJy/tCBYN7x4yo7sVbIFDNBhinpN/R3QUf/Ia42SHnXo8LC9NP08DEQFiwWK2lyzY
Eu8tuLEC9dZl3lXgaEuGtsorS+UzoViquZWjeGX9IL+vjkI/msZQndx2rYQhW3GwYV3ULDwqWHDa
GnCyzz0XuWNSK9q2ijOKLA0T2lh5bQX5oJj+dwpEWWctXoZwy/KnpLFQyX2B0y67lYOjnMeiptcf
J0EzDF0uGnSNW5E+YTQWe4V1URJgpEVfFDfAK08V1z1DQkmOG1kzlSGqrEqNwGijtY1tpAcazXQ1
Zn5wBRwqH0EbqmWuFppR3GfzHMmryP7FcLYyt71QphXcVUUWW/nR8suhE0aJWfMZxWyjxqLG5DlG
c7LC+g0/UtOTvcoS6PYSZAoz0nCLfqlVzox8jZ6clkI4oXoMiwvbMc37duU8+dLDWiLryqi6haPG
GW98eC2XgTNwiubgSCf2658Wswh6d7+/efxDhUH4tXv47r9ak+SzHjCSitmQEYyWXfwjivL/xAQT
OUg0+fRU9D5I8blHa+HTaaJGEdIr4dRYfhelgCVwwIQWhOGoQllZNg3QcqK7MvSC/0HwiqrWCh4a
HJ/pCmb/c/fqcf9rFB0fiPRawe/90VR1jQq5B0N7+D62HRoNbFvnAdnDIEo2okn5uxuDKur40GDL
JEL3pazuWHe8kl7Cih7v+EbfshGVAsOX5AvxETM8/Was1xqYMTo3F7ZvsxQJlQZItikriREO0PAf
9kbO2cRWNaxKTC6coW+VJUirrrbAs9Cio8jaAjNgGlvLwVDL0Ufrwi0DeGwMHcMHbXy/V+x2ViX+
6Qr4zcz4MO7FZPfl6Tsl6sluHh7vn36NKef1BhCoJYJmY6b5NoDT07ialo9v/jrmqFQ0B69bxulM
hhfqIIb5NycJfzMDP3O0qBWjsxTOg2XmSTjn5yHSAT0z8mxZFuq4mi2+0UKGSFh2948G1e68Mkv2
dxnafHu386OpwVSuwRqRPYFYgvF47etuVRzi6fBj1zd9XW1Kln0Ssq6ytiodXyobg4OmfNXCdczE
l7LhHV/m9qI7WpBHKj+U1u/piDism9mkKX+PYhNR/K4D9aH5/bOFNHFPzMTdAhoP2xp2tXaDDlGN
vE8fQsfGEZP3kSbmvduIguy7Q2ZP47oE2QFNZ/wOa8yBgVWmOT2emXwjgGMnI5UsE8XAD5R3zr3U
zgKmosmarveZSwCs0jWQeY/DfIweoA9WqpzAuA5qdGggFRsTFuuJY2oyQf0LWYfYpZp5ISGqHt0C
uZWr8HQUSbc4arq5ZoinEY7laR7Pcc61lQr7o56wkeiour17eHmEIYqf7tQRtLq6+W7KccAlYrSq
qqra9P4xwejC3xsX2mgG1ddTfH3j+KzSzkfOBopV1ZEKaBJSTcy4hYnH5rwxFwJWNqwwpkwnWm7v
bz6b2a6NQAaHRklZbsL5/fUJD22T1zv7J6joENYW7Ag2u0BryzOmGnepI99bS1mHrjtHfg0stKg7
78TC/hnn4L8e7vY3aH0CXf/19Lj7awf/2D1e//777/+e1we5/VK5lNFvzlU1Cfyw9XznX/oM++hu
dlSle1DazTeUcfWOWb089sCTbzYKA1y02pD5pFvTprU8rxSUGuaonuQ8JGuftYyI4FGiNE1ogQx9
jWNG73njCcg7V1GjYLN06MoTMN2a+zsrwrNu939M7XRzQn5VwDHSXCxNbzxkSoQ0u0SCMIzb0Jf4
8A2LWt05HliHa3VGPk8BwgUcYrbLscHD/lAS3Nerx6sjFN2u8UreU57wep+RtVznWPfwOLSRyDM8
A0mDY090rA+J6ARel2PE0My2RT3YeLeqGFQ8kG9BIvcDTIGgwoqZtPMAaevfI9DzCp41LEBi5Dxv
oVkUz6xGJEHpiHQw4ktwAn5cHJt4bw0hUH5mPVt1zESrq+4gAQ9XaldDCteBmVPRCkAGx9syvpN4
l13GF13Fbe+SArxC8xtHIkn7UmmIh7HLRtQrnkbfTaR6eKwC1KYsSOiEbYEPMQ4Jut/SmCMlyPBl
56ps8fihKsW4KqXmYLzYwalb1Rrb3JdulNyUVfIc7waR3mL38AcvYsfYjl7HjaJGx0X0UDUPETqx
8FaO7ZZXn77qcysaCf1jyh3t4Dw+M4VqpMb2wiZZLnPn/mvqCQ0VxzoACSJN6pU9larhjoyh4JyE
u4HF7PdEtXVcL623DtpS1O2q8heIRuiLDWeyImD8MMfAaSiuh2v0r+GiBPYp8IFWfSDZmNWkdrgt
j/I1vYhTIjSHh/RQfiTDg6u3lyIwTn93200lTjM+tpwNT8Xvy7mMcaw7AVyzDjFNvTrttwR8lh4j
Rtte71Sk2nBZ6Z6kJhFtF+4h2dx3JnrmyAZBqPHc2k4kxsMIUuqmi5wePXBUOc2otzS+OfyVC5Nb
QZlknOv/8XTGK9yqGYfIuXCpUpqsMD3H+2WnwtIx5Nacq6APulr2PHNu180b92738IiyGmob8e1/
dvdX34045ZNCvY4r04hcqaygHwJYMyNbHQUEf6jDysVXfBxElZu77JnegzI+CZd6k9Loc5vNUPsp
UmU2+qXbV9XKK2yk8aSbu9s/d/d317xyVaMf/uhosaGJ4C7FgEghTV6KW0KxF5DgQTt4d2oXKwtM
mKauPlhOQi6ANeqM5tPKXMUndHLPRSTzIZWChCW6O2mfJ3Hte4B9wCbZwubzqynabFAPPgwSO4L7
EVVkCpzlB4vZFoHbpyjJxvOa3+04RqLJL4K6LVLUHfr6W/xfh04YNpyF13jxsRIJSAFwCmK4lDd/
7d6o/4wXFn9ZOJuK3UD/A0OuRB2JOgIA
--===============6801780860560384880==--

