Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2CC10E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 10:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676110266; x=1707646266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=glsnQFZXEDvVmmLR9qIpigu2VLbon7V4oPvPNOTcEiM=;
  b=cj7vnxG2JFsHHwszilndliUSgrv+A6vTIR2qC4Q1bdJVDdueIegmVmXv
   IPDG+QoT7Df4sjj9wykVb80AjYl1hdvuJZEgmhgfOf7BCIRVusG5NHe7+
   4WIUZYbj5M+bQYndQp8KBscjJU1Cu5hfdnOMfXtRkcS+0D6pa+1FNNrtO
   ch5miB7YAxMWMKHN7ig277Il+IYRu9/v0ziwWNYlFrUqxAXEnrOQELz5r
   lvNZ5B0xZGNRgUxJiC1KKN1BsTcuUkTMKxvMLNYtr/ax8hTNovQCf4ow8
   6LxSvaJj0KKJRL4+3f1VLDrs99Vo9FH9JR3+1i65rRgfrEG1WrkUbeAib
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="328296097"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="328296097"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 02:11:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="997204915"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="997204915"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Feb 2023 02:11:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQmqW-0006Pn-17;
	Sat, 11 Feb 2023 10:11:04 +0000
Date: Sat, 11 Feb 2023 18:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] power: reset: add Odroid Go Ultra poweroff driver
Message-ID: <202302111754.O96B3LLL-lkp@intel.com>
References: <20230126-b4-odroid-go-ultra-poweroff-v3-1-0a7fd3d5c4b3@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126-b4-odroid-go-ultra-poweroff-v3-1-0a7fd3d5c4b3@linaro.org>

Hi Neil,

I love your patch! Yet something to improve:

[auto build test ERROR on 38d2b86a665b5e86371a1a30228bce259aa6c101]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/power-reset-add-Odroid-Go-Ultra-poweroff-driver/20230210-180559
base:   38d2b86a665b5e86371a1a30228bce259aa6c101
patch link:    https://lore.kernel.org/r/20230126-b4-odroid-go-ultra-poweroff-v3-1-0a7fd3d5c4b3%40linaro.org
patch subject: [PATCH v3] power: reset: add Odroid Go Ultra poweroff driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230211/202302111754.O96B3LLL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f7c8ef7b6c2a6c706640a6d1afe097d08f9dac00
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Neil-Armstrong/power-reset-add-Odroid-Go-Ultra-poweroff-driver/20230210-180559
        git checkout f7c8ef7b6c2a6c706640a6d1afe097d08f9dac00
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111754.O96B3LLL-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/power/reset/odroid-go-ultra-poweroff.o: in function `odroid_go_ultra_poweroff_probe':
>> odroid-go-ultra-poweroff.c:(.text+0x16a): undefined reference to `i2c_find_device_by_fwnode'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM
   Depends on [n]: !MMU [=y]
   Selected by [y]:
   - SUN20I_PPU [=y] && (ARCH_SUNXI || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
