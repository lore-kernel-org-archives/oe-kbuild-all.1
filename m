Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C9E7F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 05:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676008049; x=1707544049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E9qDDgqpe//AEtH5VmLM1872D3EchSVXV4Qj3LAOSOM=;
  b=FGQ7UB5Hq6KjhxW7KyFueM0345i78qRyQBXwn0sVyXQdX25Oh2MKiJ8s
   pz7xnLOuR3XsDZQgLnX5frxs9pWUdEYWWezYwZRDL2YGrY7AiqTRTxogN
   QjDZrcQ2XHGWkbaNrYiEHJVS2K5nOpmzLmdFy4toPV4HKgtQGaqKveZ0K
   9X+Vdi8578DhONcbYTIEllOLEH/MW5huHHynQvlOy7Hacjhd1OFm6way/
   FQfWMgclbarzGeDe8ej0LoZSaTMBv8j7JvzmZqZSUHf1GVBvdOcghC81P
   ZsY56HOnloLQJMonPGrvrcWw6gxaraLEttgSA8hPqapA6nxNpOVHLzetk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="416569949"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="416569949"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 21:47:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="731616315"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="731616315"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Feb 2023 21:47:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQMFo-0005az-2U;
	Fri, 10 Feb 2023 05:47:24 +0000
Date: Fri, 10 Feb 2023 13:47:05 +0800
From: kernel test robot <lkp@intel.com>
To: Weidong Wang <wangweidong.a@awinic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>, Nick Li <liweilei@awinic.com>,
	Bruce zhao <zhaolei@awinic.com>
Subject: [linux-next:master 8036/12152]
 sound/soc/codecs/aw88395/aw88395.c:458:17: error: implicit declaration of
 function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'?
Message-ID: <202302101357.h7O5lFaP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weidong,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20f513df926fac0594a3b65f79d856bd64251861
commit: 14bd857286115bab1e7860ab6e30016b0cae8233 [8036/12152] ASoC: codecs: Aw88395 chip register file, data type file and Kconfig Makefile
config: nios2-randconfig-r026-20230210 (https://download.01.org/0day-ci/archive/20230210/202302101357.h7O5lFaP-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=14bd857286115bab1e7860ab6e30016b0cae8233
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 14bd857286115bab1e7860ab6e30016b0cae8233
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101357.h7O5lFaP-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/aw88395/aw88395.c: In function 'aw88395_hw_reset':
>> sound/soc/codecs/aw88395/aw88395.c:458:17: error: implicit declaration of function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
     458 |                 gpiod_set_value_cansleep(aw88395->reset_gpio, 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 gpio_set_value_cansleep
   sound/soc/codecs/aw88395/aw88395.c: In function 'aw88395_i2c_probe':
>> sound/soc/codecs/aw88395/aw88395.c:527:31: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
     527 |         aw88395->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
         |                               devm_regulator_get_optional
>> sound/soc/codecs/aw88395/aw88395.c:527:75: error: 'GPIOD_OUT_LOW' undeclared (first use in this function); did you mean 'GPIOF_INIT_LOW'?
     527 |         aw88395->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
         |                                                                           ^~~~~~~~~~~~~
         |                                                                           GPIOF_INIT_LOW
   sound/soc/codecs/aw88395/aw88395.c:527:75: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +458 sound/soc/codecs/aw88395/aw88395.c

62fc25fbab5f41 Weidong Wang 2023-01-13  454  
62fc25fbab5f41 Weidong Wang 2023-01-13  455  static void aw88395_hw_reset(struct aw88395 *aw88395)
62fc25fbab5f41 Weidong Wang 2023-01-13  456  {
62fc25fbab5f41 Weidong Wang 2023-01-13  457  	if (aw88395->reset_gpio) {
62fc25fbab5f41 Weidong Wang 2023-01-13 @458  		gpiod_set_value_cansleep(aw88395->reset_gpio, 0);
62fc25fbab5f41 Weidong Wang 2023-01-13  459  		usleep_range(AW88395_1000_US, AW88395_1000_US + 10);
62fc25fbab5f41 Weidong Wang 2023-01-13  460  		gpiod_set_value_cansleep(aw88395->reset_gpio, 1);
62fc25fbab5f41 Weidong Wang 2023-01-13  461  		usleep_range(AW88395_1000_US, AW88395_1000_US + 10);
62fc25fbab5f41 Weidong Wang 2023-01-13  462  	} else {
62fc25fbab5f41 Weidong Wang 2023-01-13  463  		dev_err(aw88395->aw_pa->dev, "%s failed", __func__);
62fc25fbab5f41 Weidong Wang 2023-01-13  464  	}
62fc25fbab5f41 Weidong Wang 2023-01-13  465  }
62fc25fbab5f41 Weidong Wang 2023-01-13  466  
62fc25fbab5f41 Weidong Wang 2023-01-13  467  static int aw88395_request_firmware_file(struct aw88395 *aw88395)
62fc25fbab5f41 Weidong Wang 2023-01-13  468  {
62fc25fbab5f41 Weidong Wang 2023-01-13  469  	const struct firmware *cont = NULL;
62fc25fbab5f41 Weidong Wang 2023-01-13  470  	int ret;
62fc25fbab5f41 Weidong Wang 2023-01-13  471  
62fc25fbab5f41 Weidong Wang 2023-01-13  472  	aw88395->aw_pa->fw_status = AW88395_DEV_FW_FAILED;
62fc25fbab5f41 Weidong Wang 2023-01-13  473  
62fc25fbab5f41 Weidong Wang 2023-01-13  474  	ret = request_firmware(&cont, AW88395_ACF_FILE, aw88395->aw_pa->dev);
62fc25fbab5f41 Weidong Wang 2023-01-13  475  	if ((ret < 0) || (!cont)) {
62fc25fbab5f41 Weidong Wang 2023-01-13  476  		dev_err(aw88395->aw_pa->dev, "load [%s] failed!", AW88395_ACF_FILE);
62fc25fbab5f41 Weidong Wang 2023-01-13  477  		return ret;
62fc25fbab5f41 Weidong Wang 2023-01-13  478  	}
62fc25fbab5f41 Weidong Wang 2023-01-13  479  
62fc25fbab5f41 Weidong Wang 2023-01-13  480  	dev_info(aw88395->aw_pa->dev, "loaded %s - size: %zu\n",
62fc25fbab5f41 Weidong Wang 2023-01-13  481  			AW88395_ACF_FILE, cont ? cont->size : 0);
62fc25fbab5f41 Weidong Wang 2023-01-13  482  
62fc25fbab5f41 Weidong Wang 2023-01-13  483  	aw88395->aw_cfg = devm_kzalloc(aw88395->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);
62fc25fbab5f41 Weidong Wang 2023-01-13  484  	if (!aw88395->aw_cfg) {
62fc25fbab5f41 Weidong Wang 2023-01-13  485  		release_firmware(cont);
62fc25fbab5f41 Weidong Wang 2023-01-13  486  		return -ENOMEM;
62fc25fbab5f41 Weidong Wang 2023-01-13  487  	}
62fc25fbab5f41 Weidong Wang 2023-01-13  488  	aw88395->aw_cfg->len = (int)cont->size;
62fc25fbab5f41 Weidong Wang 2023-01-13  489  	memcpy(aw88395->aw_cfg->data, cont->data, cont->size);
62fc25fbab5f41 Weidong Wang 2023-01-13  490  	release_firmware(cont);
62fc25fbab5f41 Weidong Wang 2023-01-13  491  
62fc25fbab5f41 Weidong Wang 2023-01-13  492  	ret = aw88395_dev_load_acf_check(aw88395->aw_pa, aw88395->aw_cfg);
62fc25fbab5f41 Weidong Wang 2023-01-13  493  	if (ret < 0) {
62fc25fbab5f41 Weidong Wang 2023-01-13  494  		dev_err(aw88395->aw_pa->dev, "Load [%s] failed ....!", AW88395_ACF_FILE);
62fc25fbab5f41 Weidong Wang 2023-01-13  495  		return ret;
62fc25fbab5f41 Weidong Wang 2023-01-13  496  	}
62fc25fbab5f41 Weidong Wang 2023-01-13  497  
62fc25fbab5f41 Weidong Wang 2023-01-13  498  	dev_dbg(aw88395->aw_pa->dev, "%s : bin load success\n", __func__);
62fc25fbab5f41 Weidong Wang 2023-01-13  499  
62fc25fbab5f41 Weidong Wang 2023-01-13  500  	mutex_lock(&aw88395->lock);
62fc25fbab5f41 Weidong Wang 2023-01-13  501  	/* aw device init */
62fc25fbab5f41 Weidong Wang 2023-01-13  502  	ret = aw88395_dev_init(aw88395->aw_pa, aw88395->aw_cfg);
62fc25fbab5f41 Weidong Wang 2023-01-13  503  	if (ret < 0)
62fc25fbab5f41 Weidong Wang 2023-01-13  504  		dev_err(aw88395->aw_pa->dev, "dev init failed");
62fc25fbab5f41 Weidong Wang 2023-01-13  505  	mutex_unlock(&aw88395->lock);
62fc25fbab5f41 Weidong Wang 2023-01-13  506  
62fc25fbab5f41 Weidong Wang 2023-01-13  507  	return ret;
62fc25fbab5f41 Weidong Wang 2023-01-13  508  }
62fc25fbab5f41 Weidong Wang 2023-01-13  509  
62fc25fbab5f41 Weidong Wang 2023-01-13  510  static int aw88395_i2c_probe(struct i2c_client *i2c)
62fc25fbab5f41 Weidong Wang 2023-01-13  511  {
62fc25fbab5f41 Weidong Wang 2023-01-13  512  	struct aw88395 *aw88395;
62fc25fbab5f41 Weidong Wang 2023-01-13  513  	int ret;
62fc25fbab5f41 Weidong Wang 2023-01-13  514  
62fc25fbab5f41 Weidong Wang 2023-01-13  515  	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
62fc25fbab5f41 Weidong Wang 2023-01-13  516  		dev_err(&i2c->dev, "check_functionality failed");
62fc25fbab5f41 Weidong Wang 2023-01-13  517  		return -EIO;
62fc25fbab5f41 Weidong Wang 2023-01-13  518  	}
62fc25fbab5f41 Weidong Wang 2023-01-13  519  
62fc25fbab5f41 Weidong Wang 2023-01-13  520  	aw88395 = aw88395_malloc_init(i2c);
62fc25fbab5f41 Weidong Wang 2023-01-13  521  	if (!aw88395) {
62fc25fbab5f41 Weidong Wang 2023-01-13  522  		dev_err(&i2c->dev, "malloc aw88395 failed");
62fc25fbab5f41 Weidong Wang 2023-01-13  523  		return -ENOMEM;
62fc25fbab5f41 Weidong Wang 2023-01-13  524  	}
62fc25fbab5f41 Weidong Wang 2023-01-13  525  	i2c_set_clientdata(i2c, aw88395);
62fc25fbab5f41 Weidong Wang 2023-01-13  526  
62fc25fbab5f41 Weidong Wang 2023-01-13 @527  	aw88395->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
62fc25fbab5f41 Weidong Wang 2023-01-13  528  	if (IS_ERR(aw88395->reset_gpio))
62fc25fbab5f41 Weidong Wang 2023-01-13  529  		dev_info(&i2c->dev, "reset gpio not defined\n");
62fc25fbab5f41 Weidong Wang 2023-01-13  530  
62fc25fbab5f41 Weidong Wang 2023-01-13  531  	/* hardware reset */
62fc25fbab5f41 Weidong Wang 2023-01-13  532  	aw88395_hw_reset(aw88395);
62fc25fbab5f41 Weidong Wang 2023-01-13  533  
62fc25fbab5f41 Weidong Wang 2023-01-13  534  	aw88395->regmap = devm_regmap_init_i2c(i2c, &aw88395_remap_config);
62fc25fbab5f41 Weidong Wang 2023-01-13  535  	if (IS_ERR(aw88395->regmap)) {
62fc25fbab5f41 Weidong Wang 2023-01-13  536  		ret = PTR_ERR(aw88395->regmap);
62fc25fbab5f41 Weidong Wang 2023-01-13  537  		dev_err(&i2c->dev, "Failed to init regmap: %d\n", ret);
62fc25fbab5f41 Weidong Wang 2023-01-13  538  		return ret;
62fc25fbab5f41 Weidong Wang 2023-01-13  539  	}
62fc25fbab5f41 Weidong Wang 2023-01-13  540  
62fc25fbab5f41 Weidong Wang 2023-01-13  541  	/* aw pa init */
62fc25fbab5f41 Weidong Wang 2023-01-13  542  	ret = aw88395_init(&aw88395->aw_pa, i2c, aw88395->regmap);
62fc25fbab5f41 Weidong Wang 2023-01-13  543  	if (ret < 0)
62fc25fbab5f41 Weidong Wang 2023-01-13  544  		return ret;
62fc25fbab5f41 Weidong Wang 2023-01-13  545  
62fc25fbab5f41 Weidong Wang 2023-01-13  546  	ret = aw88395_request_firmware_file(aw88395);
62fc25fbab5f41 Weidong Wang 2023-01-13  547  	if (ret < 0) {
62fc25fbab5f41 Weidong Wang 2023-01-13  548  		dev_err(&i2c->dev, "%s failed\n", __func__);
62fc25fbab5f41 Weidong Wang 2023-01-13  549  		return ret;
62fc25fbab5f41 Weidong Wang 2023-01-13  550  	}
62fc25fbab5f41 Weidong Wang 2023-01-13  551  
62fc25fbab5f41 Weidong Wang 2023-01-13  552  	ret = devm_snd_soc_register_component(&i2c->dev,
62fc25fbab5f41 Weidong Wang 2023-01-13  553  			&soc_codec_dev_aw88395,
62fc25fbab5f41 Weidong Wang 2023-01-13  554  			aw88395_dai, ARRAY_SIZE(aw88395_dai));
62fc25fbab5f41 Weidong Wang 2023-01-13  555  	if (ret < 0) {
62fc25fbab5f41 Weidong Wang 2023-01-13  556  		dev_err(&i2c->dev, "failed to register aw88395: %d", ret);
62fc25fbab5f41 Weidong Wang 2023-01-13  557  		return ret;
62fc25fbab5f41 Weidong Wang 2023-01-13  558  	}
62fc25fbab5f41 Weidong Wang 2023-01-13  559  
62fc25fbab5f41 Weidong Wang 2023-01-13  560  	return 0;
62fc25fbab5f41 Weidong Wang 2023-01-13  561  }
62fc25fbab5f41 Weidong Wang 2023-01-13  562  

:::::: The code at line 458 was first introduced by commit
:::::: 62fc25fbab5f416372b2890de313e38bec75b61d ASoC: codecs: Add i2c and codec registration for aw88395 and their associated operation functions

:::::: TO: Weidong Wang <wangweidong.a@awinic.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
