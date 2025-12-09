Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C3227E074
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 20:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765311734; cv=none; b=XIry2XnwJXOpPakKgVYFMEOHSjikionkGCpi9SeNVLWokROnlunF1KyftVfY5hog0fVWjSY3cyzlyhs2jtyBKb3uR27Wr9DegCVe8I35j23vNNR7EplDnYSKQ1myJjnG4mZfsih2wC5IV3gBBl7nnhxR28nww7vfLTeKPhafMZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765311734; c=relaxed/simple;
	bh=qUIz3RRcYwkftkRcy5hNxoHCmB6v7RChi8rpHEs/q3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WKWDbCTO8BPcliP6ueu9SlfzJ/1gqjH5pVWHHWiQFVmhQBdEByF4bED2lrBLUZUX0273EY78VOhdbKtKCxUgGcnAmYpIIwzXiUX2NM96GFPQ4/viWbNurdydDMeIOrgjSmxyemvCHnRhPhTi1qHvrUG1ftJarR3FlypMs2HXgFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6jpgEoI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6jpgEoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765311733; x=1796847733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qUIz3RRcYwkftkRcy5hNxoHCmB6v7RChi8rpHEs/q3o=;
  b=M6jpgEoIRq4CO2QtLgH+VqN/YiuiAlrzEs47Be8TD+zKKICE1w/dsOsC
   gct+hvCsLOWHbhA5SR2d4AkQ1T3o5rSD2L1EPavchawv2eRz7QW5Cl4AI
   FAXbNgNjH1580Dq97h6xXXGYiId8MTNjcQAj4xiN9Z1NkpeGMCDKOp/iS
   JjEn62V5FVAb0EpboQzcDQnoZO80coIl446FFx6aqeecpxB7oN5tN9zZT
   1vHTv8s05/TP+BHQu95vuijnLyj9EbXT4fAXn+rv+fQQjvDHL0GM2jZyx
   Nweijp73inep6TydknK1b9GBrjSAL7b3b7lmXBe7iiJdtFGSVdQPbypg0
   g==;
X-CSE-ConnectionGUID: AKp1ZKIvT+uPRWyGWzaGmA==
X-CSE-MsgGUID: yL3NJ7RhS6eqco2GzFLFlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67318041"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67318041"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 12:22:12 -0800
X-CSE-ConnectionGUID: GC4OWOfRRT+2O7Y4fCoB7w==
X-CSE-MsgGUID: hy6cdp4eTGumRDoD1xc5/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="227353757"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2025 12:22:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT4Dp-000000000Mn-1qtC;
	Tue, 09 Dec 2025 20:22:09 +0000
Date: Tue, 9 Dec 2025 21:21:23 +0100
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.18/bbr3 1/1] net/ipv4/tcp_bbr.c:2045:17: warning: variable
 'round_delivered' set but not used
Message-ID: <202512092154.ZdtMDwgc-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251209/202512092154.ZdtMDwgc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512092154.ZdtMDwgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092154.ZdtMDwgc-lkp@intel.com/

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
