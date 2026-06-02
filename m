Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EA52882D6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 11:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399581; cv=none; b=YBqYpxCIg3ZC9hQSrTEDwsluSM2OHMY9O5r+A2G66I9LqvEk9C4Ym0r6A1APfcMNkH6q1uDdy1B9r0udw9AF97WB1dZjqgdKYFtczswxa5Qh5060FrNbjL7NRVGyP8T3X/e361YowGrV3wF2s+2hC/D9bVm9enhMfVMKxWJ/GtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399581; c=relaxed/simple;
	bh=SovWzJrVxhjkd54T68xOeiapRKjdL6YT7o4UbTQVDlI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gv3WoXvp/05eH++4J7fHVRCtbneQYUhlhJL9tKpKQUL3/rBBicv8aCX8i7s40Da0AIXiyQ32b4P42PXUeYwUD3C1kp5CIs48T94oUC5FJg2vJ1wI93AxsaJGGdIenGX56qJhLNOc+BBL+xEuta5Qpul8X1GmrAaKZ4sRLdBHtVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYcP3wfX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYcP3wfX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780399580; x=1811935580;
  h=date:from:to:cc:subject:message-id;
  bh=SovWzJrVxhjkd54T68xOeiapRKjdL6YT7o4UbTQVDlI=;
  b=FYcP3wfXOfThXwWIUxv3cy4sVwyHGBSF2sQVZuYJWA7+DPGcRhm5GLGf
   h+WNkOvxHT+HYEcanlFXaNQjwSzuwVusJqECd8annF5d+8pSfsy/xpvIS
   6qFzKBpUYVV+9g0ZQstB0+I+5bKBGmCWE2LvKrdKtepiNYW1PRPX7yM72
   fOnW79MHeHjS3U4ZRVUaapcVnwsKxJk+mLKqNVwnSvlrfF44wzfwLsoSb
   saQoqSRpZJmGjdTs3YivhNlrkLJ8kyegForvCJVmkjGQv45RcI83Y8xwN
   LIVPPY0cw/EzHrlJDUkddfVHW64JBoOSNr+73OnI39EMpgedIdiJBOHiH
   A==;
X-CSE-ConnectionGUID: MJ6lgRmrR0WKOp07fITbdA==
X-CSE-MsgGUID: VhZQpd73ThKtf/LqXrmQkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81307524"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81307524"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 04:26:19 -0700
X-CSE-ConnectionGUID: NHn1YwHWSqePrvHGH9pGOg==
X-CSE-MsgGUID: H/sBhlP3SsiyILbXwqWURQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="248806246"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Jun 2026 04:26:18 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUNGB-00000000BwQ-11qg;
	Tue, 02 Jun 2026 11:26:15 +0000
Date: Tue, 02 Jun 2026 19:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-poll-gate 6/10]
 io_uring/bpf-ops.c:142:17: sparse: sparse: symbol 'bpf_io_uring_sock_peek'
 was not declared. Should it be static?
Message-ID: <202606021933.SGRQ327J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-poll-gate
head:   f68fb1822a701c1355ae1325c03185bd4fd34803
commit: 749d9283f7dcbdd1c895677dc758f04ba63d3ec3 [6/10] io_uring/bpf-ops: expose bpf_io_uring_sock_peek kfunc
config: parisc-randconfig-r134-20260530 (https://download.01.org/0day-ci/archive/20260602/202606021933.SGRQ327J-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021933.SGRQ327J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021933.SGRQ327J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/bpf-ops.c:142:17: sparse: sparse: symbol 'bpf_io_uring_sock_peek' was not declared. Should it be static?

vim +/bpf_io_uring_sock_peek +142 io_uring/bpf-ops.c

    21	
  > 22	__bpf_kfunc int bpf_io_uring_submit_sqes(struct io_ring_ctx *ctx, u32 nr)
    23	{
    24		return io_submit_sqes(ctx, nr);
    25	}
    26	
    27	__bpf_kfunc
    28	__u8 *bpf_io_uring_get_region(struct io_ring_ctx *ctx, __u32 region_id,
    29				      const size_t rdwr_buf_size)
    30	{
    31		struct io_mapped_region *r;
    32	
    33		lockdep_assert_held(&ctx->uring_lock);
    34	
    35		switch (region_id) {
    36		case IOU_REGION_MEM:
    37			r = &ctx->param_region;
    38			break;
    39		case IOU_REGION_CQ:
    40			r = &ctx->ring_region;
    41			break;
    42		case IOU_REGION_SQ:
    43			r = &ctx->sq_region;
    44			break;
    45		default:
    46			return NULL;
    47		}
    48	
    49		if (unlikely(rdwr_buf_size > io_region_size(r)))
    50			return NULL;
    51		return io_region_get_ptr(r);
    52	}
    53	
    54	/**
    55	 * bpf_io_uring_sock_state - snapshot TCP receive-queue state for a poll_gate
    56	 * @ev: poll event passed to the struct_ops callback
    57	 * @out: output buffer (must be of type struct io_uring_sock_state)
    58	 * @out__sz: size of the output buffer
    59	 *
    60	 * Fills @out with four lockless fields from the underlying TCP socket:
    61	 *
    62	 *   - inq:        bytes available to read, i.e. tcp_inq() == rcv_nxt -
    63	 *                 copied_seq. Use this to decide whether enough data
    64	 *                 has buffered to satisfy the wire-level protocol frame.
    65	 *
    66	 *   - rcvbuf:     the socket's current receive-buffer cap. May grow
    67	 *                 over time if TCP receive autotuning is enabled (i.e.
    68	 *                 the application did not pin it via setsockopt
    69	 *                 SO_RCVBUF). Note that while a gate is parking the
    70	 *                 recv no copy occurs, so autotuning will not run.
    71	 *
    72	 *   - rmem_alloc: bytes accounted to sk->sk_rmem_alloc - the sum of
    73	 *                 skb->truesize for queued skbs (plus a small amount
    74	 *                 of out-of-order overhead). Includes per-skb meta,
    75	 *                 so always >= inq and can exceed it considerably.
    76	 *
    77	 *   - mss:        receiver's tracked MSS estimate for the peer
    78	 *                 (icsk_ack.rcv_mss), needed to mirror TCP's exact
    79	 *                 zero-window threshold.
    80	 *
    81	 * Deadlock guard (REQUIRED):
    82	 *
    83	 *   A gate that defers until inq >= frame_size will livelock if the
    84	 *   frame is larger than what the socket can buffer: TCP advertises
    85	 *   a zero window when free space drops below max(rcvbuf/16, mss),
    86	 *   the sender stops, and no further poll wakes arrive to re-enter
    87	 *   the gate. The canonical guard mirrors that exact threshold:
    88	 *
    89	 *       __u32 free   = st.rcvbuf - st.rmem_alloc;
    90	 *       __u32 thresh = st.rcvbuf >> 4;
    91	 *       if (st.mss > thresh)
    92	 *           thresh = st.mss;
    93	 *       if (st.inq < target && free < thresh)
    94	 *           return 0;   // fire, frame won't fit
    95	 *
    96	 * Restricted to AF_INET/AF_INET6 + IPPROTO_TCP; other families
    97	 * return -EOPNOTSUPP and the program should fall through.
    98	 *
    99	 * Return: 0 on success with @out populated, negative errno otherwise.
   100	 */
   101	__bpf_kfunc int bpf_io_uring_sock_state(struct io_uring_poll_event *ev,
   102						void *out, u32 out__sz)
   103	{
   104		struct io_uring_poll_event_priv *priv;
   105		struct inet_connection_sock *icsk;
   106		struct io_uring_sock_state st;
   107		struct socket *sock;
   108		struct sock *sk;
   109	
   110		if (!ev || !out)
   111			return -EINVAL;
   112		if (out__sz < sizeof(st))
   113			return -EINVAL;
   114		priv = container_of(ev, struct io_uring_poll_event_priv, pub);
   115		if (!priv->req->file)
   116			return -EINVAL;
   117		sock = sock_from_file(priv->req->file);
   118		if (!sock || !sock->sk)
   119			return -ENOTSOCK;
   120		sk = sock->sk;
   121		if (sk->sk_family != AF_INET && sk->sk_family != AF_INET6)
   122			return -EOPNOTSUPP;
   123		if (sk->sk_protocol != IPPROTO_TCP)
   124			return -EOPNOTSUPP;
   125		icsk = inet_csk(sk);
   126	
   127		st.inq        = tcp_inq(sk);
   128		st.rcvbuf     = READ_ONCE(sk->sk_rcvbuf);
   129		st.rmem_alloc = atomic_read(&sk->sk_rmem_alloc);
   130		st.mss        = READ_ONCE(icsk->icsk_ack.rcv_mss);
   131	
   132		memcpy(out, &st, sizeof(st));
   133		return 0;
   134	}
   135	
   136	/*
   137	 * Peek into a TCP socket's receive queue. Walks sk_receive_queue under its
   138	 * spinlock and copies up to buf__sz bytes starting from the consumer offset
   139	 * (copied_seq) without consuming them.
   140	 * Returns bytes copied, or negative errno. -EAGAIN if the queue is empty.
   141	 */
 > 142	__bpf_kfunc int bpf_io_uring_sock_peek(struct io_uring_poll_event *ev,
   143					       void *buf, u32 buf__sz)
   144	{
   145		struct io_uring_poll_event_priv *priv;
   146		struct socket *sock;
   147		struct sock *sk;
   148		struct sk_buff *skb;
   149		unsigned long flags;
   150		u32 copied_seq, off, copied = 0;
   151		int ret;
   152	
   153		if (!ev || !buf || !buf__sz)
   154			return -EINVAL;
   155		priv = container_of(ev, struct io_uring_poll_event_priv, pub);
   156		if (!priv->req->file)
   157			return -EINVAL;
   158		sock = sock_from_file(priv->req->file);
   159		if (!sock || !sock->sk)
   160			return -ENOTSOCK;
   161		sk = sock->sk;
   162		if (sk->sk_family != AF_INET && sk->sk_family != AF_INET6)
   163			return -EOPNOTSUPP;
   164		if (sk->sk_protocol != IPPROTO_TCP)
   165			return -EOPNOTSUPP;
   166	
   167		copied_seq = READ_ONCE(tcp_sk(sk)->copied_seq);
   168	
   169		spin_lock_irqsave(&sk->sk_receive_queue.lock, flags);
   170		if (skb_queue_empty(&sk->sk_receive_queue)) {
   171			spin_unlock_irqrestore(&sk->sk_receive_queue.lock, flags);
   172			return -EAGAIN;
   173		}
   174		skb = skb_peek(&sk->sk_receive_queue);
   175		off = copied_seq - TCP_SKB_CB(skb)->seq;
   176	
   177		skb_queue_walk(&sk->sk_receive_queue, skb) {
   178			u32 avail, want;
   179	
   180			if (off >= skb->len) {
   181				off -= skb->len;
   182				continue;
   183			}
   184			avail = skb->len - off;
   185			want = min(avail, buf__sz - copied);
   186			ret = skb_copy_bits(skb, off, (u8 *)buf + copied, want);
   187			if (ret < 0)
   188				break;
   189			copied += want;
   190			off = 0;
   191			if (copied >= buf__sz)
   192				break;
   193		}
   194		spin_unlock_irqrestore(&sk->sk_receive_queue.lock, flags);
   195		return copied;
   196	}
   197	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
