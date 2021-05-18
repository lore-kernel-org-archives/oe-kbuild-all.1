Content-Type: multipart/mixed; boundary="===============5744810234111996288=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/dma/ppc4xx/adma.c:4094:14: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Tue, 18 May 2021 10:35:06 +0800
Message-ID: <202105181055.I05DWy2h-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5744810234111996288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ac91e6c6033ebc12c5c1e4aa171b81a662bd70f
commit: 68f35add4ba4c850a33878633e10c02d7ba32d84 dmaengine: ppc4xx: make pp=
c440spe_adma_chan_list static
date:   7 months ago
config: powerpc64-randconfig-s032-20210518 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D68f35add4ba4c850a33878633e10c02d7ba32d84
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 68f35add4ba4c850a33878633e10c02d7ba32d84
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
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

--===============5744810234111996288==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Bo9E0eXj3ml4/wJMRPVgJ3ICAA==
--===============5744810234111996288==--

