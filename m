Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5802D8376
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 06:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788362; cv=none; b=AQcVKH6LZ7JeAiLh/aM7moXLDV1ItGxcamLwqF1ukTjSePXhXnFnFZO4ovoG6rRu0Hc77XIXYJZioHprGYvnH9hHKwwH55PR1eRgUwu5K709xxFUUSRFHHnHpFMcTP8dIGZiZ7sfQrI3VZVKTtpgEe4vJO5q+dL4pWjLUp3ipy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788362; c=relaxed/simple;
	bh=QG9a/axK+3Wy9IRkeFuOiBJDrnnjxN/59Hf0XDNZHN8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fYvoK/Iha7WBw33rZ9fDEYgACfpiuyWax0xjAOtOzsCbk8s4ejl+9HFuwNJjXXBdIKGQ1Dz8CQ0BKYs0YgJeI+M2IUwx7NKyHfl3zMWErs3ylIOa2dB5AOAFzNGR281yYSU2+G8qbRPb+RGmPUiAGfHirC42Z9yXEhInG69HW7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HItn7PQk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HItn7PQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784788358; x=1816324358;
  h=date:from:to:cc:subject:message-id;
  bh=QG9a/axK+3Wy9IRkeFuOiBJDrnnjxN/59Hf0XDNZHN8=;
  b=HItn7PQkzf0XseSEwmEaNFNMH7kNU2wHY3idddPkqXLE+EYTj3MzA7zI
   EWmc6919UJA+mK48RnJAJQl91WrjJ5A3mcyEgTBIk+X6lf7lq2ratuq4j
   Z+Rlt9kYmqmLjDMxTxsERo4pHYYUYGv7sHjxf+jQsvjUpqvYODrfeqGT4
   CR+fdwo9sYF6QJ6AJg4CCblbKLimKP8EI34xjUM5iCOEfAPTbAyA1pvK4
   6cUtHTnIpw+tN2fBBO24uTJV7SzpkGg3ruJI2yRw+I6Bv+VNHdtGKF+fU
   PlVSrTk+MQcpynYI+M9k2BknjVYOG5pEh19pf79A7nQRvOd0aUITnHkth
   w==;
X-CSE-ConnectionGUID: +tntsCv7SiSv1PKhkCnSaQ==
X-CSE-MsgGUID: K2T6fVWqSfunxLk7KCu5Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84412836"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="84412836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 23:32:37 -0700
X-CSE-ConnectionGUID: rHqvuk3bQiClUgfLDyt9SA==
X-CSE-MsgGUID: u7XWZnDlQ4SsIFaVZ95eoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="253966707"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jul 2026 23:32:36 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmmyv-000000000iQ-1FTC;
	Thu, 23 Jul 2026 06:32:33 +0000
Date: Thu, 23 Jul 2026 08:31:38 +0200
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 8471/8578] net/mac80211/mlme.c:7279:17:
 error: label 'abandon_assoc' used but not defined
Message-ID: <202607230830.SdkvNGwD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b4515cf4156356e8f4fe6e0fdc17f59adab9772f
commit: f47482e0a14facbec093b8e9dcb299485dea5502 [8471/8578] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20260723/202607230830.SdkvNGwD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607230830.SdkvNGwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607230830.SdkvNGwD-lkp@intel.com/

Note: the linux-next/master HEAD b4515cf4156356e8f4fe6e0fdc17f59adab9772f builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   net/mac80211/mlme.c: In function 'ieee80211_rx_mgmt_assoc_resp':
>> net/mac80211/mlme.c:7279:17: error: label 'abandon_assoc' used but not defined
    7279 |                 goto abandon_assoc;
         |                 ^~~~


vim +/abandon_assoc +7279 net/mac80211/mlme.c

bee7f58699a406 net/mac80211/mlme.c          Johannes Berg            2013-02-07  7189  
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7190  static void ieee80211_rx_mgmt_assoc_resp(struct ieee80211_sub_if_data *sdata,
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7191  					 struct ieee80211_mgmt *mgmt,
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7192  					 size_t len)
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7193  {
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7194  	struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7195  	struct ieee80211_mgd_assoc_data *assoc_data = ifmgd->assoc_data;
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7196  	enum assoc_status assoc_status = ASSOC_ABANDON;
035ed430ce6a2c net/mac80211/mlme.c          Zhao Li                  2026-06-12  7197  	u16 capab_info, status_code, aid = 0;
ea5cba269fb1fe net/mac80211/mlme.c          Johannes Berg            2022-08-16  7198  	struct ieee80211_elems_parse_params parse_params = {
ea5cba269fb1fe net/mac80211/mlme.c          Johannes Berg            2022-08-16  7199  		.bss = NULL,
ea5cba269fb1fe net/mac80211/mlme.c          Johannes Berg            2022-08-16  7200  		.link_id = -1,
ea5cba269fb1fe net/mac80211/mlme.c          Johannes Berg            2022-08-16  7201  		.from_ap = true,
68eb1b791ac8da net/mac80211/mlme.c          Johannes Berg            2025-11-05  7202  		.type = le16_to_cpu(mgmt->frame_control) & IEEE80211_FCTL_TYPE,
ea5cba269fb1fe net/mac80211/mlme.c          Johannes Berg            2022-08-16  7203  	};
e2ae5b19ac56af net/mac80211/mlme.c          Kavita Kavita            2026-05-04  7204  	struct sta_info *sta;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7205  	int ac;
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7206  	const u8 *elem_start;
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7207  	unsigned int elem_len;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7208  	bool reassoc;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7209  	struct ieee80211_event event = {
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7210  		.type = MLME_EVENT,
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7211  		.u.mlme.data = ASSOC_EVENT,
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7212  	};
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7213  	struct ieee80211_prep_tx_info info = {};
8e4687f6061ec0 net/mac80211/mlme.c          Kalle Valo               2023-10-12  7214  	struct cfg80211_rx_assoc_resp_data resp = {
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7215  		.uapsd_queues = -1,
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7216  	};
78a6a43aaf8718 net/mac80211/mlme.c          Johannes Berg            2022-09-21  7217  	u8 ap_mld_addr[ETH_ALEN] __aligned(2);
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7218  	unsigned int link_id;
ee63609454838e net/mac80211/mlme.c          Lachlan Hodges           2025-07-25  7219  	u16 max_aid = IEEE80211_MAX_AID;
d3c990fb26b78f net/mac80211/ieee80211_sta.c Ron Rindjunsky           2007-11-26  7220  
076fc8775dafe9 net/mac80211/mlme.c          Johannes Berg            2023-08-29  7221  	lockdep_assert_wiphy(sdata->local->hw.wiphy);
3f2355cb9111ac net/mac80211/mlme.c          Luis R. Rodriguez        2008-11-12  7222  
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7223  	if (!assoc_data)
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7224  		return;
f0706e828e96d0 net/mac80211/ieee80211_sta.c Jiri Benc                2007-05-05  7225  
e3d91a681cb5bc net/mac80211/mlme.c          Benjamin Berg            2025-01-02  7226  	info.link_id = assoc_data->assoc_link_id;
e3d91a681cb5bc net/mac80211/mlme.c          Benjamin Berg            2025-01-02  7227  
310c8387c63830 net/mac80211/mlme.c          Johannes Berg            2024-01-29  7228  	parse_params.mode =
310c8387c63830 net/mac80211/mlme.c          Johannes Berg            2024-01-29  7229  		assoc_data->link[assoc_data->assoc_link_id].conn.mode;
310c8387c63830 net/mac80211/mlme.c          Johannes Berg            2024-01-29  7230  
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7231  	if (!ether_addr_equal(assoc_data->ap_addr, mgmt->bssid) ||
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7232  	    !ether_addr_equal(assoc_data->ap_addr, mgmt->sa))
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7233  		return;
09a740ce352e1a net/mac80211/mlme.c          Thomas Pedersen          2020-09-21  7234  
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7235  	/*
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7236  	 * AssocResp and ReassocResp have identical structure, so process both
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7237  	 * of them in this function.
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7238  	 */
09a740ce352e1a net/mac80211/mlme.c          Thomas Pedersen          2020-09-21  7239  
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7240  	if (len < 24 + 6)
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7241  		return;
f0706e828e96d0 net/mac80211/ieee80211_sta.c Jiri Benc                2007-05-05  7242  
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7243  	reassoc = ieee80211_is_reassoc_resp(mgmt->frame_control);
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7244  	capab_info = le16_to_cpu(mgmt->u.assoc_resp.capab_info);
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7245  	status_code = le16_to_cpu(mgmt->u.assoc_resp.status_code);
ee63609454838e net/mac80211/mlme.c          Lachlan Hodges           2025-07-25  7246  	if (assoc_data->s1g) {
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7247  		elem_start = mgmt->u.s1g_assoc_resp.variable;
ee63609454838e net/mac80211/mlme.c          Lachlan Hodges           2025-07-25  7248  		max_aid = IEEE80211_MAX_SUPPORTED_S1G_AID;
ee63609454838e net/mac80211/mlme.c          Lachlan Hodges           2025-07-25  7249  	} else {
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7250  		elem_start = mgmt->u.assoc_resp.variable;
ee63609454838e net/mac80211/mlme.c          Lachlan Hodges           2025-07-25  7251  	}
f0706e828e96d0 net/mac80211/ieee80211_sta.c Jiri Benc                2007-05-05  7252  
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7253  	/*
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7254  	 * Note: this may not be perfect, AP might misbehave - if
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7255  	 * anyone needs to rely on perfect complete notification
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7256  	 * with the exact right subtype, then we need to track what
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7257  	 * we actually transmitted.
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7258  	 */
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7259  	info.subtype = reassoc ? IEEE80211_STYPE_REASSOC_REQ :
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7260  				 IEEE80211_STYPE_ASSOC_REQ;
77fdaa12cea26c net/mac80211/mlme.c          Johannes Berg            2009-07-07  7261  
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7262  	if (assoc_data->fils_kek_len &&
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7263  	    fils_decrypt_assoc_resp(sdata, (u8 *)mgmt, &len, assoc_data) < 0)
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7264  		return;
37799e52a29af2 net/mac80211/mlme.c          Johannes Berg            2013-03-26  7265  
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7266  	elem_len = len - (elem_start - (u8 *)mgmt);
ea5cba269fb1fe net/mac80211/mlme.c          Johannes Berg            2022-08-16  7267  	parse_params.start = elem_start;
ea5cba269fb1fe net/mac80211/mlme.c          Johannes Berg            2022-08-16  7268  	parse_params.len = elem_len;
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7269  	struct ieee802_11_elems *elems __free(kfree) =
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7270  		ieee802_11_parse_elems_full(&parse_params);
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7271  	if (!elems)
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7272  		goto notify_driver;
37799e52a29af2 net/mac80211/mlme.c          Johannes Berg            2013-03-26  7273  
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7274  	if (elems->aid_resp)
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7275  		aid = le16_to_cpu(elems->aid_resp->aid);
035ed430ce6a2c net/mac80211/mlme.c          Zhao Li                  2026-06-12  7276  	else if (!assoc_data->s1g)
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7277  		aid = le16_to_cpu(mgmt->u.assoc_resp.aid);
035ed430ce6a2c net/mac80211/mlme.c          Zhao Li                  2026-06-12  7278  	else if (status_code == WLAN_STATUS_SUCCESS)
035ed430ce6a2c net/mac80211/mlme.c          Zhao Li                  2026-06-12 @7279  		goto abandon_assoc;
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7280  
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7281  	/*
ee63609454838e net/mac80211/mlme.c          Lachlan Hodges           2025-07-25  7282  	 * The 5 MSB of the AID field are reserved for a non-S1G STA. For
ee63609454838e net/mac80211/mlme.c          Lachlan Hodges           2025-07-25  7283  	 * an S1G STA the 3 MSBs are reserved.
ee63609454838e net/mac80211/mlme.c          Lachlan Hodges           2025-07-25  7284  	 * (802.11-2016 9.4.1.8 AID field).
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7285  	 */
ee63609454838e net/mac80211/mlme.c          Lachlan Hodges           2025-07-25  7286  	aid &= assoc_data->s1g ? 0x1fff : 0x7ff;
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7287  
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7288  	sdata_info(sdata,
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7289  		   "RX %sssocResp from %pM (capab=0x%x status=%d aid=%d)\n",
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7290  		   reassoc ? "Rea" : "A", assoc_data->ap_addr,
9f39e2cc2b0122 net/mac80211/mlme.c          Johannes Berg            2026-03-03  7291  		   capab_info, status_code, aid);
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7292  
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7293  	ifmgd->broken_ap = false;
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7294  
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7295  	if (status_code == WLAN_STATUS_ASSOC_REJECTED_TEMPORARILY &&
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7296  	    elems->timeout_int &&
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7297  	    elems->timeout_int->type == WLAN_TIMEOUT_ASSOC_COMEBACK) {
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7298  		u32 tu, ms;
37799e52a29af2 net/mac80211/mlme.c          Johannes Berg            2013-03-26  7299  
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7300  		cfg80211_assoc_comeback(sdata->dev, assoc_data->ap_addr,
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7301  					le32_to_cpu(elems->timeout_int->value));
5d24828d05f37a net/mac80211/mlme.c          Johannes Berg            2021-09-20  7302  
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7303  		tu = le32_to_cpu(elems->timeout_int->value);
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7304  		ms = tu * 1024 / 1000;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7305  		sdata_info(sdata,
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7306  			   "%pM rejected association temporarily; comeback duration %u TU (%u ms)\n",
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7307  			   assoc_data->ap_addr, tu, ms);
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7308  		assoc_data->timeout = jiffies + msecs_to_jiffies(ms);
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7309  		assoc_data->timeout_started = true;
b133fdf07db849 net/mac80211/mlme.c          Jouni Malinen            2023-12-19  7310  		assoc_data->comeback = true;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7311  		if (ms > IEEE80211_ASSOC_TIMEOUT)
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7312  			run_again(sdata, assoc_data->timeout);
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7313  		goto notify_driver;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7314  	}
1b3a2e494bc793 net/mac80211/mlme.c          Johannes Berg            2013-03-26  7315  
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7316  	if (status_code != WLAN_STATUS_SUCCESS) {
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7317  		sdata_info(sdata, "%pM denied association (code=%d)\n",
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7318  			   assoc_data->ap_addr, status_code);
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7319  		event.u.mlme.status = MLME_DENIED;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7320  		event.u.mlme.reason = status_code;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7321  		drv_event_callback(sdata->local, sdata, &event);
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7322  	} else {
ee63609454838e net/mac80211/mlme.c          Lachlan Hodges           2025-07-25  7323  		if (aid == 0 || aid > max_aid) {
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7324  			sdata_info(sdata,
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7325  				   "invalid AID value %d (out of range), turn off PS\n",
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7326  				   aid);
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7327  			aid = 0;
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7328  			ifmgd->broken_ap = true;
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7329  		}
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7330  
f1871abd27641c net/mac80211/mlme.c          Ilan Peer                2023-06-08  7331  		if (ieee80211_vif_is_mld(&sdata->vif)) {
3aca362a4c1411 net/mac80211/mlme.c          Johannes Berg            2024-01-02  7332  			struct ieee80211_mle_basic_common_info *common;
3aca362a4c1411 net/mac80211/mlme.c          Johannes Berg            2024-01-02  7333  
a286de1aa38f7e net/mac80211/mlme.c          Ilan Peer                2023-06-16  7334  			if (!elems->ml_basic) {
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7335  				sdata_info(sdata,
3aca362a4c1411 net/mac80211/mlme.c          Johannes Berg            2024-01-02  7336  					   "MLO association with %pM but no (basic) multi-link element in response!\n",
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7337  					   assoc_data->ap_addr);
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7338  				goto destroy_assoc_data;
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7339  			}
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7340  
a286de1aa38f7e net/mac80211/mlme.c          Ilan Peer                2023-06-16  7341  			common = (void *)elems->ml_basic->variable;
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7342  
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7343  			if (memcmp(assoc_data->ap_addr,
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7344  				   common->mld_mac_addr, ETH_ALEN)) {
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7345  				sdata_info(sdata,
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7346  					   "AP MLD MAC address mismatch: got %pM expected %pM\n",
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7347  					   common->mld_mac_addr,
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7348  					   assoc_data->ap_addr);
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7349  				goto destroy_assoc_data;
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7350  			}
a8b652604e39ff net/mac80211/mlme.c          Johannes Berg            2024-01-02  7351  
a8b652604e39ff net/mac80211/mlme.c          Johannes Berg            2024-01-02  7352  			sdata->vif.cfg.eml_cap =
a8b652604e39ff net/mac80211/mlme.c          Johannes Berg            2024-01-02  7353  				ieee80211_mle_get_eml_cap((const void *)elems->ml_basic);
a8b652604e39ff net/mac80211/mlme.c          Johannes Berg            2024-01-02  7354  			sdata->vif.cfg.eml_med_sync_delay =
a8b652604e39ff net/mac80211/mlme.c          Johannes Berg            2024-01-02  7355  				ieee80211_mle_get_eml_med_sync_delay((const void *)elems->ml_basic);
a8b652604e39ff net/mac80211/mlme.c          Johannes Berg            2024-01-02  7356  			sdata->vif.cfg.mld_capa_op =
a8b652604e39ff net/mac80211/mlme.c          Johannes Berg            2024-01-02  7357  				ieee80211_mle_get_mld_capa_op((const void *)elems->ml_basic);
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7358  		}
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7359  
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7360  		sdata->vif.cfg.aid = aid;
ee63609454838e net/mac80211/mlme.c          Lachlan Hodges           2025-07-25  7361  		sdata->vif.cfg.s1g = assoc_data->s1g;
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7362  
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7363  		if (!ieee80211_assoc_success(sdata, mgmt, elems,
6911458dc4283a net/mac80211/mlme.c          Johannes Berg            2022-07-12  7364  					     elem_start, elem_len)) {
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7365  			/* oops -- internal error -- send timeout for now */
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7366  			assoc_status = ASSOC_TIMEOUT;
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7367  			goto destroy_assoc_data;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7368  		}
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7369  		event.u.mlme.status = MLME_SUCCESS;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7370  		drv_event_callback(sdata->local, sdata, &event);
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7371  		sdata_info(sdata, "associated\n");
1b3a2e494bc793 net/mac80211/mlme.c          Johannes Berg            2013-03-26  7372  
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7373  		info.success = 1;
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7374  	}
1b3a2e494bc793 net/mac80211/mlme.c          Johannes Berg            2013-03-26  7375  
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7376  	for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS; link_id++) {
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7377  		struct ieee80211_link_data *link;
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7378  
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7379  		if (!assoc_data->link[link_id].bss)
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7380  			continue;
c2d052a3c41aa7 net/mac80211/mlme.c          Ilan Peer                2022-09-08  7381  
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7382  		resp.links[link_id].bss = assoc_data->link[link_id].bss;
234249d88b091d net/mac80211/mlme.c          Wen Gong                 2023-08-25  7383  		ether_addr_copy(resp.links[link_id].addr,
234249d88b091d net/mac80211/mlme.c          Wen Gong                 2023-08-25  7384  				assoc_data->link[link_id].addr);
c2d052a3c41aa7 net/mac80211/mlme.c          Ilan Peer                2022-09-08  7385  		resp.links[link_id].status = assoc_data->link[link_id].status;
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7386  
234249d88b091d net/mac80211/mlme.c          Wen Gong                 2023-08-25  7387  		link = sdata_dereference(sdata->link[link_id], sdata);
234249d88b091d net/mac80211/mlme.c          Wen Gong                 2023-08-25  7388  		if (!link)
234249d88b091d net/mac80211/mlme.c          Wen Gong                 2023-08-25  7389  			continue;
234249d88b091d net/mac80211/mlme.c          Wen Gong                 2023-08-25  7390  
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7391  		/* get uapsd queues configuration - same for all links */
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7392  		resp.uapsd_queues = 0;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7393  		for (ac = 0; ac < IEEE80211_NUM_ACS; ac++)
81151ce462e533 net/mac80211/mlme.c          Johannes Berg            2022-06-01  7394  			if (link->tx_conf[ac].uapsd)
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7395  				resp.uapsd_queues |= ieee80211_ac_to_qos_mask[ac];
8223ac199a3849 net/mac80211/mlme.c          Johannes Berg            2021-10-01  7396  	}
8223ac199a3849 net/mac80211/mlme.c          Johannes Berg            2021-10-01  7397  
f1871abd27641c net/mac80211/mlme.c          Ilan Peer                2023-06-08  7398  	if (ieee80211_vif_is_mld(&sdata->vif)) {
78a6a43aaf8718 net/mac80211/mlme.c          Johannes Berg            2022-09-21  7399  		ether_addr_copy(ap_mld_addr, sdata->vif.cfg.ap_addr);
78a6a43aaf8718 net/mac80211/mlme.c          Johannes Berg            2022-09-21  7400  		resp.ap_mld_addr = ap_mld_addr;
78a6a43aaf8718 net/mac80211/mlme.c          Johannes Berg            2022-09-21  7401  	}
78a6a43aaf8718 net/mac80211/mlme.c          Johannes Berg            2022-09-21  7402  
e2ae5b19ac56af net/mac80211/mlme.c          Kavita Kavita            2026-05-04  7403  	/*
e2ae5b19ac56af net/mac80211/mlme.c          Kavita Kavita            2026-05-04  7404  	 * If epp_peer set, unprotected (Re)Association Request/Response frames
e2ae5b19ac56af net/mac80211/mlme.c          Kavita Kavita            2026-05-04  7405  	 * are dropped, which ensures that the (re)association exchange is
e2ae5b19ac56af net/mac80211/mlme.c          Kavita Kavita            2026-05-04  7406  	 * encrypted over the air.
e2ae5b19ac56af net/mac80211/mlme.c          Kavita Kavita            2026-05-04  7407  	 */
e2ae5b19ac56af net/mac80211/mlme.c          Kavita Kavita            2026-05-04  7408  	sta = sta_info_get_bss(sdata, sdata->vif.cfg.ap_addr);
e2ae5b19ac56af net/mac80211/mlme.c          Kavita Kavita            2026-05-04  7409  	resp.assoc_encrypted = sta && sta->sta.epp_peer;
e2ae5b19ac56af net/mac80211/mlme.c          Kavita Kavita            2026-05-04  7410  
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7411  	resp.buf = (u8 *)mgmt;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7412  	resp.len = len;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7413  	resp.req_ies = ifmgd->assoc_req_ies;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7414  	resp.req_ies_len = ifmgd->assoc_req_ies_len;
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7415  	cfg80211_rx_assoc_resp(sdata->dev, &resp);
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7416  	assoc_status = status_code == WLAN_STATUS_SUCCESS ? ASSOC_SUCCESS :
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7417  							    ASSOC_REJECTED;
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7418  destroy_assoc_data:
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7419  	ieee80211_destroy_assoc_data(sdata, assoc_status, &info);
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7420  	return;
f13e573ab3f12e net/mac80211/mlme.c          Pagadala Yesu Anjaneyulu 2026-07-17  7421  
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7422  notify_driver:
61513162aa2d6c net/mac80211/mlme.c          Johannes Berg            2022-07-12  7423  	drv_mgd_complete_tx(sdata->local, sdata, &info);
77fdaa12cea26c net/mac80211/mlme.c          Johannes Berg            2009-07-07  7424  }
f0706e828e96d0 net/mac80211/ieee80211_sta.c Jiri Benc                2007-05-05  7425  

:::::: The code at line 7279 was first introduced by commit
:::::: 035ed430ce6a2c35b01e211844a9f0a7643e57a4 wifi: mac80211: avoid non-S1G AID fallback for S1G assoc

:::::: TO: Zhao Li <enderaoelyther@gmail.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
