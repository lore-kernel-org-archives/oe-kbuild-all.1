Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797141F8ADB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 21:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739395969; cv=none; b=eSYD45eOuLVdm6ogVk1HoT2lQ5IcEd8lMwqo2CfB8nIvWXlkMSsoym99UFbkrGfcy2EQAJ0BW9OqRZt0VIqSY9havNMjWg6XWONjhD3o52R9Hk8j9VDigCNFcc11RboqjfILSG5cnGACFDAYJTkbcJRRMekJrZktwJ3hT06M8/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739395969; c=relaxed/simple;
	bh=in7YmYhWMQwW7YP8lhKmPIg5AuglgrXQoTHAnLDIbG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SB/cD4M6nF71AcNDQUVXLALEJclvnuMeNCWinP9GumiId3rnn8Vgn+nSZtfjF+3PpkUd83J53y2j/P4EtK3f8q4zzuvusk8at2YAZs6G0nqQcdmY0MrjTbKza+IGaniQ7vobMbhWukAI8EaTKEsKOgVDvg4fBqmYU2aBvfowkQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NANNFTWO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NANNFTWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739395966; x=1770931966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=in7YmYhWMQwW7YP8lhKmPIg5AuglgrXQoTHAnLDIbG8=;
  b=NANNFTWO0MmnCvDmbCa5P4AtDqh10HPvtzTXW0N7pstRBIDqCB0XeP4D
   5U6N/HHEwK5mm+Dq0gYfmqkgDH7NkgdrfQfCKqXUfyJbwgxpAB7xFS5+B
   FgjwDRnp7fM9O0LOAqLFDPcBZjUnpt3d5cv3rRhuWJy2zX5hTF77n46Tx
   rTvuyV7rqQugOSTwCfAwYdRqxgroDMFPgBUamT76kPn7gKX2frOhuSLxN
   Y3gJRUGWW6zVBDdD476B0p2IiM+JDg341U7/KqLgIS4WMjvxPKUIoh3bu
   CP/XIv0+jFpu/YlJj8NPpov3YelWlYjL8hDw97+DCg6WYnRfGhNv+OEo3
   w==;
X-CSE-ConnectionGUID: /KVMkzXVRMuhC6qTWFZbWw==
X-CSE-MsgGUID: TuBuIWbqSUyicpC8xn6OjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="44010183"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="44010183"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 13:32:45 -0800
X-CSE-ConnectionGUID: lzkyDqSjSjyL+Pdj+NTyxg==
X-CSE-MsgGUID: LlcojbEpTZOz/8D/073MDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="112936781"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Feb 2025 13:32:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiKLb-00169t-3D;
	Wed, 12 Feb 2025 21:32:44 +0000
Date: Thu, 13 Feb 2025 05:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Wetzel <Alexander@wetzel-home.de>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
Subject: [linux-next:master 2628/3226] net/mac80211/driver-ops.c:124:19:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202502130534.bVrZZBK0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c674aa7c289e51659e40dda0f954886ef7f80042
commit: 646262c71aca87bb66945933abe4e620796d6c5a [2628/3226] wifi: mac80211: remove debugfs dir for virtual monitor
config: m68k-randconfig-r133-20250212 (https://download.01.org/0day-ci/archive/20250213/202502130534.bVrZZBK0-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250213/202502130534.bVrZZBK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502130534.bVrZZBK0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/mac80211/driver-ops.c:124:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/mac80211/driver-ops.c:124:19: sparse:    struct ieee80211_sub_if_data *
   net/mac80211/driver-ops.c:124:19: sparse:    struct ieee80211_sub_if_data [noderef] __rcu *

vim +124 net/mac80211/driver-ops.c

   107	
   108	void drv_remove_interface(struct ieee80211_local *local,
   109				  struct ieee80211_sub_if_data *sdata)
   110	{
   111		might_sleep();
   112		lockdep_assert_wiphy(local->hw.wiphy);
   113	
   114		if (!check_sdata_in_driver(sdata))
   115			return;
   116	
   117		sdata->flags &= ~IEEE80211_SDATA_IN_DRIVER;
   118	
   119		/*
   120		 * Remove driver debugfs entries.
   121		 * The virtual monitor interface doesn't get a debugfs
   122		 * entry, so it's exempt here.
   123		 */
 > 124		if (sdata != local->monitor_sdata)
   125			ieee80211_debugfs_recreate_netdev(sdata,
   126							  sdata->vif.valid_links);
   127	
   128		trace_drv_remove_interface(local, sdata);
   129		local->ops->remove_interface(&local->hw, &sdata->vif);
   130		trace_drv_return_void(local);
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
