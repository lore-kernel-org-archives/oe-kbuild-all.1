Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10E384FD4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714039316; cv=none; b=niYWhLuNVAsh93RyyUxwYimUDhJ3Mb48KbViR1SO2VxKknNfVryPTK3x7rvl8i+PIZBI/9iQIYpGkIvi25etqpI1eBV+Z7VVoVVzMUcMx+666c7fNE2RV7Wr0SIPWYdoWuqqhWNxdEaIyGKKActn9Ji+PVe3uFmkD55GQzAQAsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714039316; c=relaxed/simple;
	bh=HeTYIphm4Je+Bqw7we7HY+5CDlM7/F8oX3A9biQlvy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E5ParYDthfu/lOwTkFuaFuE+sclTnOWmqBleQfR2FQaZo91sCqtFl4pKh4CZIG8ky13omsC3ys3i4VoE8g++6id3REd+NCV8Yc5U2P38Pg6T0BdutXtBq7ucMwJQw0RrKYOpwJ1PKgKAapCU1IiiVeuw/Sry7ZZ7u+I40695L0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSbinc8N; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSbinc8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714039315; x=1745575315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HeTYIphm4Je+Bqw7we7HY+5CDlM7/F8oX3A9biQlvy0=;
  b=cSbinc8NvZZYkefCvWd30NRoHTYuH+yPEA18XZV4lX/1PmO0CdHAt3LQ
   9R9oqICFmBLr59lbKdnbMDPMw51CI53FmNJ9iy3TA4s5ioiLuH53yJYnR
   d3LsDS+t4xeOHAvhmOgT2K84c3fGJbgF4G+6Xl7s3ZEFhpMwbY58rSpVy
   wdMhRUE+UdnJlao5OPnpGNqfuCn9c2OWl2pGj2g49Sh/cLW+YKfDQ5r7R
   PewJhIftlLOFIRJm61LhWLsry2wuOg0BmPP5lniGa+hv7hfxMC6X8A31a
   AEHCwRFl06MQf7w9Zo2jYvjNsSvgpMjDBGVmbIzvl82NgUZHDvQjY8BmI
   w==;
X-CSE-ConnectionGUID: RV/hfrocRDih3fg3lIKw5A==
X-CSE-MsgGUID: OUmFK0HXRuShplhORYfjEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="32205378"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="32205378"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 03:01:55 -0700
X-CSE-ConnectionGUID: QP4+o0N8Tge6tbyiHSCH8g==
X-CSE-MsgGUID: UJJOYIlDT6W+FYZAUtptQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="29647194"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Apr 2024 03:01:53 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzvvL-0002FL-0N;
	Thu, 25 Apr 2024 10:01:51 +0000
Date: Thu, 25 Apr 2024 18:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Yan <rong.yan@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Subject: [nbd168-wireless:mt76 33/37]
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:263:20: sparse: sparse: cast
 to restricted __le32
Message-ID: <202404251728.k3Q4OQ2V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   dd74b75cbfa9ff62cb55e7e2d5bb9397158b764d
commit: f01224e61c74e984919303865fa844e0a32e086b [33/37] wifi: mt76: mt7921: cqm rssi low/high event notify
config: arc-randconfig-r111-20240425 (https://download.01.org/0day-ci/archive/20240425/202404251728.k3Q4OQ2V-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240425/202404251728.k3Q4OQ2V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251728.k3Q4OQ2V-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:263:20: sparse: sparse: cast to restricted __le32

vim +263 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c

   255	
   256	static void
   257	mt7921_mcu_rssi_monitor_iter(void *priv, u8 *mac,
   258				     struct ieee80211_vif *vif)
   259	{
   260		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
   261		struct mt76_connac_rssi_notify_event *event = priv;
   262		enum nl80211_cqm_rssi_threshold_event nl_event;
 > 263		s32 rssi = le32_to_cpu(event->rssi[mvif->mt76.idx]);
   264	
   265		if (!rssi)
   266			return;
   267	
   268		if (!(vif->driver_flags & IEEE80211_VIF_SUPPORTS_CQM_RSSI))
   269			return;
   270	
   271		if (rssi > vif->bss_conf.cqm_rssi_thold)
   272			nl_event = NL80211_CQM_RSSI_THRESHOLD_EVENT_HIGH;
   273		else
   274			nl_event = NL80211_CQM_RSSI_THRESHOLD_EVENT_LOW;
   275	
   276		ieee80211_cqm_rssi_notify(vif, nl_event, rssi, GFP_KERNEL);
   277	}
   278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
