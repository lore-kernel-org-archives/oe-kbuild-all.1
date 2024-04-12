Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296AD14D2B7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 18:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712945244; cv=none; b=YcYdgbl0rEOAUhW6i3gvR3m8i9A35vCkGjsIMKajfHeATtaVPTpwWI7FuhAAkOHJpdXforXOyEnR18a6VyU3msqpMnL+AbH+Gmqn13cFvUVIyStM3Q2wu8a3FF+41gdE2fNvpnJ7eWbzf9G0Afi/uledeKTzAFaU1k82nqFR4gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712945244; c=relaxed/simple;
	bh=yG6CIOJvl1mC0/vY56g9AD2d9imNuX8/H8oxC4Gt+9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbJgQ5KgWrkNo/WtZddVRVExQq4R5m1eMBbsfJUtJjkIyR5CkLC2o4Jaky1a6dFa0ibqvWGJuUjemP90etQRAdwrfp794JXkGYOZMgcD0p45NmVKiq/m4IYgtHCFhQ7yzfAZyIIx+1NAxs4mS7PPfECyzRFoHKd4yLQnply4eDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URquS1jh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URquS1jh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712945242; x=1744481242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yG6CIOJvl1mC0/vY56g9AD2d9imNuX8/H8oxC4Gt+9Y=;
  b=URquS1jh0EhLsoaUBuuYXxd66OcTEnVqpktLfWI/b2naX8hT+5jdjzGs
   hKHx+PPARDxmjnq93IL+tO0tSv0eeZgTN+4cGLJaDA9+We0SGMIscPs6Z
   7evWf7JbMHnTvcMqnnFAFO9LrrEhk0y10BXQtU0p0CMm1cvBCNzt/rVJo
   YHspvaZDykg2YXCGxlp9rBcjW+sagq9hpmuT7VTVasLOqj7Et40tSZTem
   tUS6oyAzangYkJ4G4/Jq7TdPfacFZlvRFQIp2icKH4rAuF+i/v52I5+3n
   +zrteeyMNddcGFE7gxFhbTDKaa7oxrgJ3Ee2HVFBO6yNfyMCyXC/0cqjG
   g==;
X-CSE-ConnectionGUID: pzVtL+3BRQeuBfP/qlBh3Q==
X-CSE-MsgGUID: l18Xq4R1QUSGPl4RsezczA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="25868720"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="25868720"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 11:07:22 -0700
X-CSE-ConnectionGUID: h5Ly6btlQhiSxRSirnkzOw==
X-CSE-MsgGUID: J/VRT1h+QxeFhJB2oJ7Hig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="25950277"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Apr 2024 11:07:20 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvLIx-0000Tg-2v;
	Fri, 12 Apr 2024 18:07:16 +0000
Date: Sat, 13 Apr 2024 02:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 12/19]
 drivers/gpu/drm/img-rogue/1.17/mmu_common.c:3281:12: warning: variable
 'pcBackingPageName' set but not used
Message-ID: <202404130154.NHpCr1b5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   094079bc0206fd913bf829bf507139bfab36882a
commit: 540f7fbdc1fde82a7da8936de9a5ec501c7f092f [12/19] CHROMIUM: img-rogue: Improve _MMU_GetPTInfo() function
config: arm64-randconfig-003-20240413 (https://download.01.org/0day-ci/archive/20240413/202404130154.NHpCr1b5-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404130154.NHpCr1b5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404130154.NHpCr1b5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/img-rogue/1.17/mmu_common.c:2894:13: warning: variable 'ui32MappedCount' set but not used [-Wunused-but-set-variable]
    2894 |         IMG_UINT32 ui32MappedCount = 0;
         |                    ^
>> drivers/gpu/drm/img-rogue/1.17/mmu_common.c:3281:12: warning: variable 'pcBackingPageName' set but not used [-Wunused-but-set-variable]
    3281 |         IMG_CHAR *pcBackingPageName = NULL;
         |                   ^
   2 warnings generated.


vim +/pcBackingPageName +3281 drivers/gpu/drm/img-rogue/1.17/mmu_common.c

  3257	
  3258	static PVRSRV_ERROR
  3259	MMU_UnmapPagesUnlocked(MMU_CONTEXT *psMMUContext,
  3260	                       PVRSRV_MEMALLOCFLAGS_T uiMappingFlags,
  3261	                       IMG_DEV_VIRTADDR sDevVAddrBase,
  3262	                       IMG_UINT32 ui32PageCount,
  3263	                       IMG_UINT32 *pai32FreeIndices,
  3264	                       IMG_UINT32 uiLog2PageSize,
  3265	                       PVRSRV_MEMALLOCFLAGS_T uiMemAllocFlags)
  3266	{
  3267		PVRSRV_ERROR eError;
  3268		IMG_UINT32 uiPTEIndex = 0, ui32Loop=0;
  3269		IMG_UINT32 uiPageSize = 1 << uiLog2PageSize;
  3270		IMG_UINT32 uiFlushEnd = 0, uiFlushStart = 0;
  3271		MMU_Levelx_INFO *psLevel = NULL;
  3272		MMU_Levelx_INFO *psPrevLevel = NULL;
  3273		IMG_HANDLE hPriv;
  3274		const MMU_PxE_CONFIG *psConfig;
  3275		const MMU_DEVVADDR_CONFIG *psDevVAddrConfig;
  3276		IMG_UINT64 uiProtFlags = 0, uiProtFlagsReadOnly = 0;
  3277		MMU_PROTFLAGS_T uiMMUProtFlags = 0, uiMMUReadOnlyProtFlags = 0;
  3278		IMG_DEV_VIRTADDR sDevVAddr = sDevVAddrBase;
  3279		IMG_DEV_PHYADDR sBackingPgDevPhysAddr;
  3280		IMG_BOOL bUnmap = IMG_TRUE, bDummyBacking = IMG_FALSE, bZeroBacking = IMG_FALSE;
> 3281		IMG_CHAR *pcBackingPageName = NULL;
  3282		PVRSRV_DEVICE_NODE *psDevNode = psMMUContext->psPhysMemCtx->psDevNode;
  3283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
