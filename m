Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8C9386C39
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 20:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785443892; cv=none; b=uIQbzQzomv7qD1vjZGQP7gwiRMYQunb0bai1FlM1XDipV4KJS/Ypd2Br5A/icEtVW1bobBx3TRAPBnYft3QOo7mbBwmAA3hbZYg1r6KIE8uApGaOjO0zy+/q6PM/51JLiOZAPDNNLflw5Ajbv2+GT1p5kXieoiJsPVRHlIQnr4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785443892; c=relaxed/simple;
	bh=dIpQfohI3LjDd0j2gKhEEC+nharMMOZdOlGVNCx/6/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PpZTNXtgPGJprQ9swy93rLYG7IAQihv6sbVMNk9yQU38lOjoKny3Qbq6+rr+J0gYAh7WBLkTZi6cEld3+6ABNe28YICTfwfoYaznznQZ9ov+FnLqdTM6WblD0r0a0RnpT3wwTTZFFxQRUtHm5gczzfBiBWdgkh7YrXjPvnFe1e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBWr1gCu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBWr1gCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785443890; x=1816979890;
  h=date:from:to:cc:subject:message-id;
  bh=dIpQfohI3LjDd0j2gKhEEC+nharMMOZdOlGVNCx/6/c=;
  b=dBWr1gCuvtLR7zhbS1J7RQ049ozG2icxFCHgWe6+iqOqBN9nxYfIWyEa
   w4IvnajSOr2XsxwHV3oa56yGhz4bB2MQLZUl5oMe8LGF1nobQG3ppEnOh
   fEmJvufuxmyGhD55GyAwWRhR8PZoygp/uDR/+V5g95r9pqbGbncEuBr4K
   cVSMqQnTsnOvmVE5n/tGkh5IPwpgczRlv1elUlVgF6B1uNsQljxkjCqwQ
   Vghh0nkvx6Jhc/AkDbrKZ8hZG1nywMexw/2hxhrW8QzDVLLmog3Q1NAP1
   pq1mxxAdIsMhGlHC/O0fUIPLxlddKl37/peAdPKzBA7y/zak39hchhO2P
   w==;
X-CSE-ConnectionGUID: 97YgjMITSDmuOCGbEOd9XQ==
X-CSE-MsgGUID: g/75e5c/SdWrbKx6Aiu7lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86151572"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86151572"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 13:38:06 -0700
X-CSE-ConnectionGUID: pG9mAeVtRqK4aKO6kQ99Rw==
X-CSE-MsgGUID: KDEunV+ARjaZ/YkH0Ejg/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="264201695"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Jul 2026 13:38:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpXVx-00000000hZn-3bGW;
	Thu, 30 Jul 2026 20:38:01 +0000
Date: Fri, 31 Jul 2026 04:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Stella Liu <yu-ching.liu@mediatek.com>,
 Jeremy Yu <chengwei.yu@mediatek.com>
Subject: [nbd168-wireless:mt76 28/135]
 drivers/net/wireless/mediatek/mt76/mt7925/nan.c:644:31: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202607310408.RM6BRwGg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbd168/wireless mt76
head:   916e2978558bd50cb2105e131f6b72234a990287
commit: 6decc6a97044a24b69d873998e043fde340fe328 [28/135] wifi: mt76: mt7925: add NAN MCU helpers
config: i386-randconfig-r121-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310408.RM6BRwGg-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310408.RM6BRwGg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310408.RM6BRwGg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mt7925/nan.c:644:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] sch_idx @@     got unsigned int [usertype] sch_idx @@
   drivers/net/wireless/mediatek/mt76/mt7925/nan.c:644:31: sparse:     expected restricted __le32 [usertype] sch_idx
   drivers/net/wireless/mediatek/mt76/mt7925/nan.c:644:31: sparse:     got unsigned int [usertype] sch_idx
   drivers/net/wireless/mediatek/mt76/mt7925/nan.c:676:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] sch_idx @@     got unsigned int [usertype] sch_idx @@
   drivers/net/wireless/mediatek/mt76/mt7925/nan.c:676:31: sparse:     expected restricted __le32 [usertype] sch_idx
   drivers/net/wireless/mediatek/mt76/mt7925/nan.c:676:31: sparse:     got unsigned int [usertype] sch_idx
>> drivers/net/wireless/mediatek/mt76/mt7925/nan.c:678:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] max_chnl_switch_time @@     got unsigned short [usertype] max_chan_switch @@
   drivers/net/wireless/mediatek/mt76/mt7925/nan.c:678:44: sparse:     expected restricted __le16 [usertype] max_chnl_switch_time
   drivers/net/wireless/mediatek/mt76/mt7925/nan.c:678:44: sparse:     got unsigned short [usertype] max_chan_switch
   drivers/net/wireless/mediatek/mt76/mt7925/nan.c:758:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] sch_idx @@     got unsigned int [usertype] sch_idx @@
   drivers/net/wireless/mediatek/mt76/mt7925/nan.c:758:26: sparse:     expected restricted __le32 [usertype] sch_idx
   drivers/net/wireless/mediatek/mt76/mt7925/nan.c:758:26: sparse:     got unsigned int [usertype] sch_idx

vim +644 drivers/net/wireless/mediatek/mt76/mt7925/nan.c

   625	
   626	static int mt7925_nan_peer_rec_tlv(struct sk_buff *skb,
   627					   struct ieee80211_sta *sta,
   628					   struct mt792x_sta *msta,
   629					   u8 is_activate)
   630	{
   631		struct mt7925_nan_sched_manage_peer_rec_tlv *peer_rec_tlv;
   632		struct tlv *tlv;
   633	
   634		if (!skb || !sta || !msta)
   635			return -EINVAL;
   636	
   637		tlv = mt76_connac_mcu_add_tlv(skb, NAN_UNI_CMD_MANAGE_PEER_SCH_RECORD,
   638					      sizeof(struct mt7925_nan_sched_manage_peer_rec_tlv));
   639	
   640		if (!tlv)
   641			return -ENOMEM;
   642	
   643		peer_rec_tlv = (struct mt7925_nan_sched_manage_peer_rec_tlv *)tlv;
 > 644		peer_rec_tlv->sch_idx = msta->nan_sched.sch_idx;
   645		peer_rec_tlv->is_activate = is_activate;
   646		memcpy(peer_rec_tlv->nmi_addr, sta->addr, ETH_ALEN);
   647	
   648		return 0;
   649	}
   650	
   651	static int mt7925_nan_peer_cap_tlv(struct sk_buff *skb,
   652					   struct ieee80211_sta *sta,
   653					   struct mt792x_sta *msta)
   654	{
   655		struct mt7925_nan_sched_update_peer_cap_tlv *peer_cap_tlv;
   656		struct ieee80211_nan_peer_sched *sched;
   657		enum nl80211_band band;
   658		struct tlv *tlv;
   659		u16 primary_ch;
   660		u32 i;
   661	
   662		if (!skb || !sta || !msta)
   663			return -EINVAL;
   664	
   665		sched = sta->nan_sched;
   666		if (!sched)
   667			return -EINVAL;
   668	
   669		tlv = mt76_connac_mcu_add_tlv(skb, NAN_UNI_CMD_UPDATE_PEER_CAPABILITY,
   670					      sizeof(struct mt7925_nan_sched_update_peer_cap_tlv));
   671	
   672		if (!tlv)
   673			return -ENOMEM;
   674	
   675		peer_cap_tlv = (struct mt7925_nan_sched_update_peer_cap_tlv *)tlv;
   676		peer_cap_tlv->sch_idx = msta->nan_sched.sch_idx;
   677		peer_cap_tlv->supported_bands = BIT(NAN_SUPPORTED_BAND_ID_2P4G);
 > 678		peer_cap_tlv->max_chnl_switch_time = sched->max_chan_switch;
   679	
   680		for (i = 0; i < sched->n_channels; i++) {
   681			if (!sched->channels[i].chanctx_conf)
   682				continue;
   683	
   684			band = sched->channels[i].chanctx_conf->def.chan->band;
   685			primary_ch =
   686				sched->channels[i].chanctx_conf->def.chan->hw_value;
   687	
   688			if (band == NL80211_BAND_2GHZ)
   689				peer_cap_tlv->peer_supported_bands |=
   690					BIT(NAN_SUPPORTED_BN_2G);
   691			else if (primary_ch >= UNII1_LOWER_BOUND &&
   692				 primary_ch <= UNII1_UPPER_BOUND)
   693				peer_cap_tlv->peer_supported_bands |=
   694					BIT(NAN_SUPPORTED_BN_5G_LOW);
   695			else if (primary_ch >= UNII3_LOWER_BOUND &&
   696				 primary_ch <= UNII3_UPPER_BOUND)
   697				peer_cap_tlv->peer_supported_bands |=
   698					BIT(NAN_SUPPORTED_BN_5G_HIGH);
   699		}
   700	
   701		return 0;
   702	}
   703	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
