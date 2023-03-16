Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A981C33CC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678975061; x=1710511061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s7hHsNvEy9sL2ZtKAMVyiclWXWrI1obFzENceJn78mw=;
  b=JgLDVs3/2s6dPqFIx/MGCEZkHJFPN3D9WXqav6h8vLPuY0Vw9Gl6EXIj
   zwKwJqeoTlowNXd/gqR8HgUEaURRt9Pj4e5WzKXtMteclgcuYd3Y2n7PW
   iaIYC7hdwZ41CDvt3OcyaU8PGyWoh/Jhlj/8jvcegISXTZHSXGtYu0Q9A
   bhw4ULNv3X5lDyOffDAIc982mYLFcQ0Cn99En16BGMqvU5QxpRvDlIy78
   TdcdvthjZuvTimHan96Ambun8HzB/S5V4yduRg6LZrcWgyTibT9blMakP
   uhNS8iOw7AINHVvLJpBhNjaXaOuGMpYdtWJoTr9iZ0syuRAUPq3oeVXgw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335476340"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="335476340"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 06:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823253011"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="823253011"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2023 06:57:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pco6k-0008YQ-36;
	Thu, 16 Mar 2023 13:57:30 +0000
Date: Thu, 16 Mar 2023 21:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/1] regulator: s5m8767: Replace of_gpio.h with what
 indeed is used
Message-ID: <202303162117.0C6F17Nm-lkp@intel.com>
References: <20230316120113.86421-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316120113.86421-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on linus/master v6.3-rc2 next-20230316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/regulator-s5m8767-Replace-of_gpio-h-with-what-indeed-is-used/20230316-200231
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20230316120113.86421-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] regulator: s5m8767: Replace of_gpio.h with what indeed is used
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230316/202303162117.0C6F17Nm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8e00ea5df88a02a09c2e6b669ebf3d1d7ead9adc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/regulator-s5m8767-Replace-of_gpio-h-with-what-indeed-is-used/20230316-200231
        git checkout 8e00ea5df88a02a09c2e6b669ebf3d1d7ead9adc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303162117.0C6F17Nm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/s5m8767.c: In function 's5m8767_pmic_dt_parse_dvs_gpio':
>> drivers/regulator/s5m8767.c:492:24: error: implicit declaration of function 'of_get_named_gpio' [-Werror=implicit-function-declaration]
     492 |                 gpio = of_get_named_gpio(pmic_np,
         |                        ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_get_named_gpio +492 drivers/regulator/s5m8767.c

ee1e0994ab1bd3 Krzysztof Kozlowski 2014-01-24  482  
ee1e0994ab1bd3 Krzysztof Kozlowski 2014-01-24  483  
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  484  #ifdef CONFIG_OF
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  485  static int s5m8767_pmic_dt_parse_dvs_gpio(struct sec_pmic_dev *iodev,
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  486  			struct sec_platform_data *pdata,
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  487  			struct device_node *pmic_np)
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  488  {
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  489  	int i, gpio;
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  490  
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  491  	for (i = 0; i < 3; i++) {
26aec009f6b61c Amit Daniel Kachhap 2013-02-03 @492  		gpio = of_get_named_gpio(pmic_np,
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  493  					"s5m8767,pmic-buck-dvs-gpios", i);
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  494  		if (!gpio_is_valid(gpio)) {
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  495  			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  496  			return -EINVAL;
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  497  		}
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  498  		pdata->buck_gpios[i] = gpio;
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  499  	}
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  500  	return 0;
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  501  }
26aec009f6b61c Amit Daniel Kachhap 2013-02-03  502  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
