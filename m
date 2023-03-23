Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8994517CE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 04:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679545270; x=1711081270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZV9NnnYZTgLVq1bGedCD3RXOPkA6f/W1MpRoZf3cvYg=;
  b=aSPlUZsuriujKkqz8o6BJzkZQ3qyMGNDf10Kld35ZXtaX3XoIhCqQkco
   GlPancxelaC4jmg8ZZRisghxLcunI0zJamh/zhEYKZ3gmQjJxdRnBy/Fw
   uyBI+axwVvPx4MGqbXBdiA3EaM/aj/KdnLQ8V5RET5v7peJl9s2CcPF4E
   B2W11NveVAUpJgjqo/SEDyfUmo5lo1a2VfB5hxWuv1rMEdvqN3xOaQzVW
   vp28U2FVS3mim3XWJTzRjUyj2/udf8RDevn1dcUz2m9K5SL9AIyGwZRzf
   K3upb9gpuM7Wfv2+82rzRp0FDLLQW1nkX7lMeEmhWzijt9ooy5UuZUEV1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340930839"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="340930839"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 21:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682166142"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="682166142"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Mar 2023 21:21:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfCRn-000Dwm-2r;
	Thu, 23 Mar 2023 04:21:07 +0000
Date: Thu, 23 Mar 2023 12:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [sverdlin:ep93xx-snd-wip 15/48] drivers/clk/clk-ep93xx.c:152:9:
 error: implicit declaration of function 'ep93xx_syscon_swlocked_write'
Message-ID: <202303231215.pmA71zkc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sverdlin/linux ep93xx-snd-wip
head:   ba6048c19f4e119e9d76024c66e205a7f6750063
commit: 2fc38e2eeec106344c52265d8102c44aad273379 [15/48] clk: ep93xx: add DT support for Cirrus EP93xx
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230323/202303231215.pmA71zkc-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/sverdlin/linux/commit/2fc38e2eeec106344c52265d8102c44aad273379
        git remote add sverdlin https://github.com/sverdlin/linux
        git fetch --no-tags sverdlin ep93xx-snd-wip
        git checkout 2fc38e2eeec106344c52265d8102c44aad273379
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/clk/ drivers/power/reset/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231215.pmA71zkc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/clk-ep93xx.c: In function 'ep93xx_clk_enable':
>> drivers/clk/clk-ep93xx.c:152:9: error: implicit declaration of function 'ep93xx_syscon_swlocked_write' [-Werror=implicit-function-declaration]
     152 |         ep93xx_syscon_swlocked_write(val, psc->reg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-ep93xx.c: In function 'ep93xx_ddiv_set_rate':
   drivers/clk/clk-ep93xx.c:340:23: warning: variable 'best_rate' set but not used [-Wunused-but-set-variable]
     340 |         unsigned long best_rate = 0, actual_rate, mclk_rate, rate_err = -1;
         |                       ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ep93xx_syscon_swlocked_write +152 drivers/clk/clk-ep93xx.c

   139	
   140	static int ep93xx_clk_enable(struct clk_hw *hw)
   141	{
   142		struct clk_psc *psc = to_clk_psc(hw);
   143		unsigned long flags = 0;
   144		u32 val;
   145	
   146		if (psc->lock)
   147			spin_lock_irqsave(psc->lock, flags);
   148	
   149		ep93xx_regmap_read(psc->reg, &val);
   150		val |= BIT(psc->bit_idx);
   151	
 > 152		ep93xx_syscon_swlocked_write(val, psc->reg);
   153	
   154		if (psc->lock)
   155			spin_unlock_irqrestore(psc->lock, flags);
   156	
   157		return 0;
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
