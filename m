Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D1028F3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 15:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686237707; x=1717773707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qLDh1oY1WDY5px+BJYCMxPzq7HnAP/c0S9rh3SgTOWM=;
  b=lJiRwvcChInGinDrAV+ipzC7T768UprtGqrR8xGIcYl22MKY03DfXcr5
   BUSfeLiwkeEPp6k/YOlTaYDJIIDMbmaW8DluWqF2er4oU0KSDeaJccMKn
   c5EI0ar7w1mY+GQmR9aSUrABvnci1Jh+G4chIXxfuOh70hPlpVIlWBr00
   djhiHnjEdLOVcG4bTqGqMJf5UE78Ttsgh9OO9rHrycEq30F3fUoKEXDQT
   +0114+tYA7aDocFQBEhhakoZBJy+XcXDX0pDRlgbP70IMCXb3CbM0rUwj
   uvjYsRq00RPvOWgzk7UH5AcerkpXsBTXHiR/kB4PpncEnENfbNv5kdS9k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="385679547"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="385679547"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 08:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="834231008"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="834231008"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Jun 2023 08:21:22 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7HRx-0007yW-2l;
	Thu, 08 Jun 2023 15:21:21 +0000
Date: Thu, 8 Jun 2023 23:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Subject: [linux-next:master 4146/8065] drivers/leds/leds-cht-wcove.c:142:21:
 warning: no previous prototype for 'cht_wc_leds_brightness_get'
Message-ID: <202306082341.UQtCM8PO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yauhen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   db10f126048021b86e43a5d6a335ec49dec10155
commit: 047da762b9a937d60c16e2c8392c326e5ab11a1d [4146/8065] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230608/202306082341.UQtCM8PO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=047da762b9a937d60c16e2c8392c326e5ab11a1d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 047da762b9a937d60c16e2c8392c326e5ab11a1d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/leds/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306082341.UQtCM8PO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-cht-wcove.c:142:21: warning: no previous prototype for 'cht_wc_leds_brightness_get' [-Wmissing-prototypes]
     142 | enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cht_wc_leds_brightness_get +142 drivers/leds/leds-cht-wcove.c

   141	
 > 142	enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
   143	{
   144		struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
   145		unsigned int val;
   146		int ret;
   147	
   148		mutex_lock(&led->mutex);
   149	
   150		ret = regmap_read(led->regmap, led->regs->ctrl, &val);
   151		if (ret < 0) {
   152			dev_err(cdev->dev, "Failed to read LED CTRL reg: %d\n", ret);
   153			ret = 0;
   154			goto done;
   155		}
   156	
   157		val &= led->regs->on_off_mask;
   158		if (val != led->regs->on_val) {
   159			ret = 0;
   160			goto done;
   161		}
   162	
   163		ret = regmap_read(led->regmap, led->regs->pwm, &val);
   164		if (ret < 0) {
   165			dev_err(cdev->dev, "Failed to read LED PWM reg: %d\n", ret);
   166			ret = 0;
   167			goto done;
   168		}
   169	
   170		ret = val;
   171	done:
   172		mutex_unlock(&led->mutex);
   173	
   174		return ret;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
