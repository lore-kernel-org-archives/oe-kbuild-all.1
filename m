Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1B825B311
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 06:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768199195; cv=none; b=ACe6PSllkZSvK1l+q2f+cxajBBQ5Otugd6hkLvxk/zNym5ZNlJWXP7VXrnVepP3e8p4m5acJxHl9MiNKirfvmrmrFt/ndTL5+NjsGUoFtWhvDLryIxdd2XiiVA2ODJLdCChpX/QMSQr0fYREce0aFx8l3YMeVUCJ3L2voofSz6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768199195; c=relaxed/simple;
	bh=kG6Hx8A3y+7heFGdRctMW8JnJsf/rbvU9yVxQbunjjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7HfAkR8Mu1hGKN+tyTTeeOaZegIlZdrYPoVCC3mXxPOjrz3q+3fvkOfTqgexr7hIaybsnW50aKUa+7k7f/x3UeFWk0GDoDkUhtXeijxSfaa+ZMBCDyWz3PulRTWMg1DgYlhQdj9sk4jKkLvDmWur4TnfEkcBJG8eXg40OQiq70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bher0P87; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bher0P87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768199192; x=1799735192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kG6Hx8A3y+7heFGdRctMW8JnJsf/rbvU9yVxQbunjjk=;
  b=bher0P87yOWejOmuwfCLoTc9yEaXOn7sp8NoI7cwSz/RF9p6HWQpmyMt
   EtAmAEmZqjAll5L7U/HkU+MUc2jIDgebOF5/TsYhEDDuJQHREtT/GXsNQ
   xaLkZnxnFnF8amME64crVHlfyMNMp7Cl8jGgNbeGyGAg7w4SaPhExDP1d
   XFlesEf9CBLli7AWFQBToWyHVL8Y7cPDNizHWn3nWfj3anqM+bQo+CO5S
   TeXXntVnMaF7f8pySQ4sJDIrG1cRvvr3irvUjfERs3lFLxw2y4fynqbIU
   zqC1cjJiB1E6zTjdOGS2zjkzuM+dblOT2xBhOVmkFO9/YHB4y6JAe6c8C
   w==;
X-CSE-ConnectionGUID: FKvxmDadRwCs9l4QyuO5LQ==
X-CSE-MsgGUID: 8kBhYfKWQEyX3CPTRXwTTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80923987"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80923987"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 22:26:32 -0800
X-CSE-ConnectionGUID: dZZ63W1/QyORQryLt1Aj1g==
X-CSE-MsgGUID: rFTOdkcDRbKfAHAv9rqrBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203921374"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2026 22:26:31 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfBNl-000000000n3-09Fo;
	Mon, 12 Jan 2026 06:26:29 +0000
Date: Mon, 12 Jan 2026 07:26:27 +0100
From: kernel test robot <lkp@intel.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] dmaengine: introduce dmaengine_bh_wq and bh
 helpers
Message-ID: <202601120727.5ttojW2a-lkp@intel.com>
References: <20260108080332.2341725-2-allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108080332.2341725-2-allen.lkml@gmail.com>

Hi Allen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on shawnguo/for-next sunxi/sunxi/for-next soc/for-next linus/master v6.16-rc1 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Allen-Pais/dmaengine-introduce-dmaengine_bh_wq-and-bh-helpers/20260108-164201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260108080332.2341725-2-allen.lkml%40gmail.com
patch subject: [RFC PATCH 1/1] dmaengine: introduce dmaengine_bh_wq and bh helpers
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260112/202601120727.5ttojW2a-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120727.5ttojW2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120727.5ttojW2a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/idma64.c:166:8: error: unknown type name 'irqreturn_t'
     166 | static irqreturn_t idma64_irq(int irq, void *dev)
         |        ^~~~~~~~~~~
   drivers/dma/idma64.c: In function 'idma64_irq':
>> drivers/dma/idma64.c:176:24: error: 'IRQ_NONE' undeclared (first use in this function)
     176 |                 return IRQ_NONE;
         |                        ^~~~~~~~
   drivers/dma/idma64.c:176:24: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/dma/idma64.c:190:16: error: 'IRQ_HANDLED' undeclared (first use in this function)
     190 |         return IRQ_HANDLED;
         |                ^~~~~~~~~~~
   drivers/dma/idma64.c: In function 'idma64_probe':
>> drivers/dma/idma64.c:561:15: error: implicit declaration of function 'devm_request_irq'; did you mean 'devm_request_region'? [-Wimplicit-function-declaration]
     561 |         ret = devm_request_irq(chip->dev, chip->irq, idma64_irq, IRQF_SHARED,
         |               ^~~~~~~~~~~~~~~~
         |               devm_request_region
>> drivers/dma/idma64.c:561:66: error: 'IRQF_SHARED' undeclared (first use in this function); did you mean 'VM_SHARED'?
     561 |         ret = devm_request_irq(chip->dev, chip->irq, idma64_irq, IRQF_SHARED,
         |                                                                  ^~~~~~~~~~~
         |                                                                  VM_SHARED
   drivers/dma/idma64.c: In function 'idma64_remove':
>> drivers/dma/idma64.c:622:9: error: implicit declaration of function 'devm_free_irq'; did you mean 'devm_free_pages'? [-Wimplicit-function-declaration]
     622 |         devm_free_irq(chip->dev, chip->irq, idma64);
         |         ^~~~~~~~~~~~~
         |         devm_free_pages
>> drivers/dma/idma64.c:627:17: error: implicit declaration of function 'tasklet_kill' [-Wimplicit-function-declaration]
     627 |                 tasklet_kill(&idma64c->vchan.task);
         |                 ^~~~~~~~~~~~
>> drivers/dma/idma64.c:627:45: error: 'struct virt_dma_chan' has no member named 'task'
     627 |                 tasklet_kill(&idma64c->vchan.task);
         |                                             ^
--
   drivers/dma/hsu/hsu.c: In function 'hsu_dma_remove':
>> drivers/dma/hsu/hsu.c:503:42: error: 'struct virt_dma_chan' has no member named 'task'
     503 |                 tasklet_kill(&hsuc->vchan.task);
         |                                          ^


vim +622 drivers/dma/idma64.c

667dfed98615ae Andy Shevchenko   2015-07-27  531  
667dfed98615ae Andy Shevchenko   2015-07-27  532  #define IDMA64_BUSWIDTHS				\
667dfed98615ae Andy Shevchenko   2015-07-27  533  	BIT(DMA_SLAVE_BUSWIDTH_1_BYTE)		|	\
667dfed98615ae Andy Shevchenko   2015-07-27  534  	BIT(DMA_SLAVE_BUSWIDTH_2_BYTES)		|	\
667dfed98615ae Andy Shevchenko   2015-07-27  535  	BIT(DMA_SLAVE_BUSWIDTH_4_BYTES)
667dfed98615ae Andy Shevchenko   2015-07-27  536  
667dfed98615ae Andy Shevchenko   2015-07-27  537  static int idma64_probe(struct idma64_chip *chip)
667dfed98615ae Andy Shevchenko   2015-07-27  538  {
667dfed98615ae Andy Shevchenko   2015-07-27  539  	struct idma64 *idma64;
667dfed98615ae Andy Shevchenko   2015-07-27  540  	unsigned short nr_chan = IDMA64_NR_CHAN;
667dfed98615ae Andy Shevchenko   2015-07-27  541  	unsigned short i;
667dfed98615ae Andy Shevchenko   2015-07-27  542  	int ret;
667dfed98615ae Andy Shevchenko   2015-07-27  543  
667dfed98615ae Andy Shevchenko   2015-07-27  544  	idma64 = devm_kzalloc(chip->dev, sizeof(*idma64), GFP_KERNEL);
667dfed98615ae Andy Shevchenko   2015-07-27  545  	if (!idma64)
667dfed98615ae Andy Shevchenko   2015-07-27  546  		return -ENOMEM;
667dfed98615ae Andy Shevchenko   2015-07-27  547  
667dfed98615ae Andy Shevchenko   2015-07-27  548  	idma64->regs = chip->regs;
667dfed98615ae Andy Shevchenko   2015-07-27  549  	chip->idma64 = idma64;
667dfed98615ae Andy Shevchenko   2015-07-27  550  
667dfed98615ae Andy Shevchenko   2015-07-27  551  	idma64->chan = devm_kcalloc(chip->dev, nr_chan, sizeof(*idma64->chan),
667dfed98615ae Andy Shevchenko   2015-07-27  552  				    GFP_KERNEL);
667dfed98615ae Andy Shevchenko   2015-07-27  553  	if (!idma64->chan)
667dfed98615ae Andy Shevchenko   2015-07-27  554  		return -ENOMEM;
667dfed98615ae Andy Shevchenko   2015-07-27  555  
667dfed98615ae Andy Shevchenko   2015-07-27  556  	idma64->all_chan_mask = (1 << nr_chan) - 1;
667dfed98615ae Andy Shevchenko   2015-07-27  557  
667dfed98615ae Andy Shevchenko   2015-07-27  558  	/* Turn off iDMA controller */
667dfed98615ae Andy Shevchenko   2015-07-27  559  	idma64_off(idma64);
667dfed98615ae Andy Shevchenko   2015-07-27  560  
667dfed98615ae Andy Shevchenko   2015-07-27 @561  	ret = devm_request_irq(chip->dev, chip->irq, idma64_irq, IRQF_SHARED,
667dfed98615ae Andy Shevchenko   2015-07-27  562  			       dev_name(chip->dev), idma64);
667dfed98615ae Andy Shevchenko   2015-07-27  563  	if (ret)
667dfed98615ae Andy Shevchenko   2015-07-27  564  		return ret;
667dfed98615ae Andy Shevchenko   2015-07-27  565  
667dfed98615ae Andy Shevchenko   2015-07-27  566  	INIT_LIST_HEAD(&idma64->dma.channels);
667dfed98615ae Andy Shevchenko   2015-07-27  567  	for (i = 0; i < nr_chan; i++) {
667dfed98615ae Andy Shevchenko   2015-07-27  568  		struct idma64_chan *idma64c = &idma64->chan[i];
667dfed98615ae Andy Shevchenko   2015-07-27  569  
667dfed98615ae Andy Shevchenko   2015-07-27  570  		idma64c->vchan.desc_free = idma64_vdesc_free;
667dfed98615ae Andy Shevchenko   2015-07-27  571  		vchan_init(&idma64c->vchan, &idma64->dma);
667dfed98615ae Andy Shevchenko   2015-07-27  572  
667dfed98615ae Andy Shevchenko   2015-07-27  573  		idma64c->regs = idma64->regs + i * IDMA64_CH_LENGTH;
667dfed98615ae Andy Shevchenko   2015-07-27  574  		idma64c->mask = BIT(i);
667dfed98615ae Andy Shevchenko   2015-07-27  575  	}
667dfed98615ae Andy Shevchenko   2015-07-27  576  
667dfed98615ae Andy Shevchenko   2015-07-27  577  	dma_cap_set(DMA_SLAVE, idma64->dma.cap_mask);
667dfed98615ae Andy Shevchenko   2015-07-27  578  	dma_cap_set(DMA_PRIVATE, idma64->dma.cap_mask);
667dfed98615ae Andy Shevchenko   2015-07-27  579  
667dfed98615ae Andy Shevchenko   2015-07-27  580  	idma64->dma.device_alloc_chan_resources = idma64_alloc_chan_resources;
667dfed98615ae Andy Shevchenko   2015-07-27  581  	idma64->dma.device_free_chan_resources = idma64_free_chan_resources;
667dfed98615ae Andy Shevchenko   2015-07-27  582  
667dfed98615ae Andy Shevchenko   2015-07-27  583  	idma64->dma.device_prep_slave_sg = idma64_prep_slave_sg;
667dfed98615ae Andy Shevchenko   2015-07-27  584  
667dfed98615ae Andy Shevchenko   2015-07-27  585  	idma64->dma.device_issue_pending = idma64_issue_pending;
667dfed98615ae Andy Shevchenko   2015-07-27  586  	idma64->dma.device_tx_status = idma64_tx_status;
667dfed98615ae Andy Shevchenko   2015-07-27  587  
667dfed98615ae Andy Shevchenko   2015-07-27  588  	idma64->dma.device_config = idma64_slave_config;
667dfed98615ae Andy Shevchenko   2015-07-27  589  	idma64->dma.device_pause = idma64_pause;
667dfed98615ae Andy Shevchenko   2015-07-27  590  	idma64->dma.device_resume = idma64_resume;
667dfed98615ae Andy Shevchenko   2015-07-27  591  	idma64->dma.device_terminate_all = idma64_terminate_all;
bbacb8e78a3b29 Andy Shevchenko   2018-07-10  592  	idma64->dma.device_synchronize = idma64_synchronize;
667dfed98615ae Andy Shevchenko   2015-07-27  593  
667dfed98615ae Andy Shevchenko   2015-07-27  594  	idma64->dma.src_addr_widths = IDMA64_BUSWIDTHS;
667dfed98615ae Andy Shevchenko   2015-07-27  595  	idma64->dma.dst_addr_widths = IDMA64_BUSWIDTHS;
667dfed98615ae Andy Shevchenko   2015-07-27  596  	idma64->dma.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
667dfed98615ae Andy Shevchenko   2015-07-27  597  	idma64->dma.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
667dfed98615ae Andy Shevchenko   2015-07-27  598  
5ba846b1ee0792 Andy Shevchenko   2019-03-18  599  	idma64->dma.dev = chip->sysdev;
667dfed98615ae Andy Shevchenko   2015-07-27  600  
334304ac2baca7 Christoph Hellwig 2024-07-19  601  	dma_set_max_seg_size(idma64->dma.dev, IDMA64C_CTLH_BLOCK_TS_MASK);
e3fdb1894cfac6 Andy Shevchenko   2015-11-17  602  
667dfed98615ae Andy Shevchenko   2015-07-27  603  	ret = dma_async_device_register(&idma64->dma);
667dfed98615ae Andy Shevchenko   2015-07-27  604  	if (ret)
667dfed98615ae Andy Shevchenko   2015-07-27  605  		return ret;
667dfed98615ae Andy Shevchenko   2015-07-27  606  
667dfed98615ae Andy Shevchenko   2015-07-27  607  	dev_info(chip->dev, "Found Intel integrated DMA 64-bit\n");
667dfed98615ae Andy Shevchenko   2015-07-27  608  	return 0;
667dfed98615ae Andy Shevchenko   2015-07-27  609  }
667dfed98615ae Andy Shevchenko   2015-07-27  610  
c3b63380f52a5c Uwe Kleine-König  2022-10-14  611  static void idma64_remove(struct idma64_chip *chip)
667dfed98615ae Andy Shevchenko   2015-07-27  612  {
667dfed98615ae Andy Shevchenko   2015-07-27  613  	struct idma64 *idma64 = chip->idma64;
667dfed98615ae Andy Shevchenko   2015-07-27  614  	unsigned short i;
667dfed98615ae Andy Shevchenko   2015-07-27  615  
667dfed98615ae Andy Shevchenko   2015-07-27  616  	dma_async_device_unregister(&idma64->dma);
667dfed98615ae Andy Shevchenko   2015-07-27  617  
667dfed98615ae Andy Shevchenko   2015-07-27  618  	/*
667dfed98615ae Andy Shevchenko   2015-07-27  619  	 * Explicitly call devm_request_irq() to avoid the side effects with
667dfed98615ae Andy Shevchenko   2015-07-27  620  	 * the scheduled tasklets.
667dfed98615ae Andy Shevchenko   2015-07-27  621  	 */
667dfed98615ae Andy Shevchenko   2015-07-27 @622  	devm_free_irq(chip->dev, chip->irq, idma64);
667dfed98615ae Andy Shevchenko   2015-07-27  623  
667dfed98615ae Andy Shevchenko   2015-07-27  624  	for (i = 0; i < idma64->dma.chancnt; i++) {
667dfed98615ae Andy Shevchenko   2015-07-27  625  		struct idma64_chan *idma64c = &idma64->chan[i];
667dfed98615ae Andy Shevchenko   2015-07-27  626  
667dfed98615ae Andy Shevchenko   2015-07-27 @627  		tasklet_kill(&idma64c->vchan.task);
667dfed98615ae Andy Shevchenko   2015-07-27  628  	}
667dfed98615ae Andy Shevchenko   2015-07-27  629  }
667dfed98615ae Andy Shevchenko   2015-07-27  630  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
