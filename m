Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3CF256C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 10:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675592778; x=1707128778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ybJQkJSPToUAMh2ZAlRn2d6K/SyIxyfJJHSgOSvcJho=;
  b=REMTLxjWWPdKzQZRgN56CCIn1pjutJS5JlTx/NcE5ZvNLAkvkg1FHk97
   ijZ4sAxcrVGewZm8+licQZEFr/XU7I2ectwWGXyb8YWA3ee3cSJdY1MyJ
   XjYgy5ElOpnWBlMQ0isM37OsVt0K3K1RMjbA4WP49fae4yVZwCAmLTfA+
   OP1m0E/qekYGzwiilGg0B0nbsP4o6Fayro9JCUwA9bi6Ixj4FlQGxYYrG
   bNZUPnKhlqbi7nZJTZisiO1ss5T/tRvYHWJsoHMwmHEImpilULivVZNAb
   Z3B9u9YB5cHbP5SfNlg3hqB7CkzWEcBtp7lOICPJ2j2kOEyMsiXYo8rIb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309368037"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="309368037"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 02:26:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="754956678"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="754956678"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Feb 2023 02:26:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOcDw-0001wG-10;
	Sun, 05 Feb 2023 10:26:16 +0000
Date: Sun, 5 Feb 2023 18:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3225/20209]
 drivers/gpio/gpio-scu.c:99:11: error: 'struct gpio_chip' has no member named
 'of_node'
Message-ID: <202302051805.m2IWD9OL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shenwei,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: cdb7bf80f99743df8c3375d3191d3b96661c4b65 [3225/20209] MLK-25166-1 gpio: gpio-scu: gpio driver over scu fw misc api
config: m68k-randconfig-r016-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051805.m2IWD9OL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/cdb7bf80f99743df8c3375d3191d3b96661c4b65
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout cdb7bf80f99743df8c3375d3191d3b96661c4b65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-scu.c: In function 'imx_scu_gpio_probe':
>> drivers/gpio/gpio-scu.c:99:11: error: 'struct gpio_chip' has no member named 'of_node'
      99 |         gc->of_node = np;
         |           ^~


vim +99 drivers/gpio/gpio-scu.c

    80	
    81	static int imx_scu_gpio_probe(struct platform_device *pdev)
    82	{
    83		struct device *dev = &pdev->dev;
    84		struct device_node *np = dev->of_node;
    85		struct imxscfw *port;
    86		struct gpio_chip *gc;
    87		int ret;
    88	
    89		port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
    90		if (!port)
    91			return -ENOMEM;
    92	
    93		ret = imx_scu_get_handle(&port->handle);
    94		if (ret)
    95			return ret;
    96	
    97		mutex_init(&port->lock);
    98		gc = &port->chip;
  > 99		gc->of_node = np;
   100		gc->parent = dev;
   101		gc->label = "imx-scu-gpio";
   102		gc->ngpio = PIN_NUMBER;
   103		gc->base = of_alias_get_id(np, "gpio") * 32;
   104	
   105		gc->get = imxscfw_get;
   106		gc->set = imxscfw_set;
   107	
   108		platform_set_drvdata(pdev, port);
   109	
   110		ret = devm_gpiochip_add_data(dev, gc, port);
   111	
   112		return ret;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
