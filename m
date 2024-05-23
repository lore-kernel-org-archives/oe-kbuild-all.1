Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D311442FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716461608; cv=none; b=BCQDj2uiszIzl3WqTA0PDjyV4jUe9f84yiL6Nlo5/oh1JlGOL+yw1Xn7J2wk90psslRKsDXt6nw7NbDKRaGhV4YGSl40ejck3+O1mMBkRbQJe2lsvgedT2I7P3Y+jghNT7QJke38EFQgpbWQqt2isFz1PdhG0focqySaqyslRyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716461608; c=relaxed/simple;
	bh=YKJcbAbs1N2XXhO61PGx5e30IA4GFHk7+9DILIetxEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jm72KvnzAjy0XGvWTdvhDYyCSzYe9/J1dRPWHS4ZRxTJGRW8WDaLD4PTG7vof4husc4zMETycbIHSAh1T2YyZcK4MLQ9AXcmnykXoEy2m9U4Fzqwo9Wlum0YOe9+adbI8hL+3j04QJXaDvZ6uNzbPZ+Nqn3MqUDR69mYHi0xjw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZYLYsp8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZYLYsp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716461606; x=1747997606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YKJcbAbs1N2XXhO61PGx5e30IA4GFHk7+9DILIetxEE=;
  b=fZYLYsp8ydF6Bf6oTx9dSvOxJictPyUcMqX/qREWCi+0E/maEtiPr9JL
   GbIsRuPtV43H92yjbamfpin/LJn3XjHCWvZerW0jKaKfYE+mD7iLSdDjn
   99aiDKqepNR9cgY+SRmCpTEuhz61Ykfd5D8jhBUtPf02XpNnf23GVK8To
   oTECLfRaarX/n/Up0faG3i7wi8wif0sklzKiibCoLj0kzarimtNnh7Vin
   CO/15FKVp4JbmBWUrE44WoboQUHa1qEpd8TCr2Eek8HywdqW+BxAb7Epg
   EMlCuD8z4f9WfiB/gKf3i/hb0zsnekZgoeyVF8IfCPLX0TfASdEUn+dmd
   w==;
X-CSE-ConnectionGUID: F/n2hY2sTGisviDKWAui0A==
X-CSE-MsgGUID: 8dR786tXQDa8eem1sldxDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="16558514"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="16558514"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 03:53:26 -0700
X-CSE-ConnectionGUID: D5pZZeJ5Rt6JZKc8bNr30Q==
X-CSE-MsgGUID: mzND8MPxS8+0VN1L19W6vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="38102110"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 May 2024 03:53:24 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA64W-0002kf-1C;
	Thu, 23 May 2024 10:53:21 +0000
Date: Thu, 23 May 2024 18:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 13/14] drivers/net/veth.c:822:24: error:
 implicit declaration of function 'io_iov_get_page'
Message-ID: <202405231845.E3YvmnOa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   9b5718278c90658985f5d335dff91dd589b3d4c7
commit: 83b53b75f5f938c3c6e4f9905220baa53e63e11e [13/14] veth: add support for io_uring zc rx
config: sh-randconfig-001-20240523 (https://download.01.org/0day-ci/archive/20240523/202405231845.E3YvmnOa-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231845.E3YvmnOa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231845.E3YvmnOa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/veth.c: In function 'veth_iou_rcv_skb':
>> drivers/net/veth.c:822:24: error: implicit declaration of function 'io_iov_get_page' [-Werror=implicit-function-declaration]
     822 |                 page = io_iov_get_page(netmem);
         |                        ^~~~~~~~~~~~~~~
>> drivers/net/veth.c:822:22: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     822 |                 page = io_iov_get_page(netmem);
         |                      ^
   drivers/net/veth.c: In function 'veth_xdp_rcv':
>> drivers/net/veth.c:995:55: error: 'io_uring_pp_zc_ops' undeclared (first use in this function)
     995 |                         if (rq->page_pool->mp_ops == &io_uring_pp_zc_ops) {
         |                                                       ^~~~~~~~~~~~~~~~~~
   drivers/net/veth.c:995:55: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/veth.c: At top level:
   drivers/net/veth.c:1060:61: warning: 'struct io_zc_rx_ifq' declared inside parameter list will not be visible outside of this definition or declaration
    1060 | static int veth_create_page_pool(struct veth_rq *rq, struct io_zc_rx_ifq *ifq)
         |                                                             ^~~~~~~~~~~~
   drivers/net/veth.c: In function 'veth_create_page_pool':
   drivers/net/veth.c:1071:44: error: 'io_uring_pp_zc_ops' undeclared (first use in this function)
    1071 |                 rq->rq.mp_params.mp_ops = &io_uring_pp_zc_ops;
         |                                            ^~~~~~~~~~~~~~~~~~
   drivers/net/veth.c: At top level:
   drivers/net/veth.c:1705:12: warning: 'veth_iou_set' defined but not used [-Wunused-function]
    1705 | static int veth_iou_set(struct net_device *dev,
         |            ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/io_iov_get_page +822 drivers/net/veth.c

   771	
   772	static noinline struct sk_buff *veth_iou_rcv_skb(struct veth_rq *rq,
   773						struct sk_buff *skb)
   774	{
   775		struct sk_buff *nskb;
   776		u32 size, len, off, max_head_size;
   777		struct page *page;
   778		int ret, i, head_off;
   779		void *vaddr;
   780	
   781		/* Testing only, randomly send normal pages to test copy fallback */
   782		if (ktime_get_ns() % 16 == 0)
   783			return skb;
   784	
   785		skb_prepare_for_gro(skb);
   786		max_head_size = skb_headlen(skb);
   787	
   788		rcu_read_lock();
   789		nskb = napi_alloc_skb(&rq->xdp_napi, max_head_size);
   790		if (!nskb)
   791			goto drop;
   792	
   793		skb_copy_header(nskb, skb);
   794		skb_mark_for_recycle(nskb);
   795	
   796		size = max_head_size;
   797		if (skb_copy_bits(skb, 0, nskb->data, size)) {
   798		consume_skb(nskb);
   799			goto drop;
   800		}
   801		skb_put(nskb, size);
   802		head_off = skb_headroom(nskb) - skb_headroom(skb);
   803		skb_headers_offset_update(nskb, head_off);
   804	
   805		/* Allocate paged area of new skb */
   806		off = size;
   807		len = skb->len - off;
   808	
   809		for (i = 0; i < MAX_SKB_FRAGS && off < skb->len; i++) {
   810			netmem_ref netmem;
   811	
   812			netmem = page_pool_alloc_netmem(rq->page_pool, GFP_ATOMIC | __GFP_NOWARN);
   813			if (!netmem) {
   814				consume_skb(nskb);
   815				goto drop;
   816			}
   817			if (WARN_ON_ONCE(!netmem_is_net_iov(netmem))) {
   818				consume_skb(nskb);
   819				goto drop;
   820			}
   821	
 > 822			page = io_iov_get_page(netmem);
   823			if (WARN_ON_ONCE(!page))
   824				goto drop;
   825	
   826			size = min_t(u32, len, PAGE_SIZE);
   827			skb_add_rx_frag_netmem(nskb, i, netmem, 0, size, PAGE_SIZE);
   828	
   829			vaddr = kmap_atomic(page);
   830			ret = skb_copy_bits(skb, off, vaddr, size);
   831			kunmap_atomic(vaddr);
   832	
   833			if (ret) {
   834				consume_skb(nskb);
   835				goto drop;
   836			}
   837			len -= size;
   838			off += size;
   839		}
   840		rcu_read_unlock();
   841	
   842		consume_skb(skb);
   843		skb = nskb;
   844		return skb;
   845	drop:
   846		rcu_read_unlock();
   847		kfree_skb(skb);
   848		return NULL;
   849	}
   850	
   851	
   852	static struct sk_buff *veth_xdp_rcv_skb(struct veth_rq *rq,
   853						struct sk_buff *skb,
   854						struct veth_xdp_tx_bq *bq,
   855						struct veth_stats *stats)
   856	{
   857		void *orig_data, *orig_data_end;
   858		struct bpf_prog *xdp_prog;
   859		struct veth_xdp_buff vxbuf;
   860		struct xdp_buff *xdp = &vxbuf.xdp;
   861		u32 act, metalen;
   862		int off;
   863	
   864		skb_prepare_for_gro(skb);
   865	
   866		rcu_read_lock();
   867		xdp_prog = rcu_dereference(rq->xdp_prog);
   868		if (unlikely(!xdp_prog)) {
   869			rcu_read_unlock();
   870			goto out;
   871		}
   872	
   873		__skb_push(skb, skb->data - skb_mac_header(skb));
   874		if (veth_convert_skb_to_xdp_buff(rq, xdp, &skb))
   875			goto drop;
   876		vxbuf.skb = skb;
   877	
   878		orig_data = xdp->data;
   879		orig_data_end = xdp->data_end;
   880	
   881		act = bpf_prog_run_xdp(xdp_prog, xdp);
   882	
   883		switch (act) {
   884		case XDP_PASS:
   885			break;
   886		case XDP_TX:
   887			veth_xdp_get(xdp);
   888			consume_skb(skb);
   889			xdp->rxq->mem = rq->xdp_mem;
   890			if (unlikely(veth_xdp_tx(rq, xdp, bq) < 0)) {
   891				trace_xdp_exception(rq->dev, xdp_prog, act);
   892				stats->rx_drops++;
   893				goto err_xdp;
   894			}
   895			stats->xdp_tx++;
   896			rcu_read_unlock();
   897			goto xdp_xmit;
   898		case XDP_REDIRECT:
   899			veth_xdp_get(xdp);
   900			consume_skb(skb);
   901			xdp->rxq->mem = rq->xdp_mem;
   902			if (xdp_do_redirect(rq->dev, xdp, xdp_prog)) {
   903				stats->rx_drops++;
   904				goto err_xdp;
   905			}
   906			stats->xdp_redirect++;
   907			rcu_read_unlock();
   908			goto xdp_xmit;
   909		default:
   910			bpf_warn_invalid_xdp_action(rq->dev, xdp_prog, act);
   911			fallthrough;
   912		case XDP_ABORTED:
   913			trace_xdp_exception(rq->dev, xdp_prog, act);
   914			fallthrough;
   915		case XDP_DROP:
   916			stats->xdp_drops++;
   917			goto xdp_drop;
   918		}
   919		rcu_read_unlock();
   920	
   921		/* check if bpf_xdp_adjust_head was used */
   922		off = orig_data - xdp->data;
   923		if (off > 0)
   924			__skb_push(skb, off);
   925		else if (off < 0)
   926			__skb_pull(skb, -off);
   927	
   928		skb_reset_mac_header(skb);
   929	
   930		/* check if bpf_xdp_adjust_tail was used */
   931		off = xdp->data_end - orig_data_end;
   932		if (off != 0)
   933			__skb_put(skb, off); /* positive on grow, negative on shrink */
   934	
   935		/* XDP frag metadata (e.g. nr_frags) are updated in eBPF helpers
   936		 * (e.g. bpf_xdp_adjust_tail), we need to update data_len here.
   937		 */
   938		if (xdp_buff_has_frags(xdp))
   939			skb->data_len = skb_shinfo(skb)->xdp_frags_size;
   940		else
   941			skb->data_len = 0;
   942	
   943		skb->protocol = eth_type_trans(skb, rq->dev);
   944	
   945		metalen = xdp->data - xdp->data_meta;
   946		if (metalen)
   947			skb_metadata_set(skb, metalen);
   948	out:
   949		return skb;
   950	drop:
   951		stats->rx_drops++;
   952	xdp_drop:
   953		rcu_read_unlock();
   954		kfree_skb(skb);
   955		return NULL;
   956	err_xdp:
   957		rcu_read_unlock();
   958		xdp_return_buff(xdp);
   959	xdp_xmit:
   960		return NULL;
   961	}
   962	
   963	static int veth_xdp_rcv(struct veth_rq *rq, int budget,
   964				struct veth_xdp_tx_bq *bq,
   965				struct veth_stats *stats)
   966	{
   967		int i, done = 0, n_xdpf = 0;
   968		void *xdpf[VETH_XDP_BATCH];
   969	
   970		for (i = 0; i < budget; i++) {
   971			void *ptr = __ptr_ring_consume(&rq->xdp_ring);
   972	
   973			if (!ptr)
   974				break;
   975	
   976			if (veth_is_xdp_frame(ptr)) {
   977				/* ndo_xdp_xmit */
   978				struct xdp_frame *frame = veth_ptr_to_xdp(ptr);
   979	
   980				stats->xdp_bytes += xdp_get_frame_len(frame);
   981				frame = veth_xdp_rcv_one(rq, frame, bq, stats);
   982				if (frame) {
   983					/* XDP_PASS */
   984					xdpf[n_xdpf++] = frame;
   985					if (n_xdpf == VETH_XDP_BATCH) {
   986						veth_xdp_rcv_bulk_skb(rq, xdpf, n_xdpf,
   987								      bq, stats);
   988						n_xdpf = 0;
   989					}
   990				}
   991			} else {
   992				/* ndo_start_xmit */
   993				struct sk_buff *skb = ptr;
   994	
 > 995				if (rq->page_pool->mp_ops == &io_uring_pp_zc_ops) {
   996					skb = veth_iou_rcv_skb(rq, skb);
   997				} else {
   998					stats->xdp_bytes += skb->len;
   999					skb = veth_xdp_rcv_skb(rq, skb, bq, stats);
  1000				}
  1001	
  1002				if (skb) {
  1003					if (skb_shared(skb) || skb_unclone(skb, GFP_ATOMIC))
  1004						netif_receive_skb(skb);
  1005					else
  1006						napi_gro_receive(&rq->xdp_napi, skb);
  1007				}
  1008			}
  1009			done++;
  1010		}
  1011	
  1012		if (n_xdpf)
  1013			veth_xdp_rcv_bulk_skb(rq, xdpf, n_xdpf, bq, stats);
  1014	
  1015		u64_stats_update_begin(&rq->stats.syncp);
  1016		rq->stats.vs.xdp_redirect += stats->xdp_redirect;
  1017		rq->stats.vs.xdp_bytes += stats->xdp_bytes;
  1018		rq->stats.vs.xdp_drops += stats->xdp_drops;
  1019		rq->stats.vs.rx_drops += stats->rx_drops;
  1020		rq->stats.vs.xdp_packets += done;
  1021		u64_stats_update_end(&rq->stats.syncp);
  1022	
  1023		return done;
  1024	}
  1025	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
