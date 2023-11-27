Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B501FD2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 03:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMc8oJHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701054743; x=1732590743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zp5w+zWsbiraaMb6jH8e3WmADHTkwEWXvGq3dw9NuYE=;
  b=jMc8oJHugOWdhJdnFwfbSOH9+fLxqugC7fmaogGUsgZMmCSFp0aqpXPB
   aEXJqR050J8F97Bx36MVFySWwT5d/aaPQi6slq8zGwWbjrhjCsoZLxuJw
   1/UEtQ5ZiFu4nK39DnRUrQCHxXfb+OLCuwMLIfJ4KlMFQKh29MzmWzjKN
   Y53Ut+wzV9pUMLnNfrVMVflkiHXD5X1BgCgboQrmFuPkIsuATsnq/yAuU
   nVvnH9yh4pG9XwufyVqkufCUfZBB0r6766wP8TftYoNvFmxvzUfTFyoTm
   8Cj0J4fqzEcg697wz+Uhxe/lLsylVtolAtUoAPvdcgXO/4Y1E18nm7U1b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391500969"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="391500969"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 19:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="858900617"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="858900617"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Nov 2023 19:12:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7S2l-0005mN-12;
	Mon, 27 Nov 2023 03:12:19 +0000
Date: Mon, 27 Nov 2023 11:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:705
 iwl_mvm_get_session_prot_id() warn: unsigned 'link_id' is never less than
 zero.
Message-ID: <202311270932.ewkH5ZT0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2da77f431ac49b5763b88751a75f70daa46296c
commit: 1350658373106eace418eea673a058a0285f8334 wifi: iwlwifi: support link_id in SESSION_PROTECTION cmd
date:   5 weeks ago
config: powerpc-randconfig-r071-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270932.ewkH5ZT0-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270932.ewkH5ZT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270932.ewkH5ZT0-lkp@intel.com/

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
