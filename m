Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E0DE4DB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 23:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680823820; x=1712359820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VAgTwQvsxO1SnXPSPPbHvJnrKouST1yDE7gVS/gJI4k=;
  b=O+EQUaZEuxOYDQIteslTTKxSiXr92bRBZcR4R2n8LIcPucF5yJsjJslL
   t7Dxy92Z8+2VPO+vdH2SmshKlQzUmrl5PSi2pdqqquAJ8G3rGUBwksGhs
   1yKvHTmr9fqTGKgExnGA5QuzN4wu89NcgYi+nRd8jnJEmeou0OofEzoMw
   hCTld1F+6O/yVrcsj7z/Fxioyc5gML91q1qkQ/6l9+fXlcsLO13TX2W4A
   nJ30YAKkWVenEYLsfRPXwcfIsThZlSPuWD22PF7n6nXzs5R2HCjgBw++R
   qCkPm5Dy0FSwL8xP3ozBvceqwGQuNonEh1OVmxm/fqiTDk+mx4HbGU9bE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370703639"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="370703639"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 16:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="719879220"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="719879220"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 16:30:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkZ3Z-000RuA-1N;
	Thu, 06 Apr 2023 23:30:17 +0000
Date: Fri, 7 Apr 2023 07:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Kim <ckkim@hardkernel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>,
	Olliver Schinagl <oliver@schinagl.nl>
Subject: [tobetter:odroid-6.1.y 20/90] drivers/pwm/pwm-gpio.c:60:22: warning:
 no previous prototype for 'gpio_pwm_timer'
Message-ID: <202304070726.uXLFYERM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   3a163dc2f239e1dbfed4cdb9ee515ef542684d1f
commit: 459931baf254b27d2ec9a732b41bf2bff9e1c1d2 [20/90] ODROID-COMMON: pwm: gpio: Add a generic gpio based PWM driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230407/202304070726.uXLFYERM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/tobetter/linux/commit/459931baf254b27d2ec9a732b41bf2bff9e1c1d2
        git remote add tobetter https://github.com/tobetter/linux
        git fetch --no-tags tobetter odroid-6.1.y
        git checkout 459931baf254b27d2ec9a732b41bf2bff9e1c1d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/pwm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070726.uXLFYERM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-gpio.c:60:22: warning: no previous prototype for 'gpio_pwm_timer' [-Wmissing-prototypes]
      60 | enum hrtimer_restart gpio_pwm_timer(struct hrtimer *timer)
         |                      ^~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:138:10: error: 'const struct pwm_ops' has no member named 'config'
     138 |         .config = gpio_pwm_config,
         |          ^~~~~~
   drivers/pwm/pwm-gpio.c:138:19: error: initialization of 'int (*)(struct pwm_chip *, struct pwm_device *)' from incompatible pointer type 'int (*)(struct pwm_chip *, struct pwm_device *, int,  int)' [-Werror=incompatible-pointer-types]
     138 |         .config = gpio_pwm_config,
         |                   ^~~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:138:19: note: (near initialization for 'gpio_pwm_ops.request')
   drivers/pwm/pwm-gpio.c:139:10: error: 'const struct pwm_ops' has no member named 'set_polarity'
     139 |         .set_polarity = gpio_pwm_set_polarity,
         |          ^~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:139:25: error: initialization of 'void (*)(struct pwm_chip *, struct pwm_device *)' from incompatible pointer type 'int (*)(struct pwm_chip *, struct pwm_device *, enum pwm_polarity)' [-Werror=incompatible-pointer-types]
     139 |         .set_polarity = gpio_pwm_set_polarity,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:139:25: note: (near initialization for 'gpio_pwm_ops.free')
   drivers/pwm/pwm-gpio.c:140:10: error: 'const struct pwm_ops' has no member named 'enable'
     140 |         .enable = gpio_pwm_enable,
         |          ^~~~~~
   drivers/pwm/pwm-gpio.c:140:19: error: initialization of 'int (*)(struct pwm_chip *, struct pwm_device *, struct pwm_capture *, long unsigned int)' from incompatible pointer type 'int (*)(struct pwm_chip *, struct pwm_device *)' [-Werror=incompatible-pointer-types]
     140 |         .enable = gpio_pwm_enable,
         |                   ^~~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:140:19: note: (near initialization for 'gpio_pwm_ops.capture')
   drivers/pwm/pwm-gpio.c:141:10: error: 'const struct pwm_ops' has no member named 'disable'
     141 |         .disable = gpio_pwm_disable,
         |          ^~~~~~~
   drivers/pwm/pwm-gpio.c:141:20: error: initialization of 'int (*)(struct pwm_chip *, struct pwm_device *, const struct pwm_state *)' from incompatible pointer type 'void (*)(struct pwm_chip *, struct pwm_device *)' [-Werror=incompatible-pointer-types]
     141 |         .disable = gpio_pwm_disable,
         |                    ^~~~~~~~~~~~~~~~
   drivers/pwm/pwm-gpio.c:141:20: note: (near initialization for 'gpio_pwm_ops.apply')
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
https://github.com/intel/lkp-tests
