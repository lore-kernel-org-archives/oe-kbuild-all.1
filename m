Content-Type: multipart/mixed; boundary="===============0782160676068959036=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/net/wan/fsl_ucc_hdlc.c:305:57: sparse: sparse: incorrect type in argument 2 (different address spaces)
Date: Sat, 09 Jan 2021 19:06:16 +0800
Message-ID: <202101091911.UzsdDT9M-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0782160676068959036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   996e435fd401de35df62ac943ab9402cfe85c430
commit: 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e powerpc: inline iomap acce=
ssors
date:   5 weeks ago
config: powerpc-randconfig-s032-20210109 (attached as .config)
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
>> drivers/net/wan/fsl_ucc_hdlc.c:305:57: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected void [noderef] __iom=
em *addr @@     got restricted __be16 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:305:57: sparse:     expected void [nodere=
f] __iomem *addr
   drivers/net/wan/fsl_ucc_hdlc.c:305:57: sparse:     got restricted __be16=
 *
>> drivers/net/wan/fsl_ucc_hdlc.c:307:46: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected void [noderef] __iom=
em *addr @@     got restricted __be32 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:307:46: sparse:     expected void [nodere=
f] __iomem *addr
   drivers/net/wan/fsl_ucc_hdlc.c:307:46: sparse:     got restricted __be32=
 *
   drivers/net/wan/fsl_ucc_hdlc.c:316:57: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected void [noderef] __iom=
em *addr @@     got restricted __be16 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:316:57: sparse:     expected void [nodere=
f] __iomem *addr
   drivers/net/wan/fsl_ucc_hdlc.c:316:57: sparse:     got restricted __be16=
 *
   drivers/net/wan/fsl_ucc_hdlc.c:318:46: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected void [noderef] __iom=
em *addr @@     got restricted __be32 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:318:46: sparse:     expected void [nodere=
f] __iomem *addr
   drivers/net/wan/fsl_ucc_hdlc.c:318:46: sparse:     got restricted __be32=
 *
   drivers/net/wan/fsl_ucc_hdlc.c:368:29: sparse: sparse: incorrect type in=
 assignment (different base types) @@     expected unsigned short [usertype=
] @@     got restricted __be16 [usertype] @@
   drivers/net/wan/fsl_ucc_hdlc.c:368:29: sparse:     expected unsigned sho=
rt [usertype]
   drivers/net/wan/fsl_ucc_hdlc.c:368:29: sparse:     got restricted __be16=
 [usertype]
   drivers/net/wan/fsl_ucc_hdlc.c:375:36: sparse: sparse: restricted __be16=
 degrades to integer
   drivers/net/wan/fsl_ucc_hdlc.c:398:12: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct qe_bd [nodere=
f] __iomem *bd @@     got struct qe_bd *curtx_bd @@
   drivers/net/wan/fsl_ucc_hdlc.c:398:12: sparse:     expected struct qe_bd=
 [noderef] __iomem *bd
   drivers/net/wan/fsl_ucc_hdlc.c:398:12: sparse:     got struct qe_bd *cur=
tx_bd
   drivers/net/wan/fsl_ucc_hdlc.c:421:20: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct qe_bd [nodere=
f] __iomem *[assigned] bd @@     got struct qe_bd *tx_bd_base @@
   drivers/net/wan/fsl_ucc_hdlc.c:421:20: sparse:     expected struct qe_bd=
 [noderef] __iomem *[assigned] bd
   drivers/net/wan/fsl_ucc_hdlc.c:421:20: sparse:     got struct qe_bd *tx_=
bd_base
   drivers/net/wan/fsl_ucc_hdlc.c:423:16: sparse: sparse: incompatible type=
s in comparison expression (different address spaces):
   drivers/net/wan/fsl_ucc_hdlc.c:423:16: sparse:    struct qe_bd [noderef]=
 __iomem *
   drivers/net/wan/fsl_ucc_hdlc.c:423:16: sparse:    struct qe_bd *
>> drivers/net/wan/fsl_ucc_hdlc.c:458:33: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const [noderef]=
 __iomem *addr @@     got restricted __be16 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:502:41: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const [noderef]=
 __iomem *addr @@     got restricted __be16 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:524:33: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const [noderef]=
 __iomem *addr @@     got restricted __be16 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:548:38: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const [noderef]=
 __iomem *addr @@     got restricted __be16 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:592:67: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected void [noderef] __iom=
em *addr @@     got restricted __be16 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:607:41: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const [noderef]=
 __iomem *addr @@     got restricted __be16 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:631:17: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected unsigned int volatile [n=
oderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] [us=
ertype] __iomem *p_uccm @@
   drivers/net/wan/fsl_ucc_hdlc.c:631:17: sparse: sparse: incorrect type in=
 argument 1 (different base types) @@     expected unsigned int const volat=
ile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [nodere=
f] [usertype] __iomem *p_uccm @@
   drivers/net/wan/fsl_ucc_hdlc.c:850:38: sparse: sparse: incorrect type in=
 initializer (different address spaces) @@     expected struct qe_mux *qe_m=
ux_reg @@     got struct qe_mux [noderef] __iomem * @@
>> drivers/net/wan/fsl_ucc_hdlc.c:853:40: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const [noderef]=
 __iomem *addr @@     got restricted __be32 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:854:40: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const [noderef]=
 __iomem *addr @@     got restricted __be32 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:857:39: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const [noderef]=
 __iomem *addr @@     got restricted __be32 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:860:37: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected void const volatile =
[noderef] __iomem *s @@     got restricted __be32 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:865:38: sparse: sparse: incorrect type in=
 initializer (different address spaces) @@     expected struct qe_mux *qe_m=
ux_reg @@     got struct qe_mux [noderef] __iomem * @@
   drivers/net/wan/fsl_ucc_hdlc.c:867:21: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void volatile [noder=
ef] __iomem *d @@     got restricted __be32 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:869:40: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected void [noderef] __iom=
em *addr @@     got restricted __be32 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:870:40: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected void [noderef] __iom=
em *addr @@     got restricted __be32 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:872:39: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected void [noderef] __iom=
em *addr @@     got restricted __be32 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:992:57: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected void [noderef] __iom=
em *addr @@     got restricted __be16 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:994:46: sparse: sparse: incorrect type in=
 argument 2 (different address spaces) @@     expected void [noderef] __iom=
em *addr @@     got restricted __be32 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:1003:57: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void [noderef] __io=
mem *addr @@     got restricted __be16 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:1005:46: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@     expected void [noderef] __io=
mem *addr @@     got restricted __be32 * @@
   drivers/net/wan/fsl_ucc_hdlc.c:408:35: sparse: sparse: dereference of no=
deref expression
   drivers/net/wan/fsl_ucc_hdlc.c:723:29: sparse: sparse: dereference of no=
deref expression
   drivers/net/wan/fsl_ucc_hdlc.c:814:21: sparse: sparse: dereference of no=
deref expression
   drivers/net/wan/fsl_ucc_hdlc.c:1020:29: sparse: sparse: dereference of n=
oderef expression

vim +305 drivers/net/wan/fsl_ucc_hdlc.c

c19b6d246a35627c Zhao Qiang       2016-06-06   77  =

c19b6d246a35627c Zhao Qiang       2016-06-06   78  static int uhdlc_init(st=
ruct ucc_hdlc_private *priv)
c19b6d246a35627c Zhao Qiang       2016-06-06   79  {
c19b6d246a35627c Zhao Qiang       2016-06-06   80  	struct ucc_tdm_info *ut=
_info;
c19b6d246a35627c Zhao Qiang       2016-06-06   81  	struct ucc_fast_info *u=
f_info;
c19b6d246a35627c Zhao Qiang       2016-06-06   82  	u32 cecr_subblock;
c19b6d246a35627c Zhao Qiang       2016-06-06   83  	u16 bd_status;
c19b6d246a35627c Zhao Qiang       2016-06-06   84  	int ret, i;
c19b6d246a35627c Zhao Qiang       2016-06-06   85  	void *bd_buffer;
c19b6d246a35627c Zhao Qiang       2016-06-06   86  	dma_addr_t bd_dma_addr;
be2e9415f8b366ab Rasmus Villemoes 2019-11-28   87  	s32 riptr;
be2e9415f8b366ab Rasmus Villemoes 2019-11-28   88  	s32 tiptr;
c19b6d246a35627c Zhao Qiang       2016-06-06   89  	u32 gumr;
c19b6d246a35627c Zhao Qiang       2016-06-06   90  =

c19b6d246a35627c Zhao Qiang       2016-06-06   91  	ut_info =3D priv->ut_in=
fo;
c19b6d246a35627c Zhao Qiang       2016-06-06   92  	uf_info =3D &ut_info->u=
f_info;
c19b6d246a35627c Zhao Qiang       2016-06-06   93  =

c19b6d246a35627c Zhao Qiang       2016-06-06   94  	if (priv->tsa) {
c19b6d246a35627c Zhao Qiang       2016-06-06   95  		uf_info->tsa =3D 1;
c19b6d246a35627c Zhao Qiang       2016-06-06   96  		uf_info->ctsp =3D 1;
040b7c94e4ec5851 David Gounaris   2018-09-03   97  		uf_info->cds =3D 1;
040b7c94e4ec5851 David Gounaris   2018-09-03   98  		uf_info->ctss =3D 1;
040b7c94e4ec5851 David Gounaris   2018-09-03   99  	} else {
040b7c94e4ec5851 David Gounaris   2018-09-03  100  		uf_info->cds =3D 0;
040b7c94e4ec5851 David Gounaris   2018-09-03  101  		uf_info->ctsp =3D 0;
040b7c94e4ec5851 David Gounaris   2018-09-03  102  		uf_info->ctss =3D 0;
c19b6d246a35627c Zhao Qiang       2016-06-06  103  	}
067bb938dad61e58 Holger Brunck    2017-05-17  104  =

067bb938dad61e58 Holger Brunck    2017-05-17  105  	/* This sets HPM regist=
er in CMXUCR register which configures a
067bb938dad61e58 Holger Brunck    2017-05-17  106  	 * open drain connected=
 HDLC bus
067bb938dad61e58 Holger Brunck    2017-05-17  107  	 */
067bb938dad61e58 Holger Brunck    2017-05-17  108  	if (priv->hdlc_bus)
067bb938dad61e58 Holger Brunck    2017-05-17  109  		uf_info->brkpt_support=
 =3D 1;
067bb938dad61e58 Holger Brunck    2017-05-17  110  =

c19b6d246a35627c Zhao Qiang       2016-06-06  111  	uf_info->uccm_mask =3D =
((UCC_HDLC_UCCE_RXB | UCC_HDLC_UCCE_RXF |
c19b6d246a35627c Zhao Qiang       2016-06-06  112  				UCC_HDLC_UCCE_TXB) <=
< 16);
c19b6d246a35627c Zhao Qiang       2016-06-06  113  =

c19b6d246a35627c Zhao Qiang       2016-06-06  114  	ret =3D ucc_fast_init(u=
f_info, &priv->uccf);
c19b6d246a35627c Zhao Qiang       2016-06-06  115  	if (ret) {
c19b6d246a35627c Zhao Qiang       2016-06-06  116  		dev_err(priv->dev, "Fa=
iled to init uccf.");
c19b6d246a35627c Zhao Qiang       2016-06-06  117  		return ret;
c19b6d246a35627c Zhao Qiang       2016-06-06  118  	}
c19b6d246a35627c Zhao Qiang       2016-06-06  119  =

c19b6d246a35627c Zhao Qiang       2016-06-06  120  	priv->uf_regs =3D priv-=
>uccf->uf_regs;
c19b6d246a35627c Zhao Qiang       2016-06-06  121  	ucc_fast_disable(priv->=
uccf, COMM_DIR_RX | COMM_DIR_TX);
c19b6d246a35627c Zhao Qiang       2016-06-06  122  =

c19b6d246a35627c Zhao Qiang       2016-06-06  123  	/* Loopback mode */
c19b6d246a35627c Zhao Qiang       2016-06-06  124  	if (priv->loopback) {
c19b6d246a35627c Zhao Qiang       2016-06-06  125  		dev_info(priv->dev, "L=
oopback Mode\n");
54e9e0874938ba5b Holger Brunck    2017-05-17  126  		/* use the same clock =
when work in loopback */
54e9e0874938ba5b Holger Brunck    2017-05-17  127  		qe_setbrg(ut_info->uf_=
info.rx_clock, 20000000, 1);
54e9e0874938ba5b Holger Brunck    2017-05-17  128  =

c19b6d246a35627c Zhao Qiang       2016-06-06  129  		gumr =3D ioread32be(&p=
riv->uf_regs->gumr);
c19b6d246a35627c Zhao Qiang       2016-06-06  130  		gumr |=3D (UCC_FAST_GU=
MR_LOOPBACK | UCC_FAST_GUMR_CDS |
c19b6d246a35627c Zhao Qiang       2016-06-06  131  			 UCC_FAST_GUMR_TCI);
c19b6d246a35627c Zhao Qiang       2016-06-06  132  		gumr &=3D ~(UCC_FAST_G=
UMR_CTSP | UCC_FAST_GUMR_RSYN);
c19b6d246a35627c Zhao Qiang       2016-06-06  133  		iowrite32be(gumr, &pri=
v->uf_regs->gumr);
c19b6d246a35627c Zhao Qiang       2016-06-06  134  	}
c19b6d246a35627c Zhao Qiang       2016-06-06  135  =

c19b6d246a35627c Zhao Qiang       2016-06-06  136  	/* Initialize SI */
c19b6d246a35627c Zhao Qiang       2016-06-06  137  	if (priv->tsa)
c19b6d246a35627c Zhao Qiang       2016-06-06  138  		ucc_tdm_init(priv->utd=
m, priv->ut_info);
c19b6d246a35627c Zhao Qiang       2016-06-06  139  =

c19b6d246a35627c Zhao Qiang       2016-06-06  140  	/* Write to QE CECR, UC=
Cx channel to Stop Transmission */
c19b6d246a35627c Zhao Qiang       2016-06-06  141  	cecr_subblock =3D ucc_f=
ast_get_qe_cr_subblock(uf_info->ucc_num);
c19b6d246a35627c Zhao Qiang       2016-06-06  142  	ret =3D qe_issue_cmd(QE=
_STOP_TX, cecr_subblock,
c19b6d246a35627c Zhao Qiang       2016-06-06  143  			   QE_CR_PROTOCOL_UNS=
PECIFIED, 0);
c19b6d246a35627c Zhao Qiang       2016-06-06  144  =

c19b6d246a35627c Zhao Qiang       2016-06-06  145  	/* Set UPSMR normal mod=
e (need fixed)*/
c19b6d246a35627c Zhao Qiang       2016-06-06  146  	iowrite32be(0, &priv->u=
f_regs->upsmr);
c19b6d246a35627c Zhao Qiang       2016-06-06  147  =

067bb938dad61e58 Holger Brunck    2017-05-17  148  	/* hdlc_bus mode */
067bb938dad61e58 Holger Brunck    2017-05-17  149  	if (priv->hdlc_bus) {
067bb938dad61e58 Holger Brunck    2017-05-17  150  		u32 upsmr;
067bb938dad61e58 Holger Brunck    2017-05-17  151  =

067bb938dad61e58 Holger Brunck    2017-05-17  152  		dev_info(priv->dev, "H=
DLC bus Mode\n");
067bb938dad61e58 Holger Brunck    2017-05-17  153  		upsmr =3D ioread32be(&=
priv->uf_regs->upsmr);
067bb938dad61e58 Holger Brunck    2017-05-17  154  =

067bb938dad61e58 Holger Brunck    2017-05-17  155  		/* bus mode and retran=
smit enable, with collision window
067bb938dad61e58 Holger Brunck    2017-05-17  156  		 * set to 8 bytes
067bb938dad61e58 Holger Brunck    2017-05-17  157  		 */
067bb938dad61e58 Holger Brunck    2017-05-17  158  		upsmr |=3D UCC_HDLC_UP=
SMR_RTE | UCC_HDLC_UPSMR_BUS |
067bb938dad61e58 Holger Brunck    2017-05-17  159  				UCC_HDLC_UPSMR_CW8;
067bb938dad61e58 Holger Brunck    2017-05-17  160  		iowrite32be(upsmr, &pr=
iv->uf_regs->upsmr);
067bb938dad61e58 Holger Brunck    2017-05-17  161  =

067bb938dad61e58 Holger Brunck    2017-05-17  162  		/* explicitly disable =
CDS & CTSP */
067bb938dad61e58 Holger Brunck    2017-05-17  163  		gumr =3D ioread32be(&p=
riv->uf_regs->gumr);
067bb938dad61e58 Holger Brunck    2017-05-17  164  		gumr &=3D ~(UCC_FAST_G=
UMR_CDS | UCC_FAST_GUMR_CTSP);
067bb938dad61e58 Holger Brunck    2017-05-17  165  		/* set automatic sync =
to explicitly ignore CD signal */
067bb938dad61e58 Holger Brunck    2017-05-17  166  		gumr |=3D UCC_FAST_GUM=
R_SYNL_AUTO;
067bb938dad61e58 Holger Brunck    2017-05-17  167  		iowrite32be(gumr, &pri=
v->uf_regs->gumr);
067bb938dad61e58 Holger Brunck    2017-05-17  168  	}
067bb938dad61e58 Holger Brunck    2017-05-17  169  =

c19b6d246a35627c Zhao Qiang       2016-06-06  170  	priv->rx_ring_size =3D =
RX_BD_RING_LEN;
c19b6d246a35627c Zhao Qiang       2016-06-06  171  	priv->tx_ring_size =3D =
TX_BD_RING_LEN;
c19b6d246a35627c Zhao Qiang       2016-06-06  172  	/* Alloc Rx BD */
c19b6d246a35627c Zhao Qiang       2016-06-06  173  	priv->rx_bd_base =3D dm=
a_alloc_coherent(priv->dev,
5b8aad93c52bdda6 Holger Brunck    2017-05-17  174  			RX_BD_RING_LEN * size=
of(struct qe_bd),
c19b6d246a35627c Zhao Qiang       2016-06-06  175  			&priv->dma_rx_bd, GFP=
_KERNEL);
c19b6d246a35627c Zhao Qiang       2016-06-06  176  =

c19b6d246a35627c Zhao Qiang       2016-06-06  177  	if (!priv->rx_bd_base) {
c19b6d246a35627c Zhao Qiang       2016-06-06  178  		dev_err(priv->dev, "Ca=
nnot allocate MURAM memory for RxBDs\n");
c19b6d246a35627c Zhao Qiang       2016-06-06  179  		ret =3D -ENOMEM;
1efb597d8bf56cbe Zhao Qiang       2016-07-15  180  		goto free_uccf;
c19b6d246a35627c Zhao Qiang       2016-06-06  181  	}
c19b6d246a35627c Zhao Qiang       2016-06-06  182  =

c19b6d246a35627c Zhao Qiang       2016-06-06  183  	/* Alloc Tx BD */
c19b6d246a35627c Zhao Qiang       2016-06-06  184  	priv->tx_bd_base =3D dm=
a_alloc_coherent(priv->dev,
5b8aad93c52bdda6 Holger Brunck    2017-05-17  185  			TX_BD_RING_LEN * size=
of(struct qe_bd),
c19b6d246a35627c Zhao Qiang       2016-06-06  186  			&priv->dma_tx_bd, GFP=
_KERNEL);
c19b6d246a35627c Zhao Qiang       2016-06-06  187  =

c19b6d246a35627c Zhao Qiang       2016-06-06  188  	if (!priv->tx_bd_base) {
c19b6d246a35627c Zhao Qiang       2016-06-06  189  		dev_err(priv->dev, "Ca=
nnot allocate MURAM memory for TxBDs\n");
c19b6d246a35627c Zhao Qiang       2016-06-06  190  		ret =3D -ENOMEM;
1efb597d8bf56cbe Zhao Qiang       2016-07-15  191  		goto free_rx_bd;
c19b6d246a35627c Zhao Qiang       2016-06-06  192  	}
c19b6d246a35627c Zhao Qiang       2016-06-06  193  =

c19b6d246a35627c Zhao Qiang       2016-06-06  194  	/* Alloc parameter ram =
for ucc hdlc */
85deed56032b6c98 Holger Brunck    2017-05-22  195  	priv->ucc_pram_offset =
=3D qe_muram_alloc(sizeof(struct ucc_hdlc_param),
c19b6d246a35627c Zhao Qiang       2016-06-06  196  				ALIGNMENT_OF_UCC_HDL=
C_PRAM);
c19b6d246a35627c Zhao Qiang       2016-06-06  197  =

be2e9415f8b366ab Rasmus Villemoes 2019-11-28  198  	if (priv->ucc_pram_offs=
et < 0) {
24a24d07d688a462 Colin Ian King   2016-08-28  199  		dev_err(priv->dev, "Ca=
n not allocate MURAM for hdlc parameter.\n");
c19b6d246a35627c Zhao Qiang       2016-06-06  200  		ret =3D -ENOMEM;
1efb597d8bf56cbe Zhao Qiang       2016-07-15  201  		goto free_tx_bd;
c19b6d246a35627c Zhao Qiang       2016-06-06  202  	}
c19b6d246a35627c Zhao Qiang       2016-06-06  203  =

6396bb221514d287 Kees Cook        2018-06-12  204  	priv->rx_skbuff =3D kca=
lloc(priv->rx_ring_size,
6396bb221514d287 Kees Cook        2018-06-12  205  				  sizeof(*priv->rx_s=
kbuff),
c19b6d246a35627c Zhao Qiang       2016-06-06  206  				  GFP_KERNEL);
c19b6d246a35627c Zhao Qiang       2016-06-06  207  	if (!priv->rx_skbuff)
1efb597d8bf56cbe Zhao Qiang       2016-07-15  208  		goto free_ucc_pram;
c19b6d246a35627c Zhao Qiang       2016-06-06  209  =

6396bb221514d287 Kees Cook        2018-06-12  210  	priv->tx_skbuff =3D kca=
lloc(priv->tx_ring_size,
6396bb221514d287 Kees Cook        2018-06-12  211  				  sizeof(*priv->tx_s=
kbuff),
c19b6d246a35627c Zhao Qiang       2016-06-06  212  				  GFP_KERNEL);
c19b6d246a35627c Zhao Qiang       2016-06-06  213  	if (!priv->tx_skbuff)
1efb597d8bf56cbe Zhao Qiang       2016-07-15  214  		goto free_rx_skbuff;
c19b6d246a35627c Zhao Qiang       2016-06-06  215  =

c19b6d246a35627c Zhao Qiang       2016-06-06  216  	priv->skb_curtx =3D 0;
c19b6d246a35627c Zhao Qiang       2016-06-06  217  	priv->skb_dirtytx =3D 0;
c19b6d246a35627c Zhao Qiang       2016-06-06  218  	priv->curtx_bd =3D priv=
->tx_bd_base;
c19b6d246a35627c Zhao Qiang       2016-06-06  219  	priv->dirty_tx =3D priv=
->tx_bd_base;
c19b6d246a35627c Zhao Qiang       2016-06-06  220  	priv->currx_bd =3D priv=
->rx_bd_base;
c19b6d246a35627c Zhao Qiang       2016-06-06  221  	priv->currx_bdnum =3D 0;
c19b6d246a35627c Zhao Qiang       2016-06-06  222  =

c19b6d246a35627c Zhao Qiang       2016-06-06  223  	/* init parameter base =
*/
c19b6d246a35627c Zhao Qiang       2016-06-06  224  	cecr_subblock =3D ucc_f=
ast_get_qe_cr_subblock(uf_info->ucc_num);
c19b6d246a35627c Zhao Qiang       2016-06-06  225  	ret =3D qe_issue_cmd(QE=
_ASSIGN_PAGE_TO_DEVICE, cecr_subblock,
c19b6d246a35627c Zhao Qiang       2016-06-06  226  			   QE_CR_PROTOCOL_UNS=
PECIFIED, priv->ucc_pram_offset);
c19b6d246a35627c Zhao Qiang       2016-06-06  227  =

c19b6d246a35627c Zhao Qiang       2016-06-06  228  	priv->ucc_pram =3D (str=
uct ucc_hdlc_param __iomem *)
c19b6d246a35627c Zhao Qiang       2016-06-06  229  					qe_muram_addr(priv-=
>ucc_pram_offset);
c19b6d246a35627c Zhao Qiang       2016-06-06  230  =

c19b6d246a35627c Zhao Qiang       2016-06-06  231  	/* Zero out parameter r=
am */
c19b6d246a35627c Zhao Qiang       2016-06-06  232  	memset_io(priv->ucc_pra=
m, 0, sizeof(struct ucc_hdlc_param));
c19b6d246a35627c Zhao Qiang       2016-06-06  233  =

c19b6d246a35627c Zhao Qiang       2016-06-06  234  	/* Alloc riptr, tiptr */
c19b6d246a35627c Zhao Qiang       2016-06-06  235  	riptr =3D qe_muram_allo=
c(32, 32);
be2e9415f8b366ab Rasmus Villemoes 2019-11-28  236  	if (riptr < 0) {
c19b6d246a35627c Zhao Qiang       2016-06-06  237  		dev_err(priv->dev, "Ca=
nnot allocate MURAM mem for Receive internal temp data pointer\n");
c19b6d246a35627c Zhao Qiang       2016-06-06  238  		ret =3D -ENOMEM;
1efb597d8bf56cbe Zhao Qiang       2016-07-15  239  		goto free_tx_skbuff;
c19b6d246a35627c Zhao Qiang       2016-06-06  240  	}
c19b6d246a35627c Zhao Qiang       2016-06-06  241  =

c19b6d246a35627c Zhao Qiang       2016-06-06  242  	tiptr =3D qe_muram_allo=
c(32, 32);
be2e9415f8b366ab Rasmus Villemoes 2019-11-28  243  	if (tiptr < 0) {
c19b6d246a35627c Zhao Qiang       2016-06-06  244  		dev_err(priv->dev, "Ca=
nnot allocate MURAM mem for Transmit internal temp data pointer\n");
c19b6d246a35627c Zhao Qiang       2016-06-06  245  		ret =3D -ENOMEM;
1efb597d8bf56cbe Zhao Qiang       2016-07-15  246  		goto free_riptr;
c19b6d246a35627c Zhao Qiang       2016-06-06  247  	}
148587a59f6b8583 Rasmus Villemoes 2019-11-28  248  	if (riptr !=3D (u16)rip=
tr || tiptr !=3D (u16)tiptr) {
148587a59f6b8583 Rasmus Villemoes 2019-11-28  249  		dev_err(priv->dev, "MU=
RAM allocation out of addressable range\n");
148587a59f6b8583 Rasmus Villemoes 2019-11-28  250  		ret =3D -ENOMEM;
148587a59f6b8583 Rasmus Villemoes 2019-11-28  251  		goto free_tiptr;
148587a59f6b8583 Rasmus Villemoes 2019-11-28  252  	}
c19b6d246a35627c Zhao Qiang       2016-06-06  253  =

c19b6d246a35627c Zhao Qiang       2016-06-06  254  	/* Set RIPTR, TIPTR */
c19b6d246a35627c Zhao Qiang       2016-06-06  255  	iowrite16be(riptr, &pri=
v->ucc_pram->riptr);
c19b6d246a35627c Zhao Qiang       2016-06-06  256  	iowrite16be(tiptr, &pri=
v->ucc_pram->tiptr);
c19b6d246a35627c Zhao Qiang       2016-06-06  257  =

c19b6d246a35627c Zhao Qiang       2016-06-06  258  	/* Set MRBLR */
c19b6d246a35627c Zhao Qiang       2016-06-06  259  	iowrite16be(MAX_RX_BUF_=
LENGTH, &priv->ucc_pram->mrblr);
c19b6d246a35627c Zhao Qiang       2016-06-06  260  =

c19b6d246a35627c Zhao Qiang       2016-06-06  261  	/* Set RBASE, TBASE */
c19b6d246a35627c Zhao Qiang       2016-06-06  262  	iowrite32be(priv->dma_r=
x_bd, &priv->ucc_pram->rbase);
c19b6d246a35627c Zhao Qiang       2016-06-06  263  	iowrite32be(priv->dma_t=
x_bd, &priv->ucc_pram->tbase);
c19b6d246a35627c Zhao Qiang       2016-06-06  264  =

c19b6d246a35627c Zhao Qiang       2016-06-06  265  	/* Set RSTATE, TSTATE */
c19b6d246a35627c Zhao Qiang       2016-06-06  266  	iowrite32be(BMR_GBL | B=
MR_BIG_ENDIAN, &priv->ucc_pram->rstate);
c19b6d246a35627c Zhao Qiang       2016-06-06  267  	iowrite32be(BMR_GBL | B=
MR_BIG_ENDIAN, &priv->ucc_pram->tstate);
c19b6d246a35627c Zhao Qiang       2016-06-06  268  =

c19b6d246a35627c Zhao Qiang       2016-06-06  269  	/* Set C_MASK, C_PRES f=
or 16bit CRC */
c19b6d246a35627c Zhao Qiang       2016-06-06  270  	iowrite32be(CRC_16BIT_M=
ASK, &priv->ucc_pram->c_mask);
c19b6d246a35627c Zhao Qiang       2016-06-06  271  	iowrite32be(CRC_16BIT_P=
RES, &priv->ucc_pram->c_pres);
c19b6d246a35627c Zhao Qiang       2016-06-06  272  =

c19b6d246a35627c Zhao Qiang       2016-06-06  273  	iowrite16be(MAX_FRAME_L=
ENGTH, &priv->ucc_pram->mflr);
c19b6d246a35627c Zhao Qiang       2016-06-06  274  	iowrite16be(DEFAULT_RFT=
HR, &priv->ucc_pram->rfthr);
c19b6d246a35627c Zhao Qiang       2016-06-06  275  	iowrite16be(DEFAULT_RFT=
HR, &priv->ucc_pram->rfcnt);
045f77baf6b429a4 David Gounaris   2018-09-03  276  	iowrite16be(priv->hmask=
, &priv->ucc_pram->hmask);
c19b6d246a35627c Zhao Qiang       2016-06-06  277  	iowrite16be(DEFAULT_HDL=
C_ADDR, &priv->ucc_pram->haddr1);
c19b6d246a35627c Zhao Qiang       2016-06-06  278  	iowrite16be(DEFAULT_HDL=
C_ADDR, &priv->ucc_pram->haddr2);
c19b6d246a35627c Zhao Qiang       2016-06-06  279  	iowrite16be(DEFAULT_HDL=
C_ADDR, &priv->ucc_pram->haddr3);
c19b6d246a35627c Zhao Qiang       2016-06-06  280  	iowrite16be(DEFAULT_HDL=
C_ADDR, &priv->ucc_pram->haddr4);
c19b6d246a35627c Zhao Qiang       2016-06-06  281  =

c19b6d246a35627c Zhao Qiang       2016-06-06  282  	/* Get BD buffer */
750afb08ca71310f Luis Chamberlain 2019-01-04  283  	bd_buffer =3D dma_alloc=
_coherent(priv->dev,
750afb08ca71310f Luis Chamberlain 2019-01-04  284  				       (RX_BD_RING_L=
EN + TX_BD_RING_LEN) * MAX_RX_BUF_LENGTH,
c19b6d246a35627c Zhao Qiang       2016-06-06  285  				       &bd_dma_addr,=
 GFP_KERNEL);
c19b6d246a35627c Zhao Qiang       2016-06-06  286  =

c19b6d246a35627c Zhao Qiang       2016-06-06  287  	if (!bd_buffer) {
c19b6d246a35627c Zhao Qiang       2016-06-06  288  		dev_err(priv->dev, "Co=
uld not allocate buffer descriptors\n");
c19b6d246a35627c Zhao Qiang       2016-06-06  289  		ret =3D -ENOMEM;
1efb597d8bf56cbe Zhao Qiang       2016-07-15  290  		goto free_tiptr;
c19b6d246a35627c Zhao Qiang       2016-06-06  291  	}
c19b6d246a35627c Zhao Qiang       2016-06-06  292  =

c19b6d246a35627c Zhao Qiang       2016-06-06  293  	priv->rx_buffer =3D bd_=
buffer;
c19b6d246a35627c Zhao Qiang       2016-06-06  294  	priv->tx_buffer =3D bd_=
buffer + RX_BD_RING_LEN * MAX_RX_BUF_LENGTH;
c19b6d246a35627c Zhao Qiang       2016-06-06  295  =

c19b6d246a35627c Zhao Qiang       2016-06-06  296  	priv->dma_rx_addr =3D b=
d_dma_addr;
c19b6d246a35627c Zhao Qiang       2016-06-06  297  	priv->dma_tx_addr =3D b=
d_dma_addr + RX_BD_RING_LEN * MAX_RX_BUF_LENGTH;
c19b6d246a35627c Zhao Qiang       2016-06-06  298  =

c19b6d246a35627c Zhao Qiang       2016-06-06  299  	for (i =3D 0; i < RX_BD=
_RING_LEN; i++) {
c19b6d246a35627c Zhao Qiang       2016-06-06  300  		if (i < (RX_BD_RING_LE=
N - 1))
c19b6d246a35627c Zhao Qiang       2016-06-06  301  			bd_status =3D R_E_S |=
 R_I_S;
c19b6d246a35627c Zhao Qiang       2016-06-06  302  		else
c19b6d246a35627c Zhao Qiang       2016-06-06  303  			bd_status =3D R_E_S |=
 R_I_S | R_W_S;
c19b6d246a35627c Zhao Qiang       2016-06-06  304  =

c19b6d246a35627c Zhao Qiang       2016-06-06 @305  		iowrite16be(bd_status,=
 &priv->rx_bd_base[i].status);
c19b6d246a35627c Zhao Qiang       2016-06-06  306  		iowrite32be(priv->dma_=
rx_addr + i * MAX_RX_BUF_LENGTH,
c19b6d246a35627c Zhao Qiang       2016-06-06 @307  			    &priv->rx_bd_base=
[i].buf);
c19b6d246a35627c Zhao Qiang       2016-06-06  308  	}
c19b6d246a35627c Zhao Qiang       2016-06-06  309  =

c19b6d246a35627c Zhao Qiang       2016-06-06  310  	for (i =3D 0; i < TX_BD=
_RING_LEN; i++) {
c19b6d246a35627c Zhao Qiang       2016-06-06  311  		if (i < (TX_BD_RING_LE=
N - 1))
c19b6d246a35627c Zhao Qiang       2016-06-06  312  			bd_status =3D  T_I_S =
| T_TC_S;
c19b6d246a35627c Zhao Qiang       2016-06-06  313  		else
c19b6d246a35627c Zhao Qiang       2016-06-06  314  			bd_status =3D  T_I_S =
| T_TC_S | T_W_S;
c19b6d246a35627c Zhao Qiang       2016-06-06  315  =

c19b6d246a35627c Zhao Qiang       2016-06-06  316  		iowrite16be(bd_status,=
 &priv->tx_bd_base[i].status);
c19b6d246a35627c Zhao Qiang       2016-06-06  317  		iowrite32be(priv->dma_=
tx_addr + i * MAX_RX_BUF_LENGTH,
c19b6d246a35627c Zhao Qiang       2016-06-06  318  			    &priv->tx_bd_base=
[i].buf);
c19b6d246a35627c Zhao Qiang       2016-06-06  319  	}
c19b6d246a35627c Zhao Qiang       2016-06-06  320  =

c19b6d246a35627c Zhao Qiang       2016-06-06  321  	return 0;
c19b6d246a35627c Zhao Qiang       2016-06-06  322  =

1efb597d8bf56cbe Zhao Qiang       2016-07-15  323  free_tiptr:
c19b6d246a35627c Zhao Qiang       2016-06-06  324  	qe_muram_free(tiptr);
1efb597d8bf56cbe Zhao Qiang       2016-07-15  325  free_riptr:
c19b6d246a35627c Zhao Qiang       2016-06-06  326  	qe_muram_free(riptr);
1efb597d8bf56cbe Zhao Qiang       2016-07-15  327  free_tx_skbuff:
c19b6d246a35627c Zhao Qiang       2016-06-06  328  	kfree(priv->tx_skbuff);
1efb597d8bf56cbe Zhao Qiang       2016-07-15  329  free_rx_skbuff:
c19b6d246a35627c Zhao Qiang       2016-06-06  330  	kfree(priv->rx_skbuff);
1efb597d8bf56cbe Zhao Qiang       2016-07-15  331  free_ucc_pram:
c19b6d246a35627c Zhao Qiang       2016-06-06  332  	qe_muram_free(priv->ucc=
_pram_offset);
1efb597d8bf56cbe Zhao Qiang       2016-07-15  333  free_tx_bd:
c19b6d246a35627c Zhao Qiang       2016-06-06  334  	dma_free_coherent(priv-=
>dev,
5b8aad93c52bdda6 Holger Brunck    2017-05-17  335  			  TX_BD_RING_LEN * si=
zeof(struct qe_bd),
c19b6d246a35627c Zhao Qiang       2016-06-06  336  			  priv->tx_bd_base, p=
riv->dma_tx_bd);
1efb597d8bf56cbe Zhao Qiang       2016-07-15  337  free_rx_bd:
c19b6d246a35627c Zhao Qiang       2016-06-06  338  	dma_free_coherent(priv-=
>dev,
5b8aad93c52bdda6 Holger Brunck    2017-05-17  339  			  RX_BD_RING_LEN * si=
zeof(struct qe_bd),
c19b6d246a35627c Zhao Qiang       2016-06-06  340  			  priv->rx_bd_base, p=
riv->dma_rx_bd);
1efb597d8bf56cbe Zhao Qiang       2016-07-15  341  free_uccf:
c19b6d246a35627c Zhao Qiang       2016-06-06  342  	ucc_fast_free(priv->ucc=
f);
c19b6d246a35627c Zhao Qiang       2016-06-06  343  =

c19b6d246a35627c Zhao Qiang       2016-06-06  344  	return ret;
c19b6d246a35627c Zhao Qiang       2016-06-06  345  }
c19b6d246a35627c Zhao Qiang       2016-06-06  346  =

c19b6d246a35627c Zhao Qiang       2016-06-06  347  static netdev_tx_t ucc_h=
dlc_tx(struct sk_buff *skb, struct net_device *dev)
c19b6d246a35627c Zhao Qiang       2016-06-06  348  {
c19b6d246a35627c Zhao Qiang       2016-06-06  349  	hdlc_device *hdlc =3D d=
ev_to_hdlc(dev);
c19b6d246a35627c Zhao Qiang       2016-06-06  350  	struct ucc_hdlc_private=
 *priv =3D (struct ucc_hdlc_private *)hdlc->priv;
c19b6d246a35627c Zhao Qiang       2016-06-06  351  	struct qe_bd __iomem *b=
d;
c19b6d246a35627c Zhao Qiang       2016-06-06  352  	u16 bd_status;
c19b6d246a35627c Zhao Qiang       2016-06-06  353  	unsigned long flags;
c19b6d246a35627c Zhao Qiang       2016-06-06  354  	u16 *proto_head;
c19b6d246a35627c Zhao Qiang       2016-06-06  355  =

c19b6d246a35627c Zhao Qiang       2016-06-06  356  	switch (dev->type) {
c19b6d246a35627c Zhao Qiang       2016-06-06  357  	case ARPHRD_RAWHDLC:
c19b6d246a35627c Zhao Qiang       2016-06-06  358  		if (skb_headroom(skb) =
< HDLC_HEAD_LEN) {
c19b6d246a35627c Zhao Qiang       2016-06-06  359  			dev->stats.tx_dropped=
++;
c19b6d246a35627c Zhao Qiang       2016-06-06  360  			dev_kfree_skb(skb);
c19b6d246a35627c Zhao Qiang       2016-06-06  361  			netdev_err(dev, "No e=
nough space for hdlc head\n");
c19b6d246a35627c Zhao Qiang       2016-06-06  362  			return -ENOMEM;
c19b6d246a35627c Zhao Qiang       2016-06-06  363  		}
c19b6d246a35627c Zhao Qiang       2016-06-06  364  =

c19b6d246a35627c Zhao Qiang       2016-06-06  365  		skb_push(skb, HDLC_HEA=
D_LEN);
c19b6d246a35627c Zhao Qiang       2016-06-06  366  =

c19b6d246a35627c Zhao Qiang       2016-06-06  367  		proto_head =3D (u16 *)=
skb->data;
c19b6d246a35627c Zhao Qiang       2016-06-06  368  		*proto_head =3D htons(=
DEFAULT_HDLC_HEAD);
c19b6d246a35627c Zhao Qiang       2016-06-06  369  =

c19b6d246a35627c Zhao Qiang       2016-06-06  370  		dev->stats.tx_bytes +=
=3D skb->len;
c19b6d246a35627c Zhao Qiang       2016-06-06  371  		break;
c19b6d246a35627c Zhao Qiang       2016-06-06  372  =

c19b6d246a35627c Zhao Qiang       2016-06-06  373  	case ARPHRD_PPP:
c19b6d246a35627c Zhao Qiang       2016-06-06  374  		proto_head =3D (u16 *)=
skb->data;
c19b6d246a35627c Zhao Qiang       2016-06-06  375  		if (*proto_head !=3D h=
tons(DEFAULT_PPP_HEAD)) {
c19b6d246a35627c Zhao Qiang       2016-06-06  376  			dev->stats.tx_dropped=
++;
c19b6d246a35627c Zhao Qiang       2016-06-06  377  			dev_kfree_skb(skb);
c19b6d246a35627c Zhao Qiang       2016-06-06  378  			netdev_err(dev, "Wron=
g ppp header\n");
c19b6d246a35627c Zhao Qiang       2016-06-06  379  			return -ENOMEM;
c19b6d246a35627c Zhao Qiang       2016-06-06  380  		}
c19b6d246a35627c Zhao Qiang       2016-06-06  381  =

c19b6d246a35627c Zhao Qiang       2016-06-06  382  		dev->stats.tx_bytes +=
=3D skb->len;
c19b6d246a35627c Zhao Qiang       2016-06-06  383  		break;
c19b6d246a35627c Zhao Qiang       2016-06-06  384  =

8978ca7c8b7b0710 David Gounaris   2018-09-03  385  	case ARPHRD_ETHER:
8978ca7c8b7b0710 David Gounaris   2018-09-03  386  		dev->stats.tx_bytes +=
=3D skb->len;
8978ca7c8b7b0710 David Gounaris   2018-09-03  387  		break;
8978ca7c8b7b0710 David Gounaris   2018-09-03  388  =

c19b6d246a35627c Zhao Qiang       2016-06-06  389  	default:
c19b6d246a35627c Zhao Qiang       2016-06-06  390  		dev->stats.tx_dropped+=
+;
c19b6d246a35627c Zhao Qiang       2016-06-06  391  		dev_kfree_skb(skb);
c19b6d246a35627c Zhao Qiang       2016-06-06  392  		return -ENOMEM;
c19b6d246a35627c Zhao Qiang       2016-06-06  393  	}
2e7ad56aa54778de Mathias Thore    2018-11-07  394  	netdev_sent_queue(dev, =
skb->len);
c19b6d246a35627c Zhao Qiang       2016-06-06  395  	spin_lock_irqsave(&priv=
->lock, flags);
c19b6d246a35627c Zhao Qiang       2016-06-06  396  =

c19b6d246a35627c Zhao Qiang       2016-06-06  397  	/* Start from the next =
BD that should be filled */
c19b6d246a35627c Zhao Qiang       2016-06-06 @398  	bd =3D priv->curtx_bd;
c19b6d246a35627c Zhao Qiang       2016-06-06  399  	bd_status =3D ioread16b=
e(&bd->status);
c19b6d246a35627c Zhao Qiang       2016-06-06  400  	/* Save the skb pointer=
 so we can free it later */
c19b6d246a35627c Zhao Qiang       2016-06-06  401  	priv->tx_skbuff[priv->s=
kb_curtx] =3D skb;
c19b6d246a35627c Zhao Qiang       2016-06-06  402  =

c19b6d246a35627c Zhao Qiang       2016-06-06  403  	/* Update the current s=
kb pointer (wrapping if this was the last) */
c19b6d246a35627c Zhao Qiang       2016-06-06  404  	priv->skb_curtx =3D
c19b6d246a35627c Zhao Qiang       2016-06-06  405  	    (priv->skb_curtx + =
1) & TX_RING_MOD_MASK(TX_BD_RING_LEN);
c19b6d246a35627c Zhao Qiang       2016-06-06  406  =

c19b6d246a35627c Zhao Qiang       2016-06-06  407  	/* copy skb data to tx =
buffer for sdma processing */
c19b6d246a35627c Zhao Qiang       2016-06-06  408  	memcpy(priv->tx_buffer =
+ (be32_to_cpu(bd->buf) - priv->dma_tx_addr),
c19b6d246a35627c Zhao Qiang       2016-06-06  409  	       skb->data, skb->=
len);
c19b6d246a35627c Zhao Qiang       2016-06-06  410  =

c19b6d246a35627c Zhao Qiang       2016-06-06  411  	/* set bd status and le=
ngth */
c19b6d246a35627c Zhao Qiang       2016-06-06  412  	bd_status =3D (bd_statu=
s & T_W_S) | T_R_S | T_I_S | T_L_S | T_TC_S;
c19b6d246a35627c Zhao Qiang       2016-06-06  413  =

c19b6d246a35627c Zhao Qiang       2016-06-06  414  	iowrite16be(skb->len, &=
bd->length);
02bb56ddc6711639 Zhao Qiang       2017-03-14  415  	iowrite16be(bd_status, =
&bd->status);
c19b6d246a35627c Zhao Qiang       2016-06-06  416  =

c19b6d246a35627c Zhao Qiang       2016-06-06  417  	/* Move to next BD in t=
he ring */
c19b6d246a35627c Zhao Qiang       2016-06-06  418  	if (!(bd_status & T_W_S=
))
c19b6d246a35627c Zhao Qiang       2016-06-06  419  		bd +=3D 1;
c19b6d246a35627c Zhao Qiang       2016-06-06  420  	else
c19b6d246a35627c Zhao Qiang       2016-06-06  421  		bd =3D priv->tx_bd_bas=
e;
c19b6d246a35627c Zhao Qiang       2016-06-06  422  =

c19b6d246a35627c Zhao Qiang       2016-06-06  423  	if (bd =3D=3D priv->dir=
ty_tx) {
c19b6d246a35627c Zhao Qiang       2016-06-06  424  		if (!netif_queue_stopp=
ed(dev))
c19b6d246a35627c Zhao Qiang       2016-06-06  425  			netif_stop_queue(dev);
c19b6d246a35627c Zhao Qiang       2016-06-06  426  	}
c19b6d246a35627c Zhao Qiang       2016-06-06  427  =

c19b6d246a35627c Zhao Qiang       2016-06-06  428  	priv->curtx_bd =3D bd;
c19b6d246a35627c Zhao Qiang       2016-06-06  429  =

c19b6d246a35627c Zhao Qiang       2016-06-06  430  	spin_unlock_irqrestore(=
&priv->lock, flags);
c19b6d246a35627c Zhao Qiang       2016-06-06  431  =

c19b6d246a35627c Zhao Qiang       2016-06-06  432  	return NETDEV_TX_OK;
c19b6d246a35627c Zhao Qiang       2016-06-06  433  }
c19b6d246a35627c Zhao Qiang       2016-06-06  434  =

ba59d5705825fb9c Mathias Thore    2018-10-22  435  static int hdlc_tx_resta=
rt(struct ucc_hdlc_private *priv)
ba59d5705825fb9c Mathias Thore    2018-10-22  436  {
ba59d5705825fb9c Mathias Thore    2018-10-22  437  	u32 cecr_subblock;
ba59d5705825fb9c Mathias Thore    2018-10-22  438  =

ba59d5705825fb9c Mathias Thore    2018-10-22  439  	cecr_subblock =3D
ba59d5705825fb9c Mathias Thore    2018-10-22  440  		ucc_fast_get_qe_cr_sub=
block(priv->ut_info->uf_info.ucc_num);
ba59d5705825fb9c Mathias Thore    2018-10-22  441  =

ba59d5705825fb9c Mathias Thore    2018-10-22  442  	qe_issue_cmd(QE_RESTART=
_TX, cecr_subblock,
ba59d5705825fb9c Mathias Thore    2018-10-22  443  		     QE_CR_PROTOCOL_UN=
SPECIFIED, 0);
ba59d5705825fb9c Mathias Thore    2018-10-22  444  	return 0;
ba59d5705825fb9c Mathias Thore    2018-10-22  445  }
ba59d5705825fb9c Mathias Thore    2018-10-22  446  =

c19b6d246a35627c Zhao Qiang       2016-06-06  447  static int hdlc_tx_done(=
struct ucc_hdlc_private *priv)
c19b6d246a35627c Zhao Qiang       2016-06-06  448  {
c19b6d246a35627c Zhao Qiang       2016-06-06  449  	/* Start from the next =
BD that should be filled */
c19b6d246a35627c Zhao Qiang       2016-06-06  450  	struct net_device *dev =
=3D priv->ndev;
2e7ad56aa54778de Mathias Thore    2018-11-07  451  	unsigned int bytes_sent=
 =3D 0;
2e7ad56aa54778de Mathias Thore    2018-11-07  452  	int howmany =3D 0;
c19b6d246a35627c Zhao Qiang       2016-06-06  453  	struct qe_bd *bd;		/* B=
D pointer */
c19b6d246a35627c Zhao Qiang       2016-06-06  454  	u16 bd_status;
ba59d5705825fb9c Mathias Thore    2018-10-22  455  	int tx_restart =3D 0;
c19b6d246a35627c Zhao Qiang       2016-06-06  456  =

c19b6d246a35627c Zhao Qiang       2016-06-06  457  	bd =3D priv->dirty_tx;
c19b6d246a35627c Zhao Qiang       2016-06-06 @458  	bd_status =3D ioread16b=
e(&bd->status);
c19b6d246a35627c Zhao Qiang       2016-06-06  459  =

c19b6d246a35627c Zhao Qiang       2016-06-06  460  	/* Normal processing. */
c19b6d246a35627c Zhao Qiang       2016-06-06  461  	while ((bd_status & T_R=
_S) =3D=3D 0) {
c19b6d246a35627c Zhao Qiang       2016-06-06  462  		struct sk_buff *skb;
c19b6d246a35627c Zhao Qiang       2016-06-06  463  =

ba59d5705825fb9c Mathias Thore    2018-10-22  464  		if (bd_status & T_UN_S=
) { /* Underrun */
ba59d5705825fb9c Mathias Thore    2018-10-22  465  			dev->stats.tx_fifo_er=
rors++;
ba59d5705825fb9c Mathias Thore    2018-10-22  466  			tx_restart =3D 1;
ba59d5705825fb9c Mathias Thore    2018-10-22  467  		}
ba59d5705825fb9c Mathias Thore    2018-10-22  468  		if (bd_status & T_CT_S=
) { /* Carrier lost */
ba59d5705825fb9c Mathias Thore    2018-10-22  469  			dev->stats.tx_carrier=
_errors++;
ba59d5705825fb9c Mathias Thore    2018-10-22  470  			tx_restart =3D 1;
ba59d5705825fb9c Mathias Thore    2018-10-22  471  		}
ba59d5705825fb9c Mathias Thore    2018-10-22  472  =

c19b6d246a35627c Zhao Qiang       2016-06-06  473  		/* BD contains already=
 transmitted buffer.   */
c19b6d246a35627c Zhao Qiang       2016-06-06  474  		/* Handle the transmit=
ted buffer and release */
c19b6d246a35627c Zhao Qiang       2016-06-06  475  		/* the BD to be used w=
ith the current frame  */
c19b6d246a35627c Zhao Qiang       2016-06-06  476  =

c19b6d246a35627c Zhao Qiang       2016-06-06  477  		skb =3D priv->tx_skbuf=
f[priv->skb_dirtytx];
c19b6d246a35627c Zhao Qiang       2016-06-06  478  		if (!skb)
c19b6d246a35627c Zhao Qiang       2016-06-06  479  			break;
2e7ad56aa54778de Mathias Thore    2018-11-07  480  		howmany++;
2e7ad56aa54778de Mathias Thore    2018-11-07  481  		bytes_sent +=3D skb->l=
en;
c19b6d246a35627c Zhao Qiang       2016-06-06  482  		dev->stats.tx_packets+=
+;
c19b6d246a35627c Zhao Qiang       2016-06-06  483  		memset(priv->tx_buffer=
 +
c19b6d246a35627c Zhao Qiang       2016-06-06  484  		       (be32_to_cpu(bd=
->buf) - priv->dma_tx_addr),
c19b6d246a35627c Zhao Qiang       2016-06-06  485  		       0, skb->len);
7c3850adbcccc2c6 Yang Wei         2019-02-06  486  		dev_consume_skb_irq(sk=
b);
c19b6d246a35627c Zhao Qiang       2016-06-06  487  =

c19b6d246a35627c Zhao Qiang       2016-06-06  488  		priv->tx_skbuff[priv->=
skb_dirtytx] =3D NULL;
c19b6d246a35627c Zhao Qiang       2016-06-06  489  		priv->skb_dirtytx =3D
c19b6d246a35627c Zhao Qiang       2016-06-06  490  		    (priv->skb_dirtytx=
 +
c19b6d246a35627c Zhao Qiang       2016-06-06  491  		     1) & TX_RING_MOD_=
MASK(TX_BD_RING_LEN);
c19b6d246a35627c Zhao Qiang       2016-06-06  492  =

c19b6d246a35627c Zhao Qiang       2016-06-06  493  		/* We freed a buffer, =
so now we can restart transmission */
c19b6d246a35627c Zhao Qiang       2016-06-06  494  		if (netif_queue_stoppe=
d(dev))
c19b6d246a35627c Zhao Qiang       2016-06-06  495  			netif_wake_queue(dev);
c19b6d246a35627c Zhao Qiang       2016-06-06  496  =

c19b6d246a35627c Zhao Qiang       2016-06-06  497  		/* Advance the confirm=
ation BD pointer */
c19b6d246a35627c Zhao Qiang       2016-06-06  498  		if (!(bd_status & T_W_=
S))
c19b6d246a35627c Zhao Qiang       2016-06-06  499  			bd +=3D 1;
c19b6d246a35627c Zhao Qiang       2016-06-06  500  		else
c19b6d246a35627c Zhao Qiang       2016-06-06  501  			bd =3D priv->tx_bd_ba=
se;
c19b6d246a35627c Zhao Qiang       2016-06-06  502  		bd_status =3D ioread16=
be(&bd->status);
c19b6d246a35627c Zhao Qiang       2016-06-06  503  	}
c19b6d246a35627c Zhao Qiang       2016-06-06  504  	priv->dirty_tx =3D bd;
c19b6d246a35627c Zhao Qiang       2016-06-06  505  =

ba59d5705825fb9c Mathias Thore    2018-10-22  506  	if (tx_restart)
ba59d5705825fb9c Mathias Thore    2018-10-22  507  		hdlc_tx_restart(priv);
ba59d5705825fb9c Mathias Thore    2018-10-22  508  =

2e7ad56aa54778de Mathias Thore    2018-11-07  509  	netdev_completed_queue(=
dev, howmany, bytes_sent);
c19b6d246a35627c Zhao Qiang       2016-06-06  510  	return 0;
c19b6d246a35627c Zhao Qiang       2016-06-06  511  }
c19b6d246a35627c Zhao Qiang       2016-06-06  512  =


:::::: The code at line 305 was first introduced by commit
:::::: c19b6d246a35627c3a69b2fa6bdece212b48214b drivers/net: support hdlc f=
unction for QE-UCC

:::::: TO: Zhao Qiang <qiang.zhao@nxp.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0782160676068959036==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0782160676068959036==--

