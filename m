Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE257FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Dec 2023 00:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/WyL9hW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703551477; x=1735087477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b5uh0TAQuzUL2A0wuR6FJz+W7YT25hD/fZ1q6SW8PMU=;
  b=G/WyL9hWKUShAqN8RLHlAo+A+pw8P5lXP30eYjl8SNMfvhO1hqwpJoFX
   qLzdQgE0w4Sfgic+dvTY1t4o/xumgL515Jemc1NF3YK1FVtksD4BIgMGl
   6d6ZyJSCTgXM9DnSZ5DweZoxWGKSOCSQc5PXJlXMyXTPfYroCdIojh6Ku
   r9xdUIkqPTH6taIqtB6zh6Kjuqv93nS/ZT5JJibatJHbEhycdtWZHT9XR
   d2wPMe/hvg7v3XJniDX2s5w17QvRt8bGkE7HqGFh5lwEfy+XU5Nh3a3ZQ
   NIjOgaLjd1G/U/lXklEbSPKG4TdppCRoYQXjJcQT2Wbr06eE20xmkS43E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3393167"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="3393167"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 16:44:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="12310423"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Dec 2023 16:44:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHvYS-000Dot-2Y;
	Tue, 26 Dec 2023 00:44:20 +0000
Date: Tue, 26 Dec 2023 08:43:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 1/1]
 drivers/gpu/drm/img-rogue/1.17/physmem_osmem_linux.c:3441:15: warning:
 variable 'psPage' set but not used
Message-ID: <202312260855.z9xs4Jf5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   6ba69b380dc8c437f3432bf1121a23c9ab7753b9
commit: 6ba69b380dc8c437f3432bf1121a23c9ab7753b9 [1/1] CHROMIUM: img-rogue/1.17: Remove SPARSE_REMAP_MEM support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231226/202312260855.z9xs4Jf5-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312260855.z9xs4Jf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312260855.z9xs4Jf5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/img-rogue/1.17/physmem_osmem_linux.c:3441:15: warning: variable 'psPage' set but not used [-Wunused-but-set-variable]
    3441 |         struct page *psPage;
         |                      ^
>> drivers/gpu/drm/img-rogue/1.17/physmem_osmem_linux.c:3442:13: warning: variable 'psDMAPAddr' set but not used [-Wunused-but-set-variable]
    3442 |         dma_addr_t psDMAPAddr;
         |                    ^
>> drivers/gpu/drm/img-rogue/1.17/physmem_osmem_linux.c:3443:8: warning: variable 'pvDMAVAddr' set but not used [-Wunused-but-set-variable]
    3443 |         void *pvDMAVAddr;
         |               ^
   3 warnings generated.


vim +/psPage +3441 drivers/gpu/drm/img-rogue/1.17/physmem_osmem_linux.c

8850205ed245ca1 Luigi Santivetti 2022-05-06  3417  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3418  /*************************************************************************/ /*!
8850205ed245ca1 Luigi Santivetti 2022-05-06  3419  @Function       PMRChangeSparseMemOSMem
8850205ed245ca1 Luigi Santivetti 2022-05-06  3420  @Description    This function Changes the sparse mapping by allocating and
8850205ed245ca1 Luigi Santivetti 2022-05-06  3421                  freeing of pages. It changes the GPU and CPU maps accordingly.
8850205ed245ca1 Luigi Santivetti 2022-05-06  3422  @Return         PVRSRV_ERROR failure code
8850205ed245ca1 Luigi Santivetti 2022-05-06  3423  */ /**************************************************************************/
8850205ed245ca1 Luigi Santivetti 2022-05-06  3424  static PVRSRV_ERROR
8850205ed245ca1 Luigi Santivetti 2022-05-06  3425  PMRChangeSparseMemOSMem(PMR_IMPL_PRIVDATA pPriv,
8850205ed245ca1 Luigi Santivetti 2022-05-06  3426  						const PMR *psPMR,
8850205ed245ca1 Luigi Santivetti 2022-05-06  3427  						IMG_UINT32 ui32AllocPageCount,
8850205ed245ca1 Luigi Santivetti 2022-05-06  3428  						IMG_UINT32 *pai32AllocIndices,
8850205ed245ca1 Luigi Santivetti 2022-05-06  3429  						IMG_UINT32 ui32FreePageCount,
8850205ed245ca1 Luigi Santivetti 2022-05-06  3430  						IMG_UINT32 *pai32FreeIndices,
8850205ed245ca1 Luigi Santivetti 2022-05-06  3431  						IMG_UINT32 uiFlags)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3432  {
8850205ed245ca1 Luigi Santivetti 2022-05-06  3433  	PVRSRV_ERROR eError;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3434  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3435  	PMR_MAPPING_TABLE *psPMRMapTable = PMR_GetMappingTable(psPMR);
8850205ed245ca1 Luigi Santivetti 2022-05-06  3436  	PMR_OSPAGEARRAY_DATA *psPMRPageArrayData = (PMR_OSPAGEARRAY_DATA *)pPriv;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3437  	struct page **psPageArray = psPMRPageArrayData->pagearray;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3438  	void **psDMAVirtArray = psPMRPageArrayData->dmavirtarray;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3439  	dma_addr_t *psDMAPhysArray = psPMRPageArrayData->dmaphysarray;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3440  
8850205ed245ca1 Luigi Santivetti 2022-05-06 @3441  	struct page *psPage;
8850205ed245ca1 Luigi Santivetti 2022-05-06 @3442  	dma_addr_t psDMAPAddr;
8850205ed245ca1 Luigi Santivetti 2022-05-06 @3443  	void *pvDMAVAddr;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3444  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3445  	IMG_UINT32 ui32AdtnlAllocPages = 0; /*<! Number of pages to alloc from the OS */
8850205ed245ca1 Luigi Santivetti 2022-05-06  3446  	IMG_UINT32 ui32AdtnlFreePages = 0; /*<! Number of pages to free back to the OS */
8850205ed245ca1 Luigi Santivetti 2022-05-06  3447  	IMG_UINT32 ui32CommonRequestCount = 0; /*<! Number of pages to move position in the page array */
8850205ed245ca1 Luigi Santivetti 2022-05-06  3448  	IMG_UINT32 ui32Loop = 0;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3449  	IMG_UINT32 ui32Index = 0;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3450  	IMG_UINT32 uiAllocpgidx;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3451  	IMG_UINT32 uiFreepgidx;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3452  	IMG_UINT32 uiOrder = psPMRPageArrayData->uiLog2AllocPageSize - PAGE_SHIFT;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3453  	IMG_BOOL bCMA = BIT_ISSET(psPMRPageArrayData->ui32AllocFlags, FLAG_IS_CMA);
8850205ed245ca1 Luigi Santivetti 2022-05-06  3454  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3455  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3456  	/* Check SPARSE flags and calculate pages to allocate and free */
8850205ed245ca1 Luigi Santivetti 2022-05-06  3457  	if (SPARSE_RESIZE_BOTH == (uiFlags & SPARSE_RESIZE_BOTH))
8850205ed245ca1 Luigi Santivetti 2022-05-06  3458  	{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3459  		ui32CommonRequestCount = (ui32AllocPageCount > ui32FreePageCount) ?
8850205ed245ca1 Luigi Santivetti 2022-05-06  3460  				ui32FreePageCount : ui32AllocPageCount;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3461  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3462  		PDUMP_PANIC(PMR_DeviceNode(psPMR), SPARSEMEM_SWAP, "Request to swap alloc & free pages not supported");
8850205ed245ca1 Luigi Santivetti 2022-05-06  3463  	}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3464  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3465  	if (SPARSE_RESIZE_ALLOC == (uiFlags & SPARSE_RESIZE_ALLOC))
8850205ed245ca1 Luigi Santivetti 2022-05-06  3466  	{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3467  		ui32AdtnlAllocPages = ui32AllocPageCount - ui32CommonRequestCount;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3468  	}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3469  	else
8850205ed245ca1 Luigi Santivetti 2022-05-06  3470  	{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3471  		ui32AllocPageCount = 0;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3472  	}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3473  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3474  	if (SPARSE_RESIZE_FREE == (uiFlags & SPARSE_RESIZE_FREE))
8850205ed245ca1 Luigi Santivetti 2022-05-06  3475  	{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3476  		ui32AdtnlFreePages = ui32FreePageCount - ui32CommonRequestCount;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3477  	}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3478  	else
8850205ed245ca1 Luigi Santivetti 2022-05-06  3479  	{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3480  		ui32FreePageCount = 0;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3481  	}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3482  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3483  	if (0 == (ui32CommonRequestCount || ui32AdtnlAllocPages || ui32AdtnlFreePages))
8850205ed245ca1 Luigi Santivetti 2022-05-06  3484  	{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3485  		eError = PVRSRV_ERROR_INVALID_PARAMS;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3486  		PVR_DPF((PVR_DBG_ERROR,
8850205ed245ca1 Luigi Santivetti 2022-05-06  3487  		         "%s: Missing parameters for number of pages to alloc/free",
8850205ed245ca1 Luigi Santivetti 2022-05-06  3488  		         __func__));
8850205ed245ca1 Luigi Santivetti 2022-05-06  3489  		return eError;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3490  	}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3491  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3492  	/* The incoming request is classified into two operations independent of
8850205ed245ca1 Luigi Santivetti 2022-05-06  3493  	 * each other: alloc & free pages.
8850205ed245ca1 Luigi Santivetti 2022-05-06  3494  	 * These operations can be combined with two mapping operations as well
8850205ed245ca1 Luigi Santivetti 2022-05-06  3495  	 * which are GPU & CPU space mappings.
8850205ed245ca1 Luigi Santivetti 2022-05-06  3496  	 *
8850205ed245ca1 Luigi Santivetti 2022-05-06  3497  	 * From the alloc and free page requests, the net amount of pages to be
8850205ed245ca1 Luigi Santivetti 2022-05-06  3498  	 * allocated or freed is computed. Pages that were requested to be freed
8850205ed245ca1 Luigi Santivetti 2022-05-06  3499  	 * will be reused to fulfil alloc requests.
8850205ed245ca1 Luigi Santivetti 2022-05-06  3500  	 *
8850205ed245ca1 Luigi Santivetti 2022-05-06  3501  	 * The order of operations is:
8850205ed245ca1 Luigi Santivetti 2022-05-06  3502  	 * 1. Allocate new pages from the OS
8850205ed245ca1 Luigi Santivetti 2022-05-06  3503  	 * 2. Move the free pages from free request to alloc positions.
8850205ed245ca1 Luigi Santivetti 2022-05-06  3504  	 * 3. Free the rest of the pages not used for alloc
8850205ed245ca1 Luigi Santivetti 2022-05-06  3505  	 *
8850205ed245ca1 Luigi Santivetti 2022-05-06  3506  	 * Alloc parameters are validated at the time of allocation
8850205ed245ca1 Luigi Santivetti 2022-05-06  3507  	 * and any error will be handled then. */
8850205ed245ca1 Luigi Santivetti 2022-05-06  3508  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3509  	/* Validate the free indices */
8850205ed245ca1 Luigi Santivetti 2022-05-06  3510  	if (ui32FreePageCount)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3511  	{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3512  		if (NULL != pai32FreeIndices){
8850205ed245ca1 Luigi Santivetti 2022-05-06  3513  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3514  			for (ui32Loop = 0; ui32Loop < ui32FreePageCount; ui32Loop++)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3515  			{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3516  				uiFreepgidx = pai32FreeIndices[ui32Loop];
8850205ed245ca1 Luigi Santivetti 2022-05-06  3517  
de69e49ebde4221 Luigi Santivetti 2023-07-04  3518  				if (uiFreepgidx >= (psPMRPageArrayData->uiTotalNumOSPages >> uiOrder))
8850205ed245ca1 Luigi Santivetti 2022-05-06  3519  				{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3520  					eError = PVRSRV_ERROR_DEVICEMEM_OUT_OF_RANGE;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3521  					goto e0;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3522  				}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3523  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3524  				if (NULL == psPageArray[uiFreepgidx])
8850205ed245ca1 Luigi Santivetti 2022-05-06  3525  				{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3526  					eError = PVRSRV_ERROR_INVALID_PARAMS;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3527  					PVR_DPF((PVR_DBG_ERROR,
8850205ed245ca1 Luigi Santivetti 2022-05-06  3528  					         "%s: Trying to free non-allocated page",
8850205ed245ca1 Luigi Santivetti 2022-05-06  3529  					         __func__));
8850205ed245ca1 Luigi Santivetti 2022-05-06  3530  					goto e0;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3531  				}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3532  			}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3533  		}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3534  		else
8850205ed245ca1 Luigi Santivetti 2022-05-06  3535  		{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3536  			eError = PVRSRV_ERROR_INVALID_PARAMS;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3537  			PVR_DPF((PVR_DBG_ERROR,
8850205ed245ca1 Luigi Santivetti 2022-05-06  3538  			         "%s: Given non-zero free count but missing indices array",
8850205ed245ca1 Luigi Santivetti 2022-05-06  3539  			         __func__));
8850205ed245ca1 Luigi Santivetti 2022-05-06  3540  			return eError;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3541  		}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3542  	}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3543  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3544  	/* Validate the alloc indices */
8850205ed245ca1 Luigi Santivetti 2022-05-06  3545  	for (ui32Loop = ui32AdtnlAllocPages; ui32Loop < ui32AllocPageCount; ui32Loop++)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3546  	{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3547  		uiAllocpgidx = pai32AllocIndices[ui32Loop];
8850205ed245ca1 Luigi Santivetti 2022-05-06  3548  
de69e49ebde4221 Luigi Santivetti 2023-07-04  3549  		if (uiAllocpgidx >= (psPMRPageArrayData->uiTotalNumOSPages >> uiOrder))
8850205ed245ca1 Luigi Santivetti 2022-05-06  3550  		{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3551  			eError = PVRSRV_ERROR_DEVICEMEM_OUT_OF_RANGE;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3552  			goto e0;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3553  		}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3554  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3555  		if ((NULL != psPageArray[uiAllocpgidx]) ||
8850205ed245ca1 Luigi Santivetti 2022-05-06  3556  		    (TRANSLATION_INVALID != psPMRMapTable->aui32Translation[uiAllocpgidx]))
8850205ed245ca1 Luigi Santivetti 2022-05-06  3557  		{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3558  			eError = PVRSRV_ERROR_INVALID_PARAMS;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3559  			PVR_DPF((PVR_DBG_ERROR,
8850205ed245ca1 Luigi Santivetti 2022-05-06  3560  			         "%s: Trying to allocate already allocated page again",
8850205ed245ca1 Luigi Santivetti 2022-05-06  3561  			         __func__));
8850205ed245ca1 Luigi Santivetti 2022-05-06  3562  			goto e0;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3563  		}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3564  	}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3565  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3566  	ui32Loop = 0;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3567  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3568  	/* Allocate new pages from the OS */
8850205ed245ca1 Luigi Santivetti 2022-05-06  3569  	if (0 != ui32AdtnlAllocPages)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3570  	{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3571  			eError = _AllocOSPages(psPMRPageArrayData, pai32AllocIndices, ui32AdtnlAllocPages);
8850205ed245ca1 Luigi Santivetti 2022-05-06  3572  			if (PVRSRV_OK != eError)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3573  			{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3574  				PVR_DPF((PVR_DBG_MESSAGE,
8850205ed245ca1 Luigi Santivetti 2022-05-06  3575  				         "%s: New Addtl Allocation of pages failed",
8850205ed245ca1 Luigi Santivetti 2022-05-06  3576  				         __func__));
8850205ed245ca1 Luigi Santivetti 2022-05-06  3577  				goto e0;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3578  			}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3579  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3580  			psPMRMapTable->ui32NumPhysChunks += ui32AdtnlAllocPages;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3581  			/*Mark the corresponding pages of translation table as valid */
8850205ed245ca1 Luigi Santivetti 2022-05-06  3582  			for (ui32Loop = 0; ui32Loop < ui32AdtnlAllocPages; ui32Loop++)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3583  			{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3584  				psPMRMapTable->aui32Translation[pai32AllocIndices[ui32Loop]] = pai32AllocIndices[ui32Loop];
8850205ed245ca1 Luigi Santivetti 2022-05-06  3585  			}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3586  	}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3587  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3588  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3589  	ui32Index = ui32Loop;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3590  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3591  	/* Move the corresponding free pages to alloc request */
8850205ed245ca1 Luigi Santivetti 2022-05-06  3592  	for (ui32Loop = 0; ui32Loop < ui32CommonRequestCount; ui32Loop++, ui32Index++)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3593  	{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3594  		uiAllocpgidx = pai32AllocIndices[ui32Index];
8850205ed245ca1 Luigi Santivetti 2022-05-06  3595  		uiFreepgidx  = pai32FreeIndices[ui32Loop];
8850205ed245ca1 Luigi Santivetti 2022-05-06  3596  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3597  		psPage = psPageArray[uiAllocpgidx];
8850205ed245ca1 Luigi Santivetti 2022-05-06  3598  		psPageArray[uiAllocpgidx] = psPageArray[uiFreepgidx];
8850205ed245ca1 Luigi Santivetti 2022-05-06  3599  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3600  		if (bCMA)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3601  		{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3602  			pvDMAVAddr = psDMAVirtArray[uiAllocpgidx];
8850205ed245ca1 Luigi Santivetti 2022-05-06  3603  			psDMAPAddr = psDMAPhysArray[uiAllocpgidx];
8850205ed245ca1 Luigi Santivetti 2022-05-06  3604  			psDMAVirtArray[uiAllocpgidx] = psDMAVirtArray[uiFreepgidx];
8850205ed245ca1 Luigi Santivetti 2022-05-06  3605  			psDMAPhysArray[uiAllocpgidx] = psDMAPhysArray[uiFreepgidx];
8850205ed245ca1 Luigi Santivetti 2022-05-06  3606  		}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3607  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3608  		psPMRMapTable->aui32Translation[uiFreepgidx] = TRANSLATION_INVALID;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3609  		psPMRMapTable->aui32Translation[uiAllocpgidx] = uiAllocpgidx;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3610  		psPageArray[uiFreepgidx] = NULL;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3611  		if (bCMA)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3612  		{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3613  			psDMAVirtArray[uiFreepgidx] = NULL;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3614  			psDMAPhysArray[uiFreepgidx] = (dma_addr_t)0;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3615  		}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3616  	}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3617  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3618  	/* Free the additional free pages */
8850205ed245ca1 Luigi Santivetti 2022-05-06  3619  	if (0 != ui32AdtnlFreePages)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3620  	{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3621  		eError = _FreeOSPages(psPMRPageArrayData,
8850205ed245ca1 Luigi Santivetti 2022-05-06  3622  		                      &pai32FreeIndices[ui32Loop],
8850205ed245ca1 Luigi Santivetti 2022-05-06  3623  		                      ui32AdtnlFreePages);
8850205ed245ca1 Luigi Santivetti 2022-05-06  3624  		if (eError != PVRSRV_OK)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3625  		{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3626  			goto e0;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3627  		}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3628  		psPMRMapTable->ui32NumPhysChunks -= ui32AdtnlFreePages;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3629  		while (ui32Loop < ui32FreePageCount)
8850205ed245ca1 Luigi Santivetti 2022-05-06  3630  		{
8850205ed245ca1 Luigi Santivetti 2022-05-06  3631  			psPMRMapTable->aui32Translation[pai32FreeIndices[ui32Loop]] = TRANSLATION_INVALID;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3632  			ui32Loop++;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3633  		}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3634  	}
8850205ed245ca1 Luigi Santivetti 2022-05-06  3635  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3636  	eError = PVRSRV_OK;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3637  
8850205ed245ca1 Luigi Santivetti 2022-05-06  3638  e0:
8850205ed245ca1 Luigi Santivetti 2022-05-06  3639  	return eError;
8850205ed245ca1 Luigi Santivetti 2022-05-06  3640  }
8850205ed245ca1 Luigi Santivetti 2022-05-06  3641  

:::::: The code at line 3441 was first introduced by commit
:::::: 8850205ed245ca137b35c47068d0075962176416 CHROMIUM: drm/img-rogue: Add 1.17 IMG PowerVR Rogue driver

:::::: TO: Luigi Santivetti <luigi.santivetti@imagination.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
