Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1347B14AB7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693300664; x=1724836664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q/YAhfTI300LckKOCCQyoat2F9ipsbv7G54DId6jlTU=;
  b=h2ex6wMQ16gWGmzTe3PV2qDSN9d0WomhzkFFS39aiTkcklggD+o5e4dE
   0NzKfMwjbDauhdpKRLGLUREUWDQdVvKN9u3pcP5husB5uyf5Ej1KMHmzI
   TA1ZtZ4WVdtu9fZgtzGDDpayIFPGrGjyLimmGe9Zf/CNNmxf9y436jqkl
   Cdvg75eHL1N1w5yLB6h8LHRiAod18f+jXm+7wnJQLW3vT7RxNJeqE698u
   OXGeO6pFKYg53iVKhqpMILHA1viPDI7PHwR0FWywjZEYuo/F8WmjdwSR1
   0t6yamdxSqadBzW2iVk1tSIwbj2KWE3s9XnJNWHLLU3DxqXORAbAnikTA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="354833551"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="354833551"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 02:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="828715842"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="828715842"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2023 02:17:32 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qauqn-0008bh-1l;
	Tue, 29 Aug 2023 09:17:29 +0000
Date: Tue, 29 Aug 2023 17:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.5/bbr3 1/1] net/ipv4/tcp_bbr.c:500: undefined reference to
 `__udivdi3'
Message-ID: <202308291728.mXShicTc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.5/bbr3
head:   bcb27e4adacda606c76349bfba3305db6ea83887
commit: bcb27e4adacda606c76349bfba3305db6ea83887 [1/1] bbr3-6.5: initial import
config: i386-randconfig-011-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291728.mXShicTc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291728.mXShicTc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291728.mXShicTc-lkp@intel.com/

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
   487		bytes = sk->sk_pacing_rate >> sk->sk_pacing_shift;
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
