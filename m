Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D7A18991E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 00:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760057602; cv=none; b=u2USn1FT/MDilszo+lN4wA687xNhduDxP7jv0gVvwaXvx3ozcWNRuyeS+q6kmOwbUpBgrnYHIfEbjhd+vpjyVJfel3XZTmwBIHgmgeZ/2wwOeJSt4lNhYKCkDvLCa0AQ8G2s3mciLQaiphkOHYxojZNnZFlAQzyD4Al/Q2CGoJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760057602; c=relaxed/simple;
	bh=IDDIoN3AO43IPWR+476Nfk+IfhE/v3Go1kWpRo1tduA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tz95Bixa/CNeivwpfacpgFKSw/alNE9UOfzAuumbTKJPySQFQYWgaUwjBvZk5eayZOVX9xumvpoFgNRsb+xtRz/bCrwtBDjulUybVdw5ExlHaJ+whgZfm4WflxQK50kS7bgjQJDUl/Av+BHe3T+Grp6YgpFvv4LQF+tvd136MLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgzGEPDZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgzGEPDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760057601; x=1791593601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IDDIoN3AO43IPWR+476Nfk+IfhE/v3Go1kWpRo1tduA=;
  b=PgzGEPDZMGFGnUrnhtxtdpNmn4T6iDKzC8odgDvaGUe8cawRJvDJoChc
   D4RSDhJNB2ecV4TDzQdeSIJRsF3YZWv95VaVRynwgnLlh0fk95knzrItS
   rdNjpddyvr/VQXsUANVRJzxjJQwEFMlXNBNiyZwCDyHom9tcj6b+Owq/B
   FhJ4bUynWdTud/IxIkDwyTMB2pEuFFxfeO4tflfQGK0MzRLsFEPEM0nA2
   v6IOartzP7+TQwsCYAz49rx5QL1sPMjTk3cL2YLz12ycugOAOUubJgya0
   Q8hKJ5xuNIBULqAWf7rsaadh18NQof8HcPfw2pY2NFqw1nm/COvtE1NMy
   Q==;
X-CSE-ConnectionGUID: YTVYksmXQLirsaIgFfYxeA==
X-CSE-MsgGUID: pj506N/iQW+NFsSFeoULWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64898212"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="64898212"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 17:53:18 -0700
X-CSE-ConnectionGUID: IxpHoQcCRnKjFM2OH4FpDw==
X-CSE-MsgGUID: MIxWJkpRQJOu6ptPBiryeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="211497283"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2025 17:53:17 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v71Ni-0001h7-2K;
	Fri, 10 Oct 2025 00:53:14 +0000
Date: Fri, 10 Oct 2025 08:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-wrapped-keys-pixel 3/5]
 drivers/soc/google/gsa_mbox.c:154:28: sparse: sparse: incorrect type in
 return expression (different address spaces)
Message-ID: <202510100807.qOUhQWBv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-wrapped-keys-pixel
head:   ecc5e8a50b95d1f6fc660f096cf5898c504c5faf
commit: d64dd19171cd5ed080da78948efd530080ba42fa [3/5] soc: google: Add driver for Google Security Anchor (GSA)
config: riscv-randconfig-r122-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100807.qOUhQWBv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100807.qOUhQWBv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100807.qOUhQWBv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/google/gsa_mbox.c:154:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct gsa_mbox * @@     got void [noderef] __iomem *base @@
   drivers/soc/google/gsa_mbox.c:154:28: sparse:     expected struct gsa_mbox *
   drivers/soc/google/gsa_mbox.c:154:28: sparse:     got void [noderef] __iomem *base

vim +154 drivers/soc/google/gsa_mbox.c

   132	
   133	struct gsa_mbox *gsa_mbox_init(struct platform_device *pdev)
   134	{
   135		struct device *dev = &pdev->dev;
   136		struct gsa_mbox *mbox;
   137		struct resource *res;
   138		int err;
   139	
   140		mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
   141		if (!mbox)
   142			return ERR_PTR(-ENOMEM);
   143	
   144		mbox->dev = dev;
   145		spin_lock_init(&mbox->slock);
   146		mutex_init(&mbox->mbox_lock);
   147		init_completion(&mbox->mbox_cmd_completion);
   148	
   149		/* map mbox registers */
   150		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   151		mbox->base = devm_ioremap_resource(dev, res);
   152		if (IS_ERR(mbox->base)) {
   153			dev_err(dev, "ioremap failed (%ld)\n", PTR_ERR(mbox->base));
 > 154			return mbox->base;
   155		}
   156	
   157		/* place hardware into known state */
   158		mbox->exp_intmr0 = 0xFFFF;
   159		writel(mbox->exp_intmr0, mbox->base + MBOX_INTMR0_REG);
   160	
   161		/* register mbox interrupt */
   162		mbox->irq = platform_get_irq(pdev, 0);
   163		if (mbox->irq < 0)
   164			return ERR_PTR(mbox->irq);
   165		err = devm_request_irq(dev, mbox->irq, gsa_mbox_irq_handler, 0,
   166				       "gsa-mbox-irq", mbox);
   167		if (err) {
   168			dev_err(dev, "request_irq failed (%d)\n", err);
   169			return ERR_PTR(err);
   170		}
   171	
   172		return mbox;
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
