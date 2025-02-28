Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B51257AEC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740736305; cv=none; b=pvTlc3PlYQFfhvKSe8HPM+xBsBx8ZxJx2/l4T4Pu1BiBpMvrzHF1HFn4V11OrmMgZ25we0PePV3HyN5mtxungpak+b0CbEg0FeyDR+Ajg5mlsGinE6lXaAXvJcMkq/mSWIHenyYyX/CMO6IgCnTO8vHzKGx/ZYPXa2OuuzegV10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740736305; c=relaxed/simple;
	bh=HwDzFEyRNxWnS89nT/6jWbOOFa2mk8WPukfPcbDAUpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FeGj3AsxuzYEjxiBVX3fEL+biepn8PiL+BPVEa4iwszNsxQhGLIIUjtfIurwCqkvKz8Ft7aOm0xxatsq4qnHJ3asn9tPLc/H0i00iPsJNR/helkle95rhRH0PfWRQ6NXJLrdcrECXMo+/KpFFffc7rSCm1/krGlxs7a63lrIC24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJ4cjRyE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJ4cjRyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740736301; x=1772272301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HwDzFEyRNxWnS89nT/6jWbOOFa2mk8WPukfPcbDAUpM=;
  b=dJ4cjRyEbhe/SwK+Cf5b06fhgkJEPVQ49IKNhN8ZqVfcitTAT/Vb13Wu
   MY9tOB/5Rdi6ot30BPzoOtZLkRutuMLP1OqGA2zc1LO8oJU+sy+uX+ren
   +nyhiaXO8gTYNKPgCNMW6Yjay845d1UWne3kVziA0wGUZlUiw/uuShh4Z
   onDE0nwbXVg5N2BGF42IGp1TNXRhjWlPHhUTrJynHugkHY/D/sonzBTPK
   nlUX4iCtWr2XmsJhBZoZ0H6p+svf+BqjrYAzxujTURUjepP4DhVLJ1m5O
   LfjeOlERLCpinqZZ8XyrFTmJQbYZ9b6k9ZFa4pWQgXQe/Xmv9dMDlP9co
   A==;
X-CSE-ConnectionGUID: NxeCUKaxSlCxk9F0ckB7eQ==
X-CSE-MsgGUID: ocOanenHSuuZ5TgHphTBqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41507115"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="41507115"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 01:51:41 -0800
X-CSE-ConnectionGUID: 41s7ZEqLTQGWcV7MUWPQ5Q==
X-CSE-MsgGUID: 2fzKCgkWQuu9rvMTkTtUyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117797025"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Feb 2025 01:51:40 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnx1u-000Ehu-0i;
	Fri, 28 Feb 2025 09:51:38 +0000
Date: Fri, 28 Feb 2025 17:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/1]
 drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-desc.c:233:73: warning: '%u'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 8
Message-ID: <202502281714.HCEZYpyL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   83b17ccb9899d35bc10eaa78f87da816e711f9e3
commit: e179120d06e458bdae76b939d3e4323fd0426719 [0/1] anolis: ethernet: Add motorcomm yt6801 support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502281714.HCEZYpyL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281714.HCEZYpyL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281714.HCEZYpyL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-desc.c: In function 'fxgmac_alloc_channels':
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-desc.c:233:73: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
     233 |                 snprintf(channel->name, sizeof(channel->name), "channel-%u", i);
         |                                                                         ^~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-desc.c:233:64: note: directive argument in the range [0, 4294967294]
     233 |                 snprintf(channel->name, sizeof(channel->name), "channel-%u", i);
         |                                                                ^~~~~~~~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-desc.c:233:17: note: 'snprintf' output between 10 and 19 bytes into a destination of size 16
     233 |                 snprintf(channel->name, sizeof(channel->name), "channel-%u", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_set_wake_pattern':
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:3241:22: warning: variable 'ptmask' set but not used [-Wunused-but-set-variable]
    3241 |         u8 *ptdata, *ptmask;
         |                      ^~~~~~
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:3241:13: warning: variable 'ptdata' set but not used [-Wunused-but-set-variable]
    3241 |         u8 *ptdata, *ptmask;
         |             ^~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_dev_read':
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:4761:33: warning: variable 'l34t' set but not used [-Wunused-but-set-variable]
    4761 |         unsigned int err, etlt, l34t;
         |                                 ^~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_dismiss_MAC_int':
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:5045:21: warning: variable 'regErrVal' set but not used [-Wunused-but-set-variable]
    5045 |         u32 regval, regErrVal;
         |                     ^~~~~~~~~
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:5045:13: warning: variable 'regval' set but not used [-Wunused-but-set-variable]
    5045 |         u32 regval, regErrVal;
         |             ^~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_dismiss_MAC_PMT_int':
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:5056:13: warning: variable 'regval' set but not used [-Wunused-but-set-variable]
    5056 |         u32 regval;
         |             ^~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_dismiss_MAC_LPI_int':
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:5065:13: warning: variable 'regval' set but not used [-Wunused-but-set-variable]
    5065 |         u32 regval;
         |             ^~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_dismiss_all_int':
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:5088:25: warning: variable 'regval' set but not used [-Wunused-but-set-variable]
    5088 |         unsigned int i, regval;
         |                         ^~~~~~
--
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c: In function 'fxgmac_tx_poll':
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c:1793:20: warning: variable 'reg_cur_pre' set but not used [-Wunused-but-set-variable]
    1793 |         static u32 reg_cur_pre = 0xffffffff;
         |                    ^~~~~~~~~~~
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c:1792:20: warning: variable 'change_cnt' set but not used [-Wunused-but-set-variable]
    1792 |         static u32 change_cnt;
         |                    ^~~~~~~~~~
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c:1791:20: warning: variable 'fxgmac_restart_need' set but not used [-Wunused-but-set-variable]
    1791 |         static int fxgmac_restart_need;
         |                    ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c: In function 'fxgmac_one_poll_tx':
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c:2240:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2240 |         int ret = 0;
         |             ^~~
--
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-debugfs.c:703: warning: Function parameter or member 'pdata' not described in 'fxgmac_dbg_adapter_init'
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-debugfs.c:703: warning: Excess function parameter 'adapter' description in 'fxgmac_dbg_adapter_init'
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-debugfs.c:725: warning: Function parameter or member 'pdata' not described in 'fxgmac_dbg_adapter_exit'
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-debugfs.c:725: warning: Excess function parameter 'adapter' description in 'fxgmac_dbg_adapter_exit'
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-debugfs.c:735: warning: Function parameter or member 'pdata' not described in 'fxgmac_dbg_init'
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-debugfs.c:782: warning: Function parameter or member 'pdata' not described in 'fxgmac_dbg_exit'


vim +233 drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-desc.c

   201	
   202		channel_head = kcalloc(pdata->channel_count,
   203				       sizeof(struct fxgmac_channel), GFP_KERNEL);
   204		if (netif_msg_drv(pdata))
   205			DPRINTK("alloc_channels, channel_head=%p, size=%d*%ld\n",
   206				channel_head, pdata->channel_count,
   207				sizeof(struct fxgmac_channel));
   208	
   209		if (!channel_head)
   210			return ret;
   211	
   212		netif_dbg(pdata, drv, pdata->netdev, "channel_head=%p\n", channel_head);
   213	
   214		tx_ring = kcalloc(pdata->tx_ring_count, sizeof(struct fxgmac_ring),
   215				  GFP_KERNEL);
   216		if (!tx_ring)
   217			goto err_tx_ring;
   218	
   219		if (netif_msg_drv(pdata))
   220			DPRINTK("alloc_channels, tx_ring=%p, size=%d*%ld\n", tx_ring,
   221				pdata->tx_ring_count, sizeof(struct fxgmac_ring));
   222		rx_ring = kcalloc(pdata->rx_ring_count, sizeof(struct fxgmac_ring),
   223				  GFP_KERNEL);
   224		if (!rx_ring)
   225			goto err_rx_ring;
   226	
   227		if (netif_msg_drv(pdata))
   228			DPRINTK("alloc_channels, rx_ring=%p, size=%d*%ld\n", rx_ring,
   229				pdata->rx_ring_count, sizeof(struct fxgmac_ring));
   230	
   231		for (i = 0, channel = channel_head; i < pdata->channel_count;
   232		     i++, channel++) {
 > 233			snprintf(channel->name, sizeof(channel->name), "channel-%u", i);
   234			channel->pdata = pdata;
   235			channel->queue_index = i;
   236			channel->dma_regs =
   237				pdata->mac_regs + DMA_CH_BASE + (DMA_CH_INC * i);
   238	
   239			if (pdata->per_channel_irq) {
   240				/* Get the per DMA interrupt */
   241	#ifdef CONFIG_PCI_MSI
   242				if (msix) {
   243					pdata->channel_irq[i] =
   244						pdata->expansion.msix_entries[i].vector;
   245					if (FXGMAC_IS_CHANNEL_WITH_TX_IRQ(i)) {
   246						pdata->channel_irq
   247							[FXGMAC_MAX_DMA_CHANNELS] =
   248							pdata->expansion
   249								.msix_entries
   250									[FXGMAC_MAX_DMA_CHANNELS]
   251								.vector;
   252	
   253						if (pdata->channel_irq
   254							    [FXGMAC_MAX_DMA_CHANNELS] <
   255						    0) {
   256							netdev_err(
   257								pdata->netdev,
   258								"get_irq %u for tx failed\n",
   259								i + 1);
   260							goto err_irq;
   261						}
   262	
   263						channel->expansion.dma_irq_tx =
   264							pdata->channel_irq
   265								[FXGMAC_MAX_DMA_CHANNELS];
   266						DPRINTK("fxgmac_alloc_channels, for MSIx, channel %d dma_irq_tx=%u\n",
   267							i,
   268							channel->expansion.dma_irq_tx);
   269					}
   270				}
   271	#endif
   272				ret = pdata->channel_irq[i];
   273				if (ret < 0) {
   274					netdev_err(pdata->netdev, "get_irq %u failed\n",
   275						   i + 1);
   276					goto err_irq;
   277				}
   278				channel->dma_irq = ret;
   279				DPRINTK("fxgmac_alloc_channels, for MSIx, channel %d dma_irq=%u\n",
   280					i, channel->dma_irq);
   281			}
   282	
   283			if (i < pdata->tx_ring_count)
   284				channel->tx_ring = tx_ring++;
   285	
   286			if (i < pdata->rx_ring_count)
   287				channel->rx_ring = rx_ring++;
   288	
   289			netif_dbg(pdata, drv, pdata->netdev,
   290				  "%s: dma_regs=%p, tx_ring=%p, rx_ring=%p\n",
   291				  channel->name, channel->dma_regs, channel->tx_ring,
   292				  channel->rx_ring);
   293		}
   294	
   295		pdata->channel_head = channel_head;
   296	
   297		if (netif_msg_drv(pdata))
   298			DPRINTK("alloc_channels callout ok\n");
   299		return 0;
   300	
   301	err_irq:
   302		kfree(rx_ring);
   303	
   304	err_rx_ring:
   305		kfree(tx_ring);
   306	
   307	err_tx_ring:
   308		kfree(channel_head);
   309	
   310		DPRINTK("fxgmac alloc_channels callout err,%d\n", ret);
   311		return ret;
   312	}
   313	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
