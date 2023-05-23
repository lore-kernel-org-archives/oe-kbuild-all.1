Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753012068F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 May 2023 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684859125; x=1716395125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O69jBlq/O9ZWBRo80aAaUCXc6c+7RlMVM3av/LAgNlo=;
  b=PCHRQoINW12+kkl3vintFLXHqh2S6olu86+jwJ2rFsmE/26wVt6n5t7E
   SOSD8q+ai1LCuN7MHugKH+VAyeGRt1itXLMhG/j3JzDRICmoOyw7B7Nt8
   D+ALXEVB0KmPD8J5tcFG9QS8WqmcuiYqQMI/DQbeTpGsue8sXkJ9KHP4A
   7/pb+W8SAezxyUX8NBlm1Vu4FYnohHluiXPD2etiW2BLbM9hTDuq1SbiZ
   ejEx9zBHvowiMHiGI2e1nnvCGmsalDXrNxAkF07zdy16SGNNYEjJ8o9Z2
   MI5SzDyRqN7sdBaIcsW9VPUZjeTGgsdf7eiV9bkr/sHoRNo/cdNhIYnft
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="342751183"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="342751183"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 09:25:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816192726"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="816192726"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 May 2023 09:25:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1Up6-000Dv1-35;
	Tue, 23 May 2023 16:25:20 +0000
Date: Wed, 24 May 2023 00:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pendifng 10/15]
 drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c:137:38: error: 'struct
 ieee80211_vif_cfg' has no member named 'eml_cap'
Message-ID: <202305240001.mAckcNwx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git pendifng
head:   fa1b8d45a624d9df2549efc325570e32e890e6a0
commit: 4b2eca95752914d89e8a0cda11a39add155d4a60 [10/15] wifi: iwlwifi: pass the esr_transition_timeout to the firmware
config: powerpc-randconfig-r021-20230521 (https://download.01.org/0day-ci/archive/20230524/202305240001.mAckcNwx-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/commit/?id=4b2eca95752914d89e8a0cda11a39add155d4a60
        git remote add iwlwifi-next https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
        git fetch --no-tags iwlwifi-next pendifng
        git checkout 4b2eca95752914d89e8a0cda11a39add155d4a60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/wireless/intel/iwlwifi/mvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305240001.mAckcNwx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c: In function 'iwl_mvm_mld_mac_ctxt_cmd_sta':
>> drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c:137:38: error: 'struct ieee80211_vif_cfg' has no member named 'eml_cap'
     137 |                 u16_get_bits(vif->cfg.eml_cap,
         |                                      ^


vim +137 drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c

    93	
    94	static int iwl_mvm_mld_mac_ctxt_cmd_sta(struct iwl_mvm *mvm,
    95						struct ieee80211_vif *vif,
    96						u32 action, bool force_assoc_off)
    97	{
    98		struct iwl_mac_config_cmd cmd = {};
    99	
   100		WARN_ON(vif->type != NL80211_IFTYPE_STATION);
   101	
   102		/* Fill the common data for all mac context types */
   103		iwl_mvm_mld_mac_ctxt_cmd_common(mvm, vif, &cmd, action);
   104	
   105		/*
   106		 * We always want to hear MCAST frames, if we're not authorized yet,
   107		 * we'll drop them.
   108		 */
   109		cmd.filter_flags |= cpu_to_le32(MAC_CFG_FILTER_ACCEPT_GRP);
   110	
   111		if (vif->p2p)
   112			cmd.client.ctwin =
   113				iwl_mvm_mac_ctxt_cmd_p2p_sta_get_oppps_ctwin(mvm, vif);
   114	
   115		if (vif->cfg.assoc && !force_assoc_off) {
   116			struct iwl_mvm_vif *mvmvif = iwl_mvm_vif_from_mac80211(vif);
   117	
   118			cmd.client.is_assoc = 1;
   119	
   120			if (!mvmvif->authorized &&
   121			    fw_has_capa(&mvm->fw->ucode_capa,
   122					IWL_UCODE_TLV_CAPA_COEX_HIGH_PRIO))
   123				cmd.client.data_policy |=
   124					cpu_to_le16(COEX_HIGH_PRIORITY_ENABLE);
   125	
   126		} else {
   127			cmd.client.is_assoc = 0;
   128	
   129			/* Allow beacons to pass through as long as we are not
   130			 * associated, or we do not have dtim period information.
   131			 */
   132			cmd.filter_flags |= cpu_to_le32(MAC_CFG_FILTER_ACCEPT_BEACON);
   133		}
   134	
   135		cmd.client.assoc_id = cpu_to_le16(vif->cfg.aid);
   136		cmd.client.esr_transition_timeout =
 > 137			u16_get_bits(vif->cfg.eml_cap,
   138				     IEEE80211_EML_CAP_TRANSITION_TIMEOUT);
   139	
   140		if (vif->probe_req_reg && vif->cfg.assoc && vif->p2p)
   141			cmd.filter_flags |= cpu_to_le32(MAC_CFG_FILTER_ACCEPT_PROBE_REQ);
   142	
   143		if (vif->bss_conf.he_support && !iwlwifi_mod_params.disable_11ax)
   144			cmd.client.data_policy |=
   145				cpu_to_le16(iwl_mvm_mac_ctxt_cmd_sta_get_twt_policy(mvm, vif));
   146	
   147		return iwl_mvm_mld_mac_ctxt_send_cmd(mvm, &cmd);
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
