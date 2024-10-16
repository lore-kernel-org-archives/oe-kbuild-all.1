Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E4C16A94A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 03:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050935; cv=none; b=N0CFQW9U191NXHOAtSSVXXuILDAQRB1NkHMOuARjwNFx5lRUy8P5XKxDLyYujQSynJBWIg7HBHdOGd6Tw+pLQATtAjc23EFp8plNSQy5A76tPiyBFecFBiZTOqokSTglcHAjMbJXFcKfg5Oree124xb+LLzILhrX8YVFMFuK5wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050935; c=relaxed/simple;
	bh=pcP3m+S5BCDKp+GWNOcS4iQgoYUKZtZCx/uvDquQ1h4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YNAGlBNUM8m1PEWLYo5ERb8KIWYdqeoPYRVAbC00ID7ry84EAfkWRjNXPcz1VX2i6c/GWPAicX7fnZRjMqaZb01DdwIRO5j6PaNfLurHMvgddlc4MWBCAUABXzhqw1k2f0bYXFA0dwdfQNI9bHRdWPRCePGADI8eQX/p3ME0Tww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R62Qlda2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R62Qlda2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729050933; x=1760586933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pcP3m+S5BCDKp+GWNOcS4iQgoYUKZtZCx/uvDquQ1h4=;
  b=R62Qlda2vYvURH9jj+9YuTdkkctWzk6ItR3ZUQoSXZC7D+qqH+99S0ap
   LMu+GgviBLvLvNKXBNydYKZ6u6Ns/ASkM16sM8NAevdzC9zL8DoKAqJw6
   hS6pdG+hp4T2YvUEe6o8lTltTek5yMfSrPwXllGbSyj7ChadoXJjPCRVQ
   9iq7ljGcgE3euk9Do5vVGSdychFe4M2oU9DF8VqeTLtlrwWWSA9Ut+TC0
   kfthwA1+1xUBFPBBkqWkMJ8WWLFUs+mH5UzxoRzwqehhOfqalEkpARByU
   FaZ8KQN5DbrJWoqZ4PXTLJzR6VtCfKJ2ozYLBIqFpZrtkUeWYtclN11yk
   A==;
X-CSE-ConnectionGUID: eYb4+GF1TlSS5/19E2iyBA==
X-CSE-MsgGUID: ZY8eleRGQb6ypPeoRntB/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28268905"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28268905"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:55:33 -0700
X-CSE-ConnectionGUID: jkpxWTquRAGS3GXpZ191QQ==
X-CSE-MsgGUID: rNRWIaxDTFWVaT2DT+OMmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="82756313"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2024 20:55:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0v8C-000KFX-2O;
	Wed, 16 Oct 2024 03:55:28 +0000
Date: Wed, 16 Oct 2024 11:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-chromeos:chromeos-6.6__release/core91-69 1/1]
 drivers/net/wireless/iwl7000/hdrs/backports.h:85:42: error: too many
 arguments to function call, expected single argument 'sband', have 2
 arguments
Message-ID: <202410161146.r1jPar8j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-6.6__release/core91-69
head:   ebfb814a113b53c07fcd0ea2051998419e0a4b44
commit: ebfb814a113b53c07fcd0ea2051998419e0a4b44 [1/1] Merge remote-tracking branch 'upstream/chromeos-6.6' into chromeos-6.6__release/core91-69 Change-Id: I7af1f4f90921ee4fb520d8a76ee531979ea05206
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241016/202410161146.r1jPar8j-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161146.r1jPar8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161146.r1jPar8j-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
   In file included from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:72:
>> drivers/net/wireless/iwl7000/hdrs/backports.h:85:42: error: too many arguments to function call, expected single argument 'sband', have 2 arguments
      85 |         return ieee80211_mandatory_rates(sband, NL80211_BSS_CHAN_WIDTH_20);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~        ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/cfg80211.h:6290:5: note: 'ieee80211_mandatory_rates' declared here
    6290 | u32 ieee80211_mandatory_rates(struct ieee80211_supported_band *sband);
         |     ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from <built-in>:4:
   In file included from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:72:
>> drivers/net/wireless/iwl7000/hdrs/backports.h:85:42: error: too many arguments to function call, expected single argument 'sband', have 2 arguments
      85 |         return ieee80211_mandatory_rates(sband, NL80211_BSS_CHAN_WIDTH_20);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~        ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/cfg80211.h:6290:5: note: 'ieee80211_mandatory_rates' declared here
    6290 | u32 ieee80211_mandatory_rates(struct ieee80211_supported_band *sband);
         |     ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c:10:10: fatal error: 'linux/hsr_main.h' file not found
      10 | #include <linux/hsr_main.h>
         |          ^~~~~~~~~~~~~~~~~~
   2 errors generated.
--
   In file included from <built-in>:4:
   In file included from drivers/net/wireless/iwl7000/hdrs/iwl-chrome.h:72:
>> drivers/net/wireless/iwl7000/hdrs/backports.h:85:42: error: too many arguments to function call, expected single argument 'sband', have 2 arguments
      85 |         return ieee80211_mandatory_rates(sband, NL80211_BSS_CHAN_WIDTH_20);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~        ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/cfg80211.h:6290:5: note: 'ieee80211_mandatory_rates' declared here
    6290 | u32 ieee80211_mandatory_rates(struct ieee80211_supported_band *sband);
         |     ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/iwl7000/iwlwifi/mld/scan.c:425:25: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always true [-Wtautological-constant-out-of-range-compare]
     425 |         if (params->fw_link_id != IWL_MLD_INVALID_FW_ID)
         |             ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/sband +85 drivers/net/wireless/iwl7000/hdrs/backports.h

1e4a41b781a6ff drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Miri Korenblit   2023-12-12  73  
1e4a41b781a6ff drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Miri Korenblit   2023-12-12  74  static inline void
efe362122476b8 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Johannes Berg    2023-08-25  75  WRAP_LOCKED(cfg80211_links_removed)(struct net_device *dev, u16 removed_links)
1e4a41b781a6ff drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Miri Korenblit   2023-12-12  76  {
1e4a41b781a6ff drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Miri Korenblit   2023-12-12  77  	mutex_lock(&dev->ieee80211_ptr->mtx);
efe362122476b8 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Johannes Berg    2023-08-25  78  	cfg80211_links_removed(dev, removed_links);
1e4a41b781a6ff drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Miri Korenblit   2023-12-12  79  	mutex_unlock(&dev->ieee80211_ptr->mtx);
1e4a41b781a6ff drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Miri Korenblit   2023-12-12  80  }
efe362122476b8 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Johannes Berg    2023-08-25  81  #define cfg80211_links_removed WRAP_LOCKED(cfg80211_links_removed)
581737203d19b3 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Gregory Greenman 2023-11-20  82  static inline u32
581737203d19b3 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Gregory Greenman 2023-11-20  83  iwl7000_ieee80211_mandatory_rates(struct ieee80211_supported_band *sband)
581737203d19b3 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Gregory Greenman 2023-11-20  84  {
581737203d19b3 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Gregory Greenman 2023-11-20 @85  	return ieee80211_mandatory_rates(sband, NL80211_BSS_CHAN_WIDTH_20);
581737203d19b3 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Gregory Greenman 2023-11-20  86  }
581737203d19b3 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Gregory Greenman 2023-11-20  87  #define ieee80211_mandatory_rates iwl7000_ieee80211_mandatory_rates
581737203d19b3 drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h Gregory Greenman 2023-11-20  88  

:::::: The code at line 85 was first introduced by commit
:::::: 581737203d19b3965a6d7454540c34537802f27b CHROMIUM: iwl7000: Merge remote-tracking branch 'auto/master'

:::::: TO: Gregory Greenman <gregory.greenman@intel.com>
:::::: CC: Intel ChromeOS bot <linuxwifi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
