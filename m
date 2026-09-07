Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082B3FF1A5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 19:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808797; cv=none; b=BYYzR37NXrtnJJmbQtc7VBSJheybSHzHLg3UvTge9OQQb6tKYa6erJWKgR59PzpPYIXwq+5LF1sCvQmseLNkQlYQlMpriQc97ZvDlqGZ6gvBVVupQRVqgbjs3d1elLX3ew3ru4u1UuYp7P2Vsgifwc/RGI5aUjWRbYpvqEb0F1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808797; c=relaxed/simple;
	bh=N66kZadZWFZbwmryCTtEOD0nSw4EvlPKq3Ac+oEdqmQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OTePyHoFr+Hs0Nh3lWCf6/ReOBwOksxTXJTRP46d+oOjesvkFE5AArgRoidbmCWIzoMHhDwJ1cGXnzL99IQwGkyndj2zQ7EQHmLZ81R0rd8kkh8i9T05eAmZOzNbatgPl0RzitS49rVi0IYKCXdsQF9Nvfg1FiHZxPH1FiNEjqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RA9NLzU/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RA9NLzU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788808795; x=1820344795;
  h=date:from:to:cc:subject:message-id;
  bh=N66kZadZWFZbwmryCTtEOD0nSw4EvlPKq3Ac+oEdqmQ=;
  b=RA9NLzU/sG9PTbFX6gMTeGqpJkKKCQ1pTYCLSAgQK9NY19lyTURBj5L9
   PVFDEpyQDcu2boox+7OyrUa0hLVWAlw3eAYAm/CsgcRVosHdKSdLCvRyJ
   MTK8IDFffqOUZvTAIQcISrzYid+bkpSrFyv69beb/8fZ70OiSuz7gc/Ll
   0jmgk+9ux6zIcY7ysjjvYfDa1z0O8hm2WafB6SeFbp7xVrEv/UVTfWsQc
   V4Gs+KJEGbV+7znGpnGY3aJtK6FJx+s1oVFsf38iDT9ZvnTNE4adSHu/u
   6fHxW9DmhHhrM7OmxjnGmqGwKDPvd6+9hFH3ZHHhU7rwJXJBXzlE+gUiw
   g==;
X-CSE-ConnectionGUID: f16SGjwLSq+fSSrrLoXapA==
X-CSE-MsgGUID: ss/e6YbjTzqjDFykVPMKig==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100733288"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="100733288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 12:19:55 -0700
X-CSE-ConnectionGUID: DuMVL7GSTZypPGqilA1GBA==
X-CSE-MsgGUID: sIeg5jKlSTCNUPGZmaUQeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="300669422"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Sep 2026 12:19:54 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3esh-000000000Ly-2Lnn;
	Mon, 07 Sep 2026 19:19:51 +0000
Date: Mon, 07 Sep 2026 21:19:20 +0200
From: kernel test robot <lkp@intel.com>
To: Willem de Bruijn <willemb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/idpf/idpf_txrx.c:3025:34:
 warning: unused variable 'np'
Message-ID: <202609072109.CNby2SVX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Willem-de-Bruijn/net-rtnetlink-add-pacing_offload_horizon-attribute-to-net_device/20260831-172610
head:   69b32b4e203508fb1bcee3f427fab52eac49ff03
commit: 823b97f23d9e611040fcf018d85ce318ed1a549c idpf: support pacing offload
date:   7 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260907/202609072109.CNby2SVX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609072109.CNby2SVX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609072109.CNby2SVX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/idpf/idpf_txrx.c: In function 'idpf_tx_splitq_set_txtime':
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:3025:34: warning: unused variable 'np' [-Wunused-variable]
    3025 |         struct idpf_netdev_priv *np = netdev_priv(skb->dev);
         |                                  ^~


vim +/np +3025 drivers/net/ethernet/intel/idpf/idpf_txrx.c

  3019	
  3020	static void idpf_tx_splitq_set_txtime(const struct sk_buff *skb,
  3021					      const struct idpf_tx_queue *tx_q,
  3022					      struct idpf_tx_splitq_params *tx_params)
  3023	{
  3024		const int offload_slack_ns = 400;
> 3025		struct idpf_netdev_priv *np = netdev_priv(skb->dev);
  3026		u64 ts, now, horizon;
  3027	
  3028		horizon = READ_ONCE(skb->dev->pacing_offload_horizon);
  3029		if (!horizon)
  3030			return;
  3031	
  3032		switch (skb->tstamp_type) {
  3033		case SKB_CLOCK_REALTIME:
  3034			ts = ktime_to_ns(ktime_add(skb->tstamp,
  3035						   ktime_mono_to_any(0, TK_OFFS_TAI) -
  3036						   ktime_mono_to_any(0, TK_OFFS_REAL)));
  3037			break;
  3038		case SKB_CLOCK_MONOTONIC:
  3039			ts = ktime_to_ns(ktime_mono_to_any(skb->tstamp, TK_OFFS_TAI));
  3040			break;
  3041		case SKB_CLOCK_TAI:
  3042			ts = ktime_to_ns(skb->tstamp);
  3043			break;
  3044		default:
  3045			WARN_ON_ONCE(1);
  3046			return;
  3047		}
  3048	
  3049		now = ktime_get_clocktai_ns();
  3050		if (ts < now + offload_slack_ns)
  3051			return;
  3052	
  3053		/* beyond offload horizon? set overflow bit only */
  3054		if (ts > now + horizon) {
  3055			tx_params->offload.desc_ts[2] =
  3056				IDPF_TXD_FLOW_SCH_HORIZON_OVERFLOW_M;
  3057			return;
  3058		}
  3059	
  3060		ts >>= tx_q->ts_gran_pow2;
  3061	
  3062		/* 0 is valid 23b timestamp, but also means field unset.
  3063		 * Increase by one to avoid this case
  3064		 */
  3065		if ((ts & 0x7fffff) == 0) {
  3066			tx_params->offload.desc_ts[0] = 1;
  3067			return;
  3068		}
  3069	
  3070		tx_params->offload.desc_ts[0] = ts & 0xff;
  3071		tx_params->offload.desc_ts[1] = (ts >> 8) & 0xff;
  3072		tx_params->offload.desc_ts[2] = ((ts >> 16) & 0x7f);
  3073	}
  3074	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
