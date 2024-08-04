Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1671BC40
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Aug 2024 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722762024; cv=none; b=XACYVvprIaAjjU3f6J23p52H1KUnDR9DkAyeUkvpjA9X3c5zafU6ASzx2TA0DVgAI6dQx94C4CsisCoYx9HWDEt8xY1j8AN0+ImT3dSh9fKiHa1iPixjGVXhelcOp/i0It4z2buuU0iFR9GVIjjeUPuKFdLVKkvAP95DlHyvwD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722762024; c=relaxed/simple;
	bh=m+S3T0AJcfuVV5Q2I+ivU3EeWWMaJK+J+TQRwe6rMjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GyBtpAB6p2USvZ/pnvncyEMuLnBXaN+19iRwoDGXmdG8GVPgJShor3vUGa6aWrjJiOm61gLesYN75H0PwfgX8H1ZUaOXkv0llj/5s9WvEqptlk6dS7+KSAgRxv21H0A8I0CfW9RspCTFXxGw7DcAhmh+FOoxGLxRmEfo+V7m0mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpHvJMU6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpHvJMU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722762023; x=1754298023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m+S3T0AJcfuVV5Q2I+ivU3EeWWMaJK+J+TQRwe6rMjk=;
  b=VpHvJMU67aGtT7yLnkV4GA/g3Raw4yfFfHSglhZpXINS48Zn+usD9jKL
   EGxKSJ3w/0SPHOrHvGk2tu8MhbDngKZ/V85qqtsfVpWFu6l9UoxeEsM2U
   Hc3l0kg0rUOS9i4e2l9uaXnXb8fq+nUy69i3WvxiEmLFNNKZ8KoR0KRoL
   2xKQf0Bq/0+6vSuOFAKolDqCTvC7hpLa0Uo/qM6nxBxJxToBUvPL3EIVp
   H3g4Z8UokccIbLgAQZOTiGTk8Ym9YVs9jGnIJAh2TUimEiNgcMnRmwLCv
   R9P3LA9eOG86e+C56YaZSkenEWbw+Q9u6Pv5Zd/EvGiX3HpQ2NZ4Jgdru
   w==;
X-CSE-ConnectionGUID: t8a8cu3BTNSwqHI7wJu7iQ==
X-CSE-MsgGUID: 8fHEjDJzQIWWuUGE1JX6BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20548017"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="20548017"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 02:00:22 -0700
X-CSE-ConnectionGUID: QFxgXJfYTreZbVHWmPuiQA==
X-CSE-MsgGUID: TAJqFhbvS1awiNNXwUUiTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="60700825"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Aug 2024 02:00:20 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saX6A-0001Kg-26;
	Sun, 04 Aug 2024 09:00:18 +0000
Date: Sun, 4 Aug 2024 16:59:57 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.9/bbr3 1/1] net/ipv4/tcp_bbr.c:500:undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202408041654.yTpqXkEz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.9/bbr3
head:   be74f82f85cf782f185e15c55dc8d8bda4769588
commit: be74f82f85cf782f185e15c55dc8d8bda4769588 [1/1] tcp/bbr3: initial import
config: arm-randconfig-003-20240804 (https://download.01.org/0day-ci/archive/20240804/202408041654.yTpqXkEz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408041654.yTpqXkEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408041654.yTpqXkEz-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs_generic':
>> net/ipv4/tcp_bbr.c:500:(.text+0x600): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: net/ipv4/tcp_bbr.c:500:(.text+0x25a8): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: net/ipv4/tcp_bbr.c:500:(.text+0x9954): undefined reference to `__aeabi_uldivmod'


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
