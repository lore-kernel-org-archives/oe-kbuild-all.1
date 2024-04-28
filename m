Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749228828
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 08:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714292785; cv=none; b=lwqDdE3lr6tHt8Phc3Tgk31/usY+xdDT08/3AiQPWAN+T+WrEH0ThxlvRPz0msz3j+3uFIn4Y3FaBbkjkCVQeI77sGiInTM/1RFZjFyXkQLQRYPNlpuiMZMxDqPY4GhTYnU8pBjOxXRrZctCoMIs97layIy+8mbRwH6LCuYkJDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714292785; c=relaxed/simple;
	bh=p6xJxN7yIBS1wjGotQox+97v/0CVKNlVqBTGLc092Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAL0TvHmkKGO0UmyTjzgbkYw/T+y/u4rzp18Euk8ynu6Rz5+KecLtFdVmSm47HDHoUDEG63YwYDMLWyyqdKhCnhw66plbZoI1EIb//AqOBEuwjZKuD8yC41+gPIRJqx/teZZ2ymMvbgVsFaYfiC39cahX5E0rJ5GXl3486YMyjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIJlsxe+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIJlsxe+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714292783; x=1745828783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6xJxN7yIBS1wjGotQox+97v/0CVKNlVqBTGLc092Zo=;
  b=nIJlsxe+oYvwIFondrwovC+baCVFcgQWKNlmrgZGQ6bjXa50Etp0pAup
   Lz0Zn0ugAhh7nC2wq1nYst6Fw9eR1RMx7DsfmBG5J87O2grjhjIeyzKMz
   Dh180UhznfWQPKVFQJXypZZTJ7MIRaZYCQVwt6p6oww/1yhGYOxig7qAK
   ZoPKluf4whM/8WoohxdpdwM4+ksai1WI3kqTzs/rixiOcMxbYs0LXtvOz
   OG6fLb3Ce4Vs6FZ/2wrl5qcdUCsf+0OvT8u7Q4R5AJhIEHoLyf0Kq3RbN
   XNRC9G/yJV64Ti//58dSPnIN/+PN/RxVr53FL9iRF9HIJ4NHHWIAKcPL9
   g==;
X-CSE-ConnectionGUID: rUMp27/GTWO1cHrz1odpzA==
X-CSE-MsgGUID: cQgzdbwVR9q/hjZwsTN/gQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9856397"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="9856397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 01:26:22 -0700
X-CSE-ConnectionGUID: zWxjJZqcTeKVwZ6zLyQHAg==
X-CSE-MsgGUID: rSFY4NouRKWTUDpmZpCT4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="30629901"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Apr 2024 01:26:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0zrW-00060k-2L;
	Sun, 28 Apr 2024 08:26:18 +0000
Date: Sun, 28 Apr 2024 16:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3029/11728]
 drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:5915:1: error:
 no previous prototype for 'gckHARDWARE_QchannelFlushCache'
Message-ID: <202404281645.OaIRa0K3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 0261ac262485b2eee04835954442de96a39163dd [3029/11728] Update to 6.4.11 gpu driver version.
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240428/202404281645.OaIRa0K3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281645.OaIRa0K3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281645.OaIRa0K3-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: error: arch/arm/mm: No such file or directory [-Werror=missing-include-dirs]
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: In function 'debugfs_printf':
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:93:25: error: function 'debugfs_printf' might be a candidate for 'gnu_printf' format attribute [-Werror=suggest-attribute=format]
      93 |     seq_vprintf((struct seq_file *)obj, fmt, args);
         |                         ^~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: At top level:
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:128:1: error: no previous prototype for 'gc_info_show' [-Werror=missing-prototypes]
     128 | gc_info_show(void *m, void *data)
         | ^~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:175:1: error: no previous prototype for 'gc_clients_show' [-Werror=missing-prototypes]
     175 | gc_clients_show(void *m, void *data)
         | ^~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:221:1: error: no previous prototype for 'gc_meminfo_show' [-Werror=missing-prototypes]
     221 | gc_meminfo_show(void *m, void *data)
         | ^~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:311:1: error: no previous prototype for 'gc_load_show' [-Werror=missing-prototypes]
     311 | gc_load_show(void *m, void *data)
         | ^~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: In function 'set_clk':
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1135:21: error: variable 'j' set but not used [-Werror=unused-but-set-variable]
    1135 |     gctINT       n, j, k;
         |                     ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: At top level:
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1301:1: error: no previous prototype for 'gc_info_show_debugfs' [-Werror=missing-prototypes]
    1301 | gc_info_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1307:1: error: no previous prototype for 'gc_clients_show_debugfs' [-Werror=missing-prototypes]
    1307 | gc_clients_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1313:1: error: no previous prototype for 'gc_meminfo_show_debugfs' [-Werror=missing-prototypes]
    1313 | gc_meminfo_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1319:1: error: no previous prototype for 'gc_idle_show_debugfs' [-Werror=missing-prototypes]
    1319 | gc_idle_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1325:1: error: no previous prototype for 'gc_db_old_show_debugfs' [-Werror=missing-prototypes]
    1325 | gc_db_old_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1331:1: error: no previous prototype for 'gc_db_show_debugfs' [-Werror=missing-prototypes]
    1331 | gc_db_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1337:1: error: no previous prototype for 'gc_version_show_debugfs' [-Werror=missing-prototypes]
    1337 | gc_version_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1343:1: error: no previous prototype for 'gc_vidmem_old_show_debugfs' [-Werror=missing-prototypes]
    1343 | gc_vidmem_old_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1349:1: error: no previous prototype for 'gc_vidmem_show_debugfs' [-Werror=missing-prototypes]
    1349 | gc_vidmem_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1355:1: error: no previous prototype for 'gc_dump_trigger_show_debugfs' [-Werror=missing-prototypes]
    1355 | gc_dump_trigger_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1361:1: error: no previous prototype for 'gc_clk_show_debugfs' [-Werror=missing-prototypes]
    1361 | gc_clk_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1367:1: error: no previous prototype for 'gc_poweroff_timeout_show_debugfs' [-Werror=missing-prototypes]
    1367 | gc_poweroff_timeout_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1382:1: error: no previous prototype for 'gc_load_show_debugfs' [-Werror=missing-prototypes]
    1382 | gc_load_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   cc1: error: arch/arm/mm: No such file or directory [-Werror=missing-include-dirs]
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:238:1: error: no previous prototype for '_AddressToIndex' [-Werror=missing-prototypes]
     238 | _AddressToIndex(IN gcsADDRESS_AREA_PTR Area, IN gctADDRESS Address)
         | ^~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:431:1: error: no previous prototype for '_GetMtlbFreeSpace' [-Werror=missing-prototypes]
     431 | _GetMtlbFreeSpace(IN gckMMU Mmu, IN gctUINT32 NumEntries,
         | ^~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c: In function 'gckMMU_FillFlatMappingWithPage16M':
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:532:20: error: variable 'sEnd' set but not used [-Werror=unused-but-set-variable]
     532 |     gctUINT32      sEnd   = (gctUINT32)((end & gcdMMU_STLB_16M_MASK) >> gcdMMU_STLB_16M_SHIFT);
         |                    ^~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c: In function 'gckMMU_FillFlatMappingWithPage1M':
>> drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:1161:30: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
    1161 |                 gcmkASSERT(0);
         |                              ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c: In function 'gckMMU_FillFlatMappingWithPage64K':
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:1469:30: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
    1469 |                 gcmkASSERT(0);
         |                              ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c: In function 'gckMMU_FillFlatMappingWithPage4K':
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:1779:30: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
    1779 |                 gcmkASSERT(0);
         |                              ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c: At top level:
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:2182:1: error: no previous prototype for '_GetPageCountOfUsedNode' [-Werror=missing-prototypes]
    2182 | _GetPageCountOfUsedNode(gctUINT32_PTR Node)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:2240:1: error: no previous prototype for '_Construct' [-Werror=missing-prototypes]
    2240 | _Construct(IN gckKERNEL Kernel, IN gctSIZE_T MmuSize, OUT gckMMU *Mmu)
         | ^~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:2743:1: error: no previous prototype for '_Destroy' [-Werror=missing-prototypes]
    2743 | _Destroy(IN gckMMU Mmu)
         | ^~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:2825:1: error: no previous prototype for '_AdjustIndex' [-Werror=missing-prototypes]
    2825 | _AdjustIndex(IN gckMMU Mmu, IN gctUINT32 Index, IN gctUINT32 PageCount,
         | ^~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:2924:1: error: no previous prototype for '_AllocatePages' [-Werror=missing-prototypes]
    2924 | _AllocatePages(IN gckMMU Mmu, IN gctSIZE_T PageCount, IN gceVIDMEM_TYPE Type,
         | ^~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:3139:1: error: no previous prototype for '_FreePages' [-Werror=missing-prototypes]
    3139 | _FreePages(IN gckMMU Mmu, IN gctBOOL Secure, IN gcePAGE_TYPE PageType,
         | ^~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:3456:1: error: no previous prototype for 'gckMMU_CheckSaftPage' [-Werror=missing-prototypes]
    3456 | gckMMU_CheckSaftPage(IN gckMMU Mmu)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:3472:1: error: no previous prototype for 'gckMMU_DumpAddressSpace' [-Werror=missing-prototypes]
    3472 | gckMMU_DumpAddressSpace(IN gckMMU Mmu)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   cc1: error: arch/arm/mm: No such file or directory [-Werror=missing-include-dirs]
>> drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:5915:1: error: no previous prototype for 'gckHARDWARE_QchannelFlushCache' [-Werror=missing-prototypes]
    5915 | gckHARDWARE_QchannelFlushCache(IN gckHARDWARE Hardware)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: In function 'gckHARDWARE_HandleFault':
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:8758:24: error: variable 'pageMask' set but not used [-Werror=unused-but-set-variable]
    8758 |         gctUINT32      pageMask;
         |                        ^~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: In function 'gckHARDWARE_CancelJob':
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:11168:15: error: variable 'globalAcquired' set but not used [-Werror=unused-but-set-variable]
   11168 |     gctBOOL   globalAcquired  = gcvFALSE;
         |               ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/gckHARDWARE_QchannelFlushCache +5915 drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c

  5913	
  5914	gceSTATUS
> 5915	gckHARDWARE_QchannelFlushCache(IN gckHARDWARE Hardware)
  5916	{
  5917	    gceSTATUS status    = gcvSTATUS_OK;
  5918	    gctBOOL   funcValid = gcvFALSE;
  5919	
  5920	    gcmkHEADER_ARG("Hardware=%p", Hardware);
  5921	
  5922	    gcmkVERIFY_ARGUMENT(Hardware != gcvNULL);
  5923	
  5924	    if (Hardware->clockState == gcvFALSE) {
  5925	        /* Turn on the GPU power. */
  5926	        gcmkONERROR(gckHARDWARE_QchannelPowerControl(Hardware, gcvTRUE, gcvTRUE));
  5927	
  5928	        /* Clock control, to ON state. */
  5929	        gcmkONERROR(_PmClockControl(Hardware, gcvPOWER_ON));
  5930	    }
  5931	
  5932	    gckFUNCTION_Validate(&Hardware->functions[gcvFUNCTION_EXECUTION_FLUSH],
  5933	                         &funcValid);
  5934	
  5935	    if (funcValid)
  5936	        gcmkONERROR(gckFUNCTION_Execute(&Hardware->functions[gcvFUNCTION_EXECUTION_FLUSH]));
  5937	
  5938	OnError:
  5939	    gcmkFOOTER();
  5940	
  5941	    return status;
  5942	}
  5943	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
