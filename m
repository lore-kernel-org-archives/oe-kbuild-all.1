Content-Type: multipart/mixed; boundary="===============8643624822946598169=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-arm:cex7 93/97] drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:349:14: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Fri, 07 Feb 2020 00:45:55 +0800
Message-ID: <202002070052.tJgPLKlF%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8643624822946598169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.armlinux.org.uk/~rmk/linux-arm cex7
head:   2f8726526ed0fd189f8a945c06f8b9850777a5ca
commit: 1dad35c917e281c4d38067dac6107f0b03907bb4 [93/97] dpaa2-mac: add PCS=
 support                     [*work in progress*]
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        git checkout 1dad35c917e281c4d38067dac6107f0b03907bb4
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:349:14: sparse: sparse:=
 incorrect type in assignment (different address spaces)
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:349:14: sparse:    expe=
cted void *base
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:349:14: sparse:    got =
void [noderef] <asn:2> *
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:386:17: sparse: sparse:=
 incorrect type in argument 1 (different address spaces)
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:386:17: sparse:    expe=
cted void volatile [noderef] <asn:2> *addr
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c:386:17: sparse:    got =
void *base

vim +349 drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c

   334	=

   335	struct mii_bus *xgmac_mdio_bus_create(struct device *parent,
   336					      unsigned long long id,
   337					      void *base, bool is_little_endian);
   338	=

   339	static int dpaa2_pcs_create(struct dpaa2_mac *mac, int id)
   340	{
   341		struct mdio_device *mdiodev;
   342		struct mii_bus *bus;
   343		phys_addr_t phys;
   344		void *base;
   345		int err;
   346	=

   347		phys =3D 0x08c03000 + id * 0x4000;
   348	=

 > 349		base =3D ioremap(phys, SZ_4K);
   350		if (!base)
   351			return -ENOMEM;
   352	=

   353		bus =3D xgmac_mdio_bus_create(NULL, phys, base, true);
   354		if (!bus) {
   355			err =3D -ENOMEM;
   356			goto unmap;
   357		}
   358	=

   359		bus->phy_mask =3D ~0;
   360	=

   361		err =3D mdiobus_register(bus);
   362		if (err)
   363			goto bus_free;
   364	=

   365		mdiodev =3D mdio_device_create(bus, 0);
   366		if (IS_ERR(mdiodev)) {
   367			err =3D PTR_ERR(mdiodev);
   368			goto bus_unregister;
   369		}
   370	=

   371		err =3D mdio_device_register(mdiodev);
   372		if (err)
   373			goto dev_free;
   374	=

   375		mac->pcs =3D mdiodev;
   376		mac->phylink_config.pcs_poll =3D true;
   377	=

   378		return 0;
   379	dev_free:
   380		mdio_device_free(mdiodev);
   381	bus_unregister:
   382		mdiobus_unregister(bus);
   383	bus_free:
   384		mdiobus_free(bus);
   385	unmap:
 > 386		iounmap(base);
   387		return err;
   388	}
   389	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============8643624822946598169==--

