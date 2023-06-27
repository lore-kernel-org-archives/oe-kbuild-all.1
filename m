Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B667410F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687857407; x=1719393407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8AGQeGp2SKKHjP5flbXMtPFlEraw98fgXEc4+zck4U4=;
  b=nMcAOaupRVJl6SHPWcYKqGQ6/F4y0rizPDxmYn+vaxUCYxQcY7p+X5GJ
   hBv5IEgLtbP/dMbZir70Lq6TOrFwZQ+INJT6dsnzYxNzzH2VNN5CqP+5+
   x/UCgkoRgf/EuNhyxyq7XcjHmKcJTz4xa5EL07MjvXjVdNEGjhA67QFUT
   mR8rALjiIRfZzlabAKPLYg6a8IfFW8z1rksGz6k7JnzSC7meIaL6uivkW
   KgOKNwrawowEO4sOxPo6dqJgZ+ljwG14QAn/3CztAi/PiXRUcSdREgygK
   6JnGIZNZ0edEJpkY7Sd0FPalm4bDkY25VQxw0iY3ybf00o8advRpE8s5E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341862810"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="341862810"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 02:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="693785760"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="693785760"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Jun 2023 02:16:03 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qE4nq-000Bqn-1x;
	Tue, 27 Jun 2023 09:16:02 +0000
Date: Tue, 27 Jun 2023 17:15:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Kim <ckkim@hardkernel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>,
	Olliver Schinagl <oliver@schinagl.nl>
Subject: [tobetter:odroid-6.4.y 20/46] drivers/pwm/pwm-gpio.c:60:22: warning:
 no previous prototype for 'gpio_pwm_timer'
Message-ID: <202306271725.78God17b-lkp@intel.com>
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
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230627/202306271725.78God17b-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306271725.78God17b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306271725.78God17b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-gpio.c:60:22: warning: no previous prototype for 'gpio_pwm_timer' [-Wmissing-prototypes]
      60 | enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
         |                      ^~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c: In function 'gpio_pwm_probe':
   drivers/pwm/pwm-gpio.c:152:16: error: implicit declaration of function 'of_gpio_named_count' [-Werror=implicit-function-declaration]
     152 |         npwm = of_gpio_named_count(pdev->dev.of_node, "pwm-gpios");
         |                ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/gpio_pwm_timer +60 drivers/pwm/pwm-gpio.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
