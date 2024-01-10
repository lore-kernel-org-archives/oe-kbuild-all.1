Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E775BE5E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edg0lfcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704881731; x=1736417731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fc6P9MJgCZdUIABFdWrql9PyTyj3rFrb1uiGYuSz33I=;
  b=edg0lfcNSTR9PhamWGi3jxk/BFo2OTKjRLlhZzwb4CXSxUH2uGReMtMq
   7F8W9ScMHbYYykg2fkVkvpLAofNnzFq5DOldMOMS9LDUG/g9ycydXIw9A
   2Qz8wFhYeuu+cRtvloM4cgyvK3a8AoRws5nTycNNFbcCWFwVlQ74RdVRN
   PJ/0aeasLSyv3BeXkP4T5K7Rz9x9azAXPOep2HZqa8hqowrGuyToxTcOB
   yLHCtwlrD1xceb9WHOGU+/YXkwgc3pRHb0zJ4BJ8/5DSVFLTm0VVEdwY8
   Kw+8BPDstmNOd5YvaZDCueELynoZxV9qBl7+ig4JADNlFTa8Ow076ggF9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="398163479"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="398163479"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 02:15:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="30539233"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 10 Jan 2024 02:15:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNVby-0006rx-0p;
	Wed, 10 Jan 2024 10:15:04 +0000
Date: Wed, 10 Jan 2024 18:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-next:egrumbac_fixes_6.5_core80 57/59]
 drivers/net/wireless/virtual/mac80211_hwsim.c:2249:23: error: implicit
 declaration of function 'ieee80211_beacon_get_template_ema_list'; did you
 mean 'ieee80211_beacon_get_template'?
Message-ID: <202401101828.oGUJbO19-lkp@intel.com>
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
commit: b96284319e9d636245b0883f7a719a4cdb4ed256 [57/59] MAC80211
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240110/202401101828.oGUJbO19-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101828.oGUJbO19-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401101828.oGUJbO19-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/wireless/virtual/mac80211_hwsim.c: In function 'mac80211_hwsim_beacon_tx':
>> drivers/net/wireless/virtual/mac80211_hwsim.c:2249:23: error: implicit declaration of function 'ieee80211_beacon_get_template_ema_list'; did you mean 'ieee80211_beacon_get_template'? [-Werror=implicit-function-declaration]
    2249 |                 ema = ieee80211_beacon_get_template_ema_list(hw, vif, link_id);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       ieee80211_beacon_get_template
>> drivers/net/wireless/virtual/mac80211_hwsim.c:2249:21: warning: assignment to 'struct ieee80211_ema_beacons *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2249 |                 ema = ieee80211_beacon_get_template_ema_list(hw, vif, link_id);
         |                     ^
>> drivers/net/wireless/virtual/mac80211_hwsim.c:2250:33: error: invalid use of undefined type 'struct ieee80211_ema_beacons'
    2250 |                 if (!ema || !ema->cnt)
         |                                 ^~
   drivers/net/wireless/virtual/mac80211_hwsim.c:2253:36: error: invalid use of undefined type 'struct ieee80211_ema_beacons'
    2253 |                 for (i = 0; i < ema->cnt; i++) {
         |                                    ^~
   drivers/net/wireless/virtual/mac80211_hwsim.c:2255:55: error: invalid use of undefined type 'struct ieee80211_ema_beacons'
    2255 |                                                    ema->bcn[i].skb);
         |                                                       ^~
   drivers/net/wireless/virtual/mac80211_hwsim.c:2256:28: error: invalid use of undefined type 'struct ieee80211_ema_beacons'
    2256 |                         ema->bcn[i].skb = NULL; /* Already freed */
         |                            ^~
>> drivers/net/wireless/virtual/mac80211_hwsim.c:2258:17: error: implicit declaration of function 'ieee80211_beacon_free_ema_list'; did you mean 'ieee80211_beacon_get_template'? [-Werror=implicit-function-declaration]
    2258 |                 ieee80211_beacon_free_ema_list(ema);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 ieee80211_beacon_get_template
   drivers/net/wireless/virtual/mac80211_hwsim.c: In function 'mac80211_hwsim_send_pmsr_request_peer':
   drivers/net/wireless/virtual/mac80211_hwsim.c:3338:15: error: implicit declaration of function 'nl80211_send_chandef' [-Werror=implicit-function-declaration]
    3338 |         err = nl80211_send_chandef(msg, &request->chandef);
         |               ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c: In function 'mt76_connac2_mac_fill_txs':
>> drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c:613:25: error: implicit declaration of function 'ieee80211_refresh_tx_agg_session_timer' [-Werror=implicit-function-declaration]
     613 |                         ieee80211_refresh_tx_agg_session_timer(sta, tid);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/net/wireless/ti/wlcore/main.c: In function 'wlcore_channel_switch_work':
>> drivers/net/wireless/ti/wlcore/main.c:2046:9: error: too few arguments to function 'ieee80211_chswitch_done'
    2046 |         ieee80211_chswitch_done(vif, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/ti/wlcore/wlcore_i.h:19,
                    from drivers/net/wireless/ti/wlcore/wlcore.h:13,
                    from drivers/net/wireless/ti/wlcore/main.c:18:
   include/net/mac80211.h:6461:6: note: declared here
    6461 | void ieee80211_chswitch_done(struct ieee80211_vif *vif, bool success,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/main.c: In function 'wlcore_unset_assoc':
   drivers/net/wireless/ti/wlcore/main.c:3033:17: error: too few arguments to function 'ieee80211_chswitch_done'
    3033 |                 ieee80211_chswitch_done(vif, false);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/net/mac80211.h:6461:6: note: declared here
    6461 | void ieee80211_chswitch_done(struct ieee80211_vif *vif, bool success,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/main.c: In function 'wl12xx_op_channel_switch':
   drivers/net/wireless/ti/wlcore/main.c:5454:25: error: too few arguments to function 'ieee80211_chswitch_done'
    5454 |                         ieee80211_chswitch_done(vif, false);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/net/mac80211.h:6461:6: note: declared here
    6461 | void ieee80211_chswitch_done(struct ieee80211_vif *vif, bool success,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/wireless/ti/wlcore/event.c: In function 'wlcore_event_channel_switch':
>> drivers/net/wireless/ti/wlcore/event.c:232:25: error: too few arguments to function 'ieee80211_chswitch_done'
     232 |                         ieee80211_chswitch_done(vif, success);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/ti/wlcore/wlcore_i.h:19,
                    from drivers/net/wireless/ti/wlcore/wlcore.h:13,
                    from drivers/net/wireless/ti/wlcore/event.c:10:
   include/net/mac80211.h:6461:6: note: declared here
    6461 | void ieee80211_chswitch_done(struct ieee80211_vif *vif, bool success,
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +2249 drivers/net/wireless/virtual/mac80211_hwsim.c

b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2217  
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2218  static void mac80211_hwsim_beacon_tx(void *arg, u8 *mac,
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2219  				     struct ieee80211_vif *vif)
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2220  {
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2221  	struct mac80211_hwsim_link_data *link_data = arg;
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2222  	u32 link_id = link_data->link_id;
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2223  	struct ieee80211_bss_conf *link_conf;
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2224  	struct mac80211_hwsim_data *data =
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2225  		container_of(link_data, struct mac80211_hwsim_data,
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2226  			     link_data[link_id]);
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2227  	struct ieee80211_hw *hw = data->hw;
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2228  	struct sk_buff *skb;
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2229  
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2230  	hwsim_check_magic(vif);
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2231  
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2232  	link_conf = rcu_dereference(vif->link_conf[link_id]);
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2233  	if (!link_conf)
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2234  		return;
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2235  
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2236  	if (vif->type != NL80211_IFTYPE_AP &&
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2237  	    vif->type != NL80211_IFTYPE_MESH_POINT &&
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2238  	    vif->type != NL80211_IFTYPE_ADHOC &&
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2239  	    vif->type != NL80211_IFTYPE_OCB)
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2240  		return;
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2241  
c4f4d9f7e7f0a7 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2242  	if (vif->mbssid_tx_vif && vif->mbssid_tx_vif != vif)
c4f4d9f7e7f0a7 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2243  		return;
c4f4d9f7e7f0a7 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2244  
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2245  	if (vif->bss_conf.ema_ap) {
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2246  		struct ieee80211_ema_beacons *ema;
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2247  		u8 i = 0;
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2248  
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05 @2249  		ema = ieee80211_beacon_get_template_ema_list(hw, vif, link_id);
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05 @2250  		if (!ema || !ema->cnt)
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2251  			return;
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2252  
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05 @2253  		for (i = 0; i < ema->cnt; i++) {
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2254  			__mac80211_hwsim_beacon_tx(link_conf, data, hw, vif,
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2255  						   ema->bcn[i].skb);
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2256  			ema->bcn[i].skb = NULL; /* Already freed */
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2257  		}
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05 @2258  		ieee80211_beacon_free_ema_list(ema);
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2259  	} else {
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2260  		skb = ieee80211_beacon_get(hw, vif, link_id);
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2261  		if (!skb)
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2262  			return;
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2263  
b3a912e3e22025 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2264  		__mac80211_hwsim_beacon_tx(link_conf, data, hw, vif, skb);
0dd45ebc08de24 drivers/net/wireless/virtual/mac80211_hwsim.c Aloka Dixit           2022-12-05  2265  	}
0037db63ca71dd drivers/net/wireless/mac80211_hwsim.c         Andrei Otcheretianski 2013-11-18  2266  
01afc6fedffb51 drivers/net/wireless/mac80211_hwsim.c         Thomas Pedersen       2020-01-13  2267  	while ((skb = ieee80211_get_buffered_bc(hw, vif)) != NULL) {
01afc6fedffb51 drivers/net/wireless/mac80211_hwsim.c         Thomas Pedersen       2020-01-13  2268  		mac80211_hwsim_tx_frame(hw, skb,
e57f8a489c294d drivers/net/wireless/mac80211_hwsim.c         Shaul Triebitz        2022-06-06  2269  			rcu_dereference(link_conf->chanctx_conf)->def.chan);
01afc6fedffb51 drivers/net/wireless/mac80211_hwsim.c         Thomas Pedersen       2020-01-13  2270  	}
01afc6fedffb51 drivers/net/wireless/mac80211_hwsim.c         Thomas Pedersen       2020-01-13  2271  
e57f8a489c294d drivers/net/wireless/mac80211_hwsim.c         Shaul Triebitz        2022-06-06  2272  	if (link_conf->csa_active && ieee80211_beacon_cntdwn_is_complete(vif))
0037db63ca71dd drivers/net/wireless/mac80211_hwsim.c         Andrei Otcheretianski 2013-11-18  2273  		ieee80211_csa_finish(vif);
acc1e7a3007ec1 drivers/net/wireless/mac80211_hwsim.c         Jouni Malinen         2008-06-11  2274  }
acc1e7a3007ec1 drivers/net/wireless/mac80211_hwsim.c         Jouni Malinen         2008-06-11  2275  

:::::: The code at line 2249 was first introduced by commit
:::::: 0dd45ebc08de2449efe1a0908147796856a5f824 wifi: mac80211_hwsim: EMA support

:::::: TO: Aloka Dixit <quic_alokad@quicinc.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
