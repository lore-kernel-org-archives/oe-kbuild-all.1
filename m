Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74991172D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 05:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmJlPKNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698213592; x=1729749592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RbVBOjQgMOPtlvLlQjYmf3l2NVOvC0kh2M2L81i8NNs=;
  b=bmJlPKNSAxDSx/xlfTOp1Ev8HC4Dk3dTm8VAw5czHTiOCWMWkHu8wOFC
   SiWfyjJT4FWpQVkJc3+Np47Sy302a9AYYlgSj6GZNkeOj+XqEqAfqaljN
   hgjnp/O4DYUQsJNUjOECxgBpcUkm/GLaedYxPN5gX8fNl0nkk55ffF2xH
   EqiWuT2iB09MkVtymOBqzTDvP2Q8l6P1tDp87fkEvrXd3d7vQhTtkZbIi
   RTe4MCk9F+AqRPd3EMB6VGsGC+XOOaeQTJ8+Zto1epG9DHE1OcRz+1GT0
   W03I5AUOx0ACEl5IdyRU6RPXQ5HbjfdmUodenULnE+IaSpyt1Snc+Rxzd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451468660"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="451468660"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 22:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="932258422"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="932258422"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Oct 2023 22:59:50 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvWvk-0008fM-1X;
	Wed, 25 Oct 2023 05:59:48 +0000
Date: Wed, 25 Oct 2023 13:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_clear_tmp 23/47]
 drivers/net/wireless/intel/iwlegacy/4965-mac.c:2092:13: warning: unused
 variable 'txq_id'
Message-ID: <202310251314.0PJHx99m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_clear_tmp
head:   8ff28bdbe8eb42074ec3920a5b1d49e18332aad1
commit: 774051846ea250ebf76532b65fdbd3b8a9ba8caf [23/47] wireless: intel
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231025/202310251314.0PJHx99m-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310251314.0PJHx99m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310251314.0PJHx99m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6827:13: error: initializer element is not constant
    6827 | module_init(il4965_init);
         |             ^~~~~~~~~~~
   include/linux/init.h:270:55: note: in definition of macro '____define_initcall'
     270 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:311:41: note: in expansion of macro '__define_initcall'
     311 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:316:24: note: in expansion of macro 'device_initcall'
     316 | #define __initcall(fn) device_initcall(fn)
         |                        ^~~~~~~~~~~~~~~
   include/linux/module.h:88:25: note: in expansion of macro '__initcall'
      88 | #define module_init(x)  __initcall(x);
         |                         ^~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6827:1: note: in expansion of macro 'module_init'
    6827 | module_init(il4965_init);
         | ^~~~~~~~~~~
   In file included from include/linux/module.h:22:
   include/linux/moduleparam.h:409:45: error: invalid storage class for function '__check_debug'
     409 |         static inline type __always_unused *__check_##name(void) { return(p); }
         |                                             ^~~~~~~~
   include/linux/moduleparam.h:436:35: note: in expansion of macro '__param_check'
     436 | #define param_check_uint(name, p) __param_check(name, p, unsigned int)
         |                                   ^~~~~~~~~~~~~
   include/linux/moduleparam.h:150:9: note: in expansion of macro 'param_check_uint'
     150 |         param_check_##type(name, &(value));                                \
         |         ^~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6830:1: note: in expansion of macro 'module_param_named'
    6830 | module_param_named(debug, il_debug_level, uint, 0644);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:409:45: error: invalid storage class for function '__check_swcrypto'
     409 |         static inline type __always_unused *__check_##name(void) { return(p); }
         |                                             ^~~~~~~~
   include/linux/moduleparam.h:429:34: note: in expansion of macro '__param_check'
     429 | #define param_check_int(name, p) __param_check(name, p, int)
         |                                  ^~~~~~~~~~~~~
   include/linux/moduleparam.h:150:9: note: in expansion of macro 'param_check_int'
     150 |         param_check_##type(name, &(value));                                \
         |         ^~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6834:1: note: in expansion of macro 'module_param_named'
    6834 | module_param_named(swcrypto, il4965_mod_params.sw_crypto, int, 0444);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:409:45: error: invalid storage class for function '__check_queues_num'
     409 |         static inline type __always_unused *__check_##name(void) { return(p); }
         |                                             ^~~~~~~~
   include/linux/moduleparam.h:429:34: note: in expansion of macro '__param_check'
     429 | #define param_check_int(name, p) __param_check(name, p, int)
         |                                  ^~~~~~~~~~~~~
   include/linux/moduleparam.h:150:9: note: in expansion of macro 'param_check_int'
     150 |         param_check_##type(name, &(value));                                \
         |         ^~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6836:1: note: in expansion of macro 'module_param_named'
    6836 | module_param_named(queues_num, il4965_mod_params.num_of_queues, int, 0444);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:409:45: error: invalid storage class for function '__check_11n_disable'
     409 |         static inline type __always_unused *__check_##name(void) { return(p); }
         |                                             ^~~~~~~~
   include/linux/moduleparam.h:429:34: note: in expansion of macro '__param_check'
     429 | #define param_check_int(name, p) __param_check(name, p, int)
         |                                  ^~~~~~~~~~~~~
   include/linux/moduleparam.h:150:9: note: in expansion of macro 'param_check_int'
     150 |         param_check_##type(name, &(value));                                \
         |         ^~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6838:1: note: in expansion of macro 'module_param_named'
    6838 | module_param_named(11n_disable, il4965_mod_params.disable_11n, int, 0444);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:409:45: error: invalid storage class for function '__check_amsdu_size_8K'
     409 |         static inline type __always_unused *__check_##name(void) { return(p); }
         |                                             ^~~~~~~~
   include/linux/moduleparam.h:429:34: note: in expansion of macro '__param_check'
     429 | #define param_check_int(name, p) __param_check(name, p, int)
         |                                  ^~~~~~~~~~~~~
   include/linux/moduleparam.h:150:9: note: in expansion of macro 'param_check_int'
     150 |         param_check_##type(name, &(value));                                \
         |         ^~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6840:1: note: in expansion of macro 'module_param_named'
    6840 | module_param_named(amsdu_size_8K, il4965_mod_params.amsdu_size_8K, int, 0444);
         | ^~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:409:45: error: invalid storage class for function '__check_fw_restart'
     409 |         static inline type __always_unused *__check_##name(void) { return(p); }
         |                                             ^~~~~~~~
   include/linux/moduleparam.h:429:34: note: in expansion of macro '__param_check'
     429 | #define param_check_int(name, p) __param_check(name, p, int)
         |                                  ^~~~~~~~~~~~~
   include/linux/moduleparam.h:150:9: note: in expansion of macro 'param_check_int'
     150 |         param_check_##type(name, &(value));                                \
         |         ^~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6842:1: note: in expansion of macro 'module_param_named'
    6842 | module_param_named(fw_restart, il4965_mod_params.restart_fw, int, 0444);
         | ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6843:1: error: expected declaration or statement at end of input
    6843 | MODULE_PARM_DESC(fw_restart, "restart firmware in case of error");
         | ^~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:2092:13: warning: unused variable 'txq_id' [-Wunused-variable]
    2092 |         int txq_id = find_and_set_bit(&il->txq_ctx_active_msk, il->hw_params.max_txq_num))
         |             ^~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6843:1: error: no return statement in function returning non-void [-Werror=return-type]
    6843 | MODULE_PARM_DESC(fw_restart, "restart firmware in case of error");
         | ^~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c: At top level:
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:6765:1: warning: 'il4965_txq_set_sched' defined but not used [-Wunused-function]
    6765 | il4965_txq_set_sched(struct il_priv *il, u32 mask)
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:6284:1: warning: 'il4965_tx_queue_set_status' defined but not used [-Wunused-function]
    6284 | il4965_tx_queue_set_status(struct il_priv *il, struct il_tx_queue *txq,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:6277:1: warning: 'il4965_set_wr_ptrs' defined but not used [-Wunused-function]
    6277 | il4965_set_wr_ptrs(struct il_priv *il, int txq_id, u32 idx)
         | ^~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:6240:1: warning: 'il4965_cancel_deferred_work' defined but not used [-Wunused-function]
    6240 | il4965_cancel_deferred_work(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:5718:1: warning: 'il4965_mac_setup_register' defined but not used [-Wunused-function]
    5718 | il4965_mac_setup_register(struct il_priv *il, u32 max_probe_length)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:5070:1: warning: 'il4965_dump_nic_error_log' defined but not used [-Wunused-function]
    5070 | il4965_dump_nic_error_log(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:4757:1: warning: 'il4965_ucode_callback' defined but not used [-Wunused-function]
    4757 | il4965_ucode_callback(const struct firmware *ucode_raw, void *context)
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:3991:1: warning: 'il4965_hw_tx_queue_init' defined but not used [-Wunused-function]
    3991 | il4965_hw_tx_queue_init(struct il_priv *il, struct il_tx_queue *txq)
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:3951:1: warning: 'il4965_hw_txq_attach_buf_to_tfd' defined but not used [-Wunused-function]
    3951 | il4965_hw_txq_attach_buf_to_tfd(struct il_priv *il, struct il_tx_queue *txq,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:3906:1: warning: 'il4965_hw_txq_free_tfd' defined but not used [-Wunused-function]
    3906 | il4965_hw_txq_free_tfd(struct il_priv *il, struct il_tx_queue *txq)
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:3829:1: warning: 'il4965_send_beacon_cmd' defined but not used [-Wunused-function]
    3829 | il4965_send_beacon_cmd(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:3670:1: warning: 'il4965_update_chain_flags' defined but not used [-Wunused-function]
    3670 | il4965_update_chain_flags(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:3653:1: warning: 'il4965_sta_modify_sleep_tx_count' defined but not used [-Wunused-function]
    3653 | il4965_sta_modify_sleep_tx_count(struct il_priv *il, int sta_id, int cnt)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:3579:1: warning: 'il4965_sta_tx_modify_enable_tid' defined but not used [-Wunused-function]
    3579 | il4965_sta_tx_modify_enable_tid(struct il_priv *il, int sta_id, int tid)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:3570:1: warning: 'il4965_update_bcast_stations' defined but not used [-Wunused-function]
    3570 | il4965_update_bcast_stations(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:3163:1: warning: 'il4965_restore_default_wep_keys' defined but not used [-Wunused-function]
    3163 | il4965_restore_default_wep_keys(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:3074:1: warning: 'il4965_add_bssid_station' defined but not used [-Wunused-function]
    3074 | il4965_add_bssid_station(struct il_priv *il, const u8 *addr, u8 *sta_id_r)
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:2978:1: warning: 'il4965_get_tx_fail_reason' defined but not used [-Wunused-function]
    2978 | il4965_get_tx_fail_reason(u32 status)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:2873:1: warning: 'il4965_hwrate_to_tx_control' defined but not used [-Wunused-function]
    2873 | il4965_hwrate_to_tx_control(struct il_priv *il, u32 rate_n_flags,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c: In function 'iwlagn_alloc_agg_txq':
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:472:13: error: invalid storage class for function 'iwlagn_dealloc_agg_txq'
     472 | static void iwlagn_dealloc_agg_txq(struct iwl_priv *priv, int q)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:737:13: error: invalid storage class for function 'iwlagn_check_ratid_empty'
     737 | static void iwlagn_check_ratid_empty(struct iwl_priv *priv, int sta_id, u8 tid)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:779:13: error: invalid storage class for function 'iwlagn_non_agg_tx_status'
     779 | static void iwlagn_non_agg_tx_status(struct iwl_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:801:13: error: invalid storage class for function 'iwlagn_hwrate_to_tx_control'
     801 | static void iwlagn_hwrate_to_tx_control(struct iwl_priv *priv, u32 rate_n_flags,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:861:13: error: invalid storage class for function 'iwlagn_count_agg_tx_err_status'
     861 | static void iwlagn_count_agg_tx_err_status(struct iwl_priv *priv, u16 status)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:908:19: error: invalid storage class for function 'iwlagn_get_scd_ssn'
     908 | static inline u32 iwlagn_get_scd_ssn(struct iwlagn_tx_resp *tx_resp)
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:914:13: error: invalid storage class for function 'iwl_rx_reply_tx_agg'
     914 | static void iwl_rx_reply_tx_agg(struct iwl_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1002:13: error: invalid storage class for function 'iwlagn_count_tx_err_status'
    1002 | static void iwlagn_count_tx_err_status(struct iwl_priv *priv, u16 status)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1079:13: error: invalid storage class for function 'iwlagn_set_tx_status'
    1079 | static void iwlagn_set_tx_status(struct iwl_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1095:13: error: invalid storage class for function 'iwl_check_abort_status'
    1095 | static void iwl_check_abort_status(struct iwl_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1386:1: error: expected declaration or statement at end of input
    1386 | }
         | ^
   drivers/net/wireless/intel/iwlwifi/dvm/tx.c: At top level:
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1257:6: warning: 'iwlagn_rx_reply_compressed_ba' defined but not used [-Wunused-function]
    1257 | void iwlagn_rx_reply_compressed_ba(struct iwl_priv *priv,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1105:6: warning: 'iwlagn_rx_reply_tx' defined but not used [-Wunused-function]
    1105 | void iwlagn_rx_reply_tx(struct iwl_priv *priv, struct iwl_rx_cmd_buffer *rxb)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:978:13: warning: 'iwl_get_agg_tx_fail_reason' defined but not used [-Wunused-function]
     978 | const char *iwl_get_agg_tx_fail_reason(u16 status)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:673:5: warning: 'iwlagn_tx_agg_oper' defined but not used [-Wunused-function]
     673 | int iwlagn_tx_agg_oper(struct iwl_priv *priv, struct ieee80211_vif *vif,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:628:5: warning: 'iwlagn_tx_agg_flush' defined but not used [-Wunused-function]
     628 | int iwlagn_tx_agg_flush(struct iwl_priv *priv, struct ieee80211_vif *vif,
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:569:5: warning: 'iwlagn_tx_agg_start' defined but not used [-Wunused-function]
     569 | int iwlagn_tx_agg_start(struct iwl_priv *priv, struct ieee80211_vif *vif,
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/dvm/tx.c:478:5: warning: 'iwlagn_tx_agg_stop' defined but not used [-Wunused-function]
     478 | int iwlagn_tx_agg_stop(struct iwl_priv *priv, struct ieee80211_vif *vif,
         |     ^~~~~~~~~~~~~~~~~~


vim +/txq_id +2092 drivers/net/wireless/intel/iwlegacy/4965-mac.c

  2082	
  2083	/*
  2084	 * Find first available (lowest unused) Tx Queue, mark it "active".
  2085	 * Called only when finding queue for aggregation.
  2086	 * Should never return anything < 7, because they should already
  2087	 * be in use as EDCA AC (0-3), Command (4), reserved (5, 6)
  2088	 */
  2089	static int
  2090	il4965_txq_ctx_activate_free(struct il_priv *il)
  2091	{
> 2092		int txq_id = find_and_set_bit(&il->txq_ctx_active_msk, il->hw_params.max_txq_num))
  2093	
  2094		return txq_id < il->hw_params.max_txq_num ? txq_id : -1
  2095	}
  2096	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
