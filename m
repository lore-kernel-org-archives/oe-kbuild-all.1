Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D01914F9FF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 18:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738177057; cv=none; b=lpAQlj+49hz4S157YbwrClqseoX+zbfuLwnIA1CY2ylMF89LXqF6BLz0K9ue+CfCtwWipR70rUg/UHgHfkKa91LFozObaDe4Lq+GZeGQnp+LdToTj0WvQZ0P+UDEEGMI5JfjLeEsA4OQmHMdcoJsbz2rGjrjftHgEi6HnKdEkkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738177057; c=relaxed/simple;
	bh=GkeAL9dIrK6ErLzCuRePePmeY7x2JTnhWFFjvQCkO/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nV/nNSYOVAajYt+pBYbjNme/Sj7my01LwgOvE0bzSbLWHuECk5cNOjeV4r8DhfX3K5o5Yo4R64gm1TFFlufV/i+sri2w2uSBlDtFXlcvzSP4NKR7USu4CF6JVoR6zozlcUsNOoJENW7QWjgZV37p6bGXTcEWtsmtlj+UVwKWRqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyUOjm2Q; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyUOjm2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738177057; x=1769713057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GkeAL9dIrK6ErLzCuRePePmeY7x2JTnhWFFjvQCkO/s=;
  b=nyUOjm2QWULonfXPdcaECfAKJEgcDAres10n16vUzb61SqUO0GyEYbLL
   VhY56LxB5/nbLqSu9mX0HLMFeXf4W7KCJBtk/VitQwQZh4hj1GKLBlF2M
   EXscOOaJXWppRBkl2z0IDFCHhXjBlhFaI5vDiDDC+6Exs5cMpBY4czu/Q
   wZOrbecyI65S+yDWgYO6gCJXYWjTWNM6z1NkGe1/XtfgkPIea9auUyoPg
   8CLQalnYLkaWyKqLdwtFfPyvugbkMqeV5SlGp1gocl0+5zACsGvSqSfr0
   RRAguQ7Fva3ztNrBHqvm4c+w35raNnMegLlp51qUUrB/08kmmSy9Kgfnz
   w==;
X-CSE-ConnectionGUID: V4VWEHGZRGGDkgSwfoNwjg==
X-CSE-MsgGUID: RogvYnQGTZKdiu0vrzSlBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42456652"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="42456652"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 10:57:36 -0800
X-CSE-ConnectionGUID: zKLiJzcKQvOCIm0G6E2xbQ==
X-CSE-MsgGUID: 4O9sgXZVQm+qUsWHmUv19Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="109019883"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jan 2025 10:57:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdDFk-000jG5-1X;
	Wed, 29 Jan 2025 18:57:32 +0000
Date: Thu, 30 Jan 2025 02:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] iommu.c:undefined reference to
 `cma_alloc'
Message-ID: <202501300204.912lbjeq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5a8cdb7644f93f66c3fe09f052ea939f71cfbff1
commit: 3f35c377b90d0692801bd74b5501e6dcf81e4900 [1/1] ANDROID: KVM: arm64: iommu: Allow donations from a CMA pool
config: arm64-randconfig-001-20250129 (https://download.01.org/0day-ci/archive/20250130/202501300204.912lbjeq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300204.912lbjeq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300204.912lbjeq-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kvm/iommu.o: in function `kvm_iommu_cma_alloc':
>> iommu.c:(.text+0x1a0): undefined reference to `cma_alloc'
   aarch64-linux-ld: arch/arm64/kvm/iommu.o: in function `kvm_iommu_cma_release':
>> iommu.c:(.text+0x20c): undefined reference to `cma_release'
   aarch64-linux-ld: arch/arm64/kvm/iommu.o: in function `pkvm_iommu_cma_setup':
>> iommu.c:(.init.text+0x44): undefined reference to `cma_init_reserved_mem'
>> aarch64-linux-ld: iommu.c:(.init.text+0x54): undefined reference to `cma_get_base'
>> aarch64-linux-ld: iommu.c:(.init.text+0x64): undefined reference to `cma_get_size'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
