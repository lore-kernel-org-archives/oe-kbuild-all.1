Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27BA20DF4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Sep 2024 04:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725166354; cv=none; b=RMmO/Md5vQUbVl7cFIat2VWfNu9tjr/e1LkwMfrix+xunm2gkRSFurdnhfrcU8SVwsR5LIapWsvWIOxdHdEbYF8SlZzSQXFIBMj+Uchn2pw/mIpmBRzv4TLsT3rucpl3uEFeYrEZN2AsKPvEyHLzG7dDXpsTnZL6agBcxGra1Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725166354; c=relaxed/simple;
	bh=omE5/vCnziSIC+xTgRROR69G9EKJv5WR11yQDBGej1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuTU09qlAG5N5zk6pob5F8Pds9IaoJEwg5WotZgh8PDSzDSWfVRG4YyHl0X8OoEjKD/MlQbjGc5mLZ2+bLIw7Chsgq2xXzS3TGbX8wt3Tt2lXH0C7iKX3fMqie7cGjly2M7RC1Efp3NHDxJiPMSJvp0W1pnzpFxWz9unwWIMCbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idW5fNKB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idW5fNKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725166353; x=1756702353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=omE5/vCnziSIC+xTgRROR69G9EKJv5WR11yQDBGej1Q=;
  b=idW5fNKBD0SWR9odLwlsdxCTZHyKlN3AmHcAtGn0SXMTrqVEAGw/idsP
   SDxEG9Y+OVTsBr736Q1XjwMF3aPewqMOT5ZIkqcD/fOmZyMKC4IWYe9WM
   qRRbHORwZSoLrmAhk0bRXAcy+xXiSD4n0eJiQZQaIyTfS/MLitPpHKQOX
   YJyKuxNlIhj9KVgjYQfZtpmHGFjStAvkSV0HtAeyGhpGn0/PAn725x3GJ
   A1/HDRbUuzQN0raRnR0l+b8C7khn8FlLPdoJF5vkbh2+ByTkgIFFDuzY2
   SXPuJItDDN+kWKD6mwwbZGGb+A/lr9+yPFmfi9bZxuUOQO5nOkL8HFxM3
   Q==;
X-CSE-ConnectionGUID: GIGkQjD5SnaMxP/fqKSFtA==
X-CSE-MsgGUID: XheB03oSRe+Yb2Vg2C3ttg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="41248746"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="41248746"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 21:52:32 -0700
X-CSE-ConnectionGUID: 2oFOeBThSXez/EzHdyZHWw==
X-CSE-MsgGUID: ayjbYLGxR7ypJTGC3Vp7hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="69072861"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Aug 2024 21:52:31 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skcZg-0003Pi-1n;
	Sun, 01 Sep 2024 04:52:28 +0000
Date: Sun, 1 Sep 2024 12:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, johannes@sipsolutions.net
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Aditya Kumar Singh <quic_adisi@quicinc.com>
Subject: Re: [PATCH v4 8/8] wifi: mac80211: handle ieee80211_radar_detected()
 for MLO
Message-ID: <202409011204.WQXKU89J-lkp@intel.com>
References: <20240830060918.2418701-9-quic_adisi@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830060918.2418701-9-quic_adisi@quicinc.com>

Hi Aditya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 20361712880396e44ce80aaeec2d93d182035651]

url:    https://github.com/intel-lab-lkp/linux/commits/Aditya-Kumar-Singh/Revert-wifi-mac80211-move-radar-detect-work-to-sdata/20240830-141143
base:   20361712880396e44ce80aaeec2d93d182035651
patch link:    https://lore.kernel.org/r/20240830060918.2418701-9-quic_adisi%40quicinc.com
patch subject: [PATCH v4 8/8] wifi: mac80211: handle ieee80211_radar_detected() for MLO
config: x86_64-randconfig-121-20240901 (https://download.01.org/0day-ci/archive/20240901/202409011204.WQXKU89J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011204.WQXKU89J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409011204.WQXKU89J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/mac80211/util.c:3501:47: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/mac80211/util.c:3501:47: sparse:    struct ieee80211_chanctx_conf *
   net/mac80211/util.c:3501:47: sparse:    struct ieee80211_chanctx_conf [noderef] __rcu *

vim +3501 net/mac80211/util.c

  3469	
  3470	/* Cancel CAC for the interfaces under the specified @local. If @ctx is
  3471	 * also provided, only the interfaces using that ctx will be canceled.
  3472	 */
  3473	void ieee80211_dfs_cac_cancel(struct ieee80211_local *local,
  3474				      struct ieee80211_chanctx *ctx)
  3475	{
  3476		struct ieee80211_sub_if_data *sdata;
  3477		struct cfg80211_chan_def chandef;
  3478		struct ieee80211_link_data *link_data;
  3479		struct ieee80211_bss_conf *link_conf;
  3480		struct ieee80211_chanctx_conf *chanctx_conf;
  3481		unsigned int link_id;
  3482	
  3483		lockdep_assert_wiphy(local->hw.wiphy);
  3484	
  3485		list_for_each_entry(sdata, &local->interfaces, list) {
  3486			for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS;
  3487			     link_id++) {
  3488				link_data = sdata_dereference(sdata->link[link_id],
  3489							      sdata);
  3490				link_conf =
  3491					rcu_dereference(sdata->vif.link_conf[link_id]);
  3492				if (!link_data || !link_conf)
  3493					continue;
  3494	
  3495				chanctx_conf =
  3496					rcu_dereference_protected(link_conf->chanctx_conf,
  3497						  lockdep_is_held(&local->hw.wiphy->mtx));
  3498				if (!chanctx_conf)
  3499					continue;
  3500	
> 3501				if (ctx && &ctx->conf != link_conf->chanctx_conf)
  3502					continue;
  3503	
  3504				wiphy_delayed_work_cancel(local->hw.wiphy,
  3505							  &link_data->dfs_cac_timer_work);
  3506	
  3507				if (!sdata->wdev.links[link_id].cac_started)
  3508					continue;
  3509	
  3510				chandef = link_conf->chanreq.oper;
  3511				ieee80211_link_release_channel(link_data);
  3512				cfg80211_cac_event(sdata->dev,
  3513						   &chandef,
  3514						   NL80211_RADAR_CAC_ABORTED,
  3515						   GFP_KERNEL, link_id);
  3516			}
  3517		}
  3518	}
  3519	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
