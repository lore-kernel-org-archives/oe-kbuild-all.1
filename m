Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BA011713
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lx4QEV8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699691405; x=1731227405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wAacF7ez7X//qi/xaufim87bfbjIZ8rWV86MsoQrQT4=;
  b=Lx4QEV8s0sUd3VWRZniMXF5Ep9KIKWPbRmW/R/cXuS9n+lSipwzYXUCq
   x7p7GGdXnAGWlh0HD3cAixlabWB8T6BKefjBQkpCBfC/RVF1wO1+GYvKw
   2k3beA+0IiAGCq6OA7lX4KlYfviO/0M9F50RnaTdE13YJC2YP/PjPBYNj
   UM5IMyJoGTm0lB/Zz3DCOr7dZdxos+7OEBHtrGRcs48Nh/hBInYAX2RMn
   nVhS5uUVeRz1iFhEPPG6eCY+tjo29drSToakSUX9p/oPSaD86CE6pAXcJ
   2EOcgbFFKQWIgMXrMQC335EQrHVWOU6hq2k+bkxyLRBgo1CJbNTAi658N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394167766"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="394167766"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 00:30:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763914531"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="763914531"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Nov 2023 00:30:02 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1jNP-000AKQ-2e;
	Sat, 11 Nov 2023 08:29:59 +0000
Date: Sat, 11 Nov 2023 16:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Moeller <jon.moeller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3914/30000]
 drivers/platform/x86/sepdk/pax/pax.c:749:18: sparse: sparse: cast removes
 address space '<asn:1>' of expression
Message-ID: <202311111600.QZndUYjU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: fadb19e08fbf603c6b11d9c45dbf33accdd58016 [3914/30000] platform/x86: add sep and socwatch drivers without socperf.
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231111/202311111600.QZndUYjU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111600.QZndUYjU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111600.QZndUYjU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/sepdk/pax/pax.c:749:18: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/platform/x86/sepdk/pax/pax.c:751:18: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/platform/x86/sepdk/pax/pax.c:82:11: warning: 'nmi_watchdog_restore' defined but not used [-Wunused-variable]
      82 | static S8 nmi_watchdog_restore = '0';
         |           ^~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/sepdk/sep/lwpmudrv.c: note: in included file (through drivers/platform/x86/sepdk/sep/../inc/apic.h):
   /usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h:406:9: sparse: sparse: preprocessor token offsetof redefined
   drivers/platform/x86/sepdk/sep/lwpmudrv.c: note: in included file (through include/uapi/linux/posix_types.h, include/uapi/linux/types.h, include/linux/types.h, ...):
   include/linux/stddef.h:17:9: sparse: this was the original definition
>> drivers/platform/x86/sepdk/sep/lwpmudrv.c:6726:18: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/platform/x86/sepdk/sep/lwpmudrv.c:6728:18: sparse: sparse: cast removes address space '<asn:1>' of expression
--
   drivers/platform/x86/sepdk/sep/linuxos.c: note: in included file (through drivers/platform/x86/sepdk/sep/../inc/apic.h):
   /usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h:406:9: sparse: sparse: preprocessor token offsetof redefined
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
