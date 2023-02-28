Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672BD636
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 02:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677550514; x=1709086514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=un66gOEaYrtZRIsesAKSRl8hPrEetLjFjvyfPN5zYNk=;
  b=ioyGEMy/vjuZH/6e+TA9a8Sh/5z6ghXzEOOIp8SI+C8leZgJlJR8eit5
   oERD1qXG3dKMFIRx8yBfAlqtOe/u+obUvq7jTM8ENSgxZeNgNZN9FhuQa
   yyE71Ujuz8o2GBdxcTij6CJgyxQlHbr64oEuFYHFfbc144fmLcjYyt00D
   /id3QD1vVD9dE63rqJi/flQzZbzmj0Hd4/3RlNAbSE0SNH2MLLtyoB55+
   dmndIzRTZrpU9IwOqObA1jV2XRmwtNpdGQnssMj0e5RVUG8w2Pvfj7GZW
   7XcNB5MnDf/K/qEh1QYhNxqHNRQTBj0OcrDVQQlWDugD47BxT2qt4qEFi
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="361586670"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="361586670"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 18:15:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="762984495"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="762984495"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Feb 2023 18:15:12 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWpWK-0004zn-0T;
	Tue, 28 Feb 2023 02:15:12 +0000
Date: Tue, 28 Feb 2023 10:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 165/583]
 drivers/gpio/gpio-bcm-virt.c:34:31: warning: variable 'gpio' set but not
 used
Message-ID: <202302281012.ZHEPrJoc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: 6e18853527ab632978926184a6306e56f0ac509c [165/583] bcm2835-virtgpio: Virtual GPIO driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302281012.ZHEPrJoc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/6e18853527ab632978926184a6306e56f0ac509c
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 6e18853527ab632978926184a6306e56f0ac509c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/char/broadcom/ drivers/dma/ drivers/gpio/ drivers/irqchip/ drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302281012.ZHEPrJoc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-bcm-virt.c: In function 'brcmvirt_gpio_dir_in':
>> drivers/gpio/gpio-bcm-virt.c:34:31: warning: variable 'gpio' set but not used [-Wunused-but-set-variable]
      34 |         struct brcmvirt_gpio *gpio;
         |                               ^~~~
   drivers/gpio/gpio-bcm-virt.c: In function 'brcmvirt_gpio_dir_out':
   drivers/gpio/gpio-bcm-virt.c:41:31: warning: variable 'gpio' set but not used [-Wunused-but-set-variable]
      41 |         struct brcmvirt_gpio *gpio;
         |                               ^~~~


vim +/gpio +34 drivers/gpio/gpio-bcm-virt.c

    31	
    32	static int brcmvirt_gpio_dir_in(struct gpio_chip *gc, unsigned off)
    33	{
  > 34		struct brcmvirt_gpio *gpio;
    35		gpio = container_of(gc, struct brcmvirt_gpio, gc);
    36		return -EINVAL;
    37	}
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
