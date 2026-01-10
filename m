Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61162BEFFE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 21:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768079245; cv=none; b=mWGXo5GR1WLJR+3YUEKaxjK/HfJOd9/qA7JEkgZOL5h29196aRtUOHi61tQ/EqbkSRPxYqGWDKcQDJHYTzidxjpMUNk44/fdPkti0TKHOzxE9O7wy1jdLZjvqPdh6/dN/cCb0APEHUS2sEQJVjkHOaiCpQemj/F2zxnzVg3G5HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768079245; c=relaxed/simple;
	bh=mdVLW2aCHlY/cfSRhr+WU3HizflRIpriln/491j6cxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hPidsQMEFivQz3xRY3qe/WOH3mEgx0hlHwlwfYUXnVLA3eKLjOAd1GlJ9uEa3eBEFzkfNxAoGfIfeaKmo0NizFkEapizLOvOr3IPncc443yhtw5sUUTGhGVj4/nuTwk9uOry4durY8Ac5utN5DlAfCXhCqvFJFnc9ltDRWsTCUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCaK/99c; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCaK/99c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768079244; x=1799615244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mdVLW2aCHlY/cfSRhr+WU3HizflRIpriln/491j6cxc=;
  b=YCaK/99cZB/pNQM24QgduajO9c77SqH5v0vcYtQypwpgSmNlYuzbtHo4
   FVfX3wjQjcEPELZoxB3s1N1mOPTu6gGuGnenABcq/My4WSaurtEvt0Vm2
   wwvsmjdA7UiuF68R1XxEjanDCqaQxm9y3oicvxnuHEYX27e+4oI+0gM7R
   5j8xTXMkUQ00N0sWd9evcqok11Px7We8BtgKIpA8bdR3lRVCZQHOVWLhR
   aHSJrOR2bbUMIXg6mmvebNfWEuoTcWE0GZ7Wd4EFWODk8UP90bK9jS14m
   0MfkOaSHyxWiVxhBZTpganjF3xhvB75Pd7mcvOsfMSgX6ofPCFTafJ/i9
   g==;
X-CSE-ConnectionGUID: TBrU3emYSE++Gem9LRW/tw==
X-CSE-MsgGUID: tJyMRdPsTyKWJEKs7hNcSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69331179"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="69331179"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 13:07:23 -0800
X-CSE-ConnectionGUID: MzpuTTkEQZerpu3HnOh9fw==
X-CSE-MsgGUID: /Nl+9KvNS3GWxemEKwvwEg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jan 2026 13:07:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vegB5-000000009B8-26B5;
	Sat, 10 Jan 2026 21:07:19 +0000
Date: Sun, 11 Jan 2026 05:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 "Maciej =?utf-8?Q?=C5=BBenczykowski"?= <maze@google.com>
Subject: include/net/sock.h:2100:16: sparse: sparse: cast to
 non-scalar
Message-ID: <202601110443.5ENBRFej-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   97313d6113ab4362ad15076f65560e65288fbcb8
commit: e84a4927a404f369c842c19de93b216627fcc690 net: annotate races around sk->sk_uid
date:   7 months ago
config: alpha-randconfig-r112-20260110 (https://download.01.org/0day-ci/archive/20260111/202601110443.5ENBRFej-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601110443.5ENBRFej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601110443.5ENBRFej-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv4/datagram.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv4/raw.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv4/inet_connection_sock.c:328:36: sparse: sparse: context imbalance in 'inet_csk_find_open_port' - wrong count at exit
   net/ipv4/inet_connection_sock.c:605:23: sparse: sparse: context imbalance in 'inet_csk_get_port' - unexpected unlock
   net/ipv4/inet_connection_sock.c: note: in included file (through include/net/inet_sock.h, include/net/inet_connection_sock.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
   net/ipv4/inet_connection_sock.c:1467:9: sparse: sparse: context imbalance in 'inet_csk_complete_hashdance' - unexpected unlock
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv4/route.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv4/ip_output.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv4/af_inet.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv4/tcp_ipv4.c:3415:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *data @@     got struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control @@
   net/ipv4/tcp_ipv4.c:3415:41: sparse:     expected void const *data
   net/ipv4/tcp_ipv4.c:3415:41: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control
   net/ipv4/tcp_ipv4.c:3537:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *data @@     got struct tcp_congestion_ops const [noderef] __rcu *extern [addressable] [toplevel] tcp_congestion_control @@
   net/ipv4/tcp_ipv4.c:3537:45: sparse:     expected void const *data
   net/ipv4/tcp_ipv4.c:3537:45: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *extern [addressable] [toplevel] tcp_congestion_control
   net/ipv4/tcp_ipv4.c:3541:50: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control @@     got struct tcp_congestion_ops * @@
   net/ipv4/tcp_ipv4.c:3541:50: sparse:     expected struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control
   net/ipv4/tcp_ipv4.c:3541:50: sparse:     got struct tcp_congestion_ops *
   net/ipv4/tcp_ipv4.c: note: in included file (through include/net/inet_sock.h, include/net/icmp.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
   net/ipv4/tcp_ipv4.c:1846:25: sparse: sparse: context imbalance in 'tcp_v4_syn_recv_sock' - unexpected unlock
   net/ipv4/tcp_ipv4.c:2139:17: sparse: sparse: context imbalance in 'tcp_add_backlog' - unexpected unlock
   net/ipv4/tcp_ipv4.c:2401:21: sparse: sparse: context imbalance in 'tcp_v4_rcv' - different lock contexts for basic block
   net/ipv4/tcp_ipv4.c:2612:13: sparse: sparse: context imbalance in 'listening_get_first' - wrong count at exit
   net/ipv4/tcp_ipv4.c:2660:29: sparse: sparse: context imbalance in 'listening_get_next' - unexpected unlock
   net/ipv4/tcp_ipv4.c:2693:13: sparse: sparse: context imbalance in 'established_get_first' - wrong count at exit
   net/ipv4/tcp_ipv4.c:2738:40: sparse: sparse: context imbalance in 'established_get_next' - unexpected unlock
   net/ipv4/tcp_ipv4.c:2870:36: sparse: sparse: context imbalance in 'tcp_seq_stop' - unexpected unlock
   net/ipv4/tcp_ipv4.c:3091:20: sparse: sparse: context imbalance in 'bpf_iter_tcp_listening_batch' - unexpected unlock
   net/ipv4/tcp_ipv4.c:3119:40: sparse: sparse: context imbalance in 'bpf_iter_tcp_established_batch' - unexpected unlock
   net/ipv4/tcp_ipv4.c:3416:41: sparse: sparse: dereference of noderef expression
   net/ipv4/tcp_ipv4.c:3416:41: sparse: sparse: dereference of noderef expression
   net/ipv4/tcp_ipv4.c:3538:45: sparse: sparse: dereference of noderef expression
   net/ipv4/tcp_ipv4.c:3538:45: sparse: sparse: dereference of noderef expression
--
   net/ipv4/ping.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv4/udp.c: note: in included file (through include/linux/bpf-cgroup.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
   net/ipv4/udp.c:1668:28: sparse: sparse: context imbalance in 'udp_rmem_release' - unexpected unlock
   net/ipv4/udp.c:1700:19: sparse: sparse: context imbalance in 'busylock_acquire' - wrong count at exit
   net/ipv4/udp.c:1712:28: sparse: sparse: context imbalance in 'busylock_release' - unexpected unlock
   net/ipv4/udp.c:3305:9: sparse: sparse: context imbalance in 'udp_get_first' - wrong count at exit
   net/ipv4/udp.c:3322:39: sparse: sparse: context imbalance in 'udp_get_next' - unexpected unlock
   net/ipv4/udp.c:3370:31: sparse: sparse: context imbalance in 'udp_seq_stop' - unexpected unlock

vim +2100 include/net/sock.h

  2096	
  2097	static inline kuid_t sk_uid(const struct sock *sk)
  2098	{
  2099		/* Paired with WRITE_ONCE() in sockfs_setattr() */
> 2100		return READ_ONCE(sk->sk_uid);
  2101	}
  2102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
