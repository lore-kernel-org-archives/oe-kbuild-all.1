Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F56D1846
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679311243; x=1710847243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9JVQNkW3vcwSq+kTxOcTDgAmNHFNh5OeyxU+qNtG4Mk=;
  b=N5PtRZH+LLTi/5IalpSWw0gSu/fgg6yXpfmcaqqsmpqCtXu46O+eFgXT
   VLaZXsGvLZ/L/zvd6cGv8WIrzrOyf33X22bn2NAh0ujFPqMBZcShlk3NS
   16UB1rlvXfeAemFnrZtxbWb27wR/iSxG+aYSsfZ7Ok/6F1b0osTplqWPv
   OayFqjvb77TKymIotLBAvlBayO6q1pHo135dWskvmShJSeWVakokHHEsh
   g20OUhKBbxH9w8Xw0/OueN2PWIk4fnU2bySjDhwZ5oiX1AvXVrJF+zLhc
   jzXkI+PKu+xlI6s/g4OytBzNrgP9mPNOOmeMZ4EGL3ONiRYKejw5nWeS7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="318285210"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="318285210"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 04:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="658309899"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="658309899"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Mar 2023 04:20:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peDZA-000B0Q-2F;
	Mon, 20 Mar 2023 11:20:40 +0000
Date: Mon, 20 Mar 2023 19:20:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:file8krnAQ 7/7] drivers/regulator/s5m8767.c:492:24:
 error: implicit declaration of function 'of_get_named_gpio'
Message-ID: <202303201907.dUAS50Cl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git file8krnAQ
head:   d962f3f8e4da347cc9fcda7b887ff7a8f23aad2f
commit: d962f3f8e4da347cc9fcda7b887ff7a8f23aad2f [7/7] regulator: s5m8767: Replace of_gpio.h with what indeed is used
config: xtensa-randconfig-s031-20230319 (https://download.01.org/0day-ci/archive/20230320/202303201907.dUAS50Cl-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=d962f3f8e4da347cc9fcda7b887ff7a8f23aad2f
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci file8krnAQ
        git checkout d962f3f8e4da347cc9fcda7b887ff7a8f23aad2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=xtensa SHELL=/bin/bash drivers/regulator/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303201907.dUAS50Cl-lkp@intel.com/

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

:::::: The code at line 492 was first introduced by commit
:::::: 26aec009f6b61c077c6de1a96cca7a5132851dbe regulator: add device tree support for s5m8767

:::::: TO: Amit Daniel Kachhap <amit.daniel@samsung.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
