Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840873;
	b=SwtzvhjgtY+/EdGcl8BYKR//AdzbDTAnAWvoXmX0NUoQ6BcVIEeE8dhW9VTcFcZZG9On
	 eWzV/QXCZDJorJ1cb83AKeOmIYO7Q0J+DiXBVa6kiBPy3ZdmGtS8AZgqgqHlOPUERtO8R
	 UTZXiwn5vztU+M9Xa4GybT68QPpMPphfm+VpkYQ0Sw0YZYHeHWMYWJONkYF2q5ypgtFo5
	 OB7Jv3+w/4eaYrjh5BOm6pJ6sXgJiSKUxTbIYr5t/kr7ZEFc2cUSFtb4nmfZZNb8GPMmB
	 G3lQKfCewY/BCYT08hdYWqYMHmD6TH/vmaqKLXG8xj98VgX1saET64CgwOg3ZgZE0AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840873;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DVXYeZRxVYuSdbN3HCzeYZaZPisbTWeSKYDG9IMM4ls=;
	b=DNXEZtVJwCkV4/RL24A8HNDM02NV//GiAvNORvrgoW6CGi1uDg8hJe50K9Mmfs0RljTd
	 ulIaJY2ksUIFXp0B/oyBd1zlpezab/eU2bqqrwDfcVah3Jh3l3M4NgR6/mDK5k94cggSN
	 Ez96EjFvdchipbUGw6VxM12UatAnWb0+wVAMu5MgibLnId5pJ+LDYk8EiVxEYAdB1x43D
	 +AoMEqQlkgiBXHbGu451/otsP20miOyEZGTE1Pcjr0aDluH+sgCzBMsBcfjp1a+sLrkmU
	 nH1wYPAmog/8euu/jygXJREEExwqLrZk0ZHSuZMQtCt0SX9nbHiZ3Iqa8s/jY4KTrXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MwOpyCDR;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0C6606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 01:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA0C6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MwOpyCDR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793840873; x=1825376873;
  h=date:from:to:cc:subject:message-id;
  bh=Bi9agN+LSGLUzQTamEobAsdx9UOcFsxmcdYHxvVuMS8=;
  b=MwOpyCDRjJnAYc9TVe/9dzHxndEMQkGBc62knbCiTonjQ0zJYrerEij+
   Ndrz3LtWnQdSu40kbfwPH4BWLe5U7vreHMlVo+o8ZhDuz7dIfsj2f2BFF
   lTW9qjo+pFcQT53HmxIMqPnEejdkSzPKtBtT5+dsSs57UTQ0iY4wth8PK
   Z55h3vYXZTsHuuZpCehfddJgR8yWyb1q+ONu+2lIcAXipkRIcW5rZa9oj
   oNUzVtzpJ+qAl6XP6pX5WMXMiGSNF36LZndTphqW7RFS38rjcmmytsdDv
   buzcFLjMi1Fwk/rt1vocwkkgDHfceY6q4dxF8mzRcXyatUZpEdrOdXlTq
   A==;
X-CSE-ConnectionGUID: t1HkCP72QvC2WYhWZHf6qg==
X-CSE-MsgGUID: iYWQsd96RU+5/lX6KbH/KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2621763"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2621763"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 17:07:52 -0800
X-CSE-ConnectionGUID: BitMrGO9T/S5xVrhqqXcWw==
X-CSE-MsgGUID: Q2wzARbRR++tMRZJ1Lon5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6743616"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Nov 2026 17:07:50 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOlxD-000000009QB-13rO;
	Thu, 05 Nov 2026 01:07:47 +0000
Date: Thu, 05 Nov 2026 02:06:44 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android18-7.3 8/8]
 drivers/android/wonder/mac80211.c:1008:44: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202611050237.4SmT6LPE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   666207ebb676d3c6d2048c48dadd4ebde828e2cc
commit: 8a7c7d3954c2839bb2f6ebe475648ec14b8a2c9f [8/8] ANDROID: Add Wonder driver to GKI
config: x86_64-randconfig-r2303-20261104 (https://download.01.org/0day-ci/archive/20261105/202611050237.4SmT6LPE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050237.4SmT6LPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050237.4SmT6LPE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/wonder/mac80211.c:1008:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] cap_info @@     got unsigned short [usertype] cap @@
   drivers/android/wonder/mac80211.c:1008:44: sparse:     expected restricted __le16 [usertype] cap_info
   drivers/android/wonder/mac80211.c:1008:44: sparse:     got unsigned short [usertype] cap
>> drivers/android/wonder/mac80211.c:1015:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vht_cap_info @@     got unsigned int [usertype] cap @@
   drivers/android/wonder/mac80211.c:1015:49: sparse:     expected restricted __le32 [usertype] vht_cap_info
   drivers/android/wonder/mac80211.c:1015:49: sparse:     got unsigned int [usertype] cap

vim +1008 drivers/android/wonder/mac80211.c

   986	
   987	static int wonder_update_station_state(struct ieee80211_hw *hw,
   988				struct ieee80211_link_sta *link_sta,
   989				enum wondertap_station_action action)
   990	{
   991		struct wonder_sta_update_work *swork;
   992		struct ieee80211_sta *sta = link_sta->sta;
   993		struct wonder_data *wonder = hw->priv;
   994		struct wondertap_station_info *sta_info;
   995	
   996		swork = kzalloc_obj(*swork, GFP_ATOMIC);
   997		if (!swork)
   998			return -ENOMEM;
   999	
  1000		INIT_WORK(&swork->work, wonder_sta_update_worker);
  1001		swork->wonder = wonder;
  1002		swork->action = action;
  1003		sta_info = &swork->sta_info;
  1004		sta_info->aid = sta->aid;
  1005		memcpy(sta_info->mac, sta->addr, ETH_ALEN);
  1006	
  1007		if (link_sta->ht_cap.ht_supported) {
> 1008			sta_info->ht_capa.cap_info = link_sta->ht_cap.cap;
  1009			sta_info->ht_capa.ampdu_params_info = 0x1f;
  1010			sta_info->ht_capa.mcs = link_sta->ht_cap.mcs;
  1011			sta_info->capability_mask |= BIT(WONDERTAP_STATION_CAP_HT);
  1012		}
  1013	
  1014		if (link_sta->vht_cap.vht_supported) {
> 1015			sta_info->vht_capa.vht_cap_info = link_sta->vht_cap.cap;
  1016			sta_info->vht_capa.supp_mcs = link_sta->vht_cap.vht_mcs;
  1017			sta_info->capability_mask |= BIT(WONDERTAP_STATION_CAP_VHT);
  1018		}
  1019	
  1020		if (link_sta->he_cap.has_he) {
  1021			sta_info->he_capa = link_sta->he_cap.he_cap_elem;
  1022			sta_info->he_capa_len = sizeof(link_sta->he_cap.he_cap_elem);
  1023			sta_info->capability_mask |= BIT(WONDERTAP_STATION_CAP_HE);
  1024		}
  1025	
  1026		queue_work(wonder->workqueue, &swork->work);
  1027		return 0;
  1028	}
  1029	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
