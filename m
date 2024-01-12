Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62920156DD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 18:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aG+4UDtb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705084955; x=1736620955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UB/hPgTExeFzd7aWeuWQOjK/Sk9AADNxP6kDTcAXA/w=;
  b=aG+4UDtbkbOHWtMDSWI4dvocwoqy3QynFi1cJTTuO6PczUYx9Xub3NxE
   j/tYL1cWJBa1NR9eALQI6W5aeqdrZ1LXl8/P5yLHcxQ9VT+WinL+SOQQ+
   irhjGVy/FlBoMLBBJoKErh+oL31GU5WYPHkBXHCe4AHwNFQhapjUwcUYk
   5+zlrwtAFjXGAVCzMYqG284p8q88E1rUnYPzkomANIgDK8IIKNnyntO7J
   qrgDgyZrnYC38j7gFoFSioHPCc8qbINdawISbbfPIPfY2yPTvBFHlAdI+
   PJ26CrmoqTt17q0ID1Wf+jOFl8M35qzFR8ZuZiSDd3oDRFLjBdhMr9wqN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="403020574"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="403020574"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 10:42:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="906394840"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="906394840"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Jan 2024 10:42:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOMU9-0009ky-0b;
	Fri, 12 Jan 2024 18:42:29 +0000
Date: Sat, 13 Jan 2024 02:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.7/bbr3 1/1] net/ipv4/tcp_bbr.c:500: undefined reference to
 `__udivdi3'
Message-ID: <202401130203.ckSXL9vL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.7/bbr3
head:   2a5d0f70029ff84422ee9e01e0eb7bf17f16d981
commit: 2a5d0f70029ff84422ee9e01e0eb7bf17f16d981 [1/1] tcp/bbr3: initial import
config: i386-randconfig-011-20240112 (https://download.01.org/0day-ci/archive/20240113/202401130203.ckSXL9vL-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401130203.ckSXL9vL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401130203.ckSXL9vL-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs_generic':
>> net/ipv4/tcp_bbr.c:500: undefined reference to `__udivdi3'


vim +500 net/ipv4/tcp_bbr.c

   474	
   475	/* Return the number of segments BBR would like in a TSO/GSO skb, given a
   476	 * particular max gso size as a constraint. TODO: make this simpler and more
   477	 * consistent by switching bbr to just call tcp_tso_autosize().
   478	 */
   479	static u32 bbr_tso_segs_generic(struct sock *sk, unsigned int mss_now,
   480					u32 gso_max_size)
   481	{
   482		struct bbr *bbr = inet_csk_ca(sk);
   483		u32 segs, r;
   484		u64 bytes;
   485	
   486		/* Budget a TSO/GSO burst size allowance based on bw (pacing_rate). */
   487		bytes = READ_ONCE(sk->sk_pacing_rate) >> READ_ONCE(sk->sk_pacing_shift);
   488	
   489		/* Budget a TSO/GSO burst size allowance based on min_rtt. For every
   490		 * K = 2^tso_rtt_shift microseconds of min_rtt, halve the burst.
   491		 * The min_rtt-based burst allowance is: 64 KBytes / 2^(min_rtt/K)
   492		 */
   493		if (bbr_param(sk, tso_rtt_shift)) {
   494			r = bbr->min_rtt_us >> bbr_param(sk, tso_rtt_shift);
   495			if (r < BITS_PER_TYPE(u32))   /* prevent undefined behavior */
   496				bytes += GSO_LEGACY_MAX_SIZE >> r;
   497		}
   498	
   499		bytes = min_t(u32, bytes, gso_max_size - 1 - MAX_TCP_HEADER);
 > 500		segs = max_t(u32, bytes / mss_now,
   501			     sock_net(sk)->ipv4.sysctl_tcp_min_tso_segs);
   502		return segs;
   503	}
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
