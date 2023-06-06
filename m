Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66BE3445F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 22:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686089480; x=1717625480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yuAhAJwP1LLCOOcUcFsFlmr4Z+I1VhhNfWqQy8XUNjs=;
  b=TgTVM+m09itS9EZxx/xECiEG3vmfW9C20rjOwf1iWef1Gxp6ZJ145P4Y
   fxuSzunq4+FGk/plgj2/BdUyJLz4rTxYu4mZpF+xP4EIWn+DgQKYZiFqx
   a5EAo9FA9J21qgu6RFfUcjj1cB75f1t1OCZZWJHlwWrS7pcsjnlP++0sB
   Yvq91RlIH0NeLdtLrnyXQNqmFmnEBsQ5PK6x766yiOSamFyZU/pL/NAbd
   2KPFsq9V6YC7NE+4o00TCT7a4JhNhEM/kbMNO6htNWCMduUw+W2fE/Lm1
   UJy7f7R4FdPcsH4voFQkGT7mFJSvrOakQU+iTqxC2uRoNLzT1sZ6W+vPk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="346419301"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="346419301"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 15:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="821846144"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="821846144"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2023 15:11:16 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6etX-0005nY-2g;
	Tue, 06 Jun 2023 22:11:15 +0000
Date: Wed, 7 Jun 2023 06:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/4] input: touchscreen: add I2C support for Goodix
 Berlin Touchscreen IC
Message-ID: <202306070503.ox5mOdfJ-lkp@intel.com>
References: <20230606-topic-goodix-berlin-upstream-initial-v1-3-4a0741b8aefd@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606-topic-goodix-berlin-upstream-initial-v1-3-4a0741b8aefd@linaro.org>

Hi Neil,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6db29e14f4fb7bce9eb5290288e71b05c2b0d118]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/dt-bindings-input-document-Goodix-Berlin-Touchscreen-IC/20230606-223332
base:   6db29e14f4fb7bce9eb5290288e71b05c2b0d118
patch link:    https://lore.kernel.org/r/20230606-topic-goodix-berlin-upstream-initial-v1-3-4a0741b8aefd%40linaro.org
patch subject: [PATCH RFC 3/4] input: touchscreen: add I2C support for Goodix Berlin Touchscreen IC
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230607/202306070503.ox5mOdfJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 6db29e14f4fb7bce9eb5290288e71b05c2b0d118
        b4 shazam https://lore.kernel.org/r/20230606-topic-goodix-berlin-upstream-initial-v1-3-4a0741b8aefd@linaro.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/input/touchscreen/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306070503.ox5mOdfJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/goodix_berlin_core.c:816:5: warning: no previous prototype for 'goodix_berlin_pm_suspend' [-Wmissing-prototypes]
     816 | int goodix_berlin_pm_suspend(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/goodix_berlin_core.c:823:5: warning: no previous prototype for 'goodix_berlin_pm_resume' [-Wmissing-prototypes]
     823 | int goodix_berlin_pm_resume(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/goodix_berlin_pm_suspend +816 drivers/input/touchscreen/goodix_berlin_core.c

fe0f04f551c222 Neil Armstrong 2023-06-06  815  
fe0f04f551c222 Neil Armstrong 2023-06-06 @816  int goodix_berlin_pm_suspend(struct device *dev)
fe0f04f551c222 Neil Armstrong 2023-06-06  817  {
fe0f04f551c222 Neil Armstrong 2023-06-06  818  	struct goodix_berlin_core *cd = dev_get_drvdata(dev);
fe0f04f551c222 Neil Armstrong 2023-06-06  819  
fe0f04f551c222 Neil Armstrong 2023-06-06  820  	return goodix_berlin_suspend(cd);
fe0f04f551c222 Neil Armstrong 2023-06-06  821  }
fe0f04f551c222 Neil Armstrong 2023-06-06  822  
fe0f04f551c222 Neil Armstrong 2023-06-06 @823  int goodix_berlin_pm_resume(struct device *dev)
fe0f04f551c222 Neil Armstrong 2023-06-06  824  {
fe0f04f551c222 Neil Armstrong 2023-06-06  825  	struct goodix_berlin_core *cd = dev_get_drvdata(dev);
fe0f04f551c222 Neil Armstrong 2023-06-06  826  
fe0f04f551c222 Neil Armstrong 2023-06-06  827  	return goodix_berlin_resume(cd);
fe0f04f551c222 Neil Armstrong 2023-06-06  828  }
fe0f04f551c222 Neil Armstrong 2023-06-06  829  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
