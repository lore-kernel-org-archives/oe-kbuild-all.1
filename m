Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5155420102F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730227408; cv=none; b=bq+3APleYUEDEEJRBnFzq9nIrIv5p8Dpr0GgRmqXhkcH+X4crilbYsNSKWW4kIUcKaGWAnrgIK4EmKKQN0RssbPj3urfl/gvVaDReEkC4kz95rBDtc7wVZ60UZGSOdqN6KatAaK7C1By/9PJ5eXRcYbfTkSmF5cffY15bnfkmPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730227408; c=relaxed/simple;
	bh=XCxUnUdlDHItvQKBAZQqb8Ox/ujFZBPClYSIjR35mLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5c5hlVBkDnl0c+v43t+a6M/g9C1Lf0OUwMTqnl5pIxYF9mOsSTtR1gxuAp/Mb7cUE2Bn83+BWGBkhgxEHg0fB1mrPcSmKXnQNgzPVyAFmYBNF0vQxTbgT66podDmEzC+1GGmDlE4duTi/V5dD0HOkFSdoNNa2ZvMGNBX2YfI20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvFTVlZu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvFTVlZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730227405; x=1761763405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XCxUnUdlDHItvQKBAZQqb8Ox/ujFZBPClYSIjR35mLY=;
  b=AvFTVlZu33lL8Fzw38kkXdlM6tjgD+0PXLsiKvYFUpiAgw6DFfG8TCR4
   YELJOdqSM00ES08fIq57h9fvEUlBYnCVc2amihCNavUY8KfuRpxjTk9mq
   2UJBhGoNkW0K1SpDMCCica31xg0xEcmi20U2V/UsLnhl0oJWPv+GkfQKg
   AO0yPTCAtYMXxPKAs/TJAGcbCJTaTqMjMbhdbxNs4dmlDd+8SifkLUSXc
   dZlwYQDTKGoLHj4bdbaMUQF66fLVJJ5iXgwVrZ0Hb5CLPmjyLHpwEbxNM
   TnPxCBmJEfzBGuuVwv4+QMLAgNpBvutHuJ7yUNATEubAbU+gNwAYje1iJ
   Q==;
X-CSE-ConnectionGUID: wXCA57qbTneA/qKa2oagZg==
X-CSE-MsgGUID: f57D+NB+T4Sizs8XwsRXpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30005059"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="30005059"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 11:43:23 -0700
X-CSE-ConnectionGUID: 733y6TOsRVSVV19H6vbqlQ==
X-CSE-MsgGUID: AJ5Ki4KaSvOymB+PXx9Bzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82206713"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2024 11:43:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5rBW-000e0G-33;
	Tue, 29 Oct 2024 18:43:18 +0000
Date: Wed, 30 Oct 2024 02:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: John Ousterhout <ouster@cs.stanford.edu>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, John Ousterhout <ouster@cs.stanford.edu>
Subject: Re: [PATCH net-next 12/12] net: homa: create Makefile and Kconfig
Message-ID: <202410300216.L9BJCLPZ-lkp@intel.com>
References: <20241028213541.1529-13-ouster@cs.stanford.edu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028213541.1529-13-ouster@cs.stanford.edu>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ousterhout/net-homa-define-user-visible-API-for-Homa/20241029-095137
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241028213541.1529-13-ouster%40cs.stanford.edu
patch subject: [PATCH net-next 12/12] net: homa: create Makefile and Kconfig
config: csky-randconfig-r053-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300216.L9BJCLPZ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300216.L9BJCLPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300216.L9BJCLPZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   net/homa/homa_incoming.c: In function 'homa_dispatch_pkts':
>> net/homa/homa_incoming.c:291:25: error: implicit declaration of function 'icmp6_send'; did you mean 'icmp_send'? [-Wimplicit-function-declaration]
     291 |                         icmp6_send(skb, ICMPV6_DEST_UNREACH,
         |                         ^~~~~~~~~~
         |                         icmp_send
   net/homa/homa_incoming.c: In function 'homa_incoming_sysctl_changed':
   net/homa/homa_incoming.c:1078:22: error: 'cpu_khz' undeclared (first use in this function)
    1078 |         tmp = (tmp * cpu_khz) / 1000;
         |                      ^~~~~~~
   net/homa/homa_incoming.c:1078:22: note: each undeclared identifier is reported only once for each function it appears in
--
   net/homa/homa_peer.c: In function 'homa_dst_refresh':
   net/homa/homa_peer.c:189:48: error: 'cpu_khz' undeclared (first use in this function)
     189 |                         dead->gc_time = now + (cpu_khz << 7);
         |                                                ^~~~~~~
   net/homa/homa_peer.c:189:48: note: each undeclared identifier is reported only once for each function it appears in
   net/homa/homa_peer.c: In function 'homa_peer_get_dst':
>> net/homa/homa_peer.c:235:38: error: 'struct inet_sock' has no member named 'pinet6'
     235 |         peer->flow.u.ip6.saddr = inet->pinet6->saddr;
         |                                      ^~
--
>> net/homa/homa_plumbing.c:167:15: error: variable 'homav6_protocol' has initializer but incomplete type
     167 | static struct inet6_protocol homav6_protocol = {
         |               ^~~~~~~~~~~~~~
>> net/homa/homa_plumbing.c:168:10: error: 'struct inet6_protocol' has no member named 'handler'
     168 |         .handler =      homa_softirq,
         |          ^~~~~~~
>> net/homa/homa_plumbing.c:168:25: warning: excess elements in struct initializer
     168 |         .handler =      homa_softirq,
         |                         ^~~~~~~~~~~~
   net/homa/homa_plumbing.c:168:25: note: (near initialization for 'homav6_protocol')
>> net/homa/homa_plumbing.c:169:10: error: 'struct inet6_protocol' has no member named 'err_handler'
     169 |         .err_handler =  homa_err_handler_v6,
         |          ^~~~~~~~~~~
   net/homa/homa_plumbing.c:169:25: warning: excess elements in struct initializer
     169 |         .err_handler =  homa_err_handler_v6,
         |                         ^~~~~~~~~~~~~~~~~~~
   net/homa/homa_plumbing.c:169:25: note: (near initialization for 'homav6_protocol')
>> net/homa/homa_plumbing.c:170:10: error: 'struct inet6_protocol' has no member named 'flags'
     170 |         .flags =        INET6_PROTO_NOPOLICY | INET6_PROTO_FINAL,
         |          ^~~~~
>> net/homa/homa_plumbing.c:170:25: error: 'INET6_PROTO_NOPOLICY' undeclared here (not in a function)
     170 |         .flags =        INET6_PROTO_NOPOLICY | INET6_PROTO_FINAL,
         |                         ^~~~~~~~~~~~~~~~~~~~
>> net/homa/homa_plumbing.c:170:48: error: 'INET6_PROTO_FINAL' undeclared here (not in a function)
     170 |         .flags =        INET6_PROTO_NOPOLICY | INET6_PROTO_FINAL,
         |                                                ^~~~~~~~~~~~~~~~~
   net/homa/homa_plumbing.c:170:25: warning: excess elements in struct initializer
     170 |         .flags =        INET6_PROTO_NOPOLICY | INET6_PROTO_FINAL,
         |                         ^~~~~~~~~~~~~~~~~~~~
   net/homa/homa_plumbing.c:170:25: note: (near initialization for 'homav6_protocol')
   net/homa/homa_plumbing.c: In function 'homa_load':
>> net/homa/homa_plumbing.c:226:9: error: implicit declaration of function 'inet6_register_protosw'; did you mean 'inet_register_protosw'? [-Wimplicit-function-declaration]
     226 |         inet6_register_protosw(&homav6_protosw);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         inet_register_protosw
>> net/homa/homa_plumbing.c:233:18: error: implicit declaration of function 'inet6_add_protocol'; did you mean 'inet_add_protocol'? [-Wimplicit-function-declaration]
     233 |         status = inet6_add_protocol(&homav6_protocol, IPPROTO_HOMA);
         |                  ^~~~~~~~~~~~~~~~~~
         |                  inet_add_protocol
>> net/homa/homa_plumbing.c:259:9: error: implicit declaration of function 'inet6_del_protocol'; did you mean 'inet_del_protocol'? [-Wimplicit-function-declaration]
     259 |         inet6_del_protocol(&homav6_protocol, IPPROTO_HOMA);
         |         ^~~~~~~~~~~~~~~~~~
         |         inet_del_protocol
>> net/homa/homa_plumbing.c:260:9: error: implicit declaration of function 'inet6_unregister_protosw'; did you mean 'inet_unregister_protosw'? [-Wimplicit-function-declaration]
     260 |         inet6_unregister_protosw(&homav6_protosw);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         inet_unregister_protosw
   net/homa/homa_plumbing.c: In function 'homa_softirq':
   net/homa/homa_plumbing.c:712:61: error: 'cpu_khz' undeclared (first use in this function)
     712 |                 int scaled_ms = (int)(10 * (start - last) / cpu_khz);
         |                                                             ^~~~~~~
   net/homa/homa_plumbing.c:712:61: note: each undeclared identifier is reported only once for each function it appears in
   net/homa/homa_plumbing.c: At top level:
>> net/homa/homa_plumbing.c:167:30: error: storage size of 'homav6_protocol' isn't known
     167 | static struct inet6_protocol homav6_protocol = {
         |                              ^~~~~~~~~~~~~~~


vim +291 net/homa/homa_incoming.c

223bab41c36796 John Ousterhout 2024-10-28  256  
223bab41c36796 John Ousterhout 2024-10-28  257  /**
223bab41c36796 John Ousterhout 2024-10-28  258   * homa_dispatch_pkts() - Top-level function that processes a batch of packets,
223bab41c36796 John Ousterhout 2024-10-28  259   * all related to the same RPC.
223bab41c36796 John Ousterhout 2024-10-28  260   * @skb:       First packet in the batch, linked through skb->next.
223bab41c36796 John Ousterhout 2024-10-28  261   * @homa:      Overall information about the Homa transport.
223bab41c36796 John Ousterhout 2024-10-28  262   */
223bab41c36796 John Ousterhout 2024-10-28  263  void homa_dispatch_pkts(struct sk_buff *skb, struct homa *homa)
223bab41c36796 John Ousterhout 2024-10-28  264  {
223bab41c36796 John Ousterhout 2024-10-28  265  #ifdef __UNIT_TEST__
223bab41c36796 John Ousterhout 2024-10-28  266  #define MAX_ACKS 2
223bab41c36796 John Ousterhout 2024-10-28  267  #else
223bab41c36796 John Ousterhout 2024-10-28  268  #define MAX_ACKS 10
223bab41c36796 John Ousterhout 2024-10-28  269  #endif
223bab41c36796 John Ousterhout 2024-10-28  270  	const struct in6_addr saddr = skb_canonical_ipv6_saddr(skb);
223bab41c36796 John Ousterhout 2024-10-28  271  	struct data_header *h = (struct data_header *)skb->data;
223bab41c36796 John Ousterhout 2024-10-28  272  	__u64 id = homa_local_id(h->common.sender_id);
223bab41c36796 John Ousterhout 2024-10-28  273  	int dport = ntohs(h->common.dport);
223bab41c36796 John Ousterhout 2024-10-28  274  
223bab41c36796 John Ousterhout 2024-10-28  275  	/* Used to collect acks from data packets so we can process them
223bab41c36796 John Ousterhout 2024-10-28  276  	 * all at the end (can't process them inline because that may
223bab41c36796 John Ousterhout 2024-10-28  277  	 * require locking conflicting RPCs). If we run out of space just
223bab41c36796 John Ousterhout 2024-10-28  278  	 * ignore the extra acks; they'll be regenerated later through the
223bab41c36796 John Ousterhout 2024-10-28  279  	 * explicit mechanism.
223bab41c36796 John Ousterhout 2024-10-28  280  	 */
223bab41c36796 John Ousterhout 2024-10-28  281  	struct homa_ack acks[MAX_ACKS];
223bab41c36796 John Ousterhout 2024-10-28  282  	struct homa_rpc *rpc = NULL;
223bab41c36796 John Ousterhout 2024-10-28  283  	struct homa_sock *hsk;
223bab41c36796 John Ousterhout 2024-10-28  284  	struct sk_buff *next;
223bab41c36796 John Ousterhout 2024-10-28  285  	int num_acks = 0;
223bab41c36796 John Ousterhout 2024-10-28  286  
223bab41c36796 John Ousterhout 2024-10-28  287  	/* Find the appropriate socket.*/
223bab41c36796 John Ousterhout 2024-10-28  288  	hsk = homa_sock_find(homa->port_map, dport);
223bab41c36796 John Ousterhout 2024-10-28  289  	if (!hsk) {
223bab41c36796 John Ousterhout 2024-10-28  290  		if (skb_is_ipv6(skb))
223bab41c36796 John Ousterhout 2024-10-28 @291  			icmp6_send(skb, ICMPV6_DEST_UNREACH,
223bab41c36796 John Ousterhout 2024-10-28  292  				   ICMPV6_PORT_UNREACH, 0, NULL, IP6CB(skb));
223bab41c36796 John Ousterhout 2024-10-28  293  		else
223bab41c36796 John Ousterhout 2024-10-28  294  			icmp_send(skb, ICMP_DEST_UNREACH,
223bab41c36796 John Ousterhout 2024-10-28  295  				  ICMP_PORT_UNREACH, 0);
223bab41c36796 John Ousterhout 2024-10-28  296  		while (skb) {
223bab41c36796 John Ousterhout 2024-10-28  297  			next = skb->next;
223bab41c36796 John Ousterhout 2024-10-28  298  			kfree_skb(skb);
223bab41c36796 John Ousterhout 2024-10-28  299  			skb = next;
223bab41c36796 John Ousterhout 2024-10-28  300  		}
223bab41c36796 John Ousterhout 2024-10-28  301  		return;
223bab41c36796 John Ousterhout 2024-10-28  302  	}
223bab41c36796 John Ousterhout 2024-10-28  303  
223bab41c36796 John Ousterhout 2024-10-28  304  	/* Each iteration through the following loop processes one packet. */
223bab41c36796 John Ousterhout 2024-10-28  305  	for (; skb; skb = next) {
223bab41c36796 John Ousterhout 2024-10-28  306  		h = (struct data_header *)skb->data;
223bab41c36796 John Ousterhout 2024-10-28  307  		next = skb->next;
223bab41c36796 John Ousterhout 2024-10-28  308  
223bab41c36796 John Ousterhout 2024-10-28  309  		/* Relinquish the RPC lock temporarily if it's needed
223bab41c36796 John Ousterhout 2024-10-28  310  		 * elsewhere.
223bab41c36796 John Ousterhout 2024-10-28  311  		 */
223bab41c36796 John Ousterhout 2024-10-28  312  		if (rpc) {
223bab41c36796 John Ousterhout 2024-10-28  313  			int flags = atomic_read(&rpc->flags);
223bab41c36796 John Ousterhout 2024-10-28  314  
223bab41c36796 John Ousterhout 2024-10-28  315  			if (flags & APP_NEEDS_LOCK) {
223bab41c36796 John Ousterhout 2024-10-28  316  				homa_rpc_unlock(rpc);
223bab41c36796 John Ousterhout 2024-10-28  317  				homa_spin(200);
223bab41c36796 John Ousterhout 2024-10-28  318  				rpc = NULL;
223bab41c36796 John Ousterhout 2024-10-28  319  			}
223bab41c36796 John Ousterhout 2024-10-28  320  		}
223bab41c36796 John Ousterhout 2024-10-28  321  
223bab41c36796 John Ousterhout 2024-10-28  322  		/* Find and lock the RPC if we haven't already done so. */
223bab41c36796 John Ousterhout 2024-10-28  323  		if (!rpc) {
223bab41c36796 John Ousterhout 2024-10-28  324  			if (!homa_is_client(id)) {
223bab41c36796 John Ousterhout 2024-10-28  325  				/* We are the server for this RPC. */
223bab41c36796 John Ousterhout 2024-10-28  326  				if (h->common.type == DATA) {
223bab41c36796 John Ousterhout 2024-10-28  327  					int created;
223bab41c36796 John Ousterhout 2024-10-28  328  
223bab41c36796 John Ousterhout 2024-10-28  329  					/* Create a new RPC if one doesn't
223bab41c36796 John Ousterhout 2024-10-28  330  					 * already exist.
223bab41c36796 John Ousterhout 2024-10-28  331  					 */
223bab41c36796 John Ousterhout 2024-10-28  332  					rpc = homa_rpc_new_server(hsk, &saddr,
223bab41c36796 John Ousterhout 2024-10-28  333  								  h, &created);
223bab41c36796 John Ousterhout 2024-10-28  334  					if (IS_ERR(rpc)) {
223bab41c36796 John Ousterhout 2024-10-28  335  						pr_warn("homa_pkt_dispatch couldn't create server rpc: error %lu",
223bab41c36796 John Ousterhout 2024-10-28  336  							-PTR_ERR(rpc));
223bab41c36796 John Ousterhout 2024-10-28  337  						rpc = NULL;
223bab41c36796 John Ousterhout 2024-10-28  338  						goto discard;
223bab41c36796 John Ousterhout 2024-10-28  339  					}
223bab41c36796 John Ousterhout 2024-10-28  340  				} else {
223bab41c36796 John Ousterhout 2024-10-28  341  					rpc = homa_find_server_rpc(hsk, &saddr,
223bab41c36796 John Ousterhout 2024-10-28  342  								   ntohs(h->common.sport),
223bab41c36796 John Ousterhout 2024-10-28  343  								   id);
223bab41c36796 John Ousterhout 2024-10-28  344  				}
223bab41c36796 John Ousterhout 2024-10-28  345  			} else {
223bab41c36796 John Ousterhout 2024-10-28  346  				rpc = homa_find_client_rpc(hsk, id);
223bab41c36796 John Ousterhout 2024-10-28  347  			}
223bab41c36796 John Ousterhout 2024-10-28  348  		}
223bab41c36796 John Ousterhout 2024-10-28  349  		if (unlikely(!rpc)) {
223bab41c36796 John Ousterhout 2024-10-28  350  			if (h->common.type != NEED_ACK &&
223bab41c36796 John Ousterhout 2024-10-28  351  			    h->common.type != ACK && h->common.type != RESEND)
223bab41c36796 John Ousterhout 2024-10-28  352  				goto discard;
223bab41c36796 John Ousterhout 2024-10-28  353  		} else {
223bab41c36796 John Ousterhout 2024-10-28  354  			if (h->common.type == DATA || h->common.type == BUSY ||
223bab41c36796 John Ousterhout 2024-10-28  355  			    h->common.type == NEED_ACK)
223bab41c36796 John Ousterhout 2024-10-28  356  				rpc->silent_ticks = 0;
223bab41c36796 John Ousterhout 2024-10-28  357  			rpc->peer->outstanding_resends = 0;
223bab41c36796 John Ousterhout 2024-10-28  358  		}
223bab41c36796 John Ousterhout 2024-10-28  359  
223bab41c36796 John Ousterhout 2024-10-28  360  		switch (h->common.type) {
223bab41c36796 John Ousterhout 2024-10-28  361  		case DATA:
223bab41c36796 John Ousterhout 2024-10-28  362  			if (h->ack.client_id) {
223bab41c36796 John Ousterhout 2024-10-28  363  				/* Save the ack for processing later, when we
223bab41c36796 John Ousterhout 2024-10-28  364  				 * have released the RPC lock.
223bab41c36796 John Ousterhout 2024-10-28  365  				 */
223bab41c36796 John Ousterhout 2024-10-28  366  				if (num_acks < MAX_ACKS) {
223bab41c36796 John Ousterhout 2024-10-28  367  					acks[num_acks] = h->ack;
223bab41c36796 John Ousterhout 2024-10-28  368  					num_acks++;
223bab41c36796 John Ousterhout 2024-10-28  369  				}
223bab41c36796 John Ousterhout 2024-10-28  370  			}
223bab41c36796 John Ousterhout 2024-10-28  371  			homa_data_pkt(skb, rpc);
223bab41c36796 John Ousterhout 2024-10-28  372  			break;
223bab41c36796 John Ousterhout 2024-10-28  373  		case RESEND:
223bab41c36796 John Ousterhout 2024-10-28  374  			homa_resend_pkt(skb, rpc, hsk);
223bab41c36796 John Ousterhout 2024-10-28  375  			break;
223bab41c36796 John Ousterhout 2024-10-28  376  		case UNKNOWN:
223bab41c36796 John Ousterhout 2024-10-28  377  			homa_unknown_pkt(skb, rpc);
223bab41c36796 John Ousterhout 2024-10-28  378  			break;
223bab41c36796 John Ousterhout 2024-10-28  379  		case BUSY:
223bab41c36796 John Ousterhout 2024-10-28  380  			/* Nothing to do for these packets except reset
223bab41c36796 John Ousterhout 2024-10-28  381  			 * silent_ticks, which happened above.
223bab41c36796 John Ousterhout 2024-10-28  382  			 */
223bab41c36796 John Ousterhout 2024-10-28  383  			goto discard;
223bab41c36796 John Ousterhout 2024-10-28  384  		case NEED_ACK:
223bab41c36796 John Ousterhout 2024-10-28  385  			homa_need_ack_pkt(skb, hsk, rpc);
223bab41c36796 John Ousterhout 2024-10-28  386  			break;
223bab41c36796 John Ousterhout 2024-10-28  387  		case ACK:
223bab41c36796 John Ousterhout 2024-10-28  388  			homa_ack_pkt(skb, hsk, rpc);
223bab41c36796 John Ousterhout 2024-10-28  389  			rpc = NULL;
223bab41c36796 John Ousterhout 2024-10-28  390  
223bab41c36796 John Ousterhout 2024-10-28  391  			/* It isn't safe to process more packets once we've
223bab41c36796 John Ousterhout 2024-10-28  392  			 * released the RPC lock (this should never happen).
223bab41c36796 John Ousterhout 2024-10-28  393  			 */
223bab41c36796 John Ousterhout 2024-10-28  394  			BUG_ON(next);
223bab41c36796 John Ousterhout 2024-10-28  395  			break;
223bab41c36796 John Ousterhout 2024-10-28  396  		default:
223bab41c36796 John Ousterhout 2024-10-28  397  			goto discard;
223bab41c36796 John Ousterhout 2024-10-28  398  		}
223bab41c36796 John Ousterhout 2024-10-28  399  		continue;
223bab41c36796 John Ousterhout 2024-10-28  400  
223bab41c36796 John Ousterhout 2024-10-28  401  discard:
223bab41c36796 John Ousterhout 2024-10-28  402  		kfree_skb(skb);
223bab41c36796 John Ousterhout 2024-10-28  403  	}
223bab41c36796 John Ousterhout 2024-10-28  404  	if (rpc)
223bab41c36796 John Ousterhout 2024-10-28  405  		homa_rpc_unlock(rpc);
223bab41c36796 John Ousterhout 2024-10-28  406  
223bab41c36796 John Ousterhout 2024-10-28  407  	while (num_acks > 0) {
223bab41c36796 John Ousterhout 2024-10-28  408  		num_acks--;
223bab41c36796 John Ousterhout 2024-10-28  409  		homa_rpc_acked(hsk, &saddr, &acks[num_acks]);
223bab41c36796 John Ousterhout 2024-10-28  410  	}
223bab41c36796 John Ousterhout 2024-10-28  411  
223bab41c36796 John Ousterhout 2024-10-28  412  	if (hsk->dead_skbs >= 2 * hsk->homa->dead_buffs_limit)
223bab41c36796 John Ousterhout 2024-10-28  413  		/* We get here if neither homa_wait_for_message
223bab41c36796 John Ousterhout 2024-10-28  414  		 * nor homa_timer can keep up with reaping dead
223bab41c36796 John Ousterhout 2024-10-28  415  		 * RPCs. See reap.txt for details.
223bab41c36796 John Ousterhout 2024-10-28  416  		 */
223bab41c36796 John Ousterhout 2024-10-28  417  
223bab41c36796 John Ousterhout 2024-10-28  418  		homa_rpc_reap(hsk, hsk->homa->reap_limit);
223bab41c36796 John Ousterhout 2024-10-28  419  }
223bab41c36796 John Ousterhout 2024-10-28  420  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
