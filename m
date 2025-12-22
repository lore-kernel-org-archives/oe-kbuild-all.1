Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D3818B0A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 19:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766432725; cv=none; b=PFzDqDx6kKainaJUdSfzvJIOm411XM1dSCuBE2cYjyRiU0C+j9hFplFQlj4ntjtHbcl9d1cVE/Tbcbx+Pz1L3HuEe5ALu0gfnTmXbWAyVoSRgZTc6wkmKn+4pKJatzgtzZb7+yO8+RpeBN7u5kGuJVNdDAfLErsvCCPd3kY0Z7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766432725; c=relaxed/simple;
	bh=pwAXUtFiyraGZSlzeJroqxzS7QgWnSB/0KNSB7ubKIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VdATqz+JbNKEMwiSNEqtgacyh6q4K4t79IgvMFyKxlgTLQzClNsCzf57HS1BDiFlQyNnvfUPw6TXIjeXFPGUfmnfcsduh+S46y77H68iZ71hOdJiw3jLatm5LCLq4XeVt+udi+eqTdTzP+Fbs+YxjZ1Jt8HB3H8s01g0qkLKN98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ctoj1fZI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ctoj1fZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766432723; x=1797968723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pwAXUtFiyraGZSlzeJroqxzS7QgWnSB/0KNSB7ubKIc=;
  b=Ctoj1fZIHIbWhB+rN/ni5gcw8rwr0YTG23zbkJqYeFu9PDk2vwMO5bal
   OAMNIl0aYCx2HuFebLWwpkd2eEsXeVupwOqTyPwI//zxASYsVNog+2NGS
   AaRQML7jVwOQmZqUQA1wrjXrRgyjQx19gQDwGCiP/2UCrNdDu7xTMXpiL
   0gsq1O5j2/hdnCpner9KzIyX5W0DA3/4j92axbFzIjaHAnqRAAjveovK/
   xALun6Ird5mJhpEsEe4fMJeHsFtDFmYDf+zIVMmtvzB2bDwycn0yCWFK/
   XbHDKDQ4cd2qpTMXzde6okIbdXjmViYzu4hUFGkK4Q2xYf5Cu/L3B5mX8
   g==;
X-CSE-ConnectionGUID: ROEFAZbySia56caZeobfPQ==
X-CSE-MsgGUID: kW7j04zGQ6S/FLwIQ4bZTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68045207"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68045207"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 11:45:23 -0800
X-CSE-ConnectionGUID: wyhhGlJhQn6DdKfUcdAl9g==
X-CSE-MsgGUID: vWqBacihRYuk5GICLNTvlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199514857"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 11:45:20 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXlq8-0000000013S-01SS;
	Mon, 22 Dec 2025 19:45:09 +0000
Date: Tue, 23 Dec 2025 03:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 "Maciej =?utf-8?Q?=C5=BBenczykowski"?= <maze@google.com>
Subject: include/net/sock.h:2100:16: sparse: sparse: cast from
 non-scalar
Message-ID: <202512230343.rktGLbEZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: e84a4927a404f369c842c19de93b216627fcc690 net: annotate races around sk->sk_uid
date:   6 months ago
config: alpha-randconfig-r134-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230343.rktGLbEZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230343.rktGLbEZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230343.rktGLbEZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv6/inet6_connection_sock.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h):
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/ping.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h, include/net/addrconf.h):
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/af_inet6.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h, include/linux/icmpv6.h):
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/datagram.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h):
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/raw.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h, include/linux/icmpv6.h):
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/tcp_ipv6.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h):
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
   net/ipv6/tcp_ipv6.c:1565:25: sparse: sparse: context imbalance in 'tcp_v6_syn_recv_sock' - unexpected unlock
   net/ipv6/tcp_ipv6.c:1956:21: sparse: sparse: context imbalance in 'tcp_v6_rcv' - different lock contexts for basic block
--
   net/ipv6/udp.c: note: in included file (through include/linux/bpf-cgroup.h):
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/netfilter.c: note: in included file (through include/linux/tcp.h, include/linux/ipv6.h):
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
--
   net/ipv6/route.c:2382:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flow_label @@     got restricted __be32 @@
   net/ipv6/route.c:2382:39: sparse:     expected unsigned int [usertype] flow_label
   net/ipv6/route.c:2382:39: sparse:     got restricted __be32
   net/ipv6/route.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute6.h):
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
   include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>> include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar

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
