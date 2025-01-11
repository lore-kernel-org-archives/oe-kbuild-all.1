Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E771B6D10
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 20:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736628493; cv=none; b=FGAd/RuZJi/a0wsVXWOf6SYgSD4/MIQDJym2ktKgqrQn5np8cl4GECkE7BcfdsbpJTUTXHRvrtHbywjJwZ9qagIgG/OyoD06bDTztDn54jMbpjnpR91VIcUkVzJwDsIo2BHrWVKIgvysCELiUNWxcP8sA2h2tUaFdwThCzgHpiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736628493; c=relaxed/simple;
	bh=Qg39SVQQ9w3iRX85lYdRhx8Td5BbMvSfPqhPK9YOi9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fXIc70Q0uQOCEM7UsM7Qa0dDxQQUpj+32aCP7KctWmXikZFJpwH1JKagK+02QnNQ7pI0tzUZ0gw4bhq8y2KNuOZ/VjSzTUYAKhcw4SqtjCn9H/yUcdivqmTC1iTsA7+uzbKFmznTuVLACWKCVz/YwR63uNGWfWvNhFsrtjhMotk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLW+BXvO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLW+BXvO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736628491; x=1768164491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qg39SVQQ9w3iRX85lYdRhx8Td5BbMvSfPqhPK9YOi9A=;
  b=SLW+BXvOlDvTQwagDVzVnO8OUX4N6qSE+F2qoaGl419/Cuj1es54AKZH
   I4LQ0V2+gKmR4sLU2J+XRhC7EfhMmc0UYjcFTBE+DyK3NxwmdcnGsbnwm
   zbDPQ3ISgELmDZvMtZdnC1MicLyVXVRVrQU7lg4bhiB2M7WLC181zTCs1
   GBlf7IActMTwI77q64FO8qRmRWMMq3sIJkIgDvMj+k5iKt31lKQRGS1jc
   Y2O0LbRHNeCS6tqRnlCXTZm4bNHuDVaAJb088unvN/e13NxDQPPYioKe6
   dJKydfpwhWSs0WlKLy8XE948L5XTw+i4Z/HtajFPpGOAyZxJsobi3X4Ou
   Q==;
X-CSE-ConnectionGUID: tREdvLM8SMeT2TIfz5KEgQ==
X-CSE-MsgGUID: KG/ftMSvQNScYPD7rSktUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="39712751"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="39712751"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 12:48:08 -0800
X-CSE-ConnectionGUID: tXrKrL6MSCqrmKKHPxDKBw==
X-CSE-MsgGUID: cyQ5FFPETzmtUb9yurkb8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="104223322"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jan 2025 12:48:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWiOq-000LCL-1T;
	Sat, 11 Jan 2025 20:48:04 +0000
Date: Sun, 12 Jan 2025 04:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 478/504]
 drivers/net/ethernet/xilinx/xilinx_axienet.h:1179:9: error: implicit
 declaration of function 'writeq'; did you mean 'writel'?
Message-ID: <202501120449.n5ZjK816-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 8512a3fbb60d8910d671a191f738295edc596a74 [478/504] net: axienet: added multichannel DMA support
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20250112/202501120449.n5ZjK816-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120449.n5ZjK816-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120449.n5ZjK816-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:25:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:1179:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
    1179 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writel
   In file included from include/linux/if_ether.h:19,
                    from include/linux/ethtool.h:18,
                    from include/linux/phy.h:16,
                    from include/linux/of_mdio.h:12,
                    from drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:18:
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c: In function 'axienet_mcdma_rx_bd_free':
>> drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:151:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     151 |                 dev_kfree_skb((struct sk_buff *)
         |                               ^
   include/linux/skbuff.h:1417:45: note: in definition of macro 'dev_kfree_skb'
    1417 | #define dev_kfree_skb(a)        consume_skb(a)
         |                                             ^
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c: In function 'axienet_mcdma_rx_q_init':
>> drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:288:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     288 |                 q->rxq_bd_v[i].sw_id_offset = (phys_addr_t)skb;
         |                                               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c: In function 'axienet_mcdma_err_handler':
   drivers/net/ethernet/xilinx/xilinx_axienet_mcdma.c:640:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     640 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_main.c:55:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:1179:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
    1179 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writel
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_tx_hwtstamp':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:783:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     783 |                 skb_hwtstamps((struct sk_buff *)cur_p->ptp_tx_skb);
         |                               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:845:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     845 |                 skb_pull((struct sk_buff *)cur_p->ptp_tx_skb,
         |                          ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:848:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     848 |         skb_tstamp_tx((struct sk_buff *)cur_p->ptp_tx_skb, shhwtstamps);
         |                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:849:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     849 |         dev_kfree_skb_any((struct sk_buff *)cur_p->ptp_tx_skb);
         |                           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_free_tx_chain':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:967:42: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     967 |                         napi_consume_skb((struct sk_buff *)cur_p->tx_skb, budget);
         |                                          ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_skb_tstsmp':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1347:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1347 |                                 cur_p->ptp_tx_skb = (phys_addr_t)skb_get(skb);
         |                                                     ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_queue_xmit':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1451:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1451 |             (((phys_addr_t)skb->data & 0x3) || num_frag > 0)) {
         |               ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1521:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1521 |         cur_p->tx_skb = (phys_addr_t)skb;
         |                         ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_recv':
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1654:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1654 |                 skb = (struct sk_buff *)(cur_p->sw_id_offset);
         |                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1754:39: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1754 |                 cur_p->sw_id_offset = (phys_addr_t)new_skb;
         |                                       ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_poll_controller':
   drivers/net/ethernet/xilinx/xilinx_axienet.h:41:9: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
      41 |         for ((var) = 0; (var) < (lp)->num_rx_queues; (var)++)
         |         ^~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2316:9: note: in expansion of macro 'for_each_rx_dma_queue'
    2316 |         for_each_rx_dma_queue(lp, i)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2319:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'for'
    2319 |                 axienet_mcdma_tx_irq(lp->dq[i]->tx_irq, ndev);
         |                 ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c:18:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:1179:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
    1179 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writel
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:17:
   drivers/net/ethernet/xilinx/xilinx_axienet.h: In function 'axienet_dma_bdout':
>> drivers/net/ethernet/xilinx/xilinx_axienet.h:1179:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
    1179 |         writeq(value, (q->dma_regs + reg));
         |         ^~~~~~
         |         writel
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/xilinx/xilinx_axienet.h:13:
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c: In function 'axienet_bd_free':
>> drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:39:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      39 |                 dev_kfree_skb((struct sk_buff *)
         |                               ^
   include/linux/skbuff.h:1417:45: note: in definition of macro 'dev_kfree_skb'
    1417 | #define dev_kfree_skb(a)        consume_skb(a)
         |                                             ^
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c: In function '__dma_rxq_init':
>> drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:155:46: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     155 |                 q->rx_bd_v[i].sw_id_offset = (phys_addr_t)skb;
         |                                              ^
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c: In function 'axienet_dma_err_handler':
   drivers/net/ethernet/xilinx/xilinx_axienet_dma.c:388:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     388 |                         dev_kfree_skb_irq((struct sk_buff *)cur_p->tx_skb);
         |                                           ^
   cc1: some warnings being treated as errors


vim +1179 drivers/net/ethernet/xilinx/xilinx_axienet.h

  1165	
  1166	/**
  1167	 * axienet_dma_bdout - Memory mapped Axi DMA register Buffer Descriptor write.
  1168	 * @q:		Pointer to DMA queue structure
  1169	 * @reg:	Address offset from the base address of the Axi DMA core
  1170	 * @value:	Value to be written into the Axi DMA register
  1171	 *
  1172	 * This function writes the desired value into the corresponding Axi DMA
  1173	 * register.
  1174	 */
  1175	static inline void axienet_dma_bdout(struct axienet_dma_q *q,
  1176					     off_t reg, dma_addr_t value)
  1177	{
  1178	#if defined(CONFIG_PHYS_ADDR_T_64BIT)
> 1179		writeq(value, (q->dma_regs + reg));
  1180	#else
  1181		writel(value, (q->dma_regs + reg));
  1182	#endif
  1183	}
  1184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
