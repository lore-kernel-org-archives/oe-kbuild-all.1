Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DB52A1D2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 20:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727036954; cv=none; b=Kb+u5O4ujxg+umomggqdzBuaW4V2d4l4zawaPiShmK9ggZ6Vhmldxj3T44ANcHYzZ/WUsOGGmT3TCY5Aj4X48Tu7jAhgTCdlrTQrCWWIbm+kSEdM1t43KFb9qAhULxPhknj0B+HYem1kbGM+djxQaS/Az3hSAJQ7Clwt6s9RztY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727036954; c=relaxed/simple;
	bh=hC/r8Nvz5tGdzbnG01X6IJaBB+u0J4/jAPYpjMM/Rlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nN3usCNfk+Jq2qm3k2Po27+XRTwoKOGAWsRS08qhklX1VYNwd5rDxF1Pqx9Ofx5cafbu9su3SPkUIpU4C2vBIyDb4apqWGv4YhjOowbRRIQoyYvJhOP5jzWlktBfqGETjVHoOM7fqH/u9ttJvOOXru/HZuxFbKJeeLA6WBUwzmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eyzpndlj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eyzpndlj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727036952; x=1758572952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hC/r8Nvz5tGdzbnG01X6IJaBB+u0J4/jAPYpjMM/Rlc=;
  b=EyzpndljwiRWe2t/pW91YlT1dWaDDumg3RaNZgXCopzisLOCtL4uJyFh
   3U0jXKM0PCVeeG1qeXiPKnSL4si/6xIRMz1bXtUG51mt7JRN/Z9U4dDkK
   mcuPDNOV6zjBqF2wDhXVXFtLCaMDP8Kc/NGWbGRR8RjwtS8pvgAdGOH1J
   BRIbNAmJ5xbiBvH6P8U0xjOLuz7umNOW7rNqQJ9w8QmPhm7Mfo/ft67Bt
   kjXTGuOH5ETJ8g5ILQf1t5tQfzzfkA5hKBpwVsDewkgf690qbZPsXNLZU
   1mak7fiHNBiJMVDWZduz7BE94CtC9dw/6OcspVNrl+Pe/4TQPx7PTis/r
   w==;
X-CSE-ConnectionGUID: 1+vQFlH2SLa4ELC7gwVMnQ==
X-CSE-MsgGUID: 0/CAQIaUQkGvQk69MORdLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25855136"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="25855136"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 13:29:11 -0700
X-CSE-ConnectionGUID: hBgF+/qQTyKg35bBC8DAUA==
X-CSE-MsgGUID: VMLipWV+SnmCdUZYqTb7mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="75415485"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2024 13:29:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssTCd-000GeI-1B;
	Sun, 22 Sep 2024 20:29:07 +0000
Date: Mon, 23 Sep 2024 04:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: Raymond Tan <raymond.tan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, sys_oak <sys_oak@intel.com>,
	N Pandith <pandith.n@intel.com>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Subject: [intel-lts:6.6/linux 7/34] drivers/gpio/gpio-ehl-pse-plat.c:455:12:
 warning: 'ehl_pse_gpio_resume' defined but not used
Message-ID: <202409230400.I4OOSIX3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   930131505d619f6b9efbe64da9a7349726815452
commit: 98f388dc83f17d579f5684c021040f02269a7ebe [7/34] mfd: intel-ehl-gpio: Introduce MFD framework to PSE GPIO/TGPIO
config: i386-randconfig-141-20240923 (https://download.01.org/0day-ci/archive/20240923/202409230400.I4OOSIX3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230400.I4OOSIX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230400.I4OOSIX3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-ehl-pse-plat.c:79:6: warning: no previous prototype for 'ehl_pse_gpio_free' [-Wmissing-prototypes]
      79 | void ehl_pse_gpio_free(struct gpio_chip *chip, unsigned int offset)
         |      ^~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/gpio/gpio-ehl-pse-plat.c:9:
   drivers/gpio/gpio-ehl-pse-plat.c: In function 'ehl_pse_gpio_probe':
   include/linux/stddef.h:8:14: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/gpio/gpio-ehl-pse-plat.c:378:24: note: in expansion of macro 'NULL'
     378 |                 return NULL;
         |                        ^~~~
   include/linux/stddef.h:8:14: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/gpio/gpio-ehl-pse-plat.c:382:24: note: in expansion of macro 'NULL'
     382 |                 return NULL;
         |                        ^~~~
   drivers/gpio/gpio-ehl-pse-plat.c:364:23: warning: unused variable 'base' [-Wunused-variable]
     364 |         void __iomem *base;
         |                       ^~~~
   drivers/gpio/gpio-ehl-pse-plat.c: At top level:
>> drivers/gpio/gpio-ehl-pse-plat.c:455:12: warning: 'ehl_pse_gpio_resume' defined but not used [-Wunused-function]
     455 | static int ehl_pse_gpio_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-ehl-pse-plat.c:435:12: warning: 'ehl_pse_gpio_suspend' defined but not used [-Wunused-function]
     435 | static int ehl_pse_gpio_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~

smatch warnings:
drivers/gpio/gpio-ehl-pse-plat.c:381 ehl_pse_gpio_probe() warn: unsigned 'irq' is never less than zero.

vim +/ehl_pse_gpio_resume +455 drivers/gpio/gpio-ehl-pse-plat.c

   358	
   359	static int ehl_pse_gpio_probe(struct platform_device *pdev)
   360	{
   361		struct gpio_irq_chip *girq;
   362		struct ehl_pse_gpio *priv;
   363		struct resource *res;
   364		void __iomem *base;
   365		u32 irq;
   366		int ret;
   367	
   368		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
   369		if (!priv)
   370			return -ENOMEM;
   371	
   372		priv->ctx = devm_kzalloc(&pdev->dev, sizeof(*priv->ctx), GFP_KERNEL);
   373		if (!priv->ctx)
   374			return -ENOMEM;
   375	
   376		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   377		if (!res)
   378			return NULL;
   379	
   380		irq = platform_get_irq(pdev, 0);
 > 381		if (irq < 0)
   382			return NULL;
   383	
   384		priv->dev = &pdev->dev;
   385		priv->reg_base = devm_ioremap_resource(&pdev->dev, res);
   386	
   387		priv->chip.label = dev_name(&pdev->dev);
   388		priv->chip.parent = &pdev->dev;
   389		priv->chip.request = ehl_pse_gpio_request;
   390		priv->chip.free = ehl_pse_gpio_free;
   391		priv->chip.direction_input = ehl_pse_gpio_direction_input;
   392		priv->chip.direction_output = ehl_pse_gpio_direction_output;
   393		priv->chip.get = ehl_pse_gpio_get;
   394		priv->chip.set = ehl_pse_gpio_set;
   395		priv->chip.get_direction = ehl_pse_gpio_get_direction;
   396		priv->chip.base = -1;
   397		/* 30 pins only per instance according to spec */
   398		priv->chip.ngpio = EHL_PSE_NGPIO;
   399		priv->chip.can_sleep = false;
   400		priv->chip.add_pin_ranges = NULL;
   401	
   402		raw_spin_lock_init(&priv->lock);
   403	
   404		girq = &priv->chip.irq;
   405		girq->chip = &ehl_pse_irqchip;
   406		girq->init_hw = ehl_pse_irq_init_hw;
   407		girq->parent_handler = ehl_pse_irq_handler;
   408		girq->num_parents = 1;
   409		girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
   410					sizeof(*girq->parents), GFP_KERNEL);
   411		if (!girq->parents)
   412			return -ENOMEM;
   413	
   414		girq->parents[0] = irq;
   415		girq->first = 0;
   416		girq->default_type = IRQ_TYPE_NONE;
   417		girq->handler = handle_bad_irq;
   418	
   419		platform_set_drvdata(pdev, priv);
   420	
   421		ret = devm_gpiochip_add_data(&pdev->dev, &priv->chip, priv);
   422		if (ret) {
   423			dev_err(&pdev->dev, "gpiochip_add error %d\n", ret);
   424			return ret;
   425		}
   426	
   427		return 0;
   428	}
   429	
   430	static int ehl_pse_gpio_remove(struct platform_device *pdev)
   431	{
   432		return 0;
   433	}
   434	
 > 435	static int ehl_pse_gpio_suspend(struct device *dev)
   436	{
   437		struct ehl_pse_gpio *priv = dev_get_drvdata(dev);
   438		struct ehl_pse_gpio_context *ctx = priv->ctx;
   439		unsigned long flags;
   440	
   441		raw_spin_lock_irqsave(&priv->lock, flags);
   442	
   443		ctx->gplr = intel_gpio_readl(priv->reg_base, GPLR);
   444		ctx->gpdr = intel_gpio_readl(priv->reg_base, GPDR);
   445		ctx->grer = intel_gpio_readl(priv->reg_base, GRER);
   446		ctx->gfer = intel_gpio_readl(priv->reg_base, GFER);
   447		ctx->gimr = intel_gpio_readl(priv->reg_base, GIMR);
   448		ctx->gwmr = intel_gpio_readl(priv->reg_base, GWMR);
   449	
   450		raw_spin_unlock_irqrestore(&priv->lock, flags);
   451	
   452		return 0;
   453	}
   454	
 > 455	static int ehl_pse_gpio_resume(struct device *dev)
   456	{
   457		struct ehl_pse_gpio *priv = dev_get_drvdata(dev);
   458		struct ehl_pse_gpio_context *ctx = priv->ctx;
   459		unsigned long flags;
   460	
   461		raw_spin_lock_irqsave(&priv->lock, flags);
   462	
   463		/* GPLR is RO, values read will restore using GPSR */
   464		intel_gpio_writel(priv->reg_base, GPSR, ctx->gplr);
   465		intel_gpio_writel(priv->reg_base, GPDR, ctx->gpdr);
   466		intel_gpio_writel(priv->reg_base, GRER, ctx->grer);
   467		intel_gpio_writel(priv->reg_base, GFER, ctx->gfer);
   468		intel_gpio_writel(priv->reg_base, GIMR, ctx->gimr);
   469		intel_gpio_writel(priv->reg_base, GWMR, ctx->gwmr);
   470	
   471		raw_spin_unlock_irqrestore(&priv->lock, flags);
   472	
   473		return 0;
   474	}
   475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
