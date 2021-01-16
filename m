Content-Type: multipart/mixed; boundary="===============0008158016631451509=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/dma/ppc4xx/adma.c:4094:14: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Sun, 17 Jan 2021 07:35:27 +0800
Message-ID: <202101170719.V8Qkb8cA-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0008158016631451509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0da0a8a0a0e1845f495431c3d8d733d2bbf9e9e5
commit: 68f35add4ba4c850a33878633e10c02d7ba32d84 dmaengine: ppc4xx: make pp=
c440spe_adma_chan_list static
date:   3 months ago
config: powerpc-randconfig-s031-20210117 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D68f35add4ba4c850a33878633e10c02d7ba32d84
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 68f35add4ba4c850a33878633e10c02d7ba32d84
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
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
   drivers/dma/ppc4xx/adma.c:1031:31: sparse: sparse: incorrect type in arg=
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
>> drivers/dma/ppc4xx/adma.c:4094:14: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void *regs @@     got vo=
id [noderef] __iomem * @@
   drivers/dma/ppc4xx/adma.c:4094:14: sparse:     expected void *regs
   drivers/dma/ppc4xx/adma.c:4094:14: sparse:     got void [noderef] __iome=
m *
   drivers/dma/ppc4xx/adma.c:4102:31: sparse: sparse: too many warnings

vim +4094 drivers/dma/ppc4xx/adma.c

12458ea06efd7b Anatolij Gustschin       2009-12-11  4003  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4004  /**
12458ea06efd7b Anatolij Gustschin       2009-12-11  4005   * ppc440spe_adma=
_probe - probe the asynch device
12458ea06efd7b Anatolij Gustschin       2009-12-11  4006   */
463a1f8b3ceebe Bill Pemberton           2012-11-19  4007  static int ppc440=
spe_adma_probe(struct platform_device *ofdev)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4008  {
05c02542c20aa0 Anatolij Gustschin       2010-06-03  4009  	struct device_no=
de *np =3D ofdev->dev.of_node;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4010  	struct resource =
res;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4011  	struct ppc440spe=
_adma_device *adev;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4012  	struct ppc440spe=
_adma_chan *chan;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4013  	struct ppc_dma_c=
han_ref *ref, *_ref;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4014  	int ret =3D 0, i=
nitcode =3D PPC_ADMA_INIT_OK;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4015  	const u32 *idx;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4016  	int len;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4017  	void *regs;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4018  	u32 id, pool_siz=
e;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4019  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4020  	if (of_device_is=
_compatible(np, "amcc,xor-accelerator")) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4021  		id =3D PPC440SP=
E_XOR_ID;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4022  		/* As far as th=
e XOR engine is concerned, it does not
12458ea06efd7b Anatolij Gustschin       2009-12-11  4023  		 * use FIFOs bu=
t uses linked list. So there is no dependency
12458ea06efd7b Anatolij Gustschin       2009-12-11  4024  		 * between pool=
 size to allocate and the engine configuration.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4025  		 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4026  		pool_size =3D P=
AGE_SIZE << 1;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4027  	} else {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4028  		/* it is DMA0 o=
r DMA1 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4029  		idx =3D of_get_=
property(np, "cell-index", &len);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4030  		if (!idx || (le=
n !=3D sizeof(u32))) {
c6c93048baff25 Rob Herring              2017-07-18  4031  			dev_err(&ofdev=
->dev, "Device node %pOF has missing "
12458ea06efd7b Anatolij Gustschin       2009-12-11  4032  				"or invalid c=
ell-index property\n",
c6c93048baff25 Rob Herring              2017-07-18  4033  				np);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4034  			return -EINVAL;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4035  		}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4036  		id =3D *idx;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4037  		/* DMA0,1 engin=
es use FIFO to maintain CDBs, so we
12458ea06efd7b Anatolij Gustschin       2009-12-11  4038  		 * should alloc=
ate the pool accordingly to size of this
12458ea06efd7b Anatolij Gustschin       2009-12-11  4039  		 * FIFO. Thus, =
the pool size depends on the FIFO depth:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4040  		 * how much CDB=
s pointers the FIFO may contain then so
12458ea06efd7b Anatolij Gustschin       2009-12-11  4041  		 * much CDBs we=
 should provide in the pool.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4042  		 * That is
12458ea06efd7b Anatolij Gustschin       2009-12-11  4043  		 *   CDB size =
=3D 32B;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4044  		 *   CDBs numbe=
r =3D (DMA0_FIFO_SIZE >> 3);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4045  		 *   Pool size =
=3D CDBs number * CDB size =3D
12458ea06efd7b Anatolij Gustschin       2009-12-11  4046  		 *      =3D (DM=
A0_FIFO_SIZE >> 3) << 5 =3D DMA0_FIFO_SIZE << 2.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4047  		 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4048  		pool_size =3D (=
id =3D=3D PPC440SPE_DMA0_ID) ?
12458ea06efd7b Anatolij Gustschin       2009-12-11  4049  			    DMA0_FIFO_=
SIZE : DMA1_FIFO_SIZE;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4050  		pool_size <<=3D=
 2;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4051  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4052  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4053  	if (of_address_t=
o_resource(np, 0, &res)) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4054  		dev_err(&ofdev-=
>dev, "failed to get memory resource\n");
12458ea06efd7b Anatolij Gustschin       2009-12-11  4055  		initcode =3D PP=
C_ADMA_INIT_MEMRES;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4056  		ret =3D -ENODEV;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4057  		goto out;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4058  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4059  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4060  	if (!request_mem=
_region(res.start, resource_size(&res),
12458ea06efd7b Anatolij Gustschin       2009-12-11  4061  				dev_driver_st=
ring(&ofdev->dev))) {
a584bff5efae8c Joe Perches              2010-11-12  4062  		dev_err(&ofdev-=
>dev, "failed to request memory region %pR\n",
a584bff5efae8c Joe Perches              2010-11-12  4063  			&res);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4064  		initcode =3D PP=
C_ADMA_INIT_MEMREG;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4065  		ret =3D -EBUSY;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4066  		goto out;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4067  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4068  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4069  	/* create a devi=
ce */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4070  	adev =3D kzalloc=
(sizeof(*adev), GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4071  	if (!adev) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4072  		initcode =3D PP=
C_ADMA_INIT_ALLOC;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4073  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4074  		goto err_adev_a=
lloc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4075  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4076  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4077  	adev->id =3D id;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4078  	adev->pool_size =
=3D pool_size;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4079  	/* allocate cohe=
rent memory for hardware descriptors */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4080  	adev->dma_desc_p=
ool_virt =3D dma_alloc_coherent(&ofdev->dev,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4081  					adev->pool_s=
ize, &adev->dma_desc_pool,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4082  					GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4083  	if (adev->dma_de=
sc_pool_virt =3D=3D NULL) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4084  		dev_err(&ofdev-=
>dev, "failed to allocate %d bytes of coherent "
12458ea06efd7b Anatolij Gustschin       2009-12-11  4085  			"memory for ha=
rdware descriptors\n",
12458ea06efd7b Anatolij Gustschin       2009-12-11  4086  			adev->pool_siz=
e);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4087  		initcode =3D PP=
C_ADMA_INIT_COHERENT;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4088  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4089  		goto err_dma_al=
loc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4090  	}
d73111c6d43f08 Masanari Iida            2012-08-04  4091  	dev_dbg(&ofdev->=
dev, "allocated descriptor pool virt 0x%p phys 0x%llx\n",
12458ea06efd7b Anatolij Gustschin       2009-12-11  4092  		adev->dma_desc_=
pool_virt, (u64)adev->dma_desc_pool);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4093  =

12458ea06efd7b Anatolij Gustschin       2009-12-11 @4094  	regs =3D ioremap=
(res.start, resource_size(&res));
12458ea06efd7b Anatolij Gustschin       2009-12-11  4095  	if (!regs) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4096  		dev_err(&ofdev-=
>dev, "failed to ioremap regs!\n");
f3b77727e82722 Julia Lawall             2013-12-29  4097  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4098  		goto err_regs_a=
lloc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4099  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4100  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4101  	if (adev->id =3D=
=3D PPC440SPE_XOR_ID) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4102  		adev->xor_reg =
=3D regs;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4103  		/* Reset XOR */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4104  		iowrite32be(XOR=
_CRSR_XASR_BIT, &adev->xor_reg->crsr);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4105  		iowrite32be(XOR=
_CRSR_64BA_BIT, &adev->xor_reg->crrr);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4106  	} else {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4107  		size_t fifo_siz=
e =3D (adev->id =3D=3D PPC440SPE_DMA0_ID) ?
12458ea06efd7b Anatolij Gustschin       2009-12-11  4108  				   DMA0_FIFO_=
SIZE : DMA1_FIFO_SIZE;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4109  		adev->dma_reg =
=3D regs;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4110  		/* DMAx_FIFO_SI=
ZE is defined in bytes,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4111  		 * <fsiz> - is =
defined in number of CDB pointers (8byte).
12458ea06efd7b Anatolij Gustschin       2009-12-11  4112  		 * DMA FIFO Len=
gth =3D CSlength + CPlength, where
12458ea06efd7b Anatolij Gustschin       2009-12-11  4113  		 * CSlength =3D=
 CPlength =3D (fsiz + 1) * 8.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4114  		 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4115  		iowrite32(DMA_F=
IFO_ENABLE | ((fifo_size >> 3) - 2),
12458ea06efd7b Anatolij Gustschin       2009-12-11  4116  			  &adev->dma_r=
eg->fsiz);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4117  		/* Configure DM=
A engine */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4118  		iowrite32(DMA_C=
FG_DXEPR_HP | DMA_CFG_DFMPP_HP | DMA_CFG_FALGN,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4119  			  &adev->dma_r=
eg->cfg);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4120  		/* Clear Status=
 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4121  		iowrite32(~0, &=
adev->dma_reg->dsts);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4122  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4123  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4124  	adev->dev =3D &o=
fdev->dev;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4125  	adev->common.dev=
 =3D &ofdev->dev;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4126  	INIT_LIST_HEAD(&=
adev->common.channels);
dd3daca162f741 Jingoo Han               2013-05-24  4127  	platform_set_drv=
data(ofdev, adev);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4128  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4129  	/* create a chan=
nel */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4130  	chan =3D kzalloc=
(sizeof(*chan), GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4131  	if (!chan) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4132  		initcode =3D PP=
C_ADMA_INIT_CHANNEL;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4133  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4134  		goto err_chan_a=
lloc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4135  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4136  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4137  	spin_lock_init(&=
chan->lock);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4138  	INIT_LIST_HEAD(&=
chan->chain);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4139  	INIT_LIST_HEAD(&=
chan->all_slots);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4140  	chan->device =3D=
 adev;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4141  	chan->common.dev=
ice =3D &adev->common;
8ac695463f37af Russell King - ARM Linux 2012-03-06  4142  	dma_cookie_init(=
&chan->common);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4143  	list_add_tail(&c=
han->common.device_node, &adev->common.channels);
7f8281765f9949 Allen Pais               2020-08-31  4144  	tasklet_setup(&c=
han->irq_tasklet, ppc440spe_adma_tasklet);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4145  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4146  	/* allocate and =
map helper pages for async validation or
12458ea06efd7b Anatolij Gustschin       2009-12-11  4147  	 * async_mult/as=
ync_sum_product operations on DMA0/1.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4148  	 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4149  	if (adev->id !=
=3D PPC440SPE_XOR_ID) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4150  		chan->pdest_pag=
e =3D alloc_page(GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4151  		chan->qdest_pag=
e =3D alloc_page(GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4152  		if (!chan->pdes=
t_page ||
12458ea06efd7b Anatolij Gustschin       2009-12-11  4153  		    !chan->qdes=
t_page) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4154  			if (chan->pdes=
t_page)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4155  				__free_page(c=
han->pdest_page);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4156  			if (chan->qdes=
t_page)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4157  				__free_page(c=
han->qdest_page);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4158  			ret =3D -ENOME=
M;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4159  			goto err_page_=
alloc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4160  		}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4161  		chan->pdest =3D=
 dma_map_page(&ofdev->dev, chan->pdest_page, 0,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4162  					   PAGE_SIZE=
, DMA_BIDIRECTIONAL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4163  		chan->qdest =3D=
 dma_map_page(&ofdev->dev, chan->qdest_page, 0,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4164  					   PAGE_SIZE=
, DMA_BIDIRECTIONAL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4165  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4166  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4167  	ref =3D kmalloc(=
sizeof(*ref), GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4168  	if (ref) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4169  		ref->chan =3D &=
chan->common;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4170  		INIT_LIST_HEAD(=
&ref->node);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4171  		list_add_tail(&=
ref->node, &ppc440spe_adma_chan_list);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4172  	} else {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4173  		dev_err(&ofdev-=
>dev, "failed to allocate channel reference!\n");
12458ea06efd7b Anatolij Gustschin       2009-12-11  4174  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4175  		goto err_ref_al=
loc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4176  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4177  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4178  	ret =3D ppc440sp=
e_adma_setup_irqs(adev, chan, &initcode);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4179  	if (ret)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4180  		goto err_irq;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4181  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4182  	ppc440spe_adma_i=
nit_capabilities(adev);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4183  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4184  	ret =3D dma_asyn=
c_device_register(&adev->common);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4185  	if (ret) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4186  		initcode =3D PP=
C_ADMA_INIT_REGISTER;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4187  		dev_err(&ofdev-=
>dev, "failed to register dma device\n");
12458ea06efd7b Anatolij Gustschin       2009-12-11  4188  		goto err_dev_re=
g;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4189  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4190  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4191  	goto out;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4192  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4193  err_dev_reg:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4194  	ppc440spe_adma_r=
elease_irqs(adev, chan);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4195  err_irq:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4196  	list_for_each_en=
try_safe(ref, _ref, &ppc440spe_adma_chan_list, node) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4197  		if (chan =3D=3D=
 to_ppc440spe_adma_chan(ref->chan)) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4198  			list_del(&ref-=
>node);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4199  			kfree(ref);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4200  		}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4201  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4202  err_ref_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4203  	if (adev->id !=
=3D PPC440SPE_XOR_ID) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4204  		dma_unmap_page(=
&ofdev->dev, chan->pdest,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4205  			       PAGE_SI=
ZE, DMA_BIDIRECTIONAL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4206  		dma_unmap_page(=
&ofdev->dev, chan->qdest,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4207  			       PAGE_SI=
ZE, DMA_BIDIRECTIONAL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4208  		__free_page(cha=
n->pdest_page);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4209  		__free_page(cha=
n->qdest_page);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4210  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4211  err_page_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4212  	kfree(chan);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4213  err_chan_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4214  	if (adev->id =3D=
=3D PPC440SPE_XOR_ID)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4215  		iounmap(adev->x=
or_reg);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4216  	else
12458ea06efd7b Anatolij Gustschin       2009-12-11  4217  		iounmap(adev->d=
ma_reg);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4218  err_regs_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4219  	dma_free_coheren=
t(adev->dev, adev->pool_size,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4220  			  adev->dma_de=
sc_pool_virt,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4221  			  adev->dma_de=
sc_pool);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4222  err_dma_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4223  	kfree(adev);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4224  err_adev_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4225  	release_mem_regi=
on(res.start, resource_size(&res));
12458ea06efd7b Anatolij Gustschin       2009-12-11  4226  out:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4227  	if (id < PPC440S=
PE_ADMA_ENGINES_NUM)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4228  		ppc440spe_adma_=
devices[id] =3D initcode;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4229  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4230  	return ret;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4231  }
12458ea06efd7b Anatolij Gustschin       2009-12-11  4232  =


:::::: The code@line 4094 was first introduced by commit
:::::: 12458ea06efd7b44281e68fe59c950ec7d59c649 ppc440spe-adma: adds update=
d ppc440spe adma driver

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0008158016631451509==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0008158016631451509==--

