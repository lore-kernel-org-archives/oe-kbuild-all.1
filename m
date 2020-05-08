Content-Type: multipart/mixed; boundary="===============9081129828444561879=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 4961/7905] drivers/net/ethernet/xilinx/ll_temac_main.c:1411: undefined reference to `devm_ioremap'
Date: Sat, 09 May 2020 01:26:12 +0800
Message-ID: <202005090142.iTxmlwKi%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9081129828444561879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

It's probably a bug fix that unveils the link errors.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   30e2206e11ce27ae910cc0dab21472429e400a87
commit: d0e20fd4c1db7cb28874402f78f39870d84398e9 [4961/7905] um: Fix xor.h =
include
config: um-randconfig-r031-20200508 (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        git checkout d0e20fd4c1db7cb28874402f78f39870d84398e9
        # save the attached .config to linux build tree
        make ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/net/ethernet/xilinx/ll_temac_main.o: in function `t=
emac_probe':
>> drivers/net/ethernet/xilinx/ll_temac_main.c:1411: undefined reference to=
 `devm_ioremap'
>> /usr/bin/ld: drivers/net/ethernet/xilinx/ll_temac_main.c:1411: undefined=
 reference to `devm_ioremap'
   /usr/bin/ld: drivers/net/ethernet/xilinx/ll_temac_main.c:1506: undefined=
 reference to `devm_ioremap'
   /usr/bin/ld: drivers/net/ethernet/xilinx/xilinx_axienet_main.o: in funct=
ion `axienet_probe':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1810: undefined refere=
nce to `devm_ioremap_resource'
   /usr/bin/ld: drivers/misc/altera-stapl/altera-lpt.o:(.altinstructions+0x=
8): undefined reference to `X86_FEATURE_XMM2'
   /usr/bin/ld: drivers/misc/altera-stapl/altera-lpt.o:(.altinstructions+0x=
15): undefined reference to `X86_FEATURE_XMM'
   /usr/bin/ld: drivers/misc/altera-stapl/altera-lpt.o:(.altinstructions+0x=
22): undefined reference to `X86_FEATURE_XMM'
   /usr/bin/ld: drivers/misc/altera-stapl/altera-lpt.o:(.altinstructions+0x=
2f): undefined reference to `X86_FEATURE_XMM2'
   /usr/bin/ld: drivers/misc/altera-stapl/altera-lpt.o:(.altinstructions+0x=
3c): undefined reference to `X86_FEATURE_XMM'
   /usr/bin/ld: drivers/misc/altera-stapl/altera-lpt.o:(.altinstructions+0x=
49): undefined reference to `X86_FEATURE_XMM'
   collect2: error: ld returned 1 exit status

vim +1411 drivers/net/ethernet/xilinx/ll_temac_main.c

92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1383  =

92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1384  	/* setup temac private info structure */
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1385  	lp =3D netdev_priv(ndev);
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1386  	lp->ndev =3D ndev;
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1387  	lp->dev =3D &pdev->dev;
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1388  	lp->options =3D XTE_OPTION_DEFAULTS;
f7b261bfc35eab0 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1389  	lp->rx_bd_num =3D RX_BD_NUM_DEFAULT;
f7b261bfc35eab0 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1390  	lp->tx_bd_num =3D TX_BD_NUM_DEFAULT;
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1391  	spin_lock_init(&lp->rx_lock);
1d63b8d66d146de drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-21  1392  	INIT_DELAYED_WORK(&lp->restart_work, ll_temac_restart=
_work_func);
f14f5c11f051ca4 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1393  =

f14f5c11f051ca4 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1394  	/* Setup mutex for synchronization of indirect regist=
er access */
f14f5c11f051ca4 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1395  	if (pdata) {
1bd33bf0fe6d301 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-05-23  1396  		if (!pdata->indirect_lock) {
f14f5c11f051ca4 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1397  			dev_err(&pdev->dev,
1bd33bf0fe6d301 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-05-23  1398  				"indirect_lock missing in platform_data\n");
f14f5c11f051ca4 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1399  			return -EINVAL;
f14f5c11f051ca4 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1400  		}
1bd33bf0fe6d301 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-05-23  1401  		lp->indirect_lock =3D pdata->indirect_lock;
f14f5c11f051ca4 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1402  	} else {
1bd33bf0fe6d301 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-05-23  1403  		lp->indirect_lock =3D devm_kmalloc(&pdev->dev,
1bd33bf0fe6d301 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-05-23  1404  						 sizeof(*lp->indirect_lock),
f14f5c11f051ca4 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1405  						 GFP_KERNEL);
1bd33bf0fe6d301 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-05-23  1406  		spin_lock_init(lp->indirect_lock);
f14f5c11f051ca4 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1407  	}
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1408  =

92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1409  	/* map device registers */
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1410  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0=
);
4bdc0d676a64314 drivers/net/ethernet/xilinx/ll_temac_main.c Christoph Hellw=
ig 2020-01-06 @1411  	lp->regs =3D devm_ioremap(&pdev->dev, res->start,
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1412  					resource_size(res));
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1413  	if (IS_ERR(lp->regs)) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1414  		dev_err(&pdev->dev, "could not map TEMAC registers\n=
");
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1415  		return PTR_ERR(lp->regs);
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1416  	}
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1417  =

a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1418  	/* Select register access functions with the specified
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1419  	 * endianness mode.  Default for OF devices is big-en=
dian.
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1420  	 */
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1421  	little_endian =3D false;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1422  	if (temac_np) {
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1423  		if (of_get_property(temac_np, "little-endian", NULL))
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1424  			little_endian =3D true;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1425  	} else if (pdata) {
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1426  		little_endian =3D pdata->reg_little_endian;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1427  	}
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1428  	if (little_endian) {
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1429  		lp->temac_ior =3D _temac_ior_le;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1430  		lp->temac_iow =3D _temac_iow_le;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1431  	} else {
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1432  		lp->temac_ior =3D _temac_ior_be;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1433  		lp->temac_iow =3D _temac_iow_be;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1434  	}
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1435  =

23ecc4bde21f0cc drivers/net/ll_temac_main.c                 Brian Hill     =
   2010-05-26  1436  	/* Setup checksum offload, but default to off if not =
specified */
23ecc4bde21f0cc drivers/net/ll_temac_main.c                 Brian Hill     =
   2010-05-26  1437  	lp->temac_features =3D 0;
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1438  	if (temac_np) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1439  		p =3D (__be32 *)of_get_property(temac_np, "xlnx,txcs=
um", NULL);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1440  		if (p && be32_to_cpu(*p))
23ecc4bde21f0cc drivers/net/ll_temac_main.c                 Brian Hill     =
   2010-05-26  1441  			lp->temac_features |=3D TEMAC_FEATURE_TX_CSUM;
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1442  		p =3D (__be32 *)of_get_property(temac_np, "xlnx,rxcs=
um", NULL);
23ecc4bde21f0cc drivers/net/ll_temac_main.c                 Brian Hill     =
   2010-05-26  1443  		if (p && be32_to_cpu(*p))
23ecc4bde21f0cc drivers/net/ll_temac_main.c                 Brian Hill     =
   2010-05-26  1444  			lp->temac_features |=3D TEMAC_FEATURE_RX_CSUM;
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1445  	} else if (pdata) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1446  		if (pdata->txcsum)
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1447  			lp->temac_features |=3D TEMAC_FEATURE_TX_CSUM;
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1448  		if (pdata->rxcsum)
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1449  			lp->temac_features |=3D TEMAC_FEATURE_RX_CSUM;
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1450  	}
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1451  	if (lp->temac_features & TEMAC_FEATURE_TX_CSUM)
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1452  		/* Can checksum TCP/UDP over IPv4. */
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1453  		ndev->features |=3D NETIF_F_IP_CSUM;
23ecc4bde21f0cc drivers/net/ll_temac_main.c                 Brian Hill     =
   2010-05-26  1454  =

227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1455  	/* Defaults for IRQ delay/coalescing setup.  These are
227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1456  	 * configuration values, so does not belong in device=
-tree.
227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1457  	 */
227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1458  	lp->coalesce_delay_tx =3D 0x10;
227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1459  	lp->coalesce_count_tx =3D 0x22;
227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1460  	lp->coalesce_delay_rx =3D 0xff;
227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1461  	lp->coalesce_count_rx =3D 0x07;
227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1462  =

8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1463  	/* Setup LocalLink DMA */
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1464  	if (temac_np) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1465  		/* Find the DMA node, map the DMA registers, and
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1466  		 * decode the DMA IRQs.
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1467  		 */
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1468  		dma_np =3D of_parse_phandle(temac_np, "llink-connect=
ed", 0);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1469  		if (!dma_np) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1470  			dev_err(&pdev->dev, "could not find DMA node\n");
a63625d2a0e794f drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1471  			return -ENODEV;
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1472  		}
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1473  =

8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1474  		/* Setup the DMA register accesses, could be DCR or
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1475  		 * memory mapped.
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1476  		 */
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1477  		if (temac_dcr_setup(lp, pdev, dma_np)) {
e44171f115de3de drivers/net/ll_temac_main.c                 John Linn      =
   2010-04-08  1478  			/* no DCR in the device tree, try non-DCR */
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1479  			lp->sdma_regs =3D devm_of_iomap(&pdev->dev, dma_np,=
 0,
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1480  						      NULL);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1481  			if (IS_ERR(lp->sdma_regs)) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1482  				dev_err(&pdev->dev,
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1483  					"unable to map DMA registers\n");
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1484  				of_node_put(dma_np);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1485  				return PTR_ERR(lp->sdma_regs);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1486  			}
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1487  			if (of_get_property(dma_np, "little-endian", NULL))=
 {
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1488  				lp->dma_in =3D temac_dma_in32_le;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1489  				lp->dma_out =3D temac_dma_out32_le;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1490  			} else {
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1491  				lp->dma_in =3D temac_dma_in32_be;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1492  				lp->dma_out =3D temac_dma_out32_be;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1493  			}
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1494  			dev_dbg(&pdev->dev, "MEM base: %p\n", lp->sdma_regs=
);
e44171f115de3de drivers/net/ll_temac_main.c                 John Linn      =
   2010-04-08  1495  		}
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1496  =

8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1497  		/* Get DMA RX and TX interrupts */
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1498  		lp->rx_irq =3D irq_of_parse_and_map(dma_np, 0);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1499  		lp->tx_irq =3D irq_of_parse_and_map(dma_np, 1);
7cc36f6f7116918 drivers/net/ll_temac_main.c                 Kulikov Vasiliy=
   2010-07-08  1500  =

8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1501  		/* Finished with the DMA node; drop the reference */
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1502  		of_node_put(dma_np);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1503  	} else if (pdata) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1504  		/* 2nd memory resource specifies DMA registers */
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1505  		res =3D platform_get_resource(pdev, IORESOURCE_MEM, =
1);
4bdc0d676a64314 drivers/net/ethernet/xilinx/ll_temac_main.c Christoph Hellw=
ig 2020-01-06  1506  		lp->sdma_regs =3D devm_ioremap(&pdev->dev, res->star=
t,
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1507  						     resource_size(res));
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1508  		if (IS_ERR(lp->sdma_regs)) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1509  			dev_err(&pdev->dev,
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1510  				"could not map DMA registers\n");
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1511  			return PTR_ERR(lp->sdma_regs);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1512  		}
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1513  		if (pdata->dma_little_endian) {
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1514  			lp->dma_in =3D temac_dma_in32_le;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1515  			lp->dma_out =3D temac_dma_out32_le;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1516  		} else {
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1517  			lp->dma_in =3D temac_dma_in32_be;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1518  			lp->dma_out =3D temac_dma_out32_be;
a3246dc41aa3c9d drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1519  		}
7cc36f6f7116918 drivers/net/ll_temac_main.c                 Kulikov Vasiliy=
   2010-07-08  1520  =

8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1521  		/* Get DMA RX and TX interrupts */
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1522  		lp->rx_irq =3D platform_get_irq(pdev, 0);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1523  		lp->tx_irq =3D platform_get_irq(pdev, 1);
7e97a194aca03c6 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1524  =

7e97a194aca03c6 drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1525  		/* IRQ delay/coalescing setup */
227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1526  		if (pdata->tx_irq_timeout || pdata->tx_irq_count) {
227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1527  			lp->coalesce_delay_tx =3D pdata->tx_irq_timeout;
227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1528  			lp->coalesce_count_tx =3D pdata->tx_irq_count;
227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1529  		}
1d63b8d66d146de drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-21  1530  		if (pdata->rx_irq_timeout || pdata->rx_irq_count) {
227d4617c4234fd drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-28  1531  			lp->coalesce_delay_rx =3D pdata->rx_irq_timeout;
1d63b8d66d146de drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-21  1532  			lp->coalesce_count_rx =3D pdata->rx_irq_count;
1d63b8d66d146de drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2020-02-21  1533  		}
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1534  	}
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1535  =

8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1536  	/* Error handle returned DMA RX and TX interrupts */
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1537  	if (lp->rx_irq < 0) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1538  		if (lp->rx_irq !=3D -EPROBE_DEFER)
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1539  			dev_err(&pdev->dev, "could not get DMA RX irq\n");
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1540  		return lp->rx_irq;
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1541  	}
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1542  	if (lp->tx_irq < 0) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1543  		if (lp->tx_irq !=3D -EPROBE_DEFER)
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1544  			dev_err(&pdev->dev, "could not get DMA TX irq\n");
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1545  		return lp->tx_irq;
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1546  	}
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1547  =

8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1548  	if (temac_np) {
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1549  		/* Retrieve the MAC address */
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1550  		addr =3D of_get_mac_address(temac_np);
a51645f70f6384a drivers/net/ethernet/xilinx/ll_temac_main.c Petr =C5=A0teti=
ar      2019-05-06  1551  		if (IS_ERR(addr)) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1552  			dev_err(&pdev->dev, "could not find MAC address\n");
a63625d2a0e794f drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1553  			return -ENODEV;
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1554  		}
06205472765437f drivers/net/ethernet/xilinx/ll_temac_main.c Tobias Klauser =
   2016-12-07  1555  		temac_init_mac_address(ndev, addr);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1556  	} else if (pdata) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1557  		temac_init_mac_address(ndev, pdata->mac_addr);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1558  	}
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1559  =

a63625d2a0e794f drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1560  	rc =3D temac_mdio_setup(lp, pdev);
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1561  	if (rc)
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1562  		dev_warn(&pdev->dev, "error registering MDIO bus\n");
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1563  =

8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1564  	if (temac_np) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1565  		lp->phy_node =3D of_parse_phandle(temac_np, "phy-han=
dle", 0);
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1566  		if (lp->phy_node)
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1567  			dev_dbg(lp->dev, "using PHY node %pOF\n", temac_np);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1568  	} else if (pdata) {
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1569  		snprintf(lp->phy_name, sizeof(lp->phy_name),
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1570  			 PHY_ID_FMT, lp->mii_bus->id, pdata->phy_addr);
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1571  		lp->phy_interface =3D pdata->phy_interface;
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1572  	}
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1573  =

92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1574  	/* Add the device attributes */
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1575  	rc =3D sysfs_create_group(&lp->dev->kobj, &temac_attr=
_group);
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1576  	if (rc) {
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1577  		dev_err(lp->dev, "Error creating sysfs files\n");
a63625d2a0e794f drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1578  		goto err_sysfs_create;
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1579  	}
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1580  =

92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1581  	rc =3D register_netdev(lp->ndev);
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1582  	if (rc) {
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1583  		dev_err(lp->dev, "register_netdev() error (%i)\n", r=
c);
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1584  		goto err_register_ndev;
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1585  	}
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1586  =

92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1587  	return 0;
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1588  =

92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1589  err_register_ndev:
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1590  	sysfs_remove_group(&lp->dev->kobj, &temac_attr_group);
a63625d2a0e794f drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1591  err_sysfs_create:
8425c41d1ef762c drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1592  	if (lp->phy_node)
a63625d2a0e794f drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1593  		of_node_put(lp->phy_node);
a63625d2a0e794f drivers/net/ethernet/xilinx/ll_temac_main.c Esben Haabendal=
   2019-04-30  1594  	temac_mdio_teardown(lp);
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1595  	return rc;
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1596  }
92744989533cbe8 drivers/net/ll_temac_main.c                 Grant Likely   =
   2009-04-25  1597  =


:::::: The code at line 1411 was first introduced by commit
:::::: 4bdc0d676a643140bdf17dbf7eafedee3d496a3c remove ioremap_nocache and =
devm_ioremap_nocache

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9081129828444561879==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Ba/JnCoMEWP5H2hASHlV3gAA
--===============9081129828444561879==--

