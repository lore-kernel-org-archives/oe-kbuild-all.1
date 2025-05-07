Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B073258CC1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619615; cv=none; b=tonzOtlUjdyfGaTLhHshv6NHwnamQ+S4+bxOIAgons7QpcfZIUcuZQZi2dj6RSBoRjZDclhwx6LdGNQIrmGMU6ZGPn/iAVquSE/zKb0UkPvFZ8UdSnsgl62sTrSM5Pa5FpEVnz6TBQCOW25CKWtbhqLFphcsrV8lrdMnFvUOung=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619615; c=relaxed/simple;
	bh=KFeMqkSOGIXbSPeTDo7HrUn0vk92s9jn70kM2xX27Kc=;
	h=Subject:Date:From:To:Cc:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fO6adKRmdJNNAudYemJrE1j5FPaKXHAaj5IDl8Jjs9UO0wQc8cGy9LNVmSLztlG42CFQKrKKmLrDWNfDbgTFa1mik11EirEKK35aBb0k1ZVhsrtdFQbtwNP9rF0GTIj1OgL/10sNbSqgNnmWRTDm1XCrgGmzAWcIS+saL1yeR98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgLJIlHK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgLJIlHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746619614; x=1778155614;
  h=subject:date:from:to:cc:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KFeMqkSOGIXbSPeTDo7HrUn0vk92s9jn70kM2xX27Kc=;
  b=FgLJIlHKgZBPp3NzuTe3dcSBaXCk+GUUrMGuMvn/ijB7vy1FIsAKXx1I
   oJF7nLUT89SOqiVo869HaEYM+FGjk/E0TBQbjj90OWGvBAEvEIsN0rzvs
   CP2qqlr02qa76Jh9RYLTK2U3LCK0XbNF+ufoQ1g8gDdKIzWqWMr09zPzG
   QLOA/K1e7xXdr7vSQPUHTnpBINPcnoZk8lXIpjHDH1Ijb1khY2AAvCYAM
   5RwPZqG2zzuYGF9TYfT2IV+A1Iu7QMX1W72nFgbPyogcTZ1nPc7AE3SkV
   QYAM3i3fC5w+LmKbUVraHeWQPSr7GkZaN4RGMK0EClKADuXG4mAKaBose
   g==;
X-CSE-ConnectionGUID: gQZt7n/YQN2tkOdcQTnmwg==
X-CSE-MsgGUID: 9BKU7RmtSUGs7KuaE6ROhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58541782"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="58541782"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:06:53 -0700
X-CSE-ConnectionGUID: D6W5r91EQmiYkk7UoV7w1Q==
X-CSE-MsgGUID: XYOLqmvCQQKpz7LWi9DXFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="unknown"; 
   e="0x0't"; a="136450350"
Subject: [WARNING: A/V UNSCANNABLE]Re: [PATCH v10 4/4] drm/panthor: show device-wide
 list of DRM GEM objects over DebugFS
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2025 05:05:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCdWl-0007kB-2C;
	Wed, 07 May 2025 12:05:31 +0000
Date: Wed, 7 May 2025 20:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Message-ID: <202505071945.I7UMSSOo-lkp@intel.com>
References: <20250423021238.1639175-5-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423021238.1639175-5-adrian.larumbe@collabora.com>

Hi Adrián,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.15-rc5]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panthor-Introduce-BO-labeling/20250423-101530
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250423021238.1639175-5-adrian.larumbe%40collabora.com
patch subject: [PATCH v10 4/4] drm/panthor: show device-wide list of DRM GEM objects over DebugFS
config: arm64-randconfig-r131-20250428 (https://download.01.org/0day-ci/archive/20250507/202505071945.I7UMSSOo-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071945.I7UMSSOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071945.I7UMSSOo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: panthor_gem_debugfs_set_usage_flags
   >>> defined at panthor_drv.c
   >>>            drivers/gpu/drm/panthor/panthor_drv.o:(panthor_gem_debugfs_set_usage_flags)
   >>> defined at panthor_fw.c
   >>>            drivers/gpu/drm/panthor/panthor_fw.o:(.text+0x4)
--
>> ld.lld: error: duplicate symbol: panthor_gem_debugfs_set_usage_flags
   >>> defined at panthor_drv.c
   >>>            drivers/gpu/drm/panthor/panthor_drv.o:(panthor_gem_debugfs_set_usage_flags)
   >>> defined at panthor_gem.c
   >>>            drivers/gpu/drm/panthor/panthor_gem.o:(.text+0x4)
--
>> ld.lld: error: duplicate symbol: panthor_gem_debugfs_set_usage_flags
   >>> defined at panthor_drv.c
   >>>            drivers/gpu/drm/panthor/panthor_drv.o:(panthor_gem_debugfs_set_usage_flags)
   >>> defined at panthor_sched.c
   >>>            drivers/gpu/drm/panthor/panthor_sched.o:(.text+0x4)
--
>> ld.lld: error: duplicate symbol: panthor_gem_debugfs_set_usage_flags
   >>> defined at panthor_drv.c
   >>>            drivers/gpu/drm/panthor/panthor_drv.o:(panthor_gem_debugfs_set_usage_flags)
   >>> defined at panthor_heap.c
   >>>            drivers/gpu/drm/panthor/panthor_heap.o:(.text+0x4)
--
>> ld.lld: error: duplicate symbol: panthor_gem_debugfs_set_usage_flags
   >>> defined at panthor_drv.c
   >>>            drivers/gpu/drm/panthor/panthor_drv.o:(panthor_gem_debugfs_set_usage_flags)
   >>> defined at panthor_mmu.c
   >>>            drivers/gpu/drm/panthor/panthor_mmu.o:(.text+0x4)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
