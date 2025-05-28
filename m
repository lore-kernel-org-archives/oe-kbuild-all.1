Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC00469D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 00:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748393153; cv=none; b=L759dCX/wrHlqTYS657U/3q2v9aDYflCQ8ydxT8hmn5lH/QBzMfFmQ0peIoscrSFo6WaGA4p7y5/0e21KZqE4QrFlhceQZFdHQIXjAYtbgBNaiYf/qALAjrHmAVX2edeEP6SW4SlmBE1XhBHTxCfuuh2rsm0Ee4j08tpYCk/lyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748393153; c=relaxed/simple;
	bh=W9EL26fpB6BXpSDDOpS+DvDoKuviy1rZFUnYpyIGxwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FT9f4heHcY4oP+exVZBXvLkUI0Vj+uFnQGGUhBPaVVIBX71MHm/qefH8pPCL+48/H3iC2wWi9ryQOJHstb2avy9ELPFEFLrx5eagtX3ycsv8AYyHezaBmrv7XYRmrTb+1/AyfODFUIqRIfbGDdJpEH4CiecgwUQAwdBi1JoPtdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVi1nV8k; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVi1nV8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748393150; x=1779929150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9EL26fpB6BXpSDDOpS+DvDoKuviy1rZFUnYpyIGxwQ=;
  b=MVi1nV8k+dkWy7Ib18VNGenXEVXEi64wQGaC5oNHINTnQvR7evbn5PtU
   VJpB0pog2z7VlNTdmvQ6pNHQiozi3ut7f8x62cSVyh5HrIPbyX5fJWVjI
   5Ur72wCQ/FFsqFrfJasALSZTAXGyuJjMP11q6HgjfEEkb8zq2IYs4ujuk
   1ot2VVD9ZUNqKm/Ycv9cuBWZ8gXvWiEzb467H0eYj2hlXEjVTCduOma8b
   SjX1D+RK55yRGch38p6sYLBxE4pqV6TP2Gtp/AdjZsebI+sOEj19Mky+p
   8/jCYIcOSHOhoIdwHdXorr/4/wAOuYJb5Rn85pWATzmXqJLud5oKFJl9+
   Q==;
X-CSE-ConnectionGUID: otnywSasR++JhbHGT7Uciw==
X-CSE-MsgGUID: limlJ5g6QyGHkyBeWeO2MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61456629"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61456629"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 17:45:50 -0700
X-CSE-ConnectionGUID: Xg1ICtrrS2msdKxLgWgjWw==
X-CSE-MsgGUID: G8t5rANmRR6FZjXKsnFU+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="173936450"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2025 17:45:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK4vS-000V80-2P;
	Wed, 28 May 2025 00:45:46 +0000
Date: Wed, 28 May 2025 08:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2300/2300]
 drivers/net/ethernet/motorcomm/yt6801/yt6801_desc.c:206:73: warning: '%u'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 8
Message-ID: <202505280802.sHbtyOVR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   35c5792a71f249ce79eba3cbb546d1ece7c4f3ee
commit: 6460d9d3c42d1357c8292d7be5c26cb7b84e84d7 [2300/2300] yt6801: Add Motorcomm yt6801 PCIe driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250528/202505280802.sHbtyOVR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280802.sHbtyOVR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280802.sHbtyOVR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/motorcomm/yt6801/yt6801_desc.c: In function 'fxgmac_channels_alloc':
>> drivers/net/ethernet/motorcomm/yt6801/yt6801_desc.c:206:73: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
     206 |                 snprintf(channel->name, sizeof(channel->name), "channel-%u", i);
         |                                                                         ^~
   drivers/net/ethernet/motorcomm/yt6801/yt6801_desc.c:206:64: note: directive argument in the range [0, 4294967294]
     206 |                 snprintf(channel->name, sizeof(channel->name), "channel-%u", i);
         |                                                                ^~~~~~~~~~~~
   drivers/net/ethernet/motorcomm/yt6801/yt6801_desc.c:206:17: note: 'snprintf' output between 10 and 19 bytes into a destination of size 16
     206 |                 snprintf(channel->name, sizeof(channel->name), "channel-%u", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/motorcomm/yt6801/yt6801_main.c: In function 'fxgmac_get_all_hw_features':
>> drivers/net/ethernet/motorcomm/yt6801/yt6801_main.c:1715:42: warning: variable 'mac_hfr2' set but not used [-Wunused-but-set-variable]
    1715 |         unsigned int mac_hfr0, mac_hfr1, mac_hfr2, mac_hfr3;
         |                                          ^~~~~~~~


vim +206 drivers/net/ethernet/motorcomm/yt6801/yt6801_desc.c

   181	
   182	static int fxgmac_channels_alloc(struct fxgmac_pdata *priv)
   183	{
   184		struct fxgmac_channel *channel_head, *channel;
   185		struct fxgmac_ring *tx_ring, *rx_ring;
   186		int ret = -ENOMEM;
   187	
   188		channel_head = kcalloc(priv->channel_count,
   189				       sizeof(struct fxgmac_channel), GFP_KERNEL);
   190	
   191		if (!channel_head)
   192			return ret;
   193	
   194		tx_ring = kcalloc(FXGMAC_TX_1_RING, sizeof(struct fxgmac_ring),
   195				  GFP_KERNEL);
   196		if (!tx_ring)
   197			goto err_tx_ring;
   198	
   199		rx_ring = kcalloc(priv->rx_ring_count, sizeof(struct fxgmac_ring),
   200				  GFP_KERNEL);
   201		if (!rx_ring)
   202			goto err_rx_ring;
   203	
   204		channel = channel_head;
   205		for (u32 i = 0; i < priv->channel_count; i++, channel++) {
 > 206			snprintf(channel->name, sizeof(channel->name), "channel-%u", i);
   207			channel->priv = priv;
   208			channel->queue_index = i;
   209			channel->dma_regs = (priv)->hw_addr + DMA_CH_BASE +
   210					    (DMA_CH_INC * i);
   211	
   212			if (priv->per_channel_irq) {
   213				priv->channel_irq[i] = priv->msix_entries[i].vector;
   214	
   215				if (IS_ENABLED(CONFIG_PCI_MSI) &&  i < FXGMAC_TX_1_RING)
   216					fxgmac_set_msix_tx_irq(priv, channel);
   217	
   218				/* Get the per DMA rx interrupt */
   219				ret = priv->channel_irq[i];
   220				if (ret < 0) {
   221					dev_err(priv->dev, "channel irq[%u] failed\n",
   222						i + 1);
   223					goto err_irq;
   224				}
   225	
   226				channel->dma_irq_rx = ret;
   227			}
   228	
   229			if (i < FXGMAC_TX_1_RING)
   230				channel->tx_ring = tx_ring++;
   231	
   232			if (i < priv->rx_ring_count)
   233				channel->rx_ring = rx_ring++;
   234		}
   235	
   236		priv->channel_head = channel_head;
   237		return 0;
   238	
   239	err_irq:
   240		kfree(rx_ring);
   241	
   242	err_rx_ring:
   243		kfree(tx_ring);
   244	
   245	err_tx_ring:
   246		kfree(channel_head);
   247	
   248		dev_err(priv->dev, "%s failed:%d\n", __func__, ret);
   249		return ret;
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
