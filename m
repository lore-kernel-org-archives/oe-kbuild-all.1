Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C623563D4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 01:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787016762; cv=none; b=YclKNunNKeRDtqdbraGDaqabBprOzHJ5mJurlVXP3wYvWMCaeOYg+ER0yp3/5i6gnUEk9FblCuS7eIDacXePj/uZoVb9wB3YgvS0mbVcEaHS/U17s7Hnchb0T4jEQyh2iX1ovNTmGrEW47H7eKF62T2lV/2z7Tj6E62h+ux8xxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787016762; c=relaxed/simple;
	bh=2vWFEBHibTOxT3/r4CeW986tfa1DjxpVITmuF1N60BE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gVFwMCmI2XTdKDuURJxITp29MlWBHxBxOf3/97JgljIVcu2Dn0P/vDcfERdKkLoISz6ZJusoZVK+WVXBrmGldB8ebQX+nACzgN6VFKadmkVy5pFhr5vboYI8qJxpagu/r8i10x24ofs/ACHrL6V9OEeTVC4Gt6WhRJ79V+I3hGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FV/5shOG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FV/5shOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787016760; x=1818552760;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2vWFEBHibTOxT3/r4CeW986tfa1DjxpVITmuF1N60BE=;
  b=FV/5shOG5C/5T5HS9JNmqYfQ7TGmwJo7dUc40pcolgxq4kMA7mMBZqLw
   9yCP3AzyLf40Lhovj+wtG+Z5lde1Dr2DgtOyIqR0hS7AHUjMaQqWy7MYf
   w5gQ+QQlVwLAIolm7UZVOqIC6h1doB3iIaXqESfI14C4hpnmf+eb5ZguC
   0Dxg8IpG9eo0S+Swle4MlGnVXVQwdElvk2jgH0WoSY7SMz1z6abRrUZo0
   W/jU+BgeujFRDE60RbqSl6hFwjWlNHvneJx4X571mHOdhWFV9FIv6+al7
   q209hE97mSZTRY9nPCXOJt3HmcoaU3M7l/5vA8l13KkKCyOv7VY/If77a
   g==;
X-CSE-ConnectionGUID: PJwvlEdyTKaocgrHSV2+XQ==
X-CSE-MsgGUID: TNY7rwCRTMmw36UQIYNWNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="113040632"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="113040632"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 18:32:37 -0700
X-CSE-ConnectionGUID: HNQb535pQWGteCmQjaq2Zw==
X-CSE-MsgGUID: husMGr+6TJmqUy1QNhz1TQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Aug 2026 18:32:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww8gq-00000000e0k-2r8Z;
	Tue, 18 Aug 2026 01:32:32 +0000
Date: Tue, 18 Aug 2026 09:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 171/217] drivers/mfd/tc3589x.c:351:37:
 warning: unused variable 'id'
Message-ID: <202608180816.NQy2zxZG-lkp@intel.com>
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
commit: 9220687cca8bad538843ff5a1a062b10e008e238 [171/217] mfd: tc3589x: re=
move pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/2026081=
8/202608180816.NQy2zxZG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260818/202608180816.NQy2zxZG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608180816.NQy2zxZG-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/tc3589x.c: In function 'tc3589x_of_probe':
   drivers/mfd/tc3589x.c:335:24: error: returning 'void *' from a function =
with return type 'int' makes integer from pointer without a cast [-Wint-con=
version]
     335 |                 return ERR_PTR(-ENODEV);
         |                        ^~~~~~~~~~~~~~~~
   drivers/mfd/tc3589x.c: In function 'tc3589x_probe':
>> drivers/mfd/tc3589x.c:351:37: warning: unused variable 'id' [-Wunused-va=
riable]
     351 |         const struct i2c_device_id *id =3D i2c_client_get_device=
_id(i2c);
         |                                     ^~


vim +/id +351 drivers/mfd/tc3589x.c

a435ae1d51e2f18 drivers/mfd/tc3589x.c Lee Jones        2012-09-07  348 =20
d28fa288ea50681 drivers/mfd/tc3589x.c Uwe Kleine-K=C3=B6nig 2022-11-18  349=
  static int tc3589x_probe(struct i2c_client *i2c)
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  350  {
d28fa288ea50681 drivers/mfd/tc3589x.c Uwe Kleine-K=C3=B6nig 2022-11-18 @351=
  	const struct i2c_device_id *id =3D i2c_client_get_device_id(i2c);
a435ae1d51e2f18 drivers/mfd/tc3589x.c Lee Jones        2012-09-07  352  	st=
ruct device_node *np =3D i2c->dev.of_node;
20406ebff4a298e drivers/mfd/tc3589x.c Sundar Iyer      2010-12-13  353  	st=
ruct tc3589x *tc3589x;
a381b13e2aa0641 drivers/mfd/tc3589x.c Linus Walleij    2014-01-23  354  	en=
um tc3589x_version version;
9220687cca8bad5 drivers/mfd/tc3589x.c Arnd Bergmann    2026-08-07  355  	un=
signed int block;
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  356  	in=
t ret;
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  357 =20
9220687cca8bad5 drivers/mfd/tc3589x.c Arnd Bergmann    2026-08-07  358  	re=
t =3D tc3589x_of_probe(&i2c->dev, &version, &block);
9220687cca8bad5 drivers/mfd/tc3589x.c Arnd Bergmann    2026-08-07  359  	if=
 (ret)
9220687cca8bad5 drivers/mfd/tc3589x.c Arnd Bergmann    2026-08-07  360  		r=
eturn ret;
a435ae1d51e2f18 drivers/mfd/tc3589x.c Lee Jones        2012-09-07  361 =20
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  362  	if=
 (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  363  			=
	     | I2C_FUNC_SMBUS_I2C_BLOCK))
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  364  		r=
eturn -EIO;
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  365 =20
1383e00f79a7bd6 drivers/mfd/tc3589x.c Jingoo Han       2013-02-20  366  	tc=
3589x =3D devm_kzalloc(&i2c->dev, sizeof(struct tc3589x),
1383e00f79a7bd6 drivers/mfd/tc3589x.c Jingoo Han       2013-02-20  367  			=
	GFP_KERNEL);
20406ebff4a298e drivers/mfd/tc3589x.c Sundar Iyer      2010-12-13  368  	if=
 (!tc3589x)
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  369  		r=
eturn -ENOMEM;
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  370 =20
20406ebff4a298e drivers/mfd/tc3589x.c Sundar Iyer      2010-12-13  371  	mu=
tex_init(&tc3589x->lock);
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  372 =20
20406ebff4a298e drivers/mfd/tc3589x.c Sundar Iyer      2010-12-13  373  	tc=
3589x->dev =3D &i2c->dev;
20406ebff4a298e drivers/mfd/tc3589x.c Sundar Iyer      2010-12-13  374  	tc=
3589x->i2c =3D i2c;
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  375 =20
a381b13e2aa0641 drivers/mfd/tc3589x.c Linus Walleij    2014-01-23  376  	sw=
itch (version) {
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  377  	ca=
se TC3589X_TC35893:
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  378  	ca=
se TC3589X_TC35895:
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  379  	ca=
se TC3589X_TC35896:
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  380  		t=
c3589x->num_gpio =3D 20;
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  381  		b=
reak;
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  382  	ca=
se TC3589X_TC35890:
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  383  	ca=
se TC3589X_TC35892:
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  384  	ca=
se TC3589X_TC35894:
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  385  	ca=
se TC3589X_UNKNOWN:
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  386  	de=
fault:
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  387  		t=
c3589x->num_gpio =3D 24;
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  388  		b=
reak;
e64c1eb47352d62 drivers/mfd/tc3589x.c Linus Walleij    2013-10-18  389  	}
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  390 =20
20406ebff4a298e drivers/mfd/tc3589x.c Sundar Iyer      2010-12-13  391  	i2=
c_set_clientdata(i2c, tc3589x);
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  392 =20
20406ebff4a298e drivers/mfd/tc3589x.c Sundar Iyer      2010-12-13  393  	re=
t =3D tc3589x_chip_init(tc3589x);
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  394  	if=
 (ret)
1383e00f79a7bd6 drivers/mfd/tc3589x.c Jingoo Han       2013-02-20  395  		r=
eturn ret;
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  396 =20
a435ae1d51e2f18 drivers/mfd/tc3589x.c Lee Jones        2012-09-07  397  	re=
t =3D tc3589x_irq_init(tc3589x, np);
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  398  	if=
 (ret)
1383e00f79a7bd6 drivers/mfd/tc3589x.c Jingoo Han       2013-02-20  399  		r=
eturn ret;
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  400 =20
20406ebff4a298e drivers/mfd/tc3589x.c Sundar Iyer      2010-12-13  401  	re=
t =3D request_threaded_irq(tc3589x->i2c->irq, NULL, tc3589x_irq,
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  402  			=
	   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
20406ebff4a298e drivers/mfd/tc3589x.c Sundar Iyer      2010-12-13  403  			=
	   "tc3589x", tc3589x);
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  404  	if=
 (ret) {
20406ebff4a298e drivers/mfd/tc3589x.c Sundar Iyer      2010-12-13  405  		d=
ev_err(tc3589x->dev, "failed to request IRQ: %d\n", ret);
1383e00f79a7bd6 drivers/mfd/tc3589x.c Jingoo Han       2013-02-20  406  		r=
eturn ret;
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  407  	}
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  408 =20
9220687cca8bad5 drivers/mfd/tc3589x.c Arnd Bergmann    2026-08-07  409  	re=
t =3D tc3589x_device_init(tc3589x, block);
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  410  	if=
 (ret) {
611b7590afa6e6c drivers/mfd/tc3589x.c Sundar Iyer      2010-12-13  411  		d=
ev_err(tc3589x->dev, "failed to add child devices\n");
1383e00f79a7bd6 drivers/mfd/tc3589x.c Jingoo Han       2013-02-20  412  		r=
eturn ret;
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  413  	}
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  414 =20
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  415  	re=
turn 0;
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  416  }
b4ecd326b789f10 drivers/mfd/tc35892.c Rabin Vincent    2010-05-10  417 =20

:::::: The code at line 351 was first introduced by commit
:::::: d28fa288ea506812ef73980b8c3dc9c39ec8c18b mfd: tc3589x: Convert to i2=
c's .probe_new()

:::::: TO: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
:::::: CC: Lee Jones <lee@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
