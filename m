Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D515E1E3DED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765377329; cv=none; b=bglavH6S7N5LDCIwhksRCcRsHlPJU2D/a11ZoRTzHq8S7JFjz48iiCau2Iw7Y0DtrB2dZNjkbCBZTYG3JTZnXo5WsSEqJB+2bqDq2bdmNgVt8xvUucSD37Q8MUDE+B7q7yVQkLJ/aA6Iwc9fwzBTZrb2LVH9D/aH8G+0EMa60hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765377329; c=relaxed/simple;
	bh=1tVrhZvjABnNQjwMtExlMhvBLGOFQTZfS3nEO7LVidY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V1ezAxSUerxrLIdJvYk2Mdppml3V6QnUit4agzeaSo/gHU5fdQEoO1M76kCOXVwQNz2vDpiTrBFVRgqzoGWEmnmQqNdQFzB9mr0SDYEcugVjnCkMTBoAmau7XPuHIMIPZQmRwqdSW54clbyq9yjsmBa6Ci5F0Rn40e54wa4BTPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnLTo8L+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnLTo8L+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765377326; x=1796913326;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1tVrhZvjABnNQjwMtExlMhvBLGOFQTZfS3nEO7LVidY=;
  b=XnLTo8L+tBvSKz4Q3KQ5/oCiV0e8wtHDm8S3ZBJ5bFFDcsNVz1MzyrS0
   c8e/giizDKAhVE3QfhCTSwaReXZ4KrxiYbgNF8LkKF+mxtqrM0n+4d0LG
   L6k3MDkTOfKt/aHLA9KWLbysENK+PKyKPXnWRkPYb2N4uKZ/9klqhUasy
   M8fyN8Zk3z6Tp1WHvIWA01aLcKPYFHLz+LDbDlFEH58wsDRPxJfQOgMFS
   D19F39A4PdsgAvbt2JlGnEmR1zIZfvNE0T0jyjoyY/IUL+4r/srG2E2Sh
   IfcTrrf3jpMcDUrDE44rn2lSckzTrIV4Ob/AtT+1bg6YfmJvmVldNZfXP
   Q==;
X-CSE-ConnectionGUID: hPTlk/BnRT2vjRevVvdMWA==
X-CSE-MsgGUID: 1RU3zOUfSx66cOtr8RyYSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67307708"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67307708"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 06:35:26 -0800
X-CSE-ConnectionGUID: G6ETtbpwTcmirIrxK+1q9w==
X-CSE-MsgGUID: s8FHw6EcSPuA+ccb+RdE9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196436453"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Dec 2025 06:35:25 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTLHm-000000000cq-2NkE;
	Wed, 10 Dec 2025 14:35:22 +0000
Date: Wed, 10 Dec 2025 15:34:42 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhengchao Shao <shaozhengchao@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] htmldocs: ./include/net/sock.h:556:
 warning: Function parameter or member 'sk_gid_padding' not described in
 'sock'
Message-ID: <202512101505.lwW2LgkN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7bf6051b5c404918d02133a7e2aad8b059d6f6b0
commit: e14009474396762cbc7231fda683da7980880ad7 [3508/3508] net: core: Add a GID field to struct sock.
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512101505.lwW2LgkN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101505.lwW2LgkN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/ethtool.h
   Error: Cannot open file ./include/linux/net.h
   Error: Cannot open file ./include/linux/net.h
   Error: Cannot open file ./include/linux/skbuff.h
   Error: Cannot open file ./include/linux/skbuff.h
>> ./include/net/sock.h:556: warning: Function parameter or member 'sk_gid_padding' not described in 'sock'
   Error: Cannot open file ./include/linux/etherdevice.h
   Error: Cannot open file ./include/linux/etherdevice.h
   Error: Cannot open file ./include/linux/netdevice.h
   Error: Cannot open file ./include/linux/netdevice.h
   Error: Cannot open file ./include/linux/phy.h


vim +556 ./include/net/sock.h

0c0a5ef809f915 Eric Dumazet             2021-10-25  445  
0e36cbb344575e Cong Wang                2013-01-22  446  	struct dst_entry __rcu	*sk_dst_cache;
^1da177e4c3f41 Linus Torvalds           2005-04-16  447  	atomic_t		sk_omem_alloc;
4e07a91c37c69e Arnaldo Carvalho de Melo 2007-05-29  448  	int			sk_sndbuf;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  449  
9115e8cd2a0c6e Eric Dumazet             2016-12-03  450  	/* ===== cache line for TX ===== */
9115e8cd2a0c6e Eric Dumazet             2016-12-03  451  	int			sk_wmem_queued;
14afee4b6092fd Reshetova, Elena         2017-06-30  452  	refcount_t		sk_wmem_alloc;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  453  	unsigned long		sk_tsq_flags;
75c119afe14f74 Eric Dumazet             2017-10-05  454  	union {
9115e8cd2a0c6e Eric Dumazet             2016-12-03  455  		struct sk_buff	*sk_send_head;
75c119afe14f74 Eric Dumazet             2017-10-05  456  		struct rb_root	tcp_rtx_queue;
75c119afe14f74 Eric Dumazet             2017-10-05  457  	};
^1da177e4c3f41 Linus Torvalds           2005-04-16  458  	struct sk_buff_head	sk_write_queue;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  459  	__s32			sk_peek_off;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  460  	int			sk_write_pending;
9b8805a325591c Julian Anastasov         2017-02-06  461  	__u32			sk_dst_pending_confirm;
218af599fa635b Eric Dumazet             2017-05-16  462  	u32			sk_pacing_status; /* see enum sk_pacing */
9115e8cd2a0c6e Eric Dumazet             2016-12-03  463  	long			sk_sndtimeo;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  464  	struct timer_list	sk_timer;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  465  	__u32			sk_priority;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  466  	__u32			sk_mark;
76a9ebe811fb3d Eric Dumazet             2018-10-15  467  	unsigned long		sk_pacing_rate; /* bytes per second */
76a9ebe811fb3d Eric Dumazet             2018-10-15  468  	unsigned long		sk_max_pacing_rate;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  469  	struct page_frag	sk_frag;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  470  	netdev_features_t	sk_route_caps;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  471  	int			sk_gso_type;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  472  	unsigned int		sk_gso_max_size;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  473  	gfp_t			sk_allocation;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  474  	__u32			sk_txhash;
fc64869c48494a Andrey Ryabinin          2016-05-18  475  
fc64869c48494a Andrey Ryabinin          2016-05-18  476  	/*
fc64869c48494a Andrey Ryabinin          2016-05-18  477  	 * Because of non atomicity rules, all
fc64869c48494a Andrey Ryabinin          2016-05-18  478  	 * changes are protected by socket lock.
fc64869c48494a Andrey Ryabinin          2016-05-18  479  	 */
aba546565b613e Eric Dumazet             2021-11-15  480  	u8			sk_gso_disabled : 1,
cdfbabfb2f0ce9 David Howells            2017-03-09  481  				sk_kern_sock : 1,
28448b80456fea Tom Herbert              2014-05-23  482  				sk_no_check_tx : 1,
28448b80456fea Tom Herbert              2014-05-23  483  				sk_no_check_rx : 1,
bf9765145b856f Mat Martineau            2020-01-09  484  				sk_userlocks : 4;
3a9b76fd0db9f0 Eric Dumazet             2017-11-11  485  	u8			sk_pacing_shift;
bf9765145b856f Mat Martineau            2020-01-09  486  	u16			sk_type;
bf9765145b856f Mat Martineau            2020-01-09  487  	u16			sk_protocol;
bf9765145b856f Mat Martineau            2020-01-09  488  	u16			sk_gso_max_segs;
^1da177e4c3f41 Linus Torvalds           2005-04-16  489  	unsigned long	        sk_lingertime;
476e19cfa131e2 Arnaldo Carvalho de Melo 2005-05-05  490  	struct proto		*sk_prot_creator;
^1da177e4c3f41 Linus Torvalds           2005-04-16  491  	rwlock_t		sk_callback_lock;
^1da177e4c3f41 Linus Torvalds           2005-04-16  492  	int			sk_err,
^1da177e4c3f41 Linus Torvalds           2005-04-16  493  				sk_err_soft;
becb74f0acca19 Eric Dumazet             2015-03-19  494  	u32			sk_ack_backlog;
becb74f0acca19 Eric Dumazet             2015-03-19  495  	u32			sk_max_ack_backlog;
86741ec25462e4 Lorenzo Colitti          2016-11-04  496  	kuid_t			sk_uid;
26859240e4ee70 Akhmat Karakotov         2022-01-31  497  	u8			sk_txrehash;
7fd3253a7de6a3 Björn Töpel              2020-11-30  498  #ifdef CONFIG_NET_RX_BUSY_POLL
7fd3253a7de6a3 Björn Töpel              2020-11-30  499  	u8			sk_prefer_busy_poll;
7c951cafc0cb2e Björn Töpel              2020-11-30  500  	u16			sk_busy_poll_budget;
7fd3253a7de6a3 Björn Töpel              2020-11-30  501  #endif
35306eb2381444 Eric Dumazet             2021-09-29  502  	spinlock_t		sk_peer_lock;
1ace2b4d2b4e1d Eric Dumazet             2021-11-15  503  	int			sk_bind_phc;
109f6e39fa07c4 Eric W. Biederman        2010-06-13  504  	struct pid		*sk_peer_pid;
109f6e39fa07c4 Eric W. Biederman        2010-06-13  505  	const struct cred	*sk_peer_cred;
35306eb2381444 Eric Dumazet             2021-09-29  506  
^1da177e4c3f41 Linus Torvalds           2005-04-16  507  	long			sk_rcvtimeo;
b7aa0bf70c4afb Eric Dumazet             2007-04-19  508  	ktime_t			sk_stamp;
3a0ed3e9619738 Deepa Dinamani           2018-12-27  509  #if BITS_PER_LONG==32
3a0ed3e9619738 Deepa Dinamani           2018-12-27  510  	seqlock_t		sk_stamp_seq;
3a0ed3e9619738 Deepa Dinamani           2018-12-27  511  #endif
a1cdec57e03a13 Eric Dumazet             2022-02-17  512  	atomic_t		sk_tskey;
52267790ef52d7 Willem de Bruijn         2017-08-03  513  	atomic_t		sk_zckey;
b534dc46c8ae01 Willem de Bruijn         2022-12-07  514  	u32			sk_tsflags;
b534dc46c8ae01 Willem de Bruijn         2022-12-07  515  	u8			sk_shutdown;
80b14dee2bea12 Richard Cochran          2018-07-03  516  
80b14dee2bea12 Richard Cochran          2018-07-03  517  	u8			sk_clockid;
80b14dee2bea12 Richard Cochran          2018-07-03  518  	u8			sk_txtime_deadline_mode : 1,
4b15c707535266 Jesus Sanchez-Palencia   2018-07-03  519  				sk_txtime_report_errors : 1,
4b15c707535266 Jesus Sanchez-Palencia   2018-07-03  520  				sk_txtime_unused : 6;
fb87bd47516d9a Guillaume Nault          2022-12-16  521  	bool			sk_use_task_frag;
80b14dee2bea12 Richard Cochran          2018-07-03  522  
^1da177e4c3f41 Linus Torvalds           2005-04-16  523  	struct socket		*sk_socket;
^1da177e4c3f41 Linus Torvalds           2005-04-16  524  	void			*sk_user_data;
d5f642384e9da7 Alexey Dobriyan          2008-11-04  525  #ifdef CONFIG_SECURITY
^1da177e4c3f41 Linus Torvalds           2005-04-16  526  	void			*sk_security;
d5f642384e9da7 Alexey Dobriyan          2008-11-04  527  #endif
2a56a1fec290bf Tejun Heo                2015-12-07  528  	struct sock_cgroup_data	sk_cgrp_data;
baac50bbc3cdfd Johannes Weiner          2016-01-14  529  	struct mem_cgroup	*sk_memcg;
^1da177e4c3f41 Linus Torvalds           2005-04-16  530  	void			(*sk_state_change)(struct sock *sk);
676d23690fb62b David S. Miller          2014-04-11  531  	void			(*sk_data_ready)(struct sock *sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  532  	void			(*sk_write_space)(struct sock *sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  533  	void			(*sk_error_report)(struct sock *sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  534  	int			(*sk_backlog_rcv)(struct sock *sk,
^1da177e4c3f41 Linus Torvalds           2005-04-16  535  						  struct sk_buff *skb);
ebf4e808fa0b22 Ilya Lesokhin            2018-04-30  536  #ifdef CONFIG_SOCK_VALIDATE_XMIT
ebf4e808fa0b22 Ilya Lesokhin            2018-04-30  537  	struct sk_buff*		(*sk_validate_xmit_skb)(struct sock *sk,
ebf4e808fa0b22 Ilya Lesokhin            2018-04-30  538  							struct net_device *dev,
ebf4e808fa0b22 Ilya Lesokhin            2018-04-30  539  							struct sk_buff *skb);
ebf4e808fa0b22 Ilya Lesokhin            2018-04-30  540  #endif
^1da177e4c3f41 Linus Torvalds           2005-04-16  541  	void                    (*sk_destruct)(struct sock *sk);
ef456144da8ef5 Craig Gallek             2016-01-04  542  	struct sock_reuseport __rcu	*sk_reuseport_cb;
6ac99e8f23d4b1 Martin KaFai Lau         2019-04-26  543  #ifdef CONFIG_BPF_SYSCALL
1f00d375af84fb KP Singh                 2020-08-25  544  	struct bpf_local_storage __rcu	*sk_bpf_storage;
6ac99e8f23d4b1 Martin KaFai Lau         2019-04-26  545  #endif
a4298e4522d687 Eric Dumazet             2016-04-01  546  	struct rcu_head		sk_rcu;
ffa84b5ffb37a9 Eric Dumazet             2021-12-09  547  	netns_tracker		ns_tracker;
28044fc1d4953b Joanne Koong             2022-08-22  548  	struct hlist_node	sk_bind2_node;
e1400947439676 Lu Wei                   2024-01-15  549  
e1400947439676 Lu Wei                   2024-01-15  550  #if IS_ENABLED(CONFIG_NETACC_TERRACE)
e1400947439676 Lu Wei                   2024-01-15  551  	union {
e1400947439676 Lu Wei                   2024-01-15  552  		kgid_t	sk_gid;
e1400947439676 Lu Wei                   2024-01-15  553  		u64	sk_gid_padding;
e1400947439676 Lu Wei                   2024-01-15  554  	};
e1400947439676 Lu Wei                   2024-01-15  555  #endif
^1da177e4c3f41 Linus Torvalds           2005-04-16 @556  };
^1da177e4c3f41 Linus Torvalds           2005-04-16  557  

:::::: The code at line 556 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
