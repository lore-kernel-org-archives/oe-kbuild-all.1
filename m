Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B8538D3EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 18:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782238980; cv=none; b=IRdSsSE3PePG8GVjlb4pE2LVkKzyJ30EumM8taNkFqIPmKRTt+eIf6qkqkHxTzgutjKRApi5XQJe+9+1KrE76J/a6Qqy1hLWDIQ7Ogz9jAcj/sncdkEIZ9UsCIrH+dPN60Ew68uve7DmBtEU4ljTl8jRDQxmF/hqD1I3VAjEzUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782238980; c=relaxed/simple;
	bh=Yq/ZepTrix026EPaKYg4O8Prt400Da5/6Zq55YLKep4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pKpcur9eXE9z8h9x2YS8XgNZNVZQ5BqJbI8w9esa/TGBEZhe09+KLVga3PW3KktKYe2qTsfmBhs/LmK+FL5ZelePdKY3FlQ8J2Y2/g50NZxAKItSx1l+iMynwdzMXLWtSNCV2fLMTTYQkFA6f4K0gsEknOQ7PcI4c/5NjH3Bynk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uu/wPBUg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uu/wPBUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782238979; x=1813774979;
  h=date:from:to:cc:subject:message-id;
  bh=Yq/ZepTrix026EPaKYg4O8Prt400Da5/6Zq55YLKep4=;
  b=Uu/wPBUghRnLo+OWxH9bs7X2bkUcQZgaI2aCCpXsoqfQd+gkXqKP/ptY
   nQLPCfuB74pr2SqyKQ0SpgkROFfQGj2IDwHnJU7Lz6nWAPm/Y2NyaWTtb
   NFCAXUejpBEoobtreXpRRdsNNQx9P42Q8vN9oQT+3Fx+nubWoQdQW2FQK
   pDogz41TKb6Ya67tA3rMwhmwBsKxLuQszjNSAB72qH50fHbywUD/WB+ZU
   3syR16WF/wHVnr2OLoGn3Pqm2LdhnCnsXBy25CZrzX/lu0FhFGFSMpK5W
   03s2xgvYDIEm63jTiK5LEsHFfV/smRgnizI3wQdav1Lt7gh7s8+mTmooH
   Q==;
X-CSE-ConnectionGUID: 10r7V97WQIudGU2dceuq6A==
X-CSE-MsgGUID: CheWPO2yTWipD0zGhrvnxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82995435"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82995435"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 11:22:58 -0700
X-CSE-ConnectionGUID: cDdOvS2oS1GsKHdeZn100A==
X-CSE-MsgGUID: i3tkagUwSk+1BQCavo8YZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249704014"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Jun 2026 11:22:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc5lu-000000002on-1EAF;
	Tue, 23 Jun 2026 18:22:54 +0000
Date: Wed, 24 Jun 2026 02:22:34 +0800
From: kernel test robot <lkp@intel.com>
To: Raymond Tan <raymond.tan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>,
 N Pandith <pandith.n@intel.com>
Subject: [intel-lts:6.12/emt 2/2]
 drivers/gpio/gpio-ehl-pse-plat.c:455:12: warning: 'ehl_pse_gpio_resume'
 defined but not used
Message-ID: <202606240148.Z9Lavn8l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Raymond,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   efa0eceac635132225b11aaee467c1452a2b775c
commit: 0f29414f79e2de5fb5cce8fa50cfb26b0c829567 [2/2] mfd: intel-ehl-gpio: Introduce MFD framework to PSE GPIO/TGPIO
config: i386-randconfig-r053-20260623 (https://download.01.org/0day-ci/archive/20260624/202606240148.Z9Lavn8l-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240148.Z9Lavn8l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240148.Z9Lavn8l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:317,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/gpio/gpio-ehl-pse-plat.c:9:
   drivers/gpio/gpio-ehl-pse-plat.c: In function 'ehl_pse_gpio_probe':
   include/linux/stddef.h:8:14: error: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/gpio/gpio-ehl-pse-plat.c:378:24: note: in expansion of macro 'NULL'
     378 |                 return NULL;
         |                        ^~~~
   include/linux/stddef.h:8:14: error: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/gpio/gpio-ehl-pse-plat.c:382:24: note: in expansion of macro 'NULL'
     382 |                 return NULL;
         |                        ^~~~
   drivers/gpio/gpio-ehl-pse-plat.c:364:23: warning: unused variable 'base' [-Wunused-variable]
     364 |         void __iomem *base;
         |                       ^~~~
   drivers/gpio/gpio-ehl-pse-plat.c: At top level:
   drivers/gpio/gpio-ehl-pse-plat.c:486:27: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Wincompatible-pointer-types]
     486 |         .remove         = ehl_pse_gpio_remove,
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-ehl-pse-plat.c:486:27: note: (near initialization for 'ehl_pse_gpio_driver.<anonymous>.remove')
>> drivers/gpio/gpio-ehl-pse-plat.c:455:12: warning: 'ehl_pse_gpio_resume' defined but not used [-Wunused-function]
     455 | static int ehl_pse_gpio_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-ehl-pse-plat.c:435:12: warning: 'ehl_pse_gpio_suspend' defined but not used [-Wunused-function]
     435 | static int ehl_pse_gpio_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/ehl_pse_gpio_resume +455 drivers/gpio/gpio-ehl-pse-plat.c

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
