Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334F228FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 18:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726251317; cv=none; b=TWEd4GYWPQJRKMHhhvk3BOmF2+d8MrNa7cgpcCCLkXGDDJNWGDqmfxGf0Goda3hxr+2ydT2SDkk3p6n6cyR/GBpgWxa7Cb7mL9JYf6203lYdkkStYrYbuMvXWaSMKuYF466g+RzeVGNmWdbpm1eEbPEOGZsSFLCp4rop3wYyrHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726251317; c=relaxed/simple;
	bh=WmRu5AGrxpECGmkA8B6lBjmFkfAm4gYWUl8fSBHX98w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D2P0itS9ZO8rgDJLakytNbi7c046o/MZF9EeALVwMVTL3rfPGRIX2ioKFukW67WR2VcdsJR1BxVRGUmSRmjQ3veDvCE1ktW+P8zU78Eq8bGNEaK47OFRhTgEMn4OTBrvxCl8HBbMRklgJgcreRV2oqWQ93MfX2oykahYXQ94jWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dm2l1ME8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dm2l1ME8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726251315; x=1757787315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WmRu5AGrxpECGmkA8B6lBjmFkfAm4gYWUl8fSBHX98w=;
  b=dm2l1ME82hNRri479SjbNW2zxdlGt+a6AQ/55nLnA7FltMtvzJcFyTU4
   0WvZvvnZYRn+i20pPEOza57eYsiurDq25AQjsfZRrjPVJRUQqy2lOZ/FY
   e64IlktZyVXTpBGYXm95UEH3cfpWxdTvDRKeb97K646v9q720kWIoR2fx
   YLg/Pgvq0FcNNQH/1hck9xG/xDEQe5qUX5AMHQeaL7rS4E67tfZFVtX7c
   usGNZUQrmT57p3Alsqa9qScpZRdzRtTErpxvO0Ct80Ty20WVboRylexx+
   VyoztExw8oSkczQfsl4/0IcIxkhb7q7h0yt4Aada6B4vC7wQ38P2GQ4lz
   g==;
X-CSE-ConnectionGUID: rwRPUFTtRKGm4Mgx8KFlPg==
X-CSE-MsgGUID: 264aq5j/T66DsZBcfJkBwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35738628"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="35738628"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 11:15:15 -0700
X-CSE-ConnectionGUID: SlpRrfw+R0+H0VtOLw+ytQ==
X-CSE-MsgGUID: h03MyCirR9Knl6kb4+IYzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68249951"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Sep 2024 11:15:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spAp5-0006oD-1Z;
	Fri, 13 Sep 2024 18:15:11 +0000
Date: Sat, 14 Sep 2024 02:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 33/35] drivers/net/veth.c:822:10: error: call to
 undeclared function 'io_iov_get_page'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202409140224.twAuKFUn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   4d31aa773b51854a28e098e1f4f74a4cf0701069
commit: cdfd97c82b8f1364dc8b22dc903cacfd4bf2cbe4 [33/35] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: x86_64-randconfig-014-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140224.twAuKFUn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140224.twAuKFUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140224.twAuKFUn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/veth.c:822:10: error: call to undeclared function 'io_iov_get_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     822 |                 page = io_iov_get_page(netmem);
         |                        ^
>> drivers/net/veth.c:822:8: error: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
     822 |                 page = io_iov_get_page(netmem);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/veth.c:995:34: error: use of undeclared identifier 'io_uring_pp_zc_ops'
     995 |                         if (rq->page_pool->mp_ops == &io_uring_pp_zc_ops) {
         |                                                       ^
   drivers/net/veth.c:1150:7: warning: variable 'nr' set but not used [-Wunused-but-set-variable]
    1150 |                 int nr = 0;
         |                     ^
   1 warning and 3 errors generated.


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
