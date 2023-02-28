Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835DDA38
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 07:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677570984; x=1709106984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8VCDPmzgLF+w+8J1NGnAvzuouIu+NDZwcSNAZXcYihQ=;
  b=ZDAiIe17JqOHZPG5q/UPQ+8CiAoFytsnXRm8sf2SAW6Rg7AV9mJ/lV7R
   HY6LKDTTE/uCSN6To30IXi33+kzCEr+c/e9mIs73BxoUGsNkyEPr3o1y8
   evdo1+BQLWofcy731DqH1KDDLTIK9/MGFehUO8bQpleGncTRHISZgC0Vx
   7ARNKy2h1RjmrgglO2bbdSOaticmZntyinFiwJHsuUZ6p4/IyHCWmlftc
   1C9SLp0b/Dx9ZOeHhdo+HJwIhdZKQTj88U3t6HUg0AODi9LxvkcbqzN7b
   S8JUYnX6L1byes1ASwOYEe4phZGospssG5u1O7HFRwqVnYmO3slM+Rx1a
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313749254"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="313749254"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 23:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="919685527"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="919685527"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Feb 2023 23:56:23 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWuqU-0005CZ-1G;
	Tue, 28 Feb 2023 07:56:22 +0000
Date: Tue, 28 Feb 2023 15:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 181/583]
 drivers/irqchip/irq-bcm2835.c:204:22: warning: variable 'last_irq' set but
 not used
Message-ID: <202302281554.M4Xgn8XY-lkp@intel.com>
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
commit: b7bb374bf3235664e95999ae93be45a051ac4e77 [181/583] irqchip: irq-bcm2835: Calc. FIQ_START at boot-time
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302281554.M4Xgn8XY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/b7bb374bf3235664e95999ae93be45a051ac4e77
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout b7bb374bf3235664e95999ae93be45a051ac4e77
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/char/broadcom/ drivers/dma/ drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302281554.M4Xgn8XY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-bcm2835.c: In function 'armctrl_of_init':
>> drivers/irqchip/irq-bcm2835.c:204:22: warning: variable 'last_irq' set but not used [-Wunused-but-set-variable]
     204 |         int irq = 0, last_irq, b, i;
         |                      ^~~~~~~~


vim +/last_irq +204 drivers/irqchip/irq-bcm2835.c

   198	
   199	static int __init armctrl_of_init(struct device_node *node,
   200					  struct device_node *parent,
   201					  bool is_2836)
   202	{
   203		void __iomem *base;
 > 204		int irq = 0, last_irq, b, i;
   205		u32 reg;
   206	
   207		base = of_iomap(node, 0);
   208		if (!base)
   209			panic("%pOF: unable to map IC registers\n", node);
   210	
   211		intc.base = base;
   212		intc.domain = irq_domain_add_linear(node, NUMBER_IRQS * 2,
   213						    &armctrl_ops, NULL);
   214		if (!intc.domain)
   215			panic("%pOF: unable to create IRQ domain\n", node);
   216	
   217		for (b = 0; b < NR_BANKS; b++) {
   218			intc.pending[b] = base + reg_pending[b];
   219			intc.enable[b] = base + reg_enable[b];
   220			intc.disable[b] = base + reg_disable[b];
   221	
   222			for (i = 0; i < bank_irqs[b]; i++) {
   223				irq = irq_create_mapping(intc.domain, MAKE_HWIRQ(b, i));
   224				BUG_ON(irq <= 0);
   225				irq_set_chip_and_handler(irq, &armctrl_chip,
   226					handle_level_irq);
   227				irq_set_probe(irq);
   228			}
   229	
   230			reg = readl_relaxed(intc.enable[b]);
   231			if (reg) {
   232				writel_relaxed(reg, intc.disable[b]);
   233				pr_err(FW_BUG "Bootloader left irq enabled: "
   234				       "bank %d irq %*pbl\n", b, IRQS_PER_BANK, &reg);
   235			}
   236		}
   237	
   238		reg = readl_relaxed(base + REG_FIQ_CONTROL);
   239		if (reg & FIQ_CONTROL_ENABLE) {
   240			writel_relaxed(0, base + REG_FIQ_CONTROL);
   241			pr_err(FW_BUG "Bootloader left fiq enabled\n");
   242		}
   243	
   244		last_irq = irq;
   245	
   246		if (is_2836) {
   247			int parent_irq = irq_of_parse_and_map(node, 0);
   248	
   249			if (!parent_irq) {
   250				panic("%pOF: unable to get parent interrupt.\n",
   251				      node);
   252			}
   253			irq_set_chained_handler(parent_irq, bcm2836_chained_handle_irq);
   254		} else {
   255			set_handle_irq(bcm2835_handle_irq);
   256		}
   257	
   258		if (is_2836) {
   259			extern void __iomem * __attribute__((weak)) arm_local_intc;
   260			intc.local_base = arm_local_intc;
   261			if (!intc.local_base)
   262				pr_err("Failed to get local intc base. FIQ is disabled for cpus > 1\n");
   263		}
   264	
   265		/* Make a duplicate irq range which is used to enable FIQ */
   266		for (b = 0; b < NR_BANKS; b++) {
   267			for (i = 0; i < bank_irqs[b]; i++) {
   268				irq = irq_create_mapping(intc.domain,
   269						MAKE_HWIRQ(b, i) + NUMBER_IRQS);
   270				BUG_ON(irq <= 0);
   271				irq_set_chip(irq, &armctrl_chip);
   272				irq_set_probe(irq);
   273			}
   274		}
   275	#ifndef CONFIG_ARM64
   276		init_FIQ(irq - last_irq);
   277	#endif
   278	
   279		return 0;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
