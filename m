Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4564613D893
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 03:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731985678; cv=none; b=IbDVf2WfaGEe2xyS++0oBHJB2Uk8FhEAEgrQ+j+kqFtzkSKQFyaH/tzvyqs5suqi/71YfgFWEtYgb5ewUE3m13A6VyUfTWFWkCk0IkjCkWifTvpK5CXgdnry8tKRffitv9xYp3WbjzGFLQX9BI1zPfqmY/DQPtC4GvzLHyscP5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731985678; c=relaxed/simple;
	bh=emm4Cz+FfMFP1Y2grNXj3TtbB3KHQQiQrafFa/qLc7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ugnckaO2Cae/WUNFBlL61jMomGlm3cp6Rir8CGmjDm6uRpAuA38wHic5j8XIMIYAUltEbPe6FjlvVYuweKZlSHlkB6xX1muKhsBIfQX9OPUotXEuYCkPXmRhD6CEOzKiYDP9+MRDSe4BHZO69eEQMv6bBsbPW61LuMMMCQ4pIJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ndo2tRKC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ndo2tRKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731985677; x=1763521677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=emm4Cz+FfMFP1Y2grNXj3TtbB3KHQQiQrafFa/qLc7k=;
  b=Ndo2tRKCoOKIt2tDU7cR4myKhUx4Xsi6IlascwtefN6pcbXm8wK3++py
   +trd0m8wY1LvQLOtuTGAIgs+oMILIujFOxDpi/4qva8vuYzPqpohk08B2
   wbUQm3iMit2eIXi41LgS/B7HWn9I4td7uhJMob4btxHLmhVSZQJtIf3Fq
   46bGknsP9XhzpMTB3AOQzmDPgA8B/fdUQfOmbkPseUWlug+6OolsNs3cw
   UUHZbEgHsEdVLzb4Cby5NafNimd2/2kQhYVge1LSQBk+v+cmP5SM7vaKM
   CZIVWHqJc2tnfc1FQazZQjboO4Jr6E457Y6PH2pGNTuejBBAdbn9rV7Uq
   Q==;
X-CSE-ConnectionGUID: 9R43pVq7RJiuWxoDF066VA==
X-CSE-MsgGUID: YztNOJk6QfadHLNyjwLU5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31904569"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31904569"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 19:07:56 -0800
X-CSE-ConnectionGUID: n4LEqshNTeaHabATJTzn/w==
X-CSE-MsgGUID: BdiJS1dOQ/6eWxNVpcKZNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89576902"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2024 19:07:54 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDEam-00004p-2Z;
	Tue, 19 Nov 2024 03:07:52 +0000
Date: Tue, 19 Nov 2024 11:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/bbr3 1/1] net/ipv4/tcp_bbr.c:2042:17: warning: variable
 'round_delivered' set but not used
Message-ID: <202411191107.zQyx7pwf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/bbr3
head:   a1f04ded36fb527bc23efdb969b1893c82e61a6e
commit: a1f04ded36fb527bc23efdb969b1893c82e61a6e [1/1] tcp/bbr3: initial import
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241119/202411191107.zQyx7pwf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191107.zQyx7pwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191107.zQyx7pwf-lkp@intel.com/

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
