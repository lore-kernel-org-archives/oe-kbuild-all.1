Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F93E2D61E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+WNdK4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698241210; x=1729777210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YlossqO/GVB0DtVkhlcmgM8lhpDZMECR+NERJItPjfg=;
  b=Q+WNdK4TnHGzHRpumu5UHcn9mmQ9+ZHQoiXoJqVm5bS2ZWzEgiZtB6/1
   uSbwe64Bh0eluE41mfJXOOi0a7xqwGft3erVS6v2TLkeLaM3+FrfWN6ZG
   rfgs2UvMADU0M4VBmhvdlt2QVLdhLNAzKeo65Hklnoi16N93mK9rLQIen
   h+Q0DDJS05MtutTSE31PgZenGYDW2ltLyAKZgUaiMYqL92r3s1RbXp3jy
   ArhK+Lup4Apb5VdThFGTfPyQG0KwZ+7zE+wNWwgiLBN0Cn2Hawwz0YJ7C
   PjCQOogQLxv4KBxGQZ6W8iOlhkXwY/tBrZbzt2rVTnp4iDKUNrgnEmCkb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="62554"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="62554"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 06:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="1090222718"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="1090222718"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Oct 2023 06:40:08 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qve7B-0008uP-2w;
	Wed, 25 Oct 2023 13:40:05 +0000
Date: Wed, 25 Oct 2023 21:39:28 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_clear_tmp 23/47]
 drivers/net/wireless/intel/iwlegacy/4965-mac.c:6782:1: warning: 'alias'
 attribute ignored
Message-ID: <202310252141.wtn865We-lkp@intel.com>
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
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231025/202310252141.wtn865We-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310252141.wtn865We-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310252141.wtn865We-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

         | ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c: In function 'il4965_down':
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:5452:9: error: implicit declaration of function 'il4965_cancel_deferred_work'; did you mean 'il_cancel_scan_deferred_work'? [-Werror=implicit-function-declaration]
    5452 |         il4965_cancel_deferred_work(il);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         il_cancel_scan_deferred_work
   drivers/net/wireless/intel/iwlegacy/4965-mac.c: In function 'il4965_txq_ctx_activate_free':
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:5457:1: error: invalid storage class for function 'il4965_set_hw_ready'
    5457 | il4965_set_hw_ready(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:5476:1: error: invalid storage class for function 'il4965_prepare_card_hw'
    5476 | il4965_prepare_card_hw(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:5502:1: error: invalid storage class for function '__il4965_up'
    5502 | __il4965_up(struct il_priv *il)
         | ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:5610:1: error: invalid storage class for function 'il4965_bg_init_alive_start'
    5610 | il4965_bg_init_alive_start(struct work_struct *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:5625:1: error: invalid storage class for function 'il4965_bg_alive_start'
    5625 | il4965_bg_alive_start(struct work_struct *data)
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:5640:1: error: invalid storage class for function 'il4965_bg_run_time_calib_work'
    5640 | il4965_bg_run_time_calib_work(struct work_struct *work)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:5662:1: error: invalid storage class for function 'il4965_bg_restart'
    5662 | il4965_bg_restart(struct work_struct *data)
         | ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:5693:1: error: invalid storage class for function 'il4965_bg_rx_replenish'
    5693 | il4965_bg_rx_replenish(struct work_struct *data)
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:5718:1: error: invalid storage class for function 'il4965_mac_setup_register'
    5718 | il4965_mac_setup_register(struct il_priv *il, u32 max_probe_length)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6184:1: error: invalid storage class for function 'il4965_bg_txpower_work'
    6184 | il4965_bg_txpower_work(struct work_struct *work)
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6212:1: error: invalid storage class for function 'il4965_setup_deferred_work'
    6212 | il4965_setup_deferred_work(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6240:1: error: invalid storage class for function 'il4965_cancel_deferred_work'
    6240 | il4965_cancel_deferred_work(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6253:1: error: invalid storage class for function 'il4965_init_hw_rates'
    6253 | il4965_init_hw_rates(struct il_priv *il, struct ieee80211_rate *rates)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6307:15: error: initializer element is not constant
    6307 |         .tx = il4965_mac_tx,
         |               ^~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6307:15: note: (near initialization for 'il4965_mac_ops.tx')
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6309:18: error: initializer element is not constant
    6309 |         .start = il4965_mac_start,
         |                  ^~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6309:18: note: (near initialization for 'il4965_mac_ops.start')
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6310:17: error: initializer element is not constant
    6310 |         .stop = il4965_mac_stop,
         |                 ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6310:17: note: (near initialization for 'il4965_mac_ops.stop')
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6315:29: error: initializer element is not constant
    6315 |         .configure_filter = il4965_configure_filter,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6315:29: note: (near initialization for 'il4965_mac_ops.configure_filter')
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6316:20: error: initializer element is not constant
    6316 |         .set_key = il4965_mac_set_key,
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6316:20: note: (near initialization for 'il4965_mac_ops.set_key')
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6317:28: error: initializer element is not constant
    6317 |         .update_tkip_key = il4965_mac_update_tkip_key,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6317:28: note: (near initialization for 'il4965_mac_ops.update_tkip_key')
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6321:25: error: initializer element is not constant
    6321 |         .ampdu_action = il4965_mac_ampdu_action,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6321:25: note: (near initialization for 'il4965_mac_ops.ampdu_action')
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6323:20: error: initializer element is not constant
    6323 |         .sta_add = il4965_mac_sta_add,
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6323:20: note: (near initialization for 'il4965_mac_ops.sta_add')
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6325:27: error: initializer element is not constant
    6325 |         .channel_switch = il4965_mac_channel_switch,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6325:27: note: (near initialization for 'il4965_mac_ops.channel_switch')
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6331:1: error: invalid storage class for function 'il4965_init_drv'
    6331 | il4965_init_drv(struct il_priv *il)
         | ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6381:1: error: invalid storage class for function 'il4965_uninit_drv'
    6381 | il4965_uninit_drv(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6389:1: error: invalid storage class for function 'il4965_hw_detect'
    6389 | il4965_hw_detect(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6425:1: error: invalid storage class for function 'il4965_set_hw_params'
    6425 | il4965_set_hw_params(struct il_priv *il)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6473:1: error: invalid storage class for function 'il4965_pci_probe'
    6473 | il4965_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
         | ^~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6683:1: error: invalid storage class for function 'il4965_pci_remove'
    6683 | il4965_pci_remove(struct pci_dev *pdev)
         | ^~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:6782:1: warning: 'alias' attribute ignored [-Wattributes]
    6782 | MODULE_DEVICE_TABLE(pci, il4965_hw_card_ids);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6787:18: error: initializer element is not constant
    6787 |         .probe = il4965_pci_probe,
         |                  ^~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6787:18: note: (near initialization for 'il4965_driver.probe')
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6788:19: error: initializer element is not constant
    6788 |         .remove = il4965_pci_remove,
         |                   ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6788:19: note: (near initialization for 'il4965_driver.remove')
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6793:1: error: invalid storage class for function 'il4965_init'
    6793 | il4965_init(void)
         | ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6820:1: error: invalid storage class for function 'il4965_exit'
    6820 | il4965_exit(void)
         | ^~~~~~~~~~~
>> include/linux/module.h:139:49: error: invalid storage class for function '__exittest'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6826:1: note: in expansion of macro 'module_exit'
    6826 | module_exit(il4965_exit);
         | ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6826:1: warning: 'alias' attribute ignored [-Wattributes]
>> include/linux/module.h:131:49: error: invalid storage class for function '__inittest'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6827:1: note: in expansion of macro 'module_init'
    6827 | module_init(il4965_init);
         | ^~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6827:1: warning: 'alias' attribute ignored [-Wattributes]
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
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:2092:13: warning: unused variable 'txq_id' [-Wunused-variable]
    2092 |         int txq_id = find_and_set_bit(&il->txq_ctx_active_msk, il->hw_params.max_txq_num))
         |             ^~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6843:1: error: no return statement in function returning non-void [-Werror=return-type]
    6843 | MODULE_PARM_DESC(fw_restart, "restart firmware in case of error");
         | ^~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c: At top level:
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6765:1: warning: 'il4965_txq_set_sched' defined but not used [-Wunused-function]
    6765 | il4965_txq_set_sched(struct il_priv *il, u32 mask)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6284:1: warning: 'il4965_tx_queue_set_status' defined but not used [-Wunused-function]
    6284 | il4965_tx_queue_set_status(struct il_priv *il, struct il_tx_queue *txq,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6277:1: warning: 'il4965_set_wr_ptrs' defined but not used [-Wunused-function]
    6277 | il4965_set_wr_ptrs(struct il_priv *il, int txq_id, u32 idx)
         | ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:6240:1: warning: 'il4965_cancel_deferred_work' defined but not used [-Wunused-function]
    6240 | il4965_cancel_deferred_work(struct il_priv *il)


vim +/alias +6782 drivers/net/wireless/intel/iwlegacy/4965-mac.c

be663ab67077fac drivers/net/wireless/iwlegacy/iwl4965-base.c Wey-Yi Guy        2011-02-21  6769  
be663ab67077fac drivers/net/wireless/iwlegacy/iwl4965-base.c Wey-Yi Guy        2011-02-21  6770  /*****************************************************************************
be663ab67077fac drivers/net/wireless/iwlegacy/iwl4965-base.c Wey-Yi Guy        2011-02-21  6771   *
be663ab67077fac drivers/net/wireless/iwlegacy/iwl4965-base.c Wey-Yi Guy        2011-02-21  6772   * driver and module entry point
be663ab67077fac drivers/net/wireless/iwlegacy/iwl4965-base.c Wey-Yi Guy        2011-02-21  6773   *
be663ab67077fac drivers/net/wireless/iwlegacy/iwl4965-base.c Wey-Yi Guy        2011-02-21  6774   *****************************************************************************/
be663ab67077fac drivers/net/wireless/iwlegacy/iwl4965-base.c Wey-Yi Guy        2011-02-21  6775  
be663ab67077fac drivers/net/wireless/iwlegacy/iwl4965-base.c Wey-Yi Guy        2011-02-21  6776  /* Hardware specific file defines the PCI IDs table for that hardware module */
9baa3c34ac4e27f drivers/net/wireless/iwlegacy/4965-mac.c     Benoit Taine      2014-08-08  6777  static const struct pci_device_id il4965_hw_card_ids[] = {
e2ebc8337d116ac drivers/net/wireless/iwlegacy/iwl4965-base.c Stanislaw Gruszka 2011-10-24  6778  	{IL_PCI_DEVICE(0x4229, PCI_ANY_ID, il4965_cfg)},
e2ebc8337d116ac drivers/net/wireless/iwlegacy/iwl4965-base.c Stanislaw Gruszka 2011-10-24  6779  	{IL_PCI_DEVICE(0x4230, PCI_ANY_ID, il4965_cfg)},
be663ab67077fac drivers/net/wireless/iwlegacy/iwl4965-base.c Wey-Yi Guy        2011-02-21  6780  	{0}
be663ab67077fac drivers/net/wireless/iwlegacy/iwl4965-base.c Wey-Yi Guy        2011-02-21  6781  };
e2ebc8337d116ac drivers/net/wireless/iwlegacy/iwl4965-base.c Stanislaw Gruszka 2011-10-24 @6782  MODULE_DEVICE_TABLE(pci, il4965_hw_card_ids);
be663ab67077fac drivers/net/wireless/iwlegacy/iwl4965-base.c Wey-Yi Guy        2011-02-21  6783  

:::::: The code at line 6782 was first introduced by commit
:::::: e2ebc8337d116acdc25469ec8547ae665f50a4c1 iwlegacy: rename iwl to il

:::::: TO: Stanislaw Gruszka <sgruszka@redhat.com>
:::::: CC: Stanislaw Gruszka <sgruszka@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
