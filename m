Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9215A7E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 01:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686618507; x=1718154507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SUuJLtWzz6cFwtMmr6+RKqvRczQ1+N50S8nqxq6ywWk=;
  b=Untl7AlztlhvdYnj+9II75TneMyOZaDbSgvfNVjSijurq0dorX+i2dCZ
   lmxOi5W25EUH2kMi+V5kZt+mI9dnwIYMLSdZLXH2+FWTQJAHuBpiY7UeU
   sLrC4NgbklfcZb/4W7+reTjymwbsbTVLxkkIiKqtOYpjZqmkSberdoZNT
   y02szVIxv5aC6VFEn2pCa/bZH+x6LezSYKWMOjNmZ//0UjlUDTi5Dy2zO
   u+x2oEI1VXX9ExDG+PCRkX6HUJdlGDlPunjgD1CGAF0JnexbP07MmPwBq
   P5FL4J4dZyeGW9JhHohFMfCImZRM4w2pCMEqpQtpOODzX3tZUsrvXtT0v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="358195767"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="358195767"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 18:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="744509325"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="744509325"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 18:08:25 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8sWG-0000tM-1N;
	Tue, 13 Jun 2023 01:08:24 +0000
Date: Tue, 13 Jun 2023 09:08:19 +0800
From: kernel test robot <lkp@intel.com>
To: gregory.greenman@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/15] wifi: iwlwifi: pass ESR parameters to the firmware
Message-ID: <202306130831.sTGaPqF4-lkp@intel.com>
References: <20230612184434.09fa06820d03.Ie9a9fd37d4948f8c5dd91161de254184b1a093c0@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612184434.09fa06820d03.Ie9a9fd37d4948f8c5dd91161de254184b1a093c0@changeid>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on next-20230609]
[cannot apply to wireless/main linus/master v6.4-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/gregory-greenman-intel-com/wifi-iwlwifi-make-debugfs-entries-link-specific/20230612-235504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230612184434.09fa06820d03.Ie9a9fd37d4948f8c5dd91161de254184b1a093c0%40changeid
patch subject: [PATCH 13/15] wifi: iwlwifi: pass ESR parameters to the firmware
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230613/202306130831.sTGaPqF4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add wireless-next https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git
        git fetch wireless-next main
        git checkout wireless-next/main
        b4 shazam https://lore.kernel.org/r/20230612184434.09fa06820d03.Ie9a9fd37d4948f8c5dd91161de254184b1a093c0@changeid
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130831.sTGaPqF4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c: In function 'iwl_mvm_mld_mac_ctxt_cmd_sta':
>> drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c:137:13: error: implicit declaration of function 'ieee80211_vif_is_mld'; did you mean 'ieee80211_vif_is_mesh'? [-Werror=implicit-function-declaration]
     137 |         if (ieee80211_vif_is_mld(vif)) {
         |             ^~~~~~~~~~~~~~~~~~~~
         |             ieee80211_vif_is_mesh
   cc1: some warnings being treated as errors


vim +137 drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c

    93	
    94	static int iwl_mvm_mld_mac_ctxt_cmd_sta(struct iwl_mvm *mvm,
    95						struct ieee80211_vif *vif,
    96						u32 action, bool force_assoc_off)
    97	{
    98		struct iwl_mac_config_cmd cmd = {};
    99		u16 esr_transition_timeout;
   100	
   101		WARN_ON(vif->type != NL80211_IFTYPE_STATION);
   102	
   103		/* Fill the common data for all mac context types */
   104		iwl_mvm_mld_mac_ctxt_cmd_common(mvm, vif, &cmd, action);
   105	
   106		/*
   107		 * We always want to hear MCAST frames, if we're not authorized yet,
   108		 * we'll drop them.
   109		 */
   110		cmd.filter_flags |= cpu_to_le32(MAC_CFG_FILTER_ACCEPT_GRP);
   111	
   112		if (vif->p2p)
   113			cmd.client.ctwin =
   114				iwl_mvm_mac_ctxt_cmd_p2p_sta_get_oppps_ctwin(mvm, vif);
   115	
   116		if (vif->cfg.assoc && !force_assoc_off) {
   117			struct iwl_mvm_vif *mvmvif = iwl_mvm_vif_from_mac80211(vif);
   118	
   119			cmd.client.is_assoc = 1;
   120	
   121			if (!mvmvif->authorized &&
   122			    fw_has_capa(&mvm->fw->ucode_capa,
   123					IWL_UCODE_TLV_CAPA_COEX_HIGH_PRIO))
   124				cmd.client.data_policy |=
   125					cpu_to_le16(COEX_HIGH_PRIORITY_ENABLE);
   126	
   127		} else {
   128			cmd.client.is_assoc = 0;
   129	
   130			/* Allow beacons to pass through as long as we are not
   131			 * associated, or we do not have dtim period information.
   132			 */
   133			cmd.filter_flags |= cpu_to_le32(MAC_CFG_FILTER_ACCEPT_BEACON);
   134		}
   135	
   136		cmd.client.assoc_id = cpu_to_le16(vif->cfg.aid);
 > 137		if (ieee80211_vif_is_mld(vif)) {
   138			esr_transition_timeout =
   139				u16_get_bits(vif->cfg.eml_cap,
   140					     IEEE80211_EML_CAP_TRANSITION_TIMEOUT);
   141	
   142			cmd.client.esr_transition_timeout =
   143				min_t(u16, IEEE80211_EML_CAP_TRANSITION_TIMEOUT_128TU,
   144				      esr_transition_timeout);
   145			cmd.client.medium_sync_delay =
   146				cpu_to_le16(vif->cfg.eml_med_sync_delay);
   147		}
   148	
   149		if (vif->probe_req_reg && vif->cfg.assoc && vif->p2p)
   150			cmd.filter_flags |= cpu_to_le32(MAC_CFG_FILTER_ACCEPT_PROBE_REQ);
   151	
   152		if (vif->bss_conf.he_support && !iwlwifi_mod_params.disable_11ax)
   153			cmd.client.data_policy |=
   154				cpu_to_le16(iwl_mvm_mac_ctxt_cmd_sta_get_twt_policy(mvm, vif));
   155	
   156		return iwl_mvm_mld_mac_ctxt_send_cmd(mvm, &cmd);
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
