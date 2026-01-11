Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E222A1D4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 17:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768153912; cv=none; b=RYBWVL5ROh9aeuSeCX1sBtwZjeryGXMxHfaDIq/FFB7GOCm0H09w55+VJHtDwL7M76nEU5rNmUs+kLaLcuhBNVG5xDajLmcPiB6UcQQeRrP4KfM+Eooq3KaJRP3ZdXACoMaAmR/rs2iQngni0dn8wNzBy7nD0NeHj/MVYFBTBNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768153912; c=relaxed/simple;
	bh=sLhFDd+4V/L6gbfrsspQd4eaKkcKUgy46YE8tJb/nUI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VWFAAj1103fZFEqyj2aCSiTXFYoNqvk9FaOM61ERyMAlk0zX4Pvp9z+UZfy6ka0L6iLFeRqdGWKgr1a8R10jB5cIKhbeBJIm36Ijjaz0F/jqCYpE/Zxu1Ta7X3Hclpv+koLpCvfBM5k4X0H7gKYEDNA9H96ZAm7zGhijnMnUwsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KasBC1R0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KasBC1R0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768153911; x=1799689911;
  h=date:from:to:cc:subject:message-id;
  bh=sLhFDd+4V/L6gbfrsspQd4eaKkcKUgy46YE8tJb/nUI=;
  b=KasBC1R0L9NCpFNDRSdUqYSdvC+u5WxAYZ+LyxXUwuZoBKP6oJinkjO+
   WmMbWRV8GyxTN9GnsErK6Y5ZyekvU4cKjf6Tp+uDICQ2+Iq9M9jVzDkpT
   NWXzgC8ycqr/HZ6wrXg0UnTcN2MOzdyAxByuJGhVPjMGlL3JHslwc/lMV
   hbsCqH/YRn7TufA0WF5Zd1kPXws8nMEBSlhuci4x4dMgg+y9Lcd6gPDuW
   LrHgzOCWshAxJ3wQ7aTM7YzAgq6Vds2HZBoa5G+nDOg1IYVeVMHL4CfFH
   BlTnZKnOTYeqe516N0IBaGB5EMdHtmmzpLv7mjPiPWOGeEWJe1/MOmzQV
   g==;
X-CSE-ConnectionGUID: pabixFvcSZqkD99VhQkQqA==
X-CSE-MsgGUID: dg8VUAh0S9mPrRUNLW/EdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="86864389"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="86864389"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 09:51:50 -0800
X-CSE-ConnectionGUID: qeO1xivMT0qLtayVDehxBg==
X-CSE-MsgGUID: D0dmf81/QKWitSi6ozf7rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208052628"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jan 2026 09:51:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vezbO-00000000Cak-35na;
	Sun, 11 Jan 2026 17:51:46 +0000
Date: Mon, 12 Jan 2026 01:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 23/23]
 drivers/watchdog/sb_wdog.c:268:27: sparse: sparse: incorrect type in argument
 1 (different address spaces)
Message-ID: <202601120116.1juB2der-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   d1ec28ccbb7a3c86b11e03944d9231500dad60ae
commit: d1ec28ccbb7a3c86b11e03944d9231500dad60ae [23/23] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: mips-randconfig-r111-20260111 (https://download.01.org/0day-ci/archive/20260112/202601120116.1juB2der-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120116.1juB2der-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120116.1juB2der-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/watchdog/sb_wdog.c:268:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got char *wd_cfg_reg @@
   drivers/watchdog/sb_wdog.c:268:27: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/watchdog/sb_wdog.c:268:27: sparse:     got char *wd_cfg_reg
>> drivers/watchdog/sb_wdog.c:269:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got char * @@
   drivers/watchdog/sb_wdog.c:269:42: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/watchdog/sb_wdog.c:269:42: sparse:     got char *
   drivers/watchdog/sb_wdog.c:274:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/watchdog/sb_wdog.c:274:24: sparse:    char *
   drivers/watchdog/sb_wdog.c:274:24: sparse:    char [noderef] __iomem *
>> drivers/watchdog/sb_wdog.c:306:34: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/watchdog/sb_wdog.c:320:22: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/watchdog/sb_wdog.c:330:22: sparse: sparse: cast removes address space '__iomem' of expression

vim +268 drivers/watchdog/sb_wdog.c

75c752e6c3147f5 Andrew Sharp     2007-12-13  253  
75c752e6c3147f5 Andrew Sharp     2007-12-13  254  /*
75c752e6c3147f5 Andrew Sharp     2007-12-13  255   * interrupt handler
75c752e6c3147f5 Andrew Sharp     2007-12-13  256   *
75c752e6c3147f5 Andrew Sharp     2007-12-13  257   * doesn't do a whole lot for user, but oh so cleverly written so kernel
75c752e6c3147f5 Andrew Sharp     2007-12-13  258   * code can use it to re-up the watchdog, thereby saving the kernel from
75c752e6c3147f5 Andrew Sharp     2007-12-13  259   * having to create and maintain a timer, just to tickle another timer,
75c752e6c3147f5 Andrew Sharp     2007-12-13  260   * which is just so wrong.
75c752e6c3147f5 Andrew Sharp     2007-12-13  261   */
75c752e6c3147f5 Andrew Sharp     2007-12-13  262  irqreturn_t sbwdog_interrupt(int irq, void *addr)
75c752e6c3147f5 Andrew Sharp     2007-12-13  263  {
75c752e6c3147f5 Andrew Sharp     2007-12-13  264  	unsigned long wd_init;
75c752e6c3147f5 Andrew Sharp     2007-12-13  265  	char *wd_cfg_reg = (char *)addr;
75c752e6c3147f5 Andrew Sharp     2007-12-13  266  	u8 cfg;
75c752e6c3147f5 Andrew Sharp     2007-12-13  267  
75c752e6c3147f5 Andrew Sharp     2007-12-13 @268  	cfg = __raw_readb(wd_cfg_reg);
75c752e6c3147f5 Andrew Sharp     2007-12-13 @269  	wd_init = __raw_readq(wd_cfg_reg - 8) & 0x7fffff;
75c752e6c3147f5 Andrew Sharp     2007-12-13  270  
75c752e6c3147f5 Andrew Sharp     2007-12-13  271  	/*
75c752e6c3147f5 Andrew Sharp     2007-12-13  272  	 * if it's the second watchdog timer, it's for those users
75c752e6c3147f5 Andrew Sharp     2007-12-13  273  	 */
df3c9de3dee539c Alan Cox         2008-05-19  274  	if (wd_cfg_reg == user_dog)
27c766aaacb265d Joe Perches      2012-02-15  275  		pr_crit("%s in danger of initiating system reset "
a77dba7e444a661 Wim Van Sebroeck 2009-04-14  276  			"in %ld.%01ld seconds\n",
a77dba7e444a661 Wim Van Sebroeck 2009-04-14  277  			ident.identity,
a77dba7e444a661 Wim Van Sebroeck 2009-04-14  278  			wd_init / 1000000, (wd_init / 100000) % 10);
df3c9de3dee539c Alan Cox         2008-05-19  279  	else
75c752e6c3147f5 Andrew Sharp     2007-12-13  280  		cfg |= 1;
75c752e6c3147f5 Andrew Sharp     2007-12-13  281  
75c752e6c3147f5 Andrew Sharp     2007-12-13  282  	__raw_writeb(cfg, wd_cfg_reg);
75c752e6c3147f5 Andrew Sharp     2007-12-13  283  
75c752e6c3147f5 Andrew Sharp     2007-12-13  284  	return IRQ_HANDLED;
75c752e6c3147f5 Andrew Sharp     2007-12-13  285  }
75c752e6c3147f5 Andrew Sharp     2007-12-13  286  
75c752e6c3147f5 Andrew Sharp     2007-12-13  287  static int __init sbwdog_init(void)
75c752e6c3147f5 Andrew Sharp     2007-12-13  288  {
75c752e6c3147f5 Andrew Sharp     2007-12-13  289  	int ret;
75c752e6c3147f5 Andrew Sharp     2007-12-13  290  
75c752e6c3147f5 Andrew Sharp     2007-12-13  291  	/*
75c752e6c3147f5 Andrew Sharp     2007-12-13  292  	 * register a reboot notifier
75c752e6c3147f5 Andrew Sharp     2007-12-13  293  	 */
75c752e6c3147f5 Andrew Sharp     2007-12-13  294  	ret = register_reboot_notifier(&sbwdog_notifier);
75c752e6c3147f5 Andrew Sharp     2007-12-13  295  	if (ret) {
27c766aaacb265d Joe Perches      2012-02-15  296  		pr_err("%s: cannot register reboot notifier (err=%d)\n",
75c752e6c3147f5 Andrew Sharp     2007-12-13  297  		       ident.identity, ret);
75c752e6c3147f5 Andrew Sharp     2007-12-13  298  		return ret;
75c752e6c3147f5 Andrew Sharp     2007-12-13  299  	}
75c752e6c3147f5 Andrew Sharp     2007-12-13  300  
75c752e6c3147f5 Andrew Sharp     2007-12-13  301  	/*
75c752e6c3147f5 Andrew Sharp     2007-12-13  302  	 * get the resources
75c752e6c3147f5 Andrew Sharp     2007-12-13  303  	 */
75c752e6c3147f5 Andrew Sharp     2007-12-13  304  
86b591288045353 Yong Zhang       2011-09-07  305  	ret = request_irq(1, sbwdog_interrupt, IRQF_SHARED,
75c752e6c3147f5 Andrew Sharp     2007-12-13 @306  		ident.identity, (void *)user_dog);
75c752e6c3147f5 Andrew Sharp     2007-12-13  307  	if (ret) {
27c766aaacb265d Joe Perches      2012-02-15  308  		pr_err("%s: failed to request irq 1 - %d\n",
df3c9de3dee539c Alan Cox         2008-05-19  309  		       ident.identity, ret);
ae44855ae8b36e4 Akinobu Mita     2010-08-21  310  		goto out;
75c752e6c3147f5 Andrew Sharp     2007-12-13  311  	}
75c752e6c3147f5 Andrew Sharp     2007-12-13  312  
df3c9de3dee539c Alan Cox         2008-05-19  313  	ret = misc_register(&sbwdog_miscdev);
df3c9de3dee539c Alan Cox         2008-05-19  314  	if (ret == 0) {
27c766aaacb265d Joe Perches      2012-02-15  315  		pr_info("%s: timeout is %ld.%ld secs\n",
df3c9de3dee539c Alan Cox         2008-05-19  316  			ident.identity,
df3c9de3dee539c Alan Cox         2008-05-19  317  			timeout / 1000000, (timeout / 100000) % 10);
ae44855ae8b36e4 Akinobu Mita     2010-08-21  318  		return 0;
ae44855ae8b36e4 Akinobu Mita     2010-08-21  319  	}
df3c9de3dee539c Alan Cox         2008-05-19  320  	free_irq(1, (void *)user_dog);
ae44855ae8b36e4 Akinobu Mita     2010-08-21  321  out:
ae44855ae8b36e4 Akinobu Mita     2010-08-21  322  	unregister_reboot_notifier(&sbwdog_notifier);
ae44855ae8b36e4 Akinobu Mita     2010-08-21  323  
75c752e6c3147f5 Andrew Sharp     2007-12-13  324  	return ret;
75c752e6c3147f5 Andrew Sharp     2007-12-13  325  }
75c752e6c3147f5 Andrew Sharp     2007-12-13  326  

:::::: The code at line 268 was first introduced by commit
:::::: 75c752e6c3147f596c13365b200b91d754b66f59 [WATCHDOG] Add support for SB1 hardware watchdog

:::::: TO: Andrew Sharp <andy.sharp@onstor.com>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
