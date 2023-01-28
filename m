Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACF56FDC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 18:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674930412; x=1706466412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4KNappFalFtIaOClNuSn0sO255tx3CebkTIHnogar20=;
  b=L02U8i81CUf833N6KhwYHrpyz+5QR7w6pqThnf7/qsiS0vFZXH1lKH8g
   AsIvs1d+WMsGyn0peWOEbcDAmznthUWr00PndLX5VFXpnoQpDBB4sParm
   eQrhUKk7ZSKbFJdeiOTncHhfu5J6I6xlGYjJoDMsC41B1QvWfMpVfNTFl
   Pb+2A8VTZwCMjgScnpyW487BuwSC5r1VJjgg7JQ4ag96hugz03PTuay6L
   OSNDtWAfeEKMZhupYx1iF0BLtCaYwLhfFmbvIbZXUocnIVqZpAzRwYHTW
   M6C3cFjhn0sTc+sQz9/Gj8Ca6PKqWjW11qQObkZPswMXWyLCX03Cwan88
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="306969659"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="306969659"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 10:26:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="992421348"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="992421348"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2023 10:26:51 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLpuX-0000zB-2N;
	Sat, 28 Jan 2023 18:26:45 +0000
Date: Sun, 29 Jan 2023 02:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] power: reset: add Odroid Go Ultra poweroff driver
Message-ID: <202301290233.RQ7ZdXIh-lkp@intel.com>
References: <20230126-b4-odroid-go-ultra-poweroff-v2-1-a8c50866f4ac@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126-b4-odroid-go-ultra-poweroff-v2-1-a8c50866f4ac@linaro.org>

Hi Neil,

I love your patch! Yet something to improve:

[auto build test ERROR on 1b929c02afd37871d5afb9d498426f83432e71c2]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/power-reset-add-Odroid-Go-Ultra-poweroff-driver/20230128-102059
base:   1b929c02afd37871d5afb9d498426f83432e71c2
patch link:    https://lore.kernel.org/r/20230126-b4-odroid-go-ultra-poweroff-v2-1-a8c50866f4ac%40linaro.org
patch subject: [PATCH v2] power: reset: add Odroid Go Ultra poweroff driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230129/202301290233.RQ7ZdXIh-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/633aeb721d45b3a71cfb06cb087ac36b3dc9f41a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Neil-Armstrong/power-reset-add-Odroid-Go-Ultra-poweroff-driver/20230128-102059
        git checkout 633aeb721d45b3a71cfb06cb087ac36b3dc9f41a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/power/reset/odroid-go-ultra-poweroff.o: in function `odroid_go_ultra_poweroff_get_pmic_drvdata':
>> odroid-go-ultra-poweroff.c:(.text.odroid_go_ultra_poweroff_get_pmic_drvdata+0x4c): undefined reference to `of_find_i2c_device_by_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
