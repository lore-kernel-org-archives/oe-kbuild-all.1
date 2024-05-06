Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A2A22075
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 02:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714963518; cv=none; b=lyJYaBOlTTBrDCiNKolRJD1iAXIvwYOMP2JlNvMmM6I8Lw6H7J3yG3n7hDhhlOEZFVbEgAby5b6bjkPB8Zs2yvGoLymeF0QFXrdJPwLwf26WXn6cQQ2O73mKoWc4G9R9X3EvIjn4rUwucsUQU29aYnVQLTlYRfuAZ7xlcpmUEQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714963518; c=relaxed/simple;
	bh=YARDsxdIG9pu3IzUG+1tEJK/2Guk/52MihZC9LdVtIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UX7HIheCKOB0Zpr9CTjiB/kSnvwHkPXh0JNwk1zEangD77RVUlRuUDaI8rMgz6b+6SnLopBm+TWRp7gVmBh0d2rlPFBGrhXJV3z4yxCpdFUiPv6PX6rLTu/TdZuj84rKiP8HuK3p2zZN/PPZVSLUv0FTXHpIJkiTkhiD0ZRet8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aw2Eq2uk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aw2Eq2uk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714963517; x=1746499517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YARDsxdIG9pu3IzUG+1tEJK/2Guk/52MihZC9LdVtIQ=;
  b=aw2Eq2ukx1Av4IfRelB11622OplpSYIE4jMNWy5yXCvvYx4BDu1Ba46n
   O2qRCUi9Eh5zPp6JDRxGry/s2hXER7xpQ0bXkidHybKavS27a22IW+dYv
   PdRygFVBsFKCYNFAPHsF9jMf/dB3EOjEqoXBPmoXuKCWOrbZ7fkeEcqFk
   cKsAb5kSC7xC7z4mTenr7tc+CwIXCXtaxMJXLtOuE5lD3DNpB0/d0fvl0
   8wj3zYwoQyKyLLcHsLGGjsRRo8uglp6tIDMKUT0+aeIswGMc0/lXqaSAU
   R9X5UdW2lZxHiReIiLjNiVfvAMqry+qSWwsh9HRb0nCIP8NjYa5m5bmc0
   g==;
X-CSE-ConnectionGUID: 83KfbhqNQ46S7SEPjLc0aQ==
X-CSE-MsgGUID: pCTvypTWRZ+UfyKLZ/7cNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="13637360"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="13637360"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 19:45:12 -0700
X-CSE-ConnectionGUID: dl8oMxbwQnCmoeO6kPMY5g==
X-CSE-MsgGUID: tGAm22EpT++K1IyWSLn0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28090983"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 May 2024 19:45:08 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3oLh-0000Ou-3A;
	Mon, 06 May 2024 02:45:05 +0000
Date: Mon, 6 May 2024 10:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3448/30000]
 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:166:1: warning: no previous
 prototype for '_ClearPendingIntr'
Message-ID: <202405061058.C1JNWJAt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   411c52448fdc0906f70c4585c7e05359c0b05c11
commit: fbd36e3778470a8c7bd0cf8ba0ecb4369451dbc7 [3448/30000] MGS-6351 [#ccc] 0090-CL368499-KERNEL-SPACE-234062-add-a-function-of-recvo
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240506/202405061058.C1JNWJAt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405061058.C1JNWJAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405061058.C1JNWJAt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/arm/mm: No such file or directory [-Wmissing-include-dirs]
>> drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:166:1: warning: no previous prototype for '_ClearPendingIntr' [-Wmissing-prototypes]
     166 | _ClearPendingIntr(
         | ^~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:208:1: warning: no previous prototype for '_MonitorTimerFunction' [-Wmissing-prototypes]
     208 | _MonitorTimerFunction(
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:391:1: warning: no previous prototype for '_DumpDriverConfigure' [-Wmissing-prototypes]
     391 | _DumpDriverConfigure(
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:406:1: warning: no previous prototype for '_DumpState' [-Wmissing-prototypes]
     406 | _DumpState(
         | ^~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:458:1: warning: no previous prototype for '_SetRecovery' [-Wmissing-prototypes]
     458 | _SetRecovery(
         | ^~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:1489:1: warning: no previous prototype for '_AllocateLinearMemory' [-Wmissing-prototypes]
    1489 | _AllocateLinearMemory(
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:1612:1: warning: no previous prototype for '_ReleaseVideoMemory' [-Wmissing-prototypes]
    1612 | _ReleaseVideoMemory(
         | ^~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:2130:1: warning: no previous prototype for '_SetVidMemMetadata' [-Wmissing-prototypes]
    2130 | _SetVidMemMetadata(
         | ^~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:2302:1: warning: no previous prototype for 'gckKERNEL_ConfigPowerManagement' [-Wmissing-prototypes]
    2302 | gckKERNEL_ConfigPowerManagement(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5243:1: warning: no previous prototype for '_ListDel' [-Wmissing-prototypes]
    5243 | _ListDel(
         | ^~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5627:1: warning: no previous prototype for 'gckDEVICE_ChipInfo' [-Wmissing-prototypes]
    5627 | gckDEVICE_ChipInfo(
         | ^~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5649:1: warning: no previous prototype for 'gckDEVICE_Version' [-Wmissing-prototypes]
    5649 | gckDEVICE_Version(
         | ^~~~~~~~~~~~~~~~~


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
