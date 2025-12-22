Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A32F42AA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 10:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399779; cv=none; b=VyWnN+C8O2tZneHoR/ressHikKXcGyf3RYXxNCp7PDJoFgL8pHEAf/PIvUEBEIO7+5AhLYXnAb/dVgEjHBC7CT3uE/fN82JmCzs5TipIFjlOnEcV7t7OkmxeJShW1J0/9ggnWMJJJeL+/ZElxrgHc/0dGm6nG1jCTO13CY+HXUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399779; c=relaxed/simple;
	bh=Rh2eMshb/9rpzaNHd9M8mx0uuhKk5MpM9VF9MAQ1cC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GUL6IIY24D8UmIaEfbszY7S6DpxSWiBuBGIEwW6JL9Dl4LEWdVANOTk7DPbTQcGKHAbs3NU0XfLbz5aAJKRwCiYTe7/bLJxGY5eJd8dfjfZUiDkOd2PmwqBTeZLzNVkCfxsFmSSyvjw/YyECUqKg2kJMiMMaSXdGInLanSEWIAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAi1A6i/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAi1A6i/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766399778; x=1797935778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rh2eMshb/9rpzaNHd9M8mx0uuhKk5MpM9VF9MAQ1cC0=;
  b=hAi1A6i/aJula4wHFOhK5KXJOQJh5ljVmsCr6Rh0tIxpLQI09uF9wt75
   I/G1SMmEJZ5FPR3sUWxlyl37vCBP4j/+wsCQmlPkSX/sfg6uhpkstNw98
   SsZWxfQ4K1N4SeLIHx1NpI8hY/6/viezlKd+MBAZcuuXoGxS8kusP8BJ4
   GzznckBQ4LsjNhR9Rs8VFrKeao/PxMDTvwXTc+IR4C674zHN3T/yGWLNX
   ark0yDLZoJs7JC+wk5hSIbx/4IzXv0vlSkMMUFTl1hin+bsnZv39U4yzA
   KINQhk5WqQ5usy9iekXRBE9Aa+mSkCjQP9eorPcFa02eQTiBwBltoO+XR
   g==;
X-CSE-ConnectionGUID: Y80jfnKBTqunAJW1LWKnng==
X-CSE-MsgGUID: Sy358jYqSCeDlhsh96IA1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="55827510"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="55827510"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:36:17 -0800
X-CSE-ConnectionGUID: ii3RV0Z2R36mlFBNeoy23A==
X-CSE-MsgGUID: ROIXwO5BTDei1k6lseQr8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199135160"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 02:36:17 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXdGw-000000005Qe-2i1p;
	Mon, 22 Dec 2025 10:36:14 +0000
Date: Mon, 22 Dec 2025 11:35:46 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for PAGE_POOL when selected by
 GKI_HIDDEN_NET_CONFIGS
Message-ID: <202512221111.9aKjGsAp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 30f31797fe80307598bc2502bfe2eb19b9bf13fe [12/12] ANDROID: GKI: enable networking; add hidden network configs
config: x86_64-kismet-CONFIG_PAGE_POOL-CONFIG_GKI_HIDDEN_NET_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512221111.9aKjGsAp-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221111.9aKjGsAp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221111.9aKjGsAp-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PAGE_POOL when selected by GKI_HIDDEN_NET_CONFIGS
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for PAGE_POOL
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
