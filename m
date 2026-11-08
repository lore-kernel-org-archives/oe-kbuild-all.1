Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170654;
	b=qNmNYJ8+r2GqM1YGRfd8GhPHRDJDEAVtSddrjmbd8JZ9WDZG//pKWD4nTUUhqbLobhc7
	 otX25vTwyHyxlvcDYrO34f763zY+efD22aj4Dz7P/ozn712cMm2ltWrlHtlXJfLeU/8of
	 irj0HVG48+DooYFI0N9eRVDwCWYwdB+2SSOxKXYoyDZkUH7UgtVNHNbMXsKdpI8xNDQJG
	 iCdfP4p7qs20/8Wzt8Oo5U5XCZKckV0GaRtMh1xdrfX0ruU4JJZkh/nDcLSxHkqIEsAVs
	 20vCw2WOGXLcsduEYIyQXmpJlXuYWCsU1ChEa8j4VGFpriLCHIM7bircwpbDSIVzmAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170654;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CSvFUDL+6B0wMdPs/yS0DkU4wAtYa1x+7E1Q0ljGyyI=;
	b=4SayvHRptHiIeDAchn5E0+9jezEVwDO5nv+N8uIHgv5lqZuivPnZ2kmzAQ4vsYolWXlx
	 4Hp447Cv3H/ZZuWyu/h8mXNDmTuXhbAYmoNW8JYVaWzjYj0kCd5FFOCx64L9i8pWXzqoQ
	 Ciqzy5TDLdbkVAGkuCKnAC8gguOBfDggnz7etSImGZbY9LbiWvb0e8/oHJJIUhkWkFe9M
	 h4J+5nKX5YJMCpFSyRHsoa856f3Riml0Y3G+5cH0NsYW9G4QxJc25ONBGYO+u5oTlAgDz
	 zKPGFxeGYTOo3BK52GH/rtsa4G7/pII00onE7Fj/g+fnfu3Vj+EfFZ5SJune5qOU3OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLxVD7yP;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9EA606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 20:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A9EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLxVD7yP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794170652; x=1825706652;
  h=date:from:to:cc:subject:message-id;
  bh=P6BPofh6puZMtDO0PjhE8xRK8saaIL7rA1c0rgjinwQ=;
  b=nLxVD7yPZlTiWvNaJ8DV5eXTSuu6pzL9HjjQvHzNVYOUpqe2Q/vhbMdg
   ZChzI9vfoH8zDTUSi/p+8M4/lSiksdNBQuxO7eiLMDgOLDenToMkQqnnG
   ypYMrTBaP+/HsCHa4qB+3D/dhf/RfyXclhlCZP01ee2DMLJPTqlnMSOM8
   tPcHIkx1R10d62GKQi3suoqEtTOLlptRb4whnYIcJn3uezrZGSIsLZU5a
   NDPCH6c05QCwjudmaFn8rSFmr+dcn0e0e77YoJH3EB8zXSkSz3SC5amej
   HIYF2xQMjMLfMFdxU8VMYt2r/NNmpKIwSIO21yEz6GxYS5oQM6O06XfcF
   Q==;
X-CSE-ConnectionGUID: e+6hoz2dSZK18vmTOflP4w==
X-CSE-MsgGUID: ogmItW75SP2B9meGGCiW2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2771606"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2771606"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 12:44:11 -0800
X-CSE-ConnectionGUID: C8Nurh34SfGTWFsZcnE2yw==
X-CSE-MsgGUID: QBDlOd62T3m8a1jMvVTNRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7749316"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 08 Nov 2026 12:44:10 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ9kF-00000000Bj3-1XvX;
	Sun, 08 Nov 2026 20:44:07 +0000
Date: Sun, 08 Nov 2026 21:43:34 +0100
From: kernel test robot <lkp@intel.com>
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_watchdog_v1 98/98]
 drivers/watchdog/riscv_sbi_wdt.c:327:30: sparse: sparse: incorrect type in
 assignment (different modifiers)
Message-ID: <202611082116.ghWYccqf-lkp@intel.com>
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
config: riscv-randconfig-r2304-20261108 (https://download.01.org/0day-ci/archive/20261108/202611082116.ghWYccqf-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611082116.ghWYccqf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611082116.ghWYccqf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/watchdog/riscv_sbi_wdt.c:327:30: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected struct imsic_global_config *imsic_global @@     got struct imsic_global_config const * @@
   drivers/watchdog/riscv_sbi_wdt.c:327:30: sparse:     expected struct imsic_global_config *imsic_global
   drivers/watchdog/riscv_sbi_wdt.c:327:30: sparse:     got struct imsic_global_config const *

vim +327 drivers/watchdog/riscv_sbi_wdt.c

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
