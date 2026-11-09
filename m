Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184693;
	b=Zt3/+0Cq47luvQgRBVuWL3RxoO3bCKPfERMW2xYEA/B3CCBI2PFeXJjHRHGiLUR59UBN
	 UHBX/J4bFzQGtSjrs5rtTd+Shhyt7ApX5FiF2t2ATHZXU/rICSDvsDk8fBMPZfelkSfw0
	 VMx879Rg6IOa+DyWMKhql9EQ4rbYV4pU9aCI+0SjYLQFsFTXk5lxyvgRiPSvl2sqg3Im9
	 6H/EQm648cGS4MlBlOz19cGNtRLRptvCYeEKd5CgEDWkTNvkw37FanXFAV9bmAbAIo6dE
	 hECcHg4xDLy5krl0rtY45zP163fy8QPs+epkGACMokAzYfvMNUdcxWZnseBRejiWIdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184693;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fdwk7Kc1sKHiW094N3tsa0mCBXJAyZnd45dO6zBwhwU=;
	b=bbASOnF092p7u5uLmWkF6fIzvqGmisMgi+V1NmG1z9Di4AwBIQPNo70+fTUwi6g/6xV8
	 qKaGyxT7lT6ooXzWcP+5VFj0+/A7t4wxovCc1QAo0+aB2L3JoSBl0JeyMSHly+TBWN93i
	 PnvFH5MpOhxh5UPWvLnP3YF4/xraz4mgFvFVc0kvnQwbNR4BikETHo81tHrx5BxuhnP66
	 gVfMBSEhDmPqJTmrCflq1yk6DiO/O6/1st6bL7MBTvj+ZWHyUWQSF7s6Sgi5M5BbemWLA
	 pqVebGZLaYh4TtdHWXIQqGH1YfZbxV13xy88SNwPFiiF1VERk5R/cPrnmZ2tfoOHgoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QBrCzRCq;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ADC606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 00:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63ADC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QBrCzRCq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794184691; x=1825720691;
  h=date:from:to:cc:subject:message-id;
  bh=8w/nbjvaxrpJSl8BaRYVfUZb7J4h9k5NBvlUPJq0lqk=;
  b=QBrCzRCqWR/wdhRCKrZD/r8EU1rX3uAMXVLq4yV0j+Sf1DiJtxAsGJ2t
   ToZJj0pvofBP4sh8xI3B0zR3qzYllK35xzhSpX3kyQfWHIm5l2O7zKKeb
   4Rfzn/9mGzuuMEZU4dCI7zWxZU+6EatJ5goUSOTq2iHYpEd8o6z3NJA6i
   WUS/N9jdG/nW/33caOv9dKM7JKfQAG4Sx9WTiqVNQ+pxbI6AQTMWGwxUg
   FuuJ/kv+P8KWXnJsacjfmiVvYccV5O9HDh8nGQyjKmuGMo9yCEowRAxJh
   VyhCMLeIzIiiTKgqjmbItJvv5HYssg65czZnner63cMP+qj3zrDhZYx9F
   A==;
X-CSE-ConnectionGUID: vYBIVLmzT/CkdBLVvMl7ww==
X-CSE-MsgGUID: cync8FWRRKqjH+mwqOi5vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2950428"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2950428"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 16:38:10 -0800
X-CSE-ConnectionGUID: gDTUc5WTR9etRkklb+zdgQ==
X-CSE-MsgGUID: urPBh0XrTJ+1ET6TTgrbIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7607559"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Nov 2026 16:38:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQDOh-00000000tcF-1YD5;
	Mon, 09 Nov 2026 00:38:07 +0000
Date: Mon, 09 Nov 2026 08:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_watchdog_v1 98/98]
 drivers/watchdog/riscv_sbi_wdt.c:327:16: warning: assignment discards 'const'
 qualifier from pointer target type
Message-ID: <202611090829.Od82OdZr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sbi_watchdog_v1
head:   929bf13433e242a3f255f463b2fb44633e102e0d
commit: 929bf13433e242a3f255f463b2fb44633e102e0d [98/98] drivers/watchdog: Add RISC-V SBI watchdog driver
config: riscv-randconfig-1001-20261109 (https://download.01.org/0day-ci/archive/20261109/202611090829.Od82OdZr-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090829.Od82OdZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090829.Od82OdZr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/riscv_sbi_wdt.c: In function 'sbiwdt_probe':
>> drivers/watchdog/riscv_sbi_wdt.c:327:16: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      imsic_global = imsic_get_global_config();
                   ^


vim +/const +327 drivers/watchdog/riscv_sbi_wdt.c

   298	
   299	static int sbiwdt_probe(struct platform_device *pdev)
   300	{
   301		struct sbiwdt *wdt;
   302		struct imsic_global_config *imsic_global;
   303		struct irq_domain *msi_domain;
   304		struct device *dev = &pdev->dev;
   305		int rc;
   306	
   307		/* Allocate memory for the global watchdog structure */
   308		wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
   309		if (!wdt)
   310			return -ENOMEM;
   311	
   312		platform_set_drvdata(pdev, wdt);
   313		watchdog_set_drvdata(&wdt->wdd, wdt);
   314	
   315		/* Initialiaze watchdog attributes */
   316		rc = sbiwdt_init_attributes(wdt);
   317		if (rc) {
   318			dev_err(dev, "Failed to read SBI watchdog attributes: %d\n", rc);
   319			return rc;
   320		}
   321	
   322		wdt->wdd.info = &sbiwdt_info;
   323		wdt->wdd.ops = &sbiwdt_ops;
   324	
   325		/* Setup MSI if the capability is available */
   326		if (wdt->attrs.wdt_capability & SBI_WDT_CAP_MSI_SUPPORT_MASK) {
 > 327			imsic_global = imsic_get_global_config();
   328			if (!imsic_global) {
   329				dev_err(dev, "IMSIC firmware node is unavailable\n");
   330				return -ENODEV;
   331			}
   332	
   333			msi_domain = irq_find_matching_fwnode(imsic_global->fwnode,
   334								DOMAIN_BUS_PLATFORM_MSI);
   335	
   336			if (!msi_domain) {
   337				dev_err(dev, "IMSIC platform MSI domain is unavailable\n");
   338				return -ENODEV;
   339			}
   340	
   341			dev_set_msi_domain(&pdev->dev, msi_domain);
   342	
   343			/* MSI setup*/
   344			rc = platform_device_msi_init_and_alloc_irqs(dev, 1, sbiwdt_msi_write);
   345			if (rc) {
   346				dev_err(dev, "Failed to allocate MSIs\n");
   347				return rc;
   348			}
   349	
   350			wdt->virq = msi_get_virq(dev, 0);
   351			if (!wdt->virq) {
   352				dev_err(dev, "Failed to get MSI virtual IRQ: %d\n", wdt->virq);
   353				return wdt->virq;
   354			}
   355	
   356			rc = devm_request_irq(dev, wdt->virq,
   357						sbiwdt_pretimeout_handler,
   358						0, "sbiwdt-pretimeout", wdt);
   359			if (rc) {
   360				dev_err(dev, "Failed to request pretimeout IRQ: %d\n", rc);
   361				return rc;
   362			}
   363		}
   364	
   365		rc = devm_watchdog_register_device(dev, &wdt->wdd);
   366		if (rc) {
   367			dev_err(dev, "Failed to register RISC-V SBI watchdog device\n");
   368			return rc;
   369		}
   370	
   371		dev_info(&pdev->dev, "RISC-V SBI Watchdog registered\n");
   372	
   373		return 0;
   374	}
   375	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
