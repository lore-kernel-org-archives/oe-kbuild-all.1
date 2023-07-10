Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEDC154A2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 21:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689023610; x=1720559610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tb+Vn+wf8MkDHKC6o3Q2eBqcNKgJr9JRJvmAgHQ7nqQ=;
  b=E9I6o9BrINp58DgH9HAa6gwPgxRZUFWVSDLOl/4s3O3gHqTcFLsqAkYa
   4f1JRHasZYUnxIR1RuR8PX1NTjuJPFbj4C8qiT59HRpUqIv0a0u8liIEu
   m/V/oeW+j1EsleJRMxqKcS7VBs6bIVG7zn4Mu5mL7k/WVWIsZKtrXCB3E
   4qeGmEAReoFCc2ah32yZnUklsBtYAzZG79QIjnM19hu0RWC/sKwoUq4k+
   PNXdpZzaWmiz8EmYMbLpl2yQC938tQuihBUrEwgFKbfNRZg/2urmLZMkH
   yfhsdAj3pp+jVxEDLdZZSPxAvM/NI3VmAPURmuHxmxz8IaWTpNasM+kLS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="395244471"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="395244471"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 14:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="786344585"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="786344585"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jul 2023 14:13:28 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIyCF-00040S-33;
	Mon, 10 Jul 2023 21:13:27 +0000
Date: Tue, 11 Jul 2023 05:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v2_20230710_andriy_shevchenko_spi_header_and_core_clean_up_and_refactoring
 6/11] drivers/gpu/drm/panel/panel-tpo-td043mtea1.c:147:9: error: implicit
 declaration of function 'gpiod_set_value'
Message-ID: <202307110545.ECUQifkR-lkp@intel.com>
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
config: xtensa-randconfig-r004-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110545.ECUQifkR-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110545.ECUQifkR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110545.ECUQifkR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panel/panel-tpo-td043mtea1.c: In function 'td043mtea1_power_on':
>> drivers/gpu/drm/panel/panel-tpo-td043mtea1.c:147:9: error: implicit declaration of function 'gpiod_set_value' [-Werror=implicit-function-declaration]
     147 |         gpiod_set_value(lcd->reset_gpio, 0);
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-tpo-td043mtea1.c: In function 'td043mtea1_probe':
>> drivers/gpu/drm/panel/panel-tpo-td043mtea1.c:438:27: error: implicit declaration of function 'devm_gpiod_get'; did you mean 'em_pd_get'? [-Werror=implicit-function-declaration]
     438 |         lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
         |                           ^~~~~~~~~~~~~~
         |                           em_pd_get
>> drivers/gpu/drm/panel/panel-tpo-td043mtea1.c:438:62: error: 'GPIOD_OUT_HIGH' undeclared (first use in this function)
     438 |         lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
         |                                                              ^~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-tpo-td043mtea1.c:438:62: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/gpiod_set_value +147 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c

dc2e1e5b279966 Laurent Pinchart 2019-08-13  132  
dc2e1e5b279966 Laurent Pinchart 2019-08-13  133  static int td043mtea1_power_on(struct td043mtea1_panel *lcd)
dc2e1e5b279966 Laurent Pinchart 2019-08-13  134  {
dc2e1e5b279966 Laurent Pinchart 2019-08-13  135  	int ret;
dc2e1e5b279966 Laurent Pinchart 2019-08-13  136  
dc2e1e5b279966 Laurent Pinchart 2019-08-13  137  	if (lcd->powered_on)
dc2e1e5b279966 Laurent Pinchart 2019-08-13  138  		return 0;
dc2e1e5b279966 Laurent Pinchart 2019-08-13  139  
dc2e1e5b279966 Laurent Pinchart 2019-08-13  140  	ret = regulator_enable(lcd->vcc_reg);
dc2e1e5b279966 Laurent Pinchart 2019-08-13  141  	if (ret < 0)
dc2e1e5b279966 Laurent Pinchart 2019-08-13  142  		return ret;
dc2e1e5b279966 Laurent Pinchart 2019-08-13  143  
dc2e1e5b279966 Laurent Pinchart 2019-08-13  144  	/* Wait for the panel to stabilize. */
dc2e1e5b279966 Laurent Pinchart 2019-08-13  145  	msleep(160);
dc2e1e5b279966 Laurent Pinchart 2019-08-13  146  
dc2e1e5b279966 Laurent Pinchart 2019-08-13 @147  	gpiod_set_value(lcd->reset_gpio, 0);
dc2e1e5b279966 Laurent Pinchart 2019-08-13  148  
dc2e1e5b279966 Laurent Pinchart 2019-08-13  149  	td043mtea1_write(lcd, 2, TPO_R02_MODE(lcd->mode) | TPO_R02_NCLK_RISING);
dc2e1e5b279966 Laurent Pinchart 2019-08-13  150  	td043mtea1_write(lcd, 3, TPO_R03_VAL_NORMAL);
dc2e1e5b279966 Laurent Pinchart 2019-08-13  151  	td043mtea1_write(lcd, 0x20, 0xf0);
dc2e1e5b279966 Laurent Pinchart 2019-08-13  152  	td043mtea1_write(lcd, 0x21, 0xf0);
dc2e1e5b279966 Laurent Pinchart 2019-08-13  153  	td043mtea1_write_mirror(lcd);
dc2e1e5b279966 Laurent Pinchart 2019-08-13  154  	td043mtea1_write_gamma(lcd);
dc2e1e5b279966 Laurent Pinchart 2019-08-13  155  
dc2e1e5b279966 Laurent Pinchart 2019-08-13  156  	lcd->powered_on = true;
dc2e1e5b279966 Laurent Pinchart 2019-08-13  157  
dc2e1e5b279966 Laurent Pinchart 2019-08-13  158  	return 0;
dc2e1e5b279966 Laurent Pinchart 2019-08-13  159  }
dc2e1e5b279966 Laurent Pinchart 2019-08-13  160  

:::::: The code at line 147 was first introduced by commit
:::::: dc2e1e5b279966affbd11ff7cfef52eb634ca2c9 drm/panel: Add driver for the Toppoly TD043MTEA1 panel

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Sam Ravnborg <sam@ravnborg.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
