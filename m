Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE692D9492
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771617152; cv=none; b=alWlv+say2SmLV48Qii3vl+bjzsJ340q+oNH+Vvz+nPe8ZrGB9uPGpqpPWXfyxcT8er5eFFmv7erxCgRuHcHHfnr2wfCrE1ZBtEiglxqNwL7mo23p7+0PBqhtUu94HQhho1GNQKPR/Py6jPtwyAyg1zONuF34S5u7SYoG4VmUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771617152; c=relaxed/simple;
	bh=qrTrMtNCcttwHLBKM7We2XkFQLtHFbHNn6wyMKTu3Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUDHfRqP7Lb+pFcoJOjKmFfjwC9VjUkXI5XwAjxIe5NBb3PWIBebor0r1UCnPn9rISavge8qitdAp+qN7KJxoOlTqYiLIr6cBMT9KJyc02Id/cO2d9a8eCV+mLxkZfm/dJeX8EfM3aV+u0F8iEIeKKnGKpgOkv8T2oxQTcXSS2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5jgPj8P; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5jgPj8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771617150; x=1803153150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qrTrMtNCcttwHLBKM7We2XkFQLtHFbHNn6wyMKTu3Fc=;
  b=h5jgPj8PLygDzbiIlcmLIL1KTNMek/5VweeSQFJJDfa3escnQrTAN1is
   XXhQn84RZGvSWZz+cRatnO3rU7BFCUlErsaz2h0xq11OexlgC9iddrOJw
   AnHq9+Vp4alCx0hbMBIcEOZOaJiJFA/FYkZiRvdYwoKUi6o/tQ0VMT9lB
   SgygCEgYKPrUkobGDfBynrsQiw1/OeSti1jkwBkclHvKrRW6qrbvP1A4u
   vEOhelpsGjKEt2vyPvSDgHAxx6JxkXBLfYGvfaqYq0+ikmUTJJq0GUX6v
   UmCAul9qh46mpYIEBfEUi1Wqp9ltdG316t1wp7EQVbyGh+S3CQIim9pRp
   w==;
X-CSE-ConnectionGUID: 8gqfxMF0T6WnHpXE8v2dBQ==
X-CSE-MsgGUID: gjKzqSOVTVe1/qzg9B5+aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72758280"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72758280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 11:52:30 -0800
X-CSE-ConnectionGUID: lX6ZbisaSpuGaeFbyLrA3g==
X-CSE-MsgGUID: vyjJ3v4+Qm2Vb1m8Y+f2fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219450349"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Feb 2026 11:52:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtWY6-000000014Ri-2NT0;
	Fri, 20 Feb 2026 19:52:26 +0000
Date: Sat, 21 Feb 2026 03:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/8] wifi: mac80211: change public RX API to use link
 stations
Message-ID: <202602210342.RNgpn28N-lkp@intel.com>
References: <20260220151929.61ef722ac889.I4a2d45609e94b52654b10ec572e59a45d09c41f4@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220151929.61ef722ac889.I4a2d45609e94b52654b10ec572e59a45d09c41f4@changeid>

Hi Benjamin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.19 next-20260220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Berg/wifi-iwlwifi-use-link_sta-internally-to-the-driver/20260220-222422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260220151929.61ef722ac889.I4a2d45609e94b52654b10ec572e59a45d09c41f4%40changeid
patch subject: [RFC PATCH 2/8] wifi: mac80211: change public RX API to use link stations
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260221/202602210342.RNgpn28N-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210342.RNgpn28N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210342.RNgpn28N-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath11k/dp_rx.c: In function 'ath11k_dp_rx_deliver_msdu':
>> drivers/net/wireless/ath/ath11k/dp_rx.c:2503:35: error: passing argument 2 of 'ieee80211_rx_napi' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2503 |         ieee80211_rx_napi(ar->hw, pubsta, msdu, napi);
         |                                   ^~~~~~
         |                                   |
         |                                   struct ieee80211_sta *
   In file included from drivers/net/wireless/ath/ath11k/wmi.h:10,
                    from drivers/net/wireless/ath/ath11k/core.h:24,
                    from drivers/net/wireless/ath/ath11k/dp_rx.c:11:
   include/net/mac80211.h:5250:51: note: expected 'struct ieee80211_link_sta *' but argument is of type 'struct ieee80211_sta *'
    5250 |                        struct ieee80211_link_sta *link_sta,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/net/wireless/mediatek/mt76/mac80211.c: In function 'mt76_rx_complete':
>> drivers/net/wireless/mediatek/mt76/mac80211.c:1522:39: error: passing argument 2 of 'ieee80211_rx_list' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1522 |                 ieee80211_rx_list(hw, sta, skb, &list);
         |                                       ^~~
         |                                       |
         |                                       struct ieee80211_sta *
   In file included from drivers/net/wireless/mediatek/mt76/mt76.h:18,
                    from drivers/net/wireless/mediatek/mt76/mac80211.c:7:
   include/net/mac80211.h:5221:51: note: expected 'struct ieee80211_link_sta *' but argument is of type 'struct ieee80211_sta *'
    5221 |                        struct ieee80211_link_sta *link_sta,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/net/wireless/mediatek/mt76/mac80211.c:1531:47: error: passing argument 2 of 'ieee80211_rx_list' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1531 |                         ieee80211_rx_list(hw, sta, skb, &list);
         |                                               ^~~
         |                                               |
         |                                               struct ieee80211_sta *
   In file included from drivers/net/wireless/mediatek/mt76/mt76.h:18,
                    from drivers/net/wireless/mediatek/mt76/mac80211.c:7:
   include/net/mac80211.h:5221:51: note: expected 'struct ieee80211_link_sta *' but argument is of type 'struct ieee80211_sta *'
    5221 |                        struct ieee80211_link_sta *link_sta,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors


vim +/ieee80211_rx_napi +2503 drivers/net/wireless/ath/ath11k/dp_rx.c

d5c65159f289537 Kalle Valo               2019-11-23  2426  
d5c65159f289537 Kalle Valo               2019-11-23  2427  static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *napi,
2167fa606c0f0e6 Sriram R                 2021-09-28  2428  				      struct sk_buff *msdu,
2167fa606c0f0e6 Sriram R                 2021-09-28  2429  				      struct ieee80211_rx_status *status)
d5c65159f289537 Kalle Valo               2019-11-23  2430  {
e4eb7b5c335ccfd John Crispin             2019-11-25  2431  	static const struct ieee80211_radiotap_he known = {
93634c61056e345 John Crispin             2019-12-17  2432  		.data1 = cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA1_DATA_MCS_KNOWN |
93634c61056e345 John Crispin             2019-12-17  2433  				     IEEE80211_RADIOTAP_HE_DATA1_BW_RU_ALLOC_KNOWN),
e4eb7b5c335ccfd John Crispin             2019-11-25  2434  		.data2 = cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA2_GI_KNOWN),
e4eb7b5c335ccfd John Crispin             2019-11-25  2435  	};
2167fa606c0f0e6 Sriram R                 2021-09-28  2436  	struct ieee80211_rx_status *rx_status;
e4eb7b5c335ccfd John Crispin             2019-11-25  2437  	struct ieee80211_radiotap_he *he = NULL;
2167fa606c0f0e6 Sriram R                 2021-09-28  2438  	struct ieee80211_sta *pubsta = NULL;
2167fa606c0f0e6 Sriram R                 2021-09-28  2439  	struct ath11k_peer *peer;
2167fa606c0f0e6 Sriram R                 2021-09-28  2440  	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
2167fa606c0f0e6 Sriram R                 2021-09-28  2441  	u8 decap = DP_RX_DECAP_TYPE_RAW;
2167fa606c0f0e6 Sriram R                 2021-09-28  2442  	bool is_mcbc = rxcb->is_mcbc;
2167fa606c0f0e6 Sriram R                 2021-09-28  2443  	bool is_eapol = rxcb->is_eapol;
d5c65159f289537 Kalle Valo               2019-11-23  2444  
2167fa606c0f0e6 Sriram R                 2021-09-28  2445  	if (status->encoding == RX_ENC_HE &&
2167fa606c0f0e6 Sriram R                 2021-09-28  2446  	    !(status->flag & RX_FLAG_RADIOTAP_HE) &&
2167fa606c0f0e6 Sriram R                 2021-09-28  2447  	    !(status->flag & RX_FLAG_SKIP_MONITOR)) {
e4eb7b5c335ccfd John Crispin             2019-11-25  2448  		he = skb_push(msdu, sizeof(known));
e4eb7b5c335ccfd John Crispin             2019-11-25  2449  		memcpy(he, &known, sizeof(known));
e4eb7b5c335ccfd John Crispin             2019-11-25  2450  		status->flag |= RX_FLAG_RADIOTAP_HE;
e4eb7b5c335ccfd John Crispin             2019-11-25  2451  	}
d5c65159f289537 Kalle Valo               2019-11-23  2452  
2167fa606c0f0e6 Sriram R                 2021-09-28  2453  	if (!(status->flag & RX_FLAG_ONLY_MONITOR))
2167fa606c0f0e6 Sriram R                 2021-09-28  2454  		decap = ath11k_dp_rx_h_msdu_start_decap_type(ar->ab, rxcb->rx_desc);
2167fa606c0f0e6 Sriram R                 2021-09-28  2455  
2167fa606c0f0e6 Sriram R                 2021-09-28  2456  	spin_lock_bh(&ar->ab->base_lock);
2167fa606c0f0e6 Sriram R                 2021-09-28  2457  	peer = ath11k_dp_rx_h_find_peer(ar->ab, msdu);
2167fa606c0f0e6 Sriram R                 2021-09-28  2458  	if (peer && peer->sta)
2167fa606c0f0e6 Sriram R                 2021-09-28  2459  		pubsta = peer->sta;
2167fa606c0f0e6 Sriram R                 2021-09-28  2460  	spin_unlock_bh(&ar->ab->base_lock);
2167fa606c0f0e6 Sriram R                 2021-09-28  2461  
d5c65159f289537 Kalle Valo               2019-11-23  2462  	ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
cf036c416e9a0a8 Kalle Valo               2023-06-09  2463  		   "rx skb %p len %u peer %pM %d %s sn %u %s%s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
d5c65159f289537 Kalle Valo               2019-11-23  2464  		   msdu,
d5c65159f289537 Kalle Valo               2019-11-23  2465  		   msdu->len,
2167fa606c0f0e6 Sriram R                 2021-09-28  2466  		   peer ? peer->addr : NULL,
2167fa606c0f0e6 Sriram R                 2021-09-28  2467  		   rxcb->tid,
2167fa606c0f0e6 Sriram R                 2021-09-28  2468  		   is_mcbc ? "mcast" : "ucast",
2167fa606c0f0e6 Sriram R                 2021-09-28  2469  		   rxcb->seq_no,
d5c65159f289537 Kalle Valo               2019-11-23  2470  		   (status->encoding == RX_ENC_LEGACY) ? "legacy" : "",
d5c65159f289537 Kalle Valo               2019-11-23  2471  		   (status->encoding == RX_ENC_HT) ? "ht" : "",
d5c65159f289537 Kalle Valo               2019-11-23  2472  		   (status->encoding == RX_ENC_VHT) ? "vht" : "",
d5c65159f289537 Kalle Valo               2019-11-23  2473  		   (status->encoding == RX_ENC_HE) ? "he" : "",
d5c65159f289537 Kalle Valo               2019-11-23  2474  		   (status->bw == RATE_INFO_BW_40) ? "40" : "",
d5c65159f289537 Kalle Valo               2019-11-23  2475  		   (status->bw == RATE_INFO_BW_80) ? "80" : "",
d5c65159f289537 Kalle Valo               2019-11-23  2476  		   (status->bw == RATE_INFO_BW_160) ? "160" : "",
d5c65159f289537 Kalle Valo               2019-11-23  2477  		   status->enc_flags & RX_ENC_FLAG_SHORT_GI ? "sgi " : "",
d5c65159f289537 Kalle Valo               2019-11-23  2478  		   status->rate_idx,
d5c65159f289537 Kalle Valo               2019-11-23  2479  		   status->nss,
d5c65159f289537 Kalle Valo               2019-11-23  2480  		   status->freq,
d5c65159f289537 Kalle Valo               2019-11-23  2481  		   status->band, status->flag,
d5c65159f289537 Kalle Valo               2019-11-23  2482  		   !!(status->flag & RX_FLAG_FAILED_FCS_CRC),
d5c65159f289537 Kalle Valo               2019-11-23  2483  		   !!(status->flag & RX_FLAG_MMIC_ERROR),
d5c65159f289537 Kalle Valo               2019-11-23  2484  		   !!(status->flag & RX_FLAG_AMSDU_MORE));
d5c65159f289537 Kalle Valo               2019-11-23  2485  
aa2092a9bab3f87 Venkateswara Naralasetty 2020-09-08  2486  	ath11k_dbg_dump(ar->ab, ATH11K_DBG_DP_RX, NULL, "dp rx msdu: ",
aa2092a9bab3f87 Venkateswara Naralasetty 2020-09-08  2487  			msdu->data, msdu->len);
aa2092a9bab3f87 Venkateswara Naralasetty 2020-09-08  2488  
2167fa606c0f0e6 Sriram R                 2021-09-28  2489  	rx_status = IEEE80211_SKB_RXCB(msdu);
2167fa606c0f0e6 Sriram R                 2021-09-28  2490  	*rx_status = *status;
2167fa606c0f0e6 Sriram R                 2021-09-28  2491  
d5c65159f289537 Kalle Valo               2019-11-23  2492  	/* TODO: trace rx packet */
d5c65159f289537 Kalle Valo               2019-11-23  2493  
2167fa606c0f0e6 Sriram R                 2021-09-28  2494  	/* PN for multicast packets are not validate in HW,
2167fa606c0f0e6 Sriram R                 2021-09-28  2495  	 * so skip 802.3 rx path
3fecca0e7de885c Jeff Johnson             2022-09-09  2496  	 * Also, fast_rx expects the STA to be authorized, hence
2167fa606c0f0e6 Sriram R                 2021-09-28  2497  	 * eapol packets are sent in slow path.
2167fa606c0f0e6 Sriram R                 2021-09-28  2498  	 */
2167fa606c0f0e6 Sriram R                 2021-09-28  2499  	if (decap == DP_RX_DECAP_TYPE_ETHERNET2_DIX && !is_eapol &&
2167fa606c0f0e6 Sriram R                 2021-09-28  2500  	    !(is_mcbc && rx_status->flag & RX_FLAG_DECRYPTED))
2167fa606c0f0e6 Sriram R                 2021-09-28  2501  		rx_status->flag |= RX_FLAG_8023;
2167fa606c0f0e6 Sriram R                 2021-09-28  2502  
2167fa606c0f0e6 Sriram R                 2021-09-28 @2503  	ieee80211_rx_napi(ar->hw, pubsta, msdu, napi);
d5c65159f289537 Kalle Valo               2019-11-23  2504  }
d5c65159f289537 Kalle Valo               2019-11-23  2505  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
