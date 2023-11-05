Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8251857
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 05:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSaI3Fln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699160608; x=1730696608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/FygX9I6FHSsYM8eWBGjrwf/lXmoiRB/KkGx0CYREg=;
  b=DSaI3FlnxL7wqi4GQcxG85XyECbo9J75R8Gt3jPDsO5cZyMC/oBL/Bre
   iNeStvxO1yttpcmtaG5ocfq8r1Tret7EywZCHOoyoov/EcbBde8qdIsX3
   E/VFUb6DkgJh1EwFXyAJIMjmdEUL2owBwZ0lDp12HAUbxbLK8OEt2+tq4
   Y2h8aAAq3zW7dSErlX6L3RGtpIOEnzCBYK8K3Bgj08m9glaY1NK8HNdTY
   Z/OfAS6OgKAFn/mkZZWdsu7/DQcDAsV8DTmvsV22iQZQgxlY+oww9rf12
   CVcFjrkVTrkuTmS/XXIW0G7DJStXA9x/L8NnrgtrLz4qxAWdNmxPIlgvE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="388947621"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="388947621"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 22:03:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="1093453678"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="1093453678"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2023 22:03:26 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzVIC-000536-1G;
	Sun, 05 Nov 2023 05:03:24 +0000
Date: Sun, 5 Nov 2023 13:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_bit 25/52]
 drivers/net/wireless/intel/iwlwifi/dvm/tx.c:472:13: error: invalid storage
 class for function 'iwlagn_dealloc_agg_txq'
Message-ID: <202311051325.JrsR7VeF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_bit
head:   6f64b308aa8f6836bc4f4d33416ebde4483d5922
commit: 659d06048b8a9e2c07bc000cc8829b468a43d133 [25/52] wifi: intel: use atomic find_bit() API where appropriate
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231105/202311051325.JrsR7VeF-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051325.JrsR7VeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051325.JrsR7VeF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlwifi/dvm/tx.c: In function 'iwlagn_alloc_agg_txq':
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:472:13: error: invalid storage class for function 'iwlagn_dealloc_agg_txq'
     472 | static void iwlagn_dealloc_agg_txq(struct iwl_priv *priv, int q)
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:737:13: error: invalid storage class for function 'iwlagn_check_ratid_empty'
     737 | static void iwlagn_check_ratid_empty(struct iwl_priv *priv, int sta_id, u8 tid)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:779:13: error: invalid storage class for function 'iwlagn_non_agg_tx_status'
     779 | static void iwlagn_non_agg_tx_status(struct iwl_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:801:13: error: invalid storage class for function 'iwlagn_hwrate_to_tx_control'
     801 | static void iwlagn_hwrate_to_tx_control(struct iwl_priv *priv, u32 rate_n_flags,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:861:13: error: invalid storage class for function 'iwlagn_count_agg_tx_err_status'
     861 | static void iwlagn_count_agg_tx_err_status(struct iwl_priv *priv, u16 status)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:908:19: error: invalid storage class for function 'iwlagn_get_scd_ssn'
     908 | static inline u32 iwlagn_get_scd_ssn(struct iwlagn_tx_resp *tx_resp)
         |                   ^~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:914:13: error: invalid storage class for function 'iwl_rx_reply_tx_agg'
     914 | static void iwl_rx_reply_tx_agg(struct iwl_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1002:13: error: invalid storage class for function 'iwlagn_count_tx_err_status'
    1002 | static void iwlagn_count_tx_err_status(struct iwl_priv *priv, u16 status)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1079:13: error: invalid storage class for function 'iwlagn_set_tx_status'
    1079 | static void iwlagn_set_tx_status(struct iwl_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1095:13: error: invalid storage class for function 'iwl_check_abort_status'
    1095 | static void iwl_check_abort_status(struct iwl_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1386:1: error: expected declaration or statement at end of input
    1386 | }
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c: At top level:
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1257:6: warning: 'iwlagn_rx_reply_compressed_ba' defined but not used [-Wunused-function]
    1257 | void iwlagn_rx_reply_compressed_ba(struct iwl_priv *priv,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1105:6: warning: 'iwlagn_rx_reply_tx' defined but not used [-Wunused-function]
    1105 | void iwlagn_rx_reply_tx(struct iwl_priv *priv, struct iwl_rx_cmd_buffer *rxb)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:978:13: warning: 'iwl_get_agg_tx_fail_reason' defined but not used [-Wunused-function]
     978 | const char *iwl_get_agg_tx_fail_reason(u16 status)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:673:5: warning: 'iwlagn_tx_agg_oper' defined but not used [-Wunused-function]
     673 | int iwlagn_tx_agg_oper(struct iwl_priv *priv, struct ieee80211_vif *vif,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:628:5: warning: 'iwlagn_tx_agg_flush' defined but not used [-Wunused-function]
     628 | int iwlagn_tx_agg_flush(struct iwl_priv *priv, struct ieee80211_vif *vif,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:569:5: warning: 'iwlagn_tx_agg_start' defined but not used [-Wunused-function]
     569 | int iwlagn_tx_agg_start(struct iwl_priv *priv, struct ieee80211_vif *vif,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:478:5: warning: 'iwlagn_tx_agg_stop' defined but not used [-Wunused-function]
     478 | int iwlagn_tx_agg_stop(struct iwl_priv *priv, struct ieee80211_vif *vif,
         |     ^~~~~~~~~~~~~~~~~~
--
   drivers/net/wireless/intel/iwlwifi/dvm/sta.c: In function 'iwl_get_free_ucode_key_offset':
>> drivers/net/wireless/intel/iwlwifi/dvm/sta.c:722:58: error: 'sta_key_max_num' undeclared (first use in this function)
     722 |         int i = find_and_set_bit(&priv->ucode_key_table, sta_key_max_num);
         |                                                          ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/sta.c:722:58: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/wireless/intel/iwlwifi/dvm/sta.c:725:1: warning: control reaches end of non-void function [-Wreturn-type]
     725 | }
         | ^


vim +/iwlagn_dealloc_agg_txq +472 drivers/net/wireless/intel/iwlwifi/dvm/tx.c

9eae88fa9a02e3 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-03-15  471  
9eae88fa9a02e3 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-03-15 @472  static void iwlagn_dealloc_agg_txq(struct iwl_priv *priv, int q)
9eae88fa9a02e3 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-03-15  473  {
9eae88fa9a02e3 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-03-15  474  	clear_bit(q, priv->agg_q_alloc);
1479177ba69023 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-04-17  475  	priv->queue_to_mac80211[q] = IWL_INVALID_MAC80211_QUEUE;
9eae88fa9a02e3 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-03-15  476  }
9eae88fa9a02e3 drivers/net/wireless/iwlwifi/iwl-agn-tx.c Johannes Berg 2012-03-15  477  

:::::: The code at line 472 was first introduced by commit
:::::: 9eae88fa9a02e31af69a215beaa5e1194da3a5a1 iwlwifi: move queue mapping out of transport

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
