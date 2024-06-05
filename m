Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E1136E1F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 22:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717627199; cv=none; b=IBqbRbOeQJ5ftRnsBwGsmgUOuwNPeBVm8lP6/ffUvuKHyxFfy2JzORwvKJY3gNt503FpnJuKxwiBc5h3x4Ii5qmDrI8iUAJm2lNyzmgGM+Ve5AqD5OCTGrVn6gqgk8IUU9eYU+Tg5DZv7/PFRgkI7Y1KXnY9Oq5w9w9gVRq2UVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717627199; c=relaxed/simple;
	bh=0JKrI/fPJGnyDKc4iuhjeUC3NHOj/voyG9ddPuF7NeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psMkbogRN7HgGo+Y4OpJ+EJWdjAAjEsza47fe8pEpi8DVPl2mENNc0VCF0VtMUrZBbqbY3OiDECuWeSrT94j7y7ODYfcbe6Gx+sWjDl2yKXhUbp/IJrF366UfgGK+9HCZegTuXE7E5pnDjRD5uHzRQHHn/8K+yT/Gk/h3peWgmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFTnE6pm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFTnE6pm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717627197; x=1749163197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0JKrI/fPJGnyDKc4iuhjeUC3NHOj/voyG9ddPuF7NeE=;
  b=aFTnE6pmmVNKqN8xE/9gwVnRvD9syiiIX9uoFZYDdEG8kgSkMCvEFdl7
   FvlVyNZNzVAWEyzT14mwXzrh9eIJ16gDqDAETTBMTvUxkkB93KJlKpUF8
   T+v2hhz0cZOasqfbzr2sCbHSU/qPIkHJuQ528KBpb1dM/5yrhMguMNMZq
   FtZa6Zc0rONhqn5xsnPRb2M+JacqfdOr1byU/sLy7bI0FSL4+FPDVtiTC
   9IY2Z1SLEIEbpQo5xviWH+sLdgRqra4HkcH8xN8GwVBepAqTqer6xFSgc
   cmVa3qTTSjzImrvJNz2v6KF2eYsRVxuv7rJovN+eq8Z0A1/KPonSQPZcf
   w==;
X-CSE-ConnectionGUID: ldNl/+2EQNyY6BWPN/Dfzw==
X-CSE-MsgGUID: Z0fntFPtRF+oGiL8dRHSEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14070379"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="14070379"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 15:36:24 -0700
X-CSE-ConnectionGUID: rumFj/LAR6yR5HPmk2Y6rw==
X-CSE-MsgGUID: zQ+P0SAnTBaWx46egYyjzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="37627420"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jun 2024 15:36:23 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEzEy-0002Ni-3A;
	Wed, 05 Jun 2024 22:36:20 +0000
Date: Thu, 6 Jun 2024 06:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 5/7] wifi: mac80211: extend ifcomb check functions for
 multi-radio
Message-ID: <202406060641.JGAWLQ1j-lkp@intel.com>
References: <f945f3f3001a41024c46682dd5f4a6709a559720.1717611760.git-series.nbd@nbd.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f945f3f3001a41024c46682dd5f4a6709a559720.1717611760.git-series.nbd@nbd.name>

Hi Felix,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 5bcd9a0a59953b5ff55ac226f903397319bf7f40]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Fietkau/wifi-nl80211-split-helper-function-from-nl80211_put_iface_combinations/20240606-025047
base:   5bcd9a0a59953b5ff55ac226f903397319bf7f40
patch link:    https://lore.kernel.org/r/f945f3f3001a41024c46682dd5f4a6709a559720.1717611760.git-series.nbd%40nbd.name
patch subject: [RFC v2 5/7] wifi: mac80211: extend ifcomb check functions for multi-radio
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240606/202406060641.JGAWLQ1j-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406060641.JGAWLQ1j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406060641.JGAWLQ1j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/mac80211/util.c: In function 'ieee80211_max_num_channels':
>> net/mac80211/util.c:4082:35: warning: unused variable 'ctx' [-Wunused-variable]
    4082 |         struct ieee80211_chanctx *ctx;
         |                                   ^~~
>> net/mac80211/util.c:4081:39: warning: unused variable 'sdata' [-Wunused-variable]
    4081 |         struct ieee80211_sub_if_data *sdata;
         |                                       ^~~~~


vim +/ctx +4082 net/mac80211/util.c

6fa001bc7e1ccd Michal Kazior        2014-04-09  4077  
7d28231f11865b Felix Fietkau        2024-06-05  4078  int ieee80211_max_num_channels(struct ieee80211_local *local, int radio_idx)
6fa001bc7e1ccd Michal Kazior        2014-04-09  4079  {
7d28231f11865b Felix Fietkau        2024-06-05  4080  	struct wiphy *wiphy = local->hw.wiphy;
6fa001bc7e1ccd Michal Kazior        2014-04-09 @4081  	struct ieee80211_sub_if_data *sdata;
6fa001bc7e1ccd Michal Kazior        2014-04-09 @4082  	struct ieee80211_chanctx *ctx;
6fa001bc7e1ccd Michal Kazior        2014-04-09  4083  	u32 max_num_different_channels = 1;
6fa001bc7e1ccd Michal Kazior        2014-04-09  4084  	int err;
e227300c8395df Purushottam Kushwaha 2016-10-12  4085  	struct iface_combination_params params = {0};
6fa001bc7e1ccd Michal Kazior        2014-04-09  4086  
7d28231f11865b Felix Fietkau        2024-06-05  4087  	if (radio_idx >= wiphy->n_radio)
7d28231f11865b Felix Fietkau        2024-06-05  4088  		return -EINVAL;
7d28231f11865b Felix Fietkau        2024-06-05  4089  	else if (radio_idx >= 0)
7d28231f11865b Felix Fietkau        2024-06-05  4090  		params.radio = &wiphy->radio[radio_idx];
6fa001bc7e1ccd Michal Kazior        2014-04-09  4091  
7d28231f11865b Felix Fietkau        2024-06-05  4092  	lockdep_assert_wiphy(local->hw.wiphy);
6fa001bc7e1ccd Michal Kazior        2014-04-09  4093  
7d28231f11865b Felix Fietkau        2024-06-05  4094  	ieee80211_fill_ifcomb_params(local, &params, NULL, NULL, radio_idx);
6fa001bc7e1ccd Michal Kazior        2014-04-09  4095  
e227300c8395df Purushottam Kushwaha 2016-10-12  4096  	err = cfg80211_iter_combinations(local->hw.wiphy, &params,
e227300c8395df Purushottam Kushwaha 2016-10-12  4097  					 ieee80211_iter_max_chans,
6fa001bc7e1ccd Michal Kazior        2014-04-09  4098  					 &max_num_different_channels);
6fa001bc7e1ccd Michal Kazior        2014-04-09  4099  	if (err < 0)
6fa001bc7e1ccd Michal Kazior        2014-04-09  4100  		return err;
6fa001bc7e1ccd Michal Kazior        2014-04-09  4101  
6fa001bc7e1ccd Michal Kazior        2014-04-09  4102  	return max_num_different_channels;
7957c6c8141b8c Thomas Pedersen      2020-09-21  4103  }
7957c6c8141b8c Thomas Pedersen      2020-09-21  4104  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
