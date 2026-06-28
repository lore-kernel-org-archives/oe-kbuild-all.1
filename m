Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BBF2F12A5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jun 2026 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782641214; cv=none; b=LE1wmuvsig9lsakhieh8CZ07frwLA1Nv38mN6lmk9Ve7cGZFWolNAZB4PZS+AUGyO3otiGef9f3vIHUdraaswSgvTmQEfFSCEoToZtQrCMWFRS/Qd7pIG9TFH2TjtCl3gWeiqJ0ZfPRrLGby+jm95OnU47UodVRtxD86vK39DK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782641214; c=relaxed/simple;
	bh=gG1OwXo6UaG8/PM3PIAswIS/YIJyAwWA/ZYebecDm8M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=btsydXNV3rrD4Kv2rv5Q5EXIJ7JvkytzI4xJHJIbeKImtO9DbtzUz0EOyWZ6YAI98jiqKbq/j8ndfh0ca8HYG2X17CnvZanujpiuhtLTrfzb0JFRq077IRIKvs+2OvPiVSSTZQpoEOUY+hTU9V5pP/tQ/VRKx6qjddNdlCQh78Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWR48EpC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWR48EpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782641213; x=1814177213;
  h=date:from:to:cc:subject:message-id;
  bh=gG1OwXo6UaG8/PM3PIAswIS/YIJyAwWA/ZYebecDm8M=;
  b=gWR48EpC7oPFxdteVGt9Zlh+f3aHpzgcRSIj1xhu828pESLFJg2LERYN
   1Yd0EImKFGYX87arq5CPw5iCi0WoB/+y0cq6MQAPkqOsfi0HDqouo2AD9
   77LgpLbLdLoyOsaDJehXZBpDZAVYGTo7dBdfDlEAE4jl5zC1pEDh0z4x4
   POHIL/vuhXq3QGVWQI3EdHkDBODF51haaY+/12ofbG5kVTnfFJgM5qIXY
   07SudpYFPeqnx2Q5I+5IueRWHQvUhXo5PrQps2P6VUmMT6EUs+ym4hNCC
   0uwM7uLnxdJJ37DNxixij/Qd7xeQ7P/7iCWyskJjilGNIMG6/meEB+0HX
   w==;
X-CSE-ConnectionGUID: ZEOuxv1+QE+DGALVC28fCQ==
X-CSE-MsgGUID: ngih7hJSR0C7u/b/6afZ9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="83234680"
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="83234680"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 03:06:52 -0700
X-CSE-ConnectionGUID: kTs08jTTQ9q3ahH+gqoF+A==
X-CSE-MsgGUID: v70VxK6pS3SqDWaS5nL6Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="245336986"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2026 03:06:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdmPX-000000006Ht-2KCB;
	Sun, 28 Jun 2026 10:06:47 +0000
Date: Sun, 28 Jun 2026 18:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/bbr3 1/2] net/ipv4/tcp_bbr3.c:2051:17: warning:
 variable 'round_delivered' set but not used
Message-ID: <202606281818.Ewx5dg8O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/bbr3
head:   8d91095085b245c305f2c1d0bde3bd6bc9b00b8c
commit: cee5ff73d51985d6b1f914fae2312ad1af564c2b [1/2] tcp/bbr3: add BBRv3 congestion control
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260628/202606281818.Ewx5dg8O-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606281818.Ewx5dg8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606281818.Ewx5dg8O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/tcp_bbr3.c: In function 'bbr_main':
>> net/ipv4/tcp_bbr3.c:2051:17: warning: variable 'round_delivered' set but not used [-Wunused-but-set-variable=]
    2051 |         u32 bw, round_delivered;
         |                 ^~~~~~~~~~~~~~~


vim +/round_delivered +2051 net/ipv4/tcp_bbr3.c

  2043	
  2044	__bpf_kfunc static void bbr_main(struct sock *sk, u32 ack, int flag,
  2045					 const struct rate_sample *rs)
  2046	{
  2047		struct tcp_sock *tp = tcp_sk(sk);
  2048		struct bbr *bbr = inet_csk_ca(sk);
  2049		struct bbr_context ctx = { 0 };
  2050		bool update_model = true;
> 2051		u32 bw, round_delivered;
  2052		int ce_ratio = -1;
  2053	
  2054		round_delivered = bbr_update_round_start(sk, rs, &ctx);
  2055		if (bbr->round_start) {
  2056			bbr->rounds_since_probe =
  2057				min_t(s32, bbr->rounds_since_probe + 1, 0xFF);
  2058			ce_ratio = bbr_update_ecn_alpha(sk);
  2059		}
  2060		bbr_plb(sk, rs, ce_ratio);
  2061	
  2062		bbr->ecn_in_round  |= (bbr->ecn_eligible && rs->is_ece);
  2063		bbr_calculate_bw_sample(sk, rs, &ctx);
  2064		bbr_update_latest_delivery_signals(sk, rs, &ctx);
  2065	
  2066		if (bbr_run_fast_path(sk, &update_model, rs, &ctx))
  2067			goto out;
  2068	
  2069		if (update_model)
  2070			bbr_update_model(sk, rs, &ctx);
  2071	
  2072		bbr_update_gains(sk);
  2073		bw = bbr_bw(sk);
  2074		bbr_set_pacing_rate(sk, bw, bbr->pacing_gain);
  2075		bbr_set_cwnd(sk, rs, rs->acked_sacked, bw, bbr->cwnd_gain,
  2076			     tcp_snd_cwnd(tp), &ctx);
  2077		bbr_bound_cwnd_for_inflight_model(sk);
  2078	
  2079	out:
  2080		bbr_advance_latest_delivery_signals(sk, rs, &ctx);
  2081		bbr->prev_ca_state = inet_csk(sk)->icsk_ca_state;
  2082		bbr->loss_in_cycle |= rs->lost > 0;
  2083		bbr->ecn_in_cycle  |= rs->delivered_ce > 0;
  2084	}
  2085	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
