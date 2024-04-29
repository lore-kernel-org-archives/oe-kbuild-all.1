Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F9D12B73
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 19:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714418349; cv=none; b=cENzjXqXui8nsuqZe4CC0WUSG1f/BrIeWafJMNaaN6UCUvraIMSHOXNigBi9unyUd0m12B/6fn7vaoCNUxBsvj3uC+PfxlnUuBV6L9NgwWDprQ9dJkiamaiiaiuynvGbcGsi+CxWrhkpy4pKVAdrYDsdwUaClOSHdiL2tF66v24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714418349; c=relaxed/simple;
	bh=/Tb039jr8aDO9PFI2AaXXfoNocSWVHPGFZbldxF8is4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ie1nCVOnIFWdMTxippk5S2cNPsEMOW7gRJt3pz2iHkfT0T9VZRTFS6RQgdFl4/CTaZT3yoQdt0HHYQS1ke1NV1GZ6603UrAIN/Ul/fvzxGN0T329N6OGmLX2RjOHYlTK6QtTa09wbii05+hypGk7w2Io5GOQwgi+eQZH8AdkDpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9pfq/WX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9pfq/WX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714418347; x=1745954347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Tb039jr8aDO9PFI2AaXXfoNocSWVHPGFZbldxF8is4=;
  b=n9pfq/WX8fKFpIuEwVEk1Gt9KVJuP+BbfScico4wck7yIRL/d64gE3eM
   +aTJP2dd6IpsxaAcWV+KgynCK/GuR1AKpb+d8vylD9iPM7/YHlDDwmHVR
   HD2CEVa8syOqUNJ9Nfnoimjt1xQo9KsjpPIQIJlmv+gyCGIQ2aczwJTCU
   FDQdGg+FMxtvFbpiAm9OS8FA0uQtGR7eLzOtZBdsne9uMC9YXeDZ4ROdc
   Dkl+7LDWiH55Z0L1idadYTAA5aJXZnxSUxeEb1A8XxSz/XiYQ11c2aJe6
   vloOQ/rg4kzViNqDiTvmoZXUcgJ38tY8Dym6IsAXMc2WTJMXfUUQuxceV
   Q==;
X-CSE-ConnectionGUID: sDEH9reETJyje4yp6HPxZQ==
X-CSE-MsgGUID: nz/2CRU2QBKN9u8bNms5ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20783730"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="20783730"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 12:18:57 -0700
X-CSE-ConnectionGUID: T6oQCfE4Tlm+xiIMLp4MQQ==
X-CSE-MsgGUID: Ge6ISWG+Q+uiRnz3Wvpncw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="26080549"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2024 12:18:56 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1WWb-0007O4-2M;
	Mon, 29 Apr 2024 19:18:53 +0000
Date: Tue, 30 Apr 2024 03:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3533/29983]
 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5714:19: warning: variable
 'coreList' set but not used
Message-ID: <202404300339.HgbCZhUb-lkp@intel.com>
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
commit: c8e5adb6a3946c83c3cdcdeea528e4a0d42f901c [3533/29983] LF-4373-2 [#ccc] fix 6qp opencl cts kernel panic
config: arm64-randconfig-003-20240429 (https://download.01.org/0day-ci/archive/20240430/202404300339.HgbCZhUb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300339.HgbCZhUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300339.HgbCZhUb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:166:1: warning: no previous prototype for function '_ClearPendingIntr' [-Wmissing-prototypes]
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
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5246:1: warning: no previous prototype for function '_ListDel' [-Wmissing-prototypes]
    5246 | _ListDel(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5245 | void
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5630:1: warning: no previous prototype for function 'gckDEVICE_ChipInfo' [-Wmissing-prototypes]
    5630 | gckDEVICE_ChipInfo(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5629:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5629 | gceSTATUS
         | ^
         | static 
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5652:1: warning: no previous prototype for function 'gckDEVICE_Version' [-Wmissing-prototypes]
    5652 | gckDEVICE_Version(
         | ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5651:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5651 | gceSTATUS
         | ^
         | static 
>> drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c:5714:19: warning: variable 'coreList' set but not used [-Wunused-but-set-variable]
    5714 |     gcsCORE_LIST *coreList;
         |                   ^
   14 warnings generated.


vim +/coreList +5714 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel.c

3dcab85234f3a47 Xianzhong 2019-01-29  5703  
3dcab85234f3a47 Xianzhong 2019-01-29  5704  static gceSTATUS
3dcab85234f3a47 Xianzhong 2019-01-29  5705  gckDEVICE_SetTimeOut(
3dcab85234f3a47 Xianzhong 2019-01-29  5706      IN gckDEVICE Device,
3dcab85234f3a47 Xianzhong 2019-01-29  5707      IN gcsHAL_INTERFACE_PTR Interface
3dcab85234f3a47 Xianzhong 2019-01-29  5708      )
3dcab85234f3a47 Xianzhong 2019-01-29  5709  {
3dcab85234f3a47 Xianzhong 2019-01-29  5710  #if gcdGPU_TIMEOUT
3dcab85234f3a47 Xianzhong 2019-01-29  5711      gckKERNEL kernel;
3dcab85234f3a47 Xianzhong 2019-01-29  5712      gctUINT i;
3dcab85234f3a47 Xianzhong 2019-01-29  5713      gceHARDWARE_TYPE type = Interface->hardwareType;
3dcab85234f3a47 Xianzhong 2019-01-29 @5714      gcsCORE_LIST *coreList;
5e8b5d1ec54ff5b Xianzhong 2019-10-18  5715      gctUINT32 processID = 0;
a612476cb33f7f3 Ella Feng 2019-12-05  5716      gcsCORE_INFO *info = Device->coreInfoArray;
a612476cb33f7f3 Ella Feng 2019-12-05  5717  
a612476cb33f7f3 Ella Feng 2019-12-05  5718      coreList = &Device->map[type];
5e8b5d1ec54ff5b Xianzhong 2019-10-18  5719  
5e8b5d1ec54ff5b Xianzhong 2019-10-18  5720      /* Get the current process ID. */
5e8b5d1ec54ff5b Xianzhong 2019-10-18  5721      gckOS_GetProcessID(&processID);
3dcab85234f3a47 Xianzhong 2019-01-29  5722  
a612476cb33f7f3 Ella Feng 2019-12-05  5723      for (i = 0; i < Device->coreNum; i++)
a612476cb33f7f3 Ella Feng 2019-12-05  5724      {
a612476cb33f7f3 Ella Feng 2019-12-05  5725          if (type == gcvHARDWARE_3D || type == gcvHARDWARE_3D2D || type == gcvHARDWARE_VIP)
a612476cb33f7f3 Ella Feng 2019-12-05  5726          {
a612476cb33f7f3 Ella Feng 2019-12-05  5727              kernel = info[i].kernel;
a612476cb33f7f3 Ella Feng 2019-12-05  5728          }
a612476cb33f7f3 Ella Feng 2019-12-05  5729          else
3dcab85234f3a47 Xianzhong 2019-01-29  5730          {
c8e5adb6a3946c8 Xianzhong 2021-09-23  5731              continue;
a612476cb33f7f3 Ella Feng 2019-12-05  5732          }
3dcab85234f3a47 Xianzhong 2019-01-29  5733  
3dcab85234f3a47 Xianzhong 2019-01-29  5734          kernel->timeOut = Interface->u.SetTimeOut.timeOut;
5e8b5d1ec54ff5b Xianzhong 2019-10-18  5735  
5e8b5d1ec54ff5b Xianzhong 2019-10-18  5736          kernel->timeoutPID = processID;
3dcab85234f3a47 Xianzhong 2019-01-29  5737      }
3dcab85234f3a47 Xianzhong 2019-01-29  5738  #endif
3dcab85234f3a47 Xianzhong 2019-01-29  5739  
3dcab85234f3a47 Xianzhong 2019-01-29  5740      return gcvSTATUS_OK;
3dcab85234f3a47 Xianzhong 2019-01-29  5741  }
3dcab85234f3a47 Xianzhong 2019-01-29  5742  

:::::: The code at line 5714 was first introduced by commit
:::::: 3dcab85234f3a4768e11d0fa9b18cfc9145c1131 MGS-4530-1 add 6.2.4.p4 gpu driver for L4.19

:::::: TO: Xianzhong <xianzhong.li@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
