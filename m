Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C860434406
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140940; cv=none; b=mMOKSHrSIgwRi82suw07sTmgxHSMKCOpTMSc96qShyYD4ADzKILF1Jw5oW7VFPpoqaqDAzveOTO+huNBd51hx205q/sNed66dmnXq9aThLhZ+hWROS+mf3qWak2n9lUhmdl0727jglyU7dsghearHhZXnfMBWIkNqBmjtoDJIDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140940; c=relaxed/simple;
	bh=Ic15fTy87SB8mOVJQrnIcQrAe2O8Sha4f+9qQ84qJW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f9+saSll3lkW+JN/mMCFL6e2I2VdGZBZFTc88UEq4S1BOy8yjaURpXrmi22vL1ZohP57j94rZ7MWqd087u2fp7yoQR/b4uopLW1Kcq8cFFRWIgi88FlhCIqebEToumHXABk2LTN2aXl7LEp7zTW5ihbS4z/FMfeFgKioHM7PJEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nO6TA2zy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nO6TA2zy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792140936; x=1823676936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ic15fTy87SB8mOVJQrnIcQrAe2O8Sha4f+9qQ84qJW0=;
  b=nO6TA2zyKtlOp2fHGU7koPBUqmFmtMudJE/JlvXcYvfIo4atBzZRrkse
   rnQDLyxOU/sCfiDLpDmFpK09BS4njAOa+3QLxSzaM7IcIPBHrKdRcOFdO
   nToqt1swzAnDIbeXuKSrwp7ubGpd69XTEMmkQ2yxzEpK9DgjtsIPPyqHN
   WwDrl761yZGQi3VIuIk6i3yhs3bjvY6dvO+p6UeZ3FxE9oGtb1S34wtzC
   PTaNNy1RlxD+YQNhTVKpkVVi5Kh7DaEfBbYwi+zaJdlNWTcyAW6xjD6IH
   BMjsG8a7OTdiY/TxwHysU8Fik6gfM+8W6XWr6aSVRY2vSBHUPlaExe8+e
   Q==;
X-CSE-ConnectionGUID: n+xD+cBjSi2IhBK7r5lx1Q==
X-CSE-MsgGUID: XP/MDJWMTe2bx1lwFbE9Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="803395"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="803395"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 01:55:35 -0700
X-CSE-ConnectionGUID: dxIiWHfbQjSfwNWorqswqg==
X-CSE-MsgGUID: R+3UBQYgT8qtgzD+MwEQnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1910239"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Oct 2026 01:55:34 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHdiu-00000000C9H-2GO5;
	Fri, 16 Oct 2026 08:55:32 +0000
Date: Fri, 16 Oct 2026 10:55:07 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-alarm-clocks 3/5]
 kernel/time/alarmtimer.c:105:undefined reference to
 `vdso_time_enable_alarmclock'
Message-ID: <202610161018.bTkFTUke-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-alarm-clocks
head:   c8bb37f3267c7cbf3aed873255994d37a43122c9
commit: 16c670855b6263e33441b6502dd778778a33ae69 [3/5] vdso: Add alarmclock support infrastructure
config: csky-randconfig-r2200-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161018.bTkFTUke-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161018.bTkFTUke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161018.bTkFTUke-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: kernel/time/alarmtimer.o: in function `alarmtimer_rtc_add_device':
>> kernel/time/alarmtimer.c:105:(.text+0x8f0): undefined reference to `vdso_time_enable_alarmclock'
   csky-linux-ld: kernel/time/alarmtimer.o: in function `__srcu_read_lock':
>> include/linux/srcutiny.h:90:(.text+0x9a8): undefined reference to `vdso_time_enable_alarmclock'


vim +105 kernel/time/alarmtimer.c

    82	
    83	static int alarmtimer_rtc_add_device(struct device *dev)
    84	{
    85		struct rtc_device *rtc = to_rtc_device(dev);
    86		struct platform_device *pdev;
    87		int ret = 0;
    88	
    89		if (rtcdev)
    90			return -EBUSY;
    91	
    92		if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
    93			return -1;
    94		if (!device_may_wakeup(rtc->dev.parent))
    95			return -1;
    96	
    97		pdev = platform_device_register_data(dev, "alarmtimer",
    98						     PLATFORM_DEVID_AUTO, NULL, 0);
    99		if (!IS_ERR(pdev))
   100			device_init_wakeup(&pdev->dev, true);
   101	
   102		scoped_guard(spinlock_irqsave, &rtcdev_lock) {
   103			if (!IS_ERR(pdev) && !rtcdev && try_module_get(rtc->owner)) {
   104				rtcdev = rtc;
 > 105				vdso_time_enable_alarmclock();
   106				/* hold a reference so it doesn't go away */
   107				get_device(dev);
   108				pdev = NULL;
   109			} else {
   110				ret = -1;
   111			}
   112		}
   113	
   114		platform_device_unregister(pdev);
   115		return ret;
   116	}
   117	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
