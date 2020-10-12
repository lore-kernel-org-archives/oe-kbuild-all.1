Content-Type: multipart/mixed; boundary="===============5312057897515548895=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [sashal-linux-stable:queue-4.4 36/38] net/rxrpc/ar-key.c:1188:25: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Mon, 12 Oct 2020 13:51:25 +0800
Message-ID: <202010121322.l8ZngKF3-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5312057897515548895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git queue-4.4
head:   038c4f6683920927a5b8b66a07e47a2cb7c927ce
commit: 565b3e6accc8a5eb9894ef503f54e7bbffa7d616 [36/38] rxrpc: Fix rxkad t=
oken xdr encoding
config: c6x-randconfig-s031-20201012 (attached as .config)
compiler: c6x-elf-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-229-g0c6896f4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stab=
le.git/commit/?id=3D565b3e6accc8a5eb9894ef503f54e7bbffa7d616
        git remote add sashal-linux-stable https://git.kernel.org/pub/scm/l=
inux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-linux-stable queue-4.4
        git checkout 565b3e6accc8a5eb9894ef503f54e7bbffa7d616
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-7.5.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dc6x =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   net/rxrpc/ar-key.c:1173:9: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected void *__p @@     got restricted=
 __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1173:9: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1173:9: sparse:     got restricted __be32 [noderef] [=
usertype] <asn:1> *
   net/rxrpc/ar-key.c:1173:9: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] <a=
sn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1173:9: sparse:     expected void const volatile [nod=
eref] <asn:1> *
   net/rxrpc/ar-key.c:1173:9: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1173:9: sparse: sparse: incorrect type in argument 2 =
(different address spaces) @@     expected void [noderef] <asn:1> *ptr @@  =
   got restricted __be32 * @@
   net/rxrpc/ar-key.c:1173:9: sparse:     expected void [noderef] <asn:1> *=
ptr
   net/rxrpc/ar-key.c:1173:9: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1174:9: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected void *__p @@     got restricted=
 __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1174:9: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1174:9: sparse:     got restricted __be32 [noderef] [=
usertype] <asn:1> *
   net/rxrpc/ar-key.c:1174:9: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] <a=
sn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1174:9: sparse:     expected void const volatile [nod=
eref] <asn:1> *
   net/rxrpc/ar-key.c:1174:9: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1174:9: sparse: sparse: incorrect type in argument 2 =
(different address spaces) @@     expected void [noderef] <asn:1> *ptr @@  =
   got restricted __be32 * @@
   net/rxrpc/ar-key.c:1174:9: sparse:     expected void [noderef] <asn:1> *=
ptr
   net/rxrpc/ar-key.c:1174:9: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1175:9: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected void *__p @@     got restricted=
 __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1175:9: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1175:9: sparse:     got restricted __be32 [noderef] [=
usertype] <asn:1> *
   net/rxrpc/ar-key.c:1175:9: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const volatile [noderef] <a=
sn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1175:9: sparse:     expected void const volatile [nod=
eref] <asn:1> *
   net/rxrpc/ar-key.c:1175:9: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1175:9: sparse: sparse: incorrect type in argument 2 =
(different address spaces) @@     expected void [noderef] <asn:1> *ptr @@  =
   got restricted __be32 * @@
   net/rxrpc/ar-key.c:1175:9: sparse:     expected void [noderef] <asn:1> *=
ptr
   net/rxrpc/ar-key.c:1175:9: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1180:17: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1180:17: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1180:17: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1180:17: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1180:17: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1180:17: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1180:17: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1180:17: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1180:17: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1182:17: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1182:17: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1182:17: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1182:17: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1182:17: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1182:17: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1182:17: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1182:17: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1182:17: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1186:25: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1186:25: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1186:25: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1186:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1186:25: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1186:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1186:25: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1186:25: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1186:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1187:25: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1187:25: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1187:25: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1187:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1187:25: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1187:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1187:25: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1187:25: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1187:25: sparse:     got restricted __be32 *
>> net/rxrpc/ar-key.c:1188:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void *to @@     got restricted =
__be32 [noderef] [usertype] <asn:1> *[assigned] xdr @@
>> net/rxrpc/ar-key.c:1188:25: sparse:     expected void *to
   net/rxrpc/ar-key.c:1188:25: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *[assigned] xdr
   net/rxrpc/ar-key.c:1188:25: sparse: sparse: cast removes address space '=
<asn:1>' of expression
   net/rxrpc/ar-key.c:1189:25: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1189:25: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1189:25: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1189:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1189:25: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1189:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1189:25: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1189:25: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1189:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1190:25: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1190:25: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1190:25: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1190:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1190:25: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1190:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1190:25: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1190:25: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1190:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1191:25: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1191:25: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1191:25: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1191:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1191:25: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1191:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1191:25: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1191:25: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1191:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1192:25: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1192:25: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1192:25: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1192:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1192:25: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1192:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1192:25: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1192:25: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1192:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1197:25: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1197:25: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1197:25: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1197:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1197:25: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1197:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1197:25: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1197:25: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1197:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1199:33: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1199:33: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1199:33: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1199:33: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1199:33: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1199:33: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1199:33: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1199:33: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1199:33: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1200:25: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1200:25: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1200:25: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1200:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1200:25: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1200:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1200:25: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1200:25: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1200:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1203:25: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1203:25: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1203:25: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1203:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1203:25: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1203:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1203:25: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1203:25: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1203:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1205:33: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1205:33: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1205:33: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1205:33: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1205:33: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1205:33: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1205:33: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1205:33: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1205:33: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1206:25: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1206:25: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1206:25: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1206:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1206:25: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1206:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1206:25: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1206:25: sparse:     expected void [noderef] <asn:1> =
*ptr
   net/rxrpc/ar-key.c:1206:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1208:25: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected void *__p @@     got restricte=
d __be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/ar-key.c:1208:25: sparse:     expected void *__p
   net/rxrpc/ar-key.c:1208:25: sparse:     got restricted __be32 [noderef] =
[usertype] <asn:1> *
   net/rxrpc/ar-key.c:1208:25: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const volatile [noderef] <=
asn:1> * @@     got restricted __be32 * @@
   net/rxrpc/ar-key.c:1208:25: sparse:     expected void const volatile [no=
deref] <asn:1> *
   net/rxrpc/ar-key.c:1208:25: sparse:     got restricted __be32 *
   net/rxrpc/ar-key.c:1208:25: sparse: sparse: incorrect type in argument 2=
 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@ =
    got restricted __be32 * @@
   net/rxrpc/ar-key.c:1208:25: sparse:     expected void [noderef] <asn:1> =
*ptr

vim +1188 net/rxrpc/ar-key.c

  1129	=

  1130		if (!buffer || buflen < size)
  1131			return size;
  1132	=

  1133		xdr =3D (__be32 __user *) buffer;
  1134		zero =3D 0;
  1135	#define ENCODE(x)				\
  1136		do {					\
  1137			__be32 y =3D htonl(x);		\
  1138			if (put_user(y, xdr++) < 0)	\
  1139				goto fault;		\
  1140		} while(0)
  1141	#define ENCODE_DATA(l, s)						\
  1142		do {								\
  1143			u32 _l =3D (l);						\
  1144			ENCODE(l);						\
  1145			if (copy_to_user(xdr, (s), _l) !=3D 0)			\
  1146				goto fault;					\
  1147			if (_l & 3 &&						\
  1148			    copy_to_user((u8 __user *)xdr + _l, &zero, 4 - (_l & 3)) !=3D =
0) \
  1149				goto fault;					\
  1150			xdr +=3D (_l + 3) >> 2;					\
  1151		} while(0)
  1152	#define ENCODE_BYTES(l, s)						\
  1153		do {								\
  1154			u32 _l =3D (l);						\
  1155			memcpy(xdr, (s), _l);					\
  1156			if (_l & 3)						\
  1157				memcpy((u8 *)xdr + _l, &zero, 4 - (_l & 3));	\
  1158			xdr +=3D (_l + 3) >> 2;					\
  1159		} while(0)
  1160	#define ENCODE64(x)					\
  1161		do {						\
  1162			__be64 y =3D cpu_to_be64(x);		\
  1163			if (copy_to_user(xdr, &y, 8) !=3D 0)	\
  1164				goto fault;			\
  1165			xdr +=3D 8 >> 2;				\
  1166		} while(0)
  1167	#define ENCODE_STR(s)				\
  1168		do {					\
  1169			const char *_s =3D (s);		\
  1170			ENCODE_DATA(strlen(_s), _s);	\
  1171		} while(0)
  1172	=

  1173		ENCODE(0);					/* flags */
  1174		ENCODE_DATA(cnlen, key->description + 4);	/* cellname */
  1175		ENCODE(ntoks);
  1176	=

  1177		tok =3D 0;
  1178		for (token =3D key->payload.data[0]; token; token =3D token->next) {
  1179			toksize =3D toksizes[tok++];
  1180			ENCODE(toksize);
  1181			oldxdr =3D xdr;
  1182			ENCODE(token->security_index);
  1183	=

  1184			switch (token->security_index) {
  1185			case RXRPC_SECURITY_RXKAD:
  1186				ENCODE(token->kad->vice_id);
  1187				ENCODE(token->kad->kvno);
> 1188				ENCODE_BYTES(8, token->kad->session_key);
  1189				ENCODE(token->kad->start);
  1190				ENCODE(token->kad->expiry);
  1191				ENCODE(token->kad->primary_flag);
  1192				ENCODE_DATA(token->kad->ticket_len, token->kad->ticket);
  1193				break;
  1194	=

  1195			case RXRPC_SECURITY_RXK5:
  1196				princ =3D &token->k5->client;
  1197				ENCODE(princ->n_name_parts);
  1198				for (loop =3D 0; loop < princ->n_name_parts; loop++)
  1199					ENCODE_STR(princ->name_parts[loop]);
  1200				ENCODE_STR(princ->realm);
  1201	=

  1202				princ =3D &token->k5->server;
  1203				ENCODE(princ->n_name_parts);
  1204				for (loop =3D 0; loop < princ->n_name_parts; loop++)
  1205					ENCODE_STR(princ->name_parts[loop]);
  1206				ENCODE_STR(princ->realm);
  1207	=

  1208				ENCODE(token->k5->session.tag);
  1209				ENCODE_DATA(token->k5->session.data_len,
  1210					    token->k5->session.data);
  1211	=

  1212				ENCODE64(token->k5->authtime);
  1213				ENCODE64(token->k5->starttime);
  1214				ENCODE64(token->k5->endtime);
  1215				ENCODE64(token->k5->renew_till);
  1216				ENCODE(token->k5->is_skey);
  1217				ENCODE(token->k5->flags);
  1218	=

  1219				ENCODE(token->k5->n_addresses);
  1220				for (loop =3D 0; loop < token->k5->n_addresses; loop++) {
  1221					ENCODE(token->k5->addresses[loop].tag);
  1222					ENCODE_DATA(token->k5->addresses[loop].data_len,
  1223						    token->k5->addresses[loop].data);
  1224				}
  1225	=

  1226				ENCODE_DATA(token->k5->ticket_len, token->k5->ticket);
  1227				ENCODE_DATA(token->k5->ticket2_len, token->k5->ticket2);
  1228	=

  1229				ENCODE(token->k5->n_authdata);
  1230				for (loop =3D 0; loop < token->k5->n_authdata; loop++) {
  1231					ENCODE(token->k5->authdata[loop].tag);
  1232					ENCODE_DATA(token->k5->authdata[loop].data_len,
  1233						    token->k5->authdata[loop].data);
  1234				}
  1235				break;
  1236	=

  1237			default:
  1238				BUG();
  1239				break;
  1240			}
  1241	=

  1242			ASSERTCMP((unsigned long)xdr - (unsigned long)oldxdr, =3D=3D,
  1243				  toksize);
  1244		}
  1245	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5312057897515548895==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5312057897515548895==--

