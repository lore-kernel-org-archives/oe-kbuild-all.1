Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F33E3271FA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831980; cv=none; b=J680RP8tUNAU4PQxJdDI3ZWJ9bBeA/7ICVy86O3nC6DNDVMum9QJ7W/s6jcRwFxZ2yz5WpNNTlTFp1jHDtCUIpBpa1VF4Fkp/Jb85yGqRoBgouI1zq+0fbTcHpoKhnC3lnMvY47d1ZIdlMkspbswFYC/AEB7ouc2O65XedIeHMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831980; c=relaxed/simple;
	bh=OBhXGflPpLYdd5na4eAm7+ha1UjkuNk9QrMa5QknDTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQfBedKFwMkuGHxuHwG3pg/EfVhOXgXdP3QLRb92fvtmKOQ8uQo2ra88ZthsGFYkotSekEdEYsrITpXMPz1NLREM5OrDyUi6WqIe5zlhtNKyRTs28HYctNCHHylCR7ckhytqZjBx3uwYC7x/vaLPVGCk1R0kwVmIAizkvGtZU04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJ8MBV1E; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJ8MBV1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765831978; x=1797367978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OBhXGflPpLYdd5na4eAm7+ha1UjkuNk9QrMa5QknDTg=;
  b=ZJ8MBV1Ex6mHfP7cpdBW85UaTj1Mz+jTZJAgj/Aah2jnEh6jcgVo9DsQ
   lBws0/BQfjUf9rBJul0SZv/c7qv6FCzRG39tdFTxww2fLyOz7NxZ2pRgS
   92ZPKE1b9ZFB9z6Y6d+8vXtXsy4Xx5VT8T2TkUo4YTeSnj0N4BxtoZOoQ
   Uu3a3/9MLPiDa9LjMOmWkpUI59ks22DhI96kTKCmZgjPUpyXNK1T0xcfL
   tzrUu0fZFT0bLk22z+jeDMNaD0nVNBzyQgufKzr6NKK/kPg5u/8jTvg/e
   xYxb4GY4S2R5xgiJGcHT0BIQoWCfLXUap08TaKOtIY5e2jyg9v2PjZ2K8
   A==;
X-CSE-ConnectionGUID: 3/F9gUv4RQmz5003KRoGyg==
X-CSE-MsgGUID: lBGBdM0+TMas1kpYbZOT/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79112735"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="79112735"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 12:52:57 -0800
X-CSE-ConnectionGUID: yrO088X/RyyTJK5B9uT3wg==
X-CSE-MsgGUID: MaqOEe6ZS0K+G8PlWXqfbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197874299"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 Dec 2025 12:52:57 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVFYS-000000000l5-3tDd;
	Mon, 15 Dec 2025 20:52:34 +0000
Date: Tue, 16 Dec 2025 04:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-desc.c:233:73: warning: '%u'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 8
Message-ID: <202512160443.rDIpFXe6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   0bcb74c919819123b737554f5d35edefa0555d65
commit: 112d0b73eedf1907161f808b6caf0e2c271a6969 [11/11] anolis: ethernet: Add motorcomm yt6801 support
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512160443.rDIpFXe6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160443.rDIpFXe6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160443.rDIpFXe6-lkp@intel.com/

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
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:3241:22: warning: variable 'ptmask' set but not used [-Wunused-but-set-variable]
    3241 |         u8 *ptdata, *ptmask;
         |                      ^~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:3241:13: warning: variable 'ptdata' set but not used [-Wunused-but-set-variable]
    3241 |         u8 *ptdata, *ptmask;
         |             ^~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_dev_read':
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:4761:33: warning: variable 'l34t' set but not used [-Wunused-but-set-variable]
    4761 |         unsigned int err, etlt, l34t;
         |                                 ^~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_dismiss_MAC_int':
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:5045:21: warning: variable 'regErrVal' set but not used [-Wunused-but-set-variable]
    5045 |         u32 regval, regErrVal;
         |                     ^~~~~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:5045:13: warning: variable 'regval' set but not used [-Wunused-but-set-variable]
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
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c:1793:20: warning: variable 'reg_cur_pre' set but not used [-Wunused-but-set-variable]
    1793 |         static u32 reg_cur_pre = 0xffffffff;
         |                    ^~~~~~~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c:1792:20: warning: variable 'change_cnt' set but not used [-Wunused-but-set-variable]
    1792 |         static u32 change_cnt;
         |                    ^~~~~~~~~~
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c:1791:20: warning: variable 'fxgmac_restart_need' set but not used [-Wunused-but-set-variable]
    1791 |         static int fxgmac_restart_need;
         |                    ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c: In function 'fxgmac_one_poll_tx':
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c:2240:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2240 |         int ret = 0;
         |             ^~~


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
