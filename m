Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70112FB0AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763806864; cv=none; b=HCi5sDYA+wZvACozZEeLh0kG1oS3ql9egAaNIWfaQ1hY/WsRkrzPVcJ8aqMQiwcLhyJyyL07/29Mjy8C5jUow4g4cbLV9Cah/lKNFbjVvqF5X6c+FvosiiCo49+nfua0vZvDO8823fq6siDX0jmJKAotPt44SIkTWHO7NaM1oZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763806864; c=relaxed/simple;
	bh=Rq2xlKwPLDYSh9T0DDcTM/l+71AVav92MjMYclxg7k0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bygh3jWnb+mINGdkL+20/M3zb26ewL241DBgUkpKYR2Soj9XScTNOlfrV8MbURY3kdNaRbVxNWtd3RpRb4q8571zvuBkiKuYiDX3Mor9dvxtNiwrT0gNqoErdE+x3cIv+dce11fooZMDfr/iKj3omrasmXqL4sNJa/lw9RsIZV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7Mykmps; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7Mykmps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763806861; x=1795342861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rq2xlKwPLDYSh9T0DDcTM/l+71AVav92MjMYclxg7k0=;
  b=i7MykmpsNoe00Gij0clPV8uQzyKU7/I7HD/Ht8v6ra0ce43r+ue506xm
   2oPk7Wlqynw9Q5Nr/Bo3oudqabBPYc4H8bkdXcvFWEYvHLR7wb+aDyx2k
   UkWK9JvTK7CI2LlHs/zApURajv/US3Zzv4HpH0BTV6YiEPIhqOkoD7Pcx
   +LjolrwlGXrclzwD/wbiL8MDVr084HWN3jPIkzorWzthjo4ALkppoAVfn
   UW/2phlTOTIlVyKvJUWz+nAL4SE80r/fBupZ2b8ehPSHh6qciwV6FNl88
   /uS/Q5NDZ+VatMJS4XexjyAccusPHnRYKzqcj35arZZb6mZ8jivdSGjgq
   A==;
X-CSE-ConnectionGUID: 4Nvb8GyyS96Nwt3uJ9VUNw==
X-CSE-MsgGUID: BSza+186Q7CoqQjucglMBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="77247343"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="77247343"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:21:00 -0800
X-CSE-ConnectionGUID: +JjkKPm9SPilnvVPjafFAg==
X-CSE-MsgGUID: I5IYzeU8Rn+xrDzpy8jIWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192680689"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2025 02:20:59 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMkjg-0007PD-2y;
	Sat, 22 Nov 2025 10:20:56 +0000
Date: Sat, 22 Nov 2025 18:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1]
 drivers/platform/x86/acer-wmi.c:2036:17: error: too few arguments to
 function 'platform_profile_notify'
Message-ID: <202511221852.MjqRT90n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   40435e5332925bf7429f8e4c796040981fcc4968
commit: 58b78ed61cea4cf0ab4d8e1b07b208d6513e4077 [0/1] BACKPORT: UPSTREAM: ACPI: platform_profile: Pass the profile handler into platform_profile_notify()
config: x86_64-buildonly-randconfig-005-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221852.MjqRT90n-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221852.MjqRT90n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221852.MjqRT90n-lkp@intel.com/

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


vim +/platform_profile_notify +2036 drivers/platform/x86/acer-wmi.c

6bb5153dfbaf88 SungHwan Jung 2023-11-24  1956  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1957  static int acer_thermal_profile_change(void)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1958  {
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1959  	/*
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1960  	 * This mode key can rotate each mode or toggle turbo mode.
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1961  	 * On battery, only ECO and BALANCED mode are available.
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1962  	 */
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1963  	if (quirks->predator_v4) {
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1964  		u8 current_tp;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1965  		int tp, err;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1966  		u64 on_AC;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1967  		acpi_status status;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1968  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1969  		err = ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET,
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1970  			      &current_tp);
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1971  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1972  		if (err < 0)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1973  			return err;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1974  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1975  		/* Check power source */
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1976  		status = WMI_gaming_execute_u64(
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1977  			ACER_WMID_GET_GAMING_SYS_INFO_METHODID,
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1978  			ACER_WMID_CMD_GET_PREDATOR_V4_BAT_STATUS, &on_AC);
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1979  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1980  		if (ACPI_FAILURE(status))
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1981  			return -EIO;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1982  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1983  		switch (current_tp) {
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1984  		case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1985  			if (!on_AC)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1986  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1987  			else if (cycle_gaming_thermal_profile)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1988  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1989  			else
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1990  				tp = last_non_turbo_profile;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1991  			break;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1992  		case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1993  			if (!on_AC)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1994  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1995  			else
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1996  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1997  			break;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1998  		case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
6bb5153dfbaf88 SungHwan Jung 2023-11-24  1999  			if (!on_AC)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2000  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2001  			else if (cycle_gaming_thermal_profile)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2002  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2003  			else
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2004  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2005  			break;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2006  		case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2007  			if (!on_AC)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2008  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2009  			else if (cycle_gaming_thermal_profile)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2010  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2011  			else
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2012  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2013  			break;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2014  		case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2015  			if (!on_AC)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2016  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2017  			else if (cycle_gaming_thermal_profile)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2018  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2019  			else
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2020  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2021  			break;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2022  		default:
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2023  			return -EOPNOTSUPP;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2024  		}
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2025  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2026  		status = WMI_gaming_execute_u64(
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2027  			ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2028  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2029  		if (ACPI_FAILURE(status))
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2030  			return -EIO;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2031  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2032  		/* Store non-turbo profile for turbo mode toggle*/
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2033  		if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2034  			last_non_turbo_profile = tp;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2035  
6bb5153dfbaf88 SungHwan Jung 2023-11-24 @2036  		platform_profile_notify();
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2037  	}
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2038  
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2039  	return 0;
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2040  }
6bb5153dfbaf88 SungHwan Jung 2023-11-24  2041  

:::::: The code at line 2036 was first introduced by commit
:::::: 6bb5153dfbaf88fa4b40ef50b706d2fb186ed92e platform/x86: acer-wmi: Add platform profile and mode key support for Predator PHN16-71

:::::: TO: SungHwan Jung <onenowy@gmail.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
