Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048E28EB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jul 2023 21:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688333991; x=1719869991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FJYvTq0poSjdj520coHwXf51VP0lmi2OyBWr8eTgcNc=;
  b=WA7YSf75d9ZSoAaTdrNZ/6UmRTvUAxRE/IG7rlrDDNG16MKw7kVZPqij
   CSX2hW3N60jSQaMgaXa1HvdptInpMjI/6b19dM0cQjZESknj9AsQ1V57y
   mgl6fPl6maQJvPE4m8Tb66X7kvdw9dT6GihJdoaRaTg7fQkAw/stdwMLZ
   Ja363owdo61/FOcnA34QpJw9FUpkin3Ka9u6OoI3GwkNK3j1ywccTHS6S
   t8LRJIa4QYFiFqn8qIpkdMYHHHRgYWM+cJcqWBmF20evVWyN3Po2yaRp6
   HLSmXy0vSZMWmqdVDT94z3y9BG/6XHfCLEDbgNh7kQmD9bLSR9GANfamU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="342332135"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="342332135"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 14:39:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="788314741"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="788314741"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Jul 2023 14:39:49 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qG4nM-000Gt9-0V;
	Sun, 02 Jul 2023 21:39:48 +0000
Date: Mon, 3 Jul 2023 05:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_virt_to_page 4/6]
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:480:64: error: macro
 "dma_map_single" requires 4 arguments, but only 3 given
Message-ID: <202307030554.T9to9qZc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_virt_to_page
head:   4d390b969a98bdee1a1521f8facec4560a7acea8
commit: 6b4875ab0e9ea706555354387c195b29f6cf5690 [4/6] net: remove virt_to_page when dma mapping
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230703/202307030554.T9to9qZc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307030554.T9to9qZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307030554.T9to9qZc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c: In function 'dpaa2_eth_run_xdp':
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:480:64: error: macro "dma_map_single" requires 4 arguments, but only 3 given
     480 |                                               DMA_BIDIRECTIONAL);
         |                                                                ^
   In file included from include/linux/skbuff.h:28,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:8:
   include/linux/dma-mapping.h:412: note: macro "dma_map_single" defined here
     412 | #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
         | 
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:478:32: error: 'dma_map_single' undeclared (first use in this function); did you mean 'dma_map_sgtable'?
     478 |                         addr = dma_map_single(priv->net_dev->dev.parent, vaddr
         |                                ^~~~~~~~~~~~~~
         |                                dma_map_sgtable
   drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:478:32: note: each undeclared identifier is reported only once for each function it appears in


vim +/dma_map_single +480 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c

   424	
   425	static u32 dpaa2_eth_run_xdp(struct dpaa2_eth_priv *priv,
   426				     struct dpaa2_eth_channel *ch,
   427				     struct dpaa2_eth_fq *rx_fq,
   428				     struct dpaa2_fd *fd, void *vaddr)
   429	{
   430		dma_addr_t addr = dpaa2_fd_get_addr(fd);
   431		struct bpf_prog *xdp_prog;
   432		struct xdp_buff xdp;
   433		u32 xdp_act = XDP_PASS;
   434		int err, offset;
   435	
   436		xdp_prog = READ_ONCE(ch->xdp.prog);
   437		if (!xdp_prog)
   438			goto out;
   439	
   440		offset = dpaa2_fd_get_offset(fd) - XDP_PACKET_HEADROOM;
   441		xdp_init_buff(&xdp, DPAA2_ETH_RX_BUF_RAW_SIZE - offset, &ch->xdp_rxq);
   442		xdp_prepare_buff(&xdp, vaddr + offset, XDP_PACKET_HEADROOM,
   443				 dpaa2_fd_get_len(fd), false);
   444	
   445		xdp_act = bpf_prog_run_xdp(xdp_prog, &xdp);
   446	
   447		/* xdp.data pointer may have changed */
   448		dpaa2_fd_set_offset(fd, xdp.data - vaddr);
   449		dpaa2_fd_set_len(fd, xdp.data_end - xdp.data);
   450	
   451		switch (xdp_act) {
   452		case XDP_PASS:
   453			break;
   454		case XDP_TX:
   455			dpaa2_eth_xdp_enqueue(priv, ch, fd, vaddr, rx_fq->flowid);
   456			break;
   457		default:
   458			bpf_warn_invalid_xdp_action(priv->net_dev, xdp_prog, xdp_act);
   459			fallthrough;
   460		case XDP_ABORTED:
   461			trace_xdp_exception(priv->net_dev, xdp_prog, xdp_act);
   462			fallthrough;
   463		case XDP_DROP:
   464			dpaa2_eth_recycle_buf(priv, ch, addr);
   465			ch->stats.xdp_drop++;
   466			break;
   467		case XDP_REDIRECT:
   468			dma_unmap_page(priv->net_dev->dev.parent, addr,
   469				       priv->rx_buf_size, DMA_BIDIRECTIONAL);
   470			ch->buf_count--;
   471	
   472			/* Allow redirect use of full headroom */
   473			xdp.data_hard_start = vaddr;
   474			xdp.frame_sz = DPAA2_ETH_RX_BUF_RAW_SIZE;
   475	
   476			err = xdp_do_redirect(priv->net_dev, &xdp, xdp_prog);
   477			if (unlikely(err)) {
 > 478				addr = dma_map_single(priv->net_dev->dev.parent, vaddr
   479						      priv->rx_buf_size,
 > 480						      DMA_BIDIRECTIONAL);
   481				if (unlikely(dma_mapping_error(priv->net_dev->dev.parent, addr))) {
   482					free_pages((unsigned long)vaddr, 0);
   483				} else {
   484					ch->buf_count++;
   485					dpaa2_eth_recycle_buf(priv, ch, addr);
   486				}
   487				ch->stats.xdp_drop++;
   488			} else {
   489				ch->stats.xdp_redirect++;
   490			}
   491			break;
   492		}
   493	
   494		ch->xdp.res |= xdp_act;
   495	out:
   496		return xdp_act;
   497	}
   498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
