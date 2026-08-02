Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCA33375C3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Aug 2026 23:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785713308; cv=none; b=tUpRbdihli/gLwGz9tpluDVFAGfsf6fI+9P95bPNdgFr2q8GzSC5Fkah2IQa4vajNYMUmDwQyiSZp83LkIFTIphrmtR3+cCTpc4Ufvd08ULP//WIRDvzDRknDTS7e+DJLjusMicj3S2zzupCoz4+iCCeZbRNGs0j7fA08fwvqgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785713308; c=relaxed/simple;
	bh=+m9XZ5htS09/fHDBri46hglw1oZ7wZ/7k4F7KMvts3o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qb0At/+bVc3uPvWIQ/aOBnfdpnBkwbhetnLNpWjBDferYRnsbMFrMeqSlRPeBAXUn1L6Rsnh3H8ByiVzY5vhBJdMSth5YgkgiK6dBd4V0e5YIbEnl6XspFHl04GCm7w0KPq3OkLXnv20zUDceL8F2OdRb9qI++p8GSL1JQYRpfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLD8AKKM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLD8AKKM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785713305; x=1817249305;
  h=date:from:to:cc:subject:message-id;
  bh=+m9XZ5htS09/fHDBri46hglw1oZ7wZ/7k4F7KMvts3o=;
  b=MLD8AKKMwFWBtodAdt6OQxXkXYJKWJKH/ey8D9YGGHaWO2CaH4hNlGam
   Y82jRQakUYJfntUre3BKnSbK53xVE/frrhdUa9jq4j+ScW3R1zeK0NTol
   +7eK2szHcBO+NTCA2Spax1GGg5O6GQDpEB3APRXwdMgIqjlP87O8vQUQl
   diWGH55jRwNhIHaOCObeN+5ReujRjzuz4mMymmtJL/Pb2oRmG6RLl5gsJ
   LLkyPpUd5DcoNCAk5MsT+trabC3OI6QJes/BPjRXIIKmHwQ8hZPQGBmDx
   rcBAskWvKq8MzF9bD6FW/sonjRZRUUlnyfukaSXP6sEoDQKmQhizvy6BD
   w==;
X-CSE-ConnectionGUID: 2AU0hfDPQ1uT2Wy0YZ0fDw==
X-CSE-MsgGUID: PbXNSHcTRjKuvZY36EySdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="90061413"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="90061413"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 16:28:24 -0700
X-CSE-ConnectionGUID: 00g16RbmRJ+Dk4m6XeErZw==
X-CSE-MsgGUID: a/cU4A61QGGokUJARL1Shg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="264537212"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Aug 2026 16:28:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqfbQ-000000005eL-2huS;
	Sun, 02 Aug 2026 23:28:20 +0000
Date: Mon, 03 Aug 2026 07:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 427/700]
 drivers/dma/mstar/mstar-msc313-urdma.c:521:12: warning: 'msc313_urdma_resume'
 defined but not used
Message-ID: <202608030728.TkDTzD0z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: dd0b6f7ae8093e4530b7ab362c99150b1f714487 [427/700] dma: mstar: urdma
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260803/202608030728.TkDTzD0z-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608030728.TkDTzD0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608030728.TkDTzD0z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/mstar/mstar-msc313-urdma.c: In function 'msc313_urdma_prep_slave_sg':
   drivers/dma/mstar/mstar-msc313-urdma.c:322:24: warning: returning 'int' from a function with return type 'struct dma_async_tx_descriptor *' makes pointer from integer without a cast [-Wint-conversion]
     322 |                 return -EINVAL;
         |                        ^
   drivers/dma/mstar/mstar-msc313-urdma.c:326:24: warning: returning 'int' from a function with return type 'struct dma_async_tx_descriptor *' makes pointer from integer without a cast [-Wint-conversion]
     326 |                 return -EINVAL;
         |                        ^
   drivers/dma/mstar/mstar-msc313-urdma.c: In function 'msc313_urdma_tasklet':
   drivers/dma/mstar/mstar-msc313-urdma.c:355:33: warning: unused variable 'tmp' [-Wunused-variable]
     355 |         struct list_head *cur, *tmp;
         |                                 ^~~
   drivers/dma/mstar/mstar-msc313-urdma.c:355:27: warning: unused variable 'cur' [-Wunused-variable]
     355 |         struct list_head *cur, *tmp;
         |                           ^~~
   At top level:
>> drivers/dma/mstar/mstar-msc313-urdma.c:521:12: warning: 'msc313_urdma_resume' defined but not used [-Wunused-function]
     521 | static int msc313_urdma_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/dma/mstar/mstar-msc313-urdma.c:511:12: warning: 'msc313_urdma_suspend' defined but not used [-Wunused-function]
     511 | static int msc313_urdma_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/dma/mstar/mstar-msc313-urdma.c:29:31: warning: 'ctrl_rx_op_mode' defined but not used [-Wunused-const-variable=]
      29 | static const struct reg_field ctrl_rx_op_mode = REG_FIELD(REG_CTRL, 11, 11);
         |                               ^~~~~~~~~~~~~~~


vim +/msc313_urdma_resume +521 drivers/dma/mstar/mstar-msc313-urdma.c

   350	
   351	static void msc313_urdma_tasklet(unsigned long data)
   352	{
   353		struct msc313_urdma_chan *chan = (struct msc313_urdma_chan*) data;
   354		struct device *dev = chan->chan.device->dev;
 > 355		struct list_head *cur, *tmp;
   356		unsigned long flags;
   357	
   358		printk("%s:%d %d\n", __func__, __LINE__, chan->rxchan);
   359	
   360		while (true) {
   361			struct msc313_urdma_desc *desc;
   362	
   363			spin_lock_irqsave(&chan->lock, flags);
   364			desc = list_first_entry_or_null(&chan->complete, struct msc313_urdma_desc, queue_node);
   365			if (desc)
   366				list_del(&desc->queue_node);
   367			spin_unlock_irqrestore(&chan->lock, flags);
   368	
   369			if (!desc)
   370				break;
   371	
   372			dma_cookie_complete(&desc->tx);
   373			dma_descriptor_unmap(&desc->tx);
   374			printk("%s:%d\n", __func__, __LINE__);
   375			//&desc->result
   376			dmaengine_desc_get_callback_invoke(&desc->tx, NULL);
   377			printk("%s:%d\n", __func__, __LINE__);
   378			dma_run_dependencies(&desc->tx);
   379			printk("%s:%d\n", __func__, __LINE__);
   380			this_cpu_ptr(chan->chan.local)->bytes_transferred += desc->len;
   381			kfree(desc);
   382			printk("%s:%d\n", __func__, __LINE__);
   383			pm_runtime_mark_last_busy(dev);
   384			pm_runtime_put_autosuspend(dev);
   385		}
   386	}
   387	
   388	static int msc313_urdma_probe(struct platform_device *pdev)
   389	{
   390		struct device *dev = &pdev->dev;
   391		struct msc313_urdma *urdma;
   392		struct regmap *regmap;
   393		void __iomem *base;
   394		int i, irq, ret;
   395	
   396		printk("urdma probe\n");
   397	
   398		urdma = devm_kzalloc(dev, sizeof(*urdma), GFP_KERNEL);
   399		if (!urdma)
   400			return -ENOMEM;
   401	
   402		spin_lock_init(&urdma->lock);
   403		platform_set_drvdata(pdev, urdma);
   404	
   405		base = devm_platform_ioremap_resource(pdev, 0);
   406		if (IS_ERR(base))
   407			return PTR_ERR(base);
   408	
   409		regmap = devm_regmap_init_mmio(dev, base,
   410				&msc313_urdma_regmap_config);
   411		if (IS_ERR(regmap))
   412			return PTR_ERR(regmap);
   413	
   414		urdma->clk = devm_clk_get_enabled(dev, NULL);
   415		if (IS_ERR(urdma->clk))
   416			return PTR_ERR(urdma->clk);
   417	
   418		urdma->dma_device.dev = dev;
   419		urdma->dma_device.device_tx_status = msc313_urdma_tx_status;
   420		urdma->dma_device.device_issue_pending = msc313_urdma_issue_pending;
   421		urdma->dma_device.device_prep_slave_sg = msc313_urdma_prep_slave_sg;
   422		urdma->dma_device.device_terminate_all = msc313_urdma_terminate_all;
   423		urdma->dma_device.device_config = msc313_urdma_chan_config;
   424		urdma->dma_device.device_pause = msc313_urdma_chan_pause;
   425		urdma->dma_device.device_resume = msc313_urdma_chan_resume;
   426		urdma->dma_device.src_addr_widths = BIT(4);
   427		urdma->dma_device.dst_addr_widths = BIT(4);
   428		urdma->dma_device.directions = BIT(DMA_MEM_TO_DEV) | BIT(DMA_DEV_TO_MEM);
   429		urdma->dma_device.residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
   430	
   431		dma_cap_set(DMA_SLAVE, urdma->dma_device.cap_mask);
   432	
   433		INIT_LIST_HEAD(&urdma->dma_device.channels);
   434	
   435		irq = irq_of_parse_and_map(dev->of_node, i);
   436		if (!irq)
   437			return -EINVAL;
   438		ret = devm_request_irq(dev, irq, msc313_urdma_irq, IRQF_SHARED, dev_name(dev), urdma);
   439		if (ret)
   440			return ret;
   441	
   442		/* global regfields */
   443		urdma->sw_rst = devm_regmap_field_alloc(dev, regmap, ctrl_sw_rst);
   444		urdma->urdma_mode = devm_regmap_field_alloc(dev, regmap, ctrl_urdma_mode);
   445	
   446		for (i = 0; i < CHANNELS; i++) {
   447			struct msc313_urdma_chan *chan = &urdma->chans[i];
   448	
   449			chan->urdma = urdma;
   450			spin_lock_init(&chan->lock);
   451			INIT_LIST_HEAD(&chan->queue);
   452			INIT_LIST_HEAD(&chan->complete);
   453			chan->chan.device = &urdma->dma_device;
   454			tasklet_init(&chan->tasklet, msc313_urdma_tasklet, (unsigned long) chan);
   455	
   456			if (i == 0) {
   457				chan->en = devm_regmap_field_alloc(dev, regmap, ctrl_tx_urdma_en);
   458				chan->endian = devm_regmap_field_alloc(dev, regmap, ctrl_tx_endian);
   459				chan->sw_rst = devm_regmap_field_alloc(dev, regmap, ctrl_tx_sw_rst);
   460				chan->busy = devm_regmap_field_alloc(dev, regmap, ctrl_tx_busy);
   461	
   462				chan->int_clr = devm_regmap_field_alloc(dev, regmap, status_tx_intr_clr_field);
   463				chan->int_en1 = devm_regmap_field_alloc(dev, regmap, status_tx_intr_en_field);
   464				chan->mcu_int = devm_regmap_field_alloc(dev, regmap, status_tx_mcu_intr_field);
   465	
   466				chan->buf_h = devm_regmap_field_alloc(dev, regmap, tx_buf_h_field);
   467				chan->buf_l = devm_regmap_field_alloc(dev, regmap, tx_buf_l_field);
   468				chan->buf_sz = devm_regmap_field_alloc(dev, regmap, tx_buf_sz_field);
   469				chan->rptr = devm_regmap_field_alloc(dev, regmap, tx_buf_rptr_field);
   470				chan->wptr = devm_regmap_field_alloc(dev, regmap, tx_buf_wptr_field);
   471			}
   472			else {
   473				chan->en = devm_regmap_field_alloc(dev, regmap, ctrl_rx_urdma_en);
   474				chan->endian = devm_regmap_field_alloc(dev, regmap, ctrl_rx_endian);
   475				chan->sw_rst = devm_regmap_field_alloc(dev, regmap, ctrl_rx_sw_rst);
   476				chan->busy = devm_regmap_field_alloc(dev, regmap, ctrl_rx_busy);
   477	
   478				chan->int_clr = devm_regmap_field_alloc(dev, regmap, status_rx_intr_clr_field);
   479				chan->int_en1 = devm_regmap_field_alloc(dev, regmap, status_rx_intr_en1_field);
   480				chan->int_en2 = devm_regmap_field_alloc(dev, regmap, status_rx_intr_en2_field);
   481				chan->int1 = devm_regmap_field_alloc(dev, regmap, status_rx_intr1_field);
   482				chan->int2 = devm_regmap_field_alloc(dev, regmap, status_rx_intr2_field);
   483				chan->mcu_int = devm_regmap_field_alloc(dev, regmap, status_rx_mcu_intr_field);
   484	
   485				chan->buf_h = devm_regmap_field_alloc(dev, regmap, rx_buf_h_field);
   486				chan->buf_l = devm_regmap_field_alloc(dev, regmap, rx_buf_l_field);
   487				chan->buf_sz = devm_regmap_field_alloc(dev, regmap, rx_buf_sz_field);
   488	
   489				chan->rxchan = true;
   490			}
   491	
   492			list_add_tail(&chan->chan.device_node, &urdma->dma_device.channels);
   493		}
   494	
   495		ret = dma_async_device_register(&urdma->dma_device);
   496		if (ret)
   497			return ret;
   498	
   499		/* runtime pm */
   500		pm_runtime_irq_safe(dev);
   501		pm_runtime_set_autosuspend_delay(dev, AUTOSUSPEND_DELAY);
   502		pm_runtime_use_autosuspend(dev);
   503		pm_runtime_mark_last_busy(dev);
   504		pm_runtime_set_active(dev);
   505		pm_runtime_enable(dev);
   506	
   507		return of_dma_controller_register(pdev->dev.of_node,
   508				of_dma_xlate_by_chan_id, &urdma->dma_device);
   509	}
   510	
 > 511	static int msc313_urdma_suspend(struct device *dev)
   512	{
   513		struct msc313_urdma *urdma = dev_get_drvdata(dev);
   514	
   515		printk("%s:%d\n", __func__, __LINE__);
   516		regmap_field_write(urdma->sw_rst, 1);
   517	
   518		return 0;
   519	}
   520	
 > 521	static int msc313_urdma_resume(struct device *dev)
   522	{
   523		struct msc313_urdma *urdma = dev_get_drvdata(dev);
   524	
   525		printk("%s:%d\n", __func__, __LINE__);
   526	
   527		/* global rst */
   528		regmap_field_write(urdma->sw_rst, 1);
   529		mdelay(10);
   530		regmap_field_write(urdma->sw_rst, 0);
   531	
   532		for (int i = 0; i < CHANNELS; i++) {
   533			struct msc313_urdma_chan *chan = &urdma->chans[i];
   534	
   535			/* reset channel */
   536			regmap_field_write(chan->sw_rst, 1);
   537			mdelay(10);
   538			regmap_field_write(chan->sw_rst, 0);
   539	
   540			regmap_field_write(chan->int_en1, 1);
   541	
   542			regmap_field_write(chan->buf_h, chan->kern_buff_addr >> 16);
   543			regmap_field_write(chan->buf_l, chan->kern_buff_addr);
   544			regmap_field_write(chan->buf_sz, chan->kern_buff_size / 8);
   545		}
   546	
   547		return 0;
   548	}
   549	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
