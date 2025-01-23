Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7700F20E711
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737644869; cv=none; b=rJYSdk9ivR+QfQfksFcSnFIXcWx4yMP3sqM5UmDkT43Ax5U0786alleRCmEqge0sKY50l8uLLFifDaBdrKfXbxVYzm/hmtAs1XSNIRBF+7UHlKKbNydmbpMEtiHtfTXl30iZJeNOeO8Kynj1/oVxCFTssBvZw+7PC961JIM0HFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737644869; c=relaxed/simple;
	bh=ZSz+jehfL4rnzvc2GLRgPZtgy5ZvfTn+XPXMgh94YV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R4uWzdW4hnuDnsLU1IfiutBPFZu0xbVtfJcxh2BT1zxWwD8cFuIfNqtxeZERDp786Ha6BwxykKt1VncIS0qXmhYPLIDKrkM5wGLcrNRFLD75phU3ThujDb6NinngjzuTjY6Iv3J4N6bkRq+oBIMqE7vLjAa6cyflycKfM2VF6bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExElCAXh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExElCAXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737644867; x=1769180867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZSz+jehfL4rnzvc2GLRgPZtgy5ZvfTn+XPXMgh94YV0=;
  b=ExElCAXhKXAaQpf5jZE2d+v9rsrJFWktMj6Z0CvG/8uc/zVfwsfHddIx
   Ojdhry75o0mwSVyg8Lfv6fOkWarg5aNV2TqFkn+s/0PW/V4KZRyVZlpID
   EfEf8wrE5Ivrualw7TsAMpoUa1mBgD2dUJ8zSHdXZIn/kfVgnM4gBxX6C
   YYOK60FVA1Kivxkh3eNhr5I5VpymfUE5DEan037jtyDo4qACIf/6wZWga
   9Ttmg167Kem009oFa6XjWcyN0DPzpSw4khJ4TrLMFo3LpD9p8/lX1CRZ/
   pDlPUewMKU/804oumvXjTMMOLP17fiBgc30uK3/mBEw9njYrL6aT4Ksvp
   w==;
X-CSE-ConnectionGUID: ItenWO4rRIuURNBIBN2Ffg==
X-CSE-MsgGUID: jgvDQXZ5RluOSM9lt9ZB1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41902707"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="41902707"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 07:07:47 -0800
X-CSE-ConnectionGUID: 9LigtBzCQDueGsjim+GNrA==
X-CSE-MsgGUID: xZtfYMkkQYaheSjNx8M3Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112602050"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Jan 2025 07:07:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tayo3-000bKZ-1p;
	Thu, 23 Jan 2025 15:07:43 +0000
Date: Thu, 23 Jan 2025 23:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/bbr3 1/1] net/ipv4/tcp_bbr.c:2042:17: warning: variable
 'round_delivered' set but not used
Message-ID: <202501232307.PyIqUnCG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/bbr3
head:   aa2658ab3fba8f0f16c6d9c838776502980974ed
commit: aa2658ab3fba8f0f16c6d9c838776502980974ed [1/1] tcp/bbr3: initial import
config: arc-randconfig-001-20250123 (https://download.01.org/0day-ci/archive/20250123/202501232307.PyIqUnCG-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501232307.PyIqUnCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501232307.PyIqUnCG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/tcp_bbr.c: In function 'bbr_main':
>> net/ipv4/tcp_bbr.c:2042:17: warning: variable 'round_delivered' set but not used [-Wunused-but-set-variable]
    2042 |         u32 bw, round_delivered;
         |                 ^~~~~~~~~~~~~~~


vim +/round_delivered +2042 net/ipv4/tcp_bbr.c

  2035	
  2036	__bpf_kfunc static void bbr_main(struct sock *sk, u32 ack, int flag, const struct rate_sample *rs)
  2037	{
  2038		struct tcp_sock *tp = tcp_sk(sk);
  2039		struct bbr *bbr = inet_csk_ca(sk);
  2040		struct bbr_context ctx = { 0 };
  2041		bool update_model = true;
> 2042		u32 bw, round_delivered;
  2043		int ce_ratio = -1;
  2044	
  2045		round_delivered = bbr_update_round_start(sk, rs, &ctx);
  2046		if (bbr->round_start) {
  2047			bbr->rounds_since_probe =
  2048				min_t(s32, bbr->rounds_since_probe + 1, 0xFF);
  2049			ce_ratio = bbr_update_ecn_alpha(sk);
  2050		}
  2051		bbr_plb(sk, rs, ce_ratio);
  2052	
  2053		bbr->ecn_in_round  |= (bbr->ecn_eligible && rs->is_ece);
  2054		bbr_calculate_bw_sample(sk, rs, &ctx);
  2055		bbr_update_latest_delivery_signals(sk, rs, &ctx);
  2056	
  2057		if (bbr_run_fast_path(sk, &update_model, rs, &ctx))
  2058			goto out;
  2059	
  2060		if (update_model)
  2061			bbr_update_model(sk, rs, &ctx);
  2062	
  2063		bbr_update_gains(sk);
  2064		bw = bbr_bw(sk);
  2065		bbr_set_pacing_rate(sk, bw, bbr->pacing_gain);
  2066		bbr_set_cwnd(sk, rs, rs->acked_sacked, bw, bbr->cwnd_gain,
  2067			     tcp_snd_cwnd(tp), &ctx);
  2068		bbr_bound_cwnd_for_inflight_model(sk);
  2069	
  2070	out:
  2071		bbr_advance_latest_delivery_signals(sk, rs, &ctx);
  2072		bbr->prev_ca_state = inet_csk(sk)->icsk_ca_state;
  2073		bbr->loss_in_cycle |= rs->lost > 0;
  2074		bbr->ecn_in_cycle  |= rs->delivered_ce > 0;
  2075	}
  2076	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
