Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664557;
	b=a3JRmViPpb2ySqKmX69laPtJbG9kvmYsLT94Adf91eheS+nOqGBF9xmfNFLvkGP/EVr/
	 XcjVukjuwQWh7zSDBYIc3N8xCByfht6B1gmUS/2Ko8/y3NJ1NKH/OuuH8HyEe0QcCFuk7
	 YHggmQR7X83XMpvtTSMW6AXNFbOQzmQetBayXGocy7zrL7WnXU1wui1WMem7CN7U66ZdS
	 eMyLfs/PdSJbw/jjr1ztOJAjFMBQo0fE+/BZw5ktVnWPNdIEryPjnqISb15yHY7EvsiBf
	 hL2xobtAXsyx6Y0E23btvGUYBupb4XjtUL+w4wUx9F045pvNP9WeiGQ7Age3EKGaEGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664557;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iU6IgNdA70v9+Grxkol5MbwHNrHD53mrGFgUAtLCd6I=;
	b=R0AGiqRgUfOuwnubUepOO8XRmL0zrSFlG7Nfivw2RJ/emLAJ/ZO2ULGUJv1HrjTsxDSf
	 FMz6AaaAC4uGqNSRim/pXxzAwVcsLtkYT8e6ExmCQichJKpUsYk7YC2hyF4TzecVB16vZ
	 jxL3C+JqTaN7Dt6W5C/qT2tl9qDuPKbgKLkaKWN/PScqWsSWvpPiTEmdA3GelCPXNWscG
	 aZgnvgikSi8ygFw1BALU748n71mrX/PLXYca9uJ99t2Qm9HprSTSU9MYMGjVbu2HwD5vG
	 9gSZZpvij9tP0rHVUhJaHgH0fPP6wjNvLOBSDC7+GkboVXztPSoOXQyVjBC5+icM8ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQiIfHYA;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBED0606A326
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 03:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBED0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQiIfHYA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795664556; x=1827200556;
  h=date:from:to:cc:subject:message-id;
  bh=We0PQE42gK/MyHlLNApmjlpzKRbioUzWmKY5uMLMZXY=;
  b=hQiIfHYAwHa3LguNwK+9wUynJzixp/wYTQJC8wcOTofbqkZdM4/GqqJa
   dcmEoWumNhEgRH3wLGBdSjMNYvvk3YCpAvwvfeAE8ApE8kkOuaKOiJEeV
   EKM+WGEIRz7JgUtvDXIutQ9qwkxzhwWPnP+2XBS8RqbZFTpNvoSI5mShQ
   zBXYyCEta2xfAl3MrAPC6Vzo3Z4/3TgUWrL/q4O8NERCXA3XD1J341oAO
   D8YK0Mr9awnMPkE7NqnPqMFK+JrIzgMSpAds/D0b7cLYgS+bcSz7Fdo2z
   PUpTqv/1G/33qPWzrzn5b4fJZtbvqA1E7jEsKInOOuNNQ8EIFJpKuzgLo
   w==;
X-CSE-ConnectionGUID: I9EOy5NJRhSn/ALt6u6pRg==
X-CSE-MsgGUID: AMpnUo2NR4a4TTDC1p19dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4487016"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4487016"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 19:42:35 -0800
X-CSE-ConnectionGUID: jTxc5wSwTMm+U8s2dFEm6g==
X-CSE-MsgGUID: HGCKOAlAR3ei5ILPo8dk/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12303846"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 19:42:33 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWQNT-000000000Dr-0uD3;
	Thu, 26 Nov 2026 03:42:31 +0000
Date: Thu, 26 Nov 2026 04:42:10 +0100
From: kernel test robot <lkp@intel.com>
To: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Ripan Deuri <quic_rdeuri@quicinc.com>,
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: drivers/net/wireless/ath/ath12k/wifi7/hw.c:127:21-23:
 WARNING !A || A && B is equivalent to !A || B
Message-ID: <20261126043442.ZtOXN9et-lkp@intel.com>
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
head:   ebb7a8dc1e74c705daffe11c2faf38ec2628f838
commit: ee16dcf573d5e3283fda601dd4bca6bc52251017 wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete
date:   1 year, 1 month ago
config: x86_64-randconfig-2103-20261124 (https://download.01.org/0day-ci/archive/20261126/20261126043442.ZtOXN9et-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126043442.ZtOXN9et-lkp@intel.com/

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
