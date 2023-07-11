Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4848719BAB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 15:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689089649; x=1720625649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rudxotba5sNXesS174Mkn9rKJ6QVqo2TKMjotmBMv9c=;
  b=gTnf4YnbRqlwPuVBZyWujyRU5SJ9F8vnLRdVtWT6a9ZMprv6c8vZOzBz
   BGdzF9q4k33xT+qIo+XvX7AHFkNdNGJQD0YfBZQNkUiBV162qfz8+i+KA
   Vh9HHhTEkarhp5ob8RKLkMoBUbCN5YEbDiwP/+DmWNkST9mi92sa+efnH
   7gOS7E2jndPmPh0pAIbhI+ItbyxLGY3XnYIoSOjhMaKWEgygXP6nFUpGW
   C5IPD39U7rW3ARdaDzSCFiCEYgJux8f48vBZL5Fdo7v5gE/5zSTGbrKDH
   ICY1YvO15XItp0qBTr2eqQwFSeWIgepuFHToAxRi0Fq7ELFZIe+VdQhDA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="349459966"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="349459966"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 08:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="791243884"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="791243884"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2023 08:34:06 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJFNO-0004tn-0B;
	Tue, 11 Jul 2023 15:34:06 +0000
Date: Tue, 11 Jul 2023 23:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Duan, YayongX" <yayongx.duan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Emmanuel Berthier <emmanuel.berthier@intel.com>
Subject: [intel-lts:4.19/android_s 4300/30000] arch/x86/kernel/smp.c:190:16:
 warning: no previous prototype for 'smp_reboot_interrupt'
Message-ID: <202307112343.r6ccCyVc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   d86cf6f06c9415a617dd1a1e3c9dc081a3cf0f8f
commit: cd7b77710e3d52d58e97881a7c6ba82586573ba9 [4300/30000] Debug: Add register dump
config: i386-randconfig-i013-20230711 (https://download.01.org/0day-ci/archive/20230711/202307112343.r6ccCyVc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307112343.r6ccCyVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307112343.r6ccCyVc-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/x86/kernel/smp.c:190:16: warning: no previous prototype for 'smp_reboot_interrupt' [-Wmissing-prototypes]
     190 | __visible void smp_reboot_interrupt(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/smp.c:276:28: warning: no previous prototype for 'smp_reschedule_interrupt' [-Wmissing-prototypes]
     276 | __visible void __irq_entry smp_reschedule_interrupt(struct pt_regs *regs)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/smp.c:297:28: warning: no previous prototype for 'smp_call_function_interrupt' [-Wmissing-prototypes]
     297 | __visible void __irq_entry smp_call_function_interrupt(struct pt_regs *regs)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/smp.c:307:28: warning: no previous prototype for 'smp_call_function_single_interrupt' [-Wmissing-prototypes]
     307 | __visible void __irq_entry smp_call_function_single_interrupt(struct pt_regs *r)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/smp_reboot_interrupt +190 arch/x86/kernel/smp.c

   185	
   186	/*
   187	 * this function calls the 'stop' function on all other CPUs in the system.
   188	 */
   189	
 > 190	__visible void smp_reboot_interrupt(struct pt_regs *regs)
   191	{
   192		ipi_entering_ack_irq();
   193		store_regs(regs);
   194		cpu_emergency_vmxoff();
   195		stop_this_cpu(NULL);
   196		irq_exit();
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
