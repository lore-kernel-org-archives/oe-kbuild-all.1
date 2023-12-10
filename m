Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818316D3F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ul8VbT1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702202501; x=1733738501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zzWhk8O2avZ8zbbXZq8tD7ZF0iPAsFXXNjRL5ZsfeA0=;
  b=Ul8VbT1Av8/oHmwYVeWHu8ogQVOi5gv1lFnngvOV6lKWVk2HK5v8sjTV
   I6oJRJmdg5pyB1/Oez+8CSD58T/3+eTxY74yQKGvXtK8E3ddPda3l9dRA
   p2KAE2SCvOLp40Ji1tGssMuEtgp2ggmDLGrKEjsL7FOwcQnXwIay8Cmzm
   axkIeMuwZsEUu4kGGJ28fF53Ot14g1XOtYyCeFBgAzqAdVyijGTavNeWi
   TsddODHIpLjGbwDXL8VZVp2XAtHVnF/vscsjkfjF+38ds7ydD4TRM2gd+
   bxK5j1A/cgW8M/OjftXo3zrhO+2bpUzvLo8krjqCK9i62sjlXDFmv/1ST
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="391717118"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="391717118"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 02:01:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="843131661"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="843131661"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Dec 2023 02:01:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCGcz-000GgW-04;
	Sun, 10 Dec 2023 10:01:37 +0000
Date: Sun, 10 Dec 2023 18:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:705
 iwl_mvm_get_session_prot_id() warn: unsigned 'link_id' is never less than
 zero.
Message-ID: <202312101708.68txSnLI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: 1350658373106eace418eea673a058a0285f8334 wifi: iwlwifi: support link_id in SESSION_PROTECTION cmd
date:   7 weeks ago
config: powerpc-randconfig-r071-20231126 (https://download.01.org/0day-ci/archive/20231210/202312101708.68txSnLI-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312101708.68txSnLI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312101708.68txSnLI-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:705 iwl_mvm_get_session_prot_id() warn: unsigned 'link_id' is never less than zero.

vim +/link_id +705 drivers/net/wireless/intel/iwlwifi/mvm/time-event.c

   691	
   692	/* Determine whether mac or link id should be used, and validate the link id */
   693	static int iwl_mvm_get_session_prot_id(struct iwl_mvm *mvm,
   694					       struct ieee80211_vif *vif,
   695					       u32 link_id)
   696	{
   697		struct iwl_mvm_vif *mvmvif = iwl_mvm_vif_from_mac80211(vif);
   698		int ver = iwl_fw_lookup_cmd_ver(mvm->fw,
   699						WIDE_ID(MAC_CONF_GROUP,
   700							SESSION_PROTECTION_CMD), 1);
   701	
   702		if (ver < 2)
   703			return mvmvif->id;
   704	
 > 705		if (WARN(link_id < 0 || !mvmvif->link[link_id],
   706			 "Invalid link ID for session protection: %u\n", link_id))
   707			return -EINVAL;
   708	
   709		if (WARN(ieee80211_vif_is_mld(vif) &&
   710			 !(vif->active_links & BIT(link_id)),
   711			 "Session Protection on an inactive link: %u\n", link_id))
   712			return -EINVAL;
   713	
   714		return mvmvif->link[link_id]->fw_link_id;
   715	}
   716	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
