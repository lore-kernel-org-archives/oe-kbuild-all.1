Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E101673176
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 15:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739459965; cv=none; b=Q1evmOrtzvxCwuy6k+BWd2Bk5iwfORwH6c8f7KfUE/65p8ic/8Pjh60GodrwkkYUEmXNxzmoFW3XqxrCUL7RXyuQHuTUSFBYqShRhDQBNWlRgM0n1URtpZo4W04C8Yo/0TF8+ybJJwFTOFCGxDPAx/HDueeMzzokXziGSc6or1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739459965; c=relaxed/simple;
	bh=NazE5B4B/B9gt7uCluFBsF13mB+qFb4ZEk4EMdN6Dks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=POkwlVFyKKNFKdOb4xQ0iMQbZ8/K6Y8JIl2vp5ER/lmBpVgMPntteqmXSyiVxOf13qZyzrWcB0nxTcy/ycpuXEHloyahMdsI31b9MDQEEPnB+OUWTxcoqGDjODzo8mDDCtISGJb/J46tYV4iO7PGHPj6ynroIaLDa/gK1fCX3U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgFRnJxf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgFRnJxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739459962; x=1770995962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NazE5B4B/B9gt7uCluFBsF13mB+qFb4ZEk4EMdN6Dks=;
  b=PgFRnJxfgBDgKgDbWXPekNzKz/d+Xh4rsTjYXsvh0mE6zZ5AiidVVn7l
   xBMNrbPj4M+jx0zpPKvCzCyX1ayFDeazNIyHOOyaFLp53qmjkv0VQ1Rsm
   HHrAA0KR3M01aERK7Kr6MJ4iW0L0MI2W3xr880vuXzKmnieNwAbhBf5Q2
   B3d7LlBK8WIMrzw8iI/5+Io0CLPYKq/OzXDwHQhKZu/PSnLlg1aUkaTjn
   ZucASsHVglkeAGFVRCQxqpClUpI3msjOcgzO6IMgVgESr+1aS4kwFEScQ
   Dc8Or9BIyoSmJUh2Hvr7nHnvQqcIUyNaV/cvSOlQISKyxd5WoTXzhzMLU
   g==;
X-CSE-ConnectionGUID: ryFGLMCPS1+Cihn98as0Iw==
X-CSE-MsgGUID: Jz7aZvv+Rru9GMB7GeSwWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50382504"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="50382504"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 07:19:22 -0800
X-CSE-ConnectionGUID: rzCXMTCbQ9KZiRg7EMvn/Q==
X-CSE-MsgGUID: zWmjfKHERx69gs08PYqu2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113039679"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2025 07:19:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiazn-0017pb-09;
	Thu, 13 Feb 2025 15:19:19 +0000
Date: Thu, 13 Feb 2025 23:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 14/26] net/core/gen_estimator.c:209:13:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202502132341.kfyMMltn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   9c8d14ce8aff2d38bf494f5d5436a302e3236842
commit: f7039fb7b3a9459a6c5ed166c267bdf294492c1b [14/26] rcu: Support Clang's capability analysis
config: alpha-randconfig-r133-20250213 (https://download.01.org/0day-ci/archive/20250213/202502132341.kfyMMltn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250213/202502132341.kfyMMltn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502132341.kfyMMltn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/gen_estimator.c:209:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct net_rate_estimator *est @@     got void @@
   net/core/gen_estimator.c:209:13: sparse:     expected struct net_rate_estimator *est
   net/core/gen_estimator.c:209:13: sparse:     got void
   net/core/gen_estimator.c:71:9: sparse: sparse: context imbalance in 'est_fetch_counters' - different lock contexts for basic block
   net/core/gen_estimator.c:192:9: sparse: sparse: context imbalance in 'gen_new_estimator' - different lock contexts for basic block
--
   net/core/sock.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h, include/linux/errqueue.h):
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
   net/core/sock.c:2499:9: sparse: sparse: context imbalance in 'sk_clone_lock' - wrong count at exit
   net/core/sock.c:2503:6: sparse: sparse: context imbalance in 'sk_free_unlock_clone' - unexpected unlock
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
   net/core/sock.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
>> net/core/sock_diag.c:198:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct sock_diag_inet_compat const *old @@     got void @@
   net/core/sock_diag.c:198:13: sparse:     expected struct sock_diag_inet_compat const *old
   net/core/sock_diag.c:198:13: sparse:     got void
--
   net/ipv4/route.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute.h):
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
   net/ipv4/route.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   net/ipv4/route.c:3609:20: sparse: sparse: self-comparison always evaluates to false
--
   net/ipv4/ip_sockglue.c: note: in included file:
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
--
   net/ipv4/inet_connection_sock.c:330:36: sparse: sparse: context imbalance in 'inet_csk_find_open_port' - wrong count at exit
   net/ipv4/inet_connection_sock.c:607:23: sparse: sparse: context imbalance in 'inet_csk_get_port' - unexpected unlock
   net/ipv4/inet_connection_sock.c: note: in included file (through include/net/inet_sock.h, include/net/inet_connection_sock.h):
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
   net/ipv4/inet_connection_sock.c:1468:9: sparse: sparse: context imbalance in 'inet_csk_complete_hashdance' - unexpected unlock
--
>> net/ipv4/tcp_fastopen.c:52:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct tcp_fastopen_context *ctxt @@     got void @@
   net/ipv4/tcp_fastopen.c:52:14: sparse:     expected struct tcp_fastopen_context *ctxt
   net/ipv4/tcp_fastopen.c:52:14: sparse:     got void
>> net/ipv4/tcp_fastopen.c:83:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct tcp_fastopen_context *octx @@     got void @@
   net/ipv4/tcp_fastopen.c:83:22: sparse:     expected struct tcp_fastopen_context *octx
   net/ipv4/tcp_fastopen.c:83:22: sparse:     got void
   net/ipv4/tcp_fastopen.c:85:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct tcp_fastopen_context *octx @@     got void @@
   net/ipv4/tcp_fastopen.c:85:22: sparse:     expected struct tcp_fastopen_context *octx
   net/ipv4/tcp_fastopen.c:85:22: sparse:     got void
--
>> net/ipv4/tcp.c:3354:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct dst_entry *dst @@     got void @@
   net/ipv4/tcp.c:3354:21: sparse:     expected struct dst_entry *dst
   net/ipv4/tcp.c:3354:21: sparse:     got void
--
   net/ipv4/datagram.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
--
   net/ipv4/raw.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute.h):
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
--
   net/ipv4/af_inet.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
   net/ipv4/af_inet.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
>> net/ipv4/udp.c:2482:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old @@     got void @@
   net/ipv4/udp.c:2482:21: sparse:     expected struct dst_entry *old
   net/ipv4/udp.c:2482:21: sparse:     got void
   net/ipv4/udp.c: note: in included file (through include/linux/bpf-cgroup.h):
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
   net/ipv4/udp.c:1668:28: sparse: sparse: context imbalance in 'udp_rmem_release' - unexpected unlock
   net/ipv4/udp.c:1700:19: sparse: sparse: context imbalance in 'busylock_acquire' - wrong count at exit
   net/ipv4/udp.c:1712:28: sparse: sparse: context imbalance in 'busylock_release' - unexpected unlock
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
   net/ipv4/udp.c:3273:9: sparse: sparse: context imbalance in 'udp_get_first' - wrong count at exit
   net/ipv4/udp.c:3290:39: sparse: sparse: context imbalance in 'udp_get_next' - unexpected unlock
   net/ipv4/udp.c:3338:31: sparse: sparse: context imbalance in 'udp_seq_stop' - unexpected unlock
--
   net/ipv4/ping.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
>> include/net/sock.h:2132:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dst_entry *old_dst @@     got void @@
   include/net/sock.h:2132:17: sparse:     expected struct dst_entry *old_dst
   include/net/sock.h:2132:17: sparse:     got void
--
>> net/xdp/xskmap.c:234:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct xdp_sock *old_xs @@     got void @@
   net/xdp/xskmap.c:234:16: sparse:     expected struct xdp_sock *old_xs
   net/xdp/xskmap.c:234:16: sparse:     got void
   net/xdp/xskmap.c: note: in included file (through include/linux/timer.h, include/linux/workqueue.h, include/linux/bpf.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
>> kernel/bpf/cpumap.c:511:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_cpu_map_entry *old_rcpu @@     got void @@
   kernel/bpf/cpumap.c:511:18: sparse:     expected struct bpf_cpu_map_entry *old_rcpu
   kernel/bpf/cpumap.c:511:18: sparse:     got void
   kernel/bpf/cpumap.c: note: in included file (through include/linux/timer.h, include/linux/workqueue.h, include/linux/bpf.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
>> kernel/bpf/devmap.c:829:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev *old_dev @@     got void @@
   kernel/bpf/devmap.c:829:17: sparse:     expected struct bpf_dtab_netdev *old_dev
   kernel/bpf/devmap.c:829:17: sparse:     got void
   kernel/bpf/devmap.c:940:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev *old_dev @@     got void @@
   kernel/bpf/devmap.c:940:17: sparse:     expected struct bpf_dtab_netdev *old_dev
   kernel/bpf/devmap.c:940:17: sparse:     got void
>> kernel/bpf/devmap.c:1140:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct bpf_dtab_netdev *odev @@     got void @@
   kernel/bpf/devmap.c:1140:38: sparse:     expected struct bpf_dtab_netdev *odev
   kernel/bpf/devmap.c:1140:38: sparse:     got void
   kernel/bpf/devmap.c: note: in included file (through include/linux/timer.h, include/linux/workqueue.h, include/linux/bpf.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +209 net/core/gen_estimator.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  197  
^1da177e4c3f41 Linus Torvalds          2005-04-16  198  /**
^1da177e4c3f41 Linus Torvalds          2005-04-16  199   * gen_kill_estimator - remove a rate estimator
1c0d32fde5bdf1 Eric Dumazet            2016-12-04  200   * @rate_est: rate estimator
^1da177e4c3f41 Linus Torvalds          2005-04-16  201   *
1c0d32fde5bdf1 Eric Dumazet            2016-12-04  202   * Removes the rate estimator.
0929c2dd833178 Ranko Zivojnovic        2007-07-16  203   *
^1da177e4c3f41 Linus Torvalds          2005-04-16  204   */
1c0d32fde5bdf1 Eric Dumazet            2016-12-04  205  void gen_kill_estimator(struct net_rate_estimator __rcu **rate_est)
^1da177e4c3f41 Linus Torvalds          2005-04-16  206  {
1c0d32fde5bdf1 Eric Dumazet            2016-12-04  207  	struct net_rate_estimator *est;
^1da177e4c3f41 Linus Torvalds          2005-04-16  208  
b4cb4a1391dcdc Eric Dumazet            2024-06-04 @209  	est = unrcu_pointer(xchg(rate_est, NULL));
1c0d32fde5bdf1 Eric Dumazet            2016-12-04  210  	if (est) {
292a089d78d3e2 Steven Rostedt (Google  2022-12-20  211) 		timer_shutdown_sync(&est->timer);
1c0d32fde5bdf1 Eric Dumazet            2016-12-04  212  		kfree_rcu(est, rcu);
^1da177e4c3f41 Linus Torvalds          2005-04-16  213  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  214  }
c1b56878fb68e9 Stephen Hemminger       2008-11-25  215  EXPORT_SYMBOL(gen_kill_estimator);
^1da177e4c3f41 Linus Torvalds          2005-04-16  216  

:::::: The code at line 209 was first introduced by commit
:::::: b4cb4a1391dcdc640c4ade003aaf0ee19cc8d509 net: use unrcu_pointer() helper

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
