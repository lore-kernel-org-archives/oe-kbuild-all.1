Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB56518626
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 20:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695932250; x=1727468250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S1wO/TN52BMziRSAG8SPs2hOpxox3BBLHMaD0htA2rM=;
  b=YL0sXPBOqQzNoyD/1doWV/jn7dCFnSqJdEv/SitZYT2LDesZ8+bjqFNj
   LmGJvjHSzZ83gVpV8YATQSrVJiwYiGSfO1gmoPHx6C7ns/BlNzgDtu8CZ
   IDujqS5wmseC6j2drMbLoZo9hAwHAXWftS8YLwoEvEyo9dpYHOBkrP7oq
   vxpVCv2tdV6a4Q+KcSh/Hfiko85NAi0stDeIDztr337rtuWl4gShnMTgg
   bDCv7HrZ32fgE/VYgLFqxp3T0JZx0CbTsC9w0Xl3rKGXzrQSJo/8ioTrI
   1JgHpSSD9jndUDwKNnmbZ8wgTfZnwTH0XZJOPunVPJtz/DIJvUFx63t6e
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="381051849"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="381051849"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 13:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="893166484"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="893166484"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2023 13:16:17 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlxRt-0001u1-2x;
	Thu, 28 Sep 2023 20:17:25 +0000
Date: Fri, 29 Sep 2023 04:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 25/30]
 arch/x86/kernel/cpu/microcode/core.c:434:12: warning:
 'ucode_load_cpus_stopped' defined but not used
Message-ID: <202309290450.F3SHBp5L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/microcode
head:   0168d5c24d9566114647bf6377e65c52c2325e3c
commit: 4d9a488a84f0eebe598bd655b9d3c3ceceb1acff [25/30] x86/microcode: Rendezvous and load in NMI
config: i386-randconfig-014-20230929 (https://download.01.org/0day-ci/archive/20230929/202309290450.F3SHBp5L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290450.F3SHBp5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290450.F3SHBp5L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c: In function 'load_late_stop_cpus':
   arch/x86/kernel/cpu/microcode/core.c:467:33: error: 'load_cpus_stopped' undeclared (first use in this function); did you mean 'ucode_load_cpus_stopped'?
     467 |         stop_machine_cpuslocked(load_cpus_stopped, NULL, cpu_online_mask);
         |                                 ^~~~~~~~~~~~~~~~~
         |                                 ucode_load_cpus_stopped
   arch/x86/kernel/cpu/microcode/core.c:467:33: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/cpu/microcode/core.c: At top level:
>> arch/x86/kernel/cpu/microcode/core.c:434:12: warning: 'ucode_load_cpus_stopped' defined but not used [-Wunused-function]
     434 | static int ucode_load_cpus_stopped(void *unused)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/ucode_load_cpus_stopped +434 arch/x86/kernel/cpu/microcode/core.c

   433	
 > 434	static int ucode_load_cpus_stopped(void *unused)
   435	{
   436		if (microcode_ops->use_nmi) {
   437			/* Enable the NMI handler and raise NMI */
   438			this_cpu_write(ucode_ctrl.nmi_enabled, true);
   439			apic->send_IPI(smp_processor_id(), NMI_VECTOR);
   440		} else {
   441			/* Just invoke the handler directly */
   442			microcode_update_handler();
   443		}
   444		return 0;
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
