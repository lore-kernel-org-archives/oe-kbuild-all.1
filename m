Content-Type: multipart/mixed; boundary="===============2909345695826610472=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [sashal-linux-stable:queue-4.9 48/52] net/rxrpc/key.c:1178:25: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Mon, 12 Oct 2020 16:27:34 +0800
Message-ID: <202010121631.MDSbxqMn-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2909345695826610472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git queue-4.9
head:   91bcc1f20a7d6d0b432ac5e99448bcfd95399cd5
commit: fa1c8371b76bda5f35f417cff96ebbc37283e19d [48/52] rxrpc: Fix rxkad t=
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
le.git/commit/?id=3Dfa1c8371b76bda5f35f417cff96ebbc37283e19d
        git remote add sashal-linux-stable https://git.kernel.org/pub/scm/l=
inux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-linux-stable queue-4.9
        git checkout fa1c8371b76bda5f35f417cff96ebbc37283e19d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-7.5.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dc6x =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   net/rxrpc/key.c:1163:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void *__p @@     got restricted __=
be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1163:9: sparse:     expected void *__p
   net/rxrpc/key.c:1163:9: sparse:     got restricted __be32 [noderef] [use=
rtype] <asn:1> *
   net/rxrpc/key.c:1163:9: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] <asn:=
1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1163:9: sparse:     expected void const volatile [nodere=
f] <asn:1> *
   net/rxrpc/key.c:1163:9: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1163:9: sparse: sparse: incorrect type in argument 2 (di=
fferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@     =
got restricted __be32 * @@
   net/rxrpc/key.c:1163:9: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1163:9: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1164:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void *__p @@     got restricted __=
be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1164:9: sparse:     expected void *__p
   net/rxrpc/key.c:1164:9: sparse:     got restricted __be32 [noderef] [use=
rtype] <asn:1> *
   net/rxrpc/key.c:1164:9: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] <asn:=
1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1164:9: sparse:     expected void const volatile [nodere=
f] <asn:1> *
   net/rxrpc/key.c:1164:9: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1164:9: sparse: sparse: incorrect type in argument 2 (di=
fferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@     =
got restricted __be32 * @@
   net/rxrpc/key.c:1164:9: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1164:9: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1165:9: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected void *__p @@     got restricted __=
be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1165:9: sparse:     expected void *__p
   net/rxrpc/key.c:1165:9: sparse:     got restricted __be32 [noderef] [use=
rtype] <asn:1> *
   net/rxrpc/key.c:1165:9: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const volatile [noderef] <asn:=
1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1165:9: sparse:     expected void const volatile [nodere=
f] <asn:1> *
   net/rxrpc/key.c:1165:9: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1165:9: sparse: sparse: incorrect type in argument 2 (di=
fferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@     =
got restricted __be32 * @@
   net/rxrpc/key.c:1165:9: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1165:9: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1170:17: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1170:17: sparse:     expected void *__p
   net/rxrpc/key.c:1170:17: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1170:17: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1170:17: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1170:17: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1170:17: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1170:17: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1170:17: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1172:17: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1172:17: sparse:     expected void *__p
   net/rxrpc/key.c:1172:17: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1172:17: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1172:17: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1172:17: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1172:17: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1172:17: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1172:17: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1176:25: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1176:25: sparse:     expected void *__p
   net/rxrpc/key.c:1176:25: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1176:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1176:25: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1176:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1176:25: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1176:25: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1176:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1177:25: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1177:25: sparse:     expected void *__p
   net/rxrpc/key.c:1177:25: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1177:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1177:25: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1177:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1177:25: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1177:25: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1177:25: sparse:     got restricted __be32 *
>> net/rxrpc/key.c:1178:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void *to @@     got restricted __b=
e32 [noderef] [usertype] <asn:1> *[assigned] xdr @@
>> net/rxrpc/key.c:1178:25: sparse:     expected void *to
>> net/rxrpc/key.c:1178:25: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *[assigned] xdr
>> net/rxrpc/key.c:1178:25: sparse: sparse: cast removes address space '<as=
n:1>' of expression
   net/rxrpc/key.c:1179:25: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1179:25: sparse:     expected void *__p
   net/rxrpc/key.c:1179:25: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1179:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1179:25: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1179:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1179:25: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1179:25: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1179:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1180:25: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1180:25: sparse:     expected void *__p
   net/rxrpc/key.c:1180:25: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1180:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1180:25: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1180:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1180:25: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1180:25: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1180:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1181:25: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1181:25: sparse:     expected void *__p
   net/rxrpc/key.c:1181:25: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1181:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1181:25: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1181:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1181:25: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1181:25: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1181:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1182:25: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1182:25: sparse:     expected void *__p
   net/rxrpc/key.c:1182:25: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1182:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1182:25: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1182:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1182:25: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1182:25: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1182:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1187:25: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1187:25: sparse:     expected void *__p
   net/rxrpc/key.c:1187:25: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1187:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1187:25: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1187:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1187:25: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1187:25: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1187:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1189:33: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1189:33: sparse:     expected void *__p
   net/rxrpc/key.c:1189:33: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1189:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1189:33: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1189:33: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1189:33: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1189:33: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1189:33: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1190:25: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1190:25: sparse:     expected void *__p
   net/rxrpc/key.c:1190:25: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1190:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1190:25: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1190:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1190:25: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1190:25: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1190:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1193:25: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1193:25: sparse:     expected void *__p
   net/rxrpc/key.c:1193:25: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1193:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1193:25: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1193:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1193:25: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1193:25: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1193:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1195:33: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1195:33: sparse:     expected void *__p
   net/rxrpc/key.c:1195:33: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1195:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1195:33: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1195:33: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1195:33: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1195:33: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1195:33: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1196:25: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1196:25: sparse:     expected void *__p
   net/rxrpc/key.c:1196:25: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1196:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1196:25: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1196:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1196:25: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1196:25: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1196:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1198:25: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@
   net/rxrpc/key.c:1198:25: sparse:     expected void *__p
   net/rxrpc/key.c:1198:25: sparse:     got restricted __be32 [noderef] [us=
ertype] <asn:1> *
   net/rxrpc/key.c:1198:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile [noderef] <asn=
:1> * @@     got restricted __be32 * @@
   net/rxrpc/key.c:1198:25: sparse:     expected void const volatile [noder=
ef] <asn:1> *
   net/rxrpc/key.c:1198:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1198:25: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected void [noderef] <asn:1> *ptr @@    =
 got restricted __be32 * @@
   net/rxrpc/key.c:1198:25: sparse:     expected void [noderef] <asn:1> *ptr
   net/rxrpc/key.c:1198:25: sparse:     got restricted __be32 *
   net/rxrpc/key.c:1199:25: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected void *__p @@     got restricted _=
_be32 [noderef] [usertype] <asn:1> * @@

vim +1178 net/rxrpc/key.c

  1119	=

  1120		if (!buffer || buflen < size)
  1121			return size;
  1122	=

  1123		xdr =3D (__be32 __user *) buffer;
  1124		zero =3D 0;
  1125	#define ENCODE(x)				\
  1126		do {					\
  1127			__be32 y =3D htonl(x);		\
  1128			if (put_user(y, xdr++) < 0)	\
  1129				goto fault;		\
  1130		} while(0)
  1131	#define ENCODE_DATA(l, s)						\
  1132		do {								\
  1133			u32 _l =3D (l);						\
  1134			ENCODE(l);						\
  1135			if (copy_to_user(xdr, (s), _l) !=3D 0)			\
  1136				goto fault;					\
  1137			if (_l & 3 &&						\
  1138			    copy_to_user((u8 __user *)xdr + _l, &zero, 4 - (_l & 3)) !=3D =
0) \
  1139				goto fault;					\
  1140			xdr +=3D (_l + 3) >> 2;					\
  1141		} while(0)
  1142	#define ENCODE_BYTES(l, s)						\
  1143		do {								\
  1144			u32 _l =3D (l);						\
  1145			memcpy(xdr, (s), _l);					\
  1146			if (_l & 3)						\
  1147				memcpy((u8 *)xdr + _l, &zero, 4 - (_l & 3));	\
  1148			xdr +=3D (_l + 3) >> 2;					\
  1149		} while(0)
  1150	#define ENCODE64(x)					\
  1151		do {						\
  1152			__be64 y =3D cpu_to_be64(x);		\
  1153			if (copy_to_user(xdr, &y, 8) !=3D 0)	\
  1154				goto fault;			\
  1155			xdr +=3D 8 >> 2;				\
  1156		} while(0)
  1157	#define ENCODE_STR(s)				\
  1158		do {					\
  1159			const char *_s =3D (s);		\
  1160			ENCODE_DATA(strlen(_s), _s);	\
  1161		} while(0)
  1162	=

  1163		ENCODE(0);					/* flags */
  1164		ENCODE_DATA(cnlen, key->description + 4);	/* cellname */
  1165		ENCODE(ntoks);
  1166	=

  1167		tok =3D 0;
  1168		for (token =3D key->payload.data[0]; token; token =3D token->next) {
  1169			toksize =3D toksizes[tok++];
  1170			ENCODE(toksize);
  1171			oldxdr =3D xdr;
  1172			ENCODE(token->security_index);
  1173	=

  1174			switch (token->security_index) {
  1175			case RXRPC_SECURITY_RXKAD:
  1176				ENCODE(token->kad->vice_id);
  1177				ENCODE(token->kad->kvno);
> 1178				ENCODE_BYTES(8, token->kad->session_key);
  1179				ENCODE(token->kad->start);
  1180				ENCODE(token->kad->expiry);
  1181				ENCODE(token->kad->primary_flag);
  1182				ENCODE_DATA(token->kad->ticket_len, token->kad->ticket);
  1183				break;
  1184	=

  1185			case RXRPC_SECURITY_RXK5:
  1186				princ =3D &token->k5->client;
  1187				ENCODE(princ->n_name_parts);
  1188				for (loop =3D 0; loop < princ->n_name_parts; loop++)
  1189					ENCODE_STR(princ->name_parts[loop]);
  1190				ENCODE_STR(princ->realm);
  1191	=

  1192				princ =3D &token->k5->server;
  1193				ENCODE(princ->n_name_parts);
  1194				for (loop =3D 0; loop < princ->n_name_parts; loop++)
  1195					ENCODE_STR(princ->name_parts[loop]);
  1196				ENCODE_STR(princ->realm);
  1197	=

  1198				ENCODE(token->k5->session.tag);
  1199				ENCODE_DATA(token->k5->session.data_len,
  1200					    token->k5->session.data);
  1201	=

  1202				ENCODE64(token->k5->authtime);
  1203				ENCODE64(token->k5->starttime);
  1204				ENCODE64(token->k5->endtime);
  1205				ENCODE64(token->k5->renew_till);
  1206				ENCODE(token->k5->is_skey);
  1207				ENCODE(token->k5->flags);
  1208	=

  1209				ENCODE(token->k5->n_addresses);
  1210				for (loop =3D 0; loop < token->k5->n_addresses; loop++) {
  1211					ENCODE(token->k5->addresses[loop].tag);
  1212					ENCODE_DATA(token->k5->addresses[loop].data_len,
  1213						    token->k5->addresses[loop].data);
  1214				}
  1215	=

  1216				ENCODE_DATA(token->k5->ticket_len, token->k5->ticket);
  1217				ENCODE_DATA(token->k5->ticket2_len, token->k5->ticket2);
  1218	=

  1219				ENCODE(token->k5->n_authdata);
  1220				for (loop =3D 0; loop < token->k5->n_authdata; loop++) {
  1221					ENCODE(token->k5->authdata[loop].tag);
  1222					ENCODE_DATA(token->k5->authdata[loop].data_len,
  1223						    token->k5->authdata[loop].data);
  1224				}
  1225				break;
  1226	=

  1227			default:
  1228				BUG();
  1229				break;
  1230			}
  1231	=

  1232			ASSERTCMP((unsigned long)xdr - (unsigned long)oldxdr, =3D=3D,
  1233				  toksize);
  1234		}
  1235	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2909345695826610472==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2909345695826610472==--

