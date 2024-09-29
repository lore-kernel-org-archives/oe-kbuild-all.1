Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD91386B4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 11:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727610571; cv=none; b=VcfMqwvzkybxiygOsEUDI8JpGariBKpq1bFf0Js6EzMny/qdbsrcw2uHtwdhGbjiqtPqypyvEyOPzKhQxL9KrU0HQR3Rv3gR89yhxDGRno09165Aa4oPKuoXSioUAeDnKEHhrZkI28O9MfZtDvNbjQQA5S88ASRLdgpX+23aHPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727610571; c=relaxed/simple;
	bh=7cDQIzJairXc8vB1D9IGjoB3RExGkyOYsL6xVgX7WT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NCfSwp8KpCKjav0qkukR5EcHMv5Ho5CbRPdTw2BZ+yWNNVRq/Z4UhqOJEHS/8vFBm8J+2Pb3vAJAwGGG1I0hFOn4u6+3H+SAVqt9d0ajOcdi1t3bewNPXDfbaCa/TMDVs8pE9gEgByjn9w+Wr5D1hjFDlodzKy/QGVnwrTBD+jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPVlt9FB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPVlt9FB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727610569; x=1759146569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7cDQIzJairXc8vB1D9IGjoB3RExGkyOYsL6xVgX7WT4=;
  b=YPVlt9FB2Qs99yD62DLH9wTPxvEwLaC+6pWADv6ZLCMYQcwAN/NlPzup
   nErj1p23efv+5g6k8+3WBsQ4qcrwB+WK7UUb/m2uPHzapmhulY2mzWy6q
   rEnsl8YvA7Imz3z8VMKrzXuIslqAIOTDHw1x2ejqwqypCRV3jTtXHNNp0
   liNtAHggezINgb8G/BlvxkFpcTOK686GRGwbeV5D0YQdfwsFFUEmr+JZW
   v6x+M21BiCk7SDNKW7nAGvQq4X6iEc8ZocRHGqBW48gAhPMO5oVTcKR66
   NHTMdt02jgUf3rKkKL4hG5pU/RhY+EQ53KIUQ7BttOZII3F3f0HLlCc9A
   g==;
X-CSE-ConnectionGUID: AwTM+aj8SlesNhE9gFG9Pg==
X-CSE-MsgGUID: MGZFX4VaTbuQafSrAE/mBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26580874"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26580874"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 04:49:29 -0700
X-CSE-ConnectionGUID: IYUre/XuQue4fThiWtO+Uw==
X-CSE-MsgGUID: HEXMj4PxTiSx6GFAdSBN2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="103807456"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2024 04:49:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1susQW-000OFp-2C;
	Sun, 29 Sep 2024 11:49:24 +0000
Date: Sun, 29 Sep 2024 19:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 578/1001]
 drivers/net/ethernet/xilinx/xilinx_axienet.h:1022:9: error: implicit
 declaration of function 'writeq'; did you mean 'writel'?
Message-ID: <202409291949.gCNLUd9B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 0ed3324fdd0d04556bd1e130c4b8ae0f73486a05 [578/1001] net: axienet: added multichannel DMA support
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240929/202409291949.gCNLUd9B-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291949.gCNLUd9B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291949.gCNLUd9B-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:24:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:1022:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
    1022 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writel
   In file included from include/linux/if_ether.h:19,
                    from include/linux/ethtool.h:18,
                    from include/linux/phy.h:16,
                    from include/linux/of_mdio.h:12,
                    from drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:18:
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c: In function 'axienet_mcdma_rx_bd_free':
>> drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:148:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     148 |                 dev_kfree_skb((struct sk_buff *)
         |                               ^
   include/linux/skbuff.h:1381:45: note: in definition of macro 'dev_kfree_skb'
    1381 | #define dev_kfree_skb(a)        consume_skb(a)
         |                                             ^
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c: In function 'axienet_mcdma_rx_q_init':
>> drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:285:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     285 |                 q->rxq_bd_v[i].sw_id_offset = (phys_addr_t)skb;
         |                                               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c: In function 'axienet_mcdma_err_handler':
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:625:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     625 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_main.c:51:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:1022:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
    1022 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writel
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_tx_hwtstamp':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:584:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     584 |                 skb_hwtstamps((struct sk_buff *)cur_p->ptp_tx_skb);
         |                               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:646:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     646 |                 skb_pull((struct sk_buff *)cur_p->ptp_tx_skb,
         |                          ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:649:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     649 |         skb_tstamp_tx((struct sk_buff *)cur_p->ptp_tx_skb, shhwtstamps);
         |                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:650:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     650 |         dev_kfree_skb_any((struct sk_buff *)cur_p->ptp_tx_skb);
         |                           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_start_xmit_done':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:751:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     751 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_skb_tstsmp':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:961:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     961 |                                 cur_p->ptp_tx_skb = (phys_addr_t)skb_get(skb);
         |                                                     ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_queue_xmit':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1065:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1065 |             (((phys_addr_t)skb->data & 0x3) || num_frag > 0)) {
         |               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1117:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1117 |         cur_p->tx_skb = (phys_addr_t)skb;
         |                         ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1118:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1118 |         cur_p->tx_skb = (phys_addr_t)skb;
         |                         ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_recv':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1212:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1212 |                 skb = (struct sk_buff *)(cur_p->sw_id_offset);
         |                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1302:39: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1302 |                 cur_p->sw_id_offset = (phys_addr_t)new_skb;
         |                                       ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c:18:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:1022:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
    1022 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writel
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:17:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:1022:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
    1022 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writel
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/xilinx/xilinx_axienet.h:14:
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c: In function 'axienet_bd_free':
>> drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:37:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      37 |                 dev_kfree_skb((struct sk_buff *)
         |                               ^
   include/linux/skbuff.h:1381:45: note: in definition of macro 'dev_kfree_skb'
    1381 | #define dev_kfree_skb(a)        consume_skb(a)
         |                                             ^
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c: In function '__dma_rxq_init':
>> drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:172:46: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     172 |                 q->rx_bd_v[i].sw_id_offset = (phys_addr_t)skb;
         |                                              ^
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c: In function 'axienet_dma_err_handler':
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:412:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     412 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   cc1: some warnings being treated as errors


vim +1022 drivers/net/ethernet/xilinx/xilinx_axienet.h

  1008	
  1009	/**
  1010	 * axienet_dma_bdout - Memory mapped Axi DMA register Buffer Descriptor write.
  1011	 * @q:		Pointer to DMA queue structure
  1012	 * @reg:	Address offset from the base address of the Axi DMA core
  1013	 * @value:	Value to be written into the Axi DMA register
  1014	 *
  1015	 * This function writes the desired value into the corresponding Axi DMA
  1016	 * register.
  1017	 */
  1018	static inline void axienet_dma_bdout(struct axienet_dma_q *q,
  1019					     off_t reg, dma_addr_t value)
  1020	{
  1021	#if defined(CONFIG_PHYS_ADDR_T_64BIT)
> 1022		writeq(value, (q->dma_regs + reg));
  1023	#else
  1024		writel(value, (q->dma_regs + reg));
  1025	#endif
  1026	}
  1027	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
