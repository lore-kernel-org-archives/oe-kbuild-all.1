Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F78C06
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jan 2023 21:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674076756; x=1705612756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jd1ak5rQrmFW+qaGEhSzJsl37fpuIwNnEfgYaMnQWNA=;
  b=YvoU9B7Tp9dOCkFfobAw2c3hwY1i8j572lMozUAhn1UfwbyNQibUrv+k
   4xGBjA/Hqr6nsKMO9KT1+YuK98xgY0hqn7713TmFPcDFvq7iq1ri6dVbI
   n0CBo2oyG+MmZR2J7tzWpVwZwsA0jOqxwDUF/qCOowFY0gBaguz50F9NW
   9CBYvdwf3VRx3QrqHLO6E01gOOR89dJRIX4SxJfgKYAQgmAqI5A0i+s6C
   Z3q93v0cyUyfKCiZg1YVJM7U5fFB2FeesqG8h/VNVLf1X18jATSJfpJxc
   QdMqAIoUA6t4ri6Ln8JadCE7FxayCJFAX9i1Vwbz4Wlz3c56wu4DbUdeR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411344100"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="411344100"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 13:19:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="783827000"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="783827000"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Jan 2023 13:19:14 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIFpy-0000jG-01;
	Wed, 18 Jan 2023 21:19:14 +0000
Date: Thu, 19 Jan 2023 05:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 9/18]
 drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c:266:45: warning:
 format '%d' expects a matching 'int' argument
Message-ID: <202301190515.TYbIj7kG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   ec704d01aa08b02c9e4dd6449672d95b5f5f93ea
commit: ef5094072eea64e551e2dc093bb05b58072b9fba [9/18] CHROMIUM: mali: Uprev to r40p0 EAC release
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230119/202301190515.TYbIj7kG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout ef5094072eea64e551e2dc093bb05b58072b9fba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/arm/mali/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   cc1: warning: kbuild/src/consumer/drivers/gpu/arm/mali: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/gpu/arm/mali/mali_kbase_linux.h:30,
                    from drivers/gpu/arm/mali/mali_kbase.h:49,
                    from drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c:22:
   drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c: In function 'kbase_devfreq_target':
>> drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c:266:45: warning: format '%d' expects a matching 'int' argument [-Wformat=]
     266 |                         dev_err(kbdev->dev, "Failed to increase voltage: %d\n");
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c:266:25: note: in expansion of macro 'dev_err'
     266 |                         dev_err(kbdev->dev, "Failed to increase voltage: %d\n");
         |                         ^~~~~~~
   drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c:266:75: note: format string is defined here
     266 |                         dev_err(kbdev->dev, "Failed to increase voltage: %d\n");
         |                                                                          ~^
         |                                                                           |
         |                                                                           int
   drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c:284:45: warning: format '%d' expects a matching 'int' argument [-Wformat=]
     284 |                         dev_err(kbdev->dev, "Failed to decrease voltage: %d\n");
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c:284:25: note: in expansion of macro 'dev_err'
     284 |                         dev_err(kbdev->dev, "Failed to decrease voltage: %d\n");
         |                         ^~~~~~~
   drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c:284:75: note: format string is defined here
     284 |                         dev_err(kbdev->dev, "Failed to decrease voltage: %d\n");
         |                                                                          ~^
         |                                                                           |
         |                                                                           int


vim +266 drivers/gpu/arm/mali/backend/gpu/mali_kbase_devfreq.c

   221	
   222	#if IS_ENABLED(CONFIG_MTK_SVS)
   223		/*
   224		 * Only update if there is a change of frequency or voltage
   225		 */
   226		if (kbdev->current_nominal_freq == nominal_freq &&
   227			kbdev->current_voltages[0] == volts[0]) {
   228			*target_freq = nominal_freq;
   229			return 0;
   230		}
   231	
   232		kbase_devfreq_opp_translate(kbdev, nominal_freq, &core_mask,
   233					    freqs, unused_volts);
   234	#else
   235		/*
   236		 * Only update if there is a change of frequency
   237		 */
   238		if (kbdev->current_nominal_freq == nominal_freq) {
   239			*target_freq = nominal_freq;
   240			return 0;
   241		}
   242	
   243		kbase_devfreq_opp_translate(kbdev, nominal_freq, &core_mask,
   244					    freqs, volts);
   245	#endif
   246		voltage_range_check(kbdev, volts);
   247	
   248	#if IS_ENABLED(CONFIG_REGULATOR)
   249		/* Regulators and clocks work in pairs: every clock has a regulator,
   250		 * and we never expect to have more regulators than clocks.
   251		 *
   252		 * We always need to increase the voltage before increasing the number
   253		 * of shader cores and the frequency of a regulator/clock pair,
   254		 * otherwise the clock wouldn't have enough power to perform
   255		 * the transition.
   256		 *
   257		 * It's always safer to decrease the number of shader cores and
   258		 * the frequency before decreasing voltage of a regulator/clock pair,
   259		 * otherwise the clock could have problematic operation if it is
   260		 * deprived of the necessary power to sustain its current frequency
   261		 * (even if that happens for a short transition interval).
   262		 */
   263		if (kbdev->current_voltages[0] < volts[0]) {
   264			err = set_voltages(kbdev, volts, true);
   265			if (err) {
 > 266				dev_err(kbdev->dev, "Failed to increase voltage: %d\n");
   267				return err;
   268			}
   269		}
   270	#endif
   271	
   272		err = set_frequency(kbdev, freqs);
   273		if (err) {
   274			dev_err(dev, "Failed to set clocks: %d\n", err);
   275			return err;
   276		}
   277	
   278		kbase_devfreq_set_core_mask(kbdev, core_mask);
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
