Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8599F250E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 23:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKUAajzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697326800; x=1728862800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nt0CRiqAJw4bWAciaVQFljxrIIhX8ezO5BDHKCggINU=;
  b=XKUAajzsZU9ftjzsOqjfj27PxON/NyPcL6zNIN+lPEfO2Q7JmTUtSHgN
   GCHqqXNIzi2GPJzsDU1iYdsBYE52xpXAze0AYwEzGSzhg8YNLllZJA8hU
   zw5+yJ2zjgRbIVTicxaUM/deCsvw3dK/J+wiNRc187aL/+XhRQ535mtG2
   C1XadyCBh/M69J3hf1hxzQj4sZqPUF26FOhctxqtwiFuetkqPedz3/4rV
   gj7HxktO9gSQHyyf01WMFhM6mkINoCn24nD0XcB2W7x+/erDzRJfr3DFp
   2XIAs5DwtFixJAGpykBZ90ly1j3NH61chto39y5IJEFf2fL+hhSDtEYS6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385193594"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="385193594"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 16:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1086598530"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="1086598530"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2023 16:39:58 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qroEe-0006oF-0F;
	Sat, 14 Oct 2023 23:39:56 +0000
Date: Sun, 15 Oct 2023 07:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 22/24]
 drivers/gpu/drm/img-rogue/1.17/devicemem_server.c:783:26: warning: variable
 'sLastReserveAddr' set but not used
Message-ID: <202310150734.Aw5tYBPo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   e495935040e9178d313071a88dc9e7116aa0761a
commit: 0fc1ca18e2bf3022db1e16cebcccfafd84750c70 [22/24] CHROMIUM: img-rogue/1.17: improve validation in VA mapping calls
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231015/202310150734.Aw5tYBPo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150734.Aw5tYBPo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150734.Aw5tYBPo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/img-rogue/1.17/devicemem_server.c: In function 'ReserveRangeParamValidation':
>> drivers/gpu/drm/img-rogue/1.17/devicemem_server.c:783:26: warning: variable 'sLastReserveAddr' set but not used [-Wunused-but-set-variable]
     783 |         IMG_DEV_VIRTADDR sLastReserveAddr;
         |                          ^~~~~~~~~~~~~~~~


vim +/sLastReserveAddr +783 drivers/gpu/drm/img-rogue/1.17/devicemem_server.c

   778	
   779	static INLINE PVRSRV_ERROR ReserveRangeParamValidation(DEVMEMINT_HEAP *psDevmemHeap,
   780	                                                       IMG_DEV_VIRTADDR sAllocationDevVAddr,
   781	                                                       IMG_DEVMEM_SIZE_T uiAllocationSize)
   782	{
 > 783		IMG_DEV_VIRTADDR sLastReserveAddr;
   784		IMG_UINT64 ui64InvalidSizeMask = (1 << psDevmemHeap->uiLog2PageSize) - 1;
   785	
   786		PVR_LOG_RETURN_IF_INVALID_PARAM(psDevmemHeap != NULL, "psDevmemHeap");
   787	
   788		sLastReserveAddr.uiAddr = sAllocationDevVAddr.uiAddr + uiAllocationSize - 1;
   789	
   790		/* Check that the requested address is not less than the base address of the heap. */
   791		if (sAllocationDevVAddr.uiAddr < psDevmemHeap->sBaseAddr.uiAddr)
   792		{
   793			PVR_LOG_VA(PVR_DBG_ERROR,
   794				"sAllocationDevVAddr ("IMG_DEV_VIRTADDR_FMTSPEC") is invalid! "
   795				"Must be greater or equal to "IMG_DEV_VIRTADDR_FMTSPEC,
   796				sAllocationDevVAddr.uiAddr,
   797				psDevmemHeap->sBaseAddr.uiAddr);
   798			return PVRSRV_ERROR_INVALID_PARAMS;
   799		}
   800	
   801		/* Check the allocation size is valid (must be page granular). */
   802		if ((uiAllocationSize & ui64InvalidSizeMask) != 0 || uiAllocationSize == 0)
   803		{
   804			PVR_LOG_VA(PVR_DBG_ERROR,
   805				"uiAllocationSize ("IMG_DEVMEM_SIZE_FMTSPEC") is invalid! Must a multiple of %u and greater than 0",
   806				uiAllocationSize,
   807				1 << psDevmemHeap->uiLog2PageSize);
   808			return PVRSRV_ERROR_INVALID_PARAMS;
   809		}
   810	
   811		return PVRSRV_OK;
   812	}
   813	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
