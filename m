Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085033C37
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691511048; x=1723047048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iFztZEtYgn356T1tRTvcUP1GiMDeZVydhG4O5cQd660=;
  b=X7M8KRQyZXRwmLcKGrtLj+wtidLQesNegAtkQydEMoFfAyL55WjtO+w0
   iaQ50lLhuOVQN6lF8VMAzEtGmAqyErK76avnYt3QDV/LARBst2FgUC//3
   hjGQPixOFBmvpzbp0ecbKH5zmbRd1SCVGrdA1r6sBCNLofQs/I5WxD2Yd
   qLNe42Xcwdn+sC5NP9JuWAlG1YMbRrsjsYzS88Z0X+VX3ODQdWjr/QouP
   uBOetRfWuaSb6eoA+VfXmUHUJItGOGpbJ4l96Vs7/oo3SX+g9IFB3Ttqt
   bRQPXq6Qac3hmSn9r4yHPz0m+/ba4qJGOObYEx2NCY+O0cbNxdp26xThg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437201341"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="437201341"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 09:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681298799"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="681298799"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 09:09:04 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTPGa-0005S8-0I;
	Tue, 08 Aug 2023 16:09:04 +0000
Date: Wed, 9 Aug 2023 00:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Moeller <jon.moeller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 4442/30000]
 drivers/platform/x86/sepdk/pax/pax.c:749:18: sparse: sparse: cast removes
 address space '<asn:1>' of expression
Message-ID: <202308090041.vAnICjXI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7f46da99d47faba52b98b09371755ba4821a116d
commit: fadb19e08fbf603c6b11d9c45dbf33accdd58016 [4442/30000] platform/x86: add sep and socwatch drivers without socperf.
config: x86_64-randconfig-r071-20230807 (https://download.01.org/0day-ci/archive/20230809/202308090041.vAnICjXI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090041.vAnICjXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090041.vAnICjXI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/sepdk/pax/pax.c:749:18: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/platform/x86/sepdk/pax/pax.c:751:18: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/platform/x86/sepdk/pax/pax.c:82:11: warning: 'nmi_watchdog_restore' defined but not used [-Wunused-variable]
      82 | static S8 nmi_watchdog_restore = '0';
         |           ^~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/sepdk/pax/pax.o: warning: objtool: pax_Load()+0x44: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/pax/pax.o: warning: objtool: pax_Unreserve()+0x196: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/pax/pax.o: warning: objtool: pax_Unload()+0x16: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/pax/pax.o: warning: objtool: pax_Service_IOCTL.constprop.0()+0x24a: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/pax/pax.o: warning: objtool: pax_Load.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/pax/pax.o: warning: objtool: pax_Unreserve.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/pax/pax.o: warning: objtool: pax_Unload.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/pax/pax.o: warning: objtool: pax_Service_IOCTL.constprop.0.cold()+0x0: call without frame pointer save/setup
--
   drivers/platform/x86/sepdk/sep/lwpmudrv.c: note: in included file (through drivers/platform/x86/sepdk/sep/../inc/apic.h):
   /usr/lib/gcc/x86_64-linux-gnu/12/include/stddef.h:415:9: sparse: sparse: preprocessor token offsetof redefined
   drivers/platform/x86/sepdk/sep/lwpmudrv.c: note: in included file (through include/uapi/linux/posix_types.h, include/uapi/linux/types.h, include/linux/types.h, ...):
   include/linux/stddef.h:17:9: sparse: this was the original definition
>> drivers/platform/x86/sepdk/sep/lwpmudrv.c:6726:18: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/platform/x86/sepdk/sep/lwpmudrv.c:6728:18: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Trigger_Read_Op()+0xc5: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Switch_To_Next_Group()+0x455: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Switch_Group()+0x257: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Samp_Write_PCI_Config()+0x7b: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Read_Counters_And_Switch_Group()+0xde: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Read_And_Reset_Counters()+0xde: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Uncore_Switch_Group.isra.0()+0x39b: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmu_Service_IOCTL.constprop.0()+0x148f: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmu_Load()+0x9e: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmu_Unload()+0x6b: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Trigger_Read_Op.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Switch_To_Next_Group.cold()+0x4: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Switch_Group.cold()+0x3: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Samp_Write_PCI_Config.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Read_Counters_And_Switch_Group.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Read_And_Reset_Counters.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmudrv_Uncore_Switch_Group.isra.0.cold()+0xa: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmu_Service_IOCTL.constprop.0.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmu_Load.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/lwpmudrv.o: warning: objtool: lwpmu_Unload.cold()+0x0: call without frame pointer save/setup
--
   drivers/platform/x86/sepdk/sep/linuxos.c: note: in included file (through drivers/platform/x86/sepdk/sep/../inc/apic.h):
   /usr/lib/gcc/x86_64-linux-gnu/12/include/stddef.h:415:9: sparse: sparse: preprocessor token offsetof redefined
   drivers/platform/x86/sepdk/sep/linuxos.c: note: in included file (through include/uapi/linux/posix_types.h, include/uapi/linux/types.h, include/linux/types.h, ...):
   include/linux/stddef.h:17:9: sparse: this was the original definition
>> drivers/platform/x86/sepdk/sep/linuxos.c:246:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct path const * @@     got struct path [noderef] <asn:4> * @@
   drivers/platform/x86/sepdk/sep/linuxos.c:246:26: sparse:     expected struct path const *
   drivers/platform/x86/sepdk/sep/linuxos.c:246:26: sparse:     got struct path [noderef] <asn:4> *
>> drivers/platform/x86/sepdk/sep/linuxos.c:431:36: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/platform/x86/sepdk/sep/linuxos.c:504:44: sparse: sparse: cast removes address space '<asn:1>' of expression
>> drivers/platform/x86/sepdk/sep/linuxos.c:448:33: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/sepdk/sep/linuxos.c:909:48: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/sepdk/sep/linuxos.c:858:11: sparse: sparse: context imbalance in 'LINUXOS_Enum_Process_Modules' - different lock contexts for basic block
   drivers/platform/x86/sepdk/sep/linuxos.c:1462:25: sparse: sparse: context imbalance in 'LINUXOS_Check_KVM_Guest_Process' - different lock contexts for basic block
   drivers/platform/x86/sepdk/sep/linuxos.o: warning: objtool: record_pebs_process_info()+0x174: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/linuxos.o: warning: objtool: linuxos_Load_Image_Notify_Routine.constprop.0.isra.0()+0x1be: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/linuxos.o: warning: objtool: linuxos_Exit_Task_Notify()+0x1be: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/linuxos.o: warning: objtool: linuxos_Exec_Unmap_Notify()+0x172: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/linuxos.o: warning: objtool: record_pebs_process_info.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/linuxos.o: warning: objtool: linuxos_Load_Image_Notify_Routine.constprop.0.isra.0.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/linuxos.o: warning: objtool: linuxos_Exit_Task_Notify.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/linuxos.o: warning: objtool: linuxos_Exec_Unmap_Notify.cold()+0x0: call without frame pointer save/setup
--
>> drivers/platform/x86/sepdk/sep/pci.c:365:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/platform/x86/sepdk/sep/pci.c:417:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/platform/x86/sepdk/sep/pci.c:462:16: sparse: sparse: cast removes address space '<asn:2>' of expression
--
>> drivers/platform/x86/sepdk/sep/pebs.c:89:50: sparse: sparse: Using plain integer as NULL pointer
   drivers/platform/x86/sepdk/sep/pebs.c: In function 'PEBS_Flush_Buffer':
   drivers/platform/x86/sepdk/sep/pebs.c:978:13: warning: variable 'cur_grp' set but not used [-Wunused-but-set-variable]
     978 |         U32 cur_grp;
         |             ^~~~~~~
   drivers/platform/x86/sepdk/sep/pebs.o: warning: objtool: pebs_Get_Num_Records_Filled()+0x17f: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/pebs.o: warning: objtool: PEBS_Fill_Buffer()+0x4c9: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/pebs.o: warning: objtool: PEBS_Flush_Buffer()+0x4b2: sibling call from callable instruction with modified stack frame
   drivers/platform/x86/sepdk/sep/pebs.o: warning: objtool: pebs_Get_Num_Records_Filled.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/pebs.o: warning: objtool: PEBS_Fill_Buffer.cold()+0x0: call without frame pointer save/setup
   drivers/platform/x86/sepdk/sep/pebs.o: warning: objtool: PEBS_Flush_Buffer.cold()+0x0: call without frame pointer save/setup
--
>> drivers/platform/x86/sepdk/sep/chap.c:78:39: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/platform/x86/sepdk/sep/chap.c:90:39: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/platform/x86/sepdk/sep/chap.c:103:39: sparse: sparse: cast removes address space '<asn:2>' of expression

vim +749 drivers/platform/x86/sepdk/pax/pax.c

   727	
   728	#if defined(CONFIG_COMPAT) && defined(DRV_EM64T)
   729	static IOCTL_OP_TYPE pax_Device_Control_Compat(struct file *filp,
   730						       unsigned int cmd,
   731						       unsigned long arg)
   732	{
   733		int status = OS_SUCCESS;
   734		IOCTL_COMPAT_ARGS_NODE local_args_compat;
   735		IOCTL_ARGS_NODE local_args;
   736	
   737		memset(&local_args_compat, 0, sizeof(IOCTL_COMPAT_ARGS_NODE));
   738		if (arg) {
   739			status = copy_from_user(&local_args_compat,
   740						(void __user *)arg,
   741						sizeof(IOCTL_COMPAT_ARGS_NODE));
   742			if (status != OS_SUCCESS)
   743				return status;
   744		}
   745	
   746		local_args.len_drv_to_usr = local_args_compat.len_drv_to_usr;
   747		local_args.len_usr_to_drv = local_args_compat.len_usr_to_drv;
   748		local_args.buf_drv_to_usr =
 > 749			(char *)compat_ptr(local_args_compat.buf_drv_to_usr);
   750		local_args.buf_usr_to_drv =
   751			(char *)compat_ptr(local_args_compat.buf_usr_to_drv);
   752	
   753		if (cmd == PAX_IOCTL_COMPAT_INFO) {
   754			cmd = PAX_IOCTL_INFO;
   755		}
   756		local_args.command = cmd;
   757	
   758		status = pax_Service_IOCTL(filp, cmd, local_args);
   759	
   760		return status;
   761	}
   762	#endif
   763	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
