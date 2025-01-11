Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0016FBF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736580375; cv=none; b=MnbMRkYN3T427qgO/UQTdvUvKrhCGLF+kM2QeEQggtB4vnLX3yxSwuSfteem+2WthNYFz8iDM1m5n1N0Pu7HaoH+K0SdAQPrWHXefpPB8enennYubcLsqsDyq9Ikse0VniUENw20uDQz1Sb7vJjJFWz5FowSsPWVyEEHAjd5TLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736580375; c=relaxed/simple;
	bh=ZFgJ0xCx3XQk609CHIajV6qZQo73bJ2ttOQ4Q4GTnzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llLc6Twww5o9S2SwsWjG2cmmmaV0SrS7HFKwWZ9X/CCvuDrSGLLi5BiFwu1AN8Q4JLL9CvY85UC2Uf61b+VCTNu4uz1ChDbmlwW+bA/xxT8V0Nau9a6hiURgFPXCXA/BcyLzzFqosE9k3HHq4Vl4QY+EjFXe1P9Azf8TQsOdjuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdgdVcqF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdgdVcqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736580373; x=1768116373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZFgJ0xCx3XQk609CHIajV6qZQo73bJ2ttOQ4Q4GTnzk=;
  b=QdgdVcqFaYzqBdDIZj227pQuUdt0i4fbj1q8jZeEvoc7926JbgXdhk3Q
   zI1wvXAsE+oK7xRNkh69KjHzEYSS6gviSXoplrrYo6crcNCB/me8BcJzD
   2zTOlbZYB5i6ESDnkQ6WvQY8BmoXONhmTz4110wmwY6QExOOOj98530yN
   i6VcjC2wAjhm4lr22s5bn2PQVinFykPP7/i5d+Z6tDTQ9abSOSEJrLx8b
   7k9H+g4uXmpZvNIjBoiqfr9wFJw5iimdQvVAJDkf4S1xc1vAvBoQrgIiT
   ZGRY/RkJFSoirGql0N7f7ncSltbbc+M28nFWcSpTtIyZrEiQs3cZz73P7
   w==;
X-CSE-ConnectionGUID: iXf43EfySQakAThdgjxpxg==
X-CSE-MsgGUID: 5Re1JUUuSGKIci3CVD06vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="54295014"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="54295014"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 23:26:12 -0800
X-CSE-ConnectionGUID: zWT2BmCPQPa7ZUGRTTBxRA==
X-CSE-MsgGUID: 6SpZxlZLSsa6DO1QGVfnAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108570903"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jan 2025 23:26:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWVsm-000KLD-1Q;
	Sat, 11 Jan 2025 07:26:08 +0000
Date: Sat, 11 Jan 2025 15:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sarika Sharma <quic_sarishar@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/7] wifi: cfg80211: reorg sinfo structure elements
 for MLO
Message-ID: <202501111530.X3vZY0os-lkp@intel.com>
References: <20250110042449.1158789-3-quic_sarishar@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110042449.1158789-3-quic_sarishar@quicinc.com>

Hi Sarika,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 7bf1659bad4e9413cdba132ef9cbd0caa9cabcc4]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarika-Sharma/wifi-cfg80211-reorg-sinfo-structure-elements-for-mesh/20250110-122824
base:   7bf1659bad4e9413cdba132ef9cbd0caa9cabcc4
patch link:    https://lore.kernel.org/r/20250110042449.1158789-3-quic_sarishar%40quicinc.com
patch subject: [PATCH RFC 2/7] wifi: cfg80211: reorg sinfo structure elements for MLO
config: nios2-randconfig-002-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111530.X3vZY0os-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111530.X3vZY0os-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111530.X3vZY0os-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:16,
                    from include/net/mac80211.h:17,
                    from drivers/net/wireless/ath/ath11k/mac.c:7:
   drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_put_chain_rssi':
>> drivers/net/wireless/ath/ath11k/mac.c:8920:41: error: 'struct station_info' has no member named 'chain_signal'
    8920 |         for (i = 0; i < ARRAY_SIZE(sinfo->chain_signal); i++) {
         |                                         ^~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
>> drivers/net/wireless/ath/ath11k/mac.c:8920:41: error: 'struct station_info' has no member named 'chain_signal'
    8920 |         for (i = 0; i < ARRAY_SIZE(sinfo->chain_signal); i++) {
         |                                         ^~
   include/linux/array_size.h:11:48: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                ^~~
   In file included from include/asm-generic/bug.h:5,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/net/mac80211.h:16:
>> drivers/net/wireless/ath/ath11k/mac.c:8920:41: error: 'struct station_info' has no member named 'chain_signal'
    8920 |         for (i = 0; i < ARRAY_SIZE(sinfo->chain_signal); i++) {
         |                                         ^~
   include/linux/compiler.h:260:79: note: in definition of macro '__BUILD_BUG_ON_ZERO_MSG'
     260 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                               ^
   include/linux/compiler.h:264:57: note: in expansion of macro '__same_type'
     264 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                                         ^~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:8920:25: note: in expansion of macro 'ARRAY_SIZE'
    8920 |         for (i = 0; i < ARRAY_SIZE(sinfo->chain_signal); i++) {
         |                         ^~~~~~~~~~
>> drivers/net/wireless/ath/ath11k/mac.c:8920:41: error: 'struct station_info' has no member named 'chain_signal'
    8920 |         for (i = 0; i < ARRAY_SIZE(sinfo->chain_signal); i++) {
         |                                         ^~
   include/linux/compiler.h:260:79: note: in definition of macro '__BUILD_BUG_ON_ZERO_MSG'
     260 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                               ^
   include/linux/compiler.h:264:57: note: in expansion of macro '__same_type'
     264 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                                         ^~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:8920:25: note: in expansion of macro 'ARRAY_SIZE'
    8920 |         for (i = 0; i < ARRAY_SIZE(sinfo->chain_signal); i++) {
         |                         ^~~~~~~~~~
   include/linux/compiler.h:260:77: error: expression in static assertion is not an integer
     260 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:264:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     264 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:8920:25: note: in expansion of macro 'ARRAY_SIZE'
    8920 |         for (i = 0; i < ARRAY_SIZE(sinfo->chain_signal); i++) {
         |                         ^~~~~~~~~~
>> drivers/net/wireless/ath/ath11k/mac.c:8921:22: error: 'struct station_info' has no member named 'chains'
    8921 |                 sinfo->chains &= ~BIT(i);
         |                      ^~
   drivers/net/wireless/ath/ath11k/mac.c:8933:30: error: 'struct station_info' has no member named 'chain_signal'
    8933 |                         sinfo->chain_signal[i] = rssi;
         |                              ^~
   drivers/net/wireless/ath/ath11k/mac.c:8934:30: error: 'struct station_info' has no member named 'chains'
    8934 |                         sinfo->chains |= BIT(i);
         |                              ^~
   drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_op_sta_statistics':
>> drivers/net/wireless/ath/ath11k/mac.c:8951:14: error: 'struct station_info' has no member named 'rx_duration'
    8951 |         sinfo->rx_duration = arsta->rx_duration;
         |              ^~
>> drivers/net/wireless/ath/ath11k/mac.c:8954:14: error: 'struct station_info' has no member named 'tx_duration'
    8954 |         sinfo->tx_duration = arsta->tx_duration;
         |              ^~
   drivers/net/wireless/ath/ath11k/mac.c:8959:30: error: 'struct station_info' has no member named 'txrate'
    8959 |                         sinfo->txrate.legacy = arsta->txrate.legacy;
         |                              ^~
   drivers/net/wireless/ath/ath11k/mac.c:8961:30: error: 'struct station_info' has no member named 'txrate'
    8961 |                         sinfo->txrate.mcs = arsta->txrate.mcs;
         |                              ^~
   drivers/net/wireless/ath/ath11k/mac.c:8962:30: error: 'struct station_info' has no member named 'txrate'
    8962 |                         sinfo->txrate.nss = arsta->txrate.nss;
         |                              ^~
   drivers/net/wireless/ath/ath11k/mac.c:8963:30: error: 'struct station_info' has no member named 'txrate'
    8963 |                         sinfo->txrate.bw = arsta->txrate.bw;
         |                              ^~
   drivers/net/wireless/ath/ath11k/mac.c:8964:30: error: 'struct station_info' has no member named 'txrate'
    8964 |                         sinfo->txrate.he_gi = arsta->txrate.he_gi;
         |                              ^~
   drivers/net/wireless/ath/ath11k/mac.c:8965:30: error: 'struct station_info' has no member named 'txrate'
    8965 |                         sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
         |                              ^~
   drivers/net/wireless/ath/ath11k/mac.c:8966:30: error: 'struct station_info' has no member named 'txrate'
    8966 |                         sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
         |                              ^~
   drivers/net/wireless/ath/ath11k/mac.c:8968:22: error: 'struct station_info' has no member named 'txrate'
    8968 |                 sinfo->txrate.flags = arsta->txrate.flags;
         |                      ^~
   drivers/net/wireless/ath/ath11k/mac.c:8995:22: error: 'struct station_info' has no member named 'signal'
    8995 |                 sinfo->signal = db2dbm ? signal : signal + ATH11K_DEFAULT_NOISE_FLOOR;
         |                      ^~
>> drivers/net/wireless/ath/ath11k/mac.c:8999:14: error: 'struct station_info' has no member named 'signal_avg'
    8999 |         sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi);
         |              ^~
   drivers/net/wireless/ath/ath11k/mac.c:9002:22: error: 'struct station_info' has no member named 'signal_avg'
    9002 |                 sinfo->signal_avg += ATH11K_DEFAULT_NOISE_FLOOR;
         |                      ^~
   drivers/net/wireless/ath/ath11k/mac.c: At top level:
>> drivers/net/wireless/ath/ath11k/mac.c:9727:10: error: 'const struct ieee80211_ops' has no member named 'sta_statistics'; did you mean 'link_sta_statistics'?
    9727 |         .sta_statistics                 = ath11k_mac_op_sta_statistics,
         |          ^~~~~~~~~~~~~~
         |          link_sta_statistics
>> drivers/net/wireless/ath/ath11k/mac.c:9727:43: error: initialization of 'void (*)(struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_sta *)' from incompatible pointer type 'void (*)(struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_sta *, struct station_info *)' [-Wincompatible-pointer-types]
    9727 |         .sta_statistics                 = ath11k_mac_op_sta_statistics,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:9727:43: note: (near initialization for 'ath11k_ops.flush_sta')


vim +8920 drivers/net/wireless/ath/ath11k/mac.c

d5c65159f28953 Kalle Valo               2019-11-23  8910  
b488c766442f7d Wen Gong                 2021-12-17  8911  static void ath11k_mac_put_chain_rssi(struct station_info *sinfo,
b488c766442f7d Wen Gong                 2021-12-17  8912  				      struct ath11k_sta *arsta,
b488c766442f7d Wen Gong                 2021-12-17  8913  				      char *pre,
b488c766442f7d Wen Gong                 2021-12-17  8914  				      bool clear)
b488c766442f7d Wen Gong                 2021-12-17  8915  {
b488c766442f7d Wen Gong                 2021-12-17  8916  	struct ath11k *ar = arsta->arvif->ar;
b488c766442f7d Wen Gong                 2021-12-17  8917  	int i;
b488c766442f7d Wen Gong                 2021-12-17  8918  	s8 rssi;
b488c766442f7d Wen Gong                 2021-12-17  8919  
b488c766442f7d Wen Gong                 2021-12-17 @8920  	for (i = 0; i < ARRAY_SIZE(sinfo->chain_signal); i++) {
b488c766442f7d Wen Gong                 2021-12-17 @8921  		sinfo->chains &= ~BIT(i);
b488c766442f7d Wen Gong                 2021-12-17  8922  		rssi = arsta->chain_signal[i];
b488c766442f7d Wen Gong                 2021-12-17  8923  		if (clear)
b488c766442f7d Wen Gong                 2021-12-17  8924  			arsta->chain_signal[i] = ATH11K_INVALID_RSSI_FULL;
b488c766442f7d Wen Gong                 2021-12-17  8925  
b488c766442f7d Wen Gong                 2021-12-17  8926  		ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
fc3b984a7d99bc Kalle Valo               2023-06-09  8927  			   "sta statistics %s rssi[%d] %d\n", pre, i, rssi);
b488c766442f7d Wen Gong                 2021-12-17  8928  
b488c766442f7d Wen Gong                 2021-12-17  8929  		if (rssi != ATH11K_DEFAULT_NOISE_FLOOR &&
b488c766442f7d Wen Gong                 2021-12-17  8930  		    rssi != ATH11K_INVALID_RSSI_FULL &&
b488c766442f7d Wen Gong                 2021-12-17  8931  		    rssi != ATH11K_INVALID_RSSI_EMPTY &&
b488c766442f7d Wen Gong                 2021-12-17  8932  		    rssi != 0) {
b488c766442f7d Wen Gong                 2021-12-17  8933  			sinfo->chain_signal[i] = rssi;
b488c766442f7d Wen Gong                 2021-12-17  8934  			sinfo->chains |= BIT(i);
b488c766442f7d Wen Gong                 2021-12-17  8935  			sinfo->filled |= BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL);
b488c766442f7d Wen Gong                 2021-12-17  8936  		}
b488c766442f7d Wen Gong                 2021-12-17  8937  	}
b488c766442f7d Wen Gong                 2021-12-17  8938  }
b488c766442f7d Wen Gong                 2021-12-17  8939  
d5c65159f28953 Kalle Valo               2019-11-23  8940  static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
d5c65159f28953 Kalle Valo               2019-11-23  8941  					 struct ieee80211_vif *vif,
d5c65159f28953 Kalle Valo               2019-11-23  8942  					 struct ieee80211_sta *sta,
d5c65159f28953 Kalle Valo               2019-11-23  8943  					 struct station_info *sinfo)
d5c65159f28953 Kalle Valo               2019-11-23  8944  {
10c65f97b424fc Jeff Johnson             2023-10-09  8945  	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
b488c766442f7d Wen Gong                 2021-12-17  8946  	struct ath11k *ar = arsta->arvif->ar;
c3b39553fc7712 Wen Gong                 2021-12-17  8947  	s8 signal;
c3b39553fc7712 Wen Gong                 2021-12-17  8948  	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
c3b39553fc7712 Wen Gong                 2021-12-17  8949  			       ar->ab->wmi_ab.svc_map);
d5c65159f28953 Kalle Valo               2019-11-23  8950  
d5c65159f28953 Kalle Valo               2019-11-23 @8951  	sinfo->rx_duration = arsta->rx_duration;
d5c65159f28953 Kalle Valo               2019-11-23  8952  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_DURATION);
d5c65159f28953 Kalle Valo               2019-11-23  8953  
a9e945eadf1759 Venkateswara Naralasetty 2019-11-28 @8954  	sinfo->tx_duration = arsta->tx_duration;
a9e945eadf1759 Venkateswara Naralasetty 2019-11-28  8955  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
a9e945eadf1759 Venkateswara Naralasetty 2019-11-28  8956  
1d795645e1eef9 Wen Gong                 2021-10-11  8957  	if (arsta->txrate.legacy || arsta->txrate.nss) {
d5c65159f28953 Kalle Valo               2019-11-23  8958  		if (arsta->txrate.legacy) {
d5c65159f28953 Kalle Valo               2019-11-23  8959  			sinfo->txrate.legacy = arsta->txrate.legacy;
d5c65159f28953 Kalle Valo               2019-11-23  8960  		} else {
d5c65159f28953 Kalle Valo               2019-11-23  8961  			sinfo->txrate.mcs = arsta->txrate.mcs;
d5c65159f28953 Kalle Valo               2019-11-23  8962  			sinfo->txrate.nss = arsta->txrate.nss;
d5c65159f28953 Kalle Valo               2019-11-23  8963  			sinfo->txrate.bw = arsta->txrate.bw;
d5c65159f28953 Kalle Valo               2019-11-23  8964  			sinfo->txrate.he_gi = arsta->txrate.he_gi;
d5c65159f28953 Kalle Valo               2019-11-23  8965  			sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
d5c65159f28953 Kalle Valo               2019-11-23  8966  			sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
d5c65159f28953 Kalle Valo               2019-11-23  8967  		}
d5c65159f28953 Kalle Valo               2019-11-23  8968  		sinfo->txrate.flags = arsta->txrate.flags;
d5c65159f28953 Kalle Valo               2019-11-23  8969  		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
1d795645e1eef9 Wen Gong                 2021-10-11  8970  	}
d5c65159f28953 Kalle Valo               2019-11-23  8971  
b488c766442f7d Wen Gong                 2021-12-17  8972  	ath11k_mac_put_chain_rssi(sinfo, arsta, "ppdu", false);
b488c766442f7d Wen Gong                 2021-12-17  8973  
b488c766442f7d Wen Gong                 2021-12-17  8974  	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL)) &&
b488c766442f7d Wen Gong                 2021-12-17  8975  	    arsta->arvif->vdev_type == WMI_VDEV_TYPE_STA &&
b488c766442f7d Wen Gong                 2021-12-17  8976  	    ar->ab->hw_params.supports_rssi_stats &&
b488c766442f7d Wen Gong                 2021-12-17  8977  	    !ath11k_debugfs_get_fw_stats(ar, ar->pdev->pdev_id, 0,
b488c766442f7d Wen Gong                 2021-12-17  8978  					 WMI_REQUEST_RSSI_PER_CHAIN_STAT)) {
b488c766442f7d Wen Gong                 2021-12-17  8979  		ath11k_mac_put_chain_rssi(sinfo, arsta, "fw stats", true);
b488c766442f7d Wen Gong                 2021-12-17  8980  	}
b488c766442f7d Wen Gong                 2021-12-17  8981  
c3b39553fc7712 Wen Gong                 2021-12-17  8982  	signal = arsta->rssi_comb;
c3b39553fc7712 Wen Gong                 2021-12-17  8983  	if (!signal &&
c3b39553fc7712 Wen Gong                 2021-12-17  8984  	    arsta->arvif->vdev_type == WMI_VDEV_TYPE_STA &&
c3b39553fc7712 Wen Gong                 2021-12-17  8985  	    ar->ab->hw_params.supports_rssi_stats &&
c3b39553fc7712 Wen Gong                 2021-12-17  8986  	    !(ath11k_debugfs_get_fw_stats(ar, ar->pdev->pdev_id, 0,
c3b39553fc7712 Wen Gong                 2021-12-17  8987  					WMI_REQUEST_VDEV_STAT)))
c3b39553fc7712 Wen Gong                 2021-12-17  8988  		signal = arsta->rssi_beacon;
c3b39553fc7712 Wen Gong                 2021-12-17  8989  
c3b39553fc7712 Wen Gong                 2021-12-17  8990  	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
fc3b984a7d99bc Kalle Valo               2023-06-09  8991  		   "sta statistics db2dbm %u rssi comb %d rssi beacon %d\n",
c3b39553fc7712 Wen Gong                 2021-12-17  8992  		   db2dbm, arsta->rssi_comb, arsta->rssi_beacon);
c3b39553fc7712 Wen Gong                 2021-12-17  8993  
c3b39553fc7712 Wen Gong                 2021-12-17  8994  	if (signal) {
c3b39553fc7712 Wen Gong                 2021-12-17  8995  		sinfo->signal = db2dbm ? signal : signal + ATH11K_DEFAULT_NOISE_FLOOR;
f277eb0500b4ee Sriram R                 2021-02-24  8996  		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
d5c65159f28953 Kalle Valo               2019-11-23  8997  	}
b205ce4c266cd6 Thiraviyam Mariyappan    2022-05-19  8998  
aadeee47e9d7ae Lingbo Kong              2024-03-09 @8999  	sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi);
aadeee47e9d7ae Lingbo Kong              2024-03-09  9000  
aadeee47e9d7ae Lingbo Kong              2024-03-09  9001  	if (!db2dbm)
aadeee47e9d7ae Lingbo Kong              2024-03-09  9002  		sinfo->signal_avg += ATH11K_DEFAULT_NOISE_FLOOR;
aadeee47e9d7ae Lingbo Kong              2024-03-09  9003  
b205ce4c266cd6 Thiraviyam Mariyappan    2022-05-19  9004  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
c3b39553fc7712 Wen Gong                 2021-12-17  9005  }
d5c65159f28953 Kalle Valo               2019-11-23  9006  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
