Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AE722097
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 04:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782794899; cv=none; b=uO8IW/eJG7SIbTJQKMK41Rli3qTJy+JlQyrOS09g62caL+5J/aF/WPoiIb33igZR89yxATg1GBAF7il/2+2QOZyMec7XT0pkSo0E90A0fnw/sB32HlfdpgIW6mjE127R+7S9/9azvUjCU1ujVIzgYP7hFXOWf9UgysOdkda0VJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782794899; c=relaxed/simple;
	bh=511abHcNoO2onubH2ITEr9E5Sa7oU1SNEf3+KSwUEgM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fV1uvfJP0vzV1PCh7n1HcRUCPRFoSdV44fldEWKgxTAmRQHY/xfJzdlIJgmV+7fgQfCSw88v7p+FcYzD2FnFSRkvTS3uJo8Hy95pxDAvxlRTINBwTmcpk4KtvUiuZzDOoWKP3/BvrcyBHf+R+t2H/1rgEm0FOCTU4FjrCruZfmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dof06mAr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dof06mAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782794898; x=1814330898;
  h=date:from:to:cc:subject:message-id;
  bh=511abHcNoO2onubH2ITEr9E5Sa7oU1SNEf3+KSwUEgM=;
  b=dof06mAr2pPA4hHAcUJZHg1m0DbOEoMXu6T3UI6O3uS5cd1n2SfYO09a
   ypuIuugn8CmtsE0b5hffUH5K1gyLS77fZiWujhckUYRHrAKzvYf5WcbW4
   cHOuD5lrGiG7nmT+73dtrhgap860V9QopbbjZURrlhdWxFLcfWIyL3Duc
   S8MgRqWn9/dPaPgitxY7+qPVczVKZOAJvco/G2SmEInBKQxe8lDxwopHl
   ISKkkH9y7iGh/nzUVZJVr0cEyofR9UkQ3HZqF9pJrj1lQSuO70yAIe/YX
   56nVIUV+3lUVkitid9MFUdY1p6cGdHAMf69amhgbMPX6qr18j8Zs9NxrF
   g==;
X-CSE-ConnectionGUID: QN8IgSe1TUyn7nLm9yqu/Q==
X-CSE-MsgGUID: +QyLymwFTKOxpG0ECOgYIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83274625"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83274625"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 21:48:18 -0700
X-CSE-ConnectionGUID: zAMni6ilR4CC3Ozpd+Gp/A==
X-CSE-MsgGUID: k6QlnGrDR7+FXiG12LfNJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="248175687"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jun 2026 21:48:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weQNj-00000000819-34gg;
	Tue, 30 Jun 2026 04:47:42 +0000
Date: Tue, 30 Jun 2026 12:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>
Subject: [libata:for-7.2-fixes 5/5]
 drivers/ata/sata_dwc_460ex.c:1125:29: warning: unused variable 'np'
Message-ID: <202606301243.9MrXM4WY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git for-7.2-fixes
head:   3c234b01c9dccf995e663bc46baaf4294f30c386
commit: 3c234b01c9dccf995e663bc46baaf4294f30c386 [5/5] ata: sata_dwc_460ex: use platform_get_irq()
config: sparc64-randconfig-001-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301243.9MrXM4WY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301243.9MrXM4WY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301243.9MrXM4WY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ata/sata_dwc_460ex.c: In function 'sata_dwc_probe':
>> drivers/ata/sata_dwc_460ex.c:1125:29: warning: unused variable 'np' [-Wunused-variable]
    1125 |         struct device_node *np = dev->of_node;
         |                             ^~


vim +/np +1125 drivers/ata/sata_dwc_460ex.c

62936009f35a66 Rupjyoti Sarmah 2010-07-06  1121  
1c48a5c93da631 Grant Likely    2011-02-17  1122  static int sata_dwc_probe(struct platform_device *ofdev)
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1123  {
f1550f27f8a92a Andy Shevchenko 2021-12-09  1124  	struct device *dev = &ofdev->dev;
f1550f27f8a92a Andy Shevchenko 2021-12-09 @1125  	struct device_node *np = dev->of_node;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1126  	struct sata_dwc_device *hsdev;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1127  	u32 idr, versionr;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1128  	char *ver = (char *)&versionr;
175553ed18491b Mans Rullgard   2016-04-26  1129  	void __iomem *base;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1130  	int err = 0;
4aaa71873ddb9f Andy Shevchenko 2015-01-07  1131  	int irq;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1132  	struct ata_host *host;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1133  	struct ata_port_info pi = sata_dwc_port_info[0];
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1134  	const struct ata_port_info *ppi[] = { &pi, NULL };
73ec1b5ab3a713 Andy Shevchenko 2016-04-26  1135  	struct resource *res;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1136  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1137  	/* Allocate DWC SATA device */
f1550f27f8a92a Andy Shevchenko 2021-12-09  1138  	host = ata_host_alloc_pinfo(dev, ppi, SATA_DWC_MAX_PORTS);
f1550f27f8a92a Andy Shevchenko 2021-12-09  1139  	hsdev = devm_kzalloc(dev, sizeof(*hsdev), GFP_KERNEL);
d537fc0c0e23ce Andy Shevchenko 2015-01-08  1140  	if (!host || !hsdev)
c592b74f6b8ba7 Andy Shevchenko 2015-01-08  1141  		return -ENOMEM;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1142  
d537fc0c0e23ce Andy Shevchenko 2015-01-08  1143  	host->private_data = hsdev;
d537fc0c0e23ce Andy Shevchenko 2015-01-08  1144  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1145  	/* Ioremap SATA registers */
f713961de50577 Andy Shevchenko 2021-12-09  1146  	base = devm_platform_get_and_ioremap_resource(ofdev, 0, &res);
01c292068e43e7 Wei Yongjun     2016-07-19  1147  	if (IS_ERR(base))
73ec1b5ab3a713 Andy Shevchenko 2016-04-26  1148  		return PTR_ERR(base);
f1550f27f8a92a Andy Shevchenko 2021-12-09  1149  	dev_dbg(dev, "ioremap done for SATA register address\n");
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1150  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1151  	/* Synopsys DWC SATA specific Registers */
175553ed18491b Mans Rullgard   2016-04-26  1152  	hsdev->sata_dwc_regs = base + SATA_DWC_REG_OFFSET;
d6ecf0c27d7166 Andy Shevchenko 2016-04-26  1153  	hsdev->dmadr = res->start + SATA_DWC_REG_OFFSET + offsetof(struct sata_dwc_regs, dmadr);
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1154  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1155  	/* Setup port */
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1156  	host->ports[0]->ioaddr.cmd_addr = base;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1157  	host->ports[0]->ioaddr.scr_addr = base + SATA_DWC_SCR_OFFSET;
ae95d951f7cd11 Mans Rullgard   2016-04-26  1158  	sata_dwc_setup_port(&host->ports[0]->ioaddr, base);
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1159  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1160  	/* Read the ID and Version Registers */
ee81d6cc8e8aa6 Mans Rullgard   2016-04-26  1161  	idr = sata_dwc_readl(&hsdev->sata_dwc_regs->idr);
ee81d6cc8e8aa6 Mans Rullgard   2016-04-26  1162  	versionr = sata_dwc_readl(&hsdev->sata_dwc_regs->versionr);
f1550f27f8a92a Andy Shevchenko 2021-12-09  1163  	dev_notice(dev, "id %d, controller version %c.%c%c\n", idr, ver[0], ver[1], ver[2]);
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1164  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1165  	/* Save dev for later use in dev_xxx() routines */
f1550f27f8a92a Andy Shevchenko 2021-12-09  1166  	hsdev->dev = dev;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1167  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1168  	/* Enable SATA Interrupts */
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1169  	sata_dwc_enable_interrupts(hsdev);
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1170  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1171  	/* Get SATA interrupt number */
3c234b01c9dccf Rosen Penev     2026-06-28  1172  	irq = platform_get_irq(ofdev, 0);
3c234b01c9dccf Rosen Penev     2026-06-28  1173  	if (irq < 0)
3c234b01c9dccf Rosen Penev     2026-06-28  1174  		return irq;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  1175  

:::::: The code at line 1125 was first introduced by commit
:::::: f1550f27f8a92a4d29329aeeb28b743365abceae ata: sata_dwc_460ex: Use temporary variable for struct device

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
