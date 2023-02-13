Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76B7185A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 03:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676260325; x=1707796325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5YEz5DOrPHqZuOKP7DL0+J+rnCWlA4aUm4oh+X8z1OI=;
  b=hWjRNMjx/Tf/Al6scmOvbW+DDICquYLa9nfruDS1PklzIKhyesqj0jbm
   jKmH/+DwJgnVAlMzYoE04b0uKfHTO/Y4h6Ccm5KJOYOdcO2g9i2qBu5ve
   VE26Im6hSOCJFej/iT3/E60Huva1WU8gvcY0XOxTxmLv6oen9tRzNnTml
   4InLFyv56z1HAa/Nk8NYGevUMRK1DZzxAM+KXXGVeh6rNDqPHKxJ8Zyjy
   wqCG91oOw6r0Lr2zrmh8aCxpN5UayEZR4ldcEikxnWIjKEeWY/Jahc1bz
   ZeE9qYLOegHkJIR4ff9jhsnrC0LX3SREWKwHu+YOXRwhnTxJm3yNxj9Cy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="395411238"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="395411238"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 19:52:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="914167203"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="914167203"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Feb 2023 19:52:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRPsp-0007Xh-2T;
	Mon, 13 Feb 2023 03:52:03 +0000
Date: Mon, 13 Feb 2023 11:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sverdlin:ep93xx-snd-wip 16/54]
 drivers/power/reset/ep93xx-restart.c:22:9: error: implicit declaration of
 function 'ep93xx_devcfg_set_clear'
Message-ID: <202302131137.bQ1bfdyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sverdlin/linux ep93xx-snd-wip
head:   f6629f68e76810ddf6df2e304cd0750c43883026
commit: a58e3cf6da4cbcf3ad2c679ded3f1b81a33f9c1e [16/54] power: reset: Add a driver for the ep93xx reset
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230213/202302131137.bQ1bfdyh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/sverdlin/linux/commit/a58e3cf6da4cbcf3ad2c679ded3f1b81a33f9c1e
        git remote add sverdlin https://github.com/sverdlin/linux
        git fetch --no-tags sverdlin ep93xx-snd-wip
        git checkout a58e3cf6da4cbcf3ad2c679ded3f1b81a33f9c1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131137.bQ1bfdyh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/reset/ep93xx-restart.c: In function 'ep93xx_restart_handle':
>> drivers/power/reset/ep93xx-restart.c:22:9: error: implicit declaration of function 'ep93xx_devcfg_set_clear' [-Werror=implicit-function-declaration]
      22 |         ep93xx_devcfg_set_clear(EP93XX_SYSCON_DEVCFG_SWRST, 0x00);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ep93xx_devcfg_set_clear +22 drivers/power/reset/ep93xx-restart.c

    17	
    18	static int ep93xx_restart_handle(struct notifier_block *this,
    19					 unsigned long mode, void *cmd)
    20	{
    21		/* Issue the reboot */
  > 22		ep93xx_devcfg_set_clear(EP93XX_SYSCON_DEVCFG_SWRST, 0x00);
    23		ep93xx_devcfg_set_clear(0x00, EP93XX_SYSCON_DEVCFG_SWRST);
    24	
    25		mdelay(1000);
    26	
    27		pr_emerg("Unable to restart system\n");
    28		return NOTIFY_DONE;
    29	}
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
