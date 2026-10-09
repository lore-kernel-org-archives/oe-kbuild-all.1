Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745234A7CA0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547682; cv=none; b=uV1rZbpyleoD/zIQAhmqvdvyggo7ukCTxdnfn1RBGDW/LjtGOr8HD4edc962nGBZweeimmiuObIlUINzaP97XytEn7qsxBgY8ED7oaL9UzkCwBk2CWhmhhYQunyFdUYkI9HTkBsXcbZSs10nv+XJhuEAKrmhuwlSGIrnTj1gZMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547682; c=relaxed/simple;
	bh=w4BeUihv2cHpqARs+gZ0MvgRfl6zYSaTi179qYOc0tg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fT9SQvSl1sXvPqLPCz5T5QLf2IUtKDDk8+MtIHoYSF8SLg4GSInBvqQiGOq2jZmKfXcV3ukezgYUPiGT3kddzhGBKY5TKTn0LrgPb+lzNCG63XICHZg/r8FT6HTrMW3Rt1frzpjxffONZyRXMjY1R/trQqZGQ2fYUIsRchcz1zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNn46yhS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNn46yhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791547677; x=1823083677;
  h=date:from:to:cc:subject:message-id;
  bh=w4BeUihv2cHpqARs+gZ0MvgRfl6zYSaTi179qYOc0tg=;
  b=gNn46yhS+kDVtCxh80QEPXq7RQgbyGfRh2D0KXh8OHvoxlr8kvqgKsgD
   1gHyK2bw+SuHY2rbOflyu3i0JiQyV6zgfCCjsf8Q94oK2i+COMAyzdEpC
   w3031aMTYe/BJthMGESk3nm+eHVy32bZrrw+vHKqFjKffV7uByy6MLnsn
   hilzd0FVOp9pWMeg92RHtfSQwKozWGI8Y1jc8nimU1iGM6KXyuC4Wz8r/
   sZh+Q0KHBWfmo3QC+nJPKTkL6Xg7FFq8kHD7n6iBBx+3kRYbaS3u1nQ/k
   FQEImppMv4HKcd7U4aRswSHaXh3ksJfeNGv6FjpQtbrS7jyBQbcQqXy+l
   Q==;
X-CSE-ConnectionGUID: o00auLNIRYWNV0deJxakrg==
X-CSE-MsgGUID: njT8nPuyRhW6chw5G5Rhaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="231838"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="231838"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:07:56 -0700
X-CSE-ConnectionGUID: cXCCHR4eQ72UGo0dr4Tf1w==
X-CSE-MsgGUID: YsCGC+q2SxK1QThZM36DIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="657983"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 09 Oct 2026 05:07:54 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF9OC-0000000071P-13fV;
	Fri, 09 Oct 2026 12:07:52 +0000
Date: Fri, 09 Oct 2026 14:06:56 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp 27/44] net/ipv4/tcp.c:3445:undefined
 reference to `tcp_xdp_disconnect'
Message-ID: <202610091456.loit4oK0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux xdp-tcp
head:   82fde2d34c9c284bba8b2df97ac7f7ab34719853
commit: 9cf0ff35d7d930f7d54bc29857ae0f820b208a09 [27/44] tcp: Send a served connection's segments on a lean path of their own
config: x86_64-randconfig-r2304-20261009 (https://download.01.org/0day-ci/archive/20261009/202610091456.loit4oK0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091456.loit4oK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091456.loit4oK0-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/ipv4/tcp.o: in function `tcp_disconnect':
>> net/ipv4/tcp.c:3445:(.text+0x1ac7c): undefined reference to `tcp_xdp_disconnect'


vim +3445 net/ipv4/tcp.c

  3360	
  3361	int tcp_disconnect(struct sock *sk, int flags)
  3362	{
  3363		struct inet_sock *inet = inet_sk(sk);
  3364		struct inet_connection_sock *icsk = inet_csk(sk);
  3365		struct tcp_sock *tp = tcp_sk(sk);
  3366		int old_state = sk->sk_state;
  3367		struct request_sock *req;
  3368		u32 seq;
  3369	
  3370		if (old_state != TCP_CLOSE)
  3371			tcp_set_state(sk, TCP_CLOSE);
  3372	
  3373		/* ABORT function of RFC793 */
  3374		if (old_state == TCP_LISTEN) {
  3375			inet_csk_listen_stop(sk);
  3376		} else if (unlikely(tp->repair)) {
  3377			WRITE_ONCE(sk->sk_err, ECONNABORTED);
  3378		} else if (tcp_need_reset(old_state)) {
  3379			tcp_send_active_reset(sk, SK_RST_REASON_TCP_STATE);
  3380			WRITE_ONCE(sk->sk_err, ECONNRESET);
  3381		} else if (tp->snd_nxt != tp->write_seq &&
  3382			   (1 << old_state) & (TCPF_CLOSING | TCPF_LAST_ACK)) {
  3383			/* The last check adjusts for discrepancy of Linux wrt. RFC
  3384			 * states
  3385			 */
  3386			tcp_send_active_reset(sk,
  3387					      SK_RST_REASON_TCP_DISCONNECT_WITH_DATA);
  3388			WRITE_ONCE(sk->sk_err, ECONNRESET);
  3389		} else if (old_state == TCP_SYN_SENT)
  3390			WRITE_ONCE(sk->sk_err, ECONNRESET);
  3391	
  3392		tcp_clear_xmit_timers(sk);
  3393		__skb_queue_purge(&sk->sk_receive_queue);
  3394		WRITE_ONCE(tp->copied_seq, tp->rcv_nxt);
  3395		WRITE_ONCE(tp->urg_data, 0);
  3396		sk_set_peek_off(sk, -1);
  3397		tcp_write_queue_purge(sk);
  3398		tcp_fastopen_active_disable_ofo_check(sk);
  3399		skb_rbtree_purge(&tp->out_of_order_queue);
  3400	
  3401		inet->inet_dport = 0;
  3402	
  3403		inet_bhash2_reset_saddr(sk);
  3404	
  3405		WRITE_ONCE(sk->sk_shutdown, 0);
  3406		sock_reset_flag(sk, SOCK_DONE);
  3407		tp->srtt_us = 0;
  3408		tp->mdev_us = jiffies_to_usecs(TCP_TIMEOUT_INIT);
  3409		tp->rcv_rtt_last_tsecr = 0;
  3410	
  3411		seq = tp->write_seq + tp->max_window + 2;
  3412		if (!seq)
  3413			seq = 1;
  3414		WRITE_ONCE(tp->write_seq, seq);
  3415	
  3416		icsk->icsk_backoff = 0;
  3417		WRITE_ONCE(icsk->icsk_probes_out, 0);
  3418		icsk->icsk_probes_tstamp = 0;
  3419		icsk->icsk_rto = TCP_TIMEOUT_INIT;
  3420		WRITE_ONCE(icsk->icsk_rto_min, TCP_RTO_MIN);
  3421		WRITE_ONCE(icsk->icsk_delack_max, TCP_DELACK_MAX);
  3422		WRITE_ONCE(tp->snd_ssthresh, TCP_INFINITE_SSTHRESH);
  3423		tcp_snd_cwnd_set(tp, TCP_INIT_CWND);
  3424		tp->snd_cwnd_cnt = 0;
  3425		tp->is_cwnd_limited = 0;
  3426		tp->max_packets_out = 0;
  3427		tp->window_clamp = 0;
  3428		tp->delivered = 0;
  3429		tp->delivered_ce = 0;
  3430		tp->accecn_fail_mode = 0;
  3431		tp->saw_accecn_opt = TCP_ACCECN_OPT_NOT_SEEN;
  3432		tcp_accecn_init_counters(tp);
  3433		tp->prev_ecnfield = 0;
  3434		tp->accecn_opt_tstamp = 0;
  3435		tp->pkts_acked_ewma = 0;
  3436		if (icsk->icsk_ca_initialized && icsk->icsk_ca_ops->release)
  3437			icsk->icsk_ca_ops->release(sk);
  3438		memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
  3439		icsk->icsk_ca_initialized = 0;
  3440		tcp_set_ca_state(sk, TCP_CA_Open);
  3441		tp->is_sack_reneg = 0;
  3442		tcp_clear_retrans(tp);
  3443		tp->total_retrans = 0;
  3444		inet_csk_delack_init(sk);
> 3445		tcp_xdp_disconnect(sk);
  3446		/* Initialize rcv_mss to TCP_MIN_MSS to avoid division by 0
  3447		 * issue in __tcp_select_window()
  3448		 */
  3449		icsk->icsk_ack.rcv_mss = TCP_MIN_MSS;
  3450		memset(&tp->rx_opt, 0, sizeof(tp->rx_opt));
  3451		__sk_dst_reset(sk);
  3452		dst_release(unrcu_pointer(xchg(&sk->sk_rx_dst, NULL)));
  3453		tcp_saved_syn_free(tp);
  3454		tp->compressed_ack = 0;
  3455		tp->segs_in = 0;
  3456		tp->segs_out = 0;
  3457		tp->bytes_sent = 0;
  3458		tp->bytes_acked = 0;
  3459		tp->bytes_received = 0;
  3460		tp->bytes_retrans = 0;
  3461		tp->data_segs_in = 0;
  3462		tp->data_segs_out = 0;
  3463		tp->duplicate_sack[0].start_seq = 0;
  3464		tp->duplicate_sack[0].end_seq = 0;
  3465		tp->dsack_dups = 0;
  3466		tp->reord_seen = 0;
  3467		tp->retrans_out = 0;
  3468		tp->sacked_out = 0;
  3469		tp->tlp_high_seq = 0;
  3470		tp->last_oow_ack_time = 0;
  3471		tp->plb_rehash = 0;
  3472		/* There's a bubble in the pipe until at least the first ACK. */
  3473		tp->app_limited = ~0U;
  3474		tp->rate_app_limited = 1;
  3475		tp->rack.mstamp = 0;
  3476		tp->rack.advanced = 0;
  3477		tp->rack.reo_wnd_steps = 1;
  3478		tp->rack.last_delivered = 0;
  3479		tp->rack.reo_wnd_persist = 0;
  3480		tp->rack.dsack_seen = 0;
  3481		tp->syn_data_acked = 0;
  3482		tp->syn_fastopen_child = 0;
  3483		tp->rx_opt.saw_tstamp = 0;
  3484		tp->rx_opt.dsack = 0;
  3485		tp->rx_opt.num_sacks = 0;
  3486		tp->rcv_ooopack = 0;
  3487	
  3488	
  3489		/* Clean up fastopen related fields */
  3490		req = rcu_dereference_protected(tp->fastopen_rsk,
  3491						lockdep_sock_is_held(sk));
  3492		if (req)
  3493			reqsk_fastopen_remove(sk, req, false);
  3494		tcp_free_fastopen_req(tp);
  3495		inet_clear_bit(DEFER_CONNECT, sk);
  3496		tp->fastopen_client_fail = 0;
  3497	
  3498		WARN_ON(inet->inet_num && !icsk->icsk_bind_hash);
  3499	
  3500		if (sk->sk_frag.page) {
  3501			put_page(sk->sk_frag.page);
  3502			sk->sk_frag.page = NULL;
  3503			sk->sk_frag.offset = 0;
  3504		}
  3505		sk_error_report(sk);
  3506		return 0;
  3507	}
  3508	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
