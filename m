Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3936CA71
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 03:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hj/AOyTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700279788; x=1731815788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZDmNPd+TdQmwS+NtGkNoI1dnPaFFjXc4ifC2Z2ACm+0=;
  b=Hj/AOyTlpVkyRdJl3BUXt8CsczcEhusys49tayJQYItrLTBDOj3Ym85I
   itHULqHdbV5J14jPENsj0CaPwTRZWgJ67pVJ3qzjOvKgxTZGuis362tkU
   SmWvT1HUL/z94jocKKnMqqvcu0ERR/jAGulH7pV1rZXXjtmaq1yTtKkHj
   o25FfV3ZMj5xzsozvjTC0m50Fm12thXtbx2H0ptGabx1xbXz6qAfKlCxJ
   5iGBv8nI6FRjhX7Ak6H5UD4OARVKYnfeyiTb+MXMGjnTeTVZKpGGq3s2s
   J5O0bcHQg9mL/abbOqHxgq3AvbO4LBYpz32CirOhl5VUwwTVTEBZfSuIl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4555515"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="4555515"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 19:56:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="939331044"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="939331044"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Nov 2023 19:56:26 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4CRT-0003VF-2a;
	Sat, 18 Nov 2023 03:56:23 +0000
Date: Sat, 18 Nov 2023 11:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3291/15770]
 drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:5915:1:
 warning: no previous prototype for 'gckHARDWARE_QchannelFlushCache'
Message-ID: <202311181120.m0xYxFfS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: 43b5d1d2e76fc7ad295029b12ae13904c242565a [3291/15770] Update to 6.4.11 gpu driver version.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231118/202311181120.m0xYxFfS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181120.m0xYxFfS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181120.m0xYxFfS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: In function 'debugfs_printf':
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:93:25: warning: function 'debugfs_printf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      93 |     seq_vprintf((struct seq_file *)obj, fmt, args);
         |                         ^~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: At top level:
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:128:1: warning: no previous prototype for 'gc_info_show' [-Wmissing-prototypes]
     128 | gc_info_show(void *m, void *data)
         | ^~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:175:1: warning: no previous prototype for 'gc_clients_show' [-Wmissing-prototypes]
     175 | gc_clients_show(void *m, void *data)
         | ^~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:221:1: warning: no previous prototype for 'gc_meminfo_show' [-Wmissing-prototypes]
     221 | gc_meminfo_show(void *m, void *data)
         | ^~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:311:1: warning: no previous prototype for 'gc_load_show' [-Wmissing-prototypes]
     311 | gc_load_show(void *m, void *data)
         | ^~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: In function 'set_clk':
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1135:21: warning: variable 'j' set but not used [-Wunused-but-set-variable]
    1135 |     gctINT       n, j, k;
         |                     ^
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c: At top level:
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1301:1: warning: no previous prototype for 'gc_info_show_debugfs' [-Wmissing-prototypes]
    1301 | gc_info_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1307:1: warning: no previous prototype for 'gc_clients_show_debugfs' [-Wmissing-prototypes]
    1307 | gc_clients_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1313:1: warning: no previous prototype for 'gc_meminfo_show_debugfs' [-Wmissing-prototypes]
    1313 | gc_meminfo_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1319:1: warning: no previous prototype for 'gc_idle_show_debugfs' [-Wmissing-prototypes]
    1319 | gc_idle_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1325:1: warning: no previous prototype for 'gc_db_old_show_debugfs' [-Wmissing-prototypes]
    1325 | gc_db_old_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1331:1: warning: no previous prototype for 'gc_db_show_debugfs' [-Wmissing-prototypes]
    1331 | gc_db_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1337:1: warning: no previous prototype for 'gc_version_show_debugfs' [-Wmissing-prototypes]
    1337 | gc_version_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1343:1: warning: no previous prototype for 'gc_vidmem_old_show_debugfs' [-Wmissing-prototypes]
    1343 | gc_vidmem_old_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1349:1: warning: no previous prototype for 'gc_vidmem_show_debugfs' [-Wmissing-prototypes]
    1349 | gc_vidmem_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1355:1: warning: no previous prototype for 'gc_dump_trigger_show_debugfs' [-Wmissing-prototypes]
    1355 | gc_dump_trigger_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1361:1: warning: no previous prototype for 'gc_clk_show_debugfs' [-Wmissing-prototypes]
    1361 | gc_clk_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1367:1: warning: no previous prototype for 'gc_poweroff_timeout_show_debugfs' [-Wmissing-prototypes]
    1367 | gc_poweroff_timeout_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_device.c:1382:1: warning: no previous prototype for 'gc_load_show_debugfs' [-Wmissing-prototypes]
    1382 | gc_load_show_debugfs(struct seq_file *m, void *data)
         | ^~~~~~~~~~~~~~~~~~~~
--
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_command.c: In function '_CommitEndOnce':
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_command.c:2521:20: warning: variable 'offset' set but not used [-Wunused-but-set-variable]
    2521 |     gctUINT32      offset = 0;
         |                    ^~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_command.c: At top level:
>> drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_command.c:2839:1: warning: no previous prototype for '_ValidCommandBuffer' [-Wmissing-prototypes]
    2839 | _ValidCommandBuffer(IN gckCOMMAND Command, IN gctUINT32 ProcessId,
         | ^~~~~~~~~~~~~~~~~~~
--
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:238:1: warning: no previous prototype for '_AddressToIndex' [-Wmissing-prototypes]
     238 | _AddressToIndex(IN gcsADDRESS_AREA_PTR Area, IN gctADDRESS Address)
         | ^~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:431:1: warning: no previous prototype for '_GetMtlbFreeSpace' [-Wmissing-prototypes]
     431 | _GetMtlbFreeSpace(IN gckMMU Mmu, IN gctUINT32 NumEntries,
         | ^~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c: In function 'gckMMU_FillFlatMappingWithPage16M':
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:532:20: warning: variable 'sEnd' set but not used [-Wunused-but-set-variable]
     532 |     gctUINT32      sEnd   = (gctUINT32)((end & gcdMMU_STLB_16M_MASK) >> gcdMMU_STLB_16M_SHIFT);
         |                    ^~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c: In function 'gckMMU_FillFlatMappingWithPage1M':
>> drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:1161:30: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1161 |                 gcmkASSERT(0);
         |                              ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c: In function 'gckMMU_FillFlatMappingWithPage64K':
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:1469:30: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1469 |                 gcmkASSERT(0);
         |                              ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c: In function 'gckMMU_FillFlatMappingWithPage4K':
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:1779:30: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1779 |                 gcmkASSERT(0);
         |                              ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c: At top level:
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:2182:1: warning: no previous prototype for '_GetPageCountOfUsedNode' [-Wmissing-prototypes]
    2182 | _GetPageCountOfUsedNode(gctUINT32_PTR Node)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:2240:1: warning: no previous prototype for '_Construct' [-Wmissing-prototypes]
    2240 | _Construct(IN gckKERNEL Kernel, IN gctSIZE_T MmuSize, OUT gckMMU *Mmu)
         | ^~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:2743:1: warning: no previous prototype for '_Destroy' [-Wmissing-prototypes]
    2743 | _Destroy(IN gckMMU Mmu)
         | ^~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:2825:1: warning: no previous prototype for '_AdjustIndex' [-Wmissing-prototypes]
    2825 | _AdjustIndex(IN gckMMU Mmu, IN gctUINT32 Index, IN gctUINT32 PageCount,
         | ^~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:2924:1: warning: no previous prototype for '_AllocatePages' [-Wmissing-prototypes]
    2924 | _AllocatePages(IN gckMMU Mmu, IN gctSIZE_T PageCount, IN gceVIDMEM_TYPE Type,
         | ^~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:3139:1: warning: no previous prototype for '_FreePages' [-Wmissing-prototypes]
    3139 | _FreePages(IN gckMMU Mmu, IN gctBOOL Secure, IN gcePAGE_TYPE PageType,
         | ^~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:3456:1: warning: no previous prototype for 'gckMMU_CheckSaftPage' [-Wmissing-prototypes]
    3456 | gckMMU_CheckSaftPage(IN gckMMU Mmu)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:3472:1: warning: no previous prototype for 'gckMMU_DumpAddressSpace' [-Wmissing-prototypes]
    3472 | gckMMU_DumpAddressSpace(IN gckMMU Mmu)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c: In function 'gckMMU_FillFlatMapping':
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:3709:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
    3709 |         if (flatSize >= gcdMMU_PAGE_16M_SIZE) {
         |            ^
   drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_mmu.c:3717:5: note: here
    3717 |     case gcvPAGE_TYPE_1M:
         |     ^~~~
--
>> drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:5915:1: warning: no previous prototype for 'gckHARDWARE_QchannelFlushCache' [-Wmissing-prototypes]
    5915 | gckHARDWARE_QchannelFlushCache(IN gckHARDWARE Hardware)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: In function 'gckHARDWARE_HandleFault':
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:8758:24: warning: variable 'pageMask' set but not used [-Wunused-but-set-variable]
    8758 |         gctUINT32      pageMask;
         |                        ^~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: In function 'gckHARDWARE_CancelJob':
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:11168:15: warning: variable 'globalAcquired' set but not used [-Wunused-but-set-variable]
   11168 |     gctBOOL   globalAcquired  = gcvFALSE;
         |               ^~~~~~~~~~~~~~
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: In function 'gckHARDWARE_SetPowerState':
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:6151:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
    6151 |         timeout = gcvTRUE;
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:6153:5: note: here
    6153 |     case gcvPOWER_OFF_BROADCAST:
         |     ^~~~
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: In function '_QchannelPowerOffDirection':
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:6039:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
    6039 |         if (State == gcvPOWER_IDLE) {
         |            ^
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:6045:5: note: here
    6045 |     case gcvPOWER_IDLE:
         |     ^~~~
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:6049:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
    6049 |         if (State == gcvPOWER_SUSPEND) {
         |            ^
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:6060:5: note: here
    6060 |     case gcvPOWER_SUSPEND:
         |     ^~~~
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: In function '_PmSetPowerOffDirection':
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:5769:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
    5769 |         if (State == gcvPOWER_IDLE) {
         |            ^
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:5775:5: note: here
    5775 |     case gcvPOWER_IDLE:
         |     ^~~~
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:5783:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
    5783 |         if (State == gcvPOWER_SUSPEND) {
         |            ^
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:5794:5: note: here
    5794 |     case gcvPOWER_SUSPEND:
         |     ^~~~
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: In function '_QchannelPowerOnDirection':
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:5969:21: warning: this statement may fall through [-Wimplicit-fallthrough=]
    5969 |         requireInit = gcvTRUE;
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:5972:5: note: here
    5972 |     case gcvPOWER_SUSPEND:
         |     ^~~~
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c: In function '_PmSetPowerOnDirection':
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:5696:21: warning: this statement may fall through [-Wimplicit-fallthrough=]
    5696 |         requireInit = gcvTRUE;
   drivers/mxc/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c:5699:5: note: here
    5699 |     case gcvPOWER_SUSPEND:
         |     ^~~~


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
