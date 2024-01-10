Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686BE5381
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 04:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4wa+ljt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704859874; x=1736395874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a4Vr+jfopSrLnTGFZKeJgu1FCfviqGKx3Wvs6dsCBw8=;
  b=U4wa+ljt2oLh5lxjx0OIOByG+xpybvybvlL87ukgNm+9lUmVSRCIW3IB
   oBNo3pL2Qrt8T2GkVRp3jSZOKEffvSpXLDDS9J0za4o55Lx3pOUh/cbbt
   Kp0PTyPB4Y4dtb9Y7gSh9jvWS5j1kEMy5Zn0WqNbIXIFrnhYIYCf7aEYc
   VJf7cGPFSX7lkQKta+/L4f8YguhfqUy8FHiIUlmfamyWgN/xY+759TEt+
   gK0z+ATlrTksfH+P4aLwKnHqRvB0mOTv3l6wmORcx+8x/htlYWFlCvCHN
   /SbRxAJKlhR8jb3EA+G7Wc9eKBrA1fUFhtLaat866JKbISfnqGdj8tQJs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="395560777"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="395560777"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 20:11:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="905387054"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="905387054"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 09 Jan 2024 20:10:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNPva-0006Zq-0N;
	Wed, 10 Jan 2024 04:10:54 +0000
Date: Wed, 10 Jan 2024 12:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-next:egrumbac_fixes_6.5_core80 56/59]
 drivers/net/wireless/ath/ath6kl/cfg80211.c:1122:9: error: too many arguments
 to function 'cfg80211_ch_switch_notify'
Message-ID: <202401101203.h3LidZmU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git egrumbac_fixes_6.5_core80
head:   260daff72d49b63c085ace273ce18843b70cc526
commit: 6b3dc9d6464edf77fa4da952e1101ce6aaa244f0 [56/59] CFG80211
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240110/202401101203.h3LidZmU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101203.h3LidZmU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401101203.h3LidZmU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath6kl/cfg80211.c: In function 'ath6kl_cfg80211_ch_switch_notify':
>> drivers/net/wireless/ath/ath6kl/cfg80211.c:1122:9: error: too many arguments to function 'cfg80211_ch_switch_notify'
    1122 |         cfg80211_ch_switch_notify(vif->ndev, &chandef, 0, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/ath/ath6kl/core.h:26,
                    from drivers/net/wireless/ath/ath6kl/cfg80211.c:25:
   include/net/cfg80211.h:8422:6: note: declared here
    8422 | void cfg80211_ch_switch_notify(struct net_device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c: In function 'mwifiex_11n_dispatch_amsdu_pkt':
>> drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c:35:17: error: too many arguments to function 'ieee80211_amsdu_to_8023s'
      35 |                 ieee80211_amsdu_to_8023s(skb, &list, priv->curr_addr,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/marvell/mwifiex/decl.h:18,
                    from drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c:8:
   include/net/cfg80211.h:6309:6: note: declared here
    6309 | void ieee80211_amsdu_to_8023s(struct sk_buff *skb, struct sk_buff_head *list,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/wireless/marvell/mwifiex/11h.c: In function 'mwifiex_dfs_chan_sw_work_queue':
>> drivers/net/wireless/marvell/mwifiex/11h.c:291:9: error: too many arguments to function 'cfg80211_ch_switch_notify'
     291 |         cfg80211_ch_switch_notify(priv->netdev, &priv->dfs_chandef, 0, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/marvell/mwifiex/decl.h:18,
                    from drivers/net/wireless/marvell/mwifiex/main.h:43,
                    from drivers/net/wireless/marvell/mwifiex/11h.c:8:
   include/net/cfg80211.h:8422:6: note: declared here
    8422 | void cfg80211_ch_switch_notify(struct net_device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/wireless/virtual/mac80211_hwsim.c: In function 'mac80211_hwsim_send_pmsr_request_peer':
>> drivers/net/wireless/virtual/mac80211_hwsim.c:3338:15: error: implicit declaration of function 'nl80211_send_chandef' [-Werror=implicit-function-declaration]
    3338 |         err = nl80211_send_chandef(msg, &request->chandef);
         |               ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> net/wireless/scan.c:307:25: warning: no previous prototype for 'cfg80211_gen_new_ie' [-Wmissing-prototypes]
     307 | VISIBLE_IF_KUNIT size_t cfg80211_gen_new_ie(const u8 *ie, size_t ielen,
         |                         ^~~~~~~~~~~~~~~~~~~


vim +/cfg80211_ch_switch_notify +1122 drivers/net/wireless/ath/ath6kl/cfg80211.c

bdcd81707973cf Kalle Valo         2011-07-18  1105  
c4f7863eae6f58 Thomas Pedersen    2012-04-06  1106  void ath6kl_cfg80211_ch_switch_notify(struct ath6kl_vif *vif, int freq,
c4f7863eae6f58 Thomas Pedersen    2012-04-06  1107  				      enum wmi_phy_mode mode)
c4f7863eae6f58 Thomas Pedersen    2012-04-06  1108  {
683b6d3b31a519 Johannes Berg      2012-11-08  1109  	struct cfg80211_chan_def chandef;
c4f7863eae6f58 Thomas Pedersen    2012-04-06  1110  
c4f7863eae6f58 Thomas Pedersen    2012-04-06  1111  	ath6kl_dbg(ATH6KL_DBG_WLAN_CFG,
c4f7863eae6f58 Thomas Pedersen    2012-04-06  1112  		   "channel switch notify nw_type %d freq %d mode %d\n",
c4f7863eae6f58 Thomas Pedersen    2012-04-06  1113  		   vif->nw_type, freq, mode);
c4f7863eae6f58 Thomas Pedersen    2012-04-06  1114  
3d9d1d6656a73e Johannes Berg      2012-11-08  1115  	cfg80211_chandef_create(&chandef,
3d9d1d6656a73e Johannes Berg      2012-11-08  1116  				ieee80211_get_channel(vif->ar->wiphy, freq),
f3651bae564497 Pierre Le Magourou 2016-07-18  1117  				(mode == WMI_11G_HT20 &&
f3651bae564497 Pierre Le Magourou 2016-07-18  1118  				 ath6kl_band_2ghz.ht_cap.ht_supported) ?
3d9d1d6656a73e Johannes Berg      2012-11-08  1119  					NL80211_CHAN_HT20 : NL80211_CHAN_NO_HT);
c4f7863eae6f58 Thomas Pedersen    2012-04-06  1120  
e487eaeb076a44 Simon Wunderlich   2013-11-21  1121  	mutex_lock(&vif->wdev.mtx);
b345f0637c0042 Aloka Dixit        2023-01-30 @1122  	cfg80211_ch_switch_notify(vif->ndev, &chandef, 0, 0);
e487eaeb076a44 Simon Wunderlich   2013-11-21  1123  	mutex_unlock(&vif->wdev.mtx);
c4f7863eae6f58 Thomas Pedersen    2012-04-06  1124  }
c4f7863eae6f58 Thomas Pedersen    2012-04-06  1125  

:::::: The code at line 1122 was first introduced by commit
:::::: b345f0637c0042f9e6b78378a32256d90f485774 wifi: cfg80211: include puncturing bitmap in channel switch events

:::::: TO: Aloka Dixit <quic_alokad@quicinc.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
