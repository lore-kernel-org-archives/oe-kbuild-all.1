Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D0B3E9C3A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906645; cv=none; b=W7WrjYszmqk+rqvIySqh3ql/EOcIMRna/OT/wDmLELQlXbETpq1JKCs1Pko71plw/UF/dyYbcpL7gHCUfDV9rk40J8oTzguJOFlk/AD8pMf9e6IaNVVBlsKOKLL3pJdKmcHpBybBIiU53M7Vpc/q3JC1Z2QySFR9zNOgovQ+OtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906645; c=relaxed/simple;
	bh=wwk0E9FbCL0Mxm532g9daskVfah+oHu+UV0iN39A1u4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mJhMoeY1UC8Li37/SwGGNpMdmAZuT1mOWzw+NiKxK2khCFluAU/rRJKFaITnIFfICByxWXpsWEo2yNHaBBhDlYflrwaSS6TwLXUKJirAfOIuyZX3mqboIDkHGfZXjnYlsBXsry2ctdwwtdyB7lWZJG8nA3RvW4HHI8c+9MDJTn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvsqBZ0Z; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvsqBZ0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787906644; x=1819442644;
  h=date:from:to:cc:subject:message-id;
  bh=wwk0E9FbCL0Mxm532g9daskVfah+oHu+UV0iN39A1u4=;
  b=WvsqBZ0ZujAH1rZ5K+VIbBaFR2JfKrQ9JOHXyDc+dCqT3xA5cC9mVXZD
   uYBlvlHIcqeJpQyUd3tzoDYp//iExkvgp0KzKg53mN5MTPTQ77NgTpMRc
   CSD3CCfkDqvYGxiky3QKw9cWUV3JpXLIZt65+ihZe/eGzD7hANyFsVcGt
   o6JwMIRReCXJkpsYiYw4deM78cg86qS+iZZUmOyLdQYgeI5IVmSo1NLPG
   MhQshqtWU/f9uyeQMyFx0ipBiz2ZCt/ZMg/luTaPDpuACXnbWAd8B13NB
   jJrilzyFoPU/ymz5aKMLVTISzTsm6AdR7+ZxR9n5LOg9xKGzAtd10Au47
   A==;
X-CSE-ConnectionGUID: 7Ef++zU0TKqHCKqmeTsrkA==
X-CSE-MsgGUID: ZVNKhmP7QZKyapPtXB709A==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="90924625"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="90924625"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 01:44:03 -0700
X-CSE-ConnectionGUID: xWnwP8yoSfmLtE+JrSYmGQ==
X-CSE-MsgGUID: slPKJeNMQYyyWGP6ycGPUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="270053789"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 28 Aug 2026 01:44:02 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzsBs-00000000133-166x;
	Fri, 28 Aug 2026 08:44:00 +0000
Date: Fri, 28 Aug 2026 10:43:36 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] kismet: WARNING: unmet
 direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by
 GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202608281047.jVUoq4vI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   9331e8caf0b91bc59e1c69068a59bf93d5e8a31a
commit: dd99bb34c52de463398910adc71917769dde6f54 [1/1] Revert "ANDROID: suppress GKI configs for 32-bit builds"
config: arm-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260828/202608281047.jVUoq4vI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260828/202608281047.jVUoq4vI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281047.jVUoq4vI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
