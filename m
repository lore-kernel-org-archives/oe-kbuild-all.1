Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881E234214F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862616; cv=none; b=jfBZdFvZSCGTUFBoZ4VlDL851YCe6885wV70/HFzjIs1B3pXU0+RH7waz7s5fk1yIbzM9ZroH3VLusxZSzuCUveoWI0W6Qren881+Go2lTbNfOTmm8ILq9CNke4+lLjO5YqP/ZUE7OtnbQeCE4MjxuwFckpxPnKh4mNn6/N6Kkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862616; c=relaxed/simple;
	bh=WMR57r6zY3txcGyawkvrolhETIaBHSHolvdB5LA2hvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aEpXh5v/tzWnS82HIJX2DXbt5wqABxYh8EHIa19EiQUCsQIopBLFBYvBN0Jpsry+G4AOKEJ1nZpGT52UQovD9HUGh4chh6/ZqW+GAwyA2RKw4yDyJjy5TDFTY0Wi3V5vhAqWlFWOeMmuYj2QQ/ueWvVSTJNX2PiI6EV4QxleMW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhEpEVQA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhEpEVQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767862611; x=1799398611;
  h=date:from:to:cc:subject:message-id;
  bh=WMR57r6zY3txcGyawkvrolhETIaBHSHolvdB5LA2hvM=;
  b=jhEpEVQA/Lf7UEKT/VoSAbCi2xSuVpNmltv8JlK5XoW4jsZX9W9O2tI6
   noP0aVnLYI/oyZY+G3MC1wqzNB662GJm3+3ewUzhUlCeHvBSG1G32SyL8
   IqaG2XlzUhtxRaffqPNmay5EaEVo40bEiux9zJY0Z8AtT7PVJlv4EY3uB
   o18tGcrDV3ilB+9MYTSWHY5B3XpBL/xn8k2LePorhXBpEXRU9qWGtTKy/
   mFjiB+yCHjmQSCPq2KUuWglIk8Zz45mu3AcMe9k8p18s7ExUbT2Q4H6WR
   UZnQBC9p2QUma07e0pM48JcdvB54Bv+IpPg8IfTSbj3NFig/D6zpQSLx1
   w==;
X-CSE-ConnectionGUID: 0J4j7ZrpTB6vkNL5Xc4YVA==
X-CSE-MsgGUID: rMbHBcGfSr+2hDlV0Kn8VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="79877771"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="79877771"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:56:46 -0800
X-CSE-ConnectionGUID: SirwK2MoTFifkiN4MUAORA==
X-CSE-MsgGUID: 67F5xs7rTlGCYNRNN37FhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="202351989"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jan 2026 00:56:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdlov-000000004Wo-2ojH;
	Thu, 08 Jan 2026 08:56:41 +0000
Date: Thu, 08 Jan 2026 16:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Ripan Deuri <quic_rdeuri@quicinc.com>,
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [linux-next:master 82/4725]
 drivers/net/wireless/ath/ath12k/wifi7/hw.c:127:21-23: WARNING !A || A && B is
 equivalent to !A || B
Message-ID: <202601081611.RFZQlTGR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
commit: ee16dcf573d5e3283fda601dd4bca6bc52251017 [82/4725] wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete
config: x86_64-randconfig-101-20260107 (https://download.01.org/0day-ci/archive/20260108/202601081611.RFZQlTGR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601081611.RFZQlTGR-lkp@intel.com/

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
