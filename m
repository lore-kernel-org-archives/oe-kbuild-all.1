Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81F71E766F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 05:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638019; cv=none; b=SuQHswWxjV1Nmsproxc9//w5J/9WDXlgZovEM3eQoBKYatTokdYr9zQLaG3Rg91Lo/T+hVKJk8/7cPI9VRSUO0jSWltIn/rQd8vl8v156HgtQWg++cww3NH/RViqreWUTB8MnHlAd8BsRHZWNUkQHtL+qEECR/N3RN2Blxp8wO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638019; c=relaxed/simple;
	bh=QwVL5bnbAHg6L90NwksFlxa8HoQrIZVaGy9q5Tq4ZmY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FYi/f+fgcHDIc1xXiRr/ok/8rmxXBX0v+mOgGbJ3slQG1gY0wDeTamgQfry609wZJ8se0n0dTAoT6yAGm1/aXzaUNr1SuBbuQ1iNkAtFKDOQsy3P/3AxzFWf0FxlGe2bzrHinpXxYB8cABqCenk2Tq1FcMic0Wtw3GBb+eU9eoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJmSMtrS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJmSMtrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780638018; x=1812174018;
  h=date:from:to:cc:subject:message-id;
  bh=QwVL5bnbAHg6L90NwksFlxa8HoQrIZVaGy9q5Tq4ZmY=;
  b=FJmSMtrSQoJm+wfeQ0PQ6Liiyxv/7KqFk14tgm6Jgmfclyq0mOX0Ic1V
   s/f7gEUSOgIM/yPbZZOHoY8rbA1B7Lq4nd37Ej1exCKDtrADeZUfzwGNR
   +ghLW9XsUM3FiS9aBpo5nNUWTsFsJidTgRfEZvoVhlm0pB337lf/VFlBm
   OES/fv3UiQqwIN+sJMVfGYg0cs4GMWtNvAhgWxhPdRJlYQhLcIdoWePXC
   vRb4pw0B4J/iSjSaL1IZ6aKIpi/R/ZghKQzoUHAEQdJ5EY9Wl23rsWSmK
   DKZTwjcqB/Yv3vFt3XnZ/oOSLgfYtPWoRwvqd2jOQTxU+gnKphEI8UZAH
   w==;
X-CSE-ConnectionGUID: VtPKw9IcQdWbz9GYh3WBSQ==
X-CSE-MsgGUID: R+GszucYSqiuAnUgAuO4Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81470343"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81470343"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 22:40:18 -0700
X-CSE-ConnectionGUID: 7MXVQDgJQACoSDtNQYvOMQ==
X-CSE-MsgGUID: YUTNBXvFSjqMoJWq2mZYCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249681379"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jun 2026 22:40:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVNHw-00000000FZm-2ZA4;
	Fri, 05 Jun 2026 05:40:12 +0000
Date: Fri, 05 Jun 2026 13:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Johnson <jjohnson@kernel.org>,
 ath12k@lists.infradead.org,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [ath:master 2/4] net/wireless/nl80211.c:6993:41: error:
 'struct cfg80211_ap_settings' has no member named 'he_oper'
Message-ID: <202606051314.S2kES3SV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
head:   d54e5a797eebf0ef8c91f628aac578128b39a0b1
commit: da16cf9abfd30e79c6c7ed7c4f8bf8b1316b934b [2/4] Merge remote-tracking branch 'wireless-next/main'
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260605/202606051314.S2kES3SV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051314.S2kES3SV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051314.S2kES3SV-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/wireless/nl80211.c: In function 'nl80211_calculate_ap_capabilities':
>> net/wireless/nl80211.c:6993:41: error: 'struct cfg80211_ap_settings' has no member named 'he_oper'
    6993 |         if (!!params->he_cap != !!params->he_oper)
         |                                         ^~
>> net/wireless/nl80211.c:6996:42: error: 'struct cfg80211_ap_settings' has no member named 'eht_oper'
    6996 |         if (!!params->eht_cap != !!params->eht_oper)
         |                                          ^~


vim +6993 net/wireless/nl80211.c

7443dcd1f1718a Aloka Dixit   2020-09-11  6942  
66cd794e3c30b8 Johannes Berg 2017-02-07  6943  /*
66cd794e3c30b8 Johannes Berg 2017-02-07  6944   * Since the nl80211 API didn't include, from the beginning, attributes about
a384ae96990250 Johannes Berg 2026-04-15  6945   * HT/VHT/... capabilities, we parse them out of the elements and check for
a384ae96990250 Johannes Berg 2026-04-15  6946   * validity for use by drivers/mac80211.
66cd794e3c30b8 Johannes Berg 2017-02-07  6947   */
d642e759b73cbf Johannes Berg 2026-04-15  6948  static int nl80211_calculate_ap_capabilities(struct genl_info *info,
d642e759b73cbf Johannes Berg 2026-04-15  6949  					     struct cfg80211_ap_settings *params)
66cd794e3c30b8 Johannes Berg 2017-02-07  6950  {
a384ae96990250 Johannes Berg 2026-04-15  6951  	size_t ies_len = params->beacon.tail_len;
a384ae96990250 Johannes Berg 2026-04-15  6952  	const u8 *ies = params->beacon.tail;
153e2a11c99b73 Johannes Berg 2021-09-30  6953  	const struct element *cap;
66cd794e3c30b8 Johannes Berg 2017-02-07  6954  
153e2a11c99b73 Johannes Berg 2021-09-30  6955  	cap = cfg80211_find_elem(WLAN_EID_HT_CAPABILITY, ies, ies_len);
d642e759b73cbf Johannes Berg 2026-04-15  6956  	if (cap) {
d642e759b73cbf Johannes Berg 2026-04-15  6957  		if (cap->datalen < sizeof(*params->ht_cap)) {
d642e759b73cbf Johannes Berg 2026-04-15  6958  			GENL_SET_ERR_MSG(info, "bad HT capability in beacon");
d642e759b73cbf Johannes Berg 2026-04-15  6959  			return -EINVAL;
d642e759b73cbf Johannes Berg 2026-04-15  6960  		}
153e2a11c99b73 Johannes Berg 2021-09-30  6961  		params->ht_cap = (void *)cap->data;
d642e759b73cbf Johannes Berg 2026-04-15  6962  	}
d642e759b73cbf Johannes Berg 2026-04-15  6963  
153e2a11c99b73 Johannes Berg 2021-09-30  6964  	cap = cfg80211_find_elem(WLAN_EID_VHT_CAPABILITY, ies, ies_len);
d642e759b73cbf Johannes Berg 2026-04-15  6965  	if (cap) {
d642e759b73cbf Johannes Berg 2026-04-15  6966  		if (cap->datalen < sizeof(*params->vht_cap)) {
d642e759b73cbf Johannes Berg 2026-04-15  6967  			GENL_SET_ERR_MSG(info, "bad VHT capability in beacon");
d642e759b73cbf Johannes Berg 2026-04-15  6968  			return -EINVAL;
d642e759b73cbf Johannes Berg 2026-04-15  6969  		}
153e2a11c99b73 Johannes Berg 2021-09-30  6970  		params->vht_cap = (void *)cap->data;
d642e759b73cbf Johannes Berg 2026-04-15  6971  	}
d642e759b73cbf Johannes Berg 2026-04-15  6972  
153e2a11c99b73 Johannes Berg 2021-09-30  6973  	cap = cfg80211_find_ext_elem(WLAN_EID_EXT_HE_CAPABILITY, ies, ies_len);
d642e759b73cbf Johannes Berg 2026-04-15  6974  	if (cap) {
d642e759b73cbf Johannes Berg 2026-04-15  6975  		if (cap->datalen < sizeof(*params->he_cap) + 1) {
d642e759b73cbf Johannes Berg 2026-04-15  6976  			GENL_SET_ERR_MSG(info, "bad HE capability in beacon");
d642e759b73cbf Johannes Berg 2026-04-15  6977  			return -EINVAL;
d642e759b73cbf Johannes Berg 2026-04-15  6978  		}
153e2a11c99b73 Johannes Berg 2021-09-30  6979  		params->he_cap = (void *)(cap->data + 1);
d642e759b73cbf Johannes Berg 2026-04-15  6980  	}
d642e759b73cbf Johannes Berg 2026-04-15  6981  
8bc65d38ee4668 Aloka Dixit   2022-05-22  6982  	cap = cfg80211_find_ext_elem(WLAN_EID_EXT_EHT_CAPABILITY, ies, ies_len);
8bc65d38ee4668 Aloka Dixit   2022-05-22  6983  	if (cap) {
8bc65d38ee4668 Aloka Dixit   2022-05-22  6984  		params->eht_cap = (void *)(cap->data + 1);
8bc65d38ee4668 Aloka Dixit   2022-05-22  6985  		if (!ieee80211_eht_capa_size_ok((const u8 *)params->he_cap,
8bc65d38ee4668 Aloka Dixit   2022-05-22  6986  						(const u8 *)params->eht_cap,
d642e759b73cbf Johannes Berg 2026-04-15  6987  						cap->datalen - 1, true)) {
d642e759b73cbf Johannes Berg 2026-04-15  6988  			GENL_SET_ERR_MSG(info, "bad EHT capability in beacon");
8bc65d38ee4668 Aloka Dixit   2022-05-22  6989  			return -EINVAL;
8bc65d38ee4668 Aloka Dixit   2022-05-22  6990  		}
8bc65d38ee4668 Aloka Dixit   2022-05-22  6991  	}
072e6f7f416f5d Johannes Berg 2026-01-30  6992  
cb9959ab5f9961 Johannes Berg 2026-06-03 @6993  	if (!!params->he_cap != !!params->he_oper)
cb9959ab5f9961 Johannes Berg 2026-06-03  6994  		return -EINVAL;
cb9959ab5f9961 Johannes Berg 2026-06-03  6995  
cb9959ab5f9961 Johannes Berg 2026-06-03 @6996  	if (!!params->eht_cap != !!params->eht_oper)
cb9959ab5f9961 Johannes Berg 2026-06-03  6997  		return -EINVAL;
cb9959ab5f9961 Johannes Berg 2026-06-03  6998  
8bc65d38ee4668 Aloka Dixit   2022-05-22  6999  	return 0;
66cd794e3c30b8 Johannes Berg 2017-02-07  7000  }
66cd794e3c30b8 Johannes Berg 2017-02-07  7001  

:::::: The code at line 6993 was first introduced by commit
:::::: cb9959ab5f99611d27a06586add84811fe8102dc wifi: cfg80211: enforce HE/EHT cap/oper consistency

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
