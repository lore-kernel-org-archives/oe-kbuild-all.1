Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E658184
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 02:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727060294; cv=none; b=MpBIo7HSNhro7bCom8T1yjHvGhF0Nkpy4qInGwZmmQieaQRGRWIclK++X2MKZJOgYeUHLfqdweAY9c4/QKEKdjF4XAZophhIlMn3WPMaHgxy5vdsQ+X5jsF326xf+18K0ZQw4vgLgxuRGdhZmgZ6VV5sVUa/aWN+sUELmXIVwQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727060294; c=relaxed/simple;
	bh=u5+6/kr/zsEXlaKgiwnKs7+mf3DaNtIm7PEnB9gSLrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oFwo0+PmMEIW/qitpvweTtM9Y82vVvVaZMzAEXTQ6NntVmx1AirVZQGczvz5H+3v8YwEwhP93Sz5JqTpG3FA62tgZ8NJ+IgWWHVYcrkNduyY4bEI/xIgeYaPeXtAQglBsswRhefS7L46RmIbFn4yOziOivKNHkmzcvLBeeUlX+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UI87+oE+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UI87+oE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727060293; x=1758596293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u5+6/kr/zsEXlaKgiwnKs7+mf3DaNtIm7PEnB9gSLrY=;
  b=UI87+oE+VmP3Vp+KjURJ4tHD/lNOmeravswVqILKeLAq0oOgPiRnx9XJ
   aX8rZ3CDfYXYsqtR2E6IdQsxyVkiokcGu8t4MBf2tgAWZQc76D/DvUa9N
   oPO/4CM1SN/+S63TgADBYnnKhCmM4G38W7+Ix90scdFpl0OvRtpeGJJsP
   SfbnQv5RBCQh4nL/IEYNK3OXRFhlRWX2kD1wqGIP/RsmjUwdyq7FdoKrR
   i4lqyxm1lXvwjrBfpkSq7s9/Koctmt1fdQ2+t58E96/jSr5fhBJhWY+5C
   bRZffnEwAeFduDPCko9jj4WoC6JQApgrCOXeWl/id6yrsOWxIGm4iVYh7
   w==;
X-CSE-ConnectionGUID: EV0zdpE8SbizogKhpZgbwQ==
X-CSE-MsgGUID: vZA2PjSGRf+638grHY43Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26110258"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26110258"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 19:58:12 -0700
X-CSE-ConnectionGUID: s25iobNsQhi8jG3uCmDFwg==
X-CSE-MsgGUID: F6XkENM2SOahp0LMPbiD0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="70507382"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2024 19:58:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssZH6-000GqY-22;
	Mon, 23 Sep 2024 02:58:08 +0000
Date: Mon, 23 Sep 2024 10:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/bbr3 1/1] net/ipv4/tcp_bbr.c:500: undefined reference to
 `__udivdi3'
Message-ID: <202409231055.1NoQZ9iS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.10/bbr3
head:   0f8b7103af11286f08d3228b952997b14bd837f0
commit: 0f8b7103af11286f08d3228b952997b14bd837f0 [1/1] tcp/bbr3: initial import
config: i386-randconfig-005-20240923 (https://download.01.org/0day-ci/archive/20240923/202409231055.1NoQZ9iS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409231055.1NoQZ9iS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409231055.1NoQZ9iS-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs_generic':
>> net/ipv4/tcp_bbr.c:500: undefined reference to `__udivdi3'
>> ld: net/ipv4/tcp_bbr.c:500: undefined reference to `__udivdi3'
>> ld: net/ipv4/tcp_bbr.c:500: undefined reference to `__udivdi3'
>> ld: net/ipv4/tcp_bbr.c:500: undefined reference to `__udivdi3'


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
