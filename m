Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E8F1527B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 10:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740651569; cv=none; b=tjEXW6ZQr6ZI1mPgUFUPxEMwjdckKndGABG4fViw3NkcMwNod7aytZ2hkZsMDwzNs85uJVBVO9UfWpQxf5dPjyqOi0aL47O1/oJqir0+AtpTdYGAVvI1fHa64U8btlE8+bfGIWM9CUUUzE6PtjaC7XgN6AvonhYZZJa/vyBkACw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740651569; c=relaxed/simple;
	bh=FsYdncnZHjVa/+qd17FMkau2pHh1dmBSB7aCuHe5V8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bElbCmVjZWr8EgqUnqFupLjMnGgysVHLux0s5RS99o7GVTrd7I6W/JZyg1eD19nApwVV3tvjS1PWJNeEgmTRzMRKOgQlkWdSsPxzjquASHyARRRh8OAwkYBuFdxUoofPhV0PL+9eOzSuB3E+G1E+KcvDeT7GvVPjSO9E0/TWze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAmZ9Zm9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAmZ9Zm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740651568; x=1772187568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FsYdncnZHjVa/+qd17FMkau2pHh1dmBSB7aCuHe5V8s=;
  b=eAmZ9Zm9DGdCrTMRyCLKpDskPpHAeGsGlkWLjWw8grJ3RwOYyGE2ovfo
   PyBAdXBuy+K0Qj3U7DKjA9Ai85K6BsL91r41Awj36SfHTGlz2Xz8vWjbY
   EFBut8hK3vy+9h1/9zlWs7Rz457B0/8H4NY5A2v6OIbkGB6R1c6+oZctZ
   xnRBUU7vESjRAdqVXUhUDxs7aVVOtvseKexNCpGYxDTa0AwrX/YQ07Iy1
   duMWp9FiK1BCIptsnhTJAmN7TXo9MVL69R8qEuNsx+0uO7bZqZQxTTaJ0
   XT4YU9l1JOZ4AnH42u8pqtEK5EJGVdJG3UWRaJATMYNVf4vH6DFVS+AlV
   g==;
X-CSE-ConnectionGUID: +pisd+RTQH+axLELcTvqfw==
X-CSE-MsgGUID: NOt81gvHRQicX+5wUhXE4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="40710921"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="40710921"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 02:19:28 -0800
X-CSE-ConnectionGUID: JUHrNNsCQuOIIsPfYPxiiQ==
X-CSE-MsgGUID: /fCo63JIRx2OgRan/zLoHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117623798"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Feb 2025 02:19:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnazD-000DD8-2U;
	Thu, 27 Feb 2025 10:19:23 +0000
Date: Thu, 27 Feb 2025 18:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [linux-next:master 4587/6583]
 drivers/net/ethernet/wangxun/libwx/wx_lib.c:754: undefined reference to
 `ptp_schedule_worker'
Message-ID: <202502271823.AtVuucky-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: 06e75161b9d4833518a7c266310a0635eab50616 [4587/6583] net: wangxun: Add support for PTP clock
config: x86_64-randconfig-121-20250226 (https://download.01.org/0day-ci/archive/20250227/202502271823.AtVuucky-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271823.AtVuucky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271823.AtVuucky-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/wangxun/libwx/wx_lib.o: in function `wx_clean_tx_irq':
>> drivers/net/ethernet/wangxun/libwx/wx_lib.c:754: undefined reference to `ptp_schedule_worker'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_create_clock':
>> drivers/net/ethernet/wangxun/libwx/wx_ptp.c:251: undefined reference to `ptp_clock_register'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_stop':
>> drivers/net/ethernet/wangxun/libwx/wx_ptp.c:536: undefined reference to `ptp_clock_unregister'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LIBWX
   Depends on [m]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PTP_1588_CLOCK_OPTIONAL [=m]
   Selected by [y]:
   - NGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]


vim +754 drivers/net/ethernet/wangxun/libwx/wx_lib.c

   706	
   707	/**
   708	 * wx_clean_tx_irq - Reclaim resources after transmit completes
   709	 * @q_vector: structure containing interrupt and ring information
   710	 * @tx_ring: tx ring to clean
   711	 * @napi_budget: Used to determine if we are in netpoll
   712	 **/
   713	static bool wx_clean_tx_irq(struct wx_q_vector *q_vector,
   714				    struct wx_ring *tx_ring, int napi_budget)
   715	{
   716		unsigned int budget = q_vector->wx->tx_work_limit;
   717		unsigned int total_bytes = 0, total_packets = 0;
   718		struct wx *wx = netdev_priv(tx_ring->netdev);
   719		unsigned int i = tx_ring->next_to_clean;
   720		struct wx_tx_buffer *tx_buffer;
   721		union wx_tx_desc *tx_desc;
   722	
   723		if (!netif_carrier_ok(tx_ring->netdev))
   724			return true;
   725	
   726		tx_buffer = &tx_ring->tx_buffer_info[i];
   727		tx_desc = WX_TX_DESC(tx_ring, i);
   728		i -= tx_ring->count;
   729	
   730		do {
   731			union wx_tx_desc *eop_desc = tx_buffer->next_to_watch;
   732	
   733			/* if next_to_watch is not set then there is no work pending */
   734			if (!eop_desc)
   735				break;
   736	
   737			/* prevent any other reads prior to eop_desc */
   738			smp_rmb();
   739	
   740			/* if DD is not set pending work has not been completed */
   741			if (!(eop_desc->wb.status & cpu_to_le32(WX_TXD_STAT_DD)))
   742				break;
   743	
   744			/* clear next_to_watch to prevent false hangs */
   745			tx_buffer->next_to_watch = NULL;
   746	
   747			/* update the statistics for this packet */
   748			total_bytes += tx_buffer->bytecount;
   749			total_packets += tx_buffer->gso_segs;
   750	
   751			/* schedule check for Tx timestamp */
   752			if (unlikely(test_bit(WX_STATE_PTP_TX_IN_PROGRESS, wx->state)) &&
   753			    skb_shinfo(tx_buffer->skb)->tx_flags & SKBTX_IN_PROGRESS)
 > 754				ptp_schedule_worker(wx->ptp_clock, 0);
   755	
   756			/* free the skb */
   757			napi_consume_skb(tx_buffer->skb, napi_budget);
   758	
   759			/* unmap skb header data */
   760			dma_unmap_single(tx_ring->dev,
   761					 dma_unmap_addr(tx_buffer, dma),
   762					 dma_unmap_len(tx_buffer, len),
   763					 DMA_TO_DEVICE);
   764	
   765			/* clear tx_buffer data */
   766			dma_unmap_len_set(tx_buffer, len, 0);
   767	
   768			/* unmap remaining buffers */
   769			while (tx_desc != eop_desc) {
   770				tx_buffer++;
   771				tx_desc++;
   772				i++;
   773				if (unlikely(!i)) {
   774					i -= tx_ring->count;
   775					tx_buffer = tx_ring->tx_buffer_info;
   776					tx_desc = WX_TX_DESC(tx_ring, 0);
   777				}
   778	
   779				/* unmap any remaining paged data */
   780				if (dma_unmap_len(tx_buffer, len)) {
   781					dma_unmap_page(tx_ring->dev,
   782						       dma_unmap_addr(tx_buffer, dma),
   783						       dma_unmap_len(tx_buffer, len),
   784						       DMA_TO_DEVICE);
   785					dma_unmap_len_set(tx_buffer, len, 0);
   786				}
   787			}
   788	
   789			/* move us one more past the eop_desc for start of next pkt */
   790			tx_buffer++;
   791			tx_desc++;
   792			i++;
   793			if (unlikely(!i)) {
   794				i -= tx_ring->count;
   795				tx_buffer = tx_ring->tx_buffer_info;
   796				tx_desc = WX_TX_DESC(tx_ring, 0);
   797			}
   798	
   799			/* issue prefetch for next Tx descriptor */
   800			prefetch(tx_desc);
   801	
   802			/* update budget accounting */
   803			budget--;
   804		} while (likely(budget));
   805	
   806		i += tx_ring->count;
   807		tx_ring->next_to_clean = i;
   808		u64_stats_update_begin(&tx_ring->syncp);
   809		tx_ring->stats.bytes += total_bytes;
   810		tx_ring->stats.packets += total_packets;
   811		u64_stats_update_end(&tx_ring->syncp);
   812		q_vector->tx.total_bytes += total_bytes;
   813		q_vector->tx.total_packets += total_packets;
   814	
   815		netdev_tx_completed_queue(wx_txring_txq(tx_ring),
   816					  total_packets, total_bytes);
   817	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
