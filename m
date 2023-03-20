Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DA91104
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 07:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679297197; x=1710833197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=06J7Y2rs2tuW/YrRPY3xhmrbV9xJIcBOEvwIEKLHRM0=;
  b=Vhb1HVP/YFagyO07AwGlcC3XdbKppqxidlxsimpcjwYE+xgFNWYtPXcO
   e35o583978535XAKLDnlQB2SSsfo50aoBioXoxUfG75fFYM4UyjmEAZde
   uAHbLYIOvSnvMlmkDxiLxLP/EKyTVdcyUADhuk+jiOKbMUE7h7yBjVJvT
   twCZlScZg3BUr7gG9gDkDJ9qJ20vRn5+Ow7a5rrsvZeuqiouZofV7Kgfk
   1+mZtluw9SWvAt66jPQ/dDfzgWiS13WnCXi1Oda8RYWZSVkStOZ3QwYMK
   3c7pXpalrk54ueflRcrqNtYiA69/L6MYfnFTdwKnQXZHbLvXj3CoLWL2i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="340951933"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="340951933"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 00:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="804806855"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="804806855"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Mar 2023 00:26:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pe9ub-000Ata-1M;
	Mon, 20 Mar 2023 07:26:33 +0000
Date: Mon, 20 Mar 2023 15:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>
Subject: [steev:lenovo-x13s-v6.3-rc3 71/147] include/linux/pm_domain.h:283:1:
 error: expected identifier or '(' before '{' token
Message-ID: <202303201512.Cx07LMNL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.3-rc3
head:   ef360014219c07f36332164ae8f2ac38c2c09084
commit: 857b3cd612c8aee45d7a3ce0f344ddbfa61f92a1 [71/147] PM: domains: Allow power off queuing from providers
config: openrisc-randconfig-r025-20230319 (https://download.01.org/0day-ci/archive/20230320/202303201512.Cx07LMNL-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/857b3cd612c8aee45d7a3ce0f344ddbfa61f92a1
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev lenovo-x13s-v6.3-rc3
        git checkout 857b3cd612c8aee45d7a3ce0f344ddbfa61f92a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/gpu/drm/display/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303201512.Cx07LMNL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/display/drm_dp_aux_bus.c:19:
>> include/linux/pm_domain.h:283:1: error: expected identifier or '(' before '{' token
     283 | {
         | ^


vim +283 include/linux/pm_domain.h

   281	
   282	void genpd_queue_power_off_work(struct generic_pm_domain *genpd);
 > 283	{
   284		return -EOPNOTSUPP;
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
