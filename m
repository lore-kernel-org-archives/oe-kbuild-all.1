Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E87218AAB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411857; cv=none; b=GJu8uR1aSPPEnlQKDLm3fUcJ9D1Vnr5EDPtDH/DuLSL+qGkOzENIwprL3LiHuCmPnHjhUPLc3JShvg+iT4wCvjvfIO878HFKJIR9h38Y8Fe+qeVQOBc4xYB/qu6gBWZfKkHPV3NitkHqjzB88+TZaOLDc6WOm0BG1wRWzIa54ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411857; c=relaxed/simple;
	bh=6lXF9XaHxUV+KjUO7wKwXuIZyXwKpPqnRLocQncSDmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V0BrnltnHOmtxBN9KXwQ19buxc+nVLnKqeMSbbfHj2keRc32usGp975LC8070fZkT/t32m0HGklr6hKHGAeu8Xmv9RhqNEmq/GYFNH2scv89nQXfpN15hA0JtHit65o0CwUx/+Fx1UqYqJ5V/OUSltqQHfoQa/0J36Kv70JUWQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+1XURjX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+1XURjX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750411856; x=1781947856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6lXF9XaHxUV+KjUO7wKwXuIZyXwKpPqnRLocQncSDmg=;
  b=O+1XURjXZBuKAca5kU3lAkVYDEVQlGJbnGDcv6gBL9f7mpA23VfJeS43
   k78W6iBeBqO425emBrOD2JH8qfjEwpC7qEpJemzbjJizloJu0FOHWHLOz
   SB7faBTnSNneKNBofTt0ppgZ3wuLzAPj2//dIxyzA9Q26ALXeiSiN0m78
   6qMnd6oappSw9W+zFLS7jG3EcNQ44ht6VNg08hue2OMviRSbTrBuEU6MO
   3Qe5AymyDBVqGHmE6WPsYfX70dHMbukzym99rnlaoresWrBCAGKiDzZQr
   6M31uDjXfP/EFBeisje5GH2QQhILib98GqfabGLYY+PJBkh9gHQr582D1
   Q==;
X-CSE-ConnectionGUID: h95ldrgnSFiWZ8OpNio3FA==
X-CSE-MsgGUID: 2D0kwnQISni8wn8pUu3Wag==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52814386"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="52814386"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 02:30:55 -0700
X-CSE-ConnectionGUID: acW7nBfVTfW87YRl3DuA8w==
X-CSE-MsgGUID: fUuY7ICTTS2B77KS7WdvEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="188082452"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jun 2025 02:30:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSY5D-000LZK-11;
	Fri, 20 Jun 2025 09:30:51 +0000
Date: Fri, 20 Jun 2025 17:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 3/10] include/linux/ftrace.h:563:
 multiple definition of `unregister_ftrace_direct_hash';
 arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13180): first defined here
Message-ID: <202506201750.JadVeELr-lkp@intel.com>
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
commit: 85ce35fa5a72947188457f2189f1e9f83482470b [3/10] ftrace: Add unregister_ftrace_direct_hash function
config: x86_64-buildonly-randconfig-001-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201750.JadVeELr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201750.JadVeELr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201750.JadVeELr-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/svm/pmu.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13140): first defined here
   ld: arch/x86/kvm/svm/pmu.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13180): first defined here
   ld: arch/x86/kvm/svm/nested.o: in function `register_ftrace_direct_hash':
   nested.c:(.text+0x8680): multiple definition of `register_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13140): first defined here
   ld: arch/x86/kvm/svm/nested.o: in function `unregister_ftrace_direct_hash':
   nested.c:(.text+0x86c0): multiple definition of `unregister_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13180): first defined here
   ld: arch/x86/kvm/svm/avic.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13140): first defined here
   ld: arch/x86/kvm/svm/avic.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13180): first defined here
--
   ld: drivers/gpu/drm/ttm/ttm_resource.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/ttm/ttm_tt.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/ttm/ttm_resource.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/ttm/ttm_tt.o:include/linux/ftrace.h:563: first defined here
--
   ld: drivers/gpu/drm/vkms/vkms_plane.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_plane.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_output.o: in function `register_ftrace_direct_hash':
   vkms_output.c:(.text+0x0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_output.o: in function `unregister_ftrace_direct_hash':
   vkms_output.c:(.text+0x40): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_formats.o: in function `register_ftrace_direct_hash':
   vkms_formats.c:(.text+0x3540): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_formats.o: in function `unregister_ftrace_direct_hash':
   vkms_formats.c:(.text+0x3580): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_crtc.o: in function `register_ftrace_direct_hash':
   vkms_crtc.c:(.text+0x1740): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_crtc.o: in function `unregister_ftrace_direct_hash':
   vkms_crtc.c:(.text+0x1780): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_composer.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_composer.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_writeback.o: in function `register_ftrace_direct_hash':
   vkms_writeback.c:(.text+0xe80): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_writeback.o: in function `unregister_ftrace_direct_hash':
   vkms_writeback.c:(.text+0xec0): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_connector.o: in function `register_ftrace_direct_hash':
   vkms_connector.c:(.text+0x240): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_connector.o: in function `unregister_ftrace_direct_hash':
   vkms_connector.c:(.text+0x280): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_config.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_config.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
--
   ld: drivers/gpu/drm/v3d/v3d_drv.o: in function `register_ftrace_direct_hash':
   v3d_drv.c:(.text+0x17c0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/v3d/v3d_drv.o: in function `unregister_ftrace_direct_hash':
>> v3d_drv.c:(.text+0x1800): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/v3d/v3d_fence.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/v3d/v3d_fence.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/v3d/v3d_gem.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/v3d/v3d_gem.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/v3d/v3d_irq.o: in function `register_ftrace_direct_hash':
   v3d_irq.c:(.text+0x10c0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/v3d/v3d_irq.o: in function `unregister_ftrace_direct_hash':
   v3d_irq.c:(.text+0x1100): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/v3d/v3d_mmu.o: in function `register_ftrace_direct_hash':
   drivers/gpu/drm/v3d/v3d_mmu.c:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/v3d/v3d_mmu.o: in function `unregister_ftrace_direct_hash':
   drivers/gpu/drm/v3d/v3d_mmu.c:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/v3d/v3d_perfmon.o: in function `register_ftrace_direct_hash':
   v3d_perfmon.c:(.text+0x300): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/v3d/v3d_perfmon.o: in function `unregister_ftrace_direct_hash':
   v3d_perfmon.c:(.text+0x340): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/v3d/v3d_trace_points.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/v3d/v3d_trace_points.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/v3d/v3d_sched.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/v3d/v3d_sched.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/v3d/v3d_sysfs.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/v3d/v3d_sysfs.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/v3d/v3d_submit.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/v3d/v3d_submit.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/v3d/v3d_gemfs.o: in function `register_ftrace_direct_hash':
   drivers/gpu/drm/v3d/v3d_gemfs.c:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/v3d/v3d_gemfs.o: in function `unregister_ftrace_direct_hash':
   drivers/gpu/drm/v3d/v3d_gemfs.c:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:563: first defined here
   ld: drivers/gpu/drm/v3d/v3d_debugfs.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:559: first defined here
   ld: drivers/gpu/drm/v3d/v3d_debugfs.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:563: first defined here
--
   ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x23c0): first defined here
   ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x2400): first defined here
   ld: drivers/gpu/drm/pl111/pl111_drv.o: in function `register_ftrace_direct_hash':
   drivers/gpu/drm/pl111/pl111_drv.c:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x23c0): first defined here
   ld: drivers/gpu/drm/pl111/pl111_drv.o: in function `unregister_ftrace_direct_hash':
   drivers/gpu/drm/pl111/pl111_drv.c:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x2400): first defined here
   ld: drivers/gpu/drm/pl111/pl111_debugfs.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x23c0): first defined here
   ld: drivers/gpu/drm/pl111/pl111_debugfs.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:563: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x2400): first defined here


vim +563 include/linux/ftrace.h

   562	
 > 563	int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   564	{
   565		return -ENODEV;
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
