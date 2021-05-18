Content-Type: multipart/mixed; boundary="===============2172577980895924321=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/dma/ppc4xx/adma.c:4100:31: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Tue, 18 May 2021 12:18:28 +0800
Message-ID: <202105181216.SvMMGB2A-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2172577980895924321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ac91e6c6033ebc12c5c1e4aa171b81a662bd70f
commit: d991bb1c8da842a2a0b9dc83b1005e655783f861 include/linux/compiler-gcc=
.h: sparse can do constant folding of __builtin_bswap*()
date:   2 weeks ago
config: powerpc64-randconfig-s032-20210518 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd991bb1c8da842a2a0b9dc83b1005e655783f861
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d991bb1c8da842a2a0b9dc83b1005e655783f861
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/dma/ppc4xx/adma.c:1155:49: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1155:49: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1157:38: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1157:38: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1157:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:909:25: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct dma_regs *dma_reg =
@@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:909:25: sparse:     expected struct dma_regs *=
dma_reg
   drivers/dma/ppc4xx/adma.c:909:25: sparse:     got struct dma_regs [noder=
ef] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:910:40: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:910:40: sparse:     expected void const volati=
le [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:910:40: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:927:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:972:32: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:972:32: sparse:     expected void const volati=
le [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:972:32: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:977:40: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:977:40: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:977:40: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:982:25: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct xor_regs *xor_reg =
@@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:982:25: sparse:     expected struct xor_regs *=
xor_reg
   drivers/dma/ppc4xx/adma.c:982:25: sparse:     got struct xor_regs [noder=
ef] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:983:34: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:983:34: sparse:     expected void const [noder=
ef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:983:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:984:34: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem *a=
ddr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:984:34: sparse:     expected void [noderef] __=
iomem *addr
   drivers/dma/ppc4xx/adma.c:984:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:991:55: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:991:55: sparse:     expected void const [noder=
ef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:991:55: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:993:51: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem *a=
ddr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:993:51: sparse:     expected void [noderef] __=
iomem *addr
   drivers/dma/ppc4xx/adma.c:993:51: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:995:51: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:995:51: sparse:     expected void const [noder=
ef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:995:51: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:997:46: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem *a=
ddr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:997:46: sparse:     expected void [noderef] __=
iomem *addr
   drivers/dma/ppc4xx/adma.c:997:46: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1006:35: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1006:35: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1006:35: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1025:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct dma_regs *dma_reg=
 @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1025:25: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1025:25: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:1029:31: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1029:31: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1029:31: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1029:60: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1029:60: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1029:60: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1030:31: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1030:31: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1030:31: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1030:60: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1030:60: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1030:60: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1036:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1036:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1036:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1037:37: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1037:37: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1037:37: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1051:48: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected struct xor_regs *xor_re=
g @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1051:48: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1051:48: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1053:25: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1053:25: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1053:25: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1060:41: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1060:41: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1060:41: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1062:39: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1062:39: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1062:39: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1063:25: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1063:25: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1063:25: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1064:33: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1064:33: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1064:33: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1065:22: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1065:22: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1065:22: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1078:48: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected struct dma_regs *dma_re=
g @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1078:48: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1078:48: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:1088:26: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void volatile [noderef] =
__iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1088:26: sparse:     expected void volatile [n=
oderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1088:26: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1208:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1208:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1208:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1212:30: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1212:30: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1212:30: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:2775:62: sparse: sparse: Using plain integer a=
s NULL pointer
   drivers/dma/ppc4xx/adma.c:4092:14: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void *regs @@     got vo=
id [noderef] __iomem * @@
   drivers/dma/ppc4xx/adma.c:4092:14: sparse:     expected void *regs
   drivers/dma/ppc4xx/adma.c:4092:14: sparse:     got void [noderef] __iome=
m *
>> drivers/dma/ppc4xx/adma.c:4100:31: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs [noderef=
] __iomem *xor_reg @@     got void *regs @@
   drivers/dma/ppc4xx/adma.c:4100:31: sparse:     expected struct xor_regs =
[noderef] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:4100:31: sparse:     got void *regs
>> drivers/dma/ppc4xx/adma.c:4107:31: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct dma_regs [noderef=
] __iomem *dma_reg @@     got void *regs @@
   drivers/dma/ppc4xx/adma.c:4107:31: sparse:     expected struct dma_regs =
[noderef] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:4107:31: sparse:     got void *regs

vim +4100 drivers/dma/ppc4xx/adma.c

12458ea06efd7b Anatolij Gustschin       2009-12-11  4001  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4002  /**
12458ea06efd7b Anatolij Gustschin       2009-12-11  4003   * ppc440spe_adma=
_probe - probe the asynch device
12458ea06efd7b Anatolij Gustschin       2009-12-11  4004   */
463a1f8b3ceebe Bill Pemberton           2012-11-19  4005  static int ppc440=
spe_adma_probe(struct platform_device *ofdev)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4006  {
05c02542c20aa0 Anatolij Gustschin       2010-06-03  4007  	struct device_no=
de *np =3D ofdev->dev.of_node;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4008  	struct resource =
res;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4009  	struct ppc440spe=
_adma_device *adev;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4010  	struct ppc440spe=
_adma_chan *chan;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4011  	struct ppc_dma_c=
han_ref *ref, *_ref;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4012  	int ret =3D 0, i=
nitcode =3D PPC_ADMA_INIT_OK;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4013  	const u32 *idx;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4014  	int len;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4015  	void *regs;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4016  	u32 id, pool_siz=
e;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4017  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4018  	if (of_device_is=
_compatible(np, "amcc,xor-accelerator")) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4019  		id =3D PPC440SP=
E_XOR_ID;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4020  		/* As far as th=
e XOR engine is concerned, it does not
12458ea06efd7b Anatolij Gustschin       2009-12-11  4021  		 * use FIFOs bu=
t uses linked list. So there is no dependency
12458ea06efd7b Anatolij Gustschin       2009-12-11  4022  		 * between pool=
 size to allocate and the engine configuration.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4023  		 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4024  		pool_size =3D P=
AGE_SIZE << 1;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4025  	} else {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4026  		/* it is DMA0 o=
r DMA1 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4027  		idx =3D of_get_=
property(np, "cell-index", &len);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4028  		if (!idx || (le=
n !=3D sizeof(u32))) {
c6c93048baff25 Rob Herring              2017-07-18  4029  			dev_err(&ofdev=
->dev, "Device node %pOF has missing "
12458ea06efd7b Anatolij Gustschin       2009-12-11  4030  				"or invalid c=
ell-index property\n",
c6c93048baff25 Rob Herring              2017-07-18  4031  				np);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4032  			return -EINVAL;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4033  		}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4034  		id =3D *idx;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4035  		/* DMA0,1 engin=
es use FIFO to maintain CDBs, so we
12458ea06efd7b Anatolij Gustschin       2009-12-11  4036  		 * should alloc=
ate the pool accordingly to size of this
12458ea06efd7b Anatolij Gustschin       2009-12-11  4037  		 * FIFO. Thus, =
the pool size depends on the FIFO depth:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4038  		 * how much CDB=
s pointers the FIFO may contain then so
12458ea06efd7b Anatolij Gustschin       2009-12-11  4039  		 * much CDBs we=
 should provide in the pool.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4040  		 * That is
12458ea06efd7b Anatolij Gustschin       2009-12-11  4041  		 *   CDB size =
=3D 32B;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4042  		 *   CDBs numbe=
r =3D (DMA0_FIFO_SIZE >> 3);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4043  		 *   Pool size =
=3D CDBs number * CDB size =3D
12458ea06efd7b Anatolij Gustschin       2009-12-11  4044  		 *      =3D (DM=
A0_FIFO_SIZE >> 3) << 5 =3D DMA0_FIFO_SIZE << 2.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4045  		 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4046  		pool_size =3D (=
id =3D=3D PPC440SPE_DMA0_ID) ?
12458ea06efd7b Anatolij Gustschin       2009-12-11  4047  			    DMA0_FIFO_=
SIZE : DMA1_FIFO_SIZE;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4048  		pool_size <<=3D=
 2;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4049  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4050  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4051  	if (of_address_t=
o_resource(np, 0, &res)) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4052  		dev_err(&ofdev-=
>dev, "failed to get memory resource\n");
12458ea06efd7b Anatolij Gustschin       2009-12-11  4053  		initcode =3D PP=
C_ADMA_INIT_MEMRES;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4054  		ret =3D -ENODEV;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4055  		goto out;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4056  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4057  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4058  	if (!request_mem=
_region(res.start, resource_size(&res),
12458ea06efd7b Anatolij Gustschin       2009-12-11  4059  				dev_driver_st=
ring(&ofdev->dev))) {
a584bff5efae8c Joe Perches              2010-11-12  4060  		dev_err(&ofdev-=
>dev, "failed to request memory region %pR\n",
a584bff5efae8c Joe Perches              2010-11-12  4061  			&res);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4062  		initcode =3D PP=
C_ADMA_INIT_MEMREG;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4063  		ret =3D -EBUSY;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4064  		goto out;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4065  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4066  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4067  	/* create a devi=
ce */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4068  	adev =3D kzalloc=
(sizeof(*adev), GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4069  	if (!adev) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4070  		initcode =3D PP=
C_ADMA_INIT_ALLOC;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4071  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4072  		goto err_adev_a=
lloc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4073  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4074  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4075  	adev->id =3D id;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4076  	adev->pool_size =
=3D pool_size;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4077  	/* allocate cohe=
rent memory for hardware descriptors */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4078  	adev->dma_desc_p=
ool_virt =3D dma_alloc_coherent(&ofdev->dev,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4079  					adev->pool_s=
ize, &adev->dma_desc_pool,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4080  					GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4081  	if (adev->dma_de=
sc_pool_virt =3D=3D NULL) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4082  		dev_err(&ofdev-=
>dev, "failed to allocate %d bytes of coherent "
12458ea06efd7b Anatolij Gustschin       2009-12-11  4083  			"memory for ha=
rdware descriptors\n",
12458ea06efd7b Anatolij Gustschin       2009-12-11  4084  			adev->pool_siz=
e);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4085  		initcode =3D PP=
C_ADMA_INIT_COHERENT;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4086  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4087  		goto err_dma_al=
loc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4088  	}
d73111c6d43f08 Masanari Iida            2012-08-04  4089  	dev_dbg(&ofdev->=
dev, "allocated descriptor pool virt 0x%p phys 0x%llx\n",
12458ea06efd7b Anatolij Gustschin       2009-12-11  4090  		adev->dma_desc_=
pool_virt, (u64)adev->dma_desc_pool);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4091  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4092  	regs =3D ioremap=
(res.start, resource_size(&res));
12458ea06efd7b Anatolij Gustschin       2009-12-11  4093  	if (!regs) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4094  		dev_err(&ofdev-=
>dev, "failed to ioremap regs!\n");
f3b77727e82722 Julia Lawall             2013-12-29  4095  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4096  		goto err_regs_a=
lloc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4097  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4098  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4099  	if (adev->id =3D=
=3D PPC440SPE_XOR_ID) {
12458ea06efd7b Anatolij Gustschin       2009-12-11 @4100  		adev->xor_reg =
=3D regs;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4101  		/* Reset XOR */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4102  		iowrite32be(XOR=
_CRSR_XASR_BIT, &adev->xor_reg->crsr);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4103  		iowrite32be(XOR=
_CRSR_64BA_BIT, &adev->xor_reg->crrr);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4104  	} else {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4105  		size_t fifo_siz=
e =3D (adev->id =3D=3D PPC440SPE_DMA0_ID) ?
12458ea06efd7b Anatolij Gustschin       2009-12-11  4106  				   DMA0_FIFO_=
SIZE : DMA1_FIFO_SIZE;
12458ea06efd7b Anatolij Gustschin       2009-12-11 @4107  		adev->dma_reg =
=3D regs;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4108  		/* DMAx_FIFO_SI=
ZE is defined in bytes,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4109  		 * <fsiz> - is =
defined in number of CDB pointers (8byte).
12458ea06efd7b Anatolij Gustschin       2009-12-11  4110  		 * DMA FIFO Len=
gth =3D CSlength + CPlength, where
12458ea06efd7b Anatolij Gustschin       2009-12-11  4111  		 * CSlength =3D=
 CPlength =3D (fsiz + 1) * 8.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4112  		 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4113  		iowrite32(DMA_F=
IFO_ENABLE | ((fifo_size >> 3) - 2),
12458ea06efd7b Anatolij Gustschin       2009-12-11  4114  			  &adev->dma_r=
eg->fsiz);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4115  		/* Configure DM=
A engine */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4116  		iowrite32(DMA_C=
FG_DXEPR_HP | DMA_CFG_DFMPP_HP | DMA_CFG_FALGN,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4117  			  &adev->dma_r=
eg->cfg);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4118  		/* Clear Status=
 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4119  		iowrite32(~0, &=
adev->dma_reg->dsts);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4120  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4121  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4122  	adev->dev =3D &o=
fdev->dev;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4123  	adev->common.dev=
 =3D &ofdev->dev;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4124  	INIT_LIST_HEAD(&=
adev->common.channels);
dd3daca162f741 Jingoo Han               2013-05-24  4125  	platform_set_drv=
data(ofdev, adev);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4126  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4127  	/* create a chan=
nel */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4128  	chan =3D kzalloc=
(sizeof(*chan), GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4129  	if (!chan) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4130  		initcode =3D PP=
C_ADMA_INIT_CHANNEL;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4131  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4132  		goto err_chan_a=
lloc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4133  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4134  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4135  	spin_lock_init(&=
chan->lock);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4136  	INIT_LIST_HEAD(&=
chan->chain);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4137  	INIT_LIST_HEAD(&=
chan->all_slots);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4138  	chan->device =3D=
 adev;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4139  	chan->common.dev=
ice =3D &adev->common;
8ac695463f37af Russell King - ARM Linux 2012-03-06  4140  	dma_cookie_init(=
&chan->common);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4141  	list_add_tail(&c=
han->common.device_node, &adev->common.channels);
7f8281765f9949 Allen Pais               2020-08-31  4142  	tasklet_setup(&c=
han->irq_tasklet, ppc440spe_adma_tasklet);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4143  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4144  	/* allocate and =
map helper pages for async validation or
12458ea06efd7b Anatolij Gustschin       2009-12-11  4145  	 * async_mult/as=
ync_sum_product operations on DMA0/1.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4146  	 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4147  	if (adev->id !=
=3D PPC440SPE_XOR_ID) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4148  		chan->pdest_pag=
e =3D alloc_page(GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4149  		chan->qdest_pag=
e =3D alloc_page(GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4150  		if (!chan->pdes=
t_page ||
12458ea06efd7b Anatolij Gustschin       2009-12-11  4151  		    !chan->qdes=
t_page) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4152  			if (chan->pdes=
t_page)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4153  				__free_page(c=
han->pdest_page);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4154  			if (chan->qdes=
t_page)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4155  				__free_page(c=
han->qdest_page);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4156  			ret =3D -ENOME=
M;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4157  			goto err_page_=
alloc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4158  		}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4159  		chan->pdest =3D=
 dma_map_page(&ofdev->dev, chan->pdest_page, 0,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4160  					   PAGE_SIZE=
, DMA_BIDIRECTIONAL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4161  		chan->qdest =3D=
 dma_map_page(&ofdev->dev, chan->qdest_page, 0,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4162  					   PAGE_SIZE=
, DMA_BIDIRECTIONAL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4163  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4164  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4165  	ref =3D kmalloc(=
sizeof(*ref), GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4166  	if (ref) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4167  		ref->chan =3D &=
chan->common;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4168  		INIT_LIST_HEAD(=
&ref->node);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4169  		list_add_tail(&=
ref->node, &ppc440spe_adma_chan_list);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4170  	} else {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4171  		dev_err(&ofdev-=
>dev, "failed to allocate channel reference!\n");
12458ea06efd7b Anatolij Gustschin       2009-12-11  4172  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4173  		goto err_ref_al=
loc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4174  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4175  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4176  	ret =3D ppc440sp=
e_adma_setup_irqs(adev, chan, &initcode);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4177  	if (ret)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4178  		goto err_irq;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4179  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4180  	ppc440spe_adma_i=
nit_capabilities(adev);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4181  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4182  	ret =3D dma_asyn=
c_device_register(&adev->common);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4183  	if (ret) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4184  		initcode =3D PP=
C_ADMA_INIT_REGISTER;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4185  		dev_err(&ofdev-=
>dev, "failed to register dma device\n");
12458ea06efd7b Anatolij Gustschin       2009-12-11  4186  		goto err_dev_re=
g;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4187  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4188  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4189  	goto out;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4190  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4191  err_dev_reg:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4192  	ppc440spe_adma_r=
elease_irqs(adev, chan);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4193  err_irq:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4194  	list_for_each_en=
try_safe(ref, _ref, &ppc440spe_adma_chan_list, node) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4195  		if (chan =3D=3D=
 to_ppc440spe_adma_chan(ref->chan)) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4196  			list_del(&ref-=
>node);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4197  			kfree(ref);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4198  		}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4199  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4200  err_ref_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4201  	if (adev->id !=
=3D PPC440SPE_XOR_ID) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4202  		dma_unmap_page(=
&ofdev->dev, chan->pdest,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4203  			       PAGE_SI=
ZE, DMA_BIDIRECTIONAL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4204  		dma_unmap_page(=
&ofdev->dev, chan->qdest,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4205  			       PAGE_SI=
ZE, DMA_BIDIRECTIONAL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4206  		__free_page(cha=
n->pdest_page);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4207  		__free_page(cha=
n->qdest_page);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4208  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4209  err_page_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4210  	kfree(chan);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4211  err_chan_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4212  	if (adev->id =3D=
=3D PPC440SPE_XOR_ID)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4213  		iounmap(adev->x=
or_reg);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4214  	else
12458ea06efd7b Anatolij Gustschin       2009-12-11  4215  		iounmap(adev->d=
ma_reg);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4216  err_regs_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4217  	dma_free_coheren=
t(adev->dev, adev->pool_size,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4218  			  adev->dma_de=
sc_pool_virt,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4219  			  adev->dma_de=
sc_pool);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4220  err_dma_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4221  	kfree(adev);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4222  err_adev_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4223  	release_mem_regi=
on(res.start, resource_size(&res));
12458ea06efd7b Anatolij Gustschin       2009-12-11  4224  out:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4225  	if (id < PPC440S=
PE_ADMA_ENGINES_NUM)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4226  		ppc440spe_adma_=
devices[id] =3D initcode;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4227  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4228  	return ret;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4229  }
12458ea06efd7b Anatolij Gustschin       2009-12-11  4230  =


:::::: The code@line 4100 was first introduced by commit
:::::: 12458ea06efd7b44281e68fe59c950ec7d59c649 ppc440spe-adma: adds update=
d ppc440spe adma driver

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2172577980895924321==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2172577980895924321==--

