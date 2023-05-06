Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F041C13
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 11:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683372134; x=1714908134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=flVAQwVB7UcsoYbqL2/3u8I87c0T94FBiuA6xvdl6Ic=;
  b=JlAm8HdLIrmIzVVdGbZs0Mi52dHenAzYSk9BM9fW9SUGngE0CnSlJZRx
   /Vm0AOwMTd7Hg9ZxjOxcYjPcGJJ2jPUfGfoT0QDfbReeKIywZUvmy+tQd
   cJW6GHoIR5OQFwIaPgV6BZhCeuElX+IYahrXGesCEg0bqwO//93yx4yrf
   QWPaQT9P9tNiRLe2FXfALnScoMLnDfCMuphAJ9Q8sLRDwGgpWWNRDal2I
   w5RvXu9PaSZ1R7KrxPnx9muLY4uWtL7Yzhd9kTFJV6hkiPBYxxvycxxG1
   1E1dmhjtEtwpfUv5QWclvxl1aru2UX9+eKP1JHclJFKGYt6vrRxUsQPPj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="328995527"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="328995527"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 04:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="787498964"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="787498964"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 May 2023 04:22:12 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvFzP-0000DZ-21;
	Sat, 06 May 2023 11:22:11 +0000
Date: Sat, 6 May 2023 19:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: kumarama-i <aman.kumar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>
Subject: [intel-lts:5.15/linux 1/25] drivers/tty/serial/8250/8250_dma.c:290
 serial8250_request_dma() warn: inconsistent indenting
Message-ID: <202305061934.nTBxeNft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   95c83b378e090dcfd0b6371f5ebf68fc063fdb17
commit: c485aff7273b5137b51827a10b5db356fe9de7d8 [1/25] serial: 8250: EHL_PSE_DMA_enable_for_8250
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230506/202305061934.nTBxeNft-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061934.nTBxeNft-lkp@intel.com/

smatch warnings:
drivers/tty/serial/8250/8250_dma.c:290 serial8250_request_dma() warn: inconsistent indenting

vim +290 drivers/tty/serial/8250/8250_dma.c

   201	
   202	int serial8250_request_dma(struct uart_8250_port *p)
   203	{
   204		struct uart_8250_dma	*dma = p->dma;
   205		phys_addr_t rx_dma_addr = dma->rx_dma_addr ?
   206					  dma->rx_dma_addr : p->port.mapbase;
   207		phys_addr_t tx_dma_addr = dma->tx_dma_addr ?
   208					  dma->tx_dma_addr : p->port.mapbase;
   209		dma_cap_mask_t		mask;
   210		struct dma_slave_caps	caps;
   211		int			ret;
   212	
   213		/* Default slave configuration parameters */
   214		dma->rxconf.direction		= DMA_DEV_TO_MEM;
   215		dma->rxconf.src_addr_width	= DMA_SLAVE_BUSWIDTH_1_BYTE;
   216		dma->rxconf.src_addr		= rx_dma_addr + UART_RX;
   217	
   218		dma->txconf.direction		= DMA_MEM_TO_DEV;
   219		dma->txconf.dst_addr_width	= DMA_SLAVE_BUSWIDTH_1_BYTE;
   220		dma->txconf.dst_addr		= tx_dma_addr + UART_TX;
   221	
   222		dma_cap_zero(mask);
   223		dma_cap_set(DMA_SLAVE, mask);
   224	
   225		/* Get a channel for RX */
   226		dma->rxchan = dma_request_slave_channel_compat(mask,
   227							       dma->fn, dma->rx_param,
   228							       p->port.dev, "rx");
   229		if (!dma->rxchan)
   230			return -ENODEV;
   231	
   232		/* 8250 rx dma requires dmaengine driver to support pause/terminate */
   233		ret = dma_get_slave_caps(dma->rxchan, &caps);
   234		if (ret)
   235			goto release_rx;
   236		if (!caps.cmd_pause || !caps.cmd_terminate ||
   237		    caps.residue_granularity == DMA_RESIDUE_GRANULARITY_DESCRIPTOR) {
   238			ret = -EINVAL;
   239			goto release_rx;
   240		}
   241	
   242		dmaengine_slave_config(dma->rxchan, &dma->rxconf);
   243	
   244		/* Get a channel for TX */
   245		dma->txchan = dma_request_slave_channel_compat(mask,
   246							       dma->fn, dma->tx_param,
   247							       p->port.dev, "tx");
   248		if (!dma->txchan) {
   249			ret = -ENODEV;
   250			goto release_rx;
   251		}
   252	
   253		/* 8250 tx dma requires dmaengine driver to support terminate */
   254		ret = dma_get_slave_caps(dma->txchan, &caps);
   255		if (ret)
   256			goto err;
   257		if (!caps.cmd_terminate) {
   258			ret = -EINVAL;
   259			goto err;
   260		}
   261	
   262		dmaengine_slave_config(dma->txchan, &dma->txconf);
   263	
   264		/* RX buffer */
   265		if (!dma->rx_size)
   266			dma->rx_size = PAGE_SIZE;
   267	
   268		if (ehl_pse_dma_dev(p->port.dev)) {
   269			dma->rx_buf = dma_alloc_coherent(p->port.dev, dma->rx_size,
   270							&dma->rx_addr, GFP_KERNEL);
   271		} else {
   272			dma->rx_buf = dma_alloc_coherent(dma->rxchan->device->dev,
   273					dma->rx_size, &dma->rx_addr, GFP_KERNEL);
   274		}
   275	
   276		if (!dma->rx_buf) {
   277			ret = -ENOMEM;
   278			goto err;
   279		}
   280	
   281		/* TX buffer */
   282		if (ehl_pse_dma_dev(p->port.dev)) {
   283			dma->tx_addr = dma_map_single(p->port.dev,
   284							p->port.state->xmit.buf,
   285							UART_XMIT_SIZE,
   286							DMA_TO_DEVICE);
   287			if (dma_mapping_error(p->port.dev, dma->tx_addr)) {
   288				dma_free_coherent(p->port.dev, dma->rx_size,
   289						dma->rx_buf, dma->rx_addr);
 > 290			ret = -ENOMEM;
   291			goto err;
   292			}
   293		} else {
   294			dma->tx_addr = dma_map_single(dma->txchan->device->dev,
   295						p->port.state->xmit.buf,
   296						UART_XMIT_SIZE,
   297						DMA_TO_DEVICE);
   298			if (dma_mapping_error(dma->txchan->device->dev, dma->tx_addr)) {
   299				dma_free_coherent(dma->rxchan->device->dev, dma->rx_size,
   300								 dma->rx_buf, dma->rx_addr);
   301				ret = -ENOMEM;
   302				goto err;
   303			}
   304		}
   305	
   306		dev_dbg_ratelimited(p->port.dev, "got both dma channels\n");
   307	
   308		return 0;
   309	err:
   310		dma_release_channel(dma->txchan);
   311	release_rx:
   312		dma_release_channel(dma->rxchan);
   313		return ret;
   314	}
   315	EXPORT_SYMBOL_GPL(serial8250_request_dma);
   316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
