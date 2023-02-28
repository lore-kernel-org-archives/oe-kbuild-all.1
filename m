Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDB9623
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 04:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677556881; x=1709092881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0oCQ7VKPhaP/c1mMSnOlGzAlpVT2mK0LG4ZzxMvsfVg=;
  b=Fmej0E4sshKNKuJADwFhlTh8eO+M983mw2lsY/os3h84dgg/qlJFvCRc
   kKyWkijHoLJKPHj/TXPiTdd08XN8KzP+XRlqmY6rcqvQq3UbRpvgkx0do
   fEfmxalktbyPcmAQh2Oq2QteNf8+0nJwm8ChSUgDlZIZ5pMIZ7WLsjy/6
   nA5O0XkaC+dfua3uBFaqvQCs4/jyhrBtqdLClkQgvinehOVsMo02P3Qed
   F2FkpbjLHEDV+OKnjShewFyAYepcoYtukpqS+wS538WYLMRIsyWgx8Ere
   6uhAEeRd1wMY/vx/II/fC0Ifd4BY6A5LZJMSxKOx8IrJ9Bx/mLnDJ5qrw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="317841448"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="317841448"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 20:01:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="673980038"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="673980038"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Feb 2023 20:01:17 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWrAz-00054Z-0F;
	Tue, 28 Feb 2023 04:01:17 +0000
Date: Tue, 28 Feb 2023 12:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 169/583]
 drivers/irqchip/irq-bcm2836.c:92:6: warning: no previous prototype for
 'bcm2836_arm_irqchip_spin_gpu_irq'
Message-ID: <202302281111.UZtHGbdb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: 2d15bef4254356aa5917aa9103ac2fb3f9c87963 [169/583] ARM64: Round-Robin dispatch IRQs between CPUs.
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302281111.UZtHGbdb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/2d15bef4254356aa5917aa9103ac2fb3f9c87963
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 2d15bef4254356aa5917aa9103ac2fb3f9c87963
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/char/broadcom/ drivers/dma/ drivers/irqchip/ drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302281111.UZtHGbdb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-bcm2836.c:92:6: warning: no previous prototype for 'bcm2836_arm_irqchip_spin_gpu_irq' [-Wmissing-prototypes]
      92 | void bcm2836_arm_irqchip_spin_gpu_irq(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bcm2836_arm_irqchip_spin_gpu_irq +92 drivers/irqchip/irq-bcm2836.c

    91	
  > 92	void bcm2836_arm_irqchip_spin_gpu_irq(void)
    93	{
    94		u32 i;
    95		void __iomem *gpurouting = (intc.base + LOCAL_GPU_ROUTING);
    96		u32 routing_val = readl(gpurouting);
    97	
    98		for (i = 1; i <= 3; i++) {
    99			u32 new_routing_val = (routing_val + i) & 3;
   100	
   101			if (cpu_active(new_routing_val)) {
   102				writel(new_routing_val, gpurouting);
   103				return;
   104			}
   105		}
   106	}
   107	EXPORT_SYMBOL(bcm2836_arm_irqchip_spin_gpu_irq);
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
