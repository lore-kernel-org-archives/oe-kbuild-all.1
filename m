Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9646D1C2AA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 01:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783820101; cv=none; b=M57RsGvzg8Oykyf1snOrJzKSuMxMaJL+EajrakdpKWuhFQL8SKaJJw50UYyBcK49Jf8vZs7EqZLSEOVKlHHfdzPp3GCzpQ65SJJN8Jc5yED+ZHDcWBcwwBDfI9xjWOYWUoR2v9qkiX8NSUFfGtTNl0CCfWmIga/17CmDC8PN10U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783820101; c=relaxed/simple;
	bh=pwaHbzMaqFSwJ98LCJcsULkWoLnQIIdvUUqXeKxdxbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rD7u9b83aGaWiItyZjq3dXaAs+YkEGGRF+gIXsw7iq9uWAoTf/sL0tfMKG7/X7BINFv8suLYLi+u6TTyp4RzzVT/rQZQ1VFy2tEQ2Oz8PJemA1D7Gm/fVpgAZWjkQ6euC6j11VvWYT1ISn+yV5ru0qPgmbKR3hBcaKjF5IUSHEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmOwtKQl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmOwtKQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783820098; x=1815356098;
  h=date:from:to:cc:subject:message-id;
  bh=pwaHbzMaqFSwJ98LCJcsULkWoLnQIIdvUUqXeKxdxbI=;
  b=XmOwtKQlACcVNNZ99a2tq5x1y4xCLUdljvCowP2RUVePT3tdiDwYbGEm
   AEv8czxi/9r1fjeb+2gwGNpJW9HJhp+IAEBmDkESz87kisTJbM61y7eUN
   bJJlZ1XBrA1gjIM/fzjjxt6A3c9sUl/UauO9kVLvmJp9nP/OcHbg3L9Oq
   I86iTyNRs0WlFXxXLjJw5dfhdtjssu/9WPMoiUVVpcaBnLZXpFF3GE4Yx
   U3/ZYlCJ7e1F5yKIoNukin6+pkHjrugm7dCi7gmzuVVp/voIfDLTLOfSo
   Bv2XbORv5yRtHBxk5GUcAbn/MbqJaSroFWbmf6JaJsB7UbBwGOMd58dq+
   w==;
X-CSE-ConnectionGUID: B7CswIJRRCyx7YuZMcRd3A==
X-CSE-MsgGUID: BAX6VCL8SrCxAZaesFKnzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95627782"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95627782"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 18:34:58 -0700
X-CSE-ConnectionGUID: vC66oxgYSBiLqtNpE7bc8g==
X-CSE-MsgGUID: WdacKmh6Rke4TRhyxu8UAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="257160047"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jul 2026 18:34:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wij5b-00000000KZW-1CLJ;
	Sun, 12 Jul 2026 01:34:53 +0000
Date: Sun, 12 Jul 2026 09:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-09 0/1]
 drivers/net/xen-netback/netback.c:886:7: warning: variable 'pending_idx' set
 but not used
Message-ID: <202607120802.wY79PFYF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ross,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-09
head:   070087c901bc9447f53844b8041499701569b689
commit: ad7f402ae4f466647c3a669b8a6f3e5d4271c84a [0/1] xen/netback: Ensure protocol headers don't fall in the non-linear area
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260712/202607120802.wY79PFYF-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120802.wY79PFYF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ad7f402ae4f4 ("xen/netback: Ensure protocol headers don't fall in the non-linear area")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120802.wY79PFYF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/net/xen-netback/netback.c:42:
   In file included from include/net/tcp.h:32:
   In file included from include/net/inet_hashtables.h:26:
   include/net/ip.h:453:14: warning: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     453 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:108:26: note: expanded from macro 'time_before'
     108 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:105:3: note: expanded from macro 'time_after'
     105 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> drivers/net/xen-netback/netback.c:886:7: warning: variable 'pending_idx' set but not used [-Wunused-but-set-variable]
     886 |                 u16 pending_idx;
         |                     ^
   3 warnings generated.


vim +/pending_idx +886 drivers/net/xen-netback/netback.c

210c34dcd8d912d Paul Durrant   2015-09-02   871  
e9ce7cb6b107407 Wei Liu        2014-06-04   872  static void xenvif_tx_build_gops(struct xenvif_queue *queue,
bdab82759b8e362 Zoltan Kiss    2014-04-02   873  				     int budget,
bdab82759b8e362 Zoltan Kiss    2014-04-02   874  				     unsigned *copy_ops,
bdab82759b8e362 Zoltan Kiss    2014-04-02   875  				     unsigned *map_ops)
f942dc2552b8bfd Ian Campbell   2011-03-15   876  {
2475b22526d7023 Ross Lagerwall 2015-08-03   877  	struct sk_buff *skb, *nskb;
f942dc2552b8bfd Ian Campbell   2011-03-15   878  	int ret;
2475b22526d7023 Ross Lagerwall 2015-08-03   879  	unsigned int frag_overflow;
f942dc2552b8bfd Ian Campbell   2011-03-15   880  
e9ce7cb6b107407 Wei Liu        2014-06-04   881  	while (skb_queue_len(&queue->tx_queue) < budget) {
f942dc2552b8bfd Ian Campbell   2011-03-15   882  		struct xen_netif_tx_request txreq;
376414945d15aa6 Wei Liu        2013-05-02   883  		struct xen_netif_tx_request txfrags[XEN_NETBK_LEGACY_SLOTS_MAX];
f942dc2552b8bfd Ian Campbell   2011-03-15   884  		struct xen_netif_extra_info extras[XEN_NETIF_EXTRA_TYPE_MAX-1];
562abd39a190274 Paul Durrant   2016-03-10   885  		unsigned int extra_count;
f942dc2552b8bfd Ian Campbell   2011-03-15  @886  		u16 pending_idx;
f942dc2552b8bfd Ian Campbell   2011-03-15   887  		RING_IDX idx;
f942dc2552b8bfd Ian Campbell   2011-03-15   888  		int work_to_do;
f942dc2552b8bfd Ian Campbell   2011-03-15   889  		unsigned int data_len;
f942dc2552b8bfd Ian Campbell   2011-03-15   890  		pending_ring_idx_t index;
f942dc2552b8bfd Ian Campbell   2011-03-15   891  
e9ce7cb6b107407 Wei Liu        2014-06-04   892  		if (queue->tx.sring->req_prod - queue->tx.req_cons >
48856286b64e4b6 Ian Campbell   2013-02-06   893  		    XEN_NETIF_TX_RING_SIZE) {
e9ce7cb6b107407 Wei Liu        2014-06-04   894  			netdev_err(queue->vif->dev,
48856286b64e4b6 Ian Campbell   2013-02-06   895  				   "Impossible number of requests. "
48856286b64e4b6 Ian Campbell   2013-02-06   896  				   "req_prod %d, req_cons %d, size %ld\n",
e9ce7cb6b107407 Wei Liu        2014-06-04   897  				   queue->tx.sring->req_prod, queue->tx.req_cons,
48856286b64e4b6 Ian Campbell   2013-02-06   898  				   XEN_NETIF_TX_RING_SIZE);
e9ce7cb6b107407 Wei Liu        2014-06-04   899  			xenvif_fatal_tx_err(queue->vif);
e9d8b2c2968499c Wei Liu        2014-04-01   900  			break;
48856286b64e4b6 Ian Campbell   2013-02-06   901  		}
48856286b64e4b6 Ian Campbell   2013-02-06   902  
09e545f7381459c Juergen Gross  2022-05-30   903  		work_to_do = XEN_RING_NR_UNCONSUMED_REQUESTS(&queue->tx);
b3f980bd827e6e8 Wei Liu        2013-08-26   904  		if (!work_to_do)
b3f980bd827e6e8 Wei Liu        2013-08-26   905  			break;
f942dc2552b8bfd Ian Campbell   2011-03-15   906  
e9ce7cb6b107407 Wei Liu        2014-06-04   907  		idx = queue->tx.req_cons;
f942dc2552b8bfd Ian Campbell   2011-03-15   908  		rmb(); /* Ensure that we see the request before we copy it. */
68a33bfd8403e4e David Vrabel   2015-10-30   909  		RING_COPY_REQUEST(&queue->tx, idx, &txreq);
f942dc2552b8bfd Ian Campbell   2011-03-15   910  
f942dc2552b8bfd Ian Campbell   2011-03-15   911  		/* Credit-based scheduling. */
e9ce7cb6b107407 Wei Liu        2014-06-04   912  		if (txreq.size > queue->remaining_credit &&
e9ce7cb6b107407 Wei Liu        2014-06-04   913  		    tx_credit_exceeded(queue, txreq.size))
b3f980bd827e6e8 Wei Liu        2013-08-26   914  			break;
f942dc2552b8bfd Ian Campbell   2011-03-15   915  
e9ce7cb6b107407 Wei Liu        2014-06-04   916  		queue->remaining_credit -= txreq.size;
f942dc2552b8bfd Ian Campbell   2011-03-15   917  
f942dc2552b8bfd Ian Campbell   2011-03-15   918  		work_to_do--;
e9ce7cb6b107407 Wei Liu        2014-06-04   919  		queue->tx.req_cons = ++idx;
f942dc2552b8bfd Ian Campbell   2011-03-15   920  
f942dc2552b8bfd Ian Campbell   2011-03-15   921  		memset(extras, 0, sizeof(extras));
562abd39a190274 Paul Durrant   2016-03-10   922  		extra_count = 0;
f942dc2552b8bfd Ian Campbell   2011-03-15   923  		if (txreq.flags & XEN_NETTXF_extra_info) {
e9ce7cb6b107407 Wei Liu        2014-06-04   924  			work_to_do = xenvif_get_extras(queue, extras,
562abd39a190274 Paul Durrant   2016-03-10   925  						       &extra_count,
f942dc2552b8bfd Ian Campbell   2011-03-15   926  						       work_to_do);
e9ce7cb6b107407 Wei Liu        2014-06-04   927  			idx = queue->tx.req_cons;
48856286b64e4b6 Ian Campbell   2013-02-06   928  			if (unlikely(work_to_do < 0))
b3f980bd827e6e8 Wei Liu        2013-08-26   929  				break;
f942dc2552b8bfd Ian Campbell   2011-03-15   930  		}
f942dc2552b8bfd Ian Campbell   2011-03-15   931  
210c34dcd8d912d Paul Durrant   2015-09-02   932  		if (extras[XEN_NETIF_EXTRA_TYPE_MCAST_ADD - 1].type) {
210c34dcd8d912d Paul Durrant   2015-09-02   933  			struct xen_netif_extra_info *extra;
210c34dcd8d912d Paul Durrant   2015-09-02   934  
210c34dcd8d912d Paul Durrant   2015-09-02   935  			extra = &extras[XEN_NETIF_EXTRA_TYPE_MCAST_ADD - 1];
210c34dcd8d912d Paul Durrant   2015-09-02   936  			ret = xenvif_mcast_add(queue->vif, extra->u.mcast.addr);
210c34dcd8d912d Paul Durrant   2015-09-02   937  
562abd39a190274 Paul Durrant   2016-03-10   938  			make_tx_response(queue, &txreq, extra_count,
210c34dcd8d912d Paul Durrant   2015-09-02   939  					 (ret == 0) ?
210c34dcd8d912d Paul Durrant   2015-09-02   940  					 XEN_NETIF_RSP_OKAY :
210c34dcd8d912d Paul Durrant   2015-09-02   941  					 XEN_NETIF_RSP_ERROR);
210c34dcd8d912d Paul Durrant   2015-09-02   942  			push_tx_responses(queue);
210c34dcd8d912d Paul Durrant   2015-09-02   943  			continue;
210c34dcd8d912d Paul Durrant   2015-09-02   944  		}
210c34dcd8d912d Paul Durrant   2015-09-02   945  
210c34dcd8d912d Paul Durrant   2015-09-02   946  		if (extras[XEN_NETIF_EXTRA_TYPE_MCAST_DEL - 1].type) {
210c34dcd8d912d Paul Durrant   2015-09-02   947  			struct xen_netif_extra_info *extra;
210c34dcd8d912d Paul Durrant   2015-09-02   948  
210c34dcd8d912d Paul Durrant   2015-09-02   949  			extra = &extras[XEN_NETIF_EXTRA_TYPE_MCAST_DEL - 1];
210c34dcd8d912d Paul Durrant   2015-09-02   950  			xenvif_mcast_del(queue->vif, extra->u.mcast.addr);
210c34dcd8d912d Paul Durrant   2015-09-02   951  
562abd39a190274 Paul Durrant   2016-03-10   952  			make_tx_response(queue, &txreq, extra_count,
562abd39a190274 Paul Durrant   2016-03-10   953  					 XEN_NETIF_RSP_OKAY);
210c34dcd8d912d Paul Durrant   2015-09-02   954  			push_tx_responses(queue);
210c34dcd8d912d Paul Durrant   2015-09-02   955  			continue;
210c34dcd8d912d Paul Durrant   2015-09-02   956  		}
210c34dcd8d912d Paul Durrant   2015-09-02   957  
ad7f402ae4f4666 Ross Lagerwall 2022-11-22   958  		data_len = (txreq.size > XEN_NETBACK_TX_COPY_LEN) ?
ad7f402ae4f4666 Ross Lagerwall 2022-11-22   959  			XEN_NETBACK_TX_COPY_LEN : txreq.size;
ad7f402ae4f4666 Ross Lagerwall 2022-11-22   960  
562abd39a190274 Paul Durrant   2016-03-10   961  		ret = xenvif_count_requests(queue, &txreq, extra_count,
562abd39a190274 Paul Durrant   2016-03-10   962  					    txfrags, work_to_do);
ad7f402ae4f4666 Ross Lagerwall 2022-11-22   963  
48856286b64e4b6 Ian Campbell   2013-02-06   964  		if (unlikely(ret < 0))
b3f980bd827e6e8 Wei Liu        2013-08-26   965  			break;
48856286b64e4b6 Ian Campbell   2013-02-06   966  
f942dc2552b8bfd Ian Campbell   2011-03-15   967  		idx += ret;
f942dc2552b8bfd Ian Campbell   2011-03-15   968  
f942dc2552b8bfd Ian Campbell   2011-03-15   969  		if (unlikely(txreq.size < ETH_HLEN)) {
e9ce7cb6b107407 Wei Liu        2014-06-04   970  			netdev_dbg(queue->vif->dev,
f942dc2552b8bfd Ian Campbell   2011-03-15   971  				   "Bad packet size: %d\n", txreq.size);
562abd39a190274 Paul Durrant   2016-03-10   972  			xenvif_tx_err(queue, &txreq, extra_count, idx);
b3f980bd827e6e8 Wei Liu        2013-08-26   973  			break;
f942dc2552b8bfd Ian Campbell   2011-03-15   974  		}
f942dc2552b8bfd Ian Campbell   2011-03-15   975  
f942dc2552b8bfd Ian Campbell   2011-03-15   976  		/* No crossing a page as the payload mustn't fragment. */
d0089e8a0e4c972 Julien Grall   2015-05-05   977  		if (unlikely((txreq.offset + txreq.size) > XEN_PAGE_SIZE)) {
e9ce7cb6b107407 Wei Liu        2014-06-04   978  			netdev_err(queue->vif->dev,
68946159da1b0b6 Julien Grall   2015-06-16   979  				   "txreq.offset: %u, size: %u, end: %lu\n",
f942dc2552b8bfd Ian Campbell   2011-03-15   980  				   txreq.offset, txreq.size,
d0089e8a0e4c972 Julien Grall   2015-05-05   981  				   (unsigned long)(txreq.offset&~XEN_PAGE_MASK) + txreq.size);
e9ce7cb6b107407 Wei Liu        2014-06-04   982  			xenvif_fatal_tx_err(queue->vif);
b3f980bd827e6e8 Wei Liu        2013-08-26   983  			break;
f942dc2552b8bfd Ian Campbell   2011-03-15   984  		}
f942dc2552b8bfd Ian Campbell   2011-03-15   985  
e9ce7cb6b107407 Wei Liu        2014-06-04   986  		index = pending_index(queue->pending_cons);
e9ce7cb6b107407 Wei Liu        2014-06-04   987  		pending_idx = queue->pending_ring[index];
f942dc2552b8bfd Ian Campbell   2011-03-15   988  
ad7f402ae4f4666 Ross Lagerwall 2022-11-22   989  		if (ret >= XEN_NETBK_LEGACY_SLOTS_MAX - 1 && data_len < txreq.size)
ad7f402ae4f4666 Ross Lagerwall 2022-11-22   990  			data_len = txreq.size;
f942dc2552b8bfd Ian Campbell   2011-03-15   991  
e3377f36ca20a03 Zoltan Kiss    2014-03-06   992  		skb = xenvif_alloc_skb(data_len);
f942dc2552b8bfd Ian Campbell   2011-03-15   993  		if (unlikely(skb == NULL)) {
e9ce7cb6b107407 Wei Liu        2014-06-04   994  			netdev_dbg(queue->vif->dev,
f942dc2552b8bfd Ian Campbell   2011-03-15   995  				   "Can't allocate a skb in start_xmit.\n");
562abd39a190274 Paul Durrant   2016-03-10   996  			xenvif_tx_err(queue, &txreq, extra_count, idx);
f942dc2552b8bfd Ian Campbell   2011-03-15   997  			break;
f942dc2552b8bfd Ian Campbell   2011-03-15   998  		}
f942dc2552b8bfd Ian Campbell   2011-03-15   999  
2475b22526d7023 Ross Lagerwall 2015-08-03  1000  		skb_shinfo(skb)->nr_frags = ret;
2475b22526d7023 Ross Lagerwall 2015-08-03  1001  		/* At this point shinfo->nr_frags is in fact the number of
2475b22526d7023 Ross Lagerwall 2015-08-03  1002  		 * slots, which can be as large as XEN_NETBK_LEGACY_SLOTS_MAX.
2475b22526d7023 Ross Lagerwall 2015-08-03  1003  		 */
2475b22526d7023 Ross Lagerwall 2015-08-03  1004  		frag_overflow = 0;
2475b22526d7023 Ross Lagerwall 2015-08-03  1005  		nskb = NULL;
2475b22526d7023 Ross Lagerwall 2015-08-03  1006  		if (skb_shinfo(skb)->nr_frags > MAX_SKB_FRAGS) {
2475b22526d7023 Ross Lagerwall 2015-08-03  1007  			frag_overflow = skb_shinfo(skb)->nr_frags - MAX_SKB_FRAGS;
2475b22526d7023 Ross Lagerwall 2015-08-03  1008  			BUG_ON(frag_overflow > MAX_SKB_FRAGS);
2475b22526d7023 Ross Lagerwall 2015-08-03  1009  			skb_shinfo(skb)->nr_frags = MAX_SKB_FRAGS;
2475b22526d7023 Ross Lagerwall 2015-08-03  1010  			nskb = xenvif_alloc_skb(0);
2475b22526d7023 Ross Lagerwall 2015-08-03  1011  			if (unlikely(nskb == NULL)) {
3a0233ddec554b8 Ross Lagerwall 2019-08-05  1012  				skb_shinfo(skb)->nr_frags = 0;
2475b22526d7023 Ross Lagerwall 2015-08-03  1013  				kfree_skb(skb);
562abd39a190274 Paul Durrant   2016-03-10  1014  				xenvif_tx_err(queue, &txreq, extra_count, idx);
2475b22526d7023 Ross Lagerwall 2015-08-03  1015  				if (net_ratelimit())
2475b22526d7023 Ross Lagerwall 2015-08-03  1016  					netdev_err(queue->vif->dev,
2475b22526d7023 Ross Lagerwall 2015-08-03  1017  						   "Can't allocate the frag_list skb.\n");
2475b22526d7023 Ross Lagerwall 2015-08-03  1018  				break;
2475b22526d7023 Ross Lagerwall 2015-08-03  1019  			}
2475b22526d7023 Ross Lagerwall 2015-08-03  1020  		}
2475b22526d7023 Ross Lagerwall 2015-08-03  1021  
f942dc2552b8bfd Ian Campbell   2011-03-15  1022  		if (extras[XEN_NETIF_EXTRA_TYPE_GSO - 1].type) {
f942dc2552b8bfd Ian Campbell   2011-03-15  1023  			struct xen_netif_extra_info *gso;
f942dc2552b8bfd Ian Campbell   2011-03-15  1024  			gso = &extras[XEN_NETIF_EXTRA_TYPE_GSO - 1];
f942dc2552b8bfd Ian Campbell   2011-03-15  1025  
e9ce7cb6b107407 Wei Liu        2014-06-04  1026  			if (xenvif_set_skb_gso(queue->vif, skb, gso)) {
7376419a4697657 Wei Liu        2013-08-26  1027  				/* Failure in xenvif_set_skb_gso is fatal. */
3a0233ddec554b8 Ross Lagerwall 2019-08-05  1028  				skb_shinfo(skb)->nr_frags = 0;
f942dc2552b8bfd Ian Campbell   2011-03-15  1029  				kfree_skb(skb);
2475b22526d7023 Ross Lagerwall 2015-08-03  1030  				kfree_skb(nskb);
b3f980bd827e6e8 Wei Liu        2013-08-26  1031  				break;
f942dc2552b8bfd Ian Campbell   2011-03-15  1032  			}
f942dc2552b8bfd Ian Campbell   2011-03-15  1033  		}
f942dc2552b8bfd Ian Campbell   2011-03-15  1034  
c2d09fde7299f68 Paul Durrant   2016-05-13  1035  		if (extras[XEN_NETIF_EXTRA_TYPE_HASH - 1].type) {
c2d09fde7299f68 Paul Durrant   2016-05-13  1036  			struct xen_netif_extra_info *extra;
c2d09fde7299f68 Paul Durrant   2016-05-13  1037  			enum pkt_hash_types type = PKT_HASH_TYPE_NONE;
c2d09fde7299f68 Paul Durrant   2016-05-13  1038  
c2d09fde7299f68 Paul Durrant   2016-05-13  1039  			extra = &extras[XEN_NETIF_EXTRA_TYPE_HASH - 1];
c2d09fde7299f68 Paul Durrant   2016-05-13  1040  
c2d09fde7299f68 Paul Durrant   2016-05-13  1041  			switch (extra->u.hash.type) {
c2d09fde7299f68 Paul Durrant   2016-05-13  1042  			case _XEN_NETIF_CTRL_HASH_TYPE_IPV4:
c2d09fde7299f68 Paul Durrant   2016-05-13  1043  			case _XEN_NETIF_CTRL_HASH_TYPE_IPV6:
c2d09fde7299f68 Paul Durrant   2016-05-13  1044  				type = PKT_HASH_TYPE_L3;
c2d09fde7299f68 Paul Durrant   2016-05-13  1045  				break;
c2d09fde7299f68 Paul Durrant   2016-05-13  1046  
c2d09fde7299f68 Paul Durrant   2016-05-13  1047  			case _XEN_NETIF_CTRL_HASH_TYPE_IPV4_TCP:
c2d09fde7299f68 Paul Durrant   2016-05-13  1048  			case _XEN_NETIF_CTRL_HASH_TYPE_IPV6_TCP:
c2d09fde7299f68 Paul Durrant   2016-05-13  1049  				type = PKT_HASH_TYPE_L4;
c2d09fde7299f68 Paul Durrant   2016-05-13  1050  				break;
c2d09fde7299f68 Paul Durrant   2016-05-13  1051  
c2d09fde7299f68 Paul Durrant   2016-05-13  1052  			default:
c2d09fde7299f68 Paul Durrant   2016-05-13  1053  				break;
c2d09fde7299f68 Paul Durrant   2016-05-13  1054  			}
c2d09fde7299f68 Paul Durrant   2016-05-13  1055  
c2d09fde7299f68 Paul Durrant   2016-05-13  1056  			if (type != PKT_HASH_TYPE_NONE)
c2d09fde7299f68 Paul Durrant   2016-05-13  1057  				skb_set_hash(skb,
c2d09fde7299f68 Paul Durrant   2016-05-13  1058  					     *(u32 *)extra->u.hash.value,
c2d09fde7299f68 Paul Durrant   2016-05-13  1059  					     type);
c2d09fde7299f68 Paul Durrant   2016-05-13  1060  		}
c2d09fde7299f68 Paul Durrant   2016-05-13  1061  
ad7f402ae4f4666 Ross Lagerwall 2022-11-22  1062  		xenvif_get_requests(queue, skb, &txreq, txfrags, copy_ops,
ad7f402ae4f4666 Ross Lagerwall 2022-11-22  1063  				    map_ops, frag_overflow, nskb, extra_count,
ad7f402ae4f4666 Ross Lagerwall 2022-11-22  1064  				    data_len);
f942dc2552b8bfd Ian Campbell   2011-03-15  1065  
e9ce7cb6b107407 Wei Liu        2014-06-04  1066  		__skb_queue_tail(&queue->tx_queue, skb);
1e0b6eac6a150a3 Annie Li       2012-06-27  1067  
e9ce7cb6b107407 Wei Liu        2014-06-04  1068  		queue->tx.req_cons = idx;
f942dc2552b8bfd Ian Campbell   2011-03-15  1069  
ad7f402ae4f4666 Ross Lagerwall 2022-11-22  1070  		if ((*map_ops >= ARRAY_SIZE(queue->tx_map_ops)) ||
e9ce7cb6b107407 Wei Liu        2014-06-04  1071  		    (*copy_ops >= ARRAY_SIZE(queue->tx_copy_ops)))
f942dc2552b8bfd Ian Campbell   2011-03-15  1072  			break;
f942dc2552b8bfd Ian Campbell   2011-03-15  1073  	}
f942dc2552b8bfd Ian Campbell   2011-03-15  1074  
bdab82759b8e362 Zoltan Kiss    2014-04-02  1075  	return;
f942dc2552b8bfd Ian Campbell   2011-03-15  1076  }
f942dc2552b8bfd Ian Campbell   2011-03-15  1077  

:::::: The code at line 886 was first introduced by commit
:::::: f942dc2552b8bfdee607be867b12a8971bb9cd85 xen network backend driver

:::::: TO: Ian Campbell <Ian.Campbell@citrix.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
