Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3E32376F7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 08:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445543; cv=none; b=sXbi/fQoXYEVCNFU0Rw9g1vnw0m1v7ITFZ0+B25KB9WYdR8/CPPbeBfRHOCejjEd2SxaPxLfEVA3uwmS3kON7FRPkhBlFMAb2DjAsMpjzYpf9iEu7pjnxz3XIF3mzbdjdcnG+kZFMIFR8SoGRGcIimlqiYONVko3oy3O4KnB69s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445543; c=relaxed/simple;
	bh=/HHmCJ+Zd8AODTLEHl7h6X+Awb2S3boWRkuAgQcFTC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QTKGyPBSCF7mdxlWhysSQym1eBbicqqGNKux6wW4N6tBcAEarWmAsuNSvJI/H92DQ04HW6iUg84083JGiXsgP9BaubDnQQruamx6b7/jsFeBq7AZL+albJmbOvplGDJ5ZvxT8tOBA27oiTsZJwleKCAiLgxRZl1LDWdoQGA7s2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VbOM5Jz6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbOM5Jz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751445540; x=1782981540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/HHmCJ+Zd8AODTLEHl7h6X+Awb2S3boWRkuAgQcFTC8=;
  b=VbOM5Jz6vs+oBFEcDIGOX/5QvYi7kwkvxKhumRQeyJzat/Utd/KnYhzq
   eBleme7ly8TBotZO0ENg9V5N2mprDHDaI9Ej7NCb9KFRICF7JLxw11YUP
   xJoKHVmwD2wOBmcn2IVGNwl/D+rXTKgj0uOz/Kp7ERs5j7uBEXbeZ5wPn
   1vpc75lG9POx6FmmEq093cS0voSCxHfmzfM5wG3iMgmT7xHt6nqaJ+5Ph
   +MPeRL9Y0r2we+Df555wVzRuqUdTu9Q72+5VVDPxLUdYdFaSX9bjD5kU8
   7oHvjWj5Y+TZVqZ64qyM0QLcrjQgMHjy5F1BCNPMLU1G94TUxn14Krce7
   g==;
X-CSE-ConnectionGUID: tLCk9wkzRfGc50CL6Xr02g==
X-CSE-MsgGUID: 81xw0FF9RIitgOa1FF4uPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52962615"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="52962615"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 01:39:00 -0700
X-CSE-ConnectionGUID: CZLG5IqVSpm1v21w8YDzew==
X-CSE-MsgGUID: juMR7ev2TGOeqdr47XGpIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158391338"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2025 01:38:58 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWszX-0000FF-1l;
	Wed, 02 Jul 2025 08:38:55 +0000
Date: Wed, 2 Jul 2025 10:38:52 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] net/tipc/link.c:198:
 warning: Function parameter or member 'backlog.target_bskb' not described in
 'tipc_link'
Message-ID: <202507021034.5BJRugpy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: eb923245b9deef21ddd337c4e1e081c407a891fd [1605/1605] tipc: fix unlimited bundling of small messages
config: x86_64-buildonly-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507021034.5BJRugpy-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021034.5BJRugpy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021034.5BJRugpy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/tipc/link.c:198: warning: Function parameter or member 'session' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'snd_nxt_state' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'rcv_nxt_state' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'in_session' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'active' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'if_name' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'rst_cnt' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'drop_point' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'failover_reasm_skb' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'transmq' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'backlog' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'backlog.len' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'backlog.limit' not described in 'tipc_link'
>> net/tipc/link.c:198: warning: Function parameter or member 'backlog.target_bskb' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'snd_nxt' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'last_retransm' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'window' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'rcv_unacked' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'deferdq' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'bc_rcvlink' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'bc_sndlink' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'prev_retr' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'prev_from' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'prev_to' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'nack_state' not described in 'tipc_link'
   net/tipc/link.c:198: warning: Function parameter or member 'bc_peer_is_up' not described in 'tipc_link'
   net/tipc/link.c:450: warning: Function parameter or member 'net' not described in 'tipc_link_create'
   net/tipc/link.c:450: warning: Function parameter or member 'self' not described in 'tipc_link_create'
   net/tipc/link.c:450: warning: Function parameter or member 'peer_id' not described in 'tipc_link_create'
   net/tipc/link.c:450: warning: Excess function parameter 'n' description in 'tipc_link_create'
   net/tipc/link.c:450: warning: Excess function parameter 'ownnode' description in 'tipc_link_create'
   net/tipc/link.c:519: warning: Function parameter or member 'net' not described in 'tipc_link_bc_create'
   net/tipc/link.c:519: warning: Function parameter or member 'ownnode' not described in 'tipc_link_bc_create'
   net/tipc/link.c:519: warning: Function parameter or member 'peer' not described in 'tipc_link_bc_create'
   net/tipc/link.c:519: warning: Function parameter or member 'peer_caps' not described in 'tipc_link_bc_create'
   net/tipc/link.c:519: warning: Function parameter or member 'bc_sndlink' not described in 'tipc_link_bc_create'
   net/tipc/link.c:519: warning: Excess function parameter 'n' description in 'tipc_link_bc_create'
   net/tipc/link.c:903: warning: Function parameter or member 'l' not described in 'tipc_link_xmit'
   net/tipc/link.c:903: warning: Excess function parameter 'link' description in 'tipc_link_xmit'


vim +198 net/tipc/link.c

38206d59390684 Jon Paul Maloy 2015-11-19   78  
38206d59390684 Jon Paul Maloy 2015-11-19   79  /**
38206d59390684 Jon Paul Maloy 2015-11-19   80   * struct tipc_link - TIPC link data structure
38206d59390684 Jon Paul Maloy 2015-11-19   81   * @addr: network address of link's peer node
38206d59390684 Jon Paul Maloy 2015-11-19   82   * @name: link name character string
38206d59390684 Jon Paul Maloy 2015-11-19   83   * @media_addr: media address to use when sending messages over link
38206d59390684 Jon Paul Maloy 2015-11-19   84   * @timer: link timer
38206d59390684 Jon Paul Maloy 2015-11-19   85   * @net: pointer to namespace struct
38206d59390684 Jon Paul Maloy 2015-11-19   86   * @refcnt: reference counter for permanent references (owner node & timer)
38206d59390684 Jon Paul Maloy 2015-11-19   87   * @peer_session: link session # being used by peer end of link
38206d59390684 Jon Paul Maloy 2015-11-19   88   * @peer_bearer_id: bearer id used by link's peer endpoint
38206d59390684 Jon Paul Maloy 2015-11-19   89   * @bearer_id: local bearer id used by link
38206d59390684 Jon Paul Maloy 2015-11-19   90   * @tolerance: minimum link continuity loss needed to reset link [in ms]
38206d59390684 Jon Paul Maloy 2015-11-19   91   * @abort_limit: # of unacknowledged continuity probes needed to reset link
38206d59390684 Jon Paul Maloy 2015-11-19   92   * @state: current state of link FSM
38206d59390684 Jon Paul Maloy 2015-11-19   93   * @peer_caps: bitmap describing capabilities of peer node
38206d59390684 Jon Paul Maloy 2015-11-19   94   * @silent_intv_cnt: # of timer intervals without any reception from peer
38206d59390684 Jon Paul Maloy 2015-11-19   95   * @proto_msg: template for control messages generated by link
38206d59390684 Jon Paul Maloy 2015-11-19   96   * @pmsg: convenience pointer to "proto_msg" field
38206d59390684 Jon Paul Maloy 2015-11-19   97   * @priority: current link priority
38206d59390684 Jon Paul Maloy 2015-11-19   98   * @net_plane: current link network plane ('A' through 'H')
35c55c9877f8de Jon Paul Maloy 2016-06-13   99   * @mon_state: cookie with information needed by link monitor
38206d59390684 Jon Paul Maloy 2015-11-19  100   * @backlog_limit: backlog queue congestion thresholds (indexed by importance)
38206d59390684 Jon Paul Maloy 2015-11-19  101   * @exp_msg_count: # of tunnelled messages expected during link changeover
38206d59390684 Jon Paul Maloy 2015-11-19  102   * @reset_rcv_checkpt: seq # of last acknowledged message at time of link reset
38206d59390684 Jon Paul Maloy 2015-11-19  103   * @mtu: current maximum packet size for this link
38206d59390684 Jon Paul Maloy 2015-11-19  104   * @advertised_mtu: advertised own mtu when link is being established
38206d59390684 Jon Paul Maloy 2015-11-19  105   * @transmitq: queue for sent, non-acked messages
38206d59390684 Jon Paul Maloy 2015-11-19  106   * @backlogq: queue for messages waiting to be sent
38206d59390684 Jon Paul Maloy 2015-11-19  107   * @snt_nxt: next sequence number to use for outbound messages
38206d59390684 Jon Paul Maloy 2015-11-19  108   * @last_retransmitted: sequence number of most recently retransmitted message
a4dc70d46cf1a0 Jon Maloy      2018-07-06  109   * @stale_cnt: counter for number of identical retransmit attempts
a4dc70d46cf1a0 Jon Maloy      2018-07-06  110   * @stale_limit: time when repeated identical retransmits must force link reset
38206d59390684 Jon Paul Maloy 2015-11-19  111   * @ackers: # of peers that needs to ack each packet before it can be released
38206d59390684 Jon Paul Maloy 2015-11-19  112   * @acked: # last packet acked by a certain peer. Used for broadcast.
38206d59390684 Jon Paul Maloy 2015-11-19  113   * @rcv_nxt: next sequence number to expect for inbound messages
38206d59390684 Jon Paul Maloy 2015-11-19  114   * @deferred_queue: deferred queue saved OOS b'cast message received from node
38206d59390684 Jon Paul Maloy 2015-11-19  115   * @unacked_window: # of inbound messages rx'd without ack'ing back to peer
38206d59390684 Jon Paul Maloy 2015-11-19  116   * @inputq: buffer queue for messages to be delivered upwards
38206d59390684 Jon Paul Maloy 2015-11-19  117   * @namedq: buffer queue for name table messages to be delivered upwards
38206d59390684 Jon Paul Maloy 2015-11-19  118   * @next_out: ptr to first unsent outbound message in queue
38206d59390684 Jon Paul Maloy 2015-11-19  119   * @wakeupq: linked list of wakeup msgs waiting for link congestion to abate
38206d59390684 Jon Paul Maloy 2015-11-19  120   * @long_msg_seq_no: next identifier to use for outbound fragmented messages
38206d59390684 Jon Paul Maloy 2015-11-19  121   * @reasm_buf: head of partially reassembled inbound message fragments
38206d59390684 Jon Paul Maloy 2015-11-19  122   * @bc_rcvr: marks that this is a broadcast receiver link
38206d59390684 Jon Paul Maloy 2015-11-19  123   * @stats: collects statistics regarding link activity
38206d59390684 Jon Paul Maloy 2015-11-19  124   */
38206d59390684 Jon Paul Maloy 2015-11-19  125  struct tipc_link {
38206d59390684 Jon Paul Maloy 2015-11-19  126  	u32 addr;
38206d59390684 Jon Paul Maloy 2015-11-19  127  	char name[TIPC_MAX_LINK_NAME];
38206d59390684 Jon Paul Maloy 2015-11-19  128  	struct net *net;
38206d59390684 Jon Paul Maloy 2015-11-19  129  
38206d59390684 Jon Paul Maloy 2015-11-19  130  	/* Management and link supervision data */
7ea817f4e8322f Jon Maloy      2018-07-10  131  	u16 peer_session;
7ea817f4e8322f Jon Maloy      2018-07-10  132  	u16 session;
9012de50895601 Jon Maloy      2018-07-10  133  	u16 snd_nxt_state;
9012de50895601 Jon Maloy      2018-07-10  134  	u16 rcv_nxt_state;
38206d59390684 Jon Paul Maloy 2015-11-19  135  	u32 peer_bearer_id;
38206d59390684 Jon Paul Maloy 2015-11-19  136  	u32 bearer_id;
38206d59390684 Jon Paul Maloy 2015-11-19  137  	u32 tolerance;
38206d59390684 Jon Paul Maloy 2015-11-19  138  	u32 abort_limit;
38206d59390684 Jon Paul Maloy 2015-11-19  139  	u32 state;
38206d59390684 Jon Paul Maloy 2015-11-19  140  	u16 peer_caps;
7ea817f4e8322f Jon Maloy      2018-07-10  141  	bool in_session;
38206d59390684 Jon Paul Maloy 2015-11-19  142  	bool active;
38206d59390684 Jon Paul Maloy 2015-11-19  143  	u32 silent_intv_cnt;
e74a386d70c793 Jon Paul Maloy 2016-03-03  144  	char if_name[TIPC_MAX_IF_NAME];
38206d59390684 Jon Paul Maloy 2015-11-19  145  	u32 priority;
38206d59390684 Jon Paul Maloy 2015-11-19  146  	char net_plane;
35c55c9877f8de Jon Paul Maloy 2016-06-13  147  	struct tipc_mon_state mon_state;
88e8ac7000dc7c Jon Paul Maloy 2016-04-15  148  	u16 rst_cnt;
38206d59390684 Jon Paul Maloy 2015-11-19  149  
38206d59390684 Jon Paul Maloy 2015-11-19  150  	/* Failover/synch */
38206d59390684 Jon Paul Maloy 2015-11-19  151  	u16 drop_point;
38206d59390684 Jon Paul Maloy 2015-11-19  152  	struct sk_buff *failover_reasm_skb;
38206d59390684 Jon Paul Maloy 2015-11-19  153  
38206d59390684 Jon Paul Maloy 2015-11-19  154  	/* Max packet negotiation */
38206d59390684 Jon Paul Maloy 2015-11-19  155  	u16 mtu;
38206d59390684 Jon Paul Maloy 2015-11-19  156  	u16 advertised_mtu;
38206d59390684 Jon Paul Maloy 2015-11-19  157  
38206d59390684 Jon Paul Maloy 2015-11-19  158  	/* Sending */
38206d59390684 Jon Paul Maloy 2015-11-19  159  	struct sk_buff_head transmq;
38206d59390684 Jon Paul Maloy 2015-11-19  160  	struct sk_buff_head backlogq;
38206d59390684 Jon Paul Maloy 2015-11-19  161  	struct {
38206d59390684 Jon Paul Maloy 2015-11-19  162  		u16 len;
38206d59390684 Jon Paul Maloy 2015-11-19  163  		u16 limit;
eb923245b9deef Tuong Lien     2019-10-10  164  		struct sk_buff *target_bskb;
38206d59390684 Jon Paul Maloy 2015-11-19  165  	} backlog[5];
38206d59390684 Jon Paul Maloy 2015-11-19  166  	u16 snd_nxt;
38206d59390684 Jon Paul Maloy 2015-11-19  167  	u16 last_retransm;
38206d59390684 Jon Paul Maloy 2015-11-19  168  	u16 window;
a4dc70d46cf1a0 Jon Maloy      2018-07-06  169  	u16 stale_cnt;
a4dc70d46cf1a0 Jon Maloy      2018-07-06  170  	unsigned long stale_limit;
38206d59390684 Jon Paul Maloy 2015-11-19  171  
38206d59390684 Jon Paul Maloy 2015-11-19  172  	/* Reception */
38206d59390684 Jon Paul Maloy 2015-11-19  173  	u16 rcv_nxt;
38206d59390684 Jon Paul Maloy 2015-11-19  174  	u32 rcv_unacked;
38206d59390684 Jon Paul Maloy 2015-11-19  175  	struct sk_buff_head deferdq;
38206d59390684 Jon Paul Maloy 2015-11-19  176  	struct sk_buff_head *inputq;
38206d59390684 Jon Paul Maloy 2015-11-19  177  	struct sk_buff_head *namedq;
38206d59390684 Jon Paul Maloy 2015-11-19  178  
38206d59390684 Jon Paul Maloy 2015-11-19  179  	/* Congestion handling */
38206d59390684 Jon Paul Maloy 2015-11-19  180  	struct sk_buff_head wakeupq;
38206d59390684 Jon Paul Maloy 2015-11-19  181  
38206d59390684 Jon Paul Maloy 2015-11-19  182  	/* Fragmentation/reassembly */
38206d59390684 Jon Paul Maloy 2015-11-19  183  	struct sk_buff *reasm_buf;
38206d59390684 Jon Paul Maloy 2015-11-19  184  
38206d59390684 Jon Paul Maloy 2015-11-19  185  	/* Broadcast */
38206d59390684 Jon Paul Maloy 2015-11-19  186  	u16 ackers;
38206d59390684 Jon Paul Maloy 2015-11-19  187  	u16 acked;
38206d59390684 Jon Paul Maloy 2015-11-19  188  	struct tipc_link *bc_rcvlink;
38206d59390684 Jon Paul Maloy 2015-11-19  189  	struct tipc_link *bc_sndlink;
7c4a54b963b68e Jon Paul Maloy 2016-09-01  190  	unsigned long prev_retr;
7c4a54b963b68e Jon Paul Maloy 2016-09-01  191  	u16 prev_from;
7c4a54b963b68e Jon Paul Maloy 2016-09-01  192  	u16 prev_to;
7c4a54b963b68e Jon Paul Maloy 2016-09-01  193  	u8 nack_state;
38206d59390684 Jon Paul Maloy 2015-11-19  194  	bool bc_peer_is_up;
38206d59390684 Jon Paul Maloy 2015-11-19  195  
38206d59390684 Jon Paul Maloy 2015-11-19  196  	/* Statistics */
38206d59390684 Jon Paul Maloy 2015-11-19  197  	struct tipc_stats stats;
38206d59390684 Jon Paul Maloy 2015-11-19 @198  };
38206d59390684 Jon Paul Maloy 2015-11-19  199  

:::::: The code at line 198 was first introduced by commit
:::::: 38206d5939068415c413ac253be6f364d06e672f tipc: narrow down interface towards struct tipc_link

:::::: TO: Jon Paul Maloy <jon.maloy@ericsson.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
