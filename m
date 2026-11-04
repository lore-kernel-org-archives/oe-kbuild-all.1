Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809140;
	b=ZNZ/p8LmYsl9GmNOqrahrmBLNlvr33OXiaRqg4rI7lJtscTPEt3uff8xlPvV8z9dLW1s
	 lpJjA4u/IWTwAcrZ4RTTyRm/+by0YGQ6Spd70SnNHNEvWfjExt3S3iQw7dB+Fl4YmQL+w
	 wrJFsePvqgGfIJHjqmTbgSVIktQpFGnMQTAfG5uEMXqX4Jew4vTXiavyX6Tt4Jcd9oE6p
	 rlj7H7Jh9vBI2+9M74d6qgb99oz9AYDvFIqAkZh/F6+0Me5ejZQxsdP0eeWH1QPXoh1OH
	 kOZinShB35IwlluSKBNmfbEU8Bj1PWmcGPMLA03wkAGQaMH+MhOytL93wD+kLi/lzKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809140;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hWt8Nh5aa/NAaAQcdUS3NCzDpZ9vbHpEVRswZNG5YNg=;
	b=OgD+ZkiarYxHwv47EgIO6vKdW6QORb+GVJqrlHJyIThqtEbWGLrQjqTpS8nLrzUdBmcc
	 /ycqmsmwhdC7jJ8MBSCHgLKEJ4z2dYw5XB1EEi8fgOFqCaan8blTSFciZaWct3M+j7JPf
	 rb7okpL9MFEfvOETal1QqTrQGrgO1skcjcCsgvCMrrFql9exAOEiQ+4B0fk2zdOiEl7cK
	 cRH2UdElEU5tcaqTWzW1oSGEFAbRWO4mAK/2y25XugZGAnYRfW0q7ed6QaRLDwUk0KoTA
	 FEJk3aV1PmeuLp4JBZ/XUjirmGyr22ILYT3kK9052QPY+YMtaV0MyHBgTeU1FajqOOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZKVwi9iN;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC53C606AAD8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 16:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC53C606AAD8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZKVwi9iN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793809139; x=1825345139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sYiOQuBYqid09I+mMVkZpI/PoAwNsfLnhRc6uGZfzTU=;
  b=ZKVwi9iNWJK4F0oC4m3JzpRE53vryChTBqSXw7WSTzr4apv32lW7D/FT
   fFrMjR+/fpovgdLV964RQGzkgXlz11Bj5nmq4vhLbCb5Itnxd1caWlkWJ
   Sc3EIHbuTXAN2iXonZ+xHBkVCWT7JnGuy7PmwrQIrA5pFjLFAyTu6Rhxg
   cJ4I6tEPcJjeV2srk/W+CrJn2yRdnbgSin5dJt4zCs1pq89jNejetATNi
   JrM5Iwj5/PIL86du1DbcOlyqQiT9wFrcB21eUToAMo6S4M5mtAkhVgKwv
   5X6zbYGtZu+xLGsBntc8LBmxVKGdKlHryRM/Gn0TZ4FZ4eMF8HVsh6tiP
   w==;
X-CSE-ConnectionGUID: L4zVpPZyTmCGmjo+7fNAYg==
X-CSE-MsgGUID: 8e1DnpX2TXiVlS7lDp+PRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2448590"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2448590"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 08:18:59 -0800
X-CSE-ConnectionGUID: +1oYTMjAQwCDn4EDRbS2uA==
X-CSE-MsgGUID: PGkM6NguSFaT5yeXHJhF9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6639445"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Nov 2026 08:18:57 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOdhO-00000000keZ-27lq;
	Wed, 04 Nov 2026 16:18:54 +0000
Date: Thu, 5 Nov 2026 00:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
	Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>
Subject: Re: [PATCH wireless-next 7/7] wifi: mac80211: use sta->active_links
 in for_each_sta_active_link()
Message-ID: <202611042348.ZiFAbrdl-lkp@intel.com>
References: <20261102224349.e1d1ed2eef37.I0f5c26e0f6a05feaf5c578fa048ca5586530f0ba@changeid>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102224349.e1d1ed2eef37.I0f5c26e0f6a05feaf5c578fa048ca5586530f0ba@changeid>

Hi Johannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/wifi-mac80211-rename-ieee80211_sta_activate_link/20261102-224237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20261102224349.e1d1ed2eef37.I0f5c26e0f6a05feaf5c578fa048ca5586530f0ba%40changeid
patch subject: [PATCH wireless-next 7/7] wifi: mac80211: use sta->active_links in for_each_sta_active_link()
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20261104/202611042348.ZiFAbrdl-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611042348.ZiFAbrdl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611042348.ZiFAbrdl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlwifi/mld/sta.c: In function 'iwl_mld_remove_sta':
>> drivers/net/wireless/intel/iwlwifi/mld/sta.c:913:21: error: 'vif' undeclared (first use in this function)
     913 |                 if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
         |                     ^~~
   drivers/net/wireless/intel/iwlwifi/mld/sta.c:913:21: note: each undeclared identifier is reported only once for each function it appears in


vim +/vif +913 drivers/net/wireless/intel/iwlwifi/mld/sta.c

d1e879ec600f9b Miri Korenblit 2025-02-16  890  
d1e879ec600f9b Miri Korenblit 2025-02-16  891  void iwl_mld_remove_sta(struct iwl_mld *mld, struct ieee80211_sta *sta)
d1e879ec600f9b Miri Korenblit 2025-02-16  892  {
d1e879ec600f9b Miri Korenblit 2025-02-16  893  	struct ieee80211_link_sta *link_sta;
d1e879ec600f9b Miri Korenblit 2025-02-16  894  	u8 link_id;
d1e879ec600f9b Miri Korenblit 2025-02-16  895  
d1e879ec600f9b Miri Korenblit 2025-02-16  896  	lockdep_assert_wiphy(mld->wiphy);
d1e879ec600f9b Miri Korenblit 2025-02-16  897  
d1e879ec600f9b Miri Korenblit 2025-02-16  898  	/* Tell the HW to flush the queues */
d1e879ec600f9b Miri Korenblit 2025-02-16  899  	iwl_mld_flush_sta_txqs(mld, sta);
d1e879ec600f9b Miri Korenblit 2025-02-16  900  
d1e879ec600f9b Miri Korenblit 2025-02-16  901  	/* Wait for trans to empty its queues */
d1e879ec600f9b Miri Korenblit 2025-02-16  902  	iwl_mld_wait_sta_txqs_empty(mld, sta);
d1e879ec600f9b Miri Korenblit 2025-02-16  903  
d1e879ec600f9b Miri Korenblit 2025-02-16  904  	/* Now we can remove the queues */
d1e879ec600f9b Miri Korenblit 2025-02-16  905  	for (int i = 0; i < ARRAY_SIZE(sta->txq); i++)
d1e879ec600f9b Miri Korenblit 2025-02-16  906  		iwl_mld_remove_txq(mld, sta->txq[i]);
d1e879ec600f9b Miri Korenblit 2025-02-16  907  
4fa80ba223dd72 Johannes Berg  2026-11-02  908  	for_each_sta_active_link(sta, link_sta, link_id) {
d1e879ec600f9b Miri Korenblit 2025-02-16  909  		/* Mac8011 will remove the groupwise keys after the sta is
d1e879ec600f9b Miri Korenblit 2025-02-16  910  		 * removed, but FW expects all the keys to be removed before
d1e879ec600f9b Miri Korenblit 2025-02-16  911  		 * the STA is, so remove them all here.
d1e879ec600f9b Miri Korenblit 2025-02-16  912  		 */
67128af05c6419 Johannes Berg  2025-03-09 @913  		if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
d1e879ec600f9b Miri Korenblit 2025-02-16  914  			iwl_mld_remove_ap_keys(mld, vif, sta, link_id);
d1e879ec600f9b Miri Korenblit 2025-02-16  915  
d1e879ec600f9b Miri Korenblit 2025-02-16  916  		/* Remove the link_sta */
d1e879ec600f9b Miri Korenblit 2025-02-16  917  		iwl_mld_remove_link_sta(mld, link_sta);
d1e879ec600f9b Miri Korenblit 2025-02-16  918  	}
d1e879ec600f9b Miri Korenblit 2025-02-16  919  
d1e879ec600f9b Miri Korenblit 2025-02-16  920  	iwl_mld_destroy_sta(sta);
d1e879ec600f9b Miri Korenblit 2025-02-16  921  }
d1e879ec600f9b Miri Korenblit 2025-02-16  922  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
