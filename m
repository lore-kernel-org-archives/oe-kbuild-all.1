Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC8623ABAB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755938101; cv=none; b=W5zISp1tuuvc4c2ccjz4ZhSJb2w4Ddw1GDMm63206Lv4G8GP63f8ZsSiYd4DG4lo5mIMTMqPcaB3qFVIFOMbZjCd1xf7l4yi5/nVbGdNWYQtxnrXlPZjVDnhwPl80ZrwJHY2pX8wW+aCQGJqF8RN8oGO6vWUTBONC8MocYJ9k6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755938101; c=relaxed/simple;
	bh=cOHt0J39zWZCtmOIQWFs3FYejZfYOX3KSIidv7djNqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvfNTuQUkUdJuKlefe0scypy/cjN8iIPilLmXRPNmojcCuP7A3iTfcxJCp7eS1GxQcHFbUKUjVmDhUIQkV+U40EMm6DcwE6sErOGqRKtKmcTVciwMwtc+s5sUzsyJfzypz+OEhUevpvT3fzUmJFCGvXCaQZoevzbApwl3gj9szU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TUmvEUuR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUmvEUuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755938100; x=1787474100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cOHt0J39zWZCtmOIQWFs3FYejZfYOX3KSIidv7djNqA=;
  b=TUmvEUuR5TWxR4WJ4Z+Nt5bXuLvBRFN75UfPgxRkadhTKcdvfBQwsicD
   Dqa/XxQOFsihwx8TLz1X1mfdnx6WENBq0vXm59jjbWz+Y/Xw/Ax/grWhU
   xfcCPC+wsm9jiV8GJ0aSTHUSja0VlUgJS7kz5JWHJEv5++A3U/Rjw5g6z
   +uGKGzRzu7KWV9qFsm4qrK/i9+UzPq9lbmpU3YCYgs5clVFTesLCh+oA2
   Rz3ro9e5gFKBk6nf49Dc92fHxZPePXcdmS+HvRtweg2f2d+/6dbDdoRgy
   CPQhGP05Y+vHhvaf/pWT5yETqWpCz6kPeayXDr6ACMSjbhnMiUH3a8LqS
   w==;
X-CSE-ConnectionGUID: fNjz8CJATuWR1LV4sWdHSw==
X-CSE-MsgGUID: HQMTQ9itQ1CRDp4wQxGXbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69333452"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69333452"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 01:35:00 -0700
X-CSE-ConnectionGUID: ctjXjkgwRY2y8acWNNaUHA==
X-CSE-MsgGUID: gEb9b2vkRPSyQ2D9LCHo2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173074256"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Aug 2025 01:34:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upjiB-000MCf-2z;
	Sat, 23 Aug 2025 08:34:55 +0000
Date: Sat, 23 Aug 2025 16:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7/7] kismet: WARNING: unmet
 direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_PXP
Message-ID: <202508231634.cgLOzWDJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   3f8a5612f90e91c6acf0f22bb5fa67ad1ce1c1e4
commit: d31eda960d587e7797f948cb91d5cc9cf951e9b2 [7/7] Merge 4cece7649650 ("Linux 6.9-rc1") into android-mainline
config: arm-kismet-CONFIG_INTEL_MEI_ME-CONFIG_INTEL_MEI_PXP-0-0 (https://download.01.org/0day-ci/archive/20250823/202508231634.cgLOzWDJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250823/202508231634.cgLOzWDJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231634.cgLOzWDJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_PXP
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
     Depends on [n]: X86 && PCI [=y]
     Selected by [y]:
     - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   
   WARNING: unmet direct dependencies detected for SND_JACK
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
     Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
