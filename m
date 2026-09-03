Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B831D5160
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 03:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406246; cv=none; b=ZxAiAatZPJrhtv9YXwQj3ZF7ycBtXsOKIithbGH5AzYoLwV0ViEI1d2zv+R6AgjO9DsoL4eZJTOHA1BXNszaBx6yqhfCTKbEJJWt7bp6ViSMU0GuzbPepR4egFr9S0fJo8hkFV+/V2+pxrDigFqy2VZmNKwroxOGN11yHRBGGxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406246; c=relaxed/simple;
	bh=268M/wGlSgIqSeXYbRBTbBVIgomnlkLyQ5hyuUB4Trs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=quTYDECs+iG+svjom/PbLH3/TKQneixcM8olR25hLg5f+GoLhnQVvUx6RPyH+e6dsKTZepPpstPkeQuLqcElH2DHUqRAhZa+Piv5CyCuT0HlsQDnQOVySNvJGXz1L9manoRxeWORm/E0rxfj2yr9oOuw5/CMluO62nbhZNH81b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMq8bdTP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMq8bdTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788406244; x=1819942244;
  h=date:from:to:cc:subject:message-id;
  bh=268M/wGlSgIqSeXYbRBTbBVIgomnlkLyQ5hyuUB4Trs=;
  b=XMq8bdTPNu4PqK09Gdo1H5LyPOenNsLPMHXu303e5vsXVCY4RHmRcWQy
   OIqg6mxxhUezzYxVaP60RHNrG9GxEDo5OX61cUTvNjb7hwS0V1vbHRo8W
   6isvRyKF+xqdCv9/SitxuxlWFt2Km272/LpD4GKZakdVLlGgmy3oB3qS7
   2WQHmsOhDlx3/SSoi6e9S1kizo44VBLVX5HnazQd7VdE19onGd75dMr0C
   edHpF2Ks4EM88Acd8tTM33Mh336c/6e1A48H7VQd1Xe6UPV4s9SPRTs6C
   yChTIJVnU/v6GXXADzX8mmxTA1CP+MHkAbMnOoRBR7qjEJk42RTqgYV74
   A==;
X-CSE-ConnectionGUID: um+Uw4MsTRCf8MfQn63hCg==
X-CSE-MsgGUID: dhq8UIp2TyKkUxdNnax48Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="87812254"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="87812254"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 20:30:43 -0700
X-CSE-ConnectionGUID: uFpFqXqZSLu2bWCNaDPNXQ==
X-CSE-MsgGUID: aZOSQgMcTL2UzSqdDDF2Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="269603817"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2026 20:30:43 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1y9w-000000003vI-4B0V;
	Thu, 03 Sep 2026 03:30:40 +0000
Date: Thu, 03 Sep 2026 11:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 23/23]
 drivers/net/wireless/mediatek/mt76/mt7925/main.c:2232:12: warning: variable
 'link_id' set but not used
Message-ID: <202609031155.OwLcYxEa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   3ef53509d71662f4219fbd3b7e07ec24c6fe56a8
commit: 3ef53509d71662f4219fbd3b7e07ec24c6fe56a8 [23/23] BACKPORT: wifi: mt76: mt7925: introduce CSA support in non-MLO mode
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260903/202609031155.OwLcYxEa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031155.OwLcYxEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031155.OwLcYxEa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7925/main.c: In function 'mt7925_csa_work':
>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:2232:12: warning: variable 'link_id' set but not used [-Wunused-but-set-variable=]
    2232 |         u8 link_id, roc_rtype;
         |            ^~~~~~~


vim +/link_id +2232 drivers/net/wireless/mediatek/mt76/mt7925/main.c

  2224	
  2225	void mt7925_csa_work(struct work_struct *work)
  2226	{
  2227		struct mt792x_vif *mvif;
  2228		struct mt792x_dev *dev;
  2229		struct ieee80211_vif *vif;
  2230		struct ieee80211_bss_conf *link_conf;
  2231		struct mt792x_bss_conf *mconf;
> 2232		u8 link_id, roc_rtype;
  2233		int ret = 0;
  2234	
  2235		mvif = (struct mt792x_vif *)container_of(work, struct mt792x_vif,
  2236							csa_work);
  2237		dev = mvif->phy->dev;
  2238		vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
  2239	
  2240		if (ieee80211_vif_is_mld(vif))
  2241			return;
  2242	
  2243		if (!dev->new_ctx)
  2244			return;
  2245	
  2246		link_id = 0;
  2247		mconf = &mvif->bss_conf;
  2248		link_conf = &vif->bss_conf;
  2249		roc_rtype = MT7925_ROC_REQ_JOIN;
  2250	
  2251		mt792x_mutex_acquire(dev);
  2252		ret = mt7925_set_roc(mvif->phy, mconf, dev->new_ctx->def.chan,
  2253				     4000, roc_rtype);
  2254		mt792x_mutex_release(dev);
  2255		if (!ret) {
  2256			mt792x_mutex_acquire(dev);
  2257			ret = mt7925_mcu_set_chctx(mvif->phy->mt76, &mconf->mt76, link_conf,
  2258						   dev->new_ctx);
  2259			mt792x_mutex_release(dev);
  2260	
  2261			mt7925_abort_roc(mvif->phy, mconf);
  2262		}
  2263	
  2264		ieee80211_chswitch_done(vif, !ret);
  2265	}
  2266	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
