Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8938A802
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742753047; cv=none; b=sdg8Z4W0l+G3PsVGrCQQ/9yKYm2+Hc+/ZBtkpow6eAMyGsaxf33fjbnQXYTOj3cIvxhvuapjL99g40XYUTqbIJ9bHoBMS/eYYFYAn11kQclNW7CIk/4Wq0rxKkUyLCLd4Yqm+Luh10Y7B2+KH6ndB7g997YcqD1SPhSbM3v9B3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742753047; c=relaxed/simple;
	bh=pAptX7p2qw39z2uJn82tFSSchslKFk+McfuITMSuIJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+mmVBitYa1Z9DTH2rvt7rZWtBVaPMhV/1KEiF0Qrjzz73QrBelyKHtvnFVHUxkrjJW6PeaAwL5SmzAeBFRZnKc5CsKmKJtLo8XnAjoSONiw83nUobVP/zT9zpD4muAA+/XsE19gTkJXQKOVVqNji94ORRtZfYNv6OxOpc+0yXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0pLuujA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0pLuujA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742753046; x=1774289046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pAptX7p2qw39z2uJn82tFSSchslKFk+McfuITMSuIJc=;
  b=Q0pLuujApSXM+7cX4mP/mSZ/lGr+ffJObGuaxi5lqIvrm26U8kBViPcJ
   JeCwWwFC6PmEvCXwRLwsPX0zyvcr+ry8sM0V5OKDjOQb4YD4eKPKukS7C
   n0v4RWzN8sW1IPcFbCg1n5th8IJPskxFOPDSUvEVHcdO2RvM6KdHMjUa+
   ZZ1WFidD9khPbMj29QQiqAuEGsre7iZwNWbZrHMl8Ae3zj7LNY1tleY0f
   JNClZxmfE6UlRBKB+0CTWqcleYxVpa1Cq0ejTyiQ8r4nYBzHnrwRjOVRb
   eSwr+t7v3quapDWcxBOdmEzNk340AKfjmkt7YWs/a7pfLqK5Lr73E2spZ
   w==;
X-CSE-ConnectionGUID: VbE72DwrTPOZ69jUdtRU+Q==
X-CSE-MsgGUID: I/VMyJePT/CXYpqbBAhcWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="54586635"
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="54586635"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 11:04:05 -0700
X-CSE-ConnectionGUID: lQpQ4K8CSf6VGDwgFdTanw==
X-CSE-MsgGUID: Ew3bzWdrRyqSxZJAxAlJXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="147057874"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Mar 2025 11:04:03 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twPg1-0002tS-2o;
	Sun, 23 Mar 2025 18:04:01 +0000
Date: Mon, 24 Mar 2025 02:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 3/5] wifi: mac80211: Set RTS threshold on per-radio
 basis
Message-ID: <202503240158.ILYUhCHX-lkp@intel.com>
References: <20250323073959.2872641-4-quic_rdevanat@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250323073959.2872641-4-quic_rdevanat@quicinc.com>

Hi Roopni,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1794d7ab34d2221ac7eb921b171e75b856e10561]

url:    https://github.com/intel-lab-lkp/linux/commits/Roopni-Devanathan/wifi-cfg80211-Add-Support-to-Set-RTS-Threshold-for-each-Radio/20250323-154228
base:   1794d7ab34d2221ac7eb921b171e75b856e10561
patch link:    https://lore.kernel.org/r/20250323073959.2872641-4-quic_rdevanat%40quicinc.com
patch subject: [PATCH v5 3/5] wifi: mac80211: Set RTS threshold on per-radio basis
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250324/202503240158.ILYUhCHX-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503240158.ILYUhCHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503240158.ILYUhCHX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:12:
   drivers/net/wireless/intel/iwlwifi/mld/iface.h:169:5: warning: "CONFIG_PM_SLEEP" is not defined, evaluates to 0 [-Wundef]
     169 | #if CONFIG_PM_SLEEP
         |     ^~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:2618:30: error: initialization of 'int (*)(struct ieee80211_hw *, s8,  u32)' {aka 'int (*)(struct ieee80211_hw *, signed char,  unsigned int)'} from incompatible pointer type 'int (*)(struct ieee80211_hw *, u32)' {aka 'int (*)(struct ieee80211_hw *, unsigned int)'} [-Wincompatible-pointer-types]
    2618 |         .set_rts_threshold = iwl_mld_mac80211_set_rts_threshold,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:2618:30: note: (near initialization for 'iwl_mld_hw_ops.set_rts_threshold')
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:1982:12: warning: 'iwl_mld_resume' defined but not used [-Wunused-function]
    1982 | static int iwl_mld_resume(struct ieee80211_hw *hw)
         |            ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:1960:1: warning: 'iwl_mld_suspend' defined but not used [-Wunused-function]
    1960 | iwl_mld_suspend(struct ieee80211_hw *hw, struct cfg80211_wowlan *wowlan)
         | ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:1946:13: warning: 'iwl_mld_set_wakeup' defined but not used [-Wunused-function]
    1946 | static void iwl_mld_set_wakeup(struct ieee80211_hw *hw, bool enabled)
         |             ^~~~~~~~~~~~~~~~~~


vim +2618 drivers/net/wireless/intel/iwlwifi/mld/mac80211.c

d1e879ec600f9b Miri Korenblit 2025-02-16  2600  
d1e879ec600f9b Miri Korenblit 2025-02-16  2601  const struct ieee80211_ops iwl_mld_hw_ops = {
d1e879ec600f9b Miri Korenblit 2025-02-16  2602  	.tx = iwl_mld_mac80211_tx,
d1e879ec600f9b Miri Korenblit 2025-02-16  2603  	.start = iwl_mld_mac80211_start,
d1e879ec600f9b Miri Korenblit 2025-02-16  2604  	.stop = iwl_mld_mac80211_stop,
d1e879ec600f9b Miri Korenblit 2025-02-16  2605  	.config = iwl_mld_mac80211_config,
d1e879ec600f9b Miri Korenblit 2025-02-16  2606  	.add_interface = iwl_mld_mac80211_add_interface,
d1e879ec600f9b Miri Korenblit 2025-02-16  2607  	.remove_interface = iwl_mld_mac80211_remove_interface,
d1e879ec600f9b Miri Korenblit 2025-02-16  2608  	.conf_tx = iwl_mld_mac80211_conf_tx,
d1e879ec600f9b Miri Korenblit 2025-02-16  2609  	.prepare_multicast = iwl_mld_mac80211_prepare_multicast,
d1e879ec600f9b Miri Korenblit 2025-02-16  2610  	.configure_filter = iwl_mld_mac80211_configure_filter,
d1e879ec600f9b Miri Korenblit 2025-02-16  2611  	.reconfig_complete = iwl_mld_mac80211_reconfig_complete,
d1e879ec600f9b Miri Korenblit 2025-02-16  2612  	.wake_tx_queue = iwl_mld_mac80211_wake_tx_queue,
d1e879ec600f9b Miri Korenblit 2025-02-16  2613  	.add_chanctx = iwl_mld_add_chanctx,
d1e879ec600f9b Miri Korenblit 2025-02-16  2614  	.remove_chanctx = iwl_mld_remove_chanctx,
d1e879ec600f9b Miri Korenblit 2025-02-16  2615  	.change_chanctx = iwl_mld_change_chanctx,
d1e879ec600f9b Miri Korenblit 2025-02-16  2616  	.assign_vif_chanctx = iwl_mld_assign_vif_chanctx,
d1e879ec600f9b Miri Korenblit 2025-02-16  2617  	.unassign_vif_chanctx = iwl_mld_unassign_vif_chanctx,
d1e879ec600f9b Miri Korenblit 2025-02-16 @2618  	.set_rts_threshold = iwl_mld_mac80211_set_rts_threshold,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
