Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6C62980A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 03:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784345904; cv=none; b=TCpotc65vMzbRsoxvbHJ7kVanrOvZgz5UP1b7s0lz36OCmh6L3v4QbTeER3JrbmCK6kV7rCdScqMIA8qahudFslL1eqF8V6k09o/SVxby8QSkyQdkHeTDwomG5L6kDAT3jIOA41TuO5inVIxE9ISY+SMN48YGRmEi1IF2SSYaoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784345904; c=relaxed/simple;
	bh=7pLdMQxQOuEUxuHjQ52Vxfigp6oxjFDhoKKLeaI0WdA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wb7AvZbmYXxc0Pg8W6vfEWhg4T5mpTRazMP0Zo2IvCilieuLb3uGdfixHwjJtrXUtyICPzUD8mbTdEaLQWGpQfOAl1sxV41INuZeRzdLUOV6yicJlQONh2tGys0hBHgq09mO5sNZhIL4I/s9Y9m/ZEWpxciGLHG6gKledP8voLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZbwn6/T; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZbwn6/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784345903; x=1815881903;
  h=date:from:to:cc:subject:message-id;
  bh=7pLdMQxQOuEUxuHjQ52Vxfigp6oxjFDhoKKLeaI0WdA=;
  b=bZbwn6/TpWU0SkA/q7KhDXUHgE93kFc5CiYcWRwxthaUnZ/99cxrH5JR
   CRGjgh2GfNR5en7Wdb/6TTjqaLhIDfNy2tFnJaRts26I8k6BRS3d54b3i
   r72Yka3m7KLLmGSArgFwwnN1jrIUQg/BiVQ6LOLE+WGOtA56GMT6NIF4U
   5Qw0PqJNzOBp7o5p5YI2auudpBC+r5p2VwMsNXHVBCv6UenJIJAI0zyWb
   L1pdn5wdTWUSrAO3lWEVQ412QBVUQlxLUAxy07nJyldcpiabCa7R3tj/y
   xs+GYkiPoqO62k7vid1Jum7fcAb3Mu/UjVHBjXym9PUUqkvlbV1gMpGNT
   A==;
X-CSE-ConnectionGUID: YdBuQ03RRx+SrVnubAfYLA==
X-CSE-MsgGUID: svpJ9lEyT4maSDsuxE/k7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="83998301"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="83998301"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 20:38:18 -0700
X-CSE-ConnectionGUID: MAwIPEI6RCWrwFoIMQvleA==
X-CSE-MsgGUID: gP6M+ZWYTHSjpfBMDhQAVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="250596953"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2026 20:38:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkvsU-00000000TQP-3qdJ;
	Sat, 18 Jul 2026 03:38:14 +0000
Date: Sat, 18 Jul 2026 11:37:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 0/2]
 drivers/android/wonder/mac80211.c:1008:44: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202607181146.oxbDsGia-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   7100382cb0b69db6c24a055ca4df75c9cc45fe50
commit: 8a7c7d3954c2839bb2f6ebe475648ec14b8a2c9f [0/2] ANDROID: Add Wonder driver to GKI
config: x86_64-randconfig-123-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181146.oxbDsGia-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181146.oxbDsGia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181146.oxbDsGia-lkp@intel.com/

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
