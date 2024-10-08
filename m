Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF3414EC59
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397371; cv=none; b=mG9HdbehwtwuNLLTK8BsxXK7LH1ypwj3vaMxxV8dy0rkjFzyXoh0Zb50uGyoXcVD6fpMLlWsx0ue1qoAk8/X6FGvtejjto9ERQeVAdIcRqW47djC14wzudlcILGXOD08F81aU68eK6u5Mt3PkshtJFbDL1Cr/eUtUCdY+q7dEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397371; c=relaxed/simple;
	bh=k4o15T0IVAeLkorMxWJC1iDRugfJQ4+6ViD62eyx0iA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R7/du5m6Ru4NWpjP9N2z6qzxargYp+WzLmwJUSw6zLxJNqg9b3ISHhV3rCZWQzk6a1Td+7NCMlogUs50pu6s/mnXYOzdQAVy3lpRc6rkfShTZ7L18fgTwqrlfysoh6MCLMM6qe+okRi+Sy46d9k0OTPUOvWM7VaRdUDcwtntEbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3UDnswi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3UDnswi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728397369; x=1759933369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k4o15T0IVAeLkorMxWJC1iDRugfJQ4+6ViD62eyx0iA=;
  b=c3UDnswiAkhhhihX3h0eOVLa9HrmSu8K6EXoLpwYe+apcl4kjt+lt0Ui
   I3PB9wgjgNqwoqOvclAp6BC1YwzJXbWbZBela9a9ck4IaVSKLq2Z+stei
   YXEJ/dpmLn8gfViok9Fzs+hyDMFUNEU63CBgPcHoo2D0n05c8PxHL0zzE
   1dNgXKuhJJQGwH0JANdT74sItX1zBhCuGYf36VGjtZfO4L3HUl20vyDG+
   telULSSMPaOlGuYa75lSIwIgx1EJ9YfO2O6/uD9vzUqwhIY5pL3de/Yzd
   S9vno+fExAIkxQLkcpHrKPRLDSc3OSNAk3PR25R5/5DKviNLvAjDqYhZ7
   Q==;
X-CSE-ConnectionGUID: ig/l74XhTtqcEyhCMZa3GQ==
X-CSE-MsgGUID: WwdYPOWfQJiLY58j5bOzoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38163496"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="38163496"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 07:22:49 -0700
X-CSE-ConnectionGUID: RbDiaOLMR92rQsCjXx81uw==
X-CSE-MsgGUID: 0VwTwishQ2irbhSAvn0C1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="80450819"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Oct 2024 07:22:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syB6r-0007xo-0l;
	Tue, 08 Oct 2024 14:22:45 +0000
Date: Tue, 8 Oct 2024 22:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 14593/22147]
 drivers/gpu/drm/img-rogue/1.17/mmu_common.c:400:25: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202410082208.2VqmTX79-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Luigi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 7b4b976d249b9ae5dbb9fa954bdcb09c4dde6dfd [14593/22147] CHROMIUM: drm/img-rogue: Add 1.17 IMG PowerVR Rogue driver
config: arm64-randconfig-r112-20241008 (https://download.01.org/0day-ci/archive/20241008/202410082208.2VqmTX79-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce: (https://download.01.org/0day-ci/archive/20241008/202410082208.2VqmTX79-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410082208.2VqmTX79-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/img-rogue/1.17/rgxhwperf_common.c:3410:15: warning: variable 'ui32TlPackets' set but not used [-Wunused-but-set-variable]
    3410 |         IMG_UINT32                      ui32TlPackets = 0;
         |                                         ^
   1 warning generated.
--
   In file included from drivers/gpu/drm/img-rogue/1.17/pvr_gputrace.c:45:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2222:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/img-rogue/1.17/pvr_gputrace.c:869:15: warning: variable 'ui32TlPackets' set but not used [-Wunused-but-set-variable]
     869 |         IMG_UINT32                      ui32TlPackets = 0;
         |                                         ^
>> drivers/gpu/drm/img-rogue/1.17/pvr_gputrace.c:870:15: warning: variable 'ui32HWPerfPackets' set but not used [-Wunused-but-set-variable]
     870 |         IMG_UINT32                      ui32HWPerfPackets = 0;
         |                                         ^
>> drivers/gpu/drm/img-rogue/1.17/pvr_gputrace.c:871:15: warning: variable 'ui32HWPerfPacketsSent' set but not used [-Wunused-but-set-variable]
     871 |         IMG_UINT32                      ui32HWPerfPacketsSent = 0;
         |                                         ^
   4 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/img-rogue/1.17/mmu_common.c:400:25: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/gpu/drm/img-rogue/1.17/pvrsrv.c:2675:36: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/img-rogue/1.17/pvrsrv.c:2710:14: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/gpu/drm/img-rogue/1.17/mem_utils.c:322:31: sparse: sparse: cannot dereference this type
--
>> drivers/gpu/drm/img-rogue/1.17/rgxfwutils.c:254:31: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +400 drivers/gpu/drm/img-rogue/1.17/mmu_common.c

   362	
   363	@Return         PVRSRV_OK if successful otherwise PVRSRV_ERROR_RETRY
   364	 */
   365	/*****************************************************************************/
   366	static PVRSRV_ERROR
   367	_CleanupThread_FreeMMUMapping(void* pvData)
   368	{
   369		PVRSRV_ERROR eError;
   370		MMU_CLEANUP_ITEM *psCleanup = (MMU_CLEANUP_ITEM *)pvData;
   371		MMU_CTX_CLEANUP_DATA *psMMUCtxCleanupData = psCleanup->psMMUCtxCleanupData;
   372		PVRSRV_DEVICE_NODE *psDevNode = psCleanup->psDevNode;
   373		IMG_BOOL bFreeNow;
   374		IMG_UINT32 uiSyncCurrent;
   375		IMG_UINT32 uiSyncReq;
   376	
   377		OSLockAcquire(psMMUCtxCleanupData->hCleanupLock);
   378	
   379		/* Don't attempt to free anything when the context has been destroyed.
   380		 * Especially don't access any device specific structures any more!*/
   381		if (!psMMUCtxCleanupData->bMMUContextExists)
   382		{
   383			OSFreeMem(psCleanup);
   384			PVR_GOTO_WITH_ERROR(eError, PVRSRV_OK, e0);
   385		}
   386	
   387		if (psCleanup->psSync == NULL)
   388		{
   389			/* Kick to invalidate the MMU caches and get sync info */
   390			eError = psDevNode->pfnMMUCacheInvalidateKick(psDevNode,
   391			                                     &psCleanup->uiRequiredSyncVal);
   392			if (eError != PVRSRV_OK)
   393			{
   394				OSLockRelease(psMMUCtxCleanupData->hCleanupLock);
   395				return PVRSRV_ERROR_RETRY;
   396			}
   397			psCleanup->psSync = psDevNode->psMMUCacheSyncPrim;
   398		}
   399	
 > 400		uiSyncCurrent = OSReadDeviceMem32(psCleanup->psSync->pui32LinAddr);
   401		uiSyncReq = psCleanup->uiRequiredSyncVal;
   402	
   403		/* Has the invalidate executed */
   404		bFreeNow = (uiSyncCurrent >= uiSyncReq) ?
   405				/* ... with the counter wrapped around ...
   406				 * There can't be 3*1024*1024 transactions completed, so consider wrapped */
   407				(((uiSyncCurrent - uiSyncReq) > 0xF0000000UL)? IMG_FALSE : IMG_TRUE):
   408				/* There can't be 3*1024*1024 transactions pending, so consider wrapped */
   409				(((uiSyncReq - uiSyncCurrent) > 0xF0000000UL)? IMG_TRUE : IMG_FALSE);
   410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
