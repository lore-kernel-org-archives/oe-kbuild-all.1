Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F2723B4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 10:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681814796; x=1713350796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2r4fFg8qLu03hC2sVX4LRiGXKriOsjIoDVse7H1nWg4=;
  b=O25nO7Bx7EwHmnCvJalhqKte2qlrn7OB6AGRsuNbvR4VOHY3k1aL2sBQ
   km4112V3TvkAVb8LmrfyIYkFR+qMgkhEaT3PNfjFCYYcJBzk5QyxhStq4
   nEaNSPs22vho/gb8TWW9pWO6CPCy3ldSqqPQKcEeEY6zTA9EJyu4lTH6V
   3u1sADQY1tL+ubvIVeyMVFIZnn5Lb5m1dv9kw0VDojGQOxBKJwwPrxkIZ
   h/K7yldmWIAhSAsrpOWxXJK0b36ggwVgswfweOVRPBZTyd9lgimNBuhZh
   +BymV7kKi9bQwKx+4iidKZqtU32mn9SVopYZuDUiM3QGLFGoxZJlBIanT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="343888665"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="343888665"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 03:46:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="668472494"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="668472494"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Apr 2023 03:46:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poir3-000dHL-3A;
	Tue, 18 Apr 2023 10:46:33 +0000
Date: Tue, 18 Apr 2023 18:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 2959/9838]
 drivers/irqchip/irq-imx-gpcv2.c:91:6: warning: no previous prototype for
 'imx_gpcv2_raise_softirq'
Message-ID: <202304181853.3TPmROy9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 24467b72b33a0463acff6ee96c4ce75ef0009356 [2959/9838] LF-2438 drivers: irqchip: irq-imx-gpcv2: Remove the smp_cross_call reference
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230418/202304181853.3TPmROy9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/24467b72b33a0463acff6ee96c4ce75ef0009356
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 24467b72b33a0463acff6ee96c4ce75ef0009356
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181853.3TPmROy9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-imx-gpcv2.c:91:6: warning: no previous prototype for 'imx_gpcv2_raise_softirq' [-Wmissing-prototypes]
      91 | void imx_gpcv2_raise_softirq(const struct cpumask *mask,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-imx-gpcv2.c:224:5: warning: no previous prototype for 'imx8mq_gpcv2_irq_set_affinity' [-Wmissing-prototypes]
     224 | int imx8mq_gpcv2_irq_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/imx_gpcv2_raise_softirq +91 drivers/irqchip/irq-imx-gpcv2.c

    89	
    90	#ifdef CONFIG_SMP
  > 91	void imx_gpcv2_raise_softirq(const struct cpumask *mask,
    92						  unsigned int irq)
    93	{
    94		struct arm_smccc_res res;
    95	
    96		if (!err11171)
    97			return;
    98	
    99		/* now call into EL3 and take care of the wakeup */
   100		arm_smccc_smc(FSL_SIP_GPC, FSL_SIP_CONFIG_GPC_CORE_WAKE,
   101				*cpumask_bits(mask), 0, 0, 0, 0, 0, &res);
   102	}
   103	#endif
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
