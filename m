Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3594111AD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 17:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754243405; cv=none; b=R0AghJd7QkgrCiLvVZYggcrIrXWWDGw4bv66Q+q3Vn7XKQrnnRewz6DvJhkT0wNPjyXDY/NQxdIoWnoaCtE22RPkYLa/MgiHG7pIpGY192TdBxNDTUCpgzCojIK89V1pUap+35+ObErHuMWlu8HcJGxwLYAYbYoV6sQ/BSrpJJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754243405; c=relaxed/simple;
	bh=C84dnlFLSVPEymu6k0ImjPlVlkwLD4xFTqvrg5jK22w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lZhQrkSGnsxVMfw3LhVAApcAutWOtmKdQhJcPr3UrkBwjM5YiHBJSLMjKa6qUfVXnTl7ie8ZlDjfObr1uZN8V2UrVgBMndfya6tzJREkqozCWB7JKyrGrFktiYSW+0BnRJAZfAivjat9vLPdYRjZO1ORh19QS88st3++63adDt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7F7eEcN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7F7eEcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754243403; x=1785779403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C84dnlFLSVPEymu6k0ImjPlVlkwLD4xFTqvrg5jK22w=;
  b=N7F7eEcNoo+AypPEoBcfo2Vwa9091ReijGZ0NuxRrNfWhOnXoQc4f+vX
   x57hiXr3fOaWqfocRf3zlerSAUo1hU/rPHbe3OUGuLj1V7MCKhY6KTssZ
   wG5ihhmFdTGqEwWlGXvvekIezpPczYcAGDheppCyHK5P3gnzeJ6hIJu+a
   HFNbjSDpU0pjODyGGIblT4vLjVXojqgg9N3SaBL0Q5Ax1TI4IvMqRMGpF
   3wF59vawzpdFOtNAKvBIksFP1suFPdX2VbbPLD2TAkyOJm6hk2bU9GulQ
   oIUlF3dnbK//hm1zKZNWVCPU0HbI9xoFSgcYFaTkYetf0uKeTBrJtRlV2
   g==;
X-CSE-ConnectionGUID: VpceTfvaSB+6Hf3gOVM+aQ==
X-CSE-MsgGUID: oC99I/BXQsumSOB+WsNxvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="60150401"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60150401"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 10:50:03 -0700
X-CSE-ConnectionGUID: 1iOz36tWTyWXqc/ZlP74sw==
X-CSE-MsgGUID: H/GJ41mbQYSEv78a0sOqHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163247079"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 03 Aug 2025 10:50:03 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uicqO-0001ex-0J;
	Sun, 03 Aug 2025 17:50:00 +0000
Date: Sun, 3 Aug 2025 19:49:10 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.16/bbr3 1/1] net/ipv4/tcp_bbr.c:2045:17: warning: variable
 'round_delivered' set but not used
Message-ID: <202508031956.VfkgJjNe-lkp@intel.com>
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
config: i386-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250803/202508031956.VfkgJjNe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508031956.VfkgJjNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508031956.VfkgJjNe-lkp@intel.com/

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
