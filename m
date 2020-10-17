Content-Type: multipart/mixed; boundary="===============3625218349140919880=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/dma/ppc4xx/adma.c:1188:34: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Sat, 17 Oct 2020 11:35:29 +0800
Message-ID: <202010171124.Kz8dzhAM-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3625218349140919880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   071a0578b0ce0b0e543d1e38ee6926b9cc21c198
commit: 8f28ca6bd8211214faf717677bbffe375c2a6072 iomap: constify ioreadX() =
iomem argument (as in generic implementation)
date:   9 weeks ago
config: powerpc-randconfig-s032-20201017 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-rc1-2-g368fd9ce-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8f28ca6bd8211214faf717677bbffe375c2a6072
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8f28ca6bd8211214faf717677bbffe375c2a6072
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
   drivers/dma/ppc4xx/adma.c:688:38: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem * =
@@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:688:38: sparse:     expected void [noderef] __=
iomem *
   drivers/dma/ppc4xx/adma.c:688:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:689:38: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem * =
@@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:689:38: sparse:     expected void [noderef] __=
iomem *
   drivers/dma/ppc4xx/adma.c:689:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:690:38: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem * =
@@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:690:38: sparse:     expected void [noderef] __=
iomem *
   drivers/dma/ppc4xx/adma.c:690:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:691:39: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem * =
@@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:691:39: sparse:     expected void [noderef] __=
iomem *
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
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned int * @@
>> drivers/dma/ppc4xx/adma.c:1188:34: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1188:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1190:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1190:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1190:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1191:36: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1191:36: sparse:     expected void const [node=
ref] __iomem *
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
omem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1147:35: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1147:35: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1157:49: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1157:49: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1157:49: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1159:38: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1159:38: sparse:     expected void [noderef] _=
_iomem *
   drivers/dma/ppc4xx/adma.c:1159:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:911:25: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct dma_regs *dma_reg =
@@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:911:25: sparse:     expected struct dma_regs *=
dma_reg
   drivers/dma/ppc4xx/adma.c:911:25: sparse:     got struct dma_regs [noder=
ef] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:912:40: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:912:40: sparse:     expected void const [noder=
ef] __iomem *
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
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:974:32: sparse:     expected void const [noder=
ef] __iomem *
   drivers/dma/ppc4xx/adma.c:974:32: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:979:40: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem * =
@@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:979:40: sparse:     expected void [noderef] __=
iomem *
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
mem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:985:34: sparse:     expected void const [noder=
ef] __iomem *
   drivers/dma/ppc4xx/adma.c:985:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:986:34: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem * =
@@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:986:34: sparse:     expected void [noderef] __=
iomem *
   drivers/dma/ppc4xx/adma.c:986:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:993:55: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:993:55: sparse:     expected void const [noder=
ef] __iomem *
   drivers/dma/ppc4xx/adma.c:993:55: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:995:51: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem * =
@@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:995:51: sparse:     expected void [noderef] __=
iomem *
   drivers/dma/ppc4xx/adma.c:995:51: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:997:51: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:997:51: sparse:     expected void const [noder=
ef] __iomem *
   drivers/dma/ppc4xx/adma.c:997:51: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:999:46: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem * =
@@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:999:46: sparse:     expected void [noderef] __=
iomem *
   drivers/dma/ppc4xx/adma.c:999:46: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1008:35: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1008:35: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1008:35: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1027:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct dma_regs *dma_reg=
 @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1027:25: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1027:25: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
>> drivers/dma/ppc4xx/adma.c:1031:31: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1031:31: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1031:31: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1031:60: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1031:60: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1031:60: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1032:31: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1032:31: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1032:31: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1032:60: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1032:60: sparse:     expected void const [node=
ref] __iomem *
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
omem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1039:37: sparse:     expected void const [node=
ref] __iomem *
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
omem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1055:25: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1055:25: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1062:41: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1062:41: sparse:     expected void [noderef] _=
_iomem *
   drivers/dma/ppc4xx/adma.c:1062:41: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1064:39: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1064:39: sparse:     expected void [noderef] _=
_iomem *
   drivers/dma/ppc4xx/adma.c:1064:39: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1065:25: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1065:25: sparse:     expected void [noderef] _=
_iomem *
   drivers/dma/ppc4xx/adma.c:1065:25: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1066:33: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1066:33: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1066:33: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1067:22: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1067:22: sparse:     expected void [noderef] _=
_iomem *
   drivers/dma/ppc4xx/adma.c:1067:22: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1080:48: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected struct dma_regs *dma_re=
g @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1080:48: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1080:48: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:1090:26: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1090:26: sparse:     expected void [noderef] _=
_iomem *
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
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1214:30: sparse:     expected void [noderef] _=
_iomem *
   drivers/dma/ppc4xx/adma.c:1214:30: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:2777:62: sparse: sparse: Using plain integer a=
s NULL pointer
   drivers/dma/ppc4xx/adma.c:4094:14: sparse: sparse: too many warnings

vim +1188 drivers/dma/ppc4xx/adma.c

12458ea06efd7b Anatolij Gustschin 2009-12-11  1014  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1015  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  1016   * ppc440spe_chan_is_bu=
sy - get the channel status
12458ea06efd7b Anatolij Gustschin 2009-12-11  1017   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1018  static int ppc440spe_ch=
an_is_busy(struct ppc440spe_adma_chan *chan)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1019  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1020  	struct dma_regs *dma_r=
eg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1021  	struct xor_regs *xor_r=
eg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1022  	int busy =3D 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1023  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1024  	switch (chan->device->=
id) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1025  	case PPC440SPE_DMA0_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1026  	case PPC440SPE_DMA1_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1027  		dma_reg =3D chan->dev=
ice->dma_reg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1028  		/*  if command FIFO's=
 head and tail pointers are equal and
12458ea06efd7b Anatolij Gustschin 2009-12-11  1029  		 * status tail is the=
 same as command, then channel is free
12458ea06efd7b Anatolij Gustschin 2009-12-11  1030  		 */
12458ea06efd7b Anatolij Gustschin 2009-12-11 @1031  		if (ioread16(&dma_reg=
->cpfhp) !=3D ioread16(&dma_reg->cpftp) ||
12458ea06efd7b Anatolij Gustschin 2009-12-11  1032  		    ioread16(&dma_reg=
->cpftp) !=3D ioread16(&dma_reg->csftp))
12458ea06efd7b Anatolij Gustschin 2009-12-11  1033  			busy =3D 1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1034  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1035  	case PPC440SPE_XOR_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1036  		/* use the special st=
atus bit for the XORcore
12458ea06efd7b Anatolij Gustschin 2009-12-11  1037  		 */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1038  		xor_reg =3D chan->dev=
ice->xor_reg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1039  		busy =3D (ioread32be(=
&xor_reg->sr) & XOR_SR_XCP_BIT) ? 1 : 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1040  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1041  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1042  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1043  	return busy;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1044  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  1045  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1046  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  1047   * ppc440spe_chan_set_f=
irst_xor_descriptor -  init XORcore chain
12458ea06efd7b Anatolij Gustschin 2009-12-11  1048   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1049  static void ppc440spe_c=
han_set_first_xor_descriptor(
12458ea06efd7b Anatolij Gustschin 2009-12-11  1050  				struct ppc440spe_ad=
ma_chan *chan,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1051  				struct ppc440spe_ad=
ma_desc_slot *next_desc)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1052  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1053  	struct xor_regs *xor_r=
eg =3D chan->device->xor_reg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1054  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1055  	if (ioread32be(&xor_re=
g->sr) & XOR_SR_XCP_BIT)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1056  		printk(KERN_INFO "%s:=
 Warn: XORcore is running "
12458ea06efd7b Anatolij Gustschin 2009-12-11  1057  			"when try to set the=
 first CDB!\n",
12458ea06efd7b Anatolij Gustschin 2009-12-11  1058  			__func__);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1059  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1060  	xor_last_submit =3D xo=
r_last_linked =3D next_desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1061  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1062  	iowrite32be(XOR_CRSR_6=
4BA_BIT, &xor_reg->crsr);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1063  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1064  	iowrite32be(next_desc-=
>phys, &xor_reg->cblalr);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1065  	iowrite32be(0, &xor_re=
g->cblahr);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1066  	iowrite32be(ioread32be=
(&xor_reg->cbcr) | XOR_CBCR_LNK_BIT,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1067  		    &xor_reg->cbcr);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1068  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1069  	chan->hw_chain_inited =
=3D 1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1070  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  1071  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1072  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  1073   * ppc440spe_dma_put_de=
sc - put DMA0,1 descriptor to FIFO.
12458ea06efd7b Anatolij Gustschin 2009-12-11  1074   * called with irqs dis=
abled
12458ea06efd7b Anatolij Gustschin 2009-12-11  1075   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1076  static void ppc440spe_d=
ma_put_desc(struct ppc440spe_adma_chan *chan,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1077  		struct ppc440spe_adma=
_desc_slot *desc)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1078  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1079  	u32 pcdb;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1080  	struct dma_regs *dma_r=
eg =3D chan->device->dma_reg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1081  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1082  	pcdb =3D desc->phys;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1083  	if (!test_bit(PPC440SP=
E_DESC_INT, &desc->flags))
12458ea06efd7b Anatolij Gustschin 2009-12-11  1084  		pcdb |=3D DMA_CDB_NO_=
INT;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1085  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1086  	chan_last_sub[chan->de=
vice->id] =3D desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1087  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1088  	ADMA_LL_DBG(print_cb(c=
han, desc->hw_desc));
12458ea06efd7b Anatolij Gustschin 2009-12-11  1089  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1090  	iowrite32(pcdb, &dma_r=
eg->cpfpl);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1091  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  1092  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1093  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  1094   * ppc440spe_chan_appen=
d - update the h/w chain in the channel
12458ea06efd7b Anatolij Gustschin 2009-12-11  1095   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1096  static void ppc440spe_c=
han_append(struct ppc440spe_adma_chan *chan)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1097  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1098  	struct xor_regs *xor_r=
eg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1099  	struct ppc440spe_adma_=
desc_slot *iter;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1100  	struct xor_cb *xcb;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1101  	u32 cur_desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1102  	unsigned long flags;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1103  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1104  	local_irq_save(flags);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1105  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1106  	switch (chan->device->=
id) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1107  	case PPC440SPE_DMA0_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1108  	case PPC440SPE_DMA1_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1109  		cur_desc =3D ppc440sp=
e_chan_get_current_descriptor(chan);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1110  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1111  		if (likely(cur_desc))=
 {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1112  			iter =3D chan_last_s=
ub[chan->device->id];
12458ea06efd7b Anatolij Gustschin 2009-12-11  1113  			BUG_ON(!iter);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1114  		} else {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1115  			/* first peer */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1116  			iter =3D chan_first_=
cdb[chan->device->id];
12458ea06efd7b Anatolij Gustschin 2009-12-11  1117  			BUG_ON(!iter);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1118  			ppc440spe_dma_put_de=
sc(chan, iter);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1119  			chan->hw_chain_inite=
d =3D 1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1120  		}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1121  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1122  		/* is there something=
 new to append */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1123  		if (!iter->hw_next)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1124  			break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1125  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1126  		/* flush descriptors =
from the s/w queue to fifo */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1127  		list_for_each_entry_c=
ontinue(iter, &chan->chain, chain_node) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1128  			ppc440spe_dma_put_de=
sc(chan, iter);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1129  			if (!iter->hw_next)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1130  				break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1131  		}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1132  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1133  	case PPC440SPE_XOR_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1134  		/* update h/w links a=
nd refetch */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1135  		if (!xor_last_submit-=
>hw_next)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1136  			break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1137  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1138  		xor_reg =3D chan->dev=
ice->xor_reg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1139  		/* the last linked CD=
B has to generate an interrupt
12458ea06efd7b Anatolij Gustschin 2009-12-11  1140  		 * that we'd be able =
to append the next lists to h/w
12458ea06efd7b Anatolij Gustschin 2009-12-11  1141  		 * regardless of the =
XOR engine state at the moment of
12458ea06efd7b Anatolij Gustschin 2009-12-11  1142  		 * appending of these=
 next lists
12458ea06efd7b Anatolij Gustschin 2009-12-11  1143  		 */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1144  		xcb =3D xor_last_link=
ed->hw_desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1145  		xcb->cbc |=3D XOR_CBC=
R_CBCE_BIT;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1146  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1147  		if (!(ioread32be(&xor=
_reg->sr) & XOR_SR_XCP_BIT)) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1148  			/* XORcore is idle. =
Refetch now */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1149  			do_xor_refetch =3D 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1150  			ppc440spe_xor_set_li=
nk(xor_last_submit,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1151  				xor_last_submit->hw=
_next);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1152  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1153  			ADMA_LL_DBG(print_cb=
_list(chan,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1154  				xor_last_submit->hw=
_next));
12458ea06efd7b Anatolij Gustschin 2009-12-11  1155  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1156  			xor_last_submit =3D =
xor_last_linked;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1157  			iowrite32be(ioread32=
be(&xor_reg->crsr) |
12458ea06efd7b Anatolij Gustschin 2009-12-11  1158  				    XOR_CRSR_RCBE_B=
IT | XOR_CRSR_64BA_BIT,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1159  				    &xor_reg->crsr);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1160  		} else {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1161  			/* XORcore is runnin=
g. Refetch later in the handler */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1162  			do_xor_refetch =3D 1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1163  		}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1164  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1165  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1166  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1167  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1168  	local_irq_restore(flag=
s);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1169  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  1170  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1171  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  1172   * ppc440spe_chan_get_c=
urrent_descriptor - get the currently executed descriptor
12458ea06efd7b Anatolij Gustschin 2009-12-11  1173   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1174  static u32
12458ea06efd7b Anatolij Gustschin 2009-12-11  1175  ppc440spe_chan_get_curr=
ent_descriptor(struct ppc440spe_adma_chan *chan)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1176  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1177  	struct dma_regs *dma_r=
eg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1178  	struct xor_regs *xor_r=
eg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1179  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1180  	if (unlikely(!chan->hw=
_chain_inited))
12458ea06efd7b Anatolij Gustschin 2009-12-11  1181  		/* h/w descriptor cha=
in is not initialized yet */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1182  		return 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1183  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1184  	switch (chan->device->=
id) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1185  	case PPC440SPE_DMA0_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1186  	case PPC440SPE_DMA1_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1187  		dma_reg =3D chan->dev=
ice->dma_reg;
12458ea06efd7b Anatolij Gustschin 2009-12-11 @1188  		return ioread32(&dma_=
reg->acpl) & (~DMA_CDB_MSK);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1189  	case PPC440SPE_XOR_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1190  		xor_reg =3D chan->dev=
ice->xor_reg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1191  		return ioread32be(&xo=
r_reg->ccbalr);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1192  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1193  	return 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1194  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  1195  =


:::::: The code at line 1188 was first introduced by commit
:::::: 12458ea06efd7b44281e68fe59c950ec7d59c649 ppc440spe-adma: adds update=
d ppc440spe adma driver

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3625218349140919880==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
hpBw6gEA
--===============3625218349140919880==--

