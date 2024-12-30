Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847D11A7AD0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 12:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735560712; cv=none; b=k9otRBR+eHjvnzTRuyZPwb/rmu+VE1ugr180JlDdSOZancsqvWAa8KOQ4x6bigwQ04VrGVbSEgH1LVL2v3fPiiaZ43Nx1I4vTYPwbKFzS1cJ3OJSZyrVHauzJ2O5De7LSY6wzNtXXdto41BlZuxF32XLeYT3DYeGoN2gOcfeG+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735560712; c=relaxed/simple;
	bh=SFI19Ig7hJFphoEJoNfGYgxG5tyVCAw+HQpi0PRA1l4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J6hQGBG/Csr7f9B20GrMCI2yQ2nm0Pym/0ORpFB+tTl2KqiKWZ9VzEzM3i7uaQhv9n9vfZ6SJcHg9tzl/D3AnI6ygtdcUacNEc2+QDNvPfUS43sG0gMgpT/Vt9TVI06iIQcEbf9btigizAsWi/BiQYzoKNBCjvgjT+qeebR5yuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vf83MZet; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vf83MZet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735560711; x=1767096711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SFI19Ig7hJFphoEJoNfGYgxG5tyVCAw+HQpi0PRA1l4=;
  b=Vf83MZetcz1U9noVyY5eJPD7CIzZ0lxMzRHXU6eSCPMaFQt+eDo0EV8O
   Wo0FLI4PL7xQ4ibNZZHPX3Ee3gwlZewqDIY5m9df9EgJYBHdyZy+QoTZJ
   78ScNmUH7WBI4Z0WlxDRci2yQ5U8r1+mi9pN8zWP5RecS/sDJtApYrhVT
   gi+lmUpsM1KsTBEHbsvs4WcL9ZXf8LGB7OPhVTiPd9jQWro5nqHbW+l9t
   a84T1A27OIoN4oqyoSaI6+/I5NCfS7CcbOB2v5cS8h8F4RSCmyRqQoZJp
   pBQETGVSI2Lzemc5veDGzsBbIr93SfcK0Kt27TKY26EPUvy6e5DFQZazn
   A==;
X-CSE-ConnectionGUID: 3LPVkaGiQ+um5DcoqJW3Qg==
X-CSE-MsgGUID: CEKDJ6o/RHm03IfmDaoLtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39778184"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="39778184"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 04:11:40 -0800
X-CSE-ConnectionGUID: GBKBk5ceSiqwenQismOHIQ==
X-CSE-MsgGUID: P01lLhiBQrWN47ANnrwBgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="100961822"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Dec 2024 04:11:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSEcP-0005h2-1H;
	Mon, 30 Dec 2024 12:11:33 +0000
Date: Mon, 30 Dec 2024 20:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>
Subject: drivers/leds/leds-pca955x.c:590:43: warning: '%d' directive output
 may be truncated writing between 1 and 11 bytes into a region of size 8
Message-ID: <202412302009.bOsuLnkW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eddie,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc033cf25e612e840e545f8d5ad2edd6ba613ed5
commit: 7c4815929276b2e223eb6f2e49afe5071d4294a5 leds: pca955x: Let the core process the fwnode
date:   3 years, 4 months ago
config: sparc-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241230/202412302009.bOsuLnkW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412302009.bOsuLnkW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412302009.bOsuLnkW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-pca955x.c: In function 'pca955x_probe':
>> drivers/leds/leds-pca955x.c:590:43: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
     590 |                                          "%d", i);
         |                                           ^~
   drivers/leds/leds-pca955x.c:590:42: note: directive argument in the range [-2147483644, 2147483646]
     590 |                                          "%d", i);
         |                                          ^~~~
   drivers/leds/leds-pca955x.c:589:33: note: 'snprintf' output between 2 and 12 bytes into a destination of size 8
     589 |                                 snprintf(default_label, sizeof(default_label),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     590 |                                          "%d", i);
         |                                          ~~~~~~~~


vim +590 drivers/leds/leds-pca955x.c

   481	
   482	static int pca955x_probe(struct i2c_client *client,
   483				 const struct i2c_device_id *id)
   484	{
   485		struct pca955x *pca955x;
   486		struct pca955x_led *pca955x_led;
   487		struct pca955x_chipdef *chip;
   488		struct led_classdev *led;
   489		struct led_init_data init_data;
   490		struct i2c_adapter *adapter;
   491		int i, err;
   492		struct pca955x_platform_data *pdata;
   493		int ngpios = 0;
   494		bool set_default_label = false;
   495		bool keep_pwm = false;
   496		char default_label[8];
   497	
   498		chip = &pca955x_chipdefs[id->driver_data];
   499		adapter = client->adapter;
   500		pdata = dev_get_platdata(&client->dev);
   501		if (!pdata) {
   502			pdata =	pca955x_get_pdata(client, chip);
   503			if (IS_ERR(pdata))
   504				return PTR_ERR(pdata);
   505		}
   506	
   507		/* Make sure the slave address / chip type combo given is possible */
   508		if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
   509		    chip->slv_addr) {
   510			dev_err(&client->dev, "invalid slave address %02x\n",
   511				client->addr);
   512			return -ENODEV;
   513		}
   514	
   515		dev_info(&client->dev, "leds-pca955x: Using %s %d-bit LED driver at "
   516			 "slave address 0x%02x\n", client->name, chip->bits,
   517			 client->addr);
   518	
   519		if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
   520			return -EIO;
   521	
   522		if (pdata->num_leds != chip->bits) {
   523			dev_err(&client->dev,
   524				"board info claims %d LEDs on a %d-bit chip\n",
   525				pdata->num_leds, chip->bits);
   526			return -ENODEV;
   527		}
   528	
   529		pca955x = devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_KERNEL);
   530		if (!pca955x)
   531			return -ENOMEM;
   532	
   533		pca955x->leds = devm_kcalloc(&client->dev, chip->bits,
   534					     sizeof(*pca955x_led), GFP_KERNEL);
   535		if (!pca955x->leds)
   536			return -ENOMEM;
   537	
   538		i2c_set_clientdata(client, pca955x);
   539	
   540		mutex_init(&pca955x->lock);
   541		pca955x->client = client;
   542		pca955x->chipdef = chip;
   543	
   544		init_data.devname_mandatory = false;
   545		init_data.devicename = "pca955x";
   546	
   547		for (i = 0; i < chip->bits; i++) {
   548			pca955x_led = &pca955x->leds[i];
   549			pca955x_led->led_num = i;
   550			pca955x_led->pca955x = pca955x;
   551			pca955x_led->type = pdata->leds[i].type;
   552	
   553			switch (pca955x_led->type) {
   554			case PCA955X_TYPE_NONE:
   555				break;
   556			case PCA955X_TYPE_GPIO:
   557				ngpios++;
   558				break;
   559			case PCA955X_TYPE_LED:
   560				led = &pca955x_led->led_cdev;
   561				led->brightness_set_blocking = pca955x_led_set;
   562				led->brightness_get = pca955x_led_get;
   563	
   564				if (pdata->leds[i].default_state ==
   565				    LEDS_GPIO_DEFSTATE_OFF) {
   566					err = pca955x_led_set(led, LED_OFF);
   567					if (err)
   568						return err;
   569				} else if (pdata->leds[i].default_state ==
   570					   LEDS_GPIO_DEFSTATE_ON) {
   571					err = pca955x_led_set(led, LED_FULL);
   572					if (err)
   573						return err;
   574				}
   575	
   576				init_data.fwnode = pdata->leds[i].fwnode;
   577	
   578				if (is_of_node(init_data.fwnode)) {
   579					if (to_of_node(init_data.fwnode)->name[0] ==
   580					    '\0')
   581						set_default_label = true;
   582					else
   583						set_default_label = false;
   584				} else {
   585					set_default_label = true;
   586				}
   587	
   588				if (set_default_label) {
   589					snprintf(default_label, sizeof(default_label),
 > 590						 "%d", i);
   591					init_data.default_label = default_label;
   592				} else {
   593					init_data.default_label = NULL;
   594				}
   595	
   596				err = devm_led_classdev_register_ext(&client->dev, led,
   597								     &init_data);
   598				if (err)
   599					return err;
   600	
   601				/*
   602				 * For default-state == "keep", let the core update the
   603				 * brightness from the hardware, then check the
   604				 * brightness to see if it's using PWM1. If so, PWM1
   605				 * should not be written below.
   606				 */
   607				if (pdata->leds[i].default_state ==
   608				    LEDS_GPIO_DEFSTATE_KEEP) {
   609					if (led->brightness != LED_FULL &&
   610					    led->brightness != LED_OFF &&
   611					    led->brightness != LED_HALF)
   612						keep_pwm = true;
   613				}
   614			}
   615		}
   616	
   617		/* PWM0 is used for half brightness or 50% duty cycle */
   618		err = pca955x_write_pwm(client, 0, 255 - LED_HALF);
   619		if (err)
   620			return err;
   621	
   622		if (!keep_pwm) {
   623			/* PWM1 is used for variable brightness, default to OFF */
   624			err = pca955x_write_pwm(client, 1, 0);
   625			if (err)
   626				return err;
   627		}
   628	
   629		/* Set to fast frequency so we do not see flashing */
   630		err = pca955x_write_psc(client, 0, 0);
   631		if (err)
   632			return err;
   633		err = pca955x_write_psc(client, 1, 0);
   634		if (err)
   635			return err;
   636	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
