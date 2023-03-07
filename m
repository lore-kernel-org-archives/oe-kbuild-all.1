Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE02E361
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 01:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678151326; x=1709687326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TjkVFqqp0PX7TGcQptxeI/FlxrZpXmYKekZRMA+eD28=;
  b=MrS8FJeIYKMpmevIxqDk9U3ggTTfsvukAiiG8wZf93Mm13EBUXT1QTjF
   ErWuJrIWv1U+A6AhyRbkVQonuKISOjpGVDk69OLGQNAa9PcOzcJb/fA2k
   wykbEWwfzvyNCqSHfj2AHgHXop8Qc6ou8uJZxlGlmm4gVyzM4th1wEf4J
   VwiGdabXHSxU85Ednz2NNyTmKeR2rlBnGWwCPZ01azsRujFFtgSspromM
   wcS3aIbiWW4zptHoGPjswUWmH06agiEiojk/a3Dk3k+lUR2QIAHeOwwqX
   Hpt4JHTgIc5ZKU0JvYhcU7uQLMtvI5MeNiUYqRD0N2O5y167SEyMgCXNh
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="398308465"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="398308465"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 17:08:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676379867"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="676379867"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Mar 2023 17:08:45 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZLoq-0000pL-1R;
	Tue, 07 Mar 2023 01:08:44 +0000
Date: Tue, 7 Mar 2023 09:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/3] watchdog: bcm47xx: Simplify using
 devm_watchdog_register_device()
Message-ID: <202303070924.yeGnMiab-lkp@intel.com>
References: <20230306170901.2232323-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306170901.2232323-2-u.kleine-koenig@pengutronix.de>

Hi Uwe,

I love your patch! Yet something to improve:

[auto build test ERROR on fe15c26ee26efa11741a7b632e9f23b01aca4cc6]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/watchdog-bcm47xx-Simplify-using-devm_watchdog_register_device/20230307-011628
base:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
patch link:    https://lore.kernel.org/r/20230306170901.2232323-2-u.kleine-koenig%40pengutronix.de
patch subject: [PATCH 1/3] watchdog: bcm47xx: Simplify using devm_watchdog_register_device()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230307/202303070924.yeGnMiab-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ad2167a8c083b21e3bfff7b5a6cc6f79d42b283f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Uwe-Kleine-K-nig/watchdog-bcm47xx-Simplify-using-devm_watchdog_register_device/20230307-011628
        git checkout ad2167a8c083b21e3bfff7b5a6cc6f79d42b283f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070924.yeGnMiab-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/watchdog/bcm47xx_wdt.c: In function 'bcm47xx_wdt_probe':
>> drivers/watchdog/bcm47xx_wdt.c:205:45: error: passing argument 1 of 'devm_watchdog_register_device' from incompatible pointer type [-Werror=incompatible-pointer-types]
     205 |         ret = devm_watchdog_register_device(&wdt->wdd);
         |                                             ^~~~~~~~~
         |                                             |
         |                                             struct watchdog_device *
   In file included from include/linux/bcm47xx_wdt.h:7,
                    from drivers/watchdog/bcm47xx_wdt.c:13:
   include/linux/watchdog.h:226:50: note: expected 'struct device *' but argument is of type 'struct watchdog_device *'
     226 | int devm_watchdog_register_device(struct device *dev, struct watchdog_device *);
         |                                   ~~~~~~~~~~~~~~~^~~
>> drivers/watchdog/bcm47xx_wdt.c:205:15: error: too few arguments to function 'devm_watchdog_register_device'
     205 |         ret = devm_watchdog_register_device(&wdt->wdd);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/watchdog.h:226:5: note: declared here
     226 | int devm_watchdog_register_device(struct device *dev, struct watchdog_device *);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/devm_watchdog_register_device +205 drivers/watchdog/bcm47xx_wdt.c

   176	
   177	static int bcm47xx_wdt_probe(struct platform_device *pdev)
   178	{
   179		int ret;
   180		bool soft;
   181		struct bcm47xx_wdt *wdt = dev_get_platdata(&pdev->dev);
   182	
   183		if (!wdt)
   184			return -ENXIO;
   185	
   186		soft = wdt->max_timer_ms < WDT_SOFTTIMER_THRESHOLD * 1000;
   187	
   188		if (soft) {
   189			wdt->wdd.ops = &bcm47xx_wdt_soft_ops;
   190			timer_setup(&wdt->soft_timer, bcm47xx_wdt_soft_timer_tick, 0);
   191		} else {
   192			wdt->wdd.ops = &bcm47xx_wdt_hard_ops;
   193		}
   194	
   195		wdt->wdd.info = &bcm47xx_wdt_info;
   196		wdt->wdd.timeout = WDT_DEFAULT_TIME;
   197		wdt->wdd.parent = &pdev->dev;
   198		ret = wdt->wdd.ops->set_timeout(&wdt->wdd, timeout);
   199		if (ret)
   200			goto err_timer;
   201		watchdog_set_nowayout(&wdt->wdd, nowayout);
   202		watchdog_set_restart_priority(&wdt->wdd, 64);
   203		watchdog_stop_on_reboot(&wdt->wdd);
   204	
 > 205		ret = devm_watchdog_register_device(&wdt->wdd);
   206		if (ret)
   207			goto err_timer;
   208	
   209		dev_info(&pdev->dev, "BCM47xx Watchdog Timer enabled (%d seconds%s%s)\n",
   210			timeout, nowayout ? ", nowayout" : "",
   211			soft ? ", Software Timer" : "");
   212		return 0;
   213	
   214	err_timer:
   215		if (soft)
   216			del_timer_sync(&wdt->soft_timer);
   217	
   218		return ret;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
