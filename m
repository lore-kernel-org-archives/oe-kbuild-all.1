Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F238DDC5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735042858; cv=none; b=JKVdoTk0dt1bC7xj4thyl0qvcHua6xsUhBXYuzfkd6J5fctpZKv1h7QrP8z3VbnG+S0fZSFf9isYjkUYy+5IPSvvdaFI1YCXbHN8+pcT8BBFP6SZl4zgvQ3b39/1yWzTgrDwwaAUvBjFjmy1744BGeCoQcvEPXEc66Cl5+dkx9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735042858; c=relaxed/simple;
	bh=ChkhXAx/7y+930AOZd6alRdUcq62t2qtjIhAlTd7qZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FufQ073mzH0aGGhkS1Sb9cF8I5afcaj0qhF81Xm8OBIwlzelW09og2Z9O/2kHnTJ/VRBrVE/+HBHs5eCMkCUVQ6ZLo/G4MQWamL9TijHFA0lyhN6orq9yXr+QvCpVnIULAJkzAUBxxSWyw6bO3zNg8/RG/2IgqlvyC0q6JatoRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpkJnIQy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpkJnIQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735042857; x=1766578857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ChkhXAx/7y+930AOZd6alRdUcq62t2qtjIhAlTd7qZU=;
  b=JpkJnIQyGqQi+ednmSKSZSfLvD7yq0fukGUIJSlUChQuQay+AIwffqDW
   7OAsix6bNzlm8+FKkwkjKirZMJnK6F3F4LUIHeldtU31KTspS7H16MOJE
   G2Nbf3j2DmOBZJo8o/ahunXbSqNJKFg5XFEAuaizLyd/Vkvv+lrl8BHnT
   Qe7bdCnieyF7EJokTIQEGZqFOahjUFphkRFbDltWbKIU6h3PWsEoWVZ4a
   FJFZQWyEYlQIfzqxAtppYFshQ3zvjtec3tZvAWGt/9UpEyt3BLZgfQTpJ
   S4z4Ict1jPN6AN7e4chMzK+NjwHznVThitIhBCLi1xTyO/yQT8x+Lxu0G
   Q==;
X-CSE-ConnectionGUID: JAPAmvuyT6qffXMOG4Ssjw==
X-CSE-MsgGUID: OltxxyE3QquI8mZg2UmKKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35390013"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="35390013"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 04:20:56 -0800
X-CSE-ConnectionGUID: kZV/o1dLTP2GraDG+WkuCA==
X-CSE-MsgGUID: dlyCRpN7Qq+S1iwg/oPbrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99346590"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Dec 2024 04:20:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ3u8-00016R-23;
	Tue, 24 Dec 2024 12:20:52 +0000
Date: Tue, 24 Dec 2024 20:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/2]
 drivers/net/wireless/mediatek/mt76/mt7915/main.c:498:17: sparse: sparse:
 dubious: x & !y
Message-ID: <202412242001.ZOtA2RMY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   57fdd37edf0708de00366c56c656447dadff9c7a
commit: b9a48a7ee2c37453e077cdc5b393352c4a53ca21 [2/2] UPSTREAM: wifi: mt76: mt7915: fix monitor mode issues
config: arm-randconfig-r133-20241224 (https://download.01.org/0day-ci/archive/20241224/202412242001.ZOtA2RMY-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce: (https://download.01.org/0day-ci/archive/20241224/202412242001.ZOtA2RMY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412242001.ZOtA2RMY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:498:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/mediatek/mt76/mt7915/main.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false

vim +498 drivers/net/wireless/mediatek/mt76/mt7915/main.c

   452	
   453	static int mt7915_config(struct ieee80211_hw *hw, u32 changed)
   454	{
   455		struct mt7915_dev *dev = mt7915_hw_dev(hw);
   456		struct mt7915_phy *phy = mt7915_hw_phy(hw);
   457		int ret;
   458	
   459		if (changed & IEEE80211_CONF_CHANGE_CHANNEL) {
   460	#ifdef CONFIG_NL80211_TESTMODE
   461			if (phy->mt76->test.state != MT76_TM_STATE_OFF) {
   462				mutex_lock(&dev->mt76.mutex);
   463				mt76_testmode_reset(phy->mt76, false);
   464				mutex_unlock(&dev->mt76.mutex);
   465			}
   466	#endif
   467			ieee80211_stop_queues(hw);
   468			ret = mt7915_set_channel(phy);
   469			if (ret)
   470				return ret;
   471			ieee80211_wake_queues(hw);
   472		}
   473	
   474		if (changed & (IEEE80211_CONF_CHANGE_POWER |
   475			       IEEE80211_CONF_CHANGE_CHANNEL)) {
   476			ret = mt7915_mcu_set_txpower_sku(phy);
   477			if (ret)
   478				return ret;
   479		}
   480	
   481		mutex_lock(&dev->mt76.mutex);
   482	
   483		if (changed & IEEE80211_CONF_CHANGE_MONITOR) {
   484			bool enabled = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
   485			bool band = phy->mt76->band_idx;
   486			u32 rxfilter = phy->rxfilter;
   487	
   488			if (!enabled) {
   489				rxfilter |= MT_WF_RFCR_DROP_OTHER_UC;
   490				dev->monitor_mask &= ~BIT(band);
   491			} else {
   492				rxfilter &= ~MT_WF_RFCR_DROP_OTHER_UC;
   493				dev->monitor_mask |= BIT(band);
   494			}
   495	
   496			mt76_rmw_field(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_RXD_G5_EN,
   497				       enabled);
 > 498			mt76_rmw_field(dev, MT_DMA_DCR0(band), MT_MDP_DCR0_RX_HDR_TRANS_EN,
   499				       !dev->monitor_mask);
   500			mt76_testmode_reset(phy->mt76, true);
   501			mt76_wr(dev, MT_WF_RFCR(band), rxfilter);
   502		}
   503	
   504		mutex_unlock(&dev->mt76.mutex);
   505	
   506		return 0;
   507	}
   508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
