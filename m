Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA208381AF9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 06:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602322; cv=none; b=kZM2Ihc4kWlBAVh/fOSvoDyFLCr/NUYIPQbDVtQgU298li2mPYfYaaR9QnrFWmPNaP1b186d6JWOeAB3OjGfFGagjcpuiZarYNYe5IVIMDxsii97KxMjzK6SZkFEUW3hOptjAnF7NKCWrcz0ezv4j/ZZcwERWLkTjCmvuhm7ch4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602322; c=relaxed/simple;
	bh=WBhtlCeEkNW1EUMfgESNlUYUkTyB5b+79eUEwLBUpto=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CiQW/EYWRv1YnGLo0VvQzllP/HK6EmBKBFTzZ0h7FIe6UkEp8HdA+3etN8mWgLZrADigHqrxwT8Nq1Ef+BenQgqJnGP5GpeOXEzpM5D27JieFndvFtBSWpmFuno/lcSZj5CbxV3x1DQ1HFhmMRCNn0cNbXhyZIuOULposbNiC5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DW2omz8y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DW2omz8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786602320; x=1818138320;
  h=date:from:to:cc:subject:message-id;
  bh=WBhtlCeEkNW1EUMfgESNlUYUkTyB5b+79eUEwLBUpto=;
  b=DW2omz8yjdTNy2UsxsgyLhEf6hnA8IsDdVCxLQDf2kioghTtpGqJNi5Z
   mU2oq5qeZQqSFO/PFgR/YUuQbgEq8QP/NS6CM3MuONeZdar8yA3h32M9r
   wdzZLEMzZZ67yO4Dfa7RqDdfvxfkLsNMUn4OdqBLCo+zPPHQx1Xakonm0
   eAaiR0Ncfv4akug/g2r92/8o506C9XFfKfzXuzhRGrq6umYyr5z2b30wM
   Kf3Ow0JI+lToLrli2gkWgBj7gjbJRurtuRXtkslcLpsCaz48qmBzIW0Li
   9vyIrYvwrPHyImhI8pajqMEy1DsgpigdyCm3MYTnEIlPd+dympSz+Z7Wb
   A==;
X-CSE-ConnectionGUID: znyl25qNSiK5j9LeZMaT6g==
X-CSE-MsgGUID: TI6tpBj0TSicm6IXPyaAww==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98320867"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="98320867"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 23:25:20 -0700
X-CSE-ConnectionGUID: Cen8YWQTRVWlBV0+J3wJlQ==
X-CSE-MsgGUID: Gu8ShnLnQTyOO6VVxukf9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="265836565"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Aug 2026 23:25:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuOsO-00000000T4U-0vhY;
	Thu, 13 Aug 2026 06:25:16 +0000
Date: Thu, 13 Aug 2026 14:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/platform/x86/acer-wmi.c:2036:17: error: too few arguments to function
 'platform_profile_notify'
Message-ID: <202608131456.gA9z1uSU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: 58b78ed61cea4cf0ab4d8e1b07b208d6513e4077 [1/1] BACKPORT: UPSTREAM: ACPI: platform_profile: Pass the profile handler into platform_profile_notify()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608131456.gA9z1uSU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131456.gA9z1uSU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131456.gA9z1uSU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/acer-wmi.c: In function 'acer_thermal_profile_change':
>> drivers/platform/x86/acer-wmi.c:2036:17: error: too few arguments to function 'platform_profile_notify'
    2036 |                 platform_profile_notify();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/acer-wmi.c:22:
   include/linux/platform_profile.h:42:6: note: declared here
      42 | void platform_profile_notify(struct platform_profile_handler *pprof);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c: In function 'acer_platform_probe':
   drivers/platform/x86/acer-wmi.c:2598:17: error: too few arguments to function 'platform_profile_remove'
    2598 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c: In function 'acer_platform_remove':
   drivers/platform/x86/acer-wmi.c:2621:17: error: too few arguments to function 'platform_profile_remove'
    2621 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/asus-wmi.c: In function 'throttle_thermal_policy_switch_next':
>> drivers/platform/x86/asus-wmi.c:3769:9: error: too few arguments to function 'platform_profile_notify'
    3769 |         platform_profile_notify();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/asus-wmi.c:34:
   include/linux/platform_profile.h:42:6: note: declared here
      42 | void platform_profile_notify(struct platform_profile_handler *pprof);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c: In function 'throttle_thermal_policy_store':
   drivers/platform/x86/asus-wmi.c:3808:9: error: too few arguments to function 'platform_profile_notify'
    3808 |         platform_profile_notify();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:42:6: note: declared here
      42 | void platform_profile_notify(struct platform_profile_handler *pprof);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c: In function 'asus_wmi_add':
   drivers/platform/x86/asus-wmi.c:4871:17: error: too few arguments to function 'platform_profile_remove'
    4871 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c: In function 'asus_wmi_remove':
   drivers/platform/x86/asus-wmi.c:4898:17: error: too few arguments to function 'platform_profile_remove'
    4898 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/ideapad-laptop.c: In function 'dytc_profile_refresh':
>> drivers/platform/x86/ideapad-laptop.c:1059:17: error: too few arguments to function 'platform_profile_notify'
    1059 |                 platform_profile_notify();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/ideapad-laptop.c:30:
   include/linux/platform_profile.h:42:6: note: declared here
      42 | void platform_profile_notify(struct platform_profile_handler *pprof);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/ideapad-laptop.c: In function 'ideapad_dytc_profile_exit':
   drivers/platform/x86/ideapad-laptop.c:1152:9: error: too few arguments to function 'platform_profile_remove'
    1152 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/thinkpad_acpi.c: In function 'dytc_profile_refresh':
>> drivers/platform/x86/thinkpad_acpi.c:10603:17: error: too few arguments to function 'platform_profile_notify'
   10603 |                 platform_profile_notify();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/thinkpad_acpi.c:60:
   include/linux/platform_profile.h:42:6: note: declared here
      42 | void platform_profile_notify(struct platform_profile_handler *pprof);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c: In function 'dytc_profile_exit':
   drivers/platform/x86/thinkpad_acpi.c:10701:9: error: too few arguments to function 'platform_profile_remove'
   10701 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/platform_profile_notify +2036 drivers/platform/x86/acer-wmi.c

6bb5153dfbaf88f SungHwan Jung 2023-11-24  1956  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1957  static int acer_thermal_profile_change(void)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1958  {
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1959  	/*
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1960  	 * This mode key can rotate each mode or toggle turbo mode.
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1961  	 * On battery, only ECO and BALANCED mode are available.
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1962  	 */
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1963  	if (quirks->predator_v4) {
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1964  		u8 current_tp;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1965  		int tp, err;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1966  		u64 on_AC;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1967  		acpi_status status;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1968  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1969  		err = ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET,
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1970  			      &current_tp);
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1971  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1972  		if (err < 0)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1973  			return err;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1974  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1975  		/* Check power source */
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1976  		status = WMI_gaming_execute_u64(
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1977  			ACER_WMID_GET_GAMING_SYS_INFO_METHODID,
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1978  			ACER_WMID_CMD_GET_PREDATOR_V4_BAT_STATUS, &on_AC);
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1979  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1980  		if (ACPI_FAILURE(status))
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1981  			return -EIO;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1982  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1983  		switch (current_tp) {
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1984  		case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1985  			if (!on_AC)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1986  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1987  			else if (cycle_gaming_thermal_profile)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1988  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1989  			else
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1990  				tp = last_non_turbo_profile;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1991  			break;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1992  		case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1993  			if (!on_AC)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1994  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1995  			else
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1996  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1997  			break;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1998  		case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1999  			if (!on_AC)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2000  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2001  			else if (cycle_gaming_thermal_profile)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2002  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2003  			else
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2004  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2005  			break;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2006  		case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2007  			if (!on_AC)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2008  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2009  			else if (cycle_gaming_thermal_profile)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2010  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2011  			else
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2012  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2013  			break;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2014  		case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2015  			if (!on_AC)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2016  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2017  			else if (cycle_gaming_thermal_profile)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2018  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2019  			else
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2020  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2021  			break;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2022  		default:
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2023  			return -EOPNOTSUPP;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2024  		}
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2025  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2026  		status = WMI_gaming_execute_u64(
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2027  			ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2028  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2029  		if (ACPI_FAILURE(status))
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2030  			return -EIO;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2031  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2032  		/* Store non-turbo profile for turbo mode toggle*/
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2033  		if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2034  			last_non_turbo_profile = tp;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2035  
6bb5153dfbaf88f SungHwan Jung 2023-11-24 @2036  		platform_profile_notify();
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2037  	}
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2038  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2039  	return 0;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2040  }
6bb5153dfbaf88f SungHwan Jung 2023-11-24  2041  

:::::: The code at line 2036 was first introduced by commit
:::::: 6bb5153dfbaf88fa4b40ef50b706d2fb186ed92e platform/x86: acer-wmi: Add platform profile and mode key support for Predator PHN16-71

:::::: TO: SungHwan Jung <onenowy@gmail.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
