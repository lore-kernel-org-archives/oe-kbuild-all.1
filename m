Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD8136347
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Mar 2025 04:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741839043; cv=none; b=CJu8Niwdqkxudqu4Fag1tx9Q7d7p2YXIuEOO2yjD9wjS2fjz1Zf93KYZ4G2oRgzuqTPoyzJq04AHI19v24UmD5PgKlWy1/rqcil1yyBJpSGs7sPL6Facl0e25bz5HY3jZF4IEtT0+GBrb1ELdDtbFNU92OiXyNM7MsllIm8sy10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741839043; c=relaxed/simple;
	bh=3dlO1GFZV8FA+TOAXodPPhRXB0EMzyhZUiB8Q4sWToE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UjthmzODW+lp/9cTDl/U0NagdoBlE6blT4QwZ92WEDnNF2XPg/AAEs0wL8/yF99tdLyXmItmci6506x6L6B7elrDr/Ls7PotfZY+caRBEEpSJPGRP3v/N/deVtC8YqMgX2umnMRvDN5Uat/lW7Ez49sLaNpZb4UdbNCf8KNFvN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACZ6f2Ep; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACZ6f2Ep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741839042; x=1773375042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3dlO1GFZV8FA+TOAXodPPhRXB0EMzyhZUiB8Q4sWToE=;
  b=ACZ6f2EpGijaU0Xze9E0ugMC0NUe+2Yu1vdWsjcStYdXlAfYMfUiStmt
   zFCfClQhzMYdjvRDD9iRX02jYOGkFf3d9X0ocVB5rjnTsCMRcw0bPGeQn
   ccarovXzf2qqrS0PL2aLc6LARb58YF6vuC9AdHR+/U8/A3gwstHjecK5a
   AuXiuOSOyPFKBDOeCEhkjoNf0MdYFCVbcOXDtZ0sp0Hm9Q2DQffN5gfDP
   fqRowdAx2GKSTyJL0gOdQiWCbtg+pwqCBLJtjAIGYWUOmDKqM9NFePLPM
   37PuFLTcODIZPpzoXHSjLgFfiDNSLyZ1NrRxBh1T3TFV/2LdPSZKy/UjP
   w==;
X-CSE-ConnectionGUID: GI8QfLYkQCeN+IogAJHoQQ==
X-CSE-MsgGUID: glOeuAyeScSb44ckQnOmrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43073718"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="43073718"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 21:10:39 -0700
X-CSE-ConnectionGUID: prhoR16FR1Wxc2Mm7D/PLw==
X-CSE-MsgGUID: EAeZaey0QXS1mLy6xpaB/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="121326284"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 12 Mar 2025 21:10:37 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsZty-000970-2M;
	Thu, 13 Mar 2025 04:10:34 +0000
Date: Thu, 13 Mar 2025 12:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [linux-next:master 9768/10719]
 drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse:
 undefined preprocessor identifier 'CONFIG_PM_SLEEP'
Message-ID: <202503131215.gPgyFgkk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9fbcd7b32bf7c0a5bda0f22c25df29d00a872017
commit: 834bfc698bf7cee3bf61c0209b410c7f97a54108 [9768/10719] wifi: iwlwifi: mld: fix build with CONFIG_PM_SLEEP undefined
config: alpha-randconfig-r121-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131215.gPgyFgkk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250313/202503131215.gPgyFgkk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131215.gPgyFgkk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/wireless/intel/iwlwifi/mld/mld.c: note: in included file (through drivers/net/wireless/intel/iwlwifi/mld/mlo.h):
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/notif.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
   drivers/net/wireless/intel/iwlwifi/mld/notif.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   drivers/net/wireless/intel/iwlwifi/mld/power.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/iface.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/link.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/coex.c: note: in included file (through drivers/net/wireless/intel/iwlwifi/mld/mlo.h):
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/session-protect.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/ap.c: note: in included file (through drivers/net/wireless/intel/iwlwifi/mld/ap.h):
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   drivers/net/wireless/intel/iwlwifi/mld/key.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/rx.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/tx.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/roc.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/scan.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/sta.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/mlo.c: note: in included file (through drivers/net/wireless/intel/iwlwifi/mld/mlo.h):
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/stats.c: note: in included file (through drivers/net/wireless/intel/iwlwifi/mld/mlo.h):
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/low_latency.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/ftm-initiator.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/tests/link.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/tests/..//iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/tests/link-selection.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/tests/..//iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'
--
   drivers/net/wireless/intel/iwlwifi/mld/tests/utils.c: note: in included file:
>> drivers/net/wireless/intel/iwlwifi/mld/tests/..//iface.h:170:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_PM_SLEEP'

vim +/CONFIG_PM_SLEEP +170 drivers/net/wireless/intel/iwlwifi/mld/iface.h

d1e879ec600f9b3 Miri Korenblit 2025-02-16  116  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  117  /**
d1e879ec600f9b3 Miri Korenblit 2025-02-16  118   * struct iwl_mld_vif - virtual interface (MAC context) configuration parameters
d1e879ec600f9b3 Miri Korenblit 2025-02-16  119   *
d1e879ec600f9b3 Miri Korenblit 2025-02-16  120   * @fw_id: fw id of the mac context.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  121   * @session_protect: session protection parameters
d1e879ec600f9b3 Miri Korenblit 2025-02-16  122   * @ap_sta: pointer to AP sta, for easier access to it.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  123   *	Relevant only for STA vifs.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  124   * @authorized: indicates the AP station was set to authorized
d1e879ec600f9b3 Miri Korenblit 2025-02-16  125   * @bigtks: BIGTKs of the AP, for beacon protection.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  126   *	Only valid for STA. (FIXME: needs to be per link)
d1e879ec600f9b3 Miri Korenblit 2025-02-16  127   * @num_associated_stas: number of associated STAs. Relevant only for AP mode.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  128   * @ap_ibss_active: whether the AP/IBSS was started
d1e879ec600f9b3 Miri Korenblit 2025-02-16  129   * @roc_activity: the id of the roc_activity running. Relevant for p2p device
d1e879ec600f9b3 Miri Korenblit 2025-02-16  130   *	only. Set to %ROC_NUM_ACTIVITIES when not in use.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  131   * @cca_40mhz_workaround: When we are connected in 2.4 GHz and 40 MHz, and the
d1e879ec600f9b3 Miri Korenblit 2025-02-16  132   *	environment is too loaded, we work around this by reconnecting to the
d1e879ec600f9b3 Miri Korenblit 2025-02-16  133   *	same AP with 20 MHz. This manages the status of the workaround.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  134   * @beacon_inject_active: indicates an active debugfs beacon ie injection
d1e879ec600f9b3 Miri Korenblit 2025-02-16  135   * @low_latency_causes: bit flags, indicating the causes for low-latency,
d1e879ec600f9b3 Miri Korenblit 2025-02-16  136   *	see @iwl_mld_low_latency_cause.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  137   * @mld: pointer to the mld structure.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  138   * @deflink: default link data, for use in non-MLO,
d1e879ec600f9b3 Miri Korenblit 2025-02-16  139   * @link: reference to link data for each valid link, for use in MLO.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  140   * @emlsr: information related to EMLSR
d1e879ec600f9b3 Miri Korenblit 2025-02-16  141   * @wowlan_data: data used by the wowlan suspend flow
d1e879ec600f9b3 Miri Korenblit 2025-02-16  142   * @use_ps_poll: use ps_poll frames
d1e879ec600f9b3 Miri Korenblit 2025-02-16  143   * @disable_bf: disable beacon filter
d1e879ec600f9b3 Miri Korenblit 2025-02-16  144   * @dbgfs_slink: debugfs symlink for this interface
d1e879ec600f9b3 Miri Korenblit 2025-02-16  145   */
d1e879ec600f9b3 Miri Korenblit 2025-02-16  146  struct iwl_mld_vif {
d1e879ec600f9b3 Miri Korenblit 2025-02-16  147  	/* Add here fields that need clean up on restart */
d1e879ec600f9b3 Miri Korenblit 2025-02-16  148  	struct_group(zeroed_on_hw_restart,
d1e879ec600f9b3 Miri Korenblit 2025-02-16  149  		u8 fw_id;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  150  		struct iwl_mld_session_protect session_protect;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  151  		struct ieee80211_sta *ap_sta;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  152  		bool authorized;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  153  		struct ieee80211_key_conf __rcu *bigtks[2];
d1e879ec600f9b3 Miri Korenblit 2025-02-16  154  		u8 num_associated_stas;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  155  		bool ap_ibss_active;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  156  		u32 roc_activity;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  157  		enum iwl_mld_cca_40mhz_wa_status cca_40mhz_workaround;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  158  #ifdef CONFIG_IWLWIFI_DEBUGFS
d1e879ec600f9b3 Miri Korenblit 2025-02-16  159  		bool beacon_inject_active;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  160  #endif
d1e879ec600f9b3 Miri Korenblit 2025-02-16  161  		u8 low_latency_causes;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  162  	);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  163  	/* And here fields that survive a fw restart */
d1e879ec600f9b3 Miri Korenblit 2025-02-16  164  	struct iwl_mld *mld;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  165  	struct iwl_mld_link deflink;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  166  	struct iwl_mld_link __rcu *link[IEEE80211_MLD_MAX_NUM_LINKS];
d1e879ec600f9b3 Miri Korenblit 2025-02-16  167  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  168  	struct iwl_mld_emlsr emlsr;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  169  
d1e879ec600f9b3 Miri Korenblit 2025-02-16 @170  #if CONFIG_PM_SLEEP
d1e879ec600f9b3 Miri Korenblit 2025-02-16  171  	struct iwl_mld_wowlan_data wowlan_data;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  172  #endif
d1e879ec600f9b3 Miri Korenblit 2025-02-16  173  #ifdef CONFIG_IWLWIFI_DEBUGFS
d1e879ec600f9b3 Miri Korenblit 2025-02-16  174  	bool use_ps_poll;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  175  	bool disable_bf;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  176  	struct dentry *dbgfs_slink;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  177  #endif
d1e879ec600f9b3 Miri Korenblit 2025-02-16  178  };
d1e879ec600f9b3 Miri Korenblit 2025-02-16  179  

:::::: The code at line 170 was first introduced by commit
:::::: d1e879ec600f9b3bdd253167533959facfefb17b wifi: iwlwifi: add iwlmld sub-driver

:::::: TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
