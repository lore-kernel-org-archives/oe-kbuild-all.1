Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F2A18D62A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790490790; cv=none; b=QzeMtXrXXAB+pDBiisfhKyWj6fpbUZszbr0GCmpLU82/feJko20tDWNq4nAxX/DG5QwgIUd3tC2MZdBMG6kGxMwmHOeRfsIsy0kk4djF1v+2AtglrbnOD3fL1Ph0ZIQiMCmqCPf8EI8bT5k74+h1vrQiX+30n5STIgJ7sdfgp/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790490790; c=relaxed/simple;
	bh=QLc3rsUNDwlKlDDShabHXKVEmJ3XTvjHFb8/Agw1B0I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rjy81i9AbxZIx0YKxfaqGJi/eEHKouT7U8CTe2bKWmI8PAq6vnZ2UQu5kSQdApr5v4ZWJdS80CHaatM9PbgzsT3IyUR0x68VTaX5feoDblPA+GQInWrjCTbz1bz62WSrcQ11xVlH/GMOYB+mMYNIUPenfRE/LwDKOywZMl7rSRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goa9ojxD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goa9ojxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790490788; x=1822026788;
  h=date:from:to:cc:subject:message-id;
  bh=QLc3rsUNDwlKlDDShabHXKVEmJ3XTvjHFb8/Agw1B0I=;
  b=goa9ojxDZe4GGQ5rNoBA/vQcrGaxt7P/TSAIdxDGpK2GWSRB6Xfu/utL
   PasP4JlOr54KZT0YV0mDetLBjwBSXoNwcotoN0VTSJ+PVKoz1yK62mIjA
   wH4ffg4O2ThmQ3f8TzFNQpm/LJM1TRlVM4o55w3PZcEWW7vjaS139jL4l
   bf3QBvg1hhscWRr5OzkOAm4zUXszm80+Hq/tUHcYQgSuHSQ4715V5Yfmo
   6W7v5rMCoQn67s7ddCSjmILEzS1rarm2L1V9xKuIUoGsr2GWEM8Ne3hf+
   nxSy6IfoJr5xny9OkUbI0zvTKV3KXKmTgkJzvuxgNqzUNinBJtXtK/hGY
   w==;
X-CSE-ConnectionGUID: fT3HpWtDR7+lkweUDfEzTg==
X-CSE-MsgGUID: rt9+FSbhRa+MU/nvtcfETQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="91079003"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="91079003"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 23:33:07 -0700
X-CSE-ConnectionGUID: BNlU2AoPRWO1VS8TKn3SOA==
X-CSE-MsgGUID: bzk8IjsgSZyljbacGLlqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="279468691"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 26 Sep 2026 23:33:05 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAiRa-000000000Sl-2NXs;
	Sun, 27 Sep 2026 06:33:02 +0000
Date: Sun, 27 Sep 2026 08:32:53 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_MGAG200
Message-ID: <202609270809.mpCM4LYU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_MGAG200-0-0 (https://download.01.org/0day-ci/archive/20260927/202609270809.mpCM4LYU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609270809.mpCM4LYU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270809.mpCM4LYU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_MGAG200
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_MGAG200 [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (KUNIT [=y] || !KUNIT [=y]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI) && (PAGE_SIZE_4KB [=y] || COMPILE_TEST [=n] || BROKEN [=n])
   
   WARNING: unmet direct dependencies detected for SHMEM
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (KUNIT [=y] || !KUNIT [=y]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI) && (PAGE_SIZE_4KB [=y] || COMPILE_TEST [=n] || BROKEN [=n])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
