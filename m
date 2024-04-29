Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10E420309
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714382017; cv=none; b=bCdYXD3Jp70cfVP6y9h2c1SYL3e9IVcRx0Z+15DqDsWDab9V50jipbulSLqLQ9m3ByQuSDuuM1VDVlJjY8Zp/qX+zMP1+MaaPh+bRrLerCyuhJ66JGtueyDjfovWqcih2uzEUmq9uUwh6UxPq9jpg+XnruRnNuz6iu1ZRz3S+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714382017; c=relaxed/simple;
	bh=kz0M/fL7DXs2wGEDtKtaJRK1qI4jQFHolMzsQPr6AHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yn8zMA4iQtptot4SSxMJ6PjP6zD17lEpFALqFRiwPbos/icwZfTPK+b4hgngkxGgCpVuFWCmWYKZbyVWdYA2oJKO4tIM0K20119YJEVsPFhTYodiedwIGCTGDB1NbiN7NItIu0uTTBbVFgHSkEPGDdHo4mwA0EV6W9rZgYJG7dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGx7tvbe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGx7tvbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714382016; x=1745918016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kz0M/fL7DXs2wGEDtKtaJRK1qI4jQFHolMzsQPr6AHg=;
  b=DGx7tvbe0i5wWFBSVH4O6Wes4PYxOwHVAzLo+aB/iaQB+BHu5/DTRgcK
   4/BApgV8LlfOHIkECCiHLT8C5VOFNbI0i6LRzNgLaje//Xw12r8TxecJp
   FomuipmEpXsa8d1Ief9aSdQk6yJIjdzgh/wGxqgGD14Hp0LTQw76l2zH9
   ITkzU/Tz5SsECggUpj0NdOmnVtVLF3wvLb4WZ3YNvlcxzHIAntv6bzN1t
   AJHCUl6fFlvKz+miZCGqiZ4XhCbF6vQMOyp65io4NnkbgAeFbS7BdaqGb
   KK/iqx+VF2kxFQy97CJr4XIUJ0DOARk3Pvzh2nwbZ/1mmeSmSaqTjh7It
   A==;
X-CSE-ConnectionGUID: jmXm5W9JS1uYVB8IWO0tNA==
X-CSE-MsgGUID: Vs0eUPbGR4ynp0bomdk/cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9896152"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9896152"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 02:13:36 -0700
X-CSE-ConnectionGUID: 3Hr+4Ke+Tqag0w7vIJ55Og==
X-CSE-MsgGUID: TtdjpzcTROuP7TJ3jUQbcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30875974"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Apr 2024 02:13:34 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1N4l-00074k-2J;
	Mon, 29 Apr 2024 09:13:31 +0000
Date: Mon, 29 Apr 2024 17:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 15300/29983]
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:1760:8: warning: variable
 'page' is uninitialized when used here
Message-ID: <202404291756.UBVvTVpw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert-Ionut,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: e77a60fab247a73efed4e5e22fc4820e1c936dd5 [15300/29983] net: dpaa2: AF_XDP RX zero copy support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240429/202404291756.UBVvTVpw-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291756.UBVvTVpw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291756.UBVvTVpw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:1760:8: warning: variable 'page' is uninitialized when used here [-Wuninitialized]
    1760 |                                                  page, DPAA2_ETH_RX_BUF_RAW_SIZE,
         |                                                  ^~~~
   drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:1706:19: note: initialize the variable 'page' to silence this warning
    1706 |         struct page *page;
         |                          ^
         |                           = NULL
   1 warning generated.


vim +/page +1760 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c

  1695	
  1696	/* Perform a single release command to add buffers
  1697	 * to the specified buffer pool
  1698	 */
  1699	static int dpaa2_eth_add_bufs(struct dpaa2_eth_priv *priv,
  1700				      struct dpaa2_eth_channel *ch)
  1701	{
  1702		struct xdp_buff *xdp_buffs[DPAA2_ETH_BUFS_PER_CMD];
  1703		struct device *dev = priv->net_dev->dev.parent;
  1704		u64 buf_array[DPAA2_ETH_BUFS_PER_CMD];
  1705		struct dpaa2_eth_swa *swa;
  1706		struct page *page;
  1707		dma_addr_t addr;
  1708		int retries = 0;
  1709		int i = 0, err;
  1710		u32 batch;
  1711	
  1712		/* Allocate buffers visible to WRIOP */
  1713		if (!ch->xsk_zc) {
  1714			for (i = 0; i < DPAA2_ETH_BUFS_PER_CMD; i++) {
  1715				/* Also allocate skb shared info and alignment padding */
  1716				/* There is one page for each Rx buffer. WRIOP sees
  1717				 * the entire page except for a tailroom reserved for
  1718				 * skb shared info
  1719				 */
  1720				page = dev_alloc_pages(0);
  1721				if (!page)
  1722					goto err_alloc;
  1723	
  1724				addr = dma_map_page(dev, page, 0, priv->rx_buf_size,
  1725						    DMA_BIDIRECTIONAL);
  1726				if (unlikely(dma_mapping_error(dev, addr)))
  1727					goto err_map;
  1728	
  1729				buf_array[i] = addr;
  1730	
  1731				/* tracing point */
  1732				trace_dpaa2_eth_buf_seed(priv->net_dev,
  1733							 page, DPAA2_ETH_RX_BUF_RAW_SIZE,
  1734							 addr, priv->rx_buf_size,
  1735							 ch->bp->bpid);
  1736			}
  1737		} else if (xsk_buff_can_alloc(ch->xsk_pool, DPAA2_ETH_BUFS_PER_CMD)) {
  1738			/* Allocate XSK buffers for AF_XDP fast path in batches
  1739			 * of DPAA2_ETH_BUFS_PER_CMD. Bail out if the UMEM cannot
  1740			 * provide enough buffers at the moment
  1741			 */
  1742			batch = xsk_buff_alloc_batch(ch->xsk_pool, xdp_buffs,
  1743						     DPAA2_ETH_BUFS_PER_CMD);
  1744			if (!batch)
  1745				goto err_alloc;
  1746	
  1747			for (i = 0; i < batch; i++) {
  1748				swa = (struct dpaa2_eth_swa *)(xdp_buffs[i]->data_hard_start +
  1749							       DPAA2_ETH_RX_HWA_SIZE);
  1750				swa->xsk.xdp_buff = xdp_buffs[i];
  1751	
  1752				addr = xsk_buff_xdp_get_frame_dma(xdp_buffs[i]);
  1753				if (unlikely(dma_mapping_error(dev, addr)))
  1754					goto err_map;
  1755	
  1756				buf_array[i] = addr;
  1757	
  1758				/* tracing point */
  1759				trace_dpaa2_xsk_buf_seed(priv->net_dev,
> 1760							 page, DPAA2_ETH_RX_BUF_RAW_SIZE,
  1761							 addr, priv->rx_buf_size,
  1762							 ch->bp->bpid);
  1763			}
  1764		}
  1765	
  1766	release_bufs:
  1767		/* In case the portal is busy, retry until successful */
  1768		while ((err = dpaa2_io_service_release(ch->dpio, ch->bp->bpid,
  1769						       buf_array, i)) == -EBUSY) {
  1770			if (retries++ >= DPAA2_ETH_SWP_BUSY_RETRIES)
  1771				break;
  1772			cpu_relax();
  1773		}
  1774	
  1775		/* If release command failed, clean up and bail out;
  1776		 * not much else we can do about it
  1777		 */
  1778		if (err) {
  1779			dpaa2_eth_free_bufs(priv, buf_array, i, ch->xsk_zc);
  1780			return 0;
  1781		}
  1782	
  1783		return i;
  1784	
  1785	err_map:
  1786		if (!ch->xsk_zc) {
  1787			__free_pages(page, 0);
  1788		} else {
  1789			for (; i < batch; i++)
  1790				xsk_buff_free(xdp_buffs[i]);
  1791		}
  1792	err_alloc:
  1793		/* If we managed to allocate at least some buffers,
  1794		 * release them to hardware
  1795		 */
  1796		if (i)
  1797			goto release_bufs;
  1798	
  1799		return 0;
  1800	}
  1801	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
