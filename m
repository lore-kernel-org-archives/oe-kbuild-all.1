Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74502F5A24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 11:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765540314; cv=none; b=RRtEcRNskBEyhwXexRkbNhySjEo9RBVdTsu6drlOsGXoTG1yT4VaxH1Qpahj15F6xBJ3paOt00MjDbgun0WrXPWIAmicH5oG1Oa3mrqoOREuYLbiQKLWLW9fEiw+VWXylnqinvhbjP7kKLduCsemkGsc4MqmabbdatBr/tT3nC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765540314; c=relaxed/simple;
	bh=vLAR+yO7k1ptgzl5msw4FpvZjYsI7ZNgz24oeCuFmks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e0D7IyaDmz0q/YHgKxcrYr9bprSH4f96+3e/mRHxh5WcPgcH4g43YAAcmAgHAoa0fJKLh+xjS7M8XZvhEV13t0h6+It9c0zqB8NsnkMpw5V0uC6wBBMJV1ajyN1AkqRViPL6JkbcXO1OCoRyO7pioiiAio/GoehOsnGI5EJnaKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fz1Sbpog; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fz1Sbpog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765540313; x=1797076313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vLAR+yO7k1ptgzl5msw4FpvZjYsI7ZNgz24oeCuFmks=;
  b=fz1Sbpog3WDUWexiWMeb1AFWIY2Fk8BF+ha540BHeMt3/HJh/OovvXyd
   YaF6xbypQTE8uNkU7a4GKRjzCbos//eMPsoxlArT9A2AJj0Ax4DtcKFTu
   /VPWQ2tqYyvuxhFGOyvc11JBeYPpB6t5h35l6wO7l4A0YkH57SGOKex02
   XGveck28DLzA8K+hhc2ZY8fzEV7Xx0tF4AKmNS4cqI3lVsS7DgbOLM58b
   92qkmtiJfyEJbh6W4iitwHM4LDVAhYBrO5TgXO1zAzHEVwG7EPR7FGaOK
   lrL8710Hvff6vn4g7jEEn7dndIH9HbIkPimrh5hO6weeBtE+4EYeRvIQM
   Q==;
X-CSE-ConnectionGUID: Kr47BqjfR/uXhe/oxj2HGw==
X-CSE-MsgGUID: WV6+F3TzQ0iK7jF7c3ZZJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="77856834"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="77856834"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 03:51:52 -0800
X-CSE-ConnectionGUID: rN0BFq4SRgibY/djZawbTQ==
X-CSE-MsgGUID: YXqoSBy3RQyuiu4+tlrK6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197565366"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 03:51:51 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU1ga-00000000603-294P;
	Fri, 12 Dec 2025 11:51:48 +0000
Date: Fri, 12 Dec 2025 19:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.18/bbr3 1/1] net/ipv4/tcp_bbr.c:2045:17: warning: variable
 'round_delivered' set but not used
Message-ID: <202512121954.4iGHNTbQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.18/bbr3
head:   739ff9ba5889a90bc38308e00e3babe4cfd65bf3
commit: 739ff9ba5889a90bc38308e00e3babe4cfd65bf3 [1/1] tcp/bbr3: add BBRv3 congestion control
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251212/202512121954.4iGHNTbQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121954.4iGHNTbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121954.4iGHNTbQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/tcp_bbr.c: In function 'bbr_main':
>> net/ipv4/tcp_bbr.c:2045:17: warning: variable 'round_delivered' set but not used [-Wunused-but-set-variable]
    2045 |         u32 bw, round_delivered;
         |                 ^~~~~~~~~~~~~~~


vim +/round_delivered +2045 net/ipv4/tcp_bbr.c

  2037	
  2038	__bpf_kfunc static void bbr_main(struct sock *sk, u32 ack, int flag,
  2039					 const struct rate_sample *rs)
  2040	{
  2041		struct tcp_sock *tp = tcp_sk(sk);
  2042		struct bbr *bbr = inet_csk_ca(sk);
  2043		struct bbr_context ctx = { 0 };
  2044		bool update_model = true;
> 2045		u32 bw, round_delivered;
  2046		int ce_ratio = -1;
  2047	
  2048		round_delivered = bbr_update_round_start(sk, rs, &ctx);
  2049		if (bbr->round_start) {
  2050			bbr->rounds_since_probe =
  2051				min_t(s32, bbr->rounds_since_probe + 1, 0xFF);
  2052			ce_ratio = bbr_update_ecn_alpha(sk);
  2053		}
  2054		bbr_plb(sk, rs, ce_ratio);
  2055	
  2056		bbr->ecn_in_round  |= (bbr->ecn_eligible && rs->is_ece);
  2057		bbr_calculate_bw_sample(sk, rs, &ctx);
  2058		bbr_update_latest_delivery_signals(sk, rs, &ctx);
  2059	
  2060		if (bbr_run_fast_path(sk, &update_model, rs, &ctx))
  2061			goto out;
  2062	
  2063		if (update_model)
  2064			bbr_update_model(sk, rs, &ctx);
  2065	
  2066		bbr_update_gains(sk);
  2067		bw = bbr_bw(sk);
  2068		bbr_set_pacing_rate(sk, bw, bbr->pacing_gain);
  2069		bbr_set_cwnd(sk, rs, rs->acked_sacked, bw, bbr->cwnd_gain,
  2070			     tcp_snd_cwnd(tp), &ctx);
  2071		bbr_bound_cwnd_for_inflight_model(sk);
  2072	
  2073	out:
  2074		bbr_advance_latest_delivery_signals(sk, rs, &ctx);
  2075		bbr->prev_ca_state = inet_csk(sk)->icsk_ca_state;
  2076		bbr->loss_in_cycle |= rs->lost > 0;
  2077		bbr->ecn_in_cycle  |= rs->delivered_ce > 0;
  2078	}
  2079	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
