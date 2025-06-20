Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F4C219301
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408611; cv=none; b=NMqcd77fPFZZEnZV7t8VeUGfL2ObTnECJbK9tZklPQ+kwqdFfbNDq+UwpCYxEAaDJeIIahzfjFG9P95KoBLshA1gjw57S38Iy7QiYqOnQx8jkpiIeO50NvPNSqjuqUiAK3OIlNthABjW4aBMehS14hLK49gmj+rzAU27Z/oOQdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408611; c=relaxed/simple;
	bh=KxCw0Mx85ieyEKgV0ks67W9daGVfYa3YzL6PNyDhqxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U+g+uWx5ifWgOIScVNOClwTudgSqsZFT7EFLZNqhstkkEtnjIDAnuJLUMyMxyJDamGVS31zSoIRK4H7+t1ZL7II4IXFfV3vCJpax7rAngFDu1HboT3urGiVGWWdA2aTjb2g0B1l5Mvn/zolrrX3YZY+2MMj6JK34ycQbor7Ci18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfPOlh1z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfPOlh1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750408610; x=1781944610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KxCw0Mx85ieyEKgV0ks67W9daGVfYa3YzL6PNyDhqxY=;
  b=TfPOlh1zmB9VUrmJU5HduknG2QSOWoBPGzNdSh6oENrFNBYyzqcixacD
   +3y2Eks/CSUe3oT9Q8Yq0/hWHsetHq7Xm8NohYOhXkRWhjGK3YUWaSXqA
   JIDpoYlPb7dVYBGwkINq5L5GoL1fMCeIaLQRvJyejOEKjtHnGaGyIo1i4
   0OrTtoxqvtvyXzP+ygovyMi5owqCavRAeZWnNz8LPSxskNNeDZ/4mScIZ
   tCRytJ0QyrtEpkej08/B0CC0iJNdWilUBeNa7fzHqknwGgwlEouX2hfvT
   RVbmvLLJ3SrQKslKHUkWvRUuXe7e7r2n/mhKU7Gw0SphKqk6GjxU9hKvk
   w==;
X-CSE-ConnectionGUID: QBVCLQsHS+WvPBIVJJQn+w==
X-CSE-MsgGUID: Oj/YdFboS5GxsX5UHfWdkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40277622"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="40277622"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 01:36:49 -0700
X-CSE-ConnectionGUID: 0gmheVlASjuINvY5pgwsGg==
X-CSE-MsgGUID: tDrZaxuBSQisDmCkwgY6EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="156356454"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jun 2025 01:36:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSXEr-000LWI-2s;
	Fri, 20 Jun 2025 08:36:45 +0000
Date: Fri, 20 Jun 2025 16:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 2/10] include/linux/ftrace.h:558:
 multiple definition of `register_ftrace_direct_hash';
 drivers/gpu/drm/ttm/ttm_tt.o:include/linux/ftrace.h:558: first defined here
Message-ID: <202506201610.uDWqFcKx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   b288c6b15d20122d59ddf3bce2fb86afe6ed56c3
commit: c9910285c9bbb6b3afad3d1048ef11abf71bcdeb [2/10] ftrace: Add register_ftrace_direct_hash function
config: x86_64-buildonly-randconfig-001-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201610.uDWqFcKx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201610.uDWqFcKx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201610.uDWqFcKx-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/ttm/ttm_resource.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/ttm/ttm_tt.o:include/linux/ftrace.h:558: first defined here
--
   ld: drivers/gpu/drm/vkms/vkms_plane.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_output.o: in function `register_ftrace_direct_hash':
   vkms_output.c:(.text+0x0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_formats.o: in function `register_ftrace_direct_hash':
   vkms_formats.c:(.text+0x3540): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_crtc.o: in function `register_ftrace_direct_hash':
   vkms_crtc.c:(.text+0x1740): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_composer.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_writeback.o: in function `register_ftrace_direct_hash':
   vkms_writeback.c:(.text+0xe80): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_connector.o: in function `register_ftrace_direct_hash':
   vkms_connector.c:(.text+0x240): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_config.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
--
   ld: drivers/gpu/drm/v3d/v3d_drv.o: in function `register_ftrace_direct_hash':
>> v3d_drv.c:(.text+0x17c0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/v3d/v3d_fence.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/v3d/v3d_gem.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/v3d/v3d_irq.o: in function `register_ftrace_direct_hash':
   v3d_irq.c:(.text+0x10c0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/v3d/v3d_mmu.o: in function `register_ftrace_direct_hash':
   drivers/gpu/drm/v3d/v3d_mmu.c:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/v3d/v3d_perfmon.o: in function `register_ftrace_direct_hash':
   v3d_perfmon.c:(.text+0x300): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/v3d/v3d_trace_points.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/v3d/v3d_sched.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/v3d/v3d_sysfs.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/v3d/v3d_submit.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/v3d/v3d_gemfs.o: in function `register_ftrace_direct_hash':
   drivers/gpu/drm/v3d/v3d_gemfs.c:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/v3d/v3d_debugfs.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:558: first defined here
--
   ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x23c0): first defined here
   ld: drivers/gpu/drm/pl111/pl111_drv.o: in function `register_ftrace_direct_hash':
   drivers/gpu/drm/pl111/pl111_drv.c:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x23c0): first defined here
   ld: drivers/gpu/drm/pl111/pl111_debugfs.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x23c0): first defined here
--
   ld: arch/x86/kvm/svm/pmu.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13140): first defined here
   ld: arch/x86/kvm/svm/nested.o: in function `register_ftrace_direct_hash':
   nested.c:(.text+0x8680): multiple definition of `register_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13140): first defined here
   ld: arch/x86/kvm/svm/avic.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13140): first defined here


vim +558 include/linux/ftrace.h

   556	
   557	int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
 > 558	{
   559		return -ENODEV;
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
