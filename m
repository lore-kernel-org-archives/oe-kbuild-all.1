Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBD42E2852
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765015855; cv=none; b=bY76sZf+su/feETm+KlfPymEEtK++MycPh1hESRU60fFMq5scgwVhGWq6QsID5ggHwjURMtiiNQCsUfiG4a/2kZ5zZe3iuar5vAUe7WMmquwLuhw49vpChlNPyUsCNy36rgRyx8xW0JJo4FSxbCIst3GD0Aem//gesAxpyUEZAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765015855; c=relaxed/simple;
	bh=7V71pi6x4lrWQy5dNK/j7ZbeQVGqf9ck6+00j3joOGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BzpvL0HNd4MxWDHk4eurwTaGd+CBO9gH7kKWbUyuw96Kwvo/mgydvuz3PaxSkxoxfusKmxHdcjx9sQNvT9xAhYGCvAUjY1T3KGWirc3u27P/lfh0/sX1bqyMA8PwTjIy+o66X7hL7PpGxGSsybYGBFQZD41Vv82uXPtiFdASmCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ci0pTqRt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ci0pTqRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765015853; x=1796551853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7V71pi6x4lrWQy5dNK/j7ZbeQVGqf9ck6+00j3joOGE=;
  b=ci0pTqRtVISKue+PHZkDItQvu7x2GMp+Ska79vYM449rTh6WJboSgWxH
   1MBy9QnFxm1oY58e7SkZOAHK8+EzZRPhEdTcd4pJ2cee5y+YONhAoHUWu
   hRdjXACYezRKJklEXQNqODr9q/bjVXwmqVJXO9SmAKmtUvhLFTT5eS03M
   cx2DR+TxAqN9EX7II/ZrFiiaRlmFxipXhyn49ClGlgytJbZgRNGkk3TwH
   5EcgBS5NNm+xUOciiiiDMXaBZn2SwyCa3zaD5dPKIlk7inRJ79Xi+EPPb
   0i1G+7JI8fwInTNit2yeeeMeP3YngiLTt6jysnfvaAWcQNHtJIQ7qcy9u
   g==;
X-CSE-ConnectionGUID: s91yGwuLQ4un3hocCdMb8g==
X-CSE-MsgGUID: Cu/qJJ95Tnu42np1Hl9/kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66222984"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66222984"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 02:10:53 -0800
X-CSE-ConnectionGUID: +MR5f6a1T92F6/d1usqCnA==
X-CSE-MsgGUID: RYUCAn/kStSiGA5c1yBORg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="199984842"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Dec 2025 02:10:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRpFZ-00000000G4D-0h8z;
	Sat, 06 Dec 2025 10:10:49 +0000
Date: Sat, 6 Dec 2025 18:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Subject: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <202512061811.TwIhRj4D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   416f99c3b16f582a3fc6d64a1f77f39d94b76de5
commit: e84a4927a404f369c842c19de93b216627fcc690 net: annotate races around sk->sk_uid
date:   6 months ago
config: arm64-randconfig-r121-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061811.TwIhRj4D-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061811.TwIhRj4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061811.TwIhRj4D-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv6/af_inet6.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h, include/linux/icmpv6.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/datagram.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/ping.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h, include/net/addrconf.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/inet6_connection_sock.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/raw.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h, include/linux/icmpv6.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/tcp_ipv6.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
   net/ipv6/tcp_ipv6.c:1565:25: sparse: sparse: context imbalance in 'tcp_v6_syn_recv_sock' - unexpected unlock
   net/ipv6/tcp_ipv6.c:1956:21: sparse: sparse: context imbalance in 'tcp_v6_rcv' - different lock contexts for basic block
--
   net/ipv6/udp.c: note: in included file (through include/linux/bpf-cgroup.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/route.c:2382:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flow_label @@     got restricted __be32 @@
   net/ipv6/route.c:2382:39: sparse:     expected unsigned int [usertype] flow_label
   net/ipv6/route.c:2382:39: sparse:     got restricted __be32
   net/ipv6/route.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute6.h):
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar

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
