Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9CD3033C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771622794; cv=none; b=nIh3GbFTWpOIXtn0nRRHPKT0r7eWRkXzbm/td6xOohcHsr69z29vpAKs8I4GvNIy3VGKEJ/G1LSlJNFQnHv58z/kTsoq2KM3vyEJXSvEdsNWEQw4Yb1RZMoV13PkWJu1Jd/77EUxYJV+1uz6H8gtwpvXLsMBiupRsaF48GeVTJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771622794; c=relaxed/simple;
	bh=0fPbO5+0s8rqaK35nuZoKpfDz9nykXymSDGwBXHxcbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lG2K7EBVuwnTCTIaCVRk8MtpSdVX5UNDJO8U2IcioL//XFx4eWq6iGPcaPS9hIdmI/iHXTlTTsm7SVfHHZh+CGCunRU6PY+49BQdQfwc4ccTo+mAvxtoo9caTeHWjqKM7FcCD4JFo9eUS30nZW6z2t+ogeh7OpwNvSAcGLl5skE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxRuoh9g; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxRuoh9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771622792; x=1803158792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0fPbO5+0s8rqaK35nuZoKpfDz9nykXymSDGwBXHxcbw=;
  b=gxRuoh9g6HNIJW/0ANZThF76yRqoFaFQZmlWQz7QP0UItF5f3wkQ4Cc3
   j/5iPowMpsHS4qExKoANPRmuYTcBTzCHR9lzd1mcLcjJhFVxxMvJKYGhb
   +EwPBaQa/aJAG1VmfGLETP6B0CWI2kYgjiDwxo1MLtsKEJ011ZkYuKaNg
   5uJMAnhGbenkqq19jzW8PjI2Tvpwhrv8YtMdD/D/PDFqUXevxB5S7JQSs
   UEieMLBXDaw5HsCSlxtT5tk5X6DkUtjNfnwixrVlkZx9CJJ+i4vNu6GaY
   S3iHmhTrCZzhliw21yrUX1kA7DGNGYJ5RRMsLqcZ7QaFzRQ/s1gJqn/EA
   g==;
X-CSE-ConnectionGUID: a99wsIM+Rm6SpapGwygSWw==
X-CSE-MsgGUID: DEOxYhoCQm+68FQcLHIPGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72424494"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72424494"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 13:26:32 -0800
X-CSE-ConnectionGUID: wfetr+DSSYOYp/c7mg75Vg==
X-CSE-MsgGUID: eATw40VKSuSprgEo7hmnIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213483527"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2026 13:26:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtY16-000000014UG-35Xa;
	Fri, 20 Feb 2026 21:26:28 +0000
Date: Sat, 21 Feb 2026 05:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/8] wifi: mac80211: refactor RX link_id and station
 handling
Message-ID: <202602210532.zK4Zu9OG-lkp@intel.com>
References: <20260220151929.5b3a42e30504.I8abe3601d0335dca22d48bcee864817cfccf0de0@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220151929.5b3a42e30504.I8abe3601d0335dca22d48bcee864817cfccf0de0@changeid>

Hi Benjamin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master next-20260220]
[cannot apply to v6.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Berg/wifi-iwlwifi-use-link_sta-internally-to-the-driver/20260220-222422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260220151929.5b3a42e30504.I8abe3601d0335dca22d48bcee864817cfccf0de0%40changeid
patch subject: [RFC PATCH 3/8] wifi: mac80211: refactor RX link_id and station handling
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260221/202602210532.zK4Zu9OG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210532.zK4Zu9OG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210532.zK4Zu9OG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mac80211.c: In function 'mt76_rx_convert':
>> drivers/net/wireless/mediatek/mt76/mac80211.c:1282:25: error: 'struct ieee80211_rx_status' has no member named 'link_valid'; did you mean 'link_id'?
    1282 |                 status->link_valid = mstat.wcid->link_valid;
         |                         ^~~~~~~~~~
         |                         link_id
   drivers/net/wireless/mediatek/mt76/mac80211.c: In function 'mt76_rx_complete':
   drivers/net/wireless/mediatek/mt76/mac80211.c:1522:39: error: passing argument 2 of 'ieee80211_rx_list' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1522 |                 ieee80211_rx_list(hw, sta, skb, &list);
         |                                       ^~~
         |                                       |
         |                                       struct ieee80211_sta *
   In file included from drivers/net/wireless/mediatek/mt76/mt76.h:18,
                    from drivers/net/wireless/mediatek/mt76/mac80211.c:7:
   include/net/mac80211.h:5220:51: note: expected 'struct ieee80211_link_sta *' but argument is of type 'struct ieee80211_sta *'
    5220 |                        struct ieee80211_link_sta *link_sta,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/net/wireless/mediatek/mt76/mac80211.c:1531:47: error: passing argument 2 of 'ieee80211_rx_list' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1531 |                         ieee80211_rx_list(hw, sta, skb, &list);
         |                                               ^~~
         |                                               |
         |                                               struct ieee80211_sta *
   In file included from drivers/net/wireless/mediatek/mt76/mt76.h:18,
                    from drivers/net/wireless/mediatek/mt76/mac80211.c:7:
   include/net/mac80211.h:5220:51: note: expected 'struct ieee80211_link_sta *' but argument is of type 'struct ieee80211_sta *'
    5220 |                        struct ieee80211_link_sta *link_sta,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/net/wireless/realtek/rtw89/core.c: In function 'rtw89_vif_rx_stats_iter':
>> drivers/net/wireless/realtek/rtw89/core.c:2992:28: error: 'struct ieee80211_rx_status' has no member named 'link_valid'; did you mean 'link_id'?
    2992 |                 rx_status->link_valid = true;
         |                            ^~~~~~~~~~
         |                            link_id


vim +1282 drivers/net/wireless/mediatek/mt76/mac80211.c

4550fb9e98104f Felix Fietkau    2022-02-04  1231  
bfc394dd65ef47 Felix Fietkau    2019-10-11  1232  static void
bfc394dd65ef47 Felix Fietkau    2019-10-11  1233  mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
bfc394dd65ef47 Felix Fietkau    2019-10-11  1234  		struct ieee80211_hw **hw,
bfc394dd65ef47 Felix Fietkau    2019-10-11  1235  		struct ieee80211_sta **sta)
4e34249e9565dc Felix Fietkau    2018-01-24  1236  {
4e34249e9565dc Felix Fietkau    2018-01-24  1237  	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
abe3f3da670981 Ryder Lee        2021-08-25  1238  	struct ieee80211_hdr *hdr = mt76_skb_get_hdr(skb);
4e34249e9565dc Felix Fietkau    2018-01-24  1239  	struct mt76_rx_status mstat;
4e34249e9565dc Felix Fietkau    2018-01-24  1240  
4e34249e9565dc Felix Fietkau    2018-01-24  1241  	mstat = *((struct mt76_rx_status *)skb->cb);
4e34249e9565dc Felix Fietkau    2018-01-24  1242  	memset(status, 0, sizeof(*status));
4e34249e9565dc Felix Fietkau    2018-01-24  1243  
6855bebea8f893 Howard Hsu       2025-09-15  1244  	skb->priority = mstat.qos_ctl & IEEE80211_QOS_CTL_TID_MASK;
6855bebea8f893 Howard Hsu       2025-09-15  1245  
4e34249e9565dc Felix Fietkau    2018-01-24  1246  	status->flag = mstat.flag;
4e34249e9565dc Felix Fietkau    2018-01-24  1247  	status->freq = mstat.freq;
4e34249e9565dc Felix Fietkau    2018-01-24  1248  	status->enc_flags = mstat.enc_flags;
4e34249e9565dc Felix Fietkau    2018-01-24  1249  	status->encoding = mstat.encoding;
4e34249e9565dc Felix Fietkau    2018-01-24  1250  	status->bw = mstat.bw;
021af945997ffa Shayne Chen      2023-03-03  1251  	if (status->encoding == RX_ENC_EHT) {
021af945997ffa Shayne Chen      2023-03-03  1252  		status->eht.ru = mstat.eht.ru;
021af945997ffa Shayne Chen      2023-03-03  1253  		status->eht.gi = mstat.eht.gi;
021af945997ffa Shayne Chen      2023-03-03  1254  	} else {
af4a2f2fdd6fe4 Ryder Lee        2020-04-25  1255  		status->he_ru = mstat.he_ru;
af4a2f2fdd6fe4 Ryder Lee        2020-04-25  1256  		status->he_gi = mstat.he_gi;
af4a2f2fdd6fe4 Ryder Lee        2020-04-25  1257  		status->he_dcm = mstat.he_dcm;
021af945997ffa Shayne Chen      2023-03-03  1258  	}
4e34249e9565dc Felix Fietkau    2018-01-24  1259  	status->rate_idx = mstat.rate_idx;
4e34249e9565dc Felix Fietkau    2018-01-24  1260  	status->nss = mstat.nss;
4e34249e9565dc Felix Fietkau    2018-01-24  1261  	status->band = mstat.band;
4e34249e9565dc Felix Fietkau    2018-01-24  1262  	status->signal = mstat.signal;
4e34249e9565dc Felix Fietkau    2018-01-24  1263  	status->chains = mstat.chains;
d515fdca46e729 Felix Fietkau    2019-08-28  1264  	status->ampdu_reference = mstat.ampdu_ref;
0fda6d7bb5a29b Ryder Lee        2021-03-30  1265  	status->device_timestamp = mstat.timestamp;
0fda6d7bb5a29b Ryder Lee        2021-03-30  1266  	status->mactime = mstat.timestamp;
a71b648e352787 Ryder Lee        2022-10-14  1267  	status->signal = mt76_rx_signal(mstat.chains, mstat.chain_signal);
4550fb9e98104f Felix Fietkau    2022-02-04  1268  	if (status->signal <= -128)
4550fb9e98104f Felix Fietkau    2022-02-04  1269  		status->flag |= RX_FLAG_NO_SIGNAL_VAL;
4e34249e9565dc Felix Fietkau    2018-01-24  1270  
abe3f3da670981 Ryder Lee        2021-08-25  1271  	if (ieee80211_is_beacon(hdr->frame_control) ||
abe3f3da670981 Ryder Lee        2021-08-25  1272  	    ieee80211_is_probe_resp(hdr->frame_control))
abe3f3da670981 Ryder Lee        2021-08-25  1273  		status->boottime_ns = ktime_get_boottime_ns();
abe3f3da670981 Ryder Lee        2021-08-25  1274  
4e34249e9565dc Felix Fietkau    2018-01-24  1275  	BUILD_BUG_ON(sizeof(mstat) > sizeof(skb->cb));
13381dcdb3acad Ryder Lee        2019-08-21  1276  	BUILD_BUG_ON(sizeof(status->chain_signal) !=
13381dcdb3acad Ryder Lee        2019-08-21  1277  		     sizeof(mstat.chain_signal));
13381dcdb3acad Ryder Lee        2019-08-21  1278  	memcpy(status->chain_signal, mstat.chain_signal,
13381dcdb3acad Ryder Lee        2019-08-21  1279  	       sizeof(mstat.chain_signal));
9c68a57bc22d8c Felix Fietkau    2018-01-24  1280  
4f0f33d2747f20 Sean Wang        2024-07-06  1281  	if (mstat.wcid) {
4f0f33d2747f20 Sean Wang        2024-07-06 @1282  		status->link_valid = mstat.wcid->link_valid;
4f0f33d2747f20 Sean Wang        2024-07-06  1283  		status->link_id = mstat.wcid->link_id;
4f0f33d2747f20 Sean Wang        2024-07-06  1284  	}
4f0f33d2747f20 Sean Wang        2024-07-06  1285  
bfc394dd65ef47 Felix Fietkau    2019-10-11  1286  	*sta = wcid_to_sta(mstat.wcid);
128c9b7d6235b9 Lorenzo Bianconi 2022-07-04  1287  	*hw = mt76_phy_hw(dev, mstat.phy_idx);
4e34249e9565dc Felix Fietkau    2018-01-24  1288  }
4e34249e9565dc Felix Fietkau    2018-01-24  1289  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
