Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640735882
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 15:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6rxJQgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698333987; x=1729869987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZkxN0/nYfMYPirrYu4NrZmqPXcOfFiFk+PdQErYy/x4=;
  b=P6rxJQgEKbPeDJwADoFI30YjbkEDJ89aqELuFW4TQ4au9yDIsBWNhNvK
   QocC/CJ1EfPzQU1yj1sZxzgwadfWXF/obf/aScWtgdwhsqZppc6auHKnR
   0HpmztliKIliMgEQnAiBMx3Pkt7/hQVZwKBR9t4r3yDTcgQUFNabb2nOi
   +uFBf09dFz3tygLtgF91E2PYLx1b9OmUNI1yoggugg13xUTV5K4yuW23f
   0sO+c3YIcvT19sRzA25gLdb1MwdTZzqHJY0Vlye/vTiH7/VJWugUuQErQ
   UfD2GY1KarNurk2OhBK/XujS7J08Pd4EzMzQTyEdbOOaBGHJPX2fydxEp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="377940143"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="377940143"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 08:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="902943380"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="902943380"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2023 08:23:59 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw2Fb-0009t8-1f;
	Thu, 26 Oct 2023 15:26:23 +0000
Date: Thu, 26 Oct 2023 23:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 5/7] drivers/net/veth.c:380:13: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202310262312.7ud3yqbV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: 87d67390f5c169ff9ae3ed9748e59e5cfb540d70 [5/7] veth: zc_rx support
config: i386-randconfig-062-20231026 (https://download.01.org/0day-ci/archive/20231026/202310262312.7ud3yqbV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310262312.7ud3yqbV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310262312.7ud3yqbV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/veth.c:380:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct netdev_rx_queue [noderef] __rcu *zcq @@     got struct netdev_rx_queue * @@
   drivers/net/veth.c:380:13: sparse:     expected struct netdev_rx_queue [noderef] __rcu *zcq
   drivers/net/veth.c:380:13: sparse:     got struct netdev_rx_queue *
>> drivers/net/veth.c:421:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct netdev_rx_queue *rxq @@     got struct netdev_rx_queue [noderef] __rcu *zcq @@
   drivers/net/veth.c:421:53: sparse:     expected struct netdev_rx_queue *rxq
   drivers/net/veth.c:421:53: sparse:     got struct netdev_rx_queue [noderef] __rcu *zcq
>> drivers/net/veth.c:439:17: sparse: sparse: dereference of noderef expression
   drivers/net/veth.c:440:38: sparse: sparse: dereference of noderef expression
   drivers/net/veth.c:440:38: sparse: sparse: dereference of noderef expression

vim +380 drivers/net/veth.c

   348	
   349	static netdev_tx_t veth_xmit(struct sk_buff *skb, struct net_device *dev)
   350	{
   351		struct veth_priv *rcv_priv, *priv = netdev_priv(dev);
   352		struct netdev_rx_queue __rcu *zcq;
   353		struct veth_rq *rq = NULL;
   354		int ret = NETDEV_TX_OK;
   355		struct net_device *rcv;
   356		int length = skb->len;
   357		bool use_napi = false;
   358		int rxq;
   359	
   360		rcu_read_lock();
   361		rcv = rcu_dereference(priv->peer);
   362		if (unlikely(!rcv) || !pskb_may_pull(skb, ETH_HLEN)) {
   363			kfree_skb(skb);
   364			goto drop;
   365		}
   366	
   367		rcv_priv = netdev_priv(rcv);
   368		rxq = skb_get_queue_mapping(skb);
   369		if (rxq < rcv->real_num_rx_queues) {
   370			rq = &rcv_priv->rq[rxq];
   371	
   372			/* The napi pointer is available when an XDP program is
   373			 * attached or when GRO is enabled
   374			 * Don't bother with napi/GRO if the skb can't be aggregated
   375			 */
   376			use_napi = rcu_access_pointer(rq->napi) &&
   377				   veth_skb_is_eligible_for_gro(dev, rcv, skb);
   378		}
   379	
 > 380		zcq = rcu_dereference(rcv_priv->zcq);
   381		if (zcq) {
   382			u32 size, len, max_head_size, off;
   383			struct sk_buff *nskb;
   384			struct page *page;
   385			int i, head_off;
   386	
   387			max_head_size = skb_headlen(skb);
   388			if (skb->len > PAGE_SIZE * MAX_SKB_FRAGS + max_head_size)
   389				goto drop;
   390	
   391			nskb = __alloc_skb(max_head_size, GFP_ATOMIC | __GFP_ZERO,
   392					SKB_ALLOC_RX, NUMA_NO_NODE);
   393			if (!nskb) {
   394				goto drop;
   395			}
   396	
   397			skb_copy_header(nskb, skb);
   398			skb_mark_for_recycle(nskb);
   399	
   400			if (WARN_ON_ONCE(skb_headlen(skb) > max_head_size)) {
   401				consume_skb(nskb);
   402				goto drop;
   403			}
   404			size = min_t(u32, skb->len, max_head_size);
   405	
   406			if (skb_copy_bits(skb, 0, nskb->data, size)) {
   407				consume_skb(nskb);
   408				goto drop;
   409			}
   410			skb_put(nskb, size);
   411	
   412			head_off = skb_headroom(nskb) - skb_headroom(skb);
   413			skb_headers_offset_update(nskb, head_off);
   414	
   415			/* Allocate paged area of new skb */
   416			off = size;
   417			len = skb->len - off;
   418	
   419			for (i = 0; i < MAX_SKB_FRAGS && off < skb->len; i++) {
   420				// page = page_pool_dev_alloc_pages(rcv_priv->zc_page_pool);
 > 421				page = data_pool_alloc_page(zcq);
   422				if (!page) {
   423					consume_skb(nskb);
   424					goto drop;
   425				}
   426	
   427				size = min_t(u32, len, PAGE_SIZE);
   428				skb_add_rx_frag(nskb, i, page, 0, size, PAGE_SIZE);
   429				if (skb_copy_bits(skb, off, page_address(page),
   430						  size)) {
   431					consume_skb(nskb);
   432					goto drop;
   433				}
   434	
   435				len -= size;
   436				off += size;
   437			}
   438	
 > 439			WARN_ON_ONCE(!zcq->zc_uarg);
   440			skb_zcopy_init(nskb, zcq->zc_uarg);
   441			consume_skb(skb);
   442			skb = nskb;
   443		}
   444	
   445		skb_tx_timestamp(skb);
   446		if (likely(veth_forward_skb(rcv, skb, rq, use_napi) == NET_RX_SUCCESS)) {
   447			if (!use_napi)
   448				dev_lstats_add(dev, length);
   449			else
   450				__veth_xdp_flush(rq);
   451		} else {
   452	drop:
   453			atomic64_inc(&priv->dropped);
   454			ret = NET_XMIT_DROP;
   455		}
   456	
   457		rcu_read_unlock();
   458	
   459		return ret;
   460	}
   461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
