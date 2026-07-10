Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C4836DA1F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690465; cv=none; b=Qc6FktiRH2KLSS8WR/M1+VC1pT5vrrofzO6b8rp6c7TDzAToBpdIEa/RWNchS0ik91GdinbAe1q+7QCEbIarCYsMuE8c735lTRMbH9ir7N24El3kViyv++V7GIa+yLVpFceXjhL3CFAizePSljqiGf1FWcdvyDajD+s2S7yVc7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690465; c=relaxed/simple;
	bh=V22oatiGeSh7phoT2Q3qVMDJ/XKMuG/i/91Bv+lNoIg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OCh2CZ/alUUhB4oXsbkXzy7Hw/FtOIIZUGoORpMi+oHx+YDiK5ep+FlHsVhQ/QIQWUeCTyy/aPnmtwcgHPf9M+elL6F8f3lrBE+si+VFCSGPDNT3zZxzX2v2Q6LFxR2hW2ARYtNtE2xb7oHq5FUbE03hu2z7+LKmpOxUHsfPAFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPbbwz8z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPbbwz8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783690463; x=1815226463;
  h=date:from:to:cc:subject:message-id;
  bh=V22oatiGeSh7phoT2Q3qVMDJ/XKMuG/i/91Bv+lNoIg=;
  b=QPbbwz8zcloVnO0pSGZQMGXG/eHbf8NYiIcgybnxLQyt4mcgx2sTuOgd
   xq/FI65swYuE4VN2jmewZD7MN5ksnLI7421mzkJkp++5KJ0HXPu/7PVkr
   yNHjDtw5uW882h/omVw2vBKrVr7FMePDm3p2UXGqV+ZpAQsylz2J2oQWl
   aAT9a1VgQ76tLELj5nRym/dIBxgWQZFbeaInTs6IvxZZjk1tMA19HE9wV
   FZgLG9dvTqCL5WbLBKCowbLdLZe537QRBgvsBQga75+ABzQ3TKY+L7S1s
   saEJuGjlqSjiwwIOpmT9OJ2T82REtPhNI70XqZavsTTb+wPXc1MaLgnUn
   Q==;
X-CSE-ConnectionGUID: tgI13M9NTCWKp01+fW7XFA==
X-CSE-MsgGUID: CkV/a6KwQca9412nfCRm0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95759846"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95759846"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 06:34:21 -0700
X-CSE-ConnectionGUID: 9uYm4GkOQw68Cb4M8+IfYg==
X-CSE-MsgGUID: AcPxuAjJQ4uVxP2jWm5ovw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250888826"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2026 06:34:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiBMv-00000000Iy2-2igb;
	Fri, 10 Jul 2026 13:34:17 +0000
Date: Fri, 10 Jul 2026 21:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 1/1]
 include/linux/pgtable.h:8:20: error: 'PMD_SHIFT' undeclared; did you mean
 'PUD_SHIFT'?
Message-ID: <202607102112.naC3jGI0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   c8bd194f277ae6d43833ef16baa205e4c67629b4
commit: 0cc6f52b2aab23f59b9b92188194b0847105ceee [1/1] Merge 0bcb517f0a70 ("Merge tag 'mm-hotfixes-stable-2026-03-28-10-45' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm") into android-mainline
config: arm-randconfig-001-20260710 (https://download.01.org/0day-ci/archive/20260710/202607102112.naC3jGI0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607102112.naC3jGI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607102112.naC3jGI0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:32,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-buf.h:19,
                    from drivers/gpu/drm/drm_gem_shmem_helper.c:6:
   drivers/gpu/drm/drm_gem_shmem_helper.c: In function 'drm_gem_shmem_any_fault':
>> include/linux/pgtable.h:8:20: error: 'PMD_SHIFT' undeclared (first use in this function); did you mean 'PUD_SHIFT'?
    #define PMD_ORDER (PMD_SHIFT - PAGE_SHIFT)
                       ^~~~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:584:24: note: in expansion of macro 'PMD_ORDER'
     if (order && order != PMD_ORDER)
                           ^~~~~~~~~
   include/linux/pgtable.h:8:20: note: each undeclared identifier is reported only once for each function it appears in
    #define PMD_ORDER (PMD_SHIFT - PAGE_SHIFT)
                       ^~~~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:584:24: note: in expansion of macro 'PMD_ORDER'
     if (order && order != PMD_ORDER)
                           ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]


vim +8 include/linux/pgtable.h

f25748e3c34eb8b include/asm-generic/pgtable.h Dan Williams            2016-01-15   7  
051ddcfeb1bdbae include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-18  @8) #define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
051ddcfeb1bdbae include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-18   9) #define PUD_ORDER	(PUD_SHIFT - PAGE_SHIFT)
051ddcfeb1bdbae include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-18  10) 

:::::: The code at line 8 was first introduced by commit
:::::: 051ddcfeb1bdbae45e660c0db2468d29ca15c6c2 mm: move PMD_ORDER to pgtable.h

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
