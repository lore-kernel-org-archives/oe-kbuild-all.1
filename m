Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707A9282F01
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 13:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781358378; cv=none; b=bCbfbFQMlyCKctKuaQ5WsiQgediderMY5y0uh7W6x7NQmQYvL4k2lof3FRKDG8WjJpw76D4ybHeqHlI3abmp54k7TfKgE3CQx+TYTEkasm+QuMSdlFV38g9dP12kJYeXUZTIIiykDWxQhRCl0jVVJ4MbCrHd13q0s+4Q1kMmA0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781358378; c=relaxed/simple;
	bh=vmjcOJjghaFRF7xwKn7avCX5EecRkn2XSRUo2Gb8i2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Uy4MsMBPwmczQRmtihTNdYYaHhmmXRGOx81kjWikLoFPLGVcwOqI9glOl0h5vBsbum4lq5Nv/O1PG29ORdban9O3RxGF8idNfD958ho/ezMcWctexG+dAoLr9mRAliGADAmgUcI7WFcGyVWNXsihtdiz1D8fMROc+5zFeGQef04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XC23i7m7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XC23i7m7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781358377; x=1812894377;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vmjcOJjghaFRF7xwKn7avCX5EecRkn2XSRUo2Gb8i2E=;
  b=XC23i7m7eB/c59tGVLg8JOvvLyll2z6MLE93DHOtmBQqPD0xrnfUQA8j
   Vk5xy4sqXHQlQQ7RGL7BLRhe4BORyf2JLjAMWFwUvRu575jzfxfAhNq9j
   Yf7CKGXzIA0tI5sY35IO/Ne99AZJLJxXXdx1jndSrq9l6nAJaxZBHb6TN
   VBLVB4E2XSjQMl0uKYjrlXd4NjwWJ9p0WGcCvI2FwK/W8Mokmg4di2zsL
   0ja3jgyEo9PlXhOSnqScxXiJz7O59IUVrO1gCigvU0namsmG8tFE1+mAx
   n3KWDG04PbgO0QrXCG3BpCF9S4TV4Qpdxx9e4A4rkGLsXAXeK1aGBJMwy
   w==;
X-CSE-ConnectionGUID: 5cUsuUw7Sci1jbCrylMX2w==
X-CSE-MsgGUID: zQ1sFbJ8R0GZhqz73olXKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="92490270"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="92490270"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 06:46:16 -0700
X-CSE-ConnectionGUID: UV354w8FQbyUAIdcObqu4A==
X-CSE-MsgGUID: 77iKwjs3RS2rKiF6rzDTcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="251339847"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jun 2026 06:46:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYOgd-00000000Px4-255l;
	Sat, 13 Jun 2026 13:46:11 +0000
Date: Sat, 13 Jun 2026 21:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:config-gpio-legacy-7.2 21/21]
 drivers/input/touchscreen/hycon-hy46xx.c:531:17: warning: format '%d' expects
 argument of type 'int', but argument 5 has type 'const char *'
Message-ID: <202606132131.UMaE1Bs2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 config-gpio-legacy-7.2
head:   24fae1df029804f4339484870fcdc70fe15fab97
commit: 24fae1df029804f4339484870fcdc70fe15fab97 [21/21] gpiolib: introduce=
 gpio_name() helper
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260613/2=
02606132131.UMaE1Bs2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260613/202606132131.UMaE1Bs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606132131.UMaE1Bs2-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/input/touchscreen/hycon-hy46xx.c:8:
   include/linux/gpio/consumer.h: In function 'gpiod_name':
   include/linux/gpio/consumer.h:177:27: error: invalid use of undefined ty=
pe 'const struct gpio_desc'
     177 |         return desc ? desc->name : "(no gpio)";
         |                           ^~
   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12,
                    from drivers/input/touchscreen/hycon-hy46xx.c:7:
   drivers/input/touchscreen/hycon-hy46xx.c: In function 'hycon_hy46xx_prob=
e':
>> drivers/input/touchscreen/hycon-hy46xx.c:531:17: warning: format '%d' ex=
pects argument of type 'int', but argument 5 has type 'const char *' [-Wfor=
mat=3D]
     531 |                 "HYCON HY46XX initialized: IRQ %d, Reset pin %d.=
\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dy=
namic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynam=
ic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, #=
#__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynam=
ic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_d=
ev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/input/touchscreen/hycon-hy46xx.c:530:9: note: in expansion of ma=
cro 'dev_dbg'
     530 |         dev_dbg(&client->dev,
         |         ^~~~~~~
   drivers/input/touchscreen/hycon-hy46xx.c:531:63: note: format string is =
defined here
     531 |                 "HYCON HY46XX initialized: IRQ %d, Reset pin %d.=
\n",
         |                                                              ~^
         |                                                               |
         |                                                               int
         |                                                              %s


vim +531 drivers/input/touchscreen/hycon-hy46xx.c

aa2f62cf211a098 Giulio Benetti   2021-04-13  429 =20
cb812d3985d2d1c Uwe Kleine-K=C3=B6nig 2022-11-18  430  static int hycon_hy4=
6xx_probe(struct i2c_client *client)
aa2f62cf211a098 Giulio Benetti   2021-04-13  431  {
aa2f62cf211a098 Giulio Benetti   2021-04-13  432  	struct hycon_hy46xx_data=
 *tsdata;
aa2f62cf211a098 Giulio Benetti   2021-04-13  433  	struct input_dev *input;
aa2f62cf211a098 Giulio Benetti   2021-04-13  434  	int error;
aa2f62cf211a098 Giulio Benetti   2021-04-13  435 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  436  	dev_dbg(&client->dev, "p=
robing for HYCON HY46XX I2C\n");
aa2f62cf211a098 Giulio Benetti   2021-04-13  437 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  438  	tsdata =3D devm_kzalloc(=
&client->dev, sizeof(*tsdata), GFP_KERNEL);
aa2f62cf211a098 Giulio Benetti   2021-04-13  439  	if (!tsdata)
aa2f62cf211a098 Giulio Benetti   2021-04-13  440  		return -ENOMEM;
aa2f62cf211a098 Giulio Benetti   2021-04-13  441 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  442  	tsdata->vcc =3D devm_reg=
ulator_get(&client->dev, "vcc");
aa2f62cf211a098 Giulio Benetti   2021-04-13  443  	if (IS_ERR(tsdata->vcc))=
 {
aa2f62cf211a098 Giulio Benetti   2021-04-13  444  		error =3D PTR_ERR(tsdat=
a->vcc);
aa2f62cf211a098 Giulio Benetti   2021-04-13  445  		if (error !=3D -EPROBE_=
DEFER)
aa2f62cf211a098 Giulio Benetti   2021-04-13  446  			dev_err(&client->dev,
aa2f62cf211a098 Giulio Benetti   2021-04-13  447  				"failed to request re=
gulator: %d\n", error);
aa2f62cf211a098 Giulio Benetti   2021-04-13  448  		return error;
aa2f62cf211a098 Giulio Benetti   2021-04-13  449  	}
aa2f62cf211a098 Giulio Benetti   2021-04-13  450 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  451  	error =3D regulator_enab=
le(tsdata->vcc);
aa2f62cf211a098 Giulio Benetti   2021-04-13  452  	if (error < 0) {
aa2f62cf211a098 Giulio Benetti   2021-04-13  453  		dev_err(&client->dev, "=
failed to enable vcc: %d\n", error);
aa2f62cf211a098 Giulio Benetti   2021-04-13  454  		return error;
aa2f62cf211a098 Giulio Benetti   2021-04-13  455  	}
aa2f62cf211a098 Giulio Benetti   2021-04-13  456 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  457  	error =3D devm_add_actio=
n_or_reset(&client->dev,
aa2f62cf211a098 Giulio Benetti   2021-04-13  458  					 hycon_hy46xx_disabl=
e_regulator,
aa2f62cf211a098 Giulio Benetti   2021-04-13  459  					 tsdata);
aa2f62cf211a098 Giulio Benetti   2021-04-13  460  	if (error)
aa2f62cf211a098 Giulio Benetti   2021-04-13  461  		return error;
aa2f62cf211a098 Giulio Benetti   2021-04-13  462 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  463  	tsdata->reset_gpio =3D d=
evm_gpiod_get_optional(&client->dev,
aa2f62cf211a098 Giulio Benetti   2021-04-13  464  						     "reset", GPIOD=
_OUT_LOW);
aa2f62cf211a098 Giulio Benetti   2021-04-13  465  	if (IS_ERR(tsdata->reset=
_gpio)) {
aa2f62cf211a098 Giulio Benetti   2021-04-13  466  		error =3D PTR_ERR(tsdat=
a->reset_gpio);
aa2f62cf211a098 Giulio Benetti   2021-04-13  467  		dev_err(&client->dev,
aa2f62cf211a098 Giulio Benetti   2021-04-13  468  			"Failed to request GPI=
O reset pin, error %d\n", error);
aa2f62cf211a098 Giulio Benetti   2021-04-13  469  		return error;
aa2f62cf211a098 Giulio Benetti   2021-04-13  470  	}
aa2f62cf211a098 Giulio Benetti   2021-04-13  471 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  472  	if (tsdata->reset_gpio) {
aa2f62cf211a098 Giulio Benetti   2021-04-13  473  		usleep_range(5000, 6000=
);
aa2f62cf211a098 Giulio Benetti   2021-04-13  474  		gpiod_set_value_canslee=
p(tsdata->reset_gpio, 1);
aa2f62cf211a098 Giulio Benetti   2021-04-13  475  		usleep_range(5000, 6000=
);
aa2f62cf211a098 Giulio Benetti   2021-04-13  476  		gpiod_set_value_canslee=
p(tsdata->reset_gpio, 0);
aa2f62cf211a098 Giulio Benetti   2021-04-13  477  		msleep(1000);
aa2f62cf211a098 Giulio Benetti   2021-04-13  478  	}
aa2f62cf211a098 Giulio Benetti   2021-04-13  479 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  480  	input =3D devm_input_all=
ocate_device(&client->dev);
aa2f62cf211a098 Giulio Benetti   2021-04-13  481  	if (!input) {
aa2f62cf211a098 Giulio Benetti   2021-04-13  482  		dev_err(&client->dev, "=
failed to allocate input device.\n");
aa2f62cf211a098 Giulio Benetti   2021-04-13  483  		return -ENOMEM;
aa2f62cf211a098 Giulio Benetti   2021-04-13  484  	}
aa2f62cf211a098 Giulio Benetti   2021-04-13  485 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  486  	mutex_init(&tsdata->mute=
x);
aa2f62cf211a098 Giulio Benetti   2021-04-13  487  	tsdata->client =3D clien=
t;
aa2f62cf211a098 Giulio Benetti   2021-04-13  488  	tsdata->input =3D input;
aa2f62cf211a098 Giulio Benetti   2021-04-13  489 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  490  	tsdata->regmap =3D devm_=
regmap_init_i2c(client,
aa2f62cf211a098 Giulio Benetti   2021-04-13  491  					      &hycon_hy46xx_=
i2c_regmap_config);
aa2f62cf211a098 Giulio Benetti   2021-04-13  492  	if (IS_ERR(tsdata->regma=
p)) {
aa2f62cf211a098 Giulio Benetti   2021-04-13  493  		dev_err(&client->dev, "=
regmap allocation failed\n");
aa2f62cf211a098 Giulio Benetti   2021-04-13  494  		return PTR_ERR(tsdata->=
regmap);
aa2f62cf211a098 Giulio Benetti   2021-04-13  495  	}
aa2f62cf211a098 Giulio Benetti   2021-04-13  496 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  497  	hycon_hy46xx_get_default=
s(&client->dev, tsdata);
aa2f62cf211a098 Giulio Benetti   2021-04-13  498  	hycon_hy46xx_get_paramet=
ers(tsdata);
aa2f62cf211a098 Giulio Benetti   2021-04-13  499 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  500  	input->name =3D "Hycon C=
apacitive Touch";
aa2f62cf211a098 Giulio Benetti   2021-04-13  501  	input->id.bustype =3D BU=
S_I2C;
aa2f62cf211a098 Giulio Benetti   2021-04-13  502  	input->dev.parent =3D &c=
lient->dev;
aa2f62cf211a098 Giulio Benetti   2021-04-13  503 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  504  	input_set_abs_params(inp=
ut, ABS_MT_POSITION_X, 0, -1, 0, 0);
aa2f62cf211a098 Giulio Benetti   2021-04-13  505  	input_set_abs_params(inp=
ut, ABS_MT_POSITION_Y, 0, -1, 0, 0);
aa2f62cf211a098 Giulio Benetti   2021-04-13  506 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  507  	touchscreen_parse_proper=
ties(input, true, &tsdata->prop);
aa2f62cf211a098 Giulio Benetti   2021-04-13  508 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  509  	error =3D input_mt_init_=
slots(input, HY46XX_MAX_SUPPORTED_POINTS,
aa2f62cf211a098 Giulio Benetti   2021-04-13  510  				    INPUT_MT_DIRECT);
aa2f62cf211a098 Giulio Benetti   2021-04-13  511  	if (error) {
aa2f62cf211a098 Giulio Benetti   2021-04-13  512  		dev_err(&client->dev, "=
Unable to init MT slots.\n");
aa2f62cf211a098 Giulio Benetti   2021-04-13  513  		return error;
aa2f62cf211a098 Giulio Benetti   2021-04-13  514  	}
aa2f62cf211a098 Giulio Benetti   2021-04-13  515 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  516  	i2c_set_clientdata(clien=
t, tsdata);
aa2f62cf211a098 Giulio Benetti   2021-04-13  517 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  518  	error =3D devm_request_t=
hreaded_irq(&client->dev, client->irq,
aa2f62cf211a098 Giulio Benetti   2021-04-13  519  					  NULL, hycon_hy46xx=
_isr, IRQF_ONESHOT,
aa2f62cf211a098 Giulio Benetti   2021-04-13  520  					  client->name, tsda=
ta);
aa2f62cf211a098 Giulio Benetti   2021-04-13  521  	if (error) {
aa2f62cf211a098 Giulio Benetti   2021-04-13  522  		dev_err(&client->dev, "=
Unable to request touchscreen IRQ.\n");
aa2f62cf211a098 Giulio Benetti   2021-04-13  523  		return error;
aa2f62cf211a098 Giulio Benetti   2021-04-13  524  	}
aa2f62cf211a098 Giulio Benetti   2021-04-13  525 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  526  	error =3D input_register=
_device(input);
aa2f62cf211a098 Giulio Benetti   2021-04-13  527  	if (error)
aa2f62cf211a098 Giulio Benetti   2021-04-13  528  		return error;
aa2f62cf211a098 Giulio Benetti   2021-04-13  529 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  530  	dev_dbg(&client->dev,
aa2f62cf211a098 Giulio Benetti   2021-04-13 @531  		"HYCON HY46XX initializ=
ed: IRQ %d, Reset pin %d.\n",
24fae1df029804f Arnd Bergmann    2026-06-12  532  		client->irq, gpiod_name=
(tsdata->reset_gpio));
aa2f62cf211a098 Giulio Benetti   2021-04-13  533 =20
aa2f62cf211a098 Giulio Benetti   2021-04-13  534  	return 0;
aa2f62cf211a098 Giulio Benetti   2021-04-13  535  }
aa2f62cf211a098 Giulio Benetti   2021-04-13  536 =20

:::::: The code at line 531 was first introduced by commit
:::::: aa2f62cf211a0985c14fd78a17d55296769698d6 Input: add driver for the H=
ycon HY46XX touchpanel series

:::::: TO: Giulio Benetti <giulio.benetti@benettiengineering.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
