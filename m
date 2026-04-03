Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046AA239E7E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 21:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775250285; cv=none; b=pdIyiQrCEwXK8Z88FL1hWMH+kM1DQTXTrZfTgfGETj+iLjoRBEAgpgYrKrWbLuaYXtGNpnwqsTIL1m71xmRObqpEKTKWTvxv6IksrCFKRA+u9a1S0Pa3ILMQfsjgr7FRTj1sYo8f5l8fQrhIypWCATfTy1UK6DX/S0FoTZeL/nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775250285; c=relaxed/simple;
	bh=L78tY9wnYouRru+0iR5HrANF2G+fU1lRE2UwRM+mKww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZDW69d5F0tGeTZGaODgT8MxGeAHn2x/FVg1ziE8lQBfxLF3oBGiBQaGQRofL2RwKjt3PXuaRsJGLfnyzmkzuH3Yf/ljcrJDwmo9FzD4abri8OD6u8DL87+J/BgCyZHkyoB4PizknyJ2BVLDK2yMghrJ38gu4VnXA+/HDy1bJCv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=le6+PUEF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="le6+PUEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775250284; x=1806786284;
  h=date:from:to:cc:subject:message-id;
  bh=L78tY9wnYouRru+0iR5HrANF2G+fU1lRE2UwRM+mKww=;
  b=le6+PUEFehrWVaTmWDOd8HIHe2G4aCB0NoNwZESCGC82kJdVYVMpa12w
   wyP4b/zqafkd0JtzRqH4kW2VnxYMe9VIdzOmHijZOYNofwpDsZMj74lHQ
   oxom1kRyZgiQbZkMwhtDDsqHySeKLQZhktnBugzvXg/2AGSR3hyhBnb5I
   QvpuR8cxq8MNyRlBfcR6w8htOjxGkoXzJwEc+A5erR3d+/J3e7I9Gl76a
   oCTC8FMdl2AHUHtrRH4/9zLrVgs1OuZqoX+lipUqinRUwMh5o5636ea0/
   OJRP6Pk0Cdq+tNTXBMGNJMxgAkKwRmrE82gydISugzmkAjGWXkwMzwa9U
   g==;
X-CSE-ConnectionGUID: AlHZc5vDQKuxqeMkvZvupA==
X-CSE-MsgGUID: sEtgpBohRKWWqJjiA9kCUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="98930677"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="98930677"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 14:04:43 -0700
X-CSE-ConnectionGUID: xHESUZmIRg2mYtAMNljNBA==
X-CSE-MsgGUID: DG2hHKLrRnek9k2CrKV5Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="232145360"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 03 Apr 2026 14:04:41 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8lh1-000000009Or-1JST;
	Fri, 03 Apr 2026 21:04:39 +0000
Date: Fri, 03 Apr 2026 23:04:30 +0200
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [abelloni:rtc-next 17/17] drivers/rtc/rtc-cmos.c:776:9:
 error: implicit declaration of function 'acpi_clear_event'
Message-ID: <202604032226.TPEKkUt6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
head:   a33bf4b6adf70aa8c8a18a231ea7aed3fd1b3875
commit: a33bf4b6adf70aa8c8a18a231ea7aed3fd1b3875 [17/17] rtc: cmos: Remove redundant include of linux/acpi.h
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260403/202604032226.TPEKkUt6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604032226.TPEKkUt6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604032226.TPEKkUt6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-cmos.c: In function 'rtc_handler':
>> drivers/rtc/rtc-cmos.c:776:9: error: implicit declaration of function 'acpi_clear_event' [-Wimplicit-function-declaration]
     776 |         acpi_clear_event(ACPI_EVENT_RTC);
         |         ^~~~~~~~~~~~~~~~
>> drivers/rtc/rtc-cmos.c:776:26: error: 'ACPI_EVENT_RTC' undeclared (first use in this function)
     776 |         acpi_clear_event(ACPI_EVENT_RTC);
         |                          ^~~~~~~~~~~~~~
   drivers/rtc/rtc-cmos.c:776:26: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/rtc/rtc-cmos.c:777:9: error: implicit declaration of function 'acpi_disable_event' [-Wimplicit-function-declaration]
     777 |         acpi_disable_event(ACPI_EVENT_RTC, 0);
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/rtc/rtc-cmos.c:778:16: error: 'ACPI_INTERRUPT_HANDLED' undeclared (first use in this function)
     778 |         return ACPI_INTERRUPT_HANDLED;
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-cmos.c: In function 'acpi_rtc_event_setup':
>> drivers/rtc/rtc-cmos.c:783:13: error: 'acpi_disabled' undeclared (first use in this function); did you mean 'irqs_disabled'?
     783 |         if (acpi_disabled)
         |             ^~~~~~~~~~~~~
         |             irqs_disabled
>> drivers/rtc/rtc-cmos.c:786:9: error: implicit declaration of function 'acpi_install_fixed_event_handler' [-Wimplicit-function-declaration]
     786 |         acpi_install_fixed_event_handler(ACPI_EVENT_RTC, rtc_handler, dev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-cmos.c:786:42: error: 'ACPI_EVENT_RTC' undeclared (first use in this function)
     786 |         acpi_install_fixed_event_handler(ACPI_EVENT_RTC, rtc_handler, dev);
         |                                          ^~~~~~~~~~~~~~
   drivers/rtc/rtc-cmos.c: In function 'acpi_rtc_event_cleanup':
   drivers/rtc/rtc-cmos.c:797:13: error: 'acpi_disabled' undeclared (first use in this function); did you mean 'irqs_disabled'?
     797 |         if (acpi_disabled)
         |             ^~~~~~~~~~~~~
         |             irqs_disabled
>> drivers/rtc/rtc-cmos.c:800:9: error: implicit declaration of function 'acpi_remove_fixed_event_handler' [-Wimplicit-function-declaration]
     800 |         acpi_remove_fixed_event_handler(ACPI_EVENT_RTC, rtc_handler);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-cmos.c:800:41: error: 'ACPI_EVENT_RTC' undeclared (first use in this function)
     800 |         acpi_remove_fixed_event_handler(ACPI_EVENT_RTC, rtc_handler);
         |                                         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-cmos.c: In function 'rtc_wake_on':
   drivers/rtc/rtc-cmos.c:805:26: error: 'ACPI_EVENT_RTC' undeclared (first use in this function)
     805 |         acpi_clear_event(ACPI_EVENT_RTC);
         |                          ^~~~~~~~~~~~~~
>> drivers/rtc/rtc-cmos.c:806:9: error: implicit declaration of function 'acpi_enable_event' [-Wimplicit-function-declaration]
     806 |         acpi_enable_event(ACPI_EVENT_RTC, 0);
         |         ^~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-cmos.c: In function 'rtc_wake_off':
   drivers/rtc/rtc-cmos.c:811:28: error: 'ACPI_EVENT_RTC' undeclared (first use in this function)
     811 |         acpi_disable_event(ACPI_EVENT_RTC, 0);
         |                            ^~~~~~~~~~~~~~
   drivers/rtc/rtc-cmos.c: In function 'acpi_cmos_wake_setup':
   drivers/rtc/rtc-cmos.c:841:13: error: 'acpi_disabled' undeclared (first use in this function); did you mean 'irqs_disabled'?
     841 |         if (acpi_disabled)
         |             ^~~~~~~~~~~~~
         |             irqs_disabled
>> drivers/rtc/rtc-cmos.c:850:13: error: 'acpi_gbl_FADT' undeclared (first use in this function)
     850 |         if (acpi_gbl_FADT.month_alarm && !acpi_gbl_FADT.day_alarm) {
         |             ^~~~~~~~~~~~~
>> drivers/rtc/rtc-cmos.c:860:35: error: 'ACPI_FADT_S4_RTC_WAKE' undeclared (first use in this function)
     860 |         if (acpi_gbl_FADT.flags & ACPI_FADT_S4_RTC_WAKE)
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-cmos.c: In function 'cmos_check_acpi_rtc_status':
>> drivers/rtc/rtc-cmos.c:871:9: error: unknown type name 'acpi_event_status'
     871 |         acpi_event_status rtc_status;
         |         ^~~~~~~~~~~~~~~~~
>> drivers/rtc/rtc-cmos.c:872:9: error: unknown type name 'acpi_status'; did you mean 'si_status'?
     872 |         acpi_status status;
         |         ^~~~~~~~~~~
         |         si_status
   drivers/rtc/rtc-cmos.c:874:13: error: 'acpi_gbl_FADT' undeclared (first use in this function)
     874 |         if (acpi_gbl_FADT.flags & ACPI_FADT_FIXED_RTC)
         |             ^~~~~~~~~~~~~
>> drivers/rtc/rtc-cmos.c:874:35: error: 'ACPI_FADT_FIXED_RTC' undeclared (first use in this function)
     874 |         if (acpi_gbl_FADT.flags & ACPI_FADT_FIXED_RTC)
         |                                   ^~~~~~~~~~~~~~~~~~~
>> drivers/rtc/rtc-cmos.c:877:18: error: implicit declaration of function 'acpi_get_event_status'; did you mean 'acpi_rtc_event_setup'? [-Wimplicit-function-declaration]
     877 |         status = acpi_get_event_status(ACPI_EVENT_RTC, &rtc_status);
         |                  ^~~~~~~~~~~~~~~~~~~~~
         |                  acpi_rtc_event_setup
   drivers/rtc/rtc-cmos.c:877:40: error: 'ACPI_EVENT_RTC' undeclared (first use in this function)
     877 |         status = acpi_get_event_status(ACPI_EVENT_RTC, &rtc_status);
         |                                        ^~~~~~~~~~~~~~
>> drivers/rtc/rtc-cmos.c:878:13: error: implicit declaration of function 'ACPI_FAILURE' [-Wimplicit-function-declaration]
     878 |         if (ACPI_FAILURE(status)) {
         |             ^~~~~~~~~~~~
>> drivers/rtc/rtc-cmos.c:880:33: error: 'ACPI_EVENT_FLAG_SET' undeclared (first use in this function)
     880 |         } else if (rtc_status & ACPI_EVENT_FLAG_SET) {
         |                                 ^~~~~~~~~~~~~~~~~~~


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
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  809  static void rtc_wake_off(struct device *dev)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  810  {
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  811  	acpi_disable_event(ACPI_EVENT_RTC, 0);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  812  }
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  813  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  814  #ifdef CONFIG_X86
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  815  static void use_acpi_alarm_quirks(void)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  816  {
3d762e21d56370 Mario Limonciello 2023-11-06  817  	switch (boot_cpu_data.x86_vendor) {
3d762e21d56370 Mario Limonciello 2023-11-06  818  	case X86_VENDOR_INTEL:
3d762e21d56370 Mario Limonciello 2023-11-06  819  		if (dmi_get_bios_year() < 2015)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  820  			return;
3d762e21d56370 Mario Limonciello 2023-11-06  821  		break;
3d762e21d56370 Mario Limonciello 2023-11-06  822  	case X86_VENDOR_AMD:
3d762e21d56370 Mario Limonciello 2023-11-06  823  	case X86_VENDOR_HYGON:
3d762e21d56370 Mario Limonciello 2023-11-06  824  		if (dmi_get_bios_year() < 2021)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  825  			return;
3d762e21d56370 Mario Limonciello 2023-11-06  826  		break;
3d762e21d56370 Mario Limonciello 2023-11-06  827  	default:
3d762e21d56370 Mario Limonciello 2023-11-06  828  		return;
3d762e21d56370 Mario Limonciello 2023-11-06  829  	}
3d762e21d56370 Mario Limonciello 2023-11-06  830  	if (!is_hpet_enabled())
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  831  		return;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  832  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  833  	use_acpi_alarm = true;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  834  }
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  835  #else
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  836  static inline void use_acpi_alarm_quirks(void) { }
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  837  #endif
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  838  
d13e9ad9f5146f Rafael J. Wysocki 2022-11-09  839  static void acpi_cmos_wake_setup(struct device *dev)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  840  {
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  841  	if (acpi_disabled)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  842  		return;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  843  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  844  	use_acpi_alarm_quirks();
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  845  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  846  	cmos_rtc.wake_on = rtc_wake_on;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  847  	cmos_rtc.wake_off = rtc_wake_off;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  848  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  849  	/* ACPI tables bug workaround. */
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @850  	if (acpi_gbl_FADT.month_alarm && !acpi_gbl_FADT.day_alarm) {
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  851  		dev_dbg(dev, "bogus FADT month_alarm (%d)\n",
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  852  			acpi_gbl_FADT.month_alarm);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  853  		acpi_gbl_FADT.month_alarm = 0;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  854  	}
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  855  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  856  	cmos_rtc.day_alrm = acpi_gbl_FADT.day_alarm;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  857  	cmos_rtc.mon_alrm = acpi_gbl_FADT.month_alarm;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  858  	cmos_rtc.century = acpi_gbl_FADT.century;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  859  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @860  	if (acpi_gbl_FADT.flags & ACPI_FADT_S4_RTC_WAKE)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  861  		dev_info(dev, "RTC can wake from S4\n");
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  862  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  863  	/* RTC always wakes from S1/S2/S3, and often S4/STD */
8c28c4993f117e Wolfram Sang      2024-12-17  864  	device_init_wakeup(dev, true);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  865  }
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  866  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  867  static void cmos_check_acpi_rtc_status(struct device *dev,
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  868  					      unsigned char *rtc_control)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  869  {
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  870  	struct cmos_rtc *cmos = dev_get_drvdata(dev);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @871  	acpi_event_status rtc_status;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @872  	acpi_status status;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  873  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @874  	if (acpi_gbl_FADT.flags & ACPI_FADT_FIXED_RTC)
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  875  		return;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  876  
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @877  	status = acpi_get_event_status(ACPI_EVENT_RTC, &rtc_status);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @878  	if (ACPI_FAILURE(status)) {
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  879  		dev_err(dev, "Could not get RTC status\n");
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09 @880  	} else if (rtc_status & ACPI_EVENT_FLAG_SET) {
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  881  		unsigned char mask;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  882  		*rtc_control &= ~RTC_AIE;
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  883  		CMOS_WRITE(*rtc_control, RTC_CONTROL);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  884  		mask = CMOS_READ(RTC_INTR_FLAGS);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  885  		rtc_update_irq(cmos->rtc, 1, mask);
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  886  	}
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  887  }
dca4d3b71c8a09 Rafael J. Wysocki 2022-11-09  888  

:::::: The code at line 776 was first introduced by commit
:::::: dca4d3b71c8a09a16951add656711fbd6f5bfbb0 rtc: cmos: Eliminate forward declarations of some functions

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
