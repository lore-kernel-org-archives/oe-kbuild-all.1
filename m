Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16E43B9927
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 05:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438026; cv=none; b=G7Zb/e0zj5gmAJUwqTh7draRcB2n1b3Lj+qn+L+33bfhEO0JVfMMt1ddPUo/ANpJ+DJA8wBgscK1FHn1A/r9bshb9CIGrElwALRaZJz7QK+3S9VUU5EFo5YhJAf90UuIyuMyyFVE5byx8g05/cHHK7j2KEOPMwYLoXD7yHh7ka4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438026; c=relaxed/simple;
	bh=kHI1LbCIO5iq9N9fkkKzT8zKiueznbUOrfpiEiPuP5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XsTSetjDigZ2SiydanJa/K85YW43yHQAG5sNyv2FP/ARepNKFoZY6TeVPwjWV4FCAD/TgRzEB+x/QrXD59nqZ4OXkqWba0e+umq/GEYN8HCSfr3Hx+WLauabibncm1WdNQYD0oxWj5oORwWVTXwmXrnHUPP/UF3AoSids0+YQ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNoHivTk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNoHivTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791438025; x=1822974025;
  h=date:from:to:cc:subject:message-id;
  bh=kHI1LbCIO5iq9N9fkkKzT8zKiueznbUOrfpiEiPuP5Q=;
  b=KNoHivTk3j8/8kpt2vtqDLOz7ucUSm04re1o9KuixzweLiZfsl+BEuN4
   qLQO2R3+dfzvx25yDF3A05hHtbap5dY2mmnmtdSWuTljY4msVmMHLNzZD
   xQ1FaDVQCCHJVSVbEEBmsR6mUazi6TLCD6Cveexh1Y3x/+m5LpH9eW/+u
   +euVeQqBHyZ5NT/pypUCx4vbT1yykwaVf+IKODD9mI5qbvwzwUsXP7MHI
   0feeDHGgzmwGAagLemWNxIYN+FdmHCIEG6VdUd6xrZTyyJOYBnw1hlPGN
   6QlatlYkgl56E8JWIjaph95Lj3mQPH+yyy5OUcQXAt2tqN1JXDmOr8t6r
   g==;
X-CSE-ConnectionGUID: ucsE4/gVSh2gvlamYxv15Q==
X-CSE-MsgGUID: pm1qtm2hQRSf3W2EF94NOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="92930"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="92930"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 22:40:24 -0700
X-CSE-ConnectionGUID: v1b2JiavTw6a2YX3xjbbWQ==
X-CSE-MsgGUID: D1pTSZAHSEW3xI58MNYqVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="360299"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 07 Oct 2026 22:40:23 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEgrc-000000004sE-46P9;
	Thu, 08 Oct 2026 05:40:20 +0000
Date: Thu, 08 Oct 2026 07:39:30 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp-round4-backup 20/42]
 net/ipv4/tcp_xdp.c:207:18: error: assignment to 'sk_buff_data_t' {aka
 'unsigned char *'} from 'unsigned int' makes pointer from integer without a
 cast
Message-ID: <202610080715.r9yLIPu2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux xdp-tcp-round4-backup
head:   63925314fb03ace1f3949a09d298cfdc0188bc8a
commit: 9d4e1ff1e73f3bafe3089f67321c182f10247469 [20/42] tcp: Add XDP fast-path kfuncs for established connections
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261008/202610080715.r9yLIPu2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080715.r9yLIPu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080715.r9yLIPu2-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp_xdp.c: In function 'bpf_xdp_tcp_consume':
>> net/ipv4/tcp_xdp.c:207:18: error: assignment to 'sk_buff_data_t' {aka 'unsigned char *'} from 'unsigned int' makes pointer from integer without a cast [-Wint-conversion]
     207 |         skb->end = offsetof(typeof(fake), shinfo) - offsetof(typeof(fake), hdr);
         |                  ^
>> net/ipv4/tcp_xdp.c:208:19: error: assignment to 'sk_buff_data_t' {aka 'unsigned char *'} from 'u32' {aka 'unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     208 |         skb->tail = hlen;
         |                   ^


vim +207 net/ipv4/tcp_xdp.c

   163	
   164	/**
   165	 * bpf_xdp_tcp_consume - apply an in-order data segment to its connection
   166	 * @sk: the socket from bpf_xdp_tcp_lookup()
   167	 * @ctx: the frame
   168	 * @info: as filled by bpf_xdp_tcp_lookup()
   169	 *
   170	 * Under the socket lock, takes the segment as tcp_rcv_established()'s fast
   171	 * path would, with the payload counted as received and read rather than
   172	 * queued for the application. The program must then drop the frame and is
   173	 * responsible for answering it. Returns 0, or -EAGAIN when the socket is
   174	 * owned by its user or the segment no longer fits the fast path: the frame
   175	 * then belongs to the stack (XDP_PASS). The response must fit the socket's
   176	 * send buffer: -ENOBUFS says it would not.
   177	 */
   178	__bpf_kfunc int bpf_xdp_tcp_consume(struct sock *sk, struct xdp_md *ctx,
   179					    struct bpf_xdp_tcp_info *info)
   180	{
   181		struct xdp_buff *xdp = (struct xdp_buff *)ctx;
   182		struct {
   183			struct sk_buff skb;
   184			u8 hdr[64] __aligned(8);
   185			struct skb_shared_info shinfo;
   186		} fake;
   187		struct sk_buff *skb = &fake.skb;
   188		struct tcp_sock *tp = tcp_sk(sk);
   189		struct xdp_tcp_hdrs h;
   190		const struct tcphdr *th;
   191		u32 hlen, seq, end_seq;
   192		bool ts_progress = false;
   193		int err = -EAGAIN;
   194		s32 delta = 0;
   195	
   196		if (!xdp_tcp_parse(xdp, &h))
   197			return -EINVAL;
   198		th = h.th;
   199		hlen = th->doff * 4;
   200		seq = ntohl(th->seq);
   201		end_seq = seq + h.payload_len;
   202	
   203		memset(&fake, 0, sizeof(fake));
   204		memcpy(fake.hdr, th, hlen);
   205		skb->head = fake.hdr;
   206		skb->data = fake.hdr + hlen;
 > 207		skb->end = offsetof(typeof(fake), shinfo) - offsetof(typeof(fake), hdr);
 > 208		skb->tail = hlen;
   209		skb->len = h.payload_len;
   210		skb->truesize = SKB_TRUESIZE(h.payload_len + hlen);
   211		skb_reset_transport_header(skb);
   212		skb->transport_header = 0;
   213		skb->protocol = htons(ETH_P_IP);
   214		TCP_SKB_CB(skb)->seq = seq;
   215		TCP_SKB_CB(skb)->end_seq = end_seq;
   216		TCP_SKB_CB(skb)->ack_seq = ntohl(th->ack_seq);
   217		TCP_SKB_CB(skb)->tcp_flags = tcp_flags_ntohs(th);
   218		TCP_SKB_CB(skb)->ip_dsfield = ipv4_get_dsfield(h.iph);
   219		TCP_SKB_CB(skb)->sacked = 0;
   220	
   221		bh_lock_sock_nested(sk);
   222		if (sock_owned_by_user(sk) || sk->sk_state != TCP_ESTABLISHED)
   223			goto out;
   224		tcp_mstamp_refresh_inline(tp);
   225		tp->rx_opt.saw_tstamp = 0;
   226		tp->rx_opt.accecn = 0;
   227		if (!xdp_tcp_fast_ok(tp, th, h.payload_len))
   228			goto out;
   229		if (tp->tcp_header_len == sizeof(struct tcphdr) + TCPOLEN_TSTAMP_ALIGNED) {
   230			if (!tcp_parse_aligned_timestamp(tp, th))
   231				goto out;
   232			delta = tp->rx_opt.rcv_tsval - tp->rx_opt.ts_recent;
   233			if (delta < 0)
   234				goto out;
   235		}
   236		/* The answer has to fit, since the segment cannot be handed back later. */
   237		if (!sk_stream_memory_free(sk)) {
   238			err = -ENOBUFS;
   239			goto out;
   240		}
   241	
   242		if (tp->tcp_header_len == sizeof(struct tcphdr) + TCPOLEN_TSTAMP_ALIGNED &&
   243		    tp->rcv_nxt == tp->rcv_wup)
   244			ts_progress = tcp_xdp_replace_ts_recent(tp, delta);
   245		tcp_rcv_rtt_measure_ts(sk, skb);
   246		NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPHPHITS);
   247		tcp_ecn_received_counters(sk, skb, h.payload_len);
   248	
   249		/* Received and read by the program, so nothing is queued. */
   250		tcp_rcv_nxt_update(tp, end_seq);
   251		WRITE_ONCE(tp->copied_seq, end_seq);
   252		tcp_event_data_recv(sk, skb);
   253	
   254		if (TCP_SKB_CB(skb)->ack_seq != tp->snd_una ||
   255		    (tcp_flag_word(th) & XDP_TCP_HP_BITS) != tp->pred_flags) {
   256			/* The slow-path flag makes tcp_ack() take a window change. */
   257			tcp_xdp_ack(sk, skb, ts_progress);
   258			if (!inet_csk_ack_scheduled(sk))
   259				goto done;
   260		} else {
   261			tcp_update_wl(tp, seq);
   262		}
   263		__tcp_ack_snd_check(sk, 0);
   264	done:
   265		err = 0;
   266	out:
   267		bh_unlock_sock(sk);
   268		return err;
   269	}
   270	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
