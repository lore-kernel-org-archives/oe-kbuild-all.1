Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A321C5F10
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 00:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765586749; cv=none; b=Qq0e0e3JjzA2b5ENuPe+sI9qqUHlsQIEwZCyOVZ9srK2dJi7JAyozHiZbU1MjdPx2JLrGNL42n6GNyH9GTk8YdvFeZMi8QHXvxCh97e6i1+Jo159ZXBgyAANEOisUgiCQvVBQ3msZ40+Du+IxuWdaVnE28UMAHxR5+uyyL9jTFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765586749; c=relaxed/simple;
	bh=kT0NkD33krs2Sx6qIpReLrdOQOOxTWTnoYqI6wONSIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=St72z2HUU8yArAX1yly8TFXLE5f5GK1d1n9HYfHddTnqwoZAjOREc9fQbDySBaLARLcWDL7eQ3zS/ILoiyC5D6Yq5oyCxN9FqKMxSwFzzFLG2t0MRDr7tN6kurIIMDOSaF1jY2C0ecniTStSwH6U7bWNwjG7+CNkNj+2zM8yxVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Op/5Aq7o; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Op/5Aq7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765586748; x=1797122748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kT0NkD33krs2Sx6qIpReLrdOQOOxTWTnoYqI6wONSIQ=;
  b=Op/5Aq7ozWBUZ8sCLZTElDZfDClkO84hI06nTds85h86Bsi159jlwfI0
   /Z4eBOwTkeEx8Sqa5CQWWFWhoLDFDPI0VUdMIy5+9P/Og3HORRlAACjYJ
   GcNdJXoZ+Jr7sIkKi47DuKaSMeRNMpMEbDFwlU+myS0EYTyxwzyXJ9cXh
   c2AtBXtiIPXvmuqqxNkCtYTRS5TU+EiHjrn1Qx1rLshPkf1y8h/Mok619
   pGqdbXKTaJjSqSFgmsqaozSYb393M8WAoDE5UijvzlAtCPXMbwnV+1K8M
   SDVgsQdW24q8Bf2AE3J4ux9cq8m4h14jrm/qDJ4fwPDw5MmFCoTSVb6/v
   A==;
X-CSE-ConnectionGUID: LUrHaW7tRGa7TwhxwZYMEA==
X-CSE-MsgGUID: 3EHiBccbRGSxWrltoGjYug==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71219665"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="71219665"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 16:45:47 -0800
X-CSE-ConnectionGUID: p8taFkBSSDKkmSqBjhpQQA==
X-CSE-MsgGUID: PSSoBW2pQtaEGCoNHsoDDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196290215"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 16:45:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUDlW-000000006qz-28S3;
	Sat, 13 Dec 2025 00:45:42 +0000
Date: Sat, 13 Dec 2025 08:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: drivers/input/misc/pf1550-onkey.c:154:12: warning:
 'pf1550_onkey_resume' defined but not used
Message-ID: <202512130847.kSvqRrBq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 9acb215cbebdce721af2219e2859ad17342c9084 Input: pf1550 - add onkey support
date:   7 weeks ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20251213/202512130847.kSvqRrBq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130847.kSvqRrBq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130847.kSvqRrBq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/misc/pf1550-onkey.c:154:12: warning: 'pf1550_onkey_resume' defined but not used [-Wunused-function]
     154 | static int pf1550_onkey_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/input/misc/pf1550-onkey.c:133:12: warning: 'pf1550_onkey_suspend' defined but not used [-Wunused-function]
     133 | static int pf1550_onkey_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/pf1550_onkey_resume +154 drivers/input/misc/pf1550-onkey.c

   153	
 > 154	static int pf1550_onkey_resume(struct device *dev)
   155	{
   156		struct platform_device *pdev = to_platform_device(dev);
   157		struct onkey_drv_data *onkey = platform_get_drvdata(pdev);
   158		int i, irq;
   159	
   160		if (!device_may_wakeup(&pdev->dev))
   161			regmap_write(onkey->pf1550->regmap,
   162				     PF1550_PMIC_REG_ONKEY_INT_MASK0,
   163				     ~((u8)(ONKEY_IRQ_PUSHI | ONKEY_IRQ_1SI |
   164				     ONKEY_IRQ_2SI | ONKEY_IRQ_3SI | ONKEY_IRQ_4SI |
   165				     ONKEY_IRQ_8SI)));
   166		else
   167			for (i = 0; i < PF1550_ONKEY_IRQ_NR; i++) {
   168				irq = platform_get_irq(pdev, i);
   169				if (irq > 0)
   170					disable_irq_wake(irq);
   171			}
   172	
   173		return 0;
   174	}
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
