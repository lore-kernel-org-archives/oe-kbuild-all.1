Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4935F7E761
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 19:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710271042; cv=none; b=DV0cicfwt/fXkK7qZdX7H3iDJGbH++emDDQbiQ8uVxuTVKYY1cxvfCCmSfR7pFRFWwrzhNxg6Yr3qmpXQ2SQTLlwERDxO1tVvoY/NjSR1vPIX0QOBjTQPoZ8IywJvZZLjvY1wHaXE4CZ17Yx2AQYJYRyFvJ+OR7mjHIM4zlFEr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710271042; c=relaxed/simple;
	bh=P2XokTdChZAf4BOlwFDwi/rjCu/oDnXbERyW49yZ/A0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AI6i7nQ27rZbNvV42w60FUiFajEE4U1P0qN/plDjn5Rdqt81ayMz1n4P7n7AZ1GAf0WfevAEOAgwDaQY4arEBZFL6UBIFPeG05sQH7M6hIbkPn+OWDBU6r27IxB9zNwTRA4uZ2G4crulviaUxUMW2fS5Syrj2Uq8HKq+8daE0K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0FzPp2a; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0FzPp2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710271041; x=1741807041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P2XokTdChZAf4BOlwFDwi/rjCu/oDnXbERyW49yZ/A0=;
  b=k0FzPp2a5NNenrJa0/OKjjbTOhm44A7uINCv7xh4ki++o5PEiVRkZbM8
   e2Uk6M/VRmuLkdJQxAH5h+IFenSX0CGI6kGsHoN79B8cL7UTZ2abiJk4o
   gwcdiujmyO7GuqBaLi1EMRZ9yY9510obQ1WgH+W8WT8soBwkiqwte5TMp
   EdPvgrxX4iIWdrmjIdTH4TITDeDjZjfCYC2XrjW+c4mY8Qa9FiM4jRVrM
   hhs9IHKkSw7AipFXsXDTnH5KCugG9vDaKvZnnvp07l1fXi37J3zdnBbS6
   DPizUniIM6RobIhb4b1TTXZg72VtZDWywc1xGNnNYesHESgUZ1HGstL2N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16144062"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16144062"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 12:17:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16242006"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2024 12:17:18 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk7ch-000BbN-2u;
	Tue, 12 Mar 2024 19:17:15 +0000
Date: Wed, 13 Mar 2024 03:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13427/21850]
 kernel/watchdog_hld.c:123:13: error: implicit declaration of function
 'is_hardlockup'
Message-ID: <202403130340.177twYMV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c38cc0a3be12e5c70b9a2a015cbee44014a52518
commit: 818ac22d9d2f02632b39ef1a4f472e6dbe0d417a [13427/21850] sdei_watchdog: fix compile error when CONFIG_HARDLOCKUP_DETECTOR is not set
config: arm64-randconfig-001-20240312 (https://download.01.org/0day-ci/archive/20240313/202403130340.177twYMV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403130340.177twYMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403130340.177twYMV-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/watchdog_hld.c: In function 'watchdog_hardlockup_check':
>> kernel/watchdog_hld.c:123:13: error: implicit declaration of function 'is_hardlockup' [-Werror=implicit-function-declaration]
     123 |         if (is_hardlockup()) {
         |             ^~~~~~~~~~~~~
>> kernel/watchdog_hld.c:142:21: error: 'sysctl_hardlockup_all_cpu_backtrace' undeclared (first use in this function)
     142 |                 if (sysctl_hardlockup_all_cpu_backtrace &&
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/watchdog_hld.c:142:21: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
--
   arch/arm64/kernel/watchdog_sdei.c: In function 'watchdog_nmi_enable':
>> arch/arm64/kernel/watchdog_sdei.c:38:42: error: 'watchdog_thresh' undeclared (first use in this function); did you mean 'proc_watchdog_thresh'?
      38 |         sdei_api_set_secure_timer_period(watchdog_thresh);
         |                                          ^~~~~~~~~~~~~~~
         |                                          proc_watchdog_thresh
   arch/arm64/kernel/watchdog_sdei.c:38:42: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kernel/watchdog_sdei.c: In function 'watchdog_nmi_probe':
   arch/arm64/kernel/watchdog_sdei.c:119:46: error: 'watchdog_thresh' undeclared (first use in this function); did you mean 'proc_watchdog_thresh'?
     119 |         if (sdei_api_set_secure_timer_period(watchdog_thresh)) {
         |                                              ^~~~~~~~~~~~~~~
         |                                              proc_watchdog_thresh

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]


vim +/is_hardlockup +123 kernel/watchdog_hld.c

7edaeb6841dfb2 Thomas Gleixner 2017-08-15  106  
b8163908982cff Xiongfeng Wang  2019-01-28  107  void watchdog_hardlockup_check(struct pt_regs *regs)
73ce0511c43686 Babu Moger      2016-12-14  108  {
73ce0511c43686 Babu Moger      2016-12-14  109  	if (__this_cpu_read(watchdog_nmi_touch) == true) {
73ce0511c43686 Babu Moger      2016-12-14  110  		__this_cpu_write(watchdog_nmi_touch, false);
73ce0511c43686 Babu Moger      2016-12-14  111  		return;
73ce0511c43686 Babu Moger      2016-12-14  112  	}
73ce0511c43686 Babu Moger      2016-12-14  113  
7edaeb6841dfb2 Thomas Gleixner 2017-08-15  114  	if (!watchdog_check_timestamp())
7edaeb6841dfb2 Thomas Gleixner 2017-08-15  115  		return;
7edaeb6841dfb2 Thomas Gleixner 2017-08-15  116  
73ce0511c43686 Babu Moger      2016-12-14  117  	/* check for a hardlockup
73ce0511c43686 Babu Moger      2016-12-14  118  	 * This is done by making sure our timer interrupt
73ce0511c43686 Babu Moger      2016-12-14  119  	 * is incrementing.  The timer interrupt should have
73ce0511c43686 Babu Moger      2016-12-14  120  	 * fired multiple times before we overflow'd.  If it hasn't
73ce0511c43686 Babu Moger      2016-12-14  121  	 * then this is a good indication the cpu is stuck
73ce0511c43686 Babu Moger      2016-12-14  122  	 */
73ce0511c43686 Babu Moger      2016-12-14 @123  	if (is_hardlockup()) {
73ce0511c43686 Babu Moger      2016-12-14  124  		int this_cpu = smp_processor_id();
73ce0511c43686 Babu Moger      2016-12-14  125  
73ce0511c43686 Babu Moger      2016-12-14  126  		/* only print hardlockups once */
73ce0511c43686 Babu Moger      2016-12-14  127  		if (__this_cpu_read(hard_watchdog_warn) == true)
73ce0511c43686 Babu Moger      2016-12-14  128  			return;
73ce0511c43686 Babu Moger      2016-12-14  129  
73ce0511c43686 Babu Moger      2016-12-14  130  		pr_emerg("Watchdog detected hard LOCKUP on cpu %d", this_cpu);
73ce0511c43686 Babu Moger      2016-12-14  131  		print_modules();
73ce0511c43686 Babu Moger      2016-12-14  132  		print_irqtrace_events(current);
73ce0511c43686 Babu Moger      2016-12-14  133  		if (regs)
73ce0511c43686 Babu Moger      2016-12-14  134  			show_regs(regs);
73ce0511c43686 Babu Moger      2016-12-14  135  		else
73ce0511c43686 Babu Moger      2016-12-14  136  			dump_stack();
73ce0511c43686 Babu Moger      2016-12-14  137  
73ce0511c43686 Babu Moger      2016-12-14  138  		/*
73ce0511c43686 Babu Moger      2016-12-14  139  		 * Perform all-CPU dump only once to avoid multiple hardlockups
73ce0511c43686 Babu Moger      2016-12-14  140  		 * generating interleaving traces
73ce0511c43686 Babu Moger      2016-12-14  141  		 */
73ce0511c43686 Babu Moger      2016-12-14 @142  		if (sysctl_hardlockup_all_cpu_backtrace &&
73ce0511c43686 Babu Moger      2016-12-14  143  				!test_and_set_bit(0, &hardlockup_allcpu_dumped))
73ce0511c43686 Babu Moger      2016-12-14  144  			trigger_allbutself_cpu_backtrace();
73ce0511c43686 Babu Moger      2016-12-14  145  
73ce0511c43686 Babu Moger      2016-12-14  146  		if (hardlockup_panic)
73ce0511c43686 Babu Moger      2016-12-14  147  			nmi_panic(regs, "Hard LOCKUP");
73ce0511c43686 Babu Moger      2016-12-14  148  
73ce0511c43686 Babu Moger      2016-12-14  149  		__this_cpu_write(hard_watchdog_warn, true);
73ce0511c43686 Babu Moger      2016-12-14  150  		return;
73ce0511c43686 Babu Moger      2016-12-14  151  	}
73ce0511c43686 Babu Moger      2016-12-14  152  
73ce0511c43686 Babu Moger      2016-12-14  153  	__this_cpu_write(hard_watchdog_warn, false);
73ce0511c43686 Babu Moger      2016-12-14  154  	return;
73ce0511c43686 Babu Moger      2016-12-14  155  }
6c19c0e5140a24 Xiongfeng Wang  2019-04-20  156  NOKPROBE_SYMBOL(watchdog_hardlockup_check);
73ce0511c43686 Babu Moger      2016-12-14  157  

:::::: The code at line 123 was first introduced by commit
:::::: 73ce0511c43686095efd2f65ef564aab952e07bc kernel/watchdog.c: move hardlockup detector to separate file

:::::: TO: Babu Moger <babu.moger@oracle.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
