Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D681411DE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 03:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761363167; cv=none; b=DUNZo3K9VT1sTp2Fh1MLfllUiekuSq4EKBka4rNBVgbIZXv8om/mUbmh0UjKGpc9N6Nfq21JMpBVWzYTVyriLvK2EClzuuWCqZJfSmwty8mRqZcgODU4v22GTICaa4oUVgBefY/0T9hFSUM8qO6T5vZMDc7MjWCqFXY+NPD9Zfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761363167; c=relaxed/simple;
	bh=TQ0QO2YI3iN3+RemedxeS1yq0aP7D2zgRoLaKGuBJfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H2M9ywKJpyXPQF8Ve1vtDfE5Ez2doAqM7ugnZRwoSZ24A1snLs3414V+mgAmdL+s9wzuKUVyt1DUpEyvsO3iIig2de0JwVAK7P2LEU8xpor+MLwjI5RE38Q5/9F0i9qyEISjbEyogogXaFZTKPTV5KK6inzk9ElrK56behveGiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvc+7KFK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvc+7KFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761363166; x=1792899166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TQ0QO2YI3iN3+RemedxeS1yq0aP7D2zgRoLaKGuBJfc=;
  b=hvc+7KFKKgodC8HNCmpjtZWFF1p+vx1MpgTTE2geJzdpKUzvhMRg6vzV
   6FkNfzlblJ+CntHU3kujHtv0Dpow61sApVDVJ8xsgJWJ4uGbghjjgc9gh
   /rrQQZC7N0rsxBOaDP+bYloB0Qes044wBd77iragTi3rmSZcl3dehrlv0
   paolFxxGyC4Qvn2GTWESDaXPreqYOZ7X2iqhG+GwhEd5EkhhitHF9jdq7
   mlbSnjqvz4lDemVJFn55aqPDIrtIUJn2NDchHPvlhVNQ7mBh7mu1LGJiK
   xOj7+05+HCvsHH0qV9U29A4+eSeeogFcgUVLj2o6AhEjfDGvga6BLm+XE
   Q==;
X-CSE-ConnectionGUID: busKwG32RrGwQMoQBJuvSw==
X-CSE-MsgGUID: 8HMB8DCeQ9COndLysOsc0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63578584"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63578584"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 20:32:46 -0700
X-CSE-ConnectionGUID: muR4L7cyQ0K+L8dAreSK4A==
X-CSE-MsgGUID: ObiYucvkSpmDhE21UG0XnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="189815970"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Oct 2025 20:32:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCV1G-000F65-0K;
	Sat, 25 Oct 2025 03:32:42 +0000
Date: Sat, 25 Oct 2025 11:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 0/2]
 include/trace/hooks/dmabuf.h:15:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202510251157.G66hBMQE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   46f9c66e9fddc7f323fbec4081d199f5e4efbce9
commit: 0d385a5b58ead06f4a2b6565cb1ce02b922863ce [0/2] ANDROID: dma-buf: Add vendor hook for deferred dmabuf sysfs stats release
config: x86_64-randconfig-121-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251157.G66hBMQE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251157.G66hBMQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251157.G66hBMQE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-buf-sysfs-stats.c: note: in included file:
>> include/trace/hooks/dmabuf.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dmabuf.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dmabuf.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +15 include/trace/hooks/dmabuf.h

    13	
    14	struct dma_buf_sysfs_entry;
  > 15	DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
