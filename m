Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1997539E9AC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 12:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791118545; cv=none; b=F3YctvRUcJjromgv5p/mjcMeWgYq8BmntaZiWc1lgDotJXLm9xnYQb9FIzXpLeMQfPxq0/JSXwwitT3456rzkddUtVk3Nyp/OXyFIxyDhaKIdnCHYsW+lDkj5MGMW/+m/wzUTvL91w3feR94pLpd/4cGZNgzmOxbZdekYpsI+zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791118545; c=relaxed/simple;
	bh=yZDdkPkWG3QJh5WhfO/gGuJu0HFdByYizzSj+/YM3lw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gfjryhCLYZTEobou/C4Uhp4eb6viMFH9fwL/WHFGyaLzvAHFdkNpwrPWTkLdzT2czBH+fmCUVwXXB8Sjg3NVcbW6pi2bme+4cYBGJD977LRpUj2GvRYmi1kClFotlFGnzZvJ+tRQ7Sry6pgROj5fD3yd7MPCCNrSySPmjk4VBoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTnlebBv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTnlebBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791118543; x=1822654543;
  h=date:from:to:cc:subject:message-id;
  bh=yZDdkPkWG3QJh5WhfO/gGuJu0HFdByYizzSj+/YM3lw=;
  b=aTnlebBvcv5v4ksvCIKOek7uTCV7BCy2S6zoQfTGiSnX/QXDTdRSyszi
   maHGtRiQwIGqQSBFmVwEvtbROHSeXZlqIfBbOczLgZYa/miU6I0IE7sMY
   YRIoSzwZg1hpONjEKpfFW0vzDjN+fz9xMU/1DcpLhiIdVbJgTN5LWOL4Y
   870ncBBIIWs8QaU9+T0mdRodRUJjcvngb1pNWr4euahZcoBZvmYz4gRPt
   +mxhlq/5BtAG/CBQIUdqpkPcWJt6hD53k7N6wtpPvIfYgGGu+xkpuJAQM
   zcVdzvHaWxKKs5ypvL/bBurq2IDBbrhjqQjRWGPLbh9P2OvCINQUdn7bA
   g==;
X-CSE-ConnectionGUID: u9087rxbSei8dTj9jbr0lQ==
X-CSE-MsgGUID: RW0/cb6UQzClXxW4G2pLQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91833562"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="91833562"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 05:55:42 -0700
X-CSE-ConnectionGUID: wWI/1XEcRNG8fM6wWEBPoA==
X-CSE-MsgGUID: 39kPDf4JRi6FTvf5gGch9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="279870936"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Oct 2026 05:55:41 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDLkg-000000000IF-4Aqh;
	Sun, 04 Oct 2026 12:55:39 +0000
Date: Sun, 04 Oct 2026 14:54:43 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 41/49] net/ipv4/tcp_input.c:8020:11:
 error: incompatible integer to pointer conversion assigning to
 'sk_buff_data_t' (aka 'unsigned char *') from '__size_t' (aka 'unsigned int')
Message-ID: <202610041437.DUQp3wL2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   babde5051be3840becf5a78de91a0b68a99f0e49
commit: ed7104db7e0a960eaf9b230f7cc1ffdea582b4b3 [41/49] tcp: Add XDP fast-path kfuncs for established connections
config: i386-randconfig-2200-20261001 (https://download.01.org/0day-ci/archive/20261004/202610041437.DUQp3wL2-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041437.DUQp3wL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041437.DUQp3wL2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ipv4/tcp_input.c:8020:11: error: incompatible integer to pointer conversion assigning to 'sk_buff_data_t' (aka 'unsigned char *') from '__size_t' (aka 'unsigned int') [-Wint-conversion]
    8020 |         skb->end = offsetof(typeof(fake), shinfo) - offsetof(typeof(fake), hdr);
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/ipv4/tcp_input.c:8021:12: error: incompatible integer to pointer conversion assigning to 'sk_buff_data_t' (aka 'unsigned char *') from 'u32' (aka 'unsigned int') [-Wint-conversion]
    8021 |         skb->tail = hlen;
         |                   ^ ~~~~
   2 errors generated.


vim +8020 net/ipv4/tcp_input.c

  7977	
  7978	/**
  7979	 * bpf_xdp_tcp_consume - apply an in-order data segment to its connection
  7980	 * @sk: the socket from bpf_xdp_tcp_lookup()
  7981	 * @ctx: the frame
  7982	 * @info: as filled by bpf_xdp_tcp_lookup()
  7983	 *
  7984	 * Under the socket lock, takes the segment as tcp_rcv_established()'s fast
  7985	 * path would, with the payload counted as received and read rather than
  7986	 * queued for the application. The program must then drop the frame and is
  7987	 * responsible for answering it. Returns 0, or -EAGAIN when the socket is
  7988	 * owned by its user or the segment no longer fits the fast path: the frame
  7989	 * then belongs to the stack (XDP_PASS). The response must fit the socket's
  7990	 * send buffer: -ENOBUFS says it would not.
  7991	 */
  7992	__bpf_kfunc int bpf_xdp_tcp_consume(struct sock *sk, struct xdp_md *ctx,
  7993					    struct bpf_xdp_tcp_info *info)
  7994	{
  7995		struct xdp_buff *xdp = (struct xdp_buff *)ctx;
  7996		struct {
  7997			struct sk_buff skb;
  7998			u8 hdr[64] __aligned(8);
  7999			struct skb_shared_info shinfo;
  8000		} fake;
  8001		struct sk_buff *skb = &fake.skb;
  8002		struct tcp_sock *tp = tcp_sk(sk);
  8003		struct xdp_tcp_hdrs h;
  8004		const struct tcphdr *th;
  8005		u32 hlen, seq, end_seq;
  8006		int flag = 0, err = -EAGAIN;
  8007		s32 delta = 0;
  8008	
  8009		if (!xdp_tcp_parse(xdp, &h))
  8010			return -EINVAL;
  8011		th = h.th;
  8012		hlen = th->doff * 4;
  8013		seq = ntohl(th->seq);
  8014		end_seq = seq + h.payload_len;
  8015	
  8016		memset(&fake, 0, sizeof(fake));
  8017		memcpy(fake.hdr, th, hlen);
  8018		skb->head = fake.hdr;
  8019		skb->data = fake.hdr + hlen;
> 8020		skb->end = offsetof(typeof(fake), shinfo) - offsetof(typeof(fake), hdr);
> 8021		skb->tail = hlen;
  8022		skb->len = h.payload_len;
  8023		skb->truesize = SKB_TRUESIZE(h.payload_len + hlen);
  8024		skb_reset_transport_header(skb);
  8025		skb->transport_header = 0;
  8026		skb->protocol = htons(ETH_P_IP);
  8027		TCP_SKB_CB(skb)->seq = seq;
  8028		TCP_SKB_CB(skb)->end_seq = end_seq;
  8029		TCP_SKB_CB(skb)->ack_seq = ntohl(th->ack_seq);
  8030		TCP_SKB_CB(skb)->tcp_flags = tcp_flags_ntohs(th);
  8031		TCP_SKB_CB(skb)->ip_dsfield = ipv4_get_dsfield(h.iph);
  8032		TCP_SKB_CB(skb)->sacked = 0;
  8033	
  8034		bh_lock_sock_nested(sk);
  8035		if (sock_owned_by_user(sk) || sk->sk_state != TCP_ESTABLISHED)
  8036			goto out;
  8037		tcp_mstamp_refresh_inline(tp);
  8038		tp->rx_opt.saw_tstamp = 0;
  8039		tp->rx_opt.accecn = 0;
  8040		if (!xdp_tcp_fast_ok(tp, th, h.payload_len))
  8041			goto out;
  8042		if (tp->tcp_header_len == sizeof(struct tcphdr) + TCPOLEN_TSTAMP_ALIGNED) {
  8043			if (!tcp_parse_aligned_timestamp(tp, th))
  8044				goto out;
  8045			delta = tp->rx_opt.rcv_tsval - tp->rx_opt.ts_recent;
  8046			if (delta < 0)
  8047				goto out;
  8048		}
  8049		/* The answer has to fit, since the segment cannot be handed back later. */
  8050		if (!sk_stream_memory_free(sk)) {
  8051			err = -ENOBUFS;
  8052			goto out;
  8053		}
  8054	
  8055		if (tp->tcp_header_len == sizeof(struct tcphdr) + TCPOLEN_TSTAMP_ALIGNED &&
  8056		    tp->rcv_nxt == tp->rcv_wup)
  8057			flag |= __tcp_replace_ts_recent(tp, delta);
  8058		tcp_rcv_rtt_measure_ts(sk, skb);
  8059		NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPHPHITS);
  8060		tcp_ecn_received_counters(sk, skb, h.payload_len);
  8061	
  8062		/* Received and read by the program, so nothing is queued. */
  8063		tcp_rcv_nxt_update(tp, end_seq);
  8064		WRITE_ONCE(tp->copied_seq, end_seq);
  8065		tcp_event_data_recv(sk, skb);
  8066	
  8067		if (TCP_SKB_CB(skb)->ack_seq != tp->snd_una ||
  8068		    (tcp_flag_word(th) & TCP_HP_BITS) != tp->pred_flags) {
  8069			/* The slow-path flag makes tcp_ack() take a window change. */
  8070			tcp_ack(sk, skb, flag | FLAG_DATA | FLAG_SLOWPATH);
  8071			tcp_data_snd_check(sk);
  8072			if (!inet_csk_ack_scheduled(sk))
  8073				goto done;
  8074		} else {
  8075			tcp_update_wl(tp, seq);
  8076		}
  8077		__tcp_ack_snd_check(sk, 0);
  8078	done:
  8079		err = 0;
  8080	out:
  8081		bh_unlock_sock(sk);
  8082		return err;
  8083	}
  8084	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
