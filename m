Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC0E18C1C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 14:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687876932; x=1719412932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vgOCLowI46hmsn4W6maAX6qUnU9j6o5CO4ik0efWAqw=;
  b=jzKhkQPD9d6XsL551xl4vL7CIiw+G9N+tSH+Q+Bxqrq8Znot9Re3BITz
   uXCzMdFOjdIySx0cpS3xoUSxU8qpTF8e5Cbd5n15T+WQ1c2xI0kw1s0kf
   zNsAhCpNAOB0JGufWLCcIVCNPhC+9mpFMtJ2NmXdecbbjT81AaO9kGtkg
   9WudSIIRetCj9aDjHgHsCsnNwCIC/MuraSCBTi8en2DaZ5lmuBCtXSYGN
   n0E/Nm/XW3wqGTfFw5s8KjZoaxDjsBt5MlyC8A0UV5oRBtUDQq9wSGbwn
   0mVZoPqfzgMKSZ7Y8C7LYwjA5ZcjKso/dNVm1jKkPmtEhcnM4RUQT0qgO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="346345616"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="346345616"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 07:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="786633694"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="786633694"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Jun 2023 07:42:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qE9tP-000Bz0-2q;
	Tue, 27 Jun 2023 14:42:07 +0000
Date: Tue, 27 Jun 2023 22:41:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Kim <ckkim@hardkernel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>,
	Olliver Schinagl <oliver@schinagl.nl>
Subject: [tobetter:odroid-6.4.y 20/46] drivers/pwm/pwm-gpio.c:152:16: error:
 implicit declaration of function 'of_gpio_named_count'
Message-ID: <202306272211.kxsrxjdO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.4.y
head:   1ad7bf90f68d5e5011908d842042648de70417bf
commit: 9775886c6759faa3066dbfa94f299484e1fcb164 [20/46] ODROID-COMMON: pwm: gpio: Add a generic gpio based PWM driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230627/202306272211.kxsrxjdO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306272211.kxsrxjdO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306272211.kxsrxjdO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pwm/pwm-gpio.c:60:22: warning: no previous prototype for 'gpio_pwm_timer' [-Wmissing-prototypes]
      60 | enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
         |                      ^~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c: In function 'gpio_pwm_probe':
>> drivers/pwm/pwm-gpio.c:152:16: error: implicit declaration of function 'of_gpio_named_count' [-Werror=implicit-function-declaration]
     152 |         npwm = of_gpio_named_count(pdev->dev.of_node, "pwm-gpios");
         |                ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_gpio_named_count +152 drivers/pwm/pwm-gpio.c

   144	
   145	static int gpio_pwm_probe(struct platform_device *pdev)
   146	{
   147		int ret;
   148		struct gpio_pwm_chip *gpio_chip;
   149		int npwm, i;
   150		int hrtimer = 0;
   151	
 > 152		npwm = of_gpio_named_count(pdev->dev.of_node, "pwm-gpios");
   153		if (npwm < 1)
   154			return -ENODEV;
   155	
   156		gpio_chip = devm_kzalloc(&pdev->dev, sizeof(*gpio_chip), GFP_KERNEL);
   157		if (!gpio_chip)
   158			return -ENOMEM;
   159	
   160		gpio_chip->chip.dev = &pdev->dev;
   161		gpio_chip->chip.ops = &gpio_pwm_ops;
   162		gpio_chip->chip.base = -1;
   163		gpio_chip->chip.npwm = npwm;
   164		gpio_chip->chip.of_xlate = of_pwm_xlate_with_flags;
   165		gpio_chip->chip.of_pwm_n_cells = 3;
   166	
   167		ret = pwmchip_add(&gpio_chip->chip);
   168		if (ret < 0) {
   169			dev_err(&pdev->dev, "failed to add PWM chip: %d\n", ret);
   170			return ret;
   171		}
   172	
   173		for (i = 0; i < npwm; i++) {
   174			struct gpio_desc *gpiod;
   175			struct gpio_pwm_data *gpio_data;
   176	
   177			gpiod = devm_gpiod_get_index(&pdev->dev, "pwm", i,
   178						     GPIOD_OUT_LOW);
   179			if (IS_ERR(gpiod)) {
   180				int error;
   181	
   182				error = PTR_ERR(gpiod);
   183				if (error != -EPROBE_DEFER)
   184					dev_err(&pdev->dev,
   185						"failed to get gpio flags, error: %d\n",
   186						error);
   187				return error;
   188			}
   189	
   190			gpio_data = devm_kzalloc(&pdev->dev, sizeof(*gpio_data),
   191						 GFP_KERNEL);
   192	
   193			hrtimer_init(&gpio_data->timer,
   194				     CLOCK_MONOTONIC, HRTIMER_MODE_REL);
   195			gpio_data->timer.function = &gpio_pwm_timer;
   196			gpio_data->gpiod = gpiod;
   197			gpio_data->pin_on = false;
   198			gpio_data->run = false;
   199	
   200			if (hrtimer_is_hres_active(&gpio_data->timer))
   201				hrtimer++;
   202	
   203			pwm_set_chip_data(&gpio_chip->chip.pwms[i], gpio_data);
   204		}
   205		if (!hrtimer) {
   206			dev_warn(&pdev->dev, "unable to use High-Resolution timer,");
   207			dev_warn(&pdev->dev, "%s is restricted to low resolution.",
   208				 DRV_NAME);
   209		}
   210	
   211		platform_set_drvdata(pdev, gpio_chip);
   212	
   213		dev_info(&pdev->dev, "%d gpio pwms loaded\n", npwm);
   214	
   215		return 0;
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
