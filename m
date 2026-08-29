Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919113A5E67
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 01:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787965238; cv=none; b=lTcXZJY7i3bjEWINlYSA8o2o8n3rpedF9EgUeVxOGHJjpA5hqNozLfNgMj4ZDcv8n4zlncmvd+c+j1oK1/AAuZQ0w3xlbbrnAJ+3cNjSLKFAzg1NOlNPtS2wgkeHuVAt01EDLo5QVOHB+cY8bq27UN9r7KEqaDR4Ne70GZ3oZ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787965238; c=relaxed/simple;
	bh=xdl9w6vnvEBAFzbJIiAqgVlnqcQNmS1fm8TAuB3M1xA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kk9CGHpqvCsqeT1a2TPJqgWNYG74hm4SauDTuTlvF8Cz+4Xy7YIZZDPN05RQxZqqt5jsPa2kGoWKTMd+HJH9qN9EcSWU6Pk/XK/ageVZzkr13gNVjmuikJ3En1XaXJUqT9enFeRqEYA4skSeXJt0S4M3CW6g5+OVIlCSvU4SBMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0gXjwXv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0gXjwXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787965233; x=1819501233;
  h=date:from:to:cc:subject:message-id;
  bh=xdl9w6vnvEBAFzbJIiAqgVlnqcQNmS1fm8TAuB3M1xA=;
  b=n0gXjwXvbgTd+j11/hrzwLy/YN47gjo4MMqs7ulieHmleHnWY0taYmi4
   HH3dtSrOlTn8b1W53Rab9ap4ZkmcUGL7Wej8lIWYJsI4YRxzgKnjlSyVU
   a/AQGBmDbE3bwRxn398TqW2oz3kryR2ATWrOBo19n0tFTPsR9q0nLHVij
   687dI+23D30LFmMuPrc4hmz7A81PlqpT88m8Y5FGKmjbN37/Mcw+b0ohe
   oW0q0682hgMrfUtJtrHXzjxtJJy7PaS899seD+IIMvXxj4hJ8/EWgJ+zP
   fwi6X7U1RvtRdcCJDg89ijHkkUAgUdwM6ldy6hJKvZ9URVEPp7cJZWgX2
   Q==;
X-CSE-ConnectionGUID: 4ewSgw1JQHOUgGNDV3BzUQ==
X-CSE-MsgGUID: 4nMUF0TmSbaJ87ZqikxG2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88677880"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="88677880"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 18:00:33 -0700
X-CSE-ConnectionGUID: iezCkgNgQ6OR+23e3YheLg==
X-CSE-MsgGUID: spvJRGx+RVekNvrhU+P0YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="268881189"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Aug 2026 18:00:31 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x07Qq-00000000CCc-34cD;
	Sat, 29 Aug 2026 01:00:28 +0000
Date: Sat, 29 Aug 2026 08:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/bbr3 1/2] net/ipv4/tcp_bbr3.c:2051:17: warning:
 variable 'round_delivered' set but not used
Message-ID: <202608290804.uQTc6zeR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/bbr3
head:   f04474ac60538e992f6c6cf854e0fda08632e2da
commit: f7f00444a9ad2284192bfa6aaef7ce9be2d43388 [1/2] tcp/bbr3: add BBRv3 congestion control
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260829/202608290804.uQTc6zeR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608290804.uQTc6zeR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608290804.uQTc6zeR-lkp@intel.com/

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
