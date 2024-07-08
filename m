Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCEE7D07E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 19:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720465941; cv=none; b=B649xIUKCIowzBd3rdX8w6xmj0X+WH2E6YaqokFIbnl3g9x+e6Gi6V+90JaZs+8ZVEn9U7+irOc3q6DUhl06PZ/rK7RdLedpLJNNwG+Y06xotOnEMk2mgg7vms2xJetOoAX6oRUJyXXcb6v72xteMl6/y3vniXSSbmaUcEsBC34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720465941; c=relaxed/simple;
	bh=bjjlqBOyPrYXn5VzZFblEa316mfHRPLUCX6tG0DkOA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jkLZCPfnZHWWzevFlRy02fYaPiVEZmsKlxyu/gTYLUuzhm4ouqe6aJ3yVfT91O8x7zD0DIr6N/jigroiTid2ZAENkXIBg9LksdzqPWPHJJ3XnThKptIGSOUADgUTZzsX3g8D5PSnXdHyUrdWWNFDA+emWxwuBcIVU6ZPG1Ls38k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0AQEK1b; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0AQEK1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720465939; x=1752001939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bjjlqBOyPrYXn5VzZFblEa316mfHRPLUCX6tG0DkOA0=;
  b=T0AQEK1b3lmdBvRrQThQhGt7YIv5w2JBJwrwIwWYktMNhivp3tX4yks/
   zP4OWW/pwB7Cm56/Rbbgov4e55pmCzKABfg+TyHwZmAlc5eHJUnbJDF6l
   iDaFrAUdcN81jMuajKUbDlIDJXy8sB6nWpfaxsX0VUmXHDrFO94SaY1HG
   DRYf46YUAwLm3qdSu7j+rZmWvQ2NCed/UzbLWn/7t22iTtXehtDS5W+zv
   Cb2a3sHuaq5bsuKVVQ1LpSgjFx1BfK6PdtAZCVcBDG0E/AWYsS7/A1l00
   UVh1mN0d/wYRTC4cmz6ObRe8ntPz3gf30OI9o4i/y27Zqiy83qK7EvFQg
   Q==;
X-CSE-ConnectionGUID: WARDaa+KR+SGBPlCridguA==
X-CSE-MsgGUID: dOj0RXztQ2Cxplhdk+F2Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17393316"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="17393316"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 12:12:18 -0700
X-CSE-ConnectionGUID: K+HO7VCDSNWeCp0n9lgVbg==
X-CSE-MsgGUID: 53kSmEtdT9Cf1tffXspssg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="52538935"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jul 2024 12:12:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQtmX-000VyQ-2n;
	Mon, 08 Jul 2024 19:12:13 +0000
Date: Tue, 9 Jul 2024 03:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 6865/10605]
 drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5599:32: error: called object
 type 'int' is not a function or function pointer
Message-ID: <202407090326.YKEPYjUd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0dba2ca16050e1ea7b068850b6fa440dbeb6665b
commit: 6adab536d69347a10c2366aaf6b86de963d5994b [6865/10605] drivers: initial support for rnpvf drivers from Mucse Technology
config: arm64-randconfig-002-20240709 (https://download.01.org/0day-ci/archive/20240709/202407090326.YKEPYjUd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090326.YKEPYjUd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407090326.YKEPYjUd-lkp@intel.com/

All errors (new ones prefixed by >>):

         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:127:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     127 | void rnpvf_unmap_and_free_tx_resource(struct rnpvf_ring *ring,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1365:6: warning: no previous prototype for function 'rnpvf_alloc_rx_buffers' [-Wmissing-prototypes]
    1365 | void rnpvf_alloc_rx_buffers(struct rnpvf_ring *rx_ring, u16 cleaned_count)
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1365:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1365 | void rnpvf_alloc_rx_buffers(struct rnpvf_ring *rx_ring, u16 cleaned_count)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1659:7: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    1659 |         bool xdp_xmit = false;
         |              ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1945:6: warning: no previous prototype for function 'update_rx_count' [-Wmissing-prototypes]
    1945 | void update_rx_count(int cleaned, struct rnpvf_q_vector *q_vector)
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:1945:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1945 | void update_rx_count(int cleaned, struct rnpvf_q_vector *q_vector)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2420:6: warning: no previous prototype for function 'rnpvf_write_eitr_rx' [-Wmissing-prototypes]
    2420 | void rnpvf_write_eitr_rx(struct rnpvf_q_vector *q_vector)
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2420:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2420 | void rnpvf_write_eitr_rx(struct rnpvf_q_vector *q_vector)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2523:6: warning: no previous prototype for function 'rnpvf_configure_tx_ring' [-Wmissing-prototypes]
    2523 | void rnpvf_configure_tx_ring(struct rnpvf_adapter *adapter,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2523:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2523 | void rnpvf_configure_tx_ring(struct rnpvf_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2589:6: warning: no previous prototype for function 'rnpvf_disable_rx_queue' [-Wmissing-prototypes]
    2589 | void rnpvf_disable_rx_queue(struct rnpvf_adapter *adapter,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2589:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2589 | void rnpvf_disable_rx_queue(struct rnpvf_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2595:6: warning: no previous prototype for function 'rnpvf_enable_rx_queue' [-Wmissing-prototypes]
    2595 | void rnpvf_enable_rx_queue(struct rnpvf_adapter *adapter,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2595:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2595 | void rnpvf_enable_rx_queue(struct rnpvf_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2601:6: warning: no previous prototype for function 'rnpvf_configure_rx_ring' [-Wmissing-prototypes]
    2601 | void rnpvf_configure_rx_ring(struct rnpvf_adapter *adapter,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2601:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2601 | void rnpvf_configure_rx_ring(struct rnpvf_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:2736:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    2736 |         int err = -EOPNOTSUPP;
         |             ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3307:6: warning: variable 'vector_threshold' set but not used [-Wunused-but-set-variable]
    3307 |         int vector_threshold;
         |             ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:3456:19: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
    3456 |         struct rnpvf_hw *hw;
         |                          ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4590:6: warning: no previous prototype for function 'rnpvf_tx_ctxtdesc' [-Wmissing-prototypes]
    4590 | void rnpvf_tx_ctxtdesc(struct rnpvf_ring *tx_ring, u16 mss_seg_len,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:4590:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4590 | void rnpvf_tx_ctxtdesc(struct rnpvf_ring *tx_ring, u16 mss_seg_len,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5039:6: warning: no previous prototype for function 'rnpvf_maybe_tx_ctxtdesc' [-Wmissing-prototypes]
    5039 | void rnpvf_maybe_tx_ctxtdesc(struct rnpvf_ring *tx_ring,
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5039:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5039 | void rnpvf_maybe_tx_ctxtdesc(struct rnpvf_ring *tx_ring,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5089:13: warning: no previous prototype for function 'rnpvf_xmit_frame_ring' [-Wmissing-prototypes]
    5089 | netdev_tx_t rnpvf_xmit_frame_ring(struct sk_buff *skb,
         |             ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5089:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5089 | netdev_tx_t rnpvf_xmit_frame_ring(struct sk_buff *skb,
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5484:6: warning: variable 'ring_csum_err' set but not used [-Wunused-but-set-variable]
    5484 |         u64 ring_csum_err = 0;
         |             ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5485:6: warning: variable 'ring_csum_good' set but not used [-Wunused-but-set-variable]
    5485 |         u64 ring_csum_good = 0;
         |             ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5580:6: warning: no previous prototype for function 'rnpvf_assign_netdev_ops' [-Wmissing-prototypes]
    5580 | void rnpvf_assign_netdev_ops(struct net_device *dev)
         |      ^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5580 | void rnpvf_assign_netdev_ops(struct net_device *dev)
         | ^
         | static 
>> drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c:5599:32: error: called object type 'int' is not a function or function pointer
    5599 |                 v = rd32(hw, RNP_DMA_RX_START(ring));
         |                              ~~~~~~~~~~~~~~~~^
   drivers/net/ethernet/mucse/rnpvf/rnpvf_regs.h:116:53: note: expanded from macro 'rd32'
     116 | #define rd32(hw, off) rnpvf_rd_reg((hw)->hw_addr + (off))
         |                                                     ^~~
   drivers/net/ethernet/mucse/rnpvf/rnpvf_regs.h:104:42: note: expanded from macro 'rnpvf_rd_reg'
     104 | #define rnpvf_rd_reg(reg) readl((void *)(reg))
         |                                          ^~~
   18 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/int +5599 drivers/net/ethernet/mucse/rnpvf/rnpvf_main.c

  5587	
  5588	static u8 rnpvf_vfnum(struct rnpvf_hw *hw)
  5589	{
  5590		u16 vf_num = -1;
  5591		u32 pfvfnum_reg;
  5592	
  5593	#if CONFIG_BAR4_PFVFNUM
  5594		int ring, v;
  5595		u16 func = 0;
  5596	
  5597		func = ((hw->pdev->devfn & 0x1) ? 1 : 0);
  5598		for (ring = 0; ring < 128; ring += 2) {
> 5599			v = rd32(hw, RNP_DMA_RX_START(ring));
  5600			if ((v & 0xFFFF) == hw->pdev->vendor) {
  5601				continue;
  5602			} else {
  5603				vf_num = (1 << 7) /*vf-active*/ |
  5604					 (func << 6) /*pf*/ | (ring / 2) /*vfnum*/;
  5605				break;
  5606			}
  5607		}
  5608		return vf_num;
  5609	#else
  5610		pfvfnum_reg =
  5611			(VF_NUM_REG_N10 & (pci_resource_len(hw->pdev, 0) - 1));
  5612		vf_num = readl(hw->hw_addr_bar0 + pfvfnum_reg);
  5613	#define VF_NUM_MASK_TEMP (0xff0)
  5614	#define VF_NUM_OFF (4)
  5615		return ((vf_num & VF_NUM_MASK_TEMP) >> VF_NUM_OFF);
  5616	#endif
  5617	}
  5618	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
