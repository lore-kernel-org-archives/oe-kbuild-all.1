Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0F823763
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LL8uyKS9"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696455084; x=1727991084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A4zJNo+dqQoagyuGCxpKGWzvlDLBvQ/U4Bkqm2D4npg=;
  b=LL8uyKS9Y2QzjHqWMOTFp/nX9JXoLPCYZmCtp2lOmMCc551pW5VfdjEG
   8tDFWqoVzDdOWyCbajCnqQgHdBuUaP53RpyUaDtytUdXKXAyMqgoXqSmI
   WXS2+2DNv7qWCnARmbftogPY89RkIxAOzKXrwJ8m4zKeAovDWKRIQ9+f1
   6tvpimZj5C33TAEHvVKU0Rdi0QuW7oLEtyM2TF0f7Fnfte3LBTiHwExru
   UB0mhvF1p3Ki3hUElnRbxaX1Y+swQVc5N2UEDXjHd00NCP13HDIELwgQG
   wFsSpz/uCVdghCVhNPDUd9Ss791I2uqXn7TYIPEaFMpwN2WUS5OkCZMsr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447497282"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="447497282"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 14:31:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786688238"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="786688238"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 04 Oct 2023 14:31:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo9SO-000KdA-2N;
	Wed, 04 Oct 2023 21:31:00 +0000
Date: Thu, 5 Oct 2023 05:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: gregory.greenman@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 04/15] wifi: iwlwifi: mvm: rework debugfs handling
Message-ID: <202310050508.l8wOPzgE-lkp@intel.com>
References: <20231004123422.818810e242e6.I805a28f9fbef5c52a3a575d04e7a6a909ecf9078@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004123422.818810e242e6.I805a28f9fbef5c52a3a575d04e7a6a909ecf9078@changeid>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20231004]
[also build test ERROR on v6.6-rc4]
[cannot apply to linus/master v6.6-rc4 v6.6-rc3 v6.6-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/gregory-greenman-intel-com/wifi-iwlwifi-Extract-common-prph-mac-phy-regions-data-dump-logic/20231004-173940
base:   next-20231004
patch link:    https://lore.kernel.org/r/20231004123422.818810e242e6.I805a28f9fbef5c52a3a575d04e7a6a909ecf9078%40changeid
patch subject: [PATCH 04/15] wifi: iwlwifi: mvm: rework debugfs handling
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310050508.l8wOPzgE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050508.l8wOPzgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050508.l8wOPzgE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c:1212:10: error: 'const struct ieee80211_ops' has no member named 'vif_add_debugfs'; did you mean 'link_add_debugfs'?
    1212 |         .vif_add_debugfs = iwl_mvm_vif_add_debugfs,
         |          ^~~~~~~~~~~~~~~
         |          link_add_debugfs
>> drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c:1212:28: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1212 |         .vif_add_debugfs = iwl_mvm_vif_add_debugfs,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c:1212:28: note: (near initialization for 'iwl_mvm_mld_hw_ops')
   drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c:1212:28: error: initialization of 'int (*)(struct ieee80211_hw *, struct ieee80211_low_level_stats *)' from incompatible pointer type 'void (*)(struct ieee80211_hw *, struct ieee80211_vif *)' [-Werror=incompatible-pointer-types]
   drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c:1212:28: note: (near initialization for 'iwl_mvm_mld_hw_ops.get_stats')
   cc1: some warnings being treated as errors
--
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:6312:10: error: 'const struct ieee80211_ops' has no member named 'vif_add_debugfs'; did you mean 'link_add_debugfs'?
    6312 |         .vif_add_debugfs = iwl_mvm_vif_add_debugfs,
         |          ^~~~~~~~~~~~~~~
         |          link_add_debugfs
>> drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:6312:28: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    6312 |         .vif_add_debugfs = iwl_mvm_vif_add_debugfs,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:6312:28: note: (near initialization for 'iwl_mvm_hw_ops')
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:6312:28: error: initialization of 'void (*)(struct ieee80211_hw *, struct ieee80211_vif *, struct cfg80211_chan_def *)' from incompatible pointer type 'void (*)(struct ieee80211_hw *, struct ieee80211_vif *)' [-Werror=incompatible-pointer-types]
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:6312:28: note: (near initialization for 'iwl_mvm_hw_ops.channel_switch_beacon')
   cc1: some warnings being treated as errors


vim +1212 drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c

  1123	
  1124	const struct ieee80211_ops iwl_mvm_mld_hw_ops = {
  1125		.tx = iwl_mvm_mac_tx,
  1126		.wake_tx_queue = iwl_mvm_mac_wake_tx_queue,
  1127		.ampdu_action = iwl_mvm_mac_ampdu_action,
  1128		.get_antenna = iwl_mvm_op_get_antenna,
  1129		.set_antenna = iwl_mvm_op_set_antenna,
  1130		.start = iwl_mvm_mac_start,
  1131		.reconfig_complete = iwl_mvm_mac_reconfig_complete,
  1132		.stop = iwl_mvm_mac_stop,
  1133		.add_interface = iwl_mvm_mld_mac_add_interface,
  1134		.remove_interface = iwl_mvm_mld_mac_remove_interface,
  1135		.config = iwl_mvm_mac_config,
  1136		.prepare_multicast = iwl_mvm_prepare_multicast,
  1137		.configure_filter = iwl_mvm_configure_filter,
  1138		.config_iface_filter = iwl_mvm_mld_config_iface_filter,
  1139		.link_info_changed = iwl_mvm_mld_link_info_changed,
  1140		.vif_cfg_changed = iwl_mvm_mld_vif_cfg_changed,
  1141		.hw_scan = iwl_mvm_mac_hw_scan,
  1142		.cancel_hw_scan = iwl_mvm_mac_cancel_hw_scan,
  1143		.sta_pre_rcu_remove = iwl_mvm_sta_pre_rcu_remove,
  1144		.sta_state = iwl_mvm_mld_mac_sta_state,
  1145		.sta_notify = iwl_mvm_mac_sta_notify,
  1146		.allow_buffered_frames = iwl_mvm_mac_allow_buffered_frames,
  1147		.release_buffered_frames = iwl_mvm_mac_release_buffered_frames,
  1148		.set_rts_threshold = iwl_mvm_mac_set_rts_threshold,
  1149		.sta_rc_update = iwl_mvm_sta_rc_update,
  1150		.conf_tx = iwl_mvm_mld_mac_conf_tx,
  1151		.mgd_prepare_tx = iwl_mvm_mac_mgd_prepare_tx,
  1152		.mgd_complete_tx = iwl_mvm_mac_mgd_complete_tx,
  1153		.mgd_protect_tdls_discover = iwl_mvm_mac_mgd_protect_tdls_discover,
  1154		.flush = iwl_mvm_mac_flush,
  1155		.flush_sta = iwl_mvm_mac_flush_sta,
  1156		.sched_scan_start = iwl_mvm_mac_sched_scan_start,
  1157		.sched_scan_stop = iwl_mvm_mac_sched_scan_stop,
  1158		.set_key = iwl_mvm_mac_set_key,
  1159		.update_tkip_key = iwl_mvm_mac_update_tkip_key,
  1160		.remain_on_channel = iwl_mvm_mld_roc,
  1161		.cancel_remain_on_channel = iwl_mvm_cancel_roc,
  1162		.add_chanctx = iwl_mvm_add_chanctx,
  1163		.remove_chanctx = iwl_mvm_remove_chanctx,
  1164		.change_chanctx = iwl_mvm_change_chanctx,
  1165		.assign_vif_chanctx = iwl_mvm_mld_assign_vif_chanctx,
  1166		.unassign_vif_chanctx = iwl_mvm_mld_unassign_vif_chanctx,
  1167		.switch_vif_chanctx = iwl_mvm_mld_switch_vif_chanctx,
  1168	
  1169		.start_ap = iwl_mvm_mld_start_ap,
  1170		.stop_ap = iwl_mvm_mld_stop_ap,
  1171		.join_ibss = iwl_mvm_mld_start_ibss,
  1172		.leave_ibss = iwl_mvm_mld_stop_ibss,
  1173	
  1174		.tx_last_beacon = iwl_mvm_tx_last_beacon,
  1175	
  1176		.set_tim = iwl_mvm_set_tim,
  1177	
  1178		.channel_switch = iwl_mvm_channel_switch,
  1179		.pre_channel_switch = iwl_mvm_pre_channel_switch,
  1180		.post_channel_switch = iwl_mvm_post_channel_switch,
  1181		.abort_channel_switch = iwl_mvm_abort_channel_switch,
  1182		.channel_switch_rx_beacon = iwl_mvm_channel_switch_rx_beacon,
  1183	
  1184		.tdls_channel_switch = iwl_mvm_tdls_channel_switch,
  1185		.tdls_cancel_channel_switch = iwl_mvm_tdls_cancel_channel_switch,
  1186		.tdls_recv_channel_switch = iwl_mvm_tdls_recv_channel_switch,
  1187	
  1188		.event_callback = iwl_mvm_mac_event_callback,
  1189	
  1190		.sync_rx_queues = iwl_mvm_sync_rx_queues,
  1191	
  1192		CFG80211_TESTMODE_CMD(iwl_mvm_mac_testmode_cmd)
  1193	
  1194	#ifdef CONFIG_PM_SLEEP
  1195		/* look at d3.c */
  1196		.suspend = iwl_mvm_suspend,
  1197		.resume = iwl_mvm_resume,
  1198		.set_wakeup = iwl_mvm_set_wakeup,
  1199		.set_rekey_data = iwl_mvm_set_rekey_data,
  1200	#if IS_ENABLED(CONFIG_IPV6)
  1201		.ipv6_addr_change = iwl_mvm_ipv6_addr_change,
  1202	#endif
  1203		.set_default_unicast_key = iwl_mvm_set_default_unicast_key,
  1204	#endif
  1205		.get_survey = iwl_mvm_mac_get_survey,
  1206		.sta_statistics = iwl_mvm_mac_sta_statistics,
  1207		.get_ftm_responder_stats = iwl_mvm_mac_get_ftm_responder_stats,
  1208		.start_pmsr = iwl_mvm_start_pmsr,
  1209		.abort_pmsr = iwl_mvm_abort_pmsr,
  1210	
  1211	#ifdef CONFIG_IWLWIFI_DEBUGFS
> 1212		.vif_add_debugfs = iwl_mvm_vif_add_debugfs,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
