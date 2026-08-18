Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379EA47DF9B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 17:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072419; cv=none; b=JWt0G7ImcDdTwDcUe5GeSWb1owk2owoKzUgHr4gVtzFKPhJqJ6zUsLuwOz6Iz0QCC8pidSxudTUialCCS4phVi80Fr1pzqX2Q1gcirX1Yz3J/L2J0LXOnWOLROfmHdewLwoKlxG7gghvhUq88aaLb2uYG/g7Kw2iK5oxU1vKplw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072419; c=relaxed/simple;
	bh=lMHYN48t4dfc+DWOz36r/7Q9yrlq7HzfZPL6FE4yLp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YZOpzLt+RWTzqDi4by8M4c8ERqdjheTZkdVw83/GMhTWVib/P/3uMVUOCE1ci/l3tscxE4p4l8ON9+MAtxQvSYGaEOMBfz6Ricpvm0yLEBo2HOCylY2xAe2g6T+yT0AZRDMFW+SirhwvcfKDQhrtF/O9ZDSoQOJYZ6VCKJ2Z4yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjW80A3B; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjW80A3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787072417; x=1818608417;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lMHYN48t4dfc+DWOz36r/7Q9yrlq7HzfZPL6FE4yLp8=;
  b=EjW80A3B04pR+qr9slylg5cr8ZenSeabyI8HuBXC2ei0dYlwLTls7WJX
   8KnNMfS47/eZiVHSDLVuD42lDJqGw058Ha8CmJCV0UyQ8hFiCKko2iJDR
   px0cMi0QAW2e+jtyQ5Edmr5Li6deIUMlyOfpDtkHZGPOjoAxv2N4rAqYG
   qIKO84xNd/vrYax/Bm8WFlJ13lyParIsTCrH/5V0E2QS8Qw69nobIzoYb
   0OKgFO8JTx7O1cz42hIsyCcSac9qcNwf9PJInXahEXGrXO6dX+0c6QaI/
   FWn+0oDVGS595KTgmnrxNNWND8dH0PGyDiXG1fCzdsfHgl/awxhYgmK1p
   w==;
X-CSE-ConnectionGUID: wjcJ80JMT6u0HddZ8Cu5cQ==
X-CSE-MsgGUID: FRoldUnKR+ShkXaw5qBXkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90087004"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="90087004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 10:00:16 -0700
X-CSE-ConnectionGUID: Z2lxaHtwTZ+CWBPBhfRnwg==
X-CSE-MsgGUID: B72iYe7jRhSTffWU4Bv3ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="259092956"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Aug 2026 10:00:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwNAY-00000000eSW-2wi1;
	Tue, 18 Aug 2026 17:00:10 +0000
Date: Wed, 19 Aug 2026 00:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 182/217]
 drivers/gpio/gpio-max732x.c:604:29: warning: variable 'node' set but not used
Message-ID: <202608190030.YSmZfhvZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-r=
emove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 387fb9a6dc61a05c81abec13a03b8b95d0d05471 [182/217] gpio: max732x: r=
emove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/2026081=
9/202608190030.YSmZfhvZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260819/202608190030.YSmZfhvZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190030.YSmZfhvZ-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-max732x.c: In function 'max732x_probe':
>> drivers/gpio/gpio-max732x.c:604:29: warning: variable 'node' set but not=
 used [-Wunused-but-set-variable=3D]
     604 |         struct device_node *node;
         |                             ^~~~


vim +/node +604 drivers/gpio/gpio-max732x.c

bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 600 =20
8ac813f7e663bcf drivers/gpio/gpio-max732x.c Uwe Kleine-K=C3=B6nig    2022-1=
1-18  601  static int max732x_probe(struct i2c_client *client)
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 602  {
8ac813f7e663bcf drivers/gpio/gpio-max732x.c Uwe Kleine-K=C3=B6nig    2022-1=
1-18  603  	const struct i2c_device_id *id =3D i2c_client_get_device_id(cli=
ent);
43c4bcf9425ef59 drivers/gpio/gpio-max732x.c Sam Protsenko       2015-01-13 =
@604  	struct device_node *node;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 605  	struct max732x_chip *chip;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 606  	struct i2c_client *c;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 607  	uint16_t addr_a, addr_b;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 608  	int ret, nr_port;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 609 =20
43c4bcf9425ef59 drivers/gpio/gpio-max732x.c Sam Protsenko       2015-01-13 =
 610  	node =3D client->dev.of_node;
43c4bcf9425ef59 drivers/gpio/gpio-max732x.c Sam Protsenko       2015-01-13 =
 611 =20
43c4bcf9425ef59 drivers/gpio/gpio-max732x.c Sam Protsenko       2015-01-13 =
 612  	chip =3D devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 613  	if (chip =3D=3D NULL)
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 614  		return -ENOMEM;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 615  	chip->client =3D client;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 616 =20
387fb9a6dc61a05 drivers/gpio/gpio-max732x.c Arnd Bergmann       2026-08-07 =
 617  	nr_port =3D max732x_setup_gpio(chip, id);
58383c78425e4ee drivers/gpio/gpio-max732x.c Linus Walleij       2015-11-04 =
 618  	chip->gpio_chip.parent =3D &client->dev;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 619 =20
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 620  	addr_a =3D (client->addr & 0x0f) | 0x60;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 621  	addr_b =3D (client->addr & 0x0f) | 0x50;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 622 =20
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 623  	switch (client->addr & 0x70) {
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 624  	case 0x60:
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 625  		chip->client_group_a =3D client;
5535cb681c38bda drivers/gpio/max732x.c      Axel Lin            2010-05-26 =
 626  		if (nr_port > 8) {
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 627  			c =3D devm_i2c_new_dummy_device(&client->dev,
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 628  						      client->adapter, addr_b);
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 629  			if (IS_ERR(c)) {
f3a049e784b337e drivers/gpio/gpio-max732x.c Zhouyang Jia        2018-06-12 =
 630  				dev_err(&client->dev,
f3a049e784b337e drivers/gpio/gpio-max732x.c Zhouyang Jia        2018-06-12 =
 631  					"Failed to allocate I2C device\n");
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 632  				return PTR_ERR(c);
f3a049e784b337e drivers/gpio/gpio-max732x.c Zhouyang Jia        2018-06-12 =
 633  			}
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 634  			chip->client_group_b =3D chip->client_dummy =3D c;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 635  		}
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 636  		break;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 637  	case 0x50:
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 638  		chip->client_group_b =3D client;
5535cb681c38bda drivers/gpio/max732x.c      Axel Lin            2010-05-26 =
 639  		if (nr_port > 8) {
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 640  			c =3D devm_i2c_new_dummy_device(&client->dev,
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 641  						      client->adapter, addr_a);
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 642  			if (IS_ERR(c)) {
f3a049e784b337e drivers/gpio/gpio-max732x.c Zhouyang Jia        2018-06-12 =
 643  				dev_err(&client->dev,
f3a049e784b337e drivers/gpio/gpio-max732x.c Zhouyang Jia        2018-06-12 =
 644  					"Failed to allocate I2C device\n");
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 645  				return PTR_ERR(c);
f3a049e784b337e drivers/gpio/gpio-max732x.c Zhouyang Jia        2018-06-12 =
 646  			}
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 647  			chip->client_group_a =3D chip->client_dummy =3D c;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 648  		}
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 649  		break;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 650  	default:
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 651  		dev_err(&client->dev, "invalid I2C address specified %02x\n",
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 652  				client->addr);
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 653  		return -EINVAL;
f561b4230cec901 drivers/gpio/gpio-max732x.c Krzysztof Kozlowski 2014-03-06 =
 654  	}
f561b4230cec901 drivers/gpio/gpio-max732x.c Krzysztof Kozlowski 2014-03-06 =
 655 =20
f561b4230cec901 drivers/gpio/gpio-max732x.c Krzysztof Kozlowski 2014-03-06 =
 656  	if (nr_port > 8 && !chip->client_dummy) {
f561b4230cec901 drivers/gpio/gpio-max732x.c Krzysztof Kozlowski 2014-03-06 =
 657  		dev_err(&client->dev,
f561b4230cec901 drivers/gpio/gpio-max732x.c Krzysztof Kozlowski 2014-03-06 =
 658  			"Failed to allocate second group I2C device\n");
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 659  		return -ENODEV;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 660  	}
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 661 =20
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 662  	mutex_init(&chip->lock);
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 663 =20
78de5d522032245 drivers/gpio/gpio-max732x.c Nicholas Krause     2015-08-18 =
 664  	ret =3D max732x_readb(chip, is_group_a(chip, 0), &chip->reg_out[0]);
78de5d522032245 drivers/gpio/gpio-max732x.c Nicholas Krause     2015-08-18 =
 665  	if (ret)
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 666  		return ret;
78de5d522032245 drivers/gpio/gpio-max732x.c Nicholas Krause     2015-08-18 =
 667  	if (nr_port > 8) {
78de5d522032245 drivers/gpio/gpio-max732x.c Nicholas Krause     2015-08-18 =
 668  		ret =3D max732x_readb(chip, is_group_a(chip, 8), &chip->reg_out[1]);
78de5d522032245 drivers/gpio/gpio-max732x.c Nicholas Krause     2015-08-18 =
 669  		if (ret)
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 670  			return ret;
78de5d522032245 drivers/gpio/gpio-max732x.c Nicholas Krause     2015-08-18 =
 671  	}
a80a0bbee49872c drivers/gpio/max732x.c      Marc Zyngier        2010-05-26 =
 672 =20
bb58a47a120b888 drivers/gpio/gpio-max732x.c Linus Walleij       2020-07-27 =
 673  	ret =3D max732x_irq_setup(chip, id);
a80a0bbee49872c drivers/gpio/max732x.c      Marc Zyngier        2010-05-26 =
 674  	if (ret)
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 675  		return ret;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 676 =20
bb58a47a120b888 drivers/gpio/gpio-max732x.c Linus Walleij       2020-07-27 =
 677  	ret =3D devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
2674700c4c0ec3b drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 678  	if (ret)
375b94246761816 drivers/gpio/gpio-max732x.c Bartosz Golaszewski 2019-05-21 =
 679  		return ret;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 680 =20
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 681  	i2c_set_clientdata(client, chip);
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 682  	return 0;
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 683  }
bbcd6d543de335b drivers/gpio/max732x.c      Eric Miao           2008-07-25 =
 684 =20

:::::: The code at line 604 was first introduced by commit
:::::: 43c4bcf9425ef596f9651bd0c647065dc5e9ad50 gpio: max732x: Add device t=
ree support

:::::: TO: Semen Protsenko <semen.protsenko@globallogic.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
