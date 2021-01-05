Content-Type: multipart/mixed; boundary="===============1573510995454321355=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v8 2/2] power: supply: bq256xx: Introduce the BQ256XX charger driver
Date: Tue, 05 Jan 2021 11:50:54 +0800
Message-ID: <202101051111.3csiSfkT-lkp@intel.com>
In-Reply-To: <20210104202450.9669-3-r-rivera-matos@ti.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1573510995454321355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on power-supply/for-next]
[also build test WARNING on robh/for-next v5.11-rc2 next-20210104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ricardo-Rivera-Matos/Intro=
duce-the-BQ256XX-family-of-chargers/20210105-043028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-sup=
ply.git for-next
config: s390-randconfig-r005-20210105 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 5c9516=
23bc8965fa1e89660f2f5f4a2944e4981a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/82436c2c6d99c4effb187bbd0=
9b47c4dc59a1f3d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ricardo-Rivera-Matos/Introduce-the=
-BQ256XX-family-of-chargers/20210105-043028
        git checkout 82436c2c6d99c4effb187bbd09b47c4dc59a1f3d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
                     ^
   In file included from drivers/power/supply/bq256xx_charger.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from drivers/power/supply/bq256xx_charger.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
                     ^
   In file included from drivers/power/supply/bq256xx_charger.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
                     ^
   In file included from drivers/power/supply/bq256xx_charger.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
                     ^
   In file included from drivers/power/supply/bq256xx_charger.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/power/supply/bq256xx_charger.c:1644:29: warning: variable 'psy_c=
fg' is uninitialized when used here [-Wuninitialized]
           ret =3D bq256xx_parse_dt(bq, psy_cfg, dev);
                                      ^~~~~~~
   drivers/power/supply/bq256xx_charger.c:1618:37: note: initialize the var=
iable 'psy_cfg' to silence this warning
           struct power_supply_config *psy_cfg;
                                              ^
                                               =3D NULL
>> drivers/power/supply/bq256xx_charger.c:1720:36: warning: unused variable=
 'bq256xx_acpi_match' [-Wunused-const-variable]
   static const struct acpi_device_id bq256xx_acpi_match[] =3D {
                                      ^
   22 warnings generated.


vim +/psy_cfg +1644 drivers/power/supply/bq256xx_charger.c

  1612	=

  1613	static int bq256xx_probe(struct i2c_client *client,
  1614				 const struct i2c_device_id *id)
  1615	{
  1616		struct device *dev =3D &client->dev;
  1617		struct bq256xx_device *bq;
  1618		struct power_supply_config *psy_cfg;
  1619	=

  1620		int ret;
  1621	=

  1622		bq =3D devm_kzalloc(dev, sizeof(*bq), GFP_KERNEL);
  1623		if (!bq)
  1624			return -ENOMEM;
  1625	=

  1626		bq->client =3D client;
  1627		bq->dev =3D dev;
  1628		bq->chip_info =3D &bq256xx_chip_info_tbl[id->driver_data];
  1629	=

  1630		mutex_init(&bq->lock);
  1631	=

  1632		strncpy(bq->model_name, id->name, I2C_NAME_SIZE);
  1633	=

  1634		bq->regmap =3D devm_regmap_init_i2c(client,
  1635						bq->chip_info->bq256xx_regmap_config);
  1636	=

  1637		if (IS_ERR(bq->regmap)) {
  1638			dev_err(dev, "Failed to allocate register map\n");
  1639			return PTR_ERR(bq->regmap);
  1640		}
  1641	=

  1642		i2c_set_clientdata(client, bq);
  1643	=

> 1644		ret =3D bq256xx_parse_dt(bq, psy_cfg, dev);
  1645		if (ret) {
  1646			dev_err(dev, "Failed to read device tree properties%d\n", ret);
  1647			return ret;
  1648		}
  1649	=

  1650		ret =3D devm_add_action_or_reset(dev, bq256xx_charger_reset, bq);
  1651		if (ret)
  1652			return ret;
  1653	=

  1654		/* OTG reporting */
  1655		bq->usb2_phy =3D devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
  1656		if (!IS_ERR_OR_NULL(bq->usb2_phy)) {
  1657			INIT_WORK(&bq->usb_work, bq256xx_usb_work);
  1658			bq->usb_nb.notifier_call =3D bq256xx_usb_notifier;
  1659			usb_register_notifier(bq->usb2_phy, &bq->usb_nb);
  1660		}
  1661	=

  1662		bq->usb3_phy =3D devm_usb_get_phy(dev, USB_PHY_TYPE_USB3);
  1663		if (!IS_ERR_OR_NULL(bq->usb3_phy)) {
  1664			INIT_WORK(&bq->usb_work, bq256xx_usb_work);
  1665			bq->usb_nb.notifier_call =3D bq256xx_usb_notifier;
  1666			usb_register_notifier(bq->usb3_phy, &bq->usb_nb);
  1667		}
  1668	=

  1669		if (client->irq) {
  1670			ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
  1671							bq256xx_irq_handler_thread,
  1672							IRQF_TRIGGER_FALLING |
  1673							IRQF_ONESHOT,
  1674							dev_name(&client->dev), bq);
  1675			if (ret < 0) {
  1676				dev_err(dev, "get irq fail: %d\n", ret);
  1677				return ret;
  1678			}
  1679		}
  1680	=

  1681		ret =3D bq256xx_power_supply_init(bq, psy_cfg, dev);
  1682		if (ret) {
  1683			dev_err(dev, "Failed to register power supply\n");
  1684			return ret;
  1685		}
  1686	=

  1687		ret =3D bq256xx_hw_init(bq);
  1688		if (ret) {
  1689			dev_err(dev, "Cannot initialize the chip.\n");
  1690			return ret;
  1691		}
  1692	=

  1693		return ret;
  1694	}
  1695	=

  1696	static const struct i2c_device_id bq256xx_i2c_ids[] =3D {
  1697		{ "bq25600", BQ25600 },
  1698		{ "bq25600d", BQ25600D },
  1699		{ "bq25601", BQ25601 },
  1700		{ "bq25601d", BQ25601D },
  1701		{ "bq25611d", BQ25611D },
  1702		{ "bq25618", BQ25618 },
  1703		{ "bq25619", BQ25619 },
  1704		{},
  1705	};
  1706	MODULE_DEVICE_TABLE(i2c, bq256xx_i2c_ids);
  1707	=

  1708	static const struct of_device_id bq256xx_of_match[] =3D {
  1709		{ .compatible =3D "ti,bq25600", .data =3D (void *)BQ25600 },
  1710		{ .compatible =3D "ti,bq25600d", .data =3D (void *)BQ25600D },
  1711		{ .compatible =3D "ti,bq25601", .data =3D (void *)BQ25601 },
  1712		{ .compatible =3D "ti,bq25601d", .data =3D (void *)BQ25601D },
  1713		{ .compatible =3D "ti,bq25611d", .data =3D (void *)BQ25611D },
  1714		{ .compatible =3D "ti,bq25618", .data =3D (void *)BQ25618 },
  1715		{ .compatible =3D "ti,bq25619", .data =3D (void *)BQ25619 },
  1716		{ },
  1717	};
  1718	MODULE_DEVICE_TABLE(of, bq256xx_of_match);
  1719	=

> 1720	static const struct acpi_device_id bq256xx_acpi_match[] =3D {
  1721		{ "bq25600", BQ25600 },
  1722		{ "bq25600d", BQ25600D },
  1723		{ "bq25601", BQ25601 },
  1724		{ "bq25601d", BQ25601D },
  1725		{ "bq25611d", BQ25611D },
  1726		{ "bq25618", BQ25618 },
  1727		{ "bq25619", BQ25619 },
  1728		{},
  1729	};
  1730	MODULE_DEVICE_TABLE(acpi, bq256xx_acpi_match);
  1731	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1573510995454321355==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Ffaw/AesdrDMcMMAAA==
--===============1573510995454321355==--

