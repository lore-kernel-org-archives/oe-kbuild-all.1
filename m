Content-Type: multipart/mixed; boundary="===============2716853628733869965=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/dma/ppc4xx/adma.c:688:38: sparse: sparse: incorrect type in argument 2 (different address spaces)
Date: Sun, 17 Jan 2021 08:13:13 +0800
Message-ID: <202101170808.3GkuRQY0-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2716853628733869965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0da0a8a0a0e1845f495431c3d8d733d2bbf9e9e5
commit: 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e powerpc: inline iomap acce=
ssors
date:   6 weeks ago
config: powerpc-randconfig-s031-20210117 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/dma/ppc4xx/adma.c:73:1: sparse: sparse: symbol 'ppc440spe_adma_c=
han_list' was not declared. Should it be static?
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:543:35: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected unsigned int [usertype] sg1l =
@@     got restricted __le32 [usertype] @@
   drivers/dma/ppc4xx/adma.c:543:35: sparse:     expected unsigned int [use=
rtype] sg1l
   drivers/dma/ppc4xx/adma.c:543:35: sparse:     got restricted __le32 [use=
rtype]
   drivers/dma/ppc4xx/adma.c:544:35: sparse: sparse: invalid assignment: |=
=3D
   drivers/dma/ppc4xx/adma.c:544:35: sparse:    left side has type unsigned=
 int
   drivers/dma/ppc4xx/adma.c:544:35: sparse:    right side has type restric=
ted __le32
   drivers/dma/ppc4xx/adma.c:590:23: sparse: sparse: invalid assignment: |=
=3D
   drivers/dma/ppc4xx/adma.c:590:23: sparse:    left side has type unsigned=
 int
   drivers/dma/ppc4xx/adma.c:590:23: sparse:    right side has type restric=
ted __le32
   drivers/dma/ppc4xx/adma.c:629:23: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected unsigned int [usertype] @@   =
  got restricted __le32 [usertype] @@
   drivers/dma/ppc4xx/adma.c:629:23: sparse:     expected unsigned int [use=
rtype]
   drivers/dma/ppc4xx/adma.c:629:23: sparse:     got restricted __le32 [use=
rtype]
   drivers/dma/ppc4xx/adma.c:630:23: sparse: sparse: invalid assignment: |=
=3D
   drivers/dma/ppc4xx/adma.c:630:23: sparse:    left side has type unsigned=
 int
   drivers/dma/ppc4xx/adma.c:630:23: sparse:    right side has type restric=
ted __le32
   drivers/dma/ppc4xx/adma.c:655:34: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected unsigned int [usertype] cnt @=
@     got restricted __le32 [usertype] @@
   drivers/dma/ppc4xx/adma.c:655:34: sparse:     expected unsigned int [use=
rtype] cnt
   drivers/dma/ppc4xx/adma.c:655:34: sparse:     got restricted __le32 [use=
rtype]
>> drivers/dma/ppc4xx/adma.c:688:38: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:688:38: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:688:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:689:38: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:689:38: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:689:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:690:38: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:690:38: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:690:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:691:39: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:691:39: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:691:39: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:738:69: sparse: sparse: Using plain integer as=
 NULL pointer
   drivers/dma/ppc4xx/adma.c:1187:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct dma_regs *dma_reg=
 @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1187:25: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1187:25: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
>> drivers/dma/ppc4xx/adma.c:1188:34: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1188:34: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1188:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1190:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1190:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1190:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
>> drivers/dma/ppc4xx/adma.c:1191:36: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1191:36: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1191:36: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1138:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1138:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1138:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1147:35: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1147:35: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1147:35: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1157:49: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1157:49: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1157:49: sparse:     got unsigned int *
>> drivers/dma/ppc4xx/adma.c:1159:38: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1159:38: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1159:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:911:25: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct dma_regs *dma_reg =
@@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:911:25: sparse:     expected struct dma_regs *=
dma_reg
   drivers/dma/ppc4xx/adma.c:911:25: sparse:     got struct dma_regs [noder=
ef] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:912:40: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:912:40: sparse:     expected void const volati=
le [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:912:40: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:929:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:929:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:929:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:929:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:929:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:929:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:974:32: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:974:32: sparse:     expected void const volati=
le [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:974:32: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:979:40: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:979:40: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:979:40: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:984:25: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct xor_regs *xor_reg =
@@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:984:25: sparse:     expected struct xor_regs *=
xor_reg
   drivers/dma/ppc4xx/adma.c:984:25: sparse:     got struct xor_regs [noder=
ef] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:985:34: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:985:34: sparse:     expected void const [noder=
ef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:985:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:986:34: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem *a=
ddr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:986:34: sparse:     expected void [noderef] __=
iomem *addr
   drivers/dma/ppc4xx/adma.c:986:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:993:55: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:993:55: sparse:     expected void const [noder=
ef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:993:55: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:995:51: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem *a=
ddr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:995:51: sparse:     expected void [noderef] __=
iomem *addr
   drivers/dma/ppc4xx/adma.c:995:51: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:997:51: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:997:51: sparse:     expected void const [noder=
ef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:997:51: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:999:46: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem *a=
ddr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:999:46: sparse:     expected void [noderef] __=
iomem *addr
   drivers/dma/ppc4xx/adma.c:999:46: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1008:35: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1008:35: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1008:35: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1027:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct dma_regs *dma_reg=
 @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1027:25: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1027:25: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
>> drivers/dma/ppc4xx/adma.c:1031:31: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1031:31: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1031:31: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1031:60: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1031:60: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1031:60: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1032:31: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1032:31: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1032:31: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1032:60: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1032:60: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1032:60: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1038:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1038:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1038:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1039:37: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1039:37: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1039:37: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1053:48: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected struct xor_regs *xor_re=
g @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1053:48: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1053:48: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1055:25: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1055:25: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1055:25: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1062:41: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1062:41: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1062:41: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1064:39: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1064:39: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1064:39: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1065:25: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1065:25: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1065:25: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1066:33: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1066:33: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1066:33: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1067:22: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1067:22: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1067:22: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1080:48: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected struct dma_regs *dma_re=
g @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1080:48: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1080:48: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:1090:26: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void volatile [noderef] =
__iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1090:26: sparse:     expected void volatile [n=
oderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1090:26: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1210:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1210:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1210:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1214:30: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1214:30: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1214:30: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:2777:62: sparse: sparse: Using plain integer a=
s NULL pointer
   drivers/dma/ppc4xx/adma.c:4094:14: sparse: sparse: too many warnings

vim +688 drivers/dma/ppc4xx/adma.c

12458ea06efd7b Anatolij Gustschin 2009-12-11  675  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  676  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  677   * ppc440spe_desc_set_dc=
heck - set CHECK pattern
12458ea06efd7b Anatolij Gustschin 2009-12-11  678   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  679  static void ppc440spe_de=
sc_set_dcheck(struct ppc440spe_adma_desc_slot *desc,
12458ea06efd7b Anatolij Gustschin 2009-12-11  680  				struct ppc440spe_adm=
a_chan *chan, u8 *qword)
12458ea06efd7b Anatolij Gustschin 2009-12-11  681  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  682  	struct dma_cdb *dma_hw_=
desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  683  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  684  	switch (chan->device->i=
d) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  685  	case PPC440SPE_DMA0_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  686  	case PPC440SPE_DMA1_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  687  		dma_hw_desc =3D desc->=
hw_desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11 @688  		iowrite32(qword[0], &d=
ma_hw_desc->sg3l);
12458ea06efd7b Anatolij Gustschin 2009-12-11  689  		iowrite32(qword[4], &d=
ma_hw_desc->sg3u);
12458ea06efd7b Anatolij Gustschin 2009-12-11  690  		iowrite32(qword[8], &d=
ma_hw_desc->sg2l);
12458ea06efd7b Anatolij Gustschin 2009-12-11  691  		iowrite32(qword[12], &=
dma_hw_desc->sg2u);
12458ea06efd7b Anatolij Gustschin 2009-12-11  692  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  693  	default:
12458ea06efd7b Anatolij Gustschin 2009-12-11  694  		BUG();
12458ea06efd7b Anatolij Gustschin 2009-12-11  695  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  696  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  697  =


:::::: The code at line 688 was first introduced by commit
:::::: 12458ea06efd7b44281e68fe59c950ec7d59c649 ppc440spe-adma: adds update=
d ppc440spe adma driver

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2716853628733869965==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
j+uNAQA=
--===============2716853628733869965==--

