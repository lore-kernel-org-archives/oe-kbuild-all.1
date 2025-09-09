Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2281A7253
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 03:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757387200; cv=none; b=EZTVGg+WGp9v6fS7+xJlmbLNF2CSoTAjN5VbSJOic1rM3iabUIjtls6je9ccep15tN5ClA/72Cuv8Bb9gnLN2lEcV2LL/QrySw2O34TXDiudPWac6DF+2/1oCkFfe08CXKXip7TG8C6H3hxK3lRCeMEhCP5o980IOqrGteMODWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757387200; c=relaxed/simple;
	bh=Y/NonIHPeYO5m2f8zfE9816I2/eTCrUo11jCi1wUNjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P7vW5S/wjYFojompUnd/05wtAMyZ+oh4qUmLvz1mZgwA8akQz3oJz+vzPpqn9z3J/exfjap/9xsyhav78HOPHhQOncUK5t7WTOImjj6t8W3itT7U9dHssASBRndGmxgXjqaQVFvuTEfYv5OK8cHM1UhDXaO0L8HNK7JJz3phHFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZUS7GwJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZUS7GwJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757387198; x=1788923198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/NonIHPeYO5m2f8zfE9816I2/eTCrUo11jCi1wUNjc=;
  b=CZUS7GwJjfAT9vktQjrgIwHV3nZcwT/7w/7kEFt5UdGVvQZvwVOM2hgp
   gSYuzSfPSpvBOx6/9j1LMN+aaBHOtJoguag6KiSVE/w7jW+S1fXu4pUNu
   Pj3IH3LoEg7biYXA0aoPoSkKoLtjyAztuJNhOtW+0I2dNKFnn1cVAZ7Ki
   syU/FXprm+Z6BUeofZwNhkO2azVkmBhNhIqi6RDSYFvxs72X1RliQ4yzj
   IqsnjPHw4VRyQt+0RtSX+/4Rc/AyM7kDta7jEl8X4zaBFBj8KPlJY8sJD
   nZqbryl/mv6isZg++cC6NrTTiODycaG23UrGJB89QrlFaDuC9tuiAZeWp
   A==;
X-CSE-ConnectionGUID: QEGe65ydTlOBFkI60ejV1w==
X-CSE-MsgGUID: /qF81s7fSs+BwWujjPgadA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59519839"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59519839"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 20:06:36 -0700
X-CSE-ConnectionGUID: S79qt3NlS2edy5e0wPc53Q==
X-CSE-MsgGUID: Ly4AA6MUTEKdTIPYnXIz1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="203947289"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2025 20:06:32 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvogd-0004Ml-2F;
	Tue, 09 Sep 2025 03:06:27 +0000
Date: Tue, 9 Sep 2025 11:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Subject: [nbd168-wireless:mt76 3/19]
 drivers/net/wireless/mediatek/mt76/mt7996/main.c:320 mt7996_vif_link_add()
 warn: unsigned 'link->mld_idx' is never less than zero.
Message-ID: <202509091052.sacuW4a2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   11c3ee032f406b80c7ccf743ddfc7b12387abf4a
commit: dcc19f2add9e809f8bd0dbc72f3713c3c940ad49 [3/19] wifi: mt76: mt7996: Fix mt7996_mcu_bss_mld_tlv routine
config: xtensa-randconfig-r071-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091052.sacuW4a2-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091052.sacuW4a2-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:320 mt7996_vif_link_add() warn: unsigned 'link->mld_idx' is never less than zero.

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +320 drivers/net/wireless/mediatek/mt76/mt7996/main.c

   292	
   293	int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
   294				struct ieee80211_bss_conf *link_conf,
   295				struct mt76_vif_link *mlink)
   296	{
   297		struct mt7996_vif_link *link = container_of(mlink, struct mt7996_vif_link, mt76);
   298		struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
   299		struct mt7996_sta_link *msta_link = &link->msta_link;
   300		struct mt7996_phy *phy = mphy->priv;
   301		struct mt7996_dev *dev = phy->dev;
   302		u8 band_idx = phy->mt76->band_idx;
   303		struct mt76_txq *mtxq;
   304		int idx, ret;
   305	
   306		mlink->idx = __ffs64(~dev->mt76.vif_mask);
   307		if (mlink->idx >= mt7996_max_interface_num(dev))
   308			return -ENOSPC;
   309	
   310		idx = get_omac_idx(vif->type, phy->omac_mask);
   311		if (idx < 0)
   312			return -ENOSPC;
   313	
   314		if (!dev->mld_idx_mask) { /* first link in the group */
   315			mvif->mld_group_idx = get_own_mld_idx(dev->mld_idx_mask, true);
   316			mvif->mld_remap_idx = get_free_idx(dev->mld_remap_idx_mask,
   317							   0, 15);
   318		}
   319		link->mld_idx = get_own_mld_idx(dev->mld_idx_mask, false);
 > 320		if (link->mld_idx < 0)
   321			return -ENOSPC;
   322	
   323		link->phy = phy;
   324		mlink->omac_idx = idx;
   325		mlink->band_idx = band_idx;
   326		mlink->wmm_idx = vif->type == NL80211_IFTYPE_AP ? 0 : 3;
   327		mlink->wcid = &msta_link->wcid;
   328		mlink->wcid->offchannel = mlink->offchannel;
   329	
   330		ret = mt7996_mcu_add_dev_info(phy, vif, link_conf, mlink, true);
   331		if (ret)
   332			return ret;
   333	
   334		dev->mt76.vif_mask |= BIT_ULL(mlink->idx);
   335		if (!dev->mld_idx_mask) {
   336			dev->mld_idx_mask |= BIT_ULL(mvif->mld_group_idx);
   337			dev->mld_remap_idx_mask |= BIT_ULL(mvif->mld_remap_idx);
   338		}
   339		dev->mld_idx_mask |= BIT_ULL(link->mld_idx);
   340		phy->omac_mask |= BIT_ULL(mlink->omac_idx);
   341	
   342		idx = MT7996_WTBL_RESERVED - mlink->idx;
   343	
   344		INIT_LIST_HEAD(&msta_link->rc_list);
   345		msta_link->wcid.idx = idx;
   346		msta_link->wcid.link_id = link_conf->link_id;
   347		msta_link->wcid.tx_info |= MT_WCID_TX_INFO_SET;
   348		mt76_wcid_init(&msta_link->wcid, band_idx);
   349	
   350		mt7996_mac_wtbl_update(dev, idx,
   351				       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
   352	
   353		if (vif->txq) {
   354			mtxq = (struct mt76_txq *)vif->txq->drv_priv;
   355			mtxq->wcid = idx;
   356		}
   357	
   358		if (vif->type != NL80211_IFTYPE_AP &&
   359		    (!mlink->omac_idx || mlink->omac_idx > 3))
   360			vif->offload_flags = 0;
   361	
   362		if (phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
   363			mlink->basic_rates_idx = MT7996_BASIC_RATES_TBL + 4;
   364		else
   365			mlink->basic_rates_idx = MT7996_BASIC_RATES_TBL;
   366	
   367		mt7996_init_bitrate_mask(vif, link);
   368	
   369		mt7996_mcu_add_bss_info(phy, vif, link_conf, mlink, msta_link, true);
   370		/* defer the first STA_REC of BMC entry to BSS_CHANGED_BSSID for STA
   371		 * interface, since firmware only records BSSID when the entry is new
   372		 */
   373		if (vif->type != NL80211_IFTYPE_STATION)
   374			mt7996_mcu_add_sta(dev, link_conf, NULL, link, NULL,
   375					   CONN_STATE_PORT_SECURE, true);
   376		rcu_assign_pointer(dev->mt76.wcid[idx], &msta_link->wcid);
   377	
   378		ieee80211_iter_keys(mphy->hw, vif, mt7996_key_iter, NULL);
   379	
   380		if (mvif->mt76.deflink_id == IEEE80211_LINK_UNSPECIFIED)
   381			mvif->mt76.deflink_id = link_conf->link_id;
   382	
   383		return 0;
   384	}
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
