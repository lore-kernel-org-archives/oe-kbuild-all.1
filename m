Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34A717D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 09:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675071543; x=1706607543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MXFSf/8swx646UWqQM1CQtJwTYfaEwldJmyARfIu89s=;
  b=FwsuJVfIYRioHXCeerii3h1XygRKJ+mAvKZjEP0b5juLwWTSCE29J8ws
   AHj8OXIL20X917ygFtfX9sgmj31RRHEC0fcBQDfauY9ReMvQcolCJCbaK
   AaEsLBzvWQHUWCyzb9mB5IW4x3xjJsImv85X4TL9fjGKh55y5PrNdz2IE
   jJIWjq+bWVZ+05q59SNulJ6AtuHAo2boMF0Cb8lZxiejOGmfKvc3GrO1h
   rNaaE6pbecqH1dcogxv4Fk40KxxsNlAev1z+alR27uhYq6GZAwboD9TIT
   PfigRm9t/DYAPm3v0Mo3YhlC6nDLH8WYiwlTx6DRHqubCBeCx+wEmsIU+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="327533316"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="327533316"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 01:38:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="664028539"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="664028539"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 01:38:57 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMQcq-0003XQ-2W;
	Mon, 30 Jan 2023 09:38:56 +0000
Date: Mon, 30 Jan 2023 17:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 1/62]
 drivers/memory/atmel-sdramc.c:62:23: error: implicit declaration of function
 'devm_clk_get_enabled'
Message-ID: <202301301717.9jSNTLan-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   6c45fd8472ed235c0a8d400ca5733f12301560f3
commit: e1532c254dadae5209ed94dbbf8b3be753336456 [1/62] memory: atmel-sdramc: Fix missing clk_disable_unprepare in atmel_ramc_probe()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230130/202301301717.9jSNTLan-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=e1532c254dadae5209ed94dbbf8b3be753336456
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout e1532c254dadae5209ed94dbbf8b3be753336456
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/memory/atmel-sdramc.c: In function 'atmel_ramc_probe':
>> drivers/memory/atmel-sdramc.c:62:23: error: implicit declaration of function 'devm_clk_get_enabled' [-Werror=implicit-function-declaration]
      62 |                 clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/memory/atmel-sdramc.c:62:21: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      62 |                 clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
         |                     ^
   drivers/memory/atmel-sdramc.c:68:21: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      68 |                 clk = devm_clk_get_enabled(&pdev->dev, "mpddr");
         |                     ^
   cc1: some warnings being treated as errors


vim +/devm_clk_get_enabled +62 drivers/memory/atmel-sdramc.c

    53	
    54	static int atmel_ramc_probe(struct platform_device *pdev)
    55	{
    56		const struct at91_ramc_caps *caps;
    57		struct clk *clk;
    58	
    59		caps = of_device_get_match_data(&pdev->dev);
    60	
    61		if (caps->has_ddrck) {
  > 62			clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
    63			if (IS_ERR(clk))
    64				return PTR_ERR(clk);
    65		}
    66	
    67		if (caps->has_mpddr_clk) {
    68			clk = devm_clk_get_enabled(&pdev->dev, "mpddr");
    69			if (IS_ERR(clk)) {
    70				pr_err("AT91 RAMC: couldn't get mpddr clock\n");
    71				return PTR_ERR(clk);
    72			}
    73		}
    74	
    75		return 0;
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
