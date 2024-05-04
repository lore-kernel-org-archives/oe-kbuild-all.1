Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04BFF4E7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714812566; cv=none; b=S0pIpndA4FTlEfluvbGxrdEOprNP4HEZfUNrE4lgV8Z1hdjdOISkx3gqiEeAiXxtJ2ibLQBR4BA5PAaqPCgvh1bWHL1/P3VEzBFUfbd5WymOKaf3H3/nZHW54d9M+wzBetwDpZkTCJPimmopH83IkjqQ8IXgGcfGvfG0aRk1gmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714812566; c=relaxed/simple;
	bh=jpwJ/o/8UuWLTI4oygzgp22P18aBX4mJJb8o3+yiXVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iQtdEVdXRdjis8bAsV0ojEdvnEMNIyInL4Gt+09cOoU56/FCAsUYO8p1FZI3zSOpwXJuJRpLyHD5UqkqsMjSjNfcAD8clJFuNUZKRm2r1tZn9VVlJ6PWMKZeNxh9XCHyHeT0SYDdH/UKsTQGXsRm37fNoXa4EEuTCb7sQPceLeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Isi/7N/g; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Isi/7N/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714812564; x=1746348564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jpwJ/o/8UuWLTI4oygzgp22P18aBX4mJJb8o3+yiXVM=;
  b=Isi/7N/gV+M+PdfGojK4m7BxOQgZ+sR1/mB2IPhGvOvY9iGFHHw3me85
   J+AS2X/VaiaxpYGCCpCXPyAEW8+OiSoleSh4TRCYFHbcT9wgD2qebGO3m
   i21YjMMfrvuSjDhOrjfQXpf++fnBnvNiIO0fA0s5GAHbNOhL9/lNT83BU
   nH4V1N8GMdZRKuPdrKXxW3kisUXneIBzDNfkU3XlW/Yp/5M1E/oCw525b
   OZhCAFiIzbRwsuh2Ly1rATGcC5gDic5wP2n9CVcuFs/kusbKLakJApC9v
   KK+DAdbprzvZQjx3k4JrIBPR026V/oE/AW1z3hDuum86y4dJ1pmfg8FmG
   A==;
X-CSE-ConnectionGUID: Oi2RNIgpQjWIXTijux0faA==
X-CSE-MsgGUID: I/wJ+ae1Q8K0YGU9B22myA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14435634"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="14435634"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 01:49:24 -0700
X-CSE-ConnectionGUID: YDtD20NZTnCkiWN1yTxt5A==
X-CSE-MsgGUID: pQsG7FHeRq2/aIx3KZyjdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="32358791"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 May 2024 01:49:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3B55-000CaS-29;
	Sat, 04 May 2024 08:49:19 +0000
Date: Sat, 4 May 2024 16:48:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 37/45]
 drivers/net/wireless/mediatek/mt76/mt7925/main.c:382:2: error: call to
 undeclared function 'mt76_wcid_init'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202405041625.eHCoTsUb-lkp@intel.com>
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
config: x86_64-randconfig-161-20240504 (https://download.01.org/0day-ci/archive/20240504/202405041625.eHCoTsUb-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041625.eHCoTsUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041625.eHCoTsUb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:382:2: error: call to undeclared function 'mt76_wcid_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     382 |         mt76_wcid_init(&mvif->sta.wcid);
         |         ^
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:382:2: note: did you mean 'mt76_mmio_init'?
   drivers/net/wireless/mediatek/mt76/mt7925/../mt76.h:1041:6: note: 'mt76_mmio_init' declared here
    1041 | void mt76_mmio_init(struct mt76_dev *dev, void __iomem *regs);
         |      ^
   1 error generated.


vim +/mt76_wcid_init +382 drivers/net/wireless/mediatek/mt76/mt7925/main.c

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
