Content-Type: multipart/mixed; boundary="===============0943320623522759637=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:596:48: sparse: sparse: cast removes address space '__iomem' of expression
Date: Mon, 17 May 2021 02:39:51 +0800
Message-ID: <202105170249.QeQcAXak-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0943320623522759637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   63d1cb53e26a9a4168b84a8981b225c0a9cfa235
commit: ea29b20a828511de3348334e529a3d046a180416 init/Kconfig: make COMPILE=
_TEST depend on HAS_IOMEM
date:   9 weeks ago
config: s390-randconfig-s032-20210517 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dea29b20a828511de3348334e529a3d046a180416
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ea29b20a828511de3348334e529a3d046a180416
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:596:48: sparse: spa=
rse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:646:35: sparse: spa=
rse: incorrect type in argument 1 (different address spaces) @@     expecte=
d void volatile [noderef] __iomem *addr @@     got void *hwbase @@
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:646:35: sparse:    =
 expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:646:35: sparse:    =
 got void *hwbase
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1155:21: sparse: sp=
arse: incorrect type in assignment (different address spaces) @@     expect=
ed unsigned long long [usertype] *ptr @@     got void [noderef] __iomem * @@
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1155:21: sparse:   =
  expected unsigned long long [usertype] *ptr
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1155:21: sparse:   =
  got void [noderef] __iomem *
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1180:21: sparse: sp=
arse: incorrect type in assignment (different address spaces) @@     expect=
ed unsigned long long [usertype] *ptr @@     got void [noderef] __iomem * @@
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1180:21: sparse:   =
  expected unsigned long long [usertype] *ptr
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1180:21: sparse:   =
  got void [noderef] __iomem *
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c: note: in included =
file (through arch/s390/include/asm/io.h, include/linux/io.h, include/linux=
/pci.h):
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
--
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:26:16: sparse: =
sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:29:16: sparse: =
sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:39:16: sparse: =
sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:42:16: sparse: =
sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:720:16: sparse:=
 sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c: note: in inclu=
ded file (through arch/s390/include/asm/io.h, include/linux/io.h, include/l=
inux/pci.h):
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: cast to restricted __le=
64
   include/asm-generic/io.h:193:15: sparse: sparse: too many warnings
--
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:554:31: sparse: s=
parse: incorrect type in assignment (different base types) @@     expected =
unsigned short [usertype] iplen @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:554:31: sparse:  =
   expected unsigned short [usertype] iplen
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:554:31: sparse:  =
   got restricted __be16 [usertype]
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:556:54: sparse: s=
parse: incorrect type in assignment (different base types) @@     expected =
restricted __be16 [usertype] tot_len @@     got unsigned short [usertype] i=
plen @@
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:556:54: sparse:  =
   expected restricted __be16 [usertype] tot_len
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:556:54: sparse:  =
   got unsigned short [usertype] iplen
>> drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:559:60: sparse: s=
parse: incorrect type in assignment (different base types) @@     expected =
restricted __be16 [usertype] payload_len @@     got unsigned short [usertyp=
e] iplen @@
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:559:60: sparse:  =
   expected restricted __be16 [usertype] payload_len
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c:559:60: sparse:  =
   got unsigned short [usertype] iplen
   drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c: note: in include=
d file (through arch/s390/include/asm/io.h, include/linux/scatterlist.h, in=
clude/linux/dma-mapping.h, ...):
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] val
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]

vim +/__iomem +596 drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c

d424b6c024157f Sunil Goutham     2020-03-21  567  =

d424b6c024157f Sunil Goutham     2020-03-21  568  static int otx2_pfvf_mbox=
_init(struct otx2_nic *pf, int numvfs)
d424b6c024157f Sunil Goutham     2020-03-21  569  {
d424b6c024157f Sunil Goutham     2020-03-21  570  	void __iomem *hwbase;
d424b6c024157f Sunil Goutham     2020-03-21  571  	struct mbox *mbox;
d424b6c024157f Sunil Goutham     2020-03-21  572  	int err, vf;
d424b6c024157f Sunil Goutham     2020-03-21  573  	u64 base;
d424b6c024157f Sunil Goutham     2020-03-21  574  =

d424b6c024157f Sunil Goutham     2020-03-21  575  	if (!numvfs)
d424b6c024157f Sunil Goutham     2020-03-21  576  		return -EINVAL;
d424b6c024157f Sunil Goutham     2020-03-21  577  =

d424b6c024157f Sunil Goutham     2020-03-21  578  	pf->mbox_pfvf =3D devm_k=
calloc(&pf->pdev->dev, numvfs,
d424b6c024157f Sunil Goutham     2020-03-21  579  				     sizeof(struct mb=
ox), GFP_KERNEL);
d424b6c024157f Sunil Goutham     2020-03-21  580  	if (!pf->mbox_pfvf)
d424b6c024157f Sunil Goutham     2020-03-21  581  		return -ENOMEM;
d424b6c024157f Sunil Goutham     2020-03-21  582  =

d424b6c024157f Sunil Goutham     2020-03-21  583  	pf->mbox_pfvf_wq =3D all=
oc_workqueue("otx2_pfvf_mailbox",
d424b6c024157f Sunil Goutham     2020-03-21  584  					   WQ_UNBOUND | WQ_H=
IGHPRI |
d424b6c024157f Sunil Goutham     2020-03-21  585  					   WQ_MEM_RECLAIM, 1=
);
d424b6c024157f Sunil Goutham     2020-03-21  586  	if (!pf->mbox_pfvf_wq)
d424b6c024157f Sunil Goutham     2020-03-21  587  		return -ENOMEM;
d424b6c024157f Sunil Goutham     2020-03-21  588  =

facede8209ef0d Subbaraya Sundeep 2021-02-11  589  	/* On CN10K platform, PF=
 <-> VF mailbox region follows after
facede8209ef0d Subbaraya Sundeep 2021-02-11  590  	 * PF <-> AF mailbox reg=
ion.
facede8209ef0d Subbaraya Sundeep 2021-02-11  591  	 */
facede8209ef0d Subbaraya Sundeep 2021-02-11  592  	if (test_bit(CN10K_MBOX,=
 &pf->hw.cap_flag))
facede8209ef0d Subbaraya Sundeep 2021-02-11  593  		base =3D pci_resource_s=
tart(pf->pdev, PCI_MBOX_BAR_NUM) +
facede8209ef0d Subbaraya Sundeep 2021-02-11  594  		       MBOX_SIZE;
facede8209ef0d Subbaraya Sundeep 2021-02-11  595  	else
facede8209ef0d Subbaraya Sundeep 2021-02-11 @596  		base =3D readq((void __=
iomem *)((u64)pf->reg_base +
facede8209ef0d Subbaraya Sundeep 2021-02-11  597  					      RVU_PF_VF_BAR4=
_ADDR));
d424b6c024157f Sunil Goutham     2020-03-21  598  =

facede8209ef0d Subbaraya Sundeep 2021-02-11  599  	hwbase =3D ioremap_wc(ba=
se, MBOX_SIZE * pf->total_vfs);
d424b6c024157f Sunil Goutham     2020-03-21  600  	if (!hwbase) {
d424b6c024157f Sunil Goutham     2020-03-21  601  		err =3D -ENOMEM;
d424b6c024157f Sunil Goutham     2020-03-21  602  		goto free_wq;
d424b6c024157f Sunil Goutham     2020-03-21  603  	}
d424b6c024157f Sunil Goutham     2020-03-21  604  =

d424b6c024157f Sunil Goutham     2020-03-21  605  	mbox =3D &pf->mbox_pfvf[=
0];
d424b6c024157f Sunil Goutham     2020-03-21  606  	err =3D otx2_mbox_init(&=
mbox->mbox, hwbase, pf->pdev, pf->reg_base,
d424b6c024157f Sunil Goutham     2020-03-21  607  			     MBOX_DIR_PFVF, nu=
mvfs);
d424b6c024157f Sunil Goutham     2020-03-21  608  	if (err)
d424b6c024157f Sunil Goutham     2020-03-21  609  		goto free_iomem;
d424b6c024157f Sunil Goutham     2020-03-21  610  =

d424b6c024157f Sunil Goutham     2020-03-21  611  	err =3D otx2_mbox_init(&=
mbox->mbox_up, hwbase, pf->pdev, pf->reg_base,
d424b6c024157f Sunil Goutham     2020-03-21  612  			     MBOX_DIR_PFVF_UP,=
 numvfs);
d424b6c024157f Sunil Goutham     2020-03-21  613  	if (err)
d424b6c024157f Sunil Goutham     2020-03-21  614  		goto free_iomem;
d424b6c024157f Sunil Goutham     2020-03-21  615  =

d424b6c024157f Sunil Goutham     2020-03-21  616  	for (vf =3D 0; vf < numv=
fs; vf++) {
d424b6c024157f Sunil Goutham     2020-03-21  617  		mbox->pfvf =3D pf;
d424b6c024157f Sunil Goutham     2020-03-21  618  		INIT_WORK(&mbox->mbox_w=
rk, otx2_pfvf_mbox_handler);
d424b6c024157f Sunil Goutham     2020-03-21  619  		INIT_WORK(&mbox->mbox_u=
p_wrk, otx2_pfvf_mbox_up_handler);
d424b6c024157f Sunil Goutham     2020-03-21  620  		mbox++;
d424b6c024157f Sunil Goutham     2020-03-21  621  	}
d424b6c024157f Sunil Goutham     2020-03-21  622  =

d424b6c024157f Sunil Goutham     2020-03-21  623  	return 0;
d424b6c024157f Sunil Goutham     2020-03-21  624  =

d424b6c024157f Sunil Goutham     2020-03-21  625  free_iomem:
d424b6c024157f Sunil Goutham     2020-03-21  626  	if (hwbase)
d424b6c024157f Sunil Goutham     2020-03-21  627  		iounmap(hwbase);
d424b6c024157f Sunil Goutham     2020-03-21  628  free_wq:
d424b6c024157f Sunil Goutham     2020-03-21  629  	destroy_workqueue(pf->mb=
ox_pfvf_wq);
d424b6c024157f Sunil Goutham     2020-03-21  630  	return err;
d424b6c024157f Sunil Goutham     2020-03-21  631  }
d424b6c024157f Sunil Goutham     2020-03-21  632  =

d424b6c024157f Sunil Goutham     2020-03-21  633  static void otx2_pfvf_mbo=
x_destroy(struct otx2_nic *pf)
d424b6c024157f Sunil Goutham     2020-03-21  634  {
d424b6c024157f Sunil Goutham     2020-03-21  635  	struct mbox *mbox =3D &p=
f->mbox_pfvf[0];
d424b6c024157f Sunil Goutham     2020-03-21  636  =

d424b6c024157f Sunil Goutham     2020-03-21  637  	if (!mbox)
d424b6c024157f Sunil Goutham     2020-03-21  638  		return;
d424b6c024157f Sunil Goutham     2020-03-21  639  =

d424b6c024157f Sunil Goutham     2020-03-21  640  	if (pf->mbox_pfvf_wq) {
d424b6c024157f Sunil Goutham     2020-03-21  641  		destroy_workqueue(pf->m=
box_pfvf_wq);
d424b6c024157f Sunil Goutham     2020-03-21  642  		pf->mbox_pfvf_wq =3D NU=
LL;
d424b6c024157f Sunil Goutham     2020-03-21  643  	}
d424b6c024157f Sunil Goutham     2020-03-21  644  =

d424b6c024157f Sunil Goutham     2020-03-21  645  	if (mbox->mbox.hwbase)
d424b6c024157f Sunil Goutham     2020-03-21 @646  		iounmap(mbox->mbox.hwba=
se);
d424b6c024157f Sunil Goutham     2020-03-21  647  =

d424b6c024157f Sunil Goutham     2020-03-21  648  	otx2_mbox_destroy(&mbox-=
>mbox);
d424b6c024157f Sunil Goutham     2020-03-21  649  }
d424b6c024157f Sunil Goutham     2020-03-21  650  =


:::::: The code at line 596 was first introduced by commit
:::::: facede8209ef0dee84557c036e8502a99bb20a91 octeontx2-pf: cn10k: Add mb=
ox support for CN10K

:::::: TO: Subbaraya Sundeep <sbhatta@marvell.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0943320623522759637==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICFlXoWAAAy5jb25maWcAjDxbc+O2zu/9FZ72pX3YNtdtM9/kgZIom7UkaknKdvLCcbPeredk
k4yTtGfPr/8AUheSopzMdLoRAN5AAARA0D/98NOMvL48ftu+7O+29/ffZ193D7vD9mX3efZlf7/7
v1nGZxVXM5ox9SsQF/uH1//+9nx+dTK7/PX07NeTD4e7s9lyd3jY3c/Sx4cv+6+v0Hz/+PDDTz+k
vMrZXKepXlEhGa+0oht1/SM2/3CPPX34enc3+3mepr/Mrn49//XkR6cNkxoQ19870Hzo5/rq5Pzk
pKctSDXvUT24yLCLJM+GLgDUkZ2dXww9FA7ixJnCgkhNZKnnXPGhFwfBqoJV1EHxSirRpIoLOUCZ
+KTXXCwHSNKwIlOspFqRpKBacqEGrFoISmD2Vc7hf0AisSkw9KfZ3GzP/ex59/L6NLCYVUxpWq00
EbAaVjJ1fX42TKqsGQyiqHQGKXhKim7RP/7ozUxLUigHuCArqpdUVLTQ81tWD724mAQwZ3FUcVuS
OGZzO9WCTyEu4oimwoUKKiXFLf9p1tI4857tn2cPjy/IvRHezN4l8NHtCsJWm9tjfcIijqMvjqHd
BUUmltGcNIUye+/sVQdecKkqUtLrH39+eHzY/fLj0L9ckzrSobyRK1Y7GtcC8N9UFQO85pJtdPmp
oQ2NQ0dN1kSlCx20SAWXUpe05OJGE6VIunBZ3EhasCTKIdKAPYoswcgDETCUocBZkKLolAf0cPb8
+tfz9+eX3bdBeea0ooKlRk3ThSvdCMl4SVgVg+kFowIHu/GxOZGKcjagYVpVVlDXJHRjlpJhm0nE
aHhZEyFp26bnh7uEjCbNPJc+33YPn2ePXwIOhGMag7QamBagUzAZS7qilZIdR9X+2+7wHGOqYulS
84rKBXeMzuJW19AXz1jqTr/iiGHAo+huG3Rst9l8oUE/zMQNd/uFjiY29AYaRctaQa9VfLiOYMWL
plJE3ESGbmkc6W8bpRzajMBoY1uWpXXzm9o+/2f2AlOcbWG6zy/bl+fZ9u7u8fXhZf/wdWDiigno
sW40SU2/rJoPXUeQuiKKrajL2kRmMAmeghVBQhVdMZ4wUhEl4/yQLCpM71jJ0AlOlEleEOSF251h
ikibmYwIEXBPA27MZgvse4dPTTcgWjGjIL0eTJ8BCJdv+mhFPYIKQUqQNJgbdgBcLAo8cUte+ZiK
UjhX6TxNCmbO4Z6P/uKHRbGl/SO6KWy5AB8BpD6y4ILjOZ5ruWC5uj793YXjPpRk4+LPBuaySi3h
8M9p2Me53Sd59/fu8+v97jD7stu+vB52zwbcLiSC7bo2Nlk2dQ2OjtRVUxKdEPDbUk+kW88KZnF6
9scAniL34f3JRyv0qRy3L50L3tSO9a3JnFpNpWKAwkGUzoNPvYR/PH0qlm1/EcZbhJbpwh0+J0xo
HzOoRQ4uKpwOa5apRXSjQcmdttOD1iyT4ZK1yHyvpQXnoAO3VETHAwGRdMIStM0zumIpnZ4KdIGm
ZjQb0M88MpukziN9oe8Chx0YLs8nQOmJT86cXhM49GKqmKrAWgVgHNFgmf0eTh+qprqFHUmXNQd5
xWMInP74gWJ2DjwSxUeCM9DcSBCFjIKBS4nyN3qQBVqQmygGxRK2xTiDIt444RyPp9CiDKrH4Zwq
2S3VORdmr7goQbW84yQkk/BH3JX03D/jlzUsO/3oeZdAA2Y7peaAtCbViZFqT1gmzXvQbQkmgOG2
eiMBb0d+TW7dstCD7Z0JzyqG37oqmRvPOYaDFjnwWbhLIeCy5Y03eAOxcPAJwhewzILTst6kC3eE
mrt9STavSOEGumYNLsC4bS5ALqxh6+wzc8ItxnUjPEtLshWTtGOhwxzoJCFCMJfdSyS5KeUYYhmB
Uty6KcNWj7fHHBlrArrVGXYk+5OpIEYQBpnHTOMSOOecwpJ6TjNMnWZZ1KYa5qMKaN/fbRMd9e7w
5fHwbftwt5vRf3YP4PQQOAJTdHvA7RwcGL+L/qB8Zze9p1faProjy+GsLJrEevyelkLcSIBfYhm3
NQVJYkoLfbm9IBlssICzst2Byd7MiYJ+jRagU7x8B+GCiAy8rbitkosmzwtqD2qQCg42kYuJORuf
BsIixYgbpAqes8JKcc94P33SC3HpeHG3EBbozE1XYPcJykuVMeJ4dRgOgcHu3BpnUyCSXVoHcYTr
gqnFmkL0EkF4psQB9mqjzYETjSZxRomgxLFWJg42uuT4TRxUHKcFnmAdKFzvozXAwIS6onZ+deJ8
mTONl9B5LuCo7mblbMDc5rYKkF0wGZeebhWwkBpzAp1m1YfHu93z8+Nh9vL9yUYTjovpNi3NPG+v
Tk50TolqhDvJAelKcge9OolKW4fWpydXxwhOjzY/vfp4DE3T07Ojzc+PYuOZog57GVGNHqdVU3mH
OH4fVWlDgEw8hp1gZoud5KXFT7CyRU5w0mInGdk2jvOxRV5EGNWiLgcp+niRMNd9NeZ0nBcbwd3T
phLGlb7+eNFLL1d10Rh74scwrmZmVHYxl69qslSh9pVpCAEfbxnCMkHWnjdkoAoMAMR4TupqcQt7
5qkNQM4u4xsFqPMJ8bD9nMRO1dvr0yHpbuexEJgpclwFuqFpYJPsmeLSmPxoxZM68BA5puOnXGc8
RNAiRZMZx+yPMVDl7tvj4XuYeLc20+TkwBVqQ8/QpPboVucCvG3U5UFbKXmLRsBfq3CklkrWBZjl
usx0rfBIcM0jOJmLG4mTARGX1xcfh5g4XdqTyxF8jG9CoPnU8wbO7+uzy48Di9dEVDq7gcANjiJD
FeW0x0ibl/2NeynEvsdPGeMROapThuqVN1WKgQOcLUMOw+QPuOfbpguZorS5KgDLb7woj5KsRKJ4
2tSboJlh9vrtCWBPT4+HF+eqSxC50FlT1q7X4dEOAdc6cPZriDRZ1h2Iq/3h5XV7v/9fd5vm5Ce5
oinEiCYF2JCC3ZqsGuwJBKExfgVSl5ZeSoPUdZGBahjvPO6OwdGvFzc1RFF5LIq21zArr1d/btPd
jibdsy3ggE1A7e6/vOyeXxynwPTSVGtWYX6tyNtrriEr1TfxbtC2h7u/9y+7O1TxD593T0ANHvjs
8QkHew631I/njJEKYJ0PBn66uHEZ8SdIgwbXlxZTnKN5zlKGDn4DcRwEc5gtSDFlG+g3RDvmgk6x
Sid4ixNI0DL02SxUUBVHWKgG0cmD4LuNPq2CaSoExPqs+pOmbSrbJfMi4eEGxvS48A4kgwTfGtMQ
is0b3kScWDhFzVVAew0asAD1OwcHleU3WvJGpKENRAJJVWsqI+Gk7G0UZnK1va8N6M7PwDoCuxVE
UTlE03guh2uUpS551t6ghqwVdC41QYk01tLuJmhayKk2Jh2Fndg+Bjf5Kttna2VGfB/k7Tg2EodD
IKTnRC1gDOu7Y7QWRWNG+w0SiDLsX6MNsjJj88yj3IadaqsFdnNMGBhQtO3sNfYELuPN+DQ2GQX0
3uxFWncDHiFqo+h30fIic+hjjJc0RYIjKA3xqhdBjZqMCAdT2mJSAme2TQjELgYUN9dewSSOXjNN
URgdjeke7AfsHBBjEuod/YDeT5iPCj0nNIuLZk4jMmCZx3OlM+j3JsCCcnb+F01Z7t7qAKopwPCh
PcVsHWpC0BpvUukGjACYP/w7cIIMDQ6NOCDh6yok6TliRjAuLLsNlwAjM+uz9TkD55wuMBeRAAJc
q0w6tRUobpLNZQNrq7LzEYIEdroVzRAbJoys2cN9i2WIYdtAp4fDKs9DE2WWvCpJ3fNicAd6aKTr
QXgUnACqc/DF2smQHkGFze32+jToB7tZtPBoxebWg0/FTR2eB4hdZZJr9JOmMiZG64ytMhmrzpGb
p3z14a/t8+7z7D827/d0ePyyv/duepGoXVtkaIO1CS2TDvNSWke69zYH66cwsmDuYfUGEE4KhSxD
p4bXN1ESFO3+EB1l2t5ws7r+MBeFuW7XRzHJYlniek+clIfV3VjCo9Vqc8NbgOPROKYz8QMhvC+R
qWSggJ8ary6qu0lJ5DwKLFgyhmPqay6Ya4NGKK1OT8ZoTDd6N4LmgrHMMJC1x078mg7J1kk8fWP7
RmEMy0Dc1WP6ribFJIGtbesUInZrX28PL3vcx5mCmPnZi1EwHWt8R5Kt8BIplmUvZcblQDowh+bM
Aw9RejCit7ujfAyuovyE4eIIhgeRufKwASgf7q4d1x/oGG+TKOCJtqV+gyQO6OVNQmPp6Q6f5J/c
ZfjjDRF4YF1kdRoYg3ZPZI1lgeLGl+kpCp0sjhC90cf7OvBrmCZJJBmlLFyypnpjMpbg+HRamuMT
Gojae9s4rSnDPMpnQ/EO9OScB4rJGXsk0yw0ZMdY6BAcn85bLAyIjrJwDaaPHuehJXkPfnLaDsnk
rH2aaT5aumOMdCnemNJbrAypRrw8qvFvKfsbuvOW2rxTY44qyzHhfEMu3xLJd0rjcUE8uulv7feb
W/3eXfYdSaI4pidE6WQIjXdkt8KGG26gKNYSXNcJpBl0Ajd4zvb2HWZK6tpQmIOR/nd39/qy/et+
Z54DzMx1tZt8S1iVlwpDnFGwEUOZ8QYEBgTKYQOA/KQafplEx1DcBa3ayjfnULc9ylQw13VvwSWT
qd9lmKCdWqab+C+3D9uvu2/RHGGf4R+GMeV+phalBp/d3Os4scxwYbDBTD6NoVbwPwyawjuFEUUY
99LSukOY6NdjPJYn67nrG5s6uiWlNbbFVweO2NkLh75yc4QZXVf48Ha2ntvkE3Qby6vw7mZEH955
tPccyjp/eNl24cngKMw15QSCopaxKpYgKdlckDB0xlSl7kK6rifkLckyoVV4W5hAeJkGKbGKK5b7
RTLSEZaOB2a/YQdMz9cXJ1f97cxENmS43ozgYc5rchOLlKLUpS3y8dICBQXfHVNKsXxAUFoIMhQp
PXewMB6R16dXHey25tyJdm+Txkn23p7nvHC/TSDobkEHMUbE4yUVws8d2jcSg1XOutISTLgs/XRX
WcIOYL7b2WwqMPlhKqTdJYMSmUc1kfWaQwlEGqK+RW0q5fJYxqFW1KaniBfTT5ucwbyozkZXu5d/
Hw//gXh/bJjwUo+65ejmW2eMePVCTcU28brJJl3FH2Dkk6hNVmuJLwUmikhBy+NhK8DxlRTmMksi
YnkiLMWsVY0vvqRkuRNtd21BL03+CvaqrLvin4HGJk5jGSjlX4mpUhdk4io5ESybxzRiBU30Hydn
p16Z2QDV85WIV386NGVA04t1WlFPzPFbC954KeOi8B5WwGfsTROEmYWXncNMBF4DUkTEd/UsVmNS
kDpxjSL35sgopbioywt3rAGqq6L9wxR3wrZVaiIh4TSyshUteEnHoyGTRpXTw7rTWCFcVkms5+X4
PM5LzYBYEJPRiG1+K/PD8jtIp24huOC8TsI0qclL9DSxcXyK4a2Bu2Q4Spdm2BibareAE/mDED2X
7rGPEJQtv97eVEI7/u9COqL3SajgS8syCyCq8aZqYOWCxSyoW7AvcvN6xU2O4vq12Ng3Zejm1N5c
N7VnqttSc2NABIu/ynNorIGJ5ayM0uHzCXmj/Src5FPhsyov+Lp9jOmb6hleR9v0b2/yR6gA4Zp3
Z8qkiswxZ4kWmAp1OSDyJStiV9A41as61JmrupW0yRZ92Wk/F+ZX98P35E2UQUI/YHhGbRoZU8oq
d85++ADxnjPl3v0hsHJzfS1AN8StwEToIiSTi6xIh23aHmb5fnePtbjfvr0+7O9MCcLsZyD9ZfZ5
98/+zk93mi5YvOwVcW0xBM4mvjSdZ7U/IwBodhasua4uLy4ioCjl+XkENKaEUBO8He+m3QO3Lbz1
lGJVGLZOrEaqs1P4lwRMbqHjOUBEMto5CxvTVps6ss0WGJurPM/XorpEVLTM5J277UQREnyLqaeK
oBosj+OKNVi/KloGgs1AFdBsu87aHMtqXR85J6zgK/fAp2qhgKQz+p0IZ2bWs+yw/8dLadtKApd7
4Uf74lR6QBMyJU0AJP7x2ILaOpF43RbVNBVp0I2sy1E/ADtaotoT1XxNBWbz3kGGKZYx8Yg0/vTF
zD6r06mF1ar0GVlKNgJE3/R2OBMW5BDUoFcgg7FBH5qYXURUEJcgiPG4d444OAEnOqqJZN5tVBel
177hstc/ALt7fHg5PN7jm7/PoawZrmywBn+jq3URzhCvxcgUM0VKhHnC7ouKhdM6gNpBRpvVjp3W
5cRysaADwv1ivM8E4wQyWnK2e95/fVhvDzuz+vQR/pBhEaAVlHUwx2wdWw9AR6sBWF2QCCVCJzox
qKAn8KpvKj6WjHLzcYrtEIsScXq+2fgdLemNVF7diAvtpuSN0iNpLJqxPAYdy4j+YxksB44VCIk/
xqGx9XeoEScXTKLeJIGqgWtfBZRGGE+vLibAsVF7HPWLPY+IiM0nPv4FirK/R/QuFKEhBTBNZR2P
7ecdvhsy6EELn52a1OGh9pu0/f1qXKV7dacPn58e9w++sOPDGPP6I5SBDt6+OowmhgxdnQc/TtJB
K5W4vPWm0E/q+d/9y93fcVPkW9A1/MdUulA07goc7633XTdFWD2MoJLG/b86BZsVCyUEqVnmvrtr
AVpJ9vvZ6RieMWl/pAECs+tzpyaiI2jrvyE+URtt7hLitfBdfyWBJvN42rUn8r38YaimxAoN/4cc
Omy6KKORSYcvzeuj1Hr/9hcAtk/7z3gvbtkf2UGHO5e/b450ntZSbzaxaWHTj3+80XROq7PxesXG
YM5dcZyY81BmvL9rPbAZDzNzja1FWtCidt05DwzHsVrgT7u4eRpV1hNVHVKRKiMFj25nLWzPORPl
mghbR9wXm+f7w7d/0WTdP4KtOAzTzCGC5Xjb4nicGyVI3483vZ7a1qnaVUTnOlB2v3ETVchwXt0c
2mehK/c2p0VhTng9gYtDweX7xKVeNvgjSr4dsrBMsBXuRvgTSv0Po2BBY6O4KaeOo1dNAR8kAY9E
Me8qiKfac6wFnXt3NvbbD4NaGDirbAQsS8+ktK3dS8mudZo6ByPaArkgmDhPmjz3PXtE5hT8YVvU
Hd2qCYE34pW8PseiZnAA2vIofN2pi7j9TNSpJnXM9TWYjVtSDed9weBDF24R7ieQMU0T5qh1uWCh
DW9BkymLDo8nyfA7If363TX2JwWHeA9/DMw7GQVsuX0THBllXrlV/6XqVXQofXraHp4D2wh0wM3f
TdFUtDQO8ElafgTPztJ4Q7j1ZiHKlqCB0wjBqPJvDRy0EvH7AyRBqaplMZ6bRwWCZ36g4NgKcB/N
06VunpG6sI45hjsN/AmeFNZZ2afV6rB9eL634X2x/e5XeyGPiiXYCBmu0tynTk7d3raKWKYsV15+
SnlBEH5rsY6VjVVeQ5Fnfk9S5pn79q/00TgpzuvRMvqSOryaxh+pEqMAR5DyN8HL3/L77TM4QX/v
n8ZxnZGYnPnj/UkzmgYGEOGgKToChvaYRzc/JsGr0UwRDaFL8DtlI5IEjrEbvEKL/6BZR1Y4ZLGR
5pSXVEV/5wlJ0FgmpFpq8yMt+tRfSYA9O4q9GHOBnUZgQS8QhEeIwHIW+HuKY8aWmVRZbKXgIsRC
7g7dQCzsdwfyEAB4GXZMEgnGLHooHBEnGwttn54ws90CsfDCUm3v8DVmIHMc026bLtc/Fm982Dgp
CDK9PDtJs4CRFVUG4UOVvLwMXpBj/9HkLWLMVugVvnkRgfmEuNzycIjs3lhz/87tA8Yg2/3D7vMM
umoPl7g61mV6eXk6mrCB4o8H5CzmMDs0gZdvGIa5ALAtgaLLYiQT9eL/Ofuy5rhx5M/3/6fQ08ZM
7HQ07+OhH1gkq4otskgTrBLVLxUaWzOtGPlYSZ7x7KffTIAHjgTl2I6w3ZW/xA0mEolEwiDBH50G
v69DO2Q1DxqjeDdMKChI6PGNqOslqlwGEetJq2Hx9PqvX9ovv+TYcTZjJ6Ys2vwg2cF3+VEE6bw2
v7mBSR1+C/5HuTm4PQjiuADUbrVQpGjXA/lnfCoR0YdpIqM1Cm+1cWcxy2jNrLL+QcAsa9j5RAcO
k/lArrzL440ov0FFo4xoQkTcXadmTTu5//wKq/AD7J2fed/c/EN8/avhgeitosSrj9rHuQKqmXoB
oZ3AUMte0wvWgizw9B5aEBxzS4NEFwqthUyfZ3vbAIlaDU1ZEzVqsv5S1nSerM5RafW90faliixW
NqKAXZ8301AYbR5PGSPoe9DMKvlobUEu+8h11GM3qXeu+zrXdQ4xXtmlEsczZiOHcUxPxb6hbOhr
3ufTSCdH9T50qBAOCwuqiGTaZqAcSlZ4rKh28r0JPV5D43tXaArlX7Fmq5oaF/qhkzdpCxlXCzx6
IKAcNsuqW9ky20BqZlQhYlWqD838ZTZPrx/VTw80Rz1W4ZIc/2IVVReQPO2RGvqK3bYnNYQqAQp9
cLkY8nO8BdoIlHtAVmYMC2oVa3qS3W4wBK5wfc1zWAf+CZLfvOa/ZFTm1KwBKtoajxnsxU/Glolg
gXHY/CQm7t0UH3f2WiVquBxq4prE21F30Hc3/0v86910eXPzWbiXkZoEZ1Pb9IEHop6V+KWI9zNW
233e2dSn431X9ooR5LhrchDukerL01JxAmFTM0VYki8fcftiNiZJnJKHHRMHqBlKCdOtLGMynC5N
aR70IFWP9DZd60JI2vkho3AGRouevAdE5HjXtJS1lIP7bAffG9MyU5whLjyOeH+Qfa8kIp7qseHY
n2kU3ZBoZJ8bVV0QTEUfp8tdtYgdyfwzb1rLE2t7dq0r5tcXx5Mv+hehF47XomuVYZXI+mH+xFGc
m+ZeNXZ1x+w0yMFjhmrfaIPGSfE4Sjsx6PHU91jgyDewcFmHvbfU9SCS65ade9Bayx6DYspzuLtW
tSTluRUqb2Fx1HQADqBXdk8eLmddwdLE8TLZbatitZc6ji/nI2geFXln7uwBWGBrI6eaod3RjeOt
tLweqaMY1o9NHvkhtQQWzI0SaRvbgYrdHc+SxZEpGwTlvEg1s07HuKzYy5GB0Kv/2g9M0oNyb5IE
QoCXILIa5TxsHjWOwHh6dFStCa/LQ5ZTRoEJb7IxSmIpbNRET/18jORemuhVMVyT9NiVjFLxJqay
dB0nUMS82g7p0GkXg4KWa1FHRVzuxx8PrzfVl9e3l++feWDB1z8fXmAP84YGMMzn5hnXjU/waT59
w/+VI3df1QAq/x+ZUR+5asIWB+xokOiUjwF2NncfKO26zI/Sx7TLm+tF8ZwUlOswkGYcnCxZnWNg
U2UjMU8ilXzMdtkpu2YSCSPaKsufItXEnj1n1bxBNFQGftm4aSUp12cVbhUGJZxjLvuM8DRKKEJO
WV191o8Y6dywrJ4NrfWaKiSiW/0Fhupff7t5e/j2+LebvPgF5tdfpTs90xrG5BDKx17QBoJ2IGhq
KH9ev0VY0qdXyJLjJjw7WezEnKVuDwf68gaHWY4euuz+tHjz8eYP81R91YaEdRU1CLDCkeSK/00h
DJ8EsdDrascyOkFmdBPS0d0AA+FYW9l3S2GruUJr6P+o3XbHAzHKSwjSudGdB8jVqrc7jZ7gIYAR
+qeV1Z7S01jnSeTfXUf4j892o6nHjlHmSI5BwnRUj3FnOvSQfX5k+mm7Bmc5VsVWalbl8SjvrScC
HpEw9Aybgl9Lz6vMHLBB4V58dXZ/bdhvoeNIu5WZSVzLF+f01FqvsDX48ItjlsNPc0HQiVDERg8h
Y0qaEWY4DbQmIkG3AYoRqsSMNIduAuY7P1r0dfsANJfN4Wsu54baJ4iq45YRJqvZ5D5vGBkflgse
KNFTzuAaWNq5/D2Vd7DiUCvGzCG0AGnJmAHzi266wSepHnYUxt5jB8W0Kafawj1qBM57dsytE/mI
Byudkai578nQvxMm1R1klrzJ4D9bxVEOf1sF1Em2pyykJSyFsciNvpu6hS6EjddPJKq6ZAvp3Bny
+lQNsqllJmYi1KVSPyUgtyDdN6GfJ/BteFYEz8Yn8wTu5BuMFObaeKdvZMgO7Dc3snDhROAcUaAv
DStPY7nEMPUD7XXBwQ+wgsJIwDQjtX3Bkmmbv4XMxTyZ+YeysALUxl0MfO6n4Q+tczNsZRoHGvmu
iN1UHyJKaHVNTi43XZM4jmurym5PNtq8BaGpLMeyZlW7+TUUpjJUHK99kVH7vRmG/SO701t7vJaN
WUcgZ/U5UyspawWaVrruaGXdEkNA6q6cSLuU/a7FSFl4K5JatIBn3/aqtzTPrVM1GLEHk/wP//P0
9iegX35h+/3Nl4e3p38/3jxh7PN/PHyUdiQ8r0y5s8FJTbvDgEg1d++uK5DSjlYBTLRYVamqH4VD
rFHzA16EpqczxwHM3cgjF1leMGohVJ1ZVXuB3sPYfNJgSSsykxFG3/mtgvnMqHA9eIfuxvXT4OYv
+6eXxzv481dqe7yv+vKu6qnZPEN4OH8v656beS+2JX7fR7WSNJV8k2Nq1UrhFh1lL/2BBxUlL3Ge
ZpuV9HsoM+VAYKZxQX3d9W1W5JkegJTk7dvzqehhypGmOpV1DlhsyQpvpl9K9PK3vAaisqOnnHjm
hjx2ynK8PqqoN1nOSkq2QL64xWrleAIrbQ6MqWDqJTd+ga7lTxxhSLC6Vh3FenQuoa5+DOfT9cKH
l7/5Jpd/KQfpMGG63qjcIz3V2g1HdMWiywFFUEkqfsNi57gm0VGPzCdyn1EuOROYqx4kM7VtUufH
D3IoVRbyPt1ccNVcK6OWkNBzHNlDQQNUPQhvLgt/RaZKmUZ8S6T85peds0pPUFokIGIg/2CnbrlK
jaauOPZCT63XTDUfrFDQPr+gF+c7WfPgjex8MmpdUVtKBGANKKHHSrVSM5XnhxFha2X+yBwDbr4w
uu+quim4aJYjY8dSr96xXGpuqSd8iq38lBO/R7kMqUwd5IBznHKU9+CcskQ6mwUohmRVvpFGOKEr
wudSggTrr37eUsumxJEVWTeUikoykdC21+/pdUTO4FD2SieVg+u71MIqJ6phG19BIapihb6fjPIe
VJIOpRLDNS+VvYr4LV62GKoDhv9UGifsloMlUrZcUJP9YQl8rXDRazyyjOjmYWkNx64XzzJwGSyT
p4H8FGSuPrelx1nSvtOVYvVUF7pdQJ3P7/ImSJ0EJEqpqJdAx3ZQkhzNTNJUVsaIj4ty9iEo1pM0
brOSjFMHWCG1n1iXTKeZB/LsHvaJjfqmC+Sutgp+89vfZX9t93tcvmnPZuQzqkwNB/Q0OgBsD4fp
IpDJHt74i4ue4x2PjqEpDDuLf5tY9eqxLDKYdEq/KWVfqrN8ynYEZQmDQMOnpL7jJSMXal8oM+wO
I51nf1B0dlE8xgYhMqyrD2f1os1MgQpY5v+0q3unw2EzrEhOlBzvDWXOgw9RH2Y+XvHtN0n5BZVB
NlOI32KvhdfNMbIUBjxRVbRC+8aksgv93hPBgkcL280um3Mtm0p2pad/1pxi/xoFDP/omcA/PpER
V30tcVAFB7u9P2Z371X8D9U3RYL2WQ/L1r2l3zDGOY9rvZ3/oW0PsmZ7UJ9ilTiP5+yupJUriYs7
8JBMv5MRmqWkq6vZ/IVf9GW+QX2c9Aa+dJrjHBIsH1c3Zm6UXBUdnt2qwanwt3mtQoVxGWAVteDA
0Hpqbvee9ZJGm+PqPozetdm10hxd6ZkUju5UYBiJ9UEADHWlRBFZk3V7imqVHw10fnZq6VsRMl+V
95Yx1rhanLvvDDqysVL22N2XWa3ejJb4T9mA3NuZwv/ii82yEdaTZelllOOy46/JyCseQMtUXwc1
4749tc27ihSpKMv4BWS5tHRz+ViUqqNN3eVXXdOgCmtvqdIgs5Ze+KaIWuIapRIPvcHJtBLuS7yY
tpet2XI25Ymh0UCuMnR6ZdnEz8mELXfN8UOd+crx1Yda1ZzEbyGZlYqM5emqcsqeefCjJOuN1hj0
IJRY+WUroSesdoGGVvKknHr5RksfOYFjmTd9iTr4O6K+R3GiHMUcVRnVZ5cd2aIe4yr1lrIJx2qC
qVTfmZShtoY9Efx5d9KzqiZv0Cos6qFQxVLy2S0A3NTWm6xh78wx1uZo1ZEvmsjowKWOUpGhQd25
tDxoLCc+v6v5svtT27F7+sRQ4hvK43l4d0V9n+NSZe+x3FV//IQgEV5LtH22KCghw7+cqpMkGSh3
WkgYJMg+VHdAkfRafNitrw4HvK0qA/sK9PeJtI7T3rTON1V1A2zmZZN1A9zwjMgjU4aPUI21WnZW
4FmdWvS8PbXkNDlu7tSM5u2mnhls3MLADRxLZsu9RyWvvOGH6WZWSZAkrp6VwhCLdHRRwkI6D9O6
QalyjHVBJ5u2BGoN0Y9+bey8JORdjVdQlUEfB42J+32Pd9m9xohH4YPruG6ut3tSF63NnnHXOdgG
nysyaoGL2mIUtwCDvasXbcZS4okHas20MjEQ1PB75rr6iGdD4vjGgH/YKGBaaNRspoVFI8KaIbVz
/r5AtGqUoXSdUdqBoC0JJkyVaxkWXeInnqfXFslDnrhGp8nJgoTIK4opYqoSL9VQMlbqpU7+lweQ
DV6Pf1PDL0JFcNcYxbCoXm6f2dQ3W5EIS0Gg3vpAqs0CJnKuhl0ma+uCCt/g+VQphgoOLCYKtQi8
imErAQYQA6FVZqqmHenoZxwVGwSt/Ml88dt8GQPfNmy+P789fXt+/CGE7BTShFnv+gF2Hbtcvfts
8i/stbzd7Tr1x3XHiul9qaVxSC7KPT77Qn6UiFuDqCLYdF2pZ8g93y12BcDbTImcBQQjB+7QZykR
ockSLluCSd+5+ri6Bf7qp87Nlynsoq3Da9nzPh9y+VnJ/I4HjJTHYjNTXuzx6+vbL69Pnx5vMMzh
7JWJVX18/PT4id8GRWSOB5l9evj29vhCndPekQqiFCnVODSQsH12W9bKEiWBxzstmKGk3kgh6Fa1
59IYmkT15dv3N6s7bHXqznKkWPyJ6gvTafs9BtaplbcQBSIii98qwTIE0mSgBI0TsgQCeMY3XRfv
gletLvBFn1kpAtKQdAz7dx6tKIPlD7ZQ42+u4wXbPPe/xVEi9Ttn+r291y6eKHB5IapWXsQxmtTf
xlVYrZjb8n7X0uGIpMpKkgt/QtM9ggR7e9nfaqXv7guKjHtV+FeWQisIX3HWDcpFFwKENVVdTxaW
/J5HkaEgHuR7DlBloCXss6aDJCtmLxZvvpe1dhN3Lbk958fbilwnFqY9vmBoq8FcsJY5K/vKEilZ
MOT3WUfa9lrx5l12Ut3xVfomRvbFhYE2nWU6WbvnKOq+DKYWrHP5EBg+CW2dofzZSWkoxe+pS0Ao
wpIWmNnyoRAfINlt0+yvyN1w31TB7Jgi2TSqwHIPiUPQT5KGiJS945sUXvFWo3vFdHVC53ddg+Lp
FN8xKIFByXRKaPCE4Sxbjg8vn3gYJnwIWfeiV6vPf+Lf+qU8AYDMvt1Z3LMFQ44yglq7OQzbKkUY
CWqf3emk6ZyWYAZSozyHPCXoc4q7RcNh1rHOaCIqrFQKnPMTfWnbmUNksw9Zw6Orks57VMcvLlfU
Aisk/p8PLw8fUWswbt0pHgMX5Y174QLEn4YQb33IocyHmWGlHe9M2mWQyPj+SqGY0/GdgRS2J8O9
7GjMHaytRPFco/rSeM0j4WHILf1sdQqe8fL08Gwqc5OIKLO+vs+5fi4ud3798kuCD92/inRcIyP0
rSk5vwZomaAA57AoxrD91Oe+BM0dZM9ksjOqU2ul89DLTI4mQ+Hraygaug6bXsOqoS1WE4zZ1nR0
irkIWCsVn0eZjI+2i5p5NG7Mp7njFJ9AiWhN8bv8vMpEw8W8+kC0WgA/MSp5fho7s3GcbK0Ky92o
YvFIzYgFM6NTq4xD1ezKvshsNysE12Tqsrdgkoq/D9lBDYpO4xszxcIJuh/eNt6q5JRSjx6us+GF
UUuE8YmjGRnIgMxcZmTs/VFtUM/SWmvhoPqhJ324Bdh3npEZ0NbvwPeMDDEgR91tt5zzVKd9XY7k
MGq4fWoOsLPOLWR7d8Ae5g/XD810XV9QkxzI1DAYfBhSY2OcLuXubBsGAb471u1dbdQaaNamwhdH
FAbUn2kPSkpzli+xhZQ1Sm9rPvT1rD3r+Z7EJcnCds/t0NbFvgKRqt2FXbfr1wMjt/ftH618eHw6
17VuWRGnuow25hwv+WR0kJMg1fpa0NQm/rjumZYb/Jabxf2j6+hd8+RGbIxr1TXV9QidV8shTTmV
h9BWX2AV9AxPTHnARmVbsWL47LQl2hLnEnZRbpfv9xnpxM35WGUUgM8c2djvsiE/Fu1Bry/6nbV7
xTMhYx2+R3eLmy7k2TUWR6COn4tYGdXsdsPCpNRhZ7RY0RoX73idxGMbg56sPKS3orss8F0K0F1c
VwT0mWt/OuQUxsUNBWhBe1ZAd3KTkgy3ZBG+eu66IiI0O/UJLSw4FlSmY9UdSzUqET7dVGmuuuuh
QXmxhaYG6FbDJgSDei1f8kTDe2mcjhEyFX0cKPoWZq52Br1/LPNbMbaKJMnhT2caDoUN9aO2h6GO
IoeT75EhKxBwpfVJ/DalQZ4TexgGarphT0bapshHhsvgeY4lAsGxQdF40Ypp94oJFufLdcg6uoxL
k5PBDdsTj2AkjRTP59KcJdJY1fW9YriZKTya/W+SEdvcPkpGj+lD7c+gJOTdmayowoQXzEWoZ9NE
DDqvaRmWTU9ob+L2SvVVSiTrj31z2hFYFTspEBtutRVnLutxCy+cRw+kagBq3U5s5CHLui5Pso/T
lKlm3FqpjWImnsj1kAe+o4QFmaEuz9IwoO4lqhw/yMTVCXWFjcR9eaASNvWYd3VBKieb/aRmNUUq
x724pQ6zvXAZ8uz5n19fnt7+/Pyq9Xl9aJWXNGdil+8pYiZPWi3jpbDFgoLxmdehnk7abqByQP/z
6+vb5lMmotDKDbnWq3QAJ0c+vfrP+OhbOidrijg0ZgVQE9d1rXkeqzE8Fp4VrxLymiuHtMgcSOuq
aqS89hE7cW86T+1/4XEHU/2s0lnFwjANDWIkmyQnWhqNej1svjcT1qkhllcR8t/Xt8fPN3/HANxT
TNW/fIYRff7vzePnvz9+wmO1XyeuX75++QWDrf5VG1uu0GiTbEhdk3JlNT6hJD9YqDGNY5XpLYON
uZf4obV1eGhdYfwWyyggftueMk0yYtQD+XUTLgNRpOs7BwSmwIyWEoqSVYcTfxlAtbZoIG++FTXv
S+gMsnGIY9UBNJdaDZGOQHnwHEqj4FhTXrQpSbWYC3Bx4168SUVeXxYf1OFYZyflnQP+tTQHnQCi
vDPWqKrtlEdzkPb7H0GcaPN+Vi1VaTxEIWm0EWAcedo8bC5RoIVG4eTR8uAqfrFCsbcU0uKQM7WQ
tlGvOnLanW2hAWlsGfyugUlq5NSdbHXpRm2WA4GadSKcmj6d+qrShob5uRe4jl4B2B6L6+O2Vatq
tGttnNrRR6cIDQYzbjD2NsEq0Fir7PkUwQ7Ou9Oaxe5PH86wj9KmJw9Pet118msWSD+fYI9QlcY3
NdOv5J4Spaz0IJZEvmu0VXnyZdFm/PIMl0yrjVqMdUeHp+EDmGfS6/OghH55eEYp/6tYqR8mdwhi
N8DniojraMl7yFoGG/klHmr79qdQcKbMpRVEXR4mXUnXN0jdQhm2adqq00IsICKqm2VucBaMgncW
D1ergpy71+u3/w0GVJLopIahRWoToeX5Fst0R8bpUd4kwV/XhjUgBSquVCu7YUY+Qyf7FMAPPcLH
aegmHqHDdezm4/OTCEtnvMQGyfO6wndvbuf9pwnx0yS5YhJGTCiKTXciW6r2T3wV5eHt64upfA4d
VPzrx38R1YYmumGSQO5tLnv/KvRrMZRW7EPbV1IUTHT3i4SHrDWJen9BAzvZPUFPWAyJ18mvjZoM
ufrCo4q3OR1K1OyipQCx65FKrE7KtgsZ4P9WwvwYjwFMWaHObRKLLHUi5SR3RmAv7vnMSeiZMTGx
0Q0dStLNDMpiJxG9cKTp8UhWhjTnzmiNJzKotczfTA+T8vXh9ebb05ePby/P5HNpU9rJ3XUjd1hI
OznohkrXNskSuD+fTK1taep+UvI2uxe5+iSL4zSlVWuTkVqNiewcW6U4Hqc/WZrzk3zhTzNS2zqz
fslm9VN6s2ry/VRhaRQSU3VFnU3U3a4pdRxkciXbw5WSNkKTLduqarAB+lmwlTLerl7wk3M3+KnO
CPytqgTbNcl/qqOC0t0qI9se02BH2zVkRnaMPef9WYps0XtfNGdKbVUCNCYjJhtM5Cowo/5P1CIO
460skvenAWeLfobNz36qTZa5wjHLlGbHUX0D0bKWCHvr46enh+HxX8RKM2VdYrhncXqyWh9tqfT6
NGhVJhbQnAVx7RJiiQO+DUhsQCrZGnDFUq5gTQQewBuju1/rqgGdPXQ9naPqP6j3z4WBWRis19Pb
mXi9UPKXw+vzL1M387D7nx++fXv8dMN1UaOjeTqoXpzq5a/+SjK5uMu6nVGvRYuyh1TjfBgd1Ehc
tdTxBYeaXRKxWK9DU57+cL1Yp3YYAXE0sm9Gep8ygbRtRDjrjbTdkYO4IbWjrGop/Y5j0iZZTXQZ
kzC0pRKBXZjZ93jxbp9rdyqXT8Y6AxYzKac+/vj28OWTpuyJ7IsuBJV8owuzMfbJC6Yr7BlDKKhT
TH6t2/FUw6cdzlaGmNaNJoZ9Qr8FKwagq3IvcR2tTgML0ul1L2njq3WP+LD2hdltSqf11R/CLKtW
7Pfs9Md1GChrGcfrzk/llXoiJrFvdqAq45ZejSPPMb8BDljUyWk6h0OY0GurmNG1l5gHQ0r/kb5o
asczqEQSGfXjQOpaJ9GEe/qIfWhGKre7OnD8jcbeNYkWSsrEtzoL8DQN6C/OnBrLg9TbU0ac7RiN
2Q0JaRQT41qPu7052kiltMIJBYl71HqyU09/Jlp15dFwXFq3mJlKweVRuo6YW0Xue5Pnq/SiNtVN
l6eXt+8Pz/pipYmkw6EvD5lmttf6oDWDKE5lk2XMFb6TdNg7F8/259XU/eU/T5NNr3l4fVNGEDjF
w5n8jpEcYGRFCuYFiaItSqksa5Sc2r2jltWVQ91Rr3R2qOSeJ5ohN489P/z7UW3ZZHU8lrIJf6Ez
4ZUjV1kA2F6HWs5UjoTIUwB40bbAYJgWDte3l0s97qNweNbEyfuV9h1ryT6lnKkcvqU9vn/N+9wG
WvopdEYaUM6YVMClgaR0AhvixsQcmubKohvzwGY83L2kMK9Efi55qy2LOs4GKg65zNXmZd0OW+Xw
c2vS303maobI9yybSYkN/h5op1uZ67a8Z0N7KukK9eJIyVYTlnv0GZxgYueuq+/NxIJuDXmkMGmB
XcQCeBWRZg0yT6nMcL4eCjrZYXgksQHvsgEk0f01SbomiUjLJ7roYHgKVDedSJqhc9osH5I0CDMT
ye88R97VzXSc67KZSaYnNjpRMqd7Jp3t5DvAU/0VYpOdMoM4J9998NQnJTRA9XjSwWOhKM46XAzX
c1dkMC76JVwtAWiGbuwERHdMiEcVwzGPjMY5dwTo4DCQsrCbEUicpA4BoKLrKcaQGdHPUQyGqac3
6lMPfqTG9V2RPHAjj742KVXa0KBJltTW4jQxARiuwA1HqlYcSrfKQw4vJPsLodin1jGJI3Tl0wQZ
SFRDtwyl5OsAMkc0ku1hzc4P4o2ZeMjOhxIHw0sDl5p0s//6Rh79EDrUlOsHEB0hWS2QveSavTSp
SNNUvgSpiVL+83pRnxUQxOlAVovPJu6WiaD2xFW06VG1Ig5cxSqrIPR2fGVpXMcjHzRQOJSbGjIQ
2YDUAsj+1zLgxjEJpJ4scVZgiEfXAmi+Giq03VbgiDxLrrE915j6fhaO40DWlPmWHFmODjvb4zZW
1312mmOob5Wu+aUt9GHsiKHYYTidy2AFMG5y3zATz+GvrOqveaeF8tLwjp03assdxjE6rllAwSKP
6EZ8JdBzqRKr8Ba2yuRbNRMHxn8YQyrtPnZBuSffHJE4Em9/oFOHfhySkSgnjkMduglrqMQAeQ55
GrtwgK6SmT0BZI/K8FgdI9cnw7rNPbVrsrIxcwR6p7xoM9OHhPhYf88D4tMBVa93PWrk6upUZoeS
ALhgJ8dFQLHl0rzClVJFcoCoJV/YQ3IaIeS5Wx845/DIvudQ8G7iiK4rAGSVUKfyqAVSZoiciJDa
HHFTW65RlLyTbRpb0vpuvDnJ8K1LxQ9RAXxiveAANac4QL9ByqE03hSeorKWo/WFKe985x0p3NQj
PqW2z+iAEMuTqXkUUhavBe+Y5yeWoS5Pe8/Ft4xtoZAXzj4GweETE6mJfHJuNjHlUy7B9CfYxNvd
Cwxbk6huEmq2w76RpFrqkGxN/7pJyckBdPp26AJbOioNPZ9+6FXhCbani+DZEgZdnsQ+JQwQCDzy
0zsNubC4VYz2Tl4Y8wE+b6KXEYjpwQYINsBbnTa5BZu5tnl+7RJ1ayphVGn8MIb2GdGD2CxJGs0V
kVAtvciipXoxISF3GINwTyxLsBpe8/2+I5Sf6sS6c4+Px5Fo74eeRUfp/cSJtqdW1XcsDOhXx2YW
VkeJ65Pzo2482F3TdnllXdz+aofcT1zbggJNsCCRQ0t8z4l9mwAHjPRSUuV3QlfGDwJqw4D76ihJ
yBI7aDvtOrHOsiiOgsHyJN7MNJawtG4tgR/CgP3uOklGrGmwCAROQGsRgIV+ZPEZm5nOeYGx/TeK
Rw7PITpnLLrS9YhK/VFHrkMOU3fXvLvu9bD32JV9f99V765ebDozNOvAdoPygOxMhl0VMQOATH9p
APg/tipwHHJiqq73kYwci6YElWdrHSqb3A2oJRkAz7UA0Z1HfTMYCjSImw0kJeeOQHf+OzoRGwa2
/dWxpokojTIrctdLisRNKIzFiUcB0M6EUgarU+Y5hC6IdGqVAbrvURkNeUzIpOHY5LTiODSdu7nQ
cQZSP+DItp0FWLYlODKQzWi60CUmyqXKoiQidoGXwfVc8gu4DIlH2q9mhrvEj2P/YOaJQOIWVKYI
pS75hqzM4REfNgeIpnE6MdEEHaWO6rgt4TWsCgOpJwgwol/9XnkiLz7uLekBK49bJgFxJkJUjJ+J
rHSurcmX/iaC9Cy7BrAhGyqmxjacsbIp+0N5wlBX0zHW+oK0ozNrFsmZjLe/MQYehv7ulP6bOeZ3
Zw8tvuBedte7yvJ+FZVij5YfdszI+yZUAox2huYZ9UXQmdOeJcn6c/VFTgwGzP/aqOb71cPXbXj4
s83y9Pd3J/jWN+fHEhzaRPKsN6nNcCsRp9ieb4/PN3hb6bMS14yDWd5VN9Vp8ANnJHiWw9xtvjWq
HFUUz2f38vXh08evn8lCpspPR7tzA+hTQoySzigWiYHJPbPUzloFXofh8cfDK7Tg9e3l+2d+I8is
6TyOFb5rQHzMlVLsRMW7kP5mm5AjeJcj3Gh00Wdx6FGNfr9ZIm7Gw+fX71/+uTUFbCyc58P3h2fo
Wmp4pyryK5cDCka5etZ0khzGCFD2pt8eswIfQM/P3CxODMAc6oaS32wHspOxaqfFKWOU8RgfeZPZ
JbL6i7+EzF2jqMwVDlsxHGfyuzGcLMKqTDeh1RwnqAExbsuU7euMHeks+ZN1eXOyoIrfkEBKKYAw
D/rwj+9fPr49ff1iDYjd7AvtgjhSRDDMQ5cVaiRcgPCkxBLKQFwKRL9T0gWfp84GL4kdokh+Gf/M
lPBngt6UsOY2RkXwmYjUGWl3QM5QpGHsNnd0oCqe99h5jhGrT2LQvTVXmhZSF3tR91JfiD5FVG1p
C5k8OV5RT+scVuWKFsyHAG+5WfxwMRHCIJlsEQoXFso2NoPq4cZCpd1yJtglT+ERRA/pW9gVyWEl
OJ1HVRIX3vTyYDfnj2agRZmj8yL55JPTRsiuJ6Z1M3ogzRkgRG6wG712c19LNChb2SVjbNlKvlmJ
BC1ABxYmXvToGvoeKuf4wOjXyBHk3sh50+oPwAF0WzY2X1+EuSMPaZZYUW2yzr4/RodloxuEMbXj
nuDZpdmghiQ1iSiqvCdZqElgUpPUiYk6JqlHW5MWPN1owuT9oSYaIj+ydSGCaaxVbj41UMl9OZxV
iul6M1Ou2oxd6FYHG55fgxcrLDVdnXtlouaHwWnCw1zvBlbmtjvrHK6COBqppUW8c8knuS5CTbsT
pzah4xrFI9H62Acy3N4nMEHlJ6t3Y+gsS8+SW7bz3Ylsy0pEcejl+G2cfs9y5VkQoIHCmTW+H44g
TPKs0Bq43BNQ2oL+Uwll750yrJuznqTL6oa8xose964jOwgJ533Z6UFQYm3sKSf/lW5dl7B+80UH
M10S2ebffHWAqIRyYUCm6hHmJwwkGmlKme4TGCPOk01Ydi4sXxBw4Kt1WxPjrna92Cfzrxs/9KkT
PdFn840Lo1r8ZoQlGb9npCkAy4UVk0j1FtciPPqIg7eoCWnD2wyq3jyCqstQE6btcRMcWBck3Yaz
0kzZodt1VhrJm6aBIVKGuyAhfSMF2vgeTHUt7sQKccBQUwDb27Jc90mGkp2jSy1KK/2FXzmim025
X+wR5QFtH8qrAzNJD8OxAuJtuUtbD4o/yMqA4TnPmQiye1Y6Y+VBmww3ychcSxNXPtAuDrSMUHhQ
A4mpctC7OJEN4RJUhL7suykhJ/inIxGxPaHrKvTezaoCiyeLNA1xyf7OTqEfql6OGpoktHvEymZZ
CFeGitWgXpMdheeVXuxmFAZiLJLvsEkILGWxS1eaY9s9xX2GLRkncUhWFI89wyS1lAlgFFOic+VB
nTWU9UwFMq7g6Si5f1GYkihILbknUUROjFV1pSFZg9EgVTfVa2u5Wa6zWaJHaGya24GVzXtnALok
CekeAkSNIChhoFSTrqIaCzlpxHURGxKSAkLX4lek21XyK7QSkGdpEJIjbKr1EnaBb5ueGBxKLBOS
gxanKYmLvHq24twA2HfNkSqfg2r4Jw08s931osSgXRnk42bprZ5rNgzV6Z5MsewzTGgIEscia8SW
5Z2O6IfmQtqkVhbmNV3mkBIaIeZaymdhk8QRtYeUeLizuiX9tE/ZzqA+gF7mkPNEaB+7tmUDvRYL
hktf7nfnvaUSnKW7o30qZD6uIl0vjSXguMQKzXIi6s0qhSfxAnIV4FB8oiB0wHAj36ObMm+ANgtG
Js+nvzux31HvGeooeUddZ1K3Uhrq+u8J1I271QaTrS/MC9UGj65jqwgt0Rb9mZYLdbardkrAg95q
K8gnM8KaGVJO7VDtK3k6I7WTH1ufCFeQMajDnH6XdPISo9kiA96i096t4gUeY9+jvjgExbPHWasW
pUe24rlP7++wsCPHkvMM1HmCQBp1DiORR4Cktgu8SURzFMD+lOfMtiv6Cw/uzMq6zDGnNbDLvI14
++83+Sbx1JtZg1bvtQYKChp13cKW+WJjwLCwA757Y+XoM/FsLAmyordBc+gSG86vOModJ0elUZss
dcXHry/EK5eXqij5e7fGXGv5zQ/lEYrislstA0qhSubT9flPj1+D+unL9x83X7/hnu5VL/US1JIm
uNLU3a1Ex8EuYbA75VxKMGTFxbx/qvGIfWBTnfhqfjqUlLlJsA7nk9xyXnxTNh78uWrhcDjGz7z4
6+Z5rb0upLDdndqi1BoHaxiGrSGoBR6nHSwAjlB1kMeC6nNlBizhw9cR0T67ddhxtK2fncTWlx/O
OCGzNXpf9/z48PqIKflM/PPhDU9eoZYPf39+/GTWpn/8P98fX99uMhGvU45cLZ8NW1vBmYqnfz69
PTzfDBdzvuHEbZRnWDklG2HaZN2ARg43kqHi/pThuROfK0xNVpQYnJ6BrKlAqtYtRi5slXs6yHWu
S2o+Tk0hKitLLcMXYMBjXhGQ1ZAWgKzCQB7uh29v35VvXvschjvYOVIXB2Y4Ssgcf3348vD89Z9Y
eYs8OZZjdW5gUkP/VfqnPIFtX7X6nL82404nFQNsg8Ktivz653///vL0aaM++eiFijugILMsi135
5UmFjMNIQtwZWR6udTDxrH16D1mbftkl1iyNK/XaMsrDDRl25+JQDoY9doW202UXOtW1Q3cFW1ov
R4FWjnnbqeHQKVQ3uyFPV8N67OlFdwO14xWIr2ZwwhBTevqi2PUV1J7WMvliO3/O9kl90b+iWaZ6
mtK20ol1itNhLWhlf/wVUcSzmV+T1XWrL3FLQkrge+pk1MdhY4S00ZGmcRBZyNfLRUf44jV0ckZB
vSoqxjPe02eX7UsMgG6s5k3TTeqXUdCimJmZFeUp1wdoJl9zVnlytG8THQx0em/geukqWFIrBu25
3+TJYXadjUkCoxYF0G15rh5pzqAfhhyzTkpgicJrxaq9vfRdKdVQKwIdt2BatWdKGkzqkXZNdxrw
I6Yyx8Ag8cC+P3SqCHAPWwZm1mkKywtbAOo+7lSpJvBj2HqL6zC6Qse9ZLTXjjUe4dSTk1G6F46I
c+h1H4CqenDhjF5UPDGhbeLKnPeKoMoT1A6gVZQzGOj9W+mn3kO/S0Apd2CsJ98CWL66S9WY6nMl
wgKYRNyj0QCqR/whrSjQqwdFeJQdbkZzUHJzVShpNVb6C5INF1JPUvUhac19+PLx6fn54eW/hq/p
909PX2ET9PErhvL62823l68fH19fMbz5A+T5+emHsjTPqwI/NDXmSJHFgW/sUYCcJvIloIlcZlHg
hkZvcrpqhp+kIOt8+qRwEl7M9+WgVDM19IOQota+Z0jNob74npNVuecbysy5yEDNMZp31yRxbBSA
VPkS7TTUnRezpjMkK2tP99fdsL8KbPXw/anRESHAC7Yw6uMFC1UUTret5iivMvu6A7VmAftFvIOv
V1yQfUIcARA5dm0Z8UQNUaMA+J1tSLLdkLipNXNAQ2O1BmIUmeXdMoe+vD1NujqJoCVRbKbkyz9p
nZPx0UzID7HgS9nQurrQDaiUCJCHUAseO475Bd55iWPo7cNdqgTzkahG5yHVJb7JSzf6nmpXlyYT
ztEHZQqbuyreSzHtqyjtRgKHFHjapJXKfvxi/RZiJQStRE6Mz5jP75ie9uZHj2Q/sHwNfmofcMRD
19hwTWRqzcmK1E9SQ0Zlt0niGuJlOLLEUwOkap0kddzTZ5Ay/35Ev/QbfFiLGLNzV0SB47uUnVLm
SHyzSDP7dR36VbB8/Ao8IObQsWGugSHP4tA7MkNWWnMQDvVFf/P2/cvji54tahl409Wdrl3P3vUa
v1hQn14/PsJa+uXxKz409/j8zcxv6fbYN7+wJvTi1JhShBEPNICm6qrC8RQLor18MVIPnx9fHmBI
vsA6sTz4qIvzbqhOaDqt9UKPVRgSYrJqoHfs4pzDxnKH1DChM4u3M0sJYQN0f0PqIxwa32R7cbyM
El3txYsCuyhFODRahNTEkpkl3vvCEG+WFkaBIZTaS6S4yq68pkjiVKL1YZQS1NhTo6ss9NjbEsXA
sN1nMVkz9bGFmZok1ERrL2mkC3uDYWMJBDg2bVTtxfWT0FAOLyyKvMCsRDOkjePQdxwkDssJ3srh
kk4LC945PjEKAAwOeTt1xV2XUJ0AuDiWmxkSx3u1vmzVmvWO73S5b4znqW1PjktCTdi0tbHvAnmb
erF7VWLvT9u5Issbz8hHkIke638Pg9NGncPbKMvMZJxuX5QBDsr8YCrr4W24y/ZmfnlOh6QXaDkk
5W1CajG0yObSvAYadS1v1gLChPRqmLWB2DdlQnGXxq7xhSA1ImQ10BMnvl7yhqy6Uj9ewf3zw+uf
1nWn6NwoJDQk9JaNtj579EMLIrIOaolipe8qfWleV3Udm6s4HRdOR1mit7+/vn39/PR/H9FazVUB
41yU809O7WunyhhsgN3EU1xTVTTx0i1Q8dM28o1dK5omcmAwBSyzMI5sKTloSdkMnqPGidRRyzAa
bKRvtMqkhIrRMNe3VP/D4CrO7jI25p4jB0BQsVBxsFGxwIo1Yw0JQ7aFxuaptEDzIGCJrCMqKKqk
sm+rOfqupTH7HJYQSwdxzNvALNWZSrSkLO09tM9BDbT1XpL0LIKklh4azlnqOJaWsMpzQ8tErYbU
9a0TtU/ox2i1ofMdt99bplnjFi70VmDpD47voGGBrL1TAkWWNK+PN3iQvH/5+uUNkix2Ou7u/foG
O+qHl083f3l9eIM9wNPb419v/iGxTtVAIyEbdk6SSgrsRJwiyCjEi5M6Pwiia3JGrkuwRq481/hh
MUx7OUAIpyVJwXwRtYNq1Ec877753zdvjy+weXt7eXp4tjav6MdbNfdZGuZeUWgVrKavSLGiNqck
CUgf5RVdagqkX9jPdHs+eoGr9xsnetqZXTP48qeEpD9qGBw/ooj6QIZHVzOSzqPmWZ58mcefDkq0
pE5TItOItnOts8cxxiJxEt8cIMdJIpPVi7TZcymZO6Z6+umzLlQ/yBUSfW+WCvmPOv//o+xJlhvJ
dbzPV+j0ovow01qsxYc+MBdJbOfmZKac6kuGn1vlcrTLqrBd87r/fgAyFy6g7DnUIgBJgiQIgiQI
MHceqM9XFHBNjac9OUDKbImvBCw3Fh1MgenUGTnMl8RmlO/02HVypR/EsZp8+cxEEcVms7ZZRVjj
tGm+JroEgHNC9hbOdTXMSN+tfAJ7282MkgbzkFNeZTfVBRGFSbMkJs1iaY16xAPs5TSgwaEDXiOY
hBZOQ3ngieyltWtjf8W217Cwej6KQ1IrL1aO4EVzWLhsHzOEXs1s17OySuabhSNpCuzTe1JXbqwe
jmawDqIjTx7pEhh2KtsreziNN7b8qw6ak+Jg60ilkdZ9pawSUGd2fn3/NmGwZXp6uH/59eb8erp/
mVTjXPg1lAtJVB28nIGUzadTR/jyconhmrz6E/Ezb98FIWxibN2f7KJqsZg2JHRJQvU4UgoMY+Lq
epyGU+o4TIpbvVnOnTmqoK11fegSHK4SYs6bDvDdKr8yY3iq6DYi+rx+urZFAebXxtHwUj/Op0OW
aFmFuSL/6/9VbxViDARLl8hV/0pajYaTnFbg5Pzy/E9nuf1aJIlZqnGgOq5M0CRQ3+SiJVFy+6c2
rnHYu+z1O9rJ1/OrMkAcE2hx3Rx/t4QlC/Zzx9iRUJ+sALKwB0HCrN7BZ2JXtsxKoP21AlqTGbe5
C4exndjsEirQxIC1F1VWBWBJLly1slot/7bL5w1svJc+cZebjzmxHKO2Jh/vInKfl7VYWJOUiTCv
5rEJ3MeJcsxSJv75+/fziwzI9Pr1/uE0+RJny+l8PvtF99J0vBl7FT91rPnCuBjw7SBUJKXz+flt
8o53Zf97ej7/mLyc/uO1res0PbZbwm/ZdSOQhe9e7398e3og8rXztGl5UR8WlrdYpGekgh/yogNM
I8NTGeFRATqpkTkdopiO4yLJZMKGlHKyQPRNKnAsCmOJ7ODbgERtpe/0EDuMQuaHuFSuabB0mfwk
OYta2AxG7ZaX6R0jXz507TNu9xBWVVbnHEqWkkwCJQnfxWkrAxZ52uzD4Xdijx49FFaE+3gwADDq
Snd9OAH9RN+D4VdAiM8tpvqlcg8XPJnpsWp7eNYU8vzqetNcQC6dlI8+hpT1UKbaseR4b6iBzUEs
WRSTUVIRydJoV9S2uCpoS3pYafiQ35jt6uD4aLqoSk+pO1ZWStK3wllzWVhMvih/kfBc9H4iv8CP
l69Pjz9f79FtWj9B7gpu8UPqVPVzBXbL5NuP5/t/JvHL49PLyanSqtD0+huh7T6yWXFpzJ7VHMQv
cKAzkOX1IWaaw14HaJN4x8JjG1aN+46kp1HOoUsS3MdL/G0x8m0SpGlNts6kKmoyT47Gu0z+lfDd
vrInduB6ZUr1sYtthXKTCnsQ+qiG/hEQpPc0Ku8d282tRRTAtw0dFi9tgzzcC5OlgmXxEB6xH87i
/uX0bOkTSeh7XaorBKsQo37pGE0wMGIMPsYlO3h9+vPxZLGkHj/xBv7TrDeNpbMGbFRQ7Lllm70I
S6inFw+LyO7yuMrYgZPmDmBDXoLl0t7GqaO4imTm2/eovtmWuXf81dyxi6wiMu6FlLWZfgjfiZAl
otwCCHZg9JjlJcfHL/J9yW3Ny5thl7B9vf9+mvz759evsBRE9pUUrPxhGmHek7FUgMmnh0cdpLes
X8/l6k40b4uO96FRYAh/tjxJSvXezkSEeXGE4piD4Ck0N0i4+Yk4CrosRJBlIUIva2wJcAVGGd9l
bZxFnFErXV+j4biPTYy3MPniqNW9QJH4sGPGhe4W3w1hpLLYLIDQYUgKdJ3pYZJXPJH8VzzbkYP7
7f71z//cv56ou1LsUCn5pHwDtkjpK3H8sEumTvcNzE1z3I6gk+z9hA5H2aCLYqUlNOrJmAFjYC/B
OJl9xlNRmRBYJQSzONgFlAWKbT+Uc+PrvIgzNNaFVYKYRTLeHl1MduARNwVPgUzHphHcP7TQq+hQ
g2zQVZX8YLcOQd5whj3el26zx9MiyQ3fFSnOXZ5gvQIFhF1MAhs+Xqc+Rnq6o6j4be0Zko7I7p0O
TIc7xEZIc9XuGQm82DeKgux0gs7/aBQFtDqCZvcIeHW0eAMI2FsXymp3tDNSh/1ATsTCVE2LTjEb
Qi0XFV8lglNPGraBuTip32B6oU5uC7CjtvbcQTyGwksLWKUCmMTV0VdnFuegrLl3uG6OJR2tDHAL
a8U1WMjzKM8pJxlEVpuVGe8AdS6YQrCu+tTVjdEDRWr2dgjbKm6+SRuhGBoZbJUDGTvYoAlrUemv
z6CMu3Sz1A+hJKiCrStYsIXd8UXDZmQOLfzKOHPH4d63Kt1vm4SOpFSpJ0qcFC3vcMkohZ7FI4AN
d1NdLS02+myZFgMR23hC3UoBkxG5vGonBtWR5alP4QQw/I25lHUw+WRx5/RGj72gV4IyZ5HYx+Sb
Szm5Oo8Zs7vWMzL4XFrIvY1O3sO019WeLzsLrncXooxCFQ/9/uGv56fHb++Tf01ABPrYAM6pFuDU
u3V88MP1R3aI6Z8rjdBBUXm+GvE3VTTX77JGTHFHFijflN0l+lu1ETlE9hj6bMSxCOMt0a46FtX6
I6oL2aG1BjhBkLRqhqhrDkrGH5syuhESSefh0YiKzZKMBqPxxrIoLxlVvxtFdMRZAbjHGg/L+XSd
FDTTQbSaTel8ukN/lGETZsZu9gPZ7MsA+xuzU9hvLmnDeh+lQxCC8Pzydn4G+7nblio72pV9dTgM
P0Su+7sZYPg3qdNM/LaZ0vgyvxO/zYeDlC2oejArtlu8xLdLJpAwgSq11sLGpjTNCoK6zCt//ge6
+G53U7GbGE95aa/Nyz02VgG7/5wswTk379ss8joz87tkxl5Tjtge9p/O8OytdMY8GrOeV2Wc7Srq
dAnISnY39nm9158/YiH4wLyUL5PVNdWP0wNehiEPzoUF0rMrGKG9WQYLy7ohQO12a/PMClgbaEZb
VsMWN3FaGSc3nNrCIjLc41GR/Um45/Dr6Psmr3estL+BzSxLEtp6k19JFzA/+ljAzoqyKhELg7DL
s5IL45ijh6lu0shjvL2wYUkc5qnNdfzHTezneRenAS/pmOESvy3pDY1EJhiZgkz6h+gD7KySiJtM
AjPyzM6CHmOb7zuWVHnhLTq+E3mmP5eXDB1L68YGoRyftlugygL8zgJ9DUBQdcezPcts9jPBYSaZ
my3EJKFM+uNhWK3S5gdxlh+ouJ0Sme+4O4t6KP4otFAGA9ycTQgu6zRI4oJFc0ASlSHN7vpqakgT
Au/AfEtcIZMblBQGPbbhCdqZNvBoZbhAKGhXKdgWLQ/LXOTbygKDgReX8dGC1knFCTnKKkvc8rKK
b+yehyUf05KA9FKneJIirlhyzBrnS9AauAJ7vkoYWqOZkRyqQxxFZYmmBiS0oFzfKMsFkYJx1SwD
JuORWUAMZWAmspLgKmaOogAgDDho+pg+LJM0dVYk3glfptwudIcn80xw6rmgLBAW8er3/Iiljjzq
UKJvKu6dN6AyhBG9QQL3MGWd9lb7EnaYKRN00DQkqXFpbAv9NEGqJs7T3NYgDc/S3AT9EcO2NDGz
pfYwejbKr44RLI329FAZzNp9HTjjpjBqu9z98i2fSWG8m6SW8uGG17QxjLtWHaXltIKNK22ZqJQX
gB5sFCNBlf2dutRMo4nYKoSwC8QbQUDaxZHf9Eijht7YEUGb72Gbi+fLYP2pw3C9h5GiuxSknzak
ZAYSWJ8rHmrTrodYaXpO38+v/4j3p4e/iOw8/Sd1JjA8DFgPdaq/MxFFmbdBkoeGhgPLQMIco1Gv
bH9+e0crtvc8idyj86H6im9TKPVCM9vfpfbO2sWmIZpcLs2EmCMCjDlQZJ68S1l8h+umphfwl9pH
U7C2X2vGBXDEyRUDlHdORzmVlEGJO7AMjLR2f4d+J9kudm1vIHXHSn6vZUvRwQxUamLDxGJ1tWQW
VOYNmFLAuQs08rEPwKm56ZdwFQXZ326xCOdX5Om+6sA8gGFqb+sgtrtdYUp2ayEwIPLS9BPW4f7M
JZLqMlam0aBeEA/YpVtxUiyn/hZKtpZux3VwX4D1gcaIki6hXaICXN9rW1jt0KqqGP2MR0L0AP6W
nEZzX0huic/EBaTMZORHVyHDELcXCJJweT3z96Wb5WeQ4uXfFjCvLNcBVUKfMufC1JOOkf9+fnr5
68vslwko6Um5CyQevvn5go5AxOI2+TKaA79YkzdAMyl1mUkaGAh/d6DbzoXOkvlb8PSfzrmsiJys
LRLMC0cViF26mF0NDqPq8SNG2qjOrw/fLmimstosZ0NkQKSrXp8eH13CClTgzjgo0sFtn//CamWH
zUF17nN6nTQIIy5uvL3R0aRV5K1oH4N9GMSMOl42CIl7PQMfmm5cBo6FYGdatzUUnXkSaLazy6Mq
jTnZ9U8/3tFB/W3yrvp/FNfs9P716fkd/dakB9PkCw7T+/3r4+ndltVhOEoG29E4q7yNUAHiPh4R
2BJxypAxiLK4MsLfWiXgUVPmwVpBo8xWyNvBQTIDnNW6ITJOT7IdLAxjTOroXK11+Ahz9uGhu+51
NMCcmIwj5mCYaoBw3UiYOGZhWzVgOMqkvWgzoFuKuOOVvjfFYIVxtjPcTRA2ZFNR32kcomFUMjC7
dlFqnICzhuOn9N0Llvn7H1drT8oQGTORzWYN+YIFkRgDTmPxbqhuBMbF9aJpWoutPReSkKyXp2D0
RaGNN3cHgFwZ8Rg6eF60zFfwzcJTZhpu2zjS84DiZVBhMY2wylPAoW3MpRezB9K0WVBsu37Stvfh
3gIkjQlQcfctlgZgWtM3fjL9Ks1HZ8dZ4yWjis+nLSsCs36FmE1l92pgnlqEDZ4AWyCYbVkDe9Xs
Fq/inI6tbtq98I0aYsNbug3yUmuPwtCmu1TT2yPCkM9Ipkk1HczvrB7oycwArXe9gIzTQ4GQjoxH
uO0FqAP0gRvtIZQDH8PiI6hiVMBCg8G+INxsWoPHXS6BQwxjSRRdcRVPtcyFCMwDbDWZEqvTB80W
Pj9hMmJCs5kdnjKMTkgpNtgF8PGJWMqCeutGl5aFbrmV3PdOwklRqbuSSHWF4b3T/BCPbnt6J8ng
3x6/nw4t4mSL7RHEp2BjFNZBWO+9aTZu6LG6cVxw8e1CEurHUdEVaufOInTgIwBVJhMh563xPfyY
a6tEwUoZ+r/oPGgHMC5CHXJMPd+By1yOwHJsskKoDS+mQBCWY4zZGliL29w8ldMx9F2bRiG36UTx
ViNq3WCAH22oB31FQIH5DEA38fLWOLLhGCc2TjsULVcYATmmLB7EgE0f5mJhFyr9IdRlmOdDsJAa
i8ey1k8rEJRuVeChDnTYAoyDPNRtdSzimYUBE+F2G5lAnTFJlOWyAIIribbSU0tYar2p6eWuvG2D
YyGPTFgGcmBoEbRXLkR8RbTFnYTglo5kLioM1ca34YGM4yqzb/O8SvR4QRJYcv3MW8JsEqzc4ElC
s5jeqCjsQVgnaCbW4ltBpdrtjhA7v2j3DO7p4fX8dv76Ptn/8+P0+t+HyaOM508ctH5EOla/K+Nj
4HFxFRUD7UzpQM3XyIK0BS9ic3qXeRoP3i30UWCSsCxvdBeYccGXm+gW9oZFQurjjsCUnRwTKDf5
bE09Edwz0Pthop2wwg98mZXk+U2t3Y31hDATY9CIeq4ZqYO7Qsa2DtDuEMcZw/D5PBzXynMIfEZU
nr6eXk8vmIjx9Pb0qC96PBRmEhooWhSbGR3W8pOla61GS8vXhIvZ4Ey666sN1dEakQj1fGAGovAg
+HJxNfOizEB0JpI84tNIgnS20RdMDRVGYbzW35zpOPnmEzb+npq3IpEB4UVBpu4xCQXjnmJUPofL
JQyBxskeUGnHqBIAm4jZdL6RQRwjPXK+VkBj5wXQcFZqOIokbzJGaxRdatJifiGJrmykzP1BaQyJ
le9jAl6J9q6ExgAwm2/2RWjPl4DxG8wg5OuQIEzn69msjQ6FoREkYrNYOuWFabtaeJwqdYJ2Bxbv
RaqbPKM2Mlo3cXQMpjgIj7vMo7d7kn1JpqrqsJnpFjmC6QPgHi/oI0tEa4+rLjdqz2H6rsLDYkpP
Qom/9gggIFceB0SLak0dVZg06+tNeJh72VjN9TAUZSziSp5W6BvxOiCJdXUDK7yR7rsJneUH34Rs
0pSAZfYoSSi1hRuQt/1eir88nl6eHibiHL65x7sc839w4GVXO5sKHYenQvprBhs3XwZ+5PrCh2ZI
VB3bzKxQKR6qDZmkrqepwnpYoodbY6JHtD2wSs3efUUv2fJNe3X6C8sYO1NXbejLZfmO6Ohqviad
uy0aM1ang2yDqABuP1MO7giB9HJxvxe7KA4/W2K63YVbevXoKdIPqzy4FV6ijrPPUa/WKzqmrkW1
piJbWDR6NlcHNbTRS/BBx0saohf8tKoPPFWuV3rsDQfVxtX+8segxbYfUMCSfZHi+gJqZIDuDkmj
WPh4/DazxQc2J9KsfOOHqMuNkRQfDKCkUXPhM7xcFBhJ0AnDhQrXVHwRi8ZMreAgld31CZmTxJh6
5iJHQKO66TODhsQYyiAv4w+WZ4ua3gpoRCxKPmBSlpR5Dpkc8s8OK5J+3EOf1nWK+rO6brOc0dFt
Ly9b2srWnQmo/eL35/MjrI4/nu/f4fd3I+LFZ8gHE0dUrIS/w8UMekeFNzJtRXVs/cGmcfBLHM8k
FuEK7ylGKuq0fVkc8HKC3qXHzTHLRbuYL6eeYmzSq0/SLf1F2oQrizsLf/UR98ur+We5Z2W68rXA
ogR1KNRW13RS7vCAobNfydsjm2UDN/c0R2KvFpfZU9v6LT/oJzADrC1K84xSXnN90Dfy8zprOImV
mDYM6cgbmoSCxcgiEG+SrrvoOoTU+eX+ThQ8sx3wRqjvnkajuLVd9keU4OWW5EmnKWgfZo3CzjS8
F3Ha1pulaZtrykScf74+nIjUmuj80ebaIbyCwO42MAdVlCGoU/M0r9uIq28Ilvut9OBj0sH7vG6O
6wlmFZYOfW6R+o0eXnv6CbZVlZZTkHofW7wpUFU5tctE0SvvZ/ldYjekjJy2qaRsLnDJYZScKuV9
7YW2HCocVC9LWRGma6opfea/qgq9HzORXqO+s3jtxjoKGqwZ5nBa60gVP4HovEZcaEcGslvGFwjw
LhO6AlOOs+ICXcddwWEhC/ekC19Hom7dzVd7oHIP6xQ3k+irSvWJTLtXmJE1FFDQdwt9bV3qcN8x
nDyDrNILLZOnc21ZEN3Yd3F14/a72HdTNkzJFaBHp1Wt7UH62+lc6MHJBuJKH/O44xpTnztiUjSm
ywhs/EGi0pJ6pD0gZyvim4LSxqpiDDsnA6KYsbSGgYZRpm7vWBXCSM6mU7fXhpMIn4ro8FCrcfvU
w3Pz+F+6SmO0JRSd1VVgDrBhp1maeBhbxpMg1y4asc2pAekjOvXgUT47vyIA+7wvWBGi96HmhYC6
uYhCpzA1bYCU9IFHL480unW/kokmU7GzeDDXfpvDASt59NSprlGZfhuhQFba593pBUPITtStaXH/
eJJuee5DA/U1XqHuKvTwsssdMSBX7CP04HBwgU6qHfEhgV7U+Kj0g2ZpMi1LJQLKWXjlv4jXwdW+
zOud4V6P1k3ru3geJFASmMvblA/QkaMCazykgjpMZxgEyiimh6AvqeyW7tI6OA7R2DTr9XrqsIGw
MLwj4czhGoXZAik57GAqD+Pp+/n9hIkaXeOpjPHJUHcR4MDa0HCs7DXHATa7pfkNMiJCI5oYUa1i
58f3t0eCkyLV8ybLn9I9w4ZlwoaMlRtg2RO77pnZMKA2DgGUnNhkItVD1mlokUY2XHM46DvDaLR6
sJyHky/in7f30/dJ/jIJvz39+GXyht7hX2GuRFZS1G47DBts6kWOwD0Dyw7MSPkhhkNjJmoz/bhC
7mBNykOebemLMkWUeoj6x00EZ4pleY9Ic6xwuObhgmjs4DWUyHLyqW1HUsyZ7+uLDLt8javt9Qy/
bfW35gNQbIckPMHr+f7Ph/N3q3XjUgHksDp5r/IkHsxSUdHrLFm+rCBril+3r6fT28M9aNDb8yu/
dZjoCvmIVHl+/0/aXGqFvPQheXS+VNdCsDH5+2961LtNy226Mw0ZBc6KmKyHKFHWFL/IRSR5ej8p
PoKfT8/osj7MIffRAa9i/T0D/pStBEAXr8XB1gG6gAj+R/zb1cjU5yv/ryHlcXdARvV0b5R47BXQ
wqywtC3Id8nUPYlRTAGGXHtXMjpqZqcq6fNZRI7HjXqYZZt1yfvtz/tnkFHvJFDK8/8qe7LlxnFd
389XpPrp3qqemdhxEudW9QMlUbY62qLFcfKicieebtdkq9g5M3O+/gAkJXEB3XMfejEALuICgCQW
kBgdaXAq0XWQWLIrTcPQAt1kiRYqxGwAOC5ltadYM8+cAsCvPTx/KNNZAUsUopyWRG21vyrJhax6
bsO8rh3GpVRcOq4HOdL/0napOgtpcght0EJdeOLrIwmas8vLqyvDFEFDUOYuerlTuhz5/qWV8xS7
op5dNPTEU+ziJ+UufO1dUI+lGn5KjpZu4KOBL32tMPq9WVLIAF9HuzHz1Tw7/t1mNmsNTnvaaQQh
9YCi4fUnEw3MPBM0C6hxHnTxhZ7RSohaO2pAf4tcr1DFduBYixlmRiHKrIvgPJCQpj6KZvBoxAAr
ZWrdTUBveleFVZE2bMF7Mq9kF/RnR+l1auOCuRVXVlIHcS5C17un3YstXAcuQWEHl/p/pGyO3cBx
46u44pRI4usmHH3H+F+Hh9cX5YSk6a0GcRfX7Gqm7xsFN93UFDBj6zMjce4Iv7y8MFM26Kg5mcFc
UZRNjpnKnUolqwax2WVJHRJVV8386vKMOv8pgjo7P9dTEikwuk2QnwcImHb4+0y36gG5U1R6nOxI
Y9VKWeyiMjb0+KCZdOkUpAkVtxC9NDLdOh1v8PC9M+dNF1rwJLaPc7pVpQj1h12ClozTlLqEq8ow
oUyk5VVMnIXTjgfmS4q6bcxoD4vEY7yXmxqzgq4yOGm3Q5Bl+KlCV7vrEUmbOpmY+ZAQGrNr7mw5
UdUrJoMjakqw2OX89Fxv2LcRDFdq+IHsMa5NEN5oJebJugfjI4QDVTaEOpBXcFzVP01A3bOGhu1v
xO1S0S11mYUY6Wxn0y+TYEXfMCM2yagHb4lZT+y6RELuI3Wtu6akr6kFXroVLSjVTOBv6ovpqTWe
woP/zIaFE1z5tR7bWiHOjACVEljXLsT2cxjhyibd+xniAO7H4skgqWlFXxaXxmKeQRAhAubW+pGX
4RrAVBkFRO35pmwthJLn1jK3ZbkAptN5WKaRPS72w6GJRGZyHAsD6yfAZy0vVghtPzbhIflmqpDL
Sm5vs9AtxZUVxo69hWD5VObwIPQWwqwhbgQblnaxHm0MvYQr1knPI4tFw54IEVOa7GFAVzfUbh8Y
/D2bCBpNUVNzKGoewU0Ncv60s7yfdLtJn/dT39ZyLntLC4bqpmvzpFwm6L+dRB5/GZHmp7rB6FGe
1zokyBvLn9XUDLEt0A6CJDcuBooiX+DNGPrSlomhMhi4jEy6kqHPkBqc/orDnuDhxqRk4bWSbL3E
L1gVwd4LE8O2GCNkwWpIyiJsWKrPPhoWh/r9hjbeiGPNkjytKey6nphZ6SRc3G6Rxw+F7+WQCZVy
iKhO6TfwKyRjMCsDaelSYsBgIi/dCjHmWeJbZoJAcvYjFH7uq+GlvRscSoIjlPjGfQR97CVYUsjb
gUKXLhqijEIbbvrEKJiVEFxBkW1mpZG0WGGKMC4XzAGjAYsNHMyb3ZlAZ2y/LVZv+I6G92OlFlKZ
vwtmWC7vTuqPb3txlhk5oXKA7AA9VqMBVTovA41g9eqnIUeODGh1iYsqO3XLNFiHAH7aEeXzeurz
20a0/DQsbfZKjgcFx02CLMn5EBHpIMnzQvTFxIFQ76bzHDS0WpcWBoouJXtgfFKWlWcI93ySQLvt
VEy8ojhfJNzOYZ5ElWcWrr8fiMSv9andlYHAHmKDSjFzMcci9LCXsj+T4Fh4Pg+Yd11yVk3OJqdY
pTvlI8VMUXirSpaz00t3TKQmA2D4YQ2j0FImV7OunLYmRp7QiPli2cX5DOVDxKlLEPFaquSDuXtg
T6PH5ZldoVSurznPAgajm3lOcC6pf9EM+rqozm7QiOpAXpCaTEErjbFPacUtC42Rgp+eeG+IScsh
znC5fUd71A16PT6/vuwOr0RIanwGDk33GgRFWQjHjq600271X3Gk6oHdMuMKHIZ05uiL7OXx/XX3
qHUnj6rCeNOSgA40mwiNU0zPNhNLPsRbFfSRbD5922HUoM8//lT/+ffLo/zfJ1/12PhgNUA/2KnP
GWuIyBCk+cp4ohU/7UO2BArdL3FoEVyERVPaiP4UyPFV3FDzTTwUpS8tBBWal4nqPU8vPDbC18qX
j1i1aH4U3lbVEdMfpHtW2NcySuEeQ7csa0RBRn665EXoZ21896CBi+a81a7iC2CTVsXDs7L1warB
fIVx8Ral/lARTtFE0KIX9jhkHZXsrYxJfntyeN887F6+G97sfR0NdUUg2VGj+aD3EDNYywBdNIYF
ygAHcXKk+q5sqMrGPER9iFD3E8a2UEWj7v74kDIO/ktdF+vgYWowHCUoiWs+PHVnH0+H3dvT9i8j
EezIN9t1x6LF5dXUE1Sn9cYpRNRgjtu/NhKtDfOd6KZk+AtPRv0V6zilaZL5wg7gGFfw/5yHlKVh
WLRIoDUiVr8yTtSzXOHV6g3XF7VhY5eJwAvSeGYM0GJeDMpYebun7YkUW8awrkBdiljDu7jGgCk1
+XoAuATFt3HBPO10fqcA3Zo1puFhjyiLGrMEhtSZq6epedhWiZksCXBnHSkaADOz+zAzmrLqmelt
+Cq04qEJ2DVwITh6qEg5CvM1iKbmL7sstJYFIRy4TDbJkxqFnfVRA/6rg1KItUCM1eNvZdfXrWYm
/KYtGmaC9FHRwHqyT/xd5JgVEDhhZYZa1nAYSCKhLzuQ6pZV9GkWkf4cWou4nvrGJGjcAesZcZLK
gnpn46l/fO+LnPux2EVS6NMjyNc4/OYilBAZhLgzsweKBEsATkyHoAw0FXwXvDMofP3jeVjdlf6s
HnW34p4VHtd2hsfIBiQSIAJ7aj1nNp21wsRPDCojTl+C/cVMT/RTVgBUZLhCrCGQCF+8KoltKq6r
LXEG635iA6ZWn6x3JNY2RVzPfNMv0fRKQwXAWmehpZOMbFXG/SHrwawqKZxSzKpGKCYIkAnVIs8u
o2hZestEuso0LW5/VgoVYvpGSiNaw1IQA/IzwozDMBelG+0n3Dz8MLKO1j03NAHCDKZ2wXgLUcA5
1NAIe6Q3p6HCF8FXHJc0saLPIBK3GR3cTHVZdj/6BfTR36JVJMTnKD37rVIXV3h7Yk7k1yJNyMRf
90Cvc4o2ivuifeN0gzKkXFH/FrPmN77Gv/OG7hLgDBmR1VDO6uBKElFDx5rB5jksImDzC/5ldnap
S1Fv4byJ7ZYEyM/xBbq6Jefh6OfK8/F++/H4evI7NQzCpth480TAtRknUcBWmQKOR/kRrI6bmMGJ
fJJBSryNbFKrVhw4TN2RWOGrpa3zMkmjilPxkK95levdtg6VTVY6PympJBGOKibBsKsjfjEjZ2TZ
LoCDB+T8wlEnjrqw4obFGqswHQsD7ThZ4E24/Hb9ghX/GVdGfwPhTt7QTlLLGInoecTNZN1FhSH6
fAyaRZaGpACwxgwREPvFPxeila5+adUOv2UmC6OLwRHlIjjSsO+jvsaDemNBlLp56sBvQfqrvF4G
YxrwGN8RdYSYTowkCes2wwxjR7rkrrABQ2r7LhmljFtUmDkU80Zhmpii9AVTkrT3Rv5lCavwUKWt
R5Am+mDK31JZM3wQFEKG4e63403L6qU53z1Mqm5CulDmKQaVFNluvTCj+LkdpliyYoRaFOL8TNuF
UZRdCafRkvYEHgqI2TzWd3N4B3B6PyO7mt5Th/GxuXuy1H3d0A/zA8VM2CkHwnf6/uhg8yzgUcSJ
GcTcd4uMg0aqFBA0uz7TZOTav1Uxstnao9plNo8oHaF4k69nvs0OuAuqwMVROVqpZunbcVChKlpJ
BQa78hVrfV3kVWF9Yw9xjs49vGcTNpw6T/U48iqgR94n5AUjb26L6tqSHT0yNX8MXlKfdvvX+fz8
6pfJJx3dqz8dqD9mwQFz6cdcGlbOBm5+Tlm8WiRTT8Vz3VbRwlz6m7z4eZMXE1/FF9MjFVNmkBbJ
7Ehx6lnfIrnw9uvKg7k685W50q0yrTL+r7yaUVYLZmcuZ2bFoOrjourmnvYm0/NTb4OApKyYkUaE
RKabmtDgKQ0+o8HOZPUIOhiVTnHh6XKPd9Znj6CT2BqfRpuRGySU/4BBYO2c6yKZdxUBa+1+Yuh0
YLGMvm7pKUKOCZY8nZAEecPbqqCqD6uCNQmjjgQDyV2VpKlpBNTjFoynR9vGNHTXVEk43aQspwXu
QJO3CXWeNcbGShvW45q2uk7IaNdI0TaxYRzb5gluAuolo+huDUsm4z5bujluHz7ed4e/3ajr11yP
V4W/uorftLxW0t84ofGqTkB2gGYAhBhd2aPKq5ooCSnv53jUNzwUgt9dtAQ1lss8nVRppBF3bUko
aTTlRclEjO5dC6uXpkpC43bjqELdI+nTDcYJXrIq4jn0vBUhwMu7jqWgGassTAOlRaR3wK0hhiow
Dw19WVlU4raxLtoqJHU5zBAZitowkbN0ztKGhEJjLpbll0+/7b/tXn772G/fn18ft7/82D69Gc/D
CSb8wCHh+FLcYSAVzIgIfQ+Kglrw/dXIOA96qoK0zr58etq8PGLogs/41+Prny+f/948b+DX5vFt
9/J5v/l9CxXuHj/vXg7b77hcP397+/2TXMHX2/eX7dPJj8374/YFH+GclbwI4Xydtoskx5TGbdik
nA1BHmV+u5Pdy+6w2zzt/rPBwvpbT4KvGGgBdg0rLKd1QrIFf5Ynmjy4qzhlpH+EGheavo5EX9Hq
DdeflkiIfOWUpDEwOTPlkOZbSA5Nj/YP/ODWYjOX8ZgIW73opyB8//vt8Hry8Pq+PXl9P5FLTouv
KYjhmxZGiAYDPHXhnEUk0CWtr8OkXBoRakyEW2Rp5KfVgC5ppRtXjzCix97WmK+D12XpUl/rSX77
GvBU65KOwfpJuBmGVKLsRU0WHOIrWK9/imoRT6ZzOGI7iLxNaaDb9VL864DFP8TEt80SJEy/4sqP
b0+7h1/+2P598iAW33dMrP63vu37marph3OFjighrXA8DInx4+HxMlVUM3chZu4AADdd8em5DJcs
DYs+Dj+2L4fdw+awfTzhL+LTYN+d/Lk7/Dhh+/3rw06gos1h4+yvMMzciQoz4hPCJch/Nj0ti/Ru
cnZKxuLs99siqWGuiUpqfpOsjg0thzaASRk00rtfRLlB6bR3PyII3YGKAxfWuIs+JFYqD92yqXkx
qqBFTFnPDYuV6NeaaA/0GHQOd/fAsh9sd2lj5oimdScPr/9W/dpYYtI/z5gZuYN6XiaB9leu4UOO
TdrKyjEmH2F237f7g9tuFZ5NielCsDtYa5LlBim75tOA6KnEkGEmh3aayWmkO+D1q55sSpsAu60s
ItMO9Eh3zrIEFjdP8V9XNmTRxDC2VvtlySYUcHp+Qe2uJTufkDHgB/wZwWUIGD4fB4Urwm7LcxGm
WvLM3dsPw5tu2P810TmAdg0ZKF7h8zZIyIJVeGSgg7S4NVOTWAgn1Hm/EhjmIUlcthsyPOz0hRw2
CNgjvA/R1NTQdr4KGdNS7XrJ7gl1pmfE7qwZ2cwHYFVaWR+HiT8yrA1nRJHmtoitI6pcCa/Pb+/b
/V4q0faXx6nxDNYz1PuCaGE+O7J+rdvzEbo8yp7sa3IZ8QhOH6/PJ/nH87ftu4yG5RwChpVZJ11Y
VmRqnP4rq2DRZw8iMEuK20qMlYdax4XkG4NG4VT5NcHMmhwNx8s7B4taXEep0z2C1nAHrFdlHigo
tVdHwv5YuXJuoCDV9wGrEmcWQV2kvBlMKdVB4mn37X0DB5f314/D7oWQeGkSKNZEwIHHkAglUHqv
lWM0JE5u1qPFJQmNGrS94zXoSqGL7mUYqLX4dDM5RnKsGa8yMn7FqB6SRF7JtaTNcFh9l2Ucb27E
XQ/mPHN5z/b9gAETQMfdiyjVmPRoc/iAY+XDj+3DH3BG1ZMK4lsHzhgm+62HiyvtlsSmwC0hLWM+
fdLMT/5BqzJNrXdZon0gqzrxTG/IPfQvpPNwBQkIZkyoprHT3p8K4we0TaK/3fSoOMkj+AvjzwSJ
LmeKKjJ8gqok43DyygIjrbO8gNMdGOsGM3kKg48RKMwb0O4rzMp1uFwI27yKG5pWCAcOYFEGaHJh
Urj6WdglTduZpUxtEX6aUQ5NTAodDe7mHiGhkdASURCw6laKMatkQF74Au7C4Cgmfwm15zDYGK5S
HGqvIYMWPL5isjwqMu2bKRMq3HBJbglfAXVEsoTGaaNHeQIBPVgUmFD5XG7DZyT1jKRe3yPY/t2t
5xcOTLgLlS5twvQBVkAjDs0Ia5awph1EXcKSdaBB+NWBmXE4+21F3PdWMtBdWhgapw7F+vQVH+i5
nwPTbFOYhq4wl5UBXrOqYnfSWkHbfjWGtoKtusK4n5WeWnQ5JJ5VAJEXVre2zUUPJSLl+UJ3sxA4
kWSXlXYQLrHnEceiqOqa7mJmMJjB4ikuqlCkBe7afLjz1/jJrZWwUaSmtXtc8gp4U4+Qh8zt75uP
pwPmQT/svn+8fuxPnuX95eZ9uwGm/J/t/2mKAN5igwjssuAOpvTL5MLBoPEHqE9olzU51bZ6j6/x
/CZK08xEpxvr+jltllDXtSYJ0zwtEMPSZJGjYcaX+VirmAx0nPWaQPRTGcBEgF5akRkVFqlc3tpi
FGFe7UeFEMOOGu4O0Y0mKBZpEZi/iLi2eWoaPYTpfdcwPcdUdYPKh1ZvViaGgU2UZMZvdGWr8Bqq
qYx9AHuj372rqC7cPb3gDRpBFXHECJ9lLCM8T4yAp3GRN1rUYO3BJm9I01Gkn/81t2qY/6XzhRp9
qVJ9M9XoOlmk1u4SbxS3zMjAAHvQmBLgcxnT+FERfGULM81Gg1rQcZc/R5MxH2J6TUtA3953L4c/
TuCMdfL4vN3rzzOagSfwNxl5nLbGkfiQpXScLvgHDwKgZixSUIrSwUzl0ktx0ya8+TIbVpFMX+zW
MFBEdznD2I2WuY4B7kxTWVBZgwK0iY5XFVDpycYFNfwBDS4olEOgGlzvgA3n693T9pfD7lnpl3tB
+iDh7+7rV1xB08J54Mv0dDb/lzbPJUbox27qtlccg5SgwSusJ32jyT7XXKRmRHvTjDW6xLIxokl0
frnTv+4f99+IuK2WVrT99vH9Oz41JS/7w/vHs8o+PhqZsYUMqV5RMQ3kF5hmYj1M8Lhb/PtIQfGs
IegydEU7Uo/9UmhLwTaoWQ6aZJ40yNStZzyBJXfePxoQu1doH81T57iknveGOowdiZuBrxue1wn5
fCgIyiKpC9snRbZZFRFD5xNaIx3GQRLfru1lpkOGMBENWpRrvEz8tvdc2gaqDl3vEmDLX0LIADVC
Gc/UozDdw1XmxnL/GUZGjBMPrVajovJrVuuc2ELgTbopdcNQ9Edi3cO5xKIpH7LvvBjXFuhjUuMe
LSqYb305a0LpVvDzpHh9238+SV8f/vh4k5t2uXn5bjJyJlIXwLYHnZJcNRoevShbbiSaV/kSihbz
z2uemceal2YswEoeP5B/mMu5f4gm0PaKxYavOS+t87Y8uuOL07jZ/mf/tnvBVyjo0PPHYfvXFv6z
PTz8+uuv/6ud6tGTTdS9EBJ1UAsU/hbYSCuCGBNB+f8/LdpfgrnfU7agJkDoCE1l+JgJPg2LDRRy
vDcGFV8eKkfNGof/D8lxHjcHUKaB1TzgDYcmZmTTym+oP8SIXdgJTgDbtGqFJbr+mUfrlrezYWvM
aX+QwgSfoHEKITUsmulkrNosaGyzuM2lrBIjUVmbcMAuKlYuaZpe7MfWWBLI7jZplqiC2qxHoTPh
1gwEeAdjkaCbjPg+pARumzv8K8YbXluxzYtSVTsisApzGY7aqaieNn5iGJSIdBsZGaSMzqBEnxk2
TdpaKRpnW+3Prk6pyZUD0y9jd+dwVqV3SivUV5NVn66VNtv9ATcS8o3w9d/b9833rWbr1hpMWnou
qzwXNtg8sUgYX4txInFi/kwziGHsrsNi5fBw4M0AVoNghv5AetqYHeYaDyPYEM4yvj/QZvg886r1
x4ZqrEGwC1Dy0N2ii4qwxXMnfQaWnCVIUAEuKtp10Do1/Bdq8xMJj+QBAA==
--===============0943320623522759637==--

