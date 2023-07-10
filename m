Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F17154BD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 21:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689023011; x=1720559011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mZ4KL0JPZfG6HhL5H8ipNntEOm/ssv4zpZBFOngBRhc=;
  b=LwMlcLKuVcxK6D9fu0uSSH3mxYGNR3JEYp2YZGaNV0bh34mvHl0zs0wx
   4vqSp8YB0G57douWDjnFifs+NN+EFY09wHKeKbcjCqJSK3fnKpyok/4hg
   gW5BohtIS2DWwd7vQuO4gHUZdsWGqo5bRhwUlHVGQsVqy0z6+7GKm4KmF
   Fw5OijLHDxjWL7Cwa8SiGXjbYTynE83AiGuNTCExDiMCJWIvNnrFkHVLY
   FceErI692e6cgCguKiZmMD2GCKvKQC+zKXsYE0izg86MMOTOl8G41hFg4
   pcDIJmCWiezZ0YnTKJNPyOqQLLBOSeWFTJGJ26Joq6tLHROnI7dVBaAke
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344777331"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="344777331"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 14:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="720821868"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="720821868"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Jul 2023 14:03:28 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIy2Z-000404-2G;
	Mon, 10 Jul 2023 21:03:27 +0000
Date: Tue, 11 Jul 2023 05:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v2_20230710_andriy_shevchenko_spi_header_and_core_clean_up_and_refactoring
 6/11] drivers/gpu/drm/solomon/ssd130x-spi.c:38:17: error: implicit
 declaration of function 'gpiod_set_value_cansleep'
Message-ID: <202307110514.C2xGiwq2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20230710_andriy_shevchenko_spi_header_and_core_clean_up_and_refactoring
head:   369552a608af49f5a4eb2e0f314b7404ab405b27
commit: 7ed8e3577d00253736324aabaae615698fb65f78 [6/11] spi: Clean up headers
config: parisc-randconfig-r023-20230711 (https://download.01.org/0day-ci/archive/20230711/202307110514.C2xGiwq2-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110514.C2xGiwq2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110514.C2xGiwq2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/solomon/ssd130x-spi.c: In function 'ssd130x_spi_write':
>> drivers/gpu/drm/solomon/ssd130x-spi.c:38:17: error: implicit declaration of function 'gpiod_set_value_cansleep' [-Werror=implicit-function-declaration]
      38 |                 gpiod_set_value_cansleep(t->dc, 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x-spi.c: In function 'ssd130x_spi_probe':
>> drivers/gpu/drm/solomon/ssd130x-spi.c:70:14: error: implicit declaration of function 'devm_gpiod_get'; did you mean 'em_pd_get'? [-Werror=implicit-function-declaration]
      70 |         dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
         |              ^~~~~~~~~~~~~~
         |              em_pd_get
>> drivers/gpu/drm/solomon/ssd130x-spi.c:70:40: error: 'GPIOD_OUT_LOW' undeclared (first use in this function)
      70 |         dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
         |                                        ^~~~~~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x-spi.c:70:40: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/gpiod_set_value_cansleep +38 drivers/gpu/drm/solomon/ssd130x-spi.c

74373977d2ca26 Javier Martinez Canillas 2022-04-19  20  
74373977d2ca26 Javier Martinez Canillas 2022-04-19  21  /*
74373977d2ca26 Javier Martinez Canillas 2022-04-19  22   * The regmap bus .write handler, it is just a wrapper around spi_write()
74373977d2ca26 Javier Martinez Canillas 2022-04-19  23   * but toggling the Data/Command control pin (D/C#). Since for 4-wire SPI
74373977d2ca26 Javier Martinez Canillas 2022-04-19  24   * a D/C# pin is used, in contrast with I2C where a control byte is sent,
74373977d2ca26 Javier Martinez Canillas 2022-04-19  25   * prior to every data byte, that contains a bit with the D/C# value.
74373977d2ca26 Javier Martinez Canillas 2022-04-19  26   *
74373977d2ca26 Javier Martinez Canillas 2022-04-19  27   * These control bytes are considered registers by the ssd130x core driver
74373977d2ca26 Javier Martinez Canillas 2022-04-19  28   * and can be used by the ssd130x SPI driver to determine if the data sent
74373977d2ca26 Javier Martinez Canillas 2022-04-19  29   * is for a command register or for the Graphic Display Data RAM (GDDRAM).
74373977d2ca26 Javier Martinez Canillas 2022-04-19  30   */
74373977d2ca26 Javier Martinez Canillas 2022-04-19  31  static int ssd130x_spi_write(void *context, const void *data, size_t count)
74373977d2ca26 Javier Martinez Canillas 2022-04-19  32  {
74373977d2ca26 Javier Martinez Canillas 2022-04-19  33  	struct ssd130x_spi_transport *t = context;
74373977d2ca26 Javier Martinez Canillas 2022-04-19  34  	struct spi_device *spi = t->spi;
74373977d2ca26 Javier Martinez Canillas 2022-04-19  35  	const u8 *reg = data;
74373977d2ca26 Javier Martinez Canillas 2022-04-19  36  
74373977d2ca26 Javier Martinez Canillas 2022-04-19  37  	if (*reg == SSD130X_COMMAND)
74373977d2ca26 Javier Martinez Canillas 2022-04-19 @38  		gpiod_set_value_cansleep(t->dc, 0);
74373977d2ca26 Javier Martinez Canillas 2022-04-19  39  
74373977d2ca26 Javier Martinez Canillas 2022-04-19  40  	if (*reg == SSD130X_DATA)
74373977d2ca26 Javier Martinez Canillas 2022-04-19  41  		gpiod_set_value_cansleep(t->dc, 1);
74373977d2ca26 Javier Martinez Canillas 2022-04-19  42  
74373977d2ca26 Javier Martinez Canillas 2022-04-19  43  	/* Remove control byte since is not used in a 4-wire SPI interface */
74373977d2ca26 Javier Martinez Canillas 2022-04-19  44  	return spi_write(spi, reg + 1, count - 1);
74373977d2ca26 Javier Martinez Canillas 2022-04-19  45  }
74373977d2ca26 Javier Martinez Canillas 2022-04-19  46  
74373977d2ca26 Javier Martinez Canillas 2022-04-19  47  /* The ssd130x driver does not read registers but regmap expects a .read */
74373977d2ca26 Javier Martinez Canillas 2022-04-19  48  static int ssd130x_spi_read(void *context, const void *reg, size_t reg_size,
74373977d2ca26 Javier Martinez Canillas 2022-04-19  49  			    void *val, size_t val_size)
74373977d2ca26 Javier Martinez Canillas 2022-04-19  50  {
74373977d2ca26 Javier Martinez Canillas 2022-04-19  51  	return -EOPNOTSUPP;
74373977d2ca26 Javier Martinez Canillas 2022-04-19  52  }
74373977d2ca26 Javier Martinez Canillas 2022-04-19  53  
6fc20a8592f569 Javier Martinez Canillas 2022-06-18  54  static const struct regmap_config ssd130x_spi_regmap_config = {
6fc20a8592f569 Javier Martinez Canillas 2022-06-18  55  	.reg_bits = 8,
6fc20a8592f569 Javier Martinez Canillas 2022-06-18  56  	.val_bits = 8,
74373977d2ca26 Javier Martinez Canillas 2022-04-19  57  	.write = ssd130x_spi_write,
74373977d2ca26 Javier Martinez Canillas 2022-04-19  58  	.read = ssd130x_spi_read,
6fc20a8592f569 Javier Martinez Canillas 2022-06-18  59  	.can_multi_write = true,
74373977d2ca26 Javier Martinez Canillas 2022-04-19  60  };
74373977d2ca26 Javier Martinez Canillas 2022-04-19  61  
74373977d2ca26 Javier Martinez Canillas 2022-04-19  62  static int ssd130x_spi_probe(struct spi_device *spi)
74373977d2ca26 Javier Martinez Canillas 2022-04-19  63  {
74373977d2ca26 Javier Martinez Canillas 2022-04-19  64  	struct ssd130x_spi_transport *t;
74373977d2ca26 Javier Martinez Canillas 2022-04-19  65  	struct ssd130x_device *ssd130x;
74373977d2ca26 Javier Martinez Canillas 2022-04-19  66  	struct regmap *regmap;
74373977d2ca26 Javier Martinez Canillas 2022-04-19  67  	struct gpio_desc *dc;
74373977d2ca26 Javier Martinez Canillas 2022-04-19  68  	struct device *dev = &spi->dev;
74373977d2ca26 Javier Martinez Canillas 2022-04-19  69  
74373977d2ca26 Javier Martinez Canillas 2022-04-19 @70  	dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
74373977d2ca26 Javier Martinez Canillas 2022-04-19  71  	if (IS_ERR(dc))
74373977d2ca26 Javier Martinez Canillas 2022-04-19  72  		return dev_err_probe(dev, PTR_ERR(dc),
74373977d2ca26 Javier Martinez Canillas 2022-04-19  73  				     "Failed to get dc gpio\n");
74373977d2ca26 Javier Martinez Canillas 2022-04-19  74  
74373977d2ca26 Javier Martinez Canillas 2022-04-19  75  	t = devm_kzalloc(dev, sizeof(*t), GFP_KERNEL);
74373977d2ca26 Javier Martinez Canillas 2022-04-19  76  	if (!t)
74373977d2ca26 Javier Martinez Canillas 2022-04-19  77  		return dev_err_probe(dev, -ENOMEM,
74373977d2ca26 Javier Martinez Canillas 2022-04-19  78  				     "Failed to allocate SPI transport data\n");
74373977d2ca26 Javier Martinez Canillas 2022-04-19  79  
74373977d2ca26 Javier Martinez Canillas 2022-04-19  80  	t->spi = spi;
74373977d2ca26 Javier Martinez Canillas 2022-04-19  81  	t->dc = dc;
74373977d2ca26 Javier Martinez Canillas 2022-04-19  82  
6fc20a8592f569 Javier Martinez Canillas 2022-06-18  83  	regmap = devm_regmap_init(dev, NULL, t, &ssd130x_spi_regmap_config);
74373977d2ca26 Javier Martinez Canillas 2022-04-19  84  	if (IS_ERR(regmap))
74373977d2ca26 Javier Martinez Canillas 2022-04-19  85  		return PTR_ERR(regmap);
74373977d2ca26 Javier Martinez Canillas 2022-04-19  86  
74373977d2ca26 Javier Martinez Canillas 2022-04-19  87  	ssd130x = ssd130x_probe(dev, regmap);
74373977d2ca26 Javier Martinez Canillas 2022-04-19  88  	if (IS_ERR(ssd130x))
74373977d2ca26 Javier Martinez Canillas 2022-04-19  89  		return PTR_ERR(ssd130x);
74373977d2ca26 Javier Martinez Canillas 2022-04-19  90  
74373977d2ca26 Javier Martinez Canillas 2022-04-19  91  	spi_set_drvdata(spi, ssd130x);
74373977d2ca26 Javier Martinez Canillas 2022-04-19  92  
74373977d2ca26 Javier Martinez Canillas 2022-04-19  93  	return 0;
74373977d2ca26 Javier Martinez Canillas 2022-04-19  94  }
74373977d2ca26 Javier Martinez Canillas 2022-04-19  95  

:::::: The code at line 38 was first introduced by commit
:::::: 74373977d2ca26e5735377f8874be70bc2f030f5 drm/solomon: Add SSD130x OLED displays SPI support

:::::: TO: Javier Martinez Canillas <javierm@redhat.com>
:::::: CC: Javier Martinez Canillas <javierm@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
