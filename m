Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC22B182B7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687651; cv=none; b=rN4B/e8uxOd9I83grNrcxwC9b1afb24mpBBZOXG6L7x82F1xQlVuoSeGKXvCIOxYhCgrYG+W43bellkOewuqBWFJ+5FFUhabFZZgPHivvM8DGfiYpgJq8NHpCuBv+y1rfUmVfAge/rDvJS5XBKaBl0DZGOzfL1Otr8Cov8Wbzlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687651; c=relaxed/simple;
	bh=rV6MAM7HX3MAD7x2TYjGszvu7MSj4mdFjkzHYR+VUT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jaUuFuLMXE4wjQow7NXO3TCPGEiBY4aL4Jr0UwV3ZXFuOJTUoqSiFClAXgkCFYgliVk6ZUbY8FHjZmkwkhzyP0DWYb9SFxdeV+itvMb9yqyS97KFLVlT7G66BPygIStX5JQsE4pNw+xQ6ozEk71piYU/JbN3OzmqmFeK4UMK+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HN55Y7fD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HN55Y7fD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750687648; x=1782223648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rV6MAM7HX3MAD7x2TYjGszvu7MSj4mdFjkzHYR+VUT4=;
  b=HN55Y7fDvBBdMNoZ3/e82a06izPp5hl7LXTJ6SlMtHJ1EM7nCLrtxfGo
   PtBtI62Q+Hu5oFzOE6ziptWgzWeO1KKJUhpfYxM7QQeCJq6kcEVG+fOZY
   JOKQ/Z+UeDEe5oT41U/2cy/q4KBHE4OmKvDLj6+M2a+SdJ3050lC2LZoj
   2XXTrK4OMmETLCHatTXjrbew9uytCtOEqAEfogEsQWbmLEkuVipSNVBr4
   VwVwI1etgiotdN+L0kGrP++fvS6dVtZ0uysEY4TY77UPMGUJG7EBOWGS9
   kVq3S1zVwsq6zdXMGo4/dy/9FnXR58I0MySR782heq5VOM8BQlhA3bpkP
   A==;
X-CSE-ConnectionGUID: qhGknuePQT25TunFrPSu0w==
X-CSE-MsgGUID: U7GPisDPSYW3//R1AgECdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64252599"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="64252599"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 07:07:27 -0700
X-CSE-ConnectionGUID: KLWMkSRzQvqqYW3n8KvJkg==
X-CSE-MsgGUID: +VRTJTSiTtyCtAQoWXnuGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152124641"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2025 07:07:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uThpU-000Oz8-1e;
	Mon, 23 Jun 2025 14:07:24 +0000
Date: Mon, 23 Jun 2025 22:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 6/22] powerpc64-linux-ld:
 drivers/gpu/drm/drm_atomic_state_helper.o:(.opd+0x300): multiple definition
 of `modify_ftrace_direct_hash';
 drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
Message-ID: <202506232238.oUXjZiUe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   28441de17b08aa419e3a354e2940268a9078d418
commit: ddbb55448acfc318c1d96e9213b6d779cb05c79d [6/22] ftrace: Add modify_ftrace_direct_hash function
config: powerpc64-randconfig-003-20250621 (https://download.01.org/0day-ci/archive/20250623/202506232238.oUXjZiUe-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506232238.oUXjZiUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506232238.oUXjZiUe-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: drivers/gpu/drm/drm_atomic_state_helper.o:(.opd+0x2d0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x558): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_atomic_state_helper.o:(.opd+0x2e8): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x570): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
>> powerpc64-linux-ld: drivers/gpu/drm/drm_atomic_state_helper.o:(.opd+0x300): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_bridge_helper.o:(.opd+0x18): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x558): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_bridge_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_bridge_helper.o:(.opd+0x30): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x570): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_bridge_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_bridge_helper.o:(.opd+0x48): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_bridge_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_crtc_helper.o:(.opd+0x108): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x558): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_crtc_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_crtc_helper.o:(.opd+0x120): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x570): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_crtc_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_crtc_helper.o:(.opd+0x138): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_crtc_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_damage_helper.o:(.opd+0x78): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x558): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_damage_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_damage_helper.o:(.opd+0x90): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x570): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_damage_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_damage_helper.o:(.opd+0xa8): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_damage_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_flip_work.o:(.opd+0x78): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x558): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_flip_work.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_flip_work.o:(.opd+0x90): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x570): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_flip_work.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_flip_work.o:(.opd+0xa8): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_flip_work.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_gem_atomic_helper.o:(.opd+0x150): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x558): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_gem_atomic_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_gem_atomic_helper.o:(.opd+0x168): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x570): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_gem_atomic_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_gem_atomic_helper.o:(.opd+0x180): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_gem_atomic_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_gem_framebuffer_helper.o:(.opd+0x138): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x558): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_gem_framebuffer_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_gem_framebuffer_helper.o:(.opd+0x150): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x570): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_gem_framebuffer_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_gem_framebuffer_helper.o:(.opd+0x168): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_gem_framebuffer_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_modeset_helper.o:(.opd+0x78): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x558): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_modeset_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_modeset_helper.o:(.opd+0x90): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x570): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_modeset_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_modeset_helper.o:(.opd+0xa8): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_modeset_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_plane_helper.o:(.opd+0x78): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x558): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_plane_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_plane_helper.o:(.opd+0x90): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x570): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_plane_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_plane_helper.o:(.opd+0xa8): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_plane_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_probe_helper.o:(.opd+0x228): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x558): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_probe_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_probe_helper.o:(.opd+0x240): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x570): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_probe_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_probe_helper.o:(.opd+0x258): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_probe_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_self_refresh_helper.o:(.opd+0x78): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x558): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_self_refresh_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_self_refresh_helper.o:(.opd+0x90): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x570): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_self_refresh_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_self_refresh_helper.o:(.opd+0xa8): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_self_refresh_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_simple_kms_helper.o:(.opd+0x228): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x558): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_simple_kms_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_simple_kms_helper.o:(.opd+0x240): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x570): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_simple_kms_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_simple_kms_helper.o:(.opd+0x258): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic_helper.o:(.opd+0x588): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_simple_kms_helper.o: in function `.modify_ftrace_direct_hash':
--
   powerpc64-linux-ld: drivers/gpu/drm/drm_atomic_uapi.o:(.opd+0x150): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x438): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_atomic_uapi.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_atomic_uapi.o:(.opd+0x168): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x450): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_atomic_uapi.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
>> powerpc64-linux-ld: drivers/gpu/drm/drm_atomic_uapi.o:(.opd+0x180): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x468): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_atomic_uapi.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_auth.o:(.opd+0xc0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x438): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_auth.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_auth.o:(.opd+0xd8): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x450): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_auth.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_auth.o:(.opd+0xf0): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x468): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_auth.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_blend.o:(.opd+0xd8): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x438): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_blend.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_blend.o:(.opd+0xf0): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x450): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_blend.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_blend.o:(.opd+0x108): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x468): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_blend.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_bridge.o:(.opd+0x330): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x438): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_bridge.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_bridge.o:(.opd+0x348): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x450): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_bridge.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_bridge.o:(.opd+0x360): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x468): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_bridge.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_color_mgmt.o:(.opd+0x90): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x438): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_color_mgmt.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_color_mgmt.o:(.opd+0xa8): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x450): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_color_mgmt.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_color_mgmt.o:(.opd+0xc0): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x468): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_color_mgmt.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_connector.o:(.opd+0x5e8): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x438): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_connector.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_connector.o:(.opd+0x600): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x450): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_connector.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_connector.o:(.opd+0x618): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x468): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_connector.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_crtc.o:(.opd+0x150): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x438): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_crtc.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_crtc.o:(.opd+0x168): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x450): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_crtc.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_crtc.o:(.opd+0x180): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x468): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_crtc.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_drv.o:(.opd+0x258): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x438): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_drv.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_drv.o:(.opd+0x270): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x450): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_drv.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_drv.o:(.opd+0x288): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x468): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_drv.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_dumb_buffers.o:(.opd+0x0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x438): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_dumb_buffers.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_dumb_buffers.o:(.opd+0x18): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x450): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_dumb_buffers.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_dumb_buffers.o:(.opd+0x30): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x468): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_dumb_buffers.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_edid.o:(.opd+0x8b8): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x438): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_edid.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_edid.o:(.opd+0x8d0): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x450): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_edid.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_edid.o:(.opd+0x8e8): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x468): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_edid.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_encoder.o:(.opd+0xa8): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x438): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_encoder.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_encoder.o:(.opd+0xc0): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x450): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_encoder.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_encoder.o:(.opd+0xd8): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x468): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_encoder.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_file.o:(.opd+0x180): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x438): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_file.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_file.o:(.opd+0x198): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x450): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_file.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_file.o:(.opd+0x1b0): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/drm_atomic.o:(.opd+0x468): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/drm_file.o: in function `.modify_ftrace_direct_hash':
--
   powerpc64-linux-ld: drivers/gpu/drm/ttm/ttm_resource.o:(.opd+0x1e0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/ttm/ttm_tt.o:(.opd+0x180): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/ttm/ttm_resource.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/ttm/ttm_tt.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/ttm/ttm_resource.o:(.opd+0x1f8): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/ttm/ttm_tt.o:(.opd+0x198): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/ttm/ttm_resource.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/ttm/ttm_tt.o:include/linux/ftrace.h:562: first defined here
>> powerpc64-linux-ld: drivers/gpu/drm/ttm/ttm_resource.o:(.opd+0x210): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/ttm/ttm_tt.o:(.opd+0x1b0): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/ttm/ttm_resource.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/ttm/ttm_tt.o:include/linux/ftrace.h:562: first defined here
--
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_helper.o:(.opd+0xbd0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1e0): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_helper.o:(.opd+0xbe8): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1f8): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
>> powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_helper.o:(.opd+0xc00): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x210): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_mst_topology.o:(.opd+0xae0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1e0): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_mst_topology.o:(.opd+0xaf8): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1f8): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_mst_topology.o:(.opd+0xb10): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x210): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dsc_helper.o:(.opd+0x138): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1e0): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dsc_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dsc_helper.o:(.opd+0x150): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1f8): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dsc_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dsc_helper.o:(.opd+0x168): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x210): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dsc_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdcp_helper.o:(.opd+0x78): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1e0): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdcp_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdcp_helper.o:(.opd+0x90): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1f8): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdcp_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdcp_helper.o:(.opd+0xa8): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x210): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdcp_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_audio_helper.o:(.opd+0xf0): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1e0): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_audio_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_audio_helper.o:(.opd+0x108): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1f8): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_audio_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_audio_helper.o:(.opd+0x120): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x210): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_audio_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_helper.o:(.opd+0x90): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1e0): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_helper.o:(.opd+0xa8): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1f8): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_helper.o:(.opd+0xc0): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x210): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_scdc_helper.o:(.opd+0x78): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1e0): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_scdc_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_scdc_helper.o:(.opd+0x90): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1f8): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_scdc_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_scdc_helper.o:(.opd+0xa8): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x210): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_scdc_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_state_helper.o:(.opd+0x150): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1e0): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_state_helper.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_state_helper.o:(.opd+0x168): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1f8): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_state_helper.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_state_helper.o:(.opd+0x180): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x210): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_hdmi_state_helper.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_aux_dev.o:(.opd+0xa8): multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1e0): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_aux_dev.o: in function `.register_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.register_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_aux_dev.o:(.opd+0xc0): multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x1f8): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_aux_dev.o: in function `.unregister_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.unregister_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_aux_dev.o:(.opd+0xd8): multiple definition of `modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:(.opd+0x210): first defined here
   powerpc64-linux-ld: drivers/gpu/drm/display/drm_dp_aux_dev.o: in function `.modify_ftrace_direct_hash':
   include/linux/ftrace.h:562: multiple definition of `.modify_ftrace_direct_hash'; drivers/gpu/drm/display/drm_bridge_connector.o:include/linux/ftrace.h:562: first defined here
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
