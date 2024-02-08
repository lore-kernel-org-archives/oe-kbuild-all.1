Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085CA77F33
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707406549; cv=none; b=Bu/ZkkShewHORPUP0A7Qldd4796oqtkTFrnJrY17nFEATzEOyxOnfrNH+WUagkO9b975MsblzqGA9TxQryUWok/scyrAWtHN8doRyZPYaS4RNtts+pIFhuPMvKmWjhFtO4ZEF8SKcSrm0+Sobt/N7UNXV5jydoLYbQg9U2zngss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707406549; c=relaxed/simple;
	bh=whDmZWnHcmzJIN2AGnYKyCmFsRjLwkw9G5UhK/ornMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9VEh2t3FKf1VD2GSdxBUuQit0VF+cN7PzRGuyCD4rHnLXUYC1die0f+DBokDsuRgxWwGDHxdmzXTVoeEXIsDlEBZq9tCy1qVl1j5UfjhBy4FGOdxzYYq9n7ouVPi84HmePGJdmN3bSWkF98JQE4bO1iz1piI2HmhP9RjFhNJ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UURIBH8o; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UURIBH8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707406547; x=1738942547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=whDmZWnHcmzJIN2AGnYKyCmFsRjLwkw9G5UhK/ornMM=;
  b=UURIBH8o4r4P5O2CSDbT88ltJOn110j9nSTjKZAC72NL3h2w/btB4BuC
   e+G27pNlt8caB+i3zhbEPkmF+n398RdItf2LnPMEcZYZZyyTm9H6V7XuE
   lZar+K5AfTNOD0La7PGvDR/8vWSJSlIGwnsAvsivWe4Ofc6qht5c5oTF4
   cAsesbQldoLzPKiWvmov7S4M3GSXqWDTBZczb/dqLzPWuAsTIBwOcq77X
   P+p35YKnPZgQJ4wmf+BrlkZixR58omuWFv3VzBLlL04l1kbirzYRgnGDH
   NBwDrzHvTcHbUmgCJs7jRBwqfmzsU35j1PHGF9TZe5/dFwm1ZlmHGriwY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1130915"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1130915"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 07:35:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1714346"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2024 07:35:45 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY6RC-0003rc-1k;
	Thu, 08 Feb 2024 15:35:42 +0000
Date: Thu, 8 Feb 2024 23:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ukleinek:pwm-lifetime-tracking 139/148]
 drivers/gpio/gpio-mvebu.c:816:16: error: implicit declaration of function
 'devm_pwmchip_alloc'; did you mean 'devm_pwmchip_add'?
Message-ID: <202402082319.d7XeCANl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm-lifetime-tracking
head:   883b4db01bcec98c13195316395582a6fe5ddefc
commit: e30b6ec606e0c3ae732dbe0debc33e7ed46ff456 [139/148] gpio: mvebu: Make use of devm_pwmchip_alloc() function
config: arm64-randconfig-004-20240208 (https://download.01.org/0day-ci/archive/20240208/202402082319.d7XeCANl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402082319.d7XeCANl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402082319.d7XeCANl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpio/gpio-mvebu.c: In function 'mvebu_pwm_probe':
>> drivers/gpio/gpio-mvebu.c:816:16: error: implicit declaration of function 'devm_pwmchip_alloc'; did you mean 'devm_pwmchip_add'? [-Werror=implicit-function-declaration]
     816 |         chip = devm_pwmchip_alloc(dev, mvchip->chip.ngpio, sizeof(*mvpwm));
         |                ^~~~~~~~~~~~~~~~~~
         |                devm_pwmchip_add
>> drivers/gpio/gpio-mvebu.c:816:14: warning: assignment to 'struct pwm_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     816 |         chip = devm_pwmchip_alloc(dev, mvchip->chip.ngpio, sizeof(*mvpwm));
         |              ^
   cc1: some warnings being treated as errors


vim +816 drivers/gpio/gpio-mvebu.c

   784	
   785	static int mvebu_pwm_probe(struct platform_device *pdev,
   786				   struct mvebu_gpio_chip *mvchip,
   787				   int id)
   788	{
   789		struct device *dev = &pdev->dev;
   790		struct mvebu_pwm *mvpwm;
   791		struct pwm_chip *chip;
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
 > 816		chip = devm_pwmchip_alloc(dev, mvchip->chip.ngpio, sizeof(*mvpwm));
   817		if (IS_ERR(chip))
   818			return PTR_ERR(chip);
   819		mvpwm = to_mvebu_pwm(chip);
   820	
   821		mvchip->mvpwm = mvpwm;
   822		mvpwm->mvchip = mvchip;
   823		mvpwm->offset = offset;
   824	
   825		if (mvchip->soc_variant == MVEBU_GPIO_SOC_VARIANT_A8K) {
   826			mvpwm->regs = mvchip->regs;
   827	
   828			switch (mvchip->offset) {
   829			case AP80X_GPIO0_OFF_A8K:
   830			case CP11X_GPIO0_OFF_A8K:
   831				/* Blink counter A */
   832				set = 0;
   833				break;
   834			case CP11X_GPIO1_OFF_A8K:
   835				/* Blink counter B */
   836				set = U32_MAX;
   837				mvpwm->offset += PWM_BLINK_COUNTER_B_OFF;
   838				break;
   839			default:
   840				return -EINVAL;
   841			}
   842		} else {
   843			base = devm_platform_ioremap_resource_byname(pdev, "pwm");
   844			if (IS_ERR(base))
   845				return PTR_ERR(base);
   846	
   847			mvpwm->regs = devm_regmap_init_mmio(&pdev->dev, base,
   848							    &mvebu_gpio_regmap_config);
   849			if (IS_ERR(mvpwm->regs))
   850				return PTR_ERR(mvpwm->regs);
   851	
   852			/*
   853			 * Use set A for lines of GPIO chip with id 0, B for GPIO chip
   854			 * with id 1. Don't allow further GPIO chips to be used for PWM.
   855			 */
   856			if (id == 0)
   857				set = 0;
   858			else if (id == 1)
   859				set = U32_MAX;
   860			else
   861				return -EINVAL;
   862		}
   863	
   864		regmap_write(mvchip->regs,
   865			     GPIO_BLINK_CNT_SELECT_OFF + mvchip->offset, set);
   866	
   867		mvpwm->clk_rate = clk_get_rate(mvchip->clk);
   868		if (!mvpwm->clk_rate) {
   869			dev_err(dev, "failed to get clock rate\n");
   870			return -EINVAL;
   871		}
   872	
   873		chip->ops = &mvebu_pwm_ops;
   874	
   875		spin_lock_init(&mvpwm->lock);
   876	
   877		return devm_pwmchip_add(dev, chip);
   878	}
   879	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
