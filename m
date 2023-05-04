Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46477E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683203487; x=1714739487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N+Wd98L+wQd/TEwUSfPz7qRPUgC89VYguwydhrEbxWA=;
  b=aGL6A6HCFb5RvZ448EQ1JfBYmkZlKdBhtKn4OwhzNfL5QcZfWiwdljcS
   ZyvoWOrmr3vR0C17T3+bEetVxqzO7JQBiRvYWBbeoP/pBoI6eYWALq/ir
   WeAgdjKdOZV8HqcnGfEwlGvMu2iuqw8ZwKNNnUJRBVf7RiwcdS0T7NIcV
   Xj6BOCNnc8XQf6fvKn9EMiz4eMswz9Bvn6Re5YkyPo7tX0NdoiFGRy45I
   JO4MYVA2xxfCMuPPgb1qMHhtGRu/X6ny8qW6k3xE/Ox0sEwjPScKW/MQy
   I4jz10AiIPquW/2RWfayqwS9uuxrM9+bFqXc6Yjp9erXi8Fpqo9zWmEGN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414388224"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="414388224"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 05:31:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="871331195"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="871331195"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 May 2023 05:31:25 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puY7I-0002uc-1l;
	Thu, 04 May 2023 12:31:24 +0000
Date: Thu, 4 May 2023 20:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Kim <ckkim@hardkernel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>,
	Olliver Schinagl <oliver@schinagl.nl>
Subject: [tobetter:odroid-6.3.y 5/34] drivers/pwm/pwm-gpio.c:138:10: error:
 'const struct pwm_ops' has no member named 'config'
Message-ID: <202305042019.bW65SnXu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.3.y
head:   6fdc1217984da926f8896235d0c4e8944bf0e5e0
commit: 8c141db0111fb2e9a7e1be087fb259fa11b99b0e [5/34] ODROID-COMMON: pwm: gpio: Add a generic gpio based PWM driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230504/202305042019.bW65SnXu-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/tobetter/linux/commit/8c141db0111fb2e9a7e1be087fb259fa11b99b0e
        git remote add tobetter https://github.com/tobetter/linux
        git fetch --no-tags tobetter odroid-6.3.y
        git checkout 8c141db0111fb2e9a7e1be087fb259fa11b99b0e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/pwm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305042019.bW65SnXu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-gpio.c:60:22: warning: no previous prototype for 'gpio_pwm_timer' [-Wmissing-prototypes]
      60 | enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
         |                      ^~~~~~~~~~~~~~
>> drivers/pwm/pwm-gpio.c:138:10: error: 'const struct pwm_ops' has no member named 'config'
     138 |         .config = gpio_pwm_config,
         |          ^~~~~~
>> drivers/pwm/pwm-gpio.c:138:19: error: initialization of 'int (*)(struct pwm_chip *, struct pwm_device *)' from incompatible pointer type 'int (*)(struct pwm_chip *, struct pwm_device *, int,  int)' [-Werror=incompatible-pointer-types]
     138 |         .config = gpio_pwm_config,
         |                   ^~~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:138:19: note: (near initialization for 'gpio_pwm_ops.request')
>> drivers/pwm/pwm-gpio.c:139:10: error: 'const struct pwm_ops' has no member named 'set_polarity'
     139 |         .set_polarity = gpio_pwm_set_polarity,
         |          ^~~~~~~~~~~~
>> drivers/pwm/pwm-gpio.c:139:25: error: initialization of 'void (*)(struct pwm_chip *, struct pwm_device *)' from incompatible pointer type 'int (*)(struct pwm_chip *, struct pwm_device *, enum pwm_polarity)' [-Werror=incompatible-pointer-types]
     139 |         .set_polarity = gpio_pwm_set_polarity,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:139:25: note: (near initialization for 'gpio_pwm_ops.free')
>> drivers/pwm/pwm-gpio.c:140:10: error: 'const struct pwm_ops' has no member named 'enable'
     140 |         .enable = gpio_pwm_enable,
         |          ^~~~~~
>> drivers/pwm/pwm-gpio.c:140:19: error: initialization of 'int (*)(struct pwm_chip *, struct pwm_device *, struct pwm_capture *, long unsigned int)' from incompatible pointer type 'int (*)(struct pwm_chip *, struct pwm_device *)' [-Werror=incompatible-pointer-types]
     140 |         .enable = gpio_pwm_enable,
         |                   ^~~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:140:19: note: (near initialization for 'gpio_pwm_ops.capture')
>> drivers/pwm/pwm-gpio.c:141:10: error: 'const struct pwm_ops' has no member named 'disable'
     141 |         .disable = gpio_pwm_disable,
         |          ^~~~~~~
>> drivers/pwm/pwm-gpio.c:141:20: error: initialization of 'int (*)(struct pwm_chip *, struct pwm_device *, const struct pwm_state *)' from incompatible pointer type 'void (*)(struct pwm_chip *, struct pwm_device *)' [-Werror=incompatible-pointer-types]
     141 |         .disable = gpio_pwm_disable,
         |                    ^~~~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:141:20: note: (near initialization for 'gpio_pwm_ops.apply')
   drivers/pwm/pwm-gpio.c: In function 'gpio_pwm_probe':
>> drivers/pwm/pwm-gpio.c:152:16: error: implicit declaration of function 'of_gpio_named_count' [-Werror=implicit-function-declaration]
     152 |         npwm = of_gpio_named_count(pdev->dev.of_node, "pwm-gpios");
         |                ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +138 drivers/pwm/pwm-gpio.c

    59	
  > 60	enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
    61	{
    62		struct gpio_pwm_data *gpio_data = container_of(timer,
    63							      struct gpio_pwm_data,
    64							      timer);
    65		if (!gpio_data->run) {
    66			gpio_pwm_off(gpio_data);
    67			gpio_data->pin_on = false;
    68			return HRTIMER_NORESTART;
    69		}
    70	
    71		if (!gpio_data->pin_on) {
    72			hrtimer_forward_now(&gpio_data->timer,
    73					    ns_to_ktime(gpio_data->on_time));
    74			gpio_pwm_on(gpio_data);
    75			gpio_data->pin_on = true;
    76		} else {
    77			hrtimer_forward_now(&gpio_data->timer,
    78					    ns_to_ktime(gpio_data->off_time));
    79			gpio_pwm_off(gpio_data);
    80			gpio_data->pin_on = false;
    81		}
    82	
    83		return HRTIMER_RESTART;
    84	}
    85	
    86	static int gpio_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
    87				    int duty_ns, int period_ns)
    88	{
    89		struct gpio_pwm_data *gpio_data = pwm_get_chip_data(pwm);
    90	
    91		gpio_data->on_time = duty_ns;
    92		gpio_data->off_time = period_ns - duty_ns;
    93	
    94		return 0;
    95	}
    96	
    97	static int gpio_pwm_set_polarity(struct pwm_chip *chip, struct pwm_device *pwm,
    98					 enum pwm_polarity polarity)
    99	{
   100		struct gpio_pwm_data *gpio_data = pwm_get_chip_data(pwm);
   101	
   102		gpio_data->polarity = (polarity != PWM_POLARITY_NORMAL) ? true : false;
   103	
   104		return 0;
   105	}
   106	
   107	static int gpio_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
   108	{
   109		struct gpio_pwm_data *gpio_data = pwm_get_chip_data(pwm);
   110	
   111		if (gpio_data->run)
   112			return -EBUSY;
   113	
   114		gpio_data->run = true;
   115		if (gpio_data->off_time) {
   116			hrtimer_start(&gpio_data->timer, ktime_set(0, 0),
   117				      HRTIMER_MODE_REL);
   118		} else {
   119			if (gpio_data->on_time)
   120				gpio_pwm_on(gpio_data);
   121			else
   122				gpio_pwm_off(gpio_data);
   123		}
   124	
   125		return 0;
   126	}
   127	
   128	static void gpio_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
   129	{
   130		struct gpio_pwm_data *gpio_data = pwm_get_chip_data(pwm);
   131	
   132		gpio_data->run = false;
   133		if (!gpio_data->off_time)
   134			gpio_pwm_off(gpio_data);
   135	}
   136	
   137	static const struct pwm_ops gpio_pwm_ops = {
 > 138		.config = gpio_pwm_config,
 > 139		.set_polarity = gpio_pwm_set_polarity,
 > 140		.enable = gpio_pwm_enable,
 > 141		.disable = gpio_pwm_disable,
   142		.owner = THIS_MODULE,
   143	};
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
https://github.com/intel/lkp-tests
