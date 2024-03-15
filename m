Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C93045970
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710517468; cv=none; b=ldQZnPhHhCHlvyNsycGPinK24hfvOFo9Lgt1BLTp4MYDoa2RML5PiIHje1a+pZjsUHR5rpqIiMCVDvnMmbTJUZpIuSsYNStPc3BhlRBWWt6jdtlbT3NOK4Rbhk82rdV5GeatBaq54FHK6u7S2w3BoDBnYUjroLWI6NGGAYEEJsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710517468; c=relaxed/simple;
	bh=0Jk7SaTZsslGmLS1G/tiFhmDTflku5t/2oI9lFxGM8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h8I3hB7CFMcBr5sL333UIi4VCiUEz/M/fb09DMHpA0ycGJltGXwbgYLD24FvsfU4drNbWhrz8tgIfFfTZWcOnbPwHB4qYoA4EK39WYkp3dqj+FQUMFSjUCykBfLOUBJIUgnA+6DUM7Nfval7CA12Wmkd5wUeED41QInrSaM/PF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6Wy8AUn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6Wy8AUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710517467; x=1742053467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Jk7SaTZsslGmLS1G/tiFhmDTflku5t/2oI9lFxGM8s=;
  b=U6Wy8AUnMDBF10izzrQWmtf0wAg7+QUhMVWW8/r9hmTM7AP1xb8cFj5b
   uUSnDzNBqJV6I0ro4sityqMDyV4W7NfK8Tdq3T7eK/+SS3ofS45ehkKec
   FbGCTzY6QXjtHPhqu4RMKR6FDtY+9uvaWYaU50DfOW4llIVxRZGWQ/4Qe
   JenR/1EPJjOfCBhc7d9GWhFxVGNjV/bj+088bMEnFKfT1AaHCmsr7jg0b
   FH7QYhhDevVrqzd+v6ZHrYnUV0C+qKxnmHEvYtBzD/+ubkhC1OC/8HJWP
   pJwFt9IF3DjnZs9wBFwCg8KYX9dFxuloDVgX8vdqNcxDFnWGzazjsO6et
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5261099"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5261099"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 08:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="17324372"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2024 08:44:15 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl9jA-000EYj-0m;
	Fri, 15 Mar 2024 15:44:12 +0000
Date: Fri, 15 Mar 2024 23:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yusur <opensource-dev@yusur.tech>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29991/30000]
 drivers/net/ethernet/yusur/k2/ys_k2_tx.c:137:18: warning: variable
 'clean_tail_ptr' set but not used
Message-ID: <202403152311.T6JFVh2t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   32bb7b0a7c87769858fbb9d60574b830383c28f7
commit: c92533ad657c0a5d1a7a6355ef2c357cbb91d5c0 [29991/30000] drivers: initial support for KPU FLEXFLOW-2100P driver from Yusur Technology
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240315/202403152311.T6JFVh2t-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403152311.T6JFVh2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403152311.T6JFVh2t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/yusur/k2/ys_k2_tx.c:137:18: warning: variable 'clean_tail_ptr' set but not used [-Wunused-but-set-variable]
     137 |         u32 desc_index, clean_tail_ptr;
         |                         ^
   1 warning generated.
--
>> drivers/net/ethernet/yusur/k2/../platform/ys_intr.c:113:40: warning: overlapping comparisons always evaluate to false [-Wtautological-overlap-compare]
     113 |         if (sub->irq_type < YS_IRQ_TYPE_QUEUE &&
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
     114 |             sub->irq_type > YS_IRQ_TYPE_HW_PRIVATE) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/clean_tail_ptr +137 drivers/net/ethernet/yusur/k2/ys_k2_tx.c

   130	
   131	netdev_tx_t ysk2_start_xmit(struct sk_buff *skb, struct net_device *ndev)
   132	{
   133		struct ys_ndev_priv *ndev_priv = netdev_priv(ndev);
   134		struct skb_shared_info *shinfo = skb_shinfo(skb);
   135		struct ysk2_port *k2port = ndev_priv->adp_priv;
   136		struct ysk2_desc_ring *tx_ring;
 > 137		u32 desc_index, clean_tail_ptr;
   138		struct ysk2_tx_info *tx_info;
   139		struct ysk2_desc *tx_desc;
   140		bool stop_queue;
   141		u16 txq_index;
   142	
   143		if (unlikely(!(ndev->flags & IFF_UP)))
   144			goto tx_drop;
   145	
   146		txq_index = skb_get_queue_mapping(skb);
   147		tx_ring = k2port->qps[txq_index].tx_ring;
   148	
   149		clean_tail_ptr = READ_ONCE(tx_ring->ring.clean_tail_ptr);
   150	
   151		desc_index = tx_ring->ring.head_ptr & tx_ring->ring.size_mask;
   152	
   153		tx_desc = (struct ysk2_desc *)(tx_ring->ring.buf +
   154					       desc_index * tx_ring->ring.stride);
   155	
   156		tx_info = &tx_ring->tx_info[desc_index];
   157	
   158		/* too many frags or very short data portion; linearize */
   159		if (shinfo->nr_frags > tx_ring->tx_max_sg_frags ||
   160		    (skb->data_len && skb->data_len < 32)) {
   161			if (skb_linearize(skb))
   162				goto tx_drop_count;
   163		}
   164	
   165		/* Refresh the cache through streaming mapping */
   166		if (ysk2_map_skb(&tx_ring->ring, tx_info, tx_desc, skb))
   167			goto tx_drop_count;
   168	
   169		/* count packet */
   170		tx_ring->packets++;
   171		tx_ring->bytes += skb->len;
   172	
   173		/* enqueue */
   174		tx_ring->ring.head_ptr++;
   175	
   176		skb_tx_timestamp(skb);
   177	
   178		/* if the tx_ring is full now, stop the tx queue */
   179		stop_queue = ysk2_is_ring_full(&tx_ring->ring);
   180		if (unlikely(stop_queue)) {
   181			ys_net_debug("TX ring %d full\n", txq_index);
   182			netif_tx_stop_queue(tx_ring->tx_queue);
   183		}
   184	
   185		/* enqueue on NIC */
   186		if (unlikely(!netdev_xmit_more() || stop_queue))
   187			ysk2_write_head_ptr(&tx_ring->ring);
   188	
   189		/* check if queue restarted */
   190		if (unlikely(stop_queue)) {
   191			clean_tail_ptr = READ_ONCE(tx_ring->ring.clean_tail_ptr);
   192	
   193			if (unlikely(!ysk2_is_ring_full(&tx_ring->ring)))
   194				netif_tx_wake_queue(tx_ring->tx_queue);
   195		}
   196	
   197		return NETDEV_TX_OK;
   198	
   199	tx_drop_count:
   200		tx_ring->dropped_packets++;
   201	tx_drop:
   202		dev_kfree_skb_any(skb);
   203		return NETDEV_TX_OK;
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
