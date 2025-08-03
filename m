Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD32B661
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754236318; cv=none; b=X1Zi8XmxN+61HdwFA7buuJmmmvERMin5qUmCoJ/PlB0ppnNqTF85z0ycBauFDEmiNgBBpnv58/9VtgMQxAOEnvp933eqJYvkVBFUW8jmhhsBDlmnFHxzJ+rmrPlcDSCTzbbDW2DGFX24ZYvA0LEw6IatyUd7M5+5wOz0YMu3b/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754236318; c=relaxed/simple;
	bh=R/rCT06B1CG0dVodVOcZqBnR/mBCXVYQRtLwBTSPR4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UYIBeFZo57QN6u7kyZWnHWIrN29YLSxB1yBvZIpYciZpV8Dck1gzLkClZdikAOsz8jEmV3cl0N7nJZK/3bdVymrWp5kCkA8bha3sLv9H4qXKkzQgH+Ie3WGqx7NvGTyB3BR986o6e6c7UdkoSLMvltAxUoO/U0q2qpw/fGRWNgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMWL5i46; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMWL5i46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754236317; x=1785772317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R/rCT06B1CG0dVodVOcZqBnR/mBCXVYQRtLwBTSPR4I=;
  b=bMWL5i4685FaFUYJ/PNmW4tF44hWVPJ+/L319zw/CvEDBSRnMXnoXkTk
   c3IR4IIe7ryq65VSPRP66H81oJFUJfELa3Tx9QXcwAbmhzHOFYSVbQPoZ
   GB38x2t2nknsEoJDxG3BNKYfSOrSy7Z6Mcaw6c9T0ksd0WMkix9tJSIZL
   qEh6jafU1VRLNkkbhpW8fjeNRRL+whqSxc4LYZ6r6HOFD9ExQMkmSxwXY
   qAW9q4yWokXBJiMud8qkJA85JaqEkKCmSRgcslcwKhK0OL2Hzk4GTvIAa
   hOSklzgh3scqyorqV1qDOFD9seh3Znx5M7SFPhi/WhoGcY9a+l5xxZkeU
   A==;
X-CSE-ConnectionGUID: dCuoqJd3TL6LWwn32Xu6dg==
X-CSE-MsgGUID: +6GxLOFyQRuPG+i1pu9IjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="74094829"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="74094829"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 08:51:56 -0700
X-CSE-ConnectionGUID: dIKRVMD5SLK36a1xID64zg==
X-CSE-MsgGUID: CZhi5Jq2QhmVMmvVYBM/tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164354253"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 03 Aug 2025 08:51:55 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uib05-0001e9-0k;
	Sun, 03 Aug 2025 15:51:53 +0000
Date: Sun, 3 Aug 2025 17:51:07 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.16/bbr3 1/1] net/ipv4/tcp_bbr.c:503: undefined reference to
 `__udivdi3'
Message-ID: <202508031751.lkrwNeME-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.16/bbr3
head:   44ea9f23b99cc37f9f03c3c0b2f5858041613ca1
commit: 44ea9f23b99cc37f9f03c3c0b2f5858041613ca1 [1/1] tcp/bbr3: initial import
config: i386-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250803/202508031751.lkrwNeME-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508031751.lkrwNeME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508031751.lkrwNeME-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/ipv4/tcp_bbr.o: in function `bbr_packets_in_net_at_edt':
>> net/ipv4/tcp_bbr.c:503: undefined reference to `__udivdi3'
   ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs':
>> net/ipv4/tcp_bbr.c:503: undefined reference to `__udivdi3'
   ld: net/ipv4/tcp_bbr.o: in function `bbr_quantization_budget':
>> net/ipv4/tcp_bbr.c:503: undefined reference to `__udivdi3'


vim +503 net/ipv4/tcp_bbr.c

   477	
   478	/* Return the number of segments BBR would like in a TSO/GSO skb, given a
   479	 * particular max gso size as a constraint. TODO: make this simpler and more
   480	 * consistent by switching bbr to just call tcp_tso_autosize().
   481	 */
   482	static u32 bbr_tso_segs_generic(struct sock *sk, unsigned int mss_now,
   483					u32 gso_max_size)
   484	{
   485		struct bbr *bbr = inet_csk_ca(sk);
   486		u32 segs, r;
   487		u64 bytes;
   488	
   489		/* Budget a TSO/GSO burst size allowance based on bw (pacing_rate). */
   490		bytes = READ_ONCE(sk->sk_pacing_rate) >> READ_ONCE(sk->sk_pacing_shift);
   491	
   492		/* Budget a TSO/GSO burst size allowance based on min_rtt. For every
   493		 * K = 2^tso_rtt_shift microseconds of min_rtt, halve the burst.
   494		 * The min_rtt-based burst allowance is: 64 KBytes / 2^(min_rtt/K)
   495		 */
   496		if (bbr_param(sk, tso_rtt_shift)) {
   497			r = bbr->min_rtt_us >> bbr_param(sk, tso_rtt_shift);
   498			if (r < BITS_PER_TYPE(u32))   /* prevent undefined behavior */
   499				bytes += GSO_LEGACY_MAX_SIZE >> r;
   500		}
   501	
   502		bytes = min_t(u32, bytes, gso_max_size - 1 - MAX_TCP_HEADER);
 > 503		segs = max_t(u32, bytes / mss_now,
   504			     sock_net(sk)->ipv4.sysctl_tcp_min_tso_segs);
   505		return segs;
   506	}
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
