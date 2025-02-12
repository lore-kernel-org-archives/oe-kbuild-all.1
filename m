Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A925360
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 00:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739318786; cv=none; b=JfM137B/IW3dSmGNARm4807Hdqlp4wu5a2rQo1WdIyDN4kgrBf9Utx30qJnCW0PaHWSicbsK+VEJLAKdNuYsMPxZhoj1b2D/7qaXxeZo1oVlVktqOnfQunmn+eBNpYDsDR5+Pz+aKTGTuM5R5pu1pP/qx65F6bMnhQpVpFz/How=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739318786; c=relaxed/simple;
	bh=Nw1pW51z8RRBFF3SXySYIjDl45d/LuoIEsJk27yjeMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uu2vIVDBfQmfMw9Jrp+/68Y9o3WXpBbRl90DGxyoEQWZcJaLZJTipxtrgdodUMDuEh8+xAf5g4hE5TVSSGl2Gu+wMDA7ohVce6fRJ1VAvJBLAjoR2VVhBfBJ5XNlIGvMIauMyXf/uULupliMcAjm1RzVHLALDokRsRXECxHfrh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMSrqh0I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMSrqh0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739318784; x=1770854784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nw1pW51z8RRBFF3SXySYIjDl45d/LuoIEsJk27yjeMw=;
  b=QMSrqh0I4S9TMfVbZ6cPVGOGzRAHdw2Ygp3XUb9b8LBboSUC/Wan24H4
   MkDAMOHPZ26rWye9rTpZpSpp3xgNXZwwLZeElQu/w/W6T5SbBUuN0ZY6W
   AojwHW9REt7ebwigmQaz2mH1KRFBItczyQAxTHSuCrDNwu4zspfdSfj+3
   kmHlPF9wEEAnsPEcoLZ0RYmZ7Pol9a3y4P1ISN/aa9+Kp6GLdaEr0WblI
   nx1r0xmvnsovnmIgDRoI9YL+i5QUwLW11L4/LFl5DvS+YGLjKyUp5ftiN
   8lL7BHvxRp4vJxdtiDHiBP1s//h6NvX8lX3Hj7/pfGMr182vP50pSV9vN
   g==;
X-CSE-ConnectionGUID: APD0KQwSS56M0529eVSG/g==
X-CSE-MsgGUID: pU6JN6GaTOGt2Cr8qZwpWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43886061"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="43886061"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 16:06:24 -0800
X-CSE-ConnectionGUID: wEtoDJkZRuSReLXuzjpJ4w==
X-CSE-MsgGUID: o92DL3AFSUCiqgY1G7H0NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117599625"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Feb 2025 16:06:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti0Gi-0014rh-1p;
	Wed, 12 Feb 2025 00:06:20 +0000
Date: Wed, 12 Feb 2025 08:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Somlo <gsomlo@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [litex-hub:litex-rebase 15/15] drivers/block/litesata.c:236:15:
 sparse: sparse: cast removes address space '__iomem' of expression
Message-ID: <202502120833.dMbQRzZi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   222d6093d18e20b52f2a81a4d162a17af3760fff
commit: 222d6093d18e20b52f2a81a4d162a17af3760fff [15/15] LiteX: LiteSATA block driver
config: csky-randconfig-r111-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120833.dMbQRzZi-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250212/202502120833.dMbQRzZi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120833.dMbQRzZi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/block/litesata.c:236:15: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +236 drivers/block/litesata.c

   208	
   209	static int litesata_irq_init(struct platform_device *pdev,
   210				     struct litesata_dev *lbd)
   211	{
   212		struct device *dev = &pdev->dev;
   213		int ret;
   214	
   215		ret = platform_get_irq_optional(pdev, 0);
   216		if (ret < 0 && ret != -ENXIO)
   217			return ret;
   218		if (ret > 0)
   219			lbd->irq = ret;
   220		else {
   221			dev_warn(dev, "Failed to get IRQ, using polling\n");
   222			goto use_polling;
   223		}
   224	
   225		lbd->lsirq = devm_platform_ioremap_resource_byname(pdev, "irq");
   226		if (IS_ERR(lbd->lsirq))
   227			return PTR_ERR(lbd->lsirq);
   228	
   229		ret = devm_request_irq(dev, lbd->irq, litesata_interrupt, 0,
   230				       "litesata", lbd);
   231		if (ret < 0) {
   232			dev_warn(dev, "IRQ request error %d, using polling\n", ret);
   233			goto use_polling;
   234		}
   235	
 > 236		ret = devm_add_action_or_reset(dev, litesata_devm_irq_off,
   237								(void *)lbd->lsirq);
   238		if (ret)
   239			return dev_err_probe(dev, ret,
   240					     "Can't register irq_off action\n");
   241	
   242		/* Clear & enable DMA-completion interrupts */
   243		litex_write32(lbd->lsirq + LITESATA_IRQ_PEND, LSIRQ_RD | LSIRQ_WR);
   244		litex_write32(lbd->lsirq + LITESATA_IRQ_ENA, LSIRQ_RD | LSIRQ_WR);
   245	
   246		init_completion(&lbd->dma_done);
   247	
   248		return 0;
   249	
   250	use_polling:
   251		lbd->irq = 0;
   252		return 0;
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
