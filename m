Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C182EDB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 17:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694020906; x=1725556906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S4WYH1VV4mS5Nrjk2hgHqkf5JLmrYlizSPfs3Likeeg=;
  b=gyjq4k9+tL761jQbM5Q51diqp5GuaITZT8u4W2gMYSzF4/rwFtR3I/n4
   UYdf8lpq0V53OnRI2kSZUAjZxs0lZsZGL5nt1GjLTDKCFIcFRjLBF6fx5
   dX9AZ6xh5suHcNebIG+8GZ0h6Ndux/9MJCIeArkgf7uGOaUxg83HnZZiV
   UAy3ALY81Wm8UUQJ7YgXGt0YvamZvOuc5L4eVJYeV2PA5yVkLk0bbiGCF
   jGiup3/AZqyF4tEBDNJ4OwFgoL90EOLDrtT4XKYhPnZy2LVXpwcaPawS9
   4nVlaAT5JAraez//WfX91M0YAg/H/TMRo2B+arH8CYY6uxodICHxwqSWb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="441109672"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="441109672"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741640222"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="741640222"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Sep 2023 10:21:42 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdwDk-0000R9-0C;
	Wed, 06 Sep 2023 17:21:40 +0000
Date: Thu, 7 Sep 2023 01:20:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Duan, YayongX" <yayongx.duan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Emmanuel Berthier <emmanuel.berthier@intel.com>
Subject: [intel-lts:4.19/android_s 3767/30000] arch/x86/kernel/smp.c:190:16:
 warning: no previous prototype for 'smp_reboot_interrupt'
Message-ID: <202309070115.AtCRqhWf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi YayongX,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   6bfae51123c09ed71d82cfc739c5ccbeac60c4aa
commit: cd7b77710e3d52d58e97881a7c6ba82586573ba9 [3767/30000] Debug: Add register dump
config: i386-randconfig-005-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070115.AtCRqhWf-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070115.AtCRqhWf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070115.AtCRqhWf-lkp@intel.com/

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
