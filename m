Content-Type: multipart/mixed; boundary="===============7423360470898240764=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1680: undefined reference to `devm_ioremap_resource'
Date: Sun, 24 May 2020 20:16:37 +0800
Message-ID: <202005242032.Kn1Imbky%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7423360470898240764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Brendan,

It's probably a bug fix that unveils the link errors.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   caffb99b6929f41a69edbb5aef3a359bf45f3315
commit: 0e31e3573f0cd94d7b821117db854187ffc85765 lkdtm/bugs: fix build erro=
r in lkdtm_UNSET_SMEP
date:   4 months ago
config: um-randconfig-s001-20200524 (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout 0e31e3573f0cd94d7b821117db854187ffc85765
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Dum CF=3D'-fdiagnostic-prefix -D__CHECK_ENDI=
AN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

/usr/bin/ld: drivers/net/ethernet/xilinx/xilinx_axienet_main.o: in function=
 `axienet_probe':
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1680: undefined refere=
nce to `devm_ioremap_resource'
collect2: error: ld returned 1 exit status

vim +1680 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

8a3b7a252dca9f Daniel Borkmann     2012-01-19  1633  =

8a3b7a252dca9f Daniel Borkmann     2012-01-19  1634  /**
2be586205ca2b8 Srikanth Thokala    2015-05-05  1635   * axienet_probe - Axi=
 Ethernet probe function.
95219aa538e11d Srikanth Thokala    2015-05-05  1636   * @pdev:	Pointer to p=
latform device structure.
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1637   *
b0d081c524b46c Michal Simek        2015-05-05  1638   * Return: 0, on succe=
ss
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1639   *	    Non-zero error =
value on failure.
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1640   *
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1641   * This is the probe r=
outine for Axi Ethernet driver. This is called before
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1642   * any other driver ro=
utines are invoked. It allocates and sets up the Ethernet
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1643   * device. Parses thro=
ugh device tree and populates fields of
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1644   * axienet_local. It r=
egisters the Ethernet device.
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1645   */
2be586205ca2b8 Srikanth Thokala    2015-05-05  1646  static int axienet_pro=
be(struct platform_device *pdev)
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1647  {
8495659bf93c8e Srikanth Thokala    2015-05-05  1648  	int ret;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1649  	struct device_node *n=
p;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1650  	struct axienet_local =
*lp;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1651  	struct net_device *nd=
ev;
da90e38003e2f0 Tobias Klauser      2016-12-07  1652  	const void *mac_addr;
28ef9ebdb64c6f Robert Hancock      2019-06-06  1653  	struct resource *ethr=
es;
8495659bf93c8e Srikanth Thokala    2015-05-05  1654  	u32 value;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1655  =

8a3b7a252dca9f Daniel Borkmann     2012-01-19  1656  	ndev =3D alloc_etherd=
ev(sizeof(*lp));
41de8d4cff21a2 Joe Perches         2012-01-29  1657  	if (!ndev)
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1658  		return -ENOMEM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1659  =

95219aa538e11d Srikanth Thokala    2015-05-05  1660  	platform_set_drvdata(=
pdev, ndev);
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1661  =

95219aa538e11d Srikanth Thokala    2015-05-05  1662  	SET_NETDEV_DEV(ndev, =
&pdev->dev);
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1663  	ndev->flags &=3D ~IFF=
_MULTICAST;  /* clear multicast */
28e24c62ab3062 Eric Dumazet        2013-12-02  1664  	ndev->features =3D NE=
TIF_F_SG;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1665  	ndev->netdev_ops =3D =
&axienet_netdev_ops;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1666  	ndev->ethtool_ops =3D=
 &axienet_ethtool_ops;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1667  =

d894be57ca92c8 Jarod Wilson        2016-10-20  1668  	/* MTU range: 64 - 90=
00 */
d894be57ca92c8 Jarod Wilson        2016-10-20  1669  	ndev->min_mtu =3D 64;
d894be57ca92c8 Jarod Wilson        2016-10-20  1670  	ndev->max_mtu =3D XAE=
_JUMBO_MTU;
d894be57ca92c8 Jarod Wilson        2016-10-20  1671  =

8a3b7a252dca9f Daniel Borkmann     2012-01-19  1672  	lp =3D netdev_priv(nd=
ev);
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1673  	lp->ndev =3D ndev;
95219aa538e11d Srikanth Thokala    2015-05-05  1674  	lp->dev =3D &pdev->de=
v;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1675  	lp->options =3D XAE_O=
PTION_DEFAULTS;
8b09ca823ffb4e Robert Hancock      2019-06-06  1676  	lp->rx_bd_num =3D RX_=
BD_NUM_DEFAULT;
8b09ca823ffb4e Robert Hancock      2019-06-06  1677  	lp->tx_bd_num =3D TX_=
BD_NUM_DEFAULT;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1678  	/* Map device registe=
rs */
46aa27df885321 Srikanth Thokala    2015-05-05  1679  	ethres =3D platform_g=
et_resource(pdev, IORESOURCE_MEM, 0);
46aa27df885321 Srikanth Thokala    2015-05-05 @1680  	lp->regs =3D devm_ior=
emap_resource(&pdev->dev, ethres);
fcc028c106e575 Krzysztof Kozlowski 2015-07-09  1681  	if (IS_ERR(lp->regs))=
 {
95219aa538e11d Srikanth Thokala    2015-05-05  1682  		dev_err(&pdev->dev, =
"could not map Axi Ethernet regs.\n");
fcc028c106e575 Krzysztof Kozlowski 2015-07-09  1683  		ret =3D PTR_ERR(lp->=
regs);
46aa27df885321 Srikanth Thokala    2015-05-05  1684  		goto free_netdev;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1685  	}
7fa0043d5c74c6 Robert Hancock      2019-06-11  1686  	lp->regs_start =3D et=
hres->start;
46aa27df885321 Srikanth Thokala    2015-05-05  1687  =

8a3b7a252dca9f Daniel Borkmann     2012-01-19  1688  	/* Setup checksum off=
load, but default to off if not specified */
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1689  	lp->features =3D 0;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1690  =

8495659bf93c8e Srikanth Thokala    2015-05-05  1691  	ret =3D of_property_r=
ead_u32(pdev->dev.of_node, "xlnx,txcsum", &value);
8495659bf93c8e Srikanth Thokala    2015-05-05  1692  	if (!ret) {
8495659bf93c8e Srikanth Thokala    2015-05-05  1693  		switch (value) {
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1694  		case 1:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1695  			lp->csum_offload_on=
_tx_path =3D
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1696  				XAE_FEATURE_PARTIA=
L_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1697  			lp->features |=3D X=
AE_FEATURE_PARTIAL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1698  			/* Can checksum TCP=
/UDP over IPv4. */
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1699  			ndev->features |=3D=
 NETIF_F_IP_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1700  			break;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1701  		case 2:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1702  			lp->csum_offload_on=
_tx_path =3D
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1703  				XAE_FEATURE_FULL_T=
X_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1704  			lp->features |=3D X=
AE_FEATURE_FULL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1705  			/* Can checksum TCP=
/UDP over IPv4. */
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1706  			ndev->features |=3D=
 NETIF_F_IP_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1707  			break;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1708  		default:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1709  			lp->csum_offload_on=
_tx_path =3D XAE_NO_CSUM_OFFLOAD;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1710  		}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1711  	}
8495659bf93c8e Srikanth Thokala    2015-05-05  1712  	ret =3D of_property_r=
ead_u32(pdev->dev.of_node, "xlnx,rxcsum", &value);
8495659bf93c8e Srikanth Thokala    2015-05-05  1713  	if (!ret) {
8495659bf93c8e Srikanth Thokala    2015-05-05  1714  		switch (value) {
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1715  		case 1:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1716  			lp->csum_offload_on=
_rx_path =3D
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1717  				XAE_FEATURE_PARTIA=
L_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1718  			lp->features |=3D X=
AE_FEATURE_PARTIAL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1719  			break;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1720  		case 2:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1721  			lp->csum_offload_on=
_rx_path =3D
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1722  				XAE_FEATURE_FULL_R=
X_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1723  			lp->features |=3D X=
AE_FEATURE_FULL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1724  			break;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1725  		default:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1726  			lp->csum_offload_on=
_rx_path =3D XAE_NO_CSUM_OFFLOAD;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1727  		}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1728  	}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1729  	/* For supporting jum=
bo frames, the Axi Ethernet hardware must have
f080a8c35d8932 Srikanth Thokala    2015-05-05  1730  	 * a larger Rx/Tx Mem=
ory. Typically, the size must be large so that
f080a8c35d8932 Srikanth Thokala    2015-05-05  1731  	 * we can enable jumb=
o option and start supporting jumbo frames.
f080a8c35d8932 Srikanth Thokala    2015-05-05  1732  	 * Here we check for =
memory allocated for Rx/Tx in the hardware from
f080a8c35d8932 Srikanth Thokala    2015-05-05  1733  	 * the device-tree an=
d accordingly set flags.
f080a8c35d8932 Srikanth Thokala    2015-05-05  1734  	 */
8495659bf93c8e Srikanth Thokala    2015-05-05  1735  	of_property_read_u32(=
pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
ee06b1728b9564 Alvaro G. M         2017-07-17  1736  =

ee06b1728b9564 Alvaro G. M         2017-07-17  1737  	/* Start with the pro=
prietary, and broken phy_type */
ee06b1728b9564 Alvaro G. M         2017-07-17  1738  	ret =3D of_property_r=
ead_u32(pdev->dev.of_node, "xlnx,phy-type", &value);
ee06b1728b9564 Alvaro G. M         2017-07-17  1739  	if (!ret) {
ee06b1728b9564 Alvaro G. M         2017-07-17  1740  		netdev_warn(ndev, "P=
lease upgrade your device tree binary blob to use phy-mode");
ee06b1728b9564 Alvaro G. M         2017-07-17  1741  		switch (value) {
ee06b1728b9564 Alvaro G. M         2017-07-17  1742  		case XAE_PHY_TYPE_MI=
I:
ee06b1728b9564 Alvaro G. M         2017-07-17  1743  			lp->phy_mode =3D PH=
Y_INTERFACE_MODE_MII;
ee06b1728b9564 Alvaro G. M         2017-07-17  1744  			break;
ee06b1728b9564 Alvaro G. M         2017-07-17  1745  		case XAE_PHY_TYPE_GM=
II:
ee06b1728b9564 Alvaro G. M         2017-07-17  1746  			lp->phy_mode =3D PH=
Y_INTERFACE_MODE_GMII;
ee06b1728b9564 Alvaro G. M         2017-07-17  1747  			break;
ee06b1728b9564 Alvaro G. M         2017-07-17  1748  		case XAE_PHY_TYPE_RG=
MII_2_0:
ee06b1728b9564 Alvaro G. M         2017-07-17  1749  			lp->phy_mode =3D PH=
Y_INTERFACE_MODE_RGMII_ID;
ee06b1728b9564 Alvaro G. M         2017-07-17  1750  			break;
ee06b1728b9564 Alvaro G. M         2017-07-17  1751  		case XAE_PHY_TYPE_SG=
MII:
ee06b1728b9564 Alvaro G. M         2017-07-17  1752  			lp->phy_mode =3D PH=
Y_INTERFACE_MODE_SGMII;
ee06b1728b9564 Alvaro G. M         2017-07-17  1753  			break;
ee06b1728b9564 Alvaro G. M         2017-07-17  1754  		case XAE_PHY_TYPE_10=
00BASE_X:
ee06b1728b9564 Alvaro G. M         2017-07-17  1755  			lp->phy_mode =3D PH=
Y_INTERFACE_MODE_1000BASEX;
ee06b1728b9564 Alvaro G. M         2017-07-17  1756  			break;
ee06b1728b9564 Alvaro G. M         2017-07-17  1757  		default:
ee06b1728b9564 Alvaro G. M         2017-07-17  1758  			ret =3D -EINVAL;
ee06b1728b9564 Alvaro G. M         2017-07-17  1759  			goto free_netdev;
ee06b1728b9564 Alvaro G. M         2017-07-17  1760  		}
ee06b1728b9564 Alvaro G. M         2017-07-17  1761  	} else {
0c65b2b90d13c1 Andrew Lunn         2019-11-04  1762  		ret =3D of_get_phy_m=
ode(pdev->dev.of_node, &lp->phy_mode);
0c65b2b90d13c1 Andrew Lunn         2019-11-04  1763  		if (ret)
ee06b1728b9564 Alvaro G. M         2017-07-17  1764  			goto free_netdev;
ee06b1728b9564 Alvaro G. M         2017-07-17  1765  	}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1766  =

8a3b7a252dca9f Daniel Borkmann     2012-01-19  1767  	/* Find the DMA node,=
 map the DMA registers, and decode the DMA IRQs */
95219aa538e11d Srikanth Thokala    2015-05-05  1768  	np =3D of_parse_phand=
le(pdev->dev.of_node, "axistream-connected", 0);
28ef9ebdb64c6f Robert Hancock      2019-06-06  1769  	if (np) {
28ef9ebdb64c6f Robert Hancock      2019-06-06  1770  		struct resource dmar=
es;
28ef9ebdb64c6f Robert Hancock      2019-06-06  1771  =

46aa27df885321 Srikanth Thokala    2015-05-05  1772  		ret =3D of_address_t=
o_resource(np, 0, &dmares);
46aa27df885321 Srikanth Thokala    2015-05-05  1773  		if (ret) {
28ef9ebdb64c6f Robert Hancock      2019-06-06  1774  			dev_err(&pdev->dev,
28ef9ebdb64c6f Robert Hancock      2019-06-06  1775  				"unable to get DMA=
 resource\n");
fa3a419d2f674b Wen Yang            2019-03-22  1776  			of_node_put(np);
46aa27df885321 Srikanth Thokala    2015-05-05  1777  			goto free_netdev;
46aa27df885321 Srikanth Thokala    2015-05-05  1778  		}
28ef9ebdb64c6f Robert Hancock      2019-06-06  1779  		lp->dma_regs =3D dev=
m_ioremap_resource(&pdev->dev,
28ef9ebdb64c6f Robert Hancock      2019-06-06  1780  						     &dmares);
28ef9ebdb64c6f Robert Hancock      2019-06-06  1781  		lp->rx_irq =3D irq_o=
f_parse_and_map(np, 1);
28ef9ebdb64c6f Robert Hancock      2019-06-06  1782  		lp->tx_irq =3D irq_o=
f_parse_and_map(np, 0);
28ef9ebdb64c6f Robert Hancock      2019-06-06  1783  		of_node_put(np);
28ef9ebdb64c6f Robert Hancock      2019-06-06  1784  		lp->eth_irq =3D plat=
form_get_irq(pdev, 0);
28ef9ebdb64c6f Robert Hancock      2019-06-06  1785  	} else {
28ef9ebdb64c6f Robert Hancock      2019-06-06  1786  		/* Check for these r=
esources directly on the Ethernet node. */
28ef9ebdb64c6f Robert Hancock      2019-06-06  1787  		struct resource *res=
 =3D platform_get_resource(pdev,
28ef9ebdb64c6f Robert Hancock      2019-06-06  1788  							     IORESOURCE=
_MEM, 1);
28ef9ebdb64c6f Robert Hancock      2019-06-06  1789  		lp->dma_regs =3D dev=
m_ioremap_resource(&pdev->dev, res);
28ef9ebdb64c6f Robert Hancock      2019-06-06  1790  		lp->rx_irq =3D platf=
orm_get_irq(pdev, 1);
28ef9ebdb64c6f Robert Hancock      2019-06-06  1791  		lp->tx_irq =3D platf=
orm_get_irq(pdev, 0);
28ef9ebdb64c6f Robert Hancock      2019-06-06  1792  		lp->eth_irq =3D plat=
form_get_irq(pdev, 2);
28ef9ebdb64c6f Robert Hancock      2019-06-06  1793  	}
fcc028c106e575 Krzysztof Kozlowski 2015-07-09  1794  	if (IS_ERR(lp->dma_re=
gs)) {
46aa27df885321 Srikanth Thokala    2015-05-05  1795  		dev_err(&pdev->dev, =
"could not map DMA regs\n");
fcc028c106e575 Krzysztof Kozlowski 2015-07-09  1796  		ret =3D PTR_ERR(lp->=
dma_regs);
46aa27df885321 Srikanth Thokala    2015-05-05  1797  		goto free_netdev;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1798  	}
cb59c87dbc8be2 Michal Simek        2013-01-10  1799  	if ((lp->rx_irq <=3D =
0) || (lp->tx_irq <=3D 0)) {
95219aa538e11d Srikanth Thokala    2015-05-05  1800  		dev_err(&pdev->dev, =
"could not determine irqs\n");
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1801  		ret =3D -ENOMEM;
46aa27df885321 Srikanth Thokala    2015-05-05  1802  		goto free_netdev;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1803  	}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1804  =

522856cefaf09d Robert Hancock      2019-06-06  1805  	/* Check for Ethernet=
 core IRQ (optional) */
522856cefaf09d Robert Hancock      2019-06-06  1806  	if (lp->eth_irq <=3D =
0)
522856cefaf09d Robert Hancock      2019-06-06  1807  		dev_info(&pdev->dev,=
 "Ethernet core IRQ not defined\n");
522856cefaf09d Robert Hancock      2019-06-06  1808  =

8a3b7a252dca9f Daniel Borkmann     2012-01-19  1809  	/* Retrieve the MAC a=
ddress */
da90e38003e2f0 Tobias Klauser      2016-12-07  1810  	mac_addr =3D of_get_m=
ac_address(pdev->dev.of_node);
a51645f70f6384 Petr =C5=A0tetiar        2019-05-06  1811  	if (IS_ERR(mac_a=
ddr)) {
d05a9ed5c3a773 Robert Hancock      2019-06-06  1812  		dev_warn(&pdev->dev,=
 "could not find MAC address property: %ld\n",
d05a9ed5c3a773 Robert Hancock      2019-06-06  1813  			 PTR_ERR(mac_addr));
d05a9ed5c3a773 Robert Hancock      2019-06-06  1814  		mac_addr =3D NULL;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1815  	}
da90e38003e2f0 Tobias Klauser      2016-12-07  1816  	axienet_set_mac_addre=
ss(ndev, mac_addr);
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1817  =

8a3b7a252dca9f Daniel Borkmann     2012-01-19  1818  	lp->coalesce_count_rx=
 =3D XAXIDMA_DFT_RX_THRESHOLD;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1819  	lp->coalesce_count_tx=
 =3D XAXIDMA_DFT_TX_THRESHOLD;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1820  =

95219aa538e11d Srikanth Thokala    2015-05-05  1821  	lp->phy_node =3D of_p=
arse_phandle(pdev->dev.of_node, "phy-handle", 0);
46aa27df885321 Srikanth Thokala    2015-05-05  1822  	if (lp->phy_node) {
09a0354cadec26 Robert Hancock      2019-06-06  1823  		lp->clk =3D devm_clk=
_get(&pdev->dev, NULL);
09a0354cadec26 Robert Hancock      2019-06-06  1824  		if (IS_ERR(lp->clk))=
 {
09a0354cadec26 Robert Hancock      2019-06-06  1825  			dev_warn(&pdev->dev=
, "Failed to get clock: %ld\n",
09a0354cadec26 Robert Hancock      2019-06-06  1826  				 PTR_ERR(lp->clk));
09a0354cadec26 Robert Hancock      2019-06-06  1827  			lp->clk =3D NULL;
09a0354cadec26 Robert Hancock      2019-06-06  1828  		} else {
09a0354cadec26 Robert Hancock      2019-06-06  1829  			ret =3D clk_prepare=
_enable(lp->clk);
09a0354cadec26 Robert Hancock      2019-06-06  1830  			if (ret) {
09a0354cadec26 Robert Hancock      2019-06-06  1831  				dev_err(&pdev->dev=
, "Unable to enable clock: %d\n",
09a0354cadec26 Robert Hancock      2019-06-06  1832  					ret);
09a0354cadec26 Robert Hancock      2019-06-06  1833  				goto free_netdev;
09a0354cadec26 Robert Hancock      2019-06-06  1834  			}
09a0354cadec26 Robert Hancock      2019-06-06  1835  		}
09a0354cadec26 Robert Hancock      2019-06-06  1836  =

09a0354cadec26 Robert Hancock      2019-06-06  1837  		ret =3D axienet_mdio=
_setup(lp);
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1838  		if (ret)
09a0354cadec26 Robert Hancock      2019-06-06  1839  			dev_warn(&pdev->dev,
09a0354cadec26 Robert Hancock      2019-06-06  1840  				 "error registerin=
g MDIO bus: %d\n", ret);
46aa27df885321 Srikanth Thokala    2015-05-05  1841  	}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1842  =

f5203a3d9b25fa Robert Hancock      2019-06-06  1843  	lp->phylink_config.de=
v =3D &ndev->dev;
f5203a3d9b25fa Robert Hancock      2019-06-06  1844  	lp->phylink_config.ty=
pe =3D PHYLINK_NETDEV;
f5203a3d9b25fa Robert Hancock      2019-06-06  1845  =

f5203a3d9b25fa Robert Hancock      2019-06-06  1846  	lp->phylink =3D phyli=
nk_create(&lp->phylink_config, pdev->dev.fwnode,
f5203a3d9b25fa Robert Hancock      2019-06-06  1847  				     lp->phy_mode,
f5203a3d9b25fa Robert Hancock      2019-06-06  1848  				     &axienet_phyl=
ink_ops);
f5203a3d9b25fa Robert Hancock      2019-06-06  1849  	if (IS_ERR(lp->phylin=
k)) {
f5203a3d9b25fa Robert Hancock      2019-06-06  1850  		ret =3D PTR_ERR(lp->=
phylink);
f5203a3d9b25fa Robert Hancock      2019-06-06  1851  		dev_err(&pdev->dev, =
"phylink_create error (%i)\n", ret);
f5203a3d9b25fa Robert Hancock      2019-06-06  1852  		goto free_netdev;
f5203a3d9b25fa Robert Hancock      2019-06-06  1853  	}
f5203a3d9b25fa Robert Hancock      2019-06-06  1854  =

8a3b7a252dca9f Daniel Borkmann     2012-01-19  1855  	ret =3D register_netd=
ev(lp->ndev);
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1856  	if (ret) {
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1857  		dev_err(lp->dev, "re=
gister_netdev() error (%i)\n", ret);
46aa27df885321 Srikanth Thokala    2015-05-05  1858  		goto free_netdev;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1859  	}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1860  =

8a3b7a252dca9f Daniel Borkmann     2012-01-19  1861  	return 0;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1862  =

46aa27df885321 Srikanth Thokala    2015-05-05  1863  free_netdev:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1864  	free_netdev(ndev);
46aa27df885321 Srikanth Thokala    2015-05-05  1865  =

8a3b7a252dca9f Daniel Borkmann     2012-01-19  1866  	return ret;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1867  }
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1868  =


:::::: The code at line 1680 was first introduced by commit
:::::: 46aa27df88532146974628602b6f5cc587422388 net: axienet: Use devm_* ca=
lls

:::::: TO: Srikanth Thokala <srikanth.thokala@xilinx.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7423360470898240764==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
YMuTqHMf7HtpkSDBHqj/AJ6TRM1T2QAA
--===============7423360470898240764==--

