Content-Type: multipart/mixed; boundary="===============6857358117658716186=="
MIME-Version: 1.0
From: Florian Fainelli <f.fainelli@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:pending-fixes 371/429] drivers/phy/broadcom/phy-brcm-sata.c:542:26: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Thu, 20 Feb 2020 20:04:55 -0800
Message-ID: <8bc435b6-9819-ff5e-00a3-8b406d88ace2@gmail.com>
In-Reply-To: <202002210918.II08V0Zk%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6857358117658716186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kishon,

On 2/20/2020 5:14 PM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it pending-fixes
> head:   943e218edd5a2125dc1bc50877b6447e4e15a021
> commit: b063826de7f1340a0929d9061f0f225c606489f5 [371/429] phy: brcm-sata=
: Correct MDIO operations for 40nm platforms
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-166-g7e4a5b6f-dirty
>         git checkout b063826de7f1340a0929d9061f0f225c606489f5
>         make ARCH=3Dx86_64 allmodconfig
>         make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> =

> sparse warnings: (new ones prefixed by >>)

Looks like I missed converting brcm_sr_sata_init() somehow, I will be
sending you a v2 patch shortly, sorry about that.

> =

>>> drivers/phy/broadcom/phy-brcm-sata.c:542:26: sparse: sparse: incorrect =
type in argument 1 (different address spaces)
>>> drivers/phy/broadcom/phy-brcm-sata.c:542:26: sparse:    expected struct=
 brcm_sata_port *port
>>> drivers/phy/broadcom/phy-brcm-sata.c:542:26: sparse:    got void [noder=
ef] <asn:2> *base
>    drivers/phy/broadcom/phy-brcm-sata.c:544:26: sparse: sparse: incorrect=
 type in argument 1 (different address spaces)
>    drivers/phy/broadcom/phy-brcm-sata.c:544:26: sparse:    expected struc=
t brcm_sata_port *port
>    drivers/phy/broadcom/phy-brcm-sata.c:544:26: sparse:    got void [node=
ref] <asn:2> *base
>    drivers/phy/broadcom/phy-brcm-sata.c:546:26: sparse: sparse: incorrect=
 type in argument 1 (different address spaces)
>    drivers/phy/broadcom/phy-brcm-sata.c:546:26: sparse:    expected struc=
t brcm_sata_port *port
>    drivers/phy/broadcom/phy-brcm-sata.c:546:26: sparse:    got void [node=
ref] <asn:2> *base
>    drivers/phy/broadcom/phy-brcm-sata.c:550:26: sparse: sparse: incorrect=
 type in argument 1 (different address spaces)
>    drivers/phy/broadcom/phy-brcm-sata.c:550:26: sparse:    expected struc=
t brcm_sata_port *port
>    drivers/phy/broadcom/phy-brcm-sata.c:550:26: sparse:    got void [node=
ref] <asn:2> *base
>    drivers/phy/broadcom/phy-brcm-sata.c:555:40: sparse: sparse: incorrect=
 type in argument 1 (different address spaces)
>    drivers/phy/broadcom/phy-brcm-sata.c:555:40: sparse:    expected struc=
t brcm_sata_port *port
>    drivers/phy/broadcom/phy-brcm-sata.c:555:40: sparse:    got void [node=
ref] <asn:2> *base
>    drivers/phy/broadcom/phy-brcm-sata.c:570:26: sparse: sparse: incorrect=
 type in argument 1 (different address spaces)
>    drivers/phy/broadcom/phy-brcm-sata.c:570:26: sparse:    expected struc=
t brcm_sata_port *port
>    drivers/phy/broadcom/phy-brcm-sata.c:570:26: sparse:    got void [node=
ref] <asn:2> *base
>    drivers/phy/broadcom/phy-brcm-sata.c:578:26: sparse: sparse: incorrect=
 type in argument 1 (different address spaces)
>    drivers/phy/broadcom/phy-brcm-sata.c:578:26: sparse:    expected struc=
t brcm_sata_port *port
>    drivers/phy/broadcom/phy-brcm-sata.c:578:26: sparse:    got void [node=
ref] <asn:2> *base
>    drivers/phy/broadcom/phy-brcm-sata.c:582:26: sparse: sparse: incorrect=
 type in argument 1 (different address spaces)
>    drivers/phy/broadcom/phy-brcm-sata.c:582:26: sparse:    expected struc=
t brcm_sata_port *port
>    drivers/phy/broadcom/phy-brcm-sata.c:582:26: sparse:    got void [node=
ref] <asn:2> *base
> =

> vim +542 drivers/phy/broadcom/phy-brcm-sata.c
> =

> 80886f7c698fd6 Srinath Mannam 2017-06-08  532  =

> 80886f7c698fd6 Srinath Mannam 2017-06-08  533  static int brcm_sr_sata_in=
it(struct brcm_sata_port *port)
> 80886f7c698fd6 Srinath Mannam 2017-06-08  534  {
> 80886f7c698fd6 Srinath Mannam 2017-06-08  535  	struct brcm_sata_phy *pri=
v =3D port->phy_priv;
> 80886f7c698fd6 Srinath Mannam 2017-06-08  536  	struct device *dev =3D po=
rt->phy_priv->dev;
> 80886f7c698fd6 Srinath Mannam 2017-06-08  537  	void __iomem *base =3D pr=
iv->phy_base;
> 80886f7c698fd6 Srinath Mannam 2017-06-08  538  	unsigned int val, try;
> 80886f7c698fd6 Srinath Mannam 2017-06-08  539  =

> 80886f7c698fd6 Srinath Mannam 2017-06-08  540  	/* Configure PHY PLL regi=
ster bank 1 */
> 80886f7c698fd6 Srinath Mannam 2017-06-08  541  	val =3D SR_PLL1_ACTRL2_MA=
GIC;
> 80886f7c698fd6 Srinath Mannam 2017-06-08 @542  	brcm_sata_phy_wr(base, PL=
L1_REG_BANK, PLL1_ACTRL2, 0x0, val);
> 80886f7c698fd6 Srinath Mannam 2017-06-08  543  	val =3D SR_PLL1_ACTRL3_MA=
GIC;
> 80886f7c698fd6 Srinath Mannam 2017-06-08  544  	brcm_sata_phy_wr(base, PL=
L1_REG_BANK, PLL1_ACTRL3, 0x0, val);
> 80886f7c698fd6 Srinath Mannam 2017-06-08  545  	val =3D SR_PLL1_ACTRL4_MA=
GIC;
> 80886f7c698fd6 Srinath Mannam 2017-06-08  546  	brcm_sata_phy_wr(base, PL=
L1_REG_BANK, PLL1_ACTRL4, 0x0, val);
> 80886f7c698fd6 Srinath Mannam 2017-06-08  547  =

> 80886f7c698fd6 Srinath Mannam 2017-06-08  548  	/* Configure PHY PLL regi=
ster bank 0 */
> 80886f7c698fd6 Srinath Mannam 2017-06-08  549  	val =3D SR_PLL0_ACTRL6_MA=
GIC;
> 80886f7c698fd6 Srinath Mannam 2017-06-08  550  	brcm_sata_phy_wr(base, PL=
L_REG_BANK_0, PLL_ACTRL6, 0x0, val);
> 80886f7c698fd6 Srinath Mannam 2017-06-08  551  =

> 80886f7c698fd6 Srinath Mannam 2017-06-08  552  	/* Wait for PHY PLL lock =
by polling pll_lock bit */
> 80886f7c698fd6 Srinath Mannam 2017-06-08  553  	try =3D 50;
> 80886f7c698fd6 Srinath Mannam 2017-06-08  554  	do {
> 80886f7c698fd6 Srinath Mannam 2017-06-08  555  		val =3D brcm_sata_phy_rd=
(base, BLOCK0_REG_BANK,
> 80886f7c698fd6 Srinath Mannam 2017-06-08  556  					BLOCK0_XGXSSTATUS);
> 80886f7c698fd6 Srinath Mannam 2017-06-08  557  		if (val & BLOCK0_XGXSSTA=
TUS_PLL_LOCK)
> 80886f7c698fd6 Srinath Mannam 2017-06-08  558  			break;
> 80886f7c698fd6 Srinath Mannam 2017-06-08  559  		msleep(20);
> 80886f7c698fd6 Srinath Mannam 2017-06-08  560  		try--;
> 80886f7c698fd6 Srinath Mannam 2017-06-08  561  	} while (try);
> 80886f7c698fd6 Srinath Mannam 2017-06-08  562  =

> 80886f7c698fd6 Srinath Mannam 2017-06-08  563  	if ((val & BLOCK0_XGXSSTA=
TUS_PLL_LOCK) =3D=3D 0) {
> 80886f7c698fd6 Srinath Mannam 2017-06-08  564  		/* PLL did not lock; giv=
e up */
> 80886f7c698fd6 Srinath Mannam 2017-06-08  565  		dev_err(dev, "port%d PLL=
 did not lock\n", port->portnum);
> 80886f7c698fd6 Srinath Mannam 2017-06-08  566  		return -ETIMEDOUT;
> 80886f7c698fd6 Srinath Mannam 2017-06-08  567  	}
> 80886f7c698fd6 Srinath Mannam 2017-06-08  568  =

> 80886f7c698fd6 Srinath Mannam 2017-06-08  569  	/* Invert Tx polarity */
> 80886f7c698fd6 Srinath Mannam 2017-06-08  570  	brcm_sata_phy_wr(base, TX=
_REG_BANK, TX_ACTRL0,
> 80886f7c698fd6 Srinath Mannam 2017-06-08  571  			 ~TX_ACTRL0_TXPOL_FLIP,=
 TX_ACTRL0_TXPOL_FLIP);
> 80886f7c698fd6 Srinath Mannam 2017-06-08  572  =

> 80886f7c698fd6 Srinath Mannam 2017-06-08  573  	/* Configure OOB control =
to handle 100MHz reference clock */
> 80886f7c698fd6 Srinath Mannam 2017-06-08  574  	val =3D ((0xc << OOB_CTRL=
1_BURST_MAX_SHIFT) |
> 80886f7c698fd6 Srinath Mannam 2017-06-08  575  		(0x4 << OOB_CTRL1_BURST_=
MIN_SHIFT) |
> 80886f7c698fd6 Srinath Mannam 2017-06-08  576  		(0x8 << OOB_CTRL1_WAKE_I=
DLE_MAX_SHIFT) |
> 80886f7c698fd6 Srinath Mannam 2017-06-08  577  		(0x3 << OOB_CTRL1_WAKE_I=
DLE_MIN_SHIFT));
> 80886f7c698fd6 Srinath Mannam 2017-06-08  578  	brcm_sata_phy_wr(base, OO=
B_REG_BANK, OOB_CTRL1, 0x0, val);
> 80886f7c698fd6 Srinath Mannam 2017-06-08  579  	val =3D ((0x1b << OOB_CTR=
L2_RESET_IDLE_MAX_SHIFT) |
> 80886f7c698fd6 Srinath Mannam 2017-06-08  580  		(0x2 << OOB_CTRL2_BURST_=
CNT_SHIFT) |
> 80886f7c698fd6 Srinath Mannam 2017-06-08  581  		(0x9 << OOB_CTRL2_RESET_=
IDLE_MIN_SHIFT));
> 80886f7c698fd6 Srinath Mannam 2017-06-08  582  	brcm_sata_phy_wr(base, OO=
B_REG_BANK, OOB_CTRL2, 0x0, val);
> 80886f7c698fd6 Srinath Mannam 2017-06-08  583  =

> 80886f7c698fd6 Srinath Mannam 2017-06-08  584  	return 0;
> 80886f7c698fd6 Srinath Mannam 2017-06-08  585  }
> 80886f7c698fd6 Srinath Mannam 2017-06-08  586  =

> =

> :::::: The code at line 542 was first introduced by commit
> :::::: 80886f7c698fd64366a6eced011ec82f4daf968b phy: Add stingray SATA ph=
y support
> =

> :::::: TO: Srinath Mannam <srinath.mannam@broadcom.com>
> :::::: CC: Kishon Vijay Abraham I <kishon@ti.com>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =


-- =

Florian
--===============6857358117658716186==--

