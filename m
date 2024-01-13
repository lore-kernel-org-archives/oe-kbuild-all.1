Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD77E1EF03
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 00:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2Ca1ZjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705107330; x=1736643330;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/AYQNKb9rPL4YZ1YJzgyCl94CErkVjbPeatK4kq6a+M=;
  b=n2Ca1ZjC7sXXYhoQDgpr6Vj8UCVcv3nWyExGORtbCgMvajjgyKBOMozW
   KSBLIuyp3puuxGMnfVZw0CXMg7GXV1VweR94F51KuULesaKJN5yghswct
   1+4feJdM+Y4llIDyJU3KRfUtUJ9xg9I/9iILbcS2Njxb6yz4g5Ze/75zY
   AohBd0R1DdQqwMv4CTVExYCiQ1pjAD7nT5Uzw3zXdgFHLnro3hKV83ZVn
   eBYK8K6YeCHrhiDQV6SKStHEsCvAry+AbOFDq4gP808/y3ugT6sWL3c0u
   bEkYMoR03t3wcouJQECcvbCTGY6ZjLjNq8sHuB0PjDBHHJT5SOmCQFynz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12693244"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="12693244"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 16:55:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902149043"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="902149043"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Jan 2024 16:55:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOSJ2-0009wl-1m;
	Sat, 13 Jan 2024 00:55:24 +0000
Date: Sat, 13 Jan 2024 08:55:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 15688/15708] htmldocs:
 ./include/net/sock.h:547: warning: Function parameter or member 'oob_data'
 not described in 'sock'
Message-ID: <202401130832.KY1MMkmY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: c36cad6eceb9b8b5ac81ccf043b06f0772c41182 [15688/15708] net: dovetail: enable out-of-band networking (EXPERIMENTAL)
reproduce: (https://download.01.org/0day-ci/archive/20240113/202401130832.KY1MMkmY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401130832.KY1MMkmY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/net/sock.h:547: warning: Function parameter or member 'oob_data' not described in 'sock'

vim +547 ./include/net/sock.h

0c0a5ef809f9150 Eric Dumazet             2021-10-25  441  
0e36cbb344575e4 Cong Wang                2013-01-22  442  	struct dst_entry __rcu	*sk_dst_cache;
^1da177e4c3f415 Linus Torvalds           2005-04-16  443  	atomic_t		sk_omem_alloc;
4e07a91c37c69ec Arnaldo Carvalho de Melo 2007-05-29  444  	int			sk_sndbuf;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  445  
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  446  	/* ===== cache line for TX ===== */
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  447  	int			sk_wmem_queued;
14afee4b6092fde Reshetova, Elena         2017-06-30  448  	refcount_t		sk_wmem_alloc;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  449  	unsigned long		sk_tsq_flags;
75c119afe14f74b Eric Dumazet             2017-10-05  450  	union {
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  451  		struct sk_buff	*sk_send_head;
75c119afe14f74b Eric Dumazet             2017-10-05  452  		struct rb_root	tcp_rtx_queue;
75c119afe14f74b Eric Dumazet             2017-10-05  453  	};
^1da177e4c3f415 Linus Torvalds           2005-04-16  454  	struct sk_buff_head	sk_write_queue;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  455  	__s32			sk_peek_off;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  456  	int			sk_write_pending;
9b8805a325591cf Julian Anastasov         2017-02-06  457  	__u32			sk_dst_pending_confirm;
218af599fa635b1 Eric Dumazet             2017-05-16  458  	u32			sk_pacing_status; /* see enum sk_pacing */
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  459  	long			sk_sndtimeo;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  460  	struct timer_list	sk_timer;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  461  	__u32			sk_priority;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  462  	__u32			sk_mark;
76a9ebe811fb3d0 Eric Dumazet             2018-10-15  463  	unsigned long		sk_pacing_rate; /* bytes per second */
76a9ebe811fb3d0 Eric Dumazet             2018-10-15  464  	unsigned long		sk_max_pacing_rate;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  465  	struct page_frag	sk_frag;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  466  	netdev_features_t	sk_route_caps;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  467  	int			sk_gso_type;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  468  	unsigned int		sk_gso_max_size;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  469  	gfp_t			sk_allocation;
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  470  	__u32			sk_txhash;
fc64869c48494a4 Andrey Ryabinin          2016-05-18  471  
fc64869c48494a4 Andrey Ryabinin          2016-05-18  472  	/*
fc64869c48494a4 Andrey Ryabinin          2016-05-18  473  	 * Because of non atomicity rules, all
fc64869c48494a4 Andrey Ryabinin          2016-05-18  474  	 * changes are protected by socket lock.
fc64869c48494a4 Andrey Ryabinin          2016-05-18  475  	 */
aba546565b613e7 Eric Dumazet             2021-11-15  476  	u8			sk_gso_disabled : 1,
cdfbabfb2f0ce98 David Howells            2017-03-09  477  				sk_kern_sock : 1,
28448b80456feaf Tom Herbert              2014-05-23  478  				sk_no_check_tx : 1,
28448b80456feaf Tom Herbert              2014-05-23  479  				sk_no_check_rx : 1,
bf9765145b856fa Mat Martineau            2020-01-09  480  				sk_userlocks : 4;
3a9b76fd0db9f0d Eric Dumazet             2017-11-11  481  	u8			sk_pacing_shift;
bf9765145b856fa Mat Martineau            2020-01-09  482  	u16			sk_type;
bf9765145b856fa Mat Martineau            2020-01-09  483  	u16			sk_protocol;
bf9765145b856fa Mat Martineau            2020-01-09  484  	u16			sk_gso_max_segs;
^1da177e4c3f415 Linus Torvalds           2005-04-16  485  	unsigned long	        sk_lingertime;
476e19cfa131e2b Arnaldo Carvalho de Melo 2005-05-05  486  	struct proto		*sk_prot_creator;
^1da177e4c3f415 Linus Torvalds           2005-04-16  487  	rwlock_t		sk_callback_lock;
^1da177e4c3f415 Linus Torvalds           2005-04-16  488  	int			sk_err,
^1da177e4c3f415 Linus Torvalds           2005-04-16  489  				sk_err_soft;
becb74f0acca19b Eric Dumazet             2015-03-19  490  	u32			sk_ack_backlog;
becb74f0acca19b Eric Dumazet             2015-03-19  491  	u32			sk_max_ack_backlog;
86741ec25462e4c Lorenzo Colitti          2016-11-04  492  	kuid_t			sk_uid;
26859240e4ee701 Akhmat Karakotov         2022-01-31  493  	u8			sk_txrehash;
7fd3253a7de6a31 Björn Töpel              2020-11-30  494  #ifdef CONFIG_NET_RX_BUSY_POLL
7fd3253a7de6a31 Björn Töpel              2020-11-30  495  	u8			sk_prefer_busy_poll;
7c951cafc0cb2e5 Björn Töpel              2020-11-30  496  	u16			sk_busy_poll_budget;
7fd3253a7de6a31 Björn Töpel              2020-11-30  497  #endif
35306eb23814444 Eric Dumazet             2021-09-29  498  	spinlock_t		sk_peer_lock;
1ace2b4d2b4e1db Eric Dumazet             2021-11-15  499  	int			sk_bind_phc;
109f6e39fa07c48 Eric W. Biederman        2010-06-13  500  	struct pid		*sk_peer_pid;
109f6e39fa07c48 Eric W. Biederman        2010-06-13  501  	const struct cred	*sk_peer_cred;
35306eb23814444 Eric Dumazet             2021-09-29  502  
^1da177e4c3f415 Linus Torvalds           2005-04-16  503  	long			sk_rcvtimeo;
b7aa0bf70c4afb9 Eric Dumazet             2007-04-19  504  	ktime_t			sk_stamp;
3a0ed3e96197380 Deepa Dinamani           2018-12-27  505  #if BITS_PER_LONG==32
3a0ed3e96197380 Deepa Dinamani           2018-12-27  506  	seqlock_t		sk_stamp_seq;
3a0ed3e96197380 Deepa Dinamani           2018-12-27  507  #endif
b9f40e21ef42986 Willem de Bruijn         2014-08-04  508  	u16			sk_tsflags;
fc64869c48494a4 Andrey Ryabinin          2016-05-18  509  	u8			sk_shutdown;
a1cdec57e03a135 Eric Dumazet             2022-02-17  510  	atomic_t		sk_tskey;
52267790ef52d75 Willem de Bruijn         2017-08-03  511  	atomic_t		sk_zckey;
80b14dee2bea128 Richard Cochran          2018-07-03  512  
80b14dee2bea128 Richard Cochran          2018-07-03  513  	u8			sk_clockid;
80b14dee2bea128 Richard Cochran          2018-07-03  514  	u8			sk_txtime_deadline_mode : 1,
4b15c7075352668 Jesus Sanchez-Palencia   2018-07-03  515  				sk_txtime_report_errors : 1,
4b15c7075352668 Jesus Sanchez-Palencia   2018-07-03  516  				sk_txtime_unused : 6;
80b14dee2bea128 Richard Cochran          2018-07-03  517  
^1da177e4c3f415 Linus Torvalds           2005-04-16  518  	struct socket		*sk_socket;
^1da177e4c3f415 Linus Torvalds           2005-04-16  519  	void			*sk_user_data;
d5f642384e9da75 Alexey Dobriyan          2008-11-04  520  #ifdef CONFIG_SECURITY
^1da177e4c3f415 Linus Torvalds           2005-04-16  521  	void			*sk_security;
d5f642384e9da75 Alexey Dobriyan          2008-11-04  522  #endif
2a56a1fec290bf0 Tejun Heo                2015-12-07  523  	struct sock_cgroup_data	sk_cgrp_data;
baac50bbc3cdfd1 Johannes Weiner          2016-01-14  524  	struct mem_cgroup	*sk_memcg;
^1da177e4c3f415 Linus Torvalds           2005-04-16  525  	void			(*sk_state_change)(struct sock *sk);
676d23690fb62b5 David S. Miller          2014-04-11  526  	void			(*sk_data_ready)(struct sock *sk);
^1da177e4c3f415 Linus Torvalds           2005-04-16  527  	void			(*sk_write_space)(struct sock *sk);
^1da177e4c3f415 Linus Torvalds           2005-04-16  528  	void			(*sk_error_report)(struct sock *sk);
^1da177e4c3f415 Linus Torvalds           2005-04-16  529  	int			(*sk_backlog_rcv)(struct sock *sk,
^1da177e4c3f415 Linus Torvalds           2005-04-16  530  						  struct sk_buff *skb);
ebf4e808fa0b22e Ilya Lesokhin            2018-04-30  531  #ifdef CONFIG_SOCK_VALIDATE_XMIT
ebf4e808fa0b22e Ilya Lesokhin            2018-04-30  532  	struct sk_buff*		(*sk_validate_xmit_skb)(struct sock *sk,
ebf4e808fa0b22e Ilya Lesokhin            2018-04-30  533  							struct net_device *dev,
ebf4e808fa0b22e Ilya Lesokhin            2018-04-30  534  							struct sk_buff *skb);
ebf4e808fa0b22e Ilya Lesokhin            2018-04-30  535  #endif
^1da177e4c3f415 Linus Torvalds           2005-04-16  536  	void                    (*sk_destruct)(struct sock *sk);
ef456144da8ef50 Craig Gallek             2016-01-04  537  	struct sock_reuseport __rcu	*sk_reuseport_cb;
c36cad6eceb9b8b Philippe Gerum           2020-06-13  538  #ifdef CONFIG_NET_OOB
c36cad6eceb9b8b Philippe Gerum           2020-06-13  539  	void			*oob_data;
c36cad6eceb9b8b Philippe Gerum           2020-06-13  540  #endif
6ac99e8f23d4b10 Martin KaFai Lau         2019-04-26  541  #ifdef CONFIG_BPF_SYSCALL
1f00d375af84fbc KP Singh                 2020-08-25  542  	struct bpf_local_storage __rcu	*sk_bpf_storage;
6ac99e8f23d4b10 Martin KaFai Lau         2019-04-26  543  #endif
a4298e4522d687a Eric Dumazet             2016-04-01  544  	struct rcu_head		sk_rcu;
ffa84b5ffb37a95 Eric Dumazet             2021-12-09  545  	netns_tracker		ns_tracker;
28044fc1d4953b0 Joanne Koong             2022-08-22  546  	struct hlist_node	sk_bind2_node;
^1da177e4c3f415 Linus Torvalds           2005-04-16 @547  };
^1da177e4c3f415 Linus Torvalds           2005-04-16  548  

:::::: The code at line 547 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
