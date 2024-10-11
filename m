Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0DD1917FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 04:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728621179; cv=none; b=u/XyO00A6yobiudW+OobptZZucQYtc0PCac2hAjep+dD3TZLzkUIoFegc18HlDZaVHYY4yTbE5v4V3/OGvqY2s8sjWTPVx60qA2evnvi2n3oADhaikKazzGXGOtoXGd3cjIctt5vj17Qpg/vmPqBbaHjKPOAzoGHy1z1xhBRUBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728621179; c=relaxed/simple;
	bh=IQ8WZnwn+1qppo6YHarfEp1GFhSGFdwbphcKFlVdnr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o4/78XqtqR8SJ7YTtGIr6kf5i7P4icXeW2DXf/IqG3SHOAuBtwEOXSpGgi7xtqKy4TJczBUvzMPzgERmgUSelPQ4KFKdXdF4MkzHwKJVWKjR+ZJ6p09Ead4D/L3YMxaXSDVMaALjvJ9bDyaaIP8cEILkTGrwc11LuJMJAwDoaq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDyziBoj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDyziBoj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728621176; x=1760157176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQ8WZnwn+1qppo6YHarfEp1GFhSGFdwbphcKFlVdnr8=;
  b=XDyziBoj48EWWe3HJLZiW6PACaJhUUdgpszuscVDN9HNJZ5wIdVxMQqU
   uk6pG77CEB1p5nuuQgn565MKo+qysPshjjkcqI90mu7ivDq4Pqxd5ngOu
   lTOyPnjLFGSUoEdX5BnmQcosNfWU3MAy//qtGNTBYTS9mwdEx3XvbEiIo
   SdMAIynIGC8eqFrneoQyFm3HEcnSpS17d36Mk1Z6aY2bU6H238xXPG/sc
   WOhDYVCqZhLch9zWCkNZJed3adL34sIbU0SQdyZsVdWs/auNx4F0x24ZS
   MKCfeBTDmCCz4E7DYMstKX2s73wBsUi/1yoV/Ecktpb5xmOvyTTdFSjrB
   g==;
X-CSE-ConnectionGUID: NhunmqmdS2u3CDBnugiKXA==
X-CSE-MsgGUID: kQOfI7CiTVGihccXtxb7HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28101881"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="28101881"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 21:32:56 -0700
X-CSE-ConnectionGUID: LkarXZpdT2q/4bYGUhH5Pg==
X-CSE-MsgGUID: y/PaYZP8SYGFSvfLyVE9oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="81412363"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Oct 2024 21:32:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz7Ke-000BnR-1f;
	Fri, 11 Oct 2024 04:32:52 +0000
Date: Fri, 11 Oct 2024 12:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 19/22] drivers/net/veth.c:822: undefined
 reference to `io_iov_get_page'
Message-ID: <202410111209.w3v4hddC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   098709b7d2604bd220e92052936027ed92fcde54
commit: 3cf71f993cbe997b9c05292e0cb322ce1dd70a32 [19/22] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: i386-buildonly-randconfig-004-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111209.w3v4hddC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111209.w3v4hddC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111209.w3v4hddC-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/veth.o: in function `veth_iou_rcv_skb':
>> drivers/net/veth.c:822: undefined reference to `io_iov_get_page'
   ld: drivers/net/veth.o: in function `veth_xdp_rcv.constprop.0':
>> drivers/net/veth.c:995: undefined reference to `io_uring_pp_zc_ops'


vim +822 drivers/net/veth.c

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
