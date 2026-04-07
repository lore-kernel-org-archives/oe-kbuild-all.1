Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47BE3750C4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533948; cv=none; b=QoD9KVY7L0uSKCtGLFJ2bGyl/Ux7FAeLpQnHmIKxIACk5KnfI7TCSKT1cMb011SU04F7H7AEOFu7Ady8yb8knyYypTEVzW2Mwfae997LSCRaT1EeNji1RSIk0TgwDeLU1MDJJqeQm6PvJY3AOMxVN1CpfphcVTT0CUHSWz+aopM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533948; c=relaxed/simple;
	bh=u1jZBzigFKqdu8ZlpCGLrzlv+ulVYYpm1bahJbkG2V8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WHU7Vej6nybiLXSwWuWRQX5JXg1otujdHvRp1KyNjgYNa8o0Yk9GC9DnDwCsYPavVByy2IH4v1Tpx98Ov4JzUnYTA6mxMhzU8gBT8SL5mNUnLI3w7HifK3YzZnmu90cM0sAwUmW5NYACw5hvpAwqAApzI3OeSlmFM1uznJdUAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2/TTsEF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2/TTsEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533947; x=1807069947;
  h=date:from:to:cc:subject:message-id;
  bh=u1jZBzigFKqdu8ZlpCGLrzlv+ulVYYpm1bahJbkG2V8=;
  b=R2/TTsEF4fRQP2Bb3KeEOmDUk5DmZuKQwrUOatVLrVtdxZ0kVt5kIwal
   q6BZDmhYKT7D4GV5wY7UXENSBxjveYE7AOuDRzSJSzoYAnsqFPiczXFQ9
   eaZo/A1F9G2rxgtWLM/XlJypQ+uk8/UdTGGfSZ9528Hr6qDfg74hs3Hvo
   y32fKrSr9nWvb0ZR4xSXw2P70SDo2UPY70n2P95FepaWlvjVBcUTD96ZO
   JIrLSN21kWkjvYst8SOmZGviAkuQcucr5ZWvTaMd02sC6EMxZtyooe5Qo
   sP0Y2cQa49aft4fXG64PNjx5mGodyr7Hks36cDkpkHwgu1AqEhZDiPFE2
   w==;
X-CSE-ConnectionGUID: nI6FquiJR2mBUQF+wu+YhA==
X-CSE-MsgGUID: 7ka6h56TSWSbw4Xu5bbebw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781497"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781497"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:52:23 -0700
X-CSE-ConnectionGUID: 325w6f2wRECUDRASOdLHBQ==
X-CSE-MsgGUID: zsIciu1aTlyvMygmmYXvtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="224842921"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Apr 2026 20:52:21 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xUA-0000000002d-31KI;
	Tue, 07 Apr 2026 03:52:18 +0000
Date: Tue, 07 Apr 2026 11:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [abelloni:rtc-next 17/17] drivers/rtc/rtc-cmos.c:776:2:
 error: call to undeclared function 'acpi_clear_event'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202604040743.432amNeb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
head:   a33bf4b6adf70aa8c8a18a231ea7aed3fd1b3875
commit: a33bf4b6adf70aa8c8a18a231ea7aed3fd1b3875 [17/17] rtc: cmos: Remove redundant include of linux/acpi.h
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260404/202604040743.432amNeb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040743.432amNeb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040743.432amNeb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/rtc/rtc-cmos.c:776:2: error: call to undeclared function 'acpi_clear_event'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     776 |         acpi_clear_event(ACPI_EVENT_RTC);
         |         ^
>> drivers/rtc/rtc-cmos.c:776:19: error: use of undeclared identifier 'ACPI_EVENT_RTC'
     776 |         acpi_clear_event(ACPI_EVENT_RTC);
         |                          ^
>> drivers/rtc/rtc-cmos.c:777:2: error: call to undeclared function 'acpi_disable_event'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     777 |         acpi_disable_event(ACPI_EVENT_RTC, 0);
         |         ^
   drivers/rtc/rtc-cmos.c:777:21: error: use of undeclared identifier 'ACPI_EVENT_RTC'
     777 |         acpi_disable_event(ACPI_EVENT_RTC, 0);
         |                            ^
>> drivers/rtc/rtc-cmos.c:778:9: error: use of undeclared identifier 'ACPI_INTERRUPT_HANDLED'
     778 |         return ACPI_INTERRUPT_HANDLED;
         |                ^
>> drivers/rtc/rtc-cmos.c:783:6: error: use of undeclared identifier 'acpi_disabled'; did you mean '__cpu_disable'?
     783 |         if (acpi_disabled)
         |             ^~~~~~~~~~~~~
         |             __cpu_disable
   arch/x86/include/asm/smp.h:71:19: note: '__cpu_disable' declared here
      71 | static inline int __cpu_disable(void)
         |                   ^
>> drivers/rtc/rtc-cmos.c:786:2: error: call to undeclared function 'acpi_install_fixed_event_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     786 |         acpi_install_fixed_event_handler(ACPI_EVENT_RTC, rtc_handler, dev);
         |         ^
   drivers/rtc/rtc-cmos.c:786:35: error: use of undeclared identifier 'ACPI_EVENT_RTC'
     786 |         acpi_install_fixed_event_handler(ACPI_EVENT_RTC, rtc_handler, dev);
         |                                          ^
   drivers/rtc/rtc-cmos.c:791:2: error: call to undeclared function 'acpi_clear_event'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     791 |         acpi_clear_event(ACPI_EVENT_RTC);
         |         ^
   drivers/rtc/rtc-cmos.c:791:19: error: use of undeclared identifier 'ACPI_EVENT_RTC'
     791 |         acpi_clear_event(ACPI_EVENT_RTC);
         |                          ^
   drivers/rtc/rtc-cmos.c:792:2: error: call to undeclared function 'acpi_disable_event'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     792 |         acpi_disable_event(ACPI_EVENT_RTC, 0);
         |         ^
   drivers/rtc/rtc-cmos.c:792:21: error: use of undeclared identifier 'ACPI_EVENT_RTC'
     792 |         acpi_disable_event(ACPI_EVENT_RTC, 0);
         |                            ^
   drivers/rtc/rtc-cmos.c:797:6: error: use of undeclared identifier 'acpi_disabled'; did you mean '__cpu_disable'?
     797 |         if (acpi_disabled)
         |             ^~~~~~~~~~~~~
         |             __cpu_disable
   arch/x86/include/asm/smp.h:71:19: note: '__cpu_disable' declared here
      71 | static inline int __cpu_disable(void)
         |                   ^
>> drivers/rtc/rtc-cmos.c:800:2: error: call to undeclared function 'acpi_remove_fixed_event_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     800 |         acpi_remove_fixed_event_handler(ACPI_EVENT_RTC, rtc_handler);
         |         ^
   drivers/rtc/rtc-cmos.c:800:34: error: use of undeclared identifier 'ACPI_EVENT_RTC'
     800 |         acpi_remove_fixed_event_handler(ACPI_EVENT_RTC, rtc_handler);
         |                                         ^
   drivers/rtc/rtc-cmos.c:805:2: error: call to undeclared function 'acpi_clear_event'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     805 |         acpi_clear_event(ACPI_EVENT_RTC);
         |         ^
   drivers/rtc/rtc-cmos.c:805:19: error: use of undeclared identifier 'ACPI_EVENT_RTC'
     805 |         acpi_clear_event(ACPI_EVENT_RTC);
         |                          ^
>> drivers/rtc/rtc-cmos.c:806:2: error: call to undeclared function 'acpi_enable_event'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     806 |         acpi_enable_event(ACPI_EVENT_RTC, 0);
         |         ^
   drivers/rtc/rtc-cmos.c:806:20: error: use of undeclared identifier 'ACPI_EVENT_RTC'
     806 |         acpi_enable_event(ACPI_EVENT_RTC, 0);
         |                           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/acpi_clear_event +776 drivers/rtc/rtc-cmos.c

dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  744  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  745  static u32 rtc_handler(void *context)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  746  {
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  747  	struct device *dev = context;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  748  	struct cmos_rtc *cmos = dev_get_drvdata(dev);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  749  	unsigned char rtc_control = 0;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  750  	unsigned char rtc_intr;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  751  	unsigned long flags;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  752  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  753  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  754  	/*
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  755  	 * Always update rtc irq when ACPI is used as RTC Alarm.
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  756  	 * Or else, ACPI SCI is enabled during suspend/resume only,
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  757  	 * update rtc irq in that case.
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  758  	 */
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  759  	if (cmos_use_acpi_alarm())
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  760  		cmos_interrupt(0, (void *)cmos->rtc);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  761  	else {
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  762  		/* Fix me: can we use cmos_interrupt() here as well? */
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  763  		spin_lock_irqsave(&rtc_lock, flags);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  764  		if (cmos_rtc.suspend_ctrl)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  765  			rtc_control = CMOS_READ(RTC_CONTROL);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  766  		if (rtc_control & RTC_AIE) {
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  767  			cmos_rtc.suspend_ctrl &= ~RTC_AIE;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  768  			CMOS_WRITE(rtc_control, RTC_CONTROL);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  769  			rtc_intr = CMOS_READ(RTC_INTR_FLAGS);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  770  			rtc_update_irq(cmos->rtc, 1, rtc_intr);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  771  		}
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  772  		spin_unlock_irqrestore(&rtc_lock, flags);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  773  	}
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  774  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  775  	pm_wakeup_hard_event(dev);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @776  	acpi_clear_event(ACPI_EVENT_RTC);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @777  	acpi_disable_event(ACPI_EVENT_RTC, 0);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @778  	return ACPI_INTERRUPT_HANDLED;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  779  }
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  780  
d13e9ad9f5146f Rafael J. Wysocki 2022-11-09  781  static void acpi_rtc_event_setup(struct device *dev)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  782  {
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @783  	if (acpi_disabled)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  784  		return;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  785  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @786  	acpi_install_fixed_event_handler(ACPI_EVENT_RTC, rtc_handler, dev);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  787  	/*
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  788  	 * After the RTC handler is installed, the Fixed_RTC event should
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  789  	 * be disabled. Only when the RTC alarm is set will it be enabled.
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  790  	 */
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  791  	acpi_clear_event(ACPI_EVENT_RTC);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  792  	acpi_disable_event(ACPI_EVENT_RTC, 0);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  793  }
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  794  
83ebb7b3036d15 Rafael J. Wysocki 2022-11-09  795  static void acpi_rtc_event_cleanup(void)
83ebb7b3036d15 Rafael J. Wysocki 2022-11-09  796  {
83ebb7b3036d15 Rafael J. Wysocki 2022-11-09  797  	if (acpi_disabled)
83ebb7b3036d15 Rafael J. Wysocki 2022-11-09  798  		return;
83ebb7b3036d15 Rafael J. Wysocki 2022-11-09  799  
83ebb7b3036d15 Rafael J. Wysocki 2022-11-09 @800  	acpi_remove_fixed_event_handler(ACPI_EVENT_RTC, rtc_handler);
83ebb7b3036d15 Rafael J. Wysocki 2022-11-09  801  }
83ebb7b3036d15 Rafael J. Wysocki 2022-11-09  802  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  803  static void rtc_wake_on(struct device *dev)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  804  {
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  805  	acpi_clear_event(ACPI_EVENT_RTC);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @806  	acpi_enable_event(ACPI_EVENT_RTC, 0);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  807  }
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  808  

:::::: The code at line 776 was first introduced by commit
:::::: dca4d3b71c8a09a16951add656711fbd6f5bfbb0 rtc: cmos: Eliminate forward declarations of some functions

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
