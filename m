Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F0045198B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301932; cv=none; b=h4yaDuJ5dFeB6Hn9S9TYAgZ6b1j1/sWr1fKip4HqBpyAjcFkM5FlQg32wK0pCR5a4C99axP1uU9HnQHsPQSnY/Lw1kt2W+PoA94p6i//gOQXFqvnafBfLS3RClwGAYAEgDVs4+sNzKZa5HaW7EowkwSFXz/UQAtqwaCs1UhYCO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301932; c=relaxed/simple;
	bh=aXNdjSgM//Jy3xf9Nkwk7fMwABWwPo+zX+9VUo/kPIg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i9WkOCkUbqzfiI8Rr2PCIMOOvlJHRwi0D21vUuaWucpyfuBpG6ZBX60NULMtDs8wraCxK5HPsIxP/ufnaiPLCEpsBXC/DrnqFAQAhoJD1ZFyzWtgW51leWyWJO4DeWuDtpDZcEZwOs3Mt3uvXYYtyKEeJJl2UsDiyOE+9tZEujM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGOE9yUB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGOE9yUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791301930; x=1822837930;
  h=date:from:to:cc:subject:message-id;
  bh=aXNdjSgM//Jy3xf9Nkwk7fMwABWwPo+zX+9VUo/kPIg=;
  b=CGOE9yUBffZ5LxiQ1YhIfbVPoU8Co5kcblwLd53/WWe1PoTxrMz5Z6Af
   Ecokm1E3cdMCgjsyttmQyUxM4gpVgIfRFnNRRbA5shx7H5ZZDyUXp1UKA
   +mOZVZbb6c/0d4wokr2QB7YEQZOtIsBsC/ieKQLo/Pn0oZiavPCo8GjDt
   Mkt4oiRQShLtnkizVlkRP2PNVq6G4e6zy80BZ7AYu1/W2leJ9IzGAcN4M
   vab5udoGUrczdvkSdPYKyURzwqe2g7YZStu94F8C0J4q4nrVr5UtP377r
   LT7qjd5bfdC0BwHZlISgx+jrf3TOsKnESYcCG3Paf6tBioUiMra4yQcFA
   A==;
X-CSE-ConnectionGUID: PAZNC+FOSsuRAs7tOrPt0A==
X-CSE-MsgGUID: U+vhoUifSVyFHWreeYQu6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="117517210"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="117517210"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 08:52:10 -0700
X-CSE-ConnectionGUID: eNsKdfP7RiKzyJNXKt3u+w==
X-CSE-MsgGUID: Zq5A7pPEQ6uYBfEinyQV/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276711979"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 06 Oct 2026 08:52:09 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE7SY-000000001SZ-3iKl;
	Tue, 06 Oct 2026 15:52:06 +0000
Date: Tue, 06 Oct 2026 17:52:06 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp 23/41] net/ipv4/tcp_xdp.c:207:11:
 warning: assignment to 'sk_buff_data_t' {aka 'unsigned char *'} from
 'unsigned int' makes pointer from integer without a cast
Message-ID: <202610061748.HmqAPwtR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux xdp-tcp
head:   98ba2e45e6a3e93f19f6579031bd9e6995b9ca4c
commit: 58e507a65c23a2eae4fb2c22568f97c57f661df0 [23/41] tcp: Add XDP fast-path kfuncs for established connections
config: arm-randconfig-r2200-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061748.HmqAPwtR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061748.HmqAPwtR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061748.HmqAPwtR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/tcp_xdp.c: In function 'bpf_xdp_tcp_consume':
>> net/ipv4/tcp_xdp.c:207:11: warning: assignment to 'sk_buff_data_t' {aka 'unsigned char *'} from 'unsigned int' makes pointer from integer without a cast [-Wint-conversion]
     skb->end = offsetof(typeof(fake), shinfo) - offsetof(typeof(fake), hdr);
              ^
>> net/ipv4/tcp_xdp.c:208:12: warning: assignment to 'sk_buff_data_t' {aka 'unsigned char *'} from 'u32' {aka 'unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     skb->tail = hlen;
               ^


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
