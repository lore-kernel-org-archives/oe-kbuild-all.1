Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7FA339705
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960828; cv=none; b=uPShzP5XjwRalez/eCr5uYpWszO3yIVKk8R5z7EbBrVoogmCevP8mz0cG/RxdruAtk3wY0ac1Ax/yIRvdO9mRfmZd7ccqVUFFIMfj5a1Zx7WtjcCEy9p0rB9zAk/SVrWSLvtFIs3Mp7io7DTKyYMEUyB17bTfrnY9ODqvWmXLwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960828; c=relaxed/simple;
	bh=Yw0k2ECMlBpohT5i5Z1p/LI4wTTiUge1xHStWZvP8aE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qn4FacTnB80eu5pU0E8PCEBzTM0fS1H+SDQTPppCyVQowprUoyY+PGjgYGbevJ8vYEzbhxbZuAuB4N1L75zu8usfiv7wUnP1bemVRMFN8SA0LB/g+e2pyD66HHnVbL81zq4Qhk/oXO+3paA+YO/xU2DtD0cB/J39aOO4Ycgjmw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsBx9etm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsBx9etm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765960826; x=1797496826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yw0k2ECMlBpohT5i5Z1p/LI4wTTiUge1xHStWZvP8aE=;
  b=dsBx9etmkzzm8aYtKjGTmuJhiPaOIPbnQS0N9bLx37VdKEvZVrT8tg4a
   GF/eoAon5hkSedG0EOpehBcdVE9qznWOXBF98cW2gI47AawLyNWqUpam+
   oQaHw7paJDp3gu0CkH9RIAq95gXtsRZz1p8I+uVUzVIpqwA0FY5EhQQdF
   eABZx/MCUtyvvTLhjx9YFqtwjsFee2/yvgiITkjYomuDzGG8txOHeU/1d
   WTJpnKtWgwkWqAe6q8KQ/hQ3VJIhB0WxvzyEDLm28YYlizILm1xjuk8Tt
   FjpPymNR5eqU4tQCeZPfAF2erMxsmroFCJnr9Y3x32PGEzH/3X9ReBRny
   w==;
X-CSE-ConnectionGUID: g/Dp0pFqSJGJ1B7MaegSBw==
X-CSE-MsgGUID: 56k32rwsTPGlzx0vj77e1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="93368335"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="93368335"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 00:40:23 -0800
X-CSE-ConnectionGUID: Yx9DhOa+R1GfGxWbOz//Kw==
X-CSE-MsgGUID: xdfZCD0OSQqxMYcEYfcR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198740168"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2025 00:40:22 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVn51-000000000Eb-43UB;
	Wed, 17 Dec 2025 08:40:19 +0000
Date: Wed, 17 Dec 2025 16:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
	"Daniel Thompson (RISCstar)" <danielt@kernel.org>
Subject: drivers/video/backlight/aw99706.c:281:9: error: implicit declaration
 of function 'gpiod_set_value_cansleep'; did you mean
 'gpio_set_value_cansleep'?
Message-ID: <202512171631.uKXlYwqu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 147b38a5ad068c43d601addc668937af6b4fe533 backlight: aw99706: Add support for Awinic AW99706 backlight
date:   3 weeks ago
config: sh-randconfig-r061-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171631.uKXlYwqu-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171631.uKXlYwqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171631.uKXlYwqu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/backlight/aw99706.c: In function 'aw99706_hw_init':
>> drivers/video/backlight/aw99706.c:281:9: error: implicit declaration of function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'? [-Wimplicit-function-declaration]
     281 |         gpiod_set_value_cansleep(aw->hwen_gpio, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         gpio_set_value_cansleep
   drivers/video/backlight/aw99706.c: In function 'aw99706_probe':
>> drivers/video/backlight/aw99706.c:394:25: error: implicit declaration of function 'devm_gpiod_get'; did you mean 'em_pd_get'? [-Wimplicit-function-declaration]
     394 |         aw->hwen_gpio = devm_gpiod_get(aw->dev, "enable", GPIOD_OUT_LOW);
         |                         ^~~~~~~~~~~~~~
         |                         em_pd_get
>> drivers/video/backlight/aw99706.c:394:59: error: 'GPIOD_OUT_LOW' undeclared (first use in this function); did you mean 'GPIOF_OUT_INIT_LOW'?
     394 |         aw->hwen_gpio = devm_gpiod_get(aw->dev, "enable", GPIOD_OUT_LOW);
         |                                                           ^~~~~~~~~~~~~
         |                                                           GPIOF_OUT_INIT_LOW
   drivers/video/backlight/aw99706.c:394:59: note: each undeclared identifier is reported only once for each function it appears in
   drivers/video/backlight/aw99706.c: At top level:
   drivers/video/backlight/aw99706.c:436:12: warning: 'aw99706_resume' defined but not used [-Wunused-function]
     436 | static int aw99706_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
   drivers/video/backlight/aw99706.c:429:12: warning: 'aw99706_suspend' defined but not used [-Wunused-function]
     429 | static int aw99706_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +281 drivers/video/backlight/aw99706.c

   276	
   277	static int aw99706_hw_init(struct aw99706_device *aw)
   278	{
   279		int ret, i;
   280	
 > 281		gpiod_set_value_cansleep(aw->hwen_gpio, 1);
   282	
   283		for (i = 0; i < ARRAY_SIZE(aw->init_tbl); i++) {
   284			ret = aw99706_i2c_update_bits(aw, aw->init_tbl[i].reg,
   285						      aw->init_tbl[i].mask,
   286						      aw->init_tbl[i].val);
   287			if (ret < 0) {
   288				dev_err(aw->dev, "Failed to write init data %d\n", ret);
   289				return ret;
   290			}
   291		}
   292	
   293		return 0;
   294	}
   295	
   296	static int aw99706_bl_enable(struct aw99706_device *aw, bool en)
   297	{
   298		int ret;
   299		u8 val;
   300	
   301		val = FIELD_PREP(AW99706_BACKLIGHT_EN_MASK, en);
   302		ret = aw99706_i2c_update_bits(aw, AW99706_CFGD_REG,
   303					      AW99706_BACKLIGHT_EN_MASK, val);
   304		if (ret)
   305			dev_err(aw->dev, "Failed to enable backlight!\n");
   306	
   307		return ret;
   308	}
   309	
   310	static int aw99706_update_brightness(struct aw99706_device *aw, u32 brt_lvl)
   311	{
   312		bool bl_enable_now = !!brt_lvl;
   313		int ret;
   314	
   315		ret = aw99706_i2c_write(aw, AW99706_CFG4_REG,
   316					(brt_lvl >> 8) & AW99706_BRT_MSB_MASK);
   317		if (ret < 0)
   318			return ret;
   319	
   320		ret = aw99706_i2c_write(aw, AW99706_CFG5_REG,
   321					brt_lvl & AW99706_BRT_LSB_MASK);
   322		if (ret < 0)
   323			return ret;
   324	
   325		if (aw->bl_enable != bl_enable_now) {
   326			ret = aw99706_bl_enable(aw, bl_enable_now);
   327			if (!ret)
   328				aw->bl_enable = bl_enable_now;
   329		}
   330	
   331		return ret;
   332	}
   333	
   334	static int aw99706_bl_update_status(struct backlight_device *bl)
   335	{
   336		struct aw99706_device *aw = bl_get_data(bl);
   337	
   338		return aw99706_update_brightness(aw, bl->props.brightness);
   339	}
   340	
   341	static const struct backlight_ops aw99706_bl_ops = {
   342		.options = BL_CORE_SUSPENDRESUME,
   343		.update_status = aw99706_bl_update_status,
   344	};
   345	
   346	static const struct regmap_config aw99706_regmap_config = {
   347		.reg_bits = 8,
   348		.val_bits = 8,
   349		.max_register = AW99706_REG_MAX,
   350		.writeable_reg = aw99706_writeable_reg,
   351		.readable_reg = aw99706_readable_reg,
   352	};
   353	
   354	static int aw99706_chip_id_read(struct aw99706_device *aw)
   355	{
   356		int ret;
   357		unsigned int val;
   358	
   359		ret = aw99706_i2c_read(aw, AW99706_CHIPID_REG, &val);
   360		if (ret < 0)
   361			return ret;
   362	
   363		return val;
   364	}
   365	
   366	static int aw99706_probe(struct i2c_client *client)
   367	{
   368		struct device *dev = &client->dev;
   369		struct aw99706_device *aw;
   370		struct backlight_device *bl_dev;
   371		struct backlight_properties props = {};
   372		int ret = 0;
   373	
   374		aw = devm_kzalloc(dev, sizeof(*aw), GFP_KERNEL);
   375		if (!aw)
   376			return -ENOMEM;
   377	
   378		aw->client = client;
   379		aw->dev = dev;
   380		i2c_set_clientdata(client, aw);
   381	
   382		aw->regmap = devm_regmap_init_i2c(client, &aw99706_regmap_config);
   383		if (IS_ERR(aw->regmap))
   384			return dev_err_probe(dev, PTR_ERR(aw->regmap),
   385					     "Failed to init regmap\n");
   386	
   387		ret = aw99706_chip_id_read(aw);
   388		if (ret != AW99706_ID)
   389			return dev_err_probe(dev, -ENODEV,
   390					     "Unknown chip id 0x%02x\n", ret);
   391	
   392		aw99706_dt_parse(aw, &props);
   393	
 > 394		aw->hwen_gpio = devm_gpiod_get(aw->dev, "enable", GPIOD_OUT_LOW);
   395		if (IS_ERR(aw->hwen_gpio))
   396			return dev_err_probe(dev, PTR_ERR(aw->hwen_gpio),
   397					     "Failed to get enable gpio\n");
   398	
   399		ret = aw99706_hw_init(aw);
   400		if (ret < 0)
   401			return dev_err_probe(dev, ret,
   402					     "Failed to initialize the chip\n");
   403	
   404		props.type = BACKLIGHT_RAW;
   405		props.scale = BACKLIGHT_SCALE_LINEAR;
   406	
   407		bl_dev = devm_backlight_device_register(dev, "aw99706-backlight", dev,
   408							aw, &aw99706_bl_ops, &props);
   409		if (IS_ERR(bl_dev))
   410			return dev_err_probe(dev, PTR_ERR(bl_dev),
   411					     "Failed to register backlight!\n");
   412	
   413		aw->bl_dev = bl_dev;
   414	
   415		return 0;
   416	}
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
