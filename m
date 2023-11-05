Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161ABE4D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8rN4wLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699191059; x=1730727059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n0flhB/Lk3VyceGk1C1+On20jqysn+0LOT137OHMNVI=;
  b=S8rN4wLXvkorKBPur8DerBedplhkrkBsvan70mRALYlowX/CW/Gx6HUc
   rEoBLNFHhyJnr5ymIgn/YPl7NW+AvvIO3mRblCg19bM7cmldKDLzDMeJU
   qqndkZMkuS10AokbQjqOdnY+ek5ZA5RL6FyZhtRDN7e/5v1lYmqKitpJ/
   ArMOfAYgNZhJWXpDCXCgxWZbTFj49mSaOLFelTIsqxpxHVWkkpoRt/fwW
   U40ifBrTRuObx4DwrXy/4zek/tWalLExPSZmqwq9/B7cZT1bxFIjdR8Er
   4wlfc7pNX6Z83hj28ztBsp3ylL+tWJDZ3NmEDvxQJWfbuKCfjQ2WRGU4T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="368481771"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="368481771"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 05:30:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="3392006"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2023 05:30:57 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzdDK-0005TQ-2H;
	Sun, 05 Nov 2023 13:30:54 +0000
Date: Sun, 5 Nov 2023 21:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending 11/57] net/mac80211/rx.c:2484:24: sparse:
 sparse: incorrect type in return expression (different base types)
Message-ID: <202311052101.PAB5eQs2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git pending
head:   e2f720799600a42b4eeadca0081745be016b8816
commit: 2a0ee47cc38494d06dc4345fb06e1a8cb5c01bce [11/57] wifi: mac80211: drop robust action frames before assoc
config: i386-randconfig-063-20231010 (https://download.01.org/0day-ci/archive/20231105/202311052101.PAB5eQs2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311052101.PAB5eQs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311052101.PAB5eQs2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/mac80211/rx.c:2484:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted ieee80211_rx_result @@     got int @@
   net/mac80211/rx.c:2484:24: sparse:     expected restricted ieee80211_rx_result
   net/mac80211/rx.c:2484:24: sparse:     got int

vim +2484 net/mac80211/rx.c

  2407	
  2408	static ieee80211_rx_result
  2409	ieee80211_drop_unencrypted_mgmt(struct ieee80211_rx_data *rx)
  2410	{
  2411		struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(rx->skb);
  2412		struct ieee80211_mgmt *mgmt = (void *)rx->skb->data;
  2413		__le16 fc = mgmt->frame_control;
  2414	
  2415		/*
  2416		 * Pass through unencrypted frames if the hardware has
  2417		 * decrypted them already.
  2418		 */
  2419		if (status->flag & RX_FLAG_DECRYPTED)
  2420			return RX_CONTINUE;
  2421	
  2422		/* drop unicast protected dual (that wasn't protected) */
  2423		if (ieee80211_is_action(fc) &&
  2424		    mgmt->u.action.category == WLAN_CATEGORY_PROTECTED_DUAL_OF_ACTION)
  2425			return RX_DROP_U_UNPROT_DUAL;
  2426	
  2427		if (rx->sta && test_sta_flag(rx->sta, WLAN_STA_MFP)) {
  2428			if (unlikely(!ieee80211_has_protected(fc) &&
  2429				     ieee80211_is_unicast_robust_mgmt_frame(rx->skb))) {
  2430				if (ieee80211_is_deauth(fc) ||
  2431				    ieee80211_is_disassoc(fc)) {
  2432					/*
  2433					 * Permit unprotected deauth/disassoc frames
  2434					 * during 4-way-HS (key is installed after HS).
  2435					 */
  2436					if (!rx->key)
  2437						return RX_CONTINUE;
  2438	
  2439					cfg80211_rx_unprot_mlme_mgmt(rx->sdata->dev,
  2440								     rx->skb->data,
  2441								     rx->skb->len);
  2442				}
  2443				return RX_DROP_U_UNPROT_UCAST_MGMT;
  2444			}
  2445			/* BIP does not use Protected field, so need to check MMIE */
  2446			if (unlikely(ieee80211_is_multicast_robust_mgmt_frame(rx->skb) &&
  2447				     ieee80211_get_mmie_keyidx(rx->skb) < 0)) {
  2448				if (ieee80211_is_deauth(fc) ||
  2449				    ieee80211_is_disassoc(fc))
  2450					cfg80211_rx_unprot_mlme_mgmt(rx->sdata->dev,
  2451								     rx->skb->data,
  2452								     rx->skb->len);
  2453				return RX_DROP_U_UNPROT_MCAST_MGMT;
  2454			}
  2455			if (unlikely(ieee80211_is_beacon(fc) && rx->key &&
  2456				     ieee80211_get_mmie_keyidx(rx->skb) < 0)) {
  2457				cfg80211_rx_unprot_mlme_mgmt(rx->sdata->dev,
  2458							     rx->skb->data,
  2459							     rx->skb->len);
  2460				return RX_DROP_U_UNPROT_BEACON;
  2461			}
  2462			/*
  2463			 * When using MFP, Action frames are not allowed prior to
  2464			 * having configured keys.
  2465			 */
  2466			if (unlikely(ieee80211_is_action(fc) && !rx->key &&
  2467				     ieee80211_is_robust_mgmt_frame(rx->skb)))
  2468				return RX_DROP_U_UNPROT_ACTION;
  2469	
  2470			/* drop unicast public action frames when using MPF */
  2471			if (is_unicast_ether_addr(mgmt->da) &&
  2472			    ieee80211_is_public_action((void *)rx->skb->data,
  2473						       rx->skb->len))
  2474				return RX_DROP_U_UNPROT_UNICAST_PUB_ACTION;
  2475		}
  2476	
  2477		/*
  2478		 * Drop robust action frames before assoc regardless of MFP state,
  2479		 * after assoc we also have decided on MFP or not.
  2480		 */
  2481		if (ieee80211_is_action(fc) &&
  2482		    ieee80211_is_robust_mgmt_frame(rx->skb) &&
  2483		    (!rx->sta || !test_sta_flag(rx->sta, WLAN_STA_ASSOC)))
> 2484			return -EACCES;
  2485	
  2486		return RX_CONTINUE;
  2487	}
  2488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
