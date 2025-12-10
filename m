Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA992EA15B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 18:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393173; cv=none; b=spr8gdVg7IJuxedr3kKDXcww+jMnQW3UgKum+FHofN/XIIAKU7f7J+A1j2Z69t8MdnpranSBtFMxPkuXNHQIyNJytKyI2btR0Q9n80oCuJLw9bddn31RgNAsbsBTcIgXiB92nIzJD7x46h5p66Wgex+OZVyoUG4YDP7YQ3k2+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393173; c=relaxed/simple;
	bh=n7sq/yEOgr/zEdsa74OA1HOGbIT6L0E4yafC7/umqKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AVH5TOcKowhC5zP6dj7zNe5n6g2YReqlA1WHC/1WfhW322zFlB3qu4HdvE7vtxs6PwSVBLSYT7wVPklT9rcP8kXN8N0N9p+8etPfsaTUGJtU5O+aRGdekdBAXVb9c/7MvEORGJ1fXC0BXOJcBGjGOZ8APVe5IGnNAk6pfaOZ+1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNk4yfE/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNk4yfE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765393172; x=1796929172;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=n7sq/yEOgr/zEdsa74OA1HOGbIT6L0E4yafC7/umqKk=;
  b=GNk4yfE/fwh1UAWpoY94DKldNx+KE1x5Buvqlx1R7ceR4wj4/huLsnrt
   dKzRftNsBREgM/N+2FKhBkdU8BLSrVgeL5B/d5FQTBn7AQFuXbPbV99rR
   /+zN3oGCETlMCcxd3rHw99O7owlJ9ZTpIjP0BlBuk5lGSgigKRgTfDt4j
   yRPZYp8Hvq4F5TyZLEm81F6jh67O9NgPMW2k6vEJlSUhLuKPC6m1NZcOh
   SQBzaHHr3+ygnidkOk4v1r+d37hGPDvvY/Epd3so1GDsottAsyrB9Ijy4
   5nZLFejGHNMFReA5XvrtHpIbpKQvDtL9lgJ/ijwC4Nv4NwA7YXNZ9pfXq
   Q==;
X-CSE-ConnectionGUID: B2hgaGoRQlyjqmBCHzcJOA==
X-CSE-MsgGUID: C6LFeFUERlG2Y2BRlaqzfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="66372823"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="66372823"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 10:59:31 -0800
X-CSE-ConnectionGUID: 8ZOeBFveRMSdAg/4fBdg3Q==
X-CSE-MsgGUID: lc7EUyoaT8KikZv7FB3+Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="201513031"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2025 10:59:30 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTPPM-000000000ke-0JxT;
	Wed, 10 Dec 2025 18:59:28 +0000
Date: Wed, 10 Dec 2025 19:59:09 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhengchao Shao <shaozhengchao@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] htmldocs: ./include/net/sock.h:565:
 warning: Function parameter or member 'KABI_RESERVE(1' not described in
 'sock'
Message-ID: <202512101931.GzBZ9X3t-lkp@intel.com>
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
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: 5d35419049ac52ff0043c67ba9745a43c19298ae [3508/3508] kabi: net: reserve space for net base subsystem related structure
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512101931.GzBZ9X3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101931.GzBZ9X3t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/net.h
   Error: Cannot open file ./include/linux/net.h
   Error: Cannot open file ./include/linux/skbuff.h
   Error: Cannot open file ./include/linux/skbuff.h
   ./include/net/sock.h:565: warning: Function parameter or member 'sk_gid_padding' not described in 'sock'
>> ./include/net/sock.h:565: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'sock'
   Error: Cannot open file ./include/linux/etherdevice.h
   Error: Cannot open file ./include/linux/etherdevice.h
   Error: Cannot open file ./include/linux/netdevice.h
   Error: Cannot open file ./include/linux/netdevice.h
   Error: Cannot open file ./include/linux/phy.h


vim +565 ./include/net/sock.h

0c0a5ef809f915 Eric Dumazet             2021-10-25  446  
0e36cbb344575e Cong Wang                2013-01-22  447  	struct dst_entry __rcu	*sk_dst_cache;
^1da177e4c3f41 Linus Torvalds           2005-04-16  448  	atomic_t		sk_omem_alloc;
4e07a91c37c69e Arnaldo Carvalho de Melo 2007-05-29  449  	int			sk_sndbuf;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  450  
9115e8cd2a0c6e Eric Dumazet             2016-12-03  451  	/* ===== cache line for TX ===== */
9115e8cd2a0c6e Eric Dumazet             2016-12-03  452  	int			sk_wmem_queued;
14afee4b6092fd Reshetova, Elena         2017-06-30  453  	refcount_t		sk_wmem_alloc;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  454  	unsigned long		sk_tsq_flags;
75c119afe14f74 Eric Dumazet             2017-10-05  455  	union {
9115e8cd2a0c6e Eric Dumazet             2016-12-03  456  		struct sk_buff	*sk_send_head;
75c119afe14f74 Eric Dumazet             2017-10-05  457  		struct rb_root	tcp_rtx_queue;
75c119afe14f74 Eric Dumazet             2017-10-05  458  	};
^1da177e4c3f41 Linus Torvalds           2005-04-16  459  	struct sk_buff_head	sk_write_queue;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  460  	__s32			sk_peek_off;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  461  	int			sk_write_pending;
9b8805a325591c Julian Anastasov         2017-02-06  462  	__u32			sk_dst_pending_confirm;
218af599fa635b Eric Dumazet             2017-05-16  463  	u32			sk_pacing_status; /* see enum sk_pacing */
9115e8cd2a0c6e Eric Dumazet             2016-12-03  464  	long			sk_sndtimeo;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  465  	struct timer_list	sk_timer;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  466  	__u32			sk_priority;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  467  	__u32			sk_mark;
76a9ebe811fb3d Eric Dumazet             2018-10-15  468  	unsigned long		sk_pacing_rate; /* bytes per second */
76a9ebe811fb3d Eric Dumazet             2018-10-15  469  	unsigned long		sk_max_pacing_rate;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  470  	struct page_frag	sk_frag;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  471  	netdev_features_t	sk_route_caps;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  472  	int			sk_gso_type;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  473  	unsigned int		sk_gso_max_size;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  474  	gfp_t			sk_allocation;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  475  	__u32			sk_txhash;
fc64869c48494a Andrey Ryabinin          2016-05-18  476  
fc64869c48494a Andrey Ryabinin          2016-05-18  477  	/*
fc64869c48494a Andrey Ryabinin          2016-05-18  478  	 * Because of non atomicity rules, all
fc64869c48494a Andrey Ryabinin          2016-05-18  479  	 * changes are protected by socket lock.
fc64869c48494a Andrey Ryabinin          2016-05-18  480  	 */
aba546565b613e Eric Dumazet             2021-11-15  481  	u8			sk_gso_disabled : 1,
cdfbabfb2f0ce9 David Howells            2017-03-09  482  				sk_kern_sock : 1,
28448b80456fea Tom Herbert              2014-05-23  483  				sk_no_check_tx : 1,
28448b80456fea Tom Herbert              2014-05-23  484  				sk_no_check_rx : 1,
bf9765145b856f Mat Martineau            2020-01-09  485  				sk_userlocks : 4;
3a9b76fd0db9f0 Eric Dumazet             2017-11-11  486  	u8			sk_pacing_shift;
bf9765145b856f Mat Martineau            2020-01-09  487  	u16			sk_type;
bf9765145b856f Mat Martineau            2020-01-09  488  	u16			sk_protocol;
bf9765145b856f Mat Martineau            2020-01-09  489  	u16			sk_gso_max_segs;
^1da177e4c3f41 Linus Torvalds           2005-04-16  490  	unsigned long	        sk_lingertime;
476e19cfa131e2 Arnaldo Carvalho de Melo 2005-05-05  491  	struct proto		*sk_prot_creator;
^1da177e4c3f41 Linus Torvalds           2005-04-16  492  	rwlock_t		sk_callback_lock;
^1da177e4c3f41 Linus Torvalds           2005-04-16  493  	int			sk_err,
^1da177e4c3f41 Linus Torvalds           2005-04-16  494  				sk_err_soft;
becb74f0acca19 Eric Dumazet             2015-03-19  495  	u32			sk_ack_backlog;
becb74f0acca19 Eric Dumazet             2015-03-19  496  	u32			sk_max_ack_backlog;
86741ec25462e4 Lorenzo Colitti          2016-11-04  497  	kuid_t			sk_uid;
26859240e4ee70 Akhmat Karakotov         2022-01-31  498  	u8			sk_txrehash;
7fd3253a7de6a3 Björn Töpel              2020-11-30  499  #ifdef CONFIG_NET_RX_BUSY_POLL
7fd3253a7de6a3 Björn Töpel              2020-11-30  500  	u8			sk_prefer_busy_poll;
7c951cafc0cb2e Björn Töpel              2020-11-30  501  	u16			sk_busy_poll_budget;
7fd3253a7de6a3 Björn Töpel              2020-11-30  502  #endif
35306eb2381444 Eric Dumazet             2021-09-29  503  	spinlock_t		sk_peer_lock;
1ace2b4d2b4e1d Eric Dumazet             2021-11-15  504  	int			sk_bind_phc;
109f6e39fa07c4 Eric W. Biederman        2010-06-13  505  	struct pid		*sk_peer_pid;
109f6e39fa07c4 Eric W. Biederman        2010-06-13  506  	const struct cred	*sk_peer_cred;
35306eb2381444 Eric Dumazet             2021-09-29  507  
^1da177e4c3f41 Linus Torvalds           2005-04-16  508  	long			sk_rcvtimeo;
b7aa0bf70c4afb Eric Dumazet             2007-04-19  509  	ktime_t			sk_stamp;
3a0ed3e9619738 Deepa Dinamani           2018-12-27  510  #if BITS_PER_LONG==32
3a0ed3e9619738 Deepa Dinamani           2018-12-27  511  	seqlock_t		sk_stamp_seq;
3a0ed3e9619738 Deepa Dinamani           2018-12-27  512  #endif
a1cdec57e03a13 Eric Dumazet             2022-02-17  513  	atomic_t		sk_tskey;
52267790ef52d7 Willem de Bruijn         2017-08-03  514  	atomic_t		sk_zckey;
b534dc46c8ae01 Willem de Bruijn         2022-12-07  515  	u32			sk_tsflags;
b534dc46c8ae01 Willem de Bruijn         2022-12-07  516  	u8			sk_shutdown;
80b14dee2bea12 Richard Cochran          2018-07-03  517  
80b14dee2bea12 Richard Cochran          2018-07-03  518  	u8			sk_clockid;
80b14dee2bea12 Richard Cochran          2018-07-03  519  	u8			sk_txtime_deadline_mode : 1,
4b15c707535266 Jesus Sanchez-Palencia   2018-07-03  520  				sk_txtime_report_errors : 1,
4b15c707535266 Jesus Sanchez-Palencia   2018-07-03  521  				sk_txtime_unused : 6;
fb87bd47516d9a Guillaume Nault          2022-12-16  522  	bool			sk_use_task_frag;
80b14dee2bea12 Richard Cochran          2018-07-03  523  
^1da177e4c3f41 Linus Torvalds           2005-04-16  524  	struct socket		*sk_socket;
^1da177e4c3f41 Linus Torvalds           2005-04-16  525  	void			*sk_user_data;
d5f642384e9da7 Alexey Dobriyan          2008-11-04  526  #ifdef CONFIG_SECURITY
^1da177e4c3f41 Linus Torvalds           2005-04-16  527  	void			*sk_security;
d5f642384e9da7 Alexey Dobriyan          2008-11-04  528  #endif
2a56a1fec290bf Tejun Heo                2015-12-07  529  	struct sock_cgroup_data	sk_cgrp_data;
baac50bbc3cdfd Johannes Weiner          2016-01-14  530  	struct mem_cgroup	*sk_memcg;
^1da177e4c3f41 Linus Torvalds           2005-04-16  531  	void			(*sk_state_change)(struct sock *sk);
676d23690fb62b David S. Miller          2014-04-11  532  	void			(*sk_data_ready)(struct sock *sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  533  	void			(*sk_write_space)(struct sock *sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  534  	void			(*sk_error_report)(struct sock *sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  535  	int			(*sk_backlog_rcv)(struct sock *sk,
^1da177e4c3f41 Linus Torvalds           2005-04-16  536  						  struct sk_buff *skb);
ebf4e808fa0b22 Ilya Lesokhin            2018-04-30  537  #ifdef CONFIG_SOCK_VALIDATE_XMIT
ebf4e808fa0b22 Ilya Lesokhin            2018-04-30  538  	struct sk_buff*		(*sk_validate_xmit_skb)(struct sock *sk,
ebf4e808fa0b22 Ilya Lesokhin            2018-04-30  539  							struct net_device *dev,
ebf4e808fa0b22 Ilya Lesokhin            2018-04-30  540  							struct sk_buff *skb);
ebf4e808fa0b22 Ilya Lesokhin            2018-04-30  541  #endif
^1da177e4c3f41 Linus Torvalds           2005-04-16  542  	void                    (*sk_destruct)(struct sock *sk);
ef456144da8ef5 Craig Gallek             2016-01-04  543  	struct sock_reuseport __rcu	*sk_reuseport_cb;
6ac99e8f23d4b1 Martin KaFai Lau         2019-04-26  544  #ifdef CONFIG_BPF_SYSCALL
1f00d375af84fb KP Singh                 2020-08-25  545  	struct bpf_local_storage __rcu	*sk_bpf_storage;
6ac99e8f23d4b1 Martin KaFai Lau         2019-04-26  546  #endif
a4298e4522d687 Eric Dumazet             2016-04-01  547  	struct rcu_head		sk_rcu;
ffa84b5ffb37a9 Eric Dumazet             2021-12-09  548  	netns_tracker		ns_tracker;
28044fc1d4953b Joanne Koong             2022-08-22  549  	struct hlist_node	sk_bind2_node;
e1400947439676 Lu Wei                   2024-01-15  550  
e1400947439676 Lu Wei                   2024-01-15  551  #if IS_ENABLED(CONFIG_NETACC_TERRACE)
e1400947439676 Lu Wei                   2024-01-15  552  	union {
e1400947439676 Lu Wei                   2024-01-15  553  		kgid_t	sk_gid;
e1400947439676 Lu Wei                   2024-01-15  554  		u64	sk_gid_padding;
e1400947439676 Lu Wei                   2024-01-15  555  	};
e1400947439676 Lu Wei                   2024-01-15  556  #endif
5d35419049ac52 Wang Hai                 2024-01-17  557  	KABI_RESERVE(1)
5d35419049ac52 Wang Hai                 2024-01-17  558  	KABI_RESERVE(2)
5d35419049ac52 Wang Hai                 2024-01-17  559  	KABI_RESERVE(3)
5d35419049ac52 Wang Hai                 2024-01-17  560  	KABI_RESERVE(4)
5d35419049ac52 Wang Hai                 2024-01-17  561  	KABI_RESERVE(5)
5d35419049ac52 Wang Hai                 2024-01-17  562  	KABI_RESERVE(6)
5d35419049ac52 Wang Hai                 2024-01-17  563  	KABI_RESERVE(7)
5d35419049ac52 Wang Hai                 2024-01-17  564  	KABI_RESERVE(8)
^1da177e4c3f41 Linus Torvalds           2005-04-16 @565  };
^1da177e4c3f41 Linus Torvalds           2005-04-16  566  

:::::: The code at line 565 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
