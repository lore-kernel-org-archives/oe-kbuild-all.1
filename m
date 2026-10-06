Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF043E314A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 08:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276838; cv=none; b=cuBbznEoCgMYyzsy3J9Gs9c/FkT961YmYl2yTso+DTUDVCqATrFDKVUFcpaRXkDaJKXNhTRSI6I8ZHICYgI5XAWSumXnrYncyknVNRCbuUERnx4c3tXVxvmebCiM4+aLle+ATu7kkxwKcm+xvbDeGT2dFbpyBFpB31kJK3pwRS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276838; c=relaxed/simple;
	bh=K3R9kFgl/yH7pOOBNgTbpy9f/58IpK406qtGOiXZVfc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lp/fYPwLVW4fdivEm0K+pu6hRbtWp1ih3z9N9g2nBDDzRA8t8FOBlGW8pvv5M0dIHDibrPr5NWTE6nQlDxq3VdLWzDgwNGF6svnfoQNcCsJ88i049Mg7kyL93clL8FjZ3U0y/75gG2ru4/y3QwSRB220vbSsVzQSwaR7haKTckA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wl9BjThL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wl9BjThL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791276833; x=1822812833;
  h=date:from:to:cc:subject:message-id;
  bh=K3R9kFgl/yH7pOOBNgTbpy9f/58IpK406qtGOiXZVfc=;
  b=Wl9BjThL2Kgk04Pq38vnAiS0cHZA+HnSaMoPRYx9g5nq3cehoU450A8I
   aK8BrZdFCwK4nBNReiLIGXLNtDgHCi0Lcncy473jCsuuPjolhoK8Xjv0H
   FlC0CQaZVPljInEmqZQ7UopfA5Ql1Uqvupwv4GeNq7OJVfVnp44WGLDDJ
   kJPl50SjuDIbxmIK1Hdg7q3OxTWpup892rQId0kPk9DX8E5BvgjD6Frte
   qsAoewOWD+J5sJ5VhEtoUUYwgISyqYbWSz/szizyOPmmCA4X0gyzGfgWl
   ZeLHpcZFpo4fHHXtfhF/kYkMkAbG3p/YRO9c1eDr9pMlJj+n/yHUqArb5
   Q==;
X-CSE-ConnectionGUID: ZBqc+HFRRgq/akmhd1bGjA==
X-CSE-MsgGUID: BDl3vsWsTOe0m0RQCdJbmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="95777339"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="95777339"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 01:53:48 -0700
X-CSE-ConnectionGUID: /LHAFnRaTEaETqCi2QchMQ==
X-CSE-MsgGUID: IVp9ypTRSZ2m882KIGLUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="277203971"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Oct 2026 01:53:46 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE0vg-0000000010R-0zIV;
	Tue, 06 Oct 2026 08:53:44 +0000
Date: Tue, 06 Oct 2026 10:53:42 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 52/53] net/ipv4/tcp_bpf_tx.c:123:17:
 sparse: sparse: symbol 'bpf_tcp_tx_bind' was not declared. Should it be
 static?
Message-ID: <202610061007.ac9y37pq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   00ca9ce5685ac6da21cec48b9b0a8a0d6c11af32
commit: 4d3549efcca0f67eef10e27e81a64dc8d73ed461 [52/53] tcp: Hand a socket's push to a BPF worker thread
config: openrisc-randconfig-r2301-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061007.ac9y37pq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061007.ac9y37pq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061007.ac9y37pq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/tcp_bpf_tx.c:123:17: sparse: sparse: symbol 'bpf_tcp_tx_bind' was not declared. Should it be static?
>> net/ipv4/tcp_bpf_tx.c:153:17: sparse: sparse: symbol 'bpf_tcp_tx_unbind' was not declared. Should it be static?
>> net/ipv4/tcp_bpf_tx.c:181:17: sparse: sparse: symbol 'bpf_tcp_tx_poll' was not declared. Should it be static?
>> net/ipv4/tcp_bpf_tx.c:204:17: sparse: sparse: symbol 'bpf_tcp_tx_pushes' was not declared. Should it be static?
>> net/ipv4/tcp_bpf_tx.c:229:17: sparse: sparse: symbol 'bpf_tcp_tx_sock_bind' was not declared. Should it be static?
>> net/ipv4/tcp_bpf_tx.c:241:17: sparse: sparse: symbol 'bpf_tcp_tx_sock_bind_fd' was not declared. Should it be static?

vim +/bpf_tcp_tx_bind +123 net/ipv4/tcp_bpf_tx.c

   113	
   114	/**
   115	 * bpf_tcp_tx_bind - make a BPF thread the TX worker of a CPU
   116	 * @cpu: the CPU whose worker it is; sockets are bound to CPUs
   117	 * @waitq: the queue to signal when a socket is put on the worker's list
   118	 * @flags: must be 0
   119	 *
   120	 * Binding a CPU that has a worker replaces it; sockets queued for the
   121	 * previous worker are signalled to the new one.
   122	 */
 > 123	__bpf_kfunc int bpf_tcp_tx_bind(u32 cpu, struct bpf_waitq *waitq, u64 flags)
   124	{
   125		struct tcp_bpf_tx_worker *w;
   126		struct bpf_waitq_kern *kern, *old;
   127	
   128		if (flags || cpu >= nr_cpu_ids)
   129			return -EINVAL;
   130		kern = bpf_waitq_get(waitq);
   131		if (!kern)
   132			return -EINVAL;
   133		w = per_cpu_ptr(&tcp_bpf_tx_workers, cpu);
   134		old = rcu_replace_pointer(w->waitq, kern, true);
   135		if (old) {
   136			synchronize_rcu();
   137			bpf_waitq_put(old);
   138		}
   139		spin_lock_bh(&w->lock);
   140		if (!list_empty(&w->sockets))
   141			bpf_waitq_signal(kern, 1);
   142		spin_unlock_bh(&w->lock);
   143		return 0;
   144	}
   145	
   146	/**
   147	 * bpf_tcp_tx_unbind - take a CPU's TX worker away
   148	 * @cpu: the CPU
   149	 *
   150	 * Pushes the sockets still queued for the worker here, in the caller's
   151	 * context. Bound sockets push inline from then on.
   152	 */
 > 153	__bpf_kfunc int bpf_tcp_tx_unbind(u32 cpu)
   154	{
   155		struct tcp_bpf_tx_worker *w;
   156		struct bpf_waitq_kern *old;
   157		struct sock *sk;
   158	
   159		if (cpu >= nr_cpu_ids)
   160			return -EINVAL;
   161		w = per_cpu_ptr(&tcp_bpf_tx_workers, cpu);
   162		old = rcu_replace_pointer(w->waitq, NULL, true);
   163		if (old) {
   164			synchronize_rcu();
   165			bpf_waitq_put(old);
   166		}
   167		while ((sk = tcp_bpf_tx_dequeue(w)))
   168			tcp_bpf_tx_push(sk);
   169		return 0;
   170	}
   171	
   172	/**
   173	 * bpf_tcp_tx_poll - push the sockets queued for a CPU's worker
   174	 * @cpu: the CPU whose worker the caller is
   175	 * @budget: at most this many sockets
   176	 *
   177	 * Each socket is locked and its pending frames pushed as its owner would
   178	 * have pushed them, from the calling thread. Returns the number pushed; the
   179	 * caller sleeps on the worker's wait queue when that is 0.
   180	 */
 > 181	__bpf_kfunc int bpf_tcp_tx_poll(u32 cpu, u32 budget)
   182	{
   183		struct tcp_bpf_tx_worker *w;
   184		struct sock *sk;
   185		u32 n = 0;
   186	
   187		if (cpu >= nr_cpu_ids)
   188			return -EINVAL;
   189		w = per_cpu_ptr(&tcp_bpf_tx_workers, cpu);
   190		WRITE_ONCE(w->polling, current);
   191		while (n < budget && (sk = tcp_bpf_tx_dequeue(w))) {
   192			tcp_bpf_tx_push(sk);
   193			n++;
   194		}
   195		WRITE_ONCE(w->polling, NULL);
   196		w->pushes += n;
   197		return n;
   198	}
   199	
   200	/**
   201	 * bpf_tcp_tx_pushes - how many pushes a CPU's worker has done
   202	 * @cpu: the CPU
   203	 */
 > 204	__bpf_kfunc u64 bpf_tcp_tx_pushes(u32 cpu)
   205	{
   206		if (cpu >= nr_cpu_ids)
   207			return 0;
   208		return per_cpu_ptr(&tcp_bpf_tx_workers, cpu)->pushes;
   209	}
   210	
   211	static int tcp_bpf_tx_sock_set(struct sock *sk, s32 cpu)
   212	{
   213		if (!sk || sk->sk_protocol != IPPROTO_TCP)
   214			return -EINVAL;
   215		if (cpu >= (s32)nr_cpu_ids)
   216			return -EINVAL;
   217		WRITE_ONCE(tcp_sk(sk)->bpf_tx_cpu1, cpu < 0 ? 0 : cpu + 1);
   218		return 0;
   219	}
   220	
   221	/**
   222	 * bpf_tcp_tx_sock_bind - send a socket's pushes to a CPU's TX worker
   223	 * @skops: the sockops context, whose socket it is
   224	 * @cpu: the CPU, or -1 to push inline again
   225	 *
   226	 * Takes effect at the socket's next push. A CPU without a worker pushes
   227	 * inline until one is bound.
   228	 */
 > 229	__bpf_kfunc int bpf_tcp_tx_sock_bind(struct bpf_sock_ops *skops, s32 cpu)
   230	{
   231		struct bpf_sock_ops_kern *kern = (struct bpf_sock_ops_kern *)skops;
   232	
   233		return tcp_bpf_tx_sock_set(kern->sk, cpu);
   234	}
   235	
   236	/**
   237	 * bpf_tcp_tx_sock_bind_fd - send a socket's pushes to a CPU's TX worker
   238	 * @fd: a TCP socket of the calling process
   239	 * @cpu: the CPU, or -1 to push inline again
   240	 */
 > 241	__bpf_kfunc int bpf_tcp_tx_sock_bind_fd(int fd, s32 cpu)
   242	{
   243		struct socket *sock;
   244		int err;
   245	
   246		sock = sockfd_lookup(fd, &err);
   247		if (!sock)
   248			return err;
   249		err = tcp_bpf_tx_sock_set(sock->sk, cpu);
   250		sockfd_put(sock);
   251		return err;
   252	}
   253	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
