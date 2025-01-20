Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4AB1917D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 07:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737359919; cv=none; b=ZhK78M0nIM6LJQO2Coj5/YnLp5ntv026WXzueRT5ZMGY9/bhnbiLrFa2rMm1XCRUZ65KLYTsu9qm+BUuR6tNhgqrlSy+2foVfQlYCy2fn8PrMXvGeEL77Qp9l6nhZlWLcC6h7vgPJPv8gPsyZxPwAhKULB35IEnr+/OwF7zxMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737359919; c=relaxed/simple;
	bh=yjIzq4zpiGG38DCba2prRE16SgS8V5aQMhkPZPADz4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BMfLhlVho3RfHC/73k93kvfrqpkB+FdpfaFx72bYicg51/OhVETiz+2ptSA+SHuLUhit7OxH86xow16eYsQJKcOOphndX2EWsaJnbFIVP/97+6eUHDv+ykdfxiHvvlGCtI7MuxPzXGQdpP+tvO5rQdMV6hctuatkc3reUL8Arpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFyHbdUq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFyHbdUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737359917; x=1768895917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjIzq4zpiGG38DCba2prRE16SgS8V5aQMhkPZPADz4I=;
  b=EFyHbdUqTiCXVlEr4A2csaEIYPwuccyHtYpOIoZ4LBO100Hqu3Etsf9t
   BdFIRh8RXbeOyciP7aKceXOxDnw7LCEbsYgKcy7lITeDkTWArYvwca4yn
   JMiXTifXUUe0F8GqgQKkZ5jpdMw0r12HyiDrfPrQij2SzRXNyWs35NwDs
   TUoJNzqvP4829+BNx14A4KZSVjonmu8eyPJ+afQgP18/0+zxbX+vC5tiZ
   FMTgQ0n9DugDXHARvKi4tiecFoC7E0I7b/cDQJUAnj7Tc6Qn0jrgTlAyk
   cCJ8Hw33BtuVWTmQqekuUyTqwb6cwgOTLGUBVOmOxDpOssYqaeXBYLodZ
   g==;
X-CSE-ConnectionGUID: ZXUnZTTbS0WYKuSPsaXbSQ==
X-CSE-MsgGUID: rpsAplpmQuWkD5wanuuTJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="55277752"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="55277752"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 23:58:34 -0800
X-CSE-ConnectionGUID: hiaWYtIPRE2E1nsqHLjSUA==
X-CSE-MsgGUID: 537sh8w4RuiUYimaO7b6vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111411400"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jan 2025 23:58:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZmg2-000WLB-2v;
	Mon, 20 Jan 2025 07:58:30 +0000
Date: Mon, 20 Jan 2025 15:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [linux-next:master 8406/9563]
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:585 mt7925_mcu_uni_tx_ba()
 warn: unsigned 'ret' is never less than zero.
Message-ID: <202501201525.If1lFErE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0907e7fb35756464aa34c35d6abb02998418164b
commit: eb2a9a12c6092a26f632468d6610497d4f0e40da [8406/9563] wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO
config: m68k-randconfig-r072-20250120 (https://download.01.org/0day-ci/archive/20250120/202501201525.If1lFErE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201525.If1lFErE-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:585 mt7925_mcu_uni_tx_ba() warn: unsigned 'ret' is never less than zero.
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:589 mt7925_mcu_uni_tx_ba() error: uninitialized symbol 'ret'.
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:612 mt7925_mcu_uni_rx_ba() warn: unsigned 'ret' is never less than zero.
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:616 mt7925_mcu_uni_rx_ba() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:1193 mt7925_mcu_set_mlo_roc() warn: variable dereferenced before check 'mconf' (see line 1160)

vim +/ret +585 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c

   560	
   561	/** starec & wtbl **/
   562	int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
   563				 struct ieee80211_vif *vif,
   564				 struct ieee80211_ampdu_params *params,
   565				 bool enable)
   566	{
   567		struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
   568		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
   569		struct mt792x_link_sta *mlink;
   570		struct mt792x_bss_conf *mconf;
   571		unsigned long usable_links = ieee80211_vif_usable_links(vif);
   572		struct mt76_wcid *wcid;
   573		u8 link_id, ret;
   574	
   575		for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
   576			mconf = mt792x_vif_to_link(mvif, link_id);
   577			mlink = mt792x_sta_to_link(msta, link_id);
   578			wcid = &mlink->wcid;
   579	
   580			if (enable && !params->amsdu)
   581				mlink->wcid.amsdu = false;
   582	
   583			ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
   584						enable, true);
 > 585			if (ret < 0)
   586				break;
   587		}
   588	
 > 589		return ret;
   590	}
   591	
   592	int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
   593				 struct ieee80211_vif *vif,
   594				 struct ieee80211_ampdu_params *params,
   595				 bool enable)
   596	{
   597		struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
   598		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
   599		struct mt792x_link_sta *mlink;
   600		struct mt792x_bss_conf *mconf;
   601		unsigned long usable_links = ieee80211_vif_usable_links(vif);
   602		struct mt76_wcid *wcid;
   603		u8 link_id, ret;
   604	
   605		for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
   606			mconf = mt792x_vif_to_link(mvif, link_id);
   607			mlink = mt792x_sta_to_link(msta, link_id);
   608			wcid = &mlink->wcid;
   609	
   610			ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
   611						enable, false);
 > 612			if (ret < 0)
   613				break;
   614		}
   615	
 > 616		return ret;
   617	}
   618	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
