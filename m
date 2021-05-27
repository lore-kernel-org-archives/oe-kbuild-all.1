Content-Type: multipart/mixed; boundary="===============0765497545413612683=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2] Input: elants_i2c - Fix NULL dereference at probing
Date: Fri, 28 May 2021 02:59:22 +0800
Message-ID: <202105280215.fe5ohKNz-lkp@intel.com>
In-Reply-To: <20210527173153.16470-1-tiwai@suse.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0765497545413612683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on input/next]
[also build test WARNING on hid/for-next linux/master linus/master v5.13-rc=
3 next-20210527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Takashi-Iwai/Input-elants_=
i2c-Fix-NULL-dereference-at-probing/20210528-013428
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: s390-randconfig-r023-20210526 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 6505c6=
30407c5feec818f0bb1c284f9eeebf2071)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/8a6af622a33ab5301cea789e5=
ff6a9afd9b09828
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Takashi-Iwai/Input-elants_i2c-Fix-=
NULL-dereference-at-probing/20210528-013428
        git checkout 8a6af622a33ab5301cea789e5ff6a9afd9b09828
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/input/touchscreen/elants_i2c.c:26:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from mac=
ro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/input/touchscreen/elants_i2c.c:26:
   In file included from include/linux/irq.h:20:
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
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/input/touchscreen/elants_i2c.c:26:
   In file included from include/linux/irq.h:20:
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
>> drivers/input/touchscreen/elants_i2c.c:1399:16: warning: cast to smaller=
 integer type 'enum elants_chip_id' from 'const void *' [-Wvoid-pointer-to-=
enum-cast]
           ts->chip_id =3D (enum elants_chip_id)device_get_match_data(&clie=
nt->dev);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   13 warnings generated.


vim +1399 drivers/input/touchscreen/elants_i2c.c

  1371	=

  1372	static int elants_i2c_probe(struct i2c_client *client,
  1373				    const struct i2c_device_id *id)
  1374	{
  1375		union i2c_smbus_data dummy;
  1376		struct elants_data *ts;
  1377		unsigned long irqflags;
  1378		int error;
  1379	=

  1380		/* Don't bind to i2c-hid compatible devices, these are handled by t=
he i2c-hid drv. */
  1381		if (elants_acpi_is_hid_device(&client->dev)) {
  1382			dev_warn(&client->dev, "This device appears to be an I2C-HID devic=
e, not binding\n");
  1383			return -ENODEV;
  1384		}
  1385	=

  1386		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
  1387			dev_err(&client->dev, "I2C check functionality error\n");
  1388			return -ENXIO;
  1389		}
  1390	=

  1391		ts =3D devm_kzalloc(&client->dev, sizeof(struct elants_data), GFP_K=
ERNEL);
  1392		if (!ts)
  1393			return -ENOMEM;
  1394	=

  1395		mutex_init(&ts->sysfs_mutex);
  1396		init_completion(&ts->cmd_done);
  1397	=

  1398		ts->client =3D client;
> 1399		ts->chip_id =3D (enum elants_chip_id)device_get_match_data(&client-=
>dev);
  1400		i2c_set_clientdata(client, ts);
  1401	=

  1402		ts->vcc33 =3D devm_regulator_get(&client->dev, "vcc33");
  1403		if (IS_ERR(ts->vcc33)) {
  1404			error =3D PTR_ERR(ts->vcc33);
  1405			if (error !=3D -EPROBE_DEFER)
  1406				dev_err(&client->dev,
  1407					"Failed to get 'vcc33' regulator: %d\n",
  1408					error);
  1409			return error;
  1410		}
  1411	=

  1412		ts->vccio =3D devm_regulator_get(&client->dev, "vccio");
  1413		if (IS_ERR(ts->vccio)) {
  1414			error =3D PTR_ERR(ts->vccio);
  1415			if (error !=3D -EPROBE_DEFER)
  1416				dev_err(&client->dev,
  1417					"Failed to get 'vccio' regulator: %d\n",
  1418					error);
  1419			return error;
  1420		}
  1421	=

  1422		ts->reset_gpio =3D devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_=
LOW);
  1423		if (IS_ERR(ts->reset_gpio)) {
  1424			error =3D PTR_ERR(ts->reset_gpio);
  1425	=

  1426			if (error =3D=3D -EPROBE_DEFER)
  1427				return error;
  1428	=

  1429			if (error !=3D -ENOENT && error !=3D -ENOSYS) {
  1430				dev_err(&client->dev,
  1431					"failed to get reset gpio: %d\n",
  1432					error);
  1433				return error;
  1434			}
  1435	=

  1436			ts->keep_power_in_suspend =3D true;
  1437		}
  1438	=

  1439		error =3D elants_i2c_power_on(ts);
  1440		if (error)
  1441			return error;
  1442	=

  1443		error =3D devm_add_action(&client->dev, elants_i2c_power_off, ts);
  1444		if (error) {
  1445			dev_err(&client->dev,
  1446				"failed to install power off action: %d\n", error);
  1447			elants_i2c_power_off(ts);
  1448			return error;
  1449		}
  1450	=

  1451		/* Make sure there is something at this address */
  1452		if (i2c_smbus_xfer(client->adapter, client->addr, 0,
  1453				   I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &dummy) < 0) {
  1454			dev_err(&client->dev, "nothing at this address\n");
  1455			return -ENXIO;
  1456		}
  1457	=

  1458		error =3D elants_i2c_initialize(ts);
  1459		if (error) {
  1460			dev_err(&client->dev, "failed to initialize: %d\n", error);
  1461			return error;
  1462		}
  1463	=

  1464		ts->input =3D devm_input_allocate_device(&client->dev);
  1465		if (!ts->input) {
  1466			dev_err(&client->dev, "Failed to allocate input device\n");
  1467			return -ENOMEM;
  1468		}
  1469	=

  1470		ts->input->name =3D "Elan Touchscreen";
  1471		ts->input->id.bustype =3D BUS_I2C;
  1472	=

  1473		/* Multitouch input params setup */
  1474	=

  1475		input_set_abs_params(ts->input, ABS_MT_POSITION_X, 0, ts->x_max, 0,=
 0);
  1476		input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, ts->y_max, 0,=
 0);
  1477		input_set_abs_params(ts->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
  1478		input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
  1479		input_set_abs_params(ts->input, ABS_MT_TOOL_TYPE,
  1480				     0, MT_TOOL_PALM, 0, 0);
  1481	=

  1482		touchscreen_parse_properties(ts->input, true, &ts->prop);
  1483	=

  1484		if (ts->chip_id =3D=3D EKTF3624 && ts->phy_x && ts->phy_y) {
  1485			/* calculate resolution from size */
  1486			ts->x_res =3D DIV_ROUND_CLOSEST(ts->prop.max_x, ts->phy_x);
  1487			ts->y_res =3D DIV_ROUND_CLOSEST(ts->prop.max_y, ts->phy_y);
  1488		}
  1489	=

  1490		input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
  1491		input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
  1492		input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, ts->major_res);
  1493	=

  1494		error =3D input_mt_init_slots(ts->input, MAX_CONTACT_NUM,
  1495					    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
  1496		if (error) {
  1497			dev_err(&client->dev,
  1498				"failed to initialize MT slots: %d\n", error);
  1499			return error;
  1500		}
  1501	=

  1502		error =3D input_register_device(ts->input);
  1503		if (error) {
  1504			dev_err(&client->dev,
  1505				"unable to register input device: %d\n", error);
  1506			return error;
  1507		}
  1508	=

  1509		/*
  1510		 * Platform code (ACPI, DTS) should normally set up interrupt
  1511		 * for us, but in case it did not let's fall back to using falling
  1512		 * edge to be compatible with older Chromebooks.
  1513		 */
  1514		irqflags =3D irq_get_trigger_type(client->irq);
  1515		if (!irqflags)
  1516			irqflags =3D IRQF_TRIGGER_FALLING;
  1517	=

  1518		error =3D devm_request_threaded_irq(&client->dev, client->irq,
  1519						  NULL, elants_i2c_irq,
  1520						  irqflags | IRQF_ONESHOT,
  1521						  client->name, ts);
  1522		if (error) {
  1523			dev_err(&client->dev, "Failed to register interrupt\n");
  1524			return error;
  1525		}
  1526	=

  1527		/*
  1528		 * Systems using device tree should set up wakeup via DTS,
  1529		 * the rest will configure device as wakeup source by default.
  1530		 */
  1531		if (!client->dev.of_node)
  1532			device_init_wakeup(&client->dev, true);
  1533	=

  1534		error =3D devm_device_add_group(&client->dev, &elants_attribute_gro=
up);
  1535		if (error) {
  1536			dev_err(&client->dev, "failed to create sysfs attributes: %d\n",
  1537				error);
  1538			return error;
  1539		}
  1540	=

  1541		return 0;
  1542	}
  1543	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0765497545413612683==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0765497545413612683==--

