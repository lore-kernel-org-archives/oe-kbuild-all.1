Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBAC3C1092
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 10:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281153; cv=none; b=AUwcwBOVVwp6rS70qArn2y+zVhqyixeifY0S1i7Q2tVegOwJdjaamTXeJl7Pw/g2Fh2BMiBHckbRF/SRdMBIsyv/rLzzZwgTM8oC98v/w16MQTA4ri9wMSixnrhhfKDwAo8GmVL1zrGZ7Iwbr2a+z5BvsB/kcUbAv1JvsBZlFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281153; c=relaxed/simple;
	bh=ecjg4/EYhtpAnxKrfgO80t64gYRO8mMsWIu/fyWK7So=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J9EoNUozZIo3b2b5XNm9eCmSAX2q8Sg7N+/O8GaCM0G4ybHquZJJ0px8MKKJA/e7oyc8p2mMqxe0mdFow4bWC5rAYPtbBDy74ulW+Wn/nlYN04VZim+4l9l0tObf15FFPvLoSYCdSiX+nuNQwQFQKsiYcIiiUdTzabisBF0DVvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2AemefO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2AemefO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791281152; x=1822817152;
  h=date:from:to:cc:subject:message-id;
  bh=ecjg4/EYhtpAnxKrfgO80t64gYRO8mMsWIu/fyWK7So=;
  b=M2AemefOTKaiAa4zgqYKq+R8wSN5Ne7hRf4oUIGYhs/kLnByKXyPvv6A
   V8Ub6xdQ3KKlM/Mk1AYHvwM4/zLN8Pc6LoyEdY4hO5XYc/S3LMBVQp+hd
   VpNLqgJbPFW9fyt0qMi5pEmQxIU2DCef6jfCEzewi4GTAE1YRNiywyyTg
   mk7KOU6PE721C5X5/K5H+qNkbWB4/UfC/CYyR7dhW5d1uyFx40dx+57Gn
   LUiRrt0GriYxKWuboyx9ympUiKQlhiU67eT5wh9d+CvKNuVPG4fiKoIeg
   I3bv1PgXKXpoS4iGa6M0RJnpTjGFNVwFP0RIEXwJ4JvaSnu9gnwRATAK4
   Q==;
X-CSE-ConnectionGUID: HCtcQNxlQcSAWfRDUfDuSA==
X-CSE-MsgGUID: 5+5u+XQ8Q8+iGv5vroqbfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="20474"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="20474"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 03:05:52 -0700
X-CSE-ConnectionGUID: lDeu/zG6SCalP2vAxhFiCA==
X-CSE-MsgGUID: UMZ7qmWpRyWmpRsHiQWXug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="275768652"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 06 Oct 2026 03:05:50 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE23Q-0000000015D-1fWu;
	Tue, 06 Oct 2026 10:05:48 +0000
Date: Tue, 06 Oct 2026 12:05:33 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp-round4-backup 20/42]
 net/ipv4/tcp_xdp.c:207:11: error: incompatible integer to pointer conversion
 assigning to 'sk_buff_data_t' (aka 'unsigned char *') from '__size_t' (aka
 'unsigned int')
Message-ID: <202610061205.4m1dnkvU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux xdp-tcp-round4-backup
head:   63925314fb03ace1f3949a09d298cfdc0188bc8a
commit: 9d4e1ff1e73f3bafe3089f67321c182f10247469 [20/42] tcp: Add XDP fast-path kfuncs for established connections
config: mips-randconfig-r2303-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061205.4m1dnkvU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project dbeca9a3a3ba0b46471efb339b0ea8f2194f6f68)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061205.4m1dnkvU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061205.4m1dnkvU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ipv4/tcp_xdp.c:207:11: error: incompatible integer to pointer conversion assigning to 'sk_buff_data_t' (aka 'unsigned char *') from '__size_t' (aka 'unsigned int') [-Wint-conversion]
     207 |         skb->end = offsetof(typeof(fake), shinfo) - offsetof(typeof(fake), hdr);
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/ipv4/tcp_xdp.c:208:12: error: incompatible integer to pointer conversion assigning to 'sk_buff_data_t' (aka 'unsigned char *') from 'u32' (aka 'unsigned int') [-Wint-conversion]
     208 |         skb->tail = hlen;
         |                   ^ ~~~~
   2 errors generated.


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
