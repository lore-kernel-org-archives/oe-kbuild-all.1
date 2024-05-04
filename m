Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72F417550
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 10:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714816947; cv=none; b=BFjBYn042CDmJdNSuBdJ8vTR+W65Voox2EJYLKeRUn592uzCxk1r/kfeiM8EJVoD5lBzZjPKujzrGYdicuPbYbMtPWCUHsXCDI3KV/OFMChEhexOFD266wxYyovPzG9/Z5HeWtJ/LnIFQcDwtjJJi8OHNZu3NcGT9A/MvMisVY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714816947; c=relaxed/simple;
	bh=6A+w7qbSvEkHFOP8vR2oxaHIYhiyyrUiafmK9vJmJMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U5bmyf84fI3TLdjCydWyzOd5s0sqXwXwSpC1OeQrCl4j/FtNLnr5VO44CUP1jtQLsC+d6vGsILJ11p2IPD5sLYkeTpnZn+iNYNrSAU3rYgxQ6FgtprXHC6V4b2x8hqbrI71ZJJ+EtbekGhLuvV8VCNWuSZhENUACdbTm5u8XS7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLfc+1qO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLfc+1qO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714816946; x=1746352946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6A+w7qbSvEkHFOP8vR2oxaHIYhiyyrUiafmK9vJmJMQ=;
  b=gLfc+1qOba3P67E6fM9im4OKh3Ibnf3TrPmIMhoNuxk2VRdldtZPS4hs
   n+c5nZ46uPuVfh9n4DJ2CLa1wiugydsmkkuCl1PRtECTD7Af/09z/vrR4
   ALoRgFHyohx25fSORBMtuhuZ2FTp7p3ytyeHE7LuQ9lADcb9KGi6Bjncm
   LrEMww4JwW9HWjNULsFR62qD2yyfFneAVcsGGxB7+HMhnnZoNB7Aer5oc
   YlfxOI+hNunRK2W/yy0Oqpb+FuIS3fVMgN8AC9/Zo8z4o5ZUfi3ovz34N
   fC/1EoQznMe5jXe8C+1acYuZAvgQrHCuvXY+yrAkJrmA8Elp/i17jf7Z8
   A==;
X-CSE-ConnectionGUID: YbDO2NuKRt+Md+2L4OOiPg==
X-CSE-MsgGUID: VJ0LPYLeTeah2iYsPT2tWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="22033114"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="22033114"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 03:02:25 -0700
X-CSE-ConnectionGUID: MvHUTjzdQ3+qSJ1Lkl8MoA==
X-CSE-MsgGUID: O074cgjHS8yOW6t8oSOzug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="32195449"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 May 2024 03:02:24 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3CDl-000CeI-2H;
	Sat, 04 May 2024 10:02:21 +0000
Date: Sat, 4 May 2024 18:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 37/45]
 drivers/net/wireless/mediatek/mt76/mt7925/main.c:382:9: error: implicit
 declaration of function 'mt76_wcid_init'; did you mean 'mt76_mmio_init'?
Message-ID: <202405041744.hFtQY4pn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   ba7101f72dd4f7ecfae7894a8aba538755b2b1d8
commit: b106c213e385980ee7d300427b9e4e5866c8e071 [37/45] BACKPORT: wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405041744.hFtQY4pn-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041744.hFtQY4pn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041744.hFtQY4pn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7925/main.c: In function 'mt7925_add_interface':
>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:382:9: error: implicit declaration of function 'mt76_wcid_init'; did you mean 'mt76_mmio_init'? [-Werror=implicit-function-declaration]
     382 |         mt76_wcid_init(&mvif->sta.wcid);
         |         ^~~~~~~~~~~~~~
         |         mt76_mmio_init
   cc1: some warnings being treated as errors


vim +382 drivers/net/wireless/mediatek/mt76/mt7925/main.c

   339	
   340	static int
   341	mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
   342	{
   343		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
   344		struct mt792x_dev *dev = mt792x_hw_dev(hw);
   345		struct mt792x_phy *phy = mt792x_hw_phy(hw);
   346		struct mt76_txq *mtxq;
   347		int idx, ret = 0;
   348	
   349		mt792x_mutex_acquire(dev);
   350	
   351		mvif->mt76.idx = __ffs64(~dev->mt76.vif_mask);
   352		if (mvif->mt76.idx >= MT792x_MAX_INTERFACES) {
   353			ret = -ENOSPC;
   354			goto out;
   355		}
   356	
   357		mvif->mt76.omac_idx = mvif->mt76.idx;
   358		mvif->phy = phy;
   359		mvif->mt76.band_idx = 0;
   360		mvif->mt76.wmm_idx = mvif->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
   361	
   362		if (phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
   363			mvif->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL + 4;
   364		else
   365			mvif->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL;
   366	
   367		ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, vif, &mvif->sta.wcid,
   368						  true);
   369		if (ret)
   370			goto out;
   371	
   372		dev->mt76.vif_mask |= BIT_ULL(mvif->mt76.idx);
   373		phy->omac_mask |= BIT_ULL(mvif->mt76.omac_idx);
   374	
   375		idx = MT792x_WTBL_RESERVED - mvif->mt76.idx;
   376	
   377		INIT_LIST_HEAD(&mvif->sta.wcid.poll_list);
   378		mvif->sta.wcid.idx = idx;
   379		mvif->sta.wcid.phy_idx = mvif->mt76.band_idx;
   380		mvif->sta.wcid.hw_key_idx = -1;
   381		mvif->sta.wcid.tx_info |= MT_WCID_TX_INFO_SET;
 > 382		mt76_wcid_init(&mvif->sta.wcid);
   383	
   384		mt7925_mac_wtbl_update(dev, idx,
   385				       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
   386	
   387		ewma_rssi_init(&mvif->rssi);
   388	
   389		rcu_assign_pointer(dev->mt76.wcid[idx], &mvif->sta.wcid);
   390		if (vif->txq) {
   391			mtxq = (struct mt76_txq *)vif->txq->drv_priv;
   392			mtxq->wcid = idx;
   393		}
   394	
   395		vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
   396	out:
   397		mt792x_mutex_release(dev);
   398	
   399		return ret;
   400	}
   401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
