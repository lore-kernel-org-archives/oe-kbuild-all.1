Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5D922DF96
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 12:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738758038; cv=none; b=pf2PqPRgWrYpRM3rsLFIF1fzK2BuuewdBPNssh8sVg2HTI+qHxiYIQ+nhcNa9jo1dJkBQ1bx994eV4LI/BYMHkDYdId9TazIn2O9jK3jyB40iKGTPKyIEee30CWoHa2/iW7wA/3rSDdClYp0Ew4EqC1foNCyelCbJkzkd3Tduus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738758038; c=relaxed/simple;
	bh=0cEK/7dch0s8kL7mgtKVzWk2qMJNCkVb3cbIaJS9cDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r/SAINNtctyGn6yqE3Agvv8A+lMuVlOMUPUFZ0NRfNeeTbKapQHDWjn26EfEj8F16PV2sy7QFShFiRja5pwKVqEbsD6rU/ET6zF1+E05M4CcVj6l+7/WpWwyyRxWA5pLMW08650yAoNwu4uPH/W+v+9F/vTuyGSaO7fJK+4tSoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlLg8/hB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlLg8/hB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738758037; x=1770294037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0cEK/7dch0s8kL7mgtKVzWk2qMJNCkVb3cbIaJS9cDc=;
  b=BlLg8/hB7qY97wvoFTPooXzZq9RyPfqldq+P7cLjITBboOryHjUN9MvU
   YVmwTrCLKdifvekMfLALxzVJn1NuKQxQWvusppfCq3vApN4D7/vvauTcJ
   PnUdDqkYNi6r11gAuW4/hZBurrm7rhjrXv07NktaKpOnBwqmfPavPVeyV
   sRzQJc0zANqNRAVgLk5obZ74zW77NVH0afHGgUt7SZ2XNsNx+FKSmBrZY
   LzHXd0iwryAX96MMM2TpdkDbZ84VcRqu2b7LSNT+F+cMjXQX3KJelfjfw
   ibAMWCogdHWtIpYTldu7G2sXEyZ8C9L4vD7ezdc4iaWYMxs+qRbZAHvtq
   g==;
X-CSE-ConnectionGUID: dwuCXwmcSFCXhaBzGFbwqg==
X-CSE-MsgGUID: zkHjPhv/TeyqFm2DyZcsJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38552504"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38552504"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 04:20:35 -0800
X-CSE-ConnectionGUID: RIyxmZGrRuiwULRA98vw4w==
X-CSE-MsgGUID: 2ppKRdoCRianGT8RRWuxdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148089327"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Feb 2025 04:20:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfeON-000trx-0Y;
	Wed, 05 Feb 2025 12:20:31 +0000
Date: Wed, 5 Feb 2025 20:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Somlo <gsomlo@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [litex-hub:litex-rebase 15/15] drivers/block/litesata.c:129:25:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202502052018.oLKo0Dcd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   a1cd33eb9593685b8b0716cbecf1a817b6410ca2
commit: e6c6fef5f6b404cbbbabf0039fbb30acd3b49517 [15/15] LiteX: LiteSATA block driver
config: arm-randconfig-r113-20250205 (https://download.01.org/0day-ci/archive/20250205/202502052018.oLKo0Dcd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250205/202502052018.oLKo0Dcd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502052018.oLKo0Dcd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/block/litesata.c:129:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted blk_opf_t [usertype] op @@     got unsigned int op @@
   drivers/block/litesata.c:129:25: sparse:     expected restricted blk_opf_t [usertype] op
   drivers/block/litesata.c:129:25: sparse:     got unsigned int op
>> drivers/block/litesata.c:156:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int op @@     got restricted blk_opf_t enum req_op @@
   drivers/block/litesata.c:156:33: sparse:     expected unsigned int op
   drivers/block/litesata.c:156:33: sparse:     got restricted blk_opf_t enum req_op
   drivers/block/litesata.c:170:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted blk_opf_t [usertype] op @@     got unsigned int op @@
   drivers/block/litesata.c:170:25: sparse:     expected restricted blk_opf_t [usertype] op
   drivers/block/litesata.c:170:25: sparse:     got unsigned int op
>> drivers/block/litesata.c:236:15: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *data @@     got void [noderef] __iomem *lsirq @@
   drivers/block/litesata.c:236:15: sparse:     expected void *data
   drivers/block/litesata.c:236:15: sparse:     got void [noderef] __iomem *lsirq

vim +129 drivers/block/litesata.c

   117	
   118	/* Process a single bvec of a bio. */
   119	static int litesata_do_bvec(struct litesata_dev *lbd, struct bio_vec *bv,
   120				    unsigned int op, sector_t sector)
   121	{
   122		struct device *dev = lbd->dev;
   123		dma_addr_t dma;
   124		void __iomem *regs;
   125		int err;
   126		enum dma_data_direction dir;
   127		unsigned int count;
   128	
 > 129		if (op_is_write(op)) {
   130			dir = DMA_TO_DEVICE;
   131			regs = lbd->lswriter;
   132		} else {
   133			dir = DMA_FROM_DEVICE;
   134			regs = lbd->lsreader;
   135		}
   136	
   137		dma = dma_map_bvec(dev, bv, dir, 0);
   138		err = dma_mapping_error(dev, dma);
   139		if (err)
   140			return err;
   141	
   142		count = bv->bv_len >> SECTOR_SHIFT;
   143		mutex_lock(&lbd->lock);
   144		err = litesata_do_dma(lbd, regs, dma, sector, count);
   145		mutex_unlock(&lbd->lock);
   146		if (err)
   147			return err;
   148	
   149		dma_unmap_page(dev, dma, bv->bv_len, dir);
   150		return 0;
   151	}
   152	
   153	static void litesata_submit_bio(struct bio *bio)
   154	{
   155		struct litesata_dev *lbd = bio->bi_bdev->bd_disk->private_data;
 > 156		unsigned int op = bio_op(bio);
   157		sector_t sector = bio->bi_iter.bi_sector;
   158		struct bio_vec bvec;
   159		struct bvec_iter iter;
   160	
   161		bio_for_each_segment(bvec, bio, iter) {
   162			int err;
   163	
   164			/* Don't support un-aligned buffer */
   165			WARN_ON_ONCE((bvec.bv_offset & (SECTOR_SIZE - 1)) ||
   166					(bvec.bv_len & (SECTOR_SIZE - 1)));
   167	
   168			err = litesata_do_bvec(lbd, &bvec, op, sector);
   169			if (err) {
   170				dev_err(lbd->dev, "error %s sectors %Ld..%Ld\n",
   171					op_is_write(op) ? "writing" : "reading",
   172					sector, sector + (bvec.bv_len >> SECTOR_SHIFT));
   173				bio_io_error(bio);
   174				return;
   175			}
   176			sector += (bvec.bv_len >> SECTOR_SHIFT);
   177		}
   178	
   179		bio_endio(bio);
   180	}
   181	
   182	static const struct block_device_operations litesata_fops = {
   183		.owner		= THIS_MODULE,
   184		.submit_bio	= litesata_submit_bio,
   185	};
   186	
   187	static irqreturn_t litesata_interrupt(int irq, void *arg)
   188	{
   189		struct litesata_dev *lbd = arg;
   190		u32 pend;
   191	
   192		/* should be either LSIRQ_RD or LSIRQ_WR (but never *both*)! */
   193		pend = litex_read32(lbd->lsirq + LITESATA_IRQ_PEND);
   194	
   195		/* acknowledge interrupt */
   196		litex_write32(lbd->lsirq + LITESATA_IRQ_PEND, pend);
   197	
   198		/* signal DMA xfer completion */
   199		complete(&lbd->dma_done);
   200	
   201		return IRQ_HANDLED;
   202	}
   203	
   204	static void litesata_devm_irq_off(void *lsirq)
   205	{
   206		litex_write32((void __iomem *)lsirq + LITESATA_IRQ_ENA, 0);
   207	}
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
 > 236		ret = devm_add_action_or_reset(dev, litesata_devm_irq_off, lbd->lsirq);
   237		if (ret)
   238			return dev_err_probe(dev, ret,
   239					     "Can't register irq_off action\n");
   240	
   241		/* Clear & enable DMA-completion interrupts */
   242		litex_write32(lbd->lsirq + LITESATA_IRQ_PEND, LSIRQ_RD | LSIRQ_WR);
   243		litex_write32(lbd->lsirq + LITESATA_IRQ_ENA, LSIRQ_RD | LSIRQ_WR);
   244	
   245		init_completion(&lbd->dma_done);
   246	
   247		return 0;
   248	
   249	use_polling:
   250		lbd->irq = 0;
   251		return 0;
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
