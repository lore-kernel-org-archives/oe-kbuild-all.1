Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617896;
	b=ABc5apgvcsxi89iDF1qTxUVoTgCgp6z9NLTkF7gIEjyvoxhR9vhTuu5/Aohm61kYXUxU
	 mnEODpmQGk2uXPYH33rfd8ChwtQZ2fG4/3NlwKqNJ25/PjhXUz4me+gQzJJuHMWklhTF+
	 8I/snHGH68ngDApf3J2US97sH3msj0TB50kbRyEOvFjlX95sJZTbNIuFlr12q2WC3twSk
	 yGoimPQGJvg4nWdInv5K5fsupsFVmjC130VOk1E2KJ5VTz5HKcnK6BX1yF2HkeTQXNhYg
	 7sH7KPbHc4LbLFCxc8nWar9Q81/zHJh/RTuP1PEEzwYy3c+ooibOniRXnubPu29X3yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617896;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kAaLPPsQOaueor0xfIiuL6YBfAxmmLMrN100IbJMdeU=;
	b=v7TaG0UF6L8W5Nk1WaERQpmaEw2Cu2FbkBwVVOTLWCq9SXCKeDpqBComtTaI9h4tvl9v
	 Ke7yBVkIB1utsISghVMJlajbD+LhPMQjbUvKrVRN6IcHcB0BanrON4seAQkGlFFh/S3CC
	 YN+lNkRYV2BK3RG6s9cakFnNFFs7Ja5MekuM24NB7p/k5R6ZR6Lx16CiV1Kh0EqY7BLD9
	 Adjy1KVH07jVjgQE6Alz6VSnzTV3NbtdNoIKbyc3RHwzxAD7xlrYnfuD59/6Nty5WkLfn
	 EqlFZtppHADeypj8fvrmLdlx/Phc3oXK1Iy+Z3ZZ7eR/yPrr+ZL/DZqcB5zjJGPHugw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O31WhqPT;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81690606A326
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 14:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81690606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O31WhqPT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795617895; x=1827153895;
  h=date:from:to:cc:subject:message-id;
  bh=n0kkWzB412WhG1XMAiu+x2YVXHd00biHVZkow5vucmA=;
  b=O31WhqPT5LQvfLWdhzTsOSTvsCxTxd92hT1oBdWXM3xKPq18Xxs0t4b4
   Gk7jRsEAp9yBpDlQCfug0oQlK+NLoFh+cGZRKD/NfWGZEDCqInFRdivHz
   GJuaMjvoSJPHa2hdbYr5tWcze/LkrjpZ+n5UKyDAVPhLPe1dVPIY/sVtC
   hmyTvjlaHn0iRO8PIOaw19WYMH6j623yabGCw9sAijSsdhnnahNnwSZLl
   7bbIqk9Ux8cV9SQzYERdfZ1x9xCPmvC83/lp+EzFqsg1ef1e9WhHvXtTT
   FhUOlmPVjYen6CaUEkpDFtJvuFgP8XaLC1PtpAbwVaj9YRa+uoI4bzddX
   w==;
X-CSE-ConnectionGUID: GfThH+4JRaeCZggzH4TecQ==
X-CSE-MsgGUID: IoRZ0KQhRp66gxptBsd6Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4386601"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4386601"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 06:44:55 -0800
X-CSE-ConnectionGUID: kcOTT9NzRpWEMLCqJr+5DA==
X-CSE-MsgGUID: Y+gvkGzgSgCjexWwPFdoug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12476179"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 25 Nov 2026 06:44:52 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWEEr-0000000009D-2KHb;
	Wed, 25 Nov 2026 14:44:49 +0000
Date: Wed, 25 Nov 2026 15:44:32 +0100
From: kernel test robot <lkp@intel.com>
To: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Ripan Deuri <quic_rdeuri@quicinc.com>,
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: drivers/net/wireless/ath/ath12k/wifi7/hw.c:127:21-23:
 WARNING !A || A && B is equivalent to !A || B
Message-ID: <20261125153656.0ye4b8d7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4dce97c6c265544342e716e62fd24bbb232590c5
commit: ee16dcf573d5e3283fda601dd4bca6bc52251017 wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete
date:   1 year, 1 month ago
config: x86_64-randconfig-2103-20261124 (https://download.01.org/0day-ci/archive/20261125/20261125153656.0ye4b8d7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125153656.0ye4b8d7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath12k/wifi7/hw.c:127:21-23: WARNING !A || A && B is equivalent to !A || B

vim +127 drivers/net/wireless/ath/ath12k/wifi7/hw.c

   111	
   112	static bool
   113	ath12k_wifi7_is_frame_link_agnostic_wcn7850(struct ath12k_link_vif *arvif,
   114						    struct ieee80211_mgmt *mgmt)
   115	{
   116		struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
   117		struct ath12k_hw *ah = ath12k_ar_to_ah(arvif->ar);
   118		struct ath12k_base *ab = arvif->ar->ab;
   119		struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
   120		struct ath12k_dp_peer *peer;
   121		__le16 fc = mgmt->frame_control;
   122	
   123		spin_lock_bh(&dp->dp_lock);
   124		if (!ath12k_dp_link_peer_find_by_addr(dp, mgmt->da)) {
   125			spin_lock_bh(&ah->dp_hw.peer_lock);
   126			peer = ath12k_dp_peer_find_by_addr(&ah->dp_hw, mgmt->da);
 > 127			if (!peer || (peer && !peer->is_mlo)) {
   128				spin_unlock_bh(&ah->dp_hw.peer_lock);
   129				spin_unlock_bh(&dp->dp_lock);
   130				return false;
   131			}
   132			spin_unlock_bh(&ah->dp_hw.peer_lock);
   133		}
   134		spin_unlock_bh(&dp->dp_lock);
   135	
   136		if (vif->type == NL80211_IFTYPE_STATION)
   137			return arvif->is_up &&
   138			       (vif->valid_links == vif->active_links) &&
   139			       !ieee80211_is_probe_req(fc) &&
   140			       !ieee80211_is_auth(fc) &&
   141			       !ieee80211_is_deauth(fc) &&
   142			       !ath12k_is_addba_resp_action_code(mgmt);
   143	
   144		if (vif->type == NL80211_IFTYPE_AP)
   145			return !(ieee80211_is_probe_resp(fc) || ieee80211_is_auth(fc) ||
   146				 ieee80211_is_assoc_resp(fc) || ieee80211_is_reassoc_resp(fc) ||
   147				 ath12k_is_addba_resp_action_code(mgmt));
   148	
   149		return false;
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
