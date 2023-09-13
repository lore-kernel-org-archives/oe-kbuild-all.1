Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841C815496
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 05:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694582287; x=1726118287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NNvDygrxaWqhkpNFIMqZgbqf1rmS3+KQP9fslz98aq4=;
  b=Fkm8+N5I4ZSXglxo6DQWEAyMZXrp+clhq7i0+ZYvkV9NM4na/bcAZ+G1
   uAhlhs8cCPxS82AaY+eVjtIicGizWashwNV9k/h4lhuCu93j3SvLqpPRY
   OQw0jnVf4fd4xpWmWkph+3yEckz+D/oVTVReZvTlAT/n1rJbZlyjhkO09
   N1bw9EJBtMQdGUIP3OvVsVBLkra2Y0969AtCCAtCJg/HyQBjKbzewZSYP
   JCCbgtiMrjKgvZg8UDrMbjmk5tlLrfIlKhk9l27a7oPxR4d8ouBBWTtSv
   vkmec1zxXMGtiydkdz4OhuXD/VSG6yNHn3q6lpST/JZ50G/7NV3B2pKg8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464935327"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="464935327"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 22:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="779066517"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="779066517"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Sep 2023 22:18:02 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgIGF-000041-2P;
	Wed, 13 Sep 2023 05:17:59 +0000
Date: Wed, 13 Sep 2023 13:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3897/4552]
 drivers/net/wireless/ath/ath11k/mac.c:7952:22: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202309131311.oWLnuv71-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c13c772fc233a10342c8e1605ff0855dfdf0c89
commit: e8c1841278a78362f7034f3de415096ddb19f097 [3897/4552] wifi: cfg80211: annotate iftype_data pointer with sparse
config: i386-randconfig-062-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131311.oWLnuv71-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131311.oWLnuv71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131311.oWLnuv71-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath11k/mac.c:7952:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ieee80211_sta_he_cap const *he_cap @@     got struct ieee80211_sta_he_cap const [noderef] __iftype_data * @@
   drivers/net/wireless/ath/ath11k/mac.c:7952:22: sparse:     expected struct ieee80211_sta_he_cap const *he_cap
   drivers/net/wireless/ath/ath11k/mac.c:7952:22: sparse:     got struct ieee80211_sta_he_cap const [noderef] __iftype_data *

vim +7952 drivers/net/wireless/ath/ath11k/mac.c

61fe43e7216df6 Miles Hu   2021-09-24  7913  
d5c65159f28953 Kalle Valo 2019-11-23  7914  static bool
d5c65159f28953 Kalle Valo 2019-11-23  7915  ath11k_mac_bitrate_mask_get_single_nss(struct ath11k *ar,
d5c65159f28953 Kalle Valo 2019-11-23  7916  				       enum nl80211_band band,
d5c65159f28953 Kalle Valo 2019-11-23  7917  				       const struct cfg80211_bitrate_mask *mask,
d5c65159f28953 Kalle Valo 2019-11-23  7918  				       int *nss)
d5c65159f28953 Kalle Valo 2019-11-23  7919  {
d5c65159f28953 Kalle Valo 2019-11-23  7920  	struct ieee80211_supported_band *sband = &ar->mac.sbands[band];
d5c65159f28953 Kalle Valo 2019-11-23  7921  	u16 vht_mcs_map = le16_to_cpu(sband->vht_cap.vht_mcs.tx_mcs_map);
61fe43e7216df6 Miles Hu   2021-09-24  7922  	u16 he_mcs_map = 0;
d5c65159f28953 Kalle Valo 2019-11-23  7923  	u8 ht_nss_mask = 0;
d5c65159f28953 Kalle Valo 2019-11-23  7924  	u8 vht_nss_mask = 0;
61fe43e7216df6 Miles Hu   2021-09-24  7925  	u8 he_nss_mask = 0;
d5c65159f28953 Kalle Valo 2019-11-23  7926  	int i;
d5c65159f28953 Kalle Valo 2019-11-23  7927  
d5c65159f28953 Kalle Valo 2019-11-23  7928  	/* No need to consider legacy here. Basic rates are always present
d5c65159f28953 Kalle Valo 2019-11-23  7929  	 * in bitrate mask
d5c65159f28953 Kalle Valo 2019-11-23  7930  	 */
d5c65159f28953 Kalle Valo 2019-11-23  7931  
d5c65159f28953 Kalle Valo 2019-11-23  7932  	for (i = 0; i < ARRAY_SIZE(mask->control[band].ht_mcs); i++) {
d5c65159f28953 Kalle Valo 2019-11-23  7933  		if (mask->control[band].ht_mcs[i] == 0)
d5c65159f28953 Kalle Valo 2019-11-23  7934  			continue;
d5c65159f28953 Kalle Valo 2019-11-23  7935  		else if (mask->control[band].ht_mcs[i] ==
d5c65159f28953 Kalle Valo 2019-11-23  7936  			 sband->ht_cap.mcs.rx_mask[i])
d5c65159f28953 Kalle Valo 2019-11-23  7937  			ht_nss_mask |= BIT(i);
d5c65159f28953 Kalle Valo 2019-11-23  7938  		else
d5c65159f28953 Kalle Valo 2019-11-23  7939  			return false;
d5c65159f28953 Kalle Valo 2019-11-23  7940  	}
d5c65159f28953 Kalle Valo 2019-11-23  7941  
d5c65159f28953 Kalle Valo 2019-11-23  7942  	for (i = 0; i < ARRAY_SIZE(mask->control[band].vht_mcs); i++) {
d5c65159f28953 Kalle Valo 2019-11-23  7943  		if (mask->control[band].vht_mcs[i] == 0)
d5c65159f28953 Kalle Valo 2019-11-23  7944  			continue;
d5c65159f28953 Kalle Valo 2019-11-23  7945  		else if (mask->control[band].vht_mcs[i] ==
d5c65159f28953 Kalle Valo 2019-11-23  7946  			 ath11k_mac_get_max_vht_mcs_map(vht_mcs_map, i))
d5c65159f28953 Kalle Valo 2019-11-23  7947  			vht_nss_mask |= BIT(i);
d5c65159f28953 Kalle Valo 2019-11-23  7948  		else
d5c65159f28953 Kalle Valo 2019-11-23  7949  			return false;
d5c65159f28953 Kalle Valo 2019-11-23  7950  	}
d5c65159f28953 Kalle Valo 2019-11-23  7951  
61fe43e7216df6 Miles Hu   2021-09-24 @7952  	he_mcs_map = le16_to_cpu(ath11k_mac_get_tx_mcs_map(&sband->iftype_data->he_cap));
61fe43e7216df6 Miles Hu   2021-09-24  7953  
61fe43e7216df6 Miles Hu   2021-09-24  7954  	for (i = 0; i < ARRAY_SIZE(mask->control[band].he_mcs); i++) {
61fe43e7216df6 Miles Hu   2021-09-24  7955  		if (mask->control[band].he_mcs[i] == 0)
61fe43e7216df6 Miles Hu   2021-09-24  7956  			continue;
61fe43e7216df6 Miles Hu   2021-09-24  7957  
61fe43e7216df6 Miles Hu   2021-09-24  7958  		if (mask->control[band].he_mcs[i] ==
61fe43e7216df6 Miles Hu   2021-09-24  7959  		    ath11k_mac_get_max_he_mcs_map(he_mcs_map, i))
61fe43e7216df6 Miles Hu   2021-09-24  7960  			he_nss_mask |= BIT(i);
61fe43e7216df6 Miles Hu   2021-09-24  7961  		else
61fe43e7216df6 Miles Hu   2021-09-24  7962  			return false;
61fe43e7216df6 Miles Hu   2021-09-24  7963  	}
61fe43e7216df6 Miles Hu   2021-09-24  7964  
61fe43e7216df6 Miles Hu   2021-09-24  7965  	if (ht_nss_mask != vht_nss_mask || ht_nss_mask != he_nss_mask)
d5c65159f28953 Kalle Valo 2019-11-23  7966  		return false;
d5c65159f28953 Kalle Valo 2019-11-23  7967  
d5c65159f28953 Kalle Valo 2019-11-23  7968  	if (ht_nss_mask == 0)
d5c65159f28953 Kalle Valo 2019-11-23  7969  		return false;
d5c65159f28953 Kalle Valo 2019-11-23  7970  
d5c65159f28953 Kalle Valo 2019-11-23  7971  	if (BIT(fls(ht_nss_mask)) - 1 != ht_nss_mask)
d5c65159f28953 Kalle Valo 2019-11-23  7972  		return false;
d5c65159f28953 Kalle Valo 2019-11-23  7973  
d5c65159f28953 Kalle Valo 2019-11-23  7974  	*nss = fls(ht_nss_mask);
d5c65159f28953 Kalle Valo 2019-11-23  7975  
d5c65159f28953 Kalle Valo 2019-11-23  7976  	return true;
d5c65159f28953 Kalle Valo 2019-11-23  7977  }
d5c65159f28953 Kalle Valo 2019-11-23  7978  

:::::: The code at line 7952 was first introduced by commit
:::::: 61fe43e7216df6e9a912d831aafc7142fa20f280 ath11k: add support for setting fixed HE rate/gi/ltf

:::::: TO: Miles Hu <milehu@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
