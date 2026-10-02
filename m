Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9BC28373
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 00:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790899443; cv=none; b=sDoB5bkpO8y6owJkqemN6STQn+DXzm9ZYX/FO31LGZXTP8T+sYR/pzoHg2QdvaBQxOfI8O8kp1LRAXyU46r9jiwfFgZQVXdad7M3JKl2URh5WiDWRSgMl0cENqPaBBoYRE4BVjCrwT4N7q6PlFidEmcxtE9DNj7S4W7NeowMSpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790899443; c=relaxed/simple;
	bh=+T75i3bnyurMpltEs56//8sO034nYuaEk45Cukiopp4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HScMSVh5adjjLwdtiTRpnJS6o+GJSWDsNAG4PJygfwk0Vc/z2W131yOQiW4rJp6WZZlCiXNURYN4UpgPb9sUpziHwxVd4r1TVJuSDoXNCWMsoeR1/+y7pHdzjal+DeVxemYlTtRiUScxscR1SFMcziCdvzA3pgEnXz+tocoDxpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cfbtjdi1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cfbtjdi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790899441; x=1822435441;
  h=date:from:to:cc:subject:message-id;
  bh=+T75i3bnyurMpltEs56//8sO034nYuaEk45Cukiopp4=;
  b=Cfbtjdi1KA+YnMRH6GkNh8fow1UxbGZRq0CrmAz4BsW9fLO1x6Wjdntb
   o7U0HKxJ3y2ShuHyYjHJwMjmmD/9IDJEOGIzpLi7nIB9C/R8Unx7kCZqs
   cYLxvxQzRb5ndF7lZycAS1BjDEzPsf1pXby7VdG32Ysle/zN/pyU6F85+
   nxiyP+5VBNhfC+EHcmpg823pkwTA1JsrMGYNZBGVHv33Pu8flvvyU7TOM
   XiEfzc36VdC8Bzl3Pdnh3F0n12obTJa0tgyDavzhiBMV38hAOSxHZi0oy
   zs1c+dc4pocgJRbK+o7q0Vr0vw7CbKgVT10Z/UfJtv3djGqWvNQX32Ldg
   w==;
X-CSE-ConnectionGUID: bk4nlbS/SbeoavfzSoyaQw==
X-CSE-MsgGUID: PyR1/h7nSUWrsjT6pNRT4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90530754"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90530754"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 17:04:00 -0700
X-CSE-ConnectionGUID: /MWr4sCqQoeuzkgV5ATM3A==
X-CSE-MsgGUID: L4+BQcfXTwSA372iCBKWig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="302375213"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2026 17:03:59 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCQkm-000000000IX-1ZtK;
	Fri, 02 Oct 2026 00:03:56 +0000
Date: Fri, 02 Oct 2026 02:03:30 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 41/49] net/ipv4/tcp_input.c:8020:18:
 warning: assignment to 'sk_buff_data_t' {aka 'unsigned char *'} from
 'unsigned int' makes pointer from integer without a cast
Message-ID: <202610020155.yNARu1IX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   babde5051be3840becf5a78de91a0b68a99f0e49
commit: ed7104db7e0a960eaf9b230f7cc1ffdea582b4b3 [41/49] tcp: Add XDP fast-path kfuncs for established connections
config: i386-randconfig-2103-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020155.yNARu1IX-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020155.yNARu1IX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020155.yNARu1IX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/tcp_input.c: In function 'bpf_xdp_tcp_consume':
>> net/ipv4/tcp_input.c:8020:18: warning: assignment to 'sk_buff_data_t' {aka 'unsigned char *'} from 'unsigned int' makes pointer from integer without a cast [-Wint-conversion]
    8020 |         skb->end = offsetof(typeof(fake), shinfo) - offsetof(typeof(fake), hdr);
         |                  ^
>> net/ipv4/tcp_input.c:8021:19: warning: assignment to 'sk_buff_data_t' {aka 'unsigned char *'} from 'u32' {aka 'unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
    8021 |         skb->tail = hlen;
         |                   ^


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
