Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8F7381E95
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 20:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791233414; cv=none; b=SOq0FpG7mUMaNIVHiZFDRrYN4kl0OgFN3Kbqh5hpl1rPW/j5+S68bZq9j6whWF6m8lW4V6pF2UIwYLk3/HCZOoEQcqoA9FP+RQ+F1nh2Ke/X27LamlKoKjzuJ3CdtqhjV81pgeuQoZz9nO01BtDnSrs3NxH6655XuzcTJI/NhAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791233414; c=relaxed/simple;
	bh=RiBcE3AUgtgnBdKTw1KKlNxzy0dDCDCQBKSzS96hGqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZTCm7dGYXGk0ssSq0uCfloRouF2xa13IhY/zpSVYsZuqWbHRMjKld36WtI/zD6D8yobSTvLiHIRrBkOUzXRZzYRjqpQN1Bm/v/QJjYfCarByxPtzz+NMnGgET2OXO0APQdcKC5/s4eEpYKBI/c9eZWl4oF6GdNPxEr75d4ryj5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPcKRIVv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPcKRIVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791233405; x=1822769405;
  h=date:from:to:cc:subject:message-id;
  bh=RiBcE3AUgtgnBdKTw1KKlNxzy0dDCDCQBKSzS96hGqI=;
  b=kPcKRIVvWGktRPVhCt1PHa3Y70osemQkFJNYX4mPUyNbjCUv/9l0xAmZ
   ez+YnNRILsLyyB8evbXbcVsAG3yII4ldDFPaLSKFDA23O9GxywOAaB2/L
   ZA9ml4Oc+dO9vW+JiOp9fgcXn2uZdngbBDEri0LlqRpffTxF5NrG6mAwf
   jwBTbU9nrvAAe3EhZS96Jkid4NxGGK1WbZ7fq/GmrCbkOywhi2wqzDuMA
   jccmkzPJyYb3axJ5eAe6f0StLDnu3CfmrqeHAxWslde11kjErlZCdM+gH
   8jr9YJC0PQMrDdJ1lV6JxF3bLWQq6ik5lBu9n5YlFjIezXzoV/9DD3crH
   w==;
X-CSE-ConnectionGUID: C0WT8wveShuSfaMAoUWS8w==
X-CSE-MsgGUID: 23DPl1D+SyyJ3ov+McUCcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102435140"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="102435140"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 13:49:41 -0700
X-CSE-ConnectionGUID: 0kGJwY3hRVCqBquq8PeRnw==
X-CSE-MsgGUID: Z3mwK5yxQy28z7y2kGngvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="280203716"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 05 Oct 2026 13:49:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDpcu-000000000J1-33BZ;
	Mon, 05 Oct 2026 20:49:36 +0000
Date: Mon, 05 Oct 2026 22:48:55 +0200
From: kernel test robot <lkp@intel.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/ipv4/tcp.c:6412:41: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202610052224.umZErm7e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Fernando-Fernandez-Mancera/ipv4-introduce-CONFIG_IPV4-to-decouple-the-IPv4-stack/20260930-155244
head:   2f5320cab6ec71a709d940eb2e33b5492af479ff
commit: c6f3b3a9aa158d590b48d60fe76cc2041c0dd1b6 tcp: move protocol agnostic TCP functions out of tcp_ipv4.c
date:   5 days ago
config: arm64-randconfig-r2307-20261005 (https://download.01.org/0day-ci/archive/20261005/202610052224.umZErm7e-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project dbeca9a3a3ba0b46471efb339b0ea8f2194f6f68)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610052224.umZErm7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610052224.umZErm7e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/tcp.c:6412:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *data @@     got struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control @@
   net/ipv4/tcp.c:6412:41: sparse:     expected void const *data
   net/ipv4/tcp.c:6412:41: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control
>> net/ipv4/tcp.c:6538:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *data @@     got struct tcp_congestion_ops const [noderef] __rcu *extern [addressable] [toplevel] tcp_congestion_control @@
   net/ipv4/tcp.c:6538:45: sparse:     expected void const *data
   net/ipv4/tcp.c:6538:45: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *extern [addressable] [toplevel] tcp_congestion_control
>> net/ipv4/tcp.c:6542:50: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control @@     got struct tcp_congestion_ops * @@
   net/ipv4/tcp.c:6542:50: sparse:     expected struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control
   net/ipv4/tcp.c:6542:50: sparse:     got struct tcp_congestion_ops *
>> net/ipv4/tcp.c:6413:41: sparse: sparse: dereference of noderef expression
>> net/ipv4/tcp.c:6413:41: sparse: sparse: dereference of noderef expression
   net/ipv4/tcp.c:6539:45: sparse: sparse: dereference of noderef expression
   net/ipv4/tcp.c:6539:45: sparse: sparse: dereference of noderef expression

vim +6412 net/ipv4/tcp.c

  6408	
  6409	static void __net_exit tcp_sk_exit(struct net *net)
  6410	{
  6411		if (net->ipv4.tcp_congestion_control)
> 6412			bpf_module_put(net->ipv4.tcp_congestion_control,
> 6413				       net->ipv4.tcp_congestion_control->owner);
  6414	}
  6415	
  6416	static void __net_init tcp_set_hashinfo(struct net *net)
  6417	{
  6418		struct inet_hashinfo *hinfo;
  6419		unsigned int ehash_entries;
  6420		struct net *old_net;
  6421	
  6422		if (net_eq(net, &init_net))
  6423			goto fallback;
  6424	
  6425		old_net = current->nsproxy->net_ns;
  6426		ehash_entries = READ_ONCE(old_net->ipv4.sysctl_tcp_child_ehash_entries);
  6427		if (!ehash_entries)
  6428			goto fallback;
  6429	
  6430		ehash_entries = roundup_pow_of_two(ehash_entries);
  6431		hinfo = inet_pernet_hashinfo_alloc(&tcp_hashinfo, ehash_entries);
  6432		if (!hinfo) {
  6433			pr_warn("Failed to allocate TCP ehash (entries: %u) "
  6434				"for a netns, fallback to the global one\n",
  6435				ehash_entries);
  6436	fallback:
  6437			hinfo = &tcp_hashinfo;
  6438			ehash_entries = tcp_hashinfo.ehash_mask + 1;
  6439		}
  6440	
  6441		net->ipv4.tcp_death_row.hashinfo = hinfo;
  6442		net->ipv4.tcp_death_row.sysctl_max_tw_buckets = ehash_entries / 2;
  6443		net->ipv4.sysctl_max_syn_backlog = max(128U, ehash_entries / 128);
  6444	}
  6445	
  6446	static int __net_init tcp_sk_init(struct net *net)
  6447	{
  6448		net->ipv4.sysctl_tcp_ecn = TCP_ECN_IN_ECN_OUT_NOECN;
  6449		net->ipv4.sysctl_tcp_ecn_option = TCP_ACCECN_OPTION_FULL;
  6450		net->ipv4.sysctl_tcp_ecn_option_beacon = TCP_ACCECN_OPTION_BEACON;
  6451		net->ipv4.sysctl_tcp_ecn_fallback = 1;
  6452	
  6453		net->ipv4.sysctl_tcp_base_mss = TCP_BASE_MSS;
  6454		net->ipv4.sysctl_tcp_min_snd_mss = TCP_MIN_SND_MSS;
  6455		net->ipv4.sysctl_tcp_probe_threshold = TCP_PROBE_THRESHOLD;
  6456		net->ipv4.sysctl_tcp_probe_interval = TCP_PROBE_INTERVAL;
  6457		net->ipv4.sysctl_tcp_mtu_probe_floor = TCP_MIN_SND_MSS;
  6458	
  6459		net->ipv4.sysctl_tcp_keepalive_time = TCP_KEEPALIVE_TIME;
  6460		net->ipv4.sysctl_tcp_keepalive_probes = TCP_KEEPALIVE_PROBES;
  6461		net->ipv4.sysctl_tcp_keepalive_intvl = TCP_KEEPALIVE_INTVL;
  6462	
  6463		net->ipv4.sysctl_tcp_syn_retries = TCP_SYN_RETRIES;
  6464		net->ipv4.sysctl_tcp_synack_retries = TCP_SYNACK_RETRIES;
  6465		net->ipv4.sysctl_tcp_syncookies = 1;
  6466		net->ipv4.sysctl_tcp_reordering = TCP_FASTRETRANS_THRESH;
  6467		net->ipv4.sysctl_tcp_retries1 = TCP_RETR1;
  6468		net->ipv4.sysctl_tcp_retries2 = TCP_RETR2;
  6469		net->ipv4.sysctl_tcp_orphan_retries = 0;
  6470		net->ipv4.sysctl_tcp_fin_timeout = TCP_FIN_TIMEOUT;
  6471		net->ipv4.sysctl_tcp_notsent_lowat = UINT_MAX;
  6472		net->ipv4.sysctl_tcp_tw_reuse = 2;
  6473		net->ipv4.sysctl_tcp_tw_reuse_delay = 1 * MSEC_PER_SEC;
  6474		net->ipv4.sysctl_tcp_no_ssthresh_metrics_save = 1;
  6475	
  6476		refcount_set(&net->ipv4.tcp_death_row.tw_refcount, 1);
  6477		tcp_set_hashinfo(net);
  6478	
  6479		net->ipv4.sysctl_tcp_sack = 1;
  6480		net->ipv4.sysctl_tcp_window_scaling = 1;
  6481		net->ipv4.sysctl_tcp_timestamps = 1;
  6482		net->ipv4.sysctl_tcp_early_retrans = 3;
  6483		net->ipv4.sysctl_tcp_recovery = TCP_RACK_LOSS_DETECTION;
  6484		net->ipv4.sysctl_tcp_slow_start_after_idle = 1; /* By default, RFC2861 behavior.  */
  6485		net->ipv4.sysctl_tcp_retrans_collapse = 1;
  6486		net->ipv4.sysctl_tcp_max_reordering = 300;
  6487		net->ipv4.sysctl_tcp_dsack = 1;
  6488		net->ipv4.sysctl_tcp_app_win = 31;
  6489		net->ipv4.sysctl_tcp_adv_win_scale = 1;
  6490		net->ipv4.sysctl_tcp_frto = 2;
  6491		net->ipv4.sysctl_tcp_moderate_rcvbuf = 1;
  6492		net->ipv4.sysctl_tcp_rcvbuf_low_rtt = USEC_PER_MSEC;
  6493		/* This limits the percentage of the congestion window which we
  6494		 * will allow a single TSO frame to consume.  Building TSO frames
  6495		 * which are too large can cause TCP streams to be bursty.
  6496		 */
  6497		net->ipv4.sysctl_tcp_tso_win_divisor = 3;
  6498		/* Default TSQ limit of 4 MB */
  6499		net->ipv4.sysctl_tcp_limit_output_bytes = 4 << 20;
  6500	
  6501		/* rfc5961 challenge ack rate limiting, per net-ns, disabled by default. */
  6502		net->ipv4.sysctl_tcp_challenge_ack_limit = INT_MAX;
  6503	
  6504		net->ipv4.sysctl_tcp_min_tso_segs = 2;
  6505		net->ipv4.sysctl_tcp_tso_rtt_log = 9;  /* 2^9 = 512 usec */
  6506		net->ipv4.sysctl_tcp_min_rtt_wlen = 300;
  6507		net->ipv4.sysctl_tcp_autocorking = 1;
  6508		net->ipv4.sysctl_tcp_invalid_ratelimit = HZ / 2;
  6509		net->ipv4.sysctl_tcp_pacing_ss_ratio = 200;
  6510		net->ipv4.sysctl_tcp_pacing_ca_ratio = 120;
  6511		if (net != &init_net) {
  6512			memcpy(net->ipv4.sysctl_tcp_rmem,
  6513			       init_net.ipv4.sysctl_tcp_rmem,
  6514			       sizeof(init_net.ipv4.sysctl_tcp_rmem));
  6515			memcpy(net->ipv4.sysctl_tcp_wmem,
  6516			       init_net.ipv4.sysctl_tcp_wmem,
  6517			       sizeof(init_net.ipv4.sysctl_tcp_wmem));
  6518		}
  6519		net->ipv4.sysctl_tcp_comp_sack_delay_ns = NSEC_PER_MSEC;
  6520		net->ipv4.sysctl_tcp_comp_sack_slack_ns = 10 * NSEC_PER_USEC;
  6521		net->ipv4.sysctl_tcp_comp_sack_nr = 44;
  6522		net->ipv4.sysctl_tcp_comp_sack_rtt_percent = 33;
  6523		net->ipv4.sysctl_tcp_backlog_ack_defer = 1;
  6524		net->ipv4.sysctl_tcp_fastopen = TFO_CLIENT_ENABLE;
  6525		net->ipv4.sysctl_tcp_fastopen_blackhole_timeout = 0;
  6526		atomic_set(&net->ipv4.tfo_active_disable_times, 0);
  6527	
  6528		/* Set default values for PLB */
  6529		net->ipv4.sysctl_tcp_plb_enabled = 0; /* Disabled by default */
  6530		net->ipv4.sysctl_tcp_plb_idle_rehash_rounds = 3;
  6531		net->ipv4.sysctl_tcp_plb_rehash_rounds = 12;
  6532		net->ipv4.sysctl_tcp_plb_suspend_rto_sec = 60;
  6533		/* Default congestion threshold for PLB to mark a round is 50% */
  6534		net->ipv4.sysctl_tcp_plb_cong_thresh = (1 << TCP_PLB_SCALE) / 2;
  6535	
  6536		/* Reno is always built in */
  6537		if (!net_eq(net, &init_net) &&
> 6538		    bpf_try_module_get(init_net.ipv4.tcp_congestion_control,
  6539				       init_net.ipv4.tcp_congestion_control->owner))
  6540			net->ipv4.tcp_congestion_control = init_net.ipv4.tcp_congestion_control;
  6541		else
> 6542			net->ipv4.tcp_congestion_control = &tcp_reno;
  6543	
  6544		net->ipv4.sysctl_tcp_syn_linear_timeouts = 4;
  6545		net->ipv4.sysctl_tcp_shrink_window = 0;
  6546	
  6547		net->ipv4.sysctl_tcp_pingpong_thresh = 1;
  6548		net->ipv4.sysctl_tcp_rto_min_us = jiffies_to_usecs(TCP_RTO_MIN);
  6549		net->ipv4.sysctl_tcp_rto_max_ms = TCP_RTO_MAX_SEC * MSEC_PER_SEC;
  6550	
  6551		return 0;
  6552	}
  6553	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
