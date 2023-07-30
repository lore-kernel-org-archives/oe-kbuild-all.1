Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919F764B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690694070; x=1722230070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v3wq/xj26BovDA84p0uEKB7bypYUMliuXV6aOWAhxh8=;
  b=OOCYIVP2jJPOPqn3xY69R9vds2SizR9qlr3069TzO/Tq3ORL0zaB1jgV
   ejH5IwZ5J0tecx3/n2cXmvIYELPtmXVtaxmYKAToDHai1SnFOU0h6+kO6
   SQyhqB560Bt65B/elHC2iL0Wklm6gZdo9gk+7CVQF3RyJhj2cuOqAblpP
   96gaK+LgFnuTeWJ14SGDrsUwgoY0r8rOzaHuQlXITDhQrqMKyGaZC9jGw
   KPj3g/WBJ+uz3oIZWZMnVckKzKTyI8FKUhDUFTdRizNFqQvRxdem0Rnmf
   Z9Jxs/JytldJYKm5VTHdgB2oCF7XAmSEu67JZi8+R0QPRSZab2CbnQd0m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="358846022"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="358846022"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 22:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="727891027"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="727891027"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Jul 2023 22:14:28 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPylA-0004SI-0U;
	Sun, 30 Jul 2023 05:14:28 +0000
Date: Sun, 30 Jul 2023 13:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 5/81] drivers/gpio/gpio-mvebu.c:877:9:
 error: implicit declaration of function 'devm_pwmchip_add'
Message-ID: <202307301351.JeH6kQpb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   7d42cadcafd1bb4c8d7a0789d4b1f6599b734aab
commit: bebe9bf0cd474cc0e859558688a2c8ba1c98deed [5/81] gpio: mvebu: Make use of devm_pwmchip_add
config: arm-orion5x_defconfig (https://download.01.org/0day-ci/archive/20230730/202307301351.JeH6kQpb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307301351.JeH6kQpb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307301351.JeH6kQpb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-mvebu.c:877:9: error: implicit declaration of function 'devm_pwmchip_add' [-Werror,-Wimplicit-function-declaration]
     877 |         return devm_pwmchip_add(dev, &mvpwm->chip);
         |                ^
   drivers/gpio/gpio-mvebu.c:877:9: note: did you mean 'pwmchip_add'?
   include/linux/pwm.h:482:19: note: 'pwmchip_add' declared here
     482 | static inline int pwmchip_add(struct pwm_chip *chip)
         |                   ^
   1 error generated.


vim +/devm_pwmchip_add +877 drivers/gpio/gpio-mvebu.c

   785	
   786	static int mvebu_pwm_probe(struct platform_device *pdev,
   787				   struct mvebu_gpio_chip *mvchip,
   788				   int id)
   789	{
   790		struct device *dev = &pdev->dev;
   791		struct mvebu_pwm *mvpwm;
   792		void __iomem *base;
   793		u32 offset;
   794		u32 set;
   795	
   796		if (mvchip->soc_variant == MVEBU_GPIO_SOC_VARIANT_A8K) {
   797			int ret = of_property_read_u32(dev->of_node,
   798						       "marvell,pwm-offset", &offset);
   799			if (ret < 0)
   800				return 0;
   801		} else {
   802			/*
   803			 * There are only two sets of PWM configuration registers for
   804			 * all the GPIO lines on those SoCs which this driver reserves
   805			 * for the first two GPIO chips. So if the resource is missing
   806			 * we can't treat it as an error.
   807			 */
   808			if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwm"))
   809				return 0;
   810			offset = 0;
   811		}
   812	
   813		if (IS_ERR(mvchip->clk))
   814			return PTR_ERR(mvchip->clk);
   815	
   816		mvpwm = devm_kzalloc(dev, sizeof(struct mvebu_pwm), GFP_KERNEL);
   817		if (!mvpwm)
   818			return -ENOMEM;
   819		mvchip->mvpwm = mvpwm;
   820		mvpwm->mvchip = mvchip;
   821		mvpwm->offset = offset;
   822	
   823		if (mvchip->soc_variant == MVEBU_GPIO_SOC_VARIANT_A8K) {
   824			mvpwm->regs = mvchip->regs;
   825	
   826			switch (mvchip->offset) {
   827			case AP80X_GPIO0_OFF_A8K:
   828			case CP11X_GPIO0_OFF_A8K:
   829				/* Blink counter A */
   830				set = 0;
   831				break;
   832			case CP11X_GPIO1_OFF_A8K:
   833				/* Blink counter B */
   834				set = U32_MAX;
   835				mvpwm->offset += PWM_BLINK_COUNTER_B_OFF;
   836				break;
   837			default:
   838				return -EINVAL;
   839			}
   840		} else {
   841			base = devm_platform_ioremap_resource_byname(pdev, "pwm");
   842			if (IS_ERR(base))
   843				return PTR_ERR(base);
   844	
   845			mvpwm->regs = devm_regmap_init_mmio(&pdev->dev, base,
   846							    &mvebu_gpio_regmap_config);
   847			if (IS_ERR(mvpwm->regs))
   848				return PTR_ERR(mvpwm->regs);
   849	
   850			/*
   851			 * Use set A for lines of GPIO chip with id 0, B for GPIO chip
   852			 * with id 1. Don't allow further GPIO chips to be used for PWM.
   853			 */
   854			if (id == 0)
   855				set = 0;
   856			else if (id == 1)
   857				set = U32_MAX;
   858			else
   859				return -EINVAL;
   860		}
   861	
   862		regmap_write(mvchip->regs,
   863			     GPIO_BLINK_CNT_SELECT_OFF + mvchip->offset, set);
   864	
   865		mvpwm->clk_rate = clk_get_rate(mvchip->clk);
   866		if (!mvpwm->clk_rate) {
   867			dev_err(dev, "failed to get clock rate\n");
   868			return -EINVAL;
   869		}
   870	
   871		mvpwm->chip.dev = dev;
   872		mvpwm->chip.ops = &mvebu_pwm_ops;
   873		mvpwm->chip.npwm = mvchip->chip.ngpio;
   874	
   875		spin_lock_init(&mvpwm->lock);
   876	
 > 877		return devm_pwmchip_add(dev, &mvpwm->chip);
   878	}
   879	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
