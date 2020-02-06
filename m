Content-Type: multipart/mixed; boundary="===============4573891893851766875=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-arm:cex7 92/97] drivers/net/ethernet/freescale/xgmac_mdio.c:262:25: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Thu, 06 Feb 2020 22:50:46 +0800
Message-ID: <202002062243.RIyz5ZCS%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4573891893851766875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.armlinux.org.uk/~rmk/linux-arm cex7
head:   2f8726526ed0fd189f8a945c06f8b9850777a5ca
commit: 3c4c60c5729d166b5d864902e3f225713beb3b5d [92/97] net: xgmac_mdio: a=
llow ethernet drivers to create mdio buses
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        git checkout 3c4c60c5729d166b5d864902e3f225713beb3b5d
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/freescale/xgmac_mdio.c:262:25: sparse: sparse: inco=
rrect type in assignment (different address spaces)
>> drivers/net/ethernet/freescale/xgmac_mdio.c:262:25: sparse:    expected =
struct tgec_mdio_controller [noderef] <asn:2> *mdio_base
>> drivers/net/ethernet/freescale/xgmac_mdio.c:262:25: sparse:    got void =
*base
   drivers/net/ethernet/freescale/xgmac_mdio.c:287:14: sparse: sparse: inco=
rrect type in assignment (different address spaces)
>> drivers/net/ethernet/freescale/xgmac_mdio.c:287:14: sparse:    expected =
void *base
>> drivers/net/ethernet/freescale/xgmac_mdio.c:287:14: sparse:    got void =
[noderef] <asn:2> *
   drivers/net/ethernet/freescale/xgmac_mdio.c:315:17: sparse: sparse: inco=
rrect type in argument 1 (different address spaces)
   drivers/net/ethernet/freescale/xgmac_mdio.c:315:17: sparse:    expected =
void volatile [noderef] <asn:2> *addr
   drivers/net/ethernet/freescale/xgmac_mdio.c:315:17: sparse:    got void =
*base
   drivers/net/ethernet/freescale/xgmac_mdio.c:325:20: sparse: sparse: inco=
rrect type in argument 1 (different address spaces)
   drivers/net/ethernet/freescale/xgmac_mdio.c:325:20: sparse:    expected =
void volatile [noderef] <asn:2> *addr
   drivers/net/ethernet/freescale/xgmac_mdio.c:325:20: sparse:    got void =
*priv

vim +262 drivers/net/ethernet/freescale/xgmac_mdio.c

   243	=

   244	struct mii_bus *xgmac_mdio_bus_create(struct device *parent,
   245					      unsigned long long id,
   246					      void *base, bool is_little_endian)
   247	{
   248		struct mdio_fsl_priv *priv;
   249		struct mii_bus *bus;
   250	=

   251		bus =3D mdiobus_alloc_size(sizeof(struct mdio_fsl_priv));
   252		if (!bus)
   253			return NULL;
   254	=

   255		bus->name =3D "Freescale XGMAC MDIO Bus";
   256		bus->read =3D xgmac_mdio_read;
   257		bus->write =3D xgmac_mdio_write;
   258		bus->parent =3D parent;
   259		snprintf(bus->id, MII_BUS_ID_SIZE, "%llx", id);
   260	=

   261		priv =3D bus->priv;
 > 262		priv->mdio_base =3D base;
   263		priv->is_little_endian =3D is_little_endian;
   264	=

   265		return bus;
   266	}
   267	EXPORT_SYMBOL_GPL(xgmac_mdio_bus_create);
   268	=

   269	static int xgmac_mdio_probe(struct platform_device *pdev)
   270	{
   271		struct device_node *np =3D pdev->dev.of_node;
   272		struct mdio_fsl_priv *priv;
   273		bool is_little_endian;
   274		struct mii_bus *bus;
   275		struct resource res;
   276		void *base;
   277		int ret;
   278	=

   279		ret =3D of_address_to_resource(np, 0, &res);
   280		if (ret) {
   281			dev_err(&pdev->dev, "could not obtain address\n");
   282			return ret;
   283		}
   284	=

   285		is_little_endian =3D of_property_read_bool(np, "little-endian");
   286	=

 > 287		base =3D of_iomap(np, 0);
   288		if (!base)
   289			return -ENOMEM;
   290	=

   291		bus =3D xgmac_mdio_bus_create(&pdev->dev, res.start, base,
   292					    is_little_endian);
   293		if (!bus) {
   294			ret =3D -ENOMEM;
   295			goto err_create;
   296		}
   297	=

   298		priv =3D bus->priv;
   299		priv->has_a011043 =3D of_property_read_bool(pdev->dev.of_node,
   300							  "fsl,erratum-a011043");
   301	=

   302		ret =3D of_mdiobus_register(bus, np);
   303		if (ret) {
   304			dev_err(&pdev->dev, "cannot register MDIO bus\n");
   305			goto err_registration;
   306		}
   307	=

   308		platform_set_drvdata(pdev, bus);
   309	=

   310		return 0;
   311	=

   312	err_registration:
   313		mdiobus_free(bus);
   314	err_create:
   315		iounmap(base);
   316	=

   317		return ret;
   318	}
   319	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============4573891893851766875==--

