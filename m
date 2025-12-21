Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1580BEEBB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 00:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766276513; cv=none; b=RQ8vP93bAlwKMHeUUoDTj7wmwU7DiZC/Bsy8jSN2BdIzezcKezxasv6+YaU4IDCkE2tfwPgXGfpO62WftVk4/JHFw6IBLPre/Qbff7yA12JLvNWd9OezgBu67LodLzKSV81ms8HEHKVh6OHlSrJ2pALQtYo5/fg/otGmj/tuXZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766276513; c=relaxed/simple;
	bh=dWypUbgABWJJzNW2HHdVaVAUhlxk23757X6ozXUOFac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HcMQfjoYE/RBa2uUrWKnes2hx//zuxXJKAnKXeY4RnxaN6aEmdt6WvabyIyseFUlY3M2+aYJ2+Xf6AsK73QYvWnTHwjQ8KzSlqiRkqdfBLjmIn/evfUPCKsjLum5HWM4zIBBLTXxFYA5FgClu55iGJ9gW+PEXa9z8vAEtdQBk9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZkj33/P; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZkj33/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766276512; x=1797812512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dWypUbgABWJJzNW2HHdVaVAUhlxk23757X6ozXUOFac=;
  b=BZkj33/PXL7WIwREo6koKkKDXtPXzoQ/tRv2rDXzdd5eZNf8ihL0POEl
   Wk4Te7zBljjBRW8aG2lm7w1VQjaM7mxlDAzDv6o+X4nppBFwBJFoetmxV
   +cEPRumZmA/1b8Xx3tdCXOcvBGxSo0tm4R+BJaQm6y7RusqVVdNTtFBA/
   xlpWy1mrm/N9DWI2EpuFqZ2FsiSfl1wgPKbN+iz7NbYh15iO1l0aIpraC
   MyGaPJpAJnjNqOeon2tR52RSWn4wbp8nMZmHVTjP0iTSTfAH5NAksXKCS
   I+RmoJU/yXkcS4HP234WDAlsWmnnQS34pkYuYK94OMIuKiG3np4rYvfDt
   w==;
X-CSE-ConnectionGUID: aRMxsX3fRpe7ssDfVQieIw==
X-CSE-MsgGUID: VAj9vxJbRKm8gKZYXnyWQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="71821312"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="71821312"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 16:21:52 -0800
X-CSE-ConnectionGUID: 9lBLrfubThOgkyiXQ+6dag==
X-CSE-MsgGUID: kPzcl7UsQV6VFJK9dmk+8Q==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 16:21:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX7Cm-000000004qu-1z8h;
	Sun, 21 Dec 2025 00:21:48 +0000
Date: Sun, 21 Dec 2025 01:21:39 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for BALLOON_COMPACTION when selected by
 GKI_HIDDEN_MM_CONFIGS
Message-ID: <202512210106.Ch034NKj-lkp@intel.com>
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
commit: 0041f84975dcf2f25a9b508fe299a017fe0f4da2 [12/12] ANDROID: Add GKI_HIDDEN_MM_CONFIGS to support ballooning.
config: x86_64-kismet-CONFIG_BALLOON_COMPACTION-CONFIG_GKI_HIDDEN_MM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210106.Ch034NKj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210106.Ch034NKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210106.Ch034NKj-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BALLOON_COMPACTION when selected by GKI_HIDDEN_MM_CONFIGS
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
     Depends on [n]: NET [=y] && WIRELESS [=n]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_CORE
     Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_PROC
     Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_PRIV
     Depends on [n]: NET [=y] && WIRELESS [=n]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
     Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
     Selected by [y]:
     - GKI_HIDDEN_MM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_SPY
     Depends on [n]: NET [=y] && WIRELESS [=n]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
