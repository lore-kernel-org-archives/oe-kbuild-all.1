Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B4883CAF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709804637; cv=none; b=MzhJZ+cEx6GdHRcTtzs2N4qHabySAMmIER6zGiOe+HQQ4ynNin0acVteh+6ejtriNxVbDCr0FeYZcdAgv8ErtDpdcz/HpLS1BUJvYFsjfo8Ahoajt2iIAHeEXDl2ukqOuhayl9a3kbsy8wzrA3lkBN9Vk1o2zs9axmHorTXhKwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709804637; c=relaxed/simple;
	bh=YjXwBZk+63OolKSY3OKiWYTQhYDIG2vPOXIxRtTXJuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gmjHHa5FKFjYOfEl7VeI4ELMuEoZsXQU2roGfu5ZNyfn0W8r0R6Hp56H8JsG4n8H6XOJpFymQ0p+8dxh1J74gV10mWJTuFGH0zFLkzxCvS8/UUISBAF5J56SFZBabugTQ9WSBrlBVfoMgEFyspXhc6neKee13FKD8T3oyA0PBvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQjrAagn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQjrAagn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709804635; x=1741340635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YjXwBZk+63OolKSY3OKiWYTQhYDIG2vPOXIxRtTXJuc=;
  b=VQjrAagnF7XI14m+oR9D/w81Nta07sBYPwxjUxkSKlCWdmzV93ht9Nzs
   zlv10zryu8bv+x0dDCmQ4U6ewARDrlIFk/RTVAsx55f29xW1b1RO80QzB
   2F0cLDryYjWKDpeQN8fnbdHId481K8hnbM/MNBdj4PMsFjIYGbutcvgnr
   V3GT+Z2p28DcJllOgDmyIfHLnxzHlCpHXh2e03imjfkzo5Pw3KfxVgeNY
   XLr1WOfHQXpLcvz9++Z2+mm/28IbdUxY2hcKjkwPMZLetOuex30w4+S6s
   JCUjoy5m+695/4/PdTdK7Q4YSkKOmYjwgGS1rM6uw8MIssEb1gLAlNuzu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4330332"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="4330332"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 01:43:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="10484134"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Mar 2024 01:43:53 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riAI2-00052T-20;
	Thu, 07 Mar 2024 09:43:50 +0000
Date: Thu, 7 Mar 2024 17:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-chromeos:chromeos-6.1__release/core87_preview 26911/27032]
 drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c:557:6: warning: no previous
 prototype for function 'iwl_mvm_mld_valid_link_pair'
Message-ID: <202403071710.mrX6DgHn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-6.1__release/core87_preview
head:   b12af9ad04b12068b64e7502606f0e86a7d9e7d1
commit: e0dc37328540179c310686ef84727ec4e88c25f2 [26911/27032] CHROMIUM: iwl7000: mvm: don't recompute EMLSR mode in can_activate_links
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240307/202403071710.mrX6DgHn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071710.mrX6DgHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071710.mrX6DgHn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c:557:6: warning: no previous prototype for function 'iwl_mvm_mld_valid_link_pair' [-Wmissing-prototypes]
     557 | bool iwl_mvm_mld_valid_link_pair(struct ieee80211_vif *vif,
         |      ^
   drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     557 | bool iwl_mvm_mld_valid_link_pair(struct ieee80211_vif *vif,
         | ^
         | static 
   1 warning generated.


vim +/iwl_mvm_mld_valid_link_pair +557 drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c

ee49e7adc0ffc13 Miri Korenblit 2024-02-05  556  
ee49e7adc0ffc13 Miri Korenblit 2024-02-05 @557  bool iwl_mvm_mld_valid_link_pair(struct ieee80211_vif *vif,
f6bf02ae772bc6f Miri Korenblit 2024-02-07  558  				 const struct iwl_mvm_link_sel_data *a,
f6bf02ae772bc6f Miri Korenblit 2024-02-07  559  				 const struct iwl_mvm_link_sel_data *b)
ee49e7adc0ffc13 Miri Korenblit 2024-02-05  560  {
ee49e7adc0ffc13 Miri Korenblit 2024-02-05  561  	struct iwl_mvm_vif *mvmvif = iwl_mvm_vif_from_mac80211(vif);
ee49e7adc0ffc13 Miri Korenblit 2024-02-05  562  
ee49e7adc0ffc13 Miri Korenblit 2024-02-05  563  	if (a->band == b->band)
ee49e7adc0ffc13 Miri Korenblit 2024-02-05  564  		return false;
ee49e7adc0ffc13 Miri Korenblit 2024-02-05  565  
ee49e7adc0ffc13 Miri Korenblit 2024-02-05  566  	/* BT Coex effects eSR mode only if one of the link is on LB */
ee49e7adc0ffc13 Miri Korenblit 2024-02-05  567  	if (a->band == NL80211_BAND_2GHZ || b->band == NL80211_BAND_2GHZ)
da39d661d19b479 Miri Korenblit 2024-02-15  568  		return !(mvmvif->esr_disable_reason & IWL_MVM_ESR_BLOCKED_COEX);
ee49e7adc0ffc13 Miri Korenblit 2024-02-05  569  
ee49e7adc0ffc13 Miri Korenblit 2024-02-05  570  	return true;
ee49e7adc0ffc13 Miri Korenblit 2024-02-05  571  }
f6bf02ae772bc6f Miri Korenblit 2024-02-07  572  EXPORT_SYMBOL_IF_IWLWIFI_KUNIT(iwl_mvm_mld_valid_link_pair);
ee49e7adc0ffc13 Miri Korenblit 2024-02-05  573  

:::::: The code at line 557 was first introduced by commit
:::::: ee49e7adc0ffc13c14dfc6c4d7b86ba250797a85 CHROMIUM: iwl7000: mvm: move emlsr/links code

:::::: TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
:::::: CC: Intel ChromeOS bot <linuxwifi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
