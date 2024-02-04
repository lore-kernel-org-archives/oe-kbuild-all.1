Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EF12374E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 16:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707064476; cv=none; b=SvotG07ol7ihuOVHSkYvPrN8hqUhEJepSdCITPpoSjap6YQnDKALeoB01KknYiGs0jAu0X/XidSvN+vsz0HZzZf7a+u2XY8yU1AbSjv6WMSPuRVPGc/WY9BLdbbgUjTVM947V0oNcac0CwBpuYE2xjwL7lPSROHJcDf3upPXYNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707064476; c=relaxed/simple;
	bh=mpeADBYyYVMUzjlDstHA1D3kfsveNov6VUlHsWfLYMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r75tB50hEjj+q+eKugRa6P80L0hUjH9XMfmhaU6F/vrvN224r8JxYZUoxltl7nR10aXIdO3ucpHCXoBQsKu2/z1R4UfHRomjG8aMxn7qKJdOu2/O/hgU3LSS/OfZeBsYzSdR5/ODjoyu2MaLrNr11kas3hGCWb81nRqCOXAWHNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyGf/KqV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyGf/KqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707064474; x=1738600474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mpeADBYyYVMUzjlDstHA1D3kfsveNov6VUlHsWfLYMc=;
  b=DyGf/KqVvn5Yq0EoNj05ljlra/PjlowkLJC3cJQ4PeMeOw+k3UFxy7Bo
   JUA6Yrl0KpQsfszFyLfqGKQLvg03871TmCPj17BDrMqSPZUl4vicmKJQM
   GaaT8gtosx3l4gx39yEdLB8v7CqRtV9fssxmqktGd5nfKf3vPedbVz5/B
   UOVp+keUA7SM1f38k4hhi6/KVqwW8SQjeo3gYoEva8qOZZtCXVozaYgep
   sItusnruBFHjjxo4rDEAC1GMHBYGF0x3Do4wxHcBhYvb08VC8Ycg767nX
   VTyPBj5Bz+vDpUz0ejg3eTjPVFQDK9exRDAlAf+uJvqwbIgIFrJXU0p16
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="4223395"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="4223395"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 08:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="808519"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2024 08:34:31 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWfRt-0006Wi-0H;
	Sun, 04 Feb 2024 16:34:29 +0000
Date: Mon, 5 Feb 2024 00:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: oe-kbuild-all@lists.linux.dev, Pavel <pavel@ucw.cz>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	Biju Das <biju.das@bp.renesas.com>, Pavel Machek <pavel@denx.de>
Subject: [cip:linux-4.4.y-cip 3914/9999]
 drivers/mmc/host/renesas_sdhi_sys_dmac.c:67:42: warning:
 'of_rcar_gen3_compatible' defined but not used
Message-ID: <202402050031.215RhxIL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-cip
head:   779dae67e799dfb8a0267e26038ab74c58261f24
commit: 9bf7be5474bacad29d073dd6d00524b5f15d3e97 [3914/9999] mmc: renesas-sdhi: make renesas_sdhi_sys_dmac main module file
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240205/202402050031.215RhxIL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402050031.215RhxIL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050031.215RhxIL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mmc/host/renesas_sdhi_sys_dmac.c:18:0:
   include/linux/pagemap.h: In function 'fault_in_multipages_readable':
   include/linux/pagemap.h:632:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
     volatile char c;
                   ^
   In file included from include/linux/dma-mapping.h:10:0,
                    from drivers/mmc/host/renesas_sdhi_sys_dmac.c:12:
   drivers/mmc/host/renesas_sdhi_sys_dmac.c: In function 'renesas_sdhi_sys_dmac_start_dma_rx':
   include/linux/scatterlist.h:149:35: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (__i = 0, sg = (sglist); __i < (nr); __i++, sg = sg_next(sg))
                                      ^
   drivers/mmc/host/renesas_sdhi_sys_dmac.c:157:2: note: in expansion of macro 'for_each_sg'
     for_each_sg(sg, sg_tmp, host->sg_len, i) {
     ^~~~~~~~~~~
   drivers/mmc/host/renesas_sdhi_sys_dmac.c: In function 'renesas_sdhi_sys_dmac_start_dma_tx':
   include/linux/scatterlist.h:149:35: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (__i = 0, sg = (sglist); __i < (nr); __i++, sg = sg_next(sg))
                                      ^
   drivers/mmc/host/renesas_sdhi_sys_dmac.c:231:2: note: in expansion of macro 'for_each_sg'
     for_each_sg(sg, sg_tmp, host->sg_len, i) {
     ^~~~~~~~~~~
   At top level:
>> drivers/mmc/host/renesas_sdhi_sys_dmac.c:67:42: warning: 'of_rcar_gen3_compatible' defined but not used [-Wunused-const-variable=]
    static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/renesas_sdhi_sys_dmac.c:1: warning: no structured comments found


vim +/of_rcar_gen3_compatible +67 drivers/mmc/host/renesas_sdhi_sys_dmac.c

    66	
  > 67	static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
    68		.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_WRPROTECT_DISABLE |
    69				  TMIO_MMC_CLK_ACTUAL | TMIO_MMC_MIN_RCAR2,
    70		.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ,
    71		.bus_shift	= 2,
    72		.scc_offset	= 0x1000,
    73		.taps		= rcar_gen3_scc_taps,
    74		.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
    75	};
    76	
    77	static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
    78		{ .compatible = "renesas,sdhi-shmobile" },
    79		{ .compatible = "renesas,sdhi-sh73a0", .data = &of_default_cfg, },
    80		{ .compatible = "renesas,sdhi-r8a73a4", .data = &of_default_cfg, },
    81		{ .compatible = "renesas,sdhi-r8a7740", .data = &of_default_cfg, },
    82		{ .compatible = "renesas,sdhi-r8a7778", .data = &of_rcar_gen1_compatible, },
    83		{ .compatible = "renesas,sdhi-r8a7779", .data = &of_rcar_gen1_compatible, },
    84		{ .compatible = "renesas,sdhi-r8a7743", .data = &of_rcar_gen2_compatible, },
    85		{ .compatible = "renesas,sdhi-r8a7744", .data = &of_rcar_gen2_compatible, },
    86		{ .compatible = "renesas,sdhi-r8a7745", .data = &of_rcar_gen2_compatible, },
    87		{ .compatible = "renesas,sdhi-r8a7790", .data = &of_rcar_gen2_compatible, },
    88		{ .compatible = "renesas,sdhi-r8a7791", .data = &of_rcar_gen2_compatible, },
    89		{ .compatible = "renesas,sdhi-r8a7792", .data = &of_rcar_gen2_compatible, },
    90		{ .compatible = "renesas,sdhi-r8a7793", .data = &of_rcar_gen2_compatible, },
    91		{ .compatible = "renesas,sdhi-r8a7794", .data = &of_rcar_gen2_compatible, },
    92		{},
    93	};
    94	MODULE_DEVICE_TABLE(of, renesas_sdhi_sys_dmac_of_match);
    95	
    96	
    97	static void renesas_sdhi_sys_dmac_enable_dma(struct tmio_mmc_host *host,
    98						     bool enable)
    99	{
   100		if (!host->chan_tx || !host->chan_rx)
   101			return;
   102	
   103		if (host->dma->enable)
   104			host->dma->enable(host, enable);
   105	}
   106	
   107	static void renesas_sdhi_sys_dmac_abort_dma(struct tmio_mmc_host *host)
   108	{
   109		renesas_sdhi_sys_dmac_enable_dma(host, false);
   110	
   111		if (host->chan_rx)
   112			dmaengine_terminate_all(host->chan_rx);
   113		if (host->chan_tx)
   114			dmaengine_terminate_all(host->chan_tx);
   115	
   116		renesas_sdhi_sys_dmac_enable_dma(host, true);
   117	}
   118	
   119	static void renesas_sdhi_sys_dmac_dma_callback(void *arg)
   120	{
   121		struct tmio_mmc_host *host = arg;
   122	
   123		spin_lock_irq(&host->lock);
   124	
   125		if (!host->data)
   126			goto out;
   127	
   128		if (host->data->flags & MMC_DATA_READ)
   129			dma_unmap_sg(host->chan_rx->device->dev,
   130				     host->sg_ptr, host->sg_len,
   131				     DMA_FROM_DEVICE);
   132		else
   133			dma_unmap_sg(host->chan_tx->device->dev,
   134				     host->sg_ptr, host->sg_len,
   135				     DMA_TO_DEVICE);
   136	
   137		spin_unlock_irq(&host->lock);
   138	
   139		wait_for_completion(&host->dma_dataend);
   140	
   141		spin_lock_irq(&host->lock);
   142		tmio_mmc_do_data_irq(host);
   143	out:
   144		spin_unlock_irq(&host->lock);
   145	}
   146	
   147	static void renesas_sdhi_sys_dmac_start_dma_rx(struct tmio_mmc_host *host)
   148	{
   149		struct scatterlist *sg = host->sg_ptr, *sg_tmp;
   150		struct dma_async_tx_descriptor *desc = NULL;
   151		struct dma_chan *chan = host->chan_rx;
   152		dma_cookie_t cookie;
   153		int ret, i;
   154		bool aligned = true, multiple = true;
   155		unsigned int align = (1 << host->pdata->alignment_shift) - 1;
   156	
   157		for_each_sg(sg, sg_tmp, host->sg_len, i) {
   158			if (sg_tmp->offset & align)
   159				aligned = false;
   160			if (sg_tmp->length & align) {
   161				multiple = false;
   162				break;
   163			}
   164		}
   165	
   166		if ((!aligned && (host->sg_len > 1 || sg->length > PAGE_CACHE_SIZE ||
   167				  (align & PAGE_MASK))) || !multiple) {
   168			ret = -EINVAL;
   169			goto pio;
   170		}
   171	
   172		if (sg->length < TMIO_MMC_MIN_DMA_LEN) {
   173			host->force_pio = true;
   174			return;
   175		}
   176	
   177		tmio_mmc_disable_mmc_irqs(host, TMIO_STAT_RXRDY);
   178	
   179		/* The only sg element can be unaligned, use our bounce buffer then */
   180		if (!aligned) {
   181			sg_init_one(&host->bounce_sg, host->bounce_buf, sg->length);
   182			host->sg_ptr = &host->bounce_sg;
   183			sg = host->sg_ptr;
   184		}
   185	
   186		ret = dma_map_sg(chan->device->dev, sg, host->sg_len, DMA_FROM_DEVICE);
   187		if (ret > 0)
   188			desc = dmaengine_prep_slave_sg(chan, sg, ret,
   189				DMA_DEV_TO_MEM, DMA_CTRL_ACK);
   190	
   191		if (desc) {
   192			reinit_completion(&host->dma_dataend);
   193			desc->callback = renesas_sdhi_sys_dmac_dma_callback;
   194			desc->callback_param = host;
   195	
   196			cookie = dmaengine_submit(desc);
   197			if (cookie < 0) {
   198				desc = NULL;
   199				ret = cookie;
   200			}
   201		}
   202	pio:
   203		if (!desc) {
   204			/* DMA failed, fall back to PIO */
   205			renesas_sdhi_sys_dmac_enable_dma(host, false);
   206			if (ret >= 0)
   207				ret = -EIO;
   208			host->chan_rx = NULL;
   209			dma_release_channel(chan);
   210			/* Free the Tx channel too */
   211			chan = host->chan_tx;
   212			if (chan) {
   213				host->chan_tx = NULL;
   214				dma_release_channel(chan);
   215			}
   216			dev_warn(&host->pdev->dev,
   217				 "DMA failed: %d, falling back to PIO\n", ret);
   218		}
   219	}
   220	
   221	static void renesas_sdhi_sys_dmac_start_dma_tx(struct tmio_mmc_host *host)
   222	{
   223		struct scatterlist *sg = host->sg_ptr, *sg_tmp;
   224		struct dma_async_tx_descriptor *desc = NULL;
   225		struct dma_chan *chan = host->chan_tx;
   226		dma_cookie_t cookie;
   227		int ret, i;
   228		bool aligned = true, multiple = true;
   229		unsigned int align = (1 << host->pdata->alignment_shift) - 1;
   230	
 > 231		for_each_sg(sg, sg_tmp, host->sg_len, i) {
   232			if (sg_tmp->offset & align)
   233				aligned = false;
   234			if (sg_tmp->length & align) {
   235				multiple = false;
   236				break;
   237			}
   238		}
   239	
   240		if ((!aligned && (host->sg_len > 1 || sg->length > PAGE_CACHE_SIZE ||
   241				  (align & PAGE_MASK))) || !multiple) {
   242			ret = -EINVAL;
   243			goto pio;
   244		}
   245	
   246		if (sg->length < TMIO_MMC_MIN_DMA_LEN) {
   247			host->force_pio = true;
   248			return;
   249		}
   250	
   251		tmio_mmc_disable_mmc_irqs(host, TMIO_STAT_TXRQ);
   252	
   253		/* The only sg element can be unaligned, use our bounce buffer then */
   254		if (!aligned) {
   255			unsigned long flags;
   256			void *sg_vaddr = tmio_mmc_kmap_atomic(sg, &flags);
   257			sg_init_one(&host->bounce_sg, host->bounce_buf, sg->length);
   258			memcpy(host->bounce_buf, sg_vaddr, host->bounce_sg.length);
   259			tmio_mmc_kunmap_atomic(sg, &flags, sg_vaddr);
   260			host->sg_ptr = &host->bounce_sg;
   261			sg = host->sg_ptr;
   262		}
   263	
   264		ret = dma_map_sg(chan->device->dev, sg, host->sg_len, DMA_TO_DEVICE);
   265		if (ret > 0)
   266			desc = dmaengine_prep_slave_sg(chan, sg, ret,
   267				DMA_MEM_TO_DEV, DMA_CTRL_ACK);
   268	
   269		if (desc) {
   270			reinit_completion(&host->dma_dataend);
   271			desc->callback = renesas_sdhi_sys_dmac_dma_callback;
   272			desc->callback_param = host;
   273	
   274			cookie = dmaengine_submit(desc);
   275			if (cookie < 0) {
   276				desc = NULL;
   277				ret = cookie;
   278			}
   279		}
   280	pio:
   281		if (!desc) {
   282			/* DMA failed, fall back to PIO */
   283			renesas_sdhi_sys_dmac_enable_dma(host, false);
   284			if (ret >= 0)
   285				ret = -EIO;
   286			host->chan_tx = NULL;
   287			dma_release_channel(chan);
   288			/* Free the Rx channel too */
   289			chan = host->chan_rx;
   290			if (chan) {
   291				host->chan_rx = NULL;
   292				dma_release_channel(chan);
   293			}
   294			dev_warn(&host->pdev->dev,
   295				 "DMA failed: %d, falling back to PIO\n", ret);
   296		}
   297	}
   298	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
