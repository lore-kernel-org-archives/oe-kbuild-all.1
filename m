Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4694C361
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 00:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678149477; x=1709685477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LqBPczmNjD+OwDZy+Bxl4zO6gCbvWKQtKjfmgEWe+ms=;
  b=aQJ33QPav6ASSp4eVZGDNo1q3NR7TpSQ36kuwtrVBSWcJrWHEwWQmsUi
   FgzQxicKhd2yxKdU//TgK+zjy8stk7JM+ctszV0SnAHUohStAZtBf3VIR
   P3awl545DQooaQITVlaJmq8YbejMgr7eJ11OeJ8fu1xDSmqbOw1oFj+8N
   9KInN845L0iWnufWlDUObCrtOEvG/f1hyJ/uG0eTgCFQEePxNOyAv7VzQ
   N0Wpn+aomXtmAsC1pqSNLyNRL/IspNUAsQtrkieB0jLiCNw3I3RQW0YCP
   B9JrD7sr8sS5TWrAHOrJcuXxMS1uKrrhJnHmCuU7LU7bwe3oifs3pEEeP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="334435284"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="334435284"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 16:37:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="626347233"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="626347233"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Mar 2023 16:37:43 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZLKo-0000mF-1a;
	Tue, 07 Mar 2023 00:37:42 +0000
Date: Tue, 7 Mar 2023 08:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:watchdog-next 37/38]
 drivers/watchdog/wm8350_wdt.c:156:46: error: passing argument 1 of
 'devm_watchdog_register_device' from incompatible pointer type
Message-ID: <202303070842.5mR8qwK4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   faaf9f98d1032c901d8e859e3b6883c7e67614b6
commit: d0b1813194e77e8f3a11e203472bd0dbcce52c2e [37/38] watchdog: wm8350: Simplify using devm_watchdog_register_device()
config: arm-randconfig-r046-20230306 (https://download.01.org/0day-ci/archive/20230307/202303070842.5mR8qwK4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=d0b1813194e77e8f3a11e203472bd0dbcce52c2e
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging watchdog-next
        git checkout d0b1813194e77e8f3a11e203472bd0dbcce52c2e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/watchdog/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070842.5mR8qwK4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/watchdog/wm8350_wdt.c: In function 'wm8350_wdt_probe':
>> drivers/watchdog/wm8350_wdt.c:156:46: error: passing argument 1 of 'devm_watchdog_register_device' from incompatible pointer type [-Werror=incompatible-pointer-types]
     156 |         return devm_watchdog_register_device(&wm8350_wdt);
         |                                              ^~~~~~~~~~~
         |                                              |
         |                                              struct watchdog_device *
   In file included from drivers/watchdog/wm8350_wdt.c:15:
   include/linux/watchdog.h:226:50: note: expected 'struct device *' but argument is of type 'struct watchdog_device *'
     226 | int devm_watchdog_register_device(struct device *dev, struct watchdog_device *);
         |                                   ~~~~~~~~~~~~~~~^~~
>> drivers/watchdog/wm8350_wdt.c:156:16: error: too few arguments to function 'devm_watchdog_register_device'
     156 |         return devm_watchdog_register_device(&wm8350_wdt);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/watchdog.h:226:5: note: declared here
     226 | int devm_watchdog_register_device(struct device *dev, struct watchdog_device *);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/wm8350_wdt.c:157:1: error: control reaches end of non-void function [-Werror=return-type]
     157 | }
         | ^
   cc1: some warnings being treated as errors


vim +/devm_watchdog_register_device +156 drivers/watchdog/wm8350_wdt.c

   139	
   140	static int wm8350_wdt_probe(struct platform_device *pdev)
   141	{
   142		struct wm8350 *wm8350 = platform_get_drvdata(pdev);
   143	
   144		if (!wm8350) {
   145			pr_err("No driver data supplied\n");
   146			return -ENODEV;
   147		}
   148	
   149		watchdog_set_nowayout(&wm8350_wdt, nowayout);
   150		watchdog_set_drvdata(&wm8350_wdt, wm8350);
   151		wm8350_wdt.parent = &pdev->dev;
   152	
   153		/* Default to 4s timeout */
   154		wm8350_wdt_set_timeout(&wm8350_wdt, 4);
   155	
 > 156		return devm_watchdog_register_device(&wm8350_wdt);
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
