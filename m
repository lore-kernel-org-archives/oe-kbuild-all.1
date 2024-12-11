Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5481FBEB0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 03:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733886908; cv=none; b=MEq4V0WOOT5f0q6wqVHNPMSZr9L53yhaNrkV6/1jNa9/U9fheqqgD3iu4Hg8mu8DHha5CTpRkvLTBexQaWqVfikJoPYO8Oi/ZP85UdjFY8DRD/a7A1z29rIHWl8gKQoUEt8VIMEmThk6bO+ZMd3OgHfuE9Ke2KOfz8y/mPEspL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733886908; c=relaxed/simple;
	bh=iCLYpbUC286tCvRZKqNzt5YMMfVd0z4nP7u7Uj264Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W8m8Q62NVvOpX5M7UvE65lPXjWp6J/kO4eq0m25Xn0yzt6GYH4ugGuGGjtYvN6XX2WrLICnFcGrr+lpqMWbGidk/qphIyN8Av5XuNKYylucmPuH9Uroo1CHtf/Xw72ZpOvy6o2GuhPWFm9rAh0kpEckC6O1Fn4dE25e1BmdWud4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ff24K//T; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ff24K//T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733886906; x=1765422906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iCLYpbUC286tCvRZKqNzt5YMMfVd0z4nP7u7Uj264Aw=;
  b=ff24K//Te1zBj/bfdPJseFkz95jFATxqAhCXz+qQ4aLizaLvxROy6jz6
   N2HfLxdAqESqYkGhJZVOMNb5WwUWwfrxbB3niz8wXzFu+BxnjNKuxhPX0
   VIJ6jLiBeWswi7kmjJJYjLq1r7644ToskZc/JjsrJ+GETvHa71KTPkOjW
   rC5Xdvr/UEIGWMVvrQ9dcJ4aqpW/wKxJydlbBsnnmGURA4hy1ob8Nl0Dm
   GUKhXrZbXnFlrZTdwXDMlgPXaDVl0zGqmGmZkL2sepG6/NmxN40zBg3zp
   h1fNPIhifn0Nc5+WfP+r05dcpg4AFcSZ61wOYJC5Oz76QBMTBKX3w5aGw
   w==;
X-CSE-ConnectionGUID: b7XwxnHhSGGIfq35pTQsVA==
X-CSE-MsgGUID: 341Wf21aRpmS3Hwleo5M9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33589995"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="33589995"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 19:15:05 -0800
X-CSE-ConnectionGUID: YRuGn0ieScqGU1oAqnrWHA==
X-CSE-MsgGUID: OElKrBXdSaeMV/zxiJRcSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100582540"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2024 19:15:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLDBl-0006Cn-2P;
	Wed, 11 Dec 2024 03:15:01 +0000
Date: Wed, 11 Dec 2024 11:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/7] undefined reference to
 `lockdep_rtnl_is_held'
Message-ID: <202412111128.hTXeLpbs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   40f47bcbcfa2178e66852127ae5a886fde6e3c9d
commit: 1dfbe413d21f18f714cca818435299947bf5649a [1/7] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: x86_64-buildonly-randconfig-002-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111128.hTXeLpbs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412111128.hTXeLpbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412111128.hTXeLpbs-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `net_dim_free_irq_moder':
>> (.text+0x755e65): undefined reference to `lockdep_rtnl_is_held'
>> ld: (.text+0x755ec4): undefined reference to `lockdep_rtnl_is_held'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
