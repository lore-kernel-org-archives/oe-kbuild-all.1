Content-Type: multipart/mixed; boundary="===============2377816655057787455=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/accessibility/speakup/speakup_acntpc.c:262:28: sparse: sparse: cast removes address space '__iomem' of expression
Date: Sat, 02 Jan 2021 09:49:27 +0800
Message-ID: <202101020915.w360QYsI-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2377816655057787455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eda809aef53426d044b519405d25d9da55319b76
commit: 2067fd92d75b6d9085a43caf050bca5d88c491b8 staging/speakup: Move out =
of staging
date:   5 months ago
config: riscv-randconfig-s031-20210102 (attached as .config)
compiler: riscv32-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-184-g1b896707-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2067fd92d75b6d9085a43caf050bca5d88c491b8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2067fd92d75b6d9085a43caf050bca5d88c491b8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> drivers/accessibility/speakup/speakup_acntpc.c:262:28: sparse: sparse: c=
ast removes address space '__iomem' of expression
>> drivers/accessibility/speakup/speakup_acntpc.c:262:28: sparse: sparse: i=
ncorrect type in argument 1 (different address spaces) @@     expected void=
 const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/speakup_acntpc.c:262:28: sparse:     expec=
ted void const volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/speakup_acntpc.c:262:28: sparse:     got v=
oid *
   drivers/accessibility/speakup/speakup_acntpc.c:273:36: sparse: sparse: c=
ast removes address space '__iomem' of expression
   drivers/accessibility/speakup/speakup_acntpc.c:273:36: sparse: sparse: i=
ncorrect type in argument 1 (different address spaces) @@     expected void=
 const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/speakup_acntpc.c:273:36: sparse:     expec=
ted void const volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/speakup_acntpc.c:273:36: sparse:     got v=
oid *
   drivers/accessibility/speakup/speakup_acntpc.c: note: in included file (=
through arch/riscv/include/asm/io.h, include/linux/io.h, drivers/accessibil=
ity/speakup/spk_types.h, ...):
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:580:9: sparse: sparse: cast removes address spa=
ce '__iomem' of expression
   include/asm-generic/io.h:580:9: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] __i=
omem *addr @@     got void * @@
   include/asm-generic/io.h:580:9: sparse:     expected void volatile [node=
ref] __iomem *addr
   include/asm-generic/io.h:580:9: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:580:9: sparse: sparse: cast removes address spa=
ce '__iomem' of expression
   include/asm-generic/io.h:580:9: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] __i=
omem *addr @@     got void * @@
   include/asm-generic/io.h:580:9: sparse:     expected void volatile [node=
ref] __iomem *addr
   include/asm-generic/io.h:580:9: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:580:9: sparse: sparse: cast removes address spa=
ce '__iomem' of expression
   include/asm-generic/io.h:580:9: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] __i=
omem *addr @@     got void * @@
   include/asm-generic/io.h:580:9: sparse:     expected void volatile [node=
ref] __iomem *addr
   include/asm-generic/io.h:580:9: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:580:9: sparse: sparse: cast removes address spa=
ce '__iomem' of expression
   include/asm-generic/io.h:580:9: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] __i=
omem *addr @@     got void * @@
   include/asm-generic/io.h:580:9: sparse:     expected void volatile [node=
ref] __iomem *addr
   include/asm-generic/io.h:580:9: sparse:     got void *
   include/asm-generic/io.h:580:9: sparse: sparse: cast removes address spa=
ce '__iomem' of expression
   include/asm-generic/io.h:580:9: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] __i=
omem *addr @@     got void * @@
   include/asm-generic/io.h:580:9: sparse:     expected void volatile [node=
ref] __iomem *addr
   include/asm-generic/io.h:580:9: sparse:     got void *
--
>> drivers/accessibility/speakup/speakup_keypc.c:268:28: sparse: sparse: ca=
st removes address space '__iomem' of expression
>> drivers/accessibility/speakup/speakup_keypc.c:268:28: sparse: sparse: in=
correct type in argument 1 (different address spaces) @@     expected void =
const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/speakup_keypc.c:268:28: sparse:     expect=
ed void const volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/speakup_keypc.c:268:28: sparse:     got vo=
id *
   drivers/accessibility/speakup/speakup_keypc.c:278:36: sparse: sparse: ca=
st removes address space '__iomem' of expression
   drivers/accessibility/speakup/speakup_keypc.c:278:36: sparse: sparse: in=
correct type in argument 1 (different address spaces) @@     expected void =
const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/speakup_keypc.c:278:36: sparse:     expect=
ed void const volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/speakup_keypc.c:278:36: sparse:     got vo=
id *
   drivers/accessibility/speakup/speakup_keypc.c: note: in included file (t=
hrough arch/riscv/include/asm/io.h, include/linux/io.h, drivers/accessibili=
ty/speakup/spk_types.h, ...):
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:580:9: sparse: sparse: cast removes address spa=
ce '__iomem' of expression
   include/asm-generic/io.h:580:9: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] __i=
omem *addr @@     got void * @@
   include/asm-generic/io.h:580:9: sparse:     expected void volatile [node=
ref] __iomem *addr
   include/asm-generic/io.h:580:9: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:580:9: sparse: sparse: cast removes address spa=
ce '__iomem' of expression
   include/asm-generic/io.h:580:9: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] __i=
omem *addr @@     got void * @@
   include/asm-generic/io.h:580:9: sparse:     expected void volatile [node=
ref] __iomem *addr
   include/asm-generic/io.h:580:9: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:580:9: sparse: sparse: cast removes address spa=
ce '__iomem' of expression
   include/asm-generic/io.h:580:9: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] __i=
omem *addr @@     got void * @@
   include/asm-generic/io.h:580:9: sparse:     expected void volatile [node=
ref] __iomem *addr
   include/asm-generic/io.h:580:9: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:580:9: sparse: sparse: cast removes address spa=
ce '__iomem' of expression
   include/asm-generic/io.h:580:9: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] __i=
omem *addr @@     got void * @@
   include/asm-generic/io.h:580:9: sparse:     expected void volatile [node=
ref] __iomem *addr
   include/asm-generic/io.h:580:9: sparse:     got void *
   include/asm-generic/io.h:580:9: sparse: sparse: cast removes address spa=
ce '__iomem' of expression
   include/asm-generic/io.h:580:9: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] __i=
omem *addr @@     got void * @@
   include/asm-generic/io.h:580:9: sparse:     expected void volatile [node=
ref] __iomem *addr
   include/asm-generic/io.h:580:9: sparse:     got void *
--
>> drivers/accessibility/speakup/serialio.c:139:9: sparse: sparse: cast rem=
oves address space '__iomem' of expression
>> drivers/accessibility/speakup/serialio.c:139:9: sparse: sparse: incorrec=
t type in argument 2 (different address spaces) @@     expected void volati=
le [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:139:9: sparse:     expected voi=
d volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:139:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:142:9: sparse: sparse: cast rem=
oves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:142:9: sparse: sparse: incorrec=
t type in argument 2 (different address spaces) @@     expected void volati=
le [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:142:9: sparse:     expected voi=
d volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:142:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:144:9: sparse: sparse: cast rem=
oves address space '__iomem' of expression
>> drivers/accessibility/speakup/serialio.c:144:9: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected void const =
volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:144:9: sparse:     expected voi=
d const volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:144:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:145:9: sparse: sparse: cast rem=
oves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:145:9: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected void const =
volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:145:9: sparse:     expected voi=
d const volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:145:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:146:9: sparse: sparse: cast rem=
oves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:146:9: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected void const =
volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:146:9: sparse:     expected voi=
d const volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:146:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:147:9: sparse: sparse: cast rem=
oves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:147:9: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected void const =
volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:147:9: sparse:     expected voi=
d const volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:147:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:148:9: sparse: sparse: cast rem=
oves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:148:9: sparse: sparse: incorrec=
t type in argument 2 (different address spaces) @@     expected void volati=
le [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:148:9: sparse:     expected voi=
d volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:148:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:155:16: sparse: sparse: cast re=
moves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:155:16: sparse: sparse: incorre=
ct type in argument 1 (different address spaces) @@     expected void const=
 volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:155:16: sparse:     expected vo=
id const volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:155:16: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:160:9: sparse: sparse: cast rem=
oves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:160:9: sparse: sparse: incorrec=
t type in argument 2 (different address spaces) @@     expected void volati=
le [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:160:9: sparse:     expected voi=
d volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:160:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:165:19: sparse: sparse: cast re=
moves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:165:19: sparse: sparse: incorre=
ct type in argument 1 (different address spaces) @@     expected void const=
 volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:165:19: sparse:     expected vo=
id const volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:165:19: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:167:9: sparse: sparse: cast rem=
oves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:167:9: sparse: sparse: incorrec=
t type in argument 2 (different address spaces) @@     expected void volati=
le [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:167:9: sparse:     expected voi=
d volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:167:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:87:9: sparse: sparse: cast remo=
ves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:87:9: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:87:9: sparse:     expected void=
 volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:87:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:88:9: sparse: sparse: cast remo=
ves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:88:9: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:88:9: sparse:     expected void=
 volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:88:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:89:9: sparse: sparse: cast remo=
ves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:89:9: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:89:9: sparse:     expected void=
 volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:89:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:90:9: sparse: sparse: cast remo=
ves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:90:9: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:90:9: sparse:     expected void=
 volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:90:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:93:9: sparse: sparse: cast remo=
ves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:93:9: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:93:9: sparse:     expected void=
 volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:93:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:94:9: sparse: sparse: cast remo=
ves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:94:9: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void volatil=
e [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:94:9: sparse:     expected void=
 volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:94:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:97:13: sparse: sparse: cast rem=
oves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:97:13: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected void const =
volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:97:13: sparse:     expected voi=
d const volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:97:13: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:208:9: sparse: sparse: cast rem=
oves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:208:9: sparse: sparse: incorrec=
t type in argument 2 (different address spaces) @@     expected void volati=
le [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:208:9: sparse:     expected voi=
d volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:208:9: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:230:16: sparse: sparse: cast re=
moves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:230:16: sparse: sparse: incorre=
ct type in argument 1 (different address spaces) @@     expected void const=
 volatile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:230:16: sparse:     expected vo=
id const volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:230:16: sparse:     got void *
   drivers/accessibility/speakup/serialio.c:299:25: sparse: sparse: cast re=
moves address space '__iomem' of expression
   drivers/accessibility/speakup/serialio.c:299:25: sparse: sparse: incorre=
ct type in argument 2 (different address spaces) @@     expected void volat=
ile [noderef] __iomem *addr @@     got void * @@
   drivers/accessibility/speakup/serialio.c:299:25: sparse:     expected vo=
id volatile [noderef] __iomem *addr
   drivers/accessibility/speakup/serialio.c:299:25: sparse:     got void *
   drivers/accessibility/speakup/serialio.c: note: in included file (throug=
h arch/riscv/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...=
):
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:580:9: sparse: sparse: cast removes address spa=
ce '__iomem' of expression
   include/asm-generic/io.h:580:9: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] __i=
omem *addr @@     got void * @@
   include/asm-generic/io.h:580:9: sparse:     expected void volatile [node=
ref] __iomem *addr
   include/asm-generic/io.h:580:9: sparse:     got void *
   include/asm-generic/io.h:580:9: sparse: sparse: cast removes address spa=
ce '__iomem' of expression
   include/asm-generic/io.h:580:9: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void volatile [noderef] __i=
omem *addr @@     got void * @@
   include/asm-generic/io.h:580:9: sparse:     expected void volatile [node=
ref] __iomem *addr
   include/asm-generic/io.h:580:9: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression
   include/asm-generic/io.h:556:16: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const volatile [noder=
ef] __iomem *addr @@     got void * @@
   include/asm-generic/io.h:556:16: sparse:     expected void const volatil=
e [noderef] __iomem *addr
   include/asm-generic/io.h:556:16: sparse:     got void *
   include/asm-generic/io.h:556:16: sparse: sparse: cast removes address sp=
ace '__iomem' of expression

vim +/__iomem +262 drivers/accessibility/speakup/speakup_acntpc.c

c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  246  =

c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  247  static int synth_probe(struct spk_synth *synth)
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  248  {
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  249  	unsigned int port_val =3D 0;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  250  	int i =3D 0;
8e69a8110686572 drivers/staging/speakup/speakup_acntpc.c Domagoj Trsan     =
  2014-09-09  251  =

c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  252  	pr_info("Probing for %s.\n", synth->long_name);
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  253  	if (port_forced) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  254  		speakup_info.port_tts =3D port_forced;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  255  		pr_info("probe forced to %x by kernel command line\n",
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  256  			speakup_info.port_tts);
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  257  		if (synth_request_region(speakup_info.port_tts - 1,
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  258  					 SYNTH_IO_EXTENT)) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  259  			pr_warn("sorry, port already reserved\n");
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  260  			return -EBUSY;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  261  		}
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07 @262  		port_val =3D inw(speakup_info.port_tts - 1);
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  263  		synth_port_control =3D speakup_info.port_tts - 1;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  264  	} else {
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  265  		for (i =3D 0; synth_portlist[i]; i++) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  266  			if (synth_request_region(synth_portlist[i],
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  267  						 SYNTH_IO_EXTENT)) {
bf4a4bacb051c27 drivers/staging/speakup/speakup_acntpc.c Christopher Branno=
n 2010-10-14  268  				pr_warn
bf4a4bacb051c27 drivers/staging/speakup/speakup_acntpc.c Christopher Branno=
n 2010-10-14  269  				    ("request_region: failed with 0x%x, %d\n",
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  270  				     synth_portlist[i], SYNTH_IO_EXTENT);
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  271  				continue;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  272  			}
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  273  			port_val =3D inw(synth_portlist[i]) & 0xfffc;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  274  			if (port_val =3D=3D 0x53fc) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  275  				/* 'S' and out&input bits */
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  276  				synth_port_control =3D synth_portlist[i];
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  277  				speakup_info.port_tts =3D synth_port_control + 1;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  278  				break;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  279  			}
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  280  		}
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  281  	}
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  282  	port_val &=3D 0xfffc;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  283  	if (port_val !=3D 0x53fc) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  284  		/* 'S' and out&input bits */
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  285  		pr_info("%s: not found\n", synth->long_name);
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  286  		synth_release_region(synth_port_control, SYNTH_IO_EXTE=
NT);
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  287  		synth_port_control =3D 0;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  288  		return -ENODEV;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  289  	}
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  290  	pr_info("%s: %03x-%03x, driver version %s,\n", synth->l=
ong_name,
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  291  		synth_port_control, synth_port_control + SYNTH_IO_EXTE=
NT - 1,
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  292  		synth->version);
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  293  	synth->alive =3D 1;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  294  	return 0;
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  295  }
c6e3fd22cd53836 drivers/staging/speakup/speakup_acntpc.c William Hubbs     =
  2010-10-07  296  =


:::::: The code at line 262 was first introduced by commit
:::::: c6e3fd22cd538365bfeb82997d5b89562e077d42 Staging: add speakup to the=
 staging directory

:::::: TO: William Hubbs <w.d.hubbs@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2377816655057787455==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2377816655057787455==--

