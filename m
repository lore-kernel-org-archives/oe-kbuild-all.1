Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D2833DB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747910918; cv=none; b=Kez0TpVGbuAtgnoeE6KELW6c7+fqCPpVxUxWkxm64PSdqrwvVWW3eIQHpB1DOKYDNp3zDuvWWr89KMFwmTjoN/ZKY2Sp1bimgTF5O9hqdYaiF8DTUBawRDdhLi4BWIpzMuU9LfxuDwiNcY3PagdNk61tZvVix0ivKz03tq3J4Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747910918; c=relaxed/simple;
	bh=0yXUsKrzWEibhc+pUhSCbla5Rx5FlNouz7UZFslJWu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nkdL24xEFrdpVpm4E9fYmDqVVgoMhxQ/mX9MjL9FzS/LCMKNijSpe7lY8QNixkGRSvLHKzea0NoWOT7U9GWFQm1I+cg5LIBOlmTLtzcvbHFUlaggce6146BEJinnOBhUbIJkW4khK+d24jhj6NXnOZTmsZWfL2PRUrOcwEnx3do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XX6v+oJR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XX6v+oJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747910916; x=1779446916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0yXUsKrzWEibhc+pUhSCbla5Rx5FlNouz7UZFslJWu8=;
  b=XX6v+oJRh2rjM8OOFwUV1rKQRF8/b++QsdWLEGCVEMFXwXxMyj+6+X0k
   oMzIXDT7Zvezv25yhJd+qSTwX+Nb2ZQRhtoh/5c4zenH0tO/JsVESXeKj
   FksL+tW2492mfTC2fX4gaDv0knuazT5RfZimuZVGolcLwqH9OncVP7HYl
   2jORYJkIO2dKG7cb4KIwvmZG8cPUkgnHRpCYA5zLGLczAT5Zj/mHhHM0p
   7pEDlqULyBuZZB71yrfBWbXGplv4fVI46i71sX4zFOHj599DZyidWb0+4
   Qtfonj33hvbeI9zgZ6v/R2MKbDhx+SZfoAuciejjj5Vyud9A+fvXeSdWP
   w==;
X-CSE-ConnectionGUID: nb1bhTMDRQGS3C2e00S+KA==
X-CSE-MsgGUID: nKsGwjKtTvqtzF5DLdAQZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="52555359"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="52555359"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 03:48:35 -0700
X-CSE-ConnectionGUID: tBMTEcf+RSic5EMcG+HJXA==
X-CSE-MsgGUID: n3qB2yFiR8mvEfkLX0MBxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140945323"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 May 2025 03:48:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI3TU-000PF0-0u;
	Thu, 22 May 2025 10:48:32 +0000
Date: Thu, 22 May 2025 18:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Subject: [nbd168-wireless:mt76 31/48]
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:2833:13: warning: variable
 'short_ssid' set but not used
Message-ID: <202505221839.lRN4dBa3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   b665d83ef9cc46f4ac9d9dd1dbc60d5bf36ce985
commit: af00bc957adcb10c82806e3cf35d0fdb977ce0db [31/48] wifi: mt76: mt7925: add RNR scan support for 6GHz
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250522/202505221839.lRN4dBa3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221839.lRN4dBa3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221839.lRN4dBa3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7925/mcu.c: In function 'mt7925_mcu_hw_scan':
>> drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:2833:13: warning: variable 'short_ssid' set but not used [-Wunused-but-set-variable]
    2833 |         u32 short_ssid[MT7925_RNR_SCAN_MAX_BSSIDS] = {};
         |             ^~~~~~~~~~


vim +/short_ssid +2833 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c

  2822	
  2823	int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
  2824			       struct ieee80211_scan_request *scan_req)
  2825	{
  2826		struct mt76_vif_link *mvif = (struct mt76_vif_link *)vif->drv_priv;
  2827		struct cfg80211_scan_request *sreq = &scan_req->req;
  2828		int n_ssids = 0, err, i;
  2829		struct ieee80211_channel **scan_list = sreq->channels;
  2830		struct mt76_dev *mdev = phy->dev;
  2831		struct mt76_connac_mcu_scan_channel *chan;
  2832		struct sk_buff *skb;
> 2833		u32 short_ssid[MT7925_RNR_SCAN_MAX_BSSIDS] = {};
  2834	
  2835		struct scan_hdr_tlv *hdr;
  2836		struct scan_req_tlv *req;
  2837		struct scan_ssid_tlv *ssid;
  2838		struct scan_bssid_tlv *bssid;
  2839		struct scan_chan_info_tlv *chan_info;
  2840		struct scan_ie_tlv *ie;
  2841		struct scan_misc_tlv *misc;
  2842		struct tlv *tlv;
  2843		int max_len;
  2844	
  2845		max_len = sizeof(*hdr) + sizeof(*req) + sizeof(*ssid) +
  2846			  sizeof(*bssid) * MT7925_RNR_SCAN_MAX_BSSIDS +
  2847			  sizeof(*chan_info) + sizeof(*misc) + sizeof(*ie);
  2848	
  2849		skb = mt76_mcu_msg_alloc(mdev, NULL, max_len);
  2850		if (!skb)
  2851			return -ENOMEM;
  2852	
  2853		set_bit(MT76_HW_SCANNING, &phy->state);
  2854		mvif->scan_seq_num = (mvif->scan_seq_num + 1) & 0x7f;
  2855	
  2856		hdr = (struct scan_hdr_tlv *)skb_put(skb, sizeof(*hdr));
  2857		hdr->seq_num = mvif->scan_seq_num | mvif->band_idx << 7;
  2858		hdr->bss_idx = mvif->idx;
  2859	
  2860		tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_REQ, sizeof(*req));
  2861		req = (struct scan_req_tlv *)tlv;
  2862		req->scan_type = sreq->n_ssids ? 1 : 0;
  2863		req->probe_req_num = sreq->n_ssids ? 2 : 0;
  2864	
  2865		tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_SSID, sizeof(*ssid));
  2866		ssid = (struct scan_ssid_tlv *)tlv;
  2867		for (i = 0; i < sreq->n_ssids; i++) {
  2868			if (!sreq->ssids[i].ssid_len)
  2869				continue;
  2870			if (i > MT7925_RNR_SCAN_MAX_BSSIDS)
  2871				break;
  2872	
  2873			short_ssid[i] = ~crc32_le(~0, sreq->ssids[i].ssid,
  2874						  sreq->ssids[i].ssid_len);
  2875			ssid->ssids[i].ssid_len = cpu_to_le32(sreq->ssids[i].ssid_len);
  2876			memcpy(ssid->ssids[i].ssid, sreq->ssids[i].ssid,
  2877			       sreq->ssids[i].ssid_len);
  2878			n_ssids++;
  2879		}
  2880		ssid->ssid_type = n_ssids ? BIT(2) : BIT(0);
  2881		ssid->ssids_num = n_ssids;
  2882	
  2883		if (sreq->n_6ghz_params) {
  2884			u8 j;
  2885	
  2886			mt76_connac_mcu_build_rnr_scan_param(mdev, sreq);
  2887	
  2888			for (j = 0; j < mdev->rnr.bssid_num; j++) {
  2889				if (j > MT7925_RNR_SCAN_MAX_BSSIDS)
  2890					break;
  2891	
  2892				tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_BSSID,
  2893							      sizeof(*bssid));
  2894				bssid = (struct scan_bssid_tlv *)tlv;
  2895	
  2896				ether_addr_copy(bssid->bssid, mdev->rnr.bssid[j]);
  2897				bssid->match_ch = mdev->rnr.channel[j];
  2898				bssid->match_ssid_ind = MT7925_RNR_SCAN_MAX_BSSIDS;
  2899				bssid->match_short_ssid_ind = MT7925_RNR_SCAN_MAX_BSSIDS;
  2900			}
  2901			req->scan_func |= SCAN_FUNC_RNR_SCAN;
  2902		} else {
  2903			tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_BSSID, sizeof(*bssid));
  2904			bssid = (struct scan_bssid_tlv *)tlv;
  2905	
  2906			ether_addr_copy(bssid->bssid, sreq->bssid);
  2907		}
  2908	
  2909		tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_CHANNEL, sizeof(*chan_info));
  2910		chan_info = (struct scan_chan_info_tlv *)tlv;
  2911		chan_info->channels_num = min_t(u8, sreq->n_channels,
  2912						ARRAY_SIZE(chan_info->channels));
  2913		for (i = 0; i < chan_info->channels_num; i++) {
  2914			chan = &chan_info->channels[i];
  2915	
  2916			switch (scan_list[i]->band) {
  2917			case NL80211_BAND_2GHZ:
  2918				chan->band = 1;
  2919				break;
  2920			case NL80211_BAND_6GHZ:
  2921				chan->band = 3;
  2922				break;
  2923			default:
  2924				chan->band = 2;
  2925				break;
  2926			}
  2927			chan->channel_num = scan_list[i]->hw_value;
  2928		}
  2929		chan_info->channel_type = sreq->n_channels ? 4 : 0;
  2930	
  2931		tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_IE, sizeof(*ie));
  2932		ie = (struct scan_ie_tlv *)tlv;
  2933		if (sreq->ie_len > 0) {
  2934			memcpy(ie->ies, sreq->ie, sreq->ie_len);
  2935			ie->ies_len = cpu_to_le16(sreq->ie_len);
  2936		}
  2937	
  2938		req->scan_func |= SCAN_FUNC_SPLIT_SCAN;
  2939	
  2940		tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_MISC, sizeof(*misc));
  2941		misc = (struct scan_misc_tlv *)tlv;
  2942		if (sreq->flags & NL80211_SCAN_FLAG_RANDOM_ADDR) {
  2943			get_random_mask_addr(misc->random_mac, sreq->mac_addr,
  2944					     sreq->mac_addr_mask);
  2945			req->scan_func |= SCAN_FUNC_RANDOM_MAC;
  2946		}
  2947	
  2948		err = mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(SCAN_REQ),
  2949					    false);
  2950		if (err < 0)
  2951			clear_bit(MT76_HW_SCANNING, &phy->state);
  2952	
  2953		return err;
  2954	}
  2955	EXPORT_SYMBOL_GPL(mt7925_mcu_hw_scan);
  2956	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
