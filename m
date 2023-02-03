Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5C04C60
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675432943; x=1706968943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0DUDY4zwt7ERztwpl19yZeSzNtvp36ha50/TbqkbR/I=;
  b=AiVRYl9IpAMhdxmCkN6t4VF8BWHwJ48CDPLETIe2febT1S7Sb1OuuMX0
   2YNgWKX+CfUe3OOBdfHsy23sUGdDujIC8yPXTvRFlmLhSbu9qo4qYFJI4
   38e3RcXVpnnR0bLwT/ZQ4uKUldb2EkZhxTg5v9s8OFS94KB8v2SNJ7stz
   YBqsPc9sQ6D3RbQT90eGAoFN+3XCFToK0esbNHCTzfJsdzFCCPtxaw/lM
   /9QUpVN4+gp3CIKSgqru4Q2Kkdm6eMAITxn18StmR3uVNQB+i6Y9qB8/B
   fwQ7OiFEqI+WkWyNHCLROVMp1yLnRUk9DdJrZGSFOfIBRX8Mn5uAuSi7H
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="356094055"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="356094055"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 06:02:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729272222"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="729272222"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 06:02:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNwdd-0000XN-22;
	Fri, 03 Feb 2023 14:02:01 +0000
Date: Fri, 3 Feb 2023 22:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.2.y 20/62]
 drivers/power/reset/odroid-reboot.c:141:17: error: 'arm_pm_restart'
 undeclared; did you mean 'alarm_restart'?
Message-ID: <202302032219.iJh29GDz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.2.y
head:   f4d864771f25fc8eaf9aa7e692d8456c1ddbebfd
commit: 41551f3278105277ecac4d550f7a5c6c8cb9c821 [20/62] ODROID-COMMON: power:reset: Add odroid support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230203/202302032219.iJh29GDz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/tobetter/linux/commit/41551f3278105277ecac4d550f7a5c6c8cb9c821
        git remote add tobetter https://github.com/tobetter/linux
        git fetch --no-tags tobetter odroid-6.2.y
        git checkout 41551f3278105277ecac4d550f7a5c6c8cb9c821
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/power/reset/odroid-reboot.c:63:6: warning: no previous prototype for 'odroid_card_reset' [-Wmissing-prototypes]
      63 | void odroid_card_reset(void)
         |      ^~~~~~~~~~~~~~~~~
   drivers/power/reset/odroid-reboot.c: In function 'odroid_restart_probe':
>> drivers/power/reset/odroid-reboot.c:141:17: error: 'arm_pm_restart' undeclared (first use in this function); did you mean 'alarm_restart'?
     141 |                 arm_pm_restart = do_odroid_restart;
         |                 ^~~~~~~~~~~~~~
         |                 alarm_restart
   drivers/power/reset/odroid-reboot.c:141:17: note: each undeclared identifier is reported only once for each function it appears in


vim +141 drivers/power/reset/odroid-reboot.c

   133	
   134	static int odroid_restart_probe(struct platform_device *pdev)
   135	{
   136		struct device_node *of_node;
   137		u32 id;
   138	
   139		if (!of_property_read_u32(pdev->dev.of_node, "sys_reset", &id)) {
   140			psci_function_id_restart = id;
 > 141			arm_pm_restart = do_odroid_restart;
   142		}
   143	
   144		if (!of_property_read_u32(pdev->dev.of_node, "sys_poweroff", &id)) {
   145			psci_function_id_poweroff = id;
   146			pm_power_off = do_odroid_poweroff;
   147		}
   148	
   149		of_node = pdev->dev.of_node;
   150	
   151		sd_vqsw = of_get_named_gpio(of_node, "sd-vqsw", 0);
   152		if (!gpio_is_valid(sd_vqsw)) sd_vqsw = 0;
   153	
   154		sd_vmmc = of_get_named_gpio(of_node, "sd-vmmc", 0);
   155		if (!gpio_is_valid(sd_vmmc)) sd_vmmc = 0;
   156	
   157		sd_vqen = of_get_named_gpio(of_node, "sd-vqen", 0);
   158		if (!gpio_is_valid(sd_vqen)) sd_vqen = 0;
   159	
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
