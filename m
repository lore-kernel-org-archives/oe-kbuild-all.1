Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8BC18C26
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 20:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693512787; x=1725048787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JEwCcTpuPHqAF8aPJyDLeworNWZ8ISfoEzNYklr6gV8=;
  b=KlZnmHzCdhBAnX2FiZxH4H5F9mNL6NoPEu2mR1+kMB8LNVXlTTIIBudL
   VsgTFXwcval/F1x7JUjErSnUJnamNQmhybwRU65aFaBjlxU3ZkFrK4IDB
   aZhvelyMK51Kn+SzAz3LnQau1wUifsqVd13XCMUt5XqfigSc2LCXWigeL
   75kZcKH9Vjk8v0la0IG1OOHGIWnQXMVnqNFTm42G4rBLOweOYEXmer8Oa
   KfWL/5wetvXKdIkVIwiO18B7xsm8efQUgf6AcQ01Uq1zzVd/xgJDTZdIt
   ijVbpUrDk4SLR1gr23kR+4/BUVCRMyjCisTvonpY1Mdld+zi25e0szWro
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375990627"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="375990627"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 13:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863271109"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="863271109"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2023 13:13:05 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbo2J-0000WR-0X;
	Thu, 31 Aug 2023 20:13:03 +0000
Date: Fri, 1 Sep 2023 04:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3225/24603] drivers/gpio/gpio-scu.c:99:4:
 error: 'struct gpio_chip' has no member named 'of_node'
Message-ID: <202309010416.UdGAPx2U-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: cdb7bf80f99743df8c3375d3191d3b96661c4b65 [3225/24603] MLK-25166-1 gpio: gpio-scu: gpio driver over scu fw misc api
config: x86_64-buildonly-randconfig-005-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010416.UdGAPx2U-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010416.UdGAPx2U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010416.UdGAPx2U-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-scu.c: In function 'imx_scu_gpio_probe':
>> drivers/gpio/gpio-scu.c:99:4: error: 'struct gpio_chip' has no member named 'of_node'
      99 |  gc->of_node = np;
         |    ^~


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
https://github.com/intel/lkp-tests/wiki
