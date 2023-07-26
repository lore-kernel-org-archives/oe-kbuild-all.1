Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C2B846C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 07:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690355595; x=1721891595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VgxFHUXdktCPKFRx5qmmNZXBAYTEWTkPVPfsCdOQcNk=;
  b=XUDXb+thLYceHrUnrP98RUg2sVwQ4+Su5wJPyyQbXj3TE5rNeLiSfv7v
   +ZkX4wdj/5dowHIIhFQtI8bZhbKSG4OMGjmypanA49b4Lmmn0bdONAZpa
   /4cKfO+HpEesTqe1TI/Wii63mW9g74SWDiLPiVfS+ter9raKz1Njie8r7
   5haCQ6leg5VcBREhWjL7YTI37lBk2vIuDDHznKNJTQ1q2AEaPa+Gvxsf8
   e5A/zrGwWN9XcgDJ3naDrfV6COcOrm1J/HTL6hLw8mhlcdY11DsLlECnt
   g0eDFFi9DHIBdbAqUvHOkDWkbZdI4qixAelLg7PYNIC70H5kgIrDoG2em
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431739192"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="431739192"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 00:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="850349285"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="850349285"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Jul 2023 00:13:13 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOYhs-0000lJ-1j;
	Wed, 26 Jul 2023 07:13:12 +0000
Date: Wed, 26 Jul 2023 15:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 172/244] drivers/gpio/gpio-mvebu.c:877:9:
 error: call to undeclared function 'devm_pwmchip_add'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202307261508.YNG1SInd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   d93c12687a7e61eb154b84d965a63d2e1d36f01a
commit: 3da51899f06ad60d4885881f557f393a3ca4ec13 [172/244] gpio: mvebu: Make use of devm_pwmchip_add
config: arm64-randconfig-r025-20230726 (https://download.01.org/0day-ci/archive/20230726/202307261508.YNG1SInd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261508.YNG1SInd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261508.YNG1SInd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-mvebu.c:877:9: error: call to undeclared function 'devm_pwmchip_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     877 |         return devm_pwmchip_add(dev, &mvpwm->chip);
         |                ^
   drivers/gpio/gpio-mvebu.c:877:9: note: did you mean 'pwmchip_add'?
   include/linux/pwm.h:471:19: note: 'pwmchip_add' declared here
     471 | static inline int pwmchip_add(struct pwm_chip *chip)
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
