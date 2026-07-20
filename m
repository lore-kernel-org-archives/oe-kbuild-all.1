Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B5B414A21
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554080; cv=none; b=pAYWkYAKB0uRaHRuOInY0MibGNmjeS58RodNLPeuqSQDxyJY7pX62uNWu5gDT78zjOoQ4BB2kMzB6O689e351yryYJwWPT2ukCUzQODAF1HYvv98X/N0rqTC3RHevudmEz5qO/gvj7x5dezKtH2OK0jmk686mESlfvTR+r2AlBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554080; c=relaxed/simple;
	bh=y6iFg1nV2kMxaww4LF7sTQpkWSaQmmq3vKHYOPzuobM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WZp7qmyQywsyYtVYA3R0SL9enlcURWod14dDIawm5QVXinUTm9+k6Ng4yxQlhA7qBCcZTM59Qupl5u2I52aNRGsHece004VUU4Sy6SgRH0codyY21LylgaVlkkkveaZ54IhLtl6mQpq5Ea1TMz5AhryarChxMhlMRBoAas4fouU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLiAKzH/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLiAKzH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784554077; x=1816090077;
  h=date:from:to:cc:subject:message-id;
  bh=y6iFg1nV2kMxaww4LF7sTQpkWSaQmmq3vKHYOPzuobM=;
  b=fLiAKzH/JWK9c0OpNaCy4eblpXL+j3S1nV0jaFTQDSuuH34HZrdVvLkm
   4gdbcanqKM8NiZ0A8UvNxXggd9Xk5xXoRA3fRtQjpn3D5d45LpIiONEpu
   nUcW4kBbozS+WisNh3cUrSdRyw3G895JooMNu+11BvXtkf/NmgQLGfsxw
   nDfyBZZN7/9k6by1BEfSW+kw9QIGH9cNPV1I99t5qvI01Cvo5AfAXubvv
   4oqaeUCb5xxvs/qRcB4a/5i6dlNUAcATZsF0Sydzufp4jK8dz6PTB4teX
   mAk7Suo8wayLxfpFsE59GUpTxaPWq6MCwY/uTRCMDm1ReiesEIZSXK3PW
   g==;
X-CSE-ConnectionGUID: HfNDThTAQyCtUPi6ChRILA==
X-CSE-MsgGUID: 9gROYULjSOq2/COL4yqOjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85083422"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="85083422"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 06:27:57 -0700
X-CSE-ConnectionGUID: o0CbPEoqSAOFT0nnQT6XpQ==
X-CSE-MsgGUID: XRIILgCiSpm/VqqiGtDBtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="256279404"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Jul 2026 06:27:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlo27-00000000WIG-2Pcf;
	Mon, 20 Jul 2026 13:27:48 +0000
Date: Mon, 20 Jul 2026 21:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Ripan Deuri <quic_rdeuri@quicinc.com>,
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: drivers/net/wireless/ath/ath12k/wifi7/hw.c:127:21-23:
 WARNING !A || A && B is equivalent to !A || B
Message-ID: <202607202115.v5KjlijV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: ee16dcf573d5e3283fda601dd4bca6bc52251017 wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete
date:   9 months ago
config: i386-randconfig-054-20260720 (https://download.01.org/0day-ci/archive/20260720/202607202115.v5KjlijV-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607202115.v5KjlijV-lkp@intel.com/

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
