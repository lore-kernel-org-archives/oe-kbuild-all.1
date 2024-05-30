Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D4929B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 00:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717027421; cv=none; b=YtMDuaGNo00kyKB40CnGVbarndUcR5iQRCMTcrT03H0kcfK+PjUVCf64KtLQUcpEH8K+E/frkOhYVoyngGXa5DqmWsSmzKtMSpu/A8a8UAMtlXceh0qsgXj5ebZIA+8pTOrjyOltM41Ij0+W9M73q3r2yeZ+zah0JFymu2EjcfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717027421; c=relaxed/simple;
	bh=K7ORdZBmyxtXeyc7v1IbDVKLd0YnaBqF6CaWiFw/Pog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0OA5suqnGZTcbSk/ClF1cMe8LMqoWpVyDxaDFNPf9zkcI9Tv66pboYqnjH2faDhnw2ZqsmwPQuF4+jMSStHoI5oFyr5qd5ydtWEL4TkUfVTi1EHL2WaoZ35u8sbhJP24HQP2SEcohfGWyshJJfkMxHIbPaR4Os1rAtt85FXzBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRN3VY3W; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRN3VY3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717027419; x=1748563419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K7ORdZBmyxtXeyc7v1IbDVKLd0YnaBqF6CaWiFw/Pog=;
  b=aRN3VY3WrJbLjnp6K3zfJAMW++E7xjIWkaRMdWIdm0Z20VUbO11jrB0y
   1Zq5xM//4MeJWpKk1XPmpgD7r+4vodn16krQlo7xBhLFrs/p/MRuOobWY
   GtBEMijXGYCKeeaKJNuwYNDHbTtBg2tQbuDLpwG7yHljq8iYTqRwLk6IR
   cfhPFauzv0C6MPBdF4qx5SvVpuocWi5hFCGT0v4DCb7FIZC2ViAE7spEs
   3pqd6zRSzJCklZc/ldqLY21r8M+d3iUOKs9P3obRMfDQfzd2Rf+d/+46j
   R94Ddby39CDcJf+ORh+q/LtwSLjtTei89irBxQA7zUAtV2X0Nf3ZXA/b9
   Q==;
X-CSE-ConnectionGUID: zp4Stff7Q6erfal7xugoPQ==
X-CSE-MsgGUID: Y6ZRUm3MQ0y/LZApsh0iAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24600143"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24600143"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 17:03:36 -0700
X-CSE-ConnectionGUID: v7TxdimnSBiY8EKu2nho1A==
X-CSE-MsgGUID: G/Ez5x96QNWx2xznPWdnDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="36162448"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2024 17:03:35 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCTGW-000ELh-1Z;
	Thu, 30 May 2024 00:03:32 +0000
Date: Thu, 30 May 2024 08:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6865/9792]
 drivers/net/ethernet/mucse/rnpvf/rnpvf_regs.h:21:26: error: called object is
 not a function or function pointer
Message-ID: <202405300821.FdTsPW2u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c0b6b4438dc70167c4c16f6436499cde257f782a
commit: 6adab536d69347a10c2366aaf6b86de963d5994b [6865/9792] drivers: initial support for rnpvf drivers from Mucse Technology
config: loongarch-randconfig-002-20240530 (https://download.01.org/0day-ci/archive/20240530/202405300821.FdTsPW2u-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300821.FdTsPW2u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300821.FdTsPW2u-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:127:6: warning: no previous prototype for 'rnpvf_unmap_and_free_tx_resource' [-Wmissing-prototypes]
     127 | void rnpvf_unmap_and_free_tx_resource(struct rnpvf_ring *ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1365:6: warning: no previous prototype for 'rnpvf_alloc_rx_buffers' [-Wmissing-prototypes]
    1365 | void rnpvf_alloc_rx_buffers(struct rnpvf_ring *rx_ring, u16 cleaned_count)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: In function 'rnpvf_clean_rx_irq':
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1659:14: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    1659 |         bool xdp_xmit = false;
         |              ^~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: At top level:
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1945:6: warning: no previous prototype for 'update_rx_count' [-Wmissing-prototypes]
    1945 | void update_rx_count(int cleaned, struct rnpvf_q_vector *q_vector)
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2420:6: warning: no previous prototype for 'rnpvf_write_eitr_rx' [-Wmissing-prototypes]
    2420 | void rnpvf_write_eitr_rx(struct rnpvf_q_vector *q_vector)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2523:6: warning: no previous prototype for 'rnpvf_configure_tx_ring' [-Wmissing-prototypes]
    2523 | void rnpvf_configure_tx_ring(struct rnpvf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2589:6: warning: no previous prototype for 'rnpvf_disable_rx_queue' [-Wmissing-prototypes]
    2589 | void rnpvf_disable_rx_queue(struct rnpvf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2595:6: warning: no previous prototype for 'rnpvf_enable_rx_queue' [-Wmissing-prototypes]
    2595 | void rnpvf_enable_rx_queue(struct rnpvf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2601:6: warning: no previous prototype for 'rnpvf_configure_rx_ring' [-Wmissing-prototypes]
    2601 | void rnpvf_configure_rx_ring(struct rnpvf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: In function 'rnpvf_vlan_rx_kill_vid':
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2736:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    2736 |         int err = -EOPNOTSUPP;
         |             ^~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: In function 'rnpvf_acquire_msix_vectors':
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3307:13: warning: variable 'vector_threshold' set but not used [-Wunused-but-set-variable]
    3307 |         int vector_threshold;
         |             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: In function 'irq_miss_check':
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3456:26: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
    3456 |         struct rnpvf_hw *hw;
         |                          ^~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: At top level:
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4590:6: warning: no previous prototype for 'rnpvf_tx_ctxtdesc' [-Wmissing-prototypes]
    4590 | void rnpvf_tx_ctxtdesc(struct rnpvf_ring *tx_ring, u16 mss_seg_len,
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5039:6: warning: no previous prototype for 'rnpvf_maybe_tx_ctxtdesc' [-Wmissing-prototypes]
    5039 | void rnpvf_maybe_tx_ctxtdesc(struct rnpvf_ring *tx_ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5089:13: warning: no previous prototype for 'rnpvf_xmit_frame_ring' [-Wmissing-prototypes]
    5089 | netdev_tx_t rnpvf_xmit_frame_ring(struct sk_buff *skb,
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5580:6: warning: no previous prototype for 'rnpvf_assign_netdev_ops' [-Wmissing-prototypes]
    5580 | void rnpvf_assign_netdev_ops(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/mucse/rnpvf/vf.h:14,
                    from drivers/net/ethernet/mucse/rnpvf/rnpvf.h:14,
                    from drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:26:
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c: In function 'rnpvf_vfnum':
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_regs.h:21:26: error: called object is not a function or function pointer
      21 | #define RNP_DMA_RX_START (0x10)
         |                          ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_regs.h:104:42: note: in definition of macro 'rnpvf_rd_reg'
     104 | #define rnpvf_rd_reg(reg) readl((void *)(reg))
         |                                          ^~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5599:21: note: in expansion of macro 'rd32'
    5599 |                 v = rd32(hw, RNP_DMA_RX_START(ring));
         |                     ^~~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5599:30: note: in expansion of macro 'RNP_DMA_RX_START'
    5599 |                 v = rd32(hw, RNP_DMA_RX_START(ring));
         |                              ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5591:13: warning: unused variable 'pfvfnum_reg' [-Wunused-variable]
    5591 |         u32 pfvfnum_reg;
         |             ^~~~~~~~~~~


vim +21 drivers/net/ethernet/mucse/rnpvf/rnpvf_regs.h

    13	
    14	#define RNP_DMA_RING_BASE 0x8000
    15	#define RNP_DMA_RX_DESC_TIMEOUT_TH 0x8000
    16	#define RNP_DMA_TX_DESC_FETCH_CTL 0x8004
    17	#define RNP_DMA_TX_FLOW_CTRL_TM 0x8008
    18	#define RNP_RING_BASE_N10 (0x8000)
    19	#define RNP_RING_BASE_N500 (0x1000)
    20	#define RNP_RING_OFFSET(i) (0x100 * (i))
  > 21	#define RNP_DMA_RX_START (0x10)
    22	#define RNP_DMA_RX_READY (0x14)
    23	#define RNP_DMA_TX_START (0x18)
    24	#define RNP_DMA_TX_READY (0x1c)
    25	#define RNP_DMA_INT_STAT (0x20)
    26	#define RNP_DMA_INT_MASK (0x24)
    27	#define TX_INT_MASK (0x1 << 1)
    28	#define RX_INT_MASK (0x1 << 0)
    29	#define RNP_DMA_INT_CLR (0x28)
    30	#define RNP_DMA_INT_TRIG (0x2c)
    31	#define RNP_DMA_REG_RX_DESC_BUF_BASE_ADDR_HI (0x30)
    32	#define RNP_DMA_REG_RX_DESC_BUF_BASE_ADDR_LO (0x34)
    33	#define RNP_DMA_REG_RX_DESC_BUF_LEN (0x38)
    34	#define RNP_DMA_REG_RX_DESC_BUF_HEAD (0x3c)
    35	#define RNP_DMA_REG_RX_DESC_BUF_TAIL (0x40)
    36	#define RNP_DMA_REG_RX_DESC_FETCH_CTRL (0x44)
    37	#define RNP_DMA_REG_RX_INT_DELAY_TIMER (0x48)
    38	#define RNP_DMA_REG_RX_INT_DELAY_PKTCNT (0x4c)
    39	#define RNP_DMA_REG_RX_ARB_DEF_LVL (0x50)
    40	#define PCI_DMA_REG_RX_DESC_TIMEOUT_TH (0x54)
    41	#define PCI_DMA_REG_RX_SCATTER_LENGTH (0x58)
    42	#define RNP_DMA_REG_TX_DESC_BUF_BASE_ADDR_HI (0x60)
    43	#define RNP_DMA_REG_TX_DESC_BUF_BASE_ADDR_LO (0x64)
    44	#define RNP_DMA_REG_TX_DESC_BUF_LEN (0x68)
    45	#define RNP_DMA_REG_TX_DESC_BUF_HEAD (0x6c)
    46	#define RNP_DMA_REG_TX_DESC_BUF_TAIL (0x70)
    47	#define RNP_DMA_REG_TX_DESC_FETCH_CTRL (0x74)
    48	#define RNP_DMA_REG_TX_INT_DELAY_TIMER (0x78)
    49	#define RNP_DMA_REG_TX_INT_DELAY_PKTCNT (0x7c)
    50	#define RNP_DMA_REG_TX_ARB_DEF_LVL (0x80)
    51	#define RNP_DMA_REG_TX_FLOW_CTRL_TH (0x84)
    52	#define RNP_DMA_REG_TX_FLOW_CTRL_TM (0x88)
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
