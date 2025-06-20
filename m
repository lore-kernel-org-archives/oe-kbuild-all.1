Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026951FBEB9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 10:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414470; cv=none; b=kr8M1x0R7ivEDWsE/7lba1yI0xSiBKAMZx5PCspelBGmmsJXwpS6vOE3t1+US1PiS1Y9oaDu6ghfyQAQyHQUDabIWrDcpR4h4vhhZwulnKF7FxhboQ2pt923qUlRcihaufoo5BDMDN4WOfF15U+K9Wu3At4Ss9+eqF5seajlceA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414470; c=relaxed/simple;
	bh=MElZw/3dHppY/fMevpPh+3THiW1Vh5VGmFiTjnlqaK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdT7US3+uheVxipuizbFpr14RHXASouXUb6/3CbT1IPkq6GJiAWo8lVyxV7wrhahXERrkHYT0dNXZH/RRm//q8gxbbb9w5HcBzt/d1v6QAPqQlUUPFBoCxZGDfA1NxdvNWAje8/ZI+Mks88pZKs4EeS38As8cM4CtrwlEbliyBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5dUBvmQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5dUBvmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750414468; x=1781950468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MElZw/3dHppY/fMevpPh+3THiW1Vh5VGmFiTjnlqaK4=;
  b=X5dUBvmQsmQAJ4cskO6gHIDpVdY6w19TRUMk9rfWRryiIwM8RQxijAgx
   auwD5EsRv1GCUnEKIx0kKuBO+XJTX51e8eeFL1ZHoGemsMWHfja79kw77
   2Rw9jyS3i2dgaFUGxqDWqdKe0QHFPnTxkdA9U4A5umJZhAASIwfQBEvhM
   cE/zDYL+D6TaWJPMHb8D1rOYv0G6bNmTiv5cZRdBxzqw/PBwWWlepaZ0h
   oWw6AfWf2ZECaHRtk4UHG6JPCN3u1aFXX+yIQDySzAUWWB3yDzecEtt+L
   F2Qo9CigFadXE6UN+JXOifS1DjrhEFS5QGmifpPGKwJ8RJiSSMSiqILFt
   w==;
X-CSE-ConnectionGUID: 4z7gLvUlTiuA4qavSnrjpw==
X-CSE-MsgGUID: SN+QQ7D2Sfa+6L2wcXTeYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="56474460"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="56474460"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 03:14:01 -0700
X-CSE-ConnectionGUID: KcIldmp0R5mp/4666yU3fw==
X-CSE-MsgGUID: v5wAu5vrQXyRsyEuAYVjBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="188091426"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jun 2025 03:14:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSYkv-000Lc6-0x;
	Fri, 20 Jun 2025 10:13:57 +0000
Date: Fri, 20 Jun 2025 18:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 4/10] include/linux/ftrace.h:570:
 multiple definition of `modify_ftrace_direct_hash';
 arch/x86/kvm/svm/svm.o:svm.c:(.text+0x131c0): first defined here
Message-ID: <202506201809.kSfdijvc-lkp@intel.com>
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
commit: 2f2d7e228b3f129edb4cefbc6c20dff3ea5b8d87 [4/10] ftrace: Add modify_ftrace_direct_hash function
config: x86_64-buildonly-randconfig-001-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201809.kSfdijvc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201809.kSfdijvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201809.kSfdijvc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/svm/pmu.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13140): first defined here
   ld: arch/x86/kvm/svm/pmu.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13180): first defined here
   ld: arch/x86/kvm/svm/pmu.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x131c0): first defined here
   ld: arch/x86/kvm/svm/nested.o: in function `register_ftrace_direct_hash':
   nested.c:(.text+0x8680): multiple definition of `register_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13140): first defined here
   ld: arch/x86/kvm/svm/nested.o: in function `unregister_ftrace_direct_hash':
   nested.c:(.text+0x86c0): multiple definition of `unregister_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13180): first defined here
   ld: arch/x86/kvm/svm/nested.o: in function `modify_ftrace_direct_hash':
   nested.c:(.text+0x8700): multiple definition of `modify_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x131c0): first defined here
   ld: arch/x86/kvm/svm/avic.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13140): first defined here
   ld: arch/x86/kvm/svm/avic.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x13180): first defined here
   ld: arch/x86/kvm/svm/avic.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; arch/x86/kvm/svm/svm.o:svm.c:(.text+0x131c0): first defined here
--
   ld: drivers/gpu/drm/ttm/ttm_resource.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/ttm/ttm_tt.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/ttm/ttm_resource.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/ttm/ttm_tt.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/ttm/ttm_resource.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/ttm/ttm_tt.o:include/linux/ftrace.h:570: first defined here
--
   ld: drivers/gpu/drm/vkms/vkms_plane.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_plane.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_plane.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb40): first defined here
   ld: drivers/gpu/drm/vkms/vkms_output.o: in function `register_ftrace_direct_hash':
   vkms_output.c:(.text+0x0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_output.o: in function `unregister_ftrace_direct_hash':
   vkms_output.c:(.text+0x40): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_output.o: in function `modify_ftrace_direct_hash':
   vkms_output.c:(.text+0x80): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb40): first defined here
   ld: drivers/gpu/drm/vkms/vkms_formats.o: in function `register_ftrace_direct_hash':
   vkms_formats.c:(.text+0x3540): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_formats.o: in function `unregister_ftrace_direct_hash':
   vkms_formats.c:(.text+0x3580): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_formats.o: in function `modify_ftrace_direct_hash':
   vkms_formats.c:(.text+0x35c0): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb40): first defined here
   ld: drivers/gpu/drm/vkms/vkms_crtc.o: in function `register_ftrace_direct_hash':
   vkms_crtc.c:(.text+0x1740): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_crtc.o: in function `unregister_ftrace_direct_hash':
   vkms_crtc.c:(.text+0x1780): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_crtc.o: in function `modify_ftrace_direct_hash':
   vkms_crtc.c:(.text+0x17c0): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb40): first defined here
   ld: drivers/gpu/drm/vkms/vkms_composer.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_composer.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_composer.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb40): first defined here
   ld: drivers/gpu/drm/vkms/vkms_writeback.o: in function `register_ftrace_direct_hash':
   vkms_writeback.c:(.text+0xe80): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_writeback.o: in function `unregister_ftrace_direct_hash':
   vkms_writeback.c:(.text+0xec0): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_writeback.o: in function `modify_ftrace_direct_hash':
   vkms_writeback.c:(.text+0xf00): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb40): first defined here
   ld: drivers/gpu/drm/vkms/vkms_connector.o: in function `register_ftrace_direct_hash':
   vkms_connector.c:(.text+0x240): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_connector.o: in function `unregister_ftrace_direct_hash':
   vkms_connector.c:(.text+0x280): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_connector.o: in function `modify_ftrace_direct_hash':
   vkms_connector.c:(.text+0x2c0): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb40): first defined here
   ld: drivers/gpu/drm/vkms/vkms_config.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xac0): first defined here
   ld: drivers/gpu/drm/vkms/vkms_config.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb00): first defined here
   ld: drivers/gpu/drm/vkms/vkms_config.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/vkms/vkms_drv.o:vkms_drv.c:(.text+0xb40): first defined here
--
   ld: drivers/gpu/drm/v3d/v3d_drv.o: in function `register_ftrace_direct_hash':
   v3d_drv.c:(.text+0x17c0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/v3d/v3d_drv.o: in function `unregister_ftrace_direct_hash':
   v3d_drv.c:(.text+0x1800): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/v3d/v3d_drv.o: in function `modify_ftrace_direct_hash':
>> v3d_drv.c:(.text+0x1840): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/v3d/v3d_fence.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/v3d/v3d_fence.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/v3d/v3d_fence.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/v3d/v3d_gem.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/v3d/v3d_gem.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/v3d/v3d_gem.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/v3d/v3d_irq.o: in function `register_ftrace_direct_hash':
   v3d_irq.c:(.text+0x10c0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/v3d/v3d_irq.o: in function `unregister_ftrace_direct_hash':
   v3d_irq.c:(.text+0x1100): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/v3d/v3d_irq.o: in function `modify_ftrace_direct_hash':
   v3d_irq.c:(.text+0x1140): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/v3d/v3d_mmu.o: in function `register_ftrace_direct_hash':
   drivers/gpu/drm/v3d/v3d_mmu.c:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/v3d/v3d_mmu.o: in function `unregister_ftrace_direct_hash':
   drivers/gpu/drm/v3d/v3d_mmu.c:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/v3d/v3d_mmu.o: in function `modify_ftrace_direct_hash':
   drivers/gpu/drm/v3d/v3d_mmu.c:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/v3d/v3d_perfmon.o: in function `register_ftrace_direct_hash':
   v3d_perfmon.c:(.text+0x300): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/v3d/v3d_perfmon.o: in function `unregister_ftrace_direct_hash':
   v3d_perfmon.c:(.text+0x340): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/v3d/v3d_perfmon.o: in function `modify_ftrace_direct_hash':
   v3d_perfmon.c:(.text+0x380): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/v3d/v3d_trace_points.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/v3d/v3d_trace_points.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/v3d/v3d_trace_points.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/v3d/v3d_sched.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/v3d/v3d_sched.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/v3d/v3d_sched.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/v3d/v3d_sysfs.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/v3d/v3d_sysfs.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/v3d/v3d_sysfs.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/v3d/v3d_submit.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/v3d/v3d_submit.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/v3d/v3d_submit.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/v3d/v3d_gemfs.o: in function `register_ftrace_direct_hash':
   drivers/gpu/drm/v3d/v3d_gemfs.c:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/v3d/v3d_gemfs.o: in function `unregister_ftrace_direct_hash':
   drivers/gpu/drm/v3d/v3d_gemfs.c:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/v3d/v3d_gemfs.o: in function `modify_ftrace_direct_hash':
   drivers/gpu/drm/v3d/v3d_gemfs.c:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:570: first defined here
   ld: drivers/gpu/drm/v3d/v3d_debugfs.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:560: first defined here
   ld: drivers/gpu/drm/v3d/v3d_debugfs.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:564: first defined here
   ld: drivers/gpu/drm/v3d/v3d_debugfs.o: in function `modify_ftrace_direct_hash':
   include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/v3d/v3d_bo.o:include/linux/ftrace.h:570: first defined here
--
   ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x23c0): first defined here
   ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x2400): first defined here
   ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x2440): first defined here
   ld: drivers/gpu/drm/pl111/pl111_drv.o: in function `register_ftrace_direct_hash':
   drivers/gpu/drm/pl111/pl111_drv.c:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x23c0): first defined here
   ld: drivers/gpu/drm/pl111/pl111_drv.o: in function `unregister_ftrace_direct_hash':
   drivers/gpu/drm/pl111/pl111_drv.c:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x2400): first defined here
   ld: drivers/gpu/drm/pl111/pl111_drv.o: in function `modify_ftrace_direct_hash':
   drivers/gpu/drm/pl111/pl111_drv.c:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x2440): first defined here
   ld: drivers/gpu/drm/pl111/pl111_debugfs.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x23c0): first defined here
   ld: drivers/gpu/drm/pl111/pl111_debugfs.o: in function `unregister_ftrace_direct_hash':
   include/linux/ftrace.h:564: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x2400): first defined here
   ld: drivers/gpu/drm/pl111/pl111_debugfs.o: in function `modify_ftrace_direct_hash':
>> include/linux/ftrace.h:570: multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:pl111_display.c:(.text+0x2440): first defined here


vim +570 include/linux/ftrace.h

   568	
   569	int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
 > 570	{
   571		return -ENODEV;
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
