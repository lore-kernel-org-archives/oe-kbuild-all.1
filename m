Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7A573535
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714407349; cv=none; b=BabGoWK1bpywm3FHXHBBFXsdTe7WsfoLT+hFX4fHzbOKL5pC2kDZn1rsD/KPTUSmpldA80XFiZJmWvty5GMqcxsQh7Qk5TsiUsd6vPUI1isGefzlG4Ql3Efb06AJ4WhH1WsEvRKqvrKdnQeEaOzo/2NaPeGUrEMzEWKbZ2D0AIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714407349; c=relaxed/simple;
	bh=Wyg4/nTc3xrLXkjBi02tFsbr/dCkep+/pLRP6xVlT4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tUJag+VOz4UkXShKYbw79/EFw5TY4KLwEfG1H5Qs6kg/RhU/ffG7/UF+pjK6U9SyB0GecrQZzndc9/l5fOVn4LSdDN7knnJlhfX7ogHYycDsrcEXrGavKzucJ3B5xxbSQeeUHQuG/W9f8BH5d36sNZHLLpfXpKlWaDvmeIi/hyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRuv6tu8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRuv6tu8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714407347; x=1745943347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wyg4/nTc3xrLXkjBi02tFsbr/dCkep+/pLRP6xVlT4w=;
  b=XRuv6tu8OHIUg3xKUCyATsku3jZTe3YIVW0u12G5hW/Xg586eAfBpoF1
   N4nLadCwRNJwMyQY+qyc85YZ0FYe2XjlROPJuFMl6I0OBrJjcd14pFHgJ
   giYFt6BAJLJACSvgFzPByU6rshHOXYXu/ke21+nPl2pEPUWlldqiBaDT+
   cFTOGSSSE4UlaNuqgxKsJcqL5sPg9wsMRqfWb/l3XmFOpW0iSVRyvrB0u
   L6CJkAEUt2RW6/zQJUHusco7G9eXPvCawJgC7Ypl5isvDTZ2rsPGCJu92
   bczNoytI8W9ZiHR5aBCBHeB//aMPQh05kr74VU9LamVQsaOFwINsYsQCA
   A==;
X-CSE-ConnectionGUID: /pbo/euJSJSqewerlGXuFw==
X-CSE-MsgGUID: c14aqCmSTymmQVN4ep2M8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="21229258"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="21229258"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 09:15:47 -0700
X-CSE-ConnectionGUID: 2aoDgUZ3RFiZN1rBAO4JGg==
X-CSE-MsgGUID: O2dgjXZETp6IArWCDZ3cLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="30978332"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Apr 2024 09:15:46 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1TfL-0007Hs-0o;
	Mon, 29 Apr 2024 16:15:43 +0000
Date: Tue, 30 Apr 2024 00:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3513/29983]
 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:166:1: warning: no previous
 prototype for function '_ClearPendingIntr'
Message-ID: <202404300041.TNpgWsXg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: fbd36e3778470a8c7bd0cf8ba0ecb4369451dbc7 [3513/29983] MGS-6351 [#ccc] 0090-CL368499-KERNEL-SPACE-234062-add-a-function-of-recvo
config: arm64-randconfig-003-20240429 (https://download.01.org/0day-ci/archive/20240430/202404300041.TNpgWsXg-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300041.TNpgWsXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300041.TNpgWsXg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:166:1: warning: no previous prototype for function '_ClearPendingIntr' [-Wmissing-prototypes]
     166 | _ClearPendingIntr(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:165:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     165 | gceSTATUS
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:208:1: warning: no previous prototype for function '_MonitorTimerFunction' [-Wmissing-prototypes]
     208 | _MonitorTimerFunction(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:207:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     207 | void
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:391:1: warning: no previous prototype for function '_DumpDriverConfigure' [-Wmissing-prototypes]
     391 | _DumpDriverConfigure(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:390:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     390 | void
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:406:1: warning: no previous prototype for function '_DumpState' [-Wmissing-prototypes]
     406 | _DumpState(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:405:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     405 | void
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:458:1: warning: no previous prototype for function '_SetRecovery' [-Wmissing-prototypes]
     458 | _SetRecovery(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:457:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     457 | gceSTATUS
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:1489:1: warning: no previous prototype for function '_AllocateLinearMemory' [-Wmissing-prototypes]
    1489 | _AllocateLinearMemory(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:1488:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1488 | gceSTATUS
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:1612:1: warning: no previous prototype for function '_ReleaseVideoMemory' [-Wmissing-prototypes]
    1612 | _ReleaseVideoMemory(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:1611:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1611 | gceSTATUS
         | ^
         | static 
   In file included from drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:2127:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1601:
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:2130:1: warning: no previous prototype for function '_SetVidMemMetadata' [-Wmissing-prototypes]
    2130 | _SetVidMemMetadata(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:2129:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2129 | gceSTATUS
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:2302:1: warning: no previous prototype for function 'gckKERNEL_ConfigPowerManagement' [-Wmissing-prototypes]
    2302 | gckKERNEL_ConfigPowerManagement(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:2301:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2301 | gceSTATUS
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5243:1: warning: no previous prototype for function '_ListDel' [-Wmissing-prototypes]
    5243 | _ListDel(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5242:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5242 | void
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5627:1: warning: no previous prototype for function 'gckDEVICE_ChipInfo' [-Wmissing-prototypes]
    5627 | gckDEVICE_ChipInfo(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5626:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5626 | gceSTATUS
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5649:1: warning: no previous prototype for function 'gckDEVICE_Version' [-Wmissing-prototypes]
    5649 | gckDEVICE_Version(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5648:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5648 | gceSTATUS
         | ^
         | static 
   13 warnings generated.


vim +/_ClearPendingIntr +166 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c

   162	
   163	#if gcdGPU_TIMEOUT && gcdINTERRUPT_STATISTIC
   164	#if gcdENABLE_RECOVERY_ALL_CORES
   165	gceSTATUS
 > 166	_ClearPendingIntr(
   167	    IN gckKERNEL Kernel
   168	    )
   169	{
   170	    gceSTATUS status;
   171	    gckEVENT eventObj;
   172	    gctUINT32 i = 0;
   173	    gcmkHEADER_ARG("Kernel=%p", Kernel);
   174	
   175	    /* Validate the arguemnts. */
   176	    gcmkVERIFY_OBJECT(Kernel, gcvOBJ_KERNEL);
   177	
   178	    /* Grab gckEVENT object. */
   179	    eventObj = Kernel->eventObj;
   180	    gcmkVERIFY_OBJECT(eventObj, gcvOBJ_EVENT);
   181	
   182	    gckOS_AcquireMutex(Kernel->os, Kernel->device->commitMutex, gcdRECOVERY_FORCE_TIMEOUT);
   183	
   184	    gcmkONERROR(gckOS_AtomSetMask(eventObj->pending, 0x1FFFFFFF));
   185	
   186	    gcmkONERROR(gckEVENT_Notify(eventObj, 1, gcvNULL));
   187	
   188	    for(i = 0; i < gcdCOMMAND_QUEUES; i++)
   189	    {
   190	        gckOS_Signal(Kernel->command->os, Kernel->command->queues[i].signal, gcvTRUE);
   191	    }
   192	
   193	    gcmkVERIFY_OK(gckOS_ReleaseMutex(Kernel->os, Kernel->device->commitMutex));
   194	
   195	    gcmkONERROR(gckCOMMAND_Stop(Kernel->command));
   196	
   197	    /* Success. */
   198	    gcmkFOOTER_NO();
   199	    return gcvSTATUS_OK;
   200	OnError:
   201	    /* Return the status. */
   202	    gcmkFOOTER();
   203	    return status;
   204	}
   205	#endif
   206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
